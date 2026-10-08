Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011055.outbound.protection.outlook.com [52.101.57.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43D7C27280A
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 02:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791425229; cv=fail; b=kXNzrYc1dKIKuhF608Lnxz1g7vIevRtz0/Qh/W3SDPcJ9p+kWaYtDLHCjXDPO5tHUDi0hP1mnyDRGnICrwAnaCbKbSJpYfGI9LmAmV+9ramdRW4KIpiErCtF+P9hkGTiJnWDzl139dF7LB0dj0QnPpbvkkXiB9rKiAHj14MLf90=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791425229; c=relaxed/simple;
	bh=o/DEgSwgBfv/dxMN9k06q3UWBXdVlpeVghtN6Jm+MOc=;
	h=Content-Type:Date:Message-Id:Subject:Cc:To:From:References:
	 In-Reply-To:MIME-Version; b=an3FXaj/yWj/YtqSBtKz3R39shi3vT0v+NOqOUX5FWj6J6uf2/tC6i3jOu7raDO33I30cUdxKmBbks2j7gBu7Tu1OpkKs55/pvArA/wPpp7FMKzZ8syeslthUMJSgqWy4mE+y+3TgtKJdyGmA8bQTtav7fNBBUDQDU3978/SAuQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=mrYcOevl; arc=fail smtp.client-ip=52.101.57.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="mrYcOevl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xZCcnAtOSg3RhikVbNcEkwYzhPy2yYSUEOI9wU3INkjN42/dCdZkUiQfLHnNPZTi6DSMvqYFhYdo/VC/rFVWFpfkSrAx6pJ8ocQ9269g0vCfeqinLez/7NxD3ToRyC+LKKDlrv1MBz+wyQxDQCIbn+Un2iAKDV3MblXPM8jKBfsthZWF7yN4SSQQaDknt2sY/uGyLy5ph+5t5MHztgqbGz1nN1KII2iEwmDMMVE4Zp7ZPnk3LLCA2COeT5yFlOyc/5K9jXpjOjHaHqFVQGeCbACWvMxzjLASyxpKVMtEok8a6LJTiQMXJviXJ3gIWMnNXtvumeWkqvKvPlvHyAzX+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O+YBDccGqt/rMwXZF3YYWkdQXRmPCs/HX3Bzj33hv4U=;
 b=cqJlZvyQOdsIl8ONujnjFigznv9QRICTXVgApP1rPkpjhdtjK7QvqOWkcGdI215Pm3sVqq6W+8hbRxziiYPYxxfSObTlYeIGhODh05JeN1J5rgGN9IbnvyA4z3m4Yi05CqiuLjM53SlINx+Y6QAGQ2tOSRBI/Rgq6RVd6C7BvC4U1XXsF4yrB2UhE7hjwxgHC2OeD1/ueFwa8Zs3yRQn3ngWefYrN35RF/USz4Ak0anV5Z2SB3sEeSfUoYB/23zLK0YFOirRwVYZJU6R2SfIiQyKD788oXe2BqzMyGwbNaqdLNiBAEdn/AJadsoDzNmaOWLx99yA860Hds19X7q2iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O+YBDccGqt/rMwXZF3YYWkdQXRmPCs/HX3Bzj33hv4U=;
 b=mrYcOevl0Msid7SaL8tSaxrtVSMQrTIpxFpxLHxzH0UAGn6zCVRxC+Ee23aJIPu6QnNnPZq3c5OQLMUCwFXmEo3hE2loKDEP99dHHfXQhQCd9k671Eem7DyfxpB4yANxhwp/PSZ/KOhcF9XIjtSYL3a0Pa58hs4+V8LcDwPGa68BejboPvt5urWslT4wLHvgqTbi+uqduTYUBykgnOuSdbUgKRvXOiF5ehavEqLBW+ph9Zd8aYlVyW/YsUErVaVmByhNLof6ov8UI5geqDLGbY8qq7SRm69eOVlBWt2BOBLrSv7HEUfJ/FWkh1Q/uzJm+v6AUuQe1Ocfbq+JSA3Iqw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7)
 by LVUPR12MB999135.namprd12.prod.outlook.com (2603:10b6:408:3a1::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.15; Thu, 8 Oct
 2026 02:07:04 +0000
Received: from IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16]) by IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16%6]) with mapi id 15.21.0472.016; Thu, 8 Oct 2026
 02:06:58 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 07 Oct 2026 22:06:57 -0400
