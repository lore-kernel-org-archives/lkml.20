Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011043.outbound.protection.outlook.com [40.93.194.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22F6A3C1D48;
	Mon, 31 Aug 2026 07:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788162981; cv=fail; b=fJUk0u74Kz9ouVy3rN/cfwkNBu7bJnX9bMhi9Hi5Ft8tqFOHxj+uaN97dhcizMAuAbOCcfnrqOq1acFlCVX7m4o0+nnc02+TQx163hSjcwWIiNrbwYPCysxdE9g3iXr3D7FcwIrcQYupUzHAdd+MMYQleHOpT67FPsFgteJo4z0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788162981; c=relaxed/simple;
	bh=MudgQjHdAZSbAqYvVPkBsMIkTGWhqZz9YoL7cOMj2oc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=RwuMaESuF8S/rrEmdXm0fFR7na7/Z7hiI2fkJKojd/o2f81TojaJMZqwqj39nNSWKRPDRLEo24sGPQONX1JLC4WzyfTSEjFA/uy8nTAoQxdAMqq+ik5tvss9ZtrgbAZR+WxAVnSeCi+NFvH8yVhQdYiWShfXqhEf7bwJxSni7vU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=biCVvgVA; arc=fail smtp.client-ip=40.93.194.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="biCVvgVA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qaS6M08fXz6iLWJM4KbaeB7xJOdBla4wUElRdnS/lsCv+Q/ZmLUN2qkDbjeBmfGV7OqT+SKq+lmsj9bbh6KeOEOQNF9Kyr2i8bracqfBFYcE2LwoZcSA/RK+oG4LhgxKlI5BMPK5tDf/NYEBLOhuYXY/Ws0J7x9Vps4fQysq2pbqgMa4/1w66J0fBNyu0V4YGuN1Jsa9mDwRvooMPbdPeB3TqUn7OZtDDempkdKaXa9Mx8v+6aKaG5MgcpPz4bQ0fWBMIbF1IRhCubt5LJZyALYhnTOCnJE4FAQo0V0iTfKY9Thm3tRN6Dd0fGrT/n/CiVjMSAqfNI13Gq/7mtKubw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L40kmwh0RKeXeWwMJhkteXPJBYYOEQqyYjSI23MQaxY=;
 b=FWeF3m1ZMc0T2JuZJBUdtBOZSdOjGx8mTBMbASUe9x6RIn8D9Hw/CUh2f28eyEr1cY6uy62Tw0u64n4j8vhXwfcaMJxUNE/ivF5Mnmbf6l1uxHWG7gjNHIJjitn+r54m0xSBK0thMgDcaiajt17iqKOMh+5EQ3d4nYckFRVL+NwAC/SURvvATcl6zy2GkzU++NNIhzsJ3PQqH+gfIonHcZiQnwWDIOtAiMLAEUXlfS/QIEyVP1hv9Zb3hbB5ZYeom8BuFoJ6a0W7XlK91yStNg9ELn+Y+/B3PHNgnN8IHBrGd6mblfjbi1nFUhfF5dhA6WYngoP+3jI0e0m0kHRoUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=linux-foundation.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L40kmwh0RKeXeWwMJhkteXPJBYYOEQqyYjSI23MQaxY=;
 b=biCVvgVAdMh5FUMrt/UAno8UmJ1Lo3iC8xMADNJ7+pAkN/cdAAhbdNCcjB22Bq3pUlM51lOOomyohJ4WCfPgjMF3OqPNRsKyOAQDGFjM2C9U1FRIuGN7qmQX3JpPGTCIK9IxNLp2zaLw6cHmHov+nAoFZKZMdmaN6eR7Er0kcrgzuvJxzt44KLUCxSztBdCm7rH3uuLrYUgFzz0+je4SKBl9rlSAxqTuDOQkaBMZ+4njQ/5rdEX2UO6vAU3iRUhmCxr9PZGg4E2L2GAZXRyBeYfdVzrTkALnr9RdLzI6isaD/DZxNkdJ1i0iuK7zB2UnfVdgPmQxmMQJkjW4V4fOoA==
Received: from PH8PR20CA0024.namprd20.prod.outlook.com (2603:10b6:510:23c::19)
 by CY8PR12MB8266.namprd12.prod.outlook.com (2603:10b6:930:79::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 07:56:14 +0000
Received: from SA2PEPF000015CD.namprd03.prod.outlook.com
 (2603:10b6:510:23c:cafe::7b) by PH8PR20CA0024.outlook.office365.com
 (2603:10b6:510:23c::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.13 via Frontend Transport; Mon,
 31 Aug 2026 07:56:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SA2PEPF000015CD.mail.protection.outlook.com (10.167.241.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Mon, 31 Aug 2026 07:56:14 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 31 Aug
 2026 00:55:55 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 31 Aug
 2026 00:55:55 -0700
Received: from vdi.nvidia.com (10.127.8.14) by mail.nvidia.com (10.129.68.10)
 with Microsoft SMTP Server id 15.2.2562.46 via Frontend Transport; Mon, 31
 Aug 2026 00:55:47 -0700
From: Nimrod Oren <noren@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand
	<david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, Jonathan Corbet
	<corbet@lwn.net>, Vlastimil Babka <vbabka@kernel.org>
CC: "Liam R. Howlett" <liam@infradead.org>, Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
	"Shuah Khan" <skhan@linuxfoundation.org>, Randy Dunlap
	<rdunlap@infradead.org>, "Zi Yan" <ziy@nvidia.com>, Baolin Wang
	<baolin.wang@linux.alibaba.com>, Nico Pache <nico.pache@linux.dev>, Ryan
 Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song
	<baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, Usama Arif
	<usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>, Nirmoy Das
	<nirmoyd@nvidia.com>, Dragos Tatulea <dtatulea@nvidia.com>,
	<linux-mm@kvack.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Nimrod Oren <noren@nvidia.com>
Subject: [PATCH v2] mm/khugepaged: cap min_free_kbytes recommendation at 1 GiB
Date: Mon, 31 Aug 2026 10:56:35 +0300
Message-ID: <20260831075635.2244437-1-noren@nvidia.com>
X-Mailer: git-send-email 2.45.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CD:EE_|CY8PR12MB8266:EE_
X-MS-Office365-Filtering-Correlation-Id: d8cc7507-67fe-47e7-a0ab-08df07355490
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|23010399003|376014|7416014|18002099003|56012099006|13003099007|6133799003|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	TLHEwO/TJRJNkcV2W0pp6kkm2ramVyqOBcM+m3AKAtGYCSdMAg0AC3tkwdGaZ5LnP/W6iB5auIjYfetodcgbBPBt7ZP6htfqaHFXlxk6oxOlUVtgelKRKLeG2+CPqKxTaQO0vEtixurI5+wr7BcYES5AFmEOhBJFsWmWD3OCue2N1AFKSaApfv3p668pHkl7OTaOzLkxCisBenSMpS7st6kmN7TdglaF5PUJqcyWg2qbBm4OTeYCg0Hg5qw+wQdAzRKBJDes+sJROBxgjCndcJAKa9jSP0yee+jDidqMVa8oM/gp1FtUFg13nTKsmTtL50kFDJaj8wVpUIC0fgqkN/Ktq7aCUSpJnBbOYq5lQ4q9g7py6ro2K7K+X0Yb4yGlhEU3zmoK18TyqHiHgV5KsARcR+IrdTuPdoHMLQM68njv2tvJ1XJ8RgY4+lCrS7uv3So9HczbYQstDNlXwtDxBJ3J+FF4o1ZEHtk5t2+VCUlcnp1fX3JAlLcsvbL3Xavos+BfjasgYZ2zf+7mawB63pVy9FXT2vAYZAH2Q7BFd7QTk349fMYphKkfTeimL8CwM7DbwQ2jXvcoJpwjvt8ujyvgMmp5SbOHbWy0mqtbVFfFi5a/PVa1gad5bvIjnhhDvaBELA6HH/5ty4vDOj/m/CKDVdnQeOJIYKicEW7gV3ANipD9W6JEUfvHCls4UOUMQhvbURvKR8aQELQKUDo4Rg==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(23010399003)(376014)(7416014)(18002099003)(56012099006)(13003099007)(6133799003)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	vrnEFyhBEwVs+cDloI3aPzMT1oLZ8gyv7GYdYnTkJbUEHXqVYuR7cliUVHodBybZm1Ses2sHMUEmUGaFGaTyM5CvpuDF0NxCAyRgkBsg1T5/7zuyxiVjYUcipwxbQVt2q6ZkAyul7jjZLGyoPMTB10wPMVTmqDoY1FOc/lmboCPeBT80OLkXlFbmDlcc1WZ0eXqBx6Dm3YLrjo4prVslL7WzTcWW7sidxOkuvdJEDTKvYlX6sxykoFrDADTBT+NHOQaPDu4cvgfHSdvPVHJ1twmZ15kEwyQf9eMlJcSqZCRSy6JRIKVH/3Zz9IE4mEoOXJ75H4nDS4yF56zdsXqmUFTp/+Sd7MWoqKNuu8d/J67MPCqn0RBQMSxg/m5HE5yLnf8wLom5xQYq7zdSflLY8f7PkOrISZ5NAPSah+8tDv8U2bnS9jwn3nPVc1rk+a6p
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 07:56:14.1804
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d8cc7507-67fe-47e7-a0ab-08df07355490
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015CD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8266

When THP is enabled, set_recommended_min_free_kbytes() may raise
min_free_kbytes using a heuristic that scales with pageblock_nr_pages.
With MIGRATE_PCPTYPES equal to 3, the formula accounts for 11
pageblocks for every eligible populated zone before capping the result
at 5% of low memory.

This is reasonable when a pageblock is 2 MiB, as on common 4 KiB page
configurations, but scales poorly with larger base page sizes. With
the default arm64 pageblock sizes, the contribution per eligible zone
before the 5% cap is:

  4 KiB pages:   2 MiB pageblock,   22 MiB per zone
 16 KiB pages:  32 MiB pageblock,  352 MiB per zone
 64 KiB pages: 512 MiB pageblock,  5.5 GiB per zone

Consequently, min_free_kbytes can reach excessive and unwanted levels.

Add an absolute 1 GiB cap to the recommendation, in addition to the
existing percentage cap. This bounds the automatic recommendation to a
sane value on systems with large pageblocks while preserving existing
behavior for typical systems with 2 MiB pageblocks.

Link: https://lore.kernel.org/r/20260716173504.760369-1-noren@nvidia.com/
Suggested-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
Signed-off-by: Nimrod Oren <noren@nvidia.com>
---
v2:
* Use a named constant for the cap.
* Drop explicit linux/sizes.h include.
* Update min_free_kbytes documentation.

v1:
* Cap the final recommendation at 1 GiB as suggested by Lorenzo.
https://lore.kernel.org/r/20260728202014.2517142-1-noren@nvidia.com/

RFC v1:
https://lore.kernel.org/r/20260716173504.760369-1-noren@nvidia.com/
---
 Documentation/admin-guide/sysctl/vm.rst | 8 ++++++++
 mm/khugepaged.c                         | 7 ++++++-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/sysctl/vm.rst b/Documentation/admin-guide/sysctl/vm.rst
index 5b318d17aa4b..c0c925e6f504 100644
--- a/Documentation/admin-guide/sysctl/vm.rst
+++ b/Documentation/admin-guide/sysctl/vm.rst
@@ -539,6 +539,14 @@ watermark[WMARK_MIN] value for each lowmem zone in the system.
 Each lowmem zone gets a number of reserved free pages based
 proportionally on its size.
 
+When Transparent Hugepage (THP) support is enabled through global or
+per-size controls, the kernel may raise this value automatically to
+help keep pageblocks free and reduce fragmentation for THP allocations.
+The automatic recommendation cannot exceed 5% of low memory or 1 GiB,
+whichever is lower.  This limit applies only to the automatic
+recommendation and does not constrain a higher value written by
+userspace.
+
 Some minimal amount of memory is needed to satisfy PF_MEMALLOC
 allocations; if you set this to lower than 1024KB, your system will
 become subtly broken, and prone to deadlock under high loads.
diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index f49a6710933b..a8fc061d2488 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -101,6 +101,7 @@ static DEFINE_READ_MOSTLY_HASHTABLE(mm_slots_hash, MM_SLOTS_HASH_BITS);
 
 static struct kmem_cache *mm_slot_cache __ro_after_init;
 
+#define THP_MIN_FREE_MAX_PAGES		(SZ_1G / PAGE_SIZE)
 #define KHUGEPAGED_MIN_MTHP_ORDER	2
 
 struct collapse_control {
@@ -3120,9 +3121,13 @@ void set_recommended_min_free_kbytes(void)
 	recommended_min += pageblock_nr_pages * nr_zones *
 			   MIGRATE_PCPTYPES * MIGRATE_PCPTYPES;
 
-	/* don't ever allow to reserve more than 5% of the lowmem */
+	/*
+	 * Don't allow the THP recommendation to exceed 5% of lowmem or an
+	 * absolute cap, whichever is smaller.
+	 */
 	recommended_min = min(recommended_min,
 			      (unsigned long) nr_free_buffer_pages() / 20);
+	recommended_min = min(recommended_min, THP_MIN_FREE_MAX_PAGES);
 	recommended_min <<= (PAGE_SHIFT-10);
 
 	if (recommended_min > min_free_kbytes) {
-- 
2.45.0

