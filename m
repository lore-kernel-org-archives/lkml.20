Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012042.outbound.protection.outlook.com [40.93.195.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B757399D0D
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 10:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788865174; cv=fail; b=Ht/BqcnkqNqh8hl0U8WV37haHafu28tepO9Jmq9wt221m5JUE9YcrnJwNUkXVA4lGgI0N6QBNooL5Iq/lR6qA3LhCXU9q9YVUSgqS+yZZ9SvZtpH9mDwB8fenYAZ/nbDV9raMsNfiOWEaw3dSVzRLmfiyAkXJdK/vRygnGBQo30=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788865174; c=relaxed/simple;
	bh=hHenXxzCMt6XI1wyjlBzDQS3oaanvZImZC6muenXvyA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=sMiuyjJUJGhwoGc91TEWmtTKgKcrvwQAa5cFNTlOaXF32BvDA1bERrBsQMgeZeP8Rzu5L+r3jgZmhJtZ5/e4j/7K15X3neY/vS9UJYggVs09SXqZLkZCEiM6QxqXTPlfzuNciEQxeQGZoEyZS+D/Z36ROKZU8+79sFGoUncSDJM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=lExnoWMs; arc=fail smtp.client-ip=40.93.195.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="lExnoWMs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=id2SmDncqASHBzJXfpMLDpOYtSv03izP67HYZOJM2CE4oF1j02NAzPW88Txrgp5Lkdb3NVJyzyF3eeQ4uCfvX8pGZ5bZIv8zOdyRN7kXxZ0iemMj1r7SEHeZlm9B+GFPugpIAZSeZC8J5aiwfNglzdEGgAPz+gRXMp1wXrkWcfbs4jEdRFJuLO2XJpmJEumK+6MHZY672sec+B4uAd7JTCBiezyef3vkZMIXWYTDSUpl+TcxHnP7xWFTNcuB4CEeQ5XFQhPR9sE8kqdvT34ryzCoWr81lc81p8ep10N86ib2FkOMveits01/onRrUQjogJUhMyErEOj7NXyjGPWcGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YXy66010Ea9bcSZVXjugEmNH/Q0BdGzKnqum6iQhNIE=;
 b=DYoPzpMUgptGlkw+yE2pGUssbEFhYsXKf350w699iomVAGBO/PtpSgXCde/EaEM974qg05EKV+K3FzR0EYWmCsOTBt1vRQT/qfLTwc3SsWIrEVPzMG+eQialFzEaUgK/mFbt5vjh0ZvoUiRicwlCYoNjNjj/bm4OG0K0bB2QFQldNpOJ7O63e+llS2QivHGC0Q328HJKfSOheqd1G0fHmqH0IO/OKOO+A8U7QE1Jhk1DGnxJRLeKd/1AckvINdFpPgh33XKTOLTxDq4YCxyrxf6nP9UauEOUmtb6Vpgb5gpIEIMbZWo5UeA2+e2Pg581ddRhCW+LqoKUEy+bSZh+EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=bootlin.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YXy66010Ea9bcSZVXjugEmNH/Q0BdGzKnqum6iQhNIE=;
 b=lExnoWMsJHJgg+8epvaj0AnBTPlFbY9qHooSz4/i1O4RIDkZPR/YAeVwtCOaNk4nxbIb26hKcEnN8tf6RNsXabeyMk5fW5daM3BLu12Lv0Ief+dXKMGJ6nQeAbxIN3059KAN5Q/SwYdx3oup8eyXVSWZu3JxiJArxXDZawHiA0c=
Received: from BN9PR03CA0512.namprd03.prod.outlook.com (2603:10b6:408:131::7)
 by DS7PR12MB6072.namprd12.prod.outlook.com (2603:10b6:8:9c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Tue, 8 Sep
 2026 10:59:29 +0000
Received: from BN1PEPF00004683.namprd03.prod.outlook.com
 (2603:10b6:408:131:cafe::8d) by BN9PR03CA0512.outlook.office365.com
 (2603:10b6:408:131::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.7 via Frontend Transport; Tue, 8
 Sep 2026 10:59:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF00004683.mail.protection.outlook.com (10.167.243.89) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Tue, 8 Sep 2026 10:59:27 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 8 Sep
 2026 05:59:26 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 8 Sep
 2026 05:59:25 -0500
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.46 via Frontend
 Transport; Tue, 8 Sep 2026 05:59:23 -0500
From: Shubham Patil <shubhamsanjay.patil@amd.com>
To: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>
CC: Frank Li <Frank.Li@nxp.com>, <linux-i3c@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <adrian.hunter@intel.com>, <git@amd.com>,
	Shubham Patil <shubhamsanjay.patil@amd.com>
Subject: [PATCH] i3c: master: amd: Report direct CCC read length in payload.actual_len
Date: Tue, 8 Sep 2026 16:29:19 +0530
Message-ID: <20260908105919.3262254-1-shubhamsanjay.patil@amd.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004683:EE_|DS7PR12MB6072:EE_
X-MS-Office365-Filtering-Correlation-Id: 579d5fd9-1f8b-48ef-204d-08df0d984098
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|23010399003|376014|10067099003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	7twIX8GPzz0GvTlnUmHctlo8koibHYtp9vPkYSSlEQQ1zbHxDYBF2X3diVsbfwXSUmlbub2sadIrHaiW5iQx/E3UfpA+ZYvfrY8+8FBQaTV07Qm+/c2xnTxYTALJjAqiD7QwdNuX9a+0n2TxeV+Pmb+yCGssBgrL5bcqAL/8NdEeEQf5Xb49cTKokP5GtgGP2GyyClABjoLqSM+IyOhygLVoR2+pZpblCkA1z2A2m6raQtzAel7jdLLjeOgR8mmLCCMXuE5Yy5c8PNIPjzkl/Z4Z5INORv5jw5Qzn86eiAwFRejIkM6MmuxCRowuR8oihSpbGh+sNtJd2hW0nSxKbiVLkqukpYxz48vUFH+nLwPzsmjWlAEU13L036rzCzr8v6mThhXX7pyIDpp4QyqAjRaHSvTAsQ/A2Zme9pKPOtGJ6tIBxbLNIGe7prLNHhcA2K2yYuuGUph37Qa+sG1mDDUUqIMRMlFeEHCWGCHcM4A6HXRLTvynVypL+jeRm4a0k93lHS8uz0QjSrV+ReyYrFp1kSnn/O+0rfLInJu42XyAcnsOSOPeJH4khvKiQG3fR5sXK0trZKcYcGY7v5ETm/Uqb82yqNWLreYldd5v2RmGOhoakAOPt2PvQ9aOtbJY91yYscw1U2qP5FkF92SdkF+StXle/FCG/xzyoOT9N+DfJWFGU949JXbEZYkLp2uWa1QKSGFx4m8DMg37mp0iCQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(23010399003)(376014)(10067099003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	jx/58ge0bDZI0WNWYwIDk1E05ttnkc2BidIEDHnstq2JFzlJw+/RHbNwlDvFPXSH9ZjFspzYWJjCcpJI3jCshidGgFTjJ2k0LC3cxcHpCS8ZAKTUCxdajNNIxoIoZLxjLFjovac+Cv7qkVy1yZiRe5tQbz0XM58GZPG7Ct+8yH4tslr2cK0hKWnGtcK1ylGpdR4tzcXx9e3uWtt+h+/1PNxJ+LBbsL7Wr3wZnBKUpUoRuBwMIbliOZJLFEMvd5eZWOm8ChzsU7TT3Ve09mLlaPh/j+9wHs53o1BlpFo1GyqJwMRCD4ef0kycyrFsFfB9YRylXBzU567zngx4mk8SdmH8glLpisGwkd5v4UwQs6nI5lKrVDm0b55LA44C/gi/kqc+IsNLbpDP4qAAuwJa3vQwG7xLqHoQw9A4hbtgQ7b166vI8PQOn7JiIqeyldXp
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 10:59:27.9320
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 579d5fd9-1f8b-48ef-204d-08df0d984098
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004683.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6072

The I3C core expects master drivers to leave payload.len unchanged and
report the number of bytes received on GET CCCs via payload.actual_len.
The AMD driver was overwriting payload.len after direct read CCCs.

Set payload.actual_len from the directed command's rx_actual in
xi3c_master_send_direct_ccc_cmd() instead of modifying payload.len.

Signed-off-by: Shubham Patil <shubhamsanjay.patil@amd.com>
---
 drivers/i3c/master/amd-i3c-master.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i3c/master/amd-i3c-master.c b/drivers/i3c/master/amd-i3c-master.c
index ef5ad5abb788..f205aa06f9b8 100644
--- a/drivers/i3c/master/amd-i3c-master.c
+++ b/drivers/i3c/master/amd-i3c-master.c
@@ -806,8 +806,8 @@ static int xi3c_master_send_direct_ccc_cmd(struct xi3c_master *master,
 
 	/* Report actual byte count so the core sees the right length on short reads */
 	if (!ret && ccc->rnw)
-		ccc->dests[0].payload.len = min(xfer->cmds[1].rx_actual,
-						ccc->dests[0].payload.len);
+		ccc->dests[0].payload.actual_len = min(xfer->cmds[1].rx_actual,
+						       ccc->dests[0].payload.len);
 
 	return ret;
 }
-- 
2.34.1

