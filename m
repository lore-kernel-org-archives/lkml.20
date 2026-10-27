Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=207.46.229.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793096785;
	b=YZ2hukn72UTwb3cPS4B4AaxV9UJgmoeNZylSgPHgP9PMEvoARNNt49kj3ljlRDk5y9WP
	 aElIaFMVNleD4HjrSeAyqW5+luij1Rh2exYfmIJd44RC/f7iL/Flazj1DzKKJUlgoWqum
	 wOHeI87bwM/MLg94ix9NbPFe/JT/b5QpyNitfgVos0BMyWx4s/W3qtl0CW6PIbxkMXb+U
	 gtHqcl9kN3rjPHI1VGlFa/7vWChMdyIM/Ykii3J+6sXOsNkUp9LcO6KsENchMxytBN1Kj
	 20JKXZm6UO17K0SoqSOSGX75fX9SeinS4Ebn+E35oPxlLYNkReV9OQf6LAFpbVlKwWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793096785;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=Ji97ndRb0L85uvtFbDoAT0Doj9OLhT3C76ZLow53MNM=;
	b=I/5THrtHUL+Fuyg5WRnGKCKp879/D8i1jrEZvUvYBvassVep4OMxYrGHz/aMKVmlCKBY
	 JBfURWdFhB93X9aumn0Wdqs+q/SMV6ITtmBht5WC0IIpIT4HXXfmU14vDWuEql8aubWJr
	 r3F65c8KF+XIsjGWEFoLlrsnHa7khuluLBje3tbiBZd2QfRKdr1Rr7c1rp/y5cpGqoJQD
	 QbhLs8qJW+vFZ2t418Q43vuquhzf2WvEM4JGBitLnaK6hc5IUtn3MxOG0L1EqwrvzmTQT
	 O1I1Km7rktHOO33C6mi4uWA7sYRHlcxA59PSR6IPJ/V75dDQIj+qZxO99rngv/ZLYuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=hust.edu.cn;
	spf=pass smtp.mailfrom=hust.edu.cn;
	arc=none smtp.remote-ip=207.46.229.174
Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [207.46.229.174])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F160660A2607;
	Tue, 27 Oct 2026 10:26:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F160660A2607
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.50])
	by app2 (Coremail) with UTF8SMTP id IQEQrMDW_ndMfOBqWDZfAA--.51543S2;
	Tue, 27 Oct 2026 18:26:20 +0800 (CST)
Received: from mudongliang-PC.tailb307d0.ts.net (unknown [10.12.191.55])
	by gateway (Coremail) with SMTP id _____wDXseYwfOBq0WPDAA--.19105S10;
	Tue, 27 Oct 2026 18:26:18 +0800 (CST)
From: Dongliang Mu <dzm91@hust.edu.cn>
To: Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 8/9] docs/zh_CN: update networking/xfrm/xfrm_proc.rst translation
Date: Tue, 27 Oct 2026 18:25:51 +0800
Message-ID: <20261027102552.3801595-9-dzm91@hust.edu.cn>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261027102552.3801595-1-dzm91@hust.edu.cn>
References: <20261027102552.3801595-1-dzm91@hust.edu.cn>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:IQEQrMDW_ndMfOBqWDZfAA--.51543S2
Authentication-Results: app2; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvJXoW3AF4UtFyfWFW8tF1kCFykXwb_yoWxXr4UpF
	48KryfKF48C3Wakw48Gr1UGF18Ka1xCanFkF17Jw10qr1kJrWYkrsxK39IkFyxGrWSkFW5
	XanrKrW5uryjyFJanT9S1TB71UUUUjDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUHFb7Iv0xC_Cr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
	v20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1l84ACjcxK
	6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1ln4kS14v26r
	126r1DM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI
	12xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj64x0Y40En7xvr7AKxV
	W8Jr0_Cr1UMcIj6x8ErcxFaVAv8VW8uFyUJr1UMcIj6xkF7I0En7xvr7AKxVW8Jr0_Cr1U
	McvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY1x0262kKe7AKxVWUAVWUtw
	CY02Avz4vE-syl42xK82IYc2Ij64vIr41l42xK82IY6x8ErcxFaVAv8VW8uFyUJr1UMxC2
	0s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r126r1DMI8I3I0E5I8CrVAFwI0_Jr
	0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0E
	wIxGrwCI42IY6xIIjxv20xvE14v26F1j6w1UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWxJV
	W8Jr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26F4j6r4UJwCI
	42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUVYhFDUUUU
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/

