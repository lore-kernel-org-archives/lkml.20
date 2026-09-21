Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11EFB136351;
	Mon, 21 Sep 2026 03:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789962454; cv=none; b=UD03tpLpx9Vr0eqsLrRb/47m9FEr/TzGBVUKfv37zROLY1ZV3aNuZyZpoPMk6lnFU2bcHhOJn+LQ/BecsZOT4yNaIbmRtFlvYq9SXjl9af6DLTMuo95WNR++2Fee7V2XsB7X+hJ8duC8TyNaOdU/2SfJ6rfKHfj4566TXAvqnW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789962454; c=relaxed/simple;
	bh=KAkKDvhFORf2LGfFzHZLo3KGCvvHSMaEiCLfrj0YM7Q=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=gn0vJnWK8/t4LnZzcicHzuHU61CwY9r5lESWKmIp8IKm/G2Pw4jjwrTTDe83C1Q7c/MLUnAxRKbzs88ukZglsnsHqW5u7eUcbpu88UCG4JxY1ahVlNaVHB4EvBTA21N7BYK1hloIY5ueKXiHsDdLZSZDUCDWSkPwpeFVJr65Jiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realsil.com.cn; spf=pass smtp.mailfrom=realsil.com.cn; dkim=pass (2048-bit key) header.d=realsil.com.cn header.i=@realsil.com.cn header.b=VYkMiv7W; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realsil.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realsil.com.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realsil.com.cn header.i=@realsil.com.cn header.b="VYkMiv7W"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 68L3kXoD52233309, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realsil.com.cn;
	s=dkim; t=1789962394;
	bh=KAkKDvhFORf2LGfFzHZLo3KGCvvHSMaEiCLfrj0YM7Q=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=VYkMiv7WfFsI4wqT3xs3o0U0ksuLZwwJC0DCtuStaboWSg5GfFa8fy9PUr69YnGE6
	 TBbYdhYw1NUPhIuA16mYTPve7ghhcbKEypQEIb2QgV14fkQ0+u93gEcec4Z+huhD/O
	 yuJtBrIUEHjRLzK+WfbdFccEf1MhopUwQJETBCI7zL5/SAFrVEJNMwDtJ4wPw+EcWa
	 puLDSBA7+lsECcPxoi9srQrpqZwHsnXGvfJMAmt8vD1KciIbzgpVix/utN8lIIvYqn
	 AO44Rnb4016fdqw2gHTgoDEJrbuVx2kPL0mbfq6GKycrJLmX5LNd1Wq/SQSJy9BA/B
	 4BTU127Ckf2Yg==
Received: from RS-EX-MBS2.realsil.com.cn ([172.29.17.102])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 68L3kXoD52233309
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 21 Sep 2026 11:46:34 +0800
Received: from RS-EX-MBS2.realsil.com.cn (172.29.17.102) by
 RS-EX-MBS2.realsil.com.cn (172.29.17.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 21 Sep 2026 11:46:33 +0800
Received: from RS-EX-MBS2.realsil.com.cn ([fe80::d17c:2fd0:cf8e:635]) by
 RS-EX-MBS2.realsil.com.cn ([fe80::d17c:2fd0:cf8e:635%9]) with mapi id
 15.02.2562.049; Mon, 21 Sep 2026 11:46:33 +0800
From: =?utf-8?B?5ZGo5a+F?= <zain_zhou@realsil.com.cn>
To: Krzysztof Kozlowski <krzk@kernel.org>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, Liam Girdwood
	<lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Vikash Bansal
	<vikash.bansal@nxp.com>, Aman Kumar Pandey <aman.kumarpandey@nxp.com>,
	Lakshay Piplani <lakshay.piplani@nxp.com>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"mfd@lists.linux.dev" <mfd@lists.linux.dev>, =?utf-8?B?546L54Kc?=
	<wei_wang@realsil.com.cn>
Subject: =?utf-8?B?5Zue5aSNOiBbUkZDIFBBVENIIDMvNF0gcmVndWxhdG9yOiBydHM0OTB4OiBBZGQgZHJpdmVyIGZvciBvbi1kaWUgcmVndWxhdG9ycw==?=
Thread-Topic: [RFC PATCH 3/4] regulator: rts490x: Add driver for on-die
 regulators
Thread-Index: AQHdSOfKLIR/IAtYvU2nf5+oMdLbTLbW6X4AgAF7WJA=
Date: Mon, 21 Sep 2026 03:46:33 +0000
Message-ID: <fe92f1275efe4451978fc473cbad39dc@realsil.com.cn>
References: <20260920100501.4091351-1-zain_zhou@realsil.com.cn>
 <20260920100501.4091351-4-zain_zhou@realsil.com.cn>
 <58c3ea87-b7df-4c68-b22b-5102c158d5f7@kernel.org>
In-Reply-To: <58c3ea87-b7df-4c68-b22b-5102c158d5f7@kernel.org>
Accept-Language: en-US, zh-CN
Content-Language: zh-CN
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

T24gU3VuLCBTZXAgMjAsIDIwMjYsIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6DQo+IFlvdSBs
ZWFrIE9GIG5vZGVzLg0KDQpUaGFua3MgZm9yIHRoZSByZXZpZXcuDQoNCkJvdGggcmVndWxhdG9y
cyBhbmQgbm9kZSBhcmUgZGVjbGFyZWQgd2l0aCBfX2ZyZWUoZGV2aWNlX25vZGUpLCBzbyB0aGUN
CnJlZmVyZW5jZXMgcmV0dXJuZWQgYnkgb2ZfZ2V0X2F2YWlsYWJsZV9jaGlsZF9ieV9uYW1lKCkg
c2hvdWxkIGJlDQpkcm9wcGVkIG9uIHNjb3BlIGV4aXQsIGluY2x1ZGluZyB0aGUgY29udGludWUg
YW5kIGVycm9yIHBhdGhzLg0KDQpDb3VsZCB5b3UgY2xhcmlmeSB3aGljaCByZWZlcmVuY2UgaXMg
bGVha2luZz8NCg0KQmVzdCByZWdhcmRzLA0KWmFpbg0K
