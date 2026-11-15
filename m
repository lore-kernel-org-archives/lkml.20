Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794733508;
	b=5gOGhgaFrI23dkJqT8LgLuOp/sYImMETzKvAOyJOfynWHYhnX0XC+rHl0Bqo5SmzQfGV
	 28h4Ux1kd/2IKc7XzMeXBOrv2l3+aWEYni83loUajl6P44iVKu9pw4DACfRJW10suP9wf
	 hLBAE4dmBNyMpyXGdLXZZrk+m1hps3MDsyLQEG9WUzz2eC7RsRWc+2k/Aj5fRf34uSISi
	 /a8dmgUpxPT2B/3IAtbw8yUMuFp+1TPhWFJ6CrrRZ0lyv42ZeqvW09r+3CaCvwoCKGoix
	 bmxbPjQ5iERYe9iMZ+d/sl5p+s7swir4BGHDn2uI+8sKaDD6Gv0ujraSELZo5vkXAAQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794733508;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=SWwLvN5yU83ZBCHPhXtyXSkK0RHhvvZ/0hRhOydSxnQ=;
	b=1VYVdEm4htwzE3PrwMryu7/XXqICAwp3HfZp5axoR/Iz/Yzkw4zsqBjrs0fcGTXmijNn
	 nou6Pl/jVovgj8q2BqZTqaw3fp3NATmO548699+8iK9Z7WtEboe4kKF7oaoBD8QHnEfuo
	 R6uJjw1e0hvXb1f2OXNcmyyIqKBy/LZsAoLsrh+DK5UH7Egi36LdU8NBmN3YAdT0VnMcG
	 yPIUdor9Q1gW5Y7BpuRW9heKtxM8ru0CR8JKHmBFStj8QLmqV+drAskjnz5lmfvzkGnQX
	 /TQQK8K9EbPWwiGnzecyLvB74XvJbM/dQORfrrVdJECtcIdI3Isbe7WbsNQWz/Fr1MQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H7qQBefS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2A17606A31A;
	Sun, 15 Nov 2026 09:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H7qQBefS
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794733508;
	b=fmn9mMLINAdI3b31dx7fl4/htTvC8ovdMwnsGo2D2qv7wYh61GN0BTP9yyunEFLUV6JX
	 YfqQUM2YKCwntnmRmPad819+BtHyFFvymQYDZ58Pv5HhdHj722CPc+Ak0sAiybpGjQd8p
	 SKAH1Dp8QooPMCzs3MmPTTbXKps9T4Qd1vTmtfnOExnRcSMJOVa8nCBQ6LQEkeZvCaJlJ
	 A0hKb0WzkN/yIWA4i/ilN5ClvMVlol5P2T293rnFjw3CQPS+WJ8hZIFTBXFKXe+lhjOFe
	 DvYWDnjsrZbAufGBSYRU83Q7f0MPYzEXeaTG0nbiMY334qCQCaQEYVX123exbNiVIeA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794733508;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=SWwLvN5yU83ZBCHPhXtyXSkK0RHhvvZ/0hRhOydSxnQ=;
	b=SRV+lHk/qJNEgLwUf6p0peY74acWbnMmLBsv0Jq1MDPfSC/AVgUdW7sWUoY53QCOFbxD
	 X5IKHOkA1meRX/1TupSynlWPJUr0PYAuabwUEvKdZUuopvTCYQsRFGAL8MQCjAEYMFtXB
	 y2Ae+b/1bsY7/KwY0LtEWbhtdbTaB60M1IaY41AdOzhZG9mx6bYDNY6gN4tLy9bw+M7va
	 EzogctxgiX9PCGXTJRbmGStXIT4p9S7BuMx+2DAYHyU5tlkwoN2SHFLsq4tO0wgSddGRX
	 qbN2ZvwO5ic4iVQMSB9rcfRr5aVsN5r8NHus12HbJJQuGh/iCdOONwqR0C7gnH9wHCg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D830E1F000C4;
	Sun, 15 Nov 2026 09:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794733508;
	bh=SWwLvN5yU83ZBCHPhXtyXSkK0RHhvvZ/0hRhOydSxnQ=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=H7qQBefSjjR2IwpJigL66Q2xaCI88wcALhDKH2LL147sCbE2I3/p89S9IU4R+Agro
	 jwKbSp9q0ZVxkdSbtK4bJLtIL4Qa1BfK/n6g34vMnD3k+I26eI6NqBf+WaDhGWjXsG
	 1v16zPzhy9EMx2e8V7KG+W2GAozwc7Ubr7+Ucg5Mh0ZkW0DzMIUaWPwuhu95WRYLZQ
	 ar/2dsn+waVeh/rLXQXGpjmr6iBqn/TRErPKVdIyMVeD3dqiBrgKkypTMVOE6AWuOY
	 JSttsKOP81SA8edIgnX/Td/1zzzexeXiSeQqw+fafqh2S/xTVVFLXZtKyA5de6bue0
	 aS5d9aTCc9fwQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 544294A021;
	Sun, 15 Nov 2026 09:05:07 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Sun, 15 Nov 2026 09:05:07 +0000
