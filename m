Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022116.outbound.protection.outlook.com [52.101.96.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1609237F30E;
	Thu,  3 Sep 2026 04:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.116
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788408815; cv=fail; b=FakAIG43UaiP03AXiaLc6/3jeHqCeeJeMh+ZlKMy76Uh38qzF3jMmDD6stQWQd3i2nyGxp6AsEQSSLG3L1BRGhocPIMx85J+Fbg1TZzaHr8bzRdR0oLR1sy2JFLp0GgYVcGizospE8H35q8/f9Ijqe/v7sMCftQDp/FqBCHiUgI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788408815; c=relaxed/simple;
	bh=qsub2Ef2Emn+AuqpV4a9lZeHTLqkloHPjuu+Jh0Xj9E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=H86z0gpx0PcZLLIJVUL7sh9sPrMwaHrmuNBzRWSyCo0Ag6lkGWsCjGxipTpyXfw/1mSeFX8uc+vPMsMKj0dIg1CZ1nNjI7bZz9t7CKAhsr9judhimj3smAExPAmJh4nNYR6GJk9eLY5Y+N30NE/aOTQnx4SdVzsTpyDIA0hfHZ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com; spf=pass smtp.mailfrom=atomlin.com; arc=fail smtp.client-ip=52.101.96.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atomlin.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SnnMRUWrb605qEn+17vpI6zRNylQ6K5FFtNh40NkJHK62IsXshh1UM7fFnNErH+RRpS5QMSoAKV8rIhI75Q3qwqL+758C40szbEuBjFNYoewBqoYo2ecmUUk3vQcjuHJF2IqE5o56hbgJT7cgez7QhUb+OaQHQcuor+mFgMePuZBubj5u619CJ9mh/VWMBrfSx7ndhPm4fQOCPJ5C6lQWkIcMe7T+2mdgtcYLX5QcOKBsCL4nesFYfYlesg/u+wh1qA5rd37k1QnZd3s3fffgJB4FBAe1uJWMPqUvOrb4nUAKCRDZm8CubrQIbvlEaiM7ZMk9zy6hlzY2VQhdFwFzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001; h=From:Date:Subject:Message-ID:MIME-Version;
 bh=wwbGd+X+0vEJp2F82VpwMkfsNrp7L84Hf9zzDuafVec=;
 b=fzJglyT4ojFkD7cvkAF4rU2V0bs9AMnHWQ2TqNcps1XgJRSkHZfMfC9z2yML01LWuqJGX/WJdUD7Pm1fgH6Lo2gdrupxJ7gh6OlWLm0s7fbt2t4nbfd9YGHEYaMBTC2nVjLGHspXycpgxwOsNUEvQNvicOsSvIv7B+OVMDMdodV7pmsCyeerFrv6M1fyWcuyTBwR6UDp9dgx30bUQAO2TDGq0Pyg+CMInjsqevREd434NiUf550pUQLAEhmC3Pj2jhX2wONtXxvRhvmVljBSM+sX74bYC9Y0HTEJp54EhLj0iAQ6BQcwZmdM5nCcOFFnTCY9UeFmnhfGjU2eX8hRPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=atomlin.com; dmarc=pass action=none header.from=atomlin.com;
 dkim=pass header.d=atomlin.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=atomlin.com;
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:183::5)
 by LO0P123MB3868.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:13e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 04:13:31 +0000
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230]) by CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230%4]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 04:13:31 +0000
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
	neelx@suse.com,
	sean@ashe.io,
	chjohnst@gmail.com,
	mproche@gmail.com,
	nick.lange@gmail.com,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/2] x86/mce: Avoid arming periodic polling timer when not required
Date: Thu,  3 Sep 2026 00:13:20 -0400
Message-ID: <20260903041320.179965-3-atomlin@atomlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260903041320.179965-1-atomlin@atomlin.com>
References: <20260903041320.179965-1-atomlin@atomlin.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN0PR04CA0076.namprd04.prod.outlook.com
 (2603:10b6:408:ea::21) To CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:183::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP123MB6607:EE_|LO0P123MB3868:EE_
