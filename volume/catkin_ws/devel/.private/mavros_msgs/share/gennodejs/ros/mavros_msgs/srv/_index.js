
"use strict";

let ParamPull = require('./ParamPull.js')
let WaypointClear = require('./WaypointClear.js')
let FileTruncate = require('./FileTruncate.js')
let FileRemove = require('./FileRemove.js')
let LogRequestList = require('./LogRequestList.js')
let FileChecksum = require('./FileChecksum.js')
let LogRequestEnd = require('./LogRequestEnd.js')
let CommandLong = require('./CommandLong.js')
let ParamPush = require('./ParamPush.js')
let CommandTriggerInterval = require('./CommandTriggerInterval.js')
let CommandTOL = require('./CommandTOL.js')
let CommandBool = require('./CommandBool.js')
let SetMode = require('./SetMode.js')
let CommandTriggerControl = require('./CommandTriggerControl.js')
let ParamSet = require('./ParamSet.js')
let LogRequestData = require('./LogRequestData.js')
let CommandAck = require('./CommandAck.js')
let FileOpen = require('./FileOpen.js')
let FileWrite = require('./FileWrite.js')
let SetMavFrame = require('./SetMavFrame.js')
let CommandVtolTransition = require('./CommandVtolTransition.js')
let FileClose = require('./FileClose.js')
let FileMakeDir = require('./FileMakeDir.js')
let MountConfigure = require('./MountConfigure.js')
let FileList = require('./FileList.js')
let WaypointPush = require('./WaypointPush.js')
let WaypointSetCurrent = require('./WaypointSetCurrent.js')
let StreamRate = require('./StreamRate.js')
let ParamGet = require('./ParamGet.js')
let FileRead = require('./FileRead.js')
let CommandHome = require('./CommandHome.js')
let FileRemoveDir = require('./FileRemoveDir.js')
let FileRename = require('./FileRename.js')
let WaypointPull = require('./WaypointPull.js')
let CommandInt = require('./CommandInt.js')
let VehicleInfoGet = require('./VehicleInfoGet.js')
let MessageInterval = require('./MessageInterval.js')

module.exports = {
  ParamPull: ParamPull,
  WaypointClear: WaypointClear,
  FileTruncate: FileTruncate,
  FileRemove: FileRemove,
  LogRequestList: LogRequestList,
  FileChecksum: FileChecksum,
  LogRequestEnd: LogRequestEnd,
  CommandLong: CommandLong,
  ParamPush: ParamPush,
  CommandTriggerInterval: CommandTriggerInterval,
  CommandTOL: CommandTOL,
  CommandBool: CommandBool,
  SetMode: SetMode,
  CommandTriggerControl: CommandTriggerControl,
  ParamSet: ParamSet,
  LogRequestData: LogRequestData,
  CommandAck: CommandAck,
  FileOpen: FileOpen,
  FileWrite: FileWrite,
  SetMavFrame: SetMavFrame,
  CommandVtolTransition: CommandVtolTransition,
  FileClose: FileClose,
  FileMakeDir: FileMakeDir,
  MountConfigure: MountConfigure,
  FileList: FileList,
  WaypointPush: WaypointPush,
  WaypointSetCurrent: WaypointSetCurrent,
  StreamRate: StreamRate,
  ParamGet: ParamGet,
  FileRead: FileRead,
  CommandHome: CommandHome,
  FileRemoveDir: FileRemoveDir,
  FileRename: FileRename,
  WaypointPull: WaypointPull,
  CommandInt: CommandInt,
  VehicleInfoGet: VehicleInfoGet,
  MessageInterval: MessageInterval,
};
