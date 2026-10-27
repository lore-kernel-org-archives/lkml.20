Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=52.187.6.220
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793096775;
	b=z8HeMCkObQ1UXjo/vOzU3EcvCxaiQ1Zb23SijEPRJDUy15vwl7jrnz1uE13PeTenT6Nm
	 MaAeM3o1HIaQ8Oy/uSmX/Jd0MKqMgoz+hsA9QqgwcOAhTSgwetz8t6hpL958oqb5cZ0xz
	 Mh/hxdNKOzHhY/BJxSivCq0tMiMOUFUS/bWpwVTkXcG/D1kADZR2MlyCZGfGbt0ftjhw6
	 XgnKbCcDnwv8kM58kOzol5+Vx6wZbnCy9ZTSsO4JIgXMD1i0AHPRDBViOMRTzftnAQyoY
	 0ozbSszR4+t8HeXeK6At9C917J/HQ8UVR3jfM6P9QknyP+mrWKGrrvaSsx6YOCOxh7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793096775;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=BhVbq4cYyjlBr431rKKW9sbPyNcb+k9L8k9UZA/osh4=;
	b=VeKsYfNsW2tOyrXM4lcqc+CH1Yyxmir+kS8+kj4NTK3VFV18Qllhm88XqSRCrFbr4raj
	 fnQBG+eHZs6tW09ifSaq6nYkaXMhYgKX/vOck/xChqK+ItfYt+ny+OQedPr2ymjiTMG93
	 phnVCngPNWf6a6anr4C+P2gAsgtPR+DBYX9FC3ElN+XVDreqzijS2DDHKdUz8eREx+jdQ
	 /VDI+0MdRivJfuujWmlZqOM115tRGxJriRd34wI2t4XnL03O61ucJdLZofGweL0/k1NjV
	 Vk9ZW0625Ai/Y+alTIUPfW3MgGLZBVMgUh5P69pyAVbTqWhNWGDNfur6ZYWg8VJrLNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=hust.edu.cn;
	spf=pass smtp.mailfrom=hust.edu.cn;
	arc=none smtp.remote-ip=52.187.6.220
Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [52.187.6.220])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC651606A31E;
	Tue, 27 Oct 2026 10:26:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC651606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.50])
	by app2 (Coremail) with UTF8SMTP id IQEQrMDW_XY7fOBqIDZfAA--.50857S2;
	Tue, 27 Oct 2026 18:26:03 +0800 (CST)
Received: from mudongliang-PC.tailb307d0.ts.net (unknown [10.12.191.55])
	by gateway (Coremail) with SMTP id _____wDXseYwfOBq0WPDAA--.19105S4;
	Tue, 27 Oct 2026 18:26:02 +0800 (CST)
From: Dongliang Mu <dzm91@hust.edu.cn>
To: Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/9] docs/zh_CN: update admin-guide/README.rst translation
Date: Tue, 27 Oct 2026 18:25:45 +0800
Message-ID: <20261027102552.3801595-3-dzm91@hust.edu.cn>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261027102552.3801595-1-dzm91@hust.edu.cn>
References: <20261027102552.3801595-1-dzm91@hust.edu.cn>
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
X-CM-TRANSID:IQEQrMDW_XY7fOBqIDZfAA--.50857S2
Authentication-Results: app2; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvAXoW3KF4xKw45ur4DuFyDCFyUZFb_yoW8Jw1Uuo
	W2y3y5uwn7AF13Xr4Ykrs8CrWxCrn2kF4fZr47GrsxuFyUWr1ayas0y345trW5urW5CFs3
	Jrya9w13Ja1DA3Zxn29KB7ZKAUJUUUU3529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
	AaLaJ3UjIYCTnIWjp_UUUOG7k0a2IF6w1UM7kC6x804xWl1xkIjI8I6I8E6xAIw20EY4v2
	0xvaj40_Wr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7
	IYx2IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8Jr0_Cr1UM28EF7xv
	wVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2kKe7AKxV
	WUAVWUtwAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY
	07AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VACjcxG62k0Y48FwI
	0_Gr1j6F4UJwAv7VCjz48v1sIEY20_GFW3Jr1UJwAv7VCY1x0262k0Y48FwI0_Gr1j6F4U
	JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc7CjxVAaw2AFwI0_JF0_Jw
	1lc2xSY4AK6svPMxAIw28IcxkI7VAKI48JMxAIw28IcVCjz48v1sIEY20_GFW3Jr1UJwCF
	x2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWUtVW8ZwC20s026c02F40E14v26r
	1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij
	64vIr41lIxAIcVC0I7IYx2IY67AKxVW8JVW5JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr
	0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF
	0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jhcTQUUUUU=
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/

