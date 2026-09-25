Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013043.outbound.protection.outlook.com [40.93.201.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDF263E51E8;
	Fri, 25 Sep 2026 17:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790357241; cv=fail; b=Eg0bcPvijmaeJcpDGM6PtFSIPx7iPycOpGwyU+6OJVXG0CRcFCvYqpDFdb4hP1sPLUeLuE9AbOQFT3dY5E/FEFs0DwDGHW08qAuIxCcC9D4aoeO3uvSRw/y6L9XY0mDU5Jooe1gDS1gpSrkTrsI/QbD1vd1rFK8C8F5G+6MDOjU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790357241; c=relaxed/simple;
	bh=Qzky46ZJrHnUdpvDVodyfalsY1usKhwK7lfMGE8WOvM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=t2dxMZxsSZiwQ0gyEf26IO/snpDcXjYp17SJZp9H/0RwCUkdkx0/6dpC1CHLGxzdZig3spGGSxpbnj6kbHeldOtw8Za9BlPDoNDjNk6QT8Z+rAbKTeCtXp4tclan2DT9m9PxoJc5B6dzhzlTpkI9eEAW06fOzb6WHtMQIhkvTS0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=oW18iB4+; arc=fail smtp.client-ip=40.93.201.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="oW18iB4+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PnlxKvwr8RI6fzfAFeyBPR2rXalKqLQB7zrGj4fJRbzlwcIn2HTbQGyLdk6KoXYn26bmIawd0ogibaq7ErbDbXKcth5YT27XJioW25qoGOf5mhHpg3GZchTn5gZtOE4HNpB9dP+SL7q4YKTKLkXWHSb+J/ScQ1ZDKtVao0KFFk4Nh58VcADNf+Ol6rRrNYKkg7nKiujtYMzeqOhgqOnZDJQgNTe8T335YYqwBizFZdkgmmLsPkFu8EpQsBfdZ0/06khsI0PyUyNO2vAk95aTGGNgnNoX9L1IDSNzuDP/53HNJSHxA4pV+DT3kiFIq2w895yU4fhSRLGa8pFqMOkzcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2CJmekds2kx4d/T7fHrAQRGRs6NoJSOOUKfQNflMWaE=;
 b=Sl7e7KC099NFDcr3/C/hi/rQrRPjj9nmlFjUC/miHnYFFYv4+Wr84MsqfDCobAe0u9m30YxT3JJ439pAPgugyTJqerBOPec0bohi044gDLSH54wUe7xjLyS9UBnHad5MROPDkBGzmil9kt/gCYP2oXStWDsy/YOJbw4ZTOFuke1x6UxlvcZUlQGSwcBpy4+MUEc3AslpbPH5frx8/kG6Ll6J67p6JVkQYq9rNTojHpHf5VlqvSb1R72RUgWJrBovdsbiUKkI9UtSM1y+slzF2mVFeoH4ZDwk7P/6tZZDrsO5Og2mu+ahH+Ehy4D/2A6e9S4XuPeRGSfc7Jfz5jH4bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=alien8.de smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2CJmekds2kx4d/T7fHrAQRGRs6NoJSOOUKfQNflMWaE=;
 b=oW18iB4+3zRqSJNvgZQj4gJI23BJMCAj8e3hpiL6QqbggY/rxMkFrzpkAbo07cU7s+4EleWlTCzRhmmQTA7eX7DDdDLJ9lMF51eOd36XueX2+zy8CWZWyu/4PRB9Yp4op0HWQcINocGt6Q1WtRS77u6iYODkxp6qbGls2PETyUM=
Received: from CP3P284CA0051.BRAP284.PROD.OUTLOOK.COM (2603:10d6:103:6d::26)
 by DS4PR12MB999077.namprd12.prod.outlook.com (2603:10b6:8:2f9::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.19; Fri, 25 Sep
 2026 17:27:16 +0000
Received: from BN1PEPF0000468D.namprd05.prod.outlook.com
 (2603:10d6:103:6d:cafe::8f) by CP3P284CA0051.outlook.office365.com
 (2603:10d6:103:6d::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.18 via Frontend Transport; Fri,
 25 Sep 2026 17:27:13 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF0000468D.mail.protection.outlook.com (10.167.243.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Fri, 25 Sep 2026 17:27:13 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Fri, 25 Sep
 2026 12:27:07 -0500
From: Vishal Badole <Vishal.Badole@amd.com>
To: <bp@alien8.de>, <yazen.ghannam@amd.com>, <tony.luck@intel.com>,
	<linux-edac@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Vishal Badole <Vishal.Badole@amd.com>
Subject: [PATCH 1/2] EDAC/amd64: Set zn_regs_v2 for all Family 1Ah models
Date: Fri, 25 Sep 2026 22:56:38 +0530
Message-ID: <20260925172639.97063-2-Vishal.Badole@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260925172639.97063-1-Vishal.Badole@amd.com>
References: <20260925172639.97063-1-Vishal.Badole@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468D:EE_|DS4PR12MB999077:EE_
X-MS-Office365-Filtering-Correlation-Id: b01fc746-4b6a-4aff-6648-08df1b2a3cd2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|23010399003|36860700016|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	FM6nPPfQCfPeirktxLYTiK031StsW36CqbuOQnmX7b/Ol7LbObiJnSoRwbDizuYuyg3b8IVBTNIQ66Oy96AE49tZDTG+EPKpvHCnBptNmlkH1iK3yXmQh/dmjk9x0IzdALGo9H99Ptvc1jwMDCOXeJ1Xg4f9sAVIYTskRQCaZw4ie17xyD38KqS88ITuzfu0PwZT1yikw/0GA/7ayTqo5MMY/sQtDHtTtJsHO5gtahwXsX3DDK/F0ghZbdHa31lUVUqH6Tfd8SdKWr7l52gyPV4jUgBHWBWr3of4mo369SPs5YRJBgVOitIJrC/v90BRTxbZu3CMZVHRYXKtqANS4zdE0Bh/Q0MeYXhDl3d1HUzl3pMthCjKkBHW+FcsAFJ5f+9FIz+SSh5m/qrkh+BuRe0U0JYuIPAtqsVfhXO2Jdgbhxofb1eEgDqFD/tMHI/bEFyoh+n5VBlUAw5EcdKAuzko0gwuxUKQKbazf/mzjaXEiSyzuEMES0Lco+wTYCXmIGY0fw8NeI5wmwtZh/QB1EDRTDf86af5mq6rPbr+JTiPye72bPKLCNA0Vrpk28iITlviTEU0FJ47lhdb8EiELUg5A0MGcAaVi2fDeRe9MLNyhFGKxNUB2ocUq8ufXyEcBJ1u03Q/ParOKZoPFV/EbD2gKLHi80Cb1C7U4+uRP6er/pwq67z/bF0PbTGUcuU1mxrqPhriFoU2noKImycskg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(23010399003)(36860700016)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	v3UCVOxiVj+//dKZ+Z41vX77NkTSsB6NIX8MbRnant8XCfSDknaajtbxtcLnmyILZLZvevGOXciK7cm1YczSSMBS8+ymd38TD/cg6XffHkPR0B5pqQMM1sXN+F/Ij7bX7jb4LjUdtXUXbARJT1tt1Nkn10BkaLa2pCD/GxiRZ6+9cHLYKW7G/bh16GniGB/9JzbVNVFuyiBx3nC1xGz0RbjMjiHvcznL0F+syccfRfLfIitdoj7xa8dP4ckdrka8wYOuUYa84w2CI9IIejRH7BF72lLtyb42xreekqKM2gyMR/EEf2GFvxIoAkP6CKQJsr0/13t8TTiZNN0jsFM1XydBNIHuj+uf2h2o8IazXwToHU9J1jFZHcqnix0V3R9pcrtjSA0oA5CWOg071o5idCOXdwiOisPXP+8J64YoeEuGe7vz06fVX9xQcnETLgpU
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2026 17:27:13.2458
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b01fc746-4b6a-4aff-6648-08df1b2a3cd2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF0000468D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB999077

The v2 register layout applies to every Family 1Ah model, but
zn_regs_v2 is set individually in each model case of the switch. All
currently supported models set it, so this is not a live bug; however a
model added later without its own case, or in a case that omits the
assignment, would read the UMC registers at the wrong offsets.

Set zn_regs_v2 once at the Family 1Ah level so it applies to all models
uniformly, and drop the per-model assignments.

No functional change intended.

Suggested-by: Yazen Ghannam <yazen.ghannam@amd.com>
Signed-off-by: Vishal Badole <Vishal.Badole@amd.com>
---
 drivers/edac/amd64_edac.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/edac/amd64_edac.c b/drivers/edac/amd64_edac.c
index 475235c402e8..cab696be4f07 100644
--- a/drivers/edac/amd64_edac.c
+++ b/drivers/edac/amd64_edac.c
@@ -3887,23 +3887,19 @@ static int per_family_init(struct amd64_pvt *pvt)
 		break;
 
 	case 0x1A:
+		pvt->flags.zn_regs_v2   = 1;
+
 		switch (pvt->model) {
 		case 0x00 ... 0x1f:
 			pvt->max_mcs            = 12;
-			pvt->flags.zn_regs_v2   = 1;
-			break;
-		case 0x40 ... 0x4f:
-			pvt->flags.zn_regs_v2   = 1;
 			break;
 		case 0x50 ... 0x57:
 		case 0xc0 ... 0xc7:
 			pvt->max_mcs            = 16;
-			pvt->flags.zn_regs_v2   = 1;
 			break;
 		case 0x90 ... 0x9f:
 		case 0xa0 ... 0xaf:
 			pvt->max_mcs            = 8;
-			pvt->flags.zn_regs_v2   = 1;
 			break;
 		}
 		break;
-- 
2.34.1

