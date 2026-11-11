Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794377449;
	b=3s9qL2Q+i1qklVibq7Adifweb68aSA8M0PxSOxIpvGE2CG+pi+RUq/qnbBJTkeT+4Ins
	 S2A+5LpJsKTH3dLKU6qenuZX1M0cN4bWkY96Pm38Y4DZk4+dpTOjO7I1pO3YZoAxTtE9v
	 VxuC/sho7WdrIVN5WkOL1lRJ04NrzsuLTBOtFZPzhYnW1jxrj/vFkeCke7yjNcRZa4EzR
	 SUT9EdmXQxASAOzNJo+IK1T9yTQAOgl3oqdNiZzUapush0FVkYRglYhtfez3gf17DacAu
	 ec986by14GdJPqdPLO0BOzf2v8mHNvxSqCxz1z5kToRwUXcc3HUDMBw3SOtgJiLvhCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794377449;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=zOej3OSGWxWCJ3XeVUCQdSFsxuuEIjtPwatxLCH1n94=;
	b=SdMdhVHEC5aLJKwscTX4uC9mnti8sUOY6y/vw99kDsQV/2PgJv3rUQkTr5WAxFUnkkao
	 sUfB1qZEafZYsQV4zw2DQYnB7yXhEF2eGAxz6YYzKArxiWiRjW3ivOK4umo88nwGN3Rbj
	 KqTC+RLbM69gIvZBsUBlcY5BKOGjY33Few4QjQF+0n5MTyeO1dI5m9ZrIfHUDM7SLu/wk
	 tBUC/GALvXVxQmHD3ZVQSBsJ66pcvRwym5ovmH2c2qUTB/FJ0HcHj+VHWEyvwydYpY8PH
	 xjNSBlTBMn10xlzeVNz7cTdiNWNlKlYjKfU/H2Yx0PJvxylgVnhM+vfuz6bRQ/KDyEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="qo4coEr/";
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D552B606A327
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 06:10:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D552B606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qo4coEr/
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3b15e46698aso1367131a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 22:10:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794377448; x=1794982248; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zOej3OSGWxWCJ3XeVUCQdSFsxuuEIjtPwatxLCH1n94=;
        b=qo4coEr/vEoEXydNRIWgKyfV/wRA37lgCP3ILAeuz8bydCwAWdykUU62x3znrusKed
         CXgNXiChBSnHZ1/+Z1DzPfv3wMwMCgGwskw24ec4D9Csll518g96Odl5MeT5/bzqsW1D
         bfu5llvPHoNNPoLE9VhXGQsVsKAncBCgQhWGzLUSRQYN17gEyhzmNpW+6U3a2k/Z8deq
         xBrgMJh7JEGBtHAiZNt50HajrONBsRe1g6D68iZq5JBparjR6i4LBJn/SJ9HAbuBOyzo
         0WKlJsp7nqHhpleNvthhZrFVDLdxrC5SixgCT5DlJ/Y0C1dteq4ccT/A9QTLDJQG6OhK
         Bdkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794377448; x=1794982248;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zOej3OSGWxWCJ3XeVUCQdSFsxuuEIjtPwatxLCH1n94=;
        b=YBYu5/47uuTjBjpBswA9oNtdQidDXwz+X9ValaN6M+oguMg7e8Fp4/LokAb5d7Y2p7
         QD96ekaIID6p2PCyLbMmnrhZznjh40uay38rzjszlijcq65NkQlheYZoub42VrU8c3y1
         j+PKpPWd0rhKI5nUM0dmshiII9vebJGNWtiohlLCsoIuTvQ/CW7a8tm+XMPkV+nBcUl7
         I8OJxyXWe6RGAWOMEYBjBL02UTD/Gt22SRRrJTg1t7ucb2vs+MB0/ZAD9eollJZa/GF1
         c4eqMSHUclzvJy6COIanD/rGPftIdMH9hh1onjYZpb0QSx+vj8486FQgFTKFsQbkJnYt
         A3Mg==
X-Forwarded-Encrypted: i=1; AL+hErHVe+CoSNbS/mQCoiE1Zm/R/SI+5PiyS4I/9EhfOOgoo+GrTgvRQj93c3dj6jvfJY51++X18PHJQ4/4YGs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9VKMk+swqWdVuzOPCTuFJQsxoWri9CCH35FMcvEuWWyLfGll52
	5izuS9s7ksBSO389qPKyj/q9dmDwl81SUgXbMj5AbOBciH3uQ46O77IH5J+x+w==
