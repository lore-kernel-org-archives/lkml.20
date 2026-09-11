Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 623AD3D9DD8
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789140753; cv=pass; b=I7m81aj9pS+IlBoJpN6b9YbndNZzuvRJQ551N6X7v+2a0cv+plgXTbBeemb8ZsO5PHbjRPl+y3Dkr+0L4B/lByD4Ob5726Y1b65rKHowFmebq27FmPRqzmGu/+12yfjlQqcrUsExnC6PUZHU7puECdFq8Gk4gEeXE2pjMB9ryjI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789140753; c=relaxed/simple;
	bh=YJKEvxdzim7aG0+3oO1LTxbSduJEi7uM2fNJ7/lxwYg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QeCVw62UAitLzdwPNeL/fKj66Yv3oECsUf4coa4e/ptgkLmZs5v2LZ3O3osnmKsRBU4boF6AxNx8hR72j89doSzuCz8Mf5vo9Y3biClzV82JNWgLgRJ3mAfZShqS7ScOJioErAqMseSNiZ0HIuTz9uFiXqAm7C7CpQDHIvTFm0o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tz/It8iO; arc=pass smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tz/It8iO"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cc9f581c4so180185e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:32:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789140749; cv=none;
        d=google.com; s=arc-20260327;
        b=grSrygTd4li0RoUSNQxmqUeN4QjC5LlNYUOokvHBmqf4dgdKJwMXxQAWO2f5LzIx2D
         FQmqrqjXbXqaCS6GBUEF91iXTGcJ6R8ULJ1m2f6CEWq2JM1zsLRYJShFSajYY8zFjgSt
         peeWc5ecAAwGFtIjbt652KjUv7jGvoX1L4acZ8kwKQMnFaI7gCklWGi3yB2jFcMUrwi0
         Cg42vS5IVy216aGDaa1mLEL4tMK131dPb5ivc1oJzcdPbVWxtjyYmyE+XLCuTmMzGj+Y
         28pilRbHfnZh6RHWcIfK+tSnUjAAtH9XuNDqlaIM7FnySp9EOES5gyQyOpZM/36Emsgj
         GtQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tx5AyXZ3GvBAYCgk4osxeglSu6XXu49YTcUaOVz/aoc=;
        fh=QxBwGQk+7Wc53LG760aEize7vhFII9XiPDd2XEIH1cs=;
        b=lIevvNLfm0whMDabknrZKnjxePNrNfXSqrGDYsEB6BwcTL9IwFJayoGJbThTHS4WzR
         BTDsXJ3zany39CTKAv2W/scqLnxOJj06DDdowyKNWhxaujOnCNrOmu9MLemhrFHAD+kC
         g7CzlrjTSUTR7tH9cb+Yuv2s9C6S7vkALCRciJA85Km/38lb+WyavLTB0wIGsNg0QDfj
         JoQR/rjn2qJjnOTC379d/8vzQLI5rrky0jZoEg3j9qt/hBBLzOXMMndlO6Ws4yMt1+Fx
         xLczIHYzQ+2tRsXEf2YfV6ul8+38rpeXwXvQDifro+Jki+fuIDQ6ONVpcgtam6Bm+lPw
         Bpqg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789140749; x=1789745549; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tx5AyXZ3GvBAYCgk4osxeglSu6XXu49YTcUaOVz/aoc=;
        b=Tz/It8iOeckbIYWBmZg6UMZT0WElZK6s9UI2rUrbO1hdq+bbDnRWAbUw6nieWMpq2K
         OiLX2bnsingM8HQP2yDLUqSgnhX5l+vL7/3Eyby/bpjBp4IDZJt4sayM9w9DDzTz+28Y
         ZqpR0UE5FQ2XO1Ge436qmcE4gkrrGK5r2GCEN6FvqFdu/WFpPUoiOExrsrB8IU4986qF
         Dp3OPMGDpCcvNCSv1AGwSPE5oBdWlIKDJmTkGZZobOB9mVBQc3TkvzosRwbg3Alfm4NX
         BNkCbo3623QrRJ0bQ093uI9Tl3ZYALLXQObTIJK80ZhkvMMYPAHQB65cM05jMh9YySmT
         iukQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789140749; x=1789745549;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tx5AyXZ3GvBAYCgk4osxeglSu6XXu49YTcUaOVz/aoc=;
        b=dqijrL3qnXfm/OIAA1Lo+YjtHcKzYJeyBqAbiyhkK6P/dv+8gnzZZYn6qAXMbAAEKl
         C/RulWTwwxliclW9M8gu4/LIBD8fVsdQSFdBMosuApg51U+tsK6XaXmmTf5qp1FPU6yY
         eISJoGCnwtNM0AREWjuTl+shw886hVODBVrqnesi1FzGfdg6a/BNouzajp7ih6LTY93H
         twtijCVlOG789K3k0P3aY5jIVyq/xegpskzC8wDfzoKSbOHLZ4ArQ4KsNTXX+K9m5Sos
         +EvmKBqSuLb5KgjVFPn8bJiD9yFpwxSxMw/1PIG7zUcUGzKfkMHufYy7wY62yMaOWkNj
         LO9A==
