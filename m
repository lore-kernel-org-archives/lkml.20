Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794793981;
	b=bKYVRsj92hAonBm7Oz4Z9A8raY12YdJps1StLbv+In/l+klSV8XYAWjsQPbtEKfAybk2
	 cCr2x1/wXvWWsx+GAOvLrw0+upJvZ7ZpgU3RD5tpTp3vavzQxTXEZbW5OQ69RTKR3m4uA
	 +SgW9KFUSSSvsv+6yg/5bXRmzkTiJVl95o+NJSoMIANFOeoioJkFuydn3LM6ID4nqtwOt
	 9gX13ZdMHySHnWbajAcw/KGid6ZztywGVx3ehM4a8uxGPe0E3LZ0EqPjHi/BUnPdcN+cB
	 zDbcoabaV3R8tNhWLEU1m1JgvMn4ARAN2JsY5sDgbJQFUJp8PYHt2BtJAMjq+WXZSHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794793981;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=lV0jeYEYdWgnZ1AVwfJr6chKJPv2wHc1JLZtM+lmPl8=;
	b=lx8OsY77YQgW4pafVBk2F/hWghd3XGHHnje+pDXDYOKRgQMEFFzMGKa7l32aT0YiAGXi
	 UpLJh44KsURGZ+WxzEnXNFPy99rdsXXkhGa6ZefNHl+QXWB3i5zbzdw4x8NAum8U4XG8p
	 Ef64Y+Q6ZpWUt6bFvocf763EVGgemcAIvQsOl62uBJ2qejn0YISevR/260gWOdJmmDdi/
	 v9pJ3xg9H15nS5f3Xcnt3rcIdJ7i5tLfPLL1HQTUvi3OO/uqRdSPUJ9OVgCUH15tJX3ee
	 lOb7wp9CJ2p9PLXjgWrZeSoKkZo+RhH+OpuAG8h3tgAA+BdXaGwRbNhGwcwExJKQ8Rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YaS6jt2P;
	arc=none smtp.remote-ip=192.198.163.10
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76CCC606A31C;
	Mon, 16 Nov 2026 01:53:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76CCC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YaS6jt2P
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794793981; x=1826329981;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=GvbisVjMznuXLNPdJff/X1PgKNEfcxNG05qKAcZCCLs=;
  b=YaS6jt2PecezEewlE8RTi/wDsqz1rmYBkO+wBVHyd7x2PFBKF14yt2rf
   hVE27QQPGlLPPswcsVO42ZHtoPfLO0Du2uL9ZHkfdUvDjhN53HpdnSuEx
   GvBC+1p3z7nmYcliBjerqIt0Kd8izl0eExr5MYNGNEIK7+EbeJGTCwzNT
   1jo14H18zB0FrSGEfJvaK7f9jysFYLzl3czb5rSwPYC5LojNDHYE/aw8b
   qBJQK3hVPGnSXhY8ua4vDYrSOat2A6baebXaW5xWBRkC48/JoH6OjE6fM
   RIMwd98SoSGkf3JOhdgv4O5NbRagkkum/kYMIToURbKmvvVQu46v0a6mH
   Q==;
X-CSE-ConnectionGUID: 6AFclPLrSMmOEVasDkIwXg==
X-CSE-MsgGUID: aTe9y9WAQbOnt3bLWgZoFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3413950"
X-IronPort-AV: E=Sophos;i="6.27,215,1787036400"; 
   d="scan'208";a="3413950"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2026 17:53:00 -0800
X-CSE-ConnectionGUID: DxXLe+JbQKuTomeUlK9Pbw==
X-CSE-MsgGUID: SsjEDcsNRJOPeZgBXBPtVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,215,1787036400"; 
   d="scan'208";a="9218764"
Received: from linux-pnp-gnr-1.sh.intel.com ([10.239.83.186])
  by orviesa008.jf.intel.com with ESMTP; 15 Nov 2026 17:52:55 -0800
From: Jiebin Sun <jiebin.sun@intel.com>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	linux-kernel@vger.kernel.org,
	tim.c.chen@linux.intel.com,
	tianyou.li@intel.com,
	wangyang.guo@intel.com,
	jiebin.sun@intel.com
Subject: [PATCH] net: dst: Avoid false sharing between tclassid and __rcuref
Date: Mon, 16 Nov 2026 09:57:32 +0800
Message-ID: <20261116015732.2744688-1-jiebin.sun@intel.com>
X-Mailer: git-send-email 2.52.0
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

On x86-64, dst_entry::tclassid shares the same cache line with
dst_entry::__rcuref. Updates to __rcuref cause false sharing with
tclassid reads, for example in ip_rcv_finish_core() when
CONFIG_IP_ROUTE_CLASSID=y. Memcached perf c2c shows the paths:

  read:    net_rx_action -> process_backlog -> ip_rcv_finish_core
           -> skb_dst(skb)->tclassid (load)
  acquire: tcp_write_xmit -> __tcp_transmit_skb -> __dev_queue_xmit
           -> skb_dst_force -> dst_hold_safe -> rcuref_get
  release: tcp_rcv_established/tcp_add_backlog -> tcp_cleanup_skb
           -> skb_dst_drop -> dst_release -> rcuref_put

Move tclassid after lwtstate on 64-bit to avoid false sharing with
__rcuref.

On x86-64, struct dst_entry grows from 136 to 144 bytes. struct
rtable and struct rt6_info embed dst_entry, so their sizes grow
from 176 to 184 and from 224 to 232 bytes, respectively. However,
both struct rtable and struct rt6_info are allocated from slab
caches with SLAB_HWCACHE_ALIGN, so the per-object allocation sizes
remain unchanged at 192 bytes for rtable and 256 bytes for rt6_info.

