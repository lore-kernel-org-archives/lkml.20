Received: from mail-pj2-f39.google.com (mail-pj2-f39.google.com [74.125.227.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E66125187E6
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 13:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790687516; cv=none; b=DcKpl3gOAXJFLAdjmi4v2CS7jNgjY66BcTt4PAaXDH7mcgdZjoCwMRwROO8o6nR9Vh4V9FIW1/Tsa6fxclOOK3+/0FyUlQ6MNtOqrbkATGHcHwSIQIdlmBJtJG5U2BzjVORhENhQIDUUuMwUN4aAbEyDB5oqDWq7nnEbFuADEVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790687516; c=relaxed/simple;
	bh=f9OWPjywnn9cieTQadkrLXGaYCUgFX+jTUi1OC4QSDQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kFSO0yMrN288WtxzItZKgusgL4LitbPDTTF0+v1N7yGwbJQXkpAKMr4rt8wOt+Ssjf+9AEAvDv4Oear3HskJ4IG3kRqTpbV7ofDpxVguouWtvSKYxGU98IeAl58ByNY8sYizuIVfcL0wIV+Bsz0oroj7iMxyDmEzp2s2EFIYrGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gTsXFcXJ; arc=none smtp.client-ip=74.125.227.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gTsXFcXJ"
Received: by mail-pj2-f39.google.com with SMTP id 98e67ed59e1d1-3a49ec27989so119978a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 06:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790687514; x=1791292314; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XIcMA9FcwOdRmoFTj6kPSo7KelWNNXEGT3aOLQGVOS0=;
        b=gTsXFcXJWkhW/r8hgmP9EgYlEW0aMcpTA9aA8jd5X4WB0aIAChlYNwR9O31WDZ0hOW
         3S0VEAgQ6sVTOkBkqhvgMqvcVM4NlmI6UYwSM2IFDQN4zyL8CsoYBsSkspRMv43UBNL/
         1JwAoNYfKtCJMY6+sxGtSOGtH50dRbB+XoQ9C8PoFyEEHpIT2iW5Ti3rKNqQPalUyEMj
         Hm8PCxRwYCLaB37c128N4vskr5H3hFYp8ltqFuIgqeo6gixEkm4kc9hVGR6efBTmzmeH
         qtRTrzt0YuGoES7IfxlYOzUYIEBSITo79h12qQ76jrRdeqvV2iVeY/pdYVyidGUfScEU
         RYSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790687514; x=1791292314;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XIcMA9FcwOdRmoFTj6kPSo7KelWNNXEGT3aOLQGVOS0=;
        b=j0hUEHkZBYgkkR9vxEw03VItERONBQyrBAgP5CDgaJtH0fmLilprXdnllFbrSeGurJ
         8BUN7Hibin6hGFcAYvWfhe6C0v1aYcHAjLJLyAnShsvaklq7TN9d9oeMlJ0iy+7CyIM1
         rpVEfyiOyIcTnXSB/VR7rn+5+nZCmqStuC6R8coVXywK4VzRYHrrWU2Tm8Ow+PDPQWIg
         pEaokgLPBpzF8P9hOOfi5Cclq6qbvYXv2SWtAjm5GzWXQXkHhJPfljuZy4YqUVYxV7e4
         5yu9WtcSIgaac7yD43S2o3Mf2WHYFEjQi5ft7b4ed7hajA+vFrQHEreoUtkHWdJKBI47
         T1bw==
X-Forwarded-Encrypted: i=1; AKwUvBxa3v+9MpO00wUevrx6pIap3JSwZhH7w2YEIXsJN1RDpesi4idlHrzaLfobUQ7tuC+nSOnMpddrKZRGleM=@vger.kernel.org
X-Gm-Message-State: AFq9FYK/nUslWCEeKssCFA+Mdu/UXbzzQUZg3+cftqE3DIyW1qRR8O20
	/B1ZEp7IKhaa0+kdgndCv4ZxD2kn3uiSeHkrgtP9G613IUgzkEh3tWdO
X-Gm-Gg: AYBFou3LvcbLjbhsWxwzJLuPpdBK44hQDMJSxRcg13YsBpppsQxEMn7A66WgnE2V2ki
	Ffb4v4l09g7BVPDetdQW7EwrwvL8sSUGsCywkhlbZ+jL2glemvZwbs69Gd3QBbMCHakmoVvxrKf
	KNZjwdzNvgdR0LcfpYpSZmLswokweZbOMNo/BOtUSU1K8zveTstqNF2UATOJySUrjhIRmA/7Vys
	XdpCBj1+m7IX5kMqa5LYS7Ndu8vcB49l4h/wlTIEvYb34L22i4Hl3f4JzMWxI3bZ8MKYd5JM7TE
	mh/9UMkMvtKAtnEt2B0XtOgcCsvi63Y/lPuI6cQbAF4icEdb9p4bcLgU5NFYzhCU6+CoBEo7bh7
	ub35Hd8Ix42Z7TdmtgGlah1OwN68hcOT2VP5IplI+/mqn7aGWwlwZ0fzExKIDgSJdp2GQ7RZNwR
	DWkleRb4t78spGU6oo5PK+fFfTcqPPdv1IWzsxE3MLVm+cfe7RxyzYsVlPh/QnP819Jm7/NzFb8
	3O2kceyM4v2tWK1MUs220NHfLn2OFeicEhZKiDEajqDw9pqyYiCaqCpLQ==
X-Received: by 2002:a17:90a:157:b0:3a0:bcc8:1549 with SMTP id 98e67ed59e1d1-3a0bcc8160dmr10751630a91.6.1790687513525;
        Tue, 29 Sep 2026 06:11:53 -0700 (PDT)
Received: from chenyou.. ([140.116.39.229])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4985fed22sm5582137a91.9.2026.09.29.06.11.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 06:11:52 -0700 (PDT)
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
Subject: [PATCH 1/3] docs/zh_TW: add a notice for translations not kept in sync
Date: Tue, 29 Sep 2026 21:11:38 +0800
Message-ID: <20260929131142.266819-2-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260929131142.266819-1-chenyou910331@gmail.com>
References: <20260929131142.266819-1-chenyou910331@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

As agreed in the zh_TW scope discussion, translations that nobody keeps
in sync with their English originals should say so in the file itself,
rather than leave readers to find out.  Add the notice as a shared file
included at the top of each such translation, the way
disclaimer-zh_TW.rst already is.

The notice carries no :orphan: marker.  Included after
disclaimer-zh_TW.rst it would not be at the start of the document, and
Sphinx would render it as an empty "orphan" field; Sphinx does not warn
about a file that is only ever included, so the marker is not needed.

Start with the two files in process/ that are not in sync.  process/ is
the part of zh_TW that is kept current, but security-bugs.rst and
debugging/gdb-kernel-debugging.rst only moved there with the recent
relocations and have not been updated yet; they carry the notice until
they are.  The rest of the tree follows in the next patch.

Link: https://lore.kernel.org/linux-doc/CAKspUhJAbCWoxgh2eq8R5g_MiNK=oXgKPUWqGOpHh0w1-Fv74A@mail.gmail.com/
Link: https://lore.kernel.org/linux-doc/aqFPBQxq5asHzvtn@wyuan.org/
Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
 .../zh_TW/process/debugging/gdb-kernel-debugging.rst        | 1 +
 Documentation/translations/zh_TW/process/security-bugs.rst  | 1 +
 Documentation/translations/zh_TW/unmaintained-zh_TW.rst     | 6 ++++++
 3 files changed, 8 insertions(+)
 create mode 100644 Documentation/translations/zh_TW/unmaintained-zh_TW.rst

diff --git a/Documentation/translations/zh_TW/process/debugging/gdb-kernel-debugging.rst b/Documentation/translations/zh_TW/process/debugging/gdb-kernel-debugging.rst
index a9ca1156fea6..45f178c0bf59 100644
--- a/Documentation/translations/zh_TW/process/debugging/gdb-kernel-debugging.rst
+++ b/Documentation/translations/zh_TW/process/debugging/gdb-kernel-debugging.rst
@@ -1,6 +1,7 @@
 .. highlight:: none
 
 .. include:: ../../disclaimer-zh_TW.rst
+.. include:: ../../unmaintained-zh_TW.rst
 
 :Original: Documentation/process/debugging/gdb-kernel-debugging.rst
 
diff --git a/Documentation/translations/zh_TW/process/security-bugs.rst b/Documentation/translations/zh_TW/process/security-bugs.rst
index 76a78746ca4e..783d7c77b5fa 100644
--- a/Documentation/translations/zh_TW/process/security-bugs.rst
+++ b/Documentation/translations/zh_TW/process/security-bugs.rst
@@ -1,6 +1,7 @@
 .. SPDX-License-Identifier: GPL-2.0
 
 .. include:: ../disclaimer-zh_TW.rst
+.. include:: ../unmaintained-zh_TW.rst
 
 :Original: :doc:`../../../process/security-bugs`
 
diff --git a/Documentation/translations/zh_TW/unmaintained-zh_TW.rst b/Documentation/translations/zh_TW/unmaintained-zh_TW.rst
new file mode 100644
index 000000000000..4b4eb63d749c
--- /dev/null
+++ b/Documentation/translations/zh_TW/unmaintained-zh_TW.rst
@@ -0,0 +1,6 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. warning::
+     本翻譯目前無人維護，沒有與英文原文保持同步，內容可能已經過時。如有
+     出入，請以英文原文（見下方的Original欄位）為準。如果您願意協助更新本
+     翻譯，歡迎將補丁提交給繁體中文文件的維護者（見MAINTAINERS檔案）。
-- 
2.43.0

