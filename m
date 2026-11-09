Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.6
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794248962;
	b=p0Kf0meXN9ecgKZ0XzcUApvz6eGe//sSVrUp4uBcqRoZkK+r1oppIk+RxhZNm1LqLE2W
	 msn3GN2sDhAJ7Qqf7Oo+LBmFPxEE9BbBxLhT+2u9ty2n1uwtdDCP1N6BMuCqouhlB86wK
	 jW26CjZ0GTHDIT7oU8dMadaAWf3gH87Rj7MkK7gGNcP9DkTDAdunin59bqCGXI9ZsPQd0
	 F6ujwkSZYXjwK7w8hip8l5RjheXQWqIyR1K3i9/I5WBt86NXvDl0NS6Xb6ctI0tyWJgfs
	 rK/kXrWof78QCAuLDSQZclwUmT6Pz+nysmUTsJtcZX1ICevXFNG1aZgUH6mAk+JBSJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794248962;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:In-Reply-To:Subject:Content-Type;
	bh=eZXah+GU1zYRZgrwJ8SeyJuEq1JV0JX65ZErGIYWKN4=;
	b=G1E98R7UJ0pxuR0VH8tYtGvj7wncP3wn7UXwUr4FGdsCKma35R1n5Jv+YUlkhCj8XaqE
	 UedL1IXURDy5EFPYNR8SaYHbkrjdGbiEGFmWRzBJaQtFu6WYKVBFdhStczQiKd+5r7SBH
	 ipm8OXeV6h7oU9AJJbX+9RCeS/+1fh0jwgtHguY9iOJ+QxAGs5c1zs/4PfF+8cs8u4IZ5
	 alW8T+eWqefIKxGwc9aYURp8989Q7sagJUsnpCQpMssbI3+yvza9LCd03BYScoEoAEkeH
	 UOwLwDxv7PnIYbe/Hh9yQcOz1RWzTtoSpzkUdoUgsibwCHw+SW5aCIBFrxks1T7Gi3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KSJhy7sp;
	arc=none smtp.remote-ip=74.125.229.6
Received: from mail-dy2-f6.google.com (mail-dy2-f6.google.com [74.125.229.6])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CD666070EFB
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 18:29:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2CD666070EFB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KSJhy7sp
Received: by mail-dy2-f6.google.com with SMTP id 5a478bee46e88-35adc681e1aso1649138eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 10:29:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794248961; x=1794853761; darn=vger.kernel.org;
        h=content-type:subject:in-reply-to:cc:to:from:message-id:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=eZXah+GU1zYRZgrwJ8SeyJuEq1JV0JX65ZErGIYWKN4=;
        b=KSJhy7spSVu5bxRcystXBVzm1AoZWAvdpFQsG4ejBx9otx6a4+2dMgf2GDHtdvnAGF
         jA2RS+6Esp+A1s1IsndxuLyW4jjRdT+99xKWuANKBhT7XEBw6JMDu56+D5v78sr+CZQ3
         epMrT3Cb0EOf6gfAYdYs9yft2FRR6cey/8yTtq9j2979h/g75hxWoG4MP8S3dNDq3jTo
         JveOWlD/jjVgTb9h/9sefJef+OQLdIcfAYxIYfK3zpZJFwN+1YZ/gzE45F9G8iGhFOut
         EwlQ0ianw7caxy1nqlGQVzvV5uLTQ9lMZqesTRtpUQ/OFpRz5fRw4c4WhjujA6UhaKph
         H+1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794248961; x=1794853761;
        h=content-type:subject:in-reply-to:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eZXah+GU1zYRZgrwJ8SeyJuEq1JV0JX65ZErGIYWKN4=;
        b=p5F1dTqxVl22ABAH+bgxpLnjTwHnP/Cf7HotlG8HrBZWRmcozZlML0KylpxqOaMjrr
         qTRsPaYZ/V9YJ13P+f59VoP1G6Q+aLhkkujdDHh14h/la5ZKiFZ/lkoMbRhDDrTITogn
         i7QncBQIa0czWCXzMhLygOahgQHbf+jfwMayhZFxo+h9KmlTdTjBNgfLl6WaVQ6BNmq6
         jt1Hqjae17t5lthdyEDqnkPVOR26n1/PjcXIkCBUqBlioUy0dg0KMGAfzNO9pVkR5++E
         o2DybZHzPlmChBQJyQhV+XH06FvQPO3SCrHGG6cuAUE+zXvUNs7+mY8i20fMin366BJI
         np1g==
