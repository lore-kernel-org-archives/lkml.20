Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793965002;
	b=MkQgPERqh2xbV399dpWWhTkf/AxVlmOfGz8zWQxRQC2ozPbg0M/gkpWLCcO2h4V8a8VH
	 DCwEouNNVB9rCu/iNIaGo3z4tf3Vtgm/kZj1wtJRISs5IN6v3eZB0BTPKAP0JsLuLVe4p
	 SSzF31muoz83kStaSc569Od047I0Ei9V87owoVgjMCShr/KO09jifHUsFhILy+3krMMlX
	 vvIuofoLJ/NmRAH8T84LbseQ4A2AN5fx+Yrwwwfd5RW3ZD0MHP146Si0+m0becBH2g5Ob
	 rvJt+WQ+Ju1/zhttV7YtIBU3TcZ5lKIY+x49stvqZQfvdvKyJLGFz5UPeV5yUmkVgbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793965002;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=izHqOwhL2z8wx4Qpnodt2553sHWWc6u2gGQnZJlajzc=;
	b=R9xOfj/cGr7VZLrAEvu/FRYPFdXeBA1vk3EVPzCAJVjXx6MnGzxnaHOvn9KIH7LIyrWH
	 G8N78PGd60VHKG5Aypqge88XuH5WPDbxYKOH99AOSBRtJzGDdA8c9U5eqhIn1TuwsrL4W
	 tDZFrD8dN/Fqdh+kD+6qukP+2j8lrii8nrbnCmVHNqlWvIEuP0/4r2OfMXoxouqQ+aIiz
	 Stx0BqNE9CY18fseZTW5EtwSz72cymybVxl9ggyb+jplrMB9Lfxw9uN238c1m8hugMFXG
	 IqrUppslCJ6AOmAgSAJxmOrDBzFkha7v1GD3VT8yskfUyUiMvXeUfHRizfdPo1zZr5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lqAoM35A;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CB8160A6F7B
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 11:36:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CB8160A6F7B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lqAoM35A
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3acb1224533so45478a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 03:36:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793965001; x=1794569801; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=izHqOwhL2z8wx4Qpnodt2553sHWWc6u2gGQnZJlajzc=;
        b=lqAoM35ABbgtoGNNHPXav+FYQuq72rmIQoURX4SZz7LUMjhku1xd3UhHvzeOt/S394
         gc53DP8MhAoB5Zzbn3u9SSraDKzOxOPa7vnWaFWBS/JHHIx4oaYcSZm5+SRU5OY6CP2j
         nZ96A5GZKkD47ipddyrdlpyXh2I+qYY85SToVXfXrPq8yetyQqrJ/CwcR0UG9/jgShKX
         /uD4VAEKAKK27ysb6BICav2bnHNBC4pZSdjvDpQnpIcUUgnDlrefIW8WUKmeqIDqjkFW
         /i5PdlT4KM/zloborSSA1RqMVqHtM/LchPE++y57y5SmqT8fFdVBU0tdTTBlRvo7Lbls
         UBmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793965001; x=1794569801;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=izHqOwhL2z8wx4Qpnodt2553sHWWc6u2gGQnZJlajzc=;
        b=MgnIZxZYEZZB4apFAclX7oZMr7hIlfjee7qY1DveWK6F7rHqTQx/29x3O/PmAdXocN
         Zjl/yvkTsrg456BBOuW7rOp4L+no6gqA0ogLwy6IMsKStNqA6sv9FIPfivaO4aOg/pIM
         jFp3XceWuPA/fSHq9cC5Zmc3Ybu33rQZ/n/WTEZ0YMUjFbJq/0scylCQjCh8fe8v9YTO
         5VC1ynpyGwFSmCQwyr7oSd4VzQFs9luIfiHYTXnk3dDH8R69F1ACC2D8MHhjb77xOp9l
         /Cj7OEODidCNugTHVeuNxk5Rerc//ajka3PZwMX7CoUpPcPp8XQPQ5fgRMbGw0wOc/T1
         dP4w==
X-Forwarded-Encrypted: i=1; AL+hErF9vHCjEpw6eLIIEtLEaa6kueFOw5i5+avSJR3pqIS+FC6vQhHluoM+o+KFdI/rm7OlAJ//nz9yHKQvFIQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Xqyca6M9q5tv5Fb3IkjYD663QhGe6bfspVKoyr3iKd8iiadUS
	cqzgW9tEgK7wbfU0Yn/hLzDfG+mibyogKeTcIHZcIS9Gglua0gx4y8OF
