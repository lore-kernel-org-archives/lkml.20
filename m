Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55454418A43
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 18:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788028389; cv=none; b=gn7mtvs/bCgNnezY0tH0JxFgH9ONIv0bZh1tHh7ijdu1Hii3DvcPB35OuAatxb6vZfB7iNky424vqAjwLzxWHxPlVkDjTe+VZUEfMDlGtfucyW4aNwcWSf3IhZ0sZRiByhZdjvMd8u/gl8oa2weUiWe+zgVxe3HX0GdjY2KguGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788028389; c=relaxed/simple;
	bh=vyCh1a/9f+HWTyY1McW6nzBV+qOi8oUrXthPikpGcDM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=alcewOZjPLrEkSKuAiaoxst1BcUG1ymNQu2eNcSUgtEIDobGqY+ubbeMxwl834bHkM2N3a01BD4mqSQMCv7A9wiEzCWwSStNypXG18EAYIGaZaYuWUdfVAS8pT4KdSylPy6dScE7uSE8Irm7EL7RkrMoRIqaeqzM4ggo/R19K+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RLgmVA74; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RLgmVA74"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49556f97a9dso12954515e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 11:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788028386; x=1788633186; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6wuDpNUGIrjwH77k9nZgATZRXnq+7uzbWIulgX39iog=;
        b=RLgmVA74Pv98zN79EveyDhNtzUOp0v5T8MFcoeLKODI2by1Uv5//ieDZaMkdIWZkBc
         dNS0ekod/hH9gz24uIh3S7iKuepddVBFeGC3MfUAD8YBPBTZ28GBIAy6kf+43lOwGZc+
         Ovfw+R113RTTSGc5FU+N0mLzRjtisvlRj6bPrhXKbMvzir3lHQwtcnKVAPh2ssN2pacg
         ttJJ9dKgJSTz11xjrCEXVqzIJyKoby9DAHR/RyUJ511avUibTBvnG5roVluEQ66mdo/X
         cy7zuNrflYrwUrVte17dBhrE0WhhpJBVf+02HYUAP411op2d/joClsTBbCqqj/n9j2xy
         sgyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788028386; x=1788633186;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6wuDpNUGIrjwH77k9nZgATZRXnq+7uzbWIulgX39iog=;
        b=U/mfZyAQOMdlbsGGx1wdrw0EyQ71xC3/nbFtDAupUVgRTjvfC0cga/YB+LQf389sG9
         6oAF+DoPG15lH7SNvazjpep4MvVIVixiZcCzCspjAVszntB+yMIDhlRVYei8qbdSi1/P
         SagBmIAzOUpe+kDw8VmBTfW6GCRgmFOBj1fqxWVY96ils/YHc16LgxiC7CczG7iVmIWy
         R6ytnQxVmvzkGNSnr2HrV6ed6u4/XUJjbjZFJoiib3zobVG2Ujk7BOyO3//QKXoI7BNP
         TP77V3U98aMIMhMvSm2Z/XGwgKRg5JWLzkObGQrOV9WKVCffD3jaoTlV6fzA9Q+Jetxr
         ijLA==
X-Forwarded-Encrypted: i=1; AHgh+RqcE2XgjtKuz0UuO+5HXNRcs5FKY+GSff1XXpAgW6MB/aarCopNGsDAmokFFzhAAF1Ej3pT4zAGfurN6O4=@vger.kernel.org
X-Gm-Message-State: AFuF++lOzixFii49NZNXXB2ktX1w+i7KTXu8jjHx9FYzQwvshsBTCgPS
	M5xFVzyYBrXAxZdMfzA9L6bWLGbA8dy9y7cwyL+x50r4RTRS7/nSG4s584+JzTsRpaRxI9Tn
