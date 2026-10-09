Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022082.outbound.protection.outlook.com [40.107.75.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 265793EC813;
	Fri,  9 Oct 2026 06:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791526278; cv=fail; b=Xlp3ZXhPnu/Sv6B62IdOcEVjs+dJk6cwjHpoPf+G7/KbwKH8HkgTn6kO1Txe9EIPCV4yFTSpbSzsu5SQi51dCQ7ETsu0Jqo0B8sUeF9RpuVTsTo6C4Jj3C0X/DvNYo0l8iEvfqSzLmZeYgqoNMxZdnfDsE/vmRJyVK2gaJCTJPA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791526278; c=relaxed/simple;
	bh=0APGIDbZqgAhEhx/1xh5cl5Cnou/8JTI8Z3hWMNGh/E=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=T4WbIy8CwIHFYhZX/e+eCqvc9ddSlOWSwtK3n3iu76B+mGmnzWyzWSdywKJoPPBql1Me6R/hOqcT6iWC2N/nMuGkGCxlor30Ox0K34XSkaDQ2vgaow+bH3+amsZ26rCJHBa6fHCqyyL/7TdBJoW0NJuEYVRqeNakExienTQj/Ag=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.75.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RLiFs0kJV8vVQV2h1yFyO6huo1qp0XXFGuxpv+QPpul8hCTsiR2+/BbIuflTD2FTwjQPpfZoAf4g98EBFUXZsmOIQ4bOxmDNzc4o3zj1f8zdA8Vn+VCDQJJxRIC3Ejz5q//+zhytkdhlrXs/bRJ+9uEwHogPvgjnxtp5tXtFijYppioCnferJUKd6t0EppbRV4PuigxFdPgQp16Y5d3kg2PzTvkU8SzMcJpzBrG53m2HMgDgf/gsDc3QeJfSmPIuMRcQaLEXE15SbVRkjFyOOMMYxMB3P0GuAs/kei3+08NfTtjXD57lwJNZVBEUqvYM1eiHsQOYEtIsKrhJ/hrUeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0APGIDbZqgAhEhx/1xh5cl5Cnou/8JTI8Z3hWMNGh/E=;
 b=dW9CUP1kX4XZslLO01ta1oOHjlNuOWR5+ZNRYvJMQ2/UYqtotRDG0gZKt/eoAxxfuWj2PhawicoT/5EMg+nt3HdYmrt8ww1KCYhS1gXpu70fUDvSvrcW7Ntu0BRy6YaC+E8gWSgIQnnE25kmv4xMU0pultjWtSwpttuJpQEwUW/VLgvU72paIfc3tTcskXqXVfpaUsOly46kHsSA+LzOUkSC/8c3Ss9VGmmvdGhgNKdJ2tTCwYZJ1gAWu0fenT6RlAroFhE8WE1T60qDbF7yfJR6sm+uu83KzuiJrPJHabF5Hd8r/9DkOWK/uJ7pFx9foDhWzkhAd0YcoZfbEwK6TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cixtech.com; dmarc=pass action=none header.from=cixtech.com;
 dkim=pass header.d=cixtech.com; arc=none
Received: from KUYPR06MB8673.apcprd06.prod.outlook.com (2603:1096:d10:8b::5)
 by PUZPR06MB6053.apcprd06.prod.outlook.com (2603:1096:301:11a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Fri, 9 Oct
 2026 06:11:12 +0000
Received: from KUYPR06MB8673.apcprd06.prod.outlook.com
 ([fe80::2b5f:4b04:8fc6:747c]) by KUYPR06MB8673.apcprd06.prod.outlook.com
 ([fe80::2b5f:4b04:8fc6:747c%3]) with mapi id 15.21.0496.015; Fri, 9 Oct 2026
 06:11:12 +0000
From: =?utf-8?B?Sm9ha2ltICBaaGFuZyAo5byg5by65bqGKQ==?=
	<joakim.zhang@cixtech.com>
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>, "lgirdwood@gmail.com"
	<lgirdwood@gmail.com>, "broonie@kernel.org" <broonie@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>
CC: cix-kernel-upstream <cix-kernel-upstream@cixtech.com>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH v2 4/4] ASoC: cdns: Add Cadence I2S-MC controller driver
Thread-Topic: [PATCH v2 4/4] ASoC: cdns: Add Cadence I2S-MC controller driver
Thread-Index: AQHdTwtTynQaHMN8OEeOwe7DCEdxYrbx5W0AgALmM2A=
Date: Fri, 9 Oct 2026 06:11:12 +0000
Message-ID:
 <KUYPR06MB8673D9E02398846C9C48BDB982922@KUYPR06MB8673.apcprd06.prod.outlook.com>
References: <20260928053613.2158446-1-joakim.zhang@cixtech.com>
 <20260928053613.2158446-5-joakim.zhang@cixtech.com>
 <8f75db55-66b2-4b94-b0bd-ccc52f08d197@oss.qualcomm.com>
In-Reply-To: <8f75db55-66b2-4b94-b0bd-ccc52f08d197@oss.qualcomm.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cixtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KUYPR06MB8673:EE_|PUZPR06MB6053:EE_
x-ms-office365-filtering-correlation-id: 8346663e-93aa-412d-27cc-08df25cc1e8c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|10067099003|56012099006|4143699003|6133799003|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info:
 OiZI6ANPFAbBuLqP92/SDO80rDaWvQ50Eq+8awi8ZxkCoI1K+9eoBJnJO4SBDB8R0f9by1UrlYTO1RDl/p03Pr9MBkx3Fm5UOqpgCZfCSC/jMuYpsxkpmYFDH5kZr8KYt1t/64R88VeXU+LwmsyJBt5OqYMc7XxAoyk8zQR/x0JjYydBH/hLYDnjMnGW3NmIQ6dfzCsYpTaC2OGDrvEII9EZFa0afmBo2BZjrJLlbvxi0OgC0MTcohqK0yvy2kdmzDzmIE9zKD4OViFnuRZjzS7deADgs8JUxSRFqpoKMLRZfhKTz7cO3uiYgAf4fF8iyIugehioG2tYQPlKe5Ej4JWgqvWjXXmH/AOhQvF6snt2w6FqzmBhcN6FYQEcoIfGFzo2cmI9iH+UY/Fbpz4dHeeE4G37YLH3V8USRrGUZaV6W4zsOFaJ+uWHhYJQCqIPl7zoMmpcXEvsmM+yqrHIj1C14MW15A3yCYW86kNAIqm4is/lDK/7WCo8Gyp3QGHv2unqtmDUbWEEzrIF/HjKFypKCjFOZYZDc06GrghJGK6gkPrH5rfYaxGB1NOKj1F/hWP9Iy58jGcFOrqUCOUF/B5wK9Gf7rXpkOW5aJ7o/97m+Hf0uKedvo9ZKhPNYzaZJ+G9fEjokW6ci/FFU7Ul5KHtNzKMf3sW9IlOHnuHkrluWV9M8rrxeMJck4jnKnCB9EgV59jrFYEEGKVgBPU1pcWdYG5HzsSKEwLCN4hAhz8=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KUYPR06MB8673.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(10067099003)(56012099006)(4143699003)(6133799003)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?OWVJVEx6N096ekZDQVp5V2RMdGNXS1V2SEZ5NVJPZzNoMEpKODJIb21kZEpj?=
 =?utf-8?B?N1JFTjc5SHJYendraVJoUFFucGovbWFZcElDSHphY3RvR2JhTzlyV2hGVkhP?=
 =?utf-8?B?U1VyNWZwaVRVZzFpTDZnQ2F2T0VzUWU2RjhZamRpaGtoR2V2UjBDNGp0TDdt?=
 =?utf-8?B?TmRpelZRMU5ZYy9CUjR3RW9jMENBZWRZcHhZMUV6SFdadU5OTkQwK2lHeUJ2?=
 =?utf-8?B?Rlk1V3BabEF3WFdEWXIyaGp6KzcxY0l1bkRVNzNmTUQvS3psZE5kMWVoL0pV?=
 =?utf-8?B?NmJXUGRtUkRqOUpnTnNVUExPeTVRdzRocVozVEg3WjM0K2VPOU1zb0x4TjZv?=
 =?utf-8?B?ZU1odndlT21FSWZ5amNuMVJPRnNlN29wb1JEU3d2Qk1FVWRxQVZhUElUb1Jm?=
 =?utf-8?B?a0lMTTBhYkpnUEJYb05wMlcxOUpiVUg5emk5aFp5aStvbmNpRkNWL1kySlVr?=
 =?utf-8?B?R0JIWFlXQ2FRdW8rUWdMNUJvWjU3UEJMN0t1WEFzQmlyUW9tckMvTTZBY1ZM?=
 =?utf-8?B?UlVGS0M4aVNmOUNxZHl2M3ZrbmMramZ6NXIyUU5RR2NqZE95THQ0U003bzdO?=
 =?utf-8?B?aWQxV1dzdzZRZzBua0gzVEExd3o5dEkxUExFTmdyU3cwM0lpVTNvMnZJN3lF?=
 =?utf-8?B?a1hYSkkzaWxaMUtiMTFwM2JKRGlsYU5ZRFM4U0V3Ny9GSk95dTdKbFRPUlkx?=
 =?utf-8?B?aXBmM0xUTldNQnJURzhVWmZVZEZVTjk2S0NhU01PNGtEOGY0QVBsZm5LVTk3?=
 =?utf-8?B?U1dvNWxnUGVZS0VzUy90ekljNWVLSm1QN3BrUGM2ZDdkeWk3Z0RKYnpCVnhr?=
 =?utf-8?B?K0V4cHByZWRyNzc0L0JQajZOR0RteE9OWCtvUW16Vlp5S2ROSk9ZT0ZZcytZ?=
 =?utf-8?B?UEZuV05Ec0VLSm1KT25jWXVNeGZuRzhuMC9vQURlZThMbVRNdmh0dzBmWnNC?=
 =?utf-8?B?R0JsajNZY3VZcE5JNkRpSFo2ajVoRmhCemlNUnZ1SExGbzBLZm93bzNmSGZZ?=
 =?utf-8?B?NEZQaVR2bU5yR0hCYmJSVWErNUxwZ0k1WWRMeHZ5QlFJdkFPallDWlY3ZzZB?=
 =?utf-8?B?ZmthVTRtVC9qNjNUcW9kcXZYM3BNY0NjNm5lMGl3YzZ3MHRrTlZVUWE3RWd4?=
 =?utf-8?B?NnFjMnljSFRDakl3bE1VMTRGQk0xT0NRRDBxNmY0bTNnUStKTzRsUVB0M2sr?=
 =?utf-8?B?cXNpR2ZUUFlGdW9pL2VOVmRJWjVWczI4YWhIQTlqang1UXN4cHAxQ1JGRGZG?=
 =?utf-8?B?dVZiS3h0MzFiRjVBUEt6RUZ1T3ZWM3NBYVYvR0ZSQ2diNUowU2IveFdrUWEv?=
 =?utf-8?B?aFJJZnM1ZnB5MjVUbXdySEloZDArR1FQbTdpRHo5Mk9Dbm5TVENvcjdMSGZH?=
 =?utf-8?B?VkpPR2U2NVA0NDg0S2FKZThlcWEwaXd6OWhTVHNJRkZNZkdmckIyUjNqbWVq?=
 =?utf-8?B?MW82ODFuSWViMDR0NHFZcmdXU0xzU2xkVWpYZEp2UkpWdWdrckZ0T200OHYz?=
 =?utf-8?B?MC9jeElwSzd4Z3pIeTJTRG5XeEcyMnZ0bmh0K3pCYlZRZG93eGxMenVOSDNT?=
 =?utf-8?B?WVVVeXQvK2VZci9RbkkyRTBkdzRFdWZVYzUrS2xlbE41Z0dZSFQ0a1IxYzlZ?=
 =?utf-8?B?WjlVaW5WVThkWVRGbitpQVBMbWZDTUJjYXFzMXhkRVFkT3d6Qk9Idld4ck9T?=
 =?utf-8?B?cDRZN3VDSEVSc0h3bWtvclNMbzkxWG4zbUQ4Z2hhMUNweEErK01iYUdBWENJ?=
 =?utf-8?B?eXkwRFArMllsZjNsRHBXRk1qYUJqWjZka0NyVXRKKzRaOG53U2hTOGtMWE1U?=
 =?utf-8?B?OFZLTmUzRXhUOUY2WHp4c0FNSm9UN0prQlArYWNjdUs1MmQ5cE15aHozSHZC?=
 =?utf-8?B?aHg3YjVBVkt0Z1FoU3hSZFhJOGVRL3NTbElMVm9aa2VFaW8yNEdnY2dtQ2s1?=
 =?utf-8?B?SUtIdVp6NnNVOHNaVDlsU2wvVkgzSzVEMjI0YjRLa1QvVm8xbW1tbE5xU0l1?=
 =?utf-8?B?M1lQbVpnQnF6ZCtZOVhjN1M5UlFsamRyMlJ3MFM1NmJPNTBxdGZBNU5Eak5t?=
 =?utf-8?B?NDJVcjcrQ0dNc0l1bXFOZDdJaXp3U0psVm4zeE9ETW5PZ0c2Yng0aGhTcEsx?=
 =?utf-8?B?OHh2cnUxS0p4REJUWlJPN0VYRktqR21LWnpFSHE5OVRpSjdza3FtRTFsSm02?=
 =?utf-8?B?RU5wazdVYlV2am5YcFhkeFRwaVRDK2tvK2d1Q1pPV0NSZllibEVGaWJ4T2tH?=
 =?utf-8?B?UjhmMEhWV2RXb1NiNnQ4VmNQbHZwVVJFZFhEL2hGSnVkOHNGYTQ5M2pSRUtu?=
 =?utf-8?B?NThMeG9hc2hORlZTT1VxTDlTQng1bmd6QThhcDR0Z1haMll3VWorUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KUYPR06MB8673.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8346663e-93aa-412d-27cc-08df25cc1e8c
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2026 06:11:12.5878
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nyHsLzZyoYAaM81xz6RbeWZryQq0XMPipscowrekg2Jj4rGOdfNDi1oVnVrYA77yi8i8yOywhNl/NMP6g/LLut03Uq4X220E2GqdVLyGPvY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR06MB6053

DQpIZWxsbywNCg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEFqYXkg
S3VtYXIgTmFuZGFtIDxhamF5Lm5hbmRhbUBvc3MucXVhbGNvbW0uY29tPg0KPiBTZW50OiBXZWRu
ZXNkYXksIE9jdG9iZXIgNywgMjAyNiA1OjU0IFBNDQo+IFRvOiBKb2FraW0gWmhhbmcgKOW8oOW8
uuW6hikgPGpvYWtpbS56aGFuZ0BjaXh0ZWNoLmNvbT47IGxnaXJkd29vZEBnbWFpbC5jb207DQo+
IGJyb29uaWVAa2VybmVsLm9yZzsgcm9iaEBrZXJuZWwub3JnOyBrcnprK2R0QGtlcm5lbC5vcmc7
IGNvbm9yK2R0QGtlcm5lbC5vcmc7DQo+IHBlcmV4QHBlcmV4LmN6OyB0aXdhaUBzdXNlLmNvbTsg
cC56YWJlbEBwZW5ndXRyb25peC5kZQ0KPiBDYzogY2l4LWtlcm5lbC11cHN0cmVhbSA8Y2l4LWtl
cm5lbC11cHN0cmVhbUBjaXh0ZWNoLmNvbT47IGxpbnV4LQ0KPiBzb3VuZEB2Z2VyLmtlcm5lbC5v
cmc7IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwu
b3JnOw0KPiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmc7IGFqYXkubmFuZGFt
QG9zcy5xdWFsY29tbS5jb20NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MiA0LzRdIEFTb0M6IGNk
bnM6IEFkZCBDYWRlbmNlIEkyUy1NQyBjb250cm9sbGVyIGRyaXZlcg0KPiANCj4gDQo+IEVYVEVS
TkFMIEVNQUlMDQo+IA0KPiBPbiA5LzI4LzIwMjYgMTE6MDYgQU0sIGpvYWtpbS56aGFuZ0BjaXh0
ZWNoLmNvbSB3cm90ZToNCj4gPiBGcm9tOiBKb2FraW0gWmhhbmcgPGpvYWtpbS56aGFuZ0BjaXh0
ZWNoLmNvbT4NCj4gPg0KPiA+IEFkZCBzdXBwb3J0IGZvciB0aGUgQ2FkZW5jZSBJMlMtTUMgbXVs
dGktY2hhbm5lbCBjb250cm9sbGVyIGZvdW5kIGluDQo+ID4gdGhlIENJWCBTS1kxIGF1ZGlvIHN1
YnN5c3RlbS4NCj4gPg0KPiA+IFRoZSBjb250cm9sbGVyIG1vdmVzIHVwIHRvIDE2IGNoYW5uZWxz
IHRocm91Z2ggYSBjb25maWd1cmFibGUgc2V0IG9mDQo+ID4gaXRzIDggZGF0YSBwaW5zLCBlYWNo
IHBpbiBjYXJyeWluZyB0d28gc2xvdHMuIFdpcmVkLW91dCBwaW5zIG1heSBzaXQNCj4gPiBhdCBh
bnkgcGluIGluZGV4IGFuZCBhcmUgZGVzY3JpYmVkIGJ5IGNpeCxwaW4tb3V0LW51bSwgY2l4LHBp
bi1yeC1tYXNrDQo+ID4gYW5kIGNpeCxwaW4tdHgtbWFzay4gVGhlIGRyaXZlciBleHBvc2VzIGEg
dHJhbnNtaXQgREFJIGFuZCBhIHJlY2VpdmUNCj4gPiBEQUkgd2hpY2ggY2FuIGFjdCBhcyBjbG9j
ayBwcm92aWRlciBvciBjb25zdW1lciBpbmRlcGVuZGVudGx5LCBhbmQNCj4gPiBzdHJlYW1zIHdp
dGggZmV3ZXIgY2hhbm5lbHMgdGhhbiB0aGUgd2lyZWQgcGlucyBuYXJyb3cgdGhlIGVuYWJsZWQg
cGluDQo+ID4gbWFzayBhdCBydW50aW1lLg0KPiA+DQo+ID4gVGhlIGRyaXZlciByZWdpc3RlcnMg
dGhlIGRtYWVuZ2luZSBQQ00gaGVscGVyLCBzZWxlY3RzIHRoZSBhdWRpbw0KPiA+IHJlZmVyZW5j
ZSBjbG9jayBwYXJlbnQgZm9yIHRoZSA4IGtIeiBvciAxMS4wMjUga0h6IHNhbXBsZSByYXRlIGZh
bWlseQ0KPiA+IGFuZCBrZWVwcyB0aGUgbWluaW11bSBmdW5jdGlvbmFsLWNsb2NrIHRvIGJpdC1j
bG9jayByYXRpbyByZXF1aXJlZCBmb3INCj4gPiBzYWZlIGNsb2NrIGRvbWFpbiBjcm9zc2luZywg
d2l0aCBhbiBleHRyYSBtYXJnaW4gY3ljbGUgd2hlbiB0aGUgYml0DQo+ID4gY2xvY2sgaXMgc291
cmNlZCBleHRlcm5hbGx5LiBSdW50aW1lIGFuZCBzeXN0ZW0gc3VzcGVuZC9yZXN1bWUgcmVzdG9y
ZQ0KPiA+IHRoZSByZWdpc3RlcnMgdGhyb3VnaCB0aGUgcmVnY2FjaGUuDQo+ID4NCj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBKb2FraW0gWmhhbmcgPGpvYWtpbS56aGFuZ0BjaXh0ZWNoLmNvbT4NCj4gPiAt
LS0NCj4gDQo+ID4gK3N0YXRpYyB2b2lkIGNkbnNfaTJzX21jX3J4dHhfY29uZmlnKHN0cnVjdCBj
ZG5zX2kyc19tY19wcml2ICppMnNfbWNfcHJpdiwgYm9vbA0KPiBvbiwNCj4gPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgdTggcGluX21hc2ssIHUzMiBzdHJvYmUsIHUzMg0KPiA+
ICtzeW5jX3JzdCkgew0KPiA+ICsgICAgIHUzMiBpcnFfbWFzayA9IDAsIGNsa19tYXNrID0gMCwg
aTJzX21hc2sgPSAwOw0KPiA+ICsNCj4gPiArICAgICBpcnFfbWFzayB8PSBGSUVMRF9QUkVQKEky
U19DSURfQ1RSTF9JMlNfTUFTSywgcGluX21hc2spOw0KPiA+ICsNCj4gPiArICAgICBjbGtfbWFz
ayB8PSBGSUVMRF9QUkVQKEkyU19DSURfQ1RSTF9JMlNfU1RST0JFLCBwaW5fbWFzaykgfA0KPiA+
ICsgc3Ryb2JlOw0KPiA+ICsNCj4gPiArICAgICBpMnNfbWFzayB8PSBGSUVMRF9QUkVQKEkyU19D
VFJMX0kyU19FTiwgcGluX21hc2spOw0KPiA+ICsNCj4gDQo+IFRoaXMgcGF0Y2ggaGFzIHRoZSBz
YW1lIGJ1aWxkIGlzc3VlIGFzIHRoZSBTQyBkcml2ZXIgcGF0Y2g6DQo+IGNkbnMtaTJzLW1jLmMg
dXNlcyBGSUVMRF9QUkVQKCkgYnV0IGRvZXMgbm90IGluY2x1ZGUgPGxpbnV4L2JpdGZpZWxkLmg+
Lg0KDQpUaGFua3MsIHdpbGwgdXBkYXRlIGluIHYzLg0KDQo+IHJldCA9IGRldm1fc25kX2RtYWVu
Z2luZV9wY21fcmVnaXN0ZXIoJnBkZXYtPmRldiwgTlVMTCwgMCk7DQo+ID4gKyAgICAgaWYgKHJl
dCkNCj4gPiArICAgICAgICAgICAgIHJldHVybiBkZXZfZXJyX3Byb2JlKCZwZGV2LT5kZXYsIHJl
dCwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJGYWlsZWQgdG8gcmVn
aXN0ZXIgZG1hZW5naW5lDQo+ID4gKyBjb21wb25lbnRcbiIpOw0KPiA+ICsNCj4gPiArICAgICBw
bV9ydW50aW1lX2dldF9ub3Jlc3VtZSgmcGRldi0+ZGV2KTsNCj4gPiArICAgICBwbV9ydW50aW1l
X3NldF9hY3RpdmUoJnBkZXYtPmRldik7DQo+ID4gKyAgICAgcmV0ID0gZGV2bV9wbV9ydW50aW1l
X2VuYWJsZSgmcGRldi0+ZGV2KTsNCj4gPiArICAgICBpZiAocmV0KQ0KPiA+ICsgICAgICAgICAg
ICAgcmV0dXJuIGRldl9lcnJfcHJvYmUoJnBkZXYtPmRldiwgcmV0LCAiRmFpbGVkIHRvIGVuYWJs
ZQ0KPiA+ICsgcnVudGltZSBQTVxuIik7DQo+ID4gKw0KPiA+ICsgICAgIHJldCA9IGNkbnNfaTJz
X21jX2Nsa3NfZW5hYmxlKGkyc19tY19wcml2KTsNCj4gPiArICAgICBpZiAocmV0KSB7DQo+ID4g
KyAgICAgICAgICAgICBkZXZfZXJyX3Byb2JlKCZwZGV2LT5kZXYsIHJldCwgIkZhaWxlZCB0byBl
bmFibGUgY2xvY2tzXG4iKTsNCj4gPiArICAgICAgICAgICAgIHBtX3J1bnRpbWVfcHV0X25vaWRs
ZSgmcGRldi0+ZGV2KTsNCj4gPiArICAgICAgICAgICAgIHJldHVybiByZXQ7DQo+ID4gKyAgICAg
fQ0KPiA+ICsNCj4gPiArICAgICBjZG5zX2kyc19tY19yc3QoaTJzX21jX3ByaXYpOw0KPiA+ICsN
Cj4gPiArICAgICBpcnEgPSBwbGF0Zm9ybV9nZXRfaXJxKHBkZXYsIDApOw0KPiA+ICsgICAgIGlm
IChpcnEgPCAwKQ0KPiA+ICsgICAgICAgICAgICAgcmV0dXJuIGlycTsNCj4gPiArICAgICBpMnNf
bWNfcHJpdi0+aXJxID0gaXJxOw0KPiA+ICsNCj4gPiArICAgICByZXQgPSBkZXZtX3JlcXVlc3Rf
aXJxKCZwZGV2LT5kZXYsIGlycSwgY2Ruc19pMnNfbWNfaXNyLCAwLA0KPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgZGV2X25hbWUoJnBkZXYtPmRldiksIGkyc19tY19wcml2KTsNCj4g
PiArICAgICBpZiAocmV0KSB7DQo+ID4gKyAgICAgICAgICAgICBkZXZfZXJyKCZwZGV2LT5kZXYs
ICJGYWlsZWQgdG8gcmVxdWVzdCBpcnE6ICVkXG4iLCByZXQpOw0KPiA+ICsgICAgICAgICAgICAg
cG1fcnVudGltZV9wdXRfbm9pZGxlKCZwZGV2LT5kZXYpOw0KPiA+ICsgICAgICAgICAgICAgcmV0
dXJuIHJldDsNCj4gPiArICAgICB9DQo+IA0KPiBBZnRlciBjZG5zX2kyc19tY19jbGtzX2VuYWJs
ZSgpIHN1Y2NlZWRzLCB0aGUgcGxhdGZvcm1fZ2V0X2lycSgpIGZhaWx1cmUgcGF0aA0KPiByZXR1
cm5zIGRpcmVjdGx5IHdpdGhvdXQgZGlzYWJsaW5nIHRoZSBjbG9ja3Mgb3IgZHJvcHBpbmcgdGhl
IHJ1bnRpbWUgUE0gdXNhZ2UNCj4gY291bnQuIFRoZSBkZXZtX3JlcXVlc3RfaXJxKCkgZmFpbHVy
ZSBwYXRoIGFsc28gY2FsbHMgcG1fcnVudGltZV9wdXRfbm9pZGxlKCksIGJ1dA0KPiB0aGF0IHdp
bGwgbm90IHJ1biB0aGUgcnVudGltZSBzdXNwZW5kIGNhbGxiYWNrLCBzbyB0aGUgY2xvY2tzIGVu
YWJsZWQgIG1hbnVhbGx5DQo+IGFib3ZlIHJlbWFpbiBwcmVwYXJlZC9lbmFibGVkLg0KDQpUaGFu
a3MsIHdpbGwgdXBkYXRlIGluIHYzLg0KDQpKb2FraW0NCg==
