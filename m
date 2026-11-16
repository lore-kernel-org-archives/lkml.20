Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794814820;
	b=mVJNMovF17ABZ9iPaNJLnEAW5ZkCD1USMeY6qPe72U/pLA+Kp5jx9Bzt34BrQwdxMBCL
	 sMKqPPLLKLb6qh5Jrk0MCft1eBv/0/NKsuETGdSs+UvHbgnGy+FMyGgITdv2+4lxsp2PR
	 YeoiAOrqpmOuFwKFKGV+A6SLS99qYsb06TDx8IVfU0f4s/t2dn9uMh3bxErMRlqtsuyAa
	 7h3PpUUANq8x5JVBjIkXnQhcJ6egPisA+1bNNpdnqW3JPWcU2qRSoeJiNpbdntPw+qUiy
	 vmktoT+TkXI0GrkfDJjLjJxcVB2rf0vT2d+VPoV1bOw0gdH4Vt1cOTxDkdWVwqEuBmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794814820;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=xyQrPGCPEbH8yQYIpRCWFwW9mLNyzd5f976QgJ4wDRg=;
	b=bi8DX+Zum5bqHWh6swaPQCePzIMhCF8acKoSpxhU2IS3Rjs16LBqu9P3za7pVanWNtRB
	 W3DwkqVTkpfYbGqN4dFQHnxK2VqaHfwEKo3IrHi3Czrb2C8+p8ZECRKvFTNFHY3EwoQ0X
	 AE67TQh8fEhoV6JRv5vu8LflPIG1mYa4Arz9Bc11H5bnNZjrMUpPHVLpxgm+PIi3EbQFw
	 lO07hbtYHKCo1X7bmiwXrjjdDqdyLi5JChW6DW4m9XWMakEuZrdNd+h4C+UKAOgNAmk68
	 aahUl87Xj8go5aROfw2TTMsbP3tk7ROZlFVQtCW3Hpi5u8jGq90ipKRR82yxzhGPEqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MQIllmdf;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B15FB60A2626
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:40:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B15FB60A2626
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MQIllmdf
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so19585615e9.2
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 23:40:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794814818; x=1795419618; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xyQrPGCPEbH8yQYIpRCWFwW9mLNyzd5f976QgJ4wDRg=;
        b=MQIllmdfsamobYuYUbGh9pvlZFXvPPC48p3GzVjsX6TjMA3ZgemLVBR07Z5z9Pydgz
         BxmvMPGn6WGP+hHdEsPbYZJRL4BlW66LGLG55I1Rm9ppkiw02kUOE9DSKphefjhRHydL
         bPg9vXOPPx8xe/4on9mIkq4CkgjmcT7T/F3seQ0wNgjGjdmqW9S+5h3ecYHWgCQx43Wg
         Huest9FK/uzkeER2HS91v0veh8tjxG5oMm7lKtuxQK8ZRwnLxpF3OHvmGL8Gidd/ca+L
         E4R7h0BWSJcqGovUYSWpOToJanLNrfvuAX38juFYCZialZyFGIdoPfRfpfpBsKfPNcn1
         larQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794814818; x=1795419618;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xyQrPGCPEbH8yQYIpRCWFwW9mLNyzd5f976QgJ4wDRg=;
        b=S90ss9qXHld1GdmQzgObD9BzzWnL76u//BQVLj/+yF2Kco7yhncI3qczxV3Nr/ZE+4
         CaTUi+pDS1yfIQBemKHrozoKmBujcSz7ibhVGMiMcBL2HBjswk7Jyvm3eZDeM/hUFD0C
         d9cdQdqWL0gHE13fcSKrDSCp18Gd4zvrZWDrey9DeU7J61qbh0F1LyBsoW1rGh+pTdH9
         s3iBiLvedUUe7GSUwMDeP+XPkSXeQWL2U+nqF/EcJ4/YMIB6MmpSbmW0fBRMQpuNk7be
         NyV5ymx5g+0BWeTnHk4KIWUxAnCxZtzsQ9BL0xZ/z54GKX1dbcCayCTR2MGJVb3yWueS
         cwjw==
X-Forwarded-Encrypted: i=1; AL+hErHbBTRG987JKWfRu9vKBn7iHO2p7EA4TcqWqTj8Y4MaBgrrArWRwDFmzTgU4TY3kqdkluooI85p8cweplg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/L2rafn9ijcrnApRyPS2MEvsSVpDlqy0lgRmlvi2Uz2fwyUmWo
	lsjr1kxELJAiZ7HKEzDWeLBHJfP201ysFARNm6MV6NG8IZU+/4A56RprNY45JQwMKbmW1g==
