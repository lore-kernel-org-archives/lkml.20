Received: from mail.nozomi.space (mail.nozomi.space [139.162.184.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B4F938887E;
	Sat,  3 Oct 2026 19:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=139.162.184.125
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791056712; cv=none; b=Esk4pJwt5oMITCL6efmQF3t63RFgdPKXFeUogLz/PzyFUrXX8RCuKQWoJOnKUQsIP+VR1Wu7MEJFpyG3J8jjqUBeAB4WL7pz8xFzwDD8eQmWdgNEZlI9GJyl+uwUDm2NMYmwYU3Ds+KZLOWnWL3SCBfYlMtPXtOZlsypInEY9JU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791056712; c=relaxed/simple;
	bh=56K/2HF5uAevZ9gtD/5ulhExtKUUJdxeor17apTtZy0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=s7ypPZ9coMcDk9fAiVHKeQJmtHaCCNaMJ5ovfrjspJ/RzQJ08uQVCEUiRzW7EqrO/kC+Hn6pfPbBwX83WyMx+fbIE4OUSPMaWTKNp/6dNHPmlkqmqdJkfJdTiYVfJx1ih9griM9vPDhILgb/yEVMqZJBv3toDbWyHtSkoTpTvC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nozomi.space; spf=pass smtp.mailfrom=nozomi.space; dkim=pass (2048-bit key) header.d=nozomi.space header.i=@nozomi.space header.b=ahClsdTe; arc=none smtp.client-ip=139.162.184.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nozomi.space
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nozomi.space
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nozomi.space header.i=@nozomi.space header.b="ahClsdTe"
From: =?UTF-8?q?Micha=C5=82=20Kope=C4=87?= <michal@nozomi.space>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nozomi.space;
	s=mail; t=1791056709;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wgr4pHrZo2qwDF8ZFgFdxiB9TN8wC+wKv8BCpLbDH7E=;
	b=ahClsdTe7cTeQLSsKzawVavy2VEKP8wACr6NNn/bpmUr22gaHMmD7Ss26vtIV3m3VyVq2E
	ESrK47hKYUW0hXF+DMn6Ys7G8BrdEQN+YZOM6Tlmu8Jhdqr29W8cUFPQ9AGHybyBg/LcrW
	Q1CT5EX/iq/DxY9TeHP9QmL77bnd4HDfLiy8QJC1q/xCOjTUlaAEdux/nhv8aZ0jiXLOqu
	wc+olNPcYIQGy9W0bvH+CqlbF0UgUecIn5BP/Jdvd+64QV1xA9Z87D9Ii4srWVgmJg9kDk
	hynjeLat4Wh1D3u5yRgVww++j/74rj+9fWPqWX1XjJ6+fDLcTU5B1A0keKHurA==
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
Subject: [PATCH 4/4] ASoC: hdmi-codec: Don't parse an empty ELD on startup
Date: Sat,  3 Oct 2026 21:45:01 +0200
Message-ID: <20261003194501.832558-5-michal@nozomi.space>
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

A bridge's get_eld() returns an all-zero ELD when no sink is connected.
hdmi_codec_startup() parses it unconditionally, so every open of a
disconnected HDMI/DP PCM logs:

  hdmi-audio-codec: HDMI: Unknown ELD version 0

Skip parsing when the ELD is empty and clear the previously parsed
copy instead. The ELD hw constraint already falls back to basic stereo
rates for an empty ELD, so stream setup is unchanged. plugged_cb()
likewise treats a parse failure as debug-only.

Signed-off-by: Michał Kopeć <michal@nozomi.space>
---
 sound/soc/codecs/hdmi-codec.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/hdmi-codec.c b/sound/soc/codecs/hdmi-codec.c
index 7aa50c5bd3df8..0e1e532dfc634 100644
--- a/sound/soc/codecs/hdmi-codec.c
+++ b/sound/soc/codecs/hdmi-codec.c
@@ -475,8 +475,12 @@ static int hdmi_codec_startup(struct snd_pcm_substream *substream,
 		if (ret)
 			return ret;
 
-		snd_parse_eld(dai->dev, &hcp->eld_parsed,
-			      hcp->eld, sizeof(hcp->eld));
+		/* An empty ELD means no sink is connected; nothing to parse. */
+		if (hcp->eld[0])
+			snd_parse_eld(dai->dev, &hcp->eld_parsed,
+				      hcp->eld, sizeof(hcp->eld));
+		else
+			memset(&hcp->eld_parsed, 0, sizeof(hcp->eld_parsed));
 
 		ret = snd_pcm_hw_constraint_eld(substream->runtime, hcp->eld);
 		if (ret)
-- 
2.55.0

