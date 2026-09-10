Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E644946EC60
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 10:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789037695; cv=none; b=cD3QEgpok24Riwxj3q53ZB9Me+sgkGw2iEX/8yua7tKjZlFyAnXbUIgC5msir7TE0Mj2qHhhOq9jlRyYOqcbM58MJg7pexxHE/OZ106aXDEc0hVYXQtws02lnFU0/gjql4DU0mo6eiTuZA2TnD/YamTWOnGU9UvQweRZAoRuDcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789037695; c=relaxed/simple;
	bh=xKvECS4AWJ/NnpQ+/FwuwBj8vEnB+psTFAUs/VtHBb0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cFw4/UVwLD8MS4fxpp5/CpD+cfC0aVK30Dz6RgAeONFGl6aKHs6RP2A27F0AEdvwpVjGT+IyN5pfRWFboiN688G40XcKOjsYHQrahrilzah3TXo+aHwZLszkQWzHgJcfsjFrMVwBs2FUJTnXNoTA5FMTjJ5d4RLIchLwwI1tNTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WnSp8Jhs; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WnSp8Jhs"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-484366874b0so1231967f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 03:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789037680; x=1789642480; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=maPLp8fgO9tG0pRsQXjfvEJQO2luldihuXf6kOsu+hQ=;
        b=WnSp8Jhsjr6jbN1na12RUETkmZlKrzObJ2iV9Zz1JmgNzQ8I4BQK1zUGnf/UJHvBlc
         tq47wWP/Xh9g7mH0zSUGIWbbIqJIeAjOtI3obHcKDGHiY5qfifoJDbja1MQi5oLvPxsp
         clZFbkgHIZIAyMev2Zp8e5MRT24R3nYKZSv3kNy0fP0hZkRb1kmVb6XJ990f9Trqjoi5
         FuXTfe03YTLDPUtWZPCAUqEZndCAPZ4CaS+HMKGXnuAtlEZo6P5iBlMeEAefmU5P8bPD
         4JEQ4Yx9BWm76HyXUrUSK7R8Llv57c8YRY7WLdY1Cgxqwp+fYxwnJ4wtiCXYa9In0d2Z
         /rhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789037680; x=1789642480;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=maPLp8fgO9tG0pRsQXjfvEJQO2luldihuXf6kOsu+hQ=;
        b=rWBAuYoMMIoBdhAvmv7ZLzYTVPX4uX9tA1g/FHNQkZG8h1OVzremg2TKDNzxBdclgs
         BnWIbC2y8GZxu5Q6qG2PkbYVOot8IPnvQzyJrPkuSpuQWrOMushrp8IeJzwn8dxqnEvW
         Uqp2xrSxjvNd1rB5kwratGmngpAiOvVag1HpGK23py2L4hCIYQ+IrtAMMJEaWf2epaad
         rETgHJrMCYsFtFWY1GfkTLPtTQlPl0qN0PmDeyuKeqgNtX9/bIU5v9xBXezlSzUJ5R2u
         mgHZZaO1n/2/1AEjRpDD1NsNv8/ArHndpWUF3BfkXowLzQkDBDdCANLzSqetAOThIZ4S
         +Svg==
X-Forwarded-Encrypted: i=1; AKwUvBx2i33GYBFhYccjSioq5mLMdfJ/TUs3LRBxRJZO+3w3PCw2wf8Xy8CS5k6PnOSCCNaAAzW2VEQspsq70R0=@vger.kernel.org
X-Gm-Message-State: AFuF++kjyoRPWPoyYl+7il/ZaWF+HofG9q205D5T4lhPbq1EN24CFUQf
	xZliuttQ++WHBLAg7UZygVqnc5X8F53g24Imvsf1VjgR8VII6L02qbKS
X-Gm-Gg: AYBFou1HJui4DRHrPEnOAKaRh21My+SUnnJVIzzsqc8YhfvrGltS1zHq0wqnCsoekoU
	mlFtTlf2UkWhY+mcfVyTSs9nRb+BbUs83Mq/NmsoYzUITudcHxZupFKAHnCGb4MeDxMfT9dg9x1
	uS8ddmLk7QGP/Oxi9IRwRj6/l00xI34jjlBO9RzDc33xk5GMTWsct6ayi7zod/BLt+8DmVdDa4S
	yUKfIBN14F2nk4xftEf+08LCczlWB3QSeKbnZnsmIZMU2jYp0ptfY3Ll8fXnpzXmefCagoFfRJl
	S4NsXljpKCh9xlJwnGFbpeoPy3Wg8m6bXCPSmbPxCYO0eeKIbntPsj/JOvdF5xrqu4nyxVjvaTx
	6w+NSRfZ0dUdyWEbcP6RcmvS2YIK2hFjs1V8BIpFUPgiN/+jdWrC/ZyIpTwQ4b/56OmAeM1u6vt
	XbO+STjzjNF/6A5JAkU0BPFVICKN/rjchCxz/nXCeYS2dZwHwZmtxPS0fPWuqPAbg8mZQiL8gJg
	Tqfio1kkYiFZF9vzUy74SV64gltA0b/j/pfUw==
