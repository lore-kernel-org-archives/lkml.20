Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.211
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792745950;
	b=3FTwUQBLk+gpos3KXy8HOiyNaJHW+AtUTMaz9zjIhTYSisoU0+0DF0dNZ8oaGSKhHU/P
	 in7S2//DYjePPoJagljPadxZ56NkChO68xC9F+muO/a1p3BpyWyJTx3DJOhG7quICtWvX
	 AVB3hKD90I44DdxpQ6GVY7OAqlO6V81qulUOvnyRoy0xcDWPUDCKxv8TD+czg8Ame5a79
	 c5B9fPYOz9d4SQWt+VxfD5BKECT8yCfueY31Jy4o/AGX96eGFrDyKMvQtiwHMC5DXZx+V
	 s6/lTqxvsaQ5yEb7Au845NLnpRA+C7WEGF6b4FjTqPjSzaL3UVWS2NTvGeS9EO/UU9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792745950;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=QT6oxXes3aEqRl8ZBHpU6Cw7E44ItEp1847/YOVoPuU=;
	b=y++swxKBmZcB0cFWfopyCLRnTBsCSJZspf/83+DxXNPCHJcvKDPiu2oEUCrPnZXBrJgA
	 uA/wzCnUc0RYh8WvqHdqjJq2M9G5pIbKju8U2oVw4FriJ9aDtsbMeJ2kv7iqjv/yPXkhc
	 TEtbBZrPf1Gz3D4Q8VjgPNB5OK0pa9KBUGacS1fY/JN9TKqaGXtHAYPUN5cV8xcT+s6bn
	 wcPgkWlKdHfs6nGIY0w6RQTw5sk4nwIyiZKDBHj8QPMlJpAhuY4MsuXiSAwLZWgXIEwMC
	 n5bg10t4tENW0lS4JKlo53xr+j8hWyxA+38yjxKfhFSxSJCdYMQma/mIwrAbrASNYxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wyuan.org;
	spf=pass smtp.mailfrom=wyuan.org;
	dkim=pass header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=kpZ4mcdV;
	arc=none smtp.remote-ip=95.215.58.211
Received: from mta1.migadu.com (out-211.mta1.migadu.com [95.215.58.211])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77DFC606A31B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 08:59:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77DFC606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=kpZ4mcdV
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=AKHD1PAAAZXXnFEx7ZLXV236svdwmoGmOzGTzCJjlyk=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792745947; v=1; x=1793350747;
 b=kpZ4mcdVryGEjn+6QanH4xZm9YzaNZe8zhC08iQkVxyZeDUw49CklihEhRoorQajtUqi4qSr
 ERaf5cHL7k+Nt6c13VoTNQ3r8qYd+C5JNP4GBCNxMQviCikJ0r+eeSIHGkMY1b5j4lj4q13Bb5E
 TBbv6Gt9IPZlalzV6R7SyH+bQDfdnMULNHsM1Vel+feSdvPt3zlNH51A+Y1YuDJuyPFjbkiDgi3
 MYINvDAEh/c/O6YMrXFhzzz4EG8T5kBtaxtbnPnVyg7lF0+r8d3eK6XxXOQg89a3zpGQvFb8jhs
 tGLCGsylfbLYcamBHU9EX3EXcnGWmwdvfHGckOCkE326A==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id c18ba0f180bedc17;
	Fri, 23 Oct 2026 08:59:07 +0000
X-Mizu-Trace-ID: c18ba0f180bedc17
X-Migadu-Flow: FLOW_OUT
From: Weijie Yuan <wy@wyuan.org>
To: Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>,
	Dongliang Mu <dzm91@hust.edu.cn>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] docs/zh_CN: cleanup headers
Date: Fri, 23 Oct 2026 16:58:34 +0800
Message-ID: <cover.1792745468.git.wy@wyuan.org>
X-Mailer: git-send-email 2.56.0.379.gc618271300
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

As discussed in [1], the Translator field (and related ones) is
repetitive, redundant and difficult to maintain.

Let's remove them to make our source clean.

[1] https://lore.kernel.org/linux-doc/87o6cvrs27.fsf@trenco.lwn.net/

 [1/2] docs/zh_CN: remove translator-related headers
 [2/2] docs/zh_CN: remove Translator field in header template

