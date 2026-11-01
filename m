Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=154.81.10.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793508129;
	b=vHiodHr/JgSaZqZBDQJf+IJJPlYYG3u4v1Wwhrwi/2YaZ1cDp1Mg+lay7IxIMI9RkCeL
	 3CrDJ2Rim0j5yyCPh0T0XkRUr6La99IT9vXVAZBBAdlroMMRyxJq/QmnE/fBgb63EyukJ
	 Cu2SMnc80y4Y9zlraEVHAZcwlDsZR0Z1IXLReNsVEJunlo6zcBY9JcF7EoLrQz36krlTp
	 HxHU4qfQbu4xQUK8b5tiUtNKP1mL9LMeOHKFDswuauDhF8uDdKW/hPLlDCo11rStunrk8
	 dULueQRs1HOpKra4g3XGmeJXfIjYuIeL4+PaCkbPjbgff/g92kDmBQg5FZco9cqhD5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793508129;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 X-HM-Tid:X-HM-MType:X-HM-Spam-Status:DKIM-Signature;
	bh=1YdCZdKcu6jcPnOK3BGWqFQvI2/EckQ+hEW64XoLjBQ=;
	b=oRKA+OAzoUqjtF9cBf8FthMoUiA6IfE8YvOUkwhyIrkgPTRil6BCb6TPD8hSqLK1DUeD
	 Auv75L5whL2UZ3EXpb7jx7wuDkq7IKXOzi/fnFMpg9KoR1KrctY3EL5Cn/x+fofp3mwbL
	 Q+GCO8LsWen91rwb+i/8TVO2DyaR9pOFDOITSXfA8REvkOI5nXETmb6YKgGqbrr6+4R9D
	 As6beyrH32ryz+xUk65P1LXpN58PftHAc/bUpOL1ccc2ZO4yrqF+NlwHpf1q4Ry1cAIoK
	 3lNcyAnn4ruU8AuSOWPJssLB/zulZCm7lSCA0lCnUho0b7/o19X3/C3cqf92L5uQcaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rock-chips.com;
	spf=pass smtp.mailfrom=rock-chips.com;
	dkim=pass header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=Qo+QGKu9;
	arc=none smtp.remote-ip=154.81.10.11
Received: from mail-m1011.netease.com (mail-m1011.netease.com [154.81.10.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6281606A326;
	Sun,  1 Nov 2026 04:42:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6281606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=Qo+QGKu9
Received: from 5950x.tail741d0a.ts.net (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 530dcc2d0;
	Sun, 1 Nov 2026 12:41:57 +0800 (GMT+08:00)
From: Xing Zheng <zhengxing@rock-chips.com>
To: broonie@kernel.org,
	heiko@sntech.de,
	linux-sound@vger.kernel.org
Cc: luca.ceresoli@bootlin.com,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-kernel@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	huangtao@rock-chips.com,
	sugar.zhang@rock-chips.com,
	lxt@rock-chips.com,
	xing.zheng@rock-chips.com
Subject: [PATCH v2 3/3] arm64: dts: rockchip: restore RK3308 codec detection resources
Date: Sun,  1 Nov 2026 12:41:49 +0800
Message-Id: <20261101044149.2018744-4-zhengxing@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261101044149.2018744-1-zhengxing@rock-chips.com>
References: <20261101040125.1864141-1-zhengxing@rock-chips.com>
 <20261101044149.2018744-1-zhengxing@rock-chips.com>
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
X-HM-Tid: 0aa1956a0b3403a8kunmda3ed7c8171622
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCGU1PVhlIHx5LQh8eGh5PQlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQk1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=Qo+QGKu9H6ce+LFR1oU9QsQVhG3e74EJkjnpj8SIfDd1aEgZml/aDzLjjWdRdtGtglK+oW17Y9kyzAyI9oTUgA+u9ISEFlDGS33/nK3Bep7Z4NXnrzBL+bewQUbNZISLwu+0dMzd5LhCV5ykGbHDeMqt/eCzoospCyW6exO7cgo=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=1YdCZdKcu6jcPnOK3BGWqFQvI2/EckQ+hEW64XoLjBQ=;
	h=date:mime-version:subject:message-id:from;

Provide the codec detect-GRF phandle and SPI 114/115 interrupt
resources with the same trigger type and ordering as the vendor DTS.
Name the interrupts codec and hpdet so the driver can request the
B/C headphone detector by name while retaining the legacy index 1.

Keep these SoC resources separate from EVB sound-card routing and
external amplifier GPIO configuration.

Signed-off-by: Xing Zheng <zhengxing@rock-chips.com>
---
Changes in v2:
- Retain the same SoC detection resources as v1; no functional change.
- Renumber after consolidating the full codec implementation.

 arch/arm64/boot/dts/rockchip/rk3308.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3308.dtsi b/arch/arm64/boot/dts/rockchip/rk3308.dtsi
index 31c25de2d689..fb4465eda574 100644
--- a/arch/arm64/boot/dts/rockchip/rk3308.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3308.dtsi
@@ -836,6 +836,10 @@ codec: codec@ff560000 {
 		compatible = "rockchip,rk3308-codec";
 		reg = <0x0 0xff560000 0x0 0x10000>;
 		rockchip,grf = <&grf>;
+		rockchip,detect-grf = <&detect_grf>;
+		interrupts = <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "codec", "hpdet";
 		clock-names = "mclk_tx", "mclk_rx", "hclk";
 		clocks = <&cru SCLK_I2S2_8CH_TX_OUT>,
 			 <&cru SCLK_I2S2_8CH_RX_OUT>,
