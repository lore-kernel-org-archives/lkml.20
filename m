Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794483055;
	b=Go+YVxl4ri6NnZRDpU5bL4sxPyshiwr0Bo/pkbM0l9diRPFYvQvzaolRuo1XnBcmzZEi
	 aTgWmc+yFQf/uTYq1ZLE4p11S0D1VGvqUzOKSauzCm9oJzEVhLf0XRmmzzN86Gz4o/vPf
	 KO9t5bUKvy8jG1rxPnk/lhjwsEMzManD/5DVThPHI0QvMZou3gV0qmJnM8PPWYPceESPw
	 efj9irA+3DRnakiqT5dsObrJxFoVMV+oSUsCXs/PWP2GwrukdBD4Ak/vTzN+MLo4Lf9ao
	 cYLDGgUOny8To6/0kElEnNHmqbPKzIKC3QNAkKq7cZwep7ALGgibarNkEXJ3ZcvNOhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794483055;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=+JS/u9nVbprwfAlBTGmlnxIj2t3cznYIMek4M/WJ2t4=;
	b=XvSrlxqYDJQK6suuBdhzqOJPjGGnGNe5g1NLk1GQP5Y942frCwc8k7ONhWuPV7VWUkG4
	 gohj6gnrDYSP2Wip4EQPQ618ShVUK9IaZuFKwmUhR6/2k0kYkW6bzhZkHhb0zJlMDVN/F
	 I6hRZQQLWCVmW8urf/TnftB1ZfRifBdiTHmJIzYS/ys7jFIQmh/uee4o9E+srue/B/1FD
	 g56w+gjAjpr7Hr5IplDn0zcoEp48Oymjtzp+bZ52Imijm+yt1sbysOzRx8mkhZP7fhTRO
	 MxvfLNnHqQFjHh8kglcgngMIA1jk36np/iN7oe1OR+RJwc6rqxZPzMHSqfF9XQ6Qjtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=k57GMODD;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22F65606A330;
	Thu, 12 Nov 2026 11:30:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22F65606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=k57GMODD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794483053;
	bh=evv+CrxPRGP4psPKxNQ1cTVcYtBSFk2IB3FxbDUgnAg=;
	h=From:Date:Subject:To:Cc:From;
	b=k57GMODDZ67douUoHRA4mSwQ7ooA/P+lSRygRsHsj4698JkIRpuvYXOu5z09nD/jm
	 gaq5uLeEJ20N0XfSCj7YsF93Uk1Y04Si4fDWjq6mq4FEu9IT4JK0TepuzwJEHA91Wa
	 nyZl/xe/HGvqmRXixvbH7cjMRAufs4C2V6Bj2QJHA3ioNy/h2y3vCqSpa/nRSrwBkh
	 UZdKqfBJSZZ/E6da4q9028xEx7yjmR0c3mJnyrBmpNLw7x9PWzVo4emEt/Gg6sgbFI
	 2CRfckSY4G0ZzD4CWtTzH1ZWXbp4q5E9msPuMfDhzCMjfmj5hdmrhEYlcZyQdbldqa
	 /opkoAcwCS3UQ==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D555217E057E;
	Thu, 12 Nov 2026 12:30:52 +0100 (CET)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Thu, 12 Nov 2026 12:30:46 +0100
Subject: [PATCH] ASoC: mediatek: mt8195: Fix ETDM3_OUT DAI startup error
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261112-mt8195-dai-etdm-fix-startup-v1-1-2a9fb98b9f6e@collabora.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y2NQQ6CMBBFr0Jm7SRMTRG4imFR6aCzaMF2MCSEu
 9uIy/d/8t4OmZNwhr7aIfFHssyxAF0qGF8uPhnFFwZTm4aIDAZtqbPonSCrDzjJhlld0nVB01p
 uuvpmpytDMSyJy/2z34eTE7/XEtFzhIfLjOMcgmhfRd4U/yGC4Ti+r7MZqZ4AAAA=
X-Change-ID: 20261112-mt8195-dai-etdm-fix-startup-285e69075f3e
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 bui duc phuc <phucduc.bui@gmail.com>
Cc: kernel@collabora.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794483052; l=4156;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=evv+CrxPRGP4psPKxNQ1cTVcYtBSFk2IB3FxbDUgnAg=;
 b=MyLx+bJ/4LwXeHbcsHvX9ezbWch2KPZd+M9+oYLuJhTTdrz8wBOfiCRMyS8kWIfnjmj56QqBN
 I7e1TuPefqlClhaJ9bwjZFZtxOKYNtDAlqmCZ6bSU9qTBujzbk3Ih82
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=

