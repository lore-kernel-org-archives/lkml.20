Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F2A527A462
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 06:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792131001; cv=none; b=mBMv2OKUnjhuVfUxtVt6+sYRHs/Xzwsq6+hBdC8P9RntEb61lPXrqneYoZLDHtJfbpuiGwB2soISOYZ/gccC03g80fR2Io5137FjVwTOdrpBqKh/7crr5BMGS6ieqecsSGn97MPE3xjxZ7Fhnen5zfeEloWu+n+6AMV141QuNMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792131001; c=relaxed/simple;
	bh=DqG2AIGPL1uGXvBJhqSHPSDtvVR7TWwuzpI0OdCQ/xE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=CojyPCWKUNAkAs6R1H/SN53tKa4jCBPv3ol1wsOqJkCYmSLehAdel5CgjPPFNXhfXYQnaW0tJYpAQPc0x1oIQkNOaUe2GWs9CxuM/jJ4e5PatG/ARW+4uezbmQRknkuQPvFDnADXpyRzpUoiEKGV77eYW4Tg8Crb7LjkI1sG4Co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=omF1nW6M; arc=none smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="omF1nW6M"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-15ea896ddc8so4044860c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 23:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792130999; x=1792735799; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gwEs0x+XqCChaDuPK/8cuCgIucGP91NXK3xMck8OY0Y=;
        b=omF1nW6Mb7kFmQb7/yrueN4kDQZIiqwvhrZNrPPLcJKDHlZHoqmNHyfnwuDuZkJoHy
         BqNen+ojI+tkPuhTis7JYR6s0+W1TPjbHxcnh15HpO8qheuwMkQrFHC6f3q9i9babTDW
         BbWCs6tghYxhovwctsfuB8JoUc70VwJr2X4X+ffC/cL0xfNbw5sr8ntZVvAhluMyJ0Mj
         ZnehJuMq67gZ0jef2h4ZBzuW4VeBIP1M/CVKQJd30t8OyI041ykmvbjH5xoQ2oyF0YRD
         4I9SHJbVpG0vrBK3PDvUroaSKzCU+HAxCRZADHPcsE/oOPxKP5cnAFIOw9Wq1qAd12iS
         W75g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792130999; x=1792735799;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gwEs0x+XqCChaDuPK/8cuCgIucGP91NXK3xMck8OY0Y=;
        b=z+XCNj1rOY4HU0zqRplMxcz0f+amYXvIcL9Sqj9Ik+CayEN3nhSRA9+fxJwcuKLnzK
         mrsgg8r0sA0idzqIb5uMHq7Su/mXW056bgpqDv38tR588/9GrAHHH8WCaaeZBQrnTEEO
         7b10yZ9KRE51vIugBOjXBteTdvqAf/bExM7ntxUaHkPKUcL9DQ1+y1SdKW12X3D3qRWb
         bcQZTEN5nRWQ1wT4euazsPPRRPOkfYL+tF7ROfNHSkzwmGhVA4cnsJ0tXK5VNwUE6m/g
         7qDoS8H+d8jgT8rwY96dsbQgoIPoGUxP6fXGq7h+no9Lmz6D5mYNq6cWjF7ivUcUkq9y
         Dyqw==
X-Forwarded-Encrypted: i=1; AKwUvByiuhPKwg9JRMNkEGr0FfRzT3a1m9NC1BogYUIaaIYWUgBTdv1fPOfDzQtYRtfbJXKHcvQtrpuj7Ool4DE=@vger.kernel.org
X-Gm-Message-State: AFq9FYI6Dqo9v4jQcs3CRCvhLBu0bAemtkdy6euvVS/KoBputqCzQL4U
	XF1yU9c1fwqYunYVu11LhZugDyaLn6CWfdtWjPNl9M8lUHHCk8o2jPXdXwZAVdJT7ug=
