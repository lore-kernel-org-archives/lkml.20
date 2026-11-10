Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794280624;
	b=iNKQ3N5rBky9whfHaf2YMAQRQC9q2tjvyA+A+3aPuhcCLYs+d5TzW3SRZwdUeHAvidt/
	 BRRpjlSn0yor6x94PjAD4th4f2aKxal8KI24MNRO/oRD7tI+6M1EmfN9HOjwYsqpZkVcp
	 3TxRsDV2WtqZ7SP5j5FxnSuUwTX3eXRlKx4ksLa/bRzZPKo5+dE02FUhPh01BE9rQ3/Fy
	 uGNUps2FSiZ5jE/LlKK07rJpuS4DVr1Rs9u3sIpXawim4eTz1CQ/q8XUBM+In5qz9lbAl
	 DyOT+Xa6X+1Tzc4UqsacyivOKYQsWqkrgSVAgF2hvCEHV98yBQc71CSRpBUe63j8uaw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794280624;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:From:Subject:
	 Cc:To:X-Mailer:References:In-Reply-To:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=txUvaFU5xswvUN21b8OWu04iar089STKvVqQx6k4row=;
	b=it1RLy2ANQ2CZNPXY8+yfYUorObVaxuVvP8PCg/RqKbFYP146JammhTWMPGKIvxVF1lH
	 egOjpHrXY8brIiMJ7yUarW8Yi+MwcrgUsp7MLTJjpRfzRRW93ll6vkSreFi4EkUISa8tc
	 DLfFyIzeojaYvY3SN7ncXE8PBRUh7Dh4DtPr7hNUc0dQmTL9l+SyPlz2CQTJdU1DMsokM
	 PL0EbkfCKjDog97AdWjuRUgnfz9ry7YmkYHO/89TFsLvw3r74H1G/nck6Rk2y8qU3HTSS
	 759wX5jELOuKD+GiGLAnHaTKBL/mEnSOp+REOdOOHFnnkwxNtoecWuN82SaF0J76i3Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=MkIKTw5Q;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.46
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013046.outbound.protection.outlook.com [40.107.201.46])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8BD6606A325
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 03:17:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8BD6606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=MkIKTw5Q
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y52g2O+DckfPIsmbIRCg2BPgNxuUT4OkEl0+Cv407ql/3m/sI+GDXdR2aU9+FmeDcUYp+Zbiqq0a2R9V5n4O6LMuE0JNepgyZHbGIR021G68+mnb1KRm3bfLxEk1Erp3BzG1VSA+iV7/vmhYTtkoA3svmAMTrNxcSeZ7jh4dggtaX+VQl0uNQAxnXF6mn1S4zCs4RRwE3mwiU38Z9W/IN9G34Dy2p+L9AHE+JCri04uUy757YGm//9KAEc3KD8JYMmYZI+IoVQd7JG/mjIA+194j/hnzyNUyCQqHlcDaZ9wxzfIT7Xv8yqFqN3GvI6v1YJyTWzGwqWFYCaDKr480ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=txUvaFU5xswvUN21b8OWu04iar089STKvVqQx6k4row=;
 b=hGdAa+7kjUgDNBV2VVbMj9StbgNF5SNwDGtJYpVth8KuvGPpYqnvqZaUBGtf2+5UQw9UXu0QWwjtrjdfy2+Qrvg6cGu8yy9xf3hZGYiOy9MCbj8BvrL+O4Rxgc4lWo63SxLU84tn4drlOOUBzHHPLzt5kMt9SfhpYHEt7J0z/YSg6uGJx3l6KbGxjSWMnG3qGvHcKAMF/tJTpPq2OWlD3jAyI8JytxIHTilz82UgncwNVepV+b1e8ubfNqFR5eVJQw1nCTHJ1cp1aM+aIa9tc30Hw+dvcMEEVi4B/CDhuLvVG6OuaRhivq6hotacUDulAwVWBxMmx8qLDgbC6qTuag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=txUvaFU5xswvUN21b8OWu04iar089STKvVqQx6k4row=;
 b=MkIKTw5Q3x3ECNleS+d3Hh5l3EsTVabxW1gnSfajynDVJ+Np/sMjBZ3iIxU7H/aunGIEuKUYh8bNu9WybqxNM8b3SEaNCHWIwZdyI2wHSfK1AeC1+6DgDIlPqPLmOQ32eOgYuJBW0xDVz86j+zBZYCl2iTFFenpBstEFZ5nAcuMkWTj+LCNdgdBBIIESggBV/DmAoIjlZx5VJBD3RiMNgaw4e12ILMSRM9WdRDsJ8GnZLmcvKOYDVYdLkTQ8grnrNcvaG/JCGEu6leqRbHty0Gw89pf2TZ359Zb+SelriOo0mSQtJ3b2CKkyBiEs+xN5SxctT4+3STy+sxLAcwQQTg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7)
 by IA4PR12MB9761.namprd12.prod.outlook.com (2603:10b6:208:550::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.12; Tue, 10 Nov
 2026 03:17:00 +0000
Received: from IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16]) by IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16%6]) with mapi id 15.21.0592.010; Tue, 10 Nov 2026
 03:17:00 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 09 Nov 2026 22:16:56 -0500
