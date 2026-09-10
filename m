Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013054.outbound.protection.outlook.com [40.93.201.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C11B03806DD;
	Thu, 10 Sep 2026 19:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789067043; cv=fail; b=kyo64iyBC9EP/dk6US1FpLKupEt7vttwPN17iEAUwuA38Wr6z+shwHh/w7+KJLuykQH9WqsTuWaxmAeRJe5MqHC1C1djt1Cplt2hztB7bLBw/v2KScRjFW5UUCrB+Y9zGq+xTST4+/XVDdeZjDiffF/vSynqrz+LVGtTTMQPPMA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789067043; c=relaxed/simple;
	bh=WWbegIBKTw2uDgzj2R/ZRydw2hn5bEiIB2wcGkdv3iI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XKUOtSICEhXyln27keTPoMvhGAroslBV+qJdPqknF9s3FIdErxZLuuxRBUYmjNgb1UBaCvYY/zNkZedSKzy3ggI7bQeR8E3Mf1HK0JwvtneFUu1GDnYJhEIQAJensavzDelxv6v/acxQcmMTi8ik0ZP5LwnolRrGrH7fnKC3aCo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=vlgT5YZr; arc=fail smtp.client-ip=40.93.201.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="vlgT5YZr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qo7rnmpbhgc+lngqxVA+vJBwDStuseE1FF3ByMHev7kMn/GmsyFMDnZrmt2US4iF89eFMduEjU+WkvtNxgR5AoLxsS6olNBohexVWbHeoZDPlm2VCsQqdAGVnHJkC/zes5LEIwIGV6q6YAKiIbjdY2rqDtwFXYTwuWheY7ovYjuxP7iHqNst+vkY1bxeh+WdkCsT1iCXqYAB0cT/4dLEA0xiJZBCHSA6T5bSNs8sR/B8SU6uz7dl7D71Rax9X50IjSYRp6EaQuO4U3Ts05CRiPyZyCix3VyicFHd9OjeWAPvdVqR2W4ZXooxRehQw+uS267Y1Zwi4gQU3Bed9bMM/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tiOpBFRBvRm0K66/4TkxMig41VXxidgWYGNEFVnCjHQ=;
 b=yGrheqro+ELWa0PxjH6ldHZ7CABstyHVsIOwvH1p3ziehcp+xF2UA7/bsFLtCCI8hUjPZTDsA6K1KiHyBooa2mjg6XFEEf4UgL6TygqankzmEHHwq9dihM08BORZN2GSFXaoPes9eFcl79iv4h5mv3/7ngcqT/1SLit2iCxkXiMOf/WGaUyBsJJCJAxQHNl0Y8SRdh88P/9lOQu80IIr8vf2Zedbu0Zb/d9+ucicOuPistIKE1t5lJ1vT/lmDfc7+LaPKXOV7eGrEYZglZK/HNPIpS3spn9I8TeT/fFmVU6clqDMRej3k3dmcNywF0ZG3eG5HEjG9DH3w9XscE80JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tiOpBFRBvRm0K66/4TkxMig41VXxidgWYGNEFVnCjHQ=;
 b=vlgT5YZrEIPlaaCWWVLJqA/IJLjClCp6oy5Znqtf90BZpMD8gjhmsBZ9ekO1ZsKA6cRC3snETJQ9Alpg4bHMrDbXnkPxDK5urOF2KTHVg/saafJAWCa7B36JpEnjECmuB1pSWJPlTCkHkwVWNiWpQAapAmliz/bxwd5KNqHzdT8=
Received: from BY3PR05CA0017.namprd05.prod.outlook.com (2603:10b6:a03:254::22)
 by PH7PR12MB7985.namprd12.prod.outlook.com (2603:10b6:510:27b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Thu, 10 Sep
 2026 19:03:59 +0000
Received: from SJ1PEPF000023D2.namprd02.prod.outlook.com
 (2603:10b6:a03:254:cafe::87) by BY3PR05CA0017.outlook.office365.com
 (2603:10b6:a03:254::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.4 via Frontend Transport; Thu, 10
 Sep 2026 19:03:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000023D2.mail.protection.outlook.com (10.167.244.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Thu, 10 Sep 2026 19:03:59 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 10 Sep
 2026 14:03:54 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 10 Sep
 2026 14:03:53 -0500
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.46
 via Frontend Transport; Thu, 10 Sep 2026 14:03:50 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH 2/8] soundwire: amd: cache ping slave status to avoid spurious disconnect on timeout
Date: Fri, 11 Sep 2026 00:30:50 +0530
Message-ID: <20260910190240.1604447-3-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260910190240.1604447-1-Vijendar.Mukunda@amd.com>
References: <20260910190240.1604447-1-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D2:EE_|PH7PR12MB7985:EE_
X-MS-Office365-Filtering-Correlation-Id: 191463cc-2358-4f80-3ed4-08df0f6e452f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|23010399003|1800799024|376014|11063799006|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	iQgyEnihaqxseMIlgegPwH2K9bRM4NGUl+T4KXzHPOw94gyUhNtwd/m7TAmKCDyf3h5MuoeQzWThULdZgKPoealfAboowb3rmZRLh2wKRGXl8TJF4y70X+kSRN6/KpeoGLJGL+z9c96B1BOB4INO23feK+IG/Ek6zcZVdfr9n/AKXf19anI5fp4cJ1pJAeZMazUXPaU9ZAevtVJFWA/FibmIVIGeT5/AQMg3SxWBeB/2e+OT3aUZtHMEEL2tk2BzURTSy6dJ39rh6g0teEfCiVFBhBJWyhBWxkRbHXrzxyqBWvyJRXn8OtMY66OAyKmfRKmvHXjYuJNvySTqyvy3pI9Z6i4mSij5pjiPIiVzzlhCi4O8PoCY7Bxch5vDbpBE3VCWNQ/tnKRtFpJ/7iQv2oqhmvVrMh0fR1NgLtxWHf3zXY0zVpuYv9drvlhoLJccfgsJN45n8hr8j2VDXwi9OkX9P+OPyReNvMPaayL0Dg54BmVRY0I3BD/6MNz6KHmBtt3v0lNTqPnpZfgLwnLYTT+0po3y2JvzeFxRih9cFxpNqXpJjQWbpJAu5Yx/irhOeZLHlSAcS2miyiET3RlVFzDckJ+lb4x7HiQjZ43w4Yql98ICI44wbYe/7AgsjRQOgNFGAOGUZS+83+gMyhsFmzJr0LV72eyGE9aovVTBYHvL+TrH+0eYEbalOj/gi7fUrkUX5BK6CCiOUudTgZiZzQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(23010399003)(1800799024)(376014)(11063799006)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	zIRhonMZjMLl9i/rUnUnOvJ7ei5J1AbCyXDQL6NKIBF84lux0GJEJBzV0mL0+1AzIokrL9IPH4TnUQPuyjWgHiH+bzrGLs6c2P/BICcLQlu/Tg6FElPeyeOTCkjARAgxweM+mrdCqaEDPqlx3aSWrHCq3+xQzpnm0tXMJI3p/7+C4cp3dUqvNCxC+vmUN5BxU5gB+V+VrWOBFosPFkwtv3Jz078bpz610HVC16cGvzoQBfNfhDQg0bA5Lx5ozzycCeAO+UxSFdDD2gpbH6dsb5ToBHJ5fySCz2oENSJLT99nbv5ZNGVHaoksmtrFvojnmFxFXTQFbbzBZS0TzS245B3oO4w9r42dtfbQbbmVx1NPMbY6J4j4LuWTMjBKf98JHD8Wo9pYp2heB8mGTn8KYpRUs2Z/Cn7/ZGUjS+5rqmdtxJ+Wzqi+BBgbuWSyX/00
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 19:03:59.0437
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 191463cc-2358-4f80-3ed4-08df0f6e452f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D2.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7985

Add ping_slave_stat to struct amd_sdw_manager to cache the slave_stat
from the last successful ping response. On timeout,
amd_sdw_read_ping_status() returns the cached value (or 0 if no
successful response yet) to avoid the spurious "no peripherals
attached" warning from sdw_show_ping_status().

ping_slave_stat is initialised to U32_MAX in probe and reset to
U32_MAX under msg_lock on entry to the POWER_OFF_MODE resume path,
before any hardware step that can fail and return early, so that a
partially-failed resume cannot leave a stale pre-suspend value behind
for a subsequent ping timeout to report.

Add lockdep_assert_held() in amd_sdw_read_ping_status() to document
that the caller must hold msg_lock.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_manager.c   | 21 ++++++++++++++++++++-
 include/linux/soundwire/sdw_amd.h |  3 +++
 2 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index fa3f4e797edd..a57b59609bfe 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -453,6 +453,9 @@ static void amd_sdw_read_and_process_ping_status(struct amd_sdw_manager *amd_man
 				    amd_manager->instance);
 		return;
 	}
+	amd_manager->ping_slave_stat =
+		FIELD_GET(AMD_SDW_MCP_SLAVE_STAT_0_3, response) |
+		(FIELD_GET(AMD_SDW_MCP_SLAVE_STAT_4_11, response) << 8);
 	amd_sdw_process_ping_status(response, amd_manager);
 	mutex_unlock(&amd_manager->bus.msg_lock);
 }
@@ -463,15 +466,19 @@ static u32 amd_sdw_read_ping_status(struct sdw_bus *bus)
 	u64 response;
 	u32 slave_stat;
 
+	/* Called by sdw_show_ping_status() which holds msg_lock. */
+	lockdep_assert_held(&bus->msg_lock);
+
 	if (amd_sdw_send_cmd_get_resp(amd_manager, 0, 0, &response)) {
 		dev_err_ratelimited(amd_manager->dev, "SDW%x ping status timeout\n",
 				    amd_manager->instance);
-		return 0;
+		return amd_manager->ping_slave_stat == U32_MAX ? 0 : amd_manager->ping_slave_stat;
 	}
 	/* slave status from ping response */
 	slave_stat = FIELD_GET(AMD_SDW_MCP_SLAVE_STAT_0_3, response);
 	slave_stat |= FIELD_GET(AMD_SDW_MCP_SLAVE_STAT_4_11, response) << 8;
 	dev_dbg(amd_manager->dev, "slave_stat:0x%x\n", slave_stat);
+	amd_manager->ping_slave_stat = slave_stat;
 	return slave_stat;
 }
 
