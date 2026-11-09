Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794263640;
	b=dqnjy7e3eJxP3sc9sfEwXLN1DOGQvl7kcQLotu4dKE2Juwk2KYlUU+DaOO4arl6sqz7p
	 Me4bYIKdjbvbxF3gvgbkBoiO2T2Oe1M5/Y0MF/cgUWULCp6OaTODYRqyTBQkKCMvPwLIL
	 L8NlGDs8Tx5x5zIv54wkpxnqDVQQg7CfQN48RiIOSiAcl/Rz0PMzN3LMtykjXOm4Ikp4q
	 WBoVKMC9RVnfVo/Wdk8FK3hpqsVAt9stB2btPQddxTK8A6Agq3I52X4vkRFamQMT8D8Ip
	 T7QWE2tR3QJP6GmB0W+07R6OFj630sy8fhTNnWcZsVqlktTzZqvAI0AaZI9kPOn8OXg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794263640;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=1CsRf0YcuKzwMQXsUZyEVhrviRIPm5xpm4F4SF276F4=;
	b=jdBjonAgBvnAPaYjkLvTrkFh0lURpooA6dEQ+7WSN8TnQycBpRgDwM8wQ5Zy+CTPUZ3/
	 KN/13z8w4Q93IG035p6Zcr/BH0rkqrRWR4OUIorfP8DEcf89IKb1KeSubyiYOOTgq4L3L
	 ebm9COklz9MvV2I4kSVvzr4BrfovK6fj2+eH8Mx6bs8gV3U/RzAKVrxDk13je13odlsbi
	 oTFep/mYJly7AMTPt/q0WmB+G1UHZPeulYHmY0eOOdVOXxP9gX4flDCz6J1CMCZDYqn1O
	 v55Ki2i4e8H+07NU8TPD0gc3Qu2nvDBHZ5kRssRcJ0YtwgLgbNx2twVmxkoUmFkR9Qw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eOvjwA2y;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97223606A31C;
	Mon,  9 Nov 2026 22:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eOvjwA2y
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794263640;
	b=D+AUuAM+VjH8V5oL7rCtXphVcys9ox+tZRwpltcVeOR5uJFTSE3UPvclF4+O7dklBjqO
	 zGquxu0lUflGdS4v3m8/4aWFExq8ByvwUak6S/wi2wXAZ1aD2vuzK3rr5bcjCFFhGjSVS
	 SSDcZMuEyaByxT6GdDXWKT0PDcGGWhpgesRJRQUjoVGfrYq3ZF4xYmiOiPsWmjPTAbzg4
	 djd/nxuGG9NO8UpH04qik1d9mQrlh91LFC9T771kpRc/cCACdnkPwl0sYoEHUunS9B4S5
	 wXUhfmeqMVeIgtoCy6gJkk+4ErVBhRqcpDDZUGLpb5AB2zWM6fhTucdxP7LYGqlN7jw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794263640;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=1CsRf0YcuKzwMQXsUZyEVhrviRIPm5xpm4F4SF276F4=;
	b=X7XDW+Z07MfGoQ2tlpZXp2ronEIwR7Zr/WjtZWqwsgIwPEfEfduNOd3OPMziF6BwKHAj
	 8fERHmoD4ZAKWbYwJAROMAET75nHDdDhei/gJVwHNCpVgInGyyJaiKIdwlJ97yjLlWh4Z
	 NG4El3H0GL2hZ8fN4kLNzumP/ns6hW5M1NoZlrzoLAzX5Q/iNrBUUnDLXSc/AQEBncHwt
	 LIsbvYfFESMQRFo/tJjIPrjgLAXnzeKJDOm9iLC81PguCcM83ukKXO0DDHNJ91+eC/+iF
	 /Bos1zRkXq+17zugfezI69wXhXXPy4+cdJrajl1voGR9EnhVZGdxeOdehb+MCkED4YQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8EEC71F008BD;
	Mon,  9 Nov 2026 22:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794263640;
	bh=1CsRf0YcuKzwMQXsUZyEVhrviRIPm5xpm4F4SF276F4=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=eOvjwA2y0CGm1NgBkRiEtZXpLkbJh9d7VvUwBZegauPqUVGd4vf+2mbC5Okt6848M
	 AWet1hFWPdWp0p2VCaGbJuQmJI4ZiicgrZKipFO6saGJToD+oBYTTIaJaokCy8TilT
	 NsSxrpfF6oQwfZ7RHRz98OkEXEKDjKrm9QbKp4x4ujhKG+xUvPBJVvGnDrWfl5k0/9
	 6QJ3rnU3ha6nuIixJOTTjTWbSzfY+VE+UsWXAUOuwdci0LuGHXxbJd75tpozsNVPaX
	 6Us9AdhBtPPrpsYclo9OAePUS+riQKALblO7fRj7FNYb9I+yCLcm522p+pSjWtLD3S
	 YiU3udgMy8XlA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 20489486B0;
	Mon,  9 Nov 2026 22:33:59 +0000 (UTC)
