Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020120.outbound.protection.outlook.com [52.101.196.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 178D9599A5B;
	Fri, 11 Sep 2026 20:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.120
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789157555; cv=fail; b=qtaKNAItGR+hrfeZbgs0PaMVnMq9k4Q+VmWtdTN7TrO195CK6YmPJol2gnpqNJ2HsVQXrIi8f8VXEceFd38HpcCD2L/9td6S2BSXBhfAJ8hkM/L/gBHJmEkyKLCGv62VQF5bJye7YyFBRNvoksn3iXWtyt0jrRpT9igIRp3ahkc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789157555; c=relaxed/simple;
	bh=/mEUK7CQlONSgwoJBZFdyzVSHuaOKprhdNzRzAA8sVk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dW3zobZC4FzE9/zDeycKIpjIoqT89XSBJu9/Q1oi6BFe7/pr9KH7yOay2QcVNrFpPJwOeWOE0+yV0fuJFKal/4lpFW79exTIK4rvU2Wa0Nj12gWwZ+EVNPAWtSRYcbPj93P0yARA+GWvumVE4tPSyNnPBw5oYNrHDAUe0FBPQtc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com; spf=pass smtp.mailfrom=atomlin.com; arc=fail smtp.client-ip=52.101.196.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atomlin.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WYUNuNucGuy/6x1hzcZDdchOmp9iMb4CCJLVtUWjq8fTFjWd1OElJRzw4sbTWJ2IM1eSQExbjvWZMPbos7h5eTvLeTeBaeJSIfXjC67WzFAUB+01mf/a4LsXmfy2lRrTDl99fBVflXQzc66yAIJCT3M3skgvkYBXJUsC4GnY5ogmjXr2JcvDe6bdG1HOSiJvEOnyAPwEk6/48KjHPkQ1bCVD9MpvX8xkWdZKzMkDSHlrwul11tXYTRBNksYdSXYNocweiw8Se4OXo8bT2834O9kNl9R8sLHAwP3U61HDYFTzV/fLqZTIMex1bI6PuUsGm50ex7zlGt/Yg45oAipCLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001; h=From:Date:Subject:Message-ID:MIME-Version;
 bh=cJ5shgQXXULb3pj/DfugS4L00WeAJz9RYHIslo0MYQo=;
 b=F3Bc5CNOXOmVswlbcZfgL8rilrFE1VWB7kpaLNe6fGm+0hwMfeNc9HQNVlQFKyUl5Pd6vF7r/+MWpFmt5EXArGRZljZ29nlYt1+R1s/5aipRgLsARoFEXzMu38XoKTEEJr030VZtpd4779M3PqwKswmjJLq1p5IXjLO05c2k4FJwWAWJyzWrpxyRyhP1Mcx7ERTXazeJcfct1VrIWeK5ARkLEJMO33V5oKmjejWCzdYre6AnPL2U5rlORyDWrgNwtxXPDc0Dlyjt7jptxpdswWT8QdVKbVoIZJmf8lppgPAQCaFGe0Upyv5YAjm9+Tfs+ZCuGmExtqev6zwQjRFsuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=atomlin.com; dmarc=pass action=none header.from=atomlin.com;
 dkim=pass header.d=atomlin.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=atomlin.com;
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:183::5)
 by CWXP123MB3207.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:3b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Fri, 11 Sep
 2026 20:12:18 +0000
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230]) by CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230%4]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 20:12:18 +0000
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
Subject: [PATCH v6 2/4] x86/mce/threshold: Fix concurrency races in storm tracking
Date: Fri, 11 Sep 2026 16:12:04 -0400
Message-ID: <20260911201206.532113-3-atomlin@atomlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260911201206.532113-1-atomlin@atomlin.com>
References: <20260911201206.532113-1-atomlin@atomlin.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN0PR04CA0137.namprd04.prod.outlook.com
 (2603:10b6:408:ed::22) To CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:183::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP123MB6607:EE_|CWXP123MB3207:EE_
