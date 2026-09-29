Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5518651A751
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 12:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790683255; cv=none; b=BEsvwYxFZMQYao3dKn89pJ/tbU1YvkfXEYIHXwDC+tw+Tin0GCCIpPbO3HX26+LCX/irDXMGLUOJcPrxKN6uwEMMhp8Y2KLJ4j4emxqxszEs205HIzohFsuVCK/iS1+bq5a25OKFqWJQ1oCFFj9+fXvwhk2WZ/Vb0BTFKuGz5+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790683255; c=relaxed/simple;
	bh=qHJXJOwKePJXmBx8wC+69waSkzU2qvNgfhK0jGeQqFs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=atZaYhRduFiufsh3CUYQChU+igBlR4Y5Pw8rddis6CUlF5Wib5clsMHAGXAV9fWs9MgzxitHYar2xOMz6oHWSg/ZsoylMwgqpddlpLTIh/xrUqMOV4Jdi+efgj9D7WBz/8ZWKulZT/giSj9gK57pXWAXI+hTUsgBgIpctUcRaF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JPn8L5pl; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JPn8L5pl"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396672b2569so342590a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 05:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790683252; x=1791288052; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QWUpAqO5ec6hk4vz5DUCH783/H2wNYB/eKZdjTV55HU=;
        b=JPn8L5plTJIe8s3WxZDJ04Dbk7V+qYg+YMwTZ1Ey+KycpmTyyStf0bJXKeVDNjQjrz
         otP2uVcqmy6vRubxpSfUT8aQTTimKiU2bwqZMusdjenpnJVdrv51frbchSD9Lrbx5F4H
         4hZ5LCx4jCoaeEZFIyQmiAEMI4QKqTn0tbWkkYhV+lztKFY1Ke2PMwJCxOlNn09bxYHu
         BFPhgmqp+jZAEXeW1cbWpsSeia9emEGW3STQKUqlddmrNQztyu4Bam/nr1FSgsPGaee/
         wDYmls8ZJcetMtvyktLZ/8hIQdmkHdF4ivFqL7DaoRuNiFJifedCyxdXXnWxonTlR2QB
         NN9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790683252; x=1791288052;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QWUpAqO5ec6hk4vz5DUCH783/H2wNYB/eKZdjTV55HU=;
        b=K2u69kLyIxZYNnWqh+qjvMIKNyQori7JitXWHQ3debtjo8ZuTpU9HsQOpUkQuZaKCf
         8iGmIDJD7wMUhhIQswX+EdbIOEBsJNibvnIXgdFrotqF1v6KyggcyWwNV6oWlPkstKy2
         fLU1n7Ww+4KWy1XCw1DskAJLyXd4NXmjh0TYtcY003kdRdHKDCNo0qtiWsT8ih/ykze1
         shUKei08FBf8EADXnBjfj+jmPxRf9/hIxv7OBmEy0NynRKZX6LvAUkuuL8BpuT6xYwtw
         QAZ/yNu01pdK8xA1uOSQx75idVqo6SRG59+N2J+WCwlggEqF1tMpME8PGfVCetsOdmsA
         jvEA==
X-Forwarded-Encrypted: i=1; AKwUvBxp5sJRB5oD/2xJDnNjbrUw0etpPma0uBFe9TvrPIoOiCxnoI2Q51v+9ktGkcYNhHdK39IA5+Wcazvp2Vg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKFX9cv+n2trjFNnSo5DIiUvq96KVXns7zVexGA8ZNDIXZ5gabZ
	9eq+vc75z50CmtkknjtGZPY8sJ7HFm//ouchUSEWtuoWivTlLvMzGjAB
X-Gm-Gg: AYBFou0v8DGFoR2DjdxrPi8rnu4jQoun76YwaPsZv7w6eFzsrEECrMGpmDWIE28MEYo
	PX1fAYSzhwBVrFVbEslFSWWu3C1Uv+dMpX3GBi3UFIIAsNp+egIFcxFr5rRTSz6obrrWkU1TZdp
	VlSVt0FuIDcQYHnKnGoinO5GGYoJen5ifgI5UmHMfviaVZKiT/nn4xO7M2LAq2MkWoKTx4IMYjx
	PJH9uT9bYR/EDtbxpD1e8zsQYF95aa12mEpk+tVvQwiur0PsI/HINZlQKouPhz31XPAZEdiMRdl
	t/LqxdQuLnWQKnDzZ2dr1MWQCzYWpZCgyyVCdxzRZTbi6UMYmPWmu47qQqbKV9xRbivVbtWWbOB
	LA0xv0r2vGL4eIe7ssvy7Y37S1kjXZqsgbhrYGXc+mh563uU8Q8cgTYCeuOHUxAm3jfDacPOr0v
	15PdSGYmTkeDb3G2H32+XhzgOGMwfSqgKbEk9nm+XJ+gwmPkNMK61CB4vLAd3yWTXhIR8zYCl9q
	2R0vynyd7Oy6rs0xt//acLPmSppVL9vbGEA27RDwR3OmSCHxXsV/V4GsA==
