Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794540550;
	b=lAeZnOi4nEwJLv2z+PBXG33U7E3m9ud6/XEbcGLoGox5+6HeZ1tENqrxoMwExlJ2JeBx
	 4vK9Si3ADCJEo1PhO6mK/7hmluHsLCYCFL9Ye8xIQx4OiH8Cq9KSvBjUC3mQb992bH3gk
	 y6lyWa4GSHs8qTR/8UaY9mElWvBZwssH0fGZ7zunZR6Z1jTxtTrotYkWojItTqLarVRHr
	 syWAZ6H4mEkEgiBZjryfX1IFandYLaQ0cf9bP8A7mB3HFGROycvSkAzkdlOIKePGRensd
	 ytJycqasDo5H2HTF15CN+oigfHidH2NLyW3eu0P5FAIS6blHzmGNEd3BiB32WR0e+VQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794540550;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=sfS7nB4gtLu1FKmXvUmoI2KWykiSmHoqnc+SrZgTJWU=;
	b=G/WpcK+5M8L/fRArTR4j3GVshs0n52kfNbDXu/QXcVZB+OP1SU8qcy0k0LU9AskE4nus
	 DpSvO48GdvrgZ5eKMHU1fMlzR+3KYDBZ8w4Ix7sNrlEtZ85K8yZ0HLOLkafm2M5/Vn789
	 FRG+iLmKpFWoDlUB7WEEpHDBSWaz6ljb0pZxXoEvZArB+3rVsmTeGmSjnOhD+YPZeNB+t
	 vI9ldvA22pNZw8bmIpcKjHAXIiVqrpK4ENIKWbgjfzwGXhae4XA7bTmhFvsI2kbHd6zzm
	 CXisnR1k7cee2QZB4WTZzkCoUPkn92w1w/dO+DJhaZ23oB85VO545CNDtRMckwgxi9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b+cixmrE;
	arc=none smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECF99606A327
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 03:29:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECF99606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b+cixmrE
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cd8ba7c2694so191494a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 19:29:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794540544; x=1795145344; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sfS7nB4gtLu1FKmXvUmoI2KWykiSmHoqnc+SrZgTJWU=;
        b=b+cixmrEkhG8B2FLuslGH/982o8yDK4CKzbnMcESoppN1oTQOqPMvYmraVAajZw7UO
         lHGal90PN4yXv+1CZIGgzuveVliopVzmJs4CYVZsxjc4TVRaPOCb0s/wEhw5NUlmIgkm
         8CYNhOv6dPEG5UcpOic1h33f4VgUaoU8sOW6LeGSvsLJBkQ3OftQpqu4l5j+PRbBaptG
         yHcu4QoQNbNIvujdjt8niVrtl3v+qfj6+HP7jpptE0/7LlQtYcZvFS3KEr2fiWlZbEM7
         crk4t7XR7cIPxfTvKXrPLGrFIDEbWPOiLIBbtwae/GvvV+KcLRUBVPR3ZdDYrcWU200B
         ou/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794540544; x=1795145344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sfS7nB4gtLu1FKmXvUmoI2KWykiSmHoqnc+SrZgTJWU=;
        b=JMgkeIQ7rTaeqbJ+kD+sMgUIWiYlcIPQFlZKGPqBePGtSs9EemF7TmtWqjF1Jcu8Oa
         VvzpRjkmL50MfVAXmQaY5CGIvLP/txSCT81iUeBrrKSZnysY5pcEmJ5lVBmf/LuRru3s
         XcMaRmLU2VTUmQfJ1J34xznqBHbzUB498/ZIsP/mxi821eXNeqKiJigdM7kahm8pagfk
         GfXpqvbT6/o/dhqs5AlXVJXY7uXhqu7LFP6csAXiGLLLdXW4iU365WOO59g2W4eGLhI8
         f5IF6kN10QsQGq16bpCw6cjup7A1vJ0yrBX0mcRRs3l3jAZQr0APRiTGAhGvTgI2llTp
         ij1g==
X-Forwarded-Encrypted: i=1; AL+hErFqbiTa7/N//c1VtztFpF825GURHB+NsGOLLxPUVs7jjOS13nBXKn0ZFXIhc6Tve+IQd0rPF+F1Q1kN5Xc=@vger.kernel.org
X-Gm-Message-State: APuU4Z91c+ipBBdRokmKZHG75enhoedtwPRRhVoS+9xKzhXqzC/qLihI
	/d6I2cCMqs/eNyNYm/GDjjVmj1raCtdrBkwRcZ3d7K8TxSJqPF15MODeTH1Ll0ND2jJxrw==
