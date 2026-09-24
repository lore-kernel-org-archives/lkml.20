Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55D8147C101;
	Thu, 24 Sep 2026 12:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790254011; cv=none; b=nBtQgO4qBswOa69AAFD7id9nb6VMJBJ3QZe+n/DO9Pq1+w5JiypXQ9b2ediIiCA+ENEu0bTuD1zzan5KRMQ943sKKZ3O/0QUAW+qI08Vyo0AajawyGIyE18FtUFEY9EMp25edk5Dgf5UOO9R4wROfpHZonlIhBq6NvaCyeLFMX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790254011; c=relaxed/simple;
	bh=R5AK2QICtOTN1KE3jNy1ekwQ51VmTvUU6GrRIZTbMC8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZnrEYbmghCu0IcrxrprxMHLt3bYKpaKLkoa5xcg+u4MQEwMUox3kFvnU7zTL4qjfnOzqF7X7FPOiSbELcaTl2M+P4rRyo7ZqCdNXC4cidGYWa5a3mqzBwxs+h66IOGAvoistnBFvXkQ8PlxgcYvqWAeY42aAMI5JJsMzxSQAqH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gOwyfC0l; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gOwyfC0l"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D9F81C2BCFF;
	Thu, 24 Sep 2026 12:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790254010;
	bh=R5AK2QICtOTN1KE3jNy1ekwQ51VmTvUU6GrRIZTbMC8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=gOwyfC0lsjupo91voAI5VtD1WM8wGCzGa2ztXVSk9cY4sPRbOI20lCGBOfNxHXh9h
	 KGxUfvN9cduY6gu+fqxRIcYChoXedmtnbKKgp3+ZfswDb/tNL5NaIeg0HXRQI7uvIn
	 HiN9GhOw93jFlW/cRIwPiCwnvGv3g7A4N2YhNZG8qdfvuHb2UQEQXAcAn2YAPrFkfR
	 5tbj489m8k5Plh5sV76jqS92nwylLs69uaDvhUIL9WsjXsn/1E+LvbrfUB20ZZWBHg
	 TnYcAXkpSjEQzQ0t3XBf9sV63MJxRS5IG8NdS5S1MV8DYyPY0ql8CtazrAXgp2aaMP
	 vsSxwxLFMxVnA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C32D4C98320;
	Thu, 24 Sep 2026 12:46:50 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Thu, 24 Sep 2026 14:46:49 +0200
Subject: [PATCH v3 5/8] ASoC: cs35l36: Implement set_tdm_slot to program RX
 and TX slots
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-pixel3-audio-v3-5-5d06460fc8a9@ixit.cz>
References: <20260924-pixel3-audio-v3-0-5d06460fc8a9@ixit.cz>
In-Reply-To: <20260924-pixel3-audio-v3-0-5d06460fc8a9@ixit.cz>
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
 David Heidelberg <david@ixit.cz>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3051; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=4aMW5UlnmrycKDIcE7Iq0+kPJ4NO4a3bzJ1FVay6EJk=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBqtRu42tV1rep3s6ImG2fVirxZ3Gx4OI7aRFbR3
 8U3JUCRs6aJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCarUbuAAKCRBgAj/E00kg
 coiOEACdetkw25DOualfXLziwt9fCaRs8bnMHwq3GAOHCqcFmcVqFirvqrEhT+u34nN6SoBrS5h
 Cp05OWXNgsnS3SBbUxWH4Bj01u3my6GLcOU7H/lMGVfxs1I4K41KBdJucBoBjk/huvzaVqKBnOS
 fpiRvWTugzUHu9D2M3WSXHjmH18iRpfmtvZj0KTfH36MU6fdbySMlXX1Fwr958UVf699wkub9Gu
 8O2c7cx6t8MREFnC/gEvr7GrNQsNgaqDUbKSYy8vlC3ghw9Ijb3weQgev92VMwbUWeaVOtOFUh7
 X21SZzgYGSSfZtK4ge5GUndDUUk0ZJEz0oK4NMPu7Oo/3OAPMIIWs6PodbRVhLK+Jkgl8R0C4IF
 e9ZjZ+i0Z07V5sIdeA6k5J7pxXLAQ3g4HjyKDun+Jdim/aUzWE1GW1FNXquq9ZpRVRGMOEiCARI
 06PpLXPg5QoDY+dQvx4UTUMZS56A69jZY0+RTYZPYEmwsoEh7vNP1AS1Um2bbpGf6WG7T5y6NrI
 c1/yS2Cqo5pEmjYc1dgNmdjD1+3RTMuxg5SIak1+t+KuO91VFYG7oZcJTKl0dV0yTEo9qvpSKem
 xB8Ct6783afbMNqHMbgZXFvNmtfjsXHeT/3Jv6MTWnBy72hapU1MVkbT2habTEGSqmjFgvpZs4M
 JuK9rvXtglGPGxg==
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
Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
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


