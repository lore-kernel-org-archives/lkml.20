Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1695125B08A
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 15:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789831744; cv=pass; b=Cmj7srBF8FNp+nIJv/DLVJ+xHC/T3+5xTHG9zHFJ9dNkyxbUsrPtNK0kZFZxdDI+PipN/lfPmBcobKFJtDjKQ6fLldgWjdt1EdmHqRnsLLzDz2Umkv+8tt0CCXUCRSz4vU5d94aMsrSkRIN6plIAg5FaLP366u8IqyZkU5BLg0M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789831744; c=relaxed/simple;
	bh=jOLtCA5xBCMN+IeZjOlru0hQ1zFhY1Y2MZjJga/2kjw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pD1B/H/faSVwosOY4FiWQqS+qdxsefrbndjI1PSBoHu4nR0SAGb9g+zp4ryUCfwy2XU2IFMTT/ucN32zF3aHtovONeFbUR2Xoz+Us+5z5jUFIezlqvFvMN8QLbTrvQlaI/aB6Aci4sSoLbMhHiuw1SXn2qadw/pzDJsnKQIEOjc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thechris.in; spf=pass smtp.mailfrom=thechris.in; dkim=pass (2048-bit key) header.d=thechris.in header.i=@thechris.in header.b=llYmP40x; arc=pass smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thechris.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thechris.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thechris.in header.i=@thechris.in header.b="llYmP40x"
Received: by mail-yx2-f12.google.com with SMTP id 956f58d0204a3-66e4ab2029eso1579130d50.1
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 08:29:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789831742; cv=none;
        d=google.com; s=arc-20260327;
        b=MEwW0tjR9zBPjH/iq8cdgpudii+wGLAiusz5S+w0Gj/L60ZkVci4T4PJ7ibxA8wFD2
         7tNRslUoWqpJQX6UU/Q/SMmWCbpVD8Hqw2xTw6PATzWYRykUpyStrLF7xiHNHYmESUs4
         CU8U+umTATBE9NxFcDCpKsqjyqJRvJn7Znh4JLHwFwOZBpy+jSx04O+0cxqs2IGDNkIy
         9QIQoEIPi4MFHRskFId4veLhqUpUr/M5pKSEnP8MUiPwaMvBeX5Zt12jN5W98Ch7CjUH
         LklEp3SiE+zczrmOo1yAwA0P7yXWTXXRvp+h9LOOZGv+90lRmeoMgcT4GifptubXnlKZ
         Pzxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=l0TpZBfQv1YVfjKqwYzlR7A5wrn37+yIqc+S/AtQHiQ=;
        fh=46IHVBnU+WrXJyDYRvu37Y22VrJJJ8lZ79fC8xPcoJs=;
        b=MJKpYfkXBZ6WT+fP2JVJBl0Du+Dt6aQkqkG44ztz2DfdpPTN1VI16xLswfQIZsG/2g
         9XOgq8SUxPiuWmN8t11pAGk7dIqs2HrbGQUrQ3FnqGtWHcEgqWFu7JdfqJ3RkaODcLn+
         QXYbnJu6TWfEi+/Vf9v0i7Ap7VZcAKj9P6tsoAfi2lC0nXKt7PRS97/EUm97DMX1ivDu
         2SR0rO5tluTtDlumPUllpOOmfdrL1LcB2ofuDKsdHY1P2AwBkYMZi7pM+agNiSU5274j
         VfHNnaWdNcrWvYuFxvNurZkQpwZ2txql+W3vxLWKENftybNGpr7WGvksFXXlImkg+WpZ
         M7xA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thechris.in; s=google; t=1789831742; x=1790436542; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=l0TpZBfQv1YVfjKqwYzlR7A5wrn37+yIqc+S/AtQHiQ=;
        b=llYmP40xKNZ20aSxEgnhNtwj1+wy3vaq5lPD2Tt/ZyII/AvdiIJwc/JGC9RkG3JXTm
         4mA4yToVzsQ1wmc5igc5U1i2AKJosL9Cb4+qKNnv6X5MidIgMMgdZ+OQVrvA/dgHqzY1
         ctRXPjxtO+QLd4Y1+W86ql5qlEUHcuxC67F529VvweGnpwpQ6zeosnLXTRsZaeoll+tZ
         qppfVA2mnFiptpFqROVI6ON/upCOT8wOIwLrwKjTzoJ1foSda+InGQl+MmqTjkxOgZCi
         yyrecMNsEAh7qnesnNb2McSeBKzb6y3T3gY2712X3tJ4553gPwMcsOjhupIopI2Qu1XC
         5T2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789831742; x=1790436542;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l0TpZBfQv1YVfjKqwYzlR7A5wrn37+yIqc+S/AtQHiQ=;
        b=SN/S27RQUAw8IsxvTF2hozQyJQlaoaRNvg+cTpi+qMwgskskKa5hEfgZ3M4gODqBYO
         uSxVUUe//WnbKDQMYqAbx78IMN+SKTzijBdpnWhCVeIriApvn2zihN0WJ+HoukgPYzzw
         +CnXvqt6LcOuZmh4cIqSqoJoY7+t6qb2PUFu6fykNGUU+x9cL8KyGmmLWizjJq/My4VP
         B2AOyJNmC3ua38t1kYQ7rMeniK1J18O9oFvWSX0UijfrFJfIbpTeDQNbyGfNwqpuPTq1
         M+LiwXclj5UA1EqvpM5hkQTzDwLN96UuFBnen+LBSTMGqeOER1YwNc15e0qospuf/jHf
         Htzw==
