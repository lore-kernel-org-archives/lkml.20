Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.62.37
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793928437;
	b=4+jabtcdSJDRalbkgzLW9xb2e49fhs9F0MGUyZfcNytDo9irHxCCiEPVP3GkIp05Ggd/
	 s7YDBBQ2yp1tit2NZCGwJHXIR2tYc3I5K/YyZLnBBeYBJiBrpA5jGrFdUCc6IT4NboizX
	 KTvjSFR+8z0xEfl1qCqd9A1g2k7rkADdkAxGEOwIxSMhHGLByPXEWdiX6QhTf2tPkER0+
	 YFR2fMe7+6R5nxhDZ2FYMiqywdRkJqEb/ADt4uyS10lPoIcsKn4EbUXUNY2iOS/5yJjyg
	 7S9h/rX4e8fGFHCWeXFxDL9UbyBHC2O+TX3RkJHyXeuU6Y3peJy6mt4pvEJvNTB6mrA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793928437;
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
	bh=FoY4JLK+WVtCsOFg5MfrVWfhHjHf85oH/xHelWXxiYI=;
	b=iN1TSqKadizNZjkeHBtMNg5HYdnM/n/0OmiOmmSeX7n8BCtyD3RkgrePg+uiG3gG9hq1
	 3SwJvgxC9M0A0RXJQDDNSBKK6kQT3zHNjcfOo+6X+tHwtY5ll17luFgOlykIlQ1Kcl9XQ
	 SU8w99BdAqOnXd9KnmBw+DP1Be13AW6l7TLogABh7jAf/GSmRA2LuRDuQQexk5g4z9TrP
	 1dKeCInx2TYYFKBK6QYHt/8IWMju8xPeS2rxkdaFs0u9RInEVRlHPG9B47tdDTqF4V1rn
	 JdyVfuuxSchaP0N+cPP2cNux8JIE1qPNYc+3xc8LVGhEWHJRcEZqrMbRJEMRJSkPF9g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=SkF1FYiG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.62.37
Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011037.outbound.protection.outlook.com [52.101.62.37])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B08A3606A31B
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 01:27:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B08A3606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=SkF1FYiG
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kHaVeQADp6RqCnVG7y6r4QEUxptGRN3VvqRmHVOt65fmf7BReINc8/2n4oalVGjnQd0ic5ZlksSX4VF+F7jYVsH8U0BXqx7Q+eOpCs6F9eL1tyxyI7NWbMxlReuiXAmN924cPkJGmAiPlgs7LX9XFIkw1ch1KSfwGMtmN2mQxm0Zrj5Np8Lo9roO9djBJ2YYnBjowsCn2PvndsvZWRGS2wWD6eCRp0L37XCdxbvEfB+2lHUu9U2R1AYEG0E53lkMx72P8okYDaNQ5gtpRf+j9Bgb73ek1xwwVfDqTsWjqLWFKFuLzzeIAXbNM3ShO58Pj6XhQ6mJM5alDT6hJLSA6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FoY4JLK+WVtCsOFg5MfrVWfhHjHf85oH/xHelWXxiYI=;
 b=qQU580bxrMSpQUmMczz6BliQYYdBWdOs3+VB6Lw5jXBd9/LQZ85v4Bc9ab7xatfIpoLN7o01SES0UdGTRjZ4wEtNm/XZ9gn1N+sqBEme8QBFCv8mhpfFxZUzarOXn7cqgOQgCFfxMkVAllU7/HSiLAVVd9ZdZ06nP2nYyixvLZsZqHRkOXevoLdXhG5W6JSe8nFeGxwEGgMGUl4mdnG8TgTqmu2iAPlahshaP+fQXnrQXusgumrpaP1cU3wBUfkkhYgbk82T4MfKDqwX/BQ7kZNSIKfVxmEmk+avloClFYW251lJS248Ontc9K1yG8L65Vhut1BIzlhM+rSIatDYBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FoY4JLK+WVtCsOFg5MfrVWfhHjHf85oH/xHelWXxiYI=;
 b=SkF1FYiGbwsl5m4/NarHv/W+CYnPS6DTEvHW5ZqU1qbylheoRp4ZDGiytl+UwqYci9Le71IYbrLVh5oIkfo6RdWsnmgR+dsqfo+7JAT86KlIwRdZ4Uknzr7XltITe0LYwRJE2KhNPnFpq0vvGu1bo2JoqdBihFSwSqGqAIwayL8=
