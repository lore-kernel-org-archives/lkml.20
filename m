Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794680824;
	b=xyq0NvWRTDUnisDgJXJQo6RUh175xX3vju5HBteZLaeTan/P5JE6abhiDGc1wPpaC5gM
	 TgjRNL6MGwe13HuHUa3PJg6qRIBhICijdXzIcWBdapp27ZsGqUD4odzRHTcBymVUFNRuW
	 bPxgA1xMPSBD79N2vJ+/f7frC3pPuRwxCevEG/d4w+75xttf7uz6Nx42XtKj8d61dVdWQ
	 sNrI1jbV4CpCjszVIGpt1C5F+1hBru8dCdva0oscXohgGj4qxvpvKskYAXtx8QrgKd96b
	 +G4Lp2xZ7hduZRRUEnCsjWelaSwDiswbcim/2la9bOLBvaF32cKpHtO/N6DRf/xviWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794680824;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Tn41bN4KVzKmUry/z+0zWgDx51EzDxzRN5Hq3iEOOHM=;
	b=XW72KSYv/5VDBCthcGAH5X20BYDIp2XtUrgTweODg46ElUX54AdWfep20o9FrUqzXTI1
	 lkHkDFen5Oup7frJMdIlli1CyeQrcjnf+ILBiapgs5XdtqKMfxMu23OOttn5D840D1ibS
	 HwzCTY0ufMTHWlYA9OfV/WkvUGQehuFqbKwglopyZN2G2B7MejVrlKHcvM2Y9Eok4tJmx
	 yxA0k7UbNYLpD7ikz/RepHBhbnFXL6bS16mTmHqYKjAZkHYxhDliIITsLr8BdZRLbBnXD
	 u3FbBMdPGR+IRbZm8YWsGnNIb2Az+uu9q/chDAL0NdCO6ecRMjL4bWwYV68EDlmWkXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=l3mB9oUI;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8012B606A32E
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 18:27:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8012B606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=l3mB9oUI
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c50cc8e0f84so9767966b.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 10:27:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1794680823; x=1795285623; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Tn41bN4KVzKmUry/z+0zWgDx51EzDxzRN5Hq3iEOOHM=;
        b=l3mB9oUILZHE6tkdqLPs81uCa6bdvGmSXBTqB2Pikc1OS7+C1/fAJXMDFTn6arK9Lv
         spy+nfN1AhrboVwjgUMupVdks2BLCqS2GiSfSUGfVicvabVYACFA0TG2U0wrrJlMFCbN
         4F31prggAqolL4nBbNeZzQszwz72/RgM+D7VFFzrz+9Srqje0XJOZLQF71SA+6zBl4Wh
         6M7DAL/tTh6oSgwvDYKcd4jNP9fYorFP5VlAHh2KHNMABitp6w+oEBpEOgHB2Y3Yu0d7
         87RachCnz/RSv6GhX/gQQyFBxMi0wEI1+naKy+fBmJuBdYvsb87cNqlxX+nN4ZGbkHL8
         ZNZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794680823; x=1795285623;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tn41bN4KVzKmUry/z+0zWgDx51EzDxzRN5Hq3iEOOHM=;
        b=0vIw6vdeW112wkvtlPX0LKovg/Tt6buePRU8PlK/DihVHlSnMLc/aZppuf5e74hZkw
         oUNDbRzcokv84xO+qXgI+g+h8TV9XSG1SUrv537VYAWU1Ur4KBpRYVd/k1MVUhXQc7zn
         Hx+vpAqgCZ9O0OLYOUGmlsNlXRoq4UcsROKWp8KTYzo+za1S+plkMT7pUPIui5PRYicl
         XrgAVOQD92k/t6WJKwibDU+/SBKvS+1wdQ/AOyHscAQTi6L7bWu5VuSyaxdA9I8VPsCG
         T9gj8dPpdG7B7a/K8ioKs4m0PBTg7SSvTP5pLhjoGxn7VsxZuJy6eBxHLwFbndbjWQC8
         p7fw==
X-Forwarded-Encrypted: i=1; AL+hErEHz3R98TNHVLRNl3gaWj6iWg+YU3CwW0wH4E31bBgPrd2gHEMcBY3WZqv87hx+0NWEVeQ7/I0VcUmAUuc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/iVD51l8k0BljUAFpZSjZ5jzDEYVzd7yGTPEIvteTdp66PZNRW
	vfogHoQxnpMtC4ppKDz8Nzn0a9pl89Rq/9j/OUMdr7Tad8mkkG4R/Ls9pC8OFlcusA==
