Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794065850;
	b=zGdjbHN6ZYk6jqCvf0WPqymbWdpndLC11mFB7Xl5OOWgKrU2RHKjVi1Omuc0/t+M7HVB
	 zf8vLL5lDqYu0y+gZiRH/YiK0FcCgPjU3cVMGC2PwAWf0njcN7GG2dSa7NEHfxa6wMh18
	 DBQQj98Fz0LlkdbG4xWrP7j0oa60FR/vSOPmAlHetEYU2/RvdPkfBa0garAD+KjWDJkhd
	 K8BTkSSQzkqxmg9VnYnmz72O8Ym9RDSXO/a5PP3uqEIP0F5TLnygGxopJDHNNwsaDfVUb
	 9kS0fYINmxOgrl0B4LYzDmLNoKfLpHsSNBn16MGDIK06QVU6jIXP4iKH3yAjy8zOaug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794065850;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=tnh9BJDrW2Tas6QMn66ShAIs0W72jtzo/i49twtSyEs=;
	b=WJVVDaxNmT5HHZLN22d21DWUZLskMo6MNu2bXhU2GvnhKAei/ZJf0DPwr7dXnBqIOSjj
	 vFtv+0FoZ4XcjkB85gIXLsR3YTp7WD5qtQcibb0YO1IDJ+Tuhn6vfZHVA04E1SX6vVn+U
	 XgJy6ejDIsUImPMUJ1fmvLZea0RXqLGa2HUwhoCRtKtHIiVQi3vN3QIAKrPE5qdY5yVuq
	 njd/wwsaOmhURNm3oWMEcBDAdRJc5/RzeL0VYIIbrLe/Q5xKKjfhl+2MQppZM0cf5mqQ9
	 7dJ9KUHUZYCAst77fm/QFxjX3Jmx6TGa3cm+UoFd28pMwwIa8DGNxcPaoXAHSI6Nr0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--ptosi.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=EMBmOJfE;
	arc=none smtp.remote-ip=209.85.218.71
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com [209.85.218.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CE0E6082BFF
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 15:37:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8CE0E6082BFF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ptosi.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=EMBmOJfE
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-c49b95262a5so117784566b.3
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 07:37:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794065849; x=1794670649; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tnh9BJDrW2Tas6QMn66ShAIs0W72jtzo/i49twtSyEs=;
        b=EMBmOJfEL52sOfkmFOzjWk8ekCEsD2YGznR/8SXhmSzg72HPgruh+stjzt8uWKtRaE
         2KUVpRfWOZnGB8B0R6u6BP5SzQhd8OhHcyhtDuSdMBpwV4V2YatxKJ7BecNFRAl80egw
         SFAiviwN1MTO8tCjyDk7JXQREkl+DIsL1BIAHtHMorCBO1WtSsOYYTFNo5GgxAlbMEEe
         vTOaxejvcKmOCPmPr3VpGaTeJUgRFCClND8rcDFaTMsAsvN2rxYJCLCYXFwiGys+xkU3
         nezontSH0dlAQ5xLXrxVRWFWGW+gCaIRd6yOhSi8PPHHGF8QJxvEQVVCUCI2L9wA2v70
         wVLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794065849; x=1794670649;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tnh9BJDrW2Tas6QMn66ShAIs0W72jtzo/i49twtSyEs=;
        b=2hxma601wpNUuSHby5Y2cEwI6zxt8KEbKTmVDkNtV+uRPlSMMBb+6iBZiR4qaef/Yt
         cYnyNT+5WZneBOI8A1sp7HXve3s0A6J8u9TGjVEoXGfaK9mRfZ/+jYAsi/2Fy/7LKzgG
         N9lo9US9B2ZkD70XkP57+klyhZ6zGWOj54LiTs2Vv2ar3FhmCpxK/QquYSa/wYiAZ+3+
         ydM0lmN64j3t067QBJx3nCLJuHKrgJzg2+cz0C1ixQS9Lsc571t+CpLUvLAYwkLHX3ts
         MWxaJ7tG1viio8rV/32uYyoT1DRtpY9FSD2qaYnkhC63c9GaZ/7E6aw828rDoxNdxvz7
         EXZg==
X-Forwarded-Encrypted: i=1; AL+hErFtxNuM/PzsnxUYmoBdajuHf8TYJ5qg9ihR/cXN65muOMhvTN6kVVimhm+ZpIWgg/cljFHowFx0/FwQtdQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/HLibbopXy+Gjt5sTZdDF5h1fORX54vkTqQ1bwiIa5a9pZmLac
	hiLNa4KqgxqMbWB0nVTS1k/Gf5qPqXyg4nQwErO4uXy7XraMkjDbMqf4azsT6NXyuoiC7tWZ/eH
	JiQ==
X-Received: from ejbbg10.prod.google.com ([2002:a17:906:a04a:b0:c3f:85b7:3a4b])
 (user=ptosi job=prod-delivery.src-stubby-dispatcher) by 2002:a17:906:f5a3:b0:c42:fc8b:6c7a
 with SMTP id a640c23a62f3a-c4d34cb93dbmr425465766b.41.1794065848659; Sat, 07
 Nov 2026 07:37:28 -0800 (PST)
Date: Sat, 07 Nov 2026 16:36:21 +0100
In-Reply-To: <20261107-mte-kasan-split-v1-0-d84ea5f30f94@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261107-mte-kasan-split-v1-0-d84ea5f30f94@google.com>
X-Mailer: b4 0.14.3
Message-ID: <20261107-mte-kasan-split-v1-15-d84ea5f30f94@google.com>
Subject: [PATCH 15/24] arm64: Refactor and remove mte_disable_tco_entry()
From: "=?utf-8?q?Pierre-Cl=C3=A9ment_Tosi?=" <ptosi@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Peter Collingbourne <peter@pcc.me.uk>, "=?utf-8?q?Pierre-Cl=C3=A9ment_Tosi?=" <ptosi@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Break the function up into the fundamental steps of checking the state
and clearing PSTATE.TCO. As a result, call sites can now be optimized
to only check the conditions that matter in their context, further
clarifying the intent in the code. This results in self-documenting code
and higher maintainability, addressing the need for lengthy comments.

Cc: Peter Collingbourne <peter@pcc.me.uk>
Signed-off-by: Pierre-Cl=C3=A9ment Tosi <ptosi@google.com>
---
 arch/arm64/include/asm/mte.h     | 30 ++++++++++--------------------
 arch/arm64/include/asm/uaccess.h |  6 ++++++
 arch/arm64/kernel/entry-common.c | 13 +++++++++++--
 arch/arm64/kernel/mte.c          |  8 ++++----
 4 files changed, 31 insertions(+), 26 deletions(-)

diff --git a/arch/arm64/include/asm/mte.h b/arch/arm64/include/asm/mte.h
index 815843079eb9..1308e37c43c6 100644
--- a/arch/arm64/include/asm/mte.h
+++ b/arch/arm64/include/asm/mte.h
@@ -18,6 +18,7 @@
 #include <linux/types.h>
=20
 #include <asm/barrier.h>
+#include <asm/cpufeature.h>
 #include <asm/pgtable-types.h>
 #include <asm/sysreg.h>
=20
@@ -62,6 +63,15 @@ static __always_inline bool mte_get_reset_tfsr(void)
 	return __mte_get_reset_tfsr();
 }
