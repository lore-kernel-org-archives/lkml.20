Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792469833;
	b=zn3W6zpz5pb3t2XVq9Le9+Vf7Vqq9D7FYS405z+wB0txn4epjjFh92nrCJpExcIvYuJr
	 po2sLcR+UP1Gg6BD+0pbJ4Hx7QhIQmDBrlTGPynSJex5KPBO4jGIAUP9J9qZ3J+Ldqd49
	 m9qAbKsJR/8iWO4PuIQiJPaGWzPlU+2lJIiX+0m0lQTS+rpe2JkWjQnPd5Mbq540irCCc
	 QQqkYKddkL+zp8adYmT4IItUaH0yLk0h7k/3uD63VGcq+q119K2X5kuhS/LuoNkkAGSrU
	 mGQrXw7hUkoOUI2uhMTBSe961a0L+OW2y5xUNhX+Je8kTPhaB/uIy86BlLRjXXuBNIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792469833;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=y3El/zgkrIeOwSVM/xohA1VqXQV6ttAXBbNdMdXf5L8=;
	b=apH8SIaUE4PwVotCH65qz/NBw5JqCcPxw6IjaRL/0feGfkXGZnVJ+7XlSpTFlRsE8DJp
	 Tp8veTRLxk3QjX5t+KcpcQrIql7Eir95R4KowbbhFfGz33b9j1A1DTa+LL74nrPLLaITD
	 WoB3cV5547H+bqx804JTxEg7Uh2j1rcgg5dzDaDIXxzbPJ7f52DMckhHWo3SGsHr1I8zL
	 NzquNEJjik7jiyfXOMyhdegByPB6UQou2L8zNVP0VbKWbpCGceWDuUn2LwwTToUCoIyJ9
	 ukbSjYDSYoe5cAe1SMcvJ4zOb46B29h0pZPiTjnwav2fVqr3dL141Bojv7OpKdXF4Mg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=Vru2u8Jq;
	arc=none smtp.remote-ip=209.85.214.197
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD12D606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 04:17:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD12D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=Vru2u8Jq
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e85f74c21aso2961915ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 21:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792469832; x=1793074632; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y3El/zgkrIeOwSVM/xohA1VqXQV6ttAXBbNdMdXf5L8=;
        b=Vru2u8Jq82+miZuKIMq+iNrrySMlbLwYlqtQrdYaraqYni21KD8DxLXUPTGa4QAwLf
         f7qBlLr4I1FbdSRQzAcfsQfOT0ZrlUTn73WWjW5MQJW4AW9rEJZoiAWDBnvSBN3ADDO/
         4TSMaILDuaVNgWpB6Iz1aFKsc7v/dB37P/CqjiqqXq4aGVX1O/42mZLdNoBGPcUbF+pn
         7wWrteItlH/2NGR31vXppE9xfDYKOfVEL8xFIPUB+8p91KAZfPQIUB1UzvkQguCwYW32
         EWZ5h3nKIIrHS3aC1OfC59CccWRenvr8xuRaWjm/eQhYguOogTxq1ctfdSifY+y1GpYr
         xIOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792469832; x=1793074632;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y3El/zgkrIeOwSVM/xohA1VqXQV6ttAXBbNdMdXf5L8=;
        b=JuNrVj03AApR085T5Mqzv9BHyGyMYN1+IbnRkqQ2wBhavXfI54iJeZShV3MMNKLSn2
         yyo3ddd6KsWJI3YxSgbEDkLd04neilAmoBEReeyoTe0H/KEAZSYNskbSTrvBSGoimsaC
         qJOwhdAlej25E8Hakgh9lZTmETg14pevNngWBi39sg5yWfwDrsoA31V+Gl7B/SIv/90W
         Ga72yFdok1RSxAke5GS6nKvpQ9EvTIOacz5V2XjnqBITqnef0xrGNB9UDA3ZMeqlj5In
         tT/yUXy2HuzLurw0DHvLgfV8esjP/nReqA5UTSZLph6MlvO/tUWodzgm9gb9LlS1TS12
         zGcw==