Changes in v3:
- Add the content that should have been deleted. (thanks, Dongliang)
- Add Reviewed-by trailer for [2/2] from Dongliang.

Changes in v2:
- Do not touch top-level labels, maybe deal with them later. (Dongliang)
- Still miss SPDX-Identifiers in some files by checkpatch, because we
  generally want our translation aligned with English version unless
  direct ack/instruction from original translators.

 Documentation/translations/zh_CN/PCI/acpi-info.rst   |  7 -------
 Documentation/translations/zh_CN/PCI/index.rst       |  7 -------
 Documentation/translations/zh_CN/PCI/msi-howto.rst   |  8 --------
 .../translations/zh_CN/PCI/pci-iov-howto.rst         |  8 --------
 Documentation/translations/zh_CN/PCI/pci.rst         |  8 --------
 .../translations/zh_CN/PCI/pciebus-howto.rst         |  8 --------
 Documentation/translations/zh_CN/PCI/sysfs-pci.rst   |  8 --------
 .../zh_CN/accounting/delay-accounting.rst            |  2 --
 .../translations/zh_CN/accounting/index.rst          |  1 -
 Documentation/translations/zh_CN/accounting/psi.rst  |  1 -
 .../translations/zh_CN/accounting/taskstats.rst      |  2 --
 .../translations/zh_CN/admin-guide/README.rst        |  4 ----
 .../translations/zh_CN/admin-guide/bootconfig.rst    |  2 --
 .../translations/zh_CN/admin-guide/bug-bisect.rst    |  4 ----
 .../translations/zh_CN/admin-guide/bug-hunting.rst   |  4 ----
 .../translations/zh_CN/admin-guide/cputopology.rst   |  4 ----
 .../translations/zh_CN/admin-guide/index.rst         |  7 -------
 .../translations/zh_CN/admin-guide/init.rst          |  4 ----
 .../zh_CN/admin-guide/lockup-watchdogs.rst           |  1 -
 .../zh_CN/admin-guide/mm/damon/index.rst             |  6 ------
 .../zh_CN/admin-guide/mm/damon/lru_sort.rst          |  6 ------
 .../zh_CN/admin-guide/mm/damon/reclaim.rst           |  6 ------
 .../zh_CN/admin-guide/mm/damon/start.rst             |  6 ------
 .../translations/zh_CN/admin-guide/mm/damon/stat.rst |  4 ----
 .../zh_CN/admin-guide/mm/damon/usage.rst             |  6 ------
 .../translations/zh_CN/admin-guide/mm/index.rst      |  5 -----
 .../translations/zh_CN/admin-guide/mm/ksm.rst        |  5 -----
 .../zh_CN/admin-guide/module-signing.rst             |  3 ---
 .../translations/zh_CN/admin-guide/numastat.rst      |  2 --
 .../zh_CN/admin-guide/reporting-issues.rst           |  5 -----
 .../zh_CN/admin-guide/reporting-regressions.rst      |  5 -----
 .../translations/zh_CN/admin-guide/sysrq.rst         |  8 --------
 .../zh_CN/admin-guide/tainted-kernels.rst            |  4 ----
 .../translations/zh_CN/admin-guide/unicode.rst       |  4 ----
 Documentation/translations/zh_CN/arch/arm64/amu.rst  |  2 --
 .../translations/zh_CN/arch/arm64/elf_hwcaps.rst     |  2 --
 .../translations/zh_CN/arch/arm64/hugetlbpage.rst    |  2 --
 .../translations/zh_CN/arch/arm64/index.rst          |  1 -
 Documentation/translations/zh_CN/arch/arm64/perf.rst |  2 --
 .../translations/zh_CN/arch/loongarch/booting.rst    |  4 ----
 .../translations/zh_CN/arch/loongarch/features.rst   |  1 -
 .../translations/zh_CN/arch/loongarch/index.rst      |  1 -
 .../zh_CN/arch/loongarch/introduction.rst            |  1 -
 .../zh_CN/arch/loongarch/irq-chip-model.rst          |  1 -
 .../translations/zh_CN/arch/mips/booting.rst         |  4 ----
 .../translations/zh_CN/arch/mips/features.rst        |  4 ----
 Documentation/translations/zh_CN/arch/mips/index.rst |  4 ----
 .../translations/zh_CN/arch/mips/ingenic-tcu.rst     |  4 ----
 .../translations/zh_CN/arch/openrisc/index.rst       |  4 ----
 .../zh_CN/arch/openrisc/openrisc_port.rst            |  4 ----
 .../translations/zh_CN/arch/openrisc/todo.rst        |  4 ----
 .../translations/zh_CN/arch/parisc/debugging.rst     |  4 ----
 .../translations/zh_CN/arch/parisc/index.rst         |  4 ----
 .../translations/zh_CN/arch/parisc/registers.rst     |  4 ----
 .../zh_CN/arch/riscv/boot-image-header.rst           |  4 ----
 Documentation/translations/zh_CN/arch/riscv/boot.rst |  4 ----
 .../translations/zh_CN/arch/riscv/index.rst          |  4 ----
 .../zh_CN/arch/riscv/patch-acceptance.rst            |  4 ----
 .../translations/zh_CN/arch/riscv/vm-layout.rst      |  5 -----
 Documentation/translations/zh_CN/block/blk-mq.rst    |  8 --------
 .../translations/zh_CN/block/data-integrity.rst      |  6 ------
 Documentation/translations/zh_CN/block/index.rst     |  6 ------
 .../translations/zh_CN/core-api/assoc_array.rst      |  8 --------
 .../translations/zh_CN/core-api/boot-time-mm.rst     |  8 --------
 .../translations/zh_CN/core-api/cachetlb.rst         |  9 ---------
 .../translations/zh_CN/core-api/circular-buffers.rst | 10 ----------
 .../translations/zh_CN/core-api/cpu_hotplug.rst      |  8 --------
 Documentation/translations/zh_CN/core-api/errseq.rst |  8 --------
 .../translations/zh_CN/core-api/genalloc.rst         |  8 --------
 .../zh_CN/core-api/generic-radix-tree.rst            |  4 ----
 .../translations/zh_CN/core-api/genericirq.rst       |  8 --------
 .../zh_CN/core-api/gfp_mask-from-fs-io.rst           |  8 --------
 Documentation/translations/zh_CN/core-api/idr.rst    | 10 ----------
 Documentation/translations/zh_CN/core-api/index.rst  |  4 ----
 .../translations/zh_CN/core-api/irq/concepts.rst     |  4 ----
 .../translations/zh_CN/core-api/irq/index.rst        |  4 ----
 .../translations/zh_CN/core-api/irq/irq-affinity.rst |  4 ----
 .../translations/zh_CN/core-api/irq/irq-domain.rst   |  5 -----
 .../zh_CN/core-api/irq/irqflags-tracing.rst          |  4 ----
 .../translations/zh_CN/core-api/kernel-api.rst       |  5 -----
 .../translations/zh_CN/core-api/kobject.rst          |  4 ----
 Documentation/translations/zh_CN/core-api/kref.rst   |  8 --------
 .../translations/zh_CN/core-api/local_ops.rst        |  4 ----
 .../zh_CN/core-api/memory-allocation.rst             |  8 --------
 .../translations/zh_CN/core-api/memory-hotplug.rst   |  8 --------
 Documentation/translations/zh_CN/core-api/mm-api.rst |  9 ---------
 .../translations/zh_CN/core-api/packing.rst          | 10 ----------
 Documentation/translations/zh_CN/core-api/padata.rst |  4 ----
 .../translations/zh_CN/core-api/printk-basics.rst    |  5 -----
 .../translations/zh_CN/core-api/printk-formats.rst   |  5 -----
 .../translations/zh_CN/core-api/protection-keys.rst  |  8 --------
 Documentation/translations/zh_CN/core-api/rbtree.rst |  4 ----
 .../zh_CN/core-api/refcount-vs-atomic.rst            |  4 ----
 .../zh_CN/core-api/symbol-namespaces.rst             |  4 ----
 .../translations/zh_CN/core-api/this_cpu_ops.rst     |  8 --------
 .../zh_CN/core-api/unaligned-memory-access.rst       |  8 --------
 .../translations/zh_CN/core-api/watch_queue.rst      | 10 ----------
 .../translations/zh_CN/core-api/workqueue.rst        |  6 ------
 Documentation/translations/zh_CN/core-api/xarray.rst |  9 ---------
 Documentation/translations/zh_CN/cpu-freq/core.rst   |  8 --------
 .../translations/zh_CN/cpu-freq/cpu-drivers.rst      |  8 --------
 .../translations/zh_CN/cpu-freq/cpufreq-stats.rst    |  8 --------
 Documentation/translations/zh_CN/cpu-freq/index.rst  |  4 ----
 Documentation/translations/zh_CN/dev-tools/gcov.rst  |  1 -
 .../zh_CN/dev-tools/gdb-kernel-debugging.rst         |  1 -
 Documentation/translations/zh_CN/dev-tools/index.rst |  1 -
 Documentation/translations/zh_CN/dev-tools/kasan.rst |  1 -
 Documentation/translations/zh_CN/dev-tools/kcov.rst  |  1 -
 Documentation/translations/zh_CN/dev-tools/kcsan.rst |  1 -
 .../translations/zh_CN/dev-tools/kmemleak.rst        |  1 -
 Documentation/translations/zh_CN/dev-tools/kmsan.rst |  1 -
 .../translations/zh_CN/dev-tools/sparse.rst          |  8 --------
 .../zh_CN/dev-tools/testing-overview.rst             |  1 -
 Documentation/translations/zh_CN/dev-tools/ubsan.rst |  8 --------
 .../translations/zh_CN/devicetree/changesets.rst     |  7 -------
 .../zh_CN/devicetree/dynamic-resolution-notes.rst    |  6 ------
 .../translations/zh_CN/devicetree/index.rst          |  7 -------
 .../translations/zh_CN/devicetree/kernel-api.rst     |  7 -------
 .../translations/zh_CN/devicetree/of_unittest.rst    |  6 ------
 .../translations/zh_CN/devicetree/overlay-notes.rst  |  6 ------
 .../translations/zh_CN/devicetree/usage-model.rst    |  7 -------
 .../zh_CN/doc-guide/checktransupdate.rst             |  2 --
 .../translations/zh_CN/doc-guide/contributing.rst    |  2 --
 Documentation/translations/zh_CN/doc-guide/index.rst |  2 --
 .../translations/zh_CN/doc-guide/kernel-doc.rst      |  2 --
 .../zh_CN/doc-guide/maintainer-profile.rst           |  2 --
 .../translations/zh_CN/doc-guide/parse-headers.rst   |  2 --
 .../translations/zh_CN/doc-guide/sphinx.rst          |  2 --
 .../translations/zh_CN/driver-api/gpio/index.rst     |  6 ------
 .../translations/zh_CN/driver-api/index.rst          |  6 ------
 .../translations/zh_CN/driver-api/io_ordering.rst    |  7 -------
 .../translations/zh_CN/driver-api/phy/phy.rst        |  4 ----
 .../translations/zh_CN/filesystems/debugfs.rst       | 11 -----------
 .../translations/zh_CN/filesystems/dnotify.rst       |  4 ----
 .../translations/zh_CN/filesystems/gfs2-glocks.rst   |  8 --------
 .../translations/zh_CN/filesystems/gfs2-uevents.rst  |  8 --------
 .../translations/zh_CN/filesystems/gfs2.rst          |  8 --------
 .../translations/zh_CN/filesystems/index.rst         |  1 -
 .../translations/zh_CN/filesystems/inotify.rst       |  4 ----
 .../translations/zh_CN/filesystems/tmpfs.rst         |  2 --
 .../zh_CN/filesystems/ubifs-authentication.rst       |  8 --------
 .../translations/zh_CN/filesystems/ubifs.rst         |  8 --------
 .../translations/zh_CN/filesystems/virtiofs.rst      |  7 -------
 Documentation/translations/zh_CN/how-to.rst          |  4 ----
 Documentation/translations/zh_CN/iio/ep93xx_adc.rst  |  4 ----
 .../translations/zh_CN/iio/iio_configfs.rst          |  4 ----
 Documentation/translations/zh_CN/iio/index.rst       |  4 ----
 .../translations/zh_CN/infiniband/core_locking.rst   |  9 ---------
 .../translations/zh_CN/infiniband/index.rst          |  9 ---------
 .../translations/zh_CN/infiniband/ipoib.rst          |  9 ---------
 .../translations/zh_CN/infiniband/sysfs.rst          |  9 ---------
 .../translations/zh_CN/infiniband/tag_matching.rst   |  9 ---------
 .../translations/zh_CN/infiniband/user_mad.rst       |  9 ---------
 .../translations/zh_CN/infiniband/user_verbs.rst     |  9 ---------
 .../translations/zh_CN/kbuild/gcc-plugins.rst        |  1 -
 .../translations/zh_CN/kbuild/headers_install.rst    |  1 -
 Documentation/translations/zh_CN/kbuild/index.rst    |  1 -
 Documentation/translations/zh_CN/kbuild/kbuild.rst   |  1 -
 Documentation/translations/zh_CN/kbuild/kconfig.rst  |  1 -
 Documentation/translations/zh_CN/kbuild/llvm.rst     |  1 -
 .../zh_CN/kbuild/reproducible-builds.rst             |  2 --
 .../translations/zh_CN/kernel-hacking/hacking.rst    |  4 ----
 .../translations/zh_CN/kernel-hacking/index.rst      |  4 ----
 Documentation/translations/zh_CN/locking/index.rst   |  4 ----
 .../translations/zh_CN/locking/mutex-design.rst      |  4 ----
 .../translations/zh_CN/locking/spinlocks.rst         |  4 ----
 .../translations/zh_CN/maintainer/configure-git.rst  |  4 ----
 .../zh_CN/maintainer/maintainer-entry-profile.rst    |  4 ----
 .../zh_CN/maintainer/modifying-patches.rst           |  4 ----
 .../translations/zh_CN/maintainer/pull-requests.rst  |  4 ----
 .../zh_CN/maintainer/rebasing-and-merging.rst        |  4 ----
 Documentation/translations/zh_CN/mm/active_mm.rst    |  7 -------
 Documentation/translations/zh_CN/mm/balance.rst      |  7 -------
 Documentation/translations/zh_CN/mm/damon/api.rst    |  7 -------
 Documentation/translations/zh_CN/mm/damon/design.rst |  7 -------
 Documentation/translations/zh_CN/mm/damon/faq.rst    |  7 -------
 Documentation/translations/zh_CN/mm/damon/index.rst  |  7 -------
 .../translations/zh_CN/mm/free_page_reporting.rst    |  6 ------
 Documentation/translations/zh_CN/mm/highmem.rst      |  6 ------
 Documentation/translations/zh_CN/mm/hmm.rst          |  6 ------
 .../translations/zh_CN/mm/hugetlbfs_reserv.rst       |  6 ------
 Documentation/translations/zh_CN/mm/hwpoison.rst     |  7 -------
 Documentation/translations/zh_CN/mm/index.rst        |  6 ------
 Documentation/translations/zh_CN/mm/ksm.rst          |  4 ----
 Documentation/translations/zh_CN/mm/memory-model.rst |  7 -------
 Documentation/translations/zh_CN/mm/mmu_notifier.rst |  8 --------
 Documentation/translations/zh_CN/mm/numa.rst         |  7 -------
 .../translations/zh_CN/mm/overcommit-accounting.rst  |  8 --------
 Documentation/translations/zh_CN/mm/page_frags.rst   |  7 -------
 .../translations/zh_CN/mm/page_migration.rst         |  6 ------
 Documentation/translations/zh_CN/mm/page_owner.rst   |  7 -------
 .../translations/zh_CN/mm/page_table_check.rst       |  7 -------
 Documentation/translations/zh_CN/mm/page_tables.rst  |  6 ------
 .../translations/zh_CN/mm/physical_memory.rst        |  4 ----
 .../translations/zh_CN/mm/remap_file_pages.rst       |  7 -------
 .../translations/zh_CN/mm/split_page_table_lock.rst  |  7 -------
 .../zh_CN/mm/vmalloced-kernel-stacks.rst             |  6 ------
 Documentation/translations/zh_CN/mm/zsmalloc.rst     |  6 ------
 .../translations/zh_CN/networking/alias.rst          |  6 ------
 .../translations/zh_CN/networking/driver.rst         |  4 ----
 .../translations/zh_CN/networking/generic-hdlc.rst   |  4 ----
 .../translations/zh_CN/networking/index.rst          |  6 ------
 Documentation/translations/zh_CN/networking/ipv6.rst |  4 ----
 .../translations/zh_CN/networking/mptcp-sysctl.rst   |  4 ----
 .../translations/zh_CN/networking/msg_zerocopy.rst   |  9 ---------
 Documentation/translations/zh_CN/networking/napi.rst |  4 ----
 .../translations/zh_CN/networking/netif-msg.rst      |  4 ----
 .../translations/zh_CN/networking/netmem.rst         |  4 ----
 .../translations/zh_CN/networking/secid.rst          |  4 ----
 .../translations/zh_CN/networking/sriov.rst          |  4 ----
 Documentation/translations/zh_CN/networking/team.rst |  4 ----
 .../translations/zh_CN/networking/timestamping.rst   |  4 ----
 .../translations/zh_CN/networking/vxlan.rst          |  9 ---------
 .../translations/zh_CN/networking/xfrm_proc.rst      |  4 ----
 Documentation/translations/zh_CN/peci/index.rst      |  6 ------
 Documentation/translations/zh_CN/peci/peci.rst       |  6 ------
 .../translations/zh_CN/power/energy-model.rst        |  4 ----
 Documentation/translations/zh_CN/power/index.rst     |  4 ----
 Documentation/translations/zh_CN/power/opp.rst       |  4 ----
 Documentation/translations/zh_CN/process/1.Intro.rst |  8 --------
 .../translations/zh_CN/process/2.Process.rst         |  8 --------
 .../translations/zh_CN/process/3.Early-stage.rst     |  8 --------
 .../translations/zh_CN/process/4.Coding.rst          |  8 --------
 .../translations/zh_CN/process/5.Posting.rst         |  8 --------
 .../translations/zh_CN/process/6.Followthrough.rst   |  8 --------
 .../translations/zh_CN/process/7.AdvancedTopics.rst  |  8 --------
 .../translations/zh_CN/process/8.Conclusion.rst      |  7 -------
 .../translations/zh_CN/process/applying-patches.rst  |  4 ----
 .../zh_CN/process/code-of-conduct-interpretation.rst |  1 -
 .../translations/zh_CN/process/code-of-conduct.rst   |  1 -
 .../translations/zh_CN/process/coding-style.rst      | 12 ------------
 Documentation/translations/zh_CN/process/cve.rst     |  1 -
 .../zh_CN/process/development-process.rst            |  1 -
 .../translations/zh_CN/process/email-clients.rst     | 10 ----------
 .../zh_CN/process/embargoed-hardware-issues.rst      |  1 -
 Documentation/translations/zh_CN/process/howto.rst   | 11 -----------
 Documentation/translations/zh_CN/process/index.rst   |  4 ----
 .../zh_CN/process/kernel-driver-statement.rst        |  1 -
 .../zh_CN/process/kernel-enforcement-statement.rst   |  1 -
 .../translations/zh_CN/process/license-rules.rst     |  1 -
 .../translations/zh_CN/process/magic-number.rst      |  8 --------
 .../zh_CN/process/maintainer-pgp-guide.rst           |  7 -------
 .../translations/zh_CN/process/management-style.rst  |  1 -
 .../zh_CN/process/programming-language.rst           |  1 -
 .../zh_CN/process/researcher-guidelines.rst          |  3 ---
 .../translations/zh_CN/process/security-bugs.rst     |  5 -----
 .../zh_CN/process/stable-api-nonsense.rst            |  6 ------
 .../zh_CN/process/stable-kernel-rules.rst            | 10 ----------
 .../translations/zh_CN/process/submit-checklist.rst  |  3 ---
 .../zh_CN/process/submitting-patches.rst             | 10 ----------
 .../zh_CN/process/volatile-considered-harmful.rst    | 11 -----------
 .../translations/zh_CN/rust/arch-support.rst         |  4 ----
 .../translations/zh_CN/rust/coding-guidelines.rst    |  4 ----
 .../translations/zh_CN/rust/general-information.rst  |  5 -----
 Documentation/translations/zh_CN/rust/index.rst      |  4 ----
 .../translations/zh_CN/rust/quick-start.rst          |  5 -----
 Documentation/translations/zh_CN/rust/testing.rst    |  4 ----
 .../translations/zh_CN/scheduler/completion.rst      |  8 --------
 Documentation/translations/zh_CN/scheduler/index.rst |  9 ---------
 .../translations/zh_CN/scheduler/sched-arch.rst      |  8 --------
 .../translations/zh_CN/scheduler/sched-bwc.rst       |  8 --------
 .../translations/zh_CN/scheduler/sched-capacity.rst  |  8 --------
 .../translations/zh_CN/scheduler/sched-debug.rst     |  4 ----
 .../zh_CN/scheduler/sched-design-CFS.rst             |  4 ----
 .../translations/zh_CN/scheduler/sched-domains.rst   |  8 --------
 .../translations/zh_CN/scheduler/sched-energy.rst    |  4 ----
 .../zh_CN/scheduler/sched-nice-design.rst            |  4 ----
 .../translations/zh_CN/scheduler/sched-stats.rst     |  4 ----
 .../translations/zh_CN/scheduler/schedutil.rst       |  4 ----
 Documentation/translations/zh_CN/scsi/index.rst      |  8 --------
 Documentation/translations/zh_CN/scsi/libsas.rst     |  6 ------
 .../zh_CN/scsi/link_power_management_policy.rst      |  8 --------
 .../translations/zh_CN/scsi/scsi-parameters.rst      |  8 --------
 Documentation/translations/zh_CN/scsi/scsi.rst       |  8 --------
 Documentation/translations/zh_CN/scsi/scsi_eh.rst    |  7 -------
 .../translations/zh_CN/scsi/scsi_mid_low_api.rst     |  8 --------
 .../translations/zh_CN/scsi/sd-parameters.rst        |  8 --------
 Documentation/translations/zh_CN/scsi/wd719x.rst     |  6 ------
 .../translations/zh_CN/security/IMA-templates.rst    |  3 ---
 Documentation/translations/zh_CN/security/SCTP.rst   |  3 ---
 .../translations/zh_CN/security/credentials.rst      |  3 ---
 Documentation/translations/zh_CN/security/digsig.rst |  3 ---
 Documentation/translations/zh_CN/security/index.rst  |  4 ----
 Documentation/translations/zh_CN/security/ipe.rst    |  3 ---
 .../translations/zh_CN/security/keys/index.rst       |  3 ---
 .../translations/zh_CN/security/landlock.rst         |  4 ----
 .../translations/zh_CN/security/lsm-development.rst  |  3 ---
 Documentation/translations/zh_CN/security/lsm.rst    |  4 ----
 Documentation/translations/zh_CN/security/sak.rst    |  4 ----
 .../translations/zh_CN/security/secrets/coco.rst     |  4 ----
 .../translations/zh_CN/security/secrets/index.rst    |  2 --
 .../translations/zh_CN/security/self-protection.rst  |  4 ----
 .../translations/zh_CN/security/siphash.rst          |  4 ----
 .../zh_CN/security/snp-tdx-threat-model.rst          |  4 ----
 .../translations/zh_CN/security/tpm/index.rst        |  3 ---
 .../translations/zh_CN/security/tpm/tpm-security.rst |  3 ---
 .../zh_CN/security/tpm/tpm_event_log.rst             |  3 ---
 .../translations/zh_CN/security/tpm/tpm_ftpm_tee.rst |  3 ---
 .../translations/zh_CN/security/tpm/tpm_tis.rst      |  3 ---
 .../zh_CN/security/tpm/tpm_vtpm_proxy.rst            |  3 ---
 .../translations/zh_CN/security/tpm/xen-tpmfront.rst |  3 ---
 .../translations/zh_CN/sound/hd-audio/controls.rst   |  2 --
 .../translations/zh_CN/sound/hd-audio/index.rst      |  2 --
 Documentation/translations/zh_CN/sound/index.rst     |  2 --
 Documentation/translations/zh_CN/staging/index.rst   |  4 ----
 .../translations/zh_CN/staging/speculation.rst       |  4 ----
 Documentation/translations/zh_CN/staging/xz.rst      |  4 ----
 Documentation/translations/zh_CN/subsystem-apis.rst  |  4 ----
 Documentation/translations/zh_CN/usb/CREDITS         |  7 -------
 Documentation/translations/zh_CN/usb/acm.rst         |  7 -------
 .../translations/zh_CN/usb/authorization.rst         |  7 -------
 Documentation/translations/zh_CN/usb/chipidea.rst    |  7 -------
 Documentation/translations/zh_CN/usb/dwc3.rst        |  7 -------
 Documentation/translations/zh_CN/usb/ehci.rst        |  7 -------
 Documentation/translations/zh_CN/usb/index.rst       |  7 -------
 Documentation/translations/zh_CN/usb/usbmon.rst      |  7 -------
 .../zh_CN/userspace-api/accelerators/ocxl.rst        |  4 ----
 .../translations/zh_CN/userspace-api/ebpf/index.rst  |  4 ----
 .../zh_CN/userspace-api/ebpf/syscall.rst             |  4 ----
 .../translations/zh_CN/userspace-api/futex2.rst      |  4 ----
 .../translations/zh_CN/userspace-api/index.rst       |  4 ----
 .../zh_CN/userspace-api/no_new_privs.rst             |  4 ----
 .../zh_CN/userspace-api/seccomp_filter.rst           |  4 ----
 .../zh_CN/userspace-api/sysfs-platform_profile.rst   |  4 ----
 Documentation/translations/zh_CN/virt/acrn/cpuid.rst |  8 --------
 Documentation/translations/zh_CN/virt/acrn/index.rst |  8 --------
 .../translations/zh_CN/virt/acrn/introduction.rst    |  8 --------
 .../translations/zh_CN/virt/acrn/io-request.rst      |  8 --------
 .../translations/zh_CN/virt/guest-halt-polling.rst   |  8 --------
 Documentation/translations/zh_CN/virt/index.rst      |  8 --------
 .../translations/zh_CN/virt/ne_overview.rst          |  8 --------
 .../translations/zh_CN/virt/paravirt_ops.rst         |  9 ---------
 332 files changed, 1712 deletions(-)

