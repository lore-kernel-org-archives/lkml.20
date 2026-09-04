Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B97CC49362C
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 11:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788519679; cv=none; b=ZMmvFQIIm1u2FVGVctd3Nd2AkC1RdsO4CG+K++0GzLcUYGe54jE47sr8PUN2l3MSwOMfuVFDkCyNgItUnNxMFNFGceHgQLUSmYsHcHFn42TZu2AW2XRk3WpFmf2IIAO7ieBYNG8XaowR+39d48zGpwRMrHBNicGLBYq4BT6fH/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788519679; c=relaxed/simple;
	bh=Mt2Jj+Hwx7fL6k6jmEeS1jYSGnq4BaMYTqfWVhxOnqk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BVlGIVFKjr2iLCpDaFWxUbj1+7GMKNXzEym3S33P4bZiP276hj7Hi9iV35YDPBaVji33KmUfoBZnVFpg4tIGPu4UZIcALL5YV8fknvKUb5mJ7nnCTYRS5/2YiCFUKJ5s2giZy7TBsS7WZbXPwjWxnvev/jPFb0x04hblrC3ZALs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VZWh/S+e; arc=none smtp.client-ip=209.85.161.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VZWh/S+e"
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-6b1c75f0049so640115eaf.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 04:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788519677; x=1789124477; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hJXrdiZUgShSK5yk77/XBzx7jT+n2TJBOdW5oUv8dng=;
        b=VZWh/S+e+sl7WZthMyCoOll93QG3+4ITon8ROJrDrXrXjGtb3dnrn9IBSc7GXHDbFM
         ImSeBTDFt7Qr7nLfPaDkB/dMH5RTzDxN8lmXF/n5nB01KvGibbLvX2koqtgtxdnEH6VH
         O/UeDUFBlW1IuvNk2oZF9FO0gv3L6DWofsYsfFFURVK72MroVX/R5RzH47yxGD4EEK77
         3vmT8ku3FbnFqgzuFwpu+Pupq0yRdIyWA4XlIvTFOH1h6qXosFpwZ0gAeUk5E/DbyfYl
         PiWO3CvBc5xPiyqv4YoO0nGPxri7gzoUgv7C0Yi+ssVma3eLLC+lPdkQ6CYJw/5iAbDQ
         FdQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788519677; x=1789124477;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hJXrdiZUgShSK5yk77/XBzx7jT+n2TJBOdW5oUv8dng=;
        b=kaIfORK9cqjADkYZPSh5ANT+GCF3L01i34Yapq9u6Y9OWvsgEE9cYYKksQ7MFnhGs8
         /Q2Jb2NcJRaXld3O9C1TZjWIIvcKtTAMjl9NFdU6CPY20QxpgtTVx6vQWN7RjWAx5XLf
         e5sF6zLgxOL16ApdbQJ+5EibFtjCB3GTLqa4uVlUqsn14RmyXrNOA//gYQ8lNL80zqJt
         sXlt4NQxsog5+lOTi46/kkXphDQBL1txJhes86LKNR6N0ArnyTEAF+CeiRlUye944Yo4
         rU3fyY8UvhZlVFN6BXLmPODncn7+Axi4ScqTa4k3jsYpNj/0WP2r0FzowJP/vx8/m4Iv
         Rmxg==
X-Gm-Message-State: AFuF++lFISvBZU+f8cYbtDGIUGsEEJ8Lx6G/3ppsKFpfsly3Y8sZyfNb
	8SurVYnLwYGwG+f6MdI91qESmwN4pmlnWi41stuxMBor7qO1B3FfkhHu
X-Gm-Gg: AYBFou1BVezN/wWy0+JkNv/kf07hfZ1aOeDu76uMFv59TMoA4M07kkU0MI5jf1gHawC
	o6MGcSj/58BRRJ760tUeL3WxuZx+MZlAzMp5yFGHEaIzUgPYttJnTaYcxu2QGHzSMjCBbZTLJ5N
	93yswLoZ+FpVUPKO4NezAoYVHW0j2EH0vqwU7F3R2uJJ8CuLFQIBBpP2GfcM2tKH3qpmlibYxwy
	p6u3av/bL/a5pNZ7i5GNBRTm4hZATWStZCtXFff4I2uQlasQ/KF9IcJNJlB6jsXv/07/kxcPfaD
	XeugK+/lXw134PdMehLCFwChn5+51HKEbo51Q3uH4LKcgb7kp1UwMCKqos4Zym9jEcEcgZidoPo
	sGLDFOdKLXoXxdgYf1RDjzy+cJ/MDegYksETCXfvEXAnwPHjPEt0wPOeHKj8fZEjMTS+gmsrXkY
	rT/nE6mFg7lndx7ZtWg89ZQqxOJkWd/g1wJSHJL0HYrcgpGDoYl1/M6C8Wtt4I4A04xsRJhtw1J
	EQHETflj73yajE=
X-Received: by 2002:a05:6820:208c:b0:6aa:e573:9ce0 with SMTP id 006d021491bc7-6b6fcbdd780mr3568725eaf.16.1788519675905;
        Fri, 04 Sep 2026 04:01:15 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432441f5f2sm6431329c88.15.2026.09.04.04.01.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 04:01:15 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev
Subject: [PATCH] regmap: fix typo "asynchrnous" in comment
Date: Fri,  4 Sep 2026 16:31:09 +0530
Message-ID: <20260904110110.8823-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "asynchrnous" to "asynchronous", reported by scripts/checkpatch.pl
using the misspelling list in scripts/spelling.txt.  Only touches comments,
no code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/base/regmap/regmap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/base/regmap/regmap.c b/drivers/base/regmap/regmap.c
index e6e022b02637..98184a00097a 100644
--- a/drivers/base/regmap/regmap.c
+++ b/drivers/base/regmap/regmap.c
@@ -2722,7 +2722,7 @@ EXPORT_SYMBOL_GPL(regmap_multi_reg_write_bypassed);
  * If supported by the underlying bus the write will be scheduled
  * asynchronously, helping maximise I/O speed on higher speed buses
  * like SPI.  regmap_async_complete() can be called to ensure that all
- * asynchrnous writes have been completed.
+ * asynchronous writes have been completed.
  *
  * A value of zero will be returned on success, a negative errno will
  * be returned in error cases.
-- 
2.48.1

