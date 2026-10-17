Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [13.76.78.106])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACA362222A9;
	Sat, 17 Oct 2026 02:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.76.78.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792202971; cv=none; b=f4mdSdEPRODsoI41MVBU4Rnnhn81jfrxIUG3KR9tivizY9b/5mKK2N7EHJP7LZhVQTG5EzXmQX/6jUkfGxd26f73IY5U8YFzMl5cjH4P3Hgmm9z8Gx5FePeoPuVgaBMyx1nlHpq/SOH4kMHPE1aHDm0MYHiWEffiB+AHaB+6c6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792202971; c=relaxed/simple;
	bh=J6RTVsnhlq2klbgMknyXzjSxW9wR3Zi0SuQbQnDwrLI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pAHF+923959hh6auJYd65b1iy1oBkgV5vhh6os8k34IcDGSPGDQS4WuCShVIsO/jxuAM4ynS96E7IYoOsI2DWAVBbjdosiqqBKCNpoEidwZG07njaeCMvLKa/cPKOZHDYzcc/uzFnBqoqA3rt3exBUe4+Nd9sju2WteNygkEAi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn; spf=pass smtp.mailfrom=hust.edu.cn; arc=none smtp.client-ip=13.76.78.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.50])
	by app1 (Coremail) with UTF8SMTP id IAEQrMCGzqQ72NJq33LwAA--.12176S2;
	Sat, 17 Oct 2026 10:06:51 +0800 (CST)
Received: from [100.81.40.43] (unknown [10.12.191.55])
	by gateway (Coremail) with SMTP id _____wDHCw4v2NJq1uqaAA--.46520S2;
	Sat, 17 Oct 2026 10:06:43 +0800 (CST)
Message-ID: <3ee47cf1-a7a2-481a-bf46-46e74bdaa1e5@hust.edu.cn>
Date: Sat, 17 Oct 2026 10:06:39 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] docs/zh_CN: remove translator-related headers
To: Weijie Yuan <wy@wyuan.org>, Alex Shi <alexs@kernel.org>,
 Yanteng Si <si.yanteng@linux.dev>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 2023002089@link.tyut.edu.cn, alex.shi@linux.alibaba.com,
 baikefan@leap-io-kernel.com, bailu.lin@vivo.com, benx.guo@gmail.com,
 bernard@vivo.com, bobwxc@email.cn, bryan.wu@analog.com,
 businiaoanka@anka1.top, chenfeiyang@loongson.cn, chenhuacai@loongson.cn,
 chenqi@beyondsoft.com, chris.wei.cui@gmail.com, doehyunbaek@gmail.com,
 doubled@leap-io-kernel.com, e12051@motorola.com, eugeneteo@kernel.sg,
 fan.yu9@zte.com.cn, gaochao49@huawei.com, greg@kroah.com,
 harryxiyou@gmail.com, he.peilin@zte.com.cn, hidave.darkstar@gmail.com,
 huang.junhua@zte.com.cn, huangjianghui@uniontech.com,
 kezijie@leap-io-kernel.com, leoyang.li@nxp.com, linyongting@gmail.com,
 liu.hailong6@zte.com.cn, longjin@dragonos.org, luochucheng@vivo.com,
 maoyuxian@cqsoftware.com.cn, martin.petersen@oracle.com, me@lirui.org,
 qiu.yutan@zte.com.cn, r0bertz@gentoo.org, realpuyuwang@gmail.com,
 rockrush@rockwork.org, shao.mingyin@zte.com.cn, siyanteng@loongson.cn,
 sun.yuxi@zte.com.cn, synmyth@gmail.com, tangyeechou@gmail.com,
 theandy.deng@gmail.com, tttturtleruss@hust.edu.cn, wang.longjie1@zte.com.cn,
 wang.yaxin@zte.com.cn, wangqing@vivo.com, wangxiaochen0@gmail.com,
 wangyuli@uniontech.com, wanjiabing@vivo.com, wenhu.wang@vivo.com,
 wodemia@linux.alibaba.com, xiyou.wangcong@gmail.com, xu.xin16@zte.com.cn,
 xxx.phy@gmail.com, yang.tao172@zte.com.cn, yang.yang29@zte.com.cn,
 yaxinsn@163.com, yjzhang@leap-io-kernel.com, zangleigang@hisilicon.com,
 zhangwei@cqsoftware.com.cn, zhaoshuo@cqsoftware.com.cn,
 zhaoyuehui@cqsoftware.com.cn, zhoubinbin@loongson.cn, zhuyan2015@qq.com,
 zpenya1314@gmail.com
References: <cover.1792167855.git.wy@wyuan.org>
 <a7c3af29fd1783bbca36cdacd3f17bf52cd5ef3f.1792167856.git.wy@wyuan.org>
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <a7c3af29fd1783bbca36cdacd3f17bf52cd5ef3f.1792167856.git.wy@wyuan.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:IAEQrMCGzqQ72NJq33LwAA--.12176S2
Authentication-Results: app1; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvAXoWkXFyUAFy5KrWrJry3KrWruFg_yoWDZw4xWo
	Waka15CrZrCF15XF4DGr45Jr47AF13CFZYqr4UKwnFg342qF18Kw18Jw1YgwsIkrW5Ga4f
	WFy8uw45JFZ8J3WUn29KB7ZKAUJUUUjA529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
	AaLaJ3UjIYCTnIWjp_UUUYD7k0a2IF6F4UM7kC6x804xWl1xkIjI8I6I8E6xAIw20EY4v2
	0xvaj40_Wr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7
	IYx2IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1l84ACjcxK
	6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1ln4kS14v26r
	4a6rW5M2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
	64x0Y40En7xvr7AKxVW8Jr0_Cr1UMcIj6x8ErcxFaVAv8VW8uFyUJr1UMcIj6xkF7I0En7
	xvr7AKxVW8Jr0_Cr1UMcvjeVCFs4IE7xkEbVWUJVW8JwCY1x0262kKe7AKxVWrXVW3AwCY
	02Avz4vE-syl42xK82IY6x8ErcxFaVAv8VW8uFyUJr1UMxC20s026xCaFVCjc4AY6r1j6r
	4UMxCIbckI1I0E14v26r4a6rW5MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAF
	wI0_JrI_JrWlx4CE17CEb7AF67AKxVWrXVW8Jr1lIxAIcVC0I7IYx2IY67AKxVW5JVW7Jw
	CI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1x
	MIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIda
	VFxhVjvjDU0xZFpf9x07brXocUUUUU=
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/


On 10/17/26 12:52 AM, Weijie Yuan wrote:
> The headers related to translators and proofreaders appear multiple
> times in our directory. Their information is duplicated with that in the
> commit logs, making it difficult to maintain over an extended period
> of time, as there have been multiple instances of requests to update the
> email address.
>
> Remove all the related fields to make our source clean.
>
> Suggested-by: Jonathan Corbet <corbet@lwn.net>
> Signed-off-by: Weijie Yuan <wy@wyuan.org>
> ---
> The diffs are inconvenient to review, sorry. Because I cannot find a
> better way to split them up besides by directories.

1. I recommend to preserve the RST anchors because other files would use 
this.

2. There are three checkpatch SPDX warnings during the review:

dev-tools/sparse.rst | Missing or malformed SPDX-License-Identifier tag 
in line 1
process/howto.rst | Missing or malformed SPDX-License-Identifier tag in 
line 1
process/kernel-enforcement-statement.rst | Missing or malformed 
SPDX-License-Identifier tag in line 1

Each warning is triggered because the patch changes that file’s first 
line. All three files already lacked an SPDX tag before the patch.

How about fixing them in this patchset?

Dongliang Mu


