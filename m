Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E689F51D519
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 09:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788858302; cv=none; b=KDg3ILjpxNG+awtEGDhmsKQY+3ogzKKXxBYgVwnvT/9ymSas0b2Hrry5RPKw18GodkVmRV2GT6EBHqYSVxldSKC3L3p0v/M6fsAI0paKKc33CNkuSFMqd58KGKIvg/F4Kkmgub0JChWu7f3WnnyZl7B63O36POL3LNIn7wqlOjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788858302; c=relaxed/simple;
	bh=BbwwSi4NkYc+Qs1d3CvwqDnlgSJO4+ug+OKxVntKOjw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FfIID802zOfrr61iS4NxJq+09zoiFP/7YrbrRHOiM7ewndVB2rWIfDGAcwKeqtO6brxLSYxU+m7mat3LurdqsqFkDt7NCOROpqzAiEv096LWsDsJAXWsOeR48LJqYDqmX/jB0V75t9tSNrR+tnCz6+L4ob/Cyi0FOKsJvVd5Zx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lVVUVjTu; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lVVUVjTu"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4843efcbdb2so2449087f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 02:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788858298; x=1789463098; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XiNHpVYuqEREvxb2cZ27NaECVLCJPPbGo8j+h2MHZLo=;
        b=lVVUVjTuhDvpPSQZRsjAi9x3dJxDWsHa0M3KVwzk1eFKlpbwrqbqT46zzDeSaxM+vx
         dPJd4G+aM6JRAy0NknVIuYJzbS2ufvDBrT++iUzUwt8BrTps0CJUqJcoTdPtUG6S05m3
         FRWBRJKQ9YvDW/hRd3LlOnfPQmE69XC8dW7fAp18oJZWRc4QtjsyozJ9zdSQ6CJV7oaZ
         uOrkU7qtt5DohxjLdZErZM4xWlyVFm53vfW92ldMCaOCVM3cNQ7a4k3tD3NsUxWW04NT
         Zmy4m0IGeHh801yfgg13H6BK7MUNwzAY0//GO9xOrYck64tX2QsgK83+X12OmiRpO4Am
         ZnYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788858298; x=1789463098;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=XiNHpVYuqEREvxb2cZ27NaECVLCJPPbGo8j+h2MHZLo=;
        b=BeJEXvkp6sOKO9yOEBNgTffFqWZs24ZaTwKUczhYH8YfhLOw9SiFgiO/CAAC8++sZ3
         P+0zzK4s/OzlZU+CvKrTTD5IIXQojHKKC2unNF7PJjFTvXluvOKwjR5IM46H2JQQcRcn
         wNL9QmA0kbSZFBApnZeF0RSJh6ttuvLcVVbqDEPVi4UA2nEnyNZq/ovAMNaX+0BA04tb
         WPT7O80KnhKk8lflP3QNVPnRCRKFJxcAzkyfFW/HNx53PEGznrQuLzBEv+SFyM6gIlwl
         C90/du3eE7QB+Z+vUfdelMuiMXVZpv3JQEVBtdsX8/pVj7T5/pnfx8WMOFwHVvOFSO1D
         TZTw==
X-Forwarded-Encrypted: i=1; AKwUvBwslAycDzkEKDy31EnhMAhUTaxR3XVd1o1OcrxOJPj+6ZI1a413NXW1Ok2hHXEMUlwoGmGmFXFinzIOV5Y=@vger.kernel.org
X-Gm-Message-State: AFuF++mxRJqcyTCG9ILPd7Hp2Ild1BYtJpdm3eCMLXTJ8+TrXKDuMmot
	WK9DSLnuzMGn0g+4RJiLdhFogERihJX38D7IKI9mKpz39v8MUHHoT6sc2CdQEA==
X-Gm-Gg: AYBFou3TziLUBfD2KfHjKSYSUDRZv9PHiJYVNckuiaJlUGZeBCt/N5IHqVBr4lIPb/6
	x4RmuqXabYs0rCO4krM3ACL1lAOAnZYezie4lEwqBUz49sOzl+VBLkw0ISwzrVtM/+6VacSbwYl
	mMBxB9KHFUvmFSmnPlL+xbHwO4hyYuH2TKzSIt8w2J9SSDOI5TeFcDvWJyO6xX9SyDWrNGoIk/L
	jDKiigAocAIf80u39EMij6OWc0yl81juTX0fM2PkHxrLlCK/nUErLbajMLv1yEDVX7pciwcrBAN
	EeQ1p2+giMrVOtssXLgd/9a3Bjv5o4rgsSeTMEeOogzNrHXzEqfBNjgbV4rYJ7/NR5hAhrDckiO
	9gTdgnhe9U9GsPweP/cunzPewN1KrxUDClPsl3+PSwtC71rsVRhPyu98n+yCpSjCuRXiUe74Zjs
	SaSrydpBv6rRD0TvjHqgdymJp1tSlEjc8LD/HklwmNM2dMk8mc63l0XIv07TAcPioGMVGLO8dqK
	6s+H3PyKoCOnExW7ic618YJevrMvnzmvlEk4rxhzR7RKdJr6tM5lxFQ4q44SDg=
X-Received: by 2002:a5d:59c1:0:b0:485:a46b:bc13 with SMTP id ffacd0b85a97d-485a46bbd19mr4173287f8f.0.1788858297632;
        Tue, 08 Sep 2026 02:04:57 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-26-252-140.retail.telecomitalia.it. [79.26.252.140])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-485881353e8sm34767945f8f.1.2026.09.08.02.04.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 02:04:57 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Darren Ye <darren.ye@mediatek.com>,
	Rosen Penev <rosenp@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	bui duc phuc <phucduc.bui@gmail.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v6 1/5] ASoC: dt-bindings: Add Airoha AN7581 AFE Sound card
Date: Tue,  8 Sep 2026 11:04:43 +0200
Message-ID: <20260908090448.3332-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260908090448.3332-1-ansuelsmth@gmail.com>
References: <20260908090448.3332-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add YAML schema for Airoha AN7581 AFE SoC sound card.

The AFE handling on this SoC is very basic with clock always enabled
and all the power saving feature not available.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/sound/airoha,an7581-afe.yaml     | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/airoha,an7581-afe.yaml

diff --git a/Documentation/devicetree/bindings/sound/airoha,an7581-afe.yaml b/Documentation/devicetree/bindings/sound/airoha,an7581-afe.yaml
new file mode 100644
index 000000000000..80d9e87f1470
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/airoha,an7581-afe.yaml
@@ -0,0 +1,41 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/airoha,an7581-afe.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha AFE PCM controller for AN7581
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+properties:
+  compatible:
+    const: airoha,an7581-afe
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    afe@1fbe2200 {
+        compatible = "airoha,an7581-afe";
+        reg = <0x1fbe2200 0x9000>;
+
+        interrupts = <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>;
+    };
+
+...
-- 
2.53.0