Received: from CH0PR03CA0374.namprd03.prod.outlook.com (2603:10b6:610:119::34)
 by CH3PR12MB8851.namprd12.prod.outlook.com (2603:10b6:610:180::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Fri, 6 Nov
 2026 01:26:52 +0000
Received: from MN1PEPF00079401.namprd05.prod.outlook.com
 (2603:10b6:610:119:cafe::39) by CH0PR03CA0374.outlook.office365.com
 (2603:10b6:610:119::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Fri, 6
 Nov 2026 01:26:52 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF00079401.mail.protection.outlook.com (10.167.249.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 6 Nov 2026 01:26:51 +0000
Received: from purico-9dcchost.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Thu, 5 Nov
 2026 19:26:49 -0600
From: Melody Wang <huibo.wang@amd.com>
To: <x86@kernel.org>
CC: LKML <linux-kernel@vger.kernel.org>, Tom Lendacky
	<thomas.lendacky@amd.com>, <ardb@kernel.org>, Melody Wang
	<huibo.wang@amd.com>
Subject: [PATCH v6 5/7] x86/sev: Register Alternate Injection protocol during OVMF boot
Date: Fri, 6 Nov 2026 01:25:31 +0000
Message-ID: <bc08967cc41dd4454c75e9315e37dbe34225e258.1793926736.git.huibo.wang@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1793926736.git.huibo.wang@amd.com>
References: <cover.1793926736.git.huibo.wang@amd.com>
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
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF00079401:EE_|CH3PR12MB8851:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a839fcf-c5fb-4c81-6a8c-08df3ba50932
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|36860700016|82310400026|261026140227099003|261021123027099003|11063799006|5023799004|56012099006|261021121427099003|261022105027099003|261022075727099003|261009223027099003|261028144727099003|261102123227099003|18002099003|22082099003|6133799003|10067099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	N6u+JMHZKJW2utWzuDdPi1klnZ0LGEvXvlet4rGn7cAT/V9FAcKxHzofW8QYfvJ1ajyvs1FlgUIbfL3CG1HlP9O23zwusUaRiqrlA8fcrJAz9FxIelPsjNzemvbI7uwOkCkOlj2bKMqgT0p7/+cKiBZd9hbGzt4mSy/23gBumBezlWJXdY7fj36hShxr7Yahtr5SsZ4aKCPboyvpEvN3C6wrjIGyX6Y1KN0cWYTaj0QZssoscSuiMKHVXgto/Ds2Os3Mw6u7x/UZ+3hmwFIxCZC8mS70lJt5AdhnoexNpmAW9ngFhDRefdvXbvujXggdn16AOkbuu1n9mqOElXrpVhY6iWySmXjLyXbzGGvrY8CqSuLxBr4Pn0iohCKyxoOLs075eBvQWz+gLEbJK0Zc879HcbDtd4zgGVWt+/lkbotGmcSNbscJkoEW8hxMxPgS7Kbu0vPTtPmhPhsxKXvrZaa4/SdI5SnHTV+AuMF4U3caelzf8niW2E7Ogt+fWlmzSC3EA5WNUqqucUVx9LCEGmmK9LmHzO7LWLKm7kynbzX/y+eEtif0Me1djogdOZvDQ17dGvhSRLmOvQ4uSoCgtCcgns/EQ1guv8rO1heIj5Xs++kDxwn1NBkRXMKGv9ITckRddGc+Am5O63/j90rir7GFZVK6zKxYxz4fz3n/Cni73oJh7SALZmzL6qmJ+Lk6KAmuhXwh2TkftYcxfnq6Og==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(36860700016)(82310400026)(261026140227099003)(261021123027099003)(11063799006)(5023799004)(56012099006)(261021121427099003)(261022105027099003)(261022075727099003)(261009223027099003)(261028144727099003)(261102123227099003)(18002099003)(22082099003)(6133799003)(10067099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ifDNGkAr9P+mGPiuQkW5r39EWhD4eXhDmBmT2vqsDx+IpujbLPr8DHvKTMiRXJsT+90P3oozYO/pqSE0GHYxQrr3hc15S+MjAudEDJE9aiVDJhdYjf9//Suxb7TvD4wymv18nwhWIBNkp0w0aM8pDYu0hBgBQZmfFSosQI3gmGSIh0WuhRQrVQMuNhXwGalEFPX6OyHRA/hxEKlpz5KQQuma7RiK7d9An6JIH4NM+qZqnWgagrja+SJkgQZWU4Gh2rrAE9Al5pQibc7A2G4nR2oUQ9Qdgc2nXUXieJk0MyNFUaFHRqSvkT5A+xdTio/jjp7TIOheqJkQ0gXhQ2LVsa+zJM4+jvajokPiytJxg+/1DMscQ2zEIVqaWj+k7+qbq/vW7nQ4vNAmxb/Y6FQxlhvbUBY9KFE0HKYdQJ+voy/aSPiTpkKRIMVhyo+rGL34
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 01:26:51.9394
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a839fcf-c5fb-4c81-6a8c-08df3ba50932
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF00079401.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8851

The SVSM provides the SVSM_APIC_CONFIG_EMULATION protocol to register
and deregister Alternate Injection. This configuration must be completed
before ExitBootServices() is called. Therefore, OVMF needs to invoke
this protocol early to set up Alternate Injection for SEV-SNP guests.

Implement this registration by default for guests that have SEV-SNP
Alternate Injection enabled.

Signed-off-by: Melody Wang <huibo.wang@amd.com>
---
 drivers/firmware/efi/libstub/efistub.h  | 11 ++++++++
 drivers/firmware/efi/libstub/x86-stub.c | 36 ++++++++++++++++++++++++-
 include/linux/efi.h                     |  2 ++
 3 files changed, 48 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/efi/libstub/efistub.h b/drivers/firmware/efi/libstub/efistub.h
index f5eec8c12894..edc6c4908faa 100644
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
index a2f193da9bde..878f61cd6fab 100644
--- a/drivers/firmware/efi/libstub/x86-stub.c
+++ b/drivers/firmware/efi/libstub/x86-stub.c
@@ -786,6 +786,39 @@ static efi_status_t exit_boot(struct boot_params *boot_params, void *handle)
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
@@ -796,7 +829,8 @@ static bool sev_prepare(void)
 			unsupported);
 		return false;
 	}
-	return true;
+
+	return svsm_register_alt_inj();
 }
 
 static void efi_get_seed(void *seed, int size)
diff --git a/include/linux/efi.h b/include/linux/efi.h
index cc1df1577d5f..8545196ecaa3 100644
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

