Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=52.187.6.220
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792899415;
	b=lBjy6olAYfVhkJdfsTPEfzhzXe3+LB6fqoJmCOgzl8St03sVcwh2IZRrE10EwfN60EFo
	 r5XGyPwi4edE8krFJNKq8nioaXWhiADFtyC53bZU95nzHkxtjq8wXSfTz3QFr2wON4/Cf
	 tFEBsxA60OTfvVAoa5B9+8I/+iM0p0sS2Hiq7vGE6sV8bIKXkDsqVcXB/gfifQd+wYTPn
	 q5qJwJh5BBp7uKdTymLZi4Q/bJl7e0sTjj3KYZKQzoeQs2Uys9wg4Z2tZv2NP4f+OwVVA
	 dDwT8rScnNX51Znal1URAG2mI7FSO4UnCJ3wur+SYMu+3qpYu2fUSsef0y9TEUq3HwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792899415;
	h=DMARC-Filter:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=xLbZiVPd6b9X0dbGBDBW5B8OumCZt9HYIK/VdNWva8U=;
	b=kI79j31yIWIpznwwDSnWhwvWQpk+b5eIyPZPd3JPaRreyNf4KkM6zcfTRsZBWdn5WH7W
	 BQ1DgnrGqDgppGSpVzcPTsC/6ISPcM85clFvxlIb0GUfSRgfpeSxN6ZBvWtWjJ3B0YGH8
	 EUtSaSLssY/LWmEJbTnbULWpApm3l/4bqeBAYPJvot7QpRjqFLxGeDXCyw11QesjsIOwC
	 G/8NHqaNLYpOVQTlwGEH+Nr2Gr4DVMai+5+fXv/G6RaRXdpBqtFuyzKcGYtGEJvmAmSR8
	 7zD1n35UBnios6FDb/t2UPiqd379k2YKKFm4wqXExroECuhjA8JyKQWnypynY8Uu+gA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=hust.edu.cn;
	spf=pass smtp.mailfrom=hust.edu.cn;
	arc=none smtp.remote-ip=52.187.6.220
Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [52.187.6.220])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43E1B606A31B;
	Sun, 25 Oct 2026 03:36:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43E1B606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.50])
	by app1 (Coremail) with UTF8SMTP id IAEQrMDGDaRSed1qS_4rAQ--.54880S2;
	Sun, 25 Oct 2026 11:36:50 +0800 (CST)
Received: from [100.81.40.43] (unknown [222.20.126.216])
	by gateway (Coremail) with SMTP id _____wD3_+dLed1qtO26AA--.64037S2;
	Sun, 25 Oct 2026 11:36:44 +0800 (CST)
Message-ID: <1786a7fd-a04e-4d60-92c2-5d91f1eee15c@hust.edu.cn>
Date: Sun, 25 Oct 2026 11:36:43 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] docs/zh_CN: cleanup headers
To: Weijie Yuan <wy@wyuan.org>, Alex Shi <alexs@kernel.org>,
 Yanteng Si <si.yanteng@linux.dev>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1792745468.git.wy@wyuan.org>
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <cover.1792745468.git.wy@wyuan.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:IAEQrMDGDaRSed1qS_4rAQ--.54880S2
Authentication-Results: app1; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvAXoWfXF17KFWfKF4xuw17Gw4kZwb_yoW5Jr1rJo
	Wa9w4YkrZrGFy7XF4kGr4rGr47JF4xCFZYqr1UJa4qgw1jg3WfJw1rtw1FkwsIyry5G34x
	XFykuw4rtFZ8Jay5n29KB7ZKAUJUUUU3529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
	AaLaJ3UjIYCTnIWjp_UUUOl7k0a2IF6F4UM7kC6x804xWl1xkIjI8I6I8E6xAIw20EY4v2
	0xvaj40_Wr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7
	IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1l84ACjcxK
	6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1ln4kS14v26r
	126r1DM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI
	12xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj64x0Y40En7xvr7AKxV
	W8Jr0_Cr1UMcIj6x8ErcxFaVAv8VW8uFyUJr1UMcIj6xkF7I0En7xvr7AKxVW8Jr0_Cr1U
	McvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCY1x0262kKe7AKxVWUAVWUtwCY02
	Avz4vE-syl42xK82IYc2Ij64vIr41l42xK82IY6x8ErcxFaVAv8VW8uFyUJr1UMxC20s02
	6xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r126r1DMI8I3I0E5I8CrVAFwI0_Jr0_Jr
	4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxG
	rwCI42IY6xIIjxv20xvE14v26r4j6ryUMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJw
	CI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2
	z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU0XVy3UUUUU==
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/


