Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022110.outbound.protection.outlook.com [52.101.126.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CADF286425;
	Fri, 11 Sep 2026 03:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.110
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789095947; cv=fail; b=UlgmUbeR/VzY9guHqsdnMT5zbqo8fOCTmN2ncpgahKXVqxyDPlMBBzjvy9yqQZT0msVQhO6jK1dM8Cu/ufFaMQO+QAqMw6nAGWGJJKtATlNLX53YCTfQDfO81m3hIEanUxo8hKbkQgsBYrtpoP2HIDJZjSr6djEWm9D7jCUExgg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789095947; c=relaxed/simple;
	bh=38IgE8a/2fBB5Gnom0gnVA9ZvlrI4ztWELpQ1cSPuV4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=dcAry5VKiph1Dz8kuj0X++uLIFvCPRYQUTR8wpX2Il9dtCjZouJ72kLUnaeqDz9Y/yVvey5AsN+/qQI81TGfkD7l3r8Oup1qbYK78G5YyricJaNW91wtrFFKDKcGXUzrlD4PuBIo8URalGzvPdRj7J49Z0zRgqqwsgDLHiKD6Qk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b=RX/gAQ1J; arc=fail smtp.client-ip=52.101.126.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b="RX/gAQ1J"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nFthldeNHzsCYeDcvYF6EgWEux/zJyRXc1jszapghSMiEpMXXb8BDN8//y99ZCINPfBP94wKDaA391aTQgQN1HjexyCX6QRzgQ3PVNdYjlf8K/v0hYJ4UsokG4WitfDxH2YZStkHRbs5MdIqEycsVnjZy4Wsp6MElSOY6o0Al9xNwuZ9OyYFneq30LVcZP4rzOmH+w2GDyMsWm691v6Wk4CJ34JmtHBtz/98qwtB5sRAGIFviiHqRGFzP4hGk0xGqPn63aLwFp3K5enK3xdh8Ba22bENKkRPl+DMMZMR31Xp2Ma7fWY0V76iFfu33CBkYRWew1Wfl960p5JC7hm4rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=38IgE8a/2fBB5Gnom0gnVA9ZvlrI4ztWELpQ1cSPuV4=;
 b=IwCSZgW7WiRiisat3VN1x/lRawXt6+BqYE4rne/loCFKviVDSk3IVc0aCF3ru6g81RE1WZXzHLFGfu2sIxRKhRMH2RW5oRhjm72oyfZSatd+52FosZCuZfzKiZ4RK1gFywLfMNNZwTL54LaEnwov3/BxEBt8OudffwSJEvGrBAJTrEcnJSbQ0Eq/KIzro3JOYzKLopj60aroeFdeiO09qvXm+63pWFgpG2pjU1fy/aap6/Ivjx77UuKZwmQqWCQE5vgXGwtQ2AP5S/mXNAUUwnxcwgq69NUqsICSD5y/FEN2RcF40AO5Fo2ro2GWMGwf7LJEiqj9+Lk1S16t+Mmp0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=38IgE8a/2fBB5Gnom0gnVA9ZvlrI4ztWELpQ1cSPuV4=;
 b=RX/gAQ1JK2qL9g8AYbZobuwIA3XtlDVc6kScfiYyYl47nRNcbHbu4C34S0qeFpfpCEWA+XkVEeEJRX8wi7Tw4FO67PW+7BIEjqAop7jImzRJxPvXw9k0/rKFkBCBH5izIdDtStWHpcpwzQT1o0yu6/tnVlCTQZfqcSAfmEQb/IU7oCNm7FHPYNGkEDHvl8oGK/tszqtB/zQIz7LgfTrfHwELCAl1qU88RoNFymhbP5FvUl/gZOiPEz3z4K38XUZU3xkHaQAgAm4P3h5dWXtDXHn11E5dirDZNowGsII28SDEcN83Zb/RLftrNjS8/hEOTBXNGoze9ueUafOgh//GGg==
Received: from TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com (2603:1096:408::791)
 by TYUPR06MB6242.apcprd06.prod.outlook.com (2603:1096:400:346::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Fri, 11 Sep
 2026 03:05:41 +0000
Received: from TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com
 ([fe80::e00f:6219:946c:195e]) by TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com
 ([fe80::e00f:6219:946c:195e%4]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 03:05:41 +0000
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: Ryan Chen <ryan_chen@aspeedtech.com>, Andrew Jeffery
	<andrew@codeconstruct.com.au>, Vinod Koul <vkoul@kernel.org>, Neil Armstrong
	<neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel
 Stanley <joel@jms.id.au>, Philipp Zabel <p.zabel@pengutronix.de>
CC: "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Joe Wang <joe_wang@aspeedtech.com>
Subject: RE: [PATCH v2 2/3] phy: add AST2700 usb3.2 phy driver
Thread-Topic: [PATCH v2 2/3] phy: add AST2700 usb3.2 phy driver
Thread-Index: AQHchpNOnM449AUerUiXvoW6kWH3sbZlhJQAgAA9O2CAFICtAIAAA0tAgE/a8hA=
Date: Fri, 11 Sep 2026 03:05:41 +0000
Message-ID:
 <TY2PPF5CB9A1BE658A5869C9F19E42307AEF2BE2@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
References: <20260116-upstream_usb3phy-v2-0-0b0c9f3eb6f4@aspeedtech.com>
		 <20260116-upstream_usb3phy-v2-2-0b0c9f3eb6f4@aspeedtech.com>
	 <ddb133ca1a3be605ee776b2276c1907c9ad32491.camel@codeconstruct.com.au>
	 <TY2PPF5CB9A1BE6AE5B658D558EBDF24450F2F82@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
 <ca289e45bbde8e8a2f823a1660aa0a8f88e94bc4.camel@codeconstruct.com.au>
 <TY2PPF5CB9A1BE62ADABBBFA67FF51ABB53F2C12@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
In-Reply-To:
 <TY2PPF5CB9A1BE62ADABBBFA67FF51ABB53F2C12@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY2PPF5CB9A1BE6:EE_|TYUPR06MB6242:EE_
x-ms-office365-filtering-correlation-id: e69b2e54-2f91-4185-0095-08df0fb19059
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|23010399003|1800799024|366016|38070700021|6133799003|10067099003|4143699003|56012099006|18002099003|22082099003;
x-microsoft-antispam-message-info:
 Jqs7qt6cwXUE0yZGnaL10bEt6lPJQURWtmnbG1wmQrYEVSjqMovmLYMm3gFy7umbr7OfOt2k3wVBYMEWFf5Ew6jemEDgvdxMU8vmB85/gEMLhmBmxx02mr6+PLm97blyszCBkVIbSXsyM+dM+nNr4agk5lOSDsg4meqGrOEYxj/az6lQP+231H5jL72QNLEfjfS5KBW+KpAElO/P8+T/sbHCS7AP1fkvFbYeiom/EhANYhz7PJcYf/IeENMOas4tEfmrJtaBG86G8Z4UavmPBj8Iys0i2rgAEKxMfvoM+s+tkVmFP4bT8ElZugKdMI46XEKq2zRsclwNVX87k2/3XNaS2RLLwmZjHCsFgSqC7P9poDGlmJUT7CTdV4A7WT4vYdUO1xOzKrDtw5PfLoBWqfMvnl8byJqOrWNPtESBX241+WAUak5ZhSLlA7sSS0RVukWgpq0w8aiD2gWSA0RIaxsJmj5/JbwJY4/GXVWd30KMsH/MqR2QF0syLz9fO9gRHchdKBGYXVSgi3mtUDEpKXiP8VsExaoGTKVe0x5RgEPIHkepmYAqHHBfrp5ymG6PcDgMCdW7VeyaHBk46L5lbyZbmonE6ETJqfN5zjTcBNNEaG2U84JAg7o83BMaCrpDW19iduZq571UjcfVhhZ7f+YlTIx6LuEa3MMxUWHfOTDpJbcfuvdbYF8VpVtben6yBwNh0W9Ba27M81HBv3OMm/0DsbrSJqhRtzA2HLDsgzs=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(1800799024)(366016)(38070700021)(6133799003)(10067099003)(4143699003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MHNHbXNxUEIzUlFvZ0t1cjRmZFlPZ1pZemd3NWJlS0hjQld3dnJXQjhZeXAr?=
 =?utf-8?B?aVorRFVlaGViYXl1VkpGc1VVNE5EN1dIa01PbXNIUW40SHVsczFOK2p5aHZu?=
 =?utf-8?B?T1dsSTFneTg4MVRjakhEUHd6cUpIaXJ4SXJlbVFSNG5CT1NRak9GUkNzN0Fy?=
 =?utf-8?B?WjFoZjFkQW51eDBiZ0UzUWIveS9ZZEVqd21HZEZZSU5vZ0xQT3BIV0pJMXBp?=
 =?utf-8?B?OUt3b29GbXYwaXZMck1WZDVGbXlxSHFOYU8xWloxcHhXQmR0emlvS3pibWIz?=
 =?utf-8?B?K2FWSWtCKzdlamNJdVlDV3NrUms3MnlHQnI3RFI0OFArTE5hN0RjeVVnR3FH?=
 =?utf-8?B?UlZwUjV1ZW15cUx4R2pXL2FWQWEvc1hEODVMUzVONFYyQUNtK3NPNmhkZVhR?=
 =?utf-8?B?ZjNwZlV6WWgwVGpvRjFDeGdTZWw3NE9NWENFNktvNjlNZ0hwRitPOG53RWVN?=
 =?utf-8?B?UmszYnJGZnNvdmk2TXFhVGJrT1MraE80WGJPVzBIRFBaZDY0S2lXU0lzdURp?=
 =?utf-8?B?WVIvQmpUK3dKUnJCcFhlT3RQTWNPd2pTM1VGQ2NoUjZVREtmeW1qRW50MXdC?=
 =?utf-8?B?djBPREN4enh3cFFSVFJmNWJOeEZ3a0pudjk5cHV5c0dZbGwvVlY4N2dUazBC?=
 =?utf-8?B?dm1tUWoweEp4ZTFxOXd5cy84Vjdkb3A4aG8wenZnOE5VVVZOZ1VmaEdpMGxy?=
 =?utf-8?B?dGNEdzhNbnJCRVBTRklXVnJLeVRaL3VPKzVLVkhRaWxEaXhRcUNQT3RvMU5h?=
 =?utf-8?B?bGhaRDdIOGJVQ2tnRE9KK2NlVTJoV1Vja2FGSGlXRGtPR2RlUVE1Y2NVYzRa?=
 =?utf-8?B?bVhwR21iT1NJVTRKUDdkUEsvNkZjcitqeUtzZXNSR2ZPb0ZJU3IzSHJ3ZWJm?=
 =?utf-8?B?NHVTTXJjdnFqdzNKeWNjT2FncTlLMXZxVG5jUnByMHE1L3RMS2lYVE44dUxw?=
 =?utf-8?B?Ym9tUXg1NEgvaklSR28wV0VPL2tkcjhHTzRjTjg1K2pRSUQrRXFmdGdzcVpC?=
 =?utf-8?B?RVhIdW1CejI0cUppOTZvZ2p3MWoxMnBqMTFrTTlpajVCNmhieURyNGc2SnBI?=
 =?utf-8?B?MGIwSjVqM1dWUnczVmlhT1BwNXdvamh0ZjNpZjRqc0dNNkdQRU84R0s2WUFJ?=
 =?utf-8?B?ZE5RVjIzYnY3L3ZJQ1MzbnZFckVoYkRwNmV4YmpZdkhCU2NFalhRMmZRMThO?=
 =?utf-8?B?Slc1RVk1c285NlNiOTd3STZwNXJwQWVsYVkxZ3RNOEZpS24wQXdHRzFFNzVK?=
 =?utf-8?B?ZnlpYVRlUzhyMWZlYnhaRThHR1RTaDNFRS9MZHBlRmo4emwrU1gvWnJvcHF5?=
 =?utf-8?B?UHpXam45U3hmdGJuOXlndmRPMnlXWmVpMEtmVEcyeS9lMVN1NU1pNVhuVnR2?=
 =?utf-8?B?WVFKT2cyTTBsZGpuemo3bnhDcDF1VGNNSEMzZzJhR1dxa1lDaGJmTTRPTitw?=
 =?utf-8?B?ZUwyVmdFUlBPbDV0cXo5UHQ4WktPQytCUVNKbzUrenZGTWpiUERyOUpNbnl2?=
 =?utf-8?B?ZG9MMVRaa0xsZTVNbisxNFJVVVBqaS9FTFNGdTZxbXZYbkdCYjZEc0hMZHdC?=
 =?utf-8?B?OU5LUVp2cHovK0hyZ3l4Sld0ckJrQnE2OGx3UHNnekdDdWQvTmhpRWQrc0dl?=
 =?utf-8?B?QUhWYy9FeXo2WFFSQTlzMjVNdTRpYW13YXM4VHVrUFJvU3RIUm1HMTE4UVYz?=
 =?utf-8?B?aE5ibjdNR25rNmRESFZkN05nNiswckV3ZnlxamNYZStPc3JBTjljWld1dGkz?=
 =?utf-8?B?aFkzOCtSNG0ybHh1KzRRaGxzRzRFZ0FZNjJtNHhwRy85SXl3Tkl5NlVXeTQ1?=
 =?utf-8?B?QzQraitaaCtyRi9FS2FGaFVBRy9hRTFvdVFwMnZZbFJtamE1YXYvZHE4cm9s?=
 =?utf-8?B?Znc2VkJ3N3FmTUR2dk1UZkRwRGtJNEZYaE4zek1iTlY0amFEQkk4UFB0Z21S?=
 =?utf-8?B?MmZaYlhVdlFqS3A0WS85bUxhc0JIL2FLZlBrUENwS0p0b1lObDNUNVJuT3Bh?=
 =?utf-8?B?TmNaOGhSakNWUklmcy9zb05BU2RKRWo2anhSek1jc2ljZUFxcFBuY3pwUm1P?=
 =?utf-8?B?WFBnQitZYzNkK0FHZjI0blhwbXdoOUt5dDJiWTdJMHJtTi93azhHc0NaZDdM?=
 =?utf-8?B?WXNRQlFNOFNocDMyTklIWmdVdkhReHMrbEVUY3A5dEhkcnZGM2RjS1Q1T25K?=
 =?utf-8?B?R3oyN29OZVIyNmJQTFo3ak5FVVpDSzNNNTFBYTk1QmtxTStJYklQV1N5SEhZ?=
 =?utf-8?B?bTBGYjhhMktib0lQNmludllQNHZUdEVCbHhKR25IR0krdGxVK0lBTE9CMHpm?=
 =?utf-8?B?UmFVVFJML3FIell0c2E3czZZUzVFOTlDeERTVzlvcjZpZ056VWovUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e69b2e54-2f91-4185-0095-08df0fb19059
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2026 03:05:41.5134
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aP04SzHxY2tAUsjY4fTSrz/UuiZNO/OsfrsQvn1SgCNfE9mmaEU18M7rTXCKKDMsLKTljzzmu48FzRSvk6hHCGW9HfH6Hrf3fJDu8G9BQKY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYUPR06MB6242

PiBTdWJqZWN0OiBSRTogW1BBVENIIHYyIDIvM10gcGh5OiBhZGQgQVNUMjcwMCB1c2IzLjIgcGh5
IGRyaXZlcg0KPiANCj4gDQo+ID4gU3ViamVjdDogUmU6IFtQQVRDSCB2MiAyLzNdIHBoeTogYWRk
IEFTVDI3MDAgdXNiMy4yIHBoeSBkcml2ZXINCj4gPg0KPiA+IE9uIFdlZCwgMjAyNi0wNy0xNSBh
dCAwNTo1NSArMDAwMCwgUnlhbiBDaGVuIHdyb3RlOg0KPiA+ID4NCj4gPiA+ID4NCj4gPiA+ID4g
PiArCX0NCj4gPiA+ID4gPiArDQo+ID4gPiA+ID4gKwkvKiBXYWl0IGZvciBVU0IzIFBIWSBpbnRl
cm5hbCBTUkFNIGluaXRpYWxpemF0aW9uIGRvbmUgKi8NCj4gPiA+ID4gPiArCXJldCA9IHJlYWRs
X3BvbGxfdGltZW91dChhc3BlZWRfcGh5LT5yZWdzICsgUEhZM1MwMCwgdmFsLA0KPiA+ID4gPiA+
ICsJCQkJIHZhbCAmIFBIWTNTMDBfSU5JVF9ET05FLA0KPiA+ID4gPiA+ICsJCQkJIFVTRUNfUEVS
X01TRUMsIDEwICogVVNFQ19QRVJfTVNFQyk7DQo+ID4gPiA+ID4gKwlpZiAocmV0KSB7DQo+ID4g
PiA+ID4gKwkJZGV2X2Vycihhc3BlZWRfcGh5LT5kZXYsICJTUkFNIGluaXQgdGltZW91dFxuIik7
DQo+ID4gPiA+ID4gKwkJZ290byBlcnJfYXNzZXJ0X3Jlc2V0Ow0KPiA+ID4gPiA+ICsJfQ0KPiA+
ID4gPiA+ICsNCj4gPiA+ID4gPiArCXZhbCA9IHJlYWRsKGFzcGVlZF9waHktPnJlZ3MgKyBQSFkz
UzAwKTsNCj4gPiA+ID4gPiArCXZhbCB8PSBQSFkzUzAwX1NSQU1fQllQQVNTOw0KPiA+ID4gPiA+
ICsJd3JpdGVsKHZhbCwgYXNwZWVkX3BoeS0+cmVncyArIFBIWTNTMDApOw0KPiA+ID4gPg0KPiA+
ID4gPiBBY2NvcmRpbmcgdG8gdGhlIGRhdGFzaGVldCBQSFkzUzAwWzE1XSAoUEhZM1MwMF9JTklU
X0RPTkUgYWJvdmUpDQo+ID4gPiA+IGluZGljYXRlcyB0aGF0IHRoZSBQSFkgaW50ZXJuYWwgU1JB
TSBpbml0aWFsaXNhdGlvbiBpcyBjb21wbGV0ZS4NCj4gPiA+ID4gVGhlIGRhdGFzaGVldCByZXBv
cnRzIHRoZSBTUkFNIGlzIHVzZWQgZm9yIGNvbmZpZ3VyYXRpb24gb2YNCj4gPiA+ID4gY2FsaWJy
YXRpb24gYW1vbmcNCj4gPiBvdGhlciB0aGluZ3MuDQo+ID4gPiA+IFBIWTNTMDBbNl0gaW5zdHJ1
Y3RzIHRoZSBQSFkgdGhhdCBzb2Z0d2FyZSBoYXMgY29tcGxldGVkIGxvYWRpbmcNCj4gPiA+ID4g
dGhlIGNvbmZpZ3VyYXRpb24gZGF0YSBpbnRvIFNSQU0sIGhvd2V2ZXIgUEhZM1MwMF9TUkFNX0JZ
UEFTUw0KPiA+ID4gPiAoUEhZM1MwMFs3XSkgdGVsbHMgdGhlIFBIWSB0byBsb2FkIGNvbmZpZ3Vy
YXRpb24gZnJvbSAiaGFyZCB3aXJlZCIgdmFsdWVzLg0KPiA+ID4gPg0KPiA+ID4gPiBJcyBpdCBu
ZWNlc3NhcnkgdG8gd2FpdCBmb3IgU1JBTSBpbml0aWFsaXNhdGlvbiB0byBjb21wbGV0ZSBpZg0K
PiA+ID4gPiB3ZSdyZQ0KPiA+IGJ5cGFzc2luZyBpdD8NCj4gPiA+ID4gT3IgYXJlIHRoZXJlIG90
aGVyIHNpZGUtZWZmZWN0cyBpbnZvbHZlZCBpbiB0aGUgc2V0dGluZyBvZiBQSFkzUzAwWzE1XT8N
Cj4gPiA+DQo+ID4gPiBZZXMsIGl0IGlzIG5lY2Vzc2FyeSB0byB3YWl0IFNSQU0gaW5pdGlhbCwg
dGhlIGRyaXZlciBwb2xscyBQSFkzUzAwWzE1XS4NCj4gPiA+IEl0IHJlcG9ydHMgdGhhdCB0aGUg
Ym9vdCBsb2FkZXIgaW4gdGhlIFBDUyBoYXMgZmluaXNoZWQgaW5pdGlhbGlzaW5nDQo+ID4gPiB0
aGUgU1JBTSAobG9hZGluZyB0aGUgY29udGVudHMgaW50byB0aGUgUENTKSwgYW5kIHRoYXQNCj4g
PiA+IGluaXRpYWxpc2F0aW9uIGhhcyB0byBjb21wbGV0ZSBiZWZvcmUgc3JhbV9ieXBhc3MgKFBI
WTNTMDBbN10pIG1heSBiZQ0KPiBhc3NlcnRlZC4NCj4gPiA+DQo+ID4NCj4gPiBDYW4geW91IGlt
cHJvdmUgdGhlIGNvbW1lbnQgdGhlbiB0byBtYWtlIGl0IGNsZWFyIHRoYXQgdGhlIHdhaXQgaXMN
Cj4gPiBuZWNlc3NhcnkgZGVzcGl0ZSB0aGUgYnlwYXNzPw0KSGVsbG8gQW5kcmV3LA0KDQpTb3Jy
eSBmb3IgbGF0ZSByZXNwb25zZSwgaXQgdGFrZXMgdGltZXMgY29tbWVudGF0ZSB3aXRoIG91ciBk
ZXNpZ25lci4NClRoZSBQSFkgdGFrZXMgaXRzIGNvbmZpZ3VyYXRpb24gZnJvbSB0aGUgaW50ZXJu
YWwgU1JBTSBpbiBib3RoIG1vZGVzLCBzbw0KdGhlIHdhaXQgaXMgbmVjZXNzYXJ5IGVpdGhlciB3
YXkuIFBIWTNTMDBbMTVdIHJlcG9ydHMgdGhhdCB0aGUgUENTIGJvb3QNCmxvYWRlciBoYXMgZmlu
aXNoZWQgaW5pdGlhbGlzaW5nIHRoYXQgU1JBTSwgYW5kIHRoZSBsb2FkaW5nIGNvbnRyb2xzIC0N
ClBIWTNTMDBbN10gYW5kIFBIWTNTMDBbNl0gLSBtYXkgb25seSBiZSBkcml2ZW4gb25jZSBpdCBo
YXMuDQoNCldoYXQgdGhlIHR3byBjb250cm9scyBzZWxlY3QgaXMgd2hpY2ggY29uZmlndXJhdGlv
biBpcyB1c2VkOg0KDQogIFBIWTNTMDBfU1JBTV9CWVBBU1MgICAoYml0IDcpICB0aGUgZGVmYXVs
dCBkZXNpZ24gY29uZmlndXJhdGlvbg0KICBQSFkzUzAwX1NSQU1fRVhUX0xPQUQgKGJpdCA2KSAg
dGhlIFJPTSBjb2RlIGNvbmZpZ3VyYXRpb24NCg0KQWZ0ZXIgY29uZmlybSB3aXRoIGRlc2lnbmVy
IEkgd2lsbCBtb2RpZnkgYXQgdjQgcGF0Y2ggZnJvbSBTUkFNX0JZUEFTUw0KdG8gRVhUX0xPQUQs
IER1ZSB0byB0aGF0IHdpbGwgYmUgbW9yZSBwcmVjaXNlIGNvbmZpZ3VyYXRpb24uDQoNCkFuZCBJ
IHdpbGwgdXBkYXRlIGNvbW1pdCBtZXNzYWdlIHdpdGggZm9sbG93aW5nLg0KDQogICAgcGh5OiBh
c3BlZWQ6IEFkZCBBU1QyNzAwIFVTQjMuMiBQSFkgZHJpdmVyDQoNCiAgICBBZGQgYSBkcml2ZXIg
Zm9yIHRoZSBVU0IzLjIgUEhZIG9uIHRoZSBBc3BlZWQgQVNUMjcwMCwgd2hpY2ggaXMNCiAgICBw
YWlyZWQgd2l0aCB0aGUgRFdDMyBjb250cm9sbGVyLg0KDQogICAgVGhlIFBIWSBkcmF3cyBpdHMg
Y29uZmlndXJhdGlvbiBmcm9tIGFuIGludGVybmFsIFNSQU0gaW4gYm90aCBvZiB0aGUNCiAgICBh
dmFpbGFibGUgbW9kZXMsIHNvIHRoZSBkcml2ZXIgbXVzdCB3YWl0IGZvciBQSFkzUzAwX0lOSVRf
RE9ORQ0KICAgIGJlZm9yZSBzZWxlY3Rpbmcgb25lLiBQSFkzUzAwX1NSQU1fQllQQVNTIHNlbGVj
dHMgdGhlIGRlZmF1bHQgZGVzaWduDQogICAgY29uZmlndXJhdGlvbiBhbmQgUEhZM1MwMF9TUkFN
X0VYVF9MT0FEIHRoZSBST00gY29kZSBjb25maWd1cmF0aW9uOw0KICAgIHRoZSBkcml2ZXIgdXNl
cyB0aGUgbGF0dGVyLg0K
