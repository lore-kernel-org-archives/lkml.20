Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794060859;
	b=RA2SF775XRf3/+axwLjmh58E/6CyHLAgwbgdU4rmz35mBZQ1X1hEb7/hIE1rzSOR/SgK
	 w9qbfpozdBP6O0e5jFmOTLrWC2q/IU0AQmUH/nVsKuO2/Bz+VAak5cnjwPJYX8grXeJCe
	 nBwwu3SYR3slr4oV6u1QHa0YfqbJZ1jhgN72/bbibHE16YuPA2kh7QgEv5G1qr3OOstSk
	 8WgcCGvP2rQ0raejGR/UFLr0kollzRRtIyoCcRf2ATWLL0vBtL6IqIxVYsosygJs/bWkc
	 j3LBsZvEUeyXh/istmkJZReAEAmT04VXD09ciMXdF9B16t6bqlDnHwCZvnsVGEw9KbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794060859;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=J0t2KdflhR1USZ5uSPDHpmPQ6LbU6AJD684om9GpEew=;
	b=2n0bB9daEuoPteF6IjEuson9Eh1mWZPQSYFIpoXjCKikCidUQtO4AlKfovOlRNFfaXHN
	 5cZ+6u3ULWrljwhVERd2dO6c0DzAT0WwYSwwk3J7hM+kHEJyvIbZVInEMsx0TjdkM438x
	 g/Fmk1beaNuQs1KWV3EnTsrkY0U/9HEpE2UHgGsQVLRy/mBu2QLdCXazK4/WnsC16AimD
	 3DjXwEpbLA2wVJXvzIVdACuM6lDDxgEghSctbMlZmpbyJ1ze1Ze4A1ofFoFIwV8F3Msu0
	 8S6cyqYwVStZRQFPEVe3yRfmzZEKyeHtOZw69CF7HejzFvM0gMGWqwwETeoj5OpTffQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=MAWJYyL0;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC3E2606A330
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 14:14:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC3E2606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=MAWJYyL0
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so16934565e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 06:14:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1794060857; x=1794665657; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=J0t2KdflhR1USZ5uSPDHpmPQ6LbU6AJD684om9GpEew=;
        b=MAWJYyL0rpMUeh50MqLVtyVAh4JKfnKvk2lMaNL2hXmBXl2PGzhPKq8W654wuqAvDz
         /XqP4Jq0OedV/xAHm3U8YbNIc/WSxem2c3Aq1xT8LspWNvjrAz79bo/PddfOqfDf1/cc
         FUH0evqobXt/P2jy1R1Gv/lrPnFJOr/7eZRkM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794060857; x=1794665657;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J0t2KdflhR1USZ5uSPDHpmPQ6LbU6AJD684om9GpEew=;
        b=jXkCF1WTuU7hWqN5aYStjPCrLRj2y5/5FerXp2rGKx0V1dUU2YRv1E9WizGPU9nM/Y
         uxQ3c0m/j/h88yJNcrbVJkjyJrBXD/S/iM2hQxlqbNVi7eVR8Oes7l0rns0YgK1dX7Sz
         sjYIglEaEnv6eFqxQxmAHr5qAmN0ttvw4bvMlAYXAoaDBfxK/sewbwhZlkg0Ol62+LPl
         4MpkfgolQ81s5WOgdy80AJlmcMw6JUfjDVoIOBChF2GpvE59mvoUKZ1VsmqVpPeNiYq3
         4S1WF10DTlo46W2UBXmOlIBFwe6MVzD84wKcBypyGP0seuKjD1bfM7D6QLrAyJzdryUX
         QFGg==
X-Gm-Message-State: APuU4Z9BSl/3wHUXGXfn+k5GV71AaVXBW7qPtTkrkZUz6DpY9x508nfE
	Bl7wDoRKiE+vBGXmaoXr1Gye4dmpM6M5YozW69qHRFKGW0DKGugLmREefg97wgKn/gvGDDlGkfW
	NbN5M
