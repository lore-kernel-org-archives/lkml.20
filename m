Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B804A3F1ADD
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 06:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791093895; cv=none; b=rdYQ1VpqsF/MmumxOxNuxQc429SkdviEJk0jBN9rQkUImOkZyWRLO6T0mAQUYv22C4Dcg/VeJXYJ9DPcSPzFWlPiY7U5bqH61NwJQlQop0MYQ3M8hRZ5wJH11D+5PTza6sFukC9zHzSPgSgCY6p2QHeEjEnjY9XiyQYPHLzWyx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791093895; c=relaxed/simple;
	bh=sNwquOknKR60E7qr2ALmDm6xoE+cnxL/XwbQaJrtHA0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dgljwMPhNHRQq8Bek/kDfLmO/MLHLY/c85F1CFiOlmCRN8zcXIjZmggHD4aLZgNKpTPQUKuZb2FulOXbj4juQ/WG6wLmOJj0zgittMVJgQO6bSOfsZ5tTvDSln0oHmW7UfJ3N01IxohtuzSgKaARtgHjWxIMuis6wxYISpg6r1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X8LhnkI0; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X8LhnkI0"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-3a4c8262465so595272a91.2
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 23:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791093893; x=1791698693; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OAbS6Ry1BsMnnYJR5/R26PS2NZwQTbS36NknU/TPiuk=;
        b=X8LhnkI0UjtdjhIyqC/8PPzLhlLEnGDFzK3H6CEk7NR003Gl3RQ+5w9lUUy6F0c7YE
         ooZ4WeJtZw+W8WljyGLlZ9MHaaTferywfy++zPYfJO89hhvVQzXJ0SITEUqG7wACSbgw
         JClmFRS0Qsj/e97jER6vrFx3FnxIrc7Wg7Z5cAxM+aeGcMPIS9gPiWbNpdnF1HbTY3ui
         1C+ClxIh6d3yAeqnD9t5WjiFPrOnHCEdUnq4vrjIGwYZieDHRgU7SjrYPWpPKUo8YQrV
         UhKNNKm2GGlaU38fWvnnqF5Uq5P5ZUmHrtZ/ezRnkTTVjQLPEN3njEnuCC15aH9POYhQ
         GybA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791093893; x=1791698693;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OAbS6Ry1BsMnnYJR5/R26PS2NZwQTbS36NknU/TPiuk=;
        b=l6/lw7W43uqXZT6b/imkW30xc/GEyz5jr9Hl/VqXaCILhs6li0At8ZH5sPhD34BcSF
         skOk1vup2ulMrYvJJ/t3NvdwbpF9i3cICGrMjZ/PLwZrKW3rUDQlxm9f09P9mFxby8xz
         9zNDi/XIddsMfAsGs5+prLXpb1EQNip9EX0wMBdbkQ3+Gg8nplbKt86KJgmPZwljGAFR
         DUOrZp3+bgVwwesW+im5m3z8a46YiN+lsMdb3zkz1rAcOe2ecshOiK5hRLZglaxfo5tL
         x8UYUAYvHvdpr+WmLUWOVQghnD4giXkVjwc2IC4QA6d3E2EI2SDY6Ods+NWKK68+hf41
         JLHw==
X-Forwarded-Encrypted: i=1; AKwUvBxVSWXM6RX4pqr4LRV6/go43jXCR/vtr2qyQnzywUFahMR/BWsRUizL0OVSFBLBUV7Au+JhYkCgQQIYinA=@vger.kernel.org
X-Gm-Message-State: AFq9FYI9y9E8B2EqHyCKzeYdYc5ZVegb3qFv+O2IZIdCjDqSBksbV7kA
	XZfm5tPUPCzxZixvQygKmWhjoy6VLMZLJaHrOcJPOBEBW31Ol5pEAnRI1bCcfHiZ
X-Gm-Gg: AYBFou0xa5E71rw33+9BDJWFKPO1xYkuBYWDGjlIaJM8oDXNHYdJZZ3/XMNIrf6B311
	XpJs9IAvh81dUci3BLvFiQaHmPVhUa7/7jNDerD4jQqfwsVOMMuPICXhkjS5hx07To8PvN8O1J1
	mWTljUSKfZuhRs5GfK6ouV0d3wnvSwtwALHFB+PM7qZEDojAr25x2GZwPPWiw+/l0QLUr27dmH5
	5tmw438YRZvsYQ+cP3hnPG4YOlXPSU/MyzpCSbUT62i6DgXFLKtETHJZdPSXI00xAyl7PX9ldww
	XyjJcFZkzRGrKVK+te6YzXABJ+xrAny7dp8Z8F3wYkDS0H4GOyk1WCQP9d5CP+SIY2wIZ2rl/Eh
	xWTbpbqByFX8fW/Z4amoX+QRP0m/m4U0IHSV5C820Lr9g1dA83BcXOF15xXTDGzC4SkHoBLpXF0
	mwpEm6/9yN+V5SRCEPGHZVmD+tpVyOWglIQqd3LT9d9dOdkxuhJRiroZyWRFYxpelpd8CHJhViY
	4z97yvcMOcX35RUlA5vpz8lREidYpiZJIn2oAhRpEtiZmFiyLTGPc3lohzBLaTABX+nr8eWThKS
	+tGrdc976awM0C1CtX1wwKxc45X9lWxzfCBkILlc8YimvTA=
X-Received: by 2002:a17:90b:1fce:b0:3a7:f45:5cb4 with SMTP id 98e67ed59e1d1-3a70f4567cfmr3377395a91.26.1791093893061;
        Sat, 03 Oct 2026 23:04:53 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78d4a869esm5844094a91.2.2026.10.03.23.04.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 23:04:52 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 04 Oct 2026 16:03:29 +1000
Subject: [PATCH v2 02/21] ASoC: dt-bindings: cs42l42: Do not require chip
 power supplies
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261004-macaudio-v2-2-7b47ed6335a8@gmail.com>
References: <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
In-Reply-To: <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
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
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=853;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=sNwquOknKR60E7qr2ALmDm6xoE+cnxL/XwbQaJrtHA0=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkH3+Qcf6e/dmXwp77y4Lcv86eFfgvnVs47fDFu24L67
 mtu71cu6JjIwiDGxWAppsiyoUnIY7YR281+kcq9MHNYmUCGSIs0MAABCwNfbmJeqZGOkZ6ptqGe
 oZGOsY4RAxenAEz1XjFGhhmGhdzFc/juOUVIeuyPiu5Z17TyhPiD4v0ezvfWXI1df5rhf815z4L
 A1HMdWqW/dt0u23Wm2JnNsO/ln7tnspkVu3je8wAA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Some integrators do not expose the power rails connected to the codec
in a way that can be expressed in the Devicetree. Do not require them
to be specified on such platforms.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 .../bindings/sound/cirrus,cs42l42.yaml   | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml b/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml
index ab4c7d22dc0e..6c100cb36699 100644
--- a/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml
+++ b/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml
@@ -187,11 +187,6 @@ properties:
 required:
   - compatible
   - reg
-  - VP-supply
-  - VCP-supply
-  - VD_FILT-supply
-  - VL-supply
-  - VA-supply
 
 additionalProperties: false
 

-- 
2.55.0

