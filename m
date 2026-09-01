Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C55AA43B6D4
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 15:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788276819; cv=none; b=FeXFMLjIb7ewRuursytQdC7yFBBDGH0/PGXiBvNZ2QtpzlXru9Y6d/apuygjV545i5ZTue6Vwc9xLK/84478lvEU2BdNMyakdCGTYQveecClWnya1k4J1y1lyR6FNSmE+w9xUx66Zq1ILsXmX6LWFbZqMwfmeoucUVjK29aJSBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788276819; c=relaxed/simple;
	bh=7ScGxa+8+RlYUQcbDyTy3K6G/E2mZ7i4yB4b0QAxXtI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Tag1UW5g+TrIzmCwawtniFX2KAh+V1xJEwIzNLr0B1YXgbLVKruRrCNKu/lv3xPSaBZy0dbj8M1z1+uZu0D7wjEjYH2IP3R0CuaDhV3x2HxsiDe8gvJFpPyLzsHd2PqmO7U/z8zGuvpCuxj7IJvv4A54z0tK6xJMi0nuC6ovLLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=kg6BH0lW; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="kg6BH0lW"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48441a2ba1bso30260f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 08:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1788276816; x=1788881616; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BlRBTnAxAr5Mr3h2Ki5AWmuYRNMm8WhwP7R0oNWZa10=;
        b=kg6BH0lWqwKW5wyB3bDFhVoWEZ6lz5i6rkxXySknCzE3HYpDfFSkhATWIyn25exoW+
         9IEwvR7K6o9jAQniKcDRafs4Zhpr4fvWxBGp6uDEscNVfjsveFRG+j7IcQ7cUYqbKK+1
         fStXNjWUOjFIkOqsdLlMLe2Yqkw6UD7+lkbQI3ieSlspoHppHe2mA/mfy1l3jozNH1k5
         8hMpvbkeAzdOVmTAS0Sp6K4fhwPvf/f80cnc+zTAdMChCa8RIZ1YNuu7RrMUqu6QQ3rW
         FgZda3Kg+54niQ7vN1/bUK/u6gRb6/NvMY+XSQzQ3xYNGCkTR0whA4IYPygF2WCxgYDw
         SZhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788276816; x=1788881616;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BlRBTnAxAr5Mr3h2Ki5AWmuYRNMm8WhwP7R0oNWZa10=;
        b=R5jblR7CabVQjWKmIiRisLC+cEqZENsHrNsmrKCKO4NFRXUFmSaOry+AXQYMAqMI1j
         8Z9UesEsAfXKaHimg004MgdXwQZ7y/B+JuX7schvMUTujlBY+2yev64577Brqa14J1kC
         4iXgEoDLC2pEMBnqn1zs0JUCoTUc7oRoMJ+jeQYrLPQNg8hWAlTSWsHRuXTRtUppGCd7
         anEgFsdwp8kRAe7YFG7TSTcCKWv5L8IDx0aouqvO6Mk3pZ31Nksf9vRxEjRf/zICxCy3
         u8OSYWiAgOp/DVgIIdzOXWM5TNOZVzDol59+/6CqrkmUW09/pQmdoy5DN1WhYuNrifBn
         6qfA==
X-Forwarded-Encrypted: i=1; AHgh+Rp2iKjt2cSHhAKADEUraJRZk65cKKlr2KWb1T9P46lXtSJtQK90FZmlQm+ZM4qPSvz/la4XJps9J2hVRYc=@vger.kernel.org
X-Gm-Message-State: AFuF++nb9fxHuKJl29E/k8X5mg6ujGYCDYrejdsBPQj2/w73z+BMUTE9
	ceb1B2vasBBu+tFbj/18b+i7xi7MzQsNmsQwTsUyCltfhy/fnmLWd3bV3XKVUmrcd2c=
X-Gm-Gg: AR+sD12FFUlJpjNseqP9i44sdZrChdjNIHctBcwOo4UnoR7I0zKuIkTbM6Cnn04uWqA
	uDULu01+RpR2K+XXnNcr5UsYpsc9x20yb8TQ2jyhgPdY2pcHD+Ntim8mt9UQpLMibWCGYx1vqVh
	FG8pv/C6R4c8WwLsDBb0P4gRxk6A+0YkryXEjDJWGRQsmuiyd5o+Of3xwV7SR5LRteTIXjHgOfu
	o715cq3h036FolFNcQHZYLer5xkREy7Dx7ut2cKqQwIXINpUf8bK6xnrVgQ+fBGsfa8bPt6uAFJ
	5kP9e4dQuhcKhc+fdjzwLZjZPyMmfKrBFo4DJADMg6+D4H1eBKJ43WMlg1h0z/Noo7imJsmYqtj
	zQ3LiF4L1iBT8ONh9ku7rNnHlQzaxA9zwNBw3QFhu0tDWb2NiQpzE9iVaYaheq3RrTDIiNU+43P
	exVRIoGiata0sI87S8dFOwV07jOGMyRGX5iifazSsgbjCk1UKnLyY0PeFLpcMK0BclVz2wJm2h1
	6JQTJobazObYdhQWRiZjYzxoewD9KrfNb5lAa9t
