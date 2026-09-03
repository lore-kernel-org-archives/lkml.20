Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021132.outbound.protection.outlook.com [52.101.95.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D76950AC20;
	Thu,  3 Sep 2026 19:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.132
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788464547; cv=fail; b=AtfglnNPo5nBIjlbYycCi50otR3Z4T5QtHkL02zEuOJP+DKIXtYefXi5tGKpetvksYNLd2xJwOTPaa5hnCMv8l8vwb00/Wq4HOJMYwaULytI39l6AfLT/Q4+StutkUErGsf74CdYp3+AGNBGymDR5HkA3JwhXtV8GzNyppTNVKE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788464547; c=relaxed/simple;
	bh=Q9DrW2YewDwZJUolgTBqMSxxoOj82iW5zMm267tjPMc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ud3Z0knNwUhusFOSOJCwg+R9IZUVa1LIGc4XVqKp2KDISy9QP+LdyBfLCLxg7SkB0soc9bo3CqaRuOzBbvypH1pYaIzUC/+gxv4dOjkxrTtia9iRU2tlAqIR+29x69Us2o7QRWnsm0XeaVgvlB1Qtb3Y8iYurU4WCHk3blWJLys=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com; spf=pass smtp.mailfrom=atomlin.com; arc=fail smtp.client-ip=52.101.95.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atomlin.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ck1eOs6OLER8eveGDphKQE1Iscen8wvyL2xs+/A0f5zF42blR5dDnZtEH6zAK2M4Rt91NfoKaK+LFvLru2xHXswlE+qZdxDk/hB544MgNxxRRnacLc/ayRCpWvxc44yTwrAJ8HrpEhJSpxppwuH/4aFPfh87ld3UXJqRJ/U6Uohm/nTZzQUjj0jPQUNLdYG7IZbwSYHmoLtqNANv8tlyQC8JkJmCmwBl5k2fiQ4rVN1brSJTRNvJCrauuJsoZ4sLaj/uuvIfrgwzzou7Sh+VjuO12OYooAEjxft7/lNW1BoBcbycFUVnqb6qe9geTYupmrVpKRwPjHxCI58jbfzJ/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001; h=From:Date:Subject:Message-ID:MIME-Version;
 bh=lpTrbG4zDlSR1uBHd5oNWo1v6yMo/nohSwiL0VoFDVc=;
 b=IJigmFiUMu9HUIttvlYUQusPeRKWbY76deyKe7fsy6tozQpRLDiD+6h+FQoYPoAqlLO/4OYm5bwIInYJCDeTW6De9wRhWssFoy3V09wm3GP/TcLKD1vIPcdCTSSG38Swv2h4EaJS0TlUL5vipgBN1iN2jwlpzQmnoD/Fh0uPu9cNATzV10t4zPV2ZKpwbKH392shrdxCroq+GwxssfgdtKzwbnoUw+CIovBATfLZWyjRvYW03sVKkz3WtCpkr+WKlKuTzqdwydu57XcrxgVUNar8EwQ5mJkl7XiZQWY3Efh6LBtf1BUBOShBD/ulnA62eC7+OQlctY0EhKCjXs9ZFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=atomlin.com; dmarc=pass action=none header.from=atomlin.com;
 dkim=pass header.d=atomlin.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=atomlin.com;
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:183::5)
 by LNXP123MB3609.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:130::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.8; Thu, 3 Sep 2026
 19:41:45 +0000
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230]) by CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230%4]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 19:41:45 +0000
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
Subject: [PATCH v5 3/3] x86/mce: Avoid arming periodic polling timer when not required
Date: Thu,  3 Sep 2026 15:41:30 -0400
Message-ID: <20260903194130.186096-4-atomlin@atomlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260903194130.186096-1-atomlin@atomlin.com>
References: <20260903194130.186096-1-atomlin@atomlin.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0786.namprd03.prod.outlook.com
 (2603:10b6:408:13f::11) To CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:183::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP123MB6607:EE_|LNXP123MB3609:EE_
