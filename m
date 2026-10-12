Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 778DA4772BA
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 10:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791799785; cv=none; b=e3QleFITALZz3t8cJWNAct3Aogr5JBUGPfffkdoDNMKgmXzvcV1aAETQg7WfAmQD5K8CKoLqDk2ww7EvNcmBSPL5D7d2ionZMZ3rUPgKIiLzgxFCaHcNQDxtFIRbHymn6wuJ6lHDDXu5jDKkQPvQBt7cHYPRQx8Um87BuVMQe90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791799785; c=relaxed/simple;
	bh=KOfinKpMQsa5zSbyZ5FVh9P3doA6BZAOXn+lKRg+jbw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CZfQ33zhPNOU3X1dcE8hoF0+WUgdJx4L2NNHHmgpGd0FR3GFrrAT/wXmAdohKowjcHD/ymZbgbdpqzSYLuSo6532EErkoSZ8iFNV7jz/hLcx/7RxJOVi5Kh63KnghfsOSCgV4s0sbk1R5NNh5koS+sZKn3EdWuW4nkeeEfklNno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n0I71sog; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n0I71sog"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a0e1b0681bso12044165e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 03:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791799774; x=1792404574; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rTmPfvalZRTI6+lp6HTMlI98ng4/42Y7G5JNtyRc8+k=;
        b=n0I71soggFx87zpN+Kp7argQ60LSXxn2BUpQReOSetaejNimBO0oxnef5h9IDY9P4z
         9yphp2LSstrmvvK+XKZp2Km8n2orEZ4YwsruCT2KT0Ffqt5yV5jyd3BcWUIXPd92dKnd
         94Z0zA0w0s/NrHvCnyvk03l1jqbmMKjYNQLQFsAZfyocN374jhdoHn3upbw7h9SiEDGB
         B1cPZkHJtZJxTt97tT9KBJ5u4RZUonoIqP6CpOpPSG+KgFu3HBX/KqD7aR5s9qGO4Lv+
         vmbvf1015rfFuGn3ebpIVCMaHAr4ifkNJ08evoL3Shkbmh4+brN4/mtXrkyMT4o4r6Wa
         YlYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791799774; x=1792404574;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rTmPfvalZRTI6+lp6HTMlI98ng4/42Y7G5JNtyRc8+k=;
        b=MG5QYVJHbvYG70GYQEyA5BtN07jI+MxYlYld089qlKCcx70NIpnR+FnkttQMxlw2Mx
         nHZVcF2YHkbXwQRjSQIEA6mj0Kqwnq4gyzvUE0+cA7bSqf6pMEvZdUiD0hgGCyCKZiqB
         JU4c5lVmyd3XCzYon6aaxWQ33XXeRHQTzE8ICiAGxhn4zritNBaZiW6rzrUxi+3AceTN
         z4txQSFPXCEREoyCUQNww7auNhD3JCCbtRmBtu19eK8qEvQ5C1HJyMOze6uEUxL5JAYp
         TkJSjFhMkdCzs3UKe6c91ueEUT8hSYXTMYnQ0CacvovGyc5YOtwwmnqz+Dwq4tLdu1Jj
         0rZQ==
X-Forwarded-Encrypted: i=1; AKwUvBy6JQFo6NFQF9rYKxJQYo2gvNgrD4WJ4asms36h9bgtdE7UaU7D9qBIXZLqu7apGIM2M42l3LLq+8Y+KkQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLE2hkqgjh+8oURpYLScXglSi3GtpGaOvoZDKzypXrR4QQj2G9q
	dxfzPfCjtVq4Ymc4fDfPoHgExuxtORgb1GHtpkOb6Y7407LWpVPZYdeT