mtk_dai_hdmitx_dptx_startup(), used by both ETDM3_OUT and DPTX DAI as
startup callbacks, calls mtk_dai_etdm_enable_mclk() to enable the MCLK
clock linked to the giveb DAI.
For ETDM3_OUT DAI case, mtk_dai_etdm_enable_mclk() always returns
EINVAL error because no clock divider is mapped for this DAI in
mtk_dai_etdm_get_clkdiv_id_by_dai_id(), contrary to DPTX DAI that has
one mapped, and this lookup failure is processed as an error.

Since commit 1d6f1785d903 ("ASoC: mediatek: mt8195: Fix HDMI TX startup
error handling"), mtk_dai_hdmitx_dptx_startup() now propagates the
error returned by mtk_dai_etdm_enable_mclk() and it leads the ETDM3_OUT
DAI startup to fail systematically. The error was previously present
but since it was silently ignored, the startup sequence could continue
anyway.

Same thing also occurs in mtk_dai_hdmitx_dptx_shutdown(), when calling
mtk_dai_etdm_disable_mclk(), that also returns EINVAL for this DAI and
for the same reason. But its return code is not checked in
mtk_dai_hdmitx_dptx_shutdown, so the error has no effect.

Since there is no need to enable or disable the MCLK for ETDM3_OUT DAI,
and no benefit to handle a systematic error, that could be avoided in
the first place, add dedicated startup and shutdown callbacks to only
perform the needed actions for this DAI.

Fixes: 1d6f1785d903 ("ASoC: mediatek: mt8195: Fix HDMI TX startup error handling")
Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
The patch has been tested on Mediatek Genio 1200-EVK board, that
integrates a MT8395 SoC (variant of MT8195) with a kernel based on
linux-next tree (tag: next-20261111) plus patch [1].

Note that the issue root cause was also detected by Sashiko during its
"ASoC: mediatek: mt8195: Fix HDMI TX startup error handling" patch
review ([2]).

[1]: https://lore.kernel.org/linux-sound/20261109102536.357134-1-ghidoliemanuele@gmail.com/
[2]: https://sashiko.dev/#/patchset/20261014112752.683032-1-phucduc.bui%40gmail.com?part=14
---
 sound/soc/mediatek/mt8195/mt8195-dai-etdm.c | 30 +++++++++++++++++++++++++++--
 1 file changed, 28 insertions(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c b/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
index 5fe40299ec80..1806ddc46708 100644
--- a/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
@@ -2355,6 +2355,32 @@ static void mtk_dai_hdmitx_dptx_shutdown(struct snd_pcm_substream *substream,
 		mt8195_afe_disable_clk(afe, afe_priv->clk[cg_id]);
 }
 
+static int mtk_dai_etdm3_startup(struct snd_pcm_substream *substream,
+				       struct snd_soc_dai *dai)
+{
+	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
+	struct mt8195_afe_private *afe_priv = afe->platform_priv;
+	int cg_id = mtk_dai_etdm_get_cg_id_by_dai_id(dai->id);
+
+	if (cg_id < 0)
+		return -EINVAL;
+
+	return mt8195_afe_enable_clk(afe, afe_priv->clk[cg_id]);
+}
+
+static void mtk_dai_etdm3_shutdown(struct snd_pcm_substream *substream,
+					 struct snd_soc_dai *dai)
+{
+	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
+	struct mt8195_afe_private *afe_priv = afe->platform_priv;
+	int cg_id = mtk_dai_etdm_get_cg_id_by_dai_id(dai->id);
+
+	if (cg_id < 0)
+		return;
+
+	mt8195_afe_disable_clk(afe, afe_priv->clk[cg_id]);
+}
+
 static unsigned int mtk_dai_get_dptx_ch_en(unsigned int channel)
 {
 	switch (channel) {
@@ -2541,8 +2567,8 @@ static const struct snd_soc_dai_ops mtk_dai_hdmitx_dptx_ops = {
 
 static const struct snd_soc_dai_ops mtk_dai_hdmitx_dptx_ops2 = {
 	.probe		= mtk_dai_etdm_probe,
-	.startup	= mtk_dai_hdmitx_dptx_startup,
-	.shutdown	= mtk_dai_hdmitx_dptx_shutdown,
+	.startup	= mtk_dai_etdm3_startup,
+	.shutdown	= mtk_dai_etdm3_shutdown,
 	.hw_params	= mtk_dai_hdmitx_dptx_hw_params,
 	.trigger	= mtk_dai_hdmitx_dptx_trigger,
 	.set_sysclk	= mtk_dai_hdmitx_dptx_set_sysclk,

---
base-commit: 6aa7dbf8ad5ebd3babf53a4d6209018f86939f17
change-id: 20261112-mt8195-dai-etdm-fix-startup-285e69075f3e

Best regards,
-- 
Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

