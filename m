Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013048.outbound.protection.outlook.com [40.93.196.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFE133EC822;
	Fri, 25 Sep 2026 17:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790357238; cv=fail; b=tEHVMcDgvjOBBX6/9qHx4LzydzA1zWQXLdHsFCoA6PjFZMd4Icj5PAQZ6XlruDdNOEV1ZSCQkwj2HLxHmOJktnX6mSz0n/m/UP98uPCzyKNslj2jNYNSsJCHPC7wB5ulEYg0k7AYUQBqEKycQEnDiDOI05/5kKoHxqqnAgBZZgs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790357238; c=relaxed/simple;
	bh=r0HvWyXiOPNuSe3EHD47F74R9q0KTojDye+tdOJdODQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=CamttvALifugiXu7ZxnRmipcxPjCjfjNqW1g/hwYHvz8+toQnNi25tm+zluHD9r0UDrv9++TOw/vk3FLhY3vauft+UTiifMab8kH6maIIz76/U1yiqnG1qhWcMmKAAW9teQ4RZwv95oAVlgmIDtvRdlcSFahx0NwRVRaOA4KV/8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=pBHtHIPd; arc=fail smtp.client-ip=40.93.196.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="pBHtHIPd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CQdN7QZy5gAexH0pGeiKS3KXQx1HY+HUEGy7GXYuA2u5e9zW+vh37TCi9PbIgmPeeMJgW03edl1zstVYWG+nyBjdI6BrQHbeuGlbwwCf8fQmtcdIomIJn3t3f6i0QXL320SelzMQlCvjirnVRRl3t4Ch7E0PH0PyvzJD2d7HHlKEyzPJBkLMoZ/kgSiI8K+FVE3s1ZCF0gv1sazVUDSPKnus2/CX3IxKRhN4KdKe2+OZW3mF3U+DqWkpI/2Sto/0rfSgKf82ZGUyKQ7s3YxZJjiG0F83wWf2mrYfif79lIqFtYlpOiNQfmdAQkyh6V21TKlicECo2l1rJ0FBWEWpyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AfbBrZ7n3OGpUR6bI5/qvWgwvsQwrn3Pu0KcPqMmgRM=;
 b=n5nqwWeh8xSpWdHW1+8DuZR3eNAFKBV6Xg1aUK2/9K2KRzX1A625LkQvY57JhNLN+2iu/vDF93TEk9gWloiAsCD6r4MzwLxge37ZojpdYcmdFqyHXnTx3U2V2Drr3bxDyc9KFTb0uHjdD8JB8pOmAPQQxNqMki8ZQ3qRM7Pu/Es+prFrSMoWJj2yL6h95kAGyR0uddHDztYz02mGDxjEKwzishYHOZYBY1d4xsIG7uAAorTs/WVVVdclgk82myTOhDcKFt8mUMwHl6TVnj1sELLxGjN79tL9UZrQqgONqiHqHMrBaSzd4bN148kNsHjnmyKRNXO5c7XF+qS3lwYxCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=alien8.de smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AfbBrZ7n3OGpUR6bI5/qvWgwvsQwrn3Pu0KcPqMmgRM=;
 b=pBHtHIPdqIFVS+mfUdOPGdq1cSc0iCGewnsUws7K9wmrsPuIi/VdXOrZPuygQH7B23ONKMmzqJ+yNpL5iGWybT5D4HEVRjup40VTwP+Tn9STZMSFA1hAOASbv+UWtbVGEZStJR8slnhhloH0wpw05n5pCXB2cwSL6PZB/QAG8as=
Received: from CP3P284CA0045.BRAP284.PROD.OUTLOOK.COM (2603:10d6:103:6d::20)
 by MW9PR12MB999208.namprd12.prod.outlook.com (2603:10b6:303:301::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Fri, 25 Sep
 2026 17:27:12 +0000
Received: from BN1PEPF0000468D.namprd05.prod.outlook.com
 (2603:10d6:103:6d:cafe::5a) by CP3P284CA0045.outlook.office365.com
 (2603:10d6:103:6d::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.18 via Frontend Transport; Fri,
 25 Sep 2026 17:27:10 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF0000468D.mail.protection.outlook.com (10.167.243.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Fri, 25 Sep 2026 17:27:10 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Fri, 25 Sep
 2026 12:27:04 -0500
From: Vishal Badole <Vishal.Badole@amd.com>
To: <bp@alien8.de>, <yazen.ghannam@amd.com>, <tony.luck@intel.com>,
	<linux-edac@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Vishal Badole <Vishal.Badole@amd.com>
Subject: [PATCH 0/2] EDAC/amd64: Consolidate Family 1Ah setup and fix UMC csrow decode
Date: Fri, 25 Sep 2026 22:56:37 +0530
Message-ID: <20260925172639.97063-1-Vishal.Badole@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468D:EE_|MW9PR12MB999208:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a24de32-4f05-4ee2-1f43-08df1b2a3b17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700016|1800799024|23010399003|10067099003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	ty3fU5SkhIRr9DL2no45aQWrkF7nIF8XTLi3zUaLlbf9qbe9WZ1TdhEW2gmyvF2NTa6jsdo/CcqX6g25YqvT33Fe4Rk1fAsLNpqAQ0CFiRAqR9747WsQi3ZTzJYP8BzPrmlbHviGC69puIUgSQo3q+i5M/1Wuzjh0sFoc1haLapAbEOHWMdUkRRcypuHmEGdtLEBld8TXQmAu2DRAJgBb+Yv5ECVhwY/Vvr5s0a+dCnqkCdZhmr921YgxtmlNTFjL5ZLB/j8ShCJ91GwiqA4y2Ifeqa/WrJmfy+FB+pM4Xh/kFasBBmAU04iiVvx/AEM0N7NyEP5eLddE82tRlRp+U5i2DgEfDcx0UE9L1P82yIbQ2taKHPBMI1JCK7QTsewElVrUFONUwlHGRR5anHPCZUsgMvpzIfUBfzzK6OZ/gDjJ+VPM12bY1C2lPSVi4FtaCZLSvi332mbjz9j9yv2cwyhdUPDXR1RqKyJ341W2E+zas+rc+ahqrB6I0vCGPrn/PXOWCPynR2QDlZd0qdQzHsjzkMgXrKXyEw7jNo6itxj5kyGGNe6sbCGMyRo9EH5QjtQLxDNadHZywrvxj1hP8Fg+IOhMDoat94QRA1jSoavnF6vmMxudhBPhbLajHa91vusgWd6BMqOFaavC5Wk8886wPlEZq65cfvujg7fuMdwxEx8pOEAWgvF/ushAZcLF9t3F3g8aNjdh0v+opoBoQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(1800799024)(23010399003)(10067099003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Fp4/8Ueu7DFfByc7T9X4wyN0xu9YA0kYeUJfZGOBhKhEaOj5uxFFUAyaDUNXte3PusNdWJv+KUsmUBs0ns0FycE1NikZf1oSONxKesGZbIIGJM0wfp1wbEx9aZgTVJaRz7fz7xdSctoT6GUvshkL9LDDH/XFs9ucKPzDpDXDpS7EsoTKGiv8+ULrgEMIYBL7jYijBllTuSp1c18KcBslvXRApky0KIcVi4izJf5GZXnwcVeTGsnbqeHBIK/XOa2DCgawcA18TAQdBq5a20ho3WS1BnFA6NBqg66Pa6AxY0yV7EJQb3znXEfWM8RMSIC9GDTA+bOQPeRzeJyboAqunzwmhdmK+s8wmAcnELpQl/Q1dr7Q8vK6QKWr23XQOPgRQS+ILBOF1+l4Jb4k5V7qijVC9IVv/GaGfrJhLrdx9kLd2cOblMlNFi4sEr+Uwlk4
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2026 17:27:10.3420
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a24de32-4f05-4ee2-1f43-08df1b2a3b17
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF0000468D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW9PR12MB999208

Two small amd64_edac cleanups/fixes for AMD Family 1Ah.

Patch 1 sets zn_regs_v2 once at the Family 1Ah level instead of in each
model case, so future models cannot miss the v2 register layout. No
functional change.

Patch 2 masks the UMC chip select from MCA_SYND with 0x3 instead of 0x7.
Only four chip selects are ever implemented, so the old mask could decode
an out-of-range csrow and trip an EDAC core warning.

Vishal Badole (2):
  EDAC/amd64: Set zn_regs_v2 for all Family 1Ah models
  EDAC/amd64: Mask UMC chip select to the four implemented selects

 drivers/edac/amd64_edac.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

-- 
2.34.1

