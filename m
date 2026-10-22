Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792693879;
	b=DABwyaxHd0SmqKieFySvgGbH68SIsyacu+hUGykKCW63F1x/rRllLjtarHmORrZ4VRHt
	 9uvdWbG0eL40Ot0a3RkHWjB1ewNA2v3web983asZaSAe2Ii8YqZj/0nMaDKRzeiGb+NtL
	 BAKQlah5zSTvK/odEhCcKq4A6ZHGTeCh8Q6+7pJf3Spji7c+DGx7X7M/ltnr7p0v+/muL
	 ppIzuImUpK4OB4Gfe1Bz7DH79y5VKrVEYaOtdQLXJlkmJzJ9h+gvU0zJyE/8AhuHjD2X6
	 J3rbK21d7R+tEaIt5FpQ3vQvCtCBsQzNlzzOZjuV5PwmOBW8DKY4AZMJRX1ecRpR5+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792693879;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=4SEjFwtVvykpBgFwA0p3axqlT8yNbHcMYFjfd+lLVW0=;
	b=hX05DURSM/FWdrJ/rQekooUubbTHzePU2k5ND4Z3IuPicHfkWm9u3SST6yf1ewEr8Ojh
	 C/MBGAdvfkcy8SOwBv+UE6pe+M3/wv1CQ9R3EawuuYDlsyoBo4MdMVW+az2t0PKv0JD+j
	 v3h+LEc35i4ZxCFN/Nupv7xovNhG79tpTIXnM7DDUuFk5hKhsS3SQ6xCBXlUJk7re3LP5
	 Z6HYsqQFCQyX2u9o5vTvsoIiIEzRpnfGZO0EK4D5IdXwqFG1MiJL4Ls7F2QnE2nT+EMO7
	 VfArLPzz+dEUoJAO+97xvc44nY7Z2vaQnqSCOnCpvHraPKI7JU1jyG5LkwAsEKkmA4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=kPmO9+Z4;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40292606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 18:31:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40292606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=kPmO9+Z4
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a2084d62cdso975605e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 11:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792693878; x=1793298678; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4SEjFwtVvykpBgFwA0p3axqlT8yNbHcMYFjfd+lLVW0=;
        b=kPmO9+Z40SjLwW+NbtNSrA0cV7duKb8LaXccOn99DNPGE3BGI00GBVHA4EJDThDhWm
         KD+59eelIZeJd5MMRynf3Toi0GuZUlntpXZbTHfcp8fZeyF4WFckW9Sxj69M5nph4M4e
         cNNHwaikPehm+wb15Dz4b8ai9CjXeHyhXuDWjcc52y/jh/8Taa6mxNmLm4cIRq2Nk61z
         l09sJy/9j2trmQPdMi94uvMfHuwP1KENO0GdQsvhUann4bhfaKGdr7vP5ixZV327VS12
         3zlzATUStLfc0TLcMc78unIygy0QWhtMG6DvHF7iGsxiCmI7noR6Hu3NHUxGdXZRGL5o
         SgQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792693878; x=1793298678;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4SEjFwtVvykpBgFwA0p3axqlT8yNbHcMYFjfd+lLVW0=;
        b=OfuSdaUI5Y2XZ5dvuaF02GvxHkVrrjMtjSTfVI35XuE6wXJS0OQ4WIWpVjgd+W9yab
         dGmgSMogPz99elu3dk+NoF0ktUlSFGsjGZa/RxK6cPeOy8+vbubkwlXKBP7VMgLNJbpC
         VsImbBOV4a6Q0Nv1jzkXJMKr2X0pRyg7d9+Iv1O9Q2LnGoH/04HPtUwO9VWokQSSZ16f
         cpQ9FHALDmscIrOpeM68Rj2kWVBOPoauX0lwvBxCdckZFuv1qV/B8PpDZDiiAqzt+TYR
         8v3NYFeVCcwLmeYCP0XidGS19lIfFnnZQaOcBy6QkZFJrnPOPyfl1f4OMihH8eqCArk9
         OFIQ==
