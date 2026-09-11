Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11012005.outbound.protection.outlook.com [40.107.75.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CAC53128AB;
	Fri, 11 Sep 2026 14:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789138173; cv=fail; b=RwgOe2Bu9BdHC6mSWsC50Mg8DSBSRE5NlDDxQFbUpdlJd0AZxHEMCcp7dGA2iCvG9/zcMTWJzE6X4xGVW1Mijy1Oc/B1o01Gb30QBpUpPtG4oHquGRTtOl4JQM+vQykIDcZLKfaQbXkdJL7zNDyyUUfAIEXje24MFCJKpuQ59P0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789138173; c=relaxed/simple;
	bh=wvEuW0Qh4eFo/Tv2gW6bWSAK8LP7jU9G9c0WpWS0WkQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=PsYk+jSII01RBo2vFS1FBLX3aVrNxZ11o6uwwqFEypXTCFduKmEdIMnDYR/9pbxFCf73Ik+b/4uM6bKKC/aDsPoiOJvEHoTscvi7fDC4rGArdqsyHUAWKxu0rp1SHVSRcTuQyCpOWpO8kGirwUpnxPsgZbb3ycKvK77MfKtIdm8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=D2099GXX; arc=fail smtp.client-ip=40.107.75.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="D2099GXX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ebLLuCZdZMDAwGmebv7cL6dU7hnOV+z8NpGEF7a5v9aSoVlqa/xPZE5AvQh4XoGalckM1sysSVewwOC/5FmgvpQtPOuToRZ++U0iSDa8FoqaiSbW0OG0kSfba5U3QL8FpkudpfyXtGp1LgbVKyqV2VqfcUQS1KvM90gkGhDTMja/U975pSCr4sIU0xDptdzFxxFl0q+XnMrNK3DLrNCBd5SO1oz5qK/qgM93f5n0EUA4F5oi2u+84UdFeAcScxjPytgKXNQ3AJFriBoOEh/cubflSgEf9v4+6ExRejCADoInwbSOTBfj+36THjWwRWjNpdibXs0693XCeYue7j5vYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wvEuW0Qh4eFo/Tv2gW6bWSAK8LP7jU9G9c0WpWS0WkQ=;
 b=LQEu1n97XpPDhGIB4Tf+2SERUa1XdPW9Qdc3Dyttr6Mby9QAMpyGHduaPZXmm3MC3uecKtt5KVNxz64kyRnfJOLaW/uAfJiFmI/DMJvC6Wgf0l2NZo7RFAj3NibuoqbY7zp91u5CIUUkhVyeRr001q6J/wO3UTmoYVglXXRPRVH3ruaaDkx83wwR2d0pKhzNQU5p0XpDlx3N5SzIp/EfSTDuNO5+Mq+KdQ60tBGJjhLf8xHNlKxGNTnAi5PkNhAZLm9wVOIqm1ObuPjLGWYjgum/OYMF+nFE/mAa8i7EjmJC2OFN7YpLQHpMdZrr8PgxzUfGLmzA4wmVGIxs3vLNcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wvEuW0Qh4eFo/Tv2gW6bWSAK8LP7jU9G9c0WpWS0WkQ=;
 b=D2099GXXqkFwcL5Cmz5MLQ/01Il1sfmU/hxthpDPzWCVNFILGj8OMx5UsdttDsBrW/QBkL8ksuRVH2TSzd3vgDP2O1mZjvc5V5EO5DLUtM5ZSJUreWi04wIzPvwD6sbYhfG2kYvtdBzP4n/+jqgh6WTkJ1h54I04fSOr7isJcrBe5xqThNJU6k87DGRKtmmJWlq0iZwcqWYSFzPPV37JIycBeSVbikRuRo/LCwR7EklDzRD4fNkd06F7J8tcixoHZm4Y0QJWKgL5adlcIsDSmhCS7MpVAzqLOVx3VCBvR3i4Y17pUwZURqHG/MjWI6wvDxujsVzQCZrw9onucTwKTA==
Received: from TYUPR06MB6217.apcprd06.prod.outlook.com (2603:1096:400:358::7)
 by KUYPR06MB8819.apcprd06.prod.outlook.com (2603:1096:d10:9b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.10; Fri, 11 Sep
 2026 14:49:25 +0000
Received: from TYUPR06MB6217.apcprd06.prod.outlook.com
 ([fe80::8d51:58c7:42f3:ecc]) by TYUPR06MB6217.apcprd06.prod.outlook.com
 ([fe80::8d51:58c7:42f3:ecc%4]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 14:49:24 +0000
From: =?utf-8?B?6IOh6L+e5Yuk?= <hulianqin@vivo.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>, Selvarasu Ganesan
	<selvarasu.g@samsung.com>, Mathias Nyman <mathias.nyman@intel.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, "quic_wcheng@quicinc.com"
	<quic_wcheng@quicinc.com>, "broonie@kernel.org" <broonie@kernel.org>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"cpgs@samsung.com" <cpgs@samsung.com>, "alim.akhtar@samsung.com"
	<alim.akhtar@samsung.com>, "thiagu.r@samsung.com" <thiagu.r@samsung.com>
Subject:
 =?utf-8?B?562U5aSNOiDnrZTlpI06IOetlOWkjTogW1BBVENIXSB4aGNpOiBzaWRlYmFu?=
 =?utf-8?B?ZDogY2hlY2sgdmRldiBsaXZlbmVzcyBiZWZvcmUgcmVtb3ZpbmcgZW5kcG9p?=
 =?utf-8?Q?nts_on_unregister?=
Thread-Topic:
 =?utf-8?B?562U5aSNOiDnrZTlpI06IFtQQVRDSF0geGhjaTogc2lkZWJhbmQ6IGNoZWNr?=
 =?utf-8?B?IHZkZXYgbGl2ZW5lc3MgYmVmb3JlIHJlbW92aW5nIGVuZHBvaW50cyBvbiB1?=
 =?utf-8?Q?nregister?=
Thread-Index:
 Ad0+w4oMZm1fwJscQ667Nk1fUgpsewCQ/ySAAANZkAAAAgLyIAAjvHUAAAPMeRAAA5IDAAAJXeYAAAJF1sA=
Date: Fri, 11 Sep 2026 14:49:24 +0000
Message-ID:
 <TYUPR06MB6217E43E57DE49DA53C5E2EAD2BE2@TYUPR06MB6217.apcprd06.prod.outlook.com>
References:
 <TYUPR06MB6217000B59003EDF233D7246D2B22@TYUPR06MB6217.apcprd06.prod.outlook.com>
 <CGME20260910101324epcas5p1faf6f82de85c9468f42f6f9b2f13e99b@epcas5p1.samsung.com>
 <c17e0351-d390-4a40-89c4-51d4be9f0123@linux.intel.com>
 <360067785.01789039502721.JavaMail.epsvc@epcpadp1new>
 <TYUPR06MB62172308C897F81F7DAFF557D2BF2@TYUPR06MB6217.apcprd06.prod.outlook.com>
 <750468423.101789103583573.JavaMail.epsvc@epcpadp2new>
 <TYUPR06MB6217F0788C14DD89D237C807D2BE2@TYUPR06MB6217.apcprd06.prod.outlook.com>
 <937773018.41789116303608.JavaMail.epsvc@epcpadp1new>
 <191ee5d5-d93d-4fa3-9654-b3735d344118@linux.intel.com>
In-Reply-To: <191ee5d5-d93d-4fa3-9654-b3735d344118@linux.intel.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYUPR06MB6217:EE_|KUYPR06MB8819:EE_
x-ms-office365-filtering-correlation-id: d7bc7add-e6bc-4bc3-ba13-08df1013df5d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|42112799006|366016|1800799024|376014|7416014|38070700021|4143699003|6133799003|10067099003|56012099006|11063799006|22082099003|18002099003;
x-microsoft-antispam-message-info:
 4qCvQcQ0jUd+m03P4gASlt+UwwW5L2CMx90R1UpxQ2DMts5eWkHXUlsF2QOyk+LjK6faOgnE+o6uHVZXQ1IGSgNg1kDkDkMcfrDZLK9szBbVRVzNFx5c3ql2zGo2YIMOYZ931CUWqR+OJj0+vO40veESkhT0cL1f9HAhwy3wNhQ8hHr5w4SKg8dmVrZu9YxM3SrAtjb6s/5YCeaOOeRbxJ+Bqqip5F0AY8OketltVqTEaZSaQUlIDLb+qM38t2qP86crknfomFzIoue0c7tfNcCt9DMAFbw61pSHNXHx4BtaI7pbiPYtLwgJQH1Xa/jmHY7GiR8zIbyNd7yvU7ZRHAykkt/x5T9SJ3/5r+lRQ7byBO0wBtAnrBwYEuhDYO85NTHj3fqSDME4t4dpJVRhjuKzwJPOsohPE3ch5VzoqKhcJnh8H7e+aAVwtG/cJmrNj8RMr9c4cbF2/T7OU9J+DC0LEaG1GD4pN4YCFLddMDnDCpWrH2KaQ0OCVoZGUGcg3XYmtBjctzd72MbvrZ2JJtn7e5IO+pOZLTlXBH1y4eEi5Zy5LWkOYmACMMIJMoElmeuaAqMVk1bqjGSF1UAlEwzcagAaTVbRdn6LZ0hbM1GSLk7OIfPTHeGO0Hfms9hLGh6Xw07o/wX8hhIlPLg0UIpdRoJq4rZ24+H2piM5bmvW18dY3YwVan7f//eOzvFvubLGHTTpT80s1iYmwXTDq95S1DXYcT/kBTA2HDB+Tmc=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYUPR06MB6217.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(42112799006)(366016)(1800799024)(376014)(7416014)(38070700021)(4143699003)(6133799003)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Vmp3V0dFeFlGdWFtOGwrSWtIVjErY2VjRnZ4NDhqNk1CK2xhNVNWOVE3ZlA5?=
 =?utf-8?B?NldKL2E5a3h3VEtqVWYveklTRmdqSVJFTWdsdmFUWEZ0VUpucUtKK1liMHM5?=
 =?utf-8?B?TWVRR3l5VHFWR2gvcmVIbVJJM203ZmxQYktjTXE1V0FFRzRrcjVuWGhuZUQ2?=
 =?utf-8?B?TVN6WThnNTcvU1BiSkRoYjlGNUZPWGVUQThlN2xpcWQzbWFENXJsZUxSRlNO?=
 =?utf-8?B?SnlXdDBLMmRTU0dIS3c2a3JmdUh5Qy9ZU0M3RTVadWVhd284NmNKTlRuUU5D?=
 =?utf-8?B?NWM2MGpMR08vUldUSHlXMnF4VTQvaFlncFUxSDVPcHFVZ3dUMEZ6ajMyeTJW?=
 =?utf-8?B?VlJ2WjlPNkdsdW5QOWpFTi9tQ0ZtdCtlUXA4bG52U0lTZHpUNzJWQU91RjBC?=
 =?utf-8?B?T1crbXp6NzBCNWZnbGRZR1RCSG5WUWpzd2N6RldSQmI1WEhMN1N3cnc5ZEZP?=
 =?utf-8?B?VDluayt1azkwQytRa3d6R2hFcHFIRG9RL1Z3SVdzdXN6WXJHU1h6MnhBT253?=
 =?utf-8?B?bEJhVk5qbTdDbXpPd2xBb0E5OS8yQmJwT0t2cEs4cUhKTnhQZmJuaCtzRHcr?=
 =?utf-8?B?ckFaL0dHYjBJNXJPakNKUDd6ZS96MVVYdG92L3FudnlsdGxuWnVDQ1FacGVz?=
 =?utf-8?B?emw0aHd4U0JyVW5UNGtsd04zdFQrSWRLMXJmK01sZUpFRTBoTnVzb0NOb01n?=
 =?utf-8?B?VnhJRTJGVGJyMG81azNMdUFnNER4ZWVCNjIvNlo5VFFHaEtoc0U0SFkvNzVJ?=
 =?utf-8?B?US9uVFcxMzM4Snk2NUhJbUxxY210R1RkaVJPOTFGS2RVUVVDVGxISkNhSC80?=
 =?utf-8?B?bStTcC85WHRsRTRNY0w1WVNzL0VuSzRCVTlZTVRlbVI5QUlaSVlJdXZNNzU2?=
 =?utf-8?B?d1pKankzdXpHRmlNVEwxTGJ1T2JWenpUYWdwN2pEeWVNNnhSYmJ1RkVIb0dP?=
 =?utf-8?B?MmQ3NUY3UTM4UlgwOUkzRHFOODRPeWdxVmJxNGhqYmRvWG1MdUhZTWROK3BN?=
 =?utf-8?B?b2JhcWllOGtsS3laL2ZxZTdWR2dJV3NWbGhyT29iSVh3bWFBVHY4ZjRKNTJq?=
 =?utf-8?B?TjVFaWxMWnM0T1pJV2FvQmcvNy9yWnB0TTlDM3QrZkZYMk9PeWdrazZCdVVF?=
 =?utf-8?B?OGpFREZEZVBZTSs0OTh6Zlh4ay91OFQ2c2hxV3ZWZ3p3MDJxdnpUbktldzBo?=
 =?utf-8?B?N2UwM3orZEVmS0VFZkdmTFhXeWhxUmh2ZXBzNmU2bjh4LzBYYzMwVks3aENM?=
 =?utf-8?B?WTZ4OGt5dkhtWXJVSDlGb1MzY1hWckVoaDNZVnJDZHpHU3VOcHYrajdPSU5Q?=
 =?utf-8?B?VzlKelZjd3JMTnhDYkRrTFBWWWNHdzlpY3U1VmkyZkpvTnZuclNsSUR6djJj?=
 =?utf-8?B?N28vKzE1N3BLOENQMXdaeGRrb1M1WkRONm1Wb01KYnR0K2NxSWV1dTcxZXJa?=
 =?utf-8?B?dWlqeTUwTnh4UVBMSXUyTWRkS1I0TlZNN2x6K2w1T0tQeVBNalIrQmpNazBX?=
 =?utf-8?B?R280OGF4MTRPakxlZTFCV1cycktSQTgwVTBpUDBFQWhjZUNqZWdVeUVHbWpt?=
 =?utf-8?B?L0RyQWdHL1hFL3IrbC9KRUpJcnhadm5CSXlNVnJkV09taEZVMXJnS0IzZ0ZF?=
 =?utf-8?B?VEZmTG1tWTZ5dzlFcTdmR0k5NFNrbTNFdHhoWHNYbGNEamovNWZLYXhVbUR0?=
 =?utf-8?B?eDFDMStSek5sd0pWRit3am9mckF0K0tZK05UbmlheldmQTBxTFY3S1UwSWhL?=
 =?utf-8?B?bk9lejFNRVIwcUc1Z1RQM1dESGM2TisweUg1SDRid1hPYkVuRmVnTTN1UUhT?=
 =?utf-8?B?TnlRb2xKMlY4Wk9QckJUckFXMkRoWjVvKzJETkNralNMVk1tY1J6RnJNK0pk?=
 =?utf-8?B?d0J6MlRJbk1kUk0zUGpBcHZ2MEw4UnJZR3ZZbFAvTEVvS0c1V0xVN2hYNzVQ?=
 =?utf-8?B?YVZUUkcvdUNraU1UVEZTSXdIRS96UHdZK04yam9SMXlBMzU4Z1BjQTBuT3k1?=
 =?utf-8?B?ck1oVVJEb01PRjBRRDRGOFFTamd3NFdRK0NWTHUwbTNRMXZBQjFweGI3bFN0?=
 =?utf-8?B?OUtncnB2b1Awb1V4aHVjTWJYbm5kQnVIVXh3UDdKdmx1ejByWTEzRGE2bWI4?=
 =?utf-8?B?TVBDZk9BSGtkVjBncGNKU1VZL2lEQUt6WUxIYm9iTHFkZk9GbVlnU1dPSUNH?=
 =?utf-8?B?cTdHVkdwRUFtN2hqYmlYSWdlZFZYWmRBUVF4THBQbGJtem1LdlRmY09YOTM1?=
 =?utf-8?Q?pqQhVnL85kjdPYVLUKtX3tumxs3dTzqRVh7EIsM5Xo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYUPR06MB6217.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7bc7add-e6bc-4bc3-ba13-08df1013df5d
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2026 14:49:24.6656
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JHB+npobrZU3JwJDcD9dS87d3RjFPv5jV736Q/F3SQ5SfRZ4bkawBc2z2fNtUwqcf3iaP5ML8L9+UOQiYAdLcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUYPR06MB8819

SGkgTWF0aGlhcywNCg0KPiA+Pj4+ICsJCWlmICh2ZGV2KSB7DQo+ID4+Pj4gKwkJCWZvciAoaSA9
IDA7IGkgPCBFUF9DVFhfUEVSX0RFVjsgaSsrKQ0KPiA+Pj4+ICsJCQkJaWYgKHNiLT5lcHNbaV0p
DQo+ID4+Pj4gKwkJCQkJX194aGNpX3NpZGViYW5kX3JlbW92ZV9lbmRwb2ludChzYiwgc2ItPmVw
c1tpXSk7DQo+ID4+PiBJIGhhdmUgb25lIHF1ZXJ5IG9uwqAgc2tpcCBlbmRwb2ludCBjbGVhbnVw
IGR1ZSB0b8KgIHZkZXYgaXMgTlVMTCwgaW4gdGhpcw0KPiA+Pj4gY2FzZSB0aGUgcG9pbnRlcnMg
aW4gc2ItPmVwcyBhcmUgbm90IGNsZWFyZWQuIFNpbmNlIHRoZXNlIHBvaW50ZXJzIHBvaW50DQo+
ID4+PiBpbnRvIHRoZSB2aXJ0dWFsIGRldmljZSBlcHMsIGFueSBzdWJzZXF1ZW50IGNhbGwgdG8g
c2lkZWJhbmQgQVBJDQo+ID4+PiBmdW5jdGlvbnMgbGlrZSB4aGNpX3NpZGViYW5kX2dldF9lbmRw
b2ludF9idWZmZXIoKSB0aGF0IGRlcmVmZXJlbmNlDQo+ID4+PiBzYi0+ZXBzIGNvdWxkIHJlc3Vs
dCBpbiBhIHVzZSBhZnRlciBmcmVlIGlmIHRoZSB2aXJ0dWFsIGRldmljZSBoYXMgYmVlbg0KPiA+
Pj4gZnJlZWQuIElzIGl0IHBvc3NpYmxlPw0KPiANCj4gR29vZCBwb2ludCwgZW5kcG9pbnQgdXNl
IGFmdGVyIGZyZWUgaXMgYSBtdWNoIGJpZ2dlciBhbmQgZWFybGllciBpc3N1ZSBoZXJlLg0KPiAN
Cj4gVGhlIGVuZHBvaW50IHJpbmdzIHRoYXQgYXVkaW8gZHJpdmVyIGlzIGFjY2Vzc2luZyB2aWEg
c2lkZWJhbmQgYXJlIGZyZWVkIGFuZA0KPiByZWFsbG9jYXRlZCBtdWNoIGVhcmxpZXIuIEF1ZGlv
IGRyaXZlciBpcyB1bmF3YXJlIG9mIHRoaXMgcmVzZXQsIGFuZCBtYXkgc3RpbGwNCj4gdHJ5IHRv
IGFjY2VzcyB0aGUgZnJlZWQgcmluZyBidWZmZXJzLg0KPiBUaGlzIGlzIGFuIGlzc3VlIGxvbmcg
YmVmb3JlIHhoY2lfc2lkZWJhbmRfdW5yZWdpc3RlcigpIGlzIGNhbGxlZC4NCj4gDQo+IHVzYl9y
ZXNldF9hbmRfdmVyaWZ5X2RldmljZSgpDQo+ICAgIGh1Yl9wb3J0X2luaXQoKSAgLy8gcmVzZXRz
IHBvcnQNCj4gICAgdXNiX2hjZF9hbGxvY19iYW5kd2lkdGgodWRldiwgdWRldi0+YWN0Y29uZmln
LCBOVUxMLCBOVUxMKTsNCj4gICAgICBoY2QtPmRyaXZlci0+ZHJvcF9lbmRwb2ludCgpICAvLyBm
b3IgYWxsIGVuZHBvaW50cywgeGhjaSB0YWdzIGVwIHRvIGJlIGRyb3BwZWQNCj4gICAgICBoY2Qt
PmRyaXZlci0+YWRkX2VuZHBvaW50KCkgICAvLyBmb3IgYWN0aXZlIGVuZHBvaW50cy4geGhjaSBh
bGxvY3MgbmV3IHJpbmcgZm9yIGVwDQo+ICAgICAgaGNkLT5kcml2ZXItPmNoZWNrX2JhbmR3aWR0
aChoY2QsIHVkZXYpIC8vIHhoY2kgZnJlZXMgb2xkIHJpbmcgYW5kIHRha2VzIG5ldyByaW5nIGlu
dG8gdXNlDQo+IA0KPiBTbyB0dXJucyBvdXQgc2V0dGluZyB2ZGV2LT5zaWRlYmFuZC0+dmRldiB0
byBOVUxMIGluIHhoY2lfZnJlZV92aXJ0X2RldigpLCBhbmQNCj4gcmVhY3RpbmcgdG8gaXQgaW4g
eGhjaV9zaWRlYmFuZF91bnJlZ2lzdGVyKCkgaXMgdG9vIGxpdHRsZSB0b28gbGF0ZS4NCj4gDQo+
IEkgdGhpbmsgd2VlIG5lZWQgdG8gbG9vayBhdCB1c2luZyBkcnYtPnByZV9yZXNldCBhbmQgZHJ2
LT5wb3N0X3Jlc2V0DQo+IHRvIHVucmVnaXN0ZXIgYW5kIHJlLXJlZ2lzdGVyIHNpZGViYW5kLCBv
ciBvcHRpb25hbGx5IHRvIHVuYmluZCBhbmQgcmViaW5kDQo+IHRoZSB3aG9sZSBpbnRlcmZhY2Uu
DQo+IA0KDQpUaGFua3MgZm9yIHRoZSBkZXRhaWxlZCBhbmFseXNpcy4gWW91J3JlIGFic29sdXRl
bHkgcmlnaHQgLSB0aGUgdjINCnBhdGNoIGlzICJ0b28gbGl0dGxlIHRvbyBsYXRlIi4NCg0KSSB2
ZXJpZmllZCB0aGF0IHRoZSBVU0IgYXVkaW8gZHJpdmVyIChzb3VuZC91c2IvKSBkb2VzIE5PVCBp
bXBsZW1lbnQNCnByZV9yZXNldC9wb3N0X3Jlc2V0IGNhbGxiYWNrcy4gU28gZHVyaW5nIHVzYl9y
ZXNldF9kZXZpY2UoKSwgdGhlDQpVU0IgY29yZSB3aWxsIHVuYmluZCBhbmQgcmViaW5kIHRoZSBl
bnRpcmUgaW50ZXJmYWNlIChodWIuYyBsaW5lDQo2NDExLTY0MTcpOg0KDQogICAgaWYgKGRydi0+
cHJlX3Jlc2V0ICYmIGRydi0+cG9zdF9yZXNldCkNCiAgICAgICAgdW5iaW5kID0gKGRydi0+cHJl
X3Jlc2V0KShjaW50Zik7DQogICAgZWxzZSBpZiAoY2ludGYtPmNvbmRpdGlvbiA9PSBVU0JfSU5U
RVJGQUNFX0JPVU5EKQ0KICAgICAgICB1bmJpbmQgPSAxOyAgICAgICAgICAgICAgICAgICAgLy8g
PC0tIGF1ZGlvIGRyaXZlciBoaXRzIHRoaXMgcGF0aA0KICAgIGlmICh1bmJpbmQpDQogICAgICAg
IHVzYl9mb3JjZWRfdW5iaW5kX2ludGYoY2ludGYpOw0KDQpUaGlzIG1lYW5zIHRoZSBhdWRpbyBk
cml2ZXIncyBkaXNjb25uZWN0KCkgc2hvdWxkIGJlIGNhbGxlZCBiZWZvcmUNCnRoZSByZXNldCBo
YXBwZW5zLCB3aGljaCBzaG91bGQgdHJpZ2dlciB4aGNpX3NpZGViYW5kX3VucmVnaXN0ZXIoKQ0K
YmVmb3JlIHRoZSByaW5ncyBhcmUgZnJlZWQuDQoNCkJ1dCB0aGUgY3Jhc2ggdHJhY2Ugc2hvd3Mg
eGhjaV9zaWRlYmFuZF91bnJlZ2lzdGVyKCkgaXMgY2FsbGVkIGZyb20NCnVhdWRpb19kaXNjb25u
ZWN0KCkgQUZURVIgdGhlIGRldmljZSBoYXMgYWxyZWFkeSBiZWVuIGZyZWVkLiBUaGlzDQpzdWdn
ZXN0cyB0aGUgZGlzY29ubmVjdCgpIC0+IHhoY2lfc2lkZWJhbmRfdW5yZWdpc3RlcigpIHBhdGgg
aXMgbm90DQpjb21wbGV0aW5nIGJlZm9yZSB4aGNpIGZyZWVzIHRoZSB2ZGV2Lg0KDQpMb29raW5n
IGF0IHRoZSBjcmFzaCB0cmFjZSBhZ2FpbjoNCg0KICBodWJfZXZlbnQoKQ0KICAgIHhoY2lfc2V0
dXBfZGV2aWNlKCkgICAgICAgICAgICAgICAgICA8LS0gQ09NUF9VU0JfVFJBTlNBQ1RJT05fRVJS
T1INCiAgICB4aGNpX2Rpc2FibGVfYW5kX2ZyZWVfc2xvdCgpICAgICAgICAgIDwtLSBmcmVlcyB2
ZGV2IGhlcmUNCiAgICAgIHhoY2lfZnJlZV92aXJ0X2RldmljZSgpDQogICAgLi4uDQogICAgdXNi
X2Rpc2Nvbm5lY3QoKSAgICAgICAgICAgICAgICAgICAgICA8LS0gZGlzY29ubmVjdCBoYXBwZW5z
IEFGVEVSDQogICAgICB1YXVkaW9fZGlzY29ubmVjdCgpDQogICAgICAgIHhoY2lfc2lkZWJhbmRf
dW5yZWdpc3RlcigpICAgICAgICA8LS0gQ1JBU0ggKHZkZXYgYWxyZWFkeSBmcmVlZCkNCg0KVGhl
IGlzc3VlIGlzIHRoYXQgeGhjaV9zZXR1cF9kZXZpY2UoKSBmYWlsdXJlIHRyaWdnZXJzDQp4aGNp
X2Rpc2FibGVfYW5kX2ZyZWVfc2xvdCgpIGRpcmVjdGx5LCB3aGljaCBmcmVlcyB2ZGV2IGJlZm9y
ZQ0KdXNiX2Rpc2Nvbm5lY3QoKSBoYXMgYSBjaGFuY2UgdG8gY2FsbCB0aGUgZHJpdmVyJ3MgZGlz
Y29ubmVjdCgpLg0KDQpTbyB0aGUgcmVhbCBxdWVzdGlvbiBpczogc2hvdWxkIHhoY2lfc2V0dXBf
ZGV2aWNlKCkgZmFpbHVyZSBwYXRoDQpkZWZlciB0aGUgdmRldiBmcmVlIHVudGlsIGFmdGVyIHVz
Yl9kaXNjb25uZWN0KCkgaGFzIGNsZWFuZWQgdXANCnRoZSBzaWRlYmFuZD8NCg0KT3Igc2hvdWxk
IHdlIGVuc3VyZSB0aGF0IHdoZW4gYSBzaWRlYmFuZCBjbGllbnQgcmVnaXN0ZXJzLCB0aGUNCmF1
ZGlvIGRyaXZlcidzIGRpc2Nvbm5lY3QoKSBwcm9wZXJseSBjYWxscyB4aGNpX3NpZGViYW5kX3Vu
cmVnaXN0ZXIoKQ0KYmVmb3JlIHJldHVybmluZywgc28gdGhhdCB0aGUgc2lkZWJhbmQgaXMgYWx3
YXlzIGNsZWFuZWQgdXAgYmVmb3JlDQp4aGNpIGZyZWVzIHZkZXY/DQoNCkkgYWdyZWUgdGhhdCBk
cnYtPnByZV9yZXNldC9wb3N0X3Jlc2V0IGlzIHRoZSBjbGVhbiBzb2x1dGlvbiBmb3INCnRoZSB1
c2JfcmVzZXRfZGV2aWNlKCkgcGF0aCwgYnV0IHRoZSBjcmFzaCBoYXBwZW5zIGluIHRoZQ0KeGhj
aV9zZXR1cF9kZXZpY2UoKSBmYWlsdXJlIHBhdGggd2hpY2ggZG9lc24ndCBnbyB0aHJvdWdoDQpw
cmVfcmVzZXQvcG9zdF9yZXNldC4NCg0KV291bGQgeW91IGxpa2UgbWUgdG86DQoNCjEuIEtlZXAg
djIgYXMgYSBkZWZlbnNpdmUgZml4IChwcmV2ZW50cyBjcmFzaCksIGFuZCB3b3JrIG9uIGENCiAg
IHNlcGFyYXRlIHBhdGNoIHRvIGFkZCBwcmVfcmVzZXQvcG9zdF9yZXNldCB0byB0aGUgYXVkaW8g
ZHJpdmVyDQogICBmb3IgdGhlIHJlc2V0IHBhdGg/DQoNCjIuIE9yIGZvY3VzIG9uIGZpeGluZyB0
aGUgeGhjaV9zZXR1cF9kZXZpY2UoKSBmYWlsdXJlIHBhdGggdG8NCiAgIGVuc3VyZSBzaWRlYmFu
ZCBpcyBjbGVhbmVkIHVwIGJlZm9yZSB2ZGV2IGlzIGZyZWVkPw0KDQpUaGFua3MsDQpMaWFucWlu
DQoNCg==
