Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC12E539784;
	Tue, 22 Sep 2026 11:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790075910; cv=none; b=apgG9n7AegXIWQ3x7Ry6NMeZrLGH2AsvBELxlQZHRgq3wfHbDsFqzbCiqa/1Y0BGfJUoIMn+LjPkE367vx1pKigU9xrtPhDm8zP6kpEuOsVPXyhXzJjPlCc93VPAddrhwGbToiRZiRX4+0A+pwaqeGkpTNwmI/iCcfqxAwDP5qE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790075910; c=relaxed/simple;
	bh=vmHKNujf04ClybYydx3hcwsqBhWnQx+QdwzxdTT29X0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=AcHeeJytG7iGi6DqDhsOrnKCWmoNI7r/TdCe5KxSW66IKLKvQKQ8LgFQ6U8BYoLtUJQ+ewxClDZC3Fon5CoP/K3p4KpPxEHzdNbNS0MLkghWL+Yk6x3NNbMJW9kFnrlciPqxVpS09mV+llJpKAXAX3qn4xAHJkWYXYCsPJPyjBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realsil.com.cn; spf=pass smtp.mailfrom=realsil.com.cn; dkim=pass (2048-bit key) header.d=realsil.com.cn header.i=@realsil.com.cn header.b=gk1OjVpJ; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realsil.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realsil.com.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realsil.com.cn header.i=@realsil.com.cn header.b="gk1OjVpJ"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 68MBHTc943573188, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realsil.com.cn;
	s=dkim; t=1790075850;
	bh=vmHKNujf04ClybYydx3hcwsqBhWnQx+QdwzxdTT29X0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=gk1OjVpJ+qN21rf1ebCj8jVcix41KX4smsXom+CXRJaPmDwGWS3k6Czp4/z6bg4Iy
	 pSo7DJ+eaXCdDWusXF3b+t0LWZjy/ryMOzF/B8TM8lH7y6W3j2ZO6v0xnpNNKVGO0z
	 DRKmcfIvUMy+7dPNk2665VHuan8JdF6x/LwQWp1t+nt82XpN85C2UB1mNsgJ47iFE4
	 G46HV9JwQhFFBLZ4am2Y4MDDF5smjvSbPllECQnKsEkeE5vEPqKIhTjCjs1gXmybjw
	 46slVMOEok+EDLMInWl1XCrWD32dLY51uqpHAtY0Hyt4ZftZw5Wjpgi7HBQC9nUwDm
	 aRiCQx7AJymJQ==
Received: from RS-EX-MBS3.realsil.com.cn ([172.29.17.103])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 68MBHTc943573188
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 22 Sep 2026 19:17:29 +0800
Received: from RS-EX-MBS2.realsil.com.cn (172.29.17.102) by
 RS-EX-MBS3.realsil.com.cn (172.29.17.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 22 Sep 2026 19:17:29 +0800
Received: from RS-EX-MBS2.realsil.com.cn ([fe80::d17c:2fd0:cf8e:635]) by
 RS-EX-MBS2.realsil.com.cn ([fe80::d17c:2fd0:cf8e:635%9]) with mapi id
 15.02.2562.049; Tue, 22 Sep 2026 19:17:29 +0800
From: =?utf-8?B?5ZGo5a+F?= <zain_zhou@realsil.com.cn>
To: Frank Li <Frank.li@oss.nxp.com>
CC: Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li
	<Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Lee Jones
	<lee@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
	<broonie@kernel.org>, Vikash Bansal <vikash.bansal@nxp.com>, "Aman Kumar
 Pandey" <aman.kumarpandey@nxp.com>, Lakshay Piplani
	<lakshay.piplani@nxp.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-i3c@lists.infradead.org"
	<linux-i3c@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "mfd@lists.linux.dev" <mfd@lists.linux.dev>,
	=?utf-8?B?546L54Kc?= <wei_wang@realsil.com.cn>
Subject: =?utf-8?B?5Zue5aSNOiBbUkZDIFBBVENIIDQvNF0gaTNjOiBodWI6IEFkZCBSZWFsdGVrIFJUUzQ5MHggSTNDIGh1YiBzdXBwb3J0?=
Thread-Topic: [RFC PATCH 4/4] i3c: hub: Add Realtek RTS490x I3C hub support
Thread-Index: AQHdSOfLaKpFKLXJIUuzQzqoL4gPULbY2e6AgAGbpWA=
Date: Tue, 22 Sep 2026 11:17:28 +0000
Message-ID: <1453c25fb1fd4db1a928bf83e72187f9@realsil.com.cn>
References: <20260920100501.4091351-1-zain_zhou@realsil.com.cn>
 <20260920100501.4091351-5-zain_zhou@realsil.com.cn>
 <arF6ifEpWAlO10B3@lizhi-Precision-Tower-5810>
In-Reply-To: <arF6ifEpWAlO10B3@lizhi-Precision-Tower-5810>
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

T24gTW9uLCBTZXAgMjEsIDIwMjYgYXQgMDI6NDI6MTdQTSAtMDQwMCwgRnJhbmsgTGkgd3JvdGU6
DQo+IFRoaXMgcmVnaXN0ZXIgaXMgdGhlIGV4YWN0bHkgc2FtZSBhcyBQM0gyWDRYLiBDYW4geW91
IGRpcmVjdCByZXVzZQ0KPiBwM2gyeConcyBkcml2ZXIuDQoNCkJvdGggUDNIMng0eCBhbmQgUlRT
NDkweCBhcmUgYmFzZWQgb24gdGhlIEkzQyBIdWIgQ29tbW9uIEFyY2hpdGVjdHVyZQ0KU3BlY2lm
aWNhdGlvbiwgc28gaWRlbnRpY2FsIHNwZWNpZmljYXRpb24tZGVmaW5lZCByZWdpc3RlcnMgYXJl
DQpleHBlY3RlZC4NCg0KSG93ZXZlciwgdGhlIGN1cnJlbnQgUDNIMng0eCBkcml2ZXIgaXMgZGV2
aWNlLXNwZWNpZmljIHJhdGhlciB0aGFuIGENCmdlbmVyaWMgaW1wbGVtZW50YXRpb24gb2YgdGhl
IHNwZWNpZmljYXRpb24uIERvIHlvdSBtZWFuIHJlZmFjdG9yaW5nDQppdCBpbnRvIGEgY29tbW9u
IGltcGxlbWVudGF0aW9uIGZvciBkZXZpY2VzIGJhc2VkIG9uIHRoaXMNCnNwZWNpZmljYXRpb24s
IHdoaWxlIGtlZXBpbmcgdGhlIGRldmljZS1zcGVjaWZpYyBwYXJ0cyBzZXBhcmF0ZT8NCg0KQmVz
dCByZWdhcmRzLA0KWmFpbg0K
