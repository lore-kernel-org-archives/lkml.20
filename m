Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDFF154145E
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 13:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790084818; cv=none; b=AwGvXRW7NChrOMEnBmWXBAYL1/8sYYRNbU/bZApMhIBEJY/qT4Kz1LbB1pGHoIYjM4dboxe227HavxNoezthkAD0j8W94J1YfQ1j8PdXMochGno4rqXwxhPjVsvxN/fPvHvlhk9mf4CTzSONwqebjR8oJsHrr5euDUtygIN7LLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790084818; c=relaxed/simple;
	bh=A6mptCTqc8JYmR78HHITrrmFcDLHarfAJCWSHu//3Wc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lmxNW7UD/DhBizVAtuqCx1snj+2OHELdY+Tml3wUJRkQyCijrg1QSzgpHNDMDgGILHs4EGO9JkTEzcWS+E0Cpa54obb5AR2c1UJXP5ba/jPjGq79IShS4iemCS80dJfKsP8ha8FbeWP1fXbFTkxILTNz3H8YZNiNC7YmlKZurjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZIopgPbb; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=fxP84dWm; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZIopgPbb";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="fxP84dWm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790084815;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dRpz33ELk1+JRMOqNwfvb0Y3S56rs1Q7qrR4OEuociQ=;
	b=ZIopgPbbc6uJ8bltJc1DyqYUdDe68HNPFRvH6J/VXvecBogEEOeuIkuGvtk3cCwwLqoPRn
	oJ46HcsVOrqsr1OdTmnu8tHQabidrQ0HBkvFsLp0OkP0GkRCgiPz05bmHPSLaBLkvcSg7M
	PBsIW/ye9+K5JMvHigQgRh2aGT55JOI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-457-5HNNEAWmMXS2sy8Fi2ZF8g-1; Tue, 22 Sep 2026 09:46:54 -0400
X-MC-Unique: 5HNNEAWmMXS2sy8Fi2ZF8g-1
X-Mimecast-MFC-AGG-ID: 5HNNEAWmMXS2sy8Fi2ZF8g_1790084813
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-495689bfcc8so30912505e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 06:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790084813; x=1790689613; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dRpz33ELk1+JRMOqNwfvb0Y3S56rs1Q7qrR4OEuociQ=;
        b=fxP84dWmDETI1q9zz5InT22xV4otHrrILkUz6OCI8GLWA7K0y/0Jd9mLl/DiyuM1R1
         T0Cqzm1wugmmGPAs07QtcUS/Nkq8Lx8uy9rPwMdXUtaLuF4WaanjBMz+cCMOsm4I00Az
         zZhmMcNtIf++Mdyl1op7djHRgo+jVvGAIrKj7t9oDLx7lPgr/786ZKfd2VTqeCJxPUnx
         ipTIWgu0WL+22egXVtF1krSSvQ1OiKhfUbRXz/bK+N+nu/bOhapmy9Agp0S8RGP4jIig
         /y+CDWyZ8+URb/AMd5BdJBZ7AFnt2YwJxeVzifJM3TkVQKACI9uj0rX0UoNGlpwjZTzf
         xfVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790084813; x=1790689613;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dRpz33ELk1+JRMOqNwfvb0Y3S56rs1Q7qrR4OEuociQ=;
        b=QxlIh7+o/qeaVO8si+554ylwNzMoaYRZm/Hd5+cAH2NFMC4Y1byqisFZGego3SxHIi
         aejZxlnrQJ7stbSHCsTToy/q0B26q4NJ+xn6aATSx7tYv/NJx36fvr/GFwXC8p/o1S9X
         EY9TyGa9zB323Hpst8OJyObOaFBHCDoJtN5Vk9m3s9Y/668WwxrpDRHPmnxgZYfi3dRt
         hd7kZFE6bCNju8cHBSxtAmA599LkiNdqBhi2/huW4OyPX/GlC9gJ/s1zaq+Ob7clIT/x
         Xgy4etlR9VbOgpol0ldlUmTxRXYOOguTLw6jxXYFXKwWO54mN5X6p4EG8mmNscKReNRc
         7cpA==
X-Forwarded-Encrypted: i=1; AKwUvBz52Eg5kJZo1vWr87BXTToInHrZYwDLwjZ2dq5OIQIGBRf5y5Bw+TRvsnYF8NyVZyQty0KheOYn6ojJGkw=@vger.kernel.org
X-Gm-Message-State: AFuF++n4WfUYJBFv7sYfuVrL7rv/eUaJrtNoHYST7j+YwFaBZv0Z0Dhh
	su1gmCPOGDCv0C0junAZCtpHQmYFv6j0LqHXzB9wk8UTGd4753W8zmBi6m9RU3fa1kVaeguIoxT
	vMvh6wysmwgcXgiIqOo/VZy4rWetdpZJ6bKlqjkR6jhxBKCPk5tYisUa5eE1mmdlUNQ==
X-Gm-Gg: AYBFou2Fsd9KwmFjbf6d1qaZjeNyK8PKkiZswIW1htEa6fhpcULixWrOkmBzrud5sET
	qp6rf3pxJI3IHfN06HUSooc0iZ3j4Qa7y30YHtlK4b1I4w9TDxQw2k8B9jn82wdLWf1mwqESn8+
	t6yDUB8oVjAb7OlJIFeRtYxaZPy9Jz1znR55wWSMC7GGAH5Gul/AM8oo1wE5pfnDvZknrZX6shM
	aSq3JRJUXNBPNhqwl7LxzriE4TvsP0E3nF6ee8qRR6QqBnWDOheeSw9p/Agj5TqzYSL+zfchtPf
	LNMafygZ8S8HQxl/PPnCb7ekWlBUjugOIyERbYkHrzM4ksXYMaMyMw3YSviqDPqFT3ctEz6Minc
	4xtUy2ItwjKZQy7VffLXzFdOZcjDrBLxMUDPLHWmI6loifRYxGlmete8X+b2dQpybXaY+l/O2CQ
	==
