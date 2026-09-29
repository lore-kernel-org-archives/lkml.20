Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FCC852CCCB
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 13:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790687440; cv=none; b=Gi7yRF+US0ymTWBa8GYi8LJOF3Gb13ewQf/uEHhwh+2EoeClT0xXW50dLpSCP8KJw6PHxI4TTVU/esFPBQuA7d2qWUAO6mGsAzr47vPgGnY3frbNGwh2XGuSUoH+4LoHB9naZmfWFX14kDkF33Q+sibILgq6X4yB95NN21LTsjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790687440; c=relaxed/simple;
	bh=zBKbG0KzM6OQ4o1N5qbkrX+umxPxp6lGncnT9tGExsY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=grbXrd9Fo1KgTfx69C//1r+V8/wpc3kJWubcE5B/sIgYW8s8cLPq6g4gVbF5Cb02xIbnnDP98uquE+2MsquJ/PpmMIDbK6PxZino7mdnddf0bhGc+FS0Kyw4YpZiA6+BGN3lTkkJtwiB0PhxHLSjsIblokGjG7T/H6ibIXgd5KA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UgGMMs8P; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UgGMMs8P"
Received: by mail-pj2-f42.google.com with SMTP id d9443c01a7336-2df8a4eac2aso1830235ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 06:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790687438; x=1791292238; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bwBwKsXF/v6mM3m6KquI3cOCMBSzFiWq5kCFX5U77BA=;
        b=UgGMMs8PiKrW498PqhP9qQz5Z/D4TYbyDDcGyy1D+ikasf3AvoUHDGb8JP3/szGz6H
         AMpaZuB4QcoQ+8d+MuY90d1dTUtzbCiLTDQu8D5hvBwFAGiX8iOcu0Q36gPxL3y/k6Bg
         oJhCfYn5iE74qDNZCoi6o5a+domHOqlYVSfi5kkgr6dM7wWuPRTm8R99C3I4q3Ap+JK2
         yq9rP0RvIQddtOXo+n99XLApCVSuJ6cyjzV8JKZ/ljtZUMwDTMi01AoVBS+/vQNnNoRV
         K5wYi89qx/0vaKRZDtbBWNOhQIlv+3WWCtHXCQEgsRVrpVaAUHtuJDsLyxa6d0NHO3dM
         /OkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790687438; x=1791292238;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bwBwKsXF/v6mM3m6KquI3cOCMBSzFiWq5kCFX5U77BA=;
        b=XHyamDDQsPM0xnxG2PFZzwnujiiICe2/aplS7LwRnyXl0k034X3mlg4ZNNNj9x5oyh
         Ma0ViTuMPk9xWHTMDAWJ3uSOm+QBm6zs0+6VMjp23/06JipL6/xLYbHsXzF1+L4fCwPJ
         SFu5fEIZh2pqpfOeBvLVjPkPKrY2y3inAXuJgEjZlZIXADVDGgOOOjaghj4sjq5Ps8gq
         3WR80yDZQGrMYvFANNWTMLuZzObTVJ1jzBGP2CG5XiMEl5H+Aqax9/vYReS4xnaSgM1w
         z5wIhByF1CCeB4rQIKax4IXsy5wVVgAifkIjs3DSnNsX05VTekqODoSOMiMN1cWeoGVd
         bFug==
X-Forwarded-Encrypted: i=1; AKwUvBzGvD44NS0MVokg9CdE8Y7tSJTCDSmpT7auFH2XJq+aX3Ku1NIz0VB1SK71YA5SczMZQnga2aNhxJd0yDY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLROxA3lXyCFYWJJWUd8SnFL6Z59zqVJtm9fjlrFltow1sB1FXr
	i8ZzeCrH+AGg9Xuy75LB9h5Nlc6VZ9IBtXsmPcAB+F1+kOdh7TNK3RBJ
