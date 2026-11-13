Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794590169;
	b=yA3z7/h0g5UDqb6AnLGUE2CcO39kcoJ2lYaXQvt+mCMc04HWBIoUqVYKBw34PsTDdpgH
	 ggki2IPjrbmsURfrU3Zr7QdOVwjojZFpCC3B5EAM4ZKIJB4557jsYc1VZwpIijnYZ8QvR
	 QIh6Hqvjsq1yGStVGB+OsuxCGJ1FTC0VwELjxi0BhIk1+Gc5Z/PNwjsQHrfhRqjkRIy+K
	 B/3ZNw8xmGJ4+kVxSNBbTO7OPB8nqZFoL5QZbLJ3AMgzUOK0Yx2JOePqHxVOC1hGEncDp
	 d/KLWAlghLp024xu1hL9mMs/doh67Tc5G5QR3cneZS1L+/fkieGsyyjSERsaGX3ujXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794590169;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=/AX9Mf5J+3aeVkpwh4J/8EgCykn4MsRJKSbKY+Cu0H4=;
	b=XrbSZVygwrM19uKue8QpItMnd6PKsWFFlFYgg7/nc1WVuvwMa1Hmp4i64lDElXlTrY69
	 NW/kwn7CBioKyCzsgnv509w0a1NQAUMZYhG+9OrbHzaxHLLHVK6OHB+/XOsf7kDBRfUSp
	 89z21ClOQtRPRohZSALPp8zGhaCHctLplcxgsfQf4MBjouKT6iB73+3Eac2KQkUP517Lx
	 Ucl1b7zqEbQl0z6z+6jx45YJWFtBVUOQS8atmpaIixWclyh53cp52WI4EipgzyHr3J+LK
	 1p4pFAWfqkGCCGLh1QCzGA5AUkKDC+Bn6fGuJjXt7/n3OeHgl5bPzTeVDCN9ySalPNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=C0qI9idZ;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b="nd/erKkW";
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAFC560A6F60
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 17:16:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DAFC560A6F60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=C0qI9idZ;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=nd/erKkW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794590168;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/AX9Mf5J+3aeVkpwh4J/8EgCykn4MsRJKSbKY+Cu0H4=;
	b=C0qI9idZHMNEnS3ZAgy18ueCco2s0cJ8geQp/454+5s0rAc7G+QUb0+Aup/34GlYf5Osya
	iEfLMoSHdY0dYxf5XldCut7SEezwDLq+9P0KKkUf1gq0ohwzvfnaGBIWwAWcEb9suaOstb
	4u58oaCvo64+TZaxSMLr4quL7ItZ3IM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-652-Hhbywm5zP-OKfsU8FA4Hhg-1; Fri, 13 Nov 2026 12:16:06 -0500
X-MC-Unique: Hhbywm5zP-OKfsU8FA4Hhg-1
X-Mimecast-MFC-AGG-ID: Hhbywm5zP-OKfsU8FA4Hhg_1794590165
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-492425d771bso649278f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 09:16:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794590165; x=1795194965; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/AX9Mf5J+3aeVkpwh4J/8EgCykn4MsRJKSbKY+Cu0H4=;
        b=nd/erKkWCjLPNNEb41K6yZtQWoIe8zaRVrwvhNyb5E/1m73ZlewEZEt83y5Mk4mtBM
         aIbpXz7OW4bZkhrMjNNfcbCEXxTJOP1W1HGjMXJYW0S9ctaYwfoDHgQowzPXi4oGk2wk
         gAKzR6FMKMxEJw2YXlshO3llE1tk0OiPQyuOasgMcMej/vhhdZIxS8U2/qTdS8WjzNnS
         NSHua2LgkTRQaVrsOTgQ2i82SiQqfNz5GgsJuvrcLuF/JX+iL5eQo7IeoqdePWj+fl9l
         stYyhOy+eD3B4wzRUONZi00+28e8xLyhOaksu69WcrYG4LelIjg9zGKvfUOkn4mL8k3q
         rr0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794590165; x=1795194965;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/AX9Mf5J+3aeVkpwh4J/8EgCykn4MsRJKSbKY+Cu0H4=;
        b=Coj44PdB8twv9doBQv1A6ZjDUh1JzPOYUvS9AhGNW5zvy+IfJzuUxcI4q7lAJML2n7
         0mruppdUw600tKpfqwatPjasoD128bn12hA9cv+BBEMyTF5/Cf5HcWKbSGmTR133i0Ka
         WdUkRDaeyz6prO/jD/TN8e46Y+7vgv752Xs6LVLNQPhdmZV7z3EvQXeVBXKNBuXdQEuk
         weIDWgtiDhtBqnH6NJNCvFgIjgAZnKYujFDWc8hotHqPqDYTITe7/xuegmugDi+WgLq5
         yKI4VbGGUt5mJEgJmFjBqRrbaB5v0H/YRcXdAaB/w3EO7Qkj+Xs9axgi0dDRzukfZBv8
         fEJg==