Message-Id: <DLZ38NR21UU6.QIKBG8SO7189@nvidia.com>
Subject: Re: [PATCH v8 08/30] mm: recognize PMD swap entries in the softleaf
 layer
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
From: "Zi Yan" <ziy@nvidia.com>
X-Mailer: aerc 0.22.0
References: <20261002095503.3585565-1-usama.arif@linux.dev>
 <20261002095503.3585565-9-usama.arif@linux.dev>
In-Reply-To: <20261002095503.3585565-9-usama.arif@linux.dev>
X-ClientProxiedBy: MN0PR04CA0029.namprd04.prod.outlook.com
 (2603:10b6:208:52d::34) To IA0PR12MB8374.namprd12.prod.outlook.com
 (2603:10b6:208:40e::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8374:EE_|LVUPR12MB999135:EE_
X-MS-Office365-Filtering-Correlation-Id: 0aa913c3-afa2-4e99-6c15-08df24e0d5b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|7416014|56012099006|4143699003|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	RsxxRqQlzIp/qSg3z/N9zATazEVVx+axYlkX8oioseERAEcKqQvGnFds3NE9OY4Ep3M9Kgwu8mb/GWu9fy3yp/FkkWcOXGqHAPFQKsF2PGDZbnhC0e6baKUkWoGbB3voynqD0vqO65l9AEUj2HtQm69LkU1LKFY4H1ipVACZVrmvEHYDcw7Yas2EJkIiH+OAwFpZZuHeSqHEIvR1WXFUk3npLipt3N6YYHxiZgJzuFFESlAGdr016tQFrPKXcy6+o7nuRJlcLOo5SH5fsEBCn2HqokdXgcvwz9Exy7+Zuhha1L1RUQmH5IEJiIKZ4A9s19eRyu7YLvVlz11HQWCyBLnquKCxku+JKjFg7LpPGxpH8/vLp8jQmBCAKqWE3YxI0UFEaWb09CT5N4A06E3/ukDuK85Y/H/V51kCOMVhBRgLJZZ884YT0J6GJqP7qv+/lNnWqWgW3YmfprIkIvYnUyhQDCnrOb4CTER36HIMCPjprJSIGLdHTjOhKKlROVcGOwGYIzU0Gv2+NioD4sQDBDvbUA0qj7rYoDuVAA9FgGGL+8Q7OfGbCYukIHH0fQR6jxw3/UjrQG5swv7d4zXGAOUKFLDbV9UrTSSuSsy+eRs1lmabDHOMl3Tqq9M7f+/1jkZRVp7G29kTsYC75MgChWNcuNS96lrpWGilkfC76WY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(7416014)(56012099006)(4143699003)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RyttTjVTVVh1aUhONmdjaGpYM3FxMmtLOEgrQTNuOHBxVmZwUTAzQzliR1BB?=
 =?utf-8?B?VXEwOThLYTVLZ1E5OUM0QnE5VjNNN2Q2Y0ttQjBYSjhwMHY4SVUydkFiMUxr?=
 =?utf-8?B?dWplT1Z0S2poWWU0QTdqSmdjbTZaUURreTFMWlZKNEtYaXBtZjdCM3RlUWp3?=
 =?utf-8?B?b2JUZWhxQ1ZGOUs5aXFvME1nWWlDeVlkbW9BMmhYQm9SdlZjU1BWb0NTeFRW?=
 =?utf-8?B?SnQxRy84andCdGI1cFh1V0hBK1RNQ01wSGUrMDVGWkJPWHBOU2ZKT0NxRExX?=
 =?utf-8?B?YTNvS0tEajdFdFVOd1MzMldHWnkvSTZPaDhsclFUSW54M2x6NmdHVlFra21P?=
 =?utf-8?B?ZTFhQlVSVHc4em8xalZ0MXdTbGNscUZFUmtISlBOYTZiU0VLM1pQRmh4QU90?=
 =?utf-8?B?VzcvVlRGSEhzVWE5L2g5VDBKdzhVZHBJTE8zOUFzdHpNaC9Za1k3RG93U1ht?=
 =?utf-8?B?RHZsWEVyWEVDL1BaOGQ1czloQ2NyTkN5Mm9mQktOc2lCWXJNNnBOSU1OTFF0?=
 =?utf-8?B?YU5talpHQUY3V0lBTmtRTjZrK0hZRCtYMXgvV1l3MFN4SUpOQ0hkVUZsTFZi?=
 =?utf-8?B?OXBZaTZldjUvb2NmdStZbzBwVmhtZkJjMWdqOGF1TDJEcm1jRDNWdkhFMjJz?=
 =?utf-8?B?dVVvdkNVSWtNbVZUQ0hLWGpVTExwRGJuV1lIejNFN2V6bEMybTROVVpMeTNn?=
 =?utf-8?B?ZGYveVlLeDJ6USsvM3NnUDZ3a3hERGxNOGgvbDZNN2ZjYVFjcWlab1U1Z3ZB?=
 =?utf-8?B?ZjNGdUI4U0lNMXlVZ0RVakg1OGI2bG5INWkyZEF4d0o2K3V4eXc0dXpXWkV4?=
 =?utf-8?B?M2d1eTFnUGkvZ2dyaWRsemdHSmJyZlJGRGpBVjVhQVlVeXhlMHZJSjFaVm8w?=
 =?utf-8?B?MWkvWlFKV2tDcW8zOWRNWGx1b1JaNGxWVlltT3RBQ0tpZ2lGbVpKWXkrdkxJ?=
 =?utf-8?B?ZDVZT0pJM0w3SEtXa2JrUkJzL2VuSU5KZTAzYzNhVjlLL0hmM0xNQStMN3Yx?=
 =?utf-8?B?dmlDOUNtemhmbWxXeGpmUkNQdGJLUUZ4NXJPbzFUdmcvWkRwd1M2OVY0eE9j?=
 =?utf-8?B?cGI5dlBQSXdrWll3VHRtaTRZTFlYS3BBZWJvclA2TiszaEhSSVl6blV1b2Qr?=
 =?utf-8?B?ZG1UOFdRYVBLYTRMaXVoYk9XRE1yOGVuVDFxOXkxWGppbThleHhDazk3YmJw?=
 =?utf-8?B?dzZIT0czc3VWeWpwNXhaYjRnTDR5Ym03dGIrV3k4bjNLVkdPME40M2hiSmNo?=
 =?utf-8?B?TzBjbXBhUnlhM0FMQTJKRnpPVFpJYXVOSXZXT1d5MnRZdXhoTmhncmJNSDlr?=
 =?utf-8?B?U2ROS0tzeGVmMVpZOXZqMXQxMmlVVVBMQkVheHJnU0t4Zlk5QlVUQi85UTAz?=
 =?utf-8?B?NW5LSENKU2V3dVRNRVM2TTNETjBHdFRkMmJBWTc1SjdCNDFISk9YRWFhd2tO?=
 =?utf-8?B?NDdhK2NBbE5CRk5jak1mMWlnRk5GK2VMVDJnb0F4d3RiMHM0NzlhbVFQK3o1?=
 =?utf-8?B?cDFOLzBuVytDdlZGcnhORWpXTGlZNW5jbUVBQllacWpOS21iRGdMT0N6Rjh2?=
 =?utf-8?B?RHE4NkdiZ0x5dm8yNmU0cGt6bzhmdUpFRno3VENhQ3NmRVJWTTdiN2w5TndL?=
 =?utf-8?B?ZExtUFp5UXM3RTFvWGRZQktPRnJ1clB4K1NJbzA4SnZESEpjc0Juc3Z0V0Fn?=
 =?utf-8?B?ektUUnUrZjFEVWFKbjFIS0VpSUVNZFdBdW9NYUtUbGNDcHV6VmxHK1NtMStI?=
 =?utf-8?B?aElVNzdCS0N5R1FxMmlYclFoNHhJcGhPQU1iTHVwV3pxcVVIYWhIeEo1K2FE?=
 =?utf-8?B?VjZScXJVdkl4YStvVFVMaTlSSzdmSXBjZ2Yyc2tKTUl1WnpTQ2dzVXdOVW1L?=
 =?utf-8?B?ekZTZ3FZVC9kZGFOVkpIbFY0UGQ5SzVMVWlOdS9ydEtWeHJESDVYWVpMeVJl?=
 =?utf-8?B?RXh6cysyNTQyV0t3SXdpU3FwTlI2aGJ3TDFCbXV4WW53SjNvckZSR3dSN1d3?=
 =?utf-8?B?b1o3RjVaeWVUcEJIK3lkandKOWxuUXV5Q2kzMnFrVFBMK21GMEVvbmNIamty?=
 =?utf-8?B?R2llekxES3pJZmVmdGswbFRDN2Y2NVQ5bkF6MTBuWkNXOE1HZElYa1pENnVh?=
 =?utf-8?B?Mzh3WU9HcXVQYUdUOUQ4a2RTV3B4MjlhaHN0NEpLcTd0VmQrVXU4T3pWVk9T?=
 =?utf-8?B?R0xIY1IyblR1VjZFVTdGem9STHpXV2g0dkRrVUxzQzdDYXpMWjBSamRxNExD?=
 =?utf-8?B?cVZtUW5QREpZVVFFM3JBRDg1Z0VjdlJlOW1yeDRBUk91bkZGL3dOblFOUFdX?=
 =?utf-8?Q?2gbBYgW6EJynzBdSdP?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0aa913c3-afa2-4e99-6c15-08df24e0d5b2
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 02:06:58.8226
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dbP8pUvi3SVdimkI9jcXNM3cC5aIqF59pEfQ0m7A5Cy1wjZoVBjlncsm4Zbnwati
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVUPR12MB999135

On Fri Oct 2, 2026 at 5:52 AM EDT, Usama Arif wrote:
> Reclaim splits a PMD-mapped anonymous THP into PTE-level swap entries
> before unmapping it, so an ordinary swap entry has never had to appear in=
 a
> PMD. Prepare for installing one there instead: the softleaf layer is wher=
e
> every consumer decodes non-present PMDs.
>
> Accept swap entries as valid PMD softleaves and add pmd_is_swap_entry().
> A swap entry carries no PFN, so make pmd_softleaf_to_folio() warn and
> return NULL rather than interpret a swap offset as a page frame number.
>
> Unlike migration and device-private entries, a PMD swap entry can also
> carry the swap-exclusive marker, which softleaf_from_pmd() has to strip
> before decoding. Strip all three overlays unconditionally while we are
> here: each clear is a plain bit clear, so testing first only buys a branc=
h.
>
> Signed-off-by: Usama Arif <usama.arif@linux.dev>
> Acked-by: David Hildenbrand (Arm) <david@kernel.org>
> Reviewed-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> ---
>  include/linux/leafops.h | 40 ++++++++++++++++++++++++++++------------
>  include/linux/pgtable.h | 17 +++++++++++++++++
>  2 files changed, 45 insertions(+), 12 deletions(-)
>
> diff --git a/include/linux/leafops.h b/include/linux/leafops.h
> index 7c13c58a5e218..ce176c78cefd4 100644
> --- a/include/linux/leafops.h
> +++ b/include/linux/leafops.h
> @@ -98,10 +98,9 @@ static inline softleaf_t softleaf_from_pmd(pmd_t pmd)
>  	if (pmd_present(pmd) || pmd_none(pmd))
>  		return softleaf_mk_none();
> =20
> -	if (pmd_swp_soft_dirty(pmd))
> -		pmd =3D pmd_swp_clear_soft_dirty(pmd);
> -	if (pmd_swp_uffd(pmd))
> -		pmd =3D pmd_swp_clear_uffd(pmd);
> +	pmd =3D pmd_swp_clear_soft_dirty(pmd);
> +	pmd =3D pmd_swp_clear_uffd(pmd);
> +	pmd =3D pmd_swp_clear_exclusive(pmd);

I notice there is pte_swp_clear_flags() and wonder if we want
pmd_swp_clear_flags() to match it.

>  	arch_entry =3D __pmd_to_swp_entry(pmd);
> =20
>  	/* Temporary until swp_entry_t eliminated. */
> @@ -634,18 +633,29 @@ static inline bool pmd_is_migration_entry(pmd_t pmd=
)
>   */
>  static inline bool softleaf_is_valid_pmd_entry(softleaf_t entry)
>  {
> -	/* Only device private, migration entries valid for PMD. */
>  	return softleaf_is_device_private(entry) ||
> -		softleaf_is_migration(entry);
> +		softleaf_is_migration(entry) ||
> +		softleaf_is_swap(entry);

Using softleaf_is_swap() here makes softleaf_is_valid_pmd_entry() return
false positive when pmd swap entry is not possible at the moment. Adding
it only after pmd swap entry is possible can close the gap. But the
whole series should be applied together, so it should be fine.

Otherwise, LGTM.

Reviewed-by: Zi Yan <ziy@nvidia.com>

--=20
Best Regards,
Yan, Zi