X-Gm-Gg: AYBFou0njeZlUY6uFpJt8BDn0zdYydvNFWhvDfAf6ogy8lNt8C5VlgnKQExisTqqAAq
	mMFuL7kcDiPrIFpqRa2q3zsP+Egnr6ojJvsdASiQNCctMI9mYCPJ+DN81NEmKjnrnzFyGEr3+DE
	7ouZumOIz3GHyrkXYHJHRxYa82dpnIDXy06FUBF+GZh7oAINAcbXF15xGOI/yk2sJWEenELM3gA
	AB6OmUMuiP91KhnQbd5Q8reS59GEaNvJaGj5j+Jh+OyPVj1s/5V3kTZv379sw8LfhWASOHpvMt+
	2Ko4i0EiOYM9POqsRITVIm2Nr5rEAAuH80pJkWFdJS6MlLV5mkBOwc0cfPQuAbjJNjBnZoriBdd
	4Zmx6GRAefX8RIRSjo99jvKMAqi8ax0jSdmMm+jxYjz9WltFLSaaiQAbKM1nBLWIPLf7L1KMSjG
	aL/jgvxJ1hq6JAL2Vvl8IV3U3/x7mJhFw9S4RzcdYcJQ7Xya5DkOVQKmhoWhOnUBYDmsnjvPi/i
	Wl7ogDyaiKds9yP7yRMDx4b2gOAn5ZFMh4+xau6QbB390QwI1nUJYVjFg==
X-Received: by 2002:a17:903:32cc:b0:2dd:b95a:e1db with SMTP id d9443c01a7336-2df8e71892amr163485735ad.3.1790687437771;
        Tue, 29 Sep 2026 06:10:37 -0700 (PDT)
Received: from chenyou.. ([140.116.39.229])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df9142969esm57363705ad.45.2026.09.29.06.10.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 06:10:37 -0700 (PDT)
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
Subject: [PATCH 3/4] docs/zh_TW: move gdb-kernel-debugging to process/debugging/
Date: Tue, 29 Sep 2026 21:10:17 +0800
Message-ID: <20260929131020.266120-4-chenyou910331@gmail.com>
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

