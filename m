Received: from ironport.ite.com.tw (219-87-157-213.static.tfn.net.tw [219.87.157.213])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0323848B36A;
	Wed, 23 Sep 2026 10:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=219.87.157.213
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790159663; cv=none; b=brQxjPiqs2vJY1+frlUB0OgMlDXNC15RkejmYeyFp2PlaTB/tyw/WLdARB+WgEwZqYD/1c7YUgGqIVJR183rNKJpWUKrM+qDUHoSUtLkOzfdwgggW+LHLZS1oT6hz7K4r0Uya4i1bsjOC6m85W02rSN62FvhLpMBlcBVV/32g9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790159663; c=relaxed/simple;
	bh=HkRt10NJhv2LHFKsE0C2Nfh1fPL3+Dqjc+AsiW0sDNc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=l5ObVcICBsXk5QnPpBMpD55EA/YLrGOk4R0RzmyFAQcWHuf0SQ+lomT89ojC9RhpTOCk21rETR//XtIP282IrMxN3HwNmm3B3Eo8YXwj8DXTmGapnFBrE5DkDyjCQk4my+L67Rmmt5x8s+gamtHAngkez+5Px8lUkFZpmnp0/jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ite.com.tw; spf=pass smtp.mailfrom=ite.com.tw; dkim=pass (2048-bit key) header.d=ite.com.tw header.i=@ite.com.tw header.b=OoWtywlD; arc=none smtp.client-ip=219.87.157.213
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ite.com.tw
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ite.com.tw
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ite.com.tw header.i=@ite.com.tw header.b="OoWtywlD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=ite.com.tw; s=dkim;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=HkRt10NJhv2LHFKsE0C2Nfh1fPL3+Dqjc+AsiW0sDNc=;
  b=OoWtywlDJNM0Pd6Qak7bMNSk3HWeyfoAu5Y8EG2qpXquwDzdTq2ywJVS
   VfvINjWT8We14FcizYcglwJgo4WRSdncJCKViAk9Vg7tX4CamgA8nrzXq
   acCTgeCivVdSQ9QYfr46pREdK41qXTMy6Zrww1ZgiWFI1iG+s+VWofoEM
   Hk1sQGgntMbeY5LK3KEAqgbN8aGQdUfWvKpPo+gh9OZIRhu6zanslRXHZ
   E6gQQBaoPf8IZs1cKejj1XqsDTelXttmsmNsHntssT5EHaMsRCbcPTB/5
   wSo5RASNHDxJf7bwMlA3xz6Gn5xzC6BX4o3rV0QnUo6WXbWo7auIoRIxf
   w==;
X-CSE-ConnectionGUID: FXbuBgp/Q+6DoArNXJun6w==
X-CSE-MsgGUID: r1VIzleDSBy1bW0zQ9Or7w==
Received: from unknown (HELO mse.ite.com.tw) ([192.168.35.30])
  by ironport.ite.com.tw with ESMTP; 23 Sep 2026 18:33:57 +0800
Received: from hscmail1.internal.ite.com.tw (HSCMAIL1.internal.ite.com.tw [192.168.35.58])
	by mse.ite.com.tw with ESMTP id 68NAXqI4072143;
	Wed, 23 Sep 2026 18:33:52 +0800 (+08)
	(envelope-from amber.kao@ite.com.tw)
Received: from HSCMAIL1.internal.ite.com.tw (192.168.35.58) by
 HSCMAIL1.internal.ite.com.tw (192.168.35.58) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 23 Sep 2026 18:33:51 +0800
Received: from HSCMAIL1.internal.ite.com.tw ([fe80::d4ad:7d1f:bb56:79ee]) by
 HSCMAIL1.internal.ite.com.tw ([fe80::d4ad:7d1f:bb56:79ee%6]) with mapi id
 15.02.2562.046; Wed, 23 Sep 2026 18:33:51 +0800
From: <amber.kao@ite.com.tw>
To: <heikki.krogerus@linux.intel.com>, <ite_pd@ite.com.tw>
CC: <jeson.yang@ite.com.tw>, <Yaode.Fang@ite.com.tw>,
        <gregkh@linuxfoundation.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-usb@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2 2/2] usb: typec: ucsi: itepd: Add DisplayPort alternate
 mode support
Thread-Topic: [PATCH v2 2/2] usb: typec: ucsi: itepd: Add DisplayPort
 alternate mode support
Thread-Index: AQHdR1ToWHrRUiZ1Kkij+xK0KUqwVLbZ7ysAgAIQBaA=
Date: Wed, 23 Sep 2026 10:33:50 +0000
Message-ID: <e0b87bb4960a4faa97078cb0cb9fdff1@ite.com.tw>
References: <20260918-ucsi-itepd-it527x-v2-0-7b2d9437cc72@ite.com.tw>
 <20260918-ucsi-itepd-it527x-v2-2-7b2d9437cc72@ite.com.tw>
 <arJgdmA9cWLMQpzV@black.igk.intel.com>
