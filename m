Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.72.25
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792586759;
	b=S2ruuV8hA9StsLg6nPtyMm/F/YINYviFmXTzKq9y77HYjiemyf9MW9ZVgLIrhoZp1QGK
	 2fgzVjqhJQscVzfV3Y42EyIXEx+XiCAD2CrXQ2Q51Diz51+gik14JE4U22Pgc7p/5xn7j
	 scrfnbJnDfMW/iExIAgDZ9ZflYPjzrifhGmDQqZoSv2qcj7jkqulpL733bhNNsET5M1PB
	 0ZYiYI82ff9/DXO+LVqY9nQu+a32CoijrloeLzFlV9FQgiA8VaXsVw5c7/uqSerBzSNeF
	 G+z9Q+XvaoSzD576vnFNrMpb1k66tJ/EhTmeIpG5Ze8jpsa70JlT4uA3LIQLmQTny3Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792586759;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Reply-To:Accept-Language:Content-Language:X-MS-Has-Attach:
	 X-MS-TNEF-Correlator:x-ms-publictraffictype:
	 x-ms-traffictypediagnostic:x-ms-office365-filtering-correlation-id:
	 x-microsoft-antispam:x-microsoft-antispam-message-info:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:Content-ID:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:
	 X-MS-Exchange-CrossTenant-rms-persistedconsumerorg:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=ZQEj6xCL7aUeK7MnAKX3cHdYD066Ost6/g9kxpLIjP8=;
	b=LDvCYPmPjKMQ9Ikb0NHCxiXrIpOv16VN7AcR8JQllxZKDju2rV5DNTMYazJxuUBtP/Mg
	 ytKq/ZBcOnIeYuAoIsfxhqyeHNZhBXQ3s5kRyRf8pt87V4c9NzuB4lr8yp++Rra4LoXzM
	 JE2VBDEf6m+z9v+Si5L3SK8ecKUM2jNkwLeeCFSc14HeEZCcn4sQRo888bszypF2dpPEd
	 E2Gf+/GU+tR9eqYhFwJR4rrCaiWbx83WC3Z9Pbka1dOBSwHkwkEmlf89AnYnX6OlxJcyY
	 OZLQp19bLi5pZAfQqcCRcb/n+c76vzdbXp0Ya0+QEy2SSHq6aXpEsQCmKJuu9JiJU1A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=outlook.com;
	spf=pass smtp.mailfrom=outlook.com;
	dkim=pass header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=XrhhbuKq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.72.25
