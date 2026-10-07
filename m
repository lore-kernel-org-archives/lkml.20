Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95C6038F95A
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 10:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791370240; cv=none; b=RREPcYUyv9SQFYWDJzpPQSo55uAgOAvYslvWxlaYdrL+Q51nDjYKQ97Zl6x5uvzS6yPNEmKnAwoFU6v6e9mGnuITurHkQnsyCBRoljXd+RgBMHf+QhOvGaFOcLUaxTodMZCgtFd8rfn6IMbblzej6jiIDeMhPlSQkKfHfyP//fI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791370240; c=relaxed/simple;
	bh=UeOYdAgNJbhl8HXcJG32XHcuWeuRzfkXTfN2CC/Z/wk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tYo2q2TH/TxhmrPj6MXEd145ky9h39+bvcR+ie0uan/374jhUpLzFuzgvNxfKCoWLetbn2PCpjLNMp2AFKkEA7QQNkXkjxFO6yKHWgL7osSsJtnPOfoNUtMiyPQ/zUjwAAEbaQRD2iYuSjxJyJxE3WY8I5oHyO2Nxk2PPuDZpdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TIUQehoO; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TIUQehoO"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8714288dd3bso898054b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 03:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791370204; x=1791975004; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fC7NqtIJTHyhvDivfZbpCmHmRF+i/jxBDQHBauVmSS0=;
        b=TIUQehoOJCE9kV9K0pbKF1iy8Sgu8Ms3UwT5puxDMakNT+OO9FP2b4VC5g8OSTgcly
         KnG5Oj2nYAmA6ux/lXaHSPD4iD+G0sSkqg6BhgcSC7Wl3q8jjz+phBEcWYLismCjQj0b
         RFzU9L2nwXq5uxGenDsq7Ic7zYoIFoIZ0JD14/b8F9W7eohfO5DsDWNj2moT5NCZIbXx
         8E+njSqBBHbKuMFRMbOp/t+wrA87n3WNdN9niv9Wa/FpFy4dJNLXJ3AUcUmt3oq2gsgi
         EZ8MG2XS6QOQJsE6xKwNJJ4bzPiDEM3FB+BlOUatGGg6mXJ4/yzM1qZIHhFdinQxJd2T
         392A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791370204; x=1791975004;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fC7NqtIJTHyhvDivfZbpCmHmRF+i/jxBDQHBauVmSS0=;
        b=DCPOcO4euo/4VpWwGIAGi9ozGyZ84MDSoHSclYhMJkhekwq1amdNEH7UUuwor04p25
         AfXLaKz3+G7vgl/yhB9eonCW+EkdbP+Y3eNzWEdDXI82OUp5W8NDvK/n0qY8OUecYNCx
         52QeAjuXisTFLwlHIIw0WR+7MYGC0s99Vp5lgA1EgqhbfMEwKNqeUtcHnyeKrBIGvz2H
         EyuceEdz85wtdfoliB0edh+VSdHwq7DvjYKcVJz3a7WZ3tMXUxdKtwXnYrrQ0ixL1cLR
         xdLX/gRojcjGhoxsPAznmBQWVW1Je4ipF/kyslarOR29KpvZWNwV1fmmY/eKiS8kiqQ+
         gO8w==
X-Forwarded-Encrypted: i=1; AKwUvByfjZ6LFDBVzwLfr8Opesu6qlrH5Fm1IuMyD5ZiErrSYvkidE0pf7PkjqLz9fKL7B4wwZvvfx3c3M6j9kY=@vger.kernel.org
X-Gm-Message-State: AFuF++kOziSoG9xmaAqDtQoYHJOqc7XE9aRo5EEMddCYAnF8w9PI8jIF
	a0sp82fXnSIVedK1XdT+1qquBWQtrPluU/Af5ZLsRNUKw5p7esSTBeMz
