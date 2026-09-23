Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DBD1533586
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 13:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790170733; cv=none; b=J+XzgyNMJBov+ZWLeQp1psKlVJyeqZbfBWLc+3H/3sMrx9iSBnkedH0mNB0OHFqd2IM9gNJFZCBY4bfd7X3ATbFJLKhE69p7FS5OGQMgh2ApV1s0KT7Zzjm7w0X79wpRKKt5/CnRJsoXQ4DWHSezJLhAWl5PULznXtcPst6V4Dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790170733; c=relaxed/simple;
	bh=hNd6bIyFAvlFxc6hjuFcDqVwVqg86Zvx1YHzqvt4tLo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TBgNsZa9uowIqqjSHz03TM0CUp62GkzpdVI+i4VkycMPSkEVVR3V4Gdaq7ZiWDrpLSbzdZ+kexJ9yCoXUxLrUsUzp4aPbReTYFgpyAnTxLy5GMp/5O+oJODZ9cZyn3nzLgS7NDtFE5udvIXRzG0QvuZoEdMITXp2l5JO0jOl990=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MMLMPSFo; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MMLMPSFo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790170730;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HHCKmh+GTex17viqHU7+p3b1kZPrhM46bDIsKbGkEho=;
	b=MMLMPSFoA0Gjbi50X2fQbBfKd7mykbws+fFkn/kA8nL4rWszeri/KmYUtVcajHxZDnmesT
	3FPMwJ0oqd55n8FwZ7JVevjUCagIAKoBKU67eSrgNQ0XX3YfphymKzJR7mES3QTyBNr6pf
	2LNLAPdW5NQXd3PyKtYnfNRtZMlJp/Y=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-342-JkCCGU2pMfud3ac-UALFuQ-1; Wed,
 23 Sep 2026 09:38:46 -0400
X-MC-Unique: JkCCGU2pMfud3ac-UALFuQ-1
X-Mimecast-MFC-AGG-ID: JkCCGU2pMfud3ac-UALFuQ_1790170724
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 28299195FD12;
	Wed, 23 Sep 2026 13:38:44 +0000 (UTC)
Received: from warthog.com (unknown [10.44.32.54])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 28704427;
	Wed, 23 Sep 2026 13:38:39 +0000 (UTC)
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
	Seungwon Bae <qotmddnjs@ajou.ac.kr>,
	stable@vger.kernel.org
Subject: [PATCH net v11 17/17] rxrpc: fix use-after-free in rxrpc_poke_conn()
Date: Wed, 23 Sep 2026 14:37:04 +0100
Message-ID: <20260923133706.1496540-18-dhowells@redhat.com>
In-Reply-To: <20260923133706.1496540-1-dhowells@redhat.com>
References: <20260923133706.1496540-1-dhowells@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95

From: Seungwon Bae <qotmddnjs@ajou.ac.kr>

rxrpc_poke_conn() takes a reference on the connection with no liveness
check, unlike its sibling rxrpc_queue_conn() which gates on
atomic_read(&conn->active) >= 0.  The per-connection timer is armed with
no reference held for it, and rxrpc_put_connection() cancels it with a
non-synchronous timer_delete() only after the refcount reaches 0.
refcount_t saturates rather than resurrecting, so the connection can be
kfree()d while still linked in local->conn_attend_q (nothing in teardown
unlinks attend_link).  The rxrpc I/O thread then performs a UAF write
(list_del_init) plus UAF reads and indirect calls through conn->security.

Reproduced on a KASAN + PREEMPT kernel: 56 "refcount_t: addition on 0"
saturations at load, escalating to

  BUG: KASAN: slab-use-after-free in rxrpc_io_thread   Write of size 8

AF_RXRPC socket creation (rxrpc_create) has no capability check, so this
is reachable by an unprivileged user.

Guard rxrpc_poke_conn() with the same liveness/refcount check the sibling
rxrpc_queue_conn() uses before taking the poke reference, so a connection
past its last-active point is not poked/requeued after teardown began.

Verified before/after on KASAN+PREEMPT at equal timer volume: 56
saturations + 15 KASAN reports unpatched vs 0 and 0 patched.

Fixes: f2cce89a074e ("rxrpc: Implement a mechanism to send an event notification to a connection")
Signed-off-by: Seungwon Bae <qotmddnjs@ajou.ac.kr>
Signed-off-by: David Howells <dhowells@redhat.com>
cc: Marc Dionne <marc.dionne@auristor.com>
cc: Eric Dumazet <edumazet@google.com>
cc: "David S. Miller" <davem@davemloft.net>
cc: Jakub Kicinski <kuba@kernel.org>
cc: Paolo Abeni <pabeni@redhat.com>
cc: Simon Horman <horms@kernel.org>
cc: linux-afs@lists.infradead.org
cc: stable@vger.kernel.org
---
 net/rxrpc/conn_object.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/net/rxrpc/conn_object.c b/net/rxrpc/conn_object.c
index 0ece717db0f8..1be50e0c9cee 100644
--- a/net/rxrpc/conn_object.c
+++ b/net/rxrpc/conn_object.c
@@ -34,7 +34,10 @@ void rxrpc_poke_conn(struct rxrpc_connection *conn, enum rxrpc_conn_trace why)
 	spin_lock_irq(&local->lock);
 	busy = !list_empty(&conn->attend_link);
 	if (!busy) {
-		rxrpc_get_connection(conn, why);
+		if (!rxrpc_get_connection_maybe(conn, why)) {
+			spin_unlock_irq(&local->lock);
+			return;
+		}
 		list_add_tail(&conn->attend_link, &local->conn_attend_q);
 	}
 	spin_unlock_irq(&local->lock);