X-Forwarded-Encrypted: i=1; AKwUvBwE89HJ9QPLawQSUR8PhH501SY4Y49cslE9iaH6fWniBpaR01FfFtQAAh69ztDbG21zRsBUqvS1UuQ+QDc=@vger.kernel.org
X-Gm-Message-State: AFuF++kSOw99oiyavOTAYcpdOUOkyLyLtxWRBZgRKlRC+cwb/33vlmWN
	3XPpRW3CwOb1sd/Nvmh1w5dP2vz3m/m58wryeyalL5aLIpeBXG8QNONBOP4hQj2iFI1fd2chGPU
	VKmptW7qabHq8qHI/5IfG5vah+ECVstlLhNmAxmq9sQ==
X-Gm-Gg: AYBFou2B+wjwIGQDeVlxME0jVC6sCXeOjREtXLlLTNN28VLhpC759HrChhxgn38wwA+
	BjZeuWFnM8n7Tk1QXAuqInvkdUDMn1fsfnlrnOQKsV4O9fM9+cdeYE0e7FylWS6aiUHIwLKrkK/
	Moi1qUyD5qPpqHfqDcgzcvSf33BMWPlcc4WuE3K4IypSC8lXtziWZbxHcdC0VPkZNKtstmtIn6r
	F0AJPhtkJEciZZXY9aNmifh5UidVEK45CTBXeTu2y2aSyyUdu6hSHA5a1IkcQwP+G0MKiYaDclp
	Jq2P3H5gSiRsHjV1i2p0mh2+/QHDizVFQnuDM9pJafc2zFsD6XS0Ln3P3+2pisX5BuobmXaB4he
	nRi/CyoGkSvE0
X-Received: by 2002:a05:600c:3f08:b0:49c:f13e:e50 with SMTP id
 5b1f17b1804b1-49e6108c75dmr59294085e9.13.1789140748568; Fri, 11 Sep 2026
 08:32:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260911100427.2804601-1-kunwu.chan@gmail.com> <20260911133232.91581-1-sj@kernel.org>
In-Reply-To: <20260911133232.91581-1-sj@kernel.org>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Fri, 11 Sep 2026 23:32:12 +0800
X-Gm-Features: AcwNN1UB2lLvhFoOalBtTq0xTCkHEalZbjYl1gPmEXSR-cXhuK4bJrIAZhw-nSE
Message-ID: <CAN_Opa95ePWNT6o2axVtvKNjC-1aNU09f_XMnUjcJFZAbYeUZA@mail.gmail.com>
Subject: Re: [PATCH REPOST 5/5] mm/damon/vaddr: support pgidle_unset probe
 filter type
To: SJ Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, damon@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 11, 2026 at 9:32=E2=80=AFPM SJ Park <sj@kernel.org> wrote:
>
> Hi Kunwu,
>
> On Fri, 11 Sep 2026 18:04:26 +0800 Kunwu Chan <kunwu.chan@gmail.com> wrot=
e:
>
> > On Wed,  9 Sep 2026 07:04:07 -0700 SJ Park <sj@kernel.org> wrote:
> >
> > > DAMON virtual address space operation set (vaddr) does not support
> > > pgidle_unset probe filter type.  Add the support.
> > >
> > > Signed-off-by: SJ Park <sj@kernel.org>
> > > ---
> > >  mm/damon/vaddr.c | 55 ++++++++++++++++++++++++++++++++++++++++++----=
--
> > >  1 file changed, 48 insertions(+), 7 deletions(-)
> > >
> > > diff --git a/mm/damon/vaddr.c b/mm/damon/vaddr.c
> > > index 45239f05e113b..9a38dc89a156e 100644
> > > --- a/mm/damon/vaddr.c
> > > +++ b/mm/damon/vaddr.c
> > > @@ -522,13 +522,49 @@ static void damon_va_prep_probes(struct damon_c=
tx *ctx, bool set_samples)
> > >     }
> > >  }
> > >
> > > -static bool damon_va_filter_pass(struct folio *folio, struct damon_p=
robe *p)
> > > +static bool damon_va_young_addr(struct folio *folio, pte_t *pte, pmd=
_t *pmd,
> > > +           struct mm_struct *mm, unsigned long addr)
> > > +{
> > > +   bool young =3D false;
> > > +
> > > +   if (pte)
> > > +           young =3D pte_young(*pte);
> > > +   else if (pmd)
> > > +           young =3D pmd_young(*pmd);
> >
> > Hi SJ,
> > I see that all callers already check pte_present() / pmd_present()
> > before calling this helper, so I don't see a correctness issue here.
> >
> > However, the other DAMON young/accessed helpers, such as
> > damon_pte_young(), damon_hugetlb_young(), and the PMD path in
> > damon_folio_young_one(), keep the present check together with the
> > young check.
> >
> > Would it make sense to keep the same check here for consistency?
>
> In my humble opinion, it is already consistent as long as we didn't miss
> present check in callers.  If you concern a case that we call
> damon_va_young_addr() without present check in future, how about adding a
> comment noting that on damon_va_young_addr() as a followup work?
>

Thanks, SJ. That makes sense to me.

The current callers do provide the required =E2=80=98present=E2=80=99 check=
, so I agree
that documenting the assumption in a follow-up comment should be
sufficient.

Reviewed-by: Kunwu Chan <kunwu.chan@gmail.com>

Thanks,
Kunwu

> Also, thank you for your reviews to this series!
>
>
> Thanks,
> SJ
>
> [...]
