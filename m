Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794649874;
	b=k7WYYF+eWMLdCSAbSRi+ekYdG7j64r5+NqkiYd83BL2ffiyyWmxNTPraCFux1EYFqj+b
	 yD70iPMbsfi5ML7pAV3BUjaYSQaLsOYUY06nNWcWejE3meD9EXhMWUih+2FcwFK3ZNRCI
	 +nz/BX3bM9cPiYixzufvwKvLLXSMnhshQI0i4AL4m2XG94ZenankJF07xjZztYjtWwz74
	 GX6lPPLtymenJnBp4xt4UIyzJdRq96tLOXoBdGe1/9lnd77PZ8G6tcu+9arQBpWc9fVaU
	 9CV4AfY8M3FfXgn3EzP5RHMqIqmxYRFovvJqclgocJ414HJ3pQ3TkAY4FGzQsY05vtw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794649874;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=DI/YxUPWTQkp+uQydFoBmrbMkDCZ52oeTpl1hDzDN5k=;
	b=DobGj+G45oWRkGQUwBJGrMN346+j3u1Yu/Pt6S3SWj+P+Gilrl4+j3MV0nQK55Grmsw3
	 8hOtNNstxOfXjoiUs9Fmi0dfNDQBWyjvdZ3KaQb1hlCgR6kF05T3hScWoDKKWOAfGqc0/
	 CCobrr6v8iDg+/J1+VJRNwl88lrL/gNqLnhYow/DtFI5IKfD5iFr6Jy/ZiH9aTsu3lHVR
	 uGbSvqBjAzdx2tCQfIiuC3pxfxabqn3VHZn4x/CZrraJtrF6PgNbUCW0r6g2ZJNGeeU0P
	 nEccsEgDEPwU1Tq9vtuQFupxcVf36Q3eeVjPFCf/JOqTE7JHmO2GJaO7IQEomBleRSQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TFUAIsUs;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80FAD606A323;
	Sat, 14 Nov 2026 09:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TFUAIsUs
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794649874;
	b=aB072sVYml2j/9PzbNuMay7NdNBOQFsQ9lwsP2m5jA+CEX7B0n9tv8tVQVxpZyoMMiPH
	 nJTns77sK1TTRYO8oePSEcNK3BGHCGzay/PzQmUd42PIc5BvEGll/nwGwdMGjh3D75aQM
	 ZpgDGP6dCR171gzKYOBPT5NqHCevCUqcsHXrdzRJG+2qjdia9F/Y5nD6y9ueQTuHb5xyQ
	 /MWiBIIeknohyHb1cvZY5t4wTJvRJB53sL8LisxC3yopEuVBweVGDDxO8vPk1PIPZg+IP
	 zEcAD2QCG5scTfbbxp/5hndabOBzm22yBLgct7xgvg6Tjhp4lvhSchhEL5CqHJxBpeg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794649874;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=DI/YxUPWTQkp+uQydFoBmrbMkDCZ52oeTpl1hDzDN5k=;
	b=MbZyxdY5mH4VQzVWJyXP9cmvf4QDt4b4L7cktxTWkMSaQKpaTxqthBMx98ql7bChBwr3
	 f/nlrMOYQHDeubRPDB9Gj+cd5d836rjfP5EUs2jj2Yyla2zyJnUKsg9XqRqfin/wqyAfJ
	 jI7D1TBK2Y+QU4cqdXeXCYkB5BW1WO9eNEj8gmmxEL4+YpGYlKjEhcJO5gW9ene2KIYLy
	 P099/RfJNseKzNAiiTWv7b29bZ61eragYxNwFx95wiooqBZRJImqi1Gr9XFhlEt5yLxnr
	 bwTM9WxtTXmrWd7dtL3kqKLglZuBkXhU5tFweGzhB2LH1bfydnX+y+eXe5GYBmm7ysQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7AB9F1F000C4;
	Sat, 14 Nov 2026 09:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794649874;
	bh=DI/YxUPWTQkp+uQydFoBmrbMkDCZ52oeTpl1hDzDN5k=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=TFUAIsUsfCi9+1bORE6/GjSikOA7bvIp8oYShHc217l8aWQ0uaWPpsKw7pBycB91T
	 ow64SJz4p3LrzC/rzOyxf0oQQSXmXER1z3jsLQstUhcBiqYX+guBPEX6MxdrG3GbKi
	 U7UtpgGYUXFbq5B3Z6fMAtrzM39xFrpx1kAdr1YSv1aPACLQ7Zc3y4uR+WmKwYrEQ6
	 tzDgirUcFADbr3yR9A7GF0z4YXfQs6Jom3LfdeOOXfRHYzu1rbivMt8q428nmFkNZ8
	 SoBTWschBWWwP+73jr264wamr1WsnXlTNNhY4VNHVEPwlEx5WgGmHhvJsY3OSxkloP
	 5qD3fxcQFdqMA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id C1F9E49D22;
	Sat, 14 Nov 2026 09:51:12 +0000 (UTC)
