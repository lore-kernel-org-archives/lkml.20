Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794895578;
	b=ivysZOuXVWkp9WabLz5J5SK7kVFYBP2geuKtGfit7IBHDY1ajJbAut9W4VmKAQiOacW1
	 HwbT51m1TNiFuef2X6jQa5n6ylV66c+3aAGhK1d6lzEIAl7hOmUd4Nq39r8NESS4YvUQu
	 iHhl6WMgErR5FLINkR6vCAjKXzwtYbKTBNN9Gyt6l/UKVyYvEwcTGdf3O/93/H3yXe1GK
	 lqnCOSdpajUIkKVJnHs1EmbtsVMtfvv3UzalpaRMYyS2OSA2Hu6G0K+ElFDgRvHQ3quMz
	 F8DK65wmqUw3bTpCFt+3RSl2kCZp8SWIiZbW02hcj1ah/sYuUZzHzo02iW7FG7yEy8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794895578;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=L5HQEogAdp/4jA7w2UsfMfPzuR6qmlgb42NC9n7phLY=;
	b=JS77MQY6qpljqLusDEsvB31yfB1qs6prDEPVUljtNV2VgdfBhiUC3R1LVhdEmoXgQyfP
	 Mu5cp+BBuH3I/6rMShuqOZ6BiEe8Vo87bUDJESZjtegqnQ7y3fdGjC7Eu2nAhDALGhp0H
	 6KfYmqUSTvu9v+oCSfr2lCcwqg+ui5JbQFkoB58qthEYHGh3k/gfzGtWNQQsxp7Xzy0y9
	 9FoBospqUJ+x+M4eGDvzY9NMvOGoohdXQS3mEhhYVEC4Wa0+MQw0dEbNHhnETx2xcqswb
	 WAZPxNjnmvRi2ABnC67f3re12NPPwWhyEvkfzCrhlevOCX//acAAh+XrCKG7kiBuH/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kdZQ7pNY;
	arc=none smtp.remote-ip=209.85.210.173
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C60606A331
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:06:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2C60606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kdZQ7pNY
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8b29b83fdf1so2311210b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 22:06:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794895577; x=1795500377; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L5HQEogAdp/4jA7w2UsfMfPzuR6qmlgb42NC9n7phLY=;
        b=kdZQ7pNYSU5yK2H9f3vmy46m99eGyCqQ0pzIxGYPEmGV8jzOQKEZ6R9an9qcxffvgg
         F43Cp4UfXZky2tLTxvXxqY93CQpvOK1T8N+COEoE/zcYwmD/yM9eO7N4qcyYtC4odqCZ
         aXBMQ6RS6FIpRMeRLJSR6C3uazGJRsunnB15mGasUnRb+sCDY+Pa483c/GfbTCaodfvo
         uFuyY5XiLw24QckdxpUz8itjhcbR+GBXbL5mGW7sato7PmAdcIamYYxqKwcItiqTHevY
         o4a9Dfil5ndxuih4YEwO/Hnwm3TQfy5BSijWBJOihtUFSTb79/wVVSB9Uj+naiBZRfI+
         bLCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794895577; x=1795500377;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=L5HQEogAdp/4jA7w2UsfMfPzuR6qmlgb42NC9n7phLY=;
        b=g/iyOxgfRBgzy6/Qb3pks+KXpjtHAg5JhenFYNFstRZhCCwcTGuVtO83WGWA4MBniz
         2CfD3nlTfBk01FNR4RMxOJgp/nn6sVfz54OpG6smED+YrGZfzlIABgDE2XIQvvGfsk5s
         o1dfL+oTfLdUQRU/5fQMYsLvFujpnE+S44mJbNQ4yjUoWPpngX9C1Vjuj1aFosyeX3rf
         CvcNqGYGgX6h0PE5a0QMWyWxh2UdHVBtRSY4/aBdSchsQETpd/FZp4UEyrXuVZWeJB1l
         6UNgiep6E+pZ/VH7dDIuHSeGXfwVum73s0bE/Im3jSHV/Hm1JubaInQ0Rg7UUBuK6900
         T/rA==
