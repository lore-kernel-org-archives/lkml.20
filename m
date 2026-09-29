Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AF1952B1EE
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 13:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790687437; cv=none; b=qNw73mpsAW438y6+++I0UMN3iKuFpXim8Vdo08jSSVHN4aB/rHwkG9jLyvuwi3+md0ucEfa3UiuJPF0D2rIBumRuijxBtSDGbOjjNLqf4HOAoGNdJRNBxL7zyRR4L/pS6ToMLff32vQSwPGxGHz48fb32ypEcwwJiUOR6G5DMT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790687437; c=relaxed/simple;
	bh=9JkFDyFnne60cZKI99Tde/fBYbl8bUP5ZX0SoTB8IfM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LTOI6M20HVUo2VWxVxNEw20KarEk49/8no7PDvzG8RXHNMDNKTimRQP1C4P5Ei9AVF5+viinTWt45tfSAayOB7EPD1Ub4ntmD8VNqub1N4tKX1QjW0eFWjHPoQw14ZiLeoMAehsOCFjcq3+KyHf2hNJF3P/CinvTov01LYoyVM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CtUpRFtf; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CtUpRFtf"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2db479a55b6so3899935ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 06:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790687435; x=1791292235; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DnI3VRJUJJQ2XaVm2Yzhi0zxE983U0SkBlKpcLF8eCo=;
        b=CtUpRFtfwX96vCKnnyeQCnE0F27yspmZAz8R9rfmHlKJTnDgAjQDS4UOOs3pjCeIKI
         c+nGnKUHjTsLhneLgbrGzS4VuHjcsTaM99L2SxQKNQ1iTDSKFO7MzN0Rjs2pF+Y2tACc
         +GX8bSfuBzkMUE4u1BVcmrwsmhHtMXG8+A69Bv/5u4XJzkuGMxe4FLE/cLPjUOC/D9+F
         7/Tk+CPC8xDtC5pq3VqOYEMN92ofvLoQLzT2Wcie4kxqt28nzg7M2WxCrAC0lY34hT4L
         VcroM8uErB8rlu7Zvtnk4fJyknaoEMUeSYsHtslsv97WiXWga6YqoQokNAmhJeRXgsnz
         Snlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790687435; x=1791292235;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DnI3VRJUJJQ2XaVm2Yzhi0zxE983U0SkBlKpcLF8eCo=;
        b=spuWzu0jvOQHsEZGxzylwL9qtK9AU20ML9uzb8Ti6zb3poE2k3NGChaxpQyIfY3ZhC
         paaJOxdn4v2CB5QP4CvLkKhE2uPoYhixRnnFP1oVG2Wv8m3gtkc8ss5XOvH+7OrE5buv
         bzpQDUSlX53bQBtaXY/Ki5yNYWc5UJ5srez7EbmV1pBWTiGX7BtOp+la8uXB7cN/zgqC
         6C2Fivh+i5x9L0RuLUGdqSvp/pX7rfpx/dlOu7L7GncPxk8F5Wg1M4HKUFdH/EU7LZQ5
         v3cloahbpnaWd80BYEb6mZNxN86gfYFiHSvQrxqHfIQIaYWLBw72f3kL8DrCcH+E6hMz
         7f6w==
X-Forwarded-Encrypted: i=1; AKwUvBzC3lATjKJPjq6YmEADqHlsQX9OOR4gDVQPh9ReGsTCnCLPVzMAC7ZWkT2na8A2BM58gUcF3bEDp8iItG4=@vger.kernel.org
X-Gm-Message-State: AFq9FYL7Oe4nEtcGfQxQSrX8geqkm/sgjmiWf4456JnJqZEK07DWw5Lc
	PwZ0lOM8lPftPQ2bWWU1DKr6/MpYWJA/tl7/gkPCc9M34gU1msF7NjbY
X-Gm-Gg: AYBFou3NIdZYleZ3e6umRiy+3TopYtSLVRCRXlrXLreMIFLkuVkYTqQKkAjesvYIFUe
	t7Obs806su/45YTpwLkzEWi+T5PZCgGqylqbSqY4XjDQBCexlPQB0kjbyeLCi2SGmIU1i8L6Sao
	6fIBok6a+AviPOIQr+PCZNaYTdnP6/a/xZ8aIKqM4QfPcGb5ICX1cDQ9o8OhYcD+UAQuKDEuBlP
	4Fx7dCSloJnO6OaTdVbtkn6CMCLjfnXsNe2kiCL8AgBgHoy5kkmzZKNJPod8oPXKRNtkasFAyzy
	ZD2mhH6PyZBDHfSEvHHX05iPctdRLGwrkGTrFfExLxgVjNP3+TqR2H/QVd1uLD3E1+8/aMCbbDr
	NlSjjsNu1C53EbcXOIg9j4kNEL6qCpZekc5q1xLP9KuJ0N3404BD8tQjIqdUSedA8Icowil6Dtw
	UAb4NB2GAsdc198DCkLiWfCjzR+MIx7zZ/xBISa13HO4uMeVsn1oFogR/wfszmgfenm1mmJN68M
	CFNea6D6o0GolWnW6+auULDry2Vg7NHtkr8NQa4m6P6E7lwCtlXmNVL9g==
