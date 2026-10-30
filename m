Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.57.127
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793357572;
	b=DKpnKtumEMOupcNVIE98nJvX2B6Gjzd9uVp9jGosI7/NyCmLDkR8A7my5FrbJoYF6a0u
	 2pOlutpNKwe/oMACdRexC6lWCL/nfLqsRMXNvOgRmaD6vGAoa0UuFkawlyoxKTxDjC1wa
	 GRZaZs2Dxj2n1teqMGG4tlLpzUEbucew/95jPB0P+L1PmJvOw2+cUC+o7cotdXQGkpPoo
	 GqwYzDzFiJcPFC3QPeM6omvsp78joPB2m6C/gDirxPjkvl78LbYXe3bFEd5UY2pNbW+Xv
	 SeuVk1e398HQpiWOSejLJlbAw9HCCwAf0UAzZMzTRcQopaVTnEjXkV4uLC71SbgHsMA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793357572;
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
	bh=GPrG2O6tQaOjbMYwA4/ODa4kK6bQoov52b5JKoZ/hag=;
	b=UhvQGbeeWe3T2ni0ZPtCx98rkTuFBPNKFtIVGvyeGZ5LihL1SjvU5u+vJw95lRYy5tiC
	 aP7Ps73R2KskxSesaEkoq7F4T8UUHsBdTu6D0mIW4I5tuM1SOkJRlqjee5yKGXFwXiG5S
	 4AuF22MZ4/135XAeiZSusGyKnuvAzDsAp790mpuXa10JZ5CpVP08nwOr+Nl6HqRJ4jhDV
	 eyQyfNXeJ0fnQEAZSSvDS4xcATBpSt3HU0Pyqsy/zMNdgjKTDnTPpR3x5tV5wejSJZcTX
	 tPLQTBkmkvqCOcjsE25l8pC4r4HScfEv8rFD8xarRNqI9+9ymYcCtg8cy+8QdRNalWg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=siliconsignals.io;
	spf=pass smtp.mailfrom=siliconsignals.io;
	dkim=pass header.d=siliconsignals.io header.i=@siliconsignals.io header.a=rsa-sha256 header.s=selector1 header.b=dmKw44+X;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.57.127
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazon11021127.outbound.protection.outlook.com [40.107.57.127])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39936606B97C;
	Fri, 30 Oct 2026 10:52:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39936606B97C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=siliconsignals.io header.i=@siliconsignals.io header.a=rsa-sha256 header.s=selector1 header.b=dmKw44+X
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y/AaFtlCe74W4QCh4S22xEZ5eG5Cy7xzQX+3IcDXznnq8x6rwQR9rTa27QqcNdimghHR8bSNRZm9OGNzCs35WPyHSdyM0XxaZmlyfRjRZ+qQroqm0d9PoWzNbZXlGLYWe60wKtqTp1FJjXjbWDrRaep/YHaxtG6OKRK/BI6hc2og2MQR7HQxe/PEg0I4hy5N6hNMWI9B7wA2isDhICPDwND/38w2QAojt+o2oIxNuyUwZwiIBkWkoEefOSN2xSL1ms1TAYsdMQYWpKN9QEJIOcDW6Skwx3DOwVhgUCfl4ZzkGPJBF4Xes0p3ofARprVXUGleaKeaTHBlR0qmk4e3IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GPrG2O6tQaOjbMYwA4/ODa4kK6bQoov52b5JKoZ/hag=;
 b=cbwyhmDALuTvvf3pFyX2F/8cL2Zsrl0EQqxvnV+NYiZnvOgO+vJlwBws8Udr6W1Om1NdySlQpeenrLWfoyHSQWK+6NdnZ+dax2Fl5i4XuOIT994gMHTiJO4imCw2iEaxnY1fbht+nbdXK59czYjMk3QMjJXUDgnhbP6RyRz9pLzcmV1pl7C1Jp1TbHU9BwCv5kE2QVNcDswqt3PL7ExjGUoMPDNu6HurwhVOKRlG4Bw7awIWIe+brEI+aQj7UVgVnpP/PWMQk8FNwzyeVb0TkicojVM3jUlxHkgFJN8Xlin6pvFe7PAWl47qbFRLeJlFeUfc7pyAJHN27/vZPI0ujA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GPrG2O6tQaOjbMYwA4/ODa4kK6bQoov52b5JKoZ/hag=;
 b=dmKw44+XW+Jmh3kdU2p1pDnDDqOLvwB9uROrE92s9+iZaRYmS8DkEAH3Ci92LUsb2o4iMjK6hpVmWxQTqp1pZsiZaIih1njh1KItdEpHPhp6V5a3rGHt8K4J/KI4ZyzSGQvxH4DlJ4OzCi8KSWMn+rq2RHCSBeF/alFHMMEYUdJIlby1SefogUKJ5omhR3S2bAsJRhJKwYoWqvZZO09hiPqbl0igE3hohkqutzvFWYhwv3AOBH1/GZ1LyZPbe87LuCHEfxCy5R7JsLWTOupXoGOPmI794EyB2YGhFpXeBlTPvDJjriV+t8jMGOBBj9OR2id5GOvjArNNI2ra8uapVg==
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PN5P287MB5905.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:341::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.9; Fri, 30 Oct
 2026 10:52:48 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%3]) with mapi id 15.21.0569.008; Fri, 30 Oct 2026
 10:52:48 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>
