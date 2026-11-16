Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794851153;
	b=yKPEEdfeDb7QyzrcoZ6MsrgTLKOpjFT0Ke/4RCyvWvReOP8wOr1fRrEpB8JzFV55T5Mb
	 bW8IA+D0A2mtz05fhR1yidB19gXJj0/qqHy1FAge6nnrLPtoPwCIzQkR2aVBs8KYwjK8v
	 F3fZem95aer+TftM7OTuq0m8Vuf1AsX8ajjK0czjYrvAy8DHYAoNnbeThfZGEmXoisqy6
	 3AvLCenYwnljLRMQYgryzITW0tXVYNox23BUMvFcuO8k3DldIbrqh9P/1gxFkKvOBIevw
	 UwuF2nf1yW47LII9MNdn+WcRT9VtvmwhTG+sr5vTOLctE50WGNF4KxxL411gPlYp6Kw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794851153;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=D3rTq3sw2FiwvkIQe48QRombHNJIoQKUHEA+xIJ5DiQ=;
	b=1LWG/zH9s67ZuEnhisa13VkFtwokibxDphXLUqjwkPvsfe0pZic8biMw18zyrEzpZVu2
	 orsIG7Se2zXj+uIpYAORgS2h1LHCTpzlv6TgI+7/Gkdxo4yrAivNlqwcbvzed/l76KbCu
	 RLRRJyAKH7utdCIhQUOV3kLJiVRjUZ8eYP3GMmoJVSz8pDFTe+qBQRG14Vq1Mfxinw3Uf
	 SU2Rjrl9yhDyqXVeAfLSFAV16QzKCialEDvPKWSn++Mx39F4imb5HFcohUaqdxM+0p3A8
	 gSX4Y+bWb5VHQRkHnzE1B/VV5oAPeQxUSwmhdiF0uBDJKmV8+Y1B5g1MUeHe6ANSsSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iiitd.ac.in;
	spf=pass smtp.mailfrom=iiitd.ac.in;
	dkim=pass header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=DWU6lqw0;
	arc=none smtp.remote-ip=209.85.215.170
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC2CA606A337
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 17:45:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC2CA606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=DWU6lqw0
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cddc250d815so1398774a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 09:45:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iiitd.ac.in; s=google; t=1794851152; x=1795455952; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D3rTq3sw2FiwvkIQe48QRombHNJIoQKUHEA+xIJ5DiQ=;
        b=DWU6lqw09moZ7xf7I4XLNXwGNQP25K3m4ulKGOweje5zk1tD/ckwet6QPIarUcRppX
         zJYKnvakJSXzzjH1YG2HouKyOzgdCC0M8htW77fU/wKbENsjNnRxyiT+4vdm/SwBJlL9
         GAtA475l9OZEa/411jX1glXriwcU/MLvD9RNA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851152; x=1795455952;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=D3rTq3sw2FiwvkIQe48QRombHNJIoQKUHEA+xIJ5DiQ=;
        b=Z8qHl4Iz/j7llt7utPXobtkSTpkU7DvQ7DUF/DGy62dIrzlfbM8bFqr1wI7ZfLUWtQ
         GRijbY2Y6vmSNVcl2MuwlUbM7hTURWgye1myYnPRLRZXN3Rj0LQE/npMwpnMUE7ws+n9
         FdftOpiLfS18ekMDbj/xCMyip2+fF1ztasVy09pmxaWvPMgPEACxRZ7DBbX/WcqaTydZ
         0ItZQa8TQHxWjDfk+AZp5iIB2cpzQWU0cgAUzUo1pMH1QYxx/IASc28vt/bR+dOFyj8D
         30m7IdPHYA1WgiS3F19QC0cscACyHMD2NygU2Y/k+iRAamPZPigmtbYCVaDZ0/JkFXZp
         gqiA==
X-Forwarded-Encrypted: i=1; AL+hErEW7pRVngDxTmrEY0NZTnlSlao3+NA7vH6KU/x5lRP5ZXJX24lxulqIlmwz7SufQ+0clj7r/D06zho/3pE=@vger.kernel.org
X-Gm-Message-State: APuU4Z986ymZSMG6eqFJUtAgU4tTRUIk0IWqhTjMsBpxNL87+NFK0KwO
	j47MEPIIz24GSxpPWqwFLAB13J2J2aX56nKu2TyUSwvbwX7HZp2T1KtAMV4i1xt6WZA=