X-Gm-Gg: AYBFou146qDMqAv/7A+PATTJ3G+x7E2doOoziqNYcyfS01rkpkB/HuD9PeiUZPGX7FN
	3mhrXtQJiNXpQV4WYFf2ALKl40bhbU2+Q62Gh5OY1OaZBaf7ePIeYo3TYf2DZ3KkRufY1STSTul
	TxQirCkeffAk8atfqyk/76VmT9mH3ZDi+rdP5q5b+VVvPOnn7j7K9mstfBlHh1H1LNohFqJ2WcQ
	i1ZcXp49g70XcG//RbEQBM/wuhfFoW/VI3P4evVOAZ0pcV7hV+QtZXEDNYLvzwjleCxl/dfpsjz
	8A86ZfG44Dt9SxAW93K7zAjYeY02Rkpy/HtsV1b/l6M9+0aho5P6H3r44I7W7T8Tyt5sPcVM07f
	FwnDA5/c/ZBgugWjqeW5odaLA9+X/ZcsCLwtMFnhA2ue2AAXhQphuJDwaQBeeRV3c11jQ9FkQei
	xu33HnloNaz58YcaaGizNPnbhvmCwWPgnLfg6kIlHJmBF30Z37ubLQLyHB1QCs4NgFOLdMlMQTF
	mJSv0loZLqLcTR3CpHUZVL//BNrp3t/6Hs4c22URk3Sz550My47nlhD1m1Zo959FYhCORXVP0Q2
	CJ21CBBSWxUjc7BH8DGYIScieazMLCjC27HWBS34Ao6rlDoZ6oJSaUVPD5YIjnlD8PFK8Fwv1yg
	rVlKw9eUNILQfPO8jOeHrGJu8lC16OB8zVTHbb/OlCfimpEX6tRK/QqIAy6zUhnnxB3CvB4y+1x
	aYik98uJDn0XZy2q2IFI1cSbhLLWnRMd/8VM1BSPnzaCNIUE875X8QnogL+w4svtc86y+ywV5aq
	J1g/Ox3GcyfXprxnleP98Ttd59COz8KsqY8NRMM2QEY4XV1zJzo7Y3JaIwVewAPkc7Gh0YmZc4p
	Eo4=
X-Received: by 2002:a17:906:c141:b0:c2d:c247:5400 with SMTP id a640c23a62f3a-c50964372bcmr518656166b.27.1794680822619;
        Sat, 14 Nov 2026 10:27:02 -0800 (PST)
Received: from Desktop.fritz.box ([185.181.130.189])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095a5a78csm240086066b.4.2026.11.14.10.27.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 10:27:02 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	dsahern@kernel.org,
	idosch@nvidia.com,
	willemb@google.com,
	steffen.klassert@secunet.com,
	jiayuan.chen@linux.dev,
	mfleming@cloudflare.com,
	almasrymina@google.com,
	bigeasy@linutronix.de,
	richardbgobert@gmail.com,
	ecree.xilinx@gmail.com,
	bsdhenrymartin@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v5 0/4] ipmr: forward GSO multicast packets
Date: Sat, 14 Nov 2026 19:26:56 +0100
Message-ID: <cover.1794151759.git.julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
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

With fraglist GRO or UDP GRO forwarding on, a routed IPv4 multicast
stream arrives as GSO packets. ipmr_prepare_xmit() drops every DF
aggregate larger than the MTU, and ip_encap() sets no tunnel GSO state,
so a GSO packet sent to a VIFF_TUNNEL vif is dropped during
segmentation. With that state set, a fraglist aggregate reaches
skb_segment_list() with tunnel headers, which can write before the head
of a frag_list member; this also happens today when such a packet is
routed into a tunnel device. Checking the segment length instead of
skb->len relies on skb_gso_transport_seglen(), which counts the inner
UDP header of an encapsulated UDP GSO packet 8 bytes short.

Patch 1 makes room for the tunnel headers in skb_segment_list().
Patch 2 counts the inner UDP header of encapsulated UDP GSO packets.
Patch 3 sets up IPXIP4 GSO state, outer IP IDs and length in ip_encap().
Patch 4 lets DF GSO packets pass when their segments fit the MTU.

