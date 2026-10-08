Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAF0142E41B
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 10:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791456009; cv=none; b=VscUReGnJjtCe4rlWAgVuFkUABUhCyDbXLViTgszxJUWouXmVUycf7TXNJXr8NeGzwbwMXi0w+M20caySlAIlPtXavovUvgvTTwbylgBzlXpxgvPed10+mvxC0OehTVQKMNiaXtuJSkfQurCBowRNo2tbmcUohOUSKtOOHCbgqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791456009; c=relaxed/simple;
	bh=DQpdidc1ReLLfSxwfYnPC+Bi6IVnbVwubPbLgmRRb1Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tPMExwuR0DqmFouHvEdIlebPulu6pjgY1rDtKV3S1TD4oAbpmVLjEzNwoBviEFv/W5ZtjoC5KofKJIF4twXlNoUBReluFB/XfV9U98LRR9zqPQ9SbMVT0PRDjKqlwVr0Ay9vSxrNYZR+fpgL0W9YXGGx/qgkIHH75NF1u4vraFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PN7g5SAE; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PN7g5SAE"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-34ceab2900eso4962434eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 03:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791456008; x=1792060808; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l9nxhJUopT9Lxb0IcO/P1HkSQbbENhmHQ1cr6x4IK+g=;
        b=PN7g5SAE7stKq/t29EwylNCpnZeYW5k1Q4K8axf+cM57iDKwOOJ9uBnTE1Az3OZ9PS
         XrpQ8QPqPRzLrvvsLEQ1aO4KUXhtLc93qe5qUYqKipTTl2lGWwTDvXEQJ/9Gb5NpQ44I
         ZVQWgQBgNIvRFKgWjZ/x49V5Tp9nBLJ105aCc3ID5+ukS4Zsuk0QFkYRApWG5w14CtXj
         GkZToIZsjVWvbGPtOIXQJTMbw0aloUi2cZKDZYKx2hKAvuUswEV7EPty4aUnLy1D11uZ
         hdKa3bdNfNMW0uOed/Bsh9BnbMHo5x70pmiGxv0G+HnN7tX9tFIn4FSvt47JmnKbYsY2
         2vPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791456008; x=1792060808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=l9nxhJUopT9Lxb0IcO/P1HkSQbbENhmHQ1cr6x4IK+g=;
        b=0pu0ftU6yaUYR5Q6RWv8tv0IOokPkEu2KzWw6yKvdLVewnd8BC+jA5Ad8D3qkoJ+2y
         /BBqRITKXfqQ+wm2WD6J0nHg3nv9ubVSFjlkwLYleSmXH1Zq9k2SUa3acGOFq68CS4YT
         UpxkyKR++0b7WQ3eJT4J+MMqLSOw8b3LQXlB5xGScV7LojdxjcMeGvWB3tLesYDyi5pq
         QbBK21PROKEnrO7xjT3HHwKYc7fOhBjOMmN9Vm4PUIBoStTsGtDu1yeQfdc7q2ZHjy8r
         LTjS9Y6IaTj44KFlGF1TYpYV732YkGn6dIGTIWVkpI7XNwVLgYG3Nx/NmlLX7DjShnps
         lE0Q==
X-Forwarded-Encrypted: i=1; AKwUvBw0iqCBZn7Ab4N1T8BpVhSi9mRoO1Ue+8U6jKkno/w67NhA60tFiuDzn4zbTI226RjpdM7mqCYfVjAn0Fs=@vger.kernel.org
X-Gm-Message-State: AFq9FYL82lBw66/TW58qPHKYSlM6X1HnY4XZRVuxpFgSlUcdp1cT+vxD
	LivVrmUgzcqviRDDQueR7Yz9Dq0AuhinFeP++iK+x5/DtvXUzEeq4uIN
