Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA0F74582E8
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 08:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791793473; cv=none; b=A/eyxrOALU5BBRx5b0tE/E3C2WHe3VL5FYfuRIbksGUKYXBRTrDxt6B2cZ0A50IO2O5zSYz8brxOS60/TBYxIzLi6fLoHEKzpLHf0SBrflVXKqMOZkG+hyyCADvvNTfKzcbNPU6FqNFvDt35UGp3ocQ4FDsPfGI6oaxUFmLk358=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791793473; c=relaxed/simple;
	bh=uEJyoS+30yHGpNi63XosPSBgXdIutsGwZoXGcgXAB40=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M86HvXO59TMi5phOwR2UQWSQq1E4GlqXthYvWr3Pjs+ps2yVV6QaRjLV1XyXW76XFuIv7LwtNAAjQyysgY1nm8l0djYinz4iPQxzU7UfSMjTYpYXRiAT6dt0mbH5Edh+f3TrEdbpj6IAW3DVnvqrN05zsgGjf0zJKRm2qC1nZy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qojpg/66; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qojpg/66"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cc1d57602e8so500429a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 01:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791793471; x=1792398271; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XUstLFtWx4JvNj3lIB8onpcrVo6KyUSXbSsd9ZyGKrc=;
        b=Qojpg/66ic0xTq3QUSrrwbrc1r/mjqOf/+h0m8AM0ir0Y0pXpOnEa14EBxtF3dADCW
         oQjR0ESuaRTZ+ojPNooY+TS46lqy2WUojASZ24wmPHLIF84lCvgInu+XvxbjlrSf7elh
         ExnYSsszMsIe9wMsRc+IlwCjDqopYxVaiiwWNJwMjSDgu+96Y/NqtZIqnT3fI7Zco33a
         cs1nyq4awTnqnc51RpTViveejT1bPPz1igJQvDkcoUoJcRgR3XWqOJkODaTwPuMNPz2S
         RJzRFm9/ID7zWF0H9x3BUWaQUg7ZqHL0ARMi0fvI6lJSDNBf/cnnGc4bX1XGV0xz72Yr
         UqYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791793471; x=1792398271;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XUstLFtWx4JvNj3lIB8onpcrVo6KyUSXbSsd9ZyGKrc=;
        b=D5/TCklRH3TJIltfhE7BET0IbB4mk+XU9o0Mz2VYtdF2739PHy3hEwh7FBVh6xja6k
         azPJ+MEwCyf4OPLEef70j3QqvF1lL1HtcfwhsimV2t6VoQlIZVvobLw83cP9J/XjX4Bm
         gv1rPti0OiI/x64byabuWnGsc7kIYC2AHPrecKDHItkJt8EYjpmbvRKl6S1gWFzdZR1n
         bzLvb/dGU2RtjkP8UveChVI062rxUEqSSHu/WMR1fqrZOmqRq8U9KXxyOY9FbKotZQ7A
         Etvwv6CehWuoEpXs1S0ZxE7CckugtQG4Y5n2t5uZBLpizA4oIsFAByIX/rntdEjQoTdR
         OZBw==
X-Forwarded-Encrypted: i=1; AKwUvBygdgfA0nGwrytdAfUBCt8rksCXLM1JECG2NR5i434gCommI6r1uUQRMgqAse8IU8Gf1+VcA4sAMFQOrlg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLznZJq2p57sbZ6x56dgjKsIyxnT0A2buR7AM9d+fD8L84WzK4a
	16UA5psH9vF1XJAD/72IXKus3va38oC1vLZDvr47zZPoWOTKza42DxP1
