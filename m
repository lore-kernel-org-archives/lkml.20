Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76618EEB3
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 05:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791781272; cv=none; b=Wlmy4xibf8IrE29CaoqzszDF1gRHTGTOwFmqivQ9GRJHcJFpHFFlsmS3DAewiPlwg35sYWI9BKFBXsh3jjn4+DvPXhMcJoDUqyayVA4JWkowMorC/NYHaYjYtaTalkUC0e+dTopwOmCxQXr2///z8S87Do/9Fj+jWA4osxPZbjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791781272; c=relaxed/simple;
	bh=Dgrcx+5l3MbVk3DHwGskiEuwXmdQSekmNT7gHBvxlA0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ark2wmAeIelbtO9ISLa1lxV2V2MbxFxsxv9dKI4HgqkUJM3mn9K3YSA9QX+CoqwwGrYT00WbGfzeTK4sSf3SJfUSvJjirvN/1zfAxIEoFe6+7HNZ1OLY5SIAhNnCJrrFSCwZefLTQNLG8Ruh+c0qsfv3ol3IgDvIa3Zni0byK+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ABiRdiMF; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ABiRdiMF"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-35aa0cf7c40so500140eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 22:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791781270; x=1792386070; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eHYM8ew6E+IpcvsR/Lhzl7vHnRNSJSSkWtz2XyPlZeU=;
        b=ABiRdiMFnGCfWcAoChI5p3GeyEg4QH/S4pWXZ8jR7uEU52wSHXCIMpn7phMJsNIScc
         UpRTnWaiTUVTxqhuqBs7i0VEJwisfIXj7DQBr30HKA/dfFzHY/EIkUovm45kon9FVNxG
         BGVW6iAvEi/MYUn73cCMgt9Fs8kq5rxwoXMtap6DNMgFKhMFiBhS6n7sUdBUGR1abFSW
         kxDUyEPeYm/Nstpz8rLGktvMIxa9JEzG7zEomnz55RyT2GIiaWi6C3jZXT8Ri3n6gLP8
         Us1OObU93g8EjlX1xRwkQetPHytkMxShp8pPD4eaT9vc8nLd/QDcgG1aThefXVMvUkGC
         64Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791781270; x=1792386070;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eHYM8ew6E+IpcvsR/Lhzl7vHnRNSJSSkWtz2XyPlZeU=;
        b=qRRpxJC4gJqnm1UcMtVFCmllm9RNAPn7V9faH8w19HHGknBO+pw9Bs8adc/P5+t6sK
         75SX84LU6l/MH8gIUrpiYLmIxh3RMCCYGFcxmx7Xis1r7HFH+1kgpzKzpl1YXWdY+9UK
         Pv1Ht05ldSnskwfJQFMSmfSNYkGMr8/2yCUMCXhMSMrKjw+sFit0vwjS1O8uQv7xxRRC
         oTaOVLvBDzyrJ+6AFcxZZRdfnaD/4lpRIgZGyk8XaimtfsADRS+RLvoyLM+AdJ0DG2ZX
         qUieYa5MY5II0VTYBtJ+6JnP/FDnbLhpC89uSQgNrM8ujtnoyiBzNA6s+EmdPt1pGIdn
         Nqgw==
X-Forwarded-Encrypted: i=1; AKwUvBxaOiO+Y9IQovDiAtzu867DBkoma4M23SQk6lBrjWQ5reuMnM58Ee23uhEns8ga6ft/YrZI00PVfJNexBM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJCwRLo5I0A1MZm1Z5rwd3f1ygKApaISu7tq8Y4B8hwW6gy4ADA
	wnEU7tnv6I2CoygCraIja2vBN9qoqPyTVj9YxknNJtIuiH2m8IMrrKgR
