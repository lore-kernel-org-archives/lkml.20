Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793639948;
	b=2dFFldj5HyYKQgUdwgj/+/CEnXSCvW8mP+WLRxKCrc4jRblhbdiZkoAPt/5V3HeKDBh0
	 baw6JavnVrhDWL9WUJKkPsV3IY8tNFQusQbuiUqFV6O/nmqML2H52fPbIOZw9Q1cuNhzq
	 cjO3/H6NQR850SSszaKq0mN9/JIim0NdTZFv2+oM7Bb10rX9ygLL3+604dn6LEMjOh1mr
	 uMgGnVEqtWyZJ1Xzdq/Z1MpSzH9PV2iRIRXoYjUCFr2eUn0S1ivg8SQDHuF3RXV2wxsvc
	 r64EBsRIvyAenooxZQe2cvUSZptpiZkiLwDA+vYamdEiuC1e/rzlsmZwDRJWfAcSMsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793639948;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1QXiP0o5CtQwTzziGzPYfpYOgoBAHOCYb3Fgk/Di0Jw=;
	b=R2CKOMVTyAsDnDvxolbBKUPVFFp4VQj1Q5YNHsOHUJ3AsUx5eM/+IDv7dWYqKLFpvaPq
	 2v197qKV1JNG/+Up7lxkTHl/ySSTdXy+K6k0imvARuQD0EVEolZFOMBw46qcxSCybz/0a
	 w9Zh7M2oZYP6Hw4DIEq1+Puj006nVsLoU/mBo4QoBbU9mCuKflpl/peou/TP4AMyhSpdk
	 ZlBrMwc+T/oUGzyogtd24GR+B8Z1fqfNXcsvqU2Tokn5YBopynGL+ualfU3G/1NeN3aDF
	 lC8xyRo35JFwmK16Hb50lprI+WsDB+Gdi0f+gZJSndM1oFduROpjzYPuhVgIaPPzZgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nc7EBWvg;
	arc=none smtp.remote-ip=74.125.229.8
Received: from mail-dy2-f8.google.com (mail-dy2-f8.google.com [74.125.229.8])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B06C60850B4
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 17:19:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B06C60850B4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nc7EBWvg
Received: by mail-dy2-f8.google.com with SMTP id 5a478bee46e88-36a6ce64b95so694296eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 09:19:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793639947; x=1794244747; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1QXiP0o5CtQwTzziGzPYfpYOgoBAHOCYb3Fgk/Di0Jw=;
        b=nc7EBWvgF9nbBXHYDGcwSzFZUzPnwH3Wdi0zFd/gwQeGw4wz3gyXKKcRpnsfFroOU+
         1nvF1Ve9aIrld4xNsFJJpooiXMVH4LAV4d0hGMLxurJ6qCNUhDmeIyfmR5XsafLJ5X1c
         NOid7Gmww9K2UczXy53Icstp8kRpUHl7rUwdTiyVk0ClZlCLkOENUYsoJ1f/gLz+mH9E
         PSXTx+HZBj2xFXVGK+bKMrO6itab2ygIZrW2HX3XdngaNfBRIuvNAA9hEApBB9JOioKf
         d523+jMy7g9Q1EXB3h+IyieSCvEBwo9jOjVo2x3+pbPtutQWcvnN5lGdbr8PcTMZb/rD
         p7kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793639947; x=1794244747;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1QXiP0o5CtQwTzziGzPYfpYOgoBAHOCYb3Fgk/Di0Jw=;
        b=WHDazask3fjF5NjnLCQrNsbQqchRLYtMZpnQmV/nFZ/oLtZnrNJ8lZSzo2UksjQpUv
         mK0ZSGJPTZBF7KV4YuG0l8sUqLc4qQe0mELU5qr9Uows0vMQ/nyKcXqf2uHFLjaZomzl
         4U5NpTohHfyY5miO9AL0fW9gR2wyrg6AhDqndjocRKbEk2LshmSEZzKzM7w2MyPahPHa
         9pnP9dNu1nzC4OXPVEAXejXpulIh6BoW7FxbWHnhp8q0KecPU8TUIlMqtDNeGLAULIxW
         waHKrdHsxXcslg4uc/gfhPrCJT0zRUNmkYmTQrLHd32ylXS/iFbOR1FGBOTwUrLr9hc8
         +k9w==
X-Forwarded-Encrypted: i=1; AKwUvBy2tDNdj1iEh1gYPBU4/orUFxTwwHbXFjlAS6U25uoGCsic7c4kAMkaw1dZym7FCP6nZOg+aoWKVbnNn8c=@vger.kernel.org
X-Gm-Message-State: APuU4Z/MQj1fKiiiCFYJYEIs8V9Ae724bx8qBWgoJmudF6KDqDXabOoP
	PS21CVvrqFvx18qAYESnGepc+ca4MmL3YRNjbdK9pbFWSG2hhkM0ALdY
