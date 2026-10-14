Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D25CC563FA7
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 18:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792004353; cv=none; b=XIiNwmhcSYcE0lKylOHGSeQefq1QVgsa5b8yraSmQ3ue/80y/TMLBAvJERPtpMC+6bfE/LsHYQwDZ081ChG/Y9Pgdemr/+efV93kU7MojzsIt4c0puU8Uv9C5YCUBWbC1yhA8gxHxtnaKkzTV+rr0UY7y6wBuY2KgjLwJxmHV9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792004353; c=relaxed/simple;
	bh=Rk54IAaE6VVUUw2LLHOVHkQVqBe3J7+3RvRWEEH/U2c=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=KvyHPV0iBGl78U0yV1pcEYVpLywLDGa61pybzAefRcW+Oq1VdEQjZdQ+0a5WUMtx/mjMbrLnehF3Za2gRPMFTCYPxdS8+44XEVZjFbKjOm5onKDdKXkli2iKbIGTzVjyOTLzDp5f97wcY7ab0alqUIz6lkpPo0FyaSClMt6sgqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ACUdX9uh; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ACUdX9uh"
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5e9488480cfso1522291e0c.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 11:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792004350; x=1792609150; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LubmNDov+kRdJeSgDmNkTIoCyYOuN6AaFESo8XksX+A=;
        b=ACUdX9uhrjCQKOJNqny++2sBR8t9Y6CrMAgUBfktaL/EF9F1nnfYH5IMEf/GDjjFGt
         QA5VTDoOGMvg3vJybBlg56rMVFd5NkHgVijKVbD8i51daSkxfMwtLEjgQy0lpF5UBdmI
         VMlVOXW8oEgddav0TP9GZT5Mr3ycKRToI9WhY7BOSbApSNCS10G+etk+v6HUFcau5Kqf
         2nGjWFB/i6zxDoQGqUMD7BNaif120D1yDDUzvaV3PB40SglQZnkaMYWi6BTkEGxNSU6E
         yIsb2stFBpB747PFuJRhoV3q60H20gP6xU1cMrAXEMbJ4vqMcX3+8UofL5iE4FiAiqtz
         2uWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792004350; x=1792609150;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LubmNDov+kRdJeSgDmNkTIoCyYOuN6AaFESo8XksX+A=;
        b=oN+5pxKfNN6gHN1AiOufg/Ljk1lseavd1LBv5FKqclUWE2GbGHOfl6vGcUiwRgvdm0
         2OBFvs6xYm4bQbQMLIEkPtCWrXAlUEECRvdk2rsH3x28TCgjHLFDQzmBTKxdjjZBNfOU
         rCpzYWB9c1RzLcdsADUIfLKHdUkZsDVZxtsfgxX4HsyACZF9AzmLBKHwA56q4FBtBQJu
         RE68r2hp+uhMmQgp/MSFPwnbvedBqMZwRm6tyhGo2R41SMeLToJeHWwxIVY2xpkHWtEK
         TG14NrJpgnEOXVyLqpOFpnsPhNTnOmHOo5NbOcdyyqQsr3Lt4DuBiK7eNjilsZHBTqIm
         /drw==
X-Forwarded-Encrypted: i=1; AKwUvBwY2Kk/vKU9s7URs1UOJivoUlUA1DZWLbr2tcFwsS2GfBB0ejJOtqPwuVIqt0NNHW06mBu77GGcs8N5lo8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIIiZIUnyfYCOpD8hij4hLiidzs+310aTiKd5jQvh/QBemFs8ri
	4eScugUBGDBQTpOtEX6FkJTCRm67W/IMzX6JYecLnlTw/BWW+UzCnXga
