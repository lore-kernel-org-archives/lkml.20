Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792678183;
	b=B2nq2pVQqy6unaBwnEJwyvGdYi9Qkg6HheNOwB+1JivenG/0J7aFrHO+n+thgOaXasex
	 cordsI2vjW6KttPh4XhVQPpItXJ9hJXSE2y4u76lLS7Es4Srj/fPKdYoRFUSnsHvLVJ+X
	 HoIazFFJCg3Gk/oG7tjtGpIjC5NWMZzGBF4ykAqjNDG0uRGn1mvAZjE4W4MhjDeJ8+K5x
	 brc4dL5uKheZnxqdqIhzRAsahHnB5uwkdyADNtHcjZpyJ5zhwUg5YAnQjtkOJobo8YHRw
	 d96xcMeZ4dN750CjtudI26ajGJMrn0+G2WdEd05aFNt3+qNBK0zo0JTetZRbyDx2gkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792678183;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=vXc4CAj//Yvh/R5TXeL7axIFzwlES1+gsFXpkClPxwY=;
	b=JXKi8/RNR7UgENA6M9q+Q96q+o4rCJRQbgqBx4op1qYTZhcYJSN7Ybp3pwnTcAvZBcWZ
	 nf4g5Uaj5zvXktoF1jiFR3xkLBqJKb9os1RvpYV0S+z9onmYVEtkKgINK8wVDYRBysmEm
	 MqepwX09Vd3ss97lN4J/eucBnII0Gt0qUeve8U+TnmE+PINklxtByre6jca1XgDczblfX
	 TBVoJZqFUmztqRKFq3G1Jdw0SmftaNoIu62Bj12wKpKLBxy8XoM+3D9hnEPo6CEqpeEsy
	 cYtABRdMjMozL2SMQ9GXFwRhC8qYp38e/u2wZWs6n00CMlLqL4vFre1P1P0GutCKW5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ap8eKDCw;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E15060A2611
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 14:09:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E15060A2611
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ap8eKDCw
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so4723065e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 07:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792678181; x=1793282981; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vXc4CAj//Yvh/R5TXeL7axIFzwlES1+gsFXpkClPxwY=;
        b=ap8eKDCwU4nZPTGpvVf827HSfvCK7MI9h+uMzadRRVgoK8rWRJajijtlT1ESIUGKvF
         EdkLAbQPKI6OZHnFujZM4Z99yGlD8wKOBN0myvhhzXdSsNhRRRI0uUv4aEp4a+gkc87Q
         W/ZdiRENF4pqFMPMrA8EZnruxwhLyw0+nXSuvlCK2/KP3UoytY3DRlZ1cpPzcVk3Ol1s
         gqw4yuim40lyaa1+fMHALDdjexyf0AuNSugG1EIu47rPqzZwxZP9ezJx58auP22LDaL1
         YkDP0Tu/rwYClioywk13cJuoSJdBfJHB28OCzFXrrt7d5e6se3wD8cIuRoOFHVWyslhX
         Sc/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792678181; x=1793282981;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vXc4CAj//Yvh/R5TXeL7axIFzwlES1+gsFXpkClPxwY=;
        b=EhqpWvmIDfm/QOb5UsBVewmgz+46EcAUFiuX69fLvd7uIWHnDKCcTP1CTBRVXGtBd1
         gj41pfPNjeBvlh4lCPpjfgcfYDwexoP0QIvnDgsKgcfb3iYEfbedu0EQkP6fvH5CUv0P
         T7kHg1Emcxw8+7bAf92paaezqbI0EyU2YgTh7AM4dQq8iRxLr+Yn5RvNN1f2UTedl2Uu
         ISp8v926YPfIMUNRzd+H0HzG7L5elPfS63FNic4iNM18DKsD+Osu3mNfjpdUHOQpZpTl
         IGHw0+fqxxhlx8033Yxfn279RmNeRqFAhKWR6thlgXkFY9mmspy2qs85u8ywqY9HQHMm
         kp4Q==
X-Forwarded-Encrypted: i=1; AKwUvBzELljtF++yFwNO9QkHZEEq77+wgQjSpHEv7K77jLxRWFPnZy2aJpp+jDPb+gKFJgrNbg8fS2J3rBS7Drc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJN591XchWpJ2WooGdGuKdQymMwbQYO9VcWkylkWBVNNbC5omZz
	Brvcz8U9fsu0EExXq67sizNaZC7LjjDaJ9kKYK+atiVipgjLLzXyLjA8