X-Forwarded-Encrypted: i=1; AL+hErFNewXQui9y5A8gW7OC+c8U8QTM0pvUkP45rfLq6jLGXRd8poUP618A1Z2DzHEAvG3Z+9tzqAExX1KO7bU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9jks3DWOWCvcqRF1zHcYD1hpwp4SiPpbEmPPmydaYWQbJPBlDH
	TJBnlgIT31zZxz37XXlpndytyTO3HxYh7IPrhDxddSP+xTJxbUVfp8HZ
X-Gm-Gg: AYBFou2VcXiJ6IVQxO1+2wnvi44UCgJB8NkUJyhRHpLe1CSRRwtOcB0DRJbStB5j5Dx
	XIhn0zlCC3bD0u0yPYaOAx0RF7KRaL+Te+K399QlgllW3cd+T7W8UuRK2E2Dnyjlsw8ee7Kv68B
	GwR5E6M8N2oQA4io7I7xYV2kT+H+WPh9JKq5f5rzE8+0iEl6GOmipq6f2NARGTU6xx8iuryaI1k
	8ytPUUyOVXUKdiVDqdkNLRJfLg5ISE9KNyKaA7mzToxfJ3ydZc9lzLbF6VzvURdb61cKIg4bDNM
	56afi5W2zUX7RrX1K8/dm9XQPjExEJlV12clp3zdc5p3SrB0NH40ruSKvh/l9namsdkbs1pTtZF
	aLbHEJ8mqL1b1oWiH5lV4EUdRDTq/rZoOqVKq6OIWikqkR+Tdp66up70KMeklOY7DOht96DSX/1
	gJLrhLUlsKwM7x1cI3ZwHelVT3vAhGlkaKZUFG7MlcWhAlMK9dExXaHKFzQ1mfyf4w3vwMKsYHI
	RyMe/d8wCUqY0wsnH0wbgysZfUlspf5TrHwkKwQxhQeYGe4XOZB7xlsBt8czXfL0pPgpLj4xMUE
	u90+QlLAZLq9wLnluSne2B8205dZADbX2IUkl6FRbTzpg1fzHpDKUXcWOpgkfNRaDMQBJ0u5bDp
	RuuBKWNOZsxQ=
X-Received: by 2002:a05:6a20:6a0f:b0:3e2:95fb:8d03 with SMTP id adf61e73a8af0-3f7a7fc6dcdmr10376493637.69.1794895576986;
        Mon, 16 Nov 2026 22:06:16 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed12a8172sm4464623b3a.13.2026.11.16.22.06.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 22:06:16 -0800 (PST)
From: Zi-Yu Chen <zychennvt@gmail.com>
To: rafael@kernel.org,
	daniel.lezcano@kernel.org
Cc: ychuang3@nuvoton.com,
	schung@nuvoton.com,
	p.zabel@pengutronix.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	rui.zhang@intel.com,
	lukasz.luba@arm.com,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zi-Yu Chen <zychennvt@gmail.com>
Subject: [PATCH 4/4] arm64: dts: nuvoton: ma35d1: Add thermal zone
Date: Tue, 17 Nov 2026 14:05:01 +0800
Message-Id: <20261117060501.2611071-5-zychennvt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261117060501.2611071-1-zychennvt@gmail.com>
References: <20261117060501.2611071-1-zychennvt@gmail.com>
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

Describe the SYS block as the thermal sensor provider and add a thermal
zone with a critical trip point for the SoC.

Signed-off-by: Zi-Yu Chen <zychennvt@gmail.com>
---
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
index 7228ad4735b5..986f3cc4176b 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
@@ -63,6 +63,21 @@ gic: interrupt-controller@50801000 {
 			      IRQ_TYPE_LEVEL_HIGH)>;
 	};
 
+	thermal-zones {
+		soc-thermal {
+			polling-delay = <1000>;
+			thermal-sensors = <&sys>;
+
+			trips {
+				soc_crit: soc-crit {
+					temperature = <125000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+		};
+	};
+
 	timer {
 		compatible = "arm,armv8-timer";
 		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) |
@@ -86,6 +101,7 @@ sys: system-management@40460000 {
 			compatible = "nuvoton,ma35d1-reset", "syscon";
 			reg = <0x0 0x40460000 0x0 0x200>;
 			#reset-cells = <1>;
+			#thermal-sensor-cells = <0>;
 		};
 
 		clk: clock-controller@40460200 {
-- 
2.34.1

