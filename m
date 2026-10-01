Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012054.outbound.protection.outlook.com [40.107.209.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1641251CF79
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 15:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790869085; cv=fail; b=HuekYpRsslQgvF12do/Eg1TGZAYzP5rUoS/rdkYACemCCArNG1HE2iemTrNuCT99pfSUW4Scu/VIjFVITxyFnoO/ddQwU3IVyD4Fv+WbaOlA9eNLjBO4HtMm/KQmpfS7Zn7Y4rg6aFOBL78PePniUeJoOuX26HJlxkrXA6OYwJo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790869085; c=relaxed/simple;
	bh=HAEPWaIgvC0Hhu8gEdjvWJHeBFk8NTPBWWehzgFo+WA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gNRvWribYQ8BMSP1G/PE5F37V1ntLqmi2O21C4BDxuRUkj9ZfU8Ciq/gTrxVa9YWD0XzNS2GFUyuaIY8j8o5DE9ibKCTFyKqUgrqtnPAk/5IXUvkQu6fZnQCjoIxU0UE2NbdsBpB84p1lHVAqB6xhHcWBar31/cTed7A77Bxlks=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=A/l+V99O; arc=fail smtp.client-ip=40.107.209.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="A/l+V99O"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VG9SZq2CkLpzGgSp7fMmVrT5ivPpz7w++WjR2ra7lM637iQiTRG56iQoQznrtQFsNEI2SjaT/mxYkAUKGwsAUFZqa30hsivxINenuR70X/X1oTVjRcvjvYR8tX1+Ow/w8sEWftCJaUtpqMVu2eoHmZvMMQmZL0TpEwXW4/oWpFV0nyStAeB+CBTOVaoF9YMlh+CD8p+OwzvSoX83P8LfNk2Xrfg6eHE+brwkcSTisPf4GZsT51aLsiGHDs2LPZyOGiGCpMGCV60lraYfSZ3gZO9B60PJecNwnoQhFBpuOxBOvLvhXnkl9HXAda502sOWw5rQWgyRILx0P3vDPjWndA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=946lhAQKkOAoD2MPoFoRW1VH/wfvmI78wdReVbODwfs=;
 b=AjmwlQc1namoqYwip5GEh+IhAiefgE7UKhj1o+pxgS7PAsiae+RmaYB8HtL185HvIKALdF+F5eMnKKXhLyhKWY3XXGFha17NIQg5SOe+B1PfG9EAMRqA+9Fxkk+VUfrt4F8fx+XOz8i4wNc9calDSooBirB9ejANLzWggbssjQH+J/zKYO6g21kW+KiSZJCP/1nBsi+M6oqtNAj6NX+MT8X+LmgHBovZy2Qa8YeLk82SZnKjzUD0hB2sW/fEG7bkda62HHLANU06B7uvGU1W4amX5VYl/9n7E96HbU/0jsn+HJKJTnU6lzFvRVJeBOBssIfFsEXl8/tFrTJ/yVEEew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=946lhAQKkOAoD2MPoFoRW1VH/wfvmI78wdReVbODwfs=;
 b=A/l+V99OwPIQtwoiWsSg5miNjE4+JfVf7L0adEz/29NJkNuSheziLvqXAt1GmVUDL+teqAow5A/yomFAKQ6aBNMBBkkfUgIVsYY7/D6dKNIKqg7ChA2Cx9ZSCDAAO4Olh0TNc4qrgCE2n/CjJ3bp0ACYfRj2XQ5R9ir9CUw3DGiqtatGv3G4iWu3f8Cuf8qTnmz5qjMj5CGm3G0FBRFSsDPYdRMhHJJz1rZwV+jKca2GrvPYkk9Y51gC6D7iUaYir5zWLJZ1WkQCSuhO2HB7gYhmWP6LXm7ipoHc9SYoS3Vkqj+LuOvVElTau5RMJob1cCLgHNJ0lMAZUdOhcCK3Bw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7)
 by IA0PR12MB9012.namprd12.prod.outlook.com (2603:10b6:208:485::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Thu, 1 Oct
 2026 15:37:52 +0000
Received: from IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16]) by IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16%6]) with mapi id 15.21.0472.016; Thu, 1 Oct 2026
 15:37:52 +0000
From: Zi Yan <ziy@nvidia.com>
To: Qiliang Yuan <odys.yuan@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Byungchul Park <byungchul@sk.com>,
 Gregory Price <gourry@gourry.net>, Ying Huang <ying.huang@linux.alibaba.com>,
 Alistair Popple <apopple@nvidia.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/migrate: look up consecutive pages together in
 do_pages_stat_array()
