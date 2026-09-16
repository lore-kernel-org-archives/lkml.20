Received: from ironport.ite.com.tw (219-87-157-213.static.tfn.net.tw [219.87.157.213])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3017E2EEE62;
	Wed, 16 Sep 2026 09:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=219.87.157.213
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789552817; cv=none; b=EE36/RoLeVkmRK4OfgUZp9UCPGZcKkW9Kx6sJq+OBXo8xePgZDBeJWKql4aL5BzOFooHKhBUhnYKXXwvr2XKHy7htHfN0yFPwq3+m1GRCFalrNfcpWEEpBL4O+cvOwSzer8JPxow6ev1X1zWeRM/JhojN5TtglWYJI5FBqYNqCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789552817; c=relaxed/simple;
	bh=Wam7TiijU2Ty04faK0eac858fW1KFL0oplRiLwxTaYc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=hcJR4GsyOBoqFNA/InoCxY1YCiOKA2B1Wk7p5aU1w8vzIgMYL9EQr3lVIOr9XrHinMmaOiQ0YZNuYybRKpnvuZAD+bQGC/uehBqNka9Osr6cfCrl12bDORCWt2NxHziRARV3iMRgQumbi9s7zK6TIfql6vu+Uvc594UIl/5/vPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ite.com.tw; spf=pass smtp.mailfrom=ite.com.tw; dkim=pass (2048-bit key) header.d=ite.com.tw header.i=@ite.com.tw header.b=f28K4H9z; arc=none smtp.client-ip=219.87.157.213
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ite.com.tw
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ite.com.tw
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ite.com.tw header.i=@ite.com.tw header.b="f28K4H9z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=ite.com.tw; s=dkim;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Wam7TiijU2Ty04faK0eac858fW1KFL0oplRiLwxTaYc=;
  b=f28K4H9z2jbWIaUvgr8tbqyy/R5FbgzwC+qzq6iy8nLyEr1R96BWt8HE
   BBTHRvZPDbAqkGOu/RmgKshF13Ajty8edQWVCK/2ot04yjoY2feuSxAHh
   vrLUr2ThWVjtGEyK9T4r6x4Dy1HdCwLtKXuVCaltbP+levKUHh7o2tw+F
   1dthU+RYiG9rt6KaOLe1EwilkCvKNHYIQmU2tv+faCpgLtmKmcBO1hyWF
   Y583W1icVrZzaL0UNAmNusNeZ2d/9GEfqvexiNGlyXGBCmbmRxcLw13HB
   5oCaJETqGXTgft6rHtaxuRI2SmT561zNJTHmvw4SF3LuZ5sR8gjsLwql8
   g==;
X-CSE-ConnectionGUID: 97p49QIRTt2QI90kYRSDGQ==
X-CSE-MsgGUID: 6EXX2J1VRDad6gLapECBEw==
Received: from unknown (HELO mse.ite.com.tw) ([192.168.35.30])
  by ironport.ite.com.tw with ESMTP; 16 Sep 2026 17:59:52 +0800
Received: from hscmail1.internal.ite.com.tw (HSCMAIL1.internal.ite.com.tw [192.168.35.58])
	by mse.ite.com.tw with ESMTP id 68G9xk2u013181;
	Wed, 16 Sep 2026 17:59:46 +0800 (+08)
	(envelope-from amber.kao@ite.com.tw)
Received: from HSCMAIL1.internal.ite.com.tw (192.168.35.58) by
 HSCMAIL1.internal.ite.com.tw (192.168.35.58) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 16 Sep 2026 17:59:45 +0800
Received: from HSCMAIL1.internal.ite.com.tw ([fe80::d4ad:7d1f:bb56:79ee]) by
 HSCMAIL1.internal.ite.com.tw ([fe80::d4ad:7d1f:bb56:79ee%6]) with mapi id
 15.02.2562.046; Wed, 16 Sep 2026 17:59:45 +0800
From: <amber.kao@ite.com.tw>
To: <krzk@kernel.org>, <ite_pd@ite.com.tw>
CC: <jeson.yang@ite.com.tw>, <Yaode.Fang@ite.com.tw>,
        <gregkh@linuxfoundation.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <heikki.krogerus@linux.intel.com>,
        <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 1/2] dt-bindings: usb: ite,it8851: Add IT5271 series
 support
Thread-Topic: [PATCH 1/2] dt-bindings: usb: ite,it8851: Add IT5271 series
 support
Thread-Index: AQHdQda7Q3HtgoumGkCkAW29wGBzTrbLtLMAgAVJr2A=
Date: Wed, 16 Sep 2026 09:59:45 +0000
Message-ID: <f1b3ac1a3c714e63a9b3e87de29903b1@ite.com.tw>
References: <20260911-ucsi-itepd-it527x-v1-0-14c8041afb53@ite.com.tw>
 <20260911-ucsi-itepd-it527x-v1-1-14c8041afb53@ite.com.tw>
 <20260913-sincere-wolverine-of-refinement-d1f3e5@quoll>
