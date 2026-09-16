Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 892CF51990E
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 14:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789569426; cv=none; b=gGpadV9bjevY3/EA0LDHAlyZQ1j/R0STq0FMYoGoYNRs5uRo4sZsVy52VB/2JLalMaV1fdqB77YgOXjUvEjJGyGlJwoE3DrcJ5A6TVHssYS6syc+jGRyVuDCI948cvPmzRsVM3oo2IQGobLsLUf7TyWmc4kY8Y6QhCjh8CaNVuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789569426; c=relaxed/simple;
	bh=xNWXjh2jZNqUOiPZC4IQkFyQMkKV6evtU42asOP+reA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dibDDFcXAiH9WZZToCrcYmYl3ztzz+n5H/78ISYdwxz3N8PF1h0kklddG6S4THpMEurA/Yv+pH6d65Gac+fI6XBv+iMRRGgW2QGDKcSilnWqZrfRZmPhMWA02BOm0o4q6NmfeiY/e0EQ7JV+vfbyVuVje3TfVFQZIH8OXeN+QJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W8uTGc9n; arc=none smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W8uTGc9n"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b5e4f1651bso1039956e87.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 07:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789569421; x=1790174221; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ufX6v0lew7XrjHWTQTFcEf1Xg5s99AqsmFqOBj55n5o=;
        b=W8uTGc9nqSnpX2/rKj51xvsQpp5TUBeTbZY4V6IF5yj1hwb464p1t4gLY5f09gDzEG
         /zRIfoyimE1YcnnQMZWEE7ZY9gThbaUoCQRwQIlbsNupe/M6iHZo9nroJl9vA8cQQS8u
         XXC6wnpVXea5S6rI0YVhBboxXUNFqsW0HRrG/HwKKv7qhBYQRRj5OABXr43yav4bcF4Z
         UjdEsV4hxi20zGkycvlMQVTu48FxllhM+LwPsYgscMX39C8ac2ftSz57nB+OhFT3dFTa
         3qbENerOjzeyIholpVq78ttX3E1242BFOg3J9cQWfpH8PJElIUtcvd5NsMu65WxIC5fN
         Vhzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789569421; x=1790174221;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ufX6v0lew7XrjHWTQTFcEf1Xg5s99AqsmFqOBj55n5o=;
        b=LNoAv7hoMa9i4HcMNtysTOHVmuPtAK/qfsOg9hZ4nu5LO2SmsUHSx1jchpW4ZavMUp
         JLmBdOhSdIrGkzhIDdt0KszETbFHfXvQVBGoSa1h0J2xs9FbFq6G/Zqc9ZMo78u4Xu4I
         9YMslbMZWwUH6kt+SJcNQbsn8UkO1AKW6NyGSHF/hrV39ktBlnYnfQfbw4QX0j5+ADV0
         h5a80gwBA+fjay8dzOGyyGbo382xBCejwLGYN4pad01nV0kmsXLhPqor8/ncudMtZ5LU
         FRLHuT/7ka9PZR+tWySFnxEQ4ul09kC2Ikxfe+Hs0+sCePg5mwcAzL8b/cr7ns+f629i
         N/Hg==
X-Forwarded-Encrypted: i=1; AKwUvBxhS0QayiW/TFTRf6bX2gexTPIvg7L/24vXTAxHI/+tuhd7oxPAyniR3/jJbB2IZw5kI4kUtPz6GAwqdTs=@vger.kernel.org
X-Gm-Message-State: AFuF++mP7vZYB/twahUNdF9sKJkixACrtzTel17SJTTXV6LOKdtrJ/mb
	P7A2N/WW8yPbph+mQHdAVWB/53JA7ouD+w2iYhWuorZFPM1OiV5hfk4=
X-Gm-Gg: AYBFou0g6IRmmevJfSOBkHFisSSjZpEluzos2QeLiuQourvk5mTrqNJeXGqtdE52Dtq
	SzlkOjVcn74FqHv0noQVrY1+KXEvcOQfg1H6Jg6MxqoQ/8mfuCjfKgDLrZkrw2oQ1X2KMFCyNtr
	eibgLo0XFz70oDeEe6uGWBpCKvQBO7NFd9CuhhdsUkVh6PpwhFL0GiAcR85tBYVlUroleEBzrs6
	TH9lmxMk9ZOGSN4GYClHO11FCR4/dhhuJ9iBmpFp8bjX1c5OxrpH8M/rc98u8vyqemtDdYkJsXb
	V97OQlz+JycAQRU0SP3Wmg6vuuU6BVyD6KuTLQ9px5s/V03indJEXjcbBViZD7AqTi2U3+JNOzY
	C2+fK2B8W+hSaFyvd1da7rM9D8+GiOAx9ZO2RKVeb2T4Fig0g+irXtl8QXmIgCZCiCvP4MJKsgZ
	k971LB6xOv5jTcTqukjWXrAYORU0btaHqGPwrANUJ3M9O9FEx77C9/vAQEbey/s3YR1idwRkucK
	3yBMIHi2rv7S+jnmHdx1UYwTEC6Ra9pf4TF
X-Received: by 2002:a05:6512:2390:b0:5b7:518a:fe57 with SMTP id 2adb3069b0e04-5b8b664c839mr925372e87.39.1789569420831;
        Wed, 16 Sep 2026 07:37:00 -0700 (PDT)