X-Forwarded-Encrypted: i=1; AKwUvBx0fWsysTDluifiBKh8ZG3DUnoO6FvTWMhY4kNQUswmC5h0H/LxuWKFtkHhqEZI+pZS9kDHpWU7WNmKoVc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKICcbdDVIghWa0ch8DfkRSrH6ki7Xu0qTGnvbUCr5RYrpg+hX9
	9pOy1NAbnGo0tJXuuia3olYw3tSk4izKLMaBYruFiSOPU3VF1gmlvKac4VyGABOMCUJjKuWJ5Ts
	CvoRPLQ==
X-Received: from plsr10.prod.google.com ([2002:a17:902:be0a:b0:2df:a429:6698])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:d4c4:b0:2df:b510:cebb
 with SMTP id d9443c01a7336-2ea1d5d079bmr7431245ad.6.1792469831159; Mon, 19
 Oct 2026 21:17:11 -0700 (PDT)
Date: Tue, 20 Oct 2026 04:17:10 +0000
In-Reply-To: <20261019-bug-net-netns-move-rcu-barrier-v2-2-b6eb7780c492@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261019-bug-net-netns-move-rcu-barrier-v2-0-b6eb7780c492@gmail.com>
 <20261019-bug-net-netns-move-rcu-barrier-v2-2-b6eb7780c492@gmail.com>
Message-ID: <atbrOCfiVAJrmUgH@google.com>
Subject: Re: [PATCH net-next v2 2/3] ipv6: take fib6_sernum from a sequence
 shared by all netns
From: Kuniyuki Iwashima <kuniyu@google.com>
To: Qiliang Yuan <odys.yuan@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>, 
	Nikolay Aleksandrov <razor@blackwall.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Mon, 19 Oct 2026 11:31:16 +0800, Qiliang Yuan wrote:
> A per-cpu IPv6 route of a nexthop object records fib6_sernum of the
> netns it was created in, and rt6_is_valid() compares it with fib6_sernum
> of the netns its device belongs to when the route is checked. Every netns
> starts its fib6_sernum at 1 and increments it on each tree change, so
> different netns often hold the same value.
> 
> When a device moves to another netns, such a route remains usable until
> nexthop_free_rcu() releases it, and fib6_info_destroy_rcu() queues that
> callback from inside an RCU callback, after the device has moved. If the
> fib6_sernum of the new netns matches the cached one in that window,
> ip6_dst_check() accepts the route and a socket in the old netns keeps
> sending through a device that now belongs to another netns.
> 
> Take every fib6_sernum bump from one sequence shared by all netns, which
> only hands out values from 2 up: every netns still starts at 1, and 0
> means there is no sernum to check. Every netns bumps its fib6_sernum
> when a route is inserted, so before a route through it can be cached,
> and the new netns does so before the moved device can transmit, when
> NETDEV_UP adds a route through it. A cached route therefore never
> matches the fib6_sernum of the netns its device moves to.
> fib6_new_sernum() callers only hold their own table's tb6_lock, so two
> tables of one netns can store their values in either order, and
> fib6_sernum is no longer monotonic per netns. It is only compared for
> equality, so this costs at most an extra invalidation.
> 
> A connected UDP socket in netns A caches a route through an IPv6 nexthop
> object on a veth. The veth is moved to netns B and brought up with one
> RTM_NEWLINK, then the socket sends 200000 datagrams. A route is added to
> and removed from B 0 to 20 times before the move, 63 trials:
> 
>                                 before     after
>   trials sending after move          1         0
>   datagrams sent after move        251         0
> 
> Fixes: 8f34e53b60b3 ("ipv6: Use global sernum for dst validation with nexthop objects")
> Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
