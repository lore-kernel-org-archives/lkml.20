Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B98F550C294
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 14:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789569422; cv=none; b=s6I9Zko2a05Dy7nupjISy6UjhYx+WJRhePNWe6roV3jv34T6ca1VMRlcJPfQFkjr4u0UxpYYS2jUyEW0WyfmSeasE7Q4ShvU8BFn0WKnTbqdki+wJN6SU1Uitw4M8gzqvQZ2cRlOjw5Ow5mEgjOOL3zUhgC1aWBVWKLD/gdKbDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789569422; c=relaxed/simple;
	bh=9VktpTC98V4MOQTaljcWhU8XsFF9PvnD33EIqxRl2hQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CP/BhBZ9fHjCiP8BEV5p6Nhu0lTjUEFPDLzHNA0xoqaReh1w3yTDeOhB3uN2OYl9/HmgOo22sM3+Md4YRXM8riFfRBqrpbCXOqAlzbtDCRKmrCY6mXGfDoyPkWnoMLXCPLPkZuh9P67Qcqp+AIoTzRHdrrB7d/fj9jpmt/MyDmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O9FXtse7; arc=none smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O9FXtse7"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b76462aae9so795484e87.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 07:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789569419; x=1790174219; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G3Uyd4e8+1PGAxCMzU/ZkLPuNvoLPQoawhISwc8Gj7g=;
        b=O9FXtse7g6u83un0nMT1J4MFenmrOg3huaR14L1IsZQeE1gp3mO+fgDU++2QJxv6PJ
         T1OffR8FwMKGg0+XacwFV8Y9TkSVzQovu6RIKkDm1+jzxU31ods6OFLVIvJ1c4ugG9AT
         VReWzpu1Iy3T3c8Y3xdVH1E3U5oK+CFzgJMfbWLlEfcoX182TGqrvUboK3Mh87/Sc3By
         4ttQd6SFhEfsqxCFKNTrmISJgEXfy4gU2ltCeYQkaB+YuhqenAE9q2zFtDwr743o4Lsv
         hsmquei3vviD+LMGO8A+MeQsnv4RrTuCxHTKLuRLvEAm64bCQ7K/YsROZfNj4KzYx8mP
         dX+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789569419; x=1790174219;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G3Uyd4e8+1PGAxCMzU/ZkLPuNvoLPQoawhISwc8Gj7g=;
        b=kxbvgKsj8Tmb2K9a2cP6kQfK7q3f25lJspUsi6t71aFn1BIe24aACuySMHp/SSMovE
         XboH4Mv5qMK3Two/kyy4o+E3eLH+VXPbbjsRlv1zR90zAOFVuHeMwER88jv1pmx3rY3N
         ApF0mY1/ZSmyy3p5Xda1qvHswTvkRsR/oMOCau2KRic2yezGnJx+F/lzrYVQtScxnTWx
         HUx+2m4R7DH8V9xTWgnpL29/hPcvBg1yXcSpRAQ3xWoZrLgXynZ3vxQlYlCZjikb4PP1
         NlFFgKa2C1Atw34IBVF4s/dCy4HboNOV/hxR3SvVN53eMprb7fWv/hCgEaNa6X6Cwa2d
         TVjQ==
X-Forwarded-Encrypted: i=1; AKwUvByFag0qIWH/5m2h4mOcwqPjMYhl4SrAsXNgfrMOvXRnwio0S5W8WlYsmnD9X+gm0asiZuiyZEzGu4lEI8A=@vger.kernel.org
X-Gm-Message-State: AFuF++kEj+I7Exukx/0/0qBdaeFKUz96eUvs2hihWsGHQ1/JfTnz5fqu
	3EmbrmFY4p4BDHzzFdsrD3moeA8+fAQqLaCGcf28S+WSYmKE0Mg1C/s=