=20
+static inline bool task_uses_sync_mte_faults(struct task_struct *task)
+{
+	if (!system_supports_mte())
+		return false;
+
+	/* TCF0[0] is set for both synchronous (0b01) and asymmetric (0b11). */
+	return task->thread.sctlr_user & (1UL << SCTLR_EL1_TCF0_SHIFT);
+}
+
 #ifdef CONFIG_ARM64_MTE
=20
 /* track which pages have valid allocation tags */
@@ -254,26 +264,6 @@ static inline bool folio_try_hugetlb_mte_tagging(struc=
t folio *folio)
 }
 #endif
=20
-static inline void mte_disable_tco_entry(struct task_struct *task)
-{
-	if (!system_supports_mte())
-		return;
-
-	/*
-	 * Re-enable tag checking (TCO set on exception entry). This is only
-	 * necessary if MTE is enabled in either the kernel or the userspace
-	 * task in synchronous or asymmetric mode (SCTLR_EL1.TCF0 bit 0 is set
-	 * for both). With MTE disabled in the kernel and disabled or
-	 * asynchronous in userspace, tag check faults (including in uaccesses)
-	 * are not reported, therefore there is no need to re-enable checking.
-	 * This is beneficial on microarchitectures where re-enabling TCO is
-	 * expensive.
-	 */
-	if (kasan_hw_tags_enabled() ||
-	    (task->thread.sctlr_user & (1UL << SCTLR_EL1_TCF0_SHIFT)))
-		set_pstate_tco(0);
-}
-
 #ifdef CONFIG_KASAN_HW_TAGS
 void mte_check_tfsr_el1(void);