Message-Id: <DMR7E8440B0F.9JG14H3BAOB3@nvidia.com>
From: "Zi Yan" <ziy@nvidia.com>
Subject: Re: [PATCH v2] x86/mm: Remove the zapped-entry checks
Cc: "Kiryl Shutsemau (Meta)" <kas@kernel.org>, "Thomas Gleixner"
 <tglx@kernel.org>, "Ingo Molnar" <mingo@redhat.com>, "Borislav Petkov"
 <bp@alien8.de>, <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, "Peter
 Xu" <peterx@redhat.com>, "Lorenzo Stoakes" <ljs@kernel.org>, "Liam R.
 Howlett" <liam@infradead.org>, "Vlastimil Babka" <vbabka@kernel.org>, "Mike
 Rapoport (Microsoft)" <rppt@kernel.org>, "Suren Baghdasaryan"
 <surenb@google.com>, "Michal Hocko" <mhocko@suse.com>, "Baolin Wang"
 <baolin.wang@linux.alibaba.com>, "Nico Pache" <nico.pache@linux.dev>, "Ryan
 Roberts" <ryan.roberts@arm.com>, "Dev Jain" <dev.jain@arm.com>, "Barry
 Song" <baohua@kernel.org>, "Lance Yang" <lance.yang@linux.dev>, "Usama
 Arif" <usama.arif@linux.dev>, "Pasha Tatashin" <pasha.tatashin@soleen.com>,
 "Andrew Donnellan" <andrew+kernel@donnellan.id.au>, "Rohan McLure"
 <rmclure@linux.ibm.com>, "Tejun Heo" <tj@kernel.org>, <linux-mm@kvack.org>,
 <linux-kernel@vger.kernel.org>, <kernel-team@meta.com>
To: "Kiryl Shutsemau" <kirill@shutemov.name>, "Dave Hansen"
 <dave.hansen@linux.intel.com>, "Andy Lutomirski" <luto@kernel.org>, "Peter
 Zijlstra" <peterz@infradead.org>, "Rick Edgecombe"
 <rick.p.edgecombe@intel.com>, "Andrew Morton" <akpm@linux-foundation.org>,
 "David Hildenbrand (Arm)" <david@kernel.org>, "Jose A. Perez de Azpillaga"
 <azpijr@gmail.com>
X-Mailer: aerc 0.22.0
References: <20261105120322.3319301-1-kirill@shutemov.name>
In-Reply-To: <20261105120322.3319301-1-kirill@shutemov.name>
X-ClientProxiedBy: CH2PR14CA0041.namprd14.prod.outlook.com
 (2603:10b6:610:56::21) To IA0PR12MB8374.namprd12.prod.outlook.com
 (2603:10b6:208:40e::7)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8374:EE_|IA4PR12MB9761:EE_
