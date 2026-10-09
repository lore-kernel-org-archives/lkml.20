Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0BA8384CC6
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 08:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791535585; cv=none; b=TphSA0vPW5zKyzrc6xO555ESK5Rce7Ms+LpZgWmHpLMDYzhGDal8O8q/Jq90KOpbGMHjgfgLTuhAYaoScel5rHlUuy0xnxnrP41gI1Xbi1V97mttEQWYvSmJsmBbMDHcWduwo7Khe0LzarkG4QYISUscz3LI/Y8006SOnEcOdUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791535585; c=relaxed/simple;
	bh=be5N0rKg83/hK2SYnT0Q3evk5ahtdilBXSVdYE9Uaf4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=k6BuaH2VUUKW8BVkJYri7+awJ30Xynv+JA/jZU4K9HhyWC6Pi8iiPfTjLuU3xbhevOKT3bj1Ptq1sa7Kkwo0/+7HLJB9RPlW8HffurOtKmQSbMB4cnvT0VpIJchttT6X9Prv37BFCFZ4s6uCaW5ziqtr2LUzRivKPZMKG3acUk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J8o36bzF; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J8o36bzF"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2db80fcdf8bso28544225ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 01:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791535584; x=1792140384; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=z8r8TJA9PDai5V/l9Od9FfNtWGMltnJ5ojxP28WzN7A=;
        b=J8o36bzF4JqgKB3252Sv9Ea7NxnwzmGzgxsPuSyfeeOaq19Mp8uEP5/Zynk6q84iR8
         6K9KdrIqqOMi9DP/VNZFKkAUD+4R2+V4ZM+GpXDJkIMfB1DhDchjlOYb13mhsSiPJDqf
         WBeKFRhRVheS3k0xtP9/Y1u8bh6StegJh7TzlmzZ+L5QQQhyPvfAwGb9KI1tGKMjSER9
         gyXa+Wd1W44uFiMRCf0jWn8VMJfFml+rfraMeTxLBxLUjh14/kmAilDEhL3C/vohv7N1
         CLptc54871b1q4j1WXBLjydLyDtwCMoRETSPOxGir5JH4WAYYNaMiKsah5ERMvQ7WCGq
         //xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791535584; x=1792140384;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z8r8TJA9PDai5V/l9Od9FfNtWGMltnJ5ojxP28WzN7A=;
        b=L4lqKITiTVrK3t2oaTBF6G9Eb2VYn56aPHC8ci25JmNrOhgF97P53hkSXofbkm+qy+
         F1WAJuMSjPskKEI9T0qbCCLlj4KWoxLbL6Pm3vzB7H6vqqnr+XDA+Z4AilpvLCkKcCsE
         2fAJjDJVbNN+yFZuoDwdVgx9Z85CGcyd2REgNirohawvzyQz3b33PkudVLSqLssEf4+0
         pVI2OWtnfIrCO78gMmuz2pxEUwfYW89u8Cg+XVEaHrLmQ3SJ8l0HS+1HK1nFbGQ2BKmR
         ySSsgTGDgeSC5927mtbnwvuFBlrDwwI/hdONpYYKiGSbZj14Tj1KWvE6XOJliC1ep+Tb
         vz0w==
X-Forwarded-Encrypted: i=1; AKwUvBxUbQhOPlr9bPOQhWYr++f9BM9k/Vtb1IwQbIJ4Ue1F9ex4s+uy8G0voXnLhWwt+7XowEzvykGAjhRyJ+I=@vger.kernel.org
X-Gm-Message-State: AFq9FYKv/mbDDBcxLXFf5nWQ6M0/PKHaRK6O+y7dQamyNH2KNNwKYjB/
	cefU5DvM2NCoKHMDXnhWao8azfAKvzrWbgGP+n+G7Z9vx/R66VJAmckn
X-Gm-Gg: AYBFou1y8JtDmop3aaiRc2XrfpLkndP793bCIflBuQmfzerwuvjLrndtJ6OPKP1Kidx
	J6kl9+I2uwdoyPzfOghEyoo2odbA0/vbWVXw76L2mwwoo9M1JcaKbjnrGvQb7uGKnpBJGWWzNyt
	YjgjcN4eXw9oXPnnXmmR/sOydvSscv5jDy/CqHYv7KxNw3Hrat3G2a1/x+XYXSbcYs9Xd1sgSfY
	ZYe6regDrzkJ/IvHhj9TxJxY3nHPrJQQ50UC16CPNTHukaNVZk7W6LUD033m5KDvlfELJ+MV+Pp
	VyWesJzmUH+YDCGNeBwZ5M6iBR/9j9TTvs8azzDRsoiuDJX8ldGezGmgAyVGYNo0lGsu0uXJiJ/
	bgHJi7mEy32wvVyofv6TmKvEI6zSu7LOSbUXJTOLszgH88EizpYjoXJYigJzodUhNpm1pNfKkLP
	YR5QiahEE3wOdX4gHGAF+3iGdWdx/VUByAO1iS3/tQ0KUApx1p2JNxgBcaHmKFysiuP+PWhMhvA
	GFaJVo=
X-Received: by 2002:a17:902:d2c5:b0:2e5:a355:56e4 with SMTP id d9443c01a7336-2e8428a1d5cmr10798905ad.11.1791535583941;
        Fri, 09 Oct 2026 01:46:23 -0700 (PDT)
Received: from arch.localdomain ([161.33.202.10])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8419fe0a2sm5489815ad.6.2026.10.09.01.46.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 01:46:23 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: Adrian Hunter <adrian.hunter@intel.com>,
	Ulf Hansson <ulfh@kernel.org>
Cc: Jun Yan <jerrysteve1101@gmail.com>,
	linux-mmc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mmc: sdhci-of-dwcmshc: downgrade HS200/HS400 clock-reduce message to dev_dbg
Date: Fri,  9 Oct 2026 16:46:03 +0800
Message-ID: <20261009084604.385664-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dwcmshc_rk3568_set_clock() refuses to lower the bus clock below 52 MHz
when the eMMC is in HS200/HS400 mode, since those modes require a
minimum 52 MHz bus clock.  This is expected behaviour, but it is
currently reported at dev_err level and therefore fires on every boot
and on every suspend/resume cycle, cluttering the kernel log.

Demote the message to dev_dbg so it stays out of the default log while
remaining available via dynamic debug.

Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 drivers/mmc/host/sdhci-of-dwcmshc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mmc/host/sdhci-of-dwcmshc.c b/drivers/mmc/host/sdhci-of-dwcmshc.c
index c688f3eaf468..b4fb1c1e6d99 100644
--- a/drivers/mmc/host/sdhci-of-dwcmshc.c
+++ b/drivers/mmc/host/sdhci-of-dwcmshc.c
@@ -790,7 +790,7 @@ static void dwcmshc_rk3568_set_clock(struct sdhci_host *host, unsigned int clock
 	if (clock <= 52000000) {
 		if (host->mmc->ios.timing == MMC_TIMING_MMC_HS200 ||
 		    host->mmc->ios.timing == MMC_TIMING_MMC_HS400) {
-			dev_err(mmc_dev(host->mmc),
+			dev_dbg(mmc_dev(host->mmc),
 				"Can't reduce the clock below 52MHz in HS200/HS400 mode");
 			goto enable_clk;
 		}
-- 
2.56.0

