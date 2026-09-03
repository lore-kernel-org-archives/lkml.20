Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21B8A4FECD8;
	Thu,  3 Sep 2026 18:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788460004; cv=none; b=Ru7b93hXby1wHuVQ+N7F4wg2vpAR0TgmSCrTEJ2HEEhj+jBrOcGaZ4fyLu9QMNItTrHjYt+g2q8nBKE9n3FZxlN1pZiuze7YvxA6/0mdEJAFiymLSpzwdr2i1p+GKtUzBx8ETXQuHvYGT4IeyfhMw35g4p4940mL0ZRXnWagt8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788460004; c=relaxed/simple;
	bh=k/neC56RleN9fmV8C1kKi07iQq6i9gc6kvB3c7MVENY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IbAhckyXXzj36ldKKV0POZ9d4RZgD67g6/zwBlqh6eBRLthoctYVGThFR5oDQ2rLwn9kLd7iBIn15xZ6nA1bsThOXHClmu21T7l8iONdFjThMVm6d4azjmBVcVWKWMo60x+1FkpYGIf8kFR/uxuioH4S17h4DmKVeKuJ7L0ZfKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sR7JSRN4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sR7JSRN4"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9958DC4AF48;
	Thu,  3 Sep 2026 18:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788460003;
	bh=k/neC56RleN9fmV8C1kKi07iQq6i9gc6kvB3c7MVENY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=sR7JSRN4+vBOyeislHAsfsKHqVvQxxhJ5JEfAdqMVITaxsvUpyMnw63o6Z0dJYDH8
	 R3+V1rNazSh7rmn/iZ2JncoSkroc//ZKiAVjy3mjL1m3T9zEpk0Vp2P++H5amFnN8D
	 yBjEEnJHDktoudAk6MDOP/s5LK0ymy56H2C527ho94mlA5W8XQCZ8O5jrA9rD3nXPI
	 6K7Ghmw9/AzR/Aubj3WnCeAEmMrUrcC2IuA5LOqe2tEsQP7hjov9+d64WNRlw126c7
	 SepV7yVOwHWtTfaczLVqT46ng2ayyYPSvpg4tyQTAFN9wiTG/TTz1Kf2jy/2AYhfjp
	 R0DjNy/7sUCxQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82B3FC624DB;
	Thu,  3 Sep 2026 18:26:43 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Thu, 03 Sep 2026 20:26:41 +0200
Subject: [PATCH RFC v2 5/6] ASoC: cs35l36: Implement set_tdm_slot to
 program RX and TX slots
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-pixel3-audio-v2-5-7c22ed915291@ixit.cz>
References: <20260903-pixel3-audio-v2-0-7c22ed915291@ixit.cz>
In-Reply-To: <20260903-pixel3-audio-v2-0-7c22ed915291@ixit.cz>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 David Rhodes <drhodes@opensource.cirrus.com>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com, 
 devicetree@vger.kernel.org, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2990; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=ym0/FZGn+mYbakmqUH1BRKBz1D0NS99SfJsNBeHBZQs=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBqmbvhWz/gfsv85ZCKgoKangayDG05Zi49SJDpn
 sE/h/EP9kmJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCapm74QAKCRBgAj/E00kg
 cunzD/4tamaMGNQ9rjorRT9oA7X0iaUYI7EcCyocbR0HWK24zuIOYIMOWiTMOsnPtt5bsSwC3NK
 ooXk5VSSJiAEDl8DHtzcDynx2kYfY7pu2XQlb6WqoqvIAXcjPc7mVMsFrbZK09/H/Q1V8oOL7Cf
 ugluLr0nwXNQeKc3Ipg/P9H1VrhRrubvBCAAYzvPLeQNzJTZX+G183ETaJTc08KaJI8/xSnoWtm
 sxUyZyQqQz/SpKQWni9OZu98gwi/YainoTeYYiRK0BTYA22Fp2UGjlc+EzQ2Ki8Pa7Gwv0N/a6U
 w1LEWbVyBfUdmHEqZRcy8if17gwwiVST1JQ6srL9E6UNYtiuCAWhjtwAfyve1iw77PaqlzxYfdx
 vokQuC2N8Ho//3F4sc5VIgz02Yd0NpCPtxNMb86RplSKv89pn4QTAAKjoObEBx5qAyQsfOKU00u
 j/Vhx65v4kkccdLdglqmBVpKxVpVt/SQLRJHQmIL9E0/1IZmRqzNkPcem7vJtNgdPts3dpkVw4u
 9DOkQBJXaBpezF7Vb2Mb+JzhvzoJHUX5u2kamXh64TfOi7psMM8oxvn5gQbBPvl6VCL6CewlQzQ
 cWFoYsKlyFYxgQ+c7e3yuRGw4S4od3ITr8JoQfx9rTOW3nh+m+Drd803eqPcfEoEkIEyRsbytuQ
 TOFDnIohNw5P7mA==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

