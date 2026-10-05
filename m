Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFB8428CF5D
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 16:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791217882; cv=pass; b=fdHM/kn0QT3Kbj7Yr1FxDAU8v4maUNDZQwSsgqHrB+oY77AhEfJqwtrQJXs583ntCFY/3ILT4a97smMPH0KOaa8xGdqTNRIgfr8NylfSiRzpP6OUYmdgRFHquiWZoJ4L4WP5opKerPvxx6DFb9tex+qmrOcz/IesZnsSabI0lww=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791217882; c=relaxed/simple;
	bh=w0y8VXrXD7IJTAsab3AkuemdIvyB9Itb1rE1TwYbRjc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sZJJjQFc0beEtJvRMTWDc1S6X+Zn8Y/RJgF3Q/gRWaC8W9XQyT2H54+OViOhQ8P8EzOsV7XJskrVwrpNTGhmR3tQHiZEc/yTT4UBvi4Xp6sHenKoJHzluTYJ4jItOfJzq+qFFdUVCNrcfqimQ/WhOVLaTIIq6kpOG3D5ztGoEi0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LLbGW7ji; arc=pass smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LLbGW7ji"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6ab0140ecb2so18045a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 09:31:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791217879; cv=none;
        d=google.com; s=arc-20260327;
        b=FZVrnjR/bKRlk99GPSouKtO13aTAbq2BavcSq9M5Vtb3B0Gq5RkVIAm05ScIV2DCY6
         gQ2rZKduZMgKXiI6LQxfWMgi5s2tugylaZOtsryP82IhbXRag+NfN6n2OymC5y+w8Kbp
         R/U8wYyUPj1GVYRYkgE9KDZHxU5OvZMNPGsMacfrmVB9HBvd1lX//ltKJ0MkbAQhanqs
         Ro4pTy5tc3ny3XVJQ63AGvm15tpJi9jh2EkQmdtokVyp33ysaJl6ZJwwbh9dfXypoAGG
         GRgYfRHi1Qa6EJxj1RdEABHnOhb+Ro2CCY2Th4ApcRtFOj+aez6/Wbm/ukwAWypcp0X+
         M2ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=85HkyTIaYpIyM4CMkxLDWOSkPWoXIpUm6C4+YzQKOh4=;
        fh=RvqevzbE5WNV/jmhUiFRcVaNwJPKjEXd5u3HySAqc24=;
        b=elGWj2xZsjebzA0LvGiot2WT/BQbwXcL9ggBpEy5jvsFyhH6LWPROU352RQ7wzxBMG
         Gl9BmLUESedXdLQy3OXx7P5I56xkDHkaGBhY8PwRB5ZS4zl3kLnBQ9sKNR2zAsddw8Aw
         uEjZjWjmhKp6T3gbH07f9jA+bw0LYI/HkuxfFmIHykXIjaVluyPgxttozzmmA06x24on
         EcCDvRU+bBxX7ahXjtq2MZ0qVdGEkTwPf8y653NHm3+CtCOFqwmASN00/JYPNSSEntjH
         ueQdlRC9qCUD5RBpSiaFQypy4iYnhkJep9mXTjIejSAoAXOdgVAKhvaHxO7bYIICZV3J
         vIBA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791217879; x=1791822679; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=85HkyTIaYpIyM4CMkxLDWOSkPWoXIpUm6C4+YzQKOh4=;
        b=LLbGW7jikzNcfCwkTqjA+A6nJmSakdLiq/eu5NtIXLV/twkTLcxJzzasXTSYe5G3jx
         Rs0LKmvpYELC7xWJFQUNiw/lTuS6hD7QQhzR4ajoIoHqIqd9Ft7f7rQ3wnFydAAZ1maQ
         R2uXGQC8xJ8xP6aAcN7BNyt04MkUh7KAvgzdLc1taidxSKHgrpWWaeux2aYCK1SrlXCN
         46GZyNzP8P33T+oHq3OsFiBakspvLXrni5nJHGGp76m15UWXh5mQ3ykLTWlQMbHt13lA
         aG9FUhdBIOBG8UqvNAyzP28Quelc/t2U5Kra+krRft3JosZLVq+p99pINuO7aRAG9cok
         DHrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791217879; x=1791822679;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=85HkyTIaYpIyM4CMkxLDWOSkPWoXIpUm6C4+YzQKOh4=;
        b=F/IG3QivBrlnkhvb5P67iIVrk05I2/6YJheJyCp+qILD+8wBIiN6uOmp9bmjYgly7b
         UTM5FpXeycP0N+GtfkpHA4BXOKY7MjS/KyVl2PgXXLhpYPKel6R/V9F+Y81D+TsnwM7n
         sdW/fP/I8wkQre8PmXaaGVEAtyS/jX3BrToJD43B/ocLBnG1nm7CGuDEiLbNB0rIZJMd
         /8JmTgiw75ofvX0EBJMbk/Gw6rE6zFqaKcbgV3le7rNgRigEf5DmpsnwYH94hDeqf3kM
         B2eMv0O5RHjUj4msoLMMf7PcvAiMA55eGtq53VHNcTH8kGFYSuklioEpjlbr77UpxiEA
         W3Sg==
