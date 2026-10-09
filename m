Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59B934D37B3
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 12:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791548681; cv=none; b=PT7AjhTEne9f22QskA7SR+ySY1fbYEV1X7n6ypOxvIft75B62DYHYA3pBcHkQzd9oZv2Jj2+5+5nVXeBuxjFfBJvaa178zoK3toaqzLgoaIXS3sm3MNSLsqfk3xNv0hB4+Btbcf7a9zUTH4Jmd2b4xTsPGDp7RpqG9nJC4AR9aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791548681; c=relaxed/simple;
	bh=tXqdPuecjyNJEyM31DWg5qTV3nge+RvaNYd18TvqeG8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XpUMRCWXPGQCD3jeMksHMA4zIauxSdCZ2nwP/WN0+uDqvX2NQa/fxZRPMrOTM0eGVLRXg84V7nnp54jypiMlc8vpgppftvvao0/UXtyN8pJm80gaLzg8DtK6X7vt376Mw3E8oeGnrPacF292rngt9Dk7J3VCkSCnhxUr9bgusxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net; spf=pass smtp.mailfrom=blockcast.net; dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.b=Y4SX7Utj; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blockcast.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.b="Y4SX7Utj"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3a8adb68d8bso2182950a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 05:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blockcast.net; s=google; t=1791548674; x=1792153474; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6RVBRu6CbkpEbCALBl1e6oQP3X9eBfLSou0ry5SaFbc=;
        b=Y4SX7UtjHFRLvKKH3Ot0NFnHUG7FGHLOY5LGF2tMqeRGhOuJObf8sWYAx9VCbbJg2q
         tmigg35w+gadnDbrU7KmRVd/Rh/HZbWWxxF9Z3xJVsm4S+IY27DBLSW7rPdoywpHbrAx
         T94u/9ETRFbbwpUq6hEwEScljfXNrNqrUimdVpQxbAXts6FAPReRamh9BeFRYH2f9soI
         JwpZGvwmVUi4FcOtPR2w8Bd3jmZhl5u1zRuT0K7ln1mgpfaUf2eLlCOn0PVCRdpvJqYp
         dT7AgsxD+VvCh3K5vNEJgF7tmj4Lru1vIrnBIPlqNj3xtOsfTyhiVAjAYu5X9JoDyL82
         9Ouw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791548674; x=1792153474;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6RVBRu6CbkpEbCALBl1e6oQP3X9eBfLSou0ry5SaFbc=;
        b=bLzpZseTgjTBHYNemKu6YfH1fLW6SGSzeWlSlgm3jtyFX1xAMfXm+US03uPhH0ufdr
         dv5IUVXf9q7LEZkhofTsl3A1uhlskmVkWBk+krNVf/qH1OHRgszysrSPTRRZRQ+wyQFi
         t96r1E49tvsz70tMbH1jKxXvzFuMHqvDpq8Lohbf6Gacw1t12QGTFPNGYD4iQoGY2ptR
         fulpNZI6fHvu7EiiGuToo1Y574es5Gv2HnthbR8KViaPoNSNi1iS2K02yTyKEOBKxNRR
         dGG0DShXiZQDfA+6N/10Uppe92AdeJpamKdJriISREU/oh5NbvNNBMl6GSoaKeQjtv5a
         uZyg==
X-Forwarded-Encrypted: i=1; AKwUvBybdc4Mv0U2pqZTIhdSSveGdSXlZdrqkyb2lSq+U+8OLSotefcP0NGfW1o0p3Iv6R89GhqzPOMnIDqO8h8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJzYaFjKgOaSqEmZARDcTehbWJ8xMThq1Lom5sfU4Yk4OkychW/
	dpjdrUEQs0T6mP87WQGQVAAHxzz+yIyemnTeqSSJS80+btvObuhrHX45Zo5JteGAl/o=
X-Gm-Gg: AYBFou3c8SsbbLxaWUf3yKhn8CIg+tBTgtk532gGm7xnAlDYZcJzympq+ALuoW9qLE+
	+C/dyCIAHNYo4uGtYNC1XoZgG5MxmMCE9cESvWQ+a7ukLJxYv/Z69ap6PKQZeakRg0oYeVwUlNq
	BltAz10GOurQXEOZo3SvVAJT2DdheGvZmtory1OR7g2X4Yi5lQ7cL0ENf6QaTAIPfrJt8hDbAvm
	z0EzuS49770Ecx4UW3vXP8AMTF1VxD3UdoXCG9QiqWsq78d7b9CnW29r4fF7TE4depgCZpR+pZH
	mja7qrbD2vj5Gg1JJUG3U/+EGeuXH0q/ZUmZI+S2Tp7Roe2jZdv1zlonHanDwYV5nh9GNeLnH+l
	HEV1S8bPEa8z8eqjEj3WSf4LPbMLvLTxF230v1Tt4irVTJscbD2FgiVhka/qBEaUff1PGa8iN6T
	uSJ8wOLyo9C8JAANFqVt2FrKPU9jjlimW7vBQjacVsIkZmRMuzZnO3n/eGEcu43giXJiWxpaPQO
	UN4XQyKc+ch6aKJbbFm4MKr/U33iceGqaJmcVEy
