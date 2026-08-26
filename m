Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012071.outbound.protection.outlook.com [40.107.209.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AFFD424D59
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 22:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787782974; cv=fail; b=A6EgJUa4u4CI8K+Zn8gS6XhlbP0lN+vRA1nqtAdhakoqX74gS1nHwPp/2EtxwOslDG1OeMxHjgQwzM74dYfpwkSIBDbpzPnmUmq442tHRmC0OaVLa6l0ys9Di4K1Yt31CNPLQt5J7MVLH4sxtBEvNkvKILGHxOMIKZdDM9CrdIA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787782974; c=relaxed/simple;
	bh=kaenUsRrtUogsG0BZ399bbbOc7y8x2qtddszExl57yA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=m7SLV/v0yWHRYQ0854MVbhaJatnQN1WPnAxsrZarW6aL8cr9zxVNSC2CdZa4Xg1jKP4SHKTo92aaMW+svORkFZ05HXTDTRLwXkv0qoy6TmIRUc3CCtAw3bPkZ3ZTdPK+rXLCIH10lCTey5JlPevunWSfI/JMFvVX+yqYjmW1bY4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Zf5ikl0a; arc=fail smtp.client-ip=40.107.209.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Zf5ikl0a"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tu/Ij2sOuT+ItnhrDMzbiQOlU+3ysrLAZuTBZ0C33qq4uMsKi77z9Nsp3pVHbC83HXRnGQpcp3E8Us6HgrBnCueCZNoYQplYKh1+7oRtMpKtqFvFfKKkl2JYc62wnU3E2iygw5hSh30Lt2OTWISLJOm+EhtbVzOgsZxmN2wtb0P6SO2v/v6RoIueWUEDulTe+upqFEcAdur+qL/+hOkEGM+9HURSjs4v3sCgjrEdD8yupmsMJv+2Gs320zyhdDJmDoaRfzQ9hnvoAhtp00TZzcKVuWy1h1LUJEnZbE0yqfNY2JuvZVMaUteL2/Ns6qp6b48pnjcIWsttD5uD4dZ1NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LVk5BRrbMCyJaeZbetsjOW7VCKDjNVLUxRE+CAWYHlA=;
 b=rAtIlbaE4LvxuLq496kFJsrKTYfRkFlJh0B4NwQLC4UOWDdyqzPyBkLjP0T9g5mX+arulVnf2M+mtCSn7h5xeBWurN7dGzg0UWvKbhAM9A4V6/p88k79gNHLfCYBfD48HfYm1gzeoPkmzvCvRzJ2lkPP+xcJIqO9sQCSLMd5YkXOyfq583LhnLAqN73gHv9CMoQrPpvHkWuabckTMC/G9PC8dVKocOe4PLFw4uNqrDWem0mlYbtgNmyYYsOITm9C8kR96HbtQd9MqWYPbJEbjEQWjz6cVLGHFNpzeXU2yX8L4BiQrBw4x4wVLy4BQvRY6I4utpsjcQ8MtmkcAekeug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 149.199.90.133) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LVk5BRrbMCyJaeZbetsjOW7VCKDjNVLUxRE+CAWYHlA=;
 b=Zf5ikl0aTU9M8/xa98pEnOlQk93swyHx1ZJSgECsvCSh98W1RTXecGmIGxdLHwBhlRQWCOzsXfE6+vwYzk/mkjlWDx9WYLFlgCxPL/Fxr7eCRf0J/AGwKkYcTeSJlINuzYEns9TcBwTjtDIrHYgmNJ8DsipdtfCvq8b9l8mc+/Y=
Received: from CH0PR03CA0223.namprd03.prod.outlook.com (2603:10b6:610:e7::18)
 by LV2PR12MB5798.namprd12.prod.outlook.com (2603:10b6:408:17a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Wed, 26 Aug
 2026 22:22:43 +0000
Received: from CH1PEPF0000AD7A.namprd04.prod.outlook.com
 (2603:10b6:610:e7:cafe::34) by CH0PR03CA0223.outlook.office365.com
 (2603:10b6:610:e7::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.10 via Frontend Transport; Wed,
 26 Aug 2026 22:22:42 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 149.199.90.133) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=amd.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 amd.com discourages use of 149.199.90.133 as permitted sender)
