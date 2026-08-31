Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EA95521209
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 13:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788183847; cv=none; b=nCuV7fes+9+NHw+tp3Why3oMVmjans47t6xZ39LHhkfDypVrbz8n69srvuI0ng9hfyXDRlLptzS0oLgEw4f/KEp3D+unNmF/0LZESOa3z1Eq+135dBiNVY9T2cTpZkvDWLbjL+BJOTfgL0Qs+IlsNzN3tSXenuoiFVpbT5oQ2uQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788183847; c=relaxed/simple;
	bh=fyWbhtzT0xB9R9l0HZykNsRdPU4U/mfBjRTAVFd19f8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=cgb8boCHIMuN8tFgNvWOgCxH8m/H+2Nim72IgUpLB2GE1ZFTfrs7vSufMj+g9erTS35+VBwvZzzO5MjDlodbZqDng1rf611bAM+zoYmtFbx16kKpfXifTMm8HSKSHaQ3mCsg5vF8vZokcK7ZANcE/kbtbrONBElbpjd5luAeheQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oDlIzal3; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oDlIzal3"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4956869750eso22769175e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 06:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788183843; x=1788788643; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SzlwyLZN9eqId7ybekFhy3BedoUz5HO9PJUmsOGl30I=;
        b=oDlIzal3mhwEJ5tcqBg1Mf1aKeoAPMm6tc022k6xdmsrjIcXvV3VZYFef6Ohzf1x8R
         AHm611/0l9vui149dC27OCSiOapk4zqGY5fxCH2XSPgdytA37t/9U2igvrNmIr9HvvSX
         iDmHgX0RLJW5hMRs1A7NCKLIG84Vlqt81rdv+87VWgSV9K9hjjVNWdb8BZ7lW/vkZx49
         ACAv5HAA38dKSnIwhCsX8pi9hg9rtVQegtPGZdErZMvZL24hGL6peO6VE62ZTrESXM+t
         fpSf/fGcOg9qHftmlIa9U7t307doqNLyw/u97NLNmhLWOJs15YNyhQQxX3q1nizywk6G
         Os+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788183843; x=1788788643;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SzlwyLZN9eqId7ybekFhy3BedoUz5HO9PJUmsOGl30I=;
        b=TnczusDR65EEtzTUYnNRuOkewhhktewZ7imUz7BD5iFsTDAlDUBhwKQsiq8jrd4PiT
         YgzXEypNTcNs3FnCoMitkdveOaNFGwkK/R5vKHqCaXpIbbk1RKaC2amvAaZhCRXW+0n+
         k1yOOfT2nd2g19TQ5fLzzJvd10THFi3wTyUkDqvs80d7NpGha0gonJeUvnSCJyU91PhA
         axu50MlI3DvMhDhmmUNzaKxuxxWs2Y+kkow3vg94D602yYUs3pHSO/4TBvcgTJxp/g33
         ezPCFyGIU5TzIIYfx5bQn3DSnsggX5Nzh25fKgUhdXpXM8TNti8nqF9s0tihE5pTD6Lv
         cB5Q==
X-Forwarded-Encrypted: i=1; AHgh+RrAKNhj+iOXDiWpZswc09cU/7s6u3AIqByR63g559TdK8UisnQm0kBoYpdHYoU1WGitjUHAFm+s1kaq9vs=@vger.kernel.org
X-Gm-Message-State: AFuF++kO5dWKCdiiMwlgocbcwUwvduQlr/1kllBRJvzYktzvfaT66bHj
	IEzy17dbvkeOc+mCna9j7UIDP1ygrz+7c73ssVesw0UfykkyX3NikrEZu3T/3w==
X-Gm-Gg: AR+sD13sa6KKUEeKQWhmHA36CZnZRFgfjEDNhjbFZaHzYccm7rF7WIcM1Nfvr/M3GWH
	XJaWvd5NX5yOHhp2etIuuuWBy2+bhEE/MupcDbj+7kIhpl7hrS6d65xej5ilbWeT/bPyKW0Nywh
	S9OGJzLpQ2AG6ttrGaBUTbBD5MwLeE48/owS5T1tmlr4pxvG8vO7bUAuGBrdTBXN60jWQNDLuUX
	qIZ1PPqX1+8pUbhs/ChgxbB2c0dASzUm44Ig9muJK/S9/N6RQF2GgMbcI80FKDNuG+nu69XyJZE
	mIvNrzonYHzv2unYjndFsXwF+gsG46OiybDx7ioVbqm4imZN91hugHth/tq4co5PE/F79QyekTt
	6udfvy25xGfW9Wv25JRrx6svKkwaqnq8ixhzVK2Thy+0uLbH1hgfsl3Wo3c7D6VGTeWHZD1QCpy
	sRhQk+CX8wjyQCs6Y54f6lS6zSuNNUswxKLcGW4DWSiM+Wv0N54Ze5lhu+zHJMAWu4vvBXPpqer
	N5M6obBUx5/C5BehDb/AnWgRa7P38mGUVsR9snhy32Z
