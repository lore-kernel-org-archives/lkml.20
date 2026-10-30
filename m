Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793345809;
	b=JVfp6gM298wujLrWtgASHL7X78RLslvRpokP2UfE6QKQ3bN3tF0nuYYaCn47xMfK/pBo
	 n9HGgx6oM2BkefyJgfV8QwTDKPajT/IIbBplAJwdAl5s24UeqIALyGMJuzA/1cgvH3KGY
	 Kb9MC71ODZwc5LLaDcJvqbdLcpACACZy+6I5xSYtGvQO13zbVXqvK5VNfnwHh3R2fk53M
	 oCENM6Jp2XaQQUGJMNcX4bUkZouKhHz4d0C5fSNqSQ0bIL+hDvP/ncucRb4DjfYXcF5VL
	 qcfIOIR/WIqlswpUFtDN054K+JUt+RfZZ5gGm7J74KVkuZN8Q2JueMSmXvLIjBXWVjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793345809;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=zyVM5qTzy2De10MnH1DSqnYzP+ppEdRoaIvfy2pZmrI=;
	b=UGx+038LnpWz7gziezmHssliKTX3M5tCBtbIKSCcqT54BtDW/Wk+P3a7VX70bglgijWr
	 jmyJlrWKkJPV+Woy2E+kOVteskYNt8ug0mIUCQ4NSUqompj8kFQCxRixZZyblEA7ScZTc
	 Qpc5AX4wztBXKFiYM9xPrizD/J9HHJPOl/F0kRrfqI0+o1NdnN9oJgWdDX28f6G8oXQYZ
	 In0s6yMGS74QMSImbMw2tKB88xiTWx6O0+x947eFLHC2y8T6tadSPsW05kr5pykIn92Dp
	 xoLP06iysrhVm6d0MYzF61Ww7L0eDZKEPf6X/amSXm5kELFkBLAwqH6BfX6R1iQTLtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yd2gLNYn;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8739606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 07:36:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8739606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yd2gLNYn
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a214af2076so2144435e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 00:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793345807; x=1793950607; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zyVM5qTzy2De10MnH1DSqnYzP+ppEdRoaIvfy2pZmrI=;
        b=yd2gLNYnt4zXBPKtqusIqQO1V26SRS+9409pgFKGPqbZIqx4YhzYPKqZ2lWzapNybZ
         JyrItnkPdDjjaVbbxMYNMl2+BEk+UF6Pt5ouiELQ3eOKZ5NjFKGun5g2JN6Suuo7YzLp
         bCvZv839RMDjp2YnC6hxcacuzUauz05K3sRQykx4GhaNUohrWGrdL7zGYpDfgcpIwmMA
         3/F3oBmgZWphG8fp4VWtJjl8wbJmBpMNglRkNlQh2zhuRlyT5cxmdyehVCkhh8/4iiAc
         gyFCPGu6Pkhvmumy5BY9CKJYVuQz972lWJyudLH1zjtdQHytlz8EydTdCHG99P1bTzE/
         7xuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793345807; x=1793950607;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zyVM5qTzy2De10MnH1DSqnYzP+ppEdRoaIvfy2pZmrI=;
        b=P2SUyv0gSKHgTMmhhu9rRMKUzLg0pb0ygcxHxm/myJdJk9fbsnjVGK+Sknuax2Sr5n
         6w5XaS5Wl09rE7iq3yZ9i83mD22YE6y/7I8mFbepQDZz3EAPv4RwAVTNxdJP1qnym6is
         vFEM4YHmGoOC8yBm874xKwEX+aB8+P7uV1lnkN6wuThdiCIM70SjD0lvr26G+m5/aTgo
         e6RokFzpHdrCxgkG9SU8+DgOUODzR6CT59ag67UmkhbsCJV49Z0GZ4jEme7zhqZnIl/g
         lDUm4Z7XelBTXaH+g7ud8M963ZRlUPXBFtu2W2sSfR1YQ+ZiNOXHjxAgC3bkbJJL4IY+
         r75A==
X-Forwarded-Encrypted: i=1; AKwUvBw2klH8YwlnSDeKmQO4dxd4I1vIetGv1ijySC56mA2M46p+2+JRj5pf8esVybn6Zv1SS5j/q5zUl63HREM=@vger.kernel.org
X-Gm-Message-State: AFq9FYICA2tIVOnSjd3sBtUIQq8enlkLyb45gVRsoxzL0OX1274grTJ1
	K8NWT7+8U33GZMeJEVOub7SLk/y+rZ/Ig69Wxm6y9lMuswsJzqVDTRWa
