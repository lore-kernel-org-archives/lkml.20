Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8A9735839C
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 22:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789510436; cv=none; b=M5Yosg/WOyqN/PfYndXeNyiiF9yLzGqJW5LxouCnWOx0phkLQeCrHYx4xO5Ye5z7wc9OjJUfy5WN3iUlJYUQwx1T4ytX1BOIJSW7RS4yKxDiYBqZCAppog5sRkygP+kd/mqczgzz975BLXx55mKB6G9XtVOGXu/hMFJo+aemS2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789510436; c=relaxed/simple;
	bh=m5PhDJVMb02+EfV1SuPbnxHYt5aQedcGgC0DyJHH6JQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=VVZwRbOEZiR9ara62vRdiNCQ+CRMD6vK+Y2eRvOiSzFoGh2rXkWqZdANA+/lA+Ph5MxHghejZn9p2nJ+UkBexc/zLUSIkWInKaA1SB97+ramh099t4XrNud/4ohMEOLy3VNATLY2PZE6UfoAytZm3VZAVzy8ewWwPpR5gPdkWGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k+ydlRrC; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k+ydlRrC"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-85469e211a3so178843b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 15:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789510434; x=1790115234; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/NTD2Ve7C/E0ey8T5pefKjgKc1rBkmFE55qZDamEip4=;
        b=k+ydlRrCspm3pR6fHEB9prCssJUPecj8X/nPffh+kuSnHJiGybjO3z3LsXP/qM2h6f
         Q6+EcuwqUBl/P9w3iCSrdhtSwLOnS0YylWH44M6grfqSWJKulOFth/xEFmixNTg4+n+m
         coQPKGy1PeGBCT6VDoNsRnlbA/6L3Y9zplHYRlAt4x4G++Q1O54ZcKcPiTrsX9w1qn4C
         IKA98k60QoHtoUVX9SusQ12GJsWOlLEVOMyQGf+BvLe7OgdoGW7Sy3Y6IpXkkewGFXv1
         qZu6ZUIy1/hbYJf3R8HKBjUp9TEfGD9ElV0Noz7vmydEL8veixASXD9DLP2EP3DRPaGy
         pkeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789510434; x=1790115234;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=/NTD2Ve7C/E0ey8T5pefKjgKc1rBkmFE55qZDamEip4=;
        b=dGClQUhYtrG/7T+nXHDX1W9vyiXznFyQ9d1//tN2S3t3Z6bY5ucxc5xGXqnU5CD4/T
         QZasjBYGAgpKOuM39p2GR8h1Ps0EuerZKLmk7V1M1EIWiT/crZK5b7H+zyivVnSz576a
         C4Dax4ZXyrRNOuObWl3mHqOXiV7nlJNbnMQGSnHPup87kXX3Lfbo/6cZEShph/5eeaz+
         CY+6Hg/4y2JTMdRx0GOEr3jIi/YD5Y4qKN5VYp5kgC7DmHn1TdI/DnHHiTtp+8ssCH2G
         /sNSxm1IGw5jXdLStwhtiVggpH67V04cFxl+ELaA+oBioqFYlsHFTutDTBxHsjdLf84n
         3inA==
X-Forwarded-Encrypted: i=1; AKwUvByKm9Lpawuz+1DCg9c1JFIEMwlEEc6ZtkIDakyXwdUDJxAiqR15nr+5j7OCXJI4mWjTRdFa/PErNZ7lwPw=@vger.kernel.org
X-Gm-Message-State: AFuF++mHWghGoeFDMNsooFo6jZdAhNIJhDF570E9C8edw1+etDxMBgHZ
	sduQR+3L29apThidieJSj+R+QbfVALzN6A69KzPJ4RjN3Udv8yWSUMg=
X-Gm-Gg: AYBFou0f/tkSNcVu0n19hFlQqsAZkAFYXUdeFB1aHqDj+C527+ICcHa3RXTwsKNVOBz
	G/nOLCxsN2Ocavbm7RcvJOvcmgltD02u4RAu5NDi+cwPJFXu0ledcSOE+cIBhA0kq/n1LSPu4Pl
	IIuxZedP6HR7+NKYNxmCXLp7U8AoPAETj/zIbzacRVH0bwF+y0RYjftxXpT6fvo4PTZZaxEcnMG
	JSjWDZUvsqKsHBCHfsQvM3LhtKPiongu7MwhDLoHg1qZv4BsNGyKCIo6ZPvp++saFZhadV1midP
	/orz2Az0UKQ//6/2BWIC0ggRUn8vBxU0j64HZyV6P9oXQP4trgtjJvYJ49N70JRuiff3ncNGyFv
	0U0ywfwEh8ZypBDQxH5CSgimB3pEpj8D/ptYjFnHV8bbTbFTf5HJOSWFh5GCj97+XaJOTVr6ckD
	cw1haNi0jV8VZXjgytzpHmUY8PP8bDfUnPZH4cBMwPRbsELdNa1MVID6JHsOqiIR90Ijx8dJhDO
	XWl4Uz0
