Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012038.outbound.protection.outlook.com [40.107.209.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F2D652FE39
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 17:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791913950; cv=fail; b=fOHGy6MOsdGUGdUkYVPswl3tXMkpncmzan3ih8Y3pUC+aJGYkeplrONUAaLcqpT5Y7Xezk4EJlx0sjPy7kpsdt7sjftX/NbwvAx2jsFsCYkgVKJ/p77fT3KMEtUROB2Yvj72CZKQrihFjAygm0ZgtcHV8tOXTq7U/iPAGMm2lSE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791913950; c=relaxed/simple;
	bh=kpdMQS/FArL/yBsRsDXiNu29e/9F2jyatxFnfp7FqDc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eRYYS87YjdBHz0kTtMt11IBabwyU+b/FuxTVgsH/rcReXeWAXfSwT0OnwrBGj9mFB/odYzrDZpNdqXDOZeCQ+dXpXfs38gecYU1PhK4xctiJouT7u1NAgc3aDcx5eo5tx7Ywtsy1hJEX9o2+xDd3NLt7fu1tpdtvr1E98oM0gps=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=uWNBNiNS; arc=fail smtp.client-ip=40.107.209.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="uWNBNiNS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mc3OfnfgLW1xT1MwK1xT/KXioOo5UEaQNVe4zLdp0Vg12+mpQgbsRusqQr7r+cNfyM4l6fD2YiZUCsRV9xwxcdC1VDztiJAu9SQCrgQQsGrw37z5gb7UXD93+qvWphBs8EJvTC/+Q+jSMCnqwZLJrX5n3iuPjMNh8Lke+qBfqfEUtSn455+v5MU1zdno6yvBWRGwlYLTwhtPg9sUpTkjfLbqT447cbw0LYzwSymN7TtTdIejXiMUgpNGcwZRB31U0GtmleEpIjSZMnPC7wfKxeNTNVcup+HeZ28EO0PCe6iqTPtydttrhUWDQ4DP1X8i9JsGcZBDGZMT+43uQ3BNsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iAIMCIX2ROFkDVs5HWYalbPEE+UnJhZt+i/o9xwB+I0=;
 b=Jxb0XtiG8p8/Cf5NWle0JgRYytof8gC72rq7OxQEcSX7ZBdwvw/FIbTDxvGWslEjHMRMKTHU1fab8bt3YoA2TRfOW9ypghAVleTboM423BFcF41MJqA+Xic9Z3Zz/HNKOiMIap9jCqho9qWlCUNEP1SOYii4JBv8BlgxYQ/lg2JlKAlVFyIAc3cIU3c/OWe1W3cp82UIX9/h+He0nzLQQyPUefhgIQUIN0GgzxiiEjckrgz01PoxjqO5ZX9i/sfCjS7H9Sat8r3yewPOTYTXMtIfrJaU6xxaeqTrvENdRQFCP4xiF6IvUq2XUo9JDy3tiP9O3mWYMoZqsr0g8f8AqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iAIMCIX2ROFkDVs5HWYalbPEE+UnJhZt+i/o9xwB+I0=;
 b=uWNBNiNSSj8gQIy4sDDm1xga9yxWSGt15t4W28N1kr0Dc2cA7hCkoaGk9x0tPDnGDjtgAyI/j/fgEkw5E8IGZICQFy7/f92R3penZPOUNxajS8aW2UeYpifht384DRlt0oQyBwu1hDUDD1US/VRkMMVc8eOG+R7nXoBYja2N4kc=
Received: from DS7PR03CA0177.namprd03.prod.outlook.com (2603:10b6:5:3b2::32)
 by SJ0PR12MB7066.namprd12.prod.outlook.com (2603:10b6:a03:4ae::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Tue, 13 Oct
 2026 17:52:22 +0000
Received: from CY6PEPF00000048.namprd03.prod.outlook.com
 (2603:10b6:5:3b2:cafe::78) by DS7PR03CA0177.outlook.office365.com
 (2603:10b6:5:3b2::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.4 via Frontend Transport; Tue, 13
 Oct 2026 17:52:20 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY6PEPF00000048.mail.protection.outlook.com (10.167.247.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Tue, 13 Oct 2026 17:52:20 +0000
Received: from purico-9dcchost.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Tue, 13 Oct
 2026 12:52:13 -0500
From: Melody Wang <huibo.wang@amd.com>
To: <x86@kernel.org>
CC: LKML <linux-kernel@vger.kernel.org>, Tom Lendacky
	<thomas.lendacky@amd.com>, <ardb@kernel.org>, Melody Wang
	<huibo.wang@amd.com>
Subject: [PATCH v4 6/7] x86/sev: Allow the guest to configure interrupt vectors for the hypervisor
Date: Tue, 13 Oct 2026 17:50:53 +0000
Message-ID: <ee6e40585834323469ee6983bcaa67967d0c5e7e.1791912902.git.huibo.wang@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY6PEPF00000048:EE_|SJ0PR12MB7066:EE_
X-MS-Office365-Filtering-Correlation-Id: e5c8131d-e0d0-4d5a-f10b-08df2952ba65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|82310400026|1800799024|36860700016|18002099003|22082099003|10067099003|261009223027099003|3023799007|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	/91N8N81Q22jYaAZlvy+4xIP8E20YYaoBeHvFEPNfTcS9XwlQ7Iojxr/XE0b2poRhkXK3znMR9SqkGkXA9a59wvVwPGyh6j3tFXQA3sCA1fu0NaTDUw4TrolSZz2gu9hxEXOzX0G+1Nn9h8rIWfh+aCuUE95Fpq/O8sHjAiyd0MIBOYGeCQYY1jhQwtfYqEU9ElJ41CUa2wOuzlxIs23xA9P5Clrc42uHr+MuKFyo24VIsFTHsWM7tlBMgiU9o/CjGVpJYk7CM17RcVwNPFSJL/YUtIwanJYJxhQgRvXAGSF4Alt3BsQmcSxk+XtOOUxZYs4qm1GsvkOzpgph9tVUSH5//shXHFYdjJLyYLSw0EyLfbdl2PWydGvt9XUB5TwxcMPVG1XqTJ+7Tao/W4XnTfkcl/o0c6xc6sGPGPbgdW+tBwNX/ebqoimSkbqkQXEfRVK6ovUUtvIJJxAmS4Q3zcSKqp3PUxhf+QDlFeEZyXEoQY39sx2+2ECkoAFZR5DDdh2DV8RdJb6qAN8VxQ04O4jJfh8UogykYcZ364WOlK5w+dPym7ljn9dgLEfI6fi5TZh8qFWH96bVZBDmGfSiPZYS5qR1nxjFPku4rWQ5/DWQZF5gT/nQWxMGfhAP4hd4CdO7r7BYazzTbrvcvcd/K938OoY+eS7FsqqwgGiOXDAj/WPEf3q6G/nr/Bt35Z3OaX41Em3i/Q1nthxb8ZD8g==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(82310400026)(1800799024)(36860700016)(18002099003)(22082099003)(10067099003)(261009223027099003)(3023799007)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	U0g8sfxMdMcwkeg7eLf2UvEypzFMMeeLtkHJc3lO5hViDtDv/YnV4l68MKM6TrL7B3zY/MxNX/xwok/HH1iuS/joq6nUa64RL0bifYREDpssVHb2cTYPVaize6nIG+h+J5MuyWcRR2WjctiaAkgvbKQbtGYOt7aUeGM/xgrjux9zxZ+vug/0ISIwV1iooGS0M9bl7+vuMG7GOqEJVHfmD/W5vusb+5N1iW6JHLC8U6bUy6thnMjul1VLbtzQodv6nVt1Bekvlien+ggKbcF6u6pmQKkt2LUOypwbDjCiTQpq0Dh3VzRMqRxBTcND5dUuZlBekqMzUnQEWcMk35wK0NTtvLYRzhZNzrAc6P8mbT5nzkgIGxCa1ZXabSEXdGmRmeQK7oNXZCdCV0r7as795UoQge2kuw3QznoT5/Z2vKGYwlzjePIpLx9qX4qZrry2
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 17:52:20.0302
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e5c8131d-e0d0-4d5a-f10b-08df2952ba65
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY6PEPF00000048.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7066

The SVSM APIC protocol supports 5 API calls. SVSM_APIC_CONFIGURE_VECTOR
(shortened to SVSM_APIC_CONFIG_VECTOR for brevity), call 4, provides for
the guest to configure an interrupt vector which the guest allows and
the hypervisor can use to signal interrupts for it.

Implement this call, and make the default interrupt setting permissive
when detecting an SVSM.

Signed-off-by: Melody Wang <huibo.wang@amd.com>
---
 arch/x86/boot/startup/sev-startup.c | 20 ++++++++++++++++++++
 arch/x86/boot/startup/sme.c         |  3 +++
 arch/x86/include/asm/sev.h          |  9 +++++++++
 3 files changed, 32 insertions(+)

diff --git a/arch/x86/boot/startup/sev-startup.c b/arch/x86/boot/startup/sev-startup.c
index 789e99d38d17..bf11e5420dd2 100644
--- a/arch/x86/boot/startup/sev-startup.c
+++ b/arch/x86/boot/startup/sev-startup.c
@@ -191,6 +191,26 @@ static void __init svsm_setup(struct cc_blob_sev_info *cc_info)
 	boot_svsm_caa_pa = pa;
 }
 
+/*
+ * Configure all interrupts as permissive by default for Alternate Injection
+ * enabled SNP guest.
+ */
+void __init svsm_config_alt_inj_vectors(void)
+{
+	struct svsm_call call = {};
+	int ret;
+
+	if (sev_status & MSR_AMD64_SNP_ALTERNATE_INJ) {
+		call.caa = rip_rel_ptr(&boot_svsm_ca_page);
+		call.rax = SVSM_APIC_CALL(SVSM_APIC_CONFIG_VECTOR);
+		call.rcx = SVSM_IRQ_ENABLE_ALL << 8;
+
+		ret = svsm_call_msr_protocol(&call);
+		if (ret)
+			sev_es_terminate(SEV_TERM_SET_LINUX, GHCB_TERM_ALT_INJ_FAIL);
+	}
+}
+
 bool __init snp_init(struct boot_params *bp)
 {
 	struct cc_blob_sev_info *cc_info;
diff --git a/arch/x86/boot/startup/sme.c b/arch/x86/boot/startup/sme.c
index c07a2c381ed1..3f92db52c557 100644
--- a/arch/x86/boot/startup/sme.c
+++ b/arch/x86/boot/startup/sme.c
@@ -566,6 +566,9 @@ void __init sme_enable(struct boot_params *bp)
 	physical_mask	&= ~me_mask;
 	cc_vendor	= CC_VENDOR_AMD;
 	cc_set_mask(me_mask);
+
+	if (snp_vmpl)
+		svsm_config_alt_inj_vectors();
 }
 
 #ifdef CONFIG_MITIGATION_PAGE_TABLE_ISOLATION
diff --git a/arch/x86/include/asm/sev.h b/arch/x86/include/asm/sev.h
index 13f2e8c009b4..8f14f99bd388 100644
--- a/arch/x86/include/asm/sev.h
+++ b/arch/x86/include/asm/sev.h
@@ -34,6 +34,13 @@ enum es_result {
 	ES_RETRY,		/* Retry instruction emulation */
 };
 
+enum svsm_vec_enable {
+	SVSM_IRQ_DISABLE_SINGLE,
+	SVSM_IRQ_ENABLE_SINGLE,
+	SVSM_IRQ_DISABLE_ALL,
+	SVSM_IRQ_ENABLE_ALL,
+};
+
 struct es_fault_info {
 	unsigned long vector;
 	unsigned long error_code;
@@ -520,6 +527,7 @@ void snp_set_memory_shared(unsigned long vaddr, unsigned long npages);
 void snp_set_memory_private(unsigned long vaddr, unsigned long npages);
 void snp_set_wakeup_secondary_cpu(void);
 bool snp_init(struct boot_params *bp);
+void svsm_config_alt_inj_vectors(void);
 void snp_dmi_setup(void);
 int snp_issue_svsm_attest_req(u64 call_id, struct svsm_call *call, struct svsm_attest_call *input);
 void snp_accept_memory(phys_addr_t start, phys_addr_t end);
@@ -627,6 +635,7 @@ static inline void snp_set_memory_shared(unsigned long vaddr, unsigned long npag
 static inline void snp_set_memory_private(unsigned long vaddr, unsigned long npages) { }
 static inline void snp_set_wakeup_secondary_cpu(void) { }
 static inline bool snp_init(struct boot_params *bp) { return false; }
+static inline void svsm_config_alt_inj_vectors(void) { }
 static inline void snp_dmi_setup(void) { }
 static inline int snp_issue_svsm_attest_req(u64 call_id, struct svsm_call *call, struct svsm_attest_call *input)
 {
-- 
2.43.0