In-Reply-To: <20260913-sincere-wolverine-of-refinement-d1f3e5@quoll>
Accept-Language: en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-tm-snts-smtp: 69F14AC09A94E9D15C5E397CADB992DB12DB0FEAFB985238A57FB6DE985ED8D72002:8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MAIL:mse.ite.com.tw 68G9xk2u013181

T24gU3VuLCBTZXAgMTMsIDIwMjYgYXQgMDk6MDc6MDRBTSArMDAwMCwgS3J6eXN6dG9mIEtvemxv
d3NraSB3cm90ZToNCj4gTm8gbmVlZCBmb3IgYSBuZXcgZXhhbXBsZSBpZiBpdCBkaWZmZXJlcyBv
bmx5IGJ5IHRoZSBjb21wYXRpYmxlLg0KDQpSaWdodCwgd2lsbCBkcm9wIGl0IGluIHYyLg0KDQpU
aGFua3MsDQpBbWJlcg0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogS3J6eXN6
dG9mIEtvemxvd3NraSA8a3J6a0BrZXJuZWwub3JnPiANClNlbnQ6IFN1bmRheSwgU2VwdGVtYmVy
IDEzLCAyMDI2IDU6MDcgUE0NClRvOiBJVEVfUEQgPGl0ZV9wZEBpdGUuY29tLnR3Pg0KQ2M6IEFt
YmVyIEthbyAo6auY6Yi655uIKSA8YW1iZXIua2FvQGl0ZS5jb20udHc+OyBKZXNvbiBZYW5nICjm
pYrlv5fos6IpIDxqZXNvbi55YW5nQGl0ZS5jb20udHc+OyBZYW9kZSBGYW5nICjmlrnogIDlvrcp
IDxZYW9kZS5GYW5nQGl0ZS5jb20udHc+OyBHcmVnIEtyb2FoLUhhcnRtYW4gPGdyZWdraEBsaW51
eGZvdW5kYXRpb24ub3JnPjsgUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz47IEtyenlzenRv
ZiBLb3psb3dza2kgPGtyemsrZHRAa2VybmVsLm9yZz47IENvbm9yIERvb2xleSA8Y29ub3IrZHRA
a2VybmVsLm9yZz47IEhlaWtraSBLcm9nZXJ1cyA8aGVpa2tpLmtyb2dlcnVzQGxpbnV4LmludGVs
LmNvbT47IGxpbnV4LXVzYkB2Z2VyLmtlcm5lbC5vcmc7IGRldmljZXRyZWVAdmdlci5rZXJuZWwu
b3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnDQpTdWJqZWN0OiBSZTogW1BBVENIIDEv
Ml0gZHQtYmluZGluZ3M6IHVzYjogaXRlLGl0ODg1MTogQWRkIElUNTI3MSBzZXJpZXMgc3VwcG9y
dA0KDQpPbiBGcmksIFNlcCAxMSwgMjAyNiBhdCAwNjoxNzo1N1BNICswODAwLCBBbWJlciBLYW8g
d3JvdGU6DQo+ICAgIHJlZzoNCj4gICAgICBtYXhJdGVtczogMQ0KPiBAQCAtNjMsNyArNzMsMTAg
QEAgYWxsT2Y6DQo+ICAgICAgICAgIHByb3BlcnRpZXM6DQo+ICAgICAgICAgICAgY29tcGF0aWJs
ZToNCj4gICAgICAgICAgICAgIGNvbnRhaW5zOg0KPiAtICAgICAgICAgICAgICBjb25zdDogaXRl
LGl0ODg1Mw0KPiArICAgICAgICAgICAgICBlbnVtOg0KPiArICAgICAgICAgICAgICAgIC0gaXRl
LGl0NTI3Mg0KPiArICAgICAgICAgICAgICAgIC0gaXRlLGl0NTI3NA0KPiArICAgICAgICAgICAg
ICAgIC0gaXRlLGl0ODg1Mw0KPiAgICAgIHRoZW46DQo+ICAgICAgICBwcm9wZXJ0aWVzOg0KPiAg
ICAgICAgICBjb25uZWN0b3JAMTogZmFsc2UNCj4gQEAgLTE1NCwzICsxNjcsNDggQEAgZXhhbXBs
ZXM6DQo+ICAgICAgICAgICAgICB9Ow0KPiAgICAgICAgICB9Ow0KPiAgICAgIH07DQo+ICsNCj4g
KyAgLSB8DQo+ICsgICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2ludGVycnVwdC1jb250cm9sbGVy
L2lycS5oPg0KPiArDQo+ICsgICAgaTJjIHsNCj4gKyAgICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8
MT47DQo+ICsgICAgICAgICNzaXplLWNlbGxzID0gPDA+Ow0KPiArDQoNCk5vIG5lZWQgZm9yIGEg
bmV3IGV4YW1wbGUgaWYgaXQgZGlmZmVyZXMgb25seSBieSB0aGUgY29tcGF0aWJsZS4NCg0KQmVz
dCByZWdhcmRzLA0KS3J6eXN6dG9mDQoNCg==
