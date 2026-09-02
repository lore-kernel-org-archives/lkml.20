Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B1D449CF55
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 13:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788354503; cv=none; b=gCCs1RH+jaA370Rx5i5fOCTxrJhbR0afshoJ/iCBVeu+saqZ7NLGSOzc7hQD8+BVrwuwhVeqV280ic2boo6R/IRFRlqIMbcohDh7UjAf31vT1ZUPPCkGhMe7gN0zYrRuh7lBybHIcnQmGAr3E9WGGwrEecWkIpA1hZvpO/BwocI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788354503; c=relaxed/simple;
	bh=92HKX+rJXSdlXE5EQ1Vyyu1clzsl9p8JunUiEHK0e+k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=im9WUYXDSx317iGJs/89p8BfT57unSiF3mAjkyV9dgCEnpix8WAmmUU8keA0MQFIcKp/hDfhgFvnZxyOWbz9ucE28ZHQsMjX87jQxeeVxFjsMkR9pgwhWB/jwaiaDxReB+x5IT+9Ustz/Efa5Qd8iXgA1Cg89pLvFjQGPT0yV/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=n6g7xOvl; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="n6g7xOvl"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4843e397f74so1203262f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 06:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1788354500; x=1788959300; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+GqdLb9S+dkzyo/uMEE+zALrMBgJbCVE5U0lvdKhWKM=;
        b=n6g7xOvl9ih0ghdVOYT1XhmnG0QylbUU0JLRsVw1nbXqAt0f0ahh5xgW/WlGqf2cie
         oQekWrhOjl/qT3S53K1UsVwVAgKOp3e8u2hVDh3C9EICI0dnqtW3yvn0YoTZv+uHNvn0
         IjDs+7XYGBN6+0Ae7exZ13j8gTBm7yu1EQEaj2vkFrpIygRbeaG9pmYz+bFCRWi4V45I
         xyT5SIOKDfEOYI0BMbtzy43NmDstTLnkm4StjFOnvuLbkSMeaeVP0EmHBv4DOumdaHFs
         qJWkD1bbtLzGJ6WsQMIKGPkqGHj2aULs5iDnzz0ST5fIoyv1538Njzol8Wjz4fT3QHoY
         KZ0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788354500; x=1788959300;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+GqdLb9S+dkzyo/uMEE+zALrMBgJbCVE5U0lvdKhWKM=;
        b=RSSSSJO2CgjLhSXpfAYl7imgXWX8NqTMTLxWIoXNTEK53sEZwbPjH4v3Eofp3KDzcK
         8iGKcHlp3DYPUDDPNcJ2QsBiNpIqc6n5B11o+Pmou5hLq7sIuzDv2sLzHeODda88w0r3
         G8TkFAqNnU9zN54mSTpv+TjInrKOpf7Gj1l6HZu6mflkUwxhgKMcEla1RlAqHmrnlxxA
         e9cGi3DL0sysmE2yUDNvh4+1Qtt6V8iZqtvuA2ifSt/qKT8pw5qGXzZWPiOoH0jTVUmZ
         zRUpe7juKfmhw9KExZMTJqUN4ntQBd/piKp3Ff6Wzty13NIchvBko7tIJ6wwS0+D5dgg
         slAw==
X-Forwarded-Encrypted: i=1; AKwUvBydahWuzyonYMGvZ71vzfTb+aEody67vl/HCjbuolIQmWI1yJBUme8JJ3FCFduM2tnMb3i+tmKeLA5I8J8=@vger.kernel.org
X-Gm-Message-State: AFuF++n5V6tcHGMQSKsETYYwWlCA6KKysqh6IB6YlawfFGKSiWVg1Y6T
	sMj6Quqdku1IWDQAuvJrpRaYlxGZJxrVh8Fc718G2dZBKaWgd2tmq0Ge6P/nYO3T6TI=
X-Gm-Gg: AYBFou3NdaPZqKHB3lklskFJKxMJ9DnN6FZNeZfR+ogegRzVebnesW5uXTpuJTTjsms
	LTlIoKp4nyxKViZOthEqCYU1NF3yfnGU0xCp3bHVdCk8uo4nv+5/RIW8AYW21+/0CJdTaUtKyZH
	yKhoyIoYy3Jpf+wZqgGTEKtQj7gL3wGhPz9JP8Zc1WJEmv1Ak4sDD2An1LwAMj8M4VhBeHVeXHE
	9fGHaQ6V8rlQ5xbXb+ymmOufiQdV4IvLQLPFsRA3FA+oNnYd4YMQZQtZ6OW7OIhX2Bih5NaNNWM
	OQyDyV4ULxoPXzFd5rdLfkt2Ah4g7rMjxjPD6NfUL155Z5GNbs72q1jwX3sCxjfod7bKBi/DgE4
	LtZwzE59z10P+/pfX11/1yOxRBcSr/nbcgST47WvQO7FiMGRSf9U9Iss1dzDb2+yBbVLF0LzDaQ
	GMaptuFs/whOByL7nRFU117jjWgXi3SqZRfucvTA5nn88C3ATJFRhSKJ4XKiXwBWjl7oDDgKTMA
	WVm22tGmN1LW6SYimJoZLlioPwFU7dXlilw3CfqVA==
X-Received: by 2002:a05:6000:387:b0:482:ea3e:882a with SMTP id ffacd0b85a97d-485781de9c7mr5755351f8f.6.1788354500289;
        Wed, 02 Sep 2026 06:08:20 -0700 (PDT)
Received: from alchark-surface.localdomain (bba-2-51-220-108.alshamil.net.ae. [2.51.220.108])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e72b5bsm6385800f8f.4.2026.09.02.06.08.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 06:08:19 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Wed, 02 Sep 2026 17:07:55 +0400
Subject: [PATCH v2 4/4] arm64: dts: rockchip: Derive GMAC MAC addresses
 from OTP on RK3576
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-rk3576-otp-cpuid-mac-v2-4-e4b7fe2ab13f@flipper.net>
References: <20260902-rk3576-otp-cpuid-mac-v2-0-e4b7fe2ab13f@flipper.net>
In-Reply-To: <20260902-rk3576-otp-cpuid-mac-v2-0-e4b7fe2ab13f@flipper.net>
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
 h=from:subject:message-id; bh=92HKX+rJXSdlXE5EQ1Vyyu1clzsl9p8JunUiEHK0e+k=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWTNkN+stdDlfUizrGpdwOQDO7Wsb6x5/WrOvdW/mBVvR
 Uo9dBd26pjIwiDGxWAppsgy99sS26lGfLN2eXh8hZnDygQyRFqkgQEIWBj4chPzSo10jPRMtQ31
 DI10jHWMGLg4BWCqP59mZHjJZMe74LTovK18N9U/6Wg8Dag9/iaBV+x//f7tD2Qtl7Iy/M9OYIj
 4m7OmNjlfYPKW1exzZr8VEjH38ol2EzqvYtedxA4A
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
index d418bfc04097..aa6d867b5a30 100644
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

