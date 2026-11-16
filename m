Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794800451;
	b=BZq+xue0JurEISx2tpYT7GZHDnIhr09jybZdP5scDsugWS7X5XkC3W5MJqmKSvkdoqAp
	 /nftUzhM8LWj/ZkIro50sASS/s6XQOKltc7zQND7+yXK+7/lSTGMMmfm+3sIW5Zh+1zUe
	 Ww+eGGtF4S73qRkx6UAJJ/EmQ7sDmDggNPmMEdMAPoMNhpbje0JvbNrwhPQoU0IxPCDA/
	 H/Ho6TvErmSvr3eigPipD8d8gjNowjy2NQARjnBYTHUOZud8qqpVTMy2BzaCXMQ8jeQHH
	 LEREmU6KEeV3gpRf7Z7Mxy3bdOBcJsfz03VyULrFB9PwWe4nglwL0WwgkqeSoiV4HfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794800451;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=jMwsAtKPzbVF9TJpB1cYijRDy7QgL41jMkdqG5ropFY=;
	b=wVrwt0t4IpnvcA8msIQ5d5VaIuaNoW8t6xtiW2m/UKafbynmfvDgZUOynqb+mi5GqeGe
	 ar2RJCYzTcayCHBr0NS2yeRwofW+GM3oDobbvz4P4+xWPIO5z/aE3qPd0ElQrTjpkqeMY
	 1AH7NCgpmNi6XIHC/cAT8HFfshzwD/vptEOSStd4Qag56v08NbOb4elwIkW0DDtWtvM+Z
	 n5St0ZyIltGKIjRVrS8bRduzok9DPOxTkTIcSVeSLwTe3eCO0adIhxwhFHf3l50Nx1/UT
	 W5i7mdyjNGdeZVJC6PSx48wa9w5diZjqGoO0evxU44M7QTddceNgGIy1Of6qcchH5fg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="xGZrC/G0";
	arc=none smtp.remote-ip=209.85.215.169
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB263606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 03:40:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB263606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xGZrC/G0
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cdb684859cbso2233921a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 19:40:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794800448; x=1795405248; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jMwsAtKPzbVF9TJpB1cYijRDy7QgL41jMkdqG5ropFY=;
        b=xGZrC/G0QZdh/g5ID0QNXp51qjsOlhhtQPPjE8z6E9gtcNDD2FRkz5oTIDoiVNZ26D
         DSljilZ6Lfxoa2iHhCmlk61qOAv8FuwjuS8nGeNZb2iEPJM+A3mdjQnhdTNWTaqRzYDU
         +ceJA7i9kboaAAW1JSMrRo8H1iVBBxR9mZOVxNhSOb0U1AKmWBW9DCXlTgCANMiJ+6Na
         qf6EnB5L3vnFnwAHT5E+RxBnvDsIEgs7mPZHvt4Hg69yQxRtQ3EhdGBe2GyjWhg5nTTY
         X3KqyKZmJ2nHXiyexeh4/VlFnO+MK/2D9eAkPtMOUOxrUtQAfpgltUjd6hA4hbsseNYQ
         Ye1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794800448; x=1795405248;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jMwsAtKPzbVF9TJpB1cYijRDy7QgL41jMkdqG5ropFY=;
        b=KCovOj2GCSaVNc+5Mr79sKt6RTR6h+F6A1uop91cgOrIcHCc4LRR9Te5hw6d/65bxC
         9LT+PGW5G20O9tMnTC62BJwN65XH96hyBb7qmo4DKgJqB/uyG/J1hxwjLIPBrk9qXV6d
         i49K2XRotZ+pJzWpg0X7gKvjrfOy0qCiI911Fx97CFIMRxo+yQU34GxgekVMwwolDrJ+
         aWUmgtBEVtF5KJf1e61nmt9ML8AhugK/z6iy7dAbOtlLk8N/zdQJRHX4jvysm40OOuNB
         rghoUf/FabF0YgXzYiq81xgL5EJVtpR/vCSStsrix9SsYAFY9YByPhs/SZ5uH4WEo7Ad
         2zMA==
