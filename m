Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 853E8427F85
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 06:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791959592; cv=none; b=g1voKtjCHPplmt+8pyvi+IYqtafd+T1DiYRt/MOV7SPtJoyczR7VU+KhjNunxpbaGLKOavp+9O6iq+iH9x3YXTjRSFps/WCmxmFvd+l5iTp0H7XG8kZxKNZPUH2qLvPjjBMJQigGK1pg5dGpWSajwv5K7OpfuYP+C+xoAF7DSyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791959592; c=relaxed/simple;
	bh=7bLsNLFv0BET3HGlyxG1JEhRxPCrckEkbWhieR5y9OU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=idbyrGtTbXJ2m6Gl46a4OBfmyNdOumefsIjTD9Jie3GAfPEtkQWHPn5+wWtawfMJ7RSwVgyCQgBzUSlsXr9rMmX2+Wg3LQ0lLj++P0HNrMYa9d9+8yyaJ4w2xOHhfmLBWvNasRmL1OvIoDY9MopfM5oRuqgs8j01wscWHTUyhHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n3F4xJi3; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n3F4xJi3"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cc4c02ddd62so282029a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 23:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791959581; x=1792564381; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a2ojX+iLeNHEewalV9Bv/DjQVM0k0JpOfvvYHz6MVRw=;
        b=n3F4xJi3lXWVht2gNsEmftbAR7xtWUVGHMwDU4UZnaqpxmJSh871S81S+FFq/EO7xL
         z2t7N+kfjJV2BJ/yPzQrVOU4p0CUJ9t8ucgmMmfqZjDuIH7n1K5HPGDgv5jO9L4kfUD9
         vkO1YExHqNxmEgDK7Qy/EG0rTGEaN4DPM5sULXdzVUYP3uMtH5oy6vdjRzytsTedCwiq
         wN9ULnescn5FbpKVr1Yhtu5iJq/SyU86GWof8wl0hnwJcMTPwQy3nfmPDpc1veyoD9oD
         +26xqkiFvT9BLRr7CgkgbVMLBkQaugg9v6Z0ZacqTb6MhEY+RDfSTIJLftvUmo+CBeJh
         3xEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791959581; x=1792564381;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=a2ojX+iLeNHEewalV9Bv/DjQVM0k0JpOfvvYHz6MVRw=;
        b=QRj9Owp4HvTD6YRbqdi0q6b9xn2bdTOrFDociY7i1YGgC1MifJ0Y5eyxV1ZY1mebR4
         yYoCt6mRjo3MDp/R78lV5CghiKBaLZBQLUazQm1uxHR3xeCxRsp3ErFzqewaT+m8QzMz
         a8ee/9AVIZIMHHRYVqn2BM7+cgw1673NeDIDsPdbslyrt3PVAb+dZ4rPDnMbNPlp2Rsn
         ZThxzefIkY3HqvwGrpqXXqxEMQGmPOfyKmWIR7RCvTxD7RtgleqYml3yDzzkmFzNmhPb
         1wQIV5/uSUSmdpkQEpLb0XAqm8qLIRbcLUVZR4GDc0gN2hk4D4pzYMfKJaZEqu5e/sns
         tSWw==
X-Forwarded-Encrypted: i=1; AKwUvBzJtQTHRIsz5GQDCC3bd4GwSy6PpIVgLc5eelLCGZEvtrAl9g4wZS4uMaV3OYUHpC+yYPlYCI8+YoPSm/4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLrPv0UjRT4bEG+ehfsrZpUkfOVoAyvEaNciSLbR/+c4Y1auZbV
	AvDBPLAlq6qsU/wB8KcNMxLIfmLCWjGQmtSmrDXxe62wFwEZzJNAhqk8
X-Gm-Gg: AYBFou2Z3RlWbw8zaaQB1jdiRbrLPR1BfHg0glL68qqQAN/CGxFc4TrcA2s2Vwek9xY
	DEWAwEQRDG2FiNHKYA6bx0E3KomansKtkJiHq+bi5O7MkM4/jwA144yWHTTAY2+WD6jqbDcgQ6/
	/U5n5C8CpDGXThBGl7iBIpG8+KvSAbOzw8tWMppPtLnHeISv1aJ0dbDU4GY9iWvjuEJHgIGYG8E
	xZC82bTzKvUdaeaPkVqrJO7T4RwR7W9uuwuINKikoHaeOZqnyOogqSYAzrHfSswivmfPKdItRux
	2c4kJ4GWSlkW4fMb10f+WU+wgPqvOX7dktzi8ba/5j91nJguMht9Iip2NZsEK7/0/XTNVYsXY8X
	TzJf7HnXsAwe21XICS5QqtZJdDf7eP2hgXN6MiQsOdwV+ERsmfqb1z5twRGPGK4fLccc1a5iSWa
	IKKHYcpQTaD6ztaLpvCkt20LYemv/Wj7DbXSiFFo85O6Uk1ztoUbtgl+bQmWRnjwyTg5lWgwac0
	x6JRvSomC0/Dov6QBYqUEQAg6KV7l1Y9n4KM/NxNZQChT/f42QB/+9mOtSFF1IbrQM32x+EJBc=
X-Received: by 2002:a17:90b:134c:b0:3a8:92a3:8baa with SMTP id 98e67ed59e1d1-3ab3a953bd3mr12388992a91.27.1791959581584;
        Tue, 13 Oct 2026 23:33:01 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac600a0619sm3384495a91.7.2026.10.13.23.32.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 23:33:01 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com,
	ckeepax@opensource.cirrus.com,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 06/13] ASoC: codecs: wm8985: Fix definition of ADC 128x Oversampling control
Date: Wed, 14 Oct 2026 15:32:33 +0900
Message-ID: <00ae032401aaad740b61d664c861b72d2e5ed520.1791959026.git.sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1791959026.git.sammiee5311@gmail.com>
References: <cover.1791959026.git.sammiee5311@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ADC 128x oversampling (ADCOSR128) is at bit 3 of ADC Control, not at
bit 8, which is the high pass filter enable (HPFEN).

Fixes: 6d6f8b832705 ("ASoC: WM8985: Initial driver")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
 sound/soc/codecs/wm8985.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8985.c b/sound/soc/codecs/wm8985.c
index 2a64d5a851da..f400f528321d 100644
--- a/sound/soc/codecs/wm8985.c
+++ b/sound/soc/codecs/wm8985.c
@@ -327,7 +327,7 @@ static const struct snd_kcontrol_new wm8985_common_snd_controls[] = {
 		8, 1, 0, pga_boost_tlv),
 
 	SOC_DOUBLE("ADC Inversion Switch", WM8985_ADC_CONTROL, 0, 1, 1, 0),
-	SOC_SINGLE("ADC 128x Oversampling Switch", WM8985_ADC_CONTROL, 8, 1, 0),
+	SOC_SINGLE("ADC 128x Oversampling Switch", WM8985_ADC_CONTROL, 3, 1, 0),
 
 	SOC_DOUBLE_R_TLV("Playback Volume", WM8985_LEFT_DAC_DIGITAL_VOL,
 		WM8985_RIGHT_DAC_DIGITAL_VOL, 0, 255, 0, dac_tlv),
-- 
2.43.0

