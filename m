Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793141839;
	b=GuPSxp2lV1OdVNH0Cgsqbco4QfdHI+qIBlCgfIa5eaHjuF803aoNuIdICGGmvKEuIZrL
	 zAb3p9vzRAlX/O53G8nwT7JMbRbk8tC+Na7IqYe2Em5ItNe85FFM58Z3glYKIwS/KHHxt
	 cNE38DN/XKVQWcawDxVd20Kel4wrSga7gFGZ4ocey/h0XG7euuM7DFQ+m1yLvqt8b3ejE
	 uDJZ4QFYIdo9ubi0E6Z3PNKKaJELItEJAQXKfPVmBOrxPV0GFxhBGOZhJH1EE3VpqCktw
	 8bsZHXlDsz4HuBSc6KgLxTqgnSgih7a+75D6DbHd9/1n3rSwgzXdJzLToKrHYJ98wwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793141839;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=x4Wb1nq3gFYdX6BA5R6X0Kbpi+TDs/uhIWeWQW5ffww=;
	b=UAZuGa19mDr4L6eW+Tv92IV22V/IuqWnK8cgyAty6/9RXrFwMihVE7HpwCfmOO3157Ai
	 1E7HvefBfwfWr1sG5/Cyc61wVp/cHmvxN1whedJlkX21OjOTFghGVJVfklHib0JyKrqoq
	 kV17oacqjGyC2lPbcN1pb6eyNoNYw2qU7VvMxFrRq70s7iw1aNnC+comY3UOoEBS+TGBZ
	 JjChlHDvS7HjfgmtKpTyN9Kcg0gm0+19IPJuvZEnVPUdkQftUHGrOrzqv2RIRAvY2uQ5g
	 zK4w1CJF3m10yK3RAtGzoFlV5MPjCceHj+hsZG6Tmt091OEQKKnFAYmGozIJyAILu7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wgCH0ctU;
	arc=none smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D3A9606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 22:57:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D3A9606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wgCH0ctU
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2e5fb79ce82so2121105ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793141837; x=1793746637; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=x4Wb1nq3gFYdX6BA5R6X0Kbpi+TDs/uhIWeWQW5ffww=;
        b=wgCH0ctU69DCcoz3Ru9BWpJRF/qCvUOXZaq1XCXJ1mY+CrA71lhfiXobTbCAgjpBrk
         DyaxcIPqmt4+ye/6ixGQledSXjLCZRsPF5G8bzUZUp+e27MPNEmH65LnNlJLvMr2Et58
         9FQoB0qgzbGh45aAKAz1ywuxDNOmjfeeOIEF2KOld7xjB9gKcLc1Ur0b2fMUX5Lqj0+w
         Ra8L+RM/OPIkhQsMGjJL0fU8XfOeRal7e3+EFHTgd0ooyWqzBvQ82+5ozusU08AkL9Lg
         hYQSsUa9WPWkVUY0Hx0H0pInv+iykHsdHkYdpyLRUg1UA1Tqqg5VGBAuwDsbSna5P7GU
         dWhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793141837; x=1793746637;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x4Wb1nq3gFYdX6BA5R6X0Kbpi+TDs/uhIWeWQW5ffww=;
        b=ujrOBM5RnJFn0lYkWdcOE2oXzGYIB1LAyhhwx2UHRs4rSD4ThtR2NFGkUMvNegg3tJ
         RoNHhOBqmqXizQkLZBmKqGnJz9M+8NcR96OetJx3rPk3T7JQ1u2LmttG3TrQF7cHF668
         ph6tq1s4nYmCiUGT5UZAva8VMvT/VKELp7OH5uoa7ej1qu6XXgqOrpnJ2F0xzG3ZNSTV
         xuDuQQ7WAkOi1e5B5dERE464g0hkKASVvGs5pYCDnsgtCZh2u52WPosthLLU8Ip8Valy
         We/efnvsOUPIlTnsPcCYdaMPtEt4ac+Jl/XyMHQST7hkvXpKeVU8nvUWowygfVVTtqsh
         5u4w==
X-Forwarded-Encrypted: i=1; AKwUvBwIjVHSVCl06Rdh8PGT9YMBOIYvX5k2xZlqmLEMQgixaWwRx66E5oOapgR1ByPeUvSUeCqv0/IbbMi8ukM=@vger.kernel.org
X-Gm-Message-State: AFq9FYK8O9BibRI6AFq/5auvQLywBDFNCuIfDQHnUADHwLsLJohaZJs5
	9uNzFZ/zgNU+3LxlGzWKWreXCc9WydZf25FyZ1E1YtyHLRn8SOmwZeWz
