Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792693503;
	b=vrx0lfRWb7gWLLWQXcgvlc657NNiUVTSQMy6FOsaKsNP2tuCG+qJQ9rXNNSZVQ+iLrpK
	 vicarf8fGqcbHJyNCIDD7Hh+igyyLEXkQ+TMNiRjeTAt/zHO1meZ0ZXbJl1PQ69QsQyqU
	 T1I19hKd7xfcxIm9dyM3oNBfnDcnT0EJwf2jU7BY69SAEuOash6Bz2efEuSXSdaZXIps2
	 4DLUWbpRvPGjFiZRMKeyaB0URwpNIBn670GMX/aNFLS2v3B3DtTdrXyFXaBBBCwcdYeBs
	 kcwvR6V+6fgM/4beIXZWRlFWVHBCSUx8TisyqMpfMkoN+9555tvnhNy8PY6gqJiTyMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792693503;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=TOEurmjBdiJEDDJ0BQm8EPCI+p2EHKV86+xomRRxgXs=;
	b=a/S4ZsNsReKe05yutAZaVQ01vygVhqgGrdTYnNO6KaO74N9Z+NBM0wLGlPcbkYBXXfB1
	 46jSw1wMqC3Q0uKilCdeMOIbuaZHmUMYdxrO10gd0rVBs5Ix8bxFtZtEJOr7ETl6XqdBD
	 W0M43eE0beaUCKtFs7pOCapcPhtRQwHES1Ran3H/GxHpcvIzs9cB2t3INHeMCBtSYEXyn
	 5NCpVHY9NWgCOOkNQvlKoAQiPiaqULRlwyMIJBhEpwvrR0xYWlPPOHKzeVzH5mJQCue/e
	 N+7tMojBYwxWVUm2N5lFvzHRc0JQFKiWkgm4lk9KAktpHQW53PRWQyU7JTPWftPUhDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WmYbpzww;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8382606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 18:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WmYbpzww
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D6F61F01829;
	Thu, 22 Oct 2026 18:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792693502;
	bh=TOEurmjBdiJEDDJ0BQm8EPCI+p2EHKV86+xomRRxgXs=;
	h=Date:From:To:Cc:Subject;
	b=WmYbpzww8EuHSIDP3yrkmvb8KaDKZOazE/Yb9HQrfwvJnLPEAOHo0z+61YoATy+T9
	 zxPW00v3iYxAf/gBo73Pz+2mq/5msTWwLCdXRVcpTB5MRKyKmdmbrwqJE/R50c1NC5
	 T4GImFeUxyDEONsQIjPVrrj/EfDm67BOIvTh9L7S2/JqoNKkvvYU/NHGl2gjsDjn8S
	 eqxBWmzRSLPuNDT40CFmHoPCQvd4G0LxxuPTizL9E4+XVIza9vVt7vswnthgbp+xk7
	 IhA1uHcZmA5C8GSBQwwyKKQZQH2lkPhbnxSv7cY8Uvb5K12eKGEhXMBfYGmbM5QavE
	 Vzsxo45vg+y7w==
Date: Thu, 22 Oct 2026 11:25:02 -0700
From: Kees Cook <kees@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>,
	Alex Hung <alex.hung@amd.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Arnd Bergmann <arnd@arndb.de>, Bill Wendling <morbo@google.com>,
	Christoph Hellwig <hch@infradead.org>,
	Dave Jiang <dave.jiang@intel.com>, Dennis Chen <dechen@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Johannes Berg <johannes@sipsolutions.net>,
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>,
	Kees Cook <kees+treewide@kernel.org>,
	Kusaram Devineni <kusaram@devineni.in>, Leo Yan <leo.yan@arm.com>,
	Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>,
	Mariia Nikitash <nikitash.mariiaw@gmail.com>,
	Mike Leach <mike.leach@arm.com>, Mike Rapoport <rppt@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Oleg Nesterov <oleg@redhat.com>,
	Randy Dunlap <rdunlap@infradead.org>, stable@kernel.org,
	syzbot+0a4c46806941297fecb9@syzkaller.appspotmail.com,
	Vlastimil Babka <vbabka@kernel.org>, Zi Yan <ziy@nvidia.com>
Subject: [GIT PULL] hardening updates for v7.4-rc1
Message-ID: <202610221123.F2DE370AB5@keescook>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