Received: from satlexmb07.amd.com (149.199.90.133) by
 CH1PEPF0000AD7A.mail.protection.outlook.com (10.167.244.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Wed, 26 Aug 2026 22:22:42 +0000
Received: from dryer.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 26 Aug
 2026 17:22:39 -0500
From: Kim Phillips <kim.phillips@amd.com>
To: <linux-kernel@vger.kernel.org>, <x86@kernel.org>
CC: Sean Christopherson <seanjc@google.com>, Paolo Bonzini
	<pbonzini@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, "Nikunj A
 Dadhania" <nikunj@amd.com>, Tom Lendacky <thomas.lendacky@amd.com>, "Michael
 Roth" <michael.roth@amd.com>, Borislav Petkov <borislav.petkov@amd.com>,
	Borislav Petkov <bp@alien8.de>, Naveen Rao <naveen.rao@amd.com>, David Kaplan
	<david.kaplan@amd.com>, Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	"Dave Hansen" <dave.hansen@linux.intel.com>, Kim Phillips
	<kim.phillips@amd.com>, Nathan Fontenot <nathan.fontenot@amd.com>,
	<stable@kernel.org>
Subject: [PATCH] x86/bugs: Only log missing retpoline when it's actually the missing mitigation
Date: Wed, 26 Aug 2026 17:22:28 -0500
Message-ID: <20260826222228.3668418-1-kim.phillips@amd.com>
X-Mailer: git-send-email 2.43.0
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7A:EE_|LV2PR12MB5798:EE_
X-MS-Office365-Filtering-Correlation-Id: f1baf704-434e-469d-0083-08df03c08c07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|82310400026|1800799024|36860700016|56012099006|10067099003|6133799003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	i6UoLyjZX5YpVu4lF39QUcl9OpBX+ApNpJ+IFTR8GzRZ+7x4v33vvwc8KnotSBiLMLnhUNHSDnCUhTT9X4Q5hPffyFDy8VH6ySAxAUjw5lDTSQhYoJXWn04JzHkT0kbV8cKrzlYDgWdMzRBlCPkqHGqH5ayhPkY0Htj0m1vuuLDmKpO+rbVYXLUR2YD/MmZk7DjtBTKcGxuylWttojp5oc9UXPfjciP4C5tIodZlB/uGW5G5Yh3tgzCnRhCMTa//DMbb88oCqQ3iLPkV3KC+yJCDSw45Jfeukl5ELM1BEsSrKh0pWeS2lCZEuBrzZuav0wr6ZZZe8oEcEMItRRP2M++Qy157gl9GhEEs3IT7nGuq2OYJLSCMedqo/MhrGJgD8bLxGSCJIopk2AASEye1g7v1H+xn5m7DaZJtXlH08SwoPYZfmg+xuvciizybMUbaEOwohhmyYs2akPc61KtfVFPzrKVSggTg65+DKsXFULMFjccZWTSUG8Ok2+ke7Nz05nNzhTVlKFfOvz5YrwUZAbc/ow8sEeBYpNWgiCSEfeZbyvub57g88ZOgnZInHAECDGQwiwKORWFfZ/cblmbfGN4Zrp1LDaec//qROs809ZxZOxk1p6TemWtv4bl13tF/81ByibTeKSiO5iVS1D07wtaZQBVSHFXDmw6zbGNQKSaLprCdDq1eaFWJ/wzb+xIs4SmUqg6OFJ4nt9QyVAThSw==
X-Forefront-Antispam-Report:
	CIP:149.199.90.133;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:unknown-90-133.xilinx.com;CAT:NONE;SFS:(13230040)(23010399003)(376014)(82310400026)(1800799024)(36860700016)(56012099006)(10067099003)(6133799003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	KVEPpUDetbNHh2Ri7Fmtdp4p0Mn8V4wIvdBl59lncGimBRaKJH48bHMk07BJcM8KFaP56vcfnAAaJzrIlTl1TmvpO9dYFCVuIFZyt5/Pw9TddGinm4+f/7FXxxueFHyv32TGeDXJdviRl5IsS8WIBHZM/OxXZKOljOOncwltXYBWVRJClUXSZXCGbPF4bZdeovUFFfvhsW0PNXXCpjkESSM3YyJP7Nf6RLchjNgWnKKl3NLF6gfUBZaxPdl622sqdUhM4OhwJpcrDFbF8sSef1OT2sWYZEZj29PRlBgL9Utk6ZO+chptQaRci2eZff2CK3MjF6yXwb+FhZB0RVL56Z+PyOjFwAR0OPxDI4nw5PCfzIpIR17SznSYOWEVp95oI5YNrHC29G1qnDSx3SpC4q4JTE0cBgurqeAY9RIRX1EPyLiboZq1pKNsfuzG7mXb
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 22:22:42.6417
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f1baf704-434e-469d-0083-08df03c08c07
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[149.199.90.133];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD7A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5798

spectre_v2_select_retpoline() unconditionally emits

  "Kernel not compiled with retpoline; no mitigation available!"

when the kernel lacks retpoline support, before returning SPECTRE_V2_NONE
to its callers.  SPECTRE_V2_NONE is not the final answer, though:
spectre_v2_update_mitigation() runs afterwards and can still upgrade the
mitigation.

On an Intel CPU affected by RETBleed, built with
CONFIG_MITIGATION_IBRS_ENTRY=y and CONFIG_MITIGATION_RETPOLINE=n, and
booted with spectre_v2=auto, retbleed_select_mitigation() picks
RETBLEED_MITIGATION_IBRS, and spectre_v2_update_mitigation() then promotes
SPECTRE_V2_NONE to SPECTRE_V2_IBRS.  The boot log claims no mitigation is
available immediately before reporting "Spectre V2 : Mitigation: IBRS",
and sysfs reports the machine as mitigated.  The message is alarming and
simply wrong.

Drop the pr_err from the helper and emit it once from
spectre_v2_update_mitigation(), after the final mitigation is known, so it
only fires when the system really is left unmitigated.  Guard it on
!IS_ENABLED(CONFIG_MITIGATION_RETPOLINE) so it fires only when retpoline
truly cannot be built in, and restrict it to the cases where retpoline was
the implied choice: SPECTRE_V2_CMD_FORCE, or SPECTRE_V2_CMD_AUTO when
should_mitigate_vuln(X86_BUG_SPECTRE_V2) indicates a mitigation was
actually intended.

Fixes: 480e803dacf8 ("x86/bugs: Restructure spectre_v2 mitigation")
Cc: stable@kernel.org
Signed-off-by: Kim Phillips <kim.phillips@amd.com>
Assisted-by: ClaudeCode:claude-opus-4-7
---
 arch/x86/kernel/cpu/bugs.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kernel/cpu/bugs.c b/arch/x86/kernel/cpu/bugs.c
index 82436b3534fa..46c68feef339 100644
--- a/arch/x86/kernel/cpu/bugs.c
+++ b/arch/x86/kernel/cpu/bugs.c
@@ -1956,10 +1956,8 @@ early_param("spectre_v2", spectre_v2_parse_cmdline);
 
 static enum spectre_v2_mitigation __init spectre_v2_select_retpoline(void)
 {
-	if (!IS_ENABLED(CONFIG_MITIGATION_RETPOLINE)) {
-		pr_err("Kernel not compiled with retpoline; no mitigation available!");
+	if (!IS_ENABLED(CONFIG_MITIGATION_RETPOLINE))
 		return SPECTRE_V2_NONE;
-	}
 
 	return SPECTRE_V2_RETPOLINE;
 }
@@ -2247,6 +2245,13 @@ static void __init spectre_v2_update_mitigation(void)
 		}
 	}
 
+	if (!IS_ENABLED(CONFIG_MITIGATION_RETPOLINE) &&
+	    spectre_v2_enabled == SPECTRE_V2_NONE &&
+	    (spectre_v2_cmd == SPECTRE_V2_CMD_FORCE ||
+	     (spectre_v2_cmd == SPECTRE_V2_CMD_AUTO &&
+	      should_mitigate_vuln(X86_BUG_SPECTRE_V2))))
+		pr_err("Kernel not compiled with retpoline; no mitigation available!");
+
 	if (boot_cpu_has_bug(X86_BUG_SPECTRE_V2))
 		pr_info("%s\n", spectre_v2_strings[spectre_v2_enabled]);
 }

base-commit: 8d3ae59288f1e7d58d76558a6ee96d533bc5019f
-- 
2.43.0

