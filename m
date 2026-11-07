Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.200.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794066547;
	b=JXXIfIMcyIIQ2RbckXbEEF6UDcaFPPVx59Z02Ys7FGp8uDrn+pxKedU4KXD3z84g2QkF
	 /3w6gBbWLAgCxfGbXxMu3lS6hiRr0qOEA2427ruxBIyG5zgDLgFUvT4Q/IEglYuTpKGry
	 BhyuNq8za0MH55FWC3s1jtDuQpt82nZcgpgyr5UWsTE0034ql+Th3qdedGnJsxGbQa5Tl
	 eN+U4TTj8ZHmhvZXSZJbTCetVyMr2KLZNVZgOEy0/du3+h4fbfZ81U5wjmun+6wkaCdOn
	 TECIX3JY84k02ld/r1Ga40nL2urRdtNyZEVnGTw3XoCAB3QJBf0sJuUyiaNxw+0e2Iw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794066547;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:Content-Type:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
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
	bh=XbswgX07+dzTiiFG6q3F2mN+R2nvB9KbHTn684pUsFE=;
	b=mkp1010GLJhXENcUmS5HXtcpy07d9C+3hHIxYqfwvwByWX0+82pKgKDjQAYnV7JCQBED
	 MHYtY2aUttw95nlC/vSRZVB1utOinES3e6wV4hwyGw9S4RhZY9/WpD89fWg86JHsXgkmZ
	 gELuWEDjCrX3tVSbskf2xBUlJKIB0Y2AoQZw79TpcpPgam3vh1MYku15JqqevwUlTWQ4B
	 WenS9hTByczmMEREPt9eXX1kyV5wyOq1aXzZO6V1L9BorXwEYS9MA9IovbMr7G4sl01o+
	 fhFZUs6G9NUtHSdzhxr6ZezfOfx2B1qpKZS8+HOOEkw6T40Z9BT1m055Mve+1kEmzHQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=lNPiOmFl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.200.49
Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012049.outbound.protection.outlook.com [40.107.200.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36A76606EEA7;
	Sat,  7 Nov 2026 15:49:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36A76606EEA7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=lNPiOmFl
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PRmCsJUbK1zND6MxEB3CdKmobPtE6pr6WNbrdwe0LMxDJyiCDSyJAV8pZGSgb+ceyNhjpQK31ITpnFV+JWdJPwMo1R02g8E5XWcEHenhO93pYgw9BAEHD60q1GvKRPbchYwSbW9oTY4CwL+dEuTNiKisIq7cVuhWBnHAxzBX1WsEAYR8au5QvD/9qDk+RpYgcUgrAx1XVASTGmxxQ60vY4c9Wdw9fPST35HYaMSeuQPgWsU7ac+5bBkUDtql3dRUNE2vu9evbvE6N48cBMHdh3CtDlwHcEhUWMP8xma8ev84Dnp///RdhMcS/yOU/nVjS8mBi16RKPcmOyyfYsMRCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XbswgX07+dzTiiFG6q3F2mN+R2nvB9KbHTn684pUsFE=;
 b=FoOkA4+lQo5NnJcjnb0zexvtJB2QpGmbgAsjDWC6NEvQNXCvcYxh+m5m685SAC4aE6GM99v8OAxmJun7WUwCo4VbghpcWG8JLIFQvEgRvXRbswBdUTRelFEOlO0XjOvZS7wNYSA09g4+mb/MAcKvvjsfVXFuZVMV9Vm2KnFnWv7/K2z8lMeKZ+LYkoE3D8QgM4OJv5bkBfmVNqgFbKm3SAPvSn44tM70A1sG5bfxEKcGzgKsoLcMYEtwZEbLN1zIGyHGn468GsUrUJLZbHk0PMYl6FzNYFQjcXLfu34nhw0MUI9g13jvcjamPYTt0RacJdKwDJgmSBIL8WYIEjXxiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XbswgX07+dzTiiFG6q3F2mN+R2nvB9KbHTn684pUsFE=;
 b=lNPiOmFlPb5MHJ5xKq42WGX2deFZ6UmkJ+Ppm9WLgLl3jRJJOT65PV0j6tpkcAz3QWwLWLOE5Ut608buEFlQiH2xJaDeGP9mEqlCXpYhwegtBbIvLf1g54JMgxKiLmuYeQWa+8zJJLqgWoOFP4e1GeV8V0rf4WnqsvsnEumsgC4=
Received: from PH0PR07CA0118.namprd07.prod.outlook.com (2603:10b6:510:4::33)
 by PH8PR12MB7304.namprd12.prod.outlook.com (2603:10b6:510:217::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Sat, 7 Nov
 2026 15:48:57 +0000
Received: from BY1PEPF00026969.namprd05.prod.outlook.com
 (2603:10b6:510:4:cafe::1b) by PH0PR07CA0118.outlook.office365.com
 (2603:10b6:510:4::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Sat, 7
 Nov 2026 15:48:57 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BY1PEPF00026969.mail.protection.outlook.com (10.167.244.153) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Sat, 7 Nov 2026 15:48:56 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sat, 7 Nov
 2026 09:48:56 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53
 via Frontend Transport; Sat, 7 Nov 2026 09:48:52 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <broonie@kernel.org>, <yung-chuan.liao@linux.intel.com>,
	<pierre-louis.bossart@linux.dev>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<Syed.SabaKareem@amd.com>, <Mario.Limonciello@amd.com>,
	<Richard.Gong@amd.com>, <lee@kernel.org>, <Poojitha.N@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH v5 12/25] soundwire: amd: cache ping slave status to avoid spurious disconnect on timeout
Date: Sat, 7 Nov 2026 21:15:21 +0530
Message-ID: <20261107154659.3358223-13-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261107154659.3358223-1-Vijendar.Mukunda@amd.com>
References: <20261107154659.3358223-1-Vijendar.Mukunda@amd.com>
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
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF00026969:EE_|PH8PR12MB7304:EE_
X-MS-Office365-Filtering-Correlation-Id: b186ee26-24dd-4344-b9c3-08df3ce6a220
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|23010399003|1800799024|18002099003|22082099003|10067099003|11063799006|261028144727099003|261026135527099003|261102123227099003|261021135927099003|261022113327099003|261022105027099003|261022075727099003|56012099006|261021133027099003|261021123027099003|261021121427099003|261021130227099003|261026121527099003|261026140227099003|261026130827099003|261022115727099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	82w5qFRk1e1opNC4dHwJ5D59En9tA1hsj7qSFDkT4QgcT12vUr0X7wE1AJHhjyuOVAT1LW89j9n0FkrLgDrb/C3PGMvAUcD5f2/S8iour0fkUHWjN/Bv4rDVdqWv9UoshMo75iSZ7QEhIQsnzFLO7pgO39SrgedlNwFQgwmNeIIv7tXx73vE/fFGjAMt63oeAREe9d1Qb30S2bsst162P6bDYS756GXY5uJ0M+RTKReN3C5HbXbLAM9gWGlG3fAaVyNg/UP2MOJbTDiD/UX6uRl9Att2EDp9wocxCRm+TTMwBl6I468Wclqj58qNf2bKa+9sOnsG6MvnzhUka2SHqKPFzAzQ4stjoBoXbB5dSGv4w6kozy3hI8fGnkRB4UdREbSqtellQGvQR6c8EN/x/QSjTLwkfKBZM4PJqhflug/4VsV7NFBDoz/7PtxjZxcaL5nIa3RdPLg2sPR3PQA7Mmz3Dzhh/fXDQMeh2Jr62P6N6Hdz5sR/HB8eS/47KMTRNZwWWQj+FeFK/QTahVOp1ue4lNAGNr0pKl8UrzawwDF6Rkymr+X7ijln+9uRl4mNVe0emmj9QNXL6ZmoZVL5q0GlRoM2pC6e6IHoGcaYLZ2iT2yfVupjBUNcblK78/7PFLVKJwzCsGlOym5LlKIgc0vLD7NyCXM+3iq+fo9ldry9HTgKvImaYz46vmvRU5hj1qOHBd56qW8k8UwUVhmkOg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(23010399003)(1800799024)(18002099003)(22082099003)(10067099003)(11063799006)(261028144727099003)(261026135527099003)(261102123227099003)(261021135927099003)(261022113327099003)(261022105027099003)(261022075727099003)(56012099006)(261021133027099003)(261021123027099003)(261021121427099003)(261021130227099003)(261026121527099003)(261026140227099003)(261026130827099003)(261022115727099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	G7pOsdFkEVCr9Z0iIjy2XB/SeJ5Frx989ynn4DGOUzf7PVh3LM+6XI5FbXRWYVpAi988zwr4klioaKl19qr8DCGZdSCKDWZezKBTk7J3B/pQ4h+BukrhH8pa+iE8VzH0zUXFVE+vWhMx5wkvEUz1rSXMlIu6swyhRVuGtir5bG4FNSIrY0y3wj44CtnXPCut8q5JqhHSwGdb4dRf2m2Jw+BRxifuUYY64PA8BYh/UeY/cV6Vq1x19TPZlYNzTTrwd39NHKEiimn+6/31coR0VQWGVhIoMvHuxifiaSOyDIlnJTRgIsbpiWBS4sjuHZLtx+f5uUSIm+ied2jFaTAk7g9cBsCwr8nGIxs0xYyPG9sUcYUj6Kyg18jQrQvL67yYHWdZWaFsAY2dC65SUEDcqGfMJL4x9sTYycgUvdudw4I83WWQe8m8UoVl7eZWGIP3
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2026 15:48:56.8819
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b186ee26-24dd-4344-b9c3-08df3ce6a220
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF00026969.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7304

amd_sdw_read_ping_status() returned 0 on a PING command timeout.
This was indistinguishable from a valid "no peripherals attached"
response, causing sdw_show_ping_status() to log a spurious disconnect
warning even when devices were actually present.

Add ping_slave_stat to struct amd_sdw_manager to cache the slave_stat
from the last successful ping response. On timeout, the cached value is
returned instead of 0, so sdw_show_ping_status() sees the last known
good state. The timeout itself is still reported via
dev_err_ratelimited() - the cache does not suppress the error.

ping_slave_stat is initialised to U32_MAX in probe and reset to
U32_MAX under msg_lock before any failable step in the POWER_OFF_MODE
resume path, so a partially-failed resume cannot leave stale
pre-suspend data behind for a subsequent ping timeout to report.

Fixes: d8f48fbdfd9a ("soundwire: amd: Add support for AMD Manager driver")
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_manager.c   | 18 +++++++++++++++++-
 include/linux/soundwire/sdw_amd.h |  4 ++++
 2 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index d8b533875b9a..ebd3787ee6c8 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -558,6 +558,9 @@ static void amd_sdw_read_and_process_ping_status(struct amd_sdw_manager *amd_man
 				    amd_manager->instance);
 		return;
 	}
+	amd_manager->ping_slave_stat =
+		FIELD_GET(AMD_SDW_MCP_SLAVE_STAT_0_3, response) |
+		(FIELD_GET(AMD_SDW_MCP_SLAVE_STAT_4_11, response) << 8);
 	mutex_unlock(&amd_manager->bus.msg_lock);
 	amd_sdw_process_ping_status(response, amd_manager);
 }
@@ -571,12 +574,13 @@ static u32 amd_sdw_read_ping_status(struct sdw_bus *bus)
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
 
@@ -1194,6 +1198,7 @@ static int amd_sdw_manager_probe(struct platform_device *pdev)
 		dev_err(dev, "mmio not found\n");
 		return -ENOMEM;
 	}
