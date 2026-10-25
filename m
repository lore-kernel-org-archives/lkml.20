Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792940038;
	b=V3MrZnalhtJRMAS0lo8xuctYDzDNYfZMNUZvB5Ul5Caq2zpZ5AYmWRVjs8zi+z2cBoGj
	 8wo2NplPzfS5tr4hsJFhGX8fxWue2j83rzASWNe8iYQAd6o0HwRA895e/2ObE6fg3cuVj
	 V2meu266TANKCEBljctnb5JBLN2ppqQ4ml4sJ1ihDpCwAzloYWEP/aP2R0YgqAEEpSKmj
	 LWpFeCgU+XAdOXuJdENEu4ttxAuV6eLpUILcLE6AMDs10m5N+wVVBOyv0u1w24NBSflfS
	 1WkyrL3RQo07+x4qAJXlqv4kFFv8NpAHG/3hxeyiJnR/Qpjna57JLxpa5ci2kQq6G2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792940038;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=oXFztGQN0f+1MY9Wri1v1FfmKUwWYfKAL0FN/sMrW0Q=;
	b=CE+f8+k3miXGVYk7frdmaseh65PP6vOWB3cHHj7Za2npxwg3ESJDyoUNO+3qbqKksWxl
	 EANerK2aR2kFlkqWjQEfd50W4KI3bsxw6k4hQXSII2RoqD8dRUHhlkQDSnGr/wjQN+qcN
	 KMVaF5VPaZM0o83fN7NGAxXrQdCxfBoZfR90Ax3QXPlaclK3AXFmwr8QoNcJK7fUqRHQQ
	 T/pMEhVznuIfqwb+ETkrwpoV6/HA0mj0OYXtmTcZc3hFjJvrKPZADHewjB0L7qEv1v2/h
	 +hT7rnKaohBkjQ7HU+mxhY5ZjKur0cTyO2SqVrz2PL+AKP3rjicq0UyE8NcTB0FIFZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=abCqUT2q;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8F31606A31F
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 14:53:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8F31606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=abCqUT2q
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48e09aa5264so1186049f8f.2
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 07:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792940036; x=1793544836; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oXFztGQN0f+1MY9Wri1v1FfmKUwWYfKAL0FN/sMrW0Q=;
        b=abCqUT2qPhh0VNCVDM4lRtN/Avcf8m2uOEUxnQbNwh46fgt8mndJ8E9RVdpNvxBHGE
         PKzyAeub3ezAtRI6CBQ+jE7mqJwu5G5xFPbQqs7ZiCHgYtmU7JifZdVjkgbt8vHoVrgK
         mCO2txsgZqB3YNpWFdS/t58f9+6DRNa5ddy0zHkQP12q/jvEg/dETYCZPSY+6WNJjUKj
         PRtYLuAVgAWlhkLndT2owcdropdC9Hwqa/VMBW+QNay99FIkILlBphNTd9UP80sYkWM/
         k5wLMVp/8AnO3SBcJvRJWaezPIeZp2aB6CHpzHVX+JIAdJvzXry2CzM8NPVagZ0UktCo
         8s7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792940036; x=1793544836;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oXFztGQN0f+1MY9Wri1v1FfmKUwWYfKAL0FN/sMrW0Q=;
        b=y73alfOCCcPYgjy5q/FwWAxmr7fi5bIXwPTVIRFD4xofWnxKeqU+Wsa/bfrX6WAybD
         1h17FciSp58hjEr9i7LUTT/c7Kkh+KPsChq47Y54s7fsnZfa/FphbFNXd07/IxWIQtB5
         sTfMwUD4qT2oaTUU/6rKKe8h3sjjG1VcUecJ5IoJS15nZx1Yq9CavS+8PgKb3a+X/t06
         VbXuy7xzXgW+yOgIY0MFISqanW8tsEk9/Dq8DVsMHEyPNRLgQmKsYuLA9qieboZVi2y5
         coARWphaMz40OvwLBNJfOntye6iqNEn+hfeZYs+LVLPXA3poOxvS+lbi6R74fk8vbhzI
         nKZw==
