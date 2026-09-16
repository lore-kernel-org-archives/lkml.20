Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F1651992D
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 14:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789569449; cv=none; b=QusK1PRAssXqEp0oqiSL6hKr7jSN/kenRSvH8uYvptFa24DIJbnnAtEUfAFW7R9tg3+QCf89X7g3hqitM8f0rzyIzUzmwpJHoha4Tg+NDy0K+AQZ/zKnag7PXq1ASkEF+XPTJBCYrC5nTcq79TGdKMqtRBpcQSddzgBGXuQVynQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789569449; c=relaxed/simple;
	bh=1QSdtk99ZatbaRCLJ+7eA1d58uFjbxdzg6dwDKy29qM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=n+nhZV72DKBBiQYT1+eVZ7KFmt3RIUHuyQk37d0RIcvlfy1sKWEq7+qamGyh/3wrXGcaXGHEM+soAADnMWxvRJtzBU2zvrMkRG8qDf3DJ71ZA3F7TWnh/JasQ5jIl9VR4gQgWBzVeHWSdSgeZ/xddpxVtV1HQ+vM5TvpuuZsIoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gLEdJsI0; arc=none smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gLEdJsI0"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b5e4f16f12so1066859e87.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 07:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789569445; x=1790174245; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cqDSOOPz8VYrAAVtezfZe6qfPPN26JvJk5+Wt8d33bw=;
        b=gLEdJsI0n976l9qzQrIIZpg2r9b5IDa5vH8F6mEywCQDzWE94yEt6xaWrEqLKo62kc
         3rCDEkl/FYeV9Z+gmiiwx74vkA6EBjFfc4oWcaZIp3Amnc6seDKKUB+jUAl2J9qL7ADR
         g1O2TLpnVO0zyknjSZdFXvsgzkh6Wjh5FqKgR1T2850icqinz1Q6eqM/UrCqz2KTPbYA
         5QNwi7kVfwBXbJhyYkUCHIOLqSsGvCWYBOibPCFy9QCATb5iT3X2Qcw0QZ4XXJe2GsNk
         8nENpFjBXIqv9sjCQ1Y56HVxa0IP5lMyhrtLNTG9Z7fVhznI5l1sziH8nI6zRIAn4r/D
         kIbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789569445; x=1790174245;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cqDSOOPz8VYrAAVtezfZe6qfPPN26JvJk5+Wt8d33bw=;
        b=AYFDZ6SojKuu3nVoMg95+iO+611Ocb6psT9pEvuis6GnwnG7vwEgJo+SR3oIiCCwvn
         /kkbemEmM5fJpLfqK0PseRblDIwNgXsjAtwBVNnGfsgjVd4uHUzxAiUTU5w52Gaht8gB
         9u89B0KVLoZBAWd+yByMtRzJVmVvdF9H5wcu/fsQ3mn9wS06N17HWri+0K0sGHNzlgR7
         ymoz/Vzb11/TjZXJUOeAXpxByarJBZT0tyTibkJhtQmAbbrIOim7ft6AGG8CjJAkgCbS
         DHTHeEAk/+6S3+4+XVNIsDB5nbcvX9Q41Xfu4fyTaWFT122L2tDzT8cFOwD5cFYrFeVR
         DgNg==
X-Forwarded-Encrypted: i=1; AKwUvBwDMJvnBgcO5S7T45ciZvE9fM6/nQzlsHLrY85+5hKzUt7VP/WLjwfFstXJ36CTzVcCUtle9Zev44/ZyIo=@vger.kernel.org
X-Gm-Message-State: AFuF++kF+L1uv80MMCeSI9cRTdNfAHiY59OH2tGhOZMV6tWI4fYaY7Jt
	ZoMZCKiqSNDVS/b1ywBRK99x7WJZ4m3bmtVHHYHLLWuG525QfzJjtqBl