X-Received: by 2002:a17:903:3910:b0:2e2:ce6f:4688 with SMTP id d9443c01a7336-2e2ce6f5c98mr13624305ad.1.1790683252173;
        Tue, 29 Sep 2026 05:00:52 -0700 (PDT)
Received: from chenyou.. ([140.116.39.229])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df9142969esm55882605ad.45.2026.09.29.05.00.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 05:00:51 -0700 (PDT)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: corbet@lwn.net,
	alexs@kernel.org
Cc: dzm91@hust.edu.cn,
	wy@wyuan.org,
	si.yanteng@linux.dev,
	srcres258@furdevs.cn,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andy Deng <theandy.deng@gmail.com>,
	Bailu Lin <bailu.lin@vivo.com>,
	Bernard Zhao <bernard@vivo.com>,
	Bryan Wu <bryan.wu@analog.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Chucheng Luo <luochucheng@vivo.com>,
	Dave Martin <Dave.Martin@arm.com>,
	Dave Young <hidave.darkstar@gmail.com>,
	Dongsheng Song <dongshneg.song@gmail.com>,
	"Eric W . Biederman" <ebiederm@xmission.com>,
	Eugene Teo <eugeneteo@kernel.sg>,
	Fu Wei <tekkamanninja@gmail.com>,
	Fu Wei <wefu@redhat.com>,
	gao chao <gaochao49@huawei.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hailong Liu <liu.hailong6@zte.com.cn>,
	Harry Wei <harryxiyou@gmail.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Hu Haowen <2023002089@link.tyut.edu.cn>,
	Junhua Huang <huang.junhua@zte.com.cn>,
	Kangkai Yin <e12051@motorola.com>,
	Leigang Zang <zangleigang@hisilicon.com>,
	Li Yang <leoyang.li@nxp.com>,
	Li Zefan <lizf@cn.fujitsu.com>,
	Maggie Chen <chenqi@beyondsoft.com>,
	Nicolas Pitre <nico@fluxnic.net>,
	Punit Agrawal <punitagrawal@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Tang Yizhou <tangyeechou@gmail.com>,
	TripleX Chung <xxx.phy@gmail.com>,
	Wang Chen <wangchen@cn.fujitsu.com>,
	Wang Cong <xiyou.wangcong@gmail.com>,
	Wang Wenhu <wenhu.wang@vivo.com>,
	Wan Jiabing <wanjiabing@vivo.com>,
	wheelz <kernel.zeng@gmail.com>,
	Will Deacon <will@kernel.org>,
	Wu XiangCheng <bobwxc@email.cn>,
	Xiaochen Wang <wangxiaochen0@gmail.com>,
	Xudong Guan <xudong.guan@gmail.com>,
	xu xin <xu.xin16@zte.com.cn>,
	yaxinsn <yaxinsn@163.com>,
	Yinglin Luan <synmyth@gmail.com>,
	Zhang Le <r0bertz@gentoo.org>,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH v2 3/7] docs/zh_TW: arch: remove maintainer contact information
Date: Tue, 29 Sep 2026 19:59:51 +0800
Message-ID: <20260929115956.229610-4-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260929115956.229610-1-chenyou910331@gmail.com>
References: <20260929115956.229610-1-chenyou910331@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Remove the contact and credit information from the arch/ translations.
MAINTAINERS records who looks after zh_TW, and nearly all of the names
here are those of the zh_CN translators whose work this tree was
converted from.

