Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 809164E0204
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 07:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790061658; cv=none; b=LMDrOAocIPHAblngFI/lvkfQi5RDkJC59eswWYzHzY5RxujCQUZfjV1T086IcjRnqpZFjBkS7d6oiHbMS5zIGsRe3DrE8PVhQxHMbiIJgB+p8Y1nthQgxGBMn+iJkP2Mo+2n+xDrwhZZHWUsnNdnjVS+de+tXz2VPgKgGukgjA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790061658; c=relaxed/simple;
	bh=10RDo6pI6/kJp7qD1fMiEoFTLh9Au6iPRGUYSIZyAiM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Uub1oS7cglZC2PVg9y9jr0EkxYNDDoCogbiXfxBvK3W0JBKKh1NbypeUsB5vtLIHDfxNNkg1bymRHlP3z3OcCqFBBTKnZ7VW5FPxs0gjty4T2lZ4fpFN0qC48R9A42D3uwzowD1ngnJ5imU8X5SAjJctEBWLF+MPZU1tBGS/HMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com; spf=pass smtp.mailfrom=6wind.com; dkim=pass (2048-bit key) header.d=6wind.com header.i=@6wind.com header.b=eaHZl6Uh; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=6wind.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=6wind.com header.i=@6wind.com header.b="eaHZl6Uh"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843971bdd0so18213f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 00:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=6wind.com; s=google; t=1790061649; x=1790666449; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=g4C2uf6Qrn8VOGWC8Z+vk/tqYQhzm5UvtTABxtwlWxY=;
        b=eaHZl6Uhql5Y1aCN3EK6WTcTrus4Gkf5XnH2xUCXmduRQk1ppyfFwv+dRgtJUkYdOv
         IBdedv96JmzScNiWeWcsxToQrrFwVL8FaqgiDF9iKZJW0sKdaV+oAyDutXUHOROQfNDI
         NNjl4k/YHdTkBO9y0sNvevsS6NngBF9YjiPvs2REwa3QQvxME0ZcZ0tMsr+VwGdVk/Hh
         mUjpMQ1SZuex0D96+zf+IQ9msAksEz6IOXbkYLRSsX8+a7y6IRPyKnsxkQscm8slcP3h
         rYpiHQGTjhNTZ0ZKsibU2HJBlMbDxwUGwqEUATRqZK0uG3BJai9lgK6hypmt+q8wyZ5K
         NrqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790061649; x=1790666449;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=g4C2uf6Qrn8VOGWC8Z+vk/tqYQhzm5UvtTABxtwlWxY=;
        b=c67MYuuos20tRzFD238iLb5N1cOO6k+G37mybmMVsHPcfPMaSDY5BKB3kKoYXxC1cJ
         hjLYOM7FlCCBM2YJ5aiZO/NXpe/pAH7uJhq9N48oa1RM7mdlNrC1kJrUf71nMWn7DXat
         CorN/FWQ5Ooe5tdfntOlO9hlvgVIBARiNN6hevN82D37aP8p+1pohUJBYpZ0qCSy0lyd
         sGowRK4Yl8zLgz/5m6iSfvi5EXER/qz2Q05hG4UAGSzIPKPQjIVn4fA/CnrxOb44XOfk
         NcT27SdZkKBY+3DjeC/Vv2Z42LPKCgjOW1BKllNQm78c1WvxY/z/gBl7UTrFmKxLhSvU
         dICg==
X-Forwarded-Encrypted: i=1; AKwUvBzPm0aWMiivvvOb9F8Ax4HWQtPKQxO3EUkcF92D9F0xYMlXZRIjLyrX9GGmlQ4NDIM2fBLgWwLogtFZLcw=@vger.kernel.org
X-Gm-Message-State: AFuF++lUJrHPkDlgj0xymL2nIrgRRiQABtznC2wv+VgBILjmn/Y2t3e2
	HhehCkcvNkTWqYaNteQdLxXPAjNzU/efG4u0aIYiEHY8WxVc//ex6Je0YOFWsrQBBnE=
