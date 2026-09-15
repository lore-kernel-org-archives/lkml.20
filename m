Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60F8D459AD9
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 10:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789467486; cv=none; b=NQ83ECIh2M2x/Of+u+I2cHSAv4rmFyZbHSpeitUv97XsF0Jp7NAQl0Ewi8eIwuNViscDedGxoPp1AbcDXC9kTDzovv3IKbM9Snk5BKWKw8jIZrAgSKNPtVOylZAnr0ei+EgQY6efcFs3ur6BB0ydVRm9FzQXi8uYbr9nXKXv7WE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789467486; c=relaxed/simple;
	bh=PU0+/z0noS4XEBYFsQsHfYbK4ZLCfrbXdbuDxbnay4E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OO8bbu8oTz6Jxi1B2PJs6UboBh9khQZK3uGOaG1KkJUVdCm2HHYqPW9wRhjB7FpMAkpYXEhj37HYR3/Es29yNvsRJAUneAP/EIBemZPbNQ9MSf4mcJDlP+ggOmrEvz/pbqppDcwynhUCJE2wFRFBa4fMzaYHwjbPFhe9nxF89II=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QnXEkvFJ; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QnXEkvFJ"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d8fb334e72so29916885ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 03:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789467484; x=1790072284; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZlgVVcfg+Lh0mL+x/J2QZQKzTvoTZ7CiYthVXrC/8n4=;
        b=QnXEkvFJbvESuvcvqpdQCbm6qcG5rLvn8f82RpyQ7bmr6jLlwjT91/yMDSLhXnAHsW
         aj+AEdebMowTXyj+eiaAZcTg5XcHX0UxePBPV74Fnck1fYbA13kimg4daieD6r7NlTSd
         BgpFZqJ32I39MXgTpvgu+TtG1wOiNNN3EdOwJD11e+C5j3APSjXonyWJSyTKYWb9AZ+S
         3QLGODJyPrvcDS+Vc9qdLTzZ0FnAxkX4owLhYrzL7Y0MfaR2MPpq+1ULC5AlvcHsseR4
         yJg0mfZNLQpbztRdi29uWoMC8Ms6xbtZmCoq6d0woExj1P+K+AHmYQq0ComFwM/9GcM5
         nBjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789467484; x=1790072284;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZlgVVcfg+Lh0mL+x/J2QZQKzTvoTZ7CiYthVXrC/8n4=;
        b=RNRjWl/sMtOHHxmXvoHxqQmlyY3kDoHvj3AXT/weYolp8uSl3F9i31Ax67ZB+FGESV
         esRYCPWGbmMeKjmRyKCDPfJ2upiDxHtPUHjCXUt6OSfHyDqRn+cA5aGbT5NTnTDVov9k
         O8ClnFysUrhO3adMxgCyVXP6w996QDORTrMjXbm/xjz6R0ThU4tDT/1HWPkV+me3gTRU
         M8CIcMF4Hq55dGuaXrj0KfAaL3iLnQjGMxS3ZWSV9t1x8LPARY3RVItOKfzFnn9qwcrX
         2Sr8Krupl8KfkSiB5F+xWgewi2D734O2ld1sqA4IH5STFVf2FbsoI01X2h0+urEIbiWX
         wRaw==
X-Forwarded-Encrypted: i=1; AKwUvByAVzMGPBmn7nzs7N3x1t0pUsBiC18GJFx7LUja4qUZDbmF1M0pTzx6RzLH19rHLOvn5hlldxus+mJxOXA=@vger.kernel.org
X-Gm-Message-State: AFuF++l5QNVyWhnBHuts4aQVvPpXSQyp48kaiRFqODpIeXQtzsta1XPr
	TUDvkSHVuApkBHHzLZULUjaLHzPCwzQkTplIQYP7qJFD5DokgRHMPiXg
X-Gm-Gg: AYBFou1rPji3RohaJr21LjMfuCswbiBpujX0v5fWR1TaWLjARm5ZEELkVnHZDo4+W4T
	55NpynA1R6emAtxXBhWxQQyLEpWKH4+M2XJzabJmJ5p7g48GzBnkIbX/WqhUMCZKHnb8y+Po9sW
	B0yiPCF2TDKtdlVeBn0PBDFJAVhflj12OoSAyTDIJVaZ6lo7H1a+xNj/HYllyouWVMTaHgLz0fZ
	cxnc+7VVaHEmRHmg3Sknne+NmtgeDISr9OhnAEAethOQvlhafGKCZMMmNHqWeIX9YMK/Psk0a7h
	nOVVvhkAZmgxpOF7jYDRFdN2AGooF9vIoGMr6UY5bk32YI1CH6lu+Gs7T2g0mDRvAuVm3tsGcIy
	4d5UlxS5FBhcw3ArQ6i71J6t7kJw68p9osvlDeWLewtns4Q67XW4wA3MWE32Vf/uXL+TWRFg+Nv
	AKzbGOxQfsggbw/w3oXYZbmrYl4F44IGIpHrlM2a+sM62DkGwmU74LhMg=
X-Received: by 2002:a17:902:e88c:b0:2d8:d4cc:be62 with SMTP id d9443c01a7336-2dd6c7129dbmr131186545ad.15.1789467483499;
        Tue, 15 Sep 2026 03:18:03 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd44ad5d5bsm53441335ad.75.2026.09.15.03.18.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 03:18:03 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] media: i2c: vd55g1: fix runtime PM cleanup on probe failure
Date: Tue, 15 Sep 2026 18:17:53 +0800
Message-ID: <20260915101753.2356900-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vd55g1_probe() takes a runtime PM reference with
pm_runtime_get_noresume() and drops it with pm_runtime_put_autosuspend()
before initializing and registering the V4L2 subdevice.

If either of those later operations fails, the error path calls
pm_runtime_put_noidle() again even though the runtime PM reference has
already been released. The extra put has no matching get operation.

The autosuspend request may also have suspended the device before the
probe failure path is reached. In that case, unconditionally calling
vd55g1_power_off() can disable the clock and regulators a second time.

Drop the unmatched pm_runtime_put_noidle(), only power off the sensor
when it is not already runtime suspended, and set the runtime PM state
to suspended afterwards. This also makes the probe failure cleanup
consistent with the driver remove path.

This issue was found by manual code inspection.

Fixes: e56616d7b23c ("media: i2c: Add driver for ST VD55G1 camera sensor")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/media/i2c/vd55g1.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/vd55g1.c b/drivers/media/i2c/vd55g1.c
index 6f458f611f63..eb5a601cb22e 100644
--- a/drivers/media/i2c/vd55g1.c
+++ b/drivers/media/i2c/vd55g1.c
@@ -2055,9 +2055,10 @@ static int vd55g1_probe(struct i2c_client *client)
 	vd55g1_subdev_cleanup(sensor);
 err_power_off:
 	pm_runtime_disable(dev);
-	pm_runtime_put_noidle(dev);
+	if (!pm_runtime_status_suspended(dev))
+		vd55g1_power_off(dev);
+	pm_runtime_set_suspended(dev);
 	pm_runtime_dont_use_autosuspend(dev);
-	vd55g1_power_off(dev);
 
 	return ret;
 }
-- 
2.43.0

