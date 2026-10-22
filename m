Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792699610;
	b=xYqYNGL9yiz8pMO4pIesAR7GzrSabc2jFThux3UnvYXh0uFPtBcQbmhBXAh8CzB2nQMM
	 Xmo3L60O/rcfbsKr+OXQzk7B1YfQSfKAodj7f3HeSMvcV4JPFrORYFeySKok4rRcvfJFi
	 yW/XFSTTiTV5XcK920NQx2HYwVyCL+coDAqD6dzQNxkCR2WvtQUc1pDKP1uT0HoJGeG9j
	 QGZGLw/Ap2WiJkA9O4INgCOMFszTsNaJEUJKbXPtMPSZDkB5g5I6xga+YQR8NgKrvprhz
	 ajfBhKqj2wYRF//XgtlhICLXh/bFC1QbK+zfjfBFfnYAFss0RkEbFTCFswVb8Qyo3Tw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792699610;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=RJU4MN4q31InnCqnmctD1bfgzdWMNbsD2UQnbMenASA=;
	b=3F8Veud8WoqoLsgiWZqEb44pfgL7TNrfmYl1m8V0DMFiGV+ERCM0+GUOxj2cGHZEsUls
	 34MX+qaRvj+L41jIvc19CPEJavmUqYPY//XLTDcL1Mk/4S6+PE7ELsnmbDwyTXGKaZh7M
	 u0+V/txOwZqCeHF4xECiJ7E3d3r6zcvt/iFQeCZ+tccISibT+r5qdfaTOFrL4QK70Bb0r
	 XOjN4KsyBPcpEjK6QHUb9tB0PGJqwXOBhw8nHRLvANx4tsXFONTy7hCKdU0h7y+BpxyvN
	 CIml0rz0baLhCa2KjZQ6nO5mmHfIKxi7/4F3TeHKGHOiObegRn+Qwz8RRgLG4f2glYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF984606A33F
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 20:06:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF984606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a210470b49so1518775e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 13:06:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792699608; x=1793304408;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RJU4MN4q31InnCqnmctD1bfgzdWMNbsD2UQnbMenASA=;
        b=DW7krOcGHfZtJ/FoAoCAkJbmcHf1e46aDdbQ004ODlNvOhKDZqr92Q5jSo6bQse3oh
         1wiwBomQYXFRLf+doQIIPA3tjnqcUUYURsM4XK0hgiAsA4j8XVhrrSb1q/Kk9iK17NsS
         lsyIkwFep6nIL+WBMnWo0a90sAoWNxS1NpveBHV4BCO2yRH8oI8n4PUuw8dpA8LwSfxZ
         4W6qEmzDsMy5U4fCUIe8UsfdjLP+EnPVxcNDGB4rry6UOQWjWSK3mXun8MgnEiRB3elN
         1SCeW/jThlSlQSkYN4+EnMNDwEuvVEUe9cGGHFYQz12kNhGm9fFjcAZMDliA8YBF7RzT
         ZXFQ==
X-Forwarded-Encrypted: i=1; AKwUvBxZJem531e+5mXrICoOVFtiru3EQVFRS9xil4m0r5w0GrL3EdQR41hxSbvD9wlHqRr09xY9sy0HTOGlpUk=@vger.kernel.org
X-Gm-Message-State: AFq9FYIYVxx1g35/AhP2eWBRkLAZ6wdD3cxRNeTw7gmvjtBF0rCuGAwA
	As7SW0SFbsUAJHMR+RbA7FJI6B0HhDCh6HlCbZx5f1ytspfkjQO7jh1o
X-Gm-Gg: AYBFou1ImlHmjY+SyRqLbOs9L0TRIWKsRnT2b0khRpxWjXK8C6cskMfpOLcX5ibOaou
	JtWTHKNgqC2ADirlelqC2t7cTPe113L/P3K1mi3lTsLN25oyWMfZwHQU7QZm10TuUaT8JUFxWLt
	Vf5FiYaNeosRtCK2qXc2QZLCMTTChteggdhyJ3rsfjgLquAm9ntKiX+u1vNN2aHBorQg9r6UTaS
	NfiRzTEKXbCyZQpXbrLEkvznc9TFjF0m6Anp3YauAbxP4C4j9UGGCk5oetb3gX6p28kHpRPcM7N
	Z/vJGE9tZ1QTbQv9gdaCtkeTWo0vjsjZVDURNYaZvzRiFUcD/DfelysOkTjA4jQiP/s6Vt2kNx5
	wmD9sGRHRmEgl6ojS0ffqiz4mzjgTZxcxfIybZtUrcw6O8SSPUoqlSRdtU3WTArHzpALNFQ2rTu
	0OJJydtlbjLr7INIMQGVSj2J9aitBxhTWLA22mPedhPtSLi+6xTWYXYDOQ+tU/VR3q4uxJAfITd
	azQBK5hWis52vU4Kfs/N8PYGfRz2kr4kUus94vtO+XgB1e1iEv9bMvgM5iQTZ87a34Vt40eqzwP
	X3ID/DnuMV5R8hwtzL/ijQhLEjT+Dkn/rBA4
X-Received: by 2002:a05:600c:4e8a:b0:4a1:d675:b031 with SMTP id 5b1f17b1804b1-4a211eeea21mr2127325e9.6.1792699608276;
        Thu, 22 Oct 2026 13:06:48 -0700 (PDT)
Received: from threads.localdomain ([81.79.62.202])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a2123a1797sm35965e9.1.2026.10.22.13.06.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 13:06:47 -0700 (PDT)
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
Subject: [PATCH v4 2/7] dt-bindings: net: amlogic,meson-dwmac: add amlogic,t7-dwmac
Date: Thu, 22 Oct 2026 21:06:35 +0100
Message-ID: <20261022200640.3101932-3-tanure@linux.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261022200640.3101932-1-tanure@linux.com>
References: <20261022200640.3101932-1-tanure@linux.com>
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
 .../bindings/net/amlogic,meson-dwmac.yaml     | 60 +++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
index 69244afc4ff8..d27f0f2c52b0 100644
--- a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
@@ -23,6 +23,7 @@ select:
           - amlogic,meson-gxbb-dwmac
           - amlogic,meson-axg-dwmac
           - amlogic,meson-g12a-dwmac
+          - amlogic,t7-dwmac
   required:
     - compatible
 
@@ -57,6 +58,61 @@ allOf:
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
+        rx-internal-delay-ps:
+          enum: [200, 400, 600, 800, 1000, 1200, 1400, 1600, 1800, 2000,
+                 2200, 2400, 2600, 2800, 3000]
+
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
@@ -142,6 +198,10 @@ properties:
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