X-Gm-Gg: AYBFou2kxfFFaBPvXcze15unGL19Od0SVcEqMW4F0fgL+gnNzygFSe+TgLXwRjavpnN
	GTvcP4flm9llurDyPO0BhoF2WvxKpyOOnGIlyzmiJlhoS9jKUVuiV9ArG+XSVKc3jKOSewfleab
	X1SmETM2v+6+lCfxGFXGTzdjB3aXPPl2crbcprPTcrwO+AUlV8BlL/5VImrqyEVF9ABu49Ly2Cm
	5xVOea1AQCcZTInlg9RVxHymohJQAsz/JF2HbBMAJGAsTLRNB2PKc3hIs1SD7B84NJWnbP9TWWY
	U2lCeIhRmzfhsryew8ajVBvrVVf0n2yts2/Pwc5hZet+HqagWt0cckDeks0kdwtcGPqVaxgy1iI
	VXEYRw6wxnab4y7s2gY+jfpunrJ3JareoJfsytLKJ7pldoCZV+wnB2CEN0opqlge0t1esA2A2GG
	Oae4WgtfXs/yHeEd/AqY2xiLqwaZQCIwmLHXSYBKDUzXxzuildTgNGZLg/ofEWHvJsu+riZDvSy
	m3L1//qlv/onj6e3j2D5RniJGItfceiiuvzMUsRWI0us87/KJlNujTE1TO+XqH2Mc1/1DeFnATP
	kBK3KmAGrb7ZST7IhodnBgdVHlLn9JuYvDGKpYSHZsvz
X-Received: by 2002:a17:902:fc87:b0:2e2:b7b8:abc5 with SMTP id d9443c01a7336-2eb0038e312mr6543085ad.32.1793141837445;
        Tue, 27 Oct 2026 15:57:17 -0700 (PDT)
Received: from localhost.localdomain (ip67.244-167-222.hkg.ten111.net. [222.167.244.67])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6b76df7sm15602385ad.14.2026.10.27.15.57.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 27 Oct 2026 15:57:17 -0700 (PDT)
From: Guoshuai Yang <yangguoshuai@gmail.com>
To: Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Sabrina Dubroca <sd@queasysnail.net>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	David Ahern <dsahern@kernel.org>,
	Guoshuai Yang <yangguoshuai@gmail.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH net v4] xfrm: esp: reset outer TCP GSO metadata on espintcp input
Date: Wed, 28 Oct 2026 06:57:10 +0800
Message-ID: <20261027225710.51832-1-yangguoshuai@gmail.com>
X-Mailer: git-send-email 2.54.0
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

When ESP packets are received over TCP (RFC 8229 espintcp), strparser
slices individual length-prefixed ESP records from the outer TCP stream by
cloning the incoming TCP skb(s) in __strp_recv().

If the outer TCP skb was GRO-coalesced before reaching strparser, its
skb_shinfo carries the outer TCP stream's GSO metadata (gso_size, gso_segs,
and gso_type). When an ESP record spans two outer TCP segments, strparser
chains the spillover clone onto skb_shinfo(head)->frag_list.

Subsequently in esp_input() and esp6_input(), skb_cow_data() unshares the
head skb via pskb_expand_head() (preserving the outer TCP gso_size and
gso_type in the new private skb_shinfo) and calls skb_copy() on each cloned
frag_list member, which copies the outer TCP GSO fields via
skb_copy_header() onto a linear frag_list child skb allocated from slab
with head_frag == 0.

Furthermore, on kernels with TCP fraglist GRO support, if an outer TCP GRO
aggregate carrying SKB_GSO_FRAGLIST reaches the espintcp socket unsegmented
(for example, when rx-gro-list is enabled on a device in an outer netns
where tcp4/6_check_fraglist_gro() finds no local socket and the aggregate
is forwarded across a NETIF_F_GSO_FRAGLIST-capable veth device into the
netns hosting the espintcp socket) and is chained onto
skb_shinfo(head)->frag_list by __strp_recv(), skb_cow_data() invokes
skb_copy() / skb_copy_expand() on that frag_list member and hits
WARN_ON_ONCE(skb_shinfo(skb)->gso_type & SKB_GSO_FRAGLIST), failing with
-ENOMEM before decryption even begins. (On older stable trees without TCP
fraglist GRO, the pre-pass is a no-op.)