arch/ has the most varied shapes.  The reStructuredText files carry
:翻譯: or :Translator: fields, or in four arm64 files a bare
"Translator:" line without the leading colon.  The plain-text arm and
arm64 files carry a legacy header: from it, drop the M:, zh_CN:,
zh_TW:, Maintainer:, Chinese maintainer: and Traditional Chinese
maintainer: lines, including the English maintainers they list, and
the Chinese lines that repeat them.  The C: lines and the Chinese notes
recording the commit each translation was made from are kept, as is
the rest of the header.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
 Documentation/translations/zh_TW/arch/arm/Booting     |  7 -------
 .../zh_TW/arch/arm/kernel_user_helpers.txt            | 10 ----------
 Documentation/translations/zh_TW/arch/arm64/amu.rst   |  3 ---
 .../translations/zh_TW/arch/arm64/booting.txt         |  8 --------
 .../translations/zh_TW/arch/arm64/elf_hwcaps.rst      |  3 ---
 .../translations/zh_TW/arch/arm64/hugetlbpage.rst     |  3 ---
 Documentation/translations/zh_TW/arch/arm64/index.rst |  2 --
 .../zh_TW/arch/arm64/legacy_instructions.txt          | 11 -----------
 .../translations/zh_TW/arch/arm64/memory.txt          |  9 ---------
 Documentation/translations/zh_TW/arch/arm64/perf.rst  |  3 ---
 .../translations/zh_TW/arch/arm64/silicon-errata.txt  |  8 --------
 .../translations/zh_TW/arch/arm64/tagged-pointers.txt |  9 ---------
 .../translations/zh_TW/arch/loongarch/booting.rst     |  4 ----
 .../translations/zh_TW/arch/loongarch/features.rst    |  1 -
 .../translations/zh_TW/arch/loongarch/index.rst       |  1 -
 .../zh_TW/arch/loongarch/introduction.rst             |  1 -
 .../zh_TW/arch/loongarch/irq-chip-model.rst           |  1 -
 .../translations/zh_TW/arch/mips/booting.rst          |  4 ----
 .../translations/zh_TW/arch/mips/features.rst         |  4 ----
 Documentation/translations/zh_TW/arch/mips/index.rst  |  4 ----
 .../translations/zh_TW/arch/mips/ingenic-tcu.rst      |  4 ----
 .../translations/zh_TW/arch/openrisc/index.rst        |  4 ----
 .../zh_TW/arch/openrisc/openrisc_port.rst             |  4 ----
 .../translations/zh_TW/arch/openrisc/todo.rst         |  4 ----
 .../translations/zh_TW/arch/parisc/debugging.rst      |  4 ----
 .../translations/zh_TW/arch/parisc/index.rst          |  4 ----
 .../translations/zh_TW/arch/parisc/registers.rst      |  4 ----
 27 files changed, 124 deletions(-)

diff --git a/Documentation/translations/zh_TW/arch/arm/Booting b/Documentation/translations/zh_TW/arch/arm/Booting
index a5375f262de2..4d60be5401c1 100644
--- a/Documentation/translations/zh_TW/arch/arm/Booting
+++ b/Documentation/translations/zh_TW/arch/arm/Booting
@@ -6,8 +6,6 @@ communicating in English you can also ask the Chinese maintainer for
 help.  Contact the Chinese maintainer if this translation is outdated
 or if there is a problem with the translation.
 
-Maintainer: Russell King <linux@arm.linux.org.uk>
-Chinese maintainer: Fu Wei <tekkamanninja@gmail.com>
 ---------------------------------------------------------------------
 Documentation/arch/arm/booting.rst 的中文翻譯
 
@@ -15,11 +13,6 @@ Documentation/arch/arm/booting.rst 的中文翻譯
 交流有困難的話，也可以向中文版維護者求助。如果本翻譯更新不及時或者翻
 譯存在問題，請聯繫中文版維護者。
 
-英文版維護者： Russell King <linux@arm.linux.org.uk>
-中文版維護者： 傅煒  Fu Wei <tekkamanninja@gmail.com>
-中文版翻譯者： 傅煒  Fu Wei <tekkamanninja@gmail.com>
-中文版校譯者： 傅煒  Fu Wei <tekkamanninja@gmail.com>
-
 以下爲正文
 ---------------------------------------------------------------------
 
diff --git a/Documentation/translations/zh_TW/arch/arm/kernel_user_helpers.txt b/Documentation/translations/zh_TW/arch/arm/kernel_user_helpers.txt
index 4c0bff97af31..fd7fcc361d23 100644
--- a/Documentation/translations/zh_TW/arch/arm/kernel_user_helpers.txt
+++ b/Documentation/translations/zh_TW/arch/arm/kernel_user_helpers.txt
@@ -6,22 +6,12 @@ communicating in English you can also ask the Chinese maintainer for
 help.  Contact the Chinese maintainer if this translation is outdated
 or if there is a problem with the translation.
 
-Maintainer: Nicolas Pitre <nicolas.pitre@linaro.org>
-		Dave Martin <dave.martin@linaro.org>
-Chinese maintainer: Fu Wei <tekkamanninja@gmail.com>
 ---------------------------------------------------------------------
 Documentation/arch/arm/kernel_user_helpers.rst 的中文翻譯
 
 如果想評論或更新本文的內容，請直接聯繫原文檔的維護者。如果你使用英文
 交流有困難的話，也可以向中文版維護者求助。如果本翻譯更新不及時或者翻
 譯存在問題，請聯繫中文版維護者。
