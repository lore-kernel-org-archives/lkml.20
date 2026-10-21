Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.128.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1792576336;
	b=nN8AQujq5gHL4KNa129GR2cBhlK3sL5Iqp4lt7ziG5J4NNWCf/IdqFXSXBbRqLc02g8a
	 Mqnb+RKjaxkUrPibc41Zd3YBwjSbh6ewsFknpXFxrv09pvjfrbApxnLelP4BwSGrzFB/y
	 jB/ZtEux6vFFQGdJ41XX1j5/7gPX6WGD0hbdtISvY1iWpDgd9nX3n3/WHE3GgDQNjRaZ4
	 T4KX+r/n22VBmc05U2VxUeatkuBU8A8qKCIUjRWKquaL7eyEio1CmmvlLQY7/88eiNW2+
	 wZgNYOHiXEKGLmNA+InyKddSfVZ+l7VXbBxN9X32aL9Z2JiQUw55XCAnyHv6aRKJMkg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792576336;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=Jvum9vHoM5in6HyLcCxwho4XKzNHKiwHpUd+vconds8=;
	b=WC9dyH3BJJi3s6QI6l9em6hKlzTm2hTYPHZgyQsHtxbJhKnYaSC4faW/8k3QOUGWA3Xg
	 teZ/0FrIiT3RqPo2MrAjFQ0uWoG8y0lru2LjWaP4r+yx6tRdpeE1gwRDPB6lqW/hPe2LB
	 BlSmkAHI3hA/wGXhCrZivwBmTdayWJ8u4pVFVQ5655vVz1Gb8FsjqjfAeFYnZq9+njh/s
	 KJbRZQC1dcmoekKThiOkFphj6x1j6SkFExmZHPWT6f1Z/381eSqjuK9FXVkvNn50DlRST
	 pZAnli1LUMqVRoNRUHIoehz/hi77Lgblg82itcFchQUievsOF9E2IQ1RfsIapQghOzQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=bFdHvy08;
	arc=fail smtp.remote-ip=209.85.128.169
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71C4B606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:52:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71C4B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=bFdHvy08
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-8b118bea471so3057677b3.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 02:52:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792576335; cv=none;
        d=google.com; s=arc-20260327;
        b=iZ0GlMrOsDC44HyMjo8D3cRViiPPYH3WEwZa2BoJ/aaBh2tkCdcz3bZ2GRu1cL1Rdr
         7PXj3jGptUc2rTMvf72h65yL0P1kZkiNiFO/ikpmSGXvvgb8Som/F6YCo6/NoWX4tgQl
         yPCQ35tfziGLW6JUwEP7xCcgBv72mAzexixVsMD4knKY0RzSgCNYiBUbXLzmB6+amFxv
         ohuR5cjFPOU+R5OZPCrc40lgWPtzxAwMWfMscfnGWK1CJPCdXgOB7t7uaxlAJ7ATvICH
         Gl5UJb1pU0SMdLJo4roCj0epB/BITb9ntcF1/AwE+R5eZbjKUnFaJBXrv6clzjCB3v3A
         QoOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Jvum9vHoM5in6HyLcCxwho4XKzNHKiwHpUd+vconds8=;
        fh=ds8KGe8+eCI44yIT0zQ/JPQADe0tsrEowptZBBLuEks=;
        b=jZhc5rFqLhunM+znJ7dD5PGxuemZvD6zreiWywNPFa7F9mPffS0o5rZaay71uLR9Q1
         h6ChncVK7XpRWgwGnBhxlAO/cumq4xIMzj+DAPyshXBtErh/PqbiTAi4rOGjsTZguuwP
         0lenOTW0kEpyRVNs1GczMcFjT93oBKWMxP/aryTrvUBXOx+iN1pM2oR3hQNIRqyp473u
         F/zAdlfsLwVY+ql2HIdJXJuAmrnkA3CpA+YUvElgpm2HXp5IYEH1JxMJKOyIDLarx+BU
         Q/L26Y6tseBZGxx7jpOVFxkGeDw+Au5e8Fj+nSKMS1rP3KCy+pSVMCBg7tVTG189y5s4
         WJJw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1792576335; x=1793181135; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jvum9vHoM5in6HyLcCxwho4XKzNHKiwHpUd+vconds8=;
        b=bFdHvy08P5qTB+4vC3oEIRt/xKMa3RZ5dVG7cKzf2O6NwQgBTnKsoJAKPu00bMNLqX
         eDayHVV406lPN30nVfCqvhQsSPAMYRUsDDx/Yfu8By1+D71d6Xs2cYpYqDcNkhyuHWUr
         QTWvxkxavzRGSjvR+pobQhyGFRotU54L/noqHEgJG1EYXju2pcCE8w8XGdtXZI2ELx9v
         SVqkS0saCjWz8uxENbAQB1dqqIeVrCEl2mUE6lr9c9g0G/CctkGjy2YUYbz4fdva9jH/
         pl//1WVpvsuc7nb8TCyOSdjeFtNpUQvQTmZDg0TltV5F/bFhVAWImJnglr0HUmpi+9PZ
         a7Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792576335; x=1793181135;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Jvum9vHoM5in6HyLcCxwho4XKzNHKiwHpUd+vconds8=;
        b=THKV541FMxdumoBgRS1YccLHBqc0sQaHKJljeZ6EC27cPlDdA4b4qmk4WIOsL5QjxJ
         J6tPCLAl2Y5ZDUhTbsQBtZN9lnj9z/Kp9fUoi3Vch55WLK+7t4iEmR/E7hjicRjvhbWy
         8FWWjvITtXS9hFLL9PALfCLA01RbRDm7w2RE9q1A35q9AcxbH4dqFR+ZDsFX2+pJBW7e
         xTwLINKP7ohy+QFHu2RLKENybQb21eCZPn2lCeSW+hQcIxxpyycZgWf2qubONL0iNIoG
         XXKtlnjH9oThF20IhPZ2G1x/dYownpfU7W3Wd2S+ZHvmVGuK3bAsKZUGFaBSWbz0wnwj
         z1eQ==