X-Received: by 2002:a05:600c:5288:b0:499:84fe:5f3e with SMTP id 5b1f17b1804b1-49b91c41014mr616951295e9.9.1788276815737;
        Tue, 01 Sep 2026 08:33:35 -0700 (PDT)
Received: from alchark-surface.localdomain (bba-2-51-220-108.alshamil.net.ae. [2.51.220.108])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b91c5790csm314541845e9.0.2026.09.01.08.33.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 08:33:33 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Tue, 01 Sep 2026 19:33:14 +0400
Subject: [PATCH 4/4] arm64: dts: rockchip: Derive GMAC MAC addresses from
 OTP on RK3576
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-rk3576-otp-cpuid-mac-v1-4-ea9135270fc2@flipper.net>
References: <20260901-rk3576-otp-cpuid-mac-v1-0-ea9135270fc2@flipper.net>
In-Reply-To: <20260901-rk3576-otp-cpuid-mac-v1-0-ea9135270fc2@flipper.net>
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Michael Walle <michael@walle.cc>, Miquel Raynal <miquel.raynal@bootlin.com>, 
 Finley Xiao <finley.xiao@rock-chips.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2071; i=alchark@flipper.net;
 h=from:subject:message-id; bh=7ScGxa+8+RlYUQcbDyTy3K6G/E2mZ7i4yB4b0QAxXtI=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWRN+2Bn0+oxU6P3qU/7I7eGFXnGf49KT7dMO7uyUF1W6
 rxyqMHyjoksDGJcDJZiiixzvy2xnWrEN2uXh8dXmDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 0EjHWMeIgYtTAKa6W5zhn97ro1tSdDtDJG4wGubZej43tPqwU1bkr0wH95UzN2IYrzEyPHz0dy2
 bQNfGDaf/3zEQnXryvurGjW8ropd8La2Y5dtUwAkA
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

Rockchip SoCs derive stable MAC addresses from the CPU ID in OTP memory,
which a bootloader would normally process and patch the live device tree
based on it. This depends on the particular bootloader implementation
though, and the derivation itself is not described in the device tree.

Add explicit nvmem layout for the CPU ID derived MAC addresses on RK3576,
so that any OS can implement the same derivation without depending on the
bootloader used.

Boards which store a MAC address of their own can override the reference
with a cell of their choosing.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 arch/arm64/boot/dts/rockchip/rk3576.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
index b0c0d3c8b1b1..0012b45ef426 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
@@ -1845,6 +1845,8 @@ gmac0: ethernet@2a220000 {
 			interrupts = <GIC_SPI 293 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 298 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "macirq", "eth_wake_irq";
+			nvmem-cells = <&otp_mac_address 0>;
+			nvmem-cell-names = "mac-address";
 			power-domains = <&power RK3576_PD_SDGMAC>;
 			resets = <&cru SRST_A_GMAC0>;
 			reset-names = "stmmaceth";
@@ -1893,6 +1895,8 @@ gmac1: ethernet@2a230000 {
 			interrupts = <GIC_SPI 301 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 306 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "macirq", "eth_wake_irq";
+			nvmem-cells = <&otp_mac_address 1>;
+			nvmem-cell-names = "mac-address";
 			power-domains = <&power RK3576_PD_SDGMAC>;
 			resets = <&cru SRST_A_GMAC1>;
 			reset-names = "stmmaceth";
@@ -2131,6 +2135,14 @@ soc_tsadc_trim: soc-tsadc-trim@64 {
 				reg = <0x64 0x2>;
 				bits = <0 10>;
 			};
+
+			nvmem-layout {
+				compatible = "rockchip,rk3576-otp-cpuid";
+
+				otp_mac_address: mac-address {
+					#nvmem-cell-cells = <1>;
+				};
+			};
 		};
 
 		sai0: sai@2a600000 {

-- 
2.54.0

