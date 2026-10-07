Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C0D744E045
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 11:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791373437; cv=none; b=Qmd6VU0zj1/55/xaEQcGwFJAEcH2xJ5A9/s+s4crPT3+27ZpvXuEipxFkWuBaCltapQBQrypJGHw1f+gnVivvS0VZMYJBbckj33Oj1/DDU4BT5kQr7Mwifl9vtSPrmDkxuWpwqPlKZbCdy0nt+HIQgMr5LnHhpKkqz44PiQtyJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791373437; c=relaxed/simple;
	bh=h7fiiHcyiS6S0OXbymL+71ZgyVWlFy32BZDXtbBulJ4=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=ZumNaTFFN98m6rAv3PX4t7ae9epZdqD2ysWxZxSGOMQgorn8kKydcIivQcH7QuntfeIdFtUy+bFhR5+pK0sgwYjkMos3w5r1Hv+ySoH+7pHlR9k/BHYFoZEnOoj6aD3dnXeqnosUopOaB1bF3bvxjqrBTO7ackDCijbC9auSzaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--dylanbhatch.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MHDgLW8z; arc=none smtp.client-ip=209.85.214.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dylanbhatch.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MHDgLW8z"
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e4ade8670dso53489585ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 04:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791373424; x=1791978224; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3BiabrC81I6q/hu88iG0Po7W2aHkc1H1GfO6iXoWDeM=;
        b=MHDgLW8zEacrgf98vPyjYFP7B/0zwj97rMMTrHI19NfNnvF3FmrWFkUrJhLnjZu9kk
         Mo6wiVXxQGBEcxzc4COtOWLvFVw9gGPD7OWkqRyYFT26mLAwWqd7qDCbu5PpxBL9SMPU
         MENnUA7cvMmpvzbYoSvwltGFCb/KBCqWAPGSL7heHvGklGSwRM/hlYa1yj1LusOny5fb
         mFwfVYjRvvo/kRbMRtqU6+rAo1Z8ixZm6AyYhAoELsMS0ZwgNP5JqpkEviI1BYExwH6I
         fEeGxeAJfZcC/68gIi7yQhzyhdQQT0UgH+C9pWZmz8n2AK4KGGeIbcPpzcxGsMdDj4EQ
         XsRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791373424; x=1791978224;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3BiabrC81I6q/hu88iG0Po7W2aHkc1H1GfO6iXoWDeM=;
        b=TqlIE5hh5NKVLtOB8mdXY1bec405kSo9Tbs4JVF8HOk6vZB63yPLx8Vtu/yJKL1cqw
         lqbEgPehaIZz0fXx2mudRcTCm9lEYeKRdQIdeU1gt2h2LsFCowkIfG+OSYiGoWdxb7/6
         fUItYODVjDvAuchvJ9yAyg6qXgJ4J9DisCNDrQ3Wcbgu7Grh7OVDWuCPlNcCjiEYLHFn
         28Gk1RbWyRO/3VVeKjjHJvIneAXwIpPEoIA7IX6H9kmGGVYwcmj9ZZnjuCi37JJ6Dc5J
         qvcHPIadXGLoQGcJyACR/8So+OcPhSIHOMPxsnN74rm/1C6s3noHOMgClCv1yKrtRjrO
         xKxQ==
X-Forwarded-Encrypted: i=1; AKwUvBwll7ZQhYXdAUlW7z0ByfOJ6OW/2OEmHghJh7hlAW424yiNMBIg2X6DdPV2cVmVAROV6VK6ClSUYiQkno0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKKmyujboja4kex8+wuzdoqG4NMnoGH5bAnlsI0ZdO7+eaiiztj
	XQFhWgrS9V3J5Wba4NpGnEWBTGmLEpIZV9w5rN82fjWARO9ZgZCezI1EXPM7vBqFuWdVfgbTDzi
	Dw+iw/AoOZr6SKDgJUXRnYCKPPg==
