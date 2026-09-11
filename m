Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011069.outbound.protection.outlook.com [52.101.125.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DED9B46D2DA;
	Fri, 11 Sep 2026 09:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789118589; cv=fail; b=phd4QOdShNRq0JDK7hEj6gubdNNhG3IIE+5CGTcwGtT281aJ7OCJp9vLd2MziECUa42N2AQ1WVgoVkq1bfGoM+HsaEV9XRRkzg4l6Vqhn3ye23ebC02OYdsBkYhl2eQ7hHbGJ+WzcwGFhxIydQnJ2ADFOJN14eXl1yq1lmkG+24=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789118589; c=relaxed/simple;
	bh=tUwBDs4UKEl7bO/pssDdJ5xijtfOm1dMBVxpGNp6dgM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=LIax46L2r2tzy9hTeD9KlnJEgvI3nIJjGfiks5FZfG6oJXWrtBXFwrmbmkkJr2k5cofHer5XKvTUe/5jwpypo9Dj2Ezw2WznN2bdoq65kEtQIcBudJo0PQ3cfDSUPybQ65qRm1muA9WEvTgKN1oUdZZO+nSzWc6IdRPF4m45k4M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=DVgxNyTU; arc=fail smtp.client-ip=52.101.125.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="DVgxNyTU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=udkLLL/3lDrN7h+Y0LF/ZeZcxqOpObaOOmAlPQQnOpTb6dhhWNzwM6tyJ8Aq1+sqnO0+zNVytzJJQ8aQ+Ce78AUCRZfHp70PtmnQ3jV5SdoRMKdzuCeVqHCFI25RaaQXlZO9EKuFRm6afUzlDJdJ8qpPZaOIThixsrn7Zp/b4CYxYV8t2bj7co6wkuKMcCKdQKX1GNpn/EvEGJ8kBlPrgcj0j07Fb95xAxgLYt1K5/pmLqzU5b0XV4wdr3Ld8H1PlyqLZq8sKfEj0DmqfJbJrHMka4DZYNwWxExTUXWJ/v8e7S+W6nAyk43/7ISUVvmvwQajZeEnA6h7CBJZm6UysA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tUwBDs4UKEl7bO/pssDdJ5xijtfOm1dMBVxpGNp6dgM=;
 b=BJfY7hFvKECcbdS4S2uoGzAaojlPjuDxjM2hJ6kXhsf7ZcYY2ZR6pmwSigyuhG/6w1qnvVM+4i4luGqML6rV8gbptEgOUXFQpO2Az62pQcHcbiVwKlq+wBljIgBZoCnDKe1baz1q8vUMp1GEvAqVyXNs3mKHOIPLKE3GL9tDRkFsCX7LGSYwliZN05MBAk4hK8M4f8owplsRsYe6xrwxzRBh52PcpWrlkepKLqd7oe5269QoGl9u3OtHr8PKNZEEN7+Cnx2DkvO77rRiCMPmLeSDIGCcbU0t1EFc5uN24sSgtNl4JjLNagYJeh3e9GddOMOjD76wFm0XfPEODBFbAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tUwBDs4UKEl7bO/pssDdJ5xijtfOm1dMBVxpGNp6dgM=;
 b=DVgxNyTUpDKm6xgQNY7/QEps9E8BgV5Vmzl/gktb8IrcGYUCAZZOJAQcMlXptaojELOgkM9EXQRvtVu+aOqd9AhTENu5X12XorjYH7H3dWIdJhrlRwvQFUEI5Sock4vjfvH+T7/1KpWrlEp7Py9uktl83fV9aOsrtlbfZrZHB38=
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com (2603:1096:400:3c0::7)
 by OS7PR01MB11582.jpnprd01.prod.outlook.com (2603:1096:604:243::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Fri, 11 Sep
 2026 09:23:04 +0000
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::2511:10cd:e497:4d97]) by TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::2511:10cd:e497:4d97%4]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 09:23:04 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>, Manivannan Sadhasivam
	<mani@kernel.org>
CC: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>, "linux-phy@lists.infradead.org"
	<linux-phy@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2] phy: renesas: phy-rzg3e-usb3: Use SYSTEM_SLEEP_PM_OPS
 instead of NOIRQ
