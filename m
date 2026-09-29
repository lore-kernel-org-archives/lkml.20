Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13C7251AFD7
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 12:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790683287; cv=none; b=tnZRJVNrg79gR2OTEmmKFo/J14l9z621bRl0bwo/xn9KVLjV3cZfc6PBADPh77bmITUpmzj3IUD3kytEYSMwmDqOqC9KuylfW1JTjiVesy72TH1fUZCG1i6bpfgM+GFQJHjj3tgSbp88cMdJMju0XpDn8sFkWd6vfks6kSypYO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790683287; c=relaxed/simple;
	bh=VQaqGQIv00z3bli0O2b9Zt5MgjRnp3TmLL+ifd8WRXM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GNVS1r7zOl/e0wQbdqXQFa9wEcXsK3qMDcLdPQCa5Z96l7TXcQNi7rTSKinihOQxmK2ihM2eWl10JQKk4pyB36+G3VtikMGHlwPYM/+436rDAycUXeaI4+U5f7xBQm12OtkU4d4q3/XQu9BEX575pb/m4109kcOUo0atlZWEsZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BGQv7lbI; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BGQv7lbI"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2db425c8ff1so3246585ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 05:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790683285; x=1791288085; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8Gx5OZt2UOanbMe3zvUzKk4QJtMIOfw+wk7PnnrRslA=;
        b=BGQv7lbICIcv6y8h3DoqK+yCUMJz+NsRUWs6ptqJaRBYHsu4VDRAyXOIV/XlqDA4dK
         w2lvLkLILQhuw6jg/d2PETxJ+skf3HS4uq0cspwvzRFjJIPJDX7nL/84YqgDpF/b3YrK
         WMWlUbRaqvdXevHQCkFqKtcS7JUX0//NL5U+Qyyti9/axV8zkuFoalDEupIDCkkVnRjg
         6Cs/lF4N2BZ/vD1emP8BrAp4/Fe3n+GfAE3XmkTk1QZ2wkbb/gM9WcB9bMsaNFvdXYij
         bl805zqhqVtk28/SwzanarG7n88sdBnlU/8knm3/OYNEekEog0BIfdUI43ENUPX7wFgh
         oayQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790683285; x=1791288085;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8Gx5OZt2UOanbMe3zvUzKk4QJtMIOfw+wk7PnnrRslA=;
        b=BO0GiwQKnYazyJHyzR21lrt+JzCVtkXyfS7G+g4hkd9FpZCw9G171VVcF1+2Mypf0X
         b3k1mTYL9Zsel5bSbqDA/Axe72V0+ftsNTq9AzwN7KbDZYGgV/H3vIiAqAtP2Ys1LXOc
         FKqIeaRRs1XyG7ZeaBf9a4Y86xVv9kCO1m15FCpujNmhfP9rYkjnaUnmXwKxWcQMzJxF
         ui2H/1JAbthf5z7VvxnS3rU6IKwT3GxRYVSjL6RHKVVskVHrCbo9xXLzYl8D8pFTriq5
         sMeiXK+nRDbT9DfLEKJPml6LmlWgLv3YKAwAeGwe9vcmtQmtctGYrv2coCiYvEi3Ib3M
         VdGw==
X-Forwarded-Encrypted: i=1; AKwUvByk9j89+wr5a+Z7LthkfxhMNL/Nal5ePDbn7i//02T/s/KSVJQ+6LCprDQ3y1q0ClwRA/QRiS//18vBq0c=@vger.kernel.org
X-Gm-Message-State: AFq9FYIEfcr4M/vrE70yf8+BjONJfN0pY3s+iS9Y3uLklOEEOVLcf7kk
	4Z4FsIidpW7mTGX/6MA99B5GOJMb3kyt2v3Aj1xx+03zq9S0vyiRWLQ5
X-Gm-Gg: AYBFou2LINg0Bp7XSJmxJLwN2+GRtNOMws6gpNIokJTE9phzg3RRDTOdFkNO0dwBYCa
	ubl/BM/GgMxISdXUArflrkF5PmCUkUotNpS3ep3RE5mqEg03Xxc4ezzLcnQp7QuNgHm+5iKzoeW
	Vo/yYZ7KoIk2M9nxXHm/nwee6niEa9kSxwQe9DgntOznQ9jfFb3fBBRq1M7cTR9C/myHhjXWPwN
	xmCsysPwuMUnslwsvLZAWeW3RHIFB45JkfV7s8+8vNd/ny9uV2FrsOloHrCrRvPMi+Q9G1PbBps
	XZwJ/TI22PfclgEjPthUphWNr6P+gjWdFSHDdejtxFob4JcFnnCUXeGgLnsvEDKTn8cOaLxoJVI
	1SprRTULiQeqWx6eqMmlUu/mG/4nQZWH2PMdhK8nltIZi/7bk1cBb+gZ/1jLD4mIlUuykLbhmRE
	NUl++jJfRKEJMDJhVCfw3AaxaAkRGFr/BH70sNP2Jr8hxgqdzpb86VLF/MCXkAAvp1v1Z5pVALU
	H37GnbwJhwhXtB/TISYgaL3xFRtUVlbmjhR5gI3dOqbjVHRh0wVThzdyg==
