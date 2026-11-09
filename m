Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794247026;
	b=GmlkmsM8Gu8Ipev1gyeRFrpry1/kuf+XwhBNzH6dr/id7QHaXzfaQpIBMVl9wxA6LSf3
	 F/gJ300tfkNP8TnIotLXah6OSh0YZSkXmp0hTT5CY4eexEedvAbP7qOJHJ+glWy115VTU
	 1e15gty1BH2JO0oCl1HKePg9pnj6LPrMUUmYV66JVTB2CvfacLZsfmhNVmB0CmoZq9n6O
	 VanD0+q+dHuk1NesmAcW9s85VUdP9gnnd+FtWBI1p2nN+rnDeptPkt77NeatwtcFI+V8c
	 DIZLXFesz+U/rEI1dF/Vj4Ttquyd2gJkv4KCqk19khsQHtfHqlQqVvIt3C39L/7Qz8w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794247026;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=2JSos64t2y+8eVUperubHqwsQe5zAN1CYXXEcxe+JOw=;
	b=sfaD2ci6sZdEW5xXnd/m0lVHt15z3ic4KTX0OGHoA6JEiruA7/kspiYpJHAQLcEdbYHu
	 rDm+3FtwyO2uneNgAxoiADr/PAXhX4EODbwcX4TSTPLepAWAJrTK9KMDmobvWbdHvbwRr
	 roA4Ta2Qr8leewWMhco1zmNvE7lhkvvP/XkVNkKgBxuX4R5BfF/401Bi6UqemSX2o83q2
	 AxTc54PygGZrmLsDMUpCSAiTg5pLRRkC2ZS6pwRElVwkVkunlQdGMFj2E0ufP6hPa1osP
	 W2/+cuYJKJCD1c5LGC7F/HCFMzEp++TO94ML6XWoV3PP7AxMP60ANp94Dn+/QtHlkEQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="ALTDXv+/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D8EC606A31C;
	Mon,  9 Nov 2026 17:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ALTDXv+/
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794247025;
	b=Yaee4j6FRCLxay/gct9ShWgj1uFGWptxgfeCuRfbsaTbZoIz6ejdC5USGZvM3eJ+f8rq
	 U6JqB5feFpPwprHv7IbVb42c4EZ/JBrkycSNuV5ztv8jp9nuAvhBzG2lrHqFuwctwvtdC
	 2BMkv3HvSEJMNwNeBngy6nhU2xWNm+3TCDakxbD102AVNPSLAApQYwGtx6KZbwrupjlQ+
	 cFN2AZkqDa61gX+/ip8HPeZNO1kMR5wibKgbZkdnD5HOTtxbPOdTRGyZ36kdNARh6Qweg
	 lSBp6cdn0Z5tMwAVaOEltsqXKq0lYLharU+nkA3eQBnOyT3v1P1GNNdrekcl4ycyA1A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794247025;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=2JSos64t2y+8eVUperubHqwsQe5zAN1CYXXEcxe+JOw=;
	b=mJtOnw7DKr/igdOXLqeawIbODtoevJI6TfUoqN4qtsiRcjbfJIcs99n3lzu9XYFMigDW
	 ph+8hnVBTNtJh2ekmawJbF/0jenzN0MEsvcM0tvtIx79Dyi65Wx59ASwzzutv6qf6GYah
	 DEd8MixveDGmIVdw6sAuuV81QcMyNDE8ctQEIukABtfhMdntnsIc/y7cdjklVlyn30pBN
	 +ZM8msxt/vEA5Ox8xXy/5qRFrdd+WuQ0x2o+sHTNZJWhyXToM0vGqkK/8+OgSVROZxTko
	 be5cWsp9Ni1hM5OSqLNCX4oLJG9LmcmaEGuw28ghq5AksqusOtjvlD1Kqhb4R08YyTg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0BF461F008A1;
	Mon,  9 Nov 2026 17:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794247025;
	bh=2JSos64t2y+8eVUperubHqwsQe5zAN1CYXXEcxe+JOw=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=ALTDXv+/WGIDvpeglzx45zXB2dM8icnK/fuZMgYlos+Ab3Oka7k73aJUoRyGXLJP4
	 5y+Uxp/2Mo0jd/biBVvntOBJk27p4W+YERBsTTwoocYKtTWn131qHU3e3p7DG+QXDe
	 ACHPFbtrYR0rNsnWZ0TdzbHHKry+/VNJCMyTFQ/FymLMdyqBpF7jXEANY9zZx/q0wE
	 N3FcZ0gVvrPkEUY6QVSFVa/eup7GJFOP14z4EuoUTGtVh6e3WvCtzmgGTppT+u68Q4
	 l1QYpfIKmKFsNnR9Gss6v0JZZ41GZFqR5vvHvxiRNW3I7tJpbaaoMCTJwm8/rSl9Ze
	 iGYvSRp83mo1A==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 5EB254859C;
	Mon,  9 Nov 2026 17:57:04 +0000 (UTC)