Thread-Topic: [PATCH v2] phy: renesas: phy-rzg3e-usb3: Use SYSTEM_SLEEP_PM_OPS
 instead of NOIRQ
Thread-Index: AQHc7bHECYKZGBehrkWMNew/iSDDzLbE4BKAgATakoCAAAgPEA==
Date: Fri, 11 Sep 2026 09:23:04 +0000
Message-ID:
 <TYCPR01MB11332FA5F0653724BCD8EF99786BE2@TYCPR01MB11332.jpnprd01.prod.outlook.com>
References: <20260527082052.117289-1-ovidiu.panait.rb@renesas.com>
 <hpjrkv3bpbx4rfz2v6bumntiw5k36etktnv4bvxs2dhuv5wr3x@m4estpjcreo3>
 <OSCPR01MB1276930A2DEB5BB5B5EE29932D3BE2@OSCPR01MB12769.jpnprd01.prod.outlook.com>
In-Reply-To:
 <OSCPR01MB1276930A2DEB5BB5B5EE29932D3BE2@OSCPR01MB12769.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11332:EE_|OS7PR01MB11582:EE_
x-ms-office365-filtering-correlation-id: c57d91fc-2568-4d70-0c7a-08df0fe64879
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|11063799006|56012099006|6133799003|4143699003|18002099003|10067099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 kQlbR9+msWzripJgYRncIPH7+vxSjIIQYj0PvhJKgw5QYZpxtmJk/o2XUlXKX3LQr+gJdx3y1ImQgGDOvzliZEVgPzBBO30Qk8dDNniCE+DpXDMoPebmRyif+h0ggzt+nmRQ7CLS/Jd6u9pxYb5ajE6hbqXx/RyElJJHcAF8SqaaCTuCk0FrUpqYdfCfKZUJkQm2H+j8yUpQiau2aH1flal3PfP6KTiG6vsAM9kUChdLUTSOguFGLiV4yI5VSQmOpoWDbzs71+PNJOEJ2p304LV4avPZLbsZ714tQpy/7STnFKMkuiCHLosx2GTamaZHDKOsgk/H2jzzIT9LSoXnI2QFfd780HUfYBfeTa21z6Xf1K1qCavSUXBWhli+YKhgVH9UbGWX0ugli4FvDpvZYe4MMtOOI6aJTeikOcLg6bjAYtQCDZC7SIZIY/XQOhqtfXne99OdiinNJOhXRLLjU2x3XsOWHlEUd/Q3O/k7//iWykxTNXRfjooMMbA7qMR3G9OKaRFJqfM8LchTXQrRe0vOD6EdEG78bjxPnPN8ZIPoajRbuvt057MrvOrqPBdCY+e+xYwAKWsB8pmwXuRpfK8i85h/PbvU70AF6f95+1pZNi9wsSUAQ+YqqgoFnfA3qwwT/ywlUjSqsp9T93fPafOw28TG5wqBhkBbJwgGbFcMm9zcyX8NHufirCNlw84gQYo0LgYK5VV2Ut7eMUu00pQFo0i/XWZt2Nbe1DPDrec=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11332.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(11063799006)(56012099006)(6133799003)(4143699003)(18002099003)(10067099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QnMzQkF0UGVjTGdEWjFQUlozbUZPVVpldWpWNzhqSlYzeG41WmZRemRnQjY3?=
 =?utf-8?B?a3FINTR3RFg3VmlaREM4SkFkaEd5anIzSVJzck1iMkUxbVVzcE93TUdIVkRZ?=
 =?utf-8?B?T2l0cWhjdlpEU1l4S1JEa3N2MEpWbk83MG93WXB1SDErdkZETzZIazV0aXB5?=
 =?utf-8?B?bVZBa0F6ZDlLeHpXVStPZ2lTeWFPLzB3QmE5azhmdHN5N3d4eFNGNE9TbVZu?=
 =?utf-8?B?VWlRRXJqbWFBQi90cCt0N2xodkdidHZzQTh1bnFwOVVMbUxNWndMWXVRdHFM?=
 =?utf-8?B?ZFE3djVnVEhjZnN6bExnSGx4Mkt3K2dLTWk2S0ErNXZwUE1wVXBQQUw5ZkF5?=
 =?utf-8?B?K1JYVXlzaGd4aDZEMi9YdGVNeVlnTW9pTlFIMWJWWGhQTFIzMUpqRkVHV3VR?=
 =?utf-8?B?K1J2dDJiZmFWaWxVakQ5cUZxbWNKK1ZoSE1vNUlqS3RMUnEyK3A2bmFjVzZV?=
 =?utf-8?B?Z3I4Ui83ZnhaSGVnTXUrdndESzdvVWptWEg3YkRRVkgwU08xRk4vSXE1amlm?=
 =?utf-8?B?M2d5ajZCOWlYVW9Hc1U4aUlYL2xJSStrdm1wYUlHaGk0d3BDbXkvT1ZLdVJm?=
 =?utf-8?B?OEsrVFFYYWhxNS9Pa1pyUlNIVEdVVHVLa05YaEplQlJvdXQ5d2x4ZUpaM0hK?=
 =?utf-8?B?VWxMQTFoOEgzV01ZTnZHYUsrRDJhcXJ6L1phVXdVTTJIWSsxNjN5RldjWGIz?=
 =?utf-8?B?enBjdEZ2cXRNeUltQW8zbTFZdnNhVHA2bDZxNnBOMnFBR010ZEI4SkU4WWRu?=
 =?utf-8?B?bHg5Qkdxb1lCY2g0SXlZZFBBQ245SW9tcHB3WGRkUzRTSXpNTXZNMkZsLzg3?=
 =?utf-8?B?M1pZUGIxLzgvN3B2ZXZHMDAva0tkb3oxVGFuOTE5NThyMkMwRHZ5Uitwb1Fr?=
 =?utf-8?B?K0Y1ZWppUHI5MkVjQklLS255TGdqVjRsZGhORU5JQXhsa0FWcGd3VVdOT0Nh?=
 =?utf-8?B?T2Nyd2ZTcHJNa3l1MCtRVjhvMGREeWxsQndLazBpL2t1eHBadFZhbStsMURk?=
 =?utf-8?B?NGplR0txSVZpUlRRczN5V1NnZGc4RHFSQ2hFckVwYWZTU2NlK292cm1KWHhr?=
 =?utf-8?B?b0Nvc1NIWnk0VGgxa0xHMWxhS3pqM1dvb3ZNU051Ym9xK3hKVytZL1ZUSFZN?=
 =?utf-8?B?Z1RDZ1gwNXpBaXhzdmo2YStBUGdySE9JRWhzNkRpaFIwT2x0ckNQbEd3bGo4?=
 =?utf-8?B?Rkk2U2RPR2Zvc29jaGQ2NStVYjhzdlhscGQ1ekFuemZZNzNmUVRiMnU1MHRR?=
 =?utf-8?B?SDFxQ0Q5akZYaUcyYzZqQlVKKzZWek9sM3Rvdy9OMm1WS3pBZVlkd3lsTFBp?=
 =?utf-8?B?WFdxS1RhTXVuT01EbHdURXJQdlMwZVdDdW5rdlFvRjlJMGh1SFVsYlNnTWF5?=
 =?utf-8?B?WnFMaDBtRmJFa3dDVlA5R0tSVEYzb2tNZ2VWY2ZMU3BiMmtDaEQ4VUU1am9y?=
 =?utf-8?B?YktXbFB3emdEZlZRcDF6cXNmTzJNeldoalRCcmdzcjJMemtzQXMveDVHME1x?=
 =?utf-8?B?d3pSWU9aZDZHbkMrSWd0aVJ4Y3RqbWZVK3FJcGwzWFRIRUQzditTUjVyMUVp?=
 =?utf-8?B?Z1RLTEttdU1za0ljOVhSVWVTaWNtWENCOCtvQWYxdFZzYkxtVnhyMDN4cjYy?=
 =?utf-8?B?enBPOVMxUURFemdWVzMwNzB5NHRRYWJwaFpxYUFPSjRrSVBqcWF5djlveURs?=
 =?utf-8?B?bWorQmEyWmdvY0xTS2I5T1JMZ0p4ZTBFa2tTRERHUm1heVh1dngrcWlrSCth?=
 =?utf-8?B?aVgvK05aQUFCbEFJTDBkWFJRWThvWVN3M1JHa0hsUGE0WXVwbytlNmkvMDRz?=
 =?utf-8?B?Y3NHSkVmSGc3dTJHQkh6dnEzQ2NIMnB6Vm5paEhyK2w3VGRrZE1kcHlvWk00?=
 =?utf-8?B?Y2tEeHc5eDZoRVBObC9rMTljYmgydlEreVgxV01nMUtlLzJsMFhTc082N2FU?=
 =?utf-8?B?RUJmQmJYeUVXUkgxTHh1VkMzQUFSMGl1R3poUlJNczZ1V2c5R1BzRXJJUThr?=
 =?utf-8?B?QVQyUmpkY3dBYURrOVFMVEl5RVhTajN5ZXExQWN0MjBDR1FubjBOYm0xSkdR?=
 =?utf-8?B?NDhSVmk4WFREOXgxaVNKSmUrTG5qeWhqOVp2ekRsNHpVRndIa0RlRTJqWW03?=
 =?utf-8?B?Ukg4TmxxSE1TLzBVR0cxQ21jczVIWU9jZks1S0lFcm9NTkF5OGlMTWZsMlU5?=
 =?utf-8?B?WTBUSEU3cmNHNTJJREcvUDlYSnJrN3dpdDcxc2RTWjZXVDFTYThWMEF6andi?=
 =?utf-8?B?RC9lUXZRUXZoa1pnZm85WGtZT0ZtWmpwWWVDUU1SZlVFUmtvTkx4U0VDOEVm?=
 =?utf-8?B?WGVnUVlmb3lDam9VNkJVakM4Mlh3Wmt5aTI1Vk5ueDU3dC96Wjl5dz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11332.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c57d91fc-2568-4d70-0c7a-08df0fe64879
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2026 09:23:04.2584
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fBuuL3Rx580Kdb5uCSN6PYRO5NFxhL2RyNMmwR2ROhyAHMkQBRaAShAo/LTWfiZ6QNHSFR+JwUk1pNb18di58JYEtVxBUJKvOa5L7GO8PWg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB11582

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogT3ZpZGl1IFBhbmFpdCA8
b3ZpZGl1LnBhbmFpdC5yYkByZW5lc2FzLmNvbT4NCj4gU2VudDogMTEgU2VwdGVtYmVyIDIwMjYg
MDk6NTMNCj4gVG86IE1hbml2YW5uYW4gU2FkaGFzaXZhbSA8bWFuaUBrZXJuZWwub3JnPg0KPiBD
YzogVmlub2QgS291bCA8dmtvdWxAa2VybmVsLm9yZz47IE5laWwgQXJtc3Ryb25nIDxuZWlsLmFy
bXN0cm9uZ0BsaW5hcm8ub3JnPjsgQmlqdSBEYXMNCj4gPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMu
Y29tPjsgR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydCtyZW5lc2FzQGdsaWRlci5iZT47IGxpbnV4
LQ0KPiBwaHlAbGlzdHMuaW5mcmFkZWFkLm9yZzsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9y
ZzsgbGludXgtcmVuZXNhcy1zb2NAdmdlci5rZXJuZWwub3JnDQo+IFN1YmplY3Q6IFJFOiBbUEFU
Q0ggdjJdIHBoeTogcmVuZXNhczogcGh5LXJ6ZzNlLXVzYjM6IFVzZSBTWVNURU1fU0xFRVBfUE1f
T1BTIGluc3RlYWQgb2YgTk9JUlENCj4gDQo+IEhpIE1hbml2YW5uYW4sDQo+IA0KPiA+DQo+ID4g
T24gV2VkLCBNYXkgMjcsIDIwMjYgYXQgMDg6MjA6NTJBTSArMDAwMCwgT3ZpZGl1IFBhbmFpdCB3
cm90ZToNCj4gPiA+IE9uIHRoZSBSZW5lc2FzIFJaL1YySCBwbGF0Zm9ybSwgaWYgdGhlIHhoY2kg
ZHJpdmVyIGlzIHVuYm91bmQgYW5kDQo+ID4gPiB0aGUgc3lzdGVtIGlzIHN1c3BlbmRlZCBhZnRl
cndhcmRzLCBhIFBNIHVuZGVyZmxvdyBlcnJvciB3aWxsIG9jY3VyOg0KPiA+ID4NCj4gPiA+ICAj
IGVjaG8gMTU4NTAwMDAudXNiID4NCj4gPiA+IC9zeXMvYnVzL3BsYXRmb3JtL2RyaXZlcnMveGhj
aS1yZW5lc2FzLWhjZC91bmJpbmQNCj4gPiA+ICAjIHN5c3RlbWN0bCBzdXNwZW5kDQo+ID4gPiAg
MTU4NzAwMDAudXNiLXBoeTogUE06IGRwbV9ydW5fY2FsbGJhY2soKTogZ2VucGRfcmVzdW1lX25v
aXJxDQo+ID4gPiByZXR1cm5zIC0NCj4gPiAxMw0KPiA+ID4gIDE1ODcwMDAwLnVzYi1waHk6IFBN
OiBmYWlsZWQgdG8gcmVzdW1lIG5vaXJxOiBlcnJvciAtMTMNCj4gPiA+ICAxNTg3MDAwMC51c2It
cGh5OiBSdW50aW1lIFBNIHVzYWdlIGNvdW50IHVuZGVyZmxvdyENCj4gPiA+DQo+ID4gPiBXaGVu
IHRoZSB4aGNpIGRyaXZlciBpcyB1bmJvdW5kLCB0aGUgcnVudGltZSBQTSB1c2FnZSBjb3VudCBv
ZiB0aGUNCj4gPiA+IFBIWSBkcm9wcyB0byAwLiBTaW5jZSB0aGUgc3VzcGVuZC9yZXN1bWUgY2Fs
bGJhY2tzIGFyZSBpbiB0aGUgbm9pcnENCj4gPiA+IHBoYXNlLCB0aGUgcG1fcnVudGltZV9yZXN1
bWVfYW5kX2dldCgpIG9uIHJlc3VtZSBlcnJvcnMgb3V0IHdpdGgNCj4gPiA+IC1FQUNDRVMgYW5k
IHRoZSB1c2FnZSBjb3VudCBzdGF5cyBhdCAwLiBUaGUgc3Vic2VxdWVudCBwdXQgaW4NCj4gPiA+
IGRldmljZV9jb21wbGV0ZSgpIHRoZW4gdW5kZXJmbG93cyB0aGUgY291bnRlci4NCj4gPiA+DQo+
ID4gPiBUbyBmaXggdGhpcywgbW92ZSB0aGUgc3VzcGVuZC9yZXN1bWUgY2FsbGJhY2tzIG91dCBv
ZiB0aGUgbm9pcnENCj4gPiA+IHBoYXNlIGJ5IHN3aXRjaGluZyBmcm9tIE5PSVJRX1NZU1RFTV9T
TEVFUF9QTV9PUFMgdG8gU1lTVEVNX1NMRUVQX1BNX09QUy4NCj4gPiA+DQo+ID4NCj4gPiBXaGls
ZSB0aGlzIHBhdGNoIGZpeGVzIHRoZSBydW50aW1lIFBNIHVuZGVyZmxvdywgaXQgZG9lcyBub3QN
Cj4gPiBuZWNlc3NhcmlseSBmaXggdGhlIHVuZGVybHlpbmcgaXNzdWUuIFRoZSBpc3N1ZSBoZXJl
IGlzIHRoYXQgdGhlIFBIWQ0KPiA+IHdhcyBhbHJlYWR5IHN1c3BlbmRlZCBkdWUgdG8geGhjaSBk
cml2ZXIgdW5ib3VuZCBhbmQgdGhlDQo+ID4gcG1fcnVudGltZV9yZXN1bWVfYW5kX2dldCgpIGlu
DQo+ID4gcnpnM2VfcGh5X3VzYjNfcmVzdW1lKCkgdW5uZWNlc3NhcmlseSB0cmllcyB0byB3YWtl
cyB1cCB0aGUgUEhZLg0KPiA+DQo+ID4gSSB0aGluayB3aGF0IHlvdSBuZWVkIGlzIHBtX3J1bnRp
bWVfZm9yY2Vfe3N1c3BlbmQvcmVzdW1lfSB0bw0KPiA+IGNvbmRpdGlvbmFsbHkgcmVzdW1lIHRo
ZSBQSFkgaW4gaXRzIHJ6ZzNlX3BoeV91c2IzX3Jlc3VtZSgpIGNhbGxiYWNrLg0KPiA+DQo+IA0K
PiBJIGFncmVlLCB0aGUgUEhZIHNob3VsZCBub3QgYmUgcmVzdW1lZCBpZiB0aGVyZSBpcyBubyBj
b25zdW1lci4NCj4gDQo+IEhvd2V2ZXIsIHRoZSBzdXNwZW5kIGNhbGxiYWNrIGFzc2VydHMgdGhl
IFBIWSByZXNldCwgc28gaXRzIHN0YXRlIGlzDQo+IGFsd2F5cyBsb3N0IGFjcm9zcyBzeXN0ZW0g
c3VzcGVuZC4gUmVzdW1pbmcgdGhlIFBIWSB3aXRoDQo+IHBtX3J1bnRpbWVfZm9yY2VfcmVzdW1l
KCkgaW4gcnpnM2VfcGh5X3VzYjNfcmVzdW1lKCkgbWlnaHQgbGVhdmUgaXQNCj4gdW5pbml0aWFs
aXplZCBpZiBpdCB3YXMgcnVudGltZSBzdXNwZW5kZWQsIGFuZCByZWxpZXMgb24gdGhlIGNvbnN1
bWVyDQo+IGFsd2F5cyBjYWxsaW5nIHBoeV9pbml0KCkgYWdhaW4gYmVmb3JlIHVzaW5nIGl0LiBJ
IGFtIG5vdCBzdXJlIHRoYXQgaXMNCj4gYWx3YXlzIHRoZSBjYXNlLg0KPiANCj4gVGhlIGNsZWFu
ZXN0IHNvbHV0aW9uIEkgc2VlIGlzIHRvIG1vdmUgdGhlIHJlc2V0IGFzc2VydC9kZWFzc2VydCBh
bmQNCj4gdGhlIFBIWSBpbml0aWFsaXphdGlvbiB0byBydW50aW1lIFBNIGNhbGxiYWNrcywgYW5k
IGltcGxlbWVudCB0aGUNCj4gc3lzdGVtIHNsZWVwIGFzOg0KPiANCj4gTk9JUlFfU1lTVEVNX1NM
RUVQX1BNX09QUyhwbV9ydW50aW1lX2ZvcmNlX3N1c3BlbmQsIHBtX3J1bnRpbWVfZm9yY2VfcmVz
dW1lKQ0KDQpJcyB0aGlzIGJlaGF2aW91ciB0ZXN0ZWQgb24gUlovRzNFIHdpdGggczJyYW0/DQoN
CkNoZWVycywNCkJpanUNCg0KPiANCj4gVGhpcyBzaG91bGQgZW5zdXJlIHRoZSBQSFkgaXMgcmVp
bml0aWFsaXplZCB3aGVuZXZlciBpdCBpcyB1c2VkIGFuZA0KPiB0aGF0IGl0IHN0YXlzIHN1c3Bl
bmRlZCB3aGVuIGl0IGlzIG5vdCB1c2VkLg0KPiANCj4gUGxlYXNlIGxldCBtZSBrbm93IHdoYXQg
eW91IHRoaW5rLg0KPiANCj4gVGhhbmtzIQ0KPiBPdmlkaXUNCj4gDQo+ID4gLSBNYW5pDQo+ID4N
Cj4gPiAtLQ0KPiA+IOCuruCuo+Cuv+CuteCuo+CvjeCuo+CuqeCvjSDgrprgrqTgrr7grprgrr/g
rrXgrq7gr40NCg==
