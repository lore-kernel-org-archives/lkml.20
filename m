Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B9DB48B398
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 11:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789988522; cv=none; b=Bn/ckpc14Iie59CO9yKO9f5XN7oZX9TvrDUmVjTvdrYZlm2x58ZfkPCuyOIA8+oeh94ue2Re7GK9D6cWOHYySKf6kTJxaif5FuzMQRkagEWlBaqkPArNggVNoyRljQD19EdoM7nHiS2Ei4HBolExZwBwPVR6BNQOYJx5zY0Dwrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789988522; c=relaxed/simple;
	bh=g+yjyBlPM3DyxbBgTRNNL0HdvBmH9IZFR3frJ4kwSTg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=epqiT6U/BuZ9IcPjmIWmkJ9MMMTR3ogj38ozaDcDp1VvkI5w/ZRLR17iV3HdFrb3d1MjdvCtWb1LBGrOVKb5pEycML6R+VlVF1WXsQ60w+4rUPNEEt5VVTxbS+jPBvaKk6KdlBDNzF8tfWtGf8c51RV4G+KpgOm9aFjUDZmJbR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B0PvexX1; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B0PvexX1"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912d822dso19432595e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 04:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789988516; x=1790593316; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=57oJZCX/AW18tWPdP5KRkbGYQagmjaqL4TR6kTXJsWA=;
        b=B0PvexX1E5ly7JAXBh79Rz8QshkUMFzGqJvwbWPuUROM5JvN6lpfraFL4hH1bM/lZF
         3OXGIomc3A6s9NErb3i15OQoT1+qfLGQfwViNNo+ayvYwMd3xHM7vTnZRZINI1sCmODJ
         eTbhjig53p40a08I7++cknceGWiAPDxn6qEZJ27N/3cKxGfKfmRqEL+uA2A1QxoM09I1
         S+s7GY5MgnmppII8zyvxt4cyWgUOYlkxIpvueMeNl3hW/CyMMVb4nwimV55dmigua2+x
         5qR1N1m94yFyMf/oqEuapdB+kfOFmcmpcStONKNEqUcw4mTx/V0x8cj1e3t6rKpiopWz
         d1Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789988516; x=1790593316;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=57oJZCX/AW18tWPdP5KRkbGYQagmjaqL4TR6kTXJsWA=;
        b=cgwbNNSSmxlcUU6KfFqx/Mj1GfBv3KeUGRminMTSLIyO86v3XeIpJMKxs9q2Hn8bv2
         y39ywd/FqAjMH3juCm4fDjW0TsiFt6fEqkQVhHG5pZhjpQd4Pi+OGjZjeHXfj2UWPble
         2gnoU8EBeuiWcyAjlUld8HZR5YPseqG3QdO8ycFMaa0BVuGveirFE9QhaFSftQczG5KM
         gXpJVsyINc0mH+m+QGtrNJfA/CYavctumJNPeXmKAIe12mPxFvmMFxFYEAHc7RWLRZhA
         qOoccVXhGWdJ3EOcKznlkEPJ5jsmqNvCcd3vkPtepkle0dEFJwVbApX+Elc6nd0FVgka
         9uew==
X-Forwarded-Encrypted: i=1; AKwUvBxm5KNPqZWXARSQdE3v/WG64qRLQId8IKxzG3te4wTJQQbwWgmHWIAe5TBjTkSFGW1In58HwVMUXLiWTGU=@vger.kernel.org
X-Gm-Message-State: AFuF++n4P9yIjvvqo7CEcEysgmNCEGPqcmnOYTBH/oqbZ801y1VBr/XL
	wlo0az0vA7CFTOI8lAu/24t8EBDwAwx5NLp5duuazvG07X6NE9RInUWF