Move the XFRM proc translation to its current upstream location and
adjust the disclaimer include. Add an XFRM chapter index and update
the networking index to follow the English layout.

Track the English xfrm_proc.rst through commit 03e23b18c720
("net: Move XFRM documentation into its own subdirectory").

Signed-off-by: Dongliang Mu <dzm91@hust.edu.cn>
---
 .../translations/zh_CN/networking/index.rst   | 238 +++++++++---------
 .../zh_CN/networking/xfrm/index.rst           |  20 ++
 .../zh_CN/networking/{ => xfrm}/xfrm_proc.rst |   4 +-
 3 files changed, 138 insertions(+), 124 deletions(-)
 create mode 100644 Documentation/translations/zh_CN/networking/xfrm/index.rst
 rename Documentation/translations/zh_CN/networking/{ => xfrm}/xfrm_proc.rst (96%)

diff --git a/Documentation/translations/zh_CN/networking/index.rst b/Documentation/translations/zh_CN/networking/index.rst
index bf22d22b64db..9f28240d6b14 100644
--- a/Documentation/translations/zh_CN/networking/index.rst
+++ b/Documentation/translations/zh_CN/networking/index.rst
@@ -2,8 +2,6 @@
 
 .. include:: ../disclaimer-zh_CN.rst
 
-:Original: Documentation/networking/index.rst
-
 :翻译:
 
  王亚鑫 Wang Yaxin <wang.yaxin@zte.com.cn>
@@ -13,142 +11,140 @@
 网络
 ====
 
-有关网络设备（netdev）开发过程的详细指南，请参考：:ref:`netdev-FAQ`
+有关网络设备（netdev）开发流程的具体指南，请参阅 :ref:`netdev-FAQ`。
 
 目录：
 
 .. toctree::
-   :maxdepth: 1
+   :maxdepth: 2
 
    msg_zerocopy
+   alias
    driver
+   generic-hdlc
    ipv6
+   mptcp-sysctl
    napi
-   secid
-   vxlan
    netif-msg
-   xfrm_proc
    netmem
-   alias
-   mptcp-sysctl
-   generic-hdlc
+   secid
    sriov
    team
    timestamping
+   vxlan
+   xfrm/index
 
 Todolist:
 
