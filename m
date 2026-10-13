Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010004.outbound.protection.outlook.com [40.93.198.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DABA03F485E
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 12:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791895796; cv=fail; b=QHQ2f06eoLYqXCjVE7M5WGVgWZH/TIspYtqQRqYjRPZGDLeQhgzfFKZAFLUQ+KLWL9vbmR/apTvs9Ai0MF24jEM2U8cTDplHS9V8fMn3sKiPYj3BIvI9taGkNUHxHfk3Rthc5xwigGOvoHTAp3GDAEeueXVqGYhDYSL9I1wKF0o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791895796; c=relaxed/simple;
	bh=ph3bWvXtpnkUBJY9wNUBNe2+pwINJf65258BPY2kBAY=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=PHuD0pl7PE06AU47nAM20/pnSE7Bg79uZkI7gIJFIldKteozvGe6B2AfDhDuu9oNPxa9KrN6murRi/H/ssebLa0Oe/FNn4FQAnO85e8o0oz05DoFc/gXET+BGugbRNtlvP5X+tNf/nd8gPrqhIJVuEQ8Gumk6gazqZxVKJrBQZs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=sl4ZaRj9; arc=fail smtp.client-ip=40.93.198.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="sl4ZaRj9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ipbAyaPYSx4ozI5TMahMJ49ACcrQ7cfyk4ozPZ8DryOuauM7+8xnYG+BMp1p6ObtcBD4c+fvOCQOqQ0Zp9k7BJACJb7s9SHA8u/19uPgiKNyl+rg+iElL2uiqlH1bFCZYdk1pLUS3jX5t2/csDQisKinpblqUCwy2oNYby8fZEJKSe3rAL1d0OIMOc0jPmRE6C2OsU+yGF2xAhvI9B0u0CCto5njuY7yAFNiI9y2bF9RCSCVMb7rnly6TXiflQ11EaixZfEtZtNGTnuCeoBgetdlaJbgm+1EPpfBp5eRlP93y89H6jdhRD/RCpIlA1LeHx35uPTguwbCNbuY75qGVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ph3bWvXtpnkUBJY9wNUBNe2+pwINJf65258BPY2kBAY=;
 b=XZAQ2XKeD2J7Hq8X9SplSEFswOMFYOFI4OsxIfTKar2QXdG9PJ5ru/dz4dshyZpk2cqeAx/VGcuECVs+qbBB77FgbSYyddy+Ojzhu89V9c3UHCK/6mUgamaYskAiAmk/9zv5sGtOORjEGwOs4jmeMS5evK7XZ/2B4JW9qMvt1xa1N82Jg74PvUG61tWgKsuHowu3iG95Z2A1ZjRX+EmxTrBbck7+yqCRt/pC0bUooyysRLKrDd9CWqp3x4C9a1GzKGmWIWyd9hDQIQCVJWCH4+05FosoMwnKAjPOhbmD3euMd+4EdSGFQc6tzxuC07Q7sFDKAxK2Dr7GIZqa+udqTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ph3bWvXtpnkUBJY9wNUBNe2+pwINJf65258BPY2kBAY=;
 b=sl4ZaRj9B6XodgZuFUugYsxEkPUrV0X5Kr4mnCKqRClzvQC/R6dtuAXP/EAtJu4adDYYIpIY7oJPkBSC3EkgrMLuPjmtsfw7fEK4GDyomLeaU80k4kxhhQafgMd4SnsoUlEVZlaoF3pLt75KT64BULzJC6xhsmxLaHu301rTaOrT1HmgdcFkrcLpbOHAL2WPMnYAhcOh0oLvm5Tm9cTV7j2b3LRFwKKHnaA/AFP+SNrQ9JCLDrvIAeyc2aPejomJ9uSDCVdjlZRVfdRxkLhxk+GkMWfA4iXdNgdynORx/UivUxRBFByB6NtdaJzhck0W11W8Al/P8TWhnysxNjqZFw==
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 CH8PR12MB9838.namprd12.prod.outlook.com (2603:10b6:610:270::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.23; Tue, 13 Oct 2026 12:49:50 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%6]) with mapi id 15.21.0496.021; Tue, 13 Oct 2026
 12:49:50 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: K Prateek Nayak <kprateek.nayak@amd.com>
