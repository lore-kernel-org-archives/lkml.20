Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793561383;
	b=cKgDMoj5rA/m7rTRYPCXGsmP3znzEyYtx9TeuRu8t/34/+MBGODjbl7ECGAbDkMM+S89
	 yQgj36JcKNgedbrSjvWbk48ZlUFS5qURqjC3koOBdYTPgv93nsLB1Gi8uhoIGT/Rdne0+
	 hZMhUbW/1gtxRsQA38TaGvdynGUPrlTdDv+rVR40DEIJmNQ2rE9mw0e/3v0jdiWGHVWl0
	 zwljA08g78hHx5gpGC/FjkUeB0uy8qeu+Jsrhjys9+l6HObktgKfuk3EmNiM9xRKjy771
	 dsXNjdMP9IopoA7wn4gmXjLt96JGfLbs+5BJSPyHL+mxid4OTPtDF7gMfCkVMZobHjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793561383;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=BCkJXdrsAlr6UgG3VN+uF/+sPVvDnFNnW/1WCxoAQCA=;
	b=Ccv/92oamdNm7h77fPvlQORIM2mzt4F+ctzBNLHeHatp0haoRXjU0kBKgcDf619Es8hO
	 63AUaDTSz93ds4OvOyi3Q5kq2bRYopcvjM8wBAHX2hnCWnA3s2BH/G+f+L20sKTSFadY8
	 Wqq1LXI8Z04RqJk3nHZcZ3D1dmtA8q3RuNJ+DN/DoPWQBKyHUwfSanCjqNgB4Dwxt9wf3
	 Em0xi6daOFbP3KuKxg7i01SN1iU7tSZUuxIWxLdE4ozX/ReP52pToC//++ld2MoYgh+uU
	 auT9kTXRhh8pSzHsyHfyrtAODAD+j3TybuIhFIaPW+E7wtk8c8V7ZYacCd+9BhI/I7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SiNfHm2H;
	arc=none smtp.remote-ip=74.125.229.9
Received: from mail-dy2-f9.google.com (mail-dy2-f9.google.com [74.125.229.9])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ACEC60A2605
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 19:29:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9ACEC60A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SiNfHm2H
Received: by mail-dy2-f9.google.com with SMTP id 5a478bee46e88-3678f64d078so3884854eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 11:29:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793561382; x=1794166182; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BCkJXdrsAlr6UgG3VN+uF/+sPVvDnFNnW/1WCxoAQCA=;
        b=SiNfHm2H39UH5lWSX8ZjN/MLpLX3ymy/kFYm1Q8tNHmkyp0uLz4qH/wT9sVJVNC2LT
         Qu9K0184ekK6F10kbCQcic0HuN8Y4QKU7vZNMGXOxoujjXcqEdjaoPXV8ISPSaCUv5/+
         euBfuP4wI/7Ato89hrKqLjvKlj2c4BjM+0R98HWmQernjhRMCTGQmR3KISK2OKiOl344
         j5sMmJdacsrISfr/Edzyq8tKwJUEfzuZ73TZI5SbfPiXLASl+ZKXkBVWK7rhpl+tsdVo
         HIqPcrjg4cX/cp+r91Np4I3I40pdYm+vk9fRg3Dhjftq2q1P6DakQzcIo2O/Jr3myWc7
         SzuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793561382; x=1794166182;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BCkJXdrsAlr6UgG3VN+uF/+sPVvDnFNnW/1WCxoAQCA=;
        b=0YY5IeRINkO9oWD+fGg6lBenddTC5AIRjGJ9C8d0wZ4i4UbX4YYHcMPv965GMjQL4R
         tWGDJwpDEI2p/R6Q9xjP6gsu05DgQAHIZ0ueUmOSY7kWqI61NUJtxY7UZLchCRzvrsCb
         vLYTYpdgoEqPGqvASnEZEslFOVc5GMSw7tZ1ZSh9NbCQruEdELsEx3iMy0QvopesKzq8
         Q2eO56aGoQs6GtTDwB01EcHWYl+JpK+a8t4vzxQuVInDb5maRiJaS5ZMPLn4nHWHsvUw
         KV0V8Bl2vmbil39CcSHee7G9UEV/UAqWvLJV6GnAsLy1Ckh37x01gBCvAmpWX8PM0cln
         ycNA==
X-Forwarded-Encrypted: i=1; AKwUvBy7rftIWzfhxOZV1fc93gQuvRQAIObFiAq/cdFGffB2v7W/98q32u1knJ4NfazPUmevcPOYNP6JdkGzuyc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/gLSeFh3nonn1WuhwWUAu6bIEycJUQKWa6m/S0cFhhGUf7VnJD
	WTPY4CxG9ZlEpTnN41NU8l69aYS0KFzKtD963uAdPDO4WH0fjRSptfm/
