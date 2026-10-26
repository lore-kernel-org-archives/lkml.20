Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793012341;
	b=iRWmH4TclAzCGvlgvENJbqV/qsia43FG1ZOQYSULqdGok33o5Fdk3A9f0hxlFVUSiF8I
	 PDAFfm2PwjVB+OOZ60RjvAW3CYEIUVIZHhiumqYjL/+N8klYQo1eRAp0tr9m92MHAPt4M
	 C7+G9tAv+hGg+Z8QBYUbpeCLByic/1+afkU+l6yA2yign6uHsunujp70em+kVD7iCTg5Q
	 2GA6Pj2rr/LERgVNn9Y44TyBmQG6+bloHLTZTJ4Iu30Ow4q/oQCskCsO6fFbgmZcyX7rm
	 u2dH4OcOAmNMdMPJuWkny32VfHGLfNgG76ltSR7DMx4ibkSpsfNf5x0X6if6KEeo+VQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793012341;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RRSR6UZrJp4tph+fHDjWo4hO/H1Uq5cP28g57V4V9yw=;
	b=rIDIKpWq5qk4hUuQ5YdW5w9bhz0/2Z6SX371w/HWnvDuvysBHSsK0y/M3NrGLtx4+hzz
	 KvE3XR0xf8mC7mnD1DgDmvfNwBRirFiQEqczk5Ourixy7/zWYuxeKzPOBWZ1OweWUCfKy
	 Il1aWA33UH1za7ZQaKdIwn9AV+8SThNk4Hf4zQh8JmF41+wFoJxmB8l3GcBV8/LuTZYyB
	 reY/rX8B5u5HeO+5fq+X5k4RiDiqlEry75fYmGloBcmLpdn7U3Z5UF7UJEKhAokg0qsl0
	 hy0ILGCpyMObg+SjrHHFgRvP1AuqEFAemkUVdXd7Si+m74nUXG5WeiY+yxMJvV0YtMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=E4AMdxsa;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C73F606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 10:59:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C73F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=E4AMdxsa
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3ac77270fbfso1413629a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 03:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793012340; x=1793617140; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RRSR6UZrJp4tph+fHDjWo4hO/H1Uq5cP28g57V4V9yw=;
        b=E4AMdxsa3wzyzbX705calueicxP4utUf2k4Jx4lntZl0oYXfaSAYVmoKKOo4RhYAz6
         nMTBrYDvmQTmRtrPkt6RA9Mi88xlq4olfDNuIDXH9fMO0VkpauLMdceQ9WNK5aRO0TkK
         +aVTk+uyCgo1WG9pHItVGB32xvbo2eetEyRZmaHlB9dSPVLW3TycFbd9n83fz6ctFlNZ
         cHAymeKsY1GW0nHcq3xCrBOT6j0HLjsKSuntrPXmN0hX4RU9FpwEg4cemgMc3Pb97wDl
         flbWwSLDDL/ijEZFVYR7C/KjGT7+TFFMY9R1mUyEXTcy8ub/FRId8UgcYZgpXfVvTwzU
         a+eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793012340; x=1793617140;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RRSR6UZrJp4tph+fHDjWo4hO/H1Uq5cP28g57V4V9yw=;
        b=CSMoQu5S5/97ioURurtoFiDktmMk0DDPeT+XuQOLofQIVyH0LR1o9J6yq2hzeXBgR6
         dHeMtuqG8jp9k9V7rh5Ui3OAdV5HLZoj35Z7hhE9epaIBWuNGFIDwEwsdn/ISN9QZFyQ
         LuYCB7tatrwgR+jc9gubgaSH31MqcuVT72WEBAWsbkK4b9oO5yNIQ84GslX/CfWER8Bm
         oV835HMi/oeGrH3X9JMXtSHZ+hPm2Si+BP506HLCAVRQ2GYD8k82ZJCmXDgjWg2efkWq
         40hyFgoLoUTr/7yw0mKwfWywE5DuywMFmk1fFACkLjWsKd0yynlJJH5D5fiqI5Am/93S
         RI/A==
X-Forwarded-Encrypted: i=1; AKwUvBzFn6YR7pynrG4A5AnlMkRp9+rzIT4sNU6ouA5FNOYAvTj1utRzq17FoYiYgpNiuG8gIWKQQOOg0WOt+IM=@vger.kernel.org
X-Gm-Message-State: AFq9FYI5d3ciAXLOaqEsjIdQ/1QLBJ9I2X3+0kba3zLPCZfb21MWkCyD
	JXrGlyLQsqKTjITWOv+ca9n39OJ1rA1DZhXN14W9yTVEr6AnRtmT8RnX
