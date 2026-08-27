Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 624F53890E8
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 19:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787858871; cv=pass; b=BVtNwLaYpHob9s8E8Qb3OYcS8joJOKDDAZ9Sg4d7LuDDfni/BBgaxb6tS/GluUYzQQ8jqj2Vltrzv+6SrjPbJ6yKts1c4Q7upcoWpoQNGP1cAvJQmP/naBUCh1pDI42+tlGe3MEEoW51u9aEm4o6bdqtw1/jwRO4QvShCRvLshI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787858871; c=relaxed/simple;
	bh=NdUlHkTDXhyZF/jvCiueksVyJDuLzPdAbNjo8+S5HG0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lK2onDfoc2gs/tyIjh4B4OMYTeU8/RsjpjlnUul1981dHllpTOlj1Ak/Fy40yP6rWHD1tSz3VnD2cR0sctrkBxFSqMmc+mRNAJmFAXVWxxo4tszC8a2pEwEc1pTh9tBoHnVcX5xT/12y769vMeymj0xnDdeIQGnEOxk25cxPesQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lR/2uj3t; arc=pass smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lR/2uj3t"
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5bfb3347ce0so102018e0c.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 12:27:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787858868; cv=none;
        d=google.com; s=arc-20260327;
        b=JieTxj/LDW9CWiJgnD64r5Z8ddOOIms99QHazqjuj/AkGSwD9P2PwYALXcNRSDHbOu
         3j2acZ1xsiq/hFTvYpGVNYbvqusKQRuvDUWURZZxmRE110R+LjMoyu8H1c1NniQDP+e5
         gr5C6iFcQ8Hqtu1uUhuQACiv8RmckeXVxgA3XH7v36Uedg6WgVyv1b+hIDAQZy1HK47I
         uGGPR3Yai8VLKn1YxcgItHT6CnPn5xkZb488iLFfmhpf9q7LiPuITJeef+3UiydG5bN5
         tYKHKlFnXZW9Jmy3b/i4dcQFkTIHDcxeLl0qoYP9NeqCOK48FBjiWZU2fgvTkm+hP1Vd
         myYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=b72u2M+8y+CGho4VPPb79RPEx+HN6SXrYRRxoCIGgqE=;
        fh=krEeNIPFfHErH5rUl240kRBrwKiELWqLSKZtOqSn28Y=;
        b=N3GdZc/tTVQHqJvZZv81KCVpN+YBXVKLXcP6e7kDgg9cIz1VJY00pkTDoDHKf8k9y3
         BdnLjktdugCOS4K2lrCwbqWchzkofApGqB1560xbVsDffb6eTRPo08IpF4e5PpjJlFPW
         oM+X98BmuuXaPjptTHQ/W7s4MH0j60lKShTHLJafcVkzw1zQG2syF91/YlQ2/VKRgMaH
         aNqfVqXxcKS6OpbEDoMXy3aqfyvn0bcjmsHDam2eomsZHDIQ2ZfE+DWiL3kkbNw7O+lF
         uxLKH3bsML+vAJLhvkTz4FR/+yQEE7qxVuj312wDYre49ZiUI/re9JLJMbdBaku4RPF4
         G6ew==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787858868; x=1788463668; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=b72u2M+8y+CGho4VPPb79RPEx+HN6SXrYRRxoCIGgqE=;
        b=lR/2uj3tCGVfUiwkWyPtnNiZaMXmuQKONNKWaSy8ZtFK/MzTCGiXbUYgWglzFALxSv
         u4l9y/M5mesNDVSrvioeeAW3fixSjdPaYZGMriFaBTd+uhBlb7KtXnBOCU6hsMK/9phA
         sL0W+vfa0zPGPqYsPyyceqCcCgKVGj+hrc07iByH6Eju6zYY1r0lned6LLVm4u9ptj0C
         ky76l44cfzQvDGKmecbinprsN50mGC98gRt9aJATes+l4X+YCEHDk4NT06TTvqDCzntN
         E/3I4t7ztZQqsdd35uKyHpc0McP8hmxlUfWzlBIGCPoE8HNyoHIJEYxBLgX2s5FT7ryA
         TU8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787858868; x=1788463668;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b72u2M+8y+CGho4VPPb79RPEx+HN6SXrYRRxoCIGgqE=;
        b=LzT4qCu2bt/m2L1alaXTY1rf5MiXjx2bcSBKNWKKC1/8SLHbBHNmMOYVaEL0n5wzW8
         xDib75DIDRzz32qBq3gAtGpqrPz+OVm0RZZL2krkcNH0rNOY4pzURYANc3N3mJKa/tGM
         ckpno5RBjt/CYGNRRlkE2raa0RbmGETFBq6BOjcWhZELJDcFimkIBipZ0v1Sk0eyPEAR
         5ZWHUExN2zTDmw6++330Yyb+FE7pfza3aEwKXU6hEC8EHdY+kpuRO4Hmu7SmZ/dFYCUq
         fcE9a8uUqTVTcevBO++N6WVweATVDSLTxUx1TPYDtxJ4hLjtRlYOOehvn9m0u+UB1A6i
         Hc9w==