X-MS-Office365-Filtering-Correlation-Id: c7323ca4-e764-4c71-fa1d-08df09f362ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|366016|7416014|1800799024|56012099006|10067099003|18002099003|22082099003|5023799004;
X-Microsoft-Antispam-Message-Info:
	3FQbVar6Nuwa02xJxCQQb5UeuOx7tfooU1NkjxcH4/qLaOJjKc9bt8OwAdQe3BC7fm+pjLTgLC+TPWJepxl37aRFaPNmcryA4AFL9n0/b8XYagK/NTBLIsv9s3bw6par/D2GKSFetA1ghoxeYQK6NZYmKTv1f4ekRiqgq2afarovc3vWC4j/C9n4lZzzxP/6d6InFtCE1lSn4vD1Ng08oJtYvW4SNmVNmuHF2naBD0cufdXqyJJza/XuvnSbCsuCo/ISrUUH1J9UG0r2CE4PDYIl+NY4k+z0ZF2ZmtR6HKEB6YDlmbbbXxKVXeYGQzGVLv0LPlNuLMztHV7KerYSpqKDU5SMkzggOOVvSQXxDAcDY4q0yTy27pPmAxqmeTQgBRj+/YGDfYBDa42ruJ1sbWZwKk4PJ4AwqpeL2H2GsSeaUy+JQAdwVh81QmjqEULwERfX41sZPV02LDCuNLtyJ2g3mJjSkcTJN+kvSXiCiIGLuo24Bp+BO1pwDshi9NPHEyTT5PDLFGJ5Ff5A3q6XO/9QrOQfm6CP82P2/1f3AQTFZEsaPhFw3WaHpB85bRiWGESM1EaQ3LoU36uLUZPemv/MuuQwo7Onz+hlirFVJHeh5RskEhXhWQI0lEqStkdt17Txyh5yc8iCq16bSZSjI8KBQIwpilyIaOm43PFkfgo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(7416014)(1800799024)(56012099006)(10067099003)(18002099003)(22082099003)(5023799004);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8hyVhUqWWrIc9llLna97B+TYn1tdAJHrG2gVWKW+T6mAz+w7mnKKDtfVoQji?=
 =?us-ascii?Q?3RocOc4a07yDU2VilIDlKO9e+LuccB7BAf1qd1D3N9S7u87TuRdTGUMVfXGI?=
 =?us-ascii?Q?OnGvGLHFVfzSqGr48mCEu17l6Rpl1cGJtFXuWUN5coT/y9dG84q2Xq0/NLCF?=
 =?us-ascii?Q?l4dd1JBoyZ8DQEPTjd3kIeEes6ypzGiHYobhvjSmFvSU497GdvS9QnVSPCT9?=
 =?us-ascii?Q?EV58H5wNcyO1/t7myth3naBEs/aCCEJ+gbLGUWnPmJiXiGv/dv3ZIFiRVejv?=
 =?us-ascii?Q?Yd5MBwhZ66sZzEJB7FO9Z91Msxw8tVkEbHU1O5Dowo3TcZgUXuCgG0OrGiKO?=
 =?us-ascii?Q?fbP0PItJI9xFWEwe5EfZl55QtoSv1BqCKgS5GDjw34l0vTC9mDDMuVUIcVug?=
 =?us-ascii?Q?1jWQk5RSjbP+hkEQ8x2Oy7GvtSluGfcPKEumZEK9Cz+n+W510WIoxmx6YERn?=
 =?us-ascii?Q?DArbWlT1jB62E4IweXkAGMhmVSERhQpdYzfG7wO+URLQDE4DLRLUozjkcq8v?=
 =?us-ascii?Q?WkG41khjngmhfy2V2WTYnoN3/VCWWatVBjYiAR2xmzwhulkJbS07H8t6xA5m?=
 =?us-ascii?Q?YgBhrM3A8AOpLgiDSED/QUn9H4/CpEbdntJ+V9p+HvxN+vBrJSwdt2hw+vqF?=
 =?us-ascii?Q?XzRI0BNBAoHfXDyE+/YQPX28aOrKbxRFeDfdYsBpIqEbYiB3Gw2eMSteZMK0?=
 =?us-ascii?Q?y0U0rpp2yvekU9xWAm9uUQwMGmJZh2lj2e3kl2OFJdCpkZt9Now+N7s1mWeJ?=
 =?us-ascii?Q?QdogD+wDIy59cnMDShLRRsLDq4c1XUr1OMGG7iNZQ6nCTk+XQeq18ZpF0M1N?=
 =?us-ascii?Q?ZXXt6vDc41TDBkqcojeXnLqRKfqenvcVBYZVRl0jsWP+r21TaAt//tGaIFUQ?=
 =?us-ascii?Q?XLU2nP0RcYZvJHR8PXUOizGfd9VuKkImlHFdQPdthL0E4rQLgrkFzhTWX1T/?=
 =?us-ascii?Q?h0nj3HDR/vuLw+GNnekBdeUudaHxO0A3LwaaX1elRN4ccryHdV5KiXD2jxDz?=
 =?us-ascii?Q?dmD8HUoeT1Z6GuCE0kSrYQt2uQW8WHpKIFFZ4cjY/l+Kih0Tg8d0oT+GSyJ2?=
 =?us-ascii?Q?yNE8LG9VLBq96enYqCquU6plysEoteo60I++30qldNo8T4KuW5VOgr/p1JPv?=
 =?us-ascii?Q?00hyBE3Zaz/yzz8rF9qWbORzSOZ06MPNnwsuEhw8aKtY6mhEHZAW53/D6IuE?=
 =?us-ascii?Q?Q83BL61PPXU45De1Ki0n0gJ9KnSN0B7zPLyqFwS4sCVpXoBo5kwVDG8jUETW?=
 =?us-ascii?Q?0lAwaI/xIgq8/d+K+reR6ZEIatmLkJAXUnmCG/1XJke8QokVMjP3gzh7ASgV?=
 =?us-ascii?Q?kNpJv/2VQH0H+JieS3UDvySAl8bH44DrYevlfAv1kpZEKDUDIZeWPFuY2fMC?=
 =?us-ascii?Q?26b62dnv1oIcm9XoDgStV0uXlh8e3zG6801ys8lk/oDh1XnpqVY+EL7z5dHK?=
 =?us-ascii?Q?OupaCmYX0+80w6D1CrDzethVNbie4zSTddQXmqsX/sxfG0txX8QAidFGJso2?=
 =?us-ascii?Q?9k41z0+GMf4YzAAm/rZ40mB++KgMhWYFFpnNslAHWbiq1OeQu7QeB5ZIxGqn?=
 =?us-ascii?Q?xvDZ3wG//VykdrueiOqGKTTj9t+1vxiX0sLzxBfSHMosoW++prB7X2RYVKo3?=
 =?us-ascii?Q?Nsi7QZVJsS6Dhv1rN00IDP1H92FVK0wQV9bfc4edR/NBA4mNM7eaUheR81Uz?=
 =?us-ascii?Q?ccBTYIC8aCbgjWyKseWeTL8Jq3woTnnX3CxhUa6PIExxA8bmBEqCKG7a38zT?=
 =?us-ascii?Q?MM3E0f3vAA=3D=3D?=
