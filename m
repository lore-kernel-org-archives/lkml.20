Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794189765;
	b=Yc2sClndbYUqvOH36c6yEGuhj5Eqx2MOo5NP/FnpRxtkp9uBx3LZI4/RZyWMKLjgR5HM
	 AbjVKqb6jCzSXmhOCrE8R6Uz4Pk/CeN25Rs8O7nkJFp5yIuonysj2fPUGJpCyYVFPwIV+
	 qARhsANXi3PbXjcia/wkd1Oi6ijYnFY/wji4lvVEM4nTy5Q7BQQZr00KadxacjTZ+E/Oy
	 OQ/qznccKi5d+3VV1007VQC2BeJBpgDMkJBHBtboMLuCw2ncmnhiT8rFhJ8F5M6cAAAXQ
	 LDUp7ExijO+GPyY4f0fG/on48Mek60nLsii8LmwI+d1zLKr7Ct7tNLa/VW3CtvPndNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794189765;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:
	 Message-ID:References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=jo27+2crNHkSXh+DTTxPnRRpOyLKpscA6V2A5Jb1i2g=;
	b=kt2QVcXdk5GQjKi1F/BEFmMLpnPXy0YM+ILQMMnwpsdESq/rLRz2ClreF6zC/xii4kyh
	 MSi7DZursx7IycNZYeCKOWXhlETW3MSJw9z3Zh1BCDxDS4kdIN+W1JNNuPxzw4HEkA8Bf
	 Wzl1DDe4Cvxjdai5W8++mQNcyY2rB5pFTDFwkDYKvkuJIIWTPisNr8gCezCbjWlNEpcpn
	 mrZ8UHt+5u382OSnQsOIgloXEaznF1A/bu8QMj03DYcXkV6caEtZW33HWT2Gs1u2fpdL7
	 s2TlCLYo/XYCb3e6j01a1oLE/irs91P7lz9vFlKFaEzWlC+DDHnHezGAtHRaiPv8WPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=ngoJmNOr;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2B0F606A332;
	Mon,  9 Nov 2026 02:02:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2B0F606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=ngoJmNOr
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6A922eH823896237, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1794189760; bh=jo27+2crNHkSXh+DTTxPnRRpOyLKpscA6V2A5Jb1i2g=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=ngoJmNOrlfBO0BjjQLKRroDU/36fmO2DgZQdW8NCjP5x5vNl9faqrDAaeLF+NArQZ
	 mfk6tVddx1lqrEyIPcAUfYkwx0tHZ8fy1hcGxDW6d9SWQpGj9bnYz5CbPD0aTa3ixq
	 EjqAbYUTOdfMmb3zB4yUoadMME27awgjZy03qemjm0dZIyJuaSba8fW1PgyeYI2R/7
	 dOhvmB7vi0JCwzFXAcqD2uxcPgz8w+Ehj4Os54e8DYYiwue2bTzS/jl/mInS6T/qaY
	 3ppVQFHAHmHJOal561X5M7Bk/dtQXf14fjpUwclTBB2oYezuPkuP9JE80k5HTwDWYY
	 369Het/2DtT3A==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6A922eH823896237
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 9 Nov 2026 10:02:40 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 9 Nov 2026 10:02:40 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 9 Nov 2026 10:02:40 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Mon, 9 Nov 2026 10:02:40 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Jie Feng <hjf3108@gmail.com>
CC: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH rtw-next 4/5] wifi: rtlwifi: rtl8192du: enable USB RX
 aggregation
Thread-Topic: [PATCH rtw-next 4/5] wifi: rtlwifi: rtl8192du: enable USB RX
 aggregation
Thread-Index: AQHda3lL9w2T8fKlSE2DNNuQSInmgLck79mg//+NXYCAAIdxsA==
Date: Mon, 9 Nov 2026 02:02:40 +0000
Message-ID: <5563ba9cef7c4c378cca73724c164041@realtek.com>
References: <20261103095256.949327-1-hjf3108@gmail.com>
 <20261103095256.949327-5-hjf3108@gmail.com>
 <e826d25ce74e4d839f2719509494c129@realtek.com>
 <CABOQOSXX=3ZPfGmXBLfHPcGK11dqMRZ8vAC05OtstQtWS7Un6A@mail.gmail.com>
