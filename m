Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792469656;
	b=jBFGvfEr9jSk9XHH81frRjCzxnTHcKR8OQrvLBFV7Agf/RIldgelVxzuHQt12mIltps9
	 HKf56SCXa5JAeaAubnrOE2wXygCUErk6e3jE6/Yy2r8EBbK7hNt5M0CDK1MfoMmReYo0F
	 bKPSWKmp4IODg6psXfjG1nOrrtWA2MzW1GFdrtYNQhkQd/xxT/zAhWVLTrPjBelHVz4vt
	 wAC3fQA57cCTbkfWqoCAsqc1NQnHjg4JJTRSilXpVowm7WQdGXT5bPvblzaGMRPh1frny
	 kEQ3W2U1/hdSMwnYa8XpCoJHbp/ZyDbDvrZP1jl6xOA0jnD87IxZfQJBOraoFiqDMXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792469656;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=DxN0sudUJewCfLMVKKP0r2+HbKPiDu9x82FTF+O+lI0=;
	b=BgXxsjfwH4WqiDWkIGCyWur4XZ1xJlzHNykgtSVb6voubnOX8n741HqdZgMz9INzOV9a
	 GxluFgQmFfZfOcJwx314mFqbtNn3hlLh9aM1D/DMic8xTKy2yFklCjcDtvLTGmalIEQtI
	 Ij1RK1rlGgYEt73+MJA+zT25Du6FUPgFswzm0g6WdrBP2N6mCtMa5tnXmINltufW0KhDu
	 cARiRq1VqFPY0F1M+nNGzD+JqrM7ipc8ompA8P+iv9sFGCtPwXBPWzEaMhBHCq1bON6P1
	 culmf1Os3S/9f7OrabhqBDGs8a0cfuZvbqh6Mf6F/DyAm9SvMl6HB/rgrleqzOKyFYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=LzsmHutE;
	arc=none smtp.remote-ip=209.85.216.72
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFB28606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 04:14:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BFB28606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=LzsmHutE
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ab341816f6so1884475a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 21:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792469655; x=1793074455; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DxN0sudUJewCfLMVKKP0r2+HbKPiDu9x82FTF+O+lI0=;
        b=LzsmHutEAkSwECaGW7SRlHcfzN1LHNEMg656QTfmCQBqL7UEBi33rfcbEskFy9Vf9s
         aYzUQz1s+u6xwaHKJIOgvJV+/TU8TQN3Ec7IRKqccgQqKQKiWyfo1iKQ9aFez6FLgZQe
         De0fmxQuZsv0ZqLwNBKPUfhdTbRVQdYrqMEj4BEjVPjftrU7Jl97RIWyS/Qk6qogxzSW
         ub4cG4zwOSI4OlPNHSKSLiOPK2dPfY1QS+i7NyYWGIyz57OWVVfnMLvqY47UKXMQN6xI
         CFd9uSxaAwQWHfjhnNO96tmg9OR0hZxDjb9CZ6xta48phnYcjxa9sYLNlO7AB8AzlSdl
         Pn+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792469655; x=1793074455;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DxN0sudUJewCfLMVKKP0r2+HbKPiDu9x82FTF+O+lI0=;
        b=CiBqCMxAcDfexbgDtU6bKmVJS331Jz41qVC1NDDDm7n6Bq1yy+M/yZ2FBTGv11Vuem
         92s34oe4mbZ1wUY9wP0qo9Bp5xL0rJr9HaL7hkMyXsRa2a/axpfDaiaCtJ7b87Zv8wN6
         NvaMzZq61Gv6gLR0QbjWkXmwgWZ46+W8CdnfWvSuOjMdTDHuSC2kpCppWduA2Lc1vKE8
         pbFv9a+Tznr1gu4p6Ayitw/tW4YaQXmI2grf5/zY3trmLz0aSOv2Q0CSS4Eifpb7dnxd
         fpB5HvxDy+fA8lXepUG4t2zBxIPe9exvJoJsOZ2NBUBQR4wUC2qiArcOAPPuTgBJo5up
         WFNQ==
X-Forwarded-Encrypted: i=1; AKwUvBw4f+9sBTPYLHJILPNZ/CMSpPsB6gUxTLmGyPkFtfMGsAOrQqNagVcOGMITUJWuAQfa5rlSRBZbGAL+/rI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLa0g9jjSZ3TjcV8ZmoHv3e53mLn7bQvfN15M+cSV4Xm3UM1S1C
	gWcCtzgcWBVDhjEs2O3e4wKijyEfh1YqK8z9PurzgCzNoiR1jn3I57WPS9Tsu7dWAUaWx53bLbp
	aDCvVNg==
X-Received: from pjee12.prod.google.com ([2002:a17:90b:578c:b0:3ad:4377:79ba])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:e7ca:b0:3ab:f38:2b3c
 with SMTP id 98e67ed59e1d1-3acef13eb0cmr8177489a91.28.1792469654868; Mon, 19
 Oct 2026 21:14:14 -0700 (PDT)
Date: Tue, 20 Oct 2026 04:14:14 +0000
In-Reply-To: <20261019-bug-net-netns-move-rcu-barrier-v2-1-b6eb7780c492@gmail.com>
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
 <20261019-bug-net-netns-move-rcu-barrier-v2-1-b6eb7780c492@gmail.com>
Message-ID: <atbqjdy_KVld_WAC@google.com>
Subject: Re: [PATCH net-next v2 1/3] ipv4: draw rt_genid from a sequence
 shared by all netns
From: Kuniyuki Iwashima <kuniyu@google.com>
To: Qiliang Yuan <odys.yuan@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>, 
	Nikolay Aleksandrov <razor@blackwall.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Mon, 19 Oct 2026 11:31:15 +0800, Qiliang Yuan wrote:
> An IPv4 route records the rt_genid of the netns it was created in, and
> rt_is_expired() compares it with the rt_genid of the netns its device
> belongs to when the route is checked. Every netns starts its rt_genid
> at 0 and increments it on each cache flush, so different netns often
> hold the same value.
> 
> When a device moves to another netns, routes cached through it remain
> usable until dst_dev_put() points them to blackhole_netdev. For a route
> using a nexthop object this happens in nexthop_free_rcu(), which
> free_fib_info_rcu() queues from inside an RCU callback, so the
> rcu_barrier() in __dev_change_net_namespace() does not wait for it. If
> the rt_genid of the new netns matches the cached one in that window,
> ipv4_dst_check() accepts the route and a socket in the old netns keeps
> sending through a device that now belongs to another netns.
> 
> Take every rt_genid bump from one sequence shared by all netns, which
> never hands out 0, the value every netns starts with. A netns bumps its
> rt_genid on NETDEV_UP before its devices can carry traffic, so a cached
> route never matches the rt_genid of the netns its device moves to.
> Concurrent bumps of one netns can leave the older of two values, so
> rt_genid is no longer monotonic per netns. It is only compared for
> equality, so this costs at most an extra route lookup.
> 
> A connected UDP socket in netns A caches a route through a nexthop
> object on a veth. The veth is moved to netns B and brought up with one
> RTM_NEWLINK, then the socket sends 200000 datagrams. B's rt_genid is
> bumped 0 to 20 times before the move, 63 trials:
> 
>                                 before     after
>   trials sending after move          2         0
>   datagrams sent after move       2616         0
> 
> Fixes: 4c7e8084fd46 ("ipv4: Plumb support for nexthop object in a fib_info")
> Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