X-Gm-Gg: AYBFou3hZWVk6nmACxstcvywotZ72E6zb4ybs91S8IynhanHUWvoDfxVqh6eWl1W9/9
	itC+LDktf8tG4WXxf+fZNTNMAW6D8C3vAqKrwvTxxg/iMui+bGOh73D4JsrVoLl2nKfssEM5Qhz
	CDh4hG0vhxyNSm1YgQmbB3nciuWLLxlarYjXDVpq7SY1Pe7FKtTfab+yHVcNFjhu4/p1aGNssEf
	/QCXCXGgaaN1wUvfOKg0D3eJPLpqE4amV8unra/vML2BlfIcUN41e3zWnekh+CphkbRecOv5F1y
	nYga9/vPX1SuYvUcyqXi367szDoQIuilKHUXQzO4YkYKpILjT7DdT0HsLhjYzl+S3t5vJDLrFjI
	CRUaLqQoiuPWS1nkNj3XocqUQ6PgLTXWLIgBZ1VvM757UD7DW7MedNzO6jwuyrLiOIfzHzjDpad
	4u01ZjECyLf4Gcojlxf/B6LCUL65IF9GH5e8vsYiIz6HuA+xzWQDrU7xqX+OSykKF5xsY6UCgGq
	N4wK1opngONPaOw/y/9t2v7ffgp1yP9fpVmadfwcDlICLoVYfsCVK0RyQagPnkmmcdOv/wwluAU
	lrBD3hJKyzqBnz80m+yWquGHmGpfsr0aIh+KUDe5cA==
X-Received: by 2002:a17:90a:c2c8:b0:3ac:80dc:f40c with SMTP id 98e67ed59e1d1-3b1b0a0e9fbmr951734a91.14.1794540543447;
        Thu, 12 Nov 2026 19:29:03 -0800 (PST)
Received: from localhost.localdomain ([223.104.68.104])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d32ea0sm7087063a91.15.2026.11.12.19.28.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 19:29:02 -0800 (PST)
From: Yong Liu <pkfxxxing@gmail.com>
To: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
	Xin Long <lucien.xin@gmail.com>
Cc: Jakub Kicinski <kuba@kernel.org>,
	linux-sctp@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v2] sctp: revalidate association sockets after locking
Date: Fri, 13 Nov 2026 11:28:02 +0800
Message-ID: <20261113032805.1447885-1-pkfxxxing@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261110120212.1110283-2-pkfxxxing@gmail.com>
References: <20261110120212.1110283-1-pkfxxxing@gmail.com> <20261110120212.1110283-2-pkfxxxing@gmail.com>
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

SCTP timer callbacks and ICMP error lookup cache asoc->base.sk before
acquiring its BH lock. An accept or peeloff can move the association to
a new socket in between. Processing under the old socket lock can then
race with an abort on the new socket that tears down the association's
queues. Transport and association references do not keep those queues
alive. With mdelay() instrumentation widening the race, KASAN reported a
slab-use-after-free in sctp_chunk_abandoned() from the T3 retransmit path.

The ICMP error handlers also reread asoc->base.sk after lookup, so they
can use the new socket without holding its BH lock. In particular, the
PMTU handler can reach the same retransmit path, while protocol-unreachable
handling can run the state machine directly.

Recheck the association's socket after locking it in the timer callbacks.
Treat a mismatch like a busy socket and use the existing reference-counted
retry path. Pass the socket locked by sctp_err_lookup() to both IPv4 and
IPv6 error handlers, including their UDP encapsulation callers. Defer PMTU
and protocol-unreachable processing and ignore redirects when that socket
no longer matches the association. Require a matching socket for immediate
error reports as well.

Use READ_ONCE() for the socket pointer reads in the timer, ICMP, receive
and backlog paths, paired with WRITE_ONCE() in sctp_assoc_migrate(). Take
the new socket reference before publishing its pointer. The cached socket
is protected by BH context and the endpoint's RCU-deferred sock_put().

The issue was discovered and fixed by Qihoo 360's Tulongfeng multi-agent
system.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Signed-off-by: Yong Liu <pkfxxxing@gmail.com>
---
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

