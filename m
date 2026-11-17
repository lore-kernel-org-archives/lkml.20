Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794896462;
	b=24AsfRwBTs62wgDu428z9Sf8dxPi1xmqI3RAJxiDdblcVk+skvzYu+rlL0kKQQT0PpFi
	 dGxF3ACPd5qX7epkzLfCUMEI71EebHVseubfd3S9TO6G/5ZtDmiEnfBMLCNRmzEW2dd1o
	 ZU1878vcKNADgZMdI3snxALzroXJTREibXi0Id4DjTWvGHYyZst78ViUNpct5On+iMWuj
	 T3zrFs97UiuZV/L4SFpWpKYi0Psj4b4CD1WmEEtPuyz8Wsmnelo++K5fSk+mxGTg+sFPp
	 zQsNIE8jPY/lffPUJjGdbZzvmYa5EzZ/0PKXZxuaO3WHMlwO/dNT/pI+FiGPR6VgRPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794896462;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=NMCfTKaQFPqIG16pX0W13wdOlIRyQ9c9PPUggitB6aQ=;
	b=fnz3E9cM8BvHhvDlW3pDwtlra1OW0nMLxE9p1A1WmLZ3sPn//YfxfKLr3TdtTN9sAff0
	 rdzmfh4Dyk9EoarPcXguxZhi2ZfMWUkplFI0OxzDuyezlVc/js3Un7CjHgBVkPFRAi5WT
	 jycLSM6k6AUsZl2CweRbnL7SzXnqdg1XBNqhwXzDtrTfO3Hg2goCpFji/yBGOlfw2uO9q
	 28AVe/pE6yhO390244W+wBx1Zs5SS8Y0SX5KW0toZ3WYgPENWHHA5AkOjg20ePten4PqS
	 lLAcDG9wf9/TMyf5k6sxDhGF3z2MHNw4JZHoBRPjoV7MHYO7XUF4lcyRtgsSs8GXVqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iiitd.ac.in;
	spf=pass smtp.mailfrom=iiitd.ac.in;
	dkim=pass header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=TJd0wc9G;
	arc=none smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E39B8606A323
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:21:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E39B8606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=TJd0wc9G
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2efd432714aso5027315ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 22:21:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iiitd.ac.in; s=google; t=1794896460; x=1795501260; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NMCfTKaQFPqIG16pX0W13wdOlIRyQ9c9PPUggitB6aQ=;
        b=TJd0wc9Ga+6W0cZx0oRDki6Ui8R7jndpZyKiFsjPr7lCT2gmY/5yL8ZydIIGgHOQxF
         r2YC0YqZNsZSZm1T/O7kooooFoeigqFzkjgpWkf15SZ/aiSn8u9gjv64o7GupjMP67HX
         4OzYSCYTI1sMSTa+sws9V2SGuE3cw+l6ScSV0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794896460; x=1795501260;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NMCfTKaQFPqIG16pX0W13wdOlIRyQ9c9PPUggitB6aQ=;
        b=BSsp/ZETb4oAkj0VsH5wp6RsoIYJlDyRK+foHw+r2Mx4bnUXyUT7rJU/GAlrRZjfX6
         AK/bpTQbF1G5aPCd+EYkWaripenDsskX/QwUo9z9ciRcY5GD7mFbI/z8Nuhw9dZkF/+u
         8PRwibIf1XnFp33M2VufXycfIofgZYAafn5MOVx61mttjGfguZzpIziLNaUA8EjEQNt+
         vKTRKzucpEJSicyual/Y6Wt3cFzKAJRXqmeQ7SP4aIX88kNclE+T10W1ceXj+nT/Nn3z
         PUQkUM0qwDvgtFSyI9RMHG1eMoT905q+oyp/KWKTuNFFuWMeAXVzNZ8b56EM5sn5YlMk
         s7aA==
X-Forwarded-Encrypted: i=1; AL+hErE76yDnvY1sbg+BmWnqDIllWdiOaajNC6DcxewtOvZRCLbmw0EdY04V+8YZKf8isVj1QEXR83oXtUP9ICg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9oXs+XKxHd+c5JVjBVP5kVff3clTJaPsynZAQX9m/MM1zHHz4e
	dlimyBfYVTOM681J9jOiCGu2o+k6sgV7tQcou04VYtStWewr9RsTbFZGZDHTb4EnImI=
X-Gm-Gg: AZFdTZcpRqxFykLZL9q789JI5J7jbKS5aszFktVQV6FwwC/tMP4GMxckhBfBPvoxqxz
	03WWdAZQlhd7WEOUof+yopgOsE/18MG/X6hRnRr5q8GL6inmeAtNDLapPGXql62LdOGlg9Ngw0s
	y8cxUqCQXrFKTRrT0BsHHlFJYiKDKc7jPL2f6SWXGsV80ecPo/IRsy9MHLiFHAd3NwIYqtIdw9Q
	E7IAn7sBEcA9krL0b51QkaaDybhO0GGF+nuApTShxwOucm/8cK7+rtRv0eJ2ENuceOlYwLJjWwv
	VNWRF23/FadP9oNGn9cAc0O9ny8+DXX4jcTQQ3TGRcS/2fPkPlHIm/V58NWmSjmNJ1/Cm3jfi3o
	VEFJUpSN65AvnfqnKBnIDHcKT1cSSfCSYMlNgUzKb04IWA3dVZscE9Bc1kJ+ZnggAMOdvtEx+Wp
	/bAhT9VdoLCWTS5GxCMnQJF2iGIDjnR8KFi9bx+dlB5kQc1U07ZlCCle1zxP2krbxdXhWDdH6nu
	ThnzXgQAOwj3Kh/VI5jq0uas9P7EBa0fv4JH6j2Jp8kqvVYo+E1sRiW/eZPrZlaZ6Kn3VKRnA+R
	pDgj0OieAyruzuhE6Bf4z9XxXBeZHaMzPOrvH/mYrRNEmre/Btcz+RpQW7GwnDHRvob5GIKdukp
	4o2ItSlJQk1pAoQpYwL/G9L8QGLMGbwtOsnMN4LZQ06C3r2wPzk+7a94WGDYfMDHgycPB1M5lD8
	WZWYAVWoNKpw==
