Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA5374A014C
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 15:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788622360; cv=none; b=mRsoOzSfKtfGQjh9ja2O0lgZvmJa3oFdYr0nGHiIru82HMK08Xr4c9hZ2M1ws6OeXpoL6LTVsk4Me0XvalcFicxU/oXDgH5l09mRWisV78BfyKGYlSwp6Unl9+o1bZi+bmR52yXZ5P8et2RViWdj/BaoBmKvN4mDP07yqjZe9Rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788622360; c=relaxed/simple;
	bh=auj2UAs4nlHOJt9V76E5i5rzlg7fiUwNv3w4PwDwU8M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SecNXqwF04Hi1kft2f+m7Q7KLk0wj7qkGvdEH1ak7NoVNNiGYnVfenGaK8CxJoy7IlnvEZIpQvxBxPvYUiKsUVmeJAd0EdHM5gpQaguLA54QUvFd/ugjKmoNE0mJ9b0xaWFYhKZlGShQDV0AFqv8kA7wrbO9DDreogIqFDlBAQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-485850cf499so1164764f8f.3
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 08:32:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788622357; x=1789227157;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4JskkGqhdaY1l7i1ogeLg1oSPtvCeMbo2iXSDE4yNEI=;
        b=ms3FCp5Gu7sOC4wpzsZOeQMbsViPVA/eRpJ16I4ajzj516CYtttEkGBpgJlN4GpjM4
         ndi4+G32KVUgk0ONKlHKpMJUvl1mgSI8KPENSVfcZJ0Evd0muIkaa3jMjtyApbI/Nlp2
         67zP9vUcrP204U5y8ZPw6GvqxTeS1hsU4gKtV3KhnQ8fXpxXeSphqxZX/WO+/VcWza92
         K/BfakYEMHNzBHfs9IdwDXj5BwIjH3wg01EcUrpYJcGdC59KU9DzTSTNBtHVJTm5lou2
         LeP13RQU6yYc41toLocOGQlfFGhfJjImvfICiK3gIspHE/mCyab6J+bhr/NNELlxvbL9
         MYZg==
X-Forwarded-Encrypted: i=1; AKwUvBzSoN7tZ4Jompinvnmzi53X0oJJwvpIIzWx055RE8vMkz6r0KTcnbj40gxwHn/QML0mgO5D7a2ATOJaQmg=@vger.kernel.org
X-Gm-Message-State: AFuF++kK/eW22xSWspMKrtHduoxZ5NnGwDcs2RhHOYMFurZ9GOgFZmiE
	wXi7TuuzPq5rkn3n05xSt9qodpQO+cmqseCj7mRBjkAnLqcSRISFomoM
X-Gm-Gg: AYBFou03mg3pkbWWluPZVryQgTg7eqbP6lBiPZevDZVWFrKTMSiQF2imznMMf5W5Wjr
	Q/fdVK4hlrWAWLW0asqQZJ5ie8QGdM/FJXFkiB9RfULlfOZwJpAOcW1PGVLNkUF+S4ciAJz9Qs3
	RUpJ0FALfNYHKTFTSXLYhS30K0mam58xDyfKboKdY/aAr3SJ1uxB+GKrnCKxUhZqNVzlU4KekPt
	woQu9Dm1DImWPg3QS89EqIu+TkGoGWNQJV1BC/UE9mIU7md0i/T/qK3i+34oeN4rBtb1GH6mMbR
	WnIsUhU/uqpMdcliiLDNsN2VE9FPiRhSGxaY+OTxVfOc/SyaVp6igdHyc5wiwkOw0Y6fyvv/rjC
	WNdyBe/nQ4YMNDhhsQD2k2Au0U/Ehj7Q85A/FT6lchqgWt6i1qTFWde9JBuIVSwZUSh+y3LPLUf
	Exp1oey5dw0PrSgxJDGkrUxX6fn4yfLZNXLgCD6RV6en5c1DUwORXWiTcjonrPmRh/3dy9h8vNy
	U+28EuVPniq/jLBJKxtnLGOm5wMWbZxOJW8
X-Received: by 2002:a05:6000:2584:b0:482:b813:8315 with SMTP id ffacd0b85a97d-485872ac3b1mr16135052f8f.21.1788622356748;
        Sat, 05 Sep 2026 08:32:36 -0700 (PDT)
Received: from threads.localdomain ([84.68.179.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c6ba4sm16691913f8f.25.2026.09.05.08.32.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 08:32:36 -0700 (PDT)
From: Lucas Tanure <tanure@linux.com>
To: Ulf Hansson <ulfh@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Brian Masney <bmasney+clk@redhat.com>,
	Chuan Liu <chuan.liu@amlogic.com>,
	Jian Hu <jian.hu@amlogic.com>,
	Ronald Claveau <linux-kernel-dev@aliel.fr>,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/4] dt-bindings: mmc: amlogic,meson-gx-mmc: document the T7 pipeline clock
Date: Sat,  5 Sep 2026 16:32:31 +0100
Message-ID: <20260905153234.133217-2-tanure@linux.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260905153234.133217-1-tanure@linux.com>
References: <20260905153234.133217-1-tanure@linux.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SD/eMMC controllers of the T7 SoC are physically far from the
NIC_MATRIX bus fabric, so the hardware design inserts a pipeline stage
in the middle of the bus path to help timing closure. This stage is fed
by its own gate clock and, when that clock is disabled, a controller
that starts a DMA transfer can never complete it.

Allow a fourth clock entry, named "pipeline", and require it for the
amlogic,t7-mmc compatible. The other controllers of this family keep
the existing three clocks.

Assisted-by: Claude:claude-fable-5
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 .../bindings/mmc/amlogic,meson-gx-mmc.yaml    | 29 ++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml b/Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml
index 976f36de2091..12342b1d78e5 100644
--- a/Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml
+++ b/Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml
@@ -15,6 +15,23 @@ maintainers:
 
 allOf:
   - $ref: mmc-controller.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: amlogic,t7-mmc
+    then:
+      properties:
+        clocks:
+          minItems: 4
+        clock-names:
+          minItems: 4
+    else:
+      properties:
+        clocks:
+          maxItems: 3
+        clock-names:
+          maxItems: 3
 
 properties:
   compatible:
@@ -38,13 +55,23 @@ properties:
       - description: card detect
 
   clocks:
-    maxItems: 3
+    minItems: 3
+    items:
+      - description: core clock
+      - description: clock input 0 of the internal mux
+      - description: clock input 1 of the internal mux
+      - description:
+          clock of the pipeline stage inserted in the bus path between
+          the controller and the DRAM. Without it, the controller cannot
+          complete DMA transfers.
 
   clock-names:
+    minItems: 3
     items:
       - const: core
       - const: clkin0
       - const: clkin1
+      - const: pipeline
 
   resets:
     maxItems: 1
-- 
2.55.0

