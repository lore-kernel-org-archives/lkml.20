Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021140.outbound.protection.outlook.com [52.101.100.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2379D31716D;
	Thu,  3 Sep 2026 01:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788399588; cv=fail; b=W/E5WoKxs+1T754fW0LFTA1xdlOU5TmKqfIusqBzQ3UWFS01iHPojWYmIdhbCKw5PrxBKHdwBMSdBYayHQSlJ0hZ9sEvWPldOfN/Tys4eI4bxwhaE1qP07ekG1Vuf3tN4fmYely5ILGJdROo8/laPSLc2VF+zhPRhRJkwAfymrk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788399588; c=relaxed/simple;
	bh=04yEFP4GjbFdJKK0fXJx62XE0XF6lJHBZ8RLw3AXgiU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CT2T7HKsFvRtW246AlN8PgnS6Tvg9jpods77wPQEr9MiS4nNRqW7PQ6zhvPceO4fprarKEOpCoO8ATcqocYAmV/oUgFn6H0Rph0A0E7YOavsZICKYpfLd/ezbazwmPJdVdrZw142FLzUUFS5sBJVPLjWpksnvgv9HEEFTU5HUUY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com; spf=pass smtp.mailfrom=atomlin.com; arc=fail smtp.client-ip=52.101.100.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atomlin.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zRUv7tQhpApP81GkdKxA6WZYHGFqickV/eG+utZ3nJC5DBVfRCm/UYCKkY9C5Q7ZvdrhPHZ+1z08Z8MW4OODSVdFphI5hU2u8lLxgnmgN7fOdp8QlQLNWW9gJ6nMUq3KEJ3ioiSE71fmoWTd4ntKXCz0lS9xy7idf2wC8HmgTAsgGSVz5hlJuxDIrhQpocm6RuKmJ5sMzIYI+18buHcuuSZx9GUiZi4c9Taz+t6RBUsfwUf9FN4w62JgEa5zL0TCZ4qrHJpvf39hWPiXHWNgquySu2xBCkbiyapU61+g4xDAeh+nE9q0Cm9Xj+tVqr1vDiooYn/VWaSJiUjQe5WZGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001; h=From:Date:Subject:Message-ID:MIME-Version;
 bh=UMvUsNqvWFm5VcatlN++Fa+BvkFT3QiqIEnOH1BJJKg=;
 b=BTw1qbtyOJT41TePifYNKkktJnBdSoZI1PIy9p4lDXzWRzHq0zQvDyV17+xItlCDydcDQ6iKFKFv6K7p9nLkIqJmvY0txvaZArlkgCQGEVwkI8Vy2sbFJGnrPCwa2mxK5X93SgakJZQQrPUg8N4wT2Ew9FW7uBe6KPHfvv2m4+tLkNdAaySuaOzgwVpjRdhidbEw+8bc+ICPhfbg2kWUtiB0NJzYC/xbIc097plq1mUsXBBgAqFMPDYDiYrL6FayQqD5nGO+wP6luJ0R7Uil+Hj6gntEUlnegngJ482jd2QURteUdyy0X1ACwY80G85FcgqXjXkNLsMDBP0zhsIhWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=atomlin.com; dmarc=pass action=none header.from=atomlin.com;
 dkim=pass header.d=atomlin.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=atomlin.com;
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:183::5)
 by LO4P123MB6532.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:2aa::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Thu, 3 Sep
 2026 01:39:43 +0000
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230]) by CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230%4]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 01:39:43 +0000
From: Aaron Tomlin <atomlin@atomlin.com>
To: tony.luck@intel.com,
	bp@alien8.de,
	tglx@kernel.org,
	mingo@redhat.com,
	dave.hansen@linux.intel.com
Cc: x86@kernel.org,
	hpa@zytor.com,
	frederic@kernel.org,
	marco.crivellari@suse.com,
	sean@ashe.io,
	chjohnst@gmail.com,
	mproche@gmail.com,
	nick.lange@gmail.com,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/2] x86/mce: Avoid arming periodic polling timer when not required
Date: Wed,  2 Sep 2026 21:39:33 -0400
Message-ID: <20260903013933.172063-3-atomlin@atomlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260903013933.172063-1-atomlin@atomlin.com>
References: <20260903013933.172063-1-atomlin@atomlin.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN8PR04CA0045.namprd04.prod.outlook.com
 (2603:10b6:408:d4::19) To CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:183::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP123MB6607:EE_|LO4P123MB6532:EE_
