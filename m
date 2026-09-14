Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 203B54A8A11
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 15:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789398860; cv=none; b=L3Krpl+3Cmny8N4bnH2S4YgWkN7uUUTt5ZtGmd4ECYyN0UJq0qKHvbFbyUGR4ZE7flx2c1eXbrREDZo4N2ECCd5kfYM8+WjZ6TDsAeRj2bN8WGeUQcNgeNJkD0oED1o7lJqanV7FaXlg3H7+8SpMSbFQ79tgn4ELnK7RmHZJV2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789398860; c=relaxed/simple;
	bh=BTUYdjiNyWYKS0lyIKWewUOB3C4RptV4RmilWSTe1zc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YqMXO41sPqj3kEIb0mKE4rdtGVsCyXWd+mdwYeGl00lemJmAdgM7sXlF8XvXM8RsnU33vBDZuNYlqiqStE+ZoZNImAtyl3Jig2JfMTa7EfU9qZqvKD7mYkdJ6KrDPdFCx5ApQBDyDzi601ExZFi3/Wq/MhXsQdECjxqAYMAGyfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SjAMXnRu; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SjAMXnRu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789398858;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SO0lyd2TLY4/Tg6BoXH46sF7IwyWzQWoxxUwdMPlakQ=;
	b=SjAMXnRuRn2zJULWgRsMtuJrNsJsfcUMY+2blkj+u1QAqzdwoortrbpyidXeXq7UQx3Xy8
	fGT3IEZ6b2IScIxD/UFMtTd7L/Jz8K911JbaAMcYIQGDfnZVgbNpquEDmX8Q/BOUIP5ABH
	KxOcxodhqRTQ8sw10J3vodXUgwnSxFw=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-661-qFx_ZRCdMnKWLYn098GeqQ-1; Mon,
 14 Sep 2026 11:14:11 -0400
X-MC-Unique: qFx_ZRCdMnKWLYn098GeqQ-1
X-Mimecast-MFC-AGG-ID: qFx_ZRCdMnKWLYn098GeqQ_1789398850
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DD7E2180A9F9;
	Mon, 14 Sep 2026 15:14:09 +0000 (UTC)
Received: from warthog.com (unknown [10.44.32.54])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 0C614180057F;
	Mon, 14 Sep 2026 15:14:05 +0000 (UTC)
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
	Jeffrey Altman <jaltman@auristor.com>
Subject: [PATCH net v10 04/14] rxrpc: Fix sendmsg length
Date: Mon, 14 Sep 2026 16:13:28 +0100
Message-ID: <20260914151340.3227501-5-dhowells@redhat.com>
In-Reply-To: <20260914151340.3227501-1-dhowells@redhat.com>
References: <20260914151340.3227501-1-dhowells@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

rxrpc_send_data() is given two data lengths (len and msg->msg_iter.count)
and is inconsistent about how it uses them.  Fix this by using len in
preference to msg->msg_iter.count.  Also limit the amount copied to either
len or msg->msg_iter.count, whichever is smaller.

Note that, currently, all the callers have len and msg->msg_iter.count the
same and so the problem won't occur.  This is a prerequisite for another
patch that fixes the handling of encryption errors.

Fixes: 382d7974de31 ("RxRPC: Use iov_iter_count() in rxrpc_send_data() instead of the len argument")
Signed-off-by: David Howells <dhowells@redhat.com>
cc: Marc Dionne <marc.dionne@auristor.com>
cc: Jeffrey Altman <jaltman@auristor.com>
cc: Eric Dumazet <edumazet@google.com>
cc: "David S. Miller" <davem@davemloft.net>
cc: Jakub Kicinski <kuba@kernel.org>
cc: Paolo Abeni <pabeni@redhat.com>
cc: Simon Horman <horms@kernel.org>
cc: linux-afs@lists.infradead.org
---
 net/rxrpc/sendmsg.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/net/rxrpc/sendmsg.c b/net/rxrpc/sendmsg.c
index 34aae8e789a4..bbb39835ef9e 100644
--- a/net/rxrpc/sendmsg.c
+++ b/net/rxrpc/sendmsg.c
@@ -379,9 +379,9 @@ static int rxrpc_send_data(struct rxrpc_sock *rx,
 
 	ret = -EMSGSIZE;
 	if (call->tx_total_len != -1) {
-		if (len - copied > call->tx_total_len)
+		if (len > call->tx_total_len)
 			goto maybe_error;
-		if (!more && len - copied != call->tx_total_len)
+		if (!more && len != call->tx_total_len)
 			goto maybe_error;
 	}
 
@@ -405,7 +405,7 @@ static int rxrpc_send_data(struct rxrpc_sock *rx,
 			 * the security header is going to be in the padded
 			 * region (enc blocksize), but the trailer is not.
 			 */
-			remain = more ? INT_MAX : msg_data_left(msg);
+			remain = more ? INT_MAX : len;
 			txb = call->conn->security->alloc_txbuf(call, remain, sk->sk_allocation);
 			if (!txb) {
 				ret = -ENOMEM;
@@ -416,8 +416,8 @@ static int rxrpc_send_data(struct rxrpc_sock *rx,
 		_debug("append");
 
 		/* append next segment of data to the current buffer */
-		if (msg_data_left(msg) > 0) {
-			size_t copy = umin(txb->space, msg_data_left(msg));
+		if (len > 0) {
+			size_t copy = min3(txb->space, len, msg_data_left(msg));
 
 			_debug("add %zu", copy);
 			if (!copy_from_iter_full(txb->data + txb->offset,
@@ -428,6 +428,7 @@ static int rxrpc_send_data(struct rxrpc_sock *rx,
 			txb->len += copy;
 			txb->offset += copy;
 			copied += copy;
+			len -= copy;
 			if (call->tx_total_len != -1)
 				call->tx_total_len -= copy;
 		}
@@ -439,8 +440,8 @@ static int rxrpc_send_data(struct rxrpc_sock *rx,
 
 		/* add the packet to the send queue if it's now full */
 		if (!txb->space ||
-		    (msg_data_left(msg) == 0 && !more)) {
-			if (msg_data_left(msg) == 0 && !more)
+		    (len == 0 && !more)) {
+			if (len == 0 && !more)
 				txb->flags |= RXRPC_LAST_PACKET;
 
 			ret = call->security->secure_packet(call, txb);
@@ -449,7 +450,7 @@ static int rxrpc_send_data(struct rxrpc_sock *rx,
 			rxrpc_queue_packet(rx, call, txb, notify_end_tx);
 			txb = NULL;
 		}
-	} while (msg_data_left(msg) > 0);
+	} while (len > 0 && msg_data_left(msg) > 0);
 
 success:
 	ret = copied;