Received: from [127.0.0.1] (sekoohaka.ddns.net. [151.243.208.241])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8b57c3d46sm978675e87.19.2026.09.16.07.36.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 07:37:00 -0700 (PDT)
From: Maria Lisina <sekoohaka.sarisan@gmail.com>
Date: Wed, 16 Sep 2026 19:36:41 +0500
Subject: [PATCH v6 3/4] mfd: intel-lpss: Remove extra DebugFS dentry
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-intel-lpss-debugfs-v6-3-5c118ac430ed@gmail.com>
References: <20260916-intel-lpss-debugfs-v6-0-5c118ac430ed@gmail.com>
In-Reply-To: <20260916-intel-lpss-debugfs-v6-0-5c118ac430ed@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Lee Jones <lee@kernel.org>
Cc: mfd@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Maria Lisina <sekoohaka.sarisan@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1487;
 i=sekoohaka.sarisan@gmail.com; h=from:subject:message-id;
 bh=xNWXjh2jZNqUOiPZC4IQkFyQMkKV6evtU42asOP+reA=;
 b=owEBbQKS/ZANAwAKARPrfuqZo5+iAcsmYgBqqqmH447aC/HryKCjz2EfIa561rW+fvUeP1DmG
 vL+R1k+6tGJAjMEAAEKAB0WIQQ8HZKKOdqg5DRiM0sT637qmaOfogUCaqqphwAKCRAT637qmaOf
 om5wD/wP7wOu9p6ii/PYG1fI6dc3hxzCshOrpD28DfA7aO6j6fpT8C6pqOy+IB8hNyOHdIuEygF
 m3vRvYjbVuxlafJMj2V7enO5sL9+JzSkwmwyqT3DfF54FDzN2CQluqK1j1lAzABNxm6gXT3AnMy
 1TgVpnsxo2P86wkNrVguuP4058uUdmzABaxY5SvP2mhEf7MZNKxELna8AmCWfwknQxsHi9VFwj/
 vmGpksHlt9kKZFbO8yOSZMw4hu46d6tPGq8xRJcgbz5qrzbYdvL/xHlCPyk0I3NBBOI1JQ27K60
 Klqkb7ecbF1y7+nQluNUwUQ3TKO4Nkus7b2ITGNXdBijPsOpt1Zwn+V5iNlDuHP32iJtNj1P3IY
 yIRBT5qYMexWcZIwkEeeZLAYn4ZPD3GBk9vEqZmQNKDKXj4Avt8s5Va/kw4z5gFSvp4x6cFC7GA
 6ow3M3HI6bc8sNpXGCb3HD4jbxH0fQoIwh/WxgCAIUBut41t4wk12eFVYDAAN8IiWpnk4hj+/+l
 FlOc/4q9I7y/KFVAb8IIZ+WXY0+zhY0PftsX8CQyAnBwzPKFkX91KSZeCUhwtX0O0HLFa6qi5b5
 +ctuW33yQHV7CuYFmliVd77ciJAenc4WVew6c0DQgfKIDTf3m9S3XlVL5jNm2j/GyuWXL6CRMvh
 gXNM61a9ekcFogg==
X-Developer-Key: i=sekoohaka.sarisan@gmail.com; a=openpgp;
 fpr=3C1D928A39DAA0E43462334B13EB7EEA99A39FA2

There is no point to keep the variable dir just to assing
lpss->debugfs to it later, just use lpss->debugfs directly.

Signed-off-by: Maria Lisina <sekoohaka.sarisan@gmail.com>
---
 drivers/mfd/intel-lpss.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/mfd/intel-lpss.c b/drivers/mfd/intel-lpss.c
index 190de88d146aae9418566adf36a47d11afa90b2a..f1a8feb0fdf2042a3b6a8422400cb8f9511b4876 100644
--- a/drivers/mfd/intel-lpss.c
+++ b/drivers/mfd/intel-lpss.c
@@ -144,18 +144,18 @@ static void intel_lpss_cache_ltr(struct intel_lpss *lpss)
 
 static void intel_lpss_debugfs_add(struct intel_lpss *lpss)
 {
-	struct dentry *dir;
-
-	dir = debugfs_create_dir(dev_name(lpss->dev), intel_lpss_debugfs);
+	lpss->debugfs = debugfs_create_dir(dev_name(lpss->dev),
+					   intel_lpss_debugfs);
 
 	/* Cache the values into lpss structure */
 	intel_lpss_cache_ltr(lpss);
 
-	debugfs_create_x32("capabilities", 0444, dir, &lpss->caps);
-	debugfs_create_x32("active_ltr", 0444, dir, &lpss->active_ltr);
-	debugfs_create_x32("idle_ltr", 0444, dir, &lpss->idle_ltr);
-
-	lpss->debugfs = dir;
+	debugfs_create_x32("capabilities", 0444,
+			   lpss->debugfs, &lpss->caps);
+	debugfs_create_x32("active_ltr", 0444,
+			   lpss->debugfs, &lpss->active_ltr);
+	debugfs_create_x32("idle_ltr", 0444,
+			   lpss->debugfs, &lpss->idle_ltr);
 }
 
 static void intel_lpss_debugfs_remove(struct intel_lpss *lpss)

-- 
2.47.3

