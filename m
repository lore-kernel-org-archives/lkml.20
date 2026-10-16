Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E5573C1D63;
	Fri, 16 Oct 2026 08:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792138470; cv=none; b=p4B7bsAWwFN2ccI0WVSLe+Zg74Z5S1jv3JdxhDq7EQsMKkoYJ+VXjXub5SDh56S8ZTZA7Rfu1O4/qGbAgafpCrxM64F/A5suNwL6Yx30hBI1G3MR4t6xZzN1eapRACRPlVEbo7F2Pho/uelCtqXS2UX/tr+GibmJqlhsuf4bVgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792138470; c=relaxed/simple;
	bh=6MzXY6URcuyZMGe9mH9bcydnzkC4AGYAyCDj4+DY9rE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Yj1nvi+6NYomaQVUQj+0lkY7jq6z5pAT6qiGOPdzGsvZErncZpHXK8TOKVetsiZ6ChZ8WJzbGJimuvewaaV2bMDyNhyOzjH+eaTg9UbYsh3zMoueidMkFNVE0oOiKxSgHxArT6rRx2DLKLpIuikQbt4GZHmrMNRFdLLtKJ9A2kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mMCA8c7+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mMCA8c7+"
Received: by smtp.kernel.org (Postfix) with ESMTPS id CFB05C2BCFC;
	Fri, 16 Oct 2026 08:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792138469;
	bh=6MzXY6URcuyZMGe9mH9bcydnzkC4AGYAyCDj4+DY9rE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=mMCA8c7+7OQUi9TopRTWXNRVcMFFZ+I8byPWFUaWakF503vQHPhFeDaDzrBm1TZFI
	 hCSaBoSfuaI1zqVATP0dgJKLwmtwOg6wgZfxwVoKq3qbDcusZZxGCcuvhb23ck31Jm
	 zc7nk0jdFEcu9eZdHIxuYi1YxpcBlx/ruD9hiqFqYo3kJwONHdmxDQZfyk5wJA+i0F
	 CEmelynrJbNP7JQLnVnejxlfuIJ6xpnoxTg8S5MW1RQJKygvlzKWLAXwqjzIlFfdfl
	 I1yM/y9vhjefoR8OYgfwgp7D3byF3KgoEnc2R1dUa9JBWxqfxY9EJobDH0YIm/1KfG
	 YbG8lhgZTWazA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3361CCA462;
	Fri, 16 Oct 2026 08:14:29 +0000 (UTC)
From: HuskerMinion via B4 Relay <devnull+mocker-mug-unwoven.duck.com@kernel.org>
Date: Fri, 16 Oct 2026 02:14:02 -0600
Subject: [PATCH 2/2] ASoC: mediatek: mt8183: Fix UL1_CH2 I2S0_CH2 routing
 register
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-mt8183-afe-fixes-v1-2-f0db51e0c073@duck.com>
References: <20261016-mt8183-afe-fixes-v1-0-f0db51e0c073@duck.com>
In-Reply-To: <20261016-mt8183-afe-fixes-v1-0-f0db51e0c073@duck.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 HuskerMinion <mocker-mug-unwoven@duck.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792138468; l=1450;
 i=mocker-mug-unwoven@duck.com; s=20261016; h=from:subject:message-id;
 bh=mEWhlclh4rsOZ/4zrF6u9RE5QWi0z/CRm0Rz/ciL1HE=;
 b=6YXlyoF5BZSa8qalNwQEhwPQZX15OAoWl6Cwl3SmMzWojxGvBMbRuyUf4ivpDoMJbSHk0bkXW
 k1493RQj8XmBmDpzzjLmThkLYOaOUD56lijYARzfS8X/I4voQADCpZL
X-Developer-Key: i=mocker-mug-unwoven@duck.com; a=ed25519;
 pk=Q7l9BnP4XnFimCK28K+NVowcECqTaJNXicdBAInot0k=
X-Endpoint-Received: by B4 Relay for mocker-mug-unwoven@duck.com/20261016
 with auth_id=1206
X-Original-From: HuskerMinion <mocker-mug-unwoven@duck.com>
Reply-To: mocker-mug-unwoven@duck.com

From: HuskerMinion <mocker-mug-unwoven@duck.com>

The "I2S0_CH2" switch of the UL1_CH2 mixer writes AFE_CONN21. That is
the interconnect register for UL1 channel 1 (O21). Channel 2 is O22,
which is AFE_CONN22, as the "ADDA_UL_CH2" switch of the same mixer
already uses.

So enabling the switch routes I2S0 channel 2 into UL1 channel 1, mixed
with channel 1, and UL1 channel 2 gets nothing from I2S0.

Use AFE_CONN22.

Found while adding UL1 capture routes for the four microphones of the
Amazon Echo Show 8 (2nd gen). That board captures from I2S2, so the
I2S0 path itself is only compile tested.

Fixes: d232591c9482 ("ASoC: Mediatek: MT8183: add I2S2 control path from UL2 and UL3")
Signed-off-by: HuskerMinion <mocker-mug-unwoven@duck.com>
---
 sound/soc/mediatek/mt8183/mt8183-afe-pcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
index d6175da3b..2b2ee0575 100644
--- a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
+++ b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
@@ -301,7 +301,7 @@ static const struct snd_kcontrol_new memif_ul1_ch1_mix[] = {
 static const struct snd_kcontrol_new memif_ul1_ch2_mix[] = {
 	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH2", AFE_CONN22,
 				    I_ADDA_UL_CH2, 1, 0),
-	SOC_DAPM_SINGLE_AUTODISABLE("I2S0_CH2", AFE_CONN21,
+	SOC_DAPM_SINGLE_AUTODISABLE("I2S0_CH2", AFE_CONN22,
 				    I_I2S0_CH2, 1, 0),
 };
 

-- 
2.43.0


