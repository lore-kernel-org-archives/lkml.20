Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.85.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793112563;
	b=2EyXGaYco/6FbFKq4TVqLKC5+QGsJ2ADzbyim6DesA7jP+WfAzkvvWFYi6s4+VLvvYBZ
	 jzmKPdf8kysPmq386Z2Dxir9ZUWL9hlKU7Ss8Wk7wcIN+BWL3czzQV/jFuzHDgBE5vKbo
	 RKsNZGX4cSdyc38LP+DWWCNkg6FNmiQ/SSz7i8PWOwWU9UYuCUenHvnx2TwNCzm8nhr3m
	 Y6ITLFrMEjwfFLMC26XBvDJZYNhFgcWhtVaL3v7gOtdP6PyJSIWCZRg4JzNgA/rGGhE5L
	 IjVrZ65O4YJ8/OzEZQny5iK/0t92mGT/BdlYucf7TJm2qFJ/f9dgV70wsI9P5OtjzAQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793112563;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:X-Mailer:Message-ID:In-Reply-To:References:Content-Type:
	 X-MS-Reactions:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=dIfiK8RLUovcjpZQvUlWYSY0E4HcBzMfTj89oi3cQE4=;
	b=WubJV4qivFq2EHNS7JOOj3IIxMxycXNP7d8+tJodwSH5/clkBAeEcDL1Lnda+5m/U8mk
	 2X1BdDGJu+dvpg0ERyorCpdzcdbTSJ6HZkyk4YVr4NxvFNK6l29YKVYn6Z0DqRVv1raJn
	 SZ6f34FAdoR1A1Lo3UcLXzltYTNrwQ/5BaY+9Nlo0mLjVM84spozwQRi5TH7SsQGfmlpd
	 jcgkhiXFAtjnDnRYAsYtgY9O7mwWOoCg0NazfFL4h3wkaAGN0YLBH8qpyqxga+RhboJJY
	 rzD9V9ImpQfY3ecuivfpWEvs/3To51TucUOT+GZnRj14bwJL8kRSLDbn9BGCCa9mIfQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=eqkS1+6R;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.85.46
Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010046.outbound.protection.outlook.com [52.101.85.46])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78E6B606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 14:49:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78E6B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=eqkS1+6R
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RwspnxW/fQhd5NugdXIbFpLEaI1NIY4pL4I5tDtDXZllE8wC9QIEvFgoWnsFAC729DT1mJ5qeaM2Fr/Ku2FOJYoDeOdLRwSaV5Q2IOe0OioOqJDN2KB6+SRjYD/7CrkMPoYS9/PYY1Djk11zVFMIH6MUc51LDIrKVUDk8nlqGA6iFvpFKTFuiYUAQfpzEFoZUJHhxyt7MDyLEkzFhUzdcMSXLVlWHGxs9nB5N7bPQ1lT0nDPjDUivOVqvj/Sg5+Vz6xjmVJdgITcqXaSNr1WivjcNKBdUSE5v/vzAmi/juxNsuBrV7YI/jGdlgK1wil3pUNPOTvyC6tnQyNpKq27CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dIfiK8RLUovcjpZQvUlWYSY0E4HcBzMfTj89oi3cQE4=;
 b=Sz5HZV558LpNuKCBMCXe9ICL2Jlka6U0X9MlrDNvd3CkOltXlIe0kdYlGObS/UHyAe0HlONIJqh5zMo50KN9jutsKaHgkfFoXt1ei3LrLSDIXXBweE0uVCrFirpnYJbRm53beDnKzMq5jiVPiG2qTgVPVqM0gSGeTAQ2cjumx+g6SDc1/9S78dg2zNIM2drR2wLD1Z5ZOR3vg6vO3tA4BCQi9CwVI9O3LVGmNhiox29G+J80HMWUY3H1ifYFT8t+Xp31vDE8+Fr1rHyEUa6JEQ7ipQAsULt2IZlLvCnQxVtrCB4IUmwxK9/yHteOx5cpeudy2AgL4N9OVwewjoISWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dIfiK8RLUovcjpZQvUlWYSY0E4HcBzMfTj89oi3cQE4=;
 b=eqkS1+6R1dTOmp1NU1jN7Mt/DjK2MqQ96snTrmvIhAXbgIPF7g6a+GKpvy2YlKjkKaoSPPeJt2d3Zn6RP9h5Ql0p94mECLwGcbElaT1dH6vjdKZwAd0ciVETjocOs/W2GWGR6br4MtIuBj5KD+IrpBoNWZNiyyndIHrEE1ecWNdg11q80xPjRqI7NXJplIU/5gt0poaxlHsa0/hNReQP1JFDoDcaBA4dPIIinmzvOHT/+lSK9qmMxVqBzmu51d40VhT3Sb7WcJeBnvCKDa/NnLWMN0QX3hH8sCT/fG6tMe1FdyG5rrVZbmeARn9eCdIZRebkfUZ4teWfBXyowUB5jw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7)
 by IA1PR12MB6115.namprd12.prod.outlook.com (2603:10b6:208:3e9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 14:49:19 +0000
Received: from IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16]) by IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16%6]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 14:49:18 +0000
From: Zi Yan <ziy@nvidia.com>
To: Ridong Chen <ridong.chen@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Byungchul Park <byungchul@sk.com>,
 Gregory Price <gourry@gourry.net>, Ying Huang <ying.huang@linux.alibaba.com>,
 Alistair Popple <apopple@nvidia.com>, Boris Burkov <boris@bur.io>,
 Shakeel Butt <shakeel.butt@linux.dev>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Shivank Garg <shivankg@amd.com>,
 Ridong Chen <chenridong@xiaomi.com>
