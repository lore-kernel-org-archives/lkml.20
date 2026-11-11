Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794391608;
	b=Sl8ilqHf2w3XSrg6WeqzDyMfuO8elaQd/IhYu3Ah2Ss9fLrbRR1FE4VzVp+mmYQb4w+F
	 vkJpeKzAS++xq/lAmWvtHnJVQ0KV/ODQW3REic/amQO2YjqBxvESDM4zzmNmVUhMLnbaa
	 Egha9D481UXlYoPbfzx+g1kIBl/yN2m8tHKgSO4v7S9t0C+3LQI3mipg8yWg/lX1jnmEW
	 U4rDlSr1qCn6QPQWkW1OtcqXLpg9B03Ma9+ArO/cAvBQ4Gz1fIrNbp5oZj79CQJ4UZmki
	 g1DJQspFoiPQsdFRakBwAgIiaTMBTTelxvRfvgE8/gzkNSA7FMV9kM9J5kEH4qfsokA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794391608;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=3fdl99wflmpgOQFz3rP4SGWHHNVvKJz4CW8AnVydfWM=;
	b=kRqbrlbYm1xmZdqFd+YGHzYVJBwxBK3BfnUsQy+jhykmF7jMHWSUBiAf4FCbKpDkkFKc
	 Ihtt35pWnOImXr2Okgcr1zsK4/SgZjdmV9ztUtmtLwNxJ6Hp9njLtAYFpngmPkWcDerF/
	 mxNFf47bQNwrl/10LXK4tOD5wlk9lz2kgW4xaH/mTuTrTnqJtWNynghiuSgqYj1vyNZcP
	 nRIugVu8WmfEzrUGNEU5KT2UP/tYPGzS5DbnsQFtTGao2YRwg/EQkAN1Mklvkwcji/TSI
	 oPGI1+h2/aItp8lnc9Of/NwuTeEVGzu9/bBMyJOLe6mPVlBfAvT+G0NxIUdkFoKQmKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uYvMDd0G;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D421606A33C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 10:06:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D421606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uYvMDd0G
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso6184273eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 02:06:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794391607; x=1794996407; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3fdl99wflmpgOQFz3rP4SGWHHNVvKJz4CW8AnVydfWM=;
        b=uYvMDd0GBsLTJHSnn2sYsMI5EGdcAiHlXmubqKa5UygquPqeJK6AoV3mZBCHyHIOg2
         soJaqSZuvFHSTdApDLhyJyQD4GERLNl/rqZOiRr3Y521GEPTIiM2fA1iVIDVAOBio4Sc
         N6gqfVHMBlfJKPIIcPLeFQxwqqFi9UXrKBQZFDbJVAV39T5LVJcdrELXOhmK+9HJBglr
         6i4U0V64dzCYJEFSdmOvD4bORXbGz2+922lGKvoDIdNqjUOX33sF0w8fENU4Cs+p+YBL
         RxVlW6LV97+n9wY2P1e9GhrGmMi52NrI9LRR1WdeZ+lDK3YinwpQccrNW3g5MOkMZRw0
         q0Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794391607; x=1794996407;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3fdl99wflmpgOQFz3rP4SGWHHNVvKJz4CW8AnVydfWM=;
        b=rTh4lnxadSyrZzncxjKTZSkgQbNxlsjGIXXDvl/d9hUfV9l9UWIkX9AJzPsOyWYjgk
         UABllfSsGAC26RmEI1dFc4q+Pqlm7vSsAL9BNYFk3A6MqOHiV4Mk6V0K2ELSoB0j3NBr
         kbaXNMCzm+nEsOH5RKiq9c0HkeVPB1A7GA3QBbJJkg0p0mbi/eFFqZQApXYZSII7PQD0
         zIdEhbcze+sQJNDTNptnn8AHAt9HE+SYwcA4Dhre4BMPTpR+Dgkv0dj6XfbHn9tnoLxD
         FBrBl2d9lQZnnCVWW1UHDY6n3Mymz7Tc3hneEO308rpTGveyiEsutwTHGM0DE/zuO4Xg
         BIgA==
