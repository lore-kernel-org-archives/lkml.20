Received: from mail-wr2-f29.google.com (mail-wr2-f29.google.com [74.125.225.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB7AF4DE725
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 14:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790606354; cv=none; b=GGvuuMqhZtAJgn2qP9f1FOxTdJpZYX/fTrfqJMvKMzLBQ53bLL1uOmMv3Sv44H79rJBipcY8ckHFixfZn+7Sv3Ao1BBU9kcfCSbdOPbuOqXtcm8t9bQLuL71ro2S0IpY9Hv9+HdeARSTj08a8Qqbr1KECAOGvzhtZumAFcGPcs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790606354; c=relaxed/simple;
	bh=Go39NKKMwkuXXP/SejpjyZo/TgbX2bfpHuiP0B8nCjc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qMGFxap3gnvowDS/ysNcBJ1dvSL8+1orQR0Whk1FsZ2LKjUNLUMtK5HMDFgRsV+uVEapIUohBdOh1BwUqDdyZXnWPAH6bwr/CCNKcFtdvhjwSYn9B4cPU08bkt4GRJX/OBkBJxZX9CwW+neLZuFGSaFF3xW8DiF+IeHJzRuYB2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=dFTEi4Xv; arc=none smtp.client-ip=74.125.225.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="dFTEi4Xv"
Received: by mail-wr2-f29.google.com with SMTP id ffacd0b85a97d-48aef5d66c1so5800f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 07:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1790606342; x=1791211142; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=piB6olxsDjTKBBKWtT/80MoIuyo/txOuxpczb55KJIY=;
        b=dFTEi4XvVLZJszsReOkilJ7ow361Yt51GnX19cTotmVahtKj4/nNmLOU6MJUNiaK+Q
         TiT3EzjtxZPUAkoNXyufdaap4MzAd/4A460k+ECGX2F83I9iwAbwGg9HnTLR22A9nXh5
         9WXlYoR/cGo1b1NL3M+0rVm/sCVpObhpDbls5lLMcUj92lzAjlaSziKdoSfpeVaYHNZq
         Gkp786T1UQnmM+53Q6wKdw6HyBhthXxxJ3m8OPNVQ8rNvpkYLiW8ny9D7rjWcLSDP/8V
         f7YU2108AR86D37eZsXsrC5QPBKwJMjZMvZwstA7SqIv6U9Vu6eireIB25vHBi7xIJjP
         x9rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790606342; x=1791211142;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=piB6olxsDjTKBBKWtT/80MoIuyo/txOuxpczb55KJIY=;
        b=TQUViCiICa/aPQSna3LYErD+uQQKWXdul1FvIIoPFGSbqUMywGgfzFRQ86QdzwCxJJ
         2mLWUhFoNoFhf3iGGqU7F6cJ+o5U+AcNr7RWqauhXoBj3iLGviCdQ8v2gdxJGH0OZxsi
         7ZJ6QyA5O8X9/efwXzHWy0gqb/cgCO0eEaQKSTUTKYRiNMqwri2K+foLYz/7AJMjhWDs
         5I011NQgomQTm9LlyTKLIXftZEFF3DGp6WgVwWJ+aJALFlNyTalG6YH38MCGfe2bghrq
         pRTizK8/kSZvNE0w1f6Tuh4DvlDVKYDH4liXN1uyE/yBKQ+BAhLE+BNN2MGvY6oujhkZ
         kxdA==
X-Forwarded-Encrypted: i=1; AKwUvBxMFzrMRet7/Xa4PLrNAwJlmKXwdTc2GiJBPpOtFYVP+5UTOAWvrZF5jaNxU9sSJtNUyEBIPH+R7tMKXv8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLZCwbgCSRgcK1n1++MPKuNV9e7ASnJQgxJGjRUkk0zFXQBUztv
	/zrd2xSWjpLU6dG9xS9prry2yRRMZt6UessWQ+fP5jGU8TUN9j1aASr4EtX28LSYthQ=
X-Gm-Gg: AYBFou1BlDjPzo0uHvPXOHlVonXvP9wJxWFyxTaqQx5clt68oL0bCnPO3I950QSYU5m
	mj+I8zRrkEG9HQFDLbpzflyD3O6+cd4nqPdVhYpXg2XUa2/p9A5G32c5gZsjRH5EFFyxhe7IAWI
	2C89LXvvSwEEjRzfzErvm3QAIyU8Woe4Jp/xTAba87wjBcGNBnIf0Ox3ZFslk8AxQFYEmlJjr/N
	hypd1ZygFeVVt37dW1aAaqe18t9Z8atX/BE8QfeuU3a/siz34+j6gcYhcGqdCyRB5//k/Yrbiho
	7QFmxQf3VJgrYLX/tfj78HvtNOHndzdvKjaTQHQHCxSDi+wVZgkBQTxxer2hv/AbaLfUx0EBOpV
	xR10kc0ZI5gDi3q7SZWMVhLtUlaIDygJCpusi5MFJrFCVJ8TxVWylQvyqLjiKK83hMp4AwqjFTF
	5oqWK9XPeS1N8JBk3eZp25ykBVaybZ6HdzhthK0RjzPH4Pd1hHLcvl5QJa+w2f+QQ9upQ+fw==
X-Received: by 2002:a05:6000:2284:b0:488:89ad:56c0 with SMTP id ffacd0b85a97d-48889ad576amr11374823f8f.11.1790606342507;
        Mon, 28 Sep 2026 07:39:02 -0700 (PDT)
Received: from localhost ([195.94.147.179])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a6470b7sm28425051f8f.27.2026.09.28.07.39.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 07:39:02 -0700 (PDT)
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
Date: Mon, 28 Sep 2026 16:42:40 +0200
Message-ID: <ee0aa89faa14e0073f1271693bae28678652998b.1790606188.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1790606188.git.andrea.porta@suse.com>
References: <cover.1790606188.git.andrea.porta@suse.com>
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