Date: Thu, 01 Oct 2026 11:37:51 -0400
X-Mailer: MailMate (3.0r7032)
Message-ID: <4CCA725B-9CFE-4ADF-AE8A-59D6ECA4321F@nvidia.com>
In-Reply-To:
 <20261001-bug-mm-move-pages-stat-batch-v1-1-255b7e915744@gmail.com>
References:
 <20261001-bug-mm-move-pages-stat-batch-v1-1-255b7e915744@gmail.com>
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-MS-Reactions: disallow
X-ClientProxiedBy: BN0PR08CA0020.namprd08.prod.outlook.com
 (2603:10b6:408:142::8) To IA0PR12MB8374.namprd12.prod.outlook.com
 (2603:10b6:208:40e::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8374:EE_|IA0PR12MB9012:EE_
X-MS-Office365-Filtering-Correlation-Id: eb96d3fc-9300-4b18-aade-08df1fd1f4e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|23010399003|366016|1800799024|22082099003|18002099003|11063799006|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	znOFs1hCriyvGM3OR5s2QH7Up2N7ROQrrdwRc0N6X6NB3Se0+wuWzuCUYaROVGrgjqGar8NAGcx2zYyQdUI4gXVPoDU0C4NOp5aikTqx9ayKb+K6HCSPFnxGtmfjo8PJCz4Dm3VWvppAakSP4ULQyRP+YcpMuABlwpqQZ8p59w7l8AWgkQMmRdBJRf8NQaA+WlnGYU6g6jhEOTjohVm+zSS1iSfB2nTkEVVGX7WTEgEPPJzHTGcoaMb4+iR3WZpTmKS6AjBqTtx1H7ZZJCRjrvTyd/f4a4Zx5bZU1qKHPhIrkeK3h5T6kwWkEbA4/qtaV05eZiulhxxyZcGApbeVMCAdgyyd6vpTKCjMgy8bOOTP4JLxWu1P8cIDBwvsPUyoC/6sCKVK18vshxoXKuUCyj0k90hUH/CLXQTxs/LK+o38Jco+79/aG7LrG8EauY7/NNJIKbKsZgmI6N3xSiRemtRWXnma3WSga1niv7UL0fTqQpAGXR7qZfjScnymPzAtoLeAaTBwbvTnNaqGFIIiyfoocYuajlquzqFs/JcA6QlOX5sYtJsgqR6NgoPQFU75nmghm9DKEoYuqs0FzaxVajlo8i0wvaxDQmsDChJBf3gqUMft1JXp28wstInuWXHPJ+msS3CT6HapJW7ednlIGnYdE1U/vw5rG698UDVhS/0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(366016)(1800799024)(22082099003)(18002099003)(11063799006)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uskLRyniGnh7ZwviOG3mxz0ODfX+PlaaJINdEXJ7inofIb2j2ycA+68keI2f?=
 =?us-ascii?Q?aT9Er7NXgEhIDXKjI5AubRCLDgykTVhvnjfcsUOOdrKa3tRGJGa6Hjo7q4pf?=
 =?us-ascii?Q?7htTvi6R/7SI1smmG/3YUoJvooxcccBU5uN/ngDcCy4PiDun8izynvkwbdVx?=
 =?us-ascii?Q?7SS0SCujX0l4Io5OoOGIXlasexzYx9cCfiUhS3/xLdcyPpxGSqx2x/hokplZ?=
 =?us-ascii?Q?dz8TRAPHA0NotauA8MBje+aOFRFLuZ7U9xP94CHtAwm0uPVbm0c8xqAjLhXN?=
 =?us-ascii?Q?I7rZA1qew9jSmhkuvCD6zDmDjqgokrHuORbCMYJ+cKgOc5Sto63EojvggSd6?=
 =?us-ascii?Q?jwMPtqfuWXLzjGatjQPBzAFK04XTGtS4rH2yLiJ2DJ4OwMlZSrRPoSvstphs?=
 =?us-ascii?Q?pokTvE442nbQIoj2zHv4zD/CyErlTvrqsNWaMhbYRkVTGqoolEA2uyVWiBEq?=
 =?us-ascii?Q?zpX2Fxpv4nlmiogzaZqbRIhWB9ZhdY4/72dPD43cj5A1SMU1PJCMpdBWbUMW?=
 =?us-ascii?Q?IARL2sZFSKyRpddQ/pwlEXRijNTSs9IAr/ADdjcl1c2xLZcvb4+gD/Gv0ife?=
 =?us-ascii?Q?rDWdyWvGVFWvl+4EZcb6J9q84qXM0TUWREh/EL+waFe+BVNpnWyhJda6iCmP?=
 =?us-ascii?Q?zcmqF8iiBCDHtD+dk8YJF0LMPsHzG3xr91XvbCC8iD70eUmMR5NyCMrDrBbl?=
 =?us-ascii?Q?aTya4Mg8yqiDLpJg/F3l+sqyND09e3kloBfHMIk8hi+A8GmlDwZUzWzFVLvD?=
 =?us-ascii?Q?/Q+W+PVhhWA0cTdJebu6x3T1zJHTqapsLg1gz0XjqPXWwz0KZWGxQbWJiKDo?=
 =?us-ascii?Q?MvvGjMzLxSmDQXNvoaic1hBIDl4czZ+ye7XHfQ7Iwi+F3797AU/OCNIY8kd5?=
 =?us-ascii?Q?vJh/T8tcJ1SRLd3q2QvBXIZLuNFuA9qTRbFVQChhEOkQbO7VwQPzpjWDYsB9?=
 =?us-ascii?Q?mc4O+nE1nSFbKey+cS7EKL4igxxCYiSBWF4cIbC4wue504vf/WbKudSHHIsk?=
 =?us-ascii?Q?PIMnh73t2g0IIYQ4GicYs1QnFjdN4TyB1IfNilbpA+OWbo1e3LrwG/3j/9i8?=
 =?us-ascii?Q?xxrIcojdz9QPyFc/VaYgoIG+FQY95rB0/8u3i/uAhUOH7TTU8jA01zh2YYIj?=
 =?us-ascii?Q?II6mUZuuP0rnDzBwBJ0AxzRUEAxHcikW3NryXQCNUD7CtSK/oYq4xmuiB65i?=
 =?us-ascii?Q?fMMsxQjdNel1ip8K2kLMPEqlcB2+eGP67WP6QUi7KgurH0mp5plZqmX1meGo?=
 =?us-ascii?Q?qviYeT9e9CcmTMu6jJEgnP9QNjaLsBvgN9e0Jnn7nuIV+BqNY+ce+al2ywTL?=
 =?us-ascii?Q?QaAruXBBk2YpWyht9LFKqq2X/3kSZHbsgJYd2SHjfLMmF4hSWOxbGfIdHf6e?=
 =?us-ascii?Q?4QYPRBhdojyMSHJYm5KYNpT4YYVB1k6v65L/hfUUDZzluDS7r3/K42uIo+CT?=
 =?us-ascii?Q?7iiEi88zzJziOyIM6rw16Ng35gBtVMAJdOboFZ64kLnKAWGp55ZHbag277O1?=
 =?us-ascii?Q?Df24OT5AOW9Bf99jAC2OSiqQ2n4fh/jB0v49BkzClDSV8LdijtMFlzvaqPEM?=
 =?us-ascii?Q?IvL1tb62ZkuPVn8U19mMRO6ace6NlidL/3pH/dC8NnwycZB6QdK3oRsO4j1A?=
 =?us-ascii?Q?J3uv9KyjkXOL6e9GQrVcpsOrE6NOutk3U2ti/zS5qZzOq2XFD+49rXXyM1st?=
 =?us-ascii?Q?kTF6u5EEtuEq9bC2PZdLW5a+ODeva8SBpGa9iZYSV8jUhr7I?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb96d3fc-9300-4b18-aade-08df1fd1f4e8
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 15:37:52.8319
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W8QQNZ+tRW/6l5UfAS/uKX76zyQo190LwWqBnspwPFh3koCFkfJqSFB53CUAKq7v
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB9012

On 1 Oct 2026, at 11:10, Qiliang Yuan wrote:

> move_pages() with a NULL node list reports the node of each page. RDMA
> and KV-cache transfer engines use it to find where large registered
> buffers live, querying every 4K page of buffers that span hundreds of
> gigabytes.
>
> do_pages_stat_array() looks up the VMA and walks the page tables from
> the top for every address, taking and dropping the PTE lock each time.
> That costs about 105 ns per page, so a 16 GiB buffer takes 440 ms.
>
> Callers almost always pass consecutive addresses. Reuse the VMA while
> the address stays inside it. After folio_walk_start() locks a PTE table=

> or a PMD-mapped folio, answer the following addresses under the same
> PMD from that table or folio before releasing the lock. Other
> addresses still take the existing path.

Instead of adding customized batched walk code, it might be better to use=

walk_page_range() + pmd_entry callback. See mincore_pte_range() for
reference.

BTW, DO_PAGES_STAT_CHUNK_NR is limited at 16, so the batching benefit
comes from 16 pages instead of 512 pages in one PMD? I wonder if that
limit could be raised and how much more benefit we will see.

>
> On 7.3-rc5 in a 16-vCPU VM, querying every page of a populated buffer:
>
>                        before       after
>   4K pages, per page   105 ns       22.7 ns
>   THP, per page        92 ns        13.1 ns
>   16 GiB, 4K pages     439 ms       95 ms
>
> Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
> ---
>  mm/migrate.c | 83 ++++++++++++++++++++++++++++++++++++++++++++--------=
--------
>  1 file changed, 61 insertions(+), 22 deletions(-)
>
> diff --git a/mm/migrate.c b/mm/migrate.c
> index 15b45832bcfa7..5f470dc7dc746 100644
> --- a/mm/migrate.c
> +++ b/mm/migrate.c
> @@ -2451,44 +2451,83 @@ static int do_pages_move(struct mm_struct *mm, =
nodemask_t task_nodes,
>  	return err;
>  }
>
> +static int folio_stat(struct folio *folio)
> +{
> +	if (is_zero_folio(folio) || is_huge_zero_folio(folio))
> +		return -EFAULT;
> +	if (folio_is_zone_device(folio))
> +		return -ENOENT;
> +	return folio_nid(folio);
> +}
> +
> +/* Look up a PTE in a locked page table the way folio_walk_start() doe=
s. */
> +static int pte_stat(struct vm_area_struct *vma, unsigned long addr,
> +		    pte_t *ptep)
> +{
> +	pte_t pte =3D ptep_get(ptep);
> +	struct page *page;
> +
> +	if (!pte_present(pte))
> +		return -ENOENT;
> +	page =3D vm_normal_page(vma, addr, pte);
> +	if (page)
> +		return folio_stat(page_folio(page));
> +	if (is_zero_pfn(pte_pfn(pte)))
> +		return -EFAULT;
> +	return -ENOENT;
> +}
> +
>  /*
>   * Determine the nodes of an array of pages and store it in an array o=
f status.
>   */
>  static void do_pages_stat_array(struct mm_struct *mm, unsigned long nr=
_pages,
>  				const void __user **pages, int *status)
>  {
> -	unsigned long i;
> +	struct vm_area_struct *vma =3D NULL;
> +	unsigned long i =3D 0;
>
>  	mmap_read_lock(mm);
>
> -	for (i =3D 0; i < nr_pages; i++) {
> -		unsigned long addr =3D (unsigned long)(*pages);
> -		struct vm_area_struct *vma;
> +	while (i < nr_pages) {
> +		unsigned long addr =3D (unsigned long)pages[i];
> +		unsigned long next, end;
>  		struct folio_walk fw;
>  		struct folio *folio;
> -		int err =3D -EFAULT;
> +		pte_t *ptep;
>
> -		vma =3D vma_lookup(mm, addr);
> -		if (!vma)
> -			goto set_status;
> +		if (!vma || addr < vma->vm_start || addr >=3D vma->vm_end)
> +			vma =3D vma_lookup(mm, addr);
> +		if (!vma) {
> +			status[i++] =3D -EFAULT;
> +			continue;
> +		}
>
>  		folio =3D folio_walk_start(&fw, vma, addr, FW_ZEROPAGE);
> -		if (folio) {
> -			if (is_zero_folio(folio) || is_huge_zero_folio(folio))
> -				err =3D -EFAULT;
> -			else if (folio_is_zone_device(folio))
> -				err =3D -ENOENT;
> -			else
> -				err =3D folio_nid(folio);
> -			folio_walk_end(&fw, vma);
> -		} else {
> -			err =3D -ENOENT;
> +		if (!folio) {
> +			status[i++] =3D -ENOENT;
> +			continue;
>  		}
> -set_status:
> -		*status =3D err;
> +		status[i++] =3D folio_stat(folio);
>
> -		pages++;
> -		status++;
> +		/*
> +		 * Callers usually pass consecutive pages. Answer those that
> +		 * fall under the entry or page table we already hold locked
> +		 * instead of walking the page tables again for each of them.
> +		 */
> +		end =3D pmd_addr_end(addr, vma->vm_end);
> +		ptep =3D fw.ptep;
> +		for (next =3D addr + PAGE_SIZE; i < nr_pages && next < end;
> +		     next +=3D PAGE_SIZE, i++) {
> +			if ((unsigned long)pages[i] !=3D next)
> +				break;
> +			if (fw.level =3D=3D FW_LEVEL_PMD)
> +				status[i] =3D status[i - 1];
> +			else if (fw.level =3D=3D FW_LEVEL_PTE)
> +				status[i] =3D pte_stat(vma, next, ++ptep);
> +			else
> +				break;
> +		}
> +		folio_walk_end(&fw, vma);
>  	}
>
>  	mmap_read_unlock(mm);
>
> ---
> base-commit: 551c722f40809618230001baccf219193e22fc5a
> change-id: 20261001-bug-mm-move-pages-stat-batch-f62a29ea5867
>
> Best regards,
> -- =

> Qiliang Yuan <odys.yuan@gmail.com>


Best Regards,
Yan, Zi
