Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 262C43DCDA4
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 05:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791524456; cv=none; b=qV0DsjM7ZUahI+tPpqAiyEX4jB/Nwt7ysEUxRtzvQVCm6gkdMhvb2i1vgtJraS1BuepupO23yC9ah8X4+0cUmxCSOcOUKaUm4gypSKGldh6LnPGIAc+J6/pYeedPWpDNtBjlbYh1CpyKhokvib8yBQI+/mCNs/IHF4El8YRfyQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791524456; c=relaxed/simple;
	bh=HnB57wgD3GFiYI3A8kNtqpj2zQ6URRPxoqjg9tTokok=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uYR51GGlnNB9DIIKwbijIXYFzrjkSZuZwa27bs+7DPHvjMWT87Bok1e8ACnQPc8zgtPmFe9V5gfOkSCXMYplduTPzfCwGJd8k4Gt5uSjmkvrDjT1nTQCej5zHygoSddsLyeqh2kawQo23EgeEFr4KsNiH9DHCyrEtMtbcQ6lxCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l00VCcxi; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l00VCcxi"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3ab3260b35dso310910a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 22:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791524453; x=1792129253; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=w+4kAAJ3Fw9J4WUA2k2oRC3BjB3Bj1YsgSFYbXXKqEM=;
        b=l00VCcxiWhQpi5que07Q0W3yGNo8szkB2tQaZHf8S4HPl8CM7raK9U0kkHuZ72mTWZ
         L0AelV66X03VtLkjqk8ib+qiNK9c+JZrqkYS6kRgoMmHBZJRvJuCBM3Vrt741i4697wI
         OJYoh4ij5K6EwgyNzwXAM1AC0H0fws07V6B7qkM2y/aufVQ6fxyvqrJ2OV3ccKU87vHe
         4NNLF2M06R6JZ0d3Gtx/XUM76vxyYyUaV34MWLpHWa1VwuiB6JhdXos3vczJD7Y+Ovi7
         /AosKo+NyorA9ZgXi3+ZTMoZzMKzIxo3u4mhLgHXV/GuvhzAxXJBeMqwvmFrsOSYYvcI
         s7LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791524453; x=1792129253;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w+4kAAJ3Fw9J4WUA2k2oRC3BjB3Bj1YsgSFYbXXKqEM=;
        b=Dl5uhsPd0W1WCKzPFvzfgMpkBruUB07Bv1f95CjFaNX1ChUo28EYUEdHHNq/HKRmb8
         tt1LkiFJ1RUh1xnkNP3ElHZ6skWJ7BxbC9YAn3Wwtyd7GXGkZ22f5CgmIMRSKC38YyAl
         Aql9Q17dZ9+bo0/kSrKmkB8RYof3mq4FIAuDXllBSthP5PdtgPFUlXGoMyGhqwhP45sY
         5PIgdfdG7cjGBlkdH0Qw95Nu3oAaLpFlkDiun6o6EtuAk4qVPf5RKflCk+la1t5wrFO2
         IU+Radeq+rKf7P9swhmgQ645Ku2BN6tkpbZinWhhCYciovGT1qvPqt6ai8jFC5d1JjsL
         Wahw==
X-Forwarded-Encrypted: i=1; AKwUvByIO6OhydhHm0Kvpg0/ZkNparf4eYJeNesYl4EgFywBSrl2Nxl4AnocPxQe8vTJjG0N2RxugL5EYV413cc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIcbVSJcw177sNTOGpYlMEFDjJOwrH2Jrh5PJGt7u/LGrvWvic5
	YZjRgm8OieJUO4Jx7yrq40TjFbLe24LTQkZVTvP98C47VBFjnhKgNzY0
