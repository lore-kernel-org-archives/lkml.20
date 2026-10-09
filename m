Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012007.outbound.protection.outlook.com [52.101.53.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97E62370ADF
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 19:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791572968; cv=fail; b=ulYrc7v9X9MaEJFDWlQynpPt451QtMzUkUxsEn7K3ROXQx/2/4IDYdWH9JxjjuGBojfurDtDKzIvBB+9j5/dCErA/AsIo0G7V/wHDxiVexvu550OJ9fwnZf/GVNphrmu4UxlQzGKzI7MyNH8k57vhy/P/XIE08+KdREEAh80Zn8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791572968; c=relaxed/simple;
	bh=s6gptLRL+xkb/An/+vARSJ7RLk1GcHudbDXH3Wx+DNQ=;
	h=Content-Type:Date:Message-Id:From:Subject:Cc:To:References:
	 In-Reply-To:MIME-Version; b=Fyd+kncm7gd97/en1ti/uXKlDQdGy+MOP2fHwDIjC8ppKiwCphODKOo+WcfCGwVMaQWLQj8J2wmVbK8sJO8+MAPd8jA9gGmQfEuHISPVk9p9zcnFiDLeJWMjJU3gya5VxbmLR11TOGQfBGKi6GqSvQOje1KRwquflHzNqFbVI4o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=CuQwWlkF; arc=fail smtp.client-ip=52.101.53.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="CuQwWlkF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xy5fuby9g4v7zipgQWqJxO6JTrIVJZuXBPcsJyL5tGie+5qHDmsUJsqmliRiX7GuMWh8TvTZNK3+cnzaxyEPDGlUHS4bGciu8XRfukvD5n1YfRmXDEc24Kd0dDGll3vMhWckGsd+fMLEphwh0c5NClPIcDjmEatKfl1e1xGKVBg4ThtetmDYQEWALdUWNj0Q8AHxhLBlkshs31Gg91ldm3BWmlrQa5DgMI+LbX5oakgtcxKk7P4Xd+M11qd7IjKUJBy/x/Wnk4cc8ocyXyM2f/QdJDkMENRVpncR6GCYlEfBg7aGugvduemI3RCR69KVfzFlj9o+BFRuVgWig2CpOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UuO4z7CXxh0LjmaJRr8ob5oXJWieqzVbtQFbcZrsQrg=;
 b=CEltnd67dGFFmmABgbklmNf/eBbLomD4W7vu3kFXRgLmiUROyZuhzsLhcNUWk1QRhDN3eA39KzXFPxyI2DYEr0IK6u0XhEbwnuFSLTVbXQEGwo1AdmYsZoN16aVz2bcfXiEEdkwdFphsWHdro/wk6jv19vug9rMOiL8NOVlRI+iFSp+1yeWJ5ph0wbHDLKPnXFZnuxwvTc2JyC2F1xIWgXmYxqUe7NYFJMHdCPa9MuUZ5m9TklWtcyCOefjvuZo3w+c0mkqMIz1Pj7zNbLrP0BmipJR/cBJqYEqVTSVcjcringeijK9IW6bV8DIl4cwVGLtGl9jNf0U00wOZm4f0XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UuO4z7CXxh0LjmaJRr8ob5oXJWieqzVbtQFbcZrsQrg=;
 b=CuQwWlkF7erXx4/+wiPYgKiLWPov+/xXVz+fA8m7C0buqusH0KUJsKP0g7K1q8jSTtaFzt4InSnfF5FDGAnKeHdhg0vddPo/iBara3SLohgJ2hYmHHrieXAKc9Qlh9o9gVT+NVEyE2Txla23+YRuVbcLHFxMwuQ7rXtXikApDZtUYIfozhde1qofu6OIodsdZ4hEv1kZICm3Wrsm+AyPtYxoAXKqaLCAa4Jz76x4SEknu6OdqDis+364hROpRZTyXj+kSVSEdi4nBQmZ0uJ62ZkHtEeWmD4OGY6Pyk/uTkt2tbUjdW0DEUHpwICOACDhGt3vsVp9EwYn/pY1qc9o7Q==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7)
 by MW6PR12MB8760.namprd12.prod.outlook.com (2603:10b6:303:23a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Fri, 9 Oct
 2026 19:09:11 +0000
Received: from IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16]) by IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16%6]) with mapi id 15.21.0472.016; Fri, 9 Oct 2026
 19:09:10 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 09 Oct 2026 15:09:09 -0400
