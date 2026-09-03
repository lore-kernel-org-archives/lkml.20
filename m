Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38022390CBA
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 22:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788476371; cv=none; b=uYciyfpUJNOxTzNtjWJaCteVUoA/6gmFQ142ONMgtFYN9vZh/JuVmO/hRXAOpqOHu4e/ftCcFlPCDOQi5wutBRJ/RudRtGuDDjQFRHubXmnpGIanR6LmYK7DMn32O8aCefoDsgJKA1Cz7NW9l8OdO7EIE0AeeG1xuCXy0942v9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788476371; c=relaxed/simple;
	bh=7IyaqAJGrLFMzdCPym0vCbn9/e7JQnUZdtNSrU1p8VM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WjkJNgdY43P1YyczDoHZtVo8iVpN1bPdDCjnC8t9CF0znT3Rehw+659NoBaabzFg6q3C4iHNB65aGPPZUTms6DrpJQ8Sg0EEKQ9lw/IhFjFSQc4+NwvaxaxYUz4EsL6QbgtGqYwMD4+IGHhingtLr/Uq4U/XkvUNXHXHYiFfSyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so3327875e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 15:59:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788476366; x=1789081166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SYr0H8H+3w2Nj4aKKiG0KJqnlsCXDI1Lpa8vdufXlPs=;
        b=DLKgeyc+OoPbEZBLSVlKmmj7eKeNFBVt9NbYPFU8jqN+PJ0JvTB93cTtsqrep9jpJK
         leEGMycJLR2lO4/h0vAFZvkDzhoz1GMqYb9tDbdijdzu6fB55CPIZs5b+3fEISfHKZVY
         O/yzZ7CceDLyC6DX6Gyg8FVjF4UoQaJ3N9h0KoNjadW+fYVrPoNQzb7V2hHtBpf85db9
         L8Q7+p0giOwePdHDvRGsFntcX6Lj73gDp6QEyqIkgnAqbhQIpAwZN8umtCLYwfyINN2Z
         2bXfp+u843IA28XkJzrJACpTEyjOk7k9NlPCMX0nncGejQiZNnxQI2P0DY4SwaLpiAUM
         m7Mw==
X-Forwarded-Encrypted: i=1; AKwUvBxCZSXIpA9wXprDIPnJX7VfxNM7/Y6hQL5ZGmPt30pnChDIId+76nXV1KNRQrbWiMYju3tk7GRaUFoFUa0=@vger.kernel.org
X-Gm-Message-State: AFuF++nwLFFNV+6JYrDaVbwd/+SlOsHC5QhqR1N8i05sDbdjKNmjzo0h
	YoXHmia3T52o4S4x7JkVy2gJakKDfl/7EETiiVT3LvlMpOIHbthHjDAQ
X-Gm-Gg: AYBFou0pDUrhgE5myzGeKsaTSWb4duGKN4N0ezjtl4qz9if1Ssf4R5nGA3Ubc6YxRQ4
	6/aUYwZMLOKJBWNe1H5NNq/zVX866P70fyHmtNeUxvkvcaWkOGXwhGbtcgCKWExEonKLfNRcOsX
	/4P+Syf/+D+Y+rOAOI55E/mb3b71a/sv9WNrdJv8cCwyZPqpCIiahQjbvwBRSEo7EvPPrLUs0cG
	5C5q6INvOO8jmr9wQYj4MfAce6wgU0NRro1ytWXlSWlX0Pd/GXYLYdDRMOH3oNuOTqx4knnk1tO
	zQqqxvm+4WqZlG6NgSkkh68BYf1ckBy8l39FGSFC0aIgxAXZiMvRcpjerhg5gaKmbZL5RaSfIUk
	RivlvOk9OjUN7Wkzgunu/MYMZOgpW4w5bbZlfm21XM2fINw6ZTpAex12a0XwBorTQLe7S9llV/t
	neV64xyx8nO4NPg25x1vF8V8Y7KefZ0XmK46d/+mavZ9FGfM6rTDnVJGWA2n5Z/vRucSBkip/S5
	PPQnemuqrZsSHZOH1rgMeVUFA==
X-Received: by 2002:a05:6000:2010:b0:485:8a47:5b92 with SMTP id ffacd0b85a97d-4858a475dadmr290268f8f.47.1788476365986;
        Thu, 03 Sep 2026 15:59:25 -0700 (PDT)
Received: from threads.localdomain ([84.68.179.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885c5bbdsm1686142f8f.36.2026.09.03.15.59.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 15:59:24 -0700 (PDT)
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
	linux-kernel@vger.kernel.org,
	Claude Fable 5 <noreply@anthropic.com>
Subject: [PATCH 1/4] dt-bindings: mmc: amlogic,meson-gx-mmc: document the T7 pipeline clock
Date: Thu,  3 Sep 2026 23:59:18 +0100
Message-ID: <20260903225921.2290441-2-tanure@linux.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260903225921.2290441-1-tanure@linux.com>
References: <20260903225921.2290441-1-tanure@linux.com>
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

Assisted-by: Claude Fable 5 <noreply@anthropic.com>
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

