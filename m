Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794295020;
	b=Zdn9/+YGTzv84+BJpVxx6DZjRY/3+W9li6MsWpbFf6gpOGZaFizXtvfPbSUhqVBhjEHN
	 slaU/kru2sqPbTSydILxA8fSGRpYxRoNSTi+qRDaT07Jnxy6n6BIbkXfJokr6qE8Z+sLL
	 cff8rktzjGN3BZsBcthqto8kdyqgUl+rNl787NWbxrBpfSa26oE6ltztioMSO1q0XsFDm
	 D5X3Caj1/erqrddV4Vr00xb+NlBCp6LWICsZLOT6WGKexmi49ZR0EuIdh+i+mmeTUiEMf
	 jfgRcQYoDktp6sbZ2K+Rcs7G8hUhGCsAcoFLqGQjMT50HMvRZq6sXjaJaZN3GmMitRg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794295020;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=ulMPRdDVqUD3bn0qKBt2l3HbJhixA+Wy+sglqX1b+OU=;
	b=M04kBp4awxcMeg3ERADMecXEoIOCqXNNwninKPgctZmUdNWkFUNXXcy3TGHl3ZWkaL8f
	 URNKiGeyzNmxy3kwnbMLz/WmLW5FHO4tZwnqYDQnQxk5dGMqzkufL75tay6MMICmQxot0
	 Yr6ecNtOLp+yGkOMAn/m1f+cjwYLRGeXwIrSVtUIQ/3ohuV6tSLjsmGDKH0DdmSHiKurN
	 r6sksExnxI+I4y/5EGM5NwgPQpJPb+zg3kNqEQyw+pEheTFxArn9gN4gVHH9+jUl6JpRU
	 Aye17AOFzz8Hf1jtFYWxpKuS2yji+I+IwTNAiDsJ93qGqEaf1oQ+4v5506DVRB3MuGg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cxKa6zJI;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C2FD606A335;
	Tue, 10 Nov 2026 07:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cxKa6zJI
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794295020;
	b=Kpw4hL1mOhB3R2T0I89A4U2Rql7RpeiVmlGsmYPgYue8wrvc8ip9HB6kVp8twnuwnt/e
	 WagyQs29mzZpdZQWz30FZjErLekkR9lGl70dimiuYfWz1afxydDQ2G2IRwulW2cUFwNNw
	 3p0E6Ow3xWu9Y/3t2VTPYsBv0/SWmGQLxx20ZUT5GHnavmpXghsnKeC8uU+O7DxTkz6+g
	 wp3PnCuOzinR00rIFyo8tRosrDv6hTrkenVXhJsiFqSN/xyL6H11mxUtPnUmwt2OlkrzF
	 bvjWbFM4152WbQATBgBI7A6Zg5HlxZdeZRSn4AL/orfrcIDCfRwaTK2VftzFQ79XbvA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794295020;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=ulMPRdDVqUD3bn0qKBt2l3HbJhixA+Wy+sglqX1b+OU=;
	b=fnDz2iAiArWsGvLp98mkylFJqw7CFoKVXrsX+1ZxwG1TYPKyeI34EULKIfx5CU4VJWFR
	 2EjPZEtNKLEKuJQNjm3auOzng2HtmYkzmt8KXuYm+Shk7ShGYJwKSNABWD/I1MFIl5Ib5
	 KEItmKPtzzrqU0sYvvx47wCVFX1ecdEQPdECjm78vVtWT7+glGgMPed1aADI2TYjUy+Mr
	 o9Y5s4/Iq0IClRIDX4dBKi/GwWCpYSCGWeZC69rnlpA4JWIHcgtX9kw4YGtPrQZlYUSmM
	 fPmIMwRY/Mrx2OBWjjwhVnOZyrJoT7VNNMCuhjU1EECL055Oor8Q8mXOBOmzw6W5UmA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CFDA61F008A3;
	Tue, 10 Nov 2026 07:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794295020;
	bh=ulMPRdDVqUD3bn0qKBt2l3HbJhixA+Wy+sglqX1b+OU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=cxKa6zJIrLKWq3O9siKBkujX0EtlZfe4Whh1b4SCCmE80goZC2f6HXde40UDPG4/Y
	 sk2+HAFSY6OWWykSCl0IBiwZbSLm764+pKL9OnbRxp0r/5Cr79nf8q4w1nnHixPMha
	 oc2daqXGHWRecEPG4S3cmkxnvMOrUaIsKlHxtjd+xdHpP4EMmrVCu0D6ABWj6Fr+2Y
	 9TSV24D0XUE+gqCF52NDQsyw0W8uIpil1ScFWUqM2qtG/20agpEqcFITNiZHTJtDGp
	 QL7yCCGT8yZMmeNLa+obwATL5Pt4XQ/1HXU2cWyGW/CQgz2DCkfGGlMqIqj0W6oAjX
	 zJqExXW5J5bJw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 61CD848970;
	Tue, 10 Nov 2026 07:16:58 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Tue, 10 Nov 2026 07:16:58 +0000
