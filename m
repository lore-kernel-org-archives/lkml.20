Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794239108;
	b=ek1ZO30+d/Om48dt9wzBcLvXzo7zfOz9FEa5WwAzIpaZ/iEcIny4ONtIWidYkMv20ERv
	 I1OUg8adfKzr25e9tOFhhy2owDYBiamNSDflTXvBt1I4dbEMFzf3DFIOlWicQL8ngGwWK
	 3g0LsKl6eAuN11nswPbyYTYn/slUY6W+okc4zZhSH0GaNg2VjcLz1IUpCWXywR8/ICM1y
	 3ODyI+GFULO8bfScrlMN3z843TUW8W7c269ysAndpUjlIrkyBtpu6OjNKXZOTLEO2Mp6b
	 ilabvtckptu/sg6weoExhwEJsHA6SaZd2JTKrVqCNhdoL2NHJKM22jK3wTuNZt/G9fA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794239108;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Rh4heiROTn2BTclkUIfVJAc7WlFd4Gu+0wgV3dS1bGw=;
	b=2OTK4ASXDB9LBidXUo5/G5TXEuImK4eG45n9cZLcj8OYLppZlLbVIX+uuePJjI1mYR+9
	 L64+e47ZaySbfMIuR0EHQEsN5YqoJThigCC2L3W2ryPDRN+Hb3HYpGEu2FX06YJT1nVcH
	 DEbKIYCESnxcd8laj1HCvJRlSc+Cpr7+qLKpxifXlPBn4cKATrnzBDooamb5R447zTI84
	 FYAlAfqunzEK/Ccjx6iE3ZFF7W5QM08E6JNwZtejPHJzM+c27M3Xq1cWv967oiGIY7Z4h
	 3iLr+EUzVD5q1H2HKzlIMJMEO1Bs0VTIdaOkk/WySv2KjoimX/9i++2oTpsWl/izErg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hSpB7hl6;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8012606EE86
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 15:45:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8012606EE86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hSpB7hl6
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso8461095e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 07:45:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794239106; x=1794843906; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rh4heiROTn2BTclkUIfVJAc7WlFd4Gu+0wgV3dS1bGw=;
        b=hSpB7hl6GglOFC9dYLzfjOBwjg4JCNsk8RMTZ8kM0fRTiy8v1TqKNld6fKK000xvpR
         FjjkWf952OWkh1CA3KW8y9zklJlPMaq8OOHSN45xHkqgbLYU1MD51r07ihcFCr3bGFB3
         Ufx0KCej+O2b4hS4QXhcbfqmawsmwrXOkbxpdZ9SrafrEE5ljpA/vNbtxqhrYUUInaxj
         XWRkXCZf1r+BbeMXQ6y1xlzWlyhHiwv1kM0VT6+Fhi9pVNr38I3ZkwytekdxryBVt1Ka
         VaUyzqS+8P7yHo2eTvh8jc5qN0bwWMCe/f2h5GleUbzX8FvvpRWYKcyQ8CbRMmFLGcwo
         gA6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794239106; x=1794843906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Rh4heiROTn2BTclkUIfVJAc7WlFd4Gu+0wgV3dS1bGw=;
        b=kdUUJMVjhdSJOeajFNkX4d+xjWsU0xbl8WpEw9DOZecyRHZLLWz2wKO8YNQymng2Iv
         81Vx5TyFESkSVh30uWNonq//HfKiSISCn+5lbJzxkX1Ys2sX4sIan5UlSPzAgsEaIgNR
         0YzcNYd83Ch069L5eFcCEKOUBfDUlVSnuETNLzJeoNIdCe6K2IznBcOSxIHmvkWyamiK
         C5PQG449imxReE+YoW7rgMwl5nu+sK07nU6kIojUaB8FBKwywze10ofOyTY+zzwzIvsz
         itki283xr3xZ0qQCiTfEhN6e6Pvv+TN4Ou2AzeRbu9qV2RiZFCOyLye5eDBYhKbETWBQ
         6now==
X-Forwarded-Encrypted: i=1; AL+hErGzvbfqNmIUJ/8xlbEJeRnOfK34jXcDuZJpnczvTSpzHW+vtHcxWkiraMw1h0XGxBw4y9dMOY+DGH6W294=@vger.kernel.org
X-Gm-Message-State: APuU4Z81PykBghGZ/sKAwUTb5/yruRT19GoAq54g9ao5n3NWuOxozv3u
	rFD/HnncQooA/gWgMomVVhF/5nfwNgfF0EAQHsPDWVn9Sw6RjozT9eSd
