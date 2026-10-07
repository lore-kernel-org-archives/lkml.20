Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66F7E45563A
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 11:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791371413; cv=none; b=q4d9BSeRClRV4MoZOxDN02c3JNoMlnQah6UAlpG59n4M1Syc6s6vNcUxMlu/HIU0tk5kwlS1LWy2jxNP7BQKx24j3LDL6EcH5YtA4MpQPOx5E3PC+VH+eg/DZgCGjAO4ITX+0kY4n9tW/zPwHnRuop62E0rWyMhfhLejCHej8Go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791371413; c=relaxed/simple;
	bh=IPLilhdcPz0Rw1KffNK3T7TwDRffmKz0tzBAuXq8ebA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qvpnjjfRqhKu4L/xoQk/lJ6lDbhiPtxoxokoEY9rkeag7saXXnW7x4Hv6GNqhIaDtm+jhDaDYUkNnDfczJz5q4xyhVUYdUh7fFlBk4Gm9xULUTnKVWHzWezycA2zHCYKSPlt8LXhEosEWxYfZd2WWfBNbtQ3AIfURETAykdvBiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ed1gVfFx; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ed1gVfFx"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-ca766c1c9ccso731247a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 04:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791371395; x=1791976195; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0f/MTd/p24/UUitH2lVkrRpF3QAUdU24FyYEOQgmlyU=;
        b=ed1gVfFx/iZDQohOt8vmgpE0QeSJy4AZmEQB66iOmSMI/Aj7XMq8yCtdMkLqPx3BhN
         kX4s+IflMwXUiY/+TC+ovvyzQlvp3Bgf5WtW4Q16+qPTQcl152go18AnTvV0ujpIhITj
         FvQIsAkjoa592m6db7sU9NY4YeA+Xa/SGtAvHBXvc/QbLJJMYxNYK8A03VIatmWgHOOh
         OJV9BpB2UyQZ1ywy5EN5T5ngBr1R4TwJMMIzFp7dyw3QMy4edUUApS4sNoLeE1InlcTX
         PnB1CsQk0f5ERqUDfN0hKAmst0ek1dhK4unjW6JyP84qPsw1mLpW6pcrfqP5fctfcZKf
         L0kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791371395; x=1791976195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0f/MTd/p24/UUitH2lVkrRpF3QAUdU24FyYEOQgmlyU=;
        b=rBRJEoJxFTZ3o7QbLATJkXUO9P3wYu84rIFvsCS2gOf3sDro4iGSEHaxgz9xczV6rp
         R7XFNoTz/2iGveExR84xe9VJWtSr164+46CE6yI3a3Rd+Sm3TJCLC72aW+z2JSKnSg/A
         OM1CyxZoxpYJbO+vIdSb5lq0u9T4uGMtMFKWg2B/4MUzqzJbTrrNlSsbeb7TptCm81dE
         YsxaKdGMiHU55QTYexKpOHazlD4kHAgLjPVA9O8uYbtWrkQv7zCAExMU8CouYkYYxsGP
         o5tFaPXb9+shS+uxja1ZJXMaBCSlkEYX3pTloW/wMyVh+pmlb/FnRviBQk4q2VwpGexy
         0IcA==
X-Forwarded-Encrypted: i=1; AKwUvBz7BZC4m0PCU3kSAMhnUa129ixaCXFpwzYrZLirXupRB2ifS0aDZSSAF4rdJoCfIl3mLH9Adyp6fACugM4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLfZFNcxTMeXv6zjD45l9x2Bd9frLnPv6Z5Ly2kVtSyArsYI6hF
	WAMIpyEp/cK0GTrSJazBWS6aAzZtDGUqt0njVTapYmAJxrRVYPrFumpX
X-Gm-Gg: AYBFou2Gvz65moCyVntcugKyZ9wEN43Y/lUIzehF6WGweNz4Xdb923rPeOOpzHJ08Vk
	/S0zqM1EsVO4wvf8ZSzBfcF5ZEkvtnPXGk7VWah/dEJAqZOlY2ESvwXdrvpGv6nLgv4zDqqxoRo
	6ia3FlXkahlSzA4jMXw9AOW0ZsqQnyvVLUl1nbt9dUJjbU/kOlBlW2FqRBQ5KFiwYd7d0n7K7H8
	mIj/cajvfeYrNISP9LgFPqWxTf5OLYREdWd6cPM/uJ4G/Vc0NhFcN76mR+VywfDa3Xw8X9Uxdw/
	5C7b3HqCbmvOmizw/dzxB6ewhiNqVDbL+8YB3FUQIowUr51FjRsb35RVSqzTPaV5inEtShWXot/
	m58TWHbq/7foxHCTkBPcbgzH7gzHwgk6nPIZJRQnNPlukTrWi4CqXxCTU2FlnseibH6kZ75Iscn
	/IoKuypn+8/v5nWrtrthe9NWivSu6i/nO/ZBLPzuMxaeWvBXCoJYIdmlko1cr72XPk8EgIh5h2N
	LJ8wOuygqPjnPjYq+QuO+oPQCgGIrI3deqNN5NVnRlRPdFS4HRnkxpQhu13n6mRrOWcI+ceQWw0
	PW9o2J6uVZcWr0I=
X-Received: by 2002:a17:90b:37d0:b0:3a8:5d57:a5eb with SMTP id 98e67ed59e1d1-3a8a19478d4mr1407044a91.15.1791371395353;
        Wed, 07 Oct 2026 04:09:55 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a8a5ec70dbsm1328745a91.2.2026.10.07.04.09.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 04:09:55 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Trevor Wu <trevor.wu@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	cassiogabrielcontato@gmail.com,
	Haotian Zhang <vulab@iscas.ac.cn>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Tuo Li <islituo@gmail.com>,
	Rosen Penev <rosenp@gmail.com>,
	Garlic Tseng <garlic.tseng@mediatek.com>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	Dan Carpenter <error27@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 3/4] ASoC: mediatek: mt8189: Handle constraint return value in FE startup
Date: Wed,  7 Oct 2026 18:08:57 +0700
Message-ID: <20261007110858.509341-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261007110858.509341-1-phucduc.bui@gmail.com>
References: <20261007110858.509341-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

snd_pcm_hw_constraint_integer() may return 1, which is then returned
from mt8189_fe_startup(). ASoC only treats 0 as success when marking
the DAI as started, so .shutdown() can be skipped on rollback.

Return 0 explicitly on success.

Fixes: 7eb153585598 ("ASoC: mediatek: mt8189: add platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8189/mt8189-afe-pcm.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c b/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
index c0f340a6cc09..eefa96b701a5 100644
--- a/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
+++ b/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
@@ -155,8 +155,10 @@ static int mt8189_fe_startup(struct snd_pcm_substream *substream,
 
 	ret = snd_pcm_hw_constraint_integer(runtime,
 					    SNDRV_PCM_HW_PARAM_PERIODS);
-	if (ret < 0)
+	if (ret < 0) {
 		dev_warn(afe->dev, "snd_pcm_hw_constraint_integer failed\n");
+		return ret;
+	}
 
 	/* dynamic allocate irq to memif */
 	if (memif->irq_usage < 0) {
@@ -168,11 +170,11 @@ static int mt8189_fe_startup(struct snd_pcm_substream *substream,
 		} else {
 			dev_err(afe->dev, "%s() error: no more asys irq\n",
 				__func__);
-			ret = -EBUSY;
+			return -EBUSY;
 		}
 	}
 
-	return ret;
+	return 0;
 }
 
 static void mt8189_fe_shutdown(struct snd_pcm_substream *substream,
-- 
2.43.0