X-MS-Office365-Filtering-Correlation-Id: c3174e50-16a1-4cba-ceaa-08df0971b6a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|7416014|23010399003|366016|10067099003|5023799004|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	9m9lmRyCVPgeqXt9bS1Qi+yX9IV9FihRt3eFebSShCeQ4JFtruLcd1hNFJlDk7IaaLNSCUPNyED/gaOPlwoZZkSL+pC1j12UsfUKaU2VRHWZg+oUVXXT+8B1B1chUDevbzkRAnoceyKNvQaIEG2Dg24qB0CqMwPu5NXiYr4HoaZ3exrrM1rG7RCwN+z89D5zca35h2aFa5Yd/5k9KtMxJjeZzfLLZ4xOphHY1LJ3PaR75w0EY0wCiORCLL11AuuHvLQyhSoo6gGcwRrBjYAQIo8et6+UrNSEH9m30c7joC3plH1rOyXUKUj4CPEH3klAf/9mj0CHP5xEFbX3eRD8+YoOygU68bZezBWjQDmVcGHH7cWtUn9Z1na/rEfFZUKgNZjyrLx0Emh3+Xc/eOXbhQ08KHTQ7G2lY09du8dH70LkbOX3yYJtj/x1M2Fz7W5A37NbVDhKFX/burTYLKCe3kN5mElVzNCRaDqsHIU/juKYgax3So6JcBA0tVOOlv6U6AeS+UBo/unnp/2evZQVCDgL4LjsnM8v3bMc7exYPWdtV3o8+bzlPgwG30BNBdN0bXK6S2TUxAZt0UyLxDkf4zWy/jWFsUVHxuK4UszlLCvsaxJJplzdi0cx1jfOtX8XZAHYWtVbmuOW007Np/iAFgLcfLs65gWjuFgvlCm74QQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(23010399003)(366016)(10067099003)(5023799004)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MiJdXF1v2lFy6jaIuboVIWrDFMf5t/5FkvovG698PUsbVOCjR4jKjiwUCGN6?=
 =?us-ascii?Q?/ffT7KkhYbLf38Up50csmTH6lZYWpVuDtNQBBac9rJJxHJkDgKQ2Ny/+StGj?=
 =?us-ascii?Q?kdEApBw2GbYi1IJG9NU0ofr0dmmksB8nes0sZx90ivJQ5LN6vCOyXr3XmSV1?=
 =?us-ascii?Q?+uoGXn+zAXhhsZwpcQ9LXff7CKE0N1irEZLr6CTcZyub8XM/LxzY9PRhHUsk?=
 =?us-ascii?Q?Frvvb4fA2Uc80L2W+hVQtLP83F/39zq6gLMEANW/gUVYBUmJiORypycsE+Ub?=
 =?us-ascii?Q?JTz50ijs+AN3Lg7F/X5KMxf8/E1K3N54FIWesfOT+uOPLqo6ajFxNuBAbcN9?=
 =?us-ascii?Q?cnQJtRm+JTMMC+yVYTNMqVrgBXsJnelzMu+QBsW/lHtiNtyV2AgM9VhjttwP?=
 =?us-ascii?Q?A/2QGAcBpfV/sOWlMDZxT2/fLXLdvd6l0u5pVJautLHe6UHlo0M0mZlE/rZ9?=
 =?us-ascii?Q?hfeuG3OP5DtQ/+yBCIoP7Ke2ILJD8dS2sL/sDfpK3wxeYJbwQfrxETzzxp2h?=
 =?us-ascii?Q?lZC+LRb9WgI2X4tyTZ1akxY3aLLhjNxikxOht05vD/1V+FoeKqm9vGrjcw3g?=
 =?us-ascii?Q?2aLQvvAbR8qz3Q2N/Op1rWc9YWQ/h69m+4rsU5LgMnFD/s0/AzWqjufwn3wn?=
 =?us-ascii?Q?d1XEsTTTW5U5QZMgWJrbNjyOZwVlJ9GJQ4v+wFPpUgWHuckE8HGutJhpbbw+?=
 =?us-ascii?Q?v2NTkKk6HWX7pV9HVL0DIS4DG7tuflOfsO/sEjLTYrvkVclhAw2sEqeb9+72?=
 =?us-ascii?Q?TjKD1j8MsRDd1R2N5lLNQ+0Di6+NaUzffIZ3qdeEiIJRELYCLvm2fAjxW7YQ?=
 =?us-ascii?Q?uLjzNhtfPz96Uw1NYjYI1UNB/psFViQIo6nTDHeEsPAJ8xb91qgbG3pQ8NeS?=
 =?us-ascii?Q?rY66Mb5JnHYwZ3TRLNvCGNRKFjxb5RZ6FaCXFun3JC2H47Nmw+gKU0ifa9Xw?=
 =?us-ascii?Q?E6giaEKE3Q+XqBH0zd2NUeKWf0Fm73eAHS89EEbo8Q+nnYwiLjoOFNSILQb2?=
 =?us-ascii?Q?quO/EE2QYTcC9z6S8kvzNlSpbdHZcAIfSOCGGiEXBDFwMAfHINUUtRwLTwDs?=
 =?us-ascii?Q?bk0iVUwiwI+iU87v0prKGKS1g1dQuPwBIKyZVZomS28H/ouH5BvMXTlKpwBi?=
 =?us-ascii?Q?iS3SLvk9f8fUkbrWeVnXNWvGKOpMZSa7rlnvwRkTp0FWvl/11jfyZiJjpCQX?=
 =?us-ascii?Q?VMpVehSVukh+r6H4gEHjOd0CaSxcg3dBM7eEa0gp9W/dl3nQsSogh6FBGFQd?=
 =?us-ascii?Q?94IA/9mg/ZdNRDhFZZRsvCYaGaUPqvXBFjmKsLGuN18UqrvXMwHc9d/ze8TR?=
 =?us-ascii?Q?KHHjdxT7KNVwj+QL80dDbSyFX4i5G3uf0a6ibRjfVhSi5COKHVsgMNVDY+6u?=
 =?us-ascii?Q?BGkTdTaDg9bMmjSuYAQrIgW8tSipKdSQ0EqFhTBYX1S0qD5EX8ivwxwC0zpO?=
 =?us-ascii?Q?1TEqHBkUXiw0PNx8TGyWNzRSb3+i6qnbQaZUKaanYHE6ktJCom9IFM6bU8wW?=
 =?us-ascii?Q?U1B0kG6csW4nLmpJlRp/6aTzLuLkwYkWcEUXMhsQBxDhsZoGJskk751+zxpU?=
 =?us-ascii?Q?9x22Fwgi+IhL2/GdC/ii6pOnRcGVuOaaB5yhiAiY1XWPrOZNz8k3cr9njAIy?=
 =?us-ascii?Q?phK++OlzcwUA9s3RjSY5fHz9pzOI9OjzshcizCleqbe2PUoDOA0pK+5HJqwE?=
 =?us-ascii?Q?HOQNb2uTXhD5ZcjdnOHhD3hQIgpzIIjONSyo5M2Odwv4kyfTZAUnGOA2KQty?=
 =?us-ascii?Q?+WiW9jzGIA=3D=3D?=
