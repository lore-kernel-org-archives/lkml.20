Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=162.243.161.220
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793158913;
	b=e0Bd0WMOGBOpa2fJFUR9aPEsboawD2+/+x2tgQwlhSbYv0NzKKLLxbOmlYLhDt7lhk85
	 uII4UUjWWxWWEPsQ2rkv+fR2g32w+tpIgM/k7UF1PkfbLunJgairfROJD7+NveMa4Rgn4
	 TbfPCKQaIHAaIrtEnNTm89ziVzuRfyDk81fJmVp1S5fJufwaKpwtsaFQeXBOFGLCxCTCa
	 TnOXA7LqrlPlThLzN4DwaGODWenScVKb77IY7LOSsJtQlWBdUrbrdo7t1yryLnzp+yuJZ
	 WPzgCetr+CsyeH4hWVtMW3pp9W/vaPTn5/tGZy5ZbpGGs6ByW6FlSZzTrhCZX+hwYvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793158913;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=aFCUw02wTjJ5AnS6dXH3ZMD0h7CrkaEBbQsdFPHFUjI=;
	b=Uim+YozceYjM6rIQ4obaiKHPch9tKSxNapcZrLI5ZWGWw7sC2Ny8+turP+TZ538TFvKa
	 voNFZgSKgtQrxGwnuYMgPlMHQxTTLP7scy+3BM4nC70g1lAgMEFCJAJttGjLJU7dA03j5
	 HcxBbjgkedrcIX0eM/88iVce8pDzcRWP+pJVXqd/ebHBiLDggPyFkNsJ0nOOg70SMFeBK
	 /k47ar6mrRiPa+CANOVqxDHgzDoam7B+SPzgkB/B5MvQro4S9uaEPUcCGFVM6MXBmTkYP
	 oXPrsAUwhxOzam0sRt8p7/gOhC9m1RrGUJbtuPfW9hjaSEXsB9muoAZ/pjXIAvPR7OA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=hust.edu.cn;
	spf=pass smtp.mailfrom=hust.edu.cn;
	arc=none smtp.remote-ip=162.243.161.220
Received: from zg8tmtyylji0my4xnjeumjiw.icoremail.net (zg8tmtyylji0my4xnjeumjiw.icoremail.net [162.243.161.220])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFFE560A2623;
	Wed, 28 Oct 2026 03:41:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFFE560A2623
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.52])
	by app1 (Coremail) with UTF8SMTP id IAEQrMA2fqT+buFqFOU+AQ--.21707S2;
	Wed, 28 Oct 2026 11:41:50 +0800 (CST)
Received: from mudongliang-PC.tailb307d0.ts.net (unknown [10.12.191.55])
	by gateway (Coremail) with SMTP id _____wCXkDvubuFql1YAAA--.815S9;
	Wed, 28 Oct 2026 11:41:48 +0800 (CST)
From: Dongliang Mu <dzm91@hust.edu.cn>
To: Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Weijie Yuan <wy@wyuan.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 7/9] docs/zh_CN: move GFS2 translations into filesystems/gfs2
Date: Wed, 28 Oct 2026 11:41:32 +0800
Message-ID: <20261028034134.4144660-8-dzm91@hust.edu.cn>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261028034134.4144660-1-dzm91@hust.edu.cn>
References: <20261028034134.4144660-1-dzm91@hust.edu.cn>
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
X-CM-TRANSID:IAEQrMA2fqT+buFqFOU+AQ--.21707S2
Authentication-Results: app1; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvJXoW3Gw1rCrW5Aw1UZFW8Ary7Jrb_yoWxKFy5pF
	9a9rWxKa4kJFyUC34fCF42qr18C3WrWwnrJr97X3ZIqr1DJF1ftrsxt34DKas3GrWxZay5
	XayrKryjgry2y3DanT9S1TB71UUUUjDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUHFb7Iv0xC_Zr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
	v20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1l84ACjcxK
	6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1ln4kS14v26r
	126r1DM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI
	12xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj64x0Y40En7xvr7AKxV
	W8Jr0_Cr1UMcIj6x8ErcxFaVAv8VW8uFyUJr1UMcIj6xkF7I0En7xvr7AKxVW8Jr0_Cr1U
	McvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY1x0262kKe7AKxVWUAVWUtw
	CY02Avz4vE-syl42xK82IYc2Ij64vIr41l42xK82IY6x8ErcxFaVAv8VW8uFyUJr1UMxC2
	0s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r126r1DMI8I3I0E5I8CrVAFwI0_Jr
	0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0E
	wIxGrwCI42IY6xIIjxv20xvE14v26F1j6w1UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWxJV
	W8Jr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26F4j6r4UJwCI
	42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU3YFADUUUU
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/

