Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2582F348C4C
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 16:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791736204; cv=none; b=D/L7A/+pXDKMTBiXWYyc1D5pT9WNemerg55CNxKlB0Ok9XhP093DEm1JCbsa6E1fzwVJI4BWQhgpdiDBxhjN9otmD6fKDCL4RvKMdF887qHjsZcryF7CkjdxycCqHYF3MORWpL1vXZ0Q5rfhv+8jLOnsomJTNuvlJuyBL1pcgi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791736204; c=relaxed/simple;
	bh=Ge1DtqAvy5tUaQE5gcwQLXUBT2zAJvrbfwuwvAHjE+4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KI4uHm1pVeWtgVV3hxNnj4spe9h9LdZDbuMBnblFHEjHRugKuiq33PwnWTKzlkD+BNY4R2mQlzbnpWvgXpTKoMXbp0BRsIqi03ZNqzbtZJwTOP7LdZyu4A/8HSilbrR5Ntg6UiG1KunP8Tl2hQ6BbzQ42NT647HhizO6k2+Nsfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de; spf=pass smtp.mailfrom=bairaktaris.de; dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b=y+22YhOk; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b="y+22YhOk"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48c5358fc28so816026f8f.0
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 09:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1791736201; x=1792341001; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/pxtRzJxw02uRFUZyLdxz9zdH/EhKXXiP2uIdjIYinA=;
        b=y+22YhOkH2EyGNxBUzPHiGK/+AKw5D1Gp9M5zZpCoWr4Jok4TXOuaM1T0+o0cjnKLf
         3Zt7uhtl4WC8OBEHXHqRL68qvbwUNb1IIBs8urJswYw83Cd/ejsp/aGr5UEdhqbSnOTD
         Farm4OEW4gEv14NVhYioxHmRydROiRacvbU6nxrUoCXgJpuNqXjpckMQA6+L3XhHTOdi
         QfUwu9N+lbSJnOfoMRxKYkbDlkq3y5GnbJo2hk8SVEQHzQ6SFfg7V65bA4X/IYSeoZqF
         dhCzJqQh0SFZOoN3TokFBerh8QvqIR/je8dixxWgWprx7SysUu2m1Z+rMviRVnNpf5RH
         NK1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791736201; x=1792341001;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/pxtRzJxw02uRFUZyLdxz9zdH/EhKXXiP2uIdjIYinA=;
        b=FCmC50TzSi2h042J+40IuL2ZGbquspW9K50OocQIqfuR0NsT4WRBphVO2Axc4qt8cf
         tH0ItALUACUAwtPMTdTIR6p2P5DMLFpmMfS0jRKzCMeyYzmXhflQqziwq9DfQTvq6ARC
         nZwygN0vFgPXy7a6pPWh+OiyievowPDiB2Qe1Bs+uk+hkMoFUhD28SzkAnPILuLsRpgB
         mbNkyYt1jtfMhEg9kS6820deely1BB6jbOySO0QK2CG1t7ZYmr5ap8e+qoMczqqBmcsq
         7VS7KNZjjuoh9EpdVYSc/EHDSHS7Y3aW6J5CvTdyHlNXwNtvxxQPsHKF3hLh66M/j5zC
         tl2w==
X-Forwarded-Encrypted: i=1; AKwUvBzOSs94hW93RSx2vLJJSum+zdgA0KYQ2yVL/JEksWBCE06w2Liho3XsIw7mmsyCU6CkmPUTGsJSI6ZraAs=@vger.kernel.org
X-Gm-Message-State: AFq9FYLY12ZHFS8uvNOPKFQMKytPeuQsxa8Z3NqT6CN1WGnMbtGgNbPB
	Yk4ojfg+iTGS//ZLLkI8/3u43JXaf/7Mfo4MA1NZyP903z003BZksQWRkYDt9Dbstg==
