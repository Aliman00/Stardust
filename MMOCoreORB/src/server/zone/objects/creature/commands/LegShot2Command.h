/*
				Copyright <SWGEmu>
		See file COPYING for copying conditions.*/

#ifndef LEGSHOT2COMMAND_H_
#define LEGSHOT2COMMAND_H_

#include "CombatQueueCommand.h"

class LegShot2Command : public CombatQueueCommand {
public:

	LegShot2Command(const String& name, ZoneProcessServer* server)
		: CombatQueueCommand(name, server) {
	}

	int doQueueCommand(CreatureObject* creature, const uint64& target, const UnicodeString& arguments) const {

		if (!checkStateMask(creature))
			return INVALIDSTATE;

		if (!checkInvalidLocomotions(creature))
			return INVALIDLOCOMOTION;

		Reference<SceneObject*> object = server->getZoneServer()->getObject(target);
										ManagedReference<CreatureObject*> creatureTarget = cast<CreatureObject*>( object.get());

										if (creatureTarget == NULL)
											return GENERALERROR;

										//Supposed to send a message if you target nothing #not working
										if (!creatureTarget == creature) {
											creature->sendSystemMessage("Invalid Target");
											return 0;
										}

										//Check range
										if (creature->getDistanceTo(object) > 50.f){
											creature->sendSystemMessage("You are out of range.");
											return GENERALERROR;
										}

										int duration = 10; //duration of snare on target
										int duration2 = 15; //duration of cd on caster
										int duration3 = 20; //duration of immunity on target
										uint32 buffcrc = BuffCRC::FORCE_RANK_SUFFERING;
										uint32 buffcrc2 = BuffCRC::FORCE_RANK_SERENITY;
										uint32 buffcrc3 = BuffCRC::FORCE_RANK_SERENITY;
										ManagedReference<Buff*> buff2 = new Buff(creature, buffcrc2, duration2, BuffType::JEDI);
										ManagedReference<Buff*> buff3 = new Buff(creatureTarget, buffcrc3, duration3, BuffType::JEDI);
										ManagedReference<Buff*> buff = new Buff(creatureTarget, buffcrc, duration, BuffType::JEDI);

										//target is currently snared/rooted
										if (creatureTarget->hasBuff(buffcrc)) {
											creature->sendSystemMessage("You can not snare a target that is already snared!");
											return doCombatAction(creature, target);
										}

										//caster on cd
										if(creature->hasBuff(buffcrc2)) {
											creature->sendSystemMessage("You cannot snare the target at this time.");
											return doCombatAction(creature, target);
										}

										//target on cd
										if (creatureTarget->hasBuff(buffcrc3)) {
											creature->sendSystemMessage("You are unable snare this target due to temporary immunity.");
											return doCombatAction(creature, target);
										}

										//last checks, if true... cast.
										if (object->isCreatureObject() && creatureTarget->isAttackableBy(creature) && !creatureTarget->hasBuff(buffcrc)) {
											//Remove movement boosts
											if (creatureTarget->hasBuff(STRING_HASHCODE("burstrun")) || creature->hasBuff(STRING_HASHCODE("retreat"))) {
												creatureTarget->removeBuff(STRING_HASHCODE("burstrun"));
												creatureTarget->removeBuff(STRING_HASHCODE("retreat"));
											}

											//Start task to restore movement speed
											Reference<setNormalTask*> snormalTask = new setNormalTask(creatureTarget);
											creatureTarget->addPendingTask("resetspeed", snormalTask, 5100);
											//Snare
											buff->setSpeedMultiplierMod(0.60);
											//Appy buffs / debuffs
											creatureTarget->addBuff(buff);
											creature->addBuff(buff2);
											creatureTarget->addBuff(buff3);
											//creatureTarget->setImmobilizedState;
											//Send messages, and effect
											creature->sendSystemMessage("You snare your target!");
											creatureTarget->sendSystemMessage("You've been snared!");
											creatureTarget->playEffect("clienteffect/commando_position_secured.cef", "");

										}

		return doCombatAction(creature, target);
	}

};

#endif //LEGSHOT2COMMAND_H_