Move the GFS2 overview, glock, and uevent translations into the GFS2
directory. Update the filesystem index and add the GFS2 chapter index.

Signed-off-by: Dongliang Mu <dzm91@hust.edu.cn>
---
 .../{gfs2-glocks.rst => gfs2/glocks.rst}      |   4 +-
 .../filesystems/{gfs2.rst => gfs2/index.rst}  |  18 ++-
 .../{gfs2-uevents.rst => gfs2/uevents.rst}    |   4 +-
 .../translations/zh_CN/filesystems/index.rst  | 112 ++++++++++++++++--
 4 files changed, 116 insertions(+), 22 deletions(-)
 rename Documentation/translations/zh_CN/filesystems/{gfs2-glocks.rst => gfs2/glocks.rst} (99%)
 rename Documentation/translations/zh_CN/filesystems/{gfs2.rst => gfs2/index.rst} (93%)
 rename Documentation/translations/zh_CN/filesystems/{gfs2-uevents.rst => gfs2/uevents.rst} (97%)

diff --git a/Documentation/translations/zh_CN/filesystems/gfs2-glocks.rst b/Documentation/translations/zh_CN/filesystems/gfs2/glocks.rst
similarity index 99%
rename from Documentation/translations/zh_CN/filesystems/gfs2-glocks.rst
rename to Documentation/translations/zh_CN/filesystems/gfs2/glocks.rst
index abfd2f2f94e9..a73444759a27 100644
--- a/Documentation/translations/zh_CN/filesystems/gfs2-glocks.rst
+++ b/Documentation/translations/zh_CN/filesystems/gfs2/glocks.rst
@@ -1,8 +1,6 @@
 .. SPDX-License-Identifier: GPL-2.0
 
-.. include:: ../disclaimer-zh_CN.rst
-
-:Original: Documentation/filesystems/gfs2-glocks.rst
+.. include:: ../../disclaimer-zh_CN.rst
 
 :翻译:
 
diff --git a/Documentation/translations/zh_CN/filesystems/gfs2.rst b/Documentation/translations/zh_CN/filesystems/gfs2/index.rst
similarity index 93%
rename from Documentation/translations/zh_CN/filesystems/gfs2.rst
rename to Documentation/translations/zh_CN/filesystems/gfs2/index.rst
index ffa62b12b019..af6c10af2fca 100644
--- a/Documentation/translations/zh_CN/filesystems/gfs2.rst
+++ b/Documentation/translations/zh_CN/filesystems/gfs2/index.rst
@@ -1,8 +1,6 @@
 .. SPDX-License-Identifier: GPL-2.0
 
-.. include:: ../disclaimer-zh_CN.rst
-
-:Original: Documentation/filesystems/gfs2.rst
+.. include:: ../../disclaimer-zh_CN.rst
 
 :翻译:
 
@@ -16,6 +14,9 @@
 全局文件系统 2 (Global File System 2)
 =====================================
 
+概述
+====
+
 GFS2 是一个集群文件系统。它允许一组计算机同时使用在它们之间共享的块设备（通
 过 FC、iSCSI、NBD 等）。GFS2 像本地文件系统一样读写块设备，但也使用一个锁
 模块来让计算机协调它们的 I/O 操作，从而维护文件系统的一致性。GFS2 的出色特
@@ -33,7 +34,7 @@ GFS2 使用可互换的节点间锁定机制，当前支持的机制有：
 
 lock_dlm 依赖于在上述 URL 中找到的用户空间集群管理系统。
 
-若要将 GFS2 用作本地文件系统，则不需要外部集群系统，只需：:
+若要将 GFS2 用作本地文件系统，则不需要外部集群系统，只需::
 
   $ mkfs -t gfs2 -p lock_nolock -j 1 /dev/block_device
   $ mount -t gfs2 /dev/block_device /dir
@@ -55,3 +56,12 @@ GFS2 在磁盘格式上与早期版本的 GFS 不兼容，但它已相当接近
   gfs2_convert		用于将 gfs 文件系统原地转换为 GFS2
   mkfs.gfs2		用于创建文件系统
   ============          =============================================
