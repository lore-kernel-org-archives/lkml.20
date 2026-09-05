Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70A4349F130
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 12:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788612058; cv=none; b=mAt3teRoaSipfFvdXqn2MzUTBn9OW7phvYwXviWmJ6/22a63hYPaalLsH1VNWdBviFFaPILTxp/HKy9l2hnmzsreupWJc8l7QBdggni6HZv6vVJVfhYEBMVPF5N/oOX4ek41hOmel8xlPqRv2TQm1MYfusLl3k/Zrb927bZ43F0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788612058; c=relaxed/simple;
	bh=91ejPOUpBNQRSTphrYpjdfpBj6miXLi2eFQAv88zwKM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bOK9TjgUPbYQtoGkFOVXdVOR0oGFvVc5DPUMx7IbbFzFY/eX3sujFSBpm3NDvnEXGDgZaabl3t6u3JB8e+XMWfJszOPPPcDRlQIbWgUKqEuWV1bjkjKWgu7y+vlLhrvgWtap1FUX4DwgbRi/luq/k5K00u69h8fxLuXlZbVuEPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hSj4cd7q; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hSj4cd7q"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49d036e0e99so2724195e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 05:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788612054; x=1789216854; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KskTBUozJ4EcI4scTcf0nV7JQH2rdRSj0aYV0ycw1Rk=;
        b=hSj4cd7qHnjjTmSpoSN43uIJy8zqNIVFFg9BSmEpSvT5gdZBIDAQ7zVyf2w9u11aIe
         cJB8bvAGmu6odUHoB2WTg6psuY0Wx9fsCdMze+MU5QTqDgVoNdjYE0zoQBN/vbsOaZfj
         L0+w6bI5UDJ5kAIIacikd5zxmbK3f9rb2x2yi4kjYfGB1GaQ6qgvA2Tnn0Aby4EBc7LC
         XbJAa2AXE3jr576Pa348bwMsJeEnGtTnkk5XPapLD2jpbtQoGNp+l+LCPnmYJenjhSca
         YUFAQt35totKmcZKJIVa9NHw9ua9SgCs8IBOl8SinqQN13xoEydJ1xPW3OXVvk1cHJvN
         xT6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788612054; x=1789216854;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KskTBUozJ4EcI4scTcf0nV7JQH2rdRSj0aYV0ycw1Rk=;
        b=VflwbI/5TNdcwGouRTR0zMo9EKf/7mxUJRJ/daySxl6SKQFO/iB+ijvlLRViH32pv+
         IZYjo5VJn0SG0O1xK/VfcnCttPSfjyIVE3e9MEVKZS2OHl9id7Y9gw1pUTcfRcx1OTtV
         8SVqKM6xdO0U8B9hlvheCW4Rc9F2ANTcWbB2HRx2rn8/XYV3qfOcylHAdFUY5FFTNW01
         sn+IhWnrnJEN0RPK1UDcKYa3mqKt8MreQey6fjl3hGPv0yzt8AoPuBatycNf7U+/EVin
         78rk1Gw09zZx+tcIirgi3Ox5aTWVuUeONHQhdsR9zIC+/O4+ltbflEq+6YW6fitW70MS
         yF7g==
X-Forwarded-Encrypted: i=1; AKwUvBwsuXpmpQHl3EHiYW6jOvfsT979kNtNI5sIrDs3YWyDf4VZx2yNtn8Tq04XA6gCVR1sYrVLcLFe+4TUDw0=@vger.kernel.org
X-Gm-Message-State: AFuF++kieQs1yGlpDKrKvJknAbBAnS6j8FqlNj/55ZWFgBz92qsTrONL
	TD1XE248FZ5DJkSiz9N1jvJ3khppf4iCVOE/Qiex54O4u0MobW5JkgheOqQDnBfOe2w=
