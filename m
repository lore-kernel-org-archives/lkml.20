Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.34
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794066499;
	b=c+woKzBlj4JPX/7dSPsCWmV/wERqrD9R+As30w+v1udAnc6IsfTqDbMfy9L6enuo368h
	 QhQjgUorot+hvoWodHauCxMLDZ7AtcXL8VylXGmjn/BOvABiduOHAGYnmQ6M10JUH1+Gy
	 qn6NbxvGPvkPyEzWJXrH8ktMMHtcnrQVeLNNQQfz+g/b3bKQ/d96tJDpuzVxBnLtlT8ga
	 GaicE5KQgi45Yox7TzEK6j33kCr4s1/VZtv28pPEVEU12J8H46EShwsC+gTqkD8FPhwlQ
	 mzQ4EpdWDzFDGkJa6CqkWl9ZhCNelZ3me8dYrwxrNWSJmrOIKdqF96B+V+ukAyG8C9w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794066499;
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
	bh=yDsAbFwdg2r/bSOx4EHEcVuKc8yHTNE5MPfIdPvWD9U=;
	b=3ooHlCHzH9pG+WmbR8zYikUQpe2zq518JhdpxT/FsZnXzFfHQz/T8k/lZMwh7oaVDDyM
	 fPqWrrq7SMkmzmsTwl1jWLHmRnQA37gdOfxrLD1ZWvuIucLxiKOzczbv7DWC0WUz8PfDB
	 9l8JR8OdrK9w7H7GhCw9bmLoCvxKAUaGKy2LA/B/UsRAgSsLb9NcTbggeOC+FCOyVTV+d
	 ALRxwonaUf4ud2prvRd4EsHVwNAuz6ya/x/lYNEFEQ7NdwwVQfrnkW/rL9M2Qxqbd4MnG
	 ov69uApEefSHwcZCyb2pFL6WvCMA7wT0NYV+WP2iwjsTo0EW5QQluJdf3Pcsy0aS6Gw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=AipbWe1N;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.34
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010034.outbound.protection.outlook.com [52.101.56.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37854606A332;
	Sat,  7 Nov 2026 15:48:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37854606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=AipbWe1N
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NsrIICmG4UOECXeUjrqgWaD/WxUmKyrzGbgnWnxqT8J0TdfeBNYcrJfBPq4JLkcugIR72DzA0rihYqz50RhwOBu/mpx2PCt4yLFleaTxzoAEiT5Nahbfjxcnk1hmDacAHo97CEwzjMVrRgaHiVdVl5cYKbZZDNxxmkPRuO9PsXPKQVwP0a3jYyB3aFFfreqvKccOQ36BntWlu1yuolw9A+A99CLZZQtN81jTMS8RMBVXjvk6BYp29qs3PGXJa8RYv99eWaJQ8vQEX4Uc3ZcLiCJv9cfFCi7ALXqfPdEfvIMff9a94QhMv2RWMDEDYnpOPtnwiUDF7n2kgYCK+DHbjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yDsAbFwdg2r/bSOx4EHEcVuKc8yHTNE5MPfIdPvWD9U=;
 b=OADc155QRPvwvH7Y1UjCOEvsr5rmfZvmMVSs7NolavbUFJgujPmepHztWl0Cmtb3dVFqkgSP7nY8toOLUMeb1DsUVOo41ev80+h1ASxW+XLboZDCtZrE04UHwIOvaEfCy8ld1AJIe8+7WxnfTj9v3bO0lnq+MY7cM1Sq+JpD08ZsrUCSkBX+0YpY5+3u/Nx6Qb7xwMf3YHe3u+J857YH25RAsGwjvcbKnVh1wY1pcKEUSEnfnt+kQHig1UUHE/qFzOvgv/gJqHqFtB98swm/a1LEQAshZnzGc6letZwHh58T8nuHMCulvK+5gUTIQw5O6Fx6qvs0ko07keFC6MJwQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yDsAbFwdg2r/bSOx4EHEcVuKc8yHTNE5MPfIdPvWD9U=;
 b=AipbWe1NIuGvX58PdO3enSPoEsJxCM5HmlqVEe398MBAxJAiurFzf1Rsg0q8tRljl65p9oHIGUx1jLD/dHXTDIMO+Qb+8/Vw/NtijM1V/80x5Vya7VlREOhT2vP6N4vPR9AWZBOfDwZOhK5bpICcGquDwEtIA6VXl00hoxDAofI=
Received: from BN0PR07CA0030.namprd07.prod.outlook.com (2603:10b6:408:141::13)
 by DS7PR12MB6022.namprd12.prod.outlook.com (2603:10b6:8:86::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.11; Sat, 7 Nov 2026 15:48:15 +0000
Received: from BN6PEPF00000071.namprd03.prod.outlook.com
 (2603:10b6:408:141:cafe::30) by BN0PR07CA0030.outlook.office365.com
 (2603:10b6:408:141::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Sat, 7
 Nov 2026 15:48:15 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN6PEPF00000071.mail.protection.outlook.com (10.167.248.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Sat, 7 Nov 2026 15:48:15 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sat, 7 Nov
 2026 09:48:12 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sat, 7 Nov
 2026 09:48:12 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53
 via Frontend Transport; Sat, 7 Nov 2026 09:48:08 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <broonie@kernel.org>, <yung-chuan.liao@linux.intel.com>,
	<pierre-louis.bossart@linux.dev>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<Syed.SabaKareem@amd.com>, <Mario.Limonciello@amd.com>,
	<Richard.Gong@amd.com>, <lee@kernel.org>, <Poojitha.N@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH v5 02/25] soundwire: amd: program pad SCHMEN and OE control for ACP 7.0/7.1/7.2
Date: Sat, 7 Nov 2026 21:15:11 +0530
Message-ID: <20261107154659.3358223-3-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN6PEPF00000071:EE_|DS7PR12MB6022:EE_
X-MS-Office365-Filtering-Correlation-Id: 10748053-e120-4a2d-8fbe-08df3ce68923
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|376014|1800799024|36860700016|11063799006|56012099006|261009223027099003|261021123027099003|261021121427099003|261026121527099003|261102123227099003|10067099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	kB1lIvB9ZpqeSfBtp8NN6opmDIfTNus3PbVgzjWtlcZegZ2lSobZKx0iXPhS186ZVGme8bXBEgzueFRtSzfJXMKq+qOqTJ7fyLg9VlhWXxUK5S69DNhsF86ygzPZ8QaMAQydowOpQwRDtjixQctfQtZJiqwHg5Rbn4HJI5tu+g40je/PNaYYwYSFN4DC4HjKKIVuEOrgS/P7e2Fb2bFOurwWZ5PBF7O8r+aSGD3xOX+oNutZ0kmVtbOyjaqwkT/V48DCpksgN7m05QKH/gcVQo1yoVDG+4KpevdYOi2UWW5IKadbGSQmoreXRg1rpPpeYVg3pqHoVupaaB+VK5Amlr41GaOh0f/91GL0sbevNPeD3xuBVSBco30NRrq7uSCAZepx2V083I2T24o/ZtYG/IJppnd6pIta7D8zp6NckZx5vw2D230zq87YroqxxwrDO0nj+suUfbZeNeuQXsvBB/RnsEFLhA05KwnbCdc0U/9aPmZLfnJAGj1Chbid3Efk4VXwHPunGN3+FciycNThFpaXIjZh+W4zrVDUa38YETNzr8UVGl59mJQpEbKpmMCfswcCJ5Bf82IMLQF4v7JhJaeSJcmhf/USTRo/TrgfGdsIS+33G5Tkd15d+P9Zq3MmS/Rku2GOkCuqDM6MPqRlJOGB+Emr8ysbhRKS3qD7vvDN7P7jaT+EDLjn8LQppgfuZjwEFHBbHHY2sioToR6LHw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(376014)(1800799024)(36860700016)(11063799006)(56012099006)(261009223027099003)(261021123027099003)(261021121427099003)(261026121527099003)(261102123227099003)(10067099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	QSPC/U+4AU22jrVODAtpow352WJZOUGwG9ly9vnpF4+4x083+4pPz1j+bmjNpoXhyAMxiF8XATEyESG+T/+F1U4DzaL71b9vdymhuCAu4qsRENGdjkD1PzE5EOZZZCfKie+ef7Monxfljtfqr6bBsi2yM2p01Lm7xu0do7/+3y/52N2e5xyV6hj92W634sws8I0zAyyzbv6LTXYgn5YiW8eqgdKZrIUlw3s4+qAVQwvI0en4dP/pJNFQwEBEjO93v9pwJ6g6MlzhIJgARqxhX9pAG7iSRqtwVsjE2m8MIrcHArRLgoEfq40kRZxZZOV/B0ahBjCuAFq8mAV9Q40fA7L9h9BRllEyWBP00DxrwnqeW/vduWEVErgbxEEryEJho/BBB1hwGmOtINlCYiU1Ee18e8SafPJvB/LB9WTqA26GDpA9Q05SPZy4fHo7pfqu
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2026 15:48:15.0420
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 10748053-e120-4a2d-8fbe-08df3ce68923
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN6PEPF00000071.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6022

ACP 7.0/7.1/7.2 hardware requires SCHMEN control and
output-enable (OE) registers to be programmed as part of the pad enable
sequence, in addition to the existing keeper and pulldown writes.

Update amd_enable_sdw_pads() to program ACP_PAD_SCHMEN_CTRL and
ACP_PAD_DISABLE_OE_CTRL for active pads. Pass acp_rev to
amd_enable_sdw_pads() and restrict these writes to ACP 7.0/7.1/7.2;
ACP 6.3 is unaffected.

Define per-register masks in amd_init.h replacing generic local defines
in amd_init.c.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Fixes: cf0ddbc29dfa ("soundwire: amd: refactor soundwire pads enable")
---
 drivers/soundwire/amd_init.c | 48 ++++++++++++++++++++++--------------
 drivers/soundwire/amd_init.h | 15 +++++++++++
 2 files changed, 45 insertions(+), 18 deletions(-)

diff --git a/drivers/soundwire/amd_init.c b/drivers/soundwire/amd_init.c
index b4f45bdf3c17..032697ea3590 100644
--- a/drivers/soundwire/amd_init.c
+++ b/drivers/soundwire/amd_init.c
@@ -16,37 +16,49 @@
 
 #include "amd_init.h"
 
-#define AMD_SDW0_PAD_CTRL_MASK				0x60
-#define AMD_SDW1_PAD_CTRL_MASK				5
-#define AMD_SDW_PAD_CTRL_MASK		(AMD_SDW0_PAD_CTRL_MASK | AMD_SDW1_PAD_CTRL_MASK)
-#define AMD_SDW0_PAD_EN					1
-#define AMD_SDW1_PAD_EN					0x10
-#define AMD_SDW_PAD_EN			(AMD_SDW0_PAD_EN | AMD_SDW1_PAD_EN)
-
-static int amd_enable_sdw_pads(void __iomem *mmio, u32 link_mask, struct device *dev)
+static int amd_enable_sdw_pads(void __iomem *mmio, u32 link_mask, u32 acp_rev, struct device *dev)
 {
-	u32 pad_keeper_en, pad_pulldown_ctrl_mask;
+	u32 pad_keeper_mask, pad_pulldown_mask, pad_schmen_mask, pad_oe_mask;
 
 	switch (link_mask) {
 	case 1:
-		pad_keeper_en = AMD_SDW0_PAD_EN;
-		pad_pulldown_ctrl_mask = AMD_SDW0_PAD_CTRL_MASK;
+		pad_keeper_mask = AMD_SDW0_PAD_KEEPER_EN_MASK;
+		pad_pulldown_mask = AMD_SDW0_PAD_PULLDOWN_MASK;
+		pad_schmen_mask = AMD_SDW0_PAD_SCHMEN_MASK;
+		pad_oe_mask = AMD_SDW0_PAD_OE_CTRL_MASK;
 		break;
 	case 2:
-		pad_keeper_en = AMD_SDW1_PAD_EN;
-		pad_pulldown_ctrl_mask = AMD_SDW1_PAD_CTRL_MASK;
+		pad_keeper_mask = AMD_SDW1_PAD_KEEPER_EN_MASK;
+		pad_pulldown_mask = AMD_SDW1_PAD_PULLDOWN_MASK;
+		pad_schmen_mask = AMD_SDW1_PAD_SCHMEN_MASK;
+		pad_oe_mask = AMD_SDW1_PAD_OE_CTRL_MASK;
 		break;
 	case 3:
-		pad_keeper_en = AMD_SDW_PAD_EN;
-		pad_pulldown_ctrl_mask = AMD_SDW_PAD_CTRL_MASK;
+		pad_keeper_mask = AMD_SDW_PAD_KEEPER_EN_MASK;
+		pad_pulldown_mask = AMD_SDW_PAD_PULLDOWN_MASK;
+		pad_schmen_mask = AMD_SDW_PAD_SCHMEN_MASK;
+		pad_oe_mask = AMD_SDW_PAD_OE_CTRL_MASK;
 		break;
 	default:
 		dev_err(dev, "No SDW Links are enabled\n");
 		return -ENODEV;
 	}
 
-	amd_updatel(mmio, ACP_SW_PAD_KEEPER_EN, pad_keeper_en, pad_keeper_en);
-	amd_updatel(mmio, ACP_PAD_PULLDOWN_CTRL, pad_pulldown_ctrl_mask, 0);
+	amd_updatel(mmio, ACP_SW_PAD_KEEPER_EN, pad_keeper_mask, pad_keeper_mask);
+	amd_updatel(mmio, ACP_PAD_PULLDOWN_CTRL, pad_pulldown_mask, 0);
+	switch (acp_rev) {
+	case ACP70_PCI_REV_ID:
+	case ACP71_PCI_REV_ID:
+	case ACP72_PCI_REV_ID:
+		amd_updatel(mmio, ACP_PAD_SCHMEN_CTRL, pad_schmen_mask, pad_schmen_mask);
+		amd_updatel(mmio, ACP_PAD_DISABLE_OE_CTRL, pad_oe_mask, 0);
+		break;
+	case ACP63_PCI_REV_ID:
+		break;
+	default:
+		dev_err(dev, "unsupported ACP revision 0x%x\n", acp_rev);
+		return -EINVAL;
+	}
 
 	return 0;
 }
@@ -86,7 +98,7 @@ static struct sdw_amd_ctx *sdw_amd_probe_controller(struct sdw_amd_res *res)
 
 	count = res->count;
 	dev_dbg(&adev->dev, "Creating %d SDW Link devices\n", count);
-	ret = amd_enable_sdw_pads(res->mmio_base, res->link_mask, res->parent);
+	ret = amd_enable_sdw_pads(res->mmio_base, res->link_mask, res->acp_rev, res->parent);
 	if (ret)
 		return NULL;
 
diff --git a/drivers/soundwire/amd_init.h b/drivers/soundwire/amd_init.h
index 106852464dc7..8324bc7a147f 100644
--- a/drivers/soundwire/amd_init.h
+++ b/drivers/soundwire/amd_init.h
@@ -9,7 +9,22 @@
 #include <linux/soundwire/sdw_amd.h>
 
 #define ACP_PAD_PULLDOWN_CTRL				0x0001448
+#define ACP_PAD_SCHMEN_CTRL				0x0001450
 #define ACP_SW_PAD_KEEPER_EN				0x0001454
+#define ACP_PAD_DISABLE_OE_CTRL				0x0001468
+
+#define AMD_SDW0_PAD_PULLDOWN_MASK			(BIT(5) | BIT(6))
+#define AMD_SDW1_PAD_PULLDOWN_MASK			(BIT(0) | BIT(2))
+#define AMD_SDW_PAD_PULLDOWN_MASK	(AMD_SDW0_PAD_PULLDOWN_MASK | AMD_SDW1_PAD_PULLDOWN_MASK)
+#define AMD_SDW0_PAD_KEEPER_EN_MASK			BIT(0)
+#define AMD_SDW1_PAD_KEEPER_EN_MASK			BIT(4)
+#define AMD_SDW_PAD_KEEPER_EN_MASK	(AMD_SDW0_PAD_KEEPER_EN_MASK | AMD_SDW1_PAD_KEEPER_EN_MASK)
+#define AMD_SDW0_PAD_OE_CTRL_MASK			(BIT(5) | BIT(6))
+#define AMD_SDW1_PAD_OE_CTRL_MASK			(BIT(0) | BIT(2))
+#define AMD_SDW_PAD_OE_CTRL_MASK	(AMD_SDW0_PAD_OE_CTRL_MASK | AMD_SDW1_PAD_OE_CTRL_MASK)
+#define AMD_SDW0_PAD_SCHMEN_MASK			(BIT(5) | BIT(6))
+#define AMD_SDW1_PAD_SCHMEN_MASK			(BIT(0) | BIT(2))
+#define AMD_SDW_PAD_SCHMEN_MASK		(AMD_SDW0_PAD_SCHMEN_MASK | AMD_SDW1_PAD_SCHMEN_MASK)
 
 int amd_sdw_manager_start(struct amd_sdw_manager *amd_manager);
 
-- 
2.53.0

