Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793203587;
	b=nSJCnwroo1KMlbvas8HZSTlU1Aejqc00lyE4EWjXpdyavlPdAQWHz3OuwPqklMU0QOpq
	 MITYF0x7RbgUL4GkFh2htTSdGxXOFn0UyIIS41gv0hrb4mW29ONM4md/npknZLWl42dqN
	 q+/C8Aan9/8qGOdtPwocntq5N+sGzacwbhxbVAaFGbqKfv7VClBD67kwv7/Pg3oQ0NHDC
	 CeCl/c/Tq/RSW9W+Tl6a/xXx6qD5u48dRh7su3d41+f/9u/2gTflUhAcYwuE8w4e9OcCF
	 +b578n4uX1JooTlS7I9Bhl1XqWw8BJecmVTniY6JjO/EWnRksjdc+LTJj0ptd59sXeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793203587;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=3uI0MFbTtASjLF9hlBwhObgSemLAwBt6XCum0+3gyyM=;
	b=mWWSqyXamnjBDzcq505hQosRKR58mHHuOUtM9bqBvoTX0Og2YJMH8l9KOHiujCi1Izvt
	 TQ+1nr0UlnDMUageftu5mGbh8InwgcaDqeFN+cXMBmrIQFcigjA7kIuqAuO7HuOkesBwS
	 j9y/6wwNfJX3PkJtaJEqO8S0E6zMoq/aCEqWrzjebIXZPD2EToa6BbQDc/nVmknq9XuuZ
	 VseuWdUG7Fvs2JRHdnADGpzOst8TYuohmAFTyTJkqHqJ3UhIBfntmKCfk/ym0OtwrI0dG
	 35+Nj5WV/LReKxZdk0F6RLVCVuwelOmSwp6csEW1Fl/sqPeJToG05NT2GDYbW/4QN+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=tPvehUgC;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D66CF606AA61
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 16:06:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D66CF606AA61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=tPvehUgC
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a208d93758so12207475e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793203585; x=1793808385; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3uI0MFbTtASjLF9hlBwhObgSemLAwBt6XCum0+3gyyM=;
        b=tPvehUgC8iL6Bd9LkWwcRwzfEX8rc7sVMVUk8QFwp2gY4FNrJnoTueh2ceLQfpRH7y
         QoUfBWJh871NMwSy00RcdWY1Wa6P+dB/72P2hXY6bhPXbXBJgWe70vFfiIb0SgH2m2IB
         2kngo1rYQ4ULc+GmwhydYxO77x1Pq8xjCiAgPoxrWymWA7rfPziMYJ1BgRT9kk9a2f1D
         8W8+lRl9KTe2jUZGNUHH/CJ0j4cGSXChMxdiauei/crTabpSqOonVcuPrEFfoLBT5t5y
         WCTSZoGW1LPYezj22PqsptV4ADYnKDu9lMg097wYNBYxCx6qYdhFoyOa+HqLvEl+6/41
         lvcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793203585; x=1793808385;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3uI0MFbTtASjLF9hlBwhObgSemLAwBt6XCum0+3gyyM=;
        b=JCduQollUKoX/xCeb0IPpE+Mwse4jd+BIpQ4v/mcp/Yz06Gdp5ooe2NezazLjPwusQ
         Dcb0UZN+tTHH7oIS7yKbZ86rRwrh+I8KqXNWtWFLPSnVk9lKFeVz2HKlOi7HLYuG8aPH
         FmIBL6jShcr0HntGO8apcntK1me+siXkuUySWZvwURSfIkAW3TYqb61Beo3KZvmncSgO
         0zHsRXPtPYqlonwkYqldEK3Uc/KGry78/mpvtaROckZChP4GS4nlpt2I+lWn/dh6ecyM
         NRa3Ae0tIvGQYj6mDYdghYucJ9WSiuHGjoWYnriHbz1rKhFw2aiI7srn3ece+BkSVh/o
         Ychw==