X-Forwarded-Encrypted: i=1; AKwUvBwQEE61UC7qu5ARwRpvp3nvtJBHaZnF9A4MaCBqQ2JXuXqfp6gYeHQX7KMyLJfru/EjuoxmxujQmd9l7nw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKtBg4V/KN+7+Lm1MK64le0mdLJwEYKgk2jHqSUXPClUWPZEwNe
	6exAPcVlpfiYBvOjvePxvaPJR1fppcFyMeWw+X4xO1q+ZkTBC7m+pt61767H1gbvYZr+HBcL4Fr
	J/z6yelHJ/Pz10Q+FtvYzBQQoHPit6dSm575k4Qme
X-Gm-Gg: AYBFou2eF2WIqafGpjmzO7wMmdSZQYWdp2HogQgDl1dKAuC183aj91Y1x71etMPA7HC
	iuGgKWeQGMRZ2hJS83X3CsErGBUB7WLPKfavVqpN4PSgjWwmDrNbMmkJZJ3QW9kF0xBEh+VoFd5
	3V4yrgGtwV1OlUoSbQwYJsFxtb7rXRm1f2ZvCwYR+jG0bmRJTDzUvGQowI6g+hLmEedsniV653a
	NDIBAziTM0HMNott8m4N3eTt652vzhmyYhxuyvD1tqgCLKsNOX25HrehIws7uiseHNTqjhy7y73
	R3mMJS12clXm56I7nGDqh34lxZxuLiDXiu4p6skS0hOerI7Ckj0=
X-Received: by 2002:a05:6402:208d:20b0:6af:97a9:224a with SMTP id
 4fb4d7f45d1cf-6afae09778bmr80868a12.2.1791217878514; Mon, 05 Oct 2026
 09:31:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261005004958.3603059-1-almasrymina@google.com>
 <20261005004958.3603059-3-almasrymina@google.com> <asPNJ2V8Tv2Z05n-@devvm7509.cco0.facebook.com>
In-Reply-To: <asPNJ2V8Tv2Z05n-@devvm7509.cco0.facebook.com>
From: Mina Almasry <almasrymina@google.com>
Date: Mon, 5 Oct 2026 09:31:06 -0700
X-Gm-Features: AclHuK8ZfaPvJinAR7i7H0zzzlU7HIPd4xr22-_5YOjFpgcmtCAc2d6PPSqyr34
Message-ID: <CAHS8izOvea3eas4i09pMds2zzqbCtf8VL0Zdvo3fBT_+AM1TBg@mail.gmail.com>
Subject: Re: [PATCH net-next v1 2/2] docs: netmem: document netmem and memory
 provider design principles
To: Stanislav Fomichev <sdf.kernel@gmail.com>
Cc: netdev@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, bpf@vger.kernel.org, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, John Fastabend <john.fastabend@gmail.com>, 
	Stanislav Fomichev <sdf@fomichev.me>, Luigi Rizzo <lrizzo@google.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	Pavel Begunkov <asml.silence@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 5, 2026 at 9:19=E2=80=AFAM Stanislav Fomichev <sdf.kernel@gmail=
