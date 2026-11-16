Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794849214;
	b=SHiG03yZKymcLB3TkTcLCvM/xTn68ulWwun5i5p3tqEjYifemtiYEkQb+QpRYLHCdI0k
	 /NkPHbyS2PgrNjK7gbC4QyKnJdiiZYjp69xWetMrvNPv38R6AuCBG+jppqjFP/wlKy5n6
	 mgHGXHXV7zx2xHVpmLChYdCVLUr/JJkXdKTMUCtz2x+Zf2Cf3grz9BlHggsrCkNxJVhWO
	 Sy6a3WUDuEphqzuJrq+ZbU4kNGSBTCHqttI+P0ZgC+Pa8xMCe4RSq1b3f4o6OP4G7cz4o
	 gm9jn+y9xwlQCkMf2aas/m6XAyP3mj6Hs4qHQaR/57TnDdkS3NASuackGf7+DNVKXcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794849214;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=O2prl/QfPB19Nt9rLS5tGvWcBDiCRLjFOaUMYDRdQs0=;
	b=F/P0/mv7Uh8TRHSajCqG4Y/YGZVWGe/luJJ3g0cJTaawFQDiFqVjjjCsRzJB2qyeLiBS
	 9UVjZnAezot2TedJfYSJsidGJDL6KwCth/HvBd9ji63S97zuzVOnZG6NMfm8w1jYkSKEG
	 9vra47uJiXxDyCYPA491NwElg12UqQ1FwsuFeg0Gw6ZMSTdob7YWzoffvdZQX43pfAO+5
	 xugC9UgtkeKjthcsu18O7bXwAHLAoyzastu12Cj7X9gBFK/syWKtG/+gjMNpYfhVQ7RiU
	 Kosb8zT9WmQaaJNuAmLiHZoJruUer0an6Fy5QFeBw2MqqxKKJHCbjfa2HKGPL6yZefg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bv7Vo58m;
	arc=none smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FB3E606A89D
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 17:13:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3FB3E606A89D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bv7Vo58m
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794849214; x=1826385214;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=eLeBVso0iH/JY3BEh1tZoSeT0c906vZBvaTkZcYqXoM=;
  b=bv7Vo58mzF5oXlmOSgupOrF31IsKKkdH3Kpdo8e6XyBZVfZDg7QfdleG
   RRL5uTsZ3bkmMYpDSFs2Iu0GwRr1VxGhfK6D1DDHs7invjoLjetMwjYI1
   /n31Et0AdYr38WnyZaM+vWRp+y9FtRuSinrGDIeO9bNSi5anr3t3tUwuA
   Kf9VjnWu9UBgmXN6yn/KvEFM2YbqMei62rMte4ViTwJ+mvDufuqDuWJC1
   l5tbOg/csNrpN5xhvI4iM8ypsXREuoK/fmItDibxj/2GcWI8lgXDX6Z+a
   AV3W/ASoBi2G+hIBIa/77om1XM6Pk8C2gO8Rz9h4MItsycLBtcmDF8fPU
   g==;
X-CSE-ConnectionGUID: Snlh00Z5R6etObXfgJE4Mw==
X-CSE-MsgGUID: Kd90p8ITRnqPXGJafR0kEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3627235"
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="3627235"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 09:13:27 -0800
X-CSE-ConnectionGUID: eKOdn+rZRKOF0QbdNnU8Fw==
X-CSE-MsgGUID: J8v6M6qoQ1qs+juIMhMinQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="9491532"
Received: from chang-linux-3.sc.intel.com (HELO chang-linux-3) ([172.25.66.174])
  by orviesa004.jf.intel.com with ESMTP; 16 Nov 2026 09:13:26 -0800
From: "Chang S. Bae" <chang.seok.bae@intel.com>
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	hpa@zytor.com,
	andrew.cooper3@citrix.com,
	arjan.van.de.ven@intel.com,
	chang.seok.bae@intel.com
