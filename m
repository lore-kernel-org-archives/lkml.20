Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.42.104
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794805036;
	b=eZbtQwSO1fXgPU1FBbrQmxQD2FRPPGu/WjKomUnenbHtjVPmxQNyIlb5jrCkAEzgK45v
	 ylFBhP85gbmOi4AapMJo9frgVVy2mj9mPgMmotJFZWUowoB8f5k2iXrYa+EDcaFgI/ojg
	 /ASYa+G3c4I2scvwpsDSBd+/jFSDtb9SX/arcc1/Ryj6nkRj9D7brQCk07Qv93MHAGzr7
	 KpGQRHhFWGmw5e4Qrzw+Ok/lpYTDffqNCxYTxDGPXIcRT1WMekFs4eTe+wS6fq69EFmH/
	 fIuHyIhmjieVwCqqkmeqJx8aa3MiOn8PwL1JnOgEWhQkP9Vnok9EuAIGeWGyUNf1CGg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794805036;
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
	bh=wAoyum5BJKgjIclY3xjZzTvNLv27GQG/taB3wfmTg2Y=;
	b=zE8aXugM/he8383I90A7Lfiqn1qWZpwf1vtgkty/iG1TaUx+q0Sguwk7QL4FKQY/L553
	 NQa1wmxxISl09RRWy33/VaeanJvoZcLSozcEl/JferP0HYVrM39tsb3gS2fRt0CVHuXG4
	 gqFZatLgGOV7l/x3GwQFSVxecGZ1jyIVmbyLNOGGxY21Z1H7J6+oUM23G8nt0fG4GFLBD
	 CF0lVS2x1hUnUfMV2pIy0GgGocewtFyF0IeBNeAmcoEi7LbaRsgCJN/6wPa6xB1Er1gtx
	 W6AInc7Yyhd+MdYTd1o87OKDd6X3d2UQN+6iYg93s89v9Ge6VjpeTWajuGeJTUwNZcg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=irondevice.com;
	spf=pass smtp.mailfrom=irondevice.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.42.104
