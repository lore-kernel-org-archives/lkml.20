Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.79.88.28
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792508474;
	b=3ydafxPqE2MprnsJkNIVjZLj+zkQZ8ZnMoA3p5EkTxKomQoEqoRH6NPJe+Ejx2tLiarL
	 t1PBQ2uKZwOMQHvqvzgIVAKqQyk+O3N1ruVAnojQOr0tmFUD9B8QeemUbVq7fDyYBCioJ
	 aSPyt4psG7v7W6syTXGUuZkXOSYzVa+gd9OJSeLv23ZecBgQw1PsgSk7cvqTtwzQifpZH
	 rbiK24KRfK8dmtLnUMhMnVjk+QrDvlxvLfIMNcT1sdwH7CXE1Yq+XvSzHHLwySc5Gsdph
	 NKMf/VgVQRQUFuKTjndlsrHP4EG3tKaOZIyW5Y4N+NIv0BmqtEyRkWa6vWQqnod3Ezg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792508474;
	h=DMARC-Filter:DKIM-Filter:DKIM-Signature:Received:From:To:Cc:Subject:
	 Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=7Oo16UKGAT6AcwHzziMPVGwrouiyroRzHjCEz8Au1dY=;
	b=wc6fvMcENR8DHV25UhrJWw+iHsGxL/ScpT7wGa1MltURWBKHcdhzVrmPMmnO5siVRFXI
	 mBlV6nrFRDXz7/YgaVg0R3xA3MfIgESvcqYgS8PkR7HI5HHmk0oGnIATKGtrZc5VSk+OH
	 TU3mTXWZ89s7StFfLG3oHvdZVh6piZSozKyWAsnmWTwuRPie6Ee2LlOaX+KT0M2JC16fn
	 ZwwOX4CK7rwC02qMWyXpNxZQVOGl8WrlSGcR9c9D0Ri93RXOdMliVocSxRpkHssB4Uldk
	 gET745u/Vf4sKr/BPTbOmcdFnmt9qpC5+qrGriLFTbwp4LwlPOhh24Q0x2svkRzJEEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lwn.net;
	spf=pass smtp.mailfrom=lwn.net;
	dkim=pass header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=OrtnM5wM;
	arc=none smtp.remote-ip=45.79.88.28
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F09B606A31E;
	Tue, 20 Oct 2026 15:01:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F09B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=OrtnM5wM
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 53B6340904
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1792508466; bh=7Oo16UKGAT6AcwHzziMPVGwrouiyroRzHjCEz8Au1dY=;
	h=From:To:Cc:Subject:Date:From;
	b=OrtnM5wMaCXk5PAEnL12o9Q3VetjLHp4UdVBg7BdudE4V5K7M/io7Q+V3OZ98mm1m
	 eyYPIB7KEdVnlXyLRolrFz9U4m+Iw58qlCbUIq7cujxs4OTr8ve+LSjg94Xj7iH/te
	 1dorDTNQVGDwXcd3NW6P7Bob6UW9yTDgqnTzZhVcXfaHTb0p9mU5mXtRik3QFnshhD
	 2D7Zx6McnZMtIys+Y35mTsy8KlPU5VkGaabDihvpZ/KcqWMsJGkBeESp4W/1K7v8Hj
	 kspOTsBMzmJic4aSox94UiPQyOE63afrBVL2tGc1STWF9whioVvUL7w8AD+Nk72vG4
	 B1jTf57/bxnlg==
