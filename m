Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794266057;
	b=EI0mGR76kvXCWmPS572FEN2r2VbakscF/cwZqkZCVN/y+TQAPanzjG9lBh3ZvHuIQDAA
	 Y5As6z9DW3Yz3o9kELnQlqQJaZ4AZf3QmRLixS0/OMpAJT2lsabIgVIaHCYql8R/VhSNs
	 amM9EpVheDELsEYdCXdr7wZwK0j3mFoFPieDbL2TR6aB1wMSTzhOS06GVMifIZRQy+Y6q
	 cZQrIHCPRMNmprRcAAVtj5efBtLUMdsNMORYOSStUapUvMVFt4NNrQS8YBJ5yCunTc09L
	 Veel/rZ6ChWLwJfTffIHb99g0AFXZ233UhopvOYchCz8pVeecw05PKJY9zfmxlzbn7Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794266057;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=fqXpBBcqphrOKEoud7aEvUgTXtSFkrkdQ70VK6Fy8AU=;
	b=Q8oZheilXEbOnNb5+QEfoHPOvm+cBeOiKQT+B+BtzKCWKLQn+xeLI6x1wluBVojSkLZF
	 qIjoOwr1VD2efViVl+UWU3lShEOjZrKmlnyL6APt+6aZm/muHaQNfY6tojWo31KAiB/tr
	 n/eiFX8fdNZNYB1adCM/xHal05nAKOdq9KcYQxckT4k7OtwHaRT0yF9UVrWe4O5kg8ucQ
	 XIkjTKAfBSF7X4UErhVutXtsi/YTBKVeooKgMkWtZ0wZElwL+EsG0UJnB7q+zudM//vQ/
	 U6E83B8Q20gH1GqNMVrgEeDee8bUPPtKHm4gVDXLvpWbV+xVUK7L57s6vG7sx4eMr9A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=purestorage.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=DwtENfGg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.171
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3884606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 23:14:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3884606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=DwtENfGg
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-4f56acebb5fso43853b6e.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 15:14:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794266056; cv=none;
        d=google.com; s=arc-20260327;
        b=I7YIsjPvP8aK2IkxGcvFuyiBvFHtxQMH7D7X0PMCbUWyulhb31jfjLmkoxc0eXz/CZ
         wuzSTgAPG6FQRI/S5R87/s7XJSgnePlsvwQ5+GGTe0Hheg45hmAopWtD3AUZer7HrtdE
         dMJTQBiUg9uk5ll7ESAsAbxQjfNXXIrB/YWfgfAZGw6OHsrbf/Rw8KiQPyiwe0gZhmhH
         LgSWIfL+2ZYI/l2cdVcuDanGh/FpTgAX9XmRN/qLfxAGQ6s4KLReAtd05ptBVMr+gYVL
         YMJ+Jz8RS4J30AD3XQ0YiJMbKN9Hp0EFmYRoi56RGzVsqXFsy2+n/Rm66CSHASdEIhbi
         MNNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fqXpBBcqphrOKEoud7aEvUgTXtSFkrkdQ70VK6Fy8AU=;
        fh=2irtzuFBkjoEmMjvLjc0W2hnipGSCwL1crFqxACTOGI=;
        b=p7scMA9OI+taWNBh8uDghijIdPmF9eDm2/HomHxI0+tNNpy0Zt830z2b/5X2R4WkB9
         gJ++sf8JRZQYMMzsn1RRthW7u7wMDEopd6kyqjCcx5p1aNMuJAVEUym24uoUq4aFzby2
         kT3lYD4jkYUCT9qSJC8gTLzUQwmWZUQ1DIbOgdX8M176VUf1SLdhmW6rF/7a/Ojs1tXf
         T0AZBWwX/xDHYuBQ1AckcYtqysa4sR2QVnKq/FHC8D5kw8gshOpdlinT/fWJb1AG5IkW
         HiZNjzxpT5nhgjSiAA3q7Qc4p0yJwe0O2HDFnX/Kvfr4KDGIQ3NZTEHyq0DOlPAGwt/i
         BotQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1794266056; x=1794870856; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fqXpBBcqphrOKEoud7aEvUgTXtSFkrkdQ70VK6Fy8AU=;
        b=DwtENfGgn/NifVR+l4lo+XZZdcGmJC8tTVSXqNdsdA6i8m8W+Dv9ecPvuwlSTB31wx
         6ku5yGMyTzKSRJupRVLul4hg1JefpxqtJrVsuxX5sSOlJucUOnPJ/GPG+FzCdawwszCY
         LipMJ8lbrfk+zVuosVWfEUNtkve0h5ZSW6445e/SFfWJWST4MIVEB3eHs1Wi5dUoAPWv
         Uv1tVMFDgquuVXylar4+3pY6D5ytbU7MRAb5KM/J7GbrAcdpCQAmrb18BsrE+oqIcMt3
         jOmVQFYri0D7n68w1/WhFNT1WvPTNyJDKp9lVheyqnACtFtWmYxDAOikG/9BTjS/nG6t
         8w/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794266056; x=1794870856;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fqXpBBcqphrOKEoud7aEvUgTXtSFkrkdQ70VK6Fy8AU=;
        b=1hF+SwnV5ReFy1wJh6JVzvBhfTohsCjoBX1Fdy4Gf5Vh9e0ifpo0zQPgLE9Ga5uRky
         98R+usIAxWMzO8J9j/bS1bEKaHwy2nbqCVKTal+ZJk2hz2eRhu6qoMsB8Yk/IVuh4e2p
         whT0ra65vBPqgcCN8FP0gwWmuSmHr67n1zoS3Ufm7XtCy5WFfhp4CCptnLLy7Cr7y0T8
         lM5s+FRCVHDdCugPNOyUXRoVGxwpghuVokiAjUV0ILtdiHMyzyTTb6uUPp7yAPIXQ2Pp
         EKP6rHGR3ULE89l5+RLSJH51eAaAN9PRgfN7jypX/APCrrZw0Q/k3qi1dTads/PnArMB
         +Mew==
