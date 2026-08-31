Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011009.outbound.protection.outlook.com [40.107.208.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01AB038B12D
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 21:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788210615; cv=fail; b=Q+c4GXJ3H6IA7qopv34dHf8JrEJTbFEilg+Alh76odY9hn2KfAHVd9u7Q1bWFo/pNcXigBRpLPb2iX79Cwz6VgcczxSF+wtdfW17cJ0nvfbV0THvEz4NE4ECwv6/ystqU3SKPWw00avMTw+cTlAGNe6KboFHFVrAYz7ELoG5tfw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788210615; c=relaxed/simple;
	bh=2h6lZ+dCLxbb8mMt8cMKWz3LoIQHfA8tGx9SlawW9Yw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=jPd3/Ieq2QXgmT9HeiQKUUct5MDaHunNMbz/GTpbJlogYzWdvIawyOKAyrsHHDTNHWgsrpAAODAbUkW6UZa+pjwkh6qWOO7pA/Z+4yhNWpJqadwyVk5rElADqpikXmbvNqaLS3d0IClB6Q5OqP2heEL/dlroMCh5nZTwGGHm3LM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=U8Iy+NRY; arc=fail smtp.client-ip=40.107.208.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="U8Iy+NRY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PF3SJg9YVJet20dq9YrfjCUy9rItXOg/vSWTSBJBYEjT+LdUMM9zfjZu5a9huivSIKCnODQPh0nmHjl9gnmkFXaMKi7jr18/UUcWKlCyvjHGFOUxui1lxLNmIARspiOqZQvwlwPUoaybz2Bk2rJ1XtQjzZ5H4KFps4BBBijnhxKv0O2gY9N3B3zqLovQpZ77a84vdxizM4iWaIzLmGVxGxHYzTxKzMdxvt2W7ESDlTqtVfV0LBm71U7UWQbB0T+ubVuBDu2of53OmZAgqVgOAumnDjjO3b/Z3NEJMsb+Pc7UkjZR5jJCkEcwJi3mGdN9P7+iCNRc/dzvzt+Qmfy1mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sHhjIb18c1f5qjhwIe8jQ2UtKYDEi4MaCYH2NiG3Um8=;
 b=Imx2fI7beYctwxZ6IKRXBjyQOhOn3zreeXjH0E7pM+sddqXRZxMSKLnpZSGn6zTHAMoTOC+IuxPzouEAGzgDhZi6mlVNWqLOwR1YJbFdEzj5ew76UgN57uFVO6chRzuqdjkRBKYO1iJPmfkdpr9HGqRv82a+mQKL07yi6KvMnNdQyDVON/6TTyfuMPyeL0q++JKnj0YZxD1lJsihSIKbksABk3uyiW0DP1OPS7KIoRsjQ+tvvx1vnA0qqmuu+Sjaxw+m5VVn1hUQYF3SGqFbNZdAQgwuC3k8h9KBxmQvjHrCqC5iAT2ElKXQmR+FWYmL5z73DCGOsgyylRC2xMCNGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sHhjIb18c1f5qjhwIe8jQ2UtKYDEi4MaCYH2NiG3Um8=;
 b=U8Iy+NRYhgffxVf5Zi/NNmSUKq6p8VyHfKay+guTK6tskG3g35kaojxIoipX/7ER1jVCJ5rXfrGqqJJ8HKi+L8fgad0q0rezb8CCV+wZ8AS+2aindyNyUzw586K6qM2QPzi7CK3xfCBVQfNktXTsRyhKPAKzMBcBcs9jYKisx3M=
Received: from CYZPR10CA0002.namprd10.prod.outlook.com (2603:10b6:930:8a::6)
 by DS0PR12MB7558.namprd12.prod.outlook.com (2603:10b6:8:133::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.11; Mon, 31 Aug
 2026 21:10:08 +0000
Received: from CY4PEPF0000EE32.namprd05.prod.outlook.com
 (2603:10b6:930:8a:cafe::8e) by CYZPR10CA0002.outlook.office365.com
 (2603:10b6:930:8a::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.13 via Frontend Transport; Mon,
 31 Aug 2026 21:10:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000EE32.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Mon, 31 Aug 2026 21:10:07 +0000
Received: from dryer.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 31 Aug
 2026 16:10:05 -0500
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
Subject: [PATCH v2] x86/bugs: Don't say no mitigation available if kernel not compiled with retpoline
Date: Mon, 31 Aug 2026 16:09:16 -0500
Message-ID: <20260831210916.987152-1-kim.phillips@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE32:EE_|DS0PR12MB7558:EE_
X-MS-Office365-Filtering-Correlation-Id: ecb1306f-25d0-46c8-50ed-08df07a43bed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700016|23010399003|1800799024|6133799003|10067099003|11063799006|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	6e9gtYuyaZKiL+nIciL6uEPngeDitDJIsBYKuEBw5ZrLmY11loqfXw71GFSZCdm7C2qCQj9MoE33eNbVPSgV6AxGEza3c9VW78ZyLPZhEkiwbxg9RhCn5i4Yko1Wxmi/+TFZNcdAjYj8NU540UlYLPUs0sfS6ZOhwHVGrAsY/F6iKF0tmfCDfZy59Cqq6vo4LLHulk7jYmxF6K7+N6Exoprz2BKNOgcbacVOH536G8r6JPPfAGiiNHChcu3fhydc3az3qlsrWdJPuEwBYp01YL61dSQz/c7xrhRVe4PoA8qRpSUi1UYpkrjOwTgg/HErb0l2u6lZVeJQyqwZVl5A8OwNUAg7OxbAnKhEMhbWfjm7L8KwJsA1Y1BEF/ppbA5XGGe0DaNDwIsp/MB0yF5FBky+4+jtfXmDPgy8yP6gCdGplm4Yxpugg+2wv6XpWmO17qDP3vJo6WbrMAzBeELHhDDte+LCY2Ta5pxppQZP41g+L5qgUhYHqKG3ZZBeZUD4kQI3EOe7xBBfFmcGq/y5Wt5dhTpI5oTIhRJvoTe4KnIjgyRZcvS8eymNSkw5EHZXoCcE1Eogy5+RwcFdGB4sJlSsybgUU+uzV23aU4t80bpO10fg9kuRz+EitfGxjYv9gIHAouKG2II5AbXU6CtXINeScB8/VZS+0WIDGNbI1XQmt3xvlAbGOh3zzwTQlwwACIeoeg8x5ZEOg2I8EjKVag==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(23010399003)(1800799024)(6133799003)(10067099003)(11063799006)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	9KIFRXIcOK6hra079vCHb57WU/L4DkaP5snCFZRpRTP1oCKuPQNBMTYKYgxPnzkTx3o0TbjSCy1mMdCOTplvXRvybfl51RXVXeDiOqIRF/o2y/IeJZpd01pnlJbZeSmrmPE6BUTsedPwJtDU5AuwEoo/t9JYwoaGFH+1mb/GQ1Q7qh2nLEnhhFMjM/sdq3ai0dDi0w/agonftseyy95H22WH93AVUsdqwJdF/C5Ys6cXRtmt1YSozw9JKEL9+GBCMIojV0unq722lqmMyebbEwcIMMuMMEQrHVb6di1grLBAfOxHWIB234sgzjaiG87PaZnlAVuzif5xtMV5YlYyo5CipAnf9BMlrcwFv/tmLjgGepzKYq26h1WuGcvavRedlV+8rLtngDlLpoZX0OGzkGQbuDxyfJAbRRt+4LoyjBN1JsN4mSOgmTRJJDo/QX7Z
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 21:10:07.0463
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ecb1306f-25d0-46c8-50ed-08df07a43bed
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE32.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7558

When the kernel lacks retpoline support, spectre_v2_select_retpoline()
emits

  "Kernel not compiled with retpoline; no mitigation available!"

before returning SPECTRE_V2_NONE to its callers.  SPECTRE_V2_NONE is not
the final answer, though: spectre_v2_update_mitigation() runs afterwards
and can still upgrade the mitigation.

On an Intel CPU affected by RETBleed, built with
CONFIG_MITIGATION_IBRS_ENTRY=y and CONFIG_MITIGATION_RETPOLINE=n, and
booted with spectre_v2=auto, retbleed_select_mitigation() picks
RETBLEED_MITIGATION_IBRS, and spectre_v2_update_mitigation() then promotes
SPECTRE_V2_NONE to SPECTRE_V2_IBRS.  The boot log claims no mitigation is
available immediately before reporting "Spectre V2 : Mitigation: IBRS",
and sysfs reports the machine as mitigated.  The message is alarming and
simply wrong.

Drop "no mitigation available!" because the final mitigation state is
printed afterwards in spectre_v2_update_mitigation() anyway.

Suggested-by: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
Fixes: 480e803dacf8 ("x86/bugs: Restructure spectre_v2 mitigation")
Cc: stable@kernel.org
Signed-off-by: Kim Phillips <kim.phillips@amd.com>
Assisted-by: ClaudeCode:claude-opus-4-7
---
 arch/x86/kernel/cpu/bugs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kernel/cpu/bugs.c b/arch/x86/kernel/cpu/bugs.c
index 56eac5611c31..5a0533a41d30 100644
--- a/arch/x86/kernel/cpu/bugs.c
+++ b/arch/x86/kernel/cpu/bugs.c
@@ -1957,7 +1957,7 @@ early_param("spectre_v2", spectre_v2_parse_cmdline);
 static enum spectre_v2_mitigation __init spectre_v2_select_retpoline(void)
 {
 	if (!IS_ENABLED(CONFIG_MITIGATION_RETPOLINE)) {
-		pr_err("Kernel not compiled with retpoline; no mitigation available!");
+		pr_err("Kernel not compiled with retpoline");
 		return SPECTRE_V2_NONE;
 	}
 
-- 
2.43.0

