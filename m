Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012004.outbound.protection.outlook.com [40.107.200.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E4303F105B
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 15:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791903956; cv=fail; b=dn/RuAY4raouvCzbu3yXWKDXcPzj4b4JicUrPLC1B25VjTsOpomsZknXgYtKJQDhHF8Rkf0rkfSSE7MrzrammE98gVAuUHF1E+rO5GqLUHmYMz50lojlaYwS2iSlCFqSHItoYUBKd88vMmqg/q8PyrEMFNXdyx9G4U3Q1lyc7LY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791903956; c=relaxed/simple;
	bh=rpg5P3owsyJPPiWo4GldKpyJNApW7lyPQjCmBiatzc4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jGtnU398GbeI4+bEyn9jbYqPr0itquR4MjgjGeAoE+20gYZ+XI061l8yNVX8eSTRk1+ezqjuRvxLFgUCAzp4pqUvoM7AxvczEMJ/maa0jiMM0MDEdcRwO4gsQyRfhGaEEc6zD0jLW0xZef9fvWC2lU6r/EKT364S2VYKcw6Wins=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=cv9f+Xg6; arc=fail smtp.client-ip=40.107.200.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="cv9f+Xg6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q7n6xPcdXFD/PX90WcdpaKoNJtOWGl4AsCzT5KOoGKNwabADG4jeSppuwiCIFgTYPlkgHLD12mCfKi7JGlVo0eGxRHT7c9cJoVLawF9+7i9k5fz8PpvgefNZhNAop9E1opsj2iYUUGnBX0HoYmcQhXBmyGhKVLhXMVFi5nZqx+TuVe0pTNxDSwjY6SIECuIehaan9SNcD1pq1X9Xvtw+yRvas9X4CWZDT8L0GiKWWuqEIamknlj2TTiUD8DXcyAcprYBr7VnvsH1UwHBKVmm483dF/L2vOrpEFQKuUy6xUWc/BrWI8Qjici1j7cXXrsBmvUrgPffwiC4cNBk2HCFuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zxybGy+30TmOzlVigS9sjAZNg9dCXnlMvxnN6WxXi0U=;
 b=FeuhRFmzvXNJteXNGWS9F4lzpa3VC2agsrl1MaOZyxddkor2E9wurLJ2yDw7JmWv9Xs955eRmtPGOahdKvLyVV2zEPM5S59URUbB25P3RZOiYMaHbFLcQQC82rwbDHgDakau+Wz4XGJvJHhzqoQaSNcdqNgEa+C3sKgTXg0AV9ghEm3wdS1uuxFR3eqadEQn7yT6KNxqcX/+VbnjHTT+rOM2wwt/KP47ru+PJHxX0ZUHAu9bFyIA+6vlPQS5Zkm+b7esBhx03XCebAxswBRkoDFzfBGxi5X9MYcQVAySnZ79Fxyf+9nGtHC18PnRaiknDpZhZ6mtqn6iOwY4NUd7rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=arm.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zxybGy+30TmOzlVigS9sjAZNg9dCXnlMvxnN6WxXi0U=;
 b=cv9f+Xg6DPmi+2gVT1OU9i2vt7zLrFv4g0Q/X4EwRduyimo5VkyP0vxDmp/peEPAY2+kK1nNBQCUj74ljl0yyV6JQSYUsfKJ3n9LjM37ob2+HbCP2PpvDcmE3B58r+C+X1nflsmOjZfqlMxMwLzvR/E9puUp3dBo/bW1NuXlpIVYF8NXixvwkW2QQnbfd7mWZ2F7/Sah4ynK1Qc8c38B18Z6j+ZP2APjdT3dcputUfi/jox/TudQkH222WfCVJf/Yey4JJ2OlwCM0CPsYXniz0DSksgdj+Cy6Mnu+iGcdqQjlsrMfR40z3+/ktkudOzv+pn3rQaYbWZnknr4HGglDg==
Received: from CP5P284CA0222.BRAP284.PROD.OUTLOOK.COM (2603:10d6:103:22b::20)
 by IA4PR12MB928846.namprd12.prod.outlook.com (2603:10b6:207:12d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.20; Tue, 13 Oct
 2026 15:05:52 +0000
Received: from BN2PEPF000044AA.namprd04.prod.outlook.com
 (2603:10d6:103:22b:cafe::1) by CP5P284CA0222.outlook.office365.com
 (2603:10d6:103:22b::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Tue, 13
 Oct 2026 15:05:50 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.160) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN2PEPF000044AA.mail.protection.outlook.com (10.167.243.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Tue, 13 Oct 2026 15:05:50 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Tue, 13 Oct
 2026 08:05:12 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Tue, 13 Oct
 2026 08:05:12 -0700
Received: from sdonthineni01.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Tue, 13 Oct 2026 08:05:11 -0700
From: Shanker Donthineni <sdonthineni@nvidia.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Vikram Sethi <vsethi@nvidia.com>, Shanker Donthineni <sdonthineni@nvidia.com>
Subject: [PATCH 1/2] arm64: cputype: Add NVIDIA Rigel definitions
Date: Tue, 13 Oct 2026 10:05:06 -0500
Message-ID: <20261013150508.1798938-2-sdonthineni@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013150508.1798938-1-sdonthineni@nvidia.com>
References: <20261013150508.1798938-1-sdonthineni@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044AA:EE_|IA4PR12MB928846:EE_
X-MS-Office365-Filtering-Correlation-Id: da5e9146-b049-41cb-62ff-08df293b7809
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|23010399003|36860700016|11063799006|56012099006|261009223027099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	t/28QPUaZhLXWFWwVtvTXPp0ukK3cnvpDCqLvhH7CUBd2ZV0jlMjfti3qs3wAiKxfftaWA56UXu1DhIT/DK9jRyw+XqRFoI1Tvqz41Khs8trxwHCZ8dTs+8x0V4q19w35G0EVMBnp3r69mDIBMlQ4EqtZ5L5aEQ4ni12j+XBQgmoBWZcMnqEJZGSOf6BTRM2xYyD3ceItA9IqTT6NT3kgSgb4v+GLZCJzVyXKcnUdIaEWGF7W4PPPA3hnbarVKtZXelcGvUJfYp06vchRnyloNSNWOedZAt0ZQ2nMWLZAt5IfHjmLMg55vglt4UmMb27R1NzcRh+GxaAJ0zpoSAyv2KUIvSAMK5PV74jB+0dpB1jLXaMxq6Tk5U9Bcg+363oYy9eDSDSkOqgoLUiCpvtNvR5m+vVzQa0h77EwyPZr7g9k9EJvdB/yj4vy4n7tNoZfs971fJjC1MOcpxKiCDxuN4wHurYzQZIqDt54IS0AVR8KkRhOEQfUpUper6912oHrBaKxuHlQIkvyrQDLWwxh89adbALslnOBl91RpdYY/ACjYGpJfY7RdJ9/oX+WV7Cuax4hfmMTKXrhIVWlq3bZ1zparQ7K0bpqHCAbXGcy7/rD0KzGtPwSgSIiTMn7VN7KGcLWA6u9S00GSAAinJSk1SbMeVjeZNpcGRvMIS4JuVASb9Wl0y6Gd3BP7MXo9rUALfV6MM8QjABqXN+YBhRUA==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(23010399003)(36860700016)(11063799006)(56012099006)(261009223027099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ISNpVubs3BKrolNgpnAQYqMgdP3ShnqOOqHmSfQVJ1SkAInd16OzXc1sVZ3x5xcibMmp8jBKUpe77wWKRIlwunvm4dUjH/Wu3VmIfLiNL/Y1jzYaqFF2ngsEFNmNVdisaybqsQg9SjVmDVJsBvV14xF6N0nyQ2PXvpAAByKwShH6B3VVqpGKnyXC99oplwipfSp+JmOeLieJv2o0qpPymPU0xRp1UN/anKZTv2O59KIQ4FplZl1L0yqvK73p7GX/gSvzCkSAkf9sarOCUSdxh+MfptOnL8dQyUcB0CpJvFkEWbhAOuUoTidym/1a6ZfjiU1viLveGOST+yVTfFbdc+gxhgOpwSajMzqYkxOKjiMnQGJpV5TwdE0iRWzs+smrxMIzMEx7QPWKXJKDZNWj/98H8kzQWyhNrJiyjVGqXhX7xXFZzCu0ezwrAMUdUxNL
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 15:05:50.1679
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: da5e9146-b049-41cb-62ff-08df293b7809
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044AA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR12MB928846

Add CPU part and model macro definitions for the NVIDIA Rigel core.

Signed-off-by: Shanker Donthineni <sdonthineni@nvidia.com>
---
 arch/arm64/include/asm/cputype.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/include/asm/cputype.h b/arch/arm64/include/asm/cputype.h
index 1fa29616e586e..6002d1d5f55f4 100644
--- a/arch/arm64/include/asm/cputype.h
+++ b/arch/arm64/include/asm/cputype.h
@@ -136,6 +136,7 @@
 #define NVIDIA_CPU_PART_DENVER		0x003
 #define NVIDIA_CPU_PART_CARMEL		0x004
 #define NVIDIA_CPU_PART_OLYMPUS		0x010
+#define NVIDIA_CPU_PART_RIGEL		0x011
 
 #define FUJITSU_CPU_PART_A64FX		0x001
 
@@ -234,6 +235,7 @@
 #define MIDR_NVIDIA_DENVER MIDR_CPU_MODEL(ARM_CPU_IMP_NVIDIA, NVIDIA_CPU_PART_DENVER)
 #define MIDR_NVIDIA_CARMEL MIDR_CPU_MODEL(ARM_CPU_IMP_NVIDIA, NVIDIA_CPU_PART_CARMEL)
 #define MIDR_NVIDIA_OLYMPUS MIDR_CPU_MODEL(ARM_CPU_IMP_NVIDIA, NVIDIA_CPU_PART_OLYMPUS)
+#define MIDR_NVIDIA_RIGEL MIDR_CPU_MODEL(ARM_CPU_IMP_NVIDIA, NVIDIA_CPU_PART_RIGEL)
 #define MIDR_FUJITSU_A64FX MIDR_CPU_MODEL(ARM_CPU_IMP_FUJITSU, FUJITSU_CPU_PART_A64FX)
 #define MIDR_HISI_TSV110 MIDR_CPU_MODEL(ARM_CPU_IMP_HISI, HISI_CPU_PART_TSV110)
 #define MIDR_HISI_HIP09 MIDR_CPU_MODEL(ARM_CPU_IMP_HISI, HISI_CPU_PART_HIP09)
-- 
2.43.0

