Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792738400;
	b=qZR7tNx8KbasQGZOJHPdh8SELCBD3fPaaOwso/CIpzh6dVf9/0B4fXF7Uf/I+o0sDajc
	 Q5Ch+LO5q6ArR9zKD7Cmd92HRh08n7eCapXREsKZlUrAUqsc9QlgQzqpKgKQd/MQZJcYl
	 5wV37GJBcuHPqIGDzeGq6a09eSEXmjMjC0oraeimka776q7X7l3KGRc7gGlwhH5QVgbh1
	 L4XL7nhdb8+woTNVxEsi9AWL/GeXwWn2Q7El0M1lPmOSZUQgJQ3XD/LAzTl3v/tdq1BxR
	 ffUx0hMduKdM15tpiLCTXa2wsqww46hd0bRJugcprwpUG/VFhQDMbnweGCGKx0Im+DQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792738400;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=rVRNnDLDDIW+sRfhuCbABetubfb2eyFKmWznRnHIsoc=;
	b=M1vBccTPagfPJK9bs635P0+C4KENuuBE9OlRzMH0tc8Lo3yaw3cBfzQWwI7ub2yoSY+f
	 b21Wku78c+rtY6FWY8VyLpsn6iTIyFFxWbwq1z33xJaR5bgGKOWgtqsxZFBNSkHmlZrjh
	 Z8duh+1hG6V67sasfwFLOBmzGX08th835KX9tVaeh5WunNU0SSNcUQyAAA/rCCdJMnd//
	 EwWXUYGTflDAW589rrCxePRoeBC1LV/LwDn2lUa6l9FxMbVAkEr4qwroYpb0xb1hDUzaz
	 4bKgBftREyf5urErjzO7pKBk0EUm/yng6aVEmV17ONc46WzGoect4C55WksI/GzYY3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="U/EOK7fA";
	arc=none smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFD95606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 06:53:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFD95606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=U/EOK7fA
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2e5fb79ce82so2822495ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 23:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792738399; x=1793343199; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rVRNnDLDDIW+sRfhuCbABetubfb2eyFKmWznRnHIsoc=;
        b=U/EOK7fAC66nKGMcSF6e7r3Hz7zvk1fQrc/o+kdyEjDojVsyNAft4iQXkXF8NY8WZJ
         IJv5ioTxgYXHL1vYgTITBcaVDczXsGhNgs5IYuhXcY+8D7bfuw/qhSqoTtwu1t3WOzv3
         WaOdBEO+QbNnAAJTIxtFTBLKaqa1RY53q/sohUEW0MDv+kxY6HcwTQeo1uGXrMnLRzvH
         hCCEe8mMYLUfiJUGbPo4WGYoEEwq6VWKR/DmG2hr/D/t/SfenYYyMAQUC+coUbYnulwr
         8f8dESYeUSlTnqdkg9F2phM5nKYIgBeR3O1Gy/Uyl8c1LSbFAaHifxfkdWXXLA+6g8IO
         DHeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792738399; x=1793343199;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rVRNnDLDDIW+sRfhuCbABetubfb2eyFKmWznRnHIsoc=;
        b=bdT7FM7SgctaxLyvbCym+h03AbmSFJbNl0r7Jmbsin9Xlh7BSEnswFJZC4WQaJ21eB
         ba8jTGjjjDmEGuVCz3omn6DJFwI+2UUfbXLg8HTws+bX2s+tA9gVncXmZ+JL1+k8cviF
         2zW5BoobuAe3nQ7pdxlvMvICQjo/dl3mNoTTQPz7s/8RbDHl53VPgrkYyX76r9mW/j+o
         3vmDqICSO80NkuJwypObeN5TnHdyKGCj5vSH7xv0ii/foefOfTn0iFmkZeR4FAuNqVYH
         CzvPMT0an7BIZlSpS3yKTKYMMcdH8ZaWgITyC+okeb07bb2lctmjUPrha+T6iuyBhcCb
         Kl8g==
X-Forwarded-Encrypted: i=1; AKwUvBy+z1frH4M3AjnBJs6n3fxsgBAgXume8FA3NN6R8u5lNhZ2ps5UOXU5viASdOx5trTBOfgwS9nGajA2Juk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJPoB3FNG1WQT7jguxdxOlemi6OTjGdyGYoqY0kg43iffMjRLBW
	jfiNf1gvTgXJXCPl1WY6X4MQcA8amEujqcal+zomy9wazuwBfVSOvVoG
