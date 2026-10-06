Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010011.outbound.protection.outlook.com [52.101.193.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 308A4463B7C
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 16:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791302530; cv=fail; b=ctAEIPOVLT/cxTnaAHHuy2cha0nW1FWw9JRHjzcYYyVdN6hmgfqhwdwt2lMEmJNa5rEkmD5Ca0chaaNo4qEhtOl0OQ741bm1EgBohmemsqcu7Tbylptj+OdbdLuL3fi/iru2BEshDOLEZRySDNkGb6S86WL9kGL+Nph21A10JxM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791302530; c=relaxed/simple;
	bh=IzCuvDermfbAqixI1tF9iIeECbr9JYN5pVR8vz2Ww3w=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Yx/j2KBeABIcCwXB2AwdwQGFPx9mVu0J07CdjlXtvN5NR0tnKF5PUwsr+6gW/xkTF/nk8MYNyHTvIri7xVY1xwDYAc1MIJjH8OAXpZ9DJ0zTGq85zo0SYXwOCZdPWf+NP7RMPKOs2Lr6+jU2RjOFVJ/R+4gdWp9B1QIwwp7etQA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Oq2T8Xsy; arc=fail smtp.client-ip=52.101.193.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Oq2T8Xsy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gv1d7FriYnjuXRm/t9zHWANUEYJbArT4k1YshfX5MmjUYlfZJDxt3e1wVoyOsqX2rWCwErNhSmTflBJWOYzK9KI6gA10F4yPrf/C1z4a6e+DHzhmg+4Qmhzym/f/NuZpn3hW8TIwoMnnA6yvArrWuI/RoaH5X9Cpsj+lJXzI6GAGvvHxJyCXJxIq6bkVor42+P5LKXpLRYIs2qW3gdtJyQdx7NhjGsJsPm5JXLE2UYPX4ytigfMEIvb8lj/E4MkTyxxzC2gUfxOJ99FjfCs5UOs9Dp4j+iH//o79sjhawyJ8CuJvXyXG7SzlwZxshnh4xVe8LcIBHORwAleVCNvv2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d79TqB0Mh6GOENO1NfAmMDznzg6KUxg3Q2hO1HRZ0L4=;
 b=SL+5poGXGSSpMSMy7Tpd9Z3cLuVubZ0aF446TLEOi4/QKDR4EEXkldc3fUFozm2e0g1oFQqjyXLXMt0vd9fTerwjWYoAsZJ6uTRi8OxgtnYbrgKl65G1oQMctbhl6o1q0KFlyWAcLRPKVdnQr4+kptAqRqjOntJhhzY1U2B9Y7CsrMOup1WwNIWdvAcfQhmYZFXdNxGuVUfFsvJYNXIq24Rb1AqSz7FAPNbjnfSQqkG0Z2Jms2TdMygOpvqxCUz40HABiO7JGPaHW7LhAn62SowqGh9nLC4oJVz+JnSM96x+WIcYzqlYUr1i+EYjcO9D4IdUQjGNAHmre0dME78DYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.dev smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d79TqB0Mh6GOENO1NfAmMDznzg6KUxg3Q2hO1HRZ0L4=;
 b=Oq2T8XsyqW0j75i6DvNMP343wVMX5HR84lTNWvwQtfXcD2iNtuvMw7AxTeoUV9Uk/Z51/nLcDb9CiK+n6RlPHBvszve+b01hpM8N3SZVqxkOO4X+fk2vetVPyUZjM5Svl+N8Z3w+FiySAVbAuF9slVfv2mhIlmTd0MtmD0hmeDw=
Received: from PH8PR21CA0003.namprd21.prod.outlook.com (2603:10b6:510:2ce::14)
 by PH7PR12MB7937.namprd12.prod.outlook.com (2603:10b6:510:270::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Tue, 6 Oct
 2026 16:02:03 +0000
Received: from CO1PEPF00012E63.namprd05.prod.outlook.com
 (2603:10b6:510:2ce:cafe::50) by PH8PR21CA0003.outlook.office365.com
 (2603:10b6:510:2ce::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.4 via Frontend Transport; Tue, 6
 Oct 2026 16:02:03 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CO1PEPF00012E63.mail.protection.outlook.com (10.167.249.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.14 via Frontend Transport; Tue, 6 Oct 2026 16:02:01 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Tue, 6 Oct
 2026 11:02:00 -0500
Received: from BLRDHSRIVAS.amd.com (10.180.168.240) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Tue, 6 Oct
 2026 11:01:57 -0500
From: Dheeraj Kumar Srivastava <dheerajkumar.srivastava@amd.com>
To: <muchun.song@linux.dev>, <osalvador@suse.de>, <david@kernel.org>,
	<akpm@linux-foundation.org>, <davidlohr@hp.com>, <linux-mm@kvack.org>,
	<linux-kernel@vger.kernel.org>
CC: <dheerajkumar.srivastava@amd.com>, <Vasant.Hegde@amd.com>,
	<bharata@amd.com>
Subject: [PATCH v2] mm/hugetlb: use kvmalloc_objs for hugetlb_fault_mutex_table
Date: Tue, 6 Oct 2026 21:31:28 +0530
Message-ID: <20261006160128.31447-1-dheerajkumar.srivastava@amd.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb09.amd.com
 (10.181.42.218)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E63:EE_|PH7PR12MB7937:EE_
X-MS-Office365-Filtering-Correlation-Id: 3256f084-e39c-42fa-b038-08df23c328bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|23010399003|10067099003|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	+Z0WxXTGJ4OaP7hNgh5ciZXBPcmWnN8V572+K5D7kyNL3yppx8Z02WJDraUS4QzK/myC6buAUWQuBW0dYkZj6IpEbeef8vjXmY5Fecv4r9MwtnLhMZes3N99Sig/2vZOX0iu7V4qEHlwSsPcRFKWCKnfhWdy02e/SPtdxv6Heqt+I0znkRWQ+CBByRif7RJJ+IGCDH3onlmu+7xz+KzctpcfzmTymYmRhOpU3zxKI/iRnyblmYNuXSBgCX52a+wb8gpfx018VsYsXvAl27qU+shPBd0woY/vi8LQHHxooeB6YbJDwmMa31G6p9LdQiAYC5ReOV4IRnTyUcSKRKdiqTUjByTMypt9zAmmbie4wuJ1XNcsrPPRwXoE9JxqsKa4CJ1KD56TvEcwcsZg3yLFPhTYSlS7o1d3N08lw19YJPRRo6QcUO5dU0wJDjyZImcERExEgBGZgluk8YU6FWi8FW3Fylkg1KN1Ik+AUiVVCcQKtplKrktQN5L5NonGV8HBCzeDhhYAzLc+Eo+/rQNxWyYU4jrCw1tUay/hDiFYTg9XRN8c7yPcczfh7gOADPehee4+PCZWeK5eZ9yYn8idRtUvoUppyBzpM5hZvPk2LIjGFeD2DT2aYQjthry7Uwszi35Baq+qOSr3IaNxuLKR0MDkLC3oKsaub5MFAVKJnQ4aO2/llOnc/j4Uohp7KjEtC/pEzVXm4tYL91EO0NA4CQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(23010399003)(10067099003)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	NWBw7QC3AkMmGz6xqxGLiGyLX0FycHNzCmwVkLvxRrdAqi0sPX/eSEHv2qKS3b/tW4VS0S65Vr5/GHkddRSPp7S5fEnHhsxX4eFB9oA5p806MT3eQocq9tDAhUmgUSo7slL7NPqwLNKdZJNPprS76e667cVMdkxj2gK8jEzumHs3Dogs3KHqHvoCBoD0KwkoXwmcBiG+fDLRYj/9Afrv1FRHsmO22DdCbu47mbL1h8Tl25pdQkbN7jNryXnut1Y9Qc/AMvcCTBvJ7w+WxVRHvX8RyV/EdZOfsAibu4VC5EmOSF/BoSKwzohdi1axbfHfRQPeR9SRvodMCeIw0Pw3k714LiP3JSecaS5I6vPvH88E+zhOlplfcfZRXRUSccA5n6N1EPiYEleWJFOBKSFA+VSv1YUDwwGymTjMlIjYQ8ljRUhR5F7uwdVuZRU9uShQ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2026 16:02:01.8265
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3256f084-e39c-42fa-b038-08df23c328bd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00012E63.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7937

On systems/VMs with a large number of CPUs (e.g. 4096), hugetlb_init()
computes num_fault_mutexes = roundup_pow_of_two(8 * num_possible_cpus())
= 32768.  The subsequent kmalloc for the mutex table can exceed
MAX_PAGE_ORDER when struct mutex is enlarged by debug options like
CONFIG_DEBUG_MUTEXES and CONFIG_DEBUG_LOCK_ALLOC, resulting in:

  WARNING: at __alloc_frozen_pages_noprof (order > MAX_PAGE_ORDER)
  kernel BUG at mm/hugetlb.c (BUG_ON(!hugetlb_fault_mutex_table))
  Kernel panic - not syncing: Fatal exception

Switch to kvmalloc_objs() so the allocation falls back to vmalloc when
the contiguous physical allocation is too large.  The table is only
accessed by index, so virtual contiguity is sufficient.

Fixes: 8382d914ebf7 ("mm, hugetlb: improve page-fault scalability")
Signed-off-by: Dheeraj Kumar Srivastava <dheerajkumar.srivastava@amd.com>
---
 mm/hugetlb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index cea25773a6c9..6fc5c0bdb500 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -4177,7 +4177,7 @@ static int __init hugetlb_init(void)
 	num_fault_mutexes = 1;
 #endif
 	hugetlb_fault_mutex_table =
-		kmalloc_objs(struct mutex, num_fault_mutexes);
+		kvmalloc_objs(struct mutex, num_fault_mutexes);
 	BUG_ON(!hugetlb_fault_mutex_table);
 
 	for (i = 0; i < num_fault_mutexes; i++)
-- 
2.25.1