X-Forwarded-Encrypted: i=1; AL+hErH3oHTWyU+9meMa055jdmLeq6EH+ZdeSmEDp1VikgKoOsBv0rTIxIRgMTn1pgb5WVaVu7dqU2bfKd1pD7I=@vger.kernel.org
X-Gm-Message-State: APuU4Z+LUIWzaF6UdAulT21ElWDaLUBnPDUxllxyOccuz51ELkoIFJpE
	UTlg0qo7uFOk43OUuY9sdBxn4U4haaoirc5LDNpDmBsuJVy66ZsRiLZZ
X-Gm-Gg: AYBFou2woTe5Za8v6rNTtuBtZrikPmo8PPME+CH/h3lwXkCKj3tMqKcnmNoyh0qu04V
	nVAE5tvAxbu9gS/hNO517hMXqoNBaV0zIHSr0OEXMHhT3RNqe2P9tkpbs+6knDaEks2SnSYBEIF
	HfMjxRGLquvwycZH4d3ts52gf1j8Z3+w92MLFhWIlGsQAKVVrWcFn7YY+MaIS7M8PJUVUk0W8z0
	sFyEAqFFhoCaOXcQYWHOJmZ/fZL9AbRwE8dLExqTx6eRE7/5D2l8qlSKpdsOeIOKSAul5bg7LlA
	X5KFM+Xx8dGXRwuZKEqwnW7gvsI/upnQtRKdHTqRzRLbSSZ6v2XLHLwcpV6tQXUX7kWpLNbMohu
	L2Utr8gq+s666I4tKgMxG+3ybT9BCxMSMXT5uU5I4rIFD9MLjsJnmKRcAsnPg4JRr65UDLpQKlb
	P9poi90nAlS4nAnsW/H1SThxrsoD/q3lz9Or2uBQsfqg5vJLDUGC65GiwV6INRuQw6bgx/GBM5c
	oEUgA8rZs7SjzOALjoUM+WW6xT9yqnorosM4LDn49qMZxsOrD/zXFriXgpjyIcZNgjwZEtRPKuD
	3lvmw1wlWBYfneH6FE5Vp54=
X-Received: by 2002:a05:693c:41c5:10b0:372:7af9:b916 with SMTP id 5a478bee46e88-3751ef77c8dmr97324eec.18.1794248961138;
        Mon, 09 Nov 2026 10:29:21 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:6e::])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520608b52sm102777eec.13.2026.11.09.10.29.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 10:29:20 -0800 (PST)
Date: Mon, 09 Nov 2026 10:29:20 -0800
Message-ID: <e4def2839d68382fd50e4fe1e6b4f116@gmail.com>
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, andrew+netdev@lunn.ch,
 edumazet@kernel.org, horms@kernel.org, corbet@lwn.net,
 skhan@linuxfoundation.org, rdunlap@infradead.org, michael.chan@broadcom.com,
 pavan.chebbi@broadcom.com, saeedm@nvidia.com, tariqt@nvidia.com,
 mbloch@nvidia.com, alexanderduyck@fb.com, kernel-team@meta.com,
 sdf@fomichev.me, dimitri.daskalakis1@gmail.com, almasrymina@google.com,
 dtatulea@nvidia.com, bobbyeshleman@meta.com, asml.silence@gmail.com,
 daniel@iogearbox.net, razor@blackwall.org, leitao@debian.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rdma@vger.kernel.org, linux-kselftest@vger.kernel.org, leon@kernel.org
In-Reply-To: <179418737248.994134.10509157155829463489@kernel.org>
Subject: Re: [PATCH net-next v3 1/9] bnxt_en: let the stack segment GSO skbs
 with too many frags
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

> > +#if (MAX_SKB_FRAGS > TX_MAX_FRAGS)
> > +	if (skb_shinfo(skb)->nr_frags > TX_MAX_FRAGS)
> > +		features &= ~NETIF_F_GSO_MASK;
> > +#endif
> 
> [Severity: Low]
> Should this patch have a Fixes: tag?
> 
> Commit b91e82129400 ("bnxt_en: Linearize TX SKB if the fragments exceed
> the max") added the unconditional linearize in bnxt_start_xmit():

[..]

> The commit message describes both problems. Without a Fixes: tag, stable
> kernels that carry b91e82129400 won't pick up this fix.

Will add a Fixes tag, but not sure it's worth the backports..

> [Severity: Low]
> Can the segments that the stack produces here still have more than
> TX_MAX_FRAGS unreadable frags?

[..]

> Could the commit message mention this limitation? Fully closing the gap
> would need a fallback that handles unreadable frags, or a frag limit per
> MSS window at sendmsg time, rather than skb_linearize().

Not sure what's suggested here. The example that's given goes via skb_linearize
and fails cleanly (as expected). Handling this in a better manner is out of
scope?
