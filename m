Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794814762;
	b=Wye6nI6Mc+T6d+Nh2F1fShQz4muNzzCgzj/ivoKXmdrSa1GYSJqFSotIddImz9h3tdE+
	 fxGQIg+tBY632AvR5jKR+EwEglEh7QrYgQzC9ICHe7xfgUR0K2n3Uurmv481w7TdwTtNn
	 TB/7dGM8dJM4iFJWBSQpa49/CpfsIrlxjRpPb2bdsaxYCWP1Ut7oKCw54/DDTrCvGzMct
	 CaGVIKBDPZe02U9J5zngBSFMiDsEXoslbu/xizpuEpXh7Ed/PXYDwAiIExcYBhy9lYSI4
	 Lwvfbo0RiyQVPtA921brcVv37a4i9n+UlB6bFwqUU/CPNkyUiiT+2yyOvi4nRLgmnBw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794814762;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=0inTc72tNtgjCZaCWeW8u0+OSffO1GI14ZtqPEL3d8g=;
	b=mFkM0hVXf3cmRH3IJFkvO1oaFlxwbsWblS2LB6r2dPHGoRrUYvxni8qCUgPhrtugNImq
	 2CN9wldbxgt/Td+MypK0rNv51S2DR/SQ6U/MZ+mv00AvWg1SsgqlZeL+YnIbb6MipdTml
	 qvwB20KSzYpPgS7Y08CkONzJBaJSDc1Ip9MpdmCHieoZ0IfbHkVEH+ZKa8oPbV1bBNqKT
	 tX+6ZYTqgRzZEPSCqWKzZpZMEC1hiM1NyH222QO2tsrds1xysvxvzUNF+dni4ByTaJbKr
	 VaEB5NP/eJmdak+ZuLze12r2XRUtA30Q6aHa92hPY2UYufC09XjRDDzvLaM20uOL/nQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jz85i1Za;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83BEF606A32C;
	Mon, 16 Nov 2026 07:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jz85i1Za
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794814762;
	b=zwJNo/crojmmMPXSrZtxnZvdEeZXczLuz2bPpEKWO7W+SemucnZiCkdwqHVjv2bMWVSp
	 w8PHHSJY3VYmtKqNpfPAMPVpV89COuQuslBA5xELu8VueNRJ3SjA7qIoEE0jNRPWs5VYo
	 HZ/x2T0IS9QMXIUL7K0OO7Ft/TH+TBtjq1Nsx4/n1vKnAD/2wVN2yKY47fzr72fBNqeLN
	 ejsRL3Gu5oKKwtzsrSbFyBpievNuQ+GBLlGjuH8fbLfHHDp6LUXT/TDl515eu8OEIPPJk
	 TMdxdu1tztoOlha75Vfc/+6ySJ8dxagiJOzJHL30EKX7U1kLngpW5tCnSlCPkuJpXgg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794814762;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=0inTc72tNtgjCZaCWeW8u0+OSffO1GI14ZtqPEL3d8g=;
	b=BuAL3PLuol8g8ZcJ4jA319HbruWFqF8nL+HRZYsM7qvA2Jqi/FOAnNqNTrLSExG3VN1V
	 Os+LowEOh3uSshtwR17+7ToPtgQIm2t5PQH7tsG/pjPQCp89Ubc2eyJPY9pfc9qtA/e/L
	 L7iYLVGzJiAdJPmO2iqXxdfHvceFdcBlnW+mug64HmgjIZPXglpuPfkdQgQ+WiiengdSf
	 wUJncJHLlgvbkLMdFdV2UhnMjYt66vROZPvXqjSduiBUlzVSX9wNvCyk/hRTM1fDVmY8x
	 djgMPaqQjzVY9boAKYD+ksNma0NoFbn1Dfc806x9lgnGsukr6N6SXoP8yMJUlEe2oKQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 636D81F000C6;
	Mon, 16 Nov 2026 07:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794814762;
	bh=0inTc72tNtgjCZaCWeW8u0+OSffO1GI14ZtqPEL3d8g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=jz85i1ZaLPl0AvbORyPD++PuuQ3meDo/WLKNS8znESi0oqL4Gl8a71K3FpSr7wRC1
	 /OV4e0PHqYUBtMKPSeaxXV7Qe4gpZ4ecZzrJMs6JtTIecbo7yrldTPyPbaKULvgaM6
	 1cUhI6d7zZ4u/RXOt4dl2XfJbXJ5vWECREakmGkOxJqQ60vdYKQjMOoT1gS+TaDe9J
	 iaEgLOBp/cPVGVGln0Pl/Uw2+nL/m+oBM8iH+eQQEUtq8Lr4ESTme4TUCmc0vD1Btt
	 Cg2FbAV3sT8fvyNmQS+LqTY5F7cGc65rzHXLptVS7r4f1yIkj96kPaw5K+uV0soFbR
	 +TygldjIOJ24Q==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id DCD654A383;
	Mon, 16 Nov 2026 07:39:20 +0000 (UTC)
