Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794423872;
	b=qyrTg3zE3GIhv+0uud28FsHC6q2pb3rTEw1uR66Ay9d5Xs7knkU0ya2dHUjzZQkqhVR1
	 LE3vzO/dQ0kk+e7mhUncFOfG64NhsxVfqzJ7UGhjyI0HBucsj6Njgf+Z8236JpLzXUhsq
	 IGfoLqCos/NTEvx7YdNbAmQUh3SYiptZLtcHDZavllz81SWB22Yqwhw4o4Ccqqy+if3wP
	 hd1yL9ou2EpMvBY9M9Pyvq7fgckbvWyLZjZ929TCQueIAoG17EOWQyWY+eGZYNtWxaJAz
	 RQbARzkN3CCKgKIhBXlR9iciVO9kV4lLeJ5kemZmbJTVdasH84xvYf341N1X65+o1VA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794423872;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=fkBYOithnFO0IRX31SXjaTHWPBNV9b7p8e5gc+6w+Pw=;
	b=OpTS4LSUlz1P1sey3WDXS/+CYaeAehnNZWcqLq+U8V1fWxXsVWwg2Zl/9g/9gsmFyVfu
	 sVLMLZp96hEktG1wZgNRhcWXO8CiUVoEBeDTW2uQ1k3zAxXaKOu8RJ9qJxwr56llqOtpN
	 8xUjpP/sBNH8gEpqo8i7dkfvVoGRRxZhVA4kOey+59dUrKq099U5l1vDvjh1IWZGj0VfV
	 9uvKXajnQqFn+Wlx0DkcTNvxxhgtjVmy6piffdhZseEnHW3UxiRDoZdR4U69fPSV3k8ry
	 liepfI9U8yJq+PtN9/irrata663xI5sLKgFqaSwmqBNSFx3lVlBHD9K5RddE8qFGmVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZsdRlPD2;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D10BF606A326
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 19:04:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D10BF606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZsdRlPD2
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3b10ca4e3f9so1987110a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:04:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794423871; x=1795028671; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fkBYOithnFO0IRX31SXjaTHWPBNV9b7p8e5gc+6w+Pw=;
        b=ZsdRlPD2wHpMA71aOB4Q6aMSz4wd6LpTnHOfIzOYHv3SVEGqCRMmYjV79OCkRQLFLL
         MEXYVZUK5x7A5pURGWdeez7uh2N0PPfaR8uDUonnLBJY44pgWl5EVOeBNbUnAPA5isjo
         C1HBbdyDfN98oMCnrFU11ej5/oSmzuClro8l1NJU2+arAOV2+W15jytRuVyYaVIkv5Ny
         d/uLCBj2t9wRUfs0ejS3c/S6TLSmoGqOrS2JoLfq3tVG/WQ+/UlEWrP5cnh7gc33VTmZ
         LuoEO3/eMW0BYa+WMM3YuSoy3rXdRuQQSYGlvH70uHHZyFzuJBjhqjszFe4AfFH+6wxJ
         TIxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794423871; x=1795028671;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fkBYOithnFO0IRX31SXjaTHWPBNV9b7p8e5gc+6w+Pw=;
        b=TBSvDA8xPJGpzV4u6kIXeFYh+WYoEEzMPmNbDtD4xclNtw19rh/1u9SF+0U4pHzepG
         7gDXDZ7b0YHeJCvW32wpSawoLRF8v4jzV37bwKoXgw9DaD5j7da0Jw6Q7otpSPDMUfYn
         IYMlayc4VmUDb9SJ9yLlepXMFe3CYJzIuh28DElNgeWcahFgET+csBkWx4GXHgj/JHkl
         z3+ykGENzmjdQ6mYgodY6xEsLMXeBgjyW5/inBj1vmw2SudR124v6hllha9vluWqsQzS
         pyCpqIPpG+XRk7DGPOqa/y4KCIX92MtpT3OLIlptVIjISG3sSGwJsrajIrc0CQ7UA3vx
         kpAg==
X-Forwarded-Encrypted: i=1; AL+hErGIO+xnRbCeTNRE+yq3CxwT6/4imJ4KLr5Jh2JgJlK3k+cFKnToaYh2QY4D8g3OzLt0vQjdDzkWGMWAew0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/yq78X/6aPYETX9aCFxDGNVYmWBodoevwFdqo0jI15+qEJ7ZiY
	fMFMSd8YHlT3Vjt9qHF2EFUE267dxLJZPO0YDT8KDRbqJ6oMu4iwghfw