X-Gm-Gg: AYBFou1hv45ZyRC2d+IBE8XmLQSiTEvWk9N3Hx6crHVUHHFBpV8Z30R4I7Y5n4Mugck
	CZhQc32hbsyckS4IyUJXxHbGQHg3K6qU14aRicjCJpqlWiF/petrAPyxIHP9BrlQIJgfwk1hKNn
	NZqrAlNehumFzTY9bqSQGG9Rm1mK+7sxvgGP/kNNL9XamZ2Ybhzg1u0qAxr3hag1deGKTqMU47e
	heUwvAjt9e5F7ku4ptyIMZ9Al4zTiUMgFs/DbUMvhcoshJQpJ3ORm54p6Qq7Va3Ca9e6zGqCvj9
	9AK8b0GPawr53zshFq2S4rwjV62Gb4baoFpPkFwQzRIxqW7/zgL2ZWKZk/J6lUP+EopV/bCVA9B
	l1gq7TolzEx5yMlgNbIcF5zNC+P11tFhMWmxyMJME6G/7wMnK0E+A6H4HoDXIS4dRZtNteB3h2Z
	OaV8QRwu5hU8Wj7fJTADhRXI1qmHr6zgQltxbyxbbwxRMUASZaQEMMxwdnl47x6wEisuGfp9cNv
	9ioCwPBtOe0Y22/QpQHWI2C3Hc55hnjwmlU5suhKNyT3AiHMpk=
X-Received: by 2002:a05:6000:4010:b0:487:981:4e07 with SMTP id ffacd0b85a97d-4871fa86624mr17596483f8f.4.1790061649512;
        Tue, 22 Sep 2026 00:20:49 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:ab7:2110:6a1d:efff:fe52:1959? ([2a01:e0a:ab7:2110:6a1d:efff:fe52:1959])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-488627314d2sm2901458f8f.2.2026.09.22.00.20.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 00:20:49 -0700 (PDT)
Message-ID: <adc2bc61-d832-4e9d-818b-e5d03fed0fca@6wind.com>
Date: Tue, 22 Sep 2026 09:20:48 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: nicolas.dichtel@6wind.com
Subject: Re: [PATCH net-next v6 2/4] net: add AF_PACKET multicast dumps
To: Yuyang Huang <sigefriedhyy@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, David Ahern <dsahern@kernel.org>,
 Donald Hunter <donald.hunter@gmail.com>, Eric Dumazet <edumazet@google.com>,
 Ido Schimmel <idosch@nvidia.com>, Jacob Keller <jacob.e.keller@intel.com>,
 Jakub Kicinski <kuba@kernel.org>, Kuniyuki Iwashima <kuniyu@google.com>,
 Nikolaos Gkarlis <nickgarlis@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 Sabrina Dubroca <sd@queasysnail.net>, Shuah Khan <shuah@kernel.org>,
 Simon Horman <horms@kernel.org>, Stanislav Fomichev <sdf.kernel@gmail.com>,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 netdev@vger.kernel.org
References: <20260921235951.3214-1-sigefriedhyy@gmail.com>
 <20260921235951.3214-3-sigefriedhyy@gmail.com>
