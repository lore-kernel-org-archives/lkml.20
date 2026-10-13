Received: from mta1.migadu.com (out-204.mta1.migadu.com [95.215.58.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E382F52CCF8
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 17:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791914394; cv=none; b=uR0nsdGedAYpnx9Kakp//AFMN8PttXoy0WZVOrSDtt9D6+cvNmc+B4g6eXdtC1NVwdk43D88DebkPob0qgeCMizKz5NtzeCEjkMl7kyiH0QVDKqPFAJ50Ge56dyOK+MyVJce1nHDTDPKwMc0VIrBL/nMz0UsEfJpOdVfI/vbtBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791914394; c=relaxed/simple;
	bh=ZDaRAOGl+KPtg280C/lWnY6cxSz/5bl3EgoRIDVkrWw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UVGjin6znjToMcwYgBqZDGzhzLKq/bRBNwUFdx+5zWjNxWap3Qt18IlaWrss3XnF95U3x3qTm0ejmsFIQKU1Yd3AlvMiJ52o7O2wp02FLE95JYDaOe2iGQp7fqf3XTEajoBnDDLVhkagkZufDobnaZlJ7oMmK/vVzK4rYvh94jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=nlkOGpPh; arc=none smtp.client-ip=95.215.58.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="nlkOGpPh"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ZDaRAOGl+KPtg280C/lWnY6cxSz/5bl3EgoRIDVkrWw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791914390; v=1; x=1792519190;
 b=nlkOGpPh49FWYYFriTQvvSLPoLo+eHxXPWa8/Qgkh7Dgr7sxZA0m0JPEyh8Eg6/W5VK/E/2T
 Rc7CSYbLUC+S5m7nzcbafptd1yoL3nBve9FBe4NbBhX/XMgWvrWafr7dh1n3ZCT/H7wUjojAnT6
 BARdza+eaqn2B4BtJQVOjP/c=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 59c519b005543edb;
	Tue, 13 Oct 2026 17:59:49 +0000
X-Mizu-Trace-ID: 59c519b005543edb
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
	Jason Xing <kernelxing@tencent.com>,
	Jason Xing <kerneljasonxing@gmail.com>,
	Wen Yang <wen.yang@linux.dev>
Subject: [PATCH 06/15] net: optimize ____napi_schedule() to avoid extra NET_RX_SOFTIRQ
Date: Wed, 14 Oct 2026 01:58:40 +0800
Message-Id: <f76c6813e6f8d0b7060db8344a9fb2a4ff765d69.1791912669.git.wen.yang@linux.dev>
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

commit 8b43fd3d1d7d88293eb15e92090826e6b7cc13e4 upstream.

____napi_schedule() adds a napi into current cpu softnet_data poll_list,
then raises NET_RX_SOFTIRQ to make sure net_rx_action() will process it.

Idea of this patch is to not raise NET_RX_SOFTIRQ when being called indirectly
from net_rx_action(), because we can process poll_list from this point,
without going to full softirq loop.

This needs a change in net_rx_action() to make sure we restart
its main loop if sd->poll_list was updated without NET_RX_SOFTIRQ
being raised.

Signed-off-by: Eric Dumazet <edumazet@google.com>
Cc: Jason Xing <kernelxing@tencent.com>
Reviewed-by: Jason Xing <kerneljasonxing@gmail.com>
Tested-by: Jason Xing <kerneljasonxing@gmail.com>
Signed-off-by: Paolo Abeni <pabeni@redhat.com>
Signed-off-by: Wen Yang <wen.yang@linux.dev>
---
 net/core/dev.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/net/core/dev.c b/net/core/dev.c
index 10a8883ae490..db1fe85ebc90 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -4498,7 +4498,11 @@ static inline void ____napi_schedule(struct softnet_data *sd,
 	}
 
 	list_add_tail(&napi->poll_list, &sd->poll_list);
-	raise_softirq_irqoff(NET_RX_SOFTIRQ);
+	/* If not called from net_rx_action()
+	 * we have to raise NET_RX_SOFTIRQ.
+	 */
+	if (!sd->in_net_rx_action)
+		raise_softirq_irqoff(NET_RX_SOFTIRQ);
 }
 
 #ifdef CONFIG_RPS
@@ -6797,6 +6801,7 @@ static __latent_entropy void net_rx_action(struct softirq_action *h)
 	LIST_HEAD(list);
 	LIST_HEAD(repoll);
 
+start:
 	sd->in_net_rx_action = true;
 	local_irq_disable();
 	list_splice_init(&sd->poll_list, &list);
@@ -6808,9 +6813,18 @@ static __latent_entropy void net_rx_action(struct softirq_action *h)
 		skb_defer_free_flush(sd);
 
 		if (list_empty(&list)) {
-			sd->in_net_rx_action = false;
-			if (!sd_has_rps_ipi_waiting(sd) && list_empty(&repoll))
-				goto end;
+			if (list_empty(&repoll)) {
+				sd->in_net_rx_action = false;
+				barrier();
+				/* We need to check if ____napi_schedule()
+				 * had refilled poll_list while
+				 * sd->in_net_rx_action was true.
+				 */
+				if (!list_empty(&sd->poll_list))
+					goto start;
+				if (!sd_has_rps_ipi_waiting(sd))
+					goto end;
+			}
 			break;
 		}
 
-- 
2.25.1

