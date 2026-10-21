Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.30
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792570601;
	b=DdPURhQQLtCI49FlmtR6TGeQUNCtDN9I5+R7bSS5hz5oku8SUUbiiGhnYBnizrsqTAgf
	 WgbzdtKIuD0yEUyRmWWmWOTbUkT1mx+mxunAVxmyCOcfsfTzJnUNLSrCXtYK74flzq61t
	 C5axS92g1J6wI5bUqDZVNhqmKyFVILWKbq9/WBYO8StrIQiXH+PlNdQYQt3WHPVFQLHN5
	 vANrGDoVivRtTYY3dc/Pj0u6CQVJ1xuD1aSqtvuqW56SAecetKA9J+ZMr+/FNUpmm/yWN
	 qJi5/0A0IQHZIegC+1tw9ct6C22W37+uwmoDq/fQvNt+d5ed5AAV6kxarjmmnPgVATQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792570601;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=hUsP77xjh1vFCo3JNhxkBsPFITIepQwuaB/WqrBTU48=;
	b=ZlklN1eA5CfDeIFMyrNAhPt6xRVnufcICyXqRMa0UGXsinZ+r3W+UrFejroQQmtUO7Fu
	 MFAPv8wsHjdu5rSqM5VE4Tx2Iv7/sBCcFv+1cPds7FDNcTiacLght4/tHfkuoXNW7d952
	 PyNR9mm1BqycXchNjRJ7ZFU+Yh/xh0HJLQ/W2UQJp6bKV6P69oLyzfqe1fjSA6LXoru4M
	 P9G/awp+Ewq1J/lwpmBdZlElZLIljhYdFU6GeI0JK/5O8MkoWwJ9f4R/JhOJ86AeskPgX
	 jtxMR17MKXUwICt1LeXfqZbccGCJCGwTX5oSn0QhWjCZE9uaSH/A8D1mzrHR4LKS04w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wyuan.org;
	spf=pass smtp.mailfrom=wyuan.org;
	dkim=pass header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=menFvuDF;
	arc=none smtp.remote-ip=95.215.58.30
Received: from mta1.migadu.com (out-30.mta1.migadu.com [95.215.58.30])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36588606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:16:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36588606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=menFvuDF
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=+NwxB3sggon+wS7E6+8XcWXrkXTMCMrc+XnNq5ZCZkY=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792570596; v=1; x=1793175396;
 b=menFvuDFjiBPpr0PcJj6R3lZ74h7zw6BDaontxiTa7CMKR7swewnivSDzM7M4SRx6qykE13S
 etw/vMlNS4ELxH31Q58o3v8oKN2QvhyC8g5riz59M6yHPUuu9r+EYtf9YFzF4XIgDmwxAgis80b
 GFE4gLqzL01ThMsIYP0TRzvYb9hUrb6NvIofmUBalSZKl4OfoW9Z+DUvKGE8Rl3ibtDQYMYx5mm
 zwDOKhdPfzjmUaKlOHG3qG+bPMbcwKmQSKpkW3G/A0OUWrPPb6wq2JZgWCy94q5KnnW143ZRiFY
 DrF35IRosC2wgn9tDTTfh0B3E3+l5vKWG5TkiDOvIyc9A==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id b393e7367cf8af57;
	Wed, 21 Oct 2026 08:16:36 +0000
X-Mizu-Trace-ID: b393e7367cf8af57
X-Migadu-Flow: FLOW_OUT
From: Weijie Yuan <wy@wyuan.org>
To: Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>,
	Dongliang Mu <dzm91@hust.edu.cn>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Weijie Yuan <wy@wyuan.org>
Subject: [PATCH v2 0/2] docs/zh_CN: cleanup headers
Date: Wed, 21 Oct 2026 16:15:56 +0800
Message-ID: <cover.1792569583.git.wy@wyuan.org>
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


Changes in v2:

