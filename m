Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8288825F98A
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 05:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791695979; cv=none; b=bmwcFcApWF0hcKjEEZETWaKsJu6F04B1+kv30H50bQMAsRA0UVhNy6dZzlFIFhHhKCb8RlkEL4MPGNJnE09xTGFmuunvMJ/fKl9tzTfSW8t7RUORww2IBuKztWzTXSiF6M81DoDF50Yhp3PNTTcMvMZqVq6RDtm/Zo+Q+worgMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791695979; c=relaxed/simple;
	bh=RUDhxU5IICd57MLMel006J4juo/b77EpA3NlAx3wuRI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GgdUtcfLKGUIJENIJvLLj/tK5YjlDF9PLzSW/i15czj4rpUc2/lXKtg90J8efUp5AWxsJsIDSctHqMeNFDv2bX0KFzh7g7KYb8KFr64OwI7aG8diyLGza144uaQkFxHQbmE0mKu12L97udLSGSRk7Cn1lZDURb/hLdLC3Wb2LMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bnxgx/ZD; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bnxgx/ZD"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-351767ef18cso3400698eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 22:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791695977; x=1792300777; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B/HcVqIB6kEaCDd0gQAELAv+iq/8HpfI6zOJs4JfV/o=;
        b=bnxgx/ZDCZtfXe7S5LYUlh/03srblmUAjYnKz4Y2Ux0yP2LaMWy6o4SupXTd9SWvfK
         umml05ks04V9qzhw+mv2gylxPAuWBHD1djUFJx3Dwefmyk1B9B7vPOqf+lWocuDMErW8
         hBL39mwSrg40Bb382lACT2bhpu9cDHrs9qxzJl9HS7mL8pSXVIwAo0ReyuxeyjprkWDC
         nrp492fUK9IhVi8YrLA2jBD249yoMXU965sut3KXSLLSkQFu32sxI/TcBJEaAHytH2jS
         M2eZEz7oDwXLltfKMhaixScrPirbjfAbgGHB0qfcILEeMyCz8H2lCrGFGPG5HXMEmMES
         /h0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791695977; x=1792300777;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=B/HcVqIB6kEaCDd0gQAELAv+iq/8HpfI6zOJs4JfV/o=;
        b=G3ajPIpFdywsXQfODa3yPR0hZ2xVCuiQ3gAcGP5S5w7SrYHpYEVER5E5v97kGRMo9w
         wLJrhtDEFpxl2bfB6mg89BDZJJijkfvio96ENZni9+KRgdJZTDSBHLDgCFJurUwsGweG
         rza7KNY6bQToWYRK0CKdQUFmgGdiMov0wkUsm/IoiPC1+7aGbItb3IDYph539+EMtgN+
         DgbwSGm1hDPs+ZtRcR3Qqr+mMX/f36TLIN7fEpBjdRo/UF1oarNIHIuOxC/+yziHjX8U
         XD7EtA+Or2YFeA2aQoqZaOy2gdsuJjaiBmflfCjjJ/lxnQ6obGb1czFEmZ5bP3p/O25p
         uSbg==
X-Forwarded-Encrypted: i=1; AKwUvBwGJjufvjPLdF2L+eU9lN44j2NEpchpAmBKJ+IjT+tSgHJR9E0w50HxiNvVRI7TXZUor3Y2e4v7DUqEh4c=@vger.kernel.org
X-Gm-Message-State: AFq9FYIfYTLIPGWHaWnAjlFweHANCZTAgqLi0lOtw+WLbpmuWW9h0Z16
	SzQxR1h6x/ub3HA6fMoV9p4qP2OwziKRRCFeDlTslk0QthayMxgaDlpZ
