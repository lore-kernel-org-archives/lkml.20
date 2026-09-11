Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84EECB640
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 00:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789085246; cv=pass; b=T8h5OpkAS/aEFIFxA0kUYYBhuXW/8oJ+1CA8iYY8hj+H2YlxzRNhAC2o46ltL4d41vwcEI0EyzDl7qhYm0skTw+9HpbEJ5l46Zcn9vjw5OtI9oY65HvdI7gPZN6B+/aOOCfWTu2s/qD57Sp2erYgTUxrXyigwFI9xg+/CDmWE5w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789085246; c=relaxed/simple;
	bh=uGmLXEnL+IC40GIG6X/bj6rXYRWJsMtL1CLjCIyygu0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GqCfDeoLXO47r11c5U3kHxnN0V3cVoyAtm+PDAXxmtpzrNxSaPDn+uldVuz9hCjYweEVR84inTDKU0R5WR5zEwQ4jyf830nZ/ejUnp3ePMeLqeqox4z2hYLp5f+OPww3KBOGdMdHOgubKoA58b1jZsfaSX164tIiPuQQ/7ZlrYE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mjmA/4/0; arc=pass smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mjmA/4/0"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c250f28f1cdso70225266b.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 17:07:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789085243; cv=none;
        d=google.com; s=arc-20260327;
        b=oU9qRApzK2uWWswyvqwvK80ZDoMsPx5jV8BWmzWtjcdAuN27G6AoyC6kUJk7E7X9u2
         9IbJLSKd3hYMX0chFKDlaRx6AkDIo+CkbOxbt1PYFB2PvxHIpEFTDTPcQcs44J+sO30L
         pjj4U3XQQ2pGHlT9f0PbdWLWx3+53Bee4aNIsYhc37zJI5bGPXIP8CxvU4kYIT6bjsO9
         CcODnVqN5BXRiixmj9qs+HIqwiv0AkYiUbzwJggG+t9MVPgxRxqX0Cx2RmQK5IWVmUsj
         jaPJRBR0KAG0AuZLPJr6/cP/IRvwKCgwJgoC3scgk0pqDixb+H4h3CsovK0pdqP3tvtX
         mpdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IwwWcBN+tgHNQvnGqgqfng+hX1+EnAWmj1LkksOOo0g=;
        fh=0etpeRmEXjHNDlLCa7yfRs8TMZfRBbbu7FNIbREfvlE=;
        b=dDt4d0ClB3C+eDD0jXHAYJQW83gW2mafHSWpowTrWFXdl7Mt9k7S+VFFlQFlJZ8XD8
         UAdXQPMOhhYzDUuX1gmxksgmfot80Ie2VucrWVK+P7GSsVmaG8YWZINeo+++o0u826Nf
         XSNyrmR+jDDPoVdz/WHkQYaOafu/h4gH6uli3gDQU25W3wvAAxRRvYNwmrtHPFUGCXny
         fKdz40vknV5urNquufHebz8UlvFLBtExEOxZgZ9sODj9JI/XRV/T7sl6vtuwh7OAj9Bu
         fPFJNeZTQPWeJInYM+4U77yHbo9Ds9ay8jwtYQyoq6s3sEsrYiuG7WWnp9sleI8HC5i0
         Ackw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789085243; x=1789690043; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IwwWcBN+tgHNQvnGqgqfng+hX1+EnAWmj1LkksOOo0g=;
        b=mjmA/4/04KERmg+8nWZII241NK/mb4GZLJdFIwG8RWQQn7AL2u5PPqoInHmKxPiEOK
         wN6jZ9FrlZzx/LXN58s3xXsHtPj7VvTydJbMkgwPPR50cTo1orReS2XAiSw67if9Hn3h
         zKS5lkJfJiKMegROYEqAb7MvFJGDJL7Gkze8r7xL7XMXwUgjwxcyiB8Rh6tcjbqHsr/Z
         KjpICAnL/qq7h04+j/eARr2dISwFf7hTAALqIrCK4CYR0ZKxbBok1Xyrb6P9Un8SBV0e
         7p4ztkX1jael1hadSfg8JskW3Q3kq82uLtxv7u7vVQMpJkoLuGEgYZ9cD2qIeyfqnnfB
         Ex6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789085243; x=1789690043;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IwwWcBN+tgHNQvnGqgqfng+hX1+EnAWmj1LkksOOo0g=;
        b=b04P2fO2UzKz6ivjD3cETEjyUmids+1XXfWpYaeKXJYdE1Y6HOvdjL/hfH1O8qiNtJ
         n2OonQz9Ki0uI3gf4ra9XWSeHfhJ7yM9+oED2nnjr9s6yogTT/hDEQ/n9VVzmoEdFKxz
         YlwCe4BuTFRUT3mOfv2jlKxqIwa7iDMFqTH69Gg6WTX6y7z4yKQTldF+hkeVB5wp4nV4
         mDmEnEvHB1Vl/+asMh0G3ql1bKmz90FsJgovyP/aXXEKx+6xYXncVJ/X6lZjUsHwVmOa
         Aq5jj925N1/UYR+JJ6Cp87jcUNJRiVKxRlM/k5cCaHRyL7JrgxXmjyKvvpqAs+O2O9Tc
         eRrw==