X-Gm-Gg: AYBFou3JiOCAq+C1XVZ8ilOaOcaZsbkw3r80l7XFxNz/sNY27Xzen8s5WSOBHVeO5LN
	58cFPYo+AM71gYcnn14Uedbl1H2xmr+s20+Y17oLgZdDdQzE6+hBfdfBj92C5dW8f1F/qLSM5wE
	N7dzw2D7yKd7nCSxVqlNjlOAXIyQD6HolA7qQTafgQzzmTZMnF/yKUm/KItyOvC9zmLTJp3E9LP
	Zbz4YpRZle6QIivpSuaihVildesBHj2PV6+U/8+IkfBuniyhXKjSwcXRQOwK6YcoAN5JGZ4/tlk
	sVr3ajSjTdCcQclOM3qEWiPdQcA3nUgtQgk1vOm3fCzDJ0OJXHSIxQQQMv3tgZY/f+LT26lK3tP
	q2Cf41hysyIMiczTnjcuTrL2MYayTMkPKGyfxvypzhnpi4cJ7BTuMQHGWNWrOMFFpQaSpa8rsZe
	u+dM1NRa+x6sTOAafxztTDV8b/mkdf2GsRU1E/xaQpjvpdbyrgw04LHeTC5ugHWd0Xq68gFEDZN
	/kDnN/e204h+rnQQi/XOMEZlR7i5frezHY2nVS6x9Ifrd8KvsMJUClq3wfPj45nodpVPEijAY2F
	t/rKkBKFPb4Nb5eQuTxDrBw9RxqcOGk2ozWUnGSYVXl58DP3KN67/S5IfA==
X-Received: by 2002:a05:600c:4585:b0:4a7:8fe8:130c with SMTP id 5b1f17b1804b1-4ac1889d5a1mr28432205e9.28.1793345807114;
        Fri, 30 Oct 2026 00:36:47 -0700 (PDT)
Received: from thinkpad.hgw.local ([159.146.110.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b728f9sm1721764f8f.10.2026.10.30.00.36.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 00:36:46 -0700 (PDT)
From: =?UTF-8?q?Yal=C3=A7=C4=B1n=20Can?= <ylcncn@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Brian Masney <bmasney@redhat.com>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] clk: rockchip: rk3066: uart0/1 pclk comes from hclk_ahb2apb
Date: Fri, 30 Oct 2026 10:36:38 +0300
Message-ID: <20261030073638.164388-1-ylcncn@gmail.com>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On rk3066a, uart0 (0x10124000) and uart1 (0x10126000) sit behind the
AHB-to-APB bridge of the cpu bus, as on rk3188, but their pclk gates name
pclk_cpu as parent. Nothing then holds hclk_ahb2apb (CLKGATE_CON4 bit 9),
so it is switched off as unused at late init and both UARTs read back as
all zeros: 8250 autoconfig reports PORT_UNKNOWN for uart0 and a serdev
Bluetooth controller on it (brcm,bcm4330-bt) times out on every command.

The vendor 3.0 kernel uses the same parent, but models ahb2apb as a
divider without a gate, so it is never turned off there.

Make hclk_ahb2apb the parent of pclk_uart0/1, as the rk3188 table already
does.

Tested on an RK3066a board (MK808B, BCM4330 Bluetooth on uart0): before,
CLKGATE_CON4 reads 0x6200, uart0 registers read 0 and ttyS0 is
PORT_UNKNOWN; clearing bit 9 by hand makes it probe as a 16550A. With this
patch uart0 probes as a 16550A at boot, hci_bcm loads its firmware patch,
and LE and BR/EDR scans find other devices. uart1 is not wired on this
board and was not tested.

Fixes: 2c14736c75db ("clk: rockchip: add clock driver for rk3188 and rk3066 clocks")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yalçın Can <ylcncn@gmail.com>
---
 drivers/clk/rockchip/clk-rk3188.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/rockchip/clk-rk3188.c b/drivers/clk/rockchip/clk-rk3188.c
index 318c8ddc8..680c33a62 100644
--- a/drivers/clk/rockchip/clk-rk3188.c
+++ b/drivers/clk/rockchip/clk-rk3188.c
@@ -649,8 +649,9 @@ static struct rockchip_clk_branch rk3066a_clk_branches[] __initdata = {
 	GATE(PCLK_TIMER1, "pclk_timer1", "pclk_cpu", 0, RK2928_CLKGATE_CON(7), 8, GFLAGS),
 	GATE(PCLK_TIMER2, "pclk_timer2", "pclk_cpu", 0, RK2928_CLKGATE_CON(7), 9, GFLAGS),
 	GATE(PCLK_GPIO6, "pclk_gpio6", "pclk_cpu", 0, RK2928_CLKGATE_CON(8), 15, GFLAGS),
-	GATE(PCLK_UART0, "pclk_uart0", "pclk_cpu", 0, RK2928_CLKGATE_CON(8), 0, GFLAGS),
-	GATE(PCLK_UART1, "pclk_uart1", "pclk_cpu", 0, RK2928_CLKGATE_CON(8), 1, GFLAGS),
+	/* uart0/1 sit behind the AHB-to-APB bridge, as on rk3188 */
+	GATE(PCLK_UART0, "pclk_uart0", "hclk_ahb2apb", 0, RK2928_CLKGATE_CON(8), 0, GFLAGS),
+	GATE(PCLK_UART1, "pclk_uart1", "hclk_ahb2apb", 0, RK2928_CLKGATE_CON(8), 1, GFLAGS),
 
 	GATE(PCLK_GPIO4, "pclk_gpio4", "pclk_peri", 0, RK2928_CLKGATE_CON(8), 13, GFLAGS),
 	GATE(PCLK_TSADC, "pclk_tsadc", "pclk_peri", 0, RK2928_CLKGATE_CON(4), 13, GFLAGS),
-- 
2.47.3