Subject: [PATCH 1/2] ASoC: rockchip: i2s-tdm: Register the PCM before the
 DAI
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261110-asoc-rockchip-i2s-tdm-v1-1-f32951b3c527@gmail.com>
References: <20261110-asoc-rockchip-i2s-tdm-v1-0-f32951b3c527@gmail.com>
In-Reply-To: <20261110-asoc-rockchip-i2s-tdm-v1-0-f32951b3c527@gmail.com>
To: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-rockchip@lists.infradead.org, linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794295018; l=2286;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=18X4gDoDBalS2YNh4G/P0K7m7mnHS2iod12BwMjjV5A=;
 b=sOQmVjwZd4x1ZJ52gHSqxjkg+olv7zyeAxLb5RGz+5Kw1subi7A69KGH3veHzNI0V69UAsCPw
 bKN6z1fU26VDXVcLkifXLiwBYOdCGMIv3nhshlv+xOkEYy1reJ22w+3
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

A card that was registered before its CPU DAI is put on the unbind list
by snd_soc_bind_card(), and snd_soc_component_register() retries the
bind as soon as any component is added. The DAI component of the I2S
controller satisfies the DAI link's platform, which defaults to the CPU
of_node, so the card binds right after the DAI is registered and before
the dmaengine PCM component of the same device exists. The PCM component
is then never added to the runtime, runtime->hw stays empty and every
open of the PCM fails with -EINVAL from
snd_pcm_hw_constraints_complete(), without any error being logged.

This is seen on RK3588 when the HDMI codec probes before the I2S
controller of the HDMI sound card: the card has no "dma:fddf0000.i2s"
component and "aplay -D hw:0,0" fails with "Invalid argument".

Register the dmaengine PCM first, as rockchip_spdif already does, so the
card finds both components when the DAI appears.

Fixes: 081068fd6414 ("ASoC: rockchip: add support for i2s-tdm controller")
Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 sound/soc/rockchip/rockchip_i2s_tdm.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_i2s_tdm.c b/sound/soc/rockchip/rockchip_i2s_tdm.c
index 983319a538b1..0abd200a4268 100644
--- a/sound/soc/rockchip/rockchip_i2s_tdm.c
+++ b/sound/soc/rockchip/rockchip_i2s_tdm.c
@@ -1371,13 +1371,18 @@ static int rockchip_i2s_tdm_probe(struct platform_device *pdev)
 	if (i2s_tdm->soc_data && i2s_tdm->soc_data->init)
 		i2s_tdm->soc_data->init(&pdev->dev, res->start);
 
-	ret = devm_snd_soc_register_component(&pdev->dev,
-					      &rockchip_i2s_tdm_component,
-					      i2s_tdm->dai, 1);
+	/*
+	 * Register the PCM before the DAI: adding the DAI component can bind a
+	 * waiting card right away, and the card must find the PCM component
+	 * then or its DAI link ends up without one.
+	 */
+	ret = devm_snd_dmaengine_pcm_register(&pdev->dev, NULL, 0);
 	if (ret)
 		goto err_suspend;
 
-	ret = devm_snd_dmaengine_pcm_register(&pdev->dev, NULL, 0);
+	ret = devm_snd_soc_register_component(&pdev->dev,
+					      &rockchip_i2s_tdm_component,
+					      i2s_tdm->dai, 1);
 	if (ret)
 		goto err_suspend;
 

-- 
2.55.0


