Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.230.112
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793615583;
	b=l9soQMmYYLt2i31TtoiXhfqQaShLDZC0Kp2Urbg9R0mnIcdPb8CjqzjWVEqqUwi+LWg4
	 LeCgnrqeJYpPuI+H7P3vQn/VnRnhOaajh3SI4FJfiviKHCJ6ICjPLXuFKOMXZ0FY+vAR5
	 kuK1HGokkxyVF4ii5BFfDh8gqKImz0yK/ntAZnOcGHgDIg5UkuG3ltFDLWWmNIVE8y971
	 C10KQxA9ZxX+NyudR1ndyhoooyWfEQ5yaU8H+VFFYbl/twxO774Qe3FLRcjTmgH/quNP3
	 amsdh7NnqoVTc5pTVK2oF8PsTOd7SxlQuQfSUOIrHRj9p9y6/kZnY8DMUgp8eVm5sNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793615583;
	h=DMARC-Filter:DKIM-Signature:Date:X-Original-From:X-Lms-Return-Path:
	 Content-Type:References:Content-Transfer-Encoding:From:Message-Id:
	 X-Mailer:In-Reply-To:To:Subject:Mime-Version;
	bh=aituG1bxTpae/DDlLBLRyzfIzZb6iuG1m7AYxCW4Jno=;
	b=emH36ULYnIiRLJkpUBypkn18UR/Lbtfdn+Rf2R9f65GupyL9VoJcgi92cg1JAGL1H7xy
	 2xN/T8DJFsTelNrEsRxR19Aqnz/BXvL8dBL05Vqi+qfncPJ1s/3AItyLSRksKPzyX8FjR
	 ybfz3U2mfgGrOP/FgmW6X3kzl6Jl4hLW1Iw+sFe3XB5nExLP7c3djyTNgOpZP9yVHfqVJ
	 PD78WBxWuWA0EwTCKIBkQTzyfmRjKd0dDyOwH7CsDykH85FBOH57kYGgTYV2DPh+KgWLd
	 ecJjxN8ub+WGb1Izzs1aspB6c47Brhpg+DPBNl2NbavIxjEl1SuGcnNfWBNAxwHWbCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=kXo6CCYv;
	arc=none smtp.remote-ip=209.127.230.112
Received: from va-1-112.ptr.blmpb.com (va-1-112.ptr.blmpb.com [209.127.230.112])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56269606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 10:33:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56269606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=kXo6CCYv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1793615577; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=aituG1bxTpae/DDlLBLRyzfIzZb6iuG1m7AYxCW4Jno=;
 b=kXo6CCYvErHN2kyEqA0vi+Z9wvf+5Q50uj5zwxFL1BDhgfDWqz1sj58V+zU2l/75iDaHT4
 dh4DVZ6zQ+Go1QYefEkpJ2GRWIsC7KITSiuKk/KTd19mJxtR0IuGqspzb1hAJrxSaHRh+J
 +Mh99D1UvpCSDJe51fhG6U+AYipOPiKzuB5qumDbxIk0DyzGAUxQF1yCWCTS5cA5Y7NJ4S
 PRT3CvrwZNnF07m8Q67Lo2/jLdZm05SQfH7GlvvO5gZhHVaXmjSeCuAvofTDoaGPXVU/xm
 HFqd6bBGN/ozMPrXjsCWjKBozH+79KTLw1pXqqV5UM/StXoVyml0SIHScj1YHg==
Date: Mon,  2 Nov 2026 18:32:46 +0800
X-Original-From: Guixiong Wei <weiguixiong@bytedance.com>
X-Lms-Return-Path: <lba+26ae866d7+4279ac+vger.kernel.org+weiguixiong@bytedance.com>
Content-Type: text/plain; charset=UTF-8
References: <cover.1793604327.git.weiguixiong@bytedance.com>
Content-Transfer-Encoding: 7bit
From: "Guixiong Wei" <weiguixiong@bytedance.com>
Message-Id: <728ed963f43b44c97f4807a2060f77c0b362521e.1793604327.git.weiguixiong@bytedance.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1793604327.git.weiguixiong@bytedance.com>
To: <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 1/2] x86/fpu: Fix memory leak with dynamic fpstate and exec()
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0

Using an XFD-controlled xfeature can allocate a larger fpstate. On
exec(), fpstate_reset() replaces fpu->fpstate with the embedded buffer
without freeing the dynamic allocation. Once the pointer is overwritten,
the allocation cannot be freed on task exit.

Free dynamic state at the start of fpstate_reset(). In fpu_clone(),
clear the new task's fpstate pointer before resetting its state, so the
parent's allocation is not freed.

fpstate_reset() may now free the current task's buffer. fpu_flush_thread()
calls it before fpu_reset_fpstate_regs() sets TIF_NEED_FPU_LOAD. If a
context switch or a kernel FPU user happens in that window, the register
state still looks live and gets saved into the freed buffer. Set
TIF_NEED_FPU_LOAD before the reset so that nothing saves the hardware
state until it is reloaded from the reset in-memory state.

Fixes: 500afbf645a0 ("x86/fpu/xstate: Add fpstate_realloc()/free()")
Suggested-by: Chang S. Bae <chang.seok.bae@intel.com>
Cc: stable@vger.kernel.org
Signed-off-by: Guixiong Wei <weiguixiong@bytedance.com>
---
 arch/x86/kernel/fpu/core.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/x86/kernel/fpu/core.c b/arch/x86/kernel/fpu/core.c
index d1aeecd57f5ed..af1c1688d69bf 100644
--- a/arch/x86/kernel/fpu/core.c
+++ b/arch/x86/kernel/fpu/core.c
@@ -592,8 +592,15 @@ static void __fpstate_reset(struct fpstate *fpstate)
 	fpstate->user_xfeatures	= fpu_user_cfg.default_features;
 }
 
+/*
+ * Callers resetting the current task must ensure that its FPU register
+ * state isn't saved on context switch as the buffer may be freed here.
+ */
 void fpstate_reset(struct fpu *fpu)
 {
+	/* Free dynamic fpstate (if any) before resetting pointer: */
+	fpstate_free(fpu);
+
 	/* Set the fpstate pointer to the default fpstate */
 	fpu->fpstate = &fpu->__fpstate;
 	__fpstate_reset(fpu->fpstate);
@@ -670,6 +677,8 @@ int fpu_clone(struct task_struct *dst, u64 clone_flags, bool minimal,
 	/* The new task's FPU state cannot be valid in the hardware. */
 	dst_fpu->last_cpu = -1;
 
+	/* Break the link to the other FPU's fpstate: */
+	dst_fpu->fpstate = NULL;
 	fpstate_reset(dst_fpu);
 
 	if (!cpu_feature_enabled(X86_FEATURE_FPU))
@@ -866,6 +875,9 @@ void fpu__clear_user_states(struct fpu *fpu)
 
 void fpu_flush_thread(void)
 {
+	/* Prevent the hardware state from being saved on context switch */
+	set_thread_flag(TIF_NEED_FPU_LOAD);
+
 	fpstate_reset(x86_task_fpu(current));
 	fpu_reset_fpstate_regs();
 }

base-commit: 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e
-- 
2.55.0
