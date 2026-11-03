Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793723841;
	b=Lvd2fxOIEXKTsQ8+Nkgq+BzXNS8vlZetVsTK30PvJnGA8EHGHRJN6swun6c7KoaesJ5D
	 z8CYOLui5xuVyDQ2PXGyxIkKCouH4h6MpvFDc6DxutTmc7k+oSLkvkpyHxb5Or6Lt7FP/
	 OSF/COh60h2IWiOwlK5ew7W8kUe5AM7vC6g14V/zygA8a6+Rc2shoPXbog1K0ejBhl+AZ
	 nV3KONHqcRe5qJqjZUs6/vI8SwgtRNgkIcVfLk6iJfzlEZPv478B+5BE+PWxDYvYJzKdL
	 dO+aEMhP4BnDI3yHCxwzgdDdmgECl/mRqbd9p/f9HfkEWIOjLyJJkC2/b0ADb70WKng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793723841;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=zl50UKdvdlW8XEIziu1Zq0cNn23HYvybJSqNilE3YHc=;
	b=YM3xWVG1gSafdAXkJoAWHcccG9E32bLn7GQGhQOC5+ewoU/WPo4gAfTT4hnafY4nYjGk
	 qe58k5Yuy59TTwU/0FL5P0kUTcCTsXAv72nAQR9nECL8Ge5oNlQ1B8CG5MVb0bNvn8UG8
	 rXGD8TE/pp9c/r8Aol6g1//89hTw8bCErEBOn8wQeQmp2EPyA/qv+10rDQ7rsGeVCidbd
	 44uvZVZbQVhsKbFzVEMYXCONZKXhp1/hplu12UZIGVXcCjfRx2wmLGSl0lwKKYJtAAiUQ
	 CAshgeBz52qwQUpog3ZNsvwaZjy6o7usReUvfykfCIuWPI6u2+81n8XTiKK/QFjjJ5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E69D9606D81C
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 16:37:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E69D9606D81C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48e0d1da913so759923f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 08:37:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793723839; x=1794328639;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zl50UKdvdlW8XEIziu1Zq0cNn23HYvybJSqNilE3YHc=;
        b=lCWADGBD7FNhJGL4y/GuXQFBodUi0EVC+ii4oVzRiC7N3GojUVuH/h6LI8rjGidNGu
         Z3r8oQolS498tw70hYJnvzOvTA6HeVXgjqYywo2pGTpr8Y5Q3oi4q0iTgDIeBYf5utHR
         SjYWSxJ+Gwx+Tl42maWSfSHUuhcARp452LDaJRE0K2lZEEdNmyVGXgSBn7R8QH/+aZ3q
         5XPLMMNayHR6GmhCDJ9Q26qfXJQAmHzRUbY1NScWLn6SDzreNyEQ+8QUTg2JcN+DQ77e
         6IPaD6NN3ylbuwFhDTJnYkyrYwRKHgHunQCFKJ1l7xC2r0FrVgXyHUGqKSZjaKb0rWhm
         4NEQ==
X-Forwarded-Encrypted: i=1; AKwUvBzLibr4TCeNfvauCkDtb1KHC5d0Q3ljkN8D7ybpXy/2dM09ZklmuozgAyI/SCu1uZBw+0F1QO1UNkzWWeI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/UUvuwpsnMrB8KQFp/vQBvr/5FuSCm1M0h7Lpvm/VE0JshV/1Q
	rPWTcpHP+5ydMFW/X4PjcnNIq8LTdoHrLt4vQ6sJFSOSVRGN3MgFy+El
X-Gm-Gg: AYBFou3r3Fr3eAJyfNIPaMgPOXF0KuRxwCuCdticI9wr1iBf6cMs9L9zNd5UGQ8ww5U
	04dUEOlz3H9wdinpX5d6lHdAao5nOXtaC2D+gGxH8gj85EGC/Id0dYI4LmZ0Y4feFVY3seZ79tB
	li/YTSI+RPICssttk8ysD5pDF+Xfka+kb+FTBrgr2vL/6/Q7Gxn2xUhkeErZ51s7w9AD4374Rda
	lqO3+TwE/ZGNljNPcr92mwSOIwh7Rs+HswsqwNnEtkSuSH+coGW+BBxbWI7nZiXR7qB1Srml75R
	bKcgQCT4QTjNY2FDtdqQySI+8qRzOCV0o8PB3maE9R5Z5uSHNW1IjZlYdsP7bDpO+5cqQFlVVgD
	rZkxpPExmwMa0JVQgqy2Gj0x85wYTjRuH5JxEiLde7HDhbHs0XnP8E41bfUVql7Gdt7JCR7wEC3
	Hawo5m6JplqVOB7qsGvnMUlXt9wlCkiHmqUfl2FNgB9riLebBkAKf2Hjc6Y4RXjYYzTOkyUrDYA
	QGxaT8D0Ezoj1Pp/O8RGrF4AHGdbT3OUCa14/jWuC55pa9kx6ol4u342ARlBRa5LJKBIDqsC0di
	dOkTcsf791YvfUr1a5e67TXApgOtpJ0Qjf9Kr90vE6MTvoIdivWvM/xd/FAEKcCl5LScdgyI2qg
	ff9V12tDRWqE3pO6Q0togRpkKRQ==