X-Gm-Gg: AYBFou0H/1R8hEZw5/oObIkk42O1oDUD8puvHysfSmEjQ0XSjFrlK4cWOzm6E0zyKUd
	krFfPc6hpOdSBBz5AEru6kN7W3c8vlvvbcbTL5Ev67NVX8UJWYofnn590LRSuIL66rPhdeh57Pz
	sXP7rF4Y2f3Y7Y3mkCygX4wDBPu/ll5Lap3MEyCIu7nEX/9Y3UT/2N59qzj8P9uMqLYvCjyGr/S
	X+aXaJfNT8TmmLnSlMS3i9V31ZWtH3Wrk70QZPN/cj212Dk0s8qskrvUYzfvxusw8HBU64Tfpme
	uXpv4O48I2JM2DrWGAAOftW9BdTLZ/UsVMUbyaFqwBGkLGLe3uMQKVPye5mlNOZfS9GurGZyecu
	eyU0uEgjXzuEoV5D8dvJ8DP07AIZgIIWZ1kDsq5cG/7KxYRq6WskKP4airp4WhDMFRJFrlQmj1o
	9L/Ao3o4Y7kh+xLaVLoQOShL7sDoLfpwN2XhxLWAcnBdWIvJwmscO6gVHdtqe34mycl2tNgrkn4
	QNb9m+N+1aASSsB89WOSiq8vJRiPT15ZKTznCr0aAv9Xr+bBNlkSz9P2dOwXaueHXL6HdTioIMB
	Wk4WQusDD2vgW8yzm1zHjH43qJNvaQaskjeeWgwtkmc3ZEhvJCT9HEw=
X-Received: by 2002:a17:90b:3a0e:b0:3b1:4018:bfdd with SMTP id 98e67ed59e1d1-3b182e107dcmr3006901a91.7.1794423870904;
        Wed, 11 Nov 2026 11:04:30 -0800 (PST)
Received: from [127.0.1.1] ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b181f8fd59sm2727366a91.1.2026.11.11.11.04.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 11:04:30 -0800 (PST)
From: Leonardo Costa <leoreis.costa@gmail.com>
Date: Wed, 11 Nov 2026 16:03:58 -0300
Subject: [PATCH v2 2/7] ARM: dts: imx6q-apalis-ixora: Add 3.3V_SW power
 regulator
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
Message-Id: <20261111-b4-v2-apalis-imx6-overlays-v2-2-8129b21634c7@toradex.com>
References: <20261111-b4-v2-apalis-imx6-overlays-v2-0-8129b21634c7@toradex.com>
In-Reply-To: <20261111-b4-v2-apalis-imx6-overlays-v2-0-8129b21634c7@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-bsp@toradex.com, Leonardo Costa <leonardo.costa@toradex.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794423849; l=1776;
 i=leonardo.costa@toradex.com; s=20261001; h=from:subject:message-id;
 bh=G0D3AUMCZAfAB+oBMBn/hQwsHUHoV16Fn9kK3ypcWVo=;
 b=nVAd3ioHTSP14EpXIOGgXQEKXYdlaDj7tVEwROvBxWF3/+gClQ12Rlidq7vEtLB+ule4J4Vk0
 3bR2zBAFxnoCkRzAHzkq5qgKAg20KQVSPt5/X9Lvj3yCeW7DLsd4Jni
X-Developer-Key: i=leonardo.costa@toradex.com; a=ed25519;
 pk=4xvoVLDt+NxIz9D8BJHhT0fD43Ig6XgSDw4jRN/gHzk=

From: Leonardo Costa <leonardo.costa@toradex.com>

The Ixora carrier board has a switched 3.3V power lane that is used for
powering peripherals. Add the correspondent power regulator node to the
Ixora carrier board device trees, similarly to the already existing
reg_3v3_sw node in imx6q-apalis-eval.dtsi, so that it can be referenced
by peripherals that require a specified power supply.

Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora-v1.2.dts | 7 +++++++
 arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora.dts      | 7 +++++++
 2 files changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora-v1.2.dts b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora-v1.2.dts
index 6ef2a986ca8cd..73e3b99486d0e 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora-v1.2.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora-v1.2.dts
@@ -57,6 +57,13 @@ led5-red {
 		};
 	};
 
+	reg_3v3_sw: regulator-3v3-sw {
+		compatible = "regulator-fixed";
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		regulator-name = "3.3V_SW";
+	};
+
 	reg_3v3_vmmc: regulator-3v3-vmmc {
 		compatible = "regulator-fixed";
 		enable-active-high;
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora.dts b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora.dts
index 6b5393accc092..6fb57935cdf1f 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora.dts
@@ -55,6 +55,13 @@ led5-red {
 			label = "LED_5_RED";
 		};
 	};
+
+	reg_3v3_sw: regulator-3v3-sw {
+		compatible = "regulator-fixed";
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		regulator-name = "3.3V_SW";
+	};
 };
 
 &can1 {

-- 
2.43.0

