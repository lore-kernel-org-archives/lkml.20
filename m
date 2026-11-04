Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793818270;
	b=G1xE9cffzsIbBPw5Tdy07/Xwl8N5HuODRuVYO0GqQGgbWyisVEmALXwQsfnBPG07I1Aw
	 nuIWbPAh0LQkZcWuD2tpiTHhf62cRJ18ZuopI/9tbEWT7E022/zpvNzwQ3VLyCtDbKcI7
	 l7QtRnC/3Oa3yjEf6XvxXOZ3HgeUz/tZgqZZGmqncCvVGVVNIon8ZSGjexkBgHLS9vUiC
	 Tyjvq70pUnVwtZQLH90JuJ/SbNuGYeEWNDvDMihyjCD8co0BSua/xwgrsL/04GuwBGMP/
	 rDjmGDpsP1Qz97QCXmUuAs/LPy3A2/3tmY9luEJtEsaw3UtQWdPVeh33y2LGzchouvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793818270;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=EE1tegHqZxxgsCR7I30x3UYB/s9Pg5GG16sEf30gdDI=;
	b=swuDQ+jEYe98wFZ+ixcXGeUGYKUcnZ1tTFNOQVMScYsXkFV/iVjNAQNeY6PydNIXEAq6
	 3js7KTaWCQzFlLc6zmFgUZLo12blsjqcJl6RpYviq4JU9MPpcJBMleE6SFxeEndLzSaQ1
	 KxnoVnDGeiAbskhqShqWUDN3n++ZXpI4vvN2p9XAGjKL8vmivaFyGj5BkYf3UwQkeE5oL
	 zphA2N6tCYVIJOzKEDJ46cpKmrV/yEuNaP2M0rsZV1kCWciMCog6n46gB7uw3xs7C/Gne
	 E2x36YoK+I+toEIHPtReKzIFKOXuSQlNO25yI4o5nEQUvlAKrMLXfIXtHM+sk6GMMZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=P4U7DTje;
	arc=none smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ECF6608363A
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 18:51:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6ECF6608363A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=P4U7DTje
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793818269; x=1825354269;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=a6r2p6/RrQBxHQ1ZP3GC6Tq5XV1iZ6WaaW9WD3raEvo=;
  b=P4U7DTjemRI+4LC0o5N3beuBxalnMarKNoh8BXEisiyssG/fvspHWn1W
   6jvYtH6wvMOu9i26FiRcBOXxPVlNNMYEwKvjR+nP7eIheWGHyWreufVDs
   IVRW9vWIGJKPEgxqFJyWbyfoqOnfiXZ959QkckTjTmv3HSGiRRxnEM1lo
   swXM/NSEAvqfF8AbKns9fTpPiKPy36AvP2Zh/J5aIX9bNUJtEdfeBu6MC
   5DuzX4HO3dy9qc7fepZr+lquiIfmtkyDAuIaD9JtDAkMZ0GTzKmHLTn+0
   8ofHQeO8/NB8i3sfXABwJaRneZEhSCKy2RoGP8OP0WF0bnY8K7b2g7leT
   w==;
X-CSE-ConnectionGUID: BMneX4AKREG8w+sxd0dLww==
X-CSE-MsgGUID: tgqZlSCnSaGyEeLY3vaAPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2485095"
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="2485095"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 10:50:58 -0800
X-CSE-ConnectionGUID: Oh2KFefCRO2IiRxjMTatWw==
X-CSE-MsgGUID: FP5ox3IOSV60rCejB4uc7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="7336862"
Received: from chang-linux-3.sc.intel.com (HELO chang-linux-3) ([172.25.66.174])
  by fmviesa010.fm.intel.com with ESMTP; 04 Nov 2026 10:50:59 -0800
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
Subject: [PATCH v4 9/9] x86/microcode: Remove microcode_nmi_handler_enable
Date: Wed,  4 Nov 2026 18:23:22 +0000
Message-ID: <20261104182322.578066-10-chang.seok.bae@intel.com>
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

Remove the static key, as there is no more user.

Signed-off-by: Chang S. Bae <chang.seok.bae@intel.com>
---
 arch/x86/include/asm/microcode.h     | 10 ----------
 arch/x86/kernel/cpu/microcode/core.c |  8 ++------
 2 files changed, 2 insertions(+), 16 deletions(-)

diff --git a/arch/x86/include/asm/microcode.h b/arch/x86/include/asm/microcode.h
index e6c09dc48efb..cb5c8e71fad7 100644
--- a/arch/x86/include/asm/microcode.h
+++ b/arch/x86/include/asm/microcode.h
@@ -80,14 +80,4 @@ static inline u32 intel_get_microcode_revision(void)
 
 void microcode_offline_nmi_handler(void);
 
-#ifdef CONFIG_MICROCODE_LATE_LOADING
-DECLARE_STATIC_KEY_FALSE(microcode_nmi_handler_enable);
-static __always_inline bool microcode_nmi_handler_enabled(void)
-{
-	return static_branch_unlikely(&microcode_nmi_handler_enable);
-}
-#else
-static __always_inline bool microcode_nmi_handler_enabled(void) { return false; }
-#endif
-
 #endif /* _ASM_X86_MICROCODE_H */
diff --git a/arch/x86/kernel/cpu/microcode/core.c b/arch/x86/kernel/cpu/microcode/core.c
index 73a46c6c74de..330c62f6dd32 100644
--- a/arch/x86/kernel/cpu/microcode/core.c
+++ b/arch/x86/kernel/cpu/microcode/core.c
@@ -323,7 +323,6 @@ struct microcode_ctrl {
 	bool			nmi_enabled;
 };
 
-DEFINE_STATIC_KEY_FALSE(microcode_nmi_handler_enable);
 static DEFINE_PER_CPU(struct microcode_ctrl, ucode_ctrl);
 static atomic_t late_cpus_in, offline_in_nmi;
 static unsigned int loops_per_usec;
@@ -600,13 +599,10 @@ static int load_late_stop_cpus(bool is_safe)
 	 */
 	store_cpu_caps(&prev_info);
 
-	if (microcode_ops->use_nmi) {
-		static_branch_enable_cpuslocked(&microcode_nmi_handler_enable);
+	if (microcode_ops->use_nmi)
 		stop_machine_nmi_cpuslocked(microcode_nmi_handler, NULL, cpu_online_mask);
-		static_branch_disable_cpuslocked(&microcode_nmi_handler_enable);
-	} else {
+	else
 		stop_machine_cpuslocked(microcode_update_handler, NULL, cpu_online_mask);
-	}
 
 	/* Analyze the results */
 	for_each_cpu_and(cpu, cpu_present_mask, &cpus_booted_once_mask) {
-- 
2.53.0

