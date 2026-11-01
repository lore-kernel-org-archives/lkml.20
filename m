Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793543439;
	b=0r5zfC0zAtpgw0caogESKa2hhYwirwJGzH8qboqp0p5XrQuX3dPKjlXwvDn9vhBJS+Xa
	 99K06MtQrdsrrfo0o0I3uxJLj7sMzhZML3Az3YL2n9XjJUnlq0FL7xR0nl3eUt6Lfi+VJ
	 b6rRzkxhMmi+v2CUs0ajqvjK9/IbIDQiRHrTuxpNa8yMVtmqumT4b9XkAAbOucMtwNaS5
	 oCyE80/eA7f6R80y/xejP0wxpj0SoUKRPrvpddocp6pyJc+WnvI/fkKhBm/lydCeSQ7n1
	 R47METZfy2CL1rX79T+d/NcYKeqeQhbN9tEmI3JyGqJsqGeJ0ccSQDPGsmqss8VXgbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793543439;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=beFOhHM7NoueVRBXy1T35SISL4UnsCDbE1h6tUqY/wA=;
	b=MAiLU6Z5eUMw8919WRLGLpfuoq0JGKoXpE1jf8dkMYaQusXYdBltEKCTpJ3YeUotBCBX
	 FmHG043iIkapUYfPw8OFPQsR/kQcajxWwB/UEOTHSi0vuLjKJ98bpsHGgdMfI3J8SQ1wl
	 Gqd6L3Qa5KQ1nTU7ZQP/NMgQYlB6klMzv3zVxk7RUSpTohJ0NO4RMa46L7Bbiy6TTuxzS
	 cVP8tSqi7hG4UrfaMD1sVB9NM0VUntA6Y+0b/+geh+M7wyoVYLFbo7/wotDTR6+gyXh/1
	 JUI4Sdu9bItCnkKhsf+vC11tuSpzNrgQZJuU/bJ0JqVS9x1oJTyvKpdanQIALfHp7rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="axrKvV5/";
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F009C606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 14:30:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F009C606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=axrKvV5/
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a5087a5348so16655115e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 06:30:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793543437; x=1794148237; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=beFOhHM7NoueVRBXy1T35SISL4UnsCDbE1h6tUqY/wA=;
        b=axrKvV5/sycBk82+6Nt8gbseFSxoBPJM35iGjjREg3AlOkRUPtjV0bkauhgc3l76Ns
         uvwYudrYsSijF7O4AvU63k6xhpZobOwKxE2/qguQofve7K6aFBYk0HsX7zBnIzSgs1KQ
         u+BPOJbCj3E46YyqH7mTr2yCLdwZe6mazzmvWbHxnIjDJDcEiLasYasbX6a5Af+9Pkfg
         r8dufV8lZA2m888lkjrjpTnzodE0g+gQAnD6mamUiFsLXnZBobWTPKF14OPjd11ixwjJ
         xqwiFyDn3nitgx7zggVDT6fH9ZiNhBU/q8cLwysv7LPCLfI/7eHLdNS9c/FRC8FUxTzv
         EVXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793543437; x=1794148237;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=beFOhHM7NoueVRBXy1T35SISL4UnsCDbE1h6tUqY/wA=;
        b=TMLO+iApUPaPxSkJZvqgkhX6bXJb2syZ9XyHtYQ0/asZ78V7SUKQ9CtKv4LczBQYwH
         zsHawPB0XLzsV4XM1/kPRAn4HIFdMjKROho0RrUy2d5W8uKn9OX5oq8Mh3s9ZX/vYAwe
         /yE3LWVVMzCAQ/nVQ1IyLl7w56G8YDA6kjviNbJqgjtFzb2+jlG6BGVaHFroXyRaD4JK
         iA0ZWx/yWVmgsaFt/23ULwBBaTZ+h5Dic1Wj3g3X9nKnCHCqM6X2VSSgWAhrAZbQWylW
         /cVmgXnTEKHlxjMSk2NCj/iuGvwJONjQGWHN/8mlEoFU35g1O2qBTi7lOPGHjgRNTTLH
         tn0g==
X-Forwarded-Encrypted: i=1; AKwUvBwuibTc9E/ujZBuF3uQBHaiLkIVWY5zgZ6A9XsBw1fKSuZ1V/lZITTT0cMuIZF7NzjSXEYx5As7wWqF0/g=@vger.kernel.org
X-Gm-Message-State: AFq9FYJMtCgBK60sZhuCsQ+E9aRq0dZMkEtLVFKj0RbzldWYYvvGq/AM
	sDKDl0E0UuB5SHLbQWbMYknYsgzSTph45uZxyLmvIbVO1f7OMFwZy7IZ