X-Gm-Gg: AYBFou2hQ2IlEZIbOsuET/jieWAgAQSWJ5L5ZMWGjJP9SJJY7nCVfBerYDZc3iGk9bZ
	Y6iLwh/GHRTSiCQp2yfDRMMtJaDIeU0O73onIMYyHCi/vbLIHqEhRNgnKbG/X9zNGG/0Hg/QIvN
	tyVpdNfR9m5g+2vVyhaa4EMUtLhXeChOhFTB49Mg2EkImP6GOPhWiAyocLZWRd6///5IpaTlzzb
	O/xt79k1K6rYsI4ZWgQuUCYLnljGmEvchcOBtmLKQDWipvdAP3Uqb+2Bcac6Ism8v4pIHtYZXJy
	zY6bbOqYFRKVll9FRq24H9n4YaqrQ6esTTOjQr9BC1DczO8NsGV15JYjCf/IJrV8GlKmIxYbcSv
	wRoBDN6xB3QFPQkOUt1X6XXdEWJM1Sh4r67lbPaRNNe5SwArjFANaBq76i6//LSQNW1JdYNvnCU
	IJ3GctX0fohO+fzTReqzhs1oM1pbA0MhDAOP1pkkDQojzOB7RsxttGnA5B5bkt+w5xLcRT6d6AE
	9k4FsWDjgX3yJM+7V9cpdgKYV4rYh4RnCCEUGj/8Zhkt8KTDWRMMH1T+a/aLEIIQVUQG0M++kKf
	NpSNsXVKpRIKldjDLhhOI1O478A=
X-Received: by 2002:a05:7300:3b1a:b0:351:52ec:60ee with SMTP id 5a478bee46e88-36a423f04b7mr19592157eec.28.1793561381531;
        Sun, 01 Nov 2026 11:29:41 -0800 (PST)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428af1dfsm31471861eec.7.2026.11.01.11.29.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 11:29:41 -0800 (PST)
From: Coia Prant <coiaprant@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Frank Wunderlich <frank-w@public-files.de>,
	Peter Geis <pgwipeout@gmail.com>,
	Junhao Xie <bigfoot@classfun.cn>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Coia Prant <coiaprant@gmail.com>
Subject: [PATCH 2/5] arm64: dts: rockchip: fix GMAC clock parents on Graperain G3568 v2
Date: Mon,  2 Nov 2026 03:28:04 +0800
Message-ID: <20261101192807.897562-3-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261101192807.897562-1-coiaprant@gmail.com>
References: <20261101192807.897562-1-coiaprant@gmail.com>
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

Both GMAC nodes list SCLK_GMACx in assigned-clocks, but only
SCLK_GMACx_RX_TX gets a parent in assigned-clock-parents. SCLK_GMACx
therefore keeps whatever parent the bootloader or the hardware reset
left, which may or may not be the internal CLK_MACx_2TOP.

Add CLK_MACx_2TOP as the parent of SCLK_GMACx explicitly, so the GMAC
main clock always comes from the internal clock source and does not
depend on the bootloader state. The rate assignment is unchanged:
SCLK_GMACx_RX_TX stays at 0 (managed at runtime by
rk_set_clk_tx_rate()), SCLK_GMACx stays at 125 MHz.

Fixes: f296bb503a24 ("arm64: dts: rockchip: Add devicetree for the Graperain G3568 v2")
Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3568-graperain-g3568-v2.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-graperain-g3568-v2.dts b/arch/arm64/boot/dts/rockchip/rk3568-graperain-g3568-v2.dts
index 4c55c7d211599..07cfc68b5f91b 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-graperain-g3568-v2.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-graperain-g3568-v2.dts
@@ -280,7 +280,7 @@ &cpu3 {
 
 &gmac0 {
 	assigned-clocks = <&cru SCLK_GMAC0_RX_TX>, <&cru SCLK_GMAC0>;
-	assigned-clock-parents = <&cru SCLK_GMAC0_RGMII_SPEED>;
+	assigned-clock-parents = <&cru SCLK_GMAC0_RGMII_SPEED>, <&cru CLK_MAC0_2TOP>;
 	assigned-clock-rates = <0>, <125000000>;
 	clock_in_out = "output";
 	pinctrl-names = "default";
@@ -296,7 +296,7 @@ &gmac0_rgmii_clk
 
 &gmac1 {
 	assigned-clocks = <&cru SCLK_GMAC1_RX_TX>, <&cru SCLK_GMAC1>;
-	assigned-clock-parents = <&cru SCLK_GMAC1_RGMII_SPEED>;
+	assigned-clock-parents = <&cru SCLK_GMAC1_RGMII_SPEED>, <&cru CLK_MAC1_2TOP>;
 	assigned-clock-rates = <0>, <125000000>;
 	clock_in_out = "output";
 	pinctrl-names = "default";
-- 
2.47.3

