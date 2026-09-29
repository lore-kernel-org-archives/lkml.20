Received: from mail-pj2-f27.google.com (mail-pj2-f27.google.com [74.125.227.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F5D451A751
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 12:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790683232; cv=none; b=ZD6e2bcRGMwv0Q2LW2OYEeOvmravhmEJ6IrPNe6Cqx5AgQEOQGNwc1JoNL4dc74r3EEEZ61ksoWeeR5fHD2CrI8aImdceQh2RneKkyjeTb7AdVJhDnmJ5R8MGstaMCmpXvkHm6Pa8w8iDsRhjtMnGntmGHTHcwKZxNE4gpBw+BI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790683232; c=relaxed/simple;
	bh=n3i7pvYMv8v8tZIrkGRb8zS7KZMdOyRTb7fQP3XBVA0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Qsu2A1jkoTDU99NJ7n8uWN4ZOq3L/pPSJ07ACUBvZK291pc9fcE4l2DCPn5mCbDfBDYGYCWzBTHyBzvr9xUzpkC1YKocDmzL/LwJ9jhZNBOsU8dgm6vv7odmeQjjAo6zFevdPIGaHgm6Nd3WhdnGvrpXA1muccaeo+3wdHM+9IY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OZXaGq4t; arc=none smtp.client-ip=74.125.227.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OZXaGq4t"
Received: by mail-pj2-f27.google.com with SMTP id d9443c01a7336-2d6ff23d81cso2760775ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 05:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790683229; x=1791288029; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=N7AUTTUHLFtzPxsH8GxUbdJKUkT/ZXD0AugrBOTQegI=;
        b=OZXaGq4td7BMjIjlWQTSuJrnQV0kVSdcjbCQG2U4Dt8+7NnVSeINYHaYBQ0DGJapYT
         qSkUa9sNrW5W0KImiSZMNTFW0mPdhE2C6QyrEcbJesraIVaGay6bWU2Y/Z5QgYYc15Z5
         P8fEQpPqdEZ8As1mG8eVUc9UCEtc1b3iO+pa2q0TZzcJCAsKLc04jsCXK2E6VNj8OZV7
         I6lTVBNr95OTY2lbr8Nd0qhz0n8ZAvb1h2GEB3THYCZfh9wdaCdayxGxB8H5djOUJjp/
         ng8F0NYnQQ/jrm2iROTpTJNZZoniQlfqkK+VLUVAwg4FWxYFDz457RjSCi8jwlVH4zyE
         HsVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790683229; x=1791288029;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N7AUTTUHLFtzPxsH8GxUbdJKUkT/ZXD0AugrBOTQegI=;
        b=OPrGR+CFddCH0m5Pv8e8Uy4i9iS5K+q/WphgIWOeUeWo2J/j0TnPf1EPxcmeDhFPM3
         2GKEuNnbPJfiWm5HPQwYoX41MB7DYgJDqTrG4YLrzGSPTCsW+UUs8aWrBX2kwAlcBt3l
         v2wDkFeLn+93Oco38AhJMhs61vqReuHDsPhO9OKMlAOkFmVyjsgmhycOCNpLPKgqJdBI
         Q0Xm10bmPtjU/ERYjynfEbVzkIxs9h4ui9+WuJIWw29SkiN/5L0QFpSlIsxPNks3wVJs
         /thsuC3Em69un0nn/7NSRJnSsgXhIRADazq1cX0xNTvkC02jftcOCxDB9KfHc+qTHK8q
         T0UA==
X-Forwarded-Encrypted: i=1; AKwUvBxeOU4lr8we9VUyrFqSEwADF78dtPSRI96NNTDS1nchlwY2BOPUE/adYe+zoSmDXPHTxOzxNNPD0cfOqXg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLV9QIbSI4JB7YcQoCfqS21soPr8seVmHlYaIXYL49V3W8Vzqpx
	OuboCYBChoY341aWqUXjOACirkekah7V5ip4NagwjiguNkRViJYvJcg0
X-Gm-Gg: AYBFou1AwjxPJEKdHcqDhNa87xyEInL2j/f5zRdra2qE8gA4JtH9S7UnTG23qR3GZuh
	kNfuAdwSH0fX4oS5pI8KQPOKo3OLjWIH8r9OPlIbRpdrtj9qFOnPrHAaG6gUFj6UOZFVjhw05a8
	dgfvYX8bHUTXVlifa0LG7sUqrtWTLyldcg/omcIXuNoG7pOUUyaoWgox3YC/oLnrGn6Q4pafFbS
	A9TskgOHs7oTvpoUhN8+my43U6cqu5y1wzS6xdopK/osgJfoOJtjG2zjQJU19MsQgiKVmPnmsEc
	Mw5IIQMT+IG477i4puaRBd2lQ4GOS+hGYk9Qeaxvl80hN9afx/isQeHI2AGfhkK1pPgt8lZBXHs
	lj5y0NaeUo8dl3vka/Sxaaol7LZkVb1ZCMwFi2hvR2FBHfgnwJAcdON21I1PHPdy6q/Qt8r0Qtl
	ydyNlA7IYLtLaVx4pOuw3uuAxoWMI3ow0KAUOxcwLg62YVzOWvwt7azO0IvtqLVDJy0fGRGE7zu
	kjxxUk8xZpc6aLRusnypSqvpjOh7mfqSKzRgN9gGPwjqGwdyGahHIobiQhgyNEkMkch
X-Received: by 2002:a17:903:32cc:b0:2d8:f4d4:7044 with SMTP id d9443c01a7336-2df7deaa2femr213740105ad.3.1790683228486;
        Tue, 29 Sep 2026 05:00:28 -0700 (PDT)
Received: from chenyou.. ([140.116.39.229])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df9142969esm55882605ad.45.2026.09.29.05.00.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 05:00:27 -0700 (PDT)
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
Subject: [PATCH v2 1/7] docs/zh_TW: process: remove maintainer contact information
Date: Tue, 29 Sep 2026 19:59:49 +0800
Message-ID: <20260929115956.229610-2-chenyou910331@gmail.com>
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

The zh_TW translations repeat, file by file, contact information that
MAINTAINERS already records.  Those addresses keep going stale: the
listed zh_TW maintainer address alone appeared in 58 files, and there
have been three attempts to update it across the tree.  In the
MAINTAINERS discussion Jon Corbet concluded that, rather than rewriting
them all again, they should simply be removed.

Most of the names also credit the wrong work.  zh_TW was produced by
converting zh_CN and the credit blocks came across with the text, so
they name the simplified-Chinese translators; nearly every address
removed in this series also appears under
Documentation/translations/zh_CN/.

Start with process/, the largest area.  Remove the :Translator:, :譯者:
and :校譯: fields, the 譯者:: literal blocks in howto.rst and
stable-api-nonsense.rst, and the "contact the maintainer" paragraphs
that introduce the credits in magic-number.rst, stable-kernel-rules.rst
and volatile-considered-harmful.rst.  This includes the entries that the
recent process/ update added to fifteen of these blocks.  Attribution
for all of it stays in the git history.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
 .../translations/zh_TW/process/1.Intro.rst     | 10 ----------
 .../translations/zh_TW/process/2.Process.rst   | 10 ----------
 .../zh_TW/process/3.Early-stage.rst            |  9 ---------
 .../translations/zh_TW/process/4.Coding.rst    |  9 ---------
 .../translations/zh_TW/process/5.Posting.rst   | 10 ----------
 .../zh_TW/process/6.Followthrough.rst          |  9 ---------
 .../zh_TW/process/7.AdvancedTopics.rst         | 10 ----------
 .../zh_TW/process/8.Conclusion.rst             |  9 ---------
 .../process/code-of-conduct-interpretation.rst |  3 ---
 .../zh_TW/process/code-of-conduct.rst          |  2 --
 .../zh_TW/process/coding-style.rst             | 14 --------------
 .../zh_TW/process/development-process.rst      |  2 --
 .../zh_TW/process/email-clients.rst            | 12 ------------
 .../process/embargoed-hardware-issues.rst      |  3 ---
 .../translations/zh_TW/process/howto.rst       | 18 ------------------
 .../translations/zh_TW/process/index.rst       |  3 ---
 .../zh_TW/process/kernel-driver-statement.rst  |  2 --
 .../process/kernel-enforcement-statement.rst   |  2 --
 .../zh_TW/process/license-rules.rst            |  3 ---
 .../zh_TW/process/magic-number.rst             |  8 --------
 .../zh_TW/process/management-style.rst         |  2 --
 .../zh_TW/process/programming-language.rst     |  3 ---
 .../zh_TW/process/stable-api-nonsense.rst      | 10 ----------
 .../zh_TW/process/stable-kernel-rules.rst      | 12 ------------
 .../zh_TW/process/submit-checklist.rst         |  4 ----
 .../zh_TW/process/submitting-patches.rst       | 12 ------------
 .../process/volatile-considered-harmful.rst    | 12 ------------
 27 files changed, 203 deletions(-)

diff --git a/Documentation/translations/zh_TW/process/1.Intro.rst b/Documentation/translations/zh_TW/process/1.Intro.rst
index 2639ab99793f..65c5ae095504 100644
--- a/Documentation/translations/zh_TW/process/1.Intro.rst
+++ b/Documentation/translations/zh_TW/process/1.Intro.rst
@@ -4,16 +4,6 @@
 
 :Original: :ref:`Documentation/process/1.Intro.rst <development_process_intro>`
 
-:Translator:
-
- 時奎亮 Alex Shi <alex.shi@linux.alibaba.com>
-
-:校譯:
-
- 吳想成 Wu XiangCheng <bobwxc@email.cn>
- 胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
- 葉宸佑 Chen-Yu Yeh <chenyou910331@gmail.com>
-
 .. _tw_development_process_intro:
 
 引言
diff --git a/Documentation/translations/zh_TW/process/2.Process.rst b/Documentation/translations/zh_TW/process/2.Process.rst
index 36b109622ea6..cf9bd1b1444a 100644
--- a/Documentation/translations/zh_TW/process/2.Process.rst
+++ b/Documentation/translations/zh_TW/process/2.Process.rst
@@ -4,16 +4,6 @@
 
 :Original: :ref:`Documentation/process/2.Process.rst <development_process>`
 
-:Translator:
-
- 時奎亮 Alex Shi <alex.shi@linux.alibaba.com>
-
-:校譯:
-
- 吳想成 Wu XiangCheng <bobwxc@email.cn>
- 胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
- 葉宸佑 Chen-Yu Yeh <chenyou910331@gmail.com>
-
 .. _tw_development_process:
 
 開發流程如何進行
diff --git a/Documentation/translations/zh_TW/process/3.Early-stage.rst b/Documentation/translations/zh_TW/process/3.Early-stage.rst
index a58fc9e0ea99..7d7ecf9658e5 100644
--- a/Documentation/translations/zh_TW/process/3.Early-stage.rst
+++ b/Documentation/translations/zh_TW/process/3.Early-stage.rst
@@ -4,15 +4,6 @@
 
 :Original: :ref:`Documentation/process/3.Early-stage.rst <development_early_stage>`
 
-:Translator:
-
- 時奎亮 Alex Shi <alex.shi@linux.alibaba.com>
-
-:校譯:
-
- 吳想成 Wu XiangCheng <bobwxc@email.cn>
- 胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
-
 .. _tw_development_early_stage:
 
 早期規劃
diff --git a/Documentation/translations/zh_TW/process/4.Coding.rst b/Documentation/translations/zh_TW/process/4.Coding.rst
index 233e8718ed41..423d51f4b3de 100644
--- a/Documentation/translations/zh_TW/process/4.Coding.rst
+++ b/Documentation/translations/zh_TW/process/4.Coding.rst
@@ -4,15 +4,6 @@
 
 :Original: :ref:`Documentation/process/4.Coding.rst <development_coding>`
 
-:Translator:
-
- 時奎亮 Alex Shi <alex.shi@linux.alibaba.com>
-
-:校譯:
-
- 吳想成 Wu XiangCheng <bobwxc@email.cn>
- 胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
-
 .. _tw_development_coding:
 
 使代碼正確
diff --git a/Documentation/translations/zh_TW/process/5.Posting.rst b/Documentation/translations/zh_TW/process/5.Posting.rst
index 698cde5cd06d..d54b16364474 100644
--- a/Documentation/translations/zh_TW/process/5.Posting.rst
+++ b/Documentation/translations/zh_TW/process/5.Posting.rst
@@ -4,16 +4,6 @@
 
 :Original: :ref:`Documentation/process/5.Posting.rst <development_posting>`
 
-:Translator:
-
- 時奎亮 Alex Shi <alex.shi@linux.alibaba.com>
-
-:校譯:
-
- 吳想成 Wu XiangCheng <bobwxc@email.cn>
- 胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
- 葉宸佑 Chen-Yu Yeh <chenyou910331@gmail.com>
-
 .. _tw_development_posting:
 
 發布補丁
diff --git a/Documentation/translations/zh_TW/process/6.Followthrough.rst b/Documentation/translations/zh_TW/process/6.Followthrough.rst
index f3b195966632..76082a15677f 100644
--- a/Documentation/translations/zh_TW/process/6.Followthrough.rst
+++ b/Documentation/translations/zh_TW/process/6.Followthrough.rst
@@ -4,15 +4,6 @@
 
 :Original: :ref:`Documentation/process/6.Followthrough.rst <development_followthrough>`
 
-:Translator:
-
- 時奎亮 Alex Shi <alex.shi@linux.alibaba.com>
-
-:校譯:
-
- 吳想成 Wu XiangCheng <bobwxc@email.cn>
- 胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
-
 .. _tw_development_followthrough:
 
 跟進
diff --git a/Documentation/translations/zh_TW/process/7.AdvancedTopics.rst b/Documentation/translations/zh_TW/process/7.AdvancedTopics.rst
index 8090d482c4b0..392c00213078 100644
--- a/Documentation/translations/zh_TW/process/7.AdvancedTopics.rst
+++ b/Documentation/translations/zh_TW/process/7.AdvancedTopics.rst
@@ -4,16 +4,6 @@
 
 :Original: :ref:`Documentation/process/7.AdvancedTopics.rst <development_advancedtopics>`
 
-:Translator:
-
- 時奎亮 Alex Shi <alex.shi@linux.alibaba.com>
-
-:校譯:
-
- 吳想成 Wu XiangCheng <bobwxc@email.cn>
- 胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
- 葉宸佑 Chen-Yu Yeh <chenyou910331@gmail.com>
-
 .. _tw_development_advancedtopics:
 
 進階主題
diff --git a/Documentation/translations/zh_TW/process/8.Conclusion.rst b/Documentation/translations/zh_TW/process/8.Conclusion.rst
index 8f9b4ec6845f..2436263c6506 100644
--- a/Documentation/translations/zh_TW/process/8.Conclusion.rst
+++ b/Documentation/translations/zh_TW/process/8.Conclusion.rst
@@ -3,15 +3,6 @@
 .. include:: ../disclaimer-zh_TW.rst
 
 :Original: :ref:`Documentation/process/8.Conclusion.rst <development_conclusion>`
-:Translator:
-
- 時奎亮 Alex Shi <alex.shi@linux.alibaba.com>
-
-:校譯:
-
- 吳想成 Wu XiangCheng <bobwxc@email.cn>
- 胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
- 葉宸佑 Chen-Yu Yeh <chenyou910331@gmail.com>
 
 .. _tw_development_conclusion:
 
diff --git a/Documentation/translations/zh_TW/process/code-of-conduct-interpretation.rst b/Documentation/translations/zh_TW/process/code-of-conduct-interpretation.rst
index 897faa825d12..4fc568409198 100644
--- a/Documentation/translations/zh_TW/process/code-of-conduct-interpretation.rst
+++ b/Documentation/translations/zh_TW/process/code-of-conduct-interpretation.rst
@@ -3,9 +3,6 @@
 .. include:: ../disclaimer-zh_TW.rst
 
 :Original: :ref:`Documentation/process/code-of-conduct-interpretation.rst <code_of_conduct_interpretation>`
-:Translator: Alex Shi <alex.shi@linux.alibaba.com>
-             Hu Haowen <2023002089@link.tyut.edu.cn>
-             Chen-Yu Yeh <chenyou910331@gmail.com>
 
 .. _tw_code_of_conduct_interpretation:
 
diff --git a/Documentation/translations/zh_TW/process/code-of-conduct.rst b/Documentation/translations/zh_TW/process/code-of-conduct.rst
index d24f1695bd02..0266cd74a0b1 100644
--- a/Documentation/translations/zh_TW/process/code-of-conduct.rst
+++ b/Documentation/translations/zh_TW/process/code-of-conduct.rst
@@ -3,8 +3,6 @@
 .. include:: ../disclaimer-zh_TW.rst
 
 :Original: :ref:`Documentation/process/code-of-conduct.rst <code_of_conduct>`
-:Translator: Alex Shi <alex.shi@linux.alibaba.com>
-             Hu Haowen <2023002089@link.tyut.edu.cn>
 
 .. _tw_code_of_conduct:
 
diff --git a/Documentation/translations/zh_TW/process/coding-style.rst b/Documentation/translations/zh_TW/process/coding-style.rst
index ef7a4cdbff37..5778b707503f 100644
--- a/Documentation/translations/zh_TW/process/coding-style.rst
+++ b/Documentation/translations/zh_TW/process/coding-style.rst
@@ -6,20 +6,6 @@
 
 .. _tw_codingstyle:
 
-:譯者:
- - 張樂 Zhang Le <r0bertz@gentoo.org>
- - Andy Deng <theandy.deng@gmail.com>
- - 吳想成 <bobwxc@email.cn>
-
-:校譯:
- - 王聰 Wang Cong <xiyou.wangcong@gmail.com>
- - wheelz <kernel.zeng@gmail.com>
- - 管旭東 Xudong Guan <xudong.guan@gmail.com>
- - Li Zefan <lizf@cn.fujitsu.com>
- - Wang Chen <wangchen@cn.fujitsu.com>
- - Hu Haowen <2023002089@link.tyut.edu.cn>
- - 葉宸佑 Chen-Yu Yeh <chenyou910331@gmail.com>
-
 Linux 核心程式碼風格
 ====================
 
diff --git a/Documentation/translations/zh_TW/process/development-process.rst b/Documentation/translations/zh_TW/process/development-process.rst
index 305d9472b017..1d22aa0d3711 100644
--- a/Documentation/translations/zh_TW/process/development-process.rst
+++ b/Documentation/translations/zh_TW/process/development-process.rst
@@ -3,8 +3,6 @@
 .. include:: ../disclaimer-zh_TW.rst
 
 :Original: :ref:`Documentation/process/development-process.rst <development_process_main>`
-:Translator: Alex Shi <alex.shi@linux.alibaba.com>
-             Hu Haowen <2023002089@link.tyut.edu.cn>
 
 .. _tw_development_process_main:
 
diff --git a/Documentation/translations/zh_TW/process/email-clients.rst b/Documentation/translations/zh_TW/process/email-clients.rst
index 4fae2fdbb3bf..272e3073521d 100644
--- a/Documentation/translations/zh_TW/process/email-clients.rst
+++ b/Documentation/translations/zh_TW/process/email-clients.rst
@@ -6,18 +6,6 @@
 
 :Original: Documentation/process/email-clients.rst
 
-:譯者:
- - 賈威威  Harry Wei <harryxiyou@gmail.com>
- - 時奎亮  Alex Shi <alexs@kernel.org>
- - 吳想成  Wu XiangCheng <bobwxc@email.cn>
-
-:校譯:
- - Yinglin Luan <synmyth@gmail.com>
- - Xiaochen Wang <wangxiaochen0@gmail.com>
- - yaxinsn <yaxinsn@163.com>
- - Hu Haowen <2023002089@link.tyut.edu.cn>
- - Chen-Yu Yeh <chenyou910331@gmail.com>
-
 Linux郵件客戶端設定資訊
 =======================
 
diff --git a/Documentation/translations/zh_TW/process/embargoed-hardware-issues.rst b/Documentation/translations/zh_TW/process/embargoed-hardware-issues.rst
index 611247c816f4..f5096b9de1a8 100644
--- a/Documentation/translations/zh_TW/process/embargoed-hardware-issues.rst
+++ b/Documentation/translations/zh_TW/process/embargoed-hardware-issues.rst
@@ -3,9 +3,6 @@
 .. include:: ../disclaimer-zh_TW.rst
 
 :Original: :ref:`Documentation/process/embargoed-hardware-issues.rst <embargoed_hardware_issues>`
-:Translator: Alex Shi <alex.shi@linux.alibaba.com>
-             Hu Haowen <2023002089@link.tyut.edu.cn>
-             Chen-Yu Yeh <chenyou910331@gmail.com>
 
 被限制的硬體問題
 ================
diff --git a/Documentation/translations/zh_TW/process/howto.rst b/Documentation/translations/zh_TW/process/howto.rst
index 8466f6af96cc..1ffc076ce26c 100644
--- a/Documentation/translations/zh_TW/process/howto.rst
+++ b/Documentation/translations/zh_TW/process/howto.rst
@@ -6,19 +6,6 @@
 
 :Original: :ref:`Documentation/process/howto.rst <process_howto>`
 
-譯者::
-
-    英文版維護者： Greg Kroah-Hartman <greg@kroah.com>
-    中文版維護者： 李陽  Li Yang <leoyang.li@nxp.com>
-    中文版翻譯者： 李陽  Li Yang <leoyang.li@nxp.com>
-                   時奎亮 Alex Shi <alex.shi@linux.alibaba.com>
-    中文版校譯者:
-                   鍾宇  TripleX Chung <xxx.phy@gmail.com>
-                   陳琦  Maggie Chen <chenqi@beyondsoft.com>
-                   王聰  Wang Cong <xiyou.wangcong@gmail.com>
-                   胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
-                   葉宸佑 Chen-Yu Yeh <chenyou910331@gmail.com>
-
 如何參與Linux核心開發
 =====================
 
@@ -494,8 +481,3 @@ Kees Cook, Andrew Morton, Andi Kleen, Vadim Lobanov, Jesper Juhl, Adrian
 Bunk, Keri Harris, Frans Pop, David A. Wheeler, Junio Hamano, Michael
 Kerrisk和Alex Shepard的評審、建議和貢獻。沒有他們的幫助，這篇文件是不可
 能完成的。
-
-
-
-英文版維護者： Greg Kroah-Hartman <greg@kroah.com>
-
diff --git a/Documentation/translations/zh_TW/process/index.rst b/Documentation/translations/zh_TW/process/index.rst
index 3f84437a2ca9..30db28078460 100644
--- a/Documentation/translations/zh_TW/process/index.rst
+++ b/Documentation/translations/zh_TW/process/index.rst
@@ -8,9 +8,6 @@
 .. include:: ../disclaimer-zh_TW.rst
 
 :Original: :ref:`Documentation/process/index.rst <process_index>`
-:Translator: Alex Shi <alex.shi@linux.alibaba.com>
-             Hu Haowen <2023002089@link.tyut.edu.cn>
-             Chen-Yu Yeh <chenyou910331@gmail.com>
 
 .. _tw_process_index:
 
diff --git a/Documentation/translations/zh_TW/process/kernel-driver-statement.rst b/Documentation/translations/zh_TW/process/kernel-driver-statement.rst
index 23d5cae9685b..34bcb6f164cb 100644
--- a/Documentation/translations/zh_TW/process/kernel-driver-statement.rst
+++ b/Documentation/translations/zh_TW/process/kernel-driver-statement.rst
@@ -5,8 +5,6 @@
 .. include:: ../disclaimer-zh_TW.rst
 
 :Original: :ref:`Documentation/process/kernel-driver-statement.rst <process_statement_driver>`
-:Translator: Alex Shi <alex.shi@linux.alibaba.com>
-             Hu Haowen <2023002089@link.tyut.edu.cn>
 
 內核驅動聲明
 ------------
diff --git a/Documentation/translations/zh_TW/process/kernel-enforcement-statement.rst b/Documentation/translations/zh_TW/process/kernel-enforcement-statement.rst
index 524eb4ac26cc..d54d20529294 100644
--- a/Documentation/translations/zh_TW/process/kernel-enforcement-statement.rst
+++ b/Documentation/translations/zh_TW/process/kernel-enforcement-statement.rst
@@ -5,8 +5,6 @@
 .. include:: ../disclaimer-zh_TW.rst
 
 :Original: :ref:`Documentation/process/kernel-enforcement-statement.rst <process_statement_kernel>`
-:Translator: Alex Shi <alex.shi@linux.alibaba.com>
-             Hu Haowen <2023002089@link.tyut.edu.cn>
 
 Linux 內核執行聲明
 ------------------
diff --git a/Documentation/translations/zh_TW/process/license-rules.rst b/Documentation/translations/zh_TW/process/license-rules.rst
index d9054cff505c..0a4558b7fc76 100644
--- a/Documentation/translations/zh_TW/process/license-rules.rst
+++ b/Documentation/translations/zh_TW/process/license-rules.rst
@@ -3,9 +3,6 @@
 .. include:: ../disclaimer-zh_TW.rst
 
 :Original: :ref:`Documentation/process/license-rules.rst <kernel_licensing>`
-:Translator: Alex Shi <alex.shi@linux.alibaba.com>
-             Hu Haowen <2023002089@link.tyut.edu.cn>
-             Chen-Yu Yeh <chenyou910331@gmail.com>
 
 .. _tw_kernel_licensing:
 
diff --git a/Documentation/translations/zh_TW/process/magic-number.rst b/Documentation/translations/zh_TW/process/magic-number.rst
index bc7eb025dd1e..af1b2d05942a 100644
--- a/Documentation/translations/zh_TW/process/magic-number.rst
+++ b/Documentation/translations/zh_TW/process/magic-number.rst
@@ -6,14 +6,6 @@
 
 :Original: :ref:`Documentation/staging/magic-number.rst <magicnumbers>`
 
-如果想評論或更新本文的內容，請直接發信到LKML。如果你使用英文交流有困難的話，也可
-以向中文版維護者求助。如果本翻譯更新不及時或者翻譯存在問題，請聯繫中文版維護者::
-
-        中文版維護者： 賈威威 Jia Wei Wei <harryxiyou@gmail.com>
-        中文版翻譯者： 賈威威 Jia Wei Wei <harryxiyou@gmail.com>
-        中文版校譯者： 賈威威 Jia Wei Wei <harryxiyou@gmail.com>
-                      胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
-
 Linux 魔術數
 ============
 
diff --git a/Documentation/translations/zh_TW/process/management-style.rst b/Documentation/translations/zh_TW/process/management-style.rst
index 7cb912e89032..2cef0ef25ede 100644
--- a/Documentation/translations/zh_TW/process/management-style.rst
+++ b/Documentation/translations/zh_TW/process/management-style.rst
@@ -3,8 +3,6 @@
 .. include:: ../disclaimer-zh_TW.rst
 
 :Original: :ref:`Documentation/process/management-style.rst <managementstyle>`
-:Translator: Alex Shi <alex.shi@linux.alibaba.com>
-             Hu Haowen <2023002089@link.tyut.edu.cn>
 
 .. _tw_managementstyle:
 
diff --git a/Documentation/translations/zh_TW/process/programming-language.rst b/Documentation/translations/zh_TW/process/programming-language.rst
index a5466047b90c..9aac89e2c23b 100644
--- a/Documentation/translations/zh_TW/process/programming-language.rst
+++ b/Documentation/translations/zh_TW/process/programming-language.rst
@@ -3,9 +3,6 @@
 .. include:: ../disclaimer-zh_TW.rst
 
 :Original: :ref:`Documentation/process/programming-language.rst <programming_language>`
-:Translator: Alex Shi <alex.shi@linux.alibaba.com>
-             Hu Haowen <2023002089@link.tyut.edu.cn>
-             Chen-Yu Yeh <chenyou910331@gmail.com>
 
 .. _tw_programming_language:
 
diff --git a/Documentation/translations/zh_TW/process/stable-api-nonsense.rst b/Documentation/translations/zh_TW/process/stable-api-nonsense.rst
index a21daf29da10..94748429c182 100644
--- a/Documentation/translations/zh_TW/process/stable-api-nonsense.rst
+++ b/Documentation/translations/zh_TW/process/stable-api-nonsense.rst
@@ -7,13 +7,6 @@
 :Original: :ref:`Documentation/process/stable-api-nonsense.rst
            <stable_api_nonsense>`
 
-譯者::
-
-        中文版維護者： 鍾宇  TripleX Chung <xxx.phy@gmail.com>
-        中文版翻譯者： 鍾宇  TripleX Chung <xxx.phy@gmail.com>
-        中文版校譯者： 李陽  Li Yang <leoyang.li@nxp.com>
-                      胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
-
 Linux 內核驅動介面
 ==================
 
@@ -154,6 +147,3 @@ Linux能成爲強壯，穩定，成熟的操作系統，這也是你最開始選
 ----
 感謝 Randy Dunlap, Andrew Morton, David Brownell, Hanna Linder,
 Robert Love, and Nishanth Aravamudan 對於本文檔早期版本的評審和建議。
-
-英文版維護者： Greg Kroah-Hartman <greg@kroah.com>
-
diff --git a/Documentation/translations/zh_TW/process/stable-kernel-rules.rst b/Documentation/translations/zh_TW/process/stable-kernel-rules.rst
index 7d286ad54f2e..d182d625728d 100644
--- a/Documentation/translations/zh_TW/process/stable-kernel-rules.rst
+++ b/Documentation/translations/zh_TW/process/stable-kernel-rules.rst
@@ -6,18 +6,6 @@
 
 :Original: :ref:`Documentation/process/stable-kernel-rules.rst <stable_kernel_rules>`
 
-如果想評論或更新本文的內容，請直接聯繫原文件的維護者。如果你使用英文
-交流有困難的話，也可以向中文版維護者求助。如果本翻譯更新不及時或者翻
-譯存在問題，請聯繫中文版維護者::
-
-        中文版維護者： 鍾宇  TripleX Chung <xxx.phy@gmail.com>
-        中文版翻譯者： 鍾宇  TripleX Chung <xxx.phy@gmail.com>
-        中文版校譯者：
-            - 李陽  Li Yang <leoyang.li@nxp.com>
-            - Kangkai Yin <e12051@motorola.com>
-            - 胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
-            - 葉宸佑 Chen-Yu Yeh <chenyou910331@gmail.com>
-
 所有你想知道的事情 - 關於Linux -stable 版本發布
 ===============================================
 
diff --git a/Documentation/translations/zh_TW/process/submit-checklist.rst b/Documentation/translations/zh_TW/process/submit-checklist.rst
index 06aa635a659c..452fecc7c425 100644
--- a/Documentation/translations/zh_TW/process/submit-checklist.rst
+++ b/Documentation/translations/zh_TW/process/submit-checklist.rst
@@ -3,10 +3,6 @@
 .. include:: ../disclaimer-zh_TW.rst
 
 :Original: Documentation/process/submit-checklist.rst
-:Translator:
- - Alex Shi <alexs@kernel.org>
- - Wu XiangCheng <bobwxc@email.cn>
- - Hu Haowen <2023002089@link.tyut.edu.cn>
 
 .. _tw_submitchecklist:
 
diff --git a/Documentation/translations/zh_TW/process/submitting-patches.rst b/Documentation/translations/zh_TW/process/submitting-patches.rst
index b780f1539b46..514903daae25 100644
--- a/Documentation/translations/zh_TW/process/submitting-patches.rst
+++ b/Documentation/translations/zh_TW/process/submitting-patches.rst
@@ -6,18 +6,6 @@
 
 :Original: Documentation/process/submitting-patches.rst
 
-:譯者:
- - 鍾宇 TripleX Chung <xxx.phy@gmail.com>
- - 時奎亮 Alex Shi <alexs@kernel.org>
- - 吳想成 Wu XiangCheng <bobwxc@email.cn>
-
-:校譯:
- - 李陽 Li Yang <leoyang.li@nxp.com>
- - 王聰 Wang Cong <xiyou.wangcong@gmail.com>
- - 胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
- - 葉宸佑 Chen-Yu Yeh <chenyou910331@gmail.com>
-
-
 提交補丁：如何讓你的改動進入核心
 ================================
 
diff --git a/Documentation/translations/zh_TW/process/volatile-considered-harmful.rst b/Documentation/translations/zh_TW/process/volatile-considered-harmful.rst
index e2723f3cbbb0..edfc83f32672 100644
--- a/Documentation/translations/zh_TW/process/volatile-considered-harmful.rst
+++ b/Documentation/translations/zh_TW/process/volatile-considered-harmful.rst
@@ -7,18 +7,6 @@
 :Original: :ref:`Documentation/process/volatile-considered-harmful.rst
            <volatile_considered_harmful>`
 
-如果想評論或更新本文的內容，請直接聯繫原文檔的維護者。如果你使用英文
-交流有困難的話，也可以向中文版維護者求助。如果本翻譯更新不及時或者翻
-譯存在問題，請聯繫中文版維護者::
-
-        英文版維護者： Jonathan Corbet <corbet@lwn.net>
-        中文版維護者： 伍鵬  Bryan Wu <bryan.wu@analog.com>
-        中文版翻譯者： 伍鵬  Bryan Wu <bryan.wu@analog.com>
-        中文版校譯者： 張漢輝  Eugene Teo <eugeneteo@kernel.sg>
-                       楊瑞  Dave Young <hidave.darkstar@gmail.com>
-                       時奎亮 Alex Shi <alex.shi@linux.alibaba.com>
-                       胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
-
 爲什麼不應該使用“volatile”類型
 ==============================
 
-- 
2.43.0