X-Forwarded-Encrypted: i=1; AL+hErFeQB977TJ84YmDEIYh9Tcx7TEG51+C2V67Xx2WB2QOFkU4mmY+NTX949p5RNeBm4HF4zj2TknFpu8NEQQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z98r+hfAIvdnu75xPrWKdXWkQSRQ3vrlLeczNp6K3TdjHgmZCNs
	tDtpvgUOAHiFVlNgcebU74qTypdZryrDOIhvCiBPxoufX1AqmDk0Uiz/PJP/17aFEU0XHatJUMa
	bA/HWerfNT4PDmvs03ErZLRBQ6FYRyUTNJtvcFm4mXGeeVE2N8HBdyOSsMcsosjeFWg==
X-Gm-Gg: AYBFou3qtEsNegJAnQR2G68mCOpqnEHQ/MqGPnG4s/jba+fP6jwg+tW5+TUCddKUVf3
	WZTZEFPVslEUOR9/J+TMOMi1GZnJEvtSbytJEe7jlm+JDsgoQ7dngRXwitUlZ6nv5Wftl1px647
	v1E6I+vd1C4mQce/qtRpMqorSE88Dhr/fJR7S3tioJjZkGwvzervzHOLk/zVABpeplxJ6/UjGsl
	mVC0MZu6ynC4yO+j/N2QhuFTgiHir/PjApuS/DccYWKwM9O1Pu8LhSiSkh4TCOcHZKlG+u3uEWn
	KFTP+kavhkB97PycnR6CkUpZqRIad+Djkvd5dY6mLKp+GkdRsIR60ZvcJWihx2VZiQ4JiHwTOaD
	4HL8VxsX3H2jrJBzwssjHhPT2UOLnjUDRzQYxG0YuB5FPc/MesBNHPrZmBF0t21si2M11O0vlou
	vU7g/tQ8iijas=
X-Received: by 2002:a05:6000:4b0f:b0:491:4e13:fdd7 with SMTP id ffacd0b85a97d-49c6d63fbb8mr7123742f8f.6.1794590165042;
        Fri, 13 Nov 2026 09:16:05 -0800 (PST)
X-Received: by 2002:a05:6000:4b0f:b0:491:4e13:fdd7 with SMTP id ffacd0b85a97d-49c6d63fbb8mr7123674f8f.6.1794590164539;
        Fri, 13 Nov 2026 09:16:04 -0800 (PST)
