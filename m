Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11C7E3BE641
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 12:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788180285; cv=none; b=OkLC/vhekmZ6kXoCkWbMlfXao3KE2dyIbK0B6PimBQD+fRujVs7EK/GNpm/Bj4y8GpWZHyahCJFv7pSQrJ3mYB6M85ICr2KjNhnqOddX4bhgmGEWLxml2N8udLXZ2LQGCjFL4JP1s61eNa8jGwtkLibs5FWl+y0kfiG/A4TSW6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788180285; c=relaxed/simple;
	bh=ieW8SPMxZVYMz1PZK4Do85hK9SkYcf9i2XLHKmJvf3M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=H14i6uwPIVVBaBlSdx2oW8fQSxgNpXPF1THIh40nD5+uCLHOevi3IzTA7oV3GvjAyudivxfqhzghcXaw2hLb30J32jkkKoSRXnDIE2rQvOfMyu2nIqr6bNsLT0XCdFUrfPw5tDyQEHR7Js33nCAkuFoY2TrxNEfOWjSkbsiVyEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pTiNtH4N; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pTiNtH4N"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49b0d78a801so26459785e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 05:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788180280; x=1788785080; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SlVsigOsyI5pSYHNLCbGhr5C46qgzOkaqkdojr/8yc4=;
        b=pTiNtH4NtfcAVZCic2lAQiIV9FbdcbpxQV6+Y2CEV8ahGHq8mGBF32A0cU8S95mEGY
         k9URRSBiC1tg4ndhibBOl3I4Zs6n3LHmxXXWUEwjpMyeB+R6SLKoGBBLrCoOtG1jhtd+
         bmIdppsgnGxwnd+mVXSeVSvylfoLOvd7wQhO2VYBQYTE1Pg9Qn2TIF8+u18MlLuOk0SY
         NvG1tMKBH6n/4SYB0lpr3GQQAbSoHKSz3esv6Ib6JD6oG2I3pSvx4KKwOlFR+7AOWFj9
         IT8H5f96dAJybDb9keXji28XBckxkvIQUseL5v+TQovz2AnE2evny22o3Pxg3W3FmxMH
         1edQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788180280; x=1788785080;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SlVsigOsyI5pSYHNLCbGhr5C46qgzOkaqkdojr/8yc4=;
        b=NHXb77DHnXBu5MX4Zi7lhRcKgEHXq5qSjC/yQfRg41MJPN+SAk5oSnuw1pAbPRtICv
         lRzjxDGCf8BphHYVQeK4+4xtGvHEPQttqTBNnEV3WJGfpqsrW9aNuNc3mQHOcKXlIGov
         hBnyQlYdKjUMT+xrK2/Yi3gLnobKpQdNv9+G0dr0BW71vQSA+KO2cQuEj50sQK+fx3Uo
         0yZLLf2znMR0usqBemSb3pfd61aHmhz5gQYlrcXQk2IBgL+hlb0/6Y29PRN2ppXOUu0a
         ndGfSrbAGaCZbVxHCyYQxK4qzFgX+tUHyAsAyoAs5EuHYEvwnSR9wGYqMftemLgCYlJM
         r9ZA==
X-Gm-Message-State: AFuF++nnNOvTuvJsEtnoyURHFt9qBsVWUzm5rR1AQHKMgTbJKq0K1jM0
	4GIIjsuZiw0bpB4tOEjIFODVI9Lgyd5KLMmKspJU8smzf1mEXweK3TqU
X-Gm-Gg: AR+sD10xobLiURDaxNcH4Thakbct0P5Keo2QVsL3JOJBTHdPg/4G2wlhe3hfE4jVTQb
	FlZIvnm47iya/EJDm4eILcupCoLiKPaTuuVru160RPdtppj3Y7zrUQrt/e5+y+42U5gzwfHcM+i
	FN/BytBz8HLnapquQstU6Ae+qXw/t2fXbPu+MbKEV8fi9LsXk3xiU18SwylqmZdmkLBCbRU47W0
	qyAEXYjzfUItiaQmEjXJLcjkkohI6RaHdWTc45PyXhjVxv7hJQ1YHiKE4OZ5vOKM7trxgmfWyDg
	f8JiU8qeEJq5vWdjTE5Kx22XOxmEV9VlI80cJklD51pd/XReX/fZdwD58Zxct1/scNU1dVJ6MKC
	jy02GDqLOF5G/+fQ7D+di9RpFggRx7akKS9QrqPEbXEHkwTmlDfR4FrjRjX4+Zr31duj85psluf
	4J6qdq4S7E11BrXBHmGniv+Mf5IdNqluYApsJ8Vy+ZJBsSmB3ZY+NWntxUNEGl6BjqTHs0mWS7g
	IrY/rk5UmRZhqXDOmSNMqSCBw==
X-Received: by 2002:a05:600c:c490:b0:499:726a:a017 with SMTP id 5b1f17b1804b1-49b91c17294mr401756635e9.1.1788180279504;
        Mon, 31 Aug 2026 05:44:39 -0700 (PDT)
Received: from outlook.com ([2a02:587:6022:4b00:a9ef:be2f:5ede:8a37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b91728319sm264567205e9.12.2026.08.31.05.44.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 31 Aug 2026 05:44:38 -0700 (PDT)
From: Christos Skarlos <christosskarlos.kernel@gmail.com>
To: akpm@linux-foundation.org
Cc: linux-kernel@vger.kernel.org,
	Christos Skarlos <christosskarlos.kernel@gmail.com>
Subject: [PATCH] init: fix typos in main.c comments
Date: Mon, 31 Aug 2026 15:44:21 +0300
Message-ID: <20260831124421.45636-1-christosskarlos.kernel@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change "initalization" to "initialization" and fix the spacing
in "bootup" to "boot up" within the comment blocks of main.c.

Signed-off-by: Christos Skarlos <christosskarlos.kernel@gmail.com>
---
 init/main.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/init/main.c b/init/main.c
index 2613d3f9b3ce..8a9b6bfc8308 100644
--- a/init/main.c
+++ b/init/main.c
@@ -123,7 +123,7 @@
 static int kernel_init(void *);
 
 /*
- * Debug helper: via this flag we know that we are in 'early bootup code'
+ * Debug helper: via this flag we know that we are in 'early boot up code'
  * where only the boot processor is running with IRQ disabled.  This means
  * two things - IRQ must not be enabled before the flag is cleared and some
  * operations which are not allowed with IRQ disabled are allowed while the
@@ -1035,7 +1035,7 @@ void start_kernel(void)
 
 	/*
 	 * These use large bootmem allocations and must precede
-	 * initalization of page allocator
+	 * initialization of page allocator
 	 */
 	setup_log_buf(0);
 	vfs_caches_init_early();
@@ -1689,7 +1689,7 @@ static noinline void __init kernel_init_freeable(void)
 	}
 
 	/*
-	 * Ok, we have completed the initial bootup, and
+	 * Ok, we have completed the initial boot up, and
 	 * we're essentially up and running. Get rid of the
 	 * initmem segments and start the user-mode stuff..
 	 *
-- 
2.50.1 (Apple Git-155)

