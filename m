Received: from mail-lr2-f12.google.com (mail-lr2-f12.google.com [74.125.230.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B265246D09D
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 06:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790834624; cv=pass; b=pk+eUh9ZVli0x16D7WTIwdrRDTWdMvvTmVdaDmvLx1A5/p22TBBbCbDHoDW3ICaph8epUa2574QC0CWaHn3ls5CrHxuJiOS0+cFaGq7XVnQE5D8ogIn8Q2AdwptL+FAGs1ibSAf+XeORCnAPW0un8yMWKYur1FP0BsBdaGm02EA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790834624; c=relaxed/simple;
	bh=PIROSIJcUm8IhNkrYuoivcsIwzp3qi2TP3RwB/cUmfs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=XnE8aOlYclME88y/6fWNFnw0r6di+gUAMFJyuBCcodk1iISMz6Ien1EFoGws5CxN4wvNBJS+4x+lSk0h7EflnjYC1XcXa/qZJIvZXQ9bbZ+rg21drnIxzouXk0pxcn4GCNQabvMflKIDdNjDbfei/E2q46EeJMQoiSQt3vN1e9s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=canonical-com.20251104.gappssmtp.com header.i=@canonical-com.20251104.gappssmtp.com header.b=viIEHKu+; arc=pass smtp.client-ip=74.125.230.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical-com.20251104.gappssmtp.com header.i=@canonical-com.20251104.gappssmtp.com header.b="viIEHKu+"
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a59bc470d6so58948261fa.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 23:03:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790834618; cv=none;
        d=google.com; s=arc-20260327;
        b=UV5JfrUvSag4dg5wtyfKtAWs0gWzR1xkzTcdFEYDSZXalfXrLnhx9Zjc9wKCZnuSQL
         Tg2FwlP3xvOCc9HMj3IQRYRAQQzYcl3EYWQgQhAOftB0gnVEHXM/8PxRKNuk34mT/p0z
         XILYcmZuUJgFqw/UMS1clf2YiHUktue66yB8O7pgGsxq3ydmyfj93W40+A76mOBjNJTq
         v7sc62HrL169IC/I56ZS7HHw/th1TnwgWzlX262bQyhoXa/NAAPnQKVgR+rn8cG54TOS
         B+2onHfBvj9hzuGUcpstwN6vNs9Kjf6xmIPukn1PmSy2REMcTBTTDxNQP8eMCIguicfL
         sHxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Hgp1C/l5toz2Y4Urz7dWHnR34B0fNj/IjonzU3eqplI=;
        fh=ZwUj8QZGbP0IPy/k404craqHwg8rRakc4jx9J9e1hgA=;
        b=fBbe2CEyjxMMtIA4tkOKSRB0OPLV7JDM89Q13TqmO6xDHgNm7iMhXEdJbICt95sbim
         3Dkk0T7kaKwYnOn+qPEnwOZshXQRX1AFvrPAPy5NNAfXm7OlVFJgd1fpVHULxGgc6Hgz
         AwU+ZIB1+7NkZE5+Q6PNkNU1FYua+T+UqUde3HmxX8XZC1IeyR7WYmufbtukbQx6tBUA
         5Flqse56xyMiQeVGyaZwUbcXH9l9NadN+XbdUrpAQf7dT3Dz0uL241j1xWj+gQ25wfjK
         rS4VhpXwLyPCDpF4f+SMJokK0KMqflRWA5WbBjACuRf/bN7LGJOEHMhna7rpa/ZDSoF6
         5O2Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=canonical-com.20251104.gappssmtp.com; s=20251104; t=1790834618; x=1791439418; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hgp1C/l5toz2Y4Urz7dWHnR34B0fNj/IjonzU3eqplI=;
        b=viIEHKu+FSG1KhfrpfaoKKTq6PFqiNt/yYweb4o7LRjKSQI/reGJVzBQdbbtyZr7jd
         Z0A/Fch0XuRIOi2UP4tfHOH4FxvBVQVGVqhSHhKr+sy6h9Kyl2hpOlxJA2XapFj0LrlN
         AeS10H1Sev9gzXCH8WaHb93Su49e6UQHTGWXMeCgZY8V90HaRaFSqCaJQhK4p6kUYulQ
         QTKCPFiQFujjOSeroqFVa4sH4pc8um4RWETSxTgjqfPIDRgqyAo6Rw3aaUFNxGAhO4ah
         5WrpAB5R5sq60Tfnc4HYEiCIUJaIRxxNt8dLlZwsubrZtPgRd1tSjX2ywfmQC/m7ShXT
         fvOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790834618; x=1791439418;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Hgp1C/l5toz2Y4Urz7dWHnR34B0fNj/IjonzU3eqplI=;
        b=sSnTE/tYkWy5UaLmfrH8+e0MuwPWXbxqOe8dGCqHW2Obloihkgmuo3xEeb+anN4oIU
         NWorD/x21pgbcMyQIVv1m2uZC9BdjqXZz+Sh/GS9m+JGE9QaIUevqL8jDraHke2EoOjm
         eUMAawobzEYapdtRNyx1WnhfsOzAXbZ5ipV21DYJDOlpp+m15wogO7OITQHC8Uu1uK+Q
         D+EHMMysDM6nSeYKYw/StwaPWKHwue7chMJQrP8cEB9NFA3eiC7BAY48AD6JEheTT3h8
         No2O6yq2U8Qupx9E9/uzDFnex8TONYpfiCs1ws3JrosvmvgdC33CDmuSlVwtPg9rc4xn
         6qMg==
X-Forwarded-Encrypted: i=1; AKwUvBxiKA/T+h4np4S4e6pjirYBVEfGkY2mQ15oeyzBw0XyD3HCquzQFCcnN6d0X8vHLK0a6DHSuqIa1+VztLk=@vger.kernel.org
X-Gm-Message-State: AFq9FYL4IeGtjrqhsDoJGjkHlz9OacH28nIijUZY1AXWoVyqGaK9rUNS
	rlwfIIPF43qTwvmiyL54MWaLJ+FHlmBHfnXp6uHGDk+TBH5yrozkv6VPrmPfLBgZMXMUYBEmNf5
	VqQBJaggVF8LKZaHcJLfLCr/XkBLhsxA=
X-Gm-Gg: AYBFou11zcIoQX3LnzeNtKcr58WSdmYFLuwQnJEIciBQdZjRuZ5uVB6JEAR9jfmkiod
	MjYIpSt38TfLwuIGPHyUGuDtsIvSyiOHicrjsji0jjAqbF+lOJiIk6lfJnjT+hNs2EnIt/qxa/b
	eXECZhxZb8NRg4bCKlylmXNM4WmyMt1fGlUQkP52lnz9ueEkeF0p8+Tt5Pna44nSKsQY/R5MWG3
	kAs1YXElmBDFZNqMXnQKWyr4MRvrMyVDSJm9ihmmeyaeNalWcdhwVJ6SC4ShJrKUOjQ7mAL/k+L
	DHRaodTL0BlIASdm0ZuPFphsNQrbCGVpUXedMdD33EO/N7QcnwyCFus=
X-Received: by 2002:a2e:be07:0:b0:3a6:568f:40eb with SMTP id
 38308e7fff4ca-3a7792077a2mr11432771fa.27.1790834617800; Wed, 30 Sep 2026
 23:03:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260114011917.241196-1-acelan.kao@canonical.com> <CAMz9Wg_i5Sgewa2N7jfEoNJrp5jMp+O5m+kM=VN9rWKcGLzQXA@mail.gmail.com>
In-Reply-To: <CAMz9Wg_i5Sgewa2N7jfEoNJrp5jMp+O5m+kM=VN9rWKcGLzQXA@mail.gmail.com>
From: AceLan Kao <acelan.kao@canonical.com>
Date: Thu, 1 Oct 2026 14:03:26 +0800
X-Gm-Features: AclHuK8bG-XKFgjsQDqse9lVQ8q5WyIRi7oBeYeYkMJTSBRhJ-JWaOzReixkG5Y
Message-ID: <CAMz9Wg_E686NQe5XigWX6s2mbWE4t2DoTvW+GmtMzN6bP0tQ4Q@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: set SB_I_NOEXEC and SB_I_NODEV on dmabuf filesystem
To: Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

AceLan Kao <acelan.kao@canonical.com> =E6=96=BC 2026=E5=B9=B44=E6=9C=8813=
=E6=97=A5=E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=884:10=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> Chia-Lin Kao (AceLan) <acelan.kao@canonical.com> =E6=96=BC 2026=E5=B9=B41=
=E6=9C=8814=E6=97=A5=E9=80=B1=E4=B8=89 =E4=B8=8A=E5=8D=889:19=E5=AF=AB=E9=
=81=93=EF=BC=9A
> >
> > The VFS now warns if an inode flagged with S_ANON_INODE is located on a
> > filesystem that does not have SB_I_NOEXEC set. dmabuf inodes are
> > created using alloc_anon_inode(), which sets S_ANON_INODE.
> >
> > This triggers a warning in path_noexec() when a dmabuf is mmapped, for
> > example by GStreamer's v4l2src element.
> >
> > [   60.061328] WARNING: CPU: 2 PID: 2803 at fs/exec.c:125 path_noexec+0=
xa0/0xd0
> > ...
> > [   60.061637]  do_mmap+0x2b5/0x680
> >
> > The warning was introduced by commit 1e7ab6f67824 ("anon_inode: rework
> > assertions") which added enforcement that anonymous inodes must be on
> > filesystems with SB_I_NOEXEC set.
> >
> > Fix this by setting SB_I_NOEXEC and SB_I_NODEV on the dmabuf filesystem
> > context, following the same pattern as commit ce7419b6cf23d ("anon_inod=
e:
> > raise SB_I_NODEV and SB_I_NOEXEC") and commit 98f99394a104c ("secretmem=
:
> > use SB_I_NOEXEC").
> >
> > Signed-off-by: Chia-Lin Kao (AceLan) <acelan.kao@canonical.com>
> > ---
> >  drivers/dma-buf/dma-buf.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> > index a4d8f2ff94e46..dea79aaab10ce 100644
> > --- a/drivers/dma-buf/dma-buf.c
> > +++ b/drivers/dma-buf/dma-buf.c
> > @@ -221,6 +221,8 @@ static int dma_buf_fs_init_context(struct fs_contex=
t *fc)
> >         if (!ctx)
> >                 return -ENOMEM;
> >         ctx->dops =3D &dma_buf_dentry_ops;
> > +       fc->s_iflags |=3D SB_I_NOEXEC;
> > +       fc->s_iflags |=3D SB_I_NODEV;
> >         return 0;
> >  }
> >
> > --
> > 2.51.0
> >
> Hi all,
>
> Please help to review this patch.
> It does the same thing as
>    ce7419b6cf23d ("anon_inode: raise SB_I_NODEV and SB_I_NOEXEC")
> and
>    98f99394a104c ("secretmem: use SB_I_NOEXEC")
> Thanks.

A gentle ping

--=20
Chia-Lin Kao(AceLan)
http://blog.acelan.idv.tw/
E-Mail: acelan.kaoATcanonical.com (s/AT/@/)
