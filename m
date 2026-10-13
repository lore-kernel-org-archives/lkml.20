Received: from mta1.migadu.com (out-121.mta1.migadu.com [95.215.58.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E87E530DFF
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 17:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.121
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791914379; cv=none; b=M1lgubP9XFeYgJxrtY0OJQmPHFVqcBqBpGuivvi3ZuSekouWZxMttlzh7RfJiqk9q0YxegokHgKXnqS2J2xq+h8TswEKGFbsTdU+fvKEtthn08hpqaOU0fryCMf6Qh8fHaev6P7RfXAIVzwOtJU62s0T770lXwQrbSUjhu0lAjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791914379; c=relaxed/simple;
	bh=i/OUM9PNUagk4XHXdM7pT/DcHVgeaZ4CI4wZFXPCZig=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DA0Y1N+/Ru3RRcZwlfNZZ9rsVnUdJf6QinGvQfFy+7g6sDvciD3tHV4/FC9dWQ1ueZGfjl/yezF3Bqmvd1GEggklLoH1/qHy55oEnNwSvCAY3XGtQT2Ejahdv9o+Li2EO1AcGBAGik57nWEVI5ze8eN2RtilTDotOBXjPqxZELQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=hdSSUpFT; arc=none smtp.client-ip=95.215.58.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="hdSSUpFT"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=i/OUM9PNUagk4XHXdM7pT/DcHVgeaZ4CI4wZFXPCZig=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791914375; v=1; x=1792519175;
 b=hdSSUpFTK+RGrES5UA3awgmkWP74VRcOKDjINHQfKbraXN30JC3QIYtifu+Fl3VklKukfRuj
 X81nsw7HJ09r5qweGsgsstkZmnfYgNKhojRysDv9g7qjpuYcPoEcePAOSlMn/pCu6IMdMk77ggS
 ItIqmVSl7c/CLbnH0U9N7pvg=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id f22885aac45a1709;
	Tue, 13 Oct 2026 17:59:34 +0000
X-Mizu-Trace-ID: f22885aac45a1709
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
	Jason Xing <kerneljasonxing@gmail.com>,
	Wen Yang <wen.yang@linux.dev>
Subject: [PATCH 04/15] net: add softnet_data.in_net_rx_action
Date: Wed, 14 Oct 2026 01:58:38 +0800
Message-Id: <0471f45a4ca97818fd6c5f49c0d8fb32f6480304.1791912669.git.wen.yang@linux.dev>
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

commit c59647c0dc679008886756a888368da1c6d4ccd3 upstream.

We want to make two optimizations in napi_schedule_rps() and
____napi_schedule() which require to know if these helpers are
called from net_rx_action(), instead of being called from
other contexts.

sd.in_net_rx_action is only read/written by the owning cpu.

Signed-off-by: Eric Dumazet <edumazet@google.com>
Reviewed-by: Jason Xing <kerneljasonxing@gmail.com>
Tested-by: Jason Xing <kerneljasonxing@gmail.com>
Signed-off-by: Paolo Abeni <pabeni@redhat.com>
Signed-off-by: Wen Yang <wen.yang@linux.dev>
---
 include/linux/netdevice.h | 1 +
 net/core/dev.c            | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
index e97967ca2760..987177cebe7c 100644
--- a/include/linux/netdevice.h
+++ b/include/linux/netdevice.h
@@ -3161,6 +3161,7 @@ struct softnet_data {
 #ifdef CONFIG_RPS
 	struct softnet_data	*rps_ipi_list;
 #endif
+	bool			in_net_rx_action;
 #ifdef CONFIG_NET_FLOW_LIMIT
 	struct sd_flow_limit __rcu *flow_limit;
 #endif
diff --git a/net/core/dev.c b/net/core/dev.c
index 36dbb86496ec..a46caebb06f7 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -6795,6 +6795,7 @@ static __latent_entropy void net_rx_action(struct softirq_action *h)
 	LIST_HEAD(list);
 	LIST_HEAD(repoll);
 
+	sd->in_net_rx_action = true;
 	local_irq_disable();
 	list_splice_init(&sd->poll_list, &list);
 	local_irq_enable();
@@ -6805,6 +6806,7 @@ static __latent_entropy void net_rx_action(struct softirq_action *h)
 		skb_defer_free_flush(sd);
 
 		if (list_empty(&list)) {
+			sd->in_net_rx_action = false;
 			if (!sd_has_rps_ipi_waiting(sd) && list_empty(&repoll))
 				goto end;
 			break;
@@ -6831,6 +6833,8 @@ static __latent_entropy void net_rx_action(struct softirq_action *h)
 	list_splice(&list, &sd->poll_list);
 	if (!list_empty(&sd->poll_list))
 		__raise_softirq_irqoff(NET_RX_SOFTIRQ);
+	else
+		sd->in_net_rx_action = false;
 
 	net_rps_action_and_irq_enable(sd);
 end:;
-- 
2.25.1