X-Gm-Gg: AYBFou3CA+dOhs/EaJCRyuXXWosJViBL5P1BuHWAz9ySxoIxcWi9PaQUq05AmYY6peb
	gxwUGbmpXic8XQXTDeu317myfDgRsHf0p1T2xeGUvtrxrqkHRBdsDRxOj7v8fxPMZ08IrmDjZSn
	1DWQSWKJR1s06QmxqvD0Z9pAjuiL+9nUkxQWFBJYMAIhZeF+Ub1AeaHuneqB3RqtIQqXBrrhBWK
	stoWTXO0VQ/bK98KkCyqErDZeum5ubf8phO5BmHDwbf605lFe+2b++/Swj4fwVlQZWqpmSFyeIs
	M/ZVf9HbFfMxtLOJvvEESXNZtI9uTvmYuCUu/s7xhqSsu1QG1RQGnF5nyAX+NPU9CePbg+7bywz
	UbGOdBczE6r/wWVExEXq2klY+I1PJ2N6rSR4n4D+RYF/0C0VqA+xJztQU80Pur1Nq+XojGntVpJ
	qXiTMutnD3ofIWCSgS/mj9HF2URw445rMTTbkXlt5ZbYXf2awtMSUG65coKjpSELeJ+sFzyz8aO
	qyqFyLc5hocks5+rnNay1TIVqe6YFxgO1bjN2FpRSbdW+fy1/a1OUDz4aoFLsfvYzKd
X-Received: by 2002:a05:600c:4f12:b0:49c:fc6c:be00 with SMTP id 5b1f17b1804b1-49cfc6cbfcamr89384995e9.23.1788612054317;
        Sat, 05 Sep 2026 05:40:54 -0700 (PDT)
Received: from localhost.localdomain ([95.3.12.38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cff8195ffsm87742495e9.14.2026.09.05.05.40.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 05 Sep 2026 05:40:53 -0700 (PDT)
From: Erkan Erdem <hexvalid@gmail.com>
To: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>
Cc: Erkan Erdem <hexvalid@gmail.com>,
	Julian Braha <julianbraha@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-kbuild@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] docs: kconfig: fix shell function syntax in caveats
Date: Sat,  5 Sep 2026 15:40:45 +0300
Message-ID: <20260905124045.42713-1-hexvalid@gmail.com>
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

The issue was found and this patch and changelog were prepared with an AI
coding assistant after a request to find a small, verifiable Linux fix.
The assistant also prepared and ran the verification described below.

Validation:
- Built the current Kconfig conf tool on macOS with Clang, Bison and Flex,
  using -Wall -Wmissing-prototypes -Wstrict-prototypes -Werror.
- Extracted the documented working CC_HAS_ENDIAN_FLAG example into a
  minimal Kconfig, with a test gcc-check-flag helper returning y for either
  endian flag. Before: syntax errors and no helper invocations for either
  CPU endianness. After: both probes execute and CC_HAS_ENDIAN_FLAG=y.
- Built the changed page alone with Sphinx, treating warnings as errors.
  The complete kernel documentation set and kernel were not built.

 Documentation/kbuild/kconfig-macro-language.rst | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/kbuild/kconfig-macro-language.rst b/Documentation/kbuild/kconfig-macro-language.rst
index 6163467f..e15af278 100644
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
+            def_bool $(shell, $(srctree)/scripts/gcc-check-flag ENDIAN_FLAG)
 
 Instead, you can do like follows so that any function call is statically
 expanded::
 
     config CC_HAS_ENDIAN_FLAG
             bool
-            default $(shell $(srctree)/scripts/gcc-check-flag -mbig-endian) if CPU_BIG_ENDIAN
-            default $(shell $(srctree)/scripts/gcc-check-flag -mlittle-endian) if CPU_LITTLE_ENDIAN
+            default $(shell, $(srctree)/scripts/gcc-check-flag -mbig-endian) if CPU_BIG_ENDIAN
+            default $(shell, $(srctree)/scripts/gcc-check-flag -mlittle-endian) if CPU_LITTLE_ENDIAN

base-commit: 4d7d9486c04d917265f64c55bd23b2cc4fe7749c
-- 
2.50.1 (Apple Git-155)