Subject: Re: [PATCH mm-new] mm/migrate: move NR_KERNEL_FILE_PAGES on
 cross-node migration
Date: Tue, 27 Oct 2026 10:49:15 -0400
X-Mailer: MailMate (3.0r7032)
Message-ID: <83B7AC09-235D-4C0B-A0D0-90EA688D3CCE@nvidia.com>
In-Reply-To: <20261027043214.2248986-1-ridong.chen@linux.dev>
References: <20261027043214.2248986-1-ridong.chen@linux.dev>
Content-Type: text/plain
X-MS-Reactions: disallow
X-ClientProxiedBy: CH0PR03CA0334.namprd03.prod.outlook.com
 (2603:10b6:610:11a::25) To IA0PR12MB8374.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: IA0PR12MB8374:EE_|IA1PR12MB6115:EE_
X-MS-Office365-Filtering-Correlation-Id: b639e876-a616-4f3e-8d82-08df34397ac1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|7416014|23010399003|261026140227099003|11063799006|56012099006|261026121527099003|261021121427099003|261022075727099003|261022105027099003|261009223027099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	8l2adlDtZiPaJ/h9ytDLWzAD2iSD7AfiLehdf9zE8mbH5bB+eHByS9xtJzzldocJpZI43RsQYBbWAJhQRyd0smvKeaCQyNBboYAaGOb4tMrNAQbbcyqFF0kfwIwpmIRSPMOdJMFURMxLnhxjRzSkGDNbUojWkud17PeqI2A+r0Q9maZlBd7VdbZKrQP6Leoz7d2g2X4B3yDCCBkEdHRe0sJDC0Navzl4DG54qb65HuAbZSw7ea2vLfoBreN2GoqizQw6MI0WkuVS4gX//Vi+7jnMSDpxK3e5c35stOKPyAFTsefGekjFtSZuhv8TgfzlPANcq4QSWlGUEuc31Sw9WthTimvf0u2eqREmcUpReu7FQRjTyKY2V6YCyqMqEzBURINbUbwwq05etHmg3YhAY9I8nnCGQO2rsbTYl7w9Ugb/FAHKkD9r30l2MpkB9Vgjb+h6d6B9MhMwA4rGEIHhsVjmyhTZ+VEibjUB5fwrGnUwgcta377f2gbeHqwU9Hawxog0YwFNXB8hOdRWO6dI3bhynbu+rMZGlP3z5oOpMVGjH+LZH6O1x1sBVxQb2xFcBpqyMRweKHC9qKrndtvjIpL2Uk2x/myFaffe32hozUuJDkbiMaiQlwKRRZvekJ1Cbeeww+EF77OcwEZgtV3KktYzwCrvH5eu9/Je8AxWK2c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7416014)(23010399003)(261026140227099003)(11063799006)(56012099006)(261026121527099003)(261021121427099003)(261022075727099003)(261022105027099003)(261009223027099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bvtOvr31X98lFEgx4u8Tr1roWrvurLBs70I6Ibh5uAF41s2N8Sk63kONDEVC?=
 =?us-ascii?Q?Q9gJm5X7tDFbcdLwSPsilqKIwmG6uz5tDMWjy8+40hIPEo+LUDdhkHSUsn8F?=
 =?us-ascii?Q?elMcGldbQoAf9GOvOkkLV/ERJZocQOGCytfZHKp/e7GsYGi7JwAL2I9FCF/o?=
 =?us-ascii?Q?0dxEMesfYnaFj54OzGyyn1JZ+9itieERKdaKUwtw51TfaBcJwyqJZ8LlJgRB?=
 =?us-ascii?Q?gi3miNJ4mYA9/8UIMltON1MbOGvlEUA+cxvyB0Wm3RFJCo+TuSKufODnAqcS?=
 =?us-ascii?Q?oht4L/1rL+MN10ycSFxLE0vHY8FrCc7qn1gCjXgTkoAdiSt7A9yL99qMpp7j?=
 =?us-ascii?Q?fxqreM5UpyFPQFO1Rildl0PZA1yW/fwDRnXTlO7Hmm6xVYA/c17tOzoooJR9?=
 =?us-ascii?Q?GveuzuM/dnwob3VOeSmyQvB+yVXHGz8poQKRp3K37CUZiZf41sEUC7wXE6Gd?=
 =?us-ascii?Q?DXBTHkrWWqra2G/w0AmBLriM77yxqLGsMkMuT7NQ7m0iyb1TTyRx9dARH3VI?=
 =?us-ascii?Q?CZOvwzzB/9abyOIB2rkZP3SR0VdQEEaFk+H+PGFkOQOO1hAsxP/B0EJvUSoL?=
 =?us-ascii?Q?aiPieW4ttUI4rBOxRoNe80sdoQFeYv7ucgpBarSsjfIBRF2DtVQ9PsFJQDG5?=
 =?us-ascii?Q?RPrJXQtsY/FddzWsacPPjGVvr+BgYCmkCmsXzkK8q48nxc8ECCsYN8V1Iqo/?=
 =?us-ascii?Q?sms2a7XpJuqelIjM65UoD2nMyZACgAWJfTKPQN+8DDHxRAKqjXDWZQRfqAYx?=
 =?us-ascii?Q?Ml6va5840r7mMxUoO7iA8uRevyaTPx2U9L2iu6F090rXHQt+h/Iqf1ESYT7F?=
 =?us-ascii?Q?8bj62G4uyqMSwnZkeSUBPTnykvwph3DBg2S3yfJKuh8LTyfii848y2O4iFrH?=
 =?us-ascii?Q?KeTOAVD71vW35uyhLXbuCO9pK+GaXeHA2NXPFRuyazTrYVmOCzlb4RkkC0Tr?=
 =?us-ascii?Q?uXuZuk1FKjTGCj2Gb/x0UNVO4RHcJfhkLhCNTF6ZbgHKNSsuzQUASIoJrjh3?=
 =?us-ascii?Q?1Lwa61CgRtQOaLhH0EAASOb6bh9F6VS2G7hgOI56aKFpywzDFAmvroBeB/3u?=
 =?us-ascii?Q?tN5XkytWYslkw2KjDITULhkAnNYMmf02v54weDKFSyFBL6sq9dFN918WAbzz?=
 =?us-ascii?Q?HDdtj5EFvyUCeXCqXn+FiU/RBN3rPg06s5OBzEegByP02dF3cfvevfNhkdnF?=
 =?us-ascii?Q?J7cWNtupyj0Tm/wFCals5qevNtLVhSdA1ycf1PTLXsNBii8q0QXnevGjVLtJ?=
 =?us-ascii?Q?0eiIEl84RALmwAO4d4pWECVLotcHxtOlKBxPLXfCNphTohYhMpfrNizsd+SM?=
 =?us-ascii?Q?whw7YN+s3yiNMEgMGfbN3J+JZ45RKAXUFUdyvvJOmzGqZrFW5plP9BNp/v5i?=
 =?us-ascii?Q?b/6VjrqCVL+xD9vKq5D6RGF7z5/m3FAW7144gTCzOE2OgtNHf25k1/GAQx/7?=
 =?us-ascii?Q?VK9BHVc9g/og179JncB/3BEDhol6J7yeghcXbCcBzeCuw/hK5vU9+gN8HuYq?=
 =?us-ascii?Q?2li/sueMOULmMl2HkVxorCOGEwyAVegdhrgiXdYwseZbYAkHSALVHapdpl8e?=
 =?us-ascii?Q?xBgh06iFN16YeGzVZcGImI2k/nhL4EWbunrd2HAm+c0gkmSApkBNjI7tYK2e?=
 =?us-ascii?Q?CguT4zQDumw2OcI8claVX7qHUVUKT0jyZTZKYvHbjejuvkRlTDiQl6Sx40dR?=
 =?us-ascii?Q?0UWnxsuuhm3o2oOsqboUKGZLYQ4nrT4iyWyKev9hmBsqsgrjX8uJuAB3O4Es?=
 =?us-ascii?Q?pVt9upm8mA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b639e876-a616-4f3e-8d82-08df34397ac1
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 14:49:18.8511
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gP0wak3cTMcqVmBmXjb64gQplrdmn3iQMcDW1XSwlNKM7hjlLVdF39+AT3S9t/vQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6115

