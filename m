Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.218
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794917335;
	b=WcEMX2cGlBjbB2LsrcqM1w0lmB5udm4YMiB4E3q8PbPjJAaHJahu7efIr43uCugnwk9O
	 dOke+hmE9+BeG31jJ8d3fwBaYqydr9kzv1Ek3oZ+cG8aHD4PZLm5cFSMk2gBkTbXkXWC2
	 Hf6bBNw8hHsDcYASmSAJefmlEjTwwC/hm/iQEdC4qPJaR1xrcGnmvMCwHP8APpNl29GTY
	 DYVyF8y8nu9M5h02S21f0KhUa2Z+amENUUKqkqHj743b2hO5ENMYrGX8hDeoTbDXiiofk
	 ny1VEYIHfWE2zfeKIss+UwYNWFMl+DgqUlBrB25Rli1K5U7avymi9fJ2/vCelYaiRwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794917335;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:Received:From:
	 To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=UrKjbD4NIO/z715Re/2+j45MbSZrqVO+AEiZ66MYvko=;
	b=0SaCM4dBwiOJXIzGT+Hh9nJEHFAouL4yBRC740o1E41aiITx3gym08yG1z+jlX5BZ6OL
	 0zzR3MJejKDvfevqcLT21i1rikkxL19jAKGLpxu6mwJOTh4IzeIx0tik8DTQUWqXtVFTi
	 rDsTkHikFYOnWcZo4SinrRtI457n6UKI52CwXiVf1tudJwkpdoa6sSkzBpokkVVRcc9KT
	 Tm/MOpdnW4O+2z8tCnf042gF2AnBCA8rzWiO1QsdUfSEUYwWJtZgAzl6C9RT9H5+kF90u
	 zGoWFaY6Rkz4WOqMIgX9TeYcTxO0dW9/dxrQpmWltRdI4GM/1ifcMW4ACq4zxJf5y0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b="Pd/WVXhN";
	arc=none smtp.remote-ip=113.46.200.218
