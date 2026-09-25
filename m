Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A16C24CE680;
	Fri, 25 Sep 2026 15:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790350088; cv=none; b=XyFwu5VnsAqTNMBmovXashIGI0236WFFQOkGcPAS8arWvA2PZ7nXYskm3kKUZuzHaXR63NwrKT+GE8DfjM9+R+ZE2axtzwcD2tou3/wCVMqFDrk2PY22IUZa/EUrKIXnf0FZSXHqKVJaq3LKnKkrA1bBJ0A2cG7h48XmkLSD8lM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790350088; c=relaxed/simple;
	bh=lQMP4/RejTgczBB4UXi8j1fQiVJCo6nqN+G84Ws9O3w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sB/slZLnHhPDv7uakjXOqKz2LXToAo0jEpBcilkIn6V6dL8MhslZrRL0eXfwLkpw0bYL2grl+y4sgr1jBueV0zwy5keITV3fIcQfcyepdhaA+t+QY2mbVYcwNL8cYukl/v8bOhmgHs/x41KbGkZBEjHD6EsibrcbVl06SI9+y/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bletY7u9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bletY7u9"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 509C4C2BCF7;
	Fri, 25 Sep 2026 15:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790350088;
	bh=lQMP4/RejTgczBB4UXi8j1fQiVJCo6nqN+G84Ws9O3w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=bletY7u92RyNgyynSKaEQPEEXMejlF8DHIQIV+Z5g8Gvi5Dk0IiEhKiXyV1YdmWwW
	 OkTc+lpteE52zcHg1hhH5NMb4u6B6ytlSR7yB0jJM3kaslQJ8konbqih7udlJyAqqL
	 yZJWxT1R7Thm1ROykpMRmJo+OrdVmz7vq9LLIt6Lw1XCG6RO6hXBPt9Tk/SLBT7KAf
	 yDIwOKr/Sr6ONNSlc1QWCcJICQ+8BZSu4bLdpxwAb6ZNgW5DDwpLQzXCp+el+gudTy
	 1mHhc2y6fhfvX490kRitex49QmwssY/MjsLp4q0JwQKiNndhpT78etQucrux41bpIu
	 +5cE3hP22jtoA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EB57C9830E;
	Fri, 25 Sep 2026 15:28:08 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Fri, 25 Sep 2026 17:28:03 +0200
Subject: [PATCH v5 2/7] ASoC: qcom: sdm845: use DSP_A format for TDM codec
 DAIs
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260925-pixel3-audio-v5-2-7ffb32c980bf@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1394; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=XFtLmu+b3g8wRb/J2bbp/2wXHNURengB7rqb1bBnuDs=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBqtpMFGNJVwvAsSowOISIt+TYBLqurxvvsuxipn
 sA3jGa0iqWJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaraTBQAKCRBgAj/E00kg
 crSsD/9mM3cqrwaphqgoK4RgvUhXy+NXp4zPrPA1LpoSuv7mkwbz6u99oVmHCMdwXHF+KSZXsYd
 0JsCbttw3L9pICEnBbg2Cb68QjXLiy+q/6l+CbqlbFhbU80H1sKjg3JChSZExcivXjmdmnl4xs6
 j0vuKQGuLKyCxKERF8ygn4swzIuhPAcSfAKMnNp3wGpHZLzr/C9Vuqrco2SXnSwfK5AjCPNNP7B
 C0hWWHH8uRInJDz/SPbx9TxWl3Gwcai8tMb85h+yMHR0xIeeEDIPYEqwlwD3Zm7qBqWneDXZ9Kn
 4rF3BX+rZ6/bB1/CL/V7AjPIo2nWcKuEe9L5Jcp1NH8VpLd51xf7uDOtI9iU0IR8CGKyDeDfU9u
 PVFAiZirnmq8jSOJCi52bX0JmbgwkyjWWiUc/7zCis1uf5tPu1V6y68otovMmn+fT4C7yFdhYlk
 1aNyVtdbGINeN8UJEkpA6qe4pcQuRW6vuTKlQ8lJc+XG66wwG8iYBkusM2Tx65FVThREMDeKOi3
 GRUrW6StK5Iy3w/Skye4Sha6ryupz8aj9rpowpQ8mFDM2lDoDrJqtMnt5FDCwXImZjY40RbL4+I
 FGg08/XoIE5bx+wu9sS8mnDQwrcBAXlVCXCok6KPk1RnlIHQ7IgY88Vwt4D0RA+PJb5Md4urdBo
 Wrd5v3yM+JsJO2Q==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

cs35l36 set_dai_fmt() never accepted DSP_B, so old DSP_B was broken with
"Left TDM fmt err:-22", not silently wrong timing.
cs35l36 codec was patched to map both DSP_A and DSP_B to the same
hardware register value (asp_fmt = 0), which is inherently DSP_A timing.
Use the right codec (DSP_A) which works as expected.

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
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


