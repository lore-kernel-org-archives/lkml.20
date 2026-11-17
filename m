Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794926188;
	b=m0C5W3dZ88EYNyGgSw5Aiz7brh0ciHxwsYMx4ZkrqGBmgZgw+aRkX6WUS8ZasSpsQPON
	 n1NxdP/b4rnn1xKIjIRSxKUBotcT3Y1pBaoDQqbXrLmq6vhGYUAwPKcsnAfFJXWLmjiC6
	 PVrNHhNVRtPmBcMz3MXz8Hecrw8eGYjQRF0ypxdJmBTk3KGR5xmKegnNC45IcuqJ9Koz/
	 ugudR3lyrFn1Cyt1zGpvA0bMWln502EIvoimKvWRAj9oAUVroeeIhuNUSugYIVi3oK4m6
	 pz8XCOUzfYlxi3VWlc004iN8KTab4mpBqG6ZmimS1ykOr3/GaYRg7Iv24YOL2W/6D1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794926188;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=QtUm7TvC7GRJNtLS1kOdX7J2AtRJGnOgnIYw+uuwMDM=;
	b=wwRB8Z87C8W5ePdpb/eZPnIxng0V7FVk5i+OxQcaETeYE9z9tGF82n1agYW6FWjeHHii
	 76FJoTAfvRbyjUgx4ZkkXBN16FiO8rSMyyzRQb0pIcO0AQM8DA3vlnjrL6K2dVcios40/
	 GnDOaVVVsYYmsNb6JQ2M5h4ipjENB/5yfizP2jYCwyLeuvLJq3+AgFpStnuclTcTSefwA
	 XAgM2RITPZ5LmJV+EPnH5wEhpdmiKBIk9AlWJPTU5EELtYPu96aP0GCjESoinc0990jwy
	 3pWPy2wuWodtN3QLjil9SkOW1Nl4q9FwMn/vx1qgfqEj5l2r+n4axjH7OI5u78vYzmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iiitd.ac.in;
	spf=pass smtp.mailfrom=iiitd.ac.in;
	dkim=pass header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=fEpMRwKl;
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6FEF606ABA2
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:36:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6FEF606ABA2
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=fEpMRwKl
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3b16896b8ceso2260221a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:36:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iiitd.ac.in; s=google; t=1794926185; x=1795530985; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QtUm7TvC7GRJNtLS1kOdX7J2AtRJGnOgnIYw+uuwMDM=;
        b=fEpMRwKl5EVyL83pjUEyX8fs3SDJp9a0RiTAclznU4E+o69h/mT+PtiVqtfqt5Hhk7
         l/dJUADH9c6wlZ2BqFgN5261VmN/5Q0WEoogqWeEh/qtin7WwiLwbDHGer3wa6YbNs31
         f77ifaw6ILQ3Uhn+9H63ouFFZT5N9oTTO5DT0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794926185; x=1795530985;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QtUm7TvC7GRJNtLS1kOdX7J2AtRJGnOgnIYw+uuwMDM=;
        b=IMmwVtz0Hd4FyCTvt6E9G3IRke1WOEzsLQsRW56LWJPJldGlsErM8yrR9Cs83kfhtE
         jGrQFlvXdUkH0rkQKel12wlkNB8GKJtZhuhN6HAE3NYP8arb5TrVlMhlL4u3pgm20tFi
         SZr9gv6KXOKhpz5tBLUg9haAGThwod+htBmg/T09MnSiQ8eFa4AXfgqTgKhhtiJ03nnk
         TvBN+ANS9t/KCwH7IAxrTKhWvhi6HKfNa6oIOGsuZfL/W1mV3aRYqnFXPMcNUZxSR9My
         PgG1tcWXur/W6XyXZgeGTWPwesfzrL19STBCh9Ef3L+PY6MpE8Y/aT8lMAklOj2v80+h
         lu2g==
