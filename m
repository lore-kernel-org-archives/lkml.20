Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D478475356
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 11:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791806057; cv=none; b=jcWGz4OEi59/D5OEv8aOBQjASNpU7w6zqr4cnlY9MaBXn9M2GRDBl/p0+Rz7N8a5r15ON+/mfx/Qt2t2+bjyU4YezRlfNPjN7ktLW+mWolAU3x95JHmMrBW10aXvyDd08Z+7FNtiCrAa8HB7DQ7UUqtd8iZxVEtvLK4a+14SO6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791806057; c=relaxed/simple;
	bh=+ACzDZ9zCTPl4MqlGYduxrW3izR83l15T4nvctMtD3I=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nWdBo1rkBdaJ+ACG+xR7/dHB+6C3Wxg7bZRhvc7OXIAIL6jHPyIv6PeIoP+kXB7QnsXyoHmhJ/LzFHb4NYBY5/Ncqu4YAsDNHa6kQFQT7Bn7pOzi4JcJt4m2axwYfO24fZhFobrdDfBPydJ6U6923rQ2GM4nvRfxlIxm3I9xsHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o4ev5JN6; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o4ev5JN6"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a061a13884so15482865e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 04:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791806054; x=1792410854; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Qp6mhWPp883ejORG1lCokPuAQSQmWRK0wbW6sXM1LFg=;
        b=o4ev5JN69nUWElEbD+Ppk+pc0UeCeGqG8Tp1RbCSBnEUkhHynsQCrubFvCMzp/PBFc
         uvdoOOKMTB4JJ/rhRiaVdPK2B243jq5UULAIcCF+KpXbdtzYcUHFEAukma5Xvwm0W9T9
         QSQRmIRtlWCY0JSU9B8zpHjIsGFVYk0Whrh4JHYesCIloQljSBB0zjY1iG/31ALIC/Yv
         EGe5Zg4u+U21BPZnuSjQkE2opbrKLFq3FdgU1gs0pVfj5DZ8FglNvI1q+sgU6VIDcjj8
         EQR9xXKZnfGAzyKSO8AXA2cKm41r/aOg7Eg+JCMV8y4ogeq04CxrfAYx968vhMBQTQqN
         L00g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791806054; x=1792410854;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Qp6mhWPp883ejORG1lCokPuAQSQmWRK0wbW6sXM1LFg=;
        b=w7mZJ58TMOqnZnSevKqkp90t0SJUeG9EcgbSh/KBZq+tqH9dY8NN5gTVIvi7EV2rhx
         QY8xzf3JxKi2t8erJhhNkd/jdUsvL14tRw+nDWGqiEjyVBFPjdnnMzXa1pPqVfUEEkQ5
         Ry74SJQMODzYLojBkKwEJhkJJRNnab9IDq91SrX0clwB6eKbd+7O+t98U0kfW6IVf93F
         EeAu8khm5wMmz6aTDmkgVVkxCMsaH/0CcQyoWJcBnU9iiZexwhQzj8hMP3wODbamW94K
         utYE8gpn8xvP1PBpq61/Myz8SDLHOZ15OIqr2cFvtQtxpQqT7QaEoDu7WosBf9yLTZO2
         qMjQ==
X-Forwarded-Encrypted: i=1; AKwUvBwsVD95zaBWNpzHsChcCTD7nBbd4thn8/nQXhYxvu0kq+xuN/aiHZY5hlwbKjpma6nssTsWfEu3kGyMHgU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIB4FG5K738jOHfI0kFWq08EhVjFceusqq690oQeUZzEqS89WQq
	0AblsAjC2snonltJ74pVY9dpiww2AQjbBNxQOOFonT9hNjCZcNRYP9sg
X-Gm-Gg: AYBFou17Lu7na9BB3LsAtyVwlyo3VWVmPHn7U4g75uuOK0l3SD0tCh4Nd+Md8dK0J+6
	oaKbTdZKoVWizt+J2rteU0kSpCVXwJZ9QjOhopn+H8NsaCUN0o9LU5wBghpBYcWJIB7LOTmD10R
	1F8CsavlZaS1RwaefLpNs0GW34W3YC74ZAuLbFptYx0A/+amOCbVmqBCWY6sfHBbMoeYahD6Ui+
	d2hDQdoFyI+FvU355Rt78tGqfCdOJB+5vilJBrY+MfurfXRMKWDZjE4z9uGBgrRABdUUMmsUDIO
	51yOTxHuYfWRIH7XK7UHRdPcRZaf12Ogr2lNEz3io2RaOkIOFq6mGIFoc9wzXuSC+go6NKiYBgM
	cP3vSm9MFbhxm+HdZItTOdFMT5Wg9caDIPHZCvVWB9FDjD1QMQf6SXfGhzQ0ojiEYVmTqd/3SpL
	13sYgpsJ2+Octg5SiAjrLZdRFYROoZBW+A12snQ+BV9o/hr+Yd0zrX2gB4BkHtMvTJxZL3QospH
	qUT7USbfy7+Hzuo+hqwmHfsiEz7rN1dA6ryaX7oXqeoGvChancPmH7npCdMrNsPbIuF5cYrw8y6
	aWd5GH8/YPz3RoU5CnjE9A==
X-Received: by 2002:a05:600c:3554:b0:4a0:1b14:e283 with SMTP id 5b1f17b1804b1-4a18e43a1cemr174486315e9.1.1791806054107;
        Mon, 12 Oct 2026 04:54:14 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-95-235-252-189.retail.telecomitalia.it. [95.235.252.189])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a18bf2caf4sm311783805e9.10.2026.10.12.04.54.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 04:54:13 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/2] ASoC: dt-bindings: airoha: Add AN7581 PCM controller
Date: Mon, 12 Oct 2026 13:54:06 +0200
Message-ID: <20261012115408.87066-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261012115408.87066-1-ansuelsmth@gmail.com>
References: <20261012115408.87066-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Airoha AN7581 SoC provides a PCM interface for VoIP applications,
supporting playback and capture at sample rates of 8 kHz and 16 kHz.
The driver configures the PCM bit clock to 2.048 MHz and supports
8-bit and 16-bit samples, with up to 32 channels.

Document the related compatible and required interrupt/reset and provide an
example for it.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/sound/airoha,an7581-pcm.yaml     | 52 +++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/airoha,an7581-pcm.yaml

diff --git a/Documentation/devicetree/bindings/sound/airoha,an7581-pcm.yaml b/Documentation/devicetree/bindings/sound/airoha,an7581-pcm.yaml
new file mode 100644
index 000000000000..e73236453b88
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/airoha,an7581-pcm.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/airoha,an7581-pcm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha PCM controller for AN7581 SoC
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+properties:
+  compatible:
+    const: airoha,an7581-pcm
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  reset-names:
+    const: pcm1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - resets
+  - reset-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/reset/airoha,en7581-reset.h>
+
+    pcm@1fbd0000 {
+        compatible = "airoha,an7581-pcm";
+        reg = <0x1fbd0000 0x10000>;
+
+        interrupts = <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>;
+        resets = <&scuclk EN7581_PCM1_RST>;
+        reset-names = "pcm1";
+    };
+
+...
-- 
2.55.0