X-Received: by 2002:a05:6a00:999:b0:85b:afe0:bb9 with SMTP id d2e1a72fcca58-8723afa3f64mr140898b3a.22.1789510434076;
        Tue, 15 Sep 2026 15:13:54 -0700 (PDT)
Received: from [127.0.0.1] ([94.25.189.123])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-871febde2e1sm223452b3a.7.2026.09.15.15.13.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 15:13:53 -0700 (PDT)
From: Maria Lisina <sekoohaka.sarisan@gmail.com>
Date: Wed, 16 Sep 2026 03:13:35 +0500
Subject: [PATCH v5] mfd: intel-lpss: Clean up and modernize DebugFS usage
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-intel-lpss-debugfs-v5-1-99295f534067@gmail.com>
X-B4-Tracking: v=1; b=H4sIAA7DqWoC/4XOwQ6CMAyA4VchOzuzboDMk+9hPGyjxSUIhCHRE
 N7dwUmJ0ePfpF87sYC9x8COycR6HH3wbRMj2yXMXU1TIfdlbCaFzIUGxX0zYM3rLgReor1XFDg
 SqawQJUidsbjY9Uj+saLnS+yrD0PbP9cbIyzTn9wIHHihlLM2JyKnT9XN+Hrv2htbuFH+J2QkD
 JiUDGXO5WpLqP+EigTYAqUFElrLLZG+E+lXIo2EQFtINAcH+PHFPM8vJrTiS30BAAA=
X-Change-ID: 20260913-intel-lpss-debugfs-eff3580d1295
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Lee Jones <lee@kernel.org>
Cc: mfd@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Maria Lisina <sekoohaka.sarisan@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3452;
 i=sekoohaka.sarisan@gmail.com; h=from:subject:message-id;
 bh=m5PhDJVMb02+EfV1SuPbnxHYt5aQedcGgC0DyJHH6JQ=;
 b=owEBbQKS/ZANAwAKARPrfuqZo5+iAcsmYgBqqcMcv8P8Jr5un7WrYwE/w9Tl71B967Nj3wTOd
 1gzHzT+PRaJAjMEAAEKAB0WIQQ8HZKKOdqg5DRiM0sT637qmaOfogUCaqnDHAAKCRAT637qmaOf
 ouVpEACSSuvm/GAWXDgi89LjCYkQiBPWBP4j1qEKc2D46tzgGV1Z4wKMM5Ff9cGQZ0jwRxXFyVL
 +UL2ImIQD+H+g36Krraqd/IAWFVLXNAyCg6p1cKLCIs7kfi5bzZPyOSmbudKKRZTcWRbHAVN5lL
 2uHfKlSGCVJ5Wi2jdRB6J+eLDnHPf9HiFTCs8Jvov7S0GXdb3I8cKL5EQ2JYqIHMFflCZvVI76J
 jo6lXm6UTWpse7gnoM/0hqfbdXxK3diMZj3uIie7iCDpuH7oArwubfa0R/lv1p090xAwAVRFkSw
 4SCabrY9uq16sNYGbMhqTcSq7cgJs/n01nQrQO93zF37WTiaWJISeaausJceyVK8v2oR6FV+s6D
 2l30QrQbOshDZ8rD+9ydcfvdP7xFknvPlB1X9Mz/O8yAQ480pJ/rLY18HQL4D7/nMs0I25fY7VQ
 A1nFNQC3N8G7vQq12lMzNpfl+96lTDLLioZZCKRSBt3IHf5cFoVxEBa/ThwVBXF19NFxVaeOZ+4
 ebvYPTFCmUdeEDshWv30bNQ3JUtH16Fh+GC9Mcb+p4v676dJ/REB1LJWeJRhSy58X4zSQoSdu/U
 6KbImzJJG9/l2vAqeyCkhFWBjxShR4YmNMgetOcx/6ERUjVKrnSuYJxUZCeMoUl2iOXhReteZ0I
 DzTYfyXvJtv6BOA==
