Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F5C63C4572
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 23:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789601003; cv=none; b=czCNwHSihriuDP2O+a0uGUQutFgqhLKtCU3k3rva51nEdwKa0nmBOmgPco4QlYK7cqTTQnhexXICR+CJdc2S1v37HkCFuxkKYiqpa/Gc8yl1y4HaHa2fFdPKwgw/CMIz33hDwBEQkOaAz8lXKwmxStImBdlWkm5JAG200JnWnCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789601003; c=relaxed/simple;
	bh=4UixqbcbSfOrTAup4aEOXt8/JXKgEGIcTBf3BEhG1p0=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=Jf9be+rhaooO8EmF3ijVhtLiipxu64Tv5OImz241PltSQM59q7P9tB3nTc16AsHTlzGcjq8ipgT0LXm5JO0YEA+CovOyRKjkaWq37sIpf1E+lbHX9Xa2GDSTbRSKfff8J1hVlFEycR8GPLKOoxbHz9zfwMqCb9k14k5kwsquM4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--avagin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=T8uRmz6/; arc=none smtp.client-ip=209.85.167.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--avagin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="T8uRmz6/"
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4c7f887ac6bso423116b6e.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 16:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789601000; x=1790205800; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SvbJdnrVvb+cd4Qa4kJl3M9EGMjCcAwlbnHa1T82/fI=;
        b=T8uRmz6/LzJ7ntXC/0tvZ+dPBmXLNYi5eX+yryFKdq9JNYzBQPvK+EufbYB9gqYDLt
         XzJkHYNTIi8UGFAKtrTut8tcb13PF4K1jkxEfyIZlO5lmgGGaFEMxk1/wNurd/CX1hYV
         3/uX10k/YcAJzM3cp0ABZl9C8k6OMP3cZnGPvUR2FaAoLbJxy7imiCEwkHhgoyL0u1Lp
         L01OIrGEkPo6RC69u60Dqky27iOnJ0GsYv0GzwBWqZ/f/7MMc5XvCmD10Q5f+2Y9uA5I
         N3NqLwKRw5111j8OINku2gH4/xlgrLnG0mNv21JkVkPGRIC6XXglKJxErSrrjVQVRqxI
         X8Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789601000; x=1790205800;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SvbJdnrVvb+cd4Qa4kJl3M9EGMjCcAwlbnHa1T82/fI=;
        b=v3qOrs6iydRvhCy5H0kHZEKTrBXegJm6u0uTq1rE39dc6wPKG1g3wWrcrPw/9BWCok
         AlHiDFYTX9Hd1T8DVrIKhhVLgjPtqMAjhCkVdj2J3KUin3HkQLk/vfcd/JzfFZUJhxld
         zAqdManb5NUckwx4fivxKVzzli0ccGmZWC/OkzezV9n7X/qobFjl6icewgopmIVE13mr
         KOHZwfizoni4asRgs2wQZ2P5zR7kRBGmpEVvo9ZMaV8q9B5A4YbbEXi47G0E4cuPigxj
         6tDJx0vkogqVvJqb0nKeyviuzmUlqg7FHK0kvo5ZvtPMIjvyKc9TISgO+zGFL1Z9vGSQ
         RtsA==
X-Gm-Message-State: AFuF++mfSrxzNmDeSHpfdtC3QwRndJDQ5XPCc9E/UneCax2pzHTFY+E9
	cV84VzizCGSfgyi4fUnT+ie2+rNrnPSqoYYSsARL6bs9jzws5DBHt0KTJNk3eqVwzh9GZKkGvu2
	kN8E7/A==