X-Gm-Gg: AYBFou3Dl9UQo987XqbrGuVfpjwJP6Z15oq/56FTNIMP3kCjJJ9CdPAF4FAJ/0SRzUl
	pyU6tXr/40V+dS/6lGUiNtsICbXzyoOAgZdyWgXKl1Sg+wwHaanuDd1s68g0GBPP4yiEhpns4GF
	M68Bh8ftXlY+BqEEssr8vdRY6g9yTZ+czj+TiuHCMiRrc2lrILjVNTanDgfeEv132OO/GErHDtX
	yfWHKSR66jty5Pin9B3UeAEirqMyIiskCjY64D2jS72RMxDoh6y6arz1ENocm+K4bWf6wEMAx8F
	yTgootVIFgI4fHXeg2uOu6JJJ8nLs5DxXAy95mzq8Sl5lOdDXCItDE/BOdOsIUrvN4Kohj08oyr
	R9pqBbup4tyfsaf2Ol1XjlSRjmWpP/K3EX9APoyqJT7yjikX3mJt5c15JgEQWUaF9kTBMkzQvRK
	3Vqv+XTcUIHJu7E+uwCpWBnJLwPqsfoHF0px7JE4FLQwDkync6o/RHTrXb37HFr9XWb8pe5iS9h
	UAWvBzFEizjVTbLpSamZCbn3hn1i655V30/x4S6jlk3uJ+rT+JrcQewaL7bVVliFFshej9OqP0r
	60zaOOBu2wr1+ZRpWVCo53ROLzvbeOQYyZqYxuZwESZomg==
X-Received: by 2002:a17:902:ce82:b0:2e8:486d:fa00 with SMTP id d9443c01a7336-2ea7c153a0fmr16407985ad.29.1792738398990;
        Thu, 22 Oct 2026 23:53:18 -0700 (PDT)
Received: from localhost.localdomain (ip67.244-167-222.hkg.ten111.net. [222.167.244.67])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea7b3dd597sm6164065ad.62.2026.10.22.23.53.14
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 22 Oct 2026 23:53:18 -0700 (PDT)
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
Subject: [PATCH net v3] xfrm: esp: reset outer TCP GSO metadata on espintcp input
Date: Fri, 23 Oct 2026 14:53:11 +0800
Message-ID: <20261023065311.65031-1-yangguoshuai@gmail.com>
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

Furthermore, if an outer TCP GRO aggregate carried SKB_GSO_FRAGLIST (e.g.,
when rx-gro-list is enabled) and was chained onto
skb_shinfo(head)->frag_list by __strp_recv(), skb_cow_data() invokes
skb_copy() / skb_copy_expand() on that frag_list member and hits
WARN_ON_ONCE(skb_shinfo(skb)->gso_type & SKB_GSO_FRAGLIST), failing with
-ENOMEM before decryption even begins.

After ESP decryption and header removal, the resulting single inner packet
still has skb_is_gso(skb) == true with the stale outer TCP gso_size, while
skb_headlen(head_skb) is now smaller than that gso_size due to stripping
the outer framing and ESP header. When this packet passes through
gro_cells_receive() (which flushes frag_list packets via GRO_NORMAL
without resetting gso_size) and is forwarded, validate_xmit_skb() invokes
tcp_gso_segment() -> skb_segment(). Because head_skb is shorter than the
stale gso_size and SKB_GSO_DODGY is not set, skb_segment() attempts to map
the slab-backed frag_list member as a scatter-gather page fragment and hits
BUG_ON(!list_skb->head_frag):

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
   frag_list member carrying SKB_GSO_FRAGLIST so skb_copy() /
   skb_copy_expand() inside skb_cow_data() does not hit WARN_ON_ONCE() and
   drop the packet.
2. At skip_cow, where the head skb and all frag_list members are guaranteed
   to be uncloned with private skb_shinfo, call skb_gso_reset() on both the
   head skb and each skb_walk_frags() member.

Fixes: e27cca96cd68 ("xfrm: add espintcp (RFC 8229)")
Cc: stable@vger.kernel.org
Signed-off-by: Guoshuai Yang <yangguoshuai@gmail.com>
---
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
index 3229507..09ed682 100644
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
+		if (!(skb_shinfo(frag)->gso_type & SKB_GSO_FRAGLIST))
+			continue;
+
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