X-Received: by 2002:a05:600c:3f07:b0:49e:7caa:e7b2 with SMTP id 5b1f17b1804b1-49fc5756f60mr191055475e9.29.1790084813000;
        Tue, 22 Sep 2026 06:46:53 -0700 (PDT)
X-Received: by 2002:a05:600c:3f07:b0:49e:7caa:e7b2 with SMTP id 5b1f17b1804b1-49fc5756f60mr191055105e9.29.1790084812619;
        Tue, 22 Sep 2026 06:46:52 -0700 (PDT)
Received: from [192.168.188.234] (ip232-47-231-195.pool-bba.aruba.it. [195.231.47.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fdaafa9cfsm56898185e9.4.2026.09.22.06.46.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 06:46:52 -0700 (PDT)
Message-ID: <11c3ed15-9694-4b03-832f-6c49abd742d9@redhat.com>
Date: Tue, 22 Sep 2026 15:46:51 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2] net: ipv6: keep room for the mac header when
 growing the headroom
To: Yuya Kusakabe <yuya.kusakabe@gmail.com>,
 Andrea Mayer <andrea.mayer@uniroma2.it>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>,
 Justin Iurman <justin.iurman@gmail.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260918-seg6-maclen-headroom-v2-1-4d370af55b2e@gmail.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260918-seg6-maclen-headroom-v2-1-4d370af55b2e@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/18/26 03:28, Yuya Kusakabe wrote:
> The seg6, ioam6 and rpl lwtunnels all grow the headroom with
> skb_cow_head(), push their new headers into it, and then rebuild the mac
> header below them with skb_mac_header_rebuild().  The headroom left
> after the push has to be at least skb->mac_len for that rebuild, but the
> requests ask for the pushed length plus dst_dev_overhead(), which leaves
> LL_RESERVED_SPACE() of the egress device, 16 bytes for plain Ethernet.
> 
> Where the mac header is longer than that, as it is on ingress through a
> VLAN device with reorder_hdr off, the rebuild runs out of room:
> skb_set_mac_header(skb, -skb->mac_len) computes a negative offset,
> stores it unchecked in the u16 skb->mac_header, and the memmove that
> follows writes skb->mac_len bytes about 64 KB past skb->head.
> Forwarding plain ping6 traffic through such a device reproduces it on
> all five seg6 encapsulation modes and on the rpl and ioam6 inline paths;
> skb->mac_header comes back as 65534 on a 704-byte head.
> 
> Ask for whichever of the two is larger.  These requests carried
> skb->mac_len until the egress overhead took its place rather than
> joining it.
> 
> Fixes: 40475b63761a ("net: ipv6: seg6_iptunnel: mitigate 2-realloc issue")
> Fixes: dce525185bc9 ("net: ipv6: ioam6_iptunnel: mitigate 2-realloc issue")
> Fixes: 985ec6f5e623 ("net: ipv6: rpl_iptunnel: mitigate 2-realloc issue")
> Assisted-by: LLM
> Signed-off-by: Yuya Kusakabe <yuya.kusakabe@gmail.com>
> Reviewed-by: Justin Iurman <justin.iurman@gmail.com>
> ---
> Changes in v2:
> - Use max_t(unsigned int, ...) rather than max() [Justin]
> - Make the same change in ioam6_iptunnel and rpl_iptunnel [Justin]
> - Reproduce and verify the fix on those two as well: unpatched, rpl
>    underflows in 12 of 16 probed configurations and ioam6 in 3 of 13,
>    both reaching about 64 KB past a 320-byte head; patched, neither
>    underflows in 18
> - Rewrap the requests so they no longer exceed 80 columns
> - Retitle for net: ipv6, now that the change spans three files
> - Link to v1: https://lore.kernel.org/r/20260917-seg6-maclen-headroom-v1-1-02ccec50f096@gmail.com
> ---
>   net/ipv6/ioam6_iptunnel.c |  8 ++++++--
>   net/ipv6/rpl_iptunnel.c   |  4 +++-
>   net/ipv6/seg6_iptunnel.c  | 12 +++++++++---
>   3 files changed, 18 insertions(+), 6 deletions(-)
> 
> diff --git a/net/ipv6/ioam6_iptunnel.c b/net/ipv6/ioam6_iptunnel.c
> index cfb2c41634a0..4fc745f78eaf 100644
> --- a/net/ipv6/ioam6_iptunnel.c
> +++ b/net/ipv6/ioam6_iptunnel.c
> @@ -262,7 +262,9 @@ static int ioam6_do_inline(struct net *net, struct sk_buff *skb,
>   
>   	hdrlen = (tuninfo->eh.hdrlen + 1) << 3;
>   
> -	err = skb_cow_head(skb, hdrlen + dst_dev_overhead(cache_dst, skb));
> +	err = skb_cow_head(skb, hdrlen +
> +			   max_t(unsigned int, skb->mac_len,
> +				 dst_dev_overhead(cache_dst, skb)));

The above snipped is repeated 6 times verbatim: it's calling loudly for
some deduplication.

Since all the existing dst_dev_overhead() users are touched here, I
suggest moving the max() computation inside dst_dev_overhead().

/P

