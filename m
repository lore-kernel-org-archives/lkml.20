Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793322456;
	b=0n3eWq9Ih/BaqqKdlesQKfzFyVzYHQmS1CfkaDqce70aD9g1kBu9aNM4/BbyLinue3pW
	 gknq+E1PVyjf0jVLsIzaQStDE/bKnRB6sKF5VSds+kKjENM+erAbMPmdLnk/z9P07ISRH
	 GJlBpur1YM51hEQnX5eF8TFVyi95BxoUW4eqJcv5w8wJCwP9coHCi3jwSVFyhyadZcdKv
	 72Bxt1iJ2HJ38GGEL7z+o344fG/3XkQbRMd66v704QGuDv0CxgB/0As6B4flyOAk21PQM
	 lkUyFbDCYjuZfGTNe6jCwlXebgv45bIVz3X6HlfqrrmXRrQl3aVKIu7O8B/qtVMkpkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793322456;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=6fFU7USKwoOoUYm2eHNkws0DlUXuX5vJXNZhU/XUlbo=;
	b=3lcHS4yhQrDEau7uV5mB40k4GRrVnRDqX3xnZC2wTz+zbNzGegcvVEG9SKbOTPSaEB/V
	 lv32QHhzU2UZVXWZuVTfJtjRKNHxNj1jgOWp+2MX9uFIMBfP1PXN7F79TfCMmklgMPTjN
	 x97ADOndDQoDmoUFA/6GHZkX1BX757gwNCBqZXFHD9U/t7WnwXc4DxOhkJBGzlHEyrSbq
	 BHqVnoutAgFRhgb+bG8770pNP3H3sFNnSbyRovYg7mpmeo2Rx/e28F8VbONGBXxxevc2z
	 dkQD4/sZ/jyicQcT2ZFti5NirYk69A9CkPkxHEboZcetH+3dKiRmgjyi25XQmzWArUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=nAH73n8w;
	arc=none smtp.remote-ip=91.218.175.175