Received: from SLXP216CU001.outbound.protection.outlook.com (mail-koreacentralazon11021104.outbound.protection.outlook.com [40.107.42.104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12615606A31C;
	Mon, 16 Nov 2026 04:57:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12615606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=irondevice.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=irondevice.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DIn5ZClThZHukC/cU/TSkLTcBj0y1c2bog7rJD4pGMKvieO6943bBhAM7wlj4O9DtaH8kGjc2hD5PsujXufVuDUXNDVZ4Itf47kvEm0VYfAlbn0HAzMEDPnm2BFpSlti9FVAzPKUBJMSKg4tnfA0CABf3u+slTu8PhwGcH9OtBElP+yzQLvO7QJOSKBaj8r4M6wyS/yvCpu6buGjggzWbuzQMoqfDYCqAam2sU68dAk9zwIg6+HtgTVCQnqSG7JvhWixHYwSkYvUJ8ghUKwANbTlAvDYJwvMTqpWxV5Jpixnm/IW++gLxCEycP+MAn4Y8awACQh7kdmP/xgb1lC72w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wAoyum5BJKgjIclY3xjZzTvNLv27GQG/taB3wfmTg2Y=;
 b=G3fEYB8YmmtA/nH2dQTKAPPzsmvpt7rssMmoFBpt56grKKXtwhaqtAm8RL2No+m+TOXVxw2zybPXmI0m4PrGe1DuAJJZE+9lN2yNZWGiWDmlbsgORorIsI2Ts3amhRAvmx9UB6xjDw3C9hvXIAwLUuA8wCBfb6dytpLP/Xhok4vg/oCoUoxkeiRax0t3gigG4omnJOP1akQrZ+VBu0rTzllhnG0GvPr+H0zQ8MvkGJcB6RWoOzRhBXrGRvKpJu6HeUEEof4jYESnsqT7p2hGtH0FyH+5sCJYu3zqTNLLMg5HaqRArD/RA0IMf2g8KFpk8Bzc7dkATTskwJEc0w3Uqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=irondevice.com; dmarc=pass action=none
 header.from=irondevice.com; dkim=pass header.d=irondevice.com; arc=none
Received: from SE2P216MB2423.KORP216.PROD.OUTLOOK.COM (2603:1096:101:1c6::14)
 by SE2P216MB290365.KORP216.PROD.OUTLOOK.COM (2603:1096:101:30e::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 04:57:11 +0000
Received: from SE2P216MB2423.KORP216.PROD.OUTLOOK.COM
 ([fe80::98a8:f50c:a9f8:3073]) by SE2P216MB2423.KORP216.PROD.OUTLOOK.COM
 ([fe80::98a8:f50c:a9f8:3073%5]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 04:57:11 +0000
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
Thread-Index:
 AQHdZfYyQ2ir7g3zC0ypZRNyOeIsW7cS0hsAgBJsJ0CAAiq/gIACQcBAgAFD4QCABSkPQA==
Date: Mon, 16 Nov 2026 04:57:11 +0000
Message-ID:
 <SE2P216MB24235412B165FEA906C3D24FFF7C2@SE2P216MB2423.KORP216.PROD.OUTLOOK.COM>
References: <20261027093232.859755-1-hyunuk.son@irondevice.com>
 <20261027093232.859755-3-hyunuk.son@irondevice.com>
 <179318672062.199157.7461931531075403104.b4-review@b4>
 <SE2P216MB24230E7B98CD3F438E23E869FF722@SE2P216MB2423.KORP216.PROD.OUTLOOK.COM>
 <40646ae6-f6be-4408-aefe-521fb0ea9bee@sirena.org.uk>
 <SE2P216MB24238E5F5EEA95FCEABCDAF4FF702@SE2P216MB2423.KORP216.PROD.OUTLOOK.COM>
 <2c7d503c-935b-4408-a5b6-bfdf5ba86933@sirena.org.uk>
In-Reply-To: <2c7d503c-935b-4408-a5b6-bfdf5ba86933@sirena.org.uk>
Accept-Language: ko-KR, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=irondevice.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SE2P216MB2423:EE_|SE2P216MB290365:EE_
x-ms-office365-filtering-correlation-id: 8e729aa6-91f8-4d8f-fcdf-08df439e12e3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|23010399003|366016|38070700021|10067099003|4143699003|56012099006|261026121527099003|261026140227099003|261028144727099003|261021123027099003|261022105027099003|261021121427099003|261102123227099003|18002099003|22082099003|6133799003|3023799007;
x-microsoft-antispam-message-info:
 r48b4EpcMnZ+aDtx3J9Bwel31bqwQh9o1u4Fx8c+ygfrflGOAYntIkzIUAbTxC0jsiCvykcodKvfHV4W3Bw///O8/EpmAbJRpz+F4MGRuTdZp6AJK337K9Da5VSkTTznCoibxEmptfoTJvDLBkhE+imUx0FOSD3cpdM45k/N3dpgeIreGiC+0AuMnE1veiWloL7Qp7iLCGYDoGfvHLdwc6SzfQSbd/Xk7mgR5ELUHx6cng7HvbRcKKGu220WT2wfzhDMy/MmJA+aEwc9dWnCNYP5VR87vCBkpJwWrUc4Zy+WoadVrTIVvZXgr4RE2t+Oi8VmiuyfUDCLdPeGQB2ukuaeT7V2mIf95oTw2B75WHtuIcRrW9f85kmJneS9OJfUCUxbkiMM2LDuUxW+3zUE2k/YAmk2VjS5laKhfXArpNX8oDWTz5RTso4xxoh/ggdjMaT/3syUkFyIRnb881BtJukuvaoCaLXVpiI27nPLxyUpdFTyyks+Pd9SEU/uLvykurBiV2vsmbVZh8PmJ0d6TwV4UYOT7ayMSdNakCMOu9eDAzM0hwQJD2ZGLUTQKH0L0y+fFdV9sdrsJ4N5jAG1eSFROvgevEz77sZXcPhax0ijcyYVB86eYqVPtLrJkI5W1ULVo4vNiPGVl5yD5GcSgJl1w7E6Rsgb/Z9xmFLKNf0yVfnwaKQuxfcvPaZgs/MWs+X8Ja+ZYUIgmwiYQAgzEs2KzKAprsO+7s9e2zF2LPo=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SE2P216MB2423.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(23010399003)(366016)(38070700021)(10067099003)(4143699003)(56012099006)(261026121527099003)(261026140227099003)(261028144727099003)(261021123027099003)(261022105027099003)(261021121427099003)(261102123227099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?vP6AngLvGQYPIMqyeksUr6rK8ZsmUJHRYy8f5ruTlTUOA7XeZoycyvKk1T?=
 =?iso-8859-1?Q?BmKvqd9PP0FtVYR+xZCjAmncc2ZFkv2lqMuevcDuEAwEfpRY2VXw5cDtGE?=
 =?iso-8859-1?Q?ECy9dZ3lmzdBcZv5KM7pt1+3YnVEWHWpRkQhjFp35b5yfVTl/9rZxqoVMX?=
 =?iso-8859-1?Q?r2rzcmViZFJtNucvVP5w58EpHdYiyM4u7VDpVQug5Dc0NFkylf2tK5e9LY?=
 =?iso-8859-1?Q?QvwuU85ek9FItKqdSOTOds6kkKRoykqs8UG0uogL6NbvRV2sGufOoUyQlL?=
 =?iso-8859-1?Q?r2tGYQCrqBWXsn8ypBUwoRm+B35bP/McI9Wug/VNwgybp7CAmQpMqcgegG?=
 =?iso-8859-1?Q?aeWaJ48hEXBP9UHPQRVFj1uw+miR1Hw1tH/UUxHUY6ilUSMdwNbjL2W8/c?=
 =?iso-8859-1?Q?S1/WqXk7TCL3CqV3LASmIF/6eI37VzQWV0Mnl6WlXp7XzSsiUsQZUgFvAw?=
 =?iso-8859-1?Q?GtplRSgJk1uyOT9y9aXu8B4qARwOzNIEE+LeWDDmBFvNhRxgpuQuKn+ISq?=
 =?iso-8859-1?Q?AEjdbzHCkGOylkaqKvbjm87cdQzYB7g2CNY0FfCrpsXcG5HfximCgSHwii?=
 =?iso-8859-1?Q?Wi3ew9vPR32vKqBpSYK31/2hmjwiHVuI0bOTCE/go1AtIZg4KseBiu+Px8?=
 =?iso-8859-1?Q?iw8kbMxFqalpXGzd1Yd200ief7kekHaTLZMTkSjSKh4vS4lCZzFeL2ui/J?=
 =?iso-8859-1?Q?/F3IA50MVI2gFSWPw4nCZPpV+qpXTORUrc9NAp2mqhd8irq55gFDhluZGP?=
 =?iso-8859-1?Q?5pjqhM6kDAwiLhczd17aK7ebKfO6f5Iy9ZIGWKKwAZrDuKz/j3+/3WB2kE?=
 =?iso-8859-1?Q?JRsN0Imc0c+3dcv82v+ntYS84ldeTOdU3DrnnJpGu1JVxw3VSeMsCVpbFE?=
 =?iso-8859-1?Q?fuKGfP3fzhGDFQuDsSraOPnPdCJ3D8VLeM3kQrau1GuPnRIcQd281DKzBl?=
 =?iso-8859-1?Q?cwrjWflCLCZE8KBXGg1qJ+LkEMmhY4m7XjeBkPTL4GeQ0RTcvRBsQWsn7H?=
 =?iso-8859-1?Q?QCODl31jABD4GBtplZij+lDFFBn5WcbyusJH0TUyM4K3OumuVto1RQKiNJ?=
 =?iso-8859-1?Q?2NvUPFVbeiQaf1BIsfoOh9S3HDX+CLsh6ysHKAvzsCp99jABxL8Y6KVuZg?=
 =?iso-8859-1?Q?yzyh8lb9f0/Alu9YcNB/eWiec4Bn0fd3ywkokVNOSY6tQQT4utpwn/4w90?=
 =?iso-8859-1?Q?K3wdz4pVbSjFZ7XubbIKwuHjIGPbS2WeNBMqCLeRULN4/0xgUc5pKWq9o3?=
 =?iso-8859-1?Q?hrqslAdvnTtVw3c5mZBTEXcK81//4NeT13tn9IqMYbHrhQkDFBaVoXLJva?=
 =?iso-8859-1?Q?Wy0YWW/4OxTkiiyVdp57QPlG6SDbk7RKVmn1eLX93Z2VxERwxzGES2cJJr?=
 =?iso-8859-1?Q?DjxUCVee+99VjwvMM8KchPKVrwamaw1zqoAEMrpFB+5oDMefImC0Lf5aHq?=
 =?iso-8859-1?Q?pV8e1Nzf3squ6tL3q3GEA8khVyGf5+U1PLpCIuzeunIXvvKXl5Z4aY7tg3?=
 =?iso-8859-1?Q?VWocEjci2/Wn9nyiqDxEeei6i0qvk3lujkAiN90L7n8jLb9T+IdFnATHLO?=
 =?iso-8859-1?Q?2/CMrKIxHts91culK2X2crkKtV/W8iqv0JQdw+OWtkhXttgtaYgyKi9KKe?=
 =?iso-8859-1?Q?YLjJ4qw9XiE+oU4pBV79ygvTADHyD/XWcmFognzbdI9J6N+eznUNYYuUmc?=
 =?iso-8859-1?Q?gaVDKgCMwx473qsZzS5aBbdpNrsHJgryTvUSkR/rcueUGQTj3o+4LiFpiP?=
 =?iso-8859-1?Q?KW9ByrBe/3k8TR9FD/MEZqLqrrLSzpKOegAHa4qLn9TgpIIAPXuLBW6Nhu?=
 =?iso-8859-1?Q?2ioYMM7z0A=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e729aa6-91f8-4d8f-fcdf-08df439e12e3
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2026 04:57:11.0394
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b4849faa-3337-494e-a76a-cb25a3b3d7d1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eIWb0cSq3LB3iAaEp5xv7Um7Q1dde+Tb+fRA+/nmx/zGPt1HNHb4lZaKxZC2cXe6f4a1/rCUA9ctIKsYpmcyUsMlxVITpJA4X6gYSJV1LTo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE2P216MB290365

Dear Mark,

I'd like to clarify one point in your feedback.


> > The purpose of this initialization is to configure the data path and
> > output format for practical use, rather than to change sensitive
> > parameters such as speaker volume, ADC gain, or PGA gain.
>=20
> The trouble is that these parameters tend to be both sensitive and
> platform specific - they'll depend on plastics, or the components in a
> given system.
>=20
> > The values of these parameters in reg_defaults match the hardware
> factory defaults.
>=20
> Right, those are what the driver should nromally use.


When you say "these parameters", are you referring specifically to=20
gain-related settings, such as speaker volume, ADC gain, and PGA gain,
or does this also include data path and output format settings?

To make sure I understand your recommendation correctly, should=20
the driver leave the data path and output format settings at their=20
factory defaults as well?

Or would it be acceptable to initialize the data path and output=20
format settings while keeping sensitive parameters, such as speaker
volume and ADC/PGA gain, at their factory defaults?

I apologize for following up again, as I may not have fully understood
your recommended approach. I appreciate your patience and guidance.

Best Regards,
Hyunuk Son=A0



The information in this email and any attachment is confidential and may be=
 legally protected. It is intended solely for the addressee. Access to this=
 email by anyone else is unauthorised. If you are not the intended recipien=
t, any disclosure or actions taken
 as a result of the information in this email is prohibited and may be unla=
wful. If you are not the intended recipient, please notify us immediately a=
nd then delete this e-mail and any attachment.=A0Thank you.=A0


> -----Original Message-----
> From: Mark Brown <broonie@kernel.org>
> Sent: Friday, November 13, 2026 4:38 AM
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
> On Thu, Nov 12, 2026 at 12:40:57AM +0000, Hyun-Uk Son wrote:
>=20
> > > They rarely are, but they tend to be safe and what is suitable for
> > > practical use will vary depending on the system.  A gain that makes
> > > sense for a line output will be unsuitable for headphones, and vice
> versa.
> > > There are a few things, like zero cross for example, which are
> > > pretty much universally sensible and we do change those but for
> > > things that are likely to vary with use case we just go with what's
> > > in the hardware since that gives us consistency without us making
> > > decisions that might favour some users over others.
>=20
> > I'd like to provide some additional context regarding the rationale
> > behind the initialization values defined in reg_defaults.
>=20
> > The purpose of this initialization is to configure the data path and
> > output format for practical use, rather than to change sensitive
> > parameters such as speaker volume, ADC gain, or PGA gain.
>=20
> The trouble is that these parameters tend to be both sensitive and
> platform specific - they'll depend on plastics, or the components in a
> given system.
>=20
> > The values of these parameters in reg_defaults match the hardware
> factory defaults.
>=20
> Right, those are what the driver should nromally use.
