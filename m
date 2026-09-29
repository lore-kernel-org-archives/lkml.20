Received: from mail-pj2-f40.google.com (mail-pj2-f40.google.com [74.125.227.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCB7E51AED6
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 12:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790683243; cv=none; b=ANXPeG7Dh8OIIAmwG4tK8YMwnn5fOJDHuztScmfQnEcuRAI78/xiSWs5Vh+M/B5bZNSjXHr8jqzcT0CIIrCI1DJUHHMSpqcmXZyUqaV1JDszmRiyKVxVuqFzyW5UVnXsGukIsJWM5/BJs8mJsZ/9bBf+cQZqvxWLWUPfsmh0cJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790683243; c=relaxed/simple;
	bh=S50S6QAkPDDQd1Ie1oDVzLgpB6L0Lb+Bzt0SSMTct+0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rVTCCtbsJCK6+oQJfcYxM1wdU2ME2gtSJ0jqtrLLO1dh+3Gk8n4kuUppkuaTKKQF54dQQrIt/YuTo91K1nHVfLw9L/V2JXG2paeQWgDWhG/gn3b/yyD+cvMiuKLdKOBKIzvIG2fQL11EUnFZieNA0k3/U2i4DvgfY4Iu6PBId6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IF2RmPrh; arc=none smtp.client-ip=74.125.227.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IF2RmPrh"
Received: by mail-pj2-f40.google.com with SMTP id 98e67ed59e1d1-3a2ada3f121so366912a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 05:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790683241; x=1791288041; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oIKO8m++9Swel7dtBupJFz0HHXsXZRG2dUY+2qj664c=;
        b=IF2RmPrhOvrT5r2wbd2Wo3Rr1L9uqY0cTtIe9euAJEwl0+kqMUFckRaZDYrcO3xrjW
         /ficsrpDd/hwl3fYsdY3nbQOmYoc+j/AdgIdRj1vQ8nBIyua2NEBhl780UhgpQK80GXW
         tyIf8I0AiDa8pseXc/EE/eJI1ds7m+DRhPt7yI4b9ps4a6X5DEPYzOLVNVzvTCj9ZXOy
         Hc0okOK5NKiXv74RWK7FB0diOcDuKwyrouG1E7XVC+YhqWzD3kxzhJzvLduOmjA4fwyZ
         VNsNtaFXVQnbjUsBubmWv9U4LJCsSZY0RywFkBRglrLv/0E5XlW84IzN+H7K8RLVvm0/
         SMXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790683241; x=1791288041;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oIKO8m++9Swel7dtBupJFz0HHXsXZRG2dUY+2qj664c=;
        b=ORTyh7+zQ/DRlymV8zGGYqNb6CURkC5VccHxpZZk0oFhxYabDIfTG7rsOH8gDmgHFD
         ThcIYGuc3cPDnIkMjiuBx7pbHpckivUbrC1YEz82XednMmg2CTGyWhFJyXfS6GyOMuvx
         13XhqBzpbZ/1JipC8MQ5CjAYhxoWIsjCsrKxOMN+DBWDDKXZSArnB0zxoPTKI45CPbEH
         zxHPeKQ+699SFAyE47fk0U+1VuhflEqAEefDeO08S3d8Cs2+gc8ASEQpR7fGQkBPpiAL
         FqhC2o4IqMJxo7JBOFh03SPdnStqZKOyCyJ4uMI8/DQ/yQO1kqXNuyap2MxZWcddb+Ky
         bzpA==
X-Forwarded-Encrypted: i=1; AKwUvBwZHiBZEB22ZfWpVnN6ZMLKhQjSdQxI+fgPLiaJp54D1sIxy8nZfVBoGNu/liVxc336bvb2cZFvov93XlM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLuFVFE+/c58Ur1xAmiyZ8xzndQviHoDSZN0KRCidMG6E7bHUXz
	a4LjKlSf5C/+t88jEBJiSeJvJPwb+G4L+KW2bglAP7fufDXNYzaFll7F
X-Gm-Gg: AYBFou2DZyT2eoiNymNgYcUjk8xIyN2XWbLM5hnpUYJnSMtAfVNuYw0MRM2k4hrs/i/
	1ZgUnJ9e1S7sL/ThU96b46GORiYHjmRtyQDaQapzdFi1YRZAy2CgUe3LEDx9KDIKWHEnEcmAV3Q
	5Xi3Z/kVn1o3AUvGFHPP3v2dNggMq+GgxhfkML11ZgYA2Tt/tvJ5CeWptL/11s0BwXIU3SlnwGM
	xBfiTy2ZOMWKfzGEFSinOn/7/1LOMrBq+VS4A4pUnAUYg/b+iE3cy8M2GISSSo8XBQJ32T69uVo
	zuHTs3sq+yfBuvYbHH4mV3/2Wp6ccBekdJTPmD0EAEHtdk1Fje+ycAp2JR4L9WxOUALRu5DJ1xf
	mxUWb9++YTg0Oep+80IRI15H7N72Bxihygokpniribv1n5i8V2z1gv2ZFVsGE73B/s3wWS1TxqJ
	U7qfUW3c2o1uaDYzH9HG53JLmy3t4kBpxIikqnidfgGtBLXx3F+moQjHCWquggp4snbqpjUUcKp
	lVDykGHuGPvsxy7mIn+jkhB9kpcXQnGZLfkC83V14QGnlJsU/X0MtjKaQ==
X-Received: by 2002:a17:903:19f0:b0:2d7:1a3f:8db5 with SMTP id d9443c01a7336-2df8e74a18cmr169835575ad.4.1790683240728;
        Tue, 29 Sep 2026 05:00:40 -0700 (PDT)
Received: from chenyou.. ([140.116.39.229])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df9142969esm55882605ad.45.2026.09.29.05.00.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 05:00:40 -0700 (PDT)
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
Subject: [PATCH v2 2/7] docs/zh_TW: admin-guide: remove maintainer contact information
Date: Tue, 29 Sep 2026 19:59:50 +0800
Message-ID: <20260929115956.229610-3-chenyou910331@gmail.com>
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

Remove the :翻譯:, :譯者:, :校譯: and :Translator: fields from the
admin-guide/ translations.  MAINTAINERS records who looks after zh_TW,
and the people named in these fields are the zh_CN translators whose
work this tree was converted from, not maintainers of the zh_TW text.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
 Documentation/translations/zh_TW/admin-guide/README.rst   | 5 -----
 .../translations/zh_TW/admin-guide/bootconfig.rst         | 2 --
 .../translations/zh_TW/admin-guide/bug-bisect.rst         | 5 -----
 .../translations/zh_TW/admin-guide/bug-hunting.rst        | 5 -----
 .../translations/zh_TW/admin-guide/clearing-warn-once.rst | 2 --
 Documentation/translations/zh_TW/admin-guide/cpu-load.rst | 2 --
 .../translations/zh_TW/admin-guide/cputopology.rst        | 4 ----
 Documentation/translations/zh_TW/admin-guide/index.rst    | 2 --
 Documentation/translations/zh_TW/admin-guide/init.rst     | 5 -----
 .../translations/zh_TW/admin-guide/lockup-watchdogs.rst   | 1 -
 .../translations/zh_TW/admin-guide/mm/damon/index.rst     | 6 ------
 .../translations/zh_TW/admin-guide/mm/damon/lru_sort.rst  | 6 ------
 .../translations/zh_TW/admin-guide/mm/damon/reclaim.rst   | 6 ------
 .../translations/zh_TW/admin-guide/mm/damon/start.rst     | 6 ------
 .../translations/zh_TW/admin-guide/mm/damon/usage.rst     | 6 ------
 Documentation/translations/zh_TW/admin-guide/mm/index.rst | 5 -----
 Documentation/translations/zh_TW/admin-guide/mm/ksm.rst   | 5 -----
 .../translations/zh_TW/admin-guide/reporting-issues.rst   | 6 ------
 .../zh_TW/admin-guide/reporting-regressions.rst           | 5 -----
 .../translations/zh_TW/admin-guide/security-bugs.rst      | 5 -----
 Documentation/translations/zh_TW/admin-guide/sysrq.rst    | 8 --------
 .../translations/zh_TW/admin-guide/tainted-kernels.rst    | 5 -----
 Documentation/translations/zh_TW/admin-guide/unicode.rst  | 5 -----
 23 files changed, 107 deletions(-)

diff --git a/Documentation/translations/zh_TW/admin-guide/README.rst b/Documentation/translations/zh_TW/admin-guide/README.rst
index 9be4915ae420..bf692cc7b867 100644
--- a/Documentation/translations/zh_TW/admin-guide/README.rst
+++ b/Documentation/translations/zh_TW/admin-guide/README.rst
@@ -4,11 +4,6 @@
 
 :Original: Documentation/admin-guide/README.rst
 
-:譯者:
-
- 吳想成 Wu XiangCheng <bobwxc@email.cn>
- 胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
-
 Linux內核6.x版本 <http://kernel.org/>
 =========================================
 
diff --git a/Documentation/translations/zh_TW/admin-guide/bootconfig.rst b/Documentation/translations/zh_TW/admin-guide/bootconfig.rst
index abac5aa60f67..e033c5bdd1eb 100644
--- a/Documentation/translations/zh_TW/admin-guide/bootconfig.rst
+++ b/Documentation/translations/zh_TW/admin-guide/bootconfig.rst
@@ -4,8 +4,6 @@
 
 :Original: Documentation/admin-guide/bootconfig.rst
 
-:譯者: 吳想成 Wu XiangCheng <bobwxc@email.cn>
-
 ========
 引導配置
 ========
diff --git a/Documentation/translations/zh_TW/admin-guide/bug-bisect.rst b/Documentation/translations/zh_TW/admin-guide/bug-bisect.rst
index 1efe913b8da0..3cec29682ce0 100644
--- a/Documentation/translations/zh_TW/admin-guide/bug-bisect.rst
+++ b/Documentation/translations/zh_TW/admin-guide/bug-bisect.rst
@@ -4,11 +4,6 @@
 
 :Original: :doc:`../../../admin-guide/bug-bisect`
 
-:譯者:
-
- 吳想成 Wu XiangCheng <bobwxc@email.cn>
- 胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
-
 二分（bisect）缺陷
 +++++++++++++++++++
 
diff --git a/Documentation/translations/zh_TW/admin-guide/bug-hunting.rst b/Documentation/translations/zh_TW/admin-guide/bug-hunting.rst
index c677dff826f5..f85baa0e97a8 100644
--- a/Documentation/translations/zh_TW/admin-guide/bug-hunting.rst
+++ b/Documentation/translations/zh_TW/admin-guide/bug-hunting.rst
@@ -4,11 +4,6 @@
 
 :Original: :doc:`../../../admin-guide/bug-hunting`
 
-:譯者:
-
- 吳想成 Wu XiangCheng <bobwxc@email.cn>
- 胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
-
 追蹤缺陷
 =========
 
diff --git a/Documentation/translations/zh_TW/admin-guide/clearing-warn-once.rst b/Documentation/translations/zh_TW/admin-guide/clearing-warn-once.rst
index a3e82ff9daac..95614600604c 100644
--- a/Documentation/translations/zh_TW/admin-guide/clearing-warn-once.rst
+++ b/Documentation/translations/zh_TW/admin-guide/clearing-warn-once.rst
@@ -2,8 +2,6 @@
 
 .. include:: ../disclaimer-zh_TW.rst
 
-:Translator: 胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
-
 清除 WARN_ONCE
 --------------
 
diff --git a/Documentation/translations/zh_TW/admin-guide/cpu-load.rst b/Documentation/translations/zh_TW/admin-guide/cpu-load.rst
index 4c25a2105b39..20ec5bcd5f18 100644
--- a/Documentation/translations/zh_TW/admin-guide/cpu-load.rst
+++ b/Documentation/translations/zh_TW/admin-guide/cpu-load.rst
@@ -2,8 +2,6 @@
 
 .. include:: ../disclaimer-zh_TW.rst
 
-:Translator: 胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
-
 ========
 CPU 負載
 ========
diff --git a/Documentation/translations/zh_TW/admin-guide/cputopology.rst b/Documentation/translations/zh_TW/admin-guide/cputopology.rst
index 5c46d1b3b065..7da38b685ae3 100644
--- a/Documentation/translations/zh_TW/admin-guide/cputopology.rst
+++ b/Documentation/translations/zh_TW/admin-guide/cputopology.rst
@@ -3,10 +3,6 @@
 
 :Original: Documentation/admin-guide/cputopology.rst
 
-:翻譯:
-
-  唐藝舟 Tang Yizhou <tangyeechou@gmail.com>
-
 ==========================
 如何通過sysfs將CPU拓撲導出
 ==========================
diff --git a/Documentation/translations/zh_TW/admin-guide/index.rst b/Documentation/translations/zh_TW/admin-guide/index.rst
index 9335c0e9105d..a6e8564ba68f 100644
--- a/Documentation/translations/zh_TW/admin-guide/index.rst
+++ b/Documentation/translations/zh_TW/admin-guide/index.rst
@@ -3,8 +3,6 @@
 .. include:: ../disclaimer-zh_TW.rst
 
 :Original: :doc:`../../../admin-guide/index`
-:Translator: Alex Shi <alex.shi@linux.alibaba.com>
-             胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
 
 Linux 內核用戶和管理員指南
 ==========================
diff --git a/Documentation/translations/zh_TW/admin-guide/init.rst b/Documentation/translations/zh_TW/admin-guide/init.rst
index 4cef1994c650..b68a5f58ce78 100644
--- a/Documentation/translations/zh_TW/admin-guide/init.rst
+++ b/Documentation/translations/zh_TW/admin-guide/init.rst
@@ -4,11 +4,6 @@
 
 :Original: :doc:`../../../admin-guide/init`
 
-:譯者:
-
- 吳想成 Wu XiangCheng <bobwxc@email.cn>
- 胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
-
 解釋“No working init found.”啓動掛起消息
 =========================================
 
diff --git a/Documentation/translations/zh_TW/admin-guide/lockup-watchdogs.rst b/Documentation/translations/zh_TW/admin-guide/lockup-watchdogs.rst
index f65b0c96e8e3..6c5282c62461 100644
--- a/Documentation/translations/zh_TW/admin-guide/lockup-watchdogs.rst
+++ b/Documentation/translations/zh_TW/admin-guide/lockup-watchdogs.rst
@@ -1,7 +1,6 @@
 .. include:: ../disclaimer-zh_TW.rst
 
 :Original: Documentation/admin-guide/lockup-watchdogs.rst
-:Translator: Hailong Liu <liu.hailong6@zte.com.cn>
 
 .. _tw_lockup-watchdogs:
 
diff --git a/Documentation/translations/zh_TW/admin-guide/mm/damon/index.rst b/Documentation/translations/zh_TW/admin-guide/mm/damon/index.rst
index a472eb3c708b..ed6eaca13ce1 100644
--- a/Documentation/translations/zh_TW/admin-guide/mm/damon/index.rst
+++ b/Documentation/translations/zh_TW/admin-guide/mm/damon/index.rst
@@ -3,12 +3,6 @@
 
 :Original: Documentation/admin-guide/mm/damon/index.rst
 
-:翻譯:
-
- 司延騰 Yanteng Si <siyanteng@loongson.cn>
-
-:校譯:
-
 ============
 監測數據訪問
 ============
diff --git a/Documentation/translations/zh_TW/admin-guide/mm/damon/lru_sort.rst b/Documentation/translations/zh_TW/admin-guide/mm/damon/lru_sort.rst
index 1ffc4b6b1d12..2a5b87f1e4f6 100644
--- a/Documentation/translations/zh_TW/admin-guide/mm/damon/lru_sort.rst
+++ b/Documentation/translations/zh_TW/admin-guide/mm/damon/lru_sort.rst
@@ -3,12 +3,6 @@
 
 :Original: Documentation/admin-guide/mm/damon/lru_sort.rst
 
-:翻譯:
-
- 臧雷剛 Leigang Zang <zangleigang@hisilicon.com>
-
-:校譯:
-
 ==================
 基於DAMON的LRU排序
 ==================
diff --git a/Documentation/translations/zh_TW/admin-guide/mm/damon/reclaim.rst b/Documentation/translations/zh_TW/admin-guide/mm/damon/reclaim.rst
index efed29c40e44..36145acdf9aa 100644
--- a/Documentation/translations/zh_TW/admin-guide/mm/damon/reclaim.rst
+++ b/Documentation/translations/zh_TW/admin-guide/mm/damon/reclaim.rst
@@ -3,12 +3,6 @@
 
 :Original: Documentation/admin-guide/mm/damon/reclaim.rst
 
-:翻譯:
-
- 司延騰 Yanteng Si <siyanteng@loongson.cn>
-
-:校譯:
-
 ===============
 基於DAMON的回收
 ===============
diff --git a/Documentation/translations/zh_TW/admin-guide/mm/damon/start.rst b/Documentation/translations/zh_TW/admin-guide/mm/damon/start.rst
index 57d36bfbb1b3..af16b730d13b 100644
--- a/Documentation/translations/zh_TW/admin-guide/mm/damon/start.rst
+++ b/Documentation/translations/zh_TW/admin-guide/mm/damon/start.rst
@@ -3,12 +3,6 @@
 
 :Original: Documentation/admin-guide/mm/damon/start.rst
 
-:翻譯:
-
- 司延騰 Yanteng Si <siyanteng@loongson.cn>
-
-:校譯:
-
 ========
 入門指南
 ========
diff --git a/Documentation/translations/zh_TW/admin-guide/mm/damon/usage.rst b/Documentation/translations/zh_TW/admin-guide/mm/damon/usage.rst
index d3fd4f850793..82633ec7d15f 100644
--- a/Documentation/translations/zh_TW/admin-guide/mm/damon/usage.rst
+++ b/Documentation/translations/zh_TW/admin-guide/mm/damon/usage.rst
@@ -3,12 +3,6 @@
 
 :Original: Documentation/admin-guide/mm/damon/usage.rst
 
-:翻譯:
-
- 司延騰 Yanteng Si <siyanteng@loongson.cn>
-
-:校譯:
-
 ========
 詳細用法
 ========
diff --git a/Documentation/translations/zh_TW/admin-guide/mm/index.rst b/Documentation/translations/zh_TW/admin-guide/mm/index.rst
index 0b04d925b68c..969780c9936a 100644
--- a/Documentation/translations/zh_TW/admin-guide/mm/index.rst
+++ b/Documentation/translations/zh_TW/admin-guide/mm/index.rst
@@ -2,11 +2,6 @@
 
 :Original:   Documentation/admin-guide/mm/index.rst
 
-:翻譯:
-
-  徐鑫 xu xin <xu.xin16@zte.com.cn>
-
-
 ========
 內存管理
 ========
diff --git a/Documentation/translations/zh_TW/admin-guide/mm/ksm.rst b/Documentation/translations/zh_TW/admin-guide/mm/ksm.rst
index 1b4944b3cf61..697545ae0fcd 100644
--- a/Documentation/translations/zh_TW/admin-guide/mm/ksm.rst
+++ b/Documentation/translations/zh_TW/admin-guide/mm/ksm.rst
@@ -2,11 +2,6 @@
 
 :Original: Documentation/admin-guide/mm/ksm.rst
 
-:翻譯:
-
-  徐鑫 xu xin <xu.xin16@zte.com.cn>
-
-
 ============
 內核同頁合併
 ============
diff --git a/Documentation/translations/zh_TW/admin-guide/reporting-issues.rst b/Documentation/translations/zh_TW/admin-guide/reporting-issues.rst
index 1d4e4c7a6750..dc2903570705 100644
--- a/Documentation/translations/zh_TW/admin-guide/reporting-issues.rst
+++ b/Documentation/translations/zh_TW/admin-guide/reporting-issues.rst
@@ -6,12 +6,6 @@
 
 :Original: Documentation/admin-guide/reporting-issues.rst
 
-:譯者:
-
- 吳想成 Wu XiangCheng <bobwxc@email.cn>
- 胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
-
-
 報告問題
 +++++++++
 
diff --git a/Documentation/translations/zh_TW/admin-guide/reporting-regressions.rst b/Documentation/translations/zh_TW/admin-guide/reporting-regressions.rst
index d7dcb2a26564..e85baccdb53b 100644
--- a/Documentation/translations/zh_TW/admin-guide/reporting-regressions.rst
+++ b/Documentation/translations/zh_TW/admin-guide/reporting-regressions.rst
@@ -5,11 +5,6 @@
 
 :Original: Documentation/admin-guide/reporting-regressions.rst
 
-:譯者:
-
- 吳想成 Wu XiangCheng <bobwxc@email.cn>
-
-
 ============
 報告迴歸問題
 ============
diff --git a/Documentation/translations/zh_TW/admin-guide/security-bugs.rst b/Documentation/translations/zh_TW/admin-guide/security-bugs.rst
index cfe1e58e116b..76a78746ca4e 100644
--- a/Documentation/translations/zh_TW/admin-guide/security-bugs.rst
+++ b/Documentation/translations/zh_TW/admin-guide/security-bugs.rst
@@ -4,11 +4,6 @@
 
 :Original: :doc:`../../../process/security-bugs`
 
-:譯者:
-
- 吳想成 Wu XiangCheng <bobwxc@email.cn>
- 胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
-
 安全缺陷
 =========
 
diff --git a/Documentation/translations/zh_TW/admin-guide/sysrq.rst b/Documentation/translations/zh_TW/admin-guide/sysrq.rst
index 4979e5d5405f..221f05807730 100644
--- a/Documentation/translations/zh_TW/admin-guide/sysrq.rst
+++ b/Documentation/translations/zh_TW/admin-guide/sysrq.rst
@@ -2,14 +2,6 @@
 
 :Original: Documentation/admin-guide/sysrq.rst
 
-:翻譯:
-
- 黃軍華 Junhua Huang <huang.junhua@zte.com.cn>
-
-:校譯:
-
- 司延騰 Yanteng Si <siyanteng@loongson.cn>
-
 .. _tw_admin-guide_sysrq:
 
 Linux 魔法系統請求鍵駭客
diff --git a/Documentation/translations/zh_TW/admin-guide/tainted-kernels.rst b/Documentation/translations/zh_TW/admin-guide/tainted-kernels.rst
index 0d8046576d04..cdfaccfbb4ae 100644
--- a/Documentation/translations/zh_TW/admin-guide/tainted-kernels.rst
+++ b/Documentation/translations/zh_TW/admin-guide/tainted-kernels.rst
@@ -4,11 +4,6 @@
 
 :Original: :doc:`../../../admin-guide/tainted-kernels`
 
-:譯者:
-
- 吳想成 Wu XiangCheng <bobwxc@email.cn>
- 胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
-
 受污染的內核
 -------------
 
diff --git a/Documentation/translations/zh_TW/admin-guide/unicode.rst b/Documentation/translations/zh_TW/admin-guide/unicode.rst
index f43edb2b5ed0..b9b57cc76d61 100644
--- a/Documentation/translations/zh_TW/admin-guide/unicode.rst
+++ b/Documentation/translations/zh_TW/admin-guide/unicode.rst
@@ -4,11 +4,6 @@
 
 :Original: Documentation/admin-guide/unicode.rst
 
-:譯者:
-
- 吳想成 Wu XiangCheng <bobwxc@email.cn>
- 胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
-
 Unicode（統一碼）支持
 ======================
 
-- 
2.43.0

