Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDB6D499F08
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 17:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788457938; cv=none; b=JSiWlluilEbalEZWRPNi+WPuXDCoMFXFXkG1zyFHTJJnL94getJGjqdaBgGlmsd+J2SNfAYgMpvWhcpE0JfMQ05ukjNrmGzIOZF9PxK9pG5oClmltc5+o6h5IjAFw/IprbkXauiVPbY/0lExpEg3Hss9H0eSqfpNrrYObbVO5o0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788457938; c=relaxed/simple;
	bh=/kSMl8GheQG+8K1FF4sh4FXUEGlSGJog6gowxfUP0MQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ls+YLZuRjS5PB+yhZgybeQ5rLX2WKcd8XckjQQpLwC28yOiMCyTQ7wfq3jGzWi9x61uwydz2RPteYdHmNFjv1+fahdyI9HDgcTY0fpReYzXqhYRZbw02SD0kPPDJOPemOYLOocgB2XAkesHBM5G0tvO0FlMc1KO1x9c8u/hArTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GIXbEDXD; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GIXbEDXD"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-395cf2535acso109995a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 10:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788457936; x=1789062736; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7j7jSXfrb/MjoI/kciUNMuT0KCO6yOI7q3xDkL9okuE=;
        b=GIXbEDXDvCANNNXicppeOAm4cyGJ1ye6aihPmUZYHo9FOtSWjrIh4zIS2FYTHjNvLV
         +rQMV5kEvz6vVc3B8fJ2ieqf7VHVndo59H53VS/E+nJ54vV6b+sj3lI/vN32xiFRcNsh
         pjGDoTaDlfI775oZ5KnXC/Xqa+GcWr9zUZPHMOKSBU80g4ImXIrYGZF+lw7mzF5+RwUl
         vtXLno0ias1vOmis8HBMFaNNCJhjM/IczbqkvF6TCi7CdBs7VJC11USc158wz8Bc42C5
         mw8VfJb58w3GBT0ZqY5w6rpOBLoNbYclQhpkVbk1GSGSakfw0u0u1d9NayDSYW2J7HMQ
         mCgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788457936; x=1789062736;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7j7jSXfrb/MjoI/kciUNMuT0KCO6yOI7q3xDkL9okuE=;
        b=JsEIDDAsgM+gEcqEzm3ic4lWD0AIehUFDYw92GbxUpnRFJsglAVRY/C3JZf9+3skbZ
         o8RdlVVWphFfwMflXrw0U1jgPmM4nsZIZw2FenKUit2W1ugNJq2/q+2T95M8u94PEkmv
         L9v+B5v53Fn0rqQmNyZLMdLou7lS3KMlXM5PQIiX6NpICI5FJ48vLXRE8mv8UMBbzupm
         VlXIUtV+p9W2N0jOlh/BR0/syIpQ2lzBe5W4l2NwtL9J0RvxH6tH4tnO5zsQdNkKzBrc
         cVauoGS5aP1/bEyZFuPmTG77uBOTCEnnGtVb8ZukVG9vr2wqHPzefp7mJpeOKKa/1n1k
         Zbhw==
X-Forwarded-Encrypted: i=1; AKwUvBxu9iDavwpC+m2b+bRo88U7ZEHBFpLZUJ6KZ+sWBEtnPSnbx8zh/DvTFQ2vIOpoc7OdwJJQScHKRVu2+C8=@vger.kernel.org
X-Gm-Message-State: AFuF++ntUUbVNr4+op7+BZgFohcTtbyaCuFN2nKzSXrez6Pku6gGScWD
	YMGzVjKgiygs8TVbzwFoOx63TBbhlS522PgZA4MwF+mR5z5ec43xJXjN
X-Gm-Gg: AYBFou233Up+iyDXPWF8R7YKh8d2KRg3vyHBN4oQ+UTrfpYL2dz/v41ira50yfaFfYj
	y1M7qTcdpJR3Pr+TQ3O74kU8q63rk4pg8+/f9DQ45Ko5m5fyIy10l4/v9t4jHJY9rtahQ0HH5bX
	M8sU/tfuX45x1M8Ee0lutStEDL4wU2KkrLhJKO+4rNaojjK9s8v9f7QuM9uVhk+3FQ3DYok1Vi3
	RKVKyngC38oPtGOBqBsfT1+YtkiJ1bgEsYmxCZkbPGoC45ho4V+ar6tQDr7Ur7mxga2w0upfjpR
	noJIt8HSR0Y3d3quyu+wJoQtoDGHCv7n3itiuth3MVUgMbaWseKcj5nzFl0iFMf574S8OXsLUnw
	WsoRSc6BBU5ALmSfj1VDioVQWTK3e/RU5iudVYpw9O/RHk5T0Hzb+7/XOOuxjHJWhiqCFGqUjQF
	kKsNH/8GqicNAaUWxJ16LCVktOzjqSNC50ql2VoJENWS/58LQwfdVpMFApnBO4EJbuTvF2QCu6g
	KrlRxcjhYI=
