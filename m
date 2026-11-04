Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793818268;
	b=IuMIY8cOngfycfQamoJ5jvh9Gu3vcgJvEBGvrFDS736UrJH6A4wiPxYAl52NXEVJ6V4z
	 pdTrEWhsLHVcNvW8cfrsbzVnNPCi/Ne2AOpTJoCxu9cQEdNIlhWXWBYtLC5TrhRcgMIai
	 Iz7gfzP5Jr8gVXpQeJFqbXdFas2m/yxtmlf7W1eReenXOmJP6bXIOUtQ9CzYRhI/5LWzw
	 s1HJiUxX8xCpZWGf0H2AiTU7t1EV2hyZn+0j8Mv2dYCW0i5g9ChLoYztVHopNPVj0y2U9
	 nFqcSBdGm9dbwsIsJJ8LLxTX+oF3QvlIT5TKvlJR19ctaHI3T7X2KACxPXWlX91/mdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793818268;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=7/asLL79ciDSBNwCkgM6wu2/QNnE6Kp17gBuAMsKQSM=;
	b=qVOaR64S6oETppURIiArtphEn1Bj6GNJoif6cE0e4od5dmpUvZXL3ojq7vEJS9Y8HyTS
	 JZmMbG9Nn5dIgoA+gjMjYBMcS+dnhYw2P5qyKHvDkmIVW9mSwILbQ96UffO/n+I6fRbOS
	 kRPRFV1kGS3DEdDO0+Xw0pY4Po07xpIhCKeI8MJCUSIR0EPCNDFNC23tiPpPqcYf9jqIj
	 3/WYvEcoPbwqb6tzRJA3tIXk147OSie6xJXsBfHwmKptSEOJcZ3tZe67zNIaC/ovcGlp1
	 7V20q/UehYPHqYv2wd2JxjzvUS2kk9r/vI+K4eOSX9aAWbW8JNBP9P/dZESfn434kjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="RP7NL/7m";
	arc=none smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09907606A33F
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 18:51:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09907606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RP7NL/7m
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793818268; x=1825354268;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tLaogSnFsr/DqqaNJiiTHZTF7alkpKub0uATTjqi4os=;
  b=RP7NL/7mQM67XvexhsJaXe9kWMjBr+MIuZJdaLeicTTbnoWWOT5830P1
   FWYaksdzMhKrMQYuXe2vTEkoIwW+Ts+pQ3HOuFxR9hKX017yMiA/nBCX+
   /lFDltKcL53aA+q3MIfEO2gmQ7XTDjdnisFlnZmp8Spe1Vi3/1K2WAHYi
   Kpj4Pu5fY7mUUrva/B2+PMScapFn81f2Wlzv14jrvmAsZqLby/BNV3XB7
   fIpLp4xAt+GrnjFYHR5Dmcwq/+83AsrnOYtVc4yCTOvhhWlpqfLv0l+KY
   ZlX6I9xCNwmwZsvTIv4FLuuZWS06Td1YUr1Rabn/mxqVdaXPT06ENmH1r
   g==;
X-CSE-ConnectionGUID: 4bAMCT1KQ26AqIYxKIkZ6Q==
X-CSE-MsgGUID: k6PQB9bgR5ed2rXEIz2fvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2485073"
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="2485073"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 10:50:55 -0800
X-CSE-ConnectionGUID: swDLoc3YTRaQxB46dZ/KcA==
X-CSE-MsgGUID: FsXrFrQyQxCs09KauC515w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="7336831"
Received: from chang-linux-3.sc.intel.com (HELO chang-linux-3) ([172.25.66.174])
  by fmviesa010.fm.intel.com with ESMTP; 04 Nov 2026 10:50:55 -0800
From: "Chang S. Bae" <chang.seok.bae@intel.com>
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	peterz@infradead.org,
	david.kaplan@amd.com,
	chang.seok.bae@intel.com
Subject: [PATCH v4 7/9] x86/microcode: Use stop-machine NMI facility
Date: Wed,  4 Nov 2026 18:23:20 +0000
Message-ID: <20261104182322.578066-8-chang.seok.bae@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261104182322.578066-1-chang.seok.bae@intel.com>
References: <20261104182322.578066-1-chang.seok.bae@intel.com>
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