X-Forwarded-Encrypted: i=1; AL+hErFE7HucXDWZ5N6hU7evkpH4gP9q72FKZw5FsgOED/jRrP63Ds6DcVl1Ay9RUXHxd7thf8EqPDYD9b87ZA0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+3xiL9hO7Q8pWzgBsKjp7EV3SupjcNVc/Gca4ZlFCUguhdgsbj
	KKozndAjbUQfp+HKI10q/iFfYwmtaP/phS3FpftKw2EMWUFOPKeRlf44lBdpM7GirQ6GEl/PC88
	J3BTcSJtq/xkFIUIrroZmbFYpnZDp72DBev7KYSl21Q==
X-Gm-Gg: AYBFou38MiT8ohICEQYF5bONkdTkv55RR2fdlsq80h7fwlck8XJARhLXHdIaSvg/8O8
	4rDMcAdjqV6dqTPyBzchHJvR2SvtJ3mVLp7hdNC0gEC1Dtsy0jIcO0cLaXHtRyoNHrSnd+Dihf4
	tDn947SwDc6EijzNHZ0jJGdAWdewMQ+AyA18WemY5hrFF6/F244MgL5nFA3+TiRbBaI8zoTBiGm
	qM1HjRB8bA5/WHhlAEXwsEHxfxwVhK8b8+oi9VoLLHMGDwt6lTLjVkvsNCoC463xCBgFwkRg2wt
	hSJih04qLbrZZ0YtKsFkVWl7vS3py95syvmmxwHxbhHSd69v4lamr0mXpa/0M+pHke59bip6k70
	Sv7pDpwXpaVHupiCRrhdhygVJy7pwWA1ceMQF
X-Received: by 2002:a05:6808:222a:b0:55c:866:20de with SMTP id
 5614622812f47-5683c769dcbmr1387251b6e.2.1794266055753; Mon, 09 Nov 2026
 15:14:15 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103211031.592745-1-csander@purestorage.com> <628e574b-9d79-4997-a147-51ccbd11e35d@kernel.dk>
In-Reply-To: <628e574b-9d79-4997-a147-51ccbd11e35d@kernel.dk>
From: Caleb Sander Mateos <csander@purestorage.com>
Date: Mon, 9 Nov 2026 15:14:04 -0800
X-Gm-Features: AclHuK-SlGEp-bvZXvBEMVJrExajAz3zz8HUTT2xD3smMVlf_iPp0ddqJu9OYaQ
Message-ID: <CADUfDZqoWZDjpZ5B45hkkstw4sjKU4_t64w-TqbbUsCvv2ZM_g@mail.gmail.com>
Subject: Re: [PATCH 0/4] io_uring: improve alloc_cache branch prediction
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 9, 2026 at 1:37=E2=80=AFPM Jens Axboe <axboe@kernel.dk> wrote:
>
> On 11/3/26 2:10 PM, Caleb Sander Mateos wrote:
> > A call to io_uring_alloc_async_data() that provides a struct io_alloc_c=
ache
> > currently has 2 unnecessary NULL checks in the fast path:
> > - Of the struct io_alloc_cache *, even though it points to a struct io_=
ring_ctx
> >   field
> > - Of the void * entry popped from the cache, even though all cache entr=
ies are
> >   non-NULL
> > The compiler also incorrectly assumes the success path in io_alloc_cach=
e_get()
> > is the unlikely one because it's written as an early return.
> >
> > Avoid the first NULL check by splitting io_uring_alloc_async_data()'s c=
ache
> > logic to a separate function io_uring_alloc_cached_async_data() that us=
es the
> > cache unconditionally. Avoid the second by returning a separate success=
 bool
> > from io_cache_alloc() instead of checking the NULL-ness of the returned=
 entry.
> > Also mark io_alloc_cache_get() and io_alloc_cache_put()'s success paths=
 as
> > likely so the compiler can avoid jumps in the fast path.
> >
> > The final commit is a small code simplification in io_futex_wait() noti=
ced while
> > touching the neighboring io_cache_alloc() call.
>
> I hand-applied this, as it needed changes for the post-7.3 trees.
> Patch 3 is somewhat marginal I'd say in terms of rewards for the
> churn, but churn is cheap these days...

Sorry, this was based on io_uring-7.4-20261029, but I guess that
didn't include the dmabuf changes.

Patch 3 removes an impossible branch checking for a NULL entry
returned from the likely(cache->nr_cached) branch in
io_alloc_cache_get(). (I verified significantly shorter codegen in
io_uring_cmd_prep() with no jumps in the fast path after these
patches.) io_uring's whole philosophy seems to be going to great
lengths to micro-optimize the I/O path, so I figured this change was
worthwhile, but feel free to drop it if you feel otherwise :)

I think we could reduce the diff by adding if (!entry) unreachable();
in io_alloc_cache_get() instead. (Or __assume(entry), though that's
only supported on recent compilers.) Would you prefer that?

>
> Anyway, check the end result, please.

The conflict resolution looks good to me.

Thanks,
Caleb