X-Gm-Gg: AYBFou0PujphX572GUnNPCPfsWEVhyVU6g1NQlziEu+O3930UWc4Iv3wH2neCKffC8k
	NC3y7lDEHJqLlBguQ9hjIi7aIdvJw0+jvGM5WDLpbNM5eaQySKSDEyts9Y96jSBRnjNuqc52bxs
	ezhVSwisZJzuttxCJUvSTmYFK8B21m+vpfoOUTX/MNo/SWJxXcUneITzF2AeeyObS5v3LjqH1eO
	zqYUdm+sJ2W0SHuxZNLLJGBAa2hZ6lTX622bjSWpJ0kwQduntR1UrpgP8v4Ii4Z4F/yxm6Vz6XR
	5Sr25P3l57pNOUaC+zmjGNSvLrzNnSWRIhSZqNCF21iM9zei1zBORezC4sH+JaehXW49OEAny9P
	xO+FzIE5iKDGQ0ryHW+VGq0vuu4WwehQkiUZ5lgGGsE60rtfju/UZ2rvWMO7dLHkofTot/i3Q5O
	uxRn0CeJxDU+5MzEYWTwLJbslF1Y+NYPpZB3PgNyy1P5d6UU/FzM9DdBYYWADjvSnp6ZpLD6wr5
	U7tgPXhDq/h4v2zprSudOGnqs+bwIOC2yQ7OeqYHiHsI2D98yiOg+vr4DvzkMzvEvOnrKBoXiBO
	qXB7UjQlSB++sNyGbqTBKwYQP7STcpVt4w==
X-Received: by 2002:a05:600c:811a:b0:4a6:7d6:821f with SMTP id 5b1f17b1804b1-4b963c82e21mr76267775e9.29.1794239105633;
        Mon, 09 Nov 2026 07:45:05 -0800 (PST)
Received: from hp-z640.fritz.box ([51.37.204.122])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7e32ad4d1sm257163645e9.5.2026.11.09.07.45.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 07:45:04 -0800 (PST)
From: Owen O'Hehir <oo.hehir@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Hal Feng <hal.feng@starfivetech.com>,
	"ziv.xu" <ziv.xu@starfivetech.com>,
	Conor Dooley <conor@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	E Shattow <e@freeshell.de>
Subject: [PATCH v3 1/4] dt-bindings: rtc: Add StarFive JH7110 RTC
Date: Mon,  9 Nov 2026 15:44:58 +0000
Message-ID: <20261109154501.63762-2-oo.hehir@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261109154501.63762-1-oo.hehir@gmail.com>
References: <20261109154501.63762-1-oo.hehir@gmail.com>
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

Describe the RTC in the always-on domain of the StarFive JH7110 SoC.

Signed-off-by: Owen O'Hehir <oo.hehir@gmail.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/rtc/starfive,jh7110-rtc.yaml     | 85 +++++++++++++++++++
 1 file changed, 85 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/starfive,jh7110-rtc.yaml

diff --git a/Documentation/devicetree/bindings/rtc/starfive,jh7110-rtc.yaml b/Documentation/devicetree/bindings/rtc/starfive,jh7110-rtc.yaml
new file mode 100644
index 000000000..a88ab91ab
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/starfive,jh7110-rtc.yaml
@@ -0,0 +1,85 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/starfive,jh7110-rtc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive JH7110 Real Time Clock
+
+maintainers:
+  - Owen O'Hehir <oo.hehir@gmail.com>
+
+description:
+  The RTC in the always-on domain of the StarFive JH7110 SoC. It counts BCD
+  time and date from a 32.768 kHz clock and has an alarm, a frequency offset
+  adjustment and millisecond and one-second pulse outputs.
+
+allOf:
+  - $ref: rtc.yaml#
+
+properties:
+  compatible:
+    const: starfive,jh7110-rtc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    items:
+      - description: Millisecond pulse
+      - description: One-second pulse
+      - description: Alarm and calibration events
+
+  interrupt-names:
+    items:
+      - const: ms-pulse
+      - const: sec-pulse
+      - const: rtc
+
+  clocks:
+    items:
+      - description: APB bus clock
+      - description: Calibration reference clock
+      - description: 32.768 kHz counter clock
+
+  clock-names:
+    items:
+      - const: apb
+      - const: cal
+      - const: 32k
+
+  resets:
+    items:
+      - description: 32.768 kHz counter domain reset
+      - description: APB bus reset
+      - description: Calibration reset
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+  - clocks
+  - clock-names
+  - resets
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/starfive,jh7110-crg.h>
+    #include <dt-bindings/reset/starfive,jh7110-crg.h>
+
+    rtc@17040000 {
+        compatible = "starfive,jh7110-rtc";
+        reg = <0x17040000 0x10000>;
+        interrupts = <10>, <11>, <12>;
+        interrupt-names = "ms-pulse", "sec-pulse", "rtc";
+        clocks = <&aoncrg JH7110_AONCLK_RTC_APB>,
+                 <&aoncrg JH7110_AONCLK_RTC_CAL>,
+                 <&aoncrg JH7110_AONCLK_RTC_32K>;
+        clock-names = "apb", "cal", "32k";
+        resets = <&aoncrg JH7110_AONRST_RTC_32K>,
+                 <&aoncrg JH7110_AONRST_RTC_APB>,
+                 <&aoncrg JH7110_AONRST_RTC_CAL>;
+    };
-- 
2.43.0