Received: from [192.168.0.19] (217.red-88-4-146.dynamicip.rima-tde.net. [88.4.146.217])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c7da37b19sm5811907f8f.5.2026.11.13.09.16.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 09:16:03 -0800 (PST)
From: Sergio Lopez <slp@redhat.com>
Date: Fri, 13 Nov 2026 18:15:41 +0100
Subject: [PATCH RFC v3 1/8] vsock: expose the core port allocator to
 transports
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-vsock-dgram-support-v3-1-1523c8e9b27e@redhat.com>
References: <20261113-vsock-dgram-support-v3-0-1523c8e9b27e@redhat.com>
In-Reply-To: <20261113-vsock-dgram-support-v3-0-1523c8e9b27e@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>, 
 Bobby Eshleman <bobbyeshleman@meta.com>, 
 Alexei Starovoitov <ast@kernel.org>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Bryan Tan <bryan-bt.tan@broadcom.com>, 
 Vishnu Dasa <vishnu.dasa@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowangio@gmail.com>, 
 =?utf-8?q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
 Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
 Dexuan Cui <decui@microsoft.com>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: virtualization@lists.linux.dev, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, bpf@vger.kernel.org, 
 linux-hyperv@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
 linux-doc@vger.kernel.org, Sergio Lopez <slp@redhat.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=9250; i=slp@redhat.com;
 h=from:subject:message-id; bh=H6wwDTbNUOfIU+6gW7svNy8mFx/ZAcmIgQ8rPn9Y61E=;
 b=owEBbQKS/ZANAwAKAfRpJ40vDAI1AcsmYgBq90XHtLQkV9356m48yWWkjesTGnwxzq4ad1Bde
 0dbg6InubqJAjMEAAEKAB0WIQS+1fz3US2GgJFC6KL0aSeNLwwCNQUCavdFxwAKCRD0aSeNLwwC
 NcPXD/9kkIQgemqOqq8y8wk2rMz6kj4hirTyweCWfZsIGl40jMDfbEePn3ANdaAh3K9rp0FcQxg
 t6O7P9X0bqAOH1gcXqovXBPqbwJ5/y/4y9twxMA1IQfMGfSs/+IShuu7D0t2hhi2Wo8NJ/DeVax
 otbJskY19blySys7lwspeHT/f2TqhMDV/2zDewrd025HFZ4wqaVtEtDtSoOqW7FYICTPpLvwBXT
 FPt5Ra58kOPQyR8bPD1k99B7ZYa2nOqNLxNTN+fE2atHV5X+f9r3K2WnO/mhCGfN/IET+vwV0u/
 nAcY0G8FV9BRU0uLSmFSoYPmt90SsSo6NQpPJ99MEt7HEQQ+nW/sSuSxEY1XPfEHoeHNrqIfY0k
 sDFqPL1O6+cjnzd3GfHU23ZCokK3Mzyy1YeAjTG6ylmDftKmwuMswFgCqdZhF5B8YJsZPVNzLEo
 +5RPHeWkGEcUU3Mmt17AAe9GMArX961JujUKVUHyuKSmnzFg+wBEzqh9WBgV/RpzucThvJzIl8W
 ZCpRqPApsvripxlBadIUiRN51rKA1be8UAsPhN7TTbq2QhUVgMTNbylaQ4Qppf5npU0/xS1TH9b
 MntRRHT717+2A8WXn+s4PjkNIbQ9crMm7ctIKmi92hryOQiIEa5s9M6f6JTSg4LCRgSSObJBqsj
 d0ln74Ezl83NI1Q==
X-Developer-Key: i=slp@redhat.com; a=openpgp;
 fpr=BED5FCF7512D86809142E8A2F469278D2F0C0235

The core port allocator is currently private to connection-oriented
sockets. Virtio datagrams need the core bound table and port allocation,
while VMCI datagrams must keep their own endpoint creation and port
namespace.

Export vsock_bind_common() with the bound-table locking inside the
helper, and use it for stream and SEQPACKET binds. Keep datagram binds
delegated to the transport so a transport can opt into the core
allocator without changing other transports' binding behavior.

Keep datagram and connection-oriented sockets in separate logical port
spaces within the core bound table. Filter bind conflicts and bound-socket
lookups by class, including wildcard CIDs and automatic port allocation,
so datagram and stream/SEQPACKET sockets can share a CID and port. Stream
and SEQPACKET sockets continue to conflict with each other.

Signed-off-by: Sergio Lopez <slp@redhat.com>
---
 include/net/af_vsock.h   |  3 ++
 net/vmw_vsock/af_vsock.c | 98 +++++++++++++++++++++++++++++++-----------------
 2 files changed, 66 insertions(+), 35 deletions(-)

diff --git a/include/net/af_vsock.h b/include/net/af_vsock.h
index e8481f12312e..ac061115ed30 100644
--- a/include/net/af_vsock.h
+++ b/include/net/af_vsock.h
@@ -220,6 +220,7 @@ void vsock_remove_pending(struct sock *listener, struct sock *pending);
 void vsock_enqueue_accept(struct sock *listener, struct sock *connected);
 void vsock_pending_to_accept(struct sock *listener, struct sock *pending);
 void vsock_insert_connected(struct vsock_sock *vsk);
+int vsock_bind_common(struct vsock_sock *vsk, struct sockaddr_vm *addr);
 void vsock_remove_bound(struct vsock_sock *vsk);
 void vsock_remove_connected(struct vsock_sock *vsk);
 struct sock *vsock_find_bound_socket(struct sockaddr_vm *addr);