-英文版維護者： Nicolas Pitre <nicolas.pitre@linaro.org>
-		Dave Martin <dave.martin@linaro.org>
-中文版維護者： 傅煒 Fu Wei <tekkamanninja@gmail.com>
-中文版翻譯者： 傅煒 Fu Wei <tekkamanninja@gmail.com>
-中文版校譯者： 宋冬生 Dongsheng Song <dongshneg.song@gmail.com>
-		傅煒 Fu Wei <tekkamanninja@gmail.com>
-
 
 以下爲正文
 ---------------------------------------------------------------------
diff --git a/Documentation/translations/zh_TW/arch/arm64/amu.rst b/Documentation/translations/zh_TW/arch/arm64/amu.rst
index 3726c1671ab6..edea336b323d 100644
--- a/Documentation/translations/zh_TW/arch/arm64/amu.rst
+++ b/Documentation/translations/zh_TW/arch/arm64/amu.rst
@@ -4,9 +4,6 @@
 
 :Original: :ref:`Documentation/arch/arm64/amu.rst <amu_index>`
 
-Translator: Bailu Lin <bailu.lin@vivo.com>
-            Hu Haowen <2023002089@link.tyut.edu.cn>
-
 ==================================
 AArch64 Linux 中擴展的活動監控單元
 ==================================
diff --git a/Documentation/translations/zh_TW/arch/arm64/booting.txt b/Documentation/translations/zh_TW/arch/arm64/booting.txt
index f1ac96370ace..2972d10562db 100644
--- a/Documentation/translations/zh_TW/arch/arm64/booting.txt
+++ b/Documentation/translations/zh_TW/arch/arm64/booting.txt
@@ -8,9 +8,6 @@ communicating in English you can also ask the Chinese maintainer for
 help.  Contact the Chinese maintainer if this translation is outdated
 or if there is a problem with the translation.
 
-M:	Will Deacon <will.deacon@arm.com>
-zh_CN:	Fu Wei <wefu@redhat.com>
-zh_TW:	Hu Haowen <2023002089@link.tyut.edu.cn>
 C:	55f058e7574c3615dea4615573a19bdb258696c6
 ---------------------------------------------------------------------
 Documentation/arch/arm64/booting.rst 的中文翻譯
@@ -19,11 +16,6 @@ Documentation/arch/arm64/booting.rst 的中文翻譯
 交流有困難的話，也可以向中文版維護者求助。如果本翻譯更新不及時或者翻
 譯存在問題，請聯繫中文版維護者。
 
-英文版維護者： Will Deacon <will.deacon@arm.com>
-中文版維護者： 傅煒  Fu Wei <wefu@redhat.com>
-中文版翻譯者： 傅煒  Fu Wei <wefu@redhat.com>
-中文版校譯者： 傅煒  Fu Wei <wefu@redhat.com>
-繁體中文版校譯者： 胡皓文  Hu Haowen <2023002089@link.tyut.edu.cn>
 本文翻譯提交時的 Git 檢出點爲： 55f058e7574c3615dea4615573a19bdb258696c6
 
 以下爲正文
diff --git a/Documentation/translations/zh_TW/arch/arm64/elf_hwcaps.rst b/Documentation/translations/zh_TW/arch/arm64/elf_hwcaps.rst
index cada25303e8d..66b7c6f8ef39 100644
--- a/Documentation/translations/zh_TW/arch/arm64/elf_hwcaps.rst
+++ b/Documentation/translations/zh_TW/arch/arm64/elf_hwcaps.rst
@@ -4,9 +4,6 @@
 
 :Original: :ref:`Documentation/arch/arm64/elf_hwcaps.rst <elf_hwcaps_index>`
 
-Translator: Bailu Lin <bailu.lin@vivo.com>
-            Hu Haowen <2023002089@link.tyut.edu.cn>
-
 ================
 ARM64 ELF hwcaps
 ================
diff --git a/Documentation/translations/zh_TW/arch/arm64/hugetlbpage.rst b/Documentation/translations/zh_TW/arch/arm64/hugetlbpage.rst
index b6849935e028..ad747f9e1916 100644
--- a/Documentation/translations/zh_TW/arch/arm64/hugetlbpage.rst
+++ b/Documentation/translations/zh_TW/arch/arm64/hugetlbpage.rst
@@ -4,9 +4,6 @@
 
 :Original: :ref:`Documentation/arch/arm64/hugetlbpage.rst <hugetlbpage_index>`
 
-Translator: Bailu Lin <bailu.lin@vivo.com>
-            Hu Haowen <2023002089@link.tyut.edu.cn>
-
 =====================
 ARM64中的 HugeTLBpage
 =====================