X-Gm-Gg: AYBFou1iVsXPfqWo3cLLpphnLMIZOx5RZkJsv+osb8zt0pzyr3ZzQep+pVO1u/aD2HY
	JSqf5EEQDa2tTpwXBZKDWCO0OIfpr9aeg1rHdDrtmX8uImJhuvjdcuwu+KkIFLUKiSnCeR6pNhf
	dlZMsF8CRvMdlNDMxPQX5488cdVmnj+rLZw8m1k49iLn9ujjCNxc0kyBCe0irqUSsY1/QW0xxjw
	LMuLuZaiViLhh8kPH6zYcyEGVvPLvMz5SBL1AP5OtO42jz90OstxFewbEuk/U/W4pAxdLLcA1tM
	sCWmZzZrLxmp6rLUEVWu/bSTrd61tZWBmahudb7skFbxF7D/rhyb5+eamo1Ho/1T0rM/EoJqaQP
	hPjDJOU7SBwG409GFiNzunumUzxcBCnVjTzXzMPgHxLkwZJFTd12cSqxycZT+Dv5UNr+jbv0nBb
	92x4F1zJaGr050mhQk3uY4TY8ZihNwcBzsT3XpXEeLIL/5Ke6jgEVGOO1PeciDVj69BWBPGrPZj
	OaNioSQZB+zQ1eHTo0sFQT+S3dA+ACzHbHzIyQf3MYM4KIQOZUnIBu+2C98suMmzqgl1LRjllho
	QIs5sLWwTaR0lw==
X-Received: by 2002:a05:7301:1e84:b0:350:89a8:5598 with SMTP id 5a478bee46e88-3515ddb2b12mr7233126eec.9.1791456007627;
        Thu, 08 Oct 2026 03:40:07 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3517810b895sm7496369eec.17.2026.10.08.03.39.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 03:40:05 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	povik+lin@cutebit.org,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrei Simion <andrei.simion@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Kees Cook <kees@kernel.org>,
	Syed Saba Kareem <syed.sabakareem@amd.com>,
	wangdicheng <wangdicheng@kylinos.cn>,
	Chris Bainbridge <chris.bainbridge@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Neo Chang <YLCHANG2@nuvoton.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	u.kleine-koenig@baylibre.com,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Hemanth Selam <hemanth.selam@gmail.com>,
	Md Shofiqul Islam <shofiqtest@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Zain Aboobacker <zainaboobacker33@gmail.com>,
	Sang-Heon Jeon <ekffu200098@gmail.com>,
	Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
	Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>,
	Bo Shen <voice.shen@atmel.com>,
	Vinod Koul <vkoul@kernel.org>,
	linux-sound@vger.kernel.org,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	patches@opensource.cirrus.com,
	linuxppc-dev@lists.ozlabs.org,
	imx@lists.linux.dev,
	linux-rockchip@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 04/24] ASoC: amd: raven: Fix acp3x_dma_close() being skipped on rollback
Date: Thu,  8 Oct 2026 17:38:11 +0700
Message-ID: <20261008103831.542533-5-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261008103831.542533-1-phucduc.bui@gmail.com>
References: <20261008103831.542533-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

snd_pcm_hw_constraint_integer() may return 1, which is then returned
from acp3x_dma_open(). ASoC only marks the component as opened
when .open() returns 0, so .close() can be skipped on rollback.

Return 0 explicitly on success.

Fixes: 703a6e22888b ("ASoC: amd: Enabling I2S instance in DMA and DAI")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/amd/raven/acp3x-pcm-dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/amd/raven/acp3x-pcm-dma.c b/sound/soc/amd/raven/acp3x-pcm-dma.c
index 37ea5c572eb9..072f3dc35d40 100644
--- a/sound/soc/amd/raven/acp3x-pcm-dma.c
+++ b/sound/soc/amd/raven/acp3x-pcm-dma.c
@@ -237,7 +237,7 @@ static int acp3x_dma_open(struct snd_soc_component *component,
 
 	i2s_data->acp3x_base = adata->acp3x_base;
 	runtime->private_data = i2s_data;
-	return ret;
+	return 0;
 }
 
 
-- 
2.43.0

