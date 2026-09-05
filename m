Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 214F43DD87A
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 09:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788601197; cv=none; b=M/gK5XW8w0h6IBCgzbUCWlpmsuTBuXAZjsVahV0InqU7/AOXGrx1qWWyM8W4rwos6qJjmAgBbrZk8PPRVbL42ke1rOUo3PPxry2coZ5eGYxMzsoyHPXJ6HV1bVqfzfzobp26bF74y8AJi+9UQabjlCxSPsdqJip7AxuywGN7kY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788601197; c=relaxed/simple;
	bh=8PyIgh0sL1ujfxgcdMkLoGO4mkPKg8GqTTZBkBw4pYg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cdwEuLIh2ALZuWYhplbO7Q+XmRajITG+QFfd2NZNzH9e5lAyL6f9d0AYGgtc/NKOXwmWUp+vuPUQr1GMmAIoPzImssIKmcwcgNwmwHQCMpCD7JNsyMzQs7FDf5EQOI9P1ri+RptHqlMql8JkJ9wAIk3SRQ5SmSfg56JhKWEnWL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jQ+5kfM9; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jQ+5kfM9"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2d91ff7d9acso16057195ad.3
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 02:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788601193; x=1789205993; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uwjXdJ9yHMPf8cuJfw2JqkCHRNV8vSE7ZQQojK6Bpag=;
        b=jQ+5kfM9v017KBogo1YJa0gS3wfwCbID3CBJpJBP9XyJopf/88uSiMEFRPDUesBXlN
         CK35yyAbpZSv3GGs/9wK4GBg0oU7JGlydWMztxoEJcFrKpDh3XlXNFCqEE5I/O8CsD/a
         Wfue10jOKmxuT6S9WZadeCLZxQyQWWK3zuqdk1P/bSFHQ314Nvh/k+SmcT83jes4qudd
         uD55Le05dLkf2kpfMbZkUph9uNqENo86rEIl5BGBFXIQgdlNX2R9/qSJmgSa4DWFPn0V
         w/2pkpYORa5rtZ3KKM/z1M2xRNd8RbV/YX/Kdqek9N7rqDudFwqyZ5rR80CI6tpVXVGu
         0MHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788601193; x=1789205993;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uwjXdJ9yHMPf8cuJfw2JqkCHRNV8vSE7ZQQojK6Bpag=;
        b=rHeN1poBhI/jLWLZkVhCL+J0j1pOuKPOUJ7pNlkwl5/Xwr1J5Q+yhTFdQOphtXoGvc
         4fv5NbmJ8hAiOoai1hpwJvh0LVn7SCrulr6Q3lI15YwaKVNBfo7RWLNnosK24o3Gx1ws
         pLxkp0sT5w9fZlrlUwtqjDBcC0GGSGJmrBL7UtFTzyPOxgkSseZI03RHeN5xqucU35Un
         TsCEccVsMS35F2QQcp+EiMPX0mH8PwMctnzhW1OW6i3Wga9niXyVqgKVr44qsBOwfvdD
         Caz7Qp+3cRNkDP+uLuybFNLPsiwfyMvCSC8CxfJuen3rZuqHw03ctU5vgcDCDwjJ49D+
         yIzA==
X-Forwarded-Encrypted: i=1; AKwUvBxDpitIXjhtfLWCqZmSzVJ/yQlSpY8v+4CehL0/y5jLC7nIkbKruNhmrw97tmeFiEhs9mjzQ8gB18Y7IWU=@vger.kernel.org
X-Gm-Message-State: AFuF++nUkLQk6Aosoj+5Hvj5rdogswnTTb97lNszZS9dbYCplCUVTcqx
	xntoKeIDWuMhtfBC+k8UUxAwaMgNxFff4kVVYECsbcAqmzvo60Ye9JcX
X-Gm-Gg: AYBFou24/Vlnw3FhwBDuFFdHoyKksF4/ZeM8qi/YQkYDGnLOBJKECVG+BtCzpeB36W+
	WLeHaA4VvOF2wOUzcPn1MA4sT8ZupSGQWJQmuXSFlPUJLEPjCFyjG+1v4IjTcyY5+f/ps47+BQG
	vO2PvqM6HfkekkUr+Ft7qzQeXAQ6MUi81zpx/O2SAPT1twDQCUNd3hGdo9wDUEftxrjvzzSbk3T
	tc/3OFYJLHRlHJNYL35AemcJzVMPSmbd/txvSB7HrPRzWI4m7dZBaE84fCzKks+JLAhRgXjm8dp
	/IVEWI5Ds8+mvW2sAXvuNHusSBWtNkGMWe4XBkB082zT9rWsZV+C9QslOVnkeSrL6wWEfv+KnTM
	AV3QbfZimflkTBYU2xq/W5kbIpgesaT04iof9vKm1mtx4CIsbtDn71yVT5C9aUK/xw8YNc2oyks
	PfG4dXsky+vuQsQOprqm9Aq5kwCdVj5DknirmACBgeKma5kvqT7j4R4aIUMbDI6jU1/cJq7HMTF
	ObGq9XJ3xWoD6nlF/IHj8ELFILTClry4UKIFck=
