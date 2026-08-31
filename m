Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A89A3B0AC7
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 21:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788213118; cv=none; b=Bq4ZtcZrt0uSN24Px7I2lrbwdnNYLy+roUBNd/DhWEV8XXVSITGSFkiwNwbklIPUM5vtlfXSJdiQcFc6mO09PsQafqMSnuLIsL88fvhJN/cwl8WEIFHLrJWYxrfAoPUc/AoLjpZymXoV2IRI/LDWVk7cquI0jW7+1xnoYyYbuaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788213118; c=relaxed/simple;
	bh=wMZRcjI+OWyvem2irRl2drG2Q+YoShdAEnweMvtF1GI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=heHQb5cf8sAwrILy/zDnHXwNBuLU8evci+WAsKsB3vJIXzodQovNl6vtRGMZ9a3tuSUkhPf3Om2YnPcgYfpsARQ+ToodChq+5t0JNhn1B7hv//bpYxQxRDHWVPZRFmFQj9AWmGXgvMcHLpafISvqbkwhYctiiWp6JyStK8UgV7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qK7RUyO6; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qK7RUyO6"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5b5e1340faeso118977e87.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 14:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788213112; x=1788817912; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cGKaO6KKnr5SuBGCN5zxoUeuXnRrk7kBjvDdBLu0U8g=;
        b=qK7RUyO6LaPAyMU+uG42Wm+Sybo3RbgEekiOUcO3nW4Br4h5wi6tZ3OQX2g8nfghJe
         AQN+27d0ewmNm/QsDg6KqTxkOIWxuzbcicq92Tj1g9j+3XQtZhfC3L+wJ1nGs5GO7dAe
         XeQWnCsvv9yyC0XCUyz3l4ZoxArsGUYtdVPEU8j02dd0rSwx6TJ2GiZ0weT/oXhI99ib
         GH5Qx5AOzK64bKLMnQyXhFuIlGw1AizzBF9cfIMcre042vvxh8KyyzQkjLh3lj++zES5
         GpoAaEJbN+RyHD5DL0jBWBFkLknfW18NmdtIPA9b/46EgpUxi0Iz61z6ChLmfSxakWuN
         KCwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788213112; x=1788817912;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cGKaO6KKnr5SuBGCN5zxoUeuXnRrk7kBjvDdBLu0U8g=;
        b=SMbU7svTkceroJ1hbgTH5LaLxLaGuTUkf7aTYWu0EzHLE7ftqLdKNMv9Qkpy6iHQt6
         hVRTxVqyNh3IWHD7SSgZW7EX7VWrSEAO5Zl065z9safPBDCL+iBq9brpr9aIVUus/D5K
         5vWX4os6UfLRYbkyPYFsR6cwWlRIUsjjGHpwx7v9oxny7eQvIhhctHFVJxmTxUmkL7O9
         pXHRwicU9MDnM8+SCoVO1NBMV6QndAePFH+e6FBaM2DRdg0BypSWdaN4CRpWsDWGeXyV
         VqJKptyUQv+l9ujveL0SyTHQXF358T6td0m4dllYRxrIyoDp7opCw+De/T9Sq9g5rTov
         MiEg==
X-Forwarded-Encrypted: i=1; AKwUvBwnEdPNWr15+SLnR2NlhUPCLXZBZMR2o25/Hn5sn62/kp0POrkGBEv2QMfh8GYT0oPXzFkdOjqI0f/Whys=@vger.kernel.org
X-Gm-Message-State: AFuF++lpr4Ug1Au7djHGi16q2ius9NHZ4B4uodGKk3h8kSRQUsSUJo/r
	zPut6UXaguw+avZ0ucWJgo61LBhZTaVKWV747RyUDBssbm9F4MKEpGV3
X-Gm-Gg: AYBFou2mR4TpJG5N8e8FSQHN6g6MOoEljen7BHNUK951f6K8Y6g+FAQCi/hadOy/SsX
	vfIBJGxrqdaCe+GRni7No9gtdtCEm4eerO9vgh6FD0bQm0YO6R0CCzEbu+kkWAk7QipjSnc7mZe
	wTQAd4/aSYzOqGDju+c3EuEfdbxEsbFRoMe6ARFIPWO4Ego28Wl8JqocL4TqwlfaXmxVxCUcdws
	SBvKbx7xWYB9CYC3Jjt09ymDxp9mnMNQ/feUPyjIckJZjpekuiaIxdVMwXRcUujzgT3+118AZ4g
	c5EjpSksROcyK+cwavqK6OgXFZSSDD18bDeaka/pC4/KQohWGYhidiEhZ1F10OxQaBq1ndt6ABO
	KGq0Eq3i5PVIYVzX6AVYjOUP00kjinQLbsp29LAS/bCXY+8bOzqDL97GKzFieT3MT+DlP1hbxle
	pARrSXBc1XgNAicd8G+UXY2LDtkqsbpnf6/SF2BeEp3xBQ9tDIxk6NKOyZMQWAU4uJmuL9LaigZ
	MiqvJq8kLOQY8BKEoxGpdMepK2NQJ5h5g==