X-Received: by 2002:a17:902:ccc3:b0:2d6:ea11:f642 with SMTP id d9443c01a7336-2df7dab1f2fmr196700575ad.1.1790683285329;
        Tue, 29 Sep 2026 05:01:25 -0700 (PDT)
Received: from chenyou.. ([140.116.39.229])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df9142969esm55882605ad.45.2026.09.29.05.01.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 05:01:24 -0700 (PDT)
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
Subject: [PATCH v2 6/7] docs/zh_TW: cpu-freq: remove maintainer contact information
Date: Tue, 29 Sep 2026 19:59:54 +0800
Message-ID: <20260929115956.229610-7-chenyou910331@gmail.com>
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

Remove the :翻譯: and :校譯: blocks from the cpu-freq/ translations.
They name the translators and reviewers of the zh_CN documents these
files were converted from; MAINTAINERS records who looks after zh_TW.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
 Documentation/translations/zh_TW/cpu-freq/core.rst        | 8 --------
 Documentation/translations/zh_TW/cpu-freq/cpu-drivers.rst | 8 --------
 .../translations/zh_TW/cpu-freq/cpufreq-stats.rst         | 8 --------
 Documentation/translations/zh_TW/cpu-freq/index.rst       | 4 ----
 4 files changed, 28 deletions(-)

diff --git a/Documentation/translations/zh_TW/cpu-freq/core.rst b/Documentation/translations/zh_TW/cpu-freq/core.rst
index 4f98d1e9f34b..8a2c835b5c50 100644
--- a/Documentation/translations/zh_TW/cpu-freq/core.rst
+++ b/Documentation/translations/zh_TW/cpu-freq/core.rst
@@ -3,14 +3,6 @@
 
 :Original: Documentation/cpu-freq/core.rst
 
-:翻譯:
-
- 司延騰 Yanteng Si <siyanteng@loongson.cn>
-
-:校譯:
-
- 唐藝舟 Tang Yizhou <tangyeechou@gmail.com>
-
 ====================================
 CPUFreq核心和CPUFreq通知器的通用說明
 ====================================
diff --git a/Documentation/translations/zh_TW/cpu-freq/cpu-drivers.rst b/Documentation/translations/zh_TW/cpu-freq/cpu-drivers.rst
index 7f751a7add56..0e4ae51916d3 100644
--- a/Documentation/translations/zh_TW/cpu-freq/cpu-drivers.rst
+++ b/Documentation/translations/zh_TW/cpu-freq/cpu-drivers.rst
@@ -4,14 +4,6 @@
 
 :Original: Documentation/cpu-freq/cpu-drivers.rst
 
-:翻譯:
-
- 司延騰 Yanteng Si <siyanteng@loongson.cn>
-
-:校譯:
-
- 唐藝舟 Tang Yizhou <tangyeechou@gmail.com>
-
 =======================================
 如何實現一個新的CPUFreq處理器驅動程序？
 =======================================
diff --git a/Documentation/translations/zh_TW/cpu-freq/cpufreq-stats.rst b/Documentation/translations/zh_TW/cpu-freq/cpufreq-stats.rst
index 01ec8c837fe9..dbaa9df781e3 100644
--- a/Documentation/translations/zh_TW/cpu-freq/cpufreq-stats.rst
+++ b/Documentation/translations/zh_TW/cpu-freq/cpufreq-stats.rst
@@ -4,14 +4,6 @@
 
 :Original: Documentation/cpu-freq/cpufreq-stats.rst
 
-:翻譯:
-
- 司延騰 Yanteng Si <siyanteng@loongson.cn>
-
-:校譯:
-
- 唐藝舟 Tang Yizhou <tangyeechou@gmail.com>
-
 ==========================================
 sysfs CPUFreq Stats的一般說明
 ==========================================
diff --git a/Documentation/translations/zh_TW/cpu-freq/index.rst b/Documentation/translations/zh_TW/cpu-freq/index.rst
index a9df16870b21..c32c618dd972 100644
--- a/Documentation/translations/zh_TW/cpu-freq/index.rst
+++ b/Documentation/translations/zh_TW/cpu-freq/index.rst
@@ -4,10 +4,6 @@
 
 :Original: Documentation/cpu-freq/index.rst
 
-:翻譯:
-
- 司延騰 Yanteng Si <siyanteng@loongson.cn>
-
 .. _tw_index.rst:
 
 =======================================================
-- 
2.43.0