X-Forwarded-Encrypted: i=1; AKwUvBzvxDB2aiNLc/z1OUvj41GXCX35dBXfc37kslEBwbyMJ5xMMoCtQHUga+VGN89BqEeHtfcs6mXrcaP3/fM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLcaozIyU7i1HhKNscYnCg4yw1w4xGyvVNfDZHTKKL/X6+etoi1
	36WT4nAaI9ObIqWVMfrVPMXrkc3Fz/VBFNOJHDSAI0Zq8QmmvO9p3JFeHuTD4x/599ivWuaCs/j
	IMBaodameYojU7PX5Gekxmfu6FplsQeXX728Vsl6x
X-Gm-Gg: AYBFou3tfP6fNt8BIWWQRTO5y71q+jYNYHayTrcW1dSp/w5Qjmre+BIKjQdRrUSMDGD
	hxqMXH009qOsEGulKyKvJ1Hha0QMj9gDnKW54x1snIYlzrxWjUIRU6O7ysPGGoP8XaPMgRbCcwS
	Q5kRqBiaCLjbhsqFyAmSdLt9hiIoIOzdIu/cYvt/1r9EP2Ca7T2modJzu5tm9aZwpqOtFlc1y/L
	4dHjUs+dSyby9NhNYmyJCDrIaefz+LeZcK3p2Wq2fdDUpU3jOOQRZ8JdHtqM/G54xSwJblumTnj
	NhHDHaFHAxts1U6d9xEdKsCukOYMBNefZxOvOOlOFhmmB7OXU9LZecQwWYwe2cX0squCV7aKBn3
	rjgkHYkB8N0i+T2MEPwm/SvDPaFyZRIfQHwwdl++vYnn0MGMEd/8GGdcwb7UmicLHPt4TZnemSR
	mwQ1FtqtRY24et337ky/2ao+qYUCSTDYYn8O2TszUgxalYn+erVnWWD5Wx/cd3kJet7EqC2mmp8
	Uk/ozubPelJPtLll6syfPBW9/J1cePY/QI/GtSns9g7VXU8zwsPNNpi1jAYhMcYzilrDvJVHtJ2
	P8zQ9bs+SclmexzUoYeWCBkGiQSHJK3hzPwqbOG2RlzEeKV4Pbeop41egBFeQpavlz1f/ZU=
X-Received: by 2002:a05:690c:e653:b0:8a9:da0d:1d94 with SMTP id
 00721157ae682-8b133fbd819mr5144797b3.68.1792576335378; Wed, 21 Oct 2026
 02:52:15 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <atQmpPlfT_DSd9dq@chamomile> <20261018025319.1445197-1-julius@bairaktaris.de>
 <athy9HUHBPfCBKu6@strlen.de>
In-Reply-To: <athy9HUHBPfCBKu6@strlen.de>
From: Julius Bairaktaris <julius@bairaktaris.de>
Date: Wed, 21 Oct 2026 09:51:40 +0000
X-Gm-Features: AclHuK-pk6kFTufeu4wo_iVpKWwHjnmfy3Rd4sMx-D_9eg3gvY73gs9VtcFkc1Y
Message-ID: <CAC1t37KrcwpXz5BDrPMpKBdpwJMon=WQWs8sbxDh-FrGFkAaMQ@mail.gmail.com>
Subject: Re: [PATCH nf-next 2/3] netfilter: flowtable: update upper device
 stats in the fast path
To: Florian Westphal <fw@strlen.de>
Cc: pablo@netfilter.org, netfilter-devel@vger.kernel.org, phil@nwl.cc, 
	coreteam@netfilter.org, netdev@vger.kernel.org, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	andrew+netdev@lunn.ch, shuah@kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, nbd@nbd.name
Content-Type: text/plain; charset="UTF-8"

Am Mi., 21. Okt. 2026 um 08:08 Uhr schrieb Florian Westphal <fw@strlen.de>:
> Conceptually, with flowtable, offloaded packets bypass that device entirely
> and therefore should not touch stats of the virtual device.  At least
> thats how I'd expect it to behave.

Fair point. Users could just as well report that as a bug.

Pablo, I have a v2 ready if you still want it. Otherwise I'm fine with
dropping the series until the expected behaviour is clear.

And thanks for giving your thoughts, Pablo and Florian!

Julius
