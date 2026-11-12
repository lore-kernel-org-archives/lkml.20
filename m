Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794444446;
	b=hCf6L6sKzj01A+8r0IOfWMQsFg3SvOi2qPoJU4/63huEZFP/9JIr2/HSdkiHiqdnWHNq
	 FL5JzWHLBvZAq1rays37X88UwSDelxF7dAjqNsbH1FGP52ZSPXm8LVYV1JgSKFxBbUhsn
	 FMWwHJCbdC7xBc5CQgY7eUXVYROeE5j6OSc0QQtl+nmie4TytUPxhI/SfMt18BFEWu55O
	 MG/GwkAxgEDi08LAa55992dkgaDWCV/t3FnPINS8/9osQfCr5MN2GYaluw/bz8oSemxpw
	 oTpjfLK6Y2ATPvHvRoWjD50XMGBMwhHHYUUQDAmIQK2gYdOmC2Swn+Em1k5Cxicecaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794444446;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=/meX34FFjvsBjwEFSiF7h2pMrlZOIlpgdM74rS/8GJs=;
	b=KNCQfCGyKMgAANei869NX0SQStFygxsLtE375NOAhy6qLFSprtZq1S4UHXTIVrtBWWla
	 BtetPmRjc7G1Mv7IaCzKZgx1Q0M4A4p+8feKMVN9EgYPQ4advsDBm2pNB/5ywFQqAqmid
	 6pInde9CYf9dFSQKboVmWNWBj821PUqedQElHCI7RqQWXgwAyPe2mBPMnWTlr7FwSDSBg
	 Z6vmugUM1GGojkRskyIFVvbXaU/IC1tRfiuz7q4bibCJRWV5ROemWmk+eHJ6a7aCL7Xlb
	 PBwLvzeQG53XSdvQ62CeEatEzUrrSYtaoqYMh3xk4eoIZgyrVtxLzl2jEzAcLwTsNVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=c5tECsEz;
	arc=none smtp.remote-ip=95.215.58.197
Received: from mta1.migadu.com (out-197.mta1.migadu.com [95.215.58.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 374E160A3821
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 00:47:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 374E160A3821
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=c5tECsEz
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=fMSPfR8xyIbF4ge2e/H/gRNwNJPj7Dk9rRNiQdhWwhY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794444443; v=1; x=1795049243;
 b=c5tECsEzcVpY0zNvO3yky12+P2vnJ9u9wB+JEUAUgXq9umTxM7Q2GY9Q0Irv+lFRohwQOLB9
 ww9lzmfDlag+xxB+sr/SWygRH2ulL3R0seuVpN9rJ/YGhDnrKtLYrHvPcjIWPyHOtzSmiUez3a0
 P+XmAYdfetd8/8xz3wwVFNhM=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id a465595a3c07692d;
	Thu, 12 Nov 2026 00:47:23 +0000
X-Mizu-Trace-ID: a465595a3c07692d
X-Migadu-Flow: FLOW_OUT
Date: Thu, 12 Nov 2026 08:47:13 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: Wenbo Sun <sunwenbo@cmss.chinamobile.com>
Cc: David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Yuyang Huang <yuyanghuang@google.com>,
	Nicolas Dichtel <nicolas.dichtel@6wind.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, 1342116488@qq.com
Subject: Re: [PATCH net] ipv4: igmp: report IFA_TARGET_NETNSID in multicast
 address dumps
Message-ID: <avUMkYmCtkwNYf8_@fedora>
References: <20261111082222.327963-1-sunwenbo@cmss.chinamobile.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261111082222.327963-1-sunwenbo@cmss.chinamobile.com>

On Wed, Nov 11, 2026 at 04:22:22PM +0800, Wenbo Sun wrote:
> Commit eb4e17a1d915 ("netlink: support dumping IPv4 multicast addresses")
> extended RTM_GETMULTICAST to support dumping IPv4 multicast addresses.
> While inet_valid_dump_ifaddr_req() accepts IFA_TARGET_NETNSID in dump
> requests and dumps addresses from the target network namespace,
> inet_fill_ifmcaddr() never puts IFA_TARGET_NETNSID in the netlink
> replies.
> 
> As a result, userspace applications querying multicast addresses in a
> target netns receive entries without IFA_TARGET_NETNSID, which may lead
> them to conclude that the kernel does not support netns-targeted dumps
> or to misattribute the returned addresses. In contrast, IPv4 unicast
> address dumps (inet_fill_ifaddr()), IPv6 multicast address dumps
> (inet6_fill_ifmcaddr()), and AF_PACKET multicast address dumps all
> report IFA_TARGET_NETNSID.
> 
> Add IFA_TARGET_NETNSID to inet_fill_ifmcaddr() when requested, and
> explicitly set fillargs.netnsid = -1 in inet_ifmcaddr_notify() to
> prevent notification messages from exceeding their preallocated skb
> size.
> 
> This issue was identified with the assistance of an LLM-based code
> review tool, confirmed by reproducing in a User-Mode Linux (UML)
> environment where AF_INET RTM_GETMULTICAST dumps with IFA_TARGET_NETNSID
> omitted the attribute, and verified in UML that AF_INET multicast dumps
> now report IFA_TARGET_NETNSID, normal dumps without netnsid continue to
> work, and socket multicast join/leave notifications succeed without
> warning.
> 
> Fixes: eb4e17a1d915 ("netlink: support dumping IPv4 multicast addresses")

I don't think this should be fix. Maybe consider this as a new feature and
target to net-next?

Thanks
Hangbin
> Signed-off-by: Wenbo Sun <sunwenbo@cmss.chinamobile.com>
> ---
>  net/ipv4/igmp.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/net/ipv4/igmp.c b/net/ipv4/igmp.c
> index 144fca158adc..831d003677ba 100644
> --- a/net/ipv4/igmp.c
> +++ b/net/ipv4/igmp.c
> @@ -1517,6 +1517,12 @@ int inet_fill_ifmcaddr(struct sk_buff *skb, struct net_device *dev,
>  	ifm->ifa_scope = RT_SCOPE_UNIVERSE;
>  	ifm->ifa_index = dev->ifindex;
>  
> +	if (args->netnsid >= 0 &&
> +	    nla_put_s32(skb, IFA_TARGET_NETNSID, args->netnsid)) {
> +		nlmsg_cancel(skb, nlh);
> +		return -EMSGSIZE;
> +	}
> +
>  	ci.cstamp = (READ_ONCE(im->mca_cstamp) - INITIAL_JIFFIES) * 100UL / HZ;
>  	ci.tstamp = ci.cstamp;
>  	ci.ifa_prefered = INFINITY_LIFE_TIME;
> @@ -1538,6 +1544,7 @@ static void inet_ifmcaddr_notify(struct net_device *dev,
>  {
>  	struct inet_fill_args fillargs = {
>  		.event = event,
> +		.netnsid = -1,
>  	};
>  	struct net *net = dev_net(dev);
>  	struct sk_buff *skb;
> -- 
> 2.33.0
> 