X-Gm-Gg: AYBFou0bLzo3zl1MM3D0L0RVydQyRZ2DSTeDIciKUX1EBk0FhXrka3BNZL+0etxAV2N
	H6WHxgki9MmFGHo9eCwrVbzw92+1yWvfKVN+Httok3Jlf1/2Wnu7qrcLu9MTFdruEckcMnLcMlj
	jBXHgtG4NRCyIHZ3xnyhXRhL2yeqqzaV/lfd2SSTw3i4y9865etyQE9SdExNZJHMCLcEblYEC/A
	0mMGCUY7O576js4qWbs1roD4kz0ihLh+JfyX5Kk4qIiEIt4CwYUJLQKUuf2/vojXG5cM32KbuPw
	nSDcJOVHZIgG6gFTULeL/pxsdAbovdSFP1Duy6KJ0PGplSXtaXSzMGoF3ifALZeCGbyIqzB/Yvv
	8cFqFxUnBvICCzAHY9ES0LjtGGkgxyogVlWwiCwkPvBCGRun0CYRVptzd6wTbm+8j57B3ovuyOy
	Oyjk9aUn+PEUhpyyJ8mLOjPJkYKEeeuS6cNf8xTKZfFlmiUADTsYyOYNEVf7Y1gJk9qOOYDjoqa
	QaXyAeUeHfnq7cWzXcz8MqiHuqv335v8ncgGX49jO6wOUSBNHVl5RCi7KkAOh24
X-Received: by 2002:a05:6512:3a87:b0:5b6:7fa:e96b with SMTP id 2adb3069b0e04-5b8b6630e84mr1670657e87.14.1789569445249;
        Wed, 16 Sep 2026 07:37:25 -0700 (PDT)
Received: from dau-home-pc.megasoftware.org ([95.139.134.117])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8b57eb908sm955658e87.79.2026.09.16.07.37.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 07:37:24 -0700 (PDT)
From: Anton Danilov <littlesmilingcloud@gmail.com>
To: netdev@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	David Ahern <dsahern@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v3 0/9] tunnels: add core and gre drop reasons
Date: Wed, 16 Sep 2026 17:37:08 +0300
Message-ID: <20260916143717.1875082-1-littlesmilingcloud@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Only vxlan reports drop reasons among the tunnel drivers today.
Everything else, on both the receive and the transmit side, ends in a
plain kfree_skb(), so a packet that a tunnel throws away is invisible
to dropwatch, drop_monitor and perf trace -e skb:kfree_skb. The device
counters group the failures coarsely: rx_errors and tx_errors each
cover half a dozen unrelated conditions.

This series covers the generic paths shared by ipip, sit, gre and their
IPv6 counterparts, plus the GRE specific parsing, on both directions.
A later series will do the same for geneve, bareudp, fou and the
remaining IP in IP drivers.

Patches 1-2 convert the generic receive paths, ip_tunnel_rcv() and
__ip6_tnl_rcv(). Two reasons are added:

  TNL_OPT_MISMATCH  the options a packet carries do not match the
                    tunnel configuration
  TNL_OLD_SEQ       the sequence number is older than the one the
                    tunnel expects, next to the existing
                    TCP_OLD_SEQUENCE

The second one has a failure mode worth naming: when a peer reboots,
its outgoing sequence number restarts at zero and the receiver drops
everything until its own counter catches up. That is indistinguishable
from a misconfiguration by the counters alone.

Patches 3-5 do the GRE specific receive path. gre_parse_header()
returns -EINVAL for six different reasons, and the only detail its
callers could get was a csum_err flag that none of them read: both
ip_gre and ip6_gre declared it, passed it in and ignored it. It is
replaced by a drop reason. Three reasons are added, mirroring vxlan:
GRE_INVALID_HDR, GRE_CSUM and GRE_TUNNEL_NOT_FOUND.

Patches 6-9 do the transmit side, some eighty failure paths across
ip_tunnel, ip_gre, ip6_tunnel and ip6_gre. One reason is added,
TNL_ENCAP, for a failure to build the encapsulation header. Patch 8 is
a small preparation: prepare_ip6gre_xmit_other() cannot fail, so it is
made void rather than given a drop reason for a branch that never runs.