diff --git a/Documentation/translations/zh_TW/arch/arm64/index.rst b/Documentation/translations/zh_TW/arch/arm64/index.rst
index 86014346792e..279873b25a25 100644
--- a/Documentation/translations/zh_TW/arch/arm64/index.rst
+++ b/Documentation/translations/zh_TW/arch/arm64/index.rst
@@ -3,8 +3,6 @@
 .. include:: ../../disclaimer-zh_TW.rst
 
 :Original: :ref:`Documentation/arch/arm64/index.rst <arm64_index>`
-:Translator: Bailu Lin <bailu.lin@vivo.com>
-             Hu Haowen <2023002089@link.tyut.edu.cn>
 
 .. _tw_arm64_index:
 
diff --git a/Documentation/translations/zh_TW/arch/arm64/legacy_instructions.txt b/Documentation/translations/zh_TW/arch/arm64/legacy_instructions.txt
index 5c664555a71a..722205848431 100644
--- a/Documentation/translations/zh_TW/arch/arm64/legacy_instructions.txt
+++ b/Documentation/translations/zh_TW/arch/arm64/legacy_instructions.txt
@@ -8,10 +8,6 @@ communicating in English you can also ask the Chinese maintainer for
 help.  Contact the Chinese maintainer if this translation is outdated
 or if there is a problem with the translation.
 
-Maintainer: Punit Agrawal <punit.agrawal@arm.com>
-            Suzuki K. Poulose <suzuki.poulose@arm.com>
-Chinese maintainer: Fu Wei <wefu@redhat.com>
-Traditional Chinese maintainer: Hu Haowen <2023002089@link.tyut.edu.cn>
 ---------------------------------------------------------------------
 Documentation/arch/arm64/legacy_instructions.rst 的中文翻譯
 
@@ -21,13 +17,6 @@ Documentation/arch/arm64/legacy_instructions.rst 的中文翻譯
 
 本文翻譯提交時的 Git 檢出點爲： bc465aa9d045feb0e13b4a8f32cc33c1943f62d6
 
-英文版維護者： Punit Agrawal <punit.agrawal@arm.com>
-            Suzuki K. Poulose <suzuki.poulose@arm.com>
-中文版維護者： 傅煒  Fu Wei <wefu@redhat.com>
-中文版翻譯者： 傅煒  Fu Wei <wefu@redhat.com>
-中文版校譯者： 傅煒  Fu Wei <wefu@redhat.com>
-繁體中文版校譯者：胡皓文  Hu Haowen <2023002089@link.tyut.edu.cn>
-
 以下爲正文
 ---------------------------------------------------------------------
 Linux 內核在 arm64 上的移植提供了一個基礎框架，以支持構架中正在被淘汰或已廢棄指令的模擬執行。
diff --git a/Documentation/translations/zh_TW/arch/arm64/memory.txt b/Documentation/translations/zh_TW/arch/arm64/memory.txt
index 6ee2239c293f..a606f856bcee 100644
--- a/Documentation/translations/zh_TW/arch/arm64/memory.txt
+++ b/Documentation/translations/zh_TW/arch/arm64/memory.txt
@@ -8,9 +8,6 @@ communicating in English you can also ask the Chinese maintainer for
 help.  Contact the Chinese maintainer if this translation is outdated
 or if there is a problem with the translation.
 
-Maintainer: Catalin Marinas <catalin.marinas@arm.com>
-Chinese maintainer: Fu Wei <wefu@redhat.com>
-Traditional Chinese maintainer: Hu Haowen <2023002089@link.tyut.edu.cn>
 ---------------------------------------------------------------------
 Documentation/arch/arm64/memory.rst 的中文翻譯
 
@@ -20,12 +17,6 @@ Documentation/arch/arm64/memory.rst 的中文翻譯
 
 本文翻譯提交時的 Git 檢出點爲： bc465aa9d045feb0e13b4a8f32cc33c1943f62d6
 
-英文版維護者： Catalin Marinas <catalin.marinas@arm.com>
-中文版維護者： 傅煒  Fu Wei <wefu@redhat.com>
-中文版翻譯者： 傅煒  Fu Wei <wefu@redhat.com>
-中文版校譯者： 傅煒  Fu Wei <wefu@redhat.com>
-繁體中文版校譯者： 胡皓文  Hu Haowen <2023002089@link.tyut.edu.cn>
-
 以下爲正文
 ---------------------------------------------------------------------
 		     Linux 在 AArch64 中的內存佈局
