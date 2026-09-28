Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 723CA4CA29B
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 13:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790603732; cv=none; b=EhC0KTBupkBZkE6r5O3fWDWccH+56eoThXFw50nFeN9FL+Gy8ORtb+PNqNW77+PmCxm+WG9xJGx/gumKNLMurtiSf4Zcz3YmoNm5fc3ttOi4R+NCKoJeSyPQu2KQ7bwolLNi5yvbMF3NvCjJAbLGPnOGonMjq/iGGKvL+PE2ybg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790603732; c=relaxed/simple;
	bh=Go39NKKMwkuXXP/SejpjyZo/TgbX2bfpHuiP0B8nCjc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ca5drFhgKvA6YeYsfvGFt4TsOO3fA8v6PVwxpl0MqJqN4D19HryZTX59XX2x7tqcnpCAlmZiId3R6H/Yp9mDkuMH9IlKJGDHzId50aZw8E8HURBYgtXDdkadDdf+EFYZ6R31tpufKXJBXcSEFNLaDT573lYTo4ikuAOYh8VhCVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=CU8BdcPO; arc=none smtp.client-ip=74.125.228.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="CU8BdcPO"
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c2a1f611461so7247266b.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 06:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1790603729; x=1791208529; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=piB6olxsDjTKBBKWtT/80MoIuyo/txOuxpczb55KJIY=;
        b=CU8BdcPOnAMaL1BTI2jhn3KBXRlajTP5cLe0gqrnsKlywJQVurGGDtVLKcEap9kYlc
         /y8/sANIvOHoZTf+KEcK3YXtLVZEF4f2QayIk/EpwjKKCizipC9tX+YVtfegwG2yRlc4
         bTDFL2LfyhxPwHHyyHXQhgTvmtf5isgMUh71p6tvGxH0SDoAHWLIrogUvRQSQrNzEaAV
         2SF/lWKWKCiyTVdW1ptummdSsgJCEi4MUoSq56Kr1uugBZxgD05Mjf4qut5KcPxQOZbJ
         5MGHWCjYAuCgxbZNf7DJPVfkqC4TR3x4f+QaipzIKIudccS9fvr3zdKBUnJTKePFqyaP
         85Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790603729; x=1791208529;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=piB6olxsDjTKBBKWtT/80MoIuyo/txOuxpczb55KJIY=;
        b=il0uBUqnhMEtByb28Gfg0XkioaorORu0hgk+nSjnstOyB+U/OqdoEmBrTxQdZ8ufyr
         wLWo3y7J/dx0epEK2UIUxSEmfejUx1uS/VyFicD1WZryG+yKsf6IOM+n3y+SlWhuoJca
         nxUdrGJJR0TMxlN28Nsjd7XBRwOoU6BklX58N4Is4VOUvWewee+NeiScfhHReRU81M5c
         AKk1Wi4oj3WoOjlqKUxnGBaHqeNN/KzXf3xKcy+YU4YYUhulgPv84tt2bf9Iz6lWdq4A
         XQN1JKl1MPb3cf5c51LqMVyFCfELXqKXEkxPyS0nhMELGbyEaW2bY6LTH5xN7H8ER3Uk
         D0YQ==
X-Forwarded-Encrypted: i=1; AKwUvBy52pYz+gsZ0y1taGL/LKK5IpNxQx+g3nMQoKiifrDXIpCUGN5YTwrY8O5LjDTVhDLSRdFGZ/UoETJM4NM=@vger.kernel.org
X-Gm-Message-State: AFuF++klB6338DtH76Scmrajlxw61YZ5HrqeVaRnYLkmzwIih/qGaP/6
	4UBfqB+waBWUgglEZlgoYGVGY6qV20Pq2z6j0btAsq1d7XSKagWdBgOO00ch2m0vwCs=