After ESP decryption and header removal, the resulting single inner packet
still has skb_is_gso(skb) == true with the stale outer TCP gso_size, while
skb_headlen(head_skb) is now smaller than that gso_size due to stripping
the outer framing and ESP header. When this packet passes through
gro_cells_receive() (which flushes frag_list packets via GRO_NORMAL
without resetting gso_size) and is forwarded, validate_xmit_skb() invokes
tcp_gso_segment() -> skb_segment(). Because head_skb is shorter than the
stale gso_size and SKB_GSO_DODGY is not set, skb_segment() attempts to map
the slab-backed frag_list member as a scatter-gather page fragment where
list_skb->head_frag == 0. On current mainline kernels, skb_segment()
triggers DEBUG_NET_WARN_ON_ONCE(1) and fails with -EINVAL, causing
validate_xmit_skb() to drop all multi-segment espintcp packets. On stable
kernels prior to the removal of BUG_ON(!list_skb->head_frag) in
skb_segment() (such as 6.12.94 where this trace was captured), it crashes
the kernel:

  Internal error: Oops - undefined instruction: 0 [#1] SMP ARM
  PC is at skb_segment+0x574/0xd20
  LR is at skb_segment+0x884/0xd20
  Call trace:
   skb_segment from tcp_gso_segment
   tcp_gso_segment from inet_gso_segment
   inet_gso_segment from skb_mac_gso_segment
   skb_mac_gso_segment from __skb_gso_segment
   __skb_gso_segment from validate_xmit_skb
   validate_xmit_skb from __dev_queue_xmit
   __dev_queue_xmit from ip_finish_output2
   ip_finish_output2 from ip_output
   ip_output from ip_sublist_rcv_finish
   ip_sublist_rcv_finish from ip_sublist_rcv
   ip_list_rcv from __netif_receive_skb_list_core
   __netif_receive_skb_list_core from __netif_receive_skb_list
   __netif_receive_skb_list from gro_normal_list
   gro_normal_list from gro_cell_poll

Similarly, if a decrypted inner packet with a frag_list later takes the
ip_do_fragment() frag_list fast path, each detached frag_list member is
transmitted as a standalone IP fragment and would still carry the stale
outer TCP GSO state when reaching validate_xmit_skb(). And even when an
ESP record does not have a frag_list, leaving the stale outer TCP gso_size
on the decrypted inner skb prevents dev_gro_receive() from initializing
gso_size to the inner packet's skb_gro_len().

We cannot reset GSO state earlier in espintcp_rcv() / handle_esp() because
the skb may still be a clone sharing skb_shinfo with the outer TCP skb held
by strparser. Instead, in esp_input() and esp6_input():
1. Prior to skb_cow_data(), unshare/unclone and reset GSO metadata on any
   frag_list member carrying SKB_GSO_FRAGLIST (unsharing any shared
   predecessor frag_list members along the walk) so skb_copy() /
   skb_copy_expand() inside skb_cow_data() does not hit WARN_ON_ONCE() and
   drop the packet.
2. At skip_cow, where the head skb and all frag_list members are guaranteed
   to be uncloned with private skb_shinfo, call skb_gso_reset() on both the
   head skb and each skb_walk_frags() member.

Fixes: e27cca96cd68 ("xfrm: add espintcp (RFC 8229)")
Cc: stable@vger.kernel.org
Signed-off-by: Guoshuai Yang <yangguoshuai@gmail.com>
---
v4:
  - In esp_reset_espintcp_fraglist_gso(), unshare any shared frag_list
    member before checking SKB_GSO_FRAGLIST so *fragp = frag never writes
    through a shared predecessor's ->next pointer.
  - Clarify in the commit message that on current mainline kernels
    skb_segment() triggers DEBUG_NET_WARN_ON_ONCE(1) and returns -EINVAL
    (dropping the packet in validate_xmit_skb()), whereas the BUG_ON()
    oops trace was captured on 6.12.94 LTS.
  - Clarify the cross-netns veth forwarding topology required for TCP
    fraglist GRO (SKB_GSO_FRAGLIST) aggregates to reach esp_input()
    unsegmented.
  - Link to v3: https://lore.kernel.org/netdev/20261023065311.65031-1-yangguoshuai@gmail.com/
v3:
  - Unshare/unclone and reset GSO metadata on any frag_list member carrying
    SKB_GSO_FRAGLIST before skb_cow_data() so skb_copy() / skb_copy_expand()
    does not hit WARN_ON_ONCE(SKB_GSO_FRAGLIST) and return -ENOMEM.
  - Move the shared espintcp GSO reset helpers into include/net/esp.h.
  - Link to v2: https://lore.kernel.org/netdev/20261020030450.7170-1-yangguoshuai@gmail.com/
v2:
  - Also call skb_gso_reset() on each skb_walk_frags() member at skip_cow
    in esp_input() and esp6_input() so detached frag_list members on the
    ip_do_fragment() fast path do not retain stale outer TCP GSO state.
  - Specify target tree 'net' in subject prefix.
  - Link to v1: https://lore.kernel.org/netdev/20261018005218.53267-1-yangguoshuai@gmail.com/
 include/net/esp.h | 51 +++++++++++++++++++++++++++++++++++++++++++++++
 net/ipv4/esp4.c   |  9 +++++++++
 net/ipv6/esp6.c   |  9 +++++++++
 3 files changed, 69 insertions(+)

diff --git a/include/net/esp.h b/include/net/esp.h
index 3229507..83c75ef 100644
--- a/include/net/esp.h
+++ b/include/net/esp.h
@@ -28,6 +28,57 @@ static inline void esp_output_fill_trailer(u8 *tail, int tfclen, int plen, __u8
 	tail[plen - 1] = proto;
 }
 
+static inline int esp_reset_espintcp_fraglist_gso(struct sk_buff *skb)
+{
+	struct sk_buff **fragp;
+	struct sk_buff *frag;
+
+	skb_walk_frags(skb, frag) {
+		if (skb_shinfo(frag)->gso_type & SKB_GSO_FRAGLIST)
+			break;
+	}
+	if (!frag)
+		return 0;
+
+	if (skb_unclone(skb, GFP_ATOMIC))
+		return -ENOMEM;
+
+	for (fragp = &skb_shinfo(skb)->frag_list; (frag = *fragp);
+	     fragp = &frag->next) {
+		if (skb_shared(frag)) {
+			struct sk_buff *nfrag;
+
+			nfrag = skb_clone(frag, GFP_ATOMIC);
+			if (!nfrag)
+				return -ENOMEM;
+
+			nfrag->next = frag->next;
+			consume_skb(frag);
+			frag = nfrag;
+			*fragp = frag;
+		}
+
+		if (!(skb_shinfo(frag)->gso_type & SKB_GSO_FRAGLIST))
+			continue;
+
+		if (skb_unclone(frag, GFP_ATOMIC))
+			return -ENOMEM;
+
+		skb_gso_reset(frag);
+	}
+
+	return 0;
+}
+
+static inline void esp_reset_espintcp_gso(struct sk_buff *skb)
+{
+	struct sk_buff *iter;
+
+	skb_gso_reset(skb);
+	skb_walk_frags(skb, iter)
+		skb_gso_reset(iter);
+}
+
 struct esp_info {
 	struct	ip_esp_hdr *esph;
 	__be64	seqno;
diff --git a/net/ipv4/esp4.c b/net/ipv4/esp4.c
index e76db58..92980cd 100644
--- a/net/ipv4/esp4.c
+++ b/net/ipv4/esp4.c
@@ -893,6 +893,12 @@ static int esp_input(struct xfrm_state *x, struct sk_buff *skb)
 		}
 	}
 
