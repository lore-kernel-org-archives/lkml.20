Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A85C85803B3
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 13:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788960797; cv=none; b=oHJt6w9WuEnt01X5+p+BBQz6oQs6O7waMKejBBUn2HwKmBxO47ceXRkkSR7F+vPIcWASZD+OEvDRI5/caHaJMqoD3hxLwlSJqx4bUJmmYHKi523L5EzOPMa812uOAHghU7f4EcNJlonkm1ISKIyXV1sL+1UuvQ4pnDJ+hxrjdz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788960797; c=relaxed/simple;
	bh=5TvSDwUtPA7AWJfw9DOFzRM1uviDoKe4HLGuTrjX9AU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=idtCldfWwxQFDMRlIUdSMjqNwO3c+9BUj72tgi0vRE8sjoh1YTo2SE9ARsZ5hhHBtegMKJFwblr7bmQ97IkMwCDR3gLhnjX5iebtrUZZQHsz11vW0zDZ2x1N3cjhcpiWZ6Rgc+NKSyRyN/71Oj4nrOAGhtd64+8ifJHDJFJVQik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QBffSqbb; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QBffSqbb"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2cfbbdfa60bso51320075ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 06:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788960795; x=1789565595; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UmRYZ4H33HDuLnzRy6bagLZV8eJULQZIzyCsNwDedUI=;
        b=QBffSqbbVS7R5o/BEYoPERGQ4YYZ/D8FmAQKEOTlKRtnW5bslvvOjX0S0TOB2DcbXJ
         fOm/1q7WP+jdmuPHcMj8Sce196yj3LxIcRZMovRqi0hVUwVR6i5O93Wdz+yWUKHxnj12
         +n3g6kItqrz6/SYTxQKFpZh406/cyR7QkgwX4L7FBy//1NiTUyiakKkV6qSOcuJLSRBX
         +6mN0F1eKwjgmmow63Z0uhGkwwtlcLVJhbKDY4IDMLM+ndSDxKv01Qe3ZV7TZZaQDT2e
         KlWU8UyyfvPfgLb+JdlaeKWXrC8YUHv5UptouY4mKbqqTDVHMm/YfSciRBVZiHesiueb
         xBVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788960795; x=1789565595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UmRYZ4H33HDuLnzRy6bagLZV8eJULQZIzyCsNwDedUI=;
        b=nZAA5Q/kUW+VKPccYNmjYkKvJAV0hs09F3aA6It0aLWIZZ0ZH+a5I2lXJrXMeTk/EZ
         k8c3doUtzsB+5r8wUcU56jgIJycsXOcVa1FpYZOPgow3auKKWRCWTda/87777vvARpxf
         XDkhMtFZMIPT79GoCMexlaIdexitBzYekKD3YlK/IsTsMIvqvK7fZm40V4B8DIyVJBM1
         5vbur9g2AC78IdCRZ3SRHpKlqoDvfPdCAti2O01itCFChzGQGXWufSlqnAInCPQsSbXh
         tA+fiR52uhNln5/A6BdQthOiEXbRfNK3yvPe1gafg6gjlc2d+5a5I0cV138c2Ef4G+/A
         Dxog==
X-Forwarded-Encrypted: i=1; AKwUvBxFlM2EvsqRMJBwWhk5nzJLhT4owIuFwXJSmFygKXHTNcKZphntC2V/atEUymiryi+RNikyYoKSqcpiDc4=@vger.kernel.org
X-Gm-Message-State: AFuF++nSiFtANhCT2uUV9Qd9N8hjb9ZjO8rXL71EwDX5fxFvnyMqvPNF
	bYnMvHd2we+752mCeYcflUrck+BU/q79/MkdfT6WwqxTpD4Xg0c06cGO
