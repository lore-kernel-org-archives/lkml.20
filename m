Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A02124A384D
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 14:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788359036; cv=none; b=QWM6Crm5fRODeCnNiwyR/iqx1Et9bFmqGjYjshrllwgJMxUiHlLHyY/iaGH7RF4QpaZqCalU98jF4ETz2+/ot/4hhEEMVpa7f/9kddElrHVJ1wkHILL7KMQxChztphXEosjNvH9uAN9Zw7o7Bs30/Y0cuPi06VEd7FMy8dBh4sA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788359036; c=relaxed/simple;
	bh=38NdsR7peVgmU+Oqd+nIHCO2SJKGV8pY8vX9DgyGykU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f5XfLQK1syJBqnvV3PdqxrmxFB52jJXERT93jaGfaz6tFVdrAG/i20ElZ5QZhgJlImD9W7T02mlwxcQUgmxw12v0cKfTZDbpXnOpDj1HpsqvPKOYev1L8BHiizY0jawEOlqIsBaJGhZPQO06qqzRntCsVCDyK7P8A8i8ieYMirc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B6VtD3sJ; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B6VtD3sJ"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48441a2ba1bso765082f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 07:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788359033; x=1788963833; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2abaWYtjVKV9VZXaLgXVyTO08oA7zY/lp6O2BFsx6Gs=;
        b=B6VtD3sJQP9dUahxGoPpOgI9gldwlxvAza7jeobH0C1Jlr3jRjT8k2hRFLLpt88izz
         jpbuF7k614XeROtuMfk4EsC2SY6MUXsIn4gPENk+70EU5bO1IaB/uYRZ9/rEE7ejXDef
         UOyhPWQdIy5syMiaUdHVKk2i4Pm2EkSqOSovEjlzIF2eJULxvIY/wGF32p4WMQPwJnBd
         3fVU7ckWs1oQb31ooYaTPlAu9ENg13iEGdc9fWB0TPSDW2LNV2LfrZkObSDRGxP2uHp2
         /Gw9wO06vKUdIBSPutHycxDlRKFY4aV3YhwszFkm3uQO2lb7OMtpvzHnEJUZYvVxdqZN
         FaTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788359033; x=1788963833;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2abaWYtjVKV9VZXaLgXVyTO08oA7zY/lp6O2BFsx6Gs=;
        b=GhVKC99ifn6/yIPGiXzoDlym8OTECjc/prlhpKT7nozTPXnEZpSBwpuE10p/HPT1z4
         NrBdPHPOLPbUn0x9jozIp+8G4+puCDPT7OYLJXLRblbbL9zugkeEdDyXFVPG3ZRqTeew
         yhULpbgVq1ZUsGg3YCQncybZ9ssGuUgsaVy9edeHtdX2TZ0tEKowSGt+rfEleIwn/rRl
         1fsKf8SJkdGy3PW5xs0Kq/VmDApd2xNv52VBlmv6RBb08F3YnDgwVXuAApBhjdSJfclM
         GfkWA5dBUGs7lRjS2G6W/Krab1WoHIQyf4ZF6ApgkgX/6u79VZdvqhaglBpct0+X5x06
         gadQ==
X-Forwarded-Encrypted: i=1; AHgh+RoqbfOn7+3yk6A2wkb+hyDQWbZil1pfM3PZZypT60YtRxR40JmHqC9vD0+FiUdkn3PVuWeo6xfRCrrMDAo=@vger.kernel.org
X-Gm-Message-State: AFuF++nVCH0u0JOQf1xRaMwcGw/MRD/xJ/GcDAGjanqBmlIZvj1BiUwe
	qFzcLoFBxmOuzN9PDtlzT2lnXwc3qcYxvj7uZRSq7O9mVlIK5JrRNIcr
