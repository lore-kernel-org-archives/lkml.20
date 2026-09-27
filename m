Received: from mail-oo2-f37.google.com (mail-oo2-f37.google.com [74.125.231.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5F473CE4B5
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 21:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.165
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790546394; cv=none; b=YIbwI5WjywNA2dhKvQof5G71U7Qi+T9qxTYytbLwNMql98m+ejLApLfupUbIlo7SgyK2KdTWU75sSr3Z91e5nxkjlucz2LX7PexUSKeNdkgw6/M3M6SWiLlRRoLi4dWack+sWIuaw6CzTf3+rZ9I6BVcvzJNlYCxJuTu2G0pzMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790546394; c=relaxed/simple;
	bh=kRWe3zJ18nPwnbV8Vp/GoUZKSkrJS4rO4y9k1SLXFfM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B6kmiD169WcOurSykYRD0Q1COsTTyzs4nwCFbkk78S0Q+Lyvh4pOm//1x+17f9Ht6I8kHkLkM6QOVceSu/Igk05cfC4d0LbkS83HNW2AKmepP72dBae8B1eC+3EoG5iw/KqK5i9NM9AZU5refJXFvZrfHSUcNNaiZ4ZPCzjIa7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H9Cy4ggc; arc=none smtp.client-ip=74.125.231.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H9Cy4ggc"
Received: by mail-oo2-f37.google.com with SMTP id 46e09a7af769-8137b129131so1604797a34.2
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 14:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790546388; x=1791151188; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wMTK91isCtW7K3W3fSl1Ctwz86tx7+iRah3Eev0qMBA=;
        b=H9Cy4ggc5TpXyWJhhmM2LN5DQpgz+tnnoNGH2grUgzEEVtj4a8l49p0u0Qfm9aNIcq
         sjcvZyEnWyI/xR/k7ZeYogd+oDYkOPlOiV/PTPBniOrdZQbXUSzCqZ/hlSX0AbAR1Xxh
         htfftGb4jWcb3Vkgppy/JKQaNf/adGn8CUyvBtR7ISF++gULFE1m//c02BniDbP+u2wj
         K5nCHHjwLilsmnbS54aJFjHNaJAXKe27z18/Lw1kwts8F8BaPgIEJSO5jNvo3/FUQRhh
         RIRMHLyeKKRBOC3epFDLFc3omp6mhlzq72Jf2dkEw2n2YJPUfce32Xil05kZY681vllk
         zVFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790546388; x=1791151188;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wMTK91isCtW7K3W3fSl1Ctwz86tx7+iRah3Eev0qMBA=;
        b=10H9CRSG35E+KUQtahihX1NEgoKVv/CVGkdmvJ6xppE4/WdndUl9zos7vHC8q9Mq5C
         DHRF5CvwOhVXUwZy2QJKAdUkvsUuKLLwxGMNsagx/PJcLgKBNBRylQY1Qtoi3gYhGxqS
         /+NyLR6Wj674GUuXtEqPDZWAv88xRdwwUXG6/MPw2CKzH3h7YsXx19dhIg8TMyXILtO8
         rbaEMaQJskVNzo7GNgivxU1m9b1T8UNq8AFbDM/vVGZwsNWb7lC9dEeGyaygn4PJ9A2R
         78GACiw7ugD4HYUpX59JlrjR9SHZ8iyWEypvOTrpCSsVwy4jQPV2tBJBKGpflb0zk2eI
         mGmA==
X-Forwarded-Encrypted: i=1; AKwUvBxMu5k4KUYlWkN0xWpR/N/CicIdpFu28bA9s1pGAjxjOnjVNsUFTXqdN8UfkjKj00xUEAnmGyEo59pctJw=@vger.kernel.org
X-Gm-Message-State: AFuF++k+DjMHwU+3gzJUXI+0GIY4e8hgOIaCusnJFFS/dbO95PnqbuSL
	GFWPoRMVJ4WqA3ufaM9id9N8iTeUZZZW/tZJENhtgBdF0p1rPTBgG3bL
X-Gm-Gg: AYBFou04IVwl7OWFhcWbBVcrpP8G36x7umpmXH4fDaC/b6zGCgFdCEs6a7GzswAPQzY
	sNCUNvBqR4x4LhuprTeWpdwskq10i3gyZLc2c7EoWAHPwFWPxU6mlvibTwEw3d7QGr2vVF0MKuo
	U7NxEoRsIwailAD9WgCg2A7aiuP+S1c38xQ7ECriKoRB4bI8jXo9CLJmzwJx/dhOOggKaBsRyiH
	EmZqRCJDbOXD4JDnfZ8t92D8S/Y4lTIcmZvZXuUEb2wX8CHudHbANWdKBCyQwzMSFl2L6pndi1B
	UvQfkGYb6DraRCa77AJgIEieIc/y2WPGkvNsSPsGnFZqfHC+ML3xqeZbbct4s3GXK50p3Chx3uN
	vMesmjbHAKu3KJq0YBDFpQZ0aU0eGNGHiNFyc447V+U217nmqAB9lSNA53PbPH6iWGtujIZ9QUx
	BfN6eBXTmsjsJ9FcqWxtIusMs5XO67ylH8GXvrLxhJD/gLdNCeeCDhDKpLpe3BQ0lRTNq5pthnZ
	+TaXdrsmrbG8xSquiAbsbwtyXKLUhboZxIEn/Ylnj6jfSBCjhxkeBvbazQT/DVN7v/Bsygm4SAP
	1fAk7ev5mCTLtF+yfoDE0WhuNn8GBZk5dManwutDj8gwHP4c3vNXDZ+infsTjQ0ze/k2XNpRYmr
	wdnPDRRYMZ2x87GWfMPON3LnVKwOBAqA=
X-Received: by 2002:a05:6820:81cf:b0:6b9:8413:89b8 with SMTP id 006d021491bc7-6d4411d2841mr11892599eaf.57.1790546388198;
        Sun, 27 Sep 2026 14:59:48 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-81b3de6f7e1sm4874147a34.22.2026.09.27.14.59.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 14:59:47 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 27 Sep 2026 15:59:36 -0600
Subject: [PATCH net-next v5 01/19] net: stmmac: unwind the WoL IRQ after a
 safety IRQ request failure
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260927-submit-stmmac-reset-fixes-v1-v5-1-feec6c14dd06@gmail.com>
References: <20260927-submit-stmmac-reset-fixes-v1-v5-0-feec6c14dd06@gmail.com>
In-Reply-To: <20260927-submit-stmmac-reset-fixes-v1-v5-0-feec6c14dd06@gmail.com>
To: Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Christian Marangi <ansuelsmth@gmail.com>, 
 Tiezhu Yang <yangtiezhu@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Jesper Dangaard Brouer <hawk@kernel.org>, 
 John Fastabend <john.fastabend@gmail.com>, 
 Stanislav Fomichev <sdf@fomichev.me>, Serge Semin <fancer.lancer@gmail.com>, 
 Suraj Jaiswal <quic_jsuraj@quicinc.com>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Joao Pinto <Joao.Pinto@synopsys.com>, 
 Vladimir Oltean <vladimir.oltean@nxp.com>, 
 Ong Boon Leong <boon.leong.ong@intel.com>, 
 Voon Weifeng <weifeng.voon@intel.com>, 
 "Song, Yoong Siang" <yoong.siang.song@intel.com>, 
 Linus Walleij <linusw@kernel.org>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Magnus Karlsson <magnus.karlsson@intel.com>, 
 Maciej Fijalkowski <maciej.fijalkowski@intel.com>, 
 Simon Horman <horms@kernel.org>, 
 =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@kernel.org>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Jose Abreu <Jose.Abreu@synopsys.com>, 
 Yao Zi <me@ziyao.cc>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Richard Genoud <richard.genoud@bootlin.com>, 
 Alastair D'Silva <alastair@d-silva.org>, Maxime Ripard <mripard@kernel.org>, 
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org, 
 ZhaoJinming <zhaojinming@uniontech.com>, 
 Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>, 
 Ding Hui <dinghui1111@163.com>, Linkui Xiao <xiaolinkui@kylinos.cn>, 
 Linkui Xiao <xiaolinkui@126.com>, linux-tegra@vger.kernel.org, 
 linux-sunxi@lists.linux.dev, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

The IRQ setup paths request the MAC IRQ, then the optional WoL IRQ, then
the common safety IRQ. If requesting the safety IRQ fails, cleanup must
release the WoL and MAC IRQs, but not the failed safety IRQ.

The REQ_IRQ_ERR_SFTY case instead frees the safety IRQ and skips the WoL
IRQ. Allocation fault injection during live XDP reopening reproduces a
"Trying to free already-free IRQ" warning and leaves the WoL handler
registered after the datapath resources have been released. A subsequent
open can then fail to request that still-owned IRQ.

Move safety IRQ cleanup before REQ_IRQ_ERR_SFTY and WoL IRQ cleanup
after it. This restores reverse acquisition order for both shared and
MSI IRQ setup, including unwind after failures in later per-queue IRQ
requests.

Fixes: 5c2215167d12 ("net: stmmac: Add driver support for common safety IRQ")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 3ad9252bf6ae..894de213b92f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3828,13 +3828,13 @@ static void stmmac_free_irq(struct net_device *dev,
 			free_irq(msi->sfty_ce_irq, dev);
 		fallthrough;
 	case REQ_IRQ_ERR_SFTY_CE:
-		if (priv->wol_irq > 0 && priv->wol_irq != dev->irq)
-			free_irq(priv->wol_irq, dev);
-		fallthrough;
-	case REQ_IRQ_ERR_SFTY:
 		if (priv->sfty_irq > 0 && priv->sfty_irq != dev->irq)
 			free_irq(priv->sfty_irq, dev);
 		fallthrough;
+	case REQ_IRQ_ERR_SFTY:
+		if (priv->wol_irq > 0 && priv->wol_irq != dev->irq)
+			free_irq(priv->wol_irq, dev);
+		fallthrough;
 	case REQ_IRQ_ERR_WOL:
 		free_irq(dev->irq, dev);
 		fallthrough;

-- 
2.53.0