X-Gm-Gg: AYBFou2cGTZY7uHzCnEbZ4EI8zWM9Bu+MhbLULpDzZMqWSUd0pk+a3xoZ5XLthNW+RF
	UbyKW8usoimOOt3+z06O+XsE0qOHA8Q78PNl+taOq7XsfE172n2dRbLZ/n9awhbl5VdAzJqpGVb
	fCPIeJpsR98d1Xic02169FTUFMvHaecuAouSpW/bSyXVx9fVR4+8bTt8yOaxCr6pE0UWriwP+xY
	2OoEV+rYemL5tqNfQv5YuafkChC3cNZ2ZwYg593Nph0xBnAl3DhvtLUYe+c4aZrZ/wWL2Y2TU9F
	SvS5kAJQv0sGfvUdEsgBFceDDKXzLozJ534BAaharqok66xUnsgWXAgaqfokTVmcza+wbBAuOPT
	DFG/nnSxHNHxquDzPfrKbYXm7i1M6yN/b8+upKTP6cruxizspkZQ5B+bsNJ3mkZfnIEhUiHjwVO
	jolUwZ96jg/9MCQMWXiD79juwEo55laFv9+RAf6pP1/z7dH/tiLY3zwCkYdbHvhXIKlDKttH8LI
	noB21x23rIBPUoCIPQAzbAIVqGig8snVGY=
X-Received: by 2002:a05:6512:ad1:b0:5b3:e52:a005 with SMTP id 2adb3069b0e04-5b8b660cbf2mr909706e87.4.1789569418474;
        Wed, 16 Sep 2026 07:36:58 -0700 (PDT)
Received: from [127.0.0.1] (sekoohaka.ddns.net. [151.243.208.241])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8b57c3d46sm978675e87.19.2026.09.16.07.36.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 07:36:58 -0700 (PDT)
From: Maria Lisina <sekoohaka.sarisan@gmail.com>
Date: Wed, 16 Sep 2026 19:36:39 +0500
Subject: [PATCH v6 1/4] mfd: intel-lpss: Remove redundant DebugFS error
 check
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-intel-lpss-debugfs-v6-1-5c118ac430ed@gmail.com>
References: <20260916-intel-lpss-debugfs-v6-0-5c118ac430ed@gmail.com>
In-Reply-To: <20260916-intel-lpss-debugfs-v6-0-5c118ac430ed@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Lee Jones <lee@kernel.org>
Cc: mfd@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Maria Lisina <sekoohaka.sarisan@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1772;
 i=sekoohaka.sarisan@gmail.com; h=from:subject:message-id;
 bh=9VktpTC98V4MOQTaljcWhU8XsFF9PvnD33EIqxRl2hQ=;
 b=owEBbQKS/ZANAwAKARPrfuqZo5+iAcsmYgBqqqmHJECu6BIf5JczQSxOe6N/toMW82BiZEQec
 r2/CONHONGJAjMEAAEKAB0WIQQ8HZKKOdqg5DRiM0sT637qmaOfogUCaqqphwAKCRAT637qmaOf
 osamD/9+NoBFBakOk2sAxgWQkFQdhlBOMrx/fsvZDIwjd290Wn6s7uPoRNCWVw1nvVKd8ZwkTiu
 Cid4AjsPUz8hN6zU90pBJyCCWDQDdHZPORWWJtskwPL3mY9cMykt2A+lfzuywn3jRyb4v1tIUly
 8w6Ji358l4L18wXsx44YfVI05SM1g3w1oFPg3AAYCOetXqxr7M+wR0C2LLxBBbLheg3K0ixhFB4
 w4WymQ0Y0Xq9/Q9eaq5dt0ed25OM4i7UtQ+8x7X9k4Us+oGp0ESFEoOWXJdBxh4UXpkRmEnepOj
 BAH34xAf8BU/4ZuGCOQgVgQ+mWdxFl973Y5n7GzEv6ierzT0ZU5a6o18ZlBvl8lDaHVP1hdIPfW
 SlyZ++M0rUOGPQG3L+RrLr12ZenmxZT35xy5UmFrzZByUDCcV3bOdUt7xI/ink6uBlrdWTtC3we
 IE1hCKo4U2RJ9MqNqflFScx4or7D5H4+NaXY2doRSa8Sg4TYOGKSpO8EFcYwA3GvfcSrPI4VdoP
 wxQPRd8/mmItCgHxRztCTAZH4nvkx4jDj8IIZIcrodBJCDItfLClTGkRh4zEk8/RYTpoeXZDt9r
 FchPsRWj78CMq/MoDiOO+ve8uLeBix2DW2huro1B4RFH4ghY6054uP8W0E6wAz4VZeoxSJ1Txwd
 fSi8UOuKwG2iHIQ==
X-Developer-Key: i=sekoohaka.sarisan@gmail.com; a=openpgp;
 fpr=3C1D928A39DAA0E43462334B13EB7EEA99A39FA2

The DebugFS API is designed to handle errors gracefully.
Any explicit checking on return values is considered an anti-pattern.

This patch removes unnecessary error checking and converts
intel_lpss_debugfs_add() into a void function.

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

