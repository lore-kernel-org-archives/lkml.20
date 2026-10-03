Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2679637E5DB
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 08:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791017240; cv=pass; b=OeJEz5iBMAtQGRAPBhuvggHPzjj3WT2/MXd+janr0TXxgPkfqWikLpvICDW59pGT02YyBpilLK0T0HbpimMVRw2dghXiC5ZqwwP4Tc/XnbjIRVSwEnh1aZ+EoQlaHrg8Qklk/cLdAnEriqZe6931xCqF1YxUcPRo9QZNWNRm95Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791017240; c=relaxed/simple;
	bh=YJbrX/vCmT/nwmhXiLhT4JJHkhYun1n5JE/xPnZef88=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TvLwh9nShmoMvGlJPbjUIIZ+eSuRNbSjN306lrJbEdq2VqbDT2WoDse0J7IrCXAKJVxOsyOAuX3dEdmImYE/rFbxqujqhWXhEmMgNIn1dyclWvmH1mtmiuyt74328l+fCR024wi5iYtnm8+CPt7dTGVoxYStwp3ClqTIf8FNsNA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XHRe7h52; arc=pass smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XHRe7h52"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a018493d57so27425e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 01:47:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791017237; cv=none;
        d=google.com; s=arc-20260327;
        b=rRvQsXtO6vCQMHu1t3voOeY810dZE2H9lYHyeV44E4ndd1Y27x3RoN0lQUJiisQ3af
         i3tL1m9k3nXk9ReqvRl9bELROe3xQF8cj7HW/WJCa5MGilS7JjOUgRmMP0xdDNibiooO
         8otD5JHn2PUpBwr+gUsLOih4x5zdfpnM1651PczE4pqF0jMMurI5UNhXD7K3d1cxsaFA
         WdAq5ajWUNLOJMQrimX58M4dNvB3gRK5Fe6eNYqLm5VtaP0dSr7uLpqj9zvB6bJOrOzG
         bNzbYAqZMT+dkUoGJ+4F8kq5lSlHSamGhMEBuGmYUivxJ4Nf21utw+xVLJxaJKlIiz+v
         j9DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=746wAMHewz8f00PoFb79OM9/H7YkTkpGxvh84Ci27zs=;
        fh=BP44PBA7KUo+2e4dsZ/IjKg/7NYmtW8adQlAS/NFHSU=;
        b=hBHWXCiN/ZeBKPq1J7gtc3AiKJjWV0+wSv1xLD8nOhI4DPrZC02SZHOEqT2VJ0ezpq
         CTHLTtmzRhc4dbKpILsLx++atuHYUnqITkcUox23KpQhMnLU3XDcw+mj2Xl1uxjdWXj+
         1wlsYRpt7cQ4QHWZRUMHfzNS19LPISbBEffQdi+wjQWmwigy1jpFWHE9yqe5eGzqHLAf
         BzxvuRywykBaLNfgrpmgunBA7IfBY69TVS3+xca1lesE+PHaf8nOVYCjbqvRB4r1OndV
         wuTHJ8JptJAvdq1Rk28iR19w7PGVGHQRN7YcC+EfZaHYrHw6uYFgxFtf1Jorwt2aobcf
         Rdig==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791017237; x=1791622037; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=746wAMHewz8f00PoFb79OM9/H7YkTkpGxvh84Ci27zs=;
        b=XHRe7h52u3QvNH0Fji7iedsXclVdBdL4DwVOrcJIMNVQxKUGCs+46B7M7/VF9FHwN1
         Qb3qQxkhl3WzA1l10wjjhgj9/7D7bP2qdmCJ5CEU55wJ2Pr3Z24ICEa5eFBkXx0uRCwk
         M2HAhM6RMPqcRNTL5PrrgWWf6AVzfQjJJNGFN03BE4tvKmE63PK3CLtyhGi3Xlt8/JDS
         OeJYi3VfEs9daN+lLCGXoOo7fRYJy5LM5Tt7mLAp995uJcKjkN0QFL9xp73So5rG6q75
         qLF2COgv6nFni1/4Y4khP/Tu5Plu38KDTavTYFFEvqUN/1sACipaRu4TpcfCP2pkUGVT
         wXwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791017237; x=1791622037;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=746wAMHewz8f00PoFb79OM9/H7YkTkpGxvh84Ci27zs=;
        b=akInh24ETZ1VoZIoogXWxUeJLqWvuowQb2IyCikfPKtQaHZomIwbphwkd676659rcY
         mTzBkhZ7iSsr1GtTUIDIcMkf+jgfNNJLileZxUFTIFL7AB2rHQj+I2nBFICivfZ8vmfM
         XRnorzbPNJUMINt8CwJjkh+s2hMEIcrTka+bZDA7zrebNxaH5VODAGrlPlUL5KQ56B1P
         uT1elDdkd8ywyMMSTU/KYuUrHPCigt9npXWRsU+29ApEgImHwwOHscliGxmcztcHwItX
         5dO5q5/gExPdIBk+vVM4u/Q7auYgAxv/aHIF+Gu2Svz82hbDQtir2v2r/EYHATYW3pde
         75gA==
