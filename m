Received: from ironport.ite.com.tw (hc210-202-87-179.vdslpro.static.apol.com.tw [210.202.87.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBED238DC6F;
	Mon,  7 Sep 2026 09:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.202.87.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788775072; cv=none; b=HjmwiZQSw8BUiYMaUnPnvuGRLo+6iROb4FSZLUS5u1L/MjNJ9Wz61iyvYKc51RVYEObOg7JQw2ZQaTlxZSz7hgJ9r8lU8NXullIo8uphF4ZnBWSFBCzBXapWWowNBuoNxqOmzTPpXcr7Fw9G+RD8/RTAtHa0GQJALi1fUoHMvDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788775072; c=relaxed/simple;
	bh=1CDclaGIO/MVfxbtzBCQq8Qz7CSilrxmrI5cOgKh0VU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=l9I+0Nuh6obIKktEJLl6F39Pu0jqz43ooWWypbL5OO5BsHoi98H5AXRRqPYRwRwQ06weLqknGDmGo9kRUoSvlz+lbHhr9kUw/5SUpEeGigzPMzjj35Uekn5o5KX4c/NfZezqkmXOqzdvFsbUx6L4W8o749PBHv5fcC0wU18ErYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ite.com.tw; spf=pass smtp.mailfrom=ite.com.tw; dkim=pass (2048-bit key) header.d=ite.com.tw header.i=@ite.com.tw header.b=oRh6CGeu; arc=none smtp.client-ip=210.202.87.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ite.com.tw
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ite.com.tw
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ite.com.tw header.i=@ite.com.tw header.b="oRh6CGeu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=ite.com.tw; s=dkim;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=1CDclaGIO/MVfxbtzBCQq8Qz7CSilrxmrI5cOgKh0VU=;
  b=oRh6CGeuJE4fdsMklbmgzb/ojNPBHU2/t77GpRTD/ylMEXAFVck1+E2A
   JwtJTZY3CabYRRYhEUicxmFYAdYrcWe7Dv5bEd5sYknd2vA2zCBv0esan
   Kqq59X5YzU7OHJaR1S1Aj2/zNe/UrG10JJZFPCFkAqub+9rkvmlBj81FF
   b1M0o+QV3Yb/eO9MnyTVV2cF5UwOZ8TRCGszThVlpWGJaPqg6qSL4+f4I
   c6tjh3r/qB9janbSLC1lz/XizyzaOAxghrxWjuLZB9ELnU52qlzmKqlWn
   mZAmYI47/xv8hZrES7JtCV8D+w+H3lQvAkntZLMp/CIqWZxw2UENL46hl
   g==;
X-CSE-ConnectionGUID: Mcfzc+A5TaOxaeYgk6popQ==
X-CSE-MsgGUID: e4NPj+aDT3C8PIiHMqqOyQ==
Received: from unknown (HELO mse.ite.com.tw) ([192.168.35.30])
  by ironport.ite.com.tw with ESMTP; 07 Sep 2026 17:57:40 +0800
Received: from hscmail1.internal.ite.com.tw (HSCMAIL1.internal.ite.com.tw [192.168.35.58])
	by mse.ite.com.tw with ESMTP id 6879vZmL033368;
	Mon, 7 Sep 2026 17:57:35 +0800 (+08)
	(envelope-from amber.kao@ite.com.tw)
Received: from HSCMAIL1.internal.ite.com.tw (192.168.35.58) by
 HSCMAIL1.internal.ite.com.tw (192.168.35.58) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 7 Sep 2026 17:57:34 +0800
Received: from HSCMAIL1.internal.ite.com.tw ([fe80::d4ad:7d1f:bb56:79ee]) by
 HSCMAIL1.internal.ite.com.tw ([fe80::d4ad:7d1f:bb56:79ee%6]) with mapi id
 15.02.2562.046; Mon, 7 Sep 2026 17:57:34 +0800
From: <amber.kao@ite.com.tw>
To: <krzk@kernel.org>, <ite_pd@ite.com.tw>
CC: <jeson.yang@ite.com.tw>, <Yaode.Fang@ite.com.tw>,
        <gregkh@linuxfoundation.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-usb@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] dt-bindings: usb: Add ITE IT5271/IT5272/IT5273/IT5274
 support
Thread-Topic: [PATCH] dt-bindings: usb: Add ITE IT5271/IT5272/IT5273/IT5274
 support
Thread-Index: AQHdO40ZV2swSIj+0E+i7ACu7C2xj7bCUiQAgACUjSA=
Date: Mon, 7 Sep 2026 09:57:34 +0000
Message-ID: <cc3a8a7133184decb06884d65c5f06c5@ite.com.tw>
References: <20260903-it5271-binding-v1-1-1abd2c8cea85@ite.com.tw>
 <20260907-bulky-adorable-agama-40ece9@quoll>
In-Reply-To: <20260907-bulky-adorable-agama-40ece9@quoll>
Accept-Language: en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-tm-snts-smtp: 4E88B76D177A4DDD2BD98574EC9A87729AC212AF02B79C41406C8C15C09E7D102002:8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MAIL:mse.ite.com.tw 6879vZmL033368

T24gTW9uLCBTZXAgMDcsIDIwMjYgYXQgMDU6MDM6MDBQTSArMDgwMCwgS3J6eXN6dG9mIEtvemxv
d3NraSB3cm90ZToNCj4gT24gVGh1LCBTZXAgMDMsIDIwMjYgYXQgMDY6MTU6NDNQTSArMDgwMCwg
QW1iZXIgS2FvIHdyb3RlOg0KPiA+IFRoaXMgYmluZGluZyBpcyBzdWJtaXR0ZWQgaW5kZXBlbmRl
bnRseSBzbyBpdCBjYW4gYmUgcmV2aWV3ZWQgb24NCj4gDQo+IE5vLCBpdCBjYW5ub3QgYmUgcmV2
aWV3ZWQgb24gaXRzIG93biwgYmVjYXVzZSBzcGxpdHRpbmcgaXQgbWVhbnMgeW91DQo+IGhhdmUg
dW5kb2N1bWVudGVkIGNvbXBhdGlibGVzIGluIHRoZSBvdGhlciBwYXRjaHNldC4NCj4gDQo+IEFu
ZCBpZiB5b3UgZG8gbm90LCB0aGVuIHRoZXJlIGlzIG5vIHVzZXIgZm9yIHRoaXMgYmluZGluZy4N
Cj4gDQo+ID4gaXRzIG93bjsgb25jZSB0aGUgZHJpdmVyIHNlcmllcyBsYW5kcywgSVQ1Mjd4IHN1
cHBvcnQgd2lsbCBiZSB3aXJlZA0KPiA+IGludG8gaXQgdGhlcmUuDQo+IA0KPiBUaGVuIHdoYXQg
aXMgdGhlIHBvaW50IG9mIHRoaXMgYmluZGluZyBub3c/DQoNClVuZGVyc3Rvb2QsIHRoYXQncyBh
IGZhaXIgcG9pbnQg4oCUIHJldmlld2luZyBhIGJpbmRpbmcgd2l0aG91dCBhIGRyaXZlcg0KdXNl
ciBpbiB0cmVlIGlzIGEgd2FzdGUgb2YgZXZlcnlvbmUncyB0aW1lLiBJJ2xsIGRyb3AgdGhpcyBz
dGFuZGFsb25lDQpiaW5kaW5nIHBhdGNoLg0KDQo+ID4gKyAgICAtIElUNTI3MTogc2luZ2xlLXBv
cnQgdmFyaWFudCwgU1BSDQo+ID4gKyAgICAtIElUNTI3MjogdHdvLXBvcnQgdmFyaWFudCwgU1BS
DQo+ID4gKyAgICAtIElUNTI3Mzogc2luZ2xlLXBvcnQgdmFyaWFudCwgRVBSDQo+ID4gKyAgICAt
IElUNTI3NDogdHdvLXBvcnQgdmFyaWFudCwgRVBSDQo+ID4gKw0KPiANCj4gV2h5IGlzbid0IHRo
aXMgZW50aXJlIGJpbmRpbmcgcGFydCBvZiB0aGUgb3RoZXIgZmlsZT8NCg0KSVQ1Mjd4IGFuZCBJ
VDg4NXggYXJlIGRpZmZlcmVudCBoYXJkd2FyZSwgd2hpY2ggaXMgd2h5IHdlIGRlc2NyaWJlZA0K
dGhlbSBpbiBzZXBhcmF0ZSBEVCBiaW5kaW5ncy4gSG93ZXZlciwgc2luY2UgdGhlaXIgVUNTSSBv
cGVyYXRpb25hbA0KZmxvdyBpcyBzaW1pbGFyLCB0aGV5IHNoYXJlIHRoZSBzYW1lIGRyaXZlciAo
dWNzaV9pdGVwZC5jKS4NCg0KPiA+ICtwcm9wZXJ0aWVzOg0KPiA+ICsgIGNvbXBhdGlibGU6DQo+
ID4gKyAgICBvbmVPZjoNCj4gPiArICAgICAgLSBjb25zdDogaXRlLGl0NTI3MQ0KPiA+ICsgICAg
ICAtIGl0ZW1zOg0KPiA+ICsgICAgICAgICAgLSBjb25zdDogaXRlLGl0NTI3Mg0KPiANCj4gZW51
bQ0KDQpOb3RlZCwgd2lsbCBmaXggaW4gdGhlIG5leHQgc3VibWlzc2lvbi4NCg0KPiBJIGZpbmlz
aGVkIGFjdHVhbGx5IGhlcmUsIGJlY2F1c3IgSSBzdGlsbCBmaW5kIHJldmlld2luZyBvdXRzaWRl
IG9mDQo+IGRyaXZlciBhIHdhc3RlIG9mIG91ciB0aW1lLg0KDQpJbnN0ZWFkIG9mIHJlc3VibWl0
dGluZyB0aGlzIGJpbmRpbmcgYWxvbmUsIEknbSBwbGFubmluZyB0byBzZW5kIGEgbmV3DQpzZXJp
ZXMgY29udGFpbmluZyBib3RoIHRoZSBiaW5kaW5nICh3aXRoIHRoZSBlbnVtIGZpeCkgYW5kIHRo
ZQ0KY29ycmVzcG9uZGluZyBjb21wYXRpYmxlIHN0cmluZ3MgYWRkZWQgdG8gdWNzaV9pdGVwZC5j
LCBzbyB0aGVyZSdzDQphbHdheXMgYSBkcml2ZXIgdXNlciBmb3IgdGhlIGJpbmRpbmcgdW5kZXIg
cmV2aWV3Lg0KDQpPbmUgdGhpbmcgSSdkIGxpa2UgdG8gY2hlY2sgZmlyc3Q6IHRoZSBiYXNlIElU
ODg1MS9JVDg4NTMgc2VyaWVzIHRoaXMNCmRlcGVuZHMgb24gaGFzIGFscmVhZHkgcGlja2VkIHVw
IFJldmlld2VkLWJ5IHRhZ3MgZnJvbSBIZWlra2kgS3JvZ2VydXMNCmFuZCBSb2IgSGVycmluZywg
YnV0IGhhc24ndCBsYW5kZWQgaW4gbWFpbmxpbmUgeWV0LiBIZWlra2kgcHJldmlvdXNseQ0Kc3Vn
Z2VzdGVkIGl0J3MgZmluZSB0byBzZW5kIGEgZm9sbG93LXVwIHNlcmllcyBiZWZvcmUgdGhlIGJh
c2UgbGFuZHMsDQphcyBsb25nIGFzIHRoZSBkZXBlbmRlbmN5IGlzIG5vdGVkIGluIHRoZSBjb3Zl
ciBsZXR0ZXIuIEdpdmVuIHRoYXQsDQp3b3VsZCB5b3UgYmUgb2theSB3aXRoIG1lIHNlbmRpbmcg
dGhlIElUNTI3eCBkcml2ZXIrYmluZGluZyBzZXJpZXMgbm93DQp3aXRoIHRoYXQgZGVwZW5kZW5j
eSBjYWxsZWQgb3V0LCBvciB3b3VsZCB5b3UgcHJlZmVyIEkgd2FpdCB1bnRpbCB0aGUNCklUODg1
MS9JVDg4NTMgc2VyaWVzIGlzIGFjdHVhbGx5IG1lcmdlZCBmaXJzdD8NCg0KQmVzdCByZWdhcmRz
LA0KQW1iZXIgS2FvDQo=