X-Gm-Gg: AYBFou1kOrNOfIflJ/WJ3Qiit9wCTSA0KalwrVylhAdeIx2+EEVgF5HKDU2dPRMUKE5
	deEaqc1IWOzYGx62cD//3sdNMnxLY6p5106PgI5P0sspf99z6/5/HCAzNqGlmTkjLLf1Oq4MJc/
	qCNFXn8GGRrR3xjnszQC5OhQPIJXXfbFi2AEZjRpI0G/8q4b72w3UQqmacL85BuXMKx6LjqxfZ1
	5Pf2gNJde6rXRZxxoxnrPkUflQi2PDcITHVzouKNNz8P/i9lUek7g60UIxXZuOJQ0Jwc7ql3sda
	CD17AhmjqjTGlLUf17zk+jNWYu+QMnfh5q+qEluH8bWUY7ORt3bJGgCN9kLMLNOzki0O3t0dgk5
	vrCSxe45d2SOl3xFvMvf5oNtJhN8QhZC+ZLvCT6Tsj/xuELkALbfHm0MOV+uoL9p0C+dbUzu2aW
	I5jZEdmHCTzPZ0FeyjwgqkrE0T8mBZ4c2QUtk81xg7RK9QwGWhgAQmzClD3a5Bg+uNoTmf01aT+
	Cz2v6EI9a55Vaic290R1mva4/88ixbodsJgsl8Hqmw3rGakNTuaP8/gVcrfRbSUU+J4jejN5DiL
	vOe5GKaFr+pbmuD0VadtOxoTPcUmXZk5bYnfq6VdHdxZDpz6LHb4unJfWcaPW0k8+xoq43o=
X-Received: by 2002:a17:90a:dfcc:b0:3ac:403d:6239 with SMTP id 98e67ed59e1d1-3adeb0fb5d3mr5038011a91.43.1793012339349;
        Mon, 26 Oct 2026 03:58:59 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebadfa82sm7980768a91.8.2026.10.26.03.58.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 03:58:59 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org,
	Russell King <rmk+kernel@armlinux.org.uk>,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 2/5] ASoC: kirkwood: kirkwood-i2s: Improve error handling in probe
Date: Mon, 26 Oct 2026 17:58:32 +0700
Message-ID: <20261026105835.19052-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261026105835.19052-1-phucduc.bui@gmail.com>
References: <20261026105835.19052-1-phucduc.bui@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Use dev_err_probe() to report clock acquisition errors.

Remove the redundant error message when snd_soc_register_component()
fails. The errors handled here are already reported deeper in the
call chain, so the additional dev_err() call is unnecessary.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/kirkwood/kirkwood-i2s.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/sound/soc/kirkwood/kirkwood-i2s.c b/sound/soc/kirkwood/kirkwood-i2s.c
index cf4327101b96..29641bd4cc60 100644
--- a/sound/soc/kirkwood/kirkwood-i2s.c
+++ b/sound/soc/kirkwood/kirkwood-i2s.c
@@ -687,10 +687,9 @@ static int kirkwood_i2s_dev_probe(struct platform_device *pdev)
 	}
 
 	priv->clk = devm_clk_get(&pdev->dev, np ? "internal" : NULL);
-	if (IS_ERR(priv->clk)) {
-		dev_err(&pdev->dev, "no clock\n");
-		return PTR_ERR(priv->clk);
-	}
+	if (IS_ERR(priv->clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(priv->clk),
+				     "no clock\n");
 
 	priv->extclk = devm_clk_get(&pdev->dev, "extclk");
 	if (IS_ERR(priv->extclk)) {
@@ -726,10 +725,8 @@ static int kirkwood_i2s_dev_probe(struct platform_device *pdev)
 
 	err = snd_soc_register_component(&pdev->dev, &kirkwood_soc_component,
 					 soc_dai, 2);
-	if (err) {
-		dev_err(&pdev->dev, "snd_soc_register_component failed\n");
+	if (err)
 		goto err_component;
-	}
 
 	kirkwood_i2s_init(priv);
 
-- 
2.43.0

