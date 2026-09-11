Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82962435EE9
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 07:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789110263; cv=none; b=nJcJlCmwmd60SBr4O9/vM+pj6Axa7rCZyVUIrT6FtA98/y/+kU8/jNvPoS/FZUpls+4TcliM5g2PgQX36f1H569blj/CumShGoaNfkiH76rfKxT2nDQ7Yh/LI90VcYT//tEnkDsUpoF2c+jVtlsMEZdPv+197KrcYRiDdWOZ62g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789110263; c=relaxed/simple;
	bh=HtI8+o0/+fjDlpe7Tm/t9WqLLNLZ39ujZ4omfLeEziE=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=MxSgeIW8j8Ul7fBikBNtN5dppmYXZjzN5ld5ZDYtqDNN4uegwqLXdozYckNFt0Lrh4LWRngksyMiEDjCc51k81YkUuU9asRzLOdp3UV2T6BYs12G0QtZnS8DmXB4rIBVi+lirRGb21X6+n/NzBmqgg8eS/pKPU6nryFe/Zan9kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--morbo.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GvvowaJw; arc=none smtp.client-ip=209.85.214.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--morbo.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GvvowaJw"
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ccb6823efcso6224375ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 00:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789110252; x=1789715052; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/4/QQllILHCh/Uq+qJbcAk67BIR6jq970rdCq+AoN2E=;
        b=GvvowaJwXfMuhXLzjHIfd0ulVNfv9wX9nGSNaQdPMEng8hfn1+DD5aNgTxbCOwUfM4
         +77R9j87XzB8akdbGEFflncCZCI7uz/Pr92/GMoKSJEOznPzAid4CVVmbLr2eh/RNiaz
         gMjfoJl3jma3t/tEtzuNruCEv/Mu7SVJPtEPcuxjQKhJNLARakC3xvmE8RjE9MXeHIsR
         NDuB4JpcPHnBB07mRtHI3DjtbgH4L1WZt5GAWKUIBEr3IFP50mDqkS8s3raVOrgCWFrL
         OGXcDz97wPk+Dfts2W82WfmmJayl3uxkKreEKsGqbU0H3IVB7xum9S9Rrf7WxocyoBQE
         5xkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789110252; x=1789715052;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/4/QQllILHCh/Uq+qJbcAk67BIR6jq970rdCq+AoN2E=;
        b=O/pmTtUvUXecGF8Bh0C4eY8T0E7kPDG1QmLH4YRVdRTYnGP/KgaOp4EnZjftxLkJ9P
         uzwxAWHLNAmMnMgH7mu02UFO8hbtzFoR4Dv+y82OetzwXL6B6pco0ftLFFAMocWRzPVm
         butfD37FiSSX1tZuujQ/0kUzMbk9Na+Vzbt16qDy0R7d2zJ8UCf6hu9SkXZBg83mBfKW
         840Q5XWvsGrJGM+2G09JCbROB1ferIliS7YSp96OyVyY7ReryFS6o3Sn28REo3+0DZj/
         wV5S/VvuH2c1o21xS1271ZHO/8UJckrThd8+PnypZSKT2n9rvisqIxdkdLO+fVc95Xc+
         ZIjA==
X-Gm-Message-State: AFuF++kGj3eD/pzzQli2mqFr88Tpsu6jA8WMVfxmmW+Rn1AFpJyO4J02
	kpZDZfV+fLf+QOk/pnHcYqEudZ0N9DcPznvbyTsolqopfdwQj2EMLsOLq0hk4tL7nd5KdbbJW9y
	Kh8ZAehkpyhDk7VjbXwnMFCZ0bqzX3OwA2tLZagn/iHYP9MVywr9iJmSdd+bx5F/e24bO2w2BGD
	C0b0exewAJU/CC8gn7c2iEA2k9XLhjzJZ5EsON9g==
X-Received: from ploh9.prod.google.com ([2002:a17:902:f709:b0:2cf:bf3e:41f0])
 (user=morbo job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:324c:b0:2d8:d4d3:3fbc
 with SMTP id d9443c01a7336-2dd2a356466mr59786805ad.16.1789110251229; Fri, 11
 Sep 2026 00:04:11 -0700 (PDT)
Date: Fri, 11 Sep 2026 07:03:38 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.1032.g73a4cd73de-goog
Message-ID: <20260911070346.801948-1-morbo@google.com>
Subject: [PATCH 0/7] kasan: Add KUnit config and fix missing instrumentation
 in load_unaligned_zeropad()
From: Bill Wendling <morbo@google.com>
To: linux-kernel@vger.kernel.org
Cc: Bill Wendling <morbo@google.com>
Content-Type: text/plain; charset="UTF-8"

This series makes the KASAN KUnit test suite easy to run via kunit.py
and fixes a real detection gap it uncovered along the way.

Patch 1 adds mm/kasan/.kunitconfig so the suite can be run with:

    ./tools/testing/kunit/kunit.py run --arch=x86_64 --kunitconfig mm/kasan

Getting CONFIG_KASAN_KUNIT_TEST to actually build required pulling in
CONFIG_SCHED_TRACER (CONFIG_FTRACE alone doesn't select the invisible
TRACEPOINTS symbol it depends on), plus a larger CONFIG_LOG_BUF_SHIFT
to stop KASAN's verbose reports from overflowing the printk buffer
under QEMU.

The migration from read_word_at_a_time() to load_unaligned_zeropad() lost
instrumentation, because the load_unaligned_zeropad() functions are
implemented as inline asm with an exception table entry on every
architecture, so the compiler never sees the memory access and can't
instrument it for KASAN/KCSAN. This meant sized_strscpy() silently
bypassed KASAN when reading its source buffer word-at-a-time, and the
same gap turned out to be open at every other call site in the tree.

Rather than patching each call site individually, patch 2 renames
x86's load_unaligned_zeropad() to arch_load_unaligned_zeropad() and
adds a single common, always-inlined wrapper that instruments the read
before calling through.

Patches 3-7 convert the remaining architectures (arm64, arm, riscv,
s390, powerpc) that implement load_unaligned_zeropad() to the same
pattern, so each can be reviewed independently by its arch maintainer.

Verified via objdump that the wrapper adds no calls or relocations
when KASAN and KCSAN are both disabled.

Bill Wendling (7):
  kasan: Add .kunitconfig for KUnit tests
  x86/word-at-a-time: Instrument load_unaligned_zeropad()
  arm64/word-at-a-time: Instrument load_unaligned_zeropad()
  arm/word-at-a-time: Instrument load_unaligned_zeropad()
  riscv/word-at-a-time: Instrument load_unaligned_zeropad()
  s390/word-at-a-time: Instrument load_unaligned_zeropad()
  powerpc/word-at-a-time: Instrument load_unaligned_zeropad()

 arch/arm/include/asm/word-at-a-time.h         |  4 ++-
 arch/arm64/include/asm/word-at-a-time.h       |  4 ++-
 arch/powerpc/include/asm/word-at-a-time.h     |  4 ++-
 arch/riscv/include/asm/word-at-a-time.h       |  4 ++-
 arch/s390/include/asm/word-at-a-time.h        |  4 ++-
 arch/x86/include/asm/word-at-a-time.h         |  4 ++-
 .../asm-generic/word-at-a-time-instrumented.h | 25 +++++++++++++++++++
 mm/kasan/.kunitconfig                         | 15 +++++++++++
 8 files changed, 58 insertions(+), 6 deletions(-)
 create mode 100644 include/asm-generic/word-at-a-time-instrumented.h
 create mode 100644 mm/kasan/.kunitconfig

-- 
2.47.3

