Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24B7C371D11
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 19:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789068685; cv=pass; b=VuDGdTAnzQBolYDCkjzH5jf2lOLKE0qQi1nMMpPWZFgYw4Qa0HtbOVxVIg0yIHLe2CIg6fxpQJqSXdMBZXiY9W4Mov6GDkPhnGqiIgKi8NFmARHbDW32PJb0ZfrSSrpAKqU3MKHnn2AXuq21ysDE+KcJBORaFTZXIRIkrHV06k4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789068685; c=relaxed/simple;
	bh=KTq9X+5RKd6MevfODoxvkTeUdtyi6rv9KjZTSYh2TKE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xz7yM/j6c0crCUJIVKwGa3Jy5E1DUATcM6K0lDoMRIbpGoohCkb765BMprs8bUMZRimjR2cUpvQlxnOkgPcTEvy/FBJkhrw2X6fuCzrsz0/feKRccEtrNyLUKK2nceLs/dexcusKvYNGbw2balKFaNItlu/vLXo1eD6J+NWjuKM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bTyEgftU; arc=pass smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bTyEgftU"
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5c663437fe5so170543e0c.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 12:31:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789068677; cv=none;
        d=google.com; s=arc-20260327;
        b=HFQRX2BTiO7FU8N9xCatTcmRywbcBbUl4jRRSQ21T1EN5QTywRPw75B0VrrVJmtGze
         zE1GDYcsECQYvc8LXKYu07iPzAQn34m7h/4kX4jf9r/nmHZfdW5clvIDO5+jY1SCUlpp
         tzfscBQzwrgMHv3hGU//TEgxLVeZ2VLjfNpGzl/+2MnyQb9pGgmjJTmUtaAPkibrUTwc
         c25fQ/qHuNG/4De59PCdzWrZ/gavFkPYD9/v2xSvXuwBoja3mzHoDXlTMRkcDdQrsho7
         4s0I+fKAH9EvuPBQ2xZjbijHA65qDrK1gtH1G9VIZXOttTftvn8bkWAl5o/n9wFhowrH
         nDyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0V/f5lIKQxwY8UDJZpxZzCGcHb+M8Wk6F3+yBI8V0a4=;
        fh=JcwWubNP/++qRK43a2A2s6h4AB9zuMtiEX5nKg7Th1Y=;
        b=H9bmfIvNqrl3ln0ElYGqz82RbFct9b/gvIag0KWmtgCGkEU9wuTExlajLqlI8tJLRo
         hiaDcC+9MH0zxpqgaUoB1ecPWo+ZZgat25yNKmETm7Fbiqo/v1YzKJVJcJhBZY+X4oeV
         ttUF2S1R89n3EfNeIDNAKgBkiiKhh/OCLSVEsFI5u7mVVy2bsAuKJQ37UvzRAiH7Lah9
         FLOC960SsIRmD0o5Ov3Ai1aINpjw6j6YqN5L34rx8Vn1iko89+22+G6CjXOunsbB39Km
         N6rOJeCCzDM1esSZCfYRuCbJWYkoaziPOBUxP/Z1JM65EWDXALiL/+d6RTDhr348UJN+
         by3Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789068677; x=1789673477; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0V/f5lIKQxwY8UDJZpxZzCGcHb+M8Wk6F3+yBI8V0a4=;
        b=bTyEgftUWKIopOFjcUBu/2KhyIikGf6Tu1DDL0wwWwCBeQuNHF/DSagivn5/pmOxO7
         7U3doG7W3kvzWMO81f7YlZLMiqtOrQn+32PUDrNIvj1XSYRFFssQku8mVpwT4BpPosUh
         fthi9hb+NCnSppkJTfPLCdYDX4XPhZNirMuLoetNJ94VKcUTmcWKEKom5ZrXrnpZWz05
         o7fTBpSEzeel1qee7ZQtEsF70qdoJyYaVODAa9dyKgK/T9kZYZkONNztop09xD3tmWE3
         Wzau4bN9ObZjURUtR5SxNOFmLx8E8KvX4d3FsBh7p2CB6idxd89ebwg7gc+nBHEXwteD
         oVtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789068677; x=1789673477;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0V/f5lIKQxwY8UDJZpxZzCGcHb+M8Wk6F3+yBI8V0a4=;
        b=KkTNgrNBs2t6oOVDNoyfV8gjMAGcreloI3oBb2aAYzB5skgGOA8uSZOBd85Yc2reAi
         yu09/tsPcBIq5Jz0LkwUWvOWXdGDyK6W8ClHbTaIenC4Ort7fRqWu81aJc8RLzyHQ4tX
         a6xz9K8H8pQPANl6+oXyBCnfF5cIRxXh6mpe2EFuILNPtQwC8uzRXcBsDU8RHd7qNKXd
         e6TRfhukm+c5kqN5p3lD4f6ZoO2LYPNsvolbZfA7oMR9yXXKhoprDT12y34JOM1EBJ7v
         SPqVcafQ99eSCX3nrLMurlWEoGfBJHKe8uBSkx3doZH12DrzlyM5BUQICBq2GUtfrEMV
         LxJw==
