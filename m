Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010011.outbound.protection.outlook.com [52.101.193.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 998F02BDC13
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 00:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789347540; cv=fail; b=JyWPKkFFVV9cW/54DhXawm43r6IegaU8SJ2w6pXafa7P27mQkP1hJkWl06wJW/Smnq/WVJiUDYLZPhVjJkDdMiOHR9uYl+0CktcTGgwy7HT5NihPSp4wwMgQUZwo3p2S+H8MZkPomJEPWHiiM8wEWuscc7W8tvLur6M6d8Qe9zE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789347540; c=relaxed/simple;
	bh=wrw8bIdJK7PWd8p9s1jwn/sVd7UElvLI4SNwAs6GtVs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IdYJJ+xmKbhpD7u1zw4UkoX26O0VeTE/X5IJzK+k79fLWt31ZBkkDZCXvgAuiIKeOSqV96FMUAzmtt01HoYsuD/Kz9vt52XAPdYvPyawvTOEhojuEQdh0dEgbxp1/Tcs/UDeHinpESCWBL1fOISHo7OzKobGsBdDsDgmWdeuOrg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=gi6AkIHU; arc=fail smtp.client-ip=52.101.193.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="gi6AkIHU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X5pxd+bBXkGwdB03U8rJkSQiXndsXTM9WgZbcnff/zrph0jyZaMu9dzupF7B6gWIw0J2m6YdKQHEu2qHP2yyzADWoARiDtj6UYyOhk2UuuZ7EKCOXZ3IdTClI6OtomvJC3ai71d0zO+O1AL5A0WWDg5GKea47s22le2HuinTi65PuXRwxEbB2zGzeyjhD2YQkSTbf5vBnNg6mrNFikjvq4LySK3/nCz0+XmoLs+kspLRzpb7ZtbE3yUy+zBfbK9m8EYaxPACgLvtRoKqFpcUbHorSsRUvTR92NiLyzfTTyavvFW28sC0UykuIp+xl1U6/FdgzAXoYkca7i4FJMnMlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F5Fz2Zmp+9AHV4nbnFVrEGGH75HIbz/LlCXmN+Ph1xI=;
 b=tKGp/flVGQdhfZdgOgezgDEKOvYVUr6m/8y3XYYZlxw7u0nQazXpRBqAkZ1SuVFqdJLSGctZdWi+68rgwG/lsJ6Z1+0uE3xcphtxYG6vuK2orPIkV3XALtscXZ5RrbWRAXMoWZtemeJ+gTh1UEMyzg5/U3xEDx3ilWlLTikywnEX1RWTWBml47Co7lB+bEgGSC+zCr75yAIheor2auzVf0OO7fFkZtHJtWTpMxGPJVFs3vx1+Vh+CbN7JwgyCKofzEazr7nXtwSzP/rainRQThU42sGo2JZ1Z7cm9aPwWtREFOSVGoFqUdRT5BKvGhvZHONpXccthTbg95QDH3jJ9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F5Fz2Zmp+9AHV4nbnFVrEGGH75HIbz/LlCXmN+Ph1xI=;
 b=gi6AkIHUK96s5TTewItbBS6kqLfplNHY1CdVTbRGBbx+rmIpJq3ya57zrZMVsqHFmVVhXwCeiwxewtX7UyuIY+o6+b11mcXHtuyu4P9gwpIzPcdQamZy2R+o+PTtFSO0DuFOC5TBaBM25TvJuoYsCM8LbHbVFlpjALNXnmWX1dE=
Received: from PH7P221CA0054.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:33c::34)
 by DM3PR12MB9350.namprd12.prod.outlook.com (2603:10b6:8:1ae::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 00:58:53 +0000
Received: from BY1PEPF000264B0.namprd02.prod.outlook.com
 (2603:10b6:510:33c:cafe::9a) by PH7P221CA0054.outlook.office365.com
 (2603:10b6:510:33c::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.10 via Frontend Transport; Mon,
 14 Sep 2026 00:58:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BY1PEPF000264B0.mail.protection.outlook.com (10.167.242.119) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Mon, 14 Sep 2026 00:58:53 +0000
Received: from purico-9dcchost.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Sun, 13 Sep
 2026 19:58:52 -0500
From: Melody Wang <huibo.wang@amd.com>
To: <x86@kernel.org>
CC: LKML <linux-kernel@vger.kernel.org>, Tom Lendacky
	<thomas.lendacky@amd.com>, Melody Wang <huibo.wang@amd.com>
Subject: [PATCH v2 5/8] x86/sev: Add a function to contain all SEV-specific setup operations
Date: Mon, 14 Sep 2026 00:57:21 +0000
Message-ID: <8b651e078329193ef458757696ea54a314519427.1789345277.git.huibo.wang@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1789345277.git.huibo.wang@amd.com>
References: <cover.1789345277.git.huibo.wang@amd.com>
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
X-MS-TrafficTypeDiagnostic: BY1PEPF000264B0:EE_|DM3PR12MB9350:EE_
X-MS-Office365-Filtering-Correlation-Id: aecdff08-c3a2-436d-ed46-08df11fb58bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|82310400026|36860700016|22082099003|18002099003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	nApU2UrWzDkjXuvJ0g7eoELIU3NkUHnJmRytYl/BXYQ0LUd0l/v2lx5TAjJ0sJkobBI+7zEPPXKwSYw/RjOdPao0F4JTzRk3Mam6c2eFnsxAM/Xz8Q9G14N/ZTZT5R+AZh4RQ3xsb8RssHB2qPAwkIDQxOFKNQlXVBbrNkhv8+POEVE3jC4N1PnSWgcAwS3FAv9C14vRJ+stJJcO2hkGFiMBAqF+m/rX1SSce0aS7ZUm5hbcCExD+zoO9QFGHj5JaBYJZkyiPJ0sMjazEXJA4cb4dUSO9ZHgH8ELK9tdsoPzVBSzAD3MvQfm0X6S+FBfh8PBV5uhcGi/uBFK2bMLg/h9451s2GuXMXMtf//YwvdtDtyFxVDrFxDZhnQOXzGO/VCNYVtg5Lq3m9/WQlMiUBRcWzgb+MUfIYCJt25OBx8hBf5l0IWWB0KWFWzKzwTRT67+wDFDf/9ex4hkIunoPhy++Gs8OoMVSTa4RL1wiqVGSlb43VFH1jrt2g/6nUslhR2UjWqvkOFEjIcgF6yAbp01mIvL5hbJwTt/W+eoGa82pquf/ICqCIunpyeXo2jzholMivaN15qZCOeRfFmvOjaWzd1x0wklWwa8OTKJ8mqyjIdR4UtawI3eL07j9dK0zv2d8RShb5vYp6eiMcerUFzqLvZoG+V+JgVfFg6psp1TSy9rRZXW3/C6TQYjm4XpDVx7vqEMayBS7o3qBeCjJw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(82310400026)(36860700016)(22082099003)(18002099003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	U0Os1+k8jRx45asnCVn5Q3P/5dNZSIf+eono3SXNX+X8bBsbF4k3EiXnMhwzPmf1mIj/UPFD3jiTz4AdekuCsFAqy9vK1QRN/L1UrefbVto+fWRNCraUcgWL/ufpPFhtWPwQkA0fIyniqzLSgOSwYVKnzceGk/7SrlrLR5vX5yQDkxTBR++UZkRcWNQT1/oYlpRJ6DR9do8FfKIcwoxfupM+qf0My73Rr3CN25OXEjHOrHDcvsF5qw2jNK0uYSJsmt+UowuY0KPUzDX3uD3KwzR/nwlyuQsA4pY+bRCrH/6B2nzF33ck8lyJEqW7if79lHSTzjxtyyx5E318aru8urWFl5m2l8qN/U1UsCttCSnfFfNyLt7Fcv+/cQ/5jLyjNXQ7MEh1NQ6PKAL2hh52VPpo7KxOwTZGu+7JrdxdcVBpmyx5mXcvaW4A+ijHKX3h
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 00:58:53.1954
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aecdff08-c3a2-436d-ed46-08df11fb58bd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF000264B0.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9350

To make the code clean in the boot phase, add a sev_prepare() wrapper
which contains early SEV-specific checks in order to have all that code
in a single place.

No functional changes.

Signed-off-by: Melody Wang <huibo.wang@amd.com>
---
 arch/x86/boot/compressed/sev.c          | 11 +++++++++++
 arch/x86/include/asm/sev.h              |  3 +++
 drivers/firmware/efi/libstub/x86-stub.c | 17 +++--------------
 3 files changed, 17 insertions(+), 14 deletions(-)

diff --git a/arch/x86/boot/compressed/sev.c b/arch/x86/boot/compressed/sev.c
index fc2029746c50..c935a97f72e9 100644
--- a/arch/x86/boot/compressed/sev.c
+++ b/arch/x86/boot/compressed/sev.c
@@ -511,3 +511,14 @@ bool early_is_sevsnp_guest(void)
 	}
 	return true;
 }
