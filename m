Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013023.outbound.protection.outlook.com [40.107.201.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C603F33BBC0
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 03:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787974885; cv=fail; b=W8KPmKRH8XRCr9NdaGdwxWfwpIWV043TmM22YBzYPAfseLiE0UySXoOxUQzLWAKaG4te4XhA9IpCahjZpUenuvZ2Gm4oiWg9nnQs3xnYmUM4G3/dr0NW9ml+kwa1DHewrZnNZF91w0e08vKkzPqubdlVxrklAMzBNKzds/dRAH0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787974885; c=relaxed/simple;
	bh=W/pb584TJDPI3eTgFfdtmsDR2eKRLXJ12bQFH3tEh44=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kcQ3TUeMbB9laSkCllzEfr0ZMCsaoMT+/Dqzwr41P5KugDvfhPafLSchd61/ZwYXeR5Z4EH797qwxo8XJ36iccIwvtHwbaECz+gpiOt/WkQDU+ulZ6Z5mF/yKU5TSI8ahi/+982qTGk5MSAnzQxn/bk63IbXjdTWgfLjwdaqvvY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=KPPHsswJ; arc=fail smtp.client-ip=40.107.201.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="KPPHsswJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Th7W2wYccvISZ2Za6qOPh3d1O/EFdQwj4jK7uisqjzU4jxiwDtcjU0frhnpM0gAIIY5HQV4qCrhj3Sjlv4w00CrM7va0zdHQN0BrxXGh3m4z84sh/KUiPGi8Tfu1JHmG4m0/menr0lsU624kBceLDoXXcjIVcTzE0w/6C0S+dlHy8SZMtCEErWHKTp8UQuPWOPkunQjIo3CizESXh44wcYrNVgXiE7M4pcdtJL0JamJit+V4W4pQHCotYWusRVWuRfjPncaahq7WHoC6zXXmcGkCsGkEbAmBGm4ZFgpo9y/8esVZF4pnTREbhzp3nSMcULgm5DwWFvq+yk4bkikidw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3+3bXZTculnJvndZ97mMmaX9/GpywOkUWOEH0UMy3Ys=;
 b=jQ0G0D2FziqHI30e7NpsvOewUVJJnXmIi3afRcnKSgK/uxYZYmSyssp+BCGJucHUOxuIfHgzbuAxbMJMW/mYU0zwKG0fyMoTvcaQv4/UU0soZV9VyB6guXOONhWWS9AF6Ody69Ef6Sfxt1S0E1BomOCf8mH6eHxAk7cEYG07QrdZWJZBSe5hbLyXx2WvMsOEk0GHZQdymGpLs6QyKGz0ZTQ0a7XP5uu+K3KFvgAE/IdmwaaEcNgncEvMdeeICYfTvcSQ70+MeCs5hDQqG9hBUYelvHD7sv0gi8y4xzU9EwbZkR9TOYE1hu5juw+fFS+l8SpE/UnbNKRIcSthI/6OWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3+3bXZTculnJvndZ97mMmaX9/GpywOkUWOEH0UMy3Ys=;
 b=KPPHsswJS4XXem6/FoFfEjZHfd+cJDSQgpgrJy2CVrIyMbpoGJOdhxuj6gKuNwAfBaX0SA+I+J6bjC1GTMLAQ+9xyE2YezoEGKJvOtYs/BMLLE22HvJxLXkAs5QlSsCJKngNxyETk5tzaVFN/Vwx7D06amk9AbuP2jjHGb6Ys8E=
Received: from BL1PR13CA0308.namprd13.prod.outlook.com (2603:10b6:208:2c1::13)
 by SA5PPF530AE3851.namprd12.prod.outlook.com (2603:10b6:80f:fc04::8c9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.11; Sat, 29 Aug
 2026 03:41:18 +0000
Received: from BN3PEPF0000B36F.namprd21.prod.outlook.com
 (2603:10b6:208:2c1:cafe::5a) by BL1PR13CA0308.outlook.office365.com
 (2603:10b6:208:2c1::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.9 via Frontend Transport; Sat, 29
 Aug 2026 03:41:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF0000B36F.mail.protection.outlook.com (10.167.243.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.0 via Frontend Transport; Sat, 29 Aug 2026 03:41:17 +0000
Received: from purico-9dcchost.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 28 Aug
 2026 22:41:17 -0500
From: Melody Wang <huibo.wang@amd.com>
To: <x86@kernel.org>
CC: LKML <linux-kernel@vger.kernel.org>, Tom Lendacky
	<thomas.lendacky@amd.com>, Melody Wang <huibo.wang@amd.com>
Subject: [PATCH v1 6/8] x86/sev: Register the guest with the SVSM APIC protocol
Date: Sat, 29 Aug 2026 03:39:44 +0000
Message-ID: <10ac277c26ad416d480e5c9ebfb89eedd4bd5b95.1787973545.git.huibo.wang@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B36F:EE_|SA5PPF530AE3851:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f50e29c-ed70-4bed-4f43-08df057f623a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|376014|23010399003|82310400026|3023799007|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	EROLjc4e3dJrLAnj2RnCOjJfUO5yyKB1h1pCcWNdjlSRFogvPMZEJZkEKE/keOC+7/3ebKfXEqpZzfWWnvKM8b0VxZkROBpw8ku/Gz7AzoxLa7LWOLSnpiEtLI0Gxv0GKqxNuj+Ts+15KGoaEwmfNPO7VndKtTlpWvyU5HALuH4WjUxY4PzQxIyIc+35BgAa6wIHTSA5z8cr/oo0MpX3Z1A/d1aEw2BmqBucA2Yj1P9bDDdqT6GOFWM4DzbPCrlVxyVOR3aUiJcc6T90o4UsX8mvd9/KDjp4644EOCawq0taviW/uBh3DupXWweDXgcQQikH5YSP0TwUm4noebxYcZxAqThJmHqYR799nuAVvm+yubKnmEPItd7eDcgf8G4BLAoxsbUWom3ENflEeJzHom/zrIxGKgLsa97++RG7BOldQyJYPt6t1mUMByAgCBinmnsl9APl5wBvy1C5ovSMKa4QEv+FKEq5s9dmVZd43i0CV/SvKdfPJRZgh4Afg+sdGis5e9rX32b0OlzL5GPweTqBVjP1K6tAvrOW7czsCpWGqIqbmMcXSvc0OGRG2UIRteORstLn+oJCegV3yzY6es+5r00Qs17TeJMDebCOxarhn8LQ3BwJuch2N/p4pc/8jSZWb2eEWEECpeP0VCGQlqQfhlGTjIKxVhpyoSiVemjiY8+PDjwX2kVri3NYoAfsxct27hrYkb6RkyCA/X7Mvw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(23010399003)(82310400026)(3023799007)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	hdppyReyW+cTfgSHAXGTbD7YAf6btnBdYAhfz5avFORSfjd3fjgobTGk1D1ON87RqSIbIYfyYwyozEFmGdKaHZGxI9nyf0Si31N/CIgD9bwDYIR5NNh+84Tf+HcoLpkilH+Cakhunob3JaPL9P/EUrWYAnUoWIBVqgWCrZTmriS539oxSfB3AvLwyhi5FAGtaP7dltUhkuSDW66qwUj+j4C3/Q0H3CKXb6jjSu80b8i1KJtJF+MAcjX7lrIwrmy5l5xv06IDNiHL7PVdjPowdQrEkKnmAbfkLfeFpZPpD+XILpKwcEUNrzi9mMGX15PBpEomWlQ357cSIp73X+ak70OBqHA6NEcNTYPl+qqiHh7X5EFXMwx37/lCymu3GL1ULBO1C7UPVzJKVSdCpr1UEB7Vu9IaALwoYBbf30M4xPbEez2xmM7p22YKg5fe2xEm
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2026 03:41:17.6436
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f50e29c-ed70-4bed-4f43-08df057f623a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B36F.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPF530AE3851

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
index c935a97f72e9..a8a175c90fa8 100644
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
+			return 0;
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

