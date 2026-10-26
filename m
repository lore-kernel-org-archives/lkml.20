Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793012352;
	b=yu0CIxYMJVi3ifGT0G+Baya0p+953iKgRjv99L3B1w0BWn/QdEimrV29TivSxvCktS+C
	 0bXk4cR2hTDNZJ1MJM6msAKx8VwErwBN8nYfN+nt948IhngjrTYUHDnEKuLdKlkttrF0f
	 2VM0x906zYXl8l2WLipsQlRK+36dKMNMjfFwWEw2Cv5av4VPSPSkuTVW2gUIyVLhPytou
	 KUMGTWZA7KWKLhd6bxb0FySeQSO+2HLd1Wjg8YMfWvrCT4+zPrsKCJzJG7pWyyayO1RSs
	 Brjci92/9nwBs7Cfj68dxtd4v4zj4ruQozoUY4z7w+fz1G/T9oaCITAEyVwv5zkDM1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793012352;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Xo82AcSZWrE/b9eOjrvffmbQXg8vjut2UMUh3oGb+l0=;
	b=N7Zugtph/Tm64EIjNBSh5lADZL7S91t+R58RkaHGqbAEugy01rHxSmkq+p6XNdhfA7Rf
	 tjHHupEAN9UC9xqtxvjpjCX1Ct0gQsAVkFtjsjDz45T6P/wzTa4iARVIhX8NcXytCsL4H
	 ztG38tpLuZq0Ci9aPuZyhcj1ySp+b2yybtKwSe2RX+n7K5oZroxxVczd/k3Z/eNkXBcW8
	 ktQ+3EdDo3yHmFXdM2BkbHx34mu7zW88GJGjKPX08N+X4OOH3m9xbXQF37NVHv83gHCJX
	 KBFWmUVjWztu/s2+nr+LoPatNahO1fj8+y3J/qOhC6dsjtrOQZOHF9XuxSEW/4FTuqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Zvsnjup0;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03923606A322
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 10:59:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03923606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Zvsnjup0
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3a4b3ac8fb7so1453452a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 03:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793012351; x=1793617151; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xo82AcSZWrE/b9eOjrvffmbQXg8vjut2UMUh3oGb+l0=;
        b=Zvsnjup0mAmdkOLj6ijUoPAiRH4ZKyYWiZF0XYD0dcF4A98Td7TZ7P+cSMTjsD3Odg
         3u2rrhvCedJoD7iexWugaZb6Im8TRLbEod3/OO0jXJ7qebYqI4eOytfyYh0OPyYWdiCU
         spmnCzO37Erfw2XunlUFg8cQ5pE79cwTK5svkXWwyYvLFDjWX4vz6C6Y5/H0Ml6Uu7a+
         XKmX8U/jTcSg85aoFqElkxWjc0eOBGOJlwZLKIMh+BfWRjdAVdcOeu8oMHDNxqswg5hi
         VbwryJUjOqBxsiQo2Wr5ExeZnF+8PZb33rmsSNEF0nBg3IOgh17U2lOZtyDj8DtObk/P
         KDVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793012351; x=1793617151;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xo82AcSZWrE/b9eOjrvffmbQXg8vjut2UMUh3oGb+l0=;
        b=sAM1E6Cj2WaS8CRyHWBamQaDRyorQwevR2TOQkFlbUnt+kp0F/7GG3Ov9YWLATt1fr
         HYRPlTcQQ3eR7/xR4WAS+0XZTsciikz1a19ZL/pEVT8yt8PLM8RZDvDfHlxzFTtA3Zm3
         TAXBuOZcefiVkUU1S0WUDbk3xt+2K7GYykWREnSXUwOi2owbE41qURR3u+7CE2OyI3CC
         +Sn6IBK0Upwoxn4FIlLOjG64F0i9UutJnwwT0LXz2Q+9q8Z3z19RLUg4kyw8tklOsar4
         eG/MquqcH5lBQNpF9cMxs6g5wcM0carCvfRE7B27uQ+q2hJfW90dMu/QsR45EgK0j5k3
         LaXg==
