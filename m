Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=168.119.38.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792570497;
	b=dNTp2XwNgK7wUGcHwPK35wbdwaSPZBGwmA7FQtb1QVl4V0MxcwYHBKeU5pLTssHWXhRm
	 luJMp1Ilg9KjmZkzCUheSQf3n/2ZRO57VE+uC22bQ+jVjrmy/Vu8fHeAajbUYJCCyspQP
	 YQED1X8sgdarW5Xx/WIf2Z9L+Ph8SsrN5Ua4lsFcas1TRxxxFlr9UTUF1H3RCD1N/wNK5
	 HmQ/5220EetgLKdyf0f4bUGkXwSQ2SiknwfKWyZIOEcyvkwX9yKkm5Be5m95muPBp1Xca
	 5qlDB716wBDpJnrEhcx7NDTa5eY2/mBfsDE8AQBDZmvyC70rAO+BXWhb1GCgnz8LruA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792570497;
	h=DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=TKa2RUGDTuW7MaQZY0caVZamvGGq5PFEOZyolx/azi4=;
	b=AMwpdZlwdm+ge3m2wPq6GqC9H+FCq9ebRRTstTmdqPPtSKx7lU9UXyxsLBeDiZPqdzeF
	 cwL1CBPGAExHewPPkDStsX1Ta6YioVhQS2cA9fBA4AWpH1eFHISN3jLvhCLmh2PE/5QtQ
	 w4g+0OL6P6BsH4/8TOYWDlRloyGECkH3nyTfTEtH5IbdzT2KQAv9vv1z2NI/G9NyMGuGy
	 pORpTS7osBIkxJ7kFN0TtVClBu3WlqtmgiNsllJnohy2J62xk+OGpG66qqUm51ozIAph3
	 2g4S+iHMgy5Je2X7EkuhyW+JaxM5h/zx/kUBuZ4qjEuohnYKmdGO+9IkyADouW5Gn3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=permerror header.from=sipsolutions.net;
	spf=pass smtp.mailfrom=sipsolutions.net;
	dkim=pass header.d=sipsolutions.net header.i=@sipsolutions.net header.a=rsa-sha256 header.s=mail header.b=XIpcQvnM;
	arc=none smtp.remote-ip=168.119.38.16
Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F10DC606A31B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=permerror header.from=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sipsolutions.net header.i=@sipsolutions.net header.a=rsa-sha256 header.s=mail header.b=XIpcQvnM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Content-Type:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-To:Resent-Cc:
	Resent-Message-ID:In-Reply-To:References;
	bh=TKa2RUGDTuW7MaQZY0caVZamvGGq5PFEOZyolx/azi4=; t=1792570495; x=1793780095; 
	b=XIpcQvnMrDp+b0qqefZuqhcPT81MKQmvpZGoAx84YzVm8gkuh2qwjxmCUmrnSENR1SDqqBVFYRe
	GI6HluNv67GXkp68aQTu/Pt1kxXH1ECUwcMWYr1q92NnZ6zQmmPmhYxZZ02HksEvZ9FODFnRHJWb5
	iW6cCYQULpQraGCGq7DYhRpTd4W7mt731WBe4dVoMrNf7W0ZnVqSf80F6lS9mgKimpxMlBlHanYOs
	hoV/uwJk5ebn2D4y4gLIuVLkZLSMbpb+BAH8AcOlv+vdoQdNNm+nE1n/WyLs2JU5QADuTA3pl+taE
	NPQHx8LOF9FajPx51cGKPHokS9B5nfnh7MNQ==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__ECDSA_SECP256R1_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1xJRTB-00000001uEY-1hd4;
	Wed, 21 Oct 2026 10:14:46 +0200
From: Johannes Berg <johannes@sipsolutions.net>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org,
	linux-um@lists.infradead.org,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>
Subject: [GIT PULL] uml-for-7.4
Date: Wed, 21 Oct 2026 10:13:21 +0200
Message-ID: <20261021081440.697408-3-johannes@sipsolutions.net>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Linus,

