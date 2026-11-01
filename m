Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793551355;
	b=FxfYAlI794HdIy4ohEJoze6q8b18mXlOFKj3PQrDBYCgvEZiyjGu25or+ZDxUN5ZXCGU
	 Dr8VzIJ85r0UYPdu7KbkIiBabTS+sbz1Ig+2ZOuS6SZ7Q0eX/fO3Uvw44qqICDEMiSz+X
	 WIR+onLYheUEHHixrxRb1N3WRAIX6lH9cQx9wcJSCeIFsvz/nJrP3p6M7BOVIlH7nI82f
	 mSXgUCL1L9RvsA9Xou4LbOdSHxSYaimy3P2neYHXbdbmZHcynhT5aj90WziUBpLmtKORp
	 iSeVxi4q2mhHT+df66CVe9Vd1ADJY4Jt9k0Y/ZZG2MY9auLlPqpA2VELulmW/S8fTdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793551355;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=+GJ4llxO6J68sBfyk15mNFM6CNay8BlVU8uhm4hMFEA=;
	b=XHbf18Bt10l/4OYVJezEoLh8YTrPhDc7ok7O/YLHm/94Q+hOFckML+FlNrAzThfsM5KD
	 pJ1ItYvemmovW/JP/aD6aWLBVsePOek2Sw0/U4YNrGYKa0dHXDyRKeHOWiK72F1Fs9DRv
	 fHyv7MPnnveqlcaiyQHp/3R6BEmNkXEGeVB8ie+1X1k5GaICCXnjYgLUJqLYCLI8FHvxQ
	 hsqCnPDc/zxntJ4hc6eVKfonHSaEb8Bt2y1cULRxXmmUVh1nDsnH6xUbOduO1QvyNOSOM
	 qt3zydBofCNBU5D+FfJdh3IZWNpOPAo4hgpT/8nmHFKnvnZBFIF0ZrrQP8BohoDWcIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=vooLOtcl;
	arc=none smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C95A606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 16:42:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C95A606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=vooLOtcl
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b3dd83e779so3937375a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 08:42:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1793551353; x=1794156153; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+GJ4llxO6J68sBfyk15mNFM6CNay8BlVU8uhm4hMFEA=;
        b=vooLOtcl/MroA0vTqzDzgdI0Ti/cJtZJvuLNrt+rtfgph9jLeZcjxZM2SsY2aT4ztK
         7Lpk3X78Ng/R5jpue5sDUvfagpGmhqEZBN6BDlcySL8f3yDobuE89dMtHFJOv7n55EHf
         GVGzuElUpywUwIaTo3bJZ98SEZ2azZOMCmmJ0dKdHYRaOvRFcbRgLDnVieWY1AcatgFc
         tGDb8FjDP0LkwxwKdbJ0V/nxJW4kFXZ8xatEG82feCCvjJmWfzh+VoXc59h7azwJ4iH2
         7TG58gOlsyUGcQYssagb2OtUwNsw3f1uQChgwJSuFfZ4MCsJxroXdGCXqgPBYYCkuv7u
         dZxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793551353; x=1794156153;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+GJ4llxO6J68sBfyk15mNFM6CNay8BlVU8uhm4hMFEA=;
        b=j/Wzff3f9mYbfzbpybH8dV1H94FhVka4cr30yXvYTdsks7TWwJxEg+3itlbQlYJQwK
         2+sXhqbyHpAMZd/aHXxJjRAr/hjSJ/b763PTz9979hKpZsFMBfq0BNgOFNSaodKaiv4J
         VXRAGALK0FwMJ+AN96skenDVVsXGxZYjrxc+xhKgIN0rrkbKMnT8eDhLoiFW/sdSdovt
         Xq9W000BYgK+07pLYj+6nNv1g/QCnblLWcUHHjHWzUi1TEdDKdAF7+PliMZy9NUMD6S2
         EaRWZiGFKaQ5dan1V5n9KKNAjGDPAIP7Z5wEK7pXJUg7OM5055aOAJnMjBIBZgm09Pkb
         VUXQ==
X-Forwarded-Encrypted: i=1; AKwUvBw9EHG94NDaXd5lLINq1+jh4NyZDyk+dbsNVc75SE06ITK6vN+vhcpHFxMVnF6sURbQ/7WSi/IeVFsfkvE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJhbVfWTL22LcIehlJv6gx8ibEX27wBXCWadUSZ0NfAMP71aphv
	mNRqL9EMLXhyn27ix8PmpmK+urbdS9wOx75QNsKFtIEdpKkhl3608Yw9clPGu03XtHAaByZG5Ly
	yafqFHO6O