X-Gm-Gg: AYBFou0A6becaPnVzYUTyN4RLNg6X3hnqds/UJ4R3noowuMK4Ydq1k8ynFOtNXEiDsl
	xxMfbKJq1c+XiZ0xufy4Fm4/gBLYoipu6RPv8lZbSuX0kWxPnsyUQCILKMPczO7H1bUBwSwrQAj
	NDk5dajVs63L3ZtOcQpRvT4t6Jg/oQfK6PjcZovKsxqftCAEDD7G0BErs3odBkUpiRcXNVIdm0k
	EFlgCQpeulLKYAauv4t2C1OgENyR2W/kKV+GzoSte9oeIWfK1DZgKTBNitTWsPKS70gNpdxMijp
	E6e8nvuHGSb5m48HWEm+eSzYQIBFNFkkdjdmIYmhIaDC/Ni6s8tShfaALEa8pk8ebiTT/z5+XZA
	qkb/QmJUcM784ogqnS7DcYnQGUrs66Kg4Z1QCXLMvjF8V8lj97poi5qzrp36XdQ6+yIefsB8B8p
	2NxqMaUhshf60CaSNH/O5eWkW9XHl7SvDASs2MTUuz7WG8ybW0EoJn77ZXPN+ydqq9KKhSdTXxO
	uU0pb6cVmxF45VkwccZlZlgOYAS6kEtaGJr8kmk5ZcLTSJszYW2bQAE6emJKuGbLFOCJMRRQy6U
	eYh3V/L9RupbEvtnMJPgU9HGgq6bQ/epyxa5+h0JrsWWqhqzQM8H4559qucl4e6rSIYH
X-Received: by 2002:a17:90b:1f87:b0:3ac:8897:7b9f with SMTP id 98e67ed59e1d1-3b182f0d1e4mr1310292a91.43.1794377448229;
        Tue, 10 Nov 2026 22:10:48 -0800 (PST)
Received: from [127.0.1.1] (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b17db7e8b1sm2978557a91.12.2026.11.10.22.10.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 22:10:47 -0800 (PST)
From: Kyle Hsieh <kylehsieh1995@gmail.com>
Date: Wed, 11 Nov 2026 14:14:43 +0800
Subject: [PATCH v2 2/5] ARM: dts: aspeed: ventura2: Add ADS1015 ADC
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
Message-Id: <20261111-ventura2-dts-update-v2-2-bce5b5dafc1f@gmail.com>
References: <20261111-ventura2-dts-update-v2-0-bce5b5dafc1f@gmail.com>
In-Reply-To: <20261111-ventura2-dts-update-v2-0-bce5b5dafc1f@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Ryan Chen <ryan_chen@aspeedtech.com>, 
 Billy Tsai <billy_tsai@aspeedtech.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Kyle Hsieh <kylehsieh1995@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=907;
 i=kylehsieh1995@gmail.com; h=from:subject:message-id;
 bh=xPQqV3YI1Vbg3zoEBrsSwuLJ278Wah93Qbu60OSxVxs=;
 b=owEBbQGS/pANAwAKAaWDQrcJVsSBAcsmYgBq9Af1GDj92rCYara8OWnsCKcFq76imAFe5qamq
 9/KCtbUobSJATMEAAEKAB0WIQTJHsaNZOdY+THGqJelg0K3CVbEgQUCavQH9QAKCRClg0K3CVbE
 gVo7B/0ZynYot9Je1040D/lbTGvzkWrbY4vtT8cQRJTXAHiAE6QNwPWG2ALgj+BrhuQRGEc0xVb
 6kw1vL3VB7rbF6TWstqa0zhqev/6glQe4IzGMqn5+HHEHAcVy3SrLRFt8V5YSHpu4ONibR/N3mZ
 U+n44kXd6Djn08M+YX/uIYdFa7gGUZhxd7xVVU5+qa7CxxQnqxPS4NcEvTL93/z0qgVuY0ZjCmq
 0/p93zt3zAiWvPAfAcG0XYdYqraRVFFb0f/XvEBtrRWihLAUR8Vz9tiK8tSrkKEcWx2kFO4aNHj
 LorR0ty1dA80hB0TVYarsdspFdZ7wYGtqSUpIMPimhCkZXUu
X-Developer-Key: i=kylehsieh1995@gmail.com; a=openpgp;
 fpr=C91EC68D64E758F931C6A897A58342B70956C481

Ventura2 has a TI ADS1015 4-channel 12-bit ADC at address 0x48 on I2C
bus 10.

Describe the ADC so it is instantiated by the ti-ads1015 driver.

Signed-off-by: Kyle Hsieh <kylehsieh1995@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts
index 50e652cc37a1..21c40dd4bb84 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts
@@ -2405,6 +2405,13 @@ power-monitor@44 {
 		shunt-resistor-micro-ohms = <500>;
 	};
 
+	adc@48 {
+		compatible = "ti,ads1015";
+		reg = <0x48>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+	};
+
 	gpio@64 {
 		compatible = "nxp,pca9555";
 		reg = <0x64>;

-- 
2.34.1

