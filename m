Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794500802;
	b=0nULUCPEn5jkCCYpudTmYvaAoDtJCdMO5a4yK4l1JsiraJ7gJ4oEq786Kh4byxnjxN2l
	 nbF7htNd8VpmbBJYKlAXDLR79KR43zHcUz08tc0N1c9iPHIKHasf0SXPSxOs8Mo62FuIu
	 DZDAHlvpcwmDIDI6+Qax9Bc+GbojvPOBSu1WYkpPhjQ41ixji83tnQkaDlKJhNOoMy92b
	 wCdGZLU+FOqgrlhpkBqs5/rjQmST8Ne4aqiY41HaZ66hJTeaJwRkvkVxnKIxxXLBP7To4
	 HlxpxSiHjJaFgw2k6bpMnvC+Xuy44YfTjmawaavu9vLyZVXjf+8GyUgYFWInmUQ9aAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794500802;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Reply-To:Subject:To:Cc:
	 References:From:Content-Language:Organization:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=Ug3gxgTRAmLwJZ9jlDeZvtL+FD9HT2QhKSrhIo50A4o=;
	b=i6/wMGZQ1wwGnF/t7lp3uGyJ1MjyzX48HfNSLt4AOxS80YWNtc45K89VLr3rNRGUYWms
	 D9vdhyIOawp8HzUPbJvib+j/zUZbQYApRGuw3QoR6oXor4rLopyX2qyOP76+kI/CTHoDQ
	 GhnvhXzCMhC751sr/qcaQC4tnNzltardw32omGAl+4I1CTw2V9enX3F0LnjOn9aR/e//D
	 ibMILFHY3mE6nh9mCwzH0ZEwhJwdC2QPmBVJo/53Ft3zAtpBnkHbcJsA9dJCbu2cNPCF9
	 +Q9fA1mtxUfILY/tc4OmBlTkLzWx81weQaVRVX9XKLbbnswDgviNn4BKtgZQv9+XNSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=6wind.com;
	spf=pass smtp.mailfrom=6wind.com;
	dkim=pass header.d=6wind.com header.i=@6wind.com header.a=rsa-sha256 header.s=google header.b=bKL3u6dI;
	arc=none smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3D5F606A32E
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:26:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3D5F606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=6wind.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=6wind.com header.i=@6wind.com header.a=rsa-sha256 header.s=google header.b=bKL3u6dI
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c504d4cc6b7so22738066b.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:26:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=6wind.com; s=google; t=1794500800; x=1795105600; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Ug3gxgTRAmLwJZ9jlDeZvtL+FD9HT2QhKSrhIo50A4o=;
        b=bKL3u6dIu0++rEZtas/JwemFgjhK543MBrZqIi6nlnUlmVTr84ugl6hhyXAH3LMga6
         cCxfIqUlK81TzFbcfollEP13jViCJkS6smiwmRThA36Ie/9iw7M4QmWypzOX2KfhXooA
         jyR2S7vjGUhDnpT0Mw2EeZYXGRR6fDJz69jI0yiPdNhCVhZ6r5DJ6O00JcpMZ11IRS9q
         R6m6FxzU+QkC01VFl6wxruWB3fUPxWJ5dbkV0TTP2fuxRth6nPAKzcXFbsA6cFKBFRT8
         xRc37e9pWeuuJrvKjC3WdIxl5rpcdHJ90QP1J9+aNKjsFsoq9o65fslzmGjbUUYwDG3W
         5hZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794500800; x=1795105600;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Ug3gxgTRAmLwJZ9jlDeZvtL+FD9HT2QhKSrhIo50A4o=;
        b=oThV5nB28Ah3ye1PFhrFlIDl9s0+Ka1UcgO4jbO5kLj2Us37USHG0oTlAaYRDp5YdP
         ZojmVxpqp22bw/2YlqSIxapbnDYmDsOkDFfzeuWoSw7CosppWT/RnCiUpIsujJ+w/Ytx
         Hz6luAz5sCDNbQs4/nsjFsL3vRcTyF/3/mQtEUd4znuNQV+av/h7llZpKeR5Yyo0/Vi8
         xRuscdyVTKTlotevUQ0r+Wc1Btb4W/4e1G7vpMOIZEi+B1b0fQj51AnxuMvlOdudzDLn
         jtV+guJqRBinIE5LYhz2oACh0c/BDk2W5u1y2pCMUxT2EH8dusxooGNI7oGNlvrNb2VN
         IR5w==
X-Forwarded-Encrypted: i=1; AL+hErF+J5aY0M4RVO5azWPiQDteEgJje5modM+YdoKaJOUna7FasnTmi64SInWmx8S2acK7dJUW0GSNnZs6/04=@vger.kernel.org
X-Gm-Message-State: APuU4Z+wk56T02n+OYeISD26OzM52utUfFFTr5e8JMP31zXxN/2GUy/4
	TTddUcHOVdDRbpsAcVgqtu9KdEorvGI6sr10wd8AXLf1EzTm0N+jV+myY16BHzygDeM=