X-Received: by 2002:a05:600c:698c:b0:49c:edfe:d525 with SMTP id 5b1f17b1804b1-49d1f35366fmr250743805e9.10.1789037680290;
        Thu, 10 Sep 2026 03:54:40 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26be64a5sm62886595e9.6.2026.09.10.03.54.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 03:54:39 -0700 (PDT)
Date: Thu, 10 Sep 2026 11:54:38 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Lalit Shankar Chowdhury <lalitshankarch@gmail.com>
Cc: David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Steffen Klassert
 <steffen.klassert@secunet.com>, Herbert Xu <herbert@gondor.apana.org.au>,
 netdev@vger.kernel.org (open list:NETWORKING [IPv4/IPv6]),
 linux-kernel@vger.kernel.org (open list)
Subject: Re: [PATCH] ipv6: replace sprintf() with no format specifiers with
 strscpy()
Message-ID: <20260910115438.1c89b372@pumpkin>
In-Reply-To: <20260909210552.51828-1-lalitshankarch@gmail.com>
References: <20260909210552.51828-1-lalitshankarch@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed,  9 Sep 2026 21:05:52 +0000
Lalit Shankar Chowdhury <lalitshankarch@gmail.com> wrote:

> Multiple instances of sprintf() have no format specifiers. Replace
> them with strscpy().
> 
> Signed-off-by: Lalit Shankar Chowdhury <lalitshankarch@gmail.com>
> ---
>  net/ipv6/ip6_tunnel.c | 2 +-
>  net/ipv6/ip6_vti.c    | 2 +-
>  net/ipv6/ip6mr.c      | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/net/ipv6/ip6_tunnel.c b/net/ipv6/ip6_tunnel.c
> index d5ff50a2ac01..ef3a6d931c9e 100644
> --- a/net/ipv6/ip6_tunnel.c
> +++ b/net/ipv6/ip6_tunnel.c
> @@ -294,7 +294,7 @@ static struct ip6_tnl *ip6_tnl_create(struct net *net, struct __ip6_tnl_parm *p)
>  			goto failed;
>  		strscpy(name, p->name, IFNAMSIZ);
>  	} else {
> -		sprintf(name, "ip6tnl%%d");
> +		strscpy(name, "ip6tnl%d", IFNAMSIZ);
>  	}
>  	err = -ENOMEM;
>  	dev = alloc_netdev(sizeof(*t), name, NET_NAME_UNKNOWN,

That code is silly, there is no need for the copies at all.
Something like:
	if (p->name[0] && !dev_valid_name[p->name])
		return ERR_PTR(-E2BIG);
	dev = alloc_netdev(sizeof(*t), p->name[0] ? p->name : "op6tnl%d",
			   NET_NAME_UNKNOWN, ip6_tnl_dev_setup);
	if (!dev)
		return ERR_PTR(-ENOMEM);

David

> diff --git a/net/ipv6/ip6_vti.c b/net/ipv6/ip6_vti.c
> index ab94b3a4ba9c..182a7949d830 100644
> --- a/net/ipv6/ip6_vti.c
> +++ b/net/ipv6/ip6_vti.c
> @@ -210,7 +210,7 @@ static struct ip6_tnl *vti6_tnl_create(struct net *net, struct __ip6_tnl_parm *p
>  			goto failed;
>  		strscpy(name, p->name, IFNAMSIZ);
>  	} else {
> -		sprintf(name, "ip6_vti%%d");
> +		strscpy(name, "ip6_vti%d", IFNAMSIZ);
>  	}
>  
>  	dev = alloc_netdev(sizeof(*t), name, NET_NAME_UNKNOWN, vti6_dev_setup);
> diff --git a/net/ipv6/ip6mr.c b/net/ipv6/ip6mr.c
> index 3f2ed9b77deb..20ac8cb87468 100644
> --- a/net/ipv6/ip6mr.c
> +++ b/net/ipv6/ip6mr.c
> @@ -692,7 +692,7 @@ static struct net_device *ip6mr_reg_vif(struct net *net, struct mr_table *mrt)
>  	char name[IFNAMSIZ];
>  
>  	if (mrt->id == RT6_TABLE_DFLT)
> -		sprintf(name, "pim6reg");
> +		strscpy(name, "pim6reg", IFNAMSIZ);
>  	else
>  		sprintf(name, "pim6reg%u", mrt->id);
>  

