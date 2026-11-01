Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793561391;
	b=Djen4KtJG1GIsuyPEqhufxsiEMvAYFED6li+HJc5khPoMIvyQt5U2Kenbs1nquMavvJH
	 p/6uzybIYIuIR15cXebyyRmlyt9w6MZyisB3LWi2sETWeYFFWuV/GXA3ZEUbh504rSEWY
	 nh5gsMzMhreDD3wBGglRAjSdjsZ2e9VSfkGrKU6dES8AtvLlj5lNfRkXHA+UadVLyKda0
	 ihNiDLWQ5cf+tbpTb6So6LR0YastrWQesgVdkWCCP3hgWijvNUjdfpm9GBkjToCK+0kej
	 sf4aHj5RJA2i9TkDNVJwELbl5HQiN/MDbvrLejlLySAYbKDKwS0eRrhH7u88F+wBfWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793561391;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=O6UlseroD4jG2dHId972eYhTZmtxZYuBjJ9VhYkAhAo=;
	b=OS5E1s5G+5zRduQ+j73/eb8qDVKCqtVpC1Giz9R46THub1Hqid71XjWayYD0ICrqbs7X
	 ZGVHoHdXkB2nSPX1l/2GmZXUBh/qpZqTZswNsAzZTZu1Rdaid/bMozs9J7pg/d+MjJ9p0
	 pNLXN3b1rcaN0F5iC2XTP6zHcsbbnkmw2cIIn1RYgDYmjglpPf5OFoRQ71x1coFL83Aec
	 fKPu9u/APojgSA3RHURNhClZzuuBFQPbzJECCLf3OJ8IdvaaJoluZ/fr6/he1qZWuPBVt
	 nBjNFnHXTlrVv30vyTK1jn0jLvEIb8V9W/PEECTLM4RyWvROPZ4g/83vOwsEWputlMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Sr2/Jnxy";
	arc=none smtp.remote-ip=74.125.229.137
Received: from mail-dl2-f9.google.com (mail-dl2-f9.google.com [74.125.229.137])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CBB3606A331
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 19:29:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CBB3606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Sr2/Jnxy
Received: by mail-dl2-f9.google.com with SMTP id a92af1059eb24-19305bcb6d5so598374c88.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 11:29:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793561390; x=1794166190; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O6UlseroD4jG2dHId972eYhTZmtxZYuBjJ9VhYkAhAo=;
        b=Sr2/Jnxy4GKof3nFeFm9KBFBYre4/9SAFGqRylDoBzNrjjOt8itmHG5gZof712DddK
         eBWZIrjBKRxEBQ4+5IPrD3deYro/ZpZWR5Fn2UHaUZz3Kac3nkZ/FObqC/wL+xhEyWvN
         2rmbYY8pxEEwfYbKZTxKcgP8w5PCAO10RK/3hGnrbhomkQhr2LWoIzPEgd9MIBM3QTl/
         SiyiozoXip3ImU8fq4it1FVnLsMWXw6BCYIigV3BLF2BD3fZzYkUQ62Hp98tredjixM0
         AuMXry4ZXZR8om+k/58LEG14+Di8nxwFsFGzOgoZaLaABlurhS/SXbCww1cb/d9J/xJS
         ohaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793561390; x=1794166190;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=O6UlseroD4jG2dHId972eYhTZmtxZYuBjJ9VhYkAhAo=;
        b=cnjGIqqW/HY5Bdnx/4SVrTG5WTWpgfmKLZvXsMofyFyiHAZiCECrEO0BCFQy2RJYkJ
         KXWkwkd8S31zR6ZOUDVIZr9oAn5z8SyWRMNE0gz+CiHGWEy1TQRNfYJ9RAVtqFMZs2BM
         kHKsH424gu9kCNtDM0ODxVXFJ+0d2Cu1yDC2sfPTr//aes29pAaPnR+hjhKuNK91cHgZ
         T3WY+wnok1uL+j0dzftp/iVBXxP1Rc+j2PrEIHlgCnUU2bOOOfLLa3M9EqnoN+AR0lBE
         xz+cHfbC6ZiMG6ie6xWS0Tuoou+eMyFMfJvCxOnzPam7TZEGGtF60hLipZEU2RFzJB2k
         bgCA==
