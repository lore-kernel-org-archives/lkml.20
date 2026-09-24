Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8FC24CCDE9
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 21:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790283690; cv=none; b=trqFgSVLJLIz6tBZ01uBaxr9/or7pPFL+kBc/6pVTXePi6c/5BeIbT9lMJX36cKLuVeOnBF1EvSYK2J8Yml2DdVmHf0p71irtUg61xGQ6g/a0TH47wDapsJveHnEOXpk+20xJuVuJVeYEvS9ijUay5vSbNAqToRtNilDpGKFt9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790283690; c=relaxed/simple;
	bh=+akfvf/2L6+wROOVIeYyALD35Eq+t0R3V1wVbYA7uAQ=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=R/DRtVj2neQfZtXlxqAKJNRUsdGF2rOfxq/TJGAQjThS3GvP0j4a8+KF0GH7ptSBZA/HecaDr/osazglZU8vkfJW6J7R7NXZB0R+ehY6u5CUlWuxxEGDqCxav5+2MCSwHRZns9n+6mLkTO+3y77Q2uF1quyl2nGuiRuSLfYqyfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--avagin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aDXNYZkH; arc=none smtp.client-ip=209.85.167.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--avagin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aDXNYZkH"
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4db3db8687fso349959b6e.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 14:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790283684; x=1790888484; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gm00+Wasm053LlmEKI95Bv/4aOHMNCH9NV7fJ5dy5wc=;
        b=aDXNYZkHfqgILLAi7JQ9l/vmCAZ+85hS8t6Ewaq84EBX2Tq+Sq/85onR6wQuWr7rL8
         hZuQKvPVkrnb4iqhdnhSFLHIvsPpiF8awggl7CQiko1RANv9gRStlFG5ltCkZfUhVDB4
         MU9+sj9EUdUvdOJhyDc60dGfTO1QyVLPzx/NFOfcw54DaSuCL7WKHFLl+V1fl8d78zMy
         zpTK2wTWimMWrbAx2wVSfBatmrwdVC6m5pDO3G+WrA0YRfg2BQsEoO+8uhpMTGjUsCX6
         E8ls08SiqTd6t2pRX93eVE1sP2KAaPOA7D9G+FqPOStX+bHTHoaBoNT5tqVFwt6gL36k
         o+ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790283684; x=1790888484;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gm00+Wasm053LlmEKI95Bv/4aOHMNCH9NV7fJ5dy5wc=;
        b=TrG/OyLB4p3XsXz1kjAtRVvK69WuZQSLc4Wky4178C8MxDAlXIuXRu8Dy0FZq7D5K+
         a3XzFDuXrZqirytDJ1yFcuVzjwTYm6bjGbvVRyrLXrcK1oVcW2L5VyHlbiLfbnuPLBy+
         7u8pAthobziyzvcVd4lb9tWi6BZIfdzW1Gpb4zy8ZTwyL3YTuHcYLt49DkJsv7NYRDQH
         m3Dlgc6/bqbHvOt6pjJDgTnV74H/sx5ESngS33LY93E6TOB+IdkfJ4uyH8hgW243kYMA
         1YbZ0koWqBv/cQfr1A1fSa34J7zDBHnNiymVUpBsVg7WB38LB2g4TxUZ7yVMpggfwMnR
         i/lQ==
X-Gm-Message-State: AFuF++lzpd1Ar9//J2+Bv591Gb4FCOblVBOkQiHN4E/EP+WMEZ9nEIC1
	eEIXlvqQ8htvG4MZ9fcjxOuLe5M1xm32PtyUKNSgPZOLw8NBHWwqBbChKyuhnXr65YT3uUCf2kl
	lA3yuvA==
X-Received: from iofh3.prod.google.com ([2002:a05:6602:6fc3:b0:9c4:a4f8:640])
 (user=avagin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6808:1a06:b0:4b9:a829:f010
 with SMTP id 5614622812f47-4d72cb3e29fmr3569902b6e.28.1790283684138; Thu, 24
 Sep 2026 14:01:24 -0700 (PDT)
Date: Thu, 24 Sep 2026 21:01:14 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260924210121.87032-1-avagin@google.com>
Subject: [PATCH v8 0/7] x86/fpu: Restore and reinforce signal frame portability
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

-- 
2.55.0.979.g7e5102b832-goog

