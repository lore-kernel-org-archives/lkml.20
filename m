Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793195968;
	b=mGt8vSXGelr5cpr3dBJMQ0RSWnCmOQOj5A9lnjYN9wyVle01U/2Wqj+TtNDy+mqfJ73P
	 Ldmh5Hjs5bWpZzuxBBFldWyWJhTu+VToMLaRmGvcNa++MO2q7XB/kmmtYIBduNmvRTOC9
	 y0RcdPLgHQuBdYIdl9EEYWJBfwbmLMsVG5n05g7S222uSOxQfKR9UiOL1/Wouvyadz3ol
	 TabAFlW+cltOVuzX1ni9hw4VBHHuoNVIuIBpKMH0TPBsWsQ/CKAUKcUoZ9kLAFRh2TNq2
	 g+5XC2qmrV6l9HQL9nOtz67+CkTv9Q4+JCkwZpl0LOavMjkWCoW63idTluJuwu5UBww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793195968;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tJ2ssWlVcmkkQrirdzPI88gPKBfEyms+Ybe9tNYAWD0=;
	b=pWBZJ0ihJcEYXXXgil0Ymia/1Y/0aIrOn73f0yrVyRsAqGTisi/vYM5BNPWC3t7fCYuB
	 jA28z63jBRah6bK4eHTxkiBobWK/TABYPs4WuVqW6eEfAxzPURN8xuB0iymxgLQsP4911
	 jzlweT4ywOmqMsXQHWZtFyGMgf60UbS6Y+nozR9e577s1uweLZltRXPZpWt5WsVZjdHh8
	 /3n/xyfuR8gwAhCsoVFI7RZtYE2qXVr12E/na8Rpc1QKot8q9K30DksoHxtLbxZqIv+mg
	 tit9s9f0U6FTKb8rX8qkJDNCpzrCE2A2cilOz8JwJxmBRRh7ygTb2wTDz/VaRgHR2yw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=M8phV0dE;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E68E60A2621
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 13:59:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E68E60A2621
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=M8phV0dE
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a20a37703bso8208275e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 06:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1793195967; x=1793800767; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tJ2ssWlVcmkkQrirdzPI88gPKBfEyms+Ybe9tNYAWD0=;
        b=M8phV0dEIHbg0lraYu/vhrhKgk0Viwg7m2DMDa1FP+Gj2/hEHkgKdLFXg5u2woCs/o
         uoIOp/MFcZPCFJXhKEeg0RTI0JS5yMahRkzN1AJS5hvu8e0mXzJ06G803nfSNSA5e8S2
         IZk7TZlCn0aplIIba1KEEfQ4asbz3p/KMhZfk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793195967; x=1793800767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tJ2ssWlVcmkkQrirdzPI88gPKBfEyms+Ybe9tNYAWD0=;
        b=nTak7EpiFFP18LRct74nru6/Rw9tbiUEHaer4PBqit0z0l/XIcefAjO7NU8tZ050rK
         d+UBpKSAbekD67ncY49GNSKSZV+flNtvWNu13AiS3dhZXpEih1GnQG2LHOPXashdrLkE
         9wDNqse0+y1LBm8YQh5/ZRKEScNtCzj7XTgd33//iijKdwbblu6gVljSr0U+3xLPuB+L
         3WUZR98Vhw6z+DDW6d6vsEtYg0wrds5VkRt6AMm8YaeLO4bVxf4eeULxEnBt0GbeL0P7
         QjeOuIMbJjlN+rS+SMBwhkhUHgyY+r1xaLDdsyJl/bv3Q0Qrp5X01KH3IWUtzsBVV0aq
         IbMA==
X-Forwarded-Encrypted: i=1; AKwUvByR33xl32bCK5lguTg6De22DUF0W+cxjmQGN9VoqdzioKv3pA/747j8xPsEXlVNUC9rMnpTPTt88k0cNss=@vger.kernel.org
X-Gm-Message-State: AFq9FYJV4zWXDlUUyO/h/cIYdGLul8hieltAwIaBD+HeoCh5C49WoToL
	KQ4XXzbMQR8jpeAr72FvWjSq1ktk/a5kC/UKTQ3Q8V4zPXZL2IzeRG13Lk5d1DHGCLY=
