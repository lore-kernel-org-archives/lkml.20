Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B6A720010A
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 22:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789771324; cv=none; b=B36h2GMycRDxT3ZB5mz/PJBMh4RZD/d3hQ8ZpCgqB2V9VN1yMXCSVsG+Tr53KqjcbGL0+7KuuYoMIdhjAo4VvAbrTxGrIKKT2/30GNAmO7VsZxeGAREfpT+Yd5KEKopsS6xNORwL+oZLK4eqYHf5/BCv1KelsGDueupSpF6wnuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789771324; c=relaxed/simple;
	bh=6LVtrMOuuO2127zXFYV2WHm33zThJFCTa/68qA+HNNY=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=QgZYvd5n1DiT0nIJnO+NQT0NBO/C6wyFCYbm1hr3NYsukpAXSgW4OG+sxH5VIjczlnW+WUUMrBwv7yVFn6aYKYuDpj67kKvjbk6E6OAzXADM/1IuVLVTUi9RYEgPVsUsZAWqO4reh35xCk+burAjt5zeFdySIlAq8oW9O/xa4UA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--dylanbhatch.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dT7cW2ne; arc=none smtp.client-ip=209.85.214.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dylanbhatch.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dT7cW2ne"
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ccb687f82eso17527315ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 15:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789771322; x=1790376122; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WYajfqS3KjHTY5xifMFwHc/tZdyyd455ED9TO4wHoQI=;
        b=dT7cW2nerixgm5W1JIeQTtqzhdi76nejzcAdVYtXsqiI5w461dWhe0Cghw0GfPzAOj
         zjTgQPePnF6palpLKJx+2VycSpc1wes0sSYZspV2HbA0BOnLH9pkSYGyOA6t/w6QfNCX
         q0x015pGhHn46+7ii9YtvQAVxZ8356D/uvsbaVoYb6eOnZzxIT+AXC1S19xr597V/kZw
         J7Omw7cooF3VTlLmCHa+xDzmoASwYM1+OLtU0lUSCptWo53ZjS1HIaLjHHB4NFwvRUGg
         ljAYp5wEd7HDJhx60e4QwFJ3pxoDZajTfoSXW14Rza18dKDe7/bU6MjHOx33931A7squ
         sdMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789771322; x=1790376122;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WYajfqS3KjHTY5xifMFwHc/tZdyyd455ED9TO4wHoQI=;
        b=ziu5f3xr5k1w2D8L9QBh1GoMPmbjy/w1HbHryiLtG9B8X9YVSeEJn4WB4Y0oJv42Gv
         mN72P5KJL3p2I5F5W791J84d3tniRQyke+LrVUbarYOs/fiel4N/9vMtfSGbDoDkItZW
         d/hMhbfZzNjzNvdRKqAsoEjUkTFc9/TOFWsphMNlZbvqNX1TqPJAW5rQ2JKYNWUouJEf
         iytGTWw+l7oIOHxhi6HBhdMVUcA77A/p+AST5uk7ZzmE2CHiAR8LmT1qTeU+BtPe5d7F
         ezXlfSCIgCj2FSLklSVAOL5Kf4lkGMaT+r9B74JHlt3LM/yPhozZA/NIR1kMtxgeIUs9
         S9bQ==
X-Forwarded-Encrypted: i=1; AKwUvBx8qXzeGrhF7wm+7qnRu2m/U7HNu3CZio5UWXiRsC76PQs+Kw+p6TYWOL0DeX63+vUe8ZwSZ167sVrdEpk=@vger.kernel.org
X-Gm-Message-State: AFuF++kQcp3UbIKxOMhK1yfLAHqZTBZfnlN0CRRGvo0H4su1via8YB4C
	b2SVxJO8/LuSp95V36rF55zSyNPLMVzwCQ7THjhjOCOL5XBHfk2ZFw2dR42MwJXjjlmEw+vJvM7
	GEwDRZFRmYcTgV6QLdO/5l45gfQ==
X-Received: from plmn11.prod.google.com ([2002:a17:903:188b:b0:2dd:b876:a4c8])
 (user=dylanbhatch job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:ecd2:b0:2db:8406:db91 with SMTP id d9443c01a7336-2ddb1adf368mr77650485ad.10.1789771322382;
 Fri, 18 Sep 2026 15:42:02 -0700 (PDT)
Date: Fri, 18 Sep 2026 22:41:46 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260918224157.1471085-1-dylanbhatch@google.com>
Subject: [PATCH v7 00/11] unwind, arm64: add sframe unwinder for kernel
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

Summary of changes since v6:
 - Drop SFRAME_REG_SP / SFRAME_REG_FP definitions.
 - (sashiko) Add -fasynchronous-unwind-tables so CFI directives are
   emitted by the compiler even when debug options are not set.
 - Discard .eh_frame sections when CONFIG_UNWIND_TABLES is not set.
 - Repurpose kernel/unwind/sframe* exclusively for in-kernel .sframe.
 - Drop user-acces wrapper usages for direct memory access.
 - Simplify struct sframe_section for only in-kernel use case.
 - (sashiko) use get_unaligned() when reading packed .sframe contents.
 - Drop support for flexible FDEs, as this isn't needed for arm64.
 - Simplify sframe IP validation for only in-kernel use case.
 - Simplify debug printing for only in-kernel .sframe sections.
 - (sashiko) fix CONFIG_MODULES=n build.
 - (sashiko) Fix non-leaf CFI annotions in arch/arm64/crypto/.
 - Simplify FP and RA recovery logic.
 - Simplify arch_stack_walk_reliable() code path, dropping unnecessary
   structs and dead code.

Dylan Hatch (6):
  arm64, unwind: build kernel with sframe V3 info
  arm64/module, sframe: Add sframe support for modules
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
 arch/arm64/include/asm/linkage.h       |  29 ++
 arch/arm64/include/asm/module.h        |   6 +
 arch/arm64/include/asm/module.lds.h    |   2 +
 arch/arm64/include/asm/sections.h      |   1 +
 arch/arm64/include/asm/unwind_sframe.h |  32 ++
 arch/arm64/kernel/entry.S              |  14 +
 arch/arm64/kernel/module.c             |   5 +
 arch/arm64/kernel/setup.c              |   2 +
 arch/arm64/kernel/stacktrace.c         | 186 ++++++-
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
 include/linux/sframe.h                 |  41 ++
 include/linux/unwind_types.h           |  34 ++
 kernel/unwind/Makefile                 |   3 +-
 kernel/unwind/sframe.c                 | 692 +++++++++++++++++++++++++
 kernel/unwind/sframe.h                 |  79 +++
 kernel/unwind/sframe_debug.h           |  34 ++
 48 files changed, 1361 insertions(+), 134 deletions(-)
 create mode 100644 arch/arm64/include/asm/unwind_sframe.h
 create mode 100644 include/linux/sframe.h
 create mode 100644 include/linux/unwind_types.h
 create mode 100644 kernel/unwind/sframe.c
 create mode 100644 kernel/unwind/sframe.h
 create mode 100644 kernel/unwind/sframe_debug.h

-- 
2.55.0.1082.g2b9226bbc0-goog