X-Gm-Gg: AR+sD110B66kJ4zaw6QoV8fonus74Jfn/ug25DfEjAtgFWVRb7gsrBfFBG2rwdvPY0x
	MVcm+fSMeBmMqwsensidibDoXzJoTwQdaMjR7xYvQBN1P1/wRT0k/WF7IoNwF5qXhwlmeSsoR86
	pcJBXHH+kX+c6P/WdQS+2x3MaFww2ScftTxCExSMp2mCgJbcxLTDDPyvsJNwnm7nScMPidpwWOT
	D1Zr8k1VdIVo3xdiUWPWJ1YI1g6jOuZZvGQzoqairr27b65SSaBn9e+ThapPWDIA9N8CDetMUMM
	955YYJugkCnw9OPm4v4h36gnL0qY9lcM1R5qWI9hT/sMncs9NT/w20M5lQi2hD1f6lfUDGx97+f
	+6aRQZG3cKy+WgvT7zJH8utYMPLmE/paxvNqhQ/l7RbrLPgDryyQSmzflyAAO1E9uxOco/vdgER
	90DNmmfVugZIozi/lAo4sSlmwrNdyBbHtQGgFKWAAw1kEqcczJggtidPyYM/ZxRzWnKXPtP42Rv
	mzI8O1aVhEznmISRk+CtA==
X-Received: by 2002:a05:600c:4445:b0:493:e451:a9e1 with SMTP id 5b1f17b1804b1-49b91c2e150mr230254995e9.2.1788028386010;
        Sat, 29 Aug 2026 11:33:06 -0700 (PDT)
Received: from [192.168.1.11] ([148.252.146.192])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ccea6b814sm48682495e9.0.2026.08.29.11.33.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 11:33:05 -0700 (PDT)
From: Dale Whinham <daleyo@gmail.com>
Date: Sat, 29 Aug 2026 19:32:49 +0100
Subject: [PATCH 3/3] platform/surface: aggregator_registry: Add performance
 profile and fan support for Surface Pro 11
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260829-surface-pro-11-aggregator-registry-fixes-v1-3-ebf5cca9d205@gmail.com>
References: <20260829-surface-pro-11-aggregator-registry-fixes-v1-0-ebf5cca9d205@gmail.com>
In-Reply-To: <20260829-surface-pro-11-aggregator-registry-fixes-v1-0-ebf5cca9d205@gmail.com>
To: Maximilian Luz <luzmaximilian@gmail.com>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>, 
 Dale Whinham <daleyo@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788028380; l=918;
 i=daleyo@gmail.com; s=20251214; h=from:subject:message-id;
 bh=vyCh1a/9f+HWTyY1McW6nzBV+qOi8oUrXthPikpGcDM=;
 b=4GzIgkBsV2o4Fqd+QlelJ0rMSJif4w7WE+Cw4asWjQBk4+WVAGjp4y+cfRpKmA4NfW5zuez0b
 3/1hdgl7oszASD4QYnwcRTv0O6IJc+fgx9N46hF73B9Ed3yFbDaGiYn
X-Developer-Key: i=daleyo@gmail.com; a=ed25519;
 pk=M4mvgx1TB2TniKaedTDsO3PbLKgFosJuegXRXPbn2Ds=

The EC on the Surface Pro 11 exposes the performance profile and fan
interfaces. Enable their associated drivers.

Signed-off-by: Dale Whinham <daleyo@gmail.com>
---
 drivers/platform/surface/surface_aggregator_registry.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/platform/surface/surface_aggregator_registry.c b/drivers/platform/surface/surface_aggregator_registry.c
index 2cb8278d98ea..061d4a567a06 100644
--- a/drivers/platform/surface/surface_aggregator_registry.c
+++ b/drivers/platform/surface/surface_aggregator_registry.c
@@ -410,7 +410,9 @@ static const struct software_node *ssam_node_group_sp11[] = {
 	&ssam_node_hub_kip,
 	&ssam_node_bat_ac,
 	&ssam_node_bat_main,
+	&ssam_node_tmp_perf_profile_with_fan,
 	&ssam_node_tmp_sensors,
+	&ssam_node_fan_speed,
 	&ssam_node_hid_kip_keyboard,
 	&ssam_node_hid_kip_penstash,
 	&ssam_node_hid_kip_touchpad,

-- 
2.55.0