=20
diff --git a/arch/arm64/include/asm/uaccess.h b/arch/arm64/include/asm/uacc=
ess.h
index aac7676da531..e99faabd5dfc 100644
--- a/arch/arm64/include/asm/uaccess.h
+++ b/arch/arm64/include/asm/uaccess.h
@@ -123,6 +123,12 @@ static inline bool uaccess_ttbr0_enable(void)
 }
 #endif
=20
+static inline bool uaccess_requires_mte(struct task_struct *task)
+{
+	/* Asynchronous faults don't get reported to userspace. */
+	return task_uses_sync_mte_faults(task);
+}
+
 static inline void __uaccess_disable_hw_pan(void)
 {
 	asm(ALTERNATIVE("nop", SET_PSTATE_PAN(0), ARM64_HAS_PAN));
diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-com=
mon.c
index fbf9bafc6962..ea385f579269 100644
--- a/arch/arm64/kernel/entry-common.c
+++ b/arch/arm64/kernel/entry-common.c
@@ -7,6 +7,7 @@
=20
 #include <linux/context_tracking.h>
 #include <linux/irq-entry-common.h>
+#include <linux/kasan-enabled.h>
 #include <linux/kasan.h>
 #include <linux/linkage.h>
 #include <linux/livepatch.h>
@@ -16,6 +17,7 @@
 #include <linux/sched.h>
 #include <linux/sched/debug.h>
 #include <linux/thread_info.h>
+#include <linux/uaccess.h>
=20
 #include <asm/cpufeature.h>
 #include <asm/daifflags.h>
@@ -72,7 +74,13 @@ static __always_inline void irqentry_exit_pcpu_adjust(st=
ruct pt_regs *regs)
 static __always_inline void mte_enter_from_kernel_mode(void)
 {
 	mte_check_tfsr_entry();
-	mte_disable_tco_entry(current);
+
+	/*
+	 * Taking an exception sets TCO but clearing it can be expensive on
+	 * some architectures so first check that MTE is actually required.
+	 */
+	if (kasan_hw_tags_enabled() || uaccess_requires_mte(current))
+		set_pstate_tco(0);
 }
=20
 static __always_inline void mte_exit_to_kernel_mode(void)
@@ -82,7 +90,8 @@ static __always_inline void mte_exit_to_kernel_mode(void)
=20
 static __always_inline void mte_enter_from_user_mode(void)
 {
-	mte_disable_tco_entry(current);
+	if (kasan_hw_tags_enabled() || uaccess_requires_mte(current))
+		set_pstate_tco(0);
 }
=20
 static __always_inline void mte_exit_to_user_mode(void)
diff --git a/arch/arm64/kernel/mte.c b/arch/arm64/kernel/mte.c
index 47432c9c4de0..0d998289edcb 100644
--- a/arch/arm64/kernel/mte.c
+++ b/arch/arm64/kernel/mte.c
@@ -281,8 +281,8 @@ void mte_thread_switch(struct task_struct *next)
 	mte_update_gcr_excl(next);
=20
 	/* TCO may not have been disabled on exception entry for the current task=
. */
-	if (!kasan_hw_tags_enabled())
-		mte_disable_tco_entry(next);
+	if (!kasan_hw_tags_enabled() && uaccess_requires_mte(next))
+		set_pstate_tco(0);
=20
 	if (!system_uses_mte_async_or_asymm_mode())
 		return;
@@ -401,8 +401,8 @@ long set_mte_ctrl(struct task_struct *task, unsigned lo=
ng arg)
 		mte_update_sctlr_user(task);
 		mte_update_gcr_excl(task);
 		update_sctlr_el1(task->thread.sctlr_user);
-		if (!kasan_hw_tags_enabled())
-			mte_disable_tco_entry(task);
+		if (!kasan_hw_tags_enabled() && uaccess_requires_mte(task))
+			set_pstate_tco(0);
 		preempt_enable();
 	}
=20

--=20
2.56.0.455.g6c5a503b38-goog

