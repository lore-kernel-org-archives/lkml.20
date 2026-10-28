Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793204415;
	b=fCvMlPE8ekJNQKJasYew2L3DtGomlC8xkygDNGLpgLG9Ev/9KIiofDGqIgg7iP7t2Avr
	 j0KKzIeJV7eh0GqJQxkvfMWp7rbNdceDIPo69ViSO5tDp8NTKy56agBp6fTeIRVA5O7FV
	 RyxAQTW7IukxWC+xylZG1//VVyr9NTCXO9Hm5qDLQDE3D9v6jPucClsnrEM682dtoYwM2
	 gSFPBHv2hALDnVZvlrHdPzZntMyqYgqrrZnnGTY2CZVY4kseNoVJWLbcxPM7Vlf5s20rM
	 0s0IoxZ9oRFpnEkjM26IQJNFUPx6NR0Zn8B0XR/DBRM8ejGYpRnLfeSNZ74Y28+DIIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793204415;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:In-Reply-To:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=1FCShw/w+0/Qgo+QANKmmkw+M3AH8C1BuscjzFqFcA4=;
	b=cDvumHkwh8f+MKvvELpQ7CimvjR5TkOztDyzeuL6yT7VJ3vEQvmKofVhduY0hYH/1iPx
	 JvsdUu6zDEMsk8g3W7zZsm36P3IKOHPAg2TZgq2wnWSJwbc0ekQTPaiS0XRWJYy8NzqfF
	 Us+dMPTRsXUiOPRgtenZ1kH+kbHVPZLxxjE13Ryif6AZYY9NAkBayaEGJJ9NMcrwFDVJO
	 JF9ase0nBttIVIVNT2PllJbuRM/CbOM6yMVR3vXwMuRBqeqoT+1U/VwnFR2yLCiCfSpL+
	 A8O6iuEtLsX8OroVc0B9ErTE30H2th9+5xOwgJr1gZcYRfvHIh+kM0t1hPQXbIMVLCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.210.72
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5820C606A31F
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 16:20:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5820C606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-8210034ccc0so1506704a34.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:20:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793204414; x=1793809214;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1FCShw/w+0/Qgo+QANKmmkw+M3AH8C1BuscjzFqFcA4=;
        b=QGA/0Kfv5jCSKjRj1Pb7CpCfoeIs03rKBz7xUc/jq19sFA19FHP+1L1ZmbUwYdPCuM
         LZl7fwNlxN7VvHd7eJftbKnYvNT3Xml6Cvodzb/AS24evzedegKqCrwvomdI5c+8uOVM
         TzY5qOguJ8wS9DbZ/WjNjJbraoenMUoJpFqpM01e4HXAskchMZrhxqZELNCo5Yub8PcY
         PivyrTNkmJZwjw0H3T4DgpW33aSTODwyohAi+LjRG+NOGgZth9293J4a/xW27OsvT2E9
         u6Hh9Gco57OIkmzvz1m9ziqSooYkXG2IyQOKJulffnIg6XE1Uoxh/noGKk6wjv4/rHjP
         pUiA==
X-Gm-Message-State: AFq9FYIsnykBjJo+YP59gM1HbZEUCTx1S0Vi0FWDhhRav6q4M2pYMqG5
	ezRK+NIpXyl7bYZqQkbn8cDNuhZ8M+e27nh4ybbDGelCD0QkTp/Fztrzfl67CL+hG0RlqQ98PEK
	hDx/Bx7JV3tbBGGGOpHvMMCma4XD2lHX92HvzOPgGlyHwY3VCe2h6LLv245E=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:2384:b0:4e4:4b49:3a2d with SMTP id
 5614622812f47-56385c466f1mr1903139b6e.19.1793204414341; Wed, 28 Oct 2026
 09:20:14 -0700 (PDT)
Date: Wed, 28 Oct 2026 09:20:14 -0700
In-Reply-To: <000000000000bb900e061440909c@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ae220be.cbab20e0.42a9b.000e.GAE@google.com>
Subject: Forwarded: Re: [syzbot] [tipc?] BUG: soft lockup in do_sock_setsockopt
From: syzbot <syzbot+10a41dc44eef71aa9450@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org.

***

Subject: Re: [syzbot] [tipc?] BUG: soft lockup in do_sock_setsockopt
Author: immersa.bartosz.chronowski@gmail.com

#syz test: https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net.git 6430fb7f1cc4e329e386521b7b208df443de92f2

