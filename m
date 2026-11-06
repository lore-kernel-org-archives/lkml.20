Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793987262;
	b=sOuiaEW+sqzoEQ3DzVFhDkojubnlJx1B7YNwcbHyPGaneLlPD85PiVFqOtVpSZT6//EY
	 EL/TLdZ9mlYGfe6ARFkU1zpntbKsEJ9ozNtgpyySjQ3Bpibucuw4EZmZrEFnA4cF2M94K
	 aGNZdJSZgsRRzKwCR0pXZcgyNwlRPG6EPfvjUCY///C/LNkVNMEVBUQ79HFWGVxda1LmV
	 gMmDUGGFaG3hZ82GvLElX2wtnzbIoiXP4ukpWrTVzaDG7Gdo9MxjQixroiUwKSWsxc0o1
	 SSgEKj11FAi5W1k7ZBWDC1J92JpmP0QdW0RP5xu8uLp+NY3ECXy/FzOAykAHXaQI0Hg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793987262;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=eRHNQnSyg+HxFwUHDEG9hXimdhxcL6M8ICyQ7BsYEvw=;
	b=hLKZBGSkygbfbBoZ+gVtiFW4zNMLcJ6dc0RK1g/b/3mzG/BfiXaXYL3NophrZXK53zMD
	 epOcl1ZFBZLDECn6Go4FYgJ2lrl4cqggUbuemHU4u6civGwXVu6FUIatILxD6+eCMIbU8
	 hdv70IumeWuD0/2MZOtcdp/BfbbWpoS8wKLPnKRzXh/I70yYcEEXDZ2ll79lBoHzFjKa5
	 fRf/RPW19GOK1Hp/FRxTI+jMrZsWrBsTA5hfLkidZaCUZJiSQ9ccTCgTTG2SSi7A+qdrF
	 jU4D2Jg7yfLhG+XamgOe0l4jnmvkRw+D5cQKTtg+3hYHaHUZiUUbyDmD3pc5TwYNu4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=irYQ0vGG;
	arc=none smtp.remote-ip=209.85.219.42
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B436606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 17:47:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B436606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=irYQ0vGG
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-91eb7d147b0so1628606d6.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 09:47:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793987261; x=1794592061; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eRHNQnSyg+HxFwUHDEG9hXimdhxcL6M8ICyQ7BsYEvw=;
        b=irYQ0vGGtJEO65oqBeVPfGhntnDs1Tg04R8NYPfcJIO8nCY2yk/xAla5YLR6XWgf12
         V7/Hd8xR2/GalEG2wlDsKuyTK73e8tCswlih26s6RmqYGUI1dmEQVq0kl9uwLbQeFpBq
         qCyaQok0PVrR3AYWyNGHK8Z1N+sa16mo6zl0IVyKP2xAStt9ERmUhSJgTtxEGwOzQJAD
         asUzwgQUUlDQhG+txlGzi3DjEc8k218OYS9v28X/nZEGDXgaWpnStVwKqHYqPCyq1Ad7
         UyM+b02QWrfJo70vyA3lX0NJCsAYGumArxT7I/duur6hdYakBgNo4YFvQYPh5k71Hd/U
         qjnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793987261; x=1794592061;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eRHNQnSyg+HxFwUHDEG9hXimdhxcL6M8ICyQ7BsYEvw=;
        b=ZxMv9a/IVXvddjcgodOQy0QX81RXjx5tFpVWf1613YRnccBbHzv29SmGdDDTPjTnfy
         zxGr2MJ+PSUcr9eKqln8cWrhF97R0cTNu0TLPtUZ01TXYDdlPt197PETLnU4/LJVeeb5
         LcP4xjcRR0c7eDI9S/9Zzuzxu423Hs4pJtJvn3kyIdLwtbvx4ZCwVooYPsoP727F/0Xy
         KPpoTryJoIy6w10RjUTlt9rvgv89ZH7x4R/MGFIPHdcsk9kjQ5yLGjAkoVU1YB4iqL1d
         AIilpLfsz6cDG1maWG+wC73Kt521BDCfwULtgF02W/NyazgHDcWNQDT29dqd3mfBmIrJ
         uz1g==
