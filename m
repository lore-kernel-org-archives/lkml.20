Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793953836;
	b=XfHmFinxulb4VcUokG6eqqm3oilNf77Qqd+anlVVIMiua/4AXnS41gF0N/Vj2rDJDG2y
	 bdxhFQRyyLe12g70v24IxJFqHXB7ckYItzrVSKqwiu0ZzLNkFo9GnFC+LCg2gctstXlSK
	 FF/iLPHVAoKgJpQ4M3FCuEnvGyVD0XC+m7HRaQWYNGMswT1B6hN/kfig0mgDXXPeld4FX
	 DEjjaJY/iheRzsRN6sKDdYKmFBL4df5TkA2SnFjQIr5EoUkmgY30kkYYeEGckFDb+VFMo
	 7r+KHarnY39/5zNKh7dQSdcQ0JhSOh/UDhTHYQ1v2vP4QqMF3nb9D+K0NLLdj2UVr/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793953836;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=+w1H6bbiG/UywixopmBlh1ZReHUUDIlYbv5Zc1Gs4hQ=;
	b=haJWrNLPqX6U5QpXjPZiI8qxisZjWCVMU/R4THCJnxxiy3/jlrVIsf4buGgZeuvk0ZIe
	 wwhYowKalEWDoEOCqrHB11kDgivFc+37cvLfPMGVsEPu5GSdMqhG9g78TQyy/Ezn8ZSnf
	 azhtQo2XzpNvqVQ76fsfRGUxe8ZdSD9ZfO1FPVXzhfl5llJdNc8q0HEiiab+rc90ffWl5
	 j8runOCUeIXLpBU7Bn8C6SBETosykEg595G0S+gehM+wr5kNqs/HSAmbTBkJEL2xjOJvM
	 AbDd1wtVSQO5eoCIH7HrNOls+28nE9OQ+i+WyznKihVvihMr3LumTW/DCQWFdmnMSHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=pPS7RQZ9;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E81E606A33D
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 08:30:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E81E606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=pPS7RQZ9
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4918c2d727fso182918f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 00:30:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793953834; x=1794558634; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+w1H6bbiG/UywixopmBlh1ZReHUUDIlYbv5Zc1Gs4hQ=;
        b=pPS7RQZ9YBzITvDyMolV1tUP/Z6xqvmB37nu+uq5cSyvHODwwotp31XxR2mfuDWi8Y
         RcPxx4nAKwRpth29Tam+Pzc87rAJ0xLSV5klykO1tlWzDJhJLd7hG9bjoZHEXYC8cr1b
         y+dxjfqb3fDdlqtMO9mE30hFh/KW06qlRHGgurVNTASuEZeSukhQEwzzXOGiOaKSsDyM
         b5/bj6VW1bMYdOH1IcM2ytAOVm7EY/1HHXD23XeYwBBnp9kDXzvPHRjopnTpH88NaVXh
         1G3kF0BzUlNiY7XVgKh3KbPLWNtc4gCyXTEIDFO19wbzbv5fKzsqIjx2IbaqPYW1lz5X
         4SDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793953834; x=1794558634;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+w1H6bbiG/UywixopmBlh1ZReHUUDIlYbv5Zc1Gs4hQ=;
        b=CSFwKmtWQwTQYwW7Rd6O8nkWdx+2cYsGeaLteSr5rV27ntwlWbXadKgoXn8pU0ALU2
         S5Vf4oqKHtj6jF3Lx2FoXpIuBEd/xU6oWdqvg2p8L9ND03Jst4M6trz/8zLeBnskFGf4
         kNWfmrY9wcZRzstDX9DJ6fBJCXEO19asNgov56E2/BbhaitKbep/nTM2EgRF/5b0gd88
         XSs9TzHvygKRkcs3uo4f6C96EtdZHlgmbkoAhNJEZjUbH/vYrq72RqGk+7mUFqYO1bLg
         Dkwa4ng4SrbR+LjKE0VOeAXzII3S0smZKnJVEbfgg06UTQrtWWYBuaCKzj69zuNNZbff
         C9pQ==
X-Forwarded-Encrypted: i=1; AKwUvBx7I9kNWT5i9AJIIGHVudrptw43Avdb/5FJViQ0aHPzYhZFi+3Ux7Aabg8h+I+c4GgvFCVP5qMGRogR+7c=@vger.kernel.org
X-Gm-Message-State: APuU4Z8qc/M4H3mt2dWOWUyZ4wyqnuwg5bYdqwt4T1NuZKFXEjGaWhOZ
	pAcdmdv3sF1e+0djjFVklnouoMuZB0Uk+GnfprqrlAEajFSekJPTK+VW281tTyLyGhA=
