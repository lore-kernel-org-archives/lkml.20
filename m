Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794648184;
	b=eIXzMz3A3eZjQaPCd/v+YRZHUFlMunkQkREezCYXP3iIU6wBkLs0xPdY4W9NBxOA1uKc
	 7j9VAsPzucbhYnMm4RcNGw5lAB0AgHo11dn/jxCRTmroN13/lbmj1BdsBp0cqTQgVYSYy
	 P8NWK80zuFNmiJmRMQCVpr8re8yUP0ONgU0LTNIu2NVyyar8b0p7MmILxRGijAX44cfo+
	 kos/YEmQJvOo5sY8gTUtB3VuSCSwQRqa2X3X5GfnEfDdVUTiAJ+bCxH1jUSd+EhKPAMAz
	 fJbIWDjrlcLwNCmRIoGIqQ/SW4p8RsBHjDUdD2ljJ5SYJei0XMflVN0yQsZtXoOKpkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794648184;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=fi+MFG63/XkyO9Z7kltTJvTwM41Amb5H9DYZXImCVMw=;
	b=OJ3BZ5hvD+b3aon81FvyWNQ699eNHhtz+FzF1TcdVjfufq7ryw2QVNgaZhQ6QCYgBbt5
	 2tKFTJOOwW73ZdvgEiGbXP4G1ndBZ6ar66UFqSU90Jx3NCgsPsJHeT/jXKZfb9gL0BYok
	 Af8j5P5yWHmkPzHsROnO0mq5JvmxLKFsfeZgHWuddlHIn2gbCRYyAQE+8jJu8lHqkgS3I
	 g2MKSiv4Y9A24UYCKdSLT+ivTiD7t/98J8YNwXLwauvQ6CKZd+lhi9ykkqdRJvWPvPmcK
	 HfQ77NfawX8pSW5QdRM3H+3FWgOZDmvDeUKyL+kbdOhq4qBBxgt4S5vDsbamb9Clb9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b="lGnfAU/O";
	arc=none smtp.remote-ip=220.197.31.3
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDEFD606A338;
	Sat, 14 Nov 2026 09:23:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDEFD606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=lGnfAU/O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=fi
	+MFG63/XkyO9Z7kltTJvTwM41Amb5H9DYZXImCVMw=; b=lGnfAU/OV3PP8RhSPw
	/dXqtLo3u/42oT2Xf1xgYshdz3Fki207B2r9Rp4w1lDMhsb/qS2B3sMp8/z9v6O3
	tFhva7qH2mOKQ3G+5hw5NYUrLAQ7n5iZx+hEx3fvh4R3hGfUMTyuFvirR9xQBlC5
	6c1OlKdd10FDkwlKWm4o/Ja2I=
Received: from 4CV529F122.company.local (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wA3r6IRKPhqiIvzHA--.51340S6;
	Sat, 14 Nov 2026 17:21:40 +0800 (CST)
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
Subject: [PATCH net v7 4/4] net: stmmac: restore the XSK TX pool on resume
Date: Sat, 14 Nov 2026 17:21:16 +0800
Message-Id: <d24e63cbbe11429e6a51e4a14ac1e6828c4d0fd9.1794646294.git.dinghui@lixiang.com>
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
X-CM-TRANSID:_____wA3r6IRKPhqiIvzHA--.51340S6
X-Coremail-Antispam: 1Uf129KBjvJXoW7uF48XF1DCw48JrWkAFy7KFg_yoW8ArWxpr
	Z7Cayqywn7tF4xZws8Gw40vFyFyayftF45ua4xJanxZFW7KFZIqr1YvFWYvry8JrWkXr13
	trWjkan8C3W5CrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j6YL9UUUUU=
X-CM-SenderInfo: pglqwx1xlriiqr6rljoofrz/xtbC8wTrGGr4KCSjPQAA3E

From: Ding Hui <dinghui@lixiang.com>

When suspend interrupts AF_XDP zero-copy transmission, resume releases
outstanding TX buffers through dma_free_tx_skbufs(). If it completes XSK
frames, that helper also clears tx_q->xsk_pool even though the socket
remains bound to the queue.

The resume path does not run the TX ring allocation routine that normally
sets this pointer. Consequently, stmmac_tx_clean() skips XSK transmission
and a running TX-only socket can stop sending after resume, despite the
link coming back up.

Restore the TX pool from the queue's existing XSK binding after releasing
TX buffers and before restarting DMA and NAPI. Keep the buffer cleanup
helper's behavior for teardown unchanged.

Fixes: 132c32ee5bc0 ("net: stmmac: Add TX via XDP zero-copy socket")
Signed-off-by: Ding Hui <dinghui@lixiang.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 1508cf08f03b..550a0bd647e1 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -2277,6 +2277,9 @@ static int stmmac_resume_descriptors(struct stmmac_priv *priv)
 	for (queue = 0; queue < priv->plat->tx_queues_to_use; queue++) {
 		stmmac_reset_tx_queue(priv, queue);
 		dma_free_tx_skbufs(priv, dma_conf, queue);
+		/* Buffer cleanup may clear the pool; the socket remains bound. */
+		dma_conf->tx_queue[queue].xsk_pool =
+			stmmac_get_xsk_pool(priv, queue);
 		stmmac_clear_tx_descriptors(priv, dma_conf, queue);
 	}
 
-- 
2.34.1