X-Forwarded-Encrypted: i=1; AKwUvBzHAGn1v6zKWUaGTn/jYjiu17rpOmkGuTmJJ4/f9HR7qMGqPK00Hp+B2Xug4W+j2FXMTfBj9f/o73AcUf8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIPHPgWiGPfXhqd3X0Wkbrji7syNOUZVULavuoL1cnQrcoUOfAb
	h/uZnvcnvrwGYNGCVXsf6flo2nkgLf+5HnGXBGTJDtecbiT84QMAlsVRVjqexIxldIHprqnR1ZW
	57/Cy
X-Gm-Gg: AYBFou2homfBkBXn2ODaW7NBuNW/21WYZkxwJrDvOnVMUugMb9O6addDzKbk3HUGfcK
	WlVODL6rqKrjOb3s3i/XqUvPPMpyw2Mn7aH4PLsEZg3HKqaBz2H0Owk87cn0KKzFoVM/HbB7krV
	HGkmXUJVWTbB9xc2yenitBemEq0jsv0M8ClxJUN9fLw3StdL9VuozoyFSSVrYsqQER/en0NV8ly
	RjRqxcNcuLC4SALppWKOcvy/kjqbAMIJwuS/uvHWQ1MwEwwUGb4JxKMnCkIJWgjcHT5pHoaAuV4
	55x9O1WORNu0eJwcktDbF5QPUJiuW/DzflJdNP/q0T/F2E1j5Q+jfe/jqo8mDgE2JFHcxLwicsH
	w7dMtPFs7WsS/xu45F1D/uBXSWwL5iq9xH1QLm+W0j1I58lu6m3Iyo7p3KfnRVZK6zMYVgFLF4i
	I0PAT5nQZ0HemqYbsfrY2loq/S4peDFB7axtjXk6g74fQNg3P1hbU9dXUyzsuQmERyzu2vQVozQ
	RjeFco5bhW2T4s3SXPjMOJmm8k7o1eG3WRDJ+zX82LDz9AM7i8URRARcFmgfx2Z3uf82TkU7poL
	zaFSUR2YKDxwou5C0uNual4XvR357vpQ31V4L8rqNr8=
X-Received: by 2002:a05:600c:8b8c:b0:4a1:813f:2a57 with SMTP id 5b1f17b1804b1-4a1fdafd5d1mr136430265e9.13.1792693877622;
        Thu, 22 Oct 2026 11:31:17 -0700 (PDT)
Received: from [127.0.0.1] (host-79-21-165-229.retail.telecomitalia.it. [79.21.165.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a21143094fsm4556975e9.1.2026.10.22.11.31.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 11:31:17 -0700 (PDT)
From: Carlo Caione <ccaione@baylibre.com>
Date: Thu, 22 Oct 2026 20:30:27 +0200
Subject: [PATCH 1/4] arm64: dts: amlogic: s7: fix the GIC CPU interface
 region size
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261022-upstream-s7-s7d-gicc-size-v1-1-8285053cf4ee@baylibre.com>
References: <20261022-upstream-s7-s7d-gicc-size-v1-0-8285053cf4ee@baylibre.com>
In-Reply-To: <20261022-upstream-s7-s7d-gicc-size-v1-0-8285053cf4ee@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Carlo Caione <ccaione@baylibre.com>
X-Mailer: b4 0.16.0

The CPU interface of the GIC-400 spans 8 KiB, but the S7 device tree
describes only its first 256 bytes. The GIC driver then disables the
split priority drop and deactivation mode, which needs the GICC_DIR
register in the second 4 KiB page, and warns at boot:

  [    0.000000] GIC: GICv2 detected, but range too small and irqchip.gicv2_force_probe not set

Describe the whole 8 KiB region, as the other Amlogic SoCs with a
GIC-400 at the same address do.

Fixes: 1b753fcfcff8 ("arm64: dts: add support for S7 based Amlogic BP201")
Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
index 64440df4f542..89b75bec40f0 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
@@ -121,7 +121,7 @@ gic: interrupt-controller@fff01000 {
 			#address-cells = <0>;
 			interrupt-controller;
 			reg = <0x0 0xfff01000 0 0x1000>,
-			      <0x0 0xfff02000 0 0x0100>;
+			      <0x0 0xfff02000 0 0x2000>;
 			interrupts = <GIC_PPI 9 0xf04>;
 		};
 

-- 
2.56.0

