Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D2C84CF46C
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 04:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792211712; cv=none; b=bS9tbWF2yQhma2Xv73GyIYlyklXNATNd1FXqh9U2M5zR7auujEcsbhirmhTaM6nUTps2F9icc8CWRsSvhhBlzafysI2IIqr4sHNh3dHZeyIuFTkCZVmMp6orqO59ORIUXhla88wBfrUUP1mf5aw9krzj10lHDoaXGHsv2TZdZEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792211712; c=relaxed/simple;
	bh=7kk2U4a9Lo1xYcGtwJg0lyGzo5dv0nbWpZ3vvoWDVTU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=cgyjpf40kLwnVdfsq8Va/gNfONYZiVa3Ea/GpKHqolE+5kd2r6PoaBWxjHQfglcya55z590WiDVeUvU987DiWkq2F+UBp7MWhR7RASLnAXWk1NaHPUFifbiSfplBuf0JyW64mYz+xqfvfs5IkNhchaUDbxO9aovcv/Qy+57SXc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=J4vVm79I; arc=none smtp.client-ip=209.85.214.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="J4vVm79I"
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e60770381cso3641795ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 21:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792211710; x=1792816510; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ij/yw0EE7qvrJWtzl6WjRChvvvMCRKj13EcgUfUn1no=;
        b=J4vVm79IEdUl4CwBAXuLRkNGAagM1HJ5exu0RLrYub0/G7tsTiMeYQ1PKXKdMO8CBM
         K/k3jKvbHV/9IRwUftxPrsrH1V0JaTBz63AG0mNuKhArnffE82a1/g3F4TIYzmBmzF+b
         a7MplhpalQVIAiiSrzrEgIXKe8to43X+Ni2JCjktshSKpP+eIvIYwXktg7KvU2UiJRzS
         xbNWGTqWE+EjAYbiO3nz32tqDyC33SSjRyPM18lqDH1q+gjaiHTXvJxRP8WomJhG92RG
         pX1WyyF1rEXT9fXmXGofsBA9qCEE0AtQZAeJb0ku7U6ZGDHRAh3w7OH5RPKV8yP3no6D
         84dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792211710; x=1792816510;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ij/yw0EE7qvrJWtzl6WjRChvvvMCRKj13EcgUfUn1no=;
        b=Ue28921GNu4ynwP+yMsE4WpRMUpGxTbq0rJZmmqF29d+CKUuHiUL+qp/i28G1DWfSh
         mj8XsSASm5Jo3tBN6d7/cuaztgxQ7ZMxuumy3n0YJzvTiZANOtZGgKavzFTvPBB56qPV
         kYcljFMFnDGOIlCwHyO+kEEfuDBSXGrpRvJ0/BjcG4EAbH71+u90O+VZnRYUdXBLQNK8
         BTVHuP0IPzO+IwDkVnjenM4pgSpIn7eVw1ZEJyd9rbUYboKsGwx8wzW/u/StDrTqLGa7
         5TKR9Or0fQPS3wo7zrlvOWgRix0ALJYfgFRcuFZVHqKCTa5fLFtP8xwG1qBDtLxDPh8D
         s7WQ==
X-Forwarded-Encrypted: i=1; AKwUvBxZUsbj6FNTnepBBuO93mkhhkA1ygKoFiKCi30+J9M9D9CyjUZk7ETdW/u8Ttw8g2PL/OrHyI0MgkCWSGM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKs8PVhgZhnpDqI4oFejs970FXrrBnFFIOqDPz1suUcJE09DyoF
	ZJHx1HinTglIeS8Pa33mei+zI/qXj9Du5x2bk82iYxSuqj/WRQtYb2U8YeP4INcpnxqFIHPG9BB
	RLga/dA==
X-Received: from pgnm1.prod.google.com ([2002:a63:7d41:0:b0:cc7:a825:732d])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1d4d:b0:3ac:a7ee:6760
 with SMTP id 98e67ed59e1d1-3aceefc2b04mr1444742a91.23.1792211709522; Fri, 16
 Oct 2026 21:35:09 -0700 (PDT)
Date: Sat, 17 Oct 2026 04:35:09 +0000
In-Reply-To: <20261016-bug-net-netns-move-rcu-barrier-v1-1-4157d798658f@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261016-bug-net-netns-move-rcu-barrier-v1-0-4157d798658f@gmail.com>
 <20261016-bug-net-netns-move-rcu-barrier-v1-1-4157d798658f@gmail.com>
Message-ID: <atL51vM2GDL-7YCn@google.com>
Subject: Re: [PATCH net-next 1/3] ipv4: draw rt_genid from a sequence shared
 by all netns
From: kuniyu@google.com
To: Qiliang Yuan <odys.yuan@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>, 
	Nikolay Aleksandrov <razor@blackwall.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Fri, 16 Oct 2026 14:09:53 +0800, Qiliang Yuan wrote:
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
> Take every rt_genid, including the initial one, from one global
> sequence, so that a cached route never matches the rt_genid of another
> netns.
> 
> A connected UDP socket in netns A caches a route through a nexthop
> object on a veth. The veth is moved to netns B and brought up with one
> RTM_NEWLINK, then the socket sends 200000 datagrams. B's rt_genid is
> bumped 0 to 20 times before the move, 63 trials:
> 
>                                 before     after
>   trials sending after move          2         0
>   datagrams sent after move       2353         0
> 
> Fixes: 4c7e8084fd46 ("ipv4: Plumb support for nexthop object in a fib_info")
> Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