X-Received: by 2002:a05:6512:15a3:b0:5b4:a388:63a with SMTP id 2adb3069b0e04-5b5e68a73f1mr8750331e87.4.1788213112244;
        Mon, 31 Aug 2026 14:51:52 -0700 (PDT)
Received: from dau-home-pc.. ([212.35.184.237])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b5e8a06a77sm2388782e87.48.2026.08.31.14.51.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 14:51:50 -0700 (PDT)
From: Anton Danilov <littlesmilingcloud@gmail.com>
To: netdev@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	David Ahern <dsahern@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net-next 00/11] tunnels: add core and gre drop reasons
Date: Tue,  1 Sep 2026 00:51:26 +0300
Message-ID: <20260831215137.549324-1-littlesmilingcloud@gmail.com>
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

This series covers the generic paths shared by ipip, sit, vti, gre and
their IPv6 counterparts, plus the GRE specific parsing, on both
directions. A later series will do the same for geneve, bareudp, fou
and the remaining IP in IP drivers.

Patches 1-3 convert the generic receive paths, ip_tunnel_rcv() and
__ip6_tnl_rcv(), and add a test for them. Two reasons are added:

  IP_TUNNEL_CFG_OPTS_MISMATCH  the options a packet carries do not
                               match the tunnel configuration
  IP_TUNNEL_OLD_SEQ            the sequence number is older than the
                               one the tunnel expects, next to the
                               existing TCP_OLD_SEQUENCE

The second one has a failure mode worth naming: when a peer reboots,
its outgoing sequence number restarts at zero and the receiver drops
everything until its own counter catches up. That is indistinguishable
from a misconfiguration by the counters alone.

Patches 4-7 do the GRE specific receive path. gre_parse_header()
returns -EINVAL for six different reasons, and the only detail its
callers could get was a csum_err flag that none of them read: both
ip_gre and ip6_gre declared it, passed it in and ignored it. It is
replaced by a drop reason. Three reasons are added, mirroring vxlan:
GRE_INVALID_HDR, GRE_CSUM and GRE_TUNNEL_NOT_FOUND.

Patches 8-11 do the transmit side, about forty failure paths across
ip_tunnel, ip_gre, ip6_tunnel and ip6_gre. One reason is added,
IP_TUNNEL_ENCAP, for a failure to build the encapsulation header.

The transmit side has its own case worth naming: tnl_update_pmtu()
returns -E2BIG after it has already sent an ICMP fragmentation needed
back, which is path MTU discovery working exactly as intended, yet the
drop lands in tx_errors next to genuine failures. An MTU black hole
cannot be told from a broken route by looking at the counters.

Drop reasons on transmit are not new: vxlan already reports several
from its xmit path, and ip_tunnel_core.c reports RECURSION_LIMIT.

Tested under virtme-ng. The selftest checks twelve cases by the end
of the series and passes, with no DEBUG_NET splat from the
SKB_NOT_DROPPED_YET check in sk_skb_reason_drop(). Breaking the new
mechanisms on purpose makes exactly the corresponding cases fail.

Not covered by the test: GRE_CSUM, which veth cannot trigger since it
hands the skb over with CHECKSUM_UNNECESSARY, and the NOMEM paths.

Anton Danilov (11):
  ip_tunnel: add drop reasons to the generic RX path
  ip6_tunnel: add drop reasons to the generic RX path
  selftests: net: add a test for the tunnel RX drop reasons
  gre: make gre_parse_header() report a drop reason
  ip_gre: add drop reasons to the RX path
  ip6_gre: add drop reasons to the RX path
  selftests: net: cover the GRE specific drop reasons
  ip_tunnel: add drop reasons to the transmit path
  ip_gre: add drop reasons to the transmit path
  ip6_tunnel: add drop reasons to the transmit path
  selftests: net: cover the tunnel transmit drop reasons

 include/net/dropreason-core.h                 |  38 ++
 include/net/gre.h                             |   2 +-
 include/net/ip6_tunnel.h                      |   3 +-
 net/ipv4/gre_demux.c                          |  51 ++-
 net/ipv4/ip_gre.c                             | 144 +++++---
 net/ipv4/ip_tunnel.c                          |  60 ++-
 net/ipv6/ip6_gre.c                            | 163 ++++++---
 net/ipv6/ip6_tunnel.c                         |  95 +++--
 tools/testing/selftests/net/Makefile          |   1 +
 tools/testing/selftests/net/config            |   1 +
 .../selftests/net/tunnel_drop_reasons.sh      | 346 ++++++++++++++++++
 11 files changed, 762 insertions(+), 142 deletions(-)
 create mode 100755 tools/testing/selftests/net/tunnel_drop_reasons.sh

-- 
2.47.3

