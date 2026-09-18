Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E731F51589C
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 13:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789738837; cv=none; b=HkLwwbv0ajb6n4eE1kUJ9WlxZEpwCtPIXYkc7CzC9yz3uO/RVqyUEbTEEF2oYFESCaxBQFzlpCu6yqUZLCc9xrE2kN/6cZPk1SelWxOK22ZhnTGf8tDmDw5bcJVDI5VAeogj7jE+qQAnyhkRRkCSq1ACdGQjEfhd23nRV2ItW6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789738837; c=relaxed/simple;
	bh=EO7Wt7DOU6+nQY6d+/v2RqUj0DHr7rPGEWnPMEK1hsw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A92HLBrr3Q0psFNiXLbgi/bJo/hrzeme0Irk9dSmqJ7PsGxqlFsSjDyDfXVSBtXZRLH/IUZMYEJWahCXeJ78jSkY7Bt5d+4gORSTq65b66qkAmUtr4jSLKLZQ/rqSBMX9pUtNS/wo0DFsip03V5u/pPS1REURHwy4ICDVQcyxA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WYrZQjjf; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WYrZQjjf"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccd4f99cso800776a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 06:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789738835; x=1790343635; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=skaVQas2esAm6HNfYY4sXBxMDL3EKxsTuH/rubWzjqw=;
        b=WYrZQjjfcZhpBt3rijee5S2O7439f+28+BRBSEKAecsRRai6tAympcW7h3fNbqc58d
         pzy18wPubQWzKzkb2J6vhTXRcZvxQ50mJaI+4Uu/r6Tn+X/l/G3laKFlA7d+pxCEFQf0
         fCagfAI0g2UoHMSgzyfeuYp4/FIPD7JqNqchhfqPJNG2cjRoff54YT2ZBc0a9PyGqp1H
         q0RpyjcT9MISkryZJh/SUoiOqh7PjEuAt+aFQ2F7hV3aFPD4mgjAI+fJFG+y6OTND8AM
         WB7HFjl9eFDjWbp7didRN6BZF7xYLFLJ0vysbyZVmpi+1V9zqaQxLLlcfyBqQDCWH/QX
         5WLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789738835; x=1790343635;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=skaVQas2esAm6HNfYY4sXBxMDL3EKxsTuH/rubWzjqw=;
        b=i4RJ492MEQKV2kYL2ARRZQjlopigK3ceSGukBrvdqqX9VP4GMiX50k7s7/0xchnY2+
         oG71kOfg0he0dBzbN/KAVSNdvvfX5Xmlu+0fBtDbcKA6K/KkNXI3weNkMyOhbO10usVo
         CJt6dQePQjBpw16S22fngp/uPPHn6Lqa54C8nqd3ZlRzweKAQVTxa2Zz1Ad/YWArldlY
         i76M0oZ2Ri/xayiFtwp1Q5IeOTnPOuqdrkjPbHpTf0UFq4kxDyV/qGGI3ClU6uIBywmB
         +dcd4AdUP/k5Sn0IQz5ZmW0Vgwqp6CxolM6odwBvT2WqeSY74izcqbF1U5jNkv9J5Ca5
         MpCg==
X-Forwarded-Encrypted: i=1; AKwUvBwr0u1s0UJNKH3T0AOaAzwxRxRRdp/e60+audrzxdyEROYvKMS6iEYv7kX9ITfNKZ3QnAhCwgeYYxGoZto=@vger.kernel.org
X-Gm-Message-State: AFuF++kpd/1Ch7GFYhoMnJ7+6bdn9cJso+/u7GGrT9yJT4ma2dH9tgoU
	V+BROr1m/Cgu4WVofe3DI0O2BJOxKjCZwtPMGLk4zHWla0B602r9/MX8
X-Gm-Gg: AYBFou1KvnXu0OjiFfutdslqwnDcFnfmv1FJIrmYFHfyVQAwtN24s9tcWGWvYhUkdEf
	lrPDAnWddzN2Blr6Az3IMXUTSckkOKd6MpjNWEGauBwpKQEV/vImVIcdYz+hNc+QfhdZJC5mHoe
	Pzslj2v44qJjj0wnIwB3Sms3mXOQ28m5qfO/M5pHCzgNSzrO3wp+GsNlRCps6adBlXJWzLQGjy8
	Q4pC9Yfdttt0p5lm0JWGkpagjpg1EBSsrl3Rq282xz19vh4l8Bb3clTJBF4CSE0nRUhffdfGNGc
	E6WiBcSQVpGCzVn/vln0Ec70Bt9dFPPwKpW8dJS/N+i7d1WPbW7ly3qpltIuRZct2tUL3K/eS0D
	fYugExy8+LrRqTXF8aUiJX52ZE7ThjTNsItIXhbou78k7zD0zUw89OkG21kqWNQt5UVADMDp2rv
	YOC07tnJRzQ0L0wgWUu6668ncmC3eQUfwwmoA059zCZAWWY4K+iNUAtLoBL2mjBxLecDXY1D+E9
	39NTuLEYGjkTq21pbXD/jIaj6lN+484dk7Ie0IeWXVoeebdIpWAgTNsdcWDRYIY2+LsSTsnANGz
	nd69FSRc/hiXovTxEBlk/vqUdQ==
X-Received: by 2002:a17:90b:17c5:b0:39e:1633:d29e with SMTP id 98e67ed59e1d1-39e54cc6ef6mr6089597a91.5.1789738835185;
        Fri, 18 Sep 2026 06:40:35 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e3617443asm13253792a91.9.2026.09.18.06.40.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 06:40:34 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	cassiogabrielcontato@gmail.com,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 11/15] ASoC: mediatek: mt8192: Remove redundant error message
Date: Fri, 18 Sep 2026 20:39:07 +0700
Message-ID: <20260918133912.133799-12-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260918133912.133799-1-phucduc.bui@gmail.com>
References: <20260918133912.133799-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

The errors handled here are already reported by the called functions,
either directly or deeper in the call chain. Therefore, the additional
dev_err() and dev_err_probe() call is redundant and can be removed.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8192/mt8192-afe-pcm.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c b/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c
index 5aaff5bebfb6..45addf9f3790 100644
--- a/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c
+++ b/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c
@@ -2192,10 +2192,8 @@ static int mt8192_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	/* init audio related clock */
 	ret = mt8192_init_clock(afe);
-	if (ret) {
-		dev_err(dev, "init clock error\n");
+	if (ret)
 		return ret;
-	}
 
 	/* reset controller to reset audio regs before regmap cache */
 	rstc = devm_reset_control_get_exclusive(dev, "audiosys");
@@ -2271,7 +2269,7 @@ static int mt8192_afe_pcm_dev_probe(struct platform_device *pdev)
 	ret = devm_request_irq(dev, irq_id, mt8192_afe_irq_handler,
 			       IRQF_TRIGGER_NONE, "asys-isr", (void *)afe);
 	if (ret)
-		return dev_err_probe(dev, ret, "could not request_irq for Afe_ISR_Handle\n");
+		return ret;
 
 	/* init sub_dais */
 	INIT_LIST_HEAD(&afe->sub_dais);
-- 
2.43.0

