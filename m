Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010031.outbound.protection.outlook.com [40.93.198.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 900BE3CE4A3
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 15:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790004663; cv=fail; b=ZBeRguoWExA9WTH52rZPb1obe7+NTsyqPh4HDR9oPVa+FsEqfxejwjmeIuPX+AAE6daUE92dxbiep9qMCxyYUOfs2BHpz+19hyQKRnDwvoCTZaNhVDeMzKpyzKwssQMgcLDVD2rAzHo9cKejnLfZ0S8ZslwrFMBfjQn+gRUloZE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790004663; c=relaxed/simple;
	bh=D/3M/n0Hxekl0LvaierItMIfAkNO2CGBsYEzrLOeQqM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Mvr1sdJ3d2CJRLMEug7dYLu4h+zAODoa58yY1TcTQR1qQpz8rsrhQ5dtDV1Q7u6+lOdxxofU83ecne51uUlI1JmawOeWdpU6gEfVrj0KzslBhVsDQp4mH4I6URhk+ZRDzTkwsAhNHB9MXpWwh6Z5vF+eWwMhAs/7pxlOMzvxzWo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=pR0kZgoc; arc=fail smtp.client-ip=40.93.198.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="pR0kZgoc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N7tcC7EnBF02fFU4AqakhW4YyAeqNacMTQD99gAP+IGeRFC4AXPTcBUDMY8fbe07ZLimi1V/UTW3VX5Gvk3NWBrIVP0uAVNOR5fUJkvsO5oDfGpyG8rnwsVMfSmopGb5m5MoNaiwitXhmt1LQrz5jE1dCVnMfx3YCCVMHOCfreUDwKsnMVMmT52pmpLdxpSNXs999JIqG1zrc8kSl7NBITqPlJSai5zA6jlpNiNTY4kJuVb4vTUzQzoqmcomXyuKyBIp7uz9JNBlMNh13RuTBFNsfNXoaBywOh7G87C4ChSxjzM6Kko7Rnsm5TLGefl9Y01FfCdFk1joZmklOBSZlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZflvH9+x2U1qkKUD5MJHwa3+VJYyoWdC9wzpixpduCs=;
 b=b8l0Ji0p4D8LfzckWZwUaZomXKGua4TSONIYtcr3bJWx2uGfwLeTdBhjFSevUSxowoMDHrEbbDtwU43gSSGH6E0hqLehDH0UdA4dpsi9EcjqeXILfgzoLg7egV11JAfdF0zIXuk0MeFsPUVCrAyf2zRT3TsV4HweqHg2Aj6D2bK/l7390dmoj3XN/p+GA0YOJONyD6c7DnP2VMqn+m76Tyh6lC8fspYldR3RZotr3736wMYDjXP2N6NxKSbG+A6WqDRaDy6EfTMQKekVVKuMGyOGtuutjNlj+UEKDsWXSqPgH7LjujSJoEX6KaAYERmq7EJZ2wUKDVvVsAnPgLFMIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZflvH9+x2U1qkKUD5MJHwa3+VJYyoWdC9wzpixpduCs=;
 b=pR0kZgocWHMaavnixzn0+SBX+EOlkFudxUFCifc+EGskqcpXYU2iVIQ3dTcDTgszYflIuEMSS6ZcJPvdtU/RcLc/kULr5n+XmnIipU5/uw4Dl7BrfKTsZXSSA97uJn0/fv+n/JeUP9OgfN4ZqVV8PRxOUDLhNvrTOp3RpzZ0bvrE09uuNBZG1Pr6xm4Yb0xhgWcrx6HewhmlJXoCl7Up0SJGsVpbSgO3f0lnw1QGR99ulFnANHFOvY7U4xGUK2NZQz7E8JgOozNkGrV7prJuepXMRo6kfPdRP36zJJpk8/qTxH+pngEMbxiBodNpjQm8zmRKHfEuyPTCUPqY0YDtvw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7)
 by PH9PR12MB995114.namprd12.prod.outlook.com (2603:10b6:510:426::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 15:30:57 +0000
Received: from IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16]) by IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16%6]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 15:30:57 +0000
From: Zi Yan <ziy@nvidia.com>
To: Lance Yang <lance.yang@linux.dev>
Cc: akpm@linux-foundation.org, david@kernel.org,
 baolin.wang@linux.alibaba.com, liam@infradead.org, nico.pache@linux.dev,
 ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org,
 usama.arif@linux.dev, kas@kernel.org, ljs@kernel.org, vbabka@kernel.org,
 rppt@kernel.org, surenb@google.com, mhocko@suse.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/1] mm: disallow raw PFN mappings of huge/shared
 zeropage
