Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013041.outbound.protection.outlook.com [40.93.196.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 340144EF15C
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 20:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789677814; cv=fail; b=CmHGwnOGfNLtcDNImi2X3JwThpcjAhgOPvbQ6QrKvRoeFoj/y9jb2PJV0z3+VRgdn+ONyg9uFWjvHiufdOCRSwd6GVU229OL6663GZNDZ3aTi6f/b8nmSgKdjJe0TExdiGEbIXctKMgGg8Qe0g3uv0H6f7s6+rzEMVIB52sFphE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789677814; c=relaxed/simple;
	bh=rFTcMjL1KwP1RsFEVMOIMkICUKV45W1MhguYjJD9TnM=;
	h=Content-Type:Date:Message-Id:From:Subject:Cc:To:References:
	 In-Reply-To:MIME-Version; b=G1UtwhXPGhYV3/pbvFjjD6U2MnqA9kk72dgCTX0ZKyya+XgL64YqYnj+xA9QuDYVwvwodyJS/+3PohvA8yC590MrapEY/itVkwI9AV2VFMPejnBf7zT2U0PgvAbI5Rz7Ae6cjsUu3Tx4BsXUv/voIsTITEe4z0uUWPuyV5m3h0E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ciqVaf69; arc=fail smtp.client-ip=40.93.196.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ciqVaf69"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mN6eawpxJCIv5qPrsYOx60Eynyvma74v3cPS9HJ9ZWLsflQKTvUfU3QHaNoiOuY4HkFRmroKPyfziQyc83iPzEqSbJYu37QgF3hcC8p+FkJweuIQzBDRD6WJ6R1hp9T6dV7KsKsiBcq6RFc2XF+XOh62Xy63lzKfzISPKYKvil/lep8dfN0z74ZmJ4GTFQtQhXlqNfsXHw3b9HALImAlZFIl7aCK9XoDwqw6oS+DtiDi+zs18qiLjTtSoi8UjcZsuWwwb2o2mzRUvjo5kc4q2R5XRs1/n+7xlw6rNoXfkbw/tyIukAKCxe4WxBNKmb9VOajZ3iIUf0Niavjb18mNug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t4qMZvR9Gm9CpbplgbgXkqPpLCny1BaqTVcqVpCLx2E=;
 b=sulkwBdGCHFNr55GRdJCAnLn6LC4W31dzeoSRgjtk0XiNC5HAzadFPXRdTGCkndEs0bu7idBX+sk8WifUkizCx76sau5KKKWcW2ifEHGPbLfsFM9nHG8mKtNAxq67U1R6DsDr18ls1qO2ExYNrDsvPytuIwR7VOkrQtGlPmuErVA0PMre3OBz/jextmWz5T6NkrORO8W3RBIO2aVWdbKyHekLwFkHTWQhCgaDBII4nhiR1BQ17ScTFB2+wxyuXyOrZYC5h8YyDDLPdwEOLblspsku95KfRDgqQuLjQest+uq4RYQMWKXuwUZScKLQDR8TWkNVwAKZkWwOoq3xnCdpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t4qMZvR9Gm9CpbplgbgXkqPpLCny1BaqTVcqVpCLx2E=;
 b=ciqVaf69G0O7JFsMcnwh79Ofsyj3sPcf83rEY+1mT1FK+K7LnQENnbDIFl0oELjCfV1wK6ViWwrh4E42311QNClAkPM4svt2VJUv6DdSpB8kp4j91PwthRU5K0NaFMcTlx5QZbbgz9a64V5gDnImbfCJChiiExouywoI0TxcFZLtr9NNXWodt6MT+M/VQgsBjElaYMUct0ta8MMo2b0z64KaCVfv8t7RvpFIZJ+LNtjy+Fbs36npDv/TFE7kVQu1xMBJSNVmJgrwPn5sEd7kLTsz/NKIkKdovYvSD/WUYshklH9ipOIhITmH3yvxwO+e0yKonjqRbEsTzWLGhOLIbg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7)
 by DM3PR12MB9433.namprd12.prod.outlook.com (2603:10b6:0:47::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.12; Thu, 17 Sep
 2026 20:43:22 +0000
Received: from IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16]) by IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16%6]) with mapi id 15.21.0428.011; Thu, 17 Sep 2026
 20:43:21 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 17 Sep 2026 16:43:15 -0400
