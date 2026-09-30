Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 453C03B27DE
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 11:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790767795; cv=pass; b=Qap2pMdblLonNdLqmh4SQNnqXkU3UNtbuiqMTQbooPhfBl7IjEOmggNq/aIvDs5NvE17ZsCg4BpcfsOQRln8Kt9oONv0PQMczXGtOQhapQJfbVkiN8X9mj2nPvFY1jkBvFWg2QsHXsgDNG0qPcKIsXjKVU4ZtUMkYh00cL42Ky8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790767795; c=relaxed/simple;
	bh=z9JQsjZr0T0YOMcUnw8JHainCYTPtz98ZWzc8GlE+F4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=bV9Jd4cUgvcezDexqSxgzmXX0Vznu50MbziVAAT6loaq9kPidqILFdsK6/kj9xYp1jNruD/5ZN6vsVZ8Q3jg4Nv12CHAM7shgZhh76gnuHfJopV/BnL6QMd9qgJctqLL1bBVwc8jkptaJh3LSRkOgPG4ZwN6Vv0z+K6X5ywQEfo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lg0xzQge; arc=pass smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lg0xzQge"
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-144f79153f5so732232c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 04:29:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790767793; cv=none;
        d=google.com; s=arc-20260327;
        b=OCt6YZOsYgjt83uHGZWWdTxs9aZrDMCMUKphZpVUM7MtKDA14k8vNd5bJWOuNmFW3Y
         7AWwnyeJWuubxKx0eqVanLDXgUzqstbbajASqiGPxDjfCySZVmcnma30QSmQ2+o2mAQM
         XxmzAprIuP7hQzOeTr75H1szZG6hdn0elHpxc2hVjL1ZndsmtVnzRsGrSuPZPuy1FOzo
         NcIZ6lT4+zn7XbIp+S3/OmH0K24nFV4AhNyAJi5JPYQv5z3KEyWqY4gorbDide3YKfpq
         z+ciO2wugDFGYmJ/9Ei0kvx2kCmRkUOqNtbBfNJuFwEyMh1ZFyrkj4+CY+iRKeJyoxB1
         MzEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VI9FMfHBO8Xce1RC42SkpR8mv4d8IZMnoN931y6mJ7k=;
        fh=+C/u+W0Tfw7jH9GKp7Wlt2gwh2kKZzpITOqRUF0I7TU=;
        b=J25dNLfYI+n9Fq37UeDT3j8h3d+Hc5d2jLBKhfTO9hJYO6WOqzM7Pl3vGSe/WYm6Si
         udvj0xSHr+tY+qALyS+XQW0h9Rpdld8LmHisl0dsUNQ5XA0imv6yhUAtdsY9y2DeX1rO
         mDlbemn3xyyGL0nEBZ59HHT3Po+XmMNHBQ8k8czA6fgPsw0Qi4TiQTwE3JUa4uR0bQH3
         NUL+SzT7WEf6GpSx8GA5qBJv71XTo3TPLO0wolh9hSU9MiORJeXSHKrhf0LJsEU9UBwq
         MX7TUShC6TdTyG0rT+HXCrVMLAIBZGSOJRVopNYT8WGtoqrjj5AVRYYskxE1Os6SG1f4
         cADg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790767793; x=1791372593; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VI9FMfHBO8Xce1RC42SkpR8mv4d8IZMnoN931y6mJ7k=;
        b=lg0xzQgeIvXZerWRRfduiJJSv6TjcLk911lXYD0GHI33ptuQUF8E54qxmPWcQHJbED
         9n0O1TOEbVYoIYSHb3Z78ScrEOpn5WN6rN3sfoJXwt8AA8pRylEXagQ12+xrmZHdDq/4
         H/KKfzsUH49wVyjQ2u4fuAmrsNbqzCLsKDQnR88N1bHBH6IFXxV3VHrWW+MMbAw2oGz0
         vKmzg8Ju1sL/pHepNXvMMX0Hm+EwbQVTh6R/vLHsa6SeCjuDjKeiZ9SjPYXgW4zEm0eL
         4YTKrj8zEgsrvwDC1MKXNawBcA/nNN0DDwar0CyQ/XuJzD3ZVcLlTybJTXyhWwk+Zdny
         c2eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790767793; x=1791372593;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VI9FMfHBO8Xce1RC42SkpR8mv4d8IZMnoN931y6mJ7k=;
        b=ZUsETERZfRIElH8m8gpmJngunEU0MXYqP4E/e8BLCqpALlKyWd01GrP4v/C0CTTny4
         Rwm4ywVisMH7BHvKiVlFyOX2j7lSBSZFxpe6Wa582zncW5fIlUywhlWya20AnkVOpxmW
         nj1d/UtzBFCNTx3m2vOBr02uYO6sPtwIgv52MSGij25IYlNZJj6/lh7vZcIuFkVQeEOR
         vbZ8dqXJwiFIY0R4mLjvT4ygmAE9VcR03++OD4tduXaBoo+KzVu4H6TdAVKMLoWc6XWw
         Zp9pmEoJ4JD530migZBqZy0WCYICppxfNGgm1SNxaoiQAQUkKkPhZ5AA59xpzal6SZqD
         hZEA==
