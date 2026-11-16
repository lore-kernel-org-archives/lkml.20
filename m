Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794831529;
	b=XAo5rW1U881fEYD4LkyRpqql+4om84i+BJOQ5DbBEPqtVWXM7Lu/uftGrhgDvaSuh3NY
	 e1frRbhpmn9qtYrBe+EiNfaOmQ/i5SNry43MBWGP+paPd2VeIJ/cI3+mXbzcHtsYubNSa
	 cVDP30vIOMPvj/RE52FfC0q8KD9z/LTv7Ag3zk8zZQ/fWE4weadCAKh2NB1FJp8rG85O2
	 73Kb46Syox/ls0w6Qi1uj/K4OoEw97RmfuQS73H8DAnkZZaWewsAc+TGUu6IraawoqCbO
	 T+80hph5ltGJY53TOyQE6fvOaMYrYC0zZoA49arhJoETdg1+KyXozGuAOC807kaFDhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794831529;
	h=DMARC-Filter:X-UUID:X-CID-P-RULE:X-CID-O-INFO:X-CID-INFO:X-CID-META:
	 X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:X-User:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=80b3anvnd7MVUWhpZmOk291V+lkwDF/NktOlvSXVTBY=;
	b=N0RSBv56BtHq32pxpOob47R31pwBvSjhk5Z0vJbWZcParb+jl4K8tF8BHu6K2tsN/W4t
	 jZmlkN3jFibMCfw6zd/5RiTtG384sClmHMRIjl6estGtb4z1ZOAwOgvjREkxfNgJFdJzo
	 yTGorKMXH53z2ZGOveI2kQgZCGKWh/yd2aVH78XOi0555LB2RddGeijH7t3lc/gLWiWUm
	 ubcDy/DTJOqVbRGUBivXwkWbjT3qU/hhrjXLuq/6SObnzmu3In4AvIa01dOFNZeR7zDiQ
	 1o6iZojpYut/NUYVofglXoscBmnrWdagG9TKfRlhR+sFmAzy9wopU+3Mf0QnjWQ3Hhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=kylinos.cn;
	arc=none smtp.remote-ip=124.126.103.232
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F27C0606A31C;
	Mon, 16 Nov 2026 12:18:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F27C0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: da7a41bee1b711f19a56ed5b684f684d-20261116
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:f789347c-5fdd-4a3d-bda6-c8de70592941,IP:15,
	URL:25,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:40
X-CID-INFO: VERSION:1.3.19,REQID:f789347c-5fdd-4a3d-bda6-c8de70592941,IP:15,UR
	L:25,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:40
X-CID-META: VersionHash:7db8b62,CLOUDID:2c450e8ed8f441285c2749269fb0360e,BulkI
	D:2611162015321ZIESIX6,BulkQuantity:1,SF:17|19|66|78|81|82|101|102|127|153
	|850|865|898,TC:nil,Content:0|15|50|99,EDM:-3,IP:-2,URL:11|99|82|1,File:ni
	l,RT:nil,Bulk:40,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,
	DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_ULN
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: da7a41bee1b711f19a56ed5b684f684d-20261116
X-User: kuangkai@kylinos.cn
Received: from localhost.localdomain [(116.128.244.171)] by mailgw.kylinos.cn
	(envelope-from <kuangkai@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 1920287571; Mon, 16 Nov 2026 20:18:38 +0800
From: Kai Kuang <kuangkai@kylinos.cn>
To: linux-wireless@vger.kernel.org
Cc: libertas-dev@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Johannes Berg <johannes@sipsolutions.net>
Subject: [PATCH v2] wifi: libertas: reject short monitor TX frames
Date: Mon, 16 Nov 2026 20:18:05 +0800
Message-Id: <20261116121805.326767-1-kuangkai@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <866f6a81c1dfe95b3969361d5ac54f615f060eed.camel@sipsolutions.net>
References: <866f6a81c1dfe95b3969361d5ac54f615f060eed.camel@sipsolutions.net>
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

In monitor mode, lbs_hard_start_xmit() casts skb->data to a radiotap TX
header, skips that header and then copies the 802.11 destination address
from offset 4 in the remaining frame.  The generic length check only
rejects zero-length and oversized skbs, so a short monitor frame is read
past the end of the skb data.  If the frame is shorter than the radiotap
header, the subtraction that computes pkt_len also underflows, turning
the following memcpy() into a large out-of-bounds read of the skb and a
write past the end of tx_pending_buf.

Require enough bytes for the radiotap TX header and the destination
address field before using the monitor-mode header layout.  The check
runs while driver_lock is held and before the TX queues are stopped, so
the drop path reuses the existing "goto free" cleanup; placing it after
the lock is dropped would unlock driver_lock twice and leave
tx_pending_len set to -1 with the queues stopped.

This addresses the same out-of-bounds read that the earlier submission
linked below was meant to fix, but was reverted because it performed the
check after driver_lock had already been released.

Link: https://patch.msgid.link/20260704011140.37639-1-pengpeng@iscas.ac.cn
Signed-off-by: Kai Kuang <kuangkai@kylinos.cn>
---
Dropped the comments.

 drivers/net/wireless/marvell/libertas/tx.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/net/wireless/marvell/libertas/tx.c b/drivers/net/wireless/marvell/libertas/tx.c
index 27304a98787d..23d68df1f61c 100644
--- a/drivers/net/wireless/marvell/libertas/tx.c
+++ b/drivers/net/wireless/marvell/libertas/tx.c
@@ -88,6 +88,13 @@ netdev_tx_t lbs_hard_start_xmit(struct sk_buff *skb, struct net_device *dev)
 		goto free;
 	}
 
+	if (priv->wdev->iftype == NL80211_IFTYPE_MONITOR &&
+	    skb->len < sizeof(struct tx_radiotap_hdr) + 4 + ETH_ALEN) {
+		lbs_deb_tx("tx err: short monitor frame %d\n", skb->len);
+		dev->stats.tx_dropped++;
+		dev->stats.tx_errors++;
+		goto free;
+	}
 
 	netif_stop_queue(priv->dev);
 	if (priv->mesh_dev)
-- 
2.25.1