X-Gm-Gg: AYBFou05D5Q3fup/KyngB2nLunxDgK5LVDaQG23WUSHE5EA/pZWHcRu/BMZOjzj2jln
	tbpKffnna6OiWYZkJOXsh8aNN/fd99AcXN9VuZBZlo0DhtV2fDwYMmdN5fn2yrDGMyBLzLVMO/v
	xhAPSV0M2pr85jk4IAlqslv3ZeeGh5tPjT2w5XX4r89YOu/QKfz/CJHMNHSiF88jYbxGrKkj5B5
	zuepHnxprM93jltemZ4nTGMIYBw+3xeKDEvSKoQGsTuslPRRHZF6ZWlvg1vIyczR6q9DwZ7KksQ
	74LcC4LBQgI8kvk6OoegVtYiITrHyeAfvjjUrdN5xmYsjHAjrCR59+2/uwoscCs/4+8Zg7s4Nsx
	DaxgTVvwb3cJrkw7kgSUCGHysYuROAauHtKdtR1xCRvhwn71JOdqWpK13FfjjycDG3krLZFERLy
	tcrXDwjGG42tunwSmtDzmgfZkgsV0QAOj/JYegvj8+RzijOSTB2J8SBWn9g7wQgnAqYVOng/QR0
	bljvxw2UdXzjMqpiDJ/B8Q7Z7IjYQflZnLO65juDNIgISSHVFW0YBuZzs0GB3/0BKsGGwVaAPly
	pJwKAmYy9wY5nG2c/PBSUvYOpk+6fda6nF919F2zOiGBUBF6NdZ9B6spXQO4BHpdlfyMbr5MLBS
	V6AFWtn9AnVwMCu8hBv8W5iu29rT2m/KqPXwYHq4nrO7KCQ==
X-Received: by 2002:a05:600c:34ca:b0:49e:7c8c:361d with SMTP id 5b1f17b1804b1-4b6deb5ff00mr24355375e9.22.1793953833711;
        Fri, 06 Nov 2026 00:30:33 -0800 (PST)
Received: from macbook.homenet.telecomitalia.it (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d8472969sm2366839f8f.58.2026.11.06.00.30.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 00:30:33 -0800 (PST)
From: Carlo Caione <ccaione@baylibre.com>
Date: Fri, 06 Nov 2026 09:30:24 +0100
Subject: [PATCH 1/7] dt-bindings: clock: Add Amlogic S7 SCMI clock IDs
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
Message-Id: <20261106-upstream-s7-clk-v1-1-7d501d62621f@baylibre.com>
References: <20261106-upstream-s7-clk-v1-0-7d501d62621f@baylibre.com>
In-Reply-To: <20261106-upstream-s7-clk-v1-0-7d501d62621f@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Carlo Caione <ccaione@baylibre.com>
Cc: Jian Hu <jian.hu@amlogic.com>, Chuan Liu <chuan.liu@amlogic.com>, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.16.0

The S7 firmware exposes clocks through SCMI, including sources needed
by the other clock controllers.

Define their identifiers so devicetree can reference these
firmware-provided clocks.

Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 include/dt-bindings/clock/amlogic,s7-scmi-clkc.h | 27 ++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/include/dt-bindings/clock/amlogic,s7-scmi-clkc.h b/include/dt-bindings/clock/amlogic,s7-scmi-clkc.h
new file mode 100644
index 000000000000..10d7caa5d1e2
--- /dev/null
+++ b/include/dt-bindings/clock/amlogic,s7-scmi-clkc.h
@@ -0,0 +1,27 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2026 BayLibre, SAS.
+ */
+
+#ifndef __AMLOGIC_S7_SCMI_CLKC_H
+#define __AMLOGIC_S7_SCMI_CLKC_H
+
+#define CLKID_DDR_PHY_OSC			0
+#define CLKID_USB1_PLL_OSC			1
+#define CLKID_TOP_PLL_OSC			2
+#define CLKID_HDMI_PLL_OSC			3
+#define CLKID_USB0_PHY_PLL_OSC			4
+#define CLKID_USB1_PHY_PLL_OSC			5
+#define CLKID_USB0_PLL_OSC			6
+#define CLKID_ETH_PLL_OSC			7
+#define CLKID_ADC_PLL_OSC			8
+#define CLKID_CPU_CLK				9
+#define CLKID_DSU_CLK				10
+#define CLKID_GP1_PLL				11
+#define CLKID_ACLKM				12
+#define CLKID_PWM_G				13
+#define CLKID_PWM_H				14
+#define CLKID_PWM_I				15
+#define CLKID_PWM_J				16
+
+#endif /* __AMLOGIC_S7_SCMI_CLKC_H */

-- 
2.56.0

