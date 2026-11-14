Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794648179;
	b=M4yn0JMt5whplIZyyLbsd4VIGaqfuJ/FZnh8ldPN5AqQYpTcHj+3jKZX76AKpC/u7uAB
	 5dX+55fdap08N+/bHxplxWN89UOSRn0bzNjlq+Q8CNth48nsDESdwqC2VF1RmguUnP2oP
	 bSdTADr68I0TJcC1FRXj8nWFuzLbQMU05EEz5xXJ+kB6zrVq2ks1E+fIlxV3/Rz8HiHgt
	 Siakbq/u5E1iQ+2lzBulqCqeD7dMugEva1DZ2r8My7FmX9Tvla6sLSdt0zi/84gBHjoBF
	 yEtnKbyhxTXeIVuOd8GqtQ1z0WH9kZn2xoaIyLFDnsAXCs0QOS0DyBwo+6j3g8uc7Og==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794648179;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=7VWEQkQ/Bv3OVKC6H48yzpBhMJARpLfAxd56jKkS5oA=;
	b=AkvFxkpEdS6ZInuB/lsIX2BROQVXXzymE3pC4iYXg68KxUKAVSlx5y0kPO4O2PDd+756
	 1aj82ubk/bRMKollEk6zWQqwCsRAeQoUVfkO0BR+L7f642vuT5/lLRjWNiXx6thhBJf55
	 g2+nBR/w/fjzRwep1E2lgWy4ZNIpeIMeqNjE1L705GTvf3fpsUJhGzg3I25ecJPYYqj6P
	 2CfG6VFynShAcrl2MB2XoVp082aL2bJLif4/AcakJljX0U3zdvdYE9QMFUfEAG7YBMe76
	 MvLgUgQOIkt3qNgEBMt5eT5zsci/+1E7omdbMFqAdamz1faSg1XBfsmqkURXuSbFYyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=iccLuKsI;
	arc=none smtp.remote-ip=117.135.210.2
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 532BE606A333;
	Sat, 14 Nov 2026 09:22:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 532BE606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=iccLuKsI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=7V
	WEQkQ/Bv3OVKC6H48yzpBhMJARpLfAxd56jKkS5oA=; b=iccLuKsIuWrxEwaWqq
	4okYBpuvXKa6jPJi0bvBIe8os6bahKBbcz190/oQQi+jzrzVbJWcUIC3FXexehhM
	JIXDtL4sYjs5S2PN3Ebpdl158Dq8Gv9l+YpTkhT0Ah0fi22hbkHtavwlWYFxdf4+
	4hDJsSBIbEfW/JNpC2EwJit+Q=
Received: from 4CV529F122.company.local (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wA3r6IRKPhqiIvzHA--.51340S3;
	Sat, 14 Nov 2026 17:21:32 +0800 (CST)
From: Ding Hui <dinghui1111@163.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	netdev@vger.kernel.org (open list:STMMAC ETHERNET DRIVER),
	linux-stm32@st-md-mailman.stormreply.com (moderated list:ARM/STM32 ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/STM32 ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Cc: tommaso.merciai.xr@bp.renesas.com,
	dinghui@lixiang.com,
	xiasanbo@lixiang.com,
	yangchen11@lixiang.com,
	liuxuanjun@lixiang.com
Subject: [PATCH net v7 1/4] net: stmmac: honor allocation flags when initializing RX buffers
Date: Sat, 14 Nov 2026 17:21:13 +0800
Message-Id: <fb64c1eec47363e697f640834e249a047ca7f58c.1794646293.git.dinghui@lixiang.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1794646293.git.dinghui@lixiang.com>
References: <cover.1794646293.git.dinghui@lixiang.com>
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
X-CM-TRANSID:_____wA3r6IRKPhqiIvzHA--.51340S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7Kw4Dtw1rZrWxWr17WrWxWFg_yoW8GrWfpa
	9rAa4j9r1kXr17Jw4DGw4xuFW3KayUKFW5uw4xGFW3ZF4xKF90qryaqFyUZr1xCr48ZFWS
	qr4jk3s8uF1UAwUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jGNtxUUUUU=
X-CM-SenderInfo: pglqwx1xlriiqr6rljoofrz/xtbC0RzpFmr4KBzCDwAA3Z

From: Ding Hui <dinghui@lixiang.com>

stmmac_init_rx_buffers() accepts allocation flags but stopped using them
when RX buffers were converted to page_pool. As a result, callers passing
GFP_KERNEL still allocate with GFP_ATOMIC | __GFP_NOWARN and cannot use
reclaim to satisfy an allocation.

Use the supplied flags while retaining GFP_DMA32 for hardware without
64-bit DMA addressing. This also allows the resume path to allocate
missing RX pages with GFP_KERNEL.

Fixes: 2af6106ae949 ("net: stmmac: Introducing support for Page Pool")
Signed-off-by: Ding Hui <dinghui@lixiang.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 25894771e9e9..8bd244046195 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1689,7 +1689,7 @@ static int stmmac_init_rx_buffers(struct stmmac_priv *priv,
 {
 	struct stmmac_rx_queue *rx_q = &dma_conf->rx_queue[queue];
 	struct stmmac_rx_buffer *buf = &rx_q->buf_pool[i];
-	gfp_t gfp = (GFP_ATOMIC | __GFP_NOWARN);
+	gfp_t gfp = flags;
 
 	if (priv->dma_cap.host_dma_width <= 32)
 		gfp |= GFP_DMA32;
-- 
2.34.1