X-Gm-Gg: AYBFou2hkjzehpgB6DJCo62KAhrfRtEJsY+3yl8DvEqzbFGhx0U6VIxX+houoAFklB9
	ZZTRyzea5hKAeS6mp3RSgf09FbMH0LqaicO5j+6yJ0AxYKidfWpNavxCIYj5Ts97GlxxLNr+Y2f
	mhD7nDQTatPF1TwRQHw4FBvNpI7il/1WtkEnRv/cyhVKiw8iUuRXD2D2Pcu76JY4h9cwfRTNkJ1
	S2RTWbsqiSfOmfYmcOadLBycE2WekeeTlYAWu97Bs6PMbGgiuk3h+4LwK1eWabImoLtd3R3ErG3
	4ZqH2JzGFHdSSJRvBuzD4bFHgp2+x6JCV8PcMFlXGawkzYDe95AkCGPw+wJOYbqSrmNNrDPALnA
	L6wHTMhMPMWWqh+Xl4lCC9XiJTDPLK+QSexSSJURRMDxVSVQ02D4vNhjSnbB3K5E/fPyFwO4Klx
	M2WTzhDWEfJR6Z0NlG5GPUMHWk7tyl82vHj1jv5YkfiajmDKesO1SprjBt3fGDplwMxzsWuCjvz
	AxsieomAqS/EOgE+8qnIPJNpyis+tjBWjc4jLy31Fw1/vYLmOs70H4Gbm6CpX24O43KpdQ8NSjd
	gEGMjZkPUCo=
X-Received: by 2002:a05:600c:154a:b0:4bb:6a5a:7824 with SMTP id 5b1f17b1804b1-4bb6a5a798emr78860495e9.30.1794814817903;
        Sun, 15 Nov 2026 23:40:17 -0800 (PST)
Received: from dl360p ([130.61.107.245])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb571cfa2esm259712705e9.2.2026.11.15.23.40.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 23:40:17 -0800 (PST)
From: =?UTF-8?q?Adil=20H=C3=BCsrev=20Tepe?= <tadilhusrev@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Adil=20H=C3=BCsrev=20Tepe?= <tadilhusrev@gmail.com>
Subject: [PATCH v1 1/2] dt-bindings: iio: proximity: add Imagis ISG5320A
Date: Mon, 16 Nov 2026 10:40:12 +0300
Message-ID: <20261116074013.355363-2-tadilhusrev@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116074013.355363-1-tadilhusrev@gmail.com>
References: <20261116074013.355363-1-tadilhusrev@gmail.com>
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

Add a binding for the Imagis ISG5320A capacitive SAR/grip proximity
sensor (I2C), as fitted on the Samsung Galaxy XCover5.

The binding was drafted during XCover5 mainline bring-up with the help
of an AI coding assistant (Claude Code, Anthropic) and reviewed and
validated (dt_binding_check, yamllint) by me.

Signed-off-by: Adil Hüsrev Tepe <tadilhusrev@gmail.com>
---
 .../iio/proximity/imagis,isg5320a.yaml        | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/proximity/imagis,isg5320a.yaml

diff --git a/Documentation/devicetree/bindings/iio/proximity/imagis,isg5320a.yaml b/Documentation/devicetree/bindings/iio/proximity/imagis,isg5320a.yaml
new file mode 100644
index 000000000..b23d6bafd
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/proximity/imagis,isg5320a.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/proximity/imagis,isg5320a.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Imagis ISG5320A SAR proximity (grip) sensor
+
+maintainers:
+  - Adil Hüsrev Tepe <tadilhusrev@gmail.com>
+
+description:
+  Imagis ISG5320A capacitive SAR/grip sensor (I2C), exposed as one IIO
+  proximity channel (B-channel diff = CDC16_T - BSL16_B). As fitted on the
+  Samsung Galaxy XCover5.
+
+properties:
+  compatible:
+    const: imagis,isg5320a
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+    description: active-low data-ready / proximity interrupt
+
+  vdd-supply:
+    description: sensor supply
+
+  wakeup-source: true
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
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        grip@28 {
+            compatible = "imagis,isg5320a";
+            reg = <0x28>;
+            interrupt-parent = <&gpa2>;
+            interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
+            vdd-supply = <&grip_vdd>;
+            wakeup-source;
+        };
+    };
+...
-- 
2.53.0