X-Forwarded-Encrypted: i=1; AKwUvBzeb41gAZt9BuDUOeHqZ5uPv/T2j+Axse72U8j3qkWpGfmNl14CWWnLnxtZFK2qbyEbFBJ8LCj/NEaCg2w=@vger.kernel.org
X-Gm-Message-State: AFuF++mO9r5XMOYhUP55u0UP1UDVvCN/PhvUzzzWON9GLSmqQ71RpUHP
	mKsmWAriq5m9MFVw90hLZWbO1w1kOpkT9Gxjh6nIVl/9oRjgNj+Ommixj/ZNWj4Jxi8hY0+p/5p
	2ljuh6Axocs7EWoIey58uf1CpJsMRqnI=
X-Gm-Gg: AYBFou2upBJHlbIgvcMz3v3WnZdSLHInCp1u4oaq1erNVmcH1j8ygCHvLKIR6iMT4wR
	/8S56WDPaPoTZzbmj0shy4OR6snU3TyoGr5LutjIDgdkeZWYGefIs5iE7IrhZlGzdl4fZrqGz+7
	T14g2IPhpQkrH6XAkWT2jc30pnVcopiENhFXoEowd7vGvRRkz/1NF6daiDEx79RWq9tGgmEFCU1
	isKINh0kNcV9hrFkSOWI3zzPnQgMo9QjQ5MXd0V+NZNfbmNE0+0csmo1VtHU4+14pPKePrPKTjr
	hKhQOjw5Zm4nF9nNpJWbBDS3pbdXmJZPs3DGR7gthLRuLj8aeHyyvnqB
X-Received: by 2002:a05:7022:ed02:b0:143:1bb1:32ff with SMTP id
 a92af1059eb24-14d34ad85fbmr972307c88.16.1790767793097; Wed, 30 Sep 2026
 04:29:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAJ3C4KySUqKevOBn=CROzsWkaLdK_X241oLFXO26FKBVq73QJg@mail.gmail.com>
 <ary_wjlpYNWbqaHU@MacBookPro>
In-Reply-To: <ary_wjlpYNWbqaHU@MacBookPro>
From: binglei wang <l3b2w1@gmail.com>
Date: Wed, 30 Sep 2026 19:29:41 +0800
X-Gm-Features: AclHuK-p_Xk2V1xVIcpsl-hSdtHJfx0KgIA3_98DoxwM1xsRTEU7UjoPuOvA3hI
Message-ID: <CAJ3C4KwGis=rhUp7GPXMCTAn0Tf3mLbf0DgSGhOsd6mvzwRbPA@mail.gmail.com>
Subject: Re: [PATCH] erofs: fix folio reuse from a different address_space in erofs_bread()
To: binglei wang <l3b2w1@gmail.com>, xiang@kernel.org, chao@kernel.org, 
	linux-erofs@lists.ozlabs.org, zbestahu@gmail.com, jefflexu@linux.alibaba.com, 
	dhavale@google.com, hongbohbli@tencent.com, guochunhai@vivo.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sorry, my webbrowser email client configs with something wrong. Thanks
