Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793702431;
	b=a8za7XxSlOzn4KZe02tB2TSK5hNklbNbxUs0B7Ocx1ITjZYn3iQQehRnDnaRdZPWoZ3W
	 Js9aTVoHko6HjlqthbUNNS3TWtQo3HkDu5O72K3Pst87/H9LP5v7rNcelJvHc6L3NrZEx
	 erIQLbgymmdj0uPKe+5sFZvwWgqgl8VwmxqFlUXSeh4MFMnT2PdrDxwEwpd4XVnUonlHl
	 2Ic0cdWXR8qGmboAzhoH6AlNgQ5gmQyMXinusJTS8p5/LeuwaPUuPk2+LBH/TqQ+mOfbR
	 ZGJnOj7OtSV/xb28KlaQOICsUVxQp9yeCqfu1NTZxsgSu5U2+QaFf5z8Rn4jez17hcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793702431;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=WwDr7AR3Yel0vmHw532J1yhKIdIYegdDoVEAcqR8ZcY=;
	b=uCZJVxi9Njyc6blCM8UaJiFLYDjqUEKgAiSzTApV52rf/6dHHFVKcmdwx692vnv+Xuab
	 mi8xNP1PgMBg0YzQe40Iu7rnJk2XcdlXYnwEyna09sTJA7/H7jMqtgLKLYgB7WWmyKXFf
	 6NhMsmvaX5dJHi86rR8DmzmYu4FXPkPhOqVjaQMU44rCdb1g/Xdv9GTvYMlmvnMbaTETT
	 qEpJ6pT4kai9hukQjJG7lrr7I8BR0qPc49iWP9WGlTe+KatNalDoCtGynS2xV4riSuibg
	 b3AFYRHp5Bpi/5ruDZMS7hxjwOY4rrhs464IM8bw5G5BifM5TQtYkalsB4Sp7vX9pkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BSwbOtXA;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71985606A336
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 10:40:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71985606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BSwbOtXA
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso3914495eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 02:40:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793702429; x=1794307229; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WwDr7AR3Yel0vmHw532J1yhKIdIYegdDoVEAcqR8ZcY=;
        b=BSwbOtXASJL5MpWs18FHADRwIStEW0fcE4XYA8I3sUUookk9VeJrSNK/Tx1w6wCd7S
         LMgLVeEj6e4oYNbfvSZh7VlQWVJc05ofSEyrcpp/lSGIdAZbbu5s5S2kHm3vHp1qgScK
         4rjzENtjj3+d+g1sGPosnipYwCNUbo9O63OdIQ0qbnsaLnLq++mc/iOZGb7U6lXAxeWH
         SgmzWjcykl/s8m9ZbTsVniygLfJ8uGqsOkuGtY8r+Pi1xYj703wFQdyKRIIeggFGH0+w
         wBxPAucgw1vpIVTjl7UiDT1roxagLQ1EGTErr7BwHoC0vcdyHmI3PGk1tqbec2r7wm15
         o9eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793702429; x=1794307229;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WwDr7AR3Yel0vmHw532J1yhKIdIYegdDoVEAcqR8ZcY=;
        b=dXsrIVNe1ArUAXk2piww1Yo5huzSXNJBbn7ho1e4rWatYTxnZkokxUq955/B1+ee2H
         Yj9eO5lfq2mihM/iLaZw/C5Eq1GOwycHUGd/ZSq9b0aak8dJ7DE0c1AKgkg6vJPxifqf
         T1NEWmMLEiWqtL9exyJs1aDkvP/rsGYvNhmYsb8AEAOoOMpFPwv8fGBDkS6+lXlen9M0
         UqWSaUYXmTOQj5z6S0VrFJGEtGIP50BlfxyjoW6nwhA5hcJuD+JUWcn/U/t/4ukHJLRq
         5j9bo04Oq7lhFJjdXrwt3G13JMMQCEkskmAxhKn43eQqDrvWEuN5HCHxQuyrfBH4wFol
         eyjw==