>
> I am not familiar with the old txt format passages, so I skip them this
> time. Maybe they need to be converted to rst first.
>
> Most of them are hand-maded file by file, so feel free to check them
> with your agent. :-)
>
>   Documentation/translations/zh_CN/PCI/acpi-info.rst |  7 -------
>   Documentation/translations/zh_CN/PCI/index.rst     |  7 -------
>   Documentation/translations/zh_CN/PCI/msi-howto.rst |  8 --------
>   .../translations/zh_CN/PCI/pci-iov-howto.rst       | 10 ----------
>   Documentation/translations/zh_CN/PCI/pci.rst       | 10 ----------
>   .../translations/zh_CN/PCI/pciebus-howto.rst       | 10 ----------
>   Documentation/translations/zh_CN/PCI/sysfs-pci.rst |  8 --------
>   .../zh_CN/accounting/delay-accounting.rst          |  2 --
>   .../translations/zh_CN/accounting/index.rst        |  4 ----
>   .../translations/zh_CN/accounting/psi.rst          |  4 ----
>   .../translations/zh_CN/accounting/taskstats.rst    |  2 --
>   .../translations/zh_CN/admin-guide/README.rst      |  4 ----
>   .../translations/zh_CN/admin-guide/bootconfig.rst  |  2 --
>   .../translations/zh_CN/admin-guide/bug-bisect.rst  |  4 ----
>   .../translations/zh_CN/admin-guide/bug-hunting.rst |  4 ----
>   .../translations/zh_CN/admin-guide/cputopology.rst |  4 ----
>   .../translations/zh_CN/admin-guide/index.rst       |  7 -------
>   .../translations/zh_CN/admin-guide/init.rst        |  4 ----
>   .../zh_CN/admin-guide/lockup-watchdogs.rst         |  4 ----
>   .../zh_CN/admin-guide/mm/damon/index.rst           |  6 ------
>   .../zh_CN/admin-guide/mm/damon/lru_sort.rst        |  6 ------
>   .../zh_CN/admin-guide/mm/damon/reclaim.rst         |  6 ------
>   .../zh_CN/admin-guide/mm/damon/start.rst           |  6 ------
>   .../zh_CN/admin-guide/mm/damon/stat.rst            |  4 ----
>   .../zh_CN/admin-guide/mm/damon/usage.rst           |  6 ------
>   .../translations/zh_CN/admin-guide/mm/index.rst    |  5 -----
>   .../translations/zh_CN/admin-guide/mm/ksm.rst      |  5 -----
>   .../zh_CN/admin-guide/module-signing.rst           |  3 ---
>   .../translations/zh_CN/admin-guide/numastat.rst    |  2 --
>   .../zh_CN/admin-guide/reporting-issues.rst         |  5 -----
>   .../zh_CN/admin-guide/reporting-regressions.rst    |  5 -----
>   .../translations/zh_CN/admin-guide/sysrq.rst       | 10 ----------
>   .../zh_CN/admin-guide/tainted-kernels.rst          |  4 ----
>   .../translations/zh_CN/admin-guide/unicode.rst     |  4 ----
>   .../translations/zh_CN/arch/arm64/amu.rst          |  2 --
>   .../translations/zh_CN/arch/arm64/elf_hwcaps.rst   |  2 --
>   .../translations/zh_CN/arch/arm64/hugetlbpage.rst  |  2 --
>   .../translations/zh_CN/arch/arm64/index.rst        |  4 ----
>   .../translations/zh_CN/arch/arm64/perf.rst         |  2 --
>   .../translations/zh_CN/arch/loongarch/booting.rst  |  4 ----
>   .../translations/zh_CN/arch/loongarch/features.rst |  1 -
>   .../translations/zh_CN/arch/loongarch/index.rst    |  1 -
>   .../zh_CN/arch/loongarch/introduction.rst          |  1 -
>   .../zh_CN/arch/loongarch/irq-chip-model.rst        |  1 -
>   .../translations/zh_CN/arch/mips/booting.rst       |  6 ------
>   .../translations/zh_CN/arch/mips/features.rst      |  6 ------
>   .../translations/zh_CN/arch/mips/index.rst         |  4 ----
>   .../translations/zh_CN/arch/mips/ingenic-tcu.rst   |  6 ------
>   .../translations/zh_CN/arch/openrisc/index.rst     |  6 ------
>   .../zh_CN/arch/openrisc/openrisc_port.rst          |  6 ------
>   .../translations/zh_CN/arch/openrisc/todo.rst      |  6 ------
>   .../translations/zh_CN/arch/parisc/debugging.rst   |  6 ------
>   .../translations/zh_CN/arch/parisc/index.rst       |  6 ------
>   .../translations/zh_CN/arch/parisc/registers.rst   |  6 ------
>   .../zh_CN/arch/riscv/boot-image-header.rst         |  6 ------
>   .../translations/zh_CN/arch/riscv/boot.rst         |  4 ----
>   .../translations/zh_CN/arch/riscv/index.rst        |  6 ------
>   .../zh_CN/arch/riscv/patch-acceptance.rst          |  6 ------
>   .../translations/zh_CN/arch/riscv/vm-layout.rst    |  5 -----
>   Documentation/translations/zh_CN/block/blk-mq.rst  | 10 +---------
>   .../translations/zh_CN/block/data-integrity.rst    |  8 +-------
>   Documentation/translations/zh_CN/block/index.rst   |  6 ------
>   .../translations/zh_CN/core-api/assoc_array.rst    | 10 ----------
>   .../translations/zh_CN/core-api/boot-time-mm.rst   | 10 ----------
>   .../translations/zh_CN/core-api/cachetlb.rst       | 11 -----------
>   .../zh_CN/core-api/circular-buffers.rst            | 10 ----------
>   .../translations/zh_CN/core-api/cpu_hotplug.rst    | 10 ----------
>   .../translations/zh_CN/core-api/errseq.rst         |  8 --------
>   .../translations/zh_CN/core-api/genalloc.rst       | 10 ----------
>   .../zh_CN/core-api/generic-radix-tree.rst          |  4 ----
>   .../translations/zh_CN/core-api/genericirq.rst     | 10 ----------
>   .../zh_CN/core-api/gfp_mask-from-fs-io.rst         | 10 ----------
>   Documentation/translations/zh_CN/core-api/idr.rst  | 10 ----------
>   .../translations/zh_CN/core-api/index.rst          |  6 ------
>   .../translations/zh_CN/core-api/irq/concepts.rst   |  6 ------
>   .../translations/zh_CN/core-api/irq/index.rst      |  7 -------
>   .../zh_CN/core-api/irq/irq-affinity.rst            |  6 ------
>   .../translations/zh_CN/core-api/irq/irq-domain.rst |  7 -------
>   .../zh_CN/core-api/irq/irqflags-tracing.rst        |  6 ------
>   .../translations/zh_CN/core-api/kernel-api.rst     |  7 -------
>   .../translations/zh_CN/core-api/kobject.rst        |  6 ------
>   Documentation/translations/zh_CN/core-api/kref.rst | 10 ----------
>   .../translations/zh_CN/core-api/local_ops.rst      |  6 ------
>   .../zh_CN/core-api/memory-allocation.rst           | 10 ----------
>   .../translations/zh_CN/core-api/memory-hotplug.rst | 10 ----------
>   .../translations/zh_CN/core-api/mm-api.rst         | 11 -----------
>   .../translations/zh_CN/core-api/packing.rst        | 10 ----------
>   .../translations/zh_CN/core-api/padata.rst         |  6 ------
>   .../translations/zh_CN/core-api/printk-basics.rst  |  7 -------
>   .../translations/zh_CN/core-api/printk-formats.rst |  7 -------
>   .../zh_CN/core-api/protection-keys.rst             | 10 ----------
>   .../translations/zh_CN/core-api/rbtree.rst         |  4 ----
>   .../zh_CN/core-api/refcount-vs-atomic.rst          |  6 ------
>   .../zh_CN/core-api/symbol-namespaces.rst           |  6 ------
>   .../translations/zh_CN/core-api/this_cpu_ops.rst   |  8 --------
>   .../zh_CN/core-api/unaligned-memory-access.rst     | 10 ----------
>   .../translations/zh_CN/core-api/watch_queue.rst    | 10 ----------
>   .../translations/zh_CN/core-api/workqueue.rst      |  8 --------
>   .../translations/zh_CN/core-api/xarray.rst         | 11 -----------
>   Documentation/translations/zh_CN/cpu-freq/core.rst |  8 --------
>   .../translations/zh_CN/cpu-freq/cpu-drivers.rst    |  8 --------
>   .../translations/zh_CN/cpu-freq/cpufreq-stats.rst  |  8 --------
>   .../translations/zh_CN/cpu-freq/index.rst          |  6 ------
>   .../translations/zh_CN/dev-tools/gcov.rst          |  1 -
>   .../zh_CN/dev-tools/gdb-kernel-debugging.rst       |  1 -
>   .../translations/zh_CN/dev-tools/index.rst         |  1 -
>   .../translations/zh_CN/dev-tools/kasan.rst         |  1 -
>   .../translations/zh_CN/dev-tools/kcov.rst          |  1 -
>   .../translations/zh_CN/dev-tools/kcsan.rst         |  1 -
>   .../translations/zh_CN/dev-tools/kmemleak.rst      |  1 -
>   .../translations/zh_CN/dev-tools/kmsan.rst         |  1 -
>   .../translations/zh_CN/dev-tools/sparse.rst        | 14 ++------------
>   .../zh_CN/dev-tools/testing-overview.rst           |  1 -
>   .../translations/zh_CN/dev-tools/ubsan.rst         |  8 --------
>   .../translations/zh_CN/devicetree/changesets.rst   |  7 -------
>   .../zh_CN/devicetree/dynamic-resolution-notes.rst  |  6 ------
>   .../translations/zh_CN/devicetree/index.rst        |  7 -------
>   .../translations/zh_CN/devicetree/kernel-api.rst   |  7 -------
>   .../translations/zh_CN/devicetree/of_unittest.rst  |  6 ------
>   .../zh_CN/devicetree/overlay-notes.rst             |  6 ------
>   .../translations/zh_CN/devicetree/usage-model.rst  |  7 -------
>   .../zh_CN/doc-guide/checktransupdate.rst           |  2 --
>   .../translations/zh_CN/doc-guide/contributing.rst  |  2 --
>   .../translations/zh_CN/doc-guide/index.rst         |  2 --
>   .../translations/zh_CN/doc-guide/kernel-doc.rst    |  2 --
>   .../zh_CN/doc-guide/maintainer-profile.rst         |  2 --
>   .../translations/zh_CN/doc-guide/parse-headers.rst |  2 --
>   .../translations/zh_CN/doc-guide/sphinx.rst        |  2 --
>   .../translations/zh_CN/driver-api/gpio/index.rst   |  6 ------
>   .../translations/zh_CN/driver-api/index.rst        |  6 ------
>   .../translations/zh_CN/driver-api/io_ordering.rst  |  7 -------
>   .../translations/zh_CN/driver-api/phy/phy.rst      |  4 ----
>   .../translations/zh_CN/filesystems/debugfs.rst     | 11 -----------
>   .../translations/zh_CN/filesystems/dnotify.rst     |  4 ----
>   .../translations/zh_CN/filesystems/gfs2-glocks.rst |  8 --------
>   .../zh_CN/filesystems/gfs2-uevents.rst             |  8 --------
>   .../translations/zh_CN/filesystems/gfs2.rst        |  8 --------
>   .../translations/zh_CN/filesystems/index.rst       |  3 ---
>   .../translations/zh_CN/filesystems/inotify.rst     |  4 ----
>   .../translations/zh_CN/filesystems/tmpfs.rst       |  2 --
>   .../zh_CN/filesystems/ubifs-authentication.rst     |  8 --------
>   .../translations/zh_CN/filesystems/ubifs.rst       |  8 --------
>   .../translations/zh_CN/filesystems/virtiofs.rst    |  7 -------
>   .../translations/zh_CN/iio/ep93xx_adc.rst          |  6 ------
>   .../translations/zh_CN/iio/iio_configfs.rst        |  6 ------
>   Documentation/translations/zh_CN/iio/index.rst     |  6 ------
>   .../translations/zh_CN/infiniband/core_locking.rst | 11 -----------
>   .../translations/zh_CN/infiniband/index.rst        | 11 -----------
>   .../translations/zh_CN/infiniband/ipoib.rst        | 11 -----------
>   .../translations/zh_CN/infiniband/sysfs.rst        | 11 -----------
>   .../translations/zh_CN/infiniband/tag_matching.rst | 11 -----------
>   .../translations/zh_CN/infiniband/user_mad.rst     | 11 -----------
>   .../translations/zh_CN/infiniband/user_verbs.rst   | 11 -----------
>   .../translations/zh_CN/kbuild/gcc-plugins.rst      |  1 -
>   .../translations/zh_CN/kbuild/headers_install.rst  |  1 -
>   Documentation/translations/zh_CN/kbuild/index.rst  |  1 -
>   Documentation/translations/zh_CN/kbuild/kbuild.rst |  1 -
>   .../translations/zh_CN/kbuild/kconfig.rst          |  1 -
>   Documentation/translations/zh_CN/kbuild/llvm.rst   |  1 -
>   .../zh_CN/kbuild/reproducible-builds.rst           |  2 --
>   .../translations/zh_CN/kernel-hacking/hacking.rst  |  4 ----
>   .../translations/zh_CN/kernel-hacking/index.rst    |  4 ----
>   Documentation/translations/zh_CN/locking/index.rst |  4 ----
>   .../translations/zh_CN/locking/mutex-design.rst    |  4 ----
>   .../translations/zh_CN/locking/spinlocks.rst       |  4 ----
>   .../zh_CN/maintainer/configure-git.rst             |  4 ----
>   .../zh_CN/maintainer/maintainer-entry-profile.rst  |  4 ----
>   .../zh_CN/maintainer/modifying-patches.rst         |  4 ----
>   .../zh_CN/maintainer/pull-requests.rst             |  4 ----
>   .../zh_CN/maintainer/rebasing-and-merging.rst      |  4 ----
>   Documentation/translations/zh_CN/mm/active_mm.rst  |  7 -------
>   Documentation/translations/zh_CN/mm/balance.rst    |  7 -------
>   Documentation/translations/zh_CN/mm/damon/api.rst  |  7 -------
>   .../translations/zh_CN/mm/damon/design.rst         |  7 -------
>   Documentation/translations/zh_CN/mm/damon/faq.rst  |  7 -------
>   .../translations/zh_CN/mm/damon/index.rst          |  7 -------
>   .../translations/zh_CN/mm/free_page_reporting.rst  |  6 ------
>   Documentation/translations/zh_CN/mm/highmem.rst    |  6 ------
>   Documentation/translations/zh_CN/mm/hmm.rst        |  6 ------
>   .../translations/zh_CN/mm/hugetlbfs_reserv.rst     |  6 ------
>   Documentation/translations/zh_CN/mm/hwpoison.rst   |  7 -------
>   Documentation/translations/zh_CN/mm/index.rst      |  6 ------
>   Documentation/translations/zh_CN/mm/ksm.rst        |  4 ----
>   .../translations/zh_CN/mm/memory-model.rst         |  7 -------
>   .../translations/zh_CN/mm/mmu_notifier.rst         |  8 --------
>   Documentation/translations/zh_CN/mm/numa.rst       |  7 -------
>   .../zh_CN/mm/overcommit-accounting.rst             |  8 --------
>   Documentation/translations/zh_CN/mm/page_frags.rst |  7 -------
>   .../translations/zh_CN/mm/page_migration.rst       |  6 ------
>   Documentation/translations/zh_CN/mm/page_owner.rst |  7 -------
>   .../translations/zh_CN/mm/page_table_check.rst     |  7 -------
>   .../translations/zh_CN/mm/page_tables.rst          |  6 ------
>   .../translations/zh_CN/mm/physical_memory.rst      |  4 ----
>   .../translations/zh_CN/mm/remap_file_pages.rst     |  7 -------
>   .../zh_CN/mm/split_page_table_lock.rst             |  7 -------
>   .../zh_CN/mm/vmalloced-kernel-stacks.rst           |  6 ------
>   Documentation/translations/zh_CN/mm/zsmalloc.rst   |  6 ------
>   .../translations/zh_CN/networking/alias.rst        |  6 ------
>   .../translations/zh_CN/networking/driver.rst       |  4 ----
>   .../translations/zh_CN/networking/generic-hdlc.rst |  4 ----
>   .../translations/zh_CN/networking/index.rst        |  6 ------
>   .../translations/zh_CN/networking/ipv6.rst         |  4 ----
>   .../translations/zh_CN/networking/mptcp-sysctl.rst |  4 ----
>   .../translations/zh_CN/networking/msg_zerocopy.rst |  9 ---------
>   .../translations/zh_CN/networking/napi.rst         |  4 ----
>   .../translations/zh_CN/networking/netif-msg.rst    |  4 ----
>   .../translations/zh_CN/networking/netmem.rst       |  4 ----
>   .../translations/zh_CN/networking/secid.rst        |  4 ----
>   .../translations/zh_CN/networking/sriov.rst        |  4 ----
>   .../translations/zh_CN/networking/team.rst         |  4 ----
>   .../translations/zh_CN/networking/timestamping.rst |  4 ----
>   .../translations/zh_CN/networking/vxlan.rst        |  9 ---------
>   .../translations/zh_CN/networking/xfrm_proc.rst    |  4 ----
>   Documentation/translations/zh_CN/peci/index.rst    |  6 ------
>   Documentation/translations/zh_CN/peci/peci.rst     |  6 ------
>   .../translations/zh_CN/power/energy-model.rst      |  4 ----
>   Documentation/translations/zh_CN/power/index.rst   |  4 ----
>   Documentation/translations/zh_CN/power/opp.rst     |  4 ----
>   .../translations/zh_CN/process/1.Intro.rst         | 10 ----------
>   .../translations/zh_CN/process/2.Process.rst       |  8 --------
>   .../translations/zh_CN/process/3.Early-stage.rst   |  8 --------
>   .../translations/zh_CN/process/4.Coding.rst        |  8 --------
>   .../translations/zh_CN/process/5.Posting.rst       |  8 --------
>   .../translations/zh_CN/process/6.Followthrough.rst |  8 --------
>   .../zh_CN/process/7.AdvancedTopics.rst             |  8 --------
>   .../translations/zh_CN/process/8.Conclusion.rst    |  7 -------
>   .../zh_CN/process/applying-patches.rst             |  4 ----
>   .../process/code-of-conduct-interpretation.rst     |  1 -
>   .../translations/zh_CN/process/code-of-conduct.rst |  1 -
>   .../translations/zh_CN/process/coding-style.rst    |  5 -----
>   Documentation/translations/zh_CN/process/cve.rst   |  1 -
>   .../zh_CN/process/development-process.rst          |  3 ---
>   .../translations/zh_CN/process/email-clients.rst   | 10 ----------
>   .../zh_CN/process/embargoed-hardware-issues.rst    |  1 -
>   Documentation/translations/zh_CN/process/howto.rst | 13 +------------
>   Documentation/translations/zh_CN/process/index.rst |  4 ----
>   .../zh_CN/process/kernel-driver-statement.rst      |  3 ---
>   .../zh_CN/process/kernel-enforcement-statement.rst |  5 +----
>   .../translations/zh_CN/process/license-rules.rst   |  1 -
>   .../translations/zh_CN/process/magic-number.rst    |  8 --------
>   .../zh_CN/process/maintainer-pgp-guide.rst         |  7 -------
>   .../zh_CN/process/management-style.rst             |  1 -
>   .../zh_CN/process/programming-language.rst         |  1 -
>   .../zh_CN/process/researcher-guidelines.rst        |  5 -----
>   .../translations/zh_CN/process/security-bugs.rst   |  5 -----
>   .../zh_CN/process/stable-api-nonsense.rst          |  6 ------
>   .../zh_CN/process/stable-kernel-rules.rst          | 12 ------------
>   .../zh_CN/process/submit-checklist.rst             |  3 ---
>   .../zh_CN/process/submitting-patches.rst           | 10 ----------
>   .../zh_CN/process/volatile-considered-harmful.rst  | 13 -------------
>   .../translations/zh_CN/rust/arch-support.rst       |  4 ----
>   .../translations/zh_CN/rust/coding-guidelines.rst  |  4 ----
>   .../zh_CN/rust/general-information.rst             |  5 -----
>   Documentation/translations/zh_CN/rust/index.rst    |  4 ----
>   .../translations/zh_CN/rust/quick-start.rst        |  5 -----
>   Documentation/translations/zh_CN/rust/testing.rst  |  4 ----
>   .../translations/zh_CN/scheduler/completion.rst    |  8 --------
>   .../translations/zh_CN/scheduler/index.rst         |  9 ---------
>   .../translations/zh_CN/scheduler/sched-arch.rst    |  8 --------
>   .../translations/zh_CN/scheduler/sched-bwc.rst     |  8 --------
>   .../zh_CN/scheduler/sched-capacity.rst             |  8 --------
>   .../translations/zh_CN/scheduler/sched-debug.rst   |  4 ----
>   .../zh_CN/scheduler/sched-design-CFS.rst           |  4 ----
>   .../translations/zh_CN/scheduler/sched-domains.rst |  8 --------
>   .../translations/zh_CN/scheduler/sched-energy.rst  |  4 ----
>   .../zh_CN/scheduler/sched-nice-design.rst          |  4 ----
>   .../translations/zh_CN/scheduler/sched-stats.rst   |  4 ----
>   .../translations/zh_CN/scheduler/schedutil.rst     |  4 ----
>   Documentation/translations/zh_CN/scsi/index.rst    |  8 --------
>   Documentation/translations/zh_CN/scsi/libsas.rst   |  6 ------
>   .../zh_CN/scsi/link_power_management_policy.rst    |  8 --------
>   .../translations/zh_CN/scsi/scsi-parameters.rst    |  8 --------
>   Documentation/translations/zh_CN/scsi/scsi.rst     |  8 --------
>   Documentation/translations/zh_CN/scsi/scsi_eh.rst  |  7 -------
>   .../translations/zh_CN/scsi/scsi_mid_low_api.rst   |  8 --------
>   .../translations/zh_CN/scsi/sd-parameters.rst      |  8 --------
>   Documentation/translations/zh_CN/scsi/wd719x.rst   |  6 ------
>   .../translations/zh_CN/security/IMA-templates.rst  |  3 ---
>   Documentation/translations/zh_CN/security/SCTP.rst |  3 ---
>   .../translations/zh_CN/security/credentials.rst    |  3 ---
>   .../translations/zh_CN/security/digsig.rst         |  3 ---
>   .../translations/zh_CN/security/index.rst          |  4 ----
>   Documentation/translations/zh_CN/security/ipe.rst  |  3 ---
>   .../translations/zh_CN/security/keys/index.rst     |  3 ---
>   .../translations/zh_CN/security/landlock.rst       |  4 ----
>   .../zh_CN/security/lsm-development.rst             |  3 ---
>   Documentation/translations/zh_CN/security/lsm.rst  |  4 ----
>   Documentation/translations/zh_CN/security/sak.rst  |  4 ----
>   .../translations/zh_CN/security/secrets/coco.rst   |  4 ----
>   .../translations/zh_CN/security/secrets/index.rst  |  2 --
>   .../zh_CN/security/self-protection.rst             |  4 ----
>   .../translations/zh_CN/security/siphash.rst        |  4 ----
>   .../zh_CN/security/snp-tdx-threat-model.rst        |  4 ----
>   .../translations/zh_CN/security/tpm/index.rst      |  3 ---
>   .../zh_CN/security/tpm/tpm-security.rst            |  3 ---
>   .../zh_CN/security/tpm/tpm_event_log.rst           |  3 ---
>   .../zh_CN/security/tpm/tpm_ftpm_tee.rst            |  3 ---
>   .../translations/zh_CN/security/tpm/tpm_tis.rst    |  3 ---
>   .../zh_CN/security/tpm/tpm_vtpm_proxy.rst          |  3 ---
>   .../zh_CN/security/tpm/xen-tpmfront.rst            |  3 ---
>   .../translations/zh_CN/sound/hd-audio/controls.rst |  2 --
>   .../translations/zh_CN/sound/hd-audio/index.rst    |  2 --
>   Documentation/translations/zh_CN/sound/index.rst   |  2 --
>   Documentation/translations/zh_CN/staging/index.rst |  4 ----
>   .../translations/zh_CN/staging/speculation.rst     |  4 ----
>   Documentation/translations/zh_CN/staging/xz.rst    |  4 ----
>   .../translations/zh_CN/subsystem-apis.rst          |  4 ----
>   Documentation/translations/zh_CN/usb/CREDITS       |  7 -------
>   Documentation/translations/zh_CN/usb/acm.rst       |  7 -------
>   .../translations/zh_CN/usb/authorization.rst       |  7 -------
>   Documentation/translations/zh_CN/usb/chipidea.rst  |  7 -------
>   Documentation/translations/zh_CN/usb/dwc3.rst      |  7 -------
>   Documentation/translations/zh_CN/usb/ehci.rst      |  7 -------
>   Documentation/translations/zh_CN/usb/index.rst     |  7 -------
>   Documentation/translations/zh_CN/usb/usbmon.rst    |  7 -------
>   .../zh_CN/userspace-api/accelerators/ocxl.rst      |  4 ----
>   .../zh_CN/userspace-api/ebpf/index.rst             |  4 ----
>   .../zh_CN/userspace-api/ebpf/syscall.rst           |  4 ----
>   .../translations/zh_CN/userspace-api/futex2.rst    |  4 ----
>   .../translations/zh_CN/userspace-api/index.rst     |  4 ----
>   .../zh_CN/userspace-api/no_new_privs.rst           |  4 ----
>   .../zh_CN/userspace-api/seccomp_filter.rst         |  4 ----
>   .../zh_CN/userspace-api/sysfs-platform_profile.rst |  4 ----
>   .../translations/zh_CN/virt/acrn/cpuid.rst         | 10 ----------
>   .../translations/zh_CN/virt/acrn/index.rst         | 10 ----------
>   .../translations/zh_CN/virt/acrn/introduction.rst  | 10 ----------
>   .../translations/zh_CN/virt/acrn/io-request.rst    | 10 ----------
>   .../translations/zh_CN/virt/guest-halt-polling.rst | 10 ----------
>   Documentation/translations/zh_CN/virt/index.rst    | 10 ----------
>   .../translations/zh_CN/virt/ne_overview.rst        | 10 ----------
>   .../translations/zh_CN/virt/paravirt_ops.rst       | 11 -----------
>   331 files changed, 6 insertions(+), 1866 deletions(-)
>
> diff --git a/Documentation/translations/zh_CN/PCI/acpi-info.rst b/Documentation/translations/zh_CN/PCI/acpi-info.rst
> index a35f39dcd858..9773d96f80ee 100644
> --- a/Documentation/translations/zh_CN/PCI/acpi-info.rst
> +++ b/Documentation/translations/zh_CN/PCI/acpi-info.rst
> @@ -3,13 +3,6 @@
>   
>   :Original: Documentation/PCI/acpi-info.rst
>   
> -:翻译:
> -
> - 司延腾 Yanteng Si <siyanteng@loongson.cn>
> -
> -:校译:
> -
> -
>   =====================
>   PCI主桥的ACPI注意事项
>   =====================
> diff --git a/Documentation/translations/zh_CN/PCI/index.rst b/Documentation/translations/zh_CN/PCI/index.rst
> index cbeb33c34a98..f54d02317b2c 100644
> --- a/Documentation/translations/zh_CN/PCI/index.rst
> +++ b/Documentation/translations/zh_CN/PCI/index.rst
> @@ -3,13 +3,6 @@
>   
>   :Original: Documentation/PCI/index.rst
>   
> -:翻译:
> -
> - 司延腾 Yanteng Si <siyanteng@loongson.cn>
> -
> -:校译:
> -
> -
>   ===================
>   Linux PCI总线子系统
>   ===================
> diff --git a/Documentation/translations/zh_CN/PCI/msi-howto.rst b/Documentation/translations/zh_CN/PCI/msi-howto.rst
> index 95baadf767e4..f476a28f1511 100644
> --- a/Documentation/translations/zh_CN/PCI/msi-howto.rst
> +++ b/Documentation/translations/zh_CN/PCI/msi-howto.rst
> @@ -4,14 +4,6 @@
>   
>   :Original: Documentation/PCI/msi-howto.rst
>   
> -:翻译:
> -
> - 司延腾 Yanteng Si <siyanteng@loongson.cn>
> -
> -:校译:
> -
> -
> -
>   ===========
>   MSI驱动指南
>   ===========
> diff --git a/Documentation/translations/zh_CN/PCI/pci-iov-howto.rst b/Documentation/translations/zh_CN/PCI/pci-iov-howto.rst
> index fb023ea1374d..698ab8925f6f 100644
> --- a/Documentation/translations/zh_CN/PCI/pci-iov-howto.rst
> +++ b/Documentation/translations/zh_CN/PCI/pci-iov-howto.rst
> @@ -4,16 +4,6 @@
>   
>   :Original: Documentation/PCI/pci-iov-howto.rst
>   
> -:翻译:
> -
> - 司延腾 Yanteng Si <siyanteng@loongson.cn>
> -
> -:校译:
> -
> -
> -
> -.. _cn_pci-iov-howto:
> -
>   ==========================
>   PCI Express I/O 虚拟化指南
>   ==========================
> diff --git a/Documentation/translations/zh_CN/PCI/pci.rst b/Documentation/translations/zh_CN/PCI/pci.rst
> index 347f5c3f5ce9..a915543a4be2 100644
> --- a/Documentation/translations/zh_CN/PCI/pci.rst
> +++ b/Documentation/translations/zh_CN/PCI/pci.rst
> @@ -3,16 +3,6 @@
>   
>   :Original: Documentation/PCI/pci.rst
>   
> -:翻译:
> -
> - 司延腾 Yanteng Si <siyanteng@loongson.cn>
> -
> -:校译:
> -
> -
> -
> -.. _cn_PCI_pci.rst:
> -
>   ===================
>   如何写Linux PCI驱动
>   ===================
> diff --git a/Documentation/translations/zh_CN/PCI/pciebus-howto.rst b/Documentation/translations/zh_CN/PCI/pciebus-howto.rst
> index c6ffda62af21..c0967a684a5b 100644
> --- a/Documentation/translations/zh_CN/PCI/pciebus-howto.rst
> +++ b/Documentation/translations/zh_CN/PCI/pciebus-howto.rst
> @@ -4,16 +4,6 @@
>   
>   :Original: Documentation/PCI/pciebus-howto.rst
>   
> -:翻译:
> -
> - 司延腾 Yanteng Si <siyanteng@loongson.cn>
> -
> -:校译:
> -
> -
> -
> -.. _cn_pciebus-howto:
> -
>   ===========================
>   PCI Express端口总线驱动指南
>   ===========================
> diff --git a/Documentation/translations/zh_CN/PCI/sysfs-pci.rst b/Documentation/translations/zh_CN/PCI/sysfs-pci.rst
> index 0d75c2e99d52..cb90166e5b07 100644
> --- a/Documentation/translations/zh_CN/PCI/sysfs-pci.rst
> +++ b/Documentation/translations/zh_CN/PCI/sysfs-pci.rst
> @@ -3,14 +3,6 @@
>   
>   :Original: Documentation/PCI/sysfs-pci.rst
>   
> -:翻译:
> -
> - 司延腾 Yanteng Si <siyanteng@loongson.cn>
> -
> -:校译:
> -
> -
> -
>   ========================
>   通过sysfs访问PCI设备资源
>   ========================
> diff --git a/Documentation/translations/zh_CN/accounting/delay-accounting.rst b/Documentation/translations/zh_CN/accounting/delay-accounting.rst
> index 7b8693ccf80a..6386475b1376 100644
> --- a/Documentation/translations/zh_CN/accounting/delay-accounting.rst
> +++ b/Documentation/translations/zh_CN/accounting/delay-accounting.rst
> @@ -2,8 +2,6 @@
>   
>   :Original: Documentation/accounting/delay-accounting.rst
>   
> -:Translator: Yang Yang <yang.yang29@zte.com.cn>
> -
>   ========
>   延时计数
>   ========
> diff --git a/Documentation/translations/zh_CN/accounting/index.rst b/Documentation/translations/zh_CN/accounting/index.rst
> index a34952e12a27..0090c22a4578 100644
> --- a/Documentation/translations/zh_CN/accounting/index.rst
> +++ b/Documentation/translations/zh_CN/accounting/index.rst
> @@ -3,10 +3,6 @@
>   .. include:: ../disclaimer-zh_CN.rst
>   
>   :Original: Documentation/accounting/index.rst
> -:Translator: Yang Yang <yang.yang29@zte.com.cn>
> -
> -.. _cn_accounting_index.rst:
> -
>   
>   ====
>   计数
> diff --git a/Documentation/translations/zh_CN/accounting/psi.rst b/Documentation/translations/zh_CN/accounting/psi.rst
> index 703bc81ff9be..6bcc1bdd0c67 100644
> --- a/Documentation/translations/zh_CN/accounting/psi.rst
> +++ b/Documentation/translations/zh_CN/accounting/psi.rst
> @@ -1,10 +1,6 @@
>   .. include:: ../disclaimer-zh_CN.rst
>   
>   :Original: Documentation/accounting/psi.rst
> -:Translator: Yang Yang <yang.yang29@zte.com.cn>
> -
> -.. _cn_psi.rst:
> -
>   
>   =================
>   PSI——压力阻塞信息
> diff --git a/Documentation/translations/zh_CN/accounting/taskstats.rst b/Documentation/translations/zh_CN/accounting/taskstats.rst
> index 307ac5ce0e4b..6c0a7964fc3c 100644
> --- a/Documentation/translations/zh_CN/accounting/taskstats.rst
> +++ b/Documentation/translations/zh_CN/accounting/taskstats.rst
> @@ -2,8 +2,6 @@
>   
>   :Original: Documentation/accounting/taskstats.rst
>   
> -:Translator: Yang Yang <yang.yang29@zte.com.cn>
> -
>   ================
>   每任务的统计接口
>   ================
> diff --git a/Documentation/translations/zh_CN/admin-guide/README.rst b/Documentation/translations/zh_CN/admin-guide/README.rst
> index ee6dd3782f4a..9048837ff52b 100644
> --- a/Documentation/translations/zh_CN/admin-guide/README.rst
> +++ b/Documentation/translations/zh_CN/admin-guide/README.rst
> @@ -2,10 +2,6 @@
>   
>   :Original: Documentation/admin-guide/README.rst
>   
> -:译者:
> -
> - 吴想成 Wu XiangCheng <bobwxc@email.cn>
> -
>   Linux内核6.x版本 <http://kernel.org/>
>   =========================================
>   
> diff --git a/Documentation/translations/zh_CN/admin-guide/bootconfig.rst b/Documentation/translations/zh_CN/admin-guide/bootconfig.rst
> index 072d17f5f199..124b1d60ff38 100644
> --- a/Documentation/translations/zh_CN/admin-guide/bootconfig.rst
> +++ b/Documentation/translations/zh_CN/admin-guide/bootconfig.rst
> @@ -4,8 +4,6 @@
>   
>   :Original: Documentation/admin-guide/bootconfig.rst
>   
> -:译者: 吴想成 Wu XiangCheng <bobwxc@email.cn>
> -
>   ========
>   引导配置
>   ========
> diff --git a/Documentation/translations/zh_CN/admin-guide/bug-bisect.rst b/Documentation/translations/zh_CN/admin-guide/bug-bisect.rst
> index 662eb5b46e84..7a9c42f4f7d2 100644
> --- a/Documentation/translations/zh_CN/admin-guide/bug-bisect.rst
> +++ b/Documentation/translations/zh_CN/admin-guide/bug-bisect.rst
> @@ -2,10 +2,6 @@
>   
>   :Original: :doc:`../../../admin-guide/bug-bisect`
>   
> -:译者:
> -
> - 吴想成 Wu XiangCheng <bobwxc@email.cn>
> -
>   二分（bisect）缺陷
>   +++++++++++++++++++
>   
> diff --git a/Documentation/translations/zh_CN/admin-guide/bug-hunting.rst b/Documentation/translations/zh_CN/admin-guide/bug-hunting.rst
> index f20bf5be4cf9..1666782eed42 100644
> --- a/Documentation/translations/zh_CN/admin-guide/bug-hunting.rst
> +++ b/Documentation/translations/zh_CN/admin-guide/bug-hunting.rst
> @@ -2,10 +2,6 @@
>   
>   :Original: :doc:`../../../admin-guide/bug-hunting`
>   
> -:译者:
> -
> - 吴想成 Wu XiangCheng <bobwxc@email.cn>
> -
>   追踪缺陷
>   =========
>   
> diff --git a/Documentation/translations/zh_CN/admin-guide/cputopology.rst b/Documentation/translations/zh_CN/admin-guide/cputopology.rst
> index 544d42f8f3fa..774b15e352b2 100644
> --- a/Documentation/translations/zh_CN/admin-guide/cputopology.rst
> +++ b/Documentation/translations/zh_CN/admin-guide/cputopology.rst
> @@ -3,10 +3,6 @@
>   
>   :Original: Documentation/admin-guide/cputopology.rst
>   
> -:翻译:
> -
> -  唐艺舟 Tang Yizhou <tangyeechou@gmail.com>
> -
>   ==========================
>   如何通过sysfs将CPU拓扑导出
>   ==========================
> diff --git a/Documentation/translations/zh_CN/admin-guide/index.rst b/Documentation/translations/zh_CN/admin-guide/index.rst
> index bd01cf6474c8..d7acbed8d2c4 100644
> --- a/Documentation/translations/zh_CN/admin-guide/index.rst
> +++ b/Documentation/translations/zh_CN/admin-guide/index.rst
> @@ -3,13 +3,6 @@
>   
>   :Original: Documentation/admin-guide/index.rst
>   
> -:翻译:
> -
> - 时奎亮 Alex Shi <alex.shi@linux.alibaba.com>
> -
> - 朱岩 Yan Zhu <zhuyan2015@qq.com>
> -
> -
>   Linux 内核用户和管理员指南
>   ==========================
>   
> diff --git a/Documentation/translations/zh_CN/admin-guide/init.rst b/Documentation/translations/zh_CN/admin-guide/init.rst
> index fbaf6d97f86c..dc2b046c4938 100644
> --- a/Documentation/translations/zh_CN/admin-guide/init.rst
> +++ b/Documentation/translations/zh_CN/admin-guide/init.rst
> @@ -2,10 +2,6 @@
>   
>   :Original: :doc:`../../../admin-guide/init`
>   
> -:译者:
> -
> - 吴想成 Wu XiangCheng <bobwxc@email.cn>
> -
>   解释“No working init found.”启动挂起消息
>   =========================================
>   
> diff --git a/Documentation/translations/zh_CN/admin-guide/lockup-watchdogs.rst b/Documentation/translations/zh_CN/admin-guide/lockup-watchdogs.rst
> index 55ed3f4af442..bc56eb861370 100644
> --- a/Documentation/translations/zh_CN/admin-guide/lockup-watchdogs.rst
> +++ b/Documentation/translations/zh_CN/admin-guide/lockup-watchdogs.rst
> @@ -1,10 +1,6 @@
>   .. include:: ../disclaimer-zh_CN.rst
>   
>   :Original: Documentation/admin-guide/lockup-watchdogs.rst
> -:Translator: Hailong Liu <liu.hailong6@zte.com.cn>
> -
> -.. _cn_lockup-watchdogs:
> -
>   
>   =================================================
>   Softlockup与hardlockup检测机制(又名:nmi_watchdog)
> diff --git a/Documentation/translations/zh_CN/admin-guide/mm/damon/index.rst b/Documentation/translations/zh_CN/admin-guide/mm/damon/index.rst
> index 77bbfa7c25dc..52a0d1047285 100644
> --- a/Documentation/translations/zh_CN/admin-guide/mm/damon/index.rst
> +++ b/Documentation/translations/zh_CN/admin-guide/mm/damon/index.rst
> @@ -3,12 +3,6 @@
>   
>   :Original: Documentation/admin-guide/mm/damon/index.rst
>   
> -:翻译:
> -
> - 司延腾 Yanteng Si <siyanteng@loongson.cn>
> -
> -:校译:
> -
>   ========================================
>   DAMON：数据访问监测和访问感知系统操作
>   ========================================
> diff --git a/Documentation/translations/zh_CN/admin-guide/mm/damon/lru_sort.rst b/Documentation/translations/zh_CN/admin-guide/mm/damon/lru_sort.rst
> index 6af0dd59ef5d..e9a600058638 100644
> --- a/Documentation/translations/zh_CN/admin-guide/mm/damon/lru_sort.rst
> +++ b/Documentation/translations/zh_CN/admin-guide/mm/damon/lru_sort.rst
> @@ -3,12 +3,6 @@
>   
>   :Original: Documentation/admin-guide/mm/damon/lru_sort.rst
>   
> -:翻译:
> -
> - 臧雷刚 Leigang Zang <zangleigang@hisilicon.com>
> -
> -:校译:
> -
>   ==================
>   基于DAMON的LRU排序
>   ==================
> diff --git a/Documentation/translations/zh_CN/admin-guide/mm/damon/reclaim.rst b/Documentation/translations/zh_CN/admin-guide/mm/damon/reclaim.rst
> index 1e9375947295..e0fc398a7382 100644
> --- a/Documentation/translations/zh_CN/admin-guide/mm/damon/reclaim.rst
> +++ b/Documentation/translations/zh_CN/admin-guide/mm/damon/reclaim.rst
> @@ -3,12 +3,6 @@
>   
>   :Original: Documentation/admin-guide/mm/damon/reclaim.rst
>   
> -:翻译:
> -
> - 司延腾 Yanteng Si <siyanteng@loongson.cn>
> -
> -:校译:
> -
>   ===============
>   基于DAMON的回收
>   ===============
> diff --git a/Documentation/translations/zh_CN/admin-guide/mm/damon/start.rst b/Documentation/translations/zh_CN/admin-guide/mm/damon/start.rst
> index 1a7f3382dd15..1eec14b844f7 100644
> --- a/Documentation/translations/zh_CN/admin-guide/mm/damon/start.rst
> +++ b/Documentation/translations/zh_CN/admin-guide/mm/damon/start.rst
> @@ -3,12 +3,6 @@
>   
>   :Original: Documentation/admin-guide/mm/damon/start.rst
>   
> -:翻译:
> -
> - 司延腾 Yanteng Si <siyanteng@loongson.cn>
> -
> -:校译:
> -
>   ========
>   入门指南
>   ========
> diff --git a/Documentation/translations/zh_CN/admin-guide/mm/damon/stat.rst b/Documentation/translations/zh_CN/admin-guide/mm/damon/stat.rst
> index 129748a5ea1f..8384ba9749c0 100644
> --- a/Documentation/translations/zh_CN/admin-guide/mm/damon/stat.rst
> +++ b/Documentation/translations/zh_CN/admin-guide/mm/damon/stat.rst
> @@ -3,10 +3,6 @@
>   
>   :Original: Documentation/admin-guide/mm/damon/stat.rst
>   
> -:翻译:
> -
> - Doehyun Baek <doehyunbaek@gmail.com>
> -
>   ====================
>   数据访问监测结果统计
>   ====================
> diff --git a/Documentation/translations/zh_CN/admin-guide/mm/damon/usage.rst b/Documentation/translations/zh_CN/admin-guide/mm/damon/usage.rst
> index f2fe1c8025fa..e92dfe4ef3fe 100644
> --- a/Documentation/translations/zh_CN/admin-guide/mm/damon/usage.rst
> +++ b/Documentation/translations/zh_CN/admin-guide/mm/damon/usage.rst
> @@ -3,12 +3,6 @@
>   
>   :Original: Documentation/admin-guide/mm/damon/usage.rst
>   
> -:翻译:
> -
> - 司延腾 Yanteng Si <siyanteng@loongson.cn>
> -
> -:校译:
> -
>   ========
>   详细用法
>   ========
> diff --git a/Documentation/translations/zh_CN/admin-guide/mm/index.rst b/Documentation/translations/zh_CN/admin-guide/mm/index.rst
> index a8fd2c4a8796..15d2f5b7ab94 100644
> --- a/Documentation/translations/zh_CN/admin-guide/mm/index.rst
> +++ b/Documentation/translations/zh_CN/admin-guide/mm/index.rst
> @@ -2,11 +2,6 @@
>   
>   :Original:   Documentation/admin-guide/mm/index.rst
>   
> -:翻译:
> -
> -  徐鑫 xu xin <xu.xin16@zte.com.cn>
> -
> -
>   ========
>   内存管理
>   ========
> diff --git a/Documentation/translations/zh_CN/admin-guide/mm/ksm.rst b/Documentation/translations/zh_CN/admin-guide/mm/ksm.rst
> index 0029c4fd2201..19f1c2c0398f 100644
> --- a/Documentation/translations/zh_CN/admin-guide/mm/ksm.rst
> +++ b/Documentation/translations/zh_CN/admin-guide/mm/ksm.rst
> @@ -2,11 +2,6 @@
>   
>   :Original: Documentation/admin-guide/mm/ksm.rst
>   
> -:翻译:
> -
> -  徐鑫 xu xin <xu.xin16@zte.com.cn>
> -
> -
>   ============
>   内核同页合并
>   ============
> diff --git a/Documentation/translations/zh_CN/admin-guide/module-signing.rst b/Documentation/translations/zh_CN/admin-guide/module-signing.rst
> index b5671224f102..29251080254d 100644
> --- a/Documentation/translations/zh_CN/admin-guide/module-signing.rst
> +++ b/Documentation/translations/zh_CN/admin-guide/module-signing.rst
> @@ -2,9 +2,6 @@
>   .. include:: ../disclaimer-zh_CN.rst
>   
>   :Original: Documentation/admin-guide/module-signing.rst
> -:翻译:
> - 朱岩 Yan Zhu <zhuyan2015@qq.com>
> -
>   
>   ================
>   内核模块签名机制
> diff --git a/Documentation/translations/zh_CN/admin-guide/numastat.rst b/Documentation/translations/zh_CN/admin-guide/numastat.rst
> index 4d9817b91870..ac4f4cc20a8d 100644
> --- a/Documentation/translations/zh_CN/admin-guide/numastat.rst
> +++ b/Documentation/translations/zh_CN/admin-guide/numastat.rst
> @@ -2,8 +2,6 @@
>   .. include:: ../disclaimer-zh_CN.rst
>   
>   :Original: Documentation/admin-guide/numastat.rst
> -:Translator: Tao Zou <wodemia@linux.alibaba.com>
> -
>   
>   =======================
>   Numa策略命中/未命中统计
> diff --git a/Documentation/translations/zh_CN/admin-guide/reporting-issues.rst b/Documentation/translations/zh_CN/admin-guide/reporting-issues.rst
> index 9ff4ba94391d..269274620899 100644
> --- a/Documentation/translations/zh_CN/admin-guide/reporting-issues.rst
> +++ b/Documentation/translations/zh_CN/admin-guide/reporting-issues.rst
> @@ -6,11 +6,6 @@
>   
>   :Original: Documentation/admin-guide/reporting-issues.rst
>   
> -:译者:
> -
> - 吴想成 Wu XiangCheng <bobwxc@email.cn>
> -
> -
>   报告问题
>   +++++++++
>   
> diff --git a/Documentation/translations/zh_CN/admin-guide/reporting-regressions.rst b/Documentation/translations/zh_CN/admin-guide/reporting-regressions.rst
> index c0461ee855bc..014b6c81b04b 100644
> --- a/Documentation/translations/zh_CN/admin-guide/reporting-regressions.rst
> +++ b/Documentation/translations/zh_CN/admin-guide/reporting-regressions.rst
> @@ -5,11 +5,6 @@
>   
>   :Original: Documentation/admin-guide/reporting-regressions.rst
>   
> -:译者:
> -
> - 吴想成 Wu XiangCheng <bobwxc@email.cn>
> -
> -
>   ============
>   报告回归问题
>   ============
> diff --git a/Documentation/translations/zh_CN/admin-guide/sysrq.rst b/Documentation/translations/zh_CN/admin-guide/sysrq.rst
> index 6b100acc4ed8..2a454f459fbf 100644
> --- a/Documentation/translations/zh_CN/admin-guide/sysrq.rst
> +++ b/Documentation/translations/zh_CN/admin-guide/sysrq.rst
> @@ -2,16 +2,6 @@
>   
>   :Original: Documentation/admin-guide/sysrq.rst
>   
> -:翻译:
> -
> - 黄军华 Junhua Huang <huang.junhua@zte.com.cn>
> -
> -:校译:
> -
> - 司延腾 Yanteng Si <siyanteng@loongson.cn>
> -
> -.. _cn_admin-guide_sysrq:
> -
>   Linux 魔法系统请求键骇客
>   ========================
>   
> diff --git a/Documentation/translations/zh_CN/admin-guide/tainted-kernels.rst b/Documentation/translations/zh_CN/admin-guide/tainted-kernels.rst
> index bc51d7cff9b0..590585abc9c5 100644
> --- a/Documentation/translations/zh_CN/admin-guide/tainted-kernels.rst
> +++ b/Documentation/translations/zh_CN/admin-guide/tainted-kernels.rst
> @@ -2,10 +2,6 @@
>   
>   :Original: :doc:`../../../admin-guide/tainted-kernels`
>   
> -:译者:
> -
> - 吴想成 Wu XiangCheng <bobwxc@email.cn>
> -
>   受污染的内核
>   -------------
>   
> diff --git a/Documentation/translations/zh_CN/admin-guide/unicode.rst b/Documentation/translations/zh_CN/admin-guide/unicode.rst
> index b0b08d2b6eb7..eb5ae079b5e4 100644
> --- a/Documentation/translations/zh_CN/admin-guide/unicode.rst
> +++ b/Documentation/translations/zh_CN/admin-guide/unicode.rst
> @@ -2,10 +2,6 @@
>   
>   :Original: Documentation/admin-guide/unicode.rst
>   
> -:译者:
> -
> - 吴想成 Wu XiangCheng <bobwxc@email.cn>
> -
>   Unicode（统一码）支持
>   ======================
>   
> diff --git a/Documentation/translations/zh_CN/arch/arm64/amu.rst b/Documentation/translations/zh_CN/arch/arm64/amu.rst
> index f8e09fd21ef5..2c2f3b01fc94 100644
> --- a/Documentation/translations/zh_CN/arch/arm64/amu.rst
> +++ b/Documentation/translations/zh_CN/arch/arm64/amu.rst
> @@ -2,8 +2,6 @@
>   
>   :Original: :ref:`Documentation/arch/arm64/amu.rst <amu_index>`
>   
> -Translator: Bailu Lin <bailu.lin@vivo.com>
> -
>   ==================================
>   AArch64 Linux 中扩展的活动监控单元
>   ==================================
> diff --git a/Documentation/translations/zh_CN/arch/arm64/elf_hwcaps.rst b/Documentation/translations/zh_CN/arch/arm64/elf_hwcaps.rst
> index f60ac1580d3e..357cf29817f8 100644
> --- a/Documentation/translations/zh_CN/arch/arm64/elf_hwcaps.rst
> +++ b/Documentation/translations/zh_CN/arch/arm64/elf_hwcaps.rst
> @@ -2,8 +2,6 @@
>   
>   :Original: :ref:`Documentation/arch/arm64/elf_hwcaps.rst <elf_hwcaps_index>`
>   
> -Translator: Bailu Lin <bailu.lin@vivo.com>
> -
>   ================
>   ARM64 ELF hwcaps
>   ================
> diff --git a/Documentation/translations/zh_CN/arch/arm64/hugetlbpage.rst b/Documentation/translations/zh_CN/arch/arm64/hugetlbpage.rst
> index 8079eadde29a..8e0199cd4e6b 100644
> --- a/Documentation/translations/zh_CN/arch/arm64/hugetlbpage.rst
> +++ b/Documentation/translations/zh_CN/arch/arm64/hugetlbpage.rst
> @@ -2,8 +2,6 @@
>   
>   :Original: :ref:`Documentation/arch/arm64/hugetlbpage.rst <hugetlbpage_index>`
>   
> -Translator: Bailu Lin <bailu.lin@vivo.com>
> -
>   =====================
>   ARM64中的 HugeTLBpage
>   =====================
> diff --git a/Documentation/translations/zh_CN/arch/arm64/index.rst b/Documentation/translations/zh_CN/arch/arm64/index.rst
> index e12b9f6e5d6c..46249a1d5c30 100644
> --- a/Documentation/translations/zh_CN/arch/arm64/index.rst
> +++ b/Documentation/translations/zh_CN/arch/arm64/index.rst
> @@ -1,10 +1,6 @@
>   .. include:: ../../disclaimer-zh_CN.rst
>   
>   :Original: :ref:`Documentation/arch/arm64/index.rst <arm64_index>`
> -:Translator: Bailu Lin <bailu.lin@vivo.com>
> -
> -.. _cn_arm64_index:
> -
>   
>   ==========
>   ARM64 架构
> diff --git a/Documentation/translations/zh_CN/arch/arm64/perf.rst b/Documentation/translations/zh_CN/arch/arm64/perf.rst
> index 6be72704e659..c467361e4279 100644
> --- a/Documentation/translations/zh_CN/arch/arm64/perf.rst
> +++ b/Documentation/translations/zh_CN/arch/arm64/perf.rst
> @@ -4,8 +4,6 @@
>   
>   :Original: :ref:`Documentation/arch/arm64/perf.rst <perf_index>`
>   
> -Translator: Bailu Lin <bailu.lin@vivo.com>
> -
>   =============
>   Perf 事件属性
>   =============
> diff --git a/Documentation/translations/zh_CN/arch/loongarch/booting.rst b/Documentation/translations/zh_CN/arch/loongarch/booting.rst
> index d2f55872904e..b69f746ef8af 100644
> --- a/Documentation/translations/zh_CN/arch/loongarch/booting.rst
> +++ b/Documentation/translations/zh_CN/arch/loongarch/booting.rst
> @@ -4,10 +4,6 @@
>   
>   :Original: Documentation/arch/loongarch/booting.rst
>   
> -:翻译:
> -
> - 司延腾 Yanteng Si <siyanteng@loongson.cn>
> -
>   ====================
>   启动 Linux/LoongArch
>   ====================
> diff --git a/Documentation/translations/zh_CN/arch/loongarch/features.rst b/Documentation/translations/zh_CN/arch/loongarch/features.rst
> index cec38dda8298..228de8ff4a3f 100644
> --- a/Documentation/translations/zh_CN/arch/loongarch/features.rst
> +++ b/Documentation/translations/zh_CN/arch/loongarch/features.rst
> @@ -3,6 +3,5 @@
>   .. include:: ../../disclaimer-zh_CN.rst
>   
>   :Original: Documentation/arch/loongarch/features.rst
> -:Translator: Huacai Chen <chenhuacai@loongson.cn>
>   
>   .. kernel-feat:: features loongarch
> diff --git a/Documentation/translations/zh_CN/arch/loongarch/index.rst b/Documentation/translations/zh_CN/arch/loongarch/index.rst
> index 4bd24f5ffed1..e47a079baaba 100644
> --- a/Documentation/translations/zh_CN/arch/loongarch/index.rst
> +++ b/Documentation/translations/zh_CN/arch/loongarch/index.rst
> @@ -3,7 +3,6 @@
>   .. include:: ../../disclaimer-zh_CN.rst
>   
>   :Original: Documentation/arch/loongarch/index.rst
> -:Translator: Huacai Chen <chenhuacai@loongson.cn>
>   
>   =================
>   LoongArch体系结构
> diff --git a/Documentation/translations/zh_CN/arch/loongarch/introduction.rst b/Documentation/translations/zh_CN/arch/loongarch/introduction.rst
> index bf463c5a4c51..3d73d7162d7f 100644
> --- a/Documentation/translations/zh_CN/arch/loongarch/introduction.rst
> +++ b/Documentation/translations/zh_CN/arch/loongarch/introduction.rst
> @@ -3,7 +3,6 @@
>   .. include:: ../../disclaimer-zh_CN.rst
>   
>   :Original: Documentation/arch/loongarch/introduction.rst
> -:Translator: Huacai Chen <chenhuacai@loongson.cn>
>   
>   =============
>   LoongArch介绍
> diff --git a/Documentation/translations/zh_CN/arch/loongarch/irq-chip-model.rst b/Documentation/translations/zh_CN/arch/loongarch/irq-chip-model.rst
> index 87b58aee92e1..f9616bfc040e 100644
> --- a/Documentation/translations/zh_CN/arch/loongarch/irq-chip-model.rst
> +++ b/Documentation/translations/zh_CN/arch/loongarch/irq-chip-model.rst
> @@ -3,7 +3,6 @@
>   .. include:: ../../disclaimer-zh_CN.rst
>   
>   :Original: Documentation/arch/loongarch/irq-chip-model.rst
> -:Translator: Huacai Chen <chenhuacai@loongson.cn>
>   
>   ==================================
>   LoongArch的IRQ芯片模型（层级关系）
> diff --git a/Documentation/translations/zh_CN/arch/mips/booting.rst b/Documentation/translations/zh_CN/arch/mips/booting.rst
> index 485b57e0ca0b..193883504663 100644
> --- a/Documentation/translations/zh_CN/arch/mips/booting.rst
> +++ b/Documentation/translations/zh_CN/arch/mips/booting.rst
> @@ -4,12 +4,6 @@
>   
>   :Original: Documentation/arch/mips/booting.rst
>   
> -:翻译:
> -
> - 司延腾 Yanteng Si <siyanteng@loongson.cn>
> -
> -.. _cn_booting:
> -
>   BMIPS设备树引导
>   ------------------------
>   
> diff --git a/Documentation/translations/zh_CN/arch/mips/features.rst b/Documentation/translations/zh_CN/arch/mips/features.rst
> index 0d6df97db069..b5b91e8d5563 100644
> --- a/Documentation/translations/zh_CN/arch/mips/features.rst
> +++ b/Documentation/translations/zh_CN/arch/mips/features.rst
> @@ -4,10 +4,4 @@
>   
>   :Original: Documentation/arch/mips/features.rst
>   
> -:翻译:
> -
> - 司延腾 Yanteng Si <siyanteng@loongson.cn>
> -
> -.. _cn_features:
> -
>   .. kernel-feat:: features mips
> diff --git a/Documentation/translations/zh_CN/arch/mips/index.rst b/Documentation/translations/zh_CN/arch/mips/index.rst
> index 2a34217119ea..3b287e3ab4d1 100644
> --- a/Documentation/translations/zh_CN/arch/mips/index.rst
> +++ b/Documentation/translations/zh_CN/arch/mips/index.rst
> @@ -4,10 +4,6 @@
>   
>   :Original: Documentation/arch/mips/index.rst
>   
> -:翻译:
> -
> - 司延腾 Yanteng Si <siyanteng@loongson.cn>
> -
>   ===========================
>   MIPS特性文档
>   ===========================
> diff --git a/Documentation/translations/zh_CN/arch/mips/ingenic-tcu.rst b/Documentation/translations/zh_CN/arch/mips/ingenic-tcu.rst
> index 3d599a36b571..eb35f4dbd806 100644
> --- a/Documentation/translations/zh_CN/arch/mips/ingenic-tcu.rst
> +++ b/Documentation/translations/zh_CN/arch/mips/ingenic-tcu.rst
> @@ -4,12 +4,6 @@
>   
>   :Original: Documentation/arch/mips/ingenic-tcu.rst
>   
> -:翻译:
> -
> - 司延腾 Yanteng Si <siyanteng@loongson.cn>
> -
> -.. _cn_ingenic-tcu:
> -
>   ===============================================
>   君正 JZ47xx SoC定时器/计数器硬件单元
>   ===============================================
> diff --git a/Documentation/translations/zh_CN/arch/openrisc/index.rst b/Documentation/translations/zh_CN/arch/openrisc/index.rst
> index da21f8ab894b..4cb6899c59a9 100644
> --- a/Documentation/translations/zh_CN/arch/openrisc/index.rst
> +++ b/Documentation/translations/zh_CN/arch/openrisc/index.rst
> @@ -4,12 +4,6 @@
>   
>   :Original: Documentation/arch/openrisc/index.rst
>   
> -:翻译:
> -
> - 司延腾 Yanteng Si <siyanteng@loongson.cn>
> -
> -.. _cn_openrisc_index:
> -
>   =================
>   OpenRISC 体系架构
>   =================
> diff --git a/Documentation/translations/zh_CN/arch/openrisc/openrisc_port.rst b/Documentation/translations/zh_CN/arch/openrisc/openrisc_port.rst
> index d728e4db0b85..34128968b236 100644
> --- a/Documentation/translations/zh_CN/arch/openrisc/openrisc_port.rst
> +++ b/Documentation/translations/zh_CN/arch/openrisc/openrisc_port.rst
> @@ -2,12 +2,6 @@
>   
>   :Original: Documentation/arch/openrisc/openrisc_port.rst
>   
> -:翻译:
> -
> - 司延腾 Yanteng Si <siyanteng@loongson.cn>
> -
> -.. _cn_openrisc_port:
> -
>   ==============
>   OpenRISC Linux
>   ==============
> diff --git a/Documentation/translations/zh_CN/arch/openrisc/todo.rst b/Documentation/translations/zh_CN/arch/openrisc/todo.rst
> index 1f6f95616633..61f2f2e559d3 100644
> --- a/Documentation/translations/zh_CN/arch/openrisc/todo.rst
> +++ b/Documentation/translations/zh_CN/arch/openrisc/todo.rst
> @@ -2,12 +2,6 @@
>   
>   :Original: Documentation/arch/openrisc/todo.rst
>   
> -:翻译:
> -
> - 司延腾 Yanteng Si <siyanteng@loongson.cn>
> -
> -.. _cn_openrisc_todo.rst:
> -
>   ========
>   待办事项
>   ========
> diff --git a/Documentation/translations/zh_CN/arch/parisc/debugging.rst b/Documentation/translations/zh_CN/arch/parisc/debugging.rst
> index c6b9de6d3175..f09f34a4c85b 100644
> --- a/Documentation/translations/zh_CN/arch/parisc/debugging.rst
> +++ b/Documentation/translations/zh_CN/arch/parisc/debugging.rst
> @@ -2,12 +2,6 @@
>   
>   :Original: Documentation/arch/parisc/debugging.rst
>   
> -:翻译:
> -
> - 司延腾 Yanteng Si <siyanteng@loongson.cn>
> -
> -.. _cn_parisc_debugging:
> -
>   =================
>   调试PA-RISC
>   =================
> diff --git a/Documentation/translations/zh_CN/arch/parisc/index.rst b/Documentation/translations/zh_CN/arch/parisc/index.rst
> index 9f69283bd1c9..7a66a5cbc066 100644
> --- a/Documentation/translations/zh_CN/arch/parisc/index.rst
> +++ b/Documentation/translations/zh_CN/arch/parisc/index.rst
> @@ -3,12 +3,6 @@
>   
>   :Original: Documentation/arch/parisc/index.rst
>   
> -:翻译:
> -
> - 司延腾 Yanteng Si <siyanteng@loongson.cn>
> -
> -.. _cn_parisc_index:
> -
>   ====================
>   PA-RISC体系架构
>   ====================
> diff --git a/Documentation/translations/zh_CN/arch/parisc/registers.rst b/Documentation/translations/zh_CN/arch/parisc/registers.rst
> index a55250afcc27..3a9a14d3280e 100644
> --- a/Documentation/translations/zh_CN/arch/parisc/registers.rst
> +++ b/Documentation/translations/zh_CN/arch/parisc/registers.rst
> @@ -2,12 +2,6 @@
>   
>   :Original: Documentation/arch/parisc/registers.rst
>   
> -:翻译:
> -
> - 司延腾 Yanteng Si <siyanteng@loongson.cn>
> -
> -.. _cn_parisc_registers:
> -
>   =========================
>   Linux/PA-RISC的寄存器用法
>   =========================
> diff --git a/Documentation/translations/zh_CN/arch/riscv/boot-image-header.rst b/Documentation/translations/zh_CN/arch/riscv/boot-image-header.rst
> index 779b5172fe24..c686523e3601 100644
> --- a/Documentation/translations/zh_CN/arch/riscv/boot-image-header.rst
> +++ b/Documentation/translations/zh_CN/arch/riscv/boot-image-header.rst
> @@ -2,12 +2,6 @@
>   
>   :Original: Documentation/arch/riscv/boot-image-header.rst
>   
> -:翻译:
> -
> - 司延腾 Yanteng Si <siyanteng@loongson.cn>
> -
> -.. _cn_boot-image-header.rst:
> -
>   ==========================
>   RISC-V Linux启动镜像文件头
>   ==========================
> diff --git a/Documentation/translations/zh_CN/arch/riscv/boot.rst b/Documentation/translations/zh_CN/arch/riscv/boot.rst
> index 0c2619095819..cac29336a720 100644
> --- a/Documentation/translations/zh_CN/arch/riscv/boot.rst
> +++ b/Documentation/translations/zh_CN/arch/riscv/boot.rst
> @@ -3,10 +3,6 @@
>   
>   :Original: Documentation/arch/riscv/boot.rst
>   
> -:翻译:
> -
> - 龙进 Jin Long <longjin@dragonos.org>
> -
>   ========================
>   RISC-V内核启动要求和限制
>   ========================
> diff --git a/Documentation/translations/zh_CN/arch/riscv/index.rst b/Documentation/translations/zh_CN/arch/riscv/index.rst
> index 96573459105e..064715544147 100644
> --- a/Documentation/translations/zh_CN/arch/riscv/index.rst
> +++ b/Documentation/translations/zh_CN/arch/riscv/index.rst
> @@ -4,12 +4,6 @@
>   
>   :Original: Documentation/arch/riscv/index.rst
>   
> -:翻译:
> -
> - 司延腾 Yanteng Si <siyanteng@loongson.cn>
> -
> -.. _cn_riscv_index:
> -
>   ===============
>   RISC-V 体系结构
>   ===============
> diff --git a/Documentation/translations/zh_CN/arch/riscv/patch-acceptance.rst b/Documentation/translations/zh_CN/arch/riscv/patch-acceptance.rst
> index c8eb230ca8ee..f5c06c7af68a 100644
> --- a/Documentation/translations/zh_CN/arch/riscv/patch-acceptance.rst
> +++ b/Documentation/translations/zh_CN/arch/riscv/patch-acceptance.rst
> @@ -4,12 +4,6 @@
>   
>   :Original: Documentation/arch/riscv/patch-acceptance.rst
>   
> -:翻译:
> -
> - 司延腾 Yanteng Si <siyanteng@loongson.cn>
> -
> -.. _cn_riscv_patch-acceptance:
> -
>   arch/riscv 开发者维护指南
>   =========================
>   
> diff --git a/Documentation/translations/zh_CN/arch/riscv/vm-layout.rst b/Documentation/translations/zh_CN/arch/riscv/vm-layout.rst
> index 4b9f4dcf6c19..f87b922220ab 100644
> --- a/Documentation/translations/zh_CN/arch/riscv/vm-layout.rst
> +++ b/Documentation/translations/zh_CN/arch/riscv/vm-layout.rst
> @@ -3,11 +3,6 @@
>   
>   :Original: Documentation/arch/riscv/vm-layout.rst
>   
> -:翻译:
> -
> - 司延腾 Yanteng Si <siyanteng@loongson.cn>
> -        Binbin Zhou <zhoubinbin@loongson.cn>
> -
>   ============================
>   RISC-V Linux上的虚拟内存布局
>   ============================
> diff --git a/Documentation/translations/zh_CN/block/blk-mq.rst b/Documentation/translations/zh_CN/block/blk-mq.rst
> index ccc08f76ff97..cd5c2980bc79 100644
> --- a/Documentation/translations/zh_CN/block/blk-mq.rst
> +++ b/Documentation/translations/zh_CN/block/blk-mq.rst
> @@ -3,14 +3,6 @@
>   
>   :Original: Documentation/block/blk-mq.rst
>   
> -:翻译:
> -
> - 柯子杰 kezijie <kezijie@leap-io-kernel.com>
> -
> -:校译:
> -
> -
> -
>   ================================================
>   多队列块设备 I/O 排队机制 (blk-mq)
>   ================================================
> @@ -127,4 +119,4 @@ I/O 请求完成了。
>   
>   include/linux/blk-mq.h
>   
> -block/blk-mq.c
> \ No newline at end of file
> +block/blk-mq.c
> diff --git a/Documentation/translations/zh_CN/block/data-integrity.rst b/Documentation/translations/zh_CN/block/data-integrity.rst
> index b31aa9ef8954..77b98d59cc91 100644
> --- a/Documentation/translations/zh_CN/block/data-integrity.rst
> +++ b/Documentation/translations/zh_CN/block/data-integrity.rst
> @@ -3,12 +3,6 @@
>   
>   :Original: Documentation/block/data-integrity.rst
>   
> -:翻译:
> -
> - 柯子杰 kezijie <kezijie@leap-io-kernel.com>
> -
> -:校译:
> -
>   ==========
>   数据完整性
>   ==========
> @@ -189,4 +183,4 @@ RAID0 和 RAID1 已受支持。而RAID4/5/6因涉及应用标签仍需额外的
>   
>   ----------------------------------------------------------------------
>   
> -2007-12-24 Martin K. Petersen <martin.petersen@oracle.com>
> \ No newline at end of file
> +2007-12-24 Martin K. Petersen <martin.petersen@oracle.com>
> diff --git a/Documentation/translations/zh_CN/block/index.rst b/Documentation/translations/zh_CN/block/index.rst
> index f2ae5096ed68..ae1c2faf6ebf 100644
> --- a/Documentation/translations/zh_CN/block/index.rst
> +++ b/Documentation/translations/zh_CN/block/index.rst
> @@ -3,12 +3,6 @@
>   
>   :Original: Documentation/block/index.rst
>   
> -:翻译:
> -
> - 柯子杰 ke zijie <kezijie@leap-io-kernel.com>
> -
> -:校译:
> -
>   =====
>   Block
>   =====
> diff --git a/Documentation/translations/zh_CN/core-api/assoc_array.rst b/Documentation/translations/zh_CN/core-api/assoc_array.rst
> index 3649bf0d1488..92079978f876 100644
> --- a/Documentation/translations/zh_CN/core-api/assoc_array.rst
> +++ b/Documentation/translations/zh_CN/core-api/assoc_array.rst
> @@ -2,16 +2,6 @@
>   
>   :Original: Documentation/core-api/assoc_array.rst
>   
> -:翻译:
> -
> - 司延腾 Yanteng Si <siyanteng@loongson.cn>
> -
> -:校译:
> -
> -
> -
> -.. _cn_core-api_assoc_array:
> -
>   ==================
>   通用关联数组的实现
>   ==================
> diff --git a/Documentation/translations/zh_CN/core-api/boot-time-mm.rst b/Documentation/translations/zh_CN/core-api/boot-time-mm.rst
> index 9e81dbec71f8..a2510fb47df4 100644
> --- a/Documentation/translations/zh_CN/core-api/boot-time-mm.rst
> +++ b/Documentation/translations/zh_CN/core-api/boot-time-mm.rst
> @@ -2,16 +2,6 @@
>   
>   :Original: Documentation/core-api/boot-time-mm.rst
>   
> -:翻译:
> -
> - 司延腾 Yanteng Si <siyanteng@loongson.cn>
> -
> -:校译:
> -
> - 时奎亮 <alexs@kernel.org>
> -
> -.. _cn_core-api_boot-time-mm:
> -
>   ================
>   启动时的内存管理
>   ================
> diff --git a/Documentation/translations/zh_CN/core-api/cachetlb.rst b/Documentation/translations/zh_CN/core-api/cachetlb.rst
> index 64295c61d1c1..1d1b74ef1f27 100644
> --- a/Documentation/translations/zh_CN/core-api/cachetlb.rst
> +++ b/Documentation/translations/zh_CN/core-api/cachetlb.rst
> @@ -2,17 +2,6 @@
>   
>   :Original: Documentation/core-api/cachetlb.rst
>   
> -:翻译:
> -
> - 司延腾 Yanteng Si <siyanteng@loongson.cn>
> - 周彬彬 Binbin Zhou <zhoubinbin@loongson.cn>
> -
> -:校译:
> -
> - 吴想成 Wu XiangCheng <bobwxc@email.cn>
> -
> -.. _cn_core-api_cachetlb:
> -
>   ======================
>   Linux下的缓存和TLB刷新
>   ======================
> diff --git a/Documentation/translations/zh_CN/core-api/circular-buffers.rst b/Documentation/translations/zh_CN/core-api/circular-buffers.rst
> index 694ad8e61070..18a6e1c53011 100644
> --- a/Documentation/translations/zh_CN/core-api/circular-buffers.rst
> +++ b/Documentation/translations/zh_CN/core-api/circular-buffers.rst
> @@ -4,16 +4,6 @@
>   
>   :Original: Documentation/core-api/circular-buffers.rst
>   
> -:翻译:
> -
> - 周彬彬 Binbin Zhou <zhoubinbin@loongson.cn>
> -
> -:校译:
> -
> - 司延腾 Yanteng Si <siyanteng@loongson.cn>
> - 吴想成 Wu Xiangcheng <bobwxc@email.cn>
> - 时奎亮 Alex Shi <alexs@kernel.org>
> -
>   ==========
>   环形缓冲区
>   ==========
> diff --git a/Documentation/translations/zh_CN/core-api/cpu_hotplug.rst b/Documentation/translations/zh_CN/core-api/cpu_hotplug.rst
> index 3447fbf0e695..7628aa1fdce9 100644
> --- a/Documentation/translations/zh_CN/core-api/cpu_hotplug.rst
> +++ b/Documentation/translations/zh_CN/core-api/cpu_hotplug.rst
> @@ -1,16 +1,6 @@
>   .. include:: ../disclaimer-zh_CN.rst
>   
>   :Original: Documentation/core-api/cpu_hotplug.rst
> -:翻译:
> -
> - 司延腾 Yanteng Si <siyanteng@loongson.cn>
> - 周彬彬 Binbin Zhou <zhoubinbin@loongson.cn>
> -
> -:校译:
> -
> - 吴想成 Wu XiangCheng <bobwxc@email.cn>
> -
> -.. _cn_core_api_cpu_hotplug:
>   
>   =================
>   内核中的CPU热拔插
> diff --git a/Documentation/translations/zh_CN/core-api/errseq.rst b/Documentation/translations/zh_CN/core-api/errseq.rst
> index 815fb303ea2f..d2a592a05532 100644
> --- a/Documentation/translations/zh_CN/core-api/errseq.rst
> +++ b/Documentation/translations/zh_CN/core-api/errseq.rst
> @@ -4,14 +4,6 @@
>   
>   :Original: Documentation/core-api/errseq.rst
>   
> -:翻译:
> -
> - 周彬彬 Binbin Zhou <zhoubinbin@loongson.cn>
> -
> -:校译:
> -
> - 吴想成 Wu Xiangcheng <bobwxc@email.cn>
> -
>   ================
>   errseq_t数据类型
>   ================
> diff --git a/Documentation/translations/zh_CN/core-api/genalloc.rst b/Documentation/translations/zh_CN/core-api/genalloc.rst
> index 3c78452aaa7c..28e6deff3331 100644
> --- a/Documentation/translations/zh_CN/core-api/genalloc.rst
> +++ b/Documentation/translations/zh_CN/core-api/genalloc.rst
> @@ -2,16 +2,6 @@
>   
>   :Original: Documentation/core-api/genalloc.rst
>   
> -:翻译:
> -
> - 司延腾 Yanteng Si <siyanteng@loongson.cn>
> -
> -:校译:
> -
> - 时奎亮 <alexs@kernel.org>
> -
> -.. _cn_core-api_genalloc:
> -
>   genalloc/genpool子系统
>   ======================
>   
> diff --git a/Documentation/translations/zh_CN/core-api/generic-radix-tree.rst b/Documentation/translations/zh_CN/core-api/generic-radix-tree.rst
> index eacd1d2ebddc..0b70836a62ae 100644
> --- a/Documentation/translations/zh_CN/core-api/generic-radix-tree.rst
> +++ b/Documentation/translations/zh_CN/core-api/generic-radix-tree.rst
> @@ -4,10 +4,6 @@
>   
>   :Original: Documentation/core-api/generic-radix-tree.rst
>   
> -:翻译:
> -
> - 周彬彬 Binbin Zhou <zhoubinbin@loongson.cn>
> -
>   ===================
>   通用基数树/稀疏数组
>   ===================
> diff --git a/Documentation/translations/zh_CN/core-api/genericirq.rst b/Documentation/translations/zh_CN/core-api/genericirq.rst
> index d2c1bd94bb97..bb86213a44fe 100644
> --- a/Documentation/translations/zh_CN/core-api/genericirq.rst
> +++ b/Documentation/translations/zh_CN/core-api/genericirq.rst
> @@ -2,18 +2,8 @@
>   
>   :Original: Documentation/core-api/genericirq.rst
>   
> -:翻译:
> -
> - 司延腾 Yanteng Si <siyanteng@loongson.cn>
> -
> -:校译:
> -
> - 吴想成 Wu XiangCheng <bobwxc@email.cn>
> -
>   .. include:: <isonum.txt>
>   
> -.. _cn_core-api_genericirq:
> -
>   ================
>   Linux通用IRQ处理
>   ================
> diff --git a/Documentation/translations/zh_CN/core-api/gfp_mask-from-fs-io.rst b/Documentation/translations/zh_CN/core-api/gfp_mask-from-fs-io.rst
> index 75d2997e9bc3..9253ce322e3c 100644
> --- a/Documentation/translations/zh_CN/core-api/gfp_mask-from-fs-io.rst
> +++ b/Documentation/translations/zh_CN/core-api/gfp_mask-from-fs-io.rst
> @@ -2,16 +2,6 @@
>   
>   :Original: Documentation/core-api/gfp_mask-from-fs-io.rst
>   
> -:翻译:
> -
> - 司延腾 Yanteng Si <siyanteng@loongson.cn>
> -
> -:校译:
> -
> - 时奎亮 <alexs@kernel.org>
> -
> -.. _cn_core-api_gfp_mask-from-fs-io:
> -
>   ============================
>   从FS/IO上下文中使用的GFP掩码
>   ============================
> diff --git a/Documentation/translations/zh_CN/core-api/idr.rst b/Documentation/translations/zh_CN/core-api/idr.rst
> index 97a16e76b81b..c35ab4ecf5bd 100644
> --- a/Documentation/translations/zh_CN/core-api/idr.rst
> +++ b/Documentation/translations/zh_CN/core-api/idr.rst
> @@ -4,16 +4,6 @@
>   
>   :Original: Documentation/core-api/idr.rst
>   
> -:翻译:
> -
> - 周彬彬 Binbin Zhou <zhoubinbin@loongson.cn>
> -
> -:校译:
> -
> - 司延腾 Yanteng Si <siyanteng@loongson.cn>
> - 吴想成 Wu Xiangcheng <bobwxc@email.cn>
> - 时奎亮 Alex Shi <alexs@kernel.org>
> -
>   ======
>   ID分配
>   ======
> diff --git a/Documentation/translations/zh_CN/core-api/index.rst b/Documentation/translations/zh_CN/core-api/index.rst
> index 453a02cd1f44..746e1a7dbd2c 100644
> --- a/Documentation/translations/zh_CN/core-api/index.rst
> +++ b/Documentation/translations/zh_CN/core-api/index.rst
> @@ -2,12 +2,6 @@
>   
>   :Original: Documentation/core-api/index.rst
>   
> -:翻译:
> -
> - 司延腾 Yanteng Si <siyanteng@loongson.cn>
> -
> -.. _cn_core-api_index.rst:
> -
>   ===========
>   核心API文档
>   ===========
> diff --git a/Documentation/translations/zh_CN/core-api/irq/concepts.rst b/Documentation/translations/zh_CN/core-api/irq/concepts.rst
> index 9957f0453353..3fd1691ae8cd 100644
> --- a/Documentation/translations/zh_CN/core-api/irq/concepts.rst
> +++ b/Documentation/translations/zh_CN/core-api/irq/concepts.rst
> @@ -2,12 +2,6 @@
>   
>   :Original: Documentation/core-api/irq/concepts.rst
>   
> -:翻译:
> -
> - 司延腾 Yanteng Si <siyanteng@loongson.cn>
> -
> -.. _cn_concepts.rst:
> -
>   ===========
>   什么是IRQ？
>   ===========
> diff --git a/Documentation/translations/zh_CN/core-api/irq/index.rst b/Documentation/translations/zh_CN/core-api/irq/index.rst
> index ba6acc4b48e5..1914ae1109f3 100644
> --- a/Documentation/translations/zh_CN/core-api/irq/index.rst
> +++ b/Documentation/translations/zh_CN/core-api/irq/index.rst
> @@ -2,13 +2,6 @@
>   
>   :Original: Documentation/core-api/irq/index.rst
>   
> -:翻译:
> -
> - 司延腾 Yanteng Si <siyanteng@loongson.cn>
> -
> -.. _cn_irq_index.rst:
> -
> -
>   ====
>   IRQs
>   ====
> diff --git a/Documentation/translations/zh_CN/core-api/irq/irq-affinity.rst b/Documentation/translations/zh_CN/core-api/irq/irq-affinity.rst
> index 36b085226d0b..fd22f83e75f6 100644
> --- a/Documentation/translations/zh_CN/core-api/irq/irq-affinity.rst
> +++ b/Documentation/translations/zh_CN/core-api/irq/irq-affinity.rst
> @@ -2,12 +2,6 @@
>   
>   :Original: Documentation/core-api/irq/irq-affinity.rst
>   
> -:翻译:
> -
> - 司延腾 Yanteng Si <siyanteng@loongson.cn>
> -
> -.. _cn_irq-affinity.rst:
> -
>   ==============
>   SMP IRQ 亲和性
>   ==============
> diff --git a/Documentation/translations/zh_CN/core-api/irq/irq-domain.rst b/Documentation/translations/zh_CN/core-api/irq/irq-domain.rst
> index aaefeda0e164..072ebf2e4921 100644
> --- a/Documentation/translations/zh_CN/core-api/irq/irq-domain.rst
> +++ b/Documentation/translations/zh_CN/core-api/irq/irq-domain.rst
> @@ -2,13 +2,6 @@
>   
>   :Original: Documentation/core-api/irq/irq-domain.rst
>   
> -:翻译:
> -
> - 司延腾 Yanteng Si <siyanteng@loongson.cn>
> - 周彬彬 Binbin Zhou <zhoubinbin@loongson.cn>
> -
> -.. _cn_irq-domain.rst:
> -
>   =======================
>   irq_domain 中断号映射库
>   =======================
> diff --git a/Documentation/translations/zh_CN/core-api/irq/irqflags-tracing.rst b/Documentation/translations/zh_CN/core-api/irq/irqflags-tracing.rst
> index 9af50b4b8c2d..bebfaa297e96 100644
> --- a/Documentation/translations/zh_CN/core-api/irq/irqflags-tracing.rst
> +++ b/Documentation/translations/zh_CN/core-api/irq/irqflags-tracing.rst
> @@ -2,12 +2,6 @@
>   
>   :Original: Documentation/core-api/irq/irqflags-tracing.rst
>   
> -:翻译:
> -
> - 司延腾 Yanteng Si <siyanteng@loongson.cn>
> -
> -.. _cn_irqflags-tracing.rst:
> -
>   =================
>   IRQ-flags状态追踪
>   =================
> diff --git a/Documentation/translations/zh_CN/core-api/kernel-api.rst b/Documentation/translations/zh_CN/core-api/kernel-api.rst
> index a1ea7081077c..60f126b72cc2 100644
> --- a/Documentation/translations/zh_CN/core-api/kernel-api.rst
> +++ b/Documentation/translations/zh_CN/core-api/kernel-api.rst
> @@ -2,13 +2,6 @@
>   
>   :Original: Documentation/core-api/kernel-api.rst
>   
> -:翻译:
> -
> - 司延腾 Yanteng Si <siyanteng@loongson.cn>
> - 周彬彬 Binbin Zhou <zhoubinbin@loongson.cn>
> -
> -.. _cn_kernel-api.rst:
> -
>   ============
>   Linux内核API
>   ============
> diff --git a/Documentation/translations/zh_CN/core-api/kobject.rst b/Documentation/translations/zh_CN/core-api/kobject.rst
> index 0747b472fdea..7b9b4cb029e8 100644
> --- a/Documentation/translations/zh_CN/core-api/kobject.rst
> +++ b/Documentation/translations/zh_CN/core-api/kobject.rst
> @@ -2,12 +2,6 @@
>   
>   :Original: Documentation/core-api/kobject.rst
>   
> -:翻译:
> -
> - 司延腾 Yanteng Si <siyanteng@loongson.cn>
> -
> -.. _cn_core_api_kobject.rst:
> -
>   =======================================================
>   关于kobjects、ksets和ktypes的一切你没想过需要了解的东西
>   =======================================================
> diff --git a/Documentation/translations/zh_CN/core-api/kref.rst b/Documentation/translations/zh_CN/core-api/kref.rst
> index 8a0c030ec1d3..1ca2562a13de 100644
> --- a/Documentation/translations/zh_CN/core-api/kref.rst
> +++ b/Documentation/translations/zh_CN/core-api/kref.rst
> @@ -2,16 +2,6 @@
>   
>   :Original: Documentation/core-api/kref.rst
>   
> -翻译:
> -
> -司延腾 Yanteng Si <siyanteng@loongson.cn>
> -
> -校译：
> -
> - <此处请校译员签名（自愿），我将在下一个版本添加>
> -
> -.. _cn_core_api_kref.rst:
> -
>   =================================
>   为内核对象添加引用计数器（krefs）
>   =================================
> diff --git a/Documentation/translations/zh_CN/core-api/local_ops.rst b/Documentation/translations/zh_CN/core-api/local_ops.rst
> index eb5423f60f17..2d7ad5416642 100644
> --- a/Documentation/translations/zh_CN/core-api/local_ops.rst
> +++ b/Documentation/translations/zh_CN/core-api/local_ops.rst
> @@ -2,12 +2,6 @@
>   
>   :Original: Documentation/core-api/local_ops.rst
>   
> -:翻译:
> -
> - 司延腾 Yanteng Si <siyanteng@loongson.cn>
> -
> -.. _cn_local_ops:
> -
>   ========================
>   本地原子操作的语义和行为
>   ========================
> diff --git a/Documentation/translations/zh_CN/core-api/memory-allocation.rst b/Documentation/translations/zh_CN/core-api/memory-allocation.rst
> index e17b87dfd1c8..a4ab13688840 100644
> --- a/Documentation/translations/zh_CN/core-api/memory-allocation.rst
> +++ b/Documentation/translations/zh_CN/core-api/memory-allocation.rst
> @@ -2,16 +2,6 @@
>   
>   :Original: Documentation/core-api/memory-allocation.rst
>   
> -:翻译:
> -
> - 司延腾 Yanteng Si <siyanteng@loongson.cn>
> -
> -:校译:
> -
> - 时奎亮 <alexs@kernel.org>
> -
> -.. _cn_core-api_memory-allocation:
> -
>   ============
>   内存分配指南
>   ============
> diff --git a/Documentation/translations/zh_CN/core-api/memory-hotplug.rst b/Documentation/translations/zh_CN/core-api/memory-hotplug.rst
> index c2a4122ae221..c75c322be57a 100644
> --- a/Documentation/translations/zh_CN/core-api/memory-hotplug.rst
> +++ b/Documentation/translations/zh_CN/core-api/memory-hotplug.rst
> @@ -2,16 +2,6 @@
>   
>   :Original: Documentation/core-api/memory-hotplug.rst
>   
> -:翻译:
> -
> - 司延腾 Yanteng Si <siyanteng@loongson.cn>
> -
> -:校译:
> -
> - 吴想成 Wu XiangCheng <bobwxc@email.cn>
> -
> -.. _cn_core-api_memory-hotplug:
> -
>   ==========
>   内存热插拔
>   ==========
> diff --git a/Documentation/translations/zh_CN/core-api/mm-api.rst b/Documentation/translations/zh_CN/core-api/mm-api.rst
> index 113359bdb7be..4c5814290aa8 100644
> --- a/Documentation/translations/zh_CN/core-api/mm-api.rst
> +++ b/Documentation/translations/zh_CN/core-api/mm-api.rst
> @@ -2,17 +2,6 @@
>   
>   :Original: Documentation/core-api/mm-api.rst
>   
> -:翻译:
> -
> - 司延腾 Yanteng Si <siyanteng@loongson.cn>
> - 周彬彬 Binbin Zhou <zhoubinbin@loongson.cn>
> -
> -:校译:
> -
> - 时奎亮<alexs@kernel.org>
> -
> -.. _cn_core-api_mm-api:
> -
>   ============
>   内存管理APIs
>   ============
> diff --git a/Documentation/translations/zh_CN/core-api/packing.rst b/Documentation/translations/zh_CN/core-api/packing.rst
> index c0aab3a349d0..1c40eead04ab 100644
> --- a/Documentation/translations/zh_CN/core-api/packing.rst
> +++ b/Documentation/translations/zh_CN/core-api/packing.rst
> @@ -4,16 +4,6 @@
>   
>   :Original: Documentation/core-api/packing.rst
>   
> -:翻译:
> -
> - 周彬彬 Binbin Zhou <zhoubinbin@loongson.cn>
> -
> -:校译:
> -
> - 司延腾 Yanteng Si <siyanteng@loongson.cn>
> - 吴想成 Wu Xiangcheng <bobwxc@email.cn>
> - 时奎亮 Alex Shi <alexs@kernel.org>
> -
>   ========================
>   通用的位域打包和解包函数
>   ========================
> diff --git a/Documentation/translations/zh_CN/core-api/padata.rst b/Documentation/translations/zh_CN/core-api/padata.rst
> index 781d30675afd..cae31f011229 100644
> --- a/Documentation/translations/zh_CN/core-api/padata.rst
> +++ b/Documentation/translations/zh_CN/core-api/padata.rst
> @@ -4,12 +4,6 @@
>   
>   :Original: Documentation/core-api/padata.rst
>   
> -:翻译:
> -
> - 司延腾 Yanteng Si <siyanteng@loongson.cn>
> -
> -.. _cn_core_api_padata.rst:
> -
>   ==================
>   padata并行执行机制
>   ==================
> diff --git a/Documentation/translations/zh_CN/core-api/printk-basics.rst b/Documentation/translations/zh_CN/core-api/printk-basics.rst
> index cafa01bccff2..ccb47977ba85 100644
> --- a/Documentation/translations/zh_CN/core-api/printk-basics.rst
> +++ b/Documentation/translations/zh_CN/core-api/printk-basics.rst
> @@ -3,13 +3,6 @@
>   
>   :Original: Documentation/core-api/printk-basics.rst
>   
> -:翻译:
> -
> - 司延腾 Yanteng Si <siyanteng@loongson.cn>
> - 周彬彬 Binbin Zhou <zhoubinbin@loongson.cn>
> -
> -.. _cn_printk-basics.rst:
> -
>   ==================
>   使用printk记录消息
>   ==================
> diff --git a/Documentation/translations/zh_CN/core-api/printk-formats.rst b/Documentation/translations/zh_CN/core-api/printk-formats.rst
> index 96a917ecc93f..f749834a586c 100644
> --- a/Documentation/translations/zh_CN/core-api/printk-formats.rst
> +++ b/Documentation/translations/zh_CN/core-api/printk-formats.rst
> @@ -2,13 +2,6 @@
>   
>   :Original: Documentation/core-api/printk-formats.rst
>   
> -:翻译:
> -
> - 司延腾 Yanteng Si <siyanteng@loongson.cn>
> - 周彬彬 Binbin Zhou <zhoubinbin@loongson.cn>
> -
> -.. _cn_printk-formats.rst:
> -
>   ==============================
>   如何获得正确的printk格式占位符
>   ==============================
> diff --git a/Documentation/translations/zh_CN/core-api/protection-keys.rst b/Documentation/translations/zh_CN/core-api/protection-keys.rst
> index d07830050153..97e110ac39d4 100644
> --- a/Documentation/translations/zh_CN/core-api/protection-keys.rst
> +++ b/Documentation/translations/zh_CN/core-api/protection-keys.rst
> @@ -3,16 +3,6 @@
>   
>   :Original: Documentation/core-api/protection-keys.rst
>   
> -:翻译:
> -
> - 司延腾 Yanteng Si <siyanteng@loongson.cn>
> -
> -:校译:
> -
> - 吴想成 Wu XiangCheng <bobwxc@email.cn>
> -
> -.. _cn_core-api_protection-keys:
> -
>   ============
>   内存保护密钥
>   ============
> diff --git a/Documentation/translations/zh_CN/core-api/rbtree.rst b/Documentation/translations/zh_CN/core-api/rbtree.rst
> index a3e1555cb974..1d1ff2e96910 100644
> --- a/Documentation/translations/zh_CN/core-api/rbtree.rst
> +++ b/Documentation/translations/zh_CN/core-api/rbtree.rst
> @@ -3,10 +3,6 @@
>   
>   :Original: Documentation/core-api/rbtree.rst
>   
> -:翻译:
> -
> -  唐艺舟 Tang Yizhou <tangyeechou@gmail.com>
> -
>   =========================
>   Linux中的红黑树（rbtree）
>   =========================
> diff --git a/Documentation/translations/zh_CN/core-api/refcount-vs-atomic.rst b/Documentation/translations/zh_CN/core-api/refcount-vs-atomic.rst
> index e2467fd26fc0..b77374fc746c 100644
> --- a/Documentation/translations/zh_CN/core-api/refcount-vs-atomic.rst
> +++ b/Documentation/translations/zh_CN/core-api/refcount-vs-atomic.rst
> @@ -2,12 +2,6 @@
>   
>   :Original: Documentation/core-api/refcount-vs-atomic.rst
>   
> -:翻译:
> -
> - 司延腾 Yanteng Si <siyanteng@loongson.cn>
> -
> -.. _cn_refcount-vs-atomic:
> -
>   =======================================
>   与atomic_t相比，refcount_t的API是这样的
>   =======================================
> diff --git a/Documentation/translations/zh_CN/core-api/symbol-namespaces.rst b/Documentation/translations/zh_CN/core-api/symbol-namespaces.rst
> index d9477ccea98f..443fd89f57ac 100644
> --- a/Documentation/translations/zh_CN/core-api/symbol-namespaces.rst
> +++ b/Documentation/translations/zh_CN/core-api/symbol-namespaces.rst
> @@ -2,12 +2,6 @@
>   
>   :Original: Documentation/core-api/symbol-namespaces.rst
>   
> -:翻译:
> -
> - 司延腾 Yanteng Si <siyanteng@loongson.cn>
> -
> -.. _cn_symbol-namespaces.rst:
> -
>   =================================
>   符号命名空间（Symbol Namespaces）
>   =================================
> diff --git a/Documentation/translations/zh_CN/core-api/this_cpu_ops.rst b/Documentation/translations/zh_CN/core-api/this_cpu_ops.rst
> index bea5ee8eb8a0..60aaa8c792ab 100644
> --- a/Documentation/translations/zh_CN/core-api/this_cpu_ops.rst
> +++ b/Documentation/translations/zh_CN/core-api/this_cpu_ops.rst
> @@ -4,14 +4,6 @@
>   
>   :Original: Documentation/core-api/this_cpu_ops.rst
>   
> -:翻译:
> -
> - 周彬彬 Binbin Zhou <zhoubinbin@loongson.cn>
> -
> -:校译:
> -
> - 吴想成 Wu Xiangcheng <bobwxc@email.cn>
> -
>   ============
>   this_cpu操作
>   ============
> diff --git a/Documentation/translations/zh_CN/core-api/unaligned-memory-access.rst b/Documentation/translations/zh_CN/core-api/unaligned-memory-access.rst
> index fbe0989a8ce5..676e2ddace55 100644
> --- a/Documentation/translations/zh_CN/core-api/unaligned-memory-access.rst
> +++ b/Documentation/translations/zh_CN/core-api/unaligned-memory-access.rst
> @@ -2,16 +2,6 @@
>   
>   :Original: Documentation/core-api/unaligned-memory-access.rst
>   
> -:翻译:
> -
> - 司延腾 Yanteng Si <siyanteng@loongson.cn>
> -
> -:校译:
> -
> - 时奎亮 <alexs@kernel.org>
> -
> -.. _cn_core-api_unaligned-memory-access:
> -
>   ==============
>   非对齐内存访问
>   ==============
> diff --git a/Documentation/translations/zh_CN/core-api/watch_queue.rst b/Documentation/translations/zh_CN/core-api/watch_queue.rst
> index 23b17ae2e4e2..8cabe23e61e2 100644
> --- a/Documentation/translations/zh_CN/core-api/watch_queue.rst
> +++ b/Documentation/translations/zh_CN/core-api/watch_queue.rst
> @@ -4,16 +4,6 @@
>   
>   :Original: Documentation/core-api/watch_queue.rst
>   
> -:翻译:
> -
> -周彬彬 Binbin Zhou <zhoubinbin@loongson.cn>
> -
> -:校译:
> -
> -司延腾 Yanteng Si <siyanteng@loongson.cn>
> -吴想成 Wu Xiangcheng <bobwxc@email.cn>
> -
> -
>   ============
>   通用通知机制
>   ============
> diff --git a/Documentation/translations/zh_CN/core-api/workqueue.rst b/Documentation/translations/zh_CN/core-api/workqueue.rst
> index fe0ff5a127f3..251ec0594921 100644
> --- a/Documentation/translations/zh_CN/core-api/workqueue.rst
> +++ b/Documentation/translations/zh_CN/core-api/workqueue.rst
> @@ -3,14 +3,6 @@
>   
>   :Original: Documentation/core-api/workqueue.rst
>   
> -:翻译:
> -
> - 司延腾 Yanteng Si <siyanteng@loongson.cn>
> - 周彬彬 Binbin Zhou <zhoubinbin@loongson.cn>
> - 陈兴友 Xingyou Chen <rockrush@rockwork.org>
> -
> -.. _cn_workqueue.rst:
> -
>   ========
>   工作队列
>   ========
> diff --git a/Documentation/translations/zh_CN/core-api/xarray.rst b/Documentation/translations/zh_CN/core-api/xarray.rst
> index fb19324966ce..b47be4a26060 100644
> --- a/Documentation/translations/zh_CN/core-api/xarray.rst
> +++ b/Documentation/translations/zh_CN/core-api/xarray.rst
> @@ -3,17 +3,6 @@
>   
>   :Original: Documentation/core-api/xarray.rst
>   
> -:翻译:
> -
> - 司延腾 Yanteng Si <siyanteng@loongson.cn>
> - 周彬彬 Binbin Zhou <zhoubinbin@loongson.cn>
> -
> -:校译:
> -
> -
> -
> -.. _cn_core-api_xarray:
> -
>   ======
>   XArray
>   ======
> diff --git a/Documentation/translations/zh_CN/cpu-freq/core.rst b/Documentation/translations/zh_CN/cpu-freq/core.rst
> index b3c095306ffe..977dc4a821fc 100644
> --- a/Documentation/translations/zh_CN/cpu-freq/core.rst
> +++ b/Documentation/translations/zh_CN/cpu-freq/core.rst
> @@ -3,14 +3,6 @@
>   
>   :Original: Documentation/cpu-freq/core.rst
>   
> -:翻译:
> -
> - 司延腾 Yanteng Si <siyanteng@loongson.cn>
> -
> -:校译:
> -
> - 唐艺舟 Tang Yizhou <tangyeechou@gmail.com>
> -
>   ====================================
>   CPUFreq核心和CPUFreq通知器的通用说明
>   ====================================
> diff --git a/Documentation/translations/zh_CN/cpu-freq/cpu-drivers.rst b/Documentation/translations/zh_CN/cpu-freq/cpu-drivers.rst
> index 2d5e84d8e58d..e6c84f4e1863 100644
> --- a/Documentation/translations/zh_CN/cpu-freq/cpu-drivers.rst
> +++ b/Documentation/translations/zh_CN/cpu-freq/cpu-drivers.rst
> @@ -4,14 +4,6 @@
>   
>   :Original: Documentation/cpu-freq/cpu-drivers.rst
>   
> -:翻译:
> -
> - 司延腾 Yanteng Si <siyanteng@loongson.cn>
> -
> -:校译:
> -
> - 唐艺舟 Tang Yizhou <tangyeechou@gmail.com>
> -
>   =======================================
>   如何实现一个新的CPUFreq处理器驱动程序？
>   =======================================
> diff --git a/Documentation/translations/zh_CN/cpu-freq/cpufreq-stats.rst b/Documentation/translations/zh_CN/cpu-freq/cpufreq-stats.rst
> index e8fdba923cd5..6d07aa6844dc 100644
> --- a/Documentation/translations/zh_CN/cpu-freq/cpufreq-stats.rst
> +++ b/Documentation/translations/zh_CN/cpu-freq/cpufreq-stats.rst
> @@ -4,14 +4,6 @@
>   
>   :Original: Documentation/cpu-freq/cpufreq-stats.rst
>   
> -:翻译:
> -
> - 司延腾 Yanteng Si <siyanteng@loongson.cn>
> -
> -:校译:
> -
> - 唐艺舟 Tang Yizhou <tangyeechou@gmail.com>
> -
>   ==========================================
>   sysfs CPUFreq Stats的一般说明
>   ==========================================
> diff --git a/Documentation/translations/zh_CN/cpu-freq/index.rst b/Documentation/translations/zh_CN/cpu-freq/index.rst
> index c6e50963cd33..f1a9075f27bc 100644
> --- a/Documentation/translations/zh_CN/cpu-freq/index.rst
> +++ b/Documentation/translations/zh_CN/cpu-freq/index.rst
> @@ -4,12 +4,6 @@
>   
>   :Original: Documentation/cpu-freq/index.rst
>   
> -:翻译:
> -
> - 司延腾 Yanteng Si <siyanteng@loongson.cn>
> -
> -.. _cn_index.rst:
> -
>   =======================================================
>   Linux CPUFreq - Linux(TM)内核中的CPU频率和电压升降代码
>   =======================================================
> diff --git a/Documentation/translations/zh_CN/dev-tools/gcov.rst b/Documentation/translations/zh_CN/dev-tools/gcov.rst
> index ea8f94852f41..d7fd247da8dc 100644
> --- a/Documentation/translations/zh_CN/dev-tools/gcov.rst
> +++ b/Documentation/translations/zh_CN/dev-tools/gcov.rst
> @@ -1,7 +1,6 @@
>   .. include:: ../disclaimer-zh_CN.rst
>   
>   :Original: Documentation/dev-tools/gcov.rst
> -:Translator: 赵军奎 Bernard Zhao <bernard@vivo.com>
>   
>   在Linux内核里使用gcov做代码覆盖率检查
>   =====================================
> diff --git a/Documentation/translations/zh_CN/dev-tools/gdb-kernel-debugging.rst b/Documentation/translations/zh_CN/dev-tools/gdb-kernel-debugging.rst
> index 0b382a32b3fe..15d3974efb1a 100644
> --- a/Documentation/translations/zh_CN/dev-tools/gdb-kernel-debugging.rst
> +++ b/Documentation/translations/zh_CN/dev-tools/gdb-kernel-debugging.rst
> @@ -3,7 +3,6 @@
>   .. include:: ../disclaimer-zh_CN.rst
>   
>   :Original: Documentation/process/debugging/gdb-kernel-debugging.rst
> -:Translator: 高超 gao chao <gaochao49@huawei.com>
>   
>   通过gdb调试内核和模块
>   =====================
> diff --git a/Documentation/translations/zh_CN/dev-tools/index.rst b/Documentation/translations/zh_CN/dev-tools/index.rst
> index 7b37194217b0..bec40aad5223 100644
> --- a/Documentation/translations/zh_CN/dev-tools/index.rst
> +++ b/Documentation/translations/zh_CN/dev-tools/index.rst
> @@ -1,7 +1,6 @@
>   .. include:: ../disclaimer-zh_CN.rst
>   
>   :Original: Documentation/dev-tools/index.rst
> -:Translator: 赵军奎 Bernard Zhao <bernard@vivo.com>
>   
>   ============
>   内核开发工具
> diff --git a/Documentation/translations/zh_CN/dev-tools/kasan.rst b/Documentation/translations/zh_CN/dev-tools/kasan.rst
> index 767b280d8af0..2e0d62adb2a7 100644
> --- a/Documentation/translations/zh_CN/dev-tools/kasan.rst
> +++ b/Documentation/translations/zh_CN/dev-tools/kasan.rst
> @@ -3,7 +3,6 @@
>   .. include:: ../disclaimer-zh_CN.rst
>   
>   :Original: Documentation/dev-tools/kasan.rst
> -:Translator: 万家兵 Wan Jiabing <wanjiabing@vivo.com>
>   
>   内核地址消毒剂(KASAN)
>   =====================
> diff --git a/Documentation/translations/zh_CN/dev-tools/kcov.rst b/Documentation/translations/zh_CN/dev-tools/kcov.rst
> index 629154df7121..fd2285970020 100644
> --- a/Documentation/translations/zh_CN/dev-tools/kcov.rst
> +++ b/Documentation/translations/zh_CN/dev-tools/kcov.rst
> @@ -3,7 +3,6 @@
>   .. include:: ../disclaimer-zh_CN.rst
>   
>   :Original: Documentation/dev-tools/kcov.rst
> -:Translator: 刘浩阳 Haoyang Liu <tttturtleruss@hust.edu.cn>
>   
>   KCOV: 用于模糊测试的代码覆盖率
>   ==============================
> diff --git a/Documentation/translations/zh_CN/dev-tools/kcsan.rst b/Documentation/translations/zh_CN/dev-tools/kcsan.rst
> index 8c495c17f109..ee3c45c1f21a 100644
> --- a/Documentation/translations/zh_CN/dev-tools/kcsan.rst
> +++ b/Documentation/translations/zh_CN/dev-tools/kcsan.rst
> @@ -3,7 +3,6 @@
>   .. include:: ../disclaimer-zh_CN.rst
>   
>   :Original: Documentation/dev-tools/kcsan.rst
> -:Translator: 刘浩阳 Haoyang Liu <tttturtleruss@hust.edu.cn>
>   
>   内核并发消毒剂(KCSAN)
>   =====================
> diff --git a/Documentation/translations/zh_CN/dev-tools/kmemleak.rst b/Documentation/translations/zh_CN/dev-tools/kmemleak.rst
> index d248c8428095..7c6c32a717f1 100644
> --- a/Documentation/translations/zh_CN/dev-tools/kmemleak.rst
> +++ b/Documentation/translations/zh_CN/dev-tools/kmemleak.rst
> @@ -3,7 +3,6 @@
>   .. include:: ../disclaimer-zh_CN.rst
>   
>   :Original: Documentation/dev-tools/kmemleak.rst
> -:Translator: 刘浩阳 Haoyang Liu <tttturtleruss@hust.edu.cn>
>   
>   内核内存泄露检测器
>   ==================
> diff --git a/Documentation/translations/zh_CN/dev-tools/kmsan.rst b/Documentation/translations/zh_CN/dev-tools/kmsan.rst
> index b1ddb47bd6c4..6077732417ed 100644
> --- a/Documentation/translations/zh_CN/dev-tools/kmsan.rst
> +++ b/Documentation/translations/zh_CN/dev-tools/kmsan.rst
> @@ -3,7 +3,6 @@
>   .. include:: ../disclaimer-zh_CN.rst
>   
>   :Original: Documentation/dev-tools/kmsan.rst
> -:Translator: 刘浩阳 Haoyang Liu <tttturtleruss@hust.edu.cn>
>   
>   =======================
>   内核内存消毒剂（KMSAN）
> diff --git a/Documentation/translations/zh_CN/dev-tools/sparse.rst b/Documentation/translations/zh_CN/dev-tools/sparse.rst
> index 0664c634bc4f..00ed26d21979 100644
> --- a/Documentation/translations/zh_CN/dev-tools/sparse.rst
> +++ b/Documentation/translations/zh_CN/dev-tools/sparse.rst
> @@ -1,4 +1,4 @@
> -﻿Copyright 2004 Linus Torvalds
> +Copyright 2004 Linus Torvalds
>   Copyright 2004 Pavel Machek <pavel@ucw.cz>
>   Copyright 2006 Bob Copeland <me@bobcopeland.com>
>   
> @@ -6,16 +6,6 @@ Copyright 2006 Bob Copeland <me@bobcopeland.com>
>   
>   :Original: Documentation/dev-tools/sparse.rst
>   
> -:翻译:
> -
> - Li Yang <leoyang.li@nxp.com>
> -
> -:校译:
> -
> - 司延腾 Yanteng Si <siyanteng@loongson.cn>
> -
> -.. _cn_sparse:
> -
>   Sparse
>   ======
>   
> @@ -107,4 +97,4 @@ __releases  - 指定的锁在函数进入时被持有，但在退出时不被持
>   make 的可选变量 CHECKFLAGS 可以用来向 sparse 工具传递参数。编译系统会自
>   动向 sparse 工具传递 -Wbitwise 参数。
>   
> -注意sparse定义了__CHECKER__预处理器符号。
> \ No newline at end of file
> +注意sparse定义了__CHECKER__预处理器符号。
> diff --git a/Documentation/translations/zh_CN/dev-tools/testing-overview.rst b/Documentation/translations/zh_CN/dev-tools/testing-overview.rst
> index 8bdc51b47b5e..5ac3099dbcb0 100644
> --- a/Documentation/translations/zh_CN/dev-tools/testing-overview.rst
> +++ b/Documentation/translations/zh_CN/dev-tools/testing-overview.rst
> @@ -3,7 +3,6 @@
>   .. include:: ../disclaimer-zh_CN.rst
>   
>   :Original: Documentation/dev-tools/testing-overview.rst
> -:Translator: 胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
>   
>   ============
>   内核测试指南
> diff --git a/Documentation/translations/zh_CN/dev-tools/ubsan.rst b/Documentation/translations/zh_CN/dev-tools/ubsan.rst
> index 81ef6f77caeb..94304b694c5b 100644
> --- a/Documentation/translations/zh_CN/dev-tools/ubsan.rst
> +++ b/Documentation/translations/zh_CN/dev-tools/ubsan.rst
> @@ -4,14 +4,6 @@
>   
>   :Original: Documentation/dev-tools/ubsan.rst
>   
> -:翻译:
> -
> - 慕冬亮 Dongliang Mu <dzm91@hust.edu.cn>
> -
> -:校译:
> -
> - 王昱力 WangYuli <wangyuli@uniontech.com>
> -
>   未定义行为消毒剂 - UBSAN
>   ====================================
>   
> diff --git a/Documentation/translations/zh_CN/devicetree/changesets.rst b/Documentation/translations/zh_CN/devicetree/changesets.rst
> index 3df1b03c5695..e9dcfd1ae49a 100644
> --- a/Documentation/translations/zh_CN/devicetree/changesets.rst
> +++ b/Documentation/translations/zh_CN/devicetree/changesets.rst
> @@ -3,13 +3,6 @@
>   
>   :Original: Documentation/devicetree/changesets.rst
>   
> -:翻译:
> -
> - 司延腾 Yanteng Si <siyanteng@loongson.cn>
> -
> -:校译:
> -
> -
>   ============
>   设备树变更集
>   ============
> diff --git a/Documentation/translations/zh_CN/devicetree/dynamic-resolution-notes.rst b/Documentation/translations/zh_CN/devicetree/dynamic-resolution-notes.rst
> index 6dfd946d7093..f5b681484e50 100644
> --- a/Documentation/translations/zh_CN/devicetree/dynamic-resolution-notes.rst
> +++ b/Documentation/translations/zh_CN/devicetree/dynamic-resolution-notes.rst
> @@ -3,12 +3,6 @@
>   
>   :Original: Documentation/devicetree/dynamic-resolution-notes.rst
>   
> -:翻译:
> -
> - 司延腾 Yanteng Si <siyanteng@loongson.cn>
> -
> -:校译:
> -
>   ========================
>   Devicetree动态解析器说明
>   ========================
> diff --git a/Documentation/translations/zh_CN/devicetree/index.rst b/Documentation/translations/zh_CN/devicetree/index.rst
> index 7451dbfdd3e5..460ad3410a39 100644
> --- a/Documentation/translations/zh_CN/devicetree/index.rst
> +++ b/Documentation/translations/zh_CN/devicetree/index.rst
> @@ -3,13 +3,6 @@
>   
>   :Original: Documentation/devicetree/index.rst
>   
> -:翻译:
> -
> - 司延腾 Yanteng Si <siyanteng@loongson.cn>
> -
> -:校译:
> -
> -
>   =============================
>   Open Firmware 和 Devicetree
>   =============================
> diff --git a/Documentation/translations/zh_CN/devicetree/kernel-api.rst b/Documentation/translations/zh_CN/devicetree/kernel-api.rst
> index 2fb729368b40..2576a98a47a0 100644
> --- a/Documentation/translations/zh_CN/devicetree/kernel-api.rst
> +++ b/Documentation/translations/zh_CN/devicetree/kernel-api.rst
> @@ -3,13 +3,6 @@
>   
>   :Original: Documentation/devicetree/kernel-api.rst
>   
> -:翻译:
> -
> - 司延腾 Yanteng Si <siyanteng@loongson.cn>
> -
> -:校译:
> -
> -
>   =================
>   内核中的设备树API
>   =================
> diff --git a/Documentation/translations/zh_CN/devicetree/of_unittest.rst b/Documentation/translations/zh_CN/devicetree/of_unittest.rst
> index cfd0b751ef27..85e103fdd936 100644
> --- a/Documentation/translations/zh_CN/devicetree/of_unittest.rst
> +++ b/Documentation/translations/zh_CN/devicetree/of_unittest.rst
> @@ -3,12 +3,6 @@
>   
>   :Original: Documentation/devicetree/of_unittest.rst
>   
> -:翻译:
> -
> - 司延腾 Yanteng Si <siyanteng@loongson.cn>
> -
> -:校译:
> -
>   =================================
>   Open Firmware Devicetree 单元测试
>   =================================
> diff --git a/Documentation/translations/zh_CN/devicetree/overlay-notes.rst b/Documentation/translations/zh_CN/devicetree/overlay-notes.rst
> index ba5edd05dc1e..14c13c2f05e8 100644
> --- a/Documentation/translations/zh_CN/devicetree/overlay-notes.rst
> +++ b/Documentation/translations/zh_CN/devicetree/overlay-notes.rst
> @@ -3,12 +3,6 @@
>   
>   :Original: Documentation/devicetree/overlay-notes.rst
>   
> -:翻译:
> -
> - 司延腾 Yanteng Si <siyanteng@loongson.cn>
> -
> -:校译:
> -
>   ==============
>   设备树覆盖说明
>   ==============
> diff --git a/Documentation/translations/zh_CN/devicetree/usage-model.rst b/Documentation/translations/zh_CN/devicetree/usage-model.rst
> index 19ba4ae0cd81..f4ea0124184b 100644
> --- a/Documentation/translations/zh_CN/devicetree/usage-model.rst
> +++ b/Documentation/translations/zh_CN/devicetree/usage-model.rst
> @@ -3,13 +3,6 @@
>   
>   :Original: Documentation/devicetree/usage-model.rst
>   
> -:翻译:
> -
> - 司延腾 Yanteng Si <siyanteng@loongson.cn>
> -
> -:校译:
> -
> -
>   ===================
>   Linux 和 Devicetree
>   ===================
> diff --git a/Documentation/translations/zh_CN/doc-guide/checktransupdate.rst b/Documentation/translations/zh_CN/doc-guide/checktransupdate.rst
> index dbfd65398077..c6c8e72a7159 100644
> --- a/Documentation/translations/zh_CN/doc-guide/checktransupdate.rst
> +++ b/Documentation/translations/zh_CN/doc-guide/checktransupdate.rst
> @@ -4,8 +4,6 @@
>   
>   :Original: Documentation/doc-guide/checktransupdate.rst
>   
> -:译者: 慕冬亮 Dongliang Mu <dzm91@hust.edu.cn>
> -
>   检查翻译更新
>   
>   这个脚本帮助跟踪不同语言的文档翻译状态，即文档是否与对应的英文版本保持更新。
> diff --git a/Documentation/translations/zh_CN/doc-guide/contributing.rst b/Documentation/translations/zh_CN/doc-guide/contributing.rst
> index b0c8ba782b16..739f0b61f123 100644
> --- a/Documentation/translations/zh_CN/doc-guide/contributing.rst
> +++ b/Documentation/translations/zh_CN/doc-guide/contributing.rst
> @@ -4,8 +4,6 @@
>   
>   :Original: Documentation/doc-guide/contributing.rst
>   
> -:译者: 吴想成 Wu XiangCheng <bobwxc@email.cn>
> -
>   如何帮助改进内核文档
>   ====================
>   
> diff --git a/Documentation/translations/zh_CN/doc-guide/index.rst b/Documentation/translations/zh_CN/doc-guide/index.rst
> index 0ac1fc9315ea..74bba8e85743 100644
> --- a/Documentation/translations/zh_CN/doc-guide/index.rst
> +++ b/Documentation/translations/zh_CN/doc-guide/index.rst
> @@ -2,8 +2,6 @@
>   
>   :Original: Documentation/doc-guide/index.rst
>   
> -:译者: 吴想成 Wu XiangCheng <bobwxc@email.cn>
> -
>   .. _doc_guide_zh:
>   
>   ================
> diff --git a/Documentation/translations/zh_CN/doc-guide/kernel-doc.rst b/Documentation/translations/zh_CN/doc-guide/kernel-doc.rst
> index fb2bbaaa85c1..0f425d66bacf 100644
> --- a/Documentation/translations/zh_CN/doc-guide/kernel-doc.rst
> +++ b/Documentation/translations/zh_CN/doc-guide/kernel-doc.rst
> @@ -2,8 +2,6 @@
>   
>   :Original: Documentation/doc-guide/kernel-doc.rst
>   
> -:译者: 吴想成 Wu XiangCheng <bobwxc@email.cn>
> -
>   编写kernel-doc注释
>   ==================
>   
> diff --git a/Documentation/translations/zh_CN/doc-guide/maintainer-profile.rst b/Documentation/translations/zh_CN/doc-guide/maintainer-profile.rst
> index 35c88e5b3d83..1aa6582bc7f4 100644
> --- a/Documentation/translations/zh_CN/doc-guide/maintainer-profile.rst
> +++ b/Documentation/translations/zh_CN/doc-guide/maintainer-profile.rst
> @@ -4,8 +4,6 @@
>   
>   :Original: Documentation/doc-guide/maintainer-profile.rst
>   
> -:译者: 吴想成 Wu XiangCheng <bobwxc@email.cn>
> -
>   文档子系统维护人员条目概述
>   ==========================
>   
> diff --git a/Documentation/translations/zh_CN/doc-guide/parse-headers.rst b/Documentation/translations/zh_CN/doc-guide/parse-headers.rst
> index 65d9dc5143ff..f6f2cd5f18ed 100644
> --- a/Documentation/translations/zh_CN/doc-guide/parse-headers.rst
> +++ b/Documentation/translations/zh_CN/doc-guide/parse-headers.rst
> @@ -4,8 +4,6 @@
>   
>   :Original: Documentation/doc-guide/parse-headers.rst
>   
> -:译者: 吴想成 Wu XiangCheng <bobwxc@email.cn>
> -
>   =====================
>   包含用户空间API头文件
>   =====================
> diff --git a/Documentation/translations/zh_CN/doc-guide/sphinx.rst b/Documentation/translations/zh_CN/doc-guide/sphinx.rst
> index 3375c6f3a811..d135f6cc1ba8 100644
> --- a/Documentation/translations/zh_CN/doc-guide/sphinx.rst
> +++ b/Documentation/translations/zh_CN/doc-guide/sphinx.rst
> @@ -2,8 +2,6 @@
>   
>   :Original: Documentation/doc-guide/sphinx.rst
>   
> -:译者: 吴想成 Wu XiangCheng <bobwxc@email.cn>
> -
>   .. _sphinxdoc_zh:
>   
>   简介
> diff --git a/Documentation/translations/zh_CN/driver-api/gpio/index.rst b/Documentation/translations/zh_CN/driver-api/gpio/index.rst
> index f64a69f771ca..2a3a8af3de1d 100644
> --- a/Documentation/translations/zh_CN/driver-api/gpio/index.rst
> +++ b/Documentation/translations/zh_CN/driver-api/gpio/index.rst
> @@ -4,12 +4,6 @@
>   
>   :Original: Documentation/driver-api/gpio/index.rst
>   
> -:翻译:
> -
> - 司延腾 Yanteng Si <siyanteng@loongson.cn>
> -
> -:校译:
> -
>   =======================
>   通用型输入/输出（GPIO）
>   =======================
> diff --git a/Documentation/translations/zh_CN/driver-api/index.rst b/Documentation/translations/zh_CN/driver-api/index.rst
> index 4050a2fb51c6..0d626ae5bfb2 100644
> --- a/Documentation/translations/zh_CN/driver-api/index.rst
> +++ b/Documentation/translations/zh_CN/driver-api/index.rst
> @@ -4,12 +4,6 @@
>   
>   :Original: Documentation/driver-api/index.rst
>   
> -:翻译:
> -
> - 司延腾 Yanteng Si <siyanteng@loongson.cn>
> -
> -:校译:
> -
>   ========================
>   Linux驱动实现者的API指南
>   ========================
> diff --git a/Documentation/translations/zh_CN/driver-api/io_ordering.rst b/Documentation/translations/zh_CN/driver-api/io_ordering.rst
> index 4dbfa4ce92a0..d8e829d27bc7 100644
> --- a/Documentation/translations/zh_CN/driver-api/io_ordering.rst
> +++ b/Documentation/translations/zh_CN/driver-api/io_ordering.rst
> @@ -4,13 +4,6 @@
>   
>   :Original: Documentation/driver-api/io_ordering.rst
>   
> -:翻译:
> -
> - 林永听 Lin Yongting <linyongting@gmail.com>
> - 司延腾 Yanteng Si <siyanteng@loongson.cn>
> -
> -:校译:
> -
>   ===========================
>   对内存映射地址的I/O写入排序
>   ===========================
> diff --git a/Documentation/translations/zh_CN/driver-api/phy/phy.rst b/Documentation/translations/zh_CN/driver-api/phy/phy.rst
> index 0d7489081b90..b8e8dc10fa1e 100644
> --- a/Documentation/translations/zh_CN/driver-api/phy/phy.rst
> +++ b/Documentation/translations/zh_CN/driver-api/phy/phy.rst
> @@ -3,10 +3,6 @@
>   
>   :Original: Documentation/driver-api/phy/phy.rst
>   
> -:翻译:
> -
> - 司延腾 Yanteng Si <siyanteng@loongson.cn>
> -
>   =========
>   PHY子系统
>   =========
> diff --git a/Documentation/translations/zh_CN/filesystems/debugfs.rst b/Documentation/translations/zh_CN/filesystems/debugfs.rst
> index 4981a82dd651..e74fabca3bc2 100644
> --- a/Documentation/translations/zh_CN/filesystems/debugfs.rst
> +++ b/Documentation/translations/zh_CN/filesystems/debugfs.rst
> @@ -8,17 +8,6 @@
>   Debugfs
>   =======
>   
> -译者
> -::
> -
> -	中文版维护者： 罗楚成 Chucheng Luo <luochucheng@vivo.com>
> -	中文版翻译者： 罗楚成 Chucheng Luo <luochucheng@vivo.com>
> -	中文版校译者:  罗楚成 Chucheng Luo <luochucheng@vivo.com>
> -
> -
> -
> -版权所有2020 罗楚成 <luochucheng@vivo.com>


