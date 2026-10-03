Received: from mail.nozomi.space (mail.nozomi.space [139.162.184.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4F3437A48D;
	Sat,  3 Oct 2026 19:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=139.162.184.125
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791056710; cv=none; b=s/Sm/p5z65UFes/1/0oulbwTl59yYwBTYvVDTCwQOqqJB6m/AZKQxsRH97UNSovgozhKyJzwOAHru4dYIGswnCV6FG5ZFwDzwt8g3mkeqC0OEPjx2zYvSII6stbWSuHjVcSLXWOOB/GKqzHthzQkdRhlsRwqPZlLIY6cp8V+1oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791056710; c=relaxed/simple;
	bh=Og0qzZOo75TiHgCWhRvStFZtPqMqKvwqwQ8HOo5wgQg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=b1ncQWREbiddgQAmmfhhZOfyN9xs7Gv5jHGKRx3gWy9zqTEdvUxOR/zrwCyEF/3+2dcZpDs49cuAYqbOn7eseKvCMbygRUbILc0PvL79pP64nHRQ8+rLx4QO9SF1kSDj+wi8DqyTCoUA6oSWgzXbDSHPmWE5iiWDt/xylG6HmY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nozomi.space; spf=pass smtp.mailfrom=nozomi.space; dkim=pass (2048-bit key) header.d=nozomi.space header.i=@nozomi.space header.b=X6Pz4IH8; arc=none smtp.client-ip=139.162.184.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nozomi.space
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nozomi.space
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nozomi.space header.i=@nozomi.space header.b="X6Pz4IH8"
From: =?UTF-8?q?Micha=C5=82=20Kope=C4=87?= <michal@nozomi.space>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nozomi.space;
	s=mail; t=1791056706;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7LGwLQB5bGxTp3o5FBG+AuuU4O/ZCuDyuPvM5fbA0n8=;
	b=X6Pz4IH8HWtDAm/qWRnFijWbXaidHYNrhK0WFZ7qVDzicYaXteen8LxzEVEMQlXQOHgYDd
	VW4GIOwkYig6kHFB93yGfIpRqYyZgEUYaep5DrLZLJCLWhIWOHY0abLUJy9cr+XhgrOp8n
	A7UlqI/TQt7iC/esG9r7tKWNJIdpZZZ/+Z98A298ykySI6fbSA+0Is9aTClLcgE4GIhf0A
	i+WONWWRHkhy2rFSKPoQA/JTPZm8PGmcGgcwrRRJPC1Mnqqj90kq8aYeugfq2CaiM3/tAu
	5iXWgtmd4ONLexWSKThyNy2KF+lp9guWFeqy4fugAQBfmOzHuQvQu78SJ1CM3Q==
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
Subject: [PATCH 1/4] ASoC: mediatek: common: Keep codec references until the card is bound
Date: Sat,  3 Oct 2026 21:44:58 +0200
Message-ID: <20261003194501.832558-2-michal@nozomi.space>
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

mtk_soundcard_common_probe() drops the codec references parsed from the
devicetree right after devm_snd_soc_register_card() returns. When a
component is still missing, snd_soc_bind_card() queues the card for a
later rebind and registration still returns success, so the card is not
instantiated yet. The rebind reuses the same dai_link array, but with the
codec references released both the codec name and of_node are unset, so
it fails the dai link sanity check and the sound card never appears.

Release the references right away only when the card was instantiated
or registration failed. Otherwise keep them for the rebind and release
them when the device is unbound.

Fixes: bce93a162505 ("ASoC: mediatek: Add common machine soundcard driver probe mechanism")
Signed-off-by: Michał Kopeć <michal@nozomi.space>
---
 .../mediatek/common/mtk-soundcard-driver.c    | 23 +++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/common/mtk-soundcard-driver.c b/sound/soc/mediatek/common/mtk-soundcard-driver.c
index 2d39ff23f8540..4bb98412feb11 100644
--- a/sound/soc/mediatek/common/mtk-soundcard-driver.c
+++ b/sound/soc/mediatek/common/mtk-soundcard-driver.c
@@ -129,6 +129,11 @@ void clean_card_reference(struct snd_soc_card *card)
 }
 EXPORT_SYMBOL_GPL(clean_card_reference);
 
+static void mtk_soundcard_put_card_reference(void *data)
+{
+	clean_card_reference(data);
+}
+
 int mtk_soundcard_startup(struct snd_pcm_substream *substream,
 			  enum mtk_pcm_constraint_type ctype)
 {
@@ -325,8 +330,22 @@ int mtk_soundcard_common_probe(struct platform_device *pdev)
 
 	ret = devm_snd_soc_register_card(&pdev->dev, card);
 
-	if (!needs_legacy_probe)
-		clean_card_reference(card);
+	/*
+	 * When a component is still missing, snd_soc_bind_card() queues the
+	 * card for a later rebind and returns success, so the card is not
+	 * instantiated yet. That rebind reuses this same dai_link array, so
+	 * the codec references parsed from the devicetree must be kept until
+	 * the device is unbound: dropping them leaves both name and of_node
+	 * unset and the rebind fails the dai link sanity check instead.
+	 */
+	if (!needs_legacy_probe) {
+		if (ret || snd_soc_card_is_instantiated(card))
+			clean_card_reference(card);
+		else
+			ret = devm_add_action_or_reset(&pdev->dev,
+						       mtk_soundcard_put_card_reference,
+						       card);
+	}
 
 	if (ret) {
 		dev_err_probe(&pdev->dev, ret, "Cannot register card\n");
-- 
2.55.0

