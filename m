Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793691619;
	b=V2Taf/pNmXmzqs8g801wdvzDZalGkDy/nQWpAs+1Ol+7iPZDzxTYUJsC81IO1eaEtp/Y
	 q2u/dSptiFV0aEl2FvFBwnpIFZwzuTjV+3nZCCsLvARV6ZQYdHuprKRbVaL2LylClF6y6
	 qM9CYT9cfpqGmoohMz3TZLGZMb++IYoT7nhJ2LhCerbAZcx6aH/u9VFQDniEM3s73TchD
	 bdVsh+jk6RKET1p9V1viFrS+gQc4A6p9hCbbU1qjuo665A9xqYKtWLO0zOdWadY6sE283
	 vBldJcx2OqJrynODQbzW3H5LDijugLdSzCuZ8Ij2gKUPb4ILUknxqfsOeYU8n/qTWgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793691619;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=it6m8qrTkEtz+4nXGTr5C/zZdhn9ou1DiPXIBD5lLbQ=;
	b=v0+5AXo1dY/JR3mLqNiA3LUx2SDufEZpfVHpE7E/yRklgLLiNbpNgYUE1/EzeU3L6+Zz
	 f3Cil/7ZoZftC7pj7fpzB+4mope5p5lV4axaTFvVEL4lCbNYnaTsOv/p1BKxnK0bv8hYq
	 nJEOwIZAXmFTaubes+2I/UgnOKd6+N2nwRnNvQmOXoZnx/qyym703qExddGnnKkzAQj39
	 YK+U3XuZ4SWvEvuSONH9jcW71YFBtJpV1BJTDersceCNOAF3ay+7B8cykF6JznNO4uD/c
	 0id+lwtM83tVurce2o6ZvlrHInRhtNlphzw2FJ7YwvzxkKspYE0AO6xUIBqIdXhrDdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Fcs/g6dF";
	arc=none smtp.remote-ip=209.85.215.179
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00E7F606A338
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 07:40:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00E7F606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Fcs/g6dF
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cdac6d19ddaso1526174a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 23:40:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793691618; x=1794296418; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=it6m8qrTkEtz+4nXGTr5C/zZdhn9ou1DiPXIBD5lLbQ=;
        b=Fcs/g6dFSc0b11V8fn/wq7r2uXy0D38y3byPrfbxvZGznF7twrxZGCSCRURY5NAujW
         HOsD6jLAkwaH1TDt1pjOlY2U/S61MxsqgnN3o6T4YsjX4S/J+azOIsHazafqMTcMSAah
         vrsTyf3MiQUJPa8phLQ2SU5sRoFih+/ZCfM4xuNh9n1i+/L5Q3WMi/dYztiPMsMK1Y+H
         IMrv5dFGa12oXDoljzQVpc2Q9DR8ca4+mif3roiAK7aqILRF2VsBGuF0p0A7KmE4Bnaq
         cZRcH7YcrwBHYUBGhCylpkfFGxar7McVGJF4Q73D5655It1mqbUIoKN0G5fsda93ugJY
         y83Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793691618; x=1794296418;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=it6m8qrTkEtz+4nXGTr5C/zZdhn9ou1DiPXIBD5lLbQ=;
        b=CVM9NIDqy+p5XZDe877zSmi9azEmx3r5ovWFgL+XQgvUrajozj7YlrYmPKSAfKemQg
         gnayu8yuMX2JBtmv3J83cYSeQl148djDCot34LZGhJDLTuXC+L9hgu8PyZRcYmpMo1ic
         8qILh6gErQVT3d6F4U+ctjMqghNjbjJFLkYUdwUwLW6YJqV8tw4kdSxfmjbPmzmENaCx
         TjApRMTyNkZasTD1FSuTCNwnRIZAeOTYXQ0SP9bIRTtK3KvxBGuRAIhN/Ph/8/tfuuKQ
         z+bXWCGEa3dTTMOUW+ASX387fZs24vz0K4Nkqxlc6mxQqG/IcbRx7OSW/4xgKH/mXqFe
         BPdg==
X-Forwarded-Encrypted: i=1; AKwUvBwtBGeKMCpTidMYalfh1mzTAc0u4wt6OQwLDAjfVIvgf1KbLTkYy66YqqHfms0YJe6W2IXsSIjalzEGksk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Az9BYM4VVWfPqz1UPOD8ZyKaGTrbcEt4vsu9FAnrC2qIWmOhm
	NTCzIpUoWJjhW3CJWV3Z71eFpFB/vBzC7JE4aPZAIAgGO8eO3v3FAuXM