Alex, Can we delete this copyright? I am not sure, let us discuss it in 
this thread.

Dongliang Mu


> -
>   
>   Debugfs是内核开发人员在用户空间获取信息的简单方法。与/proc不同，proc只提供进程
>   信息。也不像sysfs,具有严格的“每个文件一个值“的规则。debugfs根本没有规则,开发
> diff --git a/Documentation/translations/zh_CN/filesystems/dnotify.rst b/Documentation/translations/zh_CN/filesystems/dnotify.rst
> index 5ab109b9424c..b3c32a1bb080 100644
> --- a/Documentation/translations/zh_CN/filesystems/dnotify.rst
> +++ b/Documentation/translations/zh_CN/filesystems/dnotify.rst
> @@ -4,10 +4,6 @@
>   
>   :Original: Documentation/filesystems/dnotify.rst
>   
> -:翻译:
> -
> -   王龙杰 Wang Longjie <wang.longjie1@zte.com.cn>
> -
>   ==============
>   Linux 目录通知
>   ==============
> diff --git a/Documentation/translations/zh_CN/filesystems/gfs2-glocks.rst b/Documentation/translations/zh_CN/filesystems/gfs2-glocks.rst
> index abfd2f2f94e9..357a3c5a8f30 100644
> --- a/Documentation/translations/zh_CN/filesystems/gfs2-glocks.rst
> +++ b/Documentation/translations/zh_CN/filesystems/gfs2-glocks.rst
> @@ -4,14 +4,6 @@
>   
>   :Original: Documentation/filesystems/gfs2-glocks.rst
>   
> -:翻译:
> -
> - 邵明寅 Shao Mingyin <shao.mingyin@zte.com.cn>
> -
> -:校译:
> -
> - 杨涛 yang tao <yang.tao172@zte.com.cn>
> -
>   ==================
>   Glock 内部加锁规则
>   ==================
> diff --git a/Documentation/translations/zh_CN/filesystems/gfs2-uevents.rst b/Documentation/translations/zh_CN/filesystems/gfs2-uevents.rst
> index 3975c4544118..7bb22c9768b1 100644
> --- a/Documentation/translations/zh_CN/filesystems/gfs2-uevents.rst
> +++ b/Documentation/translations/zh_CN/filesystems/gfs2-uevents.rst
> @@ -4,14 +4,6 @@
>   
>   :Original: Documentation/filesystems/gfs2-uevents.rst
>   
> -:翻译:
> -
> -   邵明寅 Shao Mingyin <shao.mingyin@zte.com.cn>
> -
> -:校译:
> -
> -   杨涛 yang tao <yang.tao172@zte.com.cn>
> -
>   ===============
>   uevents 与 GFS2
>   ===============
> diff --git a/Documentation/translations/zh_CN/filesystems/gfs2.rst b/Documentation/translations/zh_CN/filesystems/gfs2.rst
> index ffa62b12b019..7189b4bc1d39 100644
> --- a/Documentation/translations/zh_CN/filesystems/gfs2.rst
> +++ b/Documentation/translations/zh_CN/filesystems/gfs2.rst
> @@ -4,14 +4,6 @@
>   
>   :Original: Documentation/filesystems/gfs2.rst
>   
> -:翻译:
> -
> -   邵明寅 Shao Mingyin <shao.mingyin@zte.com.cn>
> -
> -:校译:
> -
> -   杨涛 yang tao <yang.tao172@zte.com.cn>
> -
>   =====================================
>   全局文件系统 2 (Global File System 2)
>   =====================================
> diff --git a/Documentation/translations/zh_CN/filesystems/index.rst b/Documentation/translations/zh_CN/filesystems/index.rst
> index fcc79ff9fdad..f55033e7c73c 100644
> --- a/Documentation/translations/zh_CN/filesystems/index.rst
> +++ b/Documentation/translations/zh_CN/filesystems/index.rst
> @@ -3,9 +3,6 @@
>   .. include:: ../disclaimer-zh_CN.rst
>   
>   :Original: :ref:`Documentation/filesystems/index.rst <filesystems_index>`
> -:Translator: Wang Wenhu <wenhu.wang@vivo.com>
> -
> -.. _cn_filesystems_index:
>   
>   ========================
>   Linux Kernel中的文件系统
> diff --git a/Documentation/translations/zh_CN/filesystems/inotify.rst b/Documentation/translations/zh_CN/filesystems/inotify.rst
> index b4d740aca946..a562b93ba26a 100644
> --- a/Documentation/translations/zh_CN/filesystems/inotify.rst
> +++ b/Documentation/translations/zh_CN/filesystems/inotify.rst
> @@ -4,10 +4,6 @@
>   
>   :Original: Documentation/filesystems/inotify.rst
>   
> -:翻译:
> -
> -   王龙杰 Wang Longjie <wang.longjie1@zte.com.cn>
> -
>   ==========================================
>   Inotify - 一个强大且简单的文件变更通知系统
>   ==========================================
> diff --git a/Documentation/translations/zh_CN/filesystems/tmpfs.rst b/Documentation/translations/zh_CN/filesystems/tmpfs.rst
> index 6fd9d83b2db5..f342030c959d 100644
> --- a/Documentation/translations/zh_CN/filesystems/tmpfs.rst
> +++ b/Documentation/translations/zh_CN/filesystems/tmpfs.rst
> @@ -4,8 +4,6 @@
>   
>   :Original: Documentation/filesystems/tmpfs.rst
>   
> -translated by Wang Qing<wangqing@vivo.com>
> -
>   =====
>   Tmpfs
>   =====
> diff --git a/Documentation/translations/zh_CN/filesystems/ubifs-authentication.rst b/Documentation/translations/zh_CN/filesystems/ubifs-authentication.rst
> index 0e7cf7707e26..b637313f4a44 100644
> --- a/Documentation/translations/zh_CN/filesystems/ubifs-authentication.rst
> +++ b/Documentation/translations/zh_CN/filesystems/ubifs-authentication.rst
> @@ -4,14 +4,6 @@
>   
>   :Original: Documentation/filesystems/ubifs-authentication.rst
>   
> -:翻译:
> -
> -   邵明寅 Shao Mingyin <shao.mingyin@zte.com.cn>
> -
> -:校译:
> -
> -   杨涛 yang tao <yang.tao172@zte.com.cn>
> -
>   =============
>   UBIFS认证支持
>   =============
> diff --git a/Documentation/translations/zh_CN/filesystems/ubifs.rst b/Documentation/translations/zh_CN/filesystems/ubifs.rst
> index d1873fc6a67c..931eb47ca8ef 100644
> --- a/Documentation/translations/zh_CN/filesystems/ubifs.rst
> +++ b/Documentation/translations/zh_CN/filesystems/ubifs.rst
> @@ -4,14 +4,6 @@
>   
>   :Original: Documentation/filesystems/ubifs.rst
>   
> -:翻译:
> -
> -   邵明寅 Shao Mingyin <shao.mingyin@zte.com.cn>
> -
> -:校译:
> -
> -   杨涛 yang tao <yang.tao172@zte.com.cn>
> -
>   ============
>   UBI 文件系统
>   ============
> diff --git a/Documentation/translations/zh_CN/filesystems/virtiofs.rst b/Documentation/translations/zh_CN/filesystems/virtiofs.rst
> index 09bc9e012e2a..ef2ef9e22d0a 100644
> --- a/Documentation/translations/zh_CN/filesystems/virtiofs.rst
> +++ b/Documentation/translations/zh_CN/filesystems/virtiofs.rst
> @@ -4,13 +4,6 @@
>   
>   :Original: :ref:`Documentation/filesystems/virtiofs.rst <virtiofs_index>`
>   
> -译者
> -::
> -
> -	中文版维护者： 王文虎 Wang Wenhu <wenhu.wang@vivo.com>
> -	中文版翻译者： 王文虎 Wang Wenhu <wenhu.wang@vivo.com>
> -	中文版校译者： 王文虎 Wang Wenhu <wenhu.wang@vivo.com>
> -
>   ===========================================
>   virtiofs: virtio-fs 主机<->客机共享文件系统
>   ===========================================
> diff --git a/Documentation/translations/zh_CN/iio/ep93xx_adc.rst b/Documentation/translations/zh_CN/iio/ep93xx_adc.rst
> index 64f3f3508353..2e1e1682c2ae 100644
> --- a/Documentation/translations/zh_CN/iio/ep93xx_adc.rst
> +++ b/Documentation/translations/zh_CN/iio/ep93xx_adc.rst
> @@ -2,12 +2,6 @@
>   
>   :Original: Documentation/iio/ep93xx_adc.rst
>   
> -:翻译:
> -
> - 司延腾 Yanteng Si <siyanteng@loongson.cn>
> -
> -.. _cn_iio_ep93xx_adc:
> -
>   ==================================
>   思睿逻辑 EP93xx 模拟数字转换器驱动
>   ==================================
> diff --git a/Documentation/translations/zh_CN/iio/iio_configfs.rst b/Documentation/translations/zh_CN/iio/iio_configfs.rst
> index eccaf1c644b4..24b4f610dcb2 100644
> --- a/Documentation/translations/zh_CN/iio/iio_configfs.rst
> +++ b/Documentation/translations/zh_CN/iio/iio_configfs.rst
> @@ -2,12 +2,6 @@
>   
>   :Original: Documentation/iio/iio_configfs.rst
>   
> -:翻译:
> -
> - 司延腾 Yanteng Si <siyanteng@loongson.cn>
> -
> -.. _cn_iio_configfs:
> -
>   =====================
>   工业 IIO configfs支持
>   =====================
> diff --git a/Documentation/translations/zh_CN/iio/index.rst b/Documentation/translations/zh_CN/iio/index.rst
> index 32d69047b16a..c265327a272e 100644
> --- a/Documentation/translations/zh_CN/iio/index.rst
> +++ b/Documentation/translations/zh_CN/iio/index.rst
> @@ -4,12 +4,6 @@
>   
>   :Original: Documentation/iio/index.rst
>   
> -:翻译:
> -
> - 司延腾 Yanteng Si <siyanteng@loongson.cn>
> -
> -.. _cn_iio_index:
> -
>   ========
>   工业 I/O
>   ========
> diff --git a/Documentation/translations/zh_CN/infiniband/core_locking.rst b/Documentation/translations/zh_CN/infiniband/core_locking.rst
> index 42f08038d44b..a5dfb5c14645 100644
> --- a/Documentation/translations/zh_CN/infiniband/core_locking.rst
> +++ b/Documentation/translations/zh_CN/infiniband/core_locking.rst
> @@ -3,17 +3,6 @@
>   
>   :Original: Documentation/infiniband/core_locking.rst
>   
> -:翻译:
> -
> - 司延腾 Yanteng Si <siyanteng@loongson.cn>
> -
> -:校译:
> -
> - 王普宇 Puyu Wang <realpuyuwang@gmail.com>
> - 时奎亮 Alex Shi <alexs@kernel.org>
> -
> -.. _cn_infiniband_core_locking:
> -
>   ==================
>   infiniband中间层锁
>   ==================
> diff --git a/Documentation/translations/zh_CN/infiniband/index.rst b/Documentation/translations/zh_CN/infiniband/index.rst
> index aeeea0b49939..aeb3f3f50536 100644
> --- a/Documentation/translations/zh_CN/infiniband/index.rst
> +++ b/Documentation/translations/zh_CN/infiniband/index.rst
> @@ -4,17 +4,6 @@
>   
>   :Original: Documentation/infiniband/index.rst
>   
> -:翻译:
> -
> - 司延腾 Yanteng Si <siyanteng@loongson.cn>
> -
> -:校译:
> -
> - 王普宇 Puyu Wang <realpuyuwang@gmail.com>
> - 时奎亮 Alex Shi <alexs@kernel.org>
> -
> -.. _cn_infiniband_index:
> -
>   ==========
>   infiniband
>   ==========
> diff --git a/Documentation/translations/zh_CN/infiniband/ipoib.rst b/Documentation/translations/zh_CN/infiniband/ipoib.rst
> index 56517ea5fe9d..2a68ed6b04b0 100644
> --- a/Documentation/translations/zh_CN/infiniband/ipoib.rst
> +++ b/Documentation/translations/zh_CN/infiniband/ipoib.rst
> @@ -2,17 +2,6 @@
>   
>   :Original: Documentation/infiniband/ipoib.rst
>   
> -:翻译:
> -
> - 司延腾 Yanteng Si <siyanteng@loongson.cn>
> -
> -:校译:
> -
> - 王普宇 Puyu Wang <realpuyuwang@gmail.com>
> - 时奎亮 Alex Shi <alexs@kernel.org>
> -
> -.. _cn_infiniband_ipoib:
> -
>   =========================
>   infiniband上的IP（IPoIB）
>   =========================
> diff --git a/Documentation/translations/zh_CN/infiniband/sysfs.rst b/Documentation/translations/zh_CN/infiniband/sysfs.rst
> index e9a48b0b2ba6..dbe161a2ea06 100644
> --- a/Documentation/translations/zh_CN/infiniband/sysfs.rst
> +++ b/Documentation/translations/zh_CN/infiniband/sysfs.rst
> @@ -2,17 +2,6 @@
>   
>   :Original: Documentation/infiniband/sysfs.rst
>   
> -:翻译:
> -
> - 司延腾 Yanteng Si <siyanteng@loongson.cn>
> -
> -:校译:
> -
> - 王普宇 Puyu Wang <realpuyuwang@gmail.com>
> - 时奎亮 Alex Shi <alexs@kernel.org>
> -
> -.. _cn_infiniband_sysfs:
> -
>   =========
>   Sysfs文件
>   =========
> diff --git a/Documentation/translations/zh_CN/infiniband/tag_matching.rst b/Documentation/translations/zh_CN/infiniband/tag_matching.rst
> index 19b99587b862..c5fecdf46cd2 100644
> --- a/Documentation/translations/zh_CN/infiniband/tag_matching.rst
> +++ b/Documentation/translations/zh_CN/infiniband/tag_matching.rst
> @@ -2,17 +2,6 @@
>   
>   :Original: Documentation/infiniband/tag_matching.rst
>   
> -:翻译:
> -
> - 司延腾 Yanteng Si <siyanteng@loongson.cn>
> -
> -:校译:
> -
> - 王普宇 Puyu Wang <realpuyuwang@gmail.com>
> - 时奎亮 Alex Shi <alexs@kernel.org>
> -
> -.. _cn_infiniband_tag_matching:
> -
>   ============
>   标签匹配逻辑
>   ============
> diff --git a/Documentation/translations/zh_CN/infiniband/user_mad.rst b/Documentation/translations/zh_CN/infiniband/user_mad.rst
> index d9ab2edfb559..ceddd60ca819 100644
> --- a/Documentation/translations/zh_CN/infiniband/user_mad.rst
> +++ b/Documentation/translations/zh_CN/infiniband/user_mad.rst
> @@ -2,17 +2,6 @@
>   
>   :Original: Documentation/infiniband/user_mad.rst
>   
> -:翻译:
> -
> - 司延腾 Yanteng Si <siyanteng@loongson.cn>
> -
> -:校译:
> -
> - 王普宇 Puyu Wang <realpuyuwang@gmail.com>
> - 时奎亮 Alex Shi <alexs@kernel.org>
> -
> -.. _cn_infiniband_user_mad:
> -
>   ===============
>   用户空间MAD访问
>   ===============
> diff --git a/Documentation/translations/zh_CN/infiniband/user_verbs.rst b/Documentation/translations/zh_CN/infiniband/user_verbs.rst
> index 31534681654b..5918b156d7f9 100644
> --- a/Documentation/translations/zh_CN/infiniband/user_verbs.rst
> +++ b/Documentation/translations/zh_CN/infiniband/user_verbs.rst
> @@ -2,17 +2,6 @@
>   
>   :Original: Documentation/infiniband/user_verbs.rst
>   
> -:翻译:
> -
> - 司延腾 Yanteng Si <siyanteng@loongson.cn>
> -
> -:校译:
> -
> - 王普宇 Puyu Wang <realpuyuwang@gmail.com>
> - 时奎亮 Alex Shi <alexs@kernel.org>
> -
> -.. _cn_infiniband_user_verbs:
> -
>   =================
>   用户空间verbs访问
>   =================
> diff --git a/Documentation/translations/zh_CN/kbuild/gcc-plugins.rst b/Documentation/translations/zh_CN/kbuild/gcc-plugins.rst
> index 67a8abbf5887..c8a49bdf496a 100644
> --- a/Documentation/translations/zh_CN/kbuild/gcc-plugins.rst
> +++ b/Documentation/translations/zh_CN/kbuild/gcc-plugins.rst
> @@ -3,7 +3,6 @@
>   .. include:: ../disclaimer-zh_CN.rst
>   
>   :Original: Documentation/kbuild/gcc-plugins.rst
> -:Translator: 慕冬亮 Dongliang Mu <dzm91@hust.edu.cn>
>   
>   ================
>   GCC 插件基础设施
> diff --git a/Documentation/translations/zh_CN/kbuild/headers_install.rst b/Documentation/translations/zh_CN/kbuild/headers_install.rst
> index 02cb8896e555..abeb50271da2 100644
> --- a/Documentation/translations/zh_CN/kbuild/headers_install.rst
> +++ b/Documentation/translations/zh_CN/kbuild/headers_install.rst
> @@ -3,7 +3,6 @@
>   .. include:: ../disclaimer-zh_CN.rst
>   
>   :Original: Documentation/kbuild/headers_install.rst
> -:Translator: 慕冬亮 Dongliang Mu <dzm91@hust.edu.cn>
>   
>   ============================
>   导出内核头文件供用户空间使用
> diff --git a/Documentation/translations/zh_CN/kbuild/index.rst b/Documentation/translations/zh_CN/kbuild/index.rst
> index 3f9ab52fa5bb..c9adaebdf73e 100644
> --- a/Documentation/translations/zh_CN/kbuild/index.rst
> +++ b/Documentation/translations/zh_CN/kbuild/index.rst
> @@ -3,7 +3,6 @@
>   .. include:: ../disclaimer-zh_CN.rst
>   
>   :Original: Documentation/kbuild/index.rst
> -:Translator: 慕冬亮 Dongliang Mu <dzm91@hust.edu.cn>
>   
>   ============
>   内核编译系统
> diff --git a/Documentation/translations/zh_CN/kbuild/kbuild.rst b/Documentation/translations/zh_CN/kbuild/kbuild.rst
> index a477b4b08958..5149d06abfca 100644
> --- a/Documentation/translations/zh_CN/kbuild/kbuild.rst
> +++ b/Documentation/translations/zh_CN/kbuild/kbuild.rst
> @@ -3,7 +3,6 @@
>   .. include:: ../disclaimer-zh_CN.rst
>   
>   :Original: Documentation/kbuild/kbuild.rst
> -:Translator: 慕冬亮 Dongliang Mu <dzm91@hust.edu.cn>
>   
>   ======
>   Kbuild
> diff --git a/Documentation/translations/zh_CN/kbuild/kconfig.rst b/Documentation/translations/zh_CN/kbuild/kconfig.rst
> index 3b06d8913dbf..1d6996cbdef0 100644
> --- a/Documentation/translations/zh_CN/kbuild/kconfig.rst
> +++ b/Documentation/translations/zh_CN/kbuild/kconfig.rst
> @@ -3,7 +3,6 @@
>   .. include:: ../disclaimer-zh_CN.rst
>   
>   :Original: Documentation/kbuild/kconfig.rst
> -:Translator: 慕冬亮 Dongliang Mu <dzm91@hust.edu.cn>
>   
>   ================
>   配置目标和编辑器
> diff --git a/Documentation/translations/zh_CN/kbuild/llvm.rst b/Documentation/translations/zh_CN/kbuild/llvm.rst
> index f87e0181d8e7..7f6d8f084599 100644
> --- a/Documentation/translations/zh_CN/kbuild/llvm.rst
> +++ b/Documentation/translations/zh_CN/kbuild/llvm.rst
> @@ -3,7 +3,6 @@
>   .. include:: ../disclaimer-zh_CN.rst
>   
>   :Original: Documentation/kbuild/llvm.rst
> -:Translator: 慕冬亮 Dongliang Mu <dzm91@hust.edu.cn>
>   
>   ==========================
>   使用 Clang/LLVM 构建 Linux
> diff --git a/Documentation/translations/zh_CN/kbuild/reproducible-builds.rst b/Documentation/translations/zh_CN/kbuild/reproducible-builds.rst
> index 5f27ebf2fbfc..676be656c7a2 100644
> --- a/Documentation/translations/zh_CN/kbuild/reproducible-builds.rst
> +++ b/Documentation/translations/zh_CN/kbuild/reproducible-builds.rst
> @@ -4,8 +4,6 @@
>   
>   :Original: Documentation/kbuild/reproducible-builds.rst
>   
> -:Translator: 慕冬亮 Dongliang Mu <dzm91@hust.edu.cn>
> -
>   ============
>   可重现的构建
>   ============
> diff --git a/Documentation/translations/zh_CN/kernel-hacking/hacking.rst b/Documentation/translations/zh_CN/kernel-hacking/hacking.rst
> index 9112949b993c..60af54dbbb96 100644
> --- a/Documentation/translations/zh_CN/kernel-hacking/hacking.rst
> +++ b/Documentation/translations/zh_CN/kernel-hacking/hacking.rst
> @@ -2,10 +2,6 @@
>   
>   :Original: Documentation/kernel-hacking/hacking.rst
>   
> -:译者:
> -
> - 吴想成 Wu XiangCheng <bobwxc@email.cn>
> -
>   ==============
>   内核骇客指北
>   ==============
> diff --git a/Documentation/translations/zh_CN/kernel-hacking/index.rst b/Documentation/translations/zh_CN/kernel-hacking/index.rst
> index df530de2278d..10b132f71951 100644
> --- a/Documentation/translations/zh_CN/kernel-hacking/index.rst
> +++ b/Documentation/translations/zh_CN/kernel-hacking/index.rst
> @@ -4,10 +4,6 @@
>   
>   :Original: Documentation/kernel-hacking/index.rst
>   
> -:译者:
> -
> - 吴想成 Wu XiangCheng <bobwxc@email.cn>
> -
>   =============
>   内核骇客指南
>   =============
> diff --git a/Documentation/translations/zh_CN/locking/index.rst b/Documentation/translations/zh_CN/locking/index.rst
> index f0b10707668d..c3b1c9ae85ac 100644
> --- a/Documentation/translations/zh_CN/locking/index.rst
> +++ b/Documentation/translations/zh_CN/locking/index.rst
> @@ -3,10 +3,6 @@
>   
>   :Original: Documentation/locking/index.rst
>   
> -:翻译:
> -
> -  唐艺舟 Tang Yizhou <tangyeechou@gmail.com>
> -
>   ==
>   锁
>   ==
> diff --git a/Documentation/translations/zh_CN/locking/mutex-design.rst b/Documentation/translations/zh_CN/locking/mutex-design.rst
> index 6aad54372a6c..b9b551c1461c 100644
> --- a/Documentation/translations/zh_CN/locking/mutex-design.rst
> +++ b/Documentation/translations/zh_CN/locking/mutex-design.rst
> @@ -3,10 +3,6 @@
>   
>   :Original: Documentation/locking/mutex-design.rst
>   
> -:翻译:
> -
> -  唐艺舟 Tang Yizhou <tangyeechou@gmail.com>
> -
>   ================
>   通用互斥锁子系统
>   ================
> diff --git a/Documentation/translations/zh_CN/locking/spinlocks.rst b/Documentation/translations/zh_CN/locking/spinlocks.rst
> index 2017c01f0a4b..178d3c6f14fd 100644
> --- a/Documentation/translations/zh_CN/locking/spinlocks.rst
> +++ b/Documentation/translations/zh_CN/locking/spinlocks.rst
> @@ -3,10 +3,6 @@
>   
>   :Original: Documentation/locking/spinlocks.rst
>   
> -:翻译:
> -
> -  唐艺舟 Tang Yizhou <tangyeechou@gmail.com>
> -
>   ==========
>   加锁的教训
>   ==========
> diff --git a/Documentation/translations/zh_CN/maintainer/configure-git.rst b/Documentation/translations/zh_CN/maintainer/configure-git.rst
> index a45ea736f73b..8b97f2674e69 100644
> --- a/Documentation/translations/zh_CN/maintainer/configure-git.rst
> +++ b/Documentation/translations/zh_CN/maintainer/configure-git.rst
> @@ -2,10 +2,6 @@
>   
>   :Original: Documentation/maintainer/configure-git.rst
>   
> -:译者:
> -
> - 吴想成 Wu XiangCheng <bobwxc@email.cn>
> -
>   .. _configuregit_zh:
>   
>   Git配置
> diff --git a/Documentation/translations/zh_CN/maintainer/maintainer-entry-profile.rst b/Documentation/translations/zh_CN/maintainer/maintainer-entry-profile.rst
> index 0f5acfb1012e..5e9c12b0abb4 100644
> --- a/Documentation/translations/zh_CN/maintainer/maintainer-entry-profile.rst
> +++ b/Documentation/translations/zh_CN/maintainer/maintainer-entry-profile.rst
> @@ -2,10 +2,6 @@
>   
>   :Original: Documentation/maintainer/maintainer-entry-profile.rst
>   
> -:译者:
> -
> - 吴想成 Wu XiangCheng <bobwxc@email.cn>
> -
>   .. _maintainerentryprofile_zh:
>   
>   维护者条目概要
> diff --git a/Documentation/translations/zh_CN/maintainer/modifying-patches.rst b/Documentation/translations/zh_CN/maintainer/modifying-patches.rst
> index 7f6326137f6b..54a54b1203ce 100644
> --- a/Documentation/translations/zh_CN/maintainer/modifying-patches.rst
> +++ b/Documentation/translations/zh_CN/maintainer/modifying-patches.rst
> @@ -2,10 +2,6 @@
>   
>   :Original: Documentation/maintainer/modifying-patches.rst
>   
> -:译者:
> -
> - 吴想成 Wu XiangCheng <bobwxc@email.cn>
> -
>   .. _modifyingpatches_zh:
>   
>   修改补丁
> diff --git a/Documentation/translations/zh_CN/maintainer/pull-requests.rst b/Documentation/translations/zh_CN/maintainer/pull-requests.rst
> index ce9725f4674c..5ae520646aa5 100644
> --- a/Documentation/translations/zh_CN/maintainer/pull-requests.rst
> +++ b/Documentation/translations/zh_CN/maintainer/pull-requests.rst
> @@ -2,10 +2,6 @@
>   
>   :Original: Documentation/maintainer/pull-requests.rst
>   
> -:译者:
> -
> - 吴想成 Wu XiangCheng <bobwxc@email.cn>
> -
>   .. _pullrequests_zh:
>   
>   如何创建拉取请求
> diff --git a/Documentation/translations/zh_CN/maintainer/rebasing-and-merging.rst b/Documentation/translations/zh_CN/maintainer/rebasing-and-merging.rst
> index 83b7dabfe88b..3f4095bb00f8 100644
> --- a/Documentation/translations/zh_CN/maintainer/rebasing-and-merging.rst
> +++ b/Documentation/translations/zh_CN/maintainer/rebasing-and-merging.rst
> @@ -4,10 +4,6 @@
>   
>   :Original: Documentation/maintainer/rebasing-and-merging.rst
>   
> -:译者:
> -
> - 吴想成 Wu XiangCheng <bobwxc@email.cn>
> -
>   ==========
>   变基与合并
>   ==========
> diff --git a/Documentation/translations/zh_CN/mm/active_mm.rst b/Documentation/translations/zh_CN/mm/active_mm.rst
> index 9496a0bb7d07..97518dcc67b3 100644
> --- a/Documentation/translations/zh_CN/mm/active_mm.rst
> +++ b/Documentation/translations/zh_CN/mm/active_mm.rst
> @@ -2,13 +2,6 @@
>   
>   :Original: Documentation/mm/active_mm.rst
>   
> -:翻译:
> -
> - 司延腾 Yanteng Si <siyanteng@loongson.cn>
> -
> -:校译:
> -
> -
>   =========
>   Active MM
>   =========
> diff --git a/Documentation/translations/zh_CN/mm/balance.rst b/Documentation/translations/zh_CN/mm/balance.rst
> index f877c0cfa39a..d51d158d18f5 100644
> --- a/Documentation/translations/zh_CN/mm/balance.rst
> +++ b/Documentation/translations/zh_CN/mm/balance.rst
> @@ -2,13 +2,6 @@
>   
>   :Original: Documentation/mm/balance.rst
>   
> -:翻译:
> -
> - 司延腾 Yanteng Si <siyanteng@loongson.cn>
> -
> -:校译:
> -
> -
>   ========
>   内存平衡
>   ========
> diff --git a/Documentation/translations/zh_CN/mm/damon/api.rst b/Documentation/translations/zh_CN/mm/damon/api.rst
> index 5593a83c86bc..b420da98c95c 100644
> --- a/Documentation/translations/zh_CN/mm/damon/api.rst
> +++ b/Documentation/translations/zh_CN/mm/damon/api.rst
> @@ -2,13 +2,6 @@
>   
>   :Original: Documentation/mm/damon/api.rst
>   
> -:翻译:
> -
> - 司延腾 Yanteng Si <siyanteng@loongson.cn>
> -
> -:校译:
> -
> -
>   =======
>   API参考
>   =======
> diff --git a/Documentation/translations/zh_CN/mm/damon/design.rst b/Documentation/translations/zh_CN/mm/damon/design.rst
> index b7790bcea9b9..2986fb4edf73 100644
> --- a/Documentation/translations/zh_CN/mm/damon/design.rst
> +++ b/Documentation/translations/zh_CN/mm/damon/design.rst
> @@ -2,13 +2,6 @@
>   
>   :Original: Documentation/mm/damon/design.rst
>   
> -:翻译:
> -
> - 司延腾 Yanteng Si <siyanteng@loongson.cn>
> -
> -:校译:
> -
> -
>   ====
>   设计
>   ====
> diff --git a/Documentation/translations/zh_CN/mm/damon/faq.rst b/Documentation/translations/zh_CN/mm/damon/faq.rst
> index 234d63f4f072..68e4a78129e3 100644
> --- a/Documentation/translations/zh_CN/mm/damon/faq.rst
> +++ b/Documentation/translations/zh_CN/mm/damon/faq.rst
> @@ -2,13 +2,6 @@
>   
>   :Original: Documentation/mm/damon/faq.rst
>   
> -:翻译:
> -
> - 司延腾 Yanteng Si <siyanteng@loongson.cn>
> -
> -:校译:
> -
> -
>   ========
>   常见问题
>   ========
> diff --git a/Documentation/translations/zh_CN/mm/damon/index.rst b/Documentation/translations/zh_CN/mm/damon/index.rst
> index b03bf307204f..5703dca1148e 100644
> --- a/Documentation/translations/zh_CN/mm/damon/index.rst
> +++ b/Documentation/translations/zh_CN/mm/damon/index.rst
> @@ -2,13 +2,6 @@
>   
>   :Original: Documentation/mm/damon/index.rst
>   
> -:翻译:
> -
> - 司延腾 Yanteng Si <siyanteng@loongson.cn>
> -
> -:校译:
> -
> -
>   ==========================
>   DAMON:数据访问监视器
>   ==========================
> diff --git a/Documentation/translations/zh_CN/mm/free_page_reporting.rst b/Documentation/translations/zh_CN/mm/free_page_reporting.rst
> index 5bfd58014c94..197ca6caed57 100644
> --- a/Documentation/translations/zh_CN/mm/free_page_reporting.rst
> +++ b/Documentation/translations/zh_CN/mm/free_page_reporting.rst
> @@ -2,12 +2,6 @@
>   
>   :Original: Documentation/mm/free_page_reporting.rst
>   
> -:翻译:
> -
> - 司延腾 Yanteng Si <siyanteng@loongson.cn>
> -
> -:校译:
> -
>   ==========
>   空闲页报告
>   ==========
> diff --git a/Documentation/translations/zh_CN/mm/highmem.rst b/Documentation/translations/zh_CN/mm/highmem.rst
> index 2c0ee0cbf5c4..1649f7489e0c 100644
> --- a/Documentation/translations/zh_CN/mm/highmem.rst
> +++ b/Documentation/translations/zh_CN/mm/highmem.rst
> @@ -2,12 +2,6 @@
>   
>   :Original: Documentation/mm/highmem.rst
>   
> -:翻译:
> -
> - 司延腾 Yanteng Si <siyanteng@loongson.cn>
> -
> -:校译:
> -
>   ==========
>   高内存处理
>   ==========
> diff --git a/Documentation/translations/zh_CN/mm/hmm.rst b/Documentation/translations/zh_CN/mm/hmm.rst
> index 22c210f4e94f..4c52d7748a78 100644
> --- a/Documentation/translations/zh_CN/mm/hmm.rst
> +++ b/Documentation/translations/zh_CN/mm/hmm.rst
> @@ -2,12 +2,6 @@
>   
>   :Original: Documentation/mm/hmm.rst
>   
> -:翻译:
> -
> - 司延腾 Yanteng Si <siyanteng@loongson.cn>
> -
> -:校译:
> -
>   ==================
>   异构内存管理 (HMM)
>   ==================
> diff --git a/Documentation/translations/zh_CN/mm/hugetlbfs_reserv.rst b/Documentation/translations/zh_CN/mm/hugetlbfs_reserv.rst
> index 20947f8bd065..b845a9950129 100644
> --- a/Documentation/translations/zh_CN/mm/hugetlbfs_reserv.rst
> +++ b/Documentation/translations/zh_CN/mm/hugetlbfs_reserv.rst
> @@ -2,12 +2,6 @@
>   
>   :Original: Documentation/mm/hugetlbfs_reserv.rst
>   
> -:翻译:
> -
> - 司延腾 Yanteng Si <siyanteng@loongson.cn>
> -
> -:校译:
> -
>   ==============
>   Hugetlbfs 预留
>   ==============
> diff --git a/Documentation/translations/zh_CN/mm/hwpoison.rst b/Documentation/translations/zh_CN/mm/hwpoison.rst
> index 310862edc937..1a248ea1dc19 100644
> --- a/Documentation/translations/zh_CN/mm/hwpoison.rst
> +++ b/Documentation/translations/zh_CN/mm/hwpoison.rst
> @@ -1,13 +1,6 @@
>   
>   :Original: Documentation/mm/hwpoison.rst
>   
> -:翻译:
> -
> - 司延腾 Yanteng Si <siyanteng@loongson.cn>
> -
> -:校译:
> -
> -
>   ========
>   hwpoison
>   ========
> diff --git a/Documentation/translations/zh_CN/mm/index.rst b/Documentation/translations/zh_CN/mm/index.rst
> index a71116be058f..e8852155b456 100644
> --- a/Documentation/translations/zh_CN/mm/index.rst
> +++ b/Documentation/translations/zh_CN/mm/index.rst
> @@ -2,12 +2,6 @@
>   
>   :Original: Documentation/mm/index.rst
>   
> -:翻译:
> -
> - 司延腾 Yanteng Si <siyanteng@loongson.cn>
> -
> -:校译:
> -
>   =================
>   Linux内存管理文档
>   =================
> diff --git a/Documentation/translations/zh_CN/mm/ksm.rst b/Documentation/translations/zh_CN/mm/ksm.rst
> index 822c7a289671..f87d66d80346 100644
> --- a/Documentation/translations/zh_CN/mm/ksm.rst
> +++ b/Documentation/translations/zh_CN/mm/ksm.rst
> @@ -2,10 +2,6 @@
>   
>   :Original: Documentation/mm/ksm.rst
>   
> -:翻译:
> -
> -   徐鑫 xu xin <xu.xin16@zte.com.cn>
> -
>   ============
>   内核同页合并
>   ============
> diff --git a/Documentation/translations/zh_CN/mm/memory-model.rst b/Documentation/translations/zh_CN/mm/memory-model.rst
> index c0c5d8ecd880..c03187c0c690 100644
> --- a/Documentation/translations/zh_CN/mm/memory-model.rst
> +++ b/Documentation/translations/zh_CN/mm/memory-model.rst
> @@ -2,13 +2,6 @@
>   
>   :Original: Documentation/mm/memory-model.rst
>   
> -:翻译:
> -
> - 司延腾 Yanteng Si <siyanteng@loongson.cn>
> -
> -:校译:
> -
> -
>   ============
>   物理内存模型
>   ============
> diff --git a/Documentation/translations/zh_CN/mm/mmu_notifier.rst b/Documentation/translations/zh_CN/mm/mmu_notifier.rst
> index ce3664d1a410..6f37106a0974 100644
> --- a/Documentation/translations/zh_CN/mm/mmu_notifier.rst
> +++ b/Documentation/translations/zh_CN/mm/mmu_notifier.rst
> @@ -1,13 +1,5 @@
>   :Original: Documentation/mm/mmu_notifier.rst
>   
> -:翻译:
> -
> - 司延腾 Yanteng Si <siyanteng@loongson.cn>
> -
> -:校译:
> -
> -
> -
>   什么时候需要页表锁内通知？
>   ==========================
>   
> diff --git a/Documentation/translations/zh_CN/mm/numa.rst b/Documentation/translations/zh_CN/mm/numa.rst
> index 61fad89272fa..0a9eb413e4be 100644
> --- a/Documentation/translations/zh_CN/mm/numa.rst
> +++ b/Documentation/translations/zh_CN/mm/numa.rst
> @@ -1,12 +1,5 @@
>   :Original: Documentation/mm/numa.rst
>   
> -:翻译:
> -
> - 司延腾 Yanteng Si <siyanteng@loongson.cn>
> -
> -:校译:
> -
> -
>   始于1999年11月，作者： <kanoj@sgi.com>
>   
>   ==========================
> diff --git a/Documentation/translations/zh_CN/mm/overcommit-accounting.rst b/Documentation/translations/zh_CN/mm/overcommit-accounting.rst
> index f136a8b81859..3152559b971d 100644
> --- a/Documentation/translations/zh_CN/mm/overcommit-accounting.rst
> +++ b/Documentation/translations/zh_CN/mm/overcommit-accounting.rst
> @@ -1,13 +1,5 @@
>   :Original: Documentation/mm/overcommit-accounting.rst
>   
> -:翻译:
> -
> - 司延腾 Yanteng Si <siyanteng@loongson.cn>
> -
> -:校译:
> -
> -
> -
>   ==============
>   超量使用审计
>   ==============
> diff --git a/Documentation/translations/zh_CN/mm/page_frags.rst b/Documentation/translations/zh_CN/mm/page_frags.rst
> index a5b22486a913..2e9176c064b9 100644
> --- a/Documentation/translations/zh_CN/mm/page_frags.rst
> +++ b/Documentation/translations/zh_CN/mm/page_frags.rst
> @@ -1,12 +1,5 @@
>   :Original: Documentation/mm/page_frags.rst
>   
> -:翻译:
> -
> - 司延腾 Yanteng Si <siyanteng@loongson.cn>
> -
> -:校译:
> -
> -
>   ========
>   页面片段
>   ========
> diff --git a/Documentation/translations/zh_CN/mm/page_migration.rst b/Documentation/translations/zh_CN/mm/page_migration.rst
> index 8c8461c6cb9f..f81ef6fa433c 100644
> --- a/Documentation/translations/zh_CN/mm/page_migration.rst
> +++ b/Documentation/translations/zh_CN/mm/page_migration.rst
> @@ -2,12 +2,6 @@
>   
>   :Original: Documentation/mm/page_migration.rst
>   
> -:翻译:
> -
> - 司延腾 Yanteng Si <siyanteng@loongson.cn>
> -
> -:校译:
> -
>   ========
>   页面迁移
>   ========
> diff --git a/Documentation/translations/zh_CN/mm/page_owner.rst b/Documentation/translations/zh_CN/mm/page_owner.rst
> index c0d1ca4b9695..3be91ac7b201 100644
> --- a/Documentation/translations/zh_CN/mm/page_owner.rst
> +++ b/Documentation/translations/zh_CN/mm/page_owner.rst
> @@ -1,12 +1,5 @@
>   :Original: Documentation/mm/page_owner.rst
>   
> -:翻译:
> -
> - 司延腾 Yanteng Si <siyanteng@loongson.cn>
> -
> -:校译:
> -
> -
>   ================================
>   page owner: 跟踪谁分配的每个页面
>   ================================
> diff --git a/Documentation/translations/zh_CN/mm/page_table_check.rst b/Documentation/translations/zh_CN/mm/page_table_check.rst
> index dc34570dceff..c062e715cd06 100644
> --- a/Documentation/translations/zh_CN/mm/page_table_check.rst
> +++ b/Documentation/translations/zh_CN/mm/page_table_check.rst
> @@ -2,13 +2,6 @@
>   
>   :Original: Documentation/mm/page_table_check.rst
>   
> -:翻译:
> -
> - 司延腾 Yanteng Si <siyanteng@loongson.cn>
> -
> -:校译:
> -
> -
>   ========
>   页表检查
>   ========
> diff --git a/Documentation/translations/zh_CN/mm/page_tables.rst b/Documentation/translations/zh_CN/mm/page_tables.rst
> index c9f750fc5298..d5fcc6bb5e5e 100644
> --- a/Documentation/translations/zh_CN/mm/page_tables.rst
> +++ b/Documentation/translations/zh_CN/mm/page_tables.rst
> @@ -3,12 +3,6 @@
>   
>   :Original: Documentation/mm/page_tables.rst
>   
> -:翻译:
> -
> - 张鹏宇 Pengyu Zhang <zpenya1314@gmail.com>
> -
> -:校译:
> -
>   ====
>   页表
>   ====
> diff --git a/Documentation/translations/zh_CN/mm/physical_memory.rst b/Documentation/translations/zh_CN/mm/physical_memory.rst
> index 4594d15cefec..22e79db44b68 100644
> --- a/Documentation/translations/zh_CN/mm/physical_memory.rst
> +++ b/Documentation/translations/zh_CN/mm/physical_memory.rst
> @@ -4,10 +4,6 @@
>   
>   :Original: Documentation/mm/physical_memory.rst
>   
> -:翻译:
> -
> -   王亚鑫 Yaxin Wang <wang.yaxin@zte.com.cn>
> -
>   ========
>   物理内存
>   ========
> diff --git a/Documentation/translations/zh_CN/mm/remap_file_pages.rst b/Documentation/translations/zh_CN/mm/remap_file_pages.rst
> index 31e0c54dc36f..bc420c42808c 100644
> --- a/Documentation/translations/zh_CN/mm/remap_file_pages.rst
> +++ b/Documentation/translations/zh_CN/mm/remap_file_pages.rst
> @@ -1,12 +1,5 @@
>   :Original: Documentation/mm/remap_file_pages.rst
>   
> -:翻译:
> -
> - 司延腾 Yanteng Si <siyanteng@loongson.cn>
> -
> -:校译:
> -
> -
>   ==============================
>   remap_file_pages()系统调用
>   ==============================
> diff --git a/Documentation/translations/zh_CN/mm/split_page_table_lock.rst b/Documentation/translations/zh_CN/mm/split_page_table_lock.rst
> index a2c288670a24..a4d95a8e2951 100644
> --- a/Documentation/translations/zh_CN/mm/split_page_table_lock.rst
> +++ b/Documentation/translations/zh_CN/mm/split_page_table_lock.rst
> @@ -1,12 +1,5 @@
>   :Original: Documentation/mm/split_page_table_lock.rst
>   
> -:翻译:
> -
> - 司延腾 Yanteng Si <siyanteng@loongson.cn>
> -
> -:校译:
> -
> -
>   =================================
>   分页表锁（split page table lock）
>   =================================
> diff --git a/Documentation/translations/zh_CN/mm/vmalloced-kernel-stacks.rst b/Documentation/translations/zh_CN/mm/vmalloced-kernel-stacks.rst
> index d02a23f7f07e..219abf6e4975 100644
> --- a/Documentation/translations/zh_CN/mm/vmalloced-kernel-stacks.rst
> +++ b/Documentation/translations/zh_CN/mm/vmalloced-kernel-stacks.rst
> @@ -3,12 +3,6 @@
>   
>   :Original: Documentation/mm/vmalloced-kernel-stacks.rst
>   
> -:翻译:
> -
> - 司延腾 Yanteng Si <siyanteng@loongson.cn>
> -
> -:校译:
> -
>   ====================
>   支持虚拟映射的内核栈
>   ====================
> diff --git a/Documentation/translations/zh_CN/mm/zsmalloc.rst b/Documentation/translations/zh_CN/mm/zsmalloc.rst
> index 4c8c9b1006a9..15b2f8644a60 100644
> --- a/Documentation/translations/zh_CN/mm/zsmalloc.rst
> +++ b/Documentation/translations/zh_CN/mm/zsmalloc.rst
> @@ -1,11 +1,5 @@
>   :Original: Documentation/mm/zsmalloc.rst
>   
> -:翻译:
> -
> - 司延腾 Yanteng Si <siyanteng@loongson.cn>
> -
> -:校译:
> -
>   ========
>   zsmalloc
>   ========
> diff --git a/Documentation/translations/zh_CN/networking/alias.rst b/Documentation/translations/zh_CN/networking/alias.rst
> index e024d9eac50e..4d8c8a0abf85 100644
> --- a/Documentation/translations/zh_CN/networking/alias.rst
> +++ b/Documentation/translations/zh_CN/networking/alias.rst
> @@ -4,12 +4,6 @@
>   
>   :Original: Documentation/networking/alias.rst
>   
> -:翻译:
> -
> - 邱禹潭 Qiu Yutan <qiu.yutan@zte.com.cn>
> -
> -:校译:
> -
>   ======
>   IP别名
>   ======
> diff --git a/Documentation/translations/zh_CN/networking/driver.rst b/Documentation/translations/zh_CN/networking/driver.rst
> index acb0863c6b0d..b870d3e0d4a3 100644
> --- a/Documentation/translations/zh_CN/networking/driver.rst
> +++ b/Documentation/translations/zh_CN/networking/driver.rst
> @@ -4,10 +4,6 @@
>   
>   :Original: Documentation/networking/driver.rst
>   
> -:翻译:
> -
> -	陈思为 Siwei Chen <businiaoanka@anka1.top>
> -
>   ================
>   Softnet 驱动问题
>   ================
> diff --git a/Documentation/translations/zh_CN/networking/generic-hdlc.rst b/Documentation/translations/zh_CN/networking/generic-hdlc.rst
> index 9e493dc9721e..446a762d77d5 100644
> --- a/Documentation/translations/zh_CN/networking/generic-hdlc.rst
> +++ b/Documentation/translations/zh_CN/networking/generic-hdlc.rst
> @@ -4,10 +4,6 @@
>   
>   :Original: Documentation/networking/generic-hdlc.rst
>   
> -:翻译:
> -
> -   孙渔喜 Sun yuxi <sun.yuxi@zte.com.cn>
> -
>   ==========
>   通用HDLC层
>   ==========
> diff --git a/Documentation/translations/zh_CN/networking/index.rst b/Documentation/translations/zh_CN/networking/index.rst
> index bf22d22b64db..9c2fb8e48f82 100644
> --- a/Documentation/translations/zh_CN/networking/index.rst
> +++ b/Documentation/translations/zh_CN/networking/index.rst
> @@ -4,12 +4,6 @@
>   
>   :Original: Documentation/networking/index.rst
>   
> -:翻译:
> -
> - 王亚鑫 Wang Yaxin <wang.yaxin@zte.com.cn>
> -
> -:校译:
> -
>   网络
>   ====
>   
> diff --git a/Documentation/translations/zh_CN/networking/ipv6.rst b/Documentation/translations/zh_CN/networking/ipv6.rst
> index 3726b6fdc460..dfab46080041 100644
> --- a/Documentation/translations/zh_CN/networking/ipv6.rst
> +++ b/Documentation/translations/zh_CN/networking/ipv6.rst
> @@ -4,10 +4,6 @@
>   
>   :Original: Documentation/networking/ipv6.rst
>   
> -:翻译:
> -
> -	陈思为 Siwei Chen <businiaoanka@anka1.top>
> -
>   ====
>   IPv6
>   ====
> diff --git a/Documentation/translations/zh_CN/networking/mptcp-sysctl.rst b/Documentation/translations/zh_CN/networking/mptcp-sysctl.rst
> index 0b1b9ed7c647..2e0c8bef5420 100644
> --- a/Documentation/translations/zh_CN/networking/mptcp-sysctl.rst
> +++ b/Documentation/translations/zh_CN/networking/mptcp-sysctl.rst
> @@ -4,10 +4,6 @@
>   
>   :Original: Documentation/networking/mptcp-sysctl.rst
>   
> -:翻译:
> -
> -   孙渔喜 Sun yuxi <sun.yuxi@zte.com.cn>
> -
>   ================
>   MPTCP Sysfs 变量
>   ================
> diff --git a/Documentation/translations/zh_CN/networking/msg_zerocopy.rst b/Documentation/translations/zh_CN/networking/msg_zerocopy.rst
> index 821b32c4d1bf..4ccefddb2dc0 100644
> --- a/Documentation/translations/zh_CN/networking/msg_zerocopy.rst
> +++ b/Documentation/translations/zh_CN/networking/msg_zerocopy.rst
> @@ -4,15 +4,6 @@
>   
>   :Original: Documentation/networking/msg_zerocopy.rst
>   
> -:翻译:
> -
> -   王亚鑫 Wang Yaxin <wang.yaxin@zte.com.cn>
> -
> -:校译:
> -
> -   - 徐鑫 xu xin <xu.xin16@zte.com.cn>
> -   - 何配林 He Peilin <he.peilin@zte.com.cn>
> -
>   ============
>   MSG_ZEROCOPY
>   ============
> diff --git a/Documentation/translations/zh_CN/networking/napi.rst b/Documentation/translations/zh_CN/networking/napi.rst
> index 619971c3dea3..9e31b2bf63d1 100644
> --- a/Documentation/translations/zh_CN/networking/napi.rst
> +++ b/Documentation/translations/zh_CN/networking/napi.rst
> @@ -3,10 +3,6 @@
>   
>   :Original: Documentation/networking/napi.rst
>   
> -:翻译:
> -
> -   王亚鑫 Yaxin Wang <wang.yaxin@zte.com.cn>
> -
>   ====
>   NAPI
>   ====
> diff --git a/Documentation/translations/zh_CN/networking/netif-msg.rst b/Documentation/translations/zh_CN/networking/netif-msg.rst
> index 877399b169fe..df2845eece3a 100644
> --- a/Documentation/translations/zh_CN/networking/netif-msg.rst
> +++ b/Documentation/translations/zh_CN/networking/netif-msg.rst
> @@ -4,10 +4,6 @@
>   
>   :Original: Documentation/networking/netif-msg.rst
>   
> -:翻译:
> -
> -   王亚鑫 Wang Yaxin <wang.yaxin@zte.com.cn>
> -
>   ================
>   网络接口消息级别
>   ================
> diff --git a/Documentation/translations/zh_CN/networking/netmem.rst b/Documentation/translations/zh_CN/networking/netmem.rst
> index 320f3eacf51b..7b0ac202484b 100644
> --- a/Documentation/translations/zh_CN/networking/netmem.rst
> +++ b/Documentation/translations/zh_CN/networking/netmem.rst
> @@ -4,10 +4,6 @@
>   
>   :Original: Documentation/networking/netmem.rst
>   
> -:翻译:
> -
> -   王亚鑫 Wang Yaxin <wang.yaxin@zte.com.cn>
> -
>   ==================
>   网络驱动支持Netmem
>   ==================
> diff --git a/Documentation/translations/zh_CN/networking/secid.rst b/Documentation/translations/zh_CN/networking/secid.rst
> index 94d9e7fb5d13..7d202b0b0285 100644
> --- a/Documentation/translations/zh_CN/networking/secid.rst
> +++ b/Documentation/translations/zh_CN/networking/secid.rst
> @@ -4,10 +4,6 @@
>   
>   :Original: Documentation/networking/secid.rst
>   
> -:翻译:
> -
> -	陈思为 Siwei Chen <businiaoanka@anka1.top>
> -
>   =================
>   LSM/SeLinux secid
>   =================
> diff --git a/Documentation/translations/zh_CN/networking/sriov.rst b/Documentation/translations/zh_CN/networking/sriov.rst
> index d5e16a099b07..c65b94baa490 100644
> --- a/Documentation/translations/zh_CN/networking/sriov.rst
> +++ b/Documentation/translations/zh_CN/networking/sriov.rst
> @@ -4,10 +4,6 @@
>   
>   :Original: Documentation/networking/sriov.rst
>   
> -:翻译:
> -
> -	陈思为 Siwei Chen <businiaoanka@anka1.top>
> -
>   ===============
>   网卡 SR-IOV API
>   ===============
> diff --git a/Documentation/translations/zh_CN/networking/team.rst b/Documentation/translations/zh_CN/networking/team.rst
> index e6cf19a245a1..e73a976337c1 100644
> --- a/Documentation/translations/zh_CN/networking/team.rst
> +++ b/Documentation/translations/zh_CN/networking/team.rst
> @@ -4,10 +4,6 @@
>   
>   :Original: Documentation/networking/team.rst
>   
> -:翻译:
> -
> -	陈思为 Siwei Chen <businiaoanka@anka1.top>
> -
>   ====================
>   Team（网络接口聚合）
>   ====================
> diff --git a/Documentation/translations/zh_CN/networking/timestamping.rst b/Documentation/translations/zh_CN/networking/timestamping.rst
> index 4593f53ad09a..285d21c89be6 100644
> --- a/Documentation/translations/zh_CN/networking/timestamping.rst
> +++ b/Documentation/translations/zh_CN/networking/timestamping.rst
> @@ -4,10 +4,6 @@
>   
>   :Original: Documentation/networking/timestamping.rst
>   
> -:翻译:
> -
> -   王亚鑫 Wang Yaxin <wang.yaxin@zte.com.cn>
> -
>   ======
>   时间戳
>   ======
> diff --git a/Documentation/translations/zh_CN/networking/vxlan.rst b/Documentation/translations/zh_CN/networking/vxlan.rst
> index e319eddfcdbe..a231e1cd28e8 100644
> --- a/Documentation/translations/zh_CN/networking/vxlan.rst
> +++ b/Documentation/translations/zh_CN/networking/vxlan.rst
> @@ -3,15 +3,6 @@
>   
>   :Original: Documentation/networking/vxlan.rst
>   
> -:翻译:
> -
> - 范雨 Fan Yu <fan.yu9@zte.com.cn>
> -
> -:校译:
> -
> - - 邱禹潭 Qiu Yutan <qiu.yutan@zte.com.cn>
> - - 徐鑫 xu xin <xu.xin16@zte.com.cn>
> -
>   ==========================
>   虚拟扩展本地局域网协议文档
>   ==========================
> diff --git a/Documentation/translations/zh_CN/networking/xfrm_proc.rst b/Documentation/translations/zh_CN/networking/xfrm_proc.rst
> index a2ae86c44707..d1f2ddee2978 100644
> --- a/Documentation/translations/zh_CN/networking/xfrm_proc.rst
> +++ b/Documentation/translations/zh_CN/networking/xfrm_proc.rst
> @@ -4,10 +4,6 @@
>   
>   :Original: Documentation/networking/xfrm_proc.rst
>   
> -:翻译:
> -
> -   王亚鑫 Wang Yaxin <wang.yaxin@zte.com.cn>
> -
>   =================================
>   XFRM proc - /proc/net/xfrm_* 文件
>   =================================
> diff --git a/Documentation/translations/zh_CN/peci/index.rst b/Documentation/translations/zh_CN/peci/index.rst
> index 4f6694c828fa..f87edd09345a 100644
> --- a/Documentation/translations/zh_CN/peci/index.rst
> +++ b/Documentation/translations/zh_CN/peci/index.rst
> @@ -3,12 +3,6 @@
>   
>   :Original: Documentation/peci/index.rst
>   
> -:翻译:
> -
> - 司延腾 Yanteng Si <siyanteng@loongson.cn>
> -
> -:校译:
> -
>   =================
>   Linux PECI 子系统
>   =================
> diff --git a/Documentation/translations/zh_CN/peci/peci.rst b/Documentation/translations/zh_CN/peci/peci.rst
> index a3b4f99b994c..0c0eaf2e1ddb 100644
> --- a/Documentation/translations/zh_CN/peci/peci.rst
> +++ b/Documentation/translations/zh_CN/peci/peci.rst
> @@ -3,12 +3,6 @@
>   
>   :Original: Documentation/peci/peci.rst
>   
> -:翻译:
> -
> - 司延腾 Yanteng Si <siyanteng@loongson.cn>
> -
> -:校译:
> -
>   ====
>   概述
>   ====
> diff --git a/Documentation/translations/zh_CN/power/energy-model.rst b/Documentation/translations/zh_CN/power/energy-model.rst
> index 48849919d8aa..dfaf9653c83b 100644
> --- a/Documentation/translations/zh_CN/power/energy-model.rst
> +++ b/Documentation/translations/zh_CN/power/energy-model.rst
> @@ -3,10 +3,6 @@
>   
>   :Original: Documentation/power/energy-model.rst
>   
> -:翻译:
> -
> -  唐艺舟 Tang Yizhou <tangyeechou@gmail.com>
> -
>   ============
>   设备能量模型
>   ============
> diff --git a/Documentation/translations/zh_CN/power/index.rst b/Documentation/translations/zh_CN/power/index.rst
> index bc54983ba515..db0791a76027 100644
> --- a/Documentation/translations/zh_CN/power/index.rst
> +++ b/Documentation/translations/zh_CN/power/index.rst
> @@ -3,10 +3,6 @@
>   
>   :Original: Documentation/power/index.rst
>   
> -:翻译:
> -
> -  唐艺舟 Tang Yizhou <tangyeechou@gmail.com>
> -
>   ========
>   电源管理
>   ========
> diff --git a/Documentation/translations/zh_CN/power/opp.rst b/Documentation/translations/zh_CN/power/opp.rst
> index 7470fa2d4c43..3ac597e796d1 100644
> --- a/Documentation/translations/zh_CN/power/opp.rst
> +++ b/Documentation/translations/zh_CN/power/opp.rst
> @@ -3,10 +3,6 @@
>   
>   :Original: Documentation/power/opp.rst
>   
> -:翻译:
> -
> -  唐艺舟 Tang Yizhou <tangyeechou@gmail.com>
> -
>   ======================
>   操作性能值（OPP）库
>   ======================
> diff --git a/Documentation/translations/zh_CN/process/1.Intro.rst b/Documentation/translations/zh_CN/process/1.Intro.rst
> index e314cce49d27..df1591c2c5ee 100644
> --- a/Documentation/translations/zh_CN/process/1.Intro.rst
> +++ b/Documentation/translations/zh_CN/process/1.Intro.rst
> @@ -2,16 +2,6 @@
>   
>   :Original: :ref:`Documentation/process/1.Intro.rst <development_process_intro>`
>   
> -:Translator:
> -
> - 时奎亮 Alex Shi <alex.shi@linux.alibaba.com>
> -
> -:校译:
> -
> - 吴想成 Wu XiangCheng <bobwxc@email.cn>
> -
> -.. _cn_development_process_intro:
> -
>   引言
>   ====
>   
> diff --git a/Documentation/translations/zh_CN/process/2.Process.rst b/Documentation/translations/zh_CN/process/2.Process.rst
> index ca00672c313e..ec307cfa8336 100644
> --- a/Documentation/translations/zh_CN/process/2.Process.rst
> +++ b/Documentation/translations/zh_CN/process/2.Process.rst
> @@ -2,14 +2,6 @@
>   
>   :Original: :ref:`Documentation/process/2.Process.rst <development_process>`
>   
> -:Translator:
> -
> - 时奎亮 Alex Shi <alex.shi@linux.alibaba.com>
> -
> -:校译:
> -
> - 吴想成 Wu XiangCheng <bobwxc@email.cn>
> -
>   .. _cn_development_process:
>   
>   开发流程如何进行
> diff --git a/Documentation/translations/zh_CN/process/3.Early-stage.rst b/Documentation/translations/zh_CN/process/3.Early-stage.rst
> index 2caba4753b75..bfa9e1faff74 100644
> --- a/Documentation/translations/zh_CN/process/3.Early-stage.rst
> +++ b/Documentation/translations/zh_CN/process/3.Early-stage.rst
> @@ -2,14 +2,6 @@
>   
>   :Original: :ref:`Documentation/process/3.Early-stage.rst <development_early_stage>`
>   
> -:Translator:
> -
> - 时奎亮 Alex Shi <alex.shi@linux.alibaba.com>
> -
> -:校译:
> -
> - 吴想成 Wu XiangCheng <bobwxc@email.cn>
> -
>   .. _cn_development_early_stage:
>   
>   早期规划
> diff --git a/Documentation/translations/zh_CN/process/4.Coding.rst b/Documentation/translations/zh_CN/process/4.Coding.rst
> index a00ad5d6b81e..6ff7393e7167 100644
> --- a/Documentation/translations/zh_CN/process/4.Coding.rst
> +++ b/Documentation/translations/zh_CN/process/4.Coding.rst
> @@ -2,14 +2,6 @@
>   
>   :Original: :ref:`Documentation/process/4.Coding.rst <development_coding>`
>   
> -:Translator:
> -
> - 时奎亮 Alex Shi <alex.shi@linux.alibaba.com>
> -
> -:校译:
> -
> - 吴想成 Wu XiangCheng <bobwxc@email.cn>
> -
>   .. _cn_development_coding:
>   
>   使代码正确
> diff --git a/Documentation/translations/zh_CN/process/5.Posting.rst b/Documentation/translations/zh_CN/process/5.Posting.rst
> index ce37cf6a60e2..a514ea8d9c10 100644
> --- a/Documentation/translations/zh_CN/process/5.Posting.rst
> +++ b/Documentation/translations/zh_CN/process/5.Posting.rst
> @@ -2,14 +2,6 @@
>   
>   :Original: :ref:`Documentation/process/5.Posting.rst <development_posting>`
>   
> -:Translator:
> -
> - 时奎亮 Alex Shi <alex.shi@linux.alibaba.com>
> -
> -:校译:
> -
> - 吴想成 Wu XiangCheng <bobwxc@email.cn>
> -
>   .. _cn_development_posting:
>   
>   发布补丁
> diff --git a/Documentation/translations/zh_CN/process/6.Followthrough.rst b/Documentation/translations/zh_CN/process/6.Followthrough.rst
> index 3d19c59ca6e4..c38f3fff0ecf 100644
> --- a/Documentation/translations/zh_CN/process/6.Followthrough.rst
> +++ b/Documentation/translations/zh_CN/process/6.Followthrough.rst
> @@ -2,14 +2,6 @@
>   
>   :Original: :ref:`Documentation/process/6.Followthrough.rst <development_followthrough>`
>   
> -:Translator:
> -
> - 时奎亮 Alex Shi <alex.shi@linux.alibaba.com>
> -
> -:校译:
> -
> - 吴想成 Wu XiangCheng <bobwxc@email.cn>
> -
>   .. _cn_development_followthrough:
>   
>   跟进
> diff --git a/Documentation/translations/zh_CN/process/7.AdvancedTopics.rst b/Documentation/translations/zh_CN/process/7.AdvancedTopics.rst
> index 92cc06dd5f4e..8a5154d6b636 100644
> --- a/Documentation/translations/zh_CN/process/7.AdvancedTopics.rst
> +++ b/Documentation/translations/zh_CN/process/7.AdvancedTopics.rst
> @@ -2,14 +2,6 @@
>   
>   :Original: :ref:`Documentation/process/7.AdvancedTopics.rst <development_advancedtopics>`
>   
> -:Translator:
> -
> - 时奎亮 Alex Shi <alex.shi@linux.alibaba.com>
> -
> -:校译:
> -
> - 吴想成 Wu XiangCheng <bobwxc@email.cn>
> -
>   .. _cn_development_advancedtopics:
>   
>   高级主题
> diff --git a/Documentation/translations/zh_CN/process/8.Conclusion.rst b/Documentation/translations/zh_CN/process/8.Conclusion.rst
> index 643b88af97bb..0590288d8e4b 100644
> --- a/Documentation/translations/zh_CN/process/8.Conclusion.rst
> +++ b/Documentation/translations/zh_CN/process/8.Conclusion.rst
> @@ -1,13 +1,6 @@
>   .. include:: ../disclaimer-zh_CN.rst
>   
>   :Original: :ref:`Documentation/process/8.Conclusion.rst <development_conclusion>`
> -:Translator:
> -
> - 时奎亮 Alex Shi <alex.shi@linux.alibaba.com>
> -
> -:校译:
> -
> - 吴想成 Wu XiangCheng <bobwxc@email.cn>
>   
>   .. _cn_development_conclusion:
>   
> diff --git a/Documentation/translations/zh_CN/process/applying-patches.rst b/Documentation/translations/zh_CN/process/applying-patches.rst
> index c056b241b0cd..bb100c883e8f 100644
> --- a/Documentation/translations/zh_CN/process/applying-patches.rst
> +++ b/Documentation/translations/zh_CN/process/applying-patches.rst
> @@ -4,10 +4,6 @@
>   
>   :Original: Documentation/process/applying-patches.rst
>   
> -:翻译:
> -
> - 袁维杰 Weijie Yuan <wy@wyuan.org>
> -
>   将补丁应用到 Linux 内核
>   +++++++++++++++++++++++
>   
> diff --git a/Documentation/translations/zh_CN/process/code-of-conduct-interpretation.rst b/Documentation/translations/zh_CN/process/code-of-conduct-interpretation.rst
> index c323ce76e0cb..d0e589c58e6e 100644
> --- a/Documentation/translations/zh_CN/process/code-of-conduct-interpretation.rst
> +++ b/Documentation/translations/zh_CN/process/code-of-conduct-interpretation.rst
> @@ -1,7 +1,6 @@
>   .. include:: ../disclaimer-zh_CN.rst
>   
>   :Original: :ref:`Documentation/process/code-of-conduct-interpretation.rst <code_of_conduct_interpretation>`
> -:Translator: Alex Shi <alex.shi@linux.alibaba.com>
>   
>   .. _cn_code_of_conduct_interpretation:
>   
> diff --git a/Documentation/translations/zh_CN/process/code-of-conduct.rst b/Documentation/translations/zh_CN/process/code-of-conduct.rst
> index 99024df058e9..256deb559127 100644
> --- a/Documentation/translations/zh_CN/process/code-of-conduct.rst
> +++ b/Documentation/translations/zh_CN/process/code-of-conduct.rst
> @@ -1,7 +1,6 @@
>   .. include:: ../disclaimer-zh_CN.rst
>   
>   :Original: :ref:`Documentation/process/code-of-conduct.rst <code_of_conduct>`
> -:Translator: Alex Shi <alex.shi@linux.alibaba.com>
>   
>   .. _cn_code_of_conduct:
>   
> diff --git a/Documentation/translations/zh_CN/process/coding-style.rst b/Documentation/translations/zh_CN/process/coding-style.rst
> index 55d5da974d89..c76b85fc1f07 100644
> --- a/Documentation/translations/zh_CN/process/coding-style.rst
> +++ b/Documentation/translations/zh_CN/process/coding-style.rst
> @@ -4,11 +4,6 @@
>   
>   .. _cn_codingstyle:
>   
> -:译者:
> - - 张乐 Zhang Le <r0bertz@gentoo.org>
> - - Andy Deng <theandy.deng@gmail.com>
> - - 吴想成 <bobwxc@email.cn>
> -
>   :校译:
>    - 王聪 Wang Cong <xiyou.wangcong@gmail.com>
>    - wheelz <kernel.zeng@gmail.com>