X-MS-Office365-Filtering-Correlation-Id: 2483571f-b3f4-44b6-1880-08df095c3aa5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|23010399003|1800799024|376014|366016|56012099006|5023799004|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	vxjKgYIwGZT2cV8KcHzxQJFoIRZ2WEXHseCEvFiAg8Lz98F40FLCnNg7Z0bj+2LQMq+IW/NHxcChXxWY800FrvK77mMSqNjaQvyqbyG23rbT/LUVfM5M7iszATFMHSJNXChR9VDXrPzQIs+B9U013cJNHjcWj26LUz7ft4EKmmih1pIN9gSxnHiKcmf1C2Xbr+ngF05NNvj9aXyy66TuQP/06g88/cI7Arwv7B+iOP2dVyB+StOJtKnk+/gKWoscoLDhcONS+XAJh6MKXlprqfvrBwl2eR6rbcGzApoeDoGjFJoYebJxA+rthVwfo835NTKAePO0vcIGS8BrMOy5OWtnQ/vDhhxeewwn37didSxjol92864wKhs2PYJguiol4lnaJA/BW5ZxRIBpHwhW4W0MLPjxbs6n7EGmbR8tjun/81+2flGC+uTN8/3//18oMdU3U9v7IqZwCz1Cw26BXUBvytLz7MaiYHVjhA7vr9TtrITGqzMpOPjslAQExL2ms3JTkDCRA2IeC2qQ1DA9uQy7GIPy6/CwO7E9SgaRe5j2X4toZxOigcf7jWPNgi0N3HxJar48ZWmcDmfVpNUwNJ3d7lLMLEwNik7Z2lQW8+EXIAqGB1U3P0Q8IPXxqWaAhjBdFvWA7Q15G6AcXDkerirF6AXdbwmy5zu7mAw7LDU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(1800799024)(376014)(366016)(56012099006)(5023799004)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?trQxes8ZreKkwzEvadiMeEZumx79cX1okEx/L4cmAzv36D5EdUd7Ob6ibb5k?=
 =?us-ascii?Q?ds07H1oI0LnX9eRFcqx5hEct3UjQWNHKjDEMPAUCWp3HXrqvSztpRxFslnRx?=
 =?us-ascii?Q?BxYu9BTD7jh4F39XzMaAB+Ta3VVXSxR1/DVnwONS73aACrQEHJg7wWbZ11pQ?=
 =?us-ascii?Q?cN2I81UlUUahiARPNeVGHZ3DpYjx2pVrkPP50CYks9zVBss413npKFEsKnpm?=
 =?us-ascii?Q?J6d+1SHJIsrWsmY4R92A0Z0IyaXBvpzLkVkDK0KnmCpSlIxiaEcOjSgLZu+5?=
 =?us-ascii?Q?4vmDwS08mAOxAr7qYWlwbjyToXRyKm7SAUyOnmlVMZAI0LTfww1+0WL9XcJh?=
 =?us-ascii?Q?rFkH9cBQIIoPpActPpzsbIODYWqZTnXlvha2BPcPhvoCcDZhFzRbqEQm7YJ/?=
 =?us-ascii?Q?579W5CzQG0Qn2A0Q0uOO9Fjw4jRRhNgY9rTsQBX2ActYjb5zFdhMqOwFOWaN?=
 =?us-ascii?Q?ZR6Jw238Ii7tXdOPztaawGmSm62lFEizL+LeR6bsDLU2VnZ/NvnHmHjwvQ1I?=
 =?us-ascii?Q?Ixwl0ouwt9lH5aoWdAYn+pE8htINp847vQj5XeRuQ/xf1pHiie7ZrdpK+LY8?=
 =?us-ascii?Q?LdGBTjeqN/U8KWcNcEXBjy2Zgc43yrR8ixcaSe2nmtV8bAWEwGXC3tayt6P8?=
 =?us-ascii?Q?HxLBem8PxwRVVkT3TLsQ0jzU25N9R6h8HWVk2fNKlHEdBQYC7ZuecOULNDXQ?=
 =?us-ascii?Q?+wwnrOp3J+HuspI+Eeqf3NLBE11PkcdYnyFuA3kA4xNIUyN0V5EFqjJo/e9J?=
 =?us-ascii?Q?vtrZy1HGKoftFNswdWMxN55+QL32qgb/eiMykZr2Q0EycbzZqlWJSWiHjRLf?=
 =?us-ascii?Q?5LmDVp040S0jQ41ybAmGKpxecFNJnOckZ0zg7PptYVhOXiyc5HDuDWjK8+D2?=
 =?us-ascii?Q?2UKUB6tDVEAzLbDPNRv5rbVv3KaGVx2zNs0B4tFSUd/br71rPnVReZSxJJeR?=
 =?us-ascii?Q?jgtouUjgPaDkyW3bdUbcMnlv3AGKjGkSadcrgmpzXjjsigiph0GKK3cB1Gva?=
 =?us-ascii?Q?GLfLNE2ySTIa9F9JbdvEpU1++0dF+Ct78V+k0mIR0JYz8jtwXY2F7rvurP9y?=
 =?us-ascii?Q?wgUwmg3rshCPmnaEGNYr9JIP8BBbb6W7JsNiYXUd2OEYRUwPYStSUxhjFgn1?=
 =?us-ascii?Q?0BPQD4rcGe6OtY+V10QNzbNeMdP6nSIyYdRRjj+K6mfLBlTvWLi4x8Yt0sL/?=
 =?us-ascii?Q?5Pj1c9oBtf1QlhPbJmF7ILtjXPhnGCjtn3YcOb2odd4l2EcaRpj7bRuJdM8b?=
 =?us-ascii?Q?T2FXyRRABUZGRJoB0ks9RlDDWSY8ZXcVuKqCvEL1/vrYMZ+OsGrxPwQcKaFA?=
 =?us-ascii?Q?TP/jDZhosuufWYG3CmGa2++Xze57AaYVl2QJF6uscVFzY5iaO6iF/OR5jpuT?=
 =?us-ascii?Q?eSmQPuyjfYePXndz3TwQos1T8mni3mtOSCqi/Sd4gm3h92mePuHNlGoHjzgE?=
 =?us-ascii?Q?eR6NFRWk+iXWley9xA4LMB80/gouIwF6vOpPHlx5Z0S9rQa1RRY8ZDGTSsCh?=
 =?us-ascii?Q?D1buoCjnJGc0o49YaJWGOC/3q/XdobLhgutlQwFyEcSKFOmTLYLQqDWnG08w?=
 =?us-ascii?Q?1A1O5kqv9QOFHWiBompA5YG1GJ7RECtgwu39CdQN9+T1jppeL/rANymIOcwc?=
 =?us-ascii?Q?BsBd/VwsC3G4ZDLtBWQuaSQx7KiHMOk23QAmVdcf5MCRMJfKso/W/wL9yr+D?=
 =?us-ascii?Q?KsQvQGMiiHfifnNaGPzhZh2E0Bl+E2HTk6qHXVKC0DmMBEC5IqAtcEfCeUvC?=
 =?us-ascii?Q?0xrRRSAg+A=3D=3D?=
