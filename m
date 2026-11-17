Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794899468;
	b=IT5mlyuhWfYzrY+rzPGan9ClDcOME9Bw4tNZkR9nd/sUdlAK7rVld80aiex1iD3+3VDp
	 MOAX6PmMWypa8ZVCU0oTeATFyl8t0MzpQl29muQHZ0YdC0atY2yG94Py7wHUlOdXdAdyD
	 PmdNSoDEJcuBfiU6aX5S0zZR3LmZarmv85o2VC7xHg4HAg3HD+HyooWNecuj9kQhZxDGF
	 XTla4uiZPJVC0coeY5f2hz9V1OZnUBXBCAvji3vnKVB8vm3taTpfARtyW/vv7tZYoGM4C
	 52Tfsffiz7xYeydOhTBS6UpgAfPZsmqzkWh1hnc/o1JNqzqK/g3Rj9bRswgwu0SGRrg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794899468;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-EOPAttributedMessage:X-MS-PublicTrafficType:
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
	bh=77wm3wnkUWktXFVf1ei6R9dOW+9AtXydlkd194hbuYE=;
	b=iFJDffnzHVTD0/QAKqP/Ex6l6zVvNx0USVFVXCiOMw3g4fQqoHOD5RXhO4SGNQwfdBxL
	 WvY9w3n3Dv13Z21bI9JJHkAccW7u6bxVm+ZcKwB/YLlcZ7WDG0CfHf82ipCEeEtgnR+0X
	 4OCG/2f1jPFP9f8jmLEEPM/CI9HvZWi9TU9f5k9nUVpIybpUb7Wi8R4S33KBHBGiRS5Fy
	 uID0+1EIgmA89OwyYXjYHdChxpUKpn2Qxk3n1LtdgyFXGpaFlEJ/LdgFBgGCFsTjTLPQp
	 KA6uYOdyGAwTNjAMWpF2yKvg3rW9D3Gk8lrYEXugbJon2Ofq1Cj9i5/AWApxQ7mihVg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=e1sr7ADB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.43
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012043.outbound.protection.outlook.com [40.107.209.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67A4C606A897;
	Tue, 17 Nov 2026 07:11:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67A4C606A897
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=e1sr7ADB
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l7FiL9wIXp1wh4AzOWgCZ7faPaQfhbRJYKYm7fK51PaQT6qa7+RzxKTMC34eiJh9Mo88fbpEyj0yPhcpELQ+KTTFfLzGeliUnSS0Awp2tVTmUc12rqrsHDIytuw9W0OMHmb4vIeuoFnyl8EHGX2qIb/ylePJUJDoK5APUA73gxto6gsSu7GnGrYSCc7w2O5qSQNduDy0CpDhwPaq1e10lYFFs/WU+/grcZlg5zM/4kVSLABOLrJtXt6ywjWN3AzjyUdkVfxtnMe10TGQ3UepXivPhOl3+pnjT0wL6PVGX59vBry2lts2XIqnKYa9FlZyJTfLd4Ab9Rm58lBMC6r1mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=77wm3wnkUWktXFVf1ei6R9dOW+9AtXydlkd194hbuYE=;
 b=AAgu/pgEgJkbEb2AgnFXb4CGi3fEVbfyTRVK6kGnZW/wHQ/8uuJHFFAGXIkJdSBP8jYX8A6QtqaTk/kqYw/eEPrtix4IcppUcCNFFK+oSE5yXRBRy/woEL3h6U3xJX59B0R4Kd3cfuCIPMUxTcRTouMP5r+0itSZsCuDi1MLXlRlJZ2uDyL5YYOTx1XgMtrF/tmQsNK+zPPi8q8X3aZLirrAiKRIvBKyU8QD13W/vUTgSdR7v0cn6XZ6NZQB8ou8l5oEXtLNPqiatd30jDkNnBsUTMRIawv5Osy4v1H2gAkADIDLuKMW+XJXNRsQXzJjh42x/WcLEXVu6E3QnxRfKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=77wm3wnkUWktXFVf1ei6R9dOW+9AtXydlkd194hbuYE=;
 b=e1sr7ADBwV/A7iiTXcYl3dUn+6b4QbErRv5AXdLID1AXoYxaisEYi9m9577DoH4iXVVNrAadHCX7yNLzICAFZGSBJqQ/ScNVfbtF7OJiPKegtJyx2rW9rZj67TC+F3STkgnxLRzR43bx3bds3EiFZ/Juh4wvIoGn9qGwelkOzsI=
Received: from CH5PR03CA0012.namprd03.prod.outlook.com (2603:10b6:610:1f1::9)
 by CY8PR12MB8314.namprd12.prod.outlook.com (2603:10b6:930:7b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Tue, 17 Nov
 2026 07:11:05 +0000
Received: from CH2PEPF00000145.namprd02.prod.outlook.com
 (2603:10b6:610:1f1:cafe::88) by CH5PR03CA0012.outlook.office365.com
 (2603:10b6:610:1f1::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Tue,
 17 Nov 2026 07:11:05 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH2PEPF00000145.mail.protection.outlook.com (10.167.244.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 17 Nov 2026 07:11:05 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 17 Nov
 2026 01:11:03 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 17 Nov
 2026 01:11:03 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57
 via Frontend Transport; Tue, 17 Nov 2026 01:10:59 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>, <Poojitha.N@amd.com>,
	<lee@kernel.org>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH v6 10/23] soundwire: amd: cache ping slave status to avoid spurious disconnect on timeout
Date: Tue, 17 Nov 2026 12:35:45 +0530
Message-ID: <20261117070906.803139-11-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261117070906.803139-1-Vijendar.Mukunda@amd.com>
References: <20261117070906.803139-1-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF00000145:EE_|CY8PR12MB8314:EE_
X-MS-Office365-Filtering-Correlation-Id: f7cd0c3b-52f0-48b1-b712-08df4479f200
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|36860700016|1800799024|82310400026|10067099003|11063799006|261021135927099003|56012099006|261021123027099003|261026140227099003|261009223027099003|261021130227099003|261026130827099003|261022105027099003|261022075727099003|261022115727099003|261026121527099003|261026135527099003|261021133027099003|261021121427099003|261102123227099003|261028144727099003|261022113327099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	EOsgm6dY5VP/PSm1ZhfrERXcFfNRmI0U+QoVHeRui9SLf6/4AnHItRHo0lZFwH2Ry7h5edrekB5tRPKaLtG1xBP5a54dS5L1uePqPGkRI58CI2Ef+Lq2UFOsQ2o5bPA1uMTjm+xFA2Tj+nGSyZrZaOqfz+KwR6GwCagw0lOU2QFS43/tvAZQErrmp7Nj/l9a2WMZC65xgZfkp2xvyMmK1YlhLRU9iM447EpQfgColUpd9XNjsgq++Q/1mNX8TaX74BZKyRdtUGphgehwZ65kjliBNDLUEEZCNGrToYiZukKBpRQqVeOL8pXUQhIr2RgXdWFG+QJ9cQry3wWmActT2Hpo4v7/tTtKlyyiOg5rERahYUbYkUTmXY+I7srIXU4ya8t5Q+ZeTYXbWFb2pMaAVipkmlC8T3r2/knsWFbDi7i0FlwzqGg4fyEW7FHpUik3L+bg/5kjcnKXJcH6RI0TaNqadK2QDEK4VTU4nBoeQDUG3sP80aO2ul4EIk3sy4112N4Wki9FBPM4WmQnSpBbH3NozRCfx0b1oex0vRJUhIvWoYiul8t/mPlpsnf7/ywttFazRLvcI4vkkPeW6C/ZzZIOueBKnEto9Bkleapr4Ih6XrAe7MQTuWYykara8IGG6yBLHo1uHqHmyi5vud4ia1yE54mbR/LWEEWJIHlV8XdyhHV5LzlJ+NegYKl53bsME3g2ZP76ip3CYSnQkAclZw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(36860700016)(1800799024)(82310400026)(10067099003)(11063799006)(261021135927099003)(56012099006)(261021123027099003)(261026140227099003)(261009223027099003)(261021130227099003)(261026130827099003)(261022105027099003)(261022075727099003)(261022115727099003)(261026121527099003)(261026135527099003)(261021133027099003)(261021121427099003)(261102123227099003)(261028144727099003)(261022113327099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	kZDM462KnKP4HW7fJEwvU8oeMev6YPj05M52UmOnDVXktLbzLJC99OXfOROOZS5NDMElVBJ2PdURX0Oe9D5kju41+gLyZQE4mPY7KnoD2vGiDryb6m/S2pQwZAIZP20NjRHucwKhA+fgeQYld/uBbpJWKILU9EfgUOysJqSUZNfeF8GJDNNkgw1PjODoptvxbcG+OndDtjLnNeB3DD7mbTN+YtkrCeZbXSy18gUhUimYPTwL/uRGIOtI9nSYZ/FP2hXGJWzW+0FQdoVdbaWYL7NZ+lLSdSs+E8gtVBiYY7tvuu+zw6TOcQCxsWkNlCUfl5RzFBDxpnQqZmU+Uqp4ignMiM0bquK0BRcDNSPG1wrDwLPN0xSNLevteq/9ndKvc7vHfYh/qTl0T0tQ9DdBZYW8m52heD9fMZngkBWcftI6Pgg7Ywwy6ZXFLRpP+1em
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 07:11:05.1192
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f7cd0c3b-52f0-48b1-b712-08df4479f200
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000145.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8314

amd_sdw_read_ping_status() returned 0 on a PING command timeout.
This was indistinguishable from a valid "no peripherals attached"
response, causing sdw_show_ping_status() to log a spurious disconnect
warning even when devices were actually present.

Add ping_slave_stat to struct amd_sdw_manager to cache the slave_stat
from the last successful ping response. On timeout, the cached value is
returned instead of 0, so sdw_show_ping_status() sees the last known
good state. The timeout itself is still reported via
dev_err() - the cache does not suppress the error.

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
index 18ddd489ad13..7b1aa2a87a32 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -549,6 +549,9 @@ static void amd_sdw_read_and_process_ping_status(struct amd_sdw_manager *amd_man
 		mutex_unlock(&amd_manager->bus.msg_lock);
 		return;
 	}
+	amd_manager->ping_slave_stat =
+		FIELD_GET(AMD_SDW_MCP_SLAVE_STAT_0_3, response) |
+		(FIELD_GET(AMD_SDW_MCP_SLAVE_STAT_4_11, response) << 8);
 	mutex_unlock(&amd_manager->bus.msg_lock);
 	amd_sdw_process_ping_status(response, amd_manager);
 }
@@ -560,11 +563,12 @@ static u32 amd_sdw_read_ping_status(struct sdw_bus *bus)
 	u32 slave_stat;
 
 	if (amd_sdw_send_cmd_get_resp(amd_manager, 0, 0, &response))
-		return 0;
+		return amd_manager->ping_slave_stat == U32_MAX ? 0 : amd_manager->ping_slave_stat;
 	/* slave status from ping response */
 	slave_stat = FIELD_GET(AMD_SDW_MCP_SLAVE_STAT_0_3, response);
 	slave_stat |= FIELD_GET(AMD_SDW_MCP_SLAVE_STAT_4_11, response) << 8;
 	dev_dbg(amd_manager->dev, "slave_stat:0x%x\n", slave_stat);
+	amd_manager->ping_slave_stat = slave_stat;
 	return slave_stat;
 }
 
@@ -1182,6 +1186,7 @@ static int amd_sdw_manager_probe(struct platform_device *pdev)
 		dev_err(dev, "mmio not found\n");
 		return -ENOMEM;
 	}
+	amd_manager->ping_slave_stat = U32_MAX;
 	amd_manager->instance = pdata->instance;
 	amd_manager->mmio = amd_manager->acp_mmio +
 			    (amd_manager->instance * SDW_MANAGER_REG_OFFSET);
@@ -1534,6 +1539,17 @@ static int __maybe_unused amd_resume_runtime(struct device *dev)
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
index c8bd8e1a4771..bf97c790c669 100644
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