@@ -227,6 +228,8 @@ struct sock *vsock_find_connected_socket(struct sockaddr_vm *src,
 					 struct sockaddr_vm *dst);
 struct sock *vsock_find_bound_socket_net(struct sockaddr_vm *addr,
 					 struct net *net);
+struct sock *vsock_find_bound_dgram_socket_net(struct sockaddr_vm *addr,
+					       struct net *net);
 struct sock *vsock_find_connected_socket_net(struct sockaddr_vm *src,
 					     struct sockaddr_vm *dst,
 					     struct net *net);
diff --git a/net/vmw_vsock/af_vsock.c b/net/vmw_vsock/af_vsock.c
index d0508887a2fb..d5cf240d4ece 100644
--- a/net/vmw_vsock/af_vsock.c
+++ b/net/vmw_vsock/af_vsock.c
@@ -14,14 +14,10 @@
  * specified an address that they are responsible for) and one for connected
  * sockets (sockets that have established a connection with another socket).
  * These tables are "global" in that all sockets on the system are placed
- * within them. - Note, though, that the bound table contains an extra entry
- * for a list of unbound sockets and SOCK_DGRAM sockets will always remain in
- * that list. The bound table is used solely for lookup of sockets when packets
- * are received and that's not necessary for SOCK_DGRAM sockets since we create
- * a datagram handle for each and need not perform a lookup.  Keeping SOCK_DGRAM
- * sockets out of the bound hash buckets will reduce the chance of collisions
- * when looking for SOCK_STREAM sockets and prevents us from having to check the
- * socket type in the hash table lookups.
+ * within them. The bound table has an extra entry for unbound sockets.
+ * Transports with their own datagram endpoint table can leave their datagram
+ * sockets there; virtio datagrams use the bound hash buckets. Datagram and
+ * connection-oriented sockets have separate logical port spaces within them.
  *
  * - Sockets created by user action will either be "client" sockets that
  * initiate a connection or "server" sockets that listen for connections; we do