X-Gm-Gg: AYBFou1xvCK4f00I/W5dXDoQStZ4i/dG2N/QhYDQdMOnCEIaeTUDOa28VN6VMZoeusM
	SCiXVQjtNDH/IVsv+w0yZBc+ltVpzQeP0AuRr1936N/q4tohT5iPMuokjR9l15HCN8rPVXW9h1a
	YbA3vI21M3ZfiKLxdERqct6QMEuBwBoBl6qj8woXWluI6Z85wgHQPKlx47lVU81htnt6TH5k4ky
	X1OhGOPIeuP/kfsOqSnII03sfkyqdzYz8fc30yLqS/lananhe25iRqh8iYlnQ87ez6Bf35iJYyh
	sGdQZxyHOyrNoiLzVuXBpvZN5XW4Lmr9LnqAFrYsSWxOHM7Q0+4mfQ6jGf2TQFfaq3K2ac9rWxG
	jitYP8C/ZZ6UrUovpDdT/QWEfHmD43sRx6HG3T6MUr/4eRwIx44EDgcBPkxWnHyGEJExrhnQLSP
	6lNsEsopoIbidjSwqMDbZUfi7T1yGdaLuBaSHlXMHf/i/QZ/lKGxUkJ3n3Cd4nBfKHFxOBPpmFT
	Dl5X0VgZFT6bgpWbk+1TvS8ahBtjjYuTunnfDcQo3LZDDK74GyuyWhGUrVfVj3CIcivwYpQuZ5c
	Re1yqTWG5pqaKQM=
X-Received: by 2002:a05:6a00:4405:b0:878:3538:8f77 with SMTP id d2e1a72fcca58-891b1b706acmr1692236b3a.37.1791370203645;
        Wed, 07 Oct 2026 03:50:03 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8918891808bsm1197898b3a.10.2026.10.07.03.50.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 03:50:03 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Shunqian Zheng <zhengsq@rock-chips.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Walter Werner Schneider <contact@schnwalter.eu>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Jacopo Mondi <jacopo@jmondi.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Luca Weiss <luca@lucaweiss.eu>,
	Hans Verkuil <hverkuil@kernel.org>,
	Roman Kovalivskyi <roman.kovalivskyi@globallogic.com>,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 2/3] media: i2c: ov2732: propagate GPIO errors
Date: Wed,  7 Oct 2026 17:49:38 +0700
Message-ID: <20261007104940.507820-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261007104940.507820-1-phucduc.bui@gmail.com>
References: <20261007104940.507820-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

devm_gpiod_get_optional() returns NULL when an optional GPIO is not
present, but may return -EPROBE_DEFER or other errors.

Check the return values and propagate errors from the powerdown and
reset GPIO lookups.

Fixes: 247b8b855876 ("media: i2c: Add ov2732 image sensor driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 drivers/media/i2c/ov2732.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/i2c/ov2732.c b/drivers/media/i2c/ov2732.c
index 40035320fec6..b8009c392d4d 100644
--- a/drivers/media/i2c/ov2732.c
+++ b/drivers/media/i2c/ov2732.c
@@ -665,9 +665,15 @@ static int ov2732_probe(struct i2c_client *client)
 	ov2732->powerdown_gpio = devm_gpiod_get_optional(ov2732->dev,
 							 "powerdown",
 							 GPIOD_OUT_HIGH);
+	if (IS_ERR(ov2732->powerdown_gpio))
+		return dev_err_probe(ov2732->dev, PTR_ERR(ov2732->powerdown_gpio),
+				     "failed to get powerdown GPIO\n");
 
 	ov2732->reset_gpio = devm_gpiod_get_optional(ov2732->dev, "reset",
 						     GPIOD_OUT_HIGH);
+	if (IS_ERR(ov2732->reset_gpio))
+		return dev_err_probe(ov2732->dev, PTR_ERR(ov2732->reset_gpio),
+				     "failed to get reset GPIO\n");
 
 	ov2732->regmap = devm_cci_regmap_init_i2c(client, 16);
 	if (IS_ERR(ov2732->regmap))
-- 
2.43.0

