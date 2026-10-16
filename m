Received: from SY2PR01CU004.outbound.protection.outlook.com (mail-australiaeastazolkn19011061.outbound.protection.outlook.com [52.103.72.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4337525C818;
	Fri, 16 Oct 2026 15:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.72.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792166003; cv=fail; b=kHwY0yKU3yMMKi2onj7GIcTP4QAPPjupMoUgu1vjd/kf1z+3x/08FBihChWk7CI8ynjqEQqyxvNMOtVSX3+BJOWfiFM9z42u0dIPk+gqyY9JR+HVENinGyoWe8GMGwo8X/xWxgLOvyRUDIXr9JXYLqnq1gCFD9OzCor1MjvZxLg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792166003; c=relaxed/simple;
	bh=XcvHCA1j2iu+QDFZrLGtv45OYEpFmwmoXAQ14AwHts0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=gKYLTrhI3hhA17oshTjQW31FN6/16XdLo7hDRIoiwvqf87VzRmc30mtPMSL18I4GvLqsO7oodCAVdMO/4IdhoXdRs2CZ25kAhFhC+wsXkT21bzw//yKxeJmYR81+VoF7jEMppW0KAM0LWehGzwjWLrdqbCz+H8f9WtxqjIud+uQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=tRx3m6jA; arc=fail smtp.client-ip=52.103.72.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="tRx3m6jA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YfXVvQH6LgHoDEEkJwwHMp8QNiES9SNcKmBUDkeVJegxtlvmI3rJ7Jvv22Zc1G96EYibrAE0ATN9IerNj42XoTc2xi0RfwFwJxWXdhkK5Z/2pQnZ257mSg1mmLw1NCdf5xYz9QzeMdgP2XTjTOnaUAYYkNna1MlyN6jLhLpRBfG9FKgL6GdNtRj+bSRmoGgAlrmC7QTF+ViXOkPUia5Y6++kpTxlecHB8WpylMWr04b5Kcf5IEuAk3tXwlNmmSqYbMq8dFhu9nOUIj53y4XCkiX686rNhHruYowCp0HGg1v3M8GOooWMaT7aJrc773n4vy4GgYbXlRLKnZom9aLJLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XcvHCA1j2iu+QDFZrLGtv45OYEpFmwmoXAQ14AwHts0=;
 b=tKLb1n1xq/60XU2uc/q7qHY8myS+kDMpwQo/U0KEaLg/Q1AXBz+abMVKodTSNHj6CcIS8p/RSC6Z1j/Qk4GfU+sEJ1NQXbDu/mHyccDXsFC6Le0CsgKGMmEmAeEZd0pJCjxQaRg5B2CIq1DLKz2lcJ8My2hu+HAcSZ9s0Jy6bUnbpMUs98lIqcv9Ekjb1Cv8zE5KLNE62pKvGjuat/otRohttZifiqITFGBlobmQro1GxJdQ//LEmVjUBeAkNmFAHtl9yDS+OpKw1rq/8Db4p4uZxMcgt7VHh80URKfpDQN+QoPoHo/oTBr9aTjD5ZOjhh+QkETV28m4YRYiXBuJwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XcvHCA1j2iu+QDFZrLGtv45OYEpFmwmoXAQ14AwHts0=;
 b=tRx3m6jAB2E6BwTh0fmA4mJuM04xd6vs4hSxUD+wJ+fU6upUBFbFZN3t7634TIXyYldbKxOVsoteNzBMX/syydDwHG7r0Z5wZtM4OBpdyvP2AD27JtmKyREjavRkwv9ml2fMYTYDKNfZg4houHi8QUJewfC9KBF1nzjnEYRnBUuqQnkjKlelfIdoNxcVYbxeOoSUyGofcVrhl7XTVXSnAtywOWxFpbFwKJUPbS9HbLqBb50F2KYII/+80lYSZNQMqLvMjK5gUpWm5LPDVCN+KiHhDZTdJ3PQRK24Yo5BU9ow3kby0MTdI2b9pYt0J/EpPwkk2Q1b+6KaSqJ+h7lPLQ==
Received: from SY5PR01MB10600.ausprd01.prod.outlook.com (2603:10c6:10:32c::14)
 by ME5PR01MB10862.ausprd01.prod.outlook.com (2603:10c6:220:260::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.12; Fri, 16 Oct
 2026 15:53:15 +0000
Received: from SY5PR01MB10600.ausprd01.prod.outlook.com
 ([fe80::db5f:2818:b791:cc19]) by SY5PR01MB10600.ausprd01.prod.outlook.com
 ([fe80::db5f:2818:b791:cc19%3]) with mapi id 15.21.0546.007; Fri, 16 Oct 2026
 15:53:15 +0000
From: Zhang Jiaxi <Z1529105815@outlook.com>
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
	<konradybcio@kernel.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, "linux-arm-msm@vger.kernel.org"
	<linux-arm-msm@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Zhang Jiaxi <Z1529105815@outlook.com>
Subject: [PATCH RFC v2 1/2] dt-bindings: arm: qcom: Add Xiaomi Warsaw
Thread-Topic: [PATCH RFC v2 1/2] dt-bindings: arm: qcom: Add Xiaomi Warsaw
Thread-Index: AQHdXYZ0aowjpx+fbkGTGXjEGf0lMQ==
Date: Fri, 16 Oct 2026 15:53:15 +0000
Message-ID: <20261016-b4-warsaw-minimal-usb2-v2-1-1b03496396b4@outlook.com>
References: <20261016-b4-warsaw-minimal-usb2-v2-0-1b03496396b4@outlook.com>
In-Reply-To: <20261016-b4-warsaw-minimal-usb2-v2-0-1b03496396b4@outlook.com>
Reply-To: Zhang Jiaxi <Z1529105815@outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SY5PR01MB10600:EE_|ME5PR01MB10862:EE_
x-ms-office365-filtering-correlation-id: a4c9357f-30fe-493e-c0f3-08df2b9d975c
x-microsoft-antispam:
 BCL:0;ARA:14566002|24021099003|25010399006|20031999006|31061999003|19110799012|38102599003|4140399003|8060799015|8062599012|24121999003|15080799012|22091999003|39105399006|25031999004|24071999003|40105399003|25131999003|26121999007|102099032|3412199025|26104999009|440099028|1710799026;
x-microsoft-antispam-message-info:
 =?utf-8?B?ZkxRbUtwVFQycGV0SUxZQkJlWlNRQUZxOUowVDVhNncyNC9paW1idkdLZVV4?=
 =?utf-8?B?eHV6bUNORUMvaFVVU3NpbjJJK0VUZVV1MjdHSGVuMnlneDNjeWJMSE5ZbnlE?=
 =?utf-8?B?a0lRbnc5SFdweEp0K3Q2RkRvSGhlV21peG1DbFpzT3R2am5ZME5FQzhXNE5I?=
 =?utf-8?B?bGlibVlTeE94eEVLREhpY2pTZ25tQmRZVFRTTmxVaHFFV2p0czBpOExqd2E3?=
 =?utf-8?B?YU8vbXZlQWVWdHNJaEhXbWhXcW1iTGtXK21vQnNwS09VSWowOWRXY3B4SGlN?=
 =?utf-8?B?QTVacS9CYVhuWjN0VWgrWHZTQUZYdTBHR0tOZlBuYlJuQTlwSjB0VTA0WTVy?=
 =?utf-8?B?WXJrU09seGhydmJoYU5xMWJSUE11T3Y3RURTNGNLRTNXMzRFVEJUak51Qkpp?=
 =?utf-8?B?QnJCR2RMZndXazBrN1cwSERkVS93ZWFhREZraW04SkdPWENoUzlUTGxlK3BM?=
 =?utf-8?B?cndWaFdOdDhIam9Dck5RUkxtTERINENBSVdUUkNCdThnL3d0YjhmYnNHdllY?=
 =?utf-8?B?UWdEMnFQS0x0empDelZ3b2phTWRiNTBCVUxtUG80MjFlRmo0bEk3c0VQbUYw?=
 =?utf-8?B?ZnZiS25rb0RUdTVwNlRkZVZDNVdsWXVlbDdzZnM2cU8xWmNWU0JqRGJ5UmF5?=
 =?utf-8?B?WVhVV2J1UXZxRmdsa25VaFVteU1FL3JKTE95UEM2aTQ1QjZQdnJLb1JmUk02?=
 =?utf-8?B?a0JaL1RSVFBDanFtK1RteXBybGc3enpONXJHWVFzY01PUGZwV2hzVk1zYkUx?=
 =?utf-8?B?bytRSFk3aUFPT1NDcFdRLzY5MmNHN3NnWDJxb0lIMDQraHhNR1ZMNXYyeENG?=
 =?utf-8?B?RzJaNUlOUHZYTHBPTEJPNWNNcXN0MHFhM3ZnYWVWdXpySHFzNkdyUDFBM3hm?=
 =?utf-8?B?Q2hrOHprdXk5dVRYMEYxU3pyWFVORS90SmJyTE9WanpvT0dibXRUU0xzdEFS?=
 =?utf-8?B?U1ZjVXd3ZEZFOVh1ZVg5WUIycmhUZkoxd2lyeXhJajRnenRWUFFXMEttS1dL?=
 =?utf-8?B?SEUyT3VickR6eG5WdFE4Z1NObCtMZVdxSWtFTDFUTTVHemY2Y0ZyQ0JzK1lS?=
 =?utf-8?B?T1owNktVMkZ4R1g4ODZLWkh4MVVsaDM0K3pXYkcwbDI1TWlJOTFYT3JrNzhQ?=
 =?utf-8?B?SU00eGZaNzdaRG9xZmNqQjl4QUVTbW1FWGJBU2hoYzFQNXp4WjNOR0FUaHlr?=
 =?utf-8?B?UjRQOVNBMmJzWUVDdFI4Sit2V2FpekZIUUxDMnY3a1k0R0p6RDNMVVR4M0Jz?=
 =?utf-8?B?elpJYjJGVnpDcHY2bGlIM1hQYTgzTWFlZHdDVGhxdEVTTzdaOFd4ME55ZzRi?=
 =?utf-8?B?dkhYNTdvVkt4bWtzdmpFZHBBNjNWbnl0MW9lQU94UEJpQkhwaXhOUEZmV2E5?=
 =?utf-8?B?VXVQMTAwam1BVzN1UU9XWURkcEJVaU5ua2Fhbk9OZTFiK1h6WW1yZDlUcGxz?=
 =?utf-8?B?U3NxQ2ErbDY0K2xjOGRkV2dQMWJtVzJiV0tRcjBiVjJWaFRHNmxHTEczbktV?=
 =?utf-8?B?MElXWiswcE9NOWpzYW1tTXRnWVpGMXhTaVRIY2tPUlZzZmhnckRIQm9zT2s1?=
 =?utf-8?B?ZjhsbDlWeTJBM3FMQnBKTHpjWTZUZnIxSjUrMGJTVERMZk9wYzBZMElhd1Jl?=
 =?utf-8?Q?ZGBxYOerT441YGz7A4bOD28cj2JlqVTVKiFVjhkyL1Qw=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YVo2ZHpieTFCejhzN2xRdDNBT3ZNUkhCT1BTanl5Q3BkZmRESUZUdlhzc0dN?=
 =?utf-8?B?ZW9VT0pSb3JkMTV0RVE5a0Yycys5d2IrdzlrcVJFbHhLSGdHZEJqanpvcDNF?=
 =?utf-8?B?akJ2alE0MUxhaytlbDFzMWZOY2FUSXBFTy9vaG9JQmh6aGxnTjhJQ2NxaVBk?=
 =?utf-8?B?L3dzSDdoYUxUQVVWVVNiWEJHdHdVNzlGZGdkdEtkb3FKU1VkTWx4dVV0dWNr?=
 =?utf-8?B?UUxFYnE4NGZuS0FJaUNyTDNsMW9sSG9VQzNLYS9FdFRlK2EwZjkyS1M4Z0tK?=
 =?utf-8?B?MDIyaktNS09WMDdscVFzVGVldHliSEVZeC94T05ldVEzanZ3QTBrTEtmTmNL?=
 =?utf-8?B?d0dlVFpFRU1WWSttelRwdFJNM3o3UjJJTWtiWS95cDV3MHN2OWJDdTIxZDFj?=
 =?utf-8?B?bXVLOHVsTEt3aG41TlgrQzF3Z09iUy90N08zdWhEOG5TckRQQWp0ekdheis4?=
 =?utf-8?B?YkttcnFIRENOTnJJTFJMcXFmSEdvM3AvOExqbGwxYUxoSldlWWVpa3dqL1Np?=
 =?utf-8?B?RnBiTXgrT1dXdHpGN1N5eU9uanRJdVNpWjFwVEJKRVA0bU5aanRaUlBjV3c0?=
 =?utf-8?B?ajNlcDVQbDhuS2hZV29RUTJwM1FTaDlTanhLanBodWVEQmw3MkFVcmpmMVk2?=
 =?utf-8?B?a1Z3TEhuOGo4dEsrMERDbW95WHdaRHprNnAwVkh6UVpNZE80T0lwbFVLd1Vq?=
 =?utf-8?B?OU5jWUNqdnFFL3dwNnN2Q1VBN1N2Z0s2MnZLc0hVOTBjTnFzOGRNU1FKdmM2?=
 =?utf-8?B?c2ZWT1REd3pNbHovTVAxdE15ZGhlN1J6cTZvK1lXRVE1VHZaSHZZOVAzSGNJ?=
 =?utf-8?B?b25QUCtQMTltRlNqMGJ4QTNoOUNiVlUzdUN3MzB5ZkdMelRTRExaYlJ2RHh2?=
 =?utf-8?B?aFMxRFlBTTF4d1dSR1M3VXphaE5jZ040SjFwUUFvZGNHWUJOeVVpc3k4ZDlX?=
 =?utf-8?B?Uko1VEJrL2ZmNUw0T3ZuejE3c2YzSXhNOEJCallkcU84U0FBVjV6bVcvYXZ1?=
 =?utf-8?B?YTF3S1ZNS3I4UjlGOXIxSlFyS0F6MHp0NzRIMjZqb056NmdJRzA2MnRTUmNv?=
 =?utf-8?B?Y2EzZzlUdVBoWENrak1xNHUyRm95Wi9mRm5ZSTZnNFhBMWNCajQ3cHpCWnZj?=
 =?utf-8?B?bWJOTzRoRXZaQ0svY3VCa0t0WVJRS3BIQW01QU5hV0x3RUNkK29iakVZMWhu?=
 =?utf-8?B?TDhxUy9GUTFwdW1LcmJnemowMC9OWEtTUVA3dXZwMTcya3NZMmh2REhiNXh6?=
 =?utf-8?B?WWZ5WXFyYVZUNkUweGxNNTJXeXBYZlU1NXBzcGNkNER3TSs5N3d3WkI2S1cy?=
 =?utf-8?B?MmtET3FDSWtCd29zeDM2bVlWdzczQ2pITHNValhhYW1RTGVtS0xPYXh6NTB4?=
 =?utf-8?B?Nms2Q09rSy8wTWR6dEFWcDhVeVF6SFhCbFE4bGtZWkxQODJwOHRHNVo2cGp0?=
 =?utf-8?B?bGVISkQ4cElrRWgrUWVENmxGMTExMnFBQm00U3ZsSHNZeHBXM2I2YUV5MzlF?=
 =?utf-8?B?bTFTa1BueU9TWHhtK0xuVVM3V0xXd0p2WnhsYmwvQTVFN21XNVNnUmU1MVJC?=
 =?utf-8?B?c2JxMGxnalhsOHJRdnA2dWtSTGJlVktyVXRmMUlJK00zNzRwTEl2am56c0Jn?=
 =?utf-8?B?WHVsdDA0MGNvamg2TC91a0Vmcjk3YkFKb0ZwczBOZEF6ZnJKeVhNbGd2TnVJ?=
 =?utf-8?B?d2FyVGZmM041VDA1VDF3Y2RsVldWVFpNQ2hFT1g5NjF2Q1ZiYTZqUFJTc1I4?=
 =?utf-8?B?UHJOM29EcUtVUGljejlwL0k1Q2VMaC8zRWoreFRzaW1JeDlETkhxQmw3enNu?=
 =?utf-8?B?NXhWRmQzT01oa0ZlN2tsMXUxNk54RW9oWCt0ZzJxaDZlZW1YZTJWZEpNTTJZ?=
 =?utf-8?Q?tZsJkCAMt7Y8Y?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <77BD55B024095D4D83B6AD235525529D@ausprd01.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SY5PR01MB10600.ausprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: a4c9357f-30fe-493e-c0f3-08df2b9d975c
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2026 15:53:15.9074
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ME5PR01MB10862

RnJvbTogSmlheGkgWmhhbmcgPHoxNTI5MTA1ODE1QG91dGxvb2suY29tPgoKRG9jdW1lbnQgdGhl
IFhpYW9taSBXYXJzYXcgU004NzUwIGhhbmRzZXQgY29tcGF0aWJsZS4KCkFzc2lzdGVkLWJ5OiBM
TE0KU2lnbmVkLW9mZi1ieTogSmlheGkgWmhhbmcgPHoxNTI5MTA1ODE1QG91dGxvb2suY29tPgot
LS0KIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vcWNvbS55YW1sIHwgMSAr
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL3Fjb20ueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9hcm0vcWNvbS55YW1sCmluZGV4IGZmOGEzNWRmNy4uODkzMmNjNDdk
IDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL3Fjb20u
eWFtbAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL3Fjb20ueWFt
bApAQCAtMTE3MCw2ICsxMTcwLDcgQEAgcHJvcGVydGllczoKICAgICAgICAgICAtIGVudW06CiAg
ICAgICAgICAgICAgIC0gcWNvbSxzbTg3NTAtbXRwCiAgICAgICAgICAgICAgIC0gcWNvbSxzbTg3
NTAtcXJkCisgICAgICAgICAgICAgIC0geGlhb21pLHdhcnNhdwogICAgICAgICAgIC0gY29uc3Q6
IHFjb20sc204NzUwCiAKICAgICAgIC0gaXRlbXM6CgotLSAKMi41NS4wCgo=
