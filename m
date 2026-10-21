Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.227.123
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792595111;
	b=Zq3SCtR1bnmkxPD6Kp8WqXszAAtI/0EifVMeaHFQze22jgRhaQyEbaJYZo3rqV+T0iAn
	 YE7JOnZJ0Bux4hYj1GR6JW2qWO8MNP4tCDffwaqsbxJazOUyzLNFDhT4tEgk36ihvn1o0
	 /qu3H48y+1Qp8mdCz3ngSGmWr+pWAAX4F8MybRjBaN38npehTFp0P0CgceVAaarfNgQas
	 /uVhxDMEdJJBRwALucwcdDoikZx/VKfVINpqVe6js52gBy66U/gnoZ7IgG/HY3+1siuMA
	 8+lqf0685q+kSQ3IJuwyh4PzSS0CmNFt0Z2PUR4FyCpo6Gk6BMXNrtiPhK02jCZjPcg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792595111;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 msip_labels:x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ld-processed:
	 x-ms-exchange-senderadcheck:x-ms-exchange-antispam-relay:
	 x-microsoft-antispam:x-microsoft-antispam-message-info:
	 x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=CR3J+h/MwLeEglPrT0N300NMTP83/bpEjMXK9ZttVNQ=;
	b=q2+X+RCASQ5TqfgfmNqLx0/RNjqOnPtvM8UQPMd4XVcE0iNkcAWGF6ZedeGjpI/SB8cn
	 ly43cINSfaiX+YSl0OSjBdIK7GYx8m3sYk1ODM3nvya6lU8NJR8ZmDhfXHh7AwvwR0KDF
	 Ww0X/Wy/9WZ7zqnFPNXVZnc5qEeNxNVfLxniMx7/rj2Qm98PKbddC5mh54RBYxn3ThwJW
	 iGVurxNOJ93E1EGuoYY/gZHME4EA0NbF4WvsyOLveSBb1qaI7SlMPAU5MVSgOcCCcUlyL
	 Gkq/mgu3MA7Hha8nH50ZmRVe98rCWnJ6rDjD+eVTtE/DLQ07ZPe4fUgYlpRMueXKodA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=siliconsignals.io;
	spf=pass smtp.mailfrom=siliconsignals.io;
	dkim=pass header.d=siliconsignals.io header.i=@siliconsignals.io header.a=rsa-sha256 header.s=selector1 header.b=dB9yFqHj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.227.123
Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazon11020123.outbound.protection.outlook.com [52.101.227.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1F7C606A319;
	Wed, 21 Oct 2026 15:05:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1F7C606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=siliconsignals.io header.i=@siliconsignals.io header.a=rsa-sha256 header.s=selector1 header.b=dB9yFqHj
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QkDcpMzSL8a05dTCOiRgJBMWzWqkCh8GDmWFw7zFArCPwJPDawhEemjKno46y+rAlQmDzf8khONNaRJ/4x2fmv9kBOWapf4RxcMZJQCzz3Je45ARdO9y92yH8AB3v8zjxbFfQwxJaeor4s1tU0KtY3o3iPBOJ6VVcYjvz0h+DJtfRGCnktFbMbMMbtUX+iUKSzFeOTy1Iu7pCkF5y57G4bnNjCZl0Hf+wWeeUZDQPt6lqF2L/DAapwIAa3rtO91vJKg6FvRUeBBpzZdo/dt4mQdvcqXoRoVI0OYD/oDYDD9Fg67qvIAv9WCvq0fmdZq8L2g7/q6YMAsO73Bg1ZN9Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CR3J+h/MwLeEglPrT0N300NMTP83/bpEjMXK9ZttVNQ=;
 b=KpPqQ3wM1N9rs2rFYl0G4j2r9E1DE5N/vbcApqHtRO9y2OMqfkHR1Tl2owPJY5yf7qIEhBfEYSFQjwUHPD44pevGRJ2Q0I0dnfJYKA3XVCjOArH542SHEnKzNVaL7iKVal+YfnM6ppbGrJEnwpv2vu9yow5XYMCtkeS/RA4MyKcZZ1f07bmHZ+rLz72jRHLjl26lmDf8bVt2kdUA/esc2p3zJpbQ1hfgJrdEi96hIRQsPk+9w0FjIQSs1lmWYKSl3g6iUFYLC6ll8iPOnC6JiEnv2z1/rFvexhbQDr/5HZcvysvjI953cjkxPYEZrSXu0YJfoj9XTfvXPznUr7aSOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CR3J+h/MwLeEglPrT0N300NMTP83/bpEjMXK9ZttVNQ=;
 b=dB9yFqHj7zHfGDACD53TqZa+dqZcJhmIE23pWcnTgjGsqh6UJLCxycuXPIpb2VRb9A4CW2+BgHiWKnZJX1IrPKGjRDAD9HBnjspYKuEGR5RwEsZvr+dKHDMXod248GyeANRZjtgMqf9MIOSvS90yVA2KMAorQx08OZ8U2V6P6899zkWTd+7rAzu8ba11FC5JuDVtKreyp5qjNybWj12m2ycdrod106HFFc/uVl4UZpOEkftxQaI7ZbD/yQksnLxe8d4WgGvtzYjgoeO/7e0HPf5ib4h22UUOBDAJaSqJjsGti+zUQhKT4gbDg4EcqgbYfBju4zEru092yYx3nrb/VA==
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by MA5P287MB4174.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:162::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.14; Wed, 21 Oct
 2026 15:05:06 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%3]) with mapi id 15.21.0546.012; Wed, 21 Oct 2026
 15:05:06 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus
	<sakari.ailus@linux.intel.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Kieran
 Bingham <kieran.bingham@ideasonboard.com>, "jai.luthra"
	<jai.luthra@ideasonboard.com>, Philippe Baetens <philippebaetens@gmail.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 2/2] media: i2c: mira016: Add driver for Mira016