X-Gm-Gg: AYBFou03XagNgq8Q6pb8q8cBdMLy4qsFhj83NlsAi42nk29LsLWSuwl6yHPpe4Ngwyf
	L3yemNQVDWKX8ldgcx9gjCrTEFrYvzoENhggzsWZEBxtbNO/PX6pMApDthqN/uooB0XZWIX39Ep
	f9oCiVtzE4eWDRfyZ07O5PDM/Ij7r0/2BN8YNLPSKf4gTk1jCXfOEIM1on2R1hJwtww+ovuHtpr
	jaMA0JeafWN9RTu3L1OejBZ66ka91ItmEDFT2Wwk6//JNhK57Gr0zMOjY11ZiuHBAoFZhyT3Y04
	Wil649H3IkQhd+dDZyE4ing2OgF1M/blYLMy1tk9mpQwc9TrBjWBHnKQvGxA058Z+skDlPYzgUt
	6gMx4BEg28q0W72YZL5/pXr8bpOK3dPxHLMbJ+xVx0Wd1iquvZkCm46PYgosuMDU86x49Ge0dS2
	gN1b3Lcz2BbkxURQmx9/0L4RkGz8ybbtLJ8TmzX011+J6f28l3FLtbZxpwFvvNa6zkNOVEXENMW
	G5iMLTNXcHeHrOv10l5Jz1g6s7vzpun8hUCUe3YAxr+q6PM+1WN846D9lSbLB+PKXZTTyTHyeoJ
	NMqRr67cIWTmuri71dYN5/S6C3fe8jkdmKzW0n2phU5tnsKaz8yNTYqr5CVDk/8ASsjR93kbu/0
	FcKWztYd9vMi26PkHDseLD1GBskaZEthlXLQ7bSBgms33JQ==
X-Received: by 2002:a05:600c:8b85:b0:4a2:392:9de2 with SMTP id 5b1f17b1804b1-4ac1932b550mr152423265e9.28.1793543437168;
        Sun, 01 Nov 2026 06:30:37 -0800 (PST)
Received: from romain-ThinkPad-P14s-Gen-5-AMD.tail433d9c.ts.net ([2001:861:39c2:e340:849f:a468:4121:a85])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abe7706516sm138430595e9.0.2026.11.01.06.30.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 06:30:36 -0800 (PST)
From: Romain TISSERAND <romain.tisserand@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Oder Chiou <oder_chiou@realtek.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Animesh Agarwal <animeshagarwal28@gmail.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sashiko-reviews@lists.linux.dev
Subject: [PATCH v2 0/2] ASoC: rt5631: Support an MCLK clock from the SoC
Date: Sun,  1 Nov 2026 15:30:33 +0100
Message-ID: <20261101143035.880469-1-romain.tisserand@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The RT5631 driver doesn't take a master clock, so when MCLK comes from a
SoC clock output, that clock is turned off at boot as unused. This
series adds an optional "mclk" clock to the binding and enables it in
the driver while the codec is active, as rt5616 does.

The board that needs it is the GPD XD (RK3288), whose device tree is not
upstream yet. Its MCLK is i2s0_clkout: handed to simple-audio-card, the
mux picked the 12 MHz oscillator for 12.288 MHz (wrong pitch); held by
the codec, it follows the I2S clock, as on the RK3288 boards with ES8388
and MAX98090 codecs.

Changes in v2:
- Patch 2: get the clock in the I2C probe, as rt5616 does since
  b5c9df40ca56: from the component probe a deferral was lost and a rebind
  leaked the clock (reported by Sashiko).
- Patch 1: unchanged; picked up Krzysztof's Reviewed-by.
- v1: https://lore.kernel.org/all/20261025145354.3476371-1-romain.tisserand@gmail.com/

Testing: dt_binding_check for realtek,rt5631.yaml; W=1 builds for arm
(multi_v7) and arm64 (defconfig) with SND_SOC_RT5631=y and =m, no
warnings. Tested live on the GPD XD (RT5631 on simple-audio-card,
mclk-fs 256) on 6.18.54 with this change backported (the bias level read
uses snd_soc_component_get_bias_level() there): i2s0_clkout stays on the
I2S clock at 11.2896 MHz for 44.1 kHz and 12.288 MHz for 48 kHz, and
both play at the right pitch; v2 tested the same way, with the clock
taken in the I2C probe. Boards without an "mclk" clock are not affected
(clk_prepare_enable() on a NULL clock does nothing); not tested on other
boards.

Tool disclosure: this series was prepared with Claude Opus 5.5
(Anthropic) as a coding assistant, in an interactive session where I
asked it to fix the pitch problem without the RK3288 clock change that
was refused in 2014. It traced the clock ordering in simple-audio-card,
proposed taking the clock in the codec driver following rt5616, and
drafted the patches and the messages; v2 follows the Sashiko review. I
reviewed and understand them, and tested them on the GPD XD as described
above.

Romain TISSERAND (2):
  ASoC: dt-bindings: realtek,rt5631: Add the optional MCLK
  ASoC: codecs: rt5631: Enable the optional MCLK

 .../bindings/sound/realtek,rt5631.yaml         |  8 ++++++++
 sound/soc/codecs/rt5631.c                      | 18 +++++++++++++++++-
 2 files changed, 25 insertions(+), 1 deletion(-)


base-commit: cc3fc99f1bce93c3ae3771ef98cb91a566da857e
-- 
2.43.0