X-Received: by 2002:a05:6000:2082:b0:487:13a9:80d with SMTP id ffacd0b85a97d-48e6e2cb572mr32349416f8f.10.1793723839219;
        Tue, 03 Nov 2026 08:37:19 -0800 (PST)
Received: from threads.localdomain ([90.254.187.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3e9sm29044772f8f.6.2026.11.03.08.37.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 08:37:18 -0800 (PST)
From: Lucas Tanure <tanure@linux.com>
To: xianwei.zhao@amlogic.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 2/7] dt-bindings: net: amlogic,meson-dwmac: add amlogic,t7-dwmac
Date: Tue,  3 Nov 2026 16:37:10 +0000
Message-ID: <20261103163715.385394-3-tanure@linux.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261103163715.385394-1-tanure@linux.com>
References: <20261103163715.385394-1-tanure@linux.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The T7 has the same ethernet glue as the G12A but needs two clocks of
its own. The controller reaches memory through a pipeline stage with
its own gate; nothing else claims it, so it is switched off as unused
and transfers never finish. The glue registers sit in a block clocked
together with the MDIO multiplexer, which probes after the controller
has programmed them: the writes are lost and the port keeps the
bootloader's delays.

So the T7 gets its own clock list, without the timing adjustment clock
it never uses. Its delays follow ethernet-controller.yaml: the PHY adds
the 2ns, and only the receive delay line offers fine tuning, so only
rx-internal-delay-ps is valid here.

Assisted-by: LLM
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 .../bindings/net/amlogic,meson-dwmac.yaml     | 59 +++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
index e769c9bb70d8..6de013e3e8f6 100644
--- a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
@@ -23,6 +23,7 @@ select:
           - amlogic,meson-gxbb-dwmac
           - amlogic,meson-axg-dwmac
           - amlogic,meson-g12a-dwmac
+          - amlogic,t7-dwmac
   required:
     - compatible
 
@@ -57,6 +58,59 @@ allOf:
             - const: clkin1
             - const: timing-adjustment
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: amlogic,t7-dwmac
+    then:
+      properties:
+        clocks:
+          items:
+            - description: GMAC main clock
+            - description: First parent clock of the internal mux
+            - description: Second parent clock of the internal mux
+            - description:
+                clock of the pipeline stage inserted in the bus path between
+                the controller and the DRAM. Without it, the controller cannot
+                complete DMA transfers.
+            - description:
+                clock of the register block holding PRG_ETH0 and PRG_ETH1.
+                Without it, the block reads as zero and ignores writes.
+
+        clock-names:
+          items:
+            - const: stmmaceth
+            - const: clkin0
+            - const: clkin1
+            - const: pipeline
+            - const: pclk
+
+        # The PHY adds the 2ns RGMII delays, see ethernet-controller.yaml.
+        # The RX delay line of this glue is fine tuning in 200ps steps,
+        # added on top of what phy-mode describes. The TX side has no fine
+        # tuning: its only step is a quarter of the clock period, the full
+        # 2ns at 1Gbit/s, so the TX property is not accepted.
+        tx-internal-delay-ps: false
+
+        # Deprecated: new SoCs use the standard *-internal-delay-ps
+        # properties instead.
+        amlogic,tx-delay-ns: false
+        amlogic,rx-delay-ns: false
+
+  # Delay definitions for Meson8b and newer
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - amlogic,meson8b-dwmac
+              - amlogic,meson8m2-dwmac
+              - amlogic,meson-gxbb-dwmac
+              - amlogic,meson-axg-dwmac
+              - amlogic,meson-g12a-dwmac
+    then:
+      properties:
         amlogic,tx-delay-ns:
           enum: [0, 2, 4, 6]
           default: 2
@@ -106,6 +160,7 @@ allOf:
           contains:
             enum:
               - amlogic,meson-g12a-dwmac
+              - amlogic,t7-dwmac
     then:
       properties:
         rx-internal-delay-ps:
@@ -142,6 +197,10 @@ properties:
       - items:
           - const: amlogic,meson6-dwmac
           - const: snps,dwmac
+      - items:
+          - const: amlogic,t7-dwmac
+          - const: snps,dwmac-5.10a
+          - const: snps,dwmac
 
   reg:
     items:
-- 
2.56.0