Program the ASP RX and TX slot registers from the TDM masks passed by
the machine driver. Each set bit in a mask names a slot; codec channels
are assigned to those slots in order, ASPRX1 taking the first RX slot
and ASPTX1..TX8 the first eight TX slots, with a warning if the mask
names more slots than the device has channels.

Passing slots == 0 or an empty mask restores the hardware defaults,
ASPRX1 in slot 0 and ASPTX1..TX8 in slots 0..7.

This lets a machine driver with several amplifiers on one bus, such as
sdm845 with two CS35L36, put each amplifier on its own RX slot and keep
their TX slots from colliding.

Assisted-by: Claude:claude-4.6-opus
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 sound/soc/codecs/cs35l36.c | 44 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/sound/soc/codecs/cs35l36.c b/sound/soc/codecs/cs35l36.c
index 89645327945f1..4d35ca6291548 100644
--- a/sound/soc/codecs/cs35l36.c
+++ b/sound/soc/codecs/cs35l36.c
@@ -942,20 +942,64 @@ static const struct cs35l36_pll_config *cs35l36_get_clk_config(
 	for (i = 0; i < ARRAY_SIZE(cs35l36_pll_sysclk); i++) {
 		if (cs35l36_pll_sysclk[i].freq == freq)
 			return &cs35l36_pll_sysclk[i];
 	}
 
 	return NULL;
 }
 
+static void cs35l36_mask_to_slots(struct cs35l36_private *cs35l36,
+				  unsigned long mask, unsigned int base_reg,
+				  unsigned int nchan)
+{
+	unsigned int chan = 0, shift;
+	int slot;
+
+	/* Two 6-bit slot fields per register, at bits 0 and 16 */
+	for_each_set_bit(slot, &mask, BITS_PER_TYPE(mask)) {
+		if (chan == nchan) {
+			dev_warn(cs35l36->dev,
+				 "Too many slots in TDM mask: %lx\n", mask);
+			return;
+		}
+
+		shift = (chan % 2) * CS35L36_ASP_TX2_SLOT_SHIFT;
+		regmap_update_bits(cs35l36->regmap, base_reg + (chan / 2) * 4,
+				   CS35L36_ASP_RX1_SLOT_MASK << shift,
+				   slot << shift);
+		chan++;
+	}
+}
+
+static int cs35l36_set_tdm_slot(struct snd_soc_dai *dai,
+				unsigned int tx_mask, unsigned int rx_mask,
+				int slots, int slot_width)
+{
+	struct cs35l36_private *cs35l36 =
+			snd_soc_component_get_drvdata(dai->component);
+
+	/* Note: rx/tx is from point of view of the CPU end */
+	if (!slots || !rx_mask)
+		rx_mask = BIT(0);		/* ASPRX1 in slot 0 */
+
+	if (!slots || !tx_mask)
+		tx_mask = GENMASK(7, 0);	/* ASPTX1..8 in slots 0..7 */
+
+	cs35l36_mask_to_slots(cs35l36, rx_mask, CS35L36_ASP_RX1_SLOT, 1);
+	cs35l36_mask_to_slots(cs35l36, tx_mask, CS35L36_ASP_TX1_TX2_SLOT, 8);
+
+	return 0;
+}
+
 static const struct snd_soc_dai_ops cs35l36_ops = {
 	.set_fmt = cs35l36_set_dai_fmt,
 	.hw_params = cs35l36_pcm_hw_params,
 	.set_sysclk = cs35l36_dai_set_sysclk,
+	.set_tdm_slot = cs35l36_set_tdm_slot,
 };
 
 #define CS35L36_RATES (		    \
 	SNDRV_PCM_RATE_8000_48000 | \
 	SNDRV_PCM_RATE_12000 |	    \
 	SNDRV_PCM_RATE_24000 |	    \
 	SNDRV_PCM_RATE_88200 |	    \
 	SNDRV_PCM_RATE_96000 |	    \

-- 
2.55.0


