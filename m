Received: from mail-pj2-f40.google.com (mail-pj2-f40.google.com [74.125.227.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E14AC501298
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 12:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790683298; cv=none; b=LHc+d67NCLeA3DPInG9h8ADj3YJXawXWYsL9CSBTsJOes0pNwhy8M01/5n+D6xQ6hSNi4AgObYqKjezYoNtVIX8hbwg8/thrGW1dP66yf4tEhqE3Cw0VuWPcoM3S4UrRUcXZF5DcLg5PvNATWnFTlJ6V9zmjS7+w4v1NiDQzgLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790683298; c=relaxed/simple;
	bh=ueUERe2+GcebFXc5czhxRoXfkEZTMQbewIufXfoYE6Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aNGGPGw8VPc0EBo4uhHtbewQ5DqR8oQs+uKZ5kJ6OlXiDE+i1KPmkqYujj97qTd7lbjJhRIhtRtqWfWgrGOeMgWDStDiNVZ0Uz54eENytxp8swgAOBBG+EmcP3EYWKQ9+W7npYlY/QfA9Xbt99nVrlx/nU7TCTN/xitBmD0s02I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iqDHLWGZ; arc=none smtp.client-ip=74.125.227.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iqDHLWGZ"
Received: by mail-pj2-f40.google.com with SMTP id d9443c01a7336-2df9f8c6f09so3753795ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 05:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790683296; x=1791288096; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0UTAj0QfCPjJmoqnY6xXW55LyqPC8ieAZfI5EvHkG0w=;
        b=iqDHLWGZhwPw9kL1EUIBz0WFWatD4WamesjWgmmrP9oTj8HMMEvYIw28tjWax2kECe
         TaClaGXPqAcqgwW9OFXUd2V90mCDGiOjOwcwLzJuMdSpidXHX5M2MOoNAJjr/WhVwhSZ
         lhdY0niewz+H9EBwYh34uO9kk1ZIeVlOsgDv4aUGDeB6FIj2w/9a7zoZGwnqNNQaIdzu
         lv3qucVH1ts1cAMaqO9lYDuqp6pBY/6TapZ2WxYsXNthKLy/1ypOfYuFe2+UBmp1YVm8
         iqgErNud8gY2l8IR9u6ei/xh13LpiqvVmN2wm6d9LSc4Ju+qzb+HMyXdC7TwUlIbfJq8
         U54g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790683296; x=1791288096;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0UTAj0QfCPjJmoqnY6xXW55LyqPC8ieAZfI5EvHkG0w=;
        b=Fpi5sxc4MC1wyt07b3GbnvcBrWUumAGfVMaVaW97dt18HlEHpTZgLymKyYwZy18MBb
         0MdraVsIDLRKpIWv2CGGX8K+yglQgylXerYo9hlYWnLUolUC8sIt8QKeRFQf7wdZHYES
         gbuY6qp+ZhD4pdnHDgAUogY9oIcTSV13wNPemZ1k9a2L+UeorACtGvNxbn2twfHbHHjg
         PP6Eoc4SMdsAqvAdbnOwOCryZAl/RW1QVqMUtcCyjdDj9D8c9P0QhMCm2QXhn7KqU1XN
         4LFeqrke+KAtbDjy36sWalBozsDYH5Jdwk4S3y+bRdqMMHzi6ierhMe7Uf6UXD5bJmwv
         Eozw==
X-Forwarded-Encrypted: i=1; AKwUvBwWWVR4v4jUSU7fvcYToMiCChaELfG9Bji+BQ2WtBa2sMIWfIYezdMaTWp3N2ybAaLOr4EKsxPhk4209aw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKKcf463MXOhmef6smPyoLAxEI4ds8g7Z0azj4vJoByLONy/T9n
	TJFVGj27XAMwbC92cUKs7HBrNGah/jAMUybgWxVvoz+Rsmlas4oCKtQ/
X-Gm-Gg: AYBFou0SpDZJRBnSjcHjRCk8VZkq+Cw9WlyGLhsCa0f3bojpBMyN2KCsGyGmjpzZMG7
	xcY2NYlET4RDKDGgnAWVWKtDp5O7faXIn/DEjz1nsXvuc180D/naXwPGLelY5s/3QojnWKcY2Ws
	yzw8oEeTGLahNxCTpFgukmPuLv7mswH9abAYMa8z3RPCK+N+m/d6VuqnVvFHEf010TgDArfJ4tB
	slx4kw98EXEI5UgiAxeTp+lb/Md70vDiEIS649UfXGU2FeLH0i86VR9EHy7Z2ndKNyKiZUDHlRe
	vVD4ic6xadN2D/Wi82ky3ov6gaxhjDxXAwDLHDUIe/BOhBuprbdspfqeD/q+mhxGynLKBW2vE85
	sdBTLikrLzeiiXhLk31kXzZzye15LeIMh06845UfTTv8Ae8vKY6ERDqVDz7deqnU1zGwMJsLHZ5
	3QcKC0zDE8SHukEicwx5kss14sW5UtkKeHGT3sUjqUF4EwYbcXpZWzY7Yizi71ZmiJMHwNXaTWO
	UXcN56gLH1oIrKrFDmUYaBAUzv1nNIIiClvoE9eW98WGHfAbdsb1BBf3Q==
X-Received: by 2002:a17:902:e550:b0:2df:8909:f719 with SMTP id d9443c01a7336-2df8e71a14amr173981465ad.3.1790683295669;
        Tue, 29 Sep 2026 05:01:35 -0700 (PDT)
Received: from chenyou.. ([140.116.39.229])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df9142969esm55882605ad.45.2026.09.29.05.01.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 05:01:35 -0700 (PDT)
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
Subject: [PATCH v2 7/7] docs/zh_TW: remove the last maintainer contact references
Date: Tue, 29 Sep 2026 19:59:55 +0800
Message-ID: <20260929115956.229610-8-chenyou910331@gmail.com>
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

disclaimer-zh_TW.rst is included by every zh_TW document.  It carried a
warning telling readers to send changes to "the maintainer (contact
details below)" and a note giving the previous zh_TW maintainer's name
and address, while index.rst asked contributors to send patches to that
same address.

Replace the warning and the note, which said much the same thing, with
a single note as disclaimer-zh_CN.rst has, pointing readers at the zh_TW
maintainers and reviewers in MAINTAINERS, and point index.rst there as
well.  Also drop the maintainer lines from the legacy headers of
IRQ.txt and io_ordering.txt.

Suggested-by: Weijie Yuan <wy@wyuan.org>
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
 Documentation/translations/zh_TW/IRQ.txt             |  8 --------
 .../translations/zh_TW/disclaimer-zh_TW.rst          | 12 ++++--------
 Documentation/translations/zh_TW/index.rst           |  2 +-
 Documentation/translations/zh_TW/io_ordering.txt     |  6 ------
 4 files changed, 5 insertions(+), 23 deletions(-)

diff --git a/Documentation/translations/zh_TW/IRQ.txt b/Documentation/translations/zh_TW/IRQ.txt
index 8115a7618307..b9a3e18495d2 100644
--- a/Documentation/translations/zh_TW/IRQ.txt
+++ b/Documentation/translations/zh_TW/IRQ.txt
@@ -6,8 +6,6 @@ communicating in English you can also ask the Chinese maintainer for
 help.  Contact the Chinese maintainer if this translation is outdated
 or if there is a problem with the translation.
 
-Maintainer: Eric W. Biederman <ebiederman@xmission.com>
-Traditional Chinese maintainer: Hu Haowen <2023002089@link.tyut.edu.cn>
 ---------------------------------------------------------------------
 Documentation/core-api/irq/index.rst 的繁體中文翻譯
 
@@ -15,12 +13,6 @@ Documentation/core-api/irq/index.rst 的繁體中文翻譯
 交流有困難的話，也可以向繁體中文版維護者求助。如果本翻譯更新不及時或
 者翻譯存在問題，請聯繫繁體中文版維護者。
 
-英文版維護者： Eric W. Biederman <ebiederman@xmission.com>
-繁體中文版維護者： 胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
-繁體中文版翻譯者： 胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
-繁體中文版校譯者： 胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
-
-
 以下爲正文
 ---------------------------------------------------------------------
 何爲 IRQ?
diff --git a/Documentation/translations/zh_TW/disclaimer-zh_TW.rst b/Documentation/translations/zh_TW/disclaimer-zh_TW.rst
index 28b734c223b6..ed7a8e6debee 100644
--- a/Documentation/translations/zh_TW/disclaimer-zh_TW.rst
+++ b/Documentation/translations/zh_TW/disclaimer-zh_TW.rst
@@ -1,11 +1,7 @@
 :orphan:
 
-.. warning::
-     此文件的目的是爲讓中文讀者更容易閱讀和理解，而不是作爲一個分支。因此，
-     如果您對此文件有任何意見或改動，請先嘗試更新原始英文文件。如果要更改或
-     修正某處翻譯文件，請將意見或補丁發送給維護者（聯繫方式見下）。
-
 .. note::
-     如果您發現本文檔與原始文件有任何不同或者有翻譯問題，請聯繫該文件的譯者，
-     或者發送電子郵件給胡皓文以獲取幫助：<2023002089@link.tyut.edu.cn>。
-
+     此文件的目的是讓中文讀者更容易閱讀與理解，而不是作為一個分支。
+     因此，如果您對此文件有任何意見或更新，請先嘗試更新原始英文文件。
+     如果您發現本文件與原始文件有任何不同，或有翻譯問題，請向繁體中文
+     文件的維護者與審閱者提交建議或補丁（見MAINTAINERS檔案）。
diff --git a/Documentation/translations/zh_TW/index.rst b/Documentation/translations/zh_TW/index.rst
index 95809012a9ef..fb86de03c423 100644
--- a/Documentation/translations/zh_TW/index.rst
+++ b/Documentation/translations/zh_TW/index.rst
@@ -15,7 +15,7 @@
 
 .. note::
    內核文檔繁體中文版的翻譯工作正在進行中。如果您願意並且有時間參與這項工
-   作，歡迎提交補丁給胡皓文 <2023002089@link.tyut.edu.cn>。
+   作，歡迎將補丁提交給繁體中文文件的維護者（見MAINTAINERS檔案）。
 
 與Linux 內核社區一起工作
 ------------------------
diff --git a/Documentation/translations/zh_TW/io_ordering.txt b/Documentation/translations/zh_TW/io_ordering.txt
index 00b374092d7e..8ced3f08e69d 100644
--- a/Documentation/translations/zh_TW/io_ordering.txt
+++ b/Documentation/translations/zh_TW/io_ordering.txt
@@ -6,7 +6,6 @@ communicating in English you can also ask the Chinese maintainer for
 help.  Contact the Chinese maintainer if this translation is outdated
 or if there is a problem with the translation.
 
-Traditional Chinese maintainer: Hu Haowen <2023002089@link.tyut.edu.cn>
 ---------------------------------------------------------------------
 Documentation/driver-api/io_ordering.rst 的繁體中文翻譯
 
@@ -14,11 +13,6 @@ Documentation/driver-api/io_ordering.rst 的繁體中文翻譯
 交流有困難的話，也可以向繁體中文版維護者求助。如果本翻譯更新不及時或
 者翻譯存在問題，請聯繫繁體中文版維護者。
 
-繁體中文版維護者： 胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
-繁體中文版翻譯者： 胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
-繁體中文版校譯者： 胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
-
-
 以下爲正文
 ---------------------------------------------------------------------
 
-- 
2.43.0

