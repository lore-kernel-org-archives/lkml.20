Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794231395;
	b=qZ5p8E4X1x0Tca9nBDx1HYz/QuILqNhDNgSq7LrLhlclHFpslrJ+KK/BJhN6WbZkS2cH
	 PUAVXT6gjczTCAK41GdjR8yex6pM0J4s9qjAjPNSF+WPdJbVTw/he7Tk5cs0ND8kxpdI7
	 T3fYDWp/SDBYe1czJj2YiJgWMlOblQw9Wevj449qouVPka0w9qPCMbyY5gDlpAMiKZrLq
	 +0Iw3c1GQ+OcY4F/ENEuZYZrN1gHlJYHW91UHtUM6WpwyIgvbb2BfCP2vPrctILDZLSQ0
	 m0n44rFL7/jelWfWYcZKKEBjF7OeG9nZ+OO5Bln+FriDUfLOZiHY2M9jf26GqD7MCfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794231395;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=LKWAw/AZxDTQtn5ObFqcUuzM3ObhugKfW3Vkn+etxwQ=;
	b=lWTflY5RJ0cH7oVrCeYoTpdiFkLybhLHKwTgg4joXyLgwoAtzwBZjP6g0lIe8VGzQ8/0
	 Q4c5N9I5N8x3VFN1e0kqBKZIAT5/IMAOn2ry1y8widdauCod9xubA75a6hp6ccMWHIoNU
	 4e0WLGuRkszeC/vtJnkPOp++YU6GQHhFlzHIHXPEW7qcU8ut1KV2KufdIwzkzNBbj+Imt
	 xmeGUEttJddodPAx5YBRp8B4XHcaLSPSyXAGDmnhFo1utJAJlb02HASIar0gvuHRrRosm
	 KPlIJwSojDFrtJ0HvKvTd5JCXIoYwZujxhfHcxsiqSs8o133Q+JBFmx7Gmoz8uWlTIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sartura.hr;
	spf=pass smtp.mailfrom=sartura.hr;
	dkim=pass header.d=sartura.hr header.i=@sartura.hr header.a=rsa-sha256 header.s=sartura header.b=InJTp9wv;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9BBB608362E
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 13:36:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9BBB608362E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.a=rsa-sha256 header.s=sartura header.b=InJTp9wv
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso6556385e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 05:36:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1794231393; x=1794836193; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LKWAw/AZxDTQtn5ObFqcUuzM3ObhugKfW3Vkn+etxwQ=;
        b=InJTp9wvTygr8V9hYoTr/NhW8KHKk5RlASOuXlrQJRy8N0Bk+kk2ajjODwLpYWwgxh
         TYQuPErpVPfO+JdrqsH6xMDh0cejwZYWD8OD0nSvifgwVbS2gJX2Wxube9ViIY9pKva+
         fR4YSqHXpP2lQOG35vONoJZU4huNzw791xdfVVhq9DLvYzXZZno070PbN3hAdhSzk9c7
         ge/FngigunniTaKQkFaxrj7KU0N03BlIryAAfyRMAXSufAyF8kc4tP8R9GZdTORuuYq2
         ygBtGyg4XdKB7qXCwiX88LIF+0/8MAGFVx0tV2jZ83g3CAiaUUlj6Y4JDJQkTTdkkty7
         swzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794231393; x=1794836193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LKWAw/AZxDTQtn5ObFqcUuzM3ObhugKfW3Vkn+etxwQ=;
        b=nHq3jvVMIK/QIqxegf6OQb74zzdZYJ19NWI19E9DbZjfJbYiEjRQ6mTBKXf4KlgcH7
         M+p98wqmL4ZX9LHQxy6hVM3w/DE/nN+J1LSMRiLelKaoxMbBb5cn2eX4WGwsCxfplsKq
         ECP1wS1+QamBHbXppf5THfV3Xsty06N8QbxFrEiecr2N2o276RkkyJXQbNxNR0czi0Sg
         zx1EL8ptq9x4pHsfGSAATks3Fs0IIdxvrlM56PAtTakaJbHlJfZw07DcKO8dZOq9mOzx
         I3gNec0/wwvHD/cR1deIGYTQmPKbu1oC6oj80ovDBokbtZLR06ZM+T0DstdNWWb+sMqZ
         uwqA==
X-Forwarded-Encrypted: i=1; AL+hErFE5bEV3JPylHUTcVIRM2Y5jixiP3Fr8muZMkQVpurw6EcV0Jlyo1OXgc007S9Vf8SmSLeSqRamHlRdVtA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+8k8+hSCeT7wNAhW0qf98taYs+hweOGSm/eVqn/boF2ewVJLW4
	RQNc4w4cSK4+MySCQI47m6qrafLAS00ZUS5TTMewOcBtKqVh/4zy7MjhBzko4Q4E37w=