X-Received: by 2002:a17:90b:3a43:b0:398:9bd3:d6d2 with SMTP id 98e67ed59e1d1-39b132c749amr4475141a91.12.1788457935829;
        Thu, 03 Sep 2026 10:52:15 -0700 (PDT)
Received: from ancienth-X870E-Nova-WiFi ([125.186.72.2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b25f88475sm144419a91.1.2026.09.03.10.52.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 10:52:15 -0700 (PDT)
From: Daehyeon Ko <4ncienth@gmail.com>
To: netdev@vger.kernel.org
Cc: Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Jiayuan Chen <jiayuan.chen@linux.dev>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v4] ipv6: prevent stale UDP packets after ADDRFORM
Date: Fri,  4 Sep 2026 02:51:55 +0900
Message-ID: <20260903175158.317098-1-4ncienth@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

IPV6_ADDRFORM can convert an established IPv6 UDP socket to IPv4 while
packets created under the IPv6 protocol remain queued.  The subsequent
IPv4 receive paths then interpret both the IPv6 header and
inet6_skb_parm as their IPv4 counterparts.

For regular data, IP_RETOPTS can use the overlaid IPv6 extension-header
offsets as IPv4 option metadata and copy a packet-controlled length past a
40-byte stack buffer.  The same write is reachable from an IPv6 error skb
after conversion when SOF_TIMESTAMPING_OPT_CMSG enables IPv4 ancillary data
on the error path.

UDP keeps received datagrams on sk_receive_queue and moves them to
reader_queue while servicing recvmsg, including MSG_PEEK.  Checking those
queues alone is not sufficient because UDP receive does not take the
socket lock.  A packet can pass IPv6 lookup before the check and be
published after the protocol switch.

Block new IPv6 UDP receive before inspecting both data queues.  Wait for
network receive handlers which passed the block to finish, then scan the
receive and reader queues under their established lock order.  Clear the
block and return EBUSY if either contains an IPv6 skb.  Keep it set after a
successful conversion so a stale early-demux socket cannot publish another
IPv6 skb.  IPv4 skbs already queued on the dual-stack socket remain valid
and do not prevent conversion.

Not every IPv6 error producer is covered by the network grace period.  Make
the IPv4 error consumer skip IPv6 error skbs only on a UDP socket marked by
ADDRFORM.  This preserves ordinary IPv4 error skbs, including timestamps
taken after tunnel encapsulation, while preventing stale IPv6 control
blocks from reaching IPv4 cmsg parsing.

A queue-only prototype delivered an IPv6 datagram after a successful
conversion on iteration 23 of a delayed-enqueue race.  With the receive
gate in place, the same test observed no post-conversion delivery in
10,000 iterations.  Receive and MSG_PEEK reader queues returned EBUSY,
queued IPv4 data survived conversion, and the IPv6 error-queue reproducer
no longer reached __ip_options_echo().

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Closes: https://lore.kernel.org/r/20260825221922.85651-1-4ncienth@gmail.com
Link: https://lore.kernel.org/r/20260829144847.1738294-1-4ncienth@gmail.com
Link: https://lore.kernel.org/r/20260901141352.236286-1-pabeni@redhat.com
Link: https://lore.kernel.org/r/20260902055802.3724915-1-4ncienth@gmail.com
Link: https://lore.kernel.org/r/CANn89i+CSVHtjDk_NQT_Q6NpwJ76WQ=CExXp1xY15iPQuZSp+w@mail.gmail.com
Link: https://lore.kernel.org/r/84b011a3-7662-4f6e-ad4d-6bf81d2e1b30@linux.dev
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Daehyeon Ko <4ncienth@gmail.com>
---
v4:
  - replace the v3 __ip_options_echo() validation with an
    IPV6_ADDRFORM-specific fix
  - gate IPv6 UDP receive, wait for in-flight network handlers, and reject
    conversion only when receive or reader queues contain IPv6 skbs
  - preserve queued IPv4 data across conversion
  - skip IPv6 error skbs in the IPv4 error consumer only for UDP datagram
    sockets converted by ADDRFORM, while preserving following IPv4 errors
  - cover the post-check enqueue race which broke a queue-only prototype
    after 23 iterations; the gated version had no witness in 10,000
  - leave the distinct ipmr control-block bug to Zhiling Zou's existing
    series, as requested by Eric Dumazet and Ido Schimmel
  - drop all v3 ip_options.c changes, including the path where syzbot CI
    reported a pskb_network_may_pull() warning
v3: https://lore.kernel.org/r/20260902055802.3724915-1-4ncienth@gmail.com
  - validate option offsets and lengths in __ip_options_echo()
v2: https://lore.kernel.org/r/20260829144847.1738294-1-4ncienth@gmail.com
  - use the network header version instead of skb->protocol
v1: https://lore.kernel.org/r/20260825221922.85651-1-4ncienth@gmail.com
  - reject SOL_IP cmsgs unless skb->protocol is ETH_P_IP
syzbot CI report on v3:
  https://lore.kernel.org/r/6a989da2.2e567484.299ffc.0001.GAE@google.com
---
 include/linux/udp.h      |  1 +
 net/ipv4/ip_sockglue.c   |  8 ++++++++
 net/ipv6/ipv6_sockglue.c | 37 +++++++++++++++++++++++++++++++++++++
 net/ipv6/udp.c           |  5 +++++
 4 files changed, 51 insertions(+)

diff --git a/include/linux/udp.h b/include/linux/udp.h
index 998906ec3b32a..f775f78d6bf47 100644
--- a/include/linux/udp.h
+++ b/include/linux/udp.h
@@ -67,6 +67,7 @@ enum {
 	UDP_FLAGS_ACCEPT_FRAGLIST,
 	UDP_FLAGS_ACCEPT_L4,
 	UDP_FLAGS_ENCAP_ENABLED, /* This socket enabled encap */
+	UDP_FLAGS_ADDRFORM,      /* Block IPv6 receive during/after ADDRFORM */
 };
 
 /* per NUMA structure for lockless producer usage. */
diff --git a/net/ipv4/ip_sockglue.c b/net/ipv4/ip_sockglue.c
index a55ef327ec932..fcd102ae8bedb 100644
--- a/net/ipv4/ip_sockglue.c
+++ b/net/ipv4/ip_sockglue.c
@@ -533,9 +533,17 @@ int ip_recv_error(struct sock *sk, struct msghdr *msg, int len)
 	int copied;
 
 	err = -EAGAIN;
+again:
 	skb = sock_dequeue_err_skb(sk);
 	if (!skb)
 		goto out;
+	if (unlikely(sk->sk_type == SOCK_DGRAM &&
+		     sk->sk_protocol == IPPROTO_UDP &&
+		     udp_test_bit(ADDRFORM, sk) &&
+		     skb->protocol == htons(ETH_P_IPV6))) {
+		consume_skb(skb);
+		goto again;
+	}
 
 	copied = skb->len;
 	if (copied > len) {
diff --git a/net/ipv6/ipv6_sockglue.c b/net/ipv6/ipv6_sockglue.c
index b4c977434c2e0..d307cea9ebc5c 100644
--- a/net/ipv6/ipv6_sockglue.c
+++ b/net/ipv6/ipv6_sockglue.c
@@ -373,6 +373,33 @@ static int ipv6_set_opt_hdr(struct sock *sk, int optname, sockptr_t optval,
 	return err;
 }
 
+static bool udp6_addrform_queue_has_ipv6(struct sock *sk)
+{
+	struct sk_buff_head *reader_queue = &udp_sk(sk)->reader_queue;
+	struct sk_buff *skb;
+	bool found = false;
+
+	spin_lock_bh(&reader_queue->lock);
+	spin_lock(&sk->sk_receive_queue.lock);
+	skb_queue_walk(reader_queue, skb) {
+		if (skb->protocol == htons(ETH_P_IPV6)) {
+			found = true;
+			goto unlock;
+		}
+	}
+	skb_queue_walk(&sk->sk_receive_queue, skb) {
+		if (skb->protocol == htons(ETH_P_IPV6)) {
+			found = true;
+			break;
+		}
+	}
+unlock:
+	spin_unlock(&sk->sk_receive_queue.lock);
+	spin_unlock_bh(&reader_queue->lock);
+
+	return found;
+}
+
 int do_ipv6_setsockopt(struct sock *sk, int level, int optname,
 		       sockptr_t optval, unsigned int optlen)
 {
@@ -587,6 +614,16 @@ int do_ipv6_setsockopt(struct sock *sk, int level, int optname,
 				break;
 			}
 
+			if (sk->sk_protocol == IPPROTO_UDP) {
+				udp_set_bit(ADDRFORM, sk);
+				synchronize_net();
+				if (udp6_addrform_queue_has_ipv6(sk)) {
+					udp_clear_bit(ADDRFORM, sk);
+					retv = -EBUSY;
+					break;
+				}
+			}
+
 			__ipv6_sock_mc_close(sk);
 			__ipv6_sock_ac_close(sk);
 
diff --git a/net/ipv6/udp.c b/net/ipv6/udp.c
index 93478d1ad5769..ccd8ae92f52ba 100644
--- a/net/ipv6/udp.c
+++ b/net/ipv6/udp.c
@@ -822,6 +822,11 @@ static int udpv6_queue_rcv_one_skb(struct sock *sk, struct sk_buff *skb)
 	struct udp_sock *up = udp_sk(sk);
 	struct net *net = sock_net(sk);
 
+	if (unlikely(udp_test_bit(ADDRFORM, sk))) {
+		drop_reason = SKB_DROP_REASON_NO_SOCKET;
+		goto drop;
+	}
+
 	if (!xfrm6_policy_check(sk, XFRM_POLICY_IN, skb)) {
 		drop_reason = SKB_DROP_REASON_XFRM_POLICY;
 		goto drop;

base-commit: 66817a9794263cd2a5dc4e99bf8e5fcc5ff7181e
-- 
2.55.0