X-Gm-Gg: AYBFou1jsHH7N1zXmJUcY4Tx8V2HyhQrAs55UnN/19Fbjvxr3UAica4ukwWLQ0yMhOF
	RH3HTumQlPHypHxCAgiggKErPqlHHgopjqtEc4k8H917Lw6EgCBytttAIHxWCiCM6e8z1yeJcuj
	GnTr4Yez/rRdcLryNqFn0mzEHkbnAyAla5RYN+Q0goLrL7xkThgKKpsdVkCWC0eZZ5y7XmJgMFn
	k9xVcnkgKbrKFejmeIQxG4RhH030Uc5f8dE7z2V1ITaKIX2fYkGCFMy0Jx18exn1qX7Iy/PsUVU
	aOfH1D0AFa3LYeb+GkgkAFD1TJtfs7qwrmytEUY1WecgWLJcXaA4hfHzFArfphhDp3L1u9UiQVR
	y4hvJKeIYbAbwa3jDqZjwS8e/liANv7457xaM+TND2JQK3QAfeSnC2EdfS/wHixe2N09TBYpjK+
	tYZGQgL6dOO36MM7aYlYwh/BGijlgBO7x4UKpgfmkD01GiLBXc+jDr8i7RE/+lrRM9BmCSos1T5
	7KEQk0/efEGV9MGB6VLNokTicvPGlZwNG6bvFShkUaPbhHH5FLjSM1CcNyMcIw8wlUvpdZ0BMG8
	t4xuhiRshQPD97TMSjDDnjAVU2cUOTJDt01yBfq1DQiqnbAh5iwZwpVxEarH798U+kiWIRcu31O
	23KzuOrwW3Q/Qm25Y2dVx4M3e
X-Received: by 2002:a17:90b:2b46:b0:3b0:9a3e:bf8b with SMTP id 98e67ed59e1d1-3b0db7349d6mr3505266a91.6.1793965000909;
        Fri, 06 Nov 2026 03:36:40 -0800 (PST)
Received: from chenyou.ncku.edu.tw ([140.116.19.13])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b32b6507sm8343173a91.16.2026.11.06.03.36.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 03:36:40 -0800 (PST)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: Alex Shi <alexs@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Weijie Yuan <wy@wyuan.org>,
	Dongliang Mu <dzm91@hust.edu.cn>,
	Yanteng Si <si.yanteng@linux.dev>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH 13/13] docs/zh_TW: process: add maintainers.rst translation
Date: Fri,  6 Nov 2026 19:35:44 +0800
Message-ID: <20261106113545.708896-14-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106113545.708896-1-chenyou910331@gmail.com>
References: <20261106113545.708896-1-chenyou910331@gmail.com>
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

Documentation/process/maintainers.rst consists only of the
maintainers-include directive, which renders the top-level MAINTAINERS
file.  The directive cannot be reused in the translation, as it would
define the maintainers and maintainers_table labels a second time and
duplicate the whole maintainers table.

Instead, translate the descriptive header of MAINTAINERS (the section
entry descriptions and the note on the maintainers list) into
Traditional Chinese, and point readers to the English page and the
MAINTAINERS file for the list itself.  There is no zh_CN translation
of this file to consult.

List the new file in the toctree of process/index.rst, under
"Maintainer information" as in the English index, and drop it from the
TODOList.

