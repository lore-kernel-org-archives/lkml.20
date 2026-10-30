Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793383097;
	b=ra71tXnhc0nejzhmQeYFbTHiC2qqEqa5wX/Z4jxOcPlCovs1F2b4FsELK9HDiw1ui6yv
	 iuKxlKlRNaSn/yFCFkRgX2IOgkp/4kPx1a4AKJwScEdNRh52OBuYxkJRNZc0ryDAZb4Uw
	 /HAAfJ7KDdhgpaXl+hUXSQ5Q4+bfiAF1Qw+fYfyXI8GDfDhtVXqoEjQqG4FrsnjnlVQ02
	 TAZ9wak8PuNWTQvRv5h+2SQgvW0dM0evnPjJ4FT5PdhrlM/4hpVgJIUbgxepm42JXr5FG
	 93Hf9b2KyMTFSQgXTG80Jz0agc63gkNLTdQPkISO2nP0S3qLHxLo7Yo1iKbt7LKotKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793383097;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=aTzRns4P41LTvEjZitBtZ35u3x5iyyKI3BwYPIuLk0Y=;
	b=UsyguqIdF52rE3evHPmj3HacPLHI/Hw4gDgGwXnCP+N3u5B08DFhIGfpMC4UX1dFQAC8
	 pzCMmKKOY6J3AQEJtxTKSWwK+oEe3AceLPiNGRE+RAiis0BnUdLItG8xqF4/zDtff4Cwc
	 9txbCBYd20lyyxAMqB4RXsXxzr89KK2Q4pn8bC/+O46UwtYRJD/UXvOEhw4+uxRF4e9zO
	 1Y0N4zDJdrhW1DFNyjhw72yjYyVjY8R9RG8UygpaQ/HF2lOgqPDnrkMAEVvuF+0tin8dx
	 y1xemCEEqx2at1IL9VOias5lyE0hKSar+Z0JFE+feIjm+g7/e44vba2gmGFfEHapZKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OH6REcCW;
	arc=none smtp.remote-ip=209.85.217.46
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3137606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 17:58:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3137606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OH6REcCW
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-78fb1fb9508so1786224137.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 10:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793383096; x=1793987896; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aTzRns4P41LTvEjZitBtZ35u3x5iyyKI3BwYPIuLk0Y=;
        b=OH6REcCWtn8nG/b0uztoyUtP7F0ry1Puw5O7NoS4qy2UmbvdtK8W7ZCkAIPQskbBQ2
         4b0LCW2YEN9QqyRpfuwgwsbRMnjGOr3UteVEZpp1V9uzo82PLbHMfFr43OT4BGlk7OTV
         HZVPPlolJu3NG1SCenT7OaQ2mvaPTVAo4BpQPg/6MkMKDy8pwZNxGkB7vZ0es4BEJw/D
         b5rj5AphjNxt/AAcAtwx2nz2XSJ376aThZv/cCzjLvw3JVdx5YZ7vlQxwAPB9D0O6N2u
         xU8MXus+rt1YKuHV6A7YBNwASV3R9mlFCpX+ovEDHw4lJGoHz1XlzYmzZ54GS9puxqKT
         /Tbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793383096; x=1793987896;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aTzRns4P41LTvEjZitBtZ35u3x5iyyKI3BwYPIuLk0Y=;
        b=RWMHgYidmfDo/PpmydWCxk6gpNeY+5hPsbV1AxU38ojKxfb0GmQteddn2SCNu/d1sd
         Cv2W+lAo/A4hSDCEexUbDruTwiK6bltmo72zqdI3ofFxl6DXxlNHgY+qgpYeSpqw1GHZ
         9WkWB+l8jXVQejhbqSC3ebaL1ZpHNXYAS7XH3mNBYI5diz8H4EtBSehEH0KwaeemWCqj
         0UnP+h+YcYRV6vPJMpK0pxuPq52gWvqp2veYs7GKJctPM3XI7H+uMvQDo8fCNx+2+OuZ
         xfiAzg5ZrZXcPgS+SR2l8rsxQht38CJms8oWgj5Rh4ofPvLNha5yPegQyRI8hjhLPVE5
         BebQ==
X-Forwarded-Encrypted: i=1; AKwUvBxmbri5kfwqQSQhQy9aTfj7Qz5jNhJzsdNkwiw55oZovIdySRy+jjrbsvrbl5mPoBb+D+LUKbqETp+by5c=@vger.kernel.org
X-Gm-Message-State: AFq9FYL6XVxW1+9/n3jz1oVWaZebSB6YTCrdEKfJwvBuL6wT8fSG5fgY
	p6jixOKbz6YZj/bPtDix9ZwViXrsCIkUq3CHAKMCs/WUizt4yyDOE5yN7v8S+g==
