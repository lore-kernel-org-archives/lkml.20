Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012066.outbound.protection.outlook.com [40.107.200.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBB644C9E00;
	Tue, 22 Sep 2026 20:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790108635; cv=fail; b=pg1lojKwXFFqkdtClX3supJqp5IKyAgZ+gRojvbKJiktyJGyQdjTxOE8AgE5gnKFkZmtzo631Ni0aNDeFXo10ayZd4QJO/00/zkPuNCzVxswD6g5+/1YdzxC4vFCptNLmbmE/aoZNoYO6TeKSf/74jXRpJIKrW0GAtpl8BQRXsI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790108635; c=relaxed/simple;
	bh=fgl8K2G2mEYm0TbM1kK6I/tcydp1shlswC5LSoC/YGs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=M4vbtMtAKIH90LUZDLjoLMkUxkonfu0GFx61oOSwrTUQYg3Yln9VfGdDj5axbT+HBfhjAx266tj5an6FeazAXAh8DJKrzPkBHVv0LW3NdSLeNSpW4jslaetLbeTKV4gcYw2XDxiUudndWHpQ9Ou/pSM9EaY+ToKgOnVjrb5bWN4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=xcnn7PrG; arc=fail smtp.client-ip=40.107.200.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="xcnn7PrG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vl/oti7ZPKZcUH7ZlweqJyYqIqCFSRhKTWK4Ab4Dom8Cq0i+3CEG8h4geqqqhwCVuTy8p2wG9Z9iNJM+RHvqcbpx/WbrEmd3O5oFggOmA6MOwnb+jvusbmvUtyLEy9Z6mce0oUTrbehrB83vgMK727IyG4J0TDbk1tMUW4bsZymJaBwJQ/ybotj1IskpkHRb4OYa30vWc3KghL0MHcVNlbFM2mR5lsBqvdVnTBDGQ433A+j5tdQxkfJ0s4AxXTIypgTXnyoucBXD0l4L5moIBENyAH72gOvJxfMLQycMvxpqRiq6vH9LjyBIeOJwbXSNo0P21JDOlYkeGvCoa7itgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VrD9KNDkYMxjZsmr4O9UNRTp5oJnmf7HlGCPpZu3FTo=;
 b=Ih++3ozpA23eVjkRBtq+ulMdhNOwQNTGO5Kk/Mh/CzPoMewyHdNn61/HoYiMglFhEf1Di9Tx4PWmLtID7CIZHM+IqLP4naSfSfUEE5ZIotmpS7Zeut6q+LkMCESbB8XtoKA+ZhS7hQME+LhtEVTTomG97KRw9/aItGGXFIkDjbZhB9dERVOBpRXl5vQeaSpFQwBQqb6MdJ93OaXhNwylVSFMDfATf4LHT8xvo5RDg5aOBpRcBQ46a6yOB9bnYBp+slOqiTiL7ObPLHyoytTDSDCLic5IWGtHrRjeO7I32mdUlHBN4oE5F9TRXEeB64OxuQz1CnpJIOh5djMwq/0uzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=alien8.de smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VrD9KNDkYMxjZsmr4O9UNRTp5oJnmf7HlGCPpZu3FTo=;
 b=xcnn7PrGjcMmup9QEO3Iosf5ZM/3w+6zE//kFpWVQLGD1E/2Ujyky5h+EDUegO70PCxYfRlRJ1F/4niS79zt3qndCIJGbNInYx75M8kXeY2JJgbJ988EViXhnY1KgEdCloXRwBH/a7dCqeWs0yQh5EsiCkOHpVN11L+Ngy6qbWg=
Received: from SJ0PR13CA0020.namprd13.prod.outlook.com (2603:10b6:a03:2c0::25)
 by SN7PR12MB8028.namprd12.prod.outlook.com (2603:10b6:806:341::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Tue, 22 Sep
 2026 20:23:34 +0000
Received: from SJ1PEPF000037A8.namprd03.prod.outlook.com
 (2603:10b6:a03:2c0:cafe::28) by SJ0PR13CA0020.outlook.office365.com
 (2603:10b6:a03:2c0::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.11 via Frontend Transport; Tue,
 22 Sep 2026 20:23:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000037A8.mail.protection.outlook.com (10.167.244.181) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Tue, 22 Sep 2026 20:23:34 +0000
Received: from quartz-7b1chost.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Tue, 22 Sep
 2026 15:23:28 -0500
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: <bp@alien8.de>, <linux-edac@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, Yazen Ghannam <yazen.ghannam@amd.com>
Subject: [PATCH v10 1/7] RAS/AMD/ATL: Make PRM address translation support builtin
Date: Tue, 22 Sep 2026 15:23:11 -0500
Message-ID: <20260922202318.4079080-2-yazen.ghannam@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260922202318.4079080-1-yazen.ghannam@amd.com>
References: <20260922202318.4079080-1-yazen.ghannam@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000037A8:EE_|SN7PR12MB8028:EE_
X-MS-Office365-Filtering-Correlation-Id: d0e65383-1e1a-4a4a-aae4-08df18e76076
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|82310400026|36860700016|1800799024|6133799003|22082099003|18002099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	uWlKvpa5PR6vOrNAJ4uf29kq2SAdr2BxcEYUeeJxHHVn0WArc2fMSS1oBaI2C0tUNkFMW+oh971pecrphEOpvZybDfVYE3uCgNvrrTObdVFhk/M/tVgEHgvCKb77TLSSuA6EhNgazqGuu9JSQlea+3Clf+Zrf7YQI06Ak2nR2T5RI7wCQP91Amn3iMt79ohnZd11vrA1JLaJW47EFlNN7xDLLm4d6a+CvI1QcOlNjYxTGe9fmJ5g+wEYSnDOH41p30yqQAnychcjoRJ/Xvn1y+XsBIRWuWPTh2rN6g0RKbG9LanFl3bQPXIgNDCg7TBmXWDErV+IOay25R+Umj+JqiDxyiuy9amWOOppJrIymgts+hjfswuk4enKs1ONJXNM/wBtyckoVBJfhp2PaqnCvbiJrSQIrlR7/ah3qX6xLZ+G2Y2DeB1nZ+ChacyJFJMFx8qi1n2CMI8xIG+2gsZzkV1/xbXhgoTgqUhtzfPluvPad/W6bTZV01MambVju5KoHfLYBgrY38iOyAnxAeBKnNRS1OLts1oMgnQxuFGFVCGXyz9xC+U2aFNnTrlIOtBJ6DJFGXvia2/chCc6L0giBFLR4rXCSlFSCnOO3bgQQ073+KTEPw6ZQrbgs85rSwgIcIiuPPSlCPV0QFRzfb6jwnziEaSdhd9gkllLnH9sshZpsEp6XgT4FREylLOvwCH7U8gHLkjMoteq61aLdjeEaQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(82310400026)(36860700016)(1800799024)(6133799003)(22082099003)(18002099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	+2mBwRS23LjAtghx+BKe0gRRBUgSIpFUuLQNdrY3e/LbRvJZTsbi+ZLgNfI3ULOzvspqlb031r802MxJVTOl3OIGk+yEE/R9ax1wavl/rslAnk9qGe3HKekd09UcCUZWhsdAkSYE3H9AfI9hCZLdHQyw82DWHe4L/8mbP8qyg01LX5xq+8A+g5xVMzzmwg6/cUBc2CfMSeGR0g5OzFxGecyafUwnZOJ5u4wSqEf/0a5wxkmcztOn3I5uMMgxg1dJOpOjBgx6oQ25GikBApB7mAXkAwh3Upt3ZFast+PCJqVhZKIQw0AvnodovhnGcHr77NVaMyyK4vH3jIU2xFRWCu5qz0/j/V6Q2hm3WyJ0E5w+nwzc3Peon4Uyazj/jBPPuwN+BfXghYHhFA4rbwV8nN3Ckc4fAYLM/j8dG184HTN4zvHS7a7XlY1G29bROBtT
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 20:23:34.3554
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d0e65383-1e1a-4a4a-aae4-08df18e76076
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000037A8.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8028

PRM (Platform Runtime Mechanism) is the only address translation method
for current and future AMD systems. The library should therefore always
include it.

The PRM helpers in <linux/prmt.h> already provide stubs that return an
error when CONFIG_ACPI_PRMT is disabled. Make prm.c builtin. The library
then falls back to native translation at runtime when no PRM handler is
available.

Assisted-by: LLM
Signed-off-by: Yazen Ghannam <yazen.ghannam@amd.com>
---
 drivers/ras/amd/atl/Kconfig    | 4 ----
 drivers/ras/amd/atl/Makefile   | 3 +--
 drivers/ras/amd/atl/internal.h | 8 --------
 drivers/ras/amd/atl/prm.c      | 2 +-
 4 files changed, 2 insertions(+), 15 deletions(-)

diff --git a/drivers/ras/amd/atl/Kconfig b/drivers/ras/amd/atl/Kconfig
index 44c2fd7febc5..29befaf2a1e2 100644
--- a/drivers/ras/amd/atl/Kconfig
+++ b/drivers/ras/amd/atl/Kconfig
@@ -19,7 +19,3 @@ config AMD_ATL
 
 	  Enable this option if using DRAM ECC on Zen-based systems
 	  and OS-based error handling.
-
-config AMD_ATL_PRM
-	depends on AMD_ATL && ACPI_PRMT
-	def_bool y
diff --git a/drivers/ras/amd/atl/Makefile b/drivers/ras/amd/atl/Makefile
index b56892c0c0d9..ff52452b678f 100644
--- a/drivers/ras/amd/atl/Makefile
+++ b/drivers/ras/amd/atl/Makefile
@@ -12,9 +12,8 @@ amd_atl-y		+= core.o
 amd_atl-y		+= dehash.o
 amd_atl-y		+= denormalize.o
 amd_atl-y		+= map.o
+amd_atl-y		+= prm.o
 amd_atl-y		+= system.o
 amd_atl-y		+= umc.o
 
-amd_atl-$(CONFIG_AMD_ATL_PRM) += prm.o
-
 obj-$(CONFIG_AMD_ATL)	+= amd_atl.o
diff --git a/drivers/ras/amd/atl/internal.h b/drivers/ras/amd/atl/internal.h
index 82a56d9c2be1..4fc4bc3c3500 100644
--- a/drivers/ras/amd/atl/internal.h
+++ b/drivers/ras/amd/atl/internal.h
@@ -287,15 +287,7 @@ u64 remove_base_and_hole(struct addr_ctx *ctx, u64 addr);
 /* GUIDs for PRM handlers */
 extern const guid_t norm_to_sys_guid;
 
-#ifdef CONFIG_AMD_ATL_PRM
 unsigned long prm_umc_norm_to_sys_addr(u8 socket_id, u64 umc_bank_inst_id, unsigned long addr);
-#else
-static inline unsigned long prm_umc_norm_to_sys_addr(u8 socket_id, u64 umc_bank_inst_id,
-						     unsigned long addr)
-{
-       return -ENODEV;
-}
-#endif
 
 /*
  * Make a gap in @data that is @num_bits long starting at @bit_num.
diff --git a/drivers/ras/amd/atl/prm.c b/drivers/ras/amd/atl/prm.c
index 0f9bfa96e16a..eba9d104d09e 100644
--- a/drivers/ras/amd/atl/prm.c
+++ b/drivers/ras/amd/atl/prm.c
@@ -44,7 +44,7 @@ unsigned long prm_umc_norm_to_sys_addr(u8 socket_id, u64 bank_id, unsigned long
 	if (!ret)
 		return ret_addr;
 
-	if (ret == -ENODEV)
+	if (ret == -ENODEV || ret == -EOPNOTSUPP)
 		pr_debug("PRM module/handler not available\n");
 	else
 		pr_notice_once("PRM address translation failed\n");
-- 
2.43.0

