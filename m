Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793069450;
	b=I81R76gQTZyLrxwZBHTUkyrgeUrWcaKP0emPaDnisFcw64qPv9TxkOZYbP/UcP74G/+d
	 z4EXCl8Vf07JQHjIaA7mgINqUfzmh8eqVb52EEbykgyAmua4oHR4pR/qKtDO0yCJ9pPfX
	 OSvrj44P/7/HQF3GVkxR7VhI2LbAZsleOmi556TKw704ymqwy1mPlelQfAm69hy+n6xHK
	 3m9r7UERhYPv6JKGAVGUeFwV115FVIZQ1FB7u2JhFnChc58ZuDrEnNL6h2a4pqPllguN+
	 NfojJgSl98NY3vpU8szJ4qSzOET+yG8pGqZjschudiA+BCNQcJACqXBi6Ywtd9PPxDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793069450;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 To:Cc:Message-ID:From:Date:Subject;
	bh=nwvxhmnXB6t4sgo6hu9V2Jlf4bT2M5vvxO5O0RwI+MM=;
	b=pGrJw7BGK+lBnEIopkrFtUkYIENIQMzc5fJOGGa8uB1m25s9iJjgj2ivihQ6EzxwcHNb
	 1C3RGNEAp/9g8f07GcIA5JA1sieGJH154WJs8uzRaFIR9t65xE8+u2kWAphU7e/uW2jCz
	 nt+8/CTj/8MWyFjJhWeLebt4kpt4o5pH7dq2EbOoaesHo9gWk0F6Ww0c9v+Tl/U5ZvFh0
	 /l8/bU+7fK52LawZMLHoD6k0z+ZGl/XMhOYgbFrXWxbMPzGuAqxeBDwjoP+sJWSnZC6y4
	 bJoOmBTfLxv0bJ8Z0kTy7muxtez3SXWhGewPKRhX+pMKSM2npUp0GxXFUAstWRCyThg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bfTRANj6;
	arc=none smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C675606A31F
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 02:50:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C675606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bfTRANj6
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2eac4936dfdso2763485ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 19:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793069449; x=1793674249; darn=vger.kernel.org;
        h=subject:date:from:message-id:cc:to:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nwvxhmnXB6t4sgo6hu9V2Jlf4bT2M5vvxO5O0RwI+MM=;
        b=bfTRANj6MbwQULdQ/ELfwUljfXfPF8SOj74o0/ikT58ngSyLiWLJCgpz36j17otTIb
         puw0wo5N/YLuHpBEMG4a9tq2+25ZSfzf4FapWuKNLJyYT3HUIVzZN1p986Fy+psduqwE
         GcX0KN7Se2+tqr6iK+Zv5VV1eUpVz1nCEmHYGA8wtCxN6GROdZIp9a6oL7kv6ZePjBIj
         j5eCeiDKAx2+15qcwGZjOjQEjRNYLy8IEKEJAAX9nrDG7UT/HhQfm/zQJSNPYUBsH1LJ
         HJ4n1uZ+9yedKykBVShDiJlJTr9e76nj9SanFVKQiY4BWfIk1MEW/13/545aNRJH95Kc
         zSiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793069449; x=1793674249;
        h=subject:date:from:message-id:cc:to:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nwvxhmnXB6t4sgo6hu9V2Jlf4bT2M5vvxO5O0RwI+MM=;
        b=xssb6AYE06wskzFFMeeLy0C8mrcq8Vtr2QvR4hTJRRPWB5HBe6Dli80ejC/SvLNgFF
         438aoICKcEsH71eRhYWqZCPVKsoQcphsmgofkLi7wLy98CZ2RJxxk5JyFLWSWW5QrSUQ
         IkpPjiSLRqgvd95yVrgtAgVnd67QgHu9YEQNLdBgbkdBCxh2MMaUW3y6olXCA7m7CtH9
         UjWx3rDUC5imPqZk/Iq0ddFSnCxMZFymTA0AM9Sn8sOpkhAofKKONfBAOBwmlGnMvfHT
         UhAXQl6SHMlW+LlGgGU8Uqk35RyX4DOXuYWvP/qstPB1Lwn1t/ZnYy9v5zNRHZfFhjf7
         DCgg==