update Documentation/admin-guide/README.rst Chinese translation

Refresh the kernel installation guidance and correct the defconfig and
LSMOD descriptions. Add a label to the translated applying-patches guide
so the README can link to it.

Update the translation through commit 8913632998fc
("Documentation: Fix typos and grammatical errors")

Signed-off-by: Dongliang Mu <dzm91@hust.edu.cn>
---
 .../translations/zh_CN/admin-guide/README.rst | 89 +++++++++++--------
 .../zh_CN/process/applying-patches.rst        |  2 +
 2 files changed, 53 insertions(+), 38 deletions(-)

diff --git a/Documentation/translations/zh_CN/admin-guide/README.rst b/Documentation/translations/zh_CN/admin-guide/README.rst
index ee6dd3782f4a..050f671f8acb 100644
--- a/Documentation/translations/zh_CN/admin-guide/README.rst
+++ b/Documentation/translations/zh_CN/admin-guide/README.rst
@@ -1,11 +1,12 @@
 .. include:: ../disclaimer-zh_CN.rst
 
-:Original: Documentation/admin-guide/README.rst
 
 :译者:
 
  吴想成 Wu XiangCheng <bobwxc@email.cn>
 
+.. _readme_zh:
+
 Linux内核6.x版本 <http://kernel.org/>
 =========================================
 
@@ -30,7 +31,7 @@ Linux内核6.x版本 <http://kernel.org/>
 
   虽然Linux最初是为32位的x86 PC机（386或更高版本）开发的，但今天它也能运行在
   （至少）Compaq Alpha AXP、Sun SPARC与UltraSPARC、Motorola 68000、PowerPC、
-  PowerPC64、ARM、Hitachi SuperH、Cell、IBM S/390、MIPS、HP PA-RISC、Intel 
+  PowerPC64、ARM、Hitachi SuperH、Cell、IBM S/390、MIPS、HP PA-RISC、Intel
   IA-64、DEC VAX、AMD x86-64 Xtensa和ARC架构上。
 
   Linux很容易移植到大多数通用的32位或64位体系架构，只要它们有一个分页内存管理
@@ -42,15 +43,12 @@ Linux内核6.x版本 <http://kernel.org/>
 
 文档
 -----
-因特网上和书籍上都有大量的电子文档，既有Linux专属文档，也有与一般UNIX问题相关
-的文档。我建议在任何Linux FTP站点上查找LDP（Linux文档项目）书籍的文档子目录。
-本自述文件并不是关于系统的文档：有更好的可用资源。
 
- - 因特网上和书籍上都有大量的（电子）文档，既有Linux专属文档，也有与普通
-   UNIX问题相关的文档。我建议在任何有LDP（Linux文档项目）书籍的Linux FTP
-   站点上查找文档子目录。本自述文件并不是关于系统的文档：有更好的可用资源。
+ - 因特网上有大量电子文档，书籍中也有丰富资料，既包括 Linux 专属内容，也包括
+   一般 UNIX 问题。在任何 Linux FTP 站点的文档子目录中，都可以查找
+   LDP（Linux 文档项目）的书籍。本 README 并非系统使用手册；另有更好的资料。
 
- - 文档/子目录中有各种自述文件：例如，这些文件通常包含一些特定驱动程序的
+ - ``Documentation/`` 子目录中有各种 README 文件：它们通常包含特定驱动程序的
    内核安装说明。请阅读
    :ref:`Documentation/process/changes.rst <changes>` 文件，它包含了升级内核
    可能会导致的问题的相关信息。
@@ -82,8 +80,8 @@ Linux内核6.x版本 <http://kernel.org/>
    直接应用于基本的6.x内核。例如，如果您的基本内核是6.0，并且希望应用6.0.3
    补丁，则不应先应用6.0.1和6.0.2的补丁。类似地，如果您运行的是6.0.2内核，
    并且希望跳转到6.0.3，那么在应用6.0.3补丁之前，必须首先撤销6.0.2补丁