X-Gm-Gg: AYBFou2sW4P2dCHsoZPw2rcT8Li8Njy7p/Ta16OXkamwLRXqptcIJq89eZ+SNCMVnu3
	kL4Cpy64FKGpTmEs6k2jgSjfxu4N3dyirjuJC2hUXFv6//JcyLiKk6v+d/izedos5AmEm93YIpb
	hmAtzZRgBtpl1HfRIe04f9NEttNlGdxXS/QjwocDhiPeO+xEGqxFGQ5/qTQPgKdjy/7BwcBTPzm
	9F79ShRvVmmFXxkcYWNVXGbjprlpqpCUSu0BxS3d1o1d7aVJVfj+ikhwrr97y+0VFSgY1W6C/9p
	8bVdWI5p483JXSsJIY5J9ESbbrCA3Jxve9F0A1GCdUss15L7+AaD7bf47KR831+zB6bXTcZrYd3
	NDM6/Lx1vhayyjSvCUJ5PrdiRZqUTN8Dhx6YPKi5YkoCqeM5K1WKaG+jVL7Vcf/sO0nS9EVlCdx
	mDorq+ufK5iY09YG7X6MQKtpTlg5bFF6fCEtZmhLsmq8fFgOsGk5XkS7eutZoS3hcTTVw6NX8gE
	aJ+gb4bC9Zpyb8QKaDj5J8pRc1NlkRFr+rsNc9KXTDOtZpNocLdBZBjn+dGX5NKk7VU/dJiLVWa
	rUiEHQmKMJ+vw7cLOw1LcOlFYYFgwjxUoa5j6w==
X-Received: by 2002:a05:6122:4f9d:b0:5e1:c1c8:9ff9 with SMTP id 71dfb90a1353d-5e91f28cd89mr6035507e0c.2.1792004350298;
        Wed, 14 Oct 2026 11:59:10 -0700 (PDT)
Received: from gmail.com (111.46.245.35.bc.googleusercontent.com. [35.245.46.111])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5e91cc14668sm11985603e0c.16.2026.10.14.11.59.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 11:59:09 -0700 (PDT)
Date: Wed, 14 Oct 2026 14:59:09 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 Josef Bacik <josef@toxicpanda.com>, 
 "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, 
 Kaiyuan Zhang <kaiyuanz@google.com>, 
 Mina Almasry <almasrymina@google.com>, 
 Willem de Bruijn <willemb@google.com>
Cc: netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 bpf@vger.kernel.org, 
 Josef Bacik <josef@toxicpanda.com>
Message-ID: <willemdebruijn.kernel.1725d296e3ac6@gmail.com>
In-Reply-To: <willemdebruijn.kernel.140f4eac91ab3@gmail.com>
References: <20261006-b4-skbuff-bug-on-v1-0-1b4434c5357c@toxicpanda.com>
 <willemdebruijn.kernel.140f4eac91ab3@gmail.com>
Subject: Re: [PATCH net-next 0/9] net: skbuff: convert most BUG_ON()s to
 WARN_ON_ONCE() and an error
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Willem de Bruijn wrote:
> Josef Bacik wrote:
> > I'm going through and reducing BUG_ON() usage in areas that have created
> > the most problems for us.  89 commits in the tree quote "kernel BUG at
> > net/core/skbuff.c", 31 of them since 2024, and some of those could be
> > triggered from inside a user namespace.
> > 
> > The first patch is a fix: skb_copy_and_csum_bits() leaves stale bytes
> > in a buffer headed for the wire when it hits unreadable frags.  The
> > BUG_ON() conversion of the same function needs the same handling, so
> > it's here rather than sent separately.
> > 
> > The rest of the series converts 17 of the 19 BUG_ON()s in skbuff.c.
> > Each one becomes
> > 
> > 	if (WARN_ON_ONCE(cond))
> > 		<error path>;
> 
> Good idea. I was thinking of doing exactly this sweep after addressing
> one case recently in commit ee1972def665 ("net: downgrade BUG_ON
> EIOCBQUEUED in sock_sendmsg_nosec")
> 
> Instead of WARN_ON_ONCE, which still triggers a panic on systems with
> panic_on_warn, DEBUG_NET_WARN_ON_ONCE?

Just to understand: do you plan to resubmit with this change?
