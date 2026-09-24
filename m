Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3039D35AC03
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 04:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790223368; cv=none; b=EUlcvOaN1VeTCDWhf6+m/QY9aZ+oUyiBbcAc5/6fA9vUSwOH8tuEo2kFkZGYcSYY5/AW808iUk/NWEcKCz+FceUqIetK+sSzOeYeU9aKn82uivK8qIoNft0L8g/40vSNIHZXMo/vLop5vaHtpG6+NErhfOonIr407ceMaICDQ+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790223368; c=relaxed/simple;
	bh=Jstn2qkqU/cXPmRy8XxusYCguCeS+4oJj7235peus7w=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=RU0TipvsYj8cIF6c/tqZPrXDoJWexDVZS1+6vH2OcrsQjJvtsH9j9vAzwIdXkPOtoXMF0jdp+aJ7f1KnpG5n87xqdsrz5UB5QfL+1xHRbPhw+9VAQePtfTQPQs1ZunbEcGUb1PPrqsPXhBH7u+xAsC4v2AkCkelg0vf7JHSUXI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--avagin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Y9bwGMzd; arc=none smtp.client-ip=209.85.167.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--avagin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Y9bwGMzd"
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4ab260600easo779022b6e.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 21:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790223366; x=1790828166; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XE0X76KVAyhlE7IXAL923162WcwaFzxBV/z7cBhuTnk=;
        b=Y9bwGMzdt/p1ccFPypjA/NMnrjzjNME/FgrZ3xR1lpzCZwaTr0h4RFJyetLswsChmi
         94sXGNEdocg71H61tCFH8SkCqYAJk+nOna2b3M1DcfgV/tWAHUY5oxdxjCtzXAxYzYdj
         Fq1frhG/7eIs32io/1JSgDQZfKnesmXU0SdOBG9GOCxHZ9ddmV6CXp9IaykzJv2xkFjg
         MnmZvjGLFpBIVT/u+NFXM+YpkPFLaOQ3FNRfe3wJWVfnHYv9jbP2Puxe71IROJWduzq7
         rciDsc2IlVcmVZaRDW5Zcvu93SRjLo+PPJvfVy8Bx+CrKPREu0Grtmyg5w16Jnxm5gq8
         6g4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790223366; x=1790828166;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XE0X76KVAyhlE7IXAL923162WcwaFzxBV/z7cBhuTnk=;
        b=RsGhZP7PZtL/ocL0HOkj972nCZ2ZPjpPjoXxgV2+3cu+1XlIQWGnDIpHlbJHP7g5dB
         3rN7YrGdDchPAldko/DohGgz/ZV4sOLdOwQOeieXdF1eDYsS4cP+UbBnM+7g5fJii8nD
         dxLtsiRsBJ+t+WCNPpRr/7MnsaxBno0ybTNkju64EvcA3ufyl5st6IPNUNSeXQdmSaEZ
         kvNXsBR1CUlACbWwokoOLfW5r0/GcqJG7J3SAZLNA6+MaQ8mp+urvFk94yuJ5dfkzzYZ
         VtGnEVPj+VuaEoIRmI/3+PI/altjWf+Dtwj6On2fRqtbCg/0bfluPdOSj6TM3fgkJdyA
         ppfg==
X-Gm-Message-State: AFuF++nqIEH7RoSOXqpPY4Y1Xc8XdrPVVbWAuWwtwVCGAO9QnJfK85sI
	Xz1k4YrfmYVfAanp9OpA69qSUZQItiMEe0/IfPbUBJQ1hgfWJ3RUD2gkJGXdVFftWpXbOdSYppI
	AVdBTQw==
X-Received: from japj16.prod.google.com ([2002:a02:cb10:0:b0:5f3:5cd2:f833])
 (user=avagin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6808:e82:b0:4c5:38f1:80cf
 with SMTP id 5614622812f47-4d72b842ba9mr1111729b6e.21.1790223365849; Wed, 23
 Sep 2026 21:16:05 -0700 (PDT)
Date: Thu, 24 Sep 2026 04:15:56 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.rc1.310.g51773c2048-goog
Message-ID: <20260924041604.3209659-1-avagin@google.com>
Subject: [PATCH v7 0/7] x86/fpu: Restore and reinforce signal frame portability
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
 .../selftests/x86/sigframe_fpu_portability.c       | 246 +++++++++++++++++++++
 tools/testing/selftests/x86/xstate.c               |  12 -
 tools/testing/selftests/x86/xstate.h               |  20 ++
 9 files changed, 428 insertions(+), 60 deletions(-)
 create mode 100644 tools/testing/selftests/x86/sigframe_fpu_portability.c

-- 
2.55.0.979.g7e5102b832-goog

