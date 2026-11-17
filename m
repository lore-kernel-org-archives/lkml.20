Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.29
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794899439;
	b=ITyantTN3YnC81Bj8U1gevkrtaa7Lr0lAqE3e+f/eYkduyJMeadeBL3tHzMnAfxYW943
	 M5Trcg23FDNWhBCmKTpXL0I0vhtwxffXQvQMNYcQIGbX0rLBAKOIP82eXTdtKO+hOBvz5
	 nrJGoYu9/+6l5O+g/eLy+8OG5bp3CXn94jL+6kiWhqMw76VDqE+wRy/kYbM12l40tRtJt
	 BqhrzLUoQ4y6IZIojvrd+1Dzu/rS4VGyBG/QQjRNF0B5vnQuVqfeCdiCb2ENvt2Vt8/l1
	 UCsKLH5ZNgA5LvlQZmeMykRjhejhT3f267iVtwajX0VeaW/ahoLuuUXokKPQJlRYJWA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794899439;
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
	bh=ZQlfosryg5VU/RHcsVrcFyJNWu5CuzaiP+LCPgAAqjw=;
	b=KrsQV17AGgqJ/C3tbT4UfsL9KrcnIULUtPu5Clbd99QiBA+doYf3BCd/w/Ru+gNgfZkV
	 8RLk/JEaRdKDAnFQrA10Z2mPw8DR09EB1mMf3UYzTPinQ7xv3s4xQpclx/rCmzHoeuy6k
	 fVS4emfWTCdKgLP5ZhMMsUibTNjEjIzpkzIC6IQ5B1IQvg+IonRw8QlEZWj4fBnNLROY+
	 rhTHxE9Fe/XjfEca1UIIkjkfGWou1KEcbN6JsY3lekKLiLaa+jesgVtC9/7N+l2SW4tFJ
	 IRL2wGWKi79Iqh4o4QgF4HIhja0S3TIChBB+d3fAuUVUy1p1p4WxQL4tfv9AMCG8Fbg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=uQsl6gdd;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.29
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013029.outbound.protection.outlook.com [40.107.201.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59BAC606A323;
	Tue, 17 Nov 2026 07:10:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59BAC606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=uQsl6gdd
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hvp9W+QkiE8kdW/PDeJQg5I2e7d/sgulciqAClf8geLsJ+HUdbkUj59DdBJyXlDRDK60wgvjF43nLdd9/IGqZ15Bd1G1kNy+Ey8qmcdDHRpqsHIGLlLys1Z8gtTQkJzwaQGrkZBxKEidsPcMaAlfeq+4EXFe17ObnGJaaHWnGuTIYwbMk0nbkVWpCmeH22BV2j1qbZJBTOqeNdIuUhIdPF60okPMHt45Ck5ttCnRc2wU43LJx8Aj8lfuWsluRUx3P8eoCSv+bw2cZSOWpfUU4rGTJBjecFUeU00eZ1LgPlyypNsYFQQAReL0C4fhc63m4YKqJmZ6sz7ZICoP+XNMgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZQlfosryg5VU/RHcsVrcFyJNWu5CuzaiP+LCPgAAqjw=;
 b=YcHppm0mz2kLtNh7EcjHuNzacsBmsnc1yhrGAm2b0AEmqn62V0S8kAd2cUy2pcpAcnvU0gNcvYdGIrv4gtE7SqqrykUj26wBMvxTpRjKVK7bm1pcrd6ceKsKH0x4z38glsQDo579DSA02IW4hdTk7f4qymc6r1VPTGjIpTlvtavqI46DwGc+X6rhtEp4pvUdcJDQp+0lGHGBox4zgizaeOu4VkKlaBZACacG2IF/nY3uGVVNlSdCGd3zwIGZFmzPPiamHKCKFWuGUjkbNZzsU9iap7E5sJyvjTO/zMvfeQFgLyUyfJGCX2M8Y5ZfdhmUd6h+guvtWvcSqJupOxB9bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZQlfosryg5VU/RHcsVrcFyJNWu5CuzaiP+LCPgAAqjw=;
 b=uQsl6gdd/zHho4HIpxaaUWg+6oDmkPH26AZXrsdf/WEicTSmBg6jQH+L095cGOxtjLIPSTzjxM4kwUOCjPjfXwBJ8KnFW4Dcy0LvCFWXwQPqutZejjUm7WB2NnUlNEmAeCHjyZCLNuM5CgLrLxSPkU8xBR2IAajKl50+3BnJU38=
Received: from CH2PR17CA0023.namprd17.prod.outlook.com (2603:10b6:610:53::33)
 by LY0PR12MB461782.namprd12.prod.outlook.com (2603:10b6:404:233::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 07:10:34 +0000
Received: from CH2PEPF00000149.namprd02.prod.outlook.com
 (2603:10b6:610:53:cafe::91) by CH2PR17CA0023.outlook.office365.com
 (2603:10b6:610:53::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.10 via Frontend Transport; Tue,
 17 Nov 2026 07:10:34 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH2PEPF00000149.mail.protection.outlook.com (10.167.244.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 17 Nov 2026 07:10:34 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 17 Nov
 2026 01:10:30 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 17 Nov
 2026 01:10:30 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57
 via Frontend Transport; Tue, 17 Nov 2026 01:10:27 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>, <Poojitha.N@amd.com>,
	<lee@kernel.org>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH v6 02/23] soundwire: amd: program pad SCHMEN and OE control for ACP 7.0/7.1/7.2
Date: Tue, 17 Nov 2026 12:35:37 +0530
Message-ID: <20261117070906.803139-3-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF00000149:EE_|LY0PR12MB461782:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f865af8-00c5-4b54-b5a4-08df4479dfd9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|82310400026|36860700016|10067099003|56012099006|11063799006|261026121527099003|261021123027099003|261021121427099003|261102123227099003|261009223027099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	//klh93/M+kqHgzMQoOURD9cuyRqDT2PHGVW9sMXPAY2+qMZGmRlacxvsHlCTInnxNR+riZR19QTREcGa9r8PzkC+21CcjM3DguBO1xVP3DH7nSZr10UNCmR+fKLi8xHtdoq+eSZg5lc5F85WA+MNg3K5wtfXzYpu0iyNKPtJNoU9vf3PMxIJoXcTALi2rU9D4Y6WDIUUVQj3cE86kuBXo9fJqVpEL9f2Mxrufl+O0XJ9qAObFRoAmVyNSEvbnwRAi/vzdpme1eJ1x2vpwG0j7Ij7LizRa8IUEVvtsMlPVJd+kJtxia+KJjgQdG9m+qbKjl31e6oHxnWbnjIPQvUZOlX5YgLfA5sdlWXQPLxarc1HE788GWiN0INBAlLEhAUWwTuX8wEtRF5mN5Z55lloY36AFnBgKdK/fiI0a0Iu18smY8crVrMS/VltdfFLHHYwSwcWJ+T+NjGg6g/Y8+O1CPeJk7lHm5RJnJws1Q/yWcaYQO/V8AY7nUhIpvrJxtv5Jf57pc0OSzibj/xcVwK+CM/PYPnfTLsOKs4hpIrxlijrF9WaCI4LZDt6rAgYr46U/Fo+zsuH1WhoCoDah5U6VbuU2d+JYdr71Hhl5L+x8bPwN7l7EWbJt+bXFeIAyLq69r0aakfIL5oKk9mXBj+g4I0fXpDPA/E467sjM5NNxFDrNCQyrEuCScr6mecoqRVPUUJVqsAv2J9CKbZaXs2CQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(82310400026)(36860700016)(10067099003)(56012099006)(11063799006)(261026121527099003)(261021123027099003)(261021121427099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ATPKTV963DUmzdNleMeRCelvWz7xIaC6w+dtp9krCSNHnlJD7kSqTH801nDlWXk9rooOl1FdJuX/1scUb8AZ7gjjs0H6S5dUVhIKfGakAnflkg8OcP2ZLOuQdIwtNikzXz2t+WAf5/j03ZbrLrLMIFjevlV/5IA6Unv3WLaUefdMnFnVCmCgJWf4pWGB7PhVU2y83pgNtmq2eq0VHjkt/WTAVgE+sJd6AGwMTNJtBUHTA+UyfAcJRYNtFOlnxddCXBrV3vidqEn392oRhyjKMTZ9vixN+i2C5TltV9kqyOccgU204IxAaglFi2zE2oPVOfiWyiuUemv3w64YRRAy8pIBcseW2S+rDXOaxidEVbzmcapZW3kjwddXlVwSTyUpVUNyagJ34IMVZ5Rotn5d7w45/yE39LVabgZ+biSJzDAWFTF1ZFO/jU3/liyLgdqP
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 07:10:34.6671
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f865af8-00c5-4b54-b5a4-08df4479dfd9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000149.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LY0PR12MB461782

ACP 7.0/7.1/7.2 hardware requires SCHMEN control and
output-enable (OE) registers to be programmed as part of the pad enable
sequence, in addition to the existing keeper and pulldown writes.

Update amd_enable_sdw_pads() to program ACP_PAD_SCHMEN_CTRL and
ACP_PAD_DISABLE_OE_CTRL for active pads. Pass acp_rev to
amd_enable_sdw_pads() and restrict these writes to ACP 7.0/7.1/7.2;
ACP 6.3 is unaffected.

Define per-register masks in amd_init.h replacing generic local defines
in amd_init.c.

amd_enable_sdw_pads() targets ACP6.3/7.0/7.1/7.2 only. The default
-EINVAL prevents applying this pad sequence to unsupported ACP revisions.

Fixes: 2c0ae8ef1e5e ("soundwire: amd: add support for ACP7.0 & ACP7.1 platforms")
Fixes: 34b1cb4ec286 ("soundwire: amd: Add support for acp7.2 platform")
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_init.c | 54 ++++++++++++++++++++++++------------
 drivers/soundwire/amd_init.h | 15 ++++++++++
 2 files changed, 51 insertions(+), 18 deletions(-)

diff --git a/drivers/soundwire/amd_init.c b/drivers/soundwire/amd_init.c
index b4f45bdf3c17..8019a4faeae5 100644
--- a/drivers/soundwire/amd_init.c
+++ b/drivers/soundwire/amd_init.c
@@ -16,37 +16,55 @@
 
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
+	bool needs_schmen_oe;
+
+	switch (acp_rev) {
+	case ACP70_PCI_REV_ID:
+	case ACP71_PCI_REV_ID:
+	case ACP72_PCI_REV_ID:
+		needs_schmen_oe = true;
+		break;
+	case ACP63_PCI_REV_ID:
+		needs_schmen_oe = false;
+		break;
+	default:
+		dev_err(dev, "unsupported ACP revision 0x%x\n", acp_rev);
+		return -EINVAL;
+	}
 
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
+	if (needs_schmen_oe) {
+		amd_updatel(mmio, ACP_PAD_SCHMEN_CTRL, pad_schmen_mask, pad_schmen_mask);
+		amd_updatel(mmio, ACP_PAD_DISABLE_OE_CTRL, pad_oe_mask, 0);
+	}
 
 	return 0;
 }
@@ -86,7 +104,7 @@ static struct sdw_amd_ctx *sdw_amd_probe_controller(struct sdw_amd_res *res)
 
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