X-MS-Office365-Filtering-Correlation-Id: 1aa3d6fe-1d98-4cf7-5f30-08df1040fa9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|23010399003|6133799003|3023799007|10067099003|5023799004|56012099006|18092099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	OmwM9Enc6h5ZekT74DpEgNFNgE49lE/jOyCFpskKw2XUQ5iT7kYwaV0vD6u+G/IM9piJbzGT1K/eibjEBByOLMItvHEkvazZcvbR6gWfHc4+A+PflGYc6iCBa79gpSvOgDdaQvCrlgXRm2DIYNenNoxuwjujsRZNB2X/yx7+c4m+cJa0Qt56mLyB3UDDl9vfOAnLkMHASYsqhXKyKxYnTtFtFHlHANArKomgLPsW8mO3BUxpVNwvCHyqwpocwHB/FTe/HMz86DMw614HRIyE5JGRJQLTecFnnL4pVXj/bKYJiDrwOP9SD0RReU0ayfnRly2gHpBRwzk3DCjEsuihPr9G6+RF9bLBvrcUKNCssQCniFJDfiLTDoM+HB9rCaRYRE7MOTvbtF+XBDMBDTxNLmIyQ1ZO004cpI6/DabbQidqgZPX2M9FTcpI+YWsoGJ4qe50ohHTqyXnJUkY6BhEgMI+PGA5Oz4bdjQ5xi6xF6qc9bPTT/zWrV62boCl8UTH1e8EO/VrMwiEXHhYEwxWIkv3M1NpS/MbO5mam7rhc+Kpv9T5uNxm3Iu+wFhGKMFMbhgwfqfAWQ/U5xASdLA90P5vPuUSSZMpv0UDpTsENnma09bQen9fLwMmh3iHP4M1hEwbdbVOQnYX0jGYKQ8jufAHVo1xFZEUkeeXFlnWXrA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(23010399003)(6133799003)(3023799007)(10067099003)(5023799004)(56012099006)(18092099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5MRWUJ0K6Mg3yMIi387chwFYcLfVuiYkeJhzI0CDLI42fXRDlvHKQCSXJ5YN?=
 =?us-ascii?Q?LwnWyO0mlaxdyM05ZleGhxtTycX0AYpzvxqGTipSyr7gxyzBt/C+AcI2CjwA?=
 =?us-ascii?Q?+V+h6pWuT2ZX6YLc+e4LvTcWSq5cQnVr9PQo59YkxcEqzKlVmMKgF1EYCWce?=
 =?us-ascii?Q?jE9xCCgw5Bh0+Ij03vk3wRqz3dQJY0KKv6ea/Dv5/ITb1xrBRTnq0UGDEvfI?=
 =?us-ascii?Q?sRScGbtpMpseqGW2NLC1YYKuDnGjT++FTfK/HTZ8TsNZU4y8KaX4K95tXy+z?=
 =?us-ascii?Q?d4EAuosT6Sve0WZE/k/ShpiAkXmzn4W9Je4W5RlaGSlYG7nTs9+EIbKgBu8Z?=
 =?us-ascii?Q?VPxB8ZAXa6xMc70XPpu912uKKKL+XDPZEMkEAhN7ao1rRnqD+XzckOC1rAoD?=
 =?us-ascii?Q?jtYl3y0KWWbaLWSRzCmPxjeqin81ENM8hGJTUVlH5xxMDn13P+VTthQKNhuF?=
 =?us-ascii?Q?JY4XwJlD02wdcXiMwNmDof1jtdp/boJIY/tG1eMLjAB4SSgPb/H7Mxo1vZ2k?=
 =?us-ascii?Q?w5GFFC+3Rd+PqYFOFX75mDZhTGzW6uygqlN1LcM106Nzm99tG9KsGUxO02uS?=
 =?us-ascii?Q?5+DKe0o/MN5XrRu9w/R0Itd8PzmHGDEjJGo24MB8hb2Shd8tLqAkwmzu8jA0?=
 =?us-ascii?Q?tDJJwDEEqmT+NMWamZ5zQ36DKeA11K4Ed2S1TxizjoQJDosAQ517MKG0CYfp?=
 =?us-ascii?Q?IBDpmuHoNQCQE+ffOAGQF7q5I+o6o6McChoJxx/cPPCAoiUW94+9yEml4+65?=
 =?us-ascii?Q?bBESBYZKlwQJvJN6n2PMa4mCcv6GREzzpLUGNJHmXZUSKuUrgIaue7sbvnGS?=
 =?us-ascii?Q?+dMsHnbPDTJKKdzAitg+hIKCbgcPzZrHBVh6LpvhAkhBegIrqiOGqKMtNMZF?=
 =?us-ascii?Q?Z0fFuzolmsTrME0UaZbuSw8Ul9NyDHkEdpJFTmC40B58JAoguQOgApjSvS9E?=
 =?us-ascii?Q?rcsGC89O7+9QNhCgiA8SxB+sqz0Ck5nezhDr0k3EKwM2trmVvqae3M5Fg1Hf?=
 =?us-ascii?Q?6qCl88M63jNLF5Fu3n2BPvO31vninqSv9BOhrTBRRjaTtx/3x9Jg8BXMeYoJ?=
 =?us-ascii?Q?FZAAvSqEfKEqsSisscJYogijBd4+pZ2uIQn7QjdRv2rqAbcULE0log8rgp0s?=
 =?us-ascii?Q?fDu5sJ+MMkeAIbki0jk9elz90xeKXoKraLspVcPMmyuqnvwWv87/hJMrjQ+u?=
 =?us-ascii?Q?F30TP4GSr50l8ZxpMuaJZq+tKHTy9LIDsTWFY1eoWDbovN0H21+fzuZs8Ioi?=
 =?us-ascii?Q?4vUC8V3xC+92Z1W69YH+//AQv14jtg5fTEpEKU9RlPFfufwSe+5ZfnMD/c4d?=
 =?us-ascii?Q?Fd/LOd620ZjJeor3YzycQ+2a6qGkmh5X63HSqdr9p5TAZhTdnpg49Q7jwcAb?=
 =?us-ascii?Q?YJwD8a4bWwphoS34QIUIDiktVfF8hsGEw3jHulUv0cSP8MRazlwdpM0zWJ03?=
 =?us-ascii?Q?bY5f0mNgI1zBDza2u/Q4Lh+9ylDCCTsumRtYs6dwh0Co3QbR+yCJPagTR6tG?=
 =?us-ascii?Q?ocEhNzzE39R0uKhVbYu52QrURpYyRrzfgWi/NRTaTulMCv0onD8lIqGAFtrn?=
 =?us-ascii?Q?kgis35mWS0ilTB56EoVWSRFSVvvWyCnqqqX3kI17GANvZtXMrV5OSbo6Lu8r?=
 =?us-ascii?Q?0yMaxIG8VO0F+Zxzzk9ZzjzMf43KaBkZAZitvUY1FJDuBbQFYWE6Og4UvSJE?=
 =?us-ascii?Q?0sG+4NaILwTYOceVmWISW5h1hScjIedMSYCRrkOole2OQRWk/GLEdP7Z1tUi?=
 =?us-ascii?Q?ppHVBGkznA=3D=3D?=
X-OriginatorOrg: atomlin.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1aa3d6fe-1d98-4cf7-5f30-08df1040fa9a
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 20:12:18.0190
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e6a32402-7d7b-4830-9a2b-76945bbbcb57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CkNh5JzifC/+GXAdumgmKSsKKzmHMpJcTCXdqleQG0vGic+9mmXXk/6efYBBesRcSKyKkDgiQTlVXN0Wwo2OZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP123MB3207

Functions cmci_storm_begin(), cmci_storm_end(), and __mce_disable_bank()
modify the per-CPU bitmap mce_poll_banks using non-atomic __set_bit()
and __clear_bit(). In addition, mce_track_storm(), cmci_storm_begin(),
and cmci_storm_end() manipulate per-CPU storm descriptors and invoke
mce_timer_kick() without synchronisation against local interrupts.

While mce_poll_banks and storm_desc are per-CPU, mce_track_storm() and
cmci_storm_end() execute in timer softirq context (via mce_timer_fn())
with local hardirqs enabled, whereas cmci_storm_begin() can be invoked
from CMCI hardirq context (via intel_threshold_interrupt()).

This introduces multiple concurrency races between softirq and hardirq
contexts on the same CPU:
    1.  A hardirq interrupting a softirq's non-atomic read-modify-write
        on mce_poll_banks will have its bit update clobbered when the
        softirq resumes, dropping a stormy bank from polling.

    2.  An incoming CMCI hardirq during mce_track_storm() re-entrantly
        executes mce_track_storm() on the same CPU, racing on
        in_storm_mode, history, and timestamps, which can corrupt the
        bank's storm state machine.

    3.  If a hardirq fires after cmci_storm_end() decrements
        stormy_bank_count to zero, but before mce_timer_kick(false) is
        called, the hardirq's cmci_storm_begin() will increment
        stormy_bank_count to 1 and call mce_timer_kick(true). When the
        softirq resumes, its delayed mce_timer_kick(false) will
        erroneously override storm mode, leaving the CPU with
        stormy_bank_count == 1 whilst the timer reverts to the default
        polling interval.

Resolve these issues by switching to atomic set_bit() and clear_bit()
operations on mce_poll_banks and __mce_disable_bank(). Finally, enclose
mce_track_storm(), cmci_storm_begin(), and cmci_storm_end() with
local_irq_save() and local_irq_restore().

Fixes: 7eae17c4add5 ("x86/mce: Add per-bank CMCI storm mitigation")
Cc: stable@vger.kernel.org
Signed-off-by: Aaron Tomlin <atomlin@atomlin.com>
---
 arch/x86/kernel/cpu/mce/core.c      |  2 +-
 arch/x86/kernel/cpu/mce/threshold.c | 23 +++++++++++++++++------
 2 files changed, 18 insertions(+), 7 deletions(-)

diff --git a/arch/x86/kernel/cpu/mce/core.c b/arch/x86/kernel/cpu/mce/core.c
index 765e8103b0d2..aa604d981358 100644
--- a/arch/x86/kernel/cpu/mce/core.c
+++ b/arch/x86/kernel/cpu/mce/core.c
@@ -2294,7 +2294,7 @@ void mcheck_cpu_clear(struct cpuinfo_x86 *c)
 static void __mce_disable_bank(void *arg)
 {
 	int bank = *((int *)arg);
-	__clear_bit(bank, this_cpu_ptr(mce_poll_banks));
+	clear_bit(bank, this_cpu_ptr(mce_poll_banks));
 	cmci_disable_bank(bank);
 }
 
diff --git a/arch/x86/kernel/cpu/mce/threshold.c b/arch/x86/kernel/cpu/mce/threshold.c
index 6c370d5af5bd..83f3e2250ae2 100644
--- a/arch/x86/kernel/cpu/mce/threshold.c
+++ b/arch/x86/kernel/cpu/mce/threshold.c
@@ -85,8 +85,10 @@ static void mce_handle_storm(unsigned int bank, bool on)
 void cmci_storm_begin(unsigned int bank)
 {
 	struct mca_storm_desc *storm = this_cpu_ptr(&storm_desc);
+	unsigned long flags;
 
-	__set_bit(bank, this_cpu_ptr(mce_poll_banks));
+	local_irq_save(flags);
+	set_bit(bank, this_cpu_ptr(mce_poll_banks));
 	storm->banks[bank].in_storm_mode = true;
 
 	/*
@@ -95,32 +97,38 @@ void cmci_storm_begin(unsigned int bank)
 	 */
 	if (++storm->stormy_bank_count == 1)
 		mce_timer_kick(true);
+	local_irq_restore(flags);
 }
 
 void cmci_storm_end(unsigned int bank)
 {
 	struct mca_storm_desc *storm = this_cpu_ptr(&storm_desc);
+	unsigned long flags;
 
+	local_irq_save(flags);
 	if (!mce_flags.amd_threshold)
-		__clear_bit(bank, this_cpu_ptr(mce_poll_banks));
+		clear_bit(bank, this_cpu_ptr(mce_poll_banks));
 	storm->banks[bank].history = 0;
 	storm->banks[bank].in_storm_mode = false;
 
 	/* If no banks left in storm mode, stop polling. */
 	if (!--storm->stormy_bank_count)
 		mce_timer_kick(false);
+	local_irq_restore(flags);
 }
 
 void mce_track_storm(struct mce *mce)
 {
 	struct mca_storm_desc *storm = this_cpu_ptr(&storm_desc);
-	unsigned long now = jiffies, delta;
+	unsigned long flags, now = jiffies, delta;
 	unsigned int shift = 1;
 	u64 history = 0;
 
+	local_irq_save(flags);
+
 	/* No tracking needed for banks that do not support CMCI */
 	if (storm->banks[mce->bank].poll_only)
-		return;
+		goto out;
 
 	/*
 	 * When a bank is in storm mode it is polled once per second and
@@ -149,15 +157,18 @@ void mce_track_storm(struct mce *mce)
 
 	if (storm->banks[mce->bank].in_storm_mode) {
 		if (history & GENMASK_ULL(STORM_END_POLL_THRESHOLD, 0))
-			return;
+			goto out;
 		printk_deferred(KERN_NOTICE "CPU%d BANK%d CMCI storm subsided\n", smp_processor_id(), mce->bank);
 		mce_handle_storm(mce->bank, false);
 		cmci_storm_end(mce->bank);
 	} else {
 		if (hweight64(history) < STORM_BEGIN_THRESHOLD)
-			return;
+			goto out;
 		printk_deferred(KERN_NOTICE "CPU%d BANK%d CMCI storm detected\n", smp_processor_id(), mce->bank);
 		mce_handle_storm(mce->bank, true);
 		cmci_storm_begin(mce->bank);
 	}
+
+out:
+	local_irq_restore(flags);
 }
-- 
2.55.0

