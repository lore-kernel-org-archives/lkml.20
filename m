Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792778369;
	b=GvPv1HLkgm1JlPsRZ481bHAYFHDMv9yIdiU6WeLJadiclWRdS6T6ADi/bCNkCemB1VuL
	 ld67jVNkfKSvMU1CXa/pnaEaVNcM39LNW+iVaYhaQ9mSuXt92DFaBjd1rJ/MNMyxrj659
	 BtV8E6LEwnwogfucsbMkd0zyguTNra6dsdSh9jttofEuMyfVVEFf1id5O198Y/IzCI/Tw
	 v78Rz0U1QLBKv+BV2Vvk9Hrf8gJZO4ZOZzpZI7oAiYbh7tViwJ0Sip9oD2f0HIlvZbh6c
	 jvvjrI6qmVomOb7YBoTAvW3mT7ecbCuF/hkhg616Pmx9RojovZDiwxsPZq4OkqvJSSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792778369;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=LpC4gMXlTugYajA/SMa/iR8ejQmmRNh7RBHmbQp4ruc=;
	b=ebKX0B27JCNS//0RoYtIQ/V4Z5OFsxGGIqPJ+mJ3Ikupp65HEs5JCH5DKc12mTZKE+DE
	 gWArqPGRveE7VSBZT0GaDKXrKITl9lzN5/w93d1IU5D0Vj0jFK5RjfO/mTkvsaANM1Jt4
	 Jffhn8rCVHmLOANEq7fMwJ/eMT3zILaqasU+uppBkiNxy/7bngERG5tViN9lP0Pqya3LL
	 FLrJukccBkq1UcfVk4VOuiLtbjtFHtdipx+iNscO9XQFMHXg6P8OdS7L8LOrL/AiRdoYm
	 pxCcf9IGWs5vqq8Y9/G7MtgLJanECP6ZQ+htWzdYxk88ml021o09wQsjr0W1QGu22Pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TdotHO0L;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5989D606A32E
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 17:59:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5989D606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TdotHO0L
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a2084d62cdso9109815e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792778368; x=1793383168; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LpC4gMXlTugYajA/SMa/iR8ejQmmRNh7RBHmbQp4ruc=;
        b=TdotHO0LUw1mirdK8D1NBjojrI2VmIEU5egfzcux8YEvAuWfygCij3RiEUjE5TnLr+
         WpXsbdXZSHieqpN7o626WlDMX4LW+UwO1k1r7FK28CQpRKVsGCTkmdhAnsfVn1XawLdH
         VrL7GsQe+wE4DJmKu+yInnG+mXRyisWGjIJx3SDTe6Srbq58prtysyLwOoZjJfXUuBP+
         OE9A5kxovZsuX4jgkwq3urr0da7Xwfneug/sNNpWfc6kfkPcRWjeIVYFVmOiw2XlU3yB
         5uKXlSyKeJIS9LiGRwWSITgeo5jsJQ4ZP+ohwWxLHGN72YiKdOPgI+6WgJjycdoRAgh5
         K6Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792778368; x=1793383168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LpC4gMXlTugYajA/SMa/iR8ejQmmRNh7RBHmbQp4ruc=;
        b=CfsovRGhJOPhZTqpdHDvlLoo97kvVikvfJZlIQlKiftcLvHmVNRGkVBR49KAgItIr0
         p+zjNis0Wrsyp7gCc++5LHZsoILmd61FOkzVAqs2G4c0RJeQ3suyN0W/x5LGyzM+CXi9
         5zVBWN73wSp3OF0li3N6NTXiQEKu7jbGBPgM28drg34W8VcM466ibXrHZFZabRwrd+Z5
         zEPB286Dy+9GEMlv56942UERW55WBAA8L+PkMtKMWEBkZLgWt5ZuwauDo0PJbD6eL7Rt
         mwevCqUaUJyuk/mPytgYtsNU9zOt5Vrcodr5JhrX10R7T+90hi78lRfEbkU1CJ9qJq+q
         iUPQ==
X-Forwarded-Encrypted: i=1; AKwUvBwMtOdHajARuNLkyjrBmzr1DUa7OEjmMSNu7W9i1PWfu+FEFjQtkf8MZp174ReSIUvJ0LGTG0tD4snUXBc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLvex/zHwlzRUDgY4LdrSsjhOSMOstt+OE7hfwkTfkz6NWE9cyf
	sK8O8EYrHhVzdtzm53jM4B4alvwRzS+MecWL3//jfzdkDA4/vaiGeINQ