X-MS-Office365-Filtering-Correlation-Id: f50be741-7961-49e6-6a73-08df3ed91569
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|366016|1800799024|18002099003|22082099003|6133799003|10067099003|11063799006|261028144727099003|261102123227099003|56012099006|261022105027099003|261021135927099003|261021121427099003|261026140227099003|261026121527099003;
X-Microsoft-Antispam-Message-Info:
	biMdMg9clHSapvVIAr+EKBsEPSbq+iPEtn5tCvw/L7H5ZWgpEpek75I7CDaUOfTn8h0Z3aBcYoJ34wXkWkpum4KI+eucEKOY+hNzSftLWV8nsZ20buGsw8R/H5yhM8GdNGWJ+lX6pnuG5qFu2zZwlKRd+skc94ssewO5aJ+zhfoi0Sep7DmBAKXDFjroApOlSK7tiyKApvtGzO85ZyaTKzjriTBv0pavK433LqUkUFv7+zgrOFCQCioNH3Uciea4V0HCvuBOCo2BWhjpoRPvDkzcYuDXonMs0rYNw64hweYBiwyUeZFWZv0eXEeS9Ysa0qsPVjuYQ6cNy2qhuYPue8xH5KbWeTxRTvD0Vk3SZT/3M3aingW49ZVtFdENydkWyE1Oq58hVkwNO1ySJUNSphPyn6GofMWbvudUHN2jbMC5Iixhe3ANMewvyfgSlXBC4MLGUQZpdL55xZIze5op5RyqVjRx0G+dAyb+SHFDq1UsSj5GMwLUC7ZQD3ydmOp4CJKYw0my8+/57kfK3kFpUiTcIJxEb3pB+iGmM7SQusTViUKci40pF4Yc1PlctI19fAM8waFEMDSln20slpmJpKEKSFAw6BOBWQnJkZdlc67KAEWB6JWOosz655uDUUHgDdEmTTwfxn6rSwwhxig7ld+mOevmsGd0HiQa3otXAsA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(366016)(1800799024)(18002099003)(22082099003)(6133799003)(10067099003)(11063799006)(261028144727099003)(261102123227099003)(56012099006)(261022105027099003)(261021135927099003)(261021121427099003)(261026140227099003)(261026121527099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VC9TVkNUMnRFaGEzY0ZBYlJESnpqTVFoVStnUy9OUEs3MWNlMnYybkFKdGNm?=
 =?utf-8?B?YklFa3JOOFhRMFRORGt2L2twd3ZBTk9NaDlncklzQlRRVmtVQ3pqaHFPUVhP?=
 =?utf-8?B?QkJVbWI1YmZJcmdQcmdLRGVPT3dOWHQrMkV4ZTVuUHJHVGpTd1FsZFdHZFFE?=
 =?utf-8?B?NnVURDdIdFc5OER4YkVabVRSbzRwcWc5S1RLMkdaNjB6QXFVNzA1SnFqb1Ni?=
 =?utf-8?B?M1M3cVpEZ3RCUFZ5N2RqN0FQd0Fsb0F2MDBxR05HWmFSTk9UazBQYVl5Yk1L?=
 =?utf-8?B?c3N6OEcyZVV5RTNJQ2QwWHc1aVo3aU1SN1hOUWFONDUyaVkwUWltZU5Ma1VX?=
 =?utf-8?B?em9CZ2FnZ00yOE55d0puT2R1amEzU0oxTEp2MWJJK1RIWEJ2TW1xMFlqdDUy?=
 =?utf-8?B?ajhuV1ltdCtjaXJZWmdPQ1ZIRExIdWhwQUNyOVBkTE9kOUtTVmVnQlI5T1Vi?=
 =?utf-8?B?R05weExDVmE2bVBWSHBlM25ZN0VHODhGNnlIMHNMVnNzN0x2dHhmenpRUTlF?=
 =?utf-8?B?MHI1UWF4dVpuMXBkVktJR3JyNVZBWlJsSXd3eUZibEFsVEpQdWJOMUVtQmtU?=
 =?utf-8?B?Q3lucXhVdkRkYTV6MUFpa2VOSzZjcFo1enIyNlNYVmgrZWY5R1l6OURhZGIv?=
 =?utf-8?B?QXJycjd2cTBXVExHVVVET0ZaRG5KYlplTk5LeUdaamVlTVlCRzdsNWFPa0dq?=
 =?utf-8?B?RTUyTHI5aCs4WWU2MGw1MUtuRWlUaFpBbUE0K2JsNVU2dHFRVVRaWCtoUllS?=
 =?utf-8?B?NXJhWUFhZjRkVjFPRFVlTmRMYVlGdU5QUXhVTVcxeEI4bmVPc1NRTjcyWjdz?=
 =?utf-8?B?MElXZzRIZ0hNSy9JK3hxTTkzZWZyb0JLZUdabUIzbm9Sd05EVWRaaUpHbGFD?=
 =?utf-8?B?VTJCcnhrSU83OFM1VDI0Nm5Kc3RxaEVoQm4waUFycnFLNU1xbytiUWxqOHVW?=
 =?utf-8?B?NytGVWd1VDA3cHQvZUowZHdYTU8xMTBPdER6dWw0NXVzMFZ0UUcrZWtNL25v?=
 =?utf-8?B?NFVGZVJJK3pJTWNWMDdMYnZ0bWRseHFRY0Zta1VQRTd4UVhkbVVyMlhiTE52?=
 =?utf-8?B?bjNKNXlaTThCQ3A3aXBZS1hvdFViZkRJeGFlYktEWm8xK2FJaVlmcTNzU3or?=
 =?utf-8?B?U1dNdU9SejRUTWZ6cUg2YkIrRnpPNHlZZmxxV1FxTGRHdmlLNGlUTm8yeTFl?=
 =?utf-8?B?cEwrQXphdExOL1ZNWDhMc05ScXlUOVpTdkY3VkZBaGdzdkdUZzZQWUNHTzE5?=
 =?utf-8?B?NnNsU0k1TEpoczBrbG84ZDVWb1l3eVQvdzlrOXVWQ0JMLzMyVnVic3UrcE5Y?=
 =?utf-8?B?UWR4WUVzUUs5bi9PcWlxa2k3TVoxTDk2Q2NzQlpGZ1Ztdi9oTVJHRnZPMlFZ?=
 =?utf-8?B?eGJUa1JJZUt1K1YyQjc4ZlJWVkFobGZGaVYzWE01U1BDWUFybVNCWTdySlFP?=
 =?utf-8?B?UkpzWUdLRS9uWHByNWsrSmh5enJZVkhJU1hscHdDZk9VaTFwU1BqNHdRb1dX?=
 =?utf-8?B?MVRPRnVnYUpNclJlYVcrUE5mbkdONnJ5L1FyRUVDQlg1cTJMalVVQjl1OC9V?=
 =?utf-8?B?c2tGTXJWQlp5SEhJSkVaelZ5WWJXMzA4dkdmakxMdS9lNDVxQ1dCYy8vM0V4?=
 =?utf-8?B?RkgyWUhsVDY3T1Z4bTdtNStaYjVrWnVVRjJ0YVROSUk5bE1xaHZIQjJEeEdH?=
 =?utf-8?B?RE5UakFQUGxaR1lrWVVHWENOSWF6R3ZyZGc2M21YRitRWTdlOTQ4WC9iUXhq?=
 =?utf-8?B?SkVTNHpjVUxKYUtWRTBrZC9UMGJkQUFvamVHSHZwYlF6SEY1N3V6UzYrYmlv?=
 =?utf-8?B?MmRJc2VYZnRubHpKVEJyUnVjd0d5Z1FaQVRoRHA4M1RxNWRGWmR0V1VrWFZm?=
 =?utf-8?B?SUZXUUlneFlBcmRXRXlLSXJXSVQxbEhWLyt1ZWFMQVc0UWRhQUpmM3lFcGJS?=
 =?utf-8?B?VDVESkRnUm0zaHFnemRicXNQckUzc1o4b1VVcG0vc3JpME1yK3h2ZGtNQXAy?=
 =?utf-8?B?bEljcXo1a3IxNGpvallHL1N5R1d2M0JoNFVUNDJYdVBTOVMweFcvdmtsQlh2?=
 =?utf-8?B?R1d3OFdUb2h5Rm04T1h6ckhISi9mVTc3bXAyVUZvYXdUVTJ5bUo4Z1ZhcFNp?=
 =?utf-8?B?UGNWaGsvL3Q5ZGRxdlgvSzE2WElCbkRva2RSbzkwS2R0ejFTdE1CR0RpbzFG?=
 =?utf-8?B?c3M4S1I2U2JzT1lPRVVqdHg5d0diNVZGZHJycVl4bUliNUdPajI3MGJQeURY?=
 =?utf-8?B?NGc2YUUzZnN1Qk40VGxlL2ZBU1RsNkgyQXFEOTBQa3ZSdlE5cWRZOEM3Qmk3?=
 =?utf-8?Q?ckc8dYxhgJEfDNuvHy?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f50be741-7961-49e6-6a73-08df3ed91569
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 03:16:59.9337
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EV04tnJ6KVClGf+vuxF11Mv7fEsQH8G9HB+h3OmWw24kICjntMXUhOGP45iy/dlg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR12MB9761

On Thu Nov 5, 2026 at 7:03 AM EST, Kiryl Shutsemau wrote:
> From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
>
> Zapping a range calls arch_check_zapped_pte() for every batch of PTEs,
> which is every page for small folios, and arch_check_zapped_pmd() or
> arch_check_zapped_pud() for every huge leaf. Only x86 implements them, as
> out-of-line functions that warn about a shadow stack entry (Write=3D0,
> Dirty=3D1) in a VMA without VM_SHADOW_STACK.
>
> The warning is a VM_WARN_ON_ONCE(), so without CONFIG_DEBUG_VM the
> functions are empty, but the calls remain. With the SRSO "Safe RET"
> mitigation the return of every such call mispredicts.
>
> The x86 helpers already keep such entries out of other VMAs.
> pte_wrprotect(), pte_mkdirty(), pte_modify() and their PMD versions go
> through SavedDirty, and only pte_mkwrite() and pmd_mkwrite() on a
> VM_SHADOW_STACK VMA create the combination.
>
> Remove the checks, their callers and pud_shstk(), which has no other
> user.
>
> In a KVM guest on Zen 4 with Safe RET, zapping 4K pages takes one branch
> miss per page fewer. MADV_DONTNEED of 1 GiB gets 6% faster on anonymous
> memory and 8% on shmem, munmap() 5%. THP is unchanged. Without Safe RET
> the difference is within noise.

Nice.

>
> Suggested-by: Dave Hansen <dave.hansen@linux.intel.com>
> Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> ---
> v2:
>  - Remove the checks instead of building them only with CONFIG_DEBUG_VM
>    (Dave Hansen).
>  - Drop the Fixes: tag (Rick Edgecombe).
>  - Note that without Safe RET the difference is within noise (Rick
>    Edgecombe).
>  - Drop Jose's Reviewed-by: the patch is new.
>
> v1: https://lore.kernel.org/all/20261102144001.342837-1-kas@kernel.org/
>

Acked-by: Zi Yan <ziy@nvidia.com>


--=20
Best Regards,
Yan, Zi

