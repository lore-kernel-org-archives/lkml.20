Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792570077;
	b=YkEb90LWNqEEJ+DkhNGdORWqJoZltEzHAVcD1w0jcKaLRUwS+S5nj6jtFjUtGZjFkPgO
	 VXvKsHy4QX0NN4bkAwkV246RsQee4e+4DzN404LObF90XIsB28TerJil3BK/Y/TmeoBou
	 jkDm3b+QV/D0uUq2OKXdtnqakT5v4mR5reEahgRn86GtjxVVH7Xj5N+pjN4MhqBNKic+j
	 og7/B4lPNsUr46WqLot0mdmq1NKcNeNXPPPCs7zbxVimqiklg7sxWgkN1gAAM2CfW/rpJ
	 /gigJBESP5S+YfGuNPfwAClvzmID9edhRs723kU4VjgBvMW5u1ap4iStdsZ7TyMWvww==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792570077;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 msip_labels:x-ms-exchange-messagesentrepresentingtype:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:
	 x-ms-exchange-sharedmailbox-routingagent-processed:
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
	bh=RZbxxIpWSZaJEp7DvvsCZkzJ/gFZT3rMsM1MarC4hs8=;
	b=j4VZnon1LBm0h02jPUThbn52AFH0237WcgXO5s8v/xx9CzUZ09YM4eIXlLkNLDfQrpYX
	 5js5ed1NItB6JM9+rAvaeHk1+zDdF1FaIOROVRTWvo/8pj0vK5JqbWC9lEr0x3kD/vXqK
	 YgrunbypdUxBgh2fLMQWYPaonoYSpmS+/ThgN/ON6S9kagO04km55v2EwZJG89XkteXEx
	 oHgysUGQGtRYQZ81NafBmyyoY7wC00pTy0OEwJxzIETnC78GzU9bxdIuQ3xJmX8YfZcAD
	 P6nKNtedY5m7PbYFGQ8SJKNiKQ0LnLhWssR2GNURAR01wEAMQKvAmgOlpZI3g0X7RLA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=XyDRJYOR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.53
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013053.outbound.protection.outlook.com [52.101.83.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70A8D606A31B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:07:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70A8D606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=XyDRJYOR
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t4ggYV+HLKCXUOYXLY2asuTqGN35z0bJHscK8T+GOpinw5ZoQZ31SxlptrjcSFVgu1m9gBDHyvfoYQbIyZQLut14vroIsQmx/wDwxR8ytkUBw6f81Kp0xkdxllnsXrhj5ciq94dQQxnKo+K/dvVE5jGJMhvMHfqqhfT1X4ukcecZbd5W2KmdtkakKjRM1uFmiBIy2NcQNFLUbqrs1or0oS7VxwgUFETdG3MZKZSc907q5QNKLmM97hXgEIsDl5Tp0fplstnmYirqqk1DB/1yjFrOGANdkXE36OVnYqblwgH1efZOJHqqwhggG9hxrb/gTwB5679BDbyMaXmTp4rCBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RZbxxIpWSZaJEp7DvvsCZkzJ/gFZT3rMsM1MarC4hs8=;
 b=XsElxfxsIEJfF2dRnUKdAh1QrKFFhlJRZljGLfzWeQIkK+LZ6lVrLC+oURSOoqAOl6P+EIoXOA7hlA+oibBCGuCIvW8UvdcRaJxEufTspHCg1tgwtHb5Dt7cmP3ODlJ8mx88vtip3R+6T69mtTxe656VNQNvVAMiHI1lBfq/ZVlerhu3iVbICbFEKxjpwDB5HNmbMn4pPBR4Eh3tVzyqrNMI7btKBYjrSrgYnMdmgcEzfvp1TZ6H7pqxjGZ+ZhncGndALZRwv+O5SllUiZPdUrWNTP4KXacJQxJbOelWJVV63oYHgkMnqKtjPnc1chjutVkeIzdOTxmpDOB/v8Hwzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RZbxxIpWSZaJEp7DvvsCZkzJ/gFZT3rMsM1MarC4hs8=;
 b=XyDRJYORB9qVRZDIMqiAaEtJgaiAC/eL/BPJTEptZ5B7ssuTf9zkrKYT9NCS3oK8ljehOwTpw+jrU5KNm6QY30fBTkLDgBO50r+plRiWbUk09VMqTmfTRYR6vLS+qdepO9yubdqM8NoT9f6Z1MJ4e/H8cKKoxUb4xlwyF0eTOHEq6ZMrOTsHef/awrJMxHsJA5J6c0d7zDb5hol+hJ7ujYiOy3VbBErOxf5VcLgeeksbJqo49AVh6ktMfauJw7EEb+22f+ldPO52wQ4CqfLrWVr2UR45C3nyHKWntNxGKB82d1X9AuSQDxfiusNs8s5R48ay5w5a4im++f2pcgRwRQ==
Received: from AMBPR04MB12334.eurprd04.prod.outlook.com (2603:10a6:20b:732::5)
 by BR0PR04MB472823.eurprd04.prod.outlook.com (2603:10a6:2c8:39::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Wed, 21 Oct
 2026 08:07:52 +0000
Received: from AMBPR04MB12334.eurprd04.prod.outlook.com
 ([fe80::9b4f:ab4e:94c3:c457]) by AMBPR04MB12334.eurprd04.prod.outlook.com
 ([fe80::9b4f:ab4e:94c3:c457%4]) with mapi id 15.21.0546.012; Wed, 21 Oct 2026
 08:07:51 +0000
From: "Zhipeng Wang (OSS)" <zhipeng.wang_1@oss.nxp.com>
To: Radu Rendec <radu@rendec.net>, "Zhipeng Wang (OSS)"
	<zhipeng.wang_1@oss.nxp.com>, Thomas Gleixner <tglx@kernel.org>, Marc Zyngier
	<maz@kernel.org>, Frank Li <frank.li@nxp.com>
CC: Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Jindong Yue
	<jindong.yue@nxp.com>, Xuegang Liu <xuegang.liu@nxp.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, dl-EP-SW-ANDROID
	<EP-SW-ANDROID@nxp.com>
Subject: RE: [PATCH v6 7/9] irqchip/imx-irqsteer: Allow building as module
Thread-Topic: [PATCH v6 7/9] irqchip/imx-irqsteer: Allow building as module
Thread-Index: AQHdVwP4nF4U1ANnEk+eICHvMIFT4bcGZ0+AgAFP9EA=
Date: Wed, 21 Oct 2026 08:07:51 +0000
Message-ID:
 <AMBPR04MB12334C9633ED9F19BFE2614FFEB662@AMBPR04MB12334.eurprd04.prod.outlook.com>
References: <20261008090231.796511-1-Zhipeng.wang_1@oss.nxp.com>
	 <20261008090231.796511-8-Zhipeng.wang_1@oss.nxp.com>
 <f642a27d36844b8cc4d164f518f7177252624975.camel@rendec.net>
In-Reply-To: <f642a27d36844b8cc4d164f518f7177252624975.camel@rendec.net>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AMBPR04MB12334:EE_|BR0PR04MB472823:EE_
x-ms-office365-filtering-correlation-id: 9425a82e-4945-4be8-1177-08df2f4a6747
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|23010399003|19092799006|1800799024|366016|38070700021|5023799004|4143699003|11063799006|56012099006|261009223027099003|10067099003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 Q0HWeuB4Ii+RLqbQ6000Ryn9J7Z+8uOa+qVp/9mfn9Mgfx46FdkAIBmQFWr4SAgFY1sElKxomgchr3Ga5dd6GGkVcwKJ+O/db8Hf/gecFJWU0TP55XFgCtIUTQKCUdtSRNTVXvDnKa6lYnC6tlVQJm/X89GQJJjovFns/t9cs9+l30ps7I+c7dwluPz7B5UFzsX7hWwzGPNxlx4esR0GCDoUsnqG3Li4taf2pi0Hj9y40IbkfOrJlYADuaN955G1Ejt3j7wXpVzDidmRhr9lFtd47Zd7zVotVuEhIDJkV3BXmEX+hYzbWFPcxv36E7Ovcz2XVwa232A8zUVlDtWSAZNnujnER+isMkpcYGV1lIvdmODFw0d67rFARJrpXgzlnpO4w5fRl1HoGuBGXnGKG27Q1Ch9pijBtI5qACQ/ikd+PTUgUeY67YkOijj7qjx6xhP94pFodP+g6e2VdzWXAH9EhLRRO9f0sqKZbOaFcLefYPJjex1ydI8Ay7lKvAj3OxRrQ9+4XgYjIddvR/RuclTX9SDsWPsXYu3+Nu3rtHTX8UqUyz0RPfwMhoStNAgOPVXsIEDl+ljm5EzwVu1nlN+mYMMK1JQtX5/hmAhb/qA5LNbxONmayhtbHdH8XIyFDudIUc7Fw12iyE5Bm0sjx8caSlP+APhrfBflDVU1G4U=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBPR04MB12334.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(19092799006)(1800799024)(366016)(38070700021)(5023799004)(4143699003)(11063799006)(56012099006)(261009223027099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MTVRakY4TjYzT2ZuZkY3b2d4QXBGYlBONFBYT1ZTTVFJT1IyaEdJOXJIVVNC?=
 =?utf-8?B?VEJFUHNydENNR0dCakVjTzJxcEtCb0U5KzhMMjladSthRmtoZlZGWCs0dkJ4?=
 =?utf-8?B?aUNhMjRIampOY1FETkRsUkY5eVd5M3BxaWcwajhiTExTSHRVZ2NCN2JZOVFP?=
 =?utf-8?B?YzlyVHVNWFVKMFlXcm1OS1Z2Z3lMY25TUG12ejJreGYvVHZ0VUk4clgxSkFw?=
 =?utf-8?B?cVp6YzV3TEMwNlRVWHBxajRIUkYrV2VGQ0FjOE5mcU5UbGdWcEV4aVJnWHE4?=
 =?utf-8?B?Q3RjK0o1Mmw1TVFVS2t6bklTUjhWSDFXZ0lTZ0ZjRWpPa29ZL1JrdWdHUzFq?=
 =?utf-8?B?OTY2WmVHdkF1UXltdDFvbmRwcWxkTTAxV3l1aUNpSHcxcEErdjVOY0JiOTJS?=
 =?utf-8?B?dkQ2S0ZaeGE2QUc5OERzZm80Ry9XQU0vVVo4SUtVQm81ZDVnaEhZYXNqbGRj?=
 =?utf-8?B?V2FlOE5KckkxNkVuNHVhelJhU1Z1WnA4YUxxUDVQem4vVDZTb1pPdFo0SHlC?=
 =?utf-8?B?bzF0ZE5aSUhIcFFmNDQrbWpyV21iUFl0U0NDQjE5cGJJM3VvL3NYWXg2NFFo?=
 =?utf-8?B?NmlmT1lPNnM2OWFMSkd0bDZMUnh6WWFpMHBGeEhETkNVazl0L1M0VzNIV1I4?=
 =?utf-8?B?Q3RFeEE2NStIOTc2UEZNVk5NTXI2QklFeHdNWUg1bmU5UkdxdHBNWC9ZSnRx?=
 =?utf-8?B?ZFZaWENhTHV6T2JFYVZpMVpBSjJSVzZaVmhKSjdITW91ZnpDUTJyK3JsSmN0?=
 =?utf-8?B?NVk4NTczQXZlaXNlWGlUSlZLYnRxeXlsTUNuOUV4UE52VXh2b1hUU1pUeHVG?=
 =?utf-8?B?SmlFMWN2ODZ0YnZ1VWNUMHZLVzJKb2pVMGlkQ2RiU3JNMjQ2RG03TFhvMW1N?=
 =?utf-8?B?RkNNSUNCMjJ0K3NIbFo4eXk3N3F5WTh5UEdDMXVJMmVZMXBya1E0cmtySUdL?=
 =?utf-8?B?MmNxWklucGhOVFZyZGEyRWxROFBFVmZ2elcxeTFXdnNXR3Y0T1dtemVBTWI1?=
 =?utf-8?B?aEtOSWJjVVR5Z1pBTkZqZjBKUW15WXN3VmNheW9IL2JYMzBwWWlQem55TjJo?=
 =?utf-8?B?MFMxd2VxbDhrbExLNFdoc2p3U2d0RlRsUktsZGxHNUF2cEF6SyszTHI3Sy96?=
 =?utf-8?B?MktiZkpBbWhUeStwLytFZ2hET094dHRKQmVPVit4OFBjbWRUc3dPRVN1K3p0?=
 =?utf-8?B?bkYvaURYWFh4RFV0Sk4wV1kwTExMSVFkVHRLN2ZSTTVZVVdISEg1elEzUDY1?=
 =?utf-8?B?THJjL1VWTU9IMUNkQ1ozV2N0UTVqWHhhS0NENzNGMkhOMTFpS1M5eDNaOGJu?=
 =?utf-8?B?VHBzQlo4NktKMTRhNXFqdzFoSzJHeFJDSWJWTHkxemZ0UXR6T1dCTFNsZHJm?=
 =?utf-8?B?ellvenRKOXpuQmI3MmtvMDE1UUtEcWxSUWlWdWdWVXZJbFdCcksxTU1COEdU?=
 =?utf-8?B?QUZzV3JzNUJTMjlYbFFETnNlYUNZbHB3VzY5QTBKVFgvamZPWVo1Zmg4b0M0?=
 =?utf-8?B?MDcxQ1Z5eGRRRndZOWZyL2hQbVI5ZGZJd1NQMG1Uc1Q0cG1oQm9KZE5NWDdm?=
 =?utf-8?B?R0oyMjl6OUZDdlEvNmd6VHFMUWpCT0t3QnV3UmtURkI3RUFWZmtQQWdwZE8r?=
 =?utf-8?B?WlNtY253T3VTNndNam05aXhBV1JjTDBtRi96bE9lYXJva1E2K3JNUXZiR3U4?=
 =?utf-8?B?QzNpeVdPMUczVEdFaXd6Q1o3Rkk5L210TUpRK1ViY2crc2lxdUpJVFkrdHNC?=
 =?utf-8?B?dlVQVmlMZWU1dWo0Y1B4WVNQdTNvVmFmNFNrWmR5UXNBWnE3eDNiSEwxV2Er?=
 =?utf-8?B?czlQNWQram0wRTJ0WkJiQUYwOExmRTY0RFBQL2M1RXh6cGVHekVBY2dSMUxw?=
 =?utf-8?B?VGNackVxRkRuQTdVY0hPR0o4MGM3MlRUa01wQStmSmhQZ2EyUnpia2kwWEEv?=
 =?utf-8?B?Tnl2Vlh2Z0VFQkJ3K2RBM2UxSk5peEhBK0s0S3ZqY0ZBV1dnMlROdS9XR013?=
 =?utf-8?B?Umg1ZVY2OEhVWnI5Mno4TXNFODZvNmNoSkUybnRCVlkzZmFDYmJ0K3BHaTlN?=
 =?utf-8?B?WmlubFJSdFZqeHV0V1JiTHB2NEJmRHZNWFZyc3ZYSnN0TmEza1Y0SllkV2NL?=
 =?utf-8?B?N1UweTVHb1htNll1UGlETUF1dk90OGViUFZjRnFYWmpOSjY0RStEME5FN3ZO?=
 =?utf-8?B?M0c4Z2ZQbFdiQXMwZmVXR1Q4alMxL1VDVjZuTFRXMzRsKzJ3M1hrR0JjNGRK?=
 =?utf-8?B?ZzVtbTJiUmJKcEd6NGw4RDl6UzRoQWJIOVhscG5OelRSdW5jczlMY3VWRHZz?=
 =?utf-8?B?SHFxWlJvNzBwdVhnWldCTVBOUzZSZFZUSFE0U0xhSGlnczBMWW90Zz09?=
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
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AMBPR04MB12334.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9425a82e-4945-4be8-1177-08df2f4a6747
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2026 08:07:51.6082
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lqr4OOcCd3LvLIdh1CJZoUbivh0iGVq3VQ7Xq1+mTOpmEAZSfKRu93csAOGkcZqz/23yI2cfy7QkFFFDWomFgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BR0PR04MB472823

PiBTdWJqZWN0OiBSZTogW1BBVENIIHY2IDcvOV0gaXJxY2hpcC9pbXgtaXJxc3RlZXI6IEFsbG93
IGJ1aWxkaW5nIGFzIG1vZHVsZQ0KPiANCj4gT24gVGh1LCAyMDI2LTEwLTA4IGF0IDE4OjAyICsw
OTAwLCBaaGlwZW5nLndhbmdfMUBvc3MubnhwLmNvbSB3cm90ZToNCj4gPiBGcm9tOiBKaW5kb25n
IFl1ZSA8amluZG9uZy55dWVAbnhwLmNvbT4NCj4gPg0KPiA+IE1ha2UgdGhlIGRyaXZlciBidWls
ZGFibGUgYXMgYSBtb2R1bGUgYnkgdHVybmluZyB0aGUgS2NvbmZpZyBzeW1ib2wNCj4gPiBpbnRv
IGEgdHJpc3RhdGUgYW5kIHVzaW5nIG1vZHVsZV9wbGF0Zm9ybV9kcml2ZXIoKSBpbnN0ZWFkIG9m
DQo+ID4gYnVpbHRpbl9wbGF0Zm9ybV9kcml2ZXIoKSwgYW5kIGFkZCB0aGUgTU9EVUxFX0RFVklD
RV9UQUJMRSgpIGFuZA0KPiA+IG1vZHVsZSBtZXRhZGF0YSBuZWVkZWQgZm9yIGF1dG9sb2FkaW5n
Lg0KPiANCj4gSSBiZWxpZXZlIGJvdGggaGlnaC1zZXZlcml0eSBpc3N1ZXMgZmxhZ2dlZCBieSBz
YXNoaWtvIFsxXSBhcmUgdmFsaWQuDQo+IExvb2tpbmcgYXQgd2hhdCBvdGhlciBkcml2ZXJzIGRv
IChlLmcuIGRyaXZlcnMvaXJxY2hpcC9pcnEtdHM0ODAwLmMsDQo+IGRyaXZlcnMvaXJxY2hpcC9p
cnEtcHJ1c3MtaW50Yy5jKSwgeW91IHNob3VsZCBkbyBzb21ldGhpbmcgc2ltaWxhcjoNCj4gaXRl
cmF0ZSBvdmVyIHRoZSBod2lycXMgYW5kIGNhbGwgaXJxX2Rpc3Bvc2VfbWFwcGluZygpLiBUaGF0
IHdvdWxkIHNvbHZlIGJvdGgNCj4gcHJvYmxlbXMgYmVjYXVzZSBzeW5jaHJvbml6ZV9pcnEoKSBn
ZXRzIGNhbGxlZCBpbmRpcmVjdGx5IHZpYQ0KPiBpcnFfZG9tYWluX2Rpc2Fzc29jaWF0ZSgpLg0K
PiANCj4gVGhlcmUgaXMgbm90aGluZyB3cm9uZyB3aXRoIHRoZSBwYXRjaCBpdHNlbGYgKHRoZSBj
b252ZXJzaW9uIHRvIGxvYWRhYmxlDQo+IG1vZHVsZSksIHNvIG15IHItYiB0YWcgY2FuIHN0YXkg
YXMgbG9uZyBhcyB0aGUgYWJvdmUgaXNzdWUgaXMgYWRkcmVzc2VkIGluIGENCj4gc2VwYXJhdGUg
cGF0Y2guIFRoYW5rcyENCj4gDQo+IFsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvc2Fz
aGlrby1vdXRib3gtMTYzOTIwQGtlcm5lbC5vcmcvDQo+IA0KSGkgUmFkdSwNCg0KQWdyZWVkLCBi
b3RoIGlzc3VlcyBhcmUgdmFsaWQuIEknbGwgYWRkIGEgc2VwYXJhdGUgcGF0Y2ggdGhhdCBpdGVy
YXRlcw0Kb3ZlciB0aGUgZG9tYWluJ3MgaHdpcnFzIGFuZCBjYWxscyBpcnFfZGlzcG9zZV9tYXBw
aW5nKCkgaW4gcmVtb3ZlKCksIGFzDQppbiBpcnEtdHM0ODAwLmMgLyBpcnEtcHJ1c3MtaW50Yy5j
LiBBcyB5b3Ugbm90ZWQsIHRoYXQgY2FsbHMNCnN5bmNocm9uaXplX2lycSgpIHZpYSBpcnFfZG9t
YWluX2Rpc2Fzc29jaWF0ZSgpLCB3aGljaCBjbG9zZXMgYm90aCB0aGUNCnRlYXJkb3duIHJhY2Ug
YW5kIHRoZSBkYW5nbGluZy1jaGlwLXBvaW50ZXIgcHJvYmxlbS4NCg0KVGhhbmtzIGZvciB0aGUg
cG9pbnRlcnMhDQpaaGlwZW5nDQo+ID4gVGhlIGNsb2NrLCBydW50aW1lIFBNIGFuZCBJUlEgZG9t
YWluIGFyZSBhbHJlYWR5IG93bmVkIGJ5IGRldnJlcywgc28NCj4gPiBubyBmdXJ0aGVyIHRlYXJk
b3duIGlzIG5lZWRlZCB0byBzdXBwb3J0IHVuYmluZCBhbmQgcmVsb2FkLg0KPiA+DQo+ID4gU2ln
bmVkLW9mZi1ieTogSmluZG9uZyBZdWUgPGppbmRvbmcueXVlQG54cC5jb20+DQo+ID4gU2lnbmVk
LW9mZi1ieTogWmhpcGVuZyBXYW5nIDx6aGlwZW5nLndhbmdfMUBueHAuY29tPg0KPiA+IFJldmll
d2VkLWJ5OiBSYWR1IFJlbmRlYyA8cmFkdUByZW5kZWMubmV0Pg0KPiA+IC0tLQ0KPiA+IMKgZHJp
dmVycy9pcnFjaGlwL0tjb25maWfCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMiArLQ0KPiA+IMKg
ZHJpdmVycy9pcnFjaGlwL2lycS1pbXgtaXJxc3RlZXIuYyB8IDcgKysrKysrLQ0KPiA+IMKgMiBm
aWxlcyBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+ID4NCj4gPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9pcnFjaGlwL0tjb25maWcgYi9kcml2ZXJzL2lycWNoaXAvS2Nv
bmZpZyBpbmRleA0KPiA+IDIwYjc3ZmJjNTFlZS4uMTA1MTA4ZDJlNmZmIDEwMDY0NA0KPiA+IC0t
LSBhL2RyaXZlcnMvaXJxY2hpcC9LY29uZmlnDQo+ID4gKysrIGIvZHJpdmVycy9pcnFjaGlwL0tj
b25maWcNCj4gPiBAQCAtNTU1LDcgKzU1NSw3IEBAIGNvbmZpZyBDU0tZX0FQQl9JTlRDDQo+ID4g
wqAJwqAgdGhlIGNvbnRyb2xsZXIncyByZWdpc3Rlci4NCj4gPg0KPiA+IMKgY29uZmlnIElNWF9J
UlFTVEVFUg0KPiA+IC0JYm9vbCAiaS5NWCBJUlFTVEVFUiBzdXBwb3J0Ig0KPiA+ICsJdHJpc3Rh
dGUgImkuTVggSVJRU1RFRVIgc3VwcG9ydCINCj4gPiDCoAlkZXBlbmRzIG9uIEFSQ0hfTVhDIHx8
IEFSQ0hfUzMyIHx8IENPTVBJTEVfVEVTVA0KPiA+IMKgCWRlZmF1bHQgeSBpZiBBUkNIX01YQyB8
fCBBUkNIX1MzMg0KPiA+IMKgCXNlbGVjdCBJUlFfRE9NQUlODQo+ID4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvaXJxY2hpcC9pcnEtaW14LWlycXN0ZWVyLmMNCj4gPiBiL2RyaXZlcnMvaXJxY2hpcC9p
cnEtaW14LWlycXN0ZWVyLmMNCj4gPiBpbmRleCAxNWVlNTBmNjVkNTQuLjg1ZWRkNWUzM2NhOSAx
MDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2lycWNoaXAvaXJxLWlteC1pcnFzdGVlci5jDQo+ID4g
KysrIGIvZHJpdmVycy9pcnFjaGlwL2lycS1pbXgtaXJxc3RlZXIuYw0KPiA+IEBAIC0xMCw2ICsx
MCw3IEBADQo+ID4gwqAjaW5jbHVkZSA8bGludXgvaXJxY2hpcC9jaGFpbmVkX2lycS5oPg0KPiA+
IMKgI2luY2x1ZGUgPGxpbnV4L2lycWRvbWFpbi5oPg0KPiA+IMKgI2luY2x1ZGUgPGxpbnV4L2tl
cm5lbC5oPg0KPiA+ICsjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+DQo+ID4gwqAjaW5jbHVkZSA8
bGludXgvb2YuaD4NCj4gPiDCoCNpbmNsdWRlIDxsaW51eC9vZl9pcnEuaD4NCj4gPiDCoCNpbmNs
dWRlIDxsaW51eC9wbGF0Zm9ybV9kZXZpY2UuaD4NCj4gPiBAQCAtMzU5LDYgKzM2MCw3IEBAIHN0
YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIGlteF9pcnFzdGVlcl9kdF9pZHNbXQ0KPiA9
IHsNCj4gPiDCoAl7IC5jb21wYXRpYmxlID0gIm54cCxzMzJuNzktaXJxc3RlZXIiLAkuZGF0YSA9
ICZzMzJuNzlfZGF0YSB9LA0KPiA+IMKgCXt9LA0KPiA+IMKgfTsNCj4gPiArTU9EVUxFX0RFVklD
RV9UQUJMRShvZiwgaW14X2lycXN0ZWVyX2R0X2lkcyk7DQo+ID4NCj4gPiDCoHN0YXRpYyBzdHJ1
Y3QgcGxhdGZvcm1fZHJpdmVyIGlteF9pcnFzdGVlcl9kcml2ZXIgPSB7DQo+ID4gwqAJLmRyaXZl
ciA9IHsNCj4gPiBAQCAtMzY5LDQgKzM3MSw3IEBAIHN0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJp
dmVyIGlteF9pcnFzdGVlcl9kcml2ZXIgPSB7DQo+ID4gwqAJLnByb2JlCQk9IGlteF9pcnFzdGVl
cl9wcm9iZSwNCj4gPiDCoAkucmVtb3ZlCQk9IGlteF9pcnFzdGVlcl9yZW1vdmUsDQo+ID4gwqB9
Ow0KPiA+IC1idWlsdGluX3BsYXRmb3JtX2RyaXZlcihpbXhfaXJxc3RlZXJfZHJpdmVyKTsNCj4g
PiArbW9kdWxlX3BsYXRmb3JtX2RyaXZlcihpbXhfaXJxc3RlZXJfZHJpdmVyKTsNCj4gPiArDQo+
ID4gK01PRFVMRV9ERVNDUklQVElPTigiaS5NWCBJUlFTVEVFUiBpbnRlcnJ1cHQgbXVsdGlwbGV4
ZXIvcmVtYXBwZXINCj4gPiArZHJpdmVyIik7IE1PRFVMRV9MSUNFTlNFKCJHUEwiKTsNCg==