X-Gm-Gg: AYBFou2WX+XJbhMGYi+vYdEic9w7bxjCfM+q5Fg0NvJFeRQkNUJNdldlylf/FSslFjk
	Ubmv0WOYmPgySSeGb6+DSU64n2OwZ9ppU99t3OPjbdTuEE+9iadSGvstYyTs8tYC5eXubh0Oweo
	yIdxMDFiJ+hcLKYFHNTE+4f25h4QRZ+Kd+xOzv4uFXIC94WlghhCogo+jxAsx1M42FvSPy4Q9ay
	zEFpH4wCEhxj0dxfVx44TOOgeQm2s9HfuALiPAfRUGPUbcfwzvxiU5CR7zJ1psOLAHOhtvPQ71B
	6U7DbuHcolXEmsNbWjXu9chqZTxmiqZXacXIAJPPUjyQjGqfYeJB+tt+i3pJTOo+TcVxx0TBr3i
	XmbDHdAnSQr1wi4lSzCC+3cjG3hI8YwPBJcg19J+m396JUQKqIIL8PCqygPu+fdZi0EJkUrOam8
	ri8uhw+4tIH/eOOyMu/YMt7Uj2YEVeUWZtgRlT5P7Ozxt/nFEWIxg8EId8PiBxTAwqBZ+DU20dw
	TQrOdbNt0jpbU++gQMKOH0I4QATbhIKjsTc/XPNPr5Ty6wC8t7Wy5cH41/LZwNuUHE0dkKOLbSA
	behkKCql4ybbySI0b/uqTfcIjgi2fgYNHV/b9oST8JhAmh63dxGaIICWRTv8KQRQxDldoS2vYEF
	qjGRDGuVJyrhnwBetjU4hChp4lHpXvZCV3Q8wGq78qQV+8Mos5M/X+KricrUT3KVk31DFy9hKlL
	yZ5kY=
X-Received: by 2002:a05:600c:3f1a:b0:4a4:de70:2ad4 with SMTP id 5b1f17b1804b1-4b963c6e08amr75104175e9.22.1794231393335;
        Mon, 09 Nov 2026 05:36:33 -0800 (PST)
Received: from threadripper-fedora-workstation (cpe-109-60-83-229.zg3.cable.xnet.hr. [109.60.83.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7efb1b64esm245418915e9.13.2026.11.09.05.36.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 05:36:32 -0800 (PST)
From: Robert Marko <robert.marko@sartura.hr>
To: linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	Steen.Hegelund@microchip.com,
	daniel.machon@microchip.com,
	UNGLinuxDriver@microchip.com,
	nicolas.ferre@microchip.com,
	claudiu.beznea@tuxon.dev,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v2 6/6] arm64: dts: microchip: lan969x: add fan controller
Date: Mon,  9 Nov 2026 14:35:10 +0100
Message-ID: <20261109133609.810876-6-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109133609.810876-1-robert.marko@sartura.hr>
References: <20261109133609.810876-1-robert.marko@sartura.hr>
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

LAN969x provides a PWM fan output and tachometer input in a register
block separate from the temperature sensor. Describe it as its own
fan-controller node and keep the temperature sensor compatible.

Connect the EV23X71A fan to the controller and route its pins. Use a
25 kHz normal-polarity PWM for the board low-side FET. Set cooling
levels so the fan starts at full speed.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
Changes in v2:
- Split the fan controller from the temperature node.
- Add the EV23X71A fan child with board-specific PWM and cooling levels.

 arch/arm64/boot/dts/microchip/lan9691.dtsi         | 7 +++++++
 arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dts | 8 +++++++-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/microchip/lan9691.dtsi b/arch/arm64/boot/dts/microchip/lan9691.dtsi
index 52c22dd1a15d5..039c2014aa341 100644
--- a/arch/arm64/boot/dts/microchip/lan9691.dtsi
+++ b/arch/arm64/boot/dts/microchip/lan9691.dtsi
@@ -522,6 +522,13 @@ sgpio_out: gpio@1 {
 			};
 		};
 
+		fanctrl: fan-controller@e2010348 {
+			compatible = "microchip,lan9691-fan";
+			reg = <0xe2010348 0xc>;
+			clocks = <&fx100_clk>;
+			#pwm-cells = <2>;
+		};
+
 		tmon: hwmon@e2020100 {
 			compatible = "microchip,lan9691-temp", "microchip,sparx5-temp";
 			reg = <0xe2020100 0xc>;
diff --git a/arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dts b/arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dts
index abb21a8bace9e..3cbe5beebce1d 100644
--- a/arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dts
+++ b/arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dts
@@ -775,9 +775,15 @@ port29: port@29 {
 	};
 };
 
-&tmon {
+&fanctrl {
 	pinctrl-0 = <&fan_pins>;
 	pinctrl-names = "default";
+
+	fan {
+		pwms = <&fanctrl 40000 0>;
+		cooling-levels = <0 128 192 255>;
+		#cooling-cells = <2>;
+	};
 };
 
 &usart0 {
-- 
2.56.0

