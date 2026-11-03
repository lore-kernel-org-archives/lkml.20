Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.248
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793685387;
	b=buplcnBkN/UmPM7Tiav52sNrGSkV/NAqEad18IZII+r54xnLsBobyYt6w/qlT+Q/Bsut
	 86cST+zAca1t12re4qzV9dwih2Pacd/fsw/9f4K4WRGNISkJYdFAZ0BRF/2es0ErICkc3
	 qS2+LEPcblt2Cp7DEoobAgbe63lsh+qavBULif67oSoL86jqyI1OOSgzFc2W0degbLVTW
	 A3PRxXedQ1Pmpk0UDhj1l41L07McKrjr+cuDoMEVdNzThI3kFnocoRtH3nZPhtPa3tu9z
	 3JzQRPy65q2r8fkqMMOYluJ3dct6BjKjfWz1lQf2N4iv6B/XI9v98vfXb3VIuMw3Brg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793685387;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=uj8pOywJFjRcmYO9PyvNrZWyQc2zM0zh4AslEzqA01I=;
	b=wXWEjThnAaqU3M41o6mgfGZpeHsUZkQC9QLHl3wUiX0v3CEUD5DYzpg3rXyUM1akwV3M
	 MTcnlFD78YDR+thK5I0B5yjA7MDRVaD4rVrdk9aGffUtWE1ZnbsnA2r7O9EuzDqebFofF
	 LYkDlz27YL56eNvHohwBBr5a4Fk8fPbEU00n77+Vnt3MbsubR2iMhkxG3YrRdFvf8XnH9
	 VxovK3bCA246iTA/LrgwrHzfbsCKnrr5G/2zZ+dWmvOAhtx2jFDeinTTp2Gl4voWtKgC2
	 HW79+/f6+aRXdMDvQRAys5+jO4J/YsYk8TL3Hui9ESA+YlHKUFxzmXGiWs00x9Dq4Ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=rp2lXthv;
	arc=none smtp.remote-ip=95.215.58.248
Received: from mta1.migadu.com (out-248.mta1.migadu.com [95.215.58.248])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9566A606A329
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 05:56:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9566A606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=rp2lXthv
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=KBgkos9IdQOCkZD7eKRUQVpH11hWoUdqtEfGbGKCSrg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793685384; v=1; x=1794290184;
 b=rp2lXthv/i3qaUJ/9kEYA74HZjabdrFGwoW5URcvVHcjkjc3Xq+wCQC4P/PuX4My5A/3LMLj
 xQXPJW9POkAWCMcXofYb3FXzgSjphOLK0vi6bYLDk1t8+a6l56Fjs0W49yf5VYEHE0LvKELlNa1
 MtTrOMUlx8pz47yXBIrrRQO0=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 7180cf75f3a7a3b1;
	Tue, 03 Nov 2026 05:56:24 +0000
X-Mizu-Trace-ID: 7180cf75f3a7a3b1
X-Migadu-Flow: FLOW_OUT
From: Qingfang Deng <qingfang.deng@linux.dev>
To: James Chapman <jchapman@katalix.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Linkui Xiao <xiaolinkui@126.com>,
	Qingfang Deng <qingfang.deng@linux.dev>,
	Sashiko <netdev-bot+sashiko@kernel.org>
Subject: [PATCH net-next v2 1/2] l2tp: ppp: remove unused backlog callback
Date: Tue,  3 Nov 2026 13:56:11 +0800
Message-ID: <20261103055614.3729-1-qingfang.deng@linux.dev>
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
Content-Transfer-Encoding: 8bit

PPPoL2TP sessions receive packets through pppol2tp_recv(), which passes
packets directly to PPP or queues them on sk_receive_queue. No receive
path queues packets on the session socket backlog or calls
sk_receive_skb() with that socket, so pppol2tp_backlog_recv() is unused.

Remove the unused callback. L2TP/IP control sockets retain their
separate backlog callbacks.

Reported-by: Sashiko <netdev-bot+sashiko@kernel.org>
Closes: https://lore.kernel.org/netdev/179340002340.3131.5823454250644987437@kernel.org/
Signed-off-by: Qingfang Deng <qingfang.deng@linux.dev>
---
v2: repost after net-next is open, and add Sashiko's report

v1: https://lore.kernel.org/netdev/20261030070003.2590-1-qingfang.deng@linux.dev/
---
 net/l2tp/l2tp_ppp.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/net/l2tp/l2tp_ppp.c b/net/l2tp/l2tp_ppp.c
index 4f311d473a64..15e02864bfd5 100644
--- a/net/l2tp/l2tp_ppp.c
+++ b/net/l2tp/l2tp_ppp.c
@@ -454,17 +454,6 @@ static struct proto pppol2tp_sk_proto = {
 	.obj_size = sizeof(struct pppox_sock),
 };
 
-static int pppol2tp_backlog_recv(struct sock *sk, struct sk_buff *skb)
-{
-	int rc;
-
-	rc = l2tp_udp_encap_recv(sk, skb);
-	if (rc)
-		kfree_skb(skb);
-
-	return NET_RX_SUCCESS;
-}
-
 /* socket() handler. Initialize a new struct sock.
  */
 static int pppol2tp_create(struct net *net, struct socket *sock, int kern)
@@ -482,7 +471,6 @@ static int pppol2tp_create(struct net *net, struct socket *sock, int kern)
 	sock->state  = SS_UNCONNECTED;
 	sock->ops    = &pppol2tp_ops;
 
-	sk->sk_backlog_rcv = pppol2tp_backlog_recv;
 	sk->sk_protocol	   = PX_PROTO_OL2TP;
 	sk->sk_family	   = PF_PPPOX;
 	sk->sk_state	   = PPPOX_NONE;
-- 
2.43.0

