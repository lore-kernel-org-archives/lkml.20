Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=162.243.161.220
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793277892;
	b=0ZaQIghtgq8iryewLpHXNbewHOe1U0V2D+/XAbhdZug51vI+6B/3fC33JPopzBxPfi4Y
	 vVQgWEuJZowzOK15rSGZZQgkwwTEoJk4KGNT218LL21EPPf+vxD37k2ct1wfmZoek+BEf
	 k+nAI1UP+uEgXPTGF8HkU/a3FLl/6Fyt43xK1fMfd/1FdJ2UVBQE+pjATWbfWYCqjAyyh
	 AOdIMpMeS6NPPS52Xeps+XG4Oq0XMegeC0cf45BjgBAfNE4eYBX9eiPalysy+3vb8BMe/
	 fUnsyvTfq9QdHCJ1H6swoUEKohexCl/R0yoFZkq8nqqBw5Q1sFlJ1B5aGQ/t6EAjh4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793277892;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=MatjeZEfFKIGxElprMJcHWVKdIfLkTyOH54IZYLczYY=;
	b=W/tpfH4WQp9wSEJiPrTtJTOsYB9cw0EVPNBdwvZS5/OdcTpfdE3o2Da1mOml6Y2gokXc
	 ipuklu+pFz90y7L7SB/6x50Qk/9cGmDF9W9elIGCLWV3BRFxqIwHMdDO3zmpo2BtbjlIl
	 1Tx6htUnOEPQUJfvGXqDoQoV6oNTRin0PdMABMpYhr6VeH+pz/+VpHNzryRdHq3hhvwFw
	 /C03sbz8KTrEgVLVmAOITYSq99PI0MhXHcv4Bg7OMv2ZK7Qhr08JUhFOzyu38PBp28fZ8
	 0dAYWZwisHPxes08XuZuj2XIYYu2rvDziWYnpyaPXf9Zrjve5GJ7SqjIDtrJgXVAaDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=hust.edu.cn;
	spf=pass smtp.mailfrom=hust.edu.cn;
	arc=none smtp.remote-ip=162.243.161.220
Received: from zg8tmtyylji0my4xnjeumjiw.icoremail.net (zg8tmtyylji0my4xnjeumjiw.icoremail.net [162.243.161.220])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B59760A2619;
	Thu, 29 Oct 2026 12:44:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B59760A2619
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.50])
	by app2 (Coremail) with UTF8SMTP id IQEQrMCmzne8P+NqZkhkAA--.63948S2;
	Thu, 29 Oct 2026 20:44:44 +0800 (CST)
Received: from mudongliang-PC.tailb307d0.ts.net (unknown [10.12.191.55])
	by gateway (Coremail) with SMTP id _____wDn7zetP+NqnGIEAA--.8789S7;
	Thu, 29 Oct 2026 20:44:41 +0800 (CST)
From: Dongliang Mu <dzm91@hust.edu.cn>
To: Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Weijie Yuan <wy@wyuan.org>,
	Chen-Yu Yeh <chenyou910331@gmail.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 5/9] docs/zh_CN: update magic-number to match upstream
Date: Thu, 29 Oct 2026 20:44:25 +0800
Message-ID: <20261029124429.294868-6-dzm91@hust.edu.cn>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261029124429.294868-1-dzm91@hust.edu.cn>
References: <20261029124429.294868-1-dzm91@hust.edu.cn>
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
X-CM-TRANSID:IQEQrMCmzne8P+NqZkhkAA--.63948S2
Authentication-Results: app2; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvJXoWxKrykXF1rXF1rCrW5Zw45Awb_yoWxGF45pr
	92gr97G3WIyryY9ry7Gr17WF1rAF1xG3y7K3W8Aw1ftr1kJF4UJrsrKr90yrnagry8AayU
	ZF4rKr4Y9F42vw7anT9S1TB71UUUUjDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUHFb7Iv0xC_Cr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
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
	42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUVYhFDUUUU
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/

Update the Chinese magic-number guide to match its English source.
Move it from process to staging and update the staging index.

Synchronize the translation with upstream revision dd8d4bc28ad7.

Signed-off-by: Dongliang Mu <dzm91@hust.edu.cn>
---
 .../translations/zh_CN/staging/index.rst      |  6 ++--
 .../{process => staging}/magic-number.rst     | 33 +++++++++----------
 2 files changed, 17 insertions(+), 22 deletions(-)
 rename Documentation/translations/zh_CN/{process => staging}/magic-number.rst (58%)

diff --git a/Documentation/translations/zh_CN/staging/index.rst b/Documentation/translations/zh_CN/staging/index.rst
index 6d68fabce175..896734ade5eb 100644
--- a/Documentation/translations/zh_CN/staging/index.rst
+++ b/Documentation/translations/zh_CN/staging/index.rst
@@ -1,8 +1,6 @@
 .. SPDX-License-Identifier: GPL-2.0
 .. include:: ../disclaimer-zh_CN.rst
 
-:Original: Documentation/staging/index.rst
-
 :翻译:
 
  李睿 Rui Li <me@lirui.org>
@@ -13,14 +11,14 @@
 .. toctree::
    :maxdepth: 2
 
+   magic-number
    speculation
    xz
 
