Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C263D25AD
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 09:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792314407; cv=none; b=FD0t0ch2fMQo6sBIJix+6DN0cyECnvj/ue3gqhFJGAkxEMbkMbOx/HF1lE/bPs/GEuYgx11b2CLm9hkIFRSX8iIM8va3u/ATHpxn5SKVzgjG8IQkw6+FZQ93fx8mWn65njvZX2Zq0Ck+Nzv28riBBvnb9s8IEi1ML4DRqgJSMZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792314407; c=relaxed/simple;
	bh=S4WKD2aYHcIJH4cVj74AaLH+NGadEsqP/fj+C7Oow+s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ICP6n9S2HgV73S5XE28y7leaFRnjdQTkAazIEkbOzzH5m/TriRvtDRvBmjvzaaosvvKhyX62bzr/V3Mh0gEvZGFld6488xwspmFkFH0sSCqm9qsNkMvoz+YkNQWfNidAVvJqxUlmyK6B/B56KCrLIq7kQFuEKDv2m0r5kaV8saY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TM7q8MQF; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TM7q8MQF"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3ab2cb02816so187874a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 02:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792314406; x=1792919206; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TVLHsdZOGUdB7hYzL6avssJ0uN7VSZZ15QHDi5kS+Rk=;
        b=TM7q8MQFHllndXizixkC2jOrTqKshVMzuzIfmyOeB4TLgCmUuZ7gwIWUFcfPLBKjhu
         noOUScekNgSfZna4hI9kFlv4Q4gGiJIgTt/V5wmGF+/k6lowLE6o7Ipbe7jUfLh3YfVb
         tVQ0PjIsXx/xAXuvLaVyUsFw03UwuEHHRlxSHrKFVx60OGlSqv0mIgobqhBKn0RfDAqu
         qC3NpHd0Pfe6ONHLrszDedxuzXLTMfXUvaUvaYh8PxfzFNBwkA0lml/7o2wf45gEKtYY
         IC2hp0WMBytS5K5NKpkYDS/6xMp5rt1lAzjqvo18Yto4u0EBpensnfluptCMxUKyUbXG
         NOsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792314406; x=1792919206;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TVLHsdZOGUdB7hYzL6avssJ0uN7VSZZ15QHDi5kS+Rk=;
        b=sXuy3Y4c0a4/bl3fc4x7P18HQFpgqumGQF2dbpp4f/3dPCBZrhcTbx7Bv7jR7Jo2Gw
         ljXw2XXt0EmVEKfxN2c8CWmI6K0q2KRmXUWkdVybFIzutJxlcBy2KRFvesH6vjBuXuir
         lO12CPNzajMUIFTZ9SzDIoaVo/V7BmXGFkj6Nsbw23NnlwE/+qJzypLG9SFkVIib0CiS
         VvfgdQxnBW7gB3rVDE6v08CGZB3pjC/OTltQGXJ8RZOe/48aptL+2yQDf/Hv8VK9tx9/
         AwnGuuv0zDXws94IQM/WP+Br3jNOMtolYwDpthNAKqS4g4Cdh3kL4bVpzkJAjy1yQW3d
         /p5Q==
X-Forwarded-Encrypted: i=1; AKwUvBwxQqiRPPF6BUXzLvIO7SXRMybVHACu85mu7qsmaUv1Jqq9S97LCZ9k5JoWcSwTvnidA9XanYhMKd17umA=@vger.kernel.org
X-Gm-Message-State: AFq9FYI5DcxFxcdIVvGGZ5METs6iptztL6Xhpe80mVIDJlIFRY8qAtQY
	q031H36ue6bK5KkM1DQXlVhUKijRN60Oelgdu8fji4fg32fpbntTQWw3puQiVg==
X-Gm-Gg: AYBFou2sP0rrqhmYTwY0ef5h/Y2Y+IyiK6CCxM/vGRmbIBqMgqxDJ7DvBoGvE95E7x6
	v+03GtMOX0QGEIKmwLeZz2lgEgKR2njKVJupNFqds0rUpfQ+aAVI1sWN3LCq/chygggfEwhsPLA
	VcL2yB5lpzdQX8H3dA9WfVzA8dDKtwYXZS7n9loEBXMpu1ju9KnvU7VC3qBuHG/XYae8/XhdKRe
	trPYbJgAp0GcduMRDn5wYRCTSBa6U0PVtzGc/ops6+BD+jrqLOUylfFIcyWYuj4VtXDmkUmC5XL
	FkQ6tTyFlR/6hL8YY3W8Rke8+6W6Ww10/BUtOD97BA+2fUjXCUij2sheK0vfoiFXTsatZAy4iAK
	/L8vfO0RcxH9k7GE0941brnqW95n0b1muQXzbIDuMo/BHYpxp4Y68JxQwbqhWcA9JXbwDmWxdH9
	2mZBafo5BlfjN5X08DUMtyO4UAK9qzpE9+Euzy3El/+tnUWwBJYYK7Z+e2CxhmP/6FvQ67ZTnxF
	93uHIWX/RmYLlbqlXKwh5vrvORQ2Rvk6MxXY7hmjnfhCxDRwS4vLYq+LR/odmHFoQE=