X-Gm-Message-State: AFuF++lphuZ392ZV7EQmjJwLtdFGTiij6tTxe4MjRbD24DD4v28yLkdm
	P3eCKqEEuX21r1HkSo/hcZ4hkgsnhdbkb/CLUk1FnFlFZMgxxLjtW5ij0V6H8x7+g8QQR+G7I5F
	GrCx6YGhSxbo+gQ44I3M+Rh5F4tvN6nshxqqDT2I=
X-Gm-Gg: AYBFou0zSPlK1aMu1Kor5tI+jXSx0wQh5p49KQIeEIagJ5B1QzDURghYOVTBbSlXr0j
	D6Ivlrs9vQemFrtCq0jz9cygkNJIVhBjz/yMRPm+DxZQesCTw7/VEFooOnCgTGNkgGcvBBEYRL7
	b1bYz92spA5NlYUje8Rd8J27ztWq/ajQ2c9DVZ2J3U/7Sm9v+Z2mxqZqumWNNuzz6FcYXc7qyV6
	XLHtrh7/FALwSn4Nm0T7anqojT2lT3qLhf+O1qD/waEl/q5jcSMAgTjLVYZigqymLPlZqsiyczD
	mPZMjiGLgg93RQMQLmeZOOa8PlKMLTYjNAIOIjSnn9/c1i6kscdQZHoCw2j3iTGBEMiXH0PYxd/
	u9fcnU9rYUpI5vSaUbsJj24a62AoH66V5tq51wTOaakDYDPjO3gRd
X-Received: by 2002:a05:6122:3417:b0:5c8:3122:ac47 with SMTP id
 71dfb90a1353d-5c8462b2288mr1910205e0c.5.1789068676639; Thu, 10 Sep 2026
 12:31:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260823123549.1120133-1-morbo@google.com> <20260823123549.1120133-3-morbo@google.com>
 <aosNst7K9zaClFEH@google.com>
In-Reply-To: <aosNst7K9zaClFEH@google.com>
From: Bill Wendling <morbo@google.com>
Date: Thu, 10 Sep 2026 12:30:59 -0700
X-Gm-Features: AcwNN1UAFW8O5KEENv3dVtojFZT_CRKAdk5AOtP2XF5VqSdFHqLVOslXBPVUWeo
Message-ID: <CAGG=3QX5PQSioCK+5kM5wZvtYoa7iKrRFtPuwvX2d06C2kw-iQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] lib/tests: Add KUnit test for struct stack_trace
 __counted_by_ptr attribute
To: Kuan-Wei Chiu <visitorckw@gmail.com>
Cc: linux-kernel@vger.kernel.org, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Rae Moar <raemoar63@gmail.com>, Ryota Sakamoto <sakamo.ryota@gmail.com>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Dmitry Antipov <dmantipov@yandex.ru>, 
	Petr Mladek <pmladek@suse.com>, Kir Chou <note351@hotmail.com>, 
	codemender-patching+linux@google.com, linux-hardening@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Kuan-Wei,

