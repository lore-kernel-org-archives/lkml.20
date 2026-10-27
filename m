Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793101183;
	b=hHisM07ZCrO4BYtCQ4DOvM6mgf3Z1wx1a9dC2XACfTDuvHt5U0ZWTr6p0sbNA1X1CjQg
	 mLeLvkIdRH4SnlLKUJ6SyWuPWqZu2E1XWhimzULk1UqIFl43KIXfq0lUbsslhpLHWChb1
	 QZB20qnLKBF6+39afns34WEtv6ACYasI2uZQU29ZUwiSLixgNQA4fey8tTUDxlAhwsf/2
	 6fcQoJ64zpvEfxbIdpuyzb7iq5fH8AuGirMOcBBQIH6MWG9KCqKIlzl3fhf+GT3kN7bT4
	 IhC2GGO+6E94viWqZhyN4hJ8USma4IatfaSKKNQpnvVF/5BTDXHsgyzgB0GY9vwLr7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793101183;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=2Tz2Y++B7a7rKvRoX+4cYNKQyDY5thruOl2DK8uaPEY=;
	b=av8lZr4F5ESaDUlkdO19sS6LQzmRx7IJJiLOQy1763UGVz7SQqsPcXJZZ1oxrwzZWGSK
	 NHAs01KS6c67EXf+OsRuJOEfv41+BBmwZPqg81TRBVnL/A7LTWjlGHv78etfWjqh8Bm8f
	 OZzVGWABd3yylN9cDUIu9Dn5dvZ0MpybOsP0hHPXhsI1oJhb8XTUq8fTOYfDnldvNWo5V
	 WlHrMolEDoPO0BX3BkVUFC6tAh2XnuFYMCRp1CbPOsySITIH9PDkAph6FRJQ/kUBRtfIW
	 cKXR4/pdBvfQsakL1YnY5I5NVrDOGv30OqoqOYVNS9FIkDOxEClyIAM4CHH4L0eyfXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jKHD8slx;
	arc=none smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21F1D606AED3
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:39:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21F1D606AED3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jKHD8slx
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c43373ae89aso609992166b.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 04:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793101181; x=1793705981; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2Tz2Y++B7a7rKvRoX+4cYNKQyDY5thruOl2DK8uaPEY=;
        b=jKHD8slxvdEgGMIPpyIp1f3/cw5FGjJQx2IA3ge/1E6WkyBl1FZShR1uzjyX8h99zd
         d5o+Jk3wO4AzB67PRZ1SIEFznVW8CmRVa6w9VgjbRZ4xG0xWrtoxGUMf+58b51/wKAvu
         nRuyAbPHkMnS4v6kTNDBV8ps7DHjBXgvvcEOAGEtAPbeuzD5ZmX3B7pC7U0GO7hE6i5P
         kWEMTog2wx51xwicF1ifAEJu5PkDeKhpcgvHNBieLqWVjXpEptC8GScCyClnXjHzyr/t
         suP7Npfl4hrOA6om3v6lJ08lc1C2R1tZeJbWJLFo3ez5eyeQkEcZ6LLjgegDgA1uXl9I
         6BeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793101181; x=1793705981;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2Tz2Y++B7a7rKvRoX+4cYNKQyDY5thruOl2DK8uaPEY=;
        b=zJ2g32nYa3TZ4bTINBSYTPBUU8gaxeP5ZFYAH33IjTsrBm5xaT+hFt/EJHVJYxMotm
         TSRBqL3xVPURJf+RumW13xqKXFoRUiXvMu0SQl7kv6bHSeI+YjZ2chqnZ2UA62xSVbi9
         DaIURKbVSfmtjdwimeW3Kf/jM9YJYUoYZqcGfkWUAoGLOXiqwQZBw5NYCfGmI7LyUmog
         vq2Ytxo5bPs//HDjLJbPTkxmF2i3yVzKAJvgPFuATcZR+hy6MBjmwH5+imvucE/Qoe/t
         4ShUi0iUzhjnSlKqZHxFjS1AQWRqnOZ6tI/01v+rjPIM2BBYDLzmRaYRTCt782PjQ5Gy
         qJ6w==
X-Forwarded-Encrypted: i=1; AKwUvBzDPP88DStmgsJ+oaKMFbPfrHcGbzwnvnNsZXUrs6C8CgP/t1gE6biw2n7YmL2DNYYprgSuiE/RwmtHRkE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLicYvszqV7BfoFEKP7kvan25LxILpBhSv7WFDE/6dHmog6MLgK
	gx2Hgewh9buu1zclOUKbFOSfw5Pxx+xKo5WhjEg9jkZql0tpLMCmgZMqXzD0zg==
