Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE11C3BB124
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 23:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790724389; cv=none; b=WHUESQyC07AjDw+Ls3TpCGkcu2lM6rs3eFz/dD100ZHgZ8EMAhu3AQALE4Zp1mSPd2rm7N/ymRZ4DFRO8RqKn0XGCUPC8/syomSSDKBCyLamRhiKB2EMKNg5sgdA/G5u55q0XG5XgEaw5vftMETjdMCQvYudUeq6X7eL644IISg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790724389; c=relaxed/simple;
	bh=8+V/04qtkdN7Icq91Ody6LL1hJ8UWMfrOCxnl1TE4ZA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=tq9q8FuxR4RHkJv8QdLtizqmbf6F+4BqinFnq9Od152z4cCTD8/I3NrFltQeDwgHplu40A7t2R0PJ1LzO2oqnoWqZRkxSEINKHyyyKMpnDGSe/5LHcyivRybbjzsYxzp9nUAqGf/VH+m93gO9QJLieLHJy9Y2yFbk/6L6XCWd58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--avagin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=n+3GoGPn; arc=none smtp.client-ip=209.85.167.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--avagin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="n+3GoGPn"
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4b1bc2e44e0so7341719b6e.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 16:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790724386; x=1791329186; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d0jqm/LLVveMIkD5/bDKISlJvOZYH53Q/ensWHrZ5rQ=;
        b=n+3GoGPnA8frLc9Ta50Rp+s7uhG/npuZ2n/BJEs+o9Mdmsk8NyHCy0r7+9CBLfU9BE
         Eyh3R4siA/oIxFMFpUJe2dDghW/UvDf+GSyeHTY5VuTV8TMGFV/Dk4JtqTIcPeTgXUv4
         OgAjF5Jri5p+BSJlHpX/uRb7VBl71pANQoyElqSvU8zE0vU1xGu5pMQZhG+FqqOJ8aL5
         eIRLCjjoqOuWYcdQAFVpEIN/LZ9q7+TDgLEewtK2ExptFnewPst7wD1N0CvlHmjeYiy8
         t9GGnBSCUtN4bEsIpc9CZswB/Trn8O5mdHcJCcIWDi4XF2/hrDrDiqqyQbyk9GMyeUBS
         mN/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790724386; x=1791329186;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d0jqm/LLVveMIkD5/bDKISlJvOZYH53Q/ensWHrZ5rQ=;
        b=kq6hfMMARDQoXABv025nExyj/dt1EDwvCdOSxSlkxAwzZU1asIndmlGv0YIl+dWFZW
         S80G386Ev1HoFPgWP6ccB7UI+XM7ZESFb2uiATIJLEjzSdbmgSf0tS2byczNtso9LI51
         tfcKrCXScpn7i7wioJzSzBn5Toz8n8zVfkDhidlsLlZRpH7LpxUQO9HL7nK9Ogfi0p+6
         jx58iiS6hwWnBM4cyjF7prE/kctmBktMlii88WTxZqUrej252h8s8vqvcuWaGSuqtXuy
         pvcGMEeTkAMKcsausfVXTsr+6MXI5M8fKxawZatD7YukM5WfdhROAxPJEv5ZKCBQtCc9
         VA6w==
X-Gm-Message-State: AFuF++k26lzXNshZhRRACvc9OIigBHH8cZyk+J6/o1so9QZLu6CZanf8
	DtF0Zfz0Z9c8uwUzn8yJ72O6rxzxd4X7Jyy3URuNM77TKLXduJJLcRHBXb2MNRM73X/rv6r8tXY
	K5q9JFg==
