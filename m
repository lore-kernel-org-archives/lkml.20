Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.68
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794066528;
	b=vBENjGni6GvPHYSkjfAC+fN9hdiJQhrtc4dGxktFSiPMkMMSeptpP0aKhJ7IByxDboBL
	 WTDmL8GwSfPShToN/eIaUubv5YoHmFg6DPkYgaLpBomB8G85W7W65mhdQoXTQmQbllM/k
	 uUcZxR4UqslwXnssLDBFlVAFhfrIQe3crtGQMB8hihArAc03thSjo3coty88qYAHRFEyn
	 Zl2MeRm0QzMnBzU4/G/I7UsIcQZpbClhHC+1SbR17G/W/p5C3UAWnbsN1eh3FZa4Sy4jR
	 F9zbd+z/onAXiiw3CFqh6czSSlPopfKWdlqJeRKF9QvPAZoxmfkYbT1Em9O7jW47V5Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794066528;
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
	bh=i5RwIZeeHADc9m7tha0nyd6eN/74ccaXZapot1cWFa4=;
	b=oY7kgNdTSV6AxVQF94FQsDMJhA7+XgdI3Si0AApGc2MwpeH0M9HnubUK3STxf1gvzPK7
	 YVgp21MX4qrE8zAHlmauZy3SKAY5Irfgbzhd4gvwS8yoxt0a6grLh8Tkggb4gwRKIT0NW
	 hvI+zcTUQQWeNND9pMtlctu0P0CIz6J6Ls8sCVkoc8VlsV9XHDyp6F8dbbzhgGWpG9zeG
	 FSl7yop+w/uCi7F5fEZHgP3Y+Soyzbn/gqjHZrnix7FML88e/mxs1KdyDJvguNNsYhyQy
	 69uFC7RHzclxal7mZkoWkhZkj7bBvhJq6XqtbT052EegL97pcEf4VnSQ/0m/GzlS1ug==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=igRBaoCN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.68
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012068.outbound.protection.outlook.com [40.93.195.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A9D6083638;
	Sat,  7 Nov 2026 15:48:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79A9D6083638
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=igRBaoCN
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fZtSKj9l3Skk83nBjBJ3DFnhYa2xvkBnQYW19RBr4xo81M1uaTHia1VUE82QzY/RMBCttBEBOAQOvATd+edsf/ueUQs5eGYWdxQhlq45Ar7tCGIF2dj50EQaZThfipBxLn4ksU9L9HVW0ckHWAG5S71d3idM2ci4zsOxZbHyXUS46gCoLdcXrN9/SEfoSEkJ4VBZvRE2/gGUuYQQiVIoV+0QqCOI/+1sGqI9n1iHDtP+C281egikBQjPkayq+3PjcMd2GuxqjbMn02mTTF24HCxralL+9/2eftMhubtNXCe6qnetMSyswThwAbsFCkoAD8KlPcH8pBywoEF/azu9Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i5RwIZeeHADc9m7tha0nyd6eN/74ccaXZapot1cWFa4=;
 b=cAz5uzJWvD5Aqhul4bdQfg/Ntrrds3rRSMMsjLWcyZyZbCI0sfOZkjNDueDPNyW77ZFhFuhUS7FYumiS7yl1ye5DHHiAElOeEbPuc2TlC2S+88TeqPWo9kb+bEs/eeApcUdc5iytH2jNcQGoGEopOe2iEZTjqLs5pxATicfF7WNBQZHgxDVOSsDtBIHakRrg4nxpzBP8q3Fl3Q7SuAmoBfxRJo+pxeHWAqL1BylYIVOHeiJfitHD3cM7avuCta6RiRonZtul619rIdLYRQTBnpg2l1IqyuT1S2Fo0MTN7pB2HP8S9kg2r8fTwzm/FRnc+6/uUm3qPjpICHnIN1WqFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i5RwIZeeHADc9m7tha0nyd6eN/74ccaXZapot1cWFa4=;
 b=igRBaoCN7b7w91BVlqfGE/tcJTbOiRkiAhmbgR3Di0B2xOxLNgnMvXCny0/x03VdHEGn1Y8AShIVqs7Qt71a3xn9PKhuEPkmx7FGf9uICcq65EjRpkJds3+3PX2gnkbUfOEuQrrbPWjP0DBhPnrNdX+ZvakzHu7JV9wpd6W2yIM=
Received: from PH8PR05CA0008.namprd05.prod.outlook.com (2603:10b6:510:2cc::19)
 by SA6PR12MB999200.namprd12.prod.outlook.com (2603:10b6:806:450::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Sat, 7 Nov
 2026 15:48:44 +0000
Received: from BY1PEPF00026965.namprd05.prod.outlook.com
 (2603:10b6:510:2cc:cafe::9) by PH8PR05CA0008.outlook.office365.com
 (2603:10b6:510:2cc::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.6 via Frontend Transport; Sat, 7
 Nov 2026 15:48:44 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BY1PEPF00026965.mail.protection.outlook.com (10.167.244.149) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Sat, 7 Nov 2026 15:48:43 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sat, 7 Nov
 2026 09:48:43 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sat, 7 Nov
 2026 09:48:42 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53
 via Frontend Transport; Sat, 7 Nov 2026 09:48:38 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <broonie@kernel.org>, <yung-chuan.liao@linux.intel.com>,
	<pierre-louis.bossart@linux.dev>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<Syed.SabaKareem@amd.com>, <Mario.Limonciello@amd.com>,
	<Richard.Gong@amd.com>, <lee@kernel.org>, <Poojitha.N@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH v5 09/25] soundwire: amd: fix SDW command timeout return value handling
Date: Sat, 7 Nov 2026 21:15:18 +0530
Message-ID: <20261107154659.3358223-10-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: BY1PEPF00026965:EE_|SA6PR12MB999200:EE_
X-MS-Office365-Filtering-Correlation-Id: f759c3d3-f9fd-4542-dd0f-08df3ce69a5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|82310400026|36860700016|261026140227099003|11063799006|261022075727099003|261022113327099003|261009223027099003|56012099006|261022105027099003|261021121427099003|261022115727099003|261021133027099003|261021130227099003|261021135927099003|261021123027099003|261102123227099003|261026135527099003|261026121527099003|261028144727099003|261026130827099003|18002099003|22082099003|10067099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	BcWYii4MBtZaDe/qTrhefd6yxtCJuYke2+3R3jnMZ1kKMVI8Dj25ClBDthNv+X+8BMxjMqLlyM7zkbUwuA3VEySnAtlyIBLbLutHcwx44U3A33MIzcZisc4JUu/7ZsMySxouNPq86C74X5vSUtM+RXFfTSI6bE4EdsjMzH6y30auoTYSP+9DbPAzg/tVmygYo5WUThD72opdJ7p43kvxACAoGYhEoTCGnwuqVhKJDp8ueLvmQAc4/cVVUD94RhwKMvBn/RG4/Nl9w9kVf9sW1IS0GEGD6ZIYaArJDw2sDlQrJTz8lcLX2hcLIiHV4c8189N0D/ISunLYIb/NRuHhIUyh84y+W3MqhYunSh/fyltVgYk6A7v2JOjg7VT9V2W5QHzWd31zNSU9cJDoYulqf23rgNKOwXx5bqruCzaiTDWfjsRgoMCYzcZha24rmyM7UnDAKYR2vA9+2RJo+RF+baXotSrW7G9jFNgoeI4Lqmyecod6iVfqQ1V8p+/do9tOlV4KdfB4UMMDplrK3qIcBqLfrm2cYPBIbSzHBe61CdAL3cmiBDOkY3jHF8pqy1SEJGy8bNn8z/pDzTI6u6cZksIrClqS6SGRDCf5BFNNuFylSElCCoF0goUMBlf08l7z0POjNbmzCP4zcqKJAgFMzg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(82310400026)(36860700016)(261026140227099003)(11063799006)(261022075727099003)(261022113327099003)(261009223027099003)(56012099006)(261022105027099003)(261021121427099003)(261022115727099003)(261021133027099003)(261021130227099003)(261021135927099003)(261021123027099003)(261102123227099003)(261026135527099003)(261026121527099003)(261028144727099003)(261026130827099003)(18002099003)(22082099003)(10067099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	01ZMi/3MdE3SVdDknS3KjvMUexpzSacDyDC61mbOiqj3q5Ql8OZz5sCukhppFlV86w6KgR4k07O5k3sJe8m15Rp8Uv+QYDUJ5N0mgWrO99A+dog+SztXxZKvX5bfqSj4/3oqiIkHnkzJJFE6r+CXR8gICVc/LfuE7K/YhtF36dkU6MYXuaY+yqYZxjB/iartS2opr7yelBw7MBpU7MkDY50757CWIpmvk8FYnVOXRhnXZgitaEuCoqzVLaM+kqcKlHtsDj1VCdAZaN9s3fx0f7RX3hQXH4S1xCRlf7T8tJ5e0Ge6i2yZOEIpkzCMCj5NLZ5trupsANp9gcHR8Kd3cKBji2ehoTpQoEEmhCFt9CmwwcBt0Yh1SyAsaGl8F5RvNOLYFeOTZDb0en00aMO2RfvzqJLG2UGJ9oUHQY9VRrNDg+23nHvf34w/DBA/fsa0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2026 15:48:43.8465
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f759c3d3-f9fd-4542-dd0f-08df3ce69a5b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF00026965.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR12MB999200

amd_sdw_send_cmd_get_resp() returned u64 but was returning -ETIMEDOUT
(a negative int) on readl_poll_timeout() failures, which silently
widens to a large u64 value.

Change the return type to int and pass the raw u64 response through an
out-parameter. Timeout is detected directly from readl_poll_timeout()
return value.

Update all callers: amd_program_scp_addr(), _amd_sdw_xfer_msg(),
amd_sdw_read_and_process_ping_status(), and amd_sdw_read_ping_status()
to check the return value and handle timeout explicitly.

Fixes: d8f48fbdfd9a ("soundwire: amd: Add support for AMD Manager driver")
Reported-by: Lee Jones <lee@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-c3a53ed5-eb8f-4982-a3b6-db189e009b68
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_manager.c | 54 +++++++++++++++++++--------------
 1 file changed, 32 insertions(+), 22 deletions(-)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index 3f3fffbd529a..f2ed0490aa82 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -348,10 +348,9 @@ static void amd_sdw_ctl_word_prep(u32 *lower_word, u32 *upper_word, struct sdw_m
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
@@ -389,9 +388,8 @@ static u64 amd_sdw_send_cmd_get_resp(struct amd_sdw_manager *amd_manager, u32 lo
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
@@ -407,19 +405,22 @@ amd_program_scp_addr(struct amd_sdw_manager *amd_manager, struct sdw_msg *msg)
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
@@ -464,11 +465,7 @@ static enum sdw_command_response amd_sdw_fill_msg_resp(struct amd_sdw_manager *a
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
@@ -488,7 +485,11 @@ static unsigned int _amd_sdw_xfer_msg(struct amd_sdw_manager *amd_manager, struc
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
 
@@ -544,7 +545,12 @@ static void amd_sdw_read_and_process_ping_status(struct amd_sdw_manager *amd_man
 	u64 response;
 
 	mutex_lock(&amd_manager->bus.msg_lock);
-	response = amd_sdw_send_cmd_get_resp(amd_manager, 0, 0);
+	if (amd_sdw_send_cmd_get_resp(amd_manager, 0, 0, &response)) {
+		mutex_unlock(&amd_manager->bus.msg_lock);
+		dev_err_ratelimited(amd_manager->dev, "SDW%x ping status timeout\n",
+				    amd_manager->instance);
+		return;
+	}
 	mutex_unlock(&amd_manager->bus.msg_lock);
 	amd_sdw_process_ping_status(response, amd_manager);
 }
@@ -555,7 +561,11 @@ static u32 amd_sdw_read_ping_status(struct sdw_bus *bus)
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
2.53.0