+
+实现说明
+========
+
+.. toctree::
+   :maxdepth: 1
+
+   glocks
+   uevents
diff --git a/Documentation/translations/zh_CN/filesystems/gfs2-uevents.rst b/Documentation/translations/zh_CN/filesystems/gfs2/uevents.rst
similarity index 97%
rename from Documentation/translations/zh_CN/filesystems/gfs2-uevents.rst
rename to Documentation/translations/zh_CN/filesystems/gfs2/uevents.rst
index 3975c4544118..a60f9fdae6bc 100644
--- a/Documentation/translations/zh_CN/filesystems/gfs2-uevents.rst
+++ b/Documentation/translations/zh_CN/filesystems/gfs2/uevents.rst
@@ -1,8 +1,6 @@
 .. SPDX-License-Identifier: GPL-2.0
 
-.. include:: ../disclaimer-zh_CN.rst
-
-:Original: Documentation/filesystems/gfs2-uevents.rst
+.. include:: ../../disclaimer-zh_CN.rst
 
 :翻译:
 
diff --git a/Documentation/translations/zh_CN/filesystems/index.rst b/Documentation/translations/zh_CN/filesystems/index.rst
index fcc79ff9fdad..5e198707c16b 100644
--- a/Documentation/translations/zh_CN/filesystems/index.rst
+++ b/Documentation/translations/zh_CN/filesystems/index.rst
@@ -2,7 +2,6 @@
 
 .. include:: ../disclaimer-zh_CN.rst
 
-:Original: :ref:`Documentation/filesystems/index.rst <filesystems_index>`
 :Translator: Wang Wenhu <wenhu.wang@vivo.com>
 
 .. _cn_filesystems_index:
@@ -11,34 +10,123 @@
 Linux Kernel中的文件系统
 ========================
 
-这份正在开发的手册或许在未来某个辉煌的日子里以易懂的形式将Linux虚拟\
-文件系统（VFS）层以及基于其上的各种文件系统如何工作呈现给大家。当前\
-可以看到下面的内容。
+这份仍在编写中的手册，希望有一天能全面介绍 Linux 虚拟文件系统（VFS）层及其下层
+文件系统的工作方式。目前已有的内容如下。
 
 核心 VFS 文档
 =============
 
-有关 VFS 层本身以及其算法工作方式的文档，请参阅这些手册。
+这些手册介绍 VFS 层本身及其算法的工作方式。
 
 .. toctree::
-   :maxdepth: 1
+   :maxdepth: 2
 
    dnotify
 
+Todolist:
+
+* vfs
+* path-lookup
+* api-summary
+* splice
+* locking
+* directory-locking
+* devpts
+* fiemap
+* files
+* locks
+* mmap_prepare
+* multigrain-ts
+* mount_api
+* quota
+* seq_file
+* sharedsubtree
+* idmappings
+* iomap/index
+* automount-support
+* caching/index
+* porting
+* adding-new-filesystems
+
+文件系统支持层
+==============
+
+这些文档介绍供文件系统实现使用的文件系统层支持代码。
+
+Todolist:
+
+* buffer
+* journalling
+* fscrypt
+* fsverity
+* netfs_library
+
 文件系统
 ========
 
-文件系统实现文档。
+这些文档介绍各个文件系统的实现。
 
 .. toctree::
    :maxdepth: 2
 
-   virtiofs
    debugfs
+   gfs2/index
+   inotify
    tmpfs
    ubifs
    ubifs-authentication
-   gfs2
-   gfs2-uevents
-   gfs2-glocks
-   inotify
+   virtiofs
+
+Todolist:
+
+* 9p
+* adfs
+* affs
+* afs
+* autofs
+* autofs-mount-control
+* befs
+* bfs
+* btrfs
+* ceph
+* coda
+* configfs
+* cramfs
+* dax
+* dlmfs
+* ecryptfs
+* efivarfs
+* erofs
+* ext2
+* ext3
+* ext4/index
+* f2fs
+* failfs
+* hfs
+* hfsplus
+* hpfs
+* fuse/index
+* isofs
+* nilfs2
+* nfs/index
+* ntfs
+* ntfs3
+* ocfs2
+* ocfs2-online-filecheck
+* omfs
+* orangefs
+* overlayfs
+* proc
+* qnx6
+* ramfs-rootfs-initramfs
+* relay
+* resctrl
+* romfs
+* smb/index
+* spufs/index
+* squashfs
+* sysfs
+* udf
+* vfat
+* xfs/index
+* zonefs
-- 
2.51.0