Message-Id: <DM0JLUOZEMBY.1B87PSVJZQKP5@nvidia.com>
From: "Zi Yan" <ziy@nvidia.com>
Subject: Re: [PATCH v8 15/30] mm: swap in PMD swap entries as whole THPs
 during swapoff
Cc: <ying.huang@linux.alibaba.com>, "Baoquan He" <baoquan.he@linux.dev>,
 <willy@infradead.org>, <youngjun.park@lge.com>, <hannes@cmpxchg.org>,
 <riel@surriel.com>, <shakeel.butt@linux.dev>, <alex@ghiti.fr>,
 <kas@kernel.org>, <baohua@kernel.org>, <dev.jain@arm.com>,
 <baolin.wang@linux.alibaba.com>, "Nico Pache" <nico.pache@linux.dev>, "Liam
 R.Howlett" <liam@infradead.org>, <ryan.roberts@arm.com>, "Vlastimil Babka"
 <vbabka@kernel.org>, <lance.yang@linux.dev>,
 <linux-kernel@vger.kernel.org>, <nphamcs@gmail.com>,
 <shikemeng@huaweicloud.com>, <yosry@kernel.org>, <qi.zheng@linux.dev>,
 <luizcap@redhat.com>, <kernel-team@meta.com>
To: "Usama Arif" <usama.arif@linux.dev>, "Andrew Morton"
 <akpm@linux-foundation.org>, <david@kernel.org>, <chrisl@kernel.org>,
 <kasong@tencent.com>, <ljs@kernel.org>, <linux-mm@kvack.org>
X-Mailer: aerc 0.22.0
References: <20261002095503.3585565-1-usama.arif@linux.dev>
 <20261002095503.3585565-16-usama.arif@linux.dev>
