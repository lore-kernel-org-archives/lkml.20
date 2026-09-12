Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AD1D2D8364
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 00:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789173311; cv=none; b=OddJouruSyUUth9J8umbrc3gqZSyATnYQP7AamFJ4yv0bSWf7MHiqFX/zvdSBS3B6yfrcGTu8YhqUsFKzMSC3OwYNKhQz9wTz6Ge3EkgSspBOAPK5A82TBDVXg7sciYvjjeB4tpf/1fYuHRTD6CM3+avk37ozm/IBqec7b0G0V8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789173311; c=relaxed/simple;
	bh=p0migYejU9N010P8ZHhopEIg+2ZfkCHshpwVI7sSvrU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rBcDE9chlgORFf4m/p5O073rh3m7C/ZtSzd0FqICpAXE6Nwa6U5S0dJdxKEZZl+VN6VPOQfjFom7iUmhDs8Lz+sdrx7aQU3Qq30+5UwS0LEKUTrNU5a9cXhHwBReTI4Vdq/FxTFe9GG8pmsscppCugm6TzykkRxxT2mmNj9F41Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LYDSU7mI; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LYDSU7mI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789173309; x=1820709309;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=p0migYejU9N010P8ZHhopEIg+2ZfkCHshpwVI7sSvrU=;
  b=LYDSU7mI4z3S3FD5GIF375Im3cHOKqYi80GMOzaNMiDlJl4hrYtimqjd
   9EnZ8t3AFqcuO8UFJtoiMxkoBSr4vyP1e4pd5qjDTYzFEBkeygyNnhnVV
   tYeUR+nhMIjD7GddO892E/TkuL7ILL7V6d8hWHKJjhfkiVK0JqQGoCU5I
   BWHnNE/rHM/MInp+TyCgHpnALiG7U4lNNDjHb8iPqDxrDUMGnZxNSw6St
   lHP3hL9FHwRz/0uFbXDLCFzI6j3DMCwpyw9/s2qcAf8tfRaUzXcsEAZEI
   PlVI7acRvkRQSNiX2ziFL2hkcROLmbGTxuvJG6mh3FFNFWMn3CehX15H4
   Q==;
X-CSE-ConnectionGUID: zXK94IsOQSynSOxv1X6elg==
X-CSE-MsgGUID: JWIFYwrITWOa+9VhC+g1uQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11902"; a="115174979"
X-IronPort-AV: E=Sophos;i="6.27,98,1787036400"; 
   d="scan'208";a="115174979"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 17:35:09 -0700
X-CSE-ConnectionGUID: 7esh7jKWRYyX9j2GdbHZpg==
X-CSE-MsgGUID: XVzZhznYQH27jSZWTSHDww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,98,1787036400"; 
   d="scan'208";a="276217668"
Received: from chang-linux-3.sc.intel.com (HELO chang-linux-3) ([172.25.66.174])
  by orviesa005.jf.intel.com with ESMTP; 11 Sep 2026 17:35:09 -0700
From: "Chang S. Bae" <chang.seok.bae@intel.com>
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	kevin.shu@intel.com,
	chang.seok.bae@intel.com
Subject: [PATCH RFC v1 6/8] x86/microcode: Support uniform scope for late loading
Date: Sat, 12 Sep 2026 00:08:12 +0000
Message-ID: <20260912000815.997720-7-chang.seok.bae@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260912000815.997720-1-chang.seok.bae@intel.com>
References: <20260912000815.997720-1-chang.seok.bae@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the late-loading path, per-CPU storage records a primary CPU in the
ctrl_cpu field of struct microcode_ctrl. The primary CPU is then
responsible for coordinating updates for the CPUs within its loading
scope via __load_primary().

To support uniform loading, provide helpers that allow a given CPU to
identify either its corresponding primary CPU or the set of CPUs in its
loading scope.

Signed-off-by: Chang S. Bae <chang.seok.bae@intel.com>
---
 arch/x86/kernel/cpu/microcode/core.c | 38 +++++++++++++++++++++++-----
 1 file changed, 32 insertions(+), 6 deletions(-)

diff --git a/arch/x86/kernel/cpu/microcode/core.c b/arch/x86/kernel/cpu/microcode/core.c
index 8f617745d4d0..dfa311a2edbd 100644
--- a/arch/x86/kernel/cpu/microcode/core.c
+++ b/arch/x86/kernel/cpu/microcode/core.c
@@ -296,6 +296,36 @@ static void reload_early_microcode(unsigned int cpu)
 static struct faux_device *microcode_fdev;
 
 #ifdef CONFIG_MICROCODE_LATE_LOADING
+
+/*
+ * Return the CPU mask corresponding to the update scope that @cpu belongs to.
+ * Unknown scopes fall back to the legacy per-core scope.
+ */
+static const struct cpumask *ucode_scope_cpumask(unsigned int cpu)
+{
+	if (!microcode_ops->use_uniform)
+		return topology_sibling_cpumask(cpu);
+
+	switch (microcode_ops->uniform_scope) {
+	case UNIFORM_PKG:
+		return topology_core_cpumask(cpu);
+	case UNIFORM_SYS:
+		return cpu_online_mask;
+	case UNIFORM_DEFAULT:
+	case UNIFORM_CORE:
+		break;
+	default:
+		WARN_ON_ONCE(1);
+	}
+
+	return topology_sibling_cpumask(cpu);
+}
+
+static inline unsigned int ucode_primary_cpu(unsigned int cpu)
+{
+	return cpumask_first(ucode_scope_cpumask(cpu));
+}
+
 /*
  * Late loading dance. Why the heavy-handed stomp_machine effort?
  *
@@ -437,7 +467,7 @@ static noinstr void load_secondary(unsigned int cpu)
 
 static void __load_primary(unsigned int cpu)
 {
-	struct cpumask *secondaries = topology_sibling_cpumask(cpu);
+	const struct cpumask *secondaries = ucode_scope_cpumask(cpu);
 	enum sibling_ctrl ctrl;
 	enum ucode_state ret;
 	unsigned int sibling;
@@ -736,11 +766,7 @@ static bool setup_cpus(void)
 			continue;
 		}
 
-		/*
-		 * Initialize the per CPU state. This is core scope for now,
-		 * but prepared to take package or system scope into account.
-		 */
-		ctrl.ctrl_cpu = cpumask_first(topology_sibling_cpumask(cpu));
+		ctrl.ctrl_cpu = ucode_primary_cpu(cpu);
 		per_cpu(ucode_ctrl, cpu) = ctrl;
 	}
 	return true;
-- 
2.53.0