X-Gm-Gg: AYBFou0ompp4zHBy0urUiapWeLAAG1OfmX1imcs73er2+7ZTVkAQnNqHWgPkDJFIq3a
	JHUCC1Wt1ghNeAdBPwnYqwYaorBEkZp0GiWo94gDVbM9N63W1F5aH7Jog8HeeUatv/avjQbTank
	m3KDeLP4WAU5WFWhMdOEeim92xKQ1Q88uEAzR7wDdtSoCVhwqBGjY6WBS0ALIA2+KrDYNW0Spmv
	7KbcXBhLQPCjNREFfTefxL2zk2tYtJExMabFRzOcTHrBAuVCM0njV8iF2Bvnh+vzyVIywJbYi+S
	RdUvlgm4+bhTjmXnfg2I88nkpf1lcYZlas9wltdMikjwpjxawhI4t+h7+KsrIuxXRKO2hSQc0DY
	wjdzwB11BJvKKkMQi/Rbtywz+TER4IvevZ5Vq+D6xeLbsyAhrwv00KYEtzqZFETe7iSGhXcqB8D
	lS0Xrd/wiS48IkI9TwAJAeYEmJn6sVFlnwe3bFOe85hkzri3joj73YHHFvLzFEkQxGQCOcvkkna
	VpRao4X+2Z1S71GdrZTDJhb/g3BFiJVfu3kGrUbkVI6fUHOX73A2HodysLWYQOJXhef4NIdnolL
	cz8pe/nUHqaBpp1Oa7H38Vi6b0HNu95iswGgFqihw4IbF1c+S+EPTXJuJaULGMLAswHZe7sxxBd
	0
X-Received: by 2002:a05:600c:1c19:b0:4a1:efba:511 with SMTP id 5b1f17b1804b1-4a1fdd74b84mr137319755e9.35.1792678181416;
        Thu, 22 Oct 2026 07:09:41 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2584e760sm12368150f8f.59.2026.10.22.07.09.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 07:09:40 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Thu, 22 Oct 2026 16:09:34 +0200
Subject: [PATCH v2 2/5] arm64: dts: freescale: imx8mp-verdin: Add Cortex-M7
 UART_4 overlay
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
Message-Id: <20261022-v1-imx95-overlays-v2-2-c769d6eb54fd@toradex.com>
References: <20261022-v1-imx95-overlays-v2-0-c769d6eb54fd@toradex.com>
In-Reply-To: <20261022-v1-imx95-overlays-v2-0-c769d6eb54fd@toradex.com>
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Verdin UART_4 can be assigned to Cortex-M7 firmware. Label it uart_mcu
so the shared imx-tdx-uart-mcu overlay can reserve it, and combine the
overlay with the Verdin iMX8M Plus Development Board device tree to
provide a ready-to-use DTB for the non-WiFi SoM variant. UART_4 carries
Bluetooth on WiFi SoMs.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile           | 3 +++
 arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index a40bcbe4876d..5ee9fa583515 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -732,6 +732,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw74xx.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw75xx-2x.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw82xx-2x.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dahlia.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dev-uart4-mcu.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-ivy.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-mallow.dtb
@@ -744,6 +745,8 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-mallow.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-zinnia.dtb
 
+imx8mp-verdin-nonwifi-dev-uart4-mcu-dtbs := imx8mp-verdin-nonwifi-dev.dtb imx-tdx-uart-mcu.dtbo
+
 imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0-dtbs += imx8mp-evk.dtb imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0.dtbo
 imx8mp-evk-lvds0-imx-lvds-hdmi-dtbs += imx8mp-evk.dtb imx8mp-evk-lvds0-imx-lvds-hdmi.dtbo
 imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0-dtbs += imx8mp-evk.dtb imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
index 9fee2cf9ef54..7c9b21a041c5 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
@@ -857,7 +857,7 @@ &uart3 {
 };
 
 /* Verdin UART_4, used for Bluetooth on Wi-Fi/Bluetooth SKUs */
-&uart4 {
+uart_mcu: &uart4 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart4>;
 };

-- 
2.43.0