X-Forwarded-Encrypted: i=1; AKwUvBw7pqLlHZD94wbSI94QZg+fYT2kACJ1S9I1aJiXWtlUbUPBNYStRaqb4qbPd+diwOmLNN7ErMAbZhBw8Wk=@vger.kernel.org
X-Gm-Message-State: AFuF++nCy+bsgPdVj+sCZWp7a0O3quRKTO2d6u+eI4X4pr0xpdh4oBeP
	hQThhd+3Y53D0M6s0Rg6VwF3L4updx1zAzjitdnl+VBUvCLVWDWWqZIT8PCDowUSHssxz6VhY3N
	Bg3YoMoFqfQwKietMqypwP3HYzHCjdRtZJRU/5c4y
X-Gm-Gg: AYBFou1pYQZxA1sjfP4vhi+x9W0EVBg5YKcCYXaykIEdLrQNDUg6MoO/CuEjo6OkJfB
	yed2h7+mQuNw2YWSXAakRYV6GVDKXQNQ7Ir37B8FSQl52A4kFoOY1zJNuj5928RygrKZ4urt0Z5
	4egB0NFlOkoJ48b5FBjRlV+D8vvUl6gMZfLV4zom4hEiP4NmzG95VleyGIrqa7hzsT/Vmwd0zbd
	bss0XSafzGNOG73j6fhYwBANz+NBXDQZHspixO5kBkU0gNzZM7pQvuB10igj4Kgjb9HpxI/6bQ1
	ui+stO89eoSy/LfLl+FaWZB5wMOh4hp0DOdYHtfPzTyvFwADkOdCQXN8GhlCKVpNxwM3f3JGk/M
	FJdcI0aVrzrhy1TdYDFHQ4FPrYA==
X-Received: by 2002:a05:600d:848e:20b0:4a0:2229:528 with SMTP id
 5b1f17b1804b1-4a168152435mr459295e9.1.1791017236930; Sat, 03 Oct 2026
 01:47:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261002161738.621133-1-tjmercier@google.com> <20261002161738.621133-3-tjmercier@google.com>
 <DLUZYDAX6849.KKV543CJGGXH@gmail.com>
In-Reply-To: <DLUZYDAX6849.KKV543CJGGXH@gmail.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Sat, 3 Oct 2026 10:47:05 +0200
X-Gm-Features: AclHuK9JTcv24SfY-wF9YmNxhuGB1AXVuzqe7ziF79FmPpxWTB2IuNVQPvrhG4w
Message-ID: <CABdmKX0XN5Lapej9osNc4sOGGO3Hz7_tQjxxj-CfittTUOZMmg@mail.gmail.com>
Subject: Re: [PATCH bpf-next v8 2/2] bpf: htab: Reduce elem_size by 8 bytes
 for small key sizes
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: daniel@iogearbox.net, andrii@kernel.org, eddyz87@gmail.com, 
	memxor@gmail.com, martin.lau@linux.dev, song@kernel.org, 
	yonghong.song@linux.dev, jolsa@kernel.org, emil@etsalapatis.com, 
	ihor.solodrai@linux.dev, mykyta.yatsenko5@gmail.com, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 3, 2026 at 8:41=E2=80=AFAM Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
>
> On Fri, Oct 02, 2026 at 09:17 AM T.J. Mercier <tjmercier@google.com> wrot=
e:
> > +static __always_inline struct htab_elem *
> > +__lookup_elem_raw(struct bpf_htab *htab, struct hlist_nulls_head *head=
,
> > +               u32 hash, void *key, u32 key_size,
> > +               struct hlist_nulls_node **out_n)
> >  {
> >       struct hlist_nulls_node *n;
> >       struct htab_elem *l;
> >
> > -     hlist_nulls_for_each_entry_rcu(l, n, head, hash_node)
> > -             if (l->hash =3D=3D hash && !memcmp(&l->key, key, key_size=
))
> > -                     return l;
> > +     if (htab_has_hash(htab)) {
>
> [...]
>
> > +             unsigned long k =3D 0;
> > +
> > +             memcpy(&k, key, key_size);
>
> My bot is saying that this will break 32-bit builds with FORTIFY_SOURCE.
> __htab_map_lookup_elem_u64() inlines all of it with key_size =3D=3D 8.
> has_hash is a run-time load, so the compiler has to keep this branch
> and it's a memcpy of 8 bytes into 4 byte 'k'.
> fortify_memcpy_chk() will hit __write_overflow_field().
> That's a build error in i386 and arm allmodconfig.

I see the build error on 32bit with FORTIFY_SOURCE.

> has_hash is a compile time constant in __htab_map_lookup_elem_u32()
> and _u64(), just like key_size.
> Only htab_map_gen_lookup() emits them, so the map is BPF_MAP_TYPE_HASH,
> never LRU.
> Don't read it from htab in these two.

Ok, sizeof(u32) > sizeof(unsigned long) like in htab_map_alloc()
should do the trick for those two call sites.

Thanks,
T.J.
