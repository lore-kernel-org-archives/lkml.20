Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793195963;
	b=iGOkNuy2cTXmO2v0O2vEcAlsLbskNdGDyeb5RRi8I5sqgU9a1txx0uJVSFde6pcShxTj
	 kVYIG4swb0qYuSKM7I3uRCg4f2Cn3i+rYhsnUs4y48wa/huVZzKNYW17NLDYBO0UMgxdQ
	 XkhVPu8Bck6a9Gia/PJmZJvUEKtNeZ7xHOQy/JY2wS8YUxfp4Hi4fxWXrFfK7M1Dod6av
	 utMYt4rk+IgrhYPlRbMiv57vR5iBaRzB3mYT3EIEETbKUxwHfiuSNhZgqVsnzwan4PHW6
	 H4Vwa7GS/DAj22W794C/c4R2o2oKtbp0ahLGkPZUy3gQ0QjKl9+42SIagsCRQXDKpig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793195963;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=z4XBdpqyVTDx7Yqi6vugAln2ZDQbNUBV/V/PeOlv9P0=;
	b=x67H1RldvVF9X4j+m/J9gBdqpLAMtn4u9Qun8W72MqrD54n0Rv/YTMoFpDFgNEsI7uVY
	 ghDGlhMMkoz0ldt2mGN8Uh0spy+iKopYysS3iIQTcJ42DKTVRXCpzgK8ciI14G5mR6X22
	 tqNh2BkZxtrW95I23pqmgSADT6B1S9I5tZqc9WahvUTCpgiT6JBk+QyyAEBaMYvhRyfjt
	 0XMTVuHY9s+w46YqINV2iv8kynO8uXPuEci4pMVwLRzNMjfDSEd6EfCaxTJoKGSx53fIN
	 ycjEOmQHx1QypjpolISeSp2+VjeJeO0vbZEKgqDWueYBnDVkWUHnVPxJ2RwzaIgvicQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=O5bU2g9t;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC754606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 13:59:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC754606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=O5bU2g9t
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so12455615e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 06:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1793195961; x=1793800761; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z4XBdpqyVTDx7Yqi6vugAln2ZDQbNUBV/V/PeOlv9P0=;
        b=O5bU2g9tAGNtcs25PP8o1bBqkcYL6qOuNmVDzlOrm87nuMneZEF0AQ1LOooHitR0XO
         NlDUWUMYi8rw7IvS2iRXP6iiGvbvHoy7zfPfiTj2eoW+Yt+Q68akRV2z/MSka2+UEDmJ
         WOFML2hZCOgjd8LDCFtVeXiz+9cXMUDmXRtYY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793195961; x=1793800761;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=z4XBdpqyVTDx7Yqi6vugAln2ZDQbNUBV/V/PeOlv9P0=;
        b=nMJE7bFmQpMU9GRWmhQ2Jv7pTG5DFLJ+MZKFDBdPtkANjqG+NuIqU7ocCxyy2czrHQ
         2JPM1QE416hckPlHhctuRJcKrGG0WX9tVZwuXqa//ovMyyj/VfR39bN23PvFrSjbWIcD
         20Yr6G3eObdhgGZoxFJC7ieSKEBmXxUp+kC8H04g8SJEVkGYBjI0E5+0mPu1Ji/fmzRx
         5rA02Sh0kTORv5EB9dKAMQahqodH1VZjfMc25x3gbe1GIPRu4Wt5y166hy+BSoq8cOmh
         1lRpotxziUTJGAQalDNSCkVtM1E0lUJewmlHs1y5+GtpXm5Unb1jPCvqFsVx0CZ4T5Jc
         w+mQ==
X-Forwarded-Encrypted: i=1; AKwUvBzeiGPdMen6e37fm/xx8PrFIJgcX3ebjYrWMWa0Gw2XAWFCvix6J+eRyN8kexHXSwIpjbPRE/joewYqLOk=@vger.kernel.org
X-Gm-Message-State: AFq9FYL5isPKIli6o/sbN6T+rGiLFOLz6Lbow9Yo0zeuLsA2Daj1QBVt
	wH5VB33CH25HnpYfE6rgScAD0VTi++sWvIP/havocEiKG6glNaBbFnU3u5xpq8S1f2Q=
