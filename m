Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.62.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794273971;
	b=or/iGHSUfTFyuVNOPIIX60DWYjV0rv2oxxCMX5ay/GQWg3XS6Bvewcb+/ylqqPszB4SB
	 obYZiTP/GTkowHnDQ096d4yKVK9NVNmHa2AiWDK2GqTcPaV+ZvSITmRdkS1LJVUoTRuwc
	 AXJNLzwgYLTGbLPoaOT4+6oUFxqIyb8+7CB4aBfrPWkKofKIOKwvKO2V++v84wlhtdxrj
	 LvBhFC4RDfkFVwr3Wu3VIFFvulvbtKMuk3UOGMboLfL58h15h4b+0g5sLvI7Naa6e5hTO
	 XRmIX+fy5WA/XhNVh1OQ5XkpFo8a8kuuP6Cyu/Qx8zcy6IrqT+jCuK6AXJsfoJRevzw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794273971;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=ljB1qH0c8K/hT+MZD4soXVAtoUGFevtLnhMzq8kXeBk=;
	b=sxMps0MoWQMsXJZisAfI6f+k9Z9ZyT+1X8avySlI46WhE8qdWdgq0nL1+W463vhufD+y
	 ZFvASeGY4c6ZxS2EhUzY6LBuzsocUUacH1Q05edr430DhUTAiLcjB0/eWruKJrw8upPgM
	 2aoXYFl2K9ygbImxIDwx8EAjnjHObDajGw3kgXE2fT+ZhJRJ07bauSC/iggLqCPv7u0K2
	 vmJX/WIIPOYcqlZzvAb9LbMrx4mzNsf47PdFBQW2AQ51PqS/GDKDYsoFyhxiIjn3A4fDF
	 wgrRLbUOfCuIaZOm4haHTyecSIpL3dg1dgdbR3mwnzVpB2boc2hdo6xOwwXpz9cRkjQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=GEbWcGfw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.62.51
Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011051.outbound.protection.outlook.com [52.101.62.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C9C6606A333;
	Tue, 10 Nov 2026 01:26:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C9C6606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=GEbWcGfw
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=imksEOOsG4Tk5KpWz9k4kOxzXoah06qM6RdsRfWikOCT8lccFpWd8AIO5/HgL84bEeZEOMT0utA0oXbJP6FLAR2iL4KkRoLDNy6mWu6drhyRNXCqu61chWIfMkShac0jiidNknklozWHnSJOfjBngVsEHF7uj11KzFlCudeT6cBfaTJaI2/Rlq9h/ud9Ep0We4rKSKoWvKYHKJqDSWWe6l3PP7EDWlpsIfBcScxPyhpHk9x1qXaosKiGQVNPjLppjHFcpHIDaT/psCAxFmFqx6GclyMOm9Y4dLCCImkwb8I3H7IwWLoqK8e1RTXTwnUikTiS9YAqLv+mSXPded7lug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ljB1qH0c8K/hT+MZD4soXVAtoUGFevtLnhMzq8kXeBk=;
 b=YN+FvUh8xUGgjakMMtWemogdpgrZTxMDYqZLPhk5ui9ahWie9g9aQIHhUNNR5Uj1fvkOPDWMNDIMqPlWvLKhjA8bZEO485qqYecVVgh034mNctQ52LsnSjGCIXJzkawRucOm1KtsDVhJ6Y4a/4Z6RUsjAqGvlx+7Lp4YywuW+E8+j/9fEEhxYb41AkB++fcfuPvtYfRUeHuhl1nj+UwJXO7vk9ur3R+mVSvezXIEhOlvIThe+sC472E7WJqGsOKYQWi6d8mVO0kluEwvUfRV9GfcJ9A3EZ3YSCdkvOxkX+HwMzQPqv8GYjP4YVHol8o2L2LnW4oi1JN09npL6t+5YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ljB1qH0c8K/hT+MZD4soXVAtoUGFevtLnhMzq8kXeBk=;
 b=GEbWcGfwjmJlFT0PevZBh1x1WICmQ16bEBTbYv+dYmZeK7YJ6HPlTFDwMfRP8qfthlEliPAk/03KGF1NCZVQPdPQ5Bt9tWPNAR/gR/oTByJkgKKkIRLuq+ZIUbwOvSuX3lIuCuZKrbLJJvkwCFgHUQA1XaCiVe9TmzoTX+Heo2rjXjr3TtNow2JxAw50JJrPdQPVulpgsiawjDRBk4e0c4NWLcFKV8+wfOihbvPht16yKd/01m9eaZIjWszH8s/pSs/ROAXHPq4dR5WeozOQcMOIl8xsdC5hBJ5b5lqs1wIbBO560RWffAq2YZyhXIcLwegHUPtey9DFqOzNYiwYcg==
Received: from CY8PR12MB7290.namprd12.prod.outlook.com (2603:10b6:930:55::13)
 by SN7PR12MB7153.namprd12.prod.outlook.com (2603:10b6:806:2a4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Tue, 10 Nov
 2026 01:25:36 +0000
Received: from CY8PR12MB7290.namprd12.prod.outlook.com
 ([fe80::a8ce:7b9b:3e72:d1cc]) by CY8PR12MB7290.namprd12.prod.outlook.com
 ([fe80::a8ce:7b9b:3e72:d1cc%4]) with mapi id 15.21.0592.012; Tue, 10 Nov 2026
 01:25:36 +0000
From: "Qiuxu (Leo) Zhuo" <qzhuo@nvidia.com>
To: Borislav Petkov <bp@alien8.de>, Rik van Riel <riel@surriel.com>
CC: "Luck, Tony" <tony.luck@intel.com>, Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>,
	"x86@kernel.org" <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Qiuxu
 Zhuo <qiuxu.zhuo@intel.com>, "linux-edac@vger.kernel.org"
	<linux-edac@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "kernel-team@meta.com"
	<kernel-team@meta.com>, Breno Leitao <leitao@debian.org>
Subject: RE: [PATCH] x86/mce: Restore rate limit on MCE logged message
Thread-Topic: [PATCH] x86/mce: Restore rate limit on MCE logged message
Thread-Index:
 AQHdb7jEdw9TaDHQ0kKzczCdiHM2qLckn/EAgAFnXwCAACDiAIAABbeAgAATqYCAAAHNAIAABXEAgAA6/sA=
Date: Tue, 10 Nov 2026 01:25:36 +0000
Message-ID:
 <CY8PR12MB729095C0E94EF75023E31AC0D1722@CY8PR12MB7290.namprd12.prod.outlook.com>
References: <20261108143751.3af49e48@fangorn>
 <20261108202820.GCavDbZJgmwKqysH4X@fat_crate.local>
 <CH8PR11MB4034331B3E52AF39AA9C003E68FC732@CH8PR11MB403433.namprd11.prod.outlook.com>
 <20261109195216.GBavIkcPlh-HcT_7JW@fat_crate.local>
 <63ed91b49db00d7a601b8ae1625571ee0c46ffca.camel@surriel.com>
 <20261109212305.GDavI5uXK066CxHoNA@fat_crate.local>
 <a799adc77dc325f5e3cd9f806dae684f198efd38.camel@surriel.com>
 <20261109214900.GEavI_zEdfTeiCFKLg@fat_crate.local>
In-Reply-To: <20261109214900.GEavI_zEdfTeiCFKLg@fat_crate.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7290:EE_|SN7PR12MB7153:EE_
x-ms-office365-filtering-correlation-id: 27eed81f-9b48-4241-7e6a-08df3ec985de
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|23010399003|261102123227099003|261028144727099003|261026140227099003|261021121427099003|261022105027099003|261022075727099003|4143699003|11063799006|56012099006|261026121527099003|6133799003|10067099003|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info:
 tqVudwA0hDsEaxFzVOHNJqoabZGNqPsHwb1MAidf58sbLJVCvS/nmUTi1TUWloAAM3VADu1lUaiHSZQR9zl93v3AkuBExRLCb/G/DBAgD4EiympUvq8fId81aI+DMsxc8EpKqdfnYoZWYcVLCr1vUireFtBNnPTOCtZn1BsejVjUUDEaCqIpXh8Uv9KWnb2SsZ4zzVZo3m3Z6wZ+SKMQPCKywAnNjCR/7bD8L+Cd/CtaOuAjcvhuU1bmc25SQg+39rSRGNlz0BQwo6htmB/Jt5aJNJW1Agb20ww/Jv2LIVbGtGG+Ge/3IjxC76VgVUOiuYQJAaBT0bejh1TuRKcNm6eSMxyZcGPTMcmwcDe+2rb/QrrB4176sob15JnR45WmAXzVRNLZ2SleDHemXRkfuKx11IrwgSj9PTFSJnkrYT5hvEwh3Xh1cSNHl39dKyf1iD1KbJTBvciQT54ShZdOnFeWMfd4VlVJuPROjjAAlKnM3DoQZNS08dpHcjDqflMUailJu3XdLFRaZkNQbG6cKm/s73Yobb3DXop8UkEVEpoqcEHOuyxx9QwYU48GAUfJ/bhWjdyTzPD3zA0t86iC3JEnVR8I7XNvJQGTqS4Od2IabjCcpshyQhrX/KhMdv/MLjWBLhNMyO9REc15atM0oxsqpVrOW5rtBzMH4kxOM5IZ1ioyF2TarbQ9UPfzl2VeAQft1Tk/oOJ7aG/NgraRFA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7290.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(23010399003)(261102123227099003)(261028144727099003)(261026140227099003)(261021121427099003)(261022105027099003)(261022075727099003)(4143699003)(11063799006)(56012099006)(261026121527099003)(6133799003)(10067099003)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WnJYMWZBS3dzYXRyZ25GaEFqbTRVTWgySm5BVjZ1MkRvNXNxUng4czkxKzNW?=
 =?utf-8?B?QVlldnlhNnhjd3QwcGpHUlZnbjlyd2d0MU94WWxxU0VJeXU2MTdSRmE5ZHVz?=
 =?utf-8?B?U0hrbXZpSStZeG1LTnJ1SkNZUWFiZXdRWGE3SmtIOUVVTENPTWJpeExqWk44?=
 =?utf-8?B?M2RXQmpBR3pwTm5MUVVYZnJZVFZIcGRvMVZKKzVRcFZDdUxaVW9Wc0lrV3RO?=
 =?utf-8?B?c2FSNkp0MEdOVmN4aUlUMUplSEdBSUxscEhlazR2S2N5dlZ5TjhGRDNkbCtL?=
 =?utf-8?B?MmEvOW42Wktwc0dsNitDNlYwaWNhOW4reU10R3ozK0laVzZiQlAzYUxhNVBF?=
 =?utf-8?B?SFJjSUFVVXdYV21FdkFqWG1DMmordCtUNWFwa2VRWnEreFNtRjQ5VmFmYkJv?=
 =?utf-8?B?Q0g4bHQzckhVcllieDJRRWlERWxJWFJFQ0pIditCdTZVQVlRSmtLM2M0d2xr?=
 =?utf-8?B?MlZPeC9QWUxQbjFHcTNUZ2g1SWRUbndDYXpZRFFwSFQ1SXU2WEdMdGoybEVl?=
 =?utf-8?B?V2Z1azhoMytyTEM3a24wcEtQcHNwaVdFK0EydkNwNTVlMFBrbmY5SUcvWW1a?=
 =?utf-8?B?VC9aQVE4K2hERS81d2RIRWxSaTI2QkszVnIyL2p6L2ZlZVNOL3ZEOEFwQ1dq?=
 =?utf-8?B?SWgwR0RXNmZHTW5DVUtzdDFGalBMZUJyalIvTTZ2cHMwckhVY3ZuNkF3OVdv?=
 =?utf-8?B?UFlIc2Y3bjEzSkR6RTFkak5LQ1Fla2V6VnlWN0RMREo5RmVRVHcvR3YrN2pX?=
 =?utf-8?B?L1pqNVFMWDdaZTMybWdUcktCY284M0VoKzJtNk1yVDN4NUdMVFpOb0tnbjJP?=
 =?utf-8?B?YnYzZEUzL21aeTV4a2hxaGJGMFdubnpVdzVPMlorQ2RzWkZpQmJ0VnN6SS80?=
 =?utf-8?B?dlB3VGs0V1gxcmZrWVE4bkx5QXNXRE5WUldaTGNwR29Ud2lxM2JYaUl4M0R1?=
 =?utf-8?B?emRqa08yaHIwVlZuL2ZGTFBOTWdFQkJhT09ub3NwZUVOOVp2cVJSd04weHlB?=
 =?utf-8?B?RWV3NHZLUWI0bTZoWFp1RmpMSncwd2N0dDROR2c1R1h4T0xiV1M0M1FFc0ln?=
 =?utf-8?B?ekNCVVNmakJNczdiSllPK3BPWENnNVpSdHBzY3ZhOFYzTmEzSGN1YWRFRkRX?=
 =?utf-8?B?R2p1RlBjQUMrc0daMitZRnlqb3dIZEtoY3duM1JzVjRYWU82NHV1VFpRSkFZ?=
 =?utf-8?B?YjJabDlhRW8xY01VYWxnQXNPNmpXcit4VVlPYy9tVkZOL2F5aHBTY1ZVc3pt?=
 =?utf-8?B?UmNkK0RZUkpFWVFpeXFvREszQkNmRTlFZDZCTVJjc2JsSG1wNk5BT3VvOG85?=
 =?utf-8?B?OVFJNW1OZU9nZWRoK0FqdTdKTEh4b2FKT1FLRDdJb3dxWW9qZW16Y1I2NDJz?=
 =?utf-8?B?eklqMW1iYmZUWGcwRW90bmVPLzVCdFQxYlc0WjU1dHNZelZFUm1BQXNHWi9S?=
 =?utf-8?B?WkVwOFZuMStFMEZBdUc1dmMxSkZVSmhWUnRXZ3hlQWlaUGFnSnhoNi9Yc1lQ?=
 =?utf-8?B?dURMVmhsZStTQzI5U3pFN1NOWExlUWZiOEN5b3FBR0FqQ3R2amJoNEdQSTZv?=
 =?utf-8?B?VXNuK1Axak84elpKUjcxVnVkMmczMUNvZVVDalJDWFVXMFBhdWNKcUVpellQ?=
 =?utf-8?B?N3ZUci9IRm5LY1BpZkorNk5qWXZyTzlGRlhIOEJ2Szk5REZXM1NZRFNscHQx?=
 =?utf-8?B?R1d2Slg2ZStZWFVudWJNbWhlZmFJV1R4UmI1Z3hpekRhTldRQTlhU08xbHd0?=
 =?utf-8?B?ejhYMmplajlod2szRGdsV05zY2RJc3JtQlNaMEdLcGZweWFvZUVybFRsQUVk?=
 =?utf-8?B?aWF2b2w1OVZIZEF4ZXRBRGw3emxUWld0eUlleGgzNi9IdGFqUjVObnI1WXMy?=
 =?utf-8?B?a0lLK0RPYnYrZjg2RjVqc0xUeVg1d3N0M0t3Y2xpRnFCUjV4a2xaSm5ZOTg5?=
 =?utf-8?B?VGFFckxveGhoclF6cFh3clczMmU5cXZQM2wzTk00dUp3SHJJODFzLzhyTkZq?=
 =?utf-8?B?disrVE9WVVM1YkwwbjlJNlc4MkxtTEl6TFFRMExlOThQb3ZiQVNkNDl5b0tl?=
 =?utf-8?B?R0hibE1zaGJtaDdsYUxQRFltWTN0L1orWVlnS3dlZ2dZbjJlLzBDTy8vUURB?=
 =?utf-8?B?VWhCWC90aGVXSkE3V0taOVc5ZnhvT3MvbThTS0dtVDRNWlM2WWFvRFVwaENF?=
 =?utf-8?B?TGVWTDl3S0dBU3VLc0tDR01rOXB5OUZZM2JkOWRheUJ1Y3ZZbjBJZE9CUmZw?=
 =?utf-8?B?YUJscHZmaEpKa0dVZTdNbmxrNmRFakNoM2E2QnV0ZHJhT2JwNHJHWUhvdXFE?=
 =?utf-8?Q?NEAAE/waWAHlmHe5uL?=
Content-Type: text/plain; charset="utf-8"
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
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR12MB7290.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27eed81f-9b48-4241-7e6a-08df3ec985de
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2026 01:25:36.4854
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QUwavmf8vXtIeyVil+23+JDNqIu3APoLaizD5zY9yFCuD+a4esQnvw+qIpkTjQxmcSaRuwY3sEOmJPrWRJyKuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7153

PiBGcm9tOiBCb3Jpc2xhdiBQZXRrb3YgPGJwQGFsaWVuOC5kZT4NCj4gU2VudDogVHVlc2RheSwg
Tm92ZW1iZXIgMTAsIDIwMjYgNTo0OSBBTQ0KPiBUbzogUmlrIHZhbiBSaWVsIDxyaWVsQHN1cnJp
ZWwuY29tPg0KPiBDYzogTHVjaywgVG9ueSA8dG9ueS5sdWNrQGludGVsLmNvbT47IFRob21hcyBH
bGVpeG5lciA8dGdseEBrZXJuZWwub3JnPjsgSW5nbw0KPiBNb2xuYXIgPG1pbmdvQHJlZGhhdC5j
b20+OyBEYXZlIEhhbnNlbiA8ZGF2ZS5oYW5zZW5AbGludXguaW50ZWwuY29tPjsNCj4geDg2QGtl
cm5lbC5vcmc7IEguIFBldGVyIEFudmluIDxocGFAenl0b3IuY29tPjsgUWl1eHUgWmh1bw0KPiA8
cWl1eHUuemh1b0BpbnRlbC5jb20+OyBsaW51eC1lZGFjQHZnZXIua2VybmVsLm9yZzsgbGludXgt
DQo+IGtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IGtlcm5lbC10ZWFtQG1ldGEuY29tOyBCcmVubyBM
ZWl0YW8NCj4gPGxlaXRhb0BkZWJpYW4ub3JnPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIXSB4ODYv
bWNlOiBSZXN0b3JlIHJhdGUgbGltaXQgb24gTUNFIGxvZ2dlZCBtZXNzYWdlDQo+IA0KPiBFeHRl
cm5hbCBlbWFpbDogVXNlIGNhdXRpb24gb3BlbmluZyBsaW5rcyBvciBhdHRhY2htZW50cw0KPiAN
Cj4gDQo+IE9uIE1vbiwgTm92IDA5LCAyMDI2IGF0IDA0OjI5OjMyUE0gLTA1MDAsIFJpayB2YW4g
UmllbCB3cm90ZToNCj4gPiBJIGRvIG5vdCBrbm93IGhvdyBleGFjdGx5IG1lbW9yeSBlcnJvcnMg
YXJlIGdldHRpbmcgY29sbGVjdGVkLiBUaGVyZQ0KPiA+IGFyZSBzb21lIHRvb2xzIHRoYXQgd2F0
Y2ggbmV0Y29ucywgc29tZSB0aGF0IGNvbGxlY3QgZGF0YSBvbiB0aGUgaG9zdCwNCj4gPiBhbmQg
c29tZSB0aGF0IGdyYWIgZGF0YSBvZmYgdGhlIEJNQy4gSSBoYXZlIG5vIGlkZWEgd2hpY2ggb2Yg
dGhvc2UNCj4gPiBwYXRocyB0aGUgbWVtb3J5IGVycm9yIGNvbGxlY3Rpb24gdXNlcy4NCj4gDQo+
IEl0IHByb2JhYmx5IGRvZXNuJ3QgbWF0dGVyIGZvciB0aGUgcHJvYmxlbSBhdCBoYW5kIC0gSSBn
dWVzcyB3ZSBzaG91bGQgcmF0ZWxpbWl0IHRoYXQNCj4gcHJpbnRrIGFmdGVyIGFsbC4uLg0KPiAN
Cg0KVGhpcyBjb21taXQgcmVzdG9yZXMgdGhlIHJhdGUgbGltaXQgcmVtb3ZlZCBieSBjb21taXQN
Cg0KICAgIGVhMzI0NDQ0ZWNlOSAoIng4Ni9tY2U6IFJlc3RvcmUgTUNBIHBvbGxpbmcgaW50ZXJ2
YWwgaGFsdmluZyIpLg0KDQpTb3JyeSBJIG1pc3NlZCB0aGF0IHJlbW92YWwgZHVyaW5nIG15IHJl
dmlldyA6LSkNCg0KUmVzdG9yaW5nIGl0IGxvb2tzIGdvb2QgdG8gbWUuDQoNCiAgICBSZXZpZXdl
ZC1ieTogUWl1eHUgWmh1byA8cXpodW9AbnZpZGlhLmNvbT4NCg0KDQo=
