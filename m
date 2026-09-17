Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DEF6495526
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 10:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789639937; cv=none; b=a/hs95L38V9EGqL0laCUhNcibHJirkiuTH5kkjjs6BNeWvmESRbk8H6pPLaWe4iKNy4tg12Tb4XcUDRmRG32kLQGfeYrLK9jB4KIbruPHzqygXNAbBKXUCnWFwuMOObCJnk8UyxQit1zQiNNqAdfiXATGX8rlyQtHspklqcXtyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789639937; c=relaxed/simple;
	bh=qtKtKBO61OoCe8lbDkcmUG8lBmk30/Jv2wDq64SQZuI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qK03x48XCEhUWUtUahS4+aAAnQO+yZgMBqnJ2OW3ahHl15RaQkIX4qLMfQdEciW5Sp0GLP8YzYazQzqnbihNR0u7i2mfUeyaujLpEGcHFGij7VdDT+jjFnATdjrgnTqMMcI0NGotYq4iV3KyVaeBwTaOBhNDKs/YsTXOBMqaiOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nTgPfqKH; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nTgPfqKH"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccff31419so5462845e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 03:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789639933; x=1790244733; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jXd66g/TmmiGHEM82GWIsMZ57cUtyZBBMLPotbvyTAU=;
        b=nTgPfqKHOpWdTeEDbKrvIUgX6y+oMWwgmkTWBTc0Ipjn2WJpuBFkeCNr7zV/U1i4qC
         +XcI6hAAsMEjK6E/F7gqSCvy8+wnCo8pCmbuRBdpAGVloVPtQrdM7JLo/RlEOlYwq4iB
         zO+kJYrmEZD1RCh3PnN2NvHtx9EAl9KqIbBKzjP552B99w0Fvm2VPaIYDtaXA4thsMlI
         XDA7F0pO+/SkAE6xkyzZ0FZta/Sck9EWyJrnroKT2gWLlljAWWpLUqrs313V63ePfpRf
         kSmSmdyazoL0EK0ztjFUqQQLGYJfPCFAclYVTibdtaQkbFVPEHjhRllpbkccr1lGvbp8
         f8bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789639933; x=1790244733;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jXd66g/TmmiGHEM82GWIsMZ57cUtyZBBMLPotbvyTAU=;
        b=Fr0LE7lIyaCTYD/SK2gROI7p0uTzoEm+k3sOn/8gomT/6fh3dwFnHsq4e/fuB/yjvo
         i7frQpL8rjH8noz+Y35ING17d4nOnkOK1CQQGMvuBmAnCu3cglIzNZ0ARu+V77zCDOET
         KGbZIqZZ7ieebQ+ynnTEzgyJ8N/585QPILOLoauPWfZmH3ci4vEWuUv6habhiTEAu/sL
         JsnsqAL8jLM5UUA7mE/Yto2CCv7fQMjh2vcNI4NhN/+tkHloJopGRDsLchbh/f2mivAY
         M3KAK5a6fcfEdN4+WsdeSXSe2qgfwcGq4+JQXXBhEw6CUVRvPdrBMsZ9B0OcLRCYh2M4
         Hwyg==
X-Forwarded-Encrypted: i=1; AKwUvBy2sAs4ecSKL0y76zqWUpX1DfLMJq0mWNqwdDCKmo6ycoUoO7hfh72L0Wj5M0tDOP2Ce7hig6Z+t7o1jv8=@vger.kernel.org
X-Gm-Message-State: AFuF++lD9i7Q32434CNpHspnQnRkNrgcf8jwL0Z1LgsKq16Sx3Z+/yWx
	jXmQKrx0B+Ve9nGPQqXE3MGTghuMJ5lLb2+sPWiAsq1cyYVFG8Ww0YyX
X-Gm-Gg: AYBFou2bpE+jy2T+N3x8TBlbYQi18qkoQoFotDp6axBwa+ILgZa5i3wddvizOpp0Lf1
	3fysyBMRsQGzXLUiJubk19kkGaC8fARRmllPSIhU9CF+/FdRklArDV5E5fTVIshFnJlOPR8p9jq
	uk895WZZJl3vqQeedbjHYOucvFwCw5JwRsIGg4PJvQK3s61vY6Xy4Wdc5Qhw9ApNAMGttHMrlzs
	1GZd9X0iowJZ26MH6ZpflFFxgbk+S7Cf5laWBkpJ3l/t2ZdKJOWRA9hS7d+yE/pmg1W/iYBYi8p
	U8Kr14G/5UR0TpOO0NhBzLiHEEaMFPwawHGqYzwCg4Rcf/f1CFoOqKplICuOZynqqxobkZTNxIp
	1n3BME4KprIBScEGzFVUjkToqWPWCJeng0mwqGkjOFk4ZNn4eTEv55OmFa0YelyYZe4vvYdVLfs
	Klcz06qB08LKhukeOdz/KasezUtoOnrLDF0f5saPQRMumeLnck2n2OmzF2yjdGZi/EFV6/L7NuB
	pyjsYBJITCC1lsiw96CuErAwe1AiTqNm56QgU51C/IHeZcJUZNX