diff --git a/net/tipc/socket.c b/net/tipc/socket.c
index 65cc0c4964b31ff3174b0947659e928029247ef5..b03dd4a3d3ea293ef347a8abfe45bbcd83621dc6 100644
--- a/net/tipc/socket.c
+++ b/net/tipc/socket.c
@@ -94,6 +94,7 @@ struct sockaddr_pair {
  * @peer: 'connected' peer for dgram/rdm
  * @node: hash table node
  * @mc_method: cookie for use between socket and broadcast layer
+ * @backlog_work: processes receive backlog under socket ownership
  * @rcu: rcu struct for tipc_sock
  * @group: TIPC communications group
  * @oneway: message count in one direction (FIXME)
@@ -128,6 +129,7 @@ struct tipc_sock {
 	struct sockaddr_tipc peer;
 	struct rhash_head node;
 	struct tipc_mc_method mc_method;
+	struct work_struct backlog_work;
 	struct rcu_head rcu;
 	struct tipc_group *group;
 	u32 oneway;
@@ -143,6 +145,7 @@ struct tipc_sock {
 };
 
 static int tipc_sk_backlog_rcv(struct sock *sk, struct sk_buff *skb);
+static void tipc_sk_backlog_work(struct work_struct *work);
 static void tipc_data_ready(struct sock *sk);
 static void tipc_write_space(struct sock *sk);
 static void tipc_sock_destruct(struct sock *sk);
@@ -499,6 +502,7 @@ static int tipc_sk_create(struct net *net, struct socket *sock,
 	/* Finish initializing socket data structures */
 	sock->ops = ops;
 	sock_init_data(sock, sk);
+	INIT_WORK(&tsk->backlog_work, tipc_sk_backlog_work);
 	tipc_set_sk_state(sk, TIPC_OPEN);
 	if (tipc_sk_insert(tsk)) {
 		sk_free(sk);
@@ -2428,6 +2432,17 @@ static int tipc_sk_backlog_rcv(struct sock *sk, struct sk_buff *skb)
 	return 0;
 }
 
+static void tipc_sk_backlog_work(struct work_struct *work)
+{
+	struct tipc_sock *tsk = container_of(work, struct tipc_sock,
+					     backlog_work);
+	struct sock *sk = &tsk->sk;
+
+	lock_sock(sk);
+	release_sock(sk);
+	sock_put(sk);
+}
+
 /**
  * tipc_sk_enqueue - extract all buffers with destination 'dport' from
  *                   inputq and try adding them to socket or backlog queue
@@ -2445,18 +2460,30 @@ static void tipc_sk_enqueue(struct sk_buff_head *inputq, struct sock *sk,
 	struct sk_buff *skb;
 	unsigned int lim;
 	atomic_t *dcnt;
+	bool deferred = false;
+	bool owned;
+	bool local_backlog;
 	u32 onode;
 
 	while (skb_queue_len(inputq)) {
 		if (unlikely(time_after_eq(jiffies, time_limit)))
-			return;
+			break;
 
 		skb = tipc_skb_dequeue(inputq, dport);
 		if (unlikely(!skb))
-			return;
+			break;
 
-		/* Add message directly to receive queue if possible */
-		if (!sock_owned_by_user(sk)) {
+		/*
+		 * A local Nagle backlog may loop back into this socket while its
+		 * spinlock is held.  Queue the triggering input for processing under
+		 * socket ownership, which keeps a concurrent sender from overtaking
+		 * the already queued output.
+		 */
+		owned = sock_owned_by_user(sk);
+		local_backlog = !owned && !skb_queue_empty(&sk->sk_write_queue) &&
+				in_own_node(sock_net(sk),
+					    tsk_peer_node(tipc_sk(sk)));
+		if (!owned && !local_backlog) {
 			tipc_sk_filter_rcv(sk, skb, xmitq);
 			continue;
 		}
@@ -2467,6 +2494,7 @@ static void tipc_sk_enqueue(struct sk_buff_head *inputq, struct sock *sk,
 			atomic_set(dcnt, 0);
 		lim = rcvbuf_limit(sk, skb) + atomic_read(dcnt);
 		if (likely(!sk_add_backlog(sk, skb, lim))) {
+			deferred |= !owned;
 			trace_tipc_sk_overlimit1(sk, skb, TIPC_DUMP_SK_BKLGQ,
 						 "bklg & rcvq >90% allocated!");
 			continue;
@@ -2483,6 +2511,12 @@ static void tipc_sk_enqueue(struct sk_buff_head *inputq, struct sock *sk,
 		}
 		break;
 	}
+
+	if (deferred) {
+		sock_hold(sk);
+		if (!schedule_work(&tipc_sk(sk)->backlog_work))
+			sock_put(sk);
+	}
 }
 
 /**
