Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.26
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792989984;
	b=4INMdW7e1oBuRHbV9yS3J0Nsb3FSqaYxpmPdaYjr4Ro6du05SyhIqYjTZWKSc5d2HLA9
	 MYxOuVH7KxuWPXqSMfL+hKzcHUzIWxX2nSbqsKoX/aNOySC9LXEnCaZb8egTK8K3IPN3s
	 O+zLL7BhlWOq3OZdOGOSOfeotfopIDjVUwxcrMM1MFarrPE18rOAAJME7oFGduxXC8dat
	 uAtaDYageOXzxQqZVwUHZc0jzhTZmRudxgsjhSnjiHnxQNIm7Mtaz6/klr9UR+pqzPtbH
	 hYgj+v0gbLOx3+r2apIJ/AOLadSrVxKOO+pNKoDrCfCljsQYZH26jcwrSk59Wy907Hw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792989984;
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
	bh=aAcr+qKxMgDSsshWha5WG0EZPSiV+SYTW+E0HpeVSe0=;
	b=yRG084kT3o1+Do441XOKLM7VJK3uk/vtC21iSpmf1kcDRjYst/rA/zcRQsn5w4qHq+5B
	 YSxW73wA/kUTBY2xG8CJZ/ska05NX+7c41ctJ6EUh/R70LKECuOI8djaF2WJYmNfStbrc
	 4UJRCOXdVHS7sUItYtcJ7xkqzc/qUVKsTIcWr+lbJyoHXz4lFn8tPnnD6paccVpWhSNV3
	 wlh/jM3uCJ6zBlTbJ/Reuj6rYpFRzT793bMqdLF3sFtDojr1qtvjfpfPug/Y7ig4ygXK3
	 cpJ2gQLRWsraQMugrQvRiBKHoUCopYgyWPwj2+tdGVXsAf32ZB8S/zYhEaid0Zr/nEA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=4ceRhQ62;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.26
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011026.outbound.protection.outlook.com [52.101.52.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8385E606A31E;
	Mon, 26 Oct 2026 04:46:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8385E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=4ceRhQ62
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=utEjFTp27MtEl1nyrEBJKVvRxlnjFEwH9yaA9WXXdQkQcu1AaTENA2WLTKSUe4cs1lUUnpuw29DXs2OUIStM43IrCZwHejDkKHh3uoVNEO/FmTY6CjRD3fNJnw0EwjcX5tuegQx8hMM8mkyF4etlvMPIJ3kElyXSQe14M+BeJ8TAm5ykeO4NbmplAiIOWU5uV/L2xACLTAa0R8YUiWGzQnD9m1noQjEue6Wu9Yw79PX2F6DMgVGrunRd91SqKdkYDnN9uN9k0WZfBgMOiZayUyODlpC4pB+Yxt/jULIHTTI1fw8Oszk1Uy2ty75ycMfn3Ro8fl5KSo4h3KUdW5MyGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aAcr+qKxMgDSsshWha5WG0EZPSiV+SYTW+E0HpeVSe0=;
 b=KP/msVszilKCgP7ElyHPL+yxpdFMcLoP5NAyyx2kNoTbgtvmgTinAxaQh0k1nT5Vid5+JQEsTDF7ODPQd216/UOjHlTNFV5vWY0vHRBubVIvRoiyL9oRirsvRV5UwnrY2rR8Zjdulds4yv0OOtkSENYaV9FufkxUpayHloPqP8DeBazePpO7BBumMtn6KPTJN2koFrTiZftRSgMMUgc+xWAvGMfT5pZIdCoF0r+RJ0zGQYckOqIRRC5qObpCket4VoWzwlKQSC/ZRpjHYzd4VUJ5Tlf9g+yugEGSG+3yJMshR+aU20nnCiEv6EUd4vtqq/wf/96/dZrfCQs9dUZmcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aAcr+qKxMgDSsshWha5WG0EZPSiV+SYTW+E0HpeVSe0=;
 b=4ceRhQ62eFCio1pcoFTsuhIAxw71W28jZ3iBlDPT8aQjeAQiYzfzmaccGrhd4gZs/7wmChR/Em9h5Oyz64H1g2lqe6GV8N+kztDrkmhqLIyQH9I5+L8RNc2YOWe0jPAGSiDXB9w0UH7x0augVMqPVjy12+RilXCPtNSa1JxW3NA=
Received: from SJ0PR05CA0030.namprd05.prod.outlook.com (2603:10b6:a03:33b::35)
 by CH3PR12MB8934.namprd12.prod.outlook.com (2603:10b6:610:17a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 04:46:19 +0000
Received: from MWH0EPF000C6191.namprd02.prod.outlook.com
 (2603:10b6:a03:33b:cafe::50) by SJ0PR05CA0030.outlook.office365.com
 (2603:10b6:a03:33b::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.6 via Frontend Transport; Mon, 26
 Oct 2026 04:46:19 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 MWH0EPF000C6191.mail.protection.outlook.com (10.167.249.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Mon, 26 Oct 2026 04:46:18 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sun, 25 Oct
 2026 23:46:18 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sun, 25 Oct
 2026 23:46:17 -0500
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53
 via Frontend Transport; Sun, 25 Oct 2026 23:46:14 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <broonie@kernel.org>, <alsa-devel@alsa-project.org>,
	<yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH v4 03/13] soundwire: amd: cache ping slave status to avoid spurious disconnect on timeout
Date: Mon, 26 Oct 2026 10:13:34 +0530
Message-ID: <20261026044507.2310694-4-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261026044507.2310694-1-Vijendar.Mukunda@amd.com>
References: <20261026044507.2310694-1-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6191:EE_|CH3PR12MB8934:EE_
X-MS-Office365-Filtering-Correlation-Id: d3241225-d1d4-49a7-2ed3-08df331c138b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|23010399003|36860700016|11063799006|56012099006|261021135927099003|261021133027099003|261021130227099003|261021121427099003|261021123027099003|261022115727099003|261022113327099003|261022105027099003|261022075727099003|261009223027099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	u4pxA+KREgEDCoqixIjJ+aLaQRMpVwdlf5Uy4kT7aM0t/KkFdyF+4X1f15YKdDszuegSS2qUUNE2r9TCy0DmpMIc2EoeFCxsNILMXEsRZbsZqrn2/YwWSJXYeM58XlJrIt6HPzaben60y4vLGR6UBnr2VsnjeJ+BXJRxoIikOe9SEa5ccR/jONXIZHBvvopW4oX71mieb0CyrFd6ItR6pyUQSGn0wR55WSnIDmPmCjUJymB+LlHvwT22pVAGWDFtghIv6/MEd2uVi+2Ioh8ckVfhbtQ5SppoVEN4BkU3acCz7/rtPqyipF5X/snbz4myjcofzqHj/d1dh3Bcqe0XrWb4gYXmb9FzYiTeXsqhr9RpllELO39xKZLqu29kU1hdo/JzVxmTwbMBt+8ApBjv+RZj980McddyCWvWH5Y4HNGwKvyWyZ0rMpoW7mfrfNHcPfXVZOn0J5J00YIQD8Bom/eykug0b+nYgKNagreMYmiP2fT6f6ADN5w+flD8jTEdeJ9vk11RK0sMa+oGHu/iS0rq4Mwz+nI9za8cTjBsf2biIFuZW800D6cMt+ArwPZ9uPvLS9B2N3a+6nIWSZPkXJdgcR6UotRnQViuwwT9aJWWauVrsbbLU5S2nkZcnTKEju+oqAi4nStZQrDEHjT/d4BQyDRu5/7cEGGUp2wuoAuRudipeDPGUOI5AsWYMY1T7XZo/uTErMOmYmT4WnufVg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(23010399003)(36860700016)(11063799006)(56012099006)(261021135927099003)(261021133027099003)(261021130227099003)(261021121427099003)(261021123027099003)(261022115727099003)(261022113327099003)(261022105027099003)(261022075727099003)(261009223027099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	4eaiIy4keqDW/jasJYdbsvozf7JS0oiVSJxc+NG+iWM72ekUJcjIV2IXYGfnK2sa5ev1H/OypCiRNT5kkUm8MWgdXKwn8Wb4pdD0BCPrOwWsJIXDdU1CnpGwS5isgU0irEzzVw/sM++xQXKjfc3GWPtpRGA8XZOoy5J1Ek/vgSl0qPaZ9ydx4zC5JfyEPdFwuaV58ntq+adUGJFcf2SZ0O5/UMyocVYuxrQ3DQa4KAnWzkDMLbzV3zR0R0I6hxn+e3vfcRkfttEsYF0dtnq9wUHeYeRpFlJXWRSouQ4Iwm/azN0NgfZaxkqLGiJ5kA73LUG5J/3+5laT08YZZbc0R/ip7ZJqr9TnTgtnAEoS2BLvT7ZJeZbjRTIoUiW8Gf/6yxS3d5/KCFDsJ8B0cCH97B9UhtgYDstGbS5bMauX86TLByWf615biN9IwRh9JT2w
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 04:46:18.8525
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d3241225-d1d4-49a7-2ed3-08df331c138b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C6191.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8934

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

Fixes: d22c1c2fcfb0 ("soundwire: amd: fix SDW command timeout return value handling")
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_manager.c   | 18 +++++++++++++++++-
 include/linux/soundwire/sdw_amd.h |  4 ++++
 2 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index 0b83126b5ce6..b75d0104e28c 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -451,6 +451,9 @@ static void amd_sdw_read_and_process_ping_status(struct amd_sdw_manager *amd_man
 				    amd_manager->instance);
 		return;
 	}
+	amd_manager->ping_slave_stat =
+		FIELD_GET(AMD_SDW_MCP_SLAVE_STAT_0_3, response) |
+		(FIELD_GET(AMD_SDW_MCP_SLAVE_STAT_4_11, response) << 8);
 	mutex_unlock(&amd_manager->bus.msg_lock);
 	amd_sdw_process_ping_status(response, amd_manager);
 }
@@ -464,12 +467,13 @@ static u32 amd_sdw_read_ping_status(struct sdw_bus *bus)
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
 
@@ -1085,6 +1089,7 @@ static int amd_sdw_manager_probe(struct platform_device *pdev)
 		dev_err(dev, "mmio not found\n");
 		return -ENOMEM;
 	}
+	amd_manager->ping_slave_stat = U32_MAX;
 	amd_manager->instance = pdata->instance;
 	amd_manager->mmio = amd_manager->acp_mmio +
 			    (amd_manager->instance * SDW_MANAGER_REG_OFFSET);
@@ -1412,6 +1417,17 @@ static int __maybe_unused amd_resume_runtime(struct device *dev)
 		}
 	} else if (amd_manager->power_mode_mask & AMD_SDW_POWER_OFF_MODE) {
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
index 470360a2723c..e4375542aad2 100644
--- a/include/linux/soundwire/sdw_amd.h
+++ b/include/linux/soundwire/sdw_amd.h
@@ -76,6 +76,9 @@ struct sdw_amd_dai_runtime {
  * @acp_rev: acp pci device revision id
  * @clk_stopped: flag set to true when clock is stopped
  * @power_mode_mask: flag interprets amd SoundWire manager power mode
+ * @ping_slave_stat: cached slave status from the last ping
+ *		     transaction that returned a response;
+ *		     initialised to U32_MAX ("no valid reading yet")
  * @dai_runtime_array: dai runtime array
  */
 struct amd_sdw_manager {
@@ -105,6 +108,7 @@ struct amd_sdw_manager {
 	u32 wake_en_mask;
 	u32 power_mode_mask;
 	u32 acp_rev;
+	u32 ping_slave_stat;
 	bool clk_stopped;
 
 	struct sdw_amd_dai_runtime **dai_runtime_array;
-- 
2.53.0