Date: Mon, 21 Sep 2026 11:30:56 -0400
X-Mailer: MailMate (3.0r7032)
Message-ID: <FD82BF38-AC83-402F-97DA-F14B5171AFE1@nvidia.com>
In-Reply-To: <20260921054225.28537-1-lance.yang@linux.dev>
References: <20260921054225.28537-1-lance.yang@linux.dev>
Content-Type: text/plain
X-MS-Reactions: disallow
X-ClientProxiedBy: BLAPR03CA0075.namprd03.prod.outlook.com
 (2603:10b6:208:329::20) To IA0PR12MB8374.namprd12.prod.outlook.com
 (2603:10b6:208:40e::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8374:EE_|PH9PR12MB995114:EE_
X-MS-Office365-Filtering-Correlation-Id: e9d5e255-9407-4a61-eba1-08df17f5556c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|7416014|376014|10067099003|11063799006|18002099003|22082099003|56012099006|13003099007;
X-Microsoft-Antispam-Message-Info:
	/mXc5F1nlPmZGpcDSCv2HK7hXQJplIkUY9ot6igbiUcEXfc34GOYiGpOV54L6yMSYjglxBZNe1Xr6644EJk/gwmWusJenzRRvZx/3fSoNA4ErU+P6S0og/8cnoo8zX9EpRAnEndORCoLZvkIYS3BObESu5qVskC7bwT/dp6jl5e5quIHeSRmxljUa7lkTqXkuINinTrZQYIUN0NgO8uE7hZZYKYmav1MuOLfF17kyKGsbMZtQfQPEyCqemOXMzDs9DRd38DHz4Gu/OEgjldpj7RdLDAvGMc2Xl129JZN/0kMOaR42mEZK9oN9gUrsCi/Mqf2lyKy/iFKuqKSgXsFyVryd3/oyXc6r9e2Ri40WXhjWkFgaouN+/7cdY+pGsAxzsar8SyIIB4Ch0NbVGk9W2RTElwTmo7AewHrhYKZi58gU82bTkq5vqjJjYVpiGVFYneynPFpe4B//4wQ+LdygZojplxsPu0+2f7iNyocT9vCx25wtAgZVilmZKIq1liCbpU6I/JOlASPjw5mslPSxHcH5NxSVXA+fokiMXC75j4MZUAUpKX0/4guxc1MXJfpxZycSRG2YP3SsDmnxijWmq8aigjdSChvbW1b+RPol/X3TUB30RysByx273pLPE/LHBLRWW2L2/z31et8M0LJK6tBP3Xj/KvDyzlmFrsYPoo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(7416014)(376014)(10067099003)(11063799006)(18002099003)(22082099003)(56012099006)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lFFNshj2xv5Xyv+kbduf44sLOEBpxQY8GkTER+3xHIQCbbrIxwjQl/xnwOsV?=
 =?us-ascii?Q?/20F6IRr+nC47KTjldrU+9VRatWNWqW4q17GTiStc4K0Wm5ewc/myAfJ/uYK?=
 =?us-ascii?Q?UQI90op1kEY3mYFEan9MOixhzMAd1pD0Mx0DH0lyhlwbEYGfsalqzBFInmdg?=
 =?us-ascii?Q?915Akx+7sVz847g6ssuUnNDwpyS26dYKoIscEMQskU1196vY+yEAdyVqvw9c?=
 =?us-ascii?Q?V/k/yQnTPh+NbBQ8ULr6XBfMpqCBh1J2VNy+lgG4Y7AzgIVnKWh5Ok0H406t?=
 =?us-ascii?Q?Eg7vkHGt60sVWesbew4cMLCb/4Ax5EVCQcmggpNBYtyQOBxd+Wc0o07NxtMa?=
 =?us-ascii?Q?7awRRqEk+Qv3KNYF6C0CHzIU5PpXiWcp7GyVeZAD7tM4t2rx/RKALeBAOBcT?=
 =?us-ascii?Q?nbwcHXwYbBCDP9Al6XbPQ8JPCw8KpUswCcp0vEKyk1iMpk3WSpdhU5JW7bTZ?=
 =?us-ascii?Q?e8Ofhiv563xceXMjY8jfk8YgQxy4Kws3ptjiJdhp49eQK3AwjtJq4nORTTIt?=
 =?us-ascii?Q?ot/qFeIKKVhqloZhPurgf9xOK30hKsvARH35C7K8yaex60j3NcP1Tk6wwt9j?=
 =?us-ascii?Q?9TYvhc9tLlKpCTjcsyrP8UpKbPl+HmDtu6FlID+JjS9x0kg1hpwhCqEe+z0S?=
 =?us-ascii?Q?RK/auLZAIYlub5NtCUGbs64rBLAs9lAM10GijsDDpBKTW6+gy3wv/srEBv8v?=
 =?us-ascii?Q?fPxQyCGUjs+p4id0MoMcrV3BJ54rfoCodQdn8f/wsmm69F/YiICtkGCiE8za?=
 =?us-ascii?Q?oteg2/3050GGQ1uZTsQ5yPOgJ7N5eeJ0wjkmpXL0ZtUSuLKqdHki636+Xwbk?=
 =?us-ascii?Q?LIFO0d91iOkHF+r7EyCvhD04rcGvTyoWNp7FX0fE2A3NfVBH0PVWJ8RD92Z4?=
 =?us-ascii?Q?/JUfxhizrp0j1K2C/+G1NyLcR1FvrJgpL4TEkYG2OCuK5kst/9x6yKTeEk+D?=
 =?us-ascii?Q?yLqVazkp4TrSH4pkaKJGTHKektHhOJMImhkqnvrbhGmmYh8hwsy/vMV6YaXl?=
 =?us-ascii?Q?kJNidPGJVC8WS0STRUZfj849nAk2JQemnOv14MwIEIu3mdeDtOq8WJABMr77?=
 =?us-ascii?Q?BjYkOasWAjf8c3ZbI+TQl6zpFYBMifHclMYYr8jhlyl8+jrqCj5j8PIfziZu?=
 =?us-ascii?Q?HB0Vobg2r7TzZaNDDO5f07I8G5/A5/X3BsRLMaDLq0+3pIDMttBWZgXoZHXH?=
 =?us-ascii?Q?jrmakEERE9FX7O6YgEmkiBUickjMKdqhIh3lWGSsiCDYm8S8L8YscFfNilsG?=
 =?us-ascii?Q?qbZJ4ubn5qgc09jnCaFkaER1dcItF9Snfre2etR4+Eg2awkVWK2M+rittnsn?=
 =?us-ascii?Q?3CPtP5OT+dONIDaGbKm9LuFvHLhLpALMFEl0o9pBT99HTrkQRpE2DAf6p+U1?=
 =?us-ascii?Q?bBPKudoLnKOzz3HBZQDsw1IJ1pu8yTCSJ7ukAkAiK33KngBR/kunq+t+ZYcc?=
 =?us-ascii?Q?k5w0kyV6B9gPDs78L8CaBSURVbe6PlQtopDYP7xnf/1ieUEufxAOas/faGd6?=
 =?us-ascii?Q?iYYlT608sSHuImCf8tPKSiZdXefe60Bv5JXuD5fCKQ7GUXF5JTWewZlWk/YS?=
 =?us-ascii?Q?W9vg5QGU6UJM7t+Vr072OX5lUCv9rvLbSulDag/WLcSWG37wKX/Xm4m5pBvj?=
 =?us-ascii?Q?oFFPH1+ggk0d/q2dTYKuR7lSbcqmCG/lZdAqHrX1uDBwGubRA3/R3eG3DIsq?=
 =?us-ascii?Q?oLkmQ3JMiHxsiK766ESE9XuDBFQKv/yLeWqmwQ3f3HvqpBs/6LGj0Z5PrZKN?=
 =?us-ascii?Q?BvmTUbD+qA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9d5e255-9407-4a61-eba1-08df17f5556c
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 15:30:57.8620
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mNbJNNLYzeR6PYksvfdTUD0YYGqIMznXMoAMXu47ObHHmKIxhXrWYx0plPO/aqXi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH9PR12MB995114

On 21 Sep 2026, at 1:42, Lance Yang wrote:

> From: Lance Yang <lance.yang@linux.dev>
>
> Handling the huge/shared zeropage correctly in vmf_insert_pfn_pmd() and
> vmf_insert_pfn_prot() is more involved. We would need to check whether the
> VMA allows it and keep the mapping read-only, similar to the checks in
> vm_mixed_ok().
>
> No in-tree user needs that support, so reject these mappings with
> VM_FAULT_SIGBUS rather than complicate the code for now.
>
> Link: https://lore.kernel.org/all/20260917121010.60966-1-lance.yang@linux.dev/
> Suggested-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> Suggested-by: David Hildenbrand (Arm) <david@kernel.org>
> Reviewed-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> Signed-off-by: Lance Yang <lance.yang@linux.dev>
> ---
> v1 -> v2:
>  - Reject the shared zeropage in vmf_insert_pfn_prot() (per Kiryl) - thanks!
>  - Explain the VMA validation and read-only requirements (per David) - thanks!
>  - Pick up Kiryl's Reviewed-by tag.
>  - https://lore.kernel.org/all/20260917121010.60966-1-lance.yang@linux.dev/
>
>  mm/huge_memory.c | 3 +++
>  mm/memory.c      | 3 +++
>  2 files changed, 6 insertions(+)
>
Makes sense to me.

Acked-by: Zi Yan <ziy@nvidia.com>

Best Regards,
Yan, Zi
