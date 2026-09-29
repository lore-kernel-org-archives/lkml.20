Received: from mail-pj2-f27.google.com (mail-pj2-f27.google.com [74.125.227.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AF0E51AFEF
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 12:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790683277; cv=none; b=EjqWV4iFhSCBH/AEG7fG7qgiT6WTwHTdOklpjSl2qnptMH95fdKgaxd08C+IuZA9LM9ByDyOdr04QfPtTsJp6C7StQMriPfFFcwoAq1wtwOE0u5H0u+j75rHG56KzkdbAyyEijcQI8XVC5ysJHlLhHhtbUzbHhQjOxtJXeiLuc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790683277; c=relaxed/simple;
	bh=vIDOCYTnu259SQITleiwRxJem2HFoM1pdL93tt/izHM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=M1Fl0LnyiV7e25M5CV4PlOC/z1hRXhK5+ECJVAmwWT2hrjBs4WKr8KdX/iqOhPFH2FpYV9SRjRvlU0KJPovmCJayqVoJXAC37wlpaEhktr0npYBMB3XTXiX6XwJX5hclFuhQA8aAHAm6xE92862j8Q9Qrwz8goViYaHNG59jwEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fS4I09ha; arc=none smtp.client-ip=74.125.227.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fS4I09ha"
Received: by mail-pj2-f27.google.com with SMTP id d9443c01a7336-2d6ff23d81cso2761805ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 05:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790683275; x=1791288075; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zuNp0QF5+TJLlDYg4fr24aC4I45ysF+3R8J5X7Towlc=;
        b=fS4I09ha777ocCWBpvKD8fkslPhcIg2XyTy9YWe1omFZPyfRN/dMVo6ph5b/ZyzytR
         HhFunsYq+7ubsP0Rz2sNQHcxXtZzIQElPy07lXaldhHeKdm5m3e4fm8H1YLsZyaLI0ZP
         0KOVG7RQBNCse4BOmlEyxBWxpdOxOu6WOIWqQ+vvgsotUghYKe3uSTnOamZYhp9nmGoi
         RzVq5Iw42P4SxOS8Y+vqH2z9QNAzn5h1lgB2Z1otmuLZE8wjohG/36qtLywlkAMxta6Y
         NmhgGKds1dclGiNgmb7X4GMKiXJ3eB3xObbX4Vq6GtFAfsqsHF15oW8Tf5knKws5lh4N
         Zdlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790683275; x=1791288075;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zuNp0QF5+TJLlDYg4fr24aC4I45ysF+3R8J5X7Towlc=;
        b=rsEOJb6HZB05Fvo0uNQNrHhH7Q2xpug/WtIDAyCjmazkdCv25bcGUSfUoXXFry8CXA
         RPfDAMxFndH/2vyuHCPhXFda/7pDNIkkHu73Fi+aWkqhyMKCRACvynQOfDJMrebE5raw
         pEN86MMx6mLus+OCyQxj/jFUw0SCLY2x4siQpnnziJlQQfl98eIsEgUraEvHe3W3G5rL
         cogUhsm2tH7pXGltUpYwHNaoaKCebS0bLQ5KMnFL6u7GEbjP2e73ixrqrTMBfgM36bai
         i+UyJ/H2dVLwnHAX7HCIdeqfTk5ToH9uaqSlw870DJROT71keKJR9OHvuUDuYfHQLucJ
         nifg==
X-Forwarded-Encrypted: i=1; AKwUvBy0K9RhJTlqLfDu6ZNyuPEKL5VVAY1jy42xCxV6s+DnHU6I9No7Hgiy1KB/MaCcH/GnPWyXKEVKCUa+A14=@vger.kernel.org
X-Gm-Message-State: AFq9FYIJILU+Qr/XIXon5Cfjwcycvec4yYmYCOm2sl0XwDWbFHEKl1wU
	tvdmpnHxx9Fq7VLNUrE0fF2Q2t7PAZj+Ag5HmbtLYcQsMqU/y7wd8onx
X-Gm-Gg: AYBFou21kyrnJLnOz56ya+LVFu6cG9w5tINh6JnRIBsxLKg3RZnxXCpPS2QGeaY46fe
	HPlJh8WIQSKS/28kRuw3aDAVIjY4+Fp9iMmdf1X40ei5vWGUuC4mavG3YqDHloavXMrtRR4quob
	t2s2sRUv42wewL8U9OCOY5rA57R8hdfP9mV+q4G3Rirh4dOW6XObKcX+bH/K+d8NTxDqzRL5UyQ
	YvYCXNUheO1LNY+hQ3TgY/nq6+qa/ximxDQuRHNngMqrWspNeQna9wCxccOk/XkB5x5IC8CX6kD
	tm6F49TeGTACylg/UgpHxoHMKkhc7BHipXPhqvKjAcvzJdrO6Byse++vAD7+bpjD99CNFQigesc
	JXYAIcI6Jvunl4WvcvUnVPI/1byb76qvhfa8E9biJzZ4DaAOXAka5z6CnQgOjKPhfrsfNjsD0xY
	P/wkX6COJbN+eDiqvqaWA/vFa0SweVsHodryAWQRXSu5n7wkcAQgFh6YPOtkYqy1EowdLNp/6/d
	3nhAfynzJEao28RkXXp1V/U46bxm/Pn4AzlmpkJkaijNYyKIbeak1/wgmF/fLlIN+B7Hg==
X-Received: by 2002:a17:902:e542:b0:2d6:3c1a:85ef with SMTP id d9443c01a7336-2df7dfc93c6mr198422455ad.4.1790683274658;
        Tue, 29 Sep 2026 05:01:14 -0700 (PDT)
Received: from chenyou.. ([140.116.39.229])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df9142969esm55882605ad.45.2026.09.29.05.01.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 05:01:14 -0700 (PDT)
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
Subject: [PATCH v2 5/7] docs/zh_TW: filesystems: remove maintainer contact information
Date: Tue, 29 Sep 2026 19:59:53 +0800
Message-ID: <20260929115956.229610-6-chenyou910331@gmail.com>
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

Remove the credit information from the filesystems/ translations: the
:Translator: field in index.rst, the 譯者 literal blocks in debugfs.rst
and virtiofs.rst, and the maintainer and translator lines in the
plain-text header of sysfs.txt, whose remaining header is kept.
MAINTAINERS records who looks after zh_TW, and the names here credit
the zh_CN translations this tree was converted from.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
 .../translations/zh_TW/filesystems/debugfs.rst         | 10 ----------
 Documentation/translations/zh_TW/filesystems/index.rst |  2 --
 Documentation/translations/zh_TW/filesystems/sysfs.txt | 10 ----------
 .../translations/zh_TW/filesystems/virtiofs.rst        |  8 --------
 4 files changed, 30 deletions(-)

diff --git a/Documentation/translations/zh_TW/filesystems/debugfs.rst b/Documentation/translations/zh_TW/filesystems/debugfs.rst
index cda7d0e18b9b..17e12fc57400 100644
--- a/Documentation/translations/zh_TW/filesystems/debugfs.rst
+++ b/Documentation/translations/zh_TW/filesystems/debugfs.rst
@@ -8,16 +8,6 @@
 Debugfs
 =======
 
-譯者
-::
-
-	中文版維護者： 羅楚成 Chucheng Luo <luochucheng@vivo.com>
-	中文版翻譯者： 羅楚成 Chucheng Luo <luochucheng@vivo.com>
-	中文版校譯者:  羅楚成 Chucheng Luo <luochucheng@vivo.com>
-	繁體中文版校譯者: 胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
-
-
-
 版權所有2020 羅楚成 <luochucheng@vivo.com>
 
 
diff --git a/Documentation/translations/zh_TW/filesystems/index.rst b/Documentation/translations/zh_TW/filesystems/index.rst
index 88f0e632bfe2..87307a291c8e 100644
--- a/Documentation/translations/zh_TW/filesystems/index.rst
+++ b/Documentation/translations/zh_TW/filesystems/index.rst
@@ -3,8 +3,6 @@
 .. include:: ../disclaimer-zh_TW.rst
 
 :Original: :ref:`Documentation/filesystems/index.rst <filesystems_index>`
-:Translator: Wang Wenhu <wenhu.wang@vivo.com>
-             Hu Haowen <2023002089@link.tyut.edu.cn>
 
 .. _tw_filesystems_index:
 
diff --git a/Documentation/translations/zh_TW/filesystems/sysfs.txt b/Documentation/translations/zh_TW/filesystems/sysfs.txt
index d1cee02ef1de..8509776dc3cc 100644
--- a/Documentation/translations/zh_TW/filesystems/sysfs.txt
+++ b/Documentation/translations/zh_TW/filesystems/sysfs.txt
@@ -8,22 +8,12 @@ communicating in English you can also ask the Chinese maintainer for
 help.  Contact the Chinese maintainer if this translation is outdated
 or if there is a problem with the translation.
 
-Maintainer: Patrick Mochel	<mochel@osdl.org>
-		Mike Murphy <mamurph@cs.clemson.edu>
-Chinese maintainer: Fu Wei <tekkamanninja@gmail.com>
 ---------------------------------------------------------------------
 Documentation/filesystems/sysfs.rst 的中文翻譯
 
 如果想評論或更新本文的內容，請直接聯繫原文檔的維護者。如果你使用英文
 交流有困難的話，也可以向中文版維護者求助。如果本翻譯更新不及時或者翻
 譯存在問題，請聯繫中文版維護者。
-英文版維護者： Patrick Mochel	<mochel@osdl.org>
-		Mike Murphy <mamurph@cs.clemson.edu>
-中文版維護者： 傅煒 Fu Wei <tekkamanninja@gmail.com>
-中文版翻譯者： 傅煒 Fu Wei <tekkamanninja@gmail.com>
-中文版校譯者： 傅煒 Fu Wei <tekkamanninja@gmail.com>
-繁體中文版校譯者：胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
-
 
 以下爲正文
 ---------------------------------------------------------------------
diff --git a/Documentation/translations/zh_TW/filesystems/virtiofs.rst b/Documentation/translations/zh_TW/filesystems/virtiofs.rst
index 704a0ee44fd2..f3a682094266 100644
--- a/Documentation/translations/zh_TW/filesystems/virtiofs.rst
+++ b/Documentation/translations/zh_TW/filesystems/virtiofs.rst
@@ -4,14 +4,6 @@
 
 :Original: :ref:`Documentation/filesystems/virtiofs.rst <virtiofs_index>`
 
-譯者
-::
-
-	中文版維護者： 王文虎 Wang Wenhu <wenhu.wang@vivo.com>
-	中文版翻譯者： 王文虎 Wang Wenhu <wenhu.wang@vivo.com>
-	中文版校譯者： 王文虎 Wang Wenhu <wenhu.wang@vivo.com>
-	繁體中文版校譯者：胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
-
 ===========================================
 virtiofs: virtio-fs 主機<->客機共享文件系統
 ===========================================
-- 
2.43.0