X-Received: by 2002:a05:600c:34c2:b0:49e:6c27:d093 with SMTP id 5b1f17b1804b1-49eb72f7043mr68451005e9.15.1789639933119;
        Thu, 17 Sep 2026 03:12:13 -0700 (PDT)
Received: from ?IPV6:2a02:a03f:a75e:9a00:d1c6:8f88:e273:c9da? ([2a02:a03f:a75e:9a00:d1c6:8f88:e273:c9da])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd226ef3sm63094115e9.1.2026.09.17.03.12.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 03:12:12 -0700 (PDT)
Message-ID: <fd0ffc06-f1c5-42d6-ae16-b592208c6d69@gmail.com>
Date: Thu, 17 Sep 2026 12:12:11 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] seg6: keep room for the mac header when growing the
 headroom
To: Yuya Kusakabe <yuya.kusakabe@gmail.com>,
 Andrea Mayer <andrea.mayer@uniroma2.it>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260917-seg6-maclen-headroom-v1-1-02ccec50f096@gmail.com>
Content-Language: en-US
From: Justin Iurman <justin.iurman@gmail.com>
In-Reply-To: <20260917-seg6-maclen-headroom-v1-1-02ccec50f096@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/16/26 23:38, Yuya Kusakabe wrote:
> __seg6_do_srh_inline(), __seg6_do_srh_encap() and
> seg6_do_srh_encap_red() all grow the headroom with skb_cow_head(), push
> the new headers into it, and then rebuild the mac header below them with
> skb_mac_header_rebuild().  The headroom left after the push has to be at
> least skb->mac_len for that rebuild, but the three requests ask for the
> pushed length plus dst_dev_overhead(), which leaves LL_RESERVED_SPACE()
> of the egress device, 16 bytes for plain Ethernet.
> 
> Where the mac header is longer than that, as it is on ingress through a
> VLAN device with reorder_hdr off, the rebuild runs out of room:
> skb_set_mac_header(skb, -skb->mac_len) computes a negative offset,
> stores it unchecked in the u16 skb->mac_header, and the memmove that
> follows writes skb->mac_len bytes about 64 KB past skb->head.
> Forwarding plain ping6 traffic through such a device reproduces it on
> all five encapsulation modes; skb->mac_header comes back as 65534 on a
> 704-byte head.
> 
> Ask for whichever of the two is larger.  These requests carried
> skb->mac_len until the egress overhead took its place rather than
> joining it.
> 
> Fixes: 40475b63761a ("net: ipv6: seg6_iptunnel: mitigate 2-realloc issue")
> Assisted-by: LLM
> Signed-off-by: Yuya Kusakabe <yuya.kusakabe@gmail.com>
> ---
>   net/ipv6/seg6_iptunnel.c | 9 ++++++---
>   1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/net/ipv6/seg6_iptunnel.c b/net/ipv6/seg6_iptunnel.c
> index 61c6a27bf202..0e60bbca19ca 100644
> --- a/net/ipv6/seg6_iptunnel.c
> +++ b/net/ipv6/seg6_iptunnel.c
> @@ -153,7 +153,8 @@ static int __seg6_do_srh_encap(struct sk_buff *skb, struct ipv6_sr_hdr *osrh,
>   	hdrlen = (osrh->hdrlen + 1) << 3;
>   	tot_len = hdrlen + sizeof(*hdr);
>   
> -	err = skb_cow_head(skb, tot_len + dst_dev_overhead(cache_dst, skb));
> +	err = skb_cow_head(skb, tot_len + max(skb->mac_len,
> +					      dst_dev_overhead(cache_dst, skb)));
>   	if (unlikely(err))
>   		return err;
>   
> @@ -255,7 +256,8 @@ static int seg6_do_srh_encap_red(struct sk_buff *skb,
>   
>   	tot_len = red_hdrlen + sizeof(struct ipv6hdr);
>   
> -	err = skb_cow_head(skb, tot_len + dst_dev_overhead(cache_dst, skb));
> +	err = skb_cow_head(skb, tot_len + max(skb->mac_len,
> +					      dst_dev_overhead(cache_dst, skb)));
>   	if (unlikely(err))
>   		return err;
>   
> @@ -351,7 +353,8 @@ static int __seg6_do_srh_inline(struct sk_buff *skb, struct ipv6_sr_hdr *osrh,
>   
>   	hdrlen = (osrh->hdrlen + 1) << 3;
>   
> -	err = skb_cow_head(skb, hdrlen + dst_dev_overhead(cache_dst, skb));
> +	err = skb_cow_head(skb, hdrlen + max(skb->mac_len,
> +					     dst_dev_overhead(cache_dst, skb)));
>   	if (unlikely(err))
>   		return err;

Overall, LGTM, thanks. However, I think we'd need a v2 with the followings:

- use max_t(unsigned int, skb->mac_len, dst_dev_overhead(cache_dst, 
skb)) instead of max()
- apply the same changes to ioam6_iptunnel and rpl_iptunnel (all in one 
patch is fine)

Reviewed-by: Justin Iurman <justin.iurman@gmail.com>