Received: from mta0.migadu.com (out-175.mta0.migadu.com [91.218.175.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AEA9606A32A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 01:07:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2AEA9606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=nAH73n8w
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=C7sMeRv7Vj+LleXxIOZuvPJQiYFI5YODN76ahBIJeGw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793322453; v=1; x=1793927253;
 b=nAH73n8wIWwKvR1zUbVDu680A1amgTRsHjxCr/IXjqJBQm3c4vRiB5jQp+ZNOpYVzHHhQ2HG
 mq1nJ3WAWZW5/VvJX0hgxxMXKCfU2iDXz2XtR1AL+n5TEMkL4J8t2l+mYos5MRCn4WdbWENsRCb
 PzreegkG0GKp004h4OHUb6F0=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 7264c7a8e314d761;
	Fri, 30 Oct 2026 01:07:33 +0000
X-Mizu-Trace-ID: 7264c7a8e314d761
X-Migadu-Flow: FLOW_OUT
Message-ID: <c641a11c-39c8-40c4-b162-10f3a3db57ff@linux.dev>
Date: Fri, 30 Oct 2026 09:07:24 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 8/9] docs/zh_CN: update networking/xfrm/xfrm_proc.rst
 translation
To: Dongliang Mu <dzm91@hust.edu.cn>, Alex Shi <alexs@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Weijie Yuan <wy@wyuan.org>,
 Chen-Yu Yeh <chenyou910331@gmail.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261029124429.294868-1-dzm91@hust.edu.cn>
 <20261029124429.294868-9-dzm91@hust.edu.cn>
Content-Language: en-US
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <20261029124429.294868-9-dzm91@hust.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


在 2026/10/29 20:44, Dongliang Mu 写道:
> Move the XFRM proc translation to its current upstream location and
> adjust the disclaimer include. Add an XFRM chapter index and update
> the networking index to follow the English layout.
>
> Track the English xfrm_proc.rst through commit 03e23b18c720
> ("net: Move XFRM documentation into its own subdirectory").
>
> Signed-off-by: Dongliang Mu <dzm91@hust.edu.cn>
Reviewed-by: Yanteng Si <si.yanteng@linux.dev>
> ---
>   .../translations/zh_CN/networking/index.rst   | 238 +++++++++---------
>   .../zh_CN/networking/xfrm/index.rst           |  20 ++
>   .../zh_CN/networking/{ => xfrm}/xfrm_proc.rst |   4 +-
>   3 files changed, 138 insertions(+), 124 deletions(-)
>   create mode 100644 Documentation/translations/zh_CN/networking/xfrm/index.rst
>   rename Documentation/translations/zh_CN/networking/{ => xfrm}/xfrm_proc.rst (96%)
>
> diff --git a/Documentation/translations/zh_CN/networking/index.rst b/Documentation/translations/zh_CN/networking/index.rst
> index bf22d22b64db..9f28240d6b14 100644
> --- a/Documentation/translations/zh_CN/networking/index.rst
> +++ b/Documentation/translations/zh_CN/networking/index.rst
> @@ -2,8 +2,6 @@
>   
>   .. include:: ../disclaimer-zh_CN.rst
>   
> -:Original: Documentation/networking/index.rst
> -
>   :翻译:
>   
>    王亚鑫 Wang Yaxin <wang.yaxin@zte.com.cn>
> @@ -13,142 +11,140 @@
>   网络
>   ====
>   
> -有关网络设备（netdev）开发过程的详细指南，请参考：:ref:`netdev-FAQ`
> +有关网络设备（netdev）开发流程的具体指南，请参阅 :ref:`netdev-FAQ`。
>   
>   目录：
>   
>   .. toctree::
> -   :maxdepth: 1
> +   :maxdepth: 2
>   
>      msg_zerocopy
> +   alias
>      driver
> +   generic-hdlc
>      ipv6
> +   mptcp-sysctl
>      napi
> -   secid
> -   vxlan
>      netif-msg
> -   xfrm_proc
>      netmem
> -   alias
> -   mptcp-sysctl
> -   generic-hdlc
> +   secid
>      sriov
>      team
>      timestamping
> +   vxlan
> +   xfrm/index
>   
>   Todolist:
>   
> -*   af_xdp
> -*   bareudp
> -*   batman-adv
> -*   can
> -*   can_ucan_protocol
> -*   device_drivers/index
> -*   diagnostic/index
> -*   dsa/index
> -*   devlink/index
> -*   ethtool-netlink
> -*   ieee802154
> -*   iso15765-2
> -*   j1939
> -*   kapi
> -*   failover
> -*   net_dim
> -*   net_failover
> -*   page_pool
> -*   phy
> -*   sfp-phylink
> -*   bridge
> -*   snmp_counter
> -*   checksum-offloads
> -*   segmentation-offloads
> -*   scaling
> -*   tls
> -*   tls-offload
> -*   tls-handshake
> -*   nfc
> -*   6lowpan
> -*   6pack
> -*   arcnet-hardware
> -*   arcnet
> -*   atm
> -*   ax25
> -*   bonding
> -*   cdc_mbim
> -*   dccp
> -*   dctcp
> -*   devmem
> -*   dns_resolver
> -*   eql
> -*   fib_trie
> -*   filter
> -*   generic_netlink
> -*   netlink_spec/index
> -*   gen_stats
> -*   gtp
> -*   ila
> -*   ioam6-sysctl
> -*   ip_dynaddr
> -*   ipsec
> -*   ip-sysctl
> -*   ipvlan
> -*   ipvs-sysctl
> -*   kcm
> -*   l2tp
> -*   lapb-module
> -*   mac80211-injection
> -*   mctp
> -*   mpls-sysctl
> -*   mptcp
> -*   multiqueue
> -*   multi-pf-netdev
> -*   net_cachelines/index
> -*   netconsole
> -*   netdev-features
> -*   netdevices
> -*   netfilter-sysctl
> -*   nexthop-group-resilient
> -*   nf_conntrack-sysctl
> -*   nf_flowtable
> -*   oa-tc6-framework
> -*   openvswitch
> -*   operstates
> -*   packet_mmap
> -*   phonet
> -*   phy-link-topology
> -*   pktgen
> -*   plip
> -*   ppp_generic
> -*   proc_net_tcp
> -*   pse-pd/index
> -*   radiotap-headers
> -*   rds
> -*   regulatory
> -*   representors
> -*   rxrpc
> -*   sctp
> -*   seg6-sysctl
> -*   smc-sysctl
> -*   statistics
> -*   strparser
> -*   switchdev
> -*   sysfs-tagging
> -*   tc-actions-env-rules
> -*   tc-queue-filters
> -*   tcp_ao
> -*   tcp-thin
> -*   tipc
> -*   tproxy
> -*   tuntap
> -*   udplite
> -*   vrf
> -*   x25
> -*   x25-iface
> -*   xfrm_device
> -*   xfrm_sync
> -*   xfrm_sysctl
> -*   xdp-rx-metadata
> -*   xsk-tx-metadata
> +* af_xdp
> +* bareudp
> +* batman-adv
> +* can
> +* can_ucan_protocol
> +* device_drivers/index
> +* diagnostic/index
> +* dsa/index
> +* devlink/index
> +* ethtool-netlink
> +* ieee802154
> +* iso15765-2
> +* j1939
> +* kapi
> +* failover
> +* net_dim
> +* net_failover
> +* page_pool
> +* phy
> +* sfp-phylink
> +* bridge
> +* snmp_counter
> +* checksum-offloads
> +* segmentation-offloads
> +* scaling
> +* tls
> +* tls-offload
> +* tls-handshake
> +* nfc
> +* 6lowpan
> +* arcnet-hardware
> +* arcnet
> +* atm
> +* bonding
> +* cdc_mbim
> +* dctcp
> +* devmem
> +* dns_resolver
> +* eql
> +* fib_trie
> +* filter
> +* generic_netlink
> +* ../netlink/specs/index
> +* gen_stats
> +* gtp
> +* ila
> +* ioam6-sysctl
> +* iou-zcrx
> +* ip_dynaddr
> +* ipsec
> +* ip-sysctl
> +* ipvlan
> +* ipvs-sysctl
> +* kcm
> +* l2tp
> +* lapb-module
> +* mac80211-injection
> +* mctp
> +* mpls-sysctl
> +* mptcp
> +* multiqueue
> +* multi-pf-netdev
> +* net_cachelines/index
> +* netconsole
> +* netdev-features
> +* netdevices
> +* netfilter-sysctl
> +* nexthop-group-resilient
> +* nf_conntrack-sysctl
> +* nf_flowtable
> +* oa-tc6-framework
> +* openvswitch
> +* operstates
> +* packet_mmap
> +* phonet
> +* phy-link-topology
> +* phy-port
> +* pktgen
> +* plip
> +* ppp_generic
> +* proc_net_tcp
> +* pse-pd/index
> +* psp
> +* radiotap-headers
> +* rds
> +* regulatory
> +* representors
> +* rxrpc
> +* sctp
> +* seg6-sysctl
> +* skbuff
> +* smc-sysctl
> +* statistics
> +* strparser
> +* switchdev
> +* sysfs-tagging
> +* tc-actions-env-rules
> +* tc-queue-filters
> +* tcp_ao
> +* tcp-thin
> +* tipc
> +* tproxy
> +* tuntap
> +* udplite
> +* vrf
> +* x25
> +* x25-iface
> +* xdp-rx-metadata
> +* xsk-tx-metadata
>   
>   .. only::  subproject and html
>   
> diff --git a/Documentation/translations/zh_CN/networking/xfrm/index.rst b/Documentation/translations/zh_CN/networking/xfrm/index.rst
> new file mode 100644
> index 000000000000..b366c908eb25
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/networking/xfrm/index.rst
> @@ -0,0 +1,20 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +.. include:: ../../disclaimer-zh_CN.rst
> +
> +
> +=========
> +XFRM 框架
> +=========
> +
> +.. toctree::
> +   :maxdepth: 2
> +
> +   xfrm_proc
> +
> +Todolist：
> +
> +* xfrm_device
> +* xfrm_migrate_state
> +* xfrm_sync
> +* xfrm_sysctl
> diff --git a/Documentation/translations/zh_CN/networking/xfrm_proc.rst b/Documentation/translations/zh_CN/networking/xfrm/xfrm_proc.rst
> similarity index 96%
> rename from Documentation/translations/zh_CN/networking/xfrm_proc.rst
> rename to Documentation/translations/zh_CN/networking/xfrm/xfrm_proc.rst
> index a2ae86c44707..eb4ece66df49 100644
> --- a/Documentation/translations/zh_CN/networking/xfrm_proc.rst
> +++ b/Documentation/translations/zh_CN/networking/xfrm/xfrm_proc.rst
> @@ -1,8 +1,6 @@
>   .. SPDX-License-Identifier: GPL-2.0
>   
> -.. include:: ../disclaimer-zh_CN.rst
> -
> -:Original: Documentation/networking/xfrm_proc.rst
> +.. include:: ../../disclaimer-zh_CN.rst
>   
>   :翻译:
>   