X-Gm-Gg: AYBFou0Fi4hUk2BayLURP6pQ0Q7zTrBwoVchXtTtykLxoVEGduTyHyxQ4faV9VWItu/
	F3H4eCCh9H5YQbg5+L2uEcQkXmMn3OPe23zuxUecKLqF6ofZOW/zV4Y6igrKuAeYLcjplsWeHwu
	FNvW7Zo9urSzSa0GAHVfYnklzcN5xXlMdZL9SUj8Gq2lyD/LYBYbA+f7brOLgZC14cU6i32QqUc
	Eq0V2p26VY40e/2NYPzUR/qjmShPB/kUSvZ6vidOTts03Q/kYGSoekAJU13mnDs8/5rlxYVEAjg
	XSfhK8skQzpPPvq8zKHmEoQMDVYaGcMqu10Hsi3uZ+bH65FwBR6lCsIC9iXd1g/xd/+eTZ3t/lH
	ehkV91pT1KNk/T2d9xuCjXq5FiW9zCgjsIFclPODxc6lVTqI1Y55gnsswLtDuoegs896PB02EsA
	MK+wpWpEV32hLDv/pNLW2orKIKrH2u1YJMh2FvoyNUMxNqkO/zPU6Lf5kvqIfsbuLlpPdh7fmgt
	XwCqpBRa4p4Y1rWBlz8fMU6TMHC9TDX7kleqlOTrpQGA2cqeTxVnkRzZ3Z68a8BWP6+7L/+DXqE
	RifMyTzUtTpK9GYWJtSM8IW3MlIclfaTBaBrcNszB8YZIIDjR2rrIadVHQYATKW5LMHqe8S7M67
	wCm/KVUc3Aza4YlGHx0+l2iJBPTFTd1OwKqdXpfczqQnY1CCUIkESp/+UbGdvYK4nZ7NxtR4ZMJ
	x+Tbj4ghaGaCuvhVyQzimH4D6sVw==
X-Received: by 2002:a05:6000:178d:b0:48e:5550:c64c with SMTP id ffacd0b85a97d-492753739f8mr11843574f8f.14.1794060856956;
        Sat, 07 Nov 2026 06:14:16 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d809df21sm9757531f8f.54.2026.11.07.06.14.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 06:14:15 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	michael@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH] arm64: dts: st: add boot phase tags for Engicam MicroGEA-STM32MP257D-RMM
Date: Sat,  7 Nov 2026 15:13:48 +0100
Message-ID: <20261107141353.2228391-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
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

Add the bootph-all tag to the nodes used by the bootloader during the
early stages of bootup.

This includes the console UART with its pins and the display controller,
used for the splash screen.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

 .../dts/st/stm32mp257d-engicam-microgea-rmm.dts | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm.dts b/arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm.dts
index 96b7cb6b5bc1..4495b168fdaf 100644
--- a/arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm.dts
+++ b/arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm.dts
@@ -163,6 +163,10 @@ sgtl5000_rx_endpoint: endpoint@1 {
 	};
 };
 
+&ltdc {
+	bootph-all;
+};
+
 &m_can1 {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&m_can1_pins_a>;
@@ -269,7 +273,20 @@ &usart2 {
 	pinctrl-0 = <&usart2_pins_a>;
 	pinctrl-1 = <&usart2_idle_pins_a>;
 	pinctrl-2 = <&usart2_sleep_pins_a>;
+	bootph-all;
 	/delete-property/ dmas;
 	/delete-property/ dma-names;
 	status = "okay";
 };
+
+&usart2_pins_a {
+	bootph-all;
+
+	pins1 {
+		bootph-all;
+	};
+
+	pins2 {
+		bootph-all;
+	};
+};
---
base-commit: d48723711bae9b8cdc56719c448ba42fef28cbee
branch: stm32mp257d-rmm-bootph

-- 
2.43.0