Subject: [PATCH v2 4/7] x86/microcode: Introduce incremental late loading
Date: Mon, 16 Nov 2026 16:45:45 +0000
Message-ID: <20261116164548.900486-5-chang.seok.bae@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116164548.900486-1-chang.seok.bae@intel.com>
References: <20261116164548.900486-1-chang.seok.bae@intel.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The minimum revision requirement was introduced to handle dependencies
between microcode revisions. On the other hand, Intel has traditionally
distributed only the latest microcode blob in the repository [1].

Concatenating the dependent blobs into a single image may allow loading
the prerequisite revisions in sequence. The loader, however, currently
picks the highest revision from a multi-blob image, so it may skip the
minimum revision requirement.

If enforced, it skips revisions whose prerequisites have not been loaded,
possibly leaving the loading process at an intermediate revision. Then,
admins have to manually trigger another load to apply the remaining
higher revisions.

To avoid this manual step, introduce incremental late loading. After each
successful update, let the vendor-specific parser select the next blob.
If the parser selects the lowest loadable revision on each pass, the
loader can apply the blobs incrementally until no more blobs are
available.

For now, rejects this loading as the vendor-side blob parser is not ready
yet to support incremental blob selection.

To retain the existing behavior by default, provide a Kconfig option and
a kernel command-line option.

[1] https://github.com/intel/Intel-Linux-Processor-Microcode-Data-Files.git

Signed-off-by: Chang S. Bae <chang.seok.bae@intel.com>
---
V1 -> V2:
 * Rename to incremental loading
 * Reset incremental_loading=false if not supported
---
 .../admin-guide/kernel-parameters.txt         |  4 ++
 arch/x86/Kconfig                              | 13 +++++
 arch/x86/kernel/cpu/microcode/core.c          | 58 ++++++++++++++++++-
 arch/x86/kernel/cpu/microcode/internal.h      |  7 ++-
 4 files changed, 76 insertions(+), 6 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index a6d50cf6435c..af0630466dcc 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -4091,6 +4091,10 @@ Kernel parameters
 			for the runtime microcode loader according to <bool>. If
 			<bool> is not given, enable the enforcement.
 
+			incremental_loading=<bool>:
+			Enable or disable incremental microcode late loading
+			according to <bool>.
+
 	mitigations=
 			[X86,PPC,S390,ARM64,EARLY] Control optional mitigations for
 			CPU vulnerabilities.  This is a set of curated,
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 58dce0b66179..3ead806c9de2 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -1353,6 +1353,19 @@ config MICROCODE_LATE_FORCE_MINREV
 
 	  If unsure say Y.
 
+config MICROCODE_LATE_INCREMENTAL_LOADING
+	bool "Incremental microcode late loading"
+	default n
+	depends on MICROCODE_LATE_LOADING
+	depends on CPU_SUP_INTEL
+	help
+	  Apply the microcode blobs in a concatenated image one at a time, in
+	  ascending revision order, so that revisions with prerequisites can be
+	  applied in a single load.
+
+	  This loading option can also be controlled via the
+	  "microcode=incremental_loading=" parameter on the kernel command line.
+
 config MICROCODE_DBG
 	bool "Enable microcode loader debugging"
 	default n
diff --git a/arch/x86/kernel/cpu/microcode/core.c b/arch/x86/kernel/cpu/microcode/core.c
index ed1eb6b753d6..a5f6949e0d53 100644
--- a/arch/x86/kernel/cpu/microcode/core.c
+++ b/arch/x86/kernel/cpu/microcode/core.c
@@ -47,6 +47,7 @@ static struct microcode_ops *microcode_ops;
 static bool dis_ucode_ldr;
 
 bool force_minrev = IS_ENABLED(CONFIG_MICROCODE_LATE_FORCE_MINREV);
