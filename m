Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=34.198.218.121
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794459383;
	b=y9PBEohQkD7Lmi81JI7UJtUI/acBwSB0HA9j5oMpWFGPwJkc3enCPfuTSjbGpJDfqQE1
	 FX6qb8JE30qR/u8X9F/Y12DCH1M5Sumnca6b9Fqr6VdH7pDvpiZUvF2ci3wOcoLk9Pph0
	 NHmZDoF2UX8NSdguohJHBowNvtOQZPf/5Y44h8ZisQ8vwuoaxHXTEbj3qhOJVnJJOCQR/
	 /ZQ4vUrdoJ1Sst2aQlXV0e0bS2FvpAIgKmQbrOx0DiBHhRLY3D1Jyn//b/WxkV4ZWGWfI
	 EAF1sSihg4GdG5QMvr5QvgYseHGVkrFLyU7sL03NFPw553QmpqjA09PVZ/uhJXc7zoA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794459383;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 Received:Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:
	 Message-ID:References:In-Reply-To:Accept-Language:Content-Language:
	 X-MS-Has-Attach:X-MS-TNEF-Correlator:x-ms-publictraffictype:
	 x-ms-traffictypediagnostic:x-ms-office365-filtering-correlation-id:
	 x-ms-exchange-senderadcheck:x-ms-exchange-antispam-relay:
	 x-microsoft-antispam:x-microsoft-antispam-message-info:
	 x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:
	 X-Exchange-RoutingPolicyChecked:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
	bh=Xo9sWKKQKv2j+gQ99P368z8wNggDQZ/gqj2vBXAihps=;
	b=ud9tkKIDHLwMA0+bwHkKXlx8kerGUmErS/t4/woHVzOsBLfpWNpZl3c8RWbzT4MmAf8K
	 nwPNFhkv/2AFVAAQ1H0i21EcxoGUq/JUB1e9Xnwj0Y6hO9QsYVkA4WPUBwBqkwwLXnDa2
	 2owRNzJvfWacXH6U8/C7x86yGP393Df/lYra3k2zexLtd+vaJOZCK2Pf6Rq0C3gMpGJHj
	 pv1szDtG+P7xpm3Ow5DFHMMqKVQY4QIk8JGzE/QFuPGj9aFkihszgzJfCj0/LSUd+VwVX
	 u3nRNMdTytCffIudWCr4WUIguD5vmqB/vhHdj1j7KRs7z7uL6f9GxzL0X69LuAbnBBA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.com;
	spf=pass smtp.mailfrom=amazon.com;
	dkim=pass header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=Dl1O2L1b;
	arc=pass header.oldest-pass=0 smtp.remote-ip=34.198.218.121
Received: from iad-out-013.esa.us-east-1.outbound.mail-perimeter.amazon.com (iad-out-013.esa.us-east-1.outbound.mail-perimeter.amazon.com [34.198.218.121])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDB37606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 04:56:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDB37606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=Dl1O2L1b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1794459382; x=1825995382;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Xo9sWKKQKv2j+gQ99P368z8wNggDQZ/gqj2vBXAihps=;
  b=Dl1O2L1bkq7Qih9LOmuR5zpgxstr9hCjk1mBVxvfxijvjNbCKjF1dron
   IG2KghiBTfdkDeufoT0A9mKBPnvnUFanCsuW3TwRsb4L2NMT5t65UWX+j
   V0CdUsNMRv7r8FfJpi6AcNrRFjuDcAMnvby5SXmNA/poQ41S0Dv0Cua6c
   E3YD0CW+cP0ubOiy+mOtT6S7T61n5eJ7nqIgRfgqtmCMUS8TiQAEzWdkj
   VZjulGiZJuir8zOX7fzgvFZnsg7LmS9aMIYp/OLy+sRtXDczFs/q0k/TX
   p6IHmFkMTkmbiayNyBJrpUNmvIQR3gi04HVUWQRsV6ntag3eyL3rLKONg
   w==;
X-CSE-ConnectionGUID: rwMSjZujRe2cn+MibDGgvg==
X-CSE-MsgGUID: XwLoD+HPTSSM0GNzQ2yrGQ==
X-IronPort-AV: E=Sophos;i="6.27,209,1787011200"; 
   d="scan'208";a="31186058"