X-Gm-Gg: AYBFou0XSKFlD6ULq3TYZLzUNBeVW863JXJ8yUYl4EUwZgOwNklcl2g7LLuI1DB9v3G
	r6EFiHEKZeyt2UfDOC8Tsb4jQjhCjjMmU5NFmd7MIK90H9xm2l5Mnef6lCc7Ee3D3ed/jdBgy8M
	4wgqLNiZPqW/pY1v+OZ9oMRNMrjZfT4H20FYpunkHTefD6mZ9DWRC8ak5tIC8azOuyViHtLjddH
	ZunLRVBLn8pzcKZ+d+Zi7CIT/UXTEdWOEkvkVlyp6WlH6CGpmon5sTYxus+bbOgtON70HaXZ9LG
	ay0LDy1PwHZsvWMgvAbKVnYyaGF+zPWvd521x+ujRwUtvliycO6zVsCX9p7RAUBZzwKA2KldO/A
	XUANsloxU3uoZqrp+u2DxEKte2rzKgSzhyd9UhBEnJowrEUcDXLfXnT4zP6lXNeSwJAYudCluwu
	z4Fai5DaAl3EHswQtdaHtwjfujpsMM9yTjAA/lkAKU4a3f+ttj5URY7QLjOR52tNuT3q4L1Uv42
	M/cuhv9cHWjioxiBNzR2TQYfd5CcsUSpDsewr3nqxA4blc1a4R4l9tlQVLmGYDr4bJjwgW65G5b
	PNnPAwtNyWvafcimEBQTKuk7kTAm5txwS3D0VaNQ6TeNPdRfyg1yOJ3PxXafVD5Gm1lJBUVL35y
	sgvUqQya4mVNKZUzA5XxLdXfIJzV1yCymc+8zkAjr7Qvmy5XbJoTK3AJ3hFGpluwv2MuyrR9W+L
	NQt/c=
X-Received: by 2002:a17:90b:380c:b0:3ab:3437:554f with SMTP id 98e67ed59e1d1-3ae89749415mr9681387a91.29.1793691618392;
        Mon, 02 Nov 2026 23:40:18 -0800 (PST)
Received: from [192.168.2.34] ([2403:581e:d87e:0:739f:50a5:e171:f133])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c903d0dsm2956769a91.12.2026.11.02.23.40.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 23:40:18 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 03 Nov 2026 17:39:49 +1000
Subject: [PATCH v4 01/22] ASoC: dt-bindings: cs42l84: Allow referenced
 dai-common properties
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
Content-Transfer-Encoding: 8bit
Message-Id: <20261103-macaudio-v4-1-637484efe46d@gmail.com>
References: <20261103-macaudio-v4-0-637484efe46d@gmail.com>
In-Reply-To: <20261103-macaudio-v4-0-637484efe46d@gmail.com>
To: David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 James Calligeros <jcalligeros99@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1294;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=fSXLE44RdgYerdaSvSI97z5S0Urixj0efXODzvWnMbw=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkv+8+uzimxE9rIuctleWOHd6XpBtbrKs2M2dzt87ke7
 DI/p5jTMZGFQYyLwVJMkWVDk5DHbCO2m/0ilXth5rAygQyRFmlgAAIWBr7cxLxSIx0jPVNtQz1D
 Ix1jHSMGLk4BmOr3DQz/02ICznJcm/+k9ciposevG2vm7L/yXF3ud8sENTubx31fbBkZVsRWc1z
 fEHvLY2916xEr702FD3vrZ8gFMXfwbnqoa3eJHQA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Some consumers may wish to prepend the codec's name with a known value
to identify a specific codec among many and set #sound-dai-cells. Allow
this by allowing referenced properties from dai-common.yaml.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 Documentation/devicetree/bindings/sound/cirrus,cs42l84.yaml | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs42l84.yaml b/Documentation/devicetree/bindings/sound/cirrus,cs42l84.yaml
index 94062c1d9d45..66cae8b7db5d 100644
--- a/Documentation/devicetree/bindings/sound/cirrus,cs42l84.yaml
+++ b/Documentation/devicetree/bindings/sound/cirrus,cs42l84.yaml
@@ -9,6 +9,9 @@ title: Cirrus Logic CS42L84 audio CODEC
 maintainers:
   - Martin Povišer <povik+lin@cutebit.org>
 
+allOf:
+  - $ref: dai-common.yaml#
+
 description: |
   The CS42L84 is a headphone jack codec made by Cirrus Logic and embedded
   in personal computers sold by Apple. It was first seen in 2021 Macbook
@@ -29,14 +32,11 @@ properties:
   interrupts:
     maxItems: 1
 
-  '#sound-dai-cells':
-    const: 0
-
 required:
   - compatible
   - reg
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |

-- 
2.56.0