X-Forwarded-Encrypted: i=1; AL+hErGvIwBLKtPUcTWDYkqEzLDFrtxVzIT7yfMDU/DKzue79CFFOzaV49AxnWHscA27nNR+3DQlbzAS3WZgyzU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9DClkgzASAlnNbqYnGKKHltLSDeHoZqScNlcsV1IwD4L+4UaWp
	dOQRuxyVrHe3M9c2IegJ/SjZU7HoJ0rad+AagKUeAvnF8QKHzuJv785U28JKwW8/XrGkfu4B+Ay
	kszKsd0w=
X-Gm-Gg: AZFdTZflMBCxGCu/Tz4v4lO+owyJRzrq4EYC6dBNM09d5o7M83wXoqyAYHTbdiOUjmQ
	E6FIJGkPBzArymgbOTeTSa2WfcccmZ5ZEAW+EERUhgL/Wwg3NhP8Fnp0wiV34iHnsDoNN0AGF4x
	oOWfn8AdK5UQt5qSpcX0xvk2N2bGYTsR1vdZhxmHpGGGlM8MnupgfWcaeXBmGFPXfkB4FAuNZoT
	OchHcInQ57QDDFfqkHS5Ybr4/OIFL/wFlupZ2qVqLXR8INCPyOLOojljevivOfCw51oEtwJoAOJ
	bREqXHQupFdrDBKLsOgmKiEUXrQsKs7QioxSK9kBNzZxR7YtBrjF1IIRxKhQr1j+HNWPZFAQPcT
	WFvy1u42w5nHIXM8eL0ZEeXvGAlNyfbNbclZlWgtNPQEBGQ4zIArJqqvE/XxVpHLD9Tk+ldGgMQ
	GPTHkJHU8ZXF+BFFehO810wHzpljmQ/xWeFWIuuUSVeD+896Y2ub/8Rgk9pwgyiGx/g4j0vuOcs
	Tq/c44HMk0hnjvqtvBJftfzHWC93Sh7JwHZ3mJbo2Fl0q7ILOgXRFmmh/JIJQnoqBr5xTKnMvIY
	8EQK3lHoJD+tRz6PXrphHufFrqjxVfjZdez8nd6zu32fhFvXBkPIzMOBszwGhVI4y+sNzQlGLb+
	z4sQeaba7KHh7VUQJkd98jgxzLzH8s2/9JAwOKH8VRJjeMvuBMrxokEUQDODXf1go
X-Received: by 2002:a17:90b:37d0:b0:3ac:aa8d:19eb with SMTP id 98e67ed59e1d1-3b1b07e9b1amr13858047a91.3.1794926185112;
        Tue, 17 Nov 2026 06:36:25 -0800 (PST)
Received: from iiitd-S2600STB.iiitd.edu.in ([103.25.231.160])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac4cff6fsm4414174a91.12.2026.11.17.06.36.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 06:36:24 -0800 (PST)
From: Piyus Kedia <piyus@iiitd.ac.in>
To: Eric Dumazet <edumazet@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>,
	Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Andrea Mayer <andrea.mayer@uniroma2.it>,
	netdev@vger.kernel.org,
	ipsec@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Kapil Vaswani <kapil@presceralabs.ai>,
	Piyus Kedia <piyus@iiitd.ac.in>
Subject: [PATCH net v3] net: clear skb->mac_len in skb_unset_mac_header()
Date: Tue, 17 Nov 2026 20:06:12 +0530
Message-Id: <20261117143612.95112-1-piyus@iiitd.ac.in>
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

skb_unset_mac_header() marks the mac header as unset but leaves
skb->mac_len alone, so an skb can end up with no mac header and a
non-zero mac_len. Code that uses mac_len to decide whether a mac
header is present is then misled.

end_dt_vrf_rcv() (SRv6 End.DT4/End.DT6) unsets the mac header of the
decapsulated packet so that the VRF device can rebuild it. The VRF
device only does so when a packet sniffer is attached, so without one
the skb continues up the stack with mac_len == 14. In
xfrm4_remove_tunnel_encap() and xfrm6_remove_tunnel_encap(),
skb_mac_header_rebuild() is a no-op for such an skb, and the following

        if (skb->mac_len)
                eth_hdr(skb)->h_proto = skb->protocol;

