Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010071.outbound.protection.outlook.com [52.101.61.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C55414EC65A
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 17:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791913943; cv=fail; b=RBGUZClhlwbE4nawi+7meUh5zTeW4uEaqgzIYktXMFR0g2hBLeFOPSglblCH3WZsKCnJ307e0aI58bubhL99NP2/pNlDE0TjKKB4y6B4e9Pu6XVlloW6q/gKdZHQQWW4+cOxxgvD3Ms7HPc9H5qnO0RBR/f1aOmxpofZ0mf6nBI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791913943; c=relaxed/simple;
	bh=ffN1vNAAX3I8LzGe8j6m6k6cocVJUVKemSR77jWRWv4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tyKM/AOG2Ni9XlAxAp4LoMxjdzkZ/Z4yh82lGQS0K07OndM3JQjnRa2WMPishMJDYGpJmowL1ozacho9PxVscruZO0mDgQKdiVqqpcJ2DvENoADeFyHrhkf6mmF2MZSG4oTZp1zeyM53OD/EM/cnB3JbEsjQZwbOEvayd3fCwgg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=mXoMAWCo; arc=fail smtp.client-ip=52.101.61.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="mXoMAWCo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X+ryBCxjsKanb92gPllQcZVinOkERVmy96OU3XqxvmFV0/+w8i9V8/ZMKjymK/mi0lYs23UpBGNxp8lRMM5sj3FoD6knZ2CC0yW1JxJPFYFdyJG6g9Tp+nbfWXvV1jrWZOq06fZTgt68jweQtfChuZy8YKqiZqAQscmHXk4G1cDnbQZpKG1Ro3vFZPEI2upUcrqTdkfbAkNv2Tv8uhnzlhFQVPIS2zJC49U3ZGRQRE4klye7hlE1Drt7OaaG3u64WQzlAuYotzrWJr80GdbZg7yaLSCI8SbAM2UYmKcibIkPvLRFv1RX2bK4aw1CqNbhd6+fNyDXhqXmpAsD/rm9YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IFH4kCyRUp+TWvDziQnzdI1VG0xrXDJBX9XQfP6XJ24=;
 b=EqjK+GalDtWpjJXG+EZmAt/UCJgMqwA32a8sorJ6kxzTQn9KZwHOB2rUNTbby+AbFfOfq2nJVxEapeFt+GEU1TV7PXxZdPsDlv9XaxU4YcxXTfjnzr4E7aTfiHTxx/D3b8NQm1guz8qUE+bcAawWkcA0DfNMd8zpTEC73ZHJAzR6qY/aCT5sC9z+iKAxVCiLRXj2Cuyyjsju/71vfT3EZJZx8zOAjRgI5szv6OjGf3Tez7DdXmAfovG6EMN3yYIH7LkuVP/I/wOiKqJ/K2KICZzRzPjkFfd9wPnUXqtF2e1NEtyZZ3jMtJ75Ln3pwS5NHHspvHGQnKxCDxJy5P9v1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IFH4kCyRUp+TWvDziQnzdI1VG0xrXDJBX9XQfP6XJ24=;
 b=mXoMAWCo6wNxIICtjbh7uzWL5IHtXrzWjMgN8O6pxvLiB39gsel/Br4twaA5R+Tm4TIzc6CdGemars6JLMbUmd/d3hIL2NteL+RuD1szcBTD6pjk0NhqWTEW1+ctuKCjghYqhBBBaygdRnjCX3Zp7PyOKKUQ0xClTeaT9cIAuoE=
Received: from PH8PR22CA0017.namprd22.prod.outlook.com (2603:10b6:510:2d1::13)
 by DS4PR12MB360321.namprd12.prod.outlook.com (2603:10b6:8:4bf::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.12; Tue, 13 Oct
 2026 17:52:11 +0000
Received: from CY6PEPF00000049.namprd03.prod.outlook.com
 (2603:10b6:510:2d1:cafe::4e) by PH8PR22CA0017.outlook.office365.com
 (2603:10b6:510:2d1::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Tue,
 13 Oct 2026 17:52:11 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY6PEPF00000049.mail.protection.outlook.com (10.167.247.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Tue, 13 Oct 2026 17:52:11 +0000
Received: from purico-9dcchost.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Tue, 13 Oct
 2026 12:52:02 -0500
From: Melody Wang <huibo.wang@amd.com>
To: <x86@kernel.org>
CC: LKML <linux-kernel@vger.kernel.org>, Tom Lendacky
	<thomas.lendacky@amd.com>, <ardb@kernel.org>, Melody Wang
	<huibo.wang@amd.com>
Subject: [PATCH v4 5/7] x86/sev: Register the guest with the SVSM APIC protocol
Date: Tue, 13 Oct 2026 17:50:52 +0000
Message-ID: <5ae01ceb58a3fdf6ed9367e236d77b4a21a3363c.1791912902.git.huibo.wang@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY6PEPF00000049:EE_|DS4PR12MB360321:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d654aa8-e4f7-4fa7-b964-08df2952b517
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700016|1800799024|23010399003|22082099003|10067099003|3023799007|18002099003|11063799006|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	hkej9XMLhzgmCDsnDNpZ1b+FxUVywFmqtEtOpKyJwWFg/aahYtwPHEJSyTnh0Z2p4lYT0JyPZ6mHl9bnXuOmNHt7nUl+XxYNmzU0Av1UiZSRyccxcu+XqKgZYjoIe5Bo7WENGCOmvIpJmHpNBbkQBx3UrvW0P6uEt9DcvFLH4aTGvldKVL/evx+iBeJEyyu2/YOBFKqXTqwSIOC+ntWh9ftdUbQtDByDOAGBusV2ZX3hnSe4JTcDBmprxNFjoTQaQSXeIF7tai4Io8kCRQFplvyDjCP4Ml5ov4HkY9tKZPRS2wjODPjnU7Ivg6xtzLzTQyHiNINA3o6LSQhW/EIL40Da8z0r4Z8LHapP76SvB6+Kg/EgyT3NSARJ/thte3W0yM4HecdAPiXbhsOPIaKjH1H84rwtzBa9M40Xp1/e7hReDIZYVne/5tVDFNS7VnhAnL9dQ3aaFl4vZmqChTRlHJxg7HshuDx/QKkkTFpbefJsiBc1qOZvg6vUxS5sZvanPm6X2jE/QDg98Zy1e9PCPAjQVdfJN86NzJTmwbdZk5dbJx4sB39DCGgisFgLn6ER0ifT+Eu7BS5YavzqDBR1vTBFJT1VFKHzNwscmJnOlVdu3Yivg+++pLzMAcWU17kuMAUAtqUOuF6mD+rtmpypc3IW2/vJ9CClih9P59KqFfHwBl4JKOS20/S8OKWdR+2zq3g7BXj+5QHHbssVmQZ/cg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(1800799024)(23010399003)(22082099003)(10067099003)(3023799007)(18002099003)(11063799006)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	sQMJLjUUaueILQtAIsycVZaYZRx61PQghhyooQ++jsDTf+BnlBy/I+2zsJT+fzWXVMg4oyDguX0yKpXyQNPo00PrMRRfglJCno/IpLuKP6p2XmCDCtxfgfJZvYHj6ONFDhucokBHCajtTzKTLMZhheP+CtHzIByLz/Y09JBehGcA+4NyoMneWw/F9gqisWrJvhc9MVSuNf0rDG3N1x9aGt4Keb5z7GbC/7OftMQywG81bVapEED0QNbzJsTFsL1vMoEfFNibb25/Hs4ZS0A7msKJHKIQL6Afsu2E5n2GSNapefu/iDy45TKKBRKlZcN3D9v+pMoTMunEMcELx3aSA7GCIf1zphhgfdkdReqUc7KSHziKZkQropsvFPfRLlLua9SHKgfmhA/8z3ApFbZXZRQqBlt8kolQTwmf6lwIDPtkLuQzwS+hu90q8Mm4oHzR
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 17:52:11.1287
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d654aa8-e4f7-4fa7-b964-08df2952b517
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY6PEPF00000049.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB360321

The SVSM APIC protocol supports 5 calls. SVSM_APIC_CONFIGURE_EMULATION
(shortened to SVSM_APIC_CONFIG_EMULATION for brevity), call 1, provides
the controls whether the guest can make use of the SVSM APIC protocol.

Implement this call, and register Alternate Injection for the guest by
default.

Signed-off-by: Melody Wang <huibo.wang@amd.com>
---
 arch/x86/boot/compressed/sev.h          |  2 --
 arch/x86/include/asm/sev.h              |  2 ++
 drivers/firmware/efi/libstub/efistub.h  | 11 ++++++++
 drivers/firmware/efi/libstub/x86-stub.c | 34 +++++++++++++++++++++++++
 include/linux/efi.h                     |  2 ++
 5 files changed, 49 insertions(+), 2 deletions(-)

diff --git a/arch/x86/boot/compressed/sev.h b/arch/x86/boot/compressed/sev.h
index 22637b416b46..62e50c2e71ed 100644
--- a/arch/x86/boot/compressed/sev.h
+++ b/arch/x86/boot/compressed/sev.h
@@ -14,7 +14,6 @@
 
 void snp_accept_memory(phys_addr_t start, phys_addr_t end);
 u64 sev_get_status(void);
-bool early_is_sevsnp_guest(void);
 
 static inline u64 sev_es_rd_ghcb_msr(void)
 {
@@ -37,7 +36,6 @@ static inline void sev_es_wr_ghcb_msr(u64 val)
 
 static inline void snp_accept_memory(phys_addr_t start, phys_addr_t end) { }
 static inline u64 sev_get_status(void) { return 0; }
-static inline bool early_is_sevsnp_guest(void) { return false; }
 
 #endif
 
diff --git a/arch/x86/include/asm/sev.h b/arch/x86/include/asm/sev.h
index 93161b663d9b..13f2e8c009b4 100644
--- a/arch/x86/include/asm/sev.h
+++ b/arch/x86/include/asm/sev.h
@@ -471,6 +471,8 @@ static __always_inline void sev_es_nmi_complete(void)
 extern int __init sev_es_efi_map_ghcbs_cas(pgd_t *pgd);
 extern void sev_enable(struct boot_params *bp);
 
+bool early_is_sevsnp_guest(void);
+
 /*
  * RMPADJUST modifies the RMP permissions of a page of a lesser-
  * privileged (numerically higher) VMPL.
diff --git a/drivers/firmware/efi/libstub/efistub.h b/drivers/firmware/efi/libstub/efistub.h
index fd91fc15ec81..d65cdc8f2acd 100644
--- a/drivers/firmware/efi/libstub/efistub.h
+++ b/drivers/firmware/efi/libstub/efistub.h
@@ -177,6 +177,17 @@ void efi_set_u64_split(u64 data, u32 *lo, u32 *hi)
  */
 #define EFI_MMAP_NR_SLACK_SLOTS	32
 
+typedef union sev_alt_inj_register_protocol sev_alt_inj_register_protocol_t;
+union sev_alt_inj_register_protocol {
+	struct {
+		efi_status_t (__efiapi * sev_register_alt_inj)
+			(sev_alt_inj_register_protocol_t *);
+	};
+	struct {
+		u32 sev_register_alt_inj;
+	} mixed_mode;
+};
+
 typedef struct efi_generic_dev_path efi_device_path_protocol_t;
 
 union efi_device_path_to_text_protocol {
diff --git a/drivers/firmware/efi/libstub/x86-stub.c b/drivers/firmware/efi/libstub/x86-stub.c
index 2a1fa773d241..b6e58ade4162 100644
--- a/drivers/firmware/efi/libstub/x86-stub.c
+++ b/drivers/firmware/efi/libstub/x86-stub.c
@@ -783,6 +783,36 @@ static efi_status_t exit_boot(struct boot_params *boot_params, void *handle)
 	return EFI_SUCCESS;
 }
 
+/*
+ * When the guest is running at VMPL2 with Alternate Injection enabled,
+ * register Alternate Injection before ExitBootServices().
+ */
+static int svsm_register_alt_inj(void)
+{
+	efi_guid_t alt_inj_proto = OVMF_SEV_ALT_INJ_REGISTER_PROTOCOL_GUID;
+	sev_alt_inj_register_protocol_t *proto;
+	efi_status_t status;
+
+	if (early_is_sevsnp_guest() && snp_vmpl) {
+		if (!(sev_get_status() & MSR_AMD64_SNP_ALTERNATE_INJ))
+			return 0;
+	}
+
+	status = efi_bs_call(locate_protocol, &alt_inj_proto, NULL, (void **)&proto);
+	if (status != EFI_SUCCESS) {
+		efi_err("Alternate Injection registration protocol not exist\n");
+		return 1;
+	}
+
+	status = efi_call_proto(proto, sev_register_alt_inj);
+	if (status != EFI_SUCCESS) {
+		efi_err("Alternate Injection registration protocol failed\n");
+		return 2;
+	}
+
+	return 0;
+}
+
 static bool sev_prepare(void)
 {
 	u64 unsupported;
@@ -793,6 +823,10 @@ static bool sev_prepare(void)
 			unsupported);
 		return false;
 	}
+
+	if (svsm_register_alt_inj())
+		return false;
+
 	return true;
 }
 
diff --git a/include/linux/efi.h b/include/linux/efi.h
index aa15ff88539b..ebf7b4b9a292 100644
--- a/include/linux/efi.h
+++ b/include/linux/efi.h
@@ -444,6 +444,8 @@ void efi_native_runtime_setup(void);
 #define OVMF_SEV_MEMORY_ACCEPTANCE_PROTOCOL_GUID	EFI_GUID(0xc5a010fe, 0x38a7, 0x4531,  0x8a, 0x4a, 0x05, 0x00, 0xd2, 0xfd, 0x16, 0x49)
 #define OVMF_MEMORY_LOG_TABLE_GUID		EFI_GUID(0x95305139, 0xb20f, 0x4723,  0x84, 0x25, 0x62, 0x7c, 0x88, 0x8f, 0xf1, 0x21)
 
+#define OVMF_SEV_ALT_INJ_REGISTER_PROTOCOL_GUID		EFI_GUID(0x3cf00587, 0x2329, 0x4c44,  0xb1, 0x84, 0x8f, 0xd9, 0x87, 0x00, 0x42, 0xe0)
+
 typedef struct {
 	efi_guid_t guid;
 	u64 table;
-- 
2.43.0

