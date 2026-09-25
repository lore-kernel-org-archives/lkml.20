Received: from mail-oo2-f38.google.com (mail-oo2-f38.google.com [74.125.231.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB1E444C4EA
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 20:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790369185; cv=none; b=TBEfXfbf5JWeXdR53fcePc4gktPLnM+iT3rn+tVETTi4BaIZ2JySl5sSytk/KdZ8UinGZnWgTs37CNKtEh0jweTp4c10dbvTDN+CibCACLKm7ptyKs/z6E+41oVNG9z51+fJC4X3lKWUII/T7TCmyj4LvtEEhgfC3iQBQeEcOuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790369185; c=relaxed/simple;
	bh=2xemev2yBS72WyoqzoVT7r2gri8P43bGOhxNtGBB5VE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XfMeF7lB3Vlq7I9XUPrPARjQdDQ7hSkc4me2hhgTAhrMXRX9fFr0a2IzgDG1jgWG6BGRFLF+beR77IvaS2e0Cq1liD8TOstcl1RJPaMSO//TAUh6GPyusIWw745JxUMA9VpJGDn6vx8Cr4PtBMKBxtfBvttdoKK2hM+cA1uUA1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vg6eNftW; arc=none smtp.client-ip=74.125.231.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vg6eNftW"
Received: by mail-oo2-f38.google.com with SMTP id 46e09a7af769-80a71781323so820886a34.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 13:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790369182; x=1790973982; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dJZP9kXmuJI+o+IsNASrZaJy9/Am5VHRTm0oN0iJ97E=;
        b=Vg6eNftWc0EvA5D52ub0Y+VhCLKmz9ekM0WV2QS3a87nsXPpbMAQr+XDempIg+kfBV
         2oe9fGovJpq7Vh1hwAn5jOR2wjLCZwgv5ip91/Wk58pQ0CCtwrPeVrwNTFCCLqSK4o5p
         AyDHyPnbbIv+BuQURwwtMyqn5m5U6TI69qetoSbV62faicOTaItjQrsBiKt2kCcC4X49
         6xOGKfAsoedcFlv5mrEtm9pOJ+8AyOE+FdoN+xoDMf5QXBIEWjuPqIOBcwYMRQMHHZRv
         fuEGEZ4GGdoCHvWKhrpK2fvTCOpaqiSgx8h6lLgD5q3dDfeAPprn70hAsf/nHglxgzvb
         4ZWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790369182; x=1790973982;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dJZP9kXmuJI+o+IsNASrZaJy9/Am5VHRTm0oN0iJ97E=;
        b=q8ucCQUBLaZt9gLKwRBFgcrDNHeETcQDz/PYeiFqDFvas6wmsmFoxrIumhVUtC85eQ
         Dzdy894MoNjqb95eKoSyeZCxWUHbbRFN7FvF0l71kR539qFARc7slwAJ1KsX+QnuAA7J
         pPHAsmqk7QSCO02Cy4kdj5gg5omwjCOwDLPW5/N5dduPmlW7nuA1Q1ZJRYPDSDnbM+6+
         1uzk5KdAbW9Ht9JVkOHBAVTFVlyHhN9/U3ZtGFstg5AJvufHfEWXz/qRf8xynRXMw5oL
         ta6QF6iMTMXfmL532S4bDlgcPS/YHZZiKsYTMvN++UulYeEeSGMA/Z/V2l1/PpFQgCTk
         rdrQ==
X-Gm-Message-State: AFuF++kt6Nxm11qzg8GqTDzDrZRAVuQk6eRerIAQCl5TffwCQFBGST+H
	uaCcN0GTweZgfye5OyT3OZ/1oH69oHu3khpgTrxDZMOvGVtLIij7WHdQU+m+VA==
X-Gm-Gg: AYBFou2dI5OLFrYAde+XG44cPdISTNe/E+GXjKuTCSugClPXBgb9na0EDBpa3orgBgc
	MPBZS/R2T6NSViJDsHuiciBHL6EEDSewV1a8WFbDbcGw+Wd3MYfINIyQf3S6uhuBMsXVEqQdqun
	6egHUs72L/sKbSYBhfvm+qVrzFR/9iUUtZ19tIkQLVuBvWJ8LpcR2hQLoM9p9y3H3h7n96FRp4r
	ys0auDvvFaKxFPjB2AdUncIBb+1evSLL43OqXRCjvZ0v0AhQBW56htLB8NMybNkzoKLBpXjs0jn
	a1V4Q/Da0hCfdCl/CWYHOjBDYINfXRe0u7dvAPx7LC3/YumwY2Ztz7nJuVRMWTu9P0CRSNWVzWN
	8a6O8Xtswbs5DYfCeYQXldXEGeplIqk51LiPCs8v0W3g97UkYkPU7b6ppSXNEK1xbxqd9IixvJ9
	32BD5+UCp5YGStNGPbpGaMRaPxwZc/dAQkZe5sNxx51Cirw4IpF9CfHUsK5hge6O2dGZVPzcgMn
	ZiNr2EXFVqRgJT5SZWgx+8kNRO/+is/Ep+rUWe0EaksCX/OnEYL0VUG/n3rBrwTa6Qjoknaej0V
	MFJiRhOddVfMxgjoKv5zkY1nv7gEoc6KxQ==
X-Received: by 2002:a05:6820:2d04:b0:6b1:3534:a5b8 with SMTP id 006d021491bc7-6d43f2c7919mr6737428eaf.15.1790369182579;
        Fri, 25 Sep 2026 13:46:22 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 46e09a7af769-818e98b16d4sm3474461a34.26.2026.09.25.13.46.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 13:46:21 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org,
	akpm@linuxfoundation.org
Cc: Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH] drm/print: Mark __drm_debug as __read_mostly
Date: Fri, 25 Sep 2026 14:46:17 -0600
Message-ID: <20260925204617.69199-1-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Under multi-client workloads (e.g. 12 concurrent vkcubes on AMD iGPU),
__drm_debug is read at ~83.3 kHz across multiple cores during atomic and
vblank checks, but is otherwise write-rare.

Without section placement attributes, the linker packs __drm_debug into
.bss adjacent to hot structures like drm_lease_idr_object, drm_class,
and drm_global_mutex, causing unnecessary cacheline invalidations.

Mark __drm_debug as __read_mostly to relocate it to .data..read_mostly.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/drm_print.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
index 86cef1a37678..50cdeb1b15e2 100644
--- a/drivers/gpu/drm/drm_print.c
+++ b/drivers/gpu/drm/drm_print.c
@@ -40,7 +40,7 @@
  * __drm_debug: Enable debug output.
  * Bitmask of DRM_UT_x. See include/drm/drm_print.h for details.
  */
-unsigned long __drm_debug;
+unsigned long __drm_debug __read_mostly;
 EXPORT_SYMBOL(__drm_debug);
 
 MODULE_PARM_DESC(debug, "Enable debug output, where each bit enables a debug category.\n"
-- 
2.55.0