Memcached perf c2c samples at the class-ID load:

  +----------+------------+-------------+
  | Kernel   | Local HITM | Remote HITM |
  +----------+------------+-------------+
  | Baseline |        894 |         680 |
  | Patched  |         15 |           0 |
  +----------+------------+-------------+

Results with 64 workers per endpoint (baseline 6628e7d4c6b2).
Improvement is 100 * (patched average / baseline average - 1).

Memcached (5 iterations, average operations/s):

  +--------------------+--------------------+
  | Case               | Improvement (%)    |
  +--------------------+--------------------+
  | default            |             +27.20 |
  | hit                |             +52.36 |
  | balanced           |              -0.52 |
  | large              |             +64.68 |
  +--------------------+--------------------+

Memcached over IPv4 loopback.
The default client command is:

  memtier_benchmark -s 127.0.0.1 -p 11221 -P memcache_text
    -t 64 -c 1 --pipeline=16 --test-time=60 --ratio=1:100
    --data-size=32 --key-maximum=10000000

  hit:              --key-maximum=1000
  balanced:         --key-maximum=1000 --ratio=1:1
  large:            --key-maximum=1000 --data-size=1024

TCP request/reply (5 iterations, average transactions/s):

  +----------------------+--------------------+
  | Case                 | Improvement (%)    |
  +----------------------+--------------------+
  | tcp4-rr              |              +1.85 |
  | ipv6-loopback-plain  |              -0.60 |
  | ipv6-loopback-expiry |              -0.24 |
  | tcp6-rr              |              -1.60 |
  +----------------------+--------------------+

64 pinned netperf clients per case, with 128-byte requests and
replies:

  tcp4-rr:              netperf -t TCP_RR -l 8 -- -r 128,128
  ipv6-loopback-plain:  netperf -6 -t TCP_RR -l 8 -- -r 128,128
  ipv6-loopback-expiry: netperf -6 -t TCP_RR -l 8 -- -r 128,128
  tcp6-rr:              netperf -6 -t TCP_RR -l 30 -- -r 128,128

Transfer (5 iterations, average received Mbit/s):

  +-------------+--------------------+
  | Case        | Improvement (%)    |
  +-------------+--------------------+
  | udp4-small  |              -0.91 |
  | udp4-frag   |              +0.41 |
  | tcp4-stream |              +0.92 |
  | udp6-small  |              -0.81 |
  | udp6-frag   |              +1.37 |
  | tcp6-stream |              +3.22 |
  | udpxfrm     |              +4.57 |
  | tcpxfrm     |              -1.23 |
  | geneve0     |              +0.49 |
  | geneve8     |              +4.28 |
  | geneve32    |              +1.53 |
  +-------------+--------------------+

64 pinned netperf clients per case. Netperf commands:

  udp4-small:  netperf -t UDP_STREAM -l 30 -- -m 512
  udp4-frag:   netperf -t UDP_STREAM -l 8 -- -m 8K
  tcp4-stream: netperf -t TCP_STREAM -l 8 -- -m 10K
  udp6-small:  netperf -6 -t UDP_STREAM -l 8 -- -m 512
  udp6-frag:   netperf -6 -t UDP_STREAM -l 8 -- -m 8K
  tcp6-stream: netperf -6 -t TCP_STREAM -l 8 -- -m 10K
  udpxfrm:     netperf -t UDP_STREAM -l 8 -- -m 8K
  tcpxfrm:     netperf -t TCP_STREAM -l 8 -- -m 10K
  geneve0:     netperf -t TCP_STREAM -l 8 -- -m 10K
  geneve8:     netperf -t TCP_STREAM -l 8 -- -m 10K
  geneve32:    netperf -t TCP_STREAM -l 30 -- -m 10K

Suggested-by: Tim Chen <tim.c.chen@linux.intel.com>
Reviewed-by: Tianyou Li <tianyou.li@intel.com>
Reviewed-by: Wangyang Guo <wangyang.guo@intel.com>
Signed-off-by: Jiebin Sun <jiebin.sun@intel.com>
---
 include/net/dst.h | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/include/net/dst.h b/include/net/dst.h
index dbedfe72e1fd..f01cfb42f97c 100644
--- a/include/net/dst.h
+++ b/include/net/dst.h
@@ -76,17 +76,17 @@ struct dst_entry {
 	struct rcu_head		rcu_head;
 	short			error;
 	short			__pad;
-	__u32			tclassid;
 #ifndef CONFIG_64BIT
+	__u32			tclassid;
 	struct lwtunnel_state   *lwtstate;
 	rcuref_t		__rcuref;	/* 32-bit offset 64 */
 #endif
 	netdevice_tracker	dev_tracker;
 
 	/*
-	 * Used by rtable and rt6_info. Moves lwtstate into the next cache
-	 * line on 64bit so that lwtstate does not cause false sharing with
-	 * __rcuref under contention of __rcuref. This also puts the
+	 * Used by rtable and rt6_info. Moves lwtstate and tclassid into the
+	 * next cache line on 64bit so that they do not cause false sharing
+	 * with __rcuref under contention of __rcuref. This also puts the
 	 * frequently accessed members of rtable and rt6_info out of the
 	 * __rcuref cache line.
 	 */
@@ -94,6 +94,7 @@ struct dst_entry {
 	struct uncached_list	*rt_uncached_list;
 #ifdef CONFIG_64BIT
 	struct lwtunnel_state   *lwtstate;
+	__u32			tclassid;
 #endif
 };
 
-- 
2.52.0