.com> wrote:
>
> On 10/05, Mina Almasry wrote:
> > Add a Design Principles section to Documentation/networking/netmem.rst
> > covering the netmem_ref abstraction, the prohibition on direct
> > downcasting in callers, decoupling memory providers from net_iov,
> > decoupling net_iov from unreadability, delegating provider/type logic t=
o
> > memory_provider_ops and netmem helpers, and the homogeneous skb fragmen=
t
> > memory type invariant.
> >
> > Cc: Luigi Rizzo <lrizzo@google.com>
> > Cc: Bj=C3=B6rn T=C3=B6pel <bjorn@kernel.org>
> > Cc: Stanislav Fomichev <sdf@fomichev.me>
> > Cc: Pavel Begunkov <asml.silence@gmail.com>
> > Signed-off-by: Mina Almasry <almasrymina@google.com>
> > ---
> >  Documentation/networking/netmem.rst | 46 +++++++++++++++++++++++++++++
> >  1 file changed, 46 insertions(+)
> >
> > diff --git a/Documentation/networking/netmem.rst b/Documentation/networ=
king/netmem.rst
> > index 217869d1108dd..57e52a947663d 100644
> > --- a/Documentation/networking/netmem.rst
> > +++ b/Documentation/networking/netmem.rst
> > @@ -19,6 +19,52 @@ Benefits of Netmem :
> >  * Simplified Development: Drivers interact with a consistent API,
> >    regardless of the underlying memory implementation.
> >
> > +Design Principles
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +Memory providers (or the default ``page_pool`` allocator) allocate und=
erlying
> > +memory (``struct net_iov`` or ``struct page``), cast it to ``netmem_re=
f``, and
> > +supply it to ``page_pool``. The ``page_pool``, drivers, and networking=
 stack
> > +operate on ``netmem_ref`` as the abstract type. Existing ``page_pool``=
 APIs
> > +that allocate or free ``struct page`` are legacy compatibility wrapper=
s for
> > +drivers that do not yet support ``netmem_ref``. Code that is not yet
> > +``netmem``-aware should be converted to ``netmem_ref`` unless it will =
never
> > +need to support ``netmem``.
> > +
> > +1. **Operate on netmem_ref, do not downcast**: ``page_pool``, drivers,=
 and the
> > +   core networking stack should deal with ``netmem_ref`` rather than
> > +   ``struct net_iov`` or ``struct page``. Downcasting ``netmem_ref`` t=
o
> > +   ``struct net_iov`` or ``struct page`` is not allowed unless a code =
path
> > +   strictly cannot function without knowing the underlying memory type=
 (for
> > +   example, ``kmap_local_page()``). In those cases, to keep call sites=
 simple,
> > +   add a ``netmem`` helper that performs the operation on behalf of th=
e caller,
> > +   cleanly handles all ``net_iov`` and ``page`` cases, and returns an =
error if
> > +   the ``netmem`` type cannot support the requested operation.
>
> [..]
>
> > +2. **Decouple memory providers from net_iov**: Memory providers are no=
t limited
> > +   to ``struct net_iov``. A memory provider that returns ``struct page=
``-backed
> > +   ``netmem_ref``\ s to upper layers is allowed. Code must not assume =
that using
> > +   a memory provider implies ``net_iov`` memory.
> > +
> > +3. **Decouple net_iov from unreadability**: ``struct net_iov`` is flex=
ible and
> > +   has no inherent restrictions. While current ``net_iov`` implementat=
ions are
> > +   unreadable by the CPU, future readable ``net_iov`` implementations =
are
> > +   allowed. Code must not assume ``net_iov`` is unreadable; check read=
ability
> > +   via ``netmem_address()`` or ``skb_frags_readable()`` instead.
>
> For these, idk, I do agree in principle, but it is not true right now? An=
d
> there needs to be a bunch of work to generalize?
>

I may have misunderstood, but I think Bjorn is creating readable
net_iovs for his work (patch 5). And I think that's great work and I
plan to support the series. So this will become true very soon.

https://lore.kernel.org/netdev/20261002190018.696925-1-bjorn@kernel.org/

> Should we document where we are right now (mp return niov, niov =3D=3D un=
readable)
> and where we wanna be (mp can return whatever, niov can imply readable or
> unreadable). And when Bjorn's xsk work lands, he can update the mp sectio=
n.
> And sometime later maybe we'll lift niov =3D=3D unreadable.

I think that's a good idea with 1 addendum. I'll say something like,
"This is where we are right now, but new code should, as much as
possible, update existing limitations to generalize and match the
design principles.""I basically don't want LLMs lazily reward hacking
and say "I'll just write code matching where we are right now and
ignore the design principles." WDYT?

--=20
Thanks,
Mina