+static bool incremental_loading = IS_ENABLED(CONFIG_MICROCODE_LATE_INCREMENTAL_LOADING);
 
 /*
  * Those below should be behind CONFIG_MICROCODE_DBG ifdeffery but in
@@ -166,6 +167,12 @@ static void __init early_parse_cmdline(void)
 				continue;
 			}
 
+			if (str_has_prefix(s, "incremental_loading=")) {
+				advance_option_argument(&s);
+				if (kstrtobool(s, &incremental_loading)) { ; }
+				continue;
+			}
+
 			if (!strcmp(s, "dis_ucode_ldr"))
 				dis_ucode_ldr = true;
 		}
@@ -750,16 +757,34 @@ static bool setup_cpus(void)
 	return true;
 }
 
+static void reset_ucode_ctrl(void)
+{
+	struct microcode_ctrl ctrl = { .ctrl = SCTRL_WAIT, .result = -1, };
+	unsigned int cpu;
+
+	for_each_cpu_and(cpu, cpu_present_mask, &cpus_booted_once_mask) {
+		ctrl.ctrl_cpu = per_cpu(ucode_ctrl.ctrl_cpu, cpu);
+		per_cpu(ucode_ctrl, cpu) = ctrl;
+	}
+}
+
 static int load_late_locked(void)
 {
+	enum ucode_state state;
+	int err;
+
 	if (!setup_cpus())
 		return -EBUSY;
 
-	switch (microcode_ops->request_microcode_fw(0, &microcode_fdev->dev)) {
+	state = microcode_ops->request_microcode_fw(0, &microcode_fdev->dev);
+next:
+	switch (state) {
 	case UCODE_NEW:
-		return load_late_stop_cpus(false);
+		err = load_late_stop_cpus(false);
+		break;
 	case UCODE_NEW_SAFE:
-		return load_late_stop_cpus(true);
+		err = load_late_stop_cpus(true);
+		break;
 	case UCODE_NFOUND:
 		return -ENOENT;
 	case UCODE_OK:
@@ -767,6 +792,28 @@ static int load_late_locked(void)
 	default:
 		return -EBADFD;
 	}
+
+	if (err)
+		return err;
+
+	/*
+	 * A multi-blob image is traditionally handled by selecting the highest
+	 * revision to load it in one shot. With incremental loading, the
+	 * vendor-specific parser instead selects the lowest loadable revision.
+	 *
+	 * After each successful update, find the next loadable blob to continue
+	 * the iteration. Stop if no more blobs are found.
+	 */
+	if (incremental_loading) {
+		state = microcode_ops->request_microcode_fw(0, &microcode_fdev->dev);
+		if (state == UCODE_NFOUND)
+			return 0;
+
+		reset_ucode_ctrl();
+		goto next;
+	}
+
+	return 0;
 }
 
 static ssize_t reload_store(struct device *dev,
@@ -915,6 +962,11 @@ static int __init microcode_init(void)
 	if (early_data.new_rev)
 		pr_info_once("Updated early from: 0x%08x\n", early_data.old_rev);
 
+	if (incremental_loading && !microcode_ops->support_incremental) {
+		pr_warn("Incremental late loading not supported, disabling\n");
+		incremental_loading = false;
+	}
+
 	microcode_fdev = faux_device_create("microcode", NULL, NULL);
 	if (!microcode_fdev)
 		return -ENODEV;
diff --git a/arch/x86/kernel/cpu/microcode/internal.h b/arch/x86/kernel/cpu/microcode/internal.h
index a10b547eda1e..ebf079e60c33 100644
--- a/arch/x86/kernel/cpu/microcode/internal.h
+++ b/arch/x86/kernel/cpu/microcode/internal.h
@@ -34,9 +34,10 @@ struct microcode_ops {
 	void			(*stage_microcode)(void);
 	int			(*collect_cpu_info)(int cpu, struct cpu_signature *csig);
 	void			(*finalize_late_load)(int result);
-	unsigned int		nmi_safe	: 1,
-				use_nmi		: 1,
-				use_staging	: 1;
+	unsigned int		nmi_safe	    : 1,
+				use_nmi		    : 1,
+				use_staging	    : 1,
+				support_incremental : 1;
 };
 
 struct early_load_data {
-- 
2.53.0