X-Gm-Gg: AYBFou3YwFQT0Lor49PNu0IQeaTgXAHKBYiKk1ZVCoV4IPevTx5xffUz9uPs+efRaMp
	Nuk09MBtqSrC74QQJ1iHm7jmS7ZuF9xSZjngZ6jLYQh0IewDi1DbHu3hr3pMbSO3zmAfeR0MnDN
	sPK67g0fKr00xZZaTQwDwXmLniNFECeaz4fyuhKMtji2qBiy63CG0XYYTH7GhCD/fqPzha/hByB
	c7/2nGI4UjhpYy49pWtVQ7UqirjXb3gXaPRPOj6LcaVgq86XGazv/eSYznirdy+KRcuP6feG07T
	aRh1Xo5hNGNCpUJBgOvc1jJ6C4j6Kx6FOECCgW01D3N7jOTdz0aP/obR5S5f6jwWonbUToU3bVQ
	e+qtU6H+UUSlleuiFQ64RXCSjYgJFWpkhN58+t9vXiyI3oo4YfBOOhSWJ9XgJvn8R9ytMuey/DE
	nkd/X/9tP57AgAnQOxVYv6ZRXqFIW+0QZX10T+S2pYgU0AxAm/5gHk5O6DjmSZQ2rwm282jqsRI
	FrFTRZYwb0lICxpEAh6+15tN/z7Ca9RCGD5dX/SA24DhmYnIzdVpWjna3H09F3IIWkzEliUWim9
	uNx4uGYd0iaHzRaPDSGtXH40wR/oV+X9B4cHW2ls9L9Bqd7CAKZpQzz1B52I2PBKiHi5+GsKy50
	hEF9OXQ4/M4klCg2AeshjY8zZ+p3SIbRgGtuyU7/jhjKhyvfRRw==
X-Received: by 2002:a05:600c:8b05:b0:4a1:fa21:fd90 with SMTP id 5b1f17b1804b1-4a965ec95ebmr53037705e9.9.1793195961149;
        Wed, 28 Oct 2026 06:59:21 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.42.39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a94f05f168sm37077165e9.4.2026.10.28.06.59.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 06:59:20 -0700 (PDT)
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
Subject: [RFC PATCH 1/4] arm64: dts: st: fix the Engicam RMM RGB display pixel clock
Date: Wed, 28 Oct 2026 14:59:05 +0100
Message-ID: <20261028135915.2665857-2-dario.binacchi@amarulasolutions.com>
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

On STM32MP255/257 the LTDC "lcd" clock is a fixed placeholder, since
with the LVDS output the pixel clock comes from the LVDS PHY. With the
RGB output the pixel clock is instead the LTDC kernel clock
(ck_ker_ltdc). Since no consumer references it, the clock is turned off
by clk_disable_unused() and its rate is never set. As a result, the LTDC
does not run and every commit times out:

  [CRTC:42:crtc-0] vblank wait timed out
  [drm] *ERROR* flip_done timed out

Use ck_ker_ltdc as "lcd" clock for the RGB panel overlay.

Fixes: bc7b07bda4e0 ("arm64: dts: st: support Engicam MicroGEA-STM32MP257D-RMM board")
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 ...2mp257d-engicam-microgea-rmm-overlay-rk050hr345-ct106a.dtso | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm-overlay-rk050hr345-ct106a.dtso b/arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm-overlay-rk050hr345-ct106a.dtso
index f89641bdb23b..7be955be58ed 100644
--- a/arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm-overlay-rk050hr345-ct106a.dtso
+++ b/arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm-overlay-rk050hr345-ct106a.dtso
@@ -10,6 +10,7 @@
 /dts-v1/;
 /plugin/;
 
+#include <dt-bindings/clock/st,stm32mp25-rcc.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 
@@ -35,6 +36,8 @@ touchscreen@38 {
 };
 
 &ltdc {
+	/* RGB output: the pixel clock is the LTDC kernel clock */
+	clocks = <&rcc CK_KER_LTDC>, <&rcc CK_BUS_LTDC>, <&syscfg>, <&lvds>;
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&ltdc_pins_a>;
 	pinctrl-1 = <&ltdc_sleep_pins_a>;
-- 
2.43.0

