Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010003.outbound.protection.outlook.com [52.101.193.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23D8649D5A3;
	Tue,  6 Oct 2026 16:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791305914; cv=fail; b=rHnlwA2MLwAB2JM24hzUl58EGYZH65D9MX/bVUY6KE1BTtf408Zvq5asxduGdMZIhitnwS433iMlZvvHmMJMgBkJn0q+dmoIPq1W+EeUdgK9zIEHHVtjCJdJG/dj8UV8FLiBJyhmko2Yqv6j+hIbdnerxBDjJEnlM1lMc3WstWE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791305914; c=relaxed/simple;
	bh=YARZoLIMp9NQFm/yACFiLymBOnZqEzcJpX2ykP+U/6I=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=SUWezzz9hdRw/MXTzgKGGWOv4kk5D+yak4ASbiC5q6FwfPl8vjQYWDlucm2YKLFCx5xmz7UO+HA4EENB4PJMcMgR3LDopPBKTypUKJ6cWnmhOTSfPRGfW2e7307NmdxEVxnVG/v1ABWJZ9pKxbnOb1SGO2/da/trMxXXTZCKlfU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=1VVac5HE; arc=fail smtp.client-ip=52.101.193.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="1VVac5HE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OHC1K01gE0QiLoJEkJaGQyQtxd35B/54qMdFmf4hQtQX+ashfWk+BhYrILRATxz1RT7lYXiHWuhxwHFqm+KsRt1U/lVMiuOQgOfgi2jFFc96lrIzt2YY0PBiH4pmaQXDr9P3LykxrB7EwraMw5od0zS1pm/7Cn7H0EuJWPZ5kPX8jrCuSpNmDLqXXz9mvga2IafWG9q1fNkWminoV/9pRNErXBG7nN4rfSwSAd6nKlzkNXF17Y2iLYuw+dMRYDRzxBcKlQp4Zv0TQg+Ti1G79LSHf3XracQyLBTTD9v2D3+AOZLP7awBUblcn4KradF3tMpq9LpjSbg/lix7b5L/5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OCAplye2Tuhr9siY/YXxmAkWe3IcIBMUfOCK5y0esN4=;
 b=CHEBNDSNb4a5daJ0BVJ98+d5KE+uP3cLDhth/0AJ7K/e6AXhDZR5AfA+IcEQMXWWB0bVp37W5lMjdHn6Jnqs6EpykS4Oo/0Ro8CtC2fdQn/Dao3lkAsVtIyXAElSyfNd+H/6GA4y5SHOM4vsbMmWCHAQ7bPN0ikq0WOnUXCmKXtmsvV1tHmBzGI47QqA+KncIvlcWTOBwkTTful6Skw79rF29uRWpoBFFybjhuONJHfYG2db4KDflAMKIurO4GfsY1yWWVPoFMZs3izzdJYAJTAuDLpeSeVnVrH3sJI0JolqgRM7pjsSaq4x4hzB8lMC+xHE/Vx3a1c274ojm94NQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=alien8.de smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OCAplye2Tuhr9siY/YXxmAkWe3IcIBMUfOCK5y0esN4=;
 b=1VVac5HEQjtV4MDI9vSvx3CX6KUotUIknD06GW+kYrODTWf1rNPme3upiImi0qB+m1RuehHoIXrlmHuL24tXN3DPIaYrKkXhTXD8GCU9VanpPR7P3rAWwdjAjLU47KyyeSZGOL8Z+U0pQRayakEctE1hhDIXd+2WaGuxKvSzUp8=
Received: from PH8P222CA0016.NAMP222.PROD.OUTLOOK.COM (2603:10b6:510:2d7::26)
 by LVUPR12MB999137.namprd12.prod.outlook.com (2603:10b6:408:39e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Tue, 6 Oct
 2026 16:58:25 +0000
Received: from BY1PEPF000264AF.namprd02.prod.outlook.com
 (2603:10b6:510:2d7:cafe::89) by PH8P222CA0016.outlook.office365.com
 (2603:10b6:510:2d7::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.21 via Frontend Transport; Tue, 6
 Oct 2026 16:58:23 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BY1PEPF000264AF.mail.protection.outlook.com (10.167.242.116) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.14 via Frontend Transport; Tue, 6 Oct 2026 16:58:23 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Tue, 6 Oct
 2026 11:57:55 -0500
From: Vishal Badole <Vishal.Badole@amd.com>
To: <bp@alien8.de>, <yazen.ghannam@amd.com>, <tony.luck@intel.com>,
	<linux-edac@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Vishal Badole <Vishal.Badole@amd.com>
Subject: [PATCH] EDAC/amd64: Consolidate Family 1Ah model setup
Date: Tue, 6 Oct 2026 22:27:34 +0530
Message-ID: <20261006165734.671061-1-Vishal.Badole@amd.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-TrafficTypeDiagnostic: BY1PEPF000264AF:EE_|LVUPR12MB999137:EE_
X-MS-Office365-Filtering-Correlation-Id: a243d389-598a-4092-89e9-08df23cb0849
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|376014|36860700016|1800799024|10067099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	E+c03/Ahv+k7slhj1Vj5JsDD1ZrtoYVIRt9FL1A5esehphBFgOes6mVNXQXcRphwJlYkqosIxIpbNQZclKwQHjPgnC+Pi/Iijs5Q1daDg7BZVRbMUmAaPfsTTas0D/V85fodFT5wxbSXSotN/iFzD24IzdgxvmercmROOV3Hhn6e8/DVZI0ZvMeRh8D5LXRAGMRYRj0z8s5/KW7MaA24R+EXNXahzlD8I/WVpbbqMIOWnuagB6+N1TbyzdbAnVdiXCkiIvTdxJGlDE6whQCytPJs74Me9Soa53LYISmNWAl8YJd8mK8uU+b5WUtZSPReUTKCCtRDFhpONVM4mh/gRqKAriwWFVtoZEwuk1y648L9RvlsDk1lPjJGMVHGtFNZfY2UX1LAcmusg/J9PeeLI81EOQazmk8raBQLEjuNAg4NlLuQ67ASZX8MGmZPjb92b076Q/JGbsH6AM7xYbChB1rMEONLGjMsB0tL97VG4fKGO7d3Jb52FkjvxWLFOUqx0i4HqxOhJiNFSSNxqG8MVb365YuxPym7y5rNWBYkIVrBSeKxjBy1L9LzRRhzIdZOQNvgx5GhEpZCiwLk921+FAScBQ/5yEwvaglQiw2OUGbI5mTrhN/nY+TebvwyJNfQuy4eSnol4aph0B2+TTf/LO5AKuhBCCzKHCleYjgdtc5aT59eoL8HNi/IyWNr4kMQkA6SGfFM9asmjiPxURJ3iQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(376014)(36860700016)(1800799024)(10067099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	UTW4J6akfxvh8CIhmAl9FEamk+jXVvkcFzCzVjh60lO3AaMq6QsuTVWSnOZrZ9PwmJZqWYTqTMEiDV4lTWziHMV0OGn/UusbjZ/8/ppRVZKfqKknD2dCCwRsGWajvsyuJHXrISqxLH2otXQNdo75sYAXf0+M11oACv6GRhk+Efri3U5D+gudeFkZbLMXVXKvppI9AXK7gKlRjwp1Pgb7Oao5ydTFzZJ3uLh9yi8UvD3yh17LyPS0irCH2kSkr5Qvx7sUZXgIjHpbkby9nbTmpwI8dnwSSPY7p2ipDiXH+iBahFuDWgJhqm2UPd/Iz8DXe9UsReM20Uj2o8P/SyhV1UFNadbrWft82Yxe4Mkqy/RsoDg9jjwTtmFfSUm7xbZuwgx8aB09EHb1p6avUVkAuMAoSQm3Tj/0lN2x/po1MQQZ1F9QUmYd23M1cO+ZV5cl
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2026 16:58:23.3010
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a243d389-598a-4092-89e9-08df23cb0849
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF000264AF.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVUPR12MB999137

Every Family 1Ah model uses the v2 UMC register layout, and the driver
must select it to decode memory errors correctly.

So far each model had to select this itself. That is easy to forget when
a new model is added, and a single missed flag quietly breaks error
decoding. The driver also had no check for unknown models, so it would
load on parts that were never tested and look supported when they are
not.

Handle the layout once for the whole family so no model can miss it, and
do not load on models that are not known to work. Also add support for
the 0x88 ... 0x8f models.

Suggested-by: Yazen Ghannam <yazen.ghannam@amd.com>
Signed-off-by: Vishal Badole <Vishal.Badole@amd.com>
---
 drivers/edac/amd64_edac.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/edac/amd64_edac.c b/drivers/edac/amd64_edac.c
index 0c0d11c72925..21ce1caa7151 100644
--- a/drivers/edac/amd64_edac.c
+++ b/drivers/edac/amd64_edac.c
@@ -3887,24 +3887,25 @@ static int per_family_init(struct amd64_pvt *pvt)
 		break;
 
 	case 0x1A:
+		pvt->flags.zn_regs_v2   = 1;
+
 		switch (pvt->model) {
 		case 0x00 ... 0x1f:
 			pvt->max_mcs            = 12;
-			pvt->flags.zn_regs_v2   = 1;
 			break;
 		case 0x40 ... 0x4f:
-			pvt->flags.zn_regs_v2   = 1;
+		case 0x88 ... 0x8f:
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
+		default:
+			return -ENODEV;
 		}
 		break;
 
-- 
2.34.1

