Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013053.outbound.protection.outlook.com [40.107.201.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEA8B38736F
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 18:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789928297; cv=fail; b=ey90Rlu/DKkKNI/7GKcM5x+xPjg9Vmjb/ZMoQNghcOtkJA802JK4plocndK94anUVbE+4EA/Bk9aN9c8dIVgIbvujiNA8I9xTGugLIB+9uKGNVP29bhDAsYOUBdSu/C/wxd0+Cy9Y2wb44teNefoPnmLaaz1jWPM0JZU8UXo1y0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789928297; c=relaxed/simple;
	bh=JpZQr4rQ5aBBWX6vatPmpDx2eAHfo5G729GfeexYazk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W5SYf6Iw17OyR4IqPQQ5zPdVCo4ZcQT2vENj5bEcQqZCdVSH6VWbdidRIIxgFZ2kacXUH7B1udX8Jg6WSKZOfcIgJzqI+6ui82CvZ8FDqukdbT0gWxaug4Q4N9L0M784VqvW376z9CMOiqllQIKdsFVaPMFPU2AvE4+PQB6PhME=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=tpIGLFd+; arc=fail smtp.client-ip=40.107.201.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="tpIGLFd+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mQU2tIhFZkiq6D4qimPYdKb5YcM6HuGckZ0tvQyBjDD8Sy1DGZRR5/H0w6Y5SyMlfas8meOEEVpnYIPO4YRwnp6YtBI154KfEU1Vnz3dXQxak3Kr/P9Ce64E9Bqfl9qOgTof7IQ8wmlAf4KptTsB4RL/E1JAU1n7xOmL3Be6CbZwPbtPDhapo0k/IOxS4s8I7iqbX3GIPJimx2Jgg1sAc5MOmDItD/Ablolz2bBzL1z1fTNt4zQ3UqHa1L7t5TTEPxE0Ff5ZAKx/4KKZrsujkAqlxVaFhzvBET/yg2XCfF6iRJFXatP/Wucgf3FSCtU+V6Gm/HU+HfQW44WnM0IYVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tOLgYwGo2mHOTT6dlmLIvEYxYMN5F9UA2Wsy6fk55Dg=;
 b=nWu/YO3jRVTYRm+1IpeDSYW2cbnJdAtPyqi3Hw2VtU2ppitWhnURW5XOACY6RtTK/wLFthsY4SQUvfBczEK08n8Z5AC/R4tlUVwE9XIhsbsrGwGqnp63LwQCTogL7h9YZgUgcQSYFNJJctyac8nx5dRoWRIFUMTzt0NMLjhrSXVzUDyZQxVfhaqW5s9Hhgz7AqNMo2SJeC1mffDlcpL5Bj0fb6qNxpDSlCN1Xg2Ky2lM8IS4JHghmcf7k1m6auIePiwPD3zYZxyQEnSJXd9qmXiZPb5KfkrGnsxxLhoFblYZxXWtROslpXTpdDWnU1NKWyPmMJOnHTYCaMLue6p6Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tOLgYwGo2mHOTT6dlmLIvEYxYMN5F9UA2Wsy6fk55Dg=;
 b=tpIGLFd+ImwGJhvQObCp/ICzccq7IPQuOmQ2qNYQ+Els30bpfA1PZx84NZfwa9PL1U4zUMqLwSsAyO0RpZwEaLeUisPJMMKEi/K6pvw4Z56cMdmmx2+03Amon3HWx6/ISq0E7GV/FiQjLFA6aPRK1CR8EHVihU2zJD8NQh6fqOo=
Received: from BN0PR03CA0009.namprd03.prod.outlook.com (2603:10b6:408:e6::14)
 by SJ0PR12MB6783.namprd12.prod.outlook.com (2603:10b6:a03:44e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Sun, 20 Sep
 2026 18:18:11 +0000
Received: from BN7PEPF0000009F.namprd04.prod.outlook.com
 (2603:10b6:408:e6:cafe::a6) by BN0PR03CA0009.outlook.office365.com
 (2603:10b6:408:e6::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.16 via Frontend Transport; Sun,
 20 Sep 2026 18:18:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN7PEPF0000009F.mail.protection.outlook.com (10.167.248.151) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Sun, 20 Sep 2026 18:18:09 +0000
Received: from purico-9dcchost.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Sun, 20 Sep
 2026 13:18:09 -0500
From: Melody Wang <huibo.wang@amd.com>
To: <x86@kernel.org>
CC: LKML <linux-kernel@vger.kernel.org>, Tom Lendacky
	<thomas.lendacky@amd.com>, <ardb@kernel.org>, Melody Wang
	<huibo.wang@amd.com>
Subject: [PATCH v3 5/8] x86/sev: Add a function to contain all SEV-specific setup operations
Date: Sun, 20 Sep 2026 18:16:57 +0000
Message-ID: <8d0e7aaeb41a09bf30cabd1d6e36f43fdd0edc9c.1789927246.git.huibo.wang@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1789927246.git.huibo.wang@amd.com>
References: <cover.1789927246.git.huibo.wang@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PEPF0000009F:EE_|SJ0PR12MB6783:EE_
X-MS-Office365-Filtering-Correlation-Id: 7715969e-3ddd-4da3-bb14-08df174386a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|23010399003|1800799024|36860700016|22082099003|18002099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	DzQNXtb7i77Lph9MHH6zL41Y47mBomGjxBdpgE2LFKLCQ268kp3DT92Avc3z8Jf8RfdhFBpRyGcQw9p7xuoWqPivhUuwfCfIXVjN9ruNTPn8GJj3SWp4QsA0X+y5XkOhy7e/25NWkwoYfL4Gw9tUTyHQo+eowyvNxTbEkobphO20XSOR/exORGfggpWwMD3UXKaegW7C/qpGShxbdALnaWKDniaJcVTZRDROwlIkffElUJ4HugCdZ58+a9LoHi0gLYIL4ve3U5W2vlbQOSXYd0abibGFhPuMj2flBOc5VoFmEwZazMYNaONtlNHXr9K4RjGiAgIImB/Yb2Qy4T+4xgxNqEHpTF1Tgi5MmAKisHA/WbXKSxSBFUXIoKiWSI8Jdf6BxmOSOBq0q0KwYsX5Ai//LP0grAqXJb0jBVh95oqNV/bak+26l1oT4XGY8u2h5ZlD7j3uacKKSI7KoO88wysXfAoo+EKeCwW8GZs6YoSee8CzehIWDkSfmEC0RqbqltcYcANvDyHM+ZyQhXJOaGhBxIv5qP6Eo3oM0a9vl2LJ2CjumO++zGE/wM8oADg3fWGVgsK0QL5hbFjNEKqLmKQz/rjuuTGOXYtT533s/v0mKGNAGzrxCp7MCMy+nmMzt88bW1oNqh4m+sOnVLM6j8zVTNBggQPqEdjYGePzAVmADqvcJfXAy7wqtqR7Obbx8rBbiGkGid/kQC7hcOxv5Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(23010399003)(1800799024)(36860700016)(22082099003)(18002099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	RUQNLMzX9iuUHaoOiG0ziNfPB48632TL+WTAkF9VheJeWsbjPjCTXD6I4Yi9yZc3/3zoY15p9jxOVqqcABAwvPG7c3rY5MLslRmCeyY0rdGsyl2Y8vslPK6cQar6uHKW0+qn1UtuN12tfOJm12xr9KD1a1TiXmiDcs6b8ofJc5FAcVYxN8AjGy8534YbbS/nkllMEdUVYPoFCZcGAU5vXXtXJXcxUbuXmV2Ev9i0lxY6USGtTp3c9zQGleJapvY+NbSneMTTIvIKkjfl+SbgjMnSJ3WjetR2LeDUHKpa+stnYrCht06QUZjMbthd633jjDlFKyYPP2qotXn+WVxe24Wc0qppI6V2Nvz91r5WPwNr2dGYa2DURnizGHkNrUkGAeO+w+V48JkjZTvjwPKxxonGI2F3Cx3crVh1pr1LUd/TnA0Vr71wrhRAZ58oomNs
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2026 18:18:09.8798
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7715969e-3ddd-4da3-bb14-08df174386a6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN7PEPF0000009F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6783

To make the code clean in the boot phase, add a sev_prepare() wrapper
which contains early SEV-specific checks in order to have all that code
in a single place.

No functional changes.

Signed-off-by: Melody Wang <huibo.wang@amd.com>
---
 drivers/firmware/efi/libstub/x86-stub.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/efi/libstub/x86-stub.c b/drivers/firmware/efi/libstub/x86-stub.c
index cef32e2c82d8..49388524a61f 100644
--- a/drivers/firmware/efi/libstub/x86-stub.c
+++ b/drivers/firmware/efi/libstub/x86-stub.c
@@ -783,7 +783,7 @@ static efi_status_t exit_boot(struct boot_params *boot_params, void *handle)
 	return EFI_SUCCESS;
 }
 
-static bool have_unsupported_snp_features(void)
+static bool sev_prepare(void)
 {
 	u64 unsupported;
 
@@ -933,7 +933,7 @@ void __noreturn efi_stub_entry(efi_handle_t handle,
 
 	hdr = &boot_params->hdr;
 
-	if (have_unsupported_snp_features())
+	if (sev_prepare())
 		efi_exit(handle, EFI_UNSUPPORTED);
 
 	if (IS_ENABLED(CONFIG_EFI_DXE_MEM_ATTRIBUTES)) {
-- 
2.43.0