X-Gm-Gg: AYBFou2QEbfZ6vAiwyfVMKNsZFVSN3Qo78yPbGnxmHWqAld/mz4FX6y/lISsSNFXSWH
	CaDiEuo16Qz//RH6jLp8Q52S9oJjYEUtkbEUGUkspgTdc4Qt9Fd02oiZIc5iKZq+q1YhpXz3Cwr
	Ei2iMcUrgpQtwVA97wTTR9OgycJFBqpoUGq8FFrI2FuPBJzMm/HfzzSIb80lSezTY8RnJtfETiY
	59/bGi8nmVs/v57+pCvcxs5V1fQpeOQj9cOwddxWfSWzZices6lgADlX3mP54lnUb8XjWcqivYI
	h7ZUFE09i9mqU1vpKZyCIAhzSEQ17Z4fd86hnPY00gEhaR2xCwOrcmVZVNbbCyccHgadBtCHzV9
	7tw1g4zInVYKvUYxjTNkWoEbnzJx6RTOISrqHI2XYhbBUVLaulM0VScY/oH+y08GhhIaBXEnc4z
	Kb+lYdTYWc2WJD53V3YuMmgohV064HxuFvEqlnGLGDKnP5PekkFpODlOgyP9RyxyAHfkUPAOrnq
	GFclyzLb3q17Upx1LCJDt8UIgn1eazwf2wtvSoTyAR23JH7B0RrFcOlGY8fzybuF5V8iQqIkUph
	XlDF8xMRDbSujEhFyJEb3jI67DoyBK6rI4WtrxutPkyLDHn0O9v4wfAuDDVlFqfmnrqloUKIgTt
	xUyxMxNsEnGrTPuiDiPOcz0etfQuX55Euhb7h9HUt5BCP4loK00Bp6O+cqs195C8r3j97W9X6Rm
	r/I/Lqvh19JIgKJHEdc8B/k7We22wzG5W7vnrZBxzOaDNUgxEO
X-Received: by 2002:a05:6000:144d:b0:48d:cb76:548f with SMTP id ffacd0b85a97d-48dcb76550bmr4567850f8f.38.1791736201025;
        Sun, 11 Oct 2026 09:30:01 -0700 (PDT)
Received: from Desktop.vpn.uni-hamburg.de (dhcp-40-52.vpn.uni-hamburg.de. [134.100.40.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9acc936sm14657920f8f.44.2026.10.11.09.29.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 09:30:00 -0700 (PDT)
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
	linux-kernel@vger.kernel.org
Subject: [PATCH net v2 0/3] ipmr: forward GSO multicast packets
Date: Sun, 11 Oct 2026 18:29:54 +0200
Message-ID: <20261011162957.1328474-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With fraglist GRO or UDP GRO forwarding on, a routed IPv4 multicast
stream arrives as GSO packets. ipmr_prepare_xmit() drops every DF
aggregate larger than the MTU, and a GSO packet sent to a VIFF_TUNNEL
vif is dropped during segmentation because ip_encap() sets no tunnel
GSO state. Once ip_encap() sets it, a fraglist aggregate reaches
skb_segment_list() with tunnel headers, which can push a frag_list
member below its head. The same panic happens today with a fraglist
aggregate routed into an ipip device.

Patch 1 makes room for the tunnel headers in skb_segment_list().
Patch 2 sets up IPXIP4 GSO state in ip_encap().
Patch 3 lets DF GSO packets pass when their segments fit the MTU,
leaving room for the outer header on tunnel vifs.

Tested in netns on veth, MFC entry to a plain vif and a tunnel vif,
software segmentation on egress, 4000 1316-byte datagrams per run, n=3
per arm, fraglist GRO, UDP GRO forwarding and UDP_SEGMENT, DF set and
clear:
- net (af32da41b032): DF aggregates dropped on both vifs (FragFails),
  non-DF aggregates dropped on the tunnel vif (tx_dropped); fraglist
  into an ipip device panics in skb_segment_list().
- v1: DF aggregates dropped on the tunnel vif (tx_dropped).
- this series: all 4000 delivered on both vifs, FragFails 0, no tx
  drops, no panic; ipip device 4000 of 4000.

Changes in v2:
- Add patches 1 and 2; v1 let DF GSO packets reach ip_encap() on tunnel
  vifs, where they were dropped during segmentation (Sashiko).
- Keep the additive MTU comparison and check mtu > encap before
  subtracting, so a route MTU below 20 cannot wrap (Sashiko).
- v1: https://lore.kernel.org/netdev/20261010131842.2157365-1-julius@bairaktaris.de/

Julius Bairaktaris (3):
  net: make room for the tunnel header in skb_segment_list()
  ipmr: set up GSO state for tunnel vifs
  ipmr: do not drop GSO packets that fit the MTU after segmentation

 net/core/skbuff.c |  4 ++++
 net/ipv4/ipmr.c   | 21 ++++++++++++++++-----
 2 files changed, 20 insertions(+), 5 deletions(-)

-- 
2.53.0