update to commit 45a92c0b91d7 ("docs: maintainers: add SPDX license to
the file")

Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
 .../translations/zh_TW/process/index.rst      |   5 +-
 .../zh_TW/process/maintainers.rst             | 127 ++++++++++++++++++
 2 files changed, 128 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/translations/zh_TW/process/maintainers.rst

diff --git a/Documentation/translations/zh_TW/process/index.rst b/Documentation/translations/zh_TW/process/index.rst
index e5eb5a276fb1..9ff8932760a2 100644
--- a/Documentation/translations/zh_TW/process/index.rst
+++ b/Documentation/translations/zh_TW/process/index.rst
@@ -104,10 +104,7 @@ TODOList:
    :maxdepth: 1
 
    maintainer-handbooks
-
-TODOList:
-
-* maintainers
+   maintainers
 
 其他材料
 --------
diff --git a/Documentation/translations/zh_TW/process/maintainers.rst b/Documentation/translations/zh_TW/process/maintainers.rst
new file mode 100644
index 000000000000..9110241d8a2e
--- /dev/null
+++ b/Documentation/translations/zh_TW/process/maintainers.rst
@@ -0,0 +1,127 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. include:: ../disclaimer-zh_TW.rst
+
+:Original: Documentation/process/maintainers.rst
+
+.. _tw_maintainers:
+
+維護者列表
+==========
+
+.. note:: 英文原文使用特殊的 ``maintainers-include`` 指令，把核心原始碼樹
+          頂層的 ``MAINTAINERS`` 檔案整份嵌入文件中。本譯文只翻譯該檔案開頭
+          說明各欄位的部分；實際的維護者名單請參閱英文原文
+          :ref:`Documentation/process/maintainers.rst <maintainers>`，
+          或直接查看 ``MAINTAINERS`` 檔案。
+
+各節條目說明與建議順序
+----------------------
+
+``M:``
+  修補程式的收件人（*Mail*）：``FullName <address@domain>``
+
+``R:``
+  指定的審閱者（*Reviewer*）：``FullName <address@domain>``
+
+  發送修補程式時應副本（CC）給這些審閱者。
+
+``L:``
+  與此領域相關的郵件列表（*Mailing list*）
+
+``S:``
+  狀態（*Status*），為下列其中之一：
+
+  Supported
+    有人實際受僱照顧這部分。
+
+  Maintained
+    有人實際在照顧它。
+
+  Odd Fixes
+    有維護者，但他們沒有時間做太多事，只會偶爾加入一些修補程式。
+    見下文。
+
+  Orphan
+    目前沒有維護者［不過也許你在撰寫新程式碼的同時，可以接下這個角色］。
+
+  Obsolete
+    舊程式碼。標記為 obsolete 的東西通常表示它已經被更好的系統取代，
+    你應該改用那個系統。
+
+``W:``
+  提供狀態與資訊的網頁（*Web-page*）
+
+``Q:``
+  *Patchwork* 網頁式修補程式追蹤系統的網站
+
+``B:``
+  回報缺陷（*bugs*）的 URI。可以是含有詳細回報說明的網頁、缺陷追蹤系統的
+  直接連結，或 mailto: URI。
+
+``C:``
+  聊天（*chat*）的 URI，包含開發者通常聚集的協定、伺服器與頻道，例如
+  ``irc://server/channel``。
+
+``P:``
+  子系統概要（*Subsystem Profile*）文件，說明向該子系統提交修補程式的
+  更多細節。可以是核心原始碼樹中 Documentation/ 底下的 .rst 檔案，或是
+  一個 URI。詳見 Documentation/maintainer/maintainer-entry-profile.rst。
+
+``T:``
+  原始碼管理（*SCM*）樹的類型與位置。
+
+  類型為下列其中之一：git、hg、quilt、stgit、topgit
+
+``F:``
+  檔案（*Files*）與目錄的萬用字元模式。
+
+  結尾的斜線表示包含該目錄下的所有檔案，以及其子目錄中的檔案。
+
+  - ``F: drivers/net/``：drivers/net 中及其下各層的所有檔案
+  - ``F: drivers/net/*``：drivers/net 中的所有檔案，但不含其下各層
+  - ``F: */net/*``：「任何頂層目錄」/net 中的所有檔案
+  - ``F: fs/**/*foo*.c``：fs 任何子目錄中所有符合 ``*foo*.c`` 的檔案
+
+  每行一個模式，可以有多行 F:。
+
+``X:``
+  排除（*Excluded*）不由此條目維護的檔案與目錄，規則與 F: 相同。排除規則
+  會先於檔案比對進行檢查。可用來排除特定子目錄，例如：
+
+  - ``F: net/``
+  - ``X: net/ipv6/``
+
+  會比對 net/ 中及其下各層的所有檔案，但排除 net/ipv6/。
+
+``N:``
+  檔案與目錄的正規表示式（*Regex*）模式。
+
+  - ``N: [^a-z]tegra``：路徑中含有 tegra 的所有檔案（不包括像 integrator
+    這樣的檔案）
+
+  每行一個模式，可以有多行 N:。
+
+  scripts/get_maintainer.pl 對於符合 F: 模式的檔案與符合 N: 模式的檔案，
+  處理方式不同。預設情況下，比對到 F: 模式時，get_maintainer 不會查看
+  git log 歷史；比對到 N: 模式時，則會利用 git log 歷史，一併通知在 git
+  提交中留有簽名的人。
+
+``K:``
+  在修補程式或檔案中比對的內容正規表示式（*Content regex*，perl 擴充語法）。
+  例如：
+
+  - ``K: of_get_profile``：比對含有「of_get_profile」的修補程式或檔案
+  - ``K: \b(printk|pr_(info|err))\b``：比對含有 printk、pr_info 或 pr_err
+    其中一個或多個字詞的修補程式或檔案
+
+  每行一個正規表示式模式，可以有多行 K:。
+
+維護者名單
+----------
+
+.. note:: 閱讀此名單時，請先尋找最精確的領域。新增條目時，請保持條目依
+          字母順序排列。
+
+完整的維護者名單（依子系統排列的表格）請參閱英文原文
+:ref:`Documentation/process/maintainers.rst <maintainers_table>`。
-- 
2.43.0

