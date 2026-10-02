Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A06B47B43B
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 09:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790934598; cv=none; b=cDicZTQTIgAD1YUCKVk9vT9aZmkZX+uB5CS/Bn1EG7+jAM2aXwBxqaXr2QLGULelCYUDVOfcQf3dHV1gtJEnI7QNzhBPCPDSP7Slnbf3QkwBf+cuBiCDX+oxKzqF8U7ORNkSdNPh+TMjx4SAbw2X4wxCFZ8juAD30Pw8BdBMTfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790934598; c=relaxed/simple;
	bh=7XIis/SaxCP7BZheKEH5EfAiCshL6qRfSl6dsIbmL4c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jVk2g5I/5mmBecdJhDgLFbaZ1NV6kGdoym2WBhIrDvUq2Q1hM+JcuUWS54IkPmQ9daejn/O6SYiEz9MkYNLT/OXxNzPlp7PNjP0WRCOvkwMPOHQds1sx1hGJU+h8E9GgjjLWM3VjnIOZggu7P9Jq2bthEjm4rmfeLV/kiYH1pwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=n2B7hROx; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="n2B7hROx"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d822dso55358225e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 02:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1790934589; x=1791539389; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VreqSPw0umlS9eUbJ8pFSQ6XltorV3sROnQHfTXwnds=;
        b=n2B7hROxQtQbKGz18ks1AH3gbEfILIH7PM/7q0+AyxNTos2sgtjQn7nwQB/6ZWoph4
         8UWSULx1+zAPSeYbp5T8apJmjG0rDwkN7bI/ws7JJkOz/mNX18g+aNiF+A6JNGzOXrDR
         ao9gYz0aT5lsRd29VsnTJnK/yjAjorW/phwFs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790934589; x=1791539389;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VreqSPw0umlS9eUbJ8pFSQ6XltorV3sROnQHfTXwnds=;
        b=gCkJyWYI69rMzJjI7VUURaxWjdBoka3FB9SdBkBaSP55lMXbZIAaPXxXbwotAGgAe+
         LnLBJtUQANPhb+NKGGizSr+eqL63kj7kvE1UraGh1U/O1wjELaen4aOIRwtltVGxe5bW
         I9nSJsCQ9o3gMksLnPa1P8L98z4PWFBZtopyxjhAe+ax9IZ308bzSKkakamGHfKTXhoJ
         JOVD7/QoNF4+CDzJJXI6ButsJW7WJPvS6yL1l3I5uWggT5ocOKi8V2SQi13eERCG/oUM
         oHZx0SleMxziTCSynZ/9IVC+zSyHKJnPpNXQFzd8kvkACmI1wGY5lKZdta6M2rhgQtZ0
         Z4YQ==
X-Forwarded-Encrypted: i=1; AKwUvBwxq5ja/1GYMCSXHKaT40Jv1zvXfSnbJnTvaE5Xhl3F8GU1WyFT5bNKxhaW4LSDGlwKaOtq5t6pg5lK4yE=@vger.kernel.org
X-Gm-Message-State: AFuF++lYEZIghXTsImCFVoLZBdf51BnejXO9sWpyIYkHi/Wn3En0MyQZ
	a7+NBFhpgbam1YSsnmqlteLIezQSDwwjHocy/SW5qsYOYKFAlLBnpBmNZOsL+/43Uww=
X-Gm-Gg: AYBFou2x7pxZI+YZnCTY6UKqMafL+WezMh2idgZI4ei5y9pUESUGByPonSYd3Ztq0qi
	7220hbADk1a3811bNZvetEe0IBtMEBJdizgy21Melt13WyDatVict3e62fCpfdu/Yb5yCskTokA
	0/+otdDosO76rgIq8HMuOSJaTHSEn6F0b4xCZ2YznyFdrfgLLixw8MJA/7G0csZGnvWOKDtrg07
	S1Zl2cEyzruVsyPVaXakWU7dWCKFsVPHvGrvKNhgedEIoivDepUBGZtVTuuPVh6KybT/ywWQTNg
	nt/sugbkfDUcQh+tw2tx816SE7VQZ85MQF8KLStimYWXQJxPVhm4R7aVsbmMNozVCgV9nhVnNSK
	RnSaDes9IxbTE9l2NM+7tecKfBHolsxX7GsR07c6qyMLVC3EDAzUN4d+9Z5ykdFfiL5FPQFfmLt
	sJh5pWBd+K7CW9PTxHQzKu2+h23/VXUcnoAzuOzgX713NhNKjGTy9LZgVNRyU3vHh7BBttoEW/J
	vA=
X-Received: by 2002:a05:600c:c3ce:10b0:4a0:317:1996 with SMTP id 5b1f17b1804b1-4a02769f2a5mr27989155e9.27.1790934589559;
        Fri, 02 Oct 2026 02:49:49 -0700 (PDT)
Received: from localhost ([93.90.163.238])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b382f9bc0sm4572200f8f.41.2026.10.02.02.49.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 02:49:49 -0700 (PDT)
From: =?utf-8?q?Roman_Smr=C5=BE?= <roman@amarulasolutions.com>
Date: Fri, 02 Oct 2026 11:49:33 +0200
Subject: [PATCH 4/5] ASoC: pcm179x: Add pcm1796 as compatible with pcm1792a
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261002-work-v1-4-f0e53bc7331f@amarulasolutions.com>
References: <20261002-work-v1-0-f0e53bc7331f@amarulasolutions.com>
In-Reply-To: <20261002-work-v1-0-f0e53bc7331f@amarulasolutions.com>
To: =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Peter Rosin <peda@lysator.liu.se>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shenghao Ding <shenghao-ding@ti.com>, 
 Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
 Sen Wang <sen@ti.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: patches@opensource.cirrus.com, linux-sound@vger.kernel.org, 
 asahi@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Roman_Smr=C5=BE?= <roman@amarulasolutions.com>, 
 linux-amarula@amarulasolutions.com
X-Mailer: b4 0.15.2

The PCM1796 is fully compatible with the PCM1792A.

Signed-off-by: Roman Smrž <roman@amarulasolutions.com>
---
 sound/soc/codecs/pcm179x-i2c.c | 1 +
 sound/soc/codecs/pcm179x-spi.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/sound/soc/codecs/pcm179x-i2c.c b/sound/soc/codecs/pcm179x-i2c.c
index 5337bcc7c62c..e81e20fadadf 100644
--- a/sound/soc/codecs/pcm179x-i2c.c
+++ b/sound/soc/codecs/pcm179x-i2c.c
@@ -32,6 +32,7 @@ static int pcm179x_i2c_probe(struct i2c_client *client)
 #ifdef CONFIG_OF
 static const struct of_device_id pcm179x_of_match[] = {
 	{ .compatible = "ti,pcm1792a", },
+	{ .compatible = "ti,pcm1796", },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, pcm179x_of_match);
diff --git a/sound/soc/codecs/pcm179x-spi.c b/sound/soc/codecs/pcm179x-spi.c
index 192fee90c971..e5e4b942acfc 100644
--- a/sound/soc/codecs/pcm179x-spi.c
+++ b/sound/soc/codecs/pcm179x-spi.c
@@ -31,6 +31,7 @@ static int pcm179x_spi_probe(struct spi_device *spi)
 
 static const struct of_device_id pcm179x_of_match[] __maybe_unused = {
 	{ .compatible = "ti,pcm1792a", },
+	{ .compatible = "ti,pcm1796" },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, pcm179x_of_match);

-- 
2.55.0

