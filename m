Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFC1C52E045
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 16:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789575850; cv=none; b=Hpd2/LQGQy1wXdvpZ2z4XkN+EFBz6Rcb0qY6Hucn7ZfHrl6i430i6/krUJQCtEjzDRsrQg3ZO3GPKtTazhU0RvkRdNoESnwzfPlzV55ML5kldDP3We/LzitOgHySQW+Z2oBM7PHL4Dt5i2QVTlCaDmeeTNZOq3WGkEMvI9V071Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789575850; c=relaxed/simple;
	bh=FGooVTE3n+m1r0RsIid6S680o4fwqpE02/2UW1WT6nk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JtBIm4RSF1FmlDXvn5sMB0KAyME5NxDy61de64UvPl0F85+BZveX+3g5dDI21BOpb/zfQ6Q5FktXJK4L/9vWOWD33B/dhedEGssXI2xvdiJbzw8cG7CAt0xA7akIBNGWoU/c6AtuAgMOYq69fM+fNnotlRPAWZRI2wVcZ6IDF8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LbPlPlvm; arc=none smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LbPlPlvm"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b5e4f1744fso1733334e87.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 09:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789575839; x=1790180639; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wDvMkgbafi6lx7PZBb2hbKVmFp4OiPWqrc5pACb/aFw=;
        b=LbPlPlvmAu7FQ3Fdcfqb0KnANT1UIpSNaFyAMN0bJPZD+dDXgAVZkTyVG4ZtZ5kIug
         xncFDQYMAygunBEdRYsCnun3cmtTtJg4waJySLirpwQzLbh2s10o6oMJ/r/kouSRJjtQ
         WrDnMQyT07Xavs1pjC7qKqqatxFfpH/KF/c0GHkYh7FvLMTFtMj/NGV5H4KEmdjN/J30
         hHfzYsZAHh7geo+52infMMvMZHyQ1o6qtt8KB4V/ewyWrhEy/dZj5oPg+VhGCkCIM+GB
         qpu4+N70MU3PrInZr1VZNSO15N40kaITFVgCaGMWP/3mrg9n3IyNdHrbA1LbFRUmW5fC
         AjVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789575839; x=1790180639;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wDvMkgbafi6lx7PZBb2hbKVmFp4OiPWqrc5pACb/aFw=;
        b=scrHG2PQsO8hzZ34auCt6KnRnYRHFc8kjMlVXwNOe8JR6MhM9KRrNJS1ysujCoimqB
         fArZs0UtMhiatDI8VkCD9frsQzK73WetF8nOURTCTyWixSlKENjlU3GGtupWF+EyI4Xd
         Rdi7YuEwtvRQIMybhWE1N/U8Hm0JQif5EGL1LTCFKycRizxoOC0V3yOy4jl5Na+wZwY/
         ChpTdb7YukB4NgsWg63E+hjznY1dxRWFcQYIsrOfJvWSaS4+aTh35Fm1Mp6TpX7WayEg
         C9edD2djzxgiihT6Y7gf/LfHf5xAYrByToFN0fKS7LRa3jW5w70dvXlP31k7HagC+lYY
         ti7w==
X-Forwarded-Encrypted: i=1; AKwUvBwjVIU04VLthqCwiJH1ojr423vWhdezcV/2kBr5mLYFTGudSq6x/NNmtpO9U6qeV/4YWPW9g84Q0wmfRGQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lW6JLYbRlHSCzQz7bNU74iiXJYmRzdJoTMKgzT+muVdGXQVVlH
	iO5FIsG1ayRrLEM+EhsxiNUjeW5M40iTq856j0qwBPeFziDR1f68M3SBVHaWcz/BlldK
X-Gm-Gg: AYBFou2jYq0AvAQAGNHHyccxpSMN8v9ZoPfBAOoYlSoLLMEh7FcLRlhE7YMOJNYiMM0
	V4Dvk7EIPc+VgBQcmeSiA09/ZKWzG3P2IecWB0t/nZvjgh6F30oOChZ6qZKh2aX1N8S8HdjKKx+
	eKL+sopFZZ+/hrLYngP2Bdhl0TdMMQ0Jn39zQi+ZJRaXzfSBRqtofeWB1oaOLHVhzZNuG9kpdbR
	mFo/l+U3wAKizMOYgPqp2S3IWB+8f0npuWxlUa3P3GLr0ZLYdkf8ckUT8ASkb6A1iPozRkeBSJh
	jYj418qhVBKbTuYxXgJKq6o36Wr/WyWr3ZfZQT1uDF/JBF3Ibc36D1Vz3t9JCJj6XBY5GCz5f4E
	L+y2AfNJE47T0kxMrAjtiVXfnYfhwtywgyi3emrQ7r37cRlO+5JrNlZNkHDRXikhVB2ESF0j1gi
	raVcoefMBK+9+rkLaseQoGMvadoY4mJh2Ya3Cx6MQLAQo2aA6cBm/RZP1Ng5wUa8OElPgaNWAjP
	W21yQlHhSAPUOOwLyU/EhWg
X-Received: by 2002:a05:6512:10d2:b0:5ae:bd4d:852 with SMTP id 2adb3069b0e04-5b8b660a965mr1005663e87.5.1789575838649;
        Wed, 16 Sep 2026 09:23:58 -0700 (PDT)