Thread-Topic: [PATCH v7 2/2] media: i2c: mira016: Add driver for Mira016
Thread-Index: AQHdXKllr/0dSCh/EUCn7284MR8GGLb/+GFQgAf8/gCAACjPmA==
Date: Wed, 21 Oct 2026 15:05:06 +0000
Message-ID:
 <PN3P287MB1829917DD2DAD9938F9E80658B662@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
References: <20261015-mira016-v7-0-828c931c5550@ideasonboard.com>
 <20261015-mira016-v7-2-828c931c5550@ideasonboard.com>
 <PN3P287MB182974880896B859770FEDDA8B9B2@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
 <atiuUGeAL45qkLEX@zed>
In-Reply-To: <atiuUGeAL45qkLEX@zed>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB1829:EE_|MA5P287MB4174:EE_
x-ms-office365-filtering-correlation-id: 7c6300cd-b5ee-4ca9-9ca3-08df2f84b0f1
x-ld-processed: 7ec5089e-a433-4bd1-a638-82ee62e21d37,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|376014|7416014|1800799024|366016|38070700021|56012099006|4143699003|261009223027099003|10067099003|18002099003|22082099003|6133799003|3023799007;
x-microsoft-antispam-message-info:
 GsTDchw2b8uq761rwcM0aeq5I+B4UfBc66ViQ+ogaSQRiE25P/ZNEt0X1vG/4ayktW3Z3oLIMV0aiTnUMkr2arwZtv5fveVSeccKD0g4Ryj9jquf+aTnGbs6WzGjPPTc2m27K86L8mXuaKg3Jg5DD7H74X1gWKvselmLlK63IV3Y24bIj4aYzb9MZAshydSk8/TY2uUjm5oIlwZJV3Owky0QALcup6mR96b8gDZAwv6+DTBMQO4JADEHCAbgnHEItgqYR3D0iV3E9ZvXXDije/k3cUNp+U/crK0UZDQICOCwdLOlMR/N7KQOSnGMpUlr94+ZVrRd53yLY+Ebb+E9wfSs42Bbt4y+nOlwrJdKH1oL5fdR/es7al3HEZz60jGdqk6Nww7DLw5Wb0JUvvgAWQxEte/PzpAJzz9WirwWELiW/ifvHQSOZtPs1ww6ZYmVJU6b3K2JpsuzYFS2j0xUPel/JijwSOpqWbBhJKiFEP6iN5BLaRJmWQo7+UaCYn7ixftM1+M/7vooGfYE9JgRl8g3tX5nEuY5wFRxOYzKBNw5gLLEhEyon6waPinLa2FumPmQVU9eyV9ZRcOsl//8GdV4Ll7TgxeOEb8sqfyJOl5og5O+K/iCaejq6NMnl+2pIOh7O2FmSfqr4Xw49NR2uvghsmH+iOetO6/ozvn3vsRdXrafhgSbLoziAfhlrfA24QmwctFcpI2oDF3waTziGofRFECyeWFAHvjY8U7MPT4=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(1800799024)(366016)(38070700021)(56012099006)(4143699003)(261009223027099003)(10067099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?WWrAT7NSN5esubXhpAqH3zANGhSO1so9F6o7T1sYoxAy23jsUfTOrseaYM?=
 =?iso-8859-1?Q?tSeTaggVInXRlNc3vc2POs51BnSgiIUCPygWqnd5A3uVyewNzDiYDXl6C8?=
 =?iso-8859-1?Q?57rqAAP2Q9GpJ9vJNqGH8WA5X8w+BkgnHOegC/wsGxLqAfYHG522GlJkDQ?=
 =?iso-8859-1?Q?zygzrbQGFh+8LgoytfID0NDWLQYZHlk0m/j29tjBceL/dtpBH53tx8+FUO?=
 =?iso-8859-1?Q?xLm78gG0AUMjh3lBJL+cHFp0hkVqmP90UDwL07AGfLe80ZVCJFSW9IWi0Q?=
 =?iso-8859-1?Q?7ztv0cfdpIqVL2op/s+l2wUdCJEOolWslqZBp2RgW5G7ju+vuNl4EZxCdt?=
 =?iso-8859-1?Q?jxl8UR2/PpXlGSjadRrY/gRfeGvPYnToVVQbMqueggFPVpV7WD40TagQsy?=
 =?iso-8859-1?Q?wtADh/Ojd18yeInYaj8curZ9RAhliWPpjc1reehvnn7bf12Qt+NS4Qy2/+?=
 =?iso-8859-1?Q?L2F2fP+49Y4yOQ3tS58EzDDCcpNkkx4pi0HaIDklFvxsqd1PtFcBfHyBaP?=
 =?iso-8859-1?Q?+lz1xWaKDmaXjoCXh+kEKG6jtf0tFWlHOK/X3AygQRbyLHb4rvgxAb9mF7?=
 =?iso-8859-1?Q?1m0p9ssSyRzPewTDwa8BtXRAFG4haW1DbeuhzByk70LVKHVqx+rJvrTanb?=
 =?iso-8859-1?Q?1CrNsoZc+7gJiY1t63bY5cPbU5GoIoJJWZN2lh55DbZQFELmHuNk0WN7EF?=
 =?iso-8859-1?Q?2yMMoGeYhYChc/A0QizxkPsPl1P+vLVrb0muudgWJLG8/GcLqqhAVmfl+e?=
 =?iso-8859-1?Q?67IZr42DzGUjLvsQqlKLHIx9mRhnrx/EfLaUldq29HLAxHKMfaIqGLp4/m?=
 =?iso-8859-1?Q?sJK8zucScROeXlD/3ErW+xgvclABIXDDp2bYf5bsjDmFrSFx956Umo4fqL?=
 =?iso-8859-1?Q?uOmAm3khfcr1np28IKF+C7nh4MqvDspSzDpEcNciHyJ2TwXHlXxxcRawih?=
 =?iso-8859-1?Q?IAGoKNDfdfPk1HDaRElk6IPdf8GEJh96cE9MaNmiuM4jl/mT1GS/P0lFwM?=
 =?iso-8859-1?Q?mpBpZKXiZnllOJsknjVuSEqdRVo/aAH7DmAOIex8xfxhW1XwM3yty3WX3J?=
 =?iso-8859-1?Q?V5VpKEDg8zSlVMYsRSiym6NV1+GLtu/oxb2TFklDgcv+Ux3yzfICPLZamW?=
 =?iso-8859-1?Q?qr5D4K8kleWNyW1Hb7OqpscGv7yJAo1sIgB9Ipe+LKW1jxaCw2se5kQsje?=
 =?iso-8859-1?Q?sKWZsw4qUU5CYyq9GRoZIm6PYu/l5NeLupP7+bqiY0IYtkUi5d637Jl4ak?=
 =?iso-8859-1?Q?8usEDgjFhWSjkHa/qH+MBNu9nLMPA3J64KgEw15GTFiQa4jNkZbbsb5Ani?=
 =?iso-8859-1?Q?QbWB8WESw0I0uZfPvcsMAld9n5314uncbXFc6ODn7YLyyF7uQ2onPF7/UX?=
 =?iso-8859-1?Q?Uq3vE78O4jClY4We4qX0Dd3zaH92ZsxvJ5PFRCBPrvPR+ljCbziL4m+HMY?=
 =?iso-8859-1?Q?agMCiwZppaSCZasHnXU170Ht5eoWrH1CjyLL+F9QDTx+EYVsgT2zfEUI2F?=
 =?iso-8859-1?Q?Kfpb0Kksy8X9s2KwgviHNVGI7usBEGe0cR9uOnWY+Cj2MtL6qpyxut8Cm5?=
 =?iso-8859-1?Q?2RsVoY3fzVesngnsIc/FzamSklKrvoW/suOU+QMCnDk50HPZcVwoiksgYD?=
 =?iso-8859-1?Q?eVx+wtvr1xvEh6s9esg+AJAhcnXBLub3mXqhuOY8+d3z6k26Ftm59q7rn5?=
 =?iso-8859-1?Q?y4/u1HNpzj+PF4RJr00DIIYDCUYfcvUHWifQqejHByMbT4Ym8jVtPB/d8N?=
 =?iso-8859-1?Q?uM34gD89yys7szFZ22mw7Bi+9W+64IYzXVE2IQGg5LmbkrocPSLijcDpSC?=
 =?iso-8859-1?Q?KWhEiW73DnVK/ycH+inPWuNXi0hHfjI=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c6300cd-b5ee-4ca9-9ca3-08df2f84b0f1
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2026 15:05:06.0164
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sN4PWVAvLuPtSB6UQ7UDLUevUJPEEDXxfqFhJTWaxSoaApYZIgzv+Y2LfPs5cSL96VHyKLrsyvBeKPvbggZRXnlA6ArrKhTWWO9SMopvgMA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA5P287MB4174