Received: from ip-10-4-22-235.ec2.internal (HELO smtpout.naws.us-east-1.prod.farcaster.email.amazon.dev) ([10.4.22.235])
  by internal-iad-out-013.esa.us-east-1.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 04:56:18 +0000
Received: from EX19MTAUEA001.ant.amazon.com [72.21.196.67:18922]
 by smtpin.naws.us-east-1.prod.farcaster.email.amazon.dev [10.0.20.89:2525] with esmtp (Farcaster)
 id 048a8fb7-83ab-4b1b-a40a-6abcb7df0fba; Thu, 12 Nov 2026 04:56:18 +0000 (UTC)
X-Farcaster-Flow-ID: 048a8fb7-83ab-4b1b-a40a-6abcb7df0fba
Received: from EX19EXOUEA001.ant.amazon.com (10.252.134.47) by
 EX19MTAUEA001.ant.amazon.com (10.252.134.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Thu, 12 Nov 2026 04:56:17 +0000
Received: from BL2PR08CU001.outbound.protection.outlook.com (10.252.134.239)
 by EX19EXOUEA001.ant.amazon.com (10.252.134.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56
 via Frontend Transport; Thu, 12 Nov 2026 04:56:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HwoEj/6EEjn5D2VtW8Qy1ZZN9tVKFpuqjc3V4EcQ62+kus5uRJTTbWkIR6LToD+q3EKglf7FX9IWYwxCK6I9rDIZm3dsMVCwVErV1xJzkWRODX8DZavYAyAh5F5B4xaPC3TpyClySjQeXTP6+c74+jyh2HJFa+LEx/kaDfdL/AqTDvuUN1tO0bXJlwzj5o6yWtkMLX/91tWHETEebFzda+QQHqSREp3p89p3LewefiF/fgGMNP+JSg9v/iCx39MIvezqL4uYUNSHZdMiPwjFM9aF3A8G7G4Izh3dqktyGrTxKHyDNZRIAHn+wdUU7LfSuhX3F9GRcgxRF1lhn14M2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xo9sWKKQKv2j+gQ99P368z8wNggDQZ/gqj2vBXAihps=;
 b=sf9Ugq3BvYc79fK1d5NIZzg3YmIqN2MEoolMj8Lc56ckztqcmhu9wgPQMe2isQM3smu6rqIunX4Gngy0CA6nRN6KO9jtGgpb5aLpdlCm1naOip2PHKvAWcfIU2cR/E8zzpKEBnSq8ZqTrbDDEgioOy/9D4UuVmSiYfMPpQ5RrtwQXWyZgCzEPpqNT1Zvbb79R4WLXCUa1LPvUFaXtGqWH4FBKgg6N+Ax7l5ak9QetTZzRc0KzPiqxSRpzK+FKdMQ9AeBbUQJNFOotNcrEJbGZAiyKj0mKHF0mu3sCHZsVmN5czKqy2E6FGkmPF7+xGB6Uslusj9P2lysV2Otn8KPog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amazon.com; dmarc=pass action=none header.from=amazon.com;
 dkim=pass header.d=amazon.com; arc=none
Received: from BY3PR18MB4722.namprd18.prod.outlook.com (2603:10b6:a03:3c9::19)
 by MW5PR18MB5068.namprd18.prod.outlook.com (2603:10b6:303:1cf::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Thu, 12 Nov
 2026 04:56:14 +0000
Received: from BY3PR18MB4722.namprd18.prod.outlook.com
 ([fe80::e307:5f61:2694:b219]) by BY3PR18MB4722.namprd18.prod.outlook.com
 ([fe80::e307:5f61:2694:b219%4]) with mapi id 15.21.0592.009; Thu, 12 Nov 2026
 04:56:14 +0000
From: "Farber, Eliav" <farbere@amazon.com>
To: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>, Andrew Morton
	<akpm@linux-foundation.org>
CC: David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Zi Yan <ziy@nvidia.com>, Baolin Wang
	<baolin.wang@linux.alibaba.com>, Nico Pache <nico.pache@linux.dev>, "Ryan
 Roberts" <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song
	<baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, Usama Arif
	<usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>, Thomas Gleixner
	<tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
	<bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin"
	<hpa@zytor.com>, "x86@kernel.org" <x86@kernel.org>, William Kucharski
	<william.kucharski@linux.dev>, Vishal Moola <vishal.moola@gmail.com>, "Alex
 Williamson" <alex@shazbot.org>, Peter Xu <peterx@redhat.com>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 2/4] mm: don't report OOM when a huge PMD race blocks a
 pfn insert
Thread-Topic: [PATCH 2/4] mm: don't report OOM when a huge PMD race blocks a
 pfn insert
Thread-Index: AQHdcmIk1egn8otJFkCa2TTeTER83w==
Date: Thu, 12 Nov 2026 04:56:14 +0000
Message-ID: <BY3PR18MB47225CC4B10B96BEA9869B2DC6702@BY3PR18MB4722.namprd18.prod.outlook.com>
References: <20261111140655.34281-1-farbere@amazon.com>
 <20261111140655.34281-3-farbere@amazon.com>
 <c1b4cd90-ed08-45e0-8e2d-51b52b16c4ca@gmail.com>
In-Reply-To: <c1b4cd90-ed08-45e0-8e2d-51b52b16c4ca@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amazon.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY3PR18MB4722:EE_|MW5PR18MB5068:EE_
x-ms-office365-filtering-correlation-id: e7540670-4174-4f1d-1c3e-08df40794770
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|23010399003|376014|1800799024|366016|38070700021|10067099003|11063799006|4143699003|261021121427099003|261026140227099003|261102123227099003|56012099006|261022105027099003|261028144727099003|22082099003|18002099003;
x-microsoft-antispam-message-info: mD6jg8Cb95G501POWZm62ugHccgx2S8IYbslOIfzhnNVbgxL2nN9SpGIkN6OKr2/uXEbssS54so8DJuwYlihFyssSzhg88xWLsiuJu/qROYFgzOPvhjTpQ7Ywy+l6Xr1lYYHDpCPVWWBijdAerUD1a7hT8D2bUUcIY0V5lQvfBb/wK+5b2MPTbvcBqoDMG6wKVikRIHedrijFOgkHBMYCsau9o3/H3SpHxNCN1j+4RHTSziZY9w6JVSA827Y0WZSfWq1YHA9i+o5hldQszQvA2LaiO+i+AK9owtaYWVd+9VZW3uSfTzj1b3RDnzN6jYE/go+XPnZKgps7RMRDcPAu1/8NgQ+rMbRIo2PFvbMfOcYuyvIGd552/3NCWlYGlGo4pE6CT2y+wfmPZLSMpyMLGSYspJ40hkNbAm1UG6pXkOfQp0qhMqbxV9U428uCsq+C4U0Fz8sF6dyUePwCbH38cRhCf4knmJn5owlVFFfmDPYYvQTVI8EN5nILgpdE+gdgQ0VSHB4pMpdHEGPKWqJ29Gs6eSxwoABAve8MmjPovhS/FOFnfY8KaWlDbnnxbPgDFMN72ceLG1faFaPe16tKbxO3puQu6+OX6qDr9+aYko1pCLHyekwJ5e8Ye2pFGVUMm+8COacP7s3yn784sjIqasN4vNmtwyE0qvRbmqiDj+KAQxsqQjHGo342uKIAgIdbWjg2beIOlF0xCPsE2ghdV2HizNmJKgLBWYsf3KZwKQ=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY3PR18MB4722.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(376014)(1800799024)(366016)(38070700021)(10067099003)(11063799006)(4143699003)(261021121427099003)(261026140227099003)(261102123227099003)(56012099006)(261022105027099003)(261028144727099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NlI5VXFOc0hDVWZ4bXBqTXRBNTNjMnUzUk4rakpYdnptQWFXTVU1TitmdU9x?=
 =?utf-8?B?YWV1dlNPQ2RhVGFORnZETW5XVk5iblpyRXp4d2VmVkN4WW1ua3hhdTcyeVpx?=
 =?utf-8?B?MmdBL3FxTHZFcFV3czUvT1ZxaVlCMlUxSEtaR1Y0ZmVpNm5qS0tDNEdvQVdt?=
 =?utf-8?B?ZjhiOFdrYzBhQ3FDYkczTnZhazNzd2R0WVNENlM1c1k2Z2d2eEowMkdBVjZY?=
 =?utf-8?B?SFNCYTJXZU5tSU0zeERlT0JWcjVVcFJCeldtS3M1TzQ2S2k1V1JsZDdpK1ZI?=
 =?utf-8?B?dWhQUVV6a1hrRTlHQnA3WjhlMEgxMTJHQy9naXYwWW0zTjQwWEh2MGVPa0Ix?=
 =?utf-8?B?TWE0d2thV1pHVUZ3aHZyY2RDS00xSjViOGlQek9qcE9CNStwVUYrWW9tU1NE?=
 =?utf-8?B?c3BzSGVUREdWTkVLT1ZJVlpKdUtmSkd1ODVQK1NSUDgzT1Vacm1MT0xvaE9s?=
 =?utf-8?B?cDY5NTE5Y3BpbnJXN1ZpelNqUEUwbnhBekovWENBMXdCM3ljbW1XSjNHclhh?=
 =?utf-8?B?RHJGcjFtSElJRjA2QWl5S0VRYkorWXFYRy9nY0tHMmtHMTcrMGFqMEVRSFFw?=
 =?utf-8?B?ZmkrZllZUUZUSUlqNkxvOXVtVGh1cFBxT3p4UGtFQmlpYmhhL3BxSjZWU25i?=
 =?utf-8?B?Q1ZzRVJZZWx1UkRYNzljemhSVXRHRXRja2VQLzFrZ1JZZ25ycHpJV1IvNXlI?=
 =?utf-8?B?aFBRZzQ2MTZNd1VzeDV2THE3SWY4MEVrQ3hLVTZlcGJzdVk5OFF6dFV6enRR?=
 =?utf-8?B?ZElLUG5LRDN2d1ZuQXdwOVdWZ3REeVNkcDR3MTdTclVJbmZjRlVOQ3pUUDhE?=
 =?utf-8?B?SmY0bDA0ai80TjlQbVgyUWd3dCtxVTlFRjRMQS9kYmVHcU55b3NTdzlvNS9w?=
 =?utf-8?B?MUNNRTBvL0czc1J4VzBxQzVJMjNlK3lLWk9MTlJaWERMdWJpcEFNbmZEWDA5?=
 =?utf-8?B?YisrU0VIbm9aSDdqRWs3NE54MXZ0NTN4aWFqekwvL2gyR3cwTHRZQ3Rubzky?=
 =?utf-8?B?WG5qckZOSlNvYXdudDlpZGlycDFQOElwRitNdkRxbWVFODVUVjJaeDhiZVdw?=
 =?utf-8?B?YStwZVRMUUIrZUtjU0s3dXZGMno1KzhMUlVNQzYvNTdOTDA3T0h1R1dXYlR5?=
 =?utf-8?B?M1ZzSVd4Tm9jLzBRSjRpNFdwV1BBbTdCdmtoZU43SHAxSW1RT0c5QUN4MjdQ?=
 =?utf-8?B?ekR3ZzVyWjVGc1REUHZEQnBsMmw4R21SMWh2cUpqTVNESXJ4YTlyS2hwZGJ2?=
 =?utf-8?B?dmtZc1FOb29GMmZnUFVPNUtqOWxvR0hpTlNuMzhsNmxQY2N6S0Z5VHZjL29u?=
 =?utf-8?B?RWJxeDZ3eW15K3Y0ODBySnJWUm5XR0RPMWQyOU5pYjVpZDduZTZoaTNYT21x?=
 =?utf-8?B?a0dkYkk2ek9uL2ZBaFhra05GdlMzUHB2WUw4YnVsSkFjR3JEQTNWRXRpRUhB?=
 =?utf-8?B?ekg2QjUwVGpxelRNU1graW9mT05HRlAyM2pZeVlWZW1ZWC9rempGdVB6Q2tO?=
 =?utf-8?B?OEZYa0VERFFCNHBrOGZlVW9PRmk0cml0amMxcWpXWmJ0RlpZM25Sb3pnYjR4?=
 =?utf-8?B?aTZBbWZkRllpS3REaE5GYWcwZnBxYmFpdHFqc2Fyd0hFOHpYSDRvQTVKNVY2?=
 =?utf-8?B?NjRlRGozWHcrM3IwbG1OYnRtdDJocmtqNC9pUWpYT29xL1I3djRlaDY0TEZw?=
 =?utf-8?B?U0tZZGEzTFdQUVZGWk5yK1VDNzRQYTdYQzVRb2lNenZLbGJ3WUxUNzNkc2tO?=
 =?utf-8?B?ZUJaV1FyTDNSUU1Bd2ZjWDBYNnJZOEtZS2FQakRNdGVZdmxQbFY0aFNSSGdY?=
 =?utf-8?B?anhyRTl5bE5PWXRCcFJaYmlGSGtELy9NNE11emF5aTJoZW5SSjBKMVRQaGI5?=
 =?utf-8?B?VDR2YUZwMEZHeXM0cjh4TjN5VldKY0Yzd0dNTlZ6ckVtMGNINFhmZzJYdk9G?=
 =?utf-8?B?NFpkUmJjWjZ3cC9YWUJ6MnFFN2pkeFIrSE5VNGtOQzJxaEt2aXIrSjdleDUx?=
 =?utf-8?B?VzNoM1BRYTI5VDIzQTE4dmV5bTErdy9HcUs4OWZBVWdiWU9LWXhOVmNVa2VC?=
 =?utf-8?B?bVdlYUFsQjlSakFBK2NFR3lxLzltcktvenhSTXVVMFVnWjFhaG5UVTJGS1NY?=
 =?utf-8?B?UVlDTDEwYXB0bnNjTVRud2d6MW1OREZHVnlUazJYVTNLWnRBVklYTGx5bmJE?=
 =?utf-8?B?bzI4M01QNVQwemd3ZVgyalQybGc2U2ZZa0ZodVVFMnJqcnlPSWVaVGNOSm1X?=
 =?utf-8?B?MzFOTXNRTEx0UDdsUU9RcEh2UEZzeGlqSVBlWFFSOUp4QjEzVWhuNUFxb1gr?=
 =?utf-8?Q?HtBAc3Jyggdp/+p52g?=
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
X-Exchange-RoutingPolicyChecked: OfIpJ1ekgrhwT4PfZkBTUJjLXPftfw2NpcbyLYqfPztZeoRVl5RaQDT90gQKGEc4U9QUi0uqeNCLNKqzyseVxgPxbnZSt40A0GL81DoixBPNBd3UFyHCyw6cDJ9WPD3SIy5lisTHxQLa3bU0483ZZe0xBlX7o5IysnuG8mXLsNYRCh+Wu0B5TnLj3jKwet04jx88C/VV/PoFIz4ji7smL2qARYvojZAi4LL37c5IIZDoBtyiXMPgC1rzipQ7s1jHVp7wPZTGOSEsIG6mCP0ZXv5DsOucpbJBC/dw96PkkhDMi7wAhsATL1zG6VQLvAnKDRHORZXdYPCBlgJWxjzvcg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY3PR18MB4722.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7540670-4174-4f1d-1c3e-08df40794770
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2026 04:56:14.2781
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5280104a-472d-4538-9ccf-1e1d0efe8b1b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wbUYqQfEd+EEp4OL5xhc1wd0rVOELYl+jDvs980AL44q83t5xGMYMzVCeizkZI3xuag68SGTSlSY/YdcHo7e+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR18MB5068
X-OriginatorOrg: amazon.com

T24gMTEvMTEvMjYgNDo1NCBQTSwgSm9zZSBBLiBQZXJleiBkZSBBenBpbGxhZ2Egd3JvdGU6DQo+
IE9uIDExLzExLzI2IDM6MDYgUE0sIEVsaWF2IEZhcmJlciB3cm90ZToNCj4+ICsgICAgcHRlID0g
cHRlX2FsbG9jX21hcF9sb2NrKG1tLCBwbWQsIGFkZHIsICZwdGwpOw0KPj4gKyAgICBpZiAoIXB0
ZSkgew0KPj4gKyAgICAgICAgICAgIC8qDQo+PiArICAgICAgICAgICAgICogQSBjb25jdXJyZW50
IC0+aHVnZV9mYXVsdCBtYXkgaGF2ZSBpbnN0YWxsZWQgYSBQTUQgbGVhZiBvdmVyDQo+PiArICAg
ICAgICAgICAgICogYWRkciwgd2hpY2ggcHRlX29mZnNldF9tYXBfbG9jaygpIHJlZnVzZXMgdG8g
d2Fsay4gVGhlDQo+PiArICAgICAgICAgICAgICogbWFwcGluZyBpcyBmaW5lLCBzbyBsZXQgdGhl
IGFjY2VzcyByZWZhdWx0IGluc3RlYWQgb2YNCj4+ICsgICAgICAgICAgICAgKiByZXBvcnRpbmcg
YSBmYWlsZWQgYWxsb2NhdGlvbi4NCj4+ICsgICAgICAgICAgICAgKi8NCj4+ICsgICAgICAgICAg
ICBpZiAocG1kX3RyYW5zX2h1Z2UocG1kcF9nZXRfbG9ja2xlc3MocG1kKSkpDQo+PiArICAgICAg
ICAgICAgICAgICAgICByZXR1cm4gVk1fRkFVTFRfTk9QQUdFOw0KPiANCj4gd2Ugc2hvdWxkIHNw
bGl0IHRoZSBhbGxvY2F0aW9uIGZyb20gdGhlIG1hcCwgd2hpY2ggcmVtb3ZlcyB0aGUgcmUtcmVh
ZA0KPiBhbmQgdGhlIGxlYWYgc3BlY2lhbCBjYXNlLiBzb21ldGhpbmcgbGlrZToNCj4gDQo+ICAg
ICAgIGlmIChwdGVfYWxsb2MobW0sIHBtZCkpDQo+ICAgICAgICAgICAgICAgcmV0dXJuIFZNX0ZB
VUxUX09PTTsNCj4gDQo+ICAgICAgIHB0ZSA9IHB0ZV9vZmZzZXRfbWFwX2xvY2sobW0sIHBtZCwg
YWRkciwgJnB0bCk7DQo+ICAgICAgIGlmICghcHRlKQ0KPiAgICAgICAgICAgICAgIHJldHVybiBW
TV9GQVVMVF9OT1BBR0U7DQo+IA0KPiBtYXliZSBjb3VsZCB3b3JrIGJldHRlciA6KQ0KDQpBZ3Jl
ZWQsIHRoYXQgaXMgYmV0dGVyLiBwdGVfYWxsb2NfbWFwX2xvY2soKSBpcyBvbmx5DQpwdGVfYWxs
b2MoKSA/IE5VTEwgOiBwdGVfb2Zmc2V0X21hcF9sb2NrKCksIHNvIHNwbGl0dGluZyBpdCBzZXBh
cmF0ZXMNCnRoZSB0d28gZmFpbHVyZXMgYXQgdGhlIHNvdXJjZSBpbnN0ZWFkIG9mIHdvcmtpbmcg
b3V0IGFmdGVyd2FyZHMgd2hpY2gNCm9uZSBoYXBwZW5lZC4gaW5zZXJ0X3BhZ2VzKCkgYWxyZWFk
eSBidWlsZHMgdGhlIFBURSB0aGlzIHdheQ0KKG1tL21lbW9yeS5jOjI1NDYpLg0KDQpJdCBhbHNv
IHdpZGVucyB0aGUgZml4LiBfX3B0ZV9vZmZzZXRfbWFwKCkgcmV0dXJucyBOVUxMIGZvciBhIGxl
YWYsIGZvcg0KYSBQTUQgdGhhdCBpcyBub3QgcHJlc2VudCwgYW5kIGZvciBhIGJhZCBQTUQgaXQg
aGFzIGp1c3QgY2xlYXJlZC4gdjENCnJlY29nbml6ZWQgb25seSB0aGUgbGVhZiBhbmQgc3RpbGwg
cmVwb3J0ZWQgdGhlIG90aGVyIHR3byBhcyBPT00sIHRob3VnaA0KYWxsIHRocmVlIHdhbnQgYSBy
ZWZhdWx0Lg0KDQpUYWtlbiBpbiB2Miwgd2l0aCBhIFN1Z2dlc3RlZC1ieS4NCg0KLS0NClRoYW5r
cywNCkVsaWF2DQo=