X-Forwarded-Encrypted: i=1; AKwUvBw7Av3YQZqbs7MwSVuAmvRMR1yJm74MQcJL6pfSY17FJARXDwCiJspCgHOhdy0B+yOZRoa30usSlu3+l50=@vger.kernel.org
X-Gm-Message-State: AFq9FYKh2P8fvvJP8q6dRQPcJmX5fsO8Qyu2PowljWCLiRA01dBSgKUL
	l5EXmjP1j9XB1bBkGe6jStlBcs2PGY5owBL56tTuSN/gxmIuM7J4AT9g
X-Gm-Gg: AYBFou3lUZsUGRuRgldYwMCZZilNnf62Ldnf7SbltKllL+T49XJPvBJI4osaInk/vh0
	ew5CEAkZN+C+Wm4cEIeGcchmozEhQ5RvHuufHmb/yJw/Pl7/7aI91E8+DzSyhkoTwT1uGm2c+S8
	jvMnxNNtnYQkugC102H3+s8eO9I5dYDGLe0Eca5xcTxwuNUX2s1+V/GYodOzBK7Yl9SIjcdHKMs
	ipz7PoM0d0OqTmREwUt5eefAp62TxL4E6IsTLGaTENQVt7GGJWsoT7/61Vga/K/kVFLxrvdATsF
	I002eDuMGzi7appUnoBluiwPB/1U9N3pRNF9Gvtsgcse8PWbhano9UG3nmK7HqxQOJl32pLcOmL
	bJry2beNvN8IOv0YxBIr9bEKsTu3U7Y7VkDyn+CyGXY64/a7afI53fPwnlZq1JON/u0I5gWp3r1
	xMJR5riL1M99q44YJ06eKihOlrzycQYw376pnAymflaliFyh6TMnWkYUdr9mVWpLiRGPQP7erka
	JXnxM8rjCI4+gVumKEVmHt/8znrUrH788S5JdjohktyMxtek/b4WyHLX49uO8cO100oK5JlhTrC
	Y5speRMCK4JQUkxjGdqsq7IrzrdbC3UJBfpkzYb7cZ70l+/L3kNFdqGYu7XiI4mOnWju194=
X-Received: by 2002:a05:6000:607:b0:48d:ff81:5201 with SMTP id ffacd0b85a97d-48e3eb9930fmr9037851f8f.41.1792940035985;
        Sun, 25 Oct 2026 07:53:55 -0700 (PDT)
Received: from romain-ThinkPad-P14s-Gen-5-AMD.tail433d9c.ts.net ([2001:861:39c2:e340:4c3:3a00:d533:9d50])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb9cesm10986471f8f.27.2026.10.25.07.53.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 07:53:55 -0700 (PDT)
From: Romain TISSERAND <romain.tisserand@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Oder Chiou <oder_chiou@realtek.com>,
	Animesh Agarwal <animeshagarwal28@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] ASoC: dt-bindings: realtek,rt5631: Add the optional MCLK
Date: Sun, 25 Oct 2026 15:53:53 +0100
Message-ID: <20261025145354.3476371-2-romain.tisserand@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261025145354.3476371-1-romain.tisserand@gmail.com>
References: <20261025145354.3476371-1-romain.tisserand@gmail.com>
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

The RT5631 runs from a master clock on its MCLK pin. On boards where that
clock comes from a SoC clock output, the codec node needs to name it so
the driver can keep it running while the codec is in use.

Document an optional "mclk" clock, as the realtek,rt5616 binding does.

Signed-off-by: Romain TISSERAND <romain.tisserand@gmail.com>
---
 .../devicetree/bindings/sound/realtek,rt5631.yaml         | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/realtek,rt5631.yaml b/Documentation/devicetree/bindings/sound/realtek,rt5631.yaml
index 747a731c44..03ee25e1eb 100644
--- a/Documentation/devicetree/bindings/sound/realtek,rt5631.yaml
+++ b/Documentation/devicetree/bindings/sound/realtek,rt5631.yaml
@@ -45,6 +45,14 @@ properties:
   reg:
     maxItems: 1
 
+  clocks:
+    items:
+      - description: Master clock to the CODEC
+
+  clock-names:
+    items:
+      - const: mclk
+
   port:
     $ref: audio-graph-port.yaml#
     unevaluatedProperties: false
-- 
2.43.0