- Do not touch top-level labels, maybe deal with them later. (Dongliang)
- Still miss SPDX-Identifiers in some files by checkpatch, because we
  generally want our translation aligned with English version unless
  direct ack/instruction from original translators.


 [1/2] docs/zh_CN: remove translator-related headers
 [2/2] docs/zh_CN: remove Translator field in header template

 Documentation/translations/zh_CN/PCI/acpi-info.rst    |  7 -------
 Documentation/translations/zh_CN/PCI/index.rst        |  7 -------
 Documentation/translations/zh_CN/PCI/msi-howto.rst    |  8 --------
 .../translations/zh_CN/PCI/pci-iov-howto.rst          |  8 --------
 Documentation/translations/zh_CN/PCI/pci.rst          |  8 --------
 .../translations/zh_CN/PCI/pciebus-howto.rst          |  8 --------
 Documentation/translations/zh_CN/PCI/sysfs-pci.rst    |  8 --------
 .../zh_CN/accounting/delay-accounting.rst             |  2 --
 Documentation/translations/zh_CN/accounting/index.rst |  1 -
 Documentation/translations/zh_CN/accounting/psi.rst   |  1 -
 .../translations/zh_CN/accounting/taskstats.rst       |  2 --
 .../translations/zh_CN/admin-guide/README.rst         |  4 ----
 .../translations/zh_CN/admin-guide/bootconfig.rst     |  2 --
 .../translations/zh_CN/admin-guide/bug-bisect.rst     |  4 ----
 .../translations/zh_CN/admin-guide/bug-hunting.rst    |  4 ----
 .../translations/zh_CN/admin-guide/cputopology.rst    |  4 ----
 .../translations/zh_CN/admin-guide/index.rst          |  7 -------
 Documentation/translations/zh_CN/admin-guide/init.rst |  4 ----
 .../zh_CN/admin-guide/lockup-watchdogs.rst            |  1 -
 .../translations/zh_CN/admin-guide/mm/damon/index.rst |  6 ------
 .../zh_CN/admin-guide/mm/damon/lru_sort.rst           |  6 ------
 .../zh_CN/admin-guide/mm/damon/reclaim.rst            |  6 ------
 .../translations/zh_CN/admin-guide/mm/damon/start.rst |  6 ------
 .../translations/zh_CN/admin-guide/mm/damon/stat.rst  |  4 ----
 .../translations/zh_CN/admin-guide/mm/damon/usage.rst |  6 ------
 .../translations/zh_CN/admin-guide/mm/index.rst       |  5 -----
 .../translations/zh_CN/admin-guide/mm/ksm.rst         |  5 -----
 .../translations/zh_CN/admin-guide/module-signing.rst |  3 ---
 .../translations/zh_CN/admin-guide/numastat.rst       |  2 --
 .../zh_CN/admin-guide/reporting-issues.rst            |  5 -----
 .../zh_CN/admin-guide/reporting-regressions.rst       |  5 -----
 .../translations/zh_CN/admin-guide/sysrq.rst          |  8 --------
 .../zh_CN/admin-guide/tainted-kernels.rst             |  4 ----
 .../translations/zh_CN/admin-guide/unicode.rst        |  4 ----
 Documentation/translations/zh_CN/arch/arm64/amu.rst   |  2 --
 .../translations/zh_CN/arch/arm64/elf_hwcaps.rst      |  2 --
 .../translations/zh_CN/arch/arm64/hugetlbpage.rst     |  2 --
 Documentation/translations/zh_CN/arch/arm64/index.rst |  1 -
 Documentation/translations/zh_CN/arch/arm64/perf.rst  |  2 --
 .../translations/zh_CN/arch/loongarch/booting.rst     |  4 ----
 .../translations/zh_CN/arch/loongarch/features.rst    |  1 -
 .../translations/zh_CN/arch/loongarch/index.rst       |  1 -
 .../zh_CN/arch/loongarch/introduction.rst             |  1 -
 .../zh_CN/arch/loongarch/irq-chip-model.rst           |  1 -
 .../translations/zh_CN/arch/mips/booting.rst          |  4 ----
 .../translations/zh_CN/arch/mips/features.rst         |  4 ----
 Documentation/translations/zh_CN/arch/mips/index.rst  |  4 ----
 .../translations/zh_CN/arch/mips/ingenic-tcu.rst      |  4 ----
 .../translations/zh_CN/arch/openrisc/index.rst        |  4 ----
 .../zh_CN/arch/openrisc/openrisc_port.rst             |  4 ----
 .../translations/zh_CN/arch/openrisc/todo.rst         |  4 ----
 .../translations/zh_CN/arch/parisc/debugging.rst      |  4 ----
 .../translations/zh_CN/arch/parisc/index.rst          |  4 ----
 .../translations/zh_CN/arch/parisc/registers.rst      |  4 ----
 .../zh_CN/arch/riscv/boot-image-header.rst            |  4 ----
 Documentation/translations/zh_CN/arch/riscv/boot.rst  |  4 ----
 Documentation/translations/zh_CN/arch/riscv/index.rst |  4 ----
 .../zh_CN/arch/riscv/patch-acceptance.rst             |  4 ----
 .../translations/zh_CN/arch/riscv/vm-layout.rst       |  5 -----
 Documentation/translations/zh_CN/block/blk-mq.rst     |  8 --------
 .../translations/zh_CN/block/data-integrity.rst       |  6 ------
 Documentation/translations/zh_CN/block/index.rst      |  6 ------
 .../translations/zh_CN/core-api/assoc_array.rst       |  8 --------
 .../translations/zh_CN/core-api/boot-time-mm.rst      |  8 --------
 .../translations/zh_CN/core-api/cachetlb.rst          |  9 ---------
 .../translations/zh_CN/core-api/circular-buffers.rst  | 10 ----------
 .../translations/zh_CN/core-api/cpu_hotplug.rst       |  8 --------
 Documentation/translations/zh_CN/core-api/errseq.rst  |  8 --------
 .../translations/zh_CN/core-api/genalloc.rst          |  8 --------
 .../zh_CN/core-api/generic-radix-tree.rst             |  4 ----
 .../translations/zh_CN/core-api/genericirq.rst        |  8 --------
 .../zh_CN/core-api/gfp_mask-from-fs-io.rst            |  8 --------
 Documentation/translations/zh_CN/core-api/idr.rst     | 10 ----------
 Documentation/translations/zh_CN/core-api/index.rst   |  4 ----
 .../translations/zh_CN/core-api/irq/concepts.rst      |  4 ----
 .../translations/zh_CN/core-api/irq/index.rst         |  4 ----
 .../translations/zh_CN/core-api/irq/irq-affinity.rst  |  4 ----
 .../translations/zh_CN/core-api/irq/irq-domain.rst    |  5 -----
 .../zh_CN/core-api/irq/irqflags-tracing.rst           |  4 ----
 .../translations/zh_CN/core-api/kernel-api.rst        |  5 -----
 Documentation/translations/zh_CN/core-api/kobject.rst |  4 ----
 Documentation/translations/zh_CN/core-api/kref.rst    |  8 --------
 .../translations/zh_CN/core-api/local_ops.rst         |  4 ----
 .../translations/zh_CN/core-api/memory-allocation.rst |  8 --------
 .../translations/zh_CN/core-api/memory-hotplug.rst    |  8 --------
 Documentation/translations/zh_CN/core-api/mm-api.rst  |  9 ---------
 Documentation/translations/zh_CN/core-api/packing.rst | 10 ----------
 Documentation/translations/zh_CN/core-api/padata.rst  |  4 ----
 .../translations/zh_CN/core-api/printk-basics.rst     |  5 -----
 .../translations/zh_CN/core-api/printk-formats.rst    |  5 -----
 .../translations/zh_CN/core-api/protection-keys.rst   |  8 --------
 Documentation/translations/zh_CN/core-api/rbtree.rst  |  4 ----
 .../zh_CN/core-api/refcount-vs-atomic.rst             |  4 ----
 .../translations/zh_CN/core-api/symbol-namespaces.rst |  4 ----
 .../translations/zh_CN/core-api/this_cpu_ops.rst      |  8 --------
 .../zh_CN/core-api/unaligned-memory-access.rst        |  8 --------
 .../translations/zh_CN/core-api/watch_queue.rst       | 10 ----------
 .../translations/zh_CN/core-api/workqueue.rst         |  6 ------
 Documentation/translations/zh_CN/core-api/xarray.rst  |  9 ---------
 Documentation/translations/zh_CN/cpu-freq/core.rst    |  8 --------
 .../translations/zh_CN/cpu-freq/cpu-drivers.rst       |  8 --------
 .../translations/zh_CN/cpu-freq/cpufreq-stats.rst     |  8 --------
 Documentation/translations/zh_CN/cpu-freq/index.rst   |  4 ----
 Documentation/translations/zh_CN/dev-tools/gcov.rst   |  1 -
 .../zh_CN/dev-tools/gdb-kernel-debugging.rst          |  1 -
 Documentation/translations/zh_CN/dev-tools/index.rst  |  1 -
 Documentation/translations/zh_CN/dev-tools/kasan.rst  |  1 -
 Documentation/translations/zh_CN/dev-tools/kcov.rst   |  1 -
 Documentation/translations/zh_CN/dev-tools/kcsan.rst  |  1 -
 .../translations/zh_CN/dev-tools/kmemleak.rst         |  1 -
 Documentation/translations/zh_CN/dev-tools/kmsan.rst  |  1 -
 Documentation/translations/zh_CN/dev-tools/sparse.rst |  8 --------
 .../translations/zh_CN/dev-tools/testing-overview.rst |  1 -
 Documentation/translations/zh_CN/dev-tools/ubsan.rst  |  8 --------
 .../translations/zh_CN/devicetree/changesets.rst      |  7 -------
 .../zh_CN/devicetree/dynamic-resolution-notes.rst     |  6 ------
 Documentation/translations/zh_CN/devicetree/index.rst |  7 -------
 .../translations/zh_CN/devicetree/kernel-api.rst      |  7 -------
 .../translations/zh_CN/devicetree/of_unittest.rst     |  6 ------
 .../translations/zh_CN/devicetree/overlay-notes.rst   |  6 ------
 .../translations/zh_CN/devicetree/usage-model.rst     |  7 -------
 .../translations/zh_CN/doc-guide/checktransupdate.rst |  2 --
 .../translations/zh_CN/doc-guide/contributing.rst     |  2 --
 Documentation/translations/zh_CN/doc-guide/index.rst  |  2 --
 .../translations/zh_CN/doc-guide/kernel-doc.rst       |  2 --
 .../zh_CN/doc-guide/maintainer-profile.rst            |  2 --
 .../translations/zh_CN/doc-guide/parse-headers.rst    |  2 --
 Documentation/translations/zh_CN/doc-guide/sphinx.rst |  2 --
 .../translations/zh_CN/driver-api/gpio/index.rst      |  6 ------
 Documentation/translations/zh_CN/driver-api/index.rst |  6 ------
 .../translations/zh_CN/driver-api/io_ordering.rst     |  7 -------
 .../translations/zh_CN/driver-api/phy/phy.rst         |  4 ----
 .../translations/zh_CN/filesystems/debugfs.rst        | 11 -----------
 .../translations/zh_CN/filesystems/dnotify.rst        |  4 ----
 .../translations/zh_CN/filesystems/gfs2-glocks.rst    |  8 --------
 .../translations/zh_CN/filesystems/gfs2-uevents.rst   |  8 --------
 Documentation/translations/zh_CN/filesystems/gfs2.rst |  8 --------
 .../translations/zh_CN/filesystems/index.rst          |  1 -
 .../translations/zh_CN/filesystems/inotify.rst        |  4 ----
 .../translations/zh_CN/filesystems/tmpfs.rst          |  2 --
 .../zh_CN/filesystems/ubifs-authentication.rst        |  8 --------
 .../translations/zh_CN/filesystems/ubifs.rst          |  8 --------
 .../translations/zh_CN/filesystems/virtiofs.rst       |  7 -------
 Documentation/translations/zh_CN/how-to.rst           |  4 ----
 Documentation/translations/zh_CN/iio/ep93xx_adc.rst   |  4 ----
 Documentation/translations/zh_CN/iio/iio_configfs.rst |  4 ----
 Documentation/translations/zh_CN/iio/index.rst        |  4 ----
 .../translations/zh_CN/infiniband/core_locking.rst    |  9 ---------
 Documentation/translations/zh_CN/infiniband/index.rst |  9 ---------
 Documentation/translations/zh_CN/infiniband/ipoib.rst |  9 ---------
 Documentation/translations/zh_CN/infiniband/sysfs.rst |  9 ---------
 .../translations/zh_CN/infiniband/tag_matching.rst    |  9 ---------
 .../translations/zh_CN/infiniband/user_mad.rst        |  9 ---------
 .../translations/zh_CN/infiniband/user_verbs.rst      |  9 ---------
 .../translations/zh_CN/kbuild/gcc-plugins.rst         |  1 -
 .../translations/zh_CN/kbuild/headers_install.rst     |  1 -
 Documentation/translations/zh_CN/kbuild/index.rst     |  1 -
 Documentation/translations/zh_CN/kbuild/kbuild.rst    |  1 -
 Documentation/translations/zh_CN/kbuild/kconfig.rst   |  1 -
 Documentation/translations/zh_CN/kbuild/llvm.rst      |  1 -
 .../translations/zh_CN/kbuild/reproducible-builds.rst |  2 --
 .../translations/zh_CN/kernel-hacking/hacking.rst     |  4 ----
 .../translations/zh_CN/kernel-hacking/index.rst       |  4 ----
 Documentation/translations/zh_CN/locking/index.rst    |  4 ----
 .../translations/zh_CN/locking/mutex-design.rst       |  4 ----
 .../translations/zh_CN/locking/spinlocks.rst          |  4 ----
 .../translations/zh_CN/maintainer/configure-git.rst   |  4 ----
 .../zh_CN/maintainer/maintainer-entry-profile.rst     |  4 ----
 .../zh_CN/maintainer/modifying-patches.rst            |  4 ----
 .../translations/zh_CN/maintainer/pull-requests.rst   |  4 ----
 .../zh_CN/maintainer/rebasing-and-merging.rst         |  4 ----
 Documentation/translations/zh_CN/mm/active_mm.rst     |  7 -------
 Documentation/translations/zh_CN/mm/balance.rst       |  7 -------
 Documentation/translations/zh_CN/mm/damon/api.rst     |  7 -------
 Documentation/translations/zh_CN/mm/damon/design.rst  |  7 -------
 Documentation/translations/zh_CN/mm/damon/faq.rst     |  7 -------
 Documentation/translations/zh_CN/mm/damon/index.rst   |  7 -------
 .../translations/zh_CN/mm/free_page_reporting.rst     |  6 ------
 Documentation/translations/zh_CN/mm/highmem.rst       |  6 ------
 Documentation/translations/zh_CN/mm/hmm.rst           |  6 ------
 .../translations/zh_CN/mm/hugetlbfs_reserv.rst        |  6 ------
 Documentation/translations/zh_CN/mm/hwpoison.rst      |  7 -------
 Documentation/translations/zh_CN/mm/index.rst         |  6 ------
 Documentation/translations/zh_CN/mm/ksm.rst           |  4 ----
 Documentation/translations/zh_CN/mm/memory-model.rst  |  7 -------
 Documentation/translations/zh_CN/mm/mmu_notifier.rst  |  8 --------
 Documentation/translations/zh_CN/mm/numa.rst          |  7 -------
 .../translations/zh_CN/mm/overcommit-accounting.rst   |  8 --------
 Documentation/translations/zh_CN/mm/page_frags.rst    |  7 -------
 .../translations/zh_CN/mm/page_migration.rst          |  6 ------
 Documentation/translations/zh_CN/mm/page_owner.rst    |  7 -------
 .../translations/zh_CN/mm/page_table_check.rst        |  7 -------
 Documentation/translations/zh_CN/mm/page_tables.rst   |  6 ------
 .../translations/zh_CN/mm/physical_memory.rst         |  4 ----
 .../translations/zh_CN/mm/remap_file_pages.rst        |  7 -------
 .../translations/zh_CN/mm/split_page_table_lock.rst   |  7 -------
 .../translations/zh_CN/mm/vmalloced-kernel-stacks.rst |  6 ------
 Documentation/translations/zh_CN/mm/zsmalloc.rst      |  6 ------
 Documentation/translations/zh_CN/networking/alias.rst |  6 ------
 .../translations/zh_CN/networking/driver.rst          |  4 ----
 .../translations/zh_CN/networking/generic-hdlc.rst    |  4 ----
 Documentation/translations/zh_CN/networking/index.rst |  6 ------
 Documentation/translations/zh_CN/networking/ipv6.rst  |  4 ----
 .../translations/zh_CN/networking/mptcp-sysctl.rst    |  4 ----
 .../translations/zh_CN/networking/msg_zerocopy.rst    |  9 ---------
 Documentation/translations/zh_CN/networking/napi.rst  |  4 ----
 .../translations/zh_CN/networking/netif-msg.rst       |  4 ----
 .../translations/zh_CN/networking/netmem.rst          |  4 ----
 Documentation/translations/zh_CN/networking/secid.rst |  4 ----
 Documentation/translations/zh_CN/networking/sriov.rst |  4 ----
 Documentation/translations/zh_CN/networking/team.rst  |  4 ----
 .../translations/zh_CN/networking/timestamping.rst    |  4 ----
 Documentation/translations/zh_CN/networking/vxlan.rst |  9 ---------
 .../translations/zh_CN/networking/xfrm_proc.rst       |  4 ----
 Documentation/translations/zh_CN/peci/index.rst       |  6 ------
 Documentation/translations/zh_CN/peci/peci.rst        |  6 ------
 .../translations/zh_CN/power/energy-model.rst         |  4 ----
 Documentation/translations/zh_CN/power/index.rst      |  4 ----
 Documentation/translations/zh_CN/power/opp.rst        |  4 ----
 Documentation/translations/zh_CN/process/1.Intro.rst  |  8 --------
 .../translations/zh_CN/process/2.Process.rst          |  8 --------
 .../translations/zh_CN/process/3.Early-stage.rst      |  8 --------
 Documentation/translations/zh_CN/process/4.Coding.rst |  8 --------
 .../translations/zh_CN/process/5.Posting.rst          |  8 --------
 .../translations/zh_CN/process/6.Followthrough.rst    |  8 --------
 .../translations/zh_CN/process/7.AdvancedTopics.rst   |  8 --------
 .../translations/zh_CN/process/8.Conclusion.rst       |  7 -------
 .../translations/zh_CN/process/applying-patches.rst   |  4 ----
 .../zh_CN/process/code-of-conduct-interpretation.rst  |  1 -
 .../translations/zh_CN/process/code-of-conduct.rst    |  1 -
 .../translations/zh_CN/process/coding-style.rst       |  5 -----
 Documentation/translations/zh_CN/process/cve.rst      |  1 -
 .../zh_CN/process/development-process.rst             |  1 -
 .../translations/zh_CN/process/email-clients.rst      | 10 ----------
 .../zh_CN/process/embargoed-hardware-issues.rst       |  1 -
 Documentation/translations/zh_CN/process/howto.rst    | 11 -----------
 Documentation/translations/zh_CN/process/index.rst    |  4 ----
 .../zh_CN/process/kernel-driver-statement.rst         |  1 -
 .../zh_CN/process/kernel-enforcement-statement.rst    |  1 -
 .../translations/zh_CN/process/license-rules.rst      |  1 -
 .../translations/zh_CN/process/magic-number.rst       |  8 --------
 .../zh_CN/process/maintainer-pgp-guide.rst            |  7 -------
 .../translations/zh_CN/process/management-style.rst   |  1 -
 .../zh_CN/process/programming-language.rst            |  1 -
 .../zh_CN/process/researcher-guidelines.rst           |  3 ---
 .../translations/zh_CN/process/security-bugs.rst      |  5 -----
 .../zh_CN/process/stable-api-nonsense.rst             |  6 ------
 .../zh_CN/process/stable-kernel-rules.rst             | 10 ----------
 .../translations/zh_CN/process/submit-checklist.rst   |  3 ---
 .../translations/zh_CN/process/submitting-patches.rst | 10 ----------
 .../zh_CN/process/volatile-considered-harmful.rst     | 11 -----------
 .../translations/zh_CN/rust/arch-support.rst          |  4 ----
 .../translations/zh_CN/rust/coding-guidelines.rst     |  4 ----
 .../translations/zh_CN/rust/general-information.rst   |  5 -----
 Documentation/translations/zh_CN/rust/index.rst       |  4 ----
 Documentation/translations/zh_CN/rust/quick-start.rst |  5 -----
 Documentation/translations/zh_CN/rust/testing.rst     |  4 ----
 .../translations/zh_CN/scheduler/completion.rst       |  8 --------
 Documentation/translations/zh_CN/scheduler/index.rst  |  9 ---------
 .../translations/zh_CN/scheduler/sched-arch.rst       |  8 --------
 .../translations/zh_CN/scheduler/sched-bwc.rst        |  8 --------
 .../translations/zh_CN/scheduler/sched-capacity.rst   |  8 --------
 .../translations/zh_CN/scheduler/sched-debug.rst      |  4 ----
 .../translations/zh_CN/scheduler/sched-design-CFS.rst |  4 ----
 .../translations/zh_CN/scheduler/sched-domains.rst    |  8 --------
 .../translations/zh_CN/scheduler/sched-energy.rst     |  4 ----
 .../zh_CN/scheduler/sched-nice-design.rst             |  4 ----
 .../translations/zh_CN/scheduler/sched-stats.rst      |  4 ----
 .../translations/zh_CN/scheduler/schedutil.rst        |  4 ----
 Documentation/translations/zh_CN/scsi/index.rst       |  8 --------
 Documentation/translations/zh_CN/scsi/libsas.rst      |  6 ------
 .../zh_CN/scsi/link_power_management_policy.rst       |  8 --------
 .../translations/zh_CN/scsi/scsi-parameters.rst       |  8 --------
 Documentation/translations/zh_CN/scsi/scsi.rst        |  8 --------
 Documentation/translations/zh_CN/scsi/scsi_eh.rst     |  7 -------
 .../translations/zh_CN/scsi/scsi_mid_low_api.rst      |  8 --------
 .../translations/zh_CN/scsi/sd-parameters.rst         |  8 --------
 Documentation/translations/zh_CN/scsi/wd719x.rst      |  6 ------
 .../translations/zh_CN/security/IMA-templates.rst     |  3 ---
 Documentation/translations/zh_CN/security/SCTP.rst    |  3 ---
 .../translations/zh_CN/security/credentials.rst       |  3 ---
 Documentation/translations/zh_CN/security/digsig.rst  |  3 ---
 Documentation/translations/zh_CN/security/index.rst   |  4 ----
 Documentation/translations/zh_CN/security/ipe.rst     |  3 ---
 .../translations/zh_CN/security/keys/index.rst        |  3 ---
 .../translations/zh_CN/security/landlock.rst          |  4 ----
 .../translations/zh_CN/security/lsm-development.rst   |  3 ---
 Documentation/translations/zh_CN/security/lsm.rst     |  4 ----
 Documentation/translations/zh_CN/security/sak.rst     |  4 ----
 .../translations/zh_CN/security/secrets/coco.rst      |  4 ----
 .../translations/zh_CN/security/secrets/index.rst     |  2 --
 .../translations/zh_CN/security/self-protection.rst   |  4 ----
 Documentation/translations/zh_CN/security/siphash.rst |  4 ----
 .../zh_CN/security/snp-tdx-threat-model.rst           |  4 ----
 .../translations/zh_CN/security/tpm/index.rst         |  3 ---
 .../translations/zh_CN/security/tpm/tpm-security.rst  |  3 ---
 .../translations/zh_CN/security/tpm/tpm_event_log.rst |  3 ---
 .../translations/zh_CN/security/tpm/tpm_ftpm_tee.rst  |  3 ---
 .../translations/zh_CN/security/tpm/tpm_tis.rst       |  3 ---
 .../zh_CN/security/tpm/tpm_vtpm_proxy.rst             |  3 ---
 .../translations/zh_CN/security/tpm/xen-tpmfront.rst  |  3 ---
 .../translations/zh_CN/sound/hd-audio/controls.rst    |  2 --
 .../translations/zh_CN/sound/hd-audio/index.rst       |  2 --
 Documentation/translations/zh_CN/sound/index.rst      |  2 --
 Documentation/translations/zh_CN/staging/index.rst    |  4 ----
 .../translations/zh_CN/staging/speculation.rst        |  4 ----
 Documentation/translations/zh_CN/staging/xz.rst       |  4 ----
 Documentation/translations/zh_CN/subsystem-apis.rst   |  4 ----
 Documentation/translations/zh_CN/usb/CREDITS          |  7 -------
 Documentation/translations/zh_CN/usb/acm.rst          |  7 -------
 .../translations/zh_CN/usb/authorization.rst          |  7 -------
 Documentation/translations/zh_CN/usb/chipidea.rst     |  7 -------
 Documentation/translations/zh_CN/usb/dwc3.rst         |  7 -------
 Documentation/translations/zh_CN/usb/ehci.rst         |  7 -------
 Documentation/translations/zh_CN/usb/index.rst        |  7 -------
 Documentation/translations/zh_CN/usb/usbmon.rst       |  7 -------
 .../zh_CN/userspace-api/accelerators/ocxl.rst         |  4 ----
 .../translations/zh_CN/userspace-api/ebpf/index.rst   |  4 ----
 .../translations/zh_CN/userspace-api/ebpf/syscall.rst |  4 ----
 .../translations/zh_CN/userspace-api/futex2.rst       |  4 ----
 .../translations/zh_CN/userspace-api/index.rst        |  4 ----
 .../translations/zh_CN/userspace-api/no_new_privs.rst |  4 ----
 .../zh_CN/userspace-api/seccomp_filter.rst            |  4 ----
 .../zh_CN/userspace-api/sysfs-platform_profile.rst    |  4 ----
 Documentation/translations/zh_CN/virt/acrn/cpuid.rst  |  8 --------
 Documentation/translations/zh_CN/virt/acrn/index.rst  |  8 --------
 .../translations/zh_CN/virt/acrn/introduction.rst     |  8 --------
 .../translations/zh_CN/virt/acrn/io-request.rst       |  8 --------
 .../translations/zh_CN/virt/guest-halt-polling.rst    |  8 --------
 Documentation/translations/zh_CN/virt/index.rst       |  8 --------
 Documentation/translations/zh_CN/virt/ne_overview.rst |  8 --------
 .../translations/zh_CN/virt/paravirt_ops.rst          |  9 ---------
 332 files changed, 1705 deletions(-)