X-Received: by 2002:a17:902:ce0c:b0:2ef:e59b:f562 with SMTP id d9443c01a7336-2efe59bf9a2mr1743065ad.58.1794896460203;
        Mon, 16 Nov 2026 22:21:00 -0800 (PST)
Received: from iiitd-S2600STB.iiitd.edu.in ([103.25.231.160])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2efd7a3797esm8112765ad.31.2026.11.16.22.20.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 22:20:59 -0800 (PST)
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
Subject: [PATCH net v2] xfrm: do not write the ethernet header when the mac header is unset
Date: Tue, 17 Nov 2026 11:50:46 +0530
Message-Id: <20261117062046.3286096-1-piyus@iiitd.ac.in>
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

A THIRD SITE HAS THE SAME THREE LINES, in __input_process_payload()
(net/xfrm/xfrm_iptfs.c), reached when an IPTFS payload is decapsulated:

	skb->protocol = protocol;
	skb_mac_header_rebuild(skb);
	if (skb->mac_len)
		eth_hdr(skb)->h_proto = skb->protocol;

and it has its own KASAN report, a use-after-free rather than an
out-of-bounds, for the reason given below.

That function already knows the test is needed.  Its other mac-header path
is guarded by old_mac, which it computes at the top as

	old_mac = skb_mac_header_was_set(skb) ? skb_mac_header(skb) : NULL;

and only rebuilds the header when that is non-NULL.  The site above omits
the same check.

WHY THE THREE REPORTS CARRY DIFFERENT TITLES, which is worth stating so
they are not read as three defects.  The address written is a fixed
skb->head + 0xffff + offsetof(struct ethhdr, h_proto), so what it lands in
is whatever the allocator placed 16 pages past the skb: a live object gives
slab-out-of-bounds, a freed one or a page back on the buddy free list gives
use-after-free, and a different LIVE object gives nothing at all, since
generic KASAN only tests whether the target address is poisoned.  Across
six boots of one reproducer the write executed in five and KASAN reported
it in one.  On a kernel without KASAN it is always silent.

Only write the ethernet header when there is one.  This mirrors what
xfrm4_transport_input() already does, where the header length is taken as
skb_mac_header_was_set(skb) ? skb_mac_header_len(skb) : 0, and what
__input_process_payload() already does for old_mac, and it leaves the
behaviour of every well-formed skb unchanged.

Link: https://lore.kernel.org/r/20261116174531.2540348-2-piyus@iiitd.ac.in
Signed-off-by: Kapil Vaswani <kapil@presceralabs.ai>
Signed-off-by: Piyus Kedia <piyus@iiitd.ac.in>
---

v2:
  - guard the third site, net/xfrm/xfrm_iptfs.c in __input_process_payload().
    It has the same three lines and its own KASAN report, a use-after-free,
    and v1 left it alone - which would have closed two write sites of the
    three while leaving a confirmed one live.
  - say why the three reports carry different titles (slab-out-of-bounds,
    use-after-free, use-after-free): the address is fixed relative to
    skb->head, so the verdict is decided by whatever the allocator put 16
    pages later, and a live neighbour gives no report at all.
  - cite __input_process_payload()'s own old_mac computation as the in-tree
    precedent alongside xfrm4_transport_input()'s.

  No change to the two hunks v1 carried.

Tested at runtime on mainline before and after: both kernels built from
aebb72744764 ("Linux 7.4-rc3") in one scripted run, x86_64 with
CONFIG_KASAN_GENERIC, CONFIG_DEBUG_NET, CONFIG_IPV6_SEG6_LWTUNNEL and
CONFIG_NET_VRF. Six boots each, injecting after the uptime passed 130s. The
skb_reset_mac_len() warnings at include/linux/skbuff.h:2995 are the control:
they fire when the unset-header skb reaches the receive path and this patch
does not touch that site.

                  skb came through   reached the write   KASAN
  unpatched         5 of 6 boots       5 of 5             1
  patched           2 of 6 boots       0 of 2             0

Every unpatched boot in which the skb arrived reached the write; no patched
boot did, including the two in which the control shows the same skb arriving.
The one-in-five KASAN rate is the point made in the changelog about the
verdict depending on the neighbour.

checkpatch reports one thing, the missing Fixes: tag. Neither tree we
reproduced on carries history for these files, so we could not determine the
introducing commit; we will add it if you can name it.

 net/xfrm/xfrm_input.c | 4 ++--
 net/xfrm/xfrm_iptfs.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

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
diff --git a/net/xfrm/xfrm_iptfs.c b/net/xfrm/xfrm_iptfs.c
index 0313a43aa..41af72a92 100644
--- a/net/xfrm/xfrm_iptfs.c
+++ b/net/xfrm/xfrm_iptfs.c
@@ -1099,7 +1099,7 @@ static bool __input_process_payload(struct xfrm_state *x, u32 data,
 
 				skb->protocol = protocol;
 				skb_mac_header_rebuild(skb);
-				if (skb->mac_len)
+				if (skb_mac_header_was_set(skb) && skb->mac_len)
 					eth_hdr(skb)->h_proto = skb->protocol;
 
 				/* all pointers could be changed now reset walk */
-- 
2.34.1

