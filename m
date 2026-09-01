Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6125B47CC7F
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 11:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788260585; cv=pass; b=GNHdEAJUuIik9G135Of2IY1C/TuhIbVxVaw7ZyLJY7NkkTUWoKZCVlGWPDiLTY03zRta547QTq1A2GNx3eANhWMlnhiV40fahm5rZBJv3KSoc0DOXHdelMzDEvqFtfrMurQjOMo4MMa772HxIsAv4SNT2fsSsEUuxRsjc/9Bwqs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788260585; c=relaxed/simple;
	bh=9pZcWmQuwO7sUinLiZN20It+LnS0MxOvZ2XwTQJXn+k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NXvWsWUy53bFwgFQoUMn7tzCt50ET63xLjfLegKZwFjcXDxuVVEDhLxRSpnHeREVi6mRL8iXVL8BxyCi9k/beTnc/QcFmhc9XHhIXzZ3CuKtIhT9ifMh6bDR7AaR5974/N91uMYHvk9KE5f+S6pxHuJAwnv+wTfs6pYB9Bg++NE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=abHlSeKO; arc=pass smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="abHlSeKO"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2d71a50caa9so9747255ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 04:03:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788260584; cv=none;
        d=google.com; s=arc-20260327;
        b=HyhL/9Q8SZACpNwCSnQuvzaODfkriGmRP+1edaYDIwkq6LTNBVJv/L2EywS0rWKjJ2
         ylgpgyTzB3A4EQnxPoxvvCDyUGQl91pZ6IOJvmj9BFVkZmvwGGgTd+SkiXeK51fvNlTG
         zddWHlxDMaLkXJKta/xy9qmzGFKl7nFw59p3vm30JAQNN+li2QZ60w3/kUDyurFrujGr
         Rd24/N4Z49jas7HYrVVLJxuxlYKyVyIhGioMPZmzDtC7ROz6nw7sfJTfD1JZH1NWCuTq
         i9kVlOeKX6wONq3i6dCQD0I1zrBoQm9aRaQtb04BdA2ouKisefJq7NFkIVPWUejg1muk
         R22Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xni6XiC9n8biLyj8Lypf2TuiINVCW7jBKaUVbdQaKLQ=;
        fh=91A9323z2GiHJCCQPV9dNR8CGg4Bw1+4QnXCuJCTvwE=;
        b=P88J5SGDMX4ztUdFGA/Db2DHVc3Bgzvav+7QigHA06oI5dSVup0PYm/3SVHBYaQ6aO
         UpFYNUog/1KIINHxJ/bYXr5D3Q6374k+g9/26NdRU8LtwlImnEdRFEhVs7CeS2xJWXI+
         p/kKYqimTlVCUE5gW9EAnAczDocnXeb1h/De6Ie2C8tpwhnFvn0LpH0ELXzE9iu6BNFB
         LCOA9iN/JNnMV6Yr24RVOq8/NL7chS2GA8hkhg1fhbC+Pupp5Zu8FUZm4ZLmMR8bXzK3
         fcE0RKv49hpO/DCtjVY87pdDdnKuiuM/CJGYwR053ECOVClU4dfaR8v/6zXoAM8JLxOP
         6tQA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788260584; x=1788865384; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xni6XiC9n8biLyj8Lypf2TuiINVCW7jBKaUVbdQaKLQ=;
        b=abHlSeKO1AlUkgHdCmsPeiYX0dVDAN8SErGde6xEa4kLUKKXRyy/XdyoIsEFHuDjsk
         aVxqvDPizO4FDkDxtF/L3FTb0bMtKyKDO0KPK4Rty+FgRcmBXeDO/UoilxZmqxUKIF7k
         PRl0RbmHm2Ph1r2qw2TVsn4fhUH7vRRPB8zRbclFC5eX7LepmbYVww7u5ZnrVfVn1Tx+
         hzR/j656jmFfbQwq9CMhxiZbKHbtmcjrntWyJplJgmnf8AMmXTSAG9BWem5WhKV+2ahS
         nzOnIIe0Wrfnmc5aQAkQfgSncBjZQ5xIO5gdx++4Zf5qStqQoMSHIaf9W3CR1HFXLwY0
         C+Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788260584; x=1788865384;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xni6XiC9n8biLyj8Lypf2TuiINVCW7jBKaUVbdQaKLQ=;
        b=MleV5uyPdh8dowFS1C1l+HzP0Tc5ms7Rpn/QoAHvgoZFMBRBme9B9Mddmo1sShiQLF
         OQHr/vb8K6K62AGEs8YTI4emFJsaYL5f3kPkefKca/DW4vEd6hrlQdKmVVet6sRhYIKP
         l+DOnSnElxvzDYy9z/Zk//4Z1VTygl59XsWJ/0J3cBnKa+Ep2KJ3ZMxoeApuBhP9lWW0
         rjw0sp5up6YYD2M1uae5TXZbtED9ZfhHwmSWZk0nZdI4qq+9Ds3N5uO6qBxjArn2ffDn
         Wo9VlFBPStiTLiDJNkWgKo6M/EMfDQQjhN1NGT/eiMpYaMsx7feeNPHUvI3+A4Ffhw9D
         Qwjg==
