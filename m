Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.42.97
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794444063;
	b=F7pDTlA5sIJW5TkX+Gk28lKK/p01SPThwwzpOQhaEAVcrv7AOBs/9GZqmfj+evA7CvNh
	 dPiJfdmKWXbRnlxaqgn0kIRku0t+sA+QjmyNKqu6d9NNzht5UxW5nw4rqBh+mt/YpvIvl
	 04TBG2HRSyRPN/+mvbuYpQNN8EFJyqCj89qCtE1rEQttvN/qpiDdHmUAFTlMWwG5+U9tI
	 LjYLGtwAhcn9xAcwngTb8D3w6iWTdZxMf15LyYWoaioT7iRWyEt/7HLod5nqOtQB5jeQg
	 BUu0l+K1B62YD5udFc6t7WcQge/C8oUZSgQnZU4C2T5/RXViILspDD1EqUI/AiKiiZQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794444063;
	h=DMARC-Filter:Received:Received:From:To:CC:Subject:Thread-Topic:
	 Thread-Index:Date:Message-ID:References:In-Reply-To:Accept-Language:
	 Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
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
	bh=IUORlH4wSM73f+s8FpTqGjOSKQteQEhD9QilkzcfCjM=;
	b=PVXhClnoG7nc+9CbMHB3UOONDTsFJqsyGAjD83lqcVIvn0/s5G/csgSEyhEj/TpUHosg
	 XPVNa/hYzSy7cHy7W8GvSdHX0f9SrZbBLhkqDeK2mc+4Oi0V97G3Cnk8n33y7YG2kawVv
	 uByAlKIE7tN6FAM/A8dOSexiepE+bNpdRiRv+SnUTPo1meHUc8GsPapiOSOXdziNKM1Rh
	 j45CFWpDS0WJ4ktzP1jlp1TN499sWX9/XxZceHHdZ2JO3HijH7kRdCR+W77DdhOapYrjm
	 1ea1VKkbd9HGw3rI3J7CeVJ85TkPZi4G1peXdICLU9aGa2zTMp0rMtVnF9gg18FxtWA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=irondevice.com;
	spf=pass smtp.mailfrom=irondevice.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.42.97