X-Received: from iofj23.prod.google.com ([2002:a05:6602:7097:b0:9c3:e3d2:e831])
 (user=avagin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6808:4f60:b0:4d6:90d3:e190
 with SMTP id 5614622812f47-4f06dd4961cmr1163066b6e.47.1790724385975; Tue, 29
 Sep 2026 16:26:25 -0700 (PDT)
Date: Tue, 29 Sep 2026 23:26:20 +0000
In-Reply-To: <20260929232621.3745312-1-avagin@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260929232621.3745312-1-avagin@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260929232621.3745312-2-avagin@google.com>
Subject: [PATCH 1/2] x86/fpu: Allow restoring signal frames with larger xstate_size
From: Andrei Vagin <avagin@google.com>
To: Borislav Petkov <bp@alien8.de>, "Chang S. Bae" <chang.seok.bae@intel.com>
Cc: linux-kernel@vger.kernel.org, criu@lists.linux.dev, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Andrei Vagin <avagin@google.com>, Alexander Mikhalitsyn <alexander@mihalicyn.com>, 
	"H. Peter Anvin" <hpa@zytor.com>
Content-Type: text/plain; charset="UTF-8"

check_xstate_in_sigframe() currently enforces that fx_sw->xstate_size in
the signal frame must not exceed the current task's fpstate->user_size.
This prevents checkpoint/restore tools (such as CRIU) from migrating a
process that was saved on a CPU with a larger set of enabled xstate
features to a CPU with fewer features, even if the process did not
actively use any of the unsupported features.

Commit fd14edd82077 ("x86/fpu: Pre-fault only required size of xstate
buffer") introduced validation in check_xstate_in_sigframe() to
calculate the required buffer size from the intersection of
fx_sw->xfeatures and fpstate->user_xfeatures, and to shrink
fx_sw->xstate_size to that required size.

Remove the fx_sw->xstate_size > fpstate->user_size check so that signal
frames with a larger xstate_size can be restored when all active
features are supported. Because fx_sw->xstate_size is no longer bounded
by fpstate->user_size before reading the trailing FP_XSTATE_MAGIC2
marker, check for unsigned overflow when comparing fx_sw->xstate_size
against fx_sw->extended_size and use get_user() instead of __get_user()
when reading FP_XSTATE_MAGIC2.

When allowing a larger xstate_size, the kernel must still reject the
signal frame (resulting in SIGSEGV) if the XSAVE header (xstate_bv)
marks any unsupported feature as active. On the direct restore path,
XRSTOR raises #GP if any bit in xstate_bv is 1 while the corresponding
bit in XCR0 is 0, but this does not cover dynamically enabled features
(such as AMX XFEATURE_XTILE_DATA) that are enabled in XCR0 while
disabled for the task via MSR_IA32_XFD and fpstate->user_xfeatures.
Because __restore_fpregs_from_user() masks xrestore_mask (EDX:EAX) with
fpstate->user_xfeatures before executing XRSTOR (as kernel-mode XRSTOR
must not trigger an XFD #NM trap), XRSTOR would ignore XFD-disabled
components and silently drop their active state.

Therefore, explicitly validate in check_xstate_in_sigframe() that
xbuf->header.xfeatures (xstate_bv) only contains features present in the
intersection of fx_sw->xfeatures and fpstate->user_xfeatures. A
concurrent user-space modification of xbuf->header.xfeatures between
this check and XRSTOR cannot compromise the kernel: the restore mask
(EDX:EAX) is derived from the kernel copy of fx_sw and masked with
fpstate->user_xfeatures, so XRSTOR will either fault with #GP (if a bit
outside XCR0 is set) or ignore any bit not enabled in the restore mask
without touching its memory area or raising a kernel-mode #NM.

Update Documentation/arch/x86/xstate.rst to reflect that signal frames
with a larger xstate_size can be restored if all active features are
supported.

Signed-off-by: Andrei Vagin <avagin@google.com>
---
 Documentation/arch/x86/xstate.rst | 10 +++++++---
 arch/x86/kernel/fpu/signal.c      | 31 ++++++++++++++++++++++++++-----
 2 files changed, 33 insertions(+), 8 deletions(-)

diff --git a/Documentation/arch/x86/xstate.rst b/Documentation/arch/x86/xstate.rst
index e2944f744255..f34bd06706d9 100644
--- a/Documentation/arch/x86/xstate.rst
+++ b/Documentation/arch/x86/xstate.rst
@@ -179,8 +179,9 @@ Signal Frame Layout and Portability
 The signal frame is designed to be self-describing and portable. This is
 especially important for checkpoint/restore tools like CRIU, which may restore
 a process on a different host than where it was checkpointed. A signal frame
-created on a machine with fewer CPU features can be successfully restored on a
-machine with more CPU features, but not vice-versa.
+can be successfully restored across machines with different sets of enabled
+CPU features (whether the frame's ``xstate_size`` is smaller or larger than the
+destination host's default), provided all active features are supported.
 
 Signal Frame Software Reserved Bytes
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
@@ -222,7 +223,10 @@ Portability Constraints
 
 Signal frame portability is constrained by the architectural XSAVE layout.
 Restoration is supported only if the destination host supports all features
-present in the frame and uses matching component offsets and sizes for them.
+active in the XSAVE header (``XSTATE_BV``) and uses matching component offsets
+and sizes for them. (The frame's ``xstate_size`` and ``_fpx_sw_bytes.xfeatures``
+may exceed the destination host's default if the source host had additional
+features enabled that were not actively used by the task.)
 While layout compatibility is generally maintained across CPUs from the same
 vendor, differences can occur across vendors or if the XSAVE space of a
 deprecated feature (e.g. MPX) is repurposed for a newer feature (e.g. APX).
diff --git a/arch/x86/kernel/fpu/signal.c b/arch/x86/kernel/fpu/signal.c
index 1f721ac84283..ce8939a9ce8f 100644
--- a/arch/x86/kernel/fpu/signal.c
+++ b/arch/x86/kernel/fpu/signal.c
@@ -36,11 +36,18 @@ static inline bool check_xstate_in_sigframe(struct fxregs_state __user *buf_fx,
 	if (__copy_from_user(fx_sw, &buf_fx->sw_reserved[0], sizeof(*fx_sw)))
 		return false;
 
-	/* Check for the first magic field and other error scenarios. */
+	/*
+	 * Check for the first magic field and other error scenarios.
+	 *
+	 * fx_sw->xstate_size can exceed fpstate->user_size if the frame was
+	 * saved on a CPU with a larger set of enabled xstate features.
+	 * Reject the buffer below if the XSAVE header contains any active
+	 * features that are not in both fx_sw->xfeatures and user_xfeatures.
+	 */
 	if (fx_sw->magic1 != FP_XSTATE_MAGIC1 ||
 	    fx_sw->xstate_size < min_xstate_size ||
-	    fx_sw->xstate_size > fpstate->user_size ||
-	    fx_sw->extended_size < fx_sw->xstate_size + FP_XSTATE_MAGIC2_SIZE)
+	    fx_sw->xstate_size > fx_sw->extended_size ||
+	    fx_sw->extended_size - fx_sw->xstate_size < FP_XSTATE_MAGIC2_SIZE)
 		goto err_setfx;
 
 	/*
@@ -49,19 +56,33 @@ static inline bool check_xstate_in_sigframe(struct fxregs_state __user *buf_fx,
 	 * fpstate layout with out copying the extended state information
 	 * in the memory layout.
 	 */
-	if (__get_user(magic2, (__u32 __user *)(buf + fx_sw->xstate_size)))
+	if (get_user(magic2, (__u32 __user *)(buf + fx_sw->xstate_size)))
 		return false;
 	if (unlikely(magic2 != FP_XSTATE_MAGIC2))
 		goto err_setfx;
 
 	if (fx_sw->xstate_size != fpstate->user_size ||
 	    fx_sw->xfeatures != fpstate->user_xfeatures) {
+		struct xregs_state __user *xbuf = buf;
+		u64 xstate_bv, xfeatures;
 		unsigned int xsize;
-		u64 xfeatures;
+
+		if (__get_user(xstate_bv, &xbuf->header.xfeatures))
+			return false;
 
 		/* Calculate size of enabled features only. */
 		xfeatures = fx_sw->xfeatures & fpstate->user_xfeatures;
 
+		/*
+		 * Reject XFD-disabled features present in XCR0 that XRSTOR
+		 * would otherwise ignore when masked out of EDX:EAX, as well
+		 * as any other active features not in xfeatures. Concurrent
+		 * user-space changes after this check cannot affect the kernel
+		 * because XRSTOR is masked with xfeatures.
+		 */
+		if (xstate_bv & ~xfeatures)
+			return false;
+
 		xsize = xstate_calculate_size(xfeatures, false);
 		if (fx_sw->xstate_size < xsize)
 			return false;
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