X-Forwarded-Encrypted: i=1; AKwUvByoDaJvgIpZwImPKs1OnMSqM7N09Pi+0+V1RPKBZ10hGu//jM1OQoZoQd9qHk0gC7iaEuGuGPced48r0Pc=@vger.kernel.org
X-Gm-Message-State: AFuF++ly40l1C82S0mbxmYmlUYzjrftQ4pTs95AIZTikTZyuzsCvhEiY
	YiYazxmS775XbbLgS8RDaRqmFA0cD0CrNxUW3HODGxFgQXoZgnjk4/a94N4QpGWjwA+zN94Tcx3
	BaOQ80Izsfge74Aa/OuWIIXiNxn+XfC8=
X-Gm-Gg: AYBFou0RmhdoHxOdc3xBISOd5gtaxc9ZQgkhKgDj/N4p/GqbMYfVZdw6rKdLyn2JYNq
	1WoCk1Uf3yBXfZVs5OSugk6HsSG/S1wrcuBMOYrdP4OfVgcOhVJ75+uJT4xko8n4I1Xj464dbde
	KFRPmN1nnCnshCmz/2dV45V0yBIpJcRsRHHvCyKuOVMCGerkJhKJcscDlwMUht4pQ/LdZ8o9NVA
	4bMzngPN0tjaopYst3hQemw8xiNNvO+yWLfEPyJmC7N1oKjzuwtQwbzThK/Eua+nZRBbzjd00f/
	QpJGqvUPeeVdb/Pb5DNlW7dbStYG1LiZMeFvO2UKVUL9ZssV1hqKx4q/Q1+AsSzu466Sti23mco
	V4w==
X-Received: by 2002:a17:902:f70a:b0:2d9:56d8:75f with SMTP id
 d9443c01a7336-2d956d80878mr69911895ad.9.1788260581562; Tue, 01 Sep 2026
 04:03:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824-lockdep-kunit-v2-0-36a6fec9f72e@gmail.com>
 <20260824-lockdep-kunit-v2-2-36a6fec9f72e@gmail.com> <205be33b-362d-45cb-b3a1-cadaba87b44a@davidgow.net>
In-Reply-To: <205be33b-362d-45cb-b3a1-cadaba87b44a@davidgow.net>
From: Malte Wechter <maltewechter@gmail.com>
Date: Tue, 1 Sep 2026 13:02:47 +0200
X-Gm-Features: AcwNN1W79p2fFOH7uCKy1nc1ZzYo-juVYXphO2_ZqdYVlaVgFvGUZW4sRrBNbXc
Message-ID: <CAPB1BzeDC=V+jKZgX-2gucSZs8vOmZBvUgZLS8kTLvWa0x5S-Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] kunit: add KUnit test to assert kernel state
 before KUnit suites are run
To: David Gow <david@davidgow.net>
Cc: Brendan Higgins <brendan.higgins@linux.dev>, Rae Moar <raemoar63@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Den tirs. 25. aug. 2026 kl. 13.00 skrev David Gow <david@davidgow.net>:
>
> Le 24/08/2026 =C3=A0 21:32, Malte Wechter a =C3=A9crit :
> > add pre-defined KUnit test suite and test case that asserts both
> > `debug_locks` and `TAINT_WARN` prior to running any (user) KUnit tests.
> > This asserts integrity before tests are run.
> >
> > Signed-off-by: Malte Wechter <maltewechter@gmail.com>
> > ---
>
> I'm not quite as convinced by this as I am by the first patch. While
> ensuring the state of the system is good before tests are run is useful,
> this does seem a bit heavy-handed in some respects.
>
> This could probably use a more detailed description, particularly
> describing why such a test is useful, and why it would need to be
> implemented in a special way.
>
> And I do think the implementation here is a bit _too_ special-cased. One
> other possibility would be to prepend this suite using
> kunit_merge_suite_sets(), so we don't need to have any special handling
> of (e.g.) the test count. This could also allow this special suite to be
> filtered out (which has both advantages and disadvantages).
>
> It might also be nice to have this configurable independently from the
> other checks, and maybe at runtime (via a KUnit module / command-line
> parameter), particularly if this can't be filtered on. And, as before,
> this definitely needs to be documented. People need to know how to
> enable it, and where all of these extra results from tests they didn't
> enable came from.
>
> Thoughts?
I get your point, the purpose of this special test suite is to assert
that the kernel is in a "fine" state before any unit tests are run. If
this
check is left out the false positives could occur if the system is in
a bad state before the tests are run.
The reason that the case was handled differently compared to other was
because this assertion _must_ be run before any other tests,
and when kunit_merge_suite_sets() is called from kunit_run_all_tests()
it also filters the test suites, which would not give any guarentee
that this
special suite gets run first.