X-Received: from plnq15.prod.google.com ([2002:a17:902:f78f:b0:2e2:d223:8126])
 (user=dylanbhatch job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:ce07:b0:2dd:c100:9433 with SMTP id d9443c01a7336-2e600548a4bmr18840995ad.49.1791373424109;
 Wed, 07 Oct 2026 04:43:44 -0700 (PDT)
Date: Wed,  7 Oct 2026 11:43:24 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.360.g66cac248cb-goog
Message-ID: <20261007114335.440322-1-dylanbhatch@google.com>
Subject: [PATCH v8 00/11] unwind, arm64: add sframe unwinder for kernel
From: Dylan Hatch <dylanbhatch@google.com>
To: Roman Gushchin <roman.gushchin@linux.dev>, Weinan Liu <wnliu@google.com>, 
	Will Deacon <will@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Indu Bhagat <ibhagatgnu@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Jiri Kosina <jikos@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Jens Remus <jremus@linux.ibm.com>
Cc: Dylan Hatch <dylanbhatch@google.com>, Prasanna Kumar T S M <ptsm@linux.microsoft.com>, 
	Puranjay Mohan <puranjay@kernel.org>, Song Liu <song@kernel.org>, joe.lawrence@redhat.com, 
	linux-toolchains@vger.kernel.org, linux-kernel@vger.kernel.org, 
	live-patching@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Randy Dunlap <rdunlap@infradead.org>, Mostafa Saleh <smostafa@google.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="UTF-8"

Implement a generic kernel sframe-based [1] unwinder. The main goal is
to improve reliable stacktrace on arm64 by unwinding across exception
boundaries.

On x86, the ORC unwinder provides reliable stacktrace through similar
methodology, but arm64 lacks the necessary support from objtool to
create ORC unwind tables.

Currently, there is a sframe unwinder proposed for userspace [2], along
with an RFC for an .eh_frame unwinder [5]. This patch series implements
a similar SFrame lookup library to [2], but with many simplifications to
account for the fact that user access is not necessary. The intent here
is to continue to leave the door open for common usage of definitions
and algorithms between kernel and user unwind in the future, while at
the same time keeping these patches strictly constrained the minimal set
of features necessary for arm64 kernel unwind.

Unlike past versions of this series, these patches apply directly to
v7.3-rc3 rather than depending upon [2]. To make this possible, I've
adopted a number of patches from [2] with significant squashes and
changes made in order to coherently suit the kernel unwind use case.
I've done my best to maintain appropriate authorship on these changes,
and have added 'Co-developed-by' trailers to attribute shared authorship
as accurately as possible. Please let me know if you see any
discrepencies in my work here.

Currently, only GNU Binutils support sframe. This series relies on the
Sframe V3 format, which is supported in binutils 2.46.

This full series is available on github: [4].

Ref:
[1]: https://sourceware.org/binutils/docs/sframe-spec.html
[2]: https://lore.kernel.org/all/20260505121718.3572346-1-jremus@linux.ibm.com/
[3]: https://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-trace.git/log/?h=sframe/core
[4]: https://github.com/dylanbhatch/linux/tree/sframe-v7
[5]: https://lore.kernel.org/all/20260821195259.2688377-1-jremus@linux.ibm.com/

---

Summary of changes since v7:
 - (sashiko): Put .cfi_startproc right after SYM_START to account for
   potential alignment bytes ahead of the actual function symbol.
 - (sashiko) Use __always_inline for IP validation helper.
 - (sashiko) Move .sframe module init and sframe section fields to arch
   generic code.
 - (sashiko) Make sframe_find() noinstr.
 - (sashiko) Add preempt_notrace and instrumentation to
   __sframe_module_find() code path.
 - (sashiko) Block tracing and kprobe on the sframe_find code path.
 - (shashiko) remove KCOV, KCSAN, and KASAN instrumentation from
   sframe.o (copying over ORC's shoulder).

Dylan Hatch (6):
  arm64, unwind: build kernel with sframe V3 info
  module, sframe: Add sframe support for modules
  arm64/sframe: Validate IP addresses
  sframe: Add debug helpers with object name
  arm64, crypto/lib: Annotate leaf functions with CFI info
  unwind: arm64: Use sframe to unwind interrupt frames

Jens Remus (1):
  sframe: Separate reading of FRE from reading of FRE data words

Josh Poimboeuf (3):
  arm64/sframe: Read vmlinux .sframe header
  sframe: Add support for reading vmlinux .sframe contents
  sframe: Add .sframe validation option

Weinan Liu (1):
  arm64: entry: add unwind info for call_on_irq_stack()

 MAINTAINERS                            |   4 +-
 Makefile                               |   8 +
 arch/Kconfig                           |  49 ++
 arch/arm64/Kconfig                     |   1 +
 arch/arm64/Makefile                    |   2 +-
 arch/arm64/crypto/aes-ce-ccm-core.S    |  12 +-
 arch/arm64/crypto/aes-neonbs-core.S    |  16 +-
 arch/arm64/crypto/ghash-ce-core.S      |  12 +-
 arch/arm64/crypto/sm4-ce-ccm-core.S    |  16 +-
 arch/arm64/crypto/sm4-ce-cipher-core.S |   4 +-
 arch/arm64/crypto/sm4-ce-core.S        |  44 +-
 arch/arm64/crypto/sm4-ce-gcm-core.S    |  16 +-
 arch/arm64/crypto/sm4-neon-core.S      |  12 +-
 arch/arm64/include/asm/linkage.h       |  32 ++
 arch/arm64/include/asm/module.h        |   1 +
 arch/arm64/include/asm/module.lds.h    |   2 +
 arch/arm64/include/asm/sections.h      |   1 +
 arch/arm64/include/asm/unwind_sframe.h |  32 ++
 arch/arm64/kernel/entry.S              |  14 +
 arch/arm64/kernel/setup.c              |   2 +
 arch/arm64/kernel/stacktrace.c         | 184 ++++++-
 arch/arm64/kernel/vdso/Makefile        |   2 +-
 arch/arm64/kernel/vmlinux.lds.S        |  14 +
 arch/arm64/lib/clear_page.S            |   4 +-
 arch/arm64/lib/clear_user.S            |   4 +-
 arch/arm64/lib/copy_from_user.S        |   4 +-
 arch/arm64/lib/copy_page.S             |   4 +-
 arch/arm64/lib/copy_to_user.S          |   4 +-
 arch/arm64/lib/memchr.S                |   4 +-
 arch/arm64/lib/memcmp.S                |   4 +-
 arch/arm64/lib/memcpy.S                |   8 +-
 arch/arm64/lib/memset.S                |   8 +-
 arch/arm64/lib/mte.S                   |  28 +-
 arch/arm64/lib/strchr.S                |   4 +-
 arch/arm64/lib/strcmp.S                |   4 +-
 arch/arm64/lib/strlen.S                |   4 +-
 arch/arm64/lib/strncmp.S               |   4 +-
 arch/arm64/lib/strnlen.S               |   4 +-
 arch/arm64/lib/tishift.S               |  12 +-
 include/asm-generic/sections.h         |   4 +
 include/asm-generic/vmlinux.lds.h      |  15 +
 include/linux/module.h                 |   5 +
 include/linux/sframe.h                 |  43 ++
 include/linux/unwind_types.h           |  34 ++
 kernel/module/main.c                   |  21 +
 kernel/unwind/Makefile                 |   5 +-
 kernel/unwind/sframe.c                 | 710 +++++++++++++++++++++++++
 kernel/unwind/sframe.h                 |  79 +++
 kernel/unwind/sframe_debug.h           |  34 ++
 49 files changed, 1401 insertions(+), 133 deletions(-)
 create mode 100644 arch/arm64/include/asm/unwind_sframe.h
 create mode 100644 include/linux/sframe.h
 create mode 100644 include/linux/unwind_types.h
 create mode 100644 kernel/unwind/sframe.c
 create mode 100644 kernel/unwind/sframe.h
 create mode 100644 kernel/unwind/sframe_debug.h

-- 
2.56.0.360.g66cac248cb-goog