-   （即patch -R）。更多关于这方面的内容，请阅读
-   Documentation/translations/zh_CN/process/applying-patches.rst 。
+   （即 ``patch -R``）。有关这方面的更多内容，请参阅
+   :ref:`Documentation/translations/zh_CN/process/applying-patches.rst <zh_applying_patches>`。
 
    或者，脚本 patch-kernel 可以用来自动化这个过程。它能确定当前内核版本并
    应用找到的所有补丁::
@@ -154,13 +152,14 @@ Linux内核6.x版本 <http://kernel.org/>
      "make olddefconfig"
                         类似上一个，但不询问直接将新选项设置为默认值。
 
-     "make defconfig"   根据体系架构，使用arch/$arch/defconfig或
-                        arch/$arch/configs/${PLATFORM}_defconfig中的
-                        默认选项值创建./.config文件。
+     "make defconfig"   根据体系架构，使用
+                        arch/$ARCH/configs/defconfig 或
+                        arch/$ARCH/configs/${PLATFORM}_defconfig 中的
+                        默认选项值创建 ./.config 文件。
 
      "make ${PLATFORM}_defconfig"
-                        使用arch/$arch/configs/${PLATFORM}_defconfig中
-                        的默认选项值创建一个./.config文件。
+                        使用 arch/$ARCH/configs/${PLATFORM}_defconfig 中
+                        的默认选项值创建一个 ./.config 文件。
                         用“make help”来获取您体系架构中所有可用平台的列表。
 
      "make allyesconfig"
@@ -180,7 +179,7 @@ Linux内核6.x版本 <http://kernel.org/>
                            已加载的模块不需要的任何模块选项。
 
                            要为另一台计算机创建localmodconfig，请将该计算机
-                           的lsmod存储到一个文件中，并将其作为lsmod参数传入。
+                           的 lsmod 输出存储到文件中，并通过 LSMOD 参数传入。
 
                            此外，通过在参数LMC_KEEP中指定模块的路径，可以将
                            模块保留在某些文件夹或kconfig文件中。
@@ -216,10 +215,10 @@ Linux内核6.x版本 <http://kernel.org/>
       这种情况下，数学仿真永远不会被使用。内核会稍微大一点，但不管
       是否有数学协处理器，都可以在不同的机器上工作。
 
-    - “kernel hacking”配置细节通常会导致更大或更慢的内核（或两者
-      兼而有之），甚至可以通过配置一些例程来主动尝试破坏坏代码以发现
-      内核问题，从而降低内核的稳定性（kmalloc()）。因此，您可能应该
-      用于研究“开发”、“实验”或“调试”特性相关问题。
+    - “kernel hacking”配置选项细节通常会使内核体积更大、运行更慢，或者
+      两者兼有。某些选项还会让例程主动触发有问题的代码，以发现内核问题
+      （例如 ``kmalloc()``），从而降低内核的稳定性。因此，对于“开发”、
+      “实验”或“调试”功能，通常应回答 ``n``。
 
 编译内核
 ---------
@@ -227,8 +226,9 @@ Linux内核6.x版本 <http://kernel.org/>
  - 确保您至少有gcc 8.1可用。
    有关更多信息，请参阅 :ref:`Documentation/process/changes.rst <changes>` 。
 
- - 执行 ``make`` 来创建压缩内核映像。如果您安装了lilo以适配内核makefile，
-   那么也可以进行 ``make install`` ，但是您可能需要先检查特定的lilo设置。
+ - 执行 ``make`` 来创建压缩内核映像。如果安装了 LILO，或发行版提供了内核
+   安装程序可以识别的安装脚本，也可以执行 ``make install``。多数常见发行版
+   都提供这样的脚本；请先检查发行版的安装方式。
 
    实际安装必须以root身份执行，但任何正常构建都不需要。
    无须徒然使用root身份。
@@ -244,7 +244,8 @@ Linux内核6.x版本 <http://kernel.org/>
 
      make V=1 all
 
-   如需构建系统也给出内个目标重建的愿意，请使用 ``V=2`` 。默认为 ``V=0`` 。
+   若还需要构建系统说明每个目标重新构建的原因，请使用 ``V=2``。
+   默认值为 ``V=0``。
 
  - 准备一个备份内核以防出错。对于开发版本尤其如此，因为每个新版本都包含
    尚未调试的新代码。也要确保保留与该内核对应的模块的备份。如果要安装
@@ -257,23 +258,35 @@ Linux内核6.x版本 <http://kernel.org/>
  - 为了引导新内核，您需要将内核映像（例如编译后的
    .../linux/arch/x86/boot/bzImage）复制到常规可引导内核的位置。
 
