Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05AE6370AC6;
	Thu, 24 Sep 2026 13:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790256252; cv=none; b=SLc1BUlKkLNwZSkiMLTW/IwDDx0+ZNfU6XAuqdZzguKLBZHUAS7/5B8pNLVkrEIdQEkD5hhasCYK/L9VCqNx/LqMMvB5vY1vgXcAUnXFC663dzVAodJseF0CmMyUoynxAsvQhTEab2pyC3nQr0L8qxy1L80Pzw8OdbZPXuONdpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790256252; c=relaxed/simple;
	bh=8HKNT4Quc+l1QMgCNYqlOsACz8lrus7AgcUoZu++PiU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LDVMFcZX+tMV3N5mH5GtdTHcZOfbMw/ihLByPrg1E1k11bgZXPCyorYZkKuzi+IiikOpKj8Ry7loJSol+M+0xwpjWCq7frwdWtXv+zHYF/kYaxgW7HHxSSYX1iDpRzXvhpfQztY/NEH2bRah0Cq5sR+hFeeRIe6l3xuDxGmNZAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OwrLSY9v; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OwrLSY9v"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 81CB3C2BCF6;
	Thu, 24 Sep 2026 13:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790256251;
	bh=8HKNT4Quc+l1QMgCNYqlOsACz8lrus7AgcUoZu++PiU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=OwrLSY9vI56s4318Lcx5br7R0bub1L+afX3IC47DV2Tn9pQtW7+k3SIAZD5la7/ib
	 aQv8R5yCTrtoeCN3XkWoY7gyPt8USP9urEEQ06nurooCGFhIU9k07UuIVz7h8SaNis
	 KvrF6+2HC0jLDKmXSPN1rUAu1HDbleKr3ey3CSH/V4ftKhm/SetxF4K835YKscmscj
	 8T+2hsiArd8oW/tWcOUVvQB0/e5/cTQPRCbOynDJsT4Xqk2IUMBEl8n62bpLITCXbL
	 iGeXiB84Yf6cNAE56uTtiEzBEz4yVLLoXIaIsmaywAjktIBeoyYb1AG4T50VdPMwkS
	 ROnr36xwpKLpA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63347C9830E;
	Thu, 24 Sep 2026 13:24:11 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Thu, 24 Sep 2026 15:24:07 +0200
Subject: [PATCH v4 2/8] ASoC: qcom: sdm845: use DSP_A format for TDM codec
 DAIs
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-pixel3-audio-v4-2-85b5d133aa5e@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1269; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=1wKqiBzByWUp0kGcvJt9kwURHXbEVlcog8LeXEB9/TU=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBqtSR4jPt9ZKXJeYAKOnW+n5uLQs82WEu/i+cHx
 IVbE5JGpk2JAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCarUkeAAKCRBgAj/E00kg
 cqD3D/0Zhb/JWjd61VMMecvW31rMXjYqIdKySAC2N36gc/Oi2/qp3W+MqeqW2vl5XvqsYbDQGFS
 WD6ingtZ19+E+Z4pdUx9xxi1zudUHlDeIO0WMZdGHBFsUhA6lCgJ/hk+E58lQ8j8JQ3zjLN/mJN
 ETb/HR7WOT4zUUr+OYyYjyna1jrLvnVhI37Bn6xmlk8CQc1Q88acWpYvmKA4j4n34k3CVselWi5
 6EK4q+6hlKBh7My6hzzyqvkN4zu4+oDGvVHh2F+kUD5bNyH4DOSCGTx2h+Gm0QpNBA972YJix+3
 eOphUbj6cw/ZAsCVt/EkMbQ+rhaegWe5syPn0xyA0LSf8zrKzzIQFCPwYeF+Jl92iilsZt0iMNV
 8R4zlNljU1l+SP6Q2+Ousw1Mgv8kpI/2dqXTnIp6GhUbbJ2qCMo4SEAXeLPjkIOZjZKz9nmc0gZ
 GwY/Lgllsxkmvu94l5OD4sJ/6x0iHsyif59qTmcs4nokvOnEzZYjRxyR3P7FY7SdgnUPC6bUhg0
 uSM2JV/RnaPZiq4VIJNxtbKcWrS+v5neeabR2CmtH3zr7vNhAbybfn+WGPDeFcVVfy3D6YEAFHV
 1SS+v0SOnCayI9XdE4XF7QiGNVnMfNSFOTex+Ug7jBmkQdOU/J/A7ORpDOFpgQdtjNOpnpmRu7X
 vuFsUNzCDxz+bcw==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

Before the DSP_B only worked because the only close-to-mainline consumer
cs35l36 codec was patched to map both DSP_A and DSP_B to the same
hardware register value (asp_fmt = 0), which is inherently DSP_A timing.
Use the right codec (DSP_A) which works as expected.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 sound/soc/qcom/sdm845.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/qcom/sdm845.c b/sound/soc/qcom/sdm845.c
index 0ce8265ab1c1f..d1cc825fc5cdc 100644
--- a/sound/soc/qcom/sdm845.c
+++ b/sound/soc/qcom/sdm845.c
@@ -382,17 +382,17 @@ static int sdm845_snd_startup(struct snd_pcm_substream *substream)
 	case QUATERNARY_TDM_RX_0:
 	case QUATERNARY_TDM_TX_0:
 		if (++(data->quat_tdm_clk_count) == 1) {
 			snd_soc_dai_set_sysclk(cpu_dai,
 				Q6AFE_LPASS_CLK_ID_QUAD_TDM_IBIT,
 				TDM_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
 		}
 
-		codec_dai_fmt |= SND_SOC_DAIFMT_IB_NF | SND_SOC_DAIFMT_DSP_B;
+		codec_dai_fmt |= SND_SOC_DAIFMT_IB_NF | SND_SOC_DAIFMT_DSP_A;
 
 		for_each_rtd_codec_dais(rtd, j, codec_dai) {
 
 			if (!strcmp(codec_dai->component->name_prefix,
 				    "Left")) {
 				ret = snd_soc_dai_set_fmt(
 						codec_dai, codec_dai_fmt);
 				if (ret < 0) {

-- 
2.55.0