X-Gm-Gg: AR+sD10B3DU7H6xnSpboIYRV+puXEUGByFMrnGTbUr2vRm5xLeczxVDlbb0jZ81zjLZ
	9V++V8UrM5qfUuN7pe/SfmJaDQWez9PoxK6ceg0jOns+NYpomBrN3OA8k2C36l8TfDKymrRhlhB
	BScCDuzDwCbT7sC2oljUF+h1jHy3alwOllCiZMHtt6BGfK3ca/Im0AM3lObHtPtqqZWzsQjoU+0
	/Yti4Uxlad0G2Lyc0rK2fYeF1NllqLHJwLfY9i92cbdU6WAz50D97Cz1CWbjeVY9KELYwmR8z4K
	Ev0s/F/P7F/bwkw9IVsYDBWzhtBRDhutUo5dwzv4236S5LwdbNjZPq88CPcOaewbV+qCNRkDoTG
	ps8gmS6E5VjjptpotWT/5Vz7de25k/Ne0VzT0xhGFf5alDTYXxRDmIL/K71mixPAMQ/fXq8amz0
	wY4n8C1QewDy9TsYAnYz0MVQtEWD7oF4BWp3F6PIPQdJDrf7fsRrz9uQy7XZ6vO0KedEvm0fSaN
	hbl1h4+uBRDER8cmS80aaWjEcaTy11asTt6/ouAzoUATTGlDxo61QH/HU8=
X-Received: by 2002:a05:600c:4e49:b0:499:84fe:5f3e with SMTP id 5b1f17b1804b1-49ce58388d2mr102414235e9.9.1788359030845;
        Wed, 02 Sep 2026 07:23:50 -0700 (PDT)
Received: from raviolimobile.tail5f26fd.ts.net (mob-83-225-30-215.net.vodafone.it. [83.225.30.215])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce5927b68sm58999265e9.1.2026.09.02.07.23.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 07:23:50 -0700 (PDT)
From: Fernando Rimoli <fernandorimoli11@gmail.com>
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	dan.scally@ideasonboard.com,
	linux-kernel@vger.kernel.org,
	Fernando Rimoli <fernandorimoli11@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH v5 2/7] media: ipu-bridge: Add OVTI5693 to the list of supported sensors
Date: Wed,  2 Sep 2026 16:23:16 +0200
Message-ID: <20260902142322.73523-3-fernandorimoli11@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902142322.73523-1-fernandorimoli11@gmail.com>
References: <20260831181858.325109-1-fernandorimoli11@gmail.com>
 <20260902142322.73523-1-fernandorimoli11@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The IPU bridge builds the firmware node graph only for sensors listed in
ipu_supported_sensors[]. The OV5693 is currently listed only under its
legacy "INT33BE" HID, so on Intel IPU6 Surface devices that enumerate it
as "OVTI5693" (e.g. Microsoft Surface Pro 9) the bridge never wires up
the sensor and the front camera is unusable.

Add an "OVTI5693" entry. The link frequency (419200000) matches the
existing INT33BE entry, as it is the same sensor.

Tested on Surface Pro 9 (IPU6).

Link: https://github.com/linux-surface/linux-surface/pull/2171
Signed-off-by: Fernando Rimoli <fernandorimoli11@gmail.com>
Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
---
 drivers/media/pci/intel/ipu-bridge.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 1bb3a3e98..131c70844 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -95,6 +95,8 @@ static const struct ipu_sensor_config ipu_supported_sensors[] = {
 	IPU_SENSOR_CONFIG("OVTI2680", 1, 331200000),
 	/* Omnivision OV5675 */
 	IPU_SENSOR_CONFIG("OVTI5675", 1, 450000000),
+	/* Omnivision OV5693 */
+	IPU_SENSOR_CONFIG("OVTI5693", 1, 419200000),
 	/* Omnivision OV8856 */
 	IPU_SENSOR_CONFIG("OVTI8856", 3, 180000000, 360000000, 720000000),
 	/* Sony IMX471 */
-- 
2.43.0

