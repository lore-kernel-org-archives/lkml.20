Received: from mail-ua2-f43.google.com (mail-ua2-f43.google.com [74.125.226.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F823CA4A1
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 06:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.226.235
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790664807; cv=pass; b=ZDWkBAas+89Ydy22zh+WwqGkQsFg1JWs5fAstJ97PGV+CbQKoEpSmVE8lzp9bMW1YjgZgAQc0JDlYKd+YHYCA3iPdw1icyD1KUIegVRZd8Iiyf/2hf4vGJz19ikTWJN603QlP8iKgx8jCPe4JJApVg2lgEIKL/I0urXX6lCw7bg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790664807; c=relaxed/simple;
	bh=EfP/d5Y49xviNaxKDhrOQcTd1OI9sI7yXtVqUJTZqNc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ISiDCXAHnMLvvaGe/4A5xZRXrv/pb08ZG8APIamNVSjB7DM2UIB6X8xVuzUSWWzs+58j1oYq4cBaTwBXcCHrOGhgJoSvtvdwAyD5RXWcGteM2mBb4JA9KtdRPLt3PBprb0AoUpPQKT90dZK6aM6y0G5FzPMUR8NVv+jYi3XkYzs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RA51Z3Dp; arc=pass smtp.client-ip=74.125.226.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RA51Z3Dp"
Received: by mail-ua2-f43.google.com with SMTP id a1e0cc1a2514c-97e96a8ba8cso2505335241.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 23:53:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790664805; cv=none;
        d=google.com; s=arc-20260327;
        b=LG8HzoZaAPm/9Vt0sJmLcmg1L1p2cv1CrKT/sbOuzcVzpmPVpxEi6WXaDbyJTpfz9h
         1dx4a7my1DP+30zJD6KK6JPoc1bl46EqtubHN/KrFyoJdy5gqaoJS4BQEoJtodszzk9P
         fDd6Ng1y1/uGmoVp1ASpZCl+Bl1bQfxOz/LCMP6gWSnVfio8lXZsX2g0rPCOh3Zp6K6+
         TsTsVBQrA4Gy8rtGPb1GEGWwlWqkvFbi+4L15M8gQ7Cj1CeByLZzkM8wYjhHWEajElWf
         uKA9ZQY0mk6RmAVZDwzPTFsMbWJBU6ImAK2qvR2Pbrn9glwzwQ5YMtMWex/g8Nwx4QVL
         3zqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dXZNNhcaPyXqA+zSRw2siBSAi+AcqonBzV+S3T5CpzY=;
        fh=4jY/EJiS8l3OyrD7jdxv6NbyW35h1i4/VyIwfhjrcGg=;
        b=rGl6zkoXnjr8OLO8ouX1qHmSFLEQ9f9h1w/39AjpinWwpdTl01Che9vgPy5BbQEc2h
         TV36HLgqfJUEmeMpNCAMOEAXDYP5IV8B06/vNd5UA1pPUBhGVcLKy8kkxAv8kZPz8GqK
         VDEdLfvOtAITGtHRl0udvUWYoGkIVEb2Dg0EXgX7bM1jx7/5p6v00Ufwg56+eFqHmLpj
         bVmkYQq5IXp9/ogw8d0JZFLjHw3oux5U8C/ZfrRIxcKrLtkDSzSpg77BBf9u7WMcMpgd
         OyC6EGtHjT7e3/B9dpuKvdy0gCpfeHD5o34cV0yNXniP4bubJiAkquqrbckX342dJe7G
         yxyQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790664805; x=1791269605; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dXZNNhcaPyXqA+zSRw2siBSAi+AcqonBzV+S3T5CpzY=;
        b=RA51Z3Dpl6NjuuVdtHkqh2HWesiJrEA0riCy61M+YOqGqvmRkUyWhsbfMktlAs0Jxq
         qyeJeEaVOkM6bgvFPCm8u6uKpJ3RHtXC0ydcXNC6oGXDevwfMHOrXjg1fGphllqiSgL4
         N270MKMB/EPXi6QVTLiJXsaK+5RF0WaSKIxqVpePATVT2OAzsEv0wrHmYfYTkGuAZxw+
         7AFo3akJcH3Bma5SvDH+y4LaBaKTluSk38Xbflvnkk+w12Q0xp8s7nC7hVGL7DQru2Tg
         yVPIRv8UfO6rxh4z1lT4C5h4KYUxwZO8CNEzFVq+Im+gfOsB4ksnMLBwg/twg0S1t7ql
         mCQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790664805; x=1791269605;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dXZNNhcaPyXqA+zSRw2siBSAi+AcqonBzV+S3T5CpzY=;
        b=D9gAGxgXD33UJ1RsiQzwg5V8UTvDE80UDOUtrX8SBL7l4rBoHL9Fxq7Uc58enaX/8P
         u5hwoxV1pCoBk/So5Yg5H6pLjeTZtNaz4yDJyVTyzqA3DowGFXC6AF+2wfAOcKQYwj1X
         z8cOJkYftMcy90ZpiafGGeRbkIWfQ7eWlSU3A4UUruXM92kkyXKQ3NFQSsJZwl8DKvmm
         SF0IDaNd+f/utVDMEm+cWh07xo77ibR/9sbSNfDu69FdtcFoNyia2gcRgrWWAjmx+pwp
         +LjTw9A+ryeZ8wv+s5uu8Rqf90MvheB7PoCWlvtU6uxQ1E0+j2A6396XZ2qHWxroWy2d
         DktQ==
X-Forwarded-Encrypted: i=1; AKwUvBwyWRNbKzkYR0/c8cxKVUfQ2P8qB41jfspapCzTTw93893AbK68p8sX22S/aVd4y51+s5ciZV7Erq3u5ys=@vger.kernel.org
X-Gm-Message-State: AFq9FYIRE3vBABkdpUC9WApNZBdzX405tJbjrvowA00vhWg/l5nKvzr9
	c2vtZlag5TBN7CKnIcbtks5fAJLX6dSlbCKAgWXqQHCkWQFeGdREaAkB6KtbYRnjL3d/SH/46qh
	vH34WW1YEnnznS5c7kHXGEnNvfJ48JZn1L+Pc2ik=
X-Gm-Gg: AYBFou3ZlJdF5XUtEESQsWCEHFPhftg1VFlW5o8VuZL0t1XT/OLm+RluXhyxrybi4fo
	6RQYsnsD2skeP5oaMNxnwicY13sBZEUkZP7CCKLtUeXsheA75PKNkZD00a1pKKSzROcixEMatNU
	Qg6eRowuIMnbCafsBeS9ggO1tOsQlix1eGIgOkuHdSGXwu1VAjY5I+TxD1wIWU+PelIAeKB9Gur
	7CeFT8bo0vyEts5hIOCF2+gMeGaPmOtdj37oQNxYbDA2sKna47ScAovt8pgyE0FykYkcYsxa7qr
	rLtFXqFzc2LQwwl/bZdgLOiFdo3dA8wgT0YxT3+XRepNPzDP99t1B4t1FEqvVFNsFGralG1kAVh
	3IxtLhkV3irmr60IGgqSU
X-Received: by 2002:a05:6102:5346:b0:79b:f57e:ea17 with SMTP id
 ada2fe7eead31-7af1c6921f0mr6195643137.3.1790664804262; Mon, 28 Sep 2026
 23:53:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928231737.2092716-1-morbo@google.com> <20260929010031.2186255-1-morbo@google.com>
 <20260929074930-f1e4add2-f8ca-43db-85fd-83be0e40c676@linutronix.de>
In-Reply-To: <20260929074930-f1e4add2-f8ca-43db-85fd-83be0e40c676@linutronix.de>
From: Bill Wendling <morbo@google.com>
Date: Mon, 28 Sep 2026 23:53:08 -0700
X-Gm-Features: AclHuK95_Ji_ujgZlHwbCN-2G8mT4XgLFj2k80q5CXF5eM05CshEFI-U1oGuQxM
Message-ID: <CAGG=3QXAb954ib3eGqci5NNs7pE3VEFgUBocRObqRSa4Z8sn_A@mail.gmail.com>
Subject: Re: [PATCH] fortify: add KUnit tests for __counted_by and __counted_by_ptr
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Alexander Potapenko <glider@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, kasan-dev@googlegroups.com, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

On Mon, Sep 28, 2026 at 11:23=E2=80=AFPM Thomas Wei=C3=9Fschuh
<thomas.weissschuh@linutronix.de> wrote:
>
> Hi Bill,
>
> this looks much better. Thanks for the rework.
>
> On Tue, Sep 29, 2026 at 01:00:31AM +0000, Bill Wendling wrote:
> > The '__counted_by' and '__counted_by_ptr' attributes associate a
> > flexible array member or pointer member with a struct field that holds
> > its element count. Supporting compilers use these annotations to
> > compute dynamic object sizes via '__builtin_dynamic_object_size()' for
> > runtime bounds checking with CONFIG_FORTIFY_SOURCE.
> >
> > Add KUnit tests ('fortify_test_counted_by_flex' and
> > 'fortify_test_counted_by_ptr', guarded by CONFIG_CC_HAS_COUNTED_BY and
> > CONFIG_CC_HAS_COUNTED_BY_PTR respectively) to verify that:
> >
> >  - '__builtin_dynamic_object_size()' (both types 0 and 1) returns the
> >    expected logical byte size for annotated flexible array and pointer
> >    members.
> >  - Fortified operations ('memset()' and 'memchr()') succeed within the
> >    logical bounds and detect out-of-bounds read and write accesses
> >    beyond the annotated count.
> >
> > Allocate the test buffers with extra physical capacity (2 * size) in
> > 'noinline' helpers and hide the returned pointers with
> > OPTIMIZER_HIDE_VAR() so allocation-size attributes, physical slab
> > bounds, and compiler optimizations do not mask the '__counted_by' and
> > '__counted_by_ptr' checks.
> >
> > Signed-off-by: Bill Wendling <morbo@google.com>
> > ---
> > v2: Move tests to the 'fortify' KUnit tests. It uses UBSAN, which is
> >     what gets triggered by 'counted_by'.
>
> v2 is missing in subject.
>
Doh!

> > ---
> >  lib/tests/fortify_kunit.c | 119 ++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 119 insertions(+)
> >
> > diff --git a/lib/tests/fortify_kunit.c b/lib/tests/fortify_kunit.c
> > index 413cdbf3dc0d..2335171f84d8 100644
> > --- a/lib/tests/fortify_kunit.c
> > +++ b/lib/tests/fortify_kunit.c
> > @@ -1011,6 +1011,119 @@ static void fortify_test_kmemdup(struct kunit *=
test)
> >       kfree(copy);
> >  }
> >
> > +#ifdef CONFIG_CC_HAS_COUNTED_BY
>
> The ugly ifdeffery can be replaced by IS_ENABLED():
>
> if (!IS_ENABLED(CONFIG_FOO))
>         kunit_skip(test, "Not built with CONFIG_FOO=3Dy");
>
> It makes the code cleaner and gives some useful feedback at runtime.
>
Ah yes! This is much nicer. It'll also fix up the #ifdef stuff at the
end as well.

> > +struct counted_by_flex_struct {
> > +     size_t size;
> > +     int array[] __counted_by(size);
> > +};
> > +
> > +/*
> > + * Allocate the struct out-of-line with extra physical capacity so tha=
t
> > + * __alloc_size() and physical slab bounds do not mask the __counted_b=
y()
> > + * logical bounds check.
> > + */
> > +static noinline struct counted_by_flex_struct *
> > +alloc_counted_by_flex_struct(struct kunit *test, size_t size)
> > +{
> > +     struct counted_by_flex_struct *s;
> > +
> > +     s =3D kzalloc(sizeof(*s) + 2 * size * sizeof(s->array[0]), GFP_KE=
RNEL);
>
> kunit_kzalloc() to automatically free the allocation again.
> struct_size() for the size calculation.
>
Oh cool! done.

> > +     KUNIT_ASSERT_NOT_ERR_OR_NULL(test, s);
> > +
> > +     s->size =3D size;
> > +     return s;
> > +}
> > +
> > +static void fortify_test_counted_by_flex(struct kunit *test)
> > +{
> > +     size_t size =3D 128;
> > +     struct counted_by_flex_struct *s;
> > +     size_t elem_bytes =3D size * sizeof(s->array[0]);
> > +
> > +     s =3D alloc_counted_by_flex_struct(test, size);
> > +
> > +     OPTIMIZER_HIDE_VAR(s);
> > +     OPTIMIZER_HIDE_VAR(elem_bytes);
> > +
> > +     /* __builtin_dynamic_object_size() should return the logical leng=
th. */
> > +     KUNIT_EXPECT_EQ(test, elem_bytes,
> > +                     __builtin_dynamic_object_size(s->array, 0));
> > +     KUNIT_EXPECT_EQ(test, elem_bytes,
> > +                     __builtin_dynamic_object_size(s->array, 1));
> > +
> > +     /* Within-bounds write and read succeed. */
> > +     memset(s->array, 0x42, elem_bytes);
> > +     KUNIT_EXPECT_EQ(test, fortify_write_overflows, 0);
> > +     KUNIT_EXPECT_NOT_NULL(test, memchr(s->array, 0x42, elem_bytes));
> > +     KUNIT_EXPECT_EQ(test, fortify_read_overflows, 0);
> > +
> > +     /* Out-of-bounds write and read past logical size are caught. */
> > +     memset(s->array, 0x42, elem_bytes + 1);
> > +     KUNIT_EXPECT_EQ(test, fortify_write_overflows, 1);
> > +     KUNIT_EXPECT_NULL(test, memchr(s->array, 0x42, elem_bytes + 1));
> > +     KUNIT_EXPECT_EQ(test, fortify_read_overflows, 1);
> > +
> > +     kfree(s);
> > +}
> > +
> > +#ifdef CONFIG_CC_HAS_COUNTED_BY_PTR
> > +struct counted_by_ptr_struct {
> > +     char *ptr __counted_by_ptr(size);
> > +     size_t size;
> > +};
>
> In the other structure the arguments where swapped, intentional?
>
Yes. It's a minor test to make sure that the attribute can refer to a
field that's defined after the pointer.

> > +
> > +/*
> > + * Allocate the struct out-of-line with extra physical capacity so tha=
t
> > + * __alloc_size() and physical slab bounds do not mask the __counted_b=
y_ptr()
> > + * logical bounds check.
> > + */
> > +static noinline struct counted_by_ptr_struct *
> > +alloc_counted_by_ptr_struct(struct kunit *test, size_t size)
> > +{
> > +     struct counted_by_ptr_struct *s;
> > +
> > +     s =3D kmalloc_obj(struct counted_by_ptr_struct);
>
> We should probably also get kunit_kmalloc_obj() at some point.
>
> > +     KUNIT_ASSERT_NOT_ERR_OR_NULL(test, s);
> > +
> > +     s->size =3D size;
> > +     s->ptr =3D kzalloc(2 * size, GFP_KERNEL);
> > +     KUNIT_ASSERT_NOT_ERR_OR_NULL(test, s->ptr);
> > +
> > +     return s;
> > +}
> > +
> > +static void fortify_test_counted_by_ptr(struct kunit *test)
> > +{
> > +     size_t size =3D 128;
> > +     struct counted_by_ptr_struct *s;
> > +
> > +     s =3D alloc_counted_by_ptr_struct(test, size);
> > +
> > +     OPTIMIZER_HIDE_VAR(s);
> > +     OPTIMIZER_HIDE_VAR(size);
> > +
> > +     /* __builtin_dynamic_object_size() should return the logical leng=
th. */
> > +     KUNIT_EXPECT_EQ(test, size, __builtin_dynamic_object_size(s->ptr,=
 0));
> > +     KUNIT_EXPECT_EQ(test, size, __builtin_dynamic_object_size(s->ptr,=
 1));
>
> Is this builtin guaranteed to be available?
> We have a wrapper KUNIT_EXPECT_BDOS() above.
>
I suppose not. I'll use the macros instead.

> > +
> > +     /* Within-bounds write and read succeed. */
> > +     memset(s->ptr, 0x42, size);
> > +     KUNIT_EXPECT_EQ(test, fortify_write_overflows, 0);
> > +     KUNIT_EXPECT_NOT_NULL(test, memchr(s->ptr, 0x42, size));
> > +     KUNIT_EXPECT_EQ(test, fortify_read_overflows, 0);
> > +
> > +     /* Out-of-bounds write and read past logical size are caught. */
> > +     memset(s->ptr, 0x42, size + 1);
> > +     KUNIT_EXPECT_EQ(test, fortify_write_overflows, 1);
> > +     KUNIT_EXPECT_NULL(test, memchr(s->ptr, 0x42, size + 1));
> > +     KUNIT_EXPECT_EQ(test, fortify_read_overflows, 1);
> > +
> > +     kfree(s->ptr);
> > +     kfree(s);
> > +}
> > +#endif /* CONFIG_CC_HAS_COUNTED_BY_PTR */
> > +#endif /* CONFIG_CC_HAS_COUNTED_BY */
> > +
> >  static int fortify_test_init(struct kunit *test)
> >  {
> >       if (!IS_ENABLED(CONFIG_FORTIFY_SOURCE))
> > @@ -1054,6 +1167,12 @@ static struct kunit_case fortify_test_cases[] =
=3D {
> >       KUNIT_CASE(fortify_test_memchr_inv),
> >       KUNIT_CASE(fortify_test_memcmp),
> >       KUNIT_CASE(fortify_test_kmemdup),
> > +#ifdef CONFIG_CC_HAS_COUNTED_BY
> > +     KUNIT_CASE(fortify_test_counted_by_flex),
> > +#ifdef CONFIG_CC_HAS_COUNTED_BY_PTR
>
> The nesting of these conditionals looks unnecessary.
>

-bw

> > +     KUNIT_CASE(fortify_test_counted_by_ptr),
> > +#endif /* CONFIG_CC_HAS_COUNTED_BY_PTR */
> > +#endif /* CONFIG_CC_HAS_COUNTED_BY */
> >       {}
> >  };
> >
> > --
> > 2.56.0.rc1.315.gc6ed9934b7-goog
> >
