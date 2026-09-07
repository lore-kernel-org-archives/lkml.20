Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 523D5407CCF
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 10:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788777485; cv=none; b=ozme9wnRzcOCdaj+7Es3twN3ZupDP3gk7jlalvgLywtUJ6ghtVoBliJ8jB8xgMl8VX5oGblI8uce2sFIS0RUGHhBNd014k2cY2qu3zoRHTq2Q+Qy3JjP42idXHeeRDj1F6ZGrOwMv8orKRxxr4qJwqdjo3ZYCuQobpBoOZ2ShsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788777485; c=relaxed/simple;
	bh=QmR/Yx3GrmMipQLhapvopexweDGgNDUHESy75coOzxM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dNn5rzAD6c44V2NqOuX/19ebcfdFRFz+I+IJnwUv0pPJewHiB5Hzww8v+9+TKZ6C8f9PsBBltwtxzxnJhVh75Esftnd6K9Mu7cByn8wOxpIdDQwytKFJMMSs6GUxUAIqbV/zyXWc2c4F2VTkwAofttWQBpuH295AKkuI5Nj6sy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jRysfNPx; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jRysfNPx"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49b0d8bc2aaso43233935e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 03:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788777481; x=1789382281; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=f3dNc7Al5lEDIZNoArJSIQ8XFdfYUdjRGc8JYGTevN8=;
        b=jRysfNPxAaRespYuYAXv0Wh42dSEnnYk463AOwDHEO5PUTfbri8mkeAVb65wSpeMJL
         Vj+uFukEVJVJDafsY+mangsQ2asvI5BaLPDL5TLQGrpZLZZDTTVnZPr2NBxAH9MpFhAY
         fy0N+/U3MHLgKaZYuzwi7apltQPeeg8QqQ5kAgT/bt3qB9D7OK1xCfBHNc42p6z0rmk8
         OCn3E1tJd/1/zo17U1UA1j2+Vq9+TKLd91wAbKQOUOCrhbu0c6cxeaBuEK4mNGpsBKd/
         fBDqtAACalLoRBBGJxJlshf7W1Q0DMki2hemYXTromSt4wpwAf6rCMpC8uvrYWa1Zjsq
         Tt9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788777481; x=1789382281;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f3dNc7Al5lEDIZNoArJSIQ8XFdfYUdjRGc8JYGTevN8=;
        b=b/4QqAfY25xqxBR69SO67YBUZlCi4yzn4tbRiCD5oYWcYBCWQPcG3Dyb5wrwScjR6T
         SiEH2WKgjbZoYYZmqr9ILjGQ3Sgup4Z1Xkb/f0SnWkYBlQbG73klC9iROn4sXfyrpSjo
         C4PFCKs/vTdzT8MK0pxsLgHllVA/a6+KHaCvpWqqRopaLzSRcRv57W04ywXQrpWh5ZDD
         8wGi4vz085qP6B1yrq03PY9W3hHXQXnKspoE9LSawdBu38UUiBKTCVjkVL5xBBT4GGn8
         GWsRzHs47erfGV6NxfL3+8h0HIVzRySs4J4lQ3vTUvaXP3b9qjBupIP2lh6+Yp2PLYWy
         n8UQ==
X-Forwarded-Encrypted: i=1; AKwUvBychE/0RfE79Yle7X7h0t4lExmxP+esysVJdO3gwR8iRHPN+28qMITs3zoKSMyX/DmDD+LdBOj+6LPLZIA=@vger.kernel.org
X-Gm-Message-State: AFuF++lL8e6x/dkhc03L5iWDxqTQGHHfrSi6JUpRT/vrEXNO9eZoyA51
	2QatqBdbQNqKXqvQd4TcptkeGLtMy79dxlXpKXMPIH5GUEZpekb0r73F
X-Gm-Gg: AYBFou1uOB/XvdTcApx7GqHi1XhXQ/6GXIkVMAjssd1F1EYcLEVAA5X2KvcHbMf6x8N
	UKx8EgCAAUnt99KbrC9R9dDyMBhAC0Oz2iUkY5ir1b7ORBBXf3hahly4dGPBaNMTfDsmvLkt48s
	jyIPA+3iQUXXhrLtIBftpRNAWru4poqZhRNVCKCeQGwre0XU5N3uSUtAG9LL73vw+o77dYDoxHg
	soXuZRvDs4gb8uymjLRFMcpx1oz2Ls9mCq0xJgUDn3/qsLxQ7hj8ExHlYCGCLT1iED8HkZl0+MU
	KaX22A97Jf+0QFXzsWuiluW+sugCL38nwnCN20TghIUpHwmom4M/vvHHTlCc/3d6feN3eo2yqbn
	MRKue1R6SYFFOt3SiPul6id30I4JnZjSYfUF1q5jw/tWNJWXm99AgwYJlknCeHImBXVHwngyRyq
	s19Npvtsmy6GD41Nys2hyZwy1NWMIECYYjcbmHwlCtB2sg2O/45TNpNCk6V4gIhqiLTA/2KcF+s
	gexYFTXtrh6l57c2ysTTyqHMHyXjxZWs07fzyBkJrah/f/n5ReDcoExBz9wiQ==
