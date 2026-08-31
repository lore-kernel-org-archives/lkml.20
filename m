Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010070.outbound.protection.outlook.com [52.101.85.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DD3A50EC19;
	Mon, 31 Aug 2026 15:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788188484; cv=fail; b=PNGoTbrzuMJv20bEP49kax4rVuly8u0nK34PyawSFN/GNNNEwUx/Tcf2h4YWnQdAABFWzgFmrSvkYedMgnlpLVfOafQKmuUJnok+MooFos+fbLiD1FfxvlKIONw32APwt5buZ7ZDJTwbLFVyn0TluUG6UyYMpcyVNg0VoP3OF0Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788188484; c=relaxed/simple;
	bh=fmJz2DS50WZF+Gaw7xPLBaxjU0gTaul5tcJLvUGYSEE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FuIw+ycOu7Baq+IfGpMB6T41h0iUsscDBk2xNzY0tYTTW51gjFY3e//xdP5weXVplpOJ/A4IM+1lhi6Ts0f76ZDhVKZfFDkYQ6vELvc8EfQG1PkgUDKaxy5zBsGseV0okEEjRzpkX94eoyZ9tAS+JjT8Mr20+8enL4sI579hXMw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=hx0M07h6; arc=fail smtp.client-ip=52.101.85.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="hx0M07h6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bz7FYEtgN+CdHS1ZjfdBker/StHTbcm/l18z2RZgxeekxqrhzL0rey7ztnJs1GPB18xH+2ESnpfR6+2NsuLJawrUIN8/fYzEMMMGuArUIcEdwcbn09MIkPhpFEFW1NqEt/qWB0KOJjO+JSNC1O6G+oveRGPe5Zjsktvo+CI8iD47Mm3yR2hGnJW8LxhDWTGluTJ+EZyGFVvECIF3LmMxc3ezO03eujPJysG9Y7lTypsP9KftnEaW/q0n65K7/MY9MLKK+EOSy2VeloVicUtxtAUCiCZ3ism8i4R55C5ZSMU3gLxZcCrylz2EM7A1kghRX2j+5ebRSpCAq8KTIOyW7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j0f88eQjYRrTIyDNxYOVNOfrypzuDH9b/DFJgRp+iP8=;
 b=gW3FmaHjIRJJjtP8MwusJ5chZQ3p15fFnrV2hGrnQDEiyrxf6DNSPk2NWdP/LVqqwNWAOXdGXOZJbQM7ExwEdbNTcnPercSOZ2lWSKEPDZErIXMdQAZehc6eC02UCuVoPwT/nkKNVUpmkQ43PGa0rTPfLTiZS1aLjTQr1baIcDPQGe2lwvSdC0pZFbqtJZzTBr2kMwhQ46oFLlRr8kZ14GR388kTV+5M2PnDkzs2XMcAmjJ2gMgCOBPnc2UlNNXjMrpbtMzmNhpdp/dgLcdtWqzgIIJB4iZWmrlpCkS4yUSqY8fmaej1aiwOCenRSapO11NWbnX4N6eP4mtuOfGKxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j0f88eQjYRrTIyDNxYOVNOfrypzuDH9b/DFJgRp+iP8=;
 b=hx0M07h6mxytCq0MNZjzsTVrId8yHYzg2oDOr2UlcJ8EBsgqxo/0hGpzg1rNeAqwoeHSuyKRNRuFowqnIyJWaxp/JP/P9oXWM4mVTzqP9ZJzsJCo5q1xNDsppBuPKVsAdp8rHaYyNAx1y4UWvHtNZP4GSfKmkQ5nGcJBSjo8olit4Z0fkepuJKnj4lbdI+aU7gAwKbTbzDo2Fx4K7DpW0Ufo0lZRkvPbUhILMUrzMNp8bdbmcWgiQaoguxjErmRvWfbiFrQwU7CLI3SlM3n0a4PdodYlb1WL3w58a3rN+P9SE4g5uGRNjEVgK/7jElF4hwUKlujGcNwJ0ef1ydInPA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7)
 by DS8PR12MB333896.namprd12.prod.outlook.com (2603:10b6:8:447::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 15:01:18 +0000
Received: from IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16]) by IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16%5]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 15:01:18 +0000
From: Zi Yan <ziy@nvidia.com>
To: Lance Yang <lance.yang@linux.dev>
Cc: Nimrod Oren <noren@nvidia.com>, "Liam R. Howlett" <liam@infradead.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Vlastimil Babka <vbabka@kernel.org>, David Hildenbrand <david@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Michal Hocko <mhocko@suse.com>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>,
 Nirmoy Das <nirmoyd@nvidia.com>, Dragos Tatulea <dtatulea@nvidia.com>,
 linux-mm@kvack.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Lorenzo Stoakes <ljs@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v2] mm/khugepaged: cap min_free_kbytes recommendation at 1
 GiB