X-Gm-Gg: AYBFou1nxG9WoiQMxS3FAY8BwIy08NrPG1+jOOmYgKXb+wqNas5fTIrPUZMn3gMl5sL
	ZOuvXDUxg/XqY0ocHcRZm9NUpcdfNT2C4MvuJKsvmGT9DaAwYcrusuNnPwXPE2tjCThThihGfBv
	t0hJNKioXoCnPwNDZfMdCUbyw4nQw1yQ/ASzS8KwClvADE/eDob2W3SmeGKGg6gdofh1HGOfxgJ
	s63tSeHfw6abBA/KWuyWeG1jvg4/0DGHb3tyRwB0oM4JwUZdKCpu1Ltur5575evWEHEebb64bXS
	6NM8SiRHklt/T/Ql3NXtRhEq8bPI0PQwRZPpsOhd4qRf5Xy4fMIOmQ5+qY/zhco4HtCO9Kak1P4
	R5f+V2mjvjv7v9vHU93KAO2NYsE6Uuw98N4u0c40F6O5k9PJVLRbsYLitQBvosCC4iAMHvps7YF
	vqcYc949bUfc5FT/f98l4SKjU2GTOsVNLHuPgsOf7pBczKx1au8dcff+0qWEafce11bA==
X-Received: by 2002:a05:701b:230c:b0:143:2967:c0b1 with SMTP id a92af1059eb24-16a5fc91121mr29007550c88.25.1792130999447;
        Thu, 15 Oct 2026 23:09:59 -0700 (PDT)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-183190aa411sm3309068c88.4.2026.10.15.23.09.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 23:09:58 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Subject: [PATCH net-next 0/3] net: make moving a device to another netns
 cheaper
Date: Fri, 16 Oct 2026 14:09:52 +0800
Message-Id: <20261016-bug-net-netns-move-rcu-barrier-v1-0-4157d798658f@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALC/0WoC/yWNQQ5AMBBFryKzNklLNOoqYkENZqFkikjE3RWLv
 3iL/94FgYQpQJVcIHRw4MVH0GkCbmr9SMh9ZMhUZrTSBrt9RE/bOx9wXg5CcTt2rUSPYG9t6Ux
 uizJXECWr0MDnF6jh/50bNPf9AOPA0V56AAAA
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>, 
 Nikolay Aleksandrov <razor@blackwall.org>
Cc: Kuniyuki Iwashima <kuniyu@google.com>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Qiliang Yuan <odys.yuan@gmail.com>
X-Mailer: b4 0.13.0

Moving a device to another netns waits in rcu_barrier() with RTNL held.
Container and sandbox managers move one end of a veth pair for every
new network namespace, so this barrier limits how fast such namespaces
can be created on the whole system, to about 75 per second in a 16
vCPU guest no matter how many threads create them.

The barrier was added for NETDEV_UNREGISTER_FINAL, which is long gone,
but it still keeps cached IPv4 routes through the moved device from
being accepted in the old netns. Routes through nexthop objects are not
covered by it: their cached dst entries are released by an RCU callback
queued from another RCU callback, so a socket in the old netns can still
send through a device that now belongs to another netns whenever the
route generation numbers of the two netns happen to match.

Patches 1 and 2 make the IPv4 rt_genid and the IPv6 fib6_sernum unique
across netns, which fixes that leak for nexthop objects and leaves
nothing that relies on the barrier. Patch 3 removes it. Patches 1 and 2
fix bugs that exist today and can go to net on their own if preferred.

Creating 400 netns, each with a veth pair whose host end is moved back
to the initial netns, a tap device, addresses and routes, median of 5
runs:

                   before      after
  1 thread        67 /s      440 /s
  4 threads       75 /s      409 /s
  16 threads      76 /s      283 /s

Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
Qiliang Yuan (3):
      ipv4: draw rt_genid from a sequence shared by all netns
      ipv6: take fib6_sernum from a sequence shared by all netns
      net: remove rcu_barrier() from __dev_change_net_namespace()

 include/net/net_namespace.h |  5 +----
 net/core/dev.c              |  1 -
 net/ipv4/route.c            | 16 +++++++++++++++-
 net/ipv6/af_inet6.c         |  1 -
 net/ipv6/ip6_fib.c          | 14 ++++++++++++--
 5 files changed, 28 insertions(+), 9 deletions(-)
---
base-commit: 6b3e73774815910a39d8ca75b9ad7df963f61d50
change-id: 20261016-bug-net-netns-move-rcu-barrier-d998c6395830

Best regards,
-- 
Qiliang Yuan <odys.yuan@gmail.com>