X-Gm-Gg: AYBFou2KgaT2JTP1ojHxGvVNts88cIGrsE16hsjZH5ItnPnN/FhmA2dxBXGCgk/TAd1
	eeVZNIb/ifLNl7MPP3lw2eumZ1fdQcZhfZtPJuiGZiO91wMH8YPEOHwAlItlXSpHbxyM4BnEt8L
	J/+T9VR6Ho1Af3+Sgp5WrbQBKinKWWHcp4nw0MjQPeZLB22XNGWNPHTq0nYBXaD0yU39y24huH/
	dfc/LCdAT8JF0inDPBbR/+kUKCdzWhTSIKZXG21yBTaalubu0ue2e6rEVCBJejZLtOX31u8cDmV
	q8asGuYhRWngqTyEG0l18sW9daB13qiGlyPyDUDvZDTAGVK4A7eAFjIARFhFVvleF1JbfdNLTTV
	vgm1os4v9ncJyp3olkDwiJXhdqbCNtLwPtmEvPIi9V4t93qbwXSnMB3cRNqDJhMaUIuqeqkNhyO
	JIfSuu90NUXHF6Cy3TP9kUQYy/wYLHYNR0oZP/ljowKtOe3rMej88c2+VpI18RsdvZsvW0JYEwO
	0rj09a2I95llTrQ2Ck2C1TnEz9WKX60AZtMqEOymD28SDT9Ke6PwTUDCmd9t5+/Ei+f/d0S
X-Received: by 2002:a17:902:fc8f:b0:2d8:d4cd:dc8f with SMTP id d9443c01a7336-2db1267d02fmr578562535ad.18.1788960794903;
        Wed, 09 Sep 2026 06:33:14 -0700 (PDT)