Received: from SY2PR01CU004.outbound.protection.outlook.com (mail-australiaeastazolkn19011025.outbound.protection.outlook.com [52.103.72.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7741E606A31E;
	Wed, 21 Oct 2026 12:45:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7741E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=XrhhbuKq
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nq1ZHbnwkfBz3t861Dic/wXdjrCxg09wNHLcjo9Ffhl6mJxEKBEIFuF5Z+P5jHQISdY+wPCM1KzGWLV0mrW15anj/JWWDpH6wGyZ76wR7m5sqQmXXItas86qf/Ki7bYmAxdVopKCA51/7pT0tYvca0V/bS15RJ+v+g5YlBdrvHcew3Q70iE4phVsiy3Zuo7Nph7v6ST10VhuRR2npDlDQ/l5ZmwRS/BGsR8d6JCtJOGQUymSVNh5BiBvaISxgkYZyD4ojoYHEFd+hyUjWVkfTHngn7vqaccoaUOSiSITTfP8j9tzTQPYed9wptbtzHP2K78yEh1Fqiw4gs+9ky1QVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZQEj6xCL7aUeK7MnAKX3cHdYD066Ost6/g9kxpLIjP8=;
 b=MBXjWIQtMepIrvEOLBtowXOsixSatHKsdJ5+tKPLEJ7S3Y4uixeB5XZh0whddL/EZOmQ/iqKiexjou98t469U8dvLT6Cgw3qsLMffrk3PpHXm/FYBrN0yC/JoChJjN8fsAAjLrrqZrCmwGzcOrbtbivShXpW3TDjGm31sXo+z0pWl89koB/d7PvBPNw1WSH0XkfSurzgSpjcVhDmeNkpyozIRWtPHMDEAhGolYUTiLZzxPyXMPQExis+taG+WdMr+PnG/+IIQHvUt6yjCY89dVw1eOe35jzwUf6l7ct/H0NY7W0cdRitdKVgAvn91vqL+6xBxaRa9Wm91ICOwteP5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZQEj6xCL7aUeK7MnAKX3cHdYD066Ost6/g9kxpLIjP8=;
 b=XrhhbuKqgj9vXpILd38wAmqAXxI277QO4GZeH7p+lf57f/P6CyraOhl2cb6UXxv2auzeZyRtn/yyaIo7XseJvtuRxV+qtLt8bM5IxN3n1NqI7GOMKL+vwPP2BUX6lINyPDaDYOuN2YC2US5L9Qmk/2gkRgf/PcdIuGyFmeDiFqEmvriBF9uZGoY2t4/O4VpLDlLg0LXkuWa2OoXQmVjL27Wv0DglS40LfzK3lxURG64ACvaA04J/NyxTqq6uEyrYuuhqXaMvwhSLkEKdq8MKeE2AV8DtHfVTrE3oJxcm90Ba9Pt1Yh4Lc3LcO7+xYI0pFKsFYE27WsldCSw5TLjZuA==
Received: from SY5PR01MB10600.ausprd01.prod.outlook.com (2603:10c6:10:32c::14)
 by SY7PR01MB257422.ausprd01.prod.outlook.com (2603:10c6:10:378::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Wed, 21 Oct
 2026 12:45:52 +0000
Received: from SY5PR01MB10600.ausprd01.prod.outlook.com
 ([fe80::db5f:2818:b791:cc19]) by SY5PR01MB10600.ausprd01.prod.outlook.com
 ([fe80::db5f:2818:b791:cc19%3]) with mapi id 15.21.0546.012; Wed, 21 Oct 2026
 12:45:52 +0000
From: Zhang Jiaxi <Z1529105815@outlook.com>
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
	<konrad.dybcio@oss.qualcomm.com>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, "linux-arm-msm@vger.kernel.org"
	<linux-arm-msm@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: [PATCH RFC v3 1/2] dt-bindings: arm: qcom: Add Xiaomi Warsaw
Thread-Topic: [PATCH RFC v3 1/2] dt-bindings: arm: qcom: Add Xiaomi Warsaw
Thread-Index: AQHdYVobDyREX6xzn0yVeWJYq/yGDA==
Date: Wed, 21 Oct 2026 12:45:52 +0000
Message-ID: <20261021-b4-warsaw-minimal-usb2-v3-1-9f4213ab83ef@outlook.com>
References: <20261021-b4-warsaw-minimal-usb2-v3-0-9f4213ab83ef@outlook.com>
In-Reply-To: <20261021-b4-warsaw-minimal-usb2-v3-0-9f4213ab83ef@outlook.com>
Reply-To: Zhang Jiaxi <Z1529105815@outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SY5PR01MB10600:EE_|SY7PR01MB257422:EE_
x-ms-office365-filtering-correlation-id: 7e424acf-2148-4007-9a0e-08df2f713deb
x-microsoft-antispam:
 BCL:0;ARA:14566002|38102599003|39105399006|4140399003|25010399006|22141099003|19110799012|8060799015|8062599012|15080799012|31061999003|22091999003|24121999003|24021099003|25031999004|40105399003|26121999007|102099032|440099028|3412199025|26104999009;
x-microsoft-antispam-message-info:
 =?utf-8?B?alkwOElNWDhSRjdLZHl0aWpPb0pNLzNyQ0xZV25iOGpVWHQyTjZrRDE1S1hu?=
 =?utf-8?B?M3BBcmJVdTZ3WXBTbVFjcGUvamMvNys3RVRpUGVoelhXL1VCQW04NzZkNlFK?=
 =?utf-8?B?bDMrMEhvcTRJdGhHWHcweGZnNDVnZU1RMGJZZmlsTGJRVGJaMXZtNFdscEl3?=
 =?utf-8?B?T3lQTVNWNTdEWDFUQmZVbWNkb2FCeXQ5SmZsQjFVRGF2NEJGOUdDbXhjTGll?=
 =?utf-8?B?aVZ2RTJvbTg2a25MTThOS2ZZdDFYdVJXOGZnVkR5SWFNZkRIMnQyUlNMaGs2?=
 =?utf-8?B?Y1k4M2gvU2FEdEdKYThlVWhmMzBaVVZHaXIwMTlkSFZ3U1Zod1BpZUpvL1B1?=
 =?utf-8?B?MnBKR09qWGpKbFlSMGhtaTEwc2xzak43K0pBY25aOUJPbWl2SkVSOVFGSzR4?=
 =?utf-8?B?VXJ6Z1kwWnI0RXhGbFcrbUM0bk5lME5Jc0toeGthMVJ1ZFZndnBremZYMjIz?=
 =?utf-8?B?UWNhWHc3dTUwNG9EcVhOUWVUV2VJSTY2UEZyVnlsRW5hVFB4cFJPSDlrN1pj?=
 =?utf-8?B?OXVHMWFnZDh0TldOZEtJTjVURXNEU0FmaDBGS3VrenlVa2VyMU15UzhrUkxB?=
 =?utf-8?B?UkN5RWJScVlBdEdXUUJZUnk5U3lKM2R5ZUYyWDJlRDExWHJ3RCt5R2pNNERj?=
 =?utf-8?B?bFlXdnpuVXJ2VmdxV3lva3JBQStUZlcvcWhPc1ltTzZwenpDd2o0UGxZTFBm?=
 =?utf-8?B?eHJHY1BoT3pNdFMyR3VjYmpYVGEyd1FoaWhYV3NxMjFzTEhFN1puUGJHQmpu?=
 =?utf-8?B?NDNpNytFaGwxNG56KzlPWXkvYVBWZ2JubEtvR0tLUm5hMExGRERDa0p6a3N1?=
 =?utf-8?B?aHZwNS85eEZXcXJLLzlKQjZuS1hTVjdaY29xY3J3TVl0bDYzZ29sS3NMQkdN?=
 =?utf-8?B?NnZXSG1uNGdTMEw1S3phak50d2F1UTdZaWkxU280UWJVWFJSWEVNcy9HVzJv?=
 =?utf-8?B?MHRBdytIandkWHFtZGVDdEdDVGxsVGV6eGhBN1BOM1Nqc1NDS084U2tOUmZW?=
 =?utf-8?B?NW1tS2cxaFJSL040WjBVenM4U1FXRWpPd1R5MzN0OXFCR2ozVkJPcGU3ZEZM?=
 =?utf-8?B?YmF1d2xCZVFWcTJYLzc1Tk44MFAvcGRDQWJQNGpLTlJMem9ld1h2N2wrY1h4?=
 =?utf-8?B?V1NlQzRKSExmSEtpZ2NkTTJjNHUyZTFZQUNRdG1MWUp1RTNGUnpKLzdkZFZH?=
 =?utf-8?B?bTRENldkYWZtUmlwbHlPUmExVm1pSFdDMklvSDc0YmdydHpQYlFYNFhRbkRl?=
 =?utf-8?B?WitHRjBnSHliU0JRbElCajlYL2V6VDB4V0cxSlk2dGJkLzhMREpZSTZ5R1dm?=
 =?utf-8?B?cUxyTGRscFhTL0xOY3VuUHoyWEJJUWM2N3FrY3dGdWw4RFp5ZXBEaGQxUUNP?=
 =?utf-8?B?K2gxR1lBM3BoSUJjdlF3Y2pHMS9WMDhVK2tiRlZhaXg5bU9YUHZrYURpWkNu?=
 =?utf-8?B?TjNTTEk0eTJqamMwRGFZa2JBNXRTaVk2KzNMZzI5Yk4zclRZMWtRMndqR2Nl?=
 =?utf-8?Q?gSl36tQRleAKIBpVsXoDfUjfdIw?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?d0VKRFhnN2RBME9jYldhVDFiUXQxOU1MVmZYZ0lPOG9NOFZZbUthZ1IvOHVl?=
 =?utf-8?B?ZktFbXFmbG9xWmxGWHdxY3JQSmVrM0VmaExEVE54bXRiU21TMEVzeFkzODcw?=
 =?utf-8?B?S0VaUWVmSGZhQWdDbWwvV0ZrOVR1QU1uVXpLeVdiYUZJZTJyM3hjMjcxMlJ6?=
 =?utf-8?B?QmRQL0dYeFVXaWhXMldGVm5mUWdhdU5mMlZIM0tLYy9LalFkb2p6bVk3V0tO?=
 =?utf-8?B?V1RjMHBJOGkwQytsc2lwMm0wMkpxcjdnbFNDOXM4QkUzL09pUDFlcWhvcmVy?=
 =?utf-8?B?dFJkVklMZG0wQ3ViakRNS2N2cUFGOU83dzNoN0NFN1RxVzdaeUozakp3Z1Z5?=
 =?utf-8?B?ZFNjbVFRd0Z6YUxBdGpGSzlBamtNUG9lbUpIMkVGOWYwUStRWnpmT3NPYWh5?=
 =?utf-8?B?dm9BUm51eHllSXdscmV0TTltY3JQV2habWE0ZHliQTg4Y0RWalBqTTdFYUQv?=
 =?utf-8?B?cDhPUno4djl1eVlZN0ZVYlBmZVlTU0pyWXdweUFVTjVoLzlMK2haY3hqTEdD?=
 =?utf-8?B?aEdQN0ZlMHRSSWg5M1kvUG1zaExWMWNzaUNvMThGQWtqNUVIYVA4bW9lZ0VR?=
 =?utf-8?B?YlFUdjEwc3hDd1kvKzFrODlmL2FwQUZZeHUybWVGV3YyWFBGWDNqSXJ0Zkpz?=
 =?utf-8?B?d3BXMjVDREcyY0hzTWxJL0hoY3M3YmE1WXpOZkJhUjExNFNaWEJ6QXFDTmNN?=
 =?utf-8?B?Z1pBRmJoK0c3OWlrNkhyK2RqcE9JbEJBdVNJbldPblIyOHRYSHJjWE1oVlE2?=
 =?utf-8?B?V1JKenQ0Z0JJbWJQNWRGTjdDVXJ5T04xRzVNdGRidzIyeVArSXg5MW5IOWJ2?=
 =?utf-8?B?NG54eG9RUDZYOHUyMHF6eVFLV2ppU2xFV2lYTXE5dkZUdDdzejlnT28rSFFE?=
 =?utf-8?B?RC93SHJhRW9Tdk1ib1F0WVFVc2N6bkJqTzBJV3h1bUxERGFabzA1V2lMSC9Z?=
 =?utf-8?B?ekRZbmxnbHcwZFlwUW5FNmFzVENKYzluODV3UDhqdzNCY2tLRUI0anN6WXBP?=
 =?utf-8?B?cGoxeG5FdDBkNzE5NTF1Smo5b0x0ZFFQVDdJandKTGVzWTVMUFpSb3NUZFN3?=
 =?utf-8?B?NG9NSVkxMWVwR0s0V3AwREFqelJheWxNZ3dpaUtXUGFkNHBPYUpJRC9xNC9H?=
 =?utf-8?B?emNidTVKdytqQ3JEMVJNaDBCcE0rdTFrVmlQWEZWeXp1NE93Q09IeHdFTllH?=
 =?utf-8?B?VmFiZFlnQ1RHVWUvZzhyWC90ZmhWeU1qVmlKM2tKbXpRZndod0p0UGNFb2w4?=
 =?utf-8?B?RlRQekNFaWhBZmVYVHJXTzhzNzMzUC9yZGFDN0ZWV2VWbzNyaUtsWExpZkFM?=
 =?utf-8?B?YjJKeFRiMHBQL2RlNENZdTIxSXJhRjF5dEJTSnB5M3R0UXg1UStKUlpteUp0?=
 =?utf-8?B?QWtSelF5ZWMwTllqREtZS0xrVkdHQmJ0N2VTVHJpUDQ5ekhjNjZ2YlgvWDFx?=
 =?utf-8?B?c2todkEyNjNBY2U0NitMdzNCUjVZRi9vR1JQbEY1WUg2YUVJVmRRT3RiOFdC?=
 =?utf-8?B?WmJjU2lqRlJzZlRuY3lzazRPSnVLTTJKTWxPOEt2SlExcUpwMk9ia1VwVDVO?=
 =?utf-8?B?ODE0RU00MklLUm9lSHNyRFpCRCszanZHSCtOSlVOdWE3MmY3YUdSNmhFdUkw?=
 =?utf-8?B?Q2ZjaDUyaG5CRWl0STc4b3FxZG1VYTRjcGJVUWFaL0lDZlF4ZWVUTmx1bW1Z?=
 =?utf-8?B?Qm5HY0tJZlJiVVVueVhSMXErdTMxN1pkTlNleUJnTzhwNHMvUEhadHhveVJs?=
 =?utf-8?B?MnFOZnlZRUFEcTZmWVQyQ3hMakNnaEgrV1grK1RvQmZLU2hSZVBBZGVlSWZS?=
 =?utf-8?Q?BiLmj3typfX4YA/YGO53/xkZp8e7hCo6b8r48=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1D8DE6D8FCB0EB4AB9DBE78F92F3CD75@ausprd01.prod.outlook.com>
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
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SY5PR01MB10600.ausprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e424acf-2148-4007-9a0e-08df2f713deb
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2026 12:45:52.6286
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY7PR01MB257422

RnJvbTogSmlheGkgWmhhbmcgPHoxNTI5MTA1ODE1QG91dGxvb2suY29tPg0KDQpEb2N1bWVudCB0
aGUgWGlhb21pIFdhcnNhdyBTTTg3NTAgaGFuZHNldCBjb21wYXRpYmxlLg0KDQpTaWduZWQtb2Zm
LWJ5OiBKaWF4aSBaaGFuZyA8ejE1MjkxMDU4MTVAb3V0bG9vay5jb20+DQotLS0NCiBEb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL3Fjb20ueWFtbCB8IDEgKw0KIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKQ0KDQpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL2FybS9xY29tLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvYXJtL3Fjb20ueWFtbA0KaW5kZXggZmY4YTM1ZGY3Li44OTMyY2M0N2QgMTAwNjQ0
DQotLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL3Fjb20ueWFtbA0K
KysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9xY29tLnlhbWwNCkBA
IC0xMTcwLDYgKzExNzAsNyBAQCBwcm9wZXJ0aWVzOg0KICAgICAgICAgICAtIGVudW06DQogICAg
ICAgICAgICAgICAtIHFjb20sc204NzUwLW10cA0KICAgICAgICAgICAgICAgLSBxY29tLHNtODc1
MC1xcmQNCisgICAgICAgICAgICAgIC0geGlhb21pLHdhcnNhdw0KICAgICAgICAgICAtIGNvbnN0
OiBxY29tLHNtODc1MA0KIA0KICAgICAgIC0gaXRlbXM6DQoNCi0tIA0KMi41NS4wDQoNCg==