CC: Peter Zijlstra <peterz@infradead.org>, Vincent Guittot
	<vincent.guittot@linaro.org>, "paulmck@kernel.org" <paulmck@kernel.org>, Ingo
 Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>, Dietmar
 Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, Valentin
 Schneider <vschneid@redhat.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "kernel-team@meta.com" <kernel-team@meta.com>
Subject: Re: [BUG] Apparent lost wakeups
Thread-Topic: [BUG] Apparent lost wakeups
Thread-Index: AQHdWxFVuCmGiG5d8kyaYOSNqrU5Qg==
Date: Tue, 13 Oct 2026 12:49:50 +0000
Message-ID: <41BA40C2-AC25-4339-8607-4A45BD4ED87C@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR12MB6486:EE_|CH8PR12MB9838:EE_
x-ms-office365-filtering-correlation-id: 4b95e3cb-2d5d-462c-d645-08df2928783a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|7416014|1800799024|376014|366016|10067099003|18002099003|38070700021|11063799006|56012099006;
x-microsoft-antispam-message-info:
 S7zja2U2l4B6FXBxd0ODAWqCL8DPGBOwDOvKJMUY0jIhReWKPLIPGby4Mlq4ucjbENBVKqn5MBB3KcZlV22z9YQJT5jyWjnTCxGcitcJjCi66/5d23Ah2CSNModHT6MuyTbXGhIE01p3KdggJkvRtGI29CLCaOJ4hLz7rC3NOLu6lA/HmEpCgTDkds1owkmMMjsHZnQz7/bF2jNb9zsvZvBgSyjsnJGHVK2SOCiOs3rmVcOPBaX2bEPxQ/RCyosfYudDJp7RUQrTTFWiJeUQPUaVDBNFrlEEcm3euLY5K6abKlEq1Y57G+4aysjzTa/LGLyKdMosMwLqvHkdamNfEAJsQObe/cmRipaB/9KRhRcCrKFt78oi5fpj4uTK+nGon1MuX+kV3XEBLvEC1y1rOISuWhnKvroI0XHn6+GgvPBlqk/8RfocUTmgwFRo5jGD9WpjJTJ7yd2KKVPKRZlE67nvC5C7FLigSzSxXbfZcY32NzqJI4gGs6jQh21jHU+PP1mNbyw8ZuVcSk7mPSKAmL736DbMMCP5rxtS7nx0wrUankRrLryF3nJYosbir/6EKsR6Na+rlTXhp6KUT4TczyDlu7+U8Fbf6tApR5HEPRpHY8a1FVYZDn/YbOh5IrkF9Fpb63WTV7yXySHXpJlgJRSsUa1KX4MI9YxSq2Ch6NorP+XUGEH3ylBcs2uKQ2Wm+COgmQwcBraE1JmxZQBNsw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(1800799024)(376014)(366016)(10067099003)(18002099003)(38070700021)(11063799006)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TzVqQ01uamV3NWpZRExKZTFsN3pncXJhVFNoeCtpMEFTVUFNcktTV0Z2UzlO?=
 =?utf-8?B?ZGVWK21UcjlPK0dxR2pDYlRVdVNVbkNqdUdVV0tiNFpIU1JjUm5LZXJqRGZ0?=
 =?utf-8?B?QzZMMkwzazBPcFVXNmhWalpBR3ZON2lxYnhsbGdxNzJCZ2RvbkJhOHpsOGlw?=
 =?utf-8?B?WU10R2VESm5DVXZYUmZEOEtBYXZ0VHEzZ29VNFlJV2JzS2YvTXlISG5SdU5P?=
 =?utf-8?B?LzNMWHl5aFk5MW54aXZjTDN5emxOTDUvTEt1MmxlRmxqbTZrYUdDWU5scWJa?=
 =?utf-8?B?NmpQZlhJVlBkYnZOb3BNeHU3UmczZklXb0IwTFk2N210US81dTZPK0E0d0Fn?=
 =?utf-8?B?bUg5Z0Qwd0tDYVpDVnc2cVg3TkVBalNmRlR0QWxSYk5hb2xMRkpuVk1DdWtS?=
 =?utf-8?B?eHhRendpcWcyc2pVY0tubkNlWUUxT21kamplcWJpQ1kwa05GRnpKVDRxaWxp?=
 =?utf-8?B?VGJETkhGb2xjbXVMcGxvdTRGZ092bVhVUjZNWGpsdS9Za3lZYlFNMmVaUE9U?=
 =?utf-8?B?RjBpejlDcWFFaGFscHMyUUlkVnZ4NzVpRllYTU9ycFRabFlnNSs0K1AzbUo2?=
 =?utf-8?B?a1hHdHg2S2srK1IvYkNiZGVWc0EwUithdTBPbjdRbGh2cEdPbXVxVEMxVmxx?=
 =?utf-8?B?L2pNdWFyOGF5bkdyeFZNNnlIVFVObENuUjJ6aGV6aGhuSWNEeUNrRGhmWW5i?=
 =?utf-8?B?eU0yNlJ1aytDTWptbUdTMngzQ1dTL2lVV1JIRGN1ZTBta1ovVHRWSmdxR3pQ?=
 =?utf-8?B?eUdTYmgrS3M2NWVEd3BxVVVicnFaSVJHUDBKOHBiVk5ENlRibGJsajlCRWd4?=
 =?utf-8?B?eHdQV0UremR6eHQ4TTFEOVhpTnpsUGhvcG44R0FxRStQb0Z6cUNQeTlIVHlF?=
 =?utf-8?B?dHhtbFlESWNCMStYeGdMb1ArSHVsS1JPeVNqbmNrY21TMDhWSW5oUGhqZDEz?=
 =?utf-8?B?bmtMbm9GczZQaHFHNUJkT3FjRFIxNGZzVUdSSmlkTHdFUTgrUnc4a2pqSmEx?=
 =?utf-8?B?eHhBaEtJd1Z1M0NGY0J3RE9EQTFPNCtYR25IYWpVUGZCci84M2RmbUVsQTlQ?=
 =?utf-8?B?K2VtRE1FMzZyZ0RJaFVoVFREYjBWZ0pVZWhqTnFXbE5JMXRMWFByWW9NK2pW?=
 =?utf-8?B?TjlPNURONGdrVnVRS0M5QkE1V2kzbmh6Z3VvNmMrRHJmTFRvV05DcTFkSU0y?=
 =?utf-8?B?TmZLT21zRFRNdVRhcmdhZlBTdFI2WnJvWThFZmRJbU95RU1ZazgwekJrWjAz?=
 =?utf-8?B?VUtDZjVMbElsNlpVMUgvZ1JXQndrUVh5UnoyZ1JUQzNKVUFrRkdreEMyVWRW?=
 =?utf-8?B?QUt5MFBLb3RRRGdib0FhaFNQTm5OQkNnQmhuaFU2Tm1BRlVqNlZQd2F4VDM5?=
 =?utf-8?B?Rno3M3lnSUdINENvTEFwSlhNa0hIemF6OFoxb0hWQ3JOSVR3aXhtc0psNmRD?=
 =?utf-8?B?RjhTcTRRdTgyVGk0MTJwa1F0NDEzWVU5VkhrakRZc0FPcmVsTFhYbEd5Y0xE?=
 =?utf-8?B?UWtlWk03TDlNeWphM3VveU9PZ3RHdWl5Vmt6TS8yd0ptdWl0MzZVc3UrbVNm?=
 =?utf-8?B?Q0djbUV4Q2tqQTJPK1NsY3hEQ25QcEZrYVRWYjV3cUpFRmJtb1E4Ni9DRDI0?=
 =?utf-8?B?Yk03NmM0a0ZVUzhzcko1THFFb3pnRm50bEYwaWpLMXJBZVFYUzBDTkxQcklB?=
 =?utf-8?B?SXc1aEUyQTNzRVdQVEM1NU93MnJ0aGpHc1NveEdkWmtyTndkNkFUNFZZUmYw?=
 =?utf-8?B?aDlMTHRhdngwMjd3UE16bGc4YkRIVzV5K29BS200dlM4Tyt2RVpuclJqN3Qw?=
 =?utf-8?B?bTNFcmlpdnd4SEorZmhjZmRNSlNVWGNLM0lmMVBQajFkMDJRUmptT2RORm5p?=
 =?utf-8?B?WThLdlNuSlg4SFdUVGVGQmM0TFVGZWszdXRKSWpsbEtscmJabjJLd293VVRN?=
 =?utf-8?B?bHViaklwS1FSRmdHMnBUdUdHM0ZvOHozcVN6ZnBqT0R4eitXMGpBTlk0a3Bx?=
 =?utf-8?B?Z1hwcEd2S1d0VWJSZUJOZkxIME9qMFRuRzAzZ0tMTEFVd1BYNHR3WTVLVnhW?=
 =?utf-8?B?NEdLZHJDZGFjU21LUGk1SGNkN0QyWkVVbGpqOUJ0S3pNQ0VQckVkSjNESjRO?=
 =?utf-8?B?THRSOXl6Nk9tU291S2dxUFRMZU1hUlp4R3JxUkE4dFlQdVAzUTRQQ2g2ZDZN?=
 =?utf-8?B?U1k4M29hZUlZUUdKUURWWGR1WFp3VS9OcnhBbFJrcnFJaE5Ob3dqWWJ1OW8v?=
 =?utf-8?B?N1pPYi9XTFZJeXpFazl2S1BDNmx6VjhrWUd6N0pSRWREV0RMaUR3L1VOUnVB?=
 =?utf-8?B?Vk5KMFZJdmlkb0FnSjdhQ2ticEcwNjBsL2krb3ptY09lVTg1dHFrdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AC6CF048811A8740A702B889A3D93BAF@NVIDIA.onmicrosoft.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b95e3cb-2d5d-462c-d645-08df2928783a
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2026 12:49:50.2281
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kXVNHXamvmie0Jrf9yX+3fqLRBGoGu+1BEt03ndAEdmNAOLgFhrjF5WU2Y5GAF+dEley2VRqBed1hkOtKv+syg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR12MB9838