From: Han Gao via B4 Relay <devnull+gaohan.iscas.ac.cn@kernel.org>
Date: Sat, 14 Nov 2026 17:51:11 +0800
Subject: [PATCH net] net: macb: limit jumbo frames to the RX buffer size
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
Message-Id: <20261114-macb-jumbo-jml-v1-1-f501395eaf9e@iscas.ac.cn>
X-B4-Tracking: v=1; b=H4sIAA4v+GoC/x2MQQqAIBAAvxJ7bsEkivpKdEjdaiUttCKQ/p40t
 znMJIgUmCL0RYJAN0fefZaqLECvk18I2WQHKWRTZdBNWqG9nNrRug3rzohWC206IyFHR6CZn38
 4gKcTxvf9AKLgem9lAAAA
X-Change-ID: 20261111-macb-jumbo-jml-49d07c0cd9d2
To: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Punnaiah Choudary Kalluri <punnaia@xilinx.com>, 
 Harini Katakam <harini.katakam@xilinx.com>
Cc: linux-riscv@lists.infradead.org, Han Gao <rabenda.cn@gmail.com>, 
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jingkun Zheng <zhengjingkun@iscas.ac.cn>, Han Gao <gaohan@iscas.ac.cn>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794649871; l=2770;
 i=gaohan@iscas.ac.cn; s=20261021; h=from:subject:message-id;
 bh=Ba0EhmfC/eB3reG4OHAFgVQBuZCONa6EOSwuE8i/JWE=;
 b=cZLObGEtUvp/SP5azLnWEj3cPd4p6jtuyHY1VunFYe63DcPfgFR0aZxmd+G9sG4dRoq1cwPJa
 X8PUu1Yfw47BErR31njhHCIlQ/ubs/5ETSdbgWCsByhmmFc+WvGq+fU
X-Developer-Key: i=gaohan@iscas.ac.cn; a=ed25519;
 pk=J8WHEK3filS86QaCaIHDGafqhxKyQ4K7+vFgRirTIiY=
X-Endpoint-Received: by B4 Relay for gaohan@iscas.ac.cn/20261021 with
 auth_id=1262
X-Original-From: Han Gao <gaohan@iscas.ac.cn>
Reply-To: gaohan@iscas.ac.cn
Content-Transfer-Encoding: 7bit

From: Han Gao <gaohan@iscas.ac.cn>

GEM variants with MACB_CAPS_JUMBO accept frames up to jumbo_max_len
regardless of the MTU, but the RX buffers are sized from the MTU. A
frame longer than one RX buffer is split over several descriptors and
dropped by gem_rx() with "not whole frame pointed by descriptor".

Set JML from the RX buffer size in macb_configure_dma(), so that it
follows MTU changes and longer frames are dropped by the MAC instead.

Fixes: 98b5a0f4a228 ("net: macb: Add support for jumbo frames")
Reported-by: Jingkun Zheng <zhengjingkun@iscas.ac.cn>
Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
---
Seen on a SiFive FU740 with the default MTU: every jumbo frame on the
network caused two "not whole frame pointed by descriptor" errors.
---
 drivers/net/ethernet/cadence/macb_main.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
index 5ad0e32e2b4001c37e230a2eb7badb468b14ab57..e7c9bb24c377babc8dfd57e82ebf55a8e996873d 100644
--- a/drivers/net/ethernet/cadence/macb_main.c
+++ b/drivers/net/ethernet/cadence/macb_main.c
@@ -3240,6 +3240,18 @@ static u32 macb_dbw(struct macb *bp)
 	}
 }
 
+/* Longest frame that fits in a single RX buffer */
+static u32 gem_jumbo_max_len(struct macb *bp)
+{
+	u32 len = bp->ctx->rx_buffer_size;
+
+	/* Frame data starts NET_IP_ALIGN bytes into the buffer without RSC */
+	if (!(bp->caps & MACB_CAPS_RSC))
+		len -= NET_IP_ALIGN;
+
+	return min(len, bp->jumbo_max_len);
+}
+
 /* Configure the receive DMA engine
  * - use the correct receive buffer size
  * - set best burst length for DMA operations
@@ -3286,6 +3298,13 @@ static void macb_configure_dma(struct macb *bp)
 		netdev_dbg(bp->netdev, "Cadence configure DMA with 0x%08x\n",
 			   dmacfg);
 		gem_writel(bp, DMACFG, dmacfg);
+
+		/* Jumbo frames are always enabled, so limit their length to
+		 * what fits in one RX buffer. Longer frames would otherwise be
+		 * split across several descriptors and dropped by gem_rx().
+		 */
+		if ((bp->caps & MACB_CAPS_JUMBO) && bp->jumbo_max_len)
+			gem_writel(bp, JML, gem_jumbo_max_len(bp));
 	}
 }
 
@@ -3422,8 +3441,6 @@ static void macb_init_hw(struct macb *bp)
 		config |= MACB_BIT(NBC);	/* No BroadCast */
 	config |= macb_dbw(bp);
 	macb_writel(bp, NCFGR, config);
-	if ((bp->caps & MACB_CAPS_JUMBO) && bp->jumbo_max_len)
-		gem_writel(bp, JML, bp->jumbo_max_len);
 	bp->rx_frm_len_mask = MACB_RX_FRMLEN_MASK;
 	if (bp->caps & MACB_CAPS_JUMBO)
 		bp->rx_frm_len_mask = MACB_RX_JFRMLEN_MASK;

---
base-commit: aa40afa831ebfe45e40a23721711059f2ac584d4
change-id: 20261111-macb-jumbo-jml-49d07c0cd9d2

Best regards,
-- 
Han Gao <gaohan@iscas.ac.cn>