Received: from m-upc-A520M-HDV.flets-east.jp ([2400:2410:3f60:500:574b:e1a5:307b:15c5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db14ae8af3sm72564185ad.80.2026.09.09.06.33.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 06:33:14 -0700 (PDT)
Sender: Yuyang Huang <uyoko90@gmail.com>
From: Yuyang Huang <sigefriedhyy@gmail.com>
To: Yuyang Huang <sigefriedhyy@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	David Ahern <dsahern@kernel.org>,
	Donald Hunter <donald.hunter@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Ido Schimmel <idosch@nvidia.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Nicolas Dichtel <nicolas.dichtel@6wind.com>,
	Nikolaos Gkarlis <nickgarlis@gmail.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Sabrina Dubroca <sd@queasysnail.net>,
	Shuah Khan <shuah@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Stanislav Fomichev <sdf.kernel@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH net-next v3 4/4] selftests: net: test AF_PACKET multicast dumps
Date: Wed,  9 Sep 2026 22:32:47 +0900
Message-ID: <20260909133247.113923-5-sigefriedhyy@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260909133247.113923-1-sigefriedhyy@gmail.com>
References: <20260909133247.113923-1-sigefriedhyy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Dump the link-layer multicast addresses of a dummy device and verify
that ifa_index restricts the dump to that device, that the all-hosts
address joined on link up is listed without IFA_F_GLOBAL, that an
address added with SIOCADDMULTI is listed with IFA_F_GLOBAL and
IFA_MC_USERS, and that IFA_TARGET_NETNSID dumps another netns. Skip
when the kernel does not support AF_PACKET dumps.

Signed-off-by: Yuyang Huang <sigefriedhyy@gmail.com>
---
 tools/testing/selftests/net/rtnetlink.py | 71 +++++++++++++++++++++++-
 1 file changed, 68 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/net/rtnetlink.py b/tools/testing/selftests/net/rtnetlink.py
index 5cc3ebdcf08d..41da259c3a09 100755
--- a/tools/testing/selftests/net/rtnetlink.py
+++ b/tools/testing/selftests/net/rtnetlink.py
@@ -1,17 +1,21 @@
 #!/usr/bin/env python3
 # SPDX-License-Identifier: GPL-2.0
 
+import errno
 import socket
 import struct
 import time
 from lib.py import bkg, ip, ksft_exit, ksft_run, ksft_eq, ksft_ge, ksft_true, KsftSkipEx
-from lib.py import ksft_not_in, ksft_not_none
-from lib.py import CmdExitFailure, NetNS, NetNSEnter, RtnlAddrFamily, RtnlRouteFamily
+from lib.py import ksft_in, ksft_not_in, ksft_not_none
+from lib.py import CmdExitFailure, NetNS, NetNSEnter, NlError, RtnlAddrFamily, RtnlRouteFamily
 from lib.py import defer
 
 IPV4_ALL_HOSTS_MULTICAST = b'\xe0\x00\x00\x01'
 IPV4_TEST_MULTICAST = b'\xef\x01\x01\x01'
 IPV6_TEST_MULTICAST = bytes.fromhex('ff020000000000000000000000000123')
+ETH_ALL_HOSTS_MULTICAST = bytes.fromhex('01005e000001')
+ETH_TEST_MULTICAST_STR = '01:00:5e:01:01:01'
+ETH_TEST_MULTICAST = bytes.fromhex(ETH_TEST_MULTICAST_STR.replace(':', ''))
 
 
 def _users_for(rtnl: RtnlAddrFamily, family: int, grp: bytes, ifindex: int):
@@ -105,6 +109,66 @@ def dump_mcaddr6_check() -> None:
                 s2.close()
 
 
+def dump_mcaddr_l2_check() -> None:
+    """
+    Verify link-layer multicast addresses in an AF_PACKET RTM_GETMULTICAST
+    dump: the ifa-index filter, mc-users, the global flag and
+    target-netnsid.
+    """
+
+    with NetNS() as ns, NetNSEnter(str(ns)):
+        for ifname in ("dummy1", "dummy2"):
+            ip(f"link add name {ifname} type dummy")
+            ip(f"link set {ifname} up")
+        dev_idx = socket.if_nametoindex("dummy1")
+        ip(f"maddr add {ETH_TEST_MULTICAST_STR} dev dummy1")
+
+        rtnl = RtnlAddrFamily()
+        try:
+            addresses = rtnl.getmulticast(
+                {"ifa-family": socket.AF_PACKET, "ifa-index": dev_idx},
+                dump=True)
+        except NlError as e:
+            if e.error == errno.EOPNOTSUPP:
+                raise KsftSkipEx(
+                    "kernel does not support AF_PACKET multicast dump")
+            raise
+
+        # dummy2 has entries as well, only dummy1 may be listed
+        ksft_eq({addr['ifa-index'] for addr in addresses}, {dev_idx},
+                "AF_PACKET multicast dump ignored ifa-index filter")
+
+        entries = {addr['multicast']: addr for addr in addresses}
+
+        # Bringing an Ethernet device up joins 224.0.0.1, which maps
+        # to 01:00:5e:00:00:01 in the device multicast list.
+        ksft_in(ETH_ALL_HOSTS_MULTICAST, entries,
+                "dummy1 does not have the all-hosts link-layer address")
+        ksft_not_in('global', entries[ETH_ALL_HOSTS_MULTICAST]['flags'],
+                    "protocol entry is global")
+
+        ksft_in(ETH_TEST_MULTICAST, entries,
+                "dummy1 does not have the SIOCADDMULTI address")
+        ksft_eq(entries[ETH_TEST_MULTICAST]['mc-users'], 1,
+                "unexpected mc-users for the SIOCADDMULTI address")
+        ksft_in('global', entries[ETH_TEST_MULTICAST]['flags'],
+                "SIOCADDMULTI entry is not global")
+
+        # target-netnsid dumps another netns, ifa-index is relative to it
+        with NetNS() as peer:
+            ip(f"netns set {peer} 5")
+            ip("link add name dummy3 type dummy", ns=peer)
+            ip("link set dummy3 up", ns=peer)
+            peer_idx = ip("link show dummy3", json=True, ns=peer)[0]['ifindex']
+
+            addresses = rtnl.getmulticast(
+                {"ifa-family": socket.AF_PACKET, "target-netnsid": 5},
+                dump=True)
+            ksft_eq({(addr['ifa-index'], addr['target-netnsid'])
+                     for addr in addresses}, {(peer_idx, 5)},
+                    "target-netnsid did not dump the peer netns")
+
+
 def ipv4_devconf_notify() -> None:
     """
     Configure an interface and set ipv4-devconf values through netlink
@@ -315,7 +379,8 @@ def ipv6_route_del_reason_absent() -> None:
 
 
 def main() -> None:
-    ksft_run([dump_mcaddr_check, dump_mcaddr6_check, ipv4_devconf_notify,
+    ksft_run([dump_mcaddr_check, dump_mcaddr6_check, dump_mcaddr_l2_check,
+              ipv4_devconf_notify,
               ipv6_route_del_reason_expired,
               ipv6_route_del_reason_ra_withdrawn,
               ipv6_route_del_reason_absent])
-- 
2.43.0

