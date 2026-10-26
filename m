Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793043614;
	b=squIzD5GmHyxItoyEYFW5B8ksA/khT/WyIb2EB0+dJp09lifx4tf2MIilKH0pxNc6GYD
	 cKh0QR2iOL6JoaUpgQnL8R+5MXb3oPVir8t0K4P8RrAK1AErIFP/Wbzz0c1dOIN0LFTDD
	 7E6vf5KM0/H5kRwPS8tY7JtutI1MCs3gBywf2au27ORYZEOKmVjpOYzZaarg8NmlnDXFJ
	 03fj8fnyBqFpM7lQabUcJGsu0heEFtF7/lHipDEiVU+2Nwk+feZkgwRkmwD9XM/J6dcY5
	 HHbJnbwBg2V1BtzvlI1NlxM6XJCGAl/YkZUt/ub+Nv1uV4dnWQa7q6yc4kGmAKamytg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793043614;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=7lTB3tjbs9LTHpXb2LjFz9J4Bg4PVtZvOGRQvHQqQn8=;
	b=Kj03AqEwwMGgiSTVvqAj2dtasvFF9QixqLWXUAMl61FXsQoaSetpjSKAq8iXE2d0Cidr
	 TDYYlUiP0lXzuyh/Pn9Kpeb78C8aKY4VOcUVHfYNv3jIpf4k8CH2BA51883GNGoosPc5C
	 LVZRSCj9CSijYA4ya3fW8pLHVchrI5GQO0ogGBTXGM21wckajFKY6zhZJt9Kp0+JFjqdb
	 DLMI/6gPO+LZ49aVdY9bYP6ZFmSARIMvoqPOCP/E4fKWF8VfGfv4Xtmk2s6J3qTYR+Ivz
	 lZf6s8mEisVd31j6PjlhGEvzr4N2qtmhjYAiYxjbp18bLagMGToI9ZH1XsA5pdSIEKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=BzElhsSu;
	arc=none smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D59E4606A32C
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 19:40:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D59E4606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=BzElhsSu
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c45551fa84eso503820766b.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 12:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1793043611; x=1793648411; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7lTB3tjbs9LTHpXb2LjFz9J4Bg4PVtZvOGRQvHQqQn8=;
        b=BzElhsSu4kdqUjgDeKk7OuiBroKAFuwlm4RJL1hwaoL1P+IYSlebMHfKT4nNdKjScj
         jelgJRtSsmAM9NJSc3BkeLxcR03IgUn2vFRV65QCh7u5Nald0Z6wiUgbCk+eNxx291E0
         CNY1LCawMd3od4vz2c9QmGGGQtbz6oQ0oWvaQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793043611; x=1793648411;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7lTB3tjbs9LTHpXb2LjFz9J4Bg4PVtZvOGRQvHQqQn8=;
        b=2LGTYJMB8g273cL6gw5d/NqIH37z41iJgfT51gSFGwDNLjsSWVkjrkqwkfvOOEtQS7
         WiF5rks/+FvyfFnzIVauYDbmGCY+aWjc8somBK7pVBXpTCKlbb4Hr9PQcnvc2p+QFKt1
         tlETB5j4qG3ImKy2dQfCAnpA0FYGmwHUZGNnnLExr7L2Iw/mXk2TTR/Fb2iQRXMa3ni7
         pVqdIxVDoZM5so8/i36uE2gNCxVXiLcH8UF3ZxgnPCjEFlApj06HU/s+ZNlrE7tJ+6qy
         0HklYKk1/7QRtczIE0WS8pJosN/erEYFikpPwvs8Omg682Ws80AJA4ZGbSe+viHrNvBe
         wZ1w==
X-Forwarded-Encrypted: i=1; AKwUvByZ4Fg7vSNJAu6q19VFOS2lm5TRlb5xfVfScLQm5F7VfxZVE9zYe8bypCwu6K93X0Rs/7Ec9TO/p/+4i90=@vger.kernel.org
X-Gm-Message-State: AFq9FYIIed4c0cp7dqO0s6brmSIKf1gWb1cE0P1X2GyWTxdZxbE5brfU
	niBitH/X24KZ6ueZvM7BDkkQK+StIL32OoJtB6UWbXjD6dmlAhGtHrcD+cFDj6tZJjNXYiyqfrV
	YpHknfUg=
X-Gm-Gg: AYBFou29hIO/jBFruBFHONF0E9L1eGKA0qpBCuLBeOVKqhbkwxM0MZURGAf9jnzSDGA
	1Hn/1Wr2WbWoFYYeZHlq8lssqYsP+ATCa4MsVi3OY4Hhv0pFjZx/+cLdcNqknEToLjIRHOZC7lP
	0DFbN6fF5P/F06f0emMM3igXA3H9rU2mVyzj0r9hKNeMbr+/RtF6hlY1ATYHsfyON8ExYuN8kRr
	HR5hjxfhaVnUwNYWiABAq4RjBrhM+sd4iwcgxeHDRv2el0lktqTC8qrfeZ/7J+I9xN/mmfScLmX
	prh7Aj1G7zaXkE4FlwAy33E1uxZ2YYDNy3E4fqmZsWOPUvJ9jkw9r0U6HBZtirbZ7VIt0lQEvRG
	fH5i5Rn+rEh6BYeHyYqZIgdzlF2VvoKeiDRaj/zDrDyI4xqcUMmOknSuxsaSdlLil6elVtsYO86
	i54BFoYO7jqBh402lRowsSeTE4CLqNiVvSMZ/OIw5hsOQjgDmAO2WM9ANHdsOZ3NwsQXOfHNLSm
	jPIVKFlu7lrKsVY4niF3jBnHJIQ94dutDFRfd8PQPQb9yKvR2BSqF414FV7Lsf4wQaP0JWbjD5g
	JyABUVGkrmdSVaJNyP1CHd5gC7KvQPvyCIK9wpzxMoRx5hclGGD/