Message-Id: <DLHVTX80IKX4.GKQ7P0C8S5IK@nvidia.com>
From: "Zi Yan" <ziy@nvidia.com>
Subject: Re: [PATCH v3 3/3] mm: update comments to refer to anon rmap rather
 than anon_vma
Cc: <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, "Andrew Morton"
 <akpm@linux-foundation.org>, "Suren Baghdasaryan" <surenb@google.com>,
 "Liam R. Howlett" <liam@infradead.org>, "Vlastimil Babka"
 <vbabka@kernel.org>, "Shakeel Butt" <shakeel.butt@linux.dev>, "David
 Hildenbrand" <david@kernel.org>, "Baolin Wang"
 <baolin.wang@linux.alibaba.com>, "Nico Pache" <nico.pache@linux.dev>, "Ryan
 Roberts" <ryan.roberts@arm.com>, "Dev Jain" <dev.jain@arm.com>, "Barry
 Song" <baohua@kernel.org>, "Lance Yang" <lance.yang@linux.dev>, "Usama
 Arif" <usama.arif@linux.dev>, "Kiryl Shutsemau" <kas@kernel.org>, "Mike
 Rapoport" <rppt@kernel.org>, "Michal Hocko" <mhocko@suse.com>, "Xu Xin"
 <xu.xin16@zte.com.cn>, "Chengming Zhou" <chengming.zhou@linux.dev>, "Jann
 Horn" <jannh@google.com>, "Pedro Falcato" <pfalcato@suse.de>, "Rik van
 Riel" <riel@surriel.com>, "Harry Yoo" <harry@kernel.org>, "Chris Li"
 <chrisl@kernel.org>, "Kairui Song" <kasong@tencent.com>, "Kemeng Shi"
 <shikemeng@huaweicloud.com>, "Nhat Pham" <nphamcs@gmail.com>, "Baoquan He"
 <baoquan.he@linux.dev>, "Youngjun Park" <youngjun.park@lge.com>, "Peter Xu"
 <peterx@redhat.com>, "Muchun Song" <muchun.song@linux.dev>, "Oscar
 Salvador" <osalvador@suse.de>, "Matthew Brost" <matthew.brost@intel.com>,
 "Joshua Hahn" <joshua.hahnjy@gmail.com>, "Rakie Kim" <rakie.kim@sk.com>,
 "Byungchul Park" <byungchul@sk.com>, "Gregory Price" <gourry@gourry.net>,
 "Ying Huang" <ying.huang@linux.alibaba.com>, "Alistair Popple"
 <apopple@nvidia.com>
X-Mailer: aerc 0.22.0
References: <20260917-vma-is-faulted-v3-0-5c22314a72e7@kernel.org>
 <20260917-vma-is-faulted-v3-3-5c22314a72e7@kernel.org>