X-Gm-Gg: AYBFou1X792GPsDimeG3vdvRH8WAKwqXWlVTILI8jDKC6cz9wt+8SKs54R3Ppz8GhsE
	vFh7ahEwj/DKH2kq2ofbeil01oHyGZDptWGuTb3urK0PNmgIoQAaFSHHdyg6z0YRj5V/54FbPVJ
	Dimhd6yD5GErs1ujw2N+CZ0hIQHf1TPlTjKedCpOQdql37Q8c9gvZEkQmQG5YEA12xCpY7LVD/w
	A3IGA+7GQM/dHWqU1K1JHDT69Abjk+KbRifpF1gZeHlJzhHYrPnY4OvEaCo+K2sGAdeYpCPOuwM
	/A68gPKHlmsaLsEfWtTNxgoZkEUJh1kvibSu89hy59oVSzqw36SP3Vf4r5p7aO+cpbi7E/nLMcr
	9aiz9sTMO3SUbrXo8wuoY1k/SxVJ2JVORLijuPw0A8PIan08pZFvWxMROQ9gyL1XFAkL4yfInBH
	ACCi2XTVa0h1+h7h8g9TKfECzTc35z7MzR0xfJjf3HRLLncZRumMNZBGlU3tw9nC40KYrdw5Fr9
	6JoZYVN6ONpiZz4dTHygH4PxFIcNGKZ
X-Received: by 2002:a05:600c:5397:b0:4a1:7ba9:da2c with SMTP id 5b1f17b1804b1-4a18e4a7cacmr168741805e9.25.1791799773645;
        Mon, 12 Oct 2026 03:09:33 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a192d3efb6sm166229885e9.1.2026.10.12.03.09.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 03:09:33 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v4 03/11] dt-bindings: pinctrl: sun4i-a10: add Allwinner B288
Date: Mon, 12 Oct 2026 11:08:08 +0100
Message-ID: <20261012100816.331033-4-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261012100816.331033-1-pmazzini@gmail.com>
References: <20261012100816.331033-1-pmazzini@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The B288 driver takes its mux values from the DT, so allwinner,pinmux
becomes an allowed property here, required for this compatible only.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 .../pinctrl/allwinner,sun4i-a10-pinctrl.yaml  | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml
index 45b7a0b6c626..b1f093d218f5 100644
--- a/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml
@@ -39,6 +39,7 @@ properties:
       - allwinner,sun8i-a33-pinctrl
       - allwinner,sun8i-a83t-pinctrl
       - allwinner,sun8i-a83t-r-pinctrl
+      - allwinner,sun8i-b288-pinctrl
       - allwinner,sun8i-h3-pinctrl
       - allwinner,sun8i-h3-r-pinctrl
       - allwinner,sun8i-r40-pinctrl
@@ -120,6 +121,15 @@ patternProperties:
         $ref: /schemas/types.yaml#/definitions/uint32
         enum: [10, 20, 30, 40]
 
+      allwinner,pinmux:
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+        description:
+          Pinmux selector value, for each pin. Only used by SoCs whose
+          driver takes the mux values from the DT instead of an in-driver
+          table. Almost every time this value is the same for all pins, so
+          any array shorter than the number of pins will repeat the last
+          value, to allow just specifying a single cell, for all cells.
+
     required:
       - pins
       - function
@@ -144,6 +154,17 @@ allOf:
   # warnings.
 
   - $ref: pinctrl.yaml#
+
+  - if:
+      properties:
+        compatible:
+          const: allwinner,sun8i-b288-pinctrl
+
+    then:
+      patternProperties:
+        "^([rs]-)?(([a-z0-9]{3,}|[a-oq-z0-9][a-z0-9]*?)?-)+?(p[a-ilm][0-9]*?-)??pins?$":
+          required:
+            - allwinner,pinmux
   - if:
       not:
         properties:
@@ -222,6 +243,7 @@ allOf:
           enum:
             - allwinner,sun6i-a31-pinctrl
             - allwinner,sun6i-a31s-pinctrl
+            - allwinner,sun8i-b288-pinctrl
             - allwinner,sun50i-h6-pinctrl
 
     then:
-- 
2.52.0

