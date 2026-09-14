Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012006.outbound.protection.outlook.com [40.93.195.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D2929AAFA
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 00:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789347553; cv=fail; b=CvCqOjtXpaHJiJlM+lPl8ioNXLxxn8W1mBMOMPYfE8VuwX6xJCFMWo3mTYrI83wyKMd0lmeMAWwfPuqsfFXZoJGDnCgeMzoQGhYpvbkGPmfCBEvBTbgUmXr/i68pqaHtm/0wwU1Js6sS30HdMXfO/AbZ3N/2allsGJKowgHEqII=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789347553; c=relaxed/simple;
	bh=h/zvuVGysQvxf9mFAQfoyz4eSBN4cU3LeJWDsX/W+zw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dfW0yw4WKNnRtKUlSYibE7wHCWHCe6KTcWvD+wcJX3dAuS0Wnc0p9v9Q86ldwxaC5DCePLjbvS6Wo0AiLbS+w2rgDngSLeTsxrfTnjqLe7wk+I5kXnuySOGVq4Ib5H4kWvQ5S/TblqlNo0Cx/ebr4806lZv+VxZiBDl6iPunJJ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=WD9qeexZ; arc=fail smtp.client-ip=40.93.195.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="WD9qeexZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Egj3NsSG2w5+wgXTfvpfuGqbpiC7Oj5GpQqDu2t99s/jU1hIr5Rd7oJqF8eKul9V7p00Hfmwue6EY2uje9MWFIBtE4S/1R0dCrfz1vW3qIUgNhnzBohaApPIQcgQ2fJxXnLs6p3w2uAWGx/z5eDdRYFn5Sr/DhzAclR+r6SFK9ktUQCQYO2o9REU0G3+imPK6LSuOkZXioJaKT+g6P5NMbFpvwu5bLuIUKcNdbuhukKMaRX6FEC86H8w231ILXwk2+DkzuD7em2mgZmf6N+Bo3nabCwm8lkvIna+Rrs9N5KjvFp3UEHfi7oSudfwcGdaNPGYBUrc7Nd4fJmfal2Agw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xLxTwqz0qqlOsO3EoKbapmkXbYoOq9Kl/jyk6LWoXCI=;
 b=xSeEL9cI/JWItlBi/4NusFXU872ALQz7h9Z9o5AgO4F36qiYk64fqYp1CR7/OJVBOgY2Jzwu269M60NfAa/D4ngTdlITAyX+05og5VCyjWlTfL1GiiKn1GLNnUuNbgiaPji0i6kikcPSF/4fgjxpjTfOKgsVeMEHRsOwunFmW7hbJK+nY4tFUNvg+ULI/Px7LMGtCcv5b0hyx6yWKodLcXhNXe3ueX3WvbbLroI5dgUkMema1/v0sJ8XTHgx76BbyBZj6QfPfYANWlysGYhvdmMHleheRtRWAZklDjE5NoSgFZiAF1DUHtYdw91xdD727JIYr8t0M4g5WjzsRPMgoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xLxTwqz0qqlOsO3EoKbapmkXbYoOq9Kl/jyk6LWoXCI=;
 b=WD9qeexZpJ1jfJhA6I5SmdW6f4uTbRwflus+RQFkzVKhrGhBzNoYynQXxkjPdyN24RvfoM3VMMxD4yBugCfAnzePrna/u0vO740xpXb+NGAjnm9nhYVAMffoPKyCr4/D+76vMhTopCqnDeQeMtwenutqxxDGaBezV6Yb/8XyTWA=
Received: from SJ0PR05CA0196.namprd05.prod.outlook.com (2603:10b6:a03:330::21)
 by SJ2PR12MB9212.namprd12.prod.outlook.com (2603:10b6:a03:563::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 00:59:09 +0000
Received: from BY1PEPF000264B2.namprd02.prod.outlook.com
 (2603:10b6:a03:330:cafe::2d) by SJ0PR05CA0196.outlook.office365.com
 (2603:10b6:a03:330::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.7 via Frontend Transport; Mon, 14
 Sep 2026 00:59:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BY1PEPF000264B2.mail.protection.outlook.com (10.167.242.118) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Mon, 14 Sep 2026 00:59:09 +0000
Received: from purico-9dcchost.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Sun, 13 Sep
 2026 19:59:08 -0500
From: Melody Wang <huibo.wang@amd.com>
To: <x86@kernel.org>
CC: LKML <linux-kernel@vger.kernel.org>, Tom Lendacky
	<thomas.lendacky@amd.com>, Melody Wang <huibo.wang@amd.com>
Subject: [PATCH v2 6/8] x86/sev: Register the guest with the SVSM APIC protocol
Date: Mon, 14 Sep 2026 00:57:22 +0000
Message-ID: <d0b15a9b5f6e2199ff48bb77e9396044fa96dfb2.1789345277.git.huibo.wang@amd.com>
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
X-MS-TrafficTypeDiagnostic: BY1PEPF000264B2:EE_|SJ2PR12MB9212:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b8b6980-06cd-4ae1-8410-08df11fb6244
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|23010399003|36860700016|376014|10067099003|3023799007|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	JsU1khgMcx+6mOVXzvwVqUemVTou2alkUSsFXjmgN9semem9YfYMmila0MrjS7vg9NsHcG1TxtEuEkV17d1lhlwFRdICGpqkd6Ftv/Lv9NdtFcQq8pziR9df+IfCodx2t7A3sr0xDItSwZHuqJlPzu02nv/pjmdCFHLD36Dj2hFuKGsqyDs+EogF43tUjuOzc4bKRhKxY9gKHqwWgZwHr4aASb1i1P6IQ4+3hyogAm8xhs1+YneIf3ciVOnNzJbS/TVXlFQv4xohhWJ5yESdKj5v1leVlU0tSWmxCU15Q2u9eMmiYMz5FDKYd0qlkFQB7kDMS7jxYaUHW03HSHkurw+tKIaXzKUC3/SVAteWB2KKRJsgVBwxlrpsb2MqAjElpyixZjxJBn7Q41HSAgrm8fbTpj78VoNAJRBMH4Dwc/Y6pUcg9YT5P+ik//HwNNSY5u9deexjMODzjZljt43IokNhL/5hkBzKyyi/ix+mm+nd34cqQDqGu+KeqG6oRlNx1rhphF2q1ksdAUuo4RsgF76s5BQAf/8jVFad6k+3RrIYcC8mFo09spzU7WdlIR300TNyJ5ZUkgKOJJGxL8SuRbeHrTZF4nwOFQ6hdai3+Ny4GaTmi52plYsHYyc286YeledPcrIDHtmIK0PV3vhpTh/3SYDzsGkHYRbver3OiQmU9hUsUS5OllxU1qushv1V5AeBVI4R1UGybGuoii0vOw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(23010399003)(36860700016)(376014)(10067099003)(3023799007)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ZruRczbTWEiDcdhwk0ANTHMovXOdmI3visk1Fq/icC0GuJk3V6+8L7LJ597Q0njI2oBewH6v+dmsIi/1T+S5pvyLjyLBiAWB6zSI7w6gcbJPKAsTnTV9QWZojsexXQSoDJlh2J05mviLMYS9eSEe5Z6zNtlDsAHh5XwgHg3dpLV0vUyb41yxJgIel5Zm1Zq1kl///UavexAEhW3fFSCRMENjifSggY90z6Nnh7H98ZsmNU/BB8PVuq5JAgfkCWaZAv4uplSFMl98r93Yfih9uroDtPjjpqxWKdIF7y19z0NYuDqZNx2bRX+MAolUuXXvSse/vuNlpl0MYaYJDOM7cQzQvMG1+gB0woiI0t/ka+KnAJBt58plD7L9VdpJlgQ3uehMOdwWWsn7DdHAkbAaVoRdGBVgj5FlIVhI5gdvfz1RVMoFXNTRmGUoZiuYhhnJ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 00:59:09.2022
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b8b6980-06cd-4ae1-8410-08df11fb6244
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF000264B2.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9212

The SVSM APIC protocol supports 5 calls. SVSM_APIC_CONFIGURE_EMULATION
(shortened to SVSM_APIC_CONFIG_EMULATION for brevity), call 1, provides
the controls whether the guest can make use of the SVSM APIC protocol.

Implement this call, and register Alternate Injection for the guest
by default.

Signed-off-by: Melody Wang <huibo.wang@amd.com>
---
 arch/x86/boot/compressed/sev.c | 17 +++++++++++++++++
 arch/x86/boot/compressed/sev.h |  6 ++++++
 2 files changed, 23 insertions(+)

diff --git a/arch/x86/boot/compressed/sev.c b/arch/x86/boot/compressed/sev.c
index c935a97f72e9..4e52dddc7c7e 100644
--- a/arch/x86/boot/compressed/sev.c
+++ b/arch/x86/boot/compressed/sev.c
@@ -520,5 +520,22 @@ bool sev_prepare(void)
 		return true;
 	}
 
+	/* Register Alternate Injection */
+	if (early_is_sevsnp_guest() && snp_vmpl) {
+		struct svsm_call call = {};
+		int ret;
+
+		if (!(sev_get_status() & MSR_AMD64_SNP_ALTERNATE_INJ))
+			return false;
+
+		call.caa = (struct svsm_ca *)boot_svsm_caa_pa;
+		call.rax = SVSM_APIC_CALL(SVSM_APIC_CONFIG_EMULATION);
+		call.rcx = SVSM_AI_REGISTER;
+
+		ret = svsm_call_msr_protocol(&call);
+		if (ret)
+			sev_es_terminate(SEV_TERM_SET_LINUX, GHCB_TERM_ALT_INJ_FAIL);
+	}
+
 	return false;
 }
diff --git a/arch/x86/boot/compressed/sev.h b/arch/x86/boot/compressed/sev.h
index 22637b416b46..dd058af2e7aa 100644
--- a/arch/x86/boot/compressed/sev.h
+++ b/arch/x86/boot/compressed/sev.h
@@ -12,6 +12,12 @@
 
 #include <asm/shared/msr.h>
 
+enum svsm_ai_ctrl {
+	SVSM_AI_DISABLE,
+	SVSM_AI_DEREGISTER,
+	SVSM_AI_REGISTER,
+};
+
 void snp_accept_memory(phys_addr_t start, phys_addr_t end);
 u64 sev_get_status(void);
 bool early_is_sevsnp_guest(void);
-- 
2.43.0