CC: "jai.luthra" <jai.luthra@ideasonboard.com>, Himanshu Bhavani
	<himanshu.bhavani@siliconsignals.io>, Elgin Perumbilly
	<elgin.perumbilly@siliconsignals.io>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Mehdi Djait <mehdi.djait@linux.intel.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 00/15] media: i2c: os05b10: Refactor driver and Add new
 features
Thread-Topic: [PATCH v4 00/15] media: i2c: os05b10: Refactor driver and Add
 new features
Thread-Index: AQHdaFowU13Jkl3RdUi2N5c6Wr+w/bcV5pog
Date: Fri, 30 Oct 2026 10:52:48 +0000
Message-ID:
 <PN3P287MB18292F6B1F3760B2CFC89B578B6D2@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
References: <20261030103348.1222201-1-tarang.raval@siliconsignals.io>
In-Reply-To: <20261030103348.1222201-1-tarang.raval@siliconsignals.io>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB1829:EE_|PN5P287MB5905:EE_
x-ms-office365-filtering-correlation-id: 4673abec-d08f-42aa-6a79-08df3673efec
x-ld-processed: 7ec5089e-a433-4bd1-a638-82ee62e21d37,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|38070700021|56012099006|261009221227099003|261009223027099003|261022105027099003|261022075727099003|10067099003|261028144727099003|261021121427099003|261021123027099003|261026140227099003|22082099003|18002099003|6133799003;
x-microsoft-antispam-message-info:
 tq8EGOSMvnXXU43790TiDZrnqWNxpviAVEG8KB0wvW3jub2KS/+aBxp6G2PA+UA4jq6O4YRvvTUc6h9NNRIT2fPaWeBRqWOzYTt7y6UqYFDAO3SwdKyI1DUiXiZACHbqikUaGnn87tBB3ZFSjqYWNz1vyWH9vKmsEZNEt8laumAt76+wM/wmKhnI7KTG/dT4P61EtvMdOrrHmiMGTQv2NeWH+op4KdAO53AZ7bsrt29bJmrf0fn7lQtbswnpz3tDtj3Uaf+ZNg6dFKaEjmRM0cK6lBCT/+m66bWHQmlGsL/u0nvpttRWSngQDajJMaf6Tlrwl/VZP4egYFrkPWvMnx/JlbzGZ3SyVFuZOhdxInJyOrttJv8eIHw9EWrNXeSav+hmqkBvvoKwsw7zQ71UtCQo6hfRDIWxlVf9TAk+bOFeoNWKEMUNtUr7hYhbuURGmQ5FTTBFKUOlLVDeZPZKixfLkSDIjukDfnf1S0hDyIfmFHH8GEWP/R7Y7hrztoLEsODFrleSILxpebyjVeX97krwtPEsugOoX5OukFsoT63IQdDkuvBKCFOaAPCieTU+gXFXI/9DQISAqeTjESN7tTRFfBszF9h2XMLqjokQJ/dOevCg0VheZ9YSK7q3oAyWUXpc0Jzan4VbrnoOnuksSiBzgq6jBKLmCEKlUwujRWo=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(38070700021)(56012099006)(261009221227099003)(261009223027099003)(261022105027099003)(261022075727099003)(10067099003)(261028144727099003)(261021121427099003)(261021123027099003)(261026140227099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?Windows-1252?Q?YhvMKnZT1p1Kd84t0ZcVHmoi/jz1uCJXG1r3xT8fKCdTws4naE9V0hiQ?=
 =?Windows-1252?Q?22HGMH0nu2N72wh9TAoQlplT2ZTx+59jzB2IJ2rT+OGRducweQstcvSY?=
 =?Windows-1252?Q?7simFI7r4RJIoiuJJRH+CBuGpavaH1hglrFng9GPDBk0+ATM8KAc/XP2?=
 =?Windows-1252?Q?nnozPXeD2wY5k3zbPiyIDF6RWADe3STO258it3ijQEoEPUT5vbON5Es+?=
 =?Windows-1252?Q?2PH4RXQY4dQ+zWOUgya+EH5Ps6k1/vNSqLvj+CJmngiSZ9sdVvvempK4?=
 =?Windows-1252?Q?Mlm8RbBqu/DCdu6Ecp8UR6F39sc4dFjCaw9vJtqB6UcID7Lx2XQIlfvC?=
 =?Windows-1252?Q?WOjmu9MppX4WWl9zvo/d4pyp98lYOVRZ9tempAnF/1wI3wjAHdm3d0Ys?=
 =?Windows-1252?Q?AhgZRh6TfWvxKwWDjyiUKbNBFRWRvjPoJf0rD58k10S+oFQQuImrZ3Ld?=
 =?Windows-1252?Q?RCvgqZiOVd+TSb+pAk3jADaSt9ZMw/sxkbRai63DFAOvHrhsUtelDPSZ?=
 =?Windows-1252?Q?msJDSYcoVwUXbKz871NHykLePP5+MW/C6m5/JRqqD56kAnTCw5HU4Frw?=
 =?Windows-1252?Q?Wi3ojtdrZe4TuxMF4fbpcdr8w9Bva11VIycBTZTYpUND+9AWbjicChkh?=
 =?Windows-1252?Q?Ooz7UhNirNEaufeIMu0sqr812JsryHVh7JTXUKAhvtN2Tokf1noxVYD9?=
 =?Windows-1252?Q?moCvaWlebD9MOqT2mck1JdtZVFFTKFrAs/1WqJ0bS8BLoYWnhfR+EpCk?=
 =?Windows-1252?Q?UTjYx3UK3j5UDHYt2zScfkY1FKiNDhjvXAf2sFL4g3Gc+HyYGoAVJZ83?=
 =?Windows-1252?Q?F+SkWIKxUiEAlP98nIVH0lvGfJ8FlCx50TUpDNKS3eKq135jtE28Ue/r?=
 =?Windows-1252?Q?0s7CQIg/p9DJjEolp8ib13Op648KRo8GiUZz6ap01K4ttaElQA2KFEH6?=
 =?Windows-1252?Q?s9tgSJJ7lKUl9gsoldPxFNEmTZowkeKbK/ZNJiVZAb2p0zcUxrUUsS1z?=
 =?Windows-1252?Q?TtAb+38kQCyeK1h9dtTbWxjC3+Sgkcq2XmmSTbJV/kV8aBYz26lmEkCz?=
 =?Windows-1252?Q?8moPbvn1VXA4/p3Q1nRTKG1sBHwhGlH5O9DHxYQU7KK7y1Oy+q75G9SR?=
 =?Windows-1252?Q?j+HSmXD3LEhbVKJKZq0bmJmbxGIZCJ1bBqWVRGXvQfzauSHIGxeP3KJZ?=
 =?Windows-1252?Q?lmE05P6a2ZcLin7ALwZNCCdulMoyVPBg1hE/7mZGz8N4GlDEVJr/rwyS?=
 =?Windows-1252?Q?w/hLgdhBpSMHc4668JQ1ivSUGy2MOlMfLXr4mu3Lt/sgq4sx9KjDc2hy?=
 =?Windows-1252?Q?VzwFUoqOqJYEaf6g3Nemh6tFc7tAcApXEvrp6kIWR2UGYQvkEpyGeFSr?=
 =?Windows-1252?Q?cHk+9Tz9HP6sgbjL/to+2Y/kUHR4JGBmGI2auNC/ekgy1OIZ1BSY0lpL?=
 =?Windows-1252?Q?Vy7wu2M5rbEl0qf1qCwzlqZhFBjje/f2BDEUknb6bZfF2ArM3ck6S/Qf?=
 =?Windows-1252?Q?APMtB/B2j/8CbfMtjomjGM3MSbSaa+aleb38/QbsatBS27Z7alz9qf9z?=
 =?Windows-1252?Q?yinWvAxg1f5DuPm11iBIivPBG9wzsdrErBhV6Zv91vMtI+jeDpcsUBhW?=
 =?Windows-1252?Q?neet5xaJiCeAw6rG0bH0R6k6fX9oLGQaSUa01S29409NhraiNjScjXoB?=
 =?Windows-1252?Q?tJKUXvXRBbbu3ybORRlOQjFQyxtd3yPDlRB9KecCIgJ5AZ+tYCI5q50P?=
 =?Windows-1252?Q?zQkzL6Dgpey1sStnzHxFJyiAXvBfzhnXUB33UozcPk7v7YF1f2P96aVD?=
 =?Windows-1252?Q?ketwv/VFKcxhD6uARYbuGATixWuRWU7OR2qvH4Vhp/bObjfuP0DKnVSi?=
 =?Windows-1252?Q?yXdUgprvpTHRlsAyUf/w/LA02D3zpf3PUsM=3D?=
Content-Type: text/plain; charset="Windows-1252"
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 4673abec-d08f-42aa-6a79-08df3673efec
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2026 10:52:48.4034
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: unSM87/uC36SsT7B2/2HSaKuJ8c/ROCpALa5mq0yg8Y7fjyJ8ULegLWpNTUt78VQRk4uVLiN2OzO2qKxgs1+NXFmM7ab+2VRziyV/h8UEZk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN5P287MB5905

Hi all,=0A=
=0A=
> This series improves the OS05B10 sensor driver with cleanup,=0A=
> refactoring, additional controls, and support for new modes.=0A=
>=0A=
> Patches 1=964 are small, self-contained fixes and cleanups. Unused=0A=
> group-hold programming is removed, the vmax variable used by the=0A=
> VBLANK control is renamed to vts, the active format is updated before=0A=
> adjusting framing controls, and runtime PM autosuspend is enabled.=0A=
>=0A=
> Patches 5=967 refactor the driver. Register definitions are introduced,=
=0A=
> the initialization tables are reorganized by splitting common and=0A=
> mode-specific registers, and unused control fields are removed with=0A=
> simplified error handling in control init.=0A=
>=0A=
> Patches 8=9610 add additional V4L2 controls including digital gain,=0A=
> horizontal/vertical flip, and test pattern support.=0A=
>=0A=
> Patches 11=9612 extend the driver with 12-bit RAW support and add new=0A=
> operating modes including 1080p and 2x2 binned 720p.=0A=
>=0A=
> Patch 13 keeps the exposure range and default in sync with the active=0A=
> mode on VBLANK and mode changes.=0A=
>=0A=
> Patch 14 adds support for 2-lane MIPI CSI-2 operation.=0A=
>=0A=
> Patch 15 fixes the horizontal blanking calculation and reports the=0A=
> sensor's real internal pixel rate.=0A=
>=0A=
> All patches were tested on the Debix Model A board running=0A=
> Linux kernel v7.2.0-rc4.=0A=
=0A=
A few patches were mistakenly sent from an older version.=0A=
=0A=
Please ignore this patchset. Sorry for the noise and inconvenience.=0A=
=0A=
New patchset link: https://lore.kernel.org/linux-media/20261030104806.12239=
91-1-tarang.raval@siliconsignals.io/T/#t=0A=
=0A=
Best regards,=0A=
Tarang=