X-Gm-Gg: AYBFou3fY1GKTZRjfwD5Elyb7nuOAvPBcwtGP6n463IXyQ2i3dPjpcFKAhkZvu1gEQZ
	SiJ9Sn6SVWbBSFFYJbuSCEFtpbJyEcvyNhhiZiAUz1VxA9Tv4CHTEcAWecFCWFSECS0fZg+p6Bu
	0ke646kb8hKrHrMsJWB9bS/bHF/ouj3rFE9qoT6mw6OdE1QpNBmVB3+v4KjNdY20Hk4rxjzsRCG
	3JSOzp7ID/BxItEi0Z7XZ7RM5VQObn1iBb3yVvf7Gyy44Q/8hVyNCpnHKSGWO7nX4cf3AMv6Pch
	vho93XRlqHWD8F6R9v5H183GlW1KR9fHvu611tagxKdu2VR5fmRCVzcvu84a2a0kNUT+T78s8rR
	Srbfk0kOWewnsp/c2Sz4d+LFAYTW8tyOhKKFlBkEsn8wPon2EWCZ6zL5xKJMuob1eciycA/vw8E
	SaQP1H7uVIr/17lK8n9a6oxDVUyn+BEip8Y4dEaBHN+HxKIPDmyWs1xrOXBiYEgSPoAG2pNqc0Y
	MCT3z95+25YBlRRZae1xGyy/wLejaUB2dJOpTxx0xLrRpSr4xxKXcJ3ZARcwnnYN6BTzB+LoSxO
	hnd+aqLaS6KHU8xQ06X5jh7cHQ4YhNAaB5cptzrxPL4eGMHHeS2iVGoPC5qYiBIG/t1JeheS8NO
	4+Pqig0Fw7oKXFt0PRMsHgXziAYpgaWFToS5snvSxc+Ka
X-Received: by 2002:a05:600c:4e8a:b0:4a1:e7ce:10a4 with SMTP id 5b1f17b1804b1-4a211eebdc3mr52878955e9.29.1792778367523;
        Fri, 23 Oct 2026 10:59:27 -0700 (PDT)
Received: from iku.example.org (host86-133-9-17.range86-133.btcentralplus.com. [86.133.9.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d37ca2asm1342800f8f.8.2026.10.23.10.59.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:59:27 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-iio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 2/8] iio: adc: rzt2h: Wait for the analog part to stop after a forced stop
Date: Fri, 23 Oct 2026 18:59:13 +0100
Message-ID: <20261023175919.160103-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261023175919.160103-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261023175919.160103-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

When ADCSR.ADST is cleared to forcibly stop a conversion, the analog part
of the A/D converter can take up to 2 ADCLK cycles to stop operating.

Wait for the write to ADCSR to complete and allow the analog part to stop
before reconfiguring or restarting the converter.

Fixes: fc3b97dd71ab ("iio: adc: add RZ/T2H / RZ/N2H ADC driver")
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v2->v3:
- Avoided splitting up the ndelay calculation into multiple lines

v1->v2:
- Dropped using DIV_ROUND_UP_ULL to DIV_ROUND_UP
- Included time64.h
---
 drivers/iio/adc/rzt2h_adc.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/iio/adc/rzt2h_adc.c b/drivers/iio/adc/rzt2h_adc.c
index 8ba7b0fde8a1..131904d97b8c 100644
--- a/drivers/iio/adc/rzt2h_adc.c
+++ b/drivers/iio/adc/rzt2h_adc.c
@@ -15,10 +15,12 @@
 #include <linux/io.h>
 #include <linux/iopoll.h>
 #include <linux/kthread.h>
+#include <linux/math.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/property.h>
+#include <linux/time64.h>
 
 #define RZT2H_ADCSR_REG			0x00
 #define RZT2H_ADCSR_ADIE_MASK		BIT(12)
@@ -58,6 +60,7 @@
 #define RZT2H_ADC_DMA_BUFFER_SIZE	(RZT2H_ADC_DMA_BUFFER_SAMPLES * \
 					 RZT2H_ADC_MAX_CHANNELS * \
 					 RZT2H_ADC_CHANNEL_BYTES)
+#define RZT2H_ADC_STOP_CYCLES		2
 
 struct rzt2h_adc_dma {
 	struct dma_chan *chan;
@@ -124,6 +127,15 @@ static void rzt2h_adc_stop(struct rzt2h_adc *adc)
 	reg &= ~(RZT2H_ADCSR_ADIE_MASK | RZT2H_ADCSR_ADST_MASK);
 
 	writew(reg, adc->base + RZT2H_ADCSR_REG);
+
+	/*
+	 * When a conversion is forcibly stopped, the analog part of the A/D
+	 * converter takes up to 2 ADCLK cycles to stop operating. Read back
+	 * ADCSR to make sure the write has reached the hardware before
+	 * starting the delay.
+	 */
+	readw(adc->base + RZT2H_ADCSR_REG);
+	ndelay(DIV_ROUND_UP(RZT2H_ADC_STOP_CYCLES * NSEC_PER_SEC, adc->adclk_rate));
 }
 
 static void rzt2h_adc_set_sst(struct rzt2h_adc *adc, unsigned int ch, u8 sst)
-- 
2.55.0