Subject: [PATCH net-next v3] net: stmmac: dwmac-sun8i: Fix use-after-free
 in the MDIO mux error path
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
Message-Id: <20261115-sun8i-emac-mux-uaf-v3-1-c69d4189539d@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33NQQ6CMBAF0KuYrh1Dp7FUV97DuCh1CjVSDKUNh
 nB3C25YGJc/M//9iQXqHQV23k2sp+SC63wOYr9jptG+JnD3nBkWKDnnCCF65YBabaCNI0RtgVd
 aqSPykyViufjqybpxRa/M0wCexoHdvpcQqweZYTGX38aFoevf637ia+PfVOLAQRRKU0nSGouXu
 tXueTBduw4k3BLiJ4GZkFgIKWWFUpVbYp7nD9R3qGETAQAA
X-Change-ID: 20261112-sun8i-emac-mux-uaf-1ba885219fee
To: Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com, 
 linux-kernel@vger.kernel.org, Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794733507; l=1719;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=+y0GcY4/PVmv5CEIOUChNpzRjsd6qAFwqN8yUicaQ8g=;
 b=WGxB9GPqMj1G3uOyPfh5GdwBrWsH+43WV1Oy91ghXj3UHSYqtPOjYOO9ZUbcawnPfHKKSQZIV
 wqJkLbTlGtqAaq9v9D/6boTgG+ufsgKqVVr5mtNEHt4mj2Rq7hd9I9S
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

If mdio_mux_init() fails after the internal PHY was powered, the error
path releases rst_ephy and ephy_clk before sun8i_dwmac_exit() uses them
to unpower it. Unpower the PHY first, as sun8i_dwmac_remove() does.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
Found by Sashiko's review of another dwmac-sun8i series of mine.
Build-tested only (arm64 and arm, W=1): I have no board with the
internal PHY (H3, H5 or V3s), so the error path was not exercised.

Developed with Claude (Anthropic); I reviewed it.
---
Changes in v3:
- Drop the Fixes tag (Andrew Lunn)
- Shorter commit message
- Link to v2: https://patch.msgid.link/20261113-sun8i-emac-mux-uaf-v2-1-6203666b2687@gmail.com

Changes in v2:
- Target net-next instead of net, drop Cc: stable (Andrew Lunn)
- Shorter commit message
- Rebased onto net-next
- Link to v1: https://patch.msgid.link/20261112-sun8i-emac-mux-uaf-v1-1-308ae7e6fcf2@gmail.com
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
index 2ece7ba9dd73..898560e8e95c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
@@ -1245,6 +1245,7 @@ static int sun8i_dwmac_probe(struct platform_device *pdev)
 	return 0;
 
 dwmac_mux:
+	sun8i_dwmac_unpower_internal_phy(gmac);
 	reset_control_put(gmac->rst_ephy);
 	clk_put(gmac->ephy_clk);
 dwmac_remove:

---
base-commit: 6964ff21c5d8b75649211a52dbfd92753e605649
change-id: 20261112-sun8i-emac-mux-uaf-1ba885219fee

Best regards,
--  
Arun Iyengar <aiyengar1990@gmail.com>