X-Received: by 2002:a17:903:3d10:b0:2df:8ab7:fe3a with SMTP id d9443c01a7336-2df8e751adamr161899705ad.4.1790687434548;
        Tue, 29 Sep 2026 06:10:34 -0700 (PDT)
Received: from chenyou.. ([140.116.39.229])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df9142969esm57363705ad.45.2026.09.29.06.10.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 06:10:33 -0700 (PDT)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: corbet@lwn.net,
	alexs@kernel.org
Cc: dzm91@hust.edu.cn,
	wy@wyuan.org,
	si.yanteng@linux.dev,
	srcres258@furdevs.cn,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH 2/4] docs/zh_TW: move magic-number to staging/
Date: Tue, 29 Sep 2026 21:10:16 +0800
Message-ID: <20260929131020.266120-3-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260929131020.266120-1-chenyou910331@gmail.com>
References: <20260929131020.266120-1-chenyou910331@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The English original moved from process/ to staging/ in
commit f9a4f4a0e1f5 ("Docs: Move magic-number from process to staging"),
but the translation stayed behind.  checktransupdate.py locates the
English original from the translation's path, so it currently reports:

  Cannot find the origin path for
  Documentation/translations/zh_TW/process/magic-number.rst

Move it to match the English layout.  zh_TW has no staging/ directory
yet, so add a staging/index.rst that follows the English one, listing
the documents not translated yet under TODOList as zh_CN does, and link
it from the top-level index in place of its TODOList entry.  The content
of magic-number.rst is unchanged.

Unlike most of the tree, this translation was kept in step for a while
by the English authors themselves: the 2022 series that removed stale
magic numbers edited the translations as well, and so did
commit dd8d4bc28ad7 ("net: remove ax25 and amateur radio (hamradio)
subsystem").  The one English change it lacks is
commit cdcfc029482a ("Documentation: Fix incorrect paths/magic in magic
numbers rst"), which went in after the move.  Use the move commit as the
baseline so that change is reported; checktransupdate.py will also list
dd8d4bc28ad7, which is already reflected here.

update to commit f9a4f4a0e1f5 ("Docs: Move magic-number from process to
staging")

Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
 Documentation/translations/zh_TW/index.rst    |  5 ++--
 .../translations/zh_TW/process/index.rst      |  5 ----
 .../translations/zh_TW/staging/index.rst      | 23 +++++++++++++++++++
 .../{process => staging}/magic-number.rst     |  0
 4 files changed, 26 insertions(+), 7 deletions(-)
 create mode 100644 Documentation/translations/zh_TW/staging/index.rst
 rename Documentation/translations/zh_TW/{process => staging}/magic-number.rst (100%)

diff --git a/Documentation/translations/zh_TW/index.rst b/Documentation/translations/zh_TW/index.rst
index fb86de03c423..1dddf5963864 100644
--- a/Documentation/translations/zh_TW/index.rst
+++ b/Documentation/translations/zh_TW/index.rst
@@ -112,9 +112,10 @@ TODOList:
 有幾份未分類的文檔似乎不適合放在文檔的其他部分，或者可能需要進行一些調整和/或
 轉換爲reStructureText格式，也有可能太舊。
 
-TODOList:
+.. toctree::
+   :maxdepth: 2
 
-* staging/index
+   staging/index
 
 術語表
 ------
diff --git a/Documentation/translations/zh_TW/process/index.rst b/Documentation/translations/zh_TW/process/index.rst
index 18653aa75d7d..de99156324df 100644
--- a/Documentation/translations/zh_TW/process/index.rst
+++ b/Documentation/translations/zh_TW/process/index.rst
@@ -113,11 +113,6 @@ TODOList:
 
 這裡是一些大多數開發者會感興趣的其他社群指南：
 
-.. toctree::
-   :maxdepth: 1
-
-   magic-number
-
 TODOList:
 
 * kernel-docs
diff --git a/Documentation/translations/zh_TW/staging/index.rst b/Documentation/translations/zh_TW/staging/index.rst
new file mode 100644
index 000000000000..556c63a17f9c
--- /dev/null
+++ b/Documentation/translations/zh_TW/staging/index.rst
@@ -0,0 +1,23 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. include:: ../disclaimer-zh_TW.rst
+
+:Original: Documentation/staging/index.rst
+
+未分類文件
+==========
+
+.. toctree::
+   :maxdepth: 2
+
+   magic-number
+
+TODOList:
+
+* crc32
+* lzo
+* remoteproc
+* rpmsg
+* speculation
+* static-keys
+* xz
diff --git a/Documentation/translations/zh_TW/process/magic-number.rst b/Documentation/translations/zh_TW/staging/magic-number.rst
similarity index 100%
rename from Documentation/translations/zh_TW/process/magic-number.rst
rename to Documentation/translations/zh_TW/staging/magic-number.rst
-- 
2.43.0