+
+bool sev_prepare(void)
+{
+	u64 unsupported = snp_get_unsupported_features(sev_get_status());
+	if (unsupported) {
+		error("Unsupported SEV-SNP features detected\n");
+		return true;
+	}
+
+	return false;
+}
diff --git a/arch/x86/include/asm/sev.h b/arch/x86/include/asm/sev.h
index 3cb6c5d6a6e0..95f9a5084c45 100644
--- a/arch/x86/include/asm/sev.h
+++ b/arch/x86/include/asm/sev.h
@@ -605,6 +605,8 @@ static inline void sev_evict_cache(void *va, int npages)
 	}
 }
 
+bool sev_prepare(void);
+
 #else	/* !CONFIG_AMD_MEM_ENCRYPT */
 
 #define snp_vmpl 0
@@ -652,6 +654,7 @@ static inline enum es_result savic_register_gpa(u64 gpa) { return ES_UNSUPPORTED
 static inline enum es_result savic_unregister_gpa(u64 *gpa) { return ES_UNSUPPORTED; }
 static inline void sev_apic_ghcb_msr_write(u32 reg, u64 value) { }
 static inline u64 sev_apic_ghcb_msr_read(u32 reg) { return 0; }
+static inline bool sev_prepare(void) { return false; }
 
 #endif	/* CONFIG_AMD_MEM_ENCRYPT */
 
diff --git a/drivers/firmware/efi/libstub/x86-stub.c b/drivers/firmware/efi/libstub/x86-stub.c
index cef32e2c82d8..fae3a7dfb8b3 100644
--- a/drivers/firmware/efi/libstub/x86-stub.c
+++ b/drivers/firmware/efi/libstub/x86-stub.c
@@ -783,19 +783,6 @@ static efi_status_t exit_boot(struct boot_params *boot_params, void *handle)
 	return EFI_SUCCESS;
 }
 
-static bool have_unsupported_snp_features(void)
-{
-	u64 unsupported;
-
-	unsupported = snp_get_unsupported_features(sev_get_status());
-	if (unsupported) {
-		efi_err("Unsupported SEV-SNP features detected: 0x%llx\n",
-			unsupported);
-		return true;
-	}
-	return false;
-}
-
 static void efi_get_seed(void *seed, int size)
 {
 	efi_get_random_bytes(size, seed);
@@ -919,6 +906,7 @@ void __noreturn efi_stub_entry(efi_handle_t handle,
 	unsigned long kernel_entry;
 	struct setup_header *hdr;
 	efi_status_t status;
+	bool err;
 
 	efi_system_table = sys_table_arg;
 	/* Check if we were booted by the EFI firmware */
@@ -933,7 +921,8 @@ void __noreturn efi_stub_entry(efi_handle_t handle,
 
 	hdr = &boot_params->hdr;
 
-	if (have_unsupported_snp_features())
+	err = sev_prepare();
+	if (err)
 		efi_exit(handle, EFI_UNSUPPORTED);
 
 	if (IS_ENABLED(CONFIG_EFI_DXE_MEM_ATTRIBUTES)) {
-- 
2.43.0

