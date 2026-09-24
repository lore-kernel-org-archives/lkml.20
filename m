Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05A57254B03;
	Thu, 24 Sep 2026 13:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790256252; cv=none; b=QWZv1lLJTRIXY6JoMbcuZkCHeKJgPIgO9BY0Vmi/HYD9MWFVvcLE8m8VztOgBj1O7tBS8u91uaqb626Nq784ZoNad1X6+fN3Oak4iM9osG+xfxStoBVJTdpMBsLn9iU8LYMhhiHK+EuhMKWny+foKUSWVzmhwz69fjh7gLs0bwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790256252; c=relaxed/simple;
	bh=n4Yhu5lpsZfx7zcrkNYR9Q3EKATQp/GiJimM9lApN6g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MvOFFYYACkuzRMmiqQBt6Lsj4qDLk2AeS8dqTiBTffiNIpux2ctNIbo3InX5LkyFKWusL8yh9GTblHUBxzt0HSSp1bQEuwKRVBX+wOmXhLTgbxvTNCFJR5SXfDAKSuTBQ5GjDeJCLHW/588q9RnK28ZiTu5TlIFyW3vRA9KJD04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TsnyYSTO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TsnyYSTO"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8FEF8C2BCFD;
	Thu, 24 Sep 2026 13:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790256251;
	bh=n4Yhu5lpsZfx7zcrkNYR9Q3EKATQp/GiJimM9lApN6g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=TsnyYSTONADODizfHt86XXqe9YnAlbeHZC2X4wG0JsKxRM+Uyi8qtTOKYQueBwkMR
	 KbNCww5Y2V18BHeu0+nM+sdx+F18YhqsFCx0BR7DK7mRYqCd00Pf5q4baccMA2HTJp
	 BIZ15GqDH/NGYyUq6BeozOvhbFRHP/8jV/EQTXyzuFsM1SjitRFJ62zwI8vzZA+0FN
	 goRaR1drGA5UzTKdKBhihbw3Hn4iZkyJKvIf1RMkhPD0aGJcXwBIbbHVZ60KpHfUww
	 +WxsPf+WjwlfBYi+PwTd9LXN2VhKdcXomnu81t2XTvJKTerQ7OBdaA0x9lFqQ2/mbY
	 VnPx7rhy4sZyw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74455C9831F;
	Thu, 24 Sep 2026 13:24:11 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Thu, 24 Sep 2026 15:24:08 +0200
Subject: [PATCH v4 3/8] ASoC: qcom: sdm845: Use per-speaker RX masks for
 TDM slot assignment
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-pixel3-audio-v4-3-85b5d133aa5e@ixit.cz>
References: <20260924-pixel3-audio-v4-0-85b5d133aa5e@ixit.cz>
In-Reply-To: <20260924-pixel3-audio-v4-0-85b5d133aa5e@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1658; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=VW92RXiOO5nv27+E+RkT/N6Yp/7ZgcRQKzeb8agg9FI=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBqtSR49RxPz/Zbsu+oRG+FyS0n4uY76SrEQyIdC
 aiCMlXMTHSJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCarUkeAAKCRBgAj/E00kg
 cqp+EADSVIIerxEsQ8ejwcmIT0u5l9ai+TZZtYAGaWBmczf81bSw165MgMe82ceve/L0GjTcMaB
 pM3zZDmosQnV6IidiQM9WccG3mogAzIa/Lk16nkjAdlpO4tq+HS6GntS41wfg0orCh1PWxyWO0h
 sx8CQeOOtRmxzCh6yngQ7sRWG346okmUF5iplW0ERj0qFRXuq4T9w863jGAH5quwNA/qXzHatdQ
 UwI0xwZUWFIyH2sN/zIqkuf4cn6qPZjDTj4FHiaprJoU3HeNGPJhvnas13p+yN/vkolZKS9tLr3
 2yH0Z54fsRVgGxohtj78+NA9rkqJhsSoC6Y0djJxBmlXL32fwKQyaoBTFHJkqqBSYvZfcSVh6lS
 VPMb1YApVLKXi1npCI/4FAnFHQnUl1aI9oOD6xKpHaQuVXZd88KZFY8TGS9Iolmj2fzwaDuJAYK
 k7+LSiJ9MPLDNXCDKJCPYe/ZMmMvJNxiIk9Jecay+7g2maJVYO8+Y1yOLrsZ9Dz2sdh/cI6FuIn
 OrF59QQ5i2t+mI2VwvE9mcbOkgggHGz0imie/96gWWU9ExIzJJYzgY1j/C3MQe+clXhAr/LRTU4
 uyhufoO0QSWM0bkmwc0I67pIQy+9wv11U+e9UtQJkHFgswiSjns+0qCnSkD9M1dH56tkex0+kUp
 Ww7+ZuuOPdQ0r7A==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

Both Left and Right codec DAIs were passing the same SPK_TDM_RX_MASK,
both speakers ended up on slot 0, breaking the one speaker in
configuration such as on Pixel 3.

Split SPK_TDM_RX_MASK into per-speaker masks so that the Left codec
gets slot 0 (rx_mask=0x01) and the Right codec gets slot 1
(rx_mask=0x02).

This commit is here, so later CS35L36 receives correct slot for right
and left speakers.

Assisted-by: Claude:claude-4.6-opus
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 sound/soc/qcom/sdm845.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/qcom/sdm845.c b/sound/soc/qcom/sdm845.c
index d1cc825fc5cdc..59cfa3b26cd4d 100644
--- a/sound/soc/qcom/sdm845.c
+++ b/sound/soc/qcom/sdm845.c
@@ -152,29 +152,29 @@ static int sdm845_tdm_snd_hw_params(struct snd_pcm_substream *substream,
 		}
 	}
 
 	for_each_rtd_codec_dais(rtd, j, codec_dai) {
 
 		if (!strcmp(codec_dai->component->name_prefix, "Left")) {
 			ret = snd_soc_dai_set_tdm_slot(
 					codec_dai, LEFT_SPK_TDM_TX_MASK,
-					SPK_TDM_RX_MASK, NUM_TDM_SLOTS,
+					LEFT_SPK_TDM_RX_MASK, NUM_TDM_SLOTS,
 					slot_width);
 			if (ret < 0) {
 				dev_err(rtd->dev,
 					"DEV0 TDM slot err:%d\n", ret);
 				return ret;
 			}
 		}
 
 		if (!strcmp(codec_dai->component->name_prefix, "Right")) {
 			ret = snd_soc_dai_set_tdm_slot(
 					codec_dai, RIGHT_SPK_TDM_TX_MASK,
-					SPK_TDM_RX_MASK, NUM_TDM_SLOTS,
+					RIGHT_SPK_TDM_RX_MASK, NUM_TDM_SLOTS,
 					slot_width);
 			if (ret < 0) {
 				dev_err(rtd->dev,
 					"DEV1 TDM slot err:%d\n", ret);
 				return ret;
 			}
 		}
 	}

-- 
2.55.0


