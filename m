Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022126.outbound.protection.outlook.com [52.101.126.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D049364059;
	Wed,  9 Sep 2026 05:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.126
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788932276; cv=fail; b=s6FcjC2/9XPwvgDNp0x6/LZmhwvqqIAKsC9Smf1X3Xq6CKnAxwb110Q1iqaqlxKaYuJDQaBC9VNAbo6w/XKyKImXD9eP5gvIi3kBFsoTHcwSYZnyNR7CtHMR5BWOnnGChYO6O7DspTyvSrOe6C6Pyi4n5byCUh/bcNtVxBEddds=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788932276; c=relaxed/simple;
	bh=W8rRTyZLPCFKS1rg0bxBKpOZ+GDK/gdtGwsDwqIVAOY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=PHBtdGzLFFB0SR48dQNhdfz/FJSSdgxFOw9gxnb9atjYaDQg33XhfzH2uRsKQ+uu189iKa1/yZbG+zjxWL94OysPrUEup1kKnF23WIKGxvWsiVFp3wDhjwHKjN1KSJYTwJg+aLlK+tTMb3a6EO+QamCOC1AZlWebxG4cfME+9Mc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b=YsrPYClq; arc=fail smtp.client-ip=52.101.126.126
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b="YsrPYClq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yju6VO+fjFfi8JtEofJsKZnlpdADWBT2KOaqiD7e/Fg3QLwF1q+zkhuPtfUG459Mt+R32P2c5IJvEmfM7wRi738eMtSgsW/oEszZIibXF8qSslN4l1/wMqDxd0H5DP8T7/JRygJqGmGTm1pnkfgC/r/HBojBZWo0dCnbhp7GbFmPj5+eIDEwoOlQAt0yxy0nilj40GGrZllkX8adDsmoEhHqdaVASJyGxodXekGc7nnAF5gNVjp9okiY5rKmlcSRhEIyc5CSA1IECiRj1I/qnyDCjP2xSDVWE7MPpAf77nKyGngOvFPWXfV+NkRQBMYj3YUWpE2vdv7SJKUpiYZoYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W8rRTyZLPCFKS1rg0bxBKpOZ+GDK/gdtGwsDwqIVAOY=;
 b=Bja4+2tKy4nTaSLkCgWun5hTNBtn7D5HncgaGOk23XJg4ovqhbiFWsxyg95KQvE5a89zpr1M+P4Lxv6O4MwFg3EPhr1toRGuYGy2erT74hcLuf+ZnfDo7JT0BNKhq+vPUu3KwPAFkDCpN1X/t9SzCwsA5yANeRjCSdxX5QnugKgBhtMWjb5P5GQk6bjRl83+ry/jpz5xj8fOdcDF5A2VJiThmuHauBR/oY1TLDs1hobIEo34TzaoJi7WbNrGex9SD+wVX2ctG7Ftv0rDJpw2MJb/sCtea41fcWVx6gGC34uq9m4eu1AZyn7JQT3ddEqWq28u04DJ2STdDCsJWCmyGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W8rRTyZLPCFKS1rg0bxBKpOZ+GDK/gdtGwsDwqIVAOY=;
 b=YsrPYClqNuC+1xDyeDYTvdSDY3ELm++TaYJhpcluDfla1zFu8/cXDEW3uuRDll5BhDNPyYsgMJoQwaQk7P2YaOogpZE3fi8fklrZRYX9fEAmceLKn0SHcSJYuo02taIOphKALKiqGZhJhjppTmaD0ksO9bKI4+c8D7cT8QqH0boVnOSYOe1uXOg8hj8fTN3edT7UtVqZ/SqJO8ZM+tDK5jrKxkTa1pm+upSa8jUK+B0Nhn99eHmsAs2rQoABylCtU2AGU8XmstzUE9VVHufjS9VYqljKFZAcasq9wIWaQkkDcEtUCA5tvM1YvjUxxYVrTbPNEEVewFR+HNAytPcDwg==
Received: from OSQPR06MB7252.apcprd06.prod.outlook.com (2603:1096:604:29c::6)
 by TYZPR06MB6114.apcprd06.prod.outlook.com (2603:1096:400:33f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Wed, 9 Sep 2026
 05:37:51 +0000
Received: from OSQPR06MB7252.apcprd06.prod.outlook.com
 ([fe80::92af:c9d9:8779:d19]) by OSQPR06MB7252.apcprd06.prod.outlook.com
 ([fe80::92af:c9d9:8779:d19%3]) with mapi id 15.21.0406.005; Wed, 9 Sep 2026
 05:37:51 +0000
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: Frank Li <Frank.li@oss.nxp.com>
CC: Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li
	<Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
	<joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, Philipp Zabel
	<p.zabel@pengutronix.de>, "linux-i3c@lists.infradead.org"
	<linux-i3c@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject:
 =?big5?B?pl7C0DogW1BBVENIIDQvOF0gaTNjOiBtaXBpLWkzYy1oY2k6IEFkZCBhIHF1aXJr?=
 =?big5?Q?_to_clear_the_TX_start_threshold?=
Thread-Topic: [PATCH 4/8] i3c: mipi-i3c-hci: Add a quirk to clear the TX start
 threshold
Thread-Index: AQHdOgYGVnmzL1ICBk2lJkF62WpP7ra6NSQAgAuRcro=
Date: Wed, 9 Sep 2026 05:37:51 +0000
Message-ID:
 <OSQPR06MB72520B5A5ADC4F06F2CC6D2D8BB02@OSQPR06MB7252.apcprd06.prod.outlook.com>
References: <20260901-b4-i3c-hci-ast2700-v1-0-19909e7cbd7e@aspeedtech.com>
 <20260901-b4-i3c-hci-ast2700-v1-4-19909e7cbd7e@aspeedtech.com>
 <apc8YiMT_8aBukeE@lizhi-Precision-Tower-5810>
In-Reply-To: <apc8YiMT_8aBukeE@lizhi-Precision-Tower-5810>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSQPR06MB7252:EE_|TYZPR06MB6114:EE_
x-ms-office365-filtering-correlation-id: a53d407b-275c-44df-f847-08df0e347d1e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|23010399003|366016|10067099003|4143699003|56012099006|6133799003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 T4LrKBHj2mywnl8wz8qoBqMUpPHKQAc8ZPB/okKE5seXx96xz8PWkfpj3K1EVuGvwCoT2e7ebW1qALx5yNo/ecQbSiLcyz6EJqBWUuXGEJDlOvdbkkCPfU2jNKP9vZuC44DL2mRoTEZluV8vNrlJdvaQOxLaVu78skNlYESRwG2bd/k6rX4ztciSc3I8Q0DD0JGbyizexxsOOS48SkkIUWMDU6T56KXM5r15unxR75B1R/wvEfKCEuyDBOqbZ6dan8KobIDuwbf/1ZylVgotdmwmOZ1sY42OqWs8Y+q2RU841aqhEWk60bW1/m5HNeTZNuOaMsINtOtMKN5Y+XaY3xx/mRt3k2pZ4dKakbDL1nZGG+PqefxcmFi/4kMIomegqhrqROkngHObp7oF1us60J93LFKePXlvsMuCC0PKZaAsKVkGRpDA1IPrbA875vxR0R1CIEJ2XDQ0m/cUB44+WiDlGvNS0nZaEih8joHQVbdkjotsrC7zZehCa+GyJpV0lJF7Occ70OeXNvu438tYvtTdUJY12QsCheYIp5HYODao4JIRM7UqNc0TRMTScVRlyq1lA368lzKitNVgbWjgjrojSrytNCo2kGbrcTKGizrbXVn23q4pApAJBPd9lNlWG08BjUi1q1p85GqLAt3TZ7pKqkhcIQX9CTkpT92FE73AIBWjzY+Pja0ruw15QrQdFq9G1/3vmIAzPhc7I24It5H87B/6m9mkpYE20U/pfd4=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSQPR06MB7252.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(23010399003)(366016)(10067099003)(4143699003)(56012099006)(6133799003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?big5?B?VWl5UWZXWkFWN29zaGpVdlhsa3k4ZUxFSGJLRlNCQ2IvUGVSQU1QNTcwVzBYYjVs?=
 =?big5?B?TEdJakxxZkZvQ1plTnhMWkhmTDZwdFVWUzFXWG1sRFFkS1FqL2g3Vjd3K3pxaW1K?=
 =?big5?B?SU5BdkFwRHFxbUNXeWo2SkIrL0x6WWROODBha1hKaEJScVdOelk3VFNPZ3ZraUY3?=
 =?big5?B?QWRuTG5kMndtRko5ZHRvRjZsN1pjSmFLajMwdWJjSi9adk13OWs3d2wrT1pVMGNZ?=
 =?big5?B?R041VkNINWJwL1oyelUyQlRyT05qMUQ3d2RGeVNXNWgza21VUm5uQzlBQlNUTVFQ?=
 =?big5?B?T2t1M2hZUURIcit0ZCsyaHcwUDlqRGltVUVmVGpwTWZBWVVvVzczZTJ6Nm9ZMStY?=
 =?big5?B?Nkp2V1U5VlZVRlhiSS9ZdWd3OGs2RFhzNEtwb1kxN0xNYi91VmFDTnJQSEJtOUxU?=
 =?big5?B?ak1sUFZYSHNLYWxvaGZOUGZMbmZrcGhTVUlHR1ZpQXlNWHBNc1hRR2dVQkVZNDBi?=
 =?big5?B?TUNCbkZ1c2c4TXRDTm9EcHZ5NVRNWUc3bUFFdk40aVZNOUtoajFoMUgySFhMOTBa?=
 =?big5?B?ZzEwT25JQzhIRTJRNEZuS1NHMGJ6cWVVNmEwYWcwZG9CNlV1bzZrejBOZ01ZL0Fy?=
 =?big5?B?b2N3ZWRiTUNRRVBzcVkrc29DYU4rMFZ3L1o0NkJ1L1M4eXBDK1dJaTBMUms2YTRP?=
 =?big5?B?R2J2ZFE5RFBDdDkwWW1GZHZHWnhkTEFpVDB5N3dlSzE0U015dEJtK0VjN2pxN05C?=
 =?big5?B?Z05vWVZkUmo5Wk9pVStESjlQdDFVOTJiUklXZjNWYWJYdUJUL21SUnIySGQxWGdB?=
 =?big5?B?bmlKWWNaN3J0QUl4ZDViYVY0Q0Q3cW5aQmJ1N3lYeVlGRDhxaWVjVVBReTQ4OFNn?=
 =?big5?B?OXNXN2l5eFgvb01OQVdZYkhxT2haWGNRc1JGZE1vdnNlSEwvajdGU0kza2RjaFNj?=
 =?big5?B?blZYMFdsbmV3Zm5zbk9yekN3MFU3MjJoQWVtTkNvb3ZaZWJtUkdkTXhjWTAwTWZw?=
 =?big5?B?Z3BaMlR6NHlPRzYrMHN4ZlF5eUc0QlFxVEJJY0NJbkdtaXdMZWp0bDFpLzgrcTBP?=
 =?big5?B?WlNDU3YvMm5zOGlnbUg3NGFQNW5xTWcrSjRjSXV1UlZQRHN2clo0WTIyMzlwQUE0?=
 =?big5?B?aVBQc3VOL2pDdDB3UFptaWtNdzJiWDZnS1VoVUE2VW1TbFdoRTlsbTBBajN4ZERZ?=
 =?big5?B?RmdzMzlDd0tFVktHWncxbUZxQmxsbkhFQldjNXppak4vV2h4eUhTQkNVSi9ES0h2?=
 =?big5?B?THNwZGgwamFaYWZmd0NKV0loZzhLMlFSUFhQYjJsaDBtMUJXcDYzRU9yR1BxZmFZ?=
 =?big5?B?UkFxT0JHN3Zzelg4VS8zSDIycklxaGl2Z1BoYjExbGpWQlp3MnU2cHk5QWg1akhU?=
 =?big5?B?YXl0eFFEZmJxVHdSMEQxNzdCT21VUmQ2RVBNTFB3SXZVWXBzVXI0VnJ3ckJYVExG?=
 =?big5?B?d1RHWXkvNUJDYlMyT1FjM2FZYzBWMWtqY3NwU3NiNFBzM2VDc2lwL2x2aCtaVzdD?=
 =?big5?B?OGNLY3JGNENUcEtjcmpsWWtWR21tL0pqd2RLTGZoWDV2MVVPYWZSUGFlMnFaUWE3?=
 =?big5?B?aHZXWDVDOWFjOWliTlNnMEtObTFBdXdYTm5CT3FmZEE4THlNbGIrbTRkT3pGVE12?=
 =?big5?B?MFBJdmdZb2dYRTM0QWRNMUd2R3RPcTdCdUczak9PUnRYWnR5TVRMdjFLeGhYWHVR?=
 =?big5?B?MFVZRzIrSE1EcFIxK0JSTVAvV3lnSDZJNUJXWm9TOW5aUXJVdmxyTDJYNFRSNnp6?=
 =?big5?B?WWFPM3BFeXVLcmhuMXBqeE9EZVA4VGh3d3FOWld0TDBlVEV1TXYrTjZReklpVE5O?=
 =?big5?B?U1FkUFU3dWVJMDdxRktaMkk5Ky9QOERIcTY2UjNPRHNmUmVQcXNOZ0FPV0l6NEhm?=
 =?big5?B?aXBqaGZUa2tRdFh6SmV0MjE2S2pHRVZKcFF0eUZUdFlaQmkzVFh6UGxTSVlwMVd5?=
 =?big5?B?TDg2dHRMU2VueFhybkxGTVhkbExNN0x0NnkxQnpTckNXK2Z6T0M1bURwSVNVeWJv?=
 =?big5?B?bHByODY1eHU0S1NENVVpZjFwVkt6M0Y3d05DeS9rL3R2a2VQVnEzeFJRanUzL1VN?=
 =?big5?B?RnBoMGJRSWxIS3NwaU1lR3RWSU9EM0xuOHJkQ3J3a3BLcXVJRFlXa0l5bFlyYUpQ?=
 =?big5?B?czRQRlMzMEpTUHRCRmNoZHlkeVI0SGFlRjdWU3JaeHB0dThQUnVrcEd1UUI1Y1pK?=
 =?big5?B?bE5NMDA1WG9wOUZxVk9rOUs5WTVoWnB3TWdpbmdpK2pibjdVUXNJZnIzS09ta3J1?=
 =?big5?B?NDRVZ0IyQUtDZjlidTV2dmFvcklPdz09?=
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSQPR06MB7252.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a53d407b-275c-44df-f847-08df0e347d1e
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2026 05:37:51.0144
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cG5kB8eGieclwYhExUmZad3F8oG7Cl5F+R4UWhAjPAmdi9V16DSTPisjUDoSVn41t/+tqQmnGm9QqoCbzMIC5QbKlWhl8Lbn/lZ+4ufzY2Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6114

PiA+ICsgICAgIGlmIChkbWEgJiYgKGhjaS0+cXVpcmtzICYgSENJX1FVSVJLX1RYX1NUQVJUX1RI
TEQpICYmIGhjaS0+UElPX3JlZ3MpIHsKPiA+ICsgICAgICAgICAgICAgdm9pZCBfX2lvbWVtICp0
aGxkX3JlZyA9IGhjaS0+UElPX3JlZ3MgKyBQSU9fREFUQV9CVUZGRVJfVEhMRF9DVFJMOwo+ID4g
KyAgICAgICAgICAgICB1MzIgdGhsZF92YWwgPSByZWFkbCh0aGxkX3JlZyk7Cj4gPiArCj4gPiAr
ICAgICAgICAgICAgIHRobGRfdmFsICY9IH5EQVRBX1RYX1NUQVJUX1RITEQ7Cj4gPiArICAgICAg
ICAgICAgIHdyaXRlbCh0aGxkX3ZhbCwgdGhsZF9yZWcpOwoKPiBkb24ndCBtb3ZlIHRoZXNlIGRl
ZmluYXRpb24sIG9yaWdpbmFsIGlzb2xhdGUgaXMgcXVpdGUgZ29vZC4gQWRkIEFQSSBvcgo+IGNh
bGxiYWNrIHRvIGltcGxlbWVudCBjbGVhbiBEQVRBX1RYX1NUQVJUX1RITEQuCgpPa2F5LgoKV2ls
bCByZXZlcnQgdGhlIHBpby5oIHNwbGl0IGFuZCBrZWVwIHRoZSBQSU8gQWNjZXNzIEFyZWEKcmVn
aXN0ZXIvYml0ZmllbGQgZGVmaW5pdGlvbnMgcHJpdmF0ZSB0byBwaW8uYyBhcyBiZWZvcmUuIElu
c3RlYWQsCmFkZCBhIHNtYWxsIGFjY2Vzc29yIHRoZXJlOgoKICAgIHZvaWQgbWlwaV9pM2NfaGNp
X3Bpb19jbHJfdHhfc3RhcnRfdGhsZChzdHJ1Y3QgaTNjX2hjaSAqaGNpKQogICAgewogICAgICAg
ICAgICB1MzIgdmFsID0gcGlvX3JlZ19yZWFkKERBVEFfQlVGRkVSX1RITERfQ1RSTCk7CgogICAg
ICAgICAgICBwaW9fcmVnX3dyaXRlKERBVEFfQlVGRkVSX1RITERfQ1RSTCwgdmFsICYgfkRBVEFf
VFhfU1RBUlRfVEhMRCk7CiAgICB9CgpkZWNsYXJlZCBpbiBoY2kuaCBuZXh0IHRvIHRoZSBvdGhl
ciBwaW8uYy1pbXBsZW1lbnRlZCBjcm9zcy1maWxlCmZ1bmN0aW9ucyAobWlwaV9pM2NfaGNpX3Bp
b19yZXNldCgpLCBtaXBpX2kzY19oY2lfcGlvX3Jlc2V0X2FsbF9xdWV1ZXMoKSkuCmkzY19oY2lf
c2V0X2lvX21vZGUoKSB0aGVuIGp1c3QgY2FsbHMgaXQ6CgogICAgaWYgKGRtYSAmJiAoaGNpLT5x
dWlya3MgJiBIQ0lfUVVJUktfVFhfU1RBUlRfVEhMRCkgJiYgaGNpLT5QSU9fcmVncykKICAgICAg
ICAgICAgbWlwaV9pM2NfaGNpX3Bpb19jbHJfdHhfc3RhcnRfdGhsZChoY2kpOwoKY29yZS5jIG5v
IGxvbmdlciBuZWVkcyB0byBrbm93IHRoZSBQSU8gcmVnaXN0ZXIgbGF5b3V0IGF0IGFsbC4KCkJp
bGx5