Date: Mon, 31 Aug 2026 11:01:16 -0400
X-Mailer: MailMate (3.0r7024)
Message-ID: <28FC994B-F63D-493A-B86E-F87E37B303B1@nvidia.com>
In-Reply-To: <8411e51c-92fe-41b0-9de0-e9cfc5a50301@linux.dev>
References: <20260831075635.2244437-1-noren@nvidia.com>
 <8411e51c-92fe-41b0-9de0-e9cfc5a50301@linux.dev>
Content-Type: text/plain
X-MS-Reactions: disallow
X-ClientProxiedBy: BN9PR03CA0254.namprd03.prod.outlook.com
 (2603:10b6:408:ff::19) To IA0PR12MB8374.namprd12.prod.outlook.com
 (2603:10b6:208:40e::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8374:EE_|DS8PR12MB333896:EE_
X-MS-Office365-Filtering-Correlation-Id: 400cbac5-27b5-4248-e42b-08df0770b61e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|7416014|4143699003|10067099003|11063799006|56012099006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	WN5iLciBRR05V3A/UbZQ53kOQR/b7j7tWKouUP5M+0D1fFQPCky1yddCGtoxNQxj1+qLXz90XodzDEybM9dOiFrwxlA6GXGEspOuYgjbYJQTsYTSzkumbHenu8y7oUC6EcOdcjV57Ug7+gr+qyqqCF5DjLjsvPE9KQhEuwj3RSueIrneM9CwrptnpI2LYOucnB8k5BONJKgN2/IPLbHw5xn7JqQdxLODdBuexK9d7M4NcvNps0fnebjJuNCWz04tpV4NP01Qb/KpLMJDoy0m1ADqf8qeW+hTqKaC6szp5XfrgGhoGkub/myQzSHqeeZsBjqcZB5A0XSbyn7KK5MQfS8PkKtdKKbwd5VYYEfwB6bvh2mZiHHEy6W3lObX3wQMkxqsecUrgh/Mhs2nCbfkauLC1xXo21UF5asNctIWJXZSSn4u44N5GiJLX20J2E1OBOF8ChlPvUQovhCKI6v1lj/0pSM+NEEkSTAqjhWLWHXUWlzh303AovUCZJj0+eg0PqZSXr8Bk9/sUC/I2z2vST8QiKBwT8jTzjJsFoN7HPjwn1mzRNgyqOwSEL62tlfsAGkjmeRNjdDqYSrp7Mu0TkWGe5tQrCdAqqqibfaI8bc54f1Ig2mKR/Kf999869U9+xbtBCxNt1UxGmHupzGnJ02gQLqytTaNll3JTCHO1vc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(7416014)(4143699003)(10067099003)(11063799006)(56012099006)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kXA3+4wByRiGFgm+IE/eRRe5mr14BVlRIIQEP/ASQdb4gHSO+c4u8Maf483b?=
 =?us-ascii?Q?WTvXYiuSTp3FQ3MIXFQAW0WuhPeDxufqcRam5Edij2XWiShpaHTW3soRP5+m?=
 =?us-ascii?Q?HcIqNFGd9uc7GbCyPCp9zztflUK+eGu+Cv+r+Yr1NqQvvuBjazijM/zzR0wL?=
 =?us-ascii?Q?e2BFaNNFqVbkFA+KY0P0vHxjxpwpIW7aSDaM9lkq/Tc3MzZabC72fsfVIMg1?=
 =?us-ascii?Q?/VqpE9MNOiMucPmUfsSt65m7X82WhppyCUxmzUhA6VYpzEeinuQFdJ5KbpY0?=
 =?us-ascii?Q?WZw0kXRTcbHFe+scdhQJjaRQfG8kNUOBNw7DhKG7CafnnR9uvHTqDKFVbDOC?=
 =?us-ascii?Q?s72xPo72R03gZAvSOPfstGBpPyETcm5tb/X/vDbnorSPj8HcndOxQ9Mfn1sX?=
 =?us-ascii?Q?QTkeXghkMVoLZiV4a2r+YL8E0slYvsWWMD29r57NGLDoXXZdCU9jOveSaVpF?=
 =?us-ascii?Q?juuKEiDEQSW1vvFv1muA+Lekr3KFUz5wOvyBTJmArM1kNf0bWnX0nJrlhsQU?=
 =?us-ascii?Q?/nPUUsC7003+/OJ6TUOdY/rXBqyO96ZaDU0fKzPDTV1X2chW6CAQsol4dhY7?=
 =?us-ascii?Q?RDOMbEEm5Xq/OKfsNxkNiF/5oqVfG17u/myr4RpWTunm0yC+U5Yi+YOB9+8T?=
 =?us-ascii?Q?mPnkSa80WHv1/3U2DK5KW0RShec2KNHZGbHiyzOnaRP3ckm3QGqcbtLDOlo9?=
 =?us-ascii?Q?VOog5d4ePiX7SuVlwJ+vqixIk/3oU6pQixEoZdMp1HlD5+PhTk3nQmVk8+o6?=
 =?us-ascii?Q?DyUt/2XsFudRwjFcTJzn866mim3zbdN1WdtDxEYo4Rpi+bYd+HGoy7B7mpUj?=
 =?us-ascii?Q?xUYpVriHEWyT1NOVdUMWO762jAw7uKqnSV/sMO6o8G8HJvmce9CMfGOfdrek?=
 =?us-ascii?Q?t50CQbUx49SM9MYBROunNo0ewHaJJbPFWDeslsSHNe/l8AJ1M5tV+EE4fWXF?=
 =?us-ascii?Q?nbugbTTw/7CSeWSCUcINJyMlNbNG8MLZOgOOOeYo3vjFMjoFLY8FG4ZXNjGA?=
 =?us-ascii?Q?0IEGf9YK+mVk8zY9j/bcUUh47kdtz5NoX0Vqc5mlfFE/1K7JA3laNa4NRqTn?=
 =?us-ascii?Q?QQ0RlteXxpSnPcxcPjLwP7sHaAME8zaPCmMP+m+G9kQIuakW1HC+3EZoWO0Z?=
 =?us-ascii?Q?6wSPNBvVNN+gtnBzUmg9UJpvoxujmuP0IX/DJGTIQ1TXHuTIF12107W1pPf2?=
 =?us-ascii?Q?yjomAClB3Gl0BdWoBS+eu9B4fdqDJ5O2QIdSYoM5QYt2C/o+83ImcJwpCjBF?=
 =?us-ascii?Q?PpUQ9Q973qG4ZFqWkBcslhN2SL/I5YQJvCG3ZqcYW1nZa56iaqwjqP2lltxn?=
 =?us-ascii?Q?JI+xYKH3CJbP3vyZ+s2ZpSyB2tXuQNcW6j5RRyLQxHfAr7u73EJHYtc03iPV?=
 =?us-ascii?Q?gRnnB7UtkWeqrVS5RyrieePw5/1i/VO+5LqCaZew5ZeGpFIo1K+8gZgx9YeW?=
 =?us-ascii?Q?KQf3QNUT3WWwUhQjPC65VonmRz0VkUNUgvfOClM9a6i6KD/pgLdY5s9DAQDn?=
 =?us-ascii?Q?VkrAEPkx+uAMCi0J1TMHS86/dVdd2kXJ/kCYSeStCf8kJutF7DfdO+zeGVgR?=
 =?us-ascii?Q?WlyrQpJIr9kHR05kiudG3EWV6CRgWqzm3x9qefdlX44M2EzLhG6UGi/BZb7Z?=
 =?us-ascii?Q?5Cr0Kyg8QM0zj/v6DOAL1Rig6JZDPznZHLZ9EjVYBHnVpwS0dEfXD8VyrP6R?=
 =?us-ascii?Q?0esmn8/Plz9MCWsCJzlcX6xnralFWwCIvuRWc+57pD0cw/HZ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 400cbac5-27b5-4248-e42b-08df0770b61e
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 15:01:18.4948
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zvz67CQUdLLaCt3fYaSpHspW6AsJxOe3lpTxwJF5875FRBHkNkTs+Ew/CNzfwIcn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS8PR12MB333896

On 31 Aug 2026, at 5:00, Lance Yang wrote:

> On 2026/8/31 15:56, Nimrod Oren wrote:
>> When THP is enabled, set_recommended_min_free_kbytes() may raise
>> min_free_kbytes using a heuristic that scales with pageblock_nr_pages.
>> With MIGRATE_PCPTYPES equal to 3, the formula accounts for 11
>> pageblocks for every eligible populated zone before capping the result
>> at 5% of low memory.
>>
>> This is reasonable when a pageblock is 2 MiB, as on common 4 KiB page
>> configurations, but scales poorly with larger base page sizes. With
>> the default arm64 pageblock sizes, the contribution per eligible zone
>> before the 5% cap is:
>>
>>    4 KiB pages:   2 MiB pageblock,   22 MiB per zone
>>   16 KiB pages:  32 MiB pageblock,  352 MiB per zone
>>   64 KiB pages: 512 MiB pageblock,  5.5 GiB per zone
>>
>> Consequently, min_free_kbytes can reach excessive and unwanted levels.
>>
>> Add an absolute 1 GiB cap to the recommendation, in addition to the
>> existing percentage cap. This bounds the automatic recommendation to a
>> sane value on systems with large pageblocks while preserving existing
>> behavior for typical systems with 2 MiB pageblocks.
>
> Sorry, I haven't been following the previous discussion.
>
> One nit: why 1 GiB? It feels a bit arbitrary to me ...

It is. Just better than 5.5GiB in the existing configuration.

Best Regards,
Yan, Zi