X-Forwarded-Encrypted: i=1; AHgh+Roalktuq4xhZhD3NUwLsr7/hmsJG0JLeFu25kfEMazHaYFXE/ZVHb1pXVH5mpvDZJmBZ7qq2IqhHEfGoj8=@vger.kernel.org
X-Gm-Message-State: AFuF++ns8rc7+lvkpfXutIHPmDfk9GolouswJVT9vncQQS8YCSkZA2d8
	jDRtOBLCNi7xNU56XWArsOL2T1aUioWYGXwKl1HAaz4m2VmCEFn6qTXuvb4TTCxO4giFHD7VyHm
	hNYD2khswrVb00lULIKUtn0et/eRMpu3Sww2POW4=
X-Gm-Gg: AR+sD10wmtXAWTaTYCab4HK/bdw7Pueyfa8YBcaOLpV3au8fzQ9kjXNN/oNvVJovEos
	ucxzl0RpNCybjtqebqTxcgiKXnOEN2Yb91ITD9gKqCOW1LqIDNJWU1ouKos/u3ZQg/1GUQjwvit
	D6nTbrbH1FutQqOh0Byo+5vz0hzQEIu1y1p9dYtiM2+daSp4rXveV2qKxfqYDmLSILJ1PstyKnm
	rUf31Alm7BdSn4Yu4WKTEnt00WCX2SVnQV5pJKdWzeEca9c7UnEPux+A5B6eULHHJKhdANexZ4S
	X8rATauqVCEKHQ1hbZTpC0iayv5t+zoLOt5L4vstzsQKod66wYY6kjXUwbm1jrpM+fO74vUGK6H
	Bwhm97yvS5u9lCZbcFcln0n+5QRecuZLNEweVehaw50QeoEfdS0ni
X-Received: by 2002:a05:6102:50a9:b0:783:79ac:9dc3 with SMTP id
 ada2fe7eead31-7859a49efb7mr213153137.10.1787858867328; Thu, 27 Aug 2026
 12:27:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260823125155.1136740-1-morbo@google.com> <20260826220041.4075333-1-morbo@google.com>
 <20260826220041.4075333-2-morbo@google.com> <20260827152612-d0c71c10-cbe5-49f3-9be0-47eb76cd9b48@linutronix.de>
In-Reply-To: <20260827152612-d0c71c10-cbe5-49f3-9be0-47eb76cd9b48@linutronix.de>
From: Bill Wendling <morbo@google.com>
Date: Thu, 27 Aug 2026 12:27:30 -0700
X-Gm-Features: AcwNN1XiOnfT531iWNl0-gc8eQp4_JJ1nwZ_yZ69L-Yg0O1qe56FqF7NVdO22QM
Message-ID: <CAGG=3QWPTL5z8MfAxJLpHb0P-3Ah6K+FzgrVHyRRcvRK7-6dSA@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] userns: Add KUnit test suite for uid_gid_map
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Bradley Morgan <brads@mainlining.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Christian Brauner <brauner@kernel.org>, 
	Aleksa Sarai <cyphar@cyphar.com>, Jan Kara <jack@suse.cz>, Nathan Chancellor <nathan@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Gary Guo <gary@garyguo.net>, Alice Ryhl <aliceryhl@google.com>, 
	Douglas Anderson <dianders@chromium.org>, Anand Moon <linux.amoon@gmail.com>, 
	Oleg Nesterov <oleg@redhat.com>, codemender-patching+linux@google.com, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 27, 2026 at 6:37=E2=80=AFAM Thomas Wei=C3=9Fschuh