X-Received: by 2002:a17:903:886:b0:2d6:ccc5:a3dd with SMTP id d9443c01a7336-2db1232f69dmr109810885ad.4.1788601193200;
        Sat, 05 Sep 2026 02:39:53 -0700 (PDT)
Received: from m-upc-A520M-HDV.lan ([2400:2410:3f60:500:dbc1:ef89:4dd5:b812])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db1495a0c0sm20393745ad.17.2026.09.05.02.39.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 02:39:52 -0700 (PDT)
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
	Nikolaos Gkarlis <nickgarlis@gmail.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Sabrina Dubroca <sd@queasysnail.net>,
	Shuah Khan <shuah@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Stanislav Fomichev <sdf.kernel@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH net-next 3/3] selftests: net: test AF_PACKET multicast dumps
Date: Sat,  5 Sep 2026 18:39:32 +0900
Message-ID: <20260905093932.43726-4-sigefriedhyy@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260905093932.43726-1-sigefriedhyy@gmail.com>
References: <20260905093932.43726-1-sigefriedhyy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Dump the link-layer multicast addresses of a dummy device and verify
that ifa_index restricts the dump to that device, that the all-hosts
address joined on link up is listed without IFA_F_PERMANENT and that an
address added with SIOCADDMULTI is listed with IFA_F_PERMANENT and
IFA_MC_USERS. Skip when the kernel does not support AF_PACKET dumps.

Signed-off-by: Yuyang Huang <sigefriedhyy@gmail.com>
---
 tools/testing/selftests/net/rtnetlink.py | 58 ++++++++++++++++++++++--
 1 file changed, 55 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/net/rtnetlink.py b/tools/testing/selftests/net/rtnetlink.py
index 5cc3ebdcf08d..94340dac0e21 100755
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
@@ -105,6 +109,53 @@ def dump_mcaddr6_check() -> None:
                 s2.close()
 
 
+def dump_mcaddr_l2_check() -> None:
+    """
+    Verify link-layer multicast addresses in an AF_PACKET RTM_GETMULTICAST
+    dump: the ifa-index filter, mc-users and the permanent flag.
+    """
+
+    with NetNS() as ns:
+        with NetNSEnter(str(ns)):
+            for ifname in ("dummy1", "dummy2"):
+                ip(f"link add name {ifname} type dummy")
+                ip(f"link set {ifname} up")
+            dev_idx = socket.if_nametoindex("dummy1")
+            ip(f"maddr add {ETH_TEST_MULTICAST_STR} dev dummy1")
+
+            rtnl = RtnlAddrFamily()
+            try:
+                addresses = rtnl.getmulticast(
+                    {"ifa-family": socket.AF_PACKET, "ifa-index": dev_idx},
+                    dump=True)
+            except NlError as e:
+                if e.error == errno.EOPNOTSUPP:
+                    raise KsftSkipEx(
+                        "kernel does not support AF_PACKET multicast dump")
+                raise
+
+            # dummy2 has entries as well, only dummy1 may be listed
+            ksft_eq({addr['ifa-index'] for addr in addresses}, {dev_idx},
+                    "AF_PACKET multicast dump ignored ifa-index filter")
+
+            entries = {addr['multicast']: addr for addr in addresses}
+
+            # Bringing an Ethernet device up joins 224.0.0.1, which maps
+            # to 01:00:5e:00:00:01 in the device multicast list.
+            ksft_in(ETH_ALL_HOSTS_MULTICAST, entries,
+                    "dummy1 does not have the all-hosts link-layer address")
+            ksft_not_in('permanent',
+                        entries[ETH_ALL_HOSTS_MULTICAST]['ifa-flags'],
+                        "protocol entry is permanent")
+
+            ksft_in(ETH_TEST_MULTICAST, entries,
+                    "dummy1 does not have the SIOCADDMULTI address")
+            ksft_eq(entries[ETH_TEST_MULTICAST]['mc-users'], 1,
+                    "unexpected mc-users for the SIOCADDMULTI address")
+            ksft_in('permanent', entries[ETH_TEST_MULTICAST]['ifa-flags'],
+                    "SIOCADDMULTI entry is not permanent")
+
+
 def ipv4_devconf_notify() -> None:
     """
     Configure an interface and set ipv4-devconf values through netlink
@@ -315,7 +366,8 @@ def ipv6_route_del_reason_absent() -> None:
 
 
 def main() -> None:
-    ksft_run([dump_mcaddr_check, dump_mcaddr6_check, ipv4_devconf_notify,
+    ksft_run([dump_mcaddr_check, dump_mcaddr6_check, dump_mcaddr_l2_check,
+              ipv4_devconf_notify,
               ipv6_route_del_reason_expired,
               ipv6_route_del_reason_ra_withdrawn,
               ipv6_route_del_reason_absent])
-- 
2.43.0