In-Reply-To: <CABOQOSXX=3ZPfGmXBLfHPcGK11dqMRZ8vAC05OtstQtWS7Un6A@mail.gmail.com>
Accept-Language: en-US, zh-TW
Content-Language: zh-TW
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

SmllIEZlbmcgPGhqZjMxMDhAZ21haWwuY29tPiB3cm90ZToNCj4gT24gTW9uLCA5IE5vdiAyMDI2
IGF0IDA4OjQ0LCBQaW5nLUtlIFNoaWggPHBrc2hpaEByZWFsdGVrLmNvbT4gd3JvdGU6DQo+ID4N
Cj4gPiBIbyBKaWUgRmVuZyA8aGpmMzEwOEBnbWFpbC5jb20+IHdyb3RlOg0KPiA+ID4gQWxsb3cg
UlggYWdncmVnYXRpb24gb2YgdXAgdG8gNDggcGFnZXMgb2YgMTI4IGJ5dGVzIG9yIDI0IHdpdGgg
dHdvIE1BQ3MuDQo+ID4NCj4gPiBZb3UgY2FuIGRlc2NyaWJlIGEgbGl0dGxlIGJpdCBob3cgeW91
IGJ1aWxkIHNlcGFyYXRlIHNrYiwgZXNwZWNpYWxseQ0KPiA+IHRoZSBsYXN0IG9uZS4NCj4gPg0K
PiA+ID4NCj4gPiA+IFRlc3QgcmVzdWx0cyAoMi40IEdIeik6DQo+ID4gPiAgICBiZWZvcmUgYWZ0
ZXINCj4gPiA+IFRYIDUuMiAgICA2LjQNCj4gPiA+IFJYIDI3LjEgICAzMi4wDQo+ID4gPg0KPiA+
ID4gU2lnbmVkLW9mZi1ieTogSG8gSmllIEZlbmcgPGhqZjMxMDhAZ21haWwuY29tPg0KPiA+DQo+
ID4gQWNrZWQtYnkgaXMgZ2l2ZW4sIGJ1dCBzb21lIG1pbm9yIGNvbW1lbnRzLg0KPiA+DQo+ID4g
QWNrZWQtYnk6IFBpbmctS2UgU2hpaCA8cGtzaGloQHJlYWx0ZWsuY29tPg0KPiA+DQo+ID4gPiAr
dm9pZCBydGw5MmR1X3J4X3NlZ3JlZ2F0ZV9oZGwoc3RydWN0IGllZWU4MDIxMV9odyAqaHcsIHN0
cnVjdCBza19idWZmICpza2IsDQo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICBz
dHJ1Y3Qgc2tfYnVmZl9oZWFkICpxdWV1ZSkNCj4gPiA+ICt7DQo+ID4gPiArICAgICAgIHN0cnVj
dCBydGxfcHJpdiAqcnRscHJpdiA9IHJ0bF9wcml2KGh3KTsNCj4gPiA+ICsgICAgICAgdW5zaWdu
ZWQgaW50IG9mZnNldCA9IDAsIHBrdF9zaXplOw0KPiA+ID4gKyAgICAgICBzdHJ1Y3Qgc2tfYnVm
ZiAqbmV3X3NrYjsNCj4gPiA+ICsgICAgICAgX19sZTMyICpyeGRlc2M7DQo+ID4gPiArDQo+ID4g
PiArICAgICAgIHdoaWxlIChza2ItPmxlbiAtIG9mZnNldCA+PSBSVExfUlhfREVTQ19TSVpFKSB7
DQo+ID4gPiArICAgICAgICAgICAgICAgcnhkZXNjID0gKF9fbGUzMiAqKShza2ItPmRhdGEgKyBv
ZmZzZXQpOw0KPiA+ID4gKyAgICAgICAgICAgICAgIHBrdF9zaXplID0gUlRMX1JYX0RFU0NfU0la
RSArDQo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICBnZXRfcnhfZGVzY19kcnZfaW5m
b19zaXplKHJ4ZGVzYykgKg0KPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgUlhfRFJW
X0lORk9fU0laRV9VTklUICsNCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgIGdldF9y
eF9kZXNjX3NoaWZ0KHJ4ZGVzYykgKw0KPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
Z2V0X3J4X2Rlc2NfcGt0X2xlbihyeGRlc2MpOw0KPiA+ID4gKw0KPiA+ID4gKyAgICAgICAgICAg
ICAgIGlmIChnZXRfcnhfZGVzY19wa3RfbGVuKHJ4ZGVzYykgPT0gMCB8fA0KPiA+ID4gKyAgICAg
ICAgICAgICAgICAgICBwa3Rfc2l6ZSA+IHNrYi0+bGVuIC0gb2Zmc2V0KSB7DQo+ID4gPiArICAg
ICAgICAgICAgICAgICAgICAgICBydGxfZGJnKHJ0bHByaXYsIENPTVBfUkVDViwgREJHX1dBUk5J
TkcsDQo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJiYWQgZnJhbWUgYXQg
JXUgb2YgJXUsIHNpemUgJXVcbiIsDQo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIG9mZnNldCwgc2tiLT5sZW4sIHBrdF9zaXplKTsNCj4gPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgIGJyZWFrOw0KPiA+ID4gKyAgICAgICAgICAgICAgIH0NCj4gPiA+ICsNCj4gPiA+ICsg
ICAgICAgICAgICAgICAvKiBUaGUgbGFzdCBmcmFtZSBrZWVwcyB0aGUgb3JpZ2luYWwgc2tiLiAq
Lw0KPiA+ID4gKyAgICAgICAgICAgICAgIGlmIChBTElHTihwa3Rfc2l6ZSwgUlRMOTJEVV9SWF9B
R0dfQUxJR04pID49IHNrYi0+bGVuIC0gb2Zmc2V0KSB7DQo+ID4gPiArICAgICAgICAgICAgICAg
ICAgICAgICBza2JfcHVsbChza2IsIG9mZnNldCk7DQo+ID4gPiArICAgICAgICAgICAgICAgICAg
ICAgICBza2JfdHJpbShza2IsIHBrdF9zaXplKTsNCj4gPiA+ICsgICAgICAgICAgICAgICAgICAg
ICAgIF9fc2tiX3F1ZXVlX3RhaWwocXVldWUsIHNrYik7DQo+ID4gPiArICAgICAgICAgICAgICAg
ICAgICAgICByZXR1cm47DQo+ID4gPiArICAgICAgICAgICAgICAgfQ0KPiA+ID4gKw0KPiA+ID4g
KyAgICAgICAgICAgICAgIG5ld19za2IgPSBkZXZfYWxsb2Nfc2tiKHBrdF9zaXplICsgUlRMOTJE
VV9SWF9IRUFEUk9PTSk7DQo+ID4NCj4gPiBXaGF0IGlzIHRoZSBwdXJwb3NlIG9mIFJUTDkyRFVf
UlhfSEVBRFJPT00gPw0KPiBUaGlzIGlzIGZvciB0aGUgcmFkaW90YXAgaGVhZGVyLCBsaWtlIGlu
IHVzYi5jLg0KPiANCj4gSSBjb3VsZCBkcm9wIGl0LCBvciBhZGQgY29tbWVudHMgb3IgYSBjb21t
aXQgZGVzY3JpcHRpb24gdG8gZGVzY3JpYmUgaXQ/DQoNCldoeSBub3QganVzdCBuYW1pbmcgUkFE
SU9UQVAgbGlrZSB1c2IuYyA/DQoNCj4gDQo+IGh0dHBzOi8vZ2l0aHViLmNvbS9wa3NoaWgvcnR3
L2Jsb2IvcnR3LW5leHQvZHJpdmVycy9uZXQvd2lyZWxlc3MvcmVhbHRlay9ydGx3aWZpL3VzYi5j
I0w1ODINCg0KSSBkb24ndCByZW1lbWJlciBJIGhhdmUgdHJpZWQgbW9uaXRvciBtb2RlIHdpdGgg
cnRsd2lmaS4gQ2FuIHlvdSBnaXZlIGl0IGEgdHJ5PyANCg0KDQo=