X-Gm-Gg: AYBFou32Iw2NXFlGpEH9YeQMfS+OYylRVWoRmgrQtoH52wgHCho7YiRYkYvr+T9ZHQu
	lX9HzEiXDCDzKThLuTUrNFqobbM8GDb5v8KuXmPOvuY/uuWNOKJbuoagGFS2VHEBMbHrv6Jd1Bv
	xbRIQcRhtv2QlQDlV69YjONCCF652D7MTUu62KOewK2yNbn+6pfACNZT1OlrYoZDz/9W6r3cE83
	IppmVOE81qpyVfzNQrQ2873G6nOpBGrBfT9mWSTtIG2CaENGg9pxA72EUrScK+AY6uw7gEiYYlL
	pNTLJz3NnzQKZ5Wz9z95OYvHcMG6TbL7tnwTpCR+kThxUAF2ATqJC22L5yFJUvD4Q71UL/oQyvB
	fi+GJ8m6CZ+w1bdKC1XwPtTCC/Olz+ctRR488O+A+aV6QZMqC77Nbml1reBCfPXy+7S97UTRjl9
	SThOvx0pkKBwPxtsXr5/cxxR5W1KoWwICCOPq4hBSgSYeURdgt8TpFInnEG1/obuKfOCLQd4Ogh
	OI4eKT9sJ6djbRxRkjLEgDPnHQYcK0jk5B5YCT4odo/tOgkoXv8F7hlFOE95vCgYgDKuVM0cJSU
	9qkSPCHU7wfdXarHn5kAtUjnkYA=
X-Received: by 2002:a05:693c:42d4:b0:361:1dd6:531b with SMTP id 5a478bee46e88-36a42484fa3mr15445128eec.26.1793639947326;
        Mon, 02 Nov 2026 09:19:07 -0800 (PST)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a429467cdsm36978047eec.19.2026.11.02.09.19.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 09:19:06 -0800 (PST)
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
Subject: [PATCH v2 3/6] arm64: dts: rockchip: fix GMAC clock setup on BPI-R2 Pro
Date: Tue,  3 Nov 2026 01:18:35 +0800
Message-ID: <20261102171838.2958552-4-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261102171838.2958552-1-coiaprant@gmail.com>
References: <20261102171838.2958552-1-coiaprant@gmail.com>
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

Both GMAC nodes rely on the internal 125 MHz GMAC main clock, but
neither pins its rate explicitly. Add assigned-clock-rates = <0>,
<125000000> so SCLK_GMACx is fixed at 125 MHz instead of whatever the
bootloader or the hardware reset left. The RGMII speed clock
(SCLK_GMACx_RX_TX) stays at 0, since it is managed at runtime by
rk_set_clk_tx_rate().

For gmac0, also switch clock_in_out from "input" to "output". The port
uses a fixed-link, and there is no external 125 MHz clock feeding the
MAC, so "input" described a clock source that is not wired up. Note
that on RK3568 clock_in_out does not change the hardware clock routing
today (rk3568_ops has no io_clksel masks), so this corrects the
description rather than the behaviour.

Fixes: f901aaadaa2a ("arm64: dts: rockchip: Add Bananapi R2 Pro")
Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dts | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dts b/arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dts
index 4d3ebe50b90ba..677b6261a3a1e 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dts
@@ -206,7 +206,8 @@ &combphy2 {
 &gmac0 {
 	assigned-clocks = <&cru SCLK_GMAC0_RX_TX>, <&cru SCLK_GMAC0>;
 	assigned-clock-parents = <&cru SCLK_GMAC0_RGMII_SPEED>, <&cru CLK_MAC0_2TOP>;
-	clock_in_out = "input";
+	assigned-clock-rates = <0>, <125000000>;
+	clock_in_out = "output";
 	phy-mode = "rgmii";
 	pinctrl-names = "default";
 	pinctrl-0 = <&gmac0_miim
@@ -232,6 +233,7 @@ fixed-link {
 &gmac1 {
 	assigned-clocks = <&cru SCLK_GMAC1_RX_TX>, <&cru SCLK_GMAC1>;
 	assigned-clock-parents = <&cru SCLK_GMAC1_RGMII_SPEED>, <&cru CLK_MAC1_2TOP>;
+	assigned-clock-rates = <0>, <125000000>;
 	clock_in_out = "output";
 	phy-handle = <&rgmii_phy1>;
 	phy-mode = "rgmii";
-- 
2.47.3

