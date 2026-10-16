Received: from mta0.migadu.com (out-76.mta0.migadu.com [91.218.175.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A80F5304BA
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 16:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792169612; cv=none; b=AP3Kg6N52hrklgMlqtcB5bXLpnnNbfSwsPCMIoWMj9muVoraKvV2pcwlV8369ug9fApfmZDmltFsLtBXMGq9F0uBs3G/3FXYHosCpfWrx+LdGRi4ALuw5Rbu2mGLJNgZoWmMKR7jiJmYiFaPxKMtDCmEJuh+0ezD7Hvw1erNSt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792169612; c=relaxed/simple;
	bh=qdVvrno0uI6CmoB+pvpdOaOp6KsQhRzcZl1P6TGfLpQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eztYNGlp3vBym11arvt8ID5B9vUpH4RUOA/bXl8SBdltO4UHSBJ7zQEfO27na95V8uI666pfZGIv3DysbFu/oqjQISAW3PBSz3bL9DNEsI6GiypG6LMitbwcfyanDzSHbRYz9tNDTYdxt8l8XbBez1886fSsHEqs5iaYz4fo5Bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=yZ5DC/k/; arc=none smtp.client-ip=91.218.175.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="yZ5DC/k/"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=qdVvrno0uI6CmoB+pvpdOaOp6KsQhRzcZl1P6TGfLpQ=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792169600; v=1; x=1792774400;
 b=yZ5DC/k/fqTJoLJqxnxv3vTHgsoROBINQShd7oJiMWLPRXJzJvaDZnWpRAr1r5QKLfzzbRF+
 SL96WDckqsTPynVR70APyFe7SXoUhYJdsrfu8kwo3zqMJ3YdO9MNq1KctqsR12KxZvnW/bXBY7h
 KGIiuoL2SI1frfnCuB8XTvKvM+DzuGLVUN7UrEYw2PAYTL3WhvGVHSfXMUs2veh71k7pEvCLYgp
 6v/vtZdr8a/WumEbWAM63oZX+bS1g4u710S3Stct0aZGm50CmvFqRRfH1e42RxnYHfoETkQqbBR
 AGckm5GkiTTDTapg8k6tLpwvtsBQ7w+pfKRWlRfUg2FGg==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 21c67759e4b3a518;
	Fri, 16 Oct 2026 16:53:20 +0000
X-Mizu-Trace-ID: 21c67759e4b3a518
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
	2023002089@link.tyut.edu.cn,
	alex.shi@linux.alibaba.com,
	baikefan@leap-io-kernel.com,
	bailu.lin@vivo.com,
	benx.guo@gmail.com,
	bernard@vivo.com,
	bobwxc@email.cn,
	bryan.wu@analog.com,
	businiaoanka@anka1.top,
	chenfeiyang@loongson.cn,
	chenhuacai@loongson.cn,
	chenqi@beyondsoft.com,
	chris.wei.cui@gmail.com,
	doehyunbaek@gmail.com,
	doubled@leap-io-kernel.com,
	e12051@motorola.com,
	eugeneteo@kernel.sg,
	fan.yu9@zte.com.cn,
	gaochao49@huawei.com,
	greg@kroah.com,
	harryxiyou@gmail.com,
	he.peilin@zte.com.cn,
	hidave.darkstar@gmail.com,
	huang.junhua@zte.com.cn,
	huangjianghui@uniontech.com,
	kezijie@leap-io-kernel.com,
	leoyang.li@nxp.com,
	linyongting@gmail.com,
	liu.hailong6@zte.com.cn,
	longjin@dragonos.org,
	luochucheng@vivo.com,
	maoyuxian@cqsoftware.com.cn,
	martin.petersen@oracle.com,
	me@lirui.org,
	qiu.yutan@zte.com.cn,
	r0bertz@gentoo.org,
	realpuyuwang@gmail.com,
	rockrush@rockwork.org,
	shao.mingyin@zte.com.cn,
	siyanteng@loongson.cn,
	sun.yuxi@zte.com.cn,
	synmyth@gmail.com,
	tangyeechou@gmail.com,
	theandy.deng@gmail.com,
	tttturtleruss@hust.edu.cn,
	wang.longjie1@zte.com.cn,
	wang.yaxin@zte.com.cn,
	wangqing@vivo.com,
	wangxiaochen0@gmail.com,
	wangyuli@uniontech.com,
	wanjiabing@vivo.com,
	wenhu.wang@vivo.com,
	wodemia@linux.alibaba.com,
	wy@wyuan.org,
	xiyou.wangcong@gmail.com,
	xu.xin16@zte.com.cn,
	xxx.phy@gmail.com,
	yang.tao172@zte.com.cn,
	yang.yang29@zte.com.cn,
	yaxinsn@163.com,
	yjzhang@leap-io-kernel.com,
	zangleigang@hisilicon.com,
	zhangwei@cqsoftware.com.cn,
	zhaoshuo@cqsoftware.com.cn,
	zhaoyuehui@cqsoftware.com.cn,
	zhoubinbin@loongson.cn,
	zhuyan2015@qq.com,
	zpenya1314@gmail.com
Subject: [PATCH 0/2] docs/zh_CN: cleanup headers and fix minor issues
Date: Sat, 17 Oct 2026 00:52:31 +0800
Message-ID: <cover.1792167855.git.wy@wyuan.org>
X-Mailer: git-send-email 2.56.0.379.gc618271300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As discussed in [1], the Translator field (and related ones) is
repetitive, redundant and difficult to maintain.

Let's remove them to make our source clean.

[1] https://lore.kernel.org/linux-doc/87o6cvrs27.fsf@trenco.lwn.net/

 [1/2] docs/zh_CN: remove translator-related headers
 [2/2] docs/zh_CN: remove Translator field in header template

 Documentation/translations/zh_CN/PCI/acpi-info.rst |  7 -------
 Documentation/translations/zh_CN/PCI/index.rst     |  7 -------
 Documentation/translations/zh_CN/PCI/msi-howto.rst |  8 --------
 .../translations/zh_CN/PCI/pci-iov-howto.rst       | 10 ----------
 Documentation/translations/zh_CN/PCI/pci.rst       | 10 ----------
 .../translations/zh_CN/PCI/pciebus-howto.rst       | 10 ----------
 Documentation/translations/zh_CN/PCI/sysfs-pci.rst |  8 --------
 .../zh_CN/accounting/delay-accounting.rst          |  2 --
 .../translations/zh_CN/accounting/index.rst        |  4 ----
 .../translations/zh_CN/accounting/psi.rst          |  4 ----
 .../translations/zh_CN/accounting/taskstats.rst    |  2 --
 .../translations/zh_CN/admin-guide/README.rst      |  4 ----
 .../translations/zh_CN/admin-guide/bootconfig.rst  |  2 --
 .../translations/zh_CN/admin-guide/bug-bisect.rst  |  4 ----
 .../translations/zh_CN/admin-guide/bug-hunting.rst |  4 ----
 .../translations/zh_CN/admin-guide/cputopology.rst |  4 ----
 .../translations/zh_CN/admin-guide/index.rst       |  7 -------
 .../translations/zh_CN/admin-guide/init.rst        |  4 ----
 .../zh_CN/admin-guide/lockup-watchdogs.rst         |  4 ----
 .../zh_CN/admin-guide/mm/damon/index.rst           |  6 ------
 .../zh_CN/admin-guide/mm/damon/lru_sort.rst        |  6 ------
 .../zh_CN/admin-guide/mm/damon/reclaim.rst         |  6 ------
 .../zh_CN/admin-guide/mm/damon/start.rst           |  6 ------
 .../zh_CN/admin-guide/mm/damon/stat.rst            |  4 ----
 .../zh_CN/admin-guide/mm/damon/usage.rst           |  6 ------
 .../translations/zh_CN/admin-guide/mm/index.rst    |  5 -----
 .../translations/zh_CN/admin-guide/mm/ksm.rst      |  5 -----
 .../zh_CN/admin-guide/module-signing.rst           |  3 ---
 .../translations/zh_CN/admin-guide/numastat.rst    |  2 --
 .../zh_CN/admin-guide/reporting-issues.rst         |  5 -----
 .../zh_CN/admin-guide/reporting-regressions.rst    |  5 -----
 .../translations/zh_CN/admin-guide/sysrq.rst       | 10 ----------
 .../zh_CN/admin-guide/tainted-kernels.rst          |  4 ----
 .../translations/zh_CN/admin-guide/unicode.rst     |  4 ----
 .../translations/zh_CN/arch/arm64/amu.rst          |  2 --
 .../translations/zh_CN/arch/arm64/elf_hwcaps.rst   |  2 --
 .../translations/zh_CN/arch/arm64/hugetlbpage.rst  |  2 --
 .../translations/zh_CN/arch/arm64/index.rst        |  4 ----
 .../translations/zh_CN/arch/arm64/perf.rst         |  2 --
 .../translations/zh_CN/arch/loongarch/booting.rst  |  4 ----
 .../translations/zh_CN/arch/loongarch/features.rst |  1 -
 .../translations/zh_CN/arch/loongarch/index.rst    |  1 -
 .../zh_CN/arch/loongarch/introduction.rst          |  1 -
 .../zh_CN/arch/loongarch/irq-chip-model.rst        |  1 -
 .../translations/zh_CN/arch/mips/booting.rst       |  6 ------
 .../translations/zh_CN/arch/mips/features.rst      |  6 ------
 .../translations/zh_CN/arch/mips/index.rst         |  4 ----
 .../translations/zh_CN/arch/mips/ingenic-tcu.rst   |  6 ------
 .../translations/zh_CN/arch/openrisc/index.rst     |  6 ------
 .../zh_CN/arch/openrisc/openrisc_port.rst          |  6 ------
 .../translations/zh_CN/arch/openrisc/todo.rst      |  6 ------
 .../translations/zh_CN/arch/parisc/debugging.rst   |  6 ------
 .../translations/zh_CN/arch/parisc/index.rst       |  6 ------
 .../translations/zh_CN/arch/parisc/registers.rst   |  6 ------
 .../zh_CN/arch/riscv/boot-image-header.rst         |  6 ------
 .../translations/zh_CN/arch/riscv/boot.rst         |  4 ----
 .../translations/zh_CN/arch/riscv/index.rst        |  6 ------
 .../zh_CN/arch/riscv/patch-acceptance.rst          |  6 ------
 .../translations/zh_CN/arch/riscv/vm-layout.rst    |  5 -----
 Documentation/translations/zh_CN/block/blk-mq.rst  | 10 +---------
 .../translations/zh_CN/block/data-integrity.rst    |  8 +-------
 Documentation/translations/zh_CN/block/index.rst   |  6 ------
 .../translations/zh_CN/core-api/assoc_array.rst    | 10 ----------
 .../translations/zh_CN/core-api/boot-time-mm.rst   | 10 ----------
 .../translations/zh_CN/core-api/cachetlb.rst       | 11 -----------
 .../zh_CN/core-api/circular-buffers.rst            | 10 ----------
 .../translations/zh_CN/core-api/cpu_hotplug.rst    | 10 ----------
 .../translations/zh_CN/core-api/errseq.rst         |  8 --------
 .../translations/zh_CN/core-api/genalloc.rst       | 10 ----------
 .../zh_CN/core-api/generic-radix-tree.rst          |  4 ----
 .../translations/zh_CN/core-api/genericirq.rst     | 10 ----------
 .../zh_CN/core-api/gfp_mask-from-fs-io.rst         | 10 ----------
 Documentation/translations/zh_CN/core-api/idr.rst  | 10 ----------
 .../translations/zh_CN/core-api/index.rst          |  6 ------
 .../translations/zh_CN/core-api/irq/concepts.rst   |  6 ------
 .../translations/zh_CN/core-api/irq/index.rst      |  7 -------
 .../zh_CN/core-api/irq/irq-affinity.rst            |  6 ------
 .../translations/zh_CN/core-api/irq/irq-domain.rst |  7 -------
 .../zh_CN/core-api/irq/irqflags-tracing.rst        |  6 ------
 .../translations/zh_CN/core-api/kernel-api.rst     |  7 -------
 .../translations/zh_CN/core-api/kobject.rst        |  6 ------
 Documentation/translations/zh_CN/core-api/kref.rst | 10 ----------
 .../translations/zh_CN/core-api/local_ops.rst      |  6 ------
 .../zh_CN/core-api/memory-allocation.rst           | 10 ----------
 .../translations/zh_CN/core-api/memory-hotplug.rst | 10 ----------
 .../translations/zh_CN/core-api/mm-api.rst         | 11 -----------
 .../translations/zh_CN/core-api/packing.rst        | 10 ----------
 .../translations/zh_CN/core-api/padata.rst         |  6 ------
 .../translations/zh_CN/core-api/printk-basics.rst  |  7 -------
 .../translations/zh_CN/core-api/printk-formats.rst |  7 -------
 .../zh_CN/core-api/protection-keys.rst             | 10 ----------
 .../translations/zh_CN/core-api/rbtree.rst         |  4 ----
 .../zh_CN/core-api/refcount-vs-atomic.rst          |  6 ------
 .../zh_CN/core-api/symbol-namespaces.rst           |  6 ------
 .../translations/zh_CN/core-api/this_cpu_ops.rst   |  8 --------
 .../zh_CN/core-api/unaligned-memory-access.rst     | 10 ----------
 .../translations/zh_CN/core-api/watch_queue.rst    | 10 ----------
 .../translations/zh_CN/core-api/workqueue.rst      |  8 --------
 .../translations/zh_CN/core-api/xarray.rst         | 11 -----------
 Documentation/translations/zh_CN/cpu-freq/core.rst |  8 --------
 .../translations/zh_CN/cpu-freq/cpu-drivers.rst    |  8 --------
 .../translations/zh_CN/cpu-freq/cpufreq-stats.rst  |  8 --------
 .../translations/zh_CN/cpu-freq/index.rst          |  6 ------
 .../translations/zh_CN/dev-tools/gcov.rst          |  1 -
 .../zh_CN/dev-tools/gdb-kernel-debugging.rst       |  1 -
 .../translations/zh_CN/dev-tools/index.rst         |  1 -
 .../translations/zh_CN/dev-tools/kasan.rst         |  1 -
 .../translations/zh_CN/dev-tools/kcov.rst          |  1 -
 .../translations/zh_CN/dev-tools/kcsan.rst         |  1 -
 .../translations/zh_CN/dev-tools/kmemleak.rst      |  1 -
 .../translations/zh_CN/dev-tools/kmsan.rst         |  1 -
 .../translations/zh_CN/dev-tools/sparse.rst        | 14 ++------------
 .../zh_CN/dev-tools/testing-overview.rst           |  1 -
 .../translations/zh_CN/dev-tools/ubsan.rst         |  8 --------
 .../translations/zh_CN/devicetree/changesets.rst   |  7 -------
 .../zh_CN/devicetree/dynamic-resolution-notes.rst  |  6 ------
 .../translations/zh_CN/devicetree/index.rst        |  7 -------
 .../translations/zh_CN/devicetree/kernel-api.rst   |  7 -------
 .../translations/zh_CN/devicetree/of_unittest.rst  |  6 ------
 .../zh_CN/devicetree/overlay-notes.rst             |  6 ------
 .../translations/zh_CN/devicetree/usage-model.rst  |  7 -------
 .../zh_CN/doc-guide/checktransupdate.rst           |  2 --
 .../translations/zh_CN/doc-guide/contributing.rst  |  2 --
 .../translations/zh_CN/doc-guide/index.rst         |  2 --
 .../translations/zh_CN/doc-guide/kernel-doc.rst    |  2 --
 .../zh_CN/doc-guide/maintainer-profile.rst         |  2 --
 .../translations/zh_CN/doc-guide/parse-headers.rst |  2 --
 .../translations/zh_CN/doc-guide/sphinx.rst        |  2 --
 .../translations/zh_CN/driver-api/gpio/index.rst   |  6 ------
 .../translations/zh_CN/driver-api/index.rst        |  6 ------
 .../translations/zh_CN/driver-api/io_ordering.rst  |  7 -------
 .../translations/zh_CN/driver-api/phy/phy.rst      |  4 ----
 .../translations/zh_CN/filesystems/debugfs.rst     | 11 -----------
 .../translations/zh_CN/filesystems/dnotify.rst     |  4 ----
 .../translations/zh_CN/filesystems/gfs2-glocks.rst |  8 --------
 .../zh_CN/filesystems/gfs2-uevents.rst             |  8 --------
 .../translations/zh_CN/filesystems/gfs2.rst        |  8 --------
 .../translations/zh_CN/filesystems/index.rst       |  3 ---
 .../translations/zh_CN/filesystems/inotify.rst     |  4 ----
 .../translations/zh_CN/filesystems/tmpfs.rst       |  2 --
 .../zh_CN/filesystems/ubifs-authentication.rst     |  8 --------
 .../translations/zh_CN/filesystems/ubifs.rst       |  8 --------
 .../translations/zh_CN/filesystems/virtiofs.rst    |  7 -------
 Documentation/translations/zh_CN/how-to.rst        |  4 ----
 .../translations/zh_CN/iio/ep93xx_adc.rst          |  6 ------
 .../translations/zh_CN/iio/iio_configfs.rst        |  6 ------
 Documentation/translations/zh_CN/iio/index.rst     |  6 ------
 .../translations/zh_CN/infiniband/core_locking.rst | 11 -----------
 .../translations/zh_CN/infiniband/index.rst        | 11 -----------
 .../translations/zh_CN/infiniband/ipoib.rst        | 11 -----------
 .../translations/zh_CN/infiniband/sysfs.rst        | 11 -----------
 .../translations/zh_CN/infiniband/tag_matching.rst | 11 -----------
 .../translations/zh_CN/infiniband/user_mad.rst     | 11 -----------
 .../translations/zh_CN/infiniband/user_verbs.rst   | 11 -----------
 .../translations/zh_CN/kbuild/gcc-plugins.rst      |  1 -
 .../translations/zh_CN/kbuild/headers_install.rst  |  1 -
 Documentation/translations/zh_CN/kbuild/index.rst  |  1 -
 Documentation/translations/zh_CN/kbuild/kbuild.rst |  1 -
 .../translations/zh_CN/kbuild/kconfig.rst          |  1 -
 Documentation/translations/zh_CN/kbuild/llvm.rst   |  1 -
 .../zh_CN/kbuild/reproducible-builds.rst           |  2 --
 .../translations/zh_CN/kernel-hacking/hacking.rst  |  4 ----
 .../translations/zh_CN/kernel-hacking/index.rst    |  4 ----
 Documentation/translations/zh_CN/locking/index.rst |  4 ----
 .../translations/zh_CN/locking/mutex-design.rst    |  4 ----
 .../translations/zh_CN/locking/spinlocks.rst       |  4 ----
 .../zh_CN/maintainer/configure-git.rst             |  4 ----
 .../zh_CN/maintainer/maintainer-entry-profile.rst  |  4 ----
 .../zh_CN/maintainer/modifying-patches.rst         |  4 ----
 .../zh_CN/maintainer/pull-requests.rst             |  4 ----
 .../zh_CN/maintainer/rebasing-and-merging.rst      |  4 ----
 Documentation/translations/zh_CN/mm/active_mm.rst  |  7 -------
 Documentation/translations/zh_CN/mm/balance.rst    |  7 -------
 Documentation/translations/zh_CN/mm/damon/api.rst  |  7 -------
 .../translations/zh_CN/mm/damon/design.rst         |  7 -------
 Documentation/translations/zh_CN/mm/damon/faq.rst  |  7 -------
 .../translations/zh_CN/mm/damon/index.rst          |  7 -------
 .../translations/zh_CN/mm/free_page_reporting.rst  |  6 ------
 Documentation/translations/zh_CN/mm/highmem.rst    |  6 ------
 Documentation/translations/zh_CN/mm/hmm.rst        |  6 ------
 .../translations/zh_CN/mm/hugetlbfs_reserv.rst     |  6 ------
 Documentation/translations/zh_CN/mm/hwpoison.rst   |  7 -------
 Documentation/translations/zh_CN/mm/index.rst      |  6 ------
 Documentation/translations/zh_CN/mm/ksm.rst        |  4 ----
 .../translations/zh_CN/mm/memory-model.rst         |  7 -------
 .../translations/zh_CN/mm/mmu_notifier.rst         |  8 --------
 Documentation/translations/zh_CN/mm/numa.rst       |  7 -------
 .../zh_CN/mm/overcommit-accounting.rst             |  8 --------
 Documentation/translations/zh_CN/mm/page_frags.rst |  7 -------
 .../translations/zh_CN/mm/page_migration.rst       |  6 ------
 Documentation/translations/zh_CN/mm/page_owner.rst |  7 -------
 .../translations/zh_CN/mm/page_table_check.rst     |  7 -------
 .../translations/zh_CN/mm/page_tables.rst          |  6 ------
 .../translations/zh_CN/mm/physical_memory.rst      |  4 ----
 .../translations/zh_CN/mm/remap_file_pages.rst     |  7 -------
 .../zh_CN/mm/split_page_table_lock.rst             |  7 -------
 .../zh_CN/mm/vmalloced-kernel-stacks.rst           |  6 ------
 Documentation/translations/zh_CN/mm/zsmalloc.rst   |  6 ------
 .../translations/zh_CN/networking/alias.rst        |  6 ------
 .../translations/zh_CN/networking/driver.rst       |  4 ----
 .../translations/zh_CN/networking/generic-hdlc.rst |  4 ----
 .../translations/zh_CN/networking/index.rst        |  6 ------
 .../translations/zh_CN/networking/ipv6.rst         |  4 ----
 .../translations/zh_CN/networking/mptcp-sysctl.rst |  4 ----
 .../translations/zh_CN/networking/msg_zerocopy.rst |  9 ---------
 .../translations/zh_CN/networking/napi.rst         |  4 ----
 .../translations/zh_CN/networking/netif-msg.rst    |  4 ----
 .../translations/zh_CN/networking/netmem.rst       |  4 ----
 .../translations/zh_CN/networking/secid.rst        |  4 ----
 .../translations/zh_CN/networking/sriov.rst        |  4 ----
 .../translations/zh_CN/networking/team.rst         |  4 ----
 .../translations/zh_CN/networking/timestamping.rst |  4 ----
 .../translations/zh_CN/networking/vxlan.rst        |  9 ---------
 .../translations/zh_CN/networking/xfrm_proc.rst    |  4 ----
 Documentation/translations/zh_CN/peci/index.rst    |  6 ------
 Documentation/translations/zh_CN/peci/peci.rst     |  6 ------
 .../translations/zh_CN/power/energy-model.rst      |  4 ----
 Documentation/translations/zh_CN/power/index.rst   |  4 ----
 Documentation/translations/zh_CN/power/opp.rst     |  4 ----
 .../translations/zh_CN/process/1.Intro.rst         | 10 ----------
 .../translations/zh_CN/process/2.Process.rst       |  8 --------
 .../translations/zh_CN/process/3.Early-stage.rst   |  8 --------
 .../translations/zh_CN/process/4.Coding.rst        |  8 --------
 .../translations/zh_CN/process/5.Posting.rst       |  8 --------
 .../translations/zh_CN/process/6.Followthrough.rst |  8 --------
 .../zh_CN/process/7.AdvancedTopics.rst             |  8 --------
 .../translations/zh_CN/process/8.Conclusion.rst    |  7 -------
 .../zh_CN/process/applying-patches.rst             |  4 ----
 .../process/code-of-conduct-interpretation.rst     |  1 -
 .../translations/zh_CN/process/code-of-conduct.rst |  1 -
 .../translations/zh_CN/process/coding-style.rst    |  5 -----
 Documentation/translations/zh_CN/process/cve.rst   |  1 -
 .../zh_CN/process/development-process.rst          |  3 ---
 .../translations/zh_CN/process/email-clients.rst   | 10 ----------
 .../zh_CN/process/embargoed-hardware-issues.rst    |  1 -
 Documentation/translations/zh_CN/process/howto.rst | 13 +------------
 Documentation/translations/zh_CN/process/index.rst |  4 ----
 .../zh_CN/process/kernel-driver-statement.rst      |  3 ---
 .../zh_CN/process/kernel-enforcement-statement.rst |  5 +----
 .../translations/zh_CN/process/license-rules.rst   |  1 -
 .../translations/zh_CN/process/magic-number.rst    |  8 --------
 .../zh_CN/process/maintainer-pgp-guide.rst         |  7 -------
 .../zh_CN/process/management-style.rst             |  1 -
 .../zh_CN/process/programming-language.rst         |  1 -
 .../zh_CN/process/researcher-guidelines.rst        |  5 -----
 .../translations/zh_CN/process/security-bugs.rst   |  5 -----
 .../zh_CN/process/stable-api-nonsense.rst          |  6 ------
 .../zh_CN/process/stable-kernel-rules.rst          | 12 ------------
 .../zh_CN/process/submit-checklist.rst             |  3 ---
 .../zh_CN/process/submitting-patches.rst           | 10 ----------
 .../zh_CN/process/volatile-considered-harmful.rst  | 13 -------------
 .../translations/zh_CN/rust/arch-support.rst       |  4 ----
 .../translations/zh_CN/rust/coding-guidelines.rst  |  4 ----
 .../zh_CN/rust/general-information.rst             |  5 -----
 Documentation/translations/zh_CN/rust/index.rst    |  4 ----
 .../translations/zh_CN/rust/quick-start.rst        |  5 -----
 Documentation/translations/zh_CN/rust/testing.rst  |  4 ----
 .../translations/zh_CN/scheduler/completion.rst    |  8 --------
 .../translations/zh_CN/scheduler/index.rst         |  9 ---------
 .../translations/zh_CN/scheduler/sched-arch.rst    |  8 --------
 .../translations/zh_CN/scheduler/sched-bwc.rst     |  8 --------
 .../zh_CN/scheduler/sched-capacity.rst             |  8 --------
 .../translations/zh_CN/scheduler/sched-debug.rst   |  4 ----
 .../zh_CN/scheduler/sched-design-CFS.rst           |  4 ----
 .../translations/zh_CN/scheduler/sched-domains.rst |  8 --------
 .../translations/zh_CN/scheduler/sched-energy.rst  |  4 ----
 .../zh_CN/scheduler/sched-nice-design.rst          |  4 ----
 .../translations/zh_CN/scheduler/sched-stats.rst   |  4 ----
 .../translations/zh_CN/scheduler/schedutil.rst     |  4 ----
 Documentation/translations/zh_CN/scsi/index.rst    |  8 --------
 Documentation/translations/zh_CN/scsi/libsas.rst   |  6 ------
 .../zh_CN/scsi/link_power_management_policy.rst    |  8 --------
 .../translations/zh_CN/scsi/scsi-parameters.rst    |  8 --------
 Documentation/translations/zh_CN/scsi/scsi.rst     |  8 --------
 Documentation/translations/zh_CN/scsi/scsi_eh.rst  |  7 -------
 .../translations/zh_CN/scsi/scsi_mid_low_api.rst   |  8 --------
 .../translations/zh_CN/scsi/sd-parameters.rst      |  8 --------
 Documentation/translations/zh_CN/scsi/wd719x.rst   |  6 ------
 .../translations/zh_CN/security/IMA-templates.rst  |  3 ---
 Documentation/translations/zh_CN/security/SCTP.rst |  3 ---
 .../translations/zh_CN/security/credentials.rst    |  3 ---
 .../translations/zh_CN/security/digsig.rst         |  3 ---
 .../translations/zh_CN/security/index.rst          |  4 ----
 Documentation/translations/zh_CN/security/ipe.rst  |  3 ---
 .../translations/zh_CN/security/keys/index.rst     |  3 ---
 .../translations/zh_CN/security/landlock.rst       |  4 ----
 .../zh_CN/security/lsm-development.rst             |  3 ---
 Documentation/translations/zh_CN/security/lsm.rst  |  4 ----
 Documentation/translations/zh_CN/security/sak.rst  |  4 ----
 .../translations/zh_CN/security/secrets/coco.rst   |  4 ----
 .../translations/zh_CN/security/secrets/index.rst  |  2 --
 .../zh_CN/security/self-protection.rst             |  4 ----
 .../translations/zh_CN/security/siphash.rst        |  4 ----
 .../zh_CN/security/snp-tdx-threat-model.rst        |  4 ----
 .../translations/zh_CN/security/tpm/index.rst      |  3 ---
 .../zh_CN/security/tpm/tpm-security.rst            |  3 ---
 .../zh_CN/security/tpm/tpm_event_log.rst           |  3 ---
 .../zh_CN/security/tpm/tpm_ftpm_tee.rst            |  3 ---
 .../translations/zh_CN/security/tpm/tpm_tis.rst    |  3 ---
 .../zh_CN/security/tpm/tpm_vtpm_proxy.rst          |  3 ---
 .../zh_CN/security/tpm/xen-tpmfront.rst            |  3 ---
 .../translations/zh_CN/sound/hd-audio/controls.rst |  2 --
 .../translations/zh_CN/sound/hd-audio/index.rst    |  2 --
 Documentation/translations/zh_CN/sound/index.rst   |  2 --
 Documentation/translations/zh_CN/staging/index.rst |  4 ----
 .../translations/zh_CN/staging/speculation.rst     |  4 ----
 Documentation/translations/zh_CN/staging/xz.rst    |  4 ----
 .../translations/zh_CN/subsystem-apis.rst          |  4 ----
 Documentation/translations/zh_CN/usb/CREDITS       |  7 -------
 Documentation/translations/zh_CN/usb/acm.rst       |  7 -------
 .../translations/zh_CN/usb/authorization.rst       |  7 -------
 Documentation/translations/zh_CN/usb/chipidea.rst  |  7 -------
 Documentation/translations/zh_CN/usb/dwc3.rst      |  7 -------
 Documentation/translations/zh_CN/usb/ehci.rst      |  7 -------
 Documentation/translations/zh_CN/usb/index.rst     |  7 -------
 Documentation/translations/zh_CN/usb/usbmon.rst    |  7 -------
 .../zh_CN/userspace-api/accelerators/ocxl.rst      |  4 ----
 .../zh_CN/userspace-api/ebpf/index.rst             |  4 ----
 .../zh_CN/userspace-api/ebpf/syscall.rst           |  4 ----
 .../translations/zh_CN/userspace-api/futex2.rst    |  4 ----
 .../translations/zh_CN/userspace-api/index.rst     |  4 ----
 .../zh_CN/userspace-api/no_new_privs.rst           |  4 ----
 .../zh_CN/userspace-api/seccomp_filter.rst         |  4 ----
 .../zh_CN/userspace-api/sysfs-platform_profile.rst |  4 ----
 .../translations/zh_CN/virt/acrn/cpuid.rst         | 10 ----------
 .../translations/zh_CN/virt/acrn/index.rst         | 10 ----------
 .../translations/zh_CN/virt/acrn/introduction.rst  | 10 ----------
 .../translations/zh_CN/virt/acrn/io-request.rst    | 10 ----------
 .../translations/zh_CN/virt/guest-halt-polling.rst | 10 ----------
 Documentation/translations/zh_CN/virt/index.rst    | 10 ----------
 .../translations/zh_CN/virt/ne_overview.rst        | 10 ----------
 .../translations/zh_CN/virt/paravirt_ops.rst       | 11 -----------
 332 files changed, 6 insertions(+), 1870 deletions(-)

-- 
2.56.0.379.gc618271300

