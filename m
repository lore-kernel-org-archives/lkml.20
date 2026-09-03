Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010063.outbound.protection.outlook.com [52.101.85.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E36654E56DC
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 15:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788450223; cv=fail; b=faEP91/rcCvQUwQJmX/TgKDHgJZjioIJpJHLDoSAtH3/udpVrEJ3Thb8DXPvPTCrTFeiR94IT6YaKGPBFLieh5S0Z7u70WgjxCzBBiGaUDHLdNxynRgNKR2+Tmkk1rJFZkG4CAChsX341m1YDp59LQ9meu3q/UuHTmJQ+PDb6Wk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788450223; c=relaxed/simple;
	bh=ZIIz29TG67LQqa2vbzihhKnyt+xeoZG8MIof08qoeLs=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=phxBsQhPNAo4EPu7Sy/3zhbHtvq/KJSGDqTk0nbVHNDcbm3GmzVAu+EqYFRf3SdpexE4+8zfle8lSZSTiKnEY4Or9ZS80uh7hsFwopzZuOGJ/Zcs9+HJyM2NESlkJUGIeMkajMxnG+zOLbBJMZpcKm+3LEn8Xy9yExV77QVsGeE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=J6ggdML5; arc=fail smtp.client-ip=52.101.85.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="J6ggdML5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W70gljkxyfXmBGlOEe9DBepkwTdjvXe4xPwE5jCZj95V5ulbbcD+z6WR2oP1ErzHGO0z6hNo3PD8Af7fx9ywNIu54tgmonWp4c9EHdKaT5wFA7Er5oMWP8x9JFVKC4LQuV63B96iMana9QjXFnI4Obbq9J0scmdlr+umHHHPhAUpRD7Jc6FgjsdgDT8DCHBzUlZolhJYo2iJpqEm6rVvNnF06thJdH4kWBMaZCUlyLk68hOexNl6lOoDxWnXtXCQwkHb3hMA9/254NBVEWaLVLI0TmCT+XBjixcpfIkjEhQAg/E3+s86RnpZdfvRKxInDufCTRD8RgrQnhs5ztmg9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uAluWNCZkz3R2t9nBMhEo2o8aJU/oope6mtOP93Luto=;
 b=EuELIQIDX8cxuTQfhhBdEfFbaoVzuYoUDWU/4Q4LaD+HDXmrBTtPRTUaLWk/L2gkeSwmWRmfdwclHcEiOXQBGQUDKm41qLLjetXGqFgznCQXpo+CRMm3DFXkCVabOwG/SLOmpbL3lcpsSwuVjbE5PP8Hn8ILxuyndm1TvYcrmoBoEb16XMkNw2NBlo+qSEjuTUDQ4TK2+0uRbZyCYn0kRLjXcMx0c/WLdjqoS1h2F8Tupk645tDo1aNvl7HhlluRMu7gDZrcKuku8KGTzc+awpLaZJl/XEFwJFeHsVnqpQ8xnQVURTrvWBgalK00/gwXvTJxnUo6bYARxQwSk1xcpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uAluWNCZkz3R2t9nBMhEo2o8aJU/oope6mtOP93Luto=;
 b=J6ggdML5MB3myJ/l1n7rRwE2AjRy2snw6WUzelTt8Kkzn0noPEYbChENnIoWlbeaNySfajyblHYSI8bpeyWzc4Be3gUlHX9JqNbHFyTqkljYXbOjuKcRu4K2h3k1PHn1CRahIKKcjYfJK3rxT0kpmqp/1IauyIjfAY+Gd8zmJFs=
Received: from PH7P221CA0063.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:328::11)
 by MW4PR12MB5604.namprd12.prod.outlook.com (2603:10b6:303:18d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 15:43:37 +0000
Received: from BY1PEPF000264B0.namprd02.prod.outlook.com
 (2603:10b6:510:328:cafe::3f) by PH7P221CA0063.outlook.office365.com
 (2603:10b6:510:328::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.12 via Frontend Transport; Thu, 3
 Sep 2026 15:43:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BY1PEPF000264B0.mail.protection.outlook.com (10.167.242.119) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Thu, 3 Sep 2026 15:43:36 +0000
Received: from quartz-7b1chost.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 3 Sep
 2026 10:43:35 -0500
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: <x86@kernel.org>
CC: <linux-kernel@vger.kernel.org>, Yazen Ghannam <yazen.ghannam@amd.com>
Subject: [PATCH v2] x86/amd_node: Fix PCI device reference counting in amd_smn_init()
Date: Thu, 3 Sep 2026 10:43:25 -0500
Message-ID: <20260903154325.74343-1-yazen.ghannam@amd.com>
X-Mailer: git-send-email 2.43.0
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
X-MS-TrafficTypeDiagnostic: BY1PEPF000264B0:EE_|MW4PR12MB5604:EE_
X-MS-Office365-Filtering-Correlation-Id: 25275acb-9477-492a-34ad-08df09d21e95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|23010399003|376014|18002099003|13003099007|56012099006|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	XAvGtYsCtTvyBTXrSoKUSC8iTRL3SGWj7Qp+F8UEqinVV+IHb3o8vZ+xVMHcKzGDdJcu2P/dX7Cua59yTlo+5nyKmUxaUY6hUXBa9uzaJn0il5j/9ondm/SoHqbcLQuIWzY6qtH2EV7WyAOawQ1Ks1o+Vc6W+23eq6qsqhJAHZZ74UQuX11D6RNHZlpVSAhk+NvDfWkLwxQk8baPoHVxqXf1a3Mj49TOzkICQTTwXMiT0VPEbDoW7fD+tb3Envw0cfXaFAzXz5iXHSpMigjV9d1S72286R2/c9TLd9oTFuDPiCXQPRXZWdHxcFCLsBER2fKXb4SWEJzEvcyo6e5S18hKwaP61vfGRuE8yZrFOGDlt0W7G+uIJjbulYXb3vdbKWcg9npbqjav6nWKDyofon5I3jpYYuTWaqFsVgCArZXbLpyEosahFBI1S13dNL/4TQc7dSedyG+AjH4afGFDgpkQyfSvdobgguNml/WLCdkrq/O+6c8wOLEUfZaFHkBx/eWNtsRE6q97pvECqclYVrBttfye+C+VXryP+zS+mfKIq04V/SD6FFuw369FDL4uBKk15vO72td/HJHi5WUFuWRxEYK1uGqw7cvj5G3ewT3uWnQ1La6bxCS6wgifHG+GfDOySCu9CNrSIAUvjrUSBA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(23010399003)(376014)(18002099003)(13003099007)(56012099006)(10067099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	HU/jbxV78+Socy+84oqsJc+QpwESWk5tD/hHOMfm471qddOeAsSYPDddgW2feOUP2zkx38N+rHMVBSbNAh1PKyDacV+SQrAtxotv9nGFSt/ZyC1u4VTBqc2uPb4xbSZaA7K5gRkne+sCFIQKlb/pAgAxF0t5iaWNyoryO673myMFNNWS2jCguD6llyBm9NrRpkxWaxo7mfctz4REqqlwM71548XyPMNjECsD4LfeIV1kCl9Uw2NhxOTpsLkjLREqMTL3f66S6s9SRpDDMA6dHHgmWQnbx6ZxbtuAC6MosIQHMgGKxixkKAxXvnmHm1hz4qzDkuK5T2uLjRFUdj5TpRLqmfui/22L1yQMiCmc28mpIU5cguEeN1Y0FuhuWVJeJK1vzUrdHjWREL+tSX9saR8m5QAmWN1UfWFaSOvi+X3kJgrf9ZrC1OjM925HI3ZU
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 15:43:36.9513
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 25275acb-9477-492a-34ad-08df09d21e95
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF000264B0.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5604

The local "root" pointer is a temporary variable used during the device
search. Therefore, refcount related to the search iterators should be
cleaned up after the search is complete.

Use the __free() cleanup macro to ensure the refcount is decremented
when the temporary pointer goes out of scope.

Additionally, increment the refcount when caching a root pointer. This
ensures the in-use refcount is separate from the temporary search
refcounting.

Finally, drop the redundant "root = NULL" before the second search
loop. The pci_get_class() iterator always decrements the refcount of
its "from" argument, so the first loop can only fall through with
"root" already NULL.

Fixes: 0a4b61d9c2e4 ("x86/amd_node: Fix AMD root device caching")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/patchset/20260806160159.230453-1-jason.andryuk%40amd.com
Assisted-by: Claude-Code:claude-opus-5
Signed-off-by: Yazen Ghannam <yazen.ghannam@amd.com>
Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
---
Link:
https://lore.kernel.org/r/20260824175003.335196-1-yazen.ghannam@amd.com

v1->v2:
* Add SoB from Mario.
* Remove redundant pointer reset.

 arch/x86/kernel/amd_node.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kernel/amd_node.c b/arch/x86/kernel/amd_node.c
index 762585775b5a..b7926ba3610a 100644
--- a/arch/x86/kernel/amd_node.c
+++ b/arch/x86/kernel/amd_node.c
@@ -251,7 +251,7 @@ __setup("amd_smn_debugfs_enable", amd_smn_enable_dfs);
 static int __init amd_smn_init(void)
 {
 	u16 count, num_roots, roots_per_node, node, num_nodes;
-	struct pci_dev *root;
+	struct pci_dev *root __free(pci_dev_put) = NULL;
 
 	if (!cpu_feature_enabled(X86_FEATURE_ZEN))
 		return 0;
@@ -262,7 +262,6 @@ static int __init amd_smn_init(void)
 		return 0;
 
 	num_roots = 0;
-	root = NULL;
 	while ((root = get_next_root(root))) {
 		pci_dbg(root, "Reserving PCI config space\n");
 
@@ -299,14 +298,13 @@ static int __init amd_smn_init(void)
 
 	count = 0;
 	node = 0;
-	root = NULL;
 	while (node < num_nodes && (root = get_next_root(root))) {
 		/* Use one root for each node and skip the rest. */
 		if (count++ % roots_per_node)
 			continue;
 
 		pci_dbg(root, "is root for AMD node %u\n", node);
-		amd_roots[node++] = root;
+		amd_roots[node++] = pci_dev_get(root);
 	}
 
 	if (enable_dfs) {

base-commit: 7755fae2ea370ee914797c5bcca922836a818c3d
-- 
2.43.0

