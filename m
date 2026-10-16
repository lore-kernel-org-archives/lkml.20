Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A056148125C;
	Fri, 16 Oct 2026 12:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792154579; cv=none; b=QlX6uipTTBJ0ZljTqz7H91ji8X45af00Zl+0yGYV6RiqPLDYOA5lmn3Eu7CoFWEH7wym8EQht2Q0y0jlMsgYwvcspvG9S1ub6v1cCDmNwkfGCKhKNEDSpLwWUopBRkqxoRbrP2AQLY0CfK6bbHBU6w2VkdInbTHSjxtK4VG7gfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792154579; c=relaxed/simple;
	bh=dN4poJwAxvndcIKDOFh8WU9B90Vp9srEjyUPaDxtJmQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=KS3MVQ+dU8Z7uskk/xYDRcrFoRuEee7ggpHvVGvSHUYMtjNaNkH1595uRRE+g1m/AsnI+2k1+RN/DLzOWoHrlIK0vNH5vkErlivcS8fH3BNv3XD88wIPVD6sz9YRwhv1mjX5fD5h1nD5Qrot3Ee+CRFax8kvd/X01qG9Gt6Z9s0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realsil.com.cn; spf=pass smtp.mailfrom=realsil.com.cn; dkim=pass (2048-bit key) header.d=realsil.com.cn header.i=@realsil.com.cn header.b=go6XMcck; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realsil.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realsil.com.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realsil.com.cn header.i=@realsil.com.cn header.b="go6XMcck"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 69GCfcsyF3514165, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realsil.com.cn;
	s=dkim; t=1792154498;
	bh=dN4poJwAxvndcIKDOFh8WU9B90Vp9srEjyUPaDxtJmQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=go6XMcckxmD36kMU6sNsGPKV/+CAcKUpxXY21xXr6d9uB6dpcBPZq8IZL/NvWKI6n
	 Iz6ZmcexfoW97AIfn0o6n7l64gvZ6sQNR3KL0seSRPBY2tRjNDKjcXDLm2zoI0dYBM
	 yWLwX3Bb7/DFKPlzH4c7MKvlz9tbuwXZH3+glXil4oTzXkm0A6YlX9CXugQYctDjvb
	 mVfyQkvGylvXyLV80/4mS+ZMpLqyyMBgryGmYFLTuhqSz5I9YbJx6Sp7a/V9HR7X89
	 L2wslEb9wkhzKczxghArI+9N2D7tndrEi6JYNcYIUFwNsM7dqnXQ7u1zSPlmEYbV1c
	 m1hh1peHlr6sg==
