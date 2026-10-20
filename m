Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.222
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792488091;
	b=4ZBbpYDqc5jiJkF/yrSe8qQJGJ3ZRXi+kIWQot42C/OoG1xt7xAf8OpcMD22ZDhXjBmu
	 1e9IOm319UsmKz6SRIw1J4p29SqzkXgtMpOIAYE9Cci1D8Um6vxRPhNqOFtCELdMhq4+A
	 liuaG8sakzfdKv/G1NYdM3Ec/HWwmGqF4cqKbZd/qMugRVSwu5QnqHkXcoBtqWV6/1/vx
	 YdeTTA/8aLp/cJLGuVKtUB7M8p0SgpER9MA69OsAEcmUWgJImpJYBeroDutuKxG3Fg40H
	 GQhZgtlcA1WvUlMjVoXYNZTXxlRw+JrRwAPy+x7t3S9ek+dfb+PONdWHaBhs5SiM3GQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792488091;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=OyLLAUQgg2lsg9dQ6S3FRdSjv0JAJE2gYyPiInB6GMk=;
	b=FE2YPcnjUC7eSv9vdhk8Px5Hyflf9CbJV9bEnBwr793STmtzGtR6OjrjS2jSRqoLUj/P
	 TVVvFyGngvPQjhtGOamUVscvhNf0S3kgsl2wXPYCH3lHZfqRyGbd5SNxtdCEPkl8SpdzH
	 ljI2WfYXgyASDOWo1tKY7M1zJbwwz4I5vM5TQ4kCaj6Jh7klAkPSALW86F6WHF0z0VAZH
	 N7Qz/4XVSQZRJ0fmBfDuESNhcD49jfd5ahZ0f1Hb2h88XXjTMZMwkzSZttr4u+aJrBrYI
	 iIHTjnDtGsaocWw5O4Qqn3bTN5D6wHUuiOymZWgBWyz/LoiiGq5cBf4fFRz62oN9fow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=DeJcECNi;
	arc=none smtp.remote-ip=95.215.58.222
Received: from mta1.migadu.com (out-222.mta1.migadu.com [95.215.58.222])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D885A606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 09:21:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D885A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=DeJcECNi
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=YNTKApM0NRZweSbGwqQREeW9XGzGVWqnor/S3lp0hng=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792488087; v=1; x=1793092887;
 b=DeJcECNiuHs+hoCDz8hqLT5qHF+kZIQojZ8CCusexWrdskmYUVTcgzSojnw8GZHasrTN9Voy
 TfjrlIhRWkcYoueir1+SHTA1VxdLMJF4xd5o70zPy9nuu/5zWapv+qizd5qRLV4pmrbGCy7Pk+Y
 jKweFhN53seqcKYL8okOv978=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id ce2fc71dc6064e2e;
	Tue, 20 Oct 2026 09:21:27 +0000
X-Mizu-Trace-ID: ce2fc71dc6064e2e
X-Migadu-Flow: FLOW_OUT
From: Qingfang Deng <qingfang.deng@linux.dev>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Qingfang Deng <qingfang.deng@linux.dev>,
	Kees Cook <kees@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Asim Viladi Oglu Manizada <manizada@pm.me>,
	Eric Woudstra <ericwouds@gmail.com>,
	Felix Fietkau <nbd@nbd.name>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH net] pppoe: delete session hash entries by pointer match
Date: Tue, 20 Oct 2026 17:21:11 +0800
Message-ID: <20261020092118.47416-1-qingfang.deng@linux.dev>
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

pppoe_connect() copies the requested PPPoE address to a socket before
attempting to insert the socket into the session hash table. If the
tuple already exists, __set_item() returns -EALREADY, but the copied
address and ifindex remain set on the failed socket.

Closing that socket then deletes the existing socket's hash entry
through pppoe_release(), preventing it from receiving further session
traffic. An unprivileged process in the same network namespace can
trigger this through a duplicate connection attempt.

To avoid the accidental delete, pass the pppox_sock to __delete_item(),
and unlink only an entry whose pointer matches the requested socket.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Signed-off-by: Qingfang Deng <qingfang.deng@linux.dev>
---
 drivers/net/ppp/pppoe.c | 22 ++++++++--------------
 1 file changed, 8 insertions(+), 14 deletions(-)

diff --git a/drivers/net/ppp/pppoe.c b/drivers/net/ppp/pppoe.c
index bf7414b46a26..ee0e318d6a2a 100644
--- a/drivers/net/ppp/pppoe.c
+++ b/drivers/net/ppp/pppoe.c
@@ -194,18 +194,16 @@ static int __set_item(struct pppoe_net *pn, struct pppox_sock *po)
 	return 0;
 }
 
-static void __delete_item(struct pppoe_net *pn, __be16 sid,
-					char *addr, int ifindex)
+static void __delete_item(struct pppoe_net *pn, const struct pppox_sock *po)
 {
-	int hash = hash_item(sid, addr);
+	int hash = hash_item(po->pppoe_pa.sid, po->pppoe_pa.remote);
 	struct pppox_sock *ret, __rcu **src;
 
 	ret = rcu_dereference_protected(pn->hash_table[hash], lockdep_is_held(&pn->hash_lock));
 	src = &pn->hash_table[hash];
 
 	while (ret) {
-		if (cmp_addr(&ret->pppoe_pa, sid, addr) &&
-		    ret->pppoe_ifindex == ifindex) {
+		if (ret == po) {
 			struct pppox_sock *next;
 
 			next = rcu_dereference_protected(ret->next,
@@ -236,11 +234,10 @@ static inline struct pppox_sock *get_item(struct pppoe_net *pn, __be16 sid,
 	return po;
 }
 
-static inline void delete_item(struct pppoe_net *pn, __be16 sid,
-					char *addr, int ifindex)
+static void delete_item(struct pppoe_net *pn, const struct pppox_sock *po)
 {
 	spin_lock(&pn->hash_lock);
-	__delete_item(pn, sid, addr, ifindex);
+	__delete_item(pn, po);
 	spin_unlock(&pn->hash_lock);
 }
 
@@ -570,8 +567,7 @@ static int pppoe_release(struct socket *sock)
 	 * protect "po" from concurrent updates
 	 * on pppoe_flush_dev
 	 */
-	delete_item(pn, po->pppoe_pa.sid, po->pppoe_pa.remote,
-		    po->pppoe_ifindex);
+	delete_item(pn, po);
 
 	sock_orphan(sk);
 	sock->sk = NULL;
@@ -621,8 +617,7 @@ static int pppoe_connect(struct socket *sock, struct sockaddr_unsized *uservaddr
 	if (stage_session(po->pppoe_pa.sid)) {
 		pppox_unbind_sock(sk);
 		pn = pppoe_pernet(sock_net(sk));
-		delete_item(pn, po->pppoe_pa.sid,
-			    po->pppoe_pa.remote, po->pppoe_ifindex);
+		delete_item(pn, po);
 		if (po->pppoe_dev) {
 			dev_put(po->pppoe_dev);
 			po->pppoe_dev = NULL;
@@ -672,8 +667,7 @@ static int pppoe_connect(struct socket *sock, struct sockaddr_unsized *uservaddr
 
 		error = ppp_register_net_channel(dev_net(dev), &po->chan);
 		if (error) {
-			delete_item(pn, po->pppoe_pa.sid,
-				    po->pppoe_pa.remote, po->pppoe_ifindex);
+			delete_item(pn, po);
 			goto err_put;
 		}
 
-- 
2.43.0

