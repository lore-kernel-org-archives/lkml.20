Received: from mail.nozomi.space (mail.nozomi.space [139.162.184.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF461490C1A;
	Sat,  3 Oct 2026 19:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=139.162.184.125
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791056711; cv=none; b=akFawzJx0DTn5FNEjzWnDtn9PR8NcjScJZ9jeuhYW50jAHB/m4amZddK9yECqOHimMq7TuYnpOMp5gO4WKXJGCBerm/5j0WOFClZW2ZKMxgfpDa/WpHMj5hpBOf0ISF4NXHI4YDCfnmjxN/wPDIJIx6iMcqSCETbKKB9jqdJeWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791056711; c=relaxed/simple;
	bh=l5looihYPuwR0nuAh1Q/YVTZbdtJWmlG0B4WEyu/3jo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nf2wc6zjLpzLRctD7jVHq2etnxsmdZhS0hJucrFzewWfNI/+KGBaa7AUlKb/zGaeKC2CMJZHhWORuUMAme3/skU0/93+IlZ80QgxqvkDdglj4OpM9JVGLCEvvIxtGllcfsHD+3/NMNgutbLU56bYN23Z3Uwn8NsD1hORdfnyJgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nozomi.space; spf=pass smtp.mailfrom=nozomi.space; dkim=pass (2048-bit key) header.d=nozomi.space header.i=@nozomi.space header.b=UgcKNCTO; arc=none smtp.client-ip=139.162.184.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nozomi.space
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nozomi.space
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nozomi.space header.i=@nozomi.space header.b="UgcKNCTO"
From: =?UTF-8?q?Micha=C5=82=20Kope=C4=87?= <michal@nozomi.space>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nozomi.space;
	s=mail; t=1791056708;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ElBWia5JS4/SUpc+pf3CM3tN4U00hfaycVh4BT6HqIY=;
	b=UgcKNCTOuCw8LJyD0onRpa/oupvCUmsEBzixnV3SGgApXsXwHN+dAmNE0kQyzBILLgedKV
	23j+YH1hcAJS44e8b3yclgAFSgAdqibeLIH/jfbR66DovW5mStRf3QCpdtZzrGPXyiFV8v
	5AtcGH6UOLfvxdWA+haU4uixLSGKKt5qv5QzbXIvdFyKyWPrEanXLCWiFlUj7061yEZks4
	9aE0qR8eGbsmllBaLBEVx51MTBBJg7MZTxuq+pAlhfZHUWxZG9Far9LSlFl+y5GWvu6p3/
	ogJ+iCoBWvk6hlqFjwhitbc1sUT8TWFJm1GUuPmNpJBQ4H9Zw+brtWkYLvx0yw==
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Trevor Wu <trevor.wu@mediatek.com>,
	linux-sound@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Micha=C5=82=20Kope=C4=87?= <michal@nozomi.space>
Subject: [PATCH 3/4] ASoC: mediatek: mt8188: Constrain UL8 FE to its back end's capabilities
Date: Sat,  3 Oct 2026 21:45:00 +0200
Message-ID: <20261003194501.832558-4-michal@nozomi.space>
In-Reply-To: <20261003194501.832558-1-michal@nozomi.space>
References: <20261003194501.832558-1-michal@nozomi.space>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

UL8 advertises up to 24 channels, but its only back end, ETDM1_IN,
supports at most 16, and its bit clock is limited to 24.576 MHz.
Without merged constraints, userspace can open UL8 with 48 kHz, 24
channels and 32-bit slots, which then fails in hw_params:

  mtk_dai_etdm_configure bck rate 36864000 not support
  ASoC error (-22): at snd_soc_dai_hw_params() on ETDM1_IN

Set dpcm_merged_chan/rate/format, as the DL front ends already do, so
the FE only offers configurations the back end can accept.

Fixes: 96035d46d4b4 ("ASoC: mediatek: mt8188: add machine driver with mt6359")
Signed-off-by: Michał Kopeć <michal@nozomi.space>
---
 sound/soc/mediatek/mt8188/mt8188-mt6359.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/mediatek/mt8188/mt8188-mt6359.c b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
index 75c90d1d165f7..f07aeb6371083 100644
--- a/sound/soc/mediatek/mt8188/mt8188-mt6359.c
+++ b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
@@ -1142,6 +1142,9 @@ static struct snd_soc_dai_link mt8188_mt6359_dai_links[] = {
 		},
 		.dynamic = 1,
 		.capture_only = 1,
+		.dpcm_merged_chan = 1,
+		.dpcm_merged_rate = 1,
+		.dpcm_merged_format = 1,
 		SND_SOC_DAILINK_REG(capture8),
 	},
 	[DAI_LINK_UL9_FE] = {
-- 
2.55.0