On Sun, Aug 23, 2026 at 8:11=E2=80=AFAM Kuan-Wei Chiu <visitorckw@gmail.com=
> wrote:
>
> Hi Bill,
>
> On Sun, Aug 23, 2026 at 12:35:33PM +0000, Bill Wendling wrote:
> > Add a custom KUnit test suite 'stacktrace_counted_by' to verify that th=
e
> > __counted_by_ptr annotation on the 'entries' field of 'struct stack_tra=
ce'
> > behaves correctly.
> >
> > The test verifies that 'max_entries' correctly limits and validates acc=
ess
> > to 'entries' when CONFIG_ARCH_STACKWALK is not defined. If it is define=
d,
> > the test is cleanly skipped at runtime to prevent compile-time or runti=
me
> > failures due to 'struct stack_trace' being undefined on modern
> > architectures.
> >
> > Assisted-by: Gemini Next
> > Signed-off-by: Bill Wendling <morbo@google.com>
> > ---
> > Cc: Kees Cook <kees@kernel.org>
> > Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
> > Cc: Andrew Morton <akpm@linux-foundation.org>
> > Cc: Brendan Higgins <brendan.higgins@linux.dev>
> > Cc: David Gow <david@davidgow.net>
> > Cc: Rae Moar <raemoar63@gmail.com>
> > Cc: Ryota Sakamoto <sakamo.ryota@gmail.com>
> > Cc: Kuan-Wei Chiu <visitorckw@gmail.com>
> > Cc: Pasha Tatashin <pasha.tatashin@soleen.com>
> > Cc: Dmitry Antipov <dmantipov@yandex.ru>
> > Cc: Petr Mladek <pmladek@suse.com>
> > Cc: Kir Chou <note351@hotmail.com>
> > Cc: codemender-patching+linux@google.com
> > Cc: linux-kernel@vger.kernel.org
> > Cc: linux-hardening@vger.kernel.org
> > Cc: linux-kselftest@vger.kernel.org
> > Cc: kunit-dev@googlegroups.com
> > Cc: linux-hardening@vger.kernel.org
> > ---
> >  lib/Kconfig.debug            | 10 +++++++
> >  lib/kunit/.kunitconfig       |  1 +
> >  lib/tests/Makefile           |  1 +
> >  lib/tests/stacktrace_kunit.c | 51 ++++++++++++++++++++++++++++++++++++
> >  4 files changed, 63 insertions(+)
> >  create mode 100644 lib/tests/stacktrace_kunit.c
> >
> > diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> > index e97bdf3a42a8..51a6ac1a2461 100644
> > --- a/lib/Kconfig.debug
> > +++ b/lib/Kconfig.debug
> > @@ -2716,6 +2716,16 @@ config BITOPS_KUNIT
> >
> >         If unsure, say N.
> >
> > +config STACKTRACE_KUNIT_TEST
> > +     tristate "KUnit test for stacktrace counted_by attribute" if !KUN=
IT_ALL_TESTS
> > +     depends on KUNIT
> > +     default KUNIT_ALL_TESTS
> > +     help
> > +       This option enables the KUnit test for verifying the __counted_=
by_ptr
> > +       attribute on struct stack_trace.
> > +
> > +       If unsure, say N.
> > +
> >  config BITFIELD_KUNIT
> >       tristate "KUnit test bitfield functions at runtime" if !KUNIT_ALL=
_TESTS
> >       depends on KUNIT
> > diff --git a/lib/kunit/.kunitconfig b/lib/kunit/.kunitconfig
> > index 9235b7d42d38..b3761b41459e 100644
> > --- a/lib/kunit/.kunitconfig
> > +++ b/lib/kunit/.kunitconfig
> > @@ -1,3 +1,4 @@
> >  CONFIG_KUNIT=3Dy
> >  CONFIG_KUNIT_TEST=3Dy
> >  CONFIG_KUNIT_EXAMPLE_TEST=3Dy
> > +CONFIG_STACKTRACE_KUNIT_TEST=3Dy
> > diff --git a/lib/tests/Makefile b/lib/tests/Makefile
> > index 4ead57602eac..40875e729fc8 100644
> > --- a/lib/tests/Makefile
> > +++ b/lib/tests/Makefile
> > @@ -6,6 +6,7 @@
> >  CFLAGS_bitfield_kunit.o :=3D $(DISABLE_STRUCTLEAK_PLUGIN)
> >  obj-$(CONFIG_BASE64_KUNIT) +=3D base64_kunit.o
> >  obj-$(CONFIG_BITOPS_KUNIT) +=3D bitops_kunit.o
> > +obj-$(CONFIG_STACKTRACE_KUNIT_TEST) +=3D stacktrace_kunit.o
> >  obj-$(CONFIG_BITFIELD_KUNIT) +=3D bitfield_kunit.o
> >  obj-$(CONFIG_BITS_TEST) +=3D test_bits.o
> >  obj-$(CONFIG_SHDI3_KUNIT_TEST) +=3D shdi3_kunit.o
> > diff --git a/lib/tests/stacktrace_kunit.c b/lib/tests/stacktrace_kunit.=
c
> > new file mode 100644
> > index 000000000000..7ec48edf84fe
> > --- /dev/null
> > +++ b/lib/tests/stacktrace_kunit.c
> > @@ -0,0 +1,51 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * KUnit test for struct stack_trace counted_by attribute.
> > + */
> > +
> > +#include <kunit/test.h>
> > +#include <linux/stacktrace.h>
> > +
> > +#ifndef CONFIG_ARCH_STACKWALK
> > +static void test_stack_trace_counted_by(struct kunit *test)
> > +{
> > +     unsigned long entries_buf[4];
> > +     struct stack_trace trace =3D {
> > +             .entries =3D entries_buf,
> > +             .max_entries =3D 4,
> > +     };
> > +
> > +     KUNIT_EXPECT_EQ(test, trace.max_entries, 4U);
> > +     KUNIT_EXPECT_PTR_EQ(test, trace.entries, (unsigned long *)entries=
_buf);
> > +
> > +     /* Write to the allocated elements to verify access */
> > +     trace.entries[0] =3D 0xdeadbeef;
> > +     trace.entries[1] =3D 0xbeefcafe;
> > +     trace.entries[2] =3D 0xcafebabe;
> > +     trace.entries[3] =3D 0x12345678;
>
> This only does in bounds array writes.
> To test __counted_by_ptr, I thought we were supposed to intentionally
> trigger an out of bounds access and see if it actually catches the
> error?
>
True. This is testing only that the existing behavior doesn't fail
with the new attribute. It looks like you're not the only one to
comment on this, though...

-bw

> > +
> > +     KUNIT_EXPECT_EQ(test, trace.entries[0], 0xdeadbeefUL);
> > +     KUNIT_EXPECT_EQ(test, trace.entries[1], 0xbeefcafeUL);
> > +     KUNIT_EXPECT_EQ(test, trace.entries[2], 0xcafebabeUL);
> > +     KUNIT_EXPECT_EQ(test, trace.entries[3], 0x12345678UL);
> > +}
> > +#else
> > +static void test_stack_trace_counted_by(struct kunit *test)
> > +{
> > +     kunit_skip(test, "CONFIG_ARCH_STACKWALK is enabled, struct stack_=
trace is not defined");
> > +}
> > +#endif
> > +
> > +static struct kunit_case stacktrace_test_cases[] =3D {
> > +     KUNIT_CASE(test_stack_trace_counted_by),
> > +     {}
> > +};
> > +
> > +static struct kunit_suite stacktrace_test_suite =3D {
> > +     .name =3D "stacktrace_counted_by",
> > +     .test_cases =3D stacktrace_test_cases,
> > +};
> > +
> > +kunit_test_suite(stacktrace_test_suite);
> > +
> > +MODULE_LICENSE("GPL");
> > --
> > 2.55.0.860.g4b6b3295ed-goog
> >
