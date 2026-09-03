Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011069.outbound.protection.outlook.com [52.101.52.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A97674B5CD2;
	Thu,  3 Sep 2026 14:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788445287; cv=fail; b=hLXiOXl2qjpKDcKT8NZcdliONlEpMw9yC26W92sl6tFKPsRHbPgpXWOEIysrGNRX69smYF1rrgglhR1BSPUL1/SgMaUW2Gkv3hV7UjSSwqMFi4MrYcUo9I/rO/mYxSai19lU2pGZK3oeMa7UMo6mu9AJ+EWexpARTGEa2vktylY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788445287; c=relaxed/simple;
	bh=iFJqb98cnwUKQBaM05XksOBkNCXI6p3QQ5v5BuWDiMM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VZozqRy9gxl1OgDG3jTpWGfg8Jwj5F3jp2mXckfSaORJpHuozJGYOC+UDjSd4eOUkfBEcx9Rqf0c8ifE6yvreEv/y4ba/ObiCDzlIZLEUBl9ngfaNGEXER2OBoH4bROnMHw/ER7cbhIox0moHPItymUrg0kBCR/1PZLqwOSYPpw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=wrACs1L6; arc=fail smtp.client-ip=52.101.52.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="wrACs1L6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p9M50wAAmPjTUEyYKLpPFZGEO6Ih7mk0gxIScQzV+2laWysgePj2u6ztL/OlmYWj6Pydd55tkkbgJD7kt4dqfItARKrVgwvylNtss5HrXXAMjDXkKCsWbQ1TNil1+z2y7VGHvVNfKKInui8YwOhBrKRZj4vmJr1vuphwxXhgEnote/yguHFP3ZA6RmzsrR0IJCsng00wecIAW30BMoa54hvXWdhBLk+Et0ar8Qi1ffA4b2kKYF2OUvfd5ir1Kp5rOdiw3YxeEl/6Z69Xkd0CUadKAcpi0AZxK3lU9WTezfr8Hgm9/oYRPPqU8a+jf9uQwXTHHwW8wPbFcoM39cGKYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y9ocVIZTCcrQHdmXz00qVDzoglAhx7yJQEtAFA10n9c=;
 b=WiJu8AzOn4lAQpSZ2S/OPfvKYwWkxFp5B4LGhKQ4g8qGByQfd9PvbYFO8x4DLEytqsQXiHBwgy76LWvegN7JU+x+gQdlCz3XNMAF4c7x1ZITc1CIZYj4h8WrwqrCNULf+EuHV61YIiRPGDH+1XhpWV2uB885VDxQmxoEgDuVhnzW90Erd2tLdsLAL1PdC4dMFd0NelvH5t22sgBmfOl1OF/0AM+SAmIy+nF+nIc1WrAF2yi8qBhlSm9FAnUc84rGMJy5sdUkNAAWJW050HVAMKkIbg801Q2WDuB0TwxwMtUWo2i9PQp2rsKs3z7bQyJToEXpj/qdSUKSF4uFRS476A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y9ocVIZTCcrQHdmXz00qVDzoglAhx7yJQEtAFA10n9c=;
 b=wrACs1L6kQFJUx0cmy8DkNB5sYlvjdmN4zAy8xu8H6KHqT28PMD2slpor1ev9Bgg6UqjbRtXkpKpJQ/VON2gdvqVYpn4W0DlS8B6siUbR5lljG6ZVndbJ62D+aaCp4gDm0qFmjmZp7yly7hkTuqAQQSd2cbePSxd6RPX68Y1K6s=
Received: from BN9PR03CA0670.namprd03.prod.outlook.com (2603:10b6:408:10e::15)
 by DM4PR12MB6038.namprd12.prod.outlook.com (2603:10b6:8:ab::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 14:21:05 +0000
Received: from BN6PEPF0000006F.namprd03.prod.outlook.com
 (2603:10b6:408:10e:cafe::a3) by BN9PR03CA0670.outlook.office365.com
 (2603:10b6:408:10e::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.12 via Frontend Transport; Thu, 3
 Sep 2026 14:21:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN6PEPF0000006F.mail.protection.outlook.com (10.167.248.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Thu, 3 Sep 2026 14:21:03 +0000
Received: from quartz-7b1chost.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 3 Sep
 2026 09:21:00 -0500
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: <linux-edac@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, <tony.luck@intel.com>, <x86@kernel.org>,
	Yazen Ghannam <yazen.ghannam@amd.com>
Subject: [PATCH 2/3] x86/mce/amd: Convert bank_map to a bitmap
Date: Thu, 3 Sep 2026 09:20:48 -0500
Message-ID: <20260903142049.4126599-3-yazen.ghannam@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903142049.4126599-1-yazen.ghannam@amd.com>
References: <20260903142049.4126599-1-yazen.ghannam@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN6PEPF0000006F:EE_|DM4PR12MB6038:EE_
X-MS-Office365-Filtering-Correlation-Id: 28506001-4fed-4351-9eda-08df09c695e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|82310400026|36860700016|11063799006|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	QONKhoHAvy055GZEifJ/RyyvaUk+JK0U0YU6fWnj3zTkK+a4mWe/NIwrnF7utwzAinXkPinaQ4l/D88YwzhGFEQVsCJ9NteV/Yozv8G/GIGCC1BXWUXDWMNiC7nFklX/qH/zw+EwKasDQE4l/AmsrA2TLAO1dOCI1AXCEA0pg08sSRg0ckEWHw5XPerj9unuR7f7W9gXihkGXfBAxgpWr/0IH7D3sxx662/HvOHlPj+oQguzjiITO9DwA0IAAnZ9ZzTlzA8AEcikAB4La9tfjwAP+MAY6O9Qp6YQQAZu6hX6lXxYZfBmIDG9NqATPgFGoXvDRcIwrSOorLr6hwjq0eBVKIBEUQe6vE0bWI97qIBi22JvoUclMKBrZ8GQaCo1/hwYmKqLp2C0KipA4khY6/5dLqlFUG3i7owQ8hxHK5tS4OdIJPocY3SMxKqXV9C1iY9hszhvWJWu6BIjBOKGqPxS7seG/FmwCByV41zBzLjYNlXe27jInaFrErqdLI0yQYzXCRsmqZ/llPf5lFX1FsBR6kvBuBV/fgQ67ENCVGfP5MXGpNsIz2GGIyYA1umh6tAYDaLJkp7xpozfhu4Dt1DDJmqb2aSAIB5OxI9LnfJUOqNGkXwwV6l+imzDjqWu6Sk8WwZsg58yN577ZoFwt7DAQ3I2j0ZaJr+65rmrRPYTOFg3vMWB+gAzuZfS5w0Brbtve1bCTVe9hyjKx4WzAQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(82310400026)(36860700016)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	RA38RHPEa3ow0IWOUYk0x5XGLqSl3jvvS/eE3HDMABqgoIRw04+JDeALRvcmM2K6sSrriXtHM7xWSzBa+pwdIsxzlKrKUn6tReqBJN7C8HbjO60CIWk7uY5O2qa9UfGl9XPmkQ+S0AQHfL+YOyRx0u75qMwj7eNkKTus9cWHt6JCqpPm48nKXzFcBJmbRePbdjK3r6elw2ExiropINhKO1TkDfOxuhccwbJH1qKaLpXkPBVUoGlUb4qMGZmNi8se6KS+M6dxz9Ezbdu5oyGUh11NccgGcmavZ6U4McvDRkFC4xiZPxLfeRBSUgaQ7AM+6pzQwnQieuUgM08Fa2d2/Prt9Rw7ENU8VESttbTlsZIkyoUPgKeUwf9+4sqIr1qzTMjg3GFdeN/6iSmH/INV3ILg8nPc0r6XrGwRIlMBmJ9o6fW2R6Gjh4lylL2/iezk
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 14:21:03.2309
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 28506001-4fed-4351-9eda-08df09c695e2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN6PEPF0000006F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6038

The per-CPU bank_map records which banks had their block 0 prepared
during mce_amd_feature_init(). It is a u64, so BIT_ULL(bank) is
undefined once the bank number reaches 64. That caps the usable bank
count at 64 regardless of MAX_NR_BANKS.

mce_banks_t is the existing type for per-bank bitmaps. It is declared
with MAX_NR_BANKS bits, so it follows the macro instead of fixing a
width of its own. thr_intr_banks and dfr_intr_banks in this file
already use it.

Convert bank_map to mce_banks_t and use the bitmap helpers. This is
preparation for raising MAX_NR_BANKS.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Yazen Ghannam <yazen.ghannam@amd.com>
---
 arch/x86/kernel/cpu/mce/amd.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kernel/cpu/mce/amd.c b/arch/x86/kernel/cpu/mce/amd.c
index e6542e00dc5a..598b71d54f41 100644
--- a/arch/x86/kernel/cpu/mce/amd.c
+++ b/arch/x86/kernel/cpu/mce/amd.c
@@ -263,7 +263,7 @@ static DEFINE_PER_CPU(struct threshold_bank **, threshold_banks);
  * A list of the banks enabled on each logical CPU. Controls which respective
  * descriptors to initialize later in mce_threshold_create_device().
  */
-static DEFINE_PER_CPU(u64, bank_map);
+static DEFINE_PER_CPU(mce_banks_t, bank_map);
 
 static void amd_threshold_interrupt(void);
 static void amd_deferred_error_interrupt(void);
@@ -572,7 +572,7 @@ static int prepare_threshold_block(unsigned int bank, unsigned int block, u32 ad
 	int new;
 
 	if (!block)
-		per_cpu(bank_map, cpu) |= BIT_ULL(bank);
+		__set_bit(bank, per_cpu(bank_map, cpu));
 
 	memset(&b, 0, sizeof(b));
 	b.cpu			= cpu;
@@ -1272,7 +1272,7 @@ void mce_threshold_create_device(unsigned int cpu)
 		return;
 
 	for (bank = 0; bank < numbanks; ++bank) {
-		if (!(this_cpu_read(bank_map) & BIT_ULL(bank)))
+		if (!test_bit(bank, this_cpu_ptr(bank_map)))
 			continue;
 		if (threshold_create_bank(bp, cpu, bank)) {
 			__threshold_remove_device(bp);
-- 
2.43.0