writes two bytes at skb->head + 0xffff + offsetof(struct ethhdr, h_proto):

  BUG: KASAN: slab-out-of-bounds in xfrm4_remove_tunnel_encap+0x17d/0x220
  Write of size 2 at addr ffff88805f85800b by task syz-executor/10831
   xfrm4_remove_tunnel_encap
   xfrm_input
   xfrm4_esp_rcv
   ip_protocol_deliver_rcu
   ip_local_deliver_finish
   seg6_local_input_core
   lwtunnel_input
   __netif_receive_skb
   netif_receive_skb
   tun_rx_batched
   tun_get_user

__input_process_payload() in net/xfrm/xfrm_iptfs.c has the same three
lines and reported as a use-after-free rather than an out-of-bounds. The
address written is fixed relative to skb->head, so what it lands in is
whatever the allocator placed sixteen pages past the skb: a live object
gives slab-out-of-bounds, a freed one or a page back on the buddy free
list gives use-after-free, and a different live object gives no report at
all. Clearing mac_len at the source makes the guard false at all three
sites.

Clear mac_len in skb_unset_mac_header() so that all callers leave the
skb in a consistent state, and remove the now redundant assignment in
skb_carve_reset_headers(). The other callers are on egress paths
(__bpf_redirect_neigh(), bpf_lwt_push_ip_encap()) or only reach the
helper when the mac header was already unset (bpf_update_srh_state()),
and do not read mac_len afterwards. vrf_prepare_mac_header(), the rebuild
end_dt_vrf_rcv() unsets the header for, pushes ETH_HLEN and then calls
skb_reset_mac_header() and skb_reset_mac_len(), so it recomputes mac_len
itself and never reads the stale value.

The issue was reported on the list by Piyus Kedia and Kapil Vaswani,
who found it by fuzzing with AI assistance and reproduced the KASAN
splat on v7.4-rc3. Their reproducer was not published.

Fixes: 664d6f86868b ("seg6: add support for the SRv6 End.DT4 behavior")
Reported-by: Piyus Kedia <piyus@iiitd.ac.in>
Reported-by: Kapil Vaswani <kapil@presceralabs.ai>
Closes: https://lore.kernel.org/netdev/20261116174531.2540348-2-piyus@iiitd.ac.in/
Suggested-by: Kapil Vaswani <kapil@presceralabs.ai>
Suggested-by: Piyus Kedia <piyus@iiitd.ac.in>
Tested-by: Piyus Kedia <piyus@iiitd.ac.in>
Signed-off-by: Eric Dumazet <edumazet@kernel.org>
Signed-off-by: Piyus Kedia <piyus@iiitd.ac.in>
---
v3: use the generic fix Eric suggested - clear mac_len where it is left
    stale, instead of guarding each place that reads it. v1 and v2 added a
    skb_mac_header_was_set() test at each reader. Authorship is Eric's.

v1: https://lore.kernel.org/r/20261116174531.2540348-2-piyus@iiitd.ac.in

 include/linux/skbuff.h | 1 +
 net/core/skbuff.c      | 1 -
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/skbuff.h b/include/linux/skbuff.h
index 6787fcf6ac3e..9cd8eff0309c 100644
--- a/include/linux/skbuff.h
+++ b/include/linux/skbuff.h
@@ -3186,6 +3186,7 @@ static inline u32 skb_mac_header_len(const struct sk_buff *skb)
 static inline void skb_unset_mac_header(struct sk_buff *skb)
 {
 	skb->mac_header = (typeof(skb->mac_header))~0U;
+	skb->mac_len = 0;
 }
 
 static inline void skb_reset_mac_header(struct sk_buff *skb)
diff --git a/net/core/skbuff.c b/net/core/skbuff.c
index 1ac1e327ac4c..8fe0938d6131 100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -6984,7 +6984,6 @@ static void skb_carve_reset_headers(struct sk_buff *skb)
 	skb_unset_mac_header(skb);
 	skb_unset_transport_header(skb);
 	skb_reset_network_header(skb);
-	skb->mac_len = 0;
 
 	/* Inner offsets have no "unset" marker, zero them so that
 	 * skb_inner_network_header_was_set() becomes false and no
