Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07C5348592F;
	Thu, 24 Sep 2026 13:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790256252; cv=none; b=n/asgS0ylFaN/8QpyN/KnFYfsuIFpdHB/BpgnQHOwa9ygdIDHSzA2ppo8GMVw/K40KU1cWizvqoINVtaDdbyWk47xEASfhc4bXn78vmlSJFvU9Jft6wBQA08tXMCz8La+jOjoaqO6etOoPFoidrV+LiApnSL48VWs6v776ELhIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790256252; c=relaxed/simple;
	bh=chfMDCvu0jGCv2MFl8WIbjOdk3NN3CN5sXF+rwFeDmI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jCld9Lc7GfBfeZ2TlXY/iNRA3zgsnTWSEKbsnNYNtvg6BlV3c7JXP8kUaffNWgD/W6SNipW9DjJM22PsFrQoPD8gHh5lwfAct3e8UoJ7H/GgVvNVKcvLsQAKdJFY+h1Bv/ydlrx5MFAtZ7ilqIOgevHq94aQpOpsu/+FX1aky3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NzGCNckP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NzGCNckP"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 96DE3C2BCFA;
	Thu, 24 Sep 2026 13:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790256251;
	bh=chfMDCvu0jGCv2MFl8WIbjOdk3NN3CN5sXF+rwFeDmI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=NzGCNckPOT7ks+XDr2nSmLq+6IX91PvFGOrqaUZZxzzuZUjckcvNdNg+KBMypFoKQ
	 YFvwaWk43p72xKZnhjBfy1mYFpLGqFM2hXVATUrFMd75QI4zmAmJMECwWNJb08VjCv
	 FEFOditjNpdUXc+R2FFIGV5UQgKgDheF/M9wm2I6fgtrtLVhkGzJ6skNlta6QDkuV/
	 2g71Ywno6869IuhbQMAW5K0Frj3Q/I5nG7R59ooZz+3Dv25kzphUqUcQzspjT0TeJe
	 aiQbDK/OHCnGqEnmV7A2qecSgD59xyuv3D+G4pXUflwwtudhod7oUgFLIIwCHyYnal
	 GMcgyvyEL1gBQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 843FCC9831E;
	Thu, 24 Sep 2026 13:24:11 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Thu, 24 Sep 2026 15:24:09 +0200
Subject: [PATCH v4 4/8] ASoC: qcom: sdm845: Set codec dai and component
 sysclk during startup
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-pixel3-audio-v4-4-85b5d133aa5e@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1661; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=sf3oRG8KF1GI0iFA9IGZLcdnFZs9OCe5HnE3apZFGXM=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBqtSR4jHp6WepnlLUvnPkQ4vYvD23ItatqXwOzV
 94K80GjfHaJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCarUkeAAKCRBgAj/E00kg
 cgvxEACPxAUG32SYTjSSVfPdc1/sjvSokMTFEeOz8KiPqF7A+ljz1zCw0kfrmbaD5wrOz47eMMj
 cURtXYtwX0TLvmz5b5T++WCuz/Ns5GaVrsiVrei0a956GO12vEt9763TohWKIhGujfJAsZoxWpd
 pCYN+E6y/KV2YKvn7r9xdjMxhhx2gTORaeJpbhn9qY9vsnCfe9yiiHlVTsdSHlWm7k+DRH2Rf5u
 qc6lWiXo1tyHnUpYdyzhXv4VveCpheY8Ou0cp+IvLnFtA/mrdMuQbxgw6AdJxaL7sx28ueTUGb/
 bI/x6v1SIZvvBZ5CLLKs/P3gZY1H4wfVS7FKtGICzeZWqz5NNa5kovlk26posi4rowzcf5ygy1j
 GEfnBRgM5rEcnfmRGb6btaT0Qadb8rba1OoP/AnA1jxFwA1DqSkt485ldQKxE93oAOx+XjvPit5
 LWzarVlh57Iw3DRJqWBrffAgHmo+avIj0D+VRRF8CIulsrQkq/Y9rYJFbI35rnfRBp3mHkG69pM
 GLtMm9XB5GVxMbBE3JchjsG7Aj/ScY3ZjQN/BL+u/T9Wmh/hs9oo9cSyUdbNYqOQxi3wbDeum9C
 ++mp8q/u+hgKBMAQ+4qTd8d/7n/7FYpXrudNZBh3Css33YsyD1wBFKqkoDIfcA4xKGpqhtiHQD4
 TU5yJoszg2TDc1Q==
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