X-Forwarded-Encrypted: i=1; AKwUvBzIBCYvdicchHe7T1vpkFlDT+MjBvTuBxEKqlHwYLtlSg8kzELngCmnWqbCmEzR4f6fBYi8jdFeNPcSU94=@vger.kernel.org
X-Gm-Message-State: AFq9FYJtLRLtTQMsNvNdZB5Xuz7UJ5+QJLtwGZxzIQLEamk5m5hJG3vN
	ogLj2U0j8peiwGxYofEPNS14WC89wkGd09bWJXRpI68aP2mZrfE7O95Y
X-Gm-Gg: AYBFou33D75rD6cvrJT+8t0SmYOT8LEHfh6P19qV9XyIgCGlulSwz4Fs9f9DG8Sx2Yw
	G1hNtc626b3c3Zh0KfLOkOReUMszl0LrNiPjKDwFw9V2zh9livdiirPG+MZyUcXYO4Eq2D35SAN
	2qfJYt5h/8bjyqZrexhE7qGuaIEwAKpo4O6QUqfOoEb9a2AHhOkQEgyjhSf0SQMjBl7xA/A/Xsg
	lMRMfAJ2NvVBPk4EwO5iemB083LewB4mnlHZ2mbH9l54NKqWIRvrqSBY8khs5gB6rlbBzqA7UxH
	uEQ+GlH+NEzOHTmhTVCeNKnBYNM08M8sfy7nIZ7iA5uhLjJTJEqCEQSHgXtCHo/G0YOEEFyaVGh
	m9nlIEE/L1uhHHyXrPwJJUdfInpPsmWjeDXHqlie9/8oH96y4+dCwZwhnOmL6N9v04nKzMTcrtU
	YtY6viDBnbrw30eEPSx7plmf0G/SL9gSKRAJIea+0QFbBW+97CxGzmWAX0AEsyei3OlYyu/yxpW
	ZQTmLI+IZb+m8M5B0vHtv4M3Y27FhD3C0CdiHlV6GBA3zSTwZEo0tSK20hbRlkFFF6a2ZuqW8zr
	E4M9Jr94DZicT95LMy86xv0=
X-Received: by 2002:a17:903:3248:b0:2e9:5714:607a with SMTP id d9443c01a7336-2ea9c59c232mr115870105ad.2.1793069448537;
        Mon, 26 Oct 2026 19:50:48 -0700 (PDT)
Received: from msg ([188.253.120.77])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6ca09casm2243615ad.67.2026.10.26.19.50.42
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 26 Oct 2026 19:50:47 -0700 (PDT)
To: netdev@vger.kernel.org
Cc: steffen.klassert@secunet.com,
	chopps@labn.net,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	dsahern@kernel.org,
	idosch@nvidia.com,
	linux-kernel@vger.kernel.org
Message-ID: <20261027105031.19928-1-q.h.hack.winter@gmail.com>
From: Qihang <q.h.hack.winter@gmail.com>
Date: Tue, 27 Oct 2026 10:08:47 +0800
Subject: [PATCH net v7 0/3] xfrm: fix vti tunnel device use-after-free across async crypto resumption
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

This replaces the earlier vti/vti6 series and the reference-transfer
rework.

vti_input() and vti6_input_proto() cache the tunnel pointer in the skb
control buffer without taking a reference. With async crypto, the
receive callback runs from crypto completion and may run after the
tunnel device has been torn down, causing a use-after-free when the
callback dereferences the cached tunnel.

The input hook takes a reference on the tunnel device when caching the
tunnel. A successful receive callback leaves the cached tunnel in place;
xfrm_input() releases the reference on every exit, including after
delivery and on drop paths. The error callback only updates the error
counters, so the common drop path releases the tunnel reference after
the skb has been freed. IPTFS, which can free or consume the outer skb
itself, releases the reference through xfrm_input_drop() or
xfrm_input_consume().

Patch 3 relies on the first two patches: the receive callback must run
before the async skb->dev reference is dropped, and the address family
must be available on the early invalid-state drop path.