X-Gm-Gg: AYBFou2oC06DPFco3tyq4NH2imCUfddZObNEZbxmU31Y7KVp9YqRpBWbq0doBrgum91
	eLXqb4dkuMo7kL+dXv9HkQaJv/IRuZbJKbsp4Wpd3+w41odP+gHLMmfascGiElxkLm8SCJgjMtw
	mfNE1b/confJ0gGPjv0YLkQDO+VRmjSjKQFKTcDydaeAE9FwIoNIsHPxrX+iD88CmEHHR+Ak13f
	lAi9HdQTPaj8zUqYZiru2ofKKqz07En/wXxR7gO2OqYc4vOounqOKZ0s/QBZ/idR4kHaWbB3yEn
	V/R9fEbQO0b6UwW/egBvz5JTHpfX0rXA05f3yt6u7zBcfNeeISZTkKpl1Io9bOYKNB5zB4hk3Ee
	sjrHHl8PoVUUNv8bmgdi6/Hl/ebL8bcPqQqjVNYM1eFt655HhHDaFHtR8TJTO4VzOZcr56yLM5T
	ksS4dGloNAb8OuOelaxloRG3HbhdpSI4GvcfDqlWv7YFgk4IfR7Qr5Ev7C0sCegihi6V7Fd5cU2
	7WuODJmu2Iv1I2/Fak/wLeOkf5olq8WV4aRxgVK6InkwcwQM8DmLcgnCTK77jpQY58Qi8lbzemD
	hwICXxSrp9OO2eWPs0XoFqUx90J1bTVPB7vCInqTOkn/oEkwix9OCRP/leKT0zPXCThj+Gg6JHR
	lxGYqZsKEG8hvxyeN/1zBSI2h6sptSzNRracYgq9ZgS9lmaOWVs1I0Qg=
X-Received: by 2002:a05:7301:4882:b0:359:8fd8:a86d with SMTP id 5a478bee46e88-3598fd8a9c8mr5088785eec.31.1791781270317;
        Sun, 11 Oct 2026 22:01:10 -0700 (PDT)
Received: from FT6N242TWK ([223.181.119.248])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-353814b556esm31804877eec.18.2026.10.11.22.01.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 11 Oct 2026 22:01:09 -0700 (PDT)
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
Subject: [PATCH v2 2/2] iio: magnetometer: mmc5633: leave cache-only mode before the cache sync
Date: Mon, 12 Oct 2026 10:30:55 +0530
Message-ID: <20261012050055.48850-3-jain.sm@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261012050055.48850-1-jain.sm@gmail.com>
References: <20261012050055.48850-1-jain.sm@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mmc5633_resume() marks the register cache dirty and calls
regcache_sync_region() while the regmap is still in cache-only mode.
It calls regcache_cache_only(false) only after the sync. This
ordering has been wrong since the driver was added; it happened to work
until regmap started rejecting a sync in cache-only mode.

Since commit afc8e3ee8307 ("regcache: Validate cache_only state in
regcache_sync_region()") a sync in cache-only mode is refused with a
WARN and -EINVAL. Every resume now gives

  WARNING: drivers/base/regmap/regcache.c:536 at regcache_sync_region+0x1a4/0x1c0
  ...
   mmc5633_resume+0x2d/0x70
   dpm_run_callback+0x7d/0x1c0
   device_resume+0x175/0x270
  ...
  mmc5633_i2c 1-0030: Failed to restore control registers

and the control registers are not written. If the chip lost its state
during suspend, it runs with the reset value of CTRL1 while the cache,
and with it the sampling frequency attribute, still has the configured
value. Writing the same frequency again does not repair this, because
regmap_update_bits() finds no difference to the cache.

Leave cache-only mode first, then mark the cache dirty and sync it.

Reproduced in qemu with the I2C driver bound to an i2c-stub device: set
in_magn_sampling_frequency to 3.5 (CTRL1 = 0x02), clear CTRL0 and CTRL1
of the stub behind the driver's back to emulate the power loss, and run
a suspend/resume cycle with "devices" in /sys/power/pm_test. Without
this change CTRL1 is still 0x00 after resume and the warning is
printed. With it, and also with the regcache commit reverted, CTRL1 is
0x02 again and there is no warning. Not tested on real hardware.

Fixes: 6e5f6bf2e3f0 ("iio: magnetometer: Add mmc5633 sensor")
Assisted-by: LLM
Signed-off-by: Shashank Mohan Jain <jain.sm@gmail.com>
---
Prepared with Claude Code (Anthropic), model Claude Opus 5.5
(claude-opus-5-5).

 drivers/iio/magnetometer/mmc5633.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/iio/magnetometer/mmc5633.c b/drivers/iio/magnetometer/mmc5633.c
index f4dae7ba13..b651f01e1b 100644
--- a/drivers/iio/magnetometer/mmc5633.c
+++ b/drivers/iio/magnetometer/mmc5633.c
@@ -499,13 +499,12 @@ static int mmc5633_resume(struct device *dev)
 	struct regmap *regmap = dev_get_regmap(dev, NULL);
 	int ret;
 
+	regcache_cache_only(regmap, false);
 	regcache_mark_dirty(regmap);
 	ret = regcache_sync_region(regmap, MMC5633_REG_CTRL0, MMC5633_REG_CTRL1);
 	if (ret)
 		dev_err(dev, "Failed to restore control registers\n");
 
-	regcache_cache_only(regmap, false);
-
 	return 0;
 }
 
-- 
2.43.0