X-Gm-Gg: AYBFou1aJnjk8rfyfXFyhXDGkDjMx992fucugKNZB+Bglg7th1xU8XFX7Sdkldy/mq6
	t30pRu6xr28EyUwf7cR2xCLXahYqW9iH6QinRC/pZK/RcEpCJ/tuKY8qEtVNBx9l7mzjuVlmfXt
	0QZLVx4GL4ey7E4zcF86ZeCyFD+da1CUd62quOcD9Rq5LL9FYQO7tr8Hec5jA15JlvNGoEQXEaD
	GH4qUV+lUsYsCmR6n0N5zlgmz3BzMUGtj5VIZSuk/RQwca6Iuhf5wv5/PZL5jI7FTi77En4fKOR
	7K+jONANJHEp7hOs4X7s4yS7D9k3IOgxgtp/iu7OI08H6dahOgyMN7+OUlLLpZtfGej6tFrs0R2
	7dDb5WqwVlun1WGPKljOTQrfvDvTAq+3KboE+CVgk/TBLJ5EUketPAxPBsqgQoX8LB2/zobyG7I
	tyDGUYiI5veXoadbbMQc7PP8p0fTUwU4QJU5ywQWWB3lFQKEhBRxc9S/A46e5LxzNKOgQz6fBxU
	2FfCweeJw4byi7AOigwGKL/PPdtf+UFGfaOH883jScYoznOyzMeA+i9NtZFzS7OCrpkuDEnxQPs
	tufGUNhSvWCWjiJZYS4Ys/QzSwFdb/NnY53Tuar1n9NxbX8XZJfndNNzK+QzyN+YpQsKQdvtl7f
	UFblbJJSA9rPEI4p/uo9BX/7qwLzyNYwjoiOvPch31QLWR0GjhjpRjTio7oBg28QZp3yMgN6myn
	S8WsEdGAhgQigmnhkahijIwlrO4PtDJbalVBk0BblPKLOcLoaBq5LoJ7sS5jmPvM0FDQoJlvhJY
	XHoUQTbSVEf1ZsEDfFpiuwqNqZXAVArpeQxeWLcNtMpPS6HFJFG+TPjb8u6GnOlwmGQNJxw/dFn
	LupfNoTzWp1sjh3GpY4pXV+TobXI14K93tBhW0m8
X-Received: by 2002:a17:907:160f:b0:c49:a539:aa45 with SMTP id a640c23a62f3a-c4ca7ac0de2mr634290566b.42.1793551353378;
        Sun, 01 Nov 2026 08:42:33 -0800 (PST)
Received: from Desktop (p54aff88b.dip0.t-ipconnect.de. [84.175.248.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabe0f37esm296622966b.33.2026.11.01.08.42.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 08:42:32 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: netdev@vger.kernel.org
Cc: dsahern@kernel.org,
	idosch@nvidia.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	steffen.klassert@secunet.com,
	willemb@google.com,
	jiayuan.chen@linux.dev,
	mfleming@cloudflare.com,
	almasrymina@google.com,
	bigeasy@linutronix.de,
	richardbgobert@gmail.com,
	ecree.xilinx@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v4 0/4] ipmr: forward GSO multicast packets
Date: Sun,  1 Nov 2026 17:42:28 +0100
Message-ID: <cover.1792838740.git.julius@bairaktaris.de>
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

Tested in QEMU (KASAN) on veth, one run per arm: an MFC entry to a plain
vif and a tunnel vif, 40 x 1316-byte datagrams per GSO packet, 4000
datagrams per arm, UDP_SEGMENT, fraglist GRO and UDP GRO forwarding, DF
set and clear, software and device segmentation on egress:
- net (7076f684d513): every DF aggregate dropped on both vifs (FragFails
  2 per aggregate), and with software segmentation nothing arrives over
  the tunnel vif; fraglist GRO routed into VXLAN reports a KASAN
  slab-out-of-bounds write in skb_segment_list(), then panics.
- this series, all 12 arms: 4000 of 4000 datagrams on the plain vif,
  FragFails 0; on the tunnel vif 4000 of 4000 IPIP packets with unique
  outer IDs with software segmentation, and the 100 GSO packets of 52688
  bytes whole with device segmentation.
- VXLAN with DF, 1404-byte outer segments, route MTU 1400: net and this
  series without patch 2 forward all 1000 segments at 1404 bytes through
  ip_forward(), and the series without patch 2 also through the MFC
  entry; with patch 2 none leave and FragFails counts them.
- a GRE GSO packet (skb->encapsulation set) multicast-routed to both
  vifs: all 1000 segments on the plain vif, none on the tunnel vif.
- fraglist GRO routed into VXLAN and IPIP with software segmentation:
  every segment reaches the peer, no KASAN report.

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
 net/ipv4/ipmr.c   | 29 ++++++++++++++++++++++-------
 3 files changed, 28 insertions(+), 7 deletions(-)


base-commit: 7076f684d5132e6a6145e1da2fa74771ecd052e5
-- 
2.53.0

