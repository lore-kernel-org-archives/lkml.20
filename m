Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DCCE4D0A12
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 16:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790353499; cv=none; b=TULxPdAL8bgx6Ld1KoWagIthkrArdZefQ95CaJFLoeCYO7d5201UJkGZUtNdfO9EKrXqcROlYxTh10T0M81bhoqZ9IJLPppNrOEFbC1FXhZw3UiEjl53CLQ+4nHP8HzAu4Lv8dxmwW+iTgU21k3d5RGnZCccYXZ+RHJTe/7nbCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790353499; c=relaxed/simple;
	bh=87g4lytV2mhaX3ojO+Jg+QIb8VV340Hs8QcAKHHdfZo=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=WuQu46XNVrSX+qXNPPNlWeRdEim3LCye08+YjYSpApLe0K4RI2MqQyuvcAuyYh8PmRFZbThf3D37UFpinelo1efCNChA7Z4kvLPjckWG/s/CF6mgZa5+kdXvis94vodmuUKmwSehdEIklcwyO8zaPegjdkMtFdR6aoFQwAeUD2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--avagin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sphjn7bV; arc=none smtp.client-ip=209.85.167.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--avagin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sphjn7bV"
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4d2f0f77124so1482021b6e.3
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 09:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790353497; x=1790958297; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fgX7U1nrh38dVjmvESPNjzu/hwm8KRLTr/VGohVA/mA=;
        b=sphjn7bV9qwtXZlOfIL0WbPo44rAUJULi6pzpvGh/1aqs4a8oytuU+XiygG6PNSkJ5
         6Mkbzmapry+BhsxKSPMvBWZF4z9sR9bSacA4gWJOk3MNd05ujdKCynSnbF2DRQYYPQyq
         P6YtQfz7QgHgCmFIzZ6lIambU1TiKgZ/BOU8tQwhVJ7TT9p0jfkXDzGRXwxaRpGrOgNc
         +xD1el+lVQfowxm95ltetCIGMAdqZvexItMEUnir8XOF0LTrCNbSTPy5RjOIH6fuKU/8
         zoY5Ln40AJXYuC13t1AQYLwKjmbtxSs33+k+MmRQFTDbx6hxmGIQPx+cqKTUkupxuia2
         RNTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790353497; x=1790958297;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fgX7U1nrh38dVjmvESPNjzu/hwm8KRLTr/VGohVA/mA=;
        b=DRH/iX9QSSCRS44aJJzNSJmf7wrXoHGzoqbbQhscP3DpInbZHGcWJA2FilHDroFkDe
         uW9Jv8t76wDKzBoKgm0PkJpiGea/VUiwwuLjM70m+e1aTTk02dbj8jtz75TWvHh8hpju
         gb54N92hxTmWfHimPMMvmVffYuzssHSyROyKcAQ7j7kp1wuqJP/qOvrmkAzNJgVqKIPN
         5GZLM/ZJ9qcr6igFWkK9Wje5vGEhDHHI6kajw0iigzDEgCf9loRRhCqxprqgeOuVLpiE
         czipDPKjRXLn9oTBxqjjYJ1ybg6CH73kb1+BY9b2OrCe7EIAYw+TezkDCHjmtEWGLe0l
         w3FQ==
X-Gm-Message-State: AFuF++mc1Kf3QI209xknnx606EGRBaLRWbNgR4WQlE0tIiJJhj5ACDJB
	gz6bdMPDTpFDBmWpPpJGJkUfVQYMjYRHA4ymu8eN+3Jg0GKtslvUFJZxUQsUhtPLwDRHcWt6d5b
	FEFqKkw==
X-Received: from oamn1.prod.google.com ([2002:a05:6870:8801:b0:494:50e2:71dd])
 (user=avagin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6808:3c48:b0:4d6:90f4:48ab
 with SMTP id 5614622812f47-4d72e66505dmr6460190b6e.45.1790353496388; Fri, 25
 Sep 2026 09:24:56 -0700 (PDT)
Date: Fri, 25 Sep 2026 16:24:46 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260925162454.1403405-1-avagin@google.com>
Subject: [PATCH v8.1 0/7] x86/fpu: Restore and reinforce signal frame portability
From: Andrei Vagin <avagin@google.com>
To: Borislav Petkov <bp@alien8.de>, "Chang S. Bae" <chang.seok.bae@intel.com>
Cc: linux-kernel@vger.kernel.org, criu@lists.linux.dev, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
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

v8.1:
  - Rebase on top of tip/x86/fpu.
v8: Address Sashiko's comments:
  - Combine %ymm0 load/store and syscall into a single inline assembly
    block.
v7: Address Borislav's comments:
  - Replace #ifdefs and stub for restore_from_ia32_fxstate() with an
    early return using IS_ENABLED().
  - Use reverse fir tree variable declaration ordering in
    check_xstate_in_sigframe().
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

 Documentation/arch/x86/xstate.rst                  |  54 +++++
 arch/x86/include/uapi/asm/sigcontext.h             |  15 ++
 arch/x86/kernel/fpu/signal.c                       | 127 +++++++----
 arch/x86/kernel/fpu/xstate.c                       |   7 +-
 arch/x86/kernel/fpu/xstate.h                       |   2 +
 tools/testing/selftests/x86/Makefile               |   5 +-
 .../selftests/x86/sigframe_fpu_portability.c       | 235 +++++++++++++++++++++
 tools/testing/selftests/x86/xstate.c               |  12 --
 tools/testing/selftests/x86/xstate.h               |  20 ++
 9 files changed, 417 insertions(+), 60 deletions(-)
 create mode 100644 tools/testing/selftests/x86/sigframe_fpu_portability.c

base-commit: c0a44d1745d3f209e4840b78ab75274fb74f01a0
-- 
2.55.0.979.g7e5102b832-goog