@@ -1087,6 +1094,7 @@ static int amd_sdw_manager_probe(struct platform_device *pdev)
 		dev_err(dev, "mmio not found\n");
 		return -ENOMEM;
 	}
+	amd_manager->ping_slave_stat = U32_MAX;
 	amd_manager->instance = pdata->instance;
 	amd_manager->mmio = amd_manager->acp_mmio +
 			    (amd_manager->instance * SDW_MANAGER_REG_OFFSET);
@@ -1414,6 +1422,17 @@ static int __maybe_unused amd_resume_runtime(struct device *dev)
 		}
 	} else if (amd_manager->power_mode_mask & AMD_SDW_POWER_OFF_MODE) {
 		writel(0x00, amd_manager->acp_mmio + ACP_SW_WAKE_EN(amd_manager->instance));
+		/*
+		 * POWER_OFF_MODE tears the bus down completely; invalidate the
+		 * cached ping status on entry, before any step that can fail and
+		 * return early, so that a partially-failed resume leaves the first
+		 * post-resume ping timeout returning 0 rather than stale
+		 * pre-suspend data. CLK_STOP_MODE leaves peripherals attached, so
+		 * the cache remains valid there.
+		 */
+		mutex_lock(&amd_manager->bus.msg_lock);
+		amd_manager->ping_slave_stat = U32_MAX;
+		mutex_unlock(&amd_manager->bus.msg_lock);
 		if (amd_manager->acp_rev >= ACP70_PCI_REV_ID) {
 			ret = amd_sdw_host_wake_enable(amd_manager, false);
 			if (ret)
diff --git a/include/linux/soundwire/sdw_amd.h b/include/linux/soundwire/sdw_amd.h
index 470360a2723c..12537904e34a 100644
--- a/include/linux/soundwire/sdw_amd.h
+++ b/include/linux/soundwire/sdw_amd.h
@@ -76,6 +76,8 @@ struct sdw_amd_dai_runtime {
  * @acp_rev: acp pci device revision id
  * @clk_stopped: flag set to true when clock is stopped
  * @power_mode_mask: flag interprets amd SoundWire manager power mode
+ * @ping_slave_stat: cached slave status from the last successful ping response;
+ *                   initialised to U32_MAX ("no valid reading yet")
  * @dai_runtime_array: dai runtime array
  */
 struct amd_sdw_manager {
@@ -105,6 +107,7 @@ struct amd_sdw_manager {
 	u32 wake_en_mask;
 	u32 power_mode_mask;
 	u32 acp_rev;
+	u32 ping_slave_stat;
 	bool clk_stopped;
 
 	struct sdw_amd_dai_runtime **dai_runtime_array;
-- 
2.48.1