DQoNCj4gT24gT2N0IDEzLCAyMDI2LCBhdCA2OjQ04oCvQU0sIEsgUHJhdGVlayBOYXlhayA8a3By
YXRlZWsubmF5YWtAYW1kLmNvbT4gd3JvdGU6DQo+IA0KPiDvu79PbiAxMC8xMy8yMDI2IDQ6MDcg
UE0sIFBldGVyIFppamxzdHJhIHdyb3RlOg0KPj4gQ2FuIHlvdSB0dXJuIGFsbCB0aGlzIGludG8g
YSBuaWNlIHBhdGNoIC0tIHlvdSd2ZSBkb25lIGFsbCB0aGUgaGFyZCB3b3JrDQo+PiBvbiBpdCBh
bnl3YXkuDQo+IA0KPiBTdXJlISBJJ2xsIHJ1biBUUkVFMDEgZm9yIHNhbml0eSBvbiBteSBlbmQg
YW5kIHNlbmQgdGhlIHBhdGNoIG91dA0KPiBsYXRlciBpbiB0aGUgZXZlbmluZy4gU2hvdWxkIGdp
dmUgUGF1bCBzb21lIHRpbWUgdG8gdGVzdCBhbmQgY29uZmlybQ0KPiB0aGF0IHdlIGFyZSBzZWVp
bmcgdGhlIHNhbWUgaXNzdWUgOi0pDQoNClNvIGNvb2wgUHJhdGVlayBhbmQgUGV0ZXIgZm9yIGZp
Z3VyaW5nIHRoaXMgb3V0LiBLdWRvcyENCg0KUXVpY2sgcXVlc3Rpb24gLSB3aXRoIHRoYXQgZml4
LCBpcyB0aGVyZSBhIHBvc3NpYmlsaXR5IG9mIGEgbGl2ZSBsb2NrIGlmIHRoZSBzY2hlZCBsb29w
IGtlZXBzIHJlc3RhcnRpbmcgYmVjYXVzZSBhbm90aGVyIENQVSBrZXB0IHRvZ2dsaW5nIFJUPw0K
DQpMb29raW5nIGZvcndhcmQgdG8gaXQsDQoNCnRoYW5rcywNCg0KSm9lbCBGZXJuYW5kZXMNCg0K
PiANCj4gLS0NCj4gVGhhbmtzIGFuZCBSZWdhcmRzLA0KPiBQcmF0ZWVrDQo+IA0K
