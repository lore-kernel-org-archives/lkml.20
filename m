Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012044.outbound.protection.outlook.com [40.93.195.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F073725E469
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 02:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788575324; cv=fail; b=VT2YGM0Cex6FMn+9MauerjTOiZ1NW/Q+/EvigXDPNucMcqwWx0Wb+APP8L4BDvtQi8/m7soTwcjBRqEUJ3x69FEbh8F6Wqzc2fuNi6TTM9UxVUpvPL3OjJKHw9EByqXG6OEoEHvQTvgozp1f66vyH7FmfuqsjfbxFRMi+soqmLY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788575324; c=relaxed/simple;
	bh=NAk6qvtv0ccQteAI+mNduP4bnpP6nWpy72cUA1CaF5k=;
	h=Content-Type:Date:Message-Id:Subject:Cc:To:From:References:
	 In-Reply-To:MIME-Version; b=Hj2prefTEeRCf+7jlPVm/63DHWdalU6HJB0WWo1PsNLw/evBtEruYvYlQLE1vTg/k2zgHmvdpzKL/3FF3/h2jKzlrMjw4iADErRbf1CZx9YbqIkDJe7DIFLJj273Yv9rV519IowHBYVLeNbxj31K5GGlLFGIsJhRIfinD2W48Pg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=mXmbe+VW; arc=fail smtp.client-ip=40.93.195.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="mXmbe+VW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H+nMmB2MsuErG/QLEDVPu3R6d8+03dspQImLHc+NIq0GwOlHFBKW8I9PEFiVi5qMMd+eVqXzTVQ0TpRzJr9W/LkHC3opFvmBE21F/7xIfjB0SCknVDGji3zGJW7ZSs+KsPFK+kU9+cxAWgZ8OhcjElWVWpGAuniPV4cb0GkAjpihJznPmJdvqyYzG4Bm5LT8IMSUx5DfP0jUr/R2qNVPHbioacKkJRz1tdXIUAsWV3rRe3vZC1Hvq93mj5PtY3eARzBo2Bp+yp+W0BbpeH7bEcVgSROYQuEtHfe5mmL+Ky+DRAB/204vDAl1tVdWB9iw//D9OOadQYiynczRoaCUrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mk+QKKb31T4TVveFDXE/55gsuOxa7PWfzd4oowIl4Ac=;
 b=K433350TJ7NdIj2mfT+Bh8bTK/1CalP0m0eYuk6PNMnhsfcpjnOFkzJkSqVtHeTcTPpN45364Ia0WubqmV/E8ezwV2hJ1v1o4wShkJ5oaR0/o56EcpusrYaO/hsrfpbBgcjAyGrF3ZiYVGiKQgUmGgrBiKsbaUgzLW3hNrROgMRqVuh0AelfhAN72m4JvcEd1HVCOBGCe4/bB68HTF8ZkcPNseuGfR9eDJwjgVs1gttv0vMcyjsBCjAqgtKpUtQSe412i6x/Hy4vw9o5UJ9yrBPObrmogB+nEVdpfJteEDGSwrYvDM5U+eJY0vTVIAm0klpznvfmNx/EgOLmBY5glQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mk+QKKb31T4TVveFDXE/55gsuOxa7PWfzd4oowIl4Ac=;
 b=mXmbe+VWRFjkh0CwQUvnQCSvm1rii5OCBz92QsyDhSexDsAJJLIleK8SEjeFJKUE5etCTGfeCX4vBq30xoOL7W21jphWzZ1jFWg7CBqHwopuvknZqusvVLj6sae6B8YpjGQ+D7uCkUxyf/BUuwID9x4YIjcrfbYG+l3w+gIoxUH3Mo5p4tQXNQ5vxHbSVELEKqAWN87+J92BVNTNuSdohBSGKKbFzMz3pF/gggmbzPn7jERCcOmOrD/RdgXeuhJd1SGj+7kkkVcwuAG3MdMoXghAQtgS8fvSpv1Ah2yPrglCbjRINDNyqF5Hk633JAf6H8GacF383HWJEKD8cvTwJQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7)
 by CH3PR12MB9021.namprd12.prod.outlook.com (2603:10b6:610:173::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Sat, 5 Sep
 2026 02:28:33 +0000
Received: from IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16]) by IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16%5]) with mapi id 15.21.0360.008; Sat, 5 Sep 2026
 02:28:33 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 04 Sep 2026 22:28:32 -0400