X-Forwarded-Encrypted: i=1; AL+hErH3yQ0AyTP2GMNhWtdU2XOYKLmoQj/jEamKc2iudRcB0kcaJM2zp4sZsFSOuTKZVueWxuIUeqqV2Gbklhs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9+CBh/5CeWuv/MuB2cOIawjE/JNUMSZqFC5cvlcF1JCG3JqgrQ
	U4imQdJ5ZMF8EBj0aC1Gw5rRQEuA193yfhdk4akx1WNQ9npjhzO9le8Y
X-Gm-Gg: AYBFou1dvnuD1KThHtUmi4HJcCYPEJT7GorKftyfDrBSvGAbH7dHu55k4knYqewGuM5
	si96Z05Bn2TiHlAcLrWS2B7anX+AKVXkF/WILCW5C3sIS4Rmi+/3t1eFLk1Dz7KK9jbFqiSW+s4
	mHjkBlZh9QPxsaGQ6Uj5aBx5JRcWJef+DwzfxQVbRCuZugld9vGrLfoRB7+XAl+r9Xj9rjXaD8o
	f9IX4JA7IA1/QY5MOvpl1sIfrM/upgCk7iprOPLzf1HbLvwFSHnEZM4UdTjZEfM+7zxkg9Wjoc4
	MXOWO0HiFSxUtTKtdc7YLfPh/YSfcNRIS2JeR8TKF56num93ZpKpLmZtqc9r85v18KcdvEoomKD
	zTlcyWbRHP2vCYQfwwWl+Ye+KhOm1C1Dr/BoOQvnsG+osq0r2kRxHy1eI0zhsIpsM50noxeCAVg
	75adFzlWp9VoOihJJGhjcn+qaB1Dt5HZ+jbLu1wtmqElMsZCq2qhMV6vwx20PaHuxidmi8+NTLy
	Exbv+nh258xlSGVqGQy68p+fLL2zAGNvYRmg9uBkHnPSOgxykz9QmE2PW5sQepnD4RIL/Y7w3uS
	hvowx36zZTAPVlw2AZSnciVYSHpTi6aIxuhTfW0=
X-Received: by 2002:a05:6214:469e:b0:91c:6386:eca5 with SMTP id 6a1803df08f44-91ea977060fmr45840816d6.30.1793987260806;
        Fri, 06 Nov 2026 09:47:40 -0800 (PST)
Received: from linux.. ([8.34.174.240])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ea6ab543csm25408536d6.39.2026.11.06.09.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 09:47:40 -0800 (PST)
From: Changyul Lee <lcy8047@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Changyul Lee <lcy8047@gmail.com>
Subject: [PATCH] iio: trigger: free the trigger ID after device_del()
Date: Fri,  6 Nov 2026 12:47:37 -0500
Message-ID: <20261106174737.2580011-1-lcy8047@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

iio_trigger_unregister() returns the trigger ID to iio_trigger_ida
before device_del() removes the "trigger<N>" device. A trigger
registered in between can get the same ID, and its device_add() fails:

  sysfs: cannot create duplicate filename '/bus/iio/devices/trigger0'

For example, adding a sysfs trigger while an hrtimer trigger is being
removed through configfs, or the other way around, hits this because the
two paths do not share a lock.

Free the ID after device_del(), as the error path of
iio_trigger_register() already does, and drop the "Possible issue in
here" comment.

Fixes: 1637db44413e ("Staging: IIO: Trigger support added to core.")
Signed-off-by: Changyul Lee <lcy8047@gmail.com>
---
Found with a static analysis tool we are developing.

Reproduced in QEMU (x86_64) with two threads running for 20 seconds.
One writes to add_trigger and remove_trigger of iio_sysfs_trigger, the
other creates and removes an hrtimer trigger in configfs. Without this
patch, device_add() failed with the error above 160 to 1148 times per
run in three runs. With it, it never failed.

 drivers/iio/industrialio-trigger.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/iio/industrialio-trigger.c b/drivers/iio/industrialio-trigger.c
index 76926fee0f84..206ede2c9b3c 100644
--- a/drivers/iio/industrialio-trigger.c
+++ b/drivers/iio/industrialio-trigger.c
@@ -105,9 +105,8 @@ void iio_trigger_unregister(struct iio_trigger *trig_info)
 	scoped_guard(mutex, &iio_trigger_list_lock)
 		list_del(&trig_info->list);
 
-	ida_free(&iio_trigger_ida, trig_info->id);
-	/* Possible issue in here */
 	device_del(&trig_info->dev);
+	ida_free(&iio_trigger_ida, trig_info->id);
 }
 EXPORT_SYMBOL(iio_trigger_unregister);
 

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.43.0