X-Gm-Gg: AYBFou2lMLb/qT3Pn5Mi9uF3LmDYNq2DsM6umU1BPahsYB+aDbpy2rH0qdQnu703IDA
	+nKafKwGSBx406zewBnMOoqIEho1UWEfJQoZxTTWAliGzKVXxSykAr+Hze9RLWmmI7T5sJTFQne
	kU8qT+GbpaRNrAHoYVfsdSEPZD+GKydaTYZm8SECJwbAS2atYIi8ZpC7urxUUhG+BdhHHZpjKEb
	iG4TBr+uWPeVHqTpfdQtepkMaxu7ZvkuGUE+ori13xpg+vsBdXCcFmwf8rYuZlMDZeIpT+nQiKO
	tbnmGDP37qXZOYTyhK4iMu3T347ruMRHvShvgxGLIHJziZNdGV2OPXDmNk6YRwVr8NZoUHyKd1y
	Wit8/40FNdC7CYmkit8jixgG4tEYBdjOHe6ApPg3fXkKj2NPYX16Vpuf5cAzawc5UpWa+7x+Fp5
	9w/gO2Pw/00tplig6M/YyJFqq3xdNhcobMwZoz5NzQbJWEzSkzotDZxLeC2LnpBoIo+t2TkWWpQ
	niZrue+X3zk
X-Received: by 2002:a17:90b:5346:b0:3a4:e635:a8c9 with SMTP id 98e67ed59e1d1-3ab3a773f40mr964916a91.24.1791524453388;
        Thu, 08 Oct 2026 22:40:53 -0700 (PDT)
Received: from ancienth-X870E-Nova-WiFi ([125.186.72.2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab3690474esm2028695a91.0.2026.10.08.22.40.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 22:40:52 -0700 (PDT)
From: Daehyeon Ko <4ncienth@gmail.com>
To: David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Daehyeon Ko <4ncienth@gmail.com>
Subject: [PATCH net v3 0/3] ipv6: fix address publication races with addrconf_ifdown
Date: Fri,  9 Oct 2026 14:40:39 +0900
Message-ID: <20261009054042.272944-1-4ncienth@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The first patch serializes address publication with device teardown by
taking idev->lock before the address hash lock. It uses READ_ONCE() for
the initial lockless state checks and rechecks both dead and disable_ipv6
before publishing.

The second patch handles an address captured by the per-device snapshot
after the initial hash scan. It removes the address from the hash in the
existing list-removal block, after delete notification and before dropping
the list reference.

The third patch initializes a temporary address's public-ifaddr reference
before publishing the object. This closes the remaining interval in which
ifdown could miss the reference and a later store could leak it.

The original deterministic test used a direct internal caller, kprobes and
atomic rendezvous at existing instruction boundaries; it did not add delays
to addrconf.c. A real RA separately reached ipv6_add_addr() with
can_block=false. No new kernel build or runtime test was run for v3.

Changes in v3:
- Use READ_ONCE() for patch 1's initial lockless state checks.
- Add a third patch that passes ifpub through ifa6_config, as suggested by
  Ido after the Sashiko review.
- Move patch 2's unhash into the existing lower !keep block and use
  73a8bd74e261 as its Fixes commit.
- Rebase onto current net while preserving the v2 cover and first two patch
  subjects.

Link: https://lore.kernel.org/r/20261004183639.3773498-1-4ncienth@gmail.com
Link: https://lore.kernel.org/r/179122559913.434549.12720841717630168470@kernel.org
Link: https://lore.kernel.org/r/20261007164548.GA1153540@shredder
Link: https://lore.kernel.org/r/20261007164635.GC1153540@shredder

Daehyeon Ko (3):
  ipv6: serialize address publication with device teardown
  ipv6: remove ifaddr from hash during ifdown list cleanup
  ipv6: initialize temporary ifaddr before publication

 include/net/addrconf.h |  1 +
 net/ipv6/addrconf.c    | 25 +++++++++++++++++++------
 2 files changed, 20 insertions(+), 6 deletions(-)


base-commit: af32da41b0327b9c6a37856ba82b6760d6c8d10e
-- 
2.55.0