In-Reply-To: <arJgdmA9cWLMQpzV@black.igk.intel.com>
Accept-Language: en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-tm-snts-smtp: BB558A237927C19D01E965D38B3743412C6BF35DEB999AC5DB9F154FB0F1FDEF2002:8
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MAIL:mse.ite.com.tw 68NAXqI4072143

T24gRnJpLCBTZXAgMTgsIDIwMjYgYXQgWFg6WFgsIEhlaWtraSBLcm9nZXJ1cyB3cm90ZToNCj4g
PiAgY29uZmlnIFVDU0lfSVRFUEQNCj4gPiAtCXRyaXN0YXRlICJVQ1NJIEludGVyZmFjZSBEcml2
ZXIgZm9yIElURSBJVDg4NTEvSVQ4ODUzIg0KPiA+ICsJdHJpc3RhdGUgIlVDU0kgSW50ZXJmYWNl
IERyaXZlciBmb3IgSVRFIElUODg1eCBhbmQgSVQ1Mjd4IHNlcmllcyINCj4gPiAgCWRlcGVuZHMg
b24gSTJDDQo+ID4gKwlkZXBlbmRzIG9uIERSTSB8fCAhRFJNDQo+ID4gKwlzZWxlY3QgRFJNX0FV
WF9IUERfQlJJREdFIGlmIERSTV9CUklER0UgJiYgT0YNCj4NCj4gUGxlYXNlIHNwbGl0IHRoaXMg
cGFydCBpbnRvIHNlcGFyYXRlIHBhdGNoLg0KDQpIaSBIZWlra2ksDQoNClVuZGVyc3Rvb2QsIHRo
YW5rcyBmb3IgdGhlIHN1Z2dlc3Rpb24uDQoNCkkgd2lsbCBtb3ZlIHRoZSBLY29uZmlnIHByb21w
dCwgaGVscCB0ZXh0IGFuZCBNT0RVTEVfREVTQ1JJUFRJT04NCnVwZGF0ZXMgb3V0IG9mIHRoZSBE
aXNwbGF5UG9ydCBwYXRjaCwgc28gdGhhdCB0aGUgSVQ4ODV4L0lUNTI3eA0Kc3VwcG9ydCBhbmQg
dGhlIERpc3BsYXlQb3J0IGFsdGVybmF0ZSBtb2RlIHN1cHBvcnQgYXJlIHNlcGFyYXRlDQpwYXRj
aGVzLg0KDQpXb3VsZCBpdCBiZSBmaW5lIHRvIHNlbmQgYm90aCBwYXRjaGVzIGF0IHRoZSBzYW1l
IHRpbWUsIG9yIHdvdWxkIHlvdQ0KcHJlZmVyIHRoYXQgSSBzZW5kIHRoZSBEaXNwbGF5UG9ydCBh
bHRlcm5hdGUgbW9kZSBzdXBwb3J0IGFmdGVyIHRoZQ0KSVQ4ODV4L0lUNTI3eCBzdXBwb3J0IGhh
cyBiZWVuIGFjY2VwdGVkPw0KDQpUaGFua3MsDQpBbWJlcg0KDQotLS0tLU9yaWdpbmFsIE1lc3Nh
Z2UtLS0tLQ0KRnJvbTogSGVpa2tpIEtyb2dlcnVzIDxoZWlra2kua3JvZ2VydXNAbGludXguaW50
ZWwuY29tPiANClNlbnQ6IFR1ZXNkYXksIFNlcHRlbWJlciAyMiwgMjAyNiA3OjAzIFBNDQpUbzog
SVRFX1BEIDxpdGVfcGRAaXRlLmNvbS50dz4NCkNjOiBBbWJlciBLYW8gKLCq4LGs1SkgPGFtYmVy
Lmthb0BpdGUuY29tLnR3PjsgSmVzb24gWWFuZyAot6in073lKSA8amVzb24ueWFuZ0BpdGUuY29t
LnR3PjsgWWFvZGUgRmFuZyAopOjEo7x3KSA8WWFvZGUuRmFuZ0BpdGUuY29tLnR3PjsgR3JlZyBL
cm9haC1IYXJ0bWFuIDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz47IFJvYiBIZXJyaW5nIDxy
b2JoQGtlcm5lbC5vcmc+OyBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprK2R0QGtlcm5lbC5vcmc+
OyBDb25vciBEb29sZXkgPGNvbm9yK2R0QGtlcm5lbC5vcmc+OyBsaW51eC11c2JAdmdlci5rZXJu
ZWwub3JnOyBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZzsgbGludXgta2VybmVsQHZnZXIua2Vy
bmVsLm9yZw0KU3ViamVjdDogUmU6IFtQQVRDSCB2MiAyLzJdIHVzYjogdHlwZWM6IHVjc2k6IGl0
ZXBkOiBBZGQgRGlzcGxheVBvcnQgYWx0ZXJuYXRlIG1vZGUgc3VwcG9ydA0KDQpPbiBGcmksIFNl
cCAxOCwgMjAyNiBhdCAwNjowMzo0NFBNICswODAwLCBBbWJlciBLYW8gd3JvdGU6DQo+IEFkZCBz
dXBwb3J0IGZvciBEaXNwbGF5UG9ydCBhbHRlcm5hdGUgbW9kZS4gVGhlIGRyaXZlciByZXRyaWV2
ZXMgdGhlIA0KPiBjdXJyZW50IGFsdGVybmF0ZSBtb2RlIGZyb20gdGhlIFBQTSwgY29uZmlndXJl
cyB0aGUgVHlwZS1DIG11eCBhbmQgDQo+IHJldGltZXIgYWNjb3JkaW5nbHksIGFuZCByZXBvcnRz
IEhQRCBzdGF0ZSBhbmQgSFBEIElSUSBldmVudHMgdGhyb3VnaCANCj4gdGhlIERSTSBhdXhpbGlh
cnkgSFBEIGJyaWRnZS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEFtYmVyIEthbyA8aXRlX3BkQGl0
ZS5jb20udHc+DQo+IC0tLQ0KPiAgZHJpdmVycy91c2IvdHlwZWMvdWNzaS9LY29uZmlnICAgICAg
fCAgIDggKy0NCj4gIGRyaXZlcnMvdXNiL3R5cGVjL3Vjc2kvdWNzaV9pdGVwZC5jIHwgNDA0IA0K
PiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0NCj4gIDIgZmlsZXMgY2hhbmdl
ZCwgNDAwIGluc2VydGlvbnMoKyksIDEyIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvdXNiL3R5cGVjL3Vjc2kvS2NvbmZpZyANCj4gYi9kcml2ZXJzL3VzYi90eXBlYy91
Y3NpL0tjb25maWcgaW5kZXggMGYxMGRhYzliMzRiLi5jNWVhZjQ5NjdlNGUgDQo+IDEwMDY0NA0K
PiAtLS0gYS9kcml2ZXJzL3VzYi90eXBlYy91Y3NpL0tjb25maWcNCj4gKysrIGIvZHJpdmVycy91
c2IvdHlwZWMvdWNzaS9LY29uZmlnDQo+IEBAIC0xMDUsMTEgKzEwNSwxNSBAQCBjb25maWcgVUNT
SV9IVUFXRUlfR0FPS1VODQo+ICAJICBjYWxsZWQgdWNzaV9odWF3ZWlfZ2Fva3VuLg0KPiAgDQo+
ICBjb25maWcgVUNTSV9JVEVQRA0KPiAtCXRyaXN0YXRlICJVQ1NJIEludGVyZmFjZSBEcml2ZXIg
Zm9yIElURSBJVDg4NTEvSVQ4ODUzIg0KPiArCXRyaXN0YXRlICJVQ1NJIEludGVyZmFjZSBEcml2
ZXIgZm9yIElURSBJVDg4NXggYW5kIElUNTI3eCBzZXJpZXMiDQo+ICAJZGVwZW5kcyBvbiBJMkMN
Cj4gKwlkZXBlbmRzIG9uIERSTSB8fCAhRFJNDQo+ICsJc2VsZWN0IERSTV9BVVhfSFBEX0JSSURH
RSBpZiBEUk1fQlJJREdFICYmIE9GDQo+ICAJaGVscA0KPiAgCSAgVGhpcyBkcml2ZXIgZW5hYmxl
cyBVQ1NJIHN1cHBvcnQgb24gcGxhdGZvcm1zIHRoYXQgZXhwb3NlIGFuDQo+IC0JICBJVEUgSVQ4
ODUxL0lUODg1MyBUeXBlLUMgUG93ZXIgRGVsaXZlcnkgY29udHJvbGxlciBvdmVyIGFuIEkyQyBp
bnRlcmZhY2UuDQo+ICsJICBJVEUgSVQ4ODV4IG9yIElUNTI3eCBzZXJpZXMgVHlwZS1DIFBvd2Vy
IERlbGl2ZXJ5IGNvbnRyb2xsZXINCj4gKwkgIG92ZXIgYW4gSTJDIGludGVyZmFjZS4gSXQgYWxz
byBzdXBwb3J0cyBEaXNwbGF5UG9ydCBhbHRlcm5hdGUNCj4gKwkgIG1vZGUsIGluY2x1ZGluZyBI
UEQgbm90aWZpY2F0aW9uIHRocm91Z2ggdGhlIERSTSBicmlkZ2UuDQoNClBsZWFzZSBzcGxpdCB0
aGlzIHBhcnQgaW50byBzZXBhcmF0ZSBwYXRjaC4NCg0KVGhhbmtzLA0KDQotLQ0KaGVpa2tpDQo=
