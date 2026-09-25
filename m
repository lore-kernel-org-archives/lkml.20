Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A15164CCDD4;
	Fri, 25 Sep 2026 15:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790350088; cv=none; b=cI+1rpvgxrX2P0Bbv14S5Q+AP69ypk77WbRdY8ToX+9+ObWQSEsMk4dWPQ7CgqqPjIouP9a4H80Px4CZ3DJMZdL18V6FyZzI+X42S2IPQ8UAewwU1WQ2RZ6uBiZOUpNCS0AxeJoi96/NNeOYjLvUnVyN0Yn5uhwNIHBvKaWVTQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790350088; c=relaxed/simple;
	bh=QwCCE9iA03DRV1OiIpwEbsBnInBMMcPUgJLYTqpWaZE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DWAVGrqnbeoTFppGCFk3WmjRxYR/ghcC4+aPI22qmkhakOuqpOUk0W7hW8fkFlvupHUB2CP0FT+7DF+G+gF/RoCeCAvfkirftcjG+osDF9cdvHifkOsMxx6NhIDVlneuzsAlB6O/xIl8rYRnKCm7B/o+CnU11qHWU6Z4bJb+8GY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SinVewHH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SinVewHH"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6BD06C32786;
	Fri, 25 Sep 2026 15:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790350088;
	bh=QwCCE9iA03DRV1OiIpwEbsBnInBMMcPUgJLYTqpWaZE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=SinVewHHooX7vI/IFo+meNvHfAM48FB1Vi4TYPNGP3BNbRRYo5RNeu3QStqdXNDJD
	 YRkpgfHZIo1SeVtnG+M6zk1UWwBcKFtlwFiusIlVUAMseEm3+hSNFpfgcup+EPuwo5
	 R684BlMcH/0bPUTQtbgO+8MDH5dQOyUP5r/QtsYMELSsEopVdQzCXwSYoxNotmCK94
	 /nlS6crZqhHC5VwSOIUf/symxfpAggrL2IGU32JRSJSWsk+VPsGAeRP8l4uCKB8soJ
	 7jID0iJFsC4QANy0i5w90JrhKAEYskqQF5Pwda5BUl620FZkiTnewmT/VlyvpoFpkU
	 RjzZTcFeTjt0w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56ED5C98328;
	Fri, 25 Sep 2026 15:28:08 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Fri, 25 Sep 2026 17:28:05 +0200
Subject: [PATCH v5 4/7] ASoC: qcom: sdm845: Set codec dai and component
 sysclk during startup
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260925-pixel3-audio-v5-4-7ffb32c980bf@ixit.cz>
References: <20260925-pixel3-audio-v5-0-7ffb32c980bf@ixit.cz>
In-Reply-To: <20260925-pixel3-audio-v5-0-7ffb32c980bf@ixit.cz>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 David Rhodes <drhodes@opensource.cirrus.com>, 
 Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com, 
 devicetree@vger.kernel.org, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1734; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=Z8qWthLOmn2/btoR+RRIL+/KcnpzGuSOEGEitmr2DFY=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBqtpMFwtoqCPHsE4uxyqouCuoLZ5wtZ+r8b3Gsl
 uTbZh6zBOmJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaraTBQAKCRBgAj/E00kg
 csZ4D/9ONMQvkNRXeBs565c4W2eZNFqkHnyWEZcY+3Nm2AahObwOvUlXlyy4r8kd8fOm5jy87Dl
 lYTGfQBEojGScxCI/x8Mge/Z5RWlWQAIXxvMz4p7rZ/BIYsyH8Fi8/FcjkUcwItXBbzDFlixv9d
 xVO+99JjMjirTv/TzpqJEFQpjEyImZHGM0luZwN6f6R6n7PKAcojgzbH+s3udOJGshqaZ0psOS1
 Jr+HmGkOyOQ8u0RA3cR1Qw2XTFX28cJDUop0rsY8MKUmy5nVkzoEIg547FKzg4wmYVHo3Jj7qof
 r7cAayWUGeVzQrkZg+hQU1LT97LrICsgp540l+Tw+jl8zQ/ARR/P/Q8zwqTgxTMtPwhfb9FRdNy
 Ej1d3+Eg0sF4nm+uAcsCjiOrGoWjvUWtgRT0v8q0/S8IkvkkhFt305pE3b2tD1sYdjkqvEyJwa6
 CltPLSKNW6+XF1cM79tYk5WOuqOhkHnU5FGeH3tlMDzheXaAbHwM5S+qX0KQ5EBkzdkc2eNs9X4
 1EPAiCk2h4I3E+RqKQyHhNJXW9ae9MvhcnDdp7LiHwyH2gmZ435a3k4/hGDjjakPlxaRn7IVJpH
 CpJoGdrVcbK9dVeJO4hlGrK3YXJGWvALOCRAqkPfOHRZu5nIY/Ke9PqTDC73IOw7r7V9HrH1QG1
 JRRdhnhSiY52QVw==
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

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
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


