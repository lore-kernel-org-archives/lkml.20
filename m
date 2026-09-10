Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010027.outbound.protection.outlook.com [40.93.198.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E865358FD02;
	Thu, 10 Sep 2026 19:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789067037; cv=fail; b=eZAlGr6SZu7MaDpWQhsJM5VF/WvwON485dp3N4RmKuTM4U8S2Oi+5W0rtLAvApSmVZAY58qxVSlEyaQD+yMCSbpxzvwW7CAzL7/ikaULvjTBO8smLouMS3QKYRphHl8+JzcTkDS1/qDDlSTKjd5eceKKa/fR0vQ5U06/7+98D9E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789067037; c=relaxed/simple;
	bh=ZKuWWTIxu/Ud6TZmMc46vnK29MCBiWRu26Yx6p8ZfiU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rEqvZDLcupyCE6qRXXT8TwmAXf7M25Pll+mltMFHJfl7P1tAu0QE6YBMKShhUoKTfsL4ghdvBPs8vyu3Zz0Eg1bHSE9V+lHRDiS4/3/wjd/hZAAOfcjR5l7a7hf8Kl0pwMMbjqWB0o38VQJY2wximYcl1+ZFTaPxmoiuUCd79s0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=O40hRvP0; arc=fail smtp.client-ip=40.93.198.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="O40hRvP0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i1WdQfdSEgLxJ/L1KRSMYFb5A/REnVCK7dzxqJ46Vg/8MBOgiTNN3dNSzGc8hvFrrIJzu29CtUTBXFt8tfiI3tZnIx2q4EuTMvT9thUBVIEprQipS6Kl53lTuDVomvqDspVcFQrEWloXcpuwKHF+BKBLOutyg0DwT6KdOYSYytTZ07vcs/zcOLYu9Q6TZb+ePwZtWEhe//rSu58L2xsf4ZRi4d5tqUa3ZqTq7En3957bjhNsAGzyxHa6tXC7jgk8X4bVphX3viU2/bg1PG4+bjFbJvzbYR+yveMEAeKjPk5QejAUNwVcuu4PMx1rhg25dmFikGVNEWsXh4hDaxNeYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vuaCfIoV0IQbSRxWRy4R0KsnVQNCZn6kMmI6GBuuzfI=;
 b=RdRMa6+g+l/rqbS+W98cDFcT8hRaMvDSy+12JeiiEp3EmxzyaePL5Qxi3XJSAIwHe9GJ3pBwB1agcL0dZaLgruwolzdXLDgIevEhsgCFrzKhanY/vbhGTGskXIljgk6cY+tjJNJAHfnbAzjYaYd8ujkcWk/FvxmOgK52TwTarnqyaPrrzmGh8HQ6YA7lJxIcp0dsrzewfzzoHqB32cne/MqmeHu6qoW3vWLHDjrC1LWEHz8oqsLkqotJfPEbphdsAs7Ak3bJJkYKipbz4mOVOhjAUxmkqot9BERltxBXeCDoHbWMusqPu7i3HHxvhThlXwURa85En+5ZYzRTxQLxEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vuaCfIoV0IQbSRxWRy4R0KsnVQNCZn6kMmI6GBuuzfI=;
 b=O40hRvP0+QKmDULAKHCHcszdJ4ZJPi0X3EqJ5A2xJTi+U5BoHJtnB9TpZR3c7jOiDpvDAthtm8S/Njr1pORL3B02STjxYuy69XSjNrFeC8T8Q+Gi7sRoVGv287WiU7eOAWvPgbMl16wtdjMuANi88Qazq6xiKWrsC7K04K1HZU8=
Received: from MW4PR04CA0070.namprd04.prod.outlook.com (2603:10b6:303:6b::15)
 by DS0PR12MB7778.namprd12.prod.outlook.com (2603:10b6:8:151::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Thu, 10 Sep
 2026 19:03:50 +0000
Received: from CO1PEPF00012E82.namprd03.prod.outlook.com
 (2603:10b6:303:6b:cafe::1a) by MW4PR04CA0070.outlook.office365.com
 (2603:10b6:303:6b::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.8 via Frontend Transport; Thu, 10
 Sep 2026 19:03:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CO1PEPF00012E82.mail.protection.outlook.com (10.167.249.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Thu, 10 Sep 2026 19:03:50 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 10 Sep
 2026 14:03:50 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 10 Sep
 2026 14:03:49 -0500
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.46
 via Frontend Transport; Thu, 10 Sep 2026 14:03:46 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH 1/8] soundwire: amd: fix SDW command timeout return value handling
Date: Fri, 11 Sep 2026 00:30:49 +0530
Message-ID: <20260910190240.1604447-2-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E82:EE_|DS0PR12MB7778:EE_
X-MS-Office365-Filtering-Correlation-Id: 87e6db44-3943-4e56-73c4-08df0f6e403d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|36860700016|82310400026|10067099003|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	piZu2SUpi8gZz6l4Qrrd+Da9RkMo7RJvxhLqBZRtw4i0eM7vnS7k0pJOwZzCd3V8nyCH7FnxYG4ZG5TLJ2rMENwuPqlHZvAIQW+76tiPDTqNmkJXR3fm1JqxXULHBM8uRqq/3IN7kdOVi1F6hBL177LCs7TXNxrtJSpzTk9dAxrTgDXtujGGbvv56L0Dtd9nc5rkvhsZKCs4zh6kkgAU7BevCJKhGnHw+bff66+edDKhxENC0rMXQN2qRlbK4mKnWYeWIwlYYKQeboWMwD0yqGCSuxX6s5folPZROmkhA7GXegZ0eqdPwUY1gNHLya49/rpWEbLQDTr6FxQji1ruJqAxeZX2ICJjwsQZKvAFSN1sAzOxVB8l62AB+t9+M5Ap5wLa7K6IAgkqpNQEKgtsB8lVxIq/wkJDM0JaOK30cbwDwqpua/+fOyyqvld95JKIS7c4RbOR1sqx+4znur+6HdfDVxTVl0rlM0qJaI+E7xRCkF0h+8/+dntnR/UovkJpMQYrnWCu/qWR7ifWmHpVMpO9/40EwCg4JxVxZ9TJ4IwLTXWDFmPFLqXK80seEEOmF05uxF7O96ccsnCTA9pr9ZIKJclzmh9TzSjBAyjZSMYWhEAyo867nz44NA344tcVdCSMAM77BCRLlurTTmT0l5O4flZ3oBHgHT58uehgb8iu4OXH+HvHrxW+f3WYmAGIb1gcY9gBzUIi49iMIzfGNw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(36860700016)(82310400026)(10067099003)(18002099003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	INsQXdl/AY3ZJuE4sKJ6tcpHtRieT52UDUr20Wn8IlzEonN0Us5IiMA6ggfty5gaMKJudmABzU8fzt4syu1LvtJz3xAeM7XNH/OGzZrml5p27lZTQjmq54Kuej1mj5YjHihVveuMSX3KyTfKgm68VH1YYO3IkNru1vjUZ6c9hBLqlynliAlcW+Q4sGt9jhPsqHPrf1T9GgqwAyL/xN6TLLeVHXGSdbsqGO18knG81/EI5HVbyFIsMa/Etx1k4uSeewz5EAzkl/qthqIarf9clEA1FHgj8X4mH/6x1ZPm0LLK/ApnLNPFLBHDYVC8Wug0cK2brLieXLI+aNcJ3owzi+dN8YPJya0AgF5MWqxL6WK8LgQi3UmmWjmwBmzUZHj1ll4N+0Aw4uQ2Be1XF9F5Go5Zzm8AMpRafBUXxJn46i0VMBqtYbMm/qykpxJ51dRb
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 19:03:50.7144
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 87e6db44-3943-4e56-73c4-08df0f6e403d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00012E82.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7778

amd_sdw_send_cmd_get_resp() returned u64 but was returning -ETIMEDOUT
(a negative int) on readl_poll_timeout() failures, which silently
widens to a large u64 value.

Change the return type to int and pass the raw u64 response through an
out-parameter. Timeout is detected directly from readl_poll_timeout()
return value.

Update all callers: amd_program_scp_addr(), _amd_sdw_xfer_msg(),
amd_sdw_read_and_process_ping_status(), and amd_sdw_read_ping_status()
to check the return value and handle timeout explicitly. In
amd_sdw_read_and_process_ping_status(), the mutex unlock is also moved
to after amd_sdw_process_ping_status() so the lock is held across the
full status processing step.

Fixes: d8f48fbdfd9a ("soundwire: amd: Add support for AMD Manager driver")
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_manager.c | 56 +++++++++++++++++++--------------
 1 file changed, 33 insertions(+), 23 deletions(-)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index a3316efdf8ac..fa3f4e797edd 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -250,10 +250,9 @@ static void amd_sdw_ctl_word_prep(u32 *lower_word, u32 *upper_word, struct sdw_m
 	*lower_word = lower_data;
 }
 
-static u64 amd_sdw_send_cmd_get_resp(struct amd_sdw_manager *amd_manager, u32 lower_data,
-				     u32 upper_data)
+static int amd_sdw_send_cmd_get_resp(struct amd_sdw_manager *amd_manager, u32 lower_data,
+				     u32 upper_data, u64 *response)
 {
-	u64 resp;
 	u32 lower_resp, upper_resp;
 	u32 sts;
 	int ret;
@@ -291,9 +290,8 @@ static u64 amd_sdw_send_cmd_get_resp(struct amd_sdw_manager *amd_manager, u32 lo
 			amd_manager->instance);
 		return ret;
 	}
-	resp = upper_resp;
-	resp = (resp << 32) | lower_resp;
-	return resp;
+	*response = ((u64)upper_resp << 32) | lower_resp;
+	return 0;
 }
 
 static enum sdw_command_response
@@ -309,19 +307,22 @@ amd_program_scp_addr(struct amd_sdw_manager *amd_manager, struct sdw_msg *msg)
 	scp_msg.buf = &msg->addr_page1;
 	scp_msg.flags = SDW_MSG_FLAG_WRITE;
 	amd_sdw_ctl_word_prep(&lower_data, &upper_data, &scp_msg, 0);
-	response_buf[0] = amd_sdw_send_cmd_get_resp(amd_manager, lower_data, upper_data);
+	if (amd_sdw_send_cmd_get_resp(amd_manager, lower_data, upper_data, &response_buf[0])) {
+		dev_err_ratelimited(amd_manager->dev,
+				    "SCP_addrpage command timeout for Slave %d\n", msg->dev_num);
+		return SDW_CMD_TIMEOUT;
+	}
 	scp_msg.addr = SDW_SCP_ADDRPAGE2;
 	scp_msg.buf = &msg->addr_page2;
 	amd_sdw_ctl_word_prep(&lower_data, &upper_data, &scp_msg, 0);
-	response_buf[1] = amd_sdw_send_cmd_get_resp(amd_manager, lower_data, upper_data);
+	if (amd_sdw_send_cmd_get_resp(amd_manager, lower_data, upper_data, &response_buf[1])) {
+		dev_err_ratelimited(amd_manager->dev,
+				    "SCP_addrpage command timeout for Slave %d\n", msg->dev_num);
+		return SDW_CMD_TIMEOUT;
+	}
 
 	for (index = 0; index < 2; index++) {
-		if (response_buf[index] == -ETIMEDOUT) {
-			dev_err_ratelimited(amd_manager->dev,
-					    "SCP_addrpage command timeout for Slave %d\n",
-					    msg->dev_num);
-			return SDW_CMD_TIMEOUT;
-		} else if (!(response_buf[index] & AMD_SDW_MCP_RESP_ACK)) {
+		if (!(response_buf[index] & AMD_SDW_MCP_RESP_ACK)) {
 			if (response_buf[index] & AMD_SDW_MCP_RESP_NACK) {
 				dev_err_ratelimited(amd_manager->dev,
 						    "SCP_addrpage NACKed for Slave %d\n",
@@ -366,11 +367,7 @@ static enum sdw_command_response amd_sdw_fill_msg_resp(struct amd_sdw_manager *a
 		if (msg->flags == SDW_MSG_FLAG_READ)
 			msg->buf[offset] = FIELD_GET(AMD_SDW_MCP_RESP_RDATA, response);
 	} else {
-		if (response == -ETIMEDOUT) {
-			dev_err_ratelimited(amd_manager->dev, "command timeout for Slave %d\n",
-					    msg->dev_num);
-			return SDW_CMD_TIMEOUT;
-		} else if (response & AMD_SDW_MCP_RESP_NACK) {
+		if (response & AMD_SDW_MCP_RESP_NACK) {
 			dev_err_ratelimited(amd_manager->dev,
 					    "command response NACK received for Slave %d\n",
 					    msg->dev_num);
@@ -390,7 +387,11 @@ static unsigned int _amd_sdw_xfer_msg(struct amd_sdw_manager *amd_manager, struc
 	u32 upper_data = 0, lower_data = 0;
 
 	amd_sdw_ctl_word_prep(&lower_data, &upper_data, msg, cmd_offset);
-	response = amd_sdw_send_cmd_get_resp(amd_manager, lower_data, upper_data);
+	if (amd_sdw_send_cmd_get_resp(amd_manager, lower_data, upper_data, &response)) {
+		dev_err_ratelimited(amd_manager->dev, "command timeout for Slave %d\n",
+				    msg->dev_num);
+		return SDW_CMD_TIMEOUT;
+	}
 	return amd_sdw_fill_msg_resp(amd_manager, msg, response, cmd_offset);
 }
 
@@ -446,9 +447,14 @@ static void amd_sdw_read_and_process_ping_status(struct amd_sdw_manager *amd_man
 	u64 response;
 
 	mutex_lock(&amd_manager->bus.msg_lock);
-	response = amd_sdw_send_cmd_get_resp(amd_manager, 0, 0);
-	mutex_unlock(&amd_manager->bus.msg_lock);
+	if (amd_sdw_send_cmd_get_resp(amd_manager, 0, 0, &response)) {
+		mutex_unlock(&amd_manager->bus.msg_lock);
+		dev_err_ratelimited(amd_manager->dev, "SDW%x ping status timeout\n",
+				    amd_manager->instance);
+		return;
+	}
 	amd_sdw_process_ping_status(response, amd_manager);
+	mutex_unlock(&amd_manager->bus.msg_lock);
 }
 
 static u32 amd_sdw_read_ping_status(struct sdw_bus *bus)
@@ -457,7 +463,11 @@ static u32 amd_sdw_read_ping_status(struct sdw_bus *bus)
 	u64 response;
 	u32 slave_stat;
 
-	response = amd_sdw_send_cmd_get_resp(amd_manager, 0, 0);
+	if (amd_sdw_send_cmd_get_resp(amd_manager, 0, 0, &response)) {
+		dev_err_ratelimited(amd_manager->dev, "SDW%x ping status timeout\n",
+				    amd_manager->instance);
+		return 0;
+	}
 	/* slave status from ping response */
 	slave_stat = FIELD_GET(AMD_SDW_MCP_SLAVE_STAT_0_3, response);
 	slave_stat |= FIELD_GET(AMD_SDW_MCP_SLAVE_STAT_4_11, response) << 8;
-- 
2.48.1