On 27 Oct 2026, at 0:32, Ridong Chen wrote:

> From: Ridong Chen <chenridong@xiaomi.com>
>
> NR_KERNEL_FILE_PAGES counts page cache folios of mappings flagged
> AS_KERNEL_FILE (currently the btrfs btree inode).  It is a per-node
> counter: filemap_add_folio() adds to folio_pgdat() of the new folio and
> filemap_unaccount_folio() subtracts from folio_pgdat() of the folio
> being removed.
>
> __folio_migrate_mapping() does not move it when such a folio is
> migrated to another node, so the source node keeps the count forever
> and the destination node underflows once the folio is freed.  btree
> folios are migratable through btree_migrate_folio(), so demotion,
> DAMON-based migration (DAMOS_MIGRATE_{HOT,COLD}) or memory offlining
> all hit this.
>
> Reproducer, on a QEMU guest with two memory tiers (node0 is DRAM with
> all CPUs, node1 is a CPU-less slower node described via HMAT) and
> /sys/kernel/mm/numa/demotion_enabled set:
>
>   1. mount a btrfs and create 20000 empty files, so that btree folios
>      are cached on node0;
>   2. echo 2G > /sys/devices/system/node/node0/reclaim, which demotes
>      them to node1;
>   3. umount and drop caches.
>
> nr_kernel_file_pages in /sys/devices/system/node/nodeN/vmstat after
> each step:
>
>                   without this patch     with this patch
>                    node0     node1       node0     node1
>   1. cached         1868         0        1868         0
>   2. demoted        1868         0          36      1832
>   3. dropped        1832         0 (*)       0         0
>
>   (*) the counter has underflowed to -1832; negative values read as 0.
>
> The global value in /proc/vmstat is 0 after step 3 in both cases.
>
> Move it together with the other node-keyed page cache counters.  It is
> a node-only counter, so use the node accessor, matching how it is
> accounted elsewhere.  Interrupts are disabled here, as for the zone
> counters below.
>
> This was pointed out by Shivank while reviewing the NR_FILE_THPS fix
> for the same function.
>
> Fixes: e3a9ac4e866e ("mm: add vmstat for kernel_file pages")
> Suggested-by: Shivank Garg <shivankg@amd.com>
> Assisted-by: LLM
> Signed-off-by: Ridong Chen <chenridong@xiaomi.com>
> ---
>  mm/migrate.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
LGTM.

Acked-by: Zi Yan <ziy@nvidia.com>

Best Regards,
Yan, Zi
