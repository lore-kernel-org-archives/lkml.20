Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F30AC4D7D55
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 12:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791548697; cv=none; b=MMoOrKihYmMI4JxCB+0vQ2QgAN3mNR5WqkWnEljzVlHiGRIXz7i/efai6ClTILv5WRpwKxR9qDvP5HUjbmeOWOUkWuJKW151Rxu09CitzYA2C8tclf4vafzleCGMdfKFCIsw3GG94rb1IwsfXlpu5xNu0dKdpmxlSXQLIGtxl9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791548697; c=relaxed/simple;
	bh=Ikfc8UphbC26eLOdnp8j33kEmSlFX/Q/7JbIVl9Trbs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gr7vpiquXo3kzoEfa2vk3ZKqaVcucjdSi2aYelo3AdEulFN02pXp9See/DmX6gjdZBwpT9wDO6Y5Qt9zp5zaLKM5z49a2ySKhUBo7vNHORSNVYYW3dvEJG5E6YVT9YR/wDxg3N+lRpVMzk/fMKgXqW84ByEs0v/+h7vN5mRTfLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net; spf=pass smtp.mailfrom=blockcast.net; dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.b=hl6LeNN+; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blockcast.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.b="hl6LeNN+"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cc4c02ddd62so2619903a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 05:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blockcast.net; s=google; t=1791548687; x=1792153487; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uKHgcClD/fkwCwovL55MW0NrAZXZO7y3jE5NJgA+WEk=;
        b=hl6LeNN+USEgH4TjCTVlwt7hOELppisCEJjWUcHg0n2QZlMhDMMGQfdT7EKJtJ9YIt
         4PzvWqxDDeReCv8g6SNr8n6z3SMj7SxK0dggdk8jcvjHeeC3rqvnsRlE0WtF88Vdrh8k
         D+c3r8XuhHLn0Mf24GUNV96SRUdSir3bJIBgx0hP4f2HYQcLTeSCVaEPMujBUK3NcIxc
         5hcBCW5Lhkb5XkAFBOYGJXySDgZHg+gRHj+7cD2skJd0KkBh8Q/pDcjzo2wZOzTuEG9z
         l/iAZcys+/z14v8mSyIplzS90qLkmJAMme8KH5N3+I6PE2scAwV9i1khxljzqySse6Ne
         YP1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791548687; x=1792153487;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uKHgcClD/fkwCwovL55MW0NrAZXZO7y3jE5NJgA+WEk=;
        b=pgZOTuPAql0IIwh3VCUavWbsZnTZcbEvo/Docd5/gvfDDNqvLE2j7kAbRk5pZWD4mQ
         O4ibwnRcm0zLkvci8BO3yVllUvsrE9A8vVgJtRO65LHRxEV652us8RqTD9Ook93ce6dC
         w7AaTVpJ9erxtJW7PTxn5UATaSo65VvycfoDZWB6TRvHeRa5qIO4MSR4mbiLdxU3Rs4x
         OFD9ZrLKcaKICS55G5ohN6YsRk0DLe7z33WdtI/PbiYMA2CTbhWviFAzvswKcwdZu0Dh
         4sPrHk1Ui5Iq92fMu01KLdfkqW3cRbyrVxWkOjfJdrxWfE/E6F2Q5Ps7W7Q7SLKxyAqG
         rVmg==
X-Forwarded-Encrypted: i=1; AKwUvBxoW2CAhEhup2B0o5yuzjUB1Rt1jJ0XoZg/GqMuW6Rwg/VIoSRuDXZPx/ZbTpoyGwk4fKN9RwqdD4+AJDM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIbo/UHeD7E7JSdcW3ywL65bahyrCjDKGZI785coGoQU2df7BOv
	tXxbqBZShuVORVVlv4GYugr+ylrjiGhhS+v+3cGLhFMBX0UvLg2ZLMZebk3JULaX67A=
X-Gm-Gg: AYBFou3liRsNGetR8iRfDHNiLqcqqNNi2dIZQWv10aV/OcZ5dNUXzLXxSCwVWSFA0kR
	kAox/rJ0BoRzhSCHpPfFpCbFNwKRfP5fdrOzjlJQcPzSe6LvL2JRqBaHG5KxZE43FLVCG+hIbTT
	77KSclw4q91eyj0sxUz9DoDAY5S1ALlgnFMng+/gcS4/td6UZJT8MMhEJ4H8VJAMI/91+TihY3b
	RGk2aTTrkLULXOIs1VLjFh9gSLvnezlUBYZMCRUm0S+afrcQD/mOpeTARH/PqFXW5HoeY6UCRVK
	dczlgf9o/kgwboCZWWvwnsegOcgZgEqwqLlxtD8qAnvv4vfunZw5KRdbdUfs2R6XSKJPQDqBcPS
	wGoaUPPXHZ17rTRrModqLlyNXPfjMiRmxg8rBZTSNBfQYVXXjh1SXqPuwK4mBBCivGve+G3Py+o
	hexesp22pgHZHk1C9sedZnsYnMOhgXnHcHY4gKdx2k/H8c74SuDHJxoe4EuXWXhV5SKrjxDOFoh
	GXbpwskrwS28LiZszNAPlXqvkhZddpMFsFbbLDb