Range-diff against v2:
1:  d99d7c42d635 ! 1:  57bf0bce03cb docs/zh_CN: remove translator-related headers
    @@ Documentation/translations/zh_CN/process/coding-style.rst
     - - Andy Deng <theandy.deng@gmail.com>
     - - 吴想成 <bobwxc@email.cn>
     -
    - :校译:
    -  - 王聪 Wang Cong <xiyou.wangcong@gmail.com>
    -  - wheelz <kernel.zeng@gmail.com>
    +-:校译:
    +- - 王聪 Wang Cong <xiyou.wangcong@gmail.com>
    +- - wheelz <kernel.zeng@gmail.com>
    +- - 管旭东 Xudong Guan <xudong.guan@gmail.com>
    +- - Li Zefan <lizf@cn.fujitsu.com>
    +- - Wang Chen <wangchen@cn.fujitsu.com>
    +-
    + Linux 内核代码风格
    + ==================
    + 
     
      ## Documentation/translations/zh_CN/process/cve.rst ##
     @@
2:  89d676d79f25 ! 2:  8cdaa5708b92 docs/zh_CN: remove Translator field in header template
    @@ Commit message
     
         Suggested-by: Jonathan Corbet <corbet@lwn.net>
         Signed-off-by: Weijie Yuan <wy@wyuan.org>
    +    Reviewed-by: Dongliang Mu <dzm91@hust.edu.cn>
         Link: https://lore.kernel.org/linux-doc/87o6cvrs27.fsf@trenco.lwn.net/
     
      ## Documentation/translations/zh_CN/how-to.rst ##
-- 
2.56.0.379.gc618271300

