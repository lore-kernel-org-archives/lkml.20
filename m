Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794836263;
	b=MyZw8Te61qAZkWAzKN7fY/0ZsrqDdUV3rzTZtvtrumwSx1JQfHhtexUe9kAIWvyI99Db
	 7wVsLLNrSC/drb4sOUwyZQf15MXiRuHkk8R9mEznBGSByYZK7Tp5occTrSLZKMMOLSlLz
	 raHe8x8hy7BX0ACqinnojgAdfua7EI/Ix10rVQWz7/JLHFBtoLhV7AzKKdkwm9Rp8MDew
	 TnU3xtSo7f4nygcWBZI/kEy3HxMmP2nzkt/A0u/JkJAP3uuoQN5oQfc18AQsPwpC43v2Q
	 s8SvScHjSVheWz/L5+N+7LKVjETkJCcrpWMYlkLYgXWH2GTCUvLG8m1rTwvTJ2UmgzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794836263;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=Itw9Xz+iHexc3nn2mGwD+uk7MYSoRzjmqg37ns24llg=;
	b=elPFClzfg6rmRqJUfLc/MXdmQdREDGsQM3YUGdbLl8r+Wd0FxAmRhX6Eusd/6mg1qzTh
	 jGGhk+FZJAaKXyad0SZ0v2OmzOA7OCUi+m4G1OS61gWiq6IsziF9N9nURstCS6PbOG7yW
	 AHO9J6oCqWd0Ie5C3JhdXA1bNELj2CzZjrjuqrhmwwtHlxm6xMoD34w9CcGHd4rLMhIaO
	 ZQO/UN+p/93L3L/oQjHRBPy6vgsKBmp6JdEOPM5LUm0x75/v38cz5MwZ6dzOnPW7GWAP7
	 zmmBGzLPcxUu3O1svKU82eDdmblsnkYWfqjKc38AAJm+kaXv5VvxoYJnJ5cmNrGhTXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--starchang.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Z1VM4ovT;
	arc=none smtp.remote-ip=209.85.216.72
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06A39606A32C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:37:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06A39606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--starchang.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Z1VM4ovT
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b1755b2f26so3163494a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 05:37:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794836262; x=1795441062; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Itw9Xz+iHexc3nn2mGwD+uk7MYSoRzjmqg37ns24llg=;
        b=Z1VM4ovTL1wfe5ReXStw/l5QVjunnsCNi1/QNmedqcNDGbk2PLkPoEzaW0ehLcK+Cz
         9j3Mg4IPQZxhs38EDxgJztpujK6fwMD9s532a/RzQC9PezkGxph4w+svRaOReh/TrVR6
         a8QGGlWiosuuDpvdhvaME/30EL+352sdAcxe6xwXxHccYo2dAXuU5aFUbvqH56FVa2+Q
         oLLH2ZEG8y1QRKItgMnko2IgUafg9FOphad25N8BAaMVD1rSAEnPlE6wysSl39zg6iZ6
         CMVZC9s7RSZcJKUOwzz+hC7y7cI6OW94Lz6EUXHdeOCCFpj1s6ou4KMsURMHyvKSV7bz
         noyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794836262; x=1795441062;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Itw9Xz+iHexc3nn2mGwD+uk7MYSoRzjmqg37ns24llg=;
        b=Fg8NGcTOShVml8uxGJsKbyLXo9fqtG3wUV8kh+usb4DjtK1A1s4IPhWXOVKwbE7k/P
         iNhkfEU5pqX2SuCchi1isCE4F+4KrC8ZXFhyQhmLNJn8xDZkrzMxUS1mWoECixJopys9
         ae9lrFC82Sa6T73P4q9HBUm1RZfaTqdeNQhl+2g/A8119RjJdYWMXnbZHhWROlzBmVvy
         xgjK+bhPDX3FCsBfZgqQJe5WCLhA/DoKOrAw/u3POQT356GHtFn0Uhb9W/kGPifEAX6T
         HeB93kUPDZLvQoVZBlami59O6ZRzD3xBX7p3PUwlUiN7UAlLHpZrYR0g5Fx0MEBlFX+1
         lsYA==
X-Forwarded-Encrypted: i=1; AL+hErGKNvj0KbQGZtJnjxlNoJ1SBXmUmgdzJ+NKqppcOnn11kUjAShdnYHJtQvdFU6X4Lf7B7BO+gfP+KpoVhA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/YPMGJt4oOIWcIUYxsVDEdsGuhiTw2MfuNL0ufb7WbDxUl6hI5
	RQiTmKGUhUfiC1zQ6UKEVe91erX8NI1nGGqe2oQLKrjVBzeI1IAVEB7Pys1rdpPkteRdVe9EPiy
	PElL/G6dNuSjU/cCjEg==