In-Reply-To: <20260917-vma-is-faulted-v3-3-5c22314a72e7@kernel.org>
X-ClientProxiedBy: CY5P220CA0004.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:930:ed::15) To IA0PR12MB8374.namprd12.prod.outlook.com
 (2603:10b6:208:40e::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8374:EE_|DM3PR12MB9433:EE_
X-MS-Office365-Filtering-Correlation-Id: 7011f993-aba8-4931-b061-08df14fc5003
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|23010399003|10067099003|22082099003|18002099003|56012099006|4143699003|11063799006|921020;
X-Microsoft-Antispam-Message-Info:
	X9mKlrFh+z0w/51T+sfXik4fAUdLQuLVurg9q7UPl15TRHsW7Bwjk0v2/UEr08dF9hAU+z5tr5TbrpVtUIxAwxwB7GCwxN3XWImDGZeHkL9tqnxeWWxw2Ro/kmFxoYhBmkiuGe4TsFQV9+rc6sGRbG9inHyxRU2DjMgNzWD8r5z5drQ8Bx5yjHP9u0cbU/jR6o8dMjV5d2xHxNperofT8NrLRRYBMF50lZ7jSzDXJIjNy1ebAMgm/zGMhNBQEn43T8Chv47U0j+tmibrkmu3ChyY77vmjbfa0VKs5GbdFmQiR4CyPEH1ejRDRXch4vYgkH4m2jkhTQ4EwG6inCZzuj7hM0iIrhFIyoSkNaw0KesAR1/hKbgli6IKBAuz8ne6sCNNjirYybY5+yDErE1cjUHlMMoM5i4QEyI/MZNny63TwWELgTyz0xWsdkUMOUlgm5AVOMH3soktSogaI+Lw6ANkSBLR5Ewcdd7HMQDQFLUguHOYXQ9XjGJEM5evVwi1Lpa7W564iiRKMUeMg4k9ItyplRQXPq2S/gw/6U1XqzKYXDyy5dpwMnxhQlKtLreKxZDIkrxwEjwxI8/RhA5w71JRa5NTT689WVsjz1sYf2uNZ9A1OCmtyYlecJK19YEOsx7LsKvDr3pgcH+YKIKJGgNamPIXoSN5zOClW2n9rNIgmqG613Ls078A8nVU9bABIsut/KZIjqOpJbLPJG+NKA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(23010399003)(10067099003)(22082099003)(18002099003)(56012099006)(4143699003)(11063799006)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?KzliNWtLVmVuZEdoK2g2dXU5Q3R4OUdtY1hMR0xDRjZIZnVaQUg0eUE4bFND?=
 =?utf-8?B?clllbExRVzhsajlkR09PbmxSNmV0dlVNQk9QMCtwU3h3OExJWnRJNEs1cDVN?=
 =?utf-8?B?WitseW4zcndPbTdDMHgrT0VNR05vRUN4a0lQaW44elBpeTkzSjFuOTZNeDVS?=
 =?utf-8?B?d1Rjd09iaVUveDV5L3NOY05NT2pxL0krN2tiTWQ3M2tRa1NwUWJqQmQrcWR4?=
 =?utf-8?B?MWxVS0J3N0laZ3p4MHdtcE8xc1cyaFd3ZklRa1FteTVUWGhRUmptQ1NtWmtB?=
 =?utf-8?B?SDNrMkMyM2t1RUs4blRGTS9zUVRtNW45NUFMRTZMdGpRTi9RV1hjTjZsODVt?=
 =?utf-8?B?UGNKVUhOL1RjT3luMEcwTEhNZ1NIZ2xBSnVDa2J1dXBxTDBkaytTV0FhbURO?=
 =?utf-8?B?b09jcXRZODc0U3JsUzhXbXBMS1ZLM2crWW03b2tvaUNnMWFFcG9QWENDeHlH?=
 =?utf-8?B?bXFFN0FtL085L3RLRzVsQmxPSWVod1d3WTlTT1JteWQ0bmEvbVlwb0VXVUFy?=
 =?utf-8?B?YVZtYllYdVJIUENuS2pQNnFVVUdLclk2UDBoUkRhSXdDeTJ0cGI0c1d1ZUs1?=
 =?utf-8?B?b3lrZU5zc1FqOEMxVWhyYmw2MXlMblFKUDV6dWpkMS9EeEVMc2RYbUFMODhi?=
 =?utf-8?B?RnozZVZpbktkdTcya0lWaFNFMEhsc093eW1Od0hkK0QxOXFMbWpvSzlqdGZh?=
 =?utf-8?B?YUdoaVdsZjY0eXFkUzFzN095L25XdE5YcFhscGVCN3JiZ3YxWHM4eHluU2xB?=
 =?utf-8?B?WVJiZk9PS1o4cm1QTi9oMU9Nd1FpRTNjajBIeXZ2bUJLNlNybnFhNUFuQTMz?=
 =?utf-8?B?dVRjemZzcFllZzFBbHExOGliQ0pmL0NyVW9CbnJacWVwSGk3STZOUi9KTDZu?=
 =?utf-8?B?SklBWFBFaWVCczJvWTNzZkNWQW9xd28wTE5PdEFkeGhzOTlHaTFkZFl1TmZ0?=
 =?utf-8?B?c1B0czFZM3gzZDJ6Z01YdlZMbEIxTkI0c3pVY3doT2M5TzZ3SkZEdTZ6QVpj?=
 =?utf-8?B?VlQ1RWNPdm1FenhxaFFQSkpIbHZ0WGxkSDJzU0RvOUZkTkJ6N3dUT3ZDeEJl?=
 =?utf-8?B?UWJGWXZYaWhpc3pqVVFmVW9EeW5SdnJCRjErekxLcm5PZzVLdllmY3pVRnBL?=
 =?utf-8?B?RDQ0K0lBcEhIYWdISS8rU01kR0g5NEZ1S2pGaklWSkZoTzdUUjhJZXBrRFE3?=
 =?utf-8?B?Z01IMW1hQ2x6ZUZlZUMzclBrdWNacEMzYmxuTmZ6VHYyRFdwbi9EanAzQWRL?=
 =?utf-8?B?UWZ1Q09aNGEwd1pLdTRVN0hkcTdBVWMzTFdoTUt2Rzg3bzBnNDZxM2VGN09H?=
 =?utf-8?B?Mnp0NDk4bjRwMVRZYXhGbHJHbWdSWFJpQ3lvajJHSEhvL0xrYzNvenJPNk1q?=
 =?utf-8?B?aXh4NWhYSncydndsWXdFQVdNYi8ySCtIQVdpTUt1bzBVYUQvWWExNXMyVnRI?=
 =?utf-8?B?UloyZ0JuVG5Nc3hJVmRpejAwMFFROWlqMGE3Nk4xdU9YWVMwY2xVSW95ZkY3?=
 =?utf-8?B?c3lqOXZDNWJQQzd0bDZvMXZiYTVHUDhZOG00NDJOSER0YjJqK0QwK1E5S1hp?=
 =?utf-8?B?dVRGSDJCbGNuQmp2OVZFNEdRSGhXOVpXcFUvUERxbGdpVUh1bHdVZGRoWTRM?=
 =?utf-8?B?WWxGbWU5VkNjTXFKNE9KcFUvK0ordU9LOE1NMXozckp4b0k3Q0ppS3RuRHZW?=
 =?utf-8?B?UkN4TDNmMUlTOXBVLzJaWUlEZ1FGcFVKNGdMRjdkdi9SeFpVNHpMaCtYbHBK?=
 =?utf-8?B?eHVaMTQ1NGR4U3hnZkR1cXI3TXJEY0twL2NoWlY5RE10UDlxSTUwVlk1Zk5h?=
 =?utf-8?B?cG90OUVRZmExeVR4QnFpcS9rRmlmZldJTlQxSTBFdU5SdkVaY3kzd045alIr?=
 =?utf-8?B?R0dqMmd6WTFCWHNwb0tKY1puSE1OV2wwV2dXa2h2bmhTSStVSXNvbWYxRGxY?=
 =?utf-8?B?c2crbUhuWUNWaVdINmtUSTY2K0xzMmFYNEd1RkVEYTF5ZVVYK042Vk5GdzAy?=
 =?utf-8?B?VWFDVHVKd0wvcmVVTk9tOXhYYWlmY1BoN3k4SUNJOWJkdVpWenpEU3N0b3JT?=
 =?utf-8?B?N3phQmtjS0lSTFVSZE1RazJxQ0hOMjhIc0lsL1l4Q2tsZ0dYLzNOV3l2ZlM0?=
 =?utf-8?B?RU9mMWhmdU1pQmcxOW1iZ1MxTjNaWDB5MExSWmFxUFIvUjVnQXREKzNqZVR1?=
 =?utf-8?B?aXYxQTVWb0RPOVovQjdkaXhoQ3UvbU92aWY5bldRaU9FOFo2aDlFTm84Lzgy?=
 =?utf-8?B?cE9qN2loS1JrQk1PTlNaWHVhTlU2Y25tZ3plcEk3RW8rRzN5ZTZsWTJpa1pJ?=
 =?utf-8?Q?V7cLvDAsWoulbff4y8?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7011f993-aba8-4931-b061-08df14fc5003
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 20:43:21.8374
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9HpmV6+qT/Ggz3MdZxdb3FfglPFUu+f1ZOKF4HTpI5nzH4GeWarAWv2qOFsbbIss
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9433

On Thu Sep 17, 2026 at 3:47 PM EDT, Lorenzo Stoakes (ARM) wrote:
> Now that vma_has_anon_rmap() abstracts whether a VMA has an anonymous
> reverse mapping, remove references to anon_vma and instead reference the
> anon rmap.
>
> The anon_vma is an implementation detail and should be treated as such.
>
> Do not update mm/rmap.c which implements the anon_vma mechanism as it is
> reasonable to directly reference it there.
>
> No functional change intended.
>
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> ---
>  mm/huge_memory.c     | 17 +++++----
>  mm/hugetlb.c         |  2 +-
>  mm/khugepaged.c      | 12 +++----
>  mm/ksm.c             |  6 ++--
>  mm/madvise.c         |  6 ++--
>  mm/memory.c          | 12 +++----
>  mm/migrate.c         | 12 +++----
>  mm/mmap.c            |  6 ++--
>  mm/mprotect.c        |  4 +--
>  mm/mremap.c          |  6 ++--
>  mm/pgtable-generic.c |  2 +-
>  mm/userfaultfd.c     | 10 +++---
>  mm/vma.c             | 98 ++++++++++++++++++++++++++--------------------=
------
>  13 files changed, 96 insertions(+), 97 deletions(-)
>
> @@ -4176,11 +4176,10 @@ static int __folio_split(struct folio *folio, uns=
igned int new_order,
>  	if (is_anon) {
>  		/*
>  		 * The caller does not necessarily hold an mmap_lock that would
> -		 * prevent the anon_vma disappearing so we first we take a
> -		 * reference to it and then lock the anon_vma for write. This
> -		 * is similar to folio_lock_anon_vma_read except the write lock
> -		 * is taken to serialise against parallel split or collapse
> -		 * operations.
> +		 * prevent the anon rmap disappearing so we first we take a

s/we first we/we first/

<snip>

> @@ -1619,7 +1619,7 @@ static int try_to_merge_with_ksm_page(struct ksm_rm=
ap_item *rmap_item,
> =20
>  	/*
>  	 * We can consider the VMA only while still holding the mmap lock,
> -	 * so lock, so reference the anon_vma and calculate the linear
> +	 * so lock, so reference the anon rmap and calculate the linear

s/so lock,//

based on the code after this comment. Please double check it. And it is
a pre-existing typo in the comment. Hmm, it sounds very Sashiko. ;)

>  	 * page index early, before stable_tree_append(). If anything goes
>  	 * wrong that prevents the rmap_item from being added to the
>  	 * stable_tree, break_cow() will clean it up.


Otherwise, LGTM.

Reviewed-by: Zi Yan <ziy@nvidia.com>


--=20
Best Regards,
Yan, Zi

