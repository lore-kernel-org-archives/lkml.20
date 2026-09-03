Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012039.outbound.protection.outlook.com [52.101.48.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 442194B53FD;
	Thu,  3 Sep 2026 14:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788445282; cv=fail; b=ZwcWQV8urnGexOpKZp1QEvE+aavGrhJkElsQnv7b7LSYaTwmgaIGT8uhPU+7mySNcsCmtdkdej+7FqBTcAH+WJ99AMtPG89oAlsFFc3+/KOsqH/bV7oVoyteCzLSi4MJsRHXn/nuBnBsOoFZLtkZrER8916HhHDqEuxTNFHfpLc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788445282; c=relaxed/simple;
	bh=oMsOm/XhJdhlDoZoEHwbuVWgzX4GyQa81y/BsaCUO7g=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TKppP8BR0f8yrYU2QaCP2agF/QZVmzXTW2AwIa2vrVNv6MUZroe949Fced88e0Mh3lFkcHuBDQOj6+k3AsR0KpsEkhAQ0O2xlNFpJ5rYBMp0qsbyysI2LFyxW9uWhNQCQGFPpQ0R2NXxJO8o+t/7wS/QfJI/qjEAm6WF1hJMwtw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=EpqTYrzQ; arc=fail smtp.client-ip=52.101.48.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="EpqTYrzQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Clv5W4bRHaY6glYzbd9nMNDyCf/t+l/U5/uIR2ZqW5alCwei3yDeoen1tPA6ZFpmo+sUXD96J9gaAbHP9ncQymbh0Nk65xzpnfyBci/i0PWdE9k+laH++JzTQlVmyL2MiXdGQ52RyEf9r8jGvJt14FAqD4U/D2Ko6xRoGgCQgdj3QiVMULqHT+c2HxraRIa6dgkti5kKkdexJ/FGMEfthq0ulXGIoO8v0sqCnv7D1qGCVKVF0y4rdIB1MxwtcRMbsxClrO8wZPfaAcA15okKCPn19/LeVf8D71s3I/YKiW62MKaBUK01x1bciSOf1coPoA+A4+LEzCiCYrLp1nbzRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FFHO9VLhoQq8XbLUgnZc96W10EPZ0HO9t4SduQKhGVs=;
 b=afBc4A+GS+e3J/5yiX214jpfuDbjfaOAJ/MZcZSUP8qU3Llh9SUJabp9xIOMJWHn4HyarW77pp4JooxJeNc0nYkxhNBvMg8hA4fn4cr46KOuSzQ138ak5+Y8gmNghZw+IPSd31P6av27qN2ZdN1FsMkWRpyxhhGvcxhtdULeqcw7ssPW3pEgvKnhGWQcjj7VqfY1jrF3g8K3tSEJw5OXGlVC9kc7wBqNhJyCm3JnkXURLVczw1/s7uxqUhu0ilNjPpOijbeWzQ8VOhfTVLcHCpEnmdR2QUp/UNCSbO9gSlsTHRpL64saYk4Rssq8yAWTdLF66I2emSKqh2JnCEmOHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FFHO9VLhoQq8XbLUgnZc96W10EPZ0HO9t4SduQKhGVs=;
 b=EpqTYrzQIzZa2PFlPyKW+hTUXa/LZ6vooqTpblhCg6DKyJq0uRgu/knXLObZcjFMxe4dBMalbd7Sf4qWt3ts9hJhI2+lq37WymodRrM4+ECIreudANN8nRHcK+/mVN1rYzoHIzELJLkDC/M004kcRV+ctXwop9ANOOdxWR2fPac=
Received: from BN9PR03CA0682.namprd03.prod.outlook.com (2603:10b6:408:10e::27)
 by BY5PR12MB4034.namprd12.prod.outlook.com (2603:10b6:a03:205::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.12; Thu, 3 Sep
 2026 14:21:02 +0000
Received: from BN6PEPF0000006F.namprd03.prod.outlook.com
 (2603:10b6:408:10e:cafe::5) by BN9PR03CA0682.outlook.office365.com
 (2603:10b6:408:10e::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.12 via Frontend Transport; Thu, 3
 Sep 2026 14:21:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN6PEPF0000006F.mail.protection.outlook.com (10.167.248.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Thu, 3 Sep 2026 14:21:02 +0000
Received: from quartz-7b1chost.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 3 Sep
 2026 09:20:59 -0500
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: <linux-edac@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, <tony.luck@intel.com>, <x86@kernel.org>,
	Yazen Ghannam <yazen.ghannam@amd.com>
Subject: [PATCH 1/3] x86/mce/amd: Fix bank lookup in amd_mce_usable_address()
Date: Thu, 3 Sep 2026 09:20:47 -0500
Message-ID: <20260903142049.4126599-2-yazen.ghannam@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN6PEPF0000006F:EE_|BY5PR12MB4034:EE_
X-MS-Office365-Filtering-Correlation-Id: e8cfa599-7c11-4b55-5e7b-08df09c6952f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|23010399003|376014|36860700016|56012099006|22082099003|18002099003|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	FG9rPN/VKqPDfS3iIm55865/KR8NgOgVStlhQ1xOqSjgWIDI4POvJQPn7XVepQsITQ+fdw2Wr3ZoDVeCGG0iloJD2oJx70zNpLt3EGEKwcCY+Pzw7XfcQDYO46dtxDcHnCWaOPhAyBY7elddB2XkQaYC+K35xXIn3I1kJH9Qr3odx/gbG+twpptUSUnmcxLeEgKc5Lu1J2pkPTIXml4jSyQ1xZ0SeuW9JCC6O4fWDQJixmKZe0yzeiFlOkFVk1ch7pJv9djd0Baz88bOjF5JyPxjOy/DMJqkKR+bsXm3XsSqczrL4ZzHlf2W+58yL+iCGC6JAJ3l0u3vR3QvAkG7a1euO59VjWyHhA2qxnIjKuXx1VxFq/EWJLHVu1YBS1vZsNWyWiN1fCUa8jgzMpG56ZPbFTBrJT4GdAPzAagxKiDRworjY60T87d+oD4zYD3fZOo/w7kCz4Ug5aUxp2ThuL5c0k00eG2JUKXHGtbZl3enph0u4aGrL9k1nmXIl/6MYPUlDW7sxXHYlWYAGWtz681DKncdoL4mpUl6Y/o3yKsR/g5f+azNzMhmOdnm3a3sAO4XPFwMgLVSYb0vf7RYmHgtxgqYYQ7J66lkeeBSJkwbFM2DwCMY1zX5EpF/4hKzYSgRS+NxRgUiuaZME8i3hJ33M20AtRwAzsQpXBxOFGmR0tVfmP4SbegsgVWL3iksmK6/XF8fGcBWngNy+XM4TQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(23010399003)(376014)(36860700016)(56012099006)(22082099003)(18002099003)(10067099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	KVS8oiOCMH3xpZtMkUSZc9x3POinSAFi+6Ku89qY1YVFEAQohZ61N9paTv0T7dzJZ+UI7Q+B56D3kYHd8XYkeBt82cY88BWt5pGU+8iS81EbSc7L1Zz7jEkD8ym9CQPKOJK/yYApB9ME6yKA9GUQinKI2cAAapMQXxJdEKCo1a7hR8HGzW/EVptb7ewce1L54vfwc+PtYHVZxpyRmxnRZUEGKsRFRsGtVC49IlgonFlLlhSA+Cx4tEPGTAxbdtMET5N/EDiJcXTLzIBnWDD0pyxIAJJFpbikbfXGy6rElnuihwM8I/1XUk2u7uL4RIVI+F5q6zI3Cv2mF+vA7FSU3ycnrJ0yJmo86ekavmUbALCDtWSM668u/QYUuYreOZt609qbFlT1o8us7ejM3KDr4RSV4z8kv2LT6ikj92bLvHun1Jnt/NjF+2pzDNSDfgoF
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 14:21:02.0556
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e8cfa599-7c11-4b55-5e7b-08df09c6952f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN6PEPF0000006F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4034

amd_mce_usable_address() reads the per-CPU smca_banks array at index
m->bank on the running CPU. The index is not checked, and the bank
belongs to m->extcpu, not to whichever CPU is decoding.

m->bank is unbounded here. apei_mce_report_mem_error() sets it to -1,
which is 255 in the u8 field, and apei_smca_report_x86_error() takes it
from a firmware BERT record. Both reach this function through the
decoder chain, which runs from a workqueue on any CPU. Bank counts
differ per CPU on SMCA systems. So the read can land past the end of
the array, or on a CPU where that bank means something else.

Use m->extcpu for both the bound and the lookup.

Fixes: 821f5fe4dbcb ("x86/mce: Add support for physical address valid bit")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-5
Signed-off-by: Yazen Ghannam <yazen.ghannam@amd.com>
---
 arch/x86/kernel/cpu/mce/amd.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kernel/cpu/mce/amd.c b/arch/x86/kernel/cpu/mce/amd.c
index f916fb4c5d13..e6542e00dc5a 100644
--- a/arch/x86/kernel/cpu/mce/amd.c
+++ b/arch/x86/kernel/cpu/mce/amd.c
@@ -837,7 +837,8 @@ bool amd_mce_usable_address(struct mce *m)
 			return false;
 	}
 
-	if (this_cpu_ptr(smca_banks)[m->bank].paddrv)
+	if (m->bank < per_cpu(mce_num_banks, m->extcpu) &&
+	    per_cpu(smca_banks, m->extcpu)[m->bank].paddrv)
 		return m->status & MCI_STATUS_PADDRV;
 
 	/* Check poison bit for all other bank types. */
-- 
2.43.0