X-Gm-Gg: AZFdTZfYwd0pvrEfN+LiD50Z1EAQ3dqIQ8nUUEGCIbo6f+osHaAdZJErQzvwaGPZiNu
	lL4O5/UMzDYDuXA0BconeefkZ+AQsF2L48+QcTdnDMhRz2MoTvXscr7DhoSuJ6KvGHA+hTl7tdR
	s0JxQTpTNQeugf17WB4tsgLvTJgziq1xEmvsfSZR0hC6cjttlVFRB1ZLHQuRW8c56sj1J9WmTjC
	93kocIrlWO0QFOxdyLn7ZBaqE2isV5/QXw1SQiOEbCKloL5Nbe/U6s6fDh6PrZZRY/M51KikoaV
	IA8AeEK5S74+GNuAv0rnmgL2/B5rsp1n9zjKkmBcKLe9a1ZwcRwamyy3H3gls4zP4uVVPOTkK8R
	uwFy9iIB38GYMB1lhgUBJ0FMR27WKzA8EWXWi6Du1tT0LLLNdif5fmi7C0U8zfZzZsKl0ym7bFM
	bZb2aKQLOOOd14sk44M38N3PeoxuIRJrzKgueRdTYcP+5E/AaPSfrBfYiRB6LBB/Uk8tux2fWUr
	3AS7LKZHVPxN8V1OpnDxfUEsaKCv/71GhtuNu/38WhdI8FTAmmhvxzZ+6XnUrV1jh46XM0W2/E/
	jXrgriFvx/Xh8CkLFD3/TbEb7hztZjefOAfjo5hYAPXZjWA6K9Jfb9nfvXUsUg7Tl3b5m9Htzo9
	4pQIAif7mZu5Z5ONYYJJa8ThOliHpJrOGixTQt1LffT8eWik99lM35f0nPXZBWDGF
X-Received: by 2002:a17:902:f545:b0:2e9:9522:ed3a with SMTP id d9443c01a7336-2ee0de4bfacmr106958285ad.22.1794851148382;
        Mon, 16 Nov 2026 09:45:48 -0800 (PST)
Received: from iiitd-S2600STB.iiitd.edu.in ([103.25.231.160])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2efd7ab901dsm2577055ad.74.2026.11.16.09.45.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:45:47 -0800 (PST)
From: Piyus Kedia <piyus@iiitd.ac.in>
To: Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S . Miller" <davem@davemloft.net>,
	Andrea Mayer <andrea.mayer@uniroma2.it>
Cc: Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	ipsec@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Kapil Vaswani <kapil@presceralabs.ai>,
	Piyus Kedia <piyus@iiitd.ac.in>
Subject: [PATCH] xfrm: do not write the ethernet header when the mac header is unset
Date: Mon, 16 Nov 2026 23:15:31 +0530
Message-Id: <20261116174531.2540348-2-piyus@iiitd.ac.in>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261116174531.2540348-1-piyus@iiitd.ac.in>
References: <20261116174531.2540348-1-piyus@iiitd.ac.in>
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

xfrm4_remove_tunnel_encap() and xfrm6_remove_tunnel_encap() restore the
mac header after removing the tunnel header and then stamp the protocol
into it:

	skb_reset_network_header(skb);
	skb_mac_header_rebuild(skb);
	if (skb->mac_len)
		eth_hdr(skb)->h_proto = skb->protocol;

skb_mac_header_rebuild() does nothing at all when the mac header was
never set:

	static inline void skb_mac_header_rebuild(struct sk_buff *skb)
	{
		if (skb_mac_header_was_set(skb)) {
			...
		}
	}

and it does not clear skb->mac_len either, so on an skb whose mac header
has been unset while mac_len stayed behind, the guard is true and the
store goes through an unset header.  skb_mac_header() is
skb->head + skb->mac_header and the unset value of that u16 is 0xffff,
so eth_hdr(skb)->h_proto is 65535 + offsetof(struct ethhdr, h_proto)
bytes past skb->head: a two-byte out-of-bounds write landing far outside
the skb, in whatever object happens to be there.