+	amd_manager->ping_slave_stat = U32_MAX;
 	amd_manager->instance = pdata->instance;
 	amd_manager->mmio = amd_manager->acp_mmio +
 			    (amd_manager->instance * SDW_MANAGER_REG_OFFSET);
@@ -1546,6 +1551,17 @@ static int __maybe_unused amd_resume_runtime(struct device *dev)
 			amd_sdw_oe_ctrl(amd_manager, true);
 		}
 		writel(0x00, amd_manager->acp_mmio + ACP_SW_WAKE_EN(amd_manager->instance));
+		/*
+		 * POWER_OFF_MODE tears the bus down completely; invalidate the
+		 * cached ping status before any failable step so that a
+		 * partially-failed resume leaves the first post-resume ping
+		 * timeout returning 0 rather than stale pre-suspend data.
+		 * CLK_STOP_MODE leaves peripherals attached, so the cache
+		 * remains valid there.
+		 */
+		mutex_lock(&amd_manager->bus.msg_lock);
+		amd_manager->ping_slave_stat = U32_MAX;
+		mutex_unlock(&amd_manager->bus.msg_lock);
 		if (amd_manager->acp_rev >= ACP70_PCI_REV_ID) {
 			ret = amd_sdw_host_wake_enable(amd_manager, false);
 			if (ret)
diff --git a/include/linux/soundwire/sdw_amd.h b/include/linux/soundwire/sdw_amd.h
index c959d0fe2a39..2d26f357d842 100644
--- a/include/linux/soundwire/sdw_amd.h
+++ b/include/linux/soundwire/sdw_amd.h
@@ -82,6 +82,9 @@ struct sdw_amd_dai_runtime {
  *   only OE was disabled; in the latter case amd_resume_runtime() restores
  *   OE only, leaving keeper and schmen untouched.
  * @power_mode_mask: flag interprets amd SoundWire manager power mode
+ * @ping_slave_stat: cached slave status from the last ping
+ *		     transaction that returned a response;
+ *		     initialised to U32_MAX ("no valid reading yet")
  * @dai_runtime_array: dai runtime array
  */
 struct amd_sdw_manager {
@@ -111,6 +114,7 @@ struct amd_sdw_manager {
 	u32 wake_en_mask;
 	u32 power_mode_mask;
 	u32 acp_rev;
+	u32 ping_slave_stat;
 	bool clk_stopped;
 	bool pad_fully_torn_down;
 
-- 
2.53.0

