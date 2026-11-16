Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.254.49.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794838337;
	b=38FNiAJoAGYSs0Ezj0OIKwITNrOmQlVFuTwneUKBjnybMUvpgwaEzd3xNG+A9PtC9jH9
	 g+MZ5ixgG93dZ+jr6MhoGLxOqSvVGuD20q6MFRJ/hGSyDJ7TrdT8T0rdkZTWedSFclp/v
	 rcFdE5RJY9sTj4XOrzLQ6m9055j63phPZ4mHWQD1UA2tF4FIl0Bl5SLMx3uVYCaRRG9G6
	 6vT+PC/fnZUcdv5Zi12mLkyOJaWK6bJwL4wG8gfyA2RPxRTYkw/79moBbsemqn2EonONN
	 N0Orrzpz0mNw3J7WZVwyRXwqzYapnCl47AHp2LUw8h8Fc2FZ4zgIFCty/qPi3eS5cKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794838337;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-HM-Tid:
	 X-HM-MType:X-HM-Spam-Status:DKIM-Signature;
	bh=957Ic7soB0BvMUR0IDN7Q95mS9l3bu3Thl755irnSdU=;
	b=FJKaAi9tv4KV3XPxqb4YshetpxChMcJf5snnEdj2X4OEzkTeawXbkHrcGN99F9c8ZAl9
	 hHK5gbXMJqNBh5ScXAzdXD9g6AN9/AAxctx2YRPjzTJEztJVqUWGh1uAJs2sjKNdihyA/
	 BVLgP+X+BL9ll6/EkzSwYpvCXz+4A48ZBFaLfCAkIYA9zp3qV8NbQOVD8XYW+uS9jCdi8
	 rxMl96YaOKgNlc+kyagLkdOiHyibuhWUp3GSNFWF6aiUtGGUtyFzKQxIE6uQg8uAfH4dK
	 RFSABM4bQ/Fm7WNNYZh17ZwqC7X1rrtLjoXv3oE3adDk3sFE3oKAEGJxt8df74pV2BA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.sdu.edu.cn;
	spf=pass smtp.mailfrom=mail.sdu.edu.cn;
	dkim=pass header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=eFPSHRem;
	arc=none smtp.remote-ip=45.254.49.197
Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE0E606A33D;
	Mon, 16 Nov 2026 14:12:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8EE0E606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=eFPSHRem
Received: from lgs.. (unknown [101.76.249.61])
	by smtp.qiye.163.com (Hmail) with ESMTP id 54db446d5;
	Mon, 16 Nov 2026 22:12:11 +0800 (GMT+08:00)
From: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
To: Sunil Goutham <sgoutham@marvell.com>,
	Geetha sowjanya <gakula@marvell.com>,
	Ratheesh Kannoth <rkannoth@marvell.com>,
	Subbaraya Sundeep <sbhatta@marvell.com>,
	Bharat Bhushan <bbhushan2@marvell.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net] octeontx2-pf: Fix potential use-after-free in representor teardown
Date: Mon, 16 Nov 2026 22:12:10 +0800
Message-ID: <20261116-c29ba55625-net-otx2-representor@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.43.0
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
X-HM-Tid: 0aa1e4b3803703a1kunme4496ae710dbfd
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDQ0pJVhhMGEMZHktLS0JPT1YeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKS0pVTE1VSU9CVU1KWVdZFhoPEhUdFFlBWU9LSFVKS0lCQ0
	NMVUpLS1VLWQY+
DKIM-Signature: a=rsa-sha256;
	b=eFPSHRemO9gAufTkq4FKTkvWr1XSX5pRYNoFuwndbXZL6WxflKTzSi/usl6oEpbuYFut1LpMZsrLISJW1tZmMwsAvFcmh0+ymGLmf0trhcJEgjtTABTuCpW2TaWOY9OPIekZxcUkyvz3MOinGuP81oU6Otad9VGfDzQ4uaypXNw=; c=relaxed/relaxed; s=default; d=mail.sdu.edu.cn; v=1;
	bh=957Ic7soB0BvMUR0IDN7Q95mS9l3bu3Thl755irnSdU=;
	h=date:mime-version:subject:message-id:from;

The representor private data resides in its netdev allocation.
rvu_rep_destroy() frees that allocation before reading rep->flow_cfg to
release the flow configuration.

Release the configuration while the representor is still alive.

This issue was found by our static analysis tool under development.

Fixes: 6c40ca957fe5 ("octeontx2-pf: Adds TC offload support")
Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
---
 drivers/net/ethernet/marvell/octeontx2/nic/rep.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/marvell/octeontx2/nic/rep.c b/drivers/net/ethernet/marvell/octeontx2/nic/rep.c
index 0f5d5642d3f7..662da7fc3953 100644
--- a/drivers/net/ethernet/marvell/octeontx2/nic/rep.c
+++ b/drivers/net/ethernet/marvell/octeontx2/nic/rep.c
@@ -638,8 +638,8 @@ void rvu_rep_destroy(struct otx2_nic *priv)
 		rep = priv->reps[rep_id];
 		unregister_netdev(rep->netdev);
 		rvu_rep_devlink_port_unregister(rep);
-		free_netdev(rep->netdev);
 		kfree(rep->flow_cfg);
+		free_netdev(rep->netdev);
 	}
 	kfree(priv->reps);
 	rvu_rep_rsrc_free(priv);

base-commit: 2e54b3e187300893688c2c7517894f5d96732e05
