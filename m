Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793649212;
	b=yLBkf6/EmL8ZgEdbl5LtO2PhcEbJBs5rHQIie9c/uok3k7svw60Zna8/HHrw36utZvFS
	 dsa361vM1BFmYNS8Q5C/s3q2UWt119c4ZtmcTZiIzlLKfoBP62A90kkHDaXcCGW3O61OQ
	 W5eyA8wREE32q/cO8yL+lmbf25et9hAhzR/AJvggGSPHcQe6uKu6WasZuo2mGVZNJi52w
	 66BF2tpVtzpaxnd0KQySyg0Ct9MfP4p6cYaBWjvPZCR9mLweoEuae9/gX/EAZTGxKUjLo
	 aOZoq9m0NQ8PXRHnnfluDDLYw26PpqJou8+Pup4W0jwlVHnygzIOzwKVDCVqD4sbq5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793649212;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=7d0shAOVJ1K7372dJ2kGybXJI56xuJHqHu/gSqF4j54=;
	b=Nu5q4fx5R9mlRUsbmvR9f+VFCot54ArPU4DU3jpeW+i+YxduYWBp5slRKB2nAHRdOS2Q
	 KGk4qUjAO1waPZ4pCUzYmAsduyLcXi26uMfaw6j4UWCZ1lxhVKx/yElUd0Oi9HbvERQqJ
	 cQe05GGyCEm/Z26uORK4fPYGQWWpp36ixrekV8KL7knGWsiNnVNEbWU34lLV8NYGkPc7x
	 0yW28qmlfCjI/7Wa+SodYevZtGj9Q5qVggM93+HcjUsBsIV4blZj82Nmy1ZkH9pfFXkOK
	 50UW2yhsVPJa6jflRwvYZeQbdLCjqvwIXJKOyZcL15etnbQK2waN2DizOQTDas1yzlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=tm6dYXLV;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC2F2606A32E
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 19:53:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC2F2606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=tm6dYXLV
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a20a37703bso27057035e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 11:53:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793649210; x=1794254010; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7d0shAOVJ1K7372dJ2kGybXJI56xuJHqHu/gSqF4j54=;
        b=tm6dYXLVklLHH8myqEweMrC1yiCYroQQ5l03wfAaG02x7dzD+jtd/XZapAvC2BFtJ8
         oQKoFx3G19wa62a2RwsVi5jsWyr2Jax+qIMfK6L+04bPtIu0oKzFgd9KMOwp8ZRo3FE8
         i+Zul6/QX0RHTvIICVFfbfR/HfGUCOtvdob7QRvRHgeCpQIJRvAx5gUM575WHu0WnrGk
         3OoYDXH2pt1Nt8E7Cvw6kfiV/WJ2QYrVMzXg51b/M9F7HpYu1Hoi3mKwC80R/YJdsWaj
         wqaE8oznYOjf/ZdPiSdYcuuY7y2cRq/i6ZVG06to2hDjrENA3bGCDmWIv80/nLEZqlI8
         3jEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793649210; x=1794254010;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7d0shAOVJ1K7372dJ2kGybXJI56xuJHqHu/gSqF4j54=;
        b=zBq9X56dMxY9/0Cg7AO4ymprekPEbI1eSCz1oDuaMVfJf2B36iz4nIzB16tSWVNAul
         GSsh1ukh+WncdhzVuJ4DMsPmxzKu2TnwrxM8ujEif0Treo3pPhHZjR29ZfTAnEuSWI0E
         1lvaUOuVFdE2gfPAF2cnYbaNqaPJ9a0baZ7WA95rTsMZ5MFF8ymJ01LXzp7U0ENAH2M8
         8UZ2/zuLEvNoMskcDJxW0qu3BqY3P3Oq+ekTb2JhLxRQR7HrDek36bhuOYpIrAm38O98
         P0Evs+9jMmJLH/hUzk8FEXlSxoKihUvpTg7AfZHyl/i83MdiEPD9O893ixrzBaEk8gPQ
         xsLQ==
X-Forwarded-Encrypted: i=1; AKwUvBxOpBSshIEiER+SFVld4N4udN3oB9mpE1zA3UYRAa+SEueyAYun2bEmmpo7HjJ+30S/SLmELDc8x0TK8OU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIA0jqp+fRwR4AR9EEmUpZixEhtAPBfQa87FsjLevj+K5qlSKet
	8ZAtnca2c/oKVvVCZKWTU3m1z3vf39f8l44S16TCPyeJOeteWSI6xvpDhSEJ9dKQ7RM=