X-Received: by 2002:a17:90a:e7cb:b0:3aa:f2c4:12f4 with SMTP id 98e67ed59e1d1-3ab3a95369emr1758157a91.31.1791548674224;
        Fri, 09 Oct 2026 05:24:34 -0700 (PDT)
Received: from devbox.ts.blockcast.net ([2602:f74d:1::32])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab55e41eefsm1660502a91.10.2026.10.09.05.24.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 05:24:33 -0700 (PDT)
From: Omar Ramadan <omar@blockcast.net>
To: Taehee Yoo <ap420073@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>
Cc: Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next 02/13] amt: send the Relay Advertisement over IPv6
Date: Fri,  9 Oct 2026 12:24:15 +0000
Message-ID: <20261009122426.551178-3-omar@blockcast.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261009122426.551178-1-omar@blockcast.net>
References: <20261009122426.551178-1-omar@blockcast.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A gateway finds its relay with a Relay Discovery, and the relay answers
with a Relay Advertisement carrying the address the gateway should use
from then on. RFC 7450 s5.1.2 defines two forms of the Advertisement:
the same fixed header and nonce followed by either a 4-byte IPv4 or a
16-byte IPv6 relay address. A gateway tells the two apart by the length
of the UDP datagram, and the relay answers in the IP version of the
Discovery (s5.1.2.5), so an amt relay on an IPv6 outer transport has to
answer with the 24-byte IPv6 form.

Add struct amt_header_advertisement_v6 for that form and
amt_send_advertisement_v6(), which fills it on the stack and sends it
with a new amt_send_ctrl_v6() helper. The helper routes with
ip6_dst_lookup_flow() through amt_route6(), which the later IPv6 senders
share, and sends with udp_tunnel6_xmit_skb(), which builds the UDP and
IPv6 headers and fills in the UDP checksum that RFC 8200 s8.1 makes
mandatory over IPv6. Like the IPv4 control messages, it marks the skb
TC_PRIO_CONTROL, uses AMT_TOS as the traffic class and passes no netdev,
so control traffic stays out of the amt device's tunnel stats. It holds
rcu_read_lock_bh(): udp_tunnel6_xmit_skb() reaches ip6tunnel_xmit(),
which without PREEMPT_RT counts xmit recursion per CPU with
__this_cpu_inc() and __this_cpu_dec(), and the gateway's messages, added
later in this series, are sent from process context.

amt_discovery_handler() answers an IPv6 device's Discovery with the
IPv6 form, sent back to the outer source of the Discovery. RFC 7450
s5.1.2 makes the source of the Advertisement the destination of the
Discovery, the Relay Discovery Address, so amt_send_ctrl_v6() and
amt_route6() take the source address from their caller. The socket is
bound to ::, so a Discovery sent to an anycast or secondary address
reaches the relay, and a gateway accepts only an Advertisement whose
source is the address it sent the Discovery to; answering from
local_ipv6 would leave such a gateway stuck in discovery. The relay
address carried in the message stays local_ipv6. The same socket also
receives a Discovery sent to a multicast group the host has joined,
such as ff02::1, and a multicast address may not be a source (RFC 4291
s2.7), so a Discovery with a multicast destination is dropped rather
than answered by every relay on the link with an invalid packet.

The IPv4 Advertisement is still sent from local_ip: changing the source
of an existing IPv4 relay's replies is a fix of its own for net, and
nothing in this series depends on it.

No functional change: amt_v6() is still false for every device.

Assisted-by: LLM
Signed-off-by: Omar Ramadan <omar@blockcast.net>
---
 drivers/net/amt.c | 110 ++++++++++++++++++++++++++++++++++++++++++++++
 include/net/amt.h |  10 +++++
 2 files changed, 120 insertions(+)

diff --git a/drivers/net/amt.c b/drivers/net/amt.c
index 423ed77..a550f84 100644
--- a/drivers/net/amt.c
+++ b/drivers/net/amt.c
@@ -609,6 +609,78 @@ static void amt_update_relay_status(struct amt_tunnel_list *tunnel,
 	spin_unlock_bh(&tunnel->lock);
 }
 