for your reply.

I re-sent the patch from my Linux shell. I believe it's OK this time.


Gao Xiang <xiang@kernel.org> =E4=BA=8E2026=E5=B9=B49=E6=9C=8830=E6=97=A5=E5=
=91=A8=E4=B8=89 15:52=E5=86=99=E9=81=93=EF=BC=9A
>
> On Wed, Sep 30, 2026 at 11:37:53AM +0800, binglei wang wrote:
> > erofs_bread() caches the last folio in struct erofs_buf and reuses it w=
hen
> > the next request lands on the same folio, but the reuse predicate only
> > compares the page index; it never checks that the cached folio still
> > belongs to buf->mapping.  Correctness therefore relies on an invariant
> > that is nowhere enforced.
> >
> > fs/erofs/xattr.c already breaks it: erofs_xattr_iter_inline() and
> > erofs_xattr_iter_shared() call erofs_init_metabuf() on the same buffer
> > with no intervening erofs_put_metabuf(), and their in_metabox arguments
> > come from different sources (per-inode vs per-fs).  When the two differ=
,
> > buf->mapping is switched while buf->page still holds a folio of the
> > previous address_space, so the next erofs_bread() can return data from
> > the wrong one.
> >
> > This is observable with METABOX enabled, where shared xattrs silently
> > disappear on the mounted fs, while the same tree built without METABOX
> > reports them fine.
> >
> > Fix it by validating the address_space in the reuse predicate too: if t=
he
> > cached folio belongs to another mapping, drop it so that the existing
> > slow path re-reads from buf->mapping.  Reading folio->mapping is safe
> > here because a reference on the cached folio is still held; if the foli=
o
> > was already truncated, folio->mapping is NULL and the slow path is take=
n,
> > which is the safe direction.
> >
> > Fixes: 414091322c63 ("erofs: implement metadata compression")
> > Cc: Bo Liu (OpenAnolis) <liubo03@inspur.com>
> > Signed-off-by: Binglei Wang <l3b2w1@gmail.com>
>
> Thanks for the patch.
>
>  1) The patch format is still broken as your previous patch, please
>     check your email client again before sending out a new patch
>     (as I said, you could send a patch to yourself and try to apply
>      the patch and see if it works);
>
>  2) the commit message of this patch is too over long (mostly
> in the LLM-generated style), I think you could simplify a bit since
> it's more friendly to human developers.
>
> > ---
> >  fs/erofs/data.c | 7 ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
> >
> > diff --git a/fs/erofs/data.c b/fs/erofs/data.c
> > index be63b89f0862..d8b6523bc218 100644
> > --- a/fs/erofs/data.c
> > +++ b/fs/erofs/data.c
> > @@ -33,8 +33,13 @@ void *erofs_bread(struct erofs_buf *buf,
> > erofs_off_t offset, bool need_kmap)
> >
> >   if (buf->page) {
> >   folio =3D page_folio(buf->page);
> > - if (folio_file_page(folio, index) !=3D buf->page)
> > + if (folio->mapping !=3D buf->mapping) {
> > + /* the cached folio belongs to another address_space */
> > + erofs_put_metabuf(buf);
> > + folio =3D NULL;
>
>      `folio =3D NULL` is enough?
>
> Thanks,
> Gao Xiang
>
> > + } else if (folio_file_page(folio, index) !=3D buf->page) {
> >   erofs_unmap_metabuf(buf);
> > + }
> >   }
> >   if (!folio || !folio_contains(folio, index)) {
> >   erofs_put_metabuf(buf);