X-Gm-Gg: AYBFou29pebAB1MmpYxtwD0LaxDWM1ljeE2uCghI1VgjEnCYO+m5ug5F5z1mctVL/8d
	knUHUvG4OSQqAkIB2UFGLv4MMqcGF1mCwUJ3lfJpR19u7uMkjpENW/617FAeyItaUy4wwHN3aut
	DKlDBXsIWNgXe1w78UVeFjprwupU4vOvyTXreNMB2YTOWGhO7zPjjVgA7IlEGeCPCeyg+fiMG9K
	QTHtDVFru4o85uvEUcFr+QYBpkhud6QKl95OvJfw1U5xMDILceyu9VOA4MXHR75g1zg08ksbhiP
	DNHrN7+kDoCrrP00qD4SepRPvXIA4ckp8QKuLjrycoPeGBlTwyv5eQ0TmuZYdHqlxEjTGO0/LL2
	GgTpAKG3ac02T3Ewx6VDCgLqP3SvdZYbDp5NGlfCoO3QRyzQny7Qm03ZvI9MQJVD5EkyeHTED8B
	offkLx7EvTni2TnYoCz1bABSSEe9bz4aLdnY0tvk4Z720AhapjS3EyasjHd/z5rps4HqirpbtjM
	F1eInrM85Tn8IxUqAwc8N6utgVGqp7naHjkP3xOSK8pCh5NZ7DLvafWjcUmp0r0OwVRKEsE0Pen
	69QdWg0hJlFBxxJG/9kf1KAzALQ0IcNABU3wIaVbfiIET8FmYUgt1zDLY4S+Jjf92njsbQbTp5i
	YIWxTN+PRj0qAUz+CfF/ivi2eByf3sDPNDLs2jQAI8kjPILUwFvodLHP39Bu2/6W9jN/bag==
X-Received: by 2002:a05:600c:3512:b0:4a2:c9b:9b98 with SMTP id 5b1f17b1804b1-4a9665876a3mr51801145e9.17.1793195966837;
        Wed, 28 Oct 2026 06:59:26 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.42.39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a94f05f168sm37077165e9.4.2026.10.28.06.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 06:59:26 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Marek Vasut <marex@nabladev.com>,
	Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
	michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Yannick Fertre <yannick.fertre@foss.st.com>,
	Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [RFC PATCH 4/4] arm64: dts: st: select the Engicam RMM display pixel clock source
Date: Wed, 28 Oct 2026 14:59:08 +0100
Message-ID: <20261028135915.2665857-5-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261028135915.2665857-1-dario.binacchi@amarulasolutions.com>
References: <20261028135915.2665857-1-dario.binacchi@amarulasolutions.com>
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

On STM32MP255/257 the LTDC pixel clock is selected by the SYSCFG
pixel clock mux, whose reset value is the LVDS PHY pixel clock. With
the RGB panel the LTDC is then clocked by the unused LVDS PHY, and every
commit times out:

  [CRTC:42:crtc-0] vblank wait timed out
  [drm] *ERROR* flip_done timed out

Select the LTDC kernel clock as pixel clock source in the RGB panel
overlay and, for consistency, without relying on the reset value, the
LVDS PHY pixel clock in the LVDS panel overlay.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

 ...57d-engicam-microgea-rmm-overlay-am-1280800w8tzqw-t00h.dtso | 3 +++
 ...2mp257d-engicam-microgea-rmm-overlay-rk050hr345-ct106a.dtso | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm-overlay-am-1280800w8tzqw-t00h.dtso b/arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm-overlay-am-1280800w8tzqw-t00h.dtso
index 7655c1bf56b1..b44e1d3ddb1b 100644
--- a/arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm-overlay-am-1280800w8tzqw-t00h.dtso
+++ b/arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm-overlay-am-1280800w8tzqw-t00h.dtso
@@ -32,6 +32,9 @@ &framebuffer {
 };
 
 &ltdc {
+	/* LVDS output: the pixel clock is the LVDS PHY one */
+	assigned-clocks = <&syscfg>;
+	assigned-clock-parents = <&lvds>;
 	status = "okay";
 
 	port {
diff --git a/arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm-overlay-rk050hr345-ct106a.dtso b/arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm-overlay-rk050hr345-ct106a.dtso
index 7be955be58ed..7855086c33c7 100644
--- a/arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm-overlay-rk050hr345-ct106a.dtso
+++ b/arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm-overlay-rk050hr345-ct106a.dtso
@@ -38,6 +38,8 @@ touchscreen@38 {
 &ltdc {
 	/* RGB output: the pixel clock is the LTDC kernel clock */
 	clocks = <&rcc CK_KER_LTDC>, <&rcc CK_BUS_LTDC>, <&syscfg>, <&lvds>;
+	assigned-clocks = <&syscfg>;
+	assigned-clock-parents = <&rcc CK_KER_LTDC>;
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&ltdc_pins_a>;
 	pinctrl-1 = <&ltdc_sleep_pins_a>;
-- 
2.43.0