Message-Id: <DL7117KG9MH4.33JPGMA0J61IV@nvidia.com>
Subject: Re: [PATCH 03/12] mm/khugepaged: rename mthp_present_ptes bitmap to
 eligible_ptes
Cc: <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>,
 <kernel-team@meta.com>, "Baolin Wang" <baolin.wang@linux.alibaba.com>,
 "Liam R . Howlett" <liam@infradead.org>, "Nico Pache"
 <nico.pache@linux.dev>, "Ryan Roberts" <ryan.roberts@arm.com>, "Dev Jain"
 <dev.jain@arm.com>, "Barry Song" <baohua@kernel.org>, "Lance Yang"
 <lance.yang@linux.dev>, "Usama Arif" <usama.arif@linux.dev>, "Vlastimil
 Babka" <vbabka@kernel.org>, "Jann Horn" <jannh@google.com>, "Kiryl
 Shutsemau (Meta)" <kas@kernel.org>
To: "Kiryl Shutsemau" <kirill@shutemov.name>, "Andrew Morton"
 <akpm@linux-foundation.org>, "David Hildenbrand" <david@kernel.org>,
 "Lorenzo Stoakes" <ljs@kernel.org>
From: "Zi Yan" <ziy@nvidia.com>
X-Mailer: aerc 0.22.0
References: <cover.1788533997.git.kas@kernel.org>
 <aeed00c71bab856afb18c12c8e9b904f82185942.1788533997.git.kas@kernel.org>
