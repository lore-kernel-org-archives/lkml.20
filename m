Received: from mail-pz2-f17.google.com (mail-pz2-f17.google.com [74.125.228.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7112489FA4
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 16:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789404655; cv=none; b=lXy31FMS6lFxePJdaJEGR7TVYDXn1WZYgBwqzb9KcgTIJRtjlT13Erg5F+uhM7SposT55J591avfS59nEM0xyiMTAG02QsAJbnzS/HPvENyTqlgP+1r5YfFrmHlFRS9nc15LAks3RCjCYqVVgZBaivogKGEMDrfHUSfgrmqAcBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789404655; c=relaxed/simple;
	bh=NgiDLzNvPxgzCJGn7AD4Tdxqijq1CnNJtk2CT/wXjbw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ERTKv+l4hm5Hk9JevoAHDT+WI5hGzUaaIEJxZhxbHtfAV5jaE8OW+PVBDef4UwUBDQZZFvo3a/X+fnLULOCClHk7REipRcHwxBqfK7v/WeS2rPgYvG+9b2zxfOw/qogRIfV0h7mRN3S8rC6Y2e2SviOApXZW/wF+1yeoHSUHdnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=grZ0I5UH; arc=none smtp.client-ip=74.125.228.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="grZ0I5UH"
Received: by mail-pz2-f17.google.com with SMTP id 41be03b00d2f7-cc4c3304784so2039384a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789404653; x=1790009453; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wWgw8e/ZbiIFBfDj3eDifximzU2Ze39xiIPr56fiqbQ=;
        b=grZ0I5UHq9fVMkcCbdmXKiYsB7ftEgu6URbpkA/UdmwGbBKcbkmaa7Yetz8NgxM6Gv
         0QTc3gjkVGZQJS/KrjO9Um6uaRnnq1VjMf3X9W53JaIAibjQSBxaKY8Io7h4/jVZ9hPO
         N+tvwqja2fliSoESuQ7CbL6O6gSloIhLYGGfe2vXhr5qQcxFoPlaJ4z6TynGIlJZEGJ8
         jff3Em/0heq3Ry+ItiStZQTP5OKqNBD+sroQBQTVtYz9Jg9J3sWjzdZ8g+7Jk+8uQV6U
         k9UwfD+oG8qE2m30Zo1JQOstToSgQaLe3r8AysMi0ojSX/zBFVwPUOZcqAQkwM/yvXzK
         2s1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789404653; x=1790009453;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wWgw8e/ZbiIFBfDj3eDifximzU2Ze39xiIPr56fiqbQ=;
        b=RPWhtExti1oyCEaWYVcKhllO5mJbIXm9GskUhliYaZZQXNYRlSGd5AnUfDYvqHN1JH
         y9+8YQraaM238Xe0Oki2h63fgmCDMiAvqBh/AXLdrtoF/mGkOCpuVWIEZ+Wz/rMnwt/T
         7pHsWTjUWfNj+55gdS+3a+oEiv4IYEg4KKeLrhErmPmC0vhAuPjxT8UywrtrpPTOzUJE
         gWsNGxmof0Vz2VuLWDbzLKoGAa3nGkiEztkASpdvT+qlkUbZNEcdO8ZF+mo4lkB7lsr7
         rF7wkYjFVnIZNkcM/rIk68DBxe+YCfDm0dIfqd7afdHyP/RIcGEYEvUVrFQTs4lIOkE0
         AkqQ==
X-Forwarded-Encrypted: i=1; AKwUvByxoWFSes7e37ZIquPfsd/nflHBJNTxzg4rbJDZcFtpJemBRw722WKW+pSlvLpp3jF2b0nnjr3NvubQ79A=@vger.kernel.org
X-Gm-Message-State: AFuF++m9ARfp7IvIsZfS77xtAWPWtxg/+9u/yzLnmCELKGLz7jfgCzBK
	8Z9zUnY0KGSYymfeH8QTJr/xFG9FKB64jbBwOiJRA68POiM9jS9dUG7P
X-Gm-Gg: AYBFou3J34B3vy8PMqqrpUm1w3AqTnPN9r5dRWXfPipQGZUgPnBaDE0l8zlXlV+Q2sa
	dDkYSCxjmov/7k2kxeSWKfb8prSq9Tpa+MhqMpg/+IxLCclGNzJju4OK1xf813zHJXwRfW0I7dw
	ZF0GP0LjIA3Q8KFygeQ5Xk6y4RTi/Dvw/WqGGMABkHgJg5X7kn67F6CqfwueJhxqgh97fodxG2m
	dmgXtwjkjRzAJlcl4CEhWUb/sWluk0oMhD/iAVRI6UOn+2eem5VD7mJ9hLEX9lscUORQSn3IzsV
	tzDIQ3lAZoavTXcwvcS3/l4kYi9sPwVO238iKCIXk3HDOi477bNTJP7s6s86vbRx/WbZ6lsdYBj
	snTpN8HsNmRxR+2h5Mq4Ycwxij6j1debuW4wSkSUsHn5o1fuZMBkg5SpE8Ez/chj7DrX9mYb1Fu
	HLKujKQWEHB/Lz7cfvttAU+j2Hl4t/eR+Al1+vZ0CAvRFRrHr/dt/vi7pgJUaoBNCD
X-Received: by 2002:a17:90b:39cc:b0:398:c150:e7b3 with SMTP id 98e67ed59e1d1-39debf54a04mr7903953a91.4.1789404652772;
        Mon, 14 Sep 2026 09:50:52 -0700 (PDT)
Received: from bloom.localdomain ([2604:3d09:178e:e100::c570])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dfba020d1sm507114a91.2.2026.09.14.09.50.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 09:50:51 -0700 (PDT)
From: Ivy Lopez <skunkolee@gmail.com>
To: xingyu.wu@starfivetech.com,
	ziv.xu@starfivetech.com,
	wim@linux-watchdog.org,
	linux@roeck-us.net
Cc: linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ivy Lopez <skunkolee@gmail.com>
Subject: [PATCH] watchdog: starfive-wdt: fix PM reference leak in probe error path
Date: Mon, 14 Sep 2026 10:50:22 -0600
Message-ID: <20260914165022.169877-1-skunkolee@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pm_runtime_resume_and_get() increments the runtime PM usage counter
on success. If a later step in probe() fails (reset_init, clock rate
check, watchdog_start, or watchdog_register_device), control reaches
err_exit, which calls pm_runtime_disable() but never puts the
reference, leaking the PM usage count.

Add a pm_runtime_put_sync() call in err_exit, gated on
pm_runtime_enabled(), to balance the earlier get.

Fixes: db728ea9c7be ("drivers: watchdog: Add StarFive Watchdog driver")
Signed-off-by: Ivy Lopez <skunkolee@gmail.com>
---
 drivers/watchdog/starfive-wdt.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/watchdog/starfive-wdt.c b/drivers/watchdog/starfive-wdt.c
index af55adc4a3c6..f87f8d5a3dab 100644
--- a/drivers/watchdog/starfive-wdt.c
+++ b/drivers/watchdog/starfive-wdt.c
@@ -510,6 +510,8 @@ static int starfive_wdt_probe(struct platform_device *pdev)
 	watchdog_unregister_device(&wdt->wdd);
 err_exit:
 	starfive_wdt_disable_clock(wdt);
+	if (pm_runtime_enabled(&pdev->dev))
+		pm_runtime_put_sync(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 
 	return ret;
-- 
2.55.0