<thomas.weissschuh@linutronix.de> wrote:
>
> On Wed, Aug 26, 2026 at 10:00:35PM +0000, Bill Wendling wrote:
> > Add a KUnit test suite to verify the insertion and sorting of mappings
> > in struct uid_gid_map. This test suite validates both base extent
> > insertion (<=3D 5 mappings) and extended extent insertion (> 5 mappings=
,
> > which triggers the allocation of the forward and reverse pointers).
> >
> > This is especially useful for verifying that the __counted_by_ptr
> > attribute added to 'forward' and 'reverse' pointers works correctly
> > without causing any runtime bounds-checking panics or traps.
> >
> > Assisted-by: Gemini:3.1-pro-preview
> > Signed-off-by: Bill Wendling <morbo@google.com>
> > ---
> > v2 - Remove Gerrit tag.
> > v3 - s/KUNIT_EXPECT_NOT_ERR_OR_NULL/KUNIT_ASSERT_NOT_ERR_OR_NULL/
> >    - Fixed Kconfig tests.
> > v4 - Actually test on unsorted data. Corrected the "Assisted-by" tag.
> > ---
> > Cc: Bradley Morgan <brads@mainlining.org>
> > Cc: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>
> > Cc: Kees Cook <kees@kernel.org>
> > Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
> > Cc: Christian Brauner <brauner@kernel.org>
> > Cc: Aleksa Sarai <cyphar@cyphar.com>
> > Cc: Jan Kara <jack@suse.cz>
> > Cc: Nathan Chancellor <nathan@kernel.org>
> > Cc: Miguel Ojeda <ojeda@kernel.org>
> > Cc: Thomas Gleixner <tglx@kernel.org>
> > Cc: Nicolas Schier <nsc@kernel.org>
> > Cc: Gary Guo <gary@garyguo.net>
> > Cc: "Thomas Wei=C3=9Fschuh" <thomas.weissschuh@linutronix.de>
> > Cc: Alice Ryhl <aliceryhl@google.com>
> > Cc: Douglas Anderson <dianders@chromium.org>
> > Cc: Anand Moon <linux.amoon@gmail.com>
> > Cc: Oleg Nesterov <oleg@redhat.com>
> > Cc: codemender-patching+linux@google.com
> > Cc: linux-kernel@vger.kernel.org
> > Cc: linux-hardening@vger.kernel.org
> > ---
> >  init/Kconfig                  | 10 ++++
> >  kernel/.kunitconfig           |  3 ++
> >  kernel/user_namespace.c       |  4 ++
> >  kernel/user_namespace_kunit.c | 92 +++++++++++++++++++++++++++++++++++
> >  4 files changed, 109 insertions(+)
> >  create mode 100644 kernel/.kunitconfig
> >  create mode 100644 kernel/user_namespace_kunit.c
> >
> > diff --git a/init/Kconfig b/init/Kconfig
> > index f63bf5e05e79..d460344539a5 100644
> > --- a/init/Kconfig
> > +++ b/init/Kconfig
> > @@ -1457,6 +1457,16 @@ config USER_NS
> >
> >         If unsure, say N.
> >
> > +config USER_NAMESPACE_KUNIT_TEST
> > +     bool "Test user namespace map insertion" if !KUNIT_ALL_TESTS
> > +     depends on KUNIT=3Dy
>
> Urgh.
>
?? What's wrong? It's identical to the conditional for EXEC_KUNIT_TEST:

config EXEC_KUNIT_TEST
     bool "Build execve tests" if !KUNIT_ALL_TESTS
     depends on KUNIT=3Dy
     default KUNIT_ALL_TESTS
     help
          This builds the exec KUnit tests, which tests boundary conditions
          of various aspects of the exec internals.

