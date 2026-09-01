Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA3747D443
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 23:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788306210; cv=none; b=JHcMmsLRvct8xgUmWRDY1rsk4cmpOqzUJevyW0Xf8Xxp1SbgE4g2mvmFnIp+W/3V91xIMAI6QFRgNig8mR2dYQL+Zrti+mEhr6vjYBsRaNI6+MHmJVqaAZGacxgeBultnD68FFmruRATs/0Vqd5m1mSo/BAKG4WE/Dl1oYO2Zhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788306210; c=relaxed/simple;
	bh=xMVF8li0PUI7fN7jnCZBtwDsj9dwWewU8cRAuFOhIBE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UQ1QRjaU1U9yc9jp67aOGs+8UIaj9Aya/ZBzu0gzsp6kJnKZzDXVMVW2zTb5DKwr2gnvkNJMmbqJGyMKn2C2SL9/0GSMm0XQRq/MVoVq/WMQZNPUa0TFYWXJ57vS9UnpdE1Y19x5hLvZSBtE3/6U+3+YRI1zKjm5mf3+rDAv+C4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YQs217Re; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YQs217Re"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788306207; x=1819842207;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xMVF8li0PUI7fN7jnCZBtwDsj9dwWewU8cRAuFOhIBE=;
  b=YQs217ReQxxBUQ8Jd0claNF+Cz/3qhU1e3qK2Z9yXn/knHD8NU5cf6iY
   S9mcRgduFl3w8kiln+cAvwgtq5lBDQYR0sht8X+QzAVybKSHfi/gj5HM8
   3JS3ehKi/g7WSKvIRnrSEZPGIqdLggb9ueLP3sEQKJN7rtOnnQejIBsBy
   a4CNbY3PttHsktnCeAhe4TQgsVY1gkObTX8GsPGRRhGCXs0cVFlv37gZW
   ow56dbBOxUG8wcFzcM7hFuP7PmT23xHCXz2RzTUbxr/fBUHhkm3x82FXY
   c0x7i+uO06c+VX1+muJ9BB0qIKjIpVFTq/TK810sL0RoZVLfU9l6eBFJn
   w==;
X-CSE-ConnectionGUID: el4ZQPmIS4aO4OEBwoJQmA==
X-CSE-MsgGUID: Ccmo7e9hTy6FS81vn+7r8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="87891912"
X-IronPort-AV: E=Sophos;i="6.25,256,1779174000"; 
   d="scan'208";a="87891912"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2026 16:43:27 -0700
X-CSE-ConnectionGUID: iSudT1M8R9epPpbk+Ff9eg==
X-CSE-MsgGUID: ETwsvQ7pQG6heHlo3eCo0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,256,1779174000"; 
   d="scan'208";a="267469923"
Received: from chang-linux-3.sc.intel.com (HELO chang-linux-3) ([172.25.66.174])
  by orviesa006.jf.intel.com with ESMTP; 01 Sep 2026 16:43:27 -0700
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
Subject: [PATCH RFC 7/8] x86/microcode: Introduce iterative late loading
Date: Tue,  1 Sep 2026 23:16:32 +0000
Message-ID: <20260901231634.714144-8-chang.seok.bae@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260901231634.714144-1-chang.seok.bae@intel.com>
References: <20260901231634.714144-1-chang.seok.bae@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The minimum revision requirement was introduced to handle dependencies
between microcode revisions. On the other hand, Intel has traditionally
distributed only the latest microcode blob in the repository [1].

Instead, to better accommodate those dependent blobs at hand, it is
useful to concatenate blobs together into a single image. This allows
loading the prerequisite revisions in sequence.

The loader currently handles a multi-blob image by selecting the highest
revision without minimum revision enforcement. This loading approach may
not achieve the safety requirement.

If enforced, it skips revisions whose prerequisites have not been loaded,
possibly leaving the loading process at an intermediate revision. Then,
admins have to manually trigger another load to apply the remaining
higher revisions.

To avoid this manual step, introduce iterative late loading. After each
successful update, let the vendor-specific parser select the next blob.
If the parser selects the lowest loadable revision on each pass, the
loader can apply the blobs incrementally until no more blobs are
available.

For now, vendor code rejects this loading because the blob parser is not
ready yet to support incremental blob selection.

To retain the existing behavior by default, add a Kconfig option and a
kernel command-line option to select iterative loading.

[1] https://github.com/intel/Intel-Linux-Processor-Microcode-Data-Files.git

Signed-off-by: Chang S. Bae <chang.seok.bae@intel.com>
---
 .../admin-guide/kernel-parameters.txt         |  4 ++
 arch/x86/Kconfig                              | 12 +++++
 arch/x86/kernel/cpu/microcode/amd.c           |  3 +-
 arch/x86/kernel/cpu/microcode/core.c          | 53 +++++++++++++++++--
 arch/x86/kernel/cpu/microcode/intel.c         |  3 ++
 arch/x86/kernel/cpu/microcode/internal.h      |  1 +
 6 files changed, 72 insertions(+), 4 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index b5f7a8142f58..67f5b233315f 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -4076,6 +4076,10 @@ Kernel parameters
 			for the microcode loader according to <bool>. If <bool>
 			is not given, enable the enforcement.
 
