Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010015.outbound.protection.outlook.com [52.101.46.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 596A523ED5E
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 00:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789347564; cv=fail; b=XfJDGxnTTqKQlC2C9GKKHyX/ECJgUqmVIPCecD/zIiwe5uVQz6H43jo9wypZvmQRopo7LRFrdnXKc/GqdOOM4DHHlqh5ixrnPlnhHBLBGaZO6BjydCiMJlTR66llikUYvPogPqVksSy5VqrkA/DYM6yBW/tO0p0F/7Jw8/Jus2o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789347564; c=relaxed/simple;
	bh=mji8UjzWmveGObiRKKtvNq+rlitb9VCTBsawRMQza6g=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cKJ+fGzYIQFKL4z+P/AkgDP7uIHnbkKZ1x0rdo+Ih6tpKlhuH8FeO5ChrQtX8NtRdCWYh+Q0wzAV/h1PZj6yL+mR4UUdlgwN7qBQQhrYR6YAhjszp0xf1BQAGA5GgQpFZZ2eo05Lv4LbxlEXMD76X0UGsBRwATDCZohqbtMUCkI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=gwAMBjsV; arc=fail smtp.client-ip=52.101.46.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="gwAMBjsV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xnz6BbGG4IC1kExv3K0+sroWa5c+nNKMR8Pjgpfc3PdkyP6L1huLQ4Wufa7vJhxhmHB1Lt1FpbFr3my6reeUAD8KSAdtaA7uduvRcL1HgcM+6KPRKG4DG1WgSVYD13zCz1lcrGgv6NEMknjQLjaFguN71Jtdv1s8XM/jag8nmDdDDLb9iSnjfbVpAeJ21od7cwseSRp7wiyoog4xo+5d5iDKbKzfP/mSM62WF6fdECJNc9mAqVsiAl9ctCv/jklHQV3Or3zTM6o70f+Gs23aaTJ0acHzerTT+njyEIyTqBi2/eUiDpCDIrFMFpqoctL2n3LOWXxXJKq6PT+pGHmCdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=my5IyNwOk1ErsWk/O7eRM3Xdpn7AZk8HSFJAr+mXMcU=;
 b=gZZzp9ctruEo2Q1P/U9ns3dYdUrg99jrzOhvhYdBDmJWDNAI03F5YvVsHHsR43QvGRw0QXUArCzw2po+/ZI7QqnJyZwDeUM2jgM/1LWBIK8h6YrO/jYkEqQji/FW+3XXmYB2Wdb08QTc2zsaOScjDZcYTSHND6xzilrJ+x+EV7H7BW/P5gy06x0noQbivKihU5gi2sdptkFXkbXPzNbVi1VsJNmTUP6+gNNVDpAJhefH9yrbPLDvSHnZwjNMHC2gKtwcWNW8iVQXr2Fa5+LdcIkFHL967EoOO20DGU3FwGb3suWkvujdJc7R3JbI34QqPg4kK8Ds3H2z+dwbKyA/Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=my5IyNwOk1ErsWk/O7eRM3Xdpn7AZk8HSFJAr+mXMcU=;
 b=gwAMBjsVe4BwGVD8J65Kb9+ORC85ZwJ/vq6Xm/vXfIeJCM31yanxomZQ5yjDNy7q1WvV18I8cV8RPwIqeLgQfjSjTALz5X8P4TFbcxvir2cye74TZ+WYwPFp1fYM7euIAvsLqwDm8lioD9NhEV58a5Y5Bs+VZAKNHucuZsdl+AA=
Received: from PH8PR07CA0041.namprd07.prod.outlook.com (2603:10b6:510:2cf::29)
 by IA0PPFAF883AE17.namprd12.prod.outlook.com (2603:10b6:20f:fc04::be1) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Mon, 14 Sep
 2026 00:59:20 +0000
Received: from BY1PEPF000264B4.namprd02.prod.outlook.com
 (2603:10b6:510:2cf:cafe::a5) by PH8PR07CA0041.outlook.office365.com
 (2603:10b6:510:2cf::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.11 via Frontend Transport; Mon,
 14 Sep 2026 00:59:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BY1PEPF000264B4.mail.protection.outlook.com (10.167.242.121) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Mon, 14 Sep 2026 00:59:19 +0000
Received: from purico-9dcchost.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Sun, 13 Sep
 2026 19:59:19 -0500
From: Melody Wang <huibo.wang@amd.com>
To: <x86@kernel.org>
CC: LKML <linux-kernel@vger.kernel.org>, Tom Lendacky
	<thomas.lendacky@amd.com>, Melody Wang <huibo.wang@amd.com>
Subject: [PATCH v2 7/8] x86/sev: Allow the guest to configure interrupt vectors for the hypervisor
Date: Mon, 14 Sep 2026 00:57:23 +0000
Message-ID: <2178729563ab8b65db276b0d59251f9e882fe4b0.1789345277.git.huibo.wang@amd.com>
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
X-MS-TrafficTypeDiagnostic: BY1PEPF000264B4:EE_|IA0PPFAF883AE17:EE_
X-MS-Office365-Filtering-Correlation-Id: 15dd4afd-2c3d-4cea-93d6-08df11fb6878
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|36860700016|376014|1800799024|22082099003|18002099003|10067099003|56012099006|3023799007|11063799006;
X-Microsoft-Antispam-Message-Info:
	9idkeswPogeJ/rBy4FEt57y6UQM18vr8YGTEzmM+ZKJNYyRyAi6WlrnIy19xzq2LROmzecEl19xhWcPIufDXmuixDgpucAwnQwxAx77jDjf1WBnN4xo1n1Q88Kio5XCIuqukFGf39cu80d+4N2yBMl8s7hmxvRS0kng7HQLMLM0LhS40MHnIFy7ov5rFVOtP3fkKiqpblVg5plLWWwYg7llT0nYpVFcopVHOh/BpwQ9m1w5G/1b7kE7s23pHeqHH7xJ5nL37FD8Svub59b9Qt1bf0EOPnx0hYPa6LHUR/LduiItv1FvYRyUqhXWJoXGEXebktFaFMulJJRQp5/oByKc1l+lyRVAxYBfvlY1pPyB++vAD+KiJyUo3AqaiB+y9qSyOsef+UKgk/28FjZV8wB7OBaP5KpVSl+JACZM3WqjTB9dsD7N8kYKmdIutn+eXZ8kbWIcSOh2Lrl7dtl8hyqeZmJIJtqwdJKoVFD1RhGEU0d+QcDvpobwRzMz6lJuXdaJkGOsJYrToNZhDc0OOpIwFcZCeBrLJtRoA32dC1h3eyRDMmuksp1VwFJYmprhY97j61uXGM6RYwYmo8CMUziFxFJye5g9XiCRMEpKh90pD9aU1BRgr/ZaEpsP3R/WHZnPHunfM6ooKIcCKJXlnH5RSKREGMlMTIg2Qi9ls90PJKWfGDn1qcfkPhIhWSzX0iuYUKI2/u9CKO1FVtxfsKA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(376014)(1800799024)(22082099003)(18002099003)(10067099003)(56012099006)(3023799007)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	n6zehR8evuXJqPgTJpK/5d/Xp8FpYMQ2dB1eoYgUPdK4JHPSvWrpA82SYP5GA/Dd7U1Rxku+0RyuX7vFoFwAmR4eGRiBxLwbejUCBvP0qJG1tGZulHWISdthFPJHw5BRjZD9MmzlsA0lBQGJUHAykQi0kSdhoATtrj7CFcjvLrmsob88f1HrbAkMiEl1635OPbRH/wuo9Q5me03t87pAlDqpr80DRj0r5NawZAbnN3SlWV6SdWoWtNXlBWdcFfqjcLX72X5bg7CGnG2oYuS+jw3D0KH4hYbpBweENNFGP9uITiQomF6qD6RTEcOo0VUFkDq8DY7hY9FNSIXlwqfjGGgUsUiUjGaGtcQHLdIzSEa1LzVZJAyRsSO8EPkPa+dRT4O5WlAv7X+KBScRk+6XbJpM4ig2FRhUUZe7lgM02Bs5oqD00gpSqXxZiDstB6o3
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 00:59:19.6069
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 15dd4afd-2c3d-4cea-93d6-08df11fb6878
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF000264B4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPFAF883AE17

The SVSM APIC protocol supports 5 API calls. SVSM_APIC_CONFIGURE_VECTOR
(shortened to SVSM_APIC_CONFIG_VECTOR for brevity), call 4, provides for
the guest to configure an interrupt vector which the guest allows and
the hypervisor can use to signal interrupts for it.

Implement this call, and make the default interrupt setting permissive
to allow all interrupts when detecting an SVSM and Alternate Injection
is enabled.

Signed-off-by: Melody Wang <huibo.wang@amd.com>
---
 arch/x86/boot/compressed/sev.c | 13 ++++++++++++-
 arch/x86/boot/compressed/sev.h |  7 +++++++
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/arch/x86/boot/compressed/sev.c b/arch/x86/boot/compressed/sev.c
index 4e52dddc7c7e..73012b1456ce 100644
--- a/arch/x86/boot/compressed/sev.c
+++ b/arch/x86/boot/compressed/sev.c
@@ -520,7 +520,11 @@ bool sev_prepare(void)
 		return true;
 	}
 
-	/* Register Alternate Injection */
+	/*
+	 * When the guest is running at VMPL2 with Alternate Injection enabled,
+	 * register Alternate Injection, and configure all of interrupts as
+	 * permissive by default.
+	 */
 	if (early_is_sevsnp_guest() && snp_vmpl) {
 		struct svsm_call call = {};
 		int ret;
@@ -532,6 +536,13 @@ bool sev_prepare(void)
 		call.rax = SVSM_APIC_CALL(SVSM_APIC_CONFIG_EMULATION);
 		call.rcx = SVSM_AI_REGISTER;
 
+		ret = svsm_call_msr_protocol(&call);
+		if (ret)
+			sev_es_terminate(SEV_TERM_SET_LINUX, GHCB_TERM_ALT_INJ_FAIL);
+
+		call.rax = SVSM_APIC_CALL(SVSM_APIC_CONFIG_VECTOR);
+		call.rcx = SVSM_IRQ_ENABLE_ALL;
+
 		ret = svsm_call_msr_protocol(&call);
 		if (ret)
 			sev_es_terminate(SEV_TERM_SET_LINUX, GHCB_TERM_ALT_INJ_FAIL);
diff --git a/arch/x86/boot/compressed/sev.h b/arch/x86/boot/compressed/sev.h
index dd058af2e7aa..035a7b46085b 100644
--- a/arch/x86/boot/compressed/sev.h
+++ b/arch/x86/boot/compressed/sev.h
@@ -18,6 +18,13 @@ enum svsm_ai_ctrl {
 	SVSM_AI_REGISTER,
 };
 
+enum svsm_vec_enable {
+	SVSM_IRQ_DISABLE_SINGLE = (0u << 8),
+	SVSM_IRQ_ENABLE_SINGLE = (1u << 8),
+	SVSM_IRQ_DISABLE_ALL = (2u << 8),
+	SVSM_IRQ_ENABLE_ALL = (3u << 8),
+};
+
 void snp_accept_memory(phys_addr_t start, phys_addr_t end);
 u64 sev_get_status(void);
 bool early_is_sevsnp_guest(void);
-- 
2.43.0