X-Developer-Key: i=sekoohaka.sarisan@gmail.com; a=openpgp;
 fpr=3C1D928A39DAA0E43462334B13EB7EEA99A39FA2

The DebugFS API is designed to handle errors gracefully.
Any explicit checking on return values is considered an anti-pattern.

This patch removes unnecessary error checking and converts
intel_lpss_debugfs_add() into a void function.

While at it, this patch also clean ups legacy and deprecated usage
of S_IRUGO macro and debugfs_remove_recursive() function.

Signed-off-by: Maria Lisina <sekoohaka.sarisan@gmail.com>
---
Changes in v5:
- Changed the goal of the patch to DebugFS modernization.
- Refactored intel_lpss_debugfs_add() into a void function.
- Removed deprecated macros and functions.
- Removed dmesg message completely.
- Link to v4: https://lore.kernel.org/r/20260914-intel-lpss-debugfs-v4-1-0eb82ea7c1e3@gmail.com

Changes in v4:
- Keep the dmesg messages, instead check whether DebugFS is initialized
- Link to v3: https://lore.kernel.org/r/20260913-intel-lpss-debugfs-v3-1-1b8e2b1f0992@gmail.com

Changes in v3:
- Fixed commit name and description.
- Link to v2: https://lore.kernel.org/r/20260913-intel-lpss-debugfs-v2-1-a1a4faf5cc63@gmail.com

Changes in v2:
- Fixed function name in comment section.
- Link to v1: https://lore.kernel.org/r/20260913-intel-lpss-debugfs-v1-1-833cbb6fffc9@gmail.com
---
 drivers/mfd/intel-lpss.c | 28 +++++++++++-----------------
 1 file changed, 11 insertions(+), 17 deletions(-)

diff --git a/drivers/mfd/intel-lpss.c b/drivers/mfd/intel-lpss.c
index 63d6694f71457b2e09d238af0a9bfb897a169a64..1a61ef1a62b3e8a2777f357d5c4605d5d57d9532 100644
--- a/drivers/mfd/intel-lpss.c
+++ b/drivers/mfd/intel-lpss.c
@@ -142,28 +142,25 @@ static void intel_lpss_cache_ltr(struct intel_lpss *lpss)
 	lpss->idle_ltr = readl(lpss->priv + LPSS_PRIV_IDLELTR);
 }
 
-static int intel_lpss_debugfs_add(struct intel_lpss *lpss)
+static void intel_lpss_debugfs_add(struct intel_lpss *lpss)
 {
-	struct dentry *dir;
-
-	dir = debugfs_create_dir(dev_name(lpss->dev), intel_lpss_debugfs);
-	if (IS_ERR(dir))
-		return PTR_ERR(dir);
+	lpss->debugfs =
+		debugfs_create_dir(dev_name(lpss->dev), intel_lpss_debugfs);
 
 	/* Cache the values into lpss structure */
 	intel_lpss_cache_ltr(lpss);
 
-	debugfs_create_x32("capabilities", S_IRUGO, dir, &lpss->caps);
-	debugfs_create_x32("active_ltr", S_IRUGO, dir, &lpss->active_ltr);
-	debugfs_create_x32("idle_ltr", S_IRUGO, dir, &lpss->idle_ltr);
-
-	lpss->debugfs = dir;
-	return 0;
+	debugfs_create_x32("capabilities", 0444, lpss->debugfs,
+					   &lpss->caps);
+	debugfs_create_x32("active_ltr", 0444, lpss->debugfs,
+					   &lpss->active_ltr);
+	debugfs_create_x32("idle_ltr", 0444, lpss->debugfs,
+					   &lpss->idle_ltr);
 }
 
 static void intel_lpss_debugfs_remove(struct intel_lpss *lpss)
 {
-	debugfs_remove_recursive(lpss->debugfs);
+	debugfs_remove(lpss->debugfs);
 }
 
 static void intel_lpss_ltr_set(struct device *dev, s32 val)
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

---
base-commit: 2f0c1cf72f4682178506f513bbf015e591b1aa4a
change-id: 20260913-intel-lpss-debugfs-eff3580d1295

Best regards,
-- 
Maria Lisina <sekoohaka.sarisan@gmail.com>