diff --git a/Documentation/translations/zh_TW/arch/arm64/perf.rst b/Documentation/translations/zh_TW/arch/arm64/perf.rst
index ce083ba63872..a91d43e69b49 100644
--- a/Documentation/translations/zh_TW/arch/arm64/perf.rst
+++ b/Documentation/translations/zh_TW/arch/arm64/perf.rst
@@ -4,9 +4,6 @@
 
 :Original: :ref:`Documentation/arch/arm64/perf.rst <perf_index>`
 
-Translator: Bailu Lin <bailu.lin@vivo.com>
-            Hu Haowen <2023002089@link.tyut.edu.cn>
-
 =============
 Perf 事件屬性
 =============
diff --git a/Documentation/translations/zh_TW/arch/arm64/silicon-errata.txt b/Documentation/translations/zh_TW/arch/arm64/silicon-errata.txt
index 16d73b6c309f..4b1c9cb8e019 100644
--- a/Documentation/translations/zh_TW/arch/arm64/silicon-errata.txt
+++ b/Documentation/translations/zh_TW/arch/arm64/silicon-errata.txt
@@ -8,9 +8,6 @@ communicating in English you can also ask the Chinese maintainer for
 help.  Contact the Chinese maintainer if this translation is outdated
 or if there is a problem with the translation.
 
-M:	Will Deacon <will.deacon@arm.com>
-zh_CN:	Fu Wei <wefu@redhat.com>
-zh_TW:	Hu Haowen <2023002089@link.tyut.edu.cn>
 C:	1926e54f115725a9248d0c4c65c22acaf94de4c4
 ---------------------------------------------------------------------
 Documentation/arch/arm64/silicon-errata.rst 的中文翻譯
@@ -19,11 +16,6 @@ Documentation/arch/arm64/silicon-errata.rst 的中文翻譯
 交流有困難的話，也可以向中文版維護者求助。如果本翻譯更新不及時或者翻
 譯存在問題，請聯繫中文版維護者。
 
-英文版維護者： Will Deacon <will.deacon@arm.com>
-中文版維護者： 傅煒  Fu Wei <wefu@redhat.com>
-中文版翻譯者： 傅煒  Fu Wei <wefu@redhat.com>
-中文版校譯者： 傅煒  Fu Wei <wefu@redhat.com>
-繁體中文版校譯者： 胡皓文  Hu Haowen <2023002089@link.tyut.edu.cn>
 本文翻譯提交時的 Git 檢出點爲： 1926e54f115725a9248d0c4c65c22acaf94de4c4
 
 以下爲正文
diff --git a/Documentation/translations/zh_TW/arch/arm64/tagged-pointers.txt b/Documentation/translations/zh_TW/arch/arm64/tagged-pointers.txt
index e86ffa893ef6..3779858b065f 100644
--- a/Documentation/translations/zh_TW/arch/arm64/tagged-pointers.txt
+++ b/Documentation/translations/zh_TW/arch/arm64/tagged-pointers.txt
@@ -8,9 +8,6 @@ communicating in English you can also ask the Chinese maintainer for
 help.  Contact the Chinese maintainer if this translation is outdated
 or if there is a problem with the translation.
 
-Maintainer: Will Deacon <will.deacon@arm.com>
-Chinese maintainer: Fu Wei <wefu@redhat.com>
-Traditional Chinese maintainer: Hu Haowen <2023002089@link.tyut.edu.cn>
 ---------------------------------------------------------------------
 Documentation/arch/arm64/tagged-pointers.rst 的中文翻譯
 
@@ -18,12 +15,6 @@ Documentation/arch/arm64/tagged-pointers.rst 的中文翻譯
 交流有困難的話，也可以向中文版維護者求助。如果本翻譯更新不及時或者翻
 譯存在問題，請聯繫中文版維護者。
 
-英文版維護者： Will Deacon <will.deacon@arm.com>
-中文版維護者： 傅煒  Fu Wei <wefu@redhat.com>
-中文版翻譯者： 傅煒  Fu Wei <wefu@redhat.com>
-中文版校譯者： 傅煒  Fu Wei <wefu@redhat.com>
-繁體中文版校譯者： 胡皓文  Hu Haowen <2023002089@link.tyut.edu.cn>
-
 以下爲正文
 ---------------------------------------------------------------------
 		Linux 在 AArch64 中帶標記的虛擬地址
diff --git a/Documentation/translations/zh_TW/arch/loongarch/booting.rst b/Documentation/translations/zh_TW/arch/loongarch/booting.rst
index 88291090cea1..cc9610322742 100644
--- a/Documentation/translations/zh_TW/arch/loongarch/booting.rst
+++ b/Documentation/translations/zh_TW/arch/loongarch/booting.rst
@@ -4,10 +4,6 @@
 
 :Original: Documentation/arch/loongarch/booting.rst
 
