Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 378E3472F65;
	Thu, 24 Sep 2026 12:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790254011; cv=none; b=IRSkHCh7FnTC3v3L9Q+L+nT5FCsmRrnRRkjE07pRF+fO2QR3CaTgcCEvLMjwybYCjzMr1mYrjW9sxfcLR/pGsU0pGEEp/TWKJ6jXuDiL1enb2hkaqpFUHrHm5ybK4iwhSry2twc2IeA4f3yw9F+NdJ3T+5yJ7K6EHtPMdI1teAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790254011; c=relaxed/simple;
	bh=chfMDCvu0jGCv2MFl8WIbjOdk3NN3CN5sXF+rwFeDmI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QmIeoPUkvmGch2e0mCjxB6Y+Bk72fyRvVeoBaKThTl17O4qzFPUKFN+tW7vRgZRTsDhPFg9Qz9MtBGRI1AbF/OxATO2IFXsP7sCXMgTu2PExBvs4ytEhr0g4Wiz07VpB3Ffj+u99g3m3vM+BJ8ITMiBXEU+mTupLGODvWbLSz6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nIA1aJNh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nIA1aJNh"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C885CC2BD04;
	Thu, 24 Sep 2026 12:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790254010;
	bh=chfMDCvu0jGCv2MFl8WIbjOdk3NN3CN5sXF+rwFeDmI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=nIA1aJNhrtsW6tjCjDa5e8u6eAgE6IxncybNnCD+4EaI/VHzJLrDMICrhHpvDpDB7
	 BjDkxgy36G6NTG1iGenvZ56hKLqBmTfE0CICziW/ktHfTiP/GGfGIQZpGbehrrTHLs
	 Mc21caFWYwyb6nxt8HkDBsKXkh6BE/a2Qk7q/oDeLT6FGZfo3x9xY5Ng5MixlQ/4Wd
	 oygDFwd08LK2097szXotBzC5G1JAXOgiXgtg/ycoYNu6hFEYNwM04LyYcTyCjQHK/4
	 yeMClgLbopwyLSZinlS22sKCwwWvd0e/+MBqB/IClZzRI4XLYngGlxWAFiulpfF5cG
	 0pSw1yAXdpgFg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3473C9831F;
	Thu, 24 Sep 2026 12:46:50 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Thu, 24 Sep 2026 14:46:48 +0200
Subject: [PATCH v3 4/8] ASoC: qcom: sdm845: Set codec dai and component
 sysclk during startup
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-pixel3-audio-v3-4-5d06460fc8a9@ixit.cz>
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
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1661; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=sf3oRG8KF1GI0iFA9IGZLcdnFZs9OCe5HnE3apZFGXM=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBqtRu4cZHlSWv0fUFP4h4HtRLuwZJr3M7bAfJ1B
 MZf8XaDTG6JAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCarUbuAAKCRBgAj/E00kg
 csbgEACeikmiq4LGZavywoHHpt1ZCrtE5z45f/Om90w0Tx92nRQsXQUFVPPYHZOwU7nWVka2leh
 DvXj4tpxdc0Cy75YqxJGAZWgVdXNBqRJ+wtmlJ54UMs8kIywsbCo3X8jGovXTaWZV1INr/sS9GP
 p8PUxCKuTiTZP9cM+6HohzA6MlgRFf5/3Xm5/ld0eblAHz1VWXAlRkUmvA1w1hdXjzwJ4Lu2crW
 8BstwAFWKyTezV07je2b+pYFgZ2Y0gvrkh8ZU3b5DQCLzhPGpC/JiDIpbAo2jdhGwx6292ivbwp
 EINQIlA4aWJaeS7L4sOdvlp7iCiyXuMbMAsTvlhgL8hmrD32QMniYTH49MqEpGhv0SFMdexnz6B
 nYb/TLqUcxrVCF7TIg8cE7NLutylcj5u9kGlcrR+jofNIzv9NbKwEPxGcstUKjLde9W7V6lcOwz
 PksrsLBJe+YXlBoLpMfhVzYTSSsAFZDYIyhpd+5/E9UVtydQCE8OQCs1Uu8ht1hbdz2oJPx7riw
 cyWa/Tq1Sfh9O7UOl3YY+ma44ESPY5Z6ylxW9RBXGsON8HNe3jTjR0/8ja/Se5napoy1yrnt/wz
 fihB5BUBYtM3UHmKRvEkumDxfM59NOdp5c5j7qjqYNOOAyaqqK+4FWgxbJBuB9p0agFJsQBZRAu
 rAcqLUDxTqFHL0A==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

The cs35l36 codec needs the codec dai and component sysclk to be set
during TDM startup. Set these for all codec DAIs on the QUATERNARY_TDM
path, gracefully handling codecs that don't support sysclk by ignoring
-ENOTSUPP returns.

Based on work of Joel Selvaraj.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 sound/soc/qcom/sdm845.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/sound/soc/qcom/sdm845.c b/sound/soc/qcom/sdm845.c
index 59cfa3b26cd4d..f0fbec9c8df25 100644
--- a/sound/soc/qcom/sdm845.c
+++ b/sound/soc/qcom/sdm845.c
@@ -407,16 +407,38 @@ static int sdm845_snd_startup(struct snd_pcm_substream *substream)
 				ret = snd_soc_dai_set_fmt(
 						codec_dai, codec_dai_fmt);
 				if (ret < 0) {
 					dev_err(rtd->dev,
 						"Right TDM slot err:%d\n", ret);
 					return ret;
 				}
 			}
+
+			/* Set codec sysclk needed by codecs like cs35l36. */
+			ret = snd_soc_dai_set_sysclk(codec_dai, 0,
+						     TDM_BCLK_RATE,
+						     SND_SOC_CLOCK_IN);
+			if (ret < 0 && ret != -ENOTSUPP) {
+				dev_err(codec_dai->dev,
+					"Failed to set codec dai sysclk: %d\n",
+					ret);
+				return ret;
+			}
+
+			ret = snd_soc_component_set_sysclk(codec_dai->component,
+							   0, 0,
+							   TDM_BCLK_RATE,
+							   SND_SOC_CLOCK_IN);
+			if (ret < 0 && ret != -ENOTSUPP) {
+				dev_err(codec_dai->dev,
+					"Failed to set codec component sysclk: %d\n",
+					ret);
+				return ret;
+			}
 		}
 		break;
 	case SLIMBUS_0_RX...SLIMBUS_6_TX:
 		break;
 
 	default:
 		pr_err("%s: invalid dai id 0x%x\n", __func__, cpu_dai->id);
 		break;

-- 
2.55.0