X-OriginatorOrg: atomlin.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7323ca4-e764-4c71-fa1d-08df09f362ee
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 19:41:45.3127
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e6a32402-7d7b-4830-9a2b-76945bbbcb57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pm+AqpH/dZskb/QeZj1DVxy4d/L6YP1beW8n0W7IpaJO83TTFA06luecXRPec6p9hSfnv4ZBqsqe+WMdydG93g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LNXP123MB3609

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
    1.  Check bitmap_empty(mce_poll_banks) bounded to the number of
        implemented banks (this_cpu_read(mce_num_banks)) so that
        mce_timer is never armed when no banks require polling.

    2.  Pin the MCE polling timer to a HK_TYPE_TIMER housekeeping CPU,
        sparing isolated nohz_full cores from periodic wakeups on
        systems requiring mce_poll_banks polling.

On systems requiring software polling such as legacy platforms lacking CMCI
or when booted with mce=no_cmci, mce_timer is restricted to
housekeeping CPUs. While this intentionally leaves core-private banks
(e.g. L1/L2 caches) on isolated cores exempt from periodic polling to
guarantee zero timer jitter, housekeeping CPUs continue to harvest
telemetry from their own banks as well as shared package-level
resources. Synchronous (#MC) exceptions on isolated cores remain
entirely unaffected.

Suggested-by: Tony Luck <tony.luck@intel.com>
Signed-off-by: Aaron Tomlin <atomlin@atomlin.com>
---
 arch/x86/kernel/cpu/mce/core.c      |  7 +++++++
 arch/x86/kernel/cpu/mce/intel.c     | 13 +++++++------
 arch/x86/kernel/cpu/mce/internal.h  |  2 --
 arch/x86/kernel/cpu/mce/threshold.c |  4 ----
 4 files changed, 14 insertions(+), 12 deletions(-)

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
index 4655223ba560..d264ec8688bb 100644
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
+		clear_bit(bank, this_cpu_ptr(mce_poll_banks));
 		return;
 	}
 
@@ -250,7 +251,7 @@ static void cmci_claim_bank(int bank, u64 val, int bios_zero_thresh, int *bios_w
 		mce_inherit_storm(bank);
 		cmci_storm_begin(bank);
 	} else {
-		__clear_bit(bank, this_cpu_ptr(mce_poll_banks));
+		clear_bit(bank, this_cpu_ptr(mce_poll_banks));
 	}
 
 	/*
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
index af8346f06318..af8936262613 100644
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