X-Received: by 2002:a17:90b:5444:b0:3aa:fc22:8aa7 with SMTP id 98e67ed59e1d1-3ab3ac72e81mr1665611a91.53.1791548686944;
        Fri, 09 Oct 2026 05:24:46 -0700 (PDT)
Received: from devbox.ts.blockcast.net ([2602:f74d:1::32])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab55e41eefsm1660502a91.10.2026.10.09.05.24.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 05:24:46 -0700 (PDT)
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
Subject: [PATCH net-next 08/13] amt: send the AMT gateway control plane over IPv6
Date: Fri,  9 Oct 2026 12:24:21 +0000
Message-ID: <20261009122426.551178-9-omar@blockcast.net>
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

A gateway sends three control messages: the Relay Discovery to its
discovery address, then the Request and the Membership Updates to the
relay it learned. All three are built for an IPv4 outer header only, so
a gateway on an IPv6-only access network cannot reach any relay.

Send the Discovery and the Request of a gateway with an IPv6 local
address from amt_send_discovery_v6() and amt_send_request_v6(). Both
messages are a few bytes with no payload, so they are built on the stack
and sent with amt_send_ctrl_v6(), the helper that already sends the
relay's IPv6 Advertisement, rather than with a copy of the IPv4 skb
construction. The Membership Update carries the gateway's IGMP or MLD
report, so amt_send_membership_update() keeps building on that skb: it
sizes the headroom for the outer family and sends through
amt_udp_xmit(), like the relay's Membership Query and Multicast Data,
which avoids an IPv6 copy of the function.

struct amt_dev gains the gateway's IPv6 discovery address and the IPv6
relay address it learns and sends to. The next patch writes the relay
address in process context while the transmit and receive paths read it,
and a struct in6_addr is not read in one access, so it comes with a
seqlock, remote_ipv6_lock: the senders take a snapshot with
amt_get_remote_ipv6(), which retries until the copy is consistent.

Assisted-by: LLM
Signed-off-by: Omar Ramadan <omar@blockcast.net>
---
 drivers/net/amt.c | 91 +++++++++++++++++++++++++++++++++--------------
 include/net/amt.h |  5 +++
 2 files changed, 69 insertions(+), 27 deletions(-)

diff --git a/drivers/net/amt.c b/drivers/net/amt.c
index 969ecfe..148d1fb 100644
--- a/drivers/net/amt.c
+++ b/drivers/net/amt.c
@@ -715,6 +715,50 @@ out:
 	return err;
 }
 
