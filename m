Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793723840;
	b=uD2oKQb2PKiZTyiNym9fVfTD0Bd+a8G4PCWa+VWDO3te7tm2qv8gYmcDjnDEoT4kkp4O
	 TJ+SVI0JsmulsCFSjY4/WKTBrVL3TcySF0ky2Ru7TUv2M0uHziULE0Fw1sLb2yyoRq2ht
	 bCZ66K1svhnjUKC/Y5lRb9vhbi+YgLFW3GxtPuPoJvtx3QxrdDILgd44neccvuOVvxBbE
	 MAg1/WHoFsg9abyX2BM/CxlGTbJPeBmOzPSrFHIQ87mahDIILUVENqFjlCgfwss/qnONI
	 JAYPszoqIfnwwBsBXy9u0F3gRyZfI7khB/e+2rNcjpofH/6EGJ/OS9SaybdBh9sjeFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793723840;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xaLsM5U5ulazZmmMZOUrbsqFBf8E5Hd+TLCd3a7zUQs=;
	b=wa5KCfuZDsslpyJ9Vm1IOIeA8SO5xI/Yrr0R5fFUtT/tcSfRbLSUops+0DejJDc0YOya
	 Ul65XcfQ85b7ymb09+DYKexraNlTNBtWmPGHLN9U4rqbVCjciTroYlI/Bb6a2EGu/Iuh0
	 TCQuQ1YcGoiNAh/+FacC/UO9G8Dv8Lep+1DIYQxhPzNlsRgmOMKUhc+/vXLzyI4cso5c6
	 NHQCtrXqk9JPY8CpqfwzO+SAsW9kzxrk9UcusPWZ3lckcpY9Ynatng4JE7HKIafGrhvMK
	 eK9FaH+fJ2axigz+3sPeboGw5M/v6ZO6NS1GlCx/v+vM71JsD00jTbI71hM4VdtEgoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10497606D803
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 16:37:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10497606D803
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48e0d1da913so759904f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 08:37:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793723838; x=1794328638;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xaLsM5U5ulazZmmMZOUrbsqFBf8E5Hd+TLCd3a7zUQs=;
        b=e5GxgI++EUvjOzKPFJLzlUJuKSLR+Hcky9kic3OgsJqmuOTh45hTCxAzA616v1EqpQ
         sBHLsyVRyTcjoVpJj213b8JWY8J5yA9S8YWHVkTF7+f94P7esNPgpHT5ridxaoEV3apB
         2SBKAQM09TySJJC8MLBh45VWVkzKrin4KxKyg2LB16AO3LlBxz6Iegc5lLb3jtavsBBq
         NGf2ymt7oeLgTcrzVc2ilHoCuWkPP+au9tHCQvxf54pbX4fjPeeHZaYiiwIeb1X6gL9S
         fcI4RBFa5W11p5HRpk3NtV+wFgU49Ob9B8sqzFkBIe6Jync39lxthwbi7xvxazq2vxAL
         Snmw==
X-Forwarded-Encrypted: i=1; AKwUvBzjenDEGLOu1ArCGcnUaVMfWE+iAdM91RORXp1mLU6dQ/DYBTkbCt30A6rCGm2fKM4YTfszcn/pmWO851M=@vger.kernel.org
X-Gm-Message-State: APuU4Z/UORyRJx30wCazVp8zdogSHBNdk40jtZlKt2OkdOwy5YdY9Dlr
	3A4wwOHdIEX5rgQihdEgqKWVgYdc/Szoe8hBXJjQQRm0O65MURfyGbKh
