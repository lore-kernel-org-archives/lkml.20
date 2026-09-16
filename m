Received: from ironport.ite.com.tw (219-87-157-213.static.tfn.net.tw [219.87.157.213])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 333D14AF9D8;
	Wed, 16 Sep 2026 09:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=219.87.157.213
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789552814; cv=none; b=a/K/B0CkUqi00KrB2hvqBSfKd3ZTldaX95DHxImbgnho7vgN2wzaHIL+/zjHtT6CGNcP2SoToYxCsCCUFR919TLpjirpKZI5gc77HMyVG6a+CfhAi2Ie0YpxY2Pm1pMgLQUij/oEXm5OWzM6TQIikl/Pt7b3XMR2SQr+Yg6G1n0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789552814; c=relaxed/simple;
	bh=lin+YjBCcpmyxE4bozR4v0SWy+yLolAImCIGa0mXkQA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=RBw30ydWZi3yJpry6yB4MYAGsuA5I+z69FwtzsXHptEWop/SrlBmw78BvM/+2kCwsVGCVoEwkftS/ujSNzTSMb66B/MW//91S+nSZifNfoRWzOtTz5gQ0VbSWZyqF8z/TF0+x1AWVGu7saPTGQq9kDoE9ucG8gMoV3K24D/MVHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ite.com.tw; spf=pass smtp.mailfrom=ite.com.tw; dkim=pass (2048-bit key) header.d=ite.com.tw header.i=@ite.com.tw header.b=A4HJqLgi; arc=none smtp.client-ip=219.87.157.213
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ite.com.tw
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ite.com.tw
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ite.com.tw header.i=@ite.com.tw header.b="A4HJqLgi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=ite.com.tw; s=dkim;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=lin+YjBCcpmyxE4bozR4v0SWy+yLolAImCIGa0mXkQA=;
  b=A4HJqLgiVCeJ1YDSEQzplb8JrFvdsre4iRjSa/er6DKZB64EPiDDN4SX
   1NY6HeKhgWAolYrr5R0N7K5bFNlrb9xlFrlJ9MihOHCDl7TbZARAxzh42
   IPbJZyqSza2FtYlR4ErbeCyvZ870PvuCquGq88E0ZRHFnJeg/EwIrBwmC
   uon0n5XeWfIdDJ25oOgqZJAC/cZdM+iaWuazu5oQ4kIq7st6WiZmJ7+pu
   zPIjRxH6PWslTVoHhnJCyJKx9Uofg15hdOi9Rc3+kYmnmZfbWl7gYCu/9
   C160V8Xtp+Vxj7OPy+GMaw69nwqqBBF9ppwkPN/o3QA1njyYNyHPefGKq
   g==;
X-CSE-ConnectionGUID: 5npCS6HOTBSYQ8HdB3G6MQ==
X-CSE-MsgGUID: F7hd51TrRZu3bXs3wHcKtQ==
Received: from unknown (HELO mse.ite.com.tw) ([192.168.35.30])
  by ironport.ite.com.tw with ESMTP; 16 Sep 2026 17:59:44 +0800
Received: from hscmail1.internal.ite.com.tw (HSCMAIL2.internal.ite.com.tw [192.168.35.41])
	by mse.ite.com.tw with ESMTP id 68G9xen3013055;
	Wed, 16 Sep 2026 17:59:40 +0800 (+08)
	(envelope-from amber.kao@ite.com.tw)
Received: from HSCMAIL1.internal.ite.com.tw (192.168.35.58) by
 HSCMAIL2.internal.ite.com.tw (192.168.35.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 16 Sep 2026 17:59:39 +0800
Received: from HSCMAIL1.internal.ite.com.tw ([fe80::d4ad:7d1f:bb56:79ee]) by
 HSCMAIL1.internal.ite.com.tw ([fe80::d4ad:7d1f:bb56:79ee%6]) with mapi id
 15.02.2562.046; Wed, 16 Sep 2026 17:59:39 +0800
From: <amber.kao@ite.com.tw>
To: <krzk@kernel.org>, <ite_pd@ite.com.tw>
CC: <jeson.yang@ite.com.tw>, <Yaode.Fang@ite.com.tw>,
        <gregkh@linuxfoundation.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <heikki.krogerus@linux.intel.com>,
        <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 2/2] usb: typec: ucsi: itepd: Add DisplayPort alternate
 mode support
