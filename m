Received: from mail-pj2-f16.google.com (mail-pj2-f16.google.com [74.125.227.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18B16513570
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 13:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789738832; cv=none; b=Cg5wIlUtLQ6rm8Dyl7La0QJwo5WPRWnxAhvJNvK4oA0+/ro1I7e/BpSK3AOlDjjCuSJ9WGASpkMdg+v2Nxh4YOpAcD6T1mv14NJPZ246q9hL0xl7l6t2fOMHhpw7UgmRCoJY/BQDCDL2zvGW/GoHszXv+SAdhf4PeCitJ70ffFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789738832; c=relaxed/simple;
	bh=TK4GwSqVSypRNEvyHlH/Z4mogXq1weHNEeLJ8TY7A+A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CjhpSKK4Z5F8fvGIvOMMyzVQEmP2DCDCA4Pd106+GbSAGL0Dr9ymDNUt9Wnmm89T1l94xKEvd1txPF2SEnHgKsL0N6GPCEOsbRf2LnTF/yeJAySv0n8vC2fNz0ANFLcINJEJN1+nVFO+0c/dh4E1INpPUsrr1qG5lbZ1fZ9ekkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dmwTAPeK; arc=none smtp.client-ip=74.125.227.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dmwTAPeK"
Received: by mail-pj2-f16.google.com with SMTP id 98e67ed59e1d1-396ccd78e6eso245427a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 06:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789738830; x=1790343630; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6IqpjYfx/a4AJRpAQpXk9jWJIkdnAOStvdzRpJSsoaA=;
        b=dmwTAPeKlMiphPge+gs2lC/Uah8BFhr3JMWBtwqy/tLALHGAWqZuBy7Vx/5wbGa8VV
         IhV7G9eOMLCKAuzT3rJ8bqJsX8WeiSsn08pUgBC/DBSbANQczhIaTxlLaspVOW5yAd3d
         Pd8OH9gPbmHgkiVW+o0Lq1kIvcPgOEEEmoaQVuLAyLSpaLDmcTj82KFfMN8Zur7fAy9R
         DzdpYA65mCedkKoq263H1zfxOS61j8Ebn8i+8PuxYVgQ63/tZ4q9LTDvC+2jsK0E9aqS
         WNt41ZcBQDSntrRxs0gWXf9Kn/dmyf0boFyUEQVd/gCpxSrUbfawduTOILse6SEfiuTa
         P+vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789738830; x=1790343630;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6IqpjYfx/a4AJRpAQpXk9jWJIkdnAOStvdzRpJSsoaA=;
        b=XzjpmO0YqTqtdoUVM6izYX2/G5g5ThqcVkVEfD4skx149CEXkRFq9MEVDHQ4nOvKuP
         f2jEXdBtEJaVC71sr3NYv6hJXp7SH7jAz/4k10Eqg24hDRAhgWkkJKxO7ujon9ahh6Hq
         HWv4J035NsqK97uHTJXXZ2gUf6pb19D9PFdN83L1fwt0H77QdDlAiv5lVb0e4O16i8n/
         WXQmcu5ScLRVOg1j3jWif6nVxpOIPFjncio1jD+L4BZgobS1e5N1Ufm0shU0lmeC+cxZ
         1hzr2Vrg+0pxyYfVZZM2fyfr3rbPFVx2V7h/pQ5t33WAIrt9EeS9pXwOHzGkHxBnA7AW
         7MvQ==
X-Forwarded-Encrypted: i=1; AKwUvBzGJoBYuY2eyyIWzjC3p0uwkVteksxGA370dYLtoQ09HYJVJkahJ3Httx2uSPTHTdWw/5iKR0YboSHq5/E=@vger.kernel.org
X-Gm-Message-State: AFuF++mPfSbc07qcOeh2vWJqDDy6P27Lzunqx/GR1TegHOCmRzko5vRn
	DjFmZFjDvfWoF5aEHu1+zukqwgBXacIFk+34WdjzjOc59yc6YtSFKhhK
X-Gm-Gg: AYBFou3FT9iI+iLctkzaQEF2kGR+Xz4ccJXjtBMZB78u3TBkhVdplt8WY24KPATDqex
	/gVjDOKMqavh5gHJqO6804fcArQaGjvrDSBEcnBV4jospQviTqo06nDP4bTau9NggRNgF9onHrZ
	zNS3tKo5ANyEseFCoH/USYuyF543vf0xgl4eKjcK/jwc8anyufsIzE1B7qnSDpJD7Q3gwiOcQjd
	BZZh2Y6HWXZWdW/CjxuWa4Maw/I+5jyXFU4RXt4D8KEuIztcigegUEIfzryb1Mha7IZNgYuaber
	WH/e3tUgR/tr7HSCWmeb7fwzvnztBn+yrhw3oQ2DdOw5ttHuRQ9f+rueZJ3I9NFFcMLz3E9b/v0
	h9M02nUtXgvmOoThSnWKDA9ysEPASNEO3yi4Z3eFo1uqnlrzQJ7f0HfXUUesM/G9V3ID7FwkM5n
	pKYfIiiwW5JiQrsKjs2BbIBBCO+wuPvl7Wo0Ke6H95W6KkxU8V/PWLG5ohby3HwgtokKIfrXrLf
	g33PUVQc3bqmXQJBEAYutuUEKLABB23uXA3DJGOYFx+flk2R77yjpWxFD0fc3DA/joNb7zT0GIY
	e3eXJF6ZfUUhDA==
X-Received: by 2002:a17:90b:3e47:b0:39e:4c7e:bc7 with SMTP id 98e67ed59e1d1-39e55738568mr3739571a91.21.1789738830398;
        Fri, 18 Sep 2026 06:40:30 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e3617443asm13253792a91.9.2026.09.18.06.40.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 06:40:30 -0700 (PDT)
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
Subject: [PATCH 10/15] ASoC: mediatek: mt8192: Handle regcache_sync() failure in runtime resume
Date: Fri, 18 Sep 2026 20:39:06 +0700
Message-ID: <20260918133912.133799-11-phucduc.bui@gmail.com>
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

Currently, the return value of regcache_sync() in
mt8192_afe_runtime_resume() is ignored. If regcache_sync() fails, the
function continues execution with clocks enabled and regcache out of sync.

Fix this by checking the return value of regcache_sync(). On failure,
restore regcache to cache-only mode and disable the clocks enabled
earlier in the function.

Fixes: 125ab5d588b0 ("ASoC: mediatek: mt8192: add platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8192/mt8192-afe-pcm.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c b/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c
index e4ecd23df180..5aaff5bebfb6 100644
--- a/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c
+++ b/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c
@@ -2104,7 +2104,11 @@ static int mt8192_afe_runtime_resume(struct device *dev)
 		goto skip_regmap;
 
 	regcache_cache_only(afe->regmap, false);
-	regcache_sync(afe->regmap);
+	ret = regcache_sync(afe->regmap);
+	if (ret) {
+		regcache_cache_only(afe->regmap, true);
+		mt8192_afe_disable_clock(afe);
+	}
 
 	/* enable audio sys DCM for power saving */
 	regmap_update_bits(afe_priv->infracfg,
-- 
2.43.0