+	if (x->encap && x->encap->encap_type == TCP_ENCAP_ESPINTCP) {
+		err = esp_reset_espintcp_fraglist_gso(skb);
+		if (err)
+			goto out;
+	}
+
 	err = skb_cow_data(skb, 0, &trailer);
 	if (err < 0)
 		goto out;
@@ -900,6 +906,9 @@ static int esp_input(struct xfrm_state *x, struct sk_buff *skb)
 	nfrags = err;
 
 skip_cow:
+	if (x->encap && x->encap->encap_type == TCP_ENCAP_ESPINTCP)
+		esp_reset_espintcp_gso(skb);
+
 	err = -ENOMEM;
 	tmp = esp_alloc_tmp(aead, nfrags, seqhilen);
 	if (!tmp)
diff --git a/net/ipv6/esp6.c b/net/ipv6/esp6.c
index b1c9b36..65470d3 100644
--- a/net/ipv6/esp6.c
+++ b/net/ipv6/esp6.c
@@ -936,6 +936,12 @@ static int esp6_input(struct xfrm_state *x, struct sk_buff *skb)
 		}
 	}
 
+	if (x->encap && x->encap->encap_type == TCP_ENCAP_ESPINTCP) {
+		ret = esp_reset_espintcp_fraglist_gso(skb);
+		if (ret)
+			goto out;
+	}
+
 	nfrags = skb_cow_data(skb, 0, &trailer);
 	if (nfrags < 0) {
 		ret = -EINVAL;
@@ -943,6 +949,9 @@ static int esp6_input(struct xfrm_state *x, struct sk_buff *skb)
 	}
 
 skip_cow:
+	if (x->encap && x->encap->encap_type == TCP_ENCAP_ESPINTCP)
+		esp_reset_espintcp_gso(skb);
+
 	ret = -ENOMEM;
 	tmp = esp_alloc_tmp(aead, nfrags, seqhilen);
 	if (!tmp)
-- 
2.54.0 (Apple Git-157)