The transmit side has its own case worth naming: tnl_update_pmtu()
returns -E2BIG after it has already sent the ICMP error back, which is
path MTU discovery working exactly as intended, yet the drop lands in
tx_errors next to genuine failures. An MTU black hole cannot be told
from a broken route by looking at the counters.

Drop reasons on transmit are not new: vxlan already reports several
from its xmit path, and ip_tunnel_core.c reports RECURSION_LIMIT.

Changes since v2:
- ipxip6_tnl_xmit() no longer overwrites the reason ip6_tnl_xmit()
  reported: the PKT_TOO_BIG assignment ran for every error, not just
  -EMSGSIZE, and ip6_tnl_xmit() already sets that one itself, so every
  ip4ip6, ip6ip6 and mplsip6 transmit failure was reported as an MTU
  problem
- the NBMA branch of ip6_tnl_xmit() now reports NO_TX_TARGET instead of
  IP_OUTNOROUTES for an skb that carries no destination, matching the
  sibling branch a few lines above and ip_tunnel_xmit()
- the __iptunnel_pull_header() failures now report NOMEM instead of
  HDR_TRUNC: the helper returns -ENOMEM for every failure mode and also
  fails when skb_unclone() cannot allocate, the way vxlan_rcv() labels
  it. The length checks keep HDR_TRUNC
- fixed the call graph in patch 2: the exported ip6_tnl_rcv() is only
  reached from ip6_gre, while ip4ip6, ip6ip6 and mplsip6 come through
  ipxip6_rcv()
- reworded what a NULL reason means for gre_parse_header(): a checksum
  failure is not reported, but the checksum is still computed
- new patch 8: prepare_ip6gre_xmit_other() cannot fail, its only return
  is "return 0", so it is made void and its caller stops checking it.
  v2 attached IPV6_BAD_EXTHDR to that branch, which never runs
- the source address selection of a collect_md tunnel in ip6_tnl_xmit()
  now reports IP_OUTNOROUTES instead of NO_TX_TARGET: the destination
  is known and the route was found, and the IPv6 stack itself treats a
  failed source selection as a failed lookup, the way vxlan reports it
- the commit message of the ip6_tunnel transmit patch now lists every
  reason the patch uses: TNL_ENCAP and UNHANDLED_PROTO were missing and
  RECURSION_LIMIT also covers the address conflict check
- cover letter and commit messages made precise: the transmit side
  labels some eighty failure paths, not forty; vti does not use the
  converted paths; tnl_update_pmtu() returns -E2BIG for IPv6 payloads
  too, not only for IPv4 ones with DF set
- the three selftest patches stay dropped
- v2: https://lore.kernel.org/netdev/20260913034937.875068-1-littlesmilingcloud@gmail.com/
- v1: https://lore.kernel.org/netdev/20260831215137.549324-1-littlesmilingcloud@gmail.com/

Anton Danilov (9):
  ip_tunnel: add drop reasons to the generic RX path
  ip6_tunnel: add drop reasons to the generic RX path
  gre: make gre_parse_header() report a drop reason
  ip_gre: add drop reasons to the RX path
  ip6_gre: add drop reasons to the RX path
  ip_tunnel: add drop reasons to the transmit path
  ip_gre: add drop reasons to the transmit path
  ip6_gre: make prepare_ip6gre_xmit_other() void
  ip6_tunnel: add drop reasons to the transmit path

 include/net/dropreason-core.h |  38 ++++++++
 include/net/gre.h             |   2 +-
 include/net/ip6_tunnel.h      |   3 +-
 net/ipv4/gre_demux.c          |  52 +++++++---
 net/ipv4/ip_gre.c             | 144 +++++++++++++++++++---------
 net/ipv4/ip_tunnel.c          |  60 +++++++++---
 net/ipv6/ip6_gre.c            | 175 +++++++++++++++++++++++-----------
 net/ipv6/ip6_tunnel.c         |  95 +++++++++++++-----
 8 files changed, 419 insertions(+), 150 deletions(-)

-- 
2.47.3

