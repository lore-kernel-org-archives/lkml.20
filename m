Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4F8F375F7B
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 07:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788939046; cv=pass; b=HPYarzt860lBWPmyDgNBuHc+NK3eeOkVTD8MRf+UA9nXM6pGFZEuXCER8rLIcW21uevWaNwKBr5pZRDbWLdUl0bQSR8na9UhvNlPkO7fdkYo99vmsZjW5HrDe5FL8Z++pE6pXRFg4g3oVRKwuwNRBIESEFzdhOAFo/Rq2opjmfo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788939046; c=relaxed/simple;
	bh=Y3vf0lxPvj0VsYgM0mKRHGlkFAuh7BOATLuYkdiC0ks=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nOAva1jPMKmyHP9rB010q7geuDukj8kQiiXAECf9W/G6ea1VfWwTy2d7q9lB4OIPsdaRPIXoo11vz9yWaUj6NFFrBVUl4HOV+V9uheOns6o8640eS7QFvEvdHl/ZGek4knYvKzVd49yUjEEHGnUmXB2lzEuxFsXaA0/tyUia7N0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai; spf=pass smtp.mailfrom=nebusec.ai; dkim=pass (2048-bit key) header.d=nebusec.ai header.i=@nebusec.ai header.b=eCu2AqsY; arc=pass smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nebusec.ai header.i=@nebusec.ai header.b="eCu2AqsY"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3a20c95e412so46475951fa.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 00:30:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788939036; cv=none;
        d=google.com; s=arc-20260327;
        b=AthF55rNZ/aJVfqOLaQjilKFGOcjT/Ry0gKEuLUCqCoxJqT4STg52HqpK6jaEYhLs7
         eKfene2vitnUUPpcPGvHoJsKEcMfqsASsCJE6eJztr+fLmphkZs1GFc6AdNLsb/xsOQR
         cx+eGu/s8Xyap++/fEW5kAyennOOGIiPjzbdwAHUHJibekYE5qiTPtpbO4XWexeavlvw
         kb/iw6/PQdvVOXL/fjiVg9Inh46CIXNHvP3HjXnhVd00blVcD4BNlyO1CtjhofIuIhoE
         g6g/SOkjxUCot4zNnWRIOY0BEx8vBtT1hhCSfiWv+AaT3xyU4EoqBsQUhW5JM2Yzg0oh
         I7bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Y3vf0lxPvj0VsYgM0mKRHGlkFAuh7BOATLuYkdiC0ks=;
        fh=3meTtxznb9QMIJy6nzr/tNTajHcOe3HY7BvIf1pZc9E=;
        b=Zhnbii37KC5xUcrSTh6f8IrFuHJSkumJln6UYqyPsRfAmwZzPP816du++Ww2W/d+Jj
         8GAA85UVznfRSanTsuS70LnfR/bYg3YkZvu8j3ZAa7/0eMbumKFic+5JriIWiXh1uW5z
         4zjbA7rbCyI4Bs+/2xQJi+qJp2osSAZnBYifI2TzEMw1DgsiKfldg27MhjNgSRe3bXel
         dyR/GU5mpgEO0G3daxfQNNHcJAFj/8D/KZ5FIqWbW+aicL87HRBH7xWHOkLqxd31jEIF
         BiMTHmvm+Yix8+JxOBaUj4wSZ8gSBwQwXtOSAdXZmq3xvRxf7lStXvCmbwhBD4YHazPl
         mtVQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nebusec.ai; s=google; t=1788939036; x=1789543836; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Y3vf0lxPvj0VsYgM0mKRHGlkFAuh7BOATLuYkdiC0ks=;
        b=eCu2AqsYjrV0XGwmJJOKres5OlXvJDy+m1zvLIJQT+pWHPtC7dbOc3QSwGdye6VkrV
         2QJv6XOcz/co0uMdQwMajykM8FmdUcfbOMYBwB8d7KBN6nd9ivt+oyQf6Gac0J44DNSQ
         WOiFNtjglS5uxM097OwcvQ3jy91/RcQCMjfpqZiNXFCaYYnjaAsGpBILChg72WyeOxnA
         Rx48G+tw1orswanXUOXryaKOo1sDMXXFk+Jdjgmt8X1lgcabkkTF/03+6mXmWSNYNHSx
         ALCEYkhU8NJlcmgZ3BNPHfRbR2rchhV++hr71hC8FyyP1b4KMm/8IH/rVLNAUGnFoZV8
         03Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788939036; x=1789543836;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y3vf0lxPvj0VsYgM0mKRHGlkFAuh7BOATLuYkdiC0ks=;
        b=SN3Q7Ch/hfY7a3ATJetQFZYPY4urIDlO13U3aBRN2jFnw6J/pBG8wkcY1ZdreNpYV+
         V3YrelFbNMcOI42gk8+so/waG1SIW8TW4Pk0pyKJZdTnOkL8KpC/snHNa2BCdPc0hG0E
         K9eVUyvJrKLE2KWAip4vMc78cWo813IAbzydchZ9A9nqhn9JhxiCMKmGZMMGeDjp6FIE
         Q4YXSELEgt0c1ZHJrZv+Zfh4Rwr5RDFcQBaksYLu59IF3dK0sKH0gPSsVH2hKNsTGitt
         boaEwXoGdwlsJsEFNsxYp9DuE+8harP8qrJ+bEWzQUPR86o/QEO62ua1Ih/3/UBUv2xS
         ehNw==
