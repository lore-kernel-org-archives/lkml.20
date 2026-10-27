Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=13.75.44.102
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793096789;
	b=QpuLAjlAmalNboWLUwGD0FFdFmzErqjlRa3/t+cMfcget76EaGxOp1uy53ynp4qHMzwK
	 sh8ucVE4B1nNwE3AWb9kY6BjTp7AmyP46ld4q1wZh1sWEX7+BxqEXkCFQaiLrBKpvU1Dn
	 2LP3WR4wb7I8FfZo/HH4js/82lCJyPiy4TX0wkE0ImwA9EMAe1TM61gqzfnOtVexsaC+7
	 yXTXUz3hde7U15gCrJ8IccWrvt2GugA6SUYN4zhzZXKEIEUdx9jUHZ3/4UnWx/HYT/lBL
	 UxTTR2DDq+0WWGopGeToux+RfH6oXbchxji9ADfHtV0BzbM5mCY+b+INCkz+7CedcBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793096789;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=aFCUw02wTjJ5AnS6dXH3ZMD0h7CrkaEBbQsdFPHFUjI=;
	b=33X/Wqw7eMVE8I/n3IfODNEbew8hGSFcttsCLj/O6C5jfq0vmqcN2IE1jSCAcdmQ2kZ7
	 3cd7n7jMj8jROEHxvdxS8mBFBPW1HJcAcT9zzronymyIjKsuFL5TYy2nCqCgmR1rwX0Ng
	 XXBoD//v9aBVJPYM/0hBoJP6cs1wosrB/AJaCu3q3XuG2eDbGLGhW9SpW7VE1NE045M1t
	 TrrXx8raYVUzA/eT/Ui2C9+GWmp8nCQXdBgPIQZDIh5jMU4kGJz0IHZANaeXBiu5cBDFj
	 3Mm4zingJfG7YKV9J9jRpJ/+eCu7lUzEurxi2ZWJ+Q+I793lQXFZEJMk6KF9pOxkwuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=hust.edu.cn;
	spf=pass smtp.mailfrom=hust.edu.cn;
	arc=none smtp.remote-ip=13.75.44.102
Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [13.75.44.102])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2141606A32E;
	Tue, 27 Oct 2026 10:26:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2141606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.50])
	by app1 (Coremail) with UTF8SMTP id IAEQrMCW3qRLfOBqqqg6AQ--.12171S2;
	Tue, 27 Oct 2026 18:26:19 +0800 (CST)
Received: from mudongliang-PC.tailb307d0.ts.net (unknown [10.12.191.55])
	by gateway (Coremail) with SMTP id _____wDXseYwfOBq0WPDAA--.19105S9;
	Tue, 27 Oct 2026 18:26:14 +0800 (CST)
From: Dongliang Mu <dzm91@hust.edu.cn>
To: Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 7/9] docs/zh_CN: move GFS2 translations into filesystems/gfs2
Date: Tue, 27 Oct 2026 18:25:50 +0800
Message-ID: <20261027102552.3801595-8-dzm91@hust.edu.cn>
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
X-CM-TRANSID:IAEQrMCW3qRLfOBqqqg6AQ--.12171S2
Authentication-Results: app1; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvJXoW3Gw1rCrW5Aw1UZFW8Ary7Jrb_yoWxKFy5pF
	9a9rWxKa4kJFyUC34fCF42qr18C3WrWwnrJr97X3ZIqr1DJF1ftrsxt34DKas3GrWxZay5
	XayrKryjgry2y3DanT9S1TB71UUUUjDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUHYb7Iv0xC_Zr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
	v20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1l84ACjcxK
	6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1ln4kS14v26r
	126r1DM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI
	12xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj64x0Y40En7xvr7AKxV
	W8Jr0_Cr1UMcIj6x8ErcxFaVAv8VW8uFyUJr1UMcIj6xkF7I0En7xvr7AKxVW8Jr0_Cr1U
	McvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY1x0262kKe7AKxVWUAVWUtw
	CY02Avz4vE-syl42xK82IYc2Ij64vIr41l42xK82IY6x8ErcxFaVAv8VW8uFyUJr1UMxC2
	0s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r126r1DMI8I3I0E5I8CrVAFwI0_Jr
	0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0E
	wIxGrwCI42IY6xIIjxv20xvE14v26F1j6w1UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWxJV
	W8Jr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF
	0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jDkucUUUUU=
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