X-Received: by 2002:a05:600d:8481:20b0:49c:fde6:8b39 with SMTP id 5b1f17b1804b1-49cfde68bacmr131347985e9.29.1788777481081;
        Mon, 07 Sep 2026 03:38:01 -0700 (PDT)
Received: from localhost.localdomain ([95.3.12.38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce5533ffbsm311944285e9.3.2026.09.07.03.37.59
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 07 Sep 2026 03:38:00 -0700 (PDT)
From: Erkan Erdem <hexvalid@gmail.com>
To: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>
Cc: Erkan Erdem <hexvalid@gmail.com>,
	Julian Braha <julianbraha@gmail.com>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-doc@vger.kernel.org,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Kees Cook <kees@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	llvm@lists.linux.dev
Subject: [PATCH v2] docs: kconfig: fix shell function syntax in caveats
Date: Mon,  7 Sep 2026 13:37:37 +0300
Message-ID: <20260907103739.23212-1-hexvalid@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Kconfig separates a function name from its arguments with a comma, but
the caveats section uses Make-style whitespace in its shell calls.
These expressions expand as undefined variables rather than invoking
the shell function, so the supposedly working CC_HAS_ENDIAN_FLAG
example fails to parse.

Add the missing commas to the shell calls in this section. Keep the
Make examples unchanged.

Fixes: 316d55d55f49 ("Documentation: kconfig: document a new Kconfig macro language")
Assisted-by: LLM
Signed-off-by: Erkan Erdem <hexvalid@gmail.com>
---

Changes in v2, addressing Julian Braha's review:
- Remove whitespace after the comma in the three remaining shell calls.

v1: https://lore.kernel.org/all/20260905124045.42713-1-hexvalid@gmail.com/

The issue, patch and changelog were prepared with an AI coding assistant.
The assistant also prepared the v2 revision and ran the checks below.

Validation:
- Re-ran the documented working CC_HAS_ENDIAN_FLAG example using the
  Kconfig conf tool built with Clang on macOS. With a test helper returning
  y for either endian flag, the original example fails to parse; v2
  executes both probes and sets CC_HAS_ENDIAN_FLAG=y for both endiannesses.
- Rebuilt the changed page alone with Sphinx, treating warnings as errors.
- The complete kernel documentation set and kernel were not built.

 Documentation/kbuild/kconfig-macro-language.rst | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/kbuild/kconfig-macro-language.rst b/Documentation/kbuild/kconfig-macro-language.rst
index 6163467f6..c427bece3 100644
--- a/Documentation/kbuild/kconfig-macro-language.rst
+++ b/Documentation/kbuild/kconfig-macro-language.rst
@@ -225,7 +225,7 @@ not work::
             $(MY_TYPE) "foo"
             default y
 
-Obviously from the design, $(shell command) is expanded in the textual
+Obviously from the design, $(shell,command) is expanded in the textual
 substitution phase. You cannot pass symbols to the 'shell' function.
 
 The following does not work as expected::
@@ -236,12 +236,12 @@ The following does not work as expected::
             default "-mlittle-endian" if CPU_LITTLE_ENDIAN
 
     config CC_HAS_ENDIAN_FLAG
-            def_bool $(shell $(srctree)/scripts/gcc-check-flag ENDIAN_FLAG)
+            def_bool $(shell,$(srctree)/scripts/gcc-check-flag ENDIAN_FLAG)
 
 Instead, you can do like follows so that any function call is statically
 expanded::
 
     config CC_HAS_ENDIAN_FLAG
             bool
-            default $(shell $(srctree)/scripts/gcc-check-flag -mbig-endian) if CPU_BIG_ENDIAN
-            default $(shell $(srctree)/scripts/gcc-check-flag -mlittle-endian) if CPU_LITTLE_ENDIAN
+            default $(shell,$(srctree)/scripts/gcc-check-flag -mbig-endian) if CPU_BIG_ENDIAN
+            default $(shell,$(srctree)/scripts/gcc-check-flag -mlittle-endian) if CPU_LITTLE_ENDIAN

base-commit: 4d7d9486c04d917265f64c55bd23b2cc4fe7749c
-- 
2.50.1 (Apple Git-155)