I do agree that this initial way is maybe a bit coarse, and i will see
if i can find a better fit for this assertion. But i dont want to
leave it out.
>
> Cheers,
> -- David
>
> >   lib/kunit/executor.c |  8 +++++++-
> >   lib/kunit/test.c     | 30 ++++++++++++++++++++++++++++++
> >   2 files changed, 37 insertions(+), 1 deletion(-)
> >
> > diff --git a/lib/kunit/executor.c b/lib/kunit/executor.c
> > index b0f8a41d61d36..0db67fe7f09f9 100644
> > --- a/lib/kunit/executor.c
> > +++ b/lib/kunit/executor.c
> > @@ -290,9 +290,15 @@ void kunit_exec_run_tests(struct kunit_suite_set *=
suite_set, bool builtin)
> >       size_t num_suites =3D suite_set->end - suite_set->start;
> >       bool autorun =3D kunit_autorun();
> >
> > +     #ifdef CONFIG_KUNIT_EXTRA_ASSERTS
>
> Nit: Let's not indent the #ifdefs.
>
> > +     size_t num_suites_plus_extra =3D num_suites+1;
> > +     #else
> > +     size_t num_suites_plus_extra =3D num_suites;
> > +     #endif
> > +
>
> I'm not particularly happy with this way of adding an extra suite.
>
> >       if (autorun && (builtin || num_suites)) {
> >               pr_info("KTAP version 1\n");
> > -             pr_info("1..%zu\n", num_suites);
> > +             pr_info("1..%zu\n", num_suites_plus_extra);
> >       }
> >
> >       __kunit_test_suites_init(suite_set->start, num_suites, autorun);
> > diff --git a/lib/kunit/test.c b/lib/kunit/test.c
> > index 99773e000e1b7..e64c6d1575280 100644
> > --- a/lib/kunit/test.c
> > +++ b/lib/kunit/test.c
> > @@ -835,6 +835,30 @@ bool kunit_enabled(void)
> >       return enable_param;
> >   }
> >
> > +#ifdef CONFIG_KUNIT_EXTRA_ASSERTS
> > +#define DEBUG_LOCKS_OK 1
> > +#define TAINT_WARN_OK 0
>
> Not totally sold on these #defines: I think I'd prefer to just have the
> literal 1/0.
>
> > +
> > +static void pre_kunit_assert(struct kunit *test)
> > +{
> > +     KUNIT_EXPECT_EQ_MSG(test, debug_locks, DEBUG_LOCKS_OK,
> > +             "debug_locks are off before any test ran");
> > +     KUNIT_EXPECT_EQ_MSG(test, test_taint(TAINT_WARN), TAINT_WARN_OK,
> > +             "kernel already TAINT_WARN tainted before any test ran");
> > +}
>
> If we are going to generate a special suite, let's have the taint and
> lockdep checks as separate tests.
>
> This would also make it easier to have them be configurable separately.
>
> > +
> > +static struct kunit_case pre_kunit_assert_cases[] =3D {
> > +     KUNIT_CASE(pre_kunit_assert),
> > +     {}
> > +};
> > +
> > +static struct kunit_suite pre_kunit_assert_clean_state_suite =3D {
> > +     .name =3D "pre_kunit_extra_asserts",
>
> I think we could probably find a better name for this.
> "initial_system_state" or similar might be better?
>
> > +     .test_cases =3D pre_kunit_assert_cases,
> > +};
> > +
> > +#endif /* CONFIG_RUST_KUNIT_EXTRA_ASSERTS */
> > +
> >   int __kunit_test_suites_init(struct kunit_suite * const * const suite=
s, int num_suites,
> >                            bool run_tests)
> >   {
> > @@ -857,6 +881,12 @@ int __kunit_test_suites_init(struct kunit_suite * =
const * const suites, int num_
> >       }
> >       static_branch_inc(&kunit_running);
> >
> > +     #ifdef CONFIG_KUNIT_EXTRA_ASSERTS
> > +     kunit_init_suite(&pre_kunit_assert_clean_state_suite);
> > +     if (run_tests)
> > +             kunit_run_tests(&pre_kunit_assert_clean_state_suite);
> > +     #endif
> > +
> >       for (i =3D 0; i < num_suites; i++) {
> >               kunit_init_suite(suites[i]);
> >               if (run_tests)
> >
>
Best regards,
Malte :)