Received: from canpmsgout03.his.huawei.com (canpmsgout03.his.huawei.com [113.46.200.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C484B606A334;
	Tue, 17 Nov 2026 12:08:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C484B606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=Pd/WVXhN
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=UrKjbD4NIO/z715Re/2+j45MbSZrqVO+AEiZ66MYvko=;
	b=Pd/WVXhNriQ7owynLy+FqunCiygt6MTsPB+77zY8aUTCs8GN6v96bjLJrkXVRvgw5gFmIS4SE
	V+rmlcbE/IdNIVyeDuGVahrLVES7EZFIiDPC0UVhzVPMf0OsM7IU/mTjmgKz2q6wHEZdJRoVb8M
	6EnhWWsr/hGPoqT2Biox5EE=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4jTNlx5ZqHzpStX;
	Tue, 17 Nov 2026 20:07:57 +0800 (CST)
Received: from dggpemr200016.china.huawei.com (unknown [7.185.36.163])
	by mail.maildlp.com (Postfix) with ESMTPS id 27A844058C;
	Tue, 17 Nov 2026 20:08:46 +0800 (CST)
Received: from whupemq100015.china.huawei.com (7.152.185.230) by
 dggpemr200016.china.huawei.com (7.185.36.163) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 17 Nov 2026 20:08:45 +0800
Received: from DESKTOP-62GVMTR.china.huawei.com (10.174.220.94) by
 whupemq100015.china.huawei.com (7.152.185.230) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 17 Nov 2026 20:08:43 +0800
From: Fan Gong <gongfan1@huawei.com>
To: Fan Gong <gongfan1@huawei.com>, Wu Di <wudi234@huawei.com>, Teng Peisen
	<tengpeisen@huawei.com>, <netdev@vger.kernel.org>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman
	<horms@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, Ioana Ciornei
	<ioana.ciornei@nxp.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Mohsin Bashir <mohsin.bashr@gmail.com>, Dimitri Daskalakis
	<dimitri.daskalakis1@gmail.com>, Harshitha Ramamurthy
	<hramamurthy@google.com>, Larysa Zaremba <larysa.zaremba@intel.com>, "Vadim
 Fedorenko" <vadim.fedorenko@linux.dev>
CC: <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>, Zhou Shuai
	<zhoushuai28@huawei.com>, Wu Like <wulike1@huawei.com>
Subject: [PATCH net-next v04 1/4] hinic3: Fix the RX stalls in hinic3_rx_poll()
Date: Tue, 17 Nov 2026 20:08:31 +0800
Message-ID: <85bd868ec35a5963c08193a3c1870aa87004f63d.1794917917.git.gongfan1@huawei.com>
X-Mailer: git-send-email 2.50.1.windows.1
In-Reply-To: <cover.1794917917.git.gongfan1@huawei.com>
References: <cover.1794917917.git.gongfan1@huawei.com>
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
Content-Type: text/plain
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 whupemq100015.china.huawei.com (7.152.185.230)

hinic3_rx_poll() can leave the loop with a completed CQE still sitting at
the head of the ring, or with no WQE left to receive into, and still
return nr_pkts, which is below budget.  hinic3_poll() then calls
napi_complete_done() and re-enables the MSI-X interrupt, which is edge
triggered, so nothing re-arms the queue if no further packet arrives.

Three exits behave this way:

  - a large LRO packet consumed enough WQEs to cross lro_replenish_thld;
  - napi_alloc_skb() failed in recv_one_pkt();
  - hinic3_rx_fill_buffers() posted fewer WQEs than rxq->delta - 1 because
    page_pool_dev_alloc_frag() failed.

The first two leave a completed CQE unprocessed.  The third leaves the
device without a WQE to receive into: it then drops every packet and,
because no CQE is written, raises no interrupt either, so the queue stays
dead until the interface is reset.

Return budget from all three paths so that hinic3_poll() skips
napi_complete_done() and NAPI runs again immediately.

When recv_one_pkt() fails no CQE is consumed and no state is advanced, so
the same CQE is simply retried on the next poll; this is the only way to
make progress, as the completed CQE cannot be dropped.  Likewise
hinic3_rx_fill_buffers() keeps the WQEs it could not post accounted for in
rxq->delta, so the next poll retries the refill and the ring is complete
again as soon as a full refill succeeds.  All three failures are transient
(memory pressure), which bounds the immediate repoll, and i40e, ice and
iavf return budget on a ring refill failure in the same way.  A deferred
refill would need to be serialized against hinic3_rx_poll(), which
retries the same WQEs from rxq->delta, so the poll based retry is used
instead.

Fixes: 17fcb3dc12bb ("hinic3: module initialization and tx/rx logic")
Co-developed-by: Wu Di <wudi234@huawei.com>
Signed-off-by: Wu Di <wudi234@huawei.com>
Co-developed-by: Teng Peisen <tengpeisen@huawei.com>
Signed-off-by: Teng Peisen <tengpeisen@huawei.com>
Signed-off-by: Fan Gong <gongfan1@huawei.com>
---
 .../net/ethernet/huawei/hinic3/hinic3_rx.c    | 22 ++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/huawei/hinic3/hinic3_rx.c b/drivers/net/ethernet/huawei/hinic3/hinic3_rx.c
index 309ab5901379..9a02a7bf6c50 100644
--- a/drivers/net/ethernet/huawei/hinic3/hinic3_rx.c
+++ b/drivers/net/ethernet/huawei/hinic3/hinic3_rx.c
@@ -555,6 +555,7 @@ int hinic3_rx_poll(struct hinic3_rxq *rxq, int budget)
 	struct hinic3_nic_dev *nic_dev = netdev_priv(rxq->netdev);
 	u32 sw_ci, status, pkt_len, vlan_len;
 	struct hinic3_rq_cqe *rx_cqe;
+	bool poll_again = false;
 	u32 num_wqe = 0;
 	int nr_pkts = 0;
 	u16 num_lro;
@@ -571,8 +572,10 @@ int hinic3_rx_poll(struct hinic3_rxq *rxq, int budget)
 
 		vlan_len = le32_to_cpu(rx_cqe->vlan_len);
 		pkt_len = RQ_CQE_SGE_GET(vlan_len, LEN);
-		if (recv_one_pkt(rxq, rx_cqe, pkt_len, vlan_len, status))
+		if (recv_one_pkt(rxq, rx_cqe, pkt_len, vlan_len, status)) {
+			poll_again = true;
 			break;
+		}
 
 		nr_pkts++;
 		num_lro = RQ_CQE_STATUS_GET(status, NUM_LRO);
@@ -581,12 +584,21 @@ int hinic3_rx_poll(struct hinic3_rxq *rxq, int budget)
 
 		rx_cqe->status = 0;
 
-		if (num_wqe >= nic_dev->lro_replenish_thld)
+		if (num_wqe >= nic_dev->lro_replenish_thld) {
+			poll_again = true;
 			break;
+		}
 	}
 
-	if (rxq->delta >= HINIC3_RX_BUFFER_WRITE)
-		hinic3_rx_fill_buffers(rxq);
+	if (rxq->delta >= HINIC3_RX_BUFFER_WRITE) {
+		u32 free_wqebbs = rxq->delta - 1;
+
+		/* Refill stops at the first failed allocation, so a short
+		 * refill may leave the ring without any WQE posted.
+		 */
+		if (hinic3_rx_fill_buffers(rxq) != free_wqebbs)
+			poll_again = true;
+	}
 
-	return nr_pkts;
+	return poll_again ? budget : nr_pkts;
 }
-- 
2.43.0

