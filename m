Received: from mail-pz2-f39.google.com (mail-pz2-f39.google.com [74.125.228.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7B3F334688
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 06:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791093888; cv=none; b=c/HZKvHuFTFbtI311rTGe1p0X5tlmq+Lw7t9UJ1rQaLMJ+7Qc0ABEQROZtOWKFHxITyHTBwOZsVkNF77fPqAG97KK9efUC9DumfQQHsu+w5F9O7UMTNyRKT+J6Dj03gkrRDTXQbZ/9Do3giX1F8petcFLysq7uuECEp9bhvf2vE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791093888; c=relaxed/simple;
	bh=E10vmK5PG6mgO0KcqsmmlCIx40eVwal5DR26FFOqKk0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PuhRY7KuYJwIqlCF1acusrdm2pi681XC+GemYfQTbDI4BjoscWeV+l1KB1sB1HMAllsJsMLEyRNw328SjDlLmu9Oi2bKe/wDyUZ6NckD2FniFSO5vK9GHQg09aR/Wu1sLNhJZrqlXqhclFRoRAUqA5kDRSGBqKxrPmYB8oLpcNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oPIFhkWy; arc=none smtp.client-ip=74.125.228.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oPIFhkWy"
Received: by mail-pz2-f39.google.com with SMTP id 41be03b00d2f7-cc794a06e5fso368752a12.3
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 23:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791093886; x=1791698686; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yqB7Ic+9vDUC7rhTpgu3s95TJXJzhsEnL0ALlbbGXbw=;
        b=oPIFhkWyf3zK/2zQ98swDJxNgHTHxqUJAqn7iV8dcSvkKhXxhHTUkPAWBL6lJdeqYM
         VICiJQ6guz4Loz0WbZa0MAQPorruJx2fAQ+9rekSrzQdWdcbJ1GSlX0CQtHVeKTtFA52
         HkkobioIiP+DAJnZceIwPB4Wmua9Ml4X/tDK5J+d87tu2UZAz0Jn85OTmUW4sYRaC4iA
         hNKd1xaAkTd0TaITwauzIoR6oHuFjemF93Qp5q5joXr2BJUrqHYbBlH3lY4bVYTKynus
         KpLF5oofFXaZ8wBkYDtdyZ21qTx/1qaVufwVbA/4uuM5eSI8HAZvwAcg2EoFf2K+bTwi
         z52w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791093886; x=1791698686;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yqB7Ic+9vDUC7rhTpgu3s95TJXJzhsEnL0ALlbbGXbw=;
        b=zQFi/jA5YC18e5fnL0lKMaJnnzMmkfcpU63J9/+4+f+1ZjvlkR08CG5Bc6tvxI527v
         edtUf1JObD8WKoEccI2/sTJlQ+Qv2g+oIhqbiW8bv6VwUwuN0MBMrFismWMKDdQofig1
         ArXtWbMUQ7tfqkFc03QrhCryz+o/nzbKEDLlcCfot8eQ+R03sObJorFjBJmg8poZW2cI
         +eR+bEatbDyyd6RIwC0zyIY5DffSXcvUfFhEgsFoH31N8vjvSJxVaVS7sWn7gKaNDL1R
         EyPvErnEOcKzG+olbqNHgnvV7aQyKL795ONDHahAPKDQxp2t8dvMv+SSpJidBb/U9ur2
         8jBg==
X-Forwarded-Encrypted: i=1; AKwUvBz4eDiq5pbrHLcq/JmKR2aebWVGSfuviVW4L1Nkz2e9GNJTxg+ne9TBSKpYRzSlLXvEVZ8VUCpzH/tla10=@vger.kernel.org
X-Gm-Message-State: AFq9FYLVJrUmE3VjNR6m+wocX1PXVzZmA2+URNWBkDRlqIpoLNmYwcOf
	3C2058K+nXg4G6XAagATyKc6jTc1xqxPpRW97Kj4sb/8YgY+y9M5vbS38ufPODOM
X-Gm-Gg: AYBFou1DgdhSDsDu7Yj0szD+Zi1EXm8C9NNJ6LNBeb4fVcVXWmIs4J7uN5o6g+cbtnj
	h3P0lRlLtVA0M6zWFuIlczV1t8iwhfWerPy2mw4umA/H59dqe/bW0HyXZMsYB92d1wHo1E6PJVN
	6BEd0FrbjBUmu8bC3Rh/tN06tKgNmw4e1JSiYQ67SIHVy7mD7VejmCPFYhmeQ9jsaX3OgIhQiLW
	BiaccZAi6MnTeTDU0Pyflrkay4w/reavbixKidOVuw88gwtzKrnsxxfUG6ApgPLT/CVVJxILf/E
	0JzWTCo/kFdK8JX6d1ZjW1TjSEB8D76HaiqNipLLGBifQychepzCuJhOUgDk06bwxZlfcTHLcI6
	iq7yjgAdb+TIC2SJW01+vW4a2qMS8UPWRgYMLbjjV/O7F8ZDVy8aHqSn6fm6XUjB2isUkpbg//M
	5hzwIo/r/HMbsL3ShANTydrH13Q+X1EiNA9amOtngTfrA3dePRHyCQAod1yhNXNCMW6Vk9LGVWo
	DBd6F2/bEwwJiug5hmu6CqWJXAcu2TKBmiwyGYf3xGHkTGrFvASnzONXdRyDfees+S5i3UwNFXw
	6rV8w/Hzkg+09JK8umLMTBYrNHIQJ/RhN7xorMJ116r9l98=
X-Received: by 2002:a17:90b:498e:b0:3a7:9ad9:68e1 with SMTP id 98e67ed59e1d1-3a79ad96bd7mr2514011a91.13.1791093886117;
        Sat, 03 Oct 2026 23:04:46 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78d4a869esm5844094a91.2.2026.10.03.23.04.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 23:04:45 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 04 Oct 2026 16:03:28 +1000
Subject: [PATCH v2 01/21] ASoC: dt-bindings: cs42l84: Document
 sound-name-prefix property
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261004-macaudio-v2-1-7b47ed6335a8@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=852;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=E10vmK5PG6mgO0KcqsmmlCIx40eVwal5DR26FFOqKk0=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkH3+REFZSpCqk53p5UcbNR45vnz18yDNnn95vKJH3b8
 6FvqWZ8x0QWBjEuBksxRZYNTUIes43YbvaLVO6FmcPKBDJEWqSBAQhYGPhyE/NKjXSM9Ey1DfUM
 jXSMdYwYuDgFYKo39TL8D5gvGJ4vrVDcqH1N+NnXtIakiRrfQq/kFam4x/B4nZFhY/jvaNzDcCL
 TPdXm/5kfd+NnsHyZa7zjxaz193ly69zsXeSZAA==
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Some consumers may wish to prepend the codec's name with a known value
to identify a specific codec among many. Enable this with the common
sound-name-prefix property.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 .../bindings/sound/cirrus,cs42l84.yaml   | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs42l84.yaml b/Documentation/devicetree/bindings/sound/cirrus,cs42l84.yaml
index 94062c1d9d45..2637aa5f4326 100644
--- a/Documentation/devicetree/bindings/sound/cirrus,cs42l84.yaml
+++ b/Documentation/devicetree/bindings/sound/cirrus,cs42l84.yaml
@@ -32,6 +32,9 @@ properties:
   '#sound-dai-cells':
     const: 0
 
+  sound-name-prefix:
+    $ref: component-common.yaml#/properties/sound-name-prefix
+
 required:
   - compatible
   - reg

-- 
2.55.0

