Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020120.outbound.protection.outlook.com [52.101.196.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0E9C59E34A;
	Fri, 11 Sep 2026 20:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.120
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789157578; cv=fail; b=Hisarq9HEkv92231C2pEDnUlmsy8SG9x5Anv5vTL0MxNC1AoAapWFW6klewtdMEzr9ntJv3ZGmmxit6ITrUWDPjbuCPgDzWzado1WztlhSMveGefLZpyrsUD9pKuwxxigpsTsH5KnjfJBHppUMd4swO1HDFrB4fwKBVIlBYxy/g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789157578; c=relaxed/simple;
	bh=7PKpg48X5nZ+RMwBuEDobmhbR9PynGOKN7rO5F2QHWw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hWt1hgkuX4+AitPjRdxeon30MQrCGZe/3yvfvz3N0xLaIXyfkA82eIsruytR4VT9N8GKq815nvA/PnXXhGv/ifllt41khPAnth+C+W5QB4bOx+CIxzqYVwJkD5UrIMX70Ag8u7GGLOL2ofkl3mTSKqJOeuFeWuWLSvEdYkvTK4w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com; spf=pass smtp.mailfrom=atomlin.com; arc=fail smtp.client-ip=52.101.196.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atomlin.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o49vc6hNVoSc3UfIz1f0jgimPG5D2RdgGobYv6Tk1OerW1Rpv0NrEy/GCVjHkCcaDbn7AEMjnVSbeOZMOkN502bTNZsmkQMoIYkNJ+CKm6iXZV3TvmRXwow5MSHsR5zlaN8QcHmH14Ai0OOyXcLJW31hpMIA4pmZ4OAfNFCCoXznZZCThf525TqlJQumz21ZZzMJGUVWsN8dXXcXb5JCqeV4B2lxEXChcpJ+J/y4UHD40leN2N4tU+hd2Yl0hgTOnftKDmn2Nzf5x6JLwjJkTkJRRBUrwjkci9SiHD6ja/Qh3NNZrZ+jtqN3PBOxOf2KUfIaAzUzIdUjZDmZzCsQ/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001; h=From:Date:Subject:Message-ID:MIME-Version;
 bh=tA9fYcmD1ljSRzqTGxb5kE9UX31Sz5uuMoJyWsWiW1M=;
 b=snfewK+r3Y+E0OHmR6p4Vh4sW8ru+K84ub5xKz7XNjxfaWhequZj4OcvWvQQFnexS/k9ABO99rqDoOsPjD/CjPw7d2zTNoXmC8INVnqB3W1natYT9YzU8uGSI7nLXWOelEdwBmXOSDHBvFHslVCvsQhtXs5X3tz1pVmUpsZSgogEmXMf6N2LmCHRJRJEXnVNAkxEA55Pu45iUJ0KmWojJ/QHvvddlP8j0AiXMWPpKt8FRRK3ljIoCwWI2qpOYjJvmAaTN1bKYJfKrUzJflcqDQ/USff/dcWuZ2WGslp1ujyQ5FXreDmUheLlHydF6q/nUHEwPERKfusByXUibEsIDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=atomlin.com; dmarc=pass action=none header.from=atomlin.com;
 dkim=pass header.d=atomlin.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=atomlin.com;
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:183::5)
 by CWXP123MB3207.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:3b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Fri, 11 Sep
 2026 20:12:25 +0000
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230]) by CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230%4]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 20:12:25 +0000
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
Subject: [PATCH v6 4/4] x86/mce: Avoid arming periodic polling timer when not required
Date: Fri, 11 Sep 2026 16:12:06 -0400
Message-ID: <20260911201206.532113-5-atomlin@atomlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260911201206.532113-1-atomlin@atomlin.com>
References: <20260911201206.532113-1-atomlin@atomlin.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN1PR13CA0027.namprd13.prod.outlook.com
 (2603:10b6:408:e2::32) To CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:183::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP123MB6607:EE_|CWXP123MB3207:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b809564-c98c-4483-0f19-08df1040ff1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|23010399003|10067099003|5023799004|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	p9uN9EPAOtFIYE2+6oH6KlGVlkkkUjrVRWNXcviCpxI92DfWQqZnn2ovG2bmS+35rpxo/OXL4MWZkp8kr3LyCibSoZqpm3YHjmMYJwDbQC7uFDa+WuVyz8RK2Bkv2hfj7eTelGJgFPQN9w6zFkH6Mczc1XPP/Zy7mc878RwH8pyK+jXP2OyCOeNW25eIOLXYU2U+bgsMyyz6sZ41zhLTaE8A2Jc1sfDFtCVDSDZQk/Q6ilRWOVdaDOwfyBCXcfyuKIPefJGq6iH9x6aOqQL0uq5lzg0Cgkgcx0AIqTj9+kj1Lb6kq2f8tBaiPi0CAkb7ENXQWqc6E2shcYN48JgVxnaESc5IK9iiGmTRPwUvUEC96KQpk6AZjOyd8CZnBMxM0TvClIrNX/SDL7HykXoQNFBmLOk5LT9V/qrCbUJJrRAF9orKrNB+FpcArrIchq1KCKVeYUkUuXi5FtqeFU/npt7Y/zcdiLtoO72XbA5f19CMf+xFbnB1ol8nu0+O5mxmWlqmCHhwHX/QwH+ijAzOk2BvL8M4t0/ndnmsmXLxVBXhbZfireFWwIhjbPbboLBJBZEcpDrPLrLMNFLdcTbaWrpVporLuhJTOmRUlMuBzHDjd8qyL/gPoqosac+bp71n8K8H4yo1Y+3tfbmHPU5Rl8Xd+ajdE+5hQoKjnTHeL4w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(23010399003)(10067099003)(5023799004)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pOc3bSw9bbcfsjmtsd0fLc0me3zd5zphT1JMcibOXuwimC03Takh5yefugtv?=
 =?us-ascii?Q?6sctaI6/xyCHxetnjdVpqcbvahmgmYX3sDESIRXfWOzrnuebznoJ93KmdUbQ?=
 =?us-ascii?Q?oHo1MfO88Nw5IR8NUfdc2lQhmwt2vBmAMVNyStvMOzsBGtNvyHEA/DOvkV84?=
 =?us-ascii?Q?/GGBvHMYBmCVNvXuyvcXuj/SHpnLog6W35x7AvkmzXKDdJhYUtiRLZdjpUoT?=
 =?us-ascii?Q?8ug6suhlxq+KRVq2p9eU+vIXF2NdjP0jURSnL5GYGezaBjrSGCzXihsce5L+?=
 =?us-ascii?Q?/Ah2yj6UIQpv41x+Ns0NB2LlIp/KbU6oYtGAGpTf6IxDhzdzMNChMAKE/thc?=
 =?us-ascii?Q?IxX6QLh+/SaCKfA9C8mnWNTTRG/TVVp3IMP7m1N6QIRxmcUgSwnzg6yzAEve?=
 =?us-ascii?Q?2Zb1yHBfQfyHe452hIOa4m4EjX2icFcj0V+ddFrKe6VEZJ9Ht9MQ392/mjQI?=
 =?us-ascii?Q?Ke1VAyvOXm3p8l7ggygNaewuwZ8M/WdMJq6XH3eAaVBeDa6W0DhKIxHVNkI7?=
 =?us-ascii?Q?2H0FWusTUN6F6ahkNL3p2H6KcEMwMQjGXlGVcvZLr2R+r3hUJiDiUfjiWcaC?=
 =?us-ascii?Q?i6Zq77ouqN6U0JtHCwzcKH1lRobSWEHtNBD0o5l1zb9TzdVFRsNzq7iUcttj?=
 =?us-ascii?Q?xNMGOtffXaFctpDVJjVajb2KhuUGcrB4VbLhBKfJTGGiSAT1Dbmj69DUQzeH?=
 =?us-ascii?Q?+BuL5QkbD/5VNk/0PvKnbD939ENvWE9vg6dFLVKgUkYn2QLmVFUUMoA10SmF?=
 =?us-ascii?Q?N7xdPAZuD1RkUnFW8R/RcO6mCpTuo2h9nSJx2VGdfIahzWIUWNglVckTTpng?=
 =?us-ascii?Q?Nl/oiIxIK6CfrtntnTgD//iEHmXfF7q8BOuytqxmv9/LY0g6GXR9QmwiMBh8?=
 =?us-ascii?Q?52MvL4y2ZRq+P2MioUNRhI2YdFqueuotHBWY6YEvUn6xKN8imsSchD6GsjeI?=
 =?us-ascii?Q?mx6Gdnry1yTljEUpJtTES30JwYizQo9mCjvpWDUq3NVfA09mcsYI/EWLW5jx?=
 =?us-ascii?Q?M07JLEL1yalnMQMp6m75tQgw3xyTVDiCSmt1kFHCoO2NfNE/1NPAmOHpfY4C?=
 =?us-ascii?Q?ewbQdZoH97xPREX5aHTEQBBK3FVwmIrTtmJdn+jtj9OBhTTPlT2+9hvkYwy4?=
 =?us-ascii?Q?KjUtfDtphd43L054c0C8DfLwb3pMbkji4gdO8ARieaa+5mHnr9FAxk9XEj9H?=
 =?us-ascii?Q?OmFEvUVjGVqywG9xJCwaYsZSpAnGCbIZkh/0SbXqh8lkuzYQMILOeGeXAjpP?=
 =?us-ascii?Q?oN6Xx2fop04E87twq2TjK1iXt8pn59P2Ih/F1JHY65jziJ3XglvKLSp9phKc?=
 =?us-ascii?Q?+FFQJ77WJkRuMwB8OvuvrUFQx75MjB9PuxwEgAV351OXeQEnO4lL023FDQ+q?=
 =?us-ascii?Q?uG+8rSpWiD5V8P2iVbUZ4i6jn+v52fOQtTLX4DdbCx/KdRk8bUCSeAdbhA19?=
 =?us-ascii?Q?RgFilZkODLaycZns7Er2g2OLxMluL9+PX8MBhuSFvkOvQiV0GnselHgflvcP?=
 =?us-ascii?Q?qy4dbc39NtB+vt4izmqi9qtdAGitUlU7ARozwEk5yBkvhN2iTud6kiU54Pym?=
 =?us-ascii?Q?4fwpvnGhsXwkMVFnUcchqGOeomDBbhtNOtNcjrvj+9X8XazvIlEqqcRg67jt?=
 =?us-ascii?Q?RN2QduFHNIAp6Ry0XNOdN4bEsKMAdUzl0/oY+Cago0Ahpri1OkfOk3yNEsS6?=
 =?us-ascii?Q?Myim78+Sadobp2EhAqS4AJ7hGiTy1zJEahQTyoP28e59WnWNmo5hRNav6uc3?=
 =?us-ascii?Q?hgzkcqJYWw=3D=3D?=
