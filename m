Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010065.outbound.protection.outlook.com [52.101.84.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FB464AC173;
	Thu, 17 Sep 2026 10:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789640541; cv=fail; b=lnn/m7R1VrctgOBZ8wiIcukAAC7SxK+mfxv0wbK3qUMhnOr5GSxMSVxNRSHDvOOjgFshfi4U8trNAN3Za26IdwmsUEeWwrOJ6rRev5MQErHQ0wj3/4LzOjxuTTBIj8ITvzKaNIgzKB92oUjYu1AnsKDgjVp4FNT9ZuqiA6GArlE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789640541; c=relaxed/simple;
	bh=ye9QABhpOuRMJ6ILUICfTY/MNQNFcj0bFaE5NkJlfUw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=hDdw82sXAY1djT82rXKWo3JH2sOXWnGsQY2tbhn068vKQHlmbwr83/Gjmf9FhRiXsIkcWpESADO38CbfEl7YO7uK2W1B55/Fy5T0jJWPZSki53Cjn9WZspPg0q6RblVtBGJ6qCnWsNdbAzV4Pe3UrNYOSvnTPHFfgpugMZobjOQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Qd327Vo0; arc=fail smtp.client-ip=52.101.84.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Qd327Vo0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i3DBi+JhfaT727O/M33zUaML8TFqKPT2Bek0O+RPXfkt+EF54I0zdgyPy1RQ///9aBRUmr9QP291WvJddFUJ4+Cx+haiEnovWRzzGi4NCw2PDfIYKiRIroiubs18ODvFGy0a/zthP/8AA57pt4Z/5/y1DTLuO1h7d5hgT9d6kHcIJsHJ5sxDCwMOlc4DSio7DYqvUfx4x7yVWf9u4dneImt40mUBupRECJg463JHn0NHQHuX5xG+KJix6V6PzA9FZge2DLFceVrm2stuMLn0Eia3QYNqn4E6aIRr4lRktzXfqaOV0uf71WXPOiKC0bbXTEbkviUgnCU3WaIVXkkOwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ye9QABhpOuRMJ6ILUICfTY/MNQNFcj0bFaE5NkJlfUw=;
 b=peQaglsMGe7eHWavfBIFlKumr1BCC6HXjZSiHjuIbGQ4GSq8pKlor5XdY75hwy7ylKJr10n9XMf/z0bk0OleN3KpFvWFbtO2ZL8nOIroc6acODzA2ykRlzZC6CV10NSB0VqZX2HV8b8whawIMfeH2f371IXJjV+p6SXLVrnUE8t2UZ1XhrRXsXLHftvQg07InT3PULkZ/J3fl4LnKqaPynARln6BefTkxkact70N8u0InsGUZtC/LP2Wh34d0z5KLy4UrM/JiZfV1uAdTTQ39j8DSfppr6QMdlpp7sFknQijzi6Tu74sZXsekY1N5/po9id+Uuo6dj+yVj4E9iF0/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ye9QABhpOuRMJ6ILUICfTY/MNQNFcj0bFaE5NkJlfUw=;
 b=Qd327Vo02HZ6z9bZbYyTbrjjFxvj3VbFClY5+baH7c8Nw2EgEd6s2jlkWl1ycq+Cu0RPhd7fIPDq7mBQ6gS0oje2ClXEG4XLvnS00546LPw6MdyVL0LSqJkAatMxY5AtY66+cxCGYknPdt9tYZzJsvgVOCTLy205uo7whS5oR/i+vVy6HL7X1QoRQmS6ZfCqIECZgIJUXdcaEpozg5waP+pxkXyH0maKTlxMw7TQxJsk9Db+XkYhfRlafps+cSW8dHUGcu5gxHCLnfvOIY9vI/Z/a3Gr4pClTEqtY0nmBi1ZdOIn+0WZKXYIKKhOT1FisbrAOgb9kxhv7q3nxu1xJw==
Received: from GV2PR04MB12271.eurprd04.prod.outlook.com (2603:10a6:150:32a::5)
 by VI0PR04MB10853.eurprd04.prod.outlook.com (2603:10a6:800:26c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Thu, 17 Sep
 2026 10:22:09 +0000
Received: from GV2PR04MB12271.eurprd04.prod.outlook.com
 ([fe80::3b38:4ed4:2164:c035]) by GV2PR04MB12271.eurprd04.prod.outlook.com
 ([fe80::3b38:4ed4:2164:c035%5]) with mapi id 15.21.0428.008; Thu, 17 Sep 2026
 10:22:09 +0000
From: Pankaj Gupta <pankaj.gupta@nxp.com>
To: Frieder Schrempf <frieder.schrempf@kontron.de>, "Pankaj Gupta (OSS)"
	<pankaj.gupta@oss.nxp.com>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan
	<skhan@linuxfoundation.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li
	<frank.li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel
 Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Randy
 Dunlap <rdunlap@infradead.org>
CC: "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: RE: [EXT] Re: [PATCH v50 3/7] firmware: imx: add driver for NXP
 EdgeLock Enclave
Thread-Topic: [EXT] Re: [PATCH v50 3/7] firmware: imx: add driver for NXP
 EdgeLock Enclave
Thread-Index: AQHdQqq2wHlNwya8KUuV3Wi6bHqRz7bN5wyAgAAAiQCABK7E8A==
Date: Thu, 17 Sep 2026 10:22:09 +0000
Message-ID:
 <GV2PR04MB12271B5BA2DF548C5B046120295B82@GV2PR04MB12271.eurprd04.prod.outlook.com>
References: <20260912-imx-se-if-v50-0-80834ef510d3@nxp.com>
 <20260912-imx-se-if-v50-3-80834ef510d3@nxp.com>
 <2062655f-886d-4194-b7bf-3048b7139c7f@kontron.de>
 <9d1fb5e5-e0ad-4fbb-83ee-5f267db4f030@kontron.de>
In-Reply-To: <9d1fb5e5-e0ad-4fbb-83ee-5f267db4f030@kontron.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_Enabled=True;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_SiteId=686ea1d3-bc2b-4c6f-a92c-d99c5c301635;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_SetDate=2026-09-17T10:18:11.0000000Z;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_Name=NXP
 Confidential;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_ContentBits=3;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR04MB12271:EE_|VI0PR04MB10853:EE_
x-ms-office365-filtering-correlation-id: 7d95356b-08d1-416b-2e21-08df14a5882a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|19092799006|366016|376014|7416014|1800799024|38070700021|921020|56012099006|11063799006|4143699003|10067099003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 C7m3dWEAcZnz3CmgOMv9sAFqBXxnDxHfE1XGsT7RVpiTL/viMadEr6dw+K3NPIp0bTMgvPrFFie5xZS0cuENhqy0bbcnBhgihsskoU3GRHR+mBOroTwISHBALJcdX2pGuJzYeImZ++V157JBat1q7snsKo7JAEGMOFffb5RwmxXDufcFD8eYKuNqi0cQ8kexnF+CMLSomtlAe/4S0FqB32i2KCoEnvmO6lVVIVHkdAmme5zuoHaKGp9smF8nLFwGKPB6fWJi+SAD2RJz6EL8tyCC1coHdJYKQIq18pisTLJhqBzaBckCr58q450yGyBdslC0BMPqZN73NiurmSGKeKsLnSC4zrTu9XDktCjkcFRKAsuUbWdWj1l6XMZCwT0R0chi/5RWhe9gvxE8/6UahrPHG8taFpFHU4TeUudVwcZbfLkwfV0+DfqYDa468Wt3XQ5EcynGQO78rHRSoWz3+KSRWrg9rxV3j5Ud2rwCL4cg279mu34D8gguvAJol6pWszWRfz98greiCbK2Ykqa2ROzC5tE/lSAjDFSDZwApYanHeT+U+VC+ryHWRhdv3sc/nzf8DjhgSH9ecIYdF4UWsasgaQ4pRfy9f9r5AhejsP2NfWgZ8MpPu8kZHO0izH+4NL0y4xuoTCyorB2LtX8X5a2A3pIdgST3u/9ZV8BPH7i7P5YlCIXXYSQHwlsUIl7ZjZnUFOW4S/YJT45RLGTl8kt2Nvz08M45p4M9X3h+YdvfGzvMHh3vyG0Q0HPznCZ
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB12271.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(366016)(376014)(7416014)(1800799024)(38070700021)(921020)(56012099006)(11063799006)(4143699003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MnYwV0NsWjkzbXhOWWQyNjNBOXJzdHBjZlBESTUwNnhmalN1em50eXROVGRG?=
 =?utf-8?B?TjVJRHJrODY0SVlMV09QS1VEL1FOY1ZBa2IyOXpXMGJSNFlyN2NmeHRBSGxi?=
 =?utf-8?B?L0ZJekdSbE91cXZITlpjTXo5UVoyUENLczVPTVZFUjI1RWtleVhFcmViaEpa?=
 =?utf-8?B?NzVoalNNRHlFUndGV0VIWFZLVWJINmhaYTlpWHBha3I1YWlpaEJzTjFTQlAw?=
 =?utf-8?B?NUhvYVNjL215WnhHQWVUdnAzRlZIMkt0V2d6ZnU5K2hGTmhCeFRvdUFlVzFH?=
 =?utf-8?B?R2xVRTE2eVBPUWhFaXpzY1lyclZNVC9CWnlUTW9keG8rRzkyd1p0VGZBSGEz?=
 =?utf-8?B?U3NPdnZ5eGZDaG9Xelo1YnNzY0hQZmp1U2pMd1JGNCtBUEpVT3VId2VjbVE4?=
 =?utf-8?B?bmd2TDRVUjF4OUdoUXE5Uml6bWRZa3ZRSHh1OWc0U1R5eDlHbEt0d081b0Vr?=
 =?utf-8?B?aFNHamdiOXhWUGEyZENOTUZNNjhaMXVCbC91MlJTTFpYZmpkNTJvb0IwRm9G?=
 =?utf-8?B?UkdpYzN4YUxDbVJsYUc4SVNQb1V0K2xWV0JscGI5MlMvTU0xOWZldmppeUda?=
 =?utf-8?B?Z3Vhb2M5bTVmNDIvTnpDdzUybDlZU0ZYaWRrQzlLTkkwN3d6TklPMUk2L3Fh?=
 =?utf-8?B?bWtJVngrMC9KWUNoQVRqWDBLZFNTWlVQc21hYUhMY3hFOG1xY2xJTTFqak5j?=
 =?utf-8?B?WWQveGRwWnFwNWR2K0t6UWYvUGNpQTlINldLeTJqY1JieHpTcHB3Q0x6RCtV?=
 =?utf-8?B?YkhCTmtFN0tJbktrOXdiQ3VLcHYyL3NoSGEwdGRvS2xDUEdweFAxSUFEc2kr?=
 =?utf-8?B?ZHEwKzVmTnJtSEVGd0FHRWpVZWFJQTdRekphSUdFWEI0b3hLUXo2MlQ5OHFL?=
 =?utf-8?B?UDFZaHQ3NE5kdm9KRjRoemh6Z24xcHB2cFFtMlgvc25mVDRXQjlTK0pXNUFR?=
 =?utf-8?B?dEZjb25jcFZ2ZFpmSGtMbmxFa0ZYa05CdlZjMDQvQktqRmJEenY4N1EyNGhq?=
 =?utf-8?B?YWlHbWFQRzhJaE55dGN1VTR4bUZIcVdHNE05QVhwRHpoOUdPUTVDVXdoSGNU?=
 =?utf-8?B?cy9GY0JBVnRsWGMzbHVxY3ZPeXZRdjEwZHA3Ykt6RTB1T3BpcEN0Wk5nYkk5?=
 =?utf-8?B?YmxqTDAydmREQnFFc2hLTjBadDdSclAyMElINFFndVZFZk50bTZsS0NQRHpw?=
 =?utf-8?B?ZFhwVncrV0dhMTBES3V0UklSL3hqUEtPaHZYeHZLbityQk9QRnRoSlNMc2Nv?=
 =?utf-8?B?RHBKejZLd0M1cjgzZ3ZMZGY4Rzd1VHQyZlh6UFJ3MGFKWU1nYmIxa1NiZlY4?=
 =?utf-8?B?M0gyZjNwMUs0Zk1saUZkZVJQWUdjbTFyUzNRdnptZ3Uxek5nM3RUVk5vd2ph?=
 =?utf-8?B?QmlhbUEzUDFueTJXakd6SDV1cmYrQjZXcVFnNHhvaVdxNUtqMnNScHVqWi9Y?=
 =?utf-8?B?U0lMeUh6SWRqUlVTMzFqM1BpRXc5cGRmQUpNaHdYNzk1UFVodlBwTSs5MnVX?=
 =?utf-8?B?V0Yzb2VaR3p0VkwxMEl1ZUk3eDNCbEFxajQwR25HQzJValZ1OTJPSndaUTJl?=
 =?utf-8?B?TTdwMHZHQmwwaGNxZ3Vsc1VaTTIxRHdDTHY2eGZtR09odnN2QTBSR2prZDYx?=
 =?utf-8?B?dzV4bkFtUVMvMDRNeEUzT3BCVnVqSEVJNGFoVkd2S3ZtS2FnZk1DeUt0K3pu?=
 =?utf-8?B?blNpb0FEVlpkRFF5bjNHb2RXSlNLQ0dzRzIwaExMSUREMldBNmJTVDFhSlZC?=
 =?utf-8?B?VWZ6Rlh1N2d2d3djbVVOOU4vaGtGb2xBeWRwNFZzKzQ2TVNoYksxa1NiK2pF?=
 =?utf-8?B?MXhyZHVmY2hSS1pnN2ZhYy8wc1VTQUpKYk9WU2RnSlNaOVRMK1JSRmxFcWZP?=
 =?utf-8?B?SGc2Yll0R1pTaU4rMlhLcTYxQmRoR1VFQmFsUXlzNktMdjM1ckt1aDloR1Uy?=
 =?utf-8?B?d1VDZHBDWkM5cFdxOHNlRlJUQTF2SWIwYkdCQ0k0T3hhRDVzVXMrVytHdDhE?=
 =?utf-8?B?VlRmVGMyV29QcGhSWnFJakNzMEN2d283ejUzVUt0UUlTZ0ErTEZaWk9DbHMr?=
 =?utf-8?B?RkNxclJ2OXpZMm0zZkx6Rjk2dVM4UHFBRHN6Ti9FS25TSXk3VDQ5bW5ORzIz?=
 =?utf-8?B?K1VUK3c1V0NpODFlQnRBaWZjY1FkdkVoWnNoeCtBMExXbHBCSTNmZTFvVzhx?=
 =?utf-8?B?b3ZweXZkTkZoTFlUS2szakdtQnFUVW1IRnZyelQzOTBncEp3ZmxMWjYyOElo?=
 =?utf-8?B?QnRlQk1TdFA3RSsrWk11NUVacjAzaklOQXowRWhLNlRQTWxLZFJENGd2c2s5?=
 =?utf-8?Q?gdDtIGznky2kbJoI03?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB12271.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d95356b-08d1-416b-2e21-08df14a5882a
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2026 10:22:09.6497
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9JJltbIaCjP9cfHgdx3arfAUtWmiXu97W3QtZTsEbXVrmK77WAv3K8cqJSxO0Q/brvsvDPM3aUhmtIPErM3Rjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10853

VGhhbmtzIEZyaWVkZXIgZm9yIGV4dGVuZGluZyBoZWxwIGhlcmUuDQoNCk9uIHY1MSwgcmVxdWVz
dCB5b3Ugc2hhcmUgeW91ciByZXZpZXcgY29tbWVudHMgdG9vIGlmIHlvdSBoYXZlLCBhcGFydCBm
cm9tIGV4dGVuZGluZyBzdXBwb3J0IGZvciB0ZXN0aW5nLg0KDQpSZWdhcmRzDQpQYW5rYWoNCg0K
DQoNCk5YUCBDb25maWRlbnRpYWwNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJv
bTogRnJpZWRlciBTY2hyZW1wZiA8ZnJpZWRlci5zY2hyZW1wZkBrb250cm9uLmRlPg0KPiBTZW50
OiAxNCBTZXB0ZW1iZXIgMjAyNiAxNjoxOA0KPiBUbzogUGFua2FqIEd1cHRhIChPU1MpIDxwYW5r
YWouZ3VwdGFAb3NzLm54cC5jb20+OyBKb25hdGhhbiBDb3JiZXQNCj4gPGNvcmJldEBsd24ubmV0
PjsgU2h1YWggS2hhbiA8c2toYW5AbGludXhmb3VuZGF0aW9uLm9yZz47IFJvYiBIZXJyaW5nDQo+
IDxyb2JoQGtlcm5lbC5vcmc+OyBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprK2R0QGtlcm5lbC5v
cmc+OyBDb25vciBEb29sZXkNCj4gPGNvbm9yK2R0QGtlcm5lbC5vcmc+OyBGcmFuayBMaSA8ZnJh
bmsubGlAbnhwLmNvbT47IFNhc2NoYSBIYXVlcg0KPiA8cy5oYXVlckBwZW5ndXRyb25peC5kZT47
IFBlbmd1dHJvbml4IEtlcm5lbCBUZWFtIDxrZXJuZWxAcGVuZ3V0cm9uaXguZGU+Ow0KPiBGYWJp
byBFc3RldmFtIDxmZXN0ZXZhbUBnbWFpbC5jb20+OyBQYW5rYWogR3VwdGEgPHBhbmthai5ndXB0
YUBueHAuY29tPjsNCj4gUmFuZHkgRHVubGFwIDxyZHVubGFwQGluZnJhZGVhZC5vcmc+DQo+IENj
OiBsaW51eC1kb2NAdmdlci5rZXJuZWwub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3Jn
Ow0KPiBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZzsgaW14QGxpc3RzLmxpbnV4LmRldjsgbGlu
dXgtYXJtLQ0KPiBrZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZw0KPiBTdWJqZWN0OiBbRVhUXSBS
ZTogW1BBVENIIHY1MCAzLzddIGZpcm13YXJlOiBpbXg6IGFkZCBkcml2ZXIgZm9yIE5YUCBFZGdl
TG9jaw0KPiBFbmNsYXZlDQo+DQo+IENhdXRpb246IFRoaXMgaXMgYW4gZXh0ZXJuYWwgZW1haWwu
IFBsZWFzZSB0YWtlIGNhcmUgd2hlbiBjbGlja2luZyBsaW5rcyBvciBvcGVuaW5nDQo+IGF0dGFj
aG1lbnRzLiBXaGVuIGluIGRvdWJ0LCByZXBvcnQgdGhlIG1lc3NhZ2UgdXNpbmcgdGhlICdSZXBv
cnQgdGhpcyBlbWFpbCcNCj4gYnV0dG9uDQo+DQo+DQo+IE9uIDE0LjA5LjI2IDEyOjQ1LCBGcmll
ZGVyIFNjaHJlbXBmIHdyb3RlOg0KPiA+IE9uIDEyLjA5LjI2IDE5OjAzLCBwYW5rYWouZ3VwdGFA
b3NzLm54cC5jb20gd3JvdGU6DQo+ID4+IEZyb206IFBhbmthaiBHdXB0YSA8cGFua2FqLmd1cHRh
QG54cC5jb20+DQo+ID4+DQo+ID4+IEFkZCBNVS1iYXNlZCBjb21tdW5pY2F0aW9uIGludGVyZmFj
ZSBmb3Igc2VjdXJlIGVuY2xhdmUuDQo+ID4+DQo+ID4+IE5YUCBoYXJkd2FyZSBJUChzKSBmb3Ig
c2VjdXJlLWVuY2xhdmVzIGxpa2UgRWRnZWxvY2sgRW5jbGF2ZShFTEUpLA0KPiA+PiBhcmUgZW1i
ZWRkZWQgaW4gdGhlIFNvQyB0byBzdXBwb3J0IHRoZSBmZWF0dXJlcyBsaWtlIEhTTSwgU0hFICYg
VjJYLA0KPiA+PiB1c2luZyBtZXNzYWdlIGJhc2VkIGNvbW11bmljYXRpb24gaW50ZXJmYWNlLg0K
PiA+Pg0KPiA+PiBUaGUgc2VjdXJlIGVuY2xhdmUgRlcgY29tbXVuaWNhdGVzIHdpdGggTGludXgg
b3ZlciBzaW5nbGUgb3IgbXVsdGlwbGUNCj4gPj4gZGVkaWNhdGVkIG1lc3NhZ2luZyB1bml0KE1V
KSBiYXNlZCBpbnRlcmZhY2UocykuDQo+ID4+IEV4aXN0cyBvbiBpLk1YIFNvQyhzKSBsaWtlIGku
TVg4VUxQLCBpLk1YOTMsIGkuTVg5NSBldGMuDQo+ID4+DQo+ID4+IEZvciBpLk1YOXggU29DKHMp
IHRoZXJlIGlzIGF0IGxlYXN0IG9uZSBkZWRpY2F0ZWQgRUxFIE1VKHMpIGZvciBlYWNoDQo+ID4+
IHdvcmxkIC0gTGludXgob25lIG9yIG1vcmUpIGFuZCBPUFRFRS1PUyAob25lIG9yIG1vcmUpLg0K
PiA+Pg0KPiA+PiBPdGhlciBkZXBlbmRlbnQga2VybmVsIGRyaXZlcnMgd2lsbCBiZToNCj4gPj4g
LSBOVk1FTTogdGhhdCBzdXBwb3J0cyBub24tdm9sYXRpbGUgZGV2aWNlcyBsaWtlIEVGVVNFUywN
Cj4gPj4gICBtYW5hZ2VkIGJ5IE5YUCdzIHNlY3VyZS1lbmNsYXZlLg0KPiA+Pg0KPiA+PiBTaWdu
ZWQtb2ZmLWJ5OiBQYW5rYWogR3VwdGEgPHBhbmthai5ndXB0YUBueHAuY29tPg0KPiA+PiBSZXZp
ZXdlZC1ieTogRnJhbmsgTGkgPEZyYW5rLkxpQG54cC5jb20+DQo+ID4+IFRlc3RlZC1ieTogRnJp
ZWRlciBTY2hyZW1wZiA8ZnJpZWRlci5zY2hyZW1wZkBrb250cm9uLmRlPg0KPiA+DQo+ID4gTXkg
cmV2aWV3IHdhcyBmb3IgdjI1LCBteSB0ZXN0IHdhcyB2YWxpZCBmb3IgdjI5LiBXZSBhcmUgbm93
IGF0IHY1MCwNCj4gPiBzbyBwbGVhc2UsIGFzIHJlcXVlc3RlZCBiZWZvcmUsIGRyb3AgdGhlIHRh
Z3MgYXMgSSBkb24ndCB0aGluayB0aGV5DQo+ID4gY2FuIGJlIGNvbnNpZGVyZWQgdG8gYmUgc3Rp
bGwgdmFsaWQgd2l0aCBhbGwgdGhlc2UgY2hhbmdlcy4NCj4gU29ycnksIEkgbWlzc2VkIHRoYXQg
eW91IGFscmVhZHkgcmVtb3ZlZCB0aGUgUi1iIGluIHRoZSBtZWFudGltZS4gQnV0IEkgZ3Vlc3MN
Cj4gdGhlIFQtYiBzaG91bGQgYWxzbyBnby4gUGxlYXNlIHBpbmcgbWUgd2hlbiBhbGwgdGhlIHBy
b2JsZW1zIGluIHRoZSBjb2RlIGFyZQ0KPiBzb2x2ZWQgYW5kIEkgd2lsbCB0ZXN0IG9uY2UgbW9y
ZS4NCg==