X-Forwarded-Encrypted: i=1; AKwUvByTDs4x9y6ydwoRkzmsY4QQ/4MKBHM0lMnDN4BbcEu6iht0wDGj9oc/wRYIUF4Cs2Iv7ApjFQVsqH2qFQA=@vger.kernel.org
X-Gm-Message-State: AFuF++nnLm3PtdqUeCioq2Rn5C7i5oeRtB2XUOrEfeWXqpva7Ol6E1Y9
	5TIu1y0OSt3catcniHsJHyKBQpPq1aApTlo/D5ar7BHLFk7ZNZg1qr3TkBOSup404zoDpAwOgZh
	Oj+lNciYeAzxM6iDxokXGEP0FmNWUXw/Cu6kKT23fge8vaXqOmqORLKQdtoc=
X-Gm-Gg: AYBFou05od5G1TQ/3nV/s8ly8SOT7JcnztiqqFNB3kGXob2Z4yx2wGdGCL43ZFbgrWi
	Z4oPwHghal/ncyazelbjSPIg6dJdSewwIZiWpvmCqDt15Qi0yEPWfFYMoVAewS7sxAVa9MjDGmF
	vAZ5V34267Oc6Fgxig8NwVYj4bn5mIoEzpzAUOUJ5w91mqOeRPiL13TR58d3LvRO0IK1ghjJ50Q
	x/+PdSZA6piwyMKBGwdrp9mFM7sA2uavwkLJNhgS4AUldgYGgc/5OLkbDVudoBc3TYA71D5kvoq
	jGEn84se9DpOuBkY2FDnAFTgS2fkxWOyrFC0lau3knByDwMQNjv98ED5ZdmrS30pxRLSEVwoOAJ
	2VaGCEa29TRa/RMnAVp9jgv1VXwCJjfpHQlT4/CF/MRYcP+mjnwil/60q27vxtwKwPLxJA3CD7o
	z0h7n+K7mxuuiFO1QIsK84GCE=
X-Received: by 2002:a17:907:3f1c:b0:c26:19de:9acd with SMTP id
 a640c23a62f3a-c29666d6e67mr44961766b.37.1789085242261; Thu, 10 Sep 2026
 17:07:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260910162411.d3bd211927c10e049c6652b8@linux-foundation.org> <20260911000300.1052582-1-jthoughton@google.com>
In-Reply-To: <20260911000300.1052582-1-jthoughton@google.com>
From: James Houghton <jthoughton@google.com>
Date: Thu, 10 Sep 2026 17:06:45 -0700
X-Gm-Features: AcwNN1X0dJedX_Oh1493PKimMiAb_MFffFLVsT6i1Q2bbVinjsu48pu3aGeEvKE
Message-ID: <CADrL8HXtaLLheoY=DchtwxOq=nWRzVA=-1r9zi8=aebi3j1rtw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] mm/khugepaged: Never install PMDs in
 uffd-minor-registered VMAs
To: akpm@linux-foundation.org
Cc: baohua@kernel.org, baolin.wang@linux.alibaba.com, david@kernel.org, 
	dev.jain@arm.com, hughd@google.com, kas@kernel.org, lance.yang@linux.dev, 
	liam@infradead.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	ljs@kernel.org, nico.pache@linux.dev, ryan.roberts@arm.com, 
	shy828301@gmail.com, usama.arif@linux.dev, ziy@nvidia.com, zokeefe@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 10, 2026 at 5:03=E2=80=AFPM James Houghton <jthoughton@google.c=
om> wrote:
>
> On Thu, Sep 10, 2026 at 4:24=E2=80=AFPM Andrew Morton <akpm@linux-foundat=
ion.org> wrote:
> > Sashiko had a stupid niggle about the selftest change and made quite
> > disturbing claims about the existing try_collapse_pte_mapped_thp() code=
:
> >
> >         https://sashiko.dev/#/patchset/20260910023411.514987-1-jthought=
on@google.com
>
> Thanks, it looks like the note it wrote about the selftest is genuine; it=
 is
> okay for MADV_COLLAPSE to fail. So I shouldn't have changed uffd_test_ski=
p() to
> uffd_test_fail().
>
> Andrew, if you can, please add this diff as part of the patch to queue. (=
It's
> a partial revert.) Or I could send the a new version of the patch as a re=
ply
> to patch #2 email. Or a whole v4, whatever's easiest.
>
> diff --git a/tools/testing/selftests/mm/uffd-unit-tests.c b/tools/testing=
/selftests/mm/uffd-unit-tests.c
> index 6f2360f9b75d..d8e40b770d88 100644
> --- a/tools/testing/selftests/mm/uffd-unit-tests.c
> +++ b/tools/testing/selftests/mm/uffd-unit-tests.c
> @@ -639,7 +639,8 @@ static void uffd_minor_test_common(uffd_global_test_o=
pts_t *gopts, bool test_col
>                 /* MADV_COLLAPSE should succeed with userfaultfd unregist=
ered. */
>                 if (madvise(gopts->area_dst_alias, gopts->nr_pages * gopt=
s->page_size,
>                             MADV_COLLAPSE)) {
> -                       uffd_test_fail("MADV_COLLAPSE failed");
> +                       /* It's fine to fail for this one... */
> +                       uffd_test_skip("MADV_COLLAPSE failed");
>                         return;
>                 }

Ah, the

  /* MADV_COLLAPSE should succeed with userfaultfd unregistered. */

comment at the top of that hunk should also be removed.
