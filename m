Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C4EA3D3492
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 10:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792318728; cv=none; b=mprkofZjpmum4hgh/iWXXJLo1P+1fG+oflyxNeIPzKZKdY4rWdCsCEEc5Z+ouBNN/BsGMN8Q2okGDGRWLB/B1122KfHbnGW0q9ESMykZOq7PVyzaa6UYIb2OAEY8bR3Z0zh5p5ocM2Nh+KXVtfPImFOoNl0zZoDRIozCzVGy93k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792318728; c=relaxed/simple;
	bh=fGNM8hiWzIiQkrVUGPIW+8kpmbrfO/8gvWaDINH0zhU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A0m0KDj46gDVGDFGZgBl6HyHu/yCHc+1ha31eqliP23sSmtH0Q7WNlmAZHyDaz2pDxZvbRVe9cQpFbPEyAtbPwr+knALyktLMzlLY+BKVwBA3lM+D3Bds0Mkfiy5MBuBnKV1Gqq4wuMrdBxYhqAKpFhjbMtDNSllaOkNxjEus9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=B+BjgB2g; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="B+BjgB2g"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48dc202a60eso137492f8f.3
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 03:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792318725; x=1792923525; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8qXj6XPnyc7d5Q45eCB1efExYQfwF5P5O6QZsG7oZeg=;
        b=B+BjgB2giW7/1swOjhiawrvqe+p+lIHyo5BROxvQFvMK2Zjculb+0seiWsZsCQrBqC
         sVNxytRB8GVlGw3GG2kg0N5fWC4R2nGNB++RbrpJ2MLO3Sk2xAWDQwKScYQ/8xdltXnF
         XFb64RWhFLHu1QFtDQ5vljn1J3LJruEP+ki3LM/xLZkuyVKctlodx2ylw7eylJaAb7+l
         cSBtcgK0mzuW9+tJe5WChPEIiID9JubTkgaB2EO2BEPnc/9zR3Ab94ZF4A3Wsk3Alljf
         xlG3XpCZh3nhBNEXnFl/3MSuTmnmAjP+foK3mUuTC/a4vWE+IMjsOd6woKO9x9NmgcqA
         tZOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792318725; x=1792923525;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8qXj6XPnyc7d5Q45eCB1efExYQfwF5P5O6QZsG7oZeg=;
        b=yja6x8PLAf0Woqe+KsmmGQYu8rpp+JbAh1aSZhU60wBGLekUJcOLZntiZfL1TW0aJS
         DaM49c7Kx/psyr+e45IuKUCe43l/VEbqNiPvZzfecdJybr6AXl4jCw+sIHMOr+7xuOUw
         zJdZs+YrNQYWIHZgGx31ddsCa+NxHdw5AK88qnPs+yTyIgDMiXyb/77iVg2CB95Gvgdv
         RfJ3pzbAFNhnt3ZPWFnoL4oDOh/l2ky22V56aTqtBwNQv+jvTu4tcvMZeeXuR652mLgB
         DZWUiDz4Hf9zGkXzK1mkdR8QGcIP+79dSQJAPTXf//Rha9p3fM0n9rtsjGBTofi1porh
         R/7Q==
X-Forwarded-Encrypted: i=1; AKwUvBy3z2Nu/Yka1pyumFIYlEK1YtMb03His/+Ht7M5XjKvkDapdl9sVZYOiGiXxHjSiA6zNMmJuJLg1R4fDsE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLAbcmCDL+qBza+3sgefn//zt5LvNxK6oK2LW4K0NFwtJxE7+z7
	GarBRw31Vj79DR0ntpyO8nP39vMgwnVTS8xWuLEBfMpTSOwDD7D8KV6hBH/9ADWWaTc=
