Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45ECC3ED5B6
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 12:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790683265; cv=none; b=odRY6OKt+G6iCfdJMQYQDsKnGBuAzE26L9AWiDt8E4rj5k+IsCoHwof6paFCIlYWSN88YNPuL5N9ZA8BdH0MMAxbCyh5l8BuS17sYn11T7U913LOD9bEmByA8s5GdecwZ+sd7uNkMNqThuBKT2QyPrYfZqAVuNyWzCEn/2cAsRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790683265; c=relaxed/simple;
	bh=EefEiGHTBEWe6vlhp7yvBUWxVgC2lwSRq+1qS1qRe/Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=myVl2COZ9Ut9h5407pTvnocY0pabTcsyrkDVzyU0ZP0Imwbr/8YiFMNhwVMnN33gjt1HjJWERX+ZpXrvUB4preUQCOCkrg24CtU1cFnEZHV1No7jXmJQC+ekD8JJg++hKUDemzSnEI73BNl+IE68D+EnOaVH58NO6VP9ayXWAGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gO6HMcUn; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gO6HMcUn"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d6ff23d82eso3126505ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 05:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790683263; x=1791288063; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jJDD9IoswwAgGNzNN6AqXg47pprIDsuobgglsU08RAA=;
        b=gO6HMcUnwBTZ3AYXPKo31xMTDTDK5xEXPG/4iixSfxCh6mimodcvYWFdMuxujvGySR
         bSyg8Kqik0LS6SBdO1MfEW1ra9GE01gsWUZePqpZM9kltxsYKTjH4sBg1alGZqmfBPjn
         nVk9SpkEzYWsoQjSMQFZE5jdtpXZmQaS5Ps4/eVLRwyBDkusDIxYxJwD/OB37SONAKyj
         K/2pTzgVYUNu6RwQe/W0SIGHj69JseC1JH3C67UAzC42467OqAu0/YAlSQqBWuiuZL6+
         TfO1AjLJNBf9VP1vF0OJk0bLXVED+4VxycMwYdpa2Zis4C4eJ7HH2uaX3kUKvcJP3sLb
         HqOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790683263; x=1791288063;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jJDD9IoswwAgGNzNN6AqXg47pprIDsuobgglsU08RAA=;
        b=ZGkOcGanHl7xTrfMXTYkDJjy8Zkcx6UOL1H8mv+jitbYaQeV6mZDkVHPOLuN56qBts
         KaYbYLxqXerPZhHvKKvKb9Dre2SCIQ8/dz6Iq/VGcjCsHUUiI1bEU8wfBfn1c24oqMtw
         fDRumDIni6tlnIK6ijxXJ0DrOPQHrG9Xyloh3k58Zxq4DV31ZpNB100+NnvMgIeXOkjr
         GWBWT7dmqFXvJpYtIw/PZjIPenI/5IWIARchxBD/cMt8CuZBAjXg77wl/FcJFgCmTlV5
         dCO0nADGBEehrdRqoXSTFMDJhevDqcxIdQF2vI4KPY9+xB/LJf9aPzoEp97R3Jk8BvWL
         iTRw==
X-Forwarded-Encrypted: i=1; AKwUvBzU0N6Hqyikgae70OucP5bLCinXVN352s+cKNoD7Yz+IXaOp2Lliph9bsI2yA6P5bJqmB4mG1wWzfuqckc=@vger.kernel.org
X-Gm-Message-State: AFuF++k288Z7Ne0pLWiYyBO1QLJTIyZ8x5UUJXHoXP6rbWMwcnHR4oyb
	VxSDuSwtr+kwnPhXQ+J+OPCvIWNxsbeH75/FhUEjYRvSKSG1f/0Z6Zyp
X-Gm-Gg: AYBFou3k/kqVqg+cu3tebnYWxcgUolpqgQWJoxeYIEarHTKsuCKc/EpRJRpOVMjkrDP
	VZEAcnlEd1tkBwk8gqOBPE0IimnthcWiI5I9K7wC6nO8mF3CrypSXIu7FVFBGdevSyo3Bc2iUB9
	GKp0G1oFSzAIp6uR7c0Zwuxa4AFRKcTjdsNvdPArUk6Mvqf3YxgZueQOFPP5xYNQK2C3X2dVKWi
	p5i6SKdkN/HcaWf9Uuoxg05DFwsp5ctZ6Us7b0jROQ3zJe7X9o0+ZG+5NEy608iwZ1I4TGBFINq
	Thzvxl8I1+UtWsXI5FNcke8s426vunakta1SJhYtZulRyws380guVGfxv0t8/el6tmsWFLIp1eh
	TFoOqbWIkRahGfA8ToZw2mgVW3Oj7qntP+01yOmp8WKLeLWJ2R7CRAbqI4otMbNSQsHNB5o4JSc
	ARkZafDXEj+dSNXJ6O7lgBDOkENHajvIND5aBANRkoyLoEg+/YsCkfd5FTu0bQ+zZSnHVcFltt0
	jKLAGnex6BtO4UjpPEvnWpl/RiG4RoCY4+95Wme/YvrQNbB7mu4+VpDvw==
X-Received: by 2002:a17:903:1987:b0:2d9:2798:66d3 with SMTP id d9443c01a7336-2df7d728fc4mr201923575ad.0.1790683263491;
        Tue, 29 Sep 2026 05:01:03 -0700 (PDT)
Received: from chenyou.. ([140.116.39.229])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df9142969esm55882605ad.45.2026.09.29.05.00.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 05:01:02 -0700 (PDT)
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
Subject: [PATCH v2 4/7] docs/zh_TW: dev-tools: remove maintainer contact information
Date: Tue, 29 Sep 2026 19:59:52 +0800
Message-ID: <20260929115956.229610-5-chenyou910331@gmail.com>
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