-:翻譯:
-
- 司延騰 Yanteng Si <siyanteng@loongson.cn>
-
 ====================
 啓動 Linux/LoongArch
 ====================
diff --git a/Documentation/translations/zh_TW/arch/loongarch/features.rst b/Documentation/translations/zh_TW/arch/loongarch/features.rst
index c2175fd32b54..667f33030430 100644
--- a/Documentation/translations/zh_TW/arch/loongarch/features.rst
+++ b/Documentation/translations/zh_TW/arch/loongarch/features.rst
@@ -3,7 +3,6 @@
 .. include:: ../../disclaimer-zh_TW.rst
 
 :Original: Documentation/arch/loongarch/features.rst
-:Translator: Huacai Chen <chenhuacai@loongson.cn>
 
 .. kernel-feat:: features loongarch
 
diff --git a/Documentation/translations/zh_TW/arch/loongarch/index.rst b/Documentation/translations/zh_TW/arch/loongarch/index.rst
index 7281e050fe1c..7371f35326c1 100644
--- a/Documentation/translations/zh_TW/arch/loongarch/index.rst
+++ b/Documentation/translations/zh_TW/arch/loongarch/index.rst
@@ -3,7 +3,6 @@
 .. include:: ../../disclaimer-zh_TW.rst
 
 :Original: Documentation/arch/loongarch/index.rst
-:Translator: Huacai Chen <chenhuacai@loongson.cn>
 
 =================
 LoongArch體系結構
diff --git a/Documentation/translations/zh_TW/arch/loongarch/introduction.rst b/Documentation/translations/zh_TW/arch/loongarch/introduction.rst
index a5603f9b0a1b..1184bae117d7 100644
--- a/Documentation/translations/zh_TW/arch/loongarch/introduction.rst
+++ b/Documentation/translations/zh_TW/arch/loongarch/introduction.rst
@@ -3,7 +3,6 @@
 .. include:: ../../disclaimer-zh_TW.rst
 
 :Original: Documentation/arch/loongarch/introduction.rst
-:Translator: Huacai Chen <chenhuacai@loongson.cn>
 
 =============
 LoongArch介紹
diff --git a/Documentation/translations/zh_TW/arch/loongarch/irq-chip-model.rst b/Documentation/translations/zh_TW/arch/loongarch/irq-chip-model.rst
index dbe9595bbf16..89f4facc1a12 100644
--- a/Documentation/translations/zh_TW/arch/loongarch/irq-chip-model.rst
+++ b/Documentation/translations/zh_TW/arch/loongarch/irq-chip-model.rst
@@ -3,7 +3,6 @@
 .. include:: ../../disclaimer-zh_TW.rst
 
 :Original: Documentation/arch/loongarch/irq-chip-model.rst
-:Translator: Huacai Chen <chenhuacai@loongson.cn>
 
 ==================================
 LoongArch的IRQ芯片模型（層級關係）
diff --git a/Documentation/translations/zh_TW/arch/mips/booting.rst b/Documentation/translations/zh_TW/arch/mips/booting.rst
index 7e104abf5a51..43958df77efe 100644
--- a/Documentation/translations/zh_TW/arch/mips/booting.rst
+++ b/Documentation/translations/zh_TW/arch/mips/booting.rst
@@ -4,10 +4,6 @@
 
 :Original: Documentation/arch/mips/booting.rst
 
-:翻譯:
-
- 司延騰 Yanteng Si <siyanteng@loongson.cn>
-
 .. _tw_booting:
 
 BMIPS設備樹引導
diff --git a/Documentation/translations/zh_TW/arch/mips/features.rst b/Documentation/translations/zh_TW/arch/mips/features.rst
index 3d3906c4d08e..d5f2d3129614 100644
--- a/Documentation/translations/zh_TW/arch/mips/features.rst
+++ b/Documentation/translations/zh_TW/arch/mips/features.rst
@@ -4,10 +4,6 @@
 
 :Original: Documentation/arch/mips/features.rst
 
-:翻譯:
-
- 司延騰 Yanteng Si <siyanteng@loongson.cn>
-
 .. _tw_features:
 
 .. kernel-feat:: features mips
diff --git a/Documentation/translations/zh_TW/arch/mips/index.rst b/Documentation/translations/zh_TW/arch/mips/index.rst
index 4b7d28806489..832a5e9ee413 100644
--- a/Documentation/translations/zh_TW/arch/mips/index.rst
+++ b/Documentation/translations/zh_TW/arch/mips/index.rst
@@ -4,10 +4,6 @@
 
 :Original: Documentation/arch/mips/index.rst
 
-:翻譯:
-
- 司延騰 Yanteng Si <siyanteng@loongson.cn>
-
 ===========================
 MIPS特性文檔
 ===========================