Received: from [127.0.0.1] (sekoohaka.ddns.net. [151.243.208.241])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8b57cc66fsm1036205e87.37.2026.09.16.09.23.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 09:23:56 -0700 (PDT)
From: Maria Lisina <sekoohaka.sarisan@gmail.com>
Date: Wed, 16 Sep 2026 21:23:47 +0500
Subject: [PATCH v7 1/4] mfd: intel-lpss: Remove redundant DebugFS error
 check
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-intel-lpss-debugfs-v7-1-eb51d41f55e0@gmail.com>
References: <20260916-intel-lpss-debugfs-v7-0-eb51d41f55e0@gmail.com>
In-Reply-To: <20260916-intel-lpss-debugfs-v7-0-eb51d41f55e0@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Lee Jones <lee@kernel.org>
Cc: mfd@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Maria Lisina <sekoohaka.sarisan@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1838;
 i=sekoohaka.sarisan@gmail.com; h=from:subject:message-id;
 bh=FGooVTE3n+m1r0RsIid6S680o4fwqpE02/2UW1WT6nk=;
 b=owEBbQKS/ZANAwAKARPrfuqZo5+iAcsmYgBqqsKY0qqZ8z2V4Ludy7CoJ+HYXkat4uBUe2QnC
 648hIXfre+JAjMEAAEKAB0WIQQ8HZKKOdqg5DRiM0sT637qmaOfogUCaqrCmAAKCRAT637qmaOf
 ouaTD/9oWWuM0CJSFi0FlCQ0UbyKB4L+1vobuJZ3WVXPN//hcQLxwrETBGcmuAriRJqcEk8Vn7y
 otOPiKhzYQqbRWsYScAsw2XJlsPtFZZLXjhpYbIbOMMBxLnMQRgFQBYyJVnqhgIQrwQzXrtGCi8
 tdjaqk4zfcK7zls9DHSf6y3bKwhd8f9TcfCjw1dh8TbA7HvQLMQW2AGnS1UQTW9ecNlADCAh9As
 AOY3KKoMyw1ucrZRhBqLiwVoVX+jZRLPOpnV1ZzsZHNK24uZmUrDFpfjqd3mOa3/pL+1zl/bSh/
 WchQ7k8mFgS92SOJPNfgH+k4dtPvm+5mRMlg0l8beTi3DK7IHYqguGL8Q+0da3kwh+NwVP8nw6/
 vsYfBjeimAG+kBDBgXTi1iDprcxNikWyvvp3jwcTIJ2r2/4LTFJO620F/tu0U45Vu7wL2W/Xbi1
 ww+gxozHKT1BgF+DWWIB5i2i222Qt55AoNdM8Zq5n7bXu98Iq7TgTY35qL/gKXxg84gkSEHEf16
 yd6xn3nPCCGVTMPxOf1qZ6Szs2MX4lDP0uQwojMBid0HsmH2ctPkR/4s7vGhuyIF/NuOLD6HvqJ
 zfpwUz5VWkZQ+nE/VWynSHLDH1yBggJMAmNPUekhL8Nb1VZ6stIRme0FN6CYwc57zx5pzTn61gL
 A036FtYQ2p3owlQ==
X-Developer-Key: i=sekoohaka.sarisan@gmail.com; a=openpgp;
 fpr=3C1D928A39DAA0E43462334B13EB7EEA99A39FA2

The DebugFS API is designed to handle errors gracefully.
Any explicit checking on return values is considered an anti-pattern.

This patch removes unnecessary error checking and converts
intel_lpss_debugfs_add() into a void function.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Maria Lisina <sekoohaka.sarisan@gmail.com>
---
 drivers/mfd/intel-lpss.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/mfd/intel-lpss.c b/drivers/mfd/intel-lpss.c
index 63d6694f71457b2e09d238af0a9bfb897a169a64..b6958e99cf54d3c8eeca1ba38055a9389678f6c3 100644
--- a/drivers/mfd/intel-lpss.c
+++ b/drivers/mfd/intel-lpss.c
@@ -142,13 +142,11 @@ static void intel_lpss_cache_ltr(struct intel_lpss *lpss)
 	lpss->idle_ltr = readl(lpss->priv + LPSS_PRIV_IDLELTR);
 }
 
-static int intel_lpss_debugfs_add(struct intel_lpss *lpss)
+static void intel_lpss_debugfs_add(struct intel_lpss *lpss)
 {
 	struct dentry *dir;
 
 	dir = debugfs_create_dir(dev_name(lpss->dev), intel_lpss_debugfs);
-	if (IS_ERR(dir))
-		return PTR_ERR(dir);
 
 	/* Cache the values into lpss structure */
 	intel_lpss_cache_ltr(lpss);
@@ -158,7 +156,6 @@ static int intel_lpss_debugfs_add(struct intel_lpss *lpss)
 	debugfs_create_x32("idle_ltr", S_IRUGO, dir, &lpss->idle_ltr);
 
 	lpss->debugfs = dir;
-	return 0;
 }
 
 static void intel_lpss_debugfs_remove(struct intel_lpss *lpss)
@@ -432,10 +429,7 @@ int intel_lpss_probe(struct device *dev,
 		goto err_clk_register;
 
 	intel_lpss_ltr_expose(lpss);
-
-	ret = intel_lpss_debugfs_add(lpss);
-	if (ret)
-		dev_warn(dev, "Failed to create debugfs entries\n");
+	intel_lpss_debugfs_add(lpss);
 
 	if (intel_lpss_has_idma(lpss)) {
 		ret = mfd_add_devices(dev, lpss->devid, &intel_lpss_idma64_cell,

-- 
2.47.3