+static struct dst_entry *amt_route6(struct amt_dev *amt, struct sock *sk,
+				    const struct in6_addr *saddr,
+				    const struct in6_addr *daddr,
+				    __be16 sport, __be16 dport)
+{
+	struct flowi6 fl6;
+
+	memset(&fl6, 0, sizeof(fl6));
+	fl6.flowi6_oif		= amt->stream_dev->ifindex;
+	fl6.flowi6_proto	= IPPROTO_UDP;
+	fl6.daddr		= *daddr;
+	fl6.saddr		= *saddr;
+	fl6.fl6_dport		= dport;
+	fl6.fl6_sport		= sport;
+
+	return ip6_dst_lookup_flow(amt->net, sk, &fl6, NULL);
+}
+
+/* Send an AMT control message from @saddr over the IPv6 outer transport.
+ * Returns 0 once the message is handed to the IPv6 stack.
+ */
+static int amt_send_ctrl_v6(struct amt_dev *amt, const struct in6_addr *saddr,
+			    const struct in6_addr *daddr,
+			    __be16 sport, __be16 dport,
+			    const void *msg, unsigned int len)
+{
+	struct dst_entry *dst;
+	struct sk_buff *skb;
+	struct sock *sk;
+	int hlen, err;
+
+	/* Without PREEMPT_RT, ip6tunnel_xmit() counts xmit recursion per
+	 * CPU, so BH must be off even when this is called from process
+	 * context.
+	 */
+	rcu_read_lock_bh();
+	sk = rcu_dereference_bh(amt->sk);
+	if (!sk || !netif_running(amt->stream_dev) ||
+	    !netif_running(amt->dev)) {
+		err = -ENETDOWN;
+		goto out;
+	}
+
+	dst = amt_route6(amt, sk, saddr, daddr, sport, dport);
+	if (IS_ERR(dst)) {
+		DEV_STATS_INC(amt->dev, tx_errors);
+		err = PTR_ERR(dst);
+		goto out;
+	}
+
+	hlen = LL_RESERVED_SPACE(amt->dev) + sizeof(struct ipv6hdr) +
+	       sizeof(struct udphdr);
+	skb = netdev_alloc_skb_ip_align(amt->dev, hlen + len +
+					amt->dev->needed_tailroom);
+	if (!skb) {
+		dst_release(dst);
+		DEV_STATS_INC(amt->dev, tx_errors);
+		err = -ENOMEM;
+		goto out;
+	}
+
+	skb_reserve(skb, hlen);
+	skb_put_data(skb, msg, len);
+	skb->priority = TC_PRIO_CONTROL;
+	udp_tunnel6_xmit_skb(dst, sk, skb, NULL, saddr, daddr, AMT_TOS,
+			     ip6_dst_hoplimit(dst), 0, sport, dport, false, 0);
+	err = 0;
+out:
+	rcu_read_unlock_bh();
+	return err;
+}
+
 static void amt_send_discovery(struct amt_dev *amt)
 {
 	struct amt_header_discovery *amtd;
@@ -2685,6 +2757,24 @@ out:
 	rcu_read_unlock();
 }
 
+/* The IPv6 form of amt_send_advertisement(), carrying the relay's IPv6
+ * address. It is sent from @saddr, the address the Discovery was sent to.
+ */
+static void amt_send_advertisement_v6(struct amt_dev *amt, __be32 nonce,
+				      const struct in6_addr *saddr,
+				      const struct in6_addr *daddr,
+				      __be16 dport)
+{
+	struct amt_header_advertisement_v6 amta = {
+		.hdr.type	= AMT_MSG_ADVERTISEMENT,
+		.hdr.nonce	= nonce,
+		.ip6		= amt->local_ipv6,
+	};
+
+	amt_send_ctrl_v6(amt, saddr, daddr, amt->relay_port, dport,
+			 &amta, sizeof(amta));
+}
+
 static bool amt_discovery_handler(struct amt_dev *amt, struct sk_buff *skb)
 {
 	struct amt_header_discovery *amtd;
@@ -2701,6 +2791,26 @@ static bool amt_discovery_handler(struct amt_dev *amt, struct sk_buff *skb)
 	if (amtd->reserved || amtd->version)
 		return true;
 
+	/* The Advertisement takes the form of the outer IP version, and
+	 * RFC 7450 s5.1.2 sources it from the address the Discovery was
+	 * sent to, which may be an anycast Relay Discovery Address rather
+	 * than local_ipv6.
+	 */
+	if (amt_v6(amt)) {
+		const struct ipv6hdr *ip6h = ipv6_hdr(skb);
+
+		/* The socket bound to :: also receives a Discovery sent to
+		 * a group, and a multicast address can never be a source
+		 * (RFC 4291 s2.7), so such a Discovery is not answered.
+		 */
+		if (ipv6_addr_is_multicast(&ip6h->daddr))
+			return true;
+
+		amt_send_advertisement_v6(amt, amtd->nonce, &ip6h->daddr,
+					  &ip6h->saddr, udph->source);
+		return false;
+	}
+
 	amt_send_advertisement(amt, amtd->nonce, iph->saddr, udph->source);
 
 	return false;
diff --git a/include/net/amt.h b/include/net/amt.h
index 8df7d43..921944b 100644
--- a/include/net/amt.h
+++ b/include/net/amt.h
@@ -133,6 +133,16 @@ struct amt_header_advertisement {
 	__be32	ip4;
 } __packed;
 
+/* The IPv6 form of the Relay Advertisement (RFC 7450 s5.1.2): the header
+ * and nonce, laid out as in a Discovery, then a 16-byte relay address. A
+ * gateway tells the two forms apart by the UDP datagram length
+ * (s5.1.2.5), not by a field in the message, so it is a type of its own.
+ */
+struct amt_header_advertisement_v6 {
+	struct amt_header_discovery	hdr;
+	struct in6_addr			ip6;
+} __packed;
+
 struct amt_header_request {
 #if defined(__LITTLE_ENDIAN_BITFIELD)
 	u32	type:4,
-- 
2.43.0

