Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF68043F8B6
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 11:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789385102; cv=none; b=iG98e//tmpdrJuyYkWzDlkpbtDTktNJJNPTPK4+YJfpowK5dSTsHIjREH8nIgz8v9m+H8JEDCj9/mLigaAUZH3LBGJytPvDDk4s48OIF682aJKrtZ5u22jKJlBMzHcvgLtQ1IGN4hvAPIhOX9A8d5vnxMJ2wx2/Tte34eAJRWS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789385102; c=relaxed/simple;
	bh=m4FGhaq8a+nWJ/uaFh8Slz+kDyjA89yddHRxow0Aw0E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ym2xdeL5T3nsnVz860b8ZVytqHtVoT87LQwbw39wLX+2kxrnQ9587UomQ9MdTzGTlRJwRYpmQGD6teSl6B7tBkpmJw3tZNxjy7fXZOvbAy7fzHNN3NSJu1k1aQ/a+fQbwXJWReN0gbdMvgP6GzCX+HrCMpqP6uJI1aiYHDkw8VY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AJRGU/SL; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AJRGU/SL"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2cfbbdfa60bso32847075ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 04:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789385100; x=1789989900; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ok3Mywemwoiloo46/07KIkWHT3aySpVf35ol5uj0s9I=;
        b=AJRGU/SLIRnyupW/xdeRu8jWd2r2g98r46bAaTo7KJZB7ouy+INlQWrdjtUDClR7mg
         RfDS8xvCPFDunyD4HQTak3d83PvjNmmhZ/JspQeJ3N6Hhc7EYhY6K5hfmF5SV6Y6f2+o
         mOhESJ2WZXsxqwghXHz7l7QmHRvS7WAQnzoCGc6rF+JMm6Q07CIOwmj2Ozc5CBnHWg5l
         eHMNLmG2mthgVSuoBFZvRtF54a+jTJMs7caxLdOrDry3dPV0n/nyEnl3BZmJbS/rrAyv
         yG3KHgSvYNw1+nPeY484XI5ZTMf6PfNL/bmunPqEIzPtnScnt+G0zINJnCp5P8sZfgbr
         yh5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789385100; x=1789989900;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ok3Mywemwoiloo46/07KIkWHT3aySpVf35ol5uj0s9I=;
        b=GbHsLi4git7i/OGBlqbpDY/p5+cJuHPMjK+G7f81LlFJY7XuMchr+FUdQ/18C373gU
         7jFU4D7wVUuIM2wf9Gxm50r1x/OAqymBmU9Y1GT1Q2srQIf85rpu1UCCKi+tcVeiwfTK
         mp2bYDz/dgO/8nVcs2AlxMGuKO3OxuFimKBSO3F4MB8QSS72MciYEIp3v8uvQKDqMn4n
         n1sgr2fsDl5zxpGOMx8GTgIIaVjjjjJTH986dlM8InMdjf+JhAXfMf6lZa+yYk6CgPKd
         kQX/MvVV2f5CKKjP1h1kDY3ZeWWaJXLkrX2Fi5IIMOYF6FPlszVh918e6z5n1qvhOb7Q
         ZY/Q==
X-Forwarded-Encrypted: i=1; AKwUvBzMWPzp+U8T8zXZTX/tHhLn+KiACB1G6h18Psw4V+e2IaElpVyK0wv9r0tGu2yVZL6kozFK3ElHALxmahs=@vger.kernel.org
X-Gm-Message-State: AFuF++kyys84uaGPx6XqZb8HSFtR6ItenE68s8BcRSJmdbRtJPjyw/kZ
	gP3NX89jZGel8+0jZqq0FHsVeNLTxMTuuGJ/OAQFS9etzx16ay8s3/pU
X-Gm-Gg: AYBFou0u0EV0ftVEs3YuiFkHKlxhkloENRanld5APWP6QA+IIXDBM1OmGvAIfXU4F4m
	kHVORc2eCRr5ms9ArnGacUX1JLYHoM7CliMIxbISDKHj/49z6Vl2a3uJwc4NUlJ0neSJVB4+s2k
	wmxOXCFZLcHGvP7phrjbGdeBzO5Z+ipWyKbX22Gtf/miMuLNK3Tn9x6o0zHxzeVjUGiEkrn3fZ8
	zxTyB+P8IDTE/zzpiQ90yuhTbqYTdWMWUhb1fc6MFJc4/JzTc2bnzVg7RBo0Iv6AOHhb/GdV7Vi
	B7shHURGkGKDelfFKSVe6uzkqVb5Vwtat4t4vqjlaltJLER2NsTryhBeS8QNHh5ca7e7DIe4l2E
	5wd4u+0p+Nm3UIb+eLc2jLTeaffiPgXT4N4I5PhsaZk9e78r9a2nJCugS8wy8uwd/FLdXf6g8cb
	fAMlwYyp/HHOrkLFFGZpWp6uxtdKjUo+P+LWHJkj0m9zi5mJUveGv9lw==
X-Received: by 2002:a17:902:ecc6:b0:2da:eb8f:b4e4 with SMTP id d9443c01a7336-2dd6c5f3a7amr41335295ad.7.1789385100156;
        Mon, 14 Sep 2026 04:25:00 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd69745cb5sm10810585ad.43.2026.09.14.04.24.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 04:24:59 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	Siratul Islam <email@sirat.me>,
	Joshua Crofts <joshua.crofts1@gmail.com>,
	Pan Chuang <panchuang@vivo.com>,
	Irina Tirdea <irina.tirdea@intel.com>,
	Vlad Dogaru <ddvlad@gmail.com>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH] iio: accel: mma9551: disable autosuspend on remove
Date: Mon, 14 Sep 2026 19:24:47 +0800
Message-ID: <20260914112447.1686972-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mma9551_probe() enables runtime PM autosuspend with
pm_runtime_use_autosuspend(). The probe error path correctly undoes
this setting with pm_runtime_dont_use_autosuspend(), but the normal
remove path only disables runtime PM.

The runtime PM API requires pm_runtime_use_autosuspend() to be undone
with pm_runtime_dont_use_autosuspend() at driver exit unless runtime PM
was enabled with devm_pm_runtime_enable(). Leaving the autosuspend flag
set therefore leaves the runtime PM state incompletely cleaned up after
the driver is unbound.

Add the missing pm_runtime_dont_use_autosuspend() call to the remove
path.

This issue was found by manual code inspection.

Fixes: 6da93a6710a3 ("iio: accel: mma9551: Add runtime pm support")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/iio/accel/mma9551.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/iio/accel/mma9551.c b/drivers/iio/accel/mma9551.c
index 7e01427fd9c4..182f488edab1 100644
--- a/drivers/iio/accel/mma9551.c
+++ b/drivers/iio/accel/mma9551.c
@@ -500,6 +500,7 @@ static void mma9551_remove(struct i2c_client *client)
 
 	iio_device_unregister(indio_dev);
 
+	pm_runtime_dont_use_autosuspend(&client->dev);
 	pm_runtime_disable(&client->dev);
 	pm_runtime_set_suspended(&client->dev);
 
-- 
2.43.0