The last couple of cycles were a lull for UML, in part
because not _that_ much happened, and in part because
we were all busy with "more important" things (*ahem*).
We're back ;-) Still no huge changes, but we're adding
the long-awaited NOMMU support this round.

Please pull and let us know if there's any problem.

Thanks,
johannes



The following changes since commit 93f51579e7df248780214094418f205253383cc5:

  Linux 7.3-rc4 (2026-09-20 13:48:15 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/uml/linux.git tags/uml-for-7.4

for you to fetch changes up to 4ad423aa2108485f8bc5dde51fdf9c1ed979ee4b:

  um: place large BSS inputs in an output section (2026-10-12 17:03:17 +0200)

----------------------------------------------------------------
ARCH=um updates:

 - NOMMU support, mostly for mm/ testing

   The only bigger change, we added support for building with
   !CONFIG_MMU, mostly for testing, e.g. via kunit. Some new
   selftests targetted to NOMMU are moving elsewhere, but are
   runnable on ARCH=um without MMU.

 - Tighter page permissions

   Tighten page permissions to catch more bugs (ARCH=um is,
   after all, often used for testing), and also mark __init
   memory inaccessible for the same reason.

 - Various maintenance/cleanups

   Fix build on really old hosts, fix leaks, make the code a
   bit more robust, header cleanups, typo fixes, the usual.

----------------------------------------------------------------
Andy Shevchenko (1):
      um: vector: Use %pM format specifier for MAC addresses

Benjamin Berg (1):
      um: virtio-pci: free the IRQ message buffers

Ethan Nelson-Moore (1):
      x86/um: remove unused <asm/required-features.h> header

Florian Fainelli (1):
      um: Add definition of __NR_close_range for older host OSs

Hajime Tazaki (7):
      x86/um: nommu: elf loader for fdpic
      um: decouple MMU specific code from the common part
      um: nommu: memory handling
      x86/um/vdso: nommu: vdso memory update
      um: allow deselecting CONFIG_MMU
      um: require MMU for UML PCI support
      um: place large BSS inputs in an output section

Hemanth Selam (1):
      um: fix typo "hander" in comment

Henry Barreto (1):
      um: vector: avoid NULL queue dereference in legacy RX mode

Johan Hovold (1):
      um: virtio_uml: switch to dynamic root device

Johannes Berg (14):
      um: fix futex implementation
      um: further decouple MMU related code
      um: nommu: add SMP futex operations
      um: nommu: add userspace runner processes
      Documentation: um: document nommu UML
      um: add perf-event support
      um: link .lbss/.ldata/.lrodata correctly
      um: make stub compilation more robust
      um: improve checking for --no-warn-rwx-segments
      um: move init text between __init_begin/end
      um: mprotect() __init memory
      um: use %pB to print functions in stack traces
      um: time-travel: fix sched_yield() behaviour
      um: fix shutdown __inittext access

Maninder Singh (1):
      um: take reference of stack before using it in get_wchan

Michael Bommarito (2):
      um: virtio_uml: fix heap overflow in vhost_user_get_config()
      um: ubd: validate COW header fields before use

Pengpeng Hou (3):
      um: account for the separator in add_arg() bounds checking
      um: mconsole: use bounded version string formatting
      um: vector: reject too many interface arguments

Sasha Levin (1):
      um: Consolidate MAGIC_SYSRQ into generic Kconfig definition

Shengzhuo Wei (1):
      um: mconsole: Fix out-of-bounds read in mconsole_log()

Tiwei Bie (2):
      um: vector: Remove unnecessary NULL check in destroy_queue()
      um: Tighten exec permissions on page mappings

 Documentation/virt/index.rst            |   1 +
 Documentation/virt/uml/nommu-uml.rst    |  54 ++++++++
 arch/um/Kconfig                         |  40 +++---
 arch/um/Makefile                        |   7 +-
 arch/um/drivers/Kconfig                 |   3 +
 arch/um/drivers/cow_user.c              |  34 ++++-
 arch/um/drivers/mconsole_kern.c         |  14 +-
 arch/um/drivers/vector_kern.c           |  37 +++--
 arch/um/drivers/vector_user.c           |   3 +
 arch/um/drivers/virtio_pcidev.c         |  19 ++-
 arch/um/drivers/virtio_uml.c            |  26 ++--
 arch/um/include/asm/common.lds.S        |   2 +
 arch/um/include/asm/futex.h             |  53 +++++++
 arch/um/include/asm/mmu.h               |   8 ++
 arch/um/include/asm/mmu_context.h       |   2 +
 arch/um/include/asm/perf_event.h        |   7 +
 arch/um/include/asm/pgtable.h           |  25 ++--
 arch/um/include/asm/ptrace-generic.h    |   6 +
 arch/um/include/asm/tlbflush.h          |  20 +++
 arch/um/include/asm/uaccess.h           |   6 +-
 arch/um/include/shared/as-layout.h      |   3 +-
 arch/um/include/shared/kern_util.h      |   3 +-
 arch/um/include/shared/longjmp.h        |   3 +-
 arch/um/include/shared/os.h             |   6 +-
 arch/um/include/shared/skas/stub-data.h |   9 ++
 arch/um/kernel/Makefile                 |   6 +-
 arch/um/kernel/dyn.lds.S                |   9 +-
 arch/um/kernel/mem-pgtable.c            |  55 ++++++++
 arch/um/kernel/mem.c                    |  47 ++-----
 arch/um/kernel/physmem.c                |   7 +
 arch/um/kernel/process.c                |  23 +++-
 arch/um/kernel/skas/Makefile            |  16 ++-
 arch/um/kernel/skas/mmu.c               |  25 ++++
 arch/um/kernel/skas/nommu.c             |  91 ++++++++++++
 arch/um/kernel/skas/process.c           |  32 +----
 arch/um/kernel/skas/syscall.c           |   5 +-
 arch/um/kernel/skas/uaccess.c           | 134 +++++++-----------
 arch/um/kernel/smp.c                    |   3 +-
 arch/um/kernel/sysrq.c                  |   2 +-
 arch/um/kernel/time.c                   |   3 +-
 arch/um/kernel/tlb.c                    |   7 -
 arch/um/kernel/trap-mmu.c               | 237 ++++++++++++++++++++++++++++++++
 arch/um/kernel/trap-nommu.c             |  13 ++
 arch/um/kernel/trap.c                   | 219 -----------------------------
 arch/um/kernel/um_arch.c                |  11 +-
 arch/um/kernel/uml.lds.S                |  11 +-
 arch/um/os-Linux/main.c                 |  17 ++-
 arch/um/os-Linux/signal.c               |   2 +-
 arch/um/os-Linux/skas/process.c         |  11 +-
 arch/x86/um/Makefile                    |   3 +
 arch/x86/um/asm/elf.h                   |   8 +-
 arch/x86/um/asm/required-features.h     |   9 --
 arch/x86/um/vdso/vma.c                  |  13 +-
 fs/Kconfig.binfmt                       |   2 +-
 lib/Kconfig.debug                       |  10 +-
 lib/kunit/Kconfig                       |   2 +-
 56 files changed, 907 insertions(+), 517 deletions(-)
 create mode 100644 Documentation/virt/uml/nommu-uml.rst
 create mode 100644 arch/um/include/asm/perf_event.h
 create mode 100644 arch/um/kernel/mem-pgtable.c
 create mode 100644 arch/um/kernel/skas/nommu.c
 create mode 100644 arch/um/kernel/trap-mmu.c
 create mode 100644 arch/um/kernel/trap-nommu.c
 delete mode 100644 arch/x86/um/asm/required-features.h