Thread-Topic: [PATCH 2/2] usb: typec: ucsi: itepd: Add DisplayPort alternate
 mode support
Thread-Index: AQHdQda7AaBbZhTAY0+l2COw4sVAgrbLtE8AgAVIcKA=
Date: Wed, 16 Sep 2026 09:59:39 +0000
Message-ID: <075d62e2b252455fb236036b9e0210dc@ite.com.tw>
References: <20260911-ucsi-itepd-it527x-v1-0-14c8041afb53@ite.com.tw>
 <20260911-ucsi-itepd-it527x-v1-2-14c8041afb53@ite.com.tw>
 <20260913-agile-tacky-mayfly-7a0ff3@quoll>
In-Reply-To: <20260913-agile-tacky-mayfly-7a0ff3@quoll>
Accept-Language: en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-tm-snts-smtp: 90D9331963929EDFBE6D2CEEBCC8E2D07F44A8AA0D7FEA2B3BC9BA8BBDEF70F92002:8
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MAIL:mse.ite.com.tw 68G9xen3013055

T24gU3VuLCBTZXAgMTMsIDIwMjYgYXQgMDk6MDU6NDBBTSArMDAwMCwgS3J6eXN6dG9mIEtvemxv
d3NraSB3cm90ZToNCj4gPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgaXRlcGRf
b2ZfbWF0Y2hfdGFibGVbXSA9IHsNCj4gPiAgCXsgLmNvbXBhdGlibGUgPSAiaXRlLGl0ODg1MSIg
fSwNCj4gPiArCQl7IC5jb21wYXRpYmxlID0gIml0ZSxpdDUyNzEiIH0sDQo+IA0KPiBTbyBkZXZp
Y2VzIGFyZSBmdWxseSBjb21wYXRpYmxlPw0KDQpZZXMuIFRoZSBJVDUyN3ggc2VyaWVzIHNoYXJl
cyB0aGUgc2FtZSBwcm9ncmFtbWluZyBpbnRlcmZhY2UgYXMNCklUODg1MS9JVDg4NTM6IHNhbWUg
cmVnaXN0ZXIgbWFwLCBzYW1lIFVDU0kgY29tbWFuZCBwYXRoLCBhbmQgdGhlDQpkcml2ZXIgZG9l
cyBub3QgYnJhbmNoIG9uIHRoZSBwYXJ0IG51bWJlciAtLSBuZWl0aGVyIG1hdGNoIGVudHJ5DQpj
YXJyaWVzIG1hdGNoIGRhdGEuDQoNClRoZSBpbnRlZ3JhdGVkIE1VWC9TQlUgb24gSVQ1Mjd4IGlz
IHRyYW5zcGFyZW50IHRvIHRoZSBob3N0LiBUaGUgbXV4DQphbmQgcmV0aW1lciBhcmUgcmVzb2x2
ZWQgdGhyb3VnaCB0aGUgY29ubmVjdG9yJ3MgT0YgZ3JhcGgsIHNvIGEgYm9hcmQNCndpdGhvdXQg
YW4gZXh0ZXJuYWwgbXV4IHNpbXBseSBoYXMgbm8gcG9ydEAyIGFuZCB0aGUgc2FtZSBjb2RlIHBh
dGgNCmRvZXMgdGhlIHJpZ2h0IHRoaW5nLg0KDQpJIHdpbGwgZHJvcCB0aGUgIml0ZSxpdDUyNzEi
IGVudHJ5IGluIHYyIGFuZCBleHByZXNzIHRoZSByZWxhdGlvbnNoaXANCmFzIGEgZmFsbGJhY2sg
aW4gdGhlIGJpbmRpbmcgaW5zdGVhZCwgY29uc2lzdGVudCB3aXRoIGl0ZSxpdDg4NTMuIEkNCndp
bGwgYWxzbyB1cGRhdGUgTU9EVUxFX0RFU0NSSVBUSU9OIHRvIGNvdmVyIHRoZSBJVDUyN3ggc2Vy
aWVzLg0KDQpUaGFua3MsDQpBbWJlcg0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJv
bTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6a0BrZXJuZWwub3JnPiANClNlbnQ6IFN1bmRheSwg
U2VwdGVtYmVyIDEzLCAyMDI2IDU6MDYgUE0NClRvOiBJVEVfUEQgPGl0ZV9wZEBpdGUuY29tLnR3
Pg0KQ2M6IEFtYmVyIEthbyAosKrgsazVKSA8YW1iZXIua2FvQGl0ZS5jb20udHc+OyBKZXNvbiBZ
YW5nICi3qKfTveUpIDxqZXNvbi55YW5nQGl0ZS5jb20udHc+OyBZYW9kZSBGYW5nICik6MSjvHcp
IDxZYW9kZS5GYW5nQGl0ZS5jb20udHc+OyBHcmVnIEtyb2FoLUhhcnRtYW4gPGdyZWdraEBsaW51
eGZvdW5kYXRpb24ub3JnPjsgUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz47IEtyenlzenRv
ZiBLb3psb3dza2kgPGtyemsrZHRAa2VybmVsLm9yZz47IENvbm9yIERvb2xleSA8Y29ub3IrZHRA
a2VybmVsLm9yZz47IEhlaWtraSBLcm9nZXJ1cyA8aGVpa2tpLmtyb2dlcnVzQGxpbnV4LmludGVs
LmNvbT47IGxpbnV4LXVzYkB2Z2VyLmtlcm5lbC5vcmc7IGRldmljZXRyZWVAdmdlci5rZXJuZWwu
b3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnDQpTdWJqZWN0OiBSZTogW1BBVENIIDIv
Ml0gdXNiOiB0eXBlYzogdWNzaTogaXRlcGQ6IEFkZCBEaXNwbGF5UG9ydCBhbHRlcm5hdGUgbW9k
ZSBzdXBwb3J0DQoNCk9uIEZyaSwgU2VwIDExLCAyMDI2IGF0IDA2OjE3OjU4UE0gKzA4MDAsIEFt
YmVyIEthbyB3cm90ZToNCj4gKwlyZXQgPSBpdGVwZF9icmlkZ2VzX2FkZChpdGVwZCk7DQo+ICsJ
aWYgKHJldCkNCj4gKwkJZ290byBvdXRfdWNzaV91bnJlZ2lzdGVyOw0KPiArDQo+ICAJcmV0dXJu
IDA7DQo+ICANCj4gK291dF91Y3NpX3VucmVnaXN0ZXI6DQo+ICsJdWNzaV91bnJlZ2lzdGVyKGl0
ZXBkLT51Y3NpKTsNCj4gIG91dF9mcmVlX2lycToNCj4gIAlmcmVlX2lycShjbGllbnQtPmlycSwg
aXRlcGQpOw0KPiAgb3V0X3Vjc2lfZGVzdHJveToNCj4gQEAgLTMzMCw2ICs3MTUsNyBAQCBzdGF0
aWMgdm9pZCBpdGVwZF9yZW1vdmUoc3RydWN0IGkyY19jbGllbnQgKmNsaWVudCkNCj4gIA0KPiAg
c3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgaXRlcGRfb2ZfbWF0Y2hfdGFibGVbXSA9
IHsNCj4gIAl7IC5jb21wYXRpYmxlID0gIml0ZSxpdDg4NTEiIH0sDQo+ICsJeyAuY29tcGF0aWJs
ZSA9ICJpdGUsaXQ1MjcxIiB9LA0KDQpTbyBkZXZpY2VzIGFyZSBmdWxseSBjb21wYXRpYmxlPw0K
DQpCZXN0IHJlZ2FyZHMsDQpLcnp5c3p0b2YNCg0K
