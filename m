Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012046.outbound.protection.outlook.com [40.107.200.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D0D252ED59
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 17:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791913924; cv=fail; b=ZfCCcHfU2xaF0TcyxNSi9LezDMEEyDrg6h/EIH2Xqq1zwa7DbVywvOzAU86RwuxOyx8ROcqpMmHakAJylATk+lUDA2nqKHM/7TLA22ZA0r0mpfzKm/4es+4IA9MUE6Ww/2VnsyAPqUlLlPtADKTOMIniriiIbel0/LsctGI4fYk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791913924; c=relaxed/simple;
	bh=eCR/yHQ/91BYZLNCaiDJ5rBTikNb6TPKbM7np8wqjKc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DxCgobPL599fAM3VPJFaDNQOYdFy6PP0zf4bClEBbRWWZHXK1SzIPvWCd8Sv6MHv/L9tss3oFfgyatvgGg2T7RuvFkmSwXIs4IWDNqKY0HocMqLHd9hEI3TrbFh0TElUUxr3rVnH4cq5QBeEl4rcj1Sa52yOoJBLwVzJ6TALLAA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=PcvMI/mj; arc=fail smtp.client-ip=40.107.200.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="PcvMI/mj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mo4sGqYg88r9bjN4AdSd6apR9DKxOuLfG60/rnPe56gb1dFoI4X8WTYyD11n8rMcouXAIb5xS+hBCK+rvbn7sMdIiAbh0megMpllAzb/PXsNubCFiMq6gAiHFDb/l0F7QWq2JhrgEawRai7SIWjemUfst5qrDT1epXoVcBtADbeJBcTFhxmtBtN0kC0VxATQO2kb3rxhvFYORSlgR+I2gtAO7Kg9pkJJOSyBWIO+JA9iPGYPZxgjjJD32M3oTJplLeYZuPbP5K1ZlmjxyZwFo1ExyoNf9CF+4LL8tvvdYjQYI4IUDPb9vSUKqTCKmHy++AY1IbEk2QivOLNccjUTtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QyrPU+9qb7FlzuMPTalwYRP4LzjdbPzuTGPIxXyilBE=;
 b=yZ8Jyjjr3n8q4O1XccMKYcaHPZ1GwBNreVzHOjClV9l1lXrnGNnxPOJyPRXHIMKUBkv2IGakP/sC5Ed2bkkWX6CYFX7YzVPuor7u+6qxkJ+0stJVAIKu+lv4pyPfVgSzNgclIbAv6PNEkmb4xP2+SgzQo+cksioJ9V2Z2LHNOAbmBbRVtn4UTsEad2EIiiXlMtL9WfZQcUOWH3aByclMA/CyzBwzCq9o3XdWFkTTEjiM/E5rV23GC0Y2jpNvI4gEyVrtrMnwCdTBkqeqgco0eohU6wNNW7QRVDEptmnCLdfFIM+9Xv8eJbRyqSHsmUEyePgvhBDiRXcPz9JJB183Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QyrPU+9qb7FlzuMPTalwYRP4LzjdbPzuTGPIxXyilBE=;
 b=PcvMI/mjtX0z4/GM1Q9UA1px4lXYbvJvwcKBf5+AMbqjBAWX3KDgYYp+C3xE5n4NRwGimOmw/vlkvblhAan+rnFdfaavqmXjC4ybAXIwxOVhUKJ6zzrGCUCtePFxI1KQ7wiAUziGYwEdmgyAZ7qlQNCITZ3ulZ5Su4lm/SyaUbM=
Received: from PH0PR07CA0044.namprd07.prod.outlook.com (2603:10b6:510:e::19)
 by PH7PR12MB6539.namprd12.prod.outlook.com (2603:10b6:510:1f0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Tue, 13 Oct
 2026 17:51:58 +0000
Received: from CY6PEPF0000004D.namprd03.prod.outlook.com
 (2603:10b6:510:e:cafe::8c) by PH0PR07CA0044.outlook.office365.com
 (2603:10b6:510:e::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.4 via Frontend Transport; Tue, 13
 Oct 2026 17:51:58 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY6PEPF0000004D.mail.protection.outlook.com (10.167.247.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Tue, 13 Oct 2026 17:51:57 +0000
Received: from purico-9dcchost.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Tue, 13 Oct
 2026 12:51:51 -0500
From: Melody Wang <huibo.wang@amd.com>
To: <x86@kernel.org>
CC: LKML <linux-kernel@vger.kernel.org>, Tom Lendacky
	<thomas.lendacky@amd.com>, <ardb@kernel.org>, Melody Wang
	<huibo.wang@amd.com>
Subject: [PATCH v4 4/7] x86/sev: Add a function to contain all SEV-specific setup operations
Date: Tue, 13 Oct 2026 17:50:51 +0000
Message-ID: <58bdcb5fef22cbd22ea7e11db11cf202bca6ba9a.1791912902.git.huibo.wang@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1791912902.git.huibo.wang@amd.com>
References: <cover.1791912902.git.huibo.wang@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY6PEPF0000004D:EE_|PH7PR12MB6539:EE_
X-MS-Office365-Filtering-Correlation-Id: 5eb75928-7ddd-4dd5-6e2e-08df2952ad30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700016|1800799024|23010399003|11063799006|56012099006|18002099003|22082099003|261009223027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	8vbE+xqzfjrxjWdT0SsBN/Tx4nKC1EHyIBztlNn7/BhAw4y/eLuvK2Z3oQeUsLChjlWc5N34UeRdHYulxyBtrMG42Qv0lp1ZZ6y3kCfS/GSJM3zrD/EncNuCAk05W0898tbzbOA39BfBlY8kHVb5ZXv4wlkH/6aMW7yDwjHeg5L4HgC1bx0ZiiZhqo7Q1fc/fC2qHEmi7OkeZtPZLRWQWx6b393XEEadlThxxQelCLj5gbuFo3bNCsTwD0h7ZUVxugKNPogBOZUCKTvLXFd/tk4s4+//sPx+GpTLq5WjjK+yYJFsgtF9No4GLbYHDZ0kfYDDae+Qiau3NNUxFzZa/6NfxXCyCa6My4hlBc4O5F88KT8h3FcZYCyXaj/AJEcfmn1fGbSyxUF/MyKLv7N1zHSQTxU3zQ+ZvkPBw4CRrSiRHUan5LthQSysc6M9Qy2ndxxplRDAIj1PvLVQ+qRW4IGNePUcGCwl7leyQJqvIifdzeEoF2GD4ZGcY+UPeoC9wQalQk+a/jAtB5LDJa59jTiCy8YsmfJ7BVzVTLFnTNqY6DmEy2zf0hqKUN5nUjSnYlewbcrPXW+4XxoZPNBuHmqIjv0WCqQJgtvonh5NcvZJrTnf0Yx6kASY8JyEz+tH4GbsShEUeZ0ARoOD2G14vMLwwaFwK2ZZnVHAn8POAVEySAFvau8g//QJ/WAJ4zYWTV9cW+AhP+08EOuTZO3LSg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(1800799024)(23010399003)(11063799006)(56012099006)(18002099003)(22082099003)(261009223027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	YXjkAwQouGoRVkXAluZS1mrb46bmhDdqS+hZHFhGXo2Z2a72c6fITrJZdV3lhOKhhdHYvyXhtCnSXFOUtFzqAOjIxLyzB4u1o4jOmRsAKQoqG3iZsJLu2q360Y/eqlE+HLGadEYiLZZCE11O6yhWyABZfJdOwxd4FgOggCmihNarK9MS5MOCImprH6sUdM+NgKWGdBcjmtR8WHV209m3iAVya1BC9QP//R+ie+bkbLb6lKcbFnskEahaFFI7LFuHRAUmVQYDvoqXXnCPxFp2IbH6Sxir0LynOXKb8PqC77FAUjNJHKklNu3HwNfiqPCN5KW6GfvU5oRZ1QzA87dPxiaYTtsd2hh9yMFhRZmoHdoBPWt9WUozCglS+WRGmUBP47GFS5iYSLv5ylhcWch1FR7ksGmK8AwKfGluLHSwSD3LRRhmyGRGqp4mug466rwZ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 17:51:57.8675
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5eb75928-7ddd-4dd5-6e2e-08df2952ad30
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY6PEPF0000004D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6539

To make the code clean in the boot phase, add a sev_prepare() wrapper
which contains early SEV-specific checks in order to have all that code
in a single place.

No functional changes.

Signed-off-by: Melody Wang <huibo.wang@amd.com>
---
 drivers/firmware/efi/libstub/x86-stub.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/firmware/efi/libstub/x86-stub.c b/drivers/firmware/efi/libstub/x86-stub.c
index cef32e2c82d8..2a1fa773d241 100644
--- a/drivers/firmware/efi/libstub/x86-stub.c
+++ b/drivers/firmware/efi/libstub/x86-stub.c
@@ -783,7 +783,7 @@ static efi_status_t exit_boot(struct boot_params *boot_params, void *handle)
 	return EFI_SUCCESS;
 }
 
-static bool have_unsupported_snp_features(void)
+static bool sev_prepare(void)
 {
 	u64 unsupported;
 
@@ -791,9 +791,9 @@ static bool have_unsupported_snp_features(void)
 	if (unsupported) {
 		efi_err("Unsupported SEV-SNP features detected: 0x%llx\n",
 			unsupported);
-		return true;
+		return false;
 	}
-	return false;
+	return true;
 }
 
 static void efi_get_seed(void *seed, int size)
@@ -933,7 +933,7 @@ void __noreturn efi_stub_entry(efi_handle_t handle,
 
 	hdr = &boot_params->hdr;
 
-	if (have_unsupported_snp_features())
+	if (!sev_prepare())
 		efi_exit(handle, EFI_UNSUPPORTED);
 
 	if (IS_ENABLED(CONFIG_EFI_DXE_MEM_ATTRIBUTES)) {
-- 
2.43.0

