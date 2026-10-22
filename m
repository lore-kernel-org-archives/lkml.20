Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792706810;
	b=y2zque8kLeN3OI0YNvrkDHHHNbFtlBAmBHWcdHMLBwM+UnQsGr/WQiW6d3WmLLHzT5uN
	 ZaEdQLPF5phpirBPtn/FbuPOV2UU98HlRElXkRSBXFm+iO/nRjg5CXdN0fWOc3OvUg3Bv
	 P2Bh3sJrhDbM3SZxAd5ByNKQimSLC5b2Blmzs9YgrlQo1XR7R4Vtq4WZea/rg6s3rEjYD
	 EiyA8E0Xu9McrtrmtN4vY1CoSDFXgP9XuuBRAEZmelq88PJG1dYU8zskU7s6G0V02Xuko
	 o7inngIxOjgwyyPZx1xBJPT1MrzaDvxk3+1bzsxVrTVxjerS+KVV9wDAb197FTJgLGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792706810;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=Iia+/3SGKV6BH0FuXkiJp6KPLJIcRH5RkOpfzGcqdio=;
	b=ZnJlbMaDXV3RRhplwKabtQFMTvTwHcqZVdw+ZSYvQY9twXqFmenIDAqv94DmEOLS4vrO
	 WvMjL0QfEW7/NLoNVIV4CQ7TrNF5fCMeLdGR3esG23K7PLMKbihInjXyW5zinns6PvdWp
	 ES+uA5M56jPy7NOxdr1qM5RHgOetWdGUci9UdfL0UHufvyZpr2mCUV4hv/sMMX4p1UfnH
	 s0aicbJYbMkLIeodjaS9/f0LVw6Q8v46BERw2vr9SQSOaIz1fkZ7TXSgxE+R24fBUnCH4
	 RE32rUqkx1wU15Is8/gx8c6BHN0oRAweMWm0WLWQ3jtnhXqgdWuc0BE2xUpV5GtDuPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=g9KJ9C2+;
	arc=none smtp.remote-ip=209.85.222.226
