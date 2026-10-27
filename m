Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=207.46.229.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793096784;
	b=tA9lfuL4TiNBgGxDFDaZUOJBaHUqeihMGd01VOB+vRxOMVufQ6puE/QMhpcKo1yO+xtW
	 F6Xj59exUwWx8rbwdwezNfq/TDBcQ8V39CUG3nA4/jiyGjV/G8OHlWdEzCGsmwLeRvPDL
	 7a+XmxEV/6XBeNaA/tpWlMeDbajwf8Xh2IYOBBWhoCrPA/e6U54AdqTkZqNGyKwkO+TCl
	 z2vd01glE8q66EX9hgTySvdeP1HUIdZitoEgwF9C9em446XhBVqZuBDk4rIeXPvVwrPNi
	 NJfewR0KSaxvkjOAPByJNZuK8Vw3pAJLLUgxUejHbjf+OCisqsGkxF1S/pEVhh4yKLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793096784;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=VXZRVyAu4fqEXfgMLHYJ42LmUGhFHD1mrwtk+VPQ1eo=;
	b=Y64ofqOpkS+VueKvg4Jjb3umSEuUJYmnk9v0D/En8kebcWBcu2v9PbY/RquwnXYXP7lx
	 RPDoMPkm1jbvFQZ/467N41OgMy7JEuBTsRkmJeruLkSrlxmxvfFf1kACKHUj9Vl50CwWr
	 L/IX6BrApW3+bV4H8oCWur3j2d5cdvOMBvROq0XLExI7tVT8mZZ4Mk0yF4CBblPXL7DkU
	 R8qYJFwLeBG3TstCv/4xI4ENLxZaE4Be/3OkhEYoCfGAY/Mb3yGTGGs6d65nKd5PBLhmJ
	 WpRo56HGXITLm/fNYTkdtCf0O50o2l6PRq9sc6N6Gim7xAHAeqjy1q/5sS0jQf1yJAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=hust.edu.cn;
	spf=pass smtp.mailfrom=hust.edu.cn;
	arc=none smtp.remote-ip=207.46.229.174
Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [207.46.229.174])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9265606A33D;
	Tue, 27 Oct 2026 10:26:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9265606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.50])
	by app2 (Coremail) with UTF8SMTP id IQEQrMAmT3hGfOBqRjZfAA--.53557S2;
	Tue, 27 Oct 2026 18:26:14 +0800 (CST)
Received: from mudongliang-PC.tailb307d0.ts.net (unknown [10.12.191.55])
	by gateway (Coremail) with SMTP id _____wDXseYwfOBq0WPDAA--.19105S7;
	Tue, 27 Oct 2026 18:26:08 +0800 (CST)
From: Dongliang Mu <dzm91@hust.edu.cn>
To: Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/9] docs/zh_CN: update magic-number to match upstream
Date: Tue, 27 Oct 2026 18:25:48 +0800
Message-ID: <20261027102552.3801595-6-dzm91@hust.edu.cn>
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
X-CM-TRANSID:IQEQrMAmT3hGfOBqRjZfAA--.53557S2
Authentication-Results: app2; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvJXoWxKrykXF1rXF1rCrW5Zw45Awb_yoWxXr4rpr
	s2g3s7G3WSyryY9ry7Gr17WF18AF1xG3y7K3W8Aw1ftF1kJF4UJrnrKr90yrnagry8AayU
	ZF4rKr4Y9F42vwUanT9S1TB71UUUUjDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUH0b7Iv0xC_Cr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
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
	wIxGrwCI42IY6xIIjxv20xvE14v26ryj6F1UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JV
	WxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAI
	cVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU0XVy3UUUUU==
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/

Update the Chinese magic-number guide to match its English source.
Move it from process to staging and update the staging index.

Synchronize the translation with upstream revision dd8d4bc28ad7.

Signed-off-by: Dongliang Mu <dzm91@hust.edu.cn>
---
 .../translations/zh_CN/staging/index.rst      |  6 ++--
 .../{process => staging}/magic-number.rst     | 35 +++++++++----------
 2 files changed, 19 insertions(+), 22 deletions(-)
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
index 05ee75cf4346..2cb46a6e343b 100644
--- a/Documentation/translations/zh_CN/process/magic-number.rst
+++ b/Documentation/translations/zh_CN/staging/magic-number.rst
@@ -1,7 +1,5 @@
 .. include:: ../disclaimer-zh_CN.rst
 
-:Original: Documentation/staging/magic-number.rst
-
 :翻译:
 
  贾威威 Jia Wei Wei <harryxiyou@gmail.com>
@@ -10,16 +8,18 @@
 
  司延腾 Yanteng Si <siyanteng@loongson.cn>
 
+.. _magicnumbers_zh:
+
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
 
@@ -28,30 +28,29 @@ tty源码经常通过特定驱动使用这种方法用来反复地排列特定
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
@@ -66,10 +65,10 @@ tty源码经常通过特定驱动使用这种方法用来反复地排列特定
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