X-Forwarded-Encrypted: i=1; AL+hErGlR7XaFHSY4gY1biE7x4hhzdO4wmVVpE9ZA1Y7lH/WT5yigPV0aPIsnLvHBgm19mQkkLRddTH9ssNnm58=@vger.kernel.org
X-Gm-Message-State: APuU4Z+zCTeFLX/UtjYJxLBfiL/1QUT+0xeAI3ik1GFn4aG9KSOt63Nx
	IZHp4ol+1VpBnDkGsDvH4eIpr070ceMRTKKYgRqXPBMI9GU0hxTNwSjk
X-Gm-Gg: AYBFou167k/5LkjhxTPiQstI/CYCQBR2riD6rEiMRVPdfv2/wcrCFiN3x2FQv/zChJ3
	6/SdIMLXDkHNO3vg6wGoP5VeQWEaCi4Or25EO1hjRNMyCdOsqWEw+z2tMRDu3aLEGs3uDe/tAl3
	Ek857q4UoDsGAckwogEbvwEGezs70LPYqR4PtS480SEQchnpM7Ti/iy30ixQzadwbRerBbr14Nw
	3h4p3z1frfc/1HeK0MIvNRI2pj+R9H+fJ92gzgSSBY4tGMHTfn+JCBBCv6IXWwY+74VMkQiVFtu
	VhHqFaotwOnRyTVHWzb4hUzOPlRIUeWfPhA967fQS4Y1RhrY5eV5dsEJiFNrj3ckw8Z3tQqfez1
	pV6e+DTNDIvFCPwSOAgt5v9W7bHA0QZenTsNoxIZgFr+aKq5B4okbTabh2ttVbiY9FohOzuVggT
	AHFo1rTI4Xi/sEcNxjBHtXdp1ltc5mWrUM0BxQxCxcm0kYvUOBvsIxyMeO9PBK2UUj4TqReSGRm
	1fbN2EgqZOFeQ6ye8B+eXAQ+gaFexD9G4H1x9hFPwDnAWhDSOd6HA7QttNZnYqVs71WsJiVdViT
	rNBZ7noZ9tS9q5ZI2xAiOf6dcoek3sydbOQdSDOJVA==
X-Received: by 2002:a17:90b:4a48:b0:3b0:c7ab:4644 with SMTP id 98e67ed59e1d1-3b1b09e6653mr9411807a91.14.1794800447937;
        Sun, 15 Nov 2026 19:40:47 -0800 (PST)