Received: from SE2P216CU007.outbound.protection.outlook.com (mail-koreacentralazon11021097.outbound.protection.outlook.com [40.107.42.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83E61606A31C;
	Thu, 12 Nov 2026 00:41:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83E61606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=irondevice.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=irondevice.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VIGy6RCT51qZxofQtWjFbkWKFDja2N5/7fPROgLoSj8bsTZKtqFy5fVyqxz1soeuxxvD7R08ahZqddqd9v1nRkG6sGHjjrgoqYPxV/0ngNWnDwqVNcAEtAEQVtxjde8h/MVvqj+KTR334kA7NvLizqk/WLb79u6xcxIJ0d2Le9batc7L0XOMpMaH/oXJguz8Vn6LSGDRcgQm/RuFk4E/hGh03KizHvvS+tNPENMxQ9SUC47GizVYp9zzMd28FZq/O4bgkDW39lAs0rzh6x6LQ7NS9HhyISPfupEyXpB2kZXCM9GcC5ORpW3tP8LdlzJZ6mIMuIj+xYemBsARgMHO0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IUORlH4wSM73f+s8FpTqGjOSKQteQEhD9QilkzcfCjM=;
 b=oN7nUbLoRR7ZxyIkIlv3JATKXnfjAg2CWA3yPCn2WgNnOjabiXJZMCgEx45ERc6ugmWnEOlX3ZRv4fkxh1l68MH2cnpcpeMPZCGcDWygtAACeDaWYsWevGl44tMn6k7JneXZImhLjF5jlVqcoZm/ln6dDMjbqrNXZygTuMhkq4doTHTagUy2dc0VBBGC11VU27jRPflLhSB6momtHGD46lPAdRYbEvOPOmbs+i7bqkLGZ8Qfo0dAfQfFmw4KxY4lfbq3Xu0F86dU6nfJD+dcTDHZ6XiBDe9yUvW9osGRYlGijx4ZWcHc2r3FlOdwv6TTrIFTIfQHKSrZK0zSQ3d7KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=irondevice.com; dmarc=pass action=none
 header.from=irondevice.com; dkim=pass header.d=irondevice.com; arc=none
Received: from SE2P216MB2423.KORP216.PROD.OUTLOOK.COM (2603:1096:101:1c6::14)
 by PU4P216MB1353.KORP216.PROD.OUTLOOK.COM (2603:1096:301:ab::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Thu, 12 Nov
 2026 00:40:57 +0000
Received: from SE2P216MB2423.KORP216.PROD.OUTLOOK.COM
 ([fe80::98a8:f50c:a9f8:3073]) by SE2P216MB2423.KORP216.PROD.OUTLOOK.COM
 ([fe80::98a8:f50c:a9f8:3073%5]) with mapi id 15.21.0615.008; Thu, 12 Nov 2026
 00:40:57 +0000
From: Hyun-Uk Son <hyunuk.son@irondevice.com>
To: Mark Brown <broonie@kernel.org>
CC: Liam Girdwood <lgirdwood@gmail.com>, Ki-Seok Jo
	<kiseok.jo@irondevice.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Jaroslav
 Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2 2/2] ASoC: codecs: Add driver for Iron Device MA5311
Thread-Topic: [PATCH v2 2/2] ASoC: codecs: Add driver for Iron Device MA5311
Thread-Index: AQHdZfYyQ2ir7g3zC0ypZRNyOeIsW7cS0hsAgBJsJ0CAAiq/gIACQcBA
Date: Thu, 12 Nov 2026 00:40:57 +0000
Message-ID:
 <SE2P216MB24238E5F5EEA95FCEABCDAF4FF702@SE2P216MB2423.KORP216.PROD.OUTLOOK.COM>
References: <20261027093232.859755-1-hyunuk.son@irondevice.com>
 <20261027093232.859755-3-hyunuk.son@irondevice.com>
 <179318672062.199157.7461931531075403104.b4-review@b4>
 <SE2P216MB24230E7B98CD3F438E23E869FF722@SE2P216MB2423.KORP216.PROD.OUTLOOK.COM>
 <40646ae6-f6be-4408-aefe-521fb0ea9bee@sirena.org.uk>
In-Reply-To: <40646ae6-f6be-4408-aefe-521fb0ea9bee@sirena.org.uk>
Accept-Language: ko-KR, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=irondevice.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SE2P216MB2423:EE_|PU4P216MB1353:EE_
x-ms-office365-filtering-correlation-id: 487d2231-bd1c-43ce-25cb-08df40559dcd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|376014|7416014|366016|1800799024|18002099003|22082099003|6133799003|261009223027099003|3023799007|4143699003|56012099006|261028144727099003|261102123227099003|261026121527099003|261022075727099003|261021123027099003|261021121427099003|261022105027099003|261026140227099003|38070700021|10067099003;
x-microsoft-antispam-message-info:
 YTj+LDQMjF0MBWTFhk1oDpsPdkvqQYgHh/eHPHoHBDLu47fUn41SE8Vo16pRIkiMeObuT/FN+UHHO8W2FOORa0ofhV69FIagOhIUo+E82qtL4ZuKmcpeHZvqhKQFjYAd82oFSTTO4jRqtZy16Kvb82oV3w+nsDuTXJ5JuwXbbFAiZKqg0DnTQ3Ry2Z+AXWwbv7CzGaMGYOCMkODoQCZJb+Znjn4DGR0fUIQfcfftCPj2eOzSO8hGvfNteMH04qnJ6jPHURGFQf56xYMYP3vG+CORNcNCLXpnQNvjOvdXGscXnFu2CkWM0P8OFocujSS82sgJ9j6cKESgkVSYVyhVBF0NBjiesxHH/t/qwp3FoR4zktIkqV3gVQxAs5xKV14n5TjO6CnMnDim81b8+slbHqA1UqRCZOU+6PN8GKrXA6a6r7fbriVujchQQR/QUlfTBpq9p+aOmoXfwJQykyH0vNMnXxKGGl6yJ0yd7SmIqv9YV/pcXEP8ZqdxoBFmMDiTpgbOlhag0YkXAylRDdO2T5edEKx9+1MI+ohw1yiNVXUG2K8wE1tLCWTqTD3k8CZ8SiLq9sbhH6LqJIc+y2WSHFUmNqDtkPy/nAjDgV7rPbA73aw5aymrr5vzASANfKBozotcBbigO7wdx60f6T3P5SsTtCKV0N12/suDm7Gho2LlCDFJxSSV6zX3tZFObRXUEQt9lNvCnZC/wGWQYhLAqlLfqv40ybXqZl02DTGTwLY=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SE2P216MB2423.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(366016)(1800799024)(18002099003)(22082099003)(6133799003)(261009223027099003)(3023799007)(4143699003)(56012099006)(261028144727099003)(261102123227099003)(261026121527099003)(261022075727099003)(261021123027099003)(261021121427099003)(261022105027099003)(261026140227099003)(38070700021)(10067099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?cmBhzYrxI9vZR71KSCH9rklL/uqEaFnQv3DUVvNRRIydl0IEXEze6jgcXJ?=
 =?iso-8859-1?Q?QK9zJClkTpIH1Oi2EVu3dJjKASHs+2Iv+md66M3jGbEbJqRdznW2mjyeos?=
 =?iso-8859-1?Q?pbJ8YlzGDsSS9nHoDGNv0GQRPB7klC10AqaRLlVqyEwkitTY1XJsdgnLqd?=
 =?iso-8859-1?Q?46lvhwk1sevJh8cB9dbmzEOvTBYswvb+jx4tmB9qaGSP5V902t4o3aRcp6?=
 =?iso-8859-1?Q?UA3aC4u/3iC1AnI+tFA7tmHTxgtORGpqfKKo0eOfnVkON7xmsbbS3mN5Vh?=
 =?iso-8859-1?Q?w3cuLJuUVExLK+LLHxmdzyY1VQtqs36PZQmN+EHmT/kzgVkK9sw66przRn?=
 =?iso-8859-1?Q?Ml8R43cWzOD3i7zJOtGh2WyXes3QU8YxYyZ8HihthTGc6AyFQQl8RH2Hmz?=
 =?iso-8859-1?Q?73JSaWKvmKkms2r12kzFkrGvoclmgHHQd01Td7gtQe1soXvukTgJu4sVCq?=
 =?iso-8859-1?Q?RaxCBF1bXq8vLtbgkfgnJztBiBVE8KEchyg1+07IA8suubRzc3Rop0Wru3?=
 =?iso-8859-1?Q?ep8/hHV7P3Myq2aAWla+S6zTZsdRBqcgRSWk/FajMZrGvTz0/0nJKMiZ4S?=
 =?iso-8859-1?Q?z40qkl4jgP5xIoA7s2SYMPALNAOfQeNdFhbwsxSeTbpvWeD5ShZRiKhRQU?=
 =?iso-8859-1?Q?sqO0KdmR4gJ09vL6x3ePY7nMBv3DRKMnvyYDpyI3H06pte+z4x+dp80olK?=
 =?iso-8859-1?Q?dRvFn7qKd9zZq+zbmmaFzfqizajLPLnLtZOpcDjjJwJQNFVvjnE5e0010E?=
 =?iso-8859-1?Q?9IJU+xWlQYB20yVz9Gt3hWYc9MfThi6LppJvevcxghQfrqgcxTekVovgPk?=
 =?iso-8859-1?Q?NU4S2xMmg/fUUfJsKfYVVHONKOyS09Xih8AMSE6udQ4AaqZFs0vQxlqNPG?=
 =?iso-8859-1?Q?X6sMw3cUQCGapo+4a3hKEAxiCdPlye8FquJcaIAjemfCpxWnFHlR6TnSKW?=
 =?iso-8859-1?Q?KFt4WPt2RCr2hEN4leDQP/yrHKmPWX2wy/Eve6L9+ZhBZ0FYSqDBRotLaO?=
 =?iso-8859-1?Q?GQusbUtciVTtudbgCzsKX0kS0KZgfJudwcBrZJoVgGKcO0w6DnTCEe4XD+?=
 =?iso-8859-1?Q?LKMuZ8yvOGFkH5BXyGfSgASJBc7KzylAJlz2grd+lTbJYR+bXPocxKISj4?=
 =?iso-8859-1?Q?+8SRdQoBB6YZEyd0bHTuDq3eowAey/w8+ueJ2aSdKdAlmp0DPI0kM3qlPs?=
 =?iso-8859-1?Q?N/Tl/7AQgSF6dKdcG3HLFAVz9T9tCil9kLrFL13oBek/m+mBgT0ng5QKde?=
 =?iso-8859-1?Q?W2e/+CLT87lVb/fxc8oQrRQLtY7NhlWLqE9j88aMcqOMGGRyW2IyTpYknY?=
 =?iso-8859-1?Q?mFcpqRjCqxlp5w4Kcul/dsYM7RyFaAbmAq4gD6oGKJYR53O32sMUuW0ZuI?=
 =?iso-8859-1?Q?DoSgx1hvsutL/tVEtMFfgJm63oiKt7044nmwLi+1GI+DhJAqhLPWDBSEbG?=
 =?iso-8859-1?Q?mVHid8adEXAwGFsRFTMPMxMLcWlS3zYnvzyQ05nVT7gU8e72uwQW9eIyD5?=
 =?iso-8859-1?Q?wzy7jCUwO25hUixCOo79RHKbfbjG5ubINjw4woLjfOVlOumlP8sa46KANp?=
 =?iso-8859-1?Q?qfYUtk/rTV3g77kVADiDtCP73O8Q3rwCmNnu1wpYKagbaYMNxHwyRa4Jb0?=
 =?iso-8859-1?Q?YH0z01tkI09Rllol47l2W3BNvzVOgTmxrGMd5wdCNKag/AIg/HHwo1vpmK?=
 =?iso-8859-1?Q?BzKle75//ujmy3h5f3wW8QQETPGPs/Eoc/84dm7uXlkeVyGgUjPEO14AV3?=
 =?iso-8859-1?Q?1953xPAXrpRqpuctocN52jjgjQcYO6JyGqLjTr5Au8OE8bq31nLhHcKlQ/?=
 =?iso-8859-1?Q?ve05GQc2Wg=3D=3D?=
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
X-OriginatorOrg: irondevice.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SE2P216MB2423.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 487d2231-bd1c-43ce-25cb-08df40559dcd
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2026 00:40:57.2933
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b4849faa-3337-494e-a76a-cb25a3b3d7d1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UjfDLctzqaL/Z5734JQgsxKzbgl+icALFjWpnri03HJYs6KMOZxJZFBZBQ471yy/ikEZye/C3UxH7cqALU2qqzlrNbGxYmexvdFLisdu3ds=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU4P216MB1353

Dear Mark,

> > > > +	ma5311->adc4_pga_left =3D 0x10;
> > > > +	ma5311->adc4_pga_right =3D 0x10;
>=20
> > > Like I said on v1 we usually leave the device with the hardware
> > > defaults to avoid having to decide on a specific use case in the
> > > kernel - presumably the defaults in the hardware were chosen for a
> reason.
>=20
> > I added a register initialization function because the factory-default
> > register settings are not suitable for practical use.
>=20
> They rarely are, but they tend to be safe and what is suitable for
> practical use will vary depending on the system.  A gain that makes sense
> for a line output will be unsuitable for headphones, and vice versa.
> There are a few things, like zero cross for example, which are pretty muc=
h
> universally sensible and we do change those but for things that are likel=
y
> to vary with use case we just go with what's in the hardware since that
> gives us consistency without us making decisions that might favour some
> users over others.

I'd like to provide some additional context regarding the rationale behind
the initialization values defined in reg_defaults.

The purpose of this initialization is to configure the data path and output=
=20
format for practical use, rather than to change sensitive parameters such a=
s
speaker volume, ADC gain, or PGA gain.

The values of these parameters in reg_defaults match the hardware factory d=
efaults.

Best Regards,
Hyunuk Son



The information in this email and any attachment is confidential and may be=
 legally protected. It is intended solely for the addressee. Access to this=
 email by anyone else is unauthorised. If you are not the intended recipien=
t, any disclosure or actions taken
 as a result of the information in this email is prohibited and may be unla=
wful. If you are not the intended recipient, please notify us immediately a=
nd then delete this e-mail and any attachment.=A0Thank you.=A0


> -----Original Message-----
> From: Mark Brown <broonie@kernel.org>
> Sent: Tuesday, November 10, 2026 10:51 PM
> To: Hyun-Uk Son <hyunuk.son@irondevice.com>
> Cc: Liam Girdwood <lgirdwood@gmail.com>; Ki-Seok Jo
> <kiseok.jo@irondevice.com>; Rob Herring <robh@kernel.org>; Krzysztof
> Kozlowski <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>;
> Jaroslav Kysela <perex@perex.cz>; Takashi Iwai <tiwai@suse.com>; linux-
> sound@vger.kernel.org; devicetree@vger.kernel.org; linux-
> kernel@vger.kernel.org
> Subject: Re: [PATCH v2 2/2] ASoC: codecs: Add driver for Iron Device
> MA5311
>=20
> On Tue, Nov 10, 2026 at 08:41:57AM +0000, Hyun-Uk Son wrote:
>=20
> > > > +	ma5311->adc4_pga_left =3D 0x10;
> > > > +	ma5311->adc4_pga_right =3D 0x10;
>=20
> > > Like I said on v1 we usually leave the device with the hardware
> > > defaults to avoid having to decide on a specific use case in the
> > > kernel - presumably the defaults in the hardware were chosen for a
> reason.
>=20
> > I added a register initialization function because the factory-default
> > register settings are not suitable for practical use.
>=20
> They rarely are, but they tend to be safe and what is suitable for
> practical use will vary depending on the system.  A gain that makes sense
> for a line output will be unsuitable for headphones, and vice versa.
> There are a few things, like zero cross for example, which are pretty muc=
h
> universally sensible and we do change those but for things that are likel=
y
> to vary with use case we just go with what's in the hardware since that
> gives us consistency without us making decisions that might favour some
> users over others.
>=20
> > static int ma5311_rx_tdm_slot_put(struct snd_kcontrol *kcontrol,
> > 				  struct snd_ctl_elem_value *ucontrol) {
>=20
> ...
>=20
> > Also, this control is essential because it allows the speaker output
> > channels to be dynamically assigned to different playback channels
> > during PCM playback.
>=20
> This would be better represented with DAPM routes directing playback from
> the audio interface rather than a custom control.
>=20
> > > > +static int ma5311_reset_control_put(struct snd_kcontrol *kcontrol,
> > > > +				    struct snd_ctl_elem_value *ucontrol)
> {
> > >
> > > > +	ret =3D ma5311_reset(component);
>=20
> > > This might break the machine driver if it's relying on setting the
> > > DAI up during probe()...
>=20
> > With internal verification, I figured out that synchronizing private
> > data to reset hardware register setting is enough, because The driver
> > does not rely on probe() for any essential configuration and dai_ops
> > callback functions always set the essential settings including PLL,
> > TDM slot, etc..
>=20
> The issue is that machine drivers often only reconfigure things during
> probe() (including the generic ones) so the dai_ops might not get called
> again after a reset.
>=20
> > On our target platform, the required DAI settings, including PLL and
> > TDM slot  configuration, are reapplied when the PCM streams are
> > reconfigured after a reset.
>=20
> Sure, it'll work for some systems but not in general.
>=20
> > > > +	default:
> > > > +		dev_err(component->dev, "%s: unsupported PCM
> format: %d\n",
> > > > +			__func__, params_format(params));
> > > > +		return -EINVAL;
> > > > +	}
>=20
> > > Don't we need to configure anything in the hardware for clock
> > > provider mode here?
>=20
> > Since the frame size is already calculated in
> > ma5311_dai_set_tdm_slot(), I don't think we need to configure the clock
> provider mode here.
>=20
> You shouldn't rely on set_tdm_slot() having been called, generally things
> should work by default.  Usually the result is the equivalent of a
> set_tdm_slot() based on the hw_params channels and widths.
>=20
> > Lastly, do I need to address all feedback from the Sashiko bot, or are
> > only the "High Priority" and "Medium Priority" comments mandatory,
> > with the remaining comments serving as recommendations?
>=20
> If it's pointing out something valid/useful then of course update for tha=
t
> but there's no requirement to update for everything.  Your other
> suggestions look OK from reviewing them here, though I might spot
> something in context - in general it's a lot easier to just send the new
> version, especially if it's just implementing the requested changes.
