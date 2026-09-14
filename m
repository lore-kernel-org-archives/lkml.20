Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E98354A99D5
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 15:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789398880; cv=none; b=MdxYoYP4zYm137AjmwrIBm0Mmb7uSOnhaBlow81FQzmahF1bXTqaADP/gnBZ603t/yRBDNuWzMC4jJYA+B3QCr8QsOOLcnh+2w+LnlkeqZwQmD1Gegftav8Jk/zfyXJLh1GftwiR6I02nqzeRZzQQHHiunDYRpsQ/hNrjNUuaMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789398880; c=relaxed/simple;
	bh=R+vDyZMcwZtPeSYXp7LPR+k2Zxh6L5h6f3+A0yiEABM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rBUFReMo3tcg9ccWQxYbGRVJdsXG2NkvrR/RS1SN5dB2XJLyUoYnZbgFMhyg4VHD4n40+3DRa1EAu5jBhGyDbutnH+qDxQtJLiVBZN1lCv3V7hUdWlykc+hs5xFugDdCwJBIGz3oDDjyOB2NR2qXn+h4kAJpN/8R18BuRvhghKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=V9uC+fiR; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="V9uC+fiR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789398876;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BRwiUko/ZuIdCZgQfYPgdfiRngNwWLuc9cEVQ2YL2IE=;
	b=V9uC+fiRZDYdqbKbdh3N6yyfFiUQD1mo3vpCTxiwE71Ce2DqS8WP3pn7sQEz4B18PpOxbq
	MewaoV9vvGWnHDPp2yX87mdkcVATIwUTkOUOPlXWMVFyjb9sPMmurBxNSIVUmvQBJpr8CU
	fQ8idJNDzaFBnAJNOZ91nN6hiamLKpU=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-257-0EcR6ZddMBKq1-uDhdZ6kA-1; Mon,
 14 Sep 2026 11:14:31 -0400
X-MC-Unique: 0EcR6ZddMBKq1-uDhdZ6kA-1
X-Mimecast-MFC-AGG-ID: 0EcR6ZddMBKq1-uDhdZ6kA_1789398869
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 84F2818334BB;
	Mon, 14 Sep 2026 15:14:29 +0000 (UTC)
Received: from warthog.com (unknown [10.44.32.54])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 6D51F1956053;
	Mon, 14 Sep 2026 15:14:26 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: netdev@vger.kernel.org
Cc: David Howells <dhowells@redhat.com>,
	Marc Dionne <marc.dionne@auristor.com>,
	Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	linux-afs@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@kernel.org
Subject: [PATCH net v10 08/14] rxrpc: Fix double IRQ enablement
Date: Mon, 14 Sep 2026 16:13:32 +0100
Message-ID: <20260914151340.3227501-9-dhowells@redhat.com>
In-Reply-To: <20260914151340.3227501-1-dhowells@redhat.com>
References: <20260914151340.3227501-1-dhowells@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

rxrpc_notify_socket() explicitly disables and then re-enables IRQs, but one
of its call chains (rxrpc_input_queue_data() -> rxrpc_end_rx_phase() ->
rxrpc_call_completed() -> rxrpc_set_call_completion()) has IRQs disabled
around it.

Fix this by making rxrpc_notify_socket() use irqsave spinlocks.

Fixes: a2ea9a907260 ("rxrpc: Use irq-disabling spinlocks between app and I/O thread")
Link: https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260812110129.979970-6-dhowells@redhat.com
Signed-off-by: David Howells <dhowells@redhat.com>
cc: Marc Dionne <marc.dionne@auristor.com>
cc: Eric Dumazet <edumazet@google.com>
cc: "David S. Miller" <davem@davemloft.net>
cc: Jakub Kicinski <kuba@kernel.org>
cc: Paolo Abeni <pabeni@redhat.com>
cc: Simon Horman <horms@kernel.org>
cc: linux-afs@lists.infradead.org
cc: stable@kernel.org
---
 net/rxrpc/recvmsg.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/net/rxrpc/recvmsg.c b/net/rxrpc/recvmsg.c
index efcba4b2e74f..56fa324d0962 100644
--- a/net/rxrpc/recvmsg.c
+++ b/net/rxrpc/recvmsg.c
@@ -24,6 +24,7 @@ void rxrpc_notify_socket(struct rxrpc_call *call)
 {
 	struct rxrpc_sock *rx;
 	struct sock *sk;
+	unsigned long flags;
 
 	_enter("%d", call->debug_id);
 
@@ -38,16 +39,16 @@ void rxrpc_notify_socket(struct rxrpc_call *call)
 	sk = &rx->sk;
 	if (rx && sk->sk_state < RXRPC_CLOSE) {
 		if (call->notify_rx) {
-			spin_lock_irq(&call->notify_lock);
+			spin_lock_irqsave(&call->notify_lock, flags);
 			call->notify_rx(sk, call, call->user_call_ID);
-			spin_unlock_irq(&call->notify_lock);
+			spin_unlock_irqrestore(&call->notify_lock, flags);
 		} else {
-			spin_lock_irq(&rx->recvmsg_lock);
+			spin_lock_irqsave(&rx->recvmsg_lock, flags);
 			if (list_empty(&call->recvmsg_link)) {
 				rxrpc_get_call(call, rxrpc_call_get_notify_socket);
 				list_add_tail(&call->recvmsg_link, &rx->recvmsg_q);
 			}
-			spin_unlock_irq(&rx->recvmsg_lock);
+			spin_unlock_irqrestore(&rx->recvmsg_lock, flags);
 
 			if (!sock_flag(sk, SOCK_DEAD)) {
 				_debug("call %ps", sk->sk_data_ready);

