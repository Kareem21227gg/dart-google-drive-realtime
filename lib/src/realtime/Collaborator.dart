// Copyright (c) 2013, Alexandre Ardhuin
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

part of google_drive_realtime;

class Collaborator extends jsw.TypedProxy {
  static Collaborator cast(js.Proxy proxy) => proxy == null ? null : new Collaborator.fromProxy(proxy);

  Collaborator(String userId, String sessionId, String displayName, String color, bool isMe, bool isAnonymous, String photoUrl) : this.fromProxy(new js.Proxy.withArgList(realtime.Collaborator, [userId, sessionId, displayName, color, isMe, isAnonymous, photoUrl]));
  Collaborator.fromProxy(js.Proxy proxy) : super.fromProxy(proxy);

  String get color => $unsafe.color;
  String get displayName => $unsafe.displayName;
  bool get isAnonymous => $unsafe.isAnonymous;
  bool get isMe => $unsafe.isMe;
  String get photoUrl => $unsafe.photoUrl;
  String get sessionId => $unsafe.sessionId;
  String get userId => $unsafe.userId;

  set color(String color) => $unsafe.color = color;
  set displayName(String displayName) => $unsafe.displayName = displayName;
  set isAnonymous(bool isAnonymous) => $unsafe.isAnonymous = isAnonymous;
  set isMe(bool isMe) => $unsafe.isMe = isMe;
  set photoUrl(String photoUrl) => $unsafe.photoUrl = photoUrl;
  set sessionId(String sessionId) => $unsafe.sessionId = sessionId;
  set userId(String userId) => $unsafe.userId = userId;
}