X-Forwarded-Encrypted: i=1; AL+hErFkGVZbr4LhYJSYUBvCNyxPoCeTXZMNZhBe42Q8ugz8BK6uNOk8BQJ3of35xeVifSFkU3X2kqrr74d9940=@vger.kernel.org
X-Gm-Message-State: APuU4Z9eHeFLrCrNV4r+wbqLPYwQMRh1544xT/Cwk2QJkEr9k1tIt4dV
	hzWJr/Jtzhe3flujoiIeHnIMTAGQwcNjruodAT8AZnK20bV2oeripLe1
X-Gm-Gg: AYBFou2f45+j7PJvOp7AByRiR3k5hr9Er5O+kjfnKuE8pe1q+bHzSQFW0BwdpbfNr1Y
	iI5yFty6q9zSekXwb6lUVPGJwBe4wR4lnsjze3WHA2zhnjkYKzgLqqF4be9nh25o3VuIiy+eWRl
	Zs2vbgUVAHYUKsy57TplMkrZKGahsvaaP4vE/B8y5hfXDkeyMfF3+CVI515+eTsgSJWbRZpsk2o
	vcqrm7zNkumVP3+mvlsFNWIC6LEjlH/CZrT8Z7LOdMcse6GnB40QDVXA0LTiBqssHVJW9Mh4Tgs
	mb8vuQ1FL0Wau9oa7RcxJ33IkqARhjzrl9JCdWTOBsxp+KCjKZW3uL9rSUnHBz0kwvxQ2cIEzpy
	ESusMtMxGvHaeNQY4EcYZD2JLLFztlXJuiEKevyjdh0ZLJMH5AuBz2pmChwAPaOOiLe2tp1fZw/
	S2W3OLmPICinfv4QswWo4JcRxZiKXgUQBaLc7bT+QW5V0j56ESMb8KSwD3he3Hi6LU7hIu/4Il4
	+e5+yZMaKzbzGL0jRUtswuaaELbCam3um1sqwuVaNGDhkeDmJmy+ujeAp5J+FKTdxE0HeshyMq2
	yahgzeh5U9aLG3qPIrdsXm2+rf6/Udjf97parWjx0wq20s66BVAYHP3qN4GI5HvPbv53pE1m7ZY
	u109DhHyweZ0CECi+OG3ZX5dJPO2af0MkULIK8LEA2t+N
X-Received: by 2002:a05:701b:4301:b0:1a9:cad6:5b58 with SMTP id a92af1059eb24-1b3c0362b3cmr1960965c88.39.1794391607537;
        Wed, 11 Nov 2026 02:06:47 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5890584sm15778025c88.3.2026.11.11.02.06.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 02:06:47 -0800 (PST)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrei Simion <andrei.simion@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 2/2] ASoC: atmel-i2s: Fix I2SC_WS slot width configuration
Date: Wed, 11 Nov 2026 17:06:16 +0700
Message-ID: <20261111100616.31211-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111100616.31211-1-phucduc.bui@gmail.com>
References: <20261111100616.31211-1-phucduc.bui@gmail.com>
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

The atmel_i2s_hw_params() function configures the PCM formats
S18_3LE, S20_3LE and S24_3LE, which require a 24-bit I2SC_WS
slot width.

However, ATMEL_I2SC_MR_IWS is missing from the mask passed to
regmap_update_bits() when updating ATMEL_I2SC_MR. As a result,
the IWS bit is never updated, potentially leaving the slot width
at 32 bits.

Add ATMEL_I2SC_MR_IWS to the mask to ensure the slot width is
configured correctly.

Fixes: 3b7961a326f8 ("ASoC: atmel-i2s: Fix usage of capture and playback at the same time")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/atmel/atmel-i2s.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/atmel/atmel-i2s.c b/sound/soc/atmel/atmel-i2s.c
index 60e885980f4c..d23ac43590d8 100644
--- a/sound/soc/atmel/atmel-i2s.c
+++ b/sound/soc/atmel/atmel-i2s.c
@@ -329,7 +329,7 @@ static int atmel_i2s_hw_params(struct snd_pcm_substream *substream,
 	int ret;
 
 	mr_mask = ATMEL_I2SC_MR_FORMAT_MASK | ATMEL_I2SC_MR_MODE_MASK |
-		ATMEL_I2SC_MR_DATALENGTH_MASK;
+		  ATMEL_I2SC_MR_DATALENGTH_MASK | ATMEL_I2SC_MR_IWS;
 	if (is_playback)
 		mr_mask |= ATMEL_I2SC_MR_TXMONO;
 	else
-- 
2.43.0