X-Received: from pgfz25-n2.prod.google.com ([2002:a05:6a02:84d9:20b0:cdd:aaa7:beae])
 (user=starchang job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:2543:b0:3ac:9e5e:d195 with SMTP id 98e67ed59e1d1-3b1b0b92206mr9177786a91.61.1794836261915;
 Mon, 16 Nov 2026 05:37:41 -0800 (PST)
Date: Mon, 16 Nov 2026 13:37:33 +0000
In-Reply-To: <0f9ce5de-4e1c-52a3-1bee-aecb1cd836db@ssi.bg>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261026150539.1357037-1-starchang@google.com>
 <20261027015619.1745984-1-starchang@google.com> <5c1fe870-39ff-e83e-e479-0e1f0fed6a83@ssi.bg>
 <20261028061644.2997812-1-starchang@google.com> <f631e178-d9ec-f335-9163-c44a9e6c58af@ssi.bg>
 <20261030030715.604215-1-starchang@google.com> <65cf2338-7bb4-3151-f3b1-ef171bb5723b@ssi.bg>
 <c2780bb291244cf32c1dbda63f0dcf594d22da30.camel@sipsolutions.net>
 <20261102070552.3516567-1-starchang@google.com> <0f9ce5de-4e1c-52a3-1bee-aecb1cd836db@ssi.bg>
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261116133734.607866-1-starchang@google.com>
Subject: Re: [PATCH net v4] net: Fix Hole-196 vulnerability by dropping
 unicast ARP/IP in L2 BMC
From: Star Chang <starchang@google.com>
To: Julian Anastasov <ja@ssi.bg>
Cc: johannes@sipsolutions.net, netdev@vger.kernel.org, dsahern@kernel.org, 
	idosch@nvidia.com, davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
	pabeni@redhat.com, horms@kernel.org, linux-kernel@vger.kernel.org, 
	wangroger@google.com
Content-Type: text/plain; charset="UTF-8"

Hi Julian,

You are right, any broadcast request with sip = GW can do it, not only
GARP, so drop_gratuitous_arp does not help here.

Following your suggestion, when drop_unicast_in_l2_multicast is set, ARP
received in L2 BMC frames skips neigh_event_ns() and neigh_update(), so
it cannot create or change any neighbour entry. Requests for us are
still answered. Something like:

--- a/net/ipv4/arp.c
+++ b/net/ipv4/arp.c
@@ -714,6 +714,7 @@ static int arp_process(struct net *net, struct sock *sk, struct sk_buff *skb)
 	struct neighbour *n;
 	struct dst_entry *reply_dst = NULL;
 	bool is_garp = false;
+	bool bmc_no_override;
 
 	/* arp_rcv below verifies the ARP header and verifies the device
 	 * is ARP'able.
@@ -791,6 +792,10 @@ static int arp_process(struct net *net, struct sock *sk, struct sk_buff *skb)
 	    (!IN_DEV_ROUTE_LOCALNET(in_dev) && ipv4_is_loopback(tip)))
 		goto out_free_skb;
 
+	bmc_no_override = (skb->pkt_type == PACKET_BROADCAST ||
+			   skb->pkt_type == PACKET_MULTICAST) &&
+			  IN_DEV_ORCONF(in_dev, DROP_UNICAST_IN_L2_MULTICAST);
+
  /*
   *	For some 802.11 wireless deployments (and possibly other networks),
   *	there will be an ARP proxy and gratuitous ARP frames are attacks
@@ -850,14 +855,19 @@ static int arp_process(struct net *net, struct sock *sk, struct sk_buff *skb)
 			if (!dont_send && IN_DEV_ARPFILTER(in_dev))
 				dont_send = arp_filter(sip, tip, dev);
 			if (!dont_send) {
-				n = neigh_event_ns(&arp_tbl, sha, &sip, dev);
-				if (n) {
-					arp_send_dst(ARPOP_REPLY, ETH_P_ARP,
-						     sip, dev, tip, sha,
-						     dev->dev_addr, sha,
-						     reply_dst);
-					neigh_release(n);
+				n = NULL;
+				/* Do not learn the sender from a BMC frame */
+				if (!bmc_no_override) {
+					n = neigh_event_ns(&arp_tbl, sha, &sip, dev);
+					if (!n)
+						goto out_consume_skb;
 				}
+				arp_send_dst(ARPOP_REPLY, ETH_P_ARP,
+					     sip, dev, tip, sha,
+					     dev->dev_addr, sha,
+					     reply_dst);
+				if (n)
+					neigh_release(n);
 			}
 			goto out_consume_skb;
 		} else if (IN_DEV_FORWARD(in_dev)) {
@@ -866,9 +876,11 @@ static int arp_process(struct net *net, struct sock *sk, struct sk_buff *skb)
 			     arp_fwd_pvlan(in_dev, dev, rt, sip, tip) ||
 			     (rt->dst.dev != dev &&
 			      pneigh_lookup(&arp_tbl, net, &tip, dev)))) {
-				n = neigh_event_ns(&arp_tbl, sha, &sip, dev);
-				if (n)
-					neigh_release(n);
+				if (!bmc_no_override) {
+					n = neigh_event_ns(&arp_tbl, sha, &sip, dev);
+					if (n)
+						neigh_release(n);
+				}
 
 				if (NEIGH_CB(skb)->flags & LOCALLY_ENQUEUED ||
 				    skb->pkt_type == PACKET_HOST ||
@@ -887,6 +899,10 @@ static int arp_process(struct net *net, struct sock *sk, struct sk_buff *skb)
 		}
 	}
 
+	/* ARP received in L2 BMC frames must not change the neighbour table */
+	if (bmc_no_override)
+		goto out_consume_skb;
+
 	/* Update our ARP tables */
 
 	n = __neigh_lookup(&arp_tbl, &sip, dev, 0);

If this looks OK I will send v6.

Thanks,
Star