X-OriginatorOrg: atomlin.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2483571f-b3f4-44b6-1880-08df095c3aa5
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 01:39:43.6253
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e6a32402-7d7b-4830-9a2b-76945bbbcb57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FELFslCb/bstMfOUM/fBHqU4WjBTezj5bBIFhy4f+DPAvmygBl3D9iLiYyIQ8smnQObhUyXz3sr1BKoH9X9QqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO4P123MB6532

On x86 platforms, the Machine Check Architecture (MCA) subsystem arms a
per-CPU, pinned standard timer (mce_timer) to periodically poll hardware
banks for "silent" corrected machine check errors. Because mce_timer is
pinned to the local CPU via TIMER_PINNED, the timer core cannot migrate
its expiration to a housekeeping CPU, causing periodic latency jitter on
isolated cores.

On Intel systems supporting Corrected Machine Check Interrupt (CMCI),
hardware generates an interrupt for banks with CMCI enabled, clearing
their respective bits in mce_poll_banks. However, for banks where
MCI_CTL2_CMCI_EN does not stick (such as the Power Control Unit bank),
Linux historically assumed software polling was required and left the
bank flagged in mce_poll_banks.

Per the Intel SDM (Vol 3B, Section 18.5 "Corrected Machine Check Error
Interrupt"), if bit 30 of IA32_MCi_CTL2 is zero, no CMCI is available
for that bank and no corrected or Uncorrected No Action Required (UCNA)
errors will be reported on that bank. Therefore, polling such banks is
redundant and wasteful.

Clear non-CMCI banks from mce_poll_banks in cmci_claim_bank() on
CMCI-capable CPUs, and amend should_enable_timer() to:
    1.  Check bitmap_empty(mce_poll_banks) so that mce_timer is never
        armed when no banks on that CPU require software polling.

    2.  Pin the MCE polling timer to a HK_TYPE_TIMER housekeeping CPU,
        sparing isolated nohz_full cores from periodic wakeups on
        systems requiring mce_poll_banks polling.

On systems requiring software polling such legacy platforms lacking CMCI
or when booted with mce=no_cmci, the mce_timer is restricted to
housekeeping CPUs. While this intentionally leaves core-private banks
(e.g., L1/L2 caches) on isolated cores exempt from periodic polling to
guarantee zero timer jitter, housekeeping CPUs continue to harvest
telemetry from their own banks as well as shared package-level
resources. Synchronous (#MC) exceptions on isolated cores remain
entirely unaffected.

Suggested-by: Tony Luck <tony.luck@intel.com>
Signed-off-by: Aaron Tomlin <atomlin@atomlin.com>
---
 arch/x86/kernel/cpu/mce/core.c  |  7 +++++++
 arch/x86/kernel/cpu/mce/intel.c | 11 ++++++-----
 2 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/arch/x86/kernel/cpu/mce/core.c b/arch/x86/kernel/cpu/mce/core.c
index 765e8103b0d2..b01ad1a9b455 100644
--- a/arch/x86/kernel/cpu/mce/core.c
+++ b/arch/x86/kernel/cpu/mce/core.c
@@ -25,6 +25,7 @@
 #include <linux/delay.h>
 #include <linux/ctype.h>
 #include <linux/sched.h>
+#include <linux/sched/isolation.h>
 #include <linux/sysfs.h>
 #include <linux/types.h>
 #include <linux/slab.h>
@@ -1759,6 +1760,12 @@ void (*mc_poll_banks)(void) = mc_poll_banks_default;
 
 static bool should_enable_timer(unsigned long iv)
 {
+	if (bitmap_empty(this_cpu_ptr(mce_poll_banks), this_cpu_read(mce_num_banks)))
+		return false;
+
+	if (!housekeeping_cpu(smp_processor_id(), HK_TYPE_TIMER))
+		return false;
+
 	return !mca_cfg.ignore_ce && iv;
 }
 
diff --git a/arch/x86/kernel/cpu/mce/intel.c b/arch/x86/kernel/cpu/mce/intel.c
index 4655223ba560..cc7d0dfcf9c7 100644
--- a/arch/x86/kernel/cpu/mce/intel.c
+++ b/arch/x86/kernel/cpu/mce/intel.c
@@ -229,16 +229,17 @@ static u64 cmci_pick_threshold(u64 val, int *bios_zero_thresh)
  */
 static void cmci_claim_bank(int bank, u64 val, int bios_zero_thresh, int *bios_wrong_thresh)
 {
-	struct mca_storm_desc *storm = this_cpu_ptr(&storm_desc);
-
 	val |= MCI_CTL2_CMCI_EN;
 	wrmsrq(MSR_IA32_MCx_CTL2(bank), val);
 	rdmsrq(MSR_IA32_MCx_CTL2(bank), val);
 
-	/* If the enable bit did not stick, this bank should be polled. */
+	/*
+	 * If the enable bit did not stick, this bank does not support CMCI
+	 * and no corrected or UCNA errors will be reported on this bank
+	 * (SDM Vol 3B 18.5). No polling is needed.
+	 */
 	if (!(val & MCI_CTL2_CMCI_EN)) {
-		WARN_ON(!test_bit(bank, this_cpu_ptr(mce_poll_banks)));
-		storm->banks[bank].poll_only = true;
+		__clear_bit(bank, this_cpu_ptr(mce_poll_banks));
 		return;
 	}
 
-- 
2.55.0

