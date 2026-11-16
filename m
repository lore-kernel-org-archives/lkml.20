Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794845486;
	b=0HKF77Gzk7CFK11ts1Y9k2CM7O1+voYVBRR+HierU9d1+rROO3BWOVgTk0AeSXzXSUjr
	 pyJWWFGTWD2fJ2XU6K22MObhmrhu0173lydc6dfvnaatruDKoGEyg51jU7TGTHaZngi7H
	 VrXRAbfpx0y7eRNTOvIYs5j66zl4gznuJW9duEZEIA+yVTwDNf3wgQlFuZ3gUw6jRow/q
	 FX261kHb6n7A785PhXMEYW3BqoNPlYW5Mg4sz5K5z8ulTb2rZbI1wJu/0vCahscaY3efx
	 Hw3P9mpvPHTJmgDXt9ly2YpySc9Vs7xM1i+eUqatKfO7W9BFP5dOdZ42OXsr12cJj1w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794845486;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy:X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=1CYGVv49n4roaq+kYmssLi+IvD7btNE0VFtk2rNMQcs=;
	b=hJYNVa/u9WhB2isjzvKKqwH1TDsvvLGV+anjT8/tpnLQb+pp53O6FqAUEaGSw1kxnyXc
	 e3Ls1sn77If8S9BBtVRK7gQ2DK8H1jStIsx2kicVndxrKDAFjBvvY2YreO7Cskxw7Ou96
	 HUQqStkTvNyhvQSrpzInNQ21/5qyqbv2q1119vlkXp3Vid5vylwcaUGJd1Q+35bvjPihh
	 Nzd62C08RcEMzhcGT36sDBcB3ezjHLg71q6uo2qNPGgX8ko+VJmzfKqKn5r69qxJ7cMYi
	 jD8sYhdnsyoQJ0EgApb85avQdBXNYbHH1dcAZWHBA0ciu8IWaPlutoEuSJxiA0eT9EQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=BUqpzaBU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.44
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011044.outbound.protection.outlook.com [52.101.52.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14CFA606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 16:11:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14CFA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=BUqpzaBU
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ifwYybOTsRd8XXbHSahSAp1fUH7Zmh9cnr4dKZZBV8noBXQGJDh5NOcYiCVllXyXIV1puvDmQvz0FHMt3wdgfxdQYjxgknyXeyQ3ruqtgjwa0+AWtCR0bphlhh2j4kKLO2Pp7i6cF3Yat8PPhreQ+a67Mnan5UlHSfzZ6Iz4DVjDqAWNU3yYXW2fGLspu8WwXOixvcMdql8cIu/F2nhkIlA8kzuxtJHZ5tryrV+XjhwTdRUA2fjN9LuaZGHVdDKX0Yqb+46pU7DinpJMKdiQbsYs61WjGchlCMqkw7XbcFqTEJbHqhi+kmMyFcb27pVgcpKxzB1qcKWM96ZUpRNgiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1CYGVv49n4roaq+kYmssLi+IvD7btNE0VFtk2rNMQcs=;
 b=PwHRW2y97u+r9xV5lJrzcCf7RRLuSsvE2ZAmmSli121S+NTR+7+vEv31bwPLhRXLIGHw/pI2PAVPMDNMRfA//G2bNCN9m9YZoimipfOCnbuumbny7VXfiA87qVjsCJKY9iuMCUJUneeO9kz3Xr1QWIehbXYGDa/LIfBzcFeZ1futtevXB1jPKeKOYwj+Qrxy6x5lh7ztgylKa+LzP/Y4N7BWfvSl5Svi8ER67O6dfa7+1mmdV9zaCcRmY6fiUA+BR7qyNupcGEbCNjbxfcvh2jOezR6pJF24KpSMUoHY1Chi0qhtIZonm9oecNHm/cGfDQcfPuN3J4Hq/vW4YuRZbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1CYGVv49n4roaq+kYmssLi+IvD7btNE0VFtk2rNMQcs=;
 b=BUqpzaBUEr4RdJEvHHn0b0ldpqV3MNYi85UHYT5VrW4+tNsdk95SEG+Pfwjhhics9dgUY/+CM/IR3yMSIsHz34RvdrFSYkMN15nZ4RhQkomLb569p9VTAyxSxOpv7ZRZ4ojCUjVtVUHwLcPrCwMg93JKOxPUsDToEXeeHszjRTs=
Received: from BLAPR05CA0020.namprd05.prod.outlook.com (2603:10b6:208:36e::23)
 by SA1PR12MB7101.namprd12.prod.outlook.com (2603:10b6:806:29d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 16:11:16 +0000
Received: from LV8PEPF0000005C.namprd02.prod.outlook.com
 (2603:10b6:208:36e:cafe::23) by BLAPR05CA0020.outlook.office365.com
 (2603:10b6:208:36e::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.7 via Frontend Transport; Mon, 16
 Nov 2026 16:11:16 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 LV8PEPF0000005C.mail.protection.outlook.com (10.167.245.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 16 Nov 2026 16:11:16 +0000
Received: from alysaliu-dev.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 16 Nov
 2026 10:11:15 -0600
From: William Palacek <William.Palacek@amd.com>
To: <dri-devel@lists.freedesktop.org>
CC: <intel-xe@lists.freedesktop.org>, Matthew Auld <matthew.auld@intel.com>,
	Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>, Sanjay Yadav
	<sanjay.kumar.yadav@intel.com>, Joel Fernandes <joelagnelf@nvidia.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	<linux-kernel@vger.kernel.org>, William Palacek <William.Palacek@amd.com>
Subject: [PATCH v3 2/2] gpu/tests/buddy: add range-biased allocation performance test
Date: Mon, 16 Nov 2026 11:11:02 -0500
Message-ID: <1cd56b1074ceee96ad4cfb59122d09315a62fa78.1794845083.git.William.Palacek@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1794845083.git.William.Palacek@amd.com>
References: <cover.1794845083.git.William.Palacek@amd.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PEPF0000005C:EE_|SA1PR12MB7101:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e803baa-74d6-4385-d1bd-08df43fc3e4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|82310400026|36860700016|10067099003|56012099006|11063799006|261026121527099003|261021123027099003|261021121427099003|261102123227099003|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	YgqkuAhnuq0JXowT/Hdu4+TKtWmzzMHp4qkoXLUYeVCSVZWTmJvBSZoT1c4IFt25TCst4Dhyx+zi+LgW/flhFLuNW92FMXU6Frl+DmxWQUjteGl7oelg0lxAql9V5QSRYmnidi1013VSe54EibTliryYi5F4mu4I0nk0vSOR/28YVPsgAgIQIJ+1f/y/0uMQGPMPE8SlO/DZ/553T3HXe8OwZpEq6xAj4axelqjb8ibtbPtN6KItkHfPIQYmF74sHr03KaVGpVuYwQPhQwb2v+5XpWFrmLubBBjGe0mmXW6cC8byalINSs/4k/4A+uykrztnC5DJNC75zw+imKXSHv8WOfFITnVt4mrEAmr2v7X3FJfHO2YeFPqSG16uSzjh/GdXg6Q3QVmIZTTTEtEMFXVOYIVQL8AYFGih+4ND555WgDg1ZDv9DlwrrCiHrj6xM1gZbcFypDwgqKmfjwzzQfMfEy6/NDKLWcj2g+ND2sdvv//yKc1M+GlAtQUA3FB98gP44Gj2BRnjtZPPlFO0Yt9la7G4u+GnfoyDTR1Q2CcEshw6i3PcyBzYc1s0GG5nzbbIqEvkbB7SfuHO4jci2Cu0fQ/OSBYmusIyZp/HNhDDtwaccJCqHNFD7vy8Kv6IpQiCDPeqCzsc/XnYNn+TSsOef3le1UWmqt3BMt7giqCYkWbVlFV1vKavi7DwO4NLTKY15ror+TykVWXvXAUv7A==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(82310400026)(36860700016)(10067099003)(56012099006)(11063799006)(261026121527099003)(261021123027099003)(261021121427099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	mOfhm+qX2dPMbDGvDX3Ya1Ru+C2HaauxC5eE+wT9OH+EoLXJDhBuwOKQXlGnPpZh6Wr4PgX2cmPndFmmiKpfOXgHFGoyI4ZrhiSTPJOdGJg+M07UilWHosjM0aqfY2wWcBEudxGb12D9sb225G4dTXSraw0D6U2l4I8gKq64sea4/xmo8pO66SU7nQgQxkXfrsPdEHvKNcFS35anha/DlgO/VUyobBwQnQ4XbkuFBxR/YFYQIgOEnCn3kGkecAFIQCalH5AwxR9pHypQ9Mc4VUReH4SeC0xoSVhKjoPV64TYqYckSZAx0QjgEt+Kf3HKTuL2amnEe52uamvNmEW+edo3LnQlaFWRq7QGUT5LF6vJubiUFAi3Mjnm1nhIJ+3SsITtE32AdaQz3hGBZJn/NZM/EjSM9u82097IPKBKHuJLz+gn72DHNgmme5x2TLCl
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 16:11:16.5650
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e803baa-74d6-4385-d1bd-08df43fc3e4e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	LV8PEPF0000005C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7101

Fill a 1 GiB range of a 4 GiB manager top-down with 64 KiB range-biased
allocations that request cleared memory, as amdgpu does for KFD VRAM on
NPS4 partitions, check that each one is placed directly below the
previous one, and report the time taken: 1103 ms with the walk, 2 ms
with the free tree lookup.

Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Signed-off-by: William Palacek <William.Palacek@amd.com>
---

Notes:
    v3:
    - times for the new base and lookup (1103 ms, 2 ms)
    
    v2:
    - check top-down placement

 drivers/gpu/tests/gpu_buddy_test.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/gpu/tests/gpu_buddy_test.c b/drivers/gpu/tests/gpu_buddy_test.c
index 9aaca2fc6a02..e48a99136e68 100644
--- a/drivers/gpu/tests/gpu_buddy_test.c
+++ b/drivers/gpu/tests/gpu_buddy_test.c
@@ -283,6 +283,32 @@ static void gpu_test_buddy_fragmentation_performance(struct kunit *test)
 	gpu_buddy_fini(&mm);
 }
 
+static void gpu_test_buddy_range_bias_performance(struct kunit *test)
+{
+	struct gpu_buddy_block *block;
+	LIST_HEAD(allocated);
+	struct gpu_buddy mm;
+	ktime_t t0;
+	u64 i;
+
+	/* Fill one NPS4-like quarter top-down with cleared 64 KiB allocations. */
+	KUNIT_ASSERT_FALSE(test, gpu_buddy_init(&mm, SZ_4G, SZ_4K));
+	t0 = ktime_get();
+	for (i = 1; i <= SZ_1G / SZ_64K; i++) {
+		KUNIT_ASSERT_FALSE(test, gpu_buddy_alloc_blocks(&mm, SZ_1G, SZ_2G, SZ_64K,
+								SZ_64K, &allocated,
+								GPU_BUDDY_RANGE_ALLOCATION |
+								GPU_BUDDY_CLEAR_ALLOCATION |
+								GPU_BUDDY_TOPDOWN_ALLOCATION));
+		block = list_last_entry(&allocated, struct gpu_buddy_block, link);
+		KUNIT_ASSERT_EQ(test, gpu_buddy_block_offset(block), SZ_2G - i * SZ_64K);
+	}
+	kunit_info(test, "Range-biased fill took %lld ms\n",
+		   ktime_ms_delta(ktime_get(), t0));
+	gpu_buddy_free_list(&mm, &allocated, 0);
+	gpu_buddy_fini(&mm);
+}
+
 static void gpu_test_buddy_dirty_tracker_performance(struct kunit *test)
 {
 	struct gpu_buddy_block *block, *tmp;
@@ -1701,6 +1727,7 @@ static struct kunit_case gpu_buddy_tests[] = {
 	KUNIT_CASE(gpu_test_buddy_alloc_range_clear_guard),
 	KUNIT_CASE_SLOW(gpu_test_buddy_fragmentation_performance),
 	KUNIT_CASE_SLOW(gpu_test_buddy_dirty_tracker_performance),
+	KUNIT_CASE_SLOW(gpu_test_buddy_range_bias_performance),
 	KUNIT_CASE(gpu_test_buddy_alloc_exceeds_max_order),
 	KUNIT_CASE(gpu_test_buddy_offset_aligned_allocation),
 	KUNIT_CASE(gpu_test_buddy_subtree_offset_alignment_stress),
-- 
2.43.0