X-Forwarded-Encrypted: i=1; AKwUvBznuB7TBGNDIDA7aIHz+kl52nF9tqnrf/H3zeVMbQQns85KnWgIc+xK7y9WXMtE3akUqwB0IAUlj70HU4s=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Q+8znDjkLYzhVSzkqMGc06AsaYFoJsCwvRyzUaZ1YYtquMDY3
	Ew5ixugqpRwer+G42BM4wrPaxmaU6nbYQeXRj2s4RNdkD+wvpwesE4lv
X-Gm-Gg: AYBFou1BKl2lPMw8G9/M7aCQi4ywcUwRLTLQlrjSkTS52dI/9O++ClVXxaWTTo0u8Ao
	rdFHxfiXoN8kkvAjMm4A7PChcKjSCGaURSopimGPea2u1fXFEsGVrUVsPpHpaJuz77pMYgh0mY6
	9bN0eMBkNHsqIhHxdu2rIAmouE/DnHHPQ6QQ95JRf59GEydtR/6VShk0qvP+xZYQztzE/foj4AP
	tsJT8HLZll5L7J3YsNxHVFZK1p1Dh6//BMfVvHgsYG71sTfUEQBNw2p2/BbY80llkMqWEWDkAMh
	vuRSVv3yMzxo9GL1Aq4ds7eiTm9Foy3eIxr2hxBrsFFEHQoYhvswah7EawBtMOd4Comjx923Khi
	caoOSqypP2oR1ZRAhf3ds3aQcaqYb5ilsSGmEHn1OxNy2/Gx/XQu2UCUSiyTYTjoW3Ynq5cD3yz
	7gLdMlRPXpOy83Uwm5bBDlrgLpwFyPzaN57eKb5H3tDcdWixY5/29LO4pQiWV+xoWNHZ+JlxJsZ
	g6bR/e56sYOqFB9YY59O3DnhaAD9YUVL2EzpN9cpgAqycQHMjUIexvW0jPExMLCWlDTMkfMFyGF
	Eh2gYUgE/lZczae2q1XxXg==
X-Received: by 2002:a05:7301:2710:b0:351:207d:bff4 with SMTP id 5a478bee46e88-36a42203e2bmr20325803eec.4.1793702429355;
        Tue, 03 Nov 2026 02:40:29 -0800 (PST)
Received: from lion.. ([104.192.92.238])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36b13bd87b2sm6024447eec.28.2026.11.03.02.40.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 02:40:28 -0800 (PST)
From: Zhiyu Zhang <zhiyuzhang999@gmail.com>
To: Eric Dumazet <edumazet@kernel.org>,
	Kuniyuki Iwashima <kuniyu@google.com>
Cc: Neal Cardwell <ncardwell@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Matthieu Baerts <matttbe@kernel.org>,
	Mat Martineau <martineau@kernel.org>,
	Geliang Tang <geliang@kernel.org>,
	netdev@vger.kernel.org,
	mptcp@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tong Liu <lyutoon@gmail.com>,
	Qi Tang <tpluszz77@gmail.com>
Subject: [PATCH net v3] tcp: prevent cross-family skb processing after disconnect
Date: Tue,  3 Nov 2026 05:36:33 -0500
Message-Id: <20261103103633.2707416-1-zhiyuzhang999@gmail.com>
X-Mailer: git-send-email 2.34.1
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

From: Eric Dumazet <edumazet@kernel.org>

A successful connect() of an IPv6 socket to a v4-mapped address switches
icsk_af_ops, sk_backlog_rcv and af_specific to their IPv4-mapped
variants. A later connect(AF_UNSPEC) calls tcp_disconnect(), which does
not restore them.

The socket can then be reused for a native IPv6 connection while
tcp_v4_do_rcv() remains installed. IPv6 packets drained from its backlog
are consequently passed to the IPv4 receive path.

There is also a race in the opposite direction. tcp_v6_rcv() can look up
the socket and initialize TCP_SKB_CB(skb)->header.h6 before taking the
socket lock. If the socket is disconnected and reconnected to a
v4-mapped peer in that window, release_sock() can drain the queued IPv6
skb through the newly installed tcp_v4_do_rcv().

tcp_v4_send_reset() and tcp_v4_send_ack() then interpret header.h6 as
IPv4 options. __ip_options_echo() can consequently overflow its 40-byte
destination buffer.