From: Ricardo Rivera-Matos via B4 Relay <devnull+rriveram.opensource.cirrus.com@kernel.org>
Subject: [PATCH 0/4] ASoC: cs35l45: Adds support for brownout prevention
 engines
Date: Mon, 09 Nov 2026 11:57:02 -0600
Message-Id: <20261109-cs35l45-bpe-v1-0-9d7bc95a90a4@opensource.cirrus.com>
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
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG4J8moC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQwMj3eRiY9McE1PdpIJUXWMTA3MLg1RLM7OUNCWgjoKi1LTMCrBp0bG
 1tQCfyX8bXQAAAA==
To: David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794247023; l=2099;
 i=rriveram@opensource.cirrus.com; s=20261106; h=from:subject:message-id;
 bh=PtyzFMLYZ2W+DMpbpRtm8ckdAT7wzVIuyr4J6iCsXHc=;
 b=JKz/iV5I1OQGOI3J+aP4R6qwPniwE64mXmsM4v8opWLqKNVyCJD8k1xxR+sNjKfbZZjhT4oSY
 xkkuc2437obDbq+Zti+z3//bHQFryjkO7dLVHD0WEGykZY0LN6u7i6Y
X-Developer-Key: i=rriveram@opensource.cirrus.com; a=ed25519;
 pk=k/iAEAtSPXvaWRDFupudzm6His7B7iJP1uiZ578a7Y8=
X-Endpoint-Received: by B4 Relay for
 rriveram@opensource.cirrus.com/20261106 with auth_id=1437
X-Original-From: Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>
Reply-To: rriveram@opensource.cirrus.com

The CS35L45 amplifier has two independent brownout prevention engines
used to prevent system brownout events induced by transient audio peaks.

The amplifier brownount prevention engine (ABPE) monitors the battery
voltage and applies attenuation to audio output in terms of either
decibles, voltage, or wattage. The ABPE response is configured across
four thresholds with four corresponding attenuation values. The attack,
hold, and release parameters of the associated limiter are also
configurable.

The boost converter brownout prevention engine (BBPE) monitors the
battery voltage and the current passing through the inductor in the
boost converter circuit and applies current limit to the boost
converter. The BBPE can be configured to monitor either both the battery
voltage and inductor current or only the battery voltage. When operating
in the combined response mode, the more conservative limitis applied.
The thresholds for the voltage response are configurable across four
levels and the thresholds for the inductor current response are
configurable across three levels. The BBPE's attack, hold, and release
parameters are configurable for both of the response limiters. 

Signed-off-by: Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>
---
Ricardo Rivera-Matos (4):
      ASoC: dt-bindings: cs35l45: Adds ABPE properties
      ASoC: cs35l45: Adds support for ABPE feature
      ASoC: dt-bindings: cs35l45: Adds Boost BPE properties
      ASoC: cs35l45: Adds Boost BPE configuration

 .../devicetree/bindings/sound/cirrus,cs35l45.yaml  | 415 ++++++++++++++
 include/dt-bindings/sound/cs35l45.h                |  45 ++
 sound/soc/codecs/cs35l45-tables.c                  |  95 ++++
 sound/soc/codecs/cs35l45.c                         | 601 +++++++++++++++++++++
 sound/soc/codecs/cs35l45.h                         | 193 +++++++
 5 files changed, 1349 insertions(+)
---
base-commit: cde5523c75f1320a55ac1d55a717ccbb566557f0
change-id: 20261102-cs35l45-bpe-340780e966df

Best regards,
-- 
Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>


