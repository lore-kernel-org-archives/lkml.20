Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 401784CC26C
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792404854; cv=none; b=ZEAG0YJfRK95OFZ9WzTUksMH6EYpjbXzXOHdAcqViQDjUnrbNLx0kQFgrqJ5XDNroHiV/11rEX7Ddm8Lj451x31mvyH4HhMVtK1GKC2mX4YNH+nit2ZiKPgM8GOrtVBnFAyTnL6sUKC1fhzaDozDjxDJBrdXMNpQ53JQz+jln/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792404854; c=relaxed/simple;
	bh=aR5OSmq23bLV4lV/PZCwDUREMgyfHjAL91EyeuGpuVw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=B81j+FB38RnNytzoyJ3Eer4PZhag1zkB5th3UZ0zzLNLK/FrzG4Xk+rZTNkMWpYLv2WQHYZM1QcTeA+XKYSYW4JSAtoupwj2BluWtH1X48xcyj0GpfSyrtX2b7V61LK3HtoNog3eujd7UbxMXoLGXVnHnRMlJMW8Mk2KxgEon3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q0upcJcN; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q0upcJcN"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a1e3098ee2so12206875e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 03:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792404851; x=1793009651; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GaYNfmiJAdoDL3WIMAcoiEX2xPvw24j0M/jps2oZpr4=;
        b=q0upcJcN3ers98XFTquqk4j+vwTfMgwIKkE6hoLK/zQ1sticoF5gThEUPk4CDe3Qg9
         nB9uAyU9ry92lwjSw65F+2+Om/BydqfPIjUXhXcuL9wELtIoxTlIAHq+KhuqMdQZujNf
         jKtykNNjbz1wQNBR4OENLjvtB5lA2p6BLCAwdePWGI+VwHwD/8s+YVREmfsaoxv0iUK9
         pEnwKszZJvXlUiKGLUihH79RWSw01PZbnlQj5LdelYnHzqze2m8k0wZzPPhmIc5kJd2O
         bKeDpXJ02221zJVMgZGJPo5il1myWBYusNwNnhGXfdgheGa4swKoUB42HMxLdIyFJo3E
         ao/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792404851; x=1793009651;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GaYNfmiJAdoDL3WIMAcoiEX2xPvw24j0M/jps2oZpr4=;
        b=24QYIhf4BFHwXtOYQlX41pLsyR736rqeyQEaIAxJhdAwqprm893N/wDprT1S9aGuFw
         q6Jn8IQtbktNBnp3gC24esQPVwTjiKE/JmkzE+nXRW70aDUGw5ZuowNw4Uhgsj/lb3fZ
         D0UNZckhWCOQcAWz8aaLqWv1wRbj66nSlAEzjbiA8FWskdfOGsSDbHshqbhj3T6Kuck1
         sG7CvbAmoOtRhT7Mu0U7dTtSwYu3tptHJ+T1HDUt15pKBkvgD+xOohJ+pqP3Kxn/VmQL
         cdiQ4FeFIoijtXBbvO1AiTUms8DyIG75DVb1o7nZxJi/DQV3faQyC4CoYh44XAHLBMNJ
         oajA==
X-Forwarded-Encrypted: i=1; AKwUvBxHZDrtwx8bS2g8yasfMJ4mQ4ZRwM9A4pAeg1D2XtgWpkQhQAF3dhufzmJzSYoUaC5edyplWEVRQgsHLRU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIhEOQiiiLARTaYpasrV6umToBgGKitKAwxBe/yXbMJWq9WrEE+
	xgHeejPXB1iA0+HGnGpOLiXnOqglNWIsc4NE4uDgdrwwTdV8RMyb0y40
X-Gm-Gg: AYBFou2LDwEDL4rTaeL85vJfgZa1p44F35mD+cMDoFA/FEqFTfQSoj2m3jJzGC3mvqC
	53MV+yDPv923Besam99fTwBOPz6lMZ9tw6V7WkR7/WOmEr+imWRoZO0+p8lJWQ7kkW4818jzchR
	5Y6X5qh7y8r+BvW2li4fFED97hKeX8wjmzDfUgSJlCpj0xJdLEI+WNd122itkNxUmw/iUA0bahw
	zFtaLQZrupCEeUM63MkWMThEZejZ9VAKWt0LQ97DFcOGzn+hQYfLEwKPC5ICda7K0B6bQXxIHOi
	yVV8yHXm+Z+Au0z/Vpu4ZJPOWksi/Y6eFRIHkGety0UKmZRc7M+Me1Z/658e34YbxMsVmpQ2jIS
	KJ5/WeZzQl4A4/0CmNDObBQhY9QWWStG2ddaN/ZP1cR4Zs4VvZHwLJX0oBEeH+FXB0BZ3zSxc2c
	T459Zu7Gx+g2DjS3W30oEpSYnCq/1YQnoGCi/7w2VM3bz4wpGaxEPbzWvmmBiOP++cajOTF7e0V
	mPaVARnbrnygOcYxL8=
X-Received: by 2002:a05:600c:1394:b0:4a1:d492:1604 with SMTP id 5b1f17b1804b1-4a1d75f2524mr156656665e9.11.1792404851325;
        Mon, 19 Oct 2026 03:14:11 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4f5177sm21822041f8f.30.2026.10.19.03.14.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 03:14:10 -0700 (PDT)
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
Subject: [PATCH v2 1/2] ASoC: dt-bindings: Document FM34NE DSP
Date: Mon, 19 Oct 2026 13:13:55 +0300
Message-ID: <20261019101357.117462-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261019101357.117462-1-clamor95@gmail.com>
References: <20261019101357.117462-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Document the FM34NE DSP based voice processor used in the ASUS Transformer
devices.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../bindings/dsp/asus,tf201-dsp.yaml          | 77 +++++++++++++++++++
 1 file changed, 77 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dsp/asus,tf201-dsp.yaml

diff --git a/Documentation/devicetree/bindings/dsp/asus,tf201-dsp.yaml b/Documentation/devicetree/bindings/dsp/asus,tf201-dsp.yaml
new file mode 100644
index 0000000000000..46308a462af16
--- /dev/null
+++ b/Documentation/devicetree/bindings/dsp/asus,tf201-dsp.yaml
@@ -0,0 +1,77 @@
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
+allOf:
+  - $ref: dai-common.yaml#
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
+    $ref: audio-graph-port.yaml#
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
+        codec@60 {
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

