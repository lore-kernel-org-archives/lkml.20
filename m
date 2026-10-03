Received: from mail.nozomi.space (mail.nozomi.space [139.162.184.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A1B6490C09;
	Sat,  3 Oct 2026 19:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=139.162.184.125
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791056711; cv=none; b=Jm2sCx1aFGGiuFLcA8XfgdHT/5QqzQAorXcPp5UwxP7SCIkWaOxpiRSOeLmQYgcT6BbDppzHl4232QhqfXxN9yrMHdKMSFNq5+YmfStUYgaisvc4rsLcMtc/FM6rJjZG2AuU0UL8RUeF7PhGbjaJVAaFX3E7El6u/mCqu21iDm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791056711; c=relaxed/simple;
	bh=aWKY97sHh9S7brm4+CqOoOmeCaZu0twWysF+E3NgaY4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uj/0qJ4N2oi9ZOX7TpGc8mwA7DLMsmC91X6hJkc5cR4rnzQlYaoRW39Lkp7j08NpuN+BCG8NV9RMIrVd8QEzuuJSzLUPZQa/nS17UL1gG87sFlI0Bju/smRPcJ1Bk0pJKmIrXYmACO4049goLOHFHLHkZZEj0VyJQAKd04NaO0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nozomi.space; spf=pass smtp.mailfrom=nozomi.space; dkim=pass (2048-bit key) header.d=nozomi.space header.i=@nozomi.space header.b=Di9FEuev; arc=none smtp.client-ip=139.162.184.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nozomi.space
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nozomi.space
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nozomi.space header.i=@nozomi.space header.b="Di9FEuev"
From: =?UTF-8?q?Micha=C5=82=20Kope=C4=87?= <michal@nozomi.space>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nozomi.space;
	s=mail; t=1791056707;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OOtUI9LbZBFzrdoP5EONAONuH2mAdNCzMzef3tb6ksY=;
	b=Di9FEuevjwnMXtJQ+wJfqyQgGT7k9Gx/vhwJSmdP6snCsq+wwh//x/6JjTyp+4qv5i8XTb
	GVPv/fyHeVfYfKLGVwn1Axas2lJJ6YgJYqK9vUnAKtFjjKMGvPVcu4VNeey+CuIk05n2Xw
	fn7i+JkN5jKyLL4QTpUHVIensvYgLR0ZlfQMNLTfPuRDuKqiI/d93KSgC2Y00Mq+sssPPq
	pRj2YY9DSwAQXzm/XJzVjnXrED71GFfs4rO/RYdJhpkWlPF/E4r+pDJFAWmoI4e+uWiK8F
	ViWvanb6auSZeaM2q/HBp1fBXet/58RP7+LnI8dOpCR2Cn3tRPAM8Luv3GDkOQ==
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
Subject: [PATCH 2/4] ASoC: mediatek: Don't keep a freed topology name in the static card
Date: Sat,  3 Oct 2026 21:44:59 +0200
Message-ID: <20261003194501.832558-3-michal@nozomi.space>
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

The machine drivers pass a static snd_soc_card, which outlives any one
probe. With SOF, mtk_soundcard_common_probe() calls
snd_soc_card_set_topology_name(), which devm-allocates "sof-<name>",
stores it in card->topology_shortname and points card->name at it.

If the probe then fails or defers, devm frees the string, but the static
card keeps both pointers. The next probe does not allocate a new name,
because topology_shortname is already set, so the card registers with
whatever now occupies that memory:

  input: \xc0cr\xc2 DP Jack as /devices/platform/sound/sound/card0/input10

UCM matches profiles by card name, so userspace then finds no profile and
the card is unusable until the next boot.

Save the original name before setting the topology name, and restore it
from a devm action that runs before the string is freed.

Fixes: ec4489c43efe ("ASoC: soc-card: add snd_soc_card_set_topology_name()")
Signed-off-by: Michał Kopeć <michal@nozomi.space>
---
 .../mediatek/common/mtk-soundcard-driver.c    | 44 ++++++++++++++++++-
 1 file changed, 43 insertions(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/common/mtk-soundcard-driver.c b/sound/soc/mediatek/common/mtk-soundcard-driver.c
index 4bb98412feb11..a84f4ab4488b7 100644
--- a/sound/soc/mediatek/common/mtk-soundcard-driver.c
+++ b/sound/soc/mediatek/common/mtk-soundcard-driver.c
@@ -185,6 +185,43 @@ const struct snd_soc_ops mtk_soundcard_common_capture_ops = {
 };
 EXPORT_SYMBOL_GPL(mtk_soundcard_common_capture_ops);
 
+struct mtk_soundcard_name {
+	struct snd_soc_card *card;
+	const char *name;
+};
+
+static void mtk_soundcard_restore_name(void *data)
+{
+	struct mtk_soundcard_name *saved = data;
+
+	saved->card->name = saved->name;
+	saved->card->topology_shortname = NULL;
+}
+
+/*
+ * The card is static and outlives this probe, but the topology name is
+ * devm-allocated. Restore the original name when the probe's resources are
+ * released, so that a deferred or failed probe does not leave the card name
+ * pointing to freed memory for the next one.
+ */
+static int mtk_soundcard_set_topology_name(struct device *dev,
+					   struct snd_soc_card *card)
+{
+	struct mtk_soundcard_name *saved;
+
+	saved = devm_kzalloc(dev, sizeof(*saved), GFP_KERNEL);
+	if (!saved)
+		return -ENOMEM;
+
+	saved->card = card;
+	saved->name = card->name;
+	card->topology_shortname = NULL;
+
+	snd_soc_card_set_topology_name(card, "sof");
+
+	return devm_add_action_or_reset(dev, mtk_soundcard_restore_name, saved);
+}
+
 int mtk_soundcard_common_probe(struct platform_device *pdev)
 {
 	struct device_node *platform_node, *adsp_node, *accdet_node;
@@ -292,7 +329,12 @@ int mtk_soundcard_common_probe(struct platform_device *pdev)
 		card->probe = mtk_sof_card_probe;
 		card->late_probe = mtk_sof_card_late_probe;
 
-		snd_soc_card_set_topology_name(card, "sof");
+		ret = mtk_soundcard_set_topology_name(&pdev->dev, card);
+		if (ret) {
+			of_node_put(adsp_node);
+			of_node_put(platform_node);
+			return ret;
+		}
 	}
 
 	/*
-- 
2.55.0