Tested in QEMU (KVM, KASAN and lockdep) on veth, 3 runs each on net
(30c71476d842) and with this series: an MFC entry to a plain vif and a
tunnel vif, 40 x 1316-byte datagrams per GSO packet, 4000 datagrams per
arm, UDP_SEGMENT, fraglist GRO and UDP GRO forwarding, DF set and clear,
software and device segmentation on egress:
- net: every DF aggregate dropped on both vifs (FragFails 2 per
  aggregate), and with software segmentation nothing arrives over the
  tunnel vif; fraglist GRO routed into VXLAN reports a KASAN
  slab-out-of-bounds write in skb_segment_list(), then panics.
- this series, all 12 arms: 4000 of 4000 datagrams on the plain vif,
  FragFails 0; on the tunnel vif 4000 of 4000 IPIP packets with unique
  outer IDs with software segmentation, and the 100 GSO packets of 52688
  bytes whole with device segmentation.
- VXLAN with DF, 1404-byte outer segments, route MTU 1400: net forwards
  all 1000 segments at 1404 bytes through ip_forward(); with this series
  none leave, through ip_forward() or the MFC entry, and FragFails
  counts them.
- a GRE GSO packet (skb->encapsulation set) multicast-routed to both
  vifs, 50 packets: all 1000 segments on the plain vif; none on the
  tunnel vif, whose pkt_out stays at 0 (v4 counted 50).
- fraglist GRO routed into VXLAN and IPIP with software segmentation:
  every segment reaches the peer, no KASAN report.

Changes in v5:
- Patch 3: drop an already encapsulated GSO packet in
  ipmr_prepare_xmit() before the route lookup, so the vif does not count
  it, and call iptunnel_handle_offloads() without error handling, since
  skb_cow() leaves no header to unclone (Eric Dumazet, Sashiko). Simon's
  Reviewed-by stays, as this is the change Eric asked for.
- Outer tot_len 0 (Eric): 50 x 1310-byte datagrams merged by UDP GRO
  forwarding make a 65528-byte packet, so the outer header gets tot_len
  0 from iph_set_totlen(); before, htons() truncated it to 12. In 3 runs
  nft ip forward chains still match it with meta l4proto 4 and
  ip protocol 4 (100 of 100), while a netdev egress chain on the output
  device does not match meta l4proto 4 (0 of 100), as
  nft_set_pktinfo_ipv4_validate() takes the length from iph_totlen().
  All 5000 segments reach the peer, with software and device
  segmentation.
- skb_gso_transport_seglen() also leaves out the inner SCTP header of
  an encapsulated SCTP GSO packet (Sashiko on patch 2). That predates
  this series, and multicast routing does not see such packets:
  sctp_v4_addr_valid() and sctp_v4_available() reject multicast
  addresses.
- Rebase onto net.
- v4: https://lore.kernel.org/netdev/cover.1792838740.git.julius@bairaktaris.de/

Changes in v4:
- Add patch 2 (Sashiko).
- Patch 3: drop GSO packets that are already encapsulated, and set the
  outer length with iph_set_totlen() (Sashiko).
- Drop v3 patch 2 (TCP fixed-ID flag on encapsulation): multicast
  routing does not carry TCP, and the flag also needs the decap and
  GRE/UDP segmentation paths, which go to a separate series (Sashiko).
- Rebase onto net.
- v3: https://lore.kernel.org/netdev/cover.1792293419.git.julius@bairaktaris.de/

Changes in v3:
- Patch 1: name the VXLAN out-of-bounds write (Sashiko).
- Add patch 2 (Sashiko).
- Patch 3: reserve one outer IP ID per segment (Sashiko).
- v2: https://lore.kernel.org/netdev/20261011162957.1328474-1-julius@bairaktaris.de/

Changes in v2:
- Add patches 1 and 3; v1 let DF GSO packets reach ip_encap() on tunnel
  vifs, where they were dropped during segmentation (Sashiko).
- Keep the additive MTU comparison and check mtu > encap before
  subtracting, so a route MTU below 20 cannot wrap (Sashiko).
- v1: https://lore.kernel.org/netdev/20261010131842.2157365-1-julius@bairaktaris.de/

I used Claude (Anthropic) to help write these patches.

Julius Bairaktaris (4):
  net: make room for the tunnel header in skb_segment_list()
  net: gso: count the inner UDP header of encapsulated UDP GSO packets
  ipmr: set up GSO state for tunnel vifs
  ipmr: do not drop GSO packets that fit the MTU after segmentation

 net/core/gso.c    |  2 ++
 net/core/skbuff.c |  4 ++++
 net/ipv4/ipmr.c   | 17 ++++++++++++++---
 3 files changed, 20 insertions(+), 3 deletions(-)


base-commit: 30c71476d842b094651bd7712f6c8ee8716147d0
-- 
2.53.0

