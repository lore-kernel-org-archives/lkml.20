Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82BB035E943
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 04:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788842073; cv=none; b=V0Ael5k9zH6tL0uHWRIOhCFDuOH1Ydk1mO9plxKPECP9q4ZV8d67AYv2wOEPWoIpmS+JmrVaJdebGNmrQybkX+k3PXeN8xDmr7JP8X2g3OeV94ASslhJJqmhr/xBwy7iwQpyFJ7HejtjGRq98U5fAK8RJ9oQrGOpACwODQ9UogU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788842073; c=relaxed/simple;
	bh=164QcSZmAnJEEBekgQ/lXM+cAUZTJpkw3Ju3gu9ebjs=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=G7nm98Qik2c/7URfk3cCygZxYC+iMCvEPi+XGbpJ+RC5ga15uqZpuve6C0EBXmSrbDtqhx0VAiGIIY+4helRbB9NOIiZher9OWSWHtJVTEp2CHdQA9szPANhjRlBgKOiLa2ALEZ7MlEd4Z/1L7Zhznw19svQGqW/RtX9o+AZIO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--avagin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TKoeHLTv; arc=none smtp.client-ip=209.85.210.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--avagin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TKoeHLTv"
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7f4e8568ccdso7085302a34.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 21:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788842070; x=1789446870; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+CAXnDlq8Fddwa0koCOvX7W+lYybD5g3FsmKlhtE5zY=;
        b=TKoeHLTvlrgXbmAad97yK9TxSel1JQ2asOonTPJ/ppz42Ln/wVB1FquFnGxVNekTdG
         z+2wPTP/5oLuZb4U+P8ELNuPsUOU9rGfZ2rpUaqthCiPUMVBPyBX8KVc3t6OY99g2Xph
         +dtAOVZC+zdnwO+k8TTwjdeZ8nmUAGtisx28nuVwnfNsob0Sg3bJ2M7V5922psgC5WjC
         2HtNul6HYeVq+JhqV+j3FJFgIzkMrELoAI9bnWtzMxk4zfn0GwRydW060RTFnWVmwozG
         FJaG+C5WxZ6y1U3h2Ks5IJpZiB/5VC16ZVkpUtjv8Q8y7qJpNRBeOt6CTwNwKTNtzbbS
         jN/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788842070; x=1789446870;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+CAXnDlq8Fddwa0koCOvX7W+lYybD5g3FsmKlhtE5zY=;
        b=LCueodFBHxuWm8YgZqkZVeK9GTTXJ74dNLcTy+FqwEohIvyLstWJXoBK8RV6ybcwyS
         CzAAvsLr0TXOYAuzeZjmDN3LV5zPd1s+e4vBdeiFRg3bIB4al103xJqsfpwQL1kWcy8H
         wMIN9kUDM3BnPQcXIkco0ckqgfgaIJSGSdSe0AaetQMHe4pSxE9xVIYnpr5JvJV1fIUN
         DnkqK2IY2TbJ5C1nEM+1o6aMWczvd3RT3ob6sMY54G/XLh183/qpVJWbf5lDsZZLNO0B
         wO4LYUPE2GvA1PcByxaHV9JcYIgKdtR6S+nRm/H0nVHrlvkOozpdLVAPeNZwSUKLm2uQ
         T8KA==
X-Gm-Message-State: AFuF++lLLT8tOZJbaOojL/ioy1eG1/1vz4LDJEnOP2M7TIzXjNYjNACZ
	TaKgkmGHD9H1lKKzT3AsLzfKWMtxkBl5m/UgEPCMER6aPSkvrwdEFdYIqf22utkOT1UN9N1uPNI
	dkn1XeA==
X-Received: from jabc19.prod.google.com ([2002:a05:6638:c213:b0:5ec:a601:5070])
 (user=avagin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6820:1623:b0:6b6:2601:63df
 with SMTP id 006d021491bc7-6b6fa3dd918mr15931539eaf.11.1788842070116; Mon, 07
 Sep 2026 21:34:30 -0700 (PDT)
Date: Tue,  8 Sep 2026 04:34:20 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
Message-ID: <20260908043427.1842515-1-avagin@google.com>
Subject: [PATCH v5 0/7] x86/fpu: Restore and reinforce signal frame portability
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

 Documentation/arch/x86/xstate.rst             |  55 ++++
 arch/x86/include/uapi/asm/sigcontext.h        |  14 +
 arch/x86/kernel/fpu/signal.c                  | 137 ++++++----
 arch/x86/kernel/fpu/xstate.c                  |   9 +-
 arch/x86/kernel/fpu/xstate.h                  |   2 +
 tools/testing/selftests/x86/Makefile          |   5 +-
 .../selftests/x86/sigframe_fpu_portability.c  | 246 ++++++++++++++++++
 tools/testing/selftests/x86/xstate.c          |  12 -
 tools/testing/selftests/x86/xstate.h          |  20 ++
 9 files changed, 438 insertions(+), 62 deletions(-)
 create mode 100644 tools/testing/selftests/x86/sigframe_fpu_portability.c

-- 
2.55.0.979.g7e5102b832-goog