Remove the :Translator: lines from the dev-tools/ translations, and the
Traditional Chinese maintainer lines from the plain-text header of
sparse.rst; the rest of that header is kept.  MAINTAINERS records who
looks after zh_TW, so the per-file copies only go stale.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
 Documentation/translations/zh_TW/dev-tools/gcov.rst          | 1 -
 .../translations/zh_TW/dev-tools/gdb-kernel-debugging.rst    | 1 -
 Documentation/translations/zh_TW/dev-tools/index.rst         | 1 -
 Documentation/translations/zh_TW/dev-tools/kasan.rst         | 1 -
 Documentation/translations/zh_TW/dev-tools/sparse.rst        | 5 -----
 .../translations/zh_TW/dev-tools/testing-overview.rst        | 1 -
 6 files changed, 10 deletions(-)

diff --git a/Documentation/translations/zh_TW/dev-tools/gcov.rst b/Documentation/translations/zh_TW/dev-tools/gcov.rst
index 39ac3fff44cd..69965427a51a 100644
--- a/Documentation/translations/zh_TW/dev-tools/gcov.rst
+++ b/Documentation/translations/zh_TW/dev-tools/gcov.rst
@@ -1,7 +1,6 @@
 .. include:: ../disclaimer-zh_TW.rst
 
 :Original: Documentation/dev-tools/gcov.rst
-:Translator: 趙軍奎 Bernard Zhao <bernard@vivo.com>
 
 在Linux內核裏使用gcov做代碼覆蓋率檢查
 =====================================
diff --git a/Documentation/translations/zh_TW/dev-tools/gdb-kernel-debugging.rst b/Documentation/translations/zh_TW/dev-tools/gdb-kernel-debugging.rst
index 4fd1757c3036..8faa87f26c6a 100644
--- a/Documentation/translations/zh_TW/dev-tools/gdb-kernel-debugging.rst
+++ b/Documentation/translations/zh_TW/dev-tools/gdb-kernel-debugging.rst
@@ -3,7 +3,6 @@
 .. include:: ../disclaimer-zh_TW.rst
 
 :Original: Documentation/process/debugging/gdb-kernel-debugging.rst
-:Translator: 高超 gao chao <gaochao49@huawei.com>
 
 通過gdb調試內核和模塊
 =====================
diff --git a/Documentation/translations/zh_TW/dev-tools/index.rst b/Documentation/translations/zh_TW/dev-tools/index.rst
index 0d38e5f80e54..915449762d1a 100644
--- a/Documentation/translations/zh_TW/dev-tools/index.rst
+++ b/Documentation/translations/zh_TW/dev-tools/index.rst
@@ -3,7 +3,6 @@
 .. include:: ../disclaimer-zh_TW.rst
 
 :Original: Documentation/dev-tools/index.rst
-:Translator: 趙軍奎 Bernard Zhao <bernard@vivo.com>
 
 ============
 內核開發工具
diff --git a/Documentation/translations/zh_TW/dev-tools/kasan.rst b/Documentation/translations/zh_TW/dev-tools/kasan.rst
index 27fb7645174d..7728b50aa4b6 100644
--- a/Documentation/translations/zh_TW/dev-tools/kasan.rst
+++ b/Documentation/translations/zh_TW/dev-tools/kasan.rst
@@ -3,7 +3,6 @@
 .. include:: ../disclaimer-zh_TW.rst
 
 :Original: Documentation/dev-tools/kasan.rst
-:Translator: 萬家兵 Wan Jiabing <wanjiabing@vivo.com>
 
 內核地址消毒劑(KASAN)
 =====================
diff --git a/Documentation/translations/zh_TW/dev-tools/sparse.rst b/Documentation/translations/zh_TW/dev-tools/sparse.rst
index 55f0ad2c0beb..7a3487a7b2c7 100644
--- a/Documentation/translations/zh_TW/dev-tools/sparse.rst
+++ b/Documentation/translations/zh_TW/dev-tools/sparse.rst
@@ -6,17 +6,12 @@ communicating in English you can also ask the Chinese maintainer for
 help.  Contact the Chinese maintainer if this translation is outdated
 or if there is a problem with the translation.
 
-Traditional Chinese maintainer: Hu Haowen <2023002089@link.tyut.edu.cn>
--------------------------------------------------------------------------
 Documentation/dev-tools/sparse.rst 的繁體中文翻譯
 
 如果想評論或更新本文的內容，請直接聯繫原文檔的維護者。如果你使用英文
 交流有困難的話，也可以向繁體中文版維護者求助。如果本翻譯更新不及時或
 者翻譯存在問題，請聯繫繁體中文版維護者。
 
-繁體中文版維護者： 胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
-繁體中文版翻譯者： 胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
-
 以下爲正文
 -------------------------------------------------------------------------
 
diff --git a/Documentation/translations/zh_TW/dev-tools/testing-overview.rst b/Documentation/translations/zh_TW/dev-tools/testing-overview.rst
index 3b08aad1da00..140f4f946833 100644
--- a/Documentation/translations/zh_TW/dev-tools/testing-overview.rst
+++ b/Documentation/translations/zh_TW/dev-tools/testing-overview.rst
@@ -3,7 +3,6 @@
 .. include:: ../disclaimer-zh_TW.rst
 
 :Original: Documentation/dev-tools/testing-overview.rst
-:Translator: 胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
 
 ============
 內核測試指南
-- 
2.43.0