+/* The learned IPv6 relay address is written in process context and read
+ * on transmit and receive. A struct in6_addr is not read in one access, so
+ * readers take a snapshot under the seqlock.
+ */
+static struct in6_addr amt_get_remote_ipv6(const struct amt_dev *amt)
+{
+	struct in6_addr addr;
+	unsigned int seq;
+
+	do {
+		seq = read_seqbegin(&amt->remote_ipv6_lock);
+		addr = amt->remote_ipv6;
+	} while (read_seqretry(&amt->remote_ipv6_lock, seq));
+	return addr;
+}
+
+/* IPv6-outer variant of amt_send_discovery(). */
+static void amt_send_discovery_v6(struct amt_dev *amt)
+{
+	struct amt_header_discovery amtd = {
+		.type	= AMT_MSG_DISCOVERY,
+		.nonce	= amt->nonce,
+	};
+
+	if (!amt_send_ctrl_v6(amt, &amt->local_ipv6, &amt->discovery_ipv6,
+			      amt->gw_port, amt->relay_port,
+			      &amtd, sizeof(amtd)))
+		amt_update_gw_status(amt, AMT_STATUS_SENT_DISCOVERY, true);
+}
+
+/* IPv6-outer variant of amt_send_request(); @v6 is the inner family. */
+static void amt_send_request_v6(struct amt_dev *amt, bool v6)
+{
+	const struct in6_addr remote = amt_get_remote_ipv6(amt);
+	struct amt_header_request amtrh = {
+		.type	= AMT_MSG_REQUEST,
+		.p	= v6,
+		.nonce	= amt->nonce,
+	};
+
+	amt_send_ctrl_v6(amt, &amt->local_ipv6, &remote, amt->gw_port,
+			 amt->relay_port, &amtrh, sizeof(amtrh));
+}
+
 static void amt_send_discovery(struct amt_dev *amt)
 {
 	struct amt_header_discovery *amtd;
@@ -728,6 +772,11 @@ static void amt_send_discovery(struct amt_dev *amt)
 	u32 len;
 	int err;
 
+	if (amt_v6(amt)) {
+		amt_send_discovery_v6(amt);
+		return;
+	}
+
 	rcu_read_lock();
 	sk = rcu_dereference(amt->sk);
 	if (!sk)
@@ -818,6 +867,11 @@ static void amt_send_request(struct amt_dev *amt, bool v6)
 	u32 len;
 	int err;
 
+	if (amt_v6(amt)) {
+		amt_send_request_v6(amt, v6);
+		return;
+	}
+
 	rcu_read_lock();
 	remote_ip = READ_ONCE(amt->remote_ip);
 	sk = rcu_dereference(amt->sk);
@@ -1220,9 +1274,7 @@ static bool amt_send_membership_update(struct amt_dev *amt,
 {
 	__be32 remote_ip = READ_ONCE(amt->remote_ip);
 	struct amt_header_membership_update *amtmu;
-	struct iphdr *iph;
-	struct flowi4 fl4;
-	struct rtable *rt;
+	union amt_addr remote = {};
 	struct sock *sk;
 	int err;
 
@@ -1231,23 +1283,11 @@ static bool amt_send_membership_update(struct amt_dev *amt,
 		return true;
 
 	err = skb_cow_head(skb, LL_RESERVED_SPACE(amt->dev) + sizeof(*amtmu) +
-			   sizeof(*iph) + sizeof(struct udphdr));
+			   amt_ip_hlen(amt) + sizeof(struct udphdr));
 	if (err)
 		return true;
 
 	skb_reset_inner_headers(skb);
-	memset(&fl4, 0, sizeof(struct flowi4));
-	fl4.flowi4_oif         = amt->stream_dev->ifindex;
-	fl4.daddr              = remote_ip;
-	fl4.saddr              = amt->local_ip;
-	fl4.flowi4_dscp        = inet_dsfield_to_dscp(AMT_TOS);
-	fl4.flowi4_proto       = IPPROTO_UDP;
-	rt = ip_route_output_key(amt->net, &fl4);
-	if (IS_ERR(rt)) {
-		netdev_dbg(amt->dev, "no route to %pI4\n", &remote_ip);
-		return true;
-	}
-
 	amtmu			= skb_push(skb, sizeof(*amtmu));
 	amtmu->version		= 0;
 	amtmu->type		= AMT_MSG_MEMBERSHIP_UPDATE;
@@ -1259,17 +1299,13 @@ static bool amt_send_membership_update(struct amt_dev *amt,
 		skb_set_inner_protocol(skb, htons(ETH_P_IP));
 	else
 		skb_set_inner_protocol(skb, htons(ETH_P_IPV6));
-	udp_tunnel_xmit_skb(rt, sk, skb,
-			    fl4.saddr,
-			    fl4.daddr,
-			    AMT_TOS,
-			    ip4_dst_hoplimit(&rt->dst),
-			    0,
-			    amt->gw_port,
-			    amt->relay_port,
-			    false,
-			    false,
-			    0);
+	if (amt_v6(amt))
+		remote.ip6 = amt_get_remote_ipv6(amt);
+	else
+		remote.ip4 = remote_ip;
+	if (amt_udp_xmit(amt, sk, skb, &remote, amt->gw_port,
+			 amt->relay_port, false))
+		return true;
 	amt_update_gw_status(amt, AMT_STATUS_SENT_UPDATE, true);
 	return false;
 }
@@ -3481,6 +3517,7 @@ static int amt_newlink(struct net_device *dev,
 		amt->max_tunnels = AMT_MAX_TUNNELS;
 
 	spin_lock_init(&amt->lock);
+	seqlock_init(&amt->remote_ipv6_lock);
 	amt->max_groups = AMT_MAX_GROUP;
 	amt->max_sources = AMT_MAX_SOURCE;
 	amt->hash_buckets = AMT_HSIZE;
diff --git a/include/net/amt.h b/include/net/amt.h
index d8798a9..02c1c33 100644
--- a/include/net/amt.h
+++ b/include/net/amt.h
@@ -360,8 +360,13 @@ struct amt_dev {
 	struct in6_addr		local_ipv6;
 	/* Outer remote ip */
 	__be32			remote_ip;
+	/* Outer remote IPv6 address, published under remote_ipv6_lock */
+	struct in6_addr		remote_ipv6;
+	seqlock_t		remote_ipv6_lock;
 	/* Outer discovery ip */
 	__be32			discovery_ip;
+	/* Outer discovery IPv6 address, :: unless an IPv6 gateway */
+	struct in6_addr		discovery_ipv6;
 	/* Only used in gateway mode */
 	__be32			nonce;
 	/* Gateway sent request and received query */
-- 
2.43.0