X-Gm-Gg: AYBFou1DlWxrEGi6Su/umINcEnS/PxFLw2PB2JkG19X02Zx+cb2dD6sMLRJD5yMZdPz
	lS+tRprfSXI1E2ZW1LFCok1jPPO+0B8ng183fIAFMKV8hGV6VP3+jlCVeVq2mCxPlrUdCWp0zMS
	a77XFQV/gAa2BjbYZEmS1d3eLEGRqa3WkBTFGfX0nOaPyOdFJsQ9srzV2jMXZz1i5tjuHb21fdR
	rvmcR6/7OlAYSsqFzQjDG0RVbBY3jZjJtcCYj83nNK9sc/BOh75mCM4MlRsOBZMDMiKrkv4FxdS
	maqUOwfBmkk6OF60S8Fcl9FYafnwNTaDQAoVpvneCBASEbhEI42IBaja/Ub4RaxcFGKC7IKPVRi
	v/mXhmnlB3tNSqdoIzngCtnSL4nk1VrKjxTMDvsRAiuo80lTBZllNZFp6T3CQLjaZaB+xSagnVL
	o7VMNu/JrjrkB+4UsYOKdYwM07XxpJmWac68Z3EihomJqJEchG2TO54tfkFzXIyhhkS1LkZAKqz
	guRw9Vtff7AI34j8PIH65VYFkl2eRz1PH45
X-Received: by 2002:a17:902:d60f:b0:2e4:a360:fcc6 with SMTP id d9443c01a7336-2e842bc1677mr75974345ad.35.1791793471208;
        Mon, 12 Oct 2026 01:24:31 -0700 (PDT)