X-Forwarded-Encrypted: i=1; AKwUvByNsOyd3qh6uFsY9wfjsAr1hRHlW+fubuTElL6CgmUtXyadNgDgKLGFnMkrXLfMZxkzhh/QERO2RoVII90=@vger.kernel.org
X-Gm-Message-State: AFq9FYLEqgZQ/jMbexJ/ItDH8pFH/vkRJ40J1Ou/Z2qp2M1w0gK/a6GO
	o+21Hulec88KEz1gFyUURY/0MVmGHEM5SL+vV03AGoL5+VaY11eRlTQZ
X-Gm-Gg: AYBFou351MAmuu9kP346C3rVAC2dDBWeiCtx/GBH1FAOj+mqVEGytwTio9T4OqBaHl5
	4Pq3BqANfYnS/lfN7hyVbgXMjoML6xKWThvXmDKMTSdZCEggROpu9Ulryv6kH1kankAFeUTim5I
	DDMu7ecJ4upxntpLhVurKsRdyIWro1z1/iI4/R+xcq/ow/turlmW39gN3hhmYe8r5m2N7AJw2AJ
	wKkigLn0tMHFcNpuPEhYOUbAK4kAkmhjhNoS3c97zUWdes1KQlIHxmGCyypL27Yc428gPtbxA8r
	rKv2rmwbA4pw3uYhg8qnGdwZguYnv3oA4nME8Zu0Eji1ChGvZGjKJuQFZi8mVOQQxONYK1vdPwO
	t815M1JzFWtwC3vf12SlKYBQJXt6aT71MFpR/reU6+BocIwd0GvJyAo6DeaJDMiK3hWZUFFK1aO
	R/dU2Lc8RiMbK3cGEjmGdGvBYg7R1R4X9dXrekOhS1Q203yFH0DQlVEkUXj9DJXyjSM6VZMEZW/
	6heJUydQs/vIuv1TrgVB42RkGuT9dyZIree66TavhaWXminGjainCNKij1RJyTyAd+decobBKeb
	cYg9DOSlstYripK1rQfpBBJXXuDJg098Go/2W1R4vvpb7+wXbT/G75ZdLshUNJ3evRnrO/w=
X-Received: by 2002:a17:90b:2552:b0:3ab:e588:c278 with SMTP id 98e67ed59e1d1-3adea9dab45mr5437389a91.17.1793012351413;
        Mon, 26 Oct 2026 03:59:11 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebadfa82sm7980768a91.8.2026.10.26.03.59.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 03:59:11 -0700 (PDT)
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
Subject: [PATCH 5/5] ASoC: kirkwood: kirkwood-i2s: Disable clocks in reverse order in remove()
Date: Mon, 26 Oct 2026 17:58:35 +0700
Message-ID: <20261026105835.19052-6-phucduc.bui@gmail.com>
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

Disable the internal clock before the external one in
kirkwood_i2s_dev_remove(), matching the reverse order of enabling and
the error path in kirkwood_i2s_dev_probe().

No functional change intended.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/kirkwood/kirkwood-i2s.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/kirkwood/kirkwood-i2s.c b/sound/soc/kirkwood/kirkwood-i2s.c
index cf6b96054b82..c26326b82c19 100644
--- a/sound/soc/kirkwood/kirkwood-i2s.c
+++ b/sound/soc/kirkwood/kirkwood-i2s.c
@@ -748,9 +748,9 @@ static void kirkwood_i2s_dev_remove(struct platform_device *pdev)
 	struct kirkwood_dma_data *priv = dev_get_drvdata(&pdev->dev);
 
 	snd_soc_unregister_component(&pdev->dev);
+	clk_disable_unprepare(priv->clk);
 	if (!IS_ERR(priv->extclk))
 		clk_disable_unprepare(priv->extclk);
-	clk_disable_unprepare(priv->clk);
 }
 
 #ifdef CONFIG_OF
-- 
2.43.0