X-OriginatorOrg: atomlin.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3174e50-16a1-4cba-ceaa-08df0971b6a7
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 04:13:31.1402
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e6a32402-7d7b-4830-9a2b-76945bbbcb57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BooOxb5dDT95hhhzZZGZGQLuk/CoFjqkbiO28siBkMh1LguHtLyS6TVxZAegy9yl74vOjY/+6s+TndZiMUZ4fg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P123MB3868

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
 arch/x86/kernel/cpu/mce/core.c      |  7 +++++++
 arch/x86/kernel/cpu/mce/intel.c     | 11 ++++++-----
 arch/x86/kernel/cpu/mce/internal.h  |  2 --
 arch/x86/kernel/cpu/mce/threshold.c |  4 ----
 4 files changed, 13 insertions(+), 11 deletions(-)

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
 
diff --git a/arch/x86/kernel/cpu/mce/internal.h b/arch/x86/kernel/cpu/mce/internal.h
index a31cf984619c..32ae574d2ad5 100644
--- a/arch/x86/kernel/cpu/mce/internal.h
+++ b/arch/x86/kernel/cpu/mce/internal.h
@@ -84,13 +84,11 @@ static inline u32  mce_get_apei_thr_limit(void) { return 0; }
  *
  * timestamp:		Last time (in jiffies) that the bank was polled.
  * in_storm_mode:	Is this bank in storm mode?
- * poll_only:		Bank does not support CMCI, skip storm tracking.
  */
 struct storm_bank {
 	u64 history;
 	u64 timestamp;
 	bool in_storm_mode;
-	bool poll_only;
 };
 
 #define NUM_HISTORY_BITS (sizeof(u64) * BITS_PER_BYTE)
diff --git a/arch/x86/kernel/cpu/mce/threshold.c b/arch/x86/kernel/cpu/mce/threshold.c
index 6c370d5af5bd..2a82c9f6b5e4 100644
--- a/arch/x86/kernel/cpu/mce/threshold.c
+++ b/arch/x86/kernel/cpu/mce/threshold.c
@@ -118,10 +118,6 @@ void mce_track_storm(struct mce *mce)
 	unsigned int shift = 1;
 	u64 history = 0;
 
-	/* No tracking needed for banks that do not support CMCI */
-	if (storm->banks[mce->bank].poll_only)
-		return;
-
 	/*
 	 * When a bank is in storm mode it is polled once per second and
 	 * the history mask will record about the last minute of poll results.
-- 
2.55.0