@@ -295,12 +291,16 @@ static void __vsock_remove_connected(struct vsock_sock *vsk)
 }
 
 static struct sock *__vsock_find_bound_socket_net(struct sockaddr_vm *addr,
-						  struct net *net)
+						  struct net *net, bool dgram)
 {
 	struct vsock_sock *vsk;
 
 	list_for_each_entry(vsk, vsock_bound_sockets(addr), bound_table) {
 		struct sock *sk = sk_vsock(vsk);
+		bool socket_dgram = sk->sk_type == SOCK_DGRAM;
+
+		if (socket_dgram != dgram)
+			continue;
 
 		if (vsock_addr_equals_addr(addr, &vsk->local_addr) &&
 		    vsock_net_check_mode(sock_net(sk), net))
@@ -372,28 +372,41 @@ void vsock_remove_connected(struct vsock_sock *vsk)
 }
 EXPORT_SYMBOL_GPL(vsock_remove_connected);
 
-/* Find a bound socket, filtering by namespace and namespace mode.
- *
- * Use this in transports that are namespace-aware and can provide the
- * network namespace context.
- */
-struct sock *vsock_find_bound_socket_net(struct sockaddr_vm *addr,
-					 struct net *net)
+static struct sock *vsock_find_bound_socket_type_net(struct sockaddr_vm *addr,
+						     struct net *net, bool dgram)
 {
 	struct sock *sk;
 
 	spin_lock_bh(&vsock_table_lock);
-	sk = __vsock_find_bound_socket_net(addr, net);
+	sk = __vsock_find_bound_socket_net(addr, net, dgram);
 	if (sk)
 		sock_hold(sk);
-
 	spin_unlock_bh(&vsock_table_lock);
 
 	return sk;
 }
+
+/* Find a connection-oriented bound socket, filtering by namespace and mode.
+ *
+ * Use this in transports that are namespace-aware and can provide the
+ * network namespace context.
+ */
+struct sock *vsock_find_bound_socket_net(struct sockaddr_vm *addr,
+					 struct net *net)
+{
+	return vsock_find_bound_socket_type_net(addr, net, false);
+}
 EXPORT_SYMBOL_GPL(vsock_find_bound_socket_net);
 
-/* Find a bound socket without namespace filtering.
+/* Find a datagram bound socket, filtering by namespace and mode. */
+struct sock *vsock_find_bound_dgram_socket_net(struct sockaddr_vm *addr,
+					       struct net *net)
+{
+	return vsock_find_bound_socket_type_net(addr, net, true);
+}
+EXPORT_SYMBOL_GPL(vsock_find_bound_dgram_socket_net);
+
+/* Find a connection-oriented bound socket without namespace filtering.
  *
  * Use this in transports that lack namespace context. All sockets are
  * treated as if in global mode.
@@ -832,11 +845,13 @@ static void vsock_pending_work(struct work_struct *work)
 
 /**** SOCKET OPERATIONS ****/
 
-static int __vsock_bind_connectible(struct vsock_sock *vsk,
-				    struct sockaddr_vm *addr)
+static int __vsock_bind_common(struct vsock_sock *vsk,
+			       struct sockaddr_vm *addr)
 {
-	struct net *net = sock_net(sk_vsock(vsk));
+	struct sock *sk = sk_vsock(vsk);
+	struct net *net = sock_net(sk);
 	struct sockaddr_vm new_addr;
+	bool dgram = sk->sk_type == SOCK_DGRAM;
 
 	if (!net->vsock.port)
 		net->vsock.port = get_random_u32_above(LAST_RESERVED_PORT);
@@ -854,7 +869,8 @@ static int __vsock_bind_connectible(struct vsock_sock *vsk,
 
 			new_addr.svm_port = net->vsock.port++;
 
-			if (!__vsock_find_bound_socket_net(&new_addr, net)) {
+			if (!__vsock_find_bound_socket_net(&new_addr, net,
+							   dgram)) {
 				found = true;
 				break;
 			}
@@ -871,16 +887,15 @@ static int __vsock_bind_connectible(struct vsock_sock *vsk,
 			return -EACCES;
 		}
 
-		if (__vsock_find_bound_socket_net(&new_addr, net))
+		if (__vsock_find_bound_socket_net(&new_addr, net, dgram))
 			return -EADDRINUSE;
 	}
 
 	vsock_addr_init(&vsk->local_addr, new_addr.svm_cid, new_addr.svm_port);
 
-	/* Remove connection oriented sockets from the unbound list and add them
-	 * to the hash table for easy lookup by its address.  The unbound list
-	 * is simply an extra entry at the end of the hash table, a trick used
-	 * by AF_UNIX.
+	/* Move the socket from the unbound list to the hash table for lookup
+	 * by its address. The unbound list is an extra entry at the end of
+	 * the hash table, a trick used by AF_UNIX.
 	 */
 	__vsock_remove_bound(vsk);
 	__vsock_insert_bound(vsock_bound_sockets(&vsk->local_addr), vsk);
@@ -888,11 +903,26 @@ static int __vsock_bind_connectible(struct vsock_sock *vsk,
 	return 0;
 }
 
-static int __vsock_bind_dgram(struct vsock_sock *vsk,
-			      struct sockaddr_vm *addr)
+/**
+ * vsock_bind_common - bind a socket using the core port allocator
+ * @vsk: socket to bind
+ * @addr: local address to bind to
+ *
+ * The caller must hold the socket lock.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int vsock_bind_common(struct vsock_sock *vsk, struct sockaddr_vm *addr)
 {
-	return vsk->transport->dgram_bind(vsk, addr);
+	int ret;
+
+	spin_lock_bh(&vsock_table_lock);
+	ret = __vsock_bind_common(vsk, addr);
+	spin_unlock_bh(&vsock_table_lock);
+
+	return ret;
 }
+EXPORT_SYMBOL_GPL(vsock_bind_common);
 
 static int __vsock_bind(struct sock *sk, struct sockaddr_vm *addr)
 {
@@ -914,13 +944,11 @@ static int __vsock_bind(struct sock *sk, struct sockaddr_vm *addr)
 	switch (sk->sk_socket->type) {
 	case SOCK_STREAM:
 	case SOCK_SEQPACKET:
-		spin_lock_bh(&vsock_table_lock);
-		retval = __vsock_bind_connectible(vsk, addr);
-		spin_unlock_bh(&vsock_table_lock);
+		retval = vsock_bind_common(vsk, addr);
 		break;
 
 	case SOCK_DGRAM:
-		retval = __vsock_bind_dgram(vsk, addr);
+		retval = vsk->transport->dgram_bind(vsk, addr);
 		break;
 
 	default:

-- 
2.56.0