X-Gm-Gg: AYBFou2qMagm3Ce3j0VnJuW9B6dHAO5UWBA8VCw+xrCjjL1EzJQC3r2fMKpze7OajST
	sNqJKoUS1EJoczgDgWFrI98CSL/4TG209NPYs9x8nM2wLqTJ/0izKgcZWLt+kRSZeyDQhS6bQQN
	p+4oVzQVXNoxdGnukHndf+IYqi38/26weJDff5r/Ap3KZ+6SltrgDC8I/Ojx3gKENS07kOTXNpZ
	BvqKVyhYdo8jgmWGFiXfumw5Dl/YN/tC0TmYWrVPAXe/oE9m7vY3LzuIeqRLdIiSH26mNXeYiPo
	pzMIc+gc4RUjbcBteiKjQxDIIZpiKpwtmdjUzg6DI7wF/LGJPfr3ms9nMUuqkfArSal+r8rBnLq
	cA807mCTSIO/Wk5U2FQCEsoIM0zB/eeRBYXJNOrDE+AxuCW90IiVvGZbgk6fAPzkQy1v5+yi6fo
	5b8c1qbs6Tys3KOyMrJp2C9cOaYmm+OCMNXg/SqpkROqVR1O/HI2CCV/JHleP9YtgZxc/ueQ==
X-Received: by 2002:a17:907:c589:b0:c2d:c80e:8366 with SMTP id a640c23a62f3a-c2dc80e8413mr372966366b.0.1790603728763;
        Mon, 28 Sep 2026 06:55:28 -0700 (PDT)
Received: from localhost ([195.94.147.179])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2dde41e1f0sm139221066b.11.2026.09.28.06.55.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 06:55:28 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	linux-pwm@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Andrea della Porta <andrea.porta@suse.com>,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Naushir Patuck <naush@raspberrypi.com>,
	Stanimir Varbanov <svarbanov@suse.de>,
	mbrugger@suse.com,
	Sean Young <sean@mess.org>,
	Julian Braha <julianbraha@gmail.com>,
	"Gary Guo" <gary@garyguo.net>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v10 1/3] dt-bindings: pwm: Add Raspberry Pi RP1 PWM controller
Date: Mon, 28 Sep 2026 15:59:00 +0200
Message-ID: <ee0aa89faa14e0073f1271693bae28678652998b.1790603500.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1790603500.git.andrea.porta@suse.com>
References: <cover.1790603500.git.andrea.porta@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Naushir Patuck <naush@raspberrypi.com>

Add the devicetree binding documentation for the PWM
controller found in the Raspberry Pi RP1 chipset.

Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
Co-developed-by: Stanimir Varbanov <svarbanov@suse.de>
Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>
Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/pwm/raspberrypi,rp1-pwm.yaml     | 66 +++++++++++++++++++
 1 file changed, 66 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml

diff --git a/Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml b/Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml
new file mode 100644
index 0000000000000..be020583fd0ba
--- /dev/null
+++ b/Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml
@@ -0,0 +1,66 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pwm/raspberrypi,rp1-pwm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Raspberry Pi RP1 PWM controller
+
+maintainers:
+  - Naushir Patuck <naush@raspberrypi.com>
+  - Andrea della Porta <andrea.porta@suse.com>
+  - Stanimir Varbanov <svarbanov@suse.de>
+
+allOf:
+  - $ref: pwm.yaml#
+
+description: |
+  The PWM peripheral is a flexible waveform generator with a
+  variety of operational modes. It has the following features:
+   - four independent output channels
+   - 32-bit counter widths
+   - Seven output generation modes
+   - Optional per-channel output inversion
+   - Optional duty-cycle data FIFO with DMA support
+   - Optional sigma-delta noise shaping engine
+  Serves as a fan speed provider to other nodes for a PWM-connected
+  fan.
+
+properties:
+  compatible:
+    const: raspberrypi,rp1-pwm
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  "#pwm-cells":
+    const: 3
+
+  dmas:
+    maxItems: 1
+    description: |
+      Phandle to the DMA controller and the channel specifier for
+      the duty-cycle FIFO.
+
+  dma-names:
+    items:
+      - const: tx
+
+required:
+  - compatible
+  - reg
+  - clocks
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    pwm@98000 {
+      compatible = "raspberrypi,rp1-pwm";
+      reg = <0x98000 0x100>;
+      clocks = <&rp1_clocks 17>;
+      #pwm-cells = <3>;
+    };
-- 
2.35.3