On 10/23/26 4:58 PM, Weijie Yuan wrote:
> As discussed in [1], the Translator field (and related ones) is
> repetitive, redundant and difficult to maintain.
>
> Let's remove them to make our source clean.
>
> [1] https://lore.kernel.org/linux-doc/87o6cvrs27.fsf@trenco.lwn.net/

LTGM

Reviewed-by: Dongliang Mu <dzm91@hust.edu.cn>

>
>   [1/2] docs/zh_CN: remove translator-related headers
>   [2/2] docs/zh_CN: remove Translator field in header template
>
> Changes in v3:
> - Add the content that should have been deleted. (thanks, Dongliang)
> - Add Reviewed-by trailer for [2/2] from Dongliang.
>
> Changes in v2:
> - Do not touch top-level labels, maybe deal with them later. (Dongliang)
> - Still miss SPDX-Identifiers in some files by checkpatch, because we
>    generally want our translation aligned with English version unless
>    direct ack/instruction from original translators.
>
>   Documentation/translations/zh_CN/PCI/acpi-info.rst   |  7 -------
>   Documentation/translations/zh_CN/PCI/index.rst       |  7 -------
>   Documentation/translations/zh_CN/PCI/msi-howto.rst   |  8 --------
>   .../translations/zh_CN/PCI/pci-iov-howto.rst         |  8 --------
>   Documentation/translations/zh_CN/PCI/pci.rst         |  8 --------
>   .../translations/zh_CN/PCI/pciebus-howto.rst         |  8 --------
>   Documentation/translations/zh_CN/PCI/sysfs-pci.rst   |  8 --------
>   .../zh_CN/accounting/delay-accounting.rst            |  2 --
>   .../translations/zh_CN/accounting/index.rst          |  1 -
>   Documentation/translations/zh_CN/accounting/psi.rst  |  1 -
>   .../translations/zh_CN/accounting/taskstats.rst      |  2 --
>   .../translations/zh_CN/admin-guide/README.rst        |  4 ----
>   .../translations/zh_CN/admin-guide/bootconfig.rst    |  2 --
>   .../translations/zh_CN/admin-guide/bug-bisect.rst    |  4 ----
>   .../translations/zh_CN/admin-guide/bug-hunting.rst   |  4 ----
>   .../translations/zh_CN/admin-guide/cputopology.rst   |  4 ----
>   .../translations/zh_CN/admin-guide/index.rst         |  7 -------
>   .../translations/zh_CN/admin-guide/init.rst          |  4 ----
>   .../zh_CN/admin-guide/lockup-watchdogs.rst           |  1 -
>   .../zh_CN/admin-guide/mm/damon/index.rst             |  6 ------
>   .../zh_CN/admin-guide/mm/damon/lru_sort.rst          |  6 ------
>   .../zh_CN/admin-guide/mm/damon/reclaim.rst           |  6 ------
>   .../zh_CN/admin-guide/mm/damon/start.rst             |  6 ------
>   .../translations/zh_CN/admin-guide/mm/damon/stat.rst |  4 ----
>   .../zh_CN/admin-guide/mm/damon/usage.rst             |  6 ------
>   .../translations/zh_CN/admin-guide/mm/index.rst      |  5 -----
>   .../translations/zh_CN/admin-guide/mm/ksm.rst        |  5 -----
>   .../zh_CN/admin-guide/module-signing.rst             |  3 ---
>   .../translations/zh_CN/admin-guide/numastat.rst      |  2 --
>   .../zh_CN/admin-guide/reporting-issues.rst           |  5 -----
>   .../zh_CN/admin-guide/reporting-regressions.rst      |  5 -----
>   .../translations/zh_CN/admin-guide/sysrq.rst         |  8 --------
>   .../zh_CN/admin-guide/tainted-kernels.rst            |  4 ----
>   .../translations/zh_CN/admin-guide/unicode.rst       |  4 ----
>   Documentation/translations/zh_CN/arch/arm64/amu.rst  |  2 --
>   .../translations/zh_CN/arch/arm64/elf_hwcaps.rst     |  2 --
>   .../translations/zh_CN/arch/arm64/hugetlbpage.rst    |  2 --
>   .../translations/zh_CN/arch/arm64/index.rst          |  1 -
>   Documentation/translations/zh_CN/arch/arm64/perf.rst |  2 --
>   .../translations/zh_CN/arch/loongarch/booting.rst    |  4 ----
>   .../translations/zh_CN/arch/loongarch/features.rst   |  1 -
>   .../translations/zh_CN/arch/loongarch/index.rst      |  1 -
>   .../zh_CN/arch/loongarch/introduction.rst            |  1 -
>   .../zh_CN/arch/loongarch/irq-chip-model.rst          |  1 -
>   .../translations/zh_CN/arch/mips/booting.rst         |  4 ----
>   .../translations/zh_CN/arch/mips/features.rst        |  4 ----
>   Documentation/translations/zh_CN/arch/mips/index.rst |  4 ----
>   .../translations/zh_CN/arch/mips/ingenic-tcu.rst     |  4 ----
>   .../translations/zh_CN/arch/openrisc/index.rst       |  4 ----
>   .../zh_CN/arch/openrisc/openrisc_port.rst            |  4 ----
>   .../translations/zh_CN/arch/openrisc/todo.rst        |  4 ----
>   .../translations/zh_CN/arch/parisc/debugging.rst     |  4 ----
>   .../translations/zh_CN/arch/parisc/index.rst         |  4 ----
>   .../translations/zh_CN/arch/parisc/registers.rst     |  4 ----
>   .../zh_CN/arch/riscv/boot-image-header.rst           |  4 ----
>   Documentation/translations/zh_CN/arch/riscv/boot.rst |  4 ----
>   .../translations/zh_CN/arch/riscv/index.rst          |  4 ----
>   .../zh_CN/arch/riscv/patch-acceptance.rst            |  4 ----
>   .../translations/zh_CN/arch/riscv/vm-layout.rst      |  5 -----
>   Documentation/translations/zh_CN/block/blk-mq.rst    |  8 --------
>   .../translations/zh_CN/block/data-integrity.rst      |  6 ------
>   Documentation/translations/zh_CN/block/index.rst     |  6 ------
>   .../translations/zh_CN/core-api/assoc_array.rst      |  8 --------
>   .../translations/zh_CN/core-api/boot-time-mm.rst     |  8 --------
>   .../translations/zh_CN/core-api/cachetlb.rst         |  9 ---------
>   .../translations/zh_CN/core-api/circular-buffers.rst | 10 ----------
>   .../translations/zh_CN/core-api/cpu_hotplug.rst      |  8 --------
>   Documentation/translations/zh_CN/core-api/errseq.rst |  8 --------
>   .../translations/zh_CN/core-api/genalloc.rst         |  8 --------
>   .../zh_CN/core-api/generic-radix-tree.rst            |  4 ----
>   .../translations/zh_CN/core-api/genericirq.rst       |  8 --------
>   .../zh_CN/core-api/gfp_mask-from-fs-io.rst           |  8 --------
>   Documentation/translations/zh_CN/core-api/idr.rst    | 10 ----------
>   Documentation/translations/zh_CN/core-api/index.rst  |  4 ----
>   .../translations/zh_CN/core-api/irq/concepts.rst     |  4 ----
>   .../translations/zh_CN/core-api/irq/index.rst        |  4 ----
>   .../translations/zh_CN/core-api/irq/irq-affinity.rst |  4 ----
>   .../translations/zh_CN/core-api/irq/irq-domain.rst   |  5 -----
>   .../zh_CN/core-api/irq/irqflags-tracing.rst          |  4 ----
>   .../translations/zh_CN/core-api/kernel-api.rst       |  5 -----
>   .../translations/zh_CN/core-api/kobject.rst          |  4 ----
>   Documentation/translations/zh_CN/core-api/kref.rst   |  8 --------
>   .../translations/zh_CN/core-api/local_ops.rst        |  4 ----
>   .../zh_CN/core-api/memory-allocation.rst             |  8 --------
>   .../translations/zh_CN/core-api/memory-hotplug.rst   |  8 --------
>   Documentation/translations/zh_CN/core-api/mm-api.rst |  9 ---------
>   .../translations/zh_CN/core-api/packing.rst          | 10 ----------
>   Documentation/translations/zh_CN/core-api/padata.rst |  4 ----
>   .../translations/zh_CN/core-api/printk-basics.rst    |  5 -----
>   .../translations/zh_CN/core-api/printk-formats.rst   |  5 -----
>   .../translations/zh_CN/core-api/protection-keys.rst  |  8 --------
>   Documentation/translations/zh_CN/core-api/rbtree.rst |  4 ----
>   .../zh_CN/core-api/refcount-vs-atomic.rst            |  4 ----
>   .../zh_CN/core-api/symbol-namespaces.rst             |  4 ----
>   .../translations/zh_CN/core-api/this_cpu_ops.rst     |  8 --------
>   .../zh_CN/core-api/unaligned-memory-access.rst       |  8 --------
>   .../translations/zh_CN/core-api/watch_queue.rst      | 10 ----------
>   .../translations/zh_CN/core-api/workqueue.rst        |  6 ------
>   Documentation/translations/zh_CN/core-api/xarray.rst |  9 ---------
>   Documentation/translations/zh_CN/cpu-freq/core.rst   |  8 --------
>   .../translations/zh_CN/cpu-freq/cpu-drivers.rst      |  8 --------
>   .../translations/zh_CN/cpu-freq/cpufreq-stats.rst    |  8 --------
>   Documentation/translations/zh_CN/cpu-freq/index.rst  |  4 ----
>   Documentation/translations/zh_CN/dev-tools/gcov.rst  |  1 -
>   .../zh_CN/dev-tools/gdb-kernel-debugging.rst         |  1 -
>   Documentation/translations/zh_CN/dev-tools/index.rst |  1 -
>   Documentation/translations/zh_CN/dev-tools/kasan.rst |  1 -
>   Documentation/translations/zh_CN/dev-tools/kcov.rst  |  1 -
>   Documentation/translations/zh_CN/dev-tools/kcsan.rst |  1 -
>   .../translations/zh_CN/dev-tools/kmemleak.rst        |  1 -
>   Documentation/translations/zh_CN/dev-tools/kmsan.rst |  1 -
>   .../translations/zh_CN/dev-tools/sparse.rst          |  8 --------
>   .../zh_CN/dev-tools/testing-overview.rst             |  1 -
>   Documentation/translations/zh_CN/dev-tools/ubsan.rst |  8 --------
>   .../translations/zh_CN/devicetree/changesets.rst     |  7 -------
>   .../zh_CN/devicetree/dynamic-resolution-notes.rst    |  6 ------
>   .../translations/zh_CN/devicetree/index.rst          |  7 -------
>   .../translations/zh_CN/devicetree/kernel-api.rst     |  7 -------
>   .../translations/zh_CN/devicetree/of_unittest.rst    |  6 ------
>   .../translations/zh_CN/devicetree/overlay-notes.rst  |  6 ------
>   .../translations/zh_CN/devicetree/usage-model.rst    |  7 -------
>   .../zh_CN/doc-guide/checktransupdate.rst             |  2 --
>   .../translations/zh_CN/doc-guide/contributing.rst    |  2 --
>   Documentation/translations/zh_CN/doc-guide/index.rst |  2 --
>   .../translations/zh_CN/doc-guide/kernel-doc.rst      |  2 --
>   .../zh_CN/doc-guide/maintainer-profile.rst           |  2 --
>   .../translations/zh_CN/doc-guide/parse-headers.rst   |  2 --
>   .../translations/zh_CN/doc-guide/sphinx.rst          |  2 --
>   .../translations/zh_CN/driver-api/gpio/index.rst     |  6 ------
>   .../translations/zh_CN/driver-api/index.rst          |  6 ------
>   .../translations/zh_CN/driver-api/io_ordering.rst    |  7 -------
>   .../translations/zh_CN/driver-api/phy/phy.rst        |  4 ----
>   .../translations/zh_CN/filesystems/debugfs.rst       | 11 -----------
>   .../translations/zh_CN/filesystems/dnotify.rst       |  4 ----
>   .../translations/zh_CN/filesystems/gfs2-glocks.rst   |  8 --------
>   .../translations/zh_CN/filesystems/gfs2-uevents.rst  |  8 --------
>   .../translations/zh_CN/filesystems/gfs2.rst          |  8 --------
>   .../translations/zh_CN/filesystems/index.rst         |  1 -
>   .../translations/zh_CN/filesystems/inotify.rst       |  4 ----
>   .../translations/zh_CN/filesystems/tmpfs.rst         |  2 --
>   .../zh_CN/filesystems/ubifs-authentication.rst       |  8 --------
>   .../translations/zh_CN/filesystems/ubifs.rst         |  8 --------
>   .../translations/zh_CN/filesystems/virtiofs.rst      |  7 -------
>   Documentation/translations/zh_CN/how-to.rst          |  4 ----
>   Documentation/translations/zh_CN/iio/ep93xx_adc.rst  |  4 ----
>   .../translations/zh_CN/iio/iio_configfs.rst          |  4 ----
>   Documentation/translations/zh_CN/iio/index.rst       |  4 ----
>   .../translations/zh_CN/infiniband/core_locking.rst   |  9 ---------
>   .../translations/zh_CN/infiniband/index.rst          |  9 ---------
>   .../translations/zh_CN/infiniband/ipoib.rst          |  9 ---------
>   .../translations/zh_CN/infiniband/sysfs.rst          |  9 ---------
>   .../translations/zh_CN/infiniband/tag_matching.rst   |  9 ---------
>   .../translations/zh_CN/infiniband/user_mad.rst       |  9 ---------
>   .../translations/zh_CN/infiniband/user_verbs.rst     |  9 ---------
>   .../translations/zh_CN/kbuild/gcc-plugins.rst        |  1 -
>   .../translations/zh_CN/kbuild/headers_install.rst    |  1 -
>   Documentation/translations/zh_CN/kbuild/index.rst    |  1 -
>   Documentation/translations/zh_CN/kbuild/kbuild.rst   |  1 -
>   Documentation/translations/zh_CN/kbuild/kconfig.rst  |  1 -
>   Documentation/translations/zh_CN/kbuild/llvm.rst     |  1 -
>   .../zh_CN/kbuild/reproducible-builds.rst             |  2 --
>   .../translations/zh_CN/kernel-hacking/hacking.rst    |  4 ----
>   .../translations/zh_CN/kernel-hacking/index.rst      |  4 ----
>   Documentation/translations/zh_CN/locking/index.rst   |  4 ----
>   .../translations/zh_CN/locking/mutex-design.rst      |  4 ----
>   .../translations/zh_CN/locking/spinlocks.rst         |  4 ----
>   .../translations/zh_CN/maintainer/configure-git.rst  |  4 ----
>   .../zh_CN/maintainer/maintainer-entry-profile.rst    |  4 ----
>   .../zh_CN/maintainer/modifying-patches.rst           |  4 ----
>   .../translations/zh_CN/maintainer/pull-requests.rst  |  4 ----
>   .../zh_CN/maintainer/rebasing-and-merging.rst        |  4 ----
>   Documentation/translations/zh_CN/mm/active_mm.rst    |  7 -------
>   Documentation/translations/zh_CN/mm/balance.rst      |  7 -------
>   Documentation/translations/zh_CN/mm/damon/api.rst    |  7 -------
>   Documentation/translations/zh_CN/mm/damon/design.rst |  7 -------
>   Documentation/translations/zh_CN/mm/damon/faq.rst    |  7 -------
>   Documentation/translations/zh_CN/mm/damon/index.rst  |  7 -------
>   .../translations/zh_CN/mm/free_page_reporting.rst    |  6 ------
>   Documentation/translations/zh_CN/mm/highmem.rst      |  6 ------
>   Documentation/translations/zh_CN/mm/hmm.rst          |  6 ------
>   .../translations/zh_CN/mm/hugetlbfs_reserv.rst       |  6 ------
>   Documentation/translations/zh_CN/mm/hwpoison.rst     |  7 -------
>   Documentation/translations/zh_CN/mm/index.rst        |  6 ------
>   Documentation/translations/zh_CN/mm/ksm.rst          |  4 ----
>   Documentation/translations/zh_CN/mm/memory-model.rst |  7 -------
>   Documentation/translations/zh_CN/mm/mmu_notifier.rst |  8 --------
>   Documentation/translations/zh_CN/mm/numa.rst         |  7 -------
>   .../translations/zh_CN/mm/overcommit-accounting.rst  |  8 --------
>   Documentation/translations/zh_CN/mm/page_frags.rst   |  7 -------
>   .../translations/zh_CN/mm/page_migration.rst         |  6 ------
>   Documentation/translations/zh_CN/mm/page_owner.rst   |  7 -------
>   .../translations/zh_CN/mm/page_table_check.rst       |  7 -------
>   Documentation/translations/zh_CN/mm/page_tables.rst  |  6 ------
>   .../translations/zh_CN/mm/physical_memory.rst        |  4 ----
>   .../translations/zh_CN/mm/remap_file_pages.rst       |  7 -------
>   .../translations/zh_CN/mm/split_page_table_lock.rst  |  7 -------
>   .../zh_CN/mm/vmalloced-kernel-stacks.rst             |  6 ------
>   Documentation/translations/zh_CN/mm/zsmalloc.rst     |  6 ------
>   .../translations/zh_CN/networking/alias.rst          |  6 ------
>   .../translations/zh_CN/networking/driver.rst         |  4 ----
>   .../translations/zh_CN/networking/generic-hdlc.rst   |  4 ----
>   .../translations/zh_CN/networking/index.rst          |  6 ------
>   Documentation/translations/zh_CN/networking/ipv6.rst |  4 ----
>   .../translations/zh_CN/networking/mptcp-sysctl.rst   |  4 ----
>   .../translations/zh_CN/networking/msg_zerocopy.rst   |  9 ---------
>   Documentation/translations/zh_CN/networking/napi.rst |  4 ----
>   .../translations/zh_CN/networking/netif-msg.rst      |  4 ----
>   .../translations/zh_CN/networking/netmem.rst         |  4 ----
>   .../translations/zh_CN/networking/secid.rst          |  4 ----
>   .../translations/zh_CN/networking/sriov.rst          |  4 ----
>   Documentation/translations/zh_CN/networking/team.rst |  4 ----
>   .../translations/zh_CN/networking/timestamping.rst   |  4 ----
>   .../translations/zh_CN/networking/vxlan.rst          |  9 ---------
>   .../translations/zh_CN/networking/xfrm_proc.rst      |  4 ----
>   Documentation/translations/zh_CN/peci/index.rst      |  6 ------
>   Documentation/translations/zh_CN/peci/peci.rst       |  6 ------
>   .../translations/zh_CN/power/energy-model.rst        |  4 ----
>   Documentation/translations/zh_CN/power/index.rst     |  4 ----
>   Documentation/translations/zh_CN/power/opp.rst       |  4 ----
>   Documentation/translations/zh_CN/process/1.Intro.rst |  8 --------
>   .../translations/zh_CN/process/2.Process.rst         |  8 --------
>   .../translations/zh_CN/process/3.Early-stage.rst     |  8 --------
>   .../translations/zh_CN/process/4.Coding.rst          |  8 --------
>   .../translations/zh_CN/process/5.Posting.rst         |  8 --------
>   .../translations/zh_CN/process/6.Followthrough.rst   |  8 --------
>   .../translations/zh_CN/process/7.AdvancedTopics.rst  |  8 --------
>   .../translations/zh_CN/process/8.Conclusion.rst      |  7 -------
>   .../translations/zh_CN/process/applying-patches.rst  |  4 ----
>   .../zh_CN/process/code-of-conduct-interpretation.rst |  1 -
>   .../translations/zh_CN/process/code-of-conduct.rst   |  1 -
>   .../translations/zh_CN/process/coding-style.rst      | 12 ------------
>   Documentation/translations/zh_CN/process/cve.rst     |  1 -
>   .../zh_CN/process/development-process.rst            |  1 -
>   .../translations/zh_CN/process/email-clients.rst     | 10 ----------
>   .../zh_CN/process/embargoed-hardware-issues.rst      |  1 -
>   Documentation/translations/zh_CN/process/howto.rst   | 11 -----------
>   Documentation/translations/zh_CN/process/index.rst   |  4 ----
>   .../zh_CN/process/kernel-driver-statement.rst        |  1 -
>   .../zh_CN/process/kernel-enforcement-statement.rst   |  1 -
>   .../translations/zh_CN/process/license-rules.rst     |  1 -
>   .../translations/zh_CN/process/magic-number.rst      |  8 --------
>   .../zh_CN/process/maintainer-pgp-guide.rst           |  7 -------
>   .../translations/zh_CN/process/management-style.rst  |  1 -
>   .../zh_CN/process/programming-language.rst           |  1 -
>   .../zh_CN/process/researcher-guidelines.rst          |  3 ---
>   .../translations/zh_CN/process/security-bugs.rst     |  5 -----
>   .../zh_CN/process/stable-api-nonsense.rst            |  6 ------
>   .../zh_CN/process/stable-kernel-rules.rst            | 10 ----------
>   .../translations/zh_CN/process/submit-checklist.rst  |  3 ---
>   .../zh_CN/process/submitting-patches.rst             | 10 ----------
>   .../zh_CN/process/volatile-considered-harmful.rst    | 11 -----------
>   .../translations/zh_CN/rust/arch-support.rst         |  4 ----
>   .../translations/zh_CN/rust/coding-guidelines.rst    |  4 ----
>   .../translations/zh_CN/rust/general-information.rst  |  5 -----
>   Documentation/translations/zh_CN/rust/index.rst      |  4 ----
>   .../translations/zh_CN/rust/quick-start.rst          |  5 -----
>   Documentation/translations/zh_CN/rust/testing.rst    |  4 ----
>   .../translations/zh_CN/scheduler/completion.rst      |  8 --------
>   Documentation/translations/zh_CN/scheduler/index.rst |  9 ---------
>   .../translations/zh_CN/scheduler/sched-arch.rst      |  8 --------
>   .../translations/zh_CN/scheduler/sched-bwc.rst       |  8 --------
>   .../translations/zh_CN/scheduler/sched-capacity.rst  |  8 --------
>   .../translations/zh_CN/scheduler/sched-debug.rst     |  4 ----
>   .../zh_CN/scheduler/sched-design-CFS.rst             |  4 ----
>   .../translations/zh_CN/scheduler/sched-domains.rst   |  8 --------
>   .../translations/zh_CN/scheduler/sched-energy.rst    |  4 ----
>   .../zh_CN/scheduler/sched-nice-design.rst            |  4 ----
>   .../translations/zh_CN/scheduler/sched-stats.rst     |  4 ----
>   .../translations/zh_CN/scheduler/schedutil.rst       |  4 ----
>   Documentation/translations/zh_CN/scsi/index.rst      |  8 --------
>   Documentation/translations/zh_CN/scsi/libsas.rst     |  6 ------
>   .../zh_CN/scsi/link_power_management_policy.rst      |  8 --------
>   .../translations/zh_CN/scsi/scsi-parameters.rst      |  8 --------
>   Documentation/translations/zh_CN/scsi/scsi.rst       |  8 --------
>   Documentation/translations/zh_CN/scsi/scsi_eh.rst    |  7 -------
>   .../translations/zh_CN/scsi/scsi_mid_low_api.rst     |  8 --------
>   .../translations/zh_CN/scsi/sd-parameters.rst        |  8 --------
>   Documentation/translations/zh_CN/scsi/wd719x.rst     |  6 ------
>   .../translations/zh_CN/security/IMA-templates.rst    |  3 ---
>   Documentation/translations/zh_CN/security/SCTP.rst   |  3 ---
>   .../translations/zh_CN/security/credentials.rst      |  3 ---
>   Documentation/translations/zh_CN/security/digsig.rst |  3 ---
>   Documentation/translations/zh_CN/security/index.rst  |  4 ----
>   Documentation/translations/zh_CN/security/ipe.rst    |  3 ---
>   .../translations/zh_CN/security/keys/index.rst       |  3 ---
>   .../translations/zh_CN/security/landlock.rst         |  4 ----
>   .../translations/zh_CN/security/lsm-development.rst  |  3 ---
>   Documentation/translations/zh_CN/security/lsm.rst    |  4 ----
>   Documentation/translations/zh_CN/security/sak.rst    |  4 ----
>   .../translations/zh_CN/security/secrets/coco.rst     |  4 ----
>   .../translations/zh_CN/security/secrets/index.rst    |  2 --
>   .../translations/zh_CN/security/self-protection.rst  |  4 ----
>   .../translations/zh_CN/security/siphash.rst          |  4 ----
>   .../zh_CN/security/snp-tdx-threat-model.rst          |  4 ----
>   .../translations/zh_CN/security/tpm/index.rst        |  3 ---
>   .../translations/zh_CN/security/tpm/tpm-security.rst |  3 ---
>   .../zh_CN/security/tpm/tpm_event_log.rst             |  3 ---
>   .../translations/zh_CN/security/tpm/tpm_ftpm_tee.rst |  3 ---
>   .../translations/zh_CN/security/tpm/tpm_tis.rst      |  3 ---
>   .../zh_CN/security/tpm/tpm_vtpm_proxy.rst            |  3 ---
>   .../translations/zh_CN/security/tpm/xen-tpmfront.rst |  3 ---
>   .../translations/zh_CN/sound/hd-audio/controls.rst   |  2 --
>   .../translations/zh_CN/sound/hd-audio/index.rst      |  2 --
>   Documentation/translations/zh_CN/sound/index.rst     |  2 --
>   Documentation/translations/zh_CN/staging/index.rst   |  4 ----
>   .../translations/zh_CN/staging/speculation.rst       |  4 ----
>   Documentation/translations/zh_CN/staging/xz.rst      |  4 ----
>   Documentation/translations/zh_CN/subsystem-apis.rst  |  4 ----
>   Documentation/translations/zh_CN/usb/CREDITS         |  7 -------
>   Documentation/translations/zh_CN/usb/acm.rst         |  7 -------
>   .../translations/zh_CN/usb/authorization.rst         |  7 -------
>   Documentation/translations/zh_CN/usb/chipidea.rst    |  7 -------
>   Documentation/translations/zh_CN/usb/dwc3.rst        |  7 -------
>   Documentation/translations/zh_CN/usb/ehci.rst        |  7 -------
>   Documentation/translations/zh_CN/usb/index.rst       |  7 -------
>   Documentation/translations/zh_CN/usb/usbmon.rst      |  7 -------
>   .../zh_CN/userspace-api/accelerators/ocxl.rst        |  4 ----
>   .../translations/zh_CN/userspace-api/ebpf/index.rst  |  4 ----
>   .../zh_CN/userspace-api/ebpf/syscall.rst             |  4 ----
>   .../translations/zh_CN/userspace-api/futex2.rst      |  4 ----
>   .../translations/zh_CN/userspace-api/index.rst       |  4 ----
>   .../zh_CN/userspace-api/no_new_privs.rst             |  4 ----
>   .../zh_CN/userspace-api/seccomp_filter.rst           |  4 ----
>   .../zh_CN/userspace-api/sysfs-platform_profile.rst   |  4 ----
>   Documentation/translations/zh_CN/virt/acrn/cpuid.rst |  8 --------
>   Documentation/translations/zh_CN/virt/acrn/index.rst |  8 --------
>   .../translations/zh_CN/virt/acrn/introduction.rst    |  8 --------
>   .../translations/zh_CN/virt/acrn/io-request.rst      |  8 --------
>   .../translations/zh_CN/virt/guest-halt-polling.rst   |  8 --------
>   Documentation/translations/zh_CN/virt/index.rst      |  8 --------
>   .../translations/zh_CN/virt/ne_overview.rst          |  8 --------
>   .../translations/zh_CN/virt/paravirt_ops.rst         |  9 ---------
>   332 files changed, 1712 deletions(-)
>
> Range-diff against v2:
> 1:  d99d7c42d635 ! 1:  57bf0bce03cb docs/zh_CN: remove translator-related headers
>      @@ Documentation/translations/zh_CN/process/coding-style.rst
>       - - Andy Deng <theandy.deng@gmail.com>
>       - - 吴想成 <bobwxc@email.cn>
>       -
>      - :校译:
>      -  - 王聪 Wang Cong <xiyou.wangcong@gmail.com>
>      -  - wheelz <kernel.zeng@gmail.com>
>      +-:校译:
>      +- - 王聪 Wang Cong <xiyou.wangcong@gmail.com>
>      +- - wheelz <kernel.zeng@gmail.com>
>      +- - 管旭东 Xudong Guan <xudong.guan@gmail.com>
>      +- - Li Zefan <lizf@cn.fujitsu.com>
>      +- - Wang Chen <wangchen@cn.fujitsu.com>
>      +-
>      + Linux 内核代码风格
>      + ==================
>      +
>       
>        ## Documentation/translations/zh_CN/process/cve.rst ##
>       @@
> 2:  89d676d79f25 ! 2:  8cdaa5708b92 docs/zh_CN: remove Translator field in header template
>      @@ Commit message
>       
>           Suggested-by: Jonathan Corbet <corbet@lwn.net>
>           Signed-off-by: Weijie Yuan <wy@wyuan.org>
>      +    Reviewed-by: Dongliang Mu <dzm91@hust.edu.cn>
>           Link: https://lore.kernel.org/linux-doc/87o6cvrs27.fsf@trenco.lwn.net/
>       
>        ## Documentation/translations/zh_CN/how-to.rst ##