Received: from ?IPV6:2620:10d:c085:21e8::1189? ([2620:10d:c090:400::5:b3cd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422b8dc4sm39606405ad.59.2026.10.12.01.24.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 01:24:29 -0700 (PDT)
Message-ID: <c23f8858-5659-40ed-939f-540c23b8f88f@gmail.com>
Date: Mon, 12 Oct 2026 01:24:28 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v3 3/5] eth: fbnic: return a pending Rx packet before
 reusing its buffer
To: Yehyeong Lee <yhlee@isslab.korea.ac.kr>,
 Alexander Duyck <alexanderduyck@fb.com>, Jakub Kicinski <kuba@kernel.org>,
 netdev@vger.kernel.org
Cc: kernel-team@meta.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 davem@davemloft.net, Eric Dumazet <edumazet@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Dimitri Daskalakis <daskald@meta.com>,
 Bobby Eshleman <bobbyeshleman@meta.com>,
 Daniel Zahka <daniel.zahka@gmail.com>, stable@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <cover.1791775409.git.yhlee@isslab.korea.ac.kr>
 <dc2fd0f8b4ff068c3919444d7b4a88ad55e5831f.1791775409.git.yhlee@isslab.korea.ac.kr>
Content-Language: en-US
From: Mohsin Bashir <mohsin.bashr@gmail.com>
In-Reply-To: <dc2fd0f8b4ff068c3919444d7b4a88ad55e5831f.1791775409.git.yhlee@isslab.korea.ac.kr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 10/11/26 9:15 PM, Yehyeong Lee wrote:
> fbnic_pkt_prepare() starts a new packet on each header completion and so
> far only warned when pkt->buff was still populated from a previous header
> that no META completion had finished. The stale buffer, and any fragments
> attached to it, were then overwritten and leaked.
> 
> Return the pending buffer to the page pool before starting over and clear
> data_hard_start, so the META drop path does not release it a second time.
> This leaks memory rather than crashing, so there is no oops to show.
> 
> Fixes: a29b8eb6e533 ("eth: fbnic: Add basic Rx handling")
> Cc: stable@vger.kernel.org
> Signed-off-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
> ---
>   drivers/net/ethernet/meta/fbnic/fbnic_txrx.c | 62 +++++++++++---------
>   1 file changed, 33 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_txrx.c b/drivers/net/ethernet/meta/fbnic/fbnic_txrx.c
> index 7dda59bba14ee..47ded7a9e0a81 100644
> --- a/drivers/net/ethernet/meta/fbnic/fbnic_txrx.c
> +++ b/drivers/net/ethernet/meta/fbnic/fbnic_txrx.c
> @@ -1014,6 +1014,33 @@ static unsigned int fbnic_hdr_pg_end(unsigned int pg_off, unsigned int len)
>   	return ALIGN(pg_off, 128) - FBNIC_RX_HROOM;
>   }
>   
> +static void fbnic_put_pkt_buff(struct fbnic_q_triad *qt,
> +			       struct fbnic_pkt_buff *pkt, int budget)
> +{
> +	struct page *page;
> +
> +	if (!pkt->buff.data_hard_start)
> +		return;
> +
> +	if (xdp_buff_has_frags(&pkt->buff)) {
> +		struct skb_shared_info *shinfo;
> +		netmem_ref netmem;
> +		int nr_frags;
> +
> +		shinfo = xdp_get_shared_info_from_buff(&pkt->buff);
> +		nr_frags = shinfo->nr_frags;
> +
> +		while (nr_frags--) {
> +			netmem = skb_frag_netmem(&shinfo->frags[nr_frags]);
> +			page_pool_put_full_netmem(qt->sub1.page_pool, netmem,
> +						  !!budget);
> +		}
> +	}
> +
> +	page = virt_to_page(pkt->buff.data_hard_start);
> +	page_pool_put_full_page(qt->sub0.page_pool, page, !!budget);
> +}
> +
>   static void fbnic_pkt_prepare(struct fbnic_napi_vector *nv, u64 rcd,
>   			      struct fbnic_pkt_buff *pkt,
>   			      struct fbnic_q_triad *qt)
> @@ -1025,8 +1052,12 @@ static void fbnic_pkt_prepare(struct fbnic_napi_vector *nv, u64 rcd,
>   	unsigned char *hdr_start;
>   	struct page *page;
>   
> -	/* data_hard_start should always be NULL when this is called */
> -	WARN_ON_ONCE(pkt->buff.data_hard_start);
> +	/* a new header while one is pending: release the old one */
> +	if (unlikely(pkt->buff.data_hard_start)) {
> +		WARN_ON_ONCE(1);
> +		fbnic_put_pkt_buff(qt, pkt, 1);
> +		pkt->buff.data_hard_start = NULL;
> +	}
>   
>   	/* A buffer ID we never posted cannot name a buffer we own, so drop
>   	 * the packet instead of running off the end of rx_buf[] or picking
> @@ -1146,33 +1177,6 @@ static void fbnic_add_rx_frag(struct fbnic_napi_vector *nv, u64 rcd,
>   	}
>   }
>   
> -static void fbnic_put_pkt_buff(struct fbnic_q_triad *qt,
> -			       struct fbnic_pkt_buff *pkt, int budget)
> -{
> -	struct page *page;
> -
> -	if (!pkt->buff.data_hard_start)
> -		return;
> -
> -	if (xdp_buff_has_frags(&pkt->buff)) {
> -		struct skb_shared_info *shinfo;
> -		netmem_ref netmem;
> -		int nr_frags;
> -
> -		shinfo = xdp_get_shared_info_from_buff(&pkt->buff);
> -		nr_frags = shinfo->nr_frags;
> -
> -		while (nr_frags--) {
> -			netmem = skb_frag_netmem(&shinfo->frags[nr_frags]);
> -			page_pool_put_full_netmem(qt->sub1.page_pool, netmem,
> -						  !!budget);
> -		}
> -	}
> -
> -	page = virt_to_page(pkt->buff.data_hard_start);
> -	page_pool_put_full_page(qt->sub0.page_pool, page, !!budget);
> -}
> -
>   static struct sk_buff *fbnic_build_skb(struct fbnic_napi_vector *nv,
>   				       struct fbnic_pkt_buff *pkt)
>   {

Under normal operation, the completion sequence is HDR_AL, followed by 
any PAY_AL completions, optional META, and primary META. This patch 
assumes that a new HDR_AL arrives before the previous packet’s primary 
META, violating that sequence.