X-Gm-Gg: AYBFou0VuMJTZT3RFZAwCY8KwD+g7a05AOEK6CFGqNEEjzkVrqN9ALKVmqX4WOPKs6w
	V1SvijKLkFbzenWAXMazXwKifr7kr2ctVMWX4UmugXJpnzqZm8MeUtZXb4GmQfmRli0cOo04ubV
	rsN2XlN3RPJZ+E5o5BDyTfZ36u/BYbKM2sOj3zo3zVmQpTiAedFVNx+KK0RmVHkvU1HxOst4qQ0
	kFi15edKp+IuJYWczAsb8DoOktR/jBOoDlgmFcanZrlblrgkl+C0W4oEZNsK79kxDbVi6lOFTO0
	IHjAW65TkEmS2YhymoGPSnTvFI2qYn0bKhkl7WeF7fQOJZMkrXrvTgSqv3oEsOi+WviRuYvhCaA
	bgfEtXjFdMS81LK/TxRBEA61JpudKwkDijodl8SiCbLKWLrVJm2ZTbtHew9i2alvTNrHAFIb2n0
	06/Lj6vu7/dNuRv69a0WBf/VA0DQU9MJT7Q+WpszLg4iIFEPTQS4MDDtKHyG5JZQbuO77U
X-Received: by 2002:adf:f8cb:0:b0:48a:eeef:b4a7 with SMTP id ffacd0b85a97d-48e07fa40camr6081304f8f.48.1792318725277;
        Sun, 18 Oct 2026 03:18:45 -0700 (PDT)
Received: from [127.0.1.1] ([37.103.126.255])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4d4978sm14911507f8f.21.2026.10.18.03.18.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 03:18:44 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Date: Sun, 18 Oct 2026 12:18:02 +0200
Subject: [PATCH v5 5/7] ASoC: meson: aiu: add I2S Capture DAI
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261018-audin-v5-5-4b8cc13a1b22@baylibre.com>
References: <20261018-audin-v5-0-4b8cc13a1b22@baylibre.com>
In-Reply-To: <20261018-audin-v5-0-4b8cc13a1b22@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Valerio Setti <vsetti@baylibre.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1411; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=fGNM8hiWzIiQkrVUGPIW+8kpmbrfO/8gvWaDINH0zhU=;
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFlX5vyW17Gfsjqy4bPUv23K+y0TruzSyPMN/cPRHPJpH
 he3cuP3jlIWBjEuBlkxRRaW6fd+F5SqPTROOFkAM4eVCWQIAxenAEzkdzDD/3RrjuULFd6EWv53
 Tlg6c2rKc/ew30zM51b+Xq6xncnhIRsjw7nwrhuaopp80cpyRxwWhjfulVuze+urLyzTddOzDAz
 auAA=
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100

Add capture stream to CPU_I2S_ENCODER making it able to handle both
playback and capture streams. Captured data is formatted from
"audin-formatter-i2s" widget, buffered from "audin-fifo" into an internal
FIFO and then bulk transmitted into RAM when the FIFO is full.

As for the naming of the stream "I2S Encoder" is kept as base following
the same pattern used for the playback stream and with the goal to minimize
changes.

Supported format for capture is currently limited to S16_LE because it's
the only one that has been tested. According to the manual also S24_LE
should be supported, but this is kept as follow-up.

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
 sound/soc/meson/aiu.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/meson/aiu.c b/sound/soc/meson/aiu.c
index 535fbf7c1639..14d0e20a4bd6 100644
--- a/sound/soc/meson/aiu.c
+++ b/sound/soc/meson/aiu.c
@@ -153,6 +153,13 @@ static struct snd_soc_dai_driver aiu_cpu_dai_drv[] = {
 			.rates = SNDRV_PCM_RATE_8000_192000,
 			.formats = AIU_FORMATS,
 		},
+		.capture = {
+			.stream_name = "I2S Encoder Capture",
+			.channels_min = 2,
+			.channels_max = 2,
+			.rates = SNDRV_PCM_RATE_8000_192000,
+			.formats = SNDRV_PCM_FMTBIT_S16_LE,
+		},
 		.ops = &aiu_encoder_i2s_dai_ops,
 		.symmetric_rate = 1,
 	},

-- 
2.47.3

