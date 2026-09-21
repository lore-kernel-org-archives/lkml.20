Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011069.outbound.protection.outlook.com [40.107.74.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D68334BEE48;
	Mon, 21 Sep 2026 15:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790005547; cv=fail; b=a8JUhycaDDFR1eout0zpcYvmRh7h2KQBAgOuhfukeB30HeuPdsaspzZ5dZYSNq85FRKb/ECmXUfmyT3Xx81SQcITo/r78OurH04x9syW7xrnf1DiNsNrRUL1FdaNRH7AGgV5cM2KW8D89zvEvZVNIbx7+mkmTq8za4HDbzuEVuE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790005547; c=relaxed/simple;
	bh=nmElttly6xOGWx0qhLkZ8+4MinizuC7RxEFS21iiQ0U=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=eOkuaWDj6ZziVkvYpiFM3AjuBVtq04nVgOhe3V6qK2e53KVxzg6Twt6fzKBb/0NGcHMhXPaj8Fm5H5OibwC/EbpxHhN0CuJdH+7Bri3kVV3+Pz397lXVzxQ/XQWzEv29+9EquQU5Wak9mENmYLRb01y8I5IvaKGyR7xTtii2GjY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=LPIVppqu; arc=fail smtp.client-ip=40.107.74.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="LPIVppqu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wXPnb4v4wvPCVg1il3hB9ONUwUlUT3h6UJElw4riUo3ny8GDVIxIVHASpLe5xrh40QEsrhD9trk8vd2TFar5kDo8CN9RIoYw/qdoVxPuuaPeSV/nB9pwapQ2xoEKDuMYpZU0Ol99ZyGUs/xX0UyDQm0in3Hw8YRprH0lnq+eb26+r8w9Wq+AD5k68LuMmHNVlGKMugLXgkSGplF4I2Yg4/TK4oMR9nDqBmN2SEnfkCPFXtDs2k8nM3gqVUtVEcOe/LQD3rz63AWZ6PpboGQeW0wWj5DGCnRMdW29j1xnUxhu6es5jHg6zcKXDlirTaNwup+hXoONNbRJ0Tt4Ibx4xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nmElttly6xOGWx0qhLkZ8+4MinizuC7RxEFS21iiQ0U=;
 b=pgltzOCtaX2xrpZv6Rf80KsU5C0A6C4LyCUh8NecH8lNPA9s5fUaTXbp8kUX5AHA5sbTg6zraiBhZjBoDzyC5xSBQEMTBMp9+xOQtTdhuB2+tNMkiZslIu5axKNWGIGjpFUZ1/eizSTCzcr2XgoptOBzA04Y0wHBl0axpzN/93n2BctWXlFxfTLNYG1AR6egljVb2WwaxtprcW8VYKGqFECf0YrAKskE7PAUnAZTMIpTrmDgjojc5ACS+6b/jahJDXtYtD2d9m+Wnc9zvp2+/H5VshczDdLQtvc/swEKd8Qt+f3lHDwRcCkHu8F1Axi1FXFI2WeWHax3y69rCvzxHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nmElttly6xOGWx0qhLkZ8+4MinizuC7RxEFS21iiQ0U=;
 b=LPIVppqumqbF7TMXA0iBNPywrEe+8c2AMzXPhutzq5s7Mu0px7g6rdl0nh5HXeiHaAYciENIG4WsFZ58ZLGkuvcfK2P9aVD84naF5Eo07jLhh9r+gFfByWsCnOIkGGwTKgMckmz4zeFxQ0d1Yg3lOWx+xq/FO7AbBNNIkdKFhGQ=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYWPR01MB10392.jpnprd01.prod.outlook.com (2603:1096:400:249::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.15; Mon, 21 Sep
 2026 15:45:38 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%6]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 15:45:38 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: geert <geert@linux-m68k.org>, Tommaso Merciai
	<tommaso.merciai.xr@bp.renesas.com>
CC: Tommaso Merciai <tomm.merciai@gmail.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"magnus.damm" <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Bartosz
 Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Philipp Zabel
	<p.zabel@pengutronix.de>
Subject: RE: [PATCH v3 0/4] Add USB2.0 support for RZ/G3E
Thread-Topic: [PATCH v3 0/4] Add USB2.0 support for RZ/G3E
Thread-Index: AQHdQDj2/url2/0Fs0qsytlnxFWAvrbY3q2AgAArHgCAADKzUA==
Date: Mon, 21 Sep 2026 15:45:38 +0000
Message-ID:
 <TY3PR01MB113463A5E1C3BB382E623E0A386842@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <cover.1788943229.git.tommaso.merciai.xr@bp.renesas.com>
 <arD_c9iP63WLOI1b@tom-desktop>
 <CAMuHMdV7mgJ74fLHnqG=nryjWMaoYqeOq0BNAbA_XqoH9P8ntw@mail.gmail.com>
In-Reply-To:
 <CAMuHMdV7mgJ74fLHnqG=nryjWMaoYqeOq0BNAbA_XqoH9P8ntw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYWPR01MB10392:EE_
x-ms-office365-filtering-correlation-id: 864884f1-fee0-4cfc-3db2-08df17f76276
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|23010399003|376014|7416014|366016|38070700021|10067099003|56012099006|11063799006|4143699003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 NWb0fAssWFuJUNOg4n676dnL5Avi5h6xTylEfEDqQmFYkf8/pXvGVJgAHw1AmC2+bFlyOFTaL6DEWKmBoMYvVHFIih6iVlN+5YBwf5eIuE5JfpWE+V4/ajgattEIBSf13vJvmnVYbSnn/Bh3lPTsiF+CnLqLZl8/TB1uquWVcje4dJY7pmk2kO6a1TtYY2gYknvCAvevxatngYeZz0sBrXvTsksrHlK52cx+lriKxFAhhsZUTU5E9acHpGQ1eZTReoy6B9V7RinKP2vvY0fpqbDH+f/Y7gB0IFHB1MSboMbMfo6egcIxYgc1rmNlc9HqCW/+Y3gGAZG54CyaQjFE7o8A7CJ19s2hr8JcDFWts6ZitivzSMPLcuNSWEF4xPn5T9UkPQYWIJcKbLUfPXrFEEHscQjOwhc6hBn/VtGG5lH1B2lVGGlfPQY/t1//Bs3w5Y0zPGJbn+BO0eCsc+1hmInh/hSo/CXTBKNrPri9Eq+tfcy3kOG8sC42Iay2M+dpl1zEXs2iu7Eh+aqMej50JqVpM3DKuCuL+nrNAy8YATyxCPrm8Y+cs6ghip7Q/xjwG8YGXWqBiA6xRV6mhiF+SSJ75B1LxV7XdyHYbk/WEKvkxeJwS3W6mT4MsLvn6DfAEqiT6K3yE++kF/U+GWPYTSycyuM5r2HyxkQVCvCK6B6Z4BmdzdgKSzKvUhdp9lba
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(7416014)(366016)(38070700021)(10067099003)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NzRkbGJIMmNKeEhPaVdSNmYrUlNOdlBPVGUydklXNDU2S2JlcjBwTjcrcFp2?=
 =?utf-8?B?elp6Y1FCSlRDZTdaK2swSHFsY2NSQkN2dHoyOXphSWRvNFZSandnQy9ieU1M?=
 =?utf-8?B?RWVYcTd1U0xmYkdxS1hEbU05NFhxdGRCUm9iRU5yTHN0bnJ5aG01NDlmeFl2?=
 =?utf-8?B?a0Fab0Npd0JEZjhhT1RvWmFGL01mc0lsSjJaVnNUOWcwc25oejVGS2xrdDBI?=
 =?utf-8?B?VVYzcXkzd216dG9XendmMDhxSGJRY3BUSnh2YkRSa1gvSUs0bjJ1SVRLOERn?=
 =?utf-8?B?SXNldit6U3dvdGNBM0hIYUM3dlhXMXFsd0dVRHhEKzErbHlFd2Q1d3cvdnZh?=
 =?utf-8?B?NXpMYU40cHpoNjN6K09uWlMxTkFGTGF4SUN0bUZFajF6S1RZK2c5VkROelNx?=
 =?utf-8?B?enVIeW9kOTZEVFBLellqZmNLNExtSWpVS1E5N1BkUTdxbGt0WW12MGlTVU5Y?=
 =?utf-8?B?T1crZkNSYU9zWnBmTFVibEdjTHJIdXpETlNyTUI2L0NxOE12bDBBMmZzamtr?=
 =?utf-8?B?bW5icENGWDhwMVNhRjEvR1piRjVGWGJSeGxCYnlIcW9wYVJrYitiRlNlejRy?=
 =?utf-8?B?d1pBQ1lQekEzaHJGYWEvRjI4RTQwWXM4UU44b3FFN3hNcER4QmRhc0tTeFZ0?=
 =?utf-8?B?WVNOYUJTWFdqN2UzZ3dzRjl5azhBM2xJQnJWTFFJSFF3THl0dmhGeDUvcnM2?=
 =?utf-8?B?bXk2M1g1V3RqZHVZQnlHeFRHZUhneUVHRmxrVTc1Q3h1MWlwbUJiSXZ0MUpq?=
 =?utf-8?B?VzBSai9oUm1DSmRvM1A0Nm1YVU9qK0o4TURHM3k2YTRHaFJYdWZLU3AvZ3VL?=
 =?utf-8?B?bHVKRlQxWVUzN2RTd25ML0tnS1FLWll4b29SQlQ3dE9FdUNMbEd2SEExSmV3?=
 =?utf-8?B?TktsMWRrSjBtekszZlN3QnFLK01vMEloVGJyaUh3RVFsZkpzSUYwbXpSTFN4?=
 =?utf-8?B?MmwrY1gxOGJTc0NHTmN0Tm84Q01KeDNLejBkQjBOU0Q4RU85VTRpOGUzQTVV?=
 =?utf-8?B?V0xaa21WWHFqdVp0QU9venFDNDNhTGkzRFRFdGMwWjVra1EzU2ZrM0ZpdnJI?=
 =?utf-8?B?aGRuZ2gxOUo4eGNpVENtbnN0elFHY0E4ZkhPdGFHRUFBUnBBYmV5K2NScmd3?=
 =?utf-8?B?U05aYzZKMUhKM01tKzRLbXVJeldiUWk0OU1LRkE1eFh0R0xDSVhDdUYxL0Zs?=
 =?utf-8?B?d2NjOE1Cd0t0cTlGUFJmNXJybjZBamsvbHJXa3dyR0dZbzdnODlWUHZ2bk5r?=
 =?utf-8?B?eXpoZVBjL2ZjaXc1YktMZ3RVay9rVXhtdVQzQjM4UUFwY1JFTmFQdjZsMFJZ?=
 =?utf-8?B?UE95UGdVNENRYVVvNjBtb0dhcG1wbmQ0QnZGU1pIWG5kaDdYQUVkOUtjQ0I3?=
 =?utf-8?B?R00xK3d0bytqdGJRbUlCMm81blljYmttVTlwMGIrVXUvclU4ZlBLcTVVak5u?=
 =?utf-8?B?a0tSZzlXV2prcWJkdHh1UHRLME1WWjlRclE4VUVMRkdlUElQYnFRT2FXRTNn?=
 =?utf-8?B?cFZiZDVjV00wK2FBU2FlRVd3UERMVjdDWmZ0YTM2T2lLTW1vQmc5N0xkMWNJ?=
 =?utf-8?B?S3dRN1Rmd0dzZ1hITjllWkVhV2NEckNCb0lwYnJjNXZkT2hBNFAzc2ZlTlFl?=
 =?utf-8?B?dGova28rRVp3RzUvZ0UzQm9TZnZxVjR2R3N0THdQQ1lUZ3E4ZE1OVXVOOGky?=
 =?utf-8?B?MmJFQnRza2RUd29hVENCVTFDV2dIb1JqWGU2MnY0NFFrZk41WUpic3NteDAx?=
 =?utf-8?B?TUlCSlYzVzNCc1g2OUJqM3BpMy9nN3U0R3JtOHI0TjBNZE9BdzV3OHVNZDVl?=
 =?utf-8?B?cERKMllLc1pkZk4yTmxUTUd4b3Z4Ynk1RXdaTk94VXpIdUhia1dHK1gvMU5r?=
 =?utf-8?B?NjdneE5ucTFhRUpEMEJWNkJiUGovRWEyOFYzZ3pyUUJkbXozTjNwVlBUUDln?=
 =?utf-8?B?QzMrekpBb2VBdU1CcmZVS3FEVEVEZmZCZU1ucG1ZNnFGVnU1RC9NWGJhTTNW?=
 =?utf-8?B?MklMOGZ6M1Y5Y29ZclFCN2xEUVNHeksrZUhCMndUOGZvY1Z2dW9tcFJIVUEv?=
 =?utf-8?B?cUhpcWVSK0JLbG8ySmJ2THlNM2g2WlFVSGtEQWFROUdZN2o1UllxRlJvY3BY?=
 =?utf-8?B?emVrUGx4N3F3dGg1TUIyblNHWXE2Z0hFNGdSYXdYSjN6cjQ0WUZXTFltMlho?=
 =?utf-8?B?OXk0UlI3NWtKemcybHlLSzRDQ0VxM3B0Yk5CWVI3ZU1vZEVBUkJVcDhvRGtv?=
 =?utf-8?B?SUJXL0dlWGhGbWdocVB5SVl2U0d2Y3hLUndQcXhjaHFobmVka1VOQi9nU1B2?=
 =?utf-8?B?Yjg4cHZkR29yY2ZSc0ErUXprTFpyZGFHUVY2VkxCQTJ6RW1oVlhXdz09?=
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
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 864884f1-fee0-4cfc-3db2-08df17f76276
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Sep 2026 15:45:38.5609
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KbnDxhSlJkU9vbldpZuXYxEokU5TrErJ0Oqhs2+peqTk8ACQj2VGCUyNYEU68CZJfe1iUaPK6PoXcErT88NHJtYRycItmIus+vcuqgBV6AQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10392

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IDIxIFNlcHRlbWJlciAyMDI2IDEzOjMxDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggdjMgMC80XSBBZGQgVVNCMi4wIHN1cHBvcnQgZm9yIFJaL0czRQ0KPiANCj4gSGkgVG9t
bWFzbywNCj4gDQo+IE9uIE1vbiwgMjEgU2VwdCAyMDI2IGF0IDExOjU3LCBUb21tYXNvIE1lcmNp
YWkgPHRvbW1hc28ubWVyY2lhaS54ckBicC5yZW5lc2FzLmNvbT4gd3JvdGU6DQo+ID4gT24gV2Vk
LCBTZXAgMDksIDIwMjYgYXQgMTA6NTQ6NTdBTSArMDIwMCwgVG9tbWFzbyBNZXJjaWFpIHdyb3Rl
Og0KPiA+ID4gVGhpcyBwYXRjaCBzZXJpZXMgYWRkcyBVU0IyLjAgc3VwcG9ydCBmb3IgdGhlIFJl
bmVzYXMgUjlBMDlHMDQ3IFNvQw0KPiA+ID4gYW5kIGVuYWJsZXMgaXQgb24gdGhlIFJaL0czRSBT
TUFSSyBJSSBib2FyZC4NCj4gPiA+DQo+ID4gPiBLaW5kIHJlZ2FyZHMsDQo+ID4gPiBUb21tYXNv
DQo+ID4gPg0KPiA+ID4gdjItPnYzOg0KPiA+ID4gIC0gTm8gY2hhbmdlcyBqdXN0IHJlYmFzZWQg
b24gdG9wIG9mIG5leHQtMjAyNjA5MDguDQo+ID4gPg0KPiA+ID4gdjEtPnYyOg0KPiA+ID4gIC0g
SW5jbHVkZWQgUEFUQ0ggdjcgNy85IGFuZCBQQVRDSCB2NyA2LzkgZnJvbQ0KPiA+ID4gICAgdjc6
DQo+ID4gPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNjA4MTIxNDE5NDAuMjQ2MjIz
LTEtYmlqdS5kYXMuanpAYnAucg0KPiA+ID4gZW5lc2FzLmNvbS8NCj4gPiA+ICAtIERyb3AgcGxh
Y2Vob2xkZXIgcGF0Y2gNCj4gPiA+ICAtIFBBVENIIDQvNDogRGlzYWJsZWQgUlovRzNMIGNvbW1v
biBub2RlcyBmcm9tIHI5YTA4ZzA0Nmw0OC1zbWFyYy5kdHMuDQo+ID4gPiAgICBVcGRhdGUgY29t
bWl0IGJvZHksIGFuZCBpbXByb3ZlZCB1c2IyMF9waW5zLCB1c2IyMV9waW5zIGNvbW1lbnRzLg0K
PiA+ID4NCj4gPiA+IEJpanUgRGFzICgyKToNCj4gPiA+ICAgYXJtNjQ6IGR0czogcmVuZXNhczog
cjlhMDhnMDQ2OiBBZGQgVVNCMi4wIGhvc3QvcGh5IGRldmljZSBub2Rlcw0KPiA+ID4gICBhcm02
NDogZHRzOiByZW5lc2FzOiByOWEwOGcwNDY6IEFkZCBVU0IyLjAgZnVuY3Rpb24gZGV2aWNlIG5v
ZGVzDQo+ID4gPg0KPiA+ID4gVG9tbWFzbyBNZXJjaWFpICgyKToNCj4gPiA+ICAgYXJtNjQ6IGR0
czogcmVuZXNhczogcjlhMDlnMDQ3OiBBZGQgVVNCMi4wIHN1cHBvcnQNCj4gPiA+ICAgYXJtNjQ6
IGR0czogcmVuZXNhczogcjlhMDlnMDQ3ZTU3LXNtYXJjOiBFbmFibGUgVVNCMi4wIHN1cHBvcnQN
Cj4gPg0KPiA+IFJaL0czTCBVU0IyLjAgYmluZGluZyBwYXRjaCBpcyBub3QgcXVldWVkLg0KPiA+
IFNoYWxsIEkgc2VuZCBhIG5ldyB2ZXJzaW9uIHdpdGhvdXQgUlovRzNMIHBhdGNoZXMgaWUsIHVz
aW5nIHBsYWNlaG9sZGVycyBbMV0gPw0KPiANCj4gVGhhdCBtaWdodCBiZSBhIGdvb2QgaWRlYSwg
dG8gdW5ibG9jayBtYWlubGluaW5nIG9mIFJaL0czRSBVU0IuDQo+IA0KPiBIb3dldmVyLCBpdCBs
b29rcyBsaWtlIHRoZSBvbmx5IG1pc3NpbmcgcGllY2UgaXMgRFQgYmluZGluZ3MgZm9yICJyZW5l
c2FzLHI5YTA4ZzA0Ni11c2JwaHktY3RybCI/IEhvdw0KPiBjb21lIHdlIGVuZGVkIHVwIHdpdGgg
YSBkcml2ZXIgaW4gbGludXgtbmV4dCB3aXRob3V0IGJpbmRpbmdzPw0KDQpVU0IgcGh5IGN0cmwg
QmluZGluZyArIGRyaXZlciBwYXRjaGVzWzFdIGFyZSBzdGlsbCBub3QgcXVldWVkLg0KQnV0IGRz
aSBiaW5kaW5nIHBhdGNoIGlzIHF1ZXVlZCB3aXRob3V0IHRoZSBkcml2ZXIgY2hhbmdlWzJdDQoN
ClsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNjA4MjgxMzM1MDkuMjc2MjgxLTEt
YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20vDQpbMl0gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9w
dWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0L2NvbW1pdC8/aWQ9YTQz
NzdjNzcyMmI4MjRkM2QyZWI5NDBlYjY4MWNmMzdiMDk2OWEyNA0KDQpDaGVlcnMsDQpCaWp1DQoN
Cg0KDQo=