diff --git a/Documentation/translations/zh_TW/arch/mips/ingenic-tcu.rst b/Documentation/translations/zh_TW/arch/mips/ingenic-tcu.rst
index 4385c0f3e9cd..fc74f474593d 100644
--- a/Documentation/translations/zh_TW/arch/mips/ingenic-tcu.rst
+++ b/Documentation/translations/zh_TW/arch/mips/ingenic-tcu.rst
@@ -4,10 +4,6 @@
 
 :Original: Documentation/arch/mips/ingenic-tcu.rst
 
-:翻譯:
-
- 司延騰 Yanteng Si <siyanteng@loongson.cn>
-
 .. _tw_ingenic-tcu:
 
 ===============================================
diff --git a/Documentation/translations/zh_TW/arch/openrisc/index.rst b/Documentation/translations/zh_TW/arch/openrisc/index.rst
index 7585960783fc..7d852d37cc4e 100644
--- a/Documentation/translations/zh_TW/arch/openrisc/index.rst
+++ b/Documentation/translations/zh_TW/arch/openrisc/index.rst
@@ -4,10 +4,6 @@
 
 :Original: Documentation/arch/openrisc/index.rst
 
-:翻譯:
-
- 司延騰 Yanteng Si <siyanteng@loongson.cn>
-
 .. _tw_openrisc_index:
 
 =================
diff --git a/Documentation/translations/zh_TW/arch/openrisc/openrisc_port.rst b/Documentation/translations/zh_TW/arch/openrisc/openrisc_port.rst
index a1e4517dc601..7d6dcf29eb7d 100644
--- a/Documentation/translations/zh_TW/arch/openrisc/openrisc_port.rst
+++ b/Documentation/translations/zh_TW/arch/openrisc/openrisc_port.rst
@@ -2,10 +2,6 @@
 
 :Original: Documentation/arch/openrisc/openrisc_port.rst
 
-:翻譯:
-
- 司延騰 Yanteng Si <siyanteng@loongson.cn>
-
 .. _tw_openrisc_port:
 
 ==============
diff --git a/Documentation/translations/zh_TW/arch/openrisc/todo.rst b/Documentation/translations/zh_TW/arch/openrisc/todo.rst
index df261b9e3002..89bb852c5d00 100644
--- a/Documentation/translations/zh_TW/arch/openrisc/todo.rst
+++ b/Documentation/translations/zh_TW/arch/openrisc/todo.rst
@@ -2,10 +2,6 @@
 
 :Original: Documentation/arch/openrisc/todo.rst
 
-:翻譯:
-
- 司延騰 Yanteng Si <siyanteng@loongson.cn>
-
 .. _tw_openrisc_todo.rst:
 
 ========
diff --git a/Documentation/translations/zh_TW/arch/parisc/debugging.rst b/Documentation/translations/zh_TW/arch/parisc/debugging.rst
index c9ee804aebbd..a58cf3aa534a 100644
--- a/Documentation/translations/zh_TW/arch/parisc/debugging.rst
+++ b/Documentation/translations/zh_TW/arch/parisc/debugging.rst
@@ -2,10 +2,6 @@
 
 :Original: Documentation/arch/parisc/debugging.rst
 
-:翻譯:
-
- 司延騰 Yanteng Si <siyanteng@loongson.cn>
-
 .. _tw_parisc_debugging:
 
 =================
diff --git a/Documentation/translations/zh_TW/arch/parisc/index.rst b/Documentation/translations/zh_TW/arch/parisc/index.rst
index 35941bf68c88..a08e0329383d 100644
--- a/Documentation/translations/zh_TW/arch/parisc/index.rst
+++ b/Documentation/translations/zh_TW/arch/parisc/index.rst
@@ -3,10 +3,6 @@
 
 :Original: Documentation/arch/parisc/index.rst
 
-:翻譯:
-
- 司延騰 Yanteng Si <siyanteng@loongson.cn>
-
 .. _tw_parisc_index:
 
 ====================
diff --git a/Documentation/translations/zh_TW/arch/parisc/registers.rst b/Documentation/translations/zh_TW/arch/parisc/registers.rst
index 695acb21134a..ea9b8df9314d 100644
--- a/Documentation/translations/zh_TW/arch/parisc/registers.rst
+++ b/Documentation/translations/zh_TW/arch/parisc/registers.rst
@@ -2,10 +2,6 @@
 
 :Original: Documentation/arch/parisc/registers.rst
 
-:翻譯:
-
- 司延騰 Yanteng Si <siyanteng@loongson.cn>
-
 .. _tw_parisc_registers:
 
 =========================
-- 
2.43.0

