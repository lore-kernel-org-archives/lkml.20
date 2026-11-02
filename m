Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.6
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793641509;
	b=OPGMlXAIGN7UJu+MGlAcBrMJu/Go7vFu3M0Sirlq7igo0LAXcHeZaRCXrRxL0lMQhQFK
	 bhW3RdHUn76q5VWwJs1xlUZMjrHOKwbYBWYOPk/YdvVwKw32FV0O8RtUqr/3B97n4iF6Y
	 eDgM98xwnip9pVvkOHsu9W5ouTkSavJNz+E431ZlS7tug9QLpkgq4lrbYzQIudVmhLWef
	 XiDquUPxcNprv7AR5qD5ws1Mhhwhqlh+QflTZeDxMe5fny96DRhIn8j1Y1D5HM1ZRfmz4
	 uskzT7UhrO9zuZCD54d6BPLQ9SUc3aIuOsC0ivYVHN1aQzRSnaoXUaziLKGnzKX3DkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793641509;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=BCkJXdrsAlr6UgG3VN+uF/+sPVvDnFNnW/1WCxoAQCA=;
	b=dT2O1EzNivPuYZuuQXmM7x0GRexlx8u0yi6mBJTM6VhJZDK6bUtqmQPCHMJ5dwvXrAuR
	 lKDsbItXLI3f6oeck3insrd0PR8Ygr03s5okHo9vhraSXeKSZ/xg+b6z8Ebqbbm4Lqrwq
	 o2QCm0ExoH9aqU9EdNZk/iNqxgZ/FePAUqDApR7bp+jEGDsE5Y9Eox423699Dl0OiKwXL
	 Isl2PCQaNTUsk7Gk0+0oYGE9vV0JE6zq9GoWnpecI3JZOCSuxjn7Dtr0y15NceEUaIXw6
	 NqRx5Yg9j38gfzVUmhqo923c2VF7Ns/XP4QCTmAv8QjxQ7XZln3qOvbTznZg7KP7m/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hRVgZR8l;
	arc=none smtp.remote-ip=74.125.229.6
Received: from mail-dy2-f6.google.com (mail-dy2-f6.google.com [74.125.229.6])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51C75606CEC5
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 17:45:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51C75606CEC5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hRVgZR8l
Received: by mail-dy2-f6.google.com with SMTP id 5a478bee46e88-3537f63c9e6so1335129eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 09:45:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793641508; x=1794246308; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BCkJXdrsAlr6UgG3VN+uF/+sPVvDnFNnW/1WCxoAQCA=;
        b=hRVgZR8lHjJoywhtAha5sCBvZTIrJvBXnIPA2X3B12WaAkrujwv1v+Wf6RjrjzgD4b
         J9D4NbIlXRm1eECIdajOUYyBOmWc6bI9zFh94TPd1v2SH5Fi3OiVL6z9fBeT4WNUKG3T
         25lhtr6t7AOTMRVmlJSFXe5jSbTBL6GKGg0VwxbwmtoCA+pWZN9zWk+d/oTHkrazpDlC
         IyWkogyMFqz1O0j8Bl8GrhWr+KVi3mA+jnz2RGZs5Igw9clTFwe6zJvPlaSghtEJ8Jz/
         qNvV0xGIrLJ8s1kBQEdqbiOxIRQIRbRtslH2tC24UtKWH8nQSHLSsGPXuhhcKXWkA5cW
         aNYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793641508; x=1794246308;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BCkJXdrsAlr6UgG3VN+uF/+sPVvDnFNnW/1WCxoAQCA=;
        b=e1AXfHDEGwUj3aeybbpMkknCbcaEmFNSxrkdyfUF+qAs0gpDO1WxJAksRn4sateJ4E
         2noH4uNP878Y/w+gR6ZHg+GArKJHFJSGi84CJuklvigUq8rB0p69oLH3bkmdFayeiqmZ
         xzQD8i17q5Rl8nBG90ZSsab1dfVuRlXVzh5iuEeyLweX7gsHzhv8FEXqiHViYm+Out43
         K1j4mILEqXfh8bVrfjVI4ptRIjMoE+11c0Esw4N8SCTMnCZ7S5J303mCHyMQ2qNB31vy
         x9k54+PUBr8MXumvo4Fb0V5vXr2kBPyVYUXI5MKOdoX10NlcVC6nam2owRD0QfZs7hez
         TeIw==
X-Forwarded-Encrypted: i=1; AKwUvBxnWaAt+V3AblsnR/lc0RKHdIEPW2zAwgVmp6Y4eeEaH6UC87pRgSK8BoabKbwFHwYB28oz/15JbGhZz6s=@vger.kernel.org
X-Gm-Message-State: APuU4Z/xww6BtfcZj8kuRoswffZVgWGXsMl49Jzpx375Md6W1clX9SY7
	gAO7uNMeh9ngNI13lt6jvmfLY0YV8a2nBB+egTgxoLHR0bwTuNQr/Bkz
X-Gm-Gg: AYBFou0KrkkcT6EDuRQ2WjIc3jq86YFYDDXsBs0kaPTObMP72I4Oj2xddNQtU958U/6
	cXpxISOywLIClf58jgBc+5lxg2xNNHdDWHsRVsGmO8R8V7DWk+PGrPdGE7i/JO9fqiUX8TTdQhL
	gac2ZyfeeGGHasiYwUw/dxpHm2Vx25+lTcVKf5Q/UTYUQVazJbprDFstOY8A6WoSbNEo0bgcR3M
	bK2dZj8lij8D0B4jeYlrCQLd+Rz4mDku/732O9XlBJQ1yVyqgWKMAlEfkijIJrK/kEB7dUWKXeL
	1WQuospP/XEq6CZEC4wBfvh1plSBLS9jg7px36qXwqGcih1DjqXAbwVgYwSlSk350TUg6CQhneD
	D3pn0ZRYQN8yt4E/u8mpbhGHFByooh58IXt2nins7jN2yPPR8zuuvVImaiYWJYlyblc/UV7+dgU
	JP+/KzgUPUc4EHmmpzkjolVeM+mmR+BdLn2ZV+Qij3bgBnUHqZQZsZFAmETrKVdu0BQW6B5Vc+R
	L9ZjebmM5T27SRfVYmuXnyLXcQLVL4kFHBSUl3HP7r+dEUiA7qm1Rgccs3+C99FaE2eL64Er2yJ
	AFRvY4UNGBDq8KxGjl/sdwSHVZk=
X-Received: by 2002:a05:7300:ce0c:b0:36a:1732:1e5 with SMTP id 5a478bee46e88-36a4243b307mr15860843eec.37.1793641507395;
        Mon, 02 Nov 2026 09:45:07 -0800 (PST)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42935b4asm53290803eec.16.2026.11.02.09.45.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 09:45:06 -0800 (PST)
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
Subject: [PATCH v3 2/6] arm64: dts: rockchip: fix GMAC clock parents on Graperain G3568 v2
Date: Tue,  3 Nov 2026 01:44:46 +0800
Message-ID: <20261102174450.3000397-3-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261102174450.3000397-1-coiaprant@gmail.com>
References: <20261102174450.3000397-1-coiaprant@gmail.com>
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

