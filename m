Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793561386;
	b=qrX+d+aTNGEEphh8vCEqnp4yPAmfe8aFUEjlrxY05MMalwz3+VhD7cfVtG0ZhwGlb0IF
	 uSFvV67xk+Zx86Jwupum0UTMAeqp0Efdlt2CGuAQbEj8ikeQGRH2EosB43OnvxrX2zR9N
	 v/UwCq16KdawkPORWlEONcbkkJH+IIc6NFuWx9whz0xeCibg9ry/+YTkCykfsuncq3WR9
	 SvnkaQS5hbvXOmf+9qNtsmTixpdQrH4yPH2MmeI6ujhk7NbKEE10e8FpjZWwKfFd21WnE
	 6rZC6SQU4Xaw5zS7EsTc/KMJZnLXdhvvqPCyjRA5+OQHxutBYR66fz6xnV4/7UHlj2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793561386;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1QXiP0o5CtQwTzziGzPYfpYOgoBAHOCYb3Fgk/Di0Jw=;
	b=1v0lIwUZNw3gj165H/3h5FjahyPmsa42zunvc19mVU68pWfyiQxw4MHTDXhmcIfl1ntE
	 n34uoqmOMIT2zC1ca+k4TucPVexScP7/5uv4WTjBgreIVa2IKVRK8JZFrk8UGeTYNgKQd
	 2RkP9ROabeM6gU6FMN4N06YVTX+G9cogsuPZcjGtxn16rNNF5cop9jVBr5qapcA+l34jc
	 1DmC6OalJlNie61BhniuF6akYt0sS8v9JyIim5qUoCitumnX76fDETo46pJjqVwM3Bemf
	 XzecK2fuJtkHVrEJP6QrxnsgST1vwUBBaJ43xhf7uGJhnVFj/ox1btyY+i9KLxCCxLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xrr9spFG;
	arc=none smtp.remote-ip=74.125.229.5
Received: from mail-dy2-f5.google.com (mail-dy2-f5.google.com [74.125.229.5])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92DCB60A2600
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 19:29:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92DCB60A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xrr9spFG
Received: by mail-dy2-f5.google.com with SMTP id 5a478bee46e88-35dc2af1f2fso1059228eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 11:29:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793561386; x=1794166186; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1QXiP0o5CtQwTzziGzPYfpYOgoBAHOCYb3Fgk/Di0Jw=;
        b=xrr9spFGBGhiIPVJRbIN2OfMVYgBUZesNXl1d8viZPSIz6U9gr9bAA7V7nawDN+VW7
         ZtJAuQd6ANZ2AQXt1LMnMAqDV6UC2gsQ86UIDtm0MEnmhibpNzVWIlqFy9yXTL3wwbwb
         3Xv22B1GbqEEst93GK8Snc8YL702IEows8QdmYRuXMoPYGQUEs51K2fiyfLr7eY7bCpt
         QrK6fjckD0dhgHYv6sZ9Lqc1Q6lB6MjQPcZDLi/Ry8lJ23n0B/yxiichfkE1GrDkGRFM
         HIi5/ryyCupcFUCKnsG2AVnauHsNXwr+2B/P0i4hmFKbNNrlUogtR8rfEDvQ/kXOGOt1
         L94w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793561386; x=1794166186;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1QXiP0o5CtQwTzziGzPYfpYOgoBAHOCYb3Fgk/Di0Jw=;
        b=KIFrO3tWD4jpaWRyx+JN5CUcdUWI/dGyW+nkEyZt8kcRFJYg6grawTXiO8p9mwm6Jr
         l7x2DCSSKFaJUuNSOsmwvB58yrX1Vd2EPW6o6iBZ0TA5ClFbROJFJpQ2U0zVYXGH6MLR
         Xa3nlWK2EAlYY2wPuCepkJc8sgh3Vr2jPxA2dmRbYd59UAnSc1d8IJD8JKTZ+oEVwoDy
         GqbCzly6myn5O1G6TciQwvIyAK7U5NChbB+IavLsJtHBgM2JOAe3AI+vgAhn3+D4m0UL
         VYLbMRq/qrm+zM2hfOmfVxLNt1WxVsTHBfUH8xlsawCfW9mbQ9r7H5aIf2QeLS4h4Pw1
         VCIA==
X-Forwarded-Encrypted: i=1; AKwUvBw6AmUPOZ4yzFuJfdxeWga/D8F6Os0WDfP/NQFRig9j1xUTmLIj19OW/R4niByEiMc01mam5AVEmKuLsac=@vger.kernel.org
X-Gm-Message-State: APuU4Z/pwUdheLI7iWIBXCud0KyoXcBSDJ0xH2foqXxzYBjRJGdybtFn
	Zw/Bn5JgbDKARJRG/nPCcrqCYuLfXz3bL0qb/wW8wGE5M6aa9jyemnas
X-Gm-Gg: AYBFou0sVUENvo9/svmKoyTLfmi79ZPP6BVC41RwgZjK6rQSQXlqsRx4RviwKJ5r50/
	YIX0AwqkBGKzRw8oKvca0wQb27pA/ykxXi63OjVDCwt8b5T4bU5TFN0/tTqTPHctG+yeKYIhFI9
	UOHRaBj2Jg8Af7x3nkDH9zmtQKh6QMR5wNCW0So9HDdMNnXFgon9QScLbayfJfexMH6HR/vrx71
	+pAMk3GbpXcA5U75o+XFS4k6epgufor/XB3d6H/e5bvNl7Lje+tJpoXrb2oJ1fEk8H05M56phD2
	nDbLZxHT604D52G0zJfjf4+BX79f81LqKdBqvCY3AIdPhmo+sUcr7stozONPQrfeuDeikNEwjOz
	lGLog1AvDpOQT2EUGIyoEIU9x7bLFUVNC+T73v8nG7z7GVdbjSV3bF7w+NJzuXmJZlD2iKk86L3
	xio7dLkQxZdEb9XbfBu5xze5KuKNGTzHs/5WyXNVhumOVuRlJfl/cDWhgwOa0F1IVIza326gp47
	5+vXuPXQf2BcZb7Ub99xgp7gUYQJ44+y/TYNyfBmfNeHsZRg1FpDwjHGThRVCsziEwnaGFKi6Gk
	NfsiCfsmVjQg9GeQrj/n9gciZ/M=
X-Received: by 2002:a05:693c:69d2:b0:368:9553:f2da with SMTP id 5a478bee46e88-36a423f5c39mr13721930eec.31.1793561385680;
        Sun, 01 Nov 2026 11:29:45 -0800 (PST)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428af1dfsm31471861eec.7.2026.11.01.11.29.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 11:29:45 -0800 (PST)
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
Subject: [PATCH 3/5] arm64: dts: rockchip: fix GMAC clock setup on BPI-R2 Pro
Date: Mon,  2 Nov 2026 03:28:05 +0800
Message-ID: <20261101192807.897562-4-coiaprant@gmail.com>
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

