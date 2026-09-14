Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012006.outbound.protection.outlook.com [52.101.66.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD4A343E069;
	Mon, 14 Sep 2026 10:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789382862; cv=fail; b=UUi1GvyRt+8/ZfmRlDXwCN9BShoz4m2PDi/nDaM+7W3mbAv0z6Bb67aH+DlugcUzAHALjuPboRQbic4/o92mutZTNGOh+UBp5EdV8iuxTooZmtkiNIU6ohYzW9lOWtk0v77WXuZwwgtwUuvCLJocOZCnM7Exez00zTsQLAP2e8o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789382862; c=relaxed/simple;
	bh=ZiUmIMptgCmgG1i4hry5o38n3j7WMx+L68YhH/ZWIeI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=hCfk6Bn/Vk1KPNa/c/KOnfEE16XpoF09A9hZqOLU8UMHlQy3sRw53gtUlCKxSRiCvenxh2glMI7c0pikPP6DJ34BYBwCn97LSll5Iz6JGtIgjzDwHrXgPDBGfCjq7tCAoN0Lb9LRr/tKczyaeaoAqI+qv5nJsY3dM6N9v3ENgxA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=WrNptZ93; arc=fail smtp.client-ip=52.101.66.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="WrNptZ93"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SQnBOMfPshVvfzVF8eCb2LDpDoPgFZe/ZLG4CQAzz74weZ6EwvZYaDBnoYOOC8BRTlco3wcTGttt6p4JLzFzdj8IEPCZpzC+rJxvntn4DyPaHTRV+F/LowWKbiz6inS1yYGIXlU30NU6SwdypLFT2b8cmtfHNfrR4DynKNCkU7CeD7hed5DB8dkf4iLL71S+6xK5TEKRWoGhO5LMErWMCSeYDB/ki5vJxtrSVKYH7Wf59iwWigvU8S6syPviYJN8VJ8lbd9KqDSFBfXwGCPU7NMSqV/40EoCK+r2A7Cr03V4eizAaeRWaGLi8Qcm1N9c5nZ8scwgJLeNOMc+5E3KrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZiUmIMptgCmgG1i4hry5o38n3j7WMx+L68YhH/ZWIeI=;
 b=WmTGnKlCtbBHqN08n0LLP1J1fqOvqiW/0t84dlCtdzz/d3HVnuX2tvzgBs2V7nX+3IxOPENfVsw9mMDssC1OhIEDjtAwfNCH51imvx9QbDIxenimzQdbf8J/HXY8oMKisJTnDtc5m1vb4pA+5kn9LhIWnFkndlOyDNNyRaC8ejEFWeIniHlVXifs/8Y7nb8PBlk6XTZKfZNjpAKdw7l4lgLOvmBOfmKfYHMOKYjbeqF7yGxtN055N8LjRMkBboYEX2Pq6lILlNEXH0CMtAfwADD0CnZcDCR2SUJoQ7/gYwRFMHBBws9Qi9I3PiA+UrnfkFtL33jbQaz83JHLHlTQjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZiUmIMptgCmgG1i4hry5o38n3j7WMx+L68YhH/ZWIeI=;
 b=WrNptZ93ge0ruqgOLMbGUUh19may/XN/oA5BHnUq8EOqpVxCvRreUuz8zgvQelehsFsQ7MbKqq4FB45aIX8HleiMN1AJtS890OAy113JKsW7JnMxz6VEvfMjkK2l4AuvLVA6L+jJcCcZK6nVHzYzzXp25LQTmw2dsZEwETb379AZfeZvMhpM+IQFjA74+nb2Klh7kghMMdd6NG9hjJ/Ccii1AKGHRBwHo0bWQ3NswiM8LecJ656rYBHfttONibxKMc+oNtYPD8Eskv0jmbmvRXFZColWCwPWcN9K6B8CEcqP7xlDORmVib34wIDW2qz9v1PsXD98KxzoQybyL52wnw==
Received: from GV2PR04MB12271.eurprd04.prod.outlook.com (2603:10a6:150:32a::5)
 by AMBPR04MB12614.eurprd04.prod.outlook.com (2603:10a6:20b:778::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 10:47:31 +0000
Received: from GV2PR04MB12271.eurprd04.prod.outlook.com
 ([fe80::3b38:4ed4:2164:c035]) by GV2PR04MB12271.eurprd04.prod.outlook.com
 ([fe80::3b38:4ed4:2164:c035%5]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 10:47:31 +0000
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
Thread-Index: AQHdQqq2wHlNwya8KUuV3Wi6bHqRz7bN5wyAgAAAJVA=
Date: Mon, 14 Sep 2026 10:47:31 +0000
Message-ID:
 <GV2PR04MB122719EBC86A6DE7400D70BC795BB2@GV2PR04MB12271.eurprd04.prod.outlook.com>
References: <20260912-imx-se-if-v50-0-80834ef510d3@nxp.com>
 <20260912-imx-se-if-v50-3-80834ef510d3@nxp.com>
 <2062655f-886d-4194-b7bf-3048b7139c7f@kontron.de>
In-Reply-To: <2062655f-886d-4194-b7bf-3048b7139c7f@kontron.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_Enabled=True;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_SiteId=686ea1d3-bc2b-4c6f-a92c-d99c5c301635;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_SetDate=2026-09-14T10:46:13.0000000Z;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_Name=NXP
 Confidential;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_ContentBits=3;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR04MB12271:EE_|AMBPR04MB12614:EE_
x-ms-office365-filtering-correlation-id: 4b7b1ba8-d766-4107-c19f-08df124d93ee
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|366016|1800799024|19092799006|10070799003|7416014|376014|11063799006|4143699003|56012099006|10067099003|22082099003|18002099003|38070700021|921020;
x-microsoft-antispam-message-info:
 NlNBib6MxuI9Fb3jXJbLz/QSUnACgJ0+AU3riaKDPejJ1ZZr/PWOe8mPigVumW6z5BsNdxSbacZdcm1Ox2MRA/9uPbmJQs6q+5YpB/pdgo+OR53XHbvBFNe5EBVxLCzRvuPEB5RhgjBlT9VyNcdEhYtp0tOBSBtSAWjg/sgPHj5du0lRI0+nMPTuWKtsiuOUGWQO6ZQgF4xHVlRoYYI7SAthiniaD81hIGrWDI40iIkTPY/cNI7NeWkL3Ivr9NSc+78iliU8iv4irkhf4OzuOOxxoa1aFAKZrUgEOAVywQSVxnTflP3xSRBw4H91YrA55owfhMFmIn5q05w6zXAjE1jQLna8JwuTYdKhmLNQx6ZTalnAW7JzwKpnLDJEi8au+eJorfs5u9vSyPtYQWxhrlfVydpOtKNpPM7RlNQv0O+RoOD7t2xoyiK1sH/at+CDWA40QDwFg+T+yk4tb52P0kO6d/LDP8ME7WlaNIEskI5W3BLodU94bI2TSZOjdhREjnDuOJDqMiplxuJB8ae5AJAw0T8tmkyE1kXtdH1bwK7CDOwAZ7sKp+nn9c+TAN/DLn0lG3i1U4gLgSrYpgO7CZdvQZXS9hi5FZTsDNY+P23Cz40mpiww8WtnQGIs0ao6fR28K9Xh/+6JWVaJCGkALUOH4ljSX9xwTVWWvI6qqXfnmlytsTgybzwGyj1CP+7X3AS1ZJ+m8BKjM4RnMTg+EzLH/gqIG8DWWVf+CE2R/77J+QCNw9S7dr7pfKU5Rnn8
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB12271.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(19092799006)(10070799003)(7416014)(376014)(11063799006)(4143699003)(56012099006)(10067099003)(22082099003)(18002099003)(38070700021)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VTNjTG5scm5GOVlZVDZ3RFRSYlJLMzJ2RlVBbkl6T1R4N3hzYXRGNUtZQjNp?=
 =?utf-8?B?VVJyOFJFOVRXREFnOVVwZTdaMHd3VUU3MDd6ZlBGdjl2azZPRWxTYnVBeEJZ?=
 =?utf-8?B?RVZHOHAzNm5lS245Y05McUZoRWxiL2F3SzM1UHpqenl0Qm1pUjVyL0dnam1U?=
 =?utf-8?B?K0FFUGhJTk9aOEdYcHFSaTFnSmgvUVlXVHFEU3Q0SHRIZHF5MG00ME5MbjFX?=
 =?utf-8?B?OVRnQnBFZFloa0l5c1ZSblFTZTAvblZEd3RLOWpMV21HeUVrdmszdm4zL3ZH?=
 =?utf-8?B?bkF2YW1FQ0VqWWJ3dS9wY0tUQlVSVjVHR1RmV0wzVDBxZFUwS1d6MUdJMEJj?=
 =?utf-8?B?ZXBRcEllVXg0Wk85dWgzQVhFeDVWZTMwWkNneWdLeHNWYzA3THhDYjVzM29i?=
 =?utf-8?B?dEtHMk54VHBTdXNVbnhHTHpxdEo0dW1mMGw3UEZFRmxSQ25LaERtcUduaTFM?=
 =?utf-8?B?ZzlleGVWZXBoWUphU3NiNWF6NG5JbjJBS2JtS1BzelZOaEYwSnZ4U3pRaTE2?=
 =?utf-8?B?SUt6L3Z3QVZWaytybFphRTZsOU52M2NCeER6V1Y4NGVlMG5ZUlZzcVJxaG9n?=
 =?utf-8?B?OFZTaVY3Q3UwTmdiVTZxaEY3R0ZKTVd2dld5OUh0RXpUOEVScHN2SkRHbnd2?=
 =?utf-8?B?eVpYTG5OOVN3THpUUXhHZi9vaUhmV1k4QUs2SVlXZ2l1SmdTQVBuaHR1Z0lI?=
 =?utf-8?B?Z2MxUUVYWjFaaCtKVElySTkxdFI3ZEpuSkpiaWR4bmZrcW9oQk1PaW5VZjcx?=
 =?utf-8?B?STlYTHh3ajhMRGlTbGdIN1pxQTBleHU0RERTNGRWOXNPTDY1aFJXUXN4Q3pL?=
 =?utf-8?B?S2d4Z3UzR05teE5BaGFEZytJdnRMWGlsY2xVV1pnMVNXTG1USDQzTkpTclRj?=
 =?utf-8?B?SlVwS1NWdDJuMDNQRlFwcjRIQ3NvUDI4R3FIZVZGTytHbGNzYiswMkI1d0xk?=
 =?utf-8?B?MjVTNU56TUZLWEhTWXFkTTgwOFFsQk1JMnVCN0w5VXBIMSs0cUhGM2xPeDNs?=
 =?utf-8?B?M2NraEoxRnREbFZ1OFU2b0pwYVUvK1V6WUV6THBWc1U4TWQ1SEFXZzAzaklE?=
 =?utf-8?B?UHJyMG1QUHpNeGJEWHdHbmJwZ2RJbXlmOS9RN3FSaldrd3FNQW9peUpMM2N6?=
 =?utf-8?B?WDZsc0dTclJxcjFSUjVaZGJhUkpLTlJsQ1QxU2tpTHdPUXVyVVlLbTh3QnRa?=
 =?utf-8?B?bGl0N2MyNVpMS1lNbVZXaFluQ1dhcXV6bkcwZUJYTk9GbVQ1MEVzeEluT0N2?=
 =?utf-8?B?VUM4WG90T0hlek9XMVNtSGVaeldJMXY5bHBFUkRNR3NXY1VVaFBIZUNZblA0?=
 =?utf-8?B?emRxSUgwTW5KL0pVQ20rcStKeE1FY2lQNzNlbjBJOVRRS0xRa28wc3BHMldm?=
 =?utf-8?B?bXlXQ2pzMkxydERJcVBpRHVHTXEzTzJXem1DRUNUcVNSTmxYcEtuK1paRW9J?=
 =?utf-8?B?VVV4WmlYanVxbHNWb1h4M1doUjFSSjBRSkRiY2d1TmR6UDZ1aTZ5dWsreXNy?=
 =?utf-8?B?ZjliRU1Lc1VlOGE1RFp3WnFKQUdCVVRzTkNpNGk5YXZkbmxiYjZxMUx3MlRv?=
 =?utf-8?B?ODcreERLUW5WSS9oT3JlVDZIOFhxWXNVRitkTXNnM3BJb294dUI4Yml5Mlhh?=
 =?utf-8?B?aGNoZkhFWDB3azRFSjI3TEFMaDNSTjRJMlB1eXlmeXI1d2hNOXQwMEtNTmJh?=
 =?utf-8?B?bGhibzFoSTdVSEZYTXdTK01JM3F5Z2Z4QWRQTVVFK2ZldWF5RWlTUm1JVXlz?=
 =?utf-8?B?MjFaL1VieStxMmNCMzdtRTRqcnZ3L2d1VFVIUTFhVW9wRVFWejNoSmhhQU8v?=
 =?utf-8?B?NmlDdTNQYlg2cFNZaXpuS3lKb2pYdWdETStHOWtXTFNUU0xvYkZIb05xM2hD?=
 =?utf-8?B?UTdGV0FkWllRaWUzaGlvdGlVRW84by9PUlBvWFRCcm5vUTducnJtMlBwdTE5?=
 =?utf-8?B?bFNzNTdJN3VYSjgrZGNpTllXQ1BxQnZKNXZ4Z1FVUDlGNEs4VWdydDJjckpD?=
 =?utf-8?B?ci9YM3VTTGNZaU5lNmZwS0FiMXJHNVA4S2NWVzZER0pwSE1qUjhRMkNManFQ?=
 =?utf-8?B?TE56dWMvdUVjSXdRbkpwWnljbWFpUC8xZ25BZmFTaURLSEMrc3ZBR2I1cDly?=
 =?utf-8?B?Q01Wb2tTbUJKYW9MUG9hSnNKMjR1M3NUZTJKSW5FOEdBcU5iU2RNVGlZYWMr?=
 =?utf-8?B?WDdXVWNaY2ZVa2l0UitlZ092ZHNGUGV5OFV0TklOWWc2VExHTWZYVFFTREtI?=
 =?utf-8?B?aExrZVVKdHdRVENkR3JKb0pxSXlnMld4WUhUY2x6REhUNThkbFZJb2U4cjE3?=
 =?utf-8?B?RytqUS9wV3RsVG9HdE9PWk9BUWtCRXJpSE9jdURsajd5SEQrY0VOdXp2RUZ4?=
 =?utf-8?Q?DVbZbTCJv8Yy2EfNYwbNzCqg+J4XIAOB56sDFdtDF7/VM?=
x-ms-exchange-antispam-messagedata-1: hvkpg/Qb6K3Mpg==
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b7b1ba8-d766-4107-c19f-08df124d93ee
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Sep 2026 10:47:31.3100
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mDHIW4akBtfB8FjG/5sXRVmB4ogy/3WtMEzDUeuZ7z972iVu24h7O2y8YmwPtIRVYqFvoF2GN0p/URXO5bPGXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR04MB12614

U29ycnkgZm9yIG1pc3NpbmcgaXQgb3V0Lg0KSSB3aWxsIGRyb3AgaXQgaW4gdjUxLg0KDQoNCk5Y
UCBDb25maWRlbnRpYWwNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogRnJp
ZWRlciBTY2hyZW1wZiA8ZnJpZWRlci5zY2hyZW1wZkBrb250cm9uLmRlPg0KPiBTZW50OiAxNCBT
ZXB0ZW1iZXIgMjAyNiAxNjoxNg0KPiBUbzogUGFua2FqIEd1cHRhIChPU1MpIDxwYW5rYWouZ3Vw
dGFAb3NzLm54cC5jb20+OyBKb25hdGhhbiBDb3JiZXQNCj4gPGNvcmJldEBsd24ubmV0PjsgU2h1
YWggS2hhbiA8c2toYW5AbGludXhmb3VuZGF0aW9uLm9yZz47IFJvYiBIZXJyaW5nDQo+IDxyb2Jo
QGtlcm5lbC5vcmc+OyBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprK2R0QGtlcm5lbC5vcmc+OyBD
b25vcg0KPiBEb29sZXkgPGNvbm9yK2R0QGtlcm5lbC5vcmc+OyBGcmFuayBMaSA8ZnJhbmsubGlA
bnhwLmNvbT47IFNhc2NoYSBIYXVlcg0KPiA8cy5oYXVlckBwZW5ndXRyb25peC5kZT47IFBlbmd1
dHJvbml4IEtlcm5lbCBUZWFtDQo+IDxrZXJuZWxAcGVuZ3V0cm9uaXguZGU+OyBGYWJpbyBFc3Rl
dmFtIDxmZXN0ZXZhbUBnbWFpbC5jb20+OyBQYW5rYWoNCj4gR3VwdGEgPHBhbmthai5ndXB0YUBu
eHAuY29tPjsgUmFuZHkgRHVubGFwIDxyZHVubGFwQGluZnJhZGVhZC5vcmc+DQo+IENjOiBsaW51
eC1kb2NAdmdlci5rZXJuZWwub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOw0KPiBk
ZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZzsgaW14QGxpc3RzLmxpbnV4LmRldjsgbGludXgtYXJt
LQ0KPiBrZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZw0KPiBTdWJqZWN0OiBbRVhUXSBSZTogW1BB
VENIIHY1MCAzLzddIGZpcm13YXJlOiBpbXg6IGFkZCBkcml2ZXIgZm9yIE5YUA0KPiBFZGdlTG9j
ayBFbmNsYXZlDQo+DQo+IENhdXRpb246IFRoaXMgaXMgYW4gZXh0ZXJuYWwgZW1haWwuIFBsZWFz
ZSB0YWtlIGNhcmUgd2hlbiBjbGlja2luZyBsaW5rcyBvcg0KPiBvcGVuaW5nIGF0dGFjaG1lbnRz
LiBXaGVuIGluIGRvdWJ0LCByZXBvcnQgdGhlIG1lc3NhZ2UgdXNpbmcgdGhlICdSZXBvcnQNCj4g
dGhpcyBlbWFpbCcgYnV0dG9uDQo+DQo+DQo+IE9uIDEyLjA5LjI2IDE5OjAzLCBwYW5rYWouZ3Vw
dGFAb3NzLm54cC5jb20gd3JvdGU6DQo+ID4gRnJvbTogUGFua2FqIEd1cHRhIDxwYW5rYWouZ3Vw
dGFAbnhwLmNvbT4NCj4gPg0KPiA+IEFkZCBNVS1iYXNlZCBjb21tdW5pY2F0aW9uIGludGVyZmFj
ZSBmb3Igc2VjdXJlIGVuY2xhdmUuDQo+ID4NCj4gPiBOWFAgaGFyZHdhcmUgSVAocykgZm9yIHNl
Y3VyZS1lbmNsYXZlcyBsaWtlIEVkZ2Vsb2NrIEVuY2xhdmUoRUxFKSwgYXJlDQo+ID4gZW1iZWRk
ZWQgaW4gdGhlIFNvQyB0byBzdXBwb3J0IHRoZSBmZWF0dXJlcyBsaWtlIEhTTSwgU0hFICYgVjJY
LCB1c2luZw0KPiA+IG1lc3NhZ2UgYmFzZWQgY29tbXVuaWNhdGlvbiBpbnRlcmZhY2UuDQo+ID4N
Cj4gPiBUaGUgc2VjdXJlIGVuY2xhdmUgRlcgY29tbXVuaWNhdGVzIHdpdGggTGludXggb3ZlciBz
aW5nbGUgb3IgbXVsdGlwbGUNCj4gPiBkZWRpY2F0ZWQgbWVzc2FnaW5nIHVuaXQoTVUpIGJhc2Vk
IGludGVyZmFjZShzKS4NCj4gPiBFeGlzdHMgb24gaS5NWCBTb0MocykgbGlrZSBpLk1YOFVMUCwg
aS5NWDkzLCBpLk1YOTUgZXRjLg0KPiA+DQo+ID4gRm9yIGkuTVg5eCBTb0MocykgdGhlcmUgaXMg
YXQgbGVhc3Qgb25lIGRlZGljYXRlZCBFTEUgTVUocykgZm9yIGVhY2gNCj4gPiB3b3JsZCAtIExp
bnV4KG9uZSBvciBtb3JlKSBhbmQgT1BURUUtT1MgKG9uZSBvciBtb3JlKS4NCj4gPg0KPiA+IE90
aGVyIGRlcGVuZGVudCBrZXJuZWwgZHJpdmVycyB3aWxsIGJlOg0KPiA+IC0gTlZNRU06IHRoYXQg
c3VwcG9ydHMgbm9uLXZvbGF0aWxlIGRldmljZXMgbGlrZSBFRlVTRVMsDQo+ID4gICBtYW5hZ2Vk
IGJ5IE5YUCdzIHNlY3VyZS1lbmNsYXZlLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogUGFua2Fq
IEd1cHRhIDxwYW5rYWouZ3VwdGFAbnhwLmNvbT4NCj4gPiBSZXZpZXdlZC1ieTogRnJhbmsgTGkg
PEZyYW5rLkxpQG54cC5jb20+DQo+ID4gVGVzdGVkLWJ5OiBGcmllZGVyIFNjaHJlbXBmIDxmcmll
ZGVyLnNjaHJlbXBmQGtvbnRyb24uZGU+DQo+DQo+IE15IHJldmlldyB3YXMgZm9yIHYyNSwgbXkg
dGVzdCB3YXMgdmFsaWQgZm9yIHYyOS4gV2UgYXJlIG5vdyBhdCB2NTAsIHNvDQo+IHBsZWFzZSwg
YXMgcmVxdWVzdGVkIGJlZm9yZSwgZHJvcCB0aGUgdGFncyBhcyBJIGRvbid0IHRoaW5rIHRoZXkg
Y2FuIGJlDQo+IGNvbnNpZGVyZWQgdG8gYmUgc3RpbGwgdmFsaWQgd2l0aCBhbGwgdGhlc2UgY2hh
bmdlcy4NCj4NCj4gVGhhbmtzIQ0K