X-OriginatorOrg: atomlin.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b809564-c98c-4483-0f19-08df1040ff1d
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 20:12:25.5835
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e6a32402-7d7b-4830-9a2b-76945bbbcb57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SYAiRsFBGBWyDfvQSuX3GOa1t7TPYt+A23KM9YcsgALWufMJkXn2OBFJib0kUvMYqDLICO4zi883k9Ph+POftg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP123MB3207

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
index aa604d981358..66783205a958 100644
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
index 7be5713aa190..f5f27d3798a8 100644
--- a/arch/x86/kernel/cpu/mce/intel.c
+++ b/arch/x86/kernel/cpu/mce/intel.c
@@ -231,16 +231,17 @@ static u64 cmci_pick_threshold(u64 val, int *bios_zero_thresh)
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
 
@@ -252,7 +253,7 @@ static void cmci_claim_bank(int bank, u64 val, int bios_zero_thresh, int *bios_w
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
index 83f3e2250ae2..07f326edae83 100644
--- a/arch/x86/kernel/cpu/mce/threshold.c
+++ b/arch/x86/kernel/cpu/mce/threshold.c
@@ -126,10 +126,6 @@ void mce_track_storm(struct mce *mce)
 
 	local_irq_save(flags);
 
-	/* No tracking needed for banks that do not support CMCI */
-	if (storm->banks[mce->bank].poll_only)
-		goto out;
-
 	/*
 	 * When a bank is in storm mode it is polled once per second and
 	 * the history mask will record about the last minute of poll results.
-- 
2.55.0