X-Forwarded-Encrypted: i=1; AKwUvBwV+JXCNEwv6xHUkiyBWvmaZTH+qjqA0Kn7sqyUPFqNWOMQyrRMzX2GpBH44UIiswxJ76bU69fmhuRVdXU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/q05hfrfQF174Q4t6Y2tDLQkc+Gm/QJHrmSQRFjOTX5TxNyWF4
	0Fs127+EDPp8urW6aDf6KMmqa7fRBbnz443rnX1t6kFrJxYvrIxDo3hk
X-Gm-Gg: AYBFou2QtBZgZcZJlhCsDGnYolbEt4uhKYlexBBkeHtU4LG6HwMM0Kd3JmoiU9Z0jmo
	2AGDLng8bQFRyvv6gBxgHtR9EFeEYGnQleejE+kmXqpiUaGyvxHfxfLzjiQXNBdXujv1GxYofCs
	Ty0tR8xThI+5OwxKAEyIqX6B0yluDubdXmWT8UcSu8ikcys4Q18dQJfmUKgjcgloZdxml32o8xT
	+Eeqb3It/XMr39gei+0nvWUVT6XYxkz6M78h2VmzQXM51IJRMQqhqFIjf5lCP3g5lqzYzU7DYgi
	oxQUj6haWU54P+osg9CTAdHw2utflIB5ARhee/a07odzS2+Sw9z2C4XzkWycoAhrlkEA93/F5i1
	+tcbaNhDNImIur0LuJ85qSRnzfc4Zw8HQe/bz1b1zRtwhKuUAuIO4SFyvyGFt8GTbQhl2PhIkwC
	TLEib/ebYhOrx77E03p6XPPeZcQCQCSv1k6cdqt9zBzBmgwSx8c02jvfHhaHp8Vn6lAJD8z25Cr
	N5WpHOyfeahRtFs7RXhqPH1AhTYEwOal9RTa5WTzgcc13NHWrPvo3mZgmFb1B6vFvLkta/AoKN5
	+uHq4BGzuH8+n6dfgaw1gYFP4Kih
X-Received: by 2002:a05:7301:1828:b0:36a:10d:afab with SMTP id 5a478bee46e88-36a42423d10mr13381248eec.25.1793561389745;
        Sun, 01 Nov 2026 11:29:49 -0800 (PST)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428af1dfsm31471861eec.7.2026.11.01.11.29.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 11:29:49 -0800 (PST)
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
Subject: [PATCH 4/5] arm64: dts: rockchip: fix GMAC clock parent on Photonicat
Date: Mon,  2 Nov 2026 03:28:06 +0800
Message-ID: <20261101192807.897562-5-coiaprant@gmail.com>
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

The RGMII WAN port on the Ariaboard Photonicat uses SCLK_GMAC1 as the
GMAC main clock and SCLK_GMAC1_RX_TX as the RGMII speed clock. Only the
parent of SCLK_GMAC1_RX_TX is set, so SCLK_GMAC1 keeps whatever parent
the bootloader or the hardware reset left.

Set the parent of SCLK_GMAC1 to CLK_MAC1_2TOP explicitly, so the GMAC
main clock always uses the internal source and does not depend on the
bootloader state. The rate assignment is unchanged: SCLK_GMAC1_RX_TX
keeps its rate unset, SCLK_GMAC1 stays at 125 MHz.

Fixes: ba124e06ce7b ("arm64: dts: rockchip: add dts for Ariaboard Photonicat RK3568")
Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts b/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
index b719d5b661c43..7e0a2ab829209 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
@@ -285,7 +285,7 @@ &gmac0 {
 /* Motorcomm YT8521SC WAN port */
 &gmac1 {
 	assigned-clocks = <&cru SCLK_GMAC1_RX_TX>, <&cru SCLK_GMAC1>;
-	assigned-clock-parents = <&cru SCLK_GMAC1_RGMII_SPEED>;
+	assigned-clock-parents = <&cru SCLK_GMAC1_RGMII_SPEED>, <&cru CLK_MAC1_2TOP>;
 	assigned-clock-rates = <0>, <125000000>;
 	clock_in_out = "output";
 	phy-handle = <&rgmii_phy>;
-- 
2.47.3