The existing NMI-based loading logic explicitly sends NMIs to online CPUs
and invokes microcode_update_handler() from the NMI context. The
stop-machine NMI variant already provides the mechanism on x86.

Replace the custom NMI control logic with stop_machine_nmi_cpuslocked().

Signed-off-by: Chang S. Bae <chang.seok.bae@intel.com>
---
 arch/x86/Kconfig                     |  1 +
 arch/x86/include/asm/microcode.h     |  1 -
 arch/x86/kernel/cpu/microcode/core.c | 19 +++----------------
 arch/x86/kernel/nmi.c                |  3 ---
 4 files changed, 4 insertions(+), 20 deletions(-)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 58dce0b66179..f4bf1fdae6ba 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -1325,6 +1325,7 @@ config MICROCODE_LATE_LOADING
 	bool "Late microcode loading (DANGEROUS)"
 	default n
 	depends on MICROCODE && SMP
+	select STOP_MACHINE_NMI
 	help
 	  Loading microcode late, when the system is up and executing instructions
 	  is a tricky business and should be avoided if possible. Just the sequence
diff --git a/arch/x86/include/asm/microcode.h b/arch/x86/include/asm/microcode.h
index 645e65ac1586..e6c09dc48efb 100644
--- a/arch/x86/include/asm/microcode.h
+++ b/arch/x86/include/asm/microcode.h
@@ -78,7 +78,6 @@ static inline u32 intel_get_microcode_revision(void)
 }
 #endif /* !CONFIG_CPU_SUP_INTEL */
 
-bool microcode_nmi_handler(void);
 void microcode_offline_nmi_handler(void);
 
 #ifdef CONFIG_MICROCODE_LATE_LOADING
diff --git a/arch/x86/kernel/cpu/microcode/core.c b/arch/x86/kernel/cpu/microcode/core.c
index 9c006cc90047..73a46c6c74de 100644
--- a/arch/x86/kernel/cpu/microcode/core.c
+++ b/arch/x86/kernel/cpu/microcode/core.c
@@ -562,22 +562,9 @@ static noinstr int microcode_update_handler(void *unused)
  * path which must be NMI safe until the primary thread completed the
  * update.
  */
-bool noinstr microcode_nmi_handler(void)
+static noinstr int microcode_nmi_handler(void *data)
 {
-	if (!raw_cpu_read(ucode_ctrl.nmi_enabled))
-		return false;
-
-	raw_cpu_write(ucode_ctrl.nmi_enabled, false);
-	return microcode_update_handler(NULL) == 0;
-}
-
-static int stop_cpu_in_nmi(void *unused)
-{
-	/* Enable the NMI handler and raise NMI */
-	this_cpu_write(ucode_ctrl.nmi_enabled, true);
-	apic->send_IPI(smp_processor_id(), NMI_VECTOR);
-
-	return 0;
+	return microcode_update_handler(data);
 }
 
 static int load_late_stop_cpus(bool is_safe)
@@ -615,7 +602,7 @@ static int load_late_stop_cpus(bool is_safe)
 
 	if (microcode_ops->use_nmi) {
 		static_branch_enable_cpuslocked(&microcode_nmi_handler_enable);
-		stop_machine_cpuslocked(stop_cpu_in_nmi, NULL, cpu_online_mask);
+		stop_machine_nmi_cpuslocked(microcode_nmi_handler, NULL, cpu_online_mask);
 		static_branch_disable_cpuslocked(&microcode_nmi_handler_enable);
 	} else {
 		stop_machine_cpuslocked(microcode_update_handler, NULL, cpu_online_mask);
diff --git a/arch/x86/kernel/nmi.c b/arch/x86/kernel/nmi.c
index 0d426e5e74ee..e3660b8b8f38 100644
--- a/arch/x86/kernel/nmi.c
+++ b/arch/x86/kernel/nmi.c
@@ -391,9 +391,6 @@ static noinstr void default_do_nmi(struct pt_regs *regs)
 	if (stop_machine_nmi_handler())
 		goto out;
 
-	if (microcode_nmi_handler_enabled() && microcode_nmi_handler())
-		goto out;
-
 	/*
 	 * CPU-specific NMI must be processed before non-CPU-specific
 	 * NMI, otherwise we may lose it, because the CPU-specific
-- 
2.53.0

