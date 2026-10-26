Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.61.0
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792990017;
	b=bNHdCbCruZa9dxgiwS9/jDkaahwtxqNUbOoYeSSCJZkLXN+GpzoHeHja6JaiVqfwdfpo
	 OOTUImJm9IrhzhQRd4RUG5JsQWTbmeoSX4mXpxvokqJqHJEfAUdFkQ9jgCq8BWsBYyNxm
	 OWffx3znbx5/v/n7GSzncv54PkAFb5zXdL+yZqB9om3BhgV/x0vYFG6kKRLMRp7oj4bN1
	 Qfl+b/YnefsofnzY6aeEDP+YNOeG0EZf6YZYCbCkL/xVyLTixTCtT+hbktAeDdtD9TYT/
	 bu4bEMazAx492taQebdsZaLgCgJ0euOrFv+4IiUcGRq0QKbs5Nefa9Iv6POpSaye9nw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792990017;
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
	bh=Mjegc762a0yZhCk0CdpaIwM+IOdG7k2yi/1QMKFbi1U=;
	b=OHBMUMjvstSKRl5jHhBf6igt9cfFZP9UvIRSv2Gh5LdyVDR3zvZbfm2OjoOqYJr3q9sF
	 TJLyYKTfCUpdXJLu3F6yBWRSoyNezvltsX09C/RISd7UV2HoQ5Ca4PdB3/8M9aMI/JqT+
	 2nusl2AFu6Y4I7rKApEtpiGYJBFRXubYQKpZtL5FEgMUPyXg+1tFGekYHMeYfG4qtotB+
	 3CAu53bKj54T6ygyXAuO0MSrLtsP6JVTnXtpTGkaiEytUNlPFHBVQXjEqUbXGEHH8gN66
	 sN2WjpYrgKVcpGbSiM08km+uohiMalUW+o9eCBnbV7SLw4jhLF3hoyLSW2g9gwzZFJQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=2ukWAgQW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.61.0
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010000.outbound.protection.outlook.com [52.101.61.0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB453606A323;
	Mon, 26 Oct 2026 04:46:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB453606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=2ukWAgQW
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rCmQBw4oPGDjHwF4o+EqY1U1BkB/115ChN4utgRdzJ9j7FMshFW3l9kp8ywqgax34LZ8CRj7j4Us5V/89lPRik4FBtivpMJ78Tc8BSYXUIy8hT4UJ663NdHRMUtziXi7YZpMPIo1dYuXuzshwWXI3rQSp0gZ2rPYCm4lNOz2ncUzP1pE8lwi9HR1xZPe+bvs+4WoqNY3tz4fMhTcf8QJIONiQvgrIyp3F5JLBl99zrt5x9qMtte5Ogq9fDd5xdk//vRJCb4G2H1U924fzVwk20gCtdMe8upVMa3NgNYhQy7pVJeu1LvGv5sRrhRF7xuqRZZPdpyIpTa2yKSjIvuMqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mjegc762a0yZhCk0CdpaIwM+IOdG7k2yi/1QMKFbi1U=;
 b=HN6WuTYZWqSAkLQns5e2V24nBl8LVDCd1sO2G+4FN2SUr4pVlsS9LC33aaGzelOsZjB7hxYak8VUEeBQB13BdNijx5ruqI2TYUXbbGkqj2ZFIolbDg+rbdcUqnBGLt9+mGOMiUHzKwynhY4qXBJ8rzyyNkWeUU8bJkQQLd+3y8SMINuz04PzfWg69rrSO3gdImpe6jnR2k1yUzYGSfQ4Qjx8Mw1z+qYQIUJs4zVad21ovyHfw2HIhme0eA75dmVDNyUZT1Rzg6ccD579pwdG9uAidcoUq4sKFHqJp9yzFGPId9x1fLZa/5A9aqrcOOZOfd8RhTEI0MUCGbUtWcHMpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mjegc762a0yZhCk0CdpaIwM+IOdG7k2yi/1QMKFbi1U=;
 b=2ukWAgQWmH+xd74KeLcapK9/SwuFVdVWGWlHXeL1LstL5M4xJTK/ERDUTcHELc+TzAf9XbZZ2Kzldpxz9UffgAVvawuCQ3XeYMs4U6Gz6z45f3hX2BZcCD5AanflXHsdsZj7vYZNkeg5PUJXCgC3arEKcQgNXlv3wh/x68pNWZw=
Received: from CH0PR08CA0013.namprd08.prod.outlook.com (2603:10b6:610:33::18)
 by PH7PR12MB5926.namprd12.prod.outlook.com (2603:10b6:510:1d9::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 04:46:50 +0000
Received: from LV8PEPF0000005E.namprd02.prod.outlook.com
 (2603:10b6:610:33:cafe::7f) by CH0PR08CA0013.outlook.office365.com
 (2603:10b6:610:33::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.22 via Frontend Transport; Mon,
 26 Oct 2026 04:46:49 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 LV8PEPF0000005E.mail.protection.outlook.com (10.167.245.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Mon, 26 Oct 2026 04:46:49 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sun, 25 Oct
 2026 23:46:49 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sun, 25 Oct
 2026 23:46:48 -0500
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53
 via Frontend Transport; Sun, 25 Oct 2026 23:46:45 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <broonie@kernel.org>, <alsa-devel@alsa-project.org>,
	<yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH v4 11/13] soundwire: amd: fix interrupt gate and work drain ordering in PM ops
Date: Mon, 26 Oct 2026 10:13:42 +0530
Message-ID: <20261026044507.2310694-12-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: LV8PEPF0000005E:EE_|PH7PR12MB5926:EE_
X-MS-Office365-Filtering-Correlation-Id: 15b57153-b944-42a3-06e2-08df331c25c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|82310400026|1800799024|23010399003|18002099003|22082099003|56012099006|11063799006|261022075727099003|261021123027099003|10067099003|261009223027099003|261021121427099003|261022105027099003;
X-Microsoft-Antispam-Message-Info:
	SPhirxNyjvStnfH+ELBxscrxUd8u1JmNvI2AUYXuC0fJ0huwFvz5RJtAFkg8+bANY7KUXioVi2oASoclyEW8VwkER+J9cbdseZ/CHQpByEDJsM5EZv23YDht6wWN7MsVACEfkfmUwamjABo+lLssEy6ipRG0YJqJO2pwZOMVHAwfKXW+zFv7vNH0Rt/C32vWwWwF92ne0Wwxr9YXBFA/8YUfGsX4/7EuzvqrjY1sQebd+VEwbS+jk5YQWEvIbpfDA6EgpBgBkvEPjsp6Hipj7W1JTofazB2NzltlfSpbi1MlQeJem14lJLu3YQdA5BKXZkxtimBqpW0ZB3NR/3l2ayDiVH6FEoB2mDIByujW9lt9xQCq/PQfoJ0+LN3sW1w7gefYv7zNdSVFdBSeOJbzqTYT+DiE4XkGDL1bdO3hOx9nzklgnYlbiVd18Mxix42RgHeIF6wlYdQQ6AlbpmMKbfZxNEHsDblME40oX7ZEZSYM+NAtpJrTbwm1ngjDCDs0NkSQoY6xw8J+q6MDya6toKrcHFAnxem8Q2nGdmk36+46WDx80ON8VZ3c9fnDWjX7S7IIPFkFJhqrFGUq8UnV30X8gjY///atRW/+j4K76fNpJ8P1Umgx0Lzq/j9tedKGp5Z/ilhGZXpo9k+yLMypaLrzpRRJ33mlHngMvPMqJpk3MhJCR0sSrAWEGGRZdpqb4trUmiLiTaNWhPzNmUqgKw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(1800799024)(23010399003)(18002099003)(22082099003)(56012099006)(11063799006)(261022075727099003)(261021123027099003)(10067099003)(261009223027099003)(261021121427099003)(261022105027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	A/tp8DA6odOhE6WKHcUZKKzlK0IIEXkhTuB9AszQtEgkR+A6lXiMhYyRNxYOxRGkTjfTgWG6LqGEvswbxTkoioXxhftrREAtSB2M5m6j1D1vgGlVeCeO7Z6gI4wk8p2b/WklNhpwjToqwAUybCeuFtSwQyEdNTITujLc0w3WjP8FgbNDjSXGc/vU3i30kHCKRqqtQ8Lc5O06G0ZC56TxrKGP0W1JS6UdjeyU3sDOrXhz+3ekysBFnsTui/o4flpk5H/dfUfMWoAYUkCSqHfG9fu7xlopsinha2+gnEFJtP2cq+uzPNLcHjeNzwtoXWtKCmYnhWbo67XwhewNEHczS71b0OOjdLm9b6H+8V4eIMMfjdWK5tbx+raAfDTkC+T4NivSqkN9PzFnjyioUDhllm05AGUjUnAKUSOusEW1vEWPmuh0LhZ0W4oTTNkYmoUy
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 04:46:49.5376
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 15b57153-b944-42a3-06e2-08df331c25c7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	LV8PEPF0000005E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5926

The CLK_STOP_MODE branches in amd_suspend() and amd_suspend_runtime()
did not close the ACP_EXTERNAL_INTR_CNTL delivery gate before draining
amd_sdw_irq_thread and amd_sdw_work. An ISR already running when the
drains completed could re-queue work after cancel_work_sync() returned,
racing amd_sdw_clock_stop().

In both CLK_STOP_MODE paths, amd_sdw_wake_enable() was also called
before amd_enable_sdw_interrupts(). Since amd_enable_sdw_interrupts()
writes the interrupt mask unconditionally, it clobbered the wake bit
set by amd_sdw_wake_enable().

For both amd_suspend() and amd_suspend_runtime():
 - CLK_STOP_MODE: add amd_disable_sdw_interrupts() and
   cancel_work_sync(irq_thread) before the work drain; reopen the gate
   with amd_enable_sdw_interrupts() after clock stop, then call
   amd_sdw_wake_enable() so the wake bit is not clobbered.
 - POWER_OFF_MODE: add amd_disable_sdw_interrupts() and
   cancel_work_sync(irq_thread) before the work drain; remove the
   redundant post-clock-stop amd_disable_sdw_interrupts() call.

Fixes: 86a4371b7697 ("soundwire: amd: fix for handling slave alerts after link is down")
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_manager.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index a685bd7da52b..d7289b840513 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -1318,15 +1318,20 @@ static int __maybe_unused amd_suspend(struct device *dev)
 	}
 
 	if (amd_manager->power_mode_mask & AMD_SDW_CLK_STOP_MODE) {
+		amd_disable_sdw_interrupts(amd_manager);
+		cancel_work_sync(&amd_manager->amd_sdw_irq_thread);
 		cancel_work_sync(&amd_manager->amd_sdw_work);
-		amd_sdw_wake_enable(amd_manager, false);
 		ret = amd_sdw_host_wake_enable_by_rev(amd_manager, false);
 		if (ret)
 			return ret;
 		ret = amd_sdw_clock_stop(amd_manager);
 		if (ret)
 			return ret;
+		amd_enable_sdw_interrupts(amd_manager);
+		amd_sdw_wake_enable(amd_manager, false);
 	} else if (amd_manager->power_mode_mask & AMD_SDW_POWER_OFF_MODE) {
+		amd_disable_sdw_interrupts(amd_manager);
+		cancel_work_sync(&amd_manager->amd_sdw_irq_thread);
 		cancel_work_sync(&amd_manager->amd_sdw_work);
 		amd_sdw_wake_enable(amd_manager, false);
 		ret = amd_sdw_host_wake_enable_by_rev(amd_manager, false);
@@ -1339,7 +1344,6 @@ static int __maybe_unused amd_suspend(struct device *dev)
 		ret = amd_sdw_clock_stop(amd_manager);
 		if (ret)
 			return ret;
-		amd_disable_sdw_interrupts(amd_manager);
 		ret = amd_disable_sdw_manager(amd_manager);
 		if (ret)
 			return ret;
@@ -1374,14 +1378,21 @@ static int __maybe_unused amd_suspend_runtime(struct device *dev)
 		return 0;
 	}
 	if (amd_manager->power_mode_mask & AMD_SDW_CLK_STOP_MODE) {
-		amd_sdw_wake_enable(amd_manager, true);
+		amd_disable_sdw_interrupts(amd_manager);
+		cancel_work_sync(&amd_manager->amd_sdw_irq_thread);
+		cancel_work_sync(&amd_manager->amd_sdw_work);
 		ret = amd_sdw_host_wake_enable_by_rev(amd_manager, true);
 		if (ret)
 			return ret;
 		ret = amd_sdw_clock_stop(amd_manager);
 		if (ret)
 			return ret;
+		amd_enable_sdw_interrupts(amd_manager);
+		amd_sdw_wake_enable(amd_manager, true);
 	} else if (amd_manager->power_mode_mask & AMD_SDW_POWER_OFF_MODE) {
+		amd_disable_sdw_interrupts(amd_manager);
+		cancel_work_sync(&amd_manager->amd_sdw_irq_thread);
+		cancel_work_sync(&amd_manager->amd_sdw_work);
 		amd_sdw_wake_enable(amd_manager, true);
 		ret = amd_sdw_host_wake_enable_by_rev(amd_manager, true);
 		if (ret)
@@ -1389,7 +1400,6 @@ static int __maybe_unused amd_suspend_runtime(struct device *dev)
 		ret = amd_sdw_clock_stop(amd_manager);
 		if (ret)
 			return ret;
-		amd_disable_sdw_interrupts(amd_manager);
 		ret = amd_disable_sdw_manager(amd_manager);
 		if (ret)
 			return ret;
-- 
2.53.0