From: Gaurav Suman via B4 Relay <devnull+gauravsuman007.gmail.com@kernel.org>
Date: Mon, 09 Nov 2026 22:33:47 +0000
Subject: [PATCH RFC] ASoC: codecs: wcd934x: keep MCLK enabled so init
 writes reach the codec
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
Message-Id: <20261109-wcd934x-mclk-v1-1-ab86342e7ead@gmail.com>
X-B4-Tracking: v=1; b=H4sIAEpK8moC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQwNL3fLkFEtjkwrd3OScbN2UVFPLVEMzEzMLA3MloJaCotS0zAqwcdF
 KQW7OSrG1tQDvN9SUYwAAAA==
X-Change-ID: 20261109-wcd934x-mclk-de59e1646807
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Gaurav Suman <gauravsuman007@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794263638; l=2522;
 i=gauravsuman007@gmail.com; s=default; h=from:subject:message-id;
 bh=8u46K9MtmpC/yZH7MaaIGPTHQMOfd8OqvroqTAoIDKw=;
 b=w+dOp4lUMyGty2jZoxIvNtUcRjLUY05x9zhThT6au4LkhC/wFP6g5GWXIChw8BlQKGNbG0/pF
 Er7ssv0G9cDDRWxrnPbWM27XRwHOTpM9thMIDASkQgg2xY3u+SAXMii
X-Developer-Key: i=gauravsuman007@gmail.com; a=ed25519;
 pk=lnUC0mQfc0KyA0LE73pQ4+QWYVRaCD8Sd3XWxLZO+JY=
X-Endpoint-Received: by B4 Relay for gauravsuman007@gmail.com/default with
 auth_id=1467
X-Original-From: Gaurav Suman <gauravsuman007@gmail.com>
Reply-To: gauravsuman007@gmail.com
Content-Transfer-Encoding: 7bit

From: Gaurav Suman <gauravsuman007@gmail.com>

On an LG G8x (SM8150, WCD9340 over SLIMbus) the microphones record
digital silence on roughly half of all boots. Register dumps look
correct because they are served from the regmap cache, but the
writes never reached the hardware: the WCD934x digital core ignores
register writes while its MCLK/sysclk is off.

wcd934x_comp_init() runs with MCLK off unless the SoundWire master
happened to probe first and enabled the clock through
wcd934x_swrm_clock(); __wcd934x_cdc_mclk_enable(false) then leaves it
running because the SWR clock bit is set. Probe ordering is not
deterministic, which matches the random good and bad boots.

Enable MCLK before wcd934x_comp_init() and leave it enabled, which is
what the good boots already do. With this change 8 of 8 boots had a
working microphone (before: about 3 in 5 silent).

Enabling MCLK only around wcd934x_comp_init() (and disabling it
again afterwards, as wcd934x_enable_efuse_sensing() does) was not
enough: 2 of 4 boots were silent again, so later writes made while
the clock is off are lost as well. An alternative would be to mark
the cache dirty and resync whenever MCLK goes from off to on; this
patch takes the simpler route at the cost of keeping MCLK running.

The fault was found, the change written and the boot tests run with the
help of an AI coding assistant (Claude Opus 5.5, Anthropic); I reviewed
the change and the test results.

Signed-off-by: Gaurav Suman <gauravsuman007@gmail.com>
---
Tested on LG G8x ThinQ (SM8150).
---
 sound/soc/codecs/wcd934x.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/soc/codecs/wcd934x.c b/sound/soc/codecs/wcd934x.c
index 0ed24cca088f839263f015778e8281027392e51f..6b6ce5ba5d30da194db1b1570a58f0324956f96f 100644
--- a/sound/soc/codecs/wcd934x.c
+++ b/sound/soc/codecs/wcd934x.c
@@ -2995,6 +2995,12 @@ static int wcd934x_comp_probe(struct snd_soc_component *component)
 	/* Default HPH Mode to Class-H Low HiFi */
 	wcd->hph_mode = CLS_H_LOHIFI;
 
+	/*
+	 * The digital core drops register writes while MCLK is off, but the
+	 * regmap cache still records them. Keep MCLK running so the init
+	 * sequence below and later mixer/DAPM writes actually reach the codec.
+	 */
+	__wcd934x_cdc_mclk_enable(wcd, true);
 	wcd934x_comp_init(component);
 
 	for (i = 0; i < NUM_CODEC_DAIS; i++)

---
base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
change-id: 20261109-wcd934x-mclk-de59e1646807

Best regards,
-- 
Gaurav Suman <gauravsuman007@gmail.com>