X-Gm-Gg: AYBFou2Sbwf4ETFsl+zjSeB1u5M/dl1v7mnUbKb/uasKor+AZ5I3Zdnw5R2k9kkiyCe
	CmzP5KklQ792MB9x+e7KJLCWIc0MjB9nrGvse2IFHyH1cjYCfpp+3/rxPPFQ5ewZqf36bzUZelV
	jC6/cY1159dnqRWUJEvH0yHSnocITqJLIWczWAi+OQJw20vhLdBnRTS17bvLzcr902JbZudJQej
	qgB3oxfQetqi6TVw1yL7f2pbODX6DLlo3/mXPLpSaWZyp2x3QLfHBWjBQeu2c53YQBpU4yVFS9V
	zcBKFBD/OKHPXgRzosyfrd+r/Ljnw/aNdlrDRm6S86m93xx4MavyBjqKyeEbRwZehTbmYjo2TNG
	753irXdPDH7cRKAhDzcGSqQ+mbp/bqKiMc5o9l+El/PYdRWgn+uuf4zLWcOPJL4D4kW6XfqdkDK
	ASiuq7pTlYvhqOgoYiV4UMYSx/orVYn+noE8WXWTMF4bEO6PI18R3T4NV4tk3gqIRv6KPHFFTob
	aRk1lPf71xiZ8JNlC5dZ1/ys3TdYbXSKmdG47RAdfUBvD37xKsHQS4tYNzd3qFcJmSlcLL3BH3q
	egRdubBF3i0zTNtHexmcBiuiY7YR0grYKdPVHC9cItzYQHZPYDXdUcjyFEZpagQeA+GZYqz1CBL
	kOgMsBsJ2Prx5xAhjV9BeoW+0PEdFqpWJ87J+KIOvZM73OsSaJEt9iDY=
X-Received: by 2002:a05:7301:77cb:b0:356:b370:a0ee with SMTP id 5a478bee46e88-356b370a395mr6002551eec.20.1791695976319;
        Sat, 10 Oct 2026 22:19:36 -0700 (PDT)
Received: from FT6N242TWK ([223.181.119.248])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-358ee8a3387sm8502491eec.15.2026.10.10.22.19.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 10 Oct 2026 22:19:34 -0700 (PDT)
From: Shashank Mohan Jain <jain.sm@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	bui duc phuc <phucduc.bui@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] iio: magnetometer: mmc35240: leave cache-only mode before the cache sync
Date: Sun, 11 Oct 2026 10:49:23 +0530
Message-ID: <20261011051924.60456-2-jain.sm@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261011051924.60456-1-jain.sm@gmail.com>
References: <20261011051924.60456-1-jain.sm@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mmc35240_resume() marks the register cache dirty and calls
regcache_sync_region() while the regmap is still in cache-only mode.
It calls regcache_cache_only(false) only after the sync.

Since commit afc8e3ee8307 ("regcache: Validate cache_only state in
regcache_sync_region()") a sync in cache-only mode is refused with a
WARN and -EINVAL. Every resume now gives

  WARNING: drivers/base/regmap/regcache.c:536 at regcache_sync_region+0x1a4/0x1c0
  ...
   mmc35240_resume+0x30/0x70
   dpm_run_callback+0x7d/0x1c0
   device_resume+0x175/0x270
  ...
  mmc35240 1-0030: Failed to restore control registers

and the control registers are not written. If the chip lost its state
during suspend, it runs with the reset value of CTRL1 while the cache,
and with it the sampling frequency attribute, still has the configured
value. Writing the same frequency again does not repair this, because
regmap_update_bits() finds no difference to the cache.

Leave cache-only mode first, then mark the cache dirty and sync it.

Reproduced in qemu with the driver bound to an i2c-stub device: set
in_magn_sampling_frequency to 25 (CTRL1 = 0x02), clear CTRL0 and CTRL1
of the stub behind the driver's back to emulate the power loss, and run
a suspend/resume cycle with "devices" in /sys/power/pm_test. Without
this change CTRL1 is still 0x00 after resume and the warning is
printed. With it, and also with the regcache commit reverted, CTRL1 is
0x02 again and there is no warning. Not tested on real hardware.

Fixes: afc8e3ee8307 ("regcache: Validate cache_only state in regcache_sync_region()")
Assisted-by: LLM
Signed-off-by: Shashank Mohan Jain <jain.sm@gmail.com>
---
Prepared with Claude Code (Anthropic), model Claude Opus 5.5
(claude-opus-5-5).

 drivers/iio/magnetometer/mmc35240.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/iio/magnetometer/mmc35240.c b/drivers/iio/magnetometer/mmc35240.c
index 6f40cba4b1..7f028d7f1f 100644
--- a/drivers/iio/magnetometer/mmc35240.c
+++ b/drivers/iio/magnetometer/mmc35240.c
@@ -532,14 +532,13 @@ static int mmc35240_resume(struct device *dev)
 	struct mmc35240_data *data = iio_priv(indio_dev);
 	int ret;
 
+	regcache_cache_only(data->regmap, false);
 	regcache_mark_dirty(data->regmap);
 	ret = regcache_sync_region(data->regmap, MMC35240_REG_CTRL0,
 				   MMC35240_REG_CTRL1);
 	if (ret < 0)
 		dev_err(dev, "Failed to restore control registers\n");
 
-	regcache_cache_only(data->regmap, false);
-
 	return 0;
 }
 
-- 
2.43.0

