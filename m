Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B68B5397E8E;
	Thu,  3 Sep 2026 18:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788460003; cv=none; b=o99IeaNvQRchf1CwaEPos1FQe3Lz415bCfilCe/4TphxpGf192i00NCIyBJS9Vg4FJYxsTxUfsnRn8Ye+xizmJSdjQ2ZGrSdcib1wnSpVw5tpnNznRHf1/xkm4ZaVcrpY3ydA1elBxyMr7BTHxvKlaIsefgdP4KM9kaoOp2FBQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788460003; c=relaxed/simple;
	bh=n4Yhu5lpsZfx7zcrkNYR9Q3EKATQp/GiJimM9lApN6g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RucHmsFYNvnzJ73lPsG8tgrkmAz7pFpAITjpuDastovbpGyAiDP3PwLl0vXFMAmZnNymd1QCxQxqJGbSIETzUn/ga7hWPf3+3hUHqiqO0EV5ymPzzskiTTYM8Ssf1cLe+vK4c7gvOXcTbzAcDyosZ8UcOo0IcChWo2KS4UywoE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f3InK9Li; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f3InK9Li"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 60B8EC4AF0B;
	Thu,  3 Sep 2026 18:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788460003;
	bh=n4Yhu5lpsZfx7zcrkNYR9Q3EKATQp/GiJimM9lApN6g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=f3InK9Li25GappYGi9RhY60UForWNkbeqw+1tj9JasXh7Y+mexifg4Bas4ug3ulCy
	 NNWz7isjNnRH6lSdORzJUucegP88XLmYDSwVzxGYrnL23162xuBorXkas4YwsjvO7y
	 o5zl9CBZ9HRFHPcB5P2g/lYcZTYtkLwlt8K/mkjZG8oeOL4rrNfNBrZbrypysqC4OX
	 lzo7k7SKf5olBItRIB2r2qlbWlTavDO2/z+lnEtghYyVZXiAK1oc1VDKT2UGZEoTfo
	 01QpRVZgEWkWUJzXwCK4TOwvdUZ1br9L66LCyUxNeCHFD5uRZhepCd+MLahv0AnbB2
	 GAqV0phqjik0Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4249FC624DE;
	Thu,  3 Sep 2026 18:26:43 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Thu, 03 Sep 2026 20:26:39 +0200
Subject: [PATCH RFC v2 3/6] ASoC: qcom: sdm845: Use per-speaker RX masks
 for TDM slot assignment
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-pixel3-audio-v2-3-7c22ed915291@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1658; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=VW92RXiOO5nv27+E+RkT/N6Yp/7ZgcRQKzeb8agg9FI=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBqmbvh3NTfrj1m1h88rAOq1LhKiZViyj1q4CoZa
 Pm0BfvwljyJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCapm74QAKCRBgAj/E00kg
 chH4D/4wKr1ik+rYF/zXmIp1rnXHYXSp7bBAPwx8AdoB6o1dIc9UZwJI873aiGSi6zMofnnTHET
 SuSO912wwU9+Io0tzf3/TeUO+Qt0Mn6/yZqvI1x+kWnawE090OdIGrihSTo24xR20i4y5DFKZb3
 GQzJjYY+4L8sX/t3aN4xn1wNKXBw+K3qv5dhi4j/D2vG7s7WczwAyyERzyGLBz5NxyIC2raBoLZ
 pwykee2wKTrNYL5hmVUl+t4pz0SpMe0XN3WWYjwMj1DyrrHjTlL63hiii+3ytvoA26Os1p0IJRG
 Z1oOEJxR7Z7B+apUSTdRelrBOQbJdkN9dnkpRFlxa7TVInvpdoXeFX/UtHN7EeKJf6mEazfpZwI
 VNzO8HXzwrXEAxrdIgLYsVdR4YVnX7qMfvrXU+gVpSVgT/EVA/JTXLtGV7jt1J4/LvwUjy3A3of
 1oteF+UJJtOpclyKXA7eSggs1vIVk8095W+qjZevih1TXlHWRR2SREjJpXTKFzW4vcCHOFdM4GF
 Gbars/WBKkwFJM77lsGCerKtN2ejYVb1STEr4sUD8L8KzpoIfRMPP8gOcolre0ywafLSZi1wo1u
 +qGDCCMPyXo7einqVNbaNHwtAy8yiQQ7jWonb+Jq/f2rBBdvfGcL7OGk+Gq9ZZ+NdCVSLi0iTaF
 7LJLr95AKYSv/Ig==
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