The English original moved from dev-tools/ to process/debugging/ in
commit d5af79c05e93 ("Documentation: move dev-tools debugging files to
process/debugging/"), but the translation stayed behind.
checktransupdate.py locates the English original from the translation's
path, so it currently reports:

  Cannot find the origin path for
  Documentation/translations/zh_TW/dev-tools/gdb-kernel-debugging.rst

Move it to match the English layout, and fix the relative path of the
disclaimer include, which is now one level deeper.  zh_TW has no
process/debugging/ directory yet, so add an index.rst translated from
the English one, listing the guides not translated yet under TODOList,
and link it from process/index.rst in place of its TODOList entry.

The baseline needs a caveat.  The translation lacks
commit 6b219431037b ("docs/scripts/gdb: add necessary make scripts_gdb
step"), which went in before the move, but checktransupdate.py does not
follow renames and cannot report a change made at the old path.  Use the
move commit, the oldest baseline the tool can see, and record the
missing change here instead.  The tool will list
commit 09e1d93a421f ("scripts/gdb: update documentation for
lx_per_cpu"), which already edited this translation, together with the
one later change it really lacks, commit 7f7f468548ce ("Documentation:
Provide hints on how to debug Python GDB scripts").

For the new index.rst the tool will also list
commit a592a36e4937 ("Documentation: use a source-read extension for the
index link boilerplate"); that change only removes the index-link
boilerplate, which this translation does not carry.

update to commit d5af79c05e93 ("Documentation: move dev-tools debugging
files to process/debugging/")

Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
 .../translations/zh_TW/dev-tools/index.rst    |  1 -
 .../debugging}/gdb-kernel-debugging.rst       |  2 +-
 .../zh_TW/process/debugging/index.rst         | 70 +++++++++++++++++++
 .../translations/zh_TW/process/index.rst      |  2 +-
 4 files changed, 72 insertions(+), 3 deletions(-)
 rename Documentation/translations/zh_TW/{dev-tools => process/debugging}/gdb-kernel-debugging.rst (99%)
 create mode 100644 Documentation/translations/zh_TW/process/debugging/index.rst

diff --git a/Documentation/translations/zh_TW/dev-tools/index.rst b/Documentation/translations/zh_TW/dev-tools/index.rst
index 915449762d1a..fafebd092a3d 100644
--- a/Documentation/translations/zh_TW/dev-tools/index.rst
+++ b/Documentation/translations/zh_TW/dev-tools/index.rst
@@ -26,7 +26,6 @@ Documentation/translations/zh_TW/dev-tools/testing-overview.rst
    sparse
    gcov
    kasan
-   gdb-kernel-debugging
 
 Todolist:
 
diff --git a/Documentation/translations/zh_TW/dev-tools/gdb-kernel-debugging.rst b/Documentation/translations/zh_TW/process/debugging/gdb-kernel-debugging.rst
similarity index 99%
rename from Documentation/translations/zh_TW/dev-tools/gdb-kernel-debugging.rst
rename to Documentation/translations/zh_TW/process/debugging/gdb-kernel-debugging.rst
index 8faa87f26c6a..a9ca1156fea6 100644
--- a/Documentation/translations/zh_TW/dev-tools/gdb-kernel-debugging.rst
+++ b/Documentation/translations/zh_TW/process/debugging/gdb-kernel-debugging.rst
@@ -1,6 +1,6 @@
 .. highlight:: none
 
-.. include:: ../disclaimer-zh_TW.rst
+.. include:: ../../disclaimer-zh_TW.rst
 
 :Original: Documentation/process/debugging/gdb-kernel-debugging.rst
 
diff --git a/Documentation/translations/zh_TW/process/debugging/index.rst b/Documentation/translations/zh_TW/process/debugging/index.rst
new file mode 100644
index 000000000000..4440aa6a97e2
--- /dev/null
+++ b/Documentation/translations/zh_TW/process/debugging/index.rst
@@ -0,0 +1,70 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. include:: ../../disclaimer-zh_TW.rst
+
+:Original: Documentation/process/debugging/index.rst
+
+============================
+給Linux核心開發者的除錯建議
+============================
+
+一般指南
+--------
+
+.. toctree::
+   :maxdepth: 1
+
+   gdb-kernel-debugging
+
+TODOList:
+
+* driver_development_debugging_guide
+* kgdb
+* userspace_debugging_guide
+
+特定子系統指南
+--------------
+
+TODOList:
+
+* media_specific_debugging_guide
+
+一般除錯建議
+============
+
+視問題而定，可用來追蹤問題、甚至用來確認問題是否真的存在的工具也各不相同。
+
+第一步，你必須先弄清楚要除錯的是哪一類問題。根據答案的不同，你的方法與
+工具選擇也可能有所不同。
+
+我是否需要在存取受限的情況下除錯？
+----------------------------------
+
+你對機器的存取是否受到限制，或是無法中斷正在進行的執行？
+
+在這種情況下，你的除錯能力取決於發行版所提供的核心內建的除錯支援。
+Documentation/process/debugging/userspace_debugging_guide.rst 簡要介紹了在
+這種情況下可用的各種除錯工具。在大多數情況下，你可以查看/boot目錄中的
+設定檔，來確認你的核心具備哪些功能。
+
+我是否擁有系統的root存取權限？
+------------------------------
+
+你能否輕易地替換有問題的模組，或安裝新的核心？
+
+若是如此，你可用的工具就多得多，相關工具請參見
+Documentation/process/debugging/driver_development_debugging_guide.rst 。
+
+時序是否是影響因素？
+--------------------
+
+重要的是弄清楚你要除錯的問題是穩定重現（也就是給定一組輸入時，總是得到
+相同的錯誤輸出），還是時有時無。如果問題時有時無，可能有某種時序因素在
+作用。如果在程式碼中插入延遲確實會改變其行為，那麼時序很可能就是其中一個
+因素。
+
+當時序確實會改變程式碼的執行結果時，用簡單的printk()來除錯可能行不通；
+類似的替代方案是使用trace_printk()，它會把除錯訊息記錄到追蹤檔案，而不是
+核心日誌。
+
+**Copyright** ©2024 : Collabora
diff --git a/Documentation/translations/zh_TW/process/index.rst b/Documentation/translations/zh_TW/process/index.rst
index de99156324df..bd638264bbe4 100644
--- a/Documentation/translations/zh_TW/process/index.rst
+++ b/Documentation/translations/zh_TW/process/index.rst
@@ -88,12 +88,12 @@ TODOList:
 .. toctree::
    :maxdepth: 1
 
+   debugging/index
    security-bugs
    embargoed-hardware-issues
 
 TODOList:
 
-* debugging/index
 * handling-regressions
 * threat-model
 * cve
-- 
2.43.0