X-Gm-Gg: AYBFou10qWYDpLSSnm6U47IyTBhGmMJhX08gOYCXtsIaCzrxKibAt6BDp/hdSvBkdjJ
	yCiwWxEQEH349YxsAjvpA47mopVudJ1pTTjjrawPHLa+zWMWO5oEXDdZGeoORb4HcBVM6Kqd/tx
	Nc0eCJdMTDggZBMqSCEzMh/dYt92Lcf2dW+2IrT3gcjolbNhs4HQk0VyyU7hM2pyM0kS45RXJjL
	jQtuE8MIoWa4MkZn1wf3fx+8LGFs7Qtxn95bWvBX+5iljg8VeLSqDO1TXlDKAIdWrii6ocS9DAZ
	OiRRERo+t8UlRHn+D1mJenUXCE91BjckhAZqOPrpkkfFaQC3KnGqbrBnqE4qpaTLHc0uAHiW0Om
	I6Nc+Fze/9PbPGWifs/TsBmZHrcdP8WAJ0Ma5PvxTAAZCZfMZLVhqTdVwNHrk3xGUX0O759XzkW
	BF7wcBMqIZ6Mna2e+bgEsIJWZv7qXoO+W7mD1YjYSRBcDvj2ymazIWxIp+PVfg6XyDeDa4L5MNw
	YkgxjmtWpDjrukA6zUXmTeQ/22H0YX0u37bJr7ZdZbJX5g1Ld+hPchvrlx3fD0kqG+GwZdp6202
	TgvkoPc=
X-Received: by 2002:a05:600c:1385:b0:49c:edd2:855 with SMTP id 5b1f17b1804b1-49fc5673264mr139072305e9.6.1789988516540;
        Mon, 21 Sep 2026 04:01:56 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:856:ad4f:1ab5:71b6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd07bc34sm214267425e9.10.2026.09.21.04.01.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 04:01:55 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-iio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 1/3] dt-bindings: iio: adc: renesas,r9a09g077-adc: Drop unwired interrupts
Date: Mon, 21 Sep 2026 12:01:42 +0100
Message-ID: <20260921110144.44425-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260921110144.44425-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260921110144.44425-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Remove the compare match and compare mismatch interrupts from the binding,
as these interrupts are not wired to the GIC on RZ/T2H and RZ/N2H SoCs
according to the hardware manual Rev. 1.30.

While this change introduces an ABI break, the expected impact on existing
users is minimal, if any, since the interrupts are not wired to the GIC
and are not used by the driver.

Fixes: 4d8d58987cb5 ("dt-bindings: iio: adc: document RZ/T2H and RZ/N2H ADC")
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../bindings/iio/adc/renesas,r9a09g077-adc.yaml        | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/iio/adc/renesas,r9a09g077-adc.yaml b/Documentation/devicetree/bindings/iio/adc/renesas,r9a09g077-adc.yaml
index 4b5934ac296b..5b496729022e 100644
--- a/Documentation/devicetree/bindings/iio/adc/renesas,r9a09g077-adc.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/renesas,r9a09g077-adc.yaml
@@ -34,8 +34,6 @@ properties:
       - description: A/D scan end interrupt for Group C
       - description: Window A compare match
       - description: Window B compare match
-      - description: Compare match
-      - description: Compare mismatch
 
   interrupt-names:
     items:
@@ -44,8 +42,6 @@ properties:
       - const: gcadi
       - const: cmpai
       - const: cmpbi
-      - const: wcmpm
-      - const: wcmpum
 
   clocks:
     items:
@@ -119,11 +115,9 @@ examples:
                    <GIC_SPI 709 IRQ_TYPE_EDGE_RISING>,
                    <GIC_SPI 710 IRQ_TYPE_EDGE_RISING>,
                    <GIC_SPI 711 IRQ_TYPE_LEVEL_HIGH>,
-                   <GIC_SPI 712 IRQ_TYPE_LEVEL_HIGH>,
-                   <GIC_SPI 855 IRQ_TYPE_EDGE_RISING>,
-                   <GIC_SPI 856 IRQ_TYPE_EDGE_RISING>;
+                   <GIC_SPI 712 IRQ_TYPE_LEVEL_HIGH>;
       interrupt-names = "adi", "gbadi", "gcadi",
-                        "cmpai", "cmpbi", "wcmpm", "wcmpum";
+                        "cmpai", "cmpbi";
       clocks = <&cpg CPG_CORE R9A09G077_CLK_PCLKL>,
                <&cpg CPG_MOD 225>;
       clock-names = "adclk", "pclk";
-- 
2.55.0