-*   af_xdp
-*   bareudp
-*   batman-adv
-*   can
-*   can_ucan_protocol
-*   device_drivers/index
-*   diagnostic/index
-*   dsa/index
-*   devlink/index
-*   ethtool-netlink
-*   ieee802154
-*   iso15765-2
-*   j1939
-*   kapi
-*   failover
-*   net_dim
-*   net_failover
-*   page_pool
-*   phy
-*   sfp-phylink
-*   bridge
-*   snmp_counter
-*   checksum-offloads
-*   segmentation-offloads
-*   scaling
-*   tls
-*   tls-offload
-*   tls-handshake
-*   nfc
-*   6lowpan
-*   6pack
-*   arcnet-hardware
-*   arcnet
-*   atm
-*   ax25
-*   bonding
-*   cdc_mbim
-*   dccp
-*   dctcp
-*   devmem
-*   dns_resolver
-*   eql
-*   fib_trie
-*   filter
-*   generic_netlink
-*   netlink_spec/index
-*   gen_stats
-*   gtp
-*   ila
-*   ioam6-sysctl
-*   ip_dynaddr
-*   ipsec
-*   ip-sysctl
-*   ipvlan
-*   ipvs-sysctl
-*   kcm
-*   l2tp
-*   lapb-module
-*   mac80211-injection
-*   mctp
-*   mpls-sysctl
-*   mptcp
-*   multiqueue
-*   multi-pf-netdev
-*   net_cachelines/index
-*   netconsole
-*   netdev-features
-*   netdevices
-*   netfilter-sysctl
-*   nexthop-group-resilient
-*   nf_conntrack-sysctl
-*   nf_flowtable
-*   oa-tc6-framework
-*   openvswitch
-*   operstates
-*   packet_mmap
-*   phonet
-*   phy-link-topology
-*   pktgen
-*   plip
-*   ppp_generic
-*   proc_net_tcp
-*   pse-pd/index
-*   radiotap-headers
-*   rds
-*   regulatory
-*   representors
-*   rxrpc
-*   sctp
-*   seg6-sysctl
-*   smc-sysctl
-*   statistics
-*   strparser
-*   switchdev
-*   sysfs-tagging
-*   tc-actions-env-rules
-*   tc-queue-filters
-*   tcp_ao
-*   tcp-thin
-*   tipc
-*   tproxy
-*   tuntap
-*   udplite
-*   vrf
-*   x25
-*   x25-iface
-*   xfrm_device
-*   xfrm_sync
-*   xfrm_sysctl
-*   xdp-rx-metadata
-*   xsk-tx-metadata
+* af_xdp
+* bareudp
+* batman-adv
+* can
+* can_ucan_protocol
+* device_drivers/index
+* diagnostic/index
+* dsa/index
+* devlink/index
+* ethtool-netlink
+* ieee802154
+* iso15765-2
+* j1939
+* kapi
+* failover
+* net_dim
+* net_failover
+* page_pool
+* phy
+* sfp-phylink
+* bridge
+* snmp_counter
+* checksum-offloads
+* segmentation-offloads
+* scaling
+* tls
+* tls-offload
+* tls-handshake
+* nfc
+* 6lowpan
+* arcnet-hardware
+* arcnet
+* atm
+* bonding
+* cdc_mbim
+* dctcp
+* devmem
+* dns_resolver
+* eql
+* fib_trie
+* filter
+* generic_netlink
+* ../netlink/specs/index
+* gen_stats
+* gtp
+* ila
+* ioam6-sysctl
+* iou-zcrx
+* ip_dynaddr
+* ipsec
+* ip-sysctl
+* ipvlan
+* ipvs-sysctl
+* kcm
+* l2tp
+* lapb-module
+* mac80211-injection
+* mctp
+* mpls-sysctl
+* mptcp
+* multiqueue
+* multi-pf-netdev
+* net_cachelines/index
+* netconsole
+* netdev-features
+* netdevices
+* netfilter-sysctl
+* nexthop-group-resilient
+* nf_conntrack-sysctl
+* nf_flowtable
+* oa-tc6-framework
+* openvswitch
+* operstates
+* packet_mmap
+* phonet
+* phy-link-topology
+* phy-port
+* pktgen
+* plip
+* ppp_generic
+* proc_net_tcp
+* pse-pd/index
+* psp
+* radiotap-headers
+* rds
+* regulatory
+* representors
+* rxrpc
+* sctp
+* seg6-sysctl
+* skbuff
+* smc-sysctl
+* statistics
+* strparser
+* switchdev
+* sysfs-tagging
+* tc-actions-env-rules
+* tc-queue-filters
+* tcp_ao
+* tcp-thin
+* tipc
+* tproxy
+* tuntap
+* udplite
+* vrf
+* x25
+* x25-iface
+* xdp-rx-metadata
+* xsk-tx-metadata
 
 .. only::  subproject and html
 
diff --git a/Documentation/translations/zh_CN/networking/xfrm/index.rst b/Documentation/translations/zh_CN/networking/xfrm/index.rst
new file mode 100644
index 000000000000..b366c908eb25
--- /dev/null
+++ b/Documentation/translations/zh_CN/networking/xfrm/index.rst
@@ -0,0 +1,20 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. include:: ../../disclaimer-zh_CN.rst
+
+
+=========
+XFRM 框架
+=========
+
+.. toctree::
+   :maxdepth: 2
+
+   xfrm_proc
+
+Todolist：
+
+* xfrm_device
+* xfrm_migrate_state
+* xfrm_sync
+* xfrm_sysctl
diff --git a/Documentation/translations/zh_CN/networking/xfrm_proc.rst b/Documentation/translations/zh_CN/networking/xfrm/xfrm_proc.rst
similarity index 96%
rename from Documentation/translations/zh_CN/networking/xfrm_proc.rst
rename to Documentation/translations/zh_CN/networking/xfrm/xfrm_proc.rst
index a2ae86c44707..eb4ece66df49 100644
--- a/Documentation/translations/zh_CN/networking/xfrm_proc.rst
+++ b/Documentation/translations/zh_CN/networking/xfrm/xfrm_proc.rst
@@ -1,8 +1,6 @@
 .. SPDX-License-Identifier: GPL-2.0
 
-.. include:: ../disclaimer-zh_CN.rst
-
-:Original: Documentation/networking/xfrm_proc.rst
+.. include:: ../../disclaimer-zh_CN.rst
 
 :翻译:
 
-- 
2.51.0