In-Reply-To: <aeed00c71bab856afb18c12c8e9b904f82185942.1788533997.git.kas@kernel.org>
X-ClientProxiedBy: MN0P221CA0001.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:208:52a::7) To IA0PR12MB8374.namprd12.prod.outlook.com
 (2603:10b6:208:40e::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8374:EE_|CH3PR12MB9021:EE_
X-MS-Office365-Filtering-Correlation-Id: f1be0775-88d1-4cdb-3f41-08df0af561f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|23010399003|18002099003|10067099003|56012099006|4143699003|11063799006|22082099003;
X-Microsoft-Antispam-Message-Info:
	rH87nFTfo1iYnric0h6OUtITD1yhf7ac+XTsqHl8E53V8L18+KYwy6gfXVX7kc62+c4SOKZfsCuXCK77hW1RCD3TOU9Set+ZuEdgoAU+t7PwFcdrrTL1XQTsY5MnFbNRwTsXnqXXdl8DvT14Q3FwWI8/F1SGhU0HF9MsYI56KmjvkzNjADiWkoiZxujjdNX79x89KqcSQtvP0P5FaPgq2vbLiVkf9hdfUFBqIgbvyDzybWfaIjk/LXYK2N+yaI7kJnkIlbQ+NJtsHNKNCAI0QmjaewokLSWSzrBSYbiVkuOF/+dnfvYUuOMPtds4cuPwg524d6bakKLyN/UDmynEVN8SmtxAri7PhjkRF+1YL+DX+mbxv23sSUS5H9fKM6on6CylpP3tpOpDPC5T7zPVVdIlnnat189x+ApcqdBe2o3wxrfWHHlaUu9OzF2F2O/uvIZeXQKj55qAJPonHzMuEWZMkd2JyJmrA3cwL9mTWp/80zhD4rl1A7m1A5d11UkhYK+51SauMy5PC5Yo7JMnrYEkg8UOStWVPWQrkVu0lYqffP1v2xGFQ9ZHMNpwwYKnDBbXs3fw8FEJqIRk83tgupju1szRM9myQayWWPBgioS4z+Ju3kkswX2Rp+pwgK/g0On7HsBZZOQsQIOSYIaBr/qXTydlRbiV9dulfgV4X0A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(23010399003)(18002099003)(10067099003)(56012099006)(4143699003)(11063799006)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZjNocUZQcUtpMUpPNGoya0xEa29GOVM2N29oNWVIRVRLa2ZVYkFIZk9PR1Qv?=
 =?utf-8?B?QVdOU09FTHpaL2pxSVJYSms3eGtrZmNKaEZKQlF5OW9mdUdmU3Jad2lYejFJ?=
 =?utf-8?B?RTBkMjNzVU01dWJMUEMyS3RaaFlCWlJSeDFGbXJJcjJZcjcrcjN6Q3ExeUQy?=
 =?utf-8?B?eHY2cm1uYjJMbmdHR2JDZHp5WmxENUJHVVd5OXE5ZE5uVXhoOS9ibUltNzVq?=
 =?utf-8?B?cithYTlGTUZxdHNLVS9tdDRkdHR2S1JnbS9qTStkSlZ5SGtMT1o3TElTc0s5?=
 =?utf-8?B?eTVseE5XOEtxVTVFNFVOSC9CUnlJSG5EZDJvTDB3R202TVdEeXkrTHZZTlZ0?=
 =?utf-8?B?L0RoRCtqS0ptOEZaQi96aWRzRWtTR3JsbzIzWi9ZSWs0enE5WHZxYi8zMCtX?=
 =?utf-8?B?U0F0OVFHZTBkNGgrOXRlRU94bnlPZmNRdTVlTFE3dXZMbC8vZHl3KzZsZkpq?=
 =?utf-8?B?cjBLOGs4OUl0Wk5oallJd0c2a2R1YnQ1WW5FTmJWYnRTeDN6SVBjSVg5MVpB?=
 =?utf-8?B?Nyt0Zit2SGN4TDYvWkNScll0cVR3M0QwSEcxN2Q5MGQ2N0ZnOUZ6UTVPNWFI?=
 =?utf-8?B?dkhwcHFUQWhjTUhUUXplcFkyS1BaT2F0OU1nSG5PZ0RNSGhUVzN0ckI0Mi9T?=
 =?utf-8?B?eWFPbExUQWZBTGJpdjUrQzFpb0t6Y2h0MkRiejRVWmtwc20wWnJONkx3MkZz?=
 =?utf-8?B?QVlYb21TR3BaSW5KL1VPYzVSSkw0Yk5YeVMrQWlzaHJHQkExd0xHbGI1YnJB?=
 =?utf-8?B?aWlRYlpxbzJ1RW9NbWx5NXE0ZXJOZXJnYVJKR0dWR0dJNHVwalNNT2Jhc3Rn?=
 =?utf-8?B?RFRwQWFWMWJqSi9hZy9Xd2haQkd0MXVEMmZCUDlnNkdEcEdPMWRyTDhmOTZH?=
 =?utf-8?B?Q1pjb0ZpWUh2blljU0FCUlAwaDFrMXBPcC9tSDR3T0xnSEFTdTJYTjZxTWVs?=
 =?utf-8?B?YnIrMkhYSGpMNzJPZDZTNzVPRDQrbGZEa1c1a2o2RmYvZXVOby9aWGk3Qnkr?=
 =?utf-8?B?eCtvT1haV00waU1aVG5EM1l0WElXRjNpYkFKWHJlc1pLOWNVdlR3aEJzUDM5?=
 =?utf-8?B?QVNxN0RaYlJVcWFVQnBiZVJ0dkJFKzZ2WVptV3NETTV5OGdvR1luc3J0aTdS?=
 =?utf-8?B?blp1QS91VGQ2a0tuZytwME5GT1U0MHN5c3FQWkpMZTZ4MHZNb0NEQlBrQWJs?=
 =?utf-8?B?di8reDVzSGh3RWhFcjlUaDhCeWFSZTFiMDhETWxYbVVEZklzbUlaT1JNQTQ1?=
 =?utf-8?B?QjZmbEcyWDBaMDdXVnFFWUZFcWZQeEZhOUJDRVNWY3pOcUNTMXpCaUlzbDZF?=
 =?utf-8?B?SVdtMEZsdnhRa0Z3YWJUaDdIOGg0ZkF1TXQ5dTZSK25IMU1LYVBlZm5EQy8r?=
 =?utf-8?B?aEhxcmdTZEZrR3d3WTNyNzJxb1plN0gvdHhESkZwWjJZKzJxNnowRXFMY0pv?=
 =?utf-8?B?TGlHSndBbTlGV3o0WHZ5enFwZUlEYU56d3ozcHUvQTNneWJDRHZzY2JhSDRx?=
 =?utf-8?B?V1lNVVpHTHZIRWJPQ1N4azdTSDU3U3VKeHp4M1NBWW5jKzZlZW4waWVrMzBr?=
 =?utf-8?B?QW81a0lCa284RVlXQmFuTjNISUY1ZmFtM3I2a3FEU2VqMEF4blpIQ2hiaDZK?=
 =?utf-8?B?SGhyNGg0VUZZLzlJK0w5bzBoOGtkLzdFb0RyeDRTK0sxUTRhT2ZNWE9oOFlu?=
 =?utf-8?B?TVljYjY2WTdiVHF0UWx5a01tNUlrVE1XUHF3VHdZT2IwWWR6Nml4cWRWQmtX?=
 =?utf-8?B?RjhaZ0twZ3g5bERZa2ZuV1dyaDAwNnpaYTFVMjZSNWJRWjNQcDB4ZTJmamZG?=
 =?utf-8?B?Y2NvaWpycmliSlJURFNWSWM0Tmt3emJadVo1TnVhZXRFYWRRaUI0b1JuQnND?=
 =?utf-8?B?Q0RqeTltMGxPUTVWVGJ2RDR1SXFTbmZndEtOYU9hTGlxMEZHVTlWTU1xT09E?=
 =?utf-8?B?ZkRUVTVhdW9DUjY2QVJ1bkpMZ283V28vZWVld3hId0lob1o1UU9BRGRTam5p?=
 =?utf-8?B?VXBUU3JoYzVBbmc2dTZOTXhiU2RNR2NGUGVaVEl0bERMd1Z2QVc3aFBZN1pM?=
 =?utf-8?B?Q240RjJmY2MrV0tJTi9TZkxUY2RrWjkvZFo3aXdiQStYQm5iOXVRZ0JVVHRZ?=
 =?utf-8?B?eHBuclVuNkhhVGljZHpiS3BwSnl3cHcxdm92a3BHZlF4SVQ0cXBnSjJGZTdz?=
 =?utf-8?B?Rzh0bGUzM2Q2UFIrVlMxRllpUjA1SDJ0NTJBRS9DSzNxMEZtaTZYMEFKZHZX?=
 =?utf-8?B?L25VM3NramZZSlRWeEVQTU9NT2JXQUNKb1J3cjltR044YTFDejNjUGF2ald5?=
 =?utf-8?Q?Gnaa9nvJ73o6PYgnE2?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1be0775-88d1-4cdb-3f41-08df0af561f0
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2026 02:28:33.7225
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PMoU3rfQ41ZXKerLTvgCS/VJ4yBYQWQuXL7JOGOyU+ynjEOJeCQAn2y9a8XyQdwS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9021

On Fri Sep 4, 2026 at 11:10 AM EDT, Kiryl Shutsemau wrote:
> From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
>
> The name says less than the bit means.  A set bit means not only that the
> PTE is present, but also that it passed the other checks: uffd,
> lazyfree, anonymity, sharing.  The PTE can be considered a collapse
> source.
>
> mthp_collapse() then reads the bitmap starting at the PMD order, so the
> bitmap is not specific to mTHP either.
>
> Name it for what a set bit means, and update the comments that named it.
>
> No functional change.
>
> Assisted-by: Claude-Code:claude-opus-5
> Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> ---
>  mm/khugepaged.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
>
<snip>

> @@ -1514,12 +1514,12 @@ static enum scan_result mthp_collapse(struct mm_s=
truct *mm,
>  			goto next_order;
> =20
>  		max_ptes_none =3D collapse_max_ptes_none(cc, NULL, order);
> -		nr_occupied_ptes =3D bitmap_weight_from(cc->mthp_present_ptes, offset,
> +		nr_occupied_ptes =3D bitmap_weight_from(cc->eligible_ptes, offset,
>  						      offset + nr_ptes);

s/nr_occupied_ptes/nr_eligible_ptes too?

Otherwise, LGTM.

Reviewed-by: Zi Yan <ziy@nvidia.com>




--=20
Best Regards,
Yan, Zi