X-Forwarded-Encrypted: i=1; AKwUvBxu2h+KxW7KzLadcnmptDjsLR9tqD+weYjD7z9Y60dv6jfsg9QpPcJ6DSMsImC+lZpoWeZ1DOFV+Jw6HEo=@vger.kernel.org
X-Gm-Message-State: AFuF++kDkV8FYUprKMXCdrLPa/pAeyf6iCsbNpb5p93UGJWvGy1O9qeB
	W9MtQRCHujaothYjUD1Yyq8pFpw3crrTpovGMpP3feoAetQLoJsYffaR9cHuTPAw8bV9kWntinB
	38qOzabDa6kHBNfnCrC3jZDzB3mPISPTta8slZcNy3ks=
X-Gm-Gg: AYBFou2rBhffqWtEZhUgWMBMghKC/Yt0RdEGfiMkOY5DVMWCQAyvl3YVRdvjdiH4Akz
	DM9ZN3ECGXVumf1EX+Z7YGKBXRtfL6XontRgLSY5uTfq8bl2CACZvWk5+KoerL6NXN3plo5fmzi
	DUDBi2Kcpv1U5iAmuYRMpGowGbb8AufrZV1PTR3hfu4/G+3pRoe+itC0D3xmQ3V4a0YzAic/6Nn
	tTojhLy/8pO+L/qFbdgJrc1X+BKyXZlJGFPU7Dgz8SvmKqhgdQ6ZxUdOLKFdcLjIkIHmnbvjGuM
	Nk/5zH1f2GiP/KHCinEetS2V5v9PsjVEakWZ7SD8TPNsbgtUrXMOEwaTLzhEcXnse7Y1s6SkArK
	zEBzf4In0uy9pCl6tgI6h
X-Received: by 2002:a05:651c:a385:20b0:3a3:74b9:8a7b with SMTP id
 38308e7fff4ca-3a374b98b05mr21405141fa.20.1788939036180; Wed, 09 Sep 2026
 00:30:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1788784801.git.zihanx@nebusec.ai> <050b58f7fc6b45da0fb12768ebb62d18fa46133d.1788784801.git.zihanx@nebusec.ai>
 <20260909071000.GA1211770@shredder>
In-Reply-To: <20260909071000.GA1211770@shredder>
From: zihan xi <zihanx@nebusec.ai>
Date: Wed, 9 Sep 2026 15:30:24 +0800
X-Gm-Features: AcwNN1V4-uX6lZ4IPXnkjG6wL-P5CzMbMzO8E1lpdYuY4e4s3sGr7gx-JsToyKA
Message-ID: <CAANe3eQA-eGdUdSZaFNpcuibnqTxNxmBfckoaH8fP5m4y7YuHQ@mail.gmail.com>
Subject: Re: [PATCH net v4 1/1] ipmr: account multicast table and route memory
To: Ido Schimmel <idosch@nvidia.com>
Cc: netdev@vger.kernel.org, David Ahern <dsahern@kernel.org>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Patrick McHardy <kaber@trash.net>, linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Vega <vega@nebusec.ai>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 9, 2026 at 3:10=E2=80=AFPM Ido Schimmel <idosch@nvidia.com> wro=
te:
>
> On Tue, Sep 08, 2026 at 11:58:39AM +0000, Zihan Xi wrote:
> > A netadmin in a user+net namespace can create many IPv4 and IPv6
> > multicast routing tables with MRT_TABLE and MRT6_TABLE. Each unseen
> > id allocates an mr_table via the shared mr_table_alloc(), links it
> > into the per-net list, and leaves it until netns teardown. Those
> > objects were not charged to memcg, so the host unreclaimable slab
> > grows with the table count.
> >
> > Account mr_table allocations with GFP_KERNEL_ACCOUNT and mark the
> > IPv4/IPv6 MFC caches SLAB_ACCOUNT. This matches the established
> > handling of IP addresses, routes and alternate interface names.
> >
> > Unresolved MFC entries are still allocated from softIRQ with
> > GFP_ATOMIC and are not charged. They expire after 10 seconds and are
> > bounded by the socket receive queue; see commit 0079ad8e8dc3
> > ("ipmr: remove hard code cache_resolve_queue_len limit").
>
> Not worth a v5, just noting in case Sashiko nit picks on it:
>
> Unresolved MFC entries can be allocated from process context and in this
> case they are charged correctly.

Thanks for pointing that out.
>
> >
> > Fixes: f0ad0860d01e ("ipv4: ipmr: support multiple tables")
> > Fixes: d1db275dd3f6 ("ipv6: ip6mr: support multiple tables")
> > Cc: stable@vger.kernel.org
> > Reported-by: Vega <vega@nebusec.ai>
> > Assisted-by: LLM
> > Signed-off-by: Zihan Xi <zihanx@nebusec.ai>
>
> Reviewed-by: Ido Schimmel <idosch@nvidia.com>

Thanks for the review.

Zihan Xi
