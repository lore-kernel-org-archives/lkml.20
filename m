Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CDD64F5E0
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 04:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792212036; cv=none; b=hVuu0VA9c0EvGTMG8fGw8utmqIH5aewLukBgvSFuaMWZ/ARFyWz+bt5TLHINCEkpKbW7Fgsxorvyxi5zeqbnmkfswM/Efm6nB8f/BowQ+KXPbYfvMZjWoNSYzkrFBhw2jFfyQTkIYv7ePEEGXytAhsHFFmzYBJuCP5E0+wGfoKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792212036; c=relaxed/simple;
	bh=dt6zKtsA2pImG2OzEQtTlAjxne9U81g0RsmV5/u1dCQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=B4jcl2d3FKEYtqrfuNUozHuvtWXfFzpLYXaNukH9FKhKLGwzyGobwdDGGwZ9lPlLX8Bj4nF1H62YQw43wR+U747pFaakNjWvTtH8YEr0d57778GHXtFOHkwG2hSmS0yn5cuKKLC0k+YlnAWAJA+DkIXMavCksE7EMvuVFqnU1uA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ETgXVfcE; arc=none smtp.client-ip=209.85.216.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ETgXVfcE"
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ab9850456aso927287a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 21:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792212035; x=1792816835; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ujlqLNxMSLXVmuXc6H/r32h76Zwbh9xlAVzdBgdTBM0=;
        b=ETgXVfcEQaKQe47RaqKb2Hq0cCMuQ6op+kYIKg+NCwB9Jgskx/V7WnTfBGgkqKyuhr
         972FnxfBL3KlImH+bSyIZ9iAxzsQ2TI+D9xX/aQLGQnr5YgAnrx3Ayeu/HE31zFs1MbQ
         Oel5StF36beW75rLllGZXu0fLK6ibyZsbAwkBvekOKs/3B/pKJv3po3LqBb42vrKTg6E
         DACYSMoahpx1ZINLepwMI7wB5s4m/q7VuU0HroKnkA1bdKquldKT31Wx9oB3bnmEnRF3
         AWM/SLA6cHMuXhsy3iPSgWrW5dnqDhASt0wb43vBHP9co5oNa/W8dySn9bruOwEbEuxs
         z+Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792212035; x=1792816835;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ujlqLNxMSLXVmuXc6H/r32h76Zwbh9xlAVzdBgdTBM0=;
        b=QvDC+q10a0fJ24lLO9SVfeoh0wYYh1vD7SQpDHEa20dQ7r8t/USzOBQ3e18zUQfLVk
         PUPQ6rgL8nQGDkFpuqYQB8N3bs4yagv9JwvRq1u6/WBE76h878/cOlw/ojnDpojEYxlO
         kH2QB9i7V8sOffaZ50rYO/C5UKLNihYFlnC0C0uM8RsiMw0oWnAM5FM7pDQATlX5GNFG
         eSjdzlIn654vW53VF9Xs73oKl6JTZz2yHKQShZE+jdoT2Gz3JHwEUTlzr9q436BHfIps
         FYT3BY2YDoexfGCkQtqgZoOhiPd+VkedKmgwMTnN+B7jHeDp1i0Tg2ydD702meCyXmHx
         2D2A==
X-Forwarded-Encrypted: i=1; AKwUvBzTcrjONrXHmJqj7dscU7vK6rOog+3oSdkse3wdArirEVGo4zNyv+haPCBLO3PkUVTc8S6I+D2IOY27w90=@vger.kernel.org
X-Gm-Message-State: AFq9FYIeWws2HG3x6mMFnJvDXOirMFla1TadTKlzr0cXF8RT8bm78Iu5
	5WXenI+G+Y9JsONCsYM4PCBmq8fT1yrapw5qSmIKjZrl6QEMO5YMs6WbifXvRbm2loQkKrEl4Ex
	zSo7/4g==
X-Received: from pgnm1.prod.google.com ([2002:a63:7d41:0:b0:cc7:a825:732d])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:582d:b0:3a8:5d1f:59ad
 with SMTP id 98e67ed59e1d1-3acef14c8femr1576985a91.43.1792212025461; Fri, 16
 Oct 2026 21:40:25 -0700 (PDT)
Date: Sat, 17 Oct 2026 04:40:25 +0000
In-Reply-To: <20261016-bug-net-netns-move-rcu-barrier-v1-2-4157d798658f@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261016-bug-net-netns-move-rcu-barrier-v1-0-4157d798658f@gmail.com>
 <20261016-bug-net-netns-move-rcu-barrier-v1-2-4157d798658f@gmail.com>
Message-ID: <atL8JlUJlc3EBcbF@google.com>
Subject: Re: [PATCH net-next 2/3] ipv6: take fib6_sernum from a sequence
 shared by all netns
From: kuniyu@google.com
To: Qiliang Yuan <odys.yuan@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>, 
	Nikolay Aleksandrov <razor@blackwall.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Fri, 16 Oct 2026 14:09:54 +0800, Qiliang Yuan wrote:
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
> Take every fib6_sernum, including the initial one, from one global
> sequence, so that a cached route never matches the fib6_sernum of
> another netns.
> 
> A connected UDP socket in netns A caches a route through an IPv6 nexthop
> object on a veth. The veth is moved to netns B and brought up with one
> RTM_NEWLINK, then the socket sends 200000 datagrams. A route is added
> to and removed from B 0 to 20 times before the move, 63 trials:
> 
>                                 before     after
>   trials sending after move          3         0
>   datagrams sent after move       8187         0
> 
> Fixes: 8f34e53b60b3 ("ipv6: Use global sernum for dst validation with nexthop objects")
> Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