X-Gm-Gg: AYBFou25GqtBjDdIN1up/MjCxhFmBdfnCvnsiXw6VDOsZLZ/TJMAUOmqP6YUwtd5Gcy
	7TXAfeH7uSws0Q9AMzXF2GC9H1UKWbKeSwW+GjxcJxj3rxX/BvVsUQziFUH7g9UXor+BxUsl0VJ
	dVhNJ+vSpkaPtK9oHP7wNWbdQa+hxTjwoBwZd5hECtMPlSlBhFmsQGtruIZeb29JakLacYASqwr
	ISkk+Gc8/rCKiuUwMC6bf8OtJiiOC/vuKNNcydmgb9ufGLWM7afw/J6OsZMfn6SOnL64oNEnxCw
	cyIHjeoNAW/GWs5NJ65lNkLphFKSnHJbKLy6fq2hRg5Tqgi3SD4zu+KjpVNBbFsSoWHE3UERqUL
	q9s5A2LIPJ+Kc7pXNT6E2HhdJ+15Ok07nGGM5DXRx5ZvwKuwtpSL+U8w4f9SvHQj9ek9AST2AdT
	E6dIjI6fewB3Hh06Nz0Dyh2PSP/06eJUgbPYGB6QjqB5uAu2nrGF0aCrR7PTe4A0voxaLn5I25l
	OJCp7Y3P0gaI9G+f9yKd5YNufQ8SP3x1lBgxQP70bVEM0v1blwBxCYjDGlAC6Tzuo6100fKC+Cb
	Yw==
X-Received: by 2002:a17:906:f585:b0:c46:88ef:2e46 with SMTP id a640c23a62f3a-c46bdac306bmr909348466b.1.1793101181423;
        Tue, 27 Oct 2026 04:39:41 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd7abf6asm430272466b.81.2026.10.27.04.39.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 04:39:40 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] ASoC: dt-bindings: Document FM34NE DSP
Date: Tue, 27 Oct 2026 13:39:27 +0200
Message-ID: <20261027113929.65102-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261027113929.65102-1-clamor95@gmail.com>
References: <20261027113929.65102-1-clamor95@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Document the FM34NE DSP based voice processor used in the ASUS Transformer
devices.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../bindings/dsp/asus,tf201-dsp.yaml          | 74 +++++++++++++++++++
 1 file changed, 74 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dsp/asus,tf201-dsp.yaml

diff --git a/Documentation/devicetree/bindings/dsp/asus,tf201-dsp.yaml b/Documentation/devicetree/bindings/dsp/asus,tf201-dsp.yaml
new file mode 100644
index 0000000000000..8b39089c99a9d
--- /dev/null
+++ b/Documentation/devicetree/bindings/dsp/asus,tf201-dsp.yaml
@@ -0,0 +1,74 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/dsp/asus,tf201-dsp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Fortemedia FM34NE based voice processor
+
+description:
+  Fortemedia FM34NE is a hardware voice processor (DSP — Digital Signal
+  Processor) designed by Fortemedia. It specializes in real-time audio
+  processing, focusing on noise suppression and echo cancellation.
+
+maintainers:
+  - Svyatoslav Ryhel <clamor95@gmail.com>
+
+properties:
+  compatible:
+    enum:
+      - asus,sl101-dsp
+      - asus,tf101-dsp
+      - asus,tf201-dsp
+      - asus,tf300t-dsp
+      - asus,tf700t-dsp
+      - pegatron,chagall-dsp
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Master clock to the DSP
+
+  reset-gpios:
+    maxItems: 1
+
+  bypass-gpios:
+    maxItems: 1
+    description: Signal that switches DSP into programming mode.
+
+  vdd-supply: true
+
+  port:
+    $ref: /schemas/sound/audio-graph-port.yaml#
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - bypass-gpios
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        dsp@60 {
+            compatible = "asus,tf201-dsp";
+            reg = <0x60>;
+
+            clocks = <&fm34ne_clk>;
+
+            bypass-gpios = <&gpio 222 GPIO_ACTIVE_HIGH>;
+            reset-gpios = <&gpio 115 GPIO_ACTIVE_LOW>;
+
+            vdd-supply = <&vdd_1v8_dsp>;
+        };
+    };
+...
-- 
2.53.0

