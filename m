Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A17794CE681;
	Fri, 25 Sep 2026 15:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790350088; cv=none; b=dHk1aGlEpcbY9ONXrERLZH0qKAI2o+rmu4ypaVb4fm4tuhKgraBc4tv6fkklXuKUzepumJF4dh4r+SuILF1fWyrcSwvid1SR78zce66AhG1C43Bd4XjFI2JjgLu1laXPmdyeHJ0TBXIHDKBbDLl+VPkv7kweGqhT82XwYouhIEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790350088; c=relaxed/simple;
	bh=IYoA1cg8+/C/GmFktSMjB5+j4IZ/5Pj7xCHsaKvuGZ0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mdO22uJ3vLUeMxejShUpNk0COy94RnqJAtDIkwPXlfeLhp0RlRkKLX+LoUFurZB4NZa0TR3hVjZ/X8DWdwC0IK+Jd74MmSJ6akWPjr2htiwwPP/EPhaVT1Gq9VBTFoEkvqe+2AtG8qMIZzuyMWLUhjfiFGh6t8YpTbFbJdXW1WY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VRKZfi/2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VRKZfi/2"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5FC89C2BCFD;
	Fri, 25 Sep 2026 15:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790350088;
	bh=IYoA1cg8+/C/GmFktSMjB5+j4IZ/5Pj7xCHsaKvuGZ0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=VRKZfi/2Rsjwx9+txPjaIVwC5HheUQJM9a881CjjC4TzYgyEt80UPPZDQTC5/N/Ga
	 M+wyjXDl2Ai8bLfVdrYtwnbBMRmbaA7ZHF5eyNr6lRkM9CJ94ylbE5bpf2FSq49VDz
	 AO4rvRfIkcdfx8Ast2QKLSYyfQgik4c++OgkpoAqg7w1MqbnbO9aHKn3XeDAVrJJPL
	 5cSMco7TJ1qVWXUz0+8Nth4z5obaUFA/T4JbNTGLoWpf9XxDcSHvxbOszbDsOIBoRX
	 Xn49FNpAJRIeAX82sn9SFBXBmDN2sqf0sCLf7zGDLS9cxooQN6lAUcTRoz1Vv86BNN
	 ptXh0eiZphJhQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43567C9832A;
	Fri, 25 Sep 2026 15:28:08 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Fri, 25 Sep 2026 17:28:04 +0200
Subject: [PATCH v5 3/7] ASoC: qcom: sdm845: Use per-speaker RX masks for
 TDM slot assignment
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260925-pixel3-audio-v5-3-7ffb32c980bf@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1712; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=14A2phcTaq+n5b5vOgbuu/Iv8VqqmG6tBsmNAD8ddoE=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBqtpMFvDo534yviiiVsnPJ82ZpF7xhVWf90jNPE
 3KmP1yqV36JAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaraTBQAKCRBgAj/E00kg
 cmlyD/9PhzS18ZH69Wc82yA4rsly/gtlTFO12SlAfU26bAZxsn5GfCWR9kcZCguMbgNi34WcuFk
 476QMrhaTdMbX9RbXMhrwqtfWQ5fmu5xy0ERLBmoDu9AH2CUrEDVsL8Gu9ILLsB3de/641+n/zz
 dJe1Wbi/rSoto+rC0q96e0Lyq+44EW+5YOtMwQWyWpVpVHnmedDJYZZadOJBB7yoxaohFpwYVUP
 XsbJYq92eEO5D4aM97QJbCj9eourUgVAubXLZPXb72I3ZoqKsOqI9nj8c+8HBtnwcabGxtgxaoi
 ji4TrRcolsRkXFSpYJJ7a4JGRImwOLQFxiRJOMifuk0BYowDXesXlpR61yQVirHmXJ1vtHsiEkB
 z/JSBtHXGQBzt9zMadVlV6iyfxpSkhIffah4GmDkmitu5iFbHnNbBT5K5FsM/SooQgMmWvq6nTC
 KbH4KMZOsY5tKTIHLian2yitBXeDpG6M3yJiCU4vIbkcUdhAjbwCYYOtt39V3gBtw3ed++cd8L3
 eVdpTvwyuRlwVY0D5lyfWIMkAXehxReRqe9xcql1E0ziH6d/gh4w/ybNDY0ZChMxPbITZOcQJew
 nyvw4Z6vll02xAveUe99I44lnz5aJ76bs4Wp4zTLFUlEWSuBKbsmyRMOuq120+cZh6OP9UAX6UP
 lUlcQeImLnttTTw==
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

Assisted-by: LLM
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
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