X-Forwarded-Encrypted: i=1; AKwUvBx92ZLKQ7s0BLtVXrfE/e9gZAg3uU9lYWc2N4Zhn+7YfHN9YOjopVAHgBqODcnU4ZflaR9WLakIEnZd3To=@vger.kernel.org
X-Gm-Message-State: AFq9FYKvv5u7Vzz3p11O7Z5uY+Jk+4J4UnuZ9vUpOjsK7E/sEaY+po4u
	khEGGgWiP7TomgtxB89x+Va0hip7ZL64KVa1drGBMJnDHnrWQtlUMXswSWKIHGi9Zo8=
X-Gm-Gg: AYBFou2nQdx83+/Nqt+OP7aNbM4+oPLfShFLr+01ivQTQtH75/hUfln3Juc6yLFD7pD
	BbBELgkMWuCZz8aTuEU0v5ev9cGGWPL0RbJYNbzk93VAP+6epZa++A0nt7Osw8ZYIr6e4rJ/xNH
	Su/wQW/bCdzq6qZYOpCSdZlPhDPSfsuPUTHKltRlk6T00hys/REdyDdrpB0UrGq110eTqOxeBoL
	Yym4ORGsLTXrlBXBR1oFnM5BVJcfCzZRYTGeP2cf0VLew4hUG4FWt1LiVHsPxEDnwo9XCD5TpMt
	BFCCY4wvNLvikN8oM/TbA5ZZMelVq6qFY05Oj3SqTW8poGoz+No4ctjBtCjoEgfKkkE3lvEo3At
	NImC5zi2jQqDJ9owNdiTacOl17Jse7eRwQm0vmVWarIggtQnbfXodDSNzUlEBbVFdQNkRp1Zoju
	MK/Cc76NshvNWcL5yWsqfvSo1ocvAKjrxXOtRh2PMKOFoYin6LgSpKxuMzGrsEIRwE96dPOaSZu
	69SdJE54wb49/B7oOOchfIKiIDBJDzrJEfu7Ksqn5AXzZf5/Qze+wMjaDJsXV+YkHT3OfuRcrCT
	ja6cTLHkAhm6Ayqf6WJCmXFohXNFErcWo8/uA3WI7ZyU8RVBZtIEiwuvHO9j17N6A8a/P4NJiHy
	NkisD22nH3ANwsNUAXmkrNVHmN7Zrv1ENOTRHWY/52Bx6taCN
X-Received: by 2002:a05:600c:4e42:b0:4a0:27eb:49b with SMTP id 5b1f17b1804b1-4a9678c276dmr60643465e9.30.1793203585194;
        Wed, 28 Oct 2026 09:06:25 -0700 (PDT)
Received: from z13-ek5.local ([151.40.161.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa81a896ecsm1625875e9.9.2026.10.28.09.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 09:06:24 -0700 (PDT)
From: Ettore Chimenti <ettore.chimenti@linaro.org>
Date: Wed, 28 Oct 2026 17:06:02 +0100
Subject: [PATCH v2 1/9] ARM: dts: omap: dm816x: Add specific pinctrl config
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
Message-Id: <20261028-patch-ektor5-dm8168-dts-v2-1-4544429251e2@linaro.org>
References: <20261028-patch-ektor5-dm8168-dts-v2-0-4544429251e2@linaro.org>
In-Reply-To: <20261028-patch-ektor5-dm8168-dts-v2-0-4544429251e2@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793203582; l=1034;
 i=ettore.chimenti@linaro.org; s=20261014; h=from:subject:message-id;
 bh=hmVSe81lrJ4EvLkYlczyhL6zv7IwzxLZV9wv/8nR9Ag=;
 b=LTKHuS4ke5N8E/7u8UBcMaws7grXO2Ccr8ynEVKSNxQOMV5oIM2lSk9PHFNQu6TahHNKaLFkw
 0Gq9UnU3vJnA2IHmEV5Itg5FF1w42ztMv/0Oa5jHnoCCzbkIUYNsqWA
X-Developer-Key: i=ettore.chimenti@linaro.org; a=ed25519;
 pk=wCaUblFVaqhuBTQt/hAtysafsAaEsqj/yOD9SPlz6NM=

Add pinctrl config defines for TI DM816x SoC pinctrl configuration.
Using same definition as OMAP2/3 except pullup/down enable macros, which
are inverted for this SoC.

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

