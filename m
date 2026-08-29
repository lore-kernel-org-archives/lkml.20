Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011005.outbound.protection.outlook.com [52.101.62.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D797C125A0
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 03:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787974876; cv=fail; b=Lw9ienB4eH0EwiNpK5dkxVMV3CurQqWbWXjM88YzsUPzQjVX+yQ97Jc2xpCknRmF9lFFbeoFeKYh9L8u0s/8xsQuCAgmLGwgPd85/TmTbzc2WZji+xrOZ008m1d9EIMLKFSn8MHvXmB67FsYDLKQM6DpwwGumMXibVwKqxbwHcU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787974876; c=relaxed/simple;
	bh=wrw8bIdJK7PWd8p9s1jwn/sVd7UElvLI4SNwAs6GtVs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YQAve1Mjq6hgoHozKPS/zSVDELHAY/q/g0+9nDFI+uWUTel3d3TjBss5DVt6T9zQJR3DVTjcN2xCtcC9oLju9z84mhhbcnY0OPtPCBMOdw2Ypkx5zC/wu9EQ8ENAfP3xX7lb8AbKJQiOWlWCJSBnOrx7FBddToQ4xGmF9HKW8EM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=WZ3MbBSO; arc=fail smtp.client-ip=52.101.62.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="WZ3MbBSO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LRzfPC2IWvR2pK6Y0k5syN5WOFPU4/4rh6C06wOdd+6aBmWgoRR1+oIJJGdsWbSxO/l8UsSqwps8pIzkFpRRx0uTHzYPBTvNBR13EjfZq16zPbAi7uB70nEPdgSITU1nx3341D3iOqTFrv4nfLoLVVXGnrqWLQw0SZNoj8NYc+plhyFrXPOIpYkGwIoBPJnt51xmX5Of7hp/jTSL3YBA508Pq1TQSWBa/sZZVQ5JAYskRN/6ro/JPvWHm0Kd+NwiS0gK7o0pD9ka0xDIeR0ACxUjsMEI5g7Yw67XeePujvpj3VlryR7JmZ7BmCIr22DpzUyBViXUlhhP9ngmKyyG0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F5Fz2Zmp+9AHV4nbnFVrEGGH75HIbz/LlCXmN+Ph1xI=;
 b=kFhqSDxGd8zmmo41o0K2WHZGRYedKX+iqqN+oOcHVbR+9KaPyQ61hnbo2Ev9Zep0vkvhOTnZ2P+MLlecdpdBGXvtrSGLDGoPTZJC5HtGRpSZ1UX3hzyq5ucmU8m+EFEMrJ5NXFt6y/+DbtnkaEw1TTtpF5ejMb1hgMp8e1ChlyFTAntNmVvtor20IGf6o4e0dDVXU4Yd0TlLPQqmfIqnfwecBxKvzl31ceX4pA7eLLE5XX5AYgdUt0hr1PN3uyg6F/c7rETA7iV6WyYDR32SBGsIhBtVP4iTZW5mVpvz+7Z+7M0XyH0R0QLIrUUgHDhwmDxSwKP740sem4bp1f6uRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F5Fz2Zmp+9AHV4nbnFVrEGGH75HIbz/LlCXmN+Ph1xI=;
 b=WZ3MbBSOQ5T9198isWnNj7bfHYVulMkoXzZKXy26ydTiiGdeacWYCPKW8ahGb3XP14qvsbZ7dQEdstoY2/FltT6nSfuRM5zbhzbQZPO0lg5su3DZV+mg5cKbthETkILYaKhAe5yOyp7aMBo1rK2hWkH47U3eijKZQixDAJqbTLM=
Received: from BL1P223CA0027.NAMP223.PROD.OUTLOOK.COM (2603:10b6:208:2c4::32)
 by CY5PR12MB6154.namprd12.prod.outlook.com (2603:10b6:930:26::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.11; Sat, 29 Aug
 2026 03:41:07 +0000
Received: from BN3PEPF0000B36D.namprd21.prod.outlook.com
 (2603:10b6:208:2c4:cafe::21) by BL1P223CA0027.outlook.office365.com
 (2603:10b6:208:2c4::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.11 via Frontend Transport; Sat,
 29 Aug 2026 03:41:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF0000B36D.mail.protection.outlook.com (10.167.243.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.0 via Frontend Transport; Sat, 29 Aug 2026 03:41:07 +0000
Received: from purico-9dcchost.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 28 Aug
 2026 22:41:06 -0500
From: Melody Wang <huibo.wang@amd.com>
To: <x86@kernel.org>
CC: LKML <linux-kernel@vger.kernel.org>, Tom Lendacky
	<thomas.lendacky@amd.com>, Melody Wang <huibo.wang@amd.com>
Subject: [PATCH v1 5/8] x86/sev: Add a function to contain all SEV-specific setup operations
Date: Sat, 29 Aug 2026 03:39:43 +0000
Message-ID: <9f24b2d1cd0bfd0c658219a38840415515593f1c.1787973545.git.huibo.wang@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1787973545.git.huibo.wang@amd.com>
References: <cover.1787973545.git.huibo.wang@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B36D:EE_|CY5PR12MB6154:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c395f56-f918-40e4-63ac-08df057f5be5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|23010399003|1800799024|376014|22082099003|18002099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	/eo1uyapozu68VKI/EiHscJstF/LaGELWrqk0o9R7X8bgfeB0us0/xHF+YuAm/jEEexJbpecXg1SAMuM8pkTFgldBXoKAGc2jzlk81lqLKD/tjm5gKM6CoNn2umQr7eJsbJ2yKcL6Fxv5wuqC5FHbBWVN3rkO7VxPMjx6kBb2IypCo1wheRT/tPbKplRcg1E4d9wjQ8ffmxuyfItOtj0VONZbhf0ny/o0dQNx3AspY4dkOh9qv1afk0xFICZWqtLGclnZ6hGqHzPVvh+NI1lNHWbFmZS03UFax46Z2wHtKY+iGEPCB2oFJ9XzMzhR0NkFoEKjrzcqJCk4WnCV2CVu4MpylxmqTC2eog/mcPGiDLt0uWyRE4nw2KoYKNc3tNQeCl6h0rFgIgdtgQJQqbn15npfSGkrxIF3ISmTsHUvzNjZ1ojlA4OUMqNZd/+7ImH4Xjc3IJrMt4ktDGgKgDlQTSdRQrIoup4BkAAReJWOK85uDWzfVyORlLu5291mtHVurkDojav7Y1uZWNYidZtc5arGyKxmt4uZtYXEbzZJJw9h8dAPJytnJwvHDwN+eyHnMCqxjz7VJ7AsUgbz5Wk3cgckY6Vnn+PzBO97PLG8uXxoTQ2AFX18XBPD06prcDUfpVky18qHnBVqtuXoLTnCXMpu0tyqLtw4J0PN0UFSbnSQsP9pz/JrMYTi5djGblOTSFL76ErpuFsd9UefbvufQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(1800799024)(376014)(22082099003)(18002099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	0PJF9F3RBPQpkm21iuVbE4sCmkwEXYSIA2gNemZa8nOTjIuN9cAJow6/vCIPIc209eTi6gVOvFoaX7Iyqp7ijEbU2Uy99FLDHxR3aAKkDOjSm7uvgjGDeGFoQVkFc7zkabkTGVluUyzUtZtEiMN8NUEN0CpqGCd0S9Zy0ts4v98ON49ecAP/Xe0XkzErm2xi66UNyAUAqwM2jW0/38zyP5DRx4fyeq81D7y/MWA/gTo4/Sk4El2yFkyvPldFsD+Py9iP5NhK4KWdGLmHHazUWmqwSoL3mlC7DkkFx6aOxa/ag5wpC+nubvproRNh1oD+nhGzG7lq0qGo6B7PaXAaOqfKMAJOABsiMbtuOeD3pDSwZKl8zv5Xj5LVHXe6nUtRuGm8hIhfrNOm+1lzXRQ060ICyU7Ofoo92C2k0kZ8vzNoxwvMoQRRH8FgMaZ1PKyD
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2026 03:41:07.0214
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c395f56-f918-40e4-63ac-08df057f5be5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B36D.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6154

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