X-Gm-Gg: AYBFou0uULAUZYMkEPmI3Iy/yAc96FDRfG3BIoyQY3c0cOZ3rNK0dQ6AQCmFYR9jgUP
	omR57XmMAOXwchsXpEMw3otNDlftaqrqvIE5X/B7sdCBY9Z7EbnBhWuj0I/Z3r6NaDnZmZSNBF0
	b7ZfYPHe30DGKT7zZtjSRz44qzFaUYyW1UX3UMJjkZLkd8l6V4VPBCJkfsTHKzz07cRrXTmObIk
	MOCFlORmVzzO0yv37KLA6JyU7ET4WE1bNsB7wg9H70sMmxWt7qbJOrPB6MziekkUuYW5F2IVAc+
	a8ncM4z9ygCxgytP1FDt9C+bLo700XuJe/nJ153/+G4G6OqXs3fOrpBmzk514aFuA7O6CECDJiE
	sCK139rHbwPmcU0ea4Mxeifyzny0DAKzg0zI9M5r8g+aqO1T1STrPmCXtI50mVjgdJLV/gIU7u2
	xtlGAyyH/790nkgZsSuhCsq4cra5zJD/0FPbRi+V3cRWTFTQc+3ceFzdOJIIUg9d5KQLtljgCKf
	sTmzSRlyDMo1/KIXKo2Vrqj5OW4BcVZ2Od9JCwO7E89vA0bv1Rxemkscz7x9g2ehgGBBNTvIuIh
	v5WI0/qCLiYlHDBh78MnsweKbkxM4bk0fzsggaVUgNKAZ6UiQNUaq0LqRRdiQeSuxWFqcRgOyWj
	MRrVIBwQfHRMqQFXeg92xwiMPRCmao6CYqaAHLzW+XfQKUL5Hn3J1C5ubkP56/2WgEWIB
X-Received: by 2002:a05:6102:50a5:b0:7bb:64cc:1362 with SMTP id ada2fe7eead31-7d072c2b96amr883485137.6.1793383095802;
        Fri, 30 Oct 2026 10:58:15 -0700 (PDT)
Received: from gmail.com (111.46.245.35.bc.googleusercontent.com. [35.245.46.111])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d0770b28e0sm3198299137.0.2026.10.30.10.58.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 10:58:15 -0700 (PDT)
Date: Fri, 30 Oct 2026 13:58:15 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Xia Yan <yanxia@cmss.chinamobile.com>, 
 netdev@vger.kernel.org
Cc: dsahern@kernel.org, 
 idosch@nvidia.com, 
 davem@davemloft.net, 
 edumazet@kernel.org, 
 kuba@kernel.org, 
 pabeni@redhat.com, 
 horms@kernel.org, 
 willemdebruijn.kernel@gmail.com, 
 linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, 
 yana06070@163.com
Message-ID: <willemdebruijn.kernel.6ba984cf38a@gmail.com>
In-Reply-To: <20261030141435.779302-1-yanxia@cmss.chinamobile.com>
References: <20261030141435.779302-1-yanxia@cmss.chinamobile.com>
Subject: Re: [PATCH net] ipv6: fix cached route reuse for SO_MARK control
 messages
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Xia Yan wrote:
> A connected IPv6 UDP socket can reuse its cached route when a SO_MARK
> control message supplies a different mark. The packet then takes the
> route selected for the socket mark instead of the per-message mark.
> 
> udpv6_sendmsg() sets flowi6_mark from the control message and clears
> connected. However, ip6_sk_dst_lookup_flow() still tries the cached dst;
> connected only controls whether a newly looked-up route is stored.
> ip6_sk_dst_check() checks the addresses and output interface, but not
> the mark.
> 
> Commit 42dcfd850e51 ("udp6: allow SO_MARK ctrl msg to affect routing")
> fixed the mark used for fresh route lookups; connected sockets still
> reuse the route cached before the control message.
> 
> Reject the cached dst when flowi6_mark differs from sk_mark so that
> the packet goes through a new route lookup with the requested mark.
> 
> Found during code review of IPv6 UDP route caching. Reproduced in UML
> with a connected socket and a fwmark rule pointing to a prohibit route:
> marked sends succeeded before the fix and return EACCES after it.
> A two-interface test also confirms that marked sends use the selected
> interface and subsequent sends without a control message still use the
> socket mark. cmsg_so_mark.sh passes before and after.
> 
> Fixes: c6af0c227a22 ("ip: support SO_MARK cmsg")
> Cc: stable@vger.kernel.org
> Signed-off-by: Xia Yan <yanxia@cmss.chinamobile.com>

Reviewed-by: Willem de Bruijn <willemb@google.com>

> ---
> 
> Tested on net 5838f10563d58afca6711edb5e4eda968ca181d9. The relevant
> send and route-cache code is unchanged at the base commit.
> 
> Full x86_64 W=1 builds completed before and after with no new
> diagnostics, using configurations based on allmodconfig and
> allyesconfig. WERROR was disabled for both; allyesconfig also had
> KASAN disabled. Both used LD_ORPHAN_WARN_LEVEL="warn" and
> DRM_WERROR=n.
> 
>  net/ipv6/ip6_output.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/net/ipv6/ip6_output.c b/net/ipv6/ip6_output.c
> index 25fe0ba98b1a6..843bb95e635b9 100644
> --- a/net/ipv6/ip6_output.c
> +++ b/net/ipv6/ip6_output.c
> @@ -1125,6 +1125,7 @@ static struct dst_entry *ip6_sk_dst_check(struct sock *sk,
>  	    ip6_rt_check(&rt->rt6i_src, &fl6->saddr,
>  			 np->saddr_cache ? &np->saddr : NULL) ||
>  #endif
> +	    fl6->flowi6_mark != READ_ONCE(sk->sk_mark) ||

Asides, not expectation that you fix the following:

The same is probably also true for flowlabel and dscp.

Not net material, but ideally ipv4 and ipv6 would do the exact same
thing.

>  	   (fl6->flowi6_oif && fl6->flowi6_oif != dst_dev(dst)->ifindex)) {
>  		dst_release(dst);
>  		dst = NULL;
> 
> base-commit: d8a4f4c59da52b7c31ae337243b8473a19a3f819
> -- 
> 2.39.0.windows.2
> 
> 
> 


