Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5A5F4CA27E
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 21:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792100514; cv=none; b=uNp1BrYoiRP5azuI15PmkWEn50Fvp2QdOfH90GqkAB8MjyLle9c+LO/pBG/LqRAD5h4BB4CDwicm6kGTQrYyvoOPw6T4+P//RpswmmtEIvgcGH7WpPB+NyUkQvZ7C+wNmnS3Ouq96CtCxrDo/CoTVsUBZWq+3xIxzN9vpW0ZBeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792100514; c=relaxed/simple;
	bh=UF0gbftjW8YePG83K/yYgfHR34ylw/nnbhTEHSxF/uk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OtsmnIXxm+h0wgOEUzVNEXcjgdfEBTABFFGY7KfOpjyR8Vdcebd2iPHU9gLsJgKN0ltKv2UxiIQJsnPeaaWdjLT+wbSPTk5UEvCUMWhMvV0WjTXA3HpuyWjW2g/UktII5HT7k8fpMI8tUQmVi25UaHYsQseUOZWi2f0EpX/5KTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DK1ZVYTt; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DK1ZVYTt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792100511; x=1823636511;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UF0gbftjW8YePG83K/yYgfHR34ylw/nnbhTEHSxF/uk=;
  b=DK1ZVYTt2oKKR4sF2tWnJ+RocHShojjlcCbeNzuOKfEJrZA8ICM93fB3
   32ZzSYXq7yyRELMxhejKUWrQZ01UfVocyJm8WSH9GxJ9eS6TIYRNzp+y5
   kuJA6Uw1njJA6exzuUR5r5IewOhEzWhdt/+f/ztkE1fNSSYSYXu/qUt6b
   gA/t/KOWcxiaRHJVBPwaWRJjoWP8b6Jsk4xgdwePXpQVu3qPmO9h/gMTG
   DLExdTd7qwWh/kMO6iCb3QArwvlt0mg96tGWFHl4GV7fdgZ7Y9z4T1qKV
   7050fPu8AaVg3P2XKSCGAixDKiTedOArP1ircElr26VOx7zwGJUD2Myw9
   A==;
X-CSE-ConnectionGUID: KmmV5pw9RnGXpLHoRhbRFA==
X-CSE-MsgGUID: b+jZ8ni/QY220PYS2x04Og==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="902185"
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="902185"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2026 14:41:45 -0700
X-CSE-ConnectionGUID: th+a7vb2SjGK+s+Lo3mguQ==
X-CSE-MsgGUID: njsd4bJ6RZGsiJ5LZyq4jA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="2104451"
Received: from chang-linux-3.sc.intel.com (HELO chang-linux-3) ([172.25.66.174])
  by fmviesa008.fm.intel.com with ESMTP; 15 Oct 2026 14:41:45 -0700
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
Subject: [PATCH v3 9/9] x86/microcode: Remove microcode_nmi_handler_enable
Date: Thu, 15 Oct 2026 21:14:26 +0000
Message-ID: <20261015211426.49114-10-chang.seok.bae@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261015211426.49114-1-chang.seok.bae@intel.com>
References: <20261015211426.49114-1-chang.seok.bae@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove it, as there is no more user.

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