Received: from localhost (unknown [IPv6:2601:280:4600:814::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 53B6340904;
	Tue, 20 Oct 2026 15:01:06 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Linus Torvalds <torvalds@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: [GIT PULL] Documentation for 7.4
Date: Tue, 20 Oct 2026 09:01:05 -0600
Message-ID: <87qzhk76xa.fsf@trenco.lwn.net>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/docs/linux.git tags/docs-7.4

for you to fetch changes up to 90d9f76ccb72ec024ef476b4229f3dd1957d7b26:

  docs: add AGENTS.md as a symlink to README (2026-10-14 11:45:46 -0600)

----------------------------------------------------------------
It was a reasonably busy cycle for docs; changes include:

- Add the AGENTS.md symbolic link into the top-level directory in the hopes
  that LLMs will read it and produce better work.

- The removal of the Assisted-by requirement, as concluded at the
  Maintainer Summit.

- A new "testdocs" make target to run the documentation unit tests.

- Lots of work on the Portuguese, and Chinese translations; there is now
  maintenance for the traditional Chinese translations as well.

...and the usual pile of minor fixes, documentation updates, etc.

Expect a trivial conflict with the tip tree; otherwise should be clean.

----------------------------------------------------------------
Akiyoshi Kurita (1):
      docs/ja_JP: translate submitting-patches.rst (review and report tags)

Chen-Yu Yeh (16):
      docs/zh_TW: process: localize terminology in 7.AdvancedTopics.rst
      docs/zh_TW: process: localize terminology in 1.Intro.rst
      docs/zh_TW: process: localize terminology in code-of-conduct-interpre=
tation.rst
      docs/zh_TW: process: localize terminology in license-rules.rst
      docs/zh_TW: process: localize terminology in email-clients.rst
      docs/zh_TW: process: localize terminology in programming-language.rst
      docs/zh_TW: process: localize terminology in coding-style.rst
      docs/zh_TW: process: localize terminology in stable-kernel-rules.rst
      docs/zh_TW: process: localize terminology in 5.Posting.rst
      docs/zh_TW: process: localize terminology in 2.Process.rst
      docs/zh_TW: process: localize terminology in howto.rst
      docs/zh_TW: process: localize terminology in embargoed-hardware-issue=
s.rst
      docs/zh_TW: process: localize terminology in submitting-patches.rst
      docs/zh_TW: process: localize terminology in 8.Conclusion.rst
      docs/zh_TW: process: localize terminology in index.rst
      docs/zh_TW: Add a glossary for Traditional Chinese translations

Christoph Hellwig (1):
      XArray: document that tags persist after storing new elements

Costa Shulyupin (1):
      docs: sysctl: timer_migration is for hrtimer only

Daniel Pereira (12):
      docs: translations: pt_BR: translate embargoed-hardware-issues.rst
      docs: translations: pt_BR: update process translation files
      docs: translations: pt_BR: fix missing text and formatting in process=
 docs
      docs: pt_BR: translate coding-style.rst
      docs: pt_BR: translate kernel-enforcement-statement.rst
      docs: pt_BR: translate maintainer-tip.rst
      docs: pt_BR: translate submitting-patches.rst
      docs: translations: pt_BR: point refs at the translated documents
      docs: translations: pt_BR: add admin-guide index
      docs: translations: pt_BR: translate admin-guide/README.rst
      docs: translations: pt_BR: translate admin-guide/devices.rst
      docs: translations: pt_BR: point howto.rst at the translated documents

Doehyun Baek (7):
      docs/zh_CN: update DAMON design translation
      docs/zh_CN: add DAMON_STAT usage translation
      docs/zh_CN: update DAMON index translation
      docs/zh_CN: update DAMON start translation
      docs/zh_CN: update DAMON usage translation
      docs/zh_CN: update DAMON reclaim translation
      docs/zh_CN: update DAMON LRU sort translation

Drif Abdelmalek Mohamed Said (1):
      docs: filesystems: proc: fix typos

Giovanna Macedo Cox (1):
      docs: translations: pt_BR: translate coding-assistants.rst

Habil Eren T=C3=BCrker (2):
      docs: timers: hpet: Modernize file references
      docs: timers: hpet: Document userspace API and ioctl commands

Hemanth Selam (2):
      Documentation/core-api: fix typo "maintainance" in comment
      tools/lib: fix typos in comments

Iv=C3=A1n Ezequiel Rodriguez (6):
      docs: futex2: fix documented errno names for futex_waitv
      docs: landlock: fix ENOMSG condition in create_ruleset kernel-doc
      docs: gpio: note lineinfo padding must be zero filled
      docs: dma-buf-heaps: fix CMA heap name typo
      docs: vduse: align documentation with current uapi and driver
      docs: ioctl: fix stale NVMe registry entry and note N conflict

Jonathan Corbet (2):
      Merge tag 'Chinese-docs-7.4' of gitolite.kernel.org:pub/scm/linux/ker=
nel/git/alexs/linux into tmp
      Revert "docs: landlock: fix ENOMSG condition in create_ruleset kernel=
-doc"

Karl Mehltretter (31):
      docs: parport: Fix FIFO Kconfig symbol
      docs: cpu_hotplug: Fix multi-instance removal calls
      docs: irq-affinity: Restore grep in example
      docs: dma-attributes: Fix dma_alloc_attrs() name
      docs: swiotlb: Fix maximum mapping size helper
      docs: this_cpu_ops: Fix SRCU helper names
      docs: xarray: Fix xas_try_split() name
      docs: debugobjects: Fix debug_object_init() name
      docs: ioctl-number: Point the 0xEC row at cros_ec_chardev.h
      Documentation: userspace-api: iommufd: Fix the struct iommu_hwpt_allo=
c name
      Documentation/features: Mark cmpxchg-local as supported on loongarch
      Documentation: livepatch: Point klp_callbacks kernel-doc at livepatch=
_external.h
      Documentation: reset: Use fwnode_reset_simple_xlate() in the kernel-d=
oc directive
      Documentation: rs485: Pull uart_get_rs485_mode() from serial_core.c
      docs: parse-headers: Fix script name and stale Makefile reference
      docs: irqflags-tracing: Fix the lockdep Kconfig option names
      docs: maple_tree: Replace removed bulk insertion API
      docs: core-api: Fix the ISA DMA example
      docs: sysctl: Remove obsolete sg-big-buff entry
      docs: kernel-parameters: Drop the atarimouse=3D entry
      docs: kernel-parameters: Drop the bau=3D entry
      docs: kernel-parameters: Drop the edac_report=3D entry
      docs: kernel-parameters: Drop the enable_timer_pin_1 entry
      docs: kernel-parameters: Drop the mini2440=3D entry
      docs: kernel-parameters: Drop the nomfgpt entry
      docs: kernel-parameters: Drop the omap_mux=3D entry
      docs: kernel-parameters: Drop the pcmv=3D entry
      docs: powerpc: vas-api: Fix the structure name and the ioctl number i=
n the example
      Documentation: virt: Fix the struct snp_guest_request_ioctl name in s=
ev-guest.rst
      Documentation: RAS: Use the real EDAC PCI parity control names
      loadpin: Fix stale KEXEC_VERIFY_SIG reference in documentation

Kees Cook (1):
      docs: Makefile: Add a testdocs target for the documentation unit tests

Liang Hao (1):
      docs: real-time: mention the hrtimer sleeper HARD path

Lucas Adryell Ramalho (4):
      docs: translations: pt_BR: translate volatile-considered-harmful.rst
      docs: translations: pt_BR: translate stable-api-nonsense.rst
      docs: translations: pt_BR: translate maintainer-devicetree.rst
      docs: translations: pt_BR: add debugging index

Manuel Ebner (8):
      docs: misc-devices/spear-pcie-gadget.txt: Fix bracket and whitespace
      Documentation: admin-guide: Fix bracket
      fs: porting.rst: add bracket
      docs: locking: Fix bracket
      docs: verify/bisect: fix typos, formatting and punctuation
      Input: yealink.rst: Fix wording, quotation and typo
      Documentation: input: Fix bracket
      Documentation: fuse: harmonize numeration

Marco Crivellari (2):
      doc: Change dynticks-testing repository name
      Documentation/no_hz: Change dynticks-testing repository name

Nguyen Duc Thinh (1):
      Documentation: process: Capitalize Git, Quilt, and Mercurial consiste=
ntly

Omokefe Emmanuel Onanaroghene (1):
      docs: kdoc: parse context_lock_struct() as struct declaration

Quchaosheng (3):
      sched/doc: add a preemption model overview
      docs: kernel-parameters: fix a truncated sentence for preempt=3Dlazy
      Documentation: sched-preemption: Add a SPDX license identifier

Randy Dunlap (12):
      firmware: zynqmp: use literal blocks for commands
      docs: kernel-doc: include "define" as an identifier type
      docs: kernel-doc: inform that '@' applies to other fields
      ABI: sysfs-bus-pci: use literal blocks for commands
      Documentation/ABI: IFS: use literal blocks for commands
      docs: ABI: TMR manager: use literal blocks for console I/O
      docs/ABI: testing: aspeed-uart-routing: use literal block for console=
 commands
      ABI: sysfs-bus-usb: use literal block for console commands
      docs: ABI: sysfs-class-firmware-attributes: use literal blocks for co=
nsole commands
      docs: ABI: sysfs-driver-xdata: use literal blocks for console commands
      docs: kernel-parameters: don't mix cmdline options & build options
      docs: kernel-parameters: adjust reserve_mem build option

Ruben Sutton (1):
      docs: process: use gender-neutral pronouns

Sasha Levin (2):
      docs: remove Assisted-by references
      docs: add AGENTS.md as a symlink to README

Siwei Chen (5):
      docs/zh_CN: Add networking team documentation Chinese translation
      docs/zh_CN: Add NIC SR-IOV APIs Chinese translation
      docs/zh_CN: Add Softnet Driver Issues Chinese translation
      docs/zh_CN: Add ipv6 Chinese translation
      docs/zh_CN: Add LSM/SELinux secid Chinese translation

Weijie Yuan (2):
      docs/zh_CN: add process/applying-patches Chinese translation
      docs/zh_CN: link to Chinese applying-patches translation

 AGENTS.md                                          |    1 +
 .../ABI/stable/sysfs-driver-firmware-zynqmp        |   70 +-
 Documentation/ABI/testing/sysfs-bus-pci            |   14 +-
 Documentation/ABI/testing/sysfs-bus-usb            |    3 +-
 .../ABI/testing/sysfs-class-firmware-attributes    |   21 +-
 .../ABI/testing/sysfs-driver-aspeed-uart-routing   |    7 +-
 Documentation/ABI/testing/sysfs-driver-xdata       |   20 +-
 .../ABI/testing/sysfs-driver-xilinx-tmr-manager    |   14 +-
 Documentation/ABI/testing/sysfs-platform-intel-ifs |    6 +-
 Documentation/Makefile                             |    5 +
 Documentation/admin-guide/LSM/LoadPin.rst          |   10 +-
 Documentation/admin-guide/RAS/main.rst             |   12 +-
 Documentation/admin-guide/cpu-isolation.rst        |    4 +-
 Documentation/admin-guide/kernel-parameters.txt    |   68 +-
 Documentation/admin-guide/parport.rst              |    2 +-
 Documentation/admin-guide/sysctl/kernel.rst        |   19 +-
 Documentation/admin-guide/sysctl/vm.rst            |    2 +-
 .../verify-bugs-and-bisect-regressions.rst         |   26 +-
 Documentation/arch/powerpc/vas-api.rst             |    4 +-
 Documentation/core-api/cpu_hotplug.rst             |    4 +-
 Documentation/core-api/debug-objects.rst           |    2 +-
 Documentation/core-api/dma-attributes.rst          |    2 +-
 Documentation/core-api/dma-isa-lpc.rst             |   11 +-
 Documentation/core-api/housekeeping.rst            |    2 +-
 Documentation/core-api/irq/irq-affinity.rst        |    2 +-
 Documentation/core-api/irq/irqflags-tracing.rst    |    8 +-
 Documentation/core-api/maple_tree.rst              |    9 +-
 Documentation/core-api/real-time/differences.rst   |   10 +-
 Documentation/core-api/swiotlb.rst                 |    2 +-
 Documentation/core-api/this_cpu_ops.rst            |    6 +-
 Documentation/core-api/xarray.rst                  |    4 +-
 Documentation/doc-guide/kernel-doc.rst             |    7 +-
 Documentation/doc-guide/parse-headers.rst          |   15 +-
 Documentation/driver-api/reset.rst                 |    2 +-
 Documentation/driver-api/serial/serial-rs485.rst   |    5 +-
 .../locking/cmpxchg-local/arch-support.txt         |    2 +-
 Documentation/filesystems/fuse/fuse.rst            |    8 +-
 Documentation/filesystems/locking.rst              |    2 +-
 Documentation/filesystems/porting.rst              |    2 +-
 Documentation/filesystems/proc.rst                 |   10 +-
 Documentation/input/devices/yealink.rst            |    7 +-
 Documentation/input/notifier.rst                   |    2 +-
 Documentation/livepatch/api.rst                    |    5 +-
 Documentation/misc-devices/spear-pcie-gadget.rst   |   10 +-
 Documentation/process/1.Intro.rst                  |    2 +-
 Documentation/process/2.Process.rst                |   20 +-
 Documentation/process/3.Early-stage.rst            |    2 +-
 Documentation/process/5.Posting.rst                |   12 +-
 Documentation/process/6.Followthrough.rst          |    2 +-
 Documentation/process/7.AdvancedTopics.rst         |   36 +-
 Documentation/process/backporting.rst              |   18 +-
 Documentation/process/coding-assistants.rst        |   21 +-
 .../process/embargoed-hardware-issues.rst          |    2 +-
 Documentation/process/handling-regressions.rst     |    2 +-
 Documentation/process/howto.rst                    |    2 +-
 Documentation/process/maintainer-pgp-guide.rst     |   38 +-
 Documentation/process/submitting-patches.rst       |   12 +-
 Documentation/scheduler/index.rst                  |    1 +
 Documentation/scheduler/sched-preemption.rst       |   87 ++
 Documentation/timers/hpet.rst                      |   33 +-
 Documentation/timers/no_hz.rst                     |    4 +-
 .../it_IT/process/submitting-patches.rst           |   10 -
 .../ja_JP/process/submitting-patches.rst           |  115 ++
 .../translations/pt_BR/admin-guide/README.rst      |  382 ++++++
 .../translations/pt_BR/admin-guide/devices.rst     |  278 +++++
 .../translations/pt_BR/admin-guide/index.rst       |  190 +++
 Documentation/translations/pt_BR/index.rst         |   10 +
 .../translations/pt_BR/process/2.Process.rst       |   14 +-
 .../translations/pt_BR/process/3.Early-stage.rst   |   10 +-
 .../translations/pt_BR/process/4.Coding.rst        |    6 +-
 .../translations/pt_BR/process/5.Posting.rst       |   12 +-
 .../translations/pt_BR/process/6.Followthrough.rst |   14 +-
 .../translations/pt_BR/process/8.Conclusion.rst    |    3 +-
 .../translations/pt_BR/process/adding-syscalls.rst |   56 +-
 .../pt_BR/process/applying-patches.rst             |    6 +-
 .../translations/pt_BR/process/backporting.rst     |    4 +-
 .../process/code-of-conduct-interpretation.rst     |    2 +
 .../translations/pt_BR/process/code-of-conduct.rst |    4 +-
 .../pt_BR/process/coding-assistants.rst            |   40 +
 .../translations/pt_BR/process/coding-style.rst    | 1320 ++++++++++++++++=
++++
 Documentation/translations/pt_BR/process/cve.rst   |    4 +-
 .../translations/pt_BR/process/debugging/index.rst |   73 ++
 .../pt_BR/process/development-process.rst          |    2 +
 .../pt_BR/process/embargoed-hardware-issues.rst    |  362 ++++++
 Documentation/translations/pt_BR/process/howto.rst |   19 +-
 Documentation/translations/pt_BR/process/index.rst |   10 +
 .../translations/pt_BR/process/kernel-docs.rst     |    2 +
 .../pt_BR/process/kernel-enforcement-statement.rst |  163 +++
 .../translations/pt_BR/process/license-rules.rst   |    2 +
 .../pt_BR/process/maintainer-devicetree.rst        |   76 ++
 .../pt_BR/process/maintainer-handbooks.rst         |    4 +-
 .../pt_BR/process/maintainer-kvm-x86.rst           |   10 +-
 .../pt_BR/process/maintainer-soc-clean-dts.rst     |    5 +-
 .../translations/pt_BR/process/maintainer-tip.rst  |  847 +++++++++++++
 .../pt_BR/process/management-style.rst             |    9 +-
 .../translations/pt_BR/process/security-bugs.rst   |   25 +-
 .../pt_BR/process/stable-api-nonsense.rst          |  208 +++
 .../pt_BR/process/submit-checklist.rst             |    4 +-
 .../pt_BR/process/submitting-patches.rst           |  953 ++++++++++++++
 .../pt_BR/process/volatile-considered-harmful.rst  |  130 ++
 .../translations/zh_CN/admin-guide/README.rst      |    2 +-
 .../zh_CN/admin-guide/mm/damon/index.rst           |   15 +-
 .../zh_CN/admin-guide/mm/damon/lru_sort.rst        |   68 +-
 .../zh_CN/admin-guide/mm/damon/reclaim.rst         |   82 +-
 .../zh_CN/admin-guide/mm/damon/start.rst           |   63 +-
 .../zh_CN/admin-guide/mm/damon/stat.rst            |   94 ++
 .../zh_CN/admin-guide/mm/damon/usage.rst           |  523 ++++++--
 .../translations/zh_CN/mm/damon/design.rst         |  667 +++++++++-
 .../translations/zh_CN/networking/driver.rst       |  138 ++
 .../translations/zh_CN/networking/index.rst        |   10 +-
 .../translations/zh_CN/networking/ipv6.rst         |   76 ++
 .../translations/zh_CN/networking/secid.rst        |   24 +
 .../translations/zh_CN/networking/sriov.rst        |   34 +
 .../translations/zh_CN/networking/team.rst         |   16 +
 .../zh_CN/process/applying-patches.rst             |  390 ++++++
 Documentation/translations/zh_CN/process/howto.rst |    2 +-
 Documentation/translations/zh_CN/process/index.rst |    2 +-
 Documentation/translations/zh_TW/glossary.rst      |  168 +++
 Documentation/translations/zh_TW/index.rst         |    5 +-
 .../translations/zh_TW/process/1.Intro.rst         |  235 ++--
 .../translations/zh_TW/process/2.Process.rst       |  325 +++--
 .../translations/zh_TW/process/5.Posting.rst       |  235 ++--
 .../zh_TW/process/7.AdvancedTopics.rst             |  110 +-
 .../translations/zh_TW/process/8.Conclusion.rst    |   58 +-
 .../process/code-of-conduct-interpretation.rst     |  162 ++-
 .../translations/zh_TW/process/coding-style.rst    |  614 ++++-----
 .../translations/zh_TW/process/email-clients.rst   |  185 +--
 .../zh_TW/process/embargoed-hardware-issues.rst    |  209 ++--
 Documentation/translations/zh_TW/process/howto.rst |  344 ++---
 Documentation/translations/zh_TW/process/index.rst |   99 +-
 .../translations/zh_TW/process/license-rules.rst   |  203 +--
 .../zh_TW/process/programming-language.rst         |   98 +-
 .../zh_TW/process/stable-kernel-rules.rst          |  256 +++-
 .../zh_TW/process/submitting-patches.rst           |  549 ++++----
 Documentation/userspace-api/dma-buf-heaps.rst      |    2 +-
 Documentation/userspace-api/futex2.rst             |    4 +-
 Documentation/userspace-api/ioctl/ioctl-number.rst |    7 +-
 Documentation/userspace-api/iommufd.rst            |    2 +-
 Documentation/userspace-api/vduse.rst              |   33 +-
 Documentation/virt/coco/sev-guest.rst              |    2 +-
 Makefile                                           |    2 +-
 include/uapi/linux/gpio.h                          |    2 +-
 scripts/checkpatch.pl                              |   11 -
 tools/lib/python/kdoc/c_lex.py                     |    2 +-
 tools/lib/python/kdoc/kdoc_parser.py               |   11 +-
 tools/lib/python/kdoc/xforms_lists.py              |    3 +-
 tools/unittests/test_kdoc_parser.py                |   26 +
 147 files changed, 10041 insertions(+), 2252 deletions(-)
 create mode 120000 AGENTS.md
 create mode 100644 Documentation/scheduler/sched-preemption.rst
 create mode 100644 Documentation/translations/pt_BR/admin-guide/README.rst
 create mode 100644 Documentation/translations/pt_BR/admin-guide/devices.rst
 create mode 100644 Documentation/translations/pt_BR/admin-guide/index.rst
 create mode 100644 Documentation/translations/pt_BR/process/coding-assista=
nts.rst
 create mode 100644 Documentation/translations/pt_BR/process/coding-style.r=
st
 create mode 100644 Documentation/translations/pt_BR/process/debugging/inde=
x.rst
 create mode 100644 Documentation/translations/pt_BR/process/embargoed-hard=
ware-issues.rst
 create mode 100644 Documentation/translations/pt_BR/process/kernel-enforce=
ment-statement.rst
 create mode 100644 Documentation/translations/pt_BR/process/maintainer-dev=
icetree.rst
 create mode 100644 Documentation/translations/pt_BR/process/maintainer-tip=
.rst
 create mode 100644 Documentation/translations/pt_BR/process/stable-api-non=
sense.rst
 create mode 100644 Documentation/translations/pt_BR/process/submitting-pat=
ches.rst
 create mode 100644 Documentation/translations/pt_BR/process/volatile-consi=
dered-harmful.rst
 create mode 100644 Documentation/translations/zh_CN/admin-guide/mm/damon/s=
tat.rst
 create mode 100644 Documentation/translations/zh_CN/networking/driver.rst
 create mode 100644 Documentation/translations/zh_CN/networking/ipv6.rst
 create mode 100644 Documentation/translations/zh_CN/networking/secid.rst
 create mode 100644 Documentation/translations/zh_CN/networking/sriov.rst
 create mode 100644 Documentation/translations/zh_CN/networking/team.rst
 create mode 100644 Documentation/translations/zh_CN/process/applying-patch=
es.rst
 create mode 100644 Documentation/translations/zh_TW/glossary.rst