X-Gm-Gg: AYBFou3vhRE7BzzdGBCmM4YwHZvDaqZ+fzqn4aESdZWjIFrwSYwkQsFNEZzDHqeDlyG
	2pY3J1pPaPrkfkf9iHY94Jik9vCy0HIr0MGoOmWJH55OaIVbOCHsZtRGS5wGKLyClUbNPlrCtpp
	wvlqh7k/N3OFnSaOAONCtfnxBDJcdv3NG5e1qjRvdUqd22ANM5f2jhcjMVJNLaI17z3/FVuaJx3
	l6mbyaQGyVvFYUevrudEUbJEc1Nxd+gAm1Vi756L8NGu7OJlFNJHlXuf9Jz9VwJAS/uQ0BPS2ly
	D7EQXIKZARMyQkvJjx21F/VvFtNpv80ST/iPzTnETN1ITMn4bzhauCdAsTN/tL7C2wrYkN4OT8n
	uBteKE8IfE9Epo2/CJTLm2Ai6+338+ZDyZNHqtR51MSH/wyXMUv+Q3YNbAPmiVg8EI0iyRqdVev
	u/R+RCqQ3v33skcvO9ZdK2CmAQ77xXZQfVEW8LvXBPL+sdG0z5tdvzpwEMT2Q5G3mSzUojOcA0q
	5ldqofVEOkKH34OQOeQeKZqhABZe7sAR5NWwUpfat1/d27phSQScU/WF55D3s43NULcsl6EiWHf
	uu2IjqnCIDS2VlC2yV0SD+MKGTq6w2iOnhDCiqbNJmopQnD9PoWjgk5Xcedui4QTirqwop55iuj
	3rXUeQxwf3pGgChjfkABt18yIowzX
X-Received: by 2002:a17:907:60a:b0:c46:ae89:cd3c with SMTP id a640c23a62f3a-c5066966d74mr520801966b.1.1794500799989;
        Thu, 12 Nov 2026 08:26:39 -0800 (PST)
Received: from ?IPV6:2a01:e0a:ab7:2110:6a1d:efff:fe52:1959? ([2a01:e0a:ab7:2110:6a1d:efff:fe52:1959])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f782396sm117814f8f.24.2026.11.12.08.26.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 08:26:39 -0800 (PST)
Message-ID: <8db41fd4-6c07-4f15-9cd9-5525913968ae@6wind.com>
Date: Thu, 12 Nov 2026 17:26:38 +0100
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
Reply-To: nicolas.dichtel@6wind.com
Subject: Re: [PATCH net-next] ipv6: reset all.force_forwarding when disabling
 all.forwarding
To: Gabriel Goller <g.goller@proxmox.com>, David Ahern <dsahern@kernel.org>,
 Ido Schimmel <idosch@nvidia.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261109-ipv6_reset_all-v1-1-815dfd508246@proxmox.com>
From: Nicolas Dichtel <nicolas.dichtel@6wind.com>
Content-Language: en-US
Organization: 6WIND
In-Reply-To: <20261109-ipv6_reset_all-v1-1-815dfd508246@proxmox.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Le 09/11/2026 à 16:53, Gabriel Goller a écrit :
> Disabling all.forwarding resets force_forwarding on every interface, but
> leaves all.force_forwarding set:
> 
>   # sysctl -wq net.ipv6.conf.all.forwarding=1
>   # sysctl -wq net.ipv6.conf.all.force_forwarding=1
>   # sysctl -wq net.ipv6.conf.all.forwarding=0
>   # sysctl net.ipv6.conf.dummy1.force_forwarding
>   net.ipv6.conf.dummy1.force_forwarding = 0
>   # sysctl net.ipv6.conf.all.force_forwarding
>   net.ipv6.conf.all.force_forwarding = 1
> 
> Writing 1 to all.force_forwarding afterwards is ignored because the
> value did not change, so the interfaces are not re-enabled.
> 
> Reset all.force_forwarding too and notify netconf listeners.
> 
> Suggested-by: Ido Schimmel <idosch@nvidia.com>
> Signed-off-by: Gabriel Goller <g.goller@proxmox.com>
> ---
>  net/ipv6/addrconf.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/net/ipv6/addrconf.c b/net/ipv6/addrconf.c
> index d9d13e78bf13..9007a58039e6 100644
> --- a/net/ipv6/addrconf.c
> +++ b/net/ipv6/addrconf.c
> @@ -905,6 +905,14 @@ static int addrconf_fixup_forwarding(const struct ctl_table *table, int *p, int
>  						     net->ipv6.devconf_dflt);
>  
>  		addrconf_forward_change(net, newf);
> +		/* Disabling all.forwarding also resets all.force_forwarding */
> +		if (newf == 0 && net->ipv6.devconf_all->force_forwarding) {
> +			WRITE_ONCE(net->ipv6.devconf_all->force_forwarding, 0);
> +			inet6_netconf_notify_devconf(net, RTM_NEWNETCONF,
> +						     NETCONFA_FORCE_FORWARDING,
> +						     NETCONFA_IFINDEX_ALL,
> +						     net->ipv6.devconf_all);
> +		}
>  		if ((!newf) ^ (!old))
>  			inet6_netconf_notify_devconf(net, RTM_NEWNETCONF,
>  						     NETCONFA_FORWARDING,

Reviewed-by: Nicolas Dichtel <nicolas.dichtel@6wind.com>
