Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011047.outbound.protection.outlook.com [40.93.194.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D654237756C;
	Mon, 28 Sep 2026 18:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790618999; cv=fail; b=ty2/e881VMbAtUB7wqgJn1P/qBm51esqty5KLzMxXs5UIKMA0Buim8uwW9isu2IdVFW5tzEHM3DMZcbBEO2w2K+B/cTaGhSSTR6/JUMzvxzSxqebck9cMxs90b5u2rmi8zMhBwY9z6wFuEPIzyLR3ykDabo8S4f4kN6/kNuQFhY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790618999; c=relaxed/simple;
	bh=a0EVjUxK85l21kbrFmJF0QoXTgn0C/iCPFp5u+fs7Jo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=VKRoX+TxOeqiXBPavAFjFrt/pVK3QqTQlkeq4cCiY+ZqljVzY97nU1C8ZkDadf/2Z2rNXvSIJoNZBQ3l+nFAExmnFGd88Rkhl7POrqn5knXoOdDjdm1vGfTn9k5sSSnzfjKRtR4jD1chwDklLS5mZofjwNzaTLX7Tn8QZqh7tYk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=eXcRITki; arc=fail smtp.client-ip=40.93.194.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="eXcRITki"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NO6/ArWJYmCEHdYrYPiDBqnff+KcGXl9cb6q9GlRIWDnFTXlQ43CDnzvrytgji5PrLx+N1F1AGUWY1LSV/Ku/XKEWkJsonogM0n8pZvK9GGD0Hg+DoGjBCa+Bjjh83iFBZVA06Gilhzu2hKQvTtu8hVafOJkCPJVIAonzQT3RXAHFsg+87iGlsgDeQ+TSm0aRtiiwZs6ZxzIJe0ju+DYabzevLy56SgjXzj32yko3fNmDa/MobmzP4mzqYpHgyX/aiyJNxjTHQtHuGq94HX1+IK8jGfHoziPwYGq8vEEG1BTf13JAVALequmAJN5cOI8+HHkaN07UvvBb35CFi8Eug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MDa8PTiEgXljtqOw70cnIukVE/6I8gb/ZhSJwmZMKE0=;
 b=TWb9nxynWLHfMg3b5L1RzL+WtNAnyxUOxAxEqGZXDaNUpgOcnl3onG9IcVHFabJcS/ZvaYyDeEgHaSHGoNX9dikPPCTEsUyuXJxUvf9EPqWxmOQA2DfVrIJSqm5VABUpfZXZnYpUuTuj4LDtvYz+bonngoNpLZX4oKl6suGI4OxPlHE3dR/3POf5QJKNYgx0Np8jMad8sktSqwejYJMdLzmfgodnG3k0vr3VC11hdmZqAuk6BcfvgkXNeHACGHUp5deVCpHr7VUHsd5bEZqeRpcwa8Ow4lVUCcKGyOn2j9xuB9GrMbZxuK0CHwb8YjVrhfkHOEbp9iYhpwrvTCeBtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=alien8.de smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MDa8PTiEgXljtqOw70cnIukVE/6I8gb/ZhSJwmZMKE0=;
 b=eXcRITkidxMayJHTefBEj3CscnE0EB06tKAQi+hbYC0u5jiA644Tw+KA1jpIBOurDIzMufH1tyj43C3504KoO8sBwSoPcrVSKkSx1gbZcY+v5uJSxACzpRDaiDTR/Ipz+Qznd7Me5GpJWYqXB2tfEXCzC8Z/hTerpT1ZP6aY1v4=
Received: from BN9PR03CA0852.namprd03.prod.outlook.com (2603:10b6:408:13d::17)
 by MN2PR12MB4189.namprd12.prod.outlook.com (2603:10b6:208:1d8::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 18:09:54 +0000
Received: from BN3PEPF0000B372.namprd21.prod.outlook.com
 (2603:10b6:408:13d:cafe::10) by BN9PR03CA0852.outlook.office365.com
 (2603:10b6:408:13d::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.24 via Frontend Transport; Mon,
 28 Sep 2026 18:09:53 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF0000B372.mail.protection.outlook.com (10.167.243.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.3 via Frontend Transport; Mon, 28 Sep 2026 18:09:53 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 28 Sep
 2026 13:09:50 -0500
From: Vishal Badole <Vishal.Badole@amd.com>
To: <bp@alien8.de>, <yazen.ghannam@amd.com>, <tony.luck@intel.com>,
	<linux-edac@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Vishal Badole <Vishal.Badole@amd.com>
Subject: [PATCH v2 0/2] EDAC/amd64: Fix UMC csrow decode and consolidate Family 1Ah setup 
Date: Mon, 28 Sep 2026 23:39:33 +0530
Message-ID: <20260928180935.472319-1-Vishal.Badole@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B372:EE_|MN2PR12MB4189:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ce8fe1f-99d3-439b-25cc-08df1d8bb21e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|36860700016|1800799024|376014|10067099003|11063799006|56012099006|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	jazLQiplWooMj2nSM5lBUJN60taRy4DY8+UGxQD3f8EjUSA5DDxW0weFa4KG+SxBDzPT7X9p/O+XWxkWc9TxA+oWVtyE5hPYdhfLlNqBityduaR5NmD6QDpK8BAjz6SuAwKfCHrqWOTUTkMcCcyD+LcqWXhsWMNbCo944sBSLFK2FE5OMgSoQzl8LNtpMRx77f2zMcYzuSRAN9AUXC0u2r8ymCKFTN+V5ZJ2V1imMh1xo+83pGU/k4HpYzTW0PutYxFkcK5QVTlzsZ8xClBqr0jPrEDijC0aFB9RMMTL/o0R8mOfjIYY3EHA/C15ehj+YtxTmUGmbU22qyy221JxEMwg3K61DrS7VO2MedeVUUhxbuJwFLvdUx5zPLM4pYvLDJ5xmVoW4vNKHQSP3OmTjgDLsbY6YhDUA+OqI4+lp7hAVNrcPPs7p030GCh2w7rIv7U7zWxJzHA1uHsfRm3GMW5VPTp6+gV5eIDlk+dJBYuiJ1cBSAjVrjDjPcOqqOerxX0zm7YTmzxTN6lv4HqhicSOfaekZfwRBjWqCYyz1EfUoPYYVqba74etw1GfN61VDu9rYYMui31eX8YNQzNwFRhdEDykchHDCm0pXzIhEyMxWw1v2SKPfdeT0YGiar4/YYXTkOWiw5tV7MKUPqEm2t8AIuvjJ3FUElLHoXi0c6/wiZu2yNfFivNqQUtW+1edVVoMSjHJt68h7swh640B9A==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(36860700016)(1800799024)(376014)(10067099003)(11063799006)(56012099006)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	bHFpxzMPTUDjVvCgY4tF0ypNqilJYUFdCNemw1RmcJcZXzHixn67MPQ2Qy/UWMfEULI72I37k25yQnF5UALaJUZb44PxBM0u/8PrLMqucB2ZFqbORToa8fg/2IdWq425wd7glVv8x85sQ5AE+QzBxDgGjFJRNHYfmdzbpyNKXKIwYs4psL0x8U0UGFODpJHKdDuP4ZnfCAeyfXhYxoOQUThyfDaLnRzXWdWfY9+mdKj7Qm+GE5iuninbzgtHHyN3j0aDLDKxsQmOuumwS+bHxQ5unCC0Iqs69IzyOLuCI+QapZlOdq+9hRH+i6o29CUSxRqofSAYWHih/OCHOEAVmlr/CJnjh8+FWyMuthYH7wjQksUyeSLq0gztCRhv/6zJ3qkvPKmR2uG5181LUtQu5hEDRToCk84g8pQ4iA33hlR1OD21R/wMeU9pkRF84kVL
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 18:09:53.5402
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ce8fe1f-99d3-439b-25cc-08df1d8bb21e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B372.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4189

Two small amd64_edac fixes/cleanups for AMD Family 1Ah.

Patch 1 is the fix: mask the UMC chip select with 0x3, not 0x7. Only
four chip selects exist, so the old mask could decode an out-of-range
csrow and trip an EDAC warning.

Patch 2 sets zn_regs_v2 once at the Family 1Ah level instead of in each
model case, so future models cannot miss the v2 register layout.

Changes since v1:
 - Patch 1 (fix): Added Fixes: and Cc: stable, and move the fix first.
 - Patch 2 (cleanup): Updated the commit message.

v1: https://lore.kernel.org/all/20260925172639.97063-1-Vishal.Badole@amd.com/

Vishal Badole (2):
  EDAC/amd64: Mask UMC chip select to the four implemented selects
  EDAC/amd64: Set zn_regs_v2 for all Family 1Ah models

 drivers/edac/amd64_edac.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

-- 
2.34.1