- - 不再支持在没有LILO等启动装载程序帮助的情况下直接从软盘引导内核。
+ - 在 BIOS（非 EFI）系统上，已不再支持不借助 LILO 或 GRUB 等引导加载程序，
+   直接从存储设备启动内核。在 UEFI/EFI 系统上，可以使用 EFISTUB，让主板
+   直接启动内核。不过，对于现代工作站和台式机，通常建议使用引导加载程序，
+   因为安装多个内核或启用安全启动时可能遇到困难。有关 EFISTUB 的详情，
+   请参阅 ``Documentation/admin-guide/efi-stub.rst``。
+
+ - 请注意，LILO（LInux LOader）自 2016 年起就不再积极开发。它曾经非常流行，
+   因此仍常见于文档。常见的替代方案包括 GRUB2、rEFInd、Syslinux、
+   systemd-boot 和 EFISTUB。由于多种原因，不建议使用已经停止积极开发的软件。
+
+ - 您的发行版很可能提供了安装脚本，这时运行 ``make install`` 就足够了。
+   如果没有，则需要确认所用的引导加载程序并查阅其文档，或配置 EFI。
+
+旧版 LILO 操作说明
+------------------
 
-   如果从硬盘引导Linux，很可能使用LILO，它使用/etc/lilo.conf文件中
-   指定的内核映像文件。内核映像文件通常是/vmlinuz、/boot/vmlinuz、
-   /bzImage或/boot/bzImage。使用新内核前，请保存旧映像的副本，并复制
-   新映像覆盖旧映像。然后您【必须重新运行LILO】来更新加载映射！否则，
-   将无法启动新的内核映像。
+ - 如果使用 LILO，内核映像在 ``/etc/lilo.conf`` 中指定。映像文件通常是
+   ``/vmlinuz``、``/boot/vmlinuz``、``/bzImage`` 或 ``/boot/bzImage``。
+   要使用新内核，请先保存旧映像的副本，再用新映像覆盖旧映像。然后
+   **必须重新运行 LILO** 来更新加载映射！否则将无法启动新内核映像。
 
-   重新安装LILO通常需要运行/sbin/LILO。您可能希望编辑/etc/lilo.conf
-   文件为旧内核映像指定一个条目（例如/vmlinux.old)防止新的不能正常
-   工作。有关更多信息，请参阅LILO文档。
+ - 重新安装 LILO 通常只需运行 ``/sbin/lilo``。可以编辑 ``/etc/lilo.conf``，
+   为旧内核映像（例如 ``/vmlinux.old``）保留一个条目，以防新内核无法工作。
+   更多信息请参阅 LILO 文档。
 
-   重新安装LILO之后，您应该就已经准备好了。关闭系统，重新启动，尽情
-   享受吧！
+ - 重新安装 LILO 后就可以关闭系统、重新启动并使用新内核了。
 
-   如果需要更改内核映像中的默认根设备、视频模式等，请在适当的地方使用
-   启动装载程序的引导选项。无需重新编译内核即可更改这些参数。
+ - 如果需要更改内核映像中的默认根设备、视频模式等，请在适当情况下使用
+   引导加载程序的启动选项。无须为更改这些参数而重新编译内核。
 
  - 使用新内核重新启动并享受它吧。
 
@@ -287,5 +300,5 @@ Documentation/translations/zh_CN/admin-guide/reporting-issues.rst 。
 Documentation/translations/zh_CN/admin-guide/bug-hunting.rst 。
 
 更多用GDB调试内核的信息，请参阅：
-Documentation/translations/zh_CN/dev-tools/gdb-kernel-debugging.rst
+Documentation/translations/zh_CN/process/debugging/gdb-kernel-debugging.rst
 和 Documentation/process/debugging/kgdb.rst 。
diff --git a/Documentation/translations/zh_CN/process/applying-patches.rst b/Documentation/translations/zh_CN/process/applying-patches.rst
index c056b241b0cd..fb76a0b69f5c 100644
--- a/Documentation/translations/zh_CN/process/applying-patches.rst
+++ b/Documentation/translations/zh_CN/process/applying-patches.rst
@@ -8,6 +8,8 @@
 
  袁维杰 Weijie Yuan <wy@wyuan.org>
 
+.. _zh_applying_patches:
+
 将补丁应用到 Linux 内核
 +++++++++++++++++++++++
 
-- 
2.51.0