The issue was found by source audit of the VTI input path (LLM-assisted
review): the tunnel pointer cached in the skb control buffer is
dereferenced by the receive callback, which with async crypto can run
after the device has been torn down, and nothing keeps the device alive
across that window.  It was confirmed with a KASAN reproducer on arm64
(async ESP; deleting the VTI device inside the crypto window gives
"slab-use-after-free in vti_rcv_cb").

Changes since v6:
- patch 1 also drops the skb->dev reference that is held across an async
  resumption only after gro_cells_receive() in the decaps success exit;
  that exit still used skb->dev after the reference was dropped (found
  by the netdev AI review).
- patch 3 now carries a Fixes: tag for the pre-existing IPTFS leak that
  the queued-skb drop also fixes, and the description mentions it.

Changes since v5:
- cover letter only: record how the issue was found.

Changes since v4:
- IPTFS: when an inner packet fails validation, __input_process_payload()
  can reach the drop path before the inner packets queued for delivery
  are sent. Drop those queued packets as well so the outer skb's tunnel
  device reference is not leaked (found by the Sashiko review of v4 3/3).

Changes since v3:
- the cached pointer is always a tunnel; the address family selects its
  type, and a non-NULL tunnel slot denotes one held device reference
- xfrm_input() takes the tunnel device out of the skb before
  gro_cells_receive()/transport_finish(), which may consume the skb
- the device reference is dropped only after the skb has been freed,
  including on error paths
- IPTFS passes the state's address family explicitly instead of
  inferring it from the secpath; consumed skbs keep consume_skb()
  semantics and drop paths keep their skb drop reason
- drop the xfrmi changes: it re-looks up the interface and does not
  participate in the reference transfer
- merge the reference and IPTFS changes into one patch so the series
  remains bisectable
- the gro_cells NAPI window is pre-existing and is documented, not
  changed

Runtime testing (aarch64 QEMU; KASAN for UAF detection):
- VTI async success and error: RTM_DELLINK completes without a KASAN
  report; the unfixed tree reports slab-use-after-free in vti_rcv_cb.
- Async resume with the SA deleted during the crypto window: the
  reference is released and the device is removed; with patch 2
  reverted, xfrm_input_take_tunnel_dev() warns and
  unregister_netdevice() waits for vti0.
- IPTFS outer-skb free: RTM_DELLINK completes; with the
  !first_skb xfrm_input_drop() reverted to kfree_skb(), the reference
  leaks and unregister_netdevice() waits for vti0.
- IPTFS aggregated payload with a valid first inner packet followed by
  an inner packet with an invalid IPv4 header length: RTM_DELLINK
  completes; without the sublist drain, the tunnel device reference
  leaks and unregister_netdevice() waits for vti0 (Usage count = 2).

The IPTFS timer/reorder/state-teardown paths are covered by code audit,
not by dedicated runtime triggers.

Previous versions:
  https://lore.kernel.org/netdev/20261022032129.16118-1-q.h.hack.winter@gmail.com/ (v6)
  https://lore.kernel.org/netdev/20261019153247.89957-1-q.h.hack.winter@gmail.com/ (v5)
  https://lore.kernel.org/netdev/20261018090638.55686-1-q.h.hack.winter@gmail.com/ (v4)
  https://lore.kernel.org/netdev/20261013074610.17808-1-q.h.hack.winter@gmail.com/ (v2)
  https://lore.kernel.org/netdev/20260930090813.73901-1-q.h.hack.winter@gmail.com/ (v1)


Qihang (3):
  xfrm: use skb->dev before dropping the reference held across async
  xfrm: set the address family before the early invalid-state drop
  xfrm: hold the tunnel device reference across the input path

 net/ipv4/ip_vti.c      |  3 ++
 net/ipv6/ip6_vti.c     |  2 ++
 net/ipv6/xfrm6_input.c |  3 ++
 net/xfrm/xfrm_inout.h  |  4 +++
 net/xfrm/xfrm_input.c  | 72 +++++++++++++++++++++++++++++++++++++++----
 net/xfrm/xfrm_iptfs.c  | 42 ++++++++++++++++++++++--------
 6 files changed, 106 insertions(+), 20 deletions(-)

-- 
2.54.0 (Apple Git-157)


