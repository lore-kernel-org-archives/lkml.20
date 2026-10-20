Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792474083;
	b=VuTDRP7Nn+Q/SAu8tDr/ICvWGAQ9Q414HtxtD/CY7xBLKvlEjkKJKo/C3wsKnmmLZnks
	 AjKn3TFpPg81cyezwn7sBlThCYu+ntmkO6FGwdE0PCwdtQaVQ7t/IIec9CJJclzmHc6Rx
	 VEsOd9G94/UX401BmRkm3s/013VsQ4VLu9PJC46lVzwbkGIa6o3uv48rr81vXQWVyPYv9
	 uFR9v5OTvWhQKkyebOro2laGfSFPDYPO0hy6C9+1/qU3b/8Q15dvQNBLM+h4ncTSUp5VX
	 ZK+iBcdcZ7WDKwL0Awhks+9nJGW2WPhfrRa4J1ed5hPXodcMLzMALj4DYb3Hfo8h5aA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792474083;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=5l6pqreEYh+0Dsa58mvKfgN8V+MvlUn6xbXr6Z0vjIA=;
	b=uc1BXLwGxgyymqxR667CQZ1Ni70IlM/JbVjZSRFYJCbV9z/bjQXI6/T2HN4j0Noqgbmn
	 O1x28z2TWuutoyjt5kx/7WhIsBl9vcsZicFfCPf2FkwjxcMWgIhnKUeea+9F/Aq57oqaa
	 30RNiIP7wBr4RuAWuJlyNZbJibphbX1zCioXG8QoeA/NiDaUtwtks6KlF0hhBI5zw+CY0
	 BH8aupoZ6FwaWWLGg2Us4swd+t9s2fZagUI/XV9nEj74N1mpGN3w2ZxIimZ0tzGdE2UWg
	 BzkjmW/Q2Ip3dfk2AN5yij+iX5a8CXhBTtPwl5E4a0yd4Z9GKzzuZYVF13M2bGFxweQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JHwqfbax;
	arc=none smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA431606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 05:28:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA431606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JHwqfbax
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2e985106c0cso18972715ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 22:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792474082; x=1793078882; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5l6pqreEYh+0Dsa58mvKfgN8V+MvlUn6xbXr6Z0vjIA=;
        b=JHwqfbaxu2ccEqPpT+7EvX9ZfM9XYPHx/j3hT+0CsFN9SLD30ImeTVGAwOMdeSysP0
         16CI2twIxghmDqjFQgOIV1tK7BY4LnqfS56/jADr8IOredmKG88y/+BbJvBZQt816DLY
         Rxx7MA/LQeFYK5zUheARkwiayA8YmOadXS3BgVl+MnDuNur8FNbABWCD9uABpVnwSyIx
         8Leyb9sCIsY6FNZ380HzvhZ5xRY8z65ETCG1rRdZyZhKUspGxWMYsQjh5aFPmi4I1SFJ
         b4tbNp2wGJZIpYpACPejUI70bvJux8hGFW9+HQWqUyyBCMs67c6PEL9QQyflTqWmuMA0
         w00Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792474082; x=1793078882;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5l6pqreEYh+0Dsa58mvKfgN8V+MvlUn6xbXr6Z0vjIA=;
        b=QQUsFohqX7u8DjokNv6CBCMIVfVR5+T7fRX5OpDozcRLcu2SUjCQ1iyGS/4miuIhzs
         g8oSlu8ODzhkHwQ5Z+JhUSk1bQ/HKlWIx4H1HkSjeosc0hHkk/u0Zg3qVeKuwu/qYBgr
         GHUirDvjHUvp6+ceLzn10gVBoo25gS07+0UO5vASdXjxS1uSK6iwVB8Gl0Qjgtufo5Uf
         b+0cYqKN0VMUGrQylRW5DU2w6zPzfFAbcDcThk57QDugwsxoPkMhPrgGIXc5pWK+DMSe
         wGlG3cFF00NmQmoHCMP/f0Uwgxy8YbtNJt9T7NEHKHyIEY2IWmsyibJMC3E80N4BROUj
         6dpQ==
X-Forwarded-Encrypted: i=1; AKwUvBzKiXj3W+no/cHUpxCc/kwKgjmjZsFGbedaZ9cr7pFAMjeiWjNkEnypOBZh6403KU0Vr21wUpig2ayeMi8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKZ9ZyTMFoY4Wl38OXCsw0Yzw6rSy0fzBpbk6C4VwmH3APJ171g
	ZSBKEHb7udxlbesNf7H7KOb5NFe7viuAsrVfGjOdqBuiKcnl/nGryyob
