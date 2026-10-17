Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B7AC231A23
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 15:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792250220; cv=none; b=X5PN+Dp2by6qa3FSyGN8/0F6w1ByhpKv609wyIid768Ok8rQK7SnxoyfJEaWoxec5YarTq+qwnTBJC+hdxh8SzYkgULSouo0spmKMLQkbpi/vysMz4LuseW9lKZQvgmIw2uTttsMAI83XzyZmQJE6oZ57Vzwhi6YRN2xUEtCtQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792250220; c=relaxed/simple;
	bh=HaN26y1u6c0ShfPlz1UDx0dflXCW/2f0ZI5Oj8p5Yes=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Aqv/lFJvfjdW6N7Np83MsvjEM3Gy1uQ1E1cLiVtmr39xqkU0dGcBbliQno2QwKVXNnZ3mzXYna5imuh+Ug1MXjPqH/vlGEzv+ilODrsFZMi7IqmDjC9WM0b608Lns7cVPn6CiMtcFwJQmU+Io1ScwOlraUW3JKeDY4kclHi97RQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jhV3sulv; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jhV3sulv"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a1dfd49525so1292475e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 08:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792250216; x=1792855016; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6ljn3PVnqnuWEit2AfdB+vWFxoLLcPbdfDG1xBL+P2g=;
        b=jhV3sulvjhGm6LHz5+1UQf6Y9k0Lwzksj43aHS2FcXe1i71ePluvZx5tvg68lLlaE0
         fYXRDozsO3i7FPjBqvOWWjXymCxvbsq3cCEvhMiVpz/rzLQKgp19idayK4g/7ReW9iKW
         sYXzGSbdZjxTuaOpDsTXrJ7o7dF9FJuQYI2U2hCStR97uKsUonu3a36OkD0i5eg8Tzqm
         gEZs7TRPK9lvW3mT9WNSv4uY9ucO2Sj3TiCyexsa0b6B8r0Dx7R4cfjIjnmiWPshtU01
         P9IrMA25EUtwR3i49ubuhdiFr1S9E9fAR3b/OtqfRVgL1FNxaBGyhXjCKU3k2bVUm58c
         5pog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792250216; x=1792855016;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6ljn3PVnqnuWEit2AfdB+vWFxoLLcPbdfDG1xBL+P2g=;
        b=PcOzvgWRDXGaQLcSbKOscXH9xtP2Gu5BXR375oPPSLyaHu3H7ByN5aXWSuFZSUZwbp
         v8nxI7G5KYcTWtwxgYv7IbQTHzC1/tyhMkkXFLcWgbEFr1O9T91tZAm8/OKHiYrLLXOs
         OgXb7f708+2J5Vchf7vQqCqK890IXAoqNO3ktscglCydM7xQTa84y2suX9LgQ9AGTUJD
         sNj/ot0asVx+nD1N8GdX71qUcAHOSRgHR3IzA+/bSalrKhRNJ2hgxXU7Zue8v8x1fGss
         z0jGRzVev+ciufPW8ofSYb5SyxIIR7BXJq9EtPb5vArnrUxeTtD2NLMa/pPox6bd5KWe
         okMg==
X-Forwarded-Encrypted: i=1; AKwUvBwJ+C166+tyL98fSeZjvukUauRu9OK3O2kiZGa3cXRFHFHx6U0pfvvIFEzXczJ1CFRTw+BMz5J16N56gUc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ1rsv83GNwDUa6YIAc1LP87jfTACG3WnaPtL+IuX0yfXuB+Anl
	th/xabOB4fOYojuiwUMfpg+4NLo34Lm3/ozcdAMNN92IN+yitJ12Nb0h
X-Gm-Gg: AYBFou2JYF+9cu1R1xSzuM0Uz0Yx+tuNj0mIDuN/erV23QYIHyMCS+7jO51hL0TbNjY
	vWuVaARzR+fvFgof7peDubc+2s56/0Pm4Othu0hR9JwpWtEst/uC6fJuaP83qhSwGJJfFqXQS1t
	r40ykPaYVEUFhhvK14nlFOoEk+JCclaIFAiX00uSDKNNSNheIChTLJOIofLQEGk2oFuvy3ZBXlS
	YskQS9QbGxBRiCjQvecGqrv7HVwpk6X5hVBSva63LE0oUgj7JuD4Vk0DBHh07LRpBUB96nl/ix4
	RmOafsnvgVM/8qpbJiHFUU7HEur7yNE4AKaeIw4YlfpGNpON0JDS6W4HNxW4JG8mCpGh4Zdp1yY
	sKIfHVynfSUiwfVxgq0DjWXVr1aAhyJhWIak6q+OrRlUfPqKW73WmZlb+BY0HPhj1P2VXcgp194
	wdxw9CTtZXNDbmmX4TSINNIvkq/1wls1YoNrqxiapsNJzCuMbvxqh+YDUiqHEAC4IuAqhdB6UBm
	swXrCxWcl02vzIT6505/K0=
X-Received: by 2002:a05:600c:1394:b0:4a1:d492:1604 with SMTP id 5b1f17b1804b1-4a1d75f2524mr63429965e9.11.1792250216194;
        Sat, 17 Oct 2026 08:16:56 -0700 (PDT)
Received: from LAPTOP-AVI.taile24b5.ts.net ([2a06:c701:4778:c500:c792:3e73:d47c:feff])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd9b35a6sm219841735e9.6.2026.10.17.08.16.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 08:16:54 -0700 (PDT)
From: Avi Weiss <thnkslprpt@gmail.com>
To: Conor Dooley <conor@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>
Cc: Paul Walmsley <pjw@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Avi Weiss <thnkslprpt@gmail.com>
Subject: [PATCH v3] cache: sifive_ccache: propagate IRQ count errors
Date: Sat, 17 Oct 2026 18:16:51 +0300
Message-ID: <20261017151651.1138811-1-thnkslprpt@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

platform_irq_count() returns -EPROBE_DEFER when the
interrupt provider is not ready, but
sifive_ccache_probe() only checks for a zero count.

-EPROBE_DEFER seems to be the only negative return
code possible here (currently).

A negative count skips the IRQ registration loop and
allows the probe to return success without requesting
a deferred retry.

Return negative IRQ counts so the driver is reprobed
when the interrupt provider becomes available.

Fixes: c90847bcbfb6 ("cache: sifive_ccache: Partially convert to a platform driver")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---
Changes in v3:
- align the dev_err_probe() argument as suggested by Jonathan Cameron

v2: https://lore.kernel.org/r/20261015084502.3061706-1-thnkslprpt@gmail.com/

 drivers/cache/sifive_ccache.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/cache/sifive_ccache.c b/drivers/cache/sifive_ccache.c
index 2acb8bdf06d52..f64ab6aab651a 100644
--- a/drivers/cache/sifive_ccache.c
+++ b/drivers/cache/sifive_ccache.c
@@ -262,8 +262,9 @@ static int sifive_ccache_probe(struct platform_device *pdev)
 	quirks = (unsigned long)device_get_match_data(dev);
 
 	intr_num = platform_irq_count(pdev);
-	if (!intr_num)
-		return dev_err_probe(dev, -ENODEV, "No interrupts property\n");
+	if (intr_num <= 0)
+		return dev_err_probe(dev, intr_num ?: -ENODEV,
+				     "No interrupts property\n");
 
 	for (int i = 0; i < intr_num; i++) {
 		if (i == DATA_UNCORR && (quirks & QUIRK_BROKEN_DATA_UNCORR))

base-commit: 0fcb05b72344f40806cbe810de8872f1698bf053
-- 
2.43.0