X-Received: by 2002:a17:90b:1a87:b0:3a6:e1d1:e511 with SMTP id 98e67ed59e1d1-3aceec3d0c4mr6800762a91.4.1792314405637;
        Sun, 18 Oct 2026 02:06:45 -0700 (PDT)
Received: from localhost.localdomain ([113.102.237.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac947928b4sm15580675a91.11.2026.10.18.02.06.42
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 18 Oct 2026 02:06:45 -0700 (PDT)
From: Qihang <q.h.hack.winter@gmail.com>
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
Subject: [PATCH net v4 0/3] xfrm: fix vti tunnel device use-after-free across async crypto resumption
Date: Sun, 18 Oct 2026 17:06:35 +0800
Message-ID: <20261018090638.55686-1-q.h.hack.winter@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This replaces the v1/v2 vti/vti6 series and the earlier reference-transfer
rework.

vti_input() and vti6_input_proto() cache the tunnel pointer in the skb
control buffer without taking a reference.  With async crypto the
receive callback runs from the crypto completion, after a possible
device teardown, and dereferences the freed tunnel device.

The input hook takes a reference on the tunnel device when it caches
the tunnel.  A successful receive callback leaves the cached tunnel in
place; xfrm_input() releases the reference on every exit, including
after delivery and on the drop paths.  The error callback only updates
the counters, so the common drop path releases the reference after the
skb has been freed.  IPTFS, which frees the outer skb itself, releases
it through xfrm_input_drop()/xfrm_input_consume().

Patch 3 depends on the first two: it releases the tunnel reference from
the drop path, which needs the receive callback ordering and the address
family set up by patches 1 and 2.

Changes since v3:
- the cached pointer is always a tunnel; the address family selects its
  type, and a non-NULL slot means one device reference is held, so a
  nested or pre-installed tunnel device cannot leak it
- xfrm_input() takes the device out of the skb before
  gro_cells_receive()/transport_finish(), which may consume the skb
- the device reference is dropped only after the skb has been freed,
  including on the error path
- IPTFS passes the state's address family explicitly instead of
  inferring it from the secpath; the consumed skb keeps consume_skb()
  semantics and the drop paths keep their skb drop reason
- drop the xfrmi changes: it re-looks-up the interface and does not
  take part in the reference transfer
- merge the reference and IPTFS changes into one patch so the series
  stays bisectable
- the gro_cells NAPI window is pre-existing and is documented, not
  changed

Runtime evidence (KASAN, aarch64 QEMU):
- VTI async success and error: RTM_DELLINK completes without a KASAN
  report; the unfixed tree reports slab-use-after-free in vti_rcv_cb.
- Async resume with the SA deleted in the crypto window: the reference
  is released and the device is removed; with patch 2 reverted,
  xfrm_input_take_tunnel_dev() warns and unregister_netdevice() waits
  for vti0.
- IPTFS outer-skb free: RTM_DELLINK completes; with the !first_skb
  xfrm_input_drop() reverted to kfree_skb(), the reference leaks and
  unregister_netdevice() waits for vti0.
The IPTFS timer/reorder/state-teardown paths are covered by code audit,
not by a runtime trigger.

Previous versions:
  https://lore.kernel.org/netdev/20261013074610.17808-1-q.h.hack.winter@gmail.com/ (v2)
  https://lore.kernel.org/netdev/20260930090813.73901-1-q.h.hack.winter@gmail.com/ (v1)

Qihang


Qihang (3):
  xfrm: run the receive callback before dropping the skb->dev reference
  xfrm: set the address family before the early invalid-state drop
  xfrm: hold the tunnel device reference across the input path

 net/ipv4/ip_vti.c      |  3 ++
 net/ipv6/ip6_vti.c     |  4 +++
 net/ipv6/xfrm6_input.c |  3 ++
 net/xfrm/xfrm_inout.h  |  4 +++
 net/xfrm/xfrm_input.c  | 74 +++++++++++++++++++++++++++++++++++++++---
 net/xfrm/xfrm_iptfs.c  | 25 +++++++++-----
 6 files changed, 99 insertions(+), 14 deletions(-)

-- 
2.54.0 (Apple Git-157)