Remove "校译" fields


> diff --git a/Documentation/translations/zh_CN/process/cve.rst b/Documentation/translations/zh_CN/process/cve.rst
> index e39b796efcec..ceb050816f11 100644
> --- a/Documentation/translations/zh_CN/process/cve.rst
> +++ b/Documentation/translations/zh_CN/process/cve.rst
> @@ -1,7 +1,6 @@
>   .. include:: ../disclaimer-zh_CN.rst
>   
>   :Original: Documentation/process/cve.rst
> -:Translator: Dongliang Mu <dzm91@hust.edu.cn>
>   
>   ====
>   CVEs
> diff --git a/Documentation/translations/zh_CN/process/development-process.rst b/Documentation/translations/zh_CN/process/development-process.rst
> index c10d8e2e21eb..7b09588a5ba2 100644
> --- a/Documentation/translations/zh_CN/process/development-process.rst
> +++ b/Documentation/translations/zh_CN/process/development-process.rst
> @@ -1,9 +1,6 @@
>   .. include:: ../disclaimer-zh_CN.rst
>   
>   :Original: :ref:`Documentation/process/development-process.rst <development_process_main>`
> -:Translator: Alex Shi <alex.shi@linux.alibaba.com>
> -
> -.. _cn_development_process_main:
>   
>   内核开发过程指南
>   ================
> diff --git a/Documentation/translations/zh_CN/process/email-clients.rst b/Documentation/translations/zh_CN/process/email-clients.rst
> index 069c0460d20c..fef6ef8f1669 100644
> --- a/Documentation/translations/zh_CN/process/email-clients.rst
> +++ b/Documentation/translations/zh_CN/process/email-clients.rst
> @@ -6,16 +6,6 @@
>   
>   :Original: Documentation/process/email-clients.rst
>   
> -:译者:
> - - 贾威威  Harry Wei <harryxiyou@gmail.com>
> - - 时奎亮  Alex Shi <alexs@kernel.org>
> - - 吴想成  Wu XiangCheng <bobwxc@email.cn>
> -
> -:校译:
> - - Yinglin Luan <synmyth@gmail.com>
> - - Xiaochen Wang <wangxiaochen0@gmail.com>
> - - yaxinsn <yaxinsn@163.com>
> -
>   Linux邮件客户端配置信息
>   =======================
>   
> diff --git a/Documentation/translations/zh_CN/process/embargoed-hardware-issues.rst b/Documentation/translations/zh_CN/process/embargoed-hardware-issues.rst
> index c90ecb557811..68f1227def9c 100644
> --- a/Documentation/translations/zh_CN/process/embargoed-hardware-issues.rst
> +++ b/Documentation/translations/zh_CN/process/embargoed-hardware-issues.rst
> @@ -1,7 +1,6 @@
>   .. include:: ../disclaimer-zh_CN.rst
>   
>   :Original: :ref:`Documentation/process/embargoed-hardware-issues.rst <embargoed_hardware_issues>`
> -:Translator: Alex Shi <alex.shi@linux.alibaba.com>
>   
>   被限制的硬件问题
>   ================
> diff --git a/Documentation/translations/zh_CN/process/howto.rst b/Documentation/translations/zh_CN/process/howto.rst
> index 89af3f8f6e2b..530862d48d47 100644
> --- a/Documentation/translations/zh_CN/process/howto.rst
> +++ b/Documentation/translations/zh_CN/process/howto.rst
> @@ -1,20 +1,9 @@
> -﻿.. _cn_process_howto:
> +.. _cn_process_howto:
>   
>   .. include:: ../disclaimer-zh_CN.rst
>   
>   :Original: :ref:`Documentation/process/howto.rst <process_howto>`
>   
> -译者::
> -
> -    英文版维护者： Greg Kroah-Hartman <greg@kroah.com>
> -    中文版维护者： 李阳  Li Yang <leoyang.li@nxp.com>
> -    中文版翻译者： 李阳  Li Yang <leoyang.li@nxp.com>
> -                   时奎亮 Alex Shi <alex.shi@linux.alibaba.com>
> -    中文版校译者:
> -                   钟宇  TripleX Chung <xxx.phy@gmail.com>
> -                   陈琦  Maggie Chen <chenqi@beyondsoft.com>
> -                   王聪  Wang Cong <xiyou.wangcong@gmail.com>
> -
>   如何参与Linux内核开发
>   =====================
>   
> diff --git a/Documentation/translations/zh_CN/process/index.rst b/Documentation/translations/zh_CN/process/index.rst
> index 3a36ca7d9333..03ac38260fe7 100644
> --- a/Documentation/translations/zh_CN/process/index.rst
> +++ b/Documentation/translations/zh_CN/process/index.rst
> @@ -7,10 +7,6 @@
>   
>   :Original: Documentation/process/index.rst
>   
> -:翻译:
> -
> - Alex Shi <alex.shi@linux.alibaba.com>
> -
>   ========================
>   与Linux 内核社区一起工作
>   ========================
> diff --git a/Documentation/translations/zh_CN/process/kernel-driver-statement.rst b/Documentation/translations/zh_CN/process/kernel-driver-statement.rst
> index 2b3375bcccfd..1a44dfcecc53 100644
> --- a/Documentation/translations/zh_CN/process/kernel-driver-statement.rst
> +++ b/Documentation/translations/zh_CN/process/kernel-driver-statement.rst
> @@ -1,9 +1,6 @@
> -.. _cn_process_statement_driver:
> -
>   .. include:: ../disclaimer-zh_CN.rst
>   
>   :Original: :ref:`Documentation/process/kernel-driver-statement.rst <process_statement_driver>`
> -:Translator: Alex Shi <alex.shi@linux.alibaba.com>
>   
>   内核驱动声明
>   ------------
> diff --git a/Documentation/translations/zh_CN/process/kernel-enforcement-statement.rst b/Documentation/translations/zh_CN/process/kernel-enforcement-statement.rst
> index 75f7b7b9137c..c1d995dfd0f7 100644
> --- a/Documentation/translations/zh_CN/process/kernel-enforcement-statement.rst
> +++ b/Documentation/translations/zh_CN/process/kernel-enforcement-statement.rst
> @@ -1,9 +1,6 @@
> -﻿.. _cn_process_statement_kernel:
> -
> -.. include:: ../disclaimer-zh_CN.rst
> +﻿.. include:: ../disclaimer-zh_CN.rst
>   
>   :Original: :ref:`Documentation/process/kernel-enforcement-statement.rst <process_statement_kernel>`
> -:Translator: Alex Shi <alex.shi@linux.alibaba.com>
>   
>   Linux 内核执行声明
>   ------------------
> diff --git a/Documentation/translations/zh_CN/process/license-rules.rst b/Documentation/translations/zh_CN/process/license-rules.rst
> index 30c272b2a292..ccf3fe79a56e 100644
> --- a/Documentation/translations/zh_CN/process/license-rules.rst
> +++ b/Documentation/translations/zh_CN/process/license-rules.rst
> @@ -3,7 +3,6 @@
>   .. include:: ../disclaimer-zh_CN.rst
>   
>   :Original: :ref:`Documentation/process/license-rules.rst <kernel_licensing>`
> -:Translator: Alex Shi <alex.shi@linux.alibaba.com>
>   
>   .. _cn_kernel_licensing:
>   
> diff --git a/Documentation/translations/zh_CN/process/magic-number.rst b/Documentation/translations/zh_CN/process/magic-number.rst
> index 05ee75cf4346..223780eecffe 100644
> --- a/Documentation/translations/zh_CN/process/magic-number.rst
> +++ b/Documentation/translations/zh_CN/process/magic-number.rst
> @@ -2,14 +2,6 @@
>   
>   :Original: Documentation/staging/magic-number.rst
>   
> -:翻译:
> -
> - 贾威威 Jia Wei Wei <harryxiyou@gmail.com>
> -
> -:校译:
> -
> - 司延腾 Yanteng Si <siyanteng@loongson.cn>
> -
>   Linux 魔术数
>   ============
>   
> diff --git a/Documentation/translations/zh_CN/process/maintainer-pgp-guide.rst b/Documentation/translations/zh_CN/process/maintainer-pgp-guide.rst
> index eb12694a4c59..53cd1fca33ce 100644
> --- a/Documentation/translations/zh_CN/process/maintainer-pgp-guide.rst
> +++ b/Documentation/translations/zh_CN/process/maintainer-pgp-guide.rst
> @@ -3,13 +3,6 @@
>   
>   :Original: Documentation/process/maintainer-pgp-guide.rst
>   
> -:翻译:
> -
> - 司延腾 Yanteng Si <siyanteng@loongson.cn>
> -
> -:校译:
> -
> -
>   ===================
>   内核维护者 PGP 指南
>   ===================
> diff --git a/Documentation/translations/zh_CN/process/management-style.rst b/Documentation/translations/zh_CN/process/management-style.rst
> index 8053ae474328..d525d63ce102 100644
> --- a/Documentation/translations/zh_CN/process/management-style.rst
> +++ b/Documentation/translations/zh_CN/process/management-style.rst
> @@ -1,7 +1,6 @@
>   .. include:: ../disclaimer-zh_CN.rst
>   
>   :Original: :ref:`Documentation/process/management-style.rst <managementstyle>`
> -:Translator: Alex Shi <alex.shi@linux.alibaba.com>
>   
>   .. _cn_managementstyle:
>   
> diff --git a/Documentation/translations/zh_CN/process/programming-language.rst b/Documentation/translations/zh_CN/process/programming-language.rst
> index 95aa4829d78f..88ae2ec5f0e5 100644
> --- a/Documentation/translations/zh_CN/process/programming-language.rst
> +++ b/Documentation/translations/zh_CN/process/programming-language.rst
> @@ -1,7 +1,6 @@
>   .. include:: ../disclaimer-zh_CN.rst
>   
>   :Original: :ref:`Documentation/process/programming-language.rst <programming_language>`
> -:Translator: Alex Shi <alex.shi@linux.alibaba.com>
>   
>   程序设计语言
>   ============
> diff --git a/Documentation/translations/zh_CN/process/researcher-guidelines.rst b/Documentation/translations/zh_CN/process/researcher-guidelines.rst
> index 1f2da68fc4e8..8452b4e56dd5 100644
> --- a/Documentation/translations/zh_CN/process/researcher-guidelines.rst
> +++ b/Documentation/translations/zh_CN/process/researcher-guidelines.rst
> @@ -2,13 +2,8 @@
>   
>   .. include:: ../disclaimer-zh_CN.rst
>   
> -.. _cn_researcherguidelines:
> -
>   :Original: Documentation/process/researcher-guidelines.rst
>   
> -:译者:
> - - 慕冬亮 Dongliang Mu <dzm91@hust.edu.cn>
> -
>   研究人员指南
>   +++++++++++++++++++++
>   
> diff --git a/Documentation/translations/zh_CN/process/security-bugs.rst b/Documentation/translations/zh_CN/process/security-bugs.rst
> index a8f5fcbfadc9..eeebcac5fc16 100644
> --- a/Documentation/translations/zh_CN/process/security-bugs.rst
> +++ b/Documentation/translations/zh_CN/process/security-bugs.rst
> @@ -4,11 +4,6 @@
>   
>   :Original: :doc:`../../../process/security-bugs`
>   
> -:译者:
> -
> - 吴想成 Wu XiangCheng <bobwxc@email.cn>
> - 慕冬亮 Dongliang Mu <dzm91@hust.edu.cn>
> -
>   安全缺陷
>   =========
>   
> diff --git a/Documentation/translations/zh_CN/process/stable-api-nonsense.rst b/Documentation/translations/zh_CN/process/stable-api-nonsense.rst
> index b4ddb6e88d9d..d1cf1006d6ca 100644
> --- a/Documentation/translations/zh_CN/process/stable-api-nonsense.rst
> +++ b/Documentation/translations/zh_CN/process/stable-api-nonsense.rst
> @@ -5,12 +5,6 @@
>   :Original: :ref:`Documentation/process/stable-api-nonsense.rst
>              <stable_api_nonsense>`
>   
> -译者::
> -
> -        中文版维护者： 钟宇  TripleX Chung <xxx.phy@gmail.com>
> -        中文版翻译者： 钟宇  TripleX Chung <xxx.phy@gmail.com>
> -        中文版校译者： 李阳  Li Yang <leoyang.li@nxp.com>
> -
>   Linux 内核驱动接口
>   ==================
>   
> diff --git a/Documentation/translations/zh_CN/process/stable-kernel-rules.rst b/Documentation/translations/zh_CN/process/stable-kernel-rules.rst
> index fba361f2ddfd..5d31e1ea598b 100644
> --- a/Documentation/translations/zh_CN/process/stable-kernel-rules.rst
> +++ b/Documentation/translations/zh_CN/process/stable-kernel-rules.rst
> @@ -1,19 +1,7 @@
> -.. _cn_stable_kernel_rules:
> -
>   .. include:: ../disclaimer-zh_CN.rst
>   
>   :Original: :ref:`Documentation/process/stable-kernel-rules.rst <stable_kernel_rules>`
>   
> -如果想评论或更新本文的内容，请直接联系原文档的维护者。如果你使用英文
> -交流有困难的话，也可以向中文版维护者求助。如果本翻译更新不及时或者翻
> -译存在问题，请联系中文版维护者::
> -
> -        中文版维护者： 钟宇  TripleX Chung <xxx.phy@gmail.com>
> -        中文版翻译者： 钟宇  TripleX Chung <xxx.phy@gmail.com>
> -        中文版校译者：
> -            - 李阳  Li Yang <leoyang.li@nxp.com>
> -            - Kangkai Yin <e12051@motorola.com>
> -
>   所有你想知道的事情 - 关于linux稳定版发布
>   ========================================
>   
> diff --git a/Documentation/translations/zh_CN/process/submit-checklist.rst b/Documentation/translations/zh_CN/process/submit-checklist.rst
> index 18411b426122..6fdb3c0fe6cc 100644
> --- a/Documentation/translations/zh_CN/process/submit-checklist.rst
> +++ b/Documentation/translations/zh_CN/process/submit-checklist.rst
> @@ -1,9 +1,6 @@
>   .. include:: ../disclaimer-zh_CN.rst
>   
>   :Original: Documentation/process/submit-checklist.rst
> -:Translator:
> - - Alex Shi <alexs@kernel.org>
> - - Wu XiangCheng <bobwxc@email.cn>
>   
>   .. _cn_submitchecklist:
>   
> diff --git a/Documentation/translations/zh_CN/process/submitting-patches.rst b/Documentation/translations/zh_CN/process/submitting-patches.rst
> index f7ae584a439e..4010322aa444 100644
> --- a/Documentation/translations/zh_CN/process/submitting-patches.rst
> +++ b/Documentation/translations/zh_CN/process/submitting-patches.rst
> @@ -6,16 +6,6 @@
>   
>   :Original: Documentation/process/submitting-patches.rst
>   
> -:译者:
> - - 钟宇 TripleX Chung <xxx.phy@gmail.com>
> - - 时奎亮 Alex Shi <alexs@kernel.org>
> - - 吴想成 Wu XiangCheng <bobwxc@email.cn>
> -
> -:校译:
> - - 李阳 Li Yang <leoyang.li@nxp.com>
> - - 王聪 Wang Cong <xiyou.wangcong@gmail.com>
> -
> -
>   提交补丁：如何让你的改动进入内核
>   ================================
>   
> diff --git a/Documentation/translations/zh_CN/process/volatile-considered-harmful.rst b/Documentation/translations/zh_CN/process/volatile-considered-harmful.rst
> index ded3b5d0c9a8..ba179a282bac 100644
> --- a/Documentation/translations/zh_CN/process/volatile-considered-harmful.rst
> +++ b/Documentation/translations/zh_CN/process/volatile-considered-harmful.rst
> @@ -1,21 +1,8 @@
> -.. _cn_volatile_considered_harmful:
> -
>   .. include:: ../disclaimer-zh_CN.rst
>   
>   :Original: :ref:`Documentation/process/volatile-considered-harmful.rst
>              <volatile_considered_harmful>`
>   
> -如果想评论或更新本文的内容，请直接联系原文档的维护者。如果你使用英文
> -交流有困难的话，也可以向中文版维护者求助。如果本翻译更新不及时或者翻
> -译存在问题，请联系中文版维护者::
> -
> -        英文版维护者： Jonathan Corbet <corbet@lwn.net>
> -        中文版维护者： 伍鹏  Bryan Wu <bryan.wu@analog.com>
> -        中文版翻译者： 伍鹏  Bryan Wu <bryan.wu@analog.com>
> -        中文版校译者： 张汉辉  Eugene Teo <eugeneteo@kernel.sg>
> -                       杨瑞  Dave Young <hidave.darkstar@gmail.com>
> -                       时奎亮 Alex Shi <alex.shi@linux.alibaba.com>
> -
>   为什么不应该使用“volatile”类型
>   ==============================
>   
> diff --git a/Documentation/translations/zh_CN/rust/arch-support.rst b/Documentation/translations/zh_CN/rust/arch-support.rst
> index 0ca4be6e1763..de887d8b034b 100644
> --- a/Documentation/translations/zh_CN/rust/arch-support.rst
> +++ b/Documentation/translations/zh_CN/rust/arch-support.rst
> @@ -3,10 +3,6 @@
>   
>   :Original: Documentation/rust/arch-support.rst
>   
> -:翻译:
> -
> - 司延腾 Yanteng Si <siyanteng@loongson.cn>
> -
>   架构支持
>   ========
>   
> diff --git a/Documentation/translations/zh_CN/rust/coding-guidelines.rst b/Documentation/translations/zh_CN/rust/coding-guidelines.rst
> index 54b902322dbc..faf4bc8e8ea3 100644
> --- a/Documentation/translations/zh_CN/rust/coding-guidelines.rst
> +++ b/Documentation/translations/zh_CN/rust/coding-guidelines.rst
> @@ -3,10 +3,6 @@
>   
>   :Original: Documentation/rust/coding-guidelines.rst
>   
> -:翻译:
> -
> - 司延腾 Yanteng Si <siyanteng@loongson.cn>
> -
>   编码指南
>   ========
>   
> diff --git a/Documentation/translations/zh_CN/rust/general-information.rst b/Documentation/translations/zh_CN/rust/general-information.rst
> index a8c1a226ed4f..e25e201baa38 100644
> --- a/Documentation/translations/zh_CN/rust/general-information.rst
> +++ b/Documentation/translations/zh_CN/rust/general-information.rst
> @@ -3,11 +3,6 @@
>   
>   :Original: Documentation/rust/general-information.rst
>   
> -:翻译:
> -
> - 司延腾 Yanteng Si <siyanteng@loongson.cn>
> -
> -
>   基本信息
>   ========
>   
> diff --git a/Documentation/translations/zh_CN/rust/index.rst b/Documentation/translations/zh_CN/rust/index.rst
> index 138e057bee44..935f305f5d48 100644
> --- a/Documentation/translations/zh_CN/rust/index.rst
> +++ b/Documentation/translations/zh_CN/rust/index.rst
> @@ -3,10 +3,6 @@
>   
>   :Original: Documentation/rust/index.rst
>   
> -:翻译:
> -
> - 司延腾 Yanteng Si <siyanteng@loongson.cn>
> -
>   Rust
>   ====
>   
> diff --git a/Documentation/translations/zh_CN/rust/quick-start.rst b/Documentation/translations/zh_CN/rust/quick-start.rst
> index 0396137f3c19..a76ba751e7a6 100644
> --- a/Documentation/translations/zh_CN/rust/quick-start.rst
> +++ b/Documentation/translations/zh_CN/rust/quick-start.rst
> @@ -3,11 +3,6 @@
>   
>   :Original: Documentation/rust/quick-start.rst
>   
> -:翻译:
> -
> - 司延腾 Yanteng Si <siyanteng@loongson.cn>
> -
> -
>   快速入门
>   ========
>   
> diff --git a/Documentation/translations/zh_CN/rust/testing.rst b/Documentation/translations/zh_CN/rust/testing.rst
> index 6747d0012991..96eb976606a3 100644
> --- a/Documentation/translations/zh_CN/rust/testing.rst
> +++ b/Documentation/translations/zh_CN/rust/testing.rst
> @@ -3,10 +3,6 @@
>   
>   :Original: Documentation/rust/testing.rst
>   
> -:翻译:
> -
> - 郭杰 Ben Guo <benx.guo@gmail.com>
> -
>   测试
>   ====
>   
> diff --git a/Documentation/translations/zh_CN/scheduler/completion.rst b/Documentation/translations/zh_CN/scheduler/completion.rst
> index bc8218514e0a..43a8efece5fb 100644
> --- a/Documentation/translations/zh_CN/scheduler/completion.rst
> +++ b/Documentation/translations/zh_CN/scheduler/completion.rst
> @@ -2,14 +2,6 @@
>   
>   :Original: Documentation/scheduler/completion.rst
>   
> -:翻译:
> -
> - 司延腾 Yanteng Si <siyanteng@loongson.cn>
> -
> -:校译:
> -
> - 唐艺舟 Tang Yizhou <tangyeechou@gmail.com>
> -
>   =======================================
>   完成 - "等待完成" 屏障应用程序接口(API)
>   =======================================
> diff --git a/Documentation/translations/zh_CN/scheduler/index.rst b/Documentation/translations/zh_CN/scheduler/index.rst
> index a8eaa7325f54..8abcbbfddf55 100644
> --- a/Documentation/translations/zh_CN/scheduler/index.rst
> +++ b/Documentation/translations/zh_CN/scheduler/index.rst
> @@ -2,15 +2,6 @@
>   
>   :Original: Documentation/scheduler/index.rst
>   
> -:翻译:
> -
> - 司延腾 Yanteng Si <siyanteng@loongson.cn>
> - 唐艺舟 Tang Yizhou <tangyeechou@gmail.com>
> -
> -:校译:
> -
> -
> -
>   ===============
>   Linux调度器
>   ===============
> diff --git a/Documentation/translations/zh_CN/scheduler/sched-arch.rst b/Documentation/translations/zh_CN/scheduler/sched-arch.rst
> index b2ac3c743a3a..81fb03974a4c 100644
> --- a/Documentation/translations/zh_CN/scheduler/sched-arch.rst
> +++ b/Documentation/translations/zh_CN/scheduler/sched-arch.rst
> @@ -2,14 +2,6 @@
>   
>   :Original: Documentation/scheduler/sched-arch.rst
>   
> -:翻���:
> -
> - 司延腾 Yanteng Si <siyanteng@loongson.cn>
> -
> -:校译:
> -
> -
> -
>   ===============================
>   架构特定代码的CPU调度器实现提示
>   ===============================
> diff --git a/Documentation/translations/zh_CN/scheduler/sched-bwc.rst b/Documentation/translations/zh_CN/scheduler/sched-bwc.rst
> index 90e931f4ceed..082bda0f06d7 100644
> --- a/Documentation/translations/zh_CN/scheduler/sched-bwc.rst
> +++ b/Documentation/translations/zh_CN/scheduler/sched-bwc.rst
> @@ -2,14 +2,6 @@
>   
>   :Original: Documentation/scheduler/sched-bwc.rst
>   
> -:翻译:
> -
> - 司延腾 Yanteng Si <siyanteng@loongson.cn>
> -
> -:校译:
> -
> -
> -
>   ============
>   CFS 带宽控制
>   ============
> diff --git a/Documentation/translations/zh_CN/scheduler/sched-capacity.rst b/Documentation/translations/zh_CN/scheduler/sched-capacity.rst
> index 8cba135dcd1a..e4632f8382d8 100644
> --- a/Documentation/translations/zh_CN/scheduler/sched-capacity.rst
> +++ b/Documentation/translations/zh_CN/scheduler/sched-capacity.rst
> @@ -3,14 +3,6 @@
>   
>   :Original: Documentation/scheduler/sched-capacity.rst
>   
> -:翻译:
> -
> -  唐艺舟 Tang Yizhou <tangyeechou@gmail.com>
> -
> -:校译:
> -
> -  时奎亮 Alex Shi <alexs@kernel.org>
> -
>   =============
>   算力感知调度
>   =============
> diff --git a/Documentation/translations/zh_CN/scheduler/sched-debug.rst b/Documentation/translations/zh_CN/scheduler/sched-debug.rst
> index 5e17740c2bf3..a021dfc16186 100644
> --- a/Documentation/translations/zh_CN/scheduler/sched-debug.rst
> +++ b/Documentation/translations/zh_CN/scheduler/sched-debug.rst
> @@ -3,10 +3,6 @@
>   
>   :Original: Documentation/scheduler/sched-debug.rst
>   
> -:翻译:
> -
> -  唐艺舟 Tang Yizhou <tangyeechou@gmail.com>
> -
>   =============
>   调度器debugfs
>   =============
> diff --git a/Documentation/translations/zh_CN/scheduler/sched-design-CFS.rst b/Documentation/translations/zh_CN/scheduler/sched-design-CFS.rst
> index 03691e0309af..d99078cc134b 100644
> --- a/Documentation/translations/zh_CN/scheduler/sched-design-CFS.rst
> +++ b/Documentation/translations/zh_CN/scheduler/sched-design-CFS.rst
> @@ -3,10 +3,6 @@
>   
>   :Original: Documentation/scheduler/sched-design-CFS.rst
>   
> -:翻译:
> -
> -  唐艺舟 Tang Yizhou <tangyeechou@gmail.com>
> -
>   ===============
>   完全公平调度器
>   ===============
> diff --git a/Documentation/translations/zh_CN/scheduler/sched-domains.rst b/Documentation/translations/zh_CN/scheduler/sched-domains.rst
> index 06363169c56b..cbfda2a380d3 100644
> --- a/Documentation/translations/zh_CN/scheduler/sched-domains.rst
> +++ b/Documentation/translations/zh_CN/scheduler/sched-domains.rst
> @@ -3,14 +3,6 @@
>   
>   :Original: Documentation/scheduler/sched-domains.rst
>   
> -:翻译:
> -
> -  唐艺舟 Tang Yizhou <tangyeechou@gmail.com>
> -
> -:校译:
> -
> -  司延腾 Yanteng Si <siyanteng@loongson.cn>
> -
>   ======
>   调度域
>   ======
> diff --git a/Documentation/translations/zh_CN/scheduler/sched-energy.rst b/Documentation/translations/zh_CN/scheduler/sched-energy.rst
> index 03dedc69839a..cc74f722e74b 100644
> --- a/Documentation/translations/zh_CN/scheduler/sched-energy.rst
> +++ b/Documentation/translations/zh_CN/scheduler/sched-energy.rst
> @@ -3,10 +3,6 @@
>   
>   :Original: Documentation/scheduler/sched-energy.rst
>   
> -:翻译:
> -
> -  唐艺舟 Tang Yizhou <tangyeechou@gmail.com>
> -
>   ============
>   能量感知调度
>   ============
> diff --git a/Documentation/translations/zh_CN/scheduler/sched-nice-design.rst b/Documentation/translations/zh_CN/scheduler/sched-nice-design.rst
> index 9107f0c0b979..c0de89c6d5db 100644
> --- a/Documentation/translations/zh_CN/scheduler/sched-nice-design.rst
> +++ b/Documentation/translations/zh_CN/scheduler/sched-nice-design.rst
> @@ -3,10 +3,6 @@
>   
>   :Original: Documentation/scheduler/sched-nice-design.rst
>   
> -:翻译:
> -
> -  唐艺舟 Tang Yizhou <tangyeechou@gmail.com>
> -
>   =====================
>   调度器nice值设计
>   =====================
> diff --git a/Documentation/translations/zh_CN/scheduler/sched-stats.rst b/Documentation/translations/zh_CN/scheduler/sched-stats.rst
> index 09eee2517610..1b67a2005539 100644
> --- a/Documentation/translations/zh_CN/scheduler/sched-stats.rst
> +++ b/Documentation/translations/zh_CN/scheduler/sched-stats.rst
> @@ -3,10 +3,6 @@
>   
>   :Original: Documentation/scheduler/sched-stats.rst
>   
> -:翻译:
> -
> -  唐艺舟 Tang Yizhou <tangyeechou@gmail.com>
> -
>   ==============
>   调度器统计数据
>   ==============
> diff --git a/Documentation/translations/zh_CN/scheduler/schedutil.rst b/Documentation/translations/zh_CN/scheduler/schedutil.rst
> index 7c8d87f21c42..ae22ebaca3a0 100644
> --- a/Documentation/translations/zh_CN/scheduler/schedutil.rst
> +++ b/Documentation/translations/zh_CN/scheduler/schedutil.rst
> @@ -3,10 +3,6 @@
>   
>   :Original: Documentation/scheduler/schedutil.rst
>   
> -:翻译:
> -
> -  唐艺舟 Tang Yizhou <tangyeechou@gmail.com>
> -
>   =========
>   Schedutil
>   =========
> diff --git a/Documentation/translations/zh_CN/scsi/index.rst b/Documentation/translations/zh_CN/scsi/index.rst
> index 5f1803e2706c..cfbee658f396 100644
> --- a/Documentation/translations/zh_CN/scsi/index.rst
> +++ b/Documentation/translations/zh_CN/scsi/index.rst
> @@ -3,14 +3,6 @@
>   
>   :Original: Documentation/scsi/index.rst
>   
> -:翻译:
> -
> - 郝栋栋 doubled <doubled@leap-io-kernel.com>
> -
> -:校译:
> -
> -
> -
>   ==========
>   SCSI子系统
>   ==========
> diff --git a/Documentation/translations/zh_CN/scsi/libsas.rst b/Documentation/translations/zh_CN/scsi/libsas.rst
> index 15fa71cdd821..b84514392185 100644
> --- a/Documentation/translations/zh_CN/scsi/libsas.rst
> +++ b/Documentation/translations/zh_CN/scsi/libsas.rst
> @@ -3,12 +3,6 @@
>   
>   :Original: Documentation/scsi/libsas.rst
>   
> -:翻译:
> -
> - 张钰杰 Yujie Zhang <yjzhang@leap-io-kernel.com>
> -
> -:校译:
> -
>   ======
>   SAS 层
>   ======
> diff --git a/Documentation/translations/zh_CN/scsi/link_power_management_policy.rst b/Documentation/translations/zh_CN/scsi/link_power_management_policy.rst
> index f2ab8fdf4aa8..1b1006cf7076 100644
> --- a/Documentation/translations/zh_CN/scsi/link_power_management_policy.rst
> +++ b/Documentation/translations/zh_CN/scsi/link_power_management_policy.rst
> @@ -3,14 +3,6 @@
>   
>   :Original: Documentation/scsi/link_power_management_policy.rst
>   
> -:翻译:
> -
> - 郝栋栋 doubled <doubled@leap-io-kernel.com>
> -
> -:校译:
> -
> -
> -
>   ================
>   链路电源管理策略
>   ================
> diff --git a/Documentation/translations/zh_CN/scsi/scsi-parameters.rst b/Documentation/translations/zh_CN/scsi/scsi-parameters.rst
> index ace777e070ea..9fec839f9fb9 100644
> --- a/Documentation/translations/zh_CN/scsi/scsi-parameters.rst
> +++ b/Documentation/translations/zh_CN/scsi/scsi-parameters.rst
> @@ -3,14 +3,6 @@
>   
>   :Original: Documentation/scsi/scsi-parameters.rst
>   
> -:翻译:
> -
> - 郝栋栋 doubled <doubled@leap-io-kernel.com>
> -
> -:校译:
> -
> -
> -
>   ============
>   SCSI内核参数
>   ============
> diff --git a/Documentation/translations/zh_CN/scsi/scsi.rst b/Documentation/translations/zh_CN/scsi/scsi.rst
> index 5d6e39c7cbb5..eaa45a7d22f6 100644
> --- a/Documentation/translations/zh_CN/scsi/scsi.rst
> +++ b/Documentation/translations/zh_CN/scsi/scsi.rst
> @@ -3,14 +3,6 @@
>   
>   :Original: Documentation/scsi/scsi.rst
>   
> -:翻译:
> -
> - 郝栋栋 doubled <doubled@leap-io-kernel.com>
> -
> -:校译:
> -
> -
> -
>   ==============
>   SCSI子系统文档
>   ==============
> diff --git a/Documentation/translations/zh_CN/scsi/scsi_eh.rst b/Documentation/translations/zh_CN/scsi/scsi_eh.rst
> index 26e0f30f0949..09751ca8cb40 100644
> --- a/Documentation/translations/zh_CN/scsi/scsi_eh.rst
> +++ b/Documentation/translations/zh_CN/scsi/scsi_eh.rst
> @@ -3,13 +3,6 @@
>   
>   :Original: Documentation/scsi/scsi_eh.rst
>   
> -:翻译:
> -
> - 郝栋栋 doubled <doubled@leap-io-kernel.com>
> -
> -:校译:
> -
> -
>   ===================
>   SCSI 中间层错误处理
>   ===================
> diff --git a/Documentation/translations/zh_CN/scsi/scsi_mid_low_api.rst b/Documentation/translations/zh_CN/scsi/scsi_mid_low_api.rst
> index f701945a1b1c..77998cdbb1aa 100644
> --- a/Documentation/translations/zh_CN/scsi/scsi_mid_low_api.rst
> +++ b/Documentation/translations/zh_CN/scsi/scsi_mid_low_api.rst
> @@ -3,14 +3,6 @@
>   
>   :Original: Documentation/scsi/scsi_mid_low_api.rst
>   
> -:翻译:
> -
> - 郝栋栋 doubled <doubled@leap-io-kernel.com>
> -
> -:校译:
> -
> -
> -
>   =========================
>   SCSI中间层 — 底层驱动接口
>   =========================
> diff --git a/Documentation/translations/zh_CN/scsi/sd-parameters.rst b/Documentation/translations/zh_CN/scsi/sd-parameters.rst
> index b3d0445dc9f3..6096b64ef08f 100644
> --- a/Documentation/translations/zh_CN/scsi/sd-parameters.rst
> +++ b/Documentation/translations/zh_CN/scsi/sd-parameters.rst
> @@ -3,14 +3,6 @@
>   
>   :Original: Documentation/scsi/sd-parameters.rst
>   
> -:翻译:
> -
> - 郝栋栋 doubled <doubled@leap-io-kernel.com>
> -
> -:校译:
> -
> -
> -
>   ============================
>   Linux SCSI磁盘驱动（sd）参数
>   ============================
> diff --git a/Documentation/translations/zh_CN/scsi/wd719x.rst b/Documentation/translations/zh_CN/scsi/wd719x.rst
> index 79757c42032b..c0e4573adc13 100644
> --- a/Documentation/translations/zh_CN/scsi/wd719x.rst
> +++ b/Documentation/translations/zh_CN/scsi/wd719x.rst
> @@ -3,12 +3,6 @@
>   
>   :Original: Documentation/scsi/libsas.rst
>   
> -:翻译:
> -
> - 张钰杰 Yujie Zhang <yjzhang@leap-io-kernel.com>
> -
> -:校译:
> -
>   ====================================================
>   Western Digital WD7193, WD7197 和 WD7296 SCSI 卡驱动
>   ====================================================
> diff --git a/Documentation/translations/zh_CN/security/IMA-templates.rst b/Documentation/translations/zh_CN/security/IMA-templates.rst
> index b391c9d03882..9e758178ec7b 100644
> --- a/Documentation/translations/zh_CN/security/IMA-templates.rst
> +++ b/Documentation/translations/zh_CN/security/IMA-templates.rst
> @@ -3,9 +3,6 @@
>   
>   :Original: Documentation/security/IMA-templates.rst
>   
> -:翻译:
> - 赵硕 Shuo Zhao <zhaoshuo@cqsoftware.com.cn>
> -
>   ===============
>   IMA模板管理机制
>   ===============
> diff --git a/Documentation/translations/zh_CN/security/SCTP.rst b/Documentation/translations/zh_CN/security/SCTP.rst
> index f2774b0d66b5..c562d9243bee 100644
> --- a/Documentation/translations/zh_CN/security/SCTP.rst
> +++ b/Documentation/translations/zh_CN/security/SCTP.rst
> @@ -3,9 +3,6 @@
>   
>   :Original: Documentation/security/SCTP.rst
>   
> -:翻译:
> - 赵硕 Shuo Zhao <zhaoshuo@cqsoftware.com.cn>
> -
>   ====
>   SCTP
>   ====
> diff --git a/Documentation/translations/zh_CN/security/credentials.rst b/Documentation/translations/zh_CN/security/credentials.rst
> index 20c8696f8198..a05c67e242f0 100644
> --- a/Documentation/translations/zh_CN/security/credentials.rst
> +++ b/Documentation/translations/zh_CN/security/credentials.rst
> @@ -3,9 +3,6 @@
>   
>   :Original: Documentation/security/credentials.rst
>   
> -:翻译:
> - 赵硕 Shuo Zhao <zhaoshuo@cqsoftware.com.cn>
> -
>   =============
>   Linux中的凭据
>   =============
> diff --git a/Documentation/translations/zh_CN/security/digsig.rst b/Documentation/translations/zh_CN/security/digsig.rst
> index 3e690b504ec5..8f71c45d8866 100644
> --- a/Documentation/translations/zh_CN/security/digsig.rst
> +++ b/Documentation/translations/zh_CN/security/digsig.rst
> @@ -3,9 +3,6 @@
>   
>   :Original: Documentation/security/digsig.rst
>   
> -:翻译:
> - 赵硕 Shuo Zhao <zhaoshuo@cqsoftware.com.cn>
> -
>   ===============
>   数字签名验证API
>   ===============
> diff --git a/Documentation/translations/zh_CN/security/index.rst b/Documentation/translations/zh_CN/security/index.rst
> index d33b107405c7..f7bc36c42d87 100644
> --- a/Documentation/translations/zh_CN/security/index.rst
> +++ b/Documentation/translations/zh_CN/security/index.rst
> @@ -4,10 +4,6 @@
>   
>   :Original: Documentation/security/index.rst
>   
> -:翻译:
> -
> - 赵岳辉 Yuehui Zhao <zhaoyuehui@cqsoftware.com.cn>
> -
>   ========
>   安全文档
>   ========
> diff --git a/Documentation/translations/zh_CN/security/ipe.rst b/Documentation/translations/zh_CN/security/ipe.rst
> index 55968f0c7ae3..19ce6972b71b 100644
> --- a/Documentation/translations/zh_CN/security/ipe.rst
> +++ b/Documentation/translations/zh_CN/security/ipe.rst
> @@ -3,9 +3,6 @@
>   
>   :Original: Documentation/security/sak.rst
>   
> -:翻译:
> - 赵硕 Shuo Zhao <zhaoshuo@cqsoftware.com.cn>
> -
>   完整性策略执行（IPE）-内核文档
>   ==============================
>   
> diff --git a/Documentation/translations/zh_CN/security/keys/index.rst b/Documentation/translations/zh_CN/security/keys/index.rst
> index 7c28d003fb0a..617e39739b7c 100644
> --- a/Documentation/translations/zh_CN/security/keys/index.rst
> +++ b/Documentation/translations/zh_CN/security/keys/index.rst
> @@ -4,9 +4,6 @@
>   
>   :Original: Documentation/security/keys/index.rst
>   
> -:翻译:
> -
> -
>   ========
>   内核密钥
>   ========
> diff --git a/Documentation/translations/zh_CN/security/landlock.rst b/Documentation/translations/zh_CN/security/landlock.rst
> index 53b449b637b2..3d34e633188b 100644
> --- a/Documentation/translations/zh_CN/security/landlock.rst
> +++ b/Documentation/translations/zh_CN/security/landlock.rst
> @@ -5,10 +5,6 @@
>   
>   :Original: Documentation/security/landlock.rst
>   
> -:翻译:
> -
> - 毛玉贤 Yuxian Mao <maoyuxian@cqsoftware.com.cn>
> -
>   ======================
>   Landlock LSM: 内核文档
>   ======================
> diff --git a/Documentation/translations/zh_CN/security/lsm-development.rst b/Documentation/translations/zh_CN/security/lsm-development.rst
> index 7ed3719a9d07..a030a0adfa8c 100644
> --- a/Documentation/translations/zh_CN/security/lsm-development.rst
> +++ b/Documentation/translations/zh_CN/security/lsm-development.rst
> @@ -3,9 +3,6 @@
>   
>   :Original: Documentation/security/lsm-development.rst
>   
> -:翻译:
> - 赵硕 Shuo Zhao <zhaoshuo@cqsoftware.com.cn>
> -
>   =================
>   Linux安全模块开发
>   =================
> diff --git a/Documentation/translations/zh_CN/security/lsm.rst b/Documentation/translations/zh_CN/security/lsm.rst
> index e0ec4c7831da..7dd1a30fbb37 100644
> --- a/Documentation/translations/zh_CN/security/lsm.rst
> +++ b/Documentation/translations/zh_CN/security/lsm.rst
> @@ -3,10 +3,6 @@
>   
>   :Original: Documentation/security/lsm.rst
>   
> -:翻译:
> -
> - 赵岳辉 Yuehui Zhao <zhaoyuehui@cqsoftware.com.cn>
> -
>   ================================
>   Linux安全模块：Linux通用安全钩子
>   ================================
> diff --git a/Documentation/translations/zh_CN/security/sak.rst b/Documentation/translations/zh_CN/security/sak.rst
> index 574fe076201b..651a9aa6caca 100644
> --- a/Documentation/translations/zh_CN/security/sak.rst
> +++ b/Documentation/translations/zh_CN/security/sak.rst
> @@ -3,10 +3,6 @@
>   
>   :Original: Documentation/security/sak.rst
>   
> -:翻译:
> -
> - 张巍 zhangwei <zhangwei@cqsoftware.com.cn>
> -
>   ===========================
>   Linux 安全注意键（SAK）处理
>   ===========================
> diff --git a/Documentation/translations/zh_CN/security/secrets/coco.rst b/Documentation/translations/zh_CN/security/secrets/coco.rst
> index a27bc1acdb7c..141e7a1ff307 100644
> --- a/Documentation/translations/zh_CN/security/secrets/coco.rst
> +++ b/Documentation/translations/zh_CN/security/secrets/coco.rst
> @@ -3,10 +3,6 @@
>   
>   :Original: Documentation/security/secrets/coco.rst
>   
> -:翻译:
> -
> - 赵硕 Shuo Zhao <zhaoshuo@cqsoftware.com.cn>
> -
>   ============
>   机密计算密钥
>   ============
> diff --git a/Documentation/translations/zh_CN/security/secrets/index.rst b/Documentation/translations/zh_CN/security/secrets/index.rst
> index 38464dcb2c3c..96eb00e1326f 100644
> --- a/Documentation/translations/zh_CN/security/secrets/index.rst
> +++ b/Documentation/translations/zh_CN/security/secrets/index.rst
> @@ -3,8 +3,6 @@
>   
>   :Original: Documentation/security/secrets/index.rst
>   
> -:翻译:
> -
>   ========
>   密钥文档
>   ========
> diff --git a/Documentation/translations/zh_CN/security/self-protection.rst b/Documentation/translations/zh_CN/security/self-protection.rst
> index ad96bb4a4995..ebabc9dc2d2e 100644
> --- a/Documentation/translations/zh_CN/security/self-protection.rst
> +++ b/Documentation/translations/zh_CN/security/self-protection.rst
> @@ -2,10 +2,6 @@
>   .. include:: ../disclaimer-zh_CN.rst
>   :Original: Documentation/security/self-protection.rst
>   
> -:翻译:
> -
> - 张巍 zhangwei <zhangwei@cqsoftware.com.cn>
> -
>   ============
>   内核自我保护
>   ============
> diff --git a/Documentation/translations/zh_CN/security/siphash.rst b/Documentation/translations/zh_CN/security/siphash.rst
> index 26dd8be699b3..787f1d2168c4 100644
> --- a/Documentation/translations/zh_CN/security/siphash.rst
> +++ b/Documentation/translations/zh_CN/security/siphash.rst
> @@ -2,10 +2,6 @@
>   .. include:: ../disclaimer-zh_CN.rst
>   :Original: Documentation/security/siphash.rst
>   
> -:翻译:
> -
> - 张巍 zhangwei <zhangwei@cqsoftware.com.cn>
> -
>   =====================================
>   SipHash - 一种短输入伪随机函数（PRF）
>   =====================================
> diff --git a/Documentation/translations/zh_CN/security/snp-tdx-threat-model.rst b/Documentation/translations/zh_CN/security/snp-tdx-threat-model.rst
> index b51eeaebab67..44b387ffc37f 100644
> --- a/Documentation/translations/zh_CN/security/snp-tdx-threat-model.rst
> +++ b/Documentation/translations/zh_CN/security/snp-tdx-threat-model.rst
> @@ -3,10 +3,6 @@
>   
>   :Original: Documentation/security/snp-tdx-threat-model.rst
>   
> -:翻译:
> -
> - 毛玉贤 Yuxian Mao <maoyuxian@cqsoftware.com.cn>
> -
>   ==========================
>   Linux中x86虚拟化的机密计算
>   ==========================
> diff --git a/Documentation/translations/zh_CN/security/tpm/index.rst b/Documentation/translations/zh_CN/security/tpm/index.rst
> index 707646590647..978ee492521c 100644
> --- a/Documentation/translations/zh_CN/security/tpm/index.rst
> +++ b/Documentation/translations/zh_CN/security/tpm/index.rst
> @@ -3,9 +3,6 @@
>   
>   :Original: Documentation/security/tpm/index.rst
>   
> -:翻译:
> - 赵硕 Shuo Zhao <zhaoshuo@cqsoftware.com.cn>
> -
>   ================
>   可信平台模块文档
>   ================
> diff --git a/Documentation/translations/zh_CN/security/tpm/tpm-security.rst b/Documentation/translations/zh_CN/security/tpm/tpm-security.rst
> index 26818d28c98f..47195ee0b7e6 100644
> --- a/Documentation/translations/zh_CN/security/tpm/tpm-security.rst
> +++ b/Documentation/translations/zh_CN/security/tpm/tpm-security.rst
> @@ -3,9 +3,6 @@
>   
>   :Original: Documentation/security/tpm/tpm-security.rst
>   
> -:翻译:
> - 赵硕 Shuo Zhao <zhaoshuo@cqsoftware.com.cn>
> -
>   TPM安全
>   =======
>   
> diff --git a/Documentation/translations/zh_CN/security/tpm/tpm_event_log.rst b/Documentation/translations/zh_CN/security/tpm/tpm_event_log.rst
> index 9c173291ac3e..9904c35191c6 100644
> --- a/Documentation/translations/zh_CN/security/tpm/tpm_event_log.rst
> +++ b/Documentation/translations/zh_CN/security/tpm/tpm_event_log.rst
> @@ -3,9 +3,6 @@
>   
>   :Original: Documentation/security/tpm/tpm_event_log.rst
>   
> -:翻译:
> - 赵硕 Shuo Zhao <zhaoshuo@cqsoftware.com.cn>
> -
>   ===========
>   TPM事件日志
>   ===========
> diff --git a/Documentation/translations/zh_CN/security/tpm/tpm_ftpm_tee.rst b/Documentation/translations/zh_CN/security/tpm/tpm_ftpm_tee.rst
> index 5901eee32563..6ea4002e1e91 100644
> --- a/Documentation/translations/zh_CN/security/tpm/tpm_ftpm_tee.rst
> +++ b/Documentation/translations/zh_CN/security/tpm/tpm_ftpm_tee.rst
> @@ -3,9 +3,6 @@
>   
>   :Original: Documentation/security/tpm/tpm_ftpm_tee.rst
>   
> -:翻译:
> - 赵硕 Shuo Zhao <zhaoshuo@cqsoftware.com.cn>
> -
>   ===========
>   固件TPM驱动
>   ===========
> diff --git a/Documentation/translations/zh_CN/security/tpm/tpm_tis.rst b/Documentation/translations/zh_CN/security/tpm/tpm_tis.rst
> index 0fb009f93e10..ac2ebadb2990 100644
> --- a/Documentation/translations/zh_CN/security/tpm/tpm_tis.rst
> +++ b/Documentation/translations/zh_CN/security/tpm/tpm_tis.rst
> @@ -3,9 +3,6 @@
>   
>   :Original: Documentation/security/tpm/tpm_tis.rst
>   
> -:翻译:
> - 赵硕 Shuo Zhao <zhaoshuo@cqsoftware.com.cn>
> -
>   TPM FIFO接口驱动
>   ================
>   
> diff --git a/Documentation/translations/zh_CN/security/tpm/tpm_vtpm_proxy.rst b/Documentation/translations/zh_CN/security/tpm/tpm_vtpm_proxy.rst
> index bc92cfb684c3..c543fa54c8f2 100644
> --- a/Documentation/translations/zh_CN/security/tpm/tpm_vtpm_proxy.rst
> +++ b/Documentation/translations/zh_CN/security/tpm/tpm_vtpm_proxy.rst
> @@ -3,9 +3,6 @@
>   
>   :Original: Documentation/security/tpm/tpm_vtpm_proxy.rst
>   
> -:翻译:
> - 赵硕 Shuo Zhao <zhaoshuo@cqsoftware.com.cn>
> -
>   ==========================
>   Linux容器的虚拟TPM代理驱动
>   ==========================
> diff --git a/Documentation/translations/zh_CN/security/tpm/xen-tpmfront.rst b/Documentation/translations/zh_CN/security/tpm/xen-tpmfront.rst
> index fa085d98a99b..310e11a6041c 100644
> --- a/Documentation/translations/zh_CN/security/tpm/xen-tpmfront.rst
> +++ b/Documentation/translations/zh_CN/security/tpm/xen-tpmfront.rst
> @@ -3,9 +3,6 @@
>   
>   :Original: Documentation/security/tpm/xen-tpmfront.rst
>   
> -:翻译:
> - 赵硕 Shuo Zhao <zhaoshuo@cqsoftware.com.cn>
> -
>   ================
>   Xen的虚拟TPM接口
>   ================
> diff --git a/Documentation/translations/zh_CN/sound/hd-audio/controls.rst b/Documentation/translations/zh_CN/sound/hd-audio/controls.rst
> index 54c028ab9a40..2d90c27a76ad 100644
> --- a/Documentation/translations/zh_CN/sound/hd-audio/controls.rst
> +++ b/Documentation/translations/zh_CN/sound/hd-audio/controls.rst
> @@ -1,7 +1,5 @@
>   .. SPDX-License-Identifier: GPL-2.0
>   
> -Chinese translator: Huang Jianghui <huangjianghui@uniontech.com>
> ----------------------------------------------------------------------
>   .. include:: ../../disclaimer-zh_CN.rst
>   以下为正文
>   ---------------------------------------------------------------------
> diff --git a/Documentation/translations/zh_CN/sound/hd-audio/index.rst b/Documentation/translations/zh_CN/sound/hd-audio/index.rst
> index d9885d53b069..d618ca392315 100644
> --- a/Documentation/translations/zh_CN/sound/hd-audio/index.rst
> +++ b/Documentation/translations/zh_CN/sound/hd-audio/index.rst
> @@ -2,8 +2,6 @@
>   .. include:: ../../disclaimer-zh_CN.rst
>   
>   :Original: :doc:`../../../../sound/hd-audio/index`
> -:Translator: Huang Jianghui <huangjianghui@uniontech.com>
> -
>   
>   高清音频
>   ========
> diff --git a/Documentation/translations/zh_CN/sound/index.rst b/Documentation/translations/zh_CN/sound/index.rst
> index 28d5dca34a63..e2150973ad18 100644
> --- a/Documentation/translations/zh_CN/sound/index.rst
> +++ b/Documentation/translations/zh_CN/sound/index.rst
> @@ -2,8 +2,6 @@
>   .. include:: ../disclaimer-zh_CN.rst
>   
>   :Original: :doc:`../../../sound/index`
> -:Translator: Huang Jianghui <huangjianghui@uniontech.com>
> -
>   
>   ====================
>   Linux 声音子系统文档
> diff --git a/Documentation/translations/zh_CN/staging/index.rst b/Documentation/translations/zh_CN/staging/index.rst
> index 6d68fabce175..c8395416dc85 100644
> --- a/Documentation/translations/zh_CN/staging/index.rst
> +++ b/Documentation/translations/zh_CN/staging/index.rst
> @@ -3,10 +3,6 @@
>   
>   :Original: Documentation/staging/index.rst
>   
> -:翻译:
> -
> - 李睿 Rui Li <me@lirui.org>
> -
>   未分类文档
>   ==========
>   
> diff --git a/Documentation/translations/zh_CN/staging/speculation.rst b/Documentation/translations/zh_CN/staging/speculation.rst
> index c36d33f67897..0e439edf6292 100644
> --- a/Documentation/translations/zh_CN/staging/speculation.rst
> +++ b/Documentation/translations/zh_CN/staging/speculation.rst
> @@ -3,10 +3,6 @@
>   
>   :Original: Documentation/staging/speculation.rst
>   
> -:翻译:
> -
> - 崔巍 Cui Wei <chris.wei.cui@gmail.com>
> -
>   ========
>   推测执行
>   ========
> diff --git a/Documentation/translations/zh_CN/staging/xz.rst b/Documentation/translations/zh_CN/staging/xz.rst
> index 211c487bcb62..dc31aa1cba28 100644
> --- a/Documentation/translations/zh_CN/staging/xz.rst
> +++ b/Documentation/translations/zh_CN/staging/xz.rst
> @@ -3,10 +3,6 @@
>   
>   :Original: Documentation/staging/xz.rst
>   
> -:翻译:
> -
> - 李睿 Rui Li <me@lirui.org>
> -
>   ===================
>   Linux中的XZ数据压缩
>   ===================
> diff --git a/Documentation/translations/zh_CN/subsystem-apis.rst b/Documentation/translations/zh_CN/subsystem-apis.rst
> index b52e1feb0167..62680243e799 100644
> --- a/Documentation/translations/zh_CN/subsystem-apis.rst
> +++ b/Documentation/translations/zh_CN/subsystem-apis.rst
> @@ -4,10 +4,6 @@
>   
>   :Original: Documentation/subsystem-apis.rst
>   
> -:翻译:
> -
> -  唐艺舟 Tang Yizhou <tangyeechou@gmail.com>
> -
>   ==============
>   内核子系统文档
>   ==============
> diff --git a/Documentation/translations/zh_CN/usb/CREDITS b/Documentation/translations/zh_CN/usb/CREDITS
> index ccfeced03ea6..a49254404381 100644
> --- a/Documentation/translations/zh_CN/usb/CREDITS
> +++ b/Documentation/translations/zh_CN/usb/CREDITS
> @@ -3,13 +3,6 @@
>   
>   :Original: Documentation/usb/CREDITS
>   
> -:翻译:
> -
> - 白钶凡 Kefan Bai <baikefan@leap-io-kernel.com>
> -
> -:校译:
> -
> -
>   Simple Linux USB 驱动项目致谢名单：
>   
>   以下人员都为 Linux USB 驱动代码作出过贡献（按姓氏字母顺序排列）。这份名
> diff --git a/Documentation/translations/zh_CN/usb/acm.rst b/Documentation/translations/zh_CN/usb/acm.rst
> index b2e35787af45..7fdcd900e62d 100644
> --- a/Documentation/translations/zh_CN/usb/acm.rst
> +++ b/Documentation/translations/zh_CN/usb/acm.rst
> @@ -3,13 +3,6 @@
>   
>   :Original: Documentation/usb/acm.rst
>   
> -:翻译:
> -
> - 白钶凡 Kefan Bai <baikefan@leap-io-kernel.com>
> -
> -:校译:
> -
> -
>   ====================
>   Linux ACM 驱动 v0.16
>   ====================
> diff --git a/Documentation/translations/zh_CN/usb/authorization.rst b/Documentation/translations/zh_CN/usb/authorization.rst
> index e2ff2282bd03..e591fd468718 100644
> --- a/Documentation/translations/zh_CN/usb/authorization.rst
> +++ b/Documentation/translations/zh_CN/usb/authorization.rst
> @@ -3,13 +3,6 @@
>   
>   :Original: Documentation/usb/authorization.rst
>   
> -:翻译:
> -
> - 白钶凡 Kefan Bai <baikefan@leap-io-kernel.com>
> -
> -:校译:
> -
> -
>   ===========================
>   允许或禁止 USB 设备接入系统
>   ===========================
> diff --git a/Documentation/translations/zh_CN/usb/chipidea.rst b/Documentation/translations/zh_CN/usb/chipidea.rst
> index ee5407a4ce44..ba2a55e606f7 100644
> --- a/Documentation/translations/zh_CN/usb/chipidea.rst
> +++ b/Documentation/translations/zh_CN/usb/chipidea.rst
> @@ -3,13 +3,6 @@
>   
>   :Original: Documentation/usb/chipidea.rst
>   
> -:翻译:
> -
> - 白钶凡 Kefan Bai <baikefan@leap-io-kernel.com>
> -
> -:校译:
> -
> -
>   =============================
>   ChipIdea 高速双角色控制器驱动
>   =============================
> diff --git a/Documentation/translations/zh_CN/usb/dwc3.rst b/Documentation/translations/zh_CN/usb/dwc3.rst
> index 9584cbbf6d03..a56249f77251 100644
> --- a/Documentation/translations/zh_CN/usb/dwc3.rst
> +++ b/Documentation/translations/zh_CN/usb/dwc3.rst
> @@ -3,13 +3,6 @@
>   
>   :Original: Documentation/usb/dwc3.rst
>   
> -:翻译:
> -
> - 白钶凡 Kefan Bai <baikefan@leap-io-kernel.com>
> -
> -:校译:
> -
> -
>   =========
>   DWC3 驱动
>   =========
> diff --git a/Documentation/translations/zh_CN/usb/ehci.rst b/Documentation/translations/zh_CN/usb/ehci.rst
> index c4c52303b13e..7b8eb4a759ba 100644
> --- a/Documentation/translations/zh_CN/usb/ehci.rst
> +++ b/Documentation/translations/zh_CN/usb/ehci.rst
> @@ -3,13 +3,6 @@
>   
>   :Original: Documentation/usb/ehci.rst
>   
> -:翻译:
> -
> - 白钶凡 Kefan Bai <baikefan@leap-io-kernel.com>
> -
> -:校译:
> -
> -
>   =========
>   EHCI 驱动
>   =========
> diff --git a/Documentation/translations/zh_CN/usb/index.rst b/Documentation/translations/zh_CN/usb/index.rst
> index df99814c6497..9b33ce709092 100644
> --- a/Documentation/translations/zh_CN/usb/index.rst
> +++ b/Documentation/translations/zh_CN/usb/index.rst
> @@ -13,13 +13,6 @@
>   
>   :Original: Documentation/usb/index.rst
>   
> -:翻译:
> -
> - 白钶凡 Kefan Bai <baikefan@leap-io-kernel.com>
> -
> -:校译:
> -
> -
>   ========
>   USB 支持
>   ========
> diff --git a/Documentation/translations/zh_CN/usb/usbmon.rst b/Documentation/translations/zh_CN/usb/usbmon.rst
> index db6030cd64a1..7cdef295aed4 100644
> --- a/Documentation/translations/zh_CN/usb/usbmon.rst
> +++ b/Documentation/translations/zh_CN/usb/usbmon.rst
> @@ -3,13 +3,6 @@
>   
>   :Original: Documentation/usb/usbmon.rst
>   
> -:翻译:
> -
> - 白钶凡 Kefan Bai <baikefan@leap-io-kernel.com>
> -
> -:校译:
> -
> -
>   ======
>   usbmon
>   ======
> diff --git a/Documentation/translations/zh_CN/userspace-api/accelerators/ocxl.rst b/Documentation/translations/zh_CN/userspace-api/accelerators/ocxl.rst
> index aefad87e9099..c6954bbe56f2 100644
> --- a/Documentation/translations/zh_CN/userspace-api/accelerators/ocxl.rst
> +++ b/Documentation/translations/zh_CN/userspace-api/accelerators/ocxl.rst
> @@ -3,10 +3,6 @@
>   
>   :Original: Documentation/userspace-api/accelerators/ocxl.rst
>   
> -:翻译:
> -
> - 李睿 Rui Li <me@lirui.org>
> -
>   =====================================
>   OpenCAPI （开放相干加速器处理器接口）
>   =====================================
> diff --git a/Documentation/translations/zh_CN/userspace-api/ebpf/index.rst b/Documentation/translations/zh_CN/userspace-api/ebpf/index.rst
> index d52c7052f101..587500fd676a 100644
> --- a/Documentation/translations/zh_CN/userspace-api/ebpf/index.rst
> +++ b/Documentation/translations/zh_CN/userspace-api/ebpf/index.rst
> @@ -3,10 +3,6 @@
>   
>   :Original: Documentation/userspace-api/ebpf/index.rst
>   
> -:翻译:
> -
> - 李睿 Rui Li <me@lirui.org>
> -
>   eBPF 用户空间API
>   ================
>   
> diff --git a/Documentation/translations/zh_CN/userspace-api/ebpf/syscall.rst b/Documentation/translations/zh_CN/userspace-api/ebpf/syscall.rst
> index 47e2a59ae45d..79b7ac328260 100644
> --- a/Documentation/translations/zh_CN/userspace-api/ebpf/syscall.rst
> +++ b/Documentation/translations/zh_CN/userspace-api/ebpf/syscall.rst
> @@ -3,10 +3,6 @@
>   
>   :Original: Documentation/userspace-api/ebpf/syscall.rst
>   
> -:翻译:
> -
> - 李睿 Rui Li <me@lirui.org>
> -
>   eBPF Syscall
>   ------------
>   
> diff --git a/Documentation/translations/zh_CN/userspace-api/futex2.rst b/Documentation/translations/zh_CN/userspace-api/futex2.rst
> index 04f9d62db1f7..a0659913822c 100644
> --- a/Documentation/translations/zh_CN/userspace-api/futex2.rst
> +++ b/Documentation/translations/zh_CN/userspace-api/futex2.rst
> @@ -3,10 +3,6 @@
>   
>   :Original: Documentation/userspace-api/futex2.rst
>   
> -:翻译:
> -
> - 李睿 Rui Li <me@lirui.org>
> -
>   ======
>   futex2
>   ======
> diff --git a/Documentation/translations/zh_CN/userspace-api/index.rst b/Documentation/translations/zh_CN/userspace-api/index.rst
> index 5b14721c8264..9bff5a7f60b4 100644
> --- a/Documentation/translations/zh_CN/userspace-api/index.rst
> +++ b/Documentation/translations/zh_CN/userspace-api/index.rst
> @@ -3,10 +3,6 @@
>   
>   :Original: Documentation/userspace-api/index.rst
>   
> -:翻译:
> -
> - 李睿 Rui Li <me@lirui.org>
> -
>   =========================
>   Linux 内核用户空间API指南
>   =========================
> diff --git a/Documentation/translations/zh_CN/userspace-api/no_new_privs.rst b/Documentation/translations/zh_CN/userspace-api/no_new_privs.rst
> index 81bd16ce3ad2..70654816b49c 100644
> --- a/Documentation/translations/zh_CN/userspace-api/no_new_privs.rst
> +++ b/Documentation/translations/zh_CN/userspace-api/no_new_privs.rst
> @@ -3,10 +3,6 @@
>   
>   :Original: Documentation/userspace-api/no_new_privs.rst
>   
> -:翻译:
> -
> - 李睿 Rui Li <me@lirui.org>
> -
>   ============
>   无新权限标志
>   ============
> diff --git a/Documentation/translations/zh_CN/userspace-api/seccomp_filter.rst b/Documentation/translations/zh_CN/userspace-api/seccomp_filter.rst
> index ede8b37c953f..2696fe84468d 100644
> --- a/Documentation/translations/zh_CN/userspace-api/seccomp_filter.rst
> +++ b/Documentation/translations/zh_CN/userspace-api/seccomp_filter.rst
> @@ -3,10 +3,6 @@
>   
>   :Original: Documentation/userspace-api/seccomp_filter.rst
>   
> -:翻译:
> -
> - 李睿 Rui Li <me@lirui.org>
> -
>   ==================================
>   Seccomp BPF (基于过滤器的安全计算)
>   ==================================
> diff --git a/Documentation/translations/zh_CN/userspace-api/sysfs-platform_profile.rst b/Documentation/translations/zh_CN/userspace-api/sysfs-platform_profile.rst
> index 7d21740db125..deb8dd930ba7 100644
> --- a/Documentation/translations/zh_CN/userspace-api/sysfs-platform_profile.rst
> +++ b/Documentation/translations/zh_CN/userspace-api/sysfs-platform_profile.rst
> @@ -3,10 +3,6 @@
>   
>   :Original: Documentation/userspace-api/sysfs-platform_profile.rst
>   
> -:翻译:
> -
> - 李睿 Rui Li <me@lirui.org>
> -
>   ==========================================================
>   平台配置文件选择（如 /sys/firmware/acpi/platform_profile）
>   ==========================================================
> diff --git a/Documentation/translations/zh_CN/virt/acrn/cpuid.rst b/Documentation/translations/zh_CN/virt/acrn/cpuid.rst
> index 6f7be545611b..4f44debe5942 100644
> --- a/Documentation/translations/zh_CN/virt/acrn/cpuid.rst
> +++ b/Documentation/translations/zh_CN/virt/acrn/cpuid.rst
> @@ -3,16 +3,6 @@
>   
>   :Original: Documentation/virt/acrn/cpuid.rst
>   
> -:翻译:
> -
> - 司延腾 Yanteng Si <siyanteng@loongson.cn>
> -
> -:校译:
> -
> - 时��亮 Alex Shi <alexs@kernel.org>
> -
> -.. _cn_virt_acrn_cpuid:
> -
>   ==============
>   ACRN CPUID位域
>   ==============
> diff --git a/Documentation/translations/zh_CN/virt/acrn/index.rst b/Documentation/translations/zh_CN/virt/acrn/index.rst
> index 34605d87f103..4888760a262e 100644
> --- a/Documentation/translations/zh_CN/virt/acrn/index.rst
> +++ b/Documentation/translations/zh_CN/virt/acrn/index.rst
> @@ -3,16 +3,6 @@
>   
>   :Original: Documentation/virt/acrn/index.rst
>   
> -:翻译:
> -
> - 司延腾 Yanteng Si <siyanteng@loongson.cn>
> -
> -:校译:
> -
> - 时奎亮 Alex Shi <alexs@kernel.org>
> -
> -.. _cn_virt_acrn_index:
> -
>   ==============
>   ACRN超级管理器
>   ==============
> diff --git a/Documentation/translations/zh_CN/virt/acrn/introduction.rst b/Documentation/translations/zh_CN/virt/acrn/introduction.rst
> index 7182415cb087..8b1d708e14a7 100644
> --- a/Documentation/translations/zh_CN/virt/acrn/introduction.rst
> +++ b/Documentation/translations/zh_CN/virt/acrn/introduction.rst
> @@ -3,16 +3,6 @@
>   
>   :Original: Documentation/virt/acrn/introduction.rst
>   
> -:翻译:
> -
> - 司延腾 Yanteng Si <siyanteng@loongson.cn>
> -
> -:校译:
> -
> - 时奎亮 Alex Shi <alexs@kernel.org>
> -
> -.. _cn_virt_acrn_introduction:
> -
>   ACRN超级管理器介绍
>   ==================
>   
> diff --git a/Documentation/translations/zh_CN/virt/acrn/io-request.rst b/Documentation/translations/zh_CN/virt/acrn/io-request.rst
> index 4b4e7186d9a5..d3dbe63370b1 100644
> --- a/Documentation/translations/zh_CN/virt/acrn/io-request.rst
> +++ b/Documentation/translations/zh_CN/virt/acrn/io-request.rst
> @@ -3,16 +3,6 @@
>   
>   :Original: Documentation/virt/acrn/io-request.rst
>   
> -:翻译:
> -
> - 司延腾 Yanteng Si <siyanteng@loongson.cn>
> -
> -:校译:
> -
> - 时奎亮 Alex Shi <alexs@kernel.org>
> -
> -.. _cn_virt_acrn_io-request:
> -
>   I/O请求处理
>   ===========
>   
> diff --git a/Documentation/translations/zh_CN/virt/guest-halt-polling.rst b/Documentation/translations/zh_CN/virt/guest-halt-polling.rst
> index 463d1d829062..fabb354a060c 100644
> --- a/Documentation/translations/zh_CN/virt/guest-halt-polling.rst
> +++ b/Documentation/translations/zh_CN/virt/guest-halt-polling.rst
> @@ -2,16 +2,6 @@
>   
>   :Original: Documentation/virt/guest-halt-polling.rst
>   
> -:翻译:
> -
> - 司延腾 Yanteng Si <siyanteng@loongson.cn>
> -
> -:校译:
> -
> - 时奎亮 Alex Shi <alexs@kernel.org>
> -
> -.. _cn_virt_guest-halt-polling:
> -
>   ========================================
>   客户机停机轮询机制（Guest halt polling）
>   ========================================
> diff --git a/Documentation/translations/zh_CN/virt/index.rst b/Documentation/translations/zh_CN/virt/index.rst
> index f8dd13681341..63ad3fe2a3c1 100644
> --- a/Documentation/translations/zh_CN/virt/index.rst
> +++ b/Documentation/translations/zh_CN/virt/index.rst
> @@ -3,16 +3,6 @@
>   
>   :Original: Documentation/virt/index.rst
>   
> -:翻译:
> -
> - 司延腾 Yanteng Si <siyanteng@loongson.cn>
> -
> -:校译:
> -
> - 时奎亮 Alex Shi <alexs@kernel.org>
> -
> -.. _cn_virt_index:
> -
>   ===============
>   Linux虚拟化支持
>   ===============
> diff --git a/Documentation/translations/zh_CN/virt/ne_overview.rst b/Documentation/translations/zh_CN/virt/ne_overview.rst
> index 2455b371abea..0f7b633f5048 100644
> --- a/Documentation/translations/zh_CN/virt/ne_overview.rst
> +++ b/Documentation/translations/zh_CN/virt/ne_overview.rst
> @@ -3,16 +3,6 @@
>   
>   :Original: Documentation/virt/ne_overview.rst
>   
> -:翻译:
> -
> - 司延腾 Yanteng Si <siyanteng@loongson.cn>
> -
> -:校译:
> -
> - 时奎亮 Alex Shi <alexs@kernel.org>
> -
> -.. _cn_virt_ne_overview:
> -
>   ==============
>   Nitro Enclaves
>   ==============
> diff --git a/Documentation/translations/zh_CN/virt/paravirt_ops.rst b/Documentation/translations/zh_CN/virt/paravirt_ops.rst
> index 06b122bc915d..3f530345075b 100644
> --- a/Documentation/translations/zh_CN/virt/paravirt_ops.rst
> +++ b/Documentation/translations/zh_CN/virt/paravirt_ops.rst
> @@ -3,17 +3,6 @@
>   
>   :Original: Documentation/virt/paravirt_ops.rst
>   
> -:翻译:
> -
> - 司延腾 Yanteng Si <siyanteng@loongson.cn>
> -
> -:校译:
> -
> - 陈飞杨 Feiyang Chen <chenfeiyang@loongson.cn>
> - 时奎亮 Alex Shi <alexs@kernel.org>
> -
> -.. _cn_virt_paravirt_ops:
> -
>   ============
>   半虚拟化操作
>   ============