Received: from mail-qk1-f226.google.com (mail-qk1-f226.google.com [209.85.222.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A28606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 22:06:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55A28606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=g9KJ9C2+
Received: by mail-qk1-f226.google.com with SMTP id af79cd13be357-93f30660e69so21570585a.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 15:06:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792706809; x=1793311609;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Iia+/3SGKV6BH0FuXkiJp6KPLJIcRH5RkOpfzGcqdio=;
        b=lKvQxAQwwneddZ9HR9/KmyATMrb2e8sO2hqlY1cw14WvWCX3pOh7V5u4le+Iu7Sgnn
         BKJX/F2oj2yj6Q7Oxnc0OrJjsbauL0FyLPjGlQQXmYTa9SKOFLfL4/ytzVcn8R8KmNLq
         UJjDIGVO1OupB4Kx9ZIUMA3Wk6W+T0pEyDRcp1eMDB1bkFfEx+A3xfzTHAXd6i+jmzIx
         SsmB3mSRwX8woDQ4SZezKgOSb1C8npEwvkWqVd4iDU7te4xviFHiO+Yu0RrcRgyPCALI
         m+V67SPolL8EmfgS+lLEEiel6r69d1IRCs65mTZwRvdQ4TN4EtcNcwxSU+yim5NFMUj8
         f9ew==
X-Forwarded-Encrypted: i=1; AKwUvBxjIDfJPAaDfhZhKLvPJPrv4xAKUXdiyviOr/LXgfAy0cpg8UcM7f22fq4Fhhe2ZRtT1WG08Axz/qso1uk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJaVgChLtAARcWTlyvWePTZf+Oias0mv6tgJMuWyr1THWoXy9Xu
	DNEDxUjaq8mFjkDCIclnyjgA401sv3gjo2StPcnV8NHsoQZb9YOEQBao4m3OrbtRCnB6eqBainT
	e+zOWKr7zEIpOl2Uz6t/4cPTBTHdO7rqXi4LYGKUYbuc3R7Q+TJ74B1Foi/JvsINnwjWA5ndadp
	46mS8nOEHZ5aHiVuYLM0k4qHK3a8KbXK5NzD9FP52zrNaH275Fx5hCc4YS3W2pneLENTyQyns+f
	C32GJyv4d43H6OUBDf42/78
X-Gm-Gg: AYBFou1Vqu4ymm4emiTVa+OTKu4gh+LtvYWL6w7n7kERPVT6o5zMN3TeucFOt2nLkOc
	IwBJN6Cqytew5RyKWvL97SS11DjP1dIJ4kcoAvnPfstPdk/jJ5zYPTppy/llrEaSt+WYuN6dvsS
	39CCzUOJvH3VK2QLQ+08ePbXmrdE6zlg3lBSs59jG5CyKdzP54TpPssq5KfHyfpHqAMhlC1/OlJ
	c/wXNrefO9gHbrfal7BC9ZYTgc06F3pF80KlWvpz8MosoKtnPwn/GrUacca5d0YVYk0uAzJDjng
	8ki7yAxFTVN+yYjhcFJk9YSFS/iANBKSJOIMfKBNjoQM2y7Xm/eIQkk1veDVX+OSsg+08oCRcLf
	kWu7TNnJQScip6SYAJpRaIBG+cjLK+0Yr4bpF8PaaNaRzhXv3LBboyAm6D/a0frG0FUoDKCC9t0
	8U8xN/iKT/H8H/ZItnlRMFPva0IjEUQApytdVA8MGVT5A=
X-Received: by 2002:a05:620a:171e:b0:93b:e578:583d with SMTP id af79cd13be357-93f6f7dcab3mr177388585a.21.1792706809211;
        Thu, 22 Oct 2026 15:06:49 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-125.dlp.protect.broadcom.com. [144.49.247.125])
        by smtp-relay.gmail.com with ESMTPS id af79cd13be357-93f70eae168sm4994985a.5.2026.10.22.15.06.48
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 22 Oct 2026 15:06:49 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-53639e47be2so4064581cf.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 15:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1792706808; x=1793311608; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Iia+/3SGKV6BH0FuXkiJp6KPLJIcRH5RkOpfzGcqdio=;
        b=g9KJ9C2+soB4zORwsKBW92UABfqqADgY2mxC7pYTqnmc11G0gxpiUgEytzqF55tmEA
         D7fKw9o+f0iSoesU61pxWCQPtPa3hIesuw+WDIoBdg1nZU+MRENxAggABnCiJz0mTX9s
         6IegmS3kejn76oID82AtoYa6Tc4QTR2AasmBk=
X-Forwarded-Encrypted: i=1; AKwUvBwBQ5FYyIPwOOD8kvjgYBlEuMvqCxHNLTP2buDQxFL+IBdlwa5IAEe3Vs/T8+71ftl9u2cNs8irO9mT5q8=@vger.kernel.org
X-Received: by 2002:a05:622a:5c10:b0:516:ed02:c85d with SMTP id d75a77b69052e-536c2694d64mr4475491cf.3.1792706808563;
        Thu, 22 Oct 2026 15:06:48 -0700 (PDT)
X-Received: by 2002:a05:622a:5c10:b0:516:ed02:c85d with SMTP id d75a77b69052e-536c2694d64mr4475031cf.3.1792706808133;
        Thu, 22 Oct 2026 15:06:48 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-536c1835c23sm3113161cf.17.2026.10.22.15.06.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 15:06:47 -0700 (PDT)
Message-ID: <8b061dc1-73a9-4823-abb9-535eb4677b13@broadcom.com>
Date: Thu, 22 Oct 2026 15:06:45 -0700
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
Subject: Re: [PATCH net] net: bgmac: rate limit RX error messages
To: Rosen Penev <rosenp@gmail.com>, netdev@vger.kernel.org
Cc: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Felix Fietkau <nbd@openwrt.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20261018231629.39734-1-rosenp@gmail.com>
Content-Language: en-US, fr-FR
From: Florian Fainelli <florian.fainelli@broadcom.com>
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 xsBNBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeT
 M0Txqn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4Ghs
 JrZOBru6rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQ
 PcycQnYKTVpqE95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQ
 KQuc39/i/Kt6XLZ/RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEB
 AAHNMEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPsLB
 IQQQAQgAywUCZWl41AUJI+Jo+hcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFr
 ZXktdXNhZ2UtbWFza0BwZ3AuY29tjDAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2Rp
 bmdAcGdwLmNvbXBncG1pbWUICwkIBwMCAQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29t
 Lm5ldAUbAwAAAAMWAgEFHgEAAAAEFQgJChYhBNXZKpfnkVze1+R8aIExtcQpvGagAAoJEIEx
 tcQpvGagWPEH/2l0DNr9QkTwJUxOoP9wgHfmVhqc0ZlDsBFv91I3BbhGKI5UATbipKNqG13Z
 TsBrJHcrnCqnTRS+8n9/myOF0ng2A4YT0EJnayzHugXm+hrkO5O9UEPJ8a+0553VqyoFhHqA
 zjxj8fUu1px5cbb4R9G4UAySqyeLLeqnYLCKb4+GklGSBGsLMYvLmIDNYlkhMdnnzsSUAS61
 WJYW6jjnzMwuKJ0ZHv7xZvSHyhIsFRiYiEs44kiYjbUUMcXor/uLEuTIazGrE3MahuGdjpT2
 IOjoMiTsbMc0yfhHp6G/2E769oDXMVxCCbMVpA+LUtVIQEA+8Zr6mX0Yk4nDS7OiBlvOwE0E
 U8AbwQEIAKxr71oqe+0+MYCc7WafWEcpQHFUwvYLcdBoOnmJPxDwDRpvU5LhqSPvk/yJdh9k
 4xUDQu3rm1qIW2I9Puk5n/Jz/lZsqGw8T13DKyu8eMcvaA/irm9lX9El27DPHy/0qsxmxVmU
 pu9y9S+BmaMb2CM9IuyxMWEl9ruWFS2jAWh/R8CrdnL6+zLk60R7XGzmSJqF09vYNlJ6Bdbs
 MWDXkYWWP5Ub1ZJGNJQ4qT7g8IN0qXxzLQsmz6tbgLMEHYBGx80bBF8AkdThd6SLhreCN7Uh
 IR/5NXGqotAZao2xlDpJLuOMQtoH9WVNuuxQQZHVd8if+yp6yRJ5DAmIUt5CCPcAEQEAAcLB
 gQQYAQIBKwUCU8AbwgUbDAAAAMBdIAQZAQgABgUCU8AbwQAKCRCTYAaomC8PVQ0VCACWk3n+
 obFABEp5Rg6Qvspi9kWXcwCcfZV41OIYWhXMoc57ssjCand5noZi8bKg0bxw4qsg+9cNgZ3P
 N/DFWcNKcAT3Z2/4fTnJqdJS//YcEhlr8uGs+ZWFcqAPbteFCM4dGDRruo69IrHfyyQGx16s
 CcFlrN8vD066RKevFepb/ml7eYEdN5SRALyEdQMKeCSf3mectdoECEqdF/MWpfWIYQ1hEfdm
 C2Kztm+h3Nkt9ZQLqc3wsPJZmbD9T0c9Rphfypgw/SfTf2/CHoYVkKqwUIzI59itl5Lze+R5
 wDByhWHx2Ud2R7SudmT9XK1e0x7W7a5z11Q6vrzuED5nQvkhAAoJEIExtcQpvGagugcIAJd5
 EYe6KM6Y6RvI6TvHp+QgbU5dxvjqSiSvam0Ms3QrLidCtantcGT2Wz/2PlbZqkoJxMQc40rb
 fXa4xQSvJYj0GWpadrDJUvUu3LEsunDCxdWrmbmwGRKqZraV2oG7YEddmDqOe0Xm/NxeSobc
 MIlnaE6V0U8f5zNHB7Y46yJjjYT/Ds1TJo3pvwevDWPvv6rdBeV07D9s43frUS6xYd1uFxHC
 7dZYWJjZmyUf5evr1W1gCgwLXG0PEi9n3qmz1lelQ8lSocmvxBKtMbX/OKhAfuP/iIwnTsww
 95A2SaPiQZA51NywV8OFgsN0ITl2PlZ4Tp9hHERDe6nQCsNI/Us=
In-Reply-To: <20261018231629.39734-1-rosenp@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 10/18/26 16:16, Rosen Penev wrote:
> When the RX ring is full the RX FIFO overflows. With RX overflow
> continue enabled, the DMA engine then writes one frame with a bogus
> length (always 0x45c2 on a BCM4716), which the driver drops with
> "Found oversized packet at slot %d, DMA issue!".
> 
> Under sustained overload this happens on every NAPI poll. On an Asus
> RT-N16 a 950 Mbit/s UDP stream to the router printed about 1450 such
> lines in 20 seconds. The messages are printed from NAPI context, so
> with a serial console the router spends most of its time printing.
> 
> The frames are already accounted in rx_length_errors and rx_errors.
> Rate limit both RX error messages. With this change the same flood
> printed 60 lines while rx_length_errors counted 14297 dropped frames.
> 
> Fixes: 6a6c708469c9 ("bgmac: add check for oversized packets")
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>   drivers/net/ethernet/broadcom/bgmac.c | 10 ++++++----
>   1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/net/ethernet/broadcom/bgmac.c b/drivers/net/ethernet/broadcom/bgmac.c
> index 1835266fdd09..b3a92ae95de3 100644
> --- a/drivers/net/ethernet/broadcom/bgmac.c
> +++ b/drivers/net/ethernet/broadcom/bgmac.c
> @@ -447,16 +447,18 @@ static int bgmac_dma_rx_read(struct bgmac *bgmac, struct bgmac_dma_ring *ring,
>   
>   			/* Check for poison and drop or pass the packet */
>   			if (len == 0xdead && flags == 0xbeef) {
> -				netdev_err(bgmac->net_dev, "Found poisoned packet at slot %d, DMA issue!\n",
> -					   ring->start);
> +				if (net_ratelimit())
> +					netdev_err(bgmac->net_dev, "Found poisoned packet at slot %d, DMA issue!\n",
> +						   ring->start);
>   				put_page(virt_to_head_page(buf));
>   				bgmac->net_dev->stats.rx_errors++;
>   				break;
>   			}
>   
>   			if (len > BGMAC_RX_ALLOC_SIZE) {
> -				netdev_err(bgmac->net_dev, "Found oversized packet at slot %d, DMA issue!\n",
> -					   ring->start);
> +				if (net_ratelimit())
> +					netdev_err(bgmac->net_dev, "Found oversized packet at slot %d, DMA issue!\n",
> +						   ring->start);

No objection, but the issue is that we are going over 
BGMAC_RX_ALLOC_SIZE, and I believe the check should actually be 
BGMAC_RX_MAX_FRAME_SIZE because we have the skb_shared_info at the end 
of the packet, if we start overflowing that, we will call 
skb_over_panic() very soon.
-- 
Florian