X-Received: by 2002:a05:600c:4453:b0:499:8777:ccba with SMTP id 5b1f17b1804b1-49b91c486abmr346085025e9.12.1788183843113;
        Mon, 31 Aug 2026 06:44:03 -0700 (PDT)
Received: from ptb-02009389.paris.inria.fr (wifi-pro-83-187.paris.inria.fr. [128.93.83.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cd2922ebdsm167798735e9.3.2026.08.31.06.44.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 06:44:02 -0700 (PDT)
From: Ella Ma <alansnape3058@gmail.com>
To: Julia.Lawall@inria.fr,
	nicolas.palix@imag.fr
Cc: alansnape3058@gmail.com,
	linux-kernel@vger.kernel.org,
	cocci@inria.fr
Subject: [PATCH] coccinelle: free: add a checker for `__cleanup(kfree)` usage
Date: Mon, 31 Aug 2026 15:43:36 +0200
Message-Id: <20260831134336.45540-1-alansnape3058@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using __cleanup(kfree) will pass the stack address of the annotated
local variable to kfree functions. This will lead to invalid
deallocation issues. Inspired by CVE-2026-45959 and similar bugs
recently detected.

Signed-off-by: Ella Ma <alansnape3058@gmail.com>
---
 scripts/coccinelle/free/cleanup-free.cocci | 94 ++++++++++++++++++++++
 1 file changed, 94 insertions(+)
 create mode 100644 scripts/coccinelle/free/cleanup-free.cocci

diff --git a/scripts/coccinelle/free/cleanup-free.cocci b/scripts/coccinelle/free/cleanup-free.cocci
new file mode 100644
index 000000000000..cdf984ac6b44
--- /dev/null
+++ b/scripts/coccinelle/free/cleanup-free.cocci
@@ -0,0 +1,94 @@
+// SPDX-License-Identifier: GPL-2.0-only
+///
+/// Find __cleanup(kfree)
+/// Using __cleanup(kfree) will pass the stack address of the annotated
+/// local variable to kfree, causing an invalid free.
+/// I.e., `T v __cleanup(kfree);` --> `kfree(&v);`
+/// Such usage is impossible to be correct.
+///
+// Confidence: High
+// Copyright: (C) 2026 Ella Ma
+// Options: --no-includes --include-headers
+
+
+// Suggesting using __free for the functions with a DEFINE_FREE definition.
+// Update this list when new DEFINE_FREE definitions are added.
+@free@
+attribute name __cleanup;
+symbol kfree, kfree_sensitive, kvfree, kvfree_atomic;
+type T;
+identifier v, n;
+position p;
+@@
+
+(
+  T v __cleanup@p(
+(
+  n
+&
+(
+  kfree \| kfree_sensitive \| kvfree \| kvfree_atomic
+)
+)
+  );
+|
+  T v __cleanup@p(
+(
+  n
+&
+(
+  kfree \| kfree_sensitive \| kvfree \| kvfree_atomic
+)
+)
+  ) = ...;
+)
+
+@script:python depends on free@
+p << free.p;
+n << free.n;
+@@
+
+coccilib.report.print_report(
+  p[0], f"ERROR: found `__cleanup({n})', do you mean `__free({n})'?")
+
+
+// Reporting __cleanup usage for the functions without a DEFINE_FREE definition.
+// The following list only contains frequently used functions. Supplement it if
+// necessary.
+@cleanup@
+attribute name __cleanup;
+symbol kvfree_sensitive, vfree, vfree_atomic;
+type T;
+identifier v, n;
+position p;
+@@
+
+(
+  T v __cleanup@p(
+(
+  n
+&
+(
+  kvfree_sensitive \| vfree \| vfree_atomic
+)
+)
+  );
+|
+  T v __cleanup@p(
+(
+  n
+&
+(
+  kvfree_sensitive \| vfree \| vfree_atomic
+)
+)
+  ) = ...;
+)
+
+@script:python depends on cleanup@
+p << cleanup.p;
+n << cleanup.n;
+@@
+
+coccilib.report.print_report(
+  p[0], f"ERROR: `__cleanup({n})' will free the annotated variable, rather than its pointee")
-- 
2.34.1