Please pull these hardening updates for v7.4-rc1. There are 2 topics
that stand out: the kmalloc_obj*-style API for devm_kmalloc() (for which
I'll be sending a separate tree-wide patch near the end of -rc1), and the
seq_buf API clean-ups and improvements (which is expected to have a small
follow-up fix coming). The things scattered around the tree outside of
normal areas are mainly clean-ups and fixes related to both those topics.

Thanks!

-Kees

The following changes since commit df2908090cda368b01ff43709f51890076c56157:

  Linux 7.3-rc2 (2026-09-06 15:07:20 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git tags/hardening-v7.4-rc1

for you to fetch changes up to 2f70a9b7e9c74b92a85a2584090f0f5c4cbaa4be:

  overflow: Match arithmetic in both parts of __builtin_choose_expr (2026-10-14 18:05:52 -0700)

----------------------------------------------------------------
hardening updates for v7.4-rc1

- Provide kmalloc_obj*-style API for devm_kmalloc()

- Improve seq_buf API for saner C String handling with several bug
  fixes along the way (Kees Cook, Bill Wendling)

- Overflow helper readability improvements (Bill Wendling)

- Unexport native_write_cr4() (Dennis Chen)

- um: fix CONFIG_GCOV for built-in code (Johannes Berg)

- Improve stackinit test coverage (Justin Stitt)

- KMSAN: fix memset() when using fortify-source, again (Arnd Bergmann)

- lkdtm: use kmalloc() instead of __get_free_page (Mahad Ibrahim)

- signalfd: don't dequeue the forced fatal signals (Oleg Nesterov)

- Fix randstruct to recognize new container_of() behavior

- coccinelle: kmalloc_obj: Convert multi-byte integral allocations too

- Fix a couple remaining allocation return type mismatches

----------------------------------------------------------------
Arnd Bergmann (1):
      KMSAN: fix memset() when using fortify-source, again

Bill Wendling (2):
      seq_buf: Add seq_buf_init_append()
      overflow: Match arithmetic in both parts of __builtin_choose_expr

Dennis Chen (1):
      lkdtm: Make UNSET_SMEP built-in-only and unexport native_write_cr4()

Johannes Berg (1):
      um: fix CONFIG_GCOV for built-in code

Justin Stitt (2):
      MAINTAINERS: Add stackinit KUnit test to HARDENING
      kunit/stackinit: Cover declarations bypassed by goto and switch

Kees Cook (20):
      randstruct: fix container_of() false positives after __mptr removal
      randstruct: report bad casts as warnings rather than notes
      coccinelle: kmalloc_obj: Convert multi-byte integral allocations
      kunit/stackinit: Clean up XFAIL under instrumentation
      mm: Move default_gfp() into gfp_types.h
      devres: Provide kmalloc_obj*-style API for devm_kmalloc
      .get_maintainer.ignore: Add Kees Cook
      seq_buf: Do not print an empty line from an overflowed seq_buf_do_printk()
      seq_buf: Do not pop from an overflowed seq_buf
      scsi: lpfc: Print rx monitor records straight into the seq_buf
      seq_buf: Copy what fits when seq_buf_puts() and seq_buf_putmem() overflow
      seq_buf: Clear what a writer did not claim when a seq_buf overflows
      seq_buf: Add seq_buf_strlen()
      seq_buf: Add seq_buf_terminate()
      bpf: Remove dead newline stripping from format_disasm_line()
      powerpc/papr_scm: Return the string length from the sysfs show functions
      nvdimm: ndtest: Return the string length from flags_show()
      docs: core-api: Document the seq_buf API
      coresight: cti: Add const to con_groups allocation type
      extcon: realtek: Remove const from type_c_cfg allocation type

Mahad Ibrahim (1):
      lkdtm: use kmalloc() instead of __get_free_page

Oleg Nesterov (1):
      signalfd: don't dequeue the forced fatal signals

 scripts/coccinelle/api/kmalloc_objs.cocci         | 161 +++++--
 scripts/gcc-plugins/randomize_layout_plugin.c     |  63 ++-
 Documentation/core-api/kernel-api.rst             |   9 +
 include/linux/device/devres.h                     | 102 ++++
 include/linux/fortify-string.h                    |   2 -
 include/linux/gfp.h                               |   4 -
 include/linux/gfp_types.h                         |   4 +
 include/linux/overflow.h                          |   2 +-
 include/linux/seq_buf.h                           | 141 +++++-
 include/linux/trace_seq.h                         |   5 +-
 arch/um/include/asm/common.lds.S                  |   1 +
 drivers/misc/lkdtm/core.c                         |  16 +-
 arch/powerpc/platforms/pseries/papr_scm.c         |   6 +-
 arch/x86/kernel/cpu/common.c                      |   3 -
 drivers/extcon/extcon-rtk-type-c.c                |   3 +-
 drivers/hwtracing/coresight/coresight-cti-sysfs.c |   2 +-
 drivers/misc/lkdtm/bugs.c                         |   4 +-
 drivers/scsi/lpfc/lpfc_sli.c                      |  45 +-
 fs/signalfd.c                                     |  28 +-
 kernel/bpf/diagnostics.c                          |   8 +-
 kernel/trace/trace_events.c                       |   4 +-
 kernel/trace/trace_events_hist.c                  |   6 +-
 lib/seq_buf.c                                     |  37 +-
 lib/tests/seq_buf_kunit.c                         | 537 +++++++++++++++++++++-
 lib/tests/stackinit_kunit.c                       |  93 ++--
 tools/testing/nvdimm/test/ndtest.c                |   2 +-
 .get_maintainer.ignore                            |   1 +
 MAINTAINERS                                       |   1 +
 28 files changed, 1145 insertions(+), 145 deletions(-)

-- 
Kees Cook