X-Gm-Gg: AYBFou2d7fEWxL4919yTaqYJyhvVoH1nfsIPF/hV1asobjezh3noRVb0ElFXkjP9g1L
	Ey8u+kEHm0O6ObOHeHgjN3tcOQ+Pyuqn1Eo2c2VL8gM5qkWmU6kH0Z2E1eG8ctYU+6Sg4aZxrhn
	Uv4bkw/ZTqNbZS4v2ymEOmoFFns/uStwZlQTruTGMRdqABcfQiMNs2c1gS21053tTop8bd+7qn0
	SZO55bcpEi9aVMs02Jk3oxdONIairCJbj16uyLFayeTkV+4fJuFsEzPgOuF8JozrKhbt3WaTlKs
	N0uEQKHkfN6UCoUihun15Pgv3UpZKY5uQBwqsFG38d8iyCy7SUBJMGM5LSTWozxK5nWV6Xdb7JF
	1Ht55lKzaZmQx/ArWDW7+EDMCjaZ1jX0aJxYsLV3ziNAoxFhU+/aOUypaFgF3vH8Xrd/lNE07Pk
	DsTx/+VjNwYhxQ6UfVzizrOzw9lE1UM8xHhxlWEdt2maW+4PcwWxnJ0wmGh9wxWu3BShD1bh8fc
	DBjeLuvieFMj9tIqhc9/rDeOopcl0ShaWQHuKPLBvvLVkIeiCFrXaH2Aen0sDLJtWxR7KBOr6GZ
	WqM4Wc0GgUJKIg==
X-Received: by 2002:a17:903:fab:b0:2e9:5507:b532 with SMTP id d9443c01a7336-2e9a6f587c4mr80082375ad.43.1792474082176;
        Mon, 19 Oct 2026 22:28:02 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea1fd8a55asm3333995ad.29.2026.10.19.22.27.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 22:28:01 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	cassiogabrielcontato@gmail.com,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Darren Ye <darren.ye@mediatek.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH] ASoC: mediatek: mt8196: Ensure the DAI is marked as started on success
Date: Tue, 20 Oct 2026 12:27:47 +0700
Message-ID: <20261020052747.568770-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
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

snd_pcm_hw_constraint_integer() may return 1, which is then returned
from mt8196_fe_startup(). ASoC only treats 0 as success when marking
the DAI as started, so .shutdown() can be skipped on rollback.

Propagate constraint errors and return 0 explicitly on success.

Fixes: 57513aabfe5b ("ASoC: mediatek: mt8196: add platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8196/mt8196-afe-pcm.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/sound/soc/mediatek/mt8196/mt8196-afe-pcm.c b/sound/soc/mediatek/mt8196/mt8196-afe-pcm.c
index fbeba01b086c..f69ea22cfabb 100644
--- a/sound/soc/mediatek/mt8196/mt8196-afe-pcm.c
+++ b/sound/soc/mediatek/mt8196/mt8196-afe-pcm.c
@@ -161,8 +161,10 @@ static int mt8196_fe_startup(struct snd_pcm_substream *substream,
 
 	ret = snd_pcm_hw_constraint_integer(runtime,
 					    SNDRV_PCM_HW_PARAM_PERIODS);
-	if (ret < 0)
-		dev_warn(afe->dev, "snd_pcm_hw_constraint_integer failed\n");
+	if (ret < 0) {
+		dev_err(afe->dev, "snd_pcm_hw_constraint_integer failed\n");
+		return ret;
+	}
 
 	/* dynamic allocate irq to memif */
 	if (memif->irq_usage < 0) {
@@ -173,10 +175,16 @@ static int mt8196_fe_startup(struct snd_pcm_substream *substream,
 			memif->irq_usage = irq_id;
 		} else {
 			dev_err(afe->dev, "no more asys irq\n");
-			ret = -EBUSY;
+			return -EBUSY;
 		}
 	}
-	return ret;
+
+	/*
+	 * ASoC only marks the DAI as started when .startup() returns 0.
+	 * Since snd_pcm_hw_constraint_integer() may return 1, explicitly
+	 * return 0 to ensure .shutdown() is not skipped on rollback.
+	 */
+	return 0;
 }
 
 static void mt8196_fe_shutdown(struct snd_pcm_substream *substream,
-- 
2.43.0