In-Reply-To: <20261002095503.3585565-16-usama.arif@linux.dev>
X-ClientProxiedBy: BN9PR03CA0297.namprd03.prod.outlook.com
 (2603:10b6:408:f5::32) To IA0PR12MB8374.namprd12.prod.outlook.com
 (2603:10b6:208:40e::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8374:EE_|MW6PR12MB8760:EE_
X-MS-Office365-Filtering-Correlation-Id: 282fbff5-acdc-429b-bdad-08df2638ccb5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|23010399003|22082099003|18002099003|56012099006|11063799006|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info:
	jdqtQyuHuqSYhhKfjG8Kj58GnsL7UrNmeZXDIPkcJfSj9cLtYiw+xoVhj7Ne2uuvm85cxEJeV4zh26XsUZhXC7wn9Z+T3rxQJq0TQ2eFsC8bC3xcQ2Xnd7ztH2uv0tu0EC1SYcLE1dlmhnOuZM2bThxB5Zmll+eYCMjRvGEZKAYyKsEuU/q5Cpb3fvgOCXjBnxGVhJADUsYrTirXtm9NevYhJO5udKZkVuP9lSElQq/23oLj2YJfOkeRHm1p3TOVclrINHsOYX/s4vk8aunSVMJukzI6lisVA0aFLa14QesN8U7VZjUM/9+kKFTu13X/HL/JQteKI7hMUYN5k4xiVTSlfTo3cexGfUjduAQD4fHUlij0eXyGpEhyzhSStRFa8e31UzAEF/LpMf+VjKHhXkjrBqNhqSym1SaeeTOEr1HNs8BgeciapYudIeeL0HcCydmWQYPML+iMBx3PVXwL0cvV9Z0lzPC5uFP/kNcID30vsUf6AB56nScyPOxjvYCU/WrCgGqVOYbFAiesF43Xl4lSIuS52fA4du4K6JaxnzeDo8SNLFvO3V0pH0ZY2OHv8qDK+xB2IqzAIWPASGZsEgjBQKAVaGvUvB8rsBGk7dz9RMOMXx5hUuZSOZRaUgEDh5Fps7qW0KrRkdDKWLF2ECROM4MpunxV1Hv9LU+EE1E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(23010399003)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bjVBRlpKL25FSC9XR3FKMFd4WC82cHE5ZjBjUEYzZGFxbzR5NklnWTVCN2dJ?=
 =?utf-8?B?N2lJNDZISTFNdFJIczl4UTR5ejNLY3ZBQXNIT3ErZWNINjRoOWxIY2NmUTgw?=
 =?utf-8?B?WnhuczZXV1J4d203SmpFL2t2d0U4QlFQMXgxYkprK0JDSlU1THRlcy9ENXZK?=
 =?utf-8?B?M3ppaVA0QmZtWGk5aVV0Z2tCbHJhb0p6dXJwVklWallKb24vVEs2MDZTVFk1?=
 =?utf-8?B?anJXTlI5MjB4L253TitjOUhBbHlKYnJDc3FrZVZlYzJXT3B6TVJiY1BLYmFL?=
 =?utf-8?B?Wm9FOTNmY1g2NDY1NlQ0Rzdqek01SDNPRVN0Z3ArbXZiYk51VGFtazZ1RUR6?=
 =?utf-8?B?N3gybFd6N0pWT2dnRitvek9yZy8zaVZON0xrRDIzYUY3N1ZUL1lidFE1cFdw?=
 =?utf-8?B?aWRsNGdyUHVhM3NLTkt4VEl3cGkyYmxuSUhraW9OcmlsbkZQVTI1QjNlWUpj?=
 =?utf-8?B?MVdLOFZ3RTJ1NUwrZ2QzbE9kczhOa1RCSVFHT3NXbWZKYjBnRE90VWM1S0FU?=
 =?utf-8?B?bDVCWjVrUVRnb3BUZEVhMTFWbU0vcFBtNkphM2htaTVNUkZSNUF0aTNTamxy?=
 =?utf-8?B?bHV1VFNlczFlZzBvcDEwYk1ub1dYRjRZdW9idmVYMHRsUTVyMDlSdU8valFr?=
 =?utf-8?B?YkF4NWNIU1g1NUNlVWxxNDZZSmkwUnRhUFRINFc3YmJQdHNPcGRwY3VhdnEv?=
 =?utf-8?B?QjA0OCsvYk8wWXd3MHdsWklVRXZSL21GZkxzejJicGJTNFZZaW8xV2dBTjdC?=
 =?utf-8?B?SXZmYjJ3dGUxbkZFb1lONGU0Q0ZrMjd3MGUrbkoyakovUE1LcXRGWmJBdUNP?=
 =?utf-8?B?b2JsUjRtZ2NsUmxNeHMrSmp1K2svdnRxUVllRnA5RVpIZDdOZ1cvaDNZLzJi?=
 =?utf-8?B?ZzVrR3VZbytxaVNWNTh4MnhabjhEbGVlMTJYRnREamNyMWMxQ041OVZoWDlw?=
 =?utf-8?B?amFrcHVIQ3dZNCtXVkRCdkowV29FKzZiRDhRSlFMZDhnemhSK1NSN0hROFk4?=
 =?utf-8?B?N29ma1A1dmpLTCtqWEtpL2RaTGNLYVlQc3liRkNjZ2Y5YUowQnIvYTIwaVBC?=
 =?utf-8?B?WnBwSjRSelY3bW5xUGxWMlFTZVB4Q1hsNURhNGVwVStMTDhhT1BISzhiTlZp?=
 =?utf-8?B?SzlKOW9sZEZUbmcrWERiK3FJSytTeDYyOVUvU21OL3lCYW11T3NaYlpFY2Rk?=
 =?utf-8?B?ZG5aWU45VElvdFFXdlFhYk5lYkZuc1luK01lM0R3dUk2eEZseUhXTUN2amhi?=
 =?utf-8?B?bDIvZTRRT0ZnTnpTUkFBNlQ4bEV1bGxUWExtYkZSWW50RnROT3hkWnIzU0pT?=
 =?utf-8?B?Nkt4R1hrUWU2K21DZXJFY2Z1UzZDem1FQmZWcTVCR3k0dXIzRmMrZjI4d0E1?=
 =?utf-8?B?WXk2TFRTTG1Kb1BkQ25QenJsY3F4RS91WDNxaEJOUjJjTnFWOWZROEpLeHdk?=
 =?utf-8?B?dldyOFZ5eHVHaUUxbytqc2w0OVU2dURoWXlaWHZNWlFHZ3laeEh1eWp4ajkz?=
 =?utf-8?B?NjlMRG9SZGw1UWgvUmtXSU5jN0lKWWxjaGgvUGdvWFlpUnphbjU4V2gyMWZn?=
 =?utf-8?B?Ym9NVmYyK3JSci9wMEVHNG5LVmk3NXZwM2lMWm1zNkVHYUQvUjdzclZzVEhD?=
 =?utf-8?B?dDdzMHRxRk1wS2hlZmJwTFM4d3MzQ096NmZQTFR6ZjVzWVJUN3QvNCtSclBO?=
 =?utf-8?B?cDl4MmdSMHJ5SWtRTk14TWEycjhjdXhJVmNPUU96WHhMUFNrTllncGptY1V2?=
 =?utf-8?B?ZndPRjJyeVNEdU9GY3FiTGtReHFoM2hCWGNrS05zaUtPNDYrUldIQTJUbjBu?=
 =?utf-8?B?OGlDQ3lkbVVSbEZDbWFjY01MUjVGa2hvZTMwcnhtdjYyanlERFExaHhwQy9p?=
 =?utf-8?B?OUt4R29tdVBrdjNSUHNHeXFHS3hjYjVMazlSUTNmRFNZR1AvZy9kNWZHTU1v?=
 =?utf-8?B?YWNTb0t3VmlZUXJ4STFObDhYbzZuYnpJQUdISTByY3VuNWREZjAyTFlFdm0w?=
 =?utf-8?B?ZmRtZDZrcjlsRjZPNW5iWXgyT2Y3aG1YVFdNZVl4OEZacVZoektqQlR0MEJR?=
 =?utf-8?B?R3d0YStMMnMza0xMUXpzb0JMcnFGK3FTQnNLV0RCSTdrZW05MHYwQkFueUFJ?=
 =?utf-8?B?Ly9Pd1Evd1dzVTR5eUNzbEtlMmlKaElEbllTbWY3c2pYelNFRVViU2xWV1o1?=
 =?utf-8?B?eFh6Q1BsQVBpRnRCTFNvd0hhZS95L0FXeld5NlFjc2FEaXBiWkF0aUcvSGxW?=
 =?utf-8?B?SXdDeXFWSFhhMno1NHBBTm9FdDFucUlsQU1INDlROVFKa1Z3WExjcHBPNXNm?=
 =?utf-8?Q?5bQSoeIWTHDhTpUYIn?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 282fbff5-acdc-429b-bdad-08df2638ccb5
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2026 19:09:10.6390
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4tJTOgt83C1+Lu3f8IMAXPe0+5+hRfHIOZUGVFE7skv47HIbzJa9UEvTcmUUfHzj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8760

On Fri Oct 2, 2026 at 5:52 AM EDT, Usama Arif wrote:
> swapoff walks every mm and faults every slot of the device back in.
> unuse_pte_range() only understands PTEs, so a PMD swap entry would never =
be
> found and swapoff would never complete.
>
> A PMD swap entry is a compact encoding for HPAGE_PMD_NR slots, not a
> promise that the swap cache holds one folio for them. Add
> swap_pmd_cache_lookup() to classify the covered range as empty, one
> PMD-sized folio, or already split, and unuse_pmd() to map the first two
> cases back in as one THP, preserving soft-dirty, exclusive and UFFD state=
.
>
> Everything else falls back to PTEs: a split cache, per-page zswap state, =
a
> failed PMD-order allocation or read, or a poisoned subpage. Check
> PageHWPoison on every subpage rather than the folio-level flag, which
> memory_failure() only sets after taking the folio lock.
>
> All the fallback reasons are observed without the PMD lock and possibly
> after sleeping, so they share one exit that re-checks the PMD is still th=
e
> entry we were called for before splitting it. That exit also drops a foli=
o
> that is not uptodate, or that has never been mapped, from the swap cache:
> the PTE path cannot re-read the first, and would add a single-page rmap t=
o
> the second.
>
> Signed-off-by: Usama Arif <usama.arif@linux.dev>
> ---
>  mm/internal.h   |  16 ++++
>  mm/swap.h       |  17 +++++
>  mm/swap_state.c |  44 +++++++++++
>  mm/swapfile.c   | 189 ++++++++++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 266 insertions(+)
>
> diff --git a/mm/internal.h b/mm/internal.h
> index 05179c4b2090e..ec7f007bc2c0d 100644
> --- a/mm/internal.h
> +++ b/mm/internal.h
> @@ -24,6 +24,22 @@
> =20
>  struct folio_batch;
> =20
> +/*

A high level description like below might be better.

Check every page in a folio for HWPoison flag. Return true if there is
any.

> + * Unlike folio_contain_hwpoisoned_page(), this does not rely on the fol=
io-level
> + * PG_has_hwpoisoned, which memory_failure() only sets after taking the =
folio
> + * lock and so can lag a tail-page poison.
> + */
> +static inline bool folio_has_hwpoisoned_subpage(const struct folio *foli=
o)

s/subpage/page, IIRC, we are moving away from subpage.

Maybe folio_has_any_hwpoisoned_page()?

> +{
> +	long nr =3D folio_nr_pages(folio);
> +	long i;
> +
> +	for (i =3D 0; i < nr; i++)
> +		if (PageHWPoison(folio_page(folio, i)))
> +			return true;
> +	return false;
> +}
> +


--=20
Best Regards,
Yan, Zi