X-Gm-Gg: AYBFou2Wa7gJ8ITTFa9FaCKxksrBhwNlg+V2j4a2PWGp9Ib0WHMEBzpwGVBxo3bIoXT
	lLTJfZHgvbMuTH2STDJUVgjaConCeheUubXYf2uEPNQGkurCM0YRPV0byYrO7sju/aXR0y6ZhbY
	Yt+dvu+TFqE61U9E03ZHyNPYKyWKk2Wolzy7vEkkqs6k2IvaCFGEIGsX5wcjp5bHycWojkd6N/I
	DkdsHWyU04pFWXsgYhj4UTVwSsLdxrJRFExar35mR0w9XMpIwlmYsXM3/jzyMVqzsqRVxB25bNb
	df9vKG+8bYoF6NKifC9cszM4s1fpzd3oNZGh3StLYbZinEJ0ov/F5ke7BiyO5Ga9DjZ7vSVF4nS
	armeiEtYloAPsyU/ZMJK2R7odH7X+HolVhzIP2SVaaw1iOvmQnFJ7fvsMgPOfiw86SC92zbq0Pc
	1PB1vuc/i6KG/MB+Dq4HPU7AC5Xn2Y8t8W7RSKA7E51EGOJrgza+4j1dMBKpvk0iM3UAKLtKX5N
	wFVuxRDZaIYankael/2REnyUFvPxWL4wFFVKIWZobtYLUuGo/kkNVrzrZGxZWMiRIsFr6qjnHj4
	kdCeX0I6XQarkO5xrn0yti8+MgDkRIqb6smW+sg2fQ6CO+2ep8Rp2sB0xXWOzOY6M6KVMgRVOFh
	ywiaxM/d+BjxgsIIRwvSH3oCdbg==
X-Received: by 2002:a05:600c:1f94:b0:4a8:f2ad:a9e5 with SMTP id 5b1f17b1804b1-4ac1548f591mr254361025e9.3.1793649210359;
        Mon, 02 Nov 2026 11:53:30 -0800 (PST)
Received: from z13-ek5.local ([151.40.161.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3cesm24039784f8f.7.2026.11.02.11.53.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:53:30 -0800 (PST)
From: Ettore Chimenti <ettore.chimenti@linaro.org>
Date: Mon, 02 Nov 2026 20:52:47 +0100
Subject: [PATCH v3 1/9] ARM: dts: omap: dm816x: Add specific pinctrl config
 defines
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
Message-Id: <20261102-patch-ektor5-dm8168-dts-v3-1-9bd6d1d128f2@linaro.org>
References: <20261102-patch-ektor5-dm8168-dts-v3-0-9bd6d1d128f2@linaro.org>
In-Reply-To: <20261102-patch-ektor5-dm8168-dts-v3-0-9bd6d1d128f2@linaro.org>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Christopher Obbard <chris.obbard@oss.qualcomm.com>, 
 Andrew Goodbody <andrew.goodbody@linaro.org>, 
 Paul Walmsley <paul@pwsan.com>, Russell King <linux@armlinux.org.uk>, 
 Rouven Czerwinski <rouven.czerwinski@linaro.org>
Cc: linux-omap@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Ettore Chimenti <ettore.chimenti@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793649208; l=1087;
 i=ettore.chimenti@linaro.org; s=20261014; h=from:subject:message-id;
 bh=pNEg8PM8cIp8ox2y+p3fYgoghPcp69Vhurs3Xww0fMA=;
 b=7FEE9qKpkZS4TmJ0ng4j0OyfENMQ/VSbQvaLIHzr2DP8dPlCjEE33M8B+fZIJoj3KWBfvUBSq
 4UVr7SVq73QC7TRJsvkn9TnNlTt03EMZoDO3ZrKgov02XeVPMcF8afM
X-Developer-Key: i=ettore.chimenti@linaro.org; a=ed25519;
 pk=wCaUblFVaqhuBTQt/hAtysafsAaEsqj/yOD9SPlz6NM=

Add pinctrl config defines for TI DM816x SoC pinctrl configuration.
Using same definition as OMAP2/3 except pullup/down enable macros, which
are inverted for this SoC.

Reviewed-by: Andreas Kemnade <andreas@kemnade.info>
Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
---
 arch/arm/boot/dts/ti/omap/dm816x-pinctrl.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm/boot/dts/ti/omap/dm816x-pinctrl.h b/arch/arm/boot/dts/ti/omap/dm816x-pinctrl.h
new file mode 100644
index 000000000000..b93f971cbe95
--- /dev/null
+++ b/arch/arm/boot/dts/ti/omap/dm816x-pinctrl.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * This header provides constants specific to DM816X pinctrl defines.
+ */
+
+#ifndef _PINCTRL_DM816X_H
+#define _PINCTRL_DM816X_H
+
+#include <dt-bindings/pinctrl/omap.h>
+
+#undef PULL_UP
+#undef PULL_ENA
+
+/* DM816x mux bit defines */
+#define PULL_ENA		(0 << 3)
+#define PULL_DIS		(1 << 3)
+#define PULL_DN			(0 << 4)
+#define PULL_UP			(1 << 4)
+
+#endif

-- 
2.56.0

