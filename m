Received: from mail-pz2-f13.google.com (mail-pz2-f13.google.com [74.125.228.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEFC240DFBD
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 06:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790662342; cv=none; b=Bl7Mhk8CWMd6bbkZI+6L7llF0k5403xaZZbn6kdO3X24PGwAcvU0nJf91IlHiezrm3HfSrUnlzGRH9K6PfVbIo2KUmLUjT51vfG0fOUvNxj3nizB7spVzmNGItzbMx7jXYThscSjkYqyfmb2j5JKmJi8/Ta19UFcyCEkVgdSw6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790662342; c=relaxed/simple;
	bh=v+NrIf/aEhKFnF2XgIKpuXsPvWyrB+Vk/TkbdhhH2YI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=om+225VkDI/7H2Jxvke12f1HslAJOYUq53Z2oKsMTRI1ywDVDsYxhBKQqbh1MMuy51jKEJfm/UPkGwuObJwyHaKxOG4YnoM7viPKPrvorzodTg1G17hjkaLw2Y8W2smPfGexm47s7RCicrsgQi+2o4J2Hr+pjfW7kkBTqbRSW/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P0MeQ0sf; arc=none smtp.client-ip=74.125.228.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P0MeQ0sf"
Received: by mail-pz2-f13.google.com with SMTP id 41be03b00d2f7-cc4cdc0d663so1527120a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 23:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790662340; x=1791267140; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yiOQQUNxogiUQyW9juq/yIUpauLJuI5yeb0AGzYfhSw=;
        b=P0MeQ0sfJUI60oa8snfXYekjRHA5i7H59hcCB4770e7Eoo/p/b1ZOqEhr73pn0zYsV
         jKCwWbzhocALBolPajt9suRC38VDbpZlZ+Qd3hgBereP9xIBeWqTweB4oyXsZaRZ8oZW
         kDCXbsCGfyHemk7k8mXipPOQ5qxQyNmiXn0w46nOf/RIWIdLW3Ddcjh0qUwUiIJlTp5R
         UEkJYSLbsJQqgXDqjpsI38arBbt28I5anh23E2/Wfz+s3WT7sJ3rwkdIBIfNylq3TFXP
         AlU2sE8UhIg7bbiVA1LHntVzZG7KToYIw0jD0CDM8Fa/nagQDYOrBh0pbmp83bUzB7oG
         ob/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790662340; x=1791267140;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yiOQQUNxogiUQyW9juq/yIUpauLJuI5yeb0AGzYfhSw=;
        b=GTD0eqYxmEApqzLKItmrouCHPi5kSi6hUcChfXoVIGuiqUPJDEQHRq6yUHgGZ77xJu
         0J0xDxeYIALlqSsFhJtjWydAHxN5noCfcvdGoVbRDpyfMkGKGWhu7o5pe1qzf8tax9no
         +WB2DHh3rO08//LU/eddT+XFNHvq3bAErAd05xfCWl5rLs+x82FT/1r8vp21vu88xDVE
         Pf9XOnytcRBJkzllI8STOLQdany+uaWff1QWSTBtmt+IPDiVIlzdlix9sw/D5iOgBG6U
         Yp4A+oSq2uFuZFl/xvu3K8unziCfREZ0c/pJjb6EkdymW8AA897HRqqU8aLAi+MI+I0Y
         yYhg==
X-Forwarded-Encrypted: i=1; AKwUvBwTh76yRXvbgindlmmBoV/2hOg/0ouRVH32pZKJgIROpiYyJmDBKeyTeJci8J2Vmi42HHDlKfRQolp4hPU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKglmNLPVfA8FCz5zGtSNz5h8Uqnj10LhsgAIN6fMLIeYzM01yG
	JhoLRnxuR6r51DMbQ1IvO2MJR6x+FyvEIMSXjHPT+5kdMimGJGFhsdjh
X-Gm-Gg: AYBFou2DbEqIsgmQMvI8ZL63g04do+X04/NhpZGdRAFZgPi999eBMKjhlwPR6GLj6is
	G/VG+Xzz3TEVLsQzzoVIiYlLBJl9T980g+9DbOQi0AhsTnWnkCnnlJminf6FuWs9+F64OUYPg+E
	YI1v2q/JHeCK7D0rvTPPEv0ZpEvYA6vbKi9sRNMuvfkbA2+JuSZUpF41Aeqf5LFmwYbBvvZWKaA
	z4fOeWvphw5DUTpF7ekvXq2DwcYUUweTWOYkf2CaGv5HHH21VuctS+8zNaPSH9TGUYMANiXv961
	qEztmYvY3vmWDaJG4GFcgrNftW0hmr/dzck98H49XreX6y2O7nReXmqhKl3IE9ZiSdh4tdImW5Y
	6OXLdBOcsX/WdxaDv91F8ap0MbzATJ21QfwKEiRejHdQ0M4lAeg9rziVQ/+p6qsNmffV+JBLR6z
	j3ZRSziNBcL5JR0eeNVT6xT5R5Vv4fE/f8rDxlpjE9/e6CyIbUjfUX8Lw6hvO6M3vD+PrRty+u5
	zKzxleQCz08MguGNeOAn7XcVsOYoqhxelDzT0xCKHcLg8JV58ORHb5MeB9YCQguEWgxn6ScPvBC
	uOCH6lpgbHE3PA==
X-Received: by 2002:a17:90b:4a82:b0:3a0:cb48:df6b with SMTP id 98e67ed59e1d1-3a0cb48e2fcmr9490197a91.34.1790662340222;
        Mon, 28 Sep 2026 23:12:20 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a498726d63sm3280965a91.17.2026.09.28.23.12.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 23:12:19 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Darren Ye <darren.ye@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	cassiogabrielcontato@gmail.com,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 05/10] ASoC: mediatek: mt8196: propagate main clock errors
Date: Tue, 29 Sep 2026 13:11:16 +0700
Message-ID: <20260929061121.124001-6-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260929061121.124001-1-phucduc.bui@gmail.com>
References: <20260929061121.124001-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Propagate errors from the main clock enable and disable operations
instead of always returning success.

Fixes: 7384ecab34eb ("ASoC: mediatek: mt8196: support audio clock control")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8196/mt8196-afe-clk.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/mediatek/mt8196/mt8196-afe-clk.c b/sound/soc/mediatek/mt8196/mt8196-afe-clk.c
index 6198711e01b5..dbfd02d20338 100644
--- a/sound/soc/mediatek/mt8196/mt8196-afe-clk.c
+++ b/sound/soc/mediatek/mt8196/mt8196-afe-clk.c
@@ -598,14 +598,12 @@ int mt8196_afe_disable_reg_rw_clk(struct mtk_base_afe *afe)
 
 int mt8196_afe_enable_main_clock(struct mtk_base_afe *afe)
 {
-	mt8196_afe_enable_top_cg(afe, MT8196_AUDIO_26M_EN_ON);
-	return 0;
+	return mt8196_afe_enable_top_cg(afe, MT8196_AUDIO_26M_EN_ON);
 }
 
 int mt8196_afe_disable_main_clock(struct mtk_base_afe *afe)
 {
-	mt8196_afe_disable_top_cg(afe, MT8196_AUDIO_26M_EN_ON);
-	return 0;
+	return mt8196_afe_disable_top_cg(afe, MT8196_AUDIO_26M_EN_ON);
 }
 
 int mt8196_init_clock(struct mtk_base_afe *afe)
-- 
2.43.0

