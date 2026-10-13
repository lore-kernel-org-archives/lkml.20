Received: from mta1.migadu.com (out-154.mta1.migadu.com [95.215.58.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3BBC52B1CA
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 18:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791914571; cv=none; b=ko9e66ywrPA5sWC+k8isrmvzcmOI8SjWO9NbNTabjYq0tSjhHV8tzOWVHbCBFYPuNBhuHEoF60RFIMBuwWxI9W4LOktJEnDKKNlKIhv0OCWocfvec5kof/lrU5a+4DF1t+Mtkcl42qSVdHgbXOIlM50Zo/AV/9P8iHjeI3tPb1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791914571; c=relaxed/simple;
	bh=4aoRt+mSadCNqhio833UPcDFBMw6xGwM4ldyVf5OoY4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sOrqRcDNqo5xRtCv6E1xz3++yoweB+jNlRWWyjR6zs/D7LOAlZCIUkgNQR5zSeWcxnr/g46uxITx5vQ9p8T5l0NH70jgvaTswGxJnD8esTdANljzAsXBkYfvSQfHi/b/gjQNt0bwaxkMW3Tie35D7g5/XLFRaju9KWLSKIUOXbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=fWK9weFZ; arc=none smtp.client-ip=95.215.58.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="fWK9weFZ"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=4aoRt+mSadCNqhio833UPcDFBMw6xGwM4ldyVf5OoY4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791914565; v=1; x=1792519365;
 b=fWK9weFZBjSWdQ5/hwHvQyazuJmQdAOv91OuzwXCRQV7hEByMvVcIG6MEewIbSnN78kWuReo
 4YP50Wh5pUBo/WAwFsVCY1LQf+RzZnd5zsrsP0oOhERAS2dp3JzgLhg+Z0fJGCTcQQ++V0QjOTK
 M7VvtThDQJVWJJCH8rmJao1s=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 4c899a02f69580f2;
	Tue, 13 Oct 2026 18:02:45 +0000
X-Mizu-Trace-ID: 4c899a02f69580f2
X-Migadu-Flow: FLOW_OUT
From: wen.yang@linux.dev
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>
Cc: Eric Dumazet <edumazet@google.com>,
	Jesper Dangaard Brouer <brouer@redhat.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-rt-devel@list.kernel.org,
	linux-kernel@vger.kernel.org,
	"David S . Miller" <davem@davemloft.net>,
	Wen Yang <wen.yang@linux.dev>
Subject: [PATCH 11/15] net: optimize napi_threaded_poll() vs RPS/RFS
Date: Wed, 14 Oct 2026 02:02:27 +0800
Message-Id: <d125f9f5c1328c2f4b96e613b4b8ad76837e58dc.1791912669.git.wen.yang@linux.dev>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1791912669.git.wen.yang@linux.dev>
References: <cover.1791912669.git.wen.yang@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Eric Dumazet <edumazet@google.com>

commit 87eff2ec57b6d68d294013d8dd21e839a1175e3a upstream.

We use napi_threaded_poll() in order to reduce our softirq dependency.

We can add a followup of 821eba962d95 ("net: optimize napi_schedule_rps()")
to further remove the need of firing NET_RX_SOFTIRQ whenever
RPS/RFS are used.

Signed-off-by: Eric Dumazet <edumazet@google.com>
Acked-by: Paolo Abeni <pabeni@redhat.com>
Signed-off-by: David S. Miller <davem@davemloft.net>
Signed-off-by: Wen Yang <wen.yang@linux.dev>
---
 include/linux/netdevice.h |  3 +++
 net/core/dev.c            | 12 ++++++++++--
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
index 987177cebe7c..b399773d123b 100644
--- a/include/linux/netdevice.h
+++ b/include/linux/netdevice.h
@@ -3161,7 +3161,10 @@ struct softnet_data {
 #ifdef CONFIG_RPS
 	struct softnet_data	*rps_ipi_list;
 #endif
+
 	bool			in_net_rx_action;
+	bool			in_napi_threaded_poll;
+
 #ifdef CONFIG_NET_FLOW_LIMIT
 	struct sd_flow_limit __rcu *flow_limit;
 #endif
diff --git a/net/core/dev.c b/net/core/dev.c
index cac16e17ccf9..ab012a7eee94 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -4744,10 +4744,10 @@ static void napi_schedule_rps(struct softnet_data *sd)
 		sd->rps_ipi_next = mysd->rps_ipi_list;
 		mysd->rps_ipi_list = sd;
 
-		/* If not called from net_rx_action()
+		/* If not called from net_rx_action() or napi_threaded_poll()
 		 * we have to raise NET_RX_SOFTIRQ.
 		 */
-		if (!mysd->in_net_rx_action)
+		if (!mysd->in_net_rx_action && !mysd->in_napi_threaded_poll)
 			__raise_softirq_irqoff(NET_RX_SOFTIRQ);
 		return;
 	}
@@ -6777,11 +6777,19 @@ static int napi_threaded_poll(void *data)
 
 			local_bh_disable();
 			sd = this_cpu_ptr(&softnet_data);
+			sd->in_napi_threaded_poll = true;
 
 			have = netpoll_poll_lock(napi);
 			__napi_poll(napi, &repoll);
 			netpoll_poll_unlock(have);
 
+			sd->in_napi_threaded_poll = false;
+			barrier();
+
+			if (sd_has_rps_ipi_waiting(sd)) {
+				local_irq_disable();
+				net_rps_action_and_irq_enable(sd);
+			}
 			skb_defer_free_flush(sd);
 			local_bh_enable();
 
-- 
2.25.1

