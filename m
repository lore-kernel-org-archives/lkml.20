Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 115D7490C1F
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 08:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792053909; cv=none; b=WD9b1z/9rfSA6Po8ZUg34gRRYzbQUDthIatrB8a4r+M6D67q83RofDUBo088lTFx3tcexZgrp72+zWRfzY47PfmBowe+sNfNu7EtJwNmTmrmAriFdsWkWCk2NaLfJE+Ah5/RfblDHslmXXQ5EXogwDUdbSfdno8VAm3JNRFLgJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792053909; c=relaxed/simple;
	bh=poEJMkaaYEXoFnzkP/2ISiIumk2M+VV3qf0rGUob3pc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RuEkgQqkXM5dO3+OgE5IqvvEVt4aHUS7Rwz2MdUJZQbPVgukl2b8BNXD1xC/dVu/d1IjNni7Q9dwZ605CLXE32BaDaZHHChQzE/Gydd2sphOQ6wr8YhQdbwx40Me1eaJy1t4IKWG0n9r3eBtYahrt8o9cYzEciD5fYHFtgQeKFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=geUFy9t8; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="geUFy9t8"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a16aaf2067so22575045e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 01:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792053906; x=1792658706; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FaMY6Qi3tuKPVGXdwHUK3kUj4kFnOVhOuQaREJO4d+s=;
        b=geUFy9t8xz5e6rwzKT06eXufqyMMmukJnemoyyqfNI3eR/xbUhyIIH2w9a2gjFhz2y
         GJF+bs3eDFTCnn00wN1+o2AwrK8HW76HnqDNLqC/5ZUPqqRaEg16ZdxWDEgoE8TsalVF
         dj1mCK+JQV4VB2qYK2uNc6nSkP/trxwI0Gm+alycxtzx08mRuLfwe3bVRKcCKYU+QgE2
         cZSLWHTIwqnrfKS13q/aOMWel69rbsutcpQJrjI7ndYmMJRfhU9Gw4mTQaHBHySFkvAY
         /DNLJsWAPQfRyyvacoNkxcHWwcthp1AbyYQSjWBWvFtwa8/A2MOPuwl0paQmPB8bokOc
         Ww0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792053906; x=1792658706;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FaMY6Qi3tuKPVGXdwHUK3kUj4kFnOVhOuQaREJO4d+s=;
        b=wVSmqmMkWVn1O8T7/qv9LEpmshAuwUDsJOS8/QaGMr4irw2u6j+rqbUZ8DfuOXp/mc
         okl6OQA+WF0YxO5/czv96jKEQfbCDHVXIlG+KdOLzXbjVmTLceItfgwrNLJvzpmlu0oC
         gwT/sM5sHpAB77N1T7L7wggr4d85ZnHKiq24RafG4CS3DeJQ+QuxvuRmGDYdChIWxYaA
         VcwYr/uVnAs7vIK9Omp4Kk4+w0yr+hg57oaDumlUXB/MTQmoHGFRY8jZ3u1UJNJFObXD
         MDcUFXk+UJwi/AhIwhvADjymFfI2Jc8HGFnxm86QLGzaFY7aylGZbIlkzTEay3ApzHxv
         8JRA==
X-Forwarded-Encrypted: i=1; AKwUvBz6zveIHEadVO50WTWuEP2s/ycHq18K+SslCzkL4lNfge4q8NA+r1A1U9TB1tZ49iAY02huv8tqACnSePM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLLEQOfsZf+3frpf6n5z+3vOXekvhLZXI08pUUBvd8kYqNzRbLR
	w6PTupdd9tpkoJWKmWvpcP+dbx8b95ICxMrVznDL5HPQhAMXB8zUZgvx
X-Gm-Gg: AYBFou1s4vIHcgelGUSI4TYfF3cFK+zI2H7I9zXtSKYxwhS1KOcBs9Pc/WGz0SPSMGa
	R9pdWHKto45QnF7UfDmB9vg77yKUqURHLlFIH9hlEgsRToDoLeEvKkBtK2Khdk/7rH2rSV57hZT
	Kgc6hcF15XC7T1Qy34D3VAyMo8cMnBnhyUcBipaK5wkxtJvEgHsv7KIlKrFOM1tnrY+2q7uhIq3
	t9HxASgowc/g34QGhEsE/m1Aabr1Q7CbkwceHcz0OrNB1xZdzorDYu5A2Pd3cTcf8lI50X7CZzv
	4LRb08pbzqciscedWqOdTzOZdRx4t3BuV5hTWeUK+CuITEvuJMI9spoLkBE6MqhPhIg8Gxlhbpp
	7XdqZKNQDP8KsTl4SAb7qL5XqBEh9Sv9kL+dL/esL6zNy9YrUvcAQjEGeCWNzaV9kRS3U+uK0Oz
	hBj4MJEIzkWhNiM9uNUzvof/jph+veYZXKETOt68UVAb3FU5IoXIzNPmK2r4iZBhmdu2AoV9WEC
	0WwRNiQuHcCPum3/adO4ZQ=
X-Received: by 2002:a05:600c:4ec9:b0:4a1:7739:f9ab with SMTP id 5b1f17b1804b1-4a18e4ca953mr372100775e9.20.1792053906052;
        Thu, 15 Oct 2026 01:45:06 -0700 (PDT)
Received: from LAPTOP-AVI.taile24b5.ts.net ([2a06:c701:4778:c500:7c03:57fb:1f59:3fa9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd986095sm56537925e9.7.2026.10.15.01.45.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 01:45:05 -0700 (PDT)
From: Avi Weiss <thnkslprpt@gmail.com>
To: Conor Dooley <conor@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>
Cc: Paul Walmsley <pjw@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Avi Weiss <thnkslprpt@gmail.com>
Subject: [PATCH v2] cache: sifive_ccache: propagate IRQ count errors
Date: Thu, 15 Oct 2026 11:45:02 +0300
Message-ID: <20261015084502.3061706-1-thnkslprpt@gmail.com>
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
Changes in v2:
- Combine the negative and zero IRQ count checks as suggested by Conor Dooley.

v1: https://lore.kernel.org/r/20261013095756.1084568-1-thnkslprpt@gmail.com/

 drivers/cache/sifive_ccache.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/cache/sifive_ccache.c b/drivers/cache/sifive_ccache.c
index 2acb8bdf06d52..f2428f7ea373e 100644
--- a/drivers/cache/sifive_ccache.c
+++ b/drivers/cache/sifive_ccache.c
@@ -262,8 +262,9 @@ static int sifive_ccache_probe(struct platform_device *pdev)
 	quirks = (unsigned long)device_get_match_data(dev);
 
 	intr_num = platform_irq_count(pdev);
-	if (!intr_num)
-		return dev_err_probe(dev, -ENODEV, "No interrupts property\n");
+	if (intr_num <= 0)
+		return dev_err_probe(dev, intr_num ?: -ENODEV,
+					"No interrupts property\n");
 
 	for (int i = 0; i < intr_num; i++) {
 		if (i == DATA_UNCORR && (quirks & QUIRK_BROKEN_DATA_UNCORR))

base-commit: 0fcb05b72344f40806cbe810de8872f1698bf053
-- 
2.43.0