Received: from RS-EX-MBS3.realsil.com.cn ([172.29.17.103])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 69GCfcsyF3514165
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 16 Oct 2026 20:41:38 +0800
Received: from RS-EX-MBS2.realsil.com.cn (172.29.17.102) by
 RS-EX-MBS3.realsil.com.cn (172.29.17.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 16 Oct 2026 20:41:38 +0800
Received: from RS-EX-MBS2.realsil.com.cn ([fe80::d17c:2fd0:cf8e:635]) by
 RS-EX-MBS2.realsil.com.cn ([fe80::d17c:2fd0:cf8e:635%9]) with mapi id
 15.02.2562.049; Fri, 16 Oct 2026 20:41:38 +0800
From: =?gb2312?B?1tzS+g==?= <zain_zhou@realsil.com.cn>
To: Lee Jones <lee@kernel.org>
CC: Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li
	<Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Liam Girdwood
	<lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Vikash Bansal
	<vikash.bansal@nxp.com>, Aman Kumar Pandey <aman.kumarpandey@nxp.com>,
	Lakshay Piplani <lakshay.piplani@nxp.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-i3c@lists.infradead.org"
	<linux-i3c@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "mfd@lists.linux.dev" <mfd@lists.linux.dev>,
	=?gb2312?B?zfXsvw==?= <wei_wang@realsil.com.cn>
Subject: =?utf-8?B?5Zue5aSNOiBbUkZDIFBBVENIIDIvNF0gbWZkOiBBZGQgZHJpdmVyIGZvciBSZWFsdGVrIFJUUzQ5MHggSTNDIGh1Yg==?=
Thread-Topic: [RFC PATCH 2/4] mfd: Add driver for Realtek RTS490x I3C hub
Thread-Index: AQHdSOfJqQvAuTVpV0yzClLpyE4DErb8wqSAgAN+5ZA=
Date: Fri, 16 Oct 2026 12:41:38 +0000
Message-ID: <561f9d3886c94700bfad8ca8fc66b049@realsil.com.cn>
References: <20260920100501.4091351-1-zain_zhou@realsil.com.cn>
 <20260920100501.4091351-3-zain_zhou@realsil.com.cn>
 <179198542200.839288.16069032392567490984@kernel.org>
In-Reply-To: <179198542200.839288.16069032392567490984@kernel.org>
Accept-Language: en-US, zh-CN
Content-Language: zh-CN
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

T24gV2VkLCAxNCBPY3QgMjAyNiwgTGVlIEpvbmVzIHdyb3RlOg0KDQo+ID4gKwlpbnQgcmV0Ow0K
PiA+ICsJaW50IGk7DQo+DQo+IFBsZWFzZSBkZWNsYXJlIGxvb3AgY291bnRlcnMgaW5zaWRlIHRo
ZSAnZm9yJyBzdGF0ZW1lbnQuDQoNCldpbGwgZG8sIGFuZCBJJ2xsIGFwcGx5IHRoZSBzYW1lIHRv
IHRoZSByZXN0IG9mIHRoZSBzZXJpZXMuDQoNCj4gPiArCWkzY19kZXZpY2VfZ2V0X2luZm8oaTNj
ZGV2LCAmaW5mbyk7DQo+ID4gKwlpZiAoSTNDX1BJRF9NQU5VRl9JRChpbmZvLnBpZCkgIT0gUlRT
NDkwWF9NQU5VRkFDVFVSRVJfSUQpDQo+ID4gKwkJcmV0dXJuIC1FTk9ERVY7DQo+DQo+IERvZXNu
J3QgJ3J0czQ5MHhfaTNjX2lkcycgYWxyZWFkeSBtYXRjaCBvbiAnSTNDX01BVENIX01BTlVGJyB3
aXRoDQo+ICdSVFM0OTBYX01BTlVGQUNUVVJFUl9JRCc/IFdoZW4gd291bGQgdGhpcyBjaGVjayBl
dmVyIHRyaWdnZXI/DQoNCllvdSBhcmUgcmlnaHQsIGl0IG5ldmVyIHRyaWdnZXJzLiBJJ2xsIGRy
b3AgaXQuDQoNCj4gPiArCWRldl9pbmZvKGRldiwgIiVzIEkzQyBodWIgd2l0aCAldSB0YXJnZXQg
cG9ydHNcbiIsDQo+ID4gKwkJIHJ0czQ5MHgtPm1vZGVsLCBydHM0OTB4LT5udW1fdGFyZ2V0X3Bv
cnRzKTsNCj4NCj4gS2VlcCB0aGUga2VybmVsIGxvZyBjbGVhbiB3aGVuZXZlciBwb3NzaWJsZSBw
bGVhc2UuDQoNCldpbGwgZHJvcCBpdC4gV2l0aCB0aGF0IGdvbmUsIG5vdGhpbmcgcmVhZHMgdGhl
IG1vZGVsIG5hbWUgb3IgdGhlIHBhcnQgSUQNCmFueSBtb3JlLCBzbyBpbiB0aGUgbmV4dCByZXZp
c2lvbiBJIHBsYW4gdG8gZHJvcCB0aGUgcGFydC1JRCB0YWJsZSBhcw0Kd2VsbCBhbmQgcmVhZCB0
aGUgcG9ydCBjb3VudCBmcm9tIHRoZSBUQVJHRVRfUE9SVF9DT1VOVCBmaWVsZCBvZiB0aGUNCmNh
cGFiaWxpdHkgcmVnaXN0ZXIgKFJFRyMxMCksIGFzIGRlZmluZWQgYnkgdGhlIEkzQyBIdWIgQ29t
bW9uDQpBcmNoaXRlY3R1cmUgU3BlY2lmaWNhdGlvbi4NCg0KPiA+ICtNT0RVTEVfREVTQ1JJUFRJ
T04oIlJlYWx0ZWsgUlRTNDkweCBJM0MgaHViIE1GRCBkcml2ZXIiKTsNCj4NCj4gUGxlYXNlIGRy
b3AgIk1GRCIgZnJvbSB0aGUgZGVzY3JpcHRpb24uDQoNCldpbGwgY2hhbmdlIGl0IHRvICJSZWFs
dGVrIFJUUzQ5MHggSTNDIGh1YiBjb3JlIGRyaXZlciIuDQoNCkJlc3QgcmVnYXJkcywNClphaW4N
Cg==