> > +     default KUNIT_ALL_TESTS
> > +     help
> > +       This builds the KUnit test for user namespace uid/gid map inser=
tion.
> > +       It validates map insertion, limits, dynamic allocation of the
> > +       extended extents array, and mapping sorting functions.
> > +       If unsure, say N.
> > +
> >  config PID_NS
> >       bool "PID Namespaces"
> >       default y
> > diff --git a/kernel/.kunitconfig b/kernel/.kunitconfig
> > new file mode 100644
> > index 000000000000..7314dce05dc2
> > --- /dev/null
> > +++ b/kernel/.kunitconfig
> > @@ -0,0 +1,3 @@
> > +CONFIG_KUNIT=3Dy
> > +CONFIG_USER_NS=3Dy
> > +CONFIG_USER_NAMESPACE_KUNIT_TEST=3Dy
> > diff --git a/kernel/user_namespace.c b/kernel/user_namespace.c
> > index 786dbf0506ca..0e7373085af9 100644
> > --- a/kernel/user_namespace.c
> > +++ b/kernel/user_namespace.c
> > @@ -1417,3 +1417,7 @@ static __init int user_namespaces_init(void)
> >       return 0;
> >  }
> >  subsys_initcall(user_namespaces_init);
> > +
> > +#if IS_ENABLED(CONFIG_USER_NAMESPACE_KUNIT_TEST)
> > +#include "user_namespace_kunit.c"
> > +#endif
> > diff --git a/kernel/user_namespace_kunit.c b/kernel/user_namespace_kuni=
t.c
> > new file mode 100644
> > index 000000000000..88467361efdf
> > --- /dev/null
> > +++ b/kernel/user_namespace_kunit.c
> > @@ -0,0 +1,92 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * KUnit test for user namespace map insertion and sorting.
> > + */
> > +
> > +#include <kunit/test.h>
> > +#include <linux/user_namespace.h>
> > +
> > +static void test_user_ns_map_insert_base(struct kunit *test)
> > +{
> > +     struct uid_gid_map map;
> > +     struct uid_gid_extent extent;
> > +     int i, ret;
> > +
> > +     memset(&map, 0, sizeof(map));
> > +
> > +     /* Insert up to UID_GID_MAP_MAX_BASE_EXTENTS (5) elements */
> > +     for (i =3D 0; i < UID_GID_MAP_MAX_BASE_EXTENTS; i++) {
> > +             extent.first =3D i * 10;
> > +             extent.lower_first =3D i * 100;
> > +             extent.count =3D 5;
> > +
> > +             ret =3D insert_extent(&map, &extent);
> > +             KUNIT_ASSERT_EQ(test, ret, 0);
> > +             KUNIT_EXPECT_EQ(test, map.nr_extents, i + 1);
> > +             KUNIT_EXPECT_EQ(test, map.extent[i].first, i * 10);
> > +             KUNIT_EXPECT_EQ(test, map.extent[i].lower_first, i * 100)=
;
> > +             KUNIT_EXPECT_EQ(test, map.extent[i].count, 5);
> > +     }
> > +}
>
> The extended test below already tests everything the 'base' one does.
> Do we need both?
>
The one below tests the sorting algorithm.

> > +
> > +static void test_user_ns_map_insert_extended(struct kunit *test)
> > +{
> > +     struct uid_gid_map map;
> > +     struct uid_gid_extent extent;
> > +     int i, ret;
> > +
> > +     memset(&map, 0, sizeof(map));
> > +
> > +     /* Insert more than UID_GID_MAP_MAX_BASE_EXTENTS (e.g., 10) eleme=
nts */
>
> When UID_GID_MAP_MAX_BASE_EXTENTS is ever increased, this might not be tr=
ue anymore.
> Add an assertion or make the iteration count dynamic.
>
Sure, I can make it something like "UID_GID_MAP_MAX_BASE_EXTENTS + 42"
or something. Let me know about the "Urgh" comment above first.

> > +     for (i =3D 0; i < 10; i++) {
> > +             int value =3D 9 - i;
> > +
> > +             extent.first =3D value * 10;
> > +             extent.lower_first =3D value * 100;
> > +             extent.count =3D 5;
> > +
> > +             ret =3D insert_extent(&map, &extent);
> > +             KUNIT_ASSERT_EQ(test, ret, 0);
> > +             KUNIT_EXPECT_EQ(test, map.nr_extents, i + 1);
> > +
> > +             if (i < UID_GID_MAP_MAX_BASE_EXTENTS) {
> > +                     KUNIT_EXPECT_EQ(test, map.extent[i].first, value =
* 10);
> > +             } else {
> > +                     KUNIT_EXPECT_EQ(test, map.forward[i].first, value=
 * 10);
> > +                     KUNIT_EXPECT_EQ(test, map.forward[i].lower_first,=
 value  * 100);
> > +                     KUNIT_EXPECT_EQ(test, map.forward[i].count, 5);
> > +             }
> > +     }
> > +
> > +     /* Now sort the map to set up reverse mapping */
> > +     ret =3D sort_idmaps(&map);
> > +     KUNIT_EXPECT_EQ(test, ret, 0);
> > +     KUNIT_ASSERT_NOT_ERR_OR_NULL(test, map.reverse);
> > +
> > +     /* Verify sorting is correct */
> > +     for (i =3D 0; i < map.nr_extents; i++) {
> > +             KUNIT_EXPECT_EQ(test, map.forward[i].first, i * 10);
> > +             KUNIT_EXPECT_EQ(test, map.forward[i].lower_first, i * 100=
);
> > +             KUNIT_EXPECT_EQ(test, map.forward[i].count, 5);
> > +
> > +             KUNIT_EXPECT_EQ(test, map.reverse[i].first, i * 10);
> > +             KUNIT_EXPECT_EQ(test, map.reverse[i].lower_first, i * 100=
);
> > +             KUNIT_EXPECT_EQ(test, map.reverse[i].count, 5);
> > +     }
>
> Isn't this the same as the original order?
>
No. The original order uses "9 - i" for the base value, so it's not in
sorted order (though it's not exactly random either).

-bw

> > +
> > +     kfree(map.forward);
> > +     kfree(map.reverse);
> > +}
>
> (...)