X-Gm-Gg: AYBFou0a5Nxe3kPEe4qd1OfwwoZ4FBEqsNlYEX+C29hqOzrjiz6JSWDiMy69A8QWp4W
	U/J7FmY3ecTj+0n/qw1kjaZZfwGWxGzZ8Dcn5XVNSsEMB76abdCCkOIKkflvrGaQcQyMXuWX2gL
	OgxKpXLDqC4+ttm/VGdnejXQHUBcxc00dfTuDwjKr5h4zLYR6cPqvxOC6h+PPP+pgiaVmb/rcND
	GEKn/rm/aPBNWPouucMJoh+ZRsZA0+wvoK+fv42t0qSOM6CbL3+jp5HnG18N77urrPeYwPOPVej
	Y2c3k+nne2VKs4Dq0aat6WtebQMJ9QYkUFK4+4/AK9rHYQ0+QjJGWq2CSYdBgyNmcnTFK9KHpXW
	Z6XE+YLaHm1FE6Ilf6WMUeRXCDekBvEzJO7gf7UnGYqIpNnZ5OvWehL12w/i0vhZEeqhZX5sPYs
	NZqySkNldn47C+VEqS9xifzPOII/oTVebWRXyou/XLiVwZThCMMNRvVzidVrc+r0eq5ue0IHrSB
	fpXIWlHyAzusumYyzTDZNXldv3jKT5GSmDh3uDvTr5KUIFiNV774dR5JiMGaHc2fuBE2G9q/x+p
	zAOrQFE1b5B9JcFq5wFmOHc6kQYxHLWqg3JhWGvF9s3bLQdalO3LdLUiPAxMYdhY+ouEtt3Sw2K
	Tku4olE22uDTcKr6e6nssmBKCyyeyui6YOVKwFYYc28A8J+E=
X-Received: by 2002:a5d:59c3:0:b0:48e:76ab:78f3 with SMTP id ffacd0b85a97d-48e76ab7f04mr25543431f8f.15.1793723838237;
        Tue, 03 Nov 2026 08:37:18 -0800 (PST)
Received: from threads.localdomain ([90.254.187.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3e9sm29044772f8f.6.2026.11.03.08.37.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 08:37:17 -0800 (PST)
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
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v5 1/7] dt-bindings: net: amlogic,meson-dwmac: list the compatible combinations
Date: Tue,  3 Nov 2026 16:37:09 +0000
Message-ID: <20261103163715.385394-2-tanure@linux.com>
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

The compatible property only checks that the first entry is an Amlogic
name and that "snps,dwmac" or "snps,dwmac-3.70a" appears somewhere in
the list. It cannot express which fallbacks each SoC takes, so a SoC
built on a different Synopsys core cannot be added without loosening
the check for every other one.

List the combinations the device trees use: Meson6 falls back to
"snps,dwmac" alone, the others also name the 3.70a core. The Meson8m2
reports a 3.70a core too, so it joins that list; its dtsi gets the
missing entry in a separate patch. The example used a two-entry form no
device tree has, so give it the Meson GXBB combination.

Assisted-by: LLM
Suggested-by: Conor Dooley <conor.dooley@microchip.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 .../bindings/net/amlogic,meson-dwmac.yaml     | 29 +++++++++----------
 1 file changed, 14 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
index 9c9cc3ef384d..e769c9bb70d8 100644
--- a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
@@ -129,20 +129,19 @@ allOf:
 
 properties:
   compatible:
-    additionalItems: true
-    maxItems: 3
-    items:
-      - enum:
-          - amlogic,meson6-dwmac
-          - amlogic,meson8b-dwmac
-          - amlogic,meson8m2-dwmac
-          - amlogic,meson-gxbb-dwmac
-          - amlogic,meson-axg-dwmac
-          - amlogic,meson-g12a-dwmac
-    contains:
-      enum:
-        - snps,dwmac-3.70a
-        - snps,dwmac
+    oneOf:
+      - items:
+          - enum:
+              - amlogic,meson8b-dwmac
+              - amlogic,meson8m2-dwmac
+              - amlogic,meson-gxbb-dwmac
+              - amlogic,meson-axg-dwmac
+              - amlogic,meson-g12a-dwmac
+          - const: snps,dwmac-3.70a
+          - const: snps,dwmac
+      - items:
+          - const: amlogic,meson6-dwmac
+          - const: snps,dwmac
 
   reg:
     items:
@@ -175,7 +174,7 @@ unevaluatedProperties: false
 examples:
   - |
     ethmac: ethernet@c9410000 {
-        compatible = "amlogic,meson-gxbb-dwmac", "snps,dwmac";
+        compatible = "amlogic,meson-gxbb-dwmac", "snps,dwmac-3.70a", "snps,dwmac";
         reg = <0xc9410000 0x10000>, <0xc8834540 0x8>;
         interrupts = <8>;
         interrupt-names = "macirq";
-- 
2.56.0