Commit 8cc3aef0cb19 ("tcp: Do not allow buggy transitions between ehash
and lhash2.") prevents listen() after connect(AF_UNSPEC), but a native
IPv6 connect is still allowed.

Add tcp_v6_disconnect() to restore the IPv6 handlers after disconnecting
a v4-mapped socket, and use the same helper in the connect error path.
Reject non-IPv4 skbs in tcp_v4_do_rcv() before accessing IPv4
control-block data. In the reverse race, the skb belongs to the
disconnected connection, so drop it instead of redirecting it to the
IPv6 receive path.

MPTCP subflows override sk_prot, while two teardown paths call
tcp_disconnect() directly. Route them through the protocol-specific
disconnect operation so IPv6 MPTCP subflows receive the same
restoration.

Tested with TCP and MPTCP by reconnecting an AF_INET6 socket in both
directions after connect(AF_UNSPEC). A socket filter was used to widen
the native-to-mapped race window and verify that the stale IPv6 skb did
not reach tcp_v4_send_reset().

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Reported-by: Tong Liu <lyutoon@gmail.com>
Reported-by: Qi Tang <tpluszz77@gmail.com>
Closes: https://lore.kernel.org/netdev/CALf2hKvp0NPVLwr=a3+jUHtPohxbra8gox+aYAfWathJnn-J+Q@mail.gmail.com/
Link: https://lore.kernel.org/netdev/CAL4WiiqFJpmcV4=TWRpukCq6q=-729658FwGvieNcPXe97kLvQ@mail.gmail.com/
Signed-off-by: Eric Dumazet <edumazet@kernel.org>
Co-developed-by: Zhiyu Zhang <zhiyuzhang999@gmail.com>
Signed-off-by: Zhiyu Zhang <zhiyuzhang999@gmail.com>
---
Changes in v3:
- Reject non-IPv4 skbs in tcp_v4_do_rcv() to cover packets queued
  across a native IPv6 to v4-mapped reconnect.
- Drop Kuniyuki's Reviewed-by tag due to the code change.

v2: https://lore.kernel.org/netdev/20261101182736.430733-1-zhiyuzhang999@gmail.com/
v1: https://lore.kernel.org/netdev/20261030032314.1978575-1-zhiyuzhang999@gmail.com/

 net/ipv4/tcp_ipv4.c  |  5 +++++
 net/ipv6/tcp_ipv6.c  | 37 ++++++++++++++++++++++++++++---------
 net/mptcp/protocol.c |  4 ++--
 3 files changed, 35 insertions(+), 11 deletions(-)

diff --git a/net/ipv4/tcp_ipv4.c b/net/ipv4/tcp_ipv4.c
index a7f9242f1e42..8fa6564d2b60 100644
--- a/net/ipv4/tcp_ipv4.c
+++ b/net/ipv4/tcp_ipv4.c
@@ -1836,6 +1836,11 @@ int tcp_v4_do_rcv(struct sock *sk, struct sk_buff *skb)
 {
 	enum skb_drop_reason reason;
 
+	if (unlikely(skb->protocol != htons(ETH_P_IP))) {
+		reason = SKB_DROP_REASON_INVALID_PROTO;
+		goto err_discard;
+	}
+
 	reason = psp_sk_rx_policy_check(sk, skb);
 	if (reason)
 		goto err_discard;
diff --git a/net/ipv6/tcp_ipv6.c b/net/ipv6/tcp_ipv6.c
index e006a30360ea..a93410aab66e 100644
--- a/net/ipv6/tcp_ipv6.c
+++ b/net/ipv6/tcp_ipv6.c
@@ -130,6 +130,19 @@ static int tcp_v6_pre_connect(struct sock *sk, struct sockaddr_unsized *uaddr,
 	return BPF_CGROUP_RUN_PROG_INET6_CONNECT(sk, uaddr, &addr_len);
 }
 
+/* Undo the v4-mapped setup done by tcp_v6_connect(). */
+static void tcp_v6_restore_af_ops(struct sock *sk)
+{
+	/* Paired with READ_ONCE() in tcp_(get|set)sockopt() */
+	WRITE_ONCE(inet_csk(sk)->icsk_af_ops, &ipv6_specific);
+	if (sk_is_mptcp(sk))
+		mptcpv6_handle_mapped(sk, false);
+	sk->sk_backlog_rcv = tcp_v6_do_rcv;
+#if defined(CONFIG_TCP_MD5SIG) || defined(CONFIG_TCP_AO)
+	tcp_sk(sk)->af_specific = &tcp_sock_ipv6_specific;
+#endif
+}
+
 static int tcp_v6_connect(struct sock *sk, struct sockaddr_unsized *uaddr,
 			  int addr_len)
 {
@@ -243,14 +256,7 @@ static int tcp_v6_connect(struct sock *sk, struct sockaddr_unsized *uaddr,
 
 		if (err) {
 			icsk->icsk_ext_hdr_len = exthdrlen;
-			/* Paired with READ_ONCE() in tcp_(get|set)sockopt() */
-			WRITE_ONCE(icsk->icsk_af_ops, &ipv6_specific);
-			if (sk_is_mptcp(sk))
-				mptcpv6_handle_mapped(sk, false);
-			sk->sk_backlog_rcv = tcp_v6_do_rcv;
-#if defined(CONFIG_TCP_MD5SIG) || defined(CONFIG_TCP_AO)
-			tp->af_specific = &tcp_sock_ipv6_specific;
-#endif
+			tcp_v6_restore_af_ops(sk);
 			goto failure;
 		}
 		np->saddr = sk->sk_v6_rcv_saddr;
@@ -2093,6 +2099,19 @@ static int tcp_v6_init_sock(struct sock *sk)
 	return 0;
 }
 
+static int tcp_v6_disconnect(struct sock *sk, int flags)
+{
+	int ret = tcp_disconnect(sk, flags);
+
+	/* A socket used for a v4-mapped connection must not keep IPv4
+	 * handlers when it is reused for listen() or a native IPv6 connect().
+	 */
+	if (sk->sk_backlog_rcv == tcp_v4_do_rcv)
+		tcp_v6_restore_af_ops(sk);
+
+	return ret;
+}
+
 #ifdef CONFIG_PROC_FS
 /* Proc filesystem TCPv6 sock list dumping. */
 static void get_openreq6(struct seq_file *seq,
@@ -2283,7 +2302,7 @@ struct proto tcpv6_prot = {
 	.close			= tcp_close,
 	.pre_connect		= tcp_v6_pre_connect,
 	.connect		= tcp_v6_connect,
-	.disconnect		= tcp_disconnect,
+	.disconnect		= tcp_v6_disconnect,
 	.accept			= inet_csk_accept,
 	.ioctl			= tcp_ioctl,
 	.init			= tcp_v6_init_sock,
diff --git a/net/mptcp/protocol.c b/net/mptcp/protocol.c
index 7a22e9388e0e..fdfbc7de2ec0 100644
--- a/net/mptcp/protocol.c
+++ b/net/mptcp/protocol.c
@@ -2608,7 +2608,7 @@ static void __mptcp_subflow_disconnect(struct sock *ssk,
 		/* The MPTCP code never wait on the subflow sockets, TCP-level
 		 * disconnect should never fail
 		 */
-		WARN_ON_ONCE(tcp_disconnect(ssk, 0));
+		WARN_ON_ONCE(ssk->sk_prot->disconnect(ssk, 0));
 		mptcp_subflow_ctx_reset(subflow);
 	} else {
 		tcp_shutdown(ssk, SEND_SHUTDOWN);
@@ -3287,7 +3287,7 @@ void mptcp_subflow_shutdown(struct sock *sk, struct sock *ssk, int how)
 			break;
 		fallthrough;
 	case TCP_SYN_SENT:
-		WARN_ON_ONCE(tcp_disconnect(ssk, O_NONBLOCK));
+		WARN_ON_ONCE(ssk->sk_prot->disconnect(ssk, O_NONBLOCK));
 		break;
 	default:
 		if (__mptcp_check_fallback(mptcp_sk(sk))) {

base-commit: 5838f10563d58afca6711edb5e4eda968ca181d9
-- 
2.34.1