Received: from localhost.localdomain ([183.62.176.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1aed76745sm15359617a91.16.2026.11.15.19.40.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 19:40:47 -0800 (PST)
From: Yong Liu <pkfxxxing@gmail.com>
To: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
	Xin Long <lucien.xin@gmail.com>
Cc: Jakub Kicinski <kuba@kernel.org>,
	linux-sctp@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v3] sctp: fix use-after-free after association migration
Date: Mon, 16 Nov 2026 11:38:54 +0800
Message-ID: <20261116033855.1792036-1-pkfxxxing@gmail.com>
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

SCTP timers and ICMP error handling can cache asoc->base.sk before
locking it. If accept or peeloff migrates the association in between,
processing under the old socket lock can race with an abort on the new
socket that frees the association's queues. Transport and association
references do not keep those queues alive. With mdelay() instrumentation
widening the race, KASAN reported a slab-use-after-free in
sctp_chunk_abandoned() from the T3 retransmit path.

Recheck the association's socket after taking its BH lock and defer
mismatched timer callbacks through the existing retry path. Pass the
locked socket to the IPv4 and IPv6 ICMP handlers instead of rereading it,
and treat a mismatch like a busy socket before processing ICMP errors.

Use READ_ONCE() for socket pointer reads in these paths and receive/backlog
processing, paired with WRITE_ONCE() in sctp_assoc_migrate(). Take the new
socket reference before publishing it. The cached socket is protected by
BH context and the endpoint's RCU-deferred sock_put().

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Signed-off-by: Yong Liu <pkfxxxing@gmail.com>
---
Changes in v3:
- Update the commit message and subject as requested by Jakub Kicinski.

v2: https://lore.kernel.org/all/20261113032805.1447885-1-pkfxxxing@gmail.com/
Review: https://lore.kernel.org/all/20261115100933.75ae0534@kernel.org/

Changes in v2:
- Use Yong Liu for the author and Signed-off-by, as requested by Jakub
  Kicinski.
- Address Xin Long's review and the Sashiko ICMP finding: pass the locked
  socket to the IPv4/IPv6 error handlers and their UDP encapsulation
  callers, and revalidate it before immediate ICMP processing.
- Use READ_ONCE() for socket pointer reads in sctp_err_lookup(), sctp_rcv()
  and sctp_backlog_rcv().
- Broaden the subject and commit message to cover the ICMP paths.

v1: https://lore.kernel.org/all/20261110120212.1110283-2-pkfxxxing@gmail.com/

Based on b3dfbde62cf1981c4638939c159dfd087b7a72e9 (Linux 7.4.0-rc2).

 net/sctp/associola.c     |  4 ++--
 net/sctp/input.c         | 32 ++++++++++++++++---------------
 net/sctp/ipv6.c          | 11 ++++++-----
 net/sctp/sm_sideeffect.c | 41 ++++++++++++++++++++--------------------
 4 files changed, 45 insertions(+), 43 deletions(-)

diff --git a/net/sctp/associola.c b/net/sctp/associola.c
index 4521be3bd8..c5d520c8d7 100644
--- a/net/sctp/associola.c
+++ b/net/sctp/associola.c
@@ -1088,8 +1088,8 @@ void sctp_assoc_migrate(struct sctp_association *assoc, struct sock *newsk)
 	sctp_endpoint_hold(assoc->ep);
 
 	/* Get a reference to the new sock.  */
-	assoc->base.sk = newsk;
-	sock_hold(assoc->base.sk);
+	sock_hold(newsk);
+	WRITE_ONCE(assoc->base.sk, newsk);
 
 	/* Add the association to the new endpoint's list of associations.  */
 	sctp_endpoint_add_asoc(newsp->ep, assoc);
diff --git a/net/sctp/input.c b/net/sctp/input.c
index 9494cfa511..e25c94ad08 100644
--- a/net/sctp/input.c
+++ b/net/sctp/input.c
@@ -169,7 +169,7 @@ int sctp_rcv(struct sk_buff *skb)
 
 	/* Retrieve the common input handling substructure. */
 	rcvr = asoc ? &asoc->base : &ep->base;
-	sk = rcvr->sk;
+	sk = READ_ONCE(rcvr->sk);
 
 	/*
 	 * RFC 2960, 8.4 - Handle "Out of the blue" Packets.
@@ -217,7 +217,7 @@ int sctp_rcv(struct sk_buff *skb)
 	 */
 	bh_lock_sock(sk);
 
-	if (sk != rcvr->sk) {
+	if (sk != READ_ONCE(rcvr->sk)) {
 		/* Our cached sk is different from the rcvr->sk.  This is
 		 * because migrate()/accept() may have moved the association
 		 * to a new socket and released all the sockets.  So now we
@@ -226,7 +226,7 @@ int sctp_rcv(struct sk_buff *skb)
 		 * of the current sk.
 		 */
 		bh_unlock_sock(sk);
-		sk = rcvr->sk;
+		sk = READ_ONCE(rcvr->sk);
 		bh_lock_sock(sk);
 	}
 
@@ -292,7 +292,7 @@ int sctp_backlog_rcv(struct sock *sk, struct sk_buff *skb)
 		goto done;
 	}
 
-	if (unlikely(rcvr->sk != sk)) {
+	if (unlikely(READ_ONCE(rcvr->sk) != sk)) {
 		/* In this case, the association moved from one socket to
 		 * another.  We are currently sitting on the backlog of the
 		 * old socket, so we need to move.
@@ -304,7 +304,7 @@ int sctp_backlog_rcv(struct sock *sk, struct sk_buff *skb)
 		 * Otherwise, we can safely push the chunk on the inqueue.
 		 */
 
-		sk = rcvr->sk;
+		sk = READ_ONCE(rcvr->sk);
 		local_bh_disable();
 		bh_lock_sock(sk);
 
@@ -377,7 +377,7 @@ void sctp_icmp_frag_needed(struct sock *sk, struct sctp_association *asoc,
 	     t->pl.probe_size + sctp_transport_pl_hlen(t) <= pmtu))
 		return;
 
-	if (sock_owned_by_user(sk)) {
+	if (sock_owned_by_user(sk) || sk != READ_ONCE(asoc->base.sk)) {
 		atomic_set(&t->mtu_info, pmtu);
 		asoc->pmtu_pending = 1;
 		t->pmtu_pending = 1;
@@ -410,7 +410,8 @@ void sctp_icmp_redirect(struct sock *sk, struct sctp_transport *t,
 {
 	struct dst_entry *dst;
 
-	if (sock_owned_by_user(sk) || !t)
+	if (sock_owned_by_user(sk) || !t ||
+	    sk != READ_ONCE(t->asoc->base.sk))
 		return;
 	dst = sctp_transport_dst_check(t);
 	if (dst)
@@ -432,7 +433,7 @@ void sctp_icmp_proto_unreachable(struct sock *sk,
 			   struct sctp_association *asoc,
 			   struct sctp_transport *t)
 {
-	if (sock_owned_by_user(sk)) {
+	if (sock_owned_by_user(sk) || sk != READ_ONCE(asoc->base.sk)) {
 		if (timer_pending(&t->proto_unreach_timer))
 			return;
 		else {
@@ -492,7 +493,7 @@ struct sock *sctp_err_lookup(struct net *net, int family, struct sk_buff *skb,
 	if (!asoc)
 		return NULL;
 
-	sk = asoc->base.sk;
+	sk = READ_ONCE(asoc->base.sk);
 
 	/* RFC 4960, Appendix C. ICMP Handling
 	 *
@@ -526,7 +527,7 @@ struct sock *sctp_err_lookup(struct net *net, int family, struct sk_buff *skb,
 	/* If too many ICMPs get dropped on busy
 	 * servers this needs to be solved differently.
 	 */
-	if (sock_owned_by_user(sk))
+	if (sock_owned_by_user(sk) || sk != READ_ONCE(asoc->base.sk))
 		__NET_INC_STATS(net, LINUX_MIB_LOCKDROPPEDICMPS);
 
 	*app = asoc;
@@ -546,11 +547,11 @@ void sctp_err_finish(struct sock *sk, struct sctp_transport *t)
 	sctp_transport_put(t);
 }
 
-static void sctp_v4_err_handle(struct sctp_transport *t, struct sk_buff *skb,
+static void sctp_v4_err_handle(struct sock *sk, struct sctp_transport *t,
+			       struct sk_buff *skb,
 			       __u8 type, __u8 code, __u32 info)
 {
 	struct sctp_association *asoc = t->asoc;
-	struct sock *sk = asoc->base.sk;
 	int err = 0;
 
 	switch (type) {
@@ -582,7 +583,8 @@ static void sctp_v4_err_handle(struct sctp_transport *t, struct sk_buff *skb,
 	default:
 		return;
 	}
-	if (!sock_owned_by_user(sk) && inet_test_bit(RECVERR, sk)) {
+	if (!sock_owned_by_user(sk) && sk == READ_ONCE(asoc->base.sk) &&
+	    inet_test_bit(RECVERR, sk)) {
 		sk->sk_err = err;
 		sk_error_report(sk);
 	} else {  /* Only an error on timeout */
@@ -630,7 +632,7 @@ int sctp_v4_err(struct sk_buff *skb, __u32 info)
 		return -ENOENT;
 	}
 
-	sctp_v4_err_handle(transport, skb, type, code, info);
+	sctp_v4_err_handle(sk, transport, skb, type, code, info);
 	sctp_err_finish(sk, transport);
 
 	return 0;
@@ -660,7 +662,7 @@ int sctp_udp_v4_err(struct sock *sk, struct sk_buff *skb)
 	}
 	if (hdr->type == ICMP_DEST_UNREACH && hdr->code == ICMP_FRAG_NEEDED)
 		info = ntohs(hdr->un.frag.mtu);
-	sctp_v4_err_handle(t, skb, hdr->type, hdr->code, info);
+	sctp_v4_err_handle(sk, t, skb, hdr->type, hdr->code, info);
 
 	sctp_err_finish(sk, t);
 	return 1;
diff --git a/net/sctp/ipv6.c b/net/sctp/ipv6.c
index 97390569c4..f96e79ca7f 100644
--- a/net/sctp/ipv6.c
+++ b/net/sctp/ipv6.c
@@ -123,11 +123,11 @@ static struct notifier_block sctp_inet6addr_notifier = {
 	.notifier_call = sctp_inet6addr_event,
 };
 
-static void sctp_v6_err_handle(struct sctp_transport *t, struct sk_buff *skb,
+static void sctp_v6_err_handle(struct sock *sk, struct sctp_transport *t,
+			       struct sk_buff *skb,
 			       __u8 type, __u8 code, __u32 info)
 {
 	struct sctp_association *asoc = t->asoc;
-	struct sock *sk = asoc->base.sk;
 	int err = 0;
 
 	switch (type) {
@@ -149,7 +149,8 @@ static void sctp_v6_err_handle(struct sctp_transport *t, struct sk_buff *skb,
 	}
 
 	icmpv6_err_convert(type, code, &err);
-	if (!sock_owned_by_user(sk) && inet6_test_bit(RECVERR6, sk)) {
+	if (!sock_owned_by_user(sk) && sk == READ_ONCE(asoc->base.sk) &&
+	    inet6_test_bit(RECVERR6, sk)) {
 		sk->sk_err = err;
 		sk_error_report(sk);
 	} else {
@@ -181,7 +182,7 @@ static int sctp_v6_err(struct sk_buff *skb, struct inet6_skb_parm *opt,
 		return -ENOENT;
 	}
 
-	sctp_v6_err_handle(transport, skb, type, code, ntohl(info));
+	sctp_v6_err_handle(sk, transport, skb, type, code, ntohl(info));
 	sctp_err_finish(sk, transport);
 
 	return 0;
@@ -211,7 +212,7 @@ int sctp_udp_v6_err(struct sock *sk, struct sk_buff *skb)
 	}
 	if (hdr->icmp6_type == ICMPV6_PKT_TOOBIG)
 		info = ntohl(hdr->icmp6_mtu);
-	sctp_v6_err_handle(t, skb, hdr->icmp6_type, hdr->icmp6_code, info);
+	sctp_v6_err_handle(sk, t, skb, hdr->icmp6_type, hdr->icmp6_code, info);
 
 	sctp_err_finish(sk, t);
 	return 1;
diff --git a/net/sctp/sm_sideeffect.c b/net/sctp/sm_sideeffect.c
index 35f540fb15..bd6b23369f 100644
--- a/net/sctp/sm_sideeffect.c
+++ b/net/sctp/sm_sideeffect.c
@@ -233,15 +233,14 @@ void sctp_generate_t3_rtx_event(struct timer_list *t)
 	struct sctp_transport *transport =
 		timer_container_of(transport, t, T3_rtx_timer);
 	struct sctp_association *asoc = transport->asoc;
-	struct sock *sk = asoc->base.sk;
+	struct sock *sk = READ_ONCE(asoc->base.sk);
 	struct net *net = sock_net(sk);
 	int error;
 
-	/* Check whether a task is in the sock.  */
-
+	/* Defer if the socket is busy or the association has migrated. */
 	bh_lock_sock(sk);
-	if (sock_owned_by_user(sk)) {
-		pr_debug("%s: sock is busy\n", __func__);
+	if (sock_owned_by_user(sk) || sk != READ_ONCE(asoc->base.sk)) {
+		pr_debug("%s: sock is busy or moved\n", __func__);
 
 		/* Try again later.  */
 		sctp_transport_hold(transport);
@@ -271,13 +270,13 @@ void sctp_generate_t3_rtx_event(struct timer_list *t)
 static void sctp_generate_timeout_event(struct sctp_association *asoc,
 					enum sctp_event_timeout timeout_type)
 {
-	struct sock *sk = asoc->base.sk;
+	struct sock *sk = READ_ONCE(asoc->base.sk);
 	struct net *net = sock_net(sk);
 	int error = 0;
 
 	bh_lock_sock(sk);
-	if (sock_owned_by_user(sk)) {
-		pr_debug("%s: sock is busy: timer %d\n", __func__,
+	if (sock_owned_by_user(sk) || sk != READ_ONCE(asoc->base.sk)) {
+		pr_debug("%s: sock is busy or moved: timer %d\n", __func__,
 			 timeout_type);
 
 		/* Try again later.  */
@@ -362,7 +361,7 @@ static void sctp_generate_autoclose_event(struct timer_list *t)
 	sctp_generate_timeout_event(asoc, SCTP_EVENT_TIMEOUT_AUTOCLOSE);
 }
 
-/* Generate a heart beat event.  If the sock is busy, reschedule.   Make
+/* Generate a heart beat event.  If the sock is busy or moved, reschedule.   Make
  * sure that the transport is still valid.
  */
 void sctp_generate_heartbeat_event(struct timer_list *t)
@@ -370,14 +369,14 @@ void sctp_generate_heartbeat_event(struct timer_list *t)
 	struct sctp_transport *transport = timer_container_of(transport, t,
 							      hb_timer);
 	struct sctp_association *asoc = transport->asoc;
-	struct sock *sk = asoc->base.sk;
+	struct sock *sk = READ_ONCE(asoc->base.sk);
 	struct net *net = sock_net(sk);
 	u32 elapsed, timeout;
 	int error = 0;
 
 	bh_lock_sock(sk);
-	if (sock_owned_by_user(sk)) {
-		pr_debug("%s: sock is busy\n", __func__);
+	if (sock_owned_by_user(sk) || sk != READ_ONCE(asoc->base.sk)) {
+		pr_debug("%s: sock is busy or moved\n", __func__);
 
 		/* Try again later.  */
 		sctp_transport_hold(transport);
@@ -418,12 +417,12 @@ void sctp_generate_proto_unreach_event(struct timer_list *t)
 	struct sctp_transport *transport =
 		timer_container_of(transport, t, proto_unreach_timer);
 	struct sctp_association *asoc = transport->asoc;
-	struct sock *sk = asoc->base.sk;
+	struct sock *sk = READ_ONCE(asoc->base.sk);
 	struct net *net = sock_net(sk);
 
 	bh_lock_sock(sk);
-	if (sock_owned_by_user(sk)) {
-		pr_debug("%s: sock is busy\n", __func__);
+	if (sock_owned_by_user(sk) || sk != READ_ONCE(asoc->base.sk)) {
+		pr_debug("%s: sock is busy or moved\n", __func__);
 
 		/* Try again later.  */
 		sctp_transport_hold(transport);
@@ -454,13 +453,13 @@ void sctp_generate_reconf_event(struct timer_list *t)
 	struct sctp_transport *transport =
 		timer_container_of(transport, t, reconf_timer);
 	struct sctp_association *asoc = transport->asoc;
-	struct sock *sk = asoc->base.sk;
+	struct sock *sk = READ_ONCE(asoc->base.sk);
 	struct net *net = sock_net(sk);
 	int error = 0;
 
 	bh_lock_sock(sk);
-	if (sock_owned_by_user(sk)) {
-		pr_debug("%s: sock is busy\n", __func__);
+	if (sock_owned_by_user(sk) || sk != READ_ONCE(asoc->base.sk)) {
+		pr_debug("%s: sock is busy or moved\n", __func__);
 
 		/* Try again later.  */
 		sctp_transport_hold(transport);
@@ -492,13 +491,13 @@ void sctp_generate_probe_event(struct timer_list *t)
 	struct sctp_transport *transport = timer_container_of(transport, t,
 							      probe_timer);
 	struct sctp_association *asoc = transport->asoc;
-	struct sock *sk = asoc->base.sk;
+	struct sock *sk = READ_ONCE(asoc->base.sk);
 	struct net *net = sock_net(sk);
 	int error = 0;
 
 	bh_lock_sock(sk);
-	if (sock_owned_by_user(sk)) {
-		pr_debug("%s: sock is busy\n", __func__);
+	if (sock_owned_by_user(sk) || sk != READ_ONCE(asoc->base.sk)) {
+		pr_debug("%s: sock is busy or moved\n", __func__);
 
 		/* Try again later.  */
 		sctp_transport_hold(transport);
-- 
2.43.0