Range-diff against v1:
1:  a7c3af29fd17 ! 1:  d99d7c42d635 docs/zh_CN: remove translator-related headers
    @@ Commit message
         of time, as there have been multiple instances of requests to update the
         email address.
     
    -    Remove all the related fields to make our source clean.
    +    Remove the translator and proofreader credit fields from the headers.
     
         Suggested-by: Jonathan Corbet <corbet@lwn.net>
         Signed-off-by: Weijie Yuan <wy@wyuan.org>
    @@ Documentation/translations/zh_CN/PCI/pci-iov-howto.rst
     -
     -
     -
    --.. _cn_pci-iov-howto:
    --
    - ==========================
    - PCI Express I/O 虚拟化指南
    + .. _cn_pci-iov-howto:
    + 
      ==========================
     
      ## Documentation/translations/zh_CN/PCI/pci.rst ##
    @@ Documentation/translations/zh_CN/PCI/pci.rst
     -
     -
     -
    --.. _cn_PCI_pci.rst:
    --
    - ===================
    - 如何写Linux PCI驱动
    + .. _cn_PCI_pci.rst:
    + 
      ===================
     
      ## Documentation/translations/zh_CN/PCI/pciebus-howto.rst ##
    @@ Documentation/translations/zh_CN/PCI/pciebus-howto.rst
     -
     -
     -
    --.. _cn_pciebus-howto:
    --
    - ===========================
    - PCI Express端口总线驱动指南
    + .. _cn_pciebus-howto:
    + 
      ===========================
     
      ## Documentation/translations/zh_CN/PCI/sysfs-pci.rst ##
    @@ Documentation/translations/zh_CN/accounting/index.rst
      
      :Original: Documentation/accounting/index.rst
     -:Translator: Yang Yang <yang.yang29@zte.com.cn>
    --
    --.. _cn_accounting_index.rst:
    --
      
    - ====
    - 计数
    + .. _cn_accounting_index.rst:
    + 
     
      ## Documentation/translations/zh_CN/accounting/psi.rst ##
     @@
    @@ Documentation/translations/zh_CN/accounting/psi.rst
      
      :Original: Documentation/accounting/psi.rst
     -:Translator: Yang Yang <yang.yang29@zte.com.cn>
    --
    --.. _cn_psi.rst:
    --
      
    - =================
    - PSI——压力阻塞信息
    + .. _cn_psi.rst:
    + 
     
      ## Documentation/translations/zh_CN/accounting/taskstats.rst ##
     @@
    @@ Documentation/translations/zh_CN/admin-guide/lockup-watchdogs.rst
      
      :Original: Documentation/admin-guide/lockup-watchdogs.rst
     -:Translator: Hailong Liu <liu.hailong6@zte.com.cn>
    --
    --.. _cn_lockup-watchdogs:
    --
      
    - =================================================
    - Softlockup与hardlockup检测机制(又名:nmi_watchdog)
    + .. _cn_lockup-watchdogs:
    + 
     
      ## Documentation/translations/zh_CN/admin-guide/mm/damon/index.rst ##
     @@
    @@ Documentation/translations/zh_CN/admin-guide/sysrq.rst
     -
     - 司延腾 Yanteng Si <siyanteng@loongson.cn>
     -
    --.. _cn_admin-guide_sysrq:
    --
    - Linux 魔法系统请求键骇客
    - ========================
    + .. _cn_admin-guide_sysrq:
      
    + Linux 魔法系统请求键骇客
     
      ## Documentation/translations/zh_CN/admin-guide/tainted-kernels.rst ##
     @@
    @@ Documentation/translations/zh_CN/arch/arm64/index.rst
      
      :Original: :ref:`Documentation/arch/arm64/index.rst <arm64_index>`
     -:Translator: Bailu Lin <bailu.lin@vivo.com>
    --
    --.. _cn_arm64_index:
    --
      
    - ==========
    - ARM64 架构
    + .. _cn_arm64_index:
    + 
     
      ## Documentation/translations/zh_CN/arch/arm64/perf.rst ##
     @@
    @@ Documentation/translations/zh_CN/arch/mips/booting.rst
     -
     - 司延腾 Yanteng Si <siyanteng@loongson.cn>
     -
    --.. _cn_booting:
    --
    - BMIPS设备树引导
    - ------------------------
    + .. _cn_booting:
      
    + BMIPS设备树引导
     
      ## Documentation/translations/zh_CN/arch/mips/features.rst ##
     @@
    @@ Documentation/translations/zh_CN/arch/mips/features.rst
     -
     - 司延腾 Yanteng Si <siyanteng@loongson.cn>
     -
    --.. _cn_features:
    --
    + .. _cn_features:
    + 
      .. kernel-feat:: features mips
     
      ## Documentation/translations/zh_CN/arch/mips/index.rst ##
    @@ Documentation/translations/zh_CN/arch/mips/ingenic-tcu.rst
     -
     - 司延腾 Yanteng Si <siyanteng@loongson.cn>
     -
    --.. _cn_ingenic-tcu:
    --
    - ===============================================
    - 君正 JZ47xx SoC定时器/计数器硬件单元
    + .. _cn_ingenic-tcu:
    + 
      ===============================================
     
      ## Documentation/translations/zh_CN/arch/openrisc/index.rst ##
    @@ Documentation/translations/zh_CN/arch/openrisc/index.rst
     -
     - 司延腾 Yanteng Si <siyanteng@loongson.cn>
     -
    --.. _cn_openrisc_index:
    --
    - =================
    - OpenRISC 体系架构
    + .. _cn_openrisc_index:
    + 
      =================
     
      ## Documentation/translations/zh_CN/arch/openrisc/openrisc_port.rst ##
    @@ Documentation/translations/zh_CN/arch/openrisc/openrisc_port.rst
     -
     - 司延腾 Yanteng Si <siyanteng@loongson.cn>
     -
    --.. _cn_openrisc_port:
    --
    - ==============
    - OpenRISC Linux
    + .. _cn_openrisc_port:
    + 
      ==============
     
      ## Documentation/translations/zh_CN/arch/openrisc/todo.rst ##
    @@ Documentation/translations/zh_CN/arch/openrisc/todo.rst
     -
     - 司延腾 Yanteng Si <siyanteng@loongson.cn>
     -
    --.. _cn_openrisc_todo.rst:
    --
    - ========
    - 待办事项
    + .. _cn_openrisc_todo.rst:
    + 
      ========
     
      ## Documentation/translations/zh_CN/arch/parisc/debugging.rst ##
    @@ Documentation/translations/zh_CN/arch/parisc/debugging.rst
     -
     - 司延腾 Yanteng Si <siyanteng@loongson.cn>
     -
    --.. _cn_parisc_debugging:
    --
    - =================
    - 调试PA-RISC
    + .. _cn_parisc_debugging:
    + 
      =================
     
      ## Documentation/translations/zh_CN/arch/parisc/index.rst ##
    @@ Documentation/translations/zh_CN/arch/parisc/index.rst
     -
     - 司延腾 Yanteng Si <siyanteng@loongson.cn>
     -
    --.. _cn_parisc_index:
    --
    - ====================
    - PA-RISC体系架构
    + .. _cn_parisc_index:
    + 
      ====================
     
      ## Documentation/translations/zh_CN/arch/parisc/registers.rst ##
    @@ Documentation/translations/zh_CN/arch/parisc/registers.rst
     -
     - 司延腾 Yanteng Si <siyanteng@loongson.cn>
     -
    --.. _cn_parisc_registers:
    --
    - =========================
    - Linux/PA-RISC的寄存器用法
    + .. _cn_parisc_registers:
    + 
      =========================
     
      ## Documentation/translations/zh_CN/arch/riscv/boot-image-header.rst ##
    @@ Documentation/translations/zh_CN/arch/riscv/boot-image-header.rst
     -
     - 司延腾 Yanteng Si <siyanteng@loongson.cn>
     -
    --.. _cn_boot-image-header.rst:
    --
    - ==========================
    - RISC-V Linux启动镜像文件头
    + .. _cn_boot-image-header.rst:
    + 
      ==========================
     
      ## Documentation/translations/zh_CN/arch/riscv/boot.rst ##
    @@ Documentation/translations/zh_CN/arch/riscv/index.rst
     -
     - 司延腾 Yanteng Si <siyanteng@loongson.cn>
     -
    --.. _cn_riscv_index:
    --
    - ===============
    - RISC-V 体系结构
    + .. _cn_riscv_index:
    + 
      ===============
     
      ## Documentation/translations/zh_CN/arch/riscv/patch-acceptance.rst ##
    @@ Documentation/translations/zh_CN/arch/riscv/patch-acceptance.rst
     -
     - 司延腾 Yanteng Si <siyanteng@loongson.cn>
     -
    --.. _cn_riscv_patch-acceptance:
    --
    - arch/riscv 开发者维护指南
    - =========================
    + .. _cn_riscv_patch-acceptance:
      
    + arch/riscv 开发者维护指南
     
      ## Documentation/translations/zh_CN/arch/riscv/vm-layout.rst ##
     @@
    @@ Documentation/translations/zh_CN/block/blk-mq.rst
      ================================================
      多队列块设备 I/O 排队机制 (blk-mq)
      ================================================
    -@@ Documentation/translations/zh_CN/block/blk-mq.rst: I/O 请求完成了。
    - 
    - include/linux/blk-mq.h
    - 
    --block/blk-mq.c
    - \ No newline at end of file
    -+block/blk-mq.c
     
      ## Documentation/translations/zh_CN/block/data-integrity.rst ##
     @@
    @@ Documentation/translations/zh_CN/block/data-integrity.rst
      ==========
      数据完整性
      ==========
    -@@ Documentation/translations/zh_CN/block/data-integrity.rst: RAID0 和 RAID1 已受支持。而RAID4/5/6因涉及应用标签仍需额外的
    - 
    - ----------------------------------------------------------------------
    - 
    --2007-12-24 Martin K. Petersen <martin.petersen@oracle.com>
    - \ No newline at end of file
    -+2007-12-24 Martin K. Petersen <martin.petersen@oracle.com>
     
      ## Documentation/translations/zh_CN/block/index.rst ##
     @@
    @@ Documentation/translations/zh_CN/core-api/assoc_array.rst
     -
     -
     -
    --.. _cn_core-api_assoc_array:
    --
    - ==================
    - 通用关联数组的实现
    + .. _cn_core-api_assoc_array:
    + 
      ==================
     
      ## Documentation/translations/zh_CN/core-api/boot-time-mm.rst ##
    @@ Documentation/translations/zh_CN/core-api/boot-time-mm.rst
     -
     - 时奎亮 <alexs@kernel.org>
     -
    --.. _cn_core-api_boot-time-mm:
    --
    - ================
    - 启动时的内存管理
    + .. _cn_core-api_boot-time-mm:
    + 
      ================
     
      ## Documentation/translations/zh_CN/core-api/cachetlb.rst ##
    @@ Documentation/translations/zh_CN/core-api/cachetlb.rst
     -
     - 吴想成 Wu XiangCheng <bobwxc@email.cn>
     -
    --.. _cn_core-api_cachetlb:
    --
    - ======================
    - Linux下的缓存和TLB刷新
    + .. _cn_core-api_cachetlb:
    + 
      ======================
     
      ## Documentation/translations/zh_CN/core-api/circular-buffers.rst ##
    @@ Documentation/translations/zh_CN/core-api/cpu_hotplug.rst
     -:校译:
     -
     - 吴想成 Wu XiangCheng <bobwxc@email.cn>
    --
    --.. _cn_core_api_cpu_hotplug:
      
    - =================
    - 内核中的CPU热拔插
    + .. _cn_core_api_cpu_hotplug:
    + 
     
      ## Documentation/translations/zh_CN/core-api/errseq.rst ##
     @@
    @@ Documentation/translations/zh_CN/core-api/genalloc.rst
     -
     - 时奎亮 <alexs@kernel.org>
     -
    --.. _cn_core-api_genalloc:
    --
    - genalloc/genpool子系统
    - ======================
    + .. _cn_core-api_genalloc:
      
    + genalloc/genpool子系统
     
      ## Documentation/translations/zh_CN/core-api/generic-radix-tree.rst ##
     @@
    @@ Documentation/translations/zh_CN/core-api/genericirq.rst
     -
      .. include:: <isonum.txt>
      
    --.. _cn_core-api_genericirq:
    --
    - ================
    - Linux通用IRQ处理
    - ================
    + .. _cn_core-api_genericirq:
     
      ## Documentation/translations/zh_CN/core-api/gfp_mask-from-fs-io.rst ##
     @@
    @@ Documentation/translations/zh_CN/core-api/gfp_mask-from-fs-io.rst
     -
     - 时奎亮 <alexs@kernel.org>
     -
    --.. _cn_core-api_gfp_mask-from-fs-io:
    --
    - ============================
    - 从FS/IO上下文中使用的GFP掩码
    + .. _cn_core-api_gfp_mask-from-fs-io:
    + 
      ============================
     
      ## Documentation/translations/zh_CN/core-api/idr.rst ##
    @@ Documentation/translations/zh_CN/core-api/index.rst
     -
     - 司延腾 Yanteng Si <siyanteng@loongson.cn>
     -
    --.. _cn_core-api_index.rst:
    --
    - ===========
    - 核心API文档
    + .. _cn_core-api_index.rst:
    + 
      ===========
     
      ## Documentation/translations/zh_CN/core-api/irq/concepts.rst ##
    @@ Documentation/translations/zh_CN/core-api/irq/concepts.rst
     -
     - 司延腾 Yanteng Si <siyanteng@loongson.cn>
     -
    --.. _cn_concepts.rst:
    --
    - ===========
    - 什么是IRQ？
    + .. _cn_concepts.rst:
    + 
      ===========
     
      ## Documentation/translations/zh_CN/core-api/irq/index.rst ##
    @@ Documentation/translations/zh_CN/core-api/irq/index.rst
     -
     - 司延腾 Yanteng Si <siyanteng@loongson.cn>
     -
    --.. _cn_irq_index.rst:
    --
    --
    - ====
    - IRQs
    - ====
    + .. _cn_irq_index.rst:
    + 
    + 
     
      ## Documentation/translations/zh_CN/core-api/irq/irq-affinity.rst ##
     @@
    @@ Documentation/translations/zh_CN/core-api/irq/irq-affinity.rst
     -
     - 司延腾 Yanteng Si <siyanteng@loongson.cn>
     -
    --.. _cn_irq-affinity.rst:
    --
    - ==============
    - SMP IRQ 亲和性
    + .. _cn_irq-affinity.rst:
    + 
      ==============
     
      ## Documentation/translations/zh_CN/core-api/irq/irq-domain.rst ##
    @@ Documentation/translations/zh_CN/core-api/irq/irq-domain.rst
     - 司延腾 Yanteng Si <siyanteng@loongson.cn>
     - 周彬彬 Binbin Zhou <zhoubinbin@loongson.cn>
     -
    --.. _cn_irq-domain.rst:
    --
    - =======================
    - irq_domain 中断号映射库
    + .. _cn_irq-domain.rst:
    + 
      =======================
     
      ## Documentation/translations/zh_CN/core-api/irq/irqflags-tracing.rst ##
    @@ Documentation/translations/zh_CN/core-api/irq/irqflags-tracing.rst
     -
     - 司延腾 Yanteng Si <siyanteng@loongson.cn>
     -
    --.. _cn_irqflags-tracing.rst:
    --
    - =================
    - IRQ-flags状态追踪
    + .. _cn_irqflags-tracing.rst:
    + 
      =================
     
      ## Documentation/translations/zh_CN/core-api/kernel-api.rst ##
    @@ Documentation/translations/zh_CN/core-api/kernel-api.rst
     - 司延腾 Yanteng Si <siyanteng@loongson.cn>
     - 周彬彬 Binbin Zhou <zhoubinbin@loongson.cn>
     -
    --.. _cn_kernel-api.rst:
    --
    - ============
    - Linux内核API
    + .. _cn_kernel-api.rst:
    + 
      ============
     
      ## Documentation/translations/zh_CN/core-api/kobject.rst ##
    @@ Documentation/translations/zh_CN/core-api/kobject.rst
     -
     - 司延腾 Yanteng Si <siyanteng@loongson.cn>
     -
    --.. _cn_core_api_kobject.rst:
    --
    - =======================================================
    - 关于kobjects、ksets和ktypes的一切你没想过需要了解的东西
    + .. _cn_core_api_kobject.rst:
    + 
      =======================================================
     
      ## Documentation/translations/zh_CN/core-api/kref.rst ##
    @@ Documentation/translations/zh_CN/core-api/kref.rst
     -
     - <此处请校译员签名（自愿），我将在下一个版本添加>
     -
    --.. _cn_core_api_kref.rst:
    --
    - =================================
    - 为内核对象添加引用计数器（krefs）
    + .. _cn_core_api_kref.rst:
    + 
      =================================
     
      ## Documentation/translations/zh_CN/core-api/local_ops.rst ##
    @@ Documentation/translations/zh_CN/core-api/local_ops.rst
     -
     - 司延腾 Yanteng Si <siyanteng@loongson.cn>
     -
    --.. _cn_local_ops:
    --
    - ========================
    - 本地原子操作的语义和行为
    + .. _cn_local_ops:
    + 
      ========================
     
      ## Documentation/translations/zh_CN/core-api/memory-allocation.rst ##
    @@ Documentation/translations/zh_CN/core-api/memory-allocation.rst
     -
     - 时奎亮 <alexs@kernel.org>
     -
    --.. _cn_core-api_memory-allocation:
    --
    - ============
    - 内存分配指南
    + .. _cn_core-api_memory-allocation:
    + 
      ============
     
      ## Documentation/translations/zh_CN/core-api/memory-hotplug.rst ##
    @@ Documentation/translations/zh_CN/core-api/memory-hotplug.rst
     -
     - 吴想成 Wu XiangCheng <bobwxc@email.cn>
     -
    --.. _cn_core-api_memory-hotplug:
    --
    - ==========
    - 内存热插拔
    + .. _cn_core-api_memory-hotplug:
    + 
      ==========
     
      ## Documentation/translations/zh_CN/core-api/mm-api.rst ##
    @@ Documentation/translations/zh_CN/core-api/mm-api.rst
     -
     - 时奎亮<alexs@kernel.org>
     -
    --.. _cn_core-api_mm-api:
    --
    - ============
    - 内存管理APIs
    + .. _cn_core-api_mm-api:
    + 
      ============
     
      ## Documentation/translations/zh_CN/core-api/packing.rst ##
    @@ Documentation/translations/zh_CN/core-api/padata.rst
     -
     - 司延腾 Yanteng Si <siyanteng@loongson.cn>
     -
    --.. _cn_core_api_padata.rst:
    --
    - ==================
    - padata并行执行机制
    + .. _cn_core_api_padata.rst:
    + 
      ==================
     
      ## Documentation/translations/zh_CN/core-api/printk-basics.rst ##
    @@ Documentation/translations/zh_CN/core-api/printk-basics.rst
     - 司延腾 Yanteng Si <siyanteng@loongson.cn>
     - 周彬彬 Binbin Zhou <zhoubinbin@loongson.cn>
     -
    --.. _cn_printk-basics.rst:
    --
    - ==================
    - 使用printk记录消息
    + .. _cn_printk-basics.rst:
    + 
      ==================
     
      ## Documentation/translations/zh_CN/core-api/printk-formats.rst ##
    @@ Documentation/translations/zh_CN/core-api/printk-formats.rst
     - 司延腾 Yanteng Si <siyanteng@loongson.cn>
     - 周彬彬 Binbin Zhou <zhoubinbin@loongson.cn>
     -
    --.. _cn_printk-formats.rst:
    --
    - ==============================
    - 如何获得正确的printk格式占位符
    + .. _cn_printk-formats.rst:
    + 
      ==============================
     
      ## Documentation/translations/zh_CN/core-api/protection-keys.rst ##
    @@ Documentation/translations/zh_CN/core-api/protection-keys.rst
     -
     - 吴想成 Wu XiangCheng <bobwxc@email.cn>
     -
    --.. _cn_core-api_protection-keys:
    --
    - ============
    - 内存保护密钥
    + .. _cn_core-api_protection-keys:
    + 
      ============
     
      ## Documentation/translations/zh_CN/core-api/rbtree.rst ##
    @@ Documentation/translations/zh_CN/core-api/refcount-vs-atomic.rst
     -
     - 司延腾 Yanteng Si <siyanteng@loongson.cn>
     -
    --.. _cn_refcount-vs-atomic:
    --
    - =======================================
    - 与atomic_t相比，refcount_t的API是这样的
    + .. _cn_refcount-vs-atomic:
    + 
      =======================================
     
      ## Documentation/translations/zh_CN/core-api/symbol-namespaces.rst ##
    @@ Documentation/translations/zh_CN/core-api/symbol-namespaces.rst
     -
     - 司延腾 Yanteng Si <siyanteng@loongson.cn>
     -
    --.. _cn_symbol-namespaces.rst:
    --
    - =================================
    - 符号命名空间（Symbol Namespaces）
    + .. _cn_symbol-namespaces.rst:
    + 
      =================================
     
      ## Documentation/translations/zh_CN/core-api/this_cpu_ops.rst ##
    @@ Documentation/translations/zh_CN/core-api/unaligned-memory-access.rst
     -
     - 时奎亮 <alexs@kernel.org>
     -
    --.. _cn_core-api_unaligned-memory-access:
    --
    - ==============
    - 非对齐内存访问
    + .. _cn_core-api_unaligned-memory-access:
    + 
      ==============
     
      ## Documentation/translations/zh_CN/core-api/watch_queue.rst ##
    @@ Documentation/translations/zh_CN/core-api/workqueue.rst
     - 周彬彬 Binbin Zhou <zhoubinbin@loongson.cn>
     - 陈兴友 Xingyou Chen <rockrush@rockwork.org>
     -
    --.. _cn_workqueue.rst:
    --
    - ========
    - 工作队列
    + .. _cn_workqueue.rst:
    + 
      ========
     
      ## Documentation/translations/zh_CN/core-api/xarray.rst ##
    @@ Documentation/translations/zh_CN/core-api/xarray.rst
     -
     -
     -
    --.. _cn_core-api_xarray:
    --
    - ======
    - XArray
    + .. _cn_core-api_xarray:
    + 
      ======
     
      ## Documentation/translations/zh_CN/cpu-freq/core.rst ##
    @@ Documentation/translations/zh_CN/cpu-freq/index.rst
     -
     - 司延腾 Yanteng Si <siyanteng@loongson.cn>
     -
    --.. _cn_index.rst:
    --
    - =======================================================
    - Linux CPUFreq - Linux(TM)内核中的CPU频率和电压升降代码
    + .. _cn_index.rst:
    + 
      =======================================================
     
      ## Documentation/translations/zh_CN/dev-tools/gcov.rst ##
    @@ Documentation/translations/zh_CN/dev-tools/kmsan.rst
      内核内存消毒剂（KMSAN）
     
      ## Documentation/translations/zh_CN/dev-tools/sparse.rst ##
    -@@
    --﻿Copyright 2004 Linus Torvalds
    -+Copyright 2004 Linus Torvalds
    - Copyright 2004 Pavel Machek <pavel@ucw.cz>
    - Copyright 2006 Bob Copeland <me@bobcopeland.com>
    - 
     @@ Documentation/translations/zh_CN/dev-tools/sparse.rst: Copyright 2006 Bob Copeland <me@bobcopeland.com>
      
      :Original: Documentation/dev-tools/sparse.rst
    @@ Documentation/translations/zh_CN/dev-tools/sparse.rst: Copyright 2006 Bob Copela
     -
     - 司延腾 Yanteng Si <siyanteng@loongson.cn>
     -
    --.. _cn_sparse:
    --
    + .. _cn_sparse:
    + 
      Sparse
    - ======
    - 
    -@@ Documentation/translations/zh_CN/dev-tools/sparse.rst: __releases  - 指定的锁在函数进入时被持有，但在退出时不被持
    - make 的可选变量 CHECKFLAGS 可以用来向 sparse 工具传递参数。编译系统会自
    - 动向 sparse 工具传递 -Wbitwise 参数。
    - 
    --注意sparse定义了__CHECKER__预处理器符号。
    - \ No newline at end of file
    -+注意sparse定义了__CHECKER__预处理器符号。
     
      ## Documentation/translations/zh_CN/dev-tools/testing-overview.rst ##
     @@
    @@ Documentation/translations/zh_CN/filesystems/index.rst
      
      :Original: :ref:`Documentation/filesystems/index.rst <filesystems_index>`
     -:Translator: Wang Wenhu <wenhu.wang@vivo.com>
    --
    --.. _cn_filesystems_index:
      
    - ========================
    - Linux Kernel中的文件系统
    + .. _cn_filesystems_index:
    + 
     
      ## Documentation/translations/zh_CN/filesystems/inotify.rst ##
     @@
    @@ Documentation/translations/zh_CN/iio/ep93xx_adc.rst
     -
     - 司延腾 Yanteng Si <siyanteng@loongson.cn>
     -
    --.. _cn_iio_ep93xx_adc:
    --
    - ==================================
    - 思睿逻辑 EP93xx 模拟数字转换器驱动
    + .. _cn_iio_ep93xx_adc:
    + 
      ==================================
     
      ## Documentation/translations/zh_CN/iio/iio_configfs.rst ##
    @@ Documentation/translations/zh_CN/iio/iio_configfs.rst
     -
     - 司延腾 Yanteng Si <siyanteng@loongson.cn>
     -
    --.. _cn_iio_configfs:
    --
    - =====================
    - 工业 IIO configfs支持
    + .. _cn_iio_configfs:
    + 
      =====================
     
      ## Documentation/translations/zh_CN/iio/index.rst ##
    @@ Documentation/translations/zh_CN/iio/index.rst
     -
     - 司延腾 Yanteng Si <siyanteng@loongson.cn>
     -
    --.. _cn_iio_index:
    --
    - ========
    - 工业 I/O
    + .. _cn_iio_index:
    + 
      ========
     
      ## Documentation/translations/zh_CN/infiniband/core_locking.rst ##
    @@ Documentation/translations/zh_CN/infiniband/core_locking.rst
     - 王普宇 Puyu Wang <realpuyuwang@gmail.com>
     - 时奎亮 Alex Shi <alexs@kernel.org>
     -
    --.. _cn_infiniband_core_locking:
    --
    - ==================
    - infiniband中间层锁
    + .. _cn_infiniband_core_locking:
    + 
      ==================
     
      ## Documentation/translations/zh_CN/infiniband/index.rst ##
    @@ Documentation/translations/zh_CN/infiniband/index.rst
     - 王普宇 Puyu Wang <realpuyuwang@gmail.com>
     - 时奎亮 Alex Shi <alexs@kernel.org>
     -
    --.. _cn_infiniband_index:
    --
    - ==========
    - infiniband
    + .. _cn_infiniband_index:
    + 
      ==========
     
      ## Documentation/translations/zh_CN/infiniband/ipoib.rst ##
    @@ Documentation/translations/zh_CN/infiniband/ipoib.rst
     - 王普宇 Puyu Wang <realpuyuwang@gmail.com>
     - 时奎亮 Alex Shi <alexs@kernel.org>
     -
    --.. _cn_infiniband_ipoib:
    --
    - =========================
    - infiniband上的IP（IPoIB）
    + .. _cn_infiniband_ipoib:
    + 
      =========================
     
      ## Documentation/translations/zh_CN/infiniband/sysfs.rst ##
    @@ Documentation/translations/zh_CN/infiniband/sysfs.rst
     - 王普宇 Puyu Wang <realpuyuwang@gmail.com>
     - 时奎亮 Alex Shi <alexs@kernel.org>
     -
    --.. _cn_infiniband_sysfs:
    --
    - =========
    - Sysfs文件
    + .. _cn_infiniband_sysfs:
    + 
      =========
     
      ## Documentation/translations/zh_CN/infiniband/tag_matching.rst ##
    @@ Documentation/translations/zh_CN/infiniband/tag_matching.rst
     - 王普宇 Puyu Wang <realpuyuwang@gmail.com>
     - 时奎亮 Alex Shi <alexs@kernel.org>
     -
    --.. _cn_infiniband_tag_matching:
    --
    - ============
    - 标签匹配逻辑
    + .. _cn_infiniband_tag_matching:
    + 
      ============
     
      ## Documentation/translations/zh_CN/infiniband/user_mad.rst ##
    @@ Documentation/translations/zh_CN/infiniband/user_mad.rst
     - 王普宇 Puyu Wang <realpuyuwang@gmail.com>
     - 时奎亮 Alex Shi <alexs@kernel.org>
     -
    --.. _cn_infiniband_user_mad:
    --
    - ===============
    - 用户空间MAD访问
    + .. _cn_infiniband_user_mad:
    + 
      ===============
     
      ## Documentation/translations/zh_CN/infiniband/user_verbs.rst ##
    @@ Documentation/translations/zh_CN/infiniband/user_verbs.rst
     - 王普宇 Puyu Wang <realpuyuwang@gmail.com>
     - 时奎亮 Alex Shi <alexs@kernel.org>
     -
    --.. _cn_infiniband_user_verbs:
    --
    - =================
    - 用户空间verbs访问
    + .. _cn_infiniband_user_verbs:
    + 
      =================
     
      ## Documentation/translations/zh_CN/kbuild/gcc-plugins.rst ##
    @@ Documentation/translations/zh_CN/process/1.Intro.rst
     -
     - 吴想成 Wu XiangCheng <bobwxc@email.cn>
     -
    --.. _cn_development_process_intro:
    --
    - 引言
    - ====
    + .. _cn_development_process_intro:
      
    + 引言
     
      ## Documentation/translations/zh_CN/process/2.Process.rst ##
     @@
    @@ Documentation/translations/zh_CN/process/development-process.rst
      
      :Original: :ref:`Documentation/process/development-process.rst <development_process_main>`
     -:Translator: Alex Shi <alex.shi@linux.alibaba.com>
    --
    --.. _cn_development_process_main:
      
    - 内核开发过程指南
    - ================
    + .. _cn_development_process_main:
    + 
     
      ## Documentation/translations/zh_CN/process/email-clients.rst ##
     @@
    @@ Documentation/translations/zh_CN/process/embargoed-hardware-issues.rst
     
      ## Documentation/translations/zh_CN/process/howto.rst ##
     @@
    --﻿.. _cn_process_howto:
    -+.. _cn_process_howto:
    - 
    - .. include:: ../disclaimer-zh_CN.rst
      
      :Original: :ref:`Documentation/process/howto.rst <process_howto>`
      
    @@ Documentation/translations/zh_CN/process/index.rst
     
      ## Documentation/translations/zh_CN/process/kernel-driver-statement.rst ##
     @@
    --.. _cn_process_statement_driver:
    --
      .. include:: ../disclaimer-zh_CN.rst
      
      :Original: :ref:`Documentation/process/kernel-driver-statement.rst <process_statement_driver>`
    @@ Documentation/translations/zh_CN/process/kernel-driver-statement.rst
     
      ## Documentation/translations/zh_CN/process/kernel-enforcement-statement.rst ##
     @@
    --﻿.. _cn_process_statement_kernel:
    --
    --.. include:: ../disclaimer-zh_CN.rst
    -+﻿.. include:: ../disclaimer-zh_CN.rst
    + .. include:: ../disclaimer-zh_CN.rst
      
      :Original: :ref:`Documentation/process/kernel-enforcement-statement.rst <process_statement_kernel>`
     -:Translator: Alex Shi <alex.shi@linux.alibaba.com>
    @@ Documentation/translations/zh_CN/process/programming-language.rst
      ## Documentation/translations/zh_CN/process/researcher-guidelines.rst ##
     @@
      
    - .. include:: ../disclaimer-zh_CN.rst
    - 
    --.. _cn_researcherguidelines:
    --
      :Original: Documentation/process/researcher-guidelines.rst
      
     -:译者:
    @@ Documentation/translations/zh_CN/process/stable-api-nonsense.rst
     
      ## Documentation/translations/zh_CN/process/stable-kernel-rules.rst ##
     @@
    --.. _cn_stable_kernel_rules:
    --
    - .. include:: ../disclaimer-zh_CN.rst
      
      :Original: :ref:`Documentation/process/stable-kernel-rules.rst <stable_kernel_rules>`
      
    @@ Documentation/translations/zh_CN/process/submitting-patches.rst
     
      ## Documentation/translations/zh_CN/process/volatile-considered-harmful.rst ##
     @@
    --.. _cn_volatile_considered_harmful:
    --
    - .. include:: ../disclaimer-zh_CN.rst
    - 
      :Original: :ref:`Documentation/process/volatile-considered-harmful.rst
                 <volatile_considered_harmful>`
      
    @@ Documentation/translations/zh_CN/virt/acrn/cpuid.rst
     -
     - 时奎亮 Alex Shi <alexs@kernel.org>
     -
    --.. _cn_virt_acrn_cpuid:
    --
    - ==============
    - ACRN CPUID位域
    + .. _cn_virt_acrn_cpuid:
    + 
      ==============
     
      ## Documentation/translations/zh_CN/virt/acrn/index.rst ##
    @@ Documentation/translations/zh_CN/virt/acrn/index.rst
     -
     - 时奎亮 Alex Shi <alexs@kernel.org>
     -
    --.. _cn_virt_acrn_index:
    --
    - ==============
    - ACRN超级管理器
    + .. _cn_virt_acrn_index:
    + 
      ==============
     
      ## Documentation/translations/zh_CN/virt/acrn/introduction.rst ##
    @@ Documentation/translations/zh_CN/virt/acrn/introduction.rst
     -
     - 时奎亮 Alex Shi <alexs@kernel.org>
     -
    --.. _cn_virt_acrn_introduction:
    --
    - ACRN超级管理器介绍
    - ==================
    + .. _cn_virt_acrn_introduction:
      
    + ACRN超级管理器介绍
     
      ## Documentation/translations/zh_CN/virt/acrn/io-request.rst ##
     @@
    @@ Documentation/translations/zh_CN/virt/acrn/io-request.rst
     -
     - 时奎亮 Alex Shi <alexs@kernel.org>
     -
    --.. _cn_virt_acrn_io-request:
    --
    - I/O请求处理
    - ===========
    + .. _cn_virt_acrn_io-request:
      
    + I/O请求处理
     
      ## Documentation/translations/zh_CN/virt/guest-halt-polling.rst ##
     @@
    @@ Documentation/translations/zh_CN/virt/guest-halt-polling.rst
     -
     - 时奎亮 Alex Shi <alexs@kernel.org>
     -
    --.. _cn_virt_guest-halt-polling:
    --
    - ========================================
    - 客户机停机轮询机制（Guest halt polling）
    + .. _cn_virt_guest-halt-polling:
    + 
      ========================================
     
      ## Documentation/translations/zh_CN/virt/index.rst ##
    @@ Documentation/translations/zh_CN/virt/index.rst
     -
     - 时奎亮 Alex Shi <alexs@kernel.org>
     -
    --.. _cn_virt_index:
    --
    - ===============
    - Linux虚拟化支持
    + .. _cn_virt_index:
    + 
      ===============
     
      ## Documentation/translations/zh_CN/virt/ne_overview.rst ##
    @@ Documentation/translations/zh_CN/virt/ne_overview.rst
     -
     - 时奎亮 Alex Shi <alexs@kernel.org>
     -
    --.. _cn_virt_ne_overview:
    --
    - ==============
    - Nitro Enclaves
    + .. _cn_virt_ne_overview:
    + 
      ==============
     
      ## Documentation/translations/zh_CN/virt/paravirt_ops.rst ##
    @@ Documentation/translations/zh_CN/virt/paravirt_ops.rst
     - 陈飞杨 Feiyang Chen <chenfeiyang@loongson.cn>
     - 时奎亮 Alex Shi <alexs@kernel.org>
     -
    --.. _cn_virt_paravirt_ops:
    --
    - ============
    - 半虚拟化操作
    + .. _cn_virt_paravirt_ops:
    + 
      ============
2:  68789e7cda71 = 2:  89d676d79f25 docs/zh_CN: remove Translator field in header template
-- 
2.56.0.379.gc618271300

