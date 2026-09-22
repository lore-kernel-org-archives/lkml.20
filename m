Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E03FC3AFCE6;
	Tue, 22 Sep 2026 09:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790068627; cv=none; b=keeNLZe4yHGf5KvRW5WZcaZRN+Ot1PxqGiW8eANhEjbBeJrxYP8lWfCwtBguZAZqUZ2LI4N61+S+nvfa7proYcxNskHyA/tWKWXwimvhDlrxPIFdfTLDKTYTvXIs3/CBfKVrZ/tfDh77FTCB1tv7RTpsJjN26hvVxz9cob0U39M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790068627; c=relaxed/simple;
	bh=COqmZ9blzsdE06kCsTbYVCP8lIXdluTDk5+2o3BtcU8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=PTLyyvlZCnxuljdnTC9UqTVTwY4j2XZJZiYa+nZNrFfdOmtNvulz1nVQmLAVuKYJV+X3xA5HtsCUbA2GtC3Ls1nDIZMpTOpZjQA1o59zkW0yNWZwTtXhaEJWaAmoNb4naEy4SCpUNR+RpjCxRB+zO+/umZM08K+7kH6e8wO8jaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realsil.com.cn; spf=pass smtp.mailfrom=realsil.com.cn; dkim=pass (2048-bit key) header.d=realsil.com.cn header.i=@realsil.com.cn header.b=lZdHcwJy; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realsil.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realsil.com.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realsil.com.cn header.i=@realsil.com.cn header.b="lZdHcwJy"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 68M9G7X503502099, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realsil.com.cn;
	s=dkim; t=1790068568;
	bh=COqmZ9blzsdE06kCsTbYVCP8lIXdluTDk5+2o3BtcU8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=lZdHcwJyA0E3ZPLZ5wfAyCqMN6WkkJ7SmU2iR10JiJsbn+CUCBEHd+rayolAHR0/4
	 ncMtgh54sH3hs5g01OQJ10UsuScjDZqCG6pae8AlHW8oJOFmNwsI4o1oVxf6KX2kR4
	 7eg32c25/vcLGdwsjhvaaoB3eQxg78KsgdcvKYFnYs3KGy2dGj1DkEYsO5fMG6fx5p
	 sXp+ufHs8L+h3/6VgIFzih5V0KUwBvU0fISvqEHRc76NINAJfQ/7K7Yk5vQWwP1Ea+
	 ZQ3v5AiKA+VARmxeCyuwFDdchWyz8lGzB9rBj50Br/RWgYSTOUvh9xQmA4lK0Z9G4O
	 vbEntYTo5bwEw==
Received: from RS-EX-MBS1.realsil.com.cn ([172.29.17.101])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 68M9G7X503502099
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 22 Sep 2026 17:16:08 +0800
Received: from RS-EX-MBS2.realsil.com.cn (172.29.17.102) by
 RS-EX-MBS1.realsil.com.cn (172.29.17.101) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 22 Sep 2026 17:16:07 +0800
Received: from RS-EX-MBS2.realsil.com.cn ([fe80::d17c:2fd0:cf8e:635]) by
 RS-EX-MBS2.realsil.com.cn ([fe80::d17c:2fd0:cf8e:635%9]) with mapi id
 15.02.2562.049; Tue, 22 Sep 2026 17:16:07 +0800
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
Subject: =?utf-8?B?5Zue5aSNOiDlm57lpI06IFtSRkMgUEFUQ0ggMy80XSByZWd1bGF0b3I6IHJ0czQ5MHg6IEFkZCBkcml2ZXIgZm9yIG9uLWRpZSByZWd1bGF0b3Jz?=
Thread-Topic: =?utf-8?B?5Zue5aSNOiBbUkZDIFBBVENIIDMvNF0gcmVndWxhdG9yOiBydHM0OTB4OiBB?=
 =?utf-8?Q?dd_driver_for_on-die_regulators?=
Thread-Index: AQHdSOfKLIR/IAtYvU2nf5+oMdLbTLbW6X4AgAF7WJCAACgwAIABxRsw
Date: Tue, 22 Sep 2026 09:16:07 +0000
Message-ID: <d04e4ab9469c4d0fbb0425030acc2e9f@realsil.com.cn>
References: <20260920100501.4091351-1-zain_zhou@realsil.com.cn>
 <20260920100501.4091351-4-zain_zhou@realsil.com.cn>
 <58c3ea87-b7df-4c68-b22b-5102c158d5f7@kernel.org>
 <fe92f1275efe4451978fc473cbad39dc@realsil.com.cn>
 <86d282f5-9221-4a62-85db-2d46524dd817@kernel.org>
In-Reply-To: <86d282f5-9221-4a62-85db-2d46524dd817@kernel.org>
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

T24gTW9uLCBTZXAgMjEsIDIwMjYgYXQgMDQ6MDc6MDJQTSArMDIwMCwgS3J6eXN6dG9mIEtvemxv
d3NraSB3cm90ZToNCj4gSSBtaXNzZWQgdGhlIF9fZnJlZSwgYnV0IHRoZW4gd2h5IGRvIHlvdSBk
ZWNsYXJlIF9fZnJlZSB2YXJpYWJsZSB3aXRoDQo+IE5VTEwgYXMgY29uc3RydWN0b3I/IERvbid0
IGdyb3cgdGhpcyBwYXR0ZXJuLiBTZWUgY2xlYW51cC5oIChvcg0KPiBkaXNjdXNzaW9ucyBvbiB0
aGUgbGlzdHMpLg0KDQpUaGFua3MgZm9yIHRoZSBjbGFyaWZpY2F0aW9uLiBJIHdpbGwgaW5pdGlh
bGl6ZSBib3RoIF9fZnJlZSB2YXJpYWJsZXMNCmRpcmVjdGx5IGF0IGRlY2xhcmF0aW9uIGluIHRo
ZSBuZXh0IHJldmlzaW9uLiBJIGFsc28gcmV2aWV3ZWQgdGhlIHJlc3QNCm9mIHRoZSBzZXJpZXMg
Zm9yIHNpbWlsYXIgY2xlYW51cCBpc3N1ZXMgYW5kIGZvdW5kIGEgY291cGxlIG9mIGZ1bmN0aW9u
cw0KdGhhdCBtaXggZ290by1iYXNlZCByZXNvdXJjZSBjbGVhbnVwIHdpdGggZ3VhcmQoKS4gSSB3
aWxsIGZpeCB0aG9zZSBpbg0KdGhlIG5leHQgcmV2aXNpb24gYXMgd2VsbC4NCg0KQmVzdCByZWdh
cmRzLA0KWmFpbg0K