From: Cunhao Lu via B4 Relay <devnull+1579567540.qq.com@kernel.org>
Date: Mon, 16 Nov 2026 15:39:15 +0800
Subject: [PATCH net-next v3 2/2] net: stmmac: dwmac-rk: Add RK3572 support
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
Message-Id: <20261116-add-board-ok3572-c-net-v3-2-a957fdcd9c7a@qq.com>
References: <20261116-add-board-ok3572-c-net-v3-0-a957fdcd9c7a@qq.com>
In-Reply-To: <20261116-add-board-ok3572-c-net-v3-0-a957fdcd9c7a@qq.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 David Wu <david.wu@rock-chips.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Cunhao Lu <1579567540@qq.com>, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794814757; l=3142;
 i=1579567540@qq.com; s=20261015; h=from:subject:message-id;
 bh=bJZr2jTjg4023AjgAd/Zj2CWJraJeUFEaOgI88A3Cbk=;
 b=VvzUkw46av484OhGEDZykqHAl2X4+zVTPUXUav8AP9Bgwx90r5ZL0plEwVBEG6fPaiZ/7k5NO
 5QWb+CV7w6qCX7NWqgQxafOpkbPrhcyhs1Uw++0b4ew3Q0/qGwPUf3e
X-Developer-Key: i=1579567540@qq.com; a=ed25519;
 pk=sUTWrzlIwT4C7ctjNfVZAzzg0G7QUn2XxRGpYsw4RtM=
X-Endpoint-Received: by B4 Relay for 1579567540@qq.com/20261015 with
 auth_id=1177
X-Original-From: Cunhao Lu <1579567540@qq.com>
Reply-To: 1579567540@qq.com
Content-Transfer-Encoding: 7bit

From: Cunhao Lu <1579567540@qq.com>

The RK3572 has two GMAC controllers with separate mode and clock control
registers in the PHP and NVM0 GRFs. RGMII delay lines are configured
through the IOC.

Add the register layout and delay callback for both controllers so the
Rockchip glue driver can configure their RGMII and RMII interfaces and
select the appropriate clocks for each link speed.

Signed-off-by: Cunhao Lu <1579567540@qq.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c | 53 ++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
index a37df5767d84..c9d8d8bf51f7 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
@@ -900,6 +900,58 @@ static const struct rk_gmac_ops rk3568_ops = {
 	},
 };
 
+#define RK3572_VCCIO0_3_VO_IOC_CON1		0x10608
+#define RK3572_VCCIO1_2_4_VI_IOC_CON1		0x12604
+#define RK3572_VCCIO5_6_IOC_MISC0		0x14630
+#define RK3572_PHP_GRF_GMAC0_CON		0x0070
+#define RK3572_NVM0_GRF_GMAC1_CON		0x0020
+
+static int rk3572_init(struct rk_priv_data *bsp_priv)
+{
+	switch (bsp_priv->id) {
+	case 0:
+		bsp_priv->gmac_grf_reg = RK3572_PHP_GRF_GMAC0_CON;
+		break;
+	case 1:
+		bsp_priv->gmac_grf_reg = RK3572_NVM0_GRF_GMAC1_CON;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	bsp_priv->clock_grf_reg = bsp_priv->gmac_grf_reg;
+	return 0;
+}
+
+static void rk3572_set_to_rgmii(struct rk_priv_data *bsp_priv,
+				int tx_delay, int rx_delay)
+{
+	u32 val = GRF_FIELD(14, 8, rx_delay) | GRF_FIELD(6, 0, tx_delay) |
+		  GRF_FIELD(15, 15, !!rx_delay) | GRF_FIELD(7, 7, !!tx_delay);
+
+	if (bsp_priv->id == 1) {
+		regmap_write(bsp_priv->php_grf, RK3572_VCCIO0_3_VO_IOC_CON1, val);
+		regmap_write(bsp_priv->php_grf, RK3572_VCCIO5_6_IOC_MISC0, val);
+	} else {
+		regmap_write(bsp_priv->php_grf, RK3572_VCCIO1_2_4_VI_IOC_CON1, val);
+	}
+}
+
+static const struct rk_gmac_ops rk3572_ops = {
+	.init = rk3572_init,
+	.set_to_rgmii = rk3572_set_to_rgmii,
+	.gmac_phy_intf_sel_mask = GENMASK_U16(11, 9),
+	.gmac_rmii_mode_mask = BIT_U16(3),
+	.clock.io_clksel_io_mask = BIT_U16(7),
+	.clock.gmii_clk_sel_mask = GENMASK_U16(6, 5),
+	.clock.rmii_clk_sel_mask = BIT_U16(5),
+	.clock.rmii_gate_en_mask = BIT_U16(4),
+	.supports_rmii = true,
+	.php_grf_required = true,
+	.regs_valid = true,
+	.regs = { 0x29d20000, 0x2a040000, 0 },
+};
+
 /* VCCIO0_1_3_IOC */
 #define RK3576_VCCIO0_1_3_IOC_CON2		0X6408
 #define RK3576_VCCIO0_1_3_IOC_CON3		0X640c
@@ -1720,6 +1772,7 @@ static const struct of_device_id rk_gmac_dwmac_match[] = {
 	{ .compatible = "rockchip,rk3506-gmac", .data = &rk3506_ops },
 	{ .compatible = "rockchip,rk3528-gmac", .data = &rk3528_ops },
 	{ .compatible = "rockchip,rk3568-gmac", .data = &rk3568_ops },
+	{ .compatible = "rockchip,rk3572-gmac", .data = &rk3572_ops },
 	{ .compatible = "rockchip,rk3576-gmac", .data = &rk3576_ops },
 	{ .compatible = "rockchip,rk3588-gmac", .data = &rk3588_ops },
 	{ .compatible = "rockchip,rv1108-gmac", .data = &rv1108_ops },

-- 
2.34.1