X-Received: by 2002:a17:907:9d1a:b0:c1f:983f:d8a with SMTP id a640c23a62f3a-c46bdc10c62mr838518566b.24.1793043611170;
        Mon, 26 Oct 2026 12:40:11 -0700 (PDT)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com. [209.85.218.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd529b3csm345844066b.37.2026.10.26.12.40.09
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 12:40:10 -0700 (PDT)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c4682977f9aso396679166b.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 12:40:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwT47v9d/Yk2IPSaoREY3dPaZyMgakMweokYT8VzZw3jAZOvpi5NvZU/sruisG70Y3UpEpVo4XuZ40Ucjk=@vger.kernel.org
X-Received: by 2002:a17:907:868c:b0:c2d:c98f:4824 with SMTP id
 a640c23a62f3a-c46bdd91e31mr838852466b.30.1793043609404; Mon, 26 Oct 2026
 12:40:09 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261009083137.3-1-sashal@kernel.org> <0914a106-bacf-4d95-854a-bfeefbff62a4@kernel.org>
 <asz9AeFe3CutP73z@gremlin> <20261013123132.GC4214@killaraus.ideasonboard.com>
 <as4pAEnLd4H68W4W@gremlin> <20261013131243.GM56180@killaraus.ideasonboard.com>
 <as4xMnT8a75pIw9v@gremlin> <as7uqZn9rQ52USwy@mit.edu> <4a2c667b14fafad7acef96af2585e41f158fdac0.camel@redhat.com>
 <atjjQ0oupQ4pmKHB@false> <00636bea8791e75b3b16afef2dc5ee7f2cb8bc0d.camel@redhat.com>
In-Reply-To: <00636bea8791e75b3b16afef2dc5ee7f2cb8bc0d.camel@redhat.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 26 Oct 2026 09:39:52 -1000
X-Gmail-Original-Message-ID: <CAHk-=wgm4tZBd68PxaQiGeComxa9Us-SC5P2s6UG1Dwu8n_38Q@mail.gmail.com>
X-Gm-Features: AclHuK8CltFtaxoX082v5F7FHYz_r6xWqul5HdmUaOSix11A_HqM4exVwrrtVNw
Message-ID: <CAHk-=wgm4tZBd68PxaQiGeComxa9Us-SC5P2s6UG1Dwu8n_38Q@mail.gmail.com>
Subject: Re: [PATCH] docs: remove Assisted-by references
To: lyude@redhat.com
Cc: Troy Benjegerdes <hozer@hozed.org>, Theodore Tso <tytso@mit.edu>, 
	"Lorenzo Stoakes (ARM)" <ljs@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Sasha Levin <sashal@kernel.org>, corbet@lwn.net, 
	skhan@linuxfoundation.org, rdunlap@infradead.org, federico.vaga@vaga.pv.it, 
	apw@canonical.com, joe@perches.com, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Justin Stitt <justinstitt@google.com>, 
	Carlos Maiolino <cem@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Jori Koolstra <jkoolstra@xs4all.nl>, 
	Brian Foster <bfoster@redhat.com>, Christoph Hellwig <hch@infradead.org>, David Disseldorp <ddiss@suse.de>, 
	Mark Brown <broonie@kernel.org>, Jani Nikula <jani.nikula@intel.com>, Jens Axboe <axboe@kernel.dk>, 
	"David Hildenbrand (Arm)" <david@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, 
	"Christian Brauner (Amutable)" <brauner@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 26 Oct 2026 at 09:04, <lyude@redhat.com> wrote:
>
> On Wed, 2026-10-21 at 16:07 +0000, Troy Benjegerdes wrote:
> >
> > It *is* possible to make a deterministic LLM, and this is why I think
> > it
> > is critical to my personal future to have an LLM that can actually be
> > understood by a human instead of a random number generator casino
> > that
> > sometimes puts "4" in your private key.
>
> I hate to break it to you but that is literally not how large language
> models work.

More importantly than that - the whole "deterministic" part is a total
red herring.

We shouldn't even reply to that idiotic argument.

Why? Nobody is arguing that we should stop take human patches because
"they aren't deterministic".

So anybody who thinks we shouldn't use LLM as tools because of that
reason is just being dishonest. It's just a disguise for "I don't like
AI". It's not an argument, it's a complete strawman.

We have had non-deterministic tools in the past. One trivial example
of that is just different compiler versions that have slightly
different instruction weights or just different rules. Even when they
are individually deterministic the end result is effectively that
different people will get different results.

And not all tools have even been individually deterministic - actual
real non-deterministic behavior exists in non-LLM tools either becasue
they have timing issues or are explicitly using random numbers as a
way to get their results: Monte Carlo simulations is a very real
thing.

And yes, non-determinism adds a wrinkle to things and it's something
that needs to be taken into account (and people often add things like
explicit seeds to avoid it when they need explicit determinism from
otherwise non-deterministic algorithms). So non-determinism is
something that should be weighed as a factor against what else the
tools brings you.

But it's not actually an argument against LLM's.

              Linus
