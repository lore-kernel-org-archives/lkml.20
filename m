Received: from mail-qk2-f8.google.com (mail-qk2-f8.google.com [74.125.230.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 892651C84A2
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 01:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791681350; cv=none; b=omxobJUe8ZurFg3Z8MVHXn+1MwH+v+06F7TcTRT6w4MS3sTZzMGgflT9ndKsa9Sw0jEXBL7Aim5NiMyqRxUHUUobzPpEq8hwVjuoAX3rOGranXGtEQqgPi6oYO3C+YGoeJnyS3mYHOTSNDea+fA94svaffnGcjerK4jTStHIDC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791681350; c=relaxed/simple;
	bh=is6ytbu7NISTu46E7Wb6FacbhYvjgAU04aTSRvndh78=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MuK6z9FSKrqf2xxkiPe7LvCU7sOFJymBChP4qDTPgXnUMhYmozzYCV7xn0D+vak5h5IOPefJ9jCRryfjOpjGHsUsA77/pCGiGgfbtrYN3bdcxgs9A0Wc4Bkth9r8mEOxt0hPUc0QWEaMFZPuZONI0PU6M8MnNDUOi/oygEdJS1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QgDa8AOH; arc=none smtp.client-ip=74.125.230.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QgDa8AOH"
Received: by mail-qk2-f8.google.com with SMTP id d75a77b69052e-53524092d9cso10342541cf.1
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 18:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791681348; x=1792286148; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=w5e0+n/SZwb+mdMGSpmZA8wmqSq0w/SQYcFKC9N+I3s=;
        b=QgDa8AOHrrskrhuem2PTKvdOefHwj5WUN6fsbY2CedRelmzzLrQMxZm1FXkxzKp1R1
         KDwIxGk06X581lSKwfbek/nFz1sd/kyE+XqwH8V1pcxxKNrxTNacrjulRfeG8Ymrj/JV
         TsbsKPVxBJZt9/dVdWbEYjI3TiMQJbmr7gllqdpAqIluzmhYg9q4QXWkrFPtxErXVV5P
         Vdgly+VOnv1irKGMznwk3G+fvFGqvDV/gzv4mAxEiw9kM0hB0vxpN1B+g+dUG/SP7A8d
         4Tg/nJJlM+em+XL4dq+yYuD0iZicXFLAUrFlmzaoZrRO+o4ZjmRfEKuDT/j3sEaVWlK9
         PlJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791681348; x=1792286148;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w5e0+n/SZwb+mdMGSpmZA8wmqSq0w/SQYcFKC9N+I3s=;
        b=SaIFzdqpUx7oxWAM/YiXkOgEWAw3atjGcxQ3ESvUKQJq6dvaeiZusNE+Nup1t6FfwK
         97KruWgGpDKk0PJc8Q2NK9TbtrNICs+1j8YUbs2lav2+K+tw2viOy6KdoZecFxK+/Yd4
         hvtEnMVh0LqudltBg9eZlAtUSdli8zsigBgcpVnBBRckI1bdEPIzNQEF2Ev8SLGxZrYo
         W9kBPRZK/TjFG87wGGU6gCYBZ51Xb2uFYDZhk3k2uqqMJBY1iPPtEWkC04rv87JQWqo9
         XePesVPV7pWLNKLE8XYsAZDLSRN3lhVMmku/cnytjR2aOcKcgNgUX9sl+VV6Iy8NwP6l
         hmjg==
X-Forwarded-Encrypted: i=1; AKwUvBwQhHGUw8rRqeomh69jsh71kHsRs3wdGso2/C39ypiB2ogXVQYNtd0jxTplHV2uszpk4Apc1kKd6cQOxpw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKP+84S9G2MKOJ87xh1GuYTiH1VoGwqQkJC3Kh1HPG+9mG+RFSD
	03zy5SbY17dgKChSISRH7G5D7hiwB6vWme3KV3Dy+OVOIahjwnX01aNs
X-Gm-Gg: AYBFou1EKAhXvJDo6l17fRbhvXyD8gF30uMB3mIcIwGfD67BkA6qJDzRT44VXn9LDia
	M2XgM1iQQFa0oMJe+6+DlDmnFRSBMFnBBIxZnz2VDCfzSbILQR4/3fVvoE96d5QfPmzYWFX4aiT
	FhHJm67DnlqhK9eKPIhQ4FghrbutKOMDd7miS+iKhsezeItUgjh0yoYJ3txeN36hzX+EXBkh64/
	yNrD/m007TcwwpIyx2aMRaPKSMQEhvXZYycVz3wffGN7pwoSl+JCV2qM4y3SDKE9Tr9agHQ1vHT
	4t3ju3A4XPZuichx9r9ZRieazl0i3s/vwp2iUioJUK73PWSyqTuHywA2rCTrlvQ6uXODoHRgK/I
	ErehhsWoVWCx87/+TTflumPDKqZ5pzVtuMwLO0/zKPXUBSthNt2m7D6P5XC+1c25omTGNCUKGWl
	FK4sPdAzxqzBdUSM4YU/MLR3fOUPYzzUz+Pv8YJD99eq5aNcv8FigoM8c4mPM+S90THCM=
X-Received: by 2002:a05:6214:3d8a:b0:919:5a24:d77c with SMTP id 6a1803df08f44-91b5556a830mr104675746d6.31.1791681348207;
        Sat, 10 Oct 2026 18:15:48 -0700 (PDT)
Received: from omarchy ([2601:804:8780:3df1:6ff:277e:31c7:ac13])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b550c354asm58641236d6.39.2026.10.10.18.15.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 18:15:47 -0700 (PDT)
From: zoan37 <agentzoan@gmail.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Freddy Hsin <freddy.hsin@mediatek.com>,
	linux-watchdog@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] watchdog: mtk_wdt: Stop a running watchdog over system sleep even if not opened
Date: Sat, 10 Oct 2026 21:15:36 -0400
Message-ID: <20261011011536.1139162-1-agentzoan@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mtk_wdt_suspend() and mtk_wdt_resume() only stop and restart the
watchdog when it is active, that is, when userspace has opened it.

But a watchdog that the bootloader left enabled stays enabled at probe,
marked WDOG_HW_RUNNING, and the watchdog core pings it until userspace
takes over; that has been the case since
commit bbece05c0d3a ("watchdog: mtk_wdt: Remove mtk_wdt_stop() in probe()
to prevent the system freeze and it doesn't reboot by watchdog problem").
If the system suspends before userspace opens the device, or userspace
never does, nothing stops the watchdog and nothing pings it while the
system sleeps, so it resets the system one timeout (31 s by default)
into the sleep.

Also stop it on suspend and restart it on resume when it is running in
hardware, like sp805_wdt does.

The core's ping worker for such a watchdog would keep running across
the sleep and could ping the stopped watchdog after resume, before
mtk_wdt_resume() has started it again. Have the core stop the worker
over system sleep with watchdog_stop_ping_on_suspend(), as imx2_wdt
does: it pings one last time before the system suspends and restarts
the worker once everything has resumed.

Fixes: bbece05c0d3a ("watchdog: mtk_wdt: Remove mtk_wdt_stop() in probe() to prevent the system freeze and it doesn't reboot by watchdog problem")
Assisted-by: LLM
Signed-off-by: zoan37 <agentzoan@gmail.com>
---
Changes in v2:
- Also call watchdog_stop_ping_on_suspend() in probe, so the core's ping
  worker doesn't run across the sleep and ping the stopped watchdog
  before mtk_wdt_resume() (pointed out by the Sashiko review of v1).
- Link to v1: https://lore.kernel.org/all/20261011004322.1118027-1-agentzoan@gmail.com/

Testing: on an MT8189 Chromebook (next-20261008 plus MT8189 support)
whose firmware leaves the watchdog off; a local module parameter
(mtk_wdt.start_timeout=31) starts it in probe the same way a
bootloader-enabled watchdog is picked up (WDOG_HW_RUNNING set, fed by
the watchdog core, nobody opening /dev/watchdog). Without the suspend
change the board reset about 30 s into s2idle. With v2: 4 s2idle cycles
of 60 s each, awake 45 s after every resume, all came back with no
reset (so the worker feeds it again after resume). v1 also passed a
10-minute s2idle sleep. Not tested with a watchdog actually left enabled
by a bootloader. Built with W=1, checkpatch --strict clean apart from
the sign-off.

 drivers/watchdog/mtk_wdt.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
index 1630ab65d593..3c493a470b37 100644
--- a/drivers/watchdog/mtk_wdt.c
+++ b/drivers/watchdog/mtk_wdt.c
@@ -543,6 +543,7 @@ static int mtk_wdt_probe(struct platform_device *pdev)
 	mtk_wdt_init(&mtk_wdt->wdt_dev);
 
 	watchdog_stop_on_reboot(&mtk_wdt->wdt_dev);
+	watchdog_stop_ping_on_suspend(&mtk_wdt->wdt_dev);
 	err = devm_watchdog_register_device(dev, &mtk_wdt->wdt_dev);
 	if (unlikely(err))
 		return err;
@@ -572,7 +573,8 @@ static int mtk_wdt_suspend(struct device *dev)
 {
 	struct mtk_wdt_dev *mtk_wdt = dev_get_drvdata(dev);
 
-	if (watchdog_active(&mtk_wdt->wdt_dev))
+	if (watchdog_active(&mtk_wdt->wdt_dev) ||
+	    watchdog_hw_running(&mtk_wdt->wdt_dev))
 		mtk_wdt_stop(&mtk_wdt->wdt_dev);
 
 	return 0;
@@ -582,7 +584,8 @@ static int mtk_wdt_resume(struct device *dev)
 {
 	struct mtk_wdt_dev *mtk_wdt = dev_get_drvdata(dev);
 
-	if (watchdog_active(&mtk_wdt->wdt_dev)) {
+	if (watchdog_active(&mtk_wdt->wdt_dev) ||
+	    watchdog_hw_running(&mtk_wdt->wdt_dev)) {
 		mtk_wdt_start(&mtk_wdt->wdt_dev);
 		mtk_wdt_ping(&mtk_wdt->wdt_dev);
 	}

base-commit: aac26bee2287c88af5be5a5ff96d783b19a28790
-- 
2.43.0

