Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDC1F55D886
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 16:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791995450; cv=none; b=YgfiZsPZ5ZjVtJ3een4CKoQ/3uz2YP6KUnBLYBGTB9tPHKe30FyiW5rjNR4TzE75hxRa7I5y2RppY4IhV4ciDa+hQ6aO2t+H+KRCC9RzhJuyhhKA8hCFhU6tXAq/SxG0JGf3pgPSXS5vu4RZfrHzgLhECy+otBLrywLKEGXc3bE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791995450; c=relaxed/simple;
	bh=BrjkRWhyANEzvU2G8fYFBH01XWMhW7Vpygjf58bbTgA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=f+lQ/TdexS3qSGkklSt4KI8F0itQ68t1Vp8Gp6eoMSOedav1dwQLbrDdUPkg/FzepB4JUonKU5nT1FJdEzcxjwJlBcXwFyHtqfB1JWGcJZvyOU3KOYnY24i22eWQO8lFPEYPkiIxdtm9lQE1H55UYOYqvLMHn7dGvzrUjYBJ/w0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I86KcNay; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I86KcNay"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a16aaf2067so15265185e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 09:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791995446; x=1792600246; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jlhZ2D8PVaX0+/HQ1rv8ogSvRZujgAeRl9LWjz1EazE=;
        b=I86KcNayWRCZftozOOWWxK91poIAkB5vFmgIEJV7louwmGtzLv2/UGs6AaJ//tcT2+
         nKCEe/p2aWiFkRTRK6r+W4ppgLnG2mv2LdkDIDnkt1zqUBxiYNtmJl9xzzz3jDkdF5eC
         Esl5dunQWf1ZWJfrOkCG3U35nS7NtZ3IIif5JqK5yhn4/QBmJC6puAsbqJWnnJsOMu77
         Q3Cmo66B4stsYqUmw+GSm6Alc6JjbB6g9Os9db56nlsTu1avF3A87TN5E6SU6ycjX9UY
         rmvHw2YEDL+T4lvUX81U0Sd1sN6XsXpcIMmQWO1aDQq8EbyjcBXabohOqNS82/ZlMdzS
         iHpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791995446; x=1792600246;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jlhZ2D8PVaX0+/HQ1rv8ogSvRZujgAeRl9LWjz1EazE=;
        b=rrFuNY51xYFBdrlfB5KHTUuO5u5DuJWrUa7lv6KFwgtvyZIDHBqw8/mKymAwwZdAiG
         yRqVG18bQpR7rOa1CDqhr5Rtn9WnvczuOLrclQnrJ9JpeUdU+COhMP1u9oRGbrD3zpdo
         Cb14vXzEg7Gapj4oGqaYpPWTsPOtIx7XXUpQI6ZWA58QHT4JvGIjs74HJPShMeizFEYC
         jMf66B9y3RS5CLj4BNSNXUHUOhTzJuq54GMuBam2hrM91LbuXXemNrfnK9KAfe9ldbOC
         ub0E1PtZxyHPZOtVND4/BdkkR9TdfXArV0/RhMpvnLk9iAO2Kf3nwRV4UVFeTu2pFYM6
         NwtA==
X-Forwarded-Encrypted: i=1; AKwUvBzVBStr0K4o7VmaiiyVV7tTfmPdGq92S08DU1DZSzJgu+BaG2w22b4nyUAJanhpvKtWfkhEVg1UNNfZwWk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLeBA2yx/mKop4AeXHMEIZhsF3enxm4ChvF7AKTIYa55hJNZb1S
	1PC3oyVfuYY++XmSb/+Lbqf/NTSZste618xRbVLQW2zn/Kx19g63qoDD