Hi Jacopo,=0A=
=0A=
> On Fri, Oct 16, 2026 at 10:29:51AM +0000, Tarang Raval wrote:=0A=
> > Hi Jacopo,=0A=
> >=0A=
> > Sorry, I overlooked one point in my previous review.=0A=
> >=0A=
> > > Add driver for the ams OSRAM Mira016 sensor.=0A=
> > >=0A=
> > > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>=0A=
> > > ---=0A=
> > >  MAINTAINERS                 |    1 +=0A=
> > >  drivers/media/i2c/Kconfig   |   12 +=0A=
> > >  drivers/media/i2c/Makefile  |    1 +=0A=
> > >  drivers/media/i2c/mira016.c | 2358 +++++++++++++++++++++++++++++++++=
++++++++++=0A=
> > >  4 files changed, 2372 insertions(+)=0A=
> >=0A=
> > ...=0A=
> >=0A=
> > > +       struct {=0A=
> > > +               u8 n;=0A=
> > > +               u8 m;=0A=
> > > +               u8 cp_div;=0A=
> > > +               u8 otp_gran;=0A=
> > > +               u8 gran_tg;=0A=
> > > +               u8 lut_del;=0A=
> > > +               u32 esc_h;=0A=
> > > +               u32 esc_l;=0A=
> > > +               u32 esc_period;=0A=
> > > +               u32 byte_period;=0A=
> >=0A=
> > nit: pll.esc_period and pll.byte_period are never used, so you=0A=
> > can drop them.=0A=
>=0A=
> They are anyway calculated based on the PLL configuration and will be=0A=
> required to support multiple link frequencies.=0A=
>=0A=
> I wouldn't remove them if nobody really insist=0A=
=0A=
Okay, let's keep them for future use.=0A=
=0A=
> >=0A=
> > > +               u32 data_rate_mbps;=0A=
> > > +       } pll;=0A=
> > > +=0A=
> >=0A=
> > ...=0A=
> >=0A=
> > > +static int mira016_set_ctrl(struct v4l2_ctrl *ctrl)=0A=
> > > +{=0A=
> > > +       struct mira016 *mira016 =3D=0A=
> > > +               container_of(ctrl->handler, struct mira016, ctrl_hand=
ler);=0A=
> > > +       struct v4l2_subdev_state *state;=0A=
> > > +       struct v4l2_rect *crop;=0A=
> > > +       int ret =3D 0;=0A=
> > > +=0A=
> > > +       state =3D v4l2_subdev_get_locked_active_state(&mira016->sd);=
=0A=
> > > +       crop =3D v4l2_subdev_state_get_crop(state, 0);=0A=
> > > +=0A=
> > > +       if (ctrl->id =3D=3D V4L2_CID_VBLANK) {=0A=
> > > +               s32 exposure_max =3D crop->height + ctrl->val=0A=
> > > +                                - MIRA016_FRAME_INTEGRATION_DIFF;=0A=
> > > +               s32 exposure_def =3D min(exposure_max,=0A=
> > > +                                      mira016->exposure->val);=0A=
> > > +=0A=
> > > +               ret =3D __v4l2_ctrl_modify_range(mira016->exposure,=
=0A=
> > > +                                              mira016->exposure->min=
imum,=0A=
> >=0A=
> > exposure->minimum isn't updated when a format change alters row_length.=
=0A=
>=0A=
> I don't think the min exposure time changes with row_length=0A=
>=0A=
> It's actually computed as=0A=
>=0A=
>         mira016->timings.min_exposure_time =3D (151 + mira016->pll.lut_de=
l)=0A=
>                                            * mira016->pll.gran_tg=0A=
>                                            * mira016->timings.seq_time_ba=
se=0A=
>                                            / HZ_PER_KHZ;=0A=
=0A=
You're right that min_exposure_time (in ns) doesn't depend on=0A=
row_length, it only depends on the data rate.=0A=
=0A=
My concern was about the control value, which is expressed in lines:=0A=
mira016_nsec_to_lines() divides by seq_time_base * row_length, so the=0A=
minimum in lines is 7 with row_length 1062 (Y8/Y10), but would be 5 with=0A=
row_length 1504 (Y12).=0A=
=0A=
Best regards,=0A=
Tarang=0A=
=0A=
> And all the parameters used in the computation depend solely on the=0A=
> output data rate which can't change at run time=0A=
>=0A=
>         gran_tg =3D DIV_ROUND_DOWN_ULL(data_rate_mbps * KHZ_PER_MHZ, 1500=
);=0A=
>         mira016->pll.gran_tg =3D DIV_ROUND_UP_ULL(gran_tg * 50, KHZ_PER_M=
HZ);=0A=
>=0A=
>         mira016->pll.lut_del =3D DIV_ROUND_UP_ULL(7000, mira016->pll.gran=
_tg) - 140;=0A=
>=0A=
>         mira016->timings.seq_time_base =3D 8 * HZ_PER_MHZ=0A=
>                                        / mira016->pll.data_rate_mbps;=0A=
>=0A=
> >=0A=
> > Other than this, the driver looks good to me.=0A=
> >=0A=
> > Reviewed-by: Tarang Raval <tarang.raval@siliconsignals.io>=0A=
>=0A=
> Thank you!=0A=
>=0A=
> >=0A=
> > Best regards,=0A=
> > Tarang=
