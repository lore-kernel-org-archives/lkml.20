Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 049DE4FD794
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 13:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789738831; cv=none; b=bnnSaKahlKMR+tgQdVmpEt1u3xvtnlV5j4ekxj1D4Sdb/YVYGnhEudp2QUYll0N7f2HXia7KroQW5WmN4freSJZ1Ou3HS/zZJ4zuYPJVYQXENcUJkZ3dSWr8pZ1ksPltvaTYxTpGuRhcpFvAUvLN+kzvK6Y6Q0dxLYF00ZiaBAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789738831; c=relaxed/simple;
	bh=Yy+a2QIzttLzB4xrbb9+hlL2vQihJOKUyGFWwX/pyo0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=foHXdlE57iT+uCfi9vs12e8AQbVEnAOTgl32Ue5HGXc9Srp154P+Tcqoc/vZwaoL5jjtqczHulEO8Ce9qwRbRuJQ1fx3qTv6CClBrrVjkavlQkKfCWLq/jPjrXXfLkLKQV64Pl5Co34ld+Z92eyNd8mjy/oWclGEOpsrNxfA7jM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mldn/JzH; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mldn/JzH"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-39b9184fa80so735734a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 06:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789738829; x=1790343629; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1yYuhRQnt/ijyPiiXvVWhWtV+eciNeujLBpVlIUSi5E=;
        b=Mldn/JzHLZTQ1j5AdfCQ/eoik+79+b+6mJMsuJlCPX4zv2KUJqRDPTHAtxklEa3ICq
         8c1ccLCadNHFyvqXddawhw7ed8Zy/dX2VLLK4v2GfMUpW+jUcUA2YPY9kQhZ+FTw3cgP
         rZer5ngz8lkR+BA2roivgRIUB2GoirBwf0DgAT/vnE2YH7RaWKl7Og2S2vsnuw6+K0VS
         oPHvOLMFMQxMROJLvfHZ46wGNQgALgFrCBC3pCWg54uDyS48VVChSpA8eQ4BwAdP0lkm
         Za7qBJ2POkijl2AMFs6WsxBNEVtR2u91wYsU19lce1yK8FAnxk92RGFWktQwBN6ZitVe
         5u9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789738829; x=1790343629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1yYuhRQnt/ijyPiiXvVWhWtV+eciNeujLBpVlIUSi5E=;
        b=hb1FAfm23+SrBhzlbQ91KDomSkeEZIe72emh08UXTjY48cDuyegNOvhE2goHx7nDtK
         l1cWC3hLT+gFM2uI1QM8yAJws19YUejcF3YC1+pjCRzpoJbiTHcIkt7jrhgOAD8CwWMi
         b/iOOOkGmJxGeeTtcFxkpciqzpGnnPUn9LQDyC/H4/Tk7L3kHpL9zenCUMFDakyxzgFN
         rg4wzjz4a5vmCh82VRYgHI7z+7vgfVLts2eyIQWSki1O9thV3YaDgRUDgWwrN1eHpLU7
         Lu7/drLQ2F3RvfdRJpqbQ2XGeeA77Vm5QGgLGHePuM3f7D8hqZvEYRJPN3bNOdQI+9rl
         l4Qg==
X-Forwarded-Encrypted: i=1; AKwUvBzkP2IUijbTr4hiXFuaMQr1z77I8pKaWy5UQrbvQm8d07T8/3KRy8aWYzo/7/K7ZfUKAjVWRvzXvPjMTyk=@vger.kernel.org
X-Gm-Message-State: AFuF++nCgnFdWdqVzXKgV7vGfGWU62vJR506mXj6IpQh1jY+gCjO4g/j
	cgebxp+zbw3ftSJPvJbpHng9gHY4Vnlze7Z23O5L0CJt/lero2d+J5ak
X-Gm-Gg: AYBFou3nfGd1B24aA8Q68hRGEnyn8b3ov+j3oG7+D0bfM+ax1d+NhWDF1qQbGBgArKK
	o7P3u+CuuQZiHCZW6DYYl9KCzZMG1GPBNynVlBcFcc8aysIb27Ng+pZKw8+NqFIoOWFUSGScNgz
	hLKEsY8RMiG3vBwqzHljR6yafVEJpECNb1dzhNzQsfMBuRYfRs30XBWslIDATe4dIbRQfIzte6A
	QOShbyVLUYNX75GPifCMD7FT9exPnbBnWmDHzWufpovK0SEuk34dQtB8HOCiDnrP2Wso7llhrMS
	89NbmAp/NpJ1ZFLlhY23xioeOU8Rvqd7zrHp4xh5HRaJQx7nH7ZiOB+G4ut4061FcQ+HfSjII2M
	xqbsEsBGchHRsReBBYltON2FWlVRJUWyhStc0+Ipa/1M+4a8bKTDGGMVsSaDoMZk2q3m4/+R7g4
	uL2iyJTRoMWvUkbGgAc77aNnuOZQOsqYxRyE+wPbUGxI0EoCx/kpdPESzNhjCrxGFS9CtjYowMV
	tYlJXR13mXIr/+f5REJmS7LZYICN3193ASp03XWkcyPJoYConOW82a1O3i9BYTG2AR47JGoBsD4
	jeX+rXw67HMPCA==
X-Received: by 2002:a17:90a:d005:b0:39d:ba21:fd90 with SMTP id 98e67ed59e1d1-39e54f2bf77mr10812405a91.16.1789738825626;
        Fri, 18 Sep 2026 06:40:25 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e3617443asm13253792a91.9.2026.09.18.06.40.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 06:40:25 -0700 (PDT)
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
Subject: [PATCH 09/15] ASoC: mediatek: mt8192: check return values in mt8192_afe_gpio_init()
Date: Fri, 18 Sep 2026 20:39:05 +0700
Message-ID: <20260918133912.133799-10-phucduc.bui@gmail.com>
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

Currently, mt8192_afe_gpio_init() ignores the return values of
mt8192_afe_gpio_select() and mt8192_afe_gpio_request(). If configuring
GPIO states or requesting GPIOs fails during initialization, the function
still proceeds and returns 0, masking the initialization failure.

Fix this by checking and propagating the return values properly.

Fixes: 125ab5d588b0 ("ASoC: mediatek: mt8192: add platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8192/mt8192-afe-gpio.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/sound/soc/mediatek/mt8192/mt8192-afe-gpio.c b/sound/soc/mediatek/mt8192/mt8192-afe-gpio.c
index d4218f9708f7..d2e99c55b8c6 100644
--- a/sound/soc/mediatek/mt8192/mt8192-afe-gpio.c
+++ b/sound/soc/mediatek/mt8192/mt8192-afe-gpio.c
@@ -147,13 +147,17 @@ int mt8192_afe_gpio_init(struct device *dev)
 		}
 	}
 
-	mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_CLK_MOSI_ON);
+	ret = mt8192_afe_gpio_select(dev, MT8192_AFE_GPIO_CLK_MOSI_ON);
+	if (ret)
+		return ret;
 
 	/* gpio status init */
-	mt8192_afe_gpio_request(dev, false, MT8192_DAI_ADDA, 0);
-	mt8192_afe_gpio_request(dev, false, MT8192_DAI_ADDA, 1);
+	ret = mt8192_afe_gpio_request(dev, false, MT8192_DAI_ADDA, 0);
+	if (ret)
+		return ret;
+	ret = mt8192_afe_gpio_request(dev, false, MT8192_DAI_ADDA, 1);
 
-	return 0;
+	return ret;
 }
 EXPORT_SYMBOL(mt8192_afe_gpio_init);
 
-- 
2.43.0