X-Gm-Gg: AYBFou0If3kHQaeC+TgVXmZ7Y+/KYpDTLqHBcnHuahbW+9PIVsrK27CQpkc+7/30zMu
	5qjLE76Bq608UOb0Y2W2rdzUP3RNpKfuHUvs6dyjdn3pVdGoSZQLWqj/J23z53at0VbYFZeDzQU
	mnkBU6xve02BbwPdm5MBhlJ5WQ0WYDYd3xfoJ4d8wQlmMq+9gDxcNtnlRNmDUKY9U6JjKVJoebt
	9Sh1lr3sQBWAW26k/PVwUc/V28AlUJTcpVtrC4WCtKVjsuKj4M4NoYrVj4OYip9ZXr9/MrRXuHK
	DPaTdZU9SB3eFNWKB2PSkgEeQYJygsJ+seW95zLT2ZPzGaX4kNPccAzBmAD7ACvGjbukAHn6eWi
	cGpG4tJXn28nN+LFsLRI/NIeCTFjyotuwufDnrMSqeQEm2p7RLFLDktTmcQ8UhkqRY79XL0fYxm
	Dmcb7bdexfkyFJonXLMRhdAsqdMIsZpSssSY7VJvsjuABE3TdBVaO680s2MTJ5FhDK4moI3nqtJ
	ZGdbT3toCX9t8dlL49+zPlw/iFqQYN5SA8=
X-Received: by 2002:a05:600c:a00c:b0:49f:fe90:de63 with SMTP id 5b1f17b1804b1-4a18e4e0a3emr341491645e9.28.1791995445684;
        Wed, 14 Oct 2026 09:30:45 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0967affsm11644556f8f.1.2026.10.14.09.30.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 09:30:44 -0700 (PDT)
Date: Wed, 14 Oct 2026 17:30:42 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Josef Bacik <josef@toxicpanda.com>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Andrew Lunn
 <andrew+netdev@lunn.ch>, David Ahern <dsahern@kernel.org>, Ido Schimmel
 <idosch@nvidia.com>, Trond Myklebust <trondmy@kernel.org>, Anna Schumaker
 <anna@kernel.org>, Chuck Lever <cel@kernel.org>, Jeff Layton
 <jlayton@kernel.org>, NeilBrown <neil@brown.name>, Olga Kornievskaia
 <okorniev@redhat.com>, Dai Ngo <Dai.Ngo@oracle.com>, Tom Talpey
 <tom@talpey.com>, Mina Almasry <almasrymina@google.com>, Kaiyuan Zhang
 <kaiyuanz@google.com>, Willem de Bruijn <willemb@google.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-nfs@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH net v2] net: skbuff: make skb_copy_and_csum_bits()
 report unreadable frags
Message-ID: <20261014173042.0a74a25d@pumpkin>
In-Reply-To: <179198668564919.2.10323410751655182155@toxicpanda.com>
References: <20261013-b4-skb-segment-nosg-unreadable-v2-1-6c28d8ffa51e@toxicpanda.com>
	<20261014135154.05de968e@pumpkin>
	<179198668564919.2.10323410751655182155@toxicpanda.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 14 Oct 2026 14:04:45 +0000
Josef Bacik <josef@toxicpanda.com> wrote:

> On Wed, Oct 14, 2026 at 01:51:54PM +0100, David Laight wrote:
> > Can't you use that fact that the csum function should only return
> > either 0 or ~0 and use the other value to indicate an error.
> >
> > ISTR this coming up before with the 'copy_to/from_user_and_csum' code.  
> 
> skb_copy_and_csum_bits() returns an unfolded __wsum starting from 0, so
> 0 is a valid result today.  It would work if it started from ~0 the way
> csum_and_copy_from_user() does, since that doesn't change the folded
> result and the sum can never come out as 0.

The result can only be 0 if either the length is zero or all the bytes
are zero.
You can probably prove that is never required.
It is likely better to initialise the csum to either 0xffff or ~0.

IIRC both IPv4 and IPv6 complement the checksum before sending it.
For IPv6 a zero is invalid (it means checksum not calculated for IPv4),
I think the best was to achieve that is to initialise the csum to 1
and then add 1 after inverting it.

> But this is one of those "you have to know the behavior of the function
> to use it properly." Explicit errors are always better, it removes
> ambiguity and creates cleaner and less error prone code. I'm happy to
> change it to start with ~0 as well to add the extra protection, but
> explicit errors are always best. Thanks,

Look at all the places ERR_PTR() gets used.
An in-band error indication gives better code and is probably less buggy!

David

> 
> Josef