X-Forwarded-Encrypted: i=1; AKwUvBwXpPudGdjlveVOgUQWWrKFjknzkQTVDkKtgILTwqVBGwyGjTbI6XDIFfmZQtA+Q1EWyclH4wq3IXlyitg=@vger.kernel.org
X-Gm-Message-State: AFuF++msBK5NgshsxgXkb7J7t9OQqUzVDhZH2qC09CYjBFjt8jKlXkn5
	Y1UEbM/KUoouGrEG8OpEVDOyzoQD48dPbWsJp8Rq29to1gzhJ13NPUPYllXEJFQjLhMPTjyysXC
	WiS56EjJ96tOfKEEZM/jVSXVlV8JzwfvG4UixnsJ+u4o=
X-Gm-Gg: AYBFou2MgE40UC+bI1kPDAbI4iKG2H7q0Y6qX7bkmTDtf7XD2QV3KlUofRKhfg4A4r7
	4+VVISWg7IuCo72mOVqPOuITRYEUBYxsU7Z8kgYV0v2nx9Y6a9yrHNHwijUwjnUoIG4EpgTxUUF
	T3E4q5n/Rt7vBTqFHWulR5EVgzBcWjVFxRxJrbbxlSvy9AevZQb44URVUbPmSxv1TN4TO8vcNe1
	Hdmj76tJSI8CVPD4feosq8cKM8iuogXyBWepSgZ0+EY+uyhcO75od8KuX7qrC7m8csw1xTUluwZ
	2Zr6omC99chamh8Nat0FDdDR4EpeNdDO4F9rAoJLdXXjoGr8B0NNMukEGSsd2e+i2y01simGGOU
	rj3FM2x7x107Ndh+ZIJJWxoOgqJnvzMjt8LAlWf7qTHhiM6x6fkKOSXVhDim3rsXQD/+z3KEs2H
	8t43nDMHlhi1WrQfo=
X-Received: by 2002:a05:690e:4511:20b0:672:99e1:11e8 with SMTP id
 956f58d0204a3-67299e11752mr455363d50.133.1789831742087; Sat, 19 Sep 2026
 08:29:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAE2Bdm3NuEHshrG6K2boKAnCQUvT5SX79cP9nPgS2s1afzY1hg@mail.gmail.com>
 <6aab0f82.e91c2013.3bdb06.0009.GAE@google.com> <CAE2Bdm2wzxj-J0TM8F+3SVnu0W3HeiROW97U4qvBeyHKdHJFmg@mail.gmail.com>
 <2026091753-broadness-bootie-b683@gregkh> <CAE2Bdm14hif17B8RTAE+PhWEps5Fzh=WPurZeSNp9C6TqCKumg@mail.gmail.com>
 <aqwuWWMwdIcx3704@cashel.logfs.org> <mu82xsi6.76ee613a-07fb-48b1-9336-99e8780e8b6e@nod.at>
 <CAE2Bdm3FqBPAMxqKoz_h1cw+OXpm=LJHdJjsME_Jy966tqhq_A@mail.gmail.com> <aq6gJTYTpTr8sYPj@cashel.logfs.org>
In-Reply-To: <aq6gJTYTpTr8sYPj@cashel.logfs.org>
From: Chris Roy <iam@thechris.in>
Date: Sat, 19 Sep 2026 20:58:51 +0530
X-Gm-Features: AcwNN1WmuQ-yAJK_L0Mqu0n7bynCj_HJ7gLPmHLdxL6kt8_egR93r-O600_Qqss
Message-ID: <CAE2Bdm3K+ZnrfB7xzkg=2fzMs7AmJzdF3aYCpN00h90TR6FMog@mail.gmail.com>
Subject: Re: [syzbot] [fs?] possible deadlock in ovl_create_object (2)
To: =?UTF-8?Q?J=C3=B6rn_Engel?= <joern@barelysecure.org>
Cc: Richard Weinberger <richard@nod.at>, Greg KH <gregkh@linuxfoundation.org>, 
	syzbot <syzbot+7cab6a19619f1b8efc00@syzkaller.appspotmail.com>, dakr@kernel.org, 
	driver-core@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rafael@kernel.org, 
	syzkaller-bugs@googlegroups.com, linux-mtd@lists.infradead.org, 
	miquel.raynal@bootlin.com, vigneshr@ti.com, 
	Adarsh Das <adarshdas950@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 19, 2026, J=C3=B6rn Engel wrote:
> Finding good names is probably a fetish of mine, so "val" is mildly
> disturbing to me. [...]

I have a similar pet peeve in my domain. I kept "val" since
it mirrors block2mtd_setup2()'s own "val" parameter
(the raw <dev>[,[<erasesize>][,<label>]]), so I kept it for
consistency with the existing call chain. I had considered
"spec" but probably it would have been similarly unimaginative.

> Is this check necessary? [...] Looks like the kernel is still
> undecided whether checks are necessary or not.

I will keep it. kzalloc()/kstrdup() under plain GFP_KERNEL can still
return NULL under real memory pressure (no __GFP_NOFAIL here), and
dropping it would be inconsistent with the kstrdup() check two lines
below.

> That's quite a few calls to the same function. [...] If you feel
> motivated to dig deeper, please do! If not, I'd rather leave the
> mess in place than come up with a half-hearted attempt of a
> solution.

True. It is accretion. I'd rather not bolt a redesign onto this fix.
However, I can look at setup2()'s callers as a separate effort.

Regards,
- Chris

"But how could you live and have no story to tell?"

On Sat, 19 Sept 2026 at 20:16, J=C3=B6rn Engel <joern@barelysecure.org> wro=
te:
>
> On Sat, Sep 19, 2026 at 02:22:15PM +0530, Chris Roy wrote:
> >
> > +struct block2mtd_setup_work {
> > +     struct work_struct work;
> > +     struct completion done;
> > +     char *val;
> > +     int ret;
> > +};
>
> Finding good names is probably a fetish of mine, so "val" is mildly
> disturbing to me.  It's not an objectively bad name, just something
> where I'd spend another five minutes trying to come up with something
> better.
>
> > +/* Runs block2mtd_setup2() on setup_wq, blocking until it completes */
> > +static int block2mtd_setup_defer(const char *val)
> > +{
> > +     struct block2mtd_setup_work *w;
> > +     int ret;
> > +
> > +     w =3D kzalloc(sizeof(*w), GFP_KERNEL);
> > +     if (!w)
> > +             return -ENOMEM;
>
> Is this check necessary?  I'm in the camp of "malloc should never return
> NULL".  That condition is so rare that it is effectively impossible to
> trust callers with error handling.  So the right approach is to crash
> (or kernel panic here) instead of returning an error.
>
> Looking into sources I see this:
> static inline void *kzalloc(size_t s, gfp_t gfp)
> > {
> >       void *p =3D kmalloc(s, gfp);
> >
> >       memset(p, 0, s);
> >       return p;
> > }
>
> We have at least one example of explicitly not checking the return
> value.  But we have other prominent examples of checking as well.  Looks
> like the kernel is still undecided whether checks are necessary or not.
>
> > -     return block2mtd_setup2(val);
> ...
> > -             return block2mtd_setup2(val);
> ...
> > +             ret =3D block2mtd_setup2(val);
> ...
> >               ret =3D block2mtd_setup2(block2mtd_paramline);
>
> That's quite a few calls to the same function.  If setup gets that
> complicated, that's a strong indication that we're doing things wrong.
> Typically we get into such a mess one well-intentioned change at a time.
> Find a bug, fix it by adding another caller, repeat.
>
> It isn't obvious how we could improve things.  Sometimes it's lack of
> infrastructure and the entire complicated setup-dance should be moved to
> common code.  Driver can then call a single function to deal with
> everything.
>
> But if there's only a single driver using such infrastructure, maybe the
> driver is doing things wrong and should copy whatever other drivers are
> doing.  The problem shouldn't be unique to a single driver, so we should
> find the best solution and then use it everywhere.
>
> I don't know the correct answer here.  If you feel motivated to dig
> deeper, please do!  If not, I'd rather leave the mess in place than come
> up with a half-hearted attempt of a solution.
>
> J=C3=B6rn
>
> --
> You cannot suppose that Moliere ever troubled himself to be original in t=
he
> matter of ideas. You cannot suppose that the stories he tells in his play=
s
> have never been told before. They were culled, as you very well know.
> -- Andre-Louis Moreau in Scarabouche
