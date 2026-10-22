Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.19
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792643228;
	b=VIATUGa8M96ot6u/3S3wuSOlkRipNb7ZlwFLyQt5zbfFCFJEYsg/zcHc6Yz4/5qYbG/G
	 xRMUlaVKwoPimBy2oAo+oSlEVFCa4nE0FBINObCB74LE5YqekBJlVGEOXuqR/dmNZ2mHS
	 8QsGtq7b6X0DjkXHAuuIfXr59FjOkwYMqhCBHPt3R73YTLYMUuE3euUjqyp/VdaqjvtG6
	 jYA4oHZAMWXyuo37UZYctVi9wV/htahuaHFQqf1FXHv23qLLoKkndECGyox724AcQgFnC
	 Tf2MmEOQlWNerTU4pVYvbhgoC/f1N0qku480u7yMrM4FX7BJxwSMLvZmndlky0CUMcQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792643228;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy:X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=aLx705kChW82zgLANDJw+F7ZMmfAUSz38thiOc2MNok=;
	b=2uzZsYyhWbjVdsJKhJs5pACyACT+edUTnJWg1iaVNH7GjPPLvyYKGCDo7OWx1nsTCjK4
	 oIx6l3vLhYWl3VThb/vw0q7OnGnG+tzDxaMAm4rnNTFYGuZAs1iuYWz1ztIZoY1A3RVMx
	 qsNaRjZpAoHz/3UlrYifaaaHKOfUJGCx7svJxHhwYBcNgtw2efTc/WCo9u4HKtMmoCKcc
	 mAogqrLU8Gt926D156iGH7n0DOiIPe+TanFjh/oNXcReFLKFTPYXtwFI+kimNy8O54ap6
	 FsWuniHgI5BLlStApYkRff9HSgyI6gVlIUxJ9J6m31xIqP5Rv+D+m3SKEqM4B7ykuwQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Vic1ph+M;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.19
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013019.outbound.protection.outlook.com [40.93.196.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 466EA606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 04:27:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 466EA606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Vic1ph+M
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GDAgjI2xj5oWKpAYXT2pbanxnYJ69ACUZTuWs+pNUXzqbo/UQRxdBuqWcDmKB76mNDQfZGYSi9j6i/bQjnSCGRM6Wig5++KnGgmV8Ye2pQ9qIV4eXhrw/m1+cN1ZVwpijjweNOT+w5T3l8SjKf9ZYs71VaTGiftc2plMg7KjqPY0//0JWwwrE/H5wBfetZ9yVV/LMGh3sc3/jjn/8Lk8DdQ9DYZXMgGBc05Rln6uYhA2KE/CTnfsLYuumKV32+Sf8OEpr0CP7Gie/1Pc7jCN6OMkIUmMUqfXDR4KUaWjP2uT24Btr0JnsjjFCIQPadl23TfHDBNxlQhAfrB87iyxTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aLx705kChW82zgLANDJw+F7ZMmfAUSz38thiOc2MNok=;
 b=t9ytSwiLLFH1JMHk/Vz7bxuMhK2slf9hfYQeowFri6vTCfZ9jHCBLDeroY8QtNYNJxObYGdOs6+sJFE05gtoZBiTW5lM+pKmSOFw4U2sKPgO2tLognggWP7p7G5/Mh1zoLjM1KUA/CZ1NlH5la3NYDQLai7RSxQkHwsVFvFEq+L91A/AAWSxxWGs/HAOorKJ7mNIR+/YAEFftXlmeBipAmc18Bg5fgHgXrC2ymXVBJWlhUjtOaYkmPsvjhpeYW32oIvkWB5yOIsCYuvuwnhCddKb3QUQA5CjG+3gsKSNZcD/27CPCNseK5qhCKHMM1NhuE40m1uHiGf0Xw49eBQlnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aLx705kChW82zgLANDJw+F7ZMmfAUSz38thiOc2MNok=;
 b=Vic1ph+MsWVXachNtHBRSkr20MDHp7wtlOCZ7vGjx720F7vwSGjyTQetGqorUhLhSBKT7KRjWEOH/u4QArpKEA8GXk4FYzS9v556wlsbOATTpPYlh1gegwDmu6sT5OUXvjmYaXOYl3mgke5yk6q6ZOS3KwieqxgtVvy/78zQMe0=
Received: from SJ0PR13CA0183.namprd13.prod.outlook.com (2603:10b6:a03:2c3::8)
 by DM4PR12MB8498.namprd12.prod.outlook.com (2603:10b6:8:183::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Thu, 22 Oct
 2026 04:27:03 +0000
Received: from SJ5PEPF000001E9.namprd05.prod.outlook.com
 (2603:10b6:a03:2c3:cafe::83) by SJ0PR13CA0183.outlook.office365.com
 (2603:10b6:a03:2c3::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.17 via Frontend Transport; Thu,
 22 Oct 2026 04:27:03 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001E9.mail.protection.outlook.com (10.167.242.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Thu, 22 Oct 2026 04:27:03 +0000
Received: from purico-9dcchost.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 21 Oct
 2026 23:27:02 -0500
From: Melody Wang <huibo.wang@amd.com>
To: <x86@kernel.org>
CC: LKML <linux-kernel@vger.kernel.org>, Tom Lendacky
	<thomas.lendacky@amd.com>, <ardb@kernel.org>, Melody Wang
	<huibo.wang@amd.com>
Subject: [PATCH v5 5/7] x86/sev: Register the guest with the SVSM APIC protocol
Date: Thu, 22 Oct 2026 04:25:41 +0000
Message-ID: <4d3ac6f22e1ad5e0b3f72557820e119ffae69fd7.1792206487.git.huibo.wang@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1792206487.git.huibo.wang@amd.com>
References: <cover.1792206487.git.huibo.wang@amd.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001E9:EE_|DM4PR12MB8498:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b2b59e1-640f-4314-e687-08df2ff4b90b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|36860700016|1800799024|376014|10067099003|22082099003|18002099003|261021121427099003|3023799007|261021123027099003|11063799006|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	6MbXHqP849Bo5QMXZXgLVazrNJlVSmSMeRlAW5/1hjogQljxy3YuJe7n6LZgUVG+XpkwrYFBCIaaNJFCl3fwnsAW4Za6lDJeGV3neN5d/f82G+Jg142OEvhRb6455PkGQ767gpiBfvqmrdZLuCIAhPdPq+nYhmR86MYk0qNNH3agF3K5fAos3vMkUsriGKL/kFMpoUh5wVrQrmHK24BsyzMeU3TzTArFBVhzya3lRmv9Y/eFqq8g/8Rd5KNhTylqfURG2n3Kwt/vTabqtcs2/Pvh4vHWRLgeQzTkbUGUhKtatHxE1LdyBpOxk0msG65wI3a0Ue9zY3yY/4eOY5DO8ldC6yyl8PQ6CqERSeclz/87o+mSA9KwZgpfuHHrrTtp65gtkenbjvKEOe38oQtjCa4pB3g8h6dFvw4rfKrslq9orLiM26z1xeSkvnLnWodnlv3YM8I3BJBXrzLsrRyi+Fn+QJ2Y/mUs+zMmDgKMLkSM/raL0IpiyBn1qCsGj7U+xxt1UUbM/teEQdu9O1TCPkS/RLqWqtrllF0v7mruGhEqfvWPAO0BzRrl6YAwhyE5nRj2/46AJugtSxDpBQB1p/bMKajv761S+f3EaYDQdEYqNMFbfGINN2ydRWSvD3LigpAh2E3+oFrjpN/9RapUHqzeCCFXf7BiR10kkrOys1FQIGVjh7u+iQkmFx5EJ0bEfKYkjFzjhN78DyzVSy8DYA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(1800799024)(376014)(10067099003)(22082099003)(18002099003)(261021121427099003)(3023799007)(261021123027099003)(11063799006)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	BNi4S1l6yOHLAZ1kUg52iMzLCYMIuKTMj0RczgtiO5p7GCjtknONRjsAgYAvMDnAA4jNG1ZWg4b1ORpuCFvII9r0BZqmYeELTnuRAvD+sI4DXKpyftKq6z+2wrbIANdXh68jH4jfGtsSB8Cf5iDmDkOwdb6hXEmnYz/nrZ0xNxD7fVDe+Epe72MI1Rab0euVfMWDG6gtQR4yyQ52YVz+uNBHeIragrPRq03mb0uf11ompDy1YhD6p5Jdbgzu+150W62fjFYYH9kGS/ZFLLhtSZKuF4OqSFqfTXyo7ikz0ISmwRWA9bHqymkUCulF3EUOksGhoCjqJKR1ppk0cB5WzqHJ/vDaynPj2pss4b1LwSgcO2JNFnj1OaM+4xHG5u/FO/NdlOT/DR6yGHpgSWqtD4O6+uL4f/9ielRP/iGVqGl+CnCxbsqVXVau6DU1iuvG
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 04:27:03.1964
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b2b59e1-640f-4314-e687-08df2ff4b90b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001E9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8498

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
 drivers/firmware/efi/libstub/x86-stub.c | 36 ++++++++++++++++++++++++-
 include/linux/efi.h                     |  2 ++
 5 files changed, 50 insertions(+), 3 deletions(-)

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
index 2a1fa773d241..10e869796c7d 100644
--- a/drivers/firmware/efi/libstub/x86-stub.c
+++ b/drivers/firmware/efi/libstub/x86-stub.c
@@ -783,6 +783,39 @@ static efi_status_t exit_boot(struct boot_params *boot_params, void *handle)
 	return EFI_SUCCESS;
 }
 
+/*
+ * When the guest is running at VMPL2 with Alternate Injection enabled,
+ * register Alternate Injection before ExitBootServices().
+ *
+ * Return true in the first conditional to mean that this is not an Alternate
+ * Injection guest and boot can continue. If it is an Alternate Injection guest,
+ * both failure to locate the protocol and to register it, means fail the boot.
+ */
+static bool svsm_register_alt_inj(void)
+{
+	efi_guid_t alt_inj_proto = OVMF_SEV_ALT_INJ_REGISTER_PROTOCOL_GUID;
+	sev_alt_inj_register_protocol_t *proto;
+	efi_status_t status;
+
+	if (!early_is_sevsnp_guest() || !snp_vmpl ||
+	    !(sev_get_status() & MSR_AMD64_SNP_ALTERNATE_INJ))
+		return true;
+
+	status = efi_bs_call(locate_protocol, &alt_inj_proto, NULL, (void **)&proto);
+	if (status != EFI_SUCCESS) {
+		efi_err("Alternate Injection registration protocol not exist\n");
+		return false;
+	}
+
+	status = efi_call_proto(proto, sev_register_alt_inj);
+	if (status != EFI_SUCCESS) {
+		efi_err("Alternate Injection registration protocol failed\n");
+		return false;
+	}
+
+	return true;
+}
+
 static bool sev_prepare(void)
 {
 	u64 unsupported;
@@ -793,7 +826,8 @@ static bool sev_prepare(void)
 			unsupported);
 		return false;
 	}
-	return true;
+
+	return svsm_register_alt_inj();
 }
 
 static void efi_get_seed(void *seed, int size)
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