+			iterative_loading=<bool>:
+			Enable or disable iterative microcode patch application
+			for the runtime microcode loader according to <bool>.
+
 	mini2440=	[ARM,HW,KNL]
 			Format:[0..2][b][c][t]
 			Default: "0tb"
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 6c503004775e..021c77a6ad4b 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -1355,6 +1355,18 @@ config MICROCODE_FORCE_MINREV
 
 	  If unsure say Y.
 
+config MICROCODE_LATE_ITERATIVE_LOADING
+	bool "Iterative microcode late loading"
+	default n
+	depends on MICROCODE_LATE_LOADING
+	help
+	  Apply the microcode blobs in a concatenated image one at a time, in
+	  ascending revision order, so that revisions with prerequisites can be
+	  applied in a single process.
+
+	  This loading option can also be controlled via the
+	  "microcode=iterative_loading=" parameter on the kernel command line.
+
 config MICROCODE_DBG
 	bool "Enable microcode loader debugging"
 	default n
diff --git a/arch/x86/kernel/cpu/microcode/amd.c b/arch/x86/kernel/cpu/microcode/amd.c
index 0625d5e8eb7e..97b30da9e5e6 100644
--- a/arch/x86/kernel/cpu/microcode/amd.c
+++ b/arch/x86/kernel/cpu/microcode/amd.c
@@ -1251,7 +1251,8 @@ static enum ucode_state request_microcode_amd(int cpu, struct device *device)
 	enum ucode_state ret = UCODE_NFOUND;
 	const struct firmware *fw;
 
-	if (force_minrev)
+	/* The blob parser does not support these features yet. */
+	if (force_minrev || iterative_loading)
 		return UCODE_NFOUND;
 
 	if (c->x86 >= 0x15)
diff --git a/arch/x86/kernel/cpu/microcode/core.c b/arch/x86/kernel/cpu/microcode/core.c
index 7d6caf191795..e7e159479975 100644
--- a/arch/x86/kernel/cpu/microcode/core.c
+++ b/arch/x86/kernel/cpu/microcode/core.c
@@ -47,6 +47,7 @@ static struct microcode_ops *microcode_ops;
 static bool dis_ucode_ldr;
 
 bool force_minrev = IS_ENABLED(CONFIG_MICROCODE_FORCE_MINREV);
+bool iterative_loading = IS_ENABLED(CONFIG_MICROCODE_LATE_ITERATIVE_LOADING);
 
 /*
  * Those below should be behind CONFIG_MICROCODE_DBG ifdeffery but in
@@ -166,6 +167,12 @@ static void __init early_parse_cmdline(void)
 				continue;
 			}
 
+			if (str_has_prefix(s, "iterative_loading=")) {
+				advance_option_argument(&s);
+				if (kstrtobool(s, &iterative_loading)) { ; }
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
+	 * revision to load it in one shot. With iterative loading, the
+	 * vendor-specific parser instead selects the lowest loadable revision.
+	 *
+	 * After each successful update, find the next loadable blob to continue
+	 * the iteration. Stop if no more blobs are found.
+	 */
+	if (iterative_loading) {
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
diff --git a/arch/x86/kernel/cpu/microcode/intel.c b/arch/x86/kernel/cpu/microcode/intel.c
index ddd5b72b27a1..48e7d023ea41 100644
--- a/arch/x86/kernel/cpu/microcode/intel.c
+++ b/arch/x86/kernel/cpu/microcode/intel.c
@@ -978,6 +978,9 @@ static enum ucode_state request_microcode_fw(int cpu, struct device *device)
 	if (is_late_loading_denied(cpu))
 		return UCODE_NFOUND;
 
+	if (iterative_loading)
+		return UCODE_NFOUND;
+
 	sprintf(name, "intel-ucode/%02x-%02x-%02x",
 		c->x86, c->x86_model, c->x86_stepping);
 
diff --git a/arch/x86/kernel/cpu/microcode/internal.h b/arch/x86/kernel/cpu/microcode/internal.h
index 1b35f9099580..311e885819a2 100644
--- a/arch/x86/kernel/cpu/microcode/internal.h
+++ b/arch/x86/kernel/cpu/microcode/internal.h
@@ -101,6 +101,7 @@ static inline unsigned int x86_cpuid_family(void)
 }
 
 extern bool force_minrev;
+extern bool iterative_loading;
 
 #ifdef CONFIG_CPU_SUP_AMD
 void load_ucode_amd_bsp(struct early_load_data *ed, unsigned int family);
-- 
2.53.0