X-Received: from iovb21.prod.google.com ([2002:a05:6602:2495:b0:9ab:11c4:e042])
 (user=avagin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6808:152a:b0:4b3:7a14:6b25
 with SMTP id 5614622812f47-4ca4d20d961mr8897025b6e.14.1789601000269; Wed, 16
 Sep 2026 16:23:20 -0700 (PDT)
Date: Wed, 16 Sep 2026 23:23:03 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260916232310.490786-1-avagin@google.com>
Subject: [PATCH v6 0/7] x86/fpu: Restore and reinforce signal frame portability
From: Andrei Vagin <avagin@google.com>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	"Chang S. Bae" <chang.seok.bae@intel.com>
Cc: linux-kernel@vger.kernel.org, criu@lists.linux.dev, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Andrei Vagin <avagin@google.com>, Alexander Mikhalitsyn <alexander@mihalicyn.com>, 
	"H. Peter Anvin" <hpa@zytor.com>
Content-Type: text/plain; charset="UTF-8"

The x86 signal frame is designed to be self-describing. The xstate_size
field in the software-reserved bytes indicates the actual size of the
xstate context and is used by the kernel to locate the FP_XSTATE_MAGIC2
marker during signal return.

This design is required to provide portability of signal frames across
different machines. For example, a process checkpointed on a system with
fewer xstate features and restored on a system with more features will
have a signal frame on its stack that is smaller than the destination
host's default. By relying on the frame's internal xstate_size, the
kernel can correctly validate and restore such frames.

This series restores and improves signal frame portability. The goal is
to allow process migration across CPUs with heterogeneous FPU
capabilities, as long as the process only uses features supported by
both systems. This version addresses the original issues by pre-faulting
only the required size of the xstate buffer (rather than the default
task size), and includes cleanups requested by Ingo Molnar.

v6:
  - Clarify struct _fpstate_32 layout and reformat documentation per
    Borislav comments.
  - Add Reviewed-by tags from Chang S. Bae.
v5: Address Chang's comments:
  - Documentation:
    - Expanded Documentation/arch/x86/xstate.rst with a dedicated
      section describing struct _fpx_sw_bytes, 32-bit vs 64-bit frame
      layout differences, and architectural portability constraints.
    - Trimmed the comment in <uapi/asm/sigcontext.h> and added a
      reference to xstate.rst.
  - x86/fpu core:
    - Renamed the 32-bit helper to restore_from_ia32_fxstate() and
      inlined the remaining native path directly into
      fpu__restore_sig().
  - Selftests:
    - Consolidated the shrunk-frame and insufficient-size test cases.
v4:
    - Update documentation to describe architectural XSAVE layout
      constraints and feature repurposing (e.g. MPX vs APX).
    - The patch "x86/fpu: Allow restoring signal frames with larger
      xstate_size" will be sent in a separate series.
    - Address sashiko comments.

v3:
    - Include cleanups and refactoring of signal frame handling code
      as requested by Ingo Molnar.
    - Fix potential underflow in xstate_calculate_size()

v2:
    - Address sashiko comments.
    - 44eeff9bc467 ("Revert "x86/fpu: Refine and simplify the magic
      number check during signal return"") has been merged.

Cc: Alexander Mikhalitsyn <alexander@mihalicyn.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: "Chang S. Bae" <chang.seok.bae@intel.com>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Thomas Gleixner <tglx@kernel.org>

Andrei Vagin (7):
  x86/fpu: Document signal frame layout and portability
  x86/fpu: Clean up and rename variables in signal frame handling
  x86/fpu: Extract restore_from_ia32_fxstate() and clean up
    fpu__restore_sig()
  x86/fpu: Document reasoning of FX-only fallback
  x86/fpu: Fix potential underflow in xstate_calculate_size()
  x86/fpu: Pre-fault only required size of xstate buffer
  selftests/x86: Add tests for signal frame FPU portability

 Documentation/arch/x86/xstate.rst                  |  57 +++++
 arch/x86/include/uapi/asm/sigcontext.h             |  15 ++
 arch/x86/kernel/fpu/signal.c                       | 134 +++++++----
 arch/x86/kernel/fpu/xstate.c                       |   9 +-
 arch/x86/kernel/fpu/xstate.h                       |   2 +
 tools/testing/selftests/x86/Makefile               |   5 +-
 .../selftests/x86/sigframe_fpu_portability.c       | 245 +++++++++++++++++++++
 tools/testing/selftests/x86/xstate.c               |  12 -
 tools/testing/selftests/x86/xstate.h               |  20 ++
 9 files changed, 437 insertions(+), 62 deletions(-)
 create mode 100644 tools/testing/selftests/x86/sigframe_fpu_portability.c

-- 
2.55.0.979.g7e5102b832-goog

