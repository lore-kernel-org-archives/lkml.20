Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794902690;
	b=qZ/OVtDkHfu3RIZjuIyT+Uzj7SrIkzwCsTymCpDfEZFlkbH6fCsCbiV+rDbZYIKGfecn
	 InvukxWcunOvLaitmxmEwiVxaBvyrS3IKpcbcW0Mo1Y3sLp/KVoX5Q+tVZiWZ99D8cPPr
	 GsIQkQqTCVvSBGkL7I3ZtRiiDqTNvOTg4/NSZBjDCwnzI1xz7l4Hg3Afyx/u/TjOC5r88
	 yZChxr+Vk1wIeNw384Ys0pDMKUYl8+bWLJtCmBEDBuV1X389OqxzHEO13H3V/IMGAtX88
	 k5NPmZPzM8z5X7hcDcACmUHBBqhZgDAL5hkxv0CjcsbCLJ5k3vRAcwdvST/zTiReHZQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794902690;
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
	bh=9XbuDfBDKZcRZPstW66PLoRkPcAZzd/7gsuYKWf+xoM=;
	b=4Yo+Ny+f/YDUUx3EUNrHQ+dUny+ZJVkHwZeMM3AxOSSGZfoSzYTP9wQlLPoaO19VxLgh
	 L1S4mweREfQ7x/Ua8pP7tSAI4L75vqdKM15dPbxmTHj5UtSh+PDSt690AIzpAmlDXCiNN
	 3WA3tSLeOTfjYTfPoppfq2D3VmLhlXTWHSMPeYk9M33kDsAOVTwrITxp4uJ1T8bpN48Oq
	 X1StzG5/8Dn/4zsvAaSl0gGUTscDNzlxTwiBPoNER53YAut4ivXvAfsYgUAPACIjJSRau
	 Vs1+71rJPh1DFwcK4KzdfSYAxU3C/QX1tRk4X41MqH7DAdQCrZNp+B6b8sDLfOR3/nw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=P6JMqfrK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.13
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010013.outbound.protection.outlook.com [52.101.56.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AFD8606A331;
	Tue, 17 Nov 2026 08:04:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7AFD8606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=P6JMqfrK
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dndjt3eE2u5xOhMn5JOfuUt9tjFt6I9rFoWFtC6kvNhVTCh06bQhaEJ8i9R7ajinCUn2B+PYVmq6obSCzhvlTbhTO4JjHwSBPBLzYsG84a0b8N6xEdtgEzUyZ6sK6eSCF2GyW/u0YX+AWQSIOTixPs4/3JSXr4a2UgP7Zq/qYJjgX8J67kv/dRnXnOVFtzG4cgij4kP22QEa4U1/q3iH+GjB/wmrcDnmNm6EBrdQErLQCouptFcKC1VCo6mONI/y9T6F8HJVamyc6XNfr5wl/p0q+YS8/jxVl5K3S0vxmfpyHAgBNlMXDUjXM2UoPpuPJFWVeTjeGTqhDKKwarqfNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9XbuDfBDKZcRZPstW66PLoRkPcAZzd/7gsuYKWf+xoM=;
 b=jUHw4kAcHNCLFG5+zUF9zxeYUNmpzO8ZAcfHou4jpSttjGy+0wQVarOCT3C14XpyCFyquCVM2hAi/kL7o2WRf+z5Qym8IWd9TwwW8fCWk+cr6LVdsAspl3QFtb+vZxEyu+cDoFEpZQ9g/jMM1Q01/LvQs09nYLyfcHPkvhTR0D9yUt/Od4hpIqLwQUWnOXwcPo1eeiCYn0LGXr/rk1Rp7lOLHNmh8rh3wvNmTQ0ugg0L9c9+Jr10jCA4l54bqmbbV7FdGLTpc09buDx/E6+mMvKO5C2hddfG2GRWKVvxjGMcO8yLx7ofsFTJHe1jlVjn3CX7UZmnN+IPxvqQJqp6bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9XbuDfBDKZcRZPstW66PLoRkPcAZzd/7gsuYKWf+xoM=;
 b=P6JMqfrKfuBp3Advobzfs/n0k/pXQJhhorE7HGNWERdxjlNYJcBq2xYyZrHJ8PiuOfrwyPRQ0AM1nqYDvEmkGxk5s1JzvMcnguyvtbDAuJ2x5TeiXmeRryCF1OSY4ssI8i9fD6cag5QgUujAUEBIRk64wmpfEIWdU2535JWx1nY=
Received: from BN9PR03CA0088.namprd03.prod.outlook.com (2603:10b6:408:fc::33)
 by DM6PR12MB4041.namprd12.prod.outlook.com (2603:10b6:5:210::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 08:04:45 +0000
Received: from BN2PEPF0000A98D.namprd04.prod.outlook.com
 (2603:10b6:408:fc:cafe::ab) by BN9PR03CA0088.outlook.office365.com
 (2603:10b6:408:fc::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Tue, 17
 Nov 2026 08:04:45 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN2PEPF0000A98D.mail.protection.outlook.com (10.167.248.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 17 Nov 2026 08:04:45 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 17 Nov
 2026 02:04:42 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57
 via Frontend Transport; Tue, 17 Nov 2026 02:04:39 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>, <Poojitha.N@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH v2 11/11] soundwire: amd: add interrupt_enabled synchronization for ACP7B/7E/7F
Date: Tue, 17 Nov 2026 13:31:50 +0530
Message-ID: <20261117080239.918428-12-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261117080239.918428-1-Vijendar.Mukunda@amd.com>
References: <20261117080239.918428-1-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF0000A98D:EE_|DM6PR12MB4041:EE_
X-MS-Office365-Filtering-Correlation-Id: 13a48834-57ca-4813-f9fa-08df44817168
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|36860700016|1800799024|82310400026|10067099003|11063799006|56012099006|261026121527099003|261022075727099003|261021121427099003|261102123227099003|261009223027099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	C5ZDO8f1dqM30ZNGrwr3ZfFX8VFZzlEZqDJKTkbRaxVlft+MekaCFNlCbdpuTQBpKv4UGevuKfeZgH4Vtyt29+iCMzwJMayJi+HthjDuP2OGkZDpcYddONZIIMVUJOaaYQzDfrpr73nxMLgOCaVyl3D8tfTZy6QRTrtElaGz2XZblyriBCKrYA8wN0GAGvomZpNer4nfpOryb+8iEpdswQh+FyDnV7Ob0dg4bMYB+VcotkIPksnwiVTWlt2roQge0G99DGaip3cvaqct/gzvICZE07F0GrrUlGp7BohZBIe/uqH5unTrzS0NeQ/MGqCF+orLcZZp6Z1vTQ66+KoOShDXqLHxSgDx70sTGpC7oJVe2wvU1a7huh0YMrUtrlICibPufMe+UkUVaR5/bSdPHW8JNqhQeNUYQjWVOPcCCf+pOK73nLkfJhd7WPxXm7d6ntVklxD8UmWT3tT59eW5X9Xf4vH+RCF0Sr1JYVl/tf/ZQML6aA7mpdSK65K6eUgvsK+0UHyp8ugnhGKn8p4pGYnqQLG2JjsIj4ZM+sSDyvabr/16uKqwbHJMBQRXHRW4jwuPuCNuQ8rOoND6Vmc3KMlefwPrZa0L/jWfBEyJuuAco4bloNQtUXCEbalRd9HjlO164LnkPz6whDswDm38jFnapMVe1SpGA2/534CgQaa/t0F1Y5ItXKv7Sbh1xRdeJ7bVKO2kjfTb4roF8zwjkA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(36860700016)(1800799024)(82310400026)(10067099003)(11063799006)(56012099006)(261026121527099003)(261022075727099003)(261021121427099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	H9nsItUogWtxwzrs9xQOj7R66jfpsqdsLsNfIJFBjgv7PD2c4+im4F5xZSei8W1Lw5ctSjHUNgrBI320B6xpXNW5Gm86u4krSRA2A/P1Tv3pK4EWuOWecjW/xp1poY7KoJfTehb27kSu/cIhLoBKCJummJC7f8IrQlWc7X3ZRChgignDPjec7zRJnygOoJ6pQQ3bTW/G58ht6HxkFHVsdC7fLRLJwAufNlZw23ZDK2pTSmhNCtS9O2ZFuvUah7FfxjNRKbW564xWRhrxUE2/oeeEX+pUH+k6OcyHaltstuoLznw5embfuyQnGgNIhyfrFfsZ9qfC8PrOcLcRw4PV+VHFMx7rlBRLSsx8LkmF9MLLs9PzOWNZ1/hx379SyvN6Js8i6ofJFaovJgCg16dApvGAlZklByhtJNcmrVHP2bljNMi09KUcHKCiGrWODBXR
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 08:04:45.3658
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 13a48834-57ca-4813-f9fa-08df44817168
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF0000A98D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4041

Mirror the interrupt_enabled guard already used by the ACP6.3/7.0/7.1/7.2
manager to prevent new work from being queued during teardown.

- amd_acp7x_enable_sdw_interrupts(): set interrupt_enabled to true before
  unmasking any hardware registers, so no IRQ can fire with the flag false
  and lose an event by skipping schedule_work() while clearing status regs.
- amd_acp7x_disable_sdw_interrupts(): clear interrupt_enabled before
  writing the hardware mask registers so any in-flight IRQ that arrives
  during the mask writes sees the flag as false and skips scheduling.
- amd_acp7x_sdw_irq_thread(): guard schedule_work() with the
  interrupt_enabled flag to avoid queueing new work once the driver
  has begun teardown.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_acp7x_manager.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/soundwire/amd_acp7x_manager.c b/drivers/soundwire/amd_acp7x_manager.c
index 34d159dcc991..8e080c81a47b 100644
--- a/drivers/soundwire/amd_acp7x_manager.c
+++ b/drivers/soundwire/amd_acp7x_manager.c
@@ -343,6 +343,7 @@ static void amd_acp7x_enable_sdw_interrupts(struct amd_sdw_manager *amd_manager)
 {
 	u32 val, acp_ext_intr_cntl, sdw_intr_cntl;
 
+	WRITE_ONCE(amd_manager->interrupt_enabled, true);
 	mutex_lock(amd_manager->acp_sdw_lock);
 	val = acp7x_sdw_manager_reg_mask_array[amd_manager->instance];
 	acp_ext_intr_cntl = readl(amd_manager->acp_mmio + ACP7X_EXTERNAL_INTR_CNTL);
@@ -365,6 +366,13 @@ static void amd_acp7x_disable_sdw_interrupts(struct amd_sdw_manager *amd_manager
 {
 	u32 val, acp_ext_intr_cntl, sdw_intr_cntl;
 
+	/*
+	 * Clear the flag before updating hardware masks so that any IRQ
+	 * that fires during the mask-register writes sees the flag as false
+	 * and does not queue new work.
+	 */
+	WRITE_ONCE(amd_manager->interrupt_enabled, false);
+
 	mutex_lock(amd_manager->acp_sdw_lock);
 	val = acp7x_sdw_manager_reg_mask_array[amd_manager->instance];
 	acp_ext_intr_cntl = readl(amd_manager->acp_mmio + ACP7X_EXTERNAL_INTR_CNTL);
@@ -539,6 +547,9 @@ void amd_acp7x_sdw_irq_thread(struct amd_sdw_manager *amd_manager)
 	u32 status_change_8to11;
 	u32 status_change_0to7;
 
+	if (!READ_ONCE(amd_manager->interrupt_enabled))
+		return;
+
 	status_change_8to11 = readl(amd_manager->mmio + ACP7X_SW_STATE_CHANGE_STATUS_8TO11);
 	status_change_0to7 = readl(amd_manager->mmio + ACP7X_SW_STATE_CHANGE_STATUS_0TO7);
 	if (!status_change_0to7 && !status_change_8to11)
-- 
2.53.0