From: Nicolas Dichtel <nicolas.dichtel@6wind.com>
Content-Language: en-US
Organization: 6WIND
In-Reply-To: <20260921235951.3214-3-sigefriedhyy@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Le 22/09/2026 à 01:59, Yuyang Huang a écrit :
> RTM_GETMULTICAST dumps IPv4 and IPv6 multicast group memberships, but
> the device multicast list (dev->mc) is only available through
> /proc/net/dev_mcast, so "ip maddr show" still has to parse procfs for
> its link-layer entries.
> 
> Handle RTM_GETMULTICAST dumps with ifa_family set to AF_PACKET next to
> the dev->mc helpers in dev_addr_lists.c and report every entry of
> dev->mc in the existing ifaddrmsg format:
> 
>   - IFA_MULTICAST carries the raw link-layer address
>   - IFA_MC_USERS carries the entry reference count
>   - IFA_F_GLOBAL in IFA_FLAGS reports netdev_hw_addr::global_use, set
>     by dev_mc_add_global() (SIOCADDMULTI) and dev_mc_add_excl()
>     ("bridge fdb add ... self"), i.e. entries added explicitly rather
>     than by a protocol join. This is the static column of
>     /proc/net/dev_mcast
>   - ifa_scope is RT_SCOPE_LINK
> 
> This covers every column of /proc/net/dev_mcast. AF_PACKET is the
> family iproute2 already uses for link-layer addresses ("ip -0").
> 
> The default FDB dump also walks dev->mc, but only for Ethernet devices
> without an ndo_fdb_dump of their own, so bridge, vxlan or macvlan
> devices never show their multicast filter there, and it has no users
> count or global_use bit. Extending it would change "bridge fdb show"
> output and add NDA_* attributes.
> 
> Requests are always validated, there are no legacy users: prefixlen,
> flags and scope must be zero, ifa_index selects one device and
> IFA_TARGET_NETNSID is the only attribute accepted. The dump runs under
> RCU and netif_addr_lock_bh() without RTNL, and stamps cb->seq from
> dev_base_seq so a device added or removed between dump rounds sets
> NLM_F_DUMP_INTR.
> 
> Signed-off-by: Yuyang Huang <sigefriedhyy@gmail.com>
> Reviewed-by: Nicolas Dichtel <nicolas.dichtel@6wind.com>
> ---
[snip]

> +static int dev_mc_dump_dev(struct net_device *dev, struct sk_buff *skb,
> +			   struct netlink_callback *cb, int *s_addr_idx,
> +			   unsigned int flags, int netnsid)
> +{
> +	struct netdev_hw_addr *ha;
> +	int addr_idx = 0;
> +	int err = 0;
> +
> +	netif_addr_lock_bh(dev);
> +	netdev_for_each_mc_addr(ha, dev) {
> +		if (addr_idx < *s_addr_idx) {
> +			addr_idx++;
> +			continue;
> +		}
> +		err = dev_mc_fill_addr(skb, dev, ha, NETLINK_CB(cb->skb).portid,
> +				       cb->nlh->nlmsg_seq, flags, netnsid);
> +		if (err < 0)
> +			break;
> +		nl_dump_check_consistent(cb, nlmsg_hdr(skb));
> +		addr_idx++;
> +	}
> +	netif_addr_unlock_bh(dev);
> +
> +	*s_addr_idx = err < 0 ? addr_idx : 0;
> +
> +	return err;
> +}
[snip]

> +int dev_mc_dump(struct sk_buff *skb, struct netlink_callback *cb)
> +{
> +	struct dev_mc_dump_filter filter = {
> +		.tgt_net = sock_net(skb->sk),
> +		.netnsid = -1,
> +	};
> +	unsigned int flags = NLM_F_MULTI;
> +	struct {
> +		unsigned long ifindex;
> +		int addr_idx;
> +	} *ctx = (void *)cb->ctx;
> +	unsigned long s_ifindex;
> +	struct net_device *dev;
> +	int err;
> +
> +	err = dev_mc_valid_dump_req(cb->nlh, skb->sk, &filter, cb->extack);
> +	if (err < 0)
> +		return err;
> +
> +	cb->seq = READ_ONCE(filter.tgt_net->dev_base_seq);
dev_base_seq only indicates whether the netdevice list has changed, not whether
the addr list has changed. It's only a partial consistency check.
See inet_base_seq()/inet6_base_seq().

I don't see an equivalent of dev_addr_genid for the L2 mcaddr list; it should
probably be added.