-TODOList:
+Todolist:
 
 * crc32
 * lzo
 * remoteproc
 * rpmsg
 * static-keys
-* tee
diff --git a/Documentation/translations/zh_CN/process/magic-number.rst b/Documentation/translations/zh_CN/staging/magic-number.rst
similarity index 58%
rename from Documentation/translations/zh_CN/process/magic-number.rst
rename to Documentation/translations/zh_CN/staging/magic-number.rst
index 05ee75cf4346..e8fdf9a7fbdd 100644
--- a/Documentation/translations/zh_CN/process/magic-number.rst
+++ b/Documentation/translations/zh_CN/staging/magic-number.rst
@@ -1,7 +1,5 @@
 .. include:: ../disclaimer-zh_CN.rst
 
-:Original: Documentation/staging/magic-number.rst
-
 :翻译:
 
  贾威威 Jia Wei Wei <harryxiyou@gmail.com>
@@ -13,13 +11,13 @@
 Linux 魔术数
 ============
 
-这个文件是有关当前使用的魔术值注册表。当你给一个结构体添加了一个魔术值，你也
-应该把这个魔术值添加到这个文件，因为我们最好把用于各种结构体的魔术值统一起来。
+本文档登记当前使用的魔术数。给结构体添加魔术数时，也应将其登记在这里，
+因为不同结构体使用的魔术数最好互不相同。
 
-使用魔术值来保护内核数据结构是一个 **非常好的主意** 。这就允许你在运行时检
-查一个结构体(a)是否已经被攻击，或者(b)你已经给一个例程传递了一个错误的结构
-体。最后一种情况特别地有用---特别是当你通过一个空指针指向结构体的时候。例如，
-tty源码经常通过特定驱动使用这种方法用来反复地排列特定方面的结构体。
+用魔术数保护内核数据结构是一个 **非常好的主意**。这样可以在运行时检查：
+（a）结构体是否被意外覆盖，或（b）是否向函数传入了错误的结构体。后一种情况
+尤其常见于通过 ``void *`` 指针传递结构体指针时。例如，tty 代码经常这样
+在驱动专用结构体和线路规程专用结构体之间传递指针。
 
 使用魔术值的方法是在结构体的开头声明它们，如下::
 
@@ -28,30 +26,29 @@ tty源码经常通过特定驱动使用这种方法用来反复地排列特定
         	...
         };
 
-当你以后给内核添加增强功能的时候，请遵守这条规则！这样就会节省数不清的调试
-时间，特别是一些古怪的情况，例如，数组超出范围并且覆盖写了超出部分。利用这
-个规则，这些情况可以被快速地，安全地检测到这些案例。
+今后扩展内核时，请遵循这一做法！它能节省大量调试时间，尤其是在数组越界并
+覆盖后续结构体等难以排查的情况下。使用魔术数可以快速、安全地发现这些问题。
 
 变更日志::
 
 					Theodore Ts'o
 					31 Mar 94
 
-  给当前的Linux 2.1.55添加魔术表。
+  此魔术数表已更新至 Linux 2.1.55。
 
 					Michael Chastain
 					<mailto:mec@shout.net>
 					22 Sep 1997
 
-  现在应该最新的Linux 2.1.112.因为在特性冻结期间，不能在2.2.x前改变任
-  何东西。这些条目被数域所排序。
+  此表现在应已更新至 Linux 2.1.112。由于目前处于功能冻结期，在 2.2.x
+  发布前不太可能再发生变化。条目按数值字段排序。
 
 					Krzysztof G.Baranowski
 					<mailto: kgb@knm.org.pl>
 					29 Jul 1998
 
-  更新魔术表到Linux 2.5.45。刚好越过特性冻结，但是有可能还会有一些新的魔
-  术值在2.6.x之前融入到内核中。
+  将魔术数表更新至 Linux 2.5.45。虽然刚进入功能冻结期，2.6.x 发布前
+  仍可能有新的魔术数进入内核。
 
 					Petr Baudis
 					<pasky@ucw.cz>
@@ -66,10 +63,10 @@ tty源码经常通过特定驱动使用这种方法用来反复地排列特定
 ===================== ================ ======================== ==========================================
 魔术数名              数字             结构                     文件
 ===================== ================ ======================== ==========================================
-PG_MAGIC              'P'              pg_{read,write}_hdr      ``include/linux/pg.h``
+PG_MAGIC              'P'              pg_{read,write}_hdr      ``include/uapi/linux/pg.h``
 APM_BIOS_MAGIC        0x4101           apm_user                 ``arch/x86/kernel/apm_32.c``
 FASYNC_MAGIC          0x4601           fasync_struct            ``include/linux/fs.h``
-SLIP_MAGIC            0x5302           slip                     ``drivers/net/slip.h``
+SLIP_MAGIC            0x5302           slip                     ``drivers/net/slip/slip.h``
 KV_MAGIC              0x5f4b565f       kernel_vars_s            ``arch/mips/include/asm/sn/klkernvars.h``
 CODA_MAGIC            0xC0DAC0DA       coda_file_info           ``fs/coda/coda_fs_i.h``
 CCB_MAGIC             0xf2691ad2       ccb                      ``drivers/scsi/ncr53c8xx.c``
-- 
2.51.0