skb_unset_mac_header() leaves skb->mac_len alone, and of its callers only
skb_carve_reset_headers() clears mac_len by hand.  end_dt_vrf_rcv()
(SRv6 End.DT4/End.DT6) unsets the mac header on the receive path so the
VRF device can rebuild it, and leaves mac_len at the value the original
ethernet frame had, which is how an skb in this state reaches xfrm input:

  tun_get_user -> netif_receive_skb -> lwtunnel_input
    -> seg6_local_input_core -> End.DT4 -> end_dt_vrf_rcv
    -> skb_unset_mac_header (mac_len stays 14)
    -> VRF l3_rcv -> ip_local_deliver_finish -> xfrm4_esp_rcv
    -> xfrm_input -> xfrm4_remove_tunnel_encap

  BUG: KASAN: slab-out-of-bounds in xfrm4_remove_tunnel_encap+0x17d/0x220
       net/xfrm/xfrm_input.c:258
  Write of size 2 at addr ffff88805f85800b by task syz-executor/10831
  ...
  The buggy address belongs to the object at ffff88805f858000
   which belongs to the cache zswap_entry of size 56

The address does not depend on mac_len - it is always
skb->head + 0xffff + offsetof(struct ethhdr, h_proto), since the unset
sentinel is what mac_header holds - and mac_len only decides whether the
write happens.  The value is skb->protocol.  It is two bytes at a fixed
64KB offset, crossing into an unrelated slab cache.

Only write the ethernet header when there is one.  This mirrors what
xfrm4_transport_input() already does, where the header length is taken as
skb_mac_header_was_set(skb) ? skb_mac_header_len(skb) : 0, and it leaves
the behaviour of every well-formed skb unchanged.

Signed-off-by: Kapil Vaswani <kapil@presceralabs.ai>
Signed-off-by: Piyus Kedia <piyus@iiitd.ac.in>
---

Tested at runtime on mainline itself, before and after.  Both kernels were
built from aebb72744764 ("Linux 7.4-rc3") in one scripted run, x86_64 with
CONFIG_KASAN_GENERIC, CONFIG_DEBUG_NET, CONFIG_IPV6_SEG6_LWTUNNEL and
CONFIG_NET_VRF, so each image is provably from its own commit.  Six boots
each, injecting after the uptime passed 130s.

The skb_reset_mac_len() warnings at include/linux/skbuff.h:2995 are the
control: they fire when the unset-header skb reaches the receive path, and
this patch does not touch that site.

                  skb came through   reached the write   KASAN
  unpatched         5 of 6 boots       5 of 5             1
  patched           2 of 6 boots       0 of 2             0

Every unpatched boot in which the skb arrived reached the write; no patched
boot did, including the two in which the control shows the same skb
arriving.  The assertion inside skb_mac_header() disappears from the patched
runs for the reason the change implies - eth_hdr(skb) is no longer evaluated
when the header is unset, so skb_mac_header() is not called at that site -
while the unrelated warnings remain.

checkpatch reports one thing, the missing Fixes: tag.  Neither tree we
reproduced on carries history for the file, so we could not determine the
introducing commit; we will add the tag if you can name it.

 net/xfrm/xfrm_input.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/xfrm/xfrm_input.c b/net/xfrm/xfrm_input.c
index 5ed87d513..624ff8055 100644
--- a/net/xfrm/xfrm_input.c
+++ b/net/xfrm/xfrm_input.c
@@ -254,7 +254,7 @@ static int xfrm4_remove_tunnel_encap(struct xfrm_state *x, struct sk_buff *skb)
 
 	skb_reset_network_header(skb);
 	skb_mac_header_rebuild(skb);
-	if (skb->mac_len)
+	if (skb_mac_header_was_set(skb) && skb->mac_len)
 		eth_hdr(skb)->h_proto = skb->protocol;
 
 	err = 0;
@@ -291,7 +291,7 @@ static int xfrm6_remove_tunnel_encap(struct xfrm_state *x, struct sk_buff *skb)
 
 	skb_reset_network_header(skb);
 	skb_mac_header_rebuild(skb);
-	if (skb->mac_len)
+	if (skb_mac_header_was_set(skb) && skb->mac_len)
 		eth_hdr(skb)->h_proto = skb->protocol;
 
 	err = 0;
-- 
2.34.1

