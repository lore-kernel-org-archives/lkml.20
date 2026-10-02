Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013068.outbound.protection.outlook.com [40.93.201.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B3C9370AE5;
	Fri,  2 Oct 2026 11:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790940806; cv=fail; b=Lek9ZA9oPMvnR/uXdpL/cm/6Dx8TUFHqisn6hm9CRNguTQWI+VMbZA9Ii8ecSw94ZbcAO4fD1CETVR+lei6Fz4bGfQLxCHPte+P3JGl0mcn9XpZ4jzxWbZHMb7pGa7vLq7vLgiAdfUVxaRMxFsjYK+n4OK2XnTv/AAmKttrc7rE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790940806; c=relaxed/simple;
	bh=r729t3wJa8shX7LSTlxRStjyU53AJNuxv1FiPbwHS2M=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=UJphqdkOA9ZymwN7dF0mqcxz8FW3jiTKJi7guvlwU9XjN2qykGVNZeizJGnBx2rUl5VDhQHjXelTXD1qZ3hKRA+l/tvZ1bcKbLk+btvPao3DFADmya6u4svKZkybYtxCAFhovC7mNytQxaHWpjQAaTcAfMmZd5qEf4noRSD4FUc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=XvFjEFsx; arc=fail smtp.client-ip=40.93.201.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="XvFjEFsx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LrCKNtfzYnFcRvTJo5Ki/4R0df6O/iV87Pbqj6+MtE0kaXiOoQ66vDAiSZispjhwEOF9Cd4FVNAGmTuJjorPPMNRfYQJsc434bI1wZw2qsKshUoyS1Kc9x28eYbZ5kzxMFU0/mrw31e2CBEM/mXhbLvdd00KeLgnaGHF1LgXSY5MqDfYTlTLchPmBSO2hYmVcpeuVhfaQbQ70S5gcmy3r0syGGzoFcQl2XkxawPkdv1up0w52RbkpC0LxJ+u3Qq68qiMaWzF8U5eT5jok6kLqYoU95uPL/mLjHg4vksw5uQfhaX5GpekE2UVzvtw67l1uYM5rYcP94XPONtKlxpwPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LnW5LN9w0RZaYEwa1D5b5IOLc1L0HXF6tuF/SHWTX/w=;
 b=K+2f/AyaHZLm4rxzjpwohQqDi2WVfwYDIeZYtezKH+YbPnfn5szIG7VwbnfGI1nj7u+OnysZHicopWHPZx830LMlaMcFWPz/tVqWW2M02NINkG9iUGMncPP9vqLWJs13biO4OaLPrEnS2/it+VQhVOrMnD1+DeACgY7ljWCzJ735gjCBHQCaN5KL3sK6vLkghXU3E0iQ1b46aoyWJLf2nGZ8jSbzGBZ9mNj43EYDjqhb+s6xmvs9vQD+ZPtYF6vnXGRLSq1myfi9S7L4JtOHI7l6eDELSJTSyrk9sgIMy2YDx7T+/Jdzqm1Uz1yRUA9y4dDKql2QxvL6oenyNuAwSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=alien8.de smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LnW5LN9w0RZaYEwa1D5b5IOLc1L0HXF6tuF/SHWTX/w=;
 b=XvFjEFsxn3tXRD5x7FZrAsyf0qW3NBOVorf33EcnyUwTpf+MvYxTj+1u4xrrMpjjwdZ+K/0GH3LRluVBIZjKKwr8DAwIqqtMPdsldFJZ1bbx82pYGvgzpXPmft6jSSBVHnpa7+8WXY1+UQ0wI1OSh07pE137+J4Jr/g6hUD9gUA=
Received: from CH0PR03CA0331.namprd03.prod.outlook.com (2603:10b6:610:11a::22)
 by DS0PR12MB999290.namprd12.prod.outlook.com (2603:10b6:8:424::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Fri, 2 Oct
 2026 11:33:21 +0000
Received: from CH1PEPF0000AD7C.namprd04.prod.outlook.com
 (2603:10b6:610:11a:cafe::93) by CH0PR03CA0331.outlook.office365.com
 (2603:10b6:610:11a::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.18 via Frontend Transport; Fri, 2
 Oct 2026 11:33:21 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH1PEPF0000AD7C.mail.protection.outlook.com (10.167.244.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Fri, 2 Oct 2026 11:33:21 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Fri, 2 Oct
 2026 06:33:18 -0500
From: Vishal Badole <Vishal.Badole@amd.com>
To: <bp@alien8.de>, <yazen.ghannam@amd.com>, <tony.luck@intel.com>,
	<linux-edac@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Vishal Badole <Vishal.Badole@amd.com>
Subject: [PATCH v3 0/2] EDAC/amd64: Fix UMC csrow decode and consolidate Family 1Ah setup 
Date: Fri, 2 Oct 2026 17:02:02 +0530
Message-ID: <20261002113204.3358815-1-Vishal.Badole@amd.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7C:EE_|DS0PR12MB999290:EE_
X-MS-Office365-Filtering-Correlation-Id: a4ff1286-edde-46c0-21ed-08df2078f663
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|82310400026|376014|36860700016|18002099003|13003099007|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	Da487+kG+qvmBDMwvY6oAVrcUI89Wekz3aUppkoub3c8Hfj2At0mkoppgSKe1MqtiUixnU8Z0xEyPzZkaJdIUx7bjKY0WS5dXLDDEuUc83qyx7vpV11m8pyQt4m3+MZPksyYLJeINF75vn91OLSN0nNu9aJVZ1m15I1LeYYl/CcsyzCpoCpobz34AUn1S7ynirFLB1XozRUcviCRkeVAznBF+xNULGCNXB9ylDL+bHt36IHvO+/aBK2mKn0hcNdd6aN42UzleDh92rZ5KtpQPfpicGk2Qeyr2UGAQQ7kMaHXzijQthuVRmfcyL60+AblSBjMhpPXmvQ6fSA7RbSM3V23aETT2Pqdw0O0uAvIxA9t6a61lxhd+LcrHvPf2o2ZNlyHn2RaabgUQ4ynhkz36gywWWdscNNQCq2rOFevaTZ4UJKkpVdh7dXJ66lxsQ7LnlmsQEwM/PCMOw81f2jsXW1g+w8aWVrJGzEmsFdia6WBhgdHmrJsKOWr257DFgU3h/nIFYhtPkgZA3RlYaAlSLFe/FzNpKBxTUXm5FUr/OO01BUeR+j6yBcqofwxsfgiUtKrOisFlavRsLAZ0BoEsIUMuRA62xFbhRSPP8ZtGPXuBH6GFhT1PS4EgmuITIUaPMpqNJW7TxSwhv8o4oBdxgejprq+FNVimuGXqg11wuniIRwneAvlN+/1zZ0fD5+CeoDfRs0bXs/dynvmYVBCBg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(82310400026)(376014)(36860700016)(18002099003)(13003099007)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	VOCJwUuAAoXkTQMJpMLtJV79LrackdMaulv35wJ5Za7BFapnXYBd0q+0+tA0Wl+7CTw2DuXBWxyxZjEqcSmvQH8kwLSsQq8+55KxfZKARpcNpqpLQXS2d+4tUTHSOTu52+HGV3EKINrQuAmAv8xCh/5TVj5N2YraSIzCCTMGHh8OK/tojSus0IxvWLt8SCREn2Vk1pyCkrnszOzRH/hTr7Rojo9hFu4VcwI4LrXahheWlzxI2jO+zL6VGyuXzPF0gq9CqNxrwoqivRAYAkUF6i+ptmUbodavv18B9J9dBuC5ow4uEZf3WYPC5XTRjdzys38yo4KK9BRTkQ+sP7KaFt9s42ZdK9QDG7gw96CaXlFt7CPUX8sLM+u0zocCuE1zh20NNLuJZNX6CGh493iUB6F9f/1Ji+DwVKJ/igHv1xRPz0XeT1wUca9A7DlzWDOg
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2026 11:33:21.1218
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a4ff1286-edde-46c0-21ed-08df2078f663
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD7C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB999290

Two small amd64_edac fixes/cleanups for AMD Family 1Ah.

Patch 1 is the fix: mask the UMC chip select with 0x3, not 0x7. Only
four chip selects exist, so the old mask could decode an out-of-range
csrow and trip an EDAC warning.

Patch 2 sets zn_regs_v2 once at the Family 1Ah level instead of in each
model case, so future models cannot miss the v2 register layout.

Changes since v2:
 - Patch 1 (fix): Simplified the commit message and updated the code
   comment.

Changes since v1:
 - Patch 1 (fix): Added Fixes: and Cc: stable, and move the fix first.
 - Patch 2 (cleanup): Updated the commit message.

v2: https://lore.kernel.org/all/20260928180935.472319-1-Vishal.Badole@amd.com/
v1: https://lore.kernel.org/all/20260925172639.97063-1-Vishal.Badole@amd.com/

Vishal Badole (2):
  EDAC/amd64: Mask UMC chip select to the four implemented selects
  EDAC/amd64: Set zn_regs_v2 for all Family 1Ah models

 drivers/edac/amd64_edac.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

-- 
2.34.1

