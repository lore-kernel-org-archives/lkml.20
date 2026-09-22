Received: from mail-yx2-f42.google.com (mail-yx2-f42.google.com [74.125.224.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0D47383993
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 02:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790044902; cv=pass; b=GpK5Cj5O0QIhVNoNA5xSWQs9caLIit7FDmajMJmLltEXIi+Qe7wAsIBu2mt6YFqqLtejdfJCiNcbF7v2xTEdsT/MNmSiE5MOYU0iPauW3lwpXTl/U09kz6bDGJ/57MaGo+tIXBhU70iaL0Ks6Fwf+gWEDSOC8WGGwC3OeH2DcfQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790044902; c=relaxed/simple;
	bh=KpmH/Rf8PCQUoN5K980iEZAtV/t0VVxk9GV9cULTJz4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Kdg3P3RBQe+f3wmRaahMf47VR96Tf3z/0FS7vmLGmqDGZYMuqQ2Z/YEvupq99QYfhYGB8bSBKt8yy/FgYQN94vRcUPcw0qLLMsEPiOxYL4XWwl6WfK3/Smesl85ObXfEevBpKNmapdfLcS41+AoSjEA++n5ssNT/SSOmlRtzBjA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pq6ZK2/7; arc=pass smtp.client-ip=74.125.224.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pq6ZK2/7"
Received: by mail-yx2-f42.google.com with SMTP id 00721157ae682-8961cca9193so48644307b3.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 19:41:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790044899; cv=none;
        d=google.com; s=arc-20260327;
        b=MdzK7NH12kWcJT9QNXXUeqV9uirg6ZXFnIzYDAR2GOrfd8Vgvft4AP3jKdq2L9PgBh
         4HB0MNUbnbqSgL2V5agJEILTPulR23BuobkTk0dsb6k3M+g9EmIIblS/wIGlEq3xglFL
         oih6eA/WooQuyBGAolFHIf1FhvJtFQadPUyGzvKzeZZ0iV0E4UOtXki9MHU2+ll79292
         lfrnZUiCA3rA2in6JUiZV3qnuyyLEg+iYidXIhIGh3s+HOFWp0a3FTUXgn6yVXsglTc7
         RYJBNsqzP6+6M/e9pTDexcFLvc/iiKqGlXkIniHGWoWOUK3gpjxnovIZAlOxdj7DgMoC
         ad3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=y766ru1pP38bk6e7RtGWTvz6LPHY8UDSub3CPfviG84=;
        fh=pM3ZuZXWgef0esn1h2ZyJGizUNIGkiBAWlQIVdZoDh4=;
        b=Znhpu6Sp9fSnbrkfcnFk15ywc+a5kIGBe/FUZhqC4lbFs+ZSOAEZLSA3nndWiYazrT
         jFd7ntAKSo+NpDGrvAiktnkRhXl0RhwdwqocD4ts/OKl209+/Fe/sRDrVCfcyi3iQ2BQ
         jEABTdjoOPCNVBimCViWcEr+iMSWpKicsLQTx4dUyVPrJ4SPVdoNFnDNTk+C8/9iifgI
         ECXFv0i4sw8zLSY6AqapWktR5opN8T6RWMklbcRJ91KHw0Oap/AHwCTexcK+wHJfbbmH
         scV3BV2OHW9f92K3AKp6xhp1YdJRMPTrbnzOGXoX6zRmB0pxC4jmJtXMzZPwYFi4TSlh
         JUcw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790044899; x=1790649699; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y766ru1pP38bk6e7RtGWTvz6LPHY8UDSub3CPfviG84=;
        b=Pq6ZK2/72LS6NnnZdqEPTp8lBmwMrAjXoBtXPfxEE1n0h3bGH276aA9D0FtUSB0hgQ
         VQU7zZr6Dg/zO4v2Heuvstz/9Lp2idMpRXGoDcqrN3pKnowYImicruRvoYoNqs21jpaG
         nqCESll05xbkuKLm+UWzMJ9chseMiP3zysy7Qo4f4Iy/AlzAyQN3oba2p6DUm99HQzoI
         mjXRPYNZm5TVYKO2Z5oWH67gHaFSznZidVWKNwoxzLKC7hDjD2Xyit0mq7tuYaf80THg
         KQ14SnB4EPTCWav4zqiyJUr8ENtUjF7hz0zNQzl2W6X+13V+Zvl8TJkF8ciwZ2QYu0f1
         eEXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790044899; x=1790649699;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=y766ru1pP38bk6e7RtGWTvz6LPHY8UDSub3CPfviG84=;
        b=nPxwW8GjhSwWWFHxSaBvqoz8a/tI+suBD3xj23iPruOLs3hhbsx1MSWWaUFCHqoX8P
         u9o5NAX3o51WLFvGeJhXHfkz6L456dSji2WSiv3GDm9GdfgANaQWq8sjH3SzhnL+7bvV
         T3PYcoHekviM5WfmIUGlu7lRT6w2vZnD0tjQPooXi/09vA4bh3ooIyMJpwmIrabi9mQV
         mYVZBHQ0+kPoIte9mYlq9mCKLD3ptcktfWYoB0613i1fERo809e/9rfGGysJT9jmSxPv
         ZeZCwkxfQlUH2iaUjWlrOvhbbBwR59XEqxbXqWf4WEcniwIET5Fv+63dnkynJsUpWNcz
         IMMg==
X-Forwarded-Encrypted: i=1; AKwUvBzsH7jxOieIedZ7yOIGMZ/6tOjttp3pLwjTnRB0BUykKl5e0ES1xiSlaemwvacSffIk0SZbklmkWeKM7Mk=@vger.kernel.org
X-Gm-Message-State: AFuF++k0JaLUphOx1+MunNnPQuQLs+Z8ZUUSt3OhQ/DCy4I0/CqedtIt
	ZT5P5FNyIcetItjeMqNVc3J58KlztKve15aUsH0aojmVFN/eJQWgRnutyoa1zYVwLVSHFW9Fzty
	tYMhKd+Ty0zHXMjY23a3AwaZF7oO4W9A=
X-Gm-Gg: AYBFou1VZGtCnuJN9t1IZptIUgf1JUGAgX6cBDy+16UfhDlZG6DYt7XTgw4GQcoSwri
	xm5ru3hNdlj+c7qhD7z3os/fZp8nMlxiatdEHui1ud8NEQM4By5J4FNXgUd1a2oYKZW7/znfQTv
	wPirYTOW3ORPeXGQZ3h96fsZhJiB/de/5WlJhIKtO/MrRRdeOuZc8k2jafPf/cHNE2fntiJIxW0
	bg1g4GuMwTnHtOJ+Tv+F/ByyisMkJZOcuJpEvyKi1XBR9I48fBraSOUFy4IBp2Jm3cQxhGJwjxe
	vhU7uiuFbQCKLbdFRuStAlgTZuRgIr0WXj2X1h5RxRkKxqr6a0/xL8J/K0bqwiEQDSMK
X-Received: by 2002:a05:690e:418c:b0:671:6e1b:3579 with SMTP id
 956f58d0204a3-6717fce3850mr3483604d50.31.1790044898781; Mon, 21 Sep 2026
 19:41:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921085119.308981-1-lgs201920130244@gmail.com> <arFHWJb9igZQPkeZ@quoll>
In-Reply-To: <arFHWJb9igZQPkeZ@quoll>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Tue, 22 Sep 2026 10:41:25 +0800
X-Gm-Features: AcwNN1V-Ux3fREqDv-l9JklLsk_41fzba7T8a5w0aNSBvvhTkqxYTyKq2Y8-7tQ
Message-ID: <CANUHTR-FtO3EAxgTmXeS0YeT+2CPB=4iA_T-2qFZO3QT7veYYw@mail.gmail.com>
Subject: Re: [PATCH] usb: musb: mediatek: fix child device leak
To: krzk@kernel.org
Cc: Bin Liu <b-liu@ti.com>, linux-usb@vger.kernel.org, 
	Yonglong Wu <yonglong.wu@mediatek.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, 
	Min Guo <min.guo@mediatek.com>, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, stable@vger.kernel.org, 
	Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

Thank you for your feedback.

On Mon, 21 Sept 2026 at 23:03, <krzk@kernel.org> wrote:
>
>
> On Mon, 21 Sep 2026 16:51:19 +0800, Guangshuo Li wrote:
> > mtk_musb_probe() populates child platform devices using
> > of_platform_populate(), but neither the probe error paths nor the
> > driver remove path depopulate them.
> >
> > If any initialization step after of_platform_populate() fails, the
> > probe returns without unregistering the populated child devices.
> > Likewise, the children remain registered when the driver is later
> > unbound.
> >
> > Use devm_of_platform_populate() so the populated child devices are
> > automatically depopulated when probe fails or the driver is unbound.
> >
> > The issue was identified by a static analysis tool I developed and
> > confirmed by manual review.
> >
> > Fixes: 0990366bab3c ("usb: musb: Add support for MediaTek musb controller")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> > ---
> >  drivers/usb/musb/mediatek.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
>
>
> You sent multiple independent patches, to multiple independent
> subsystems. The amount of these patches clearly suggest this was
> AI generated and most likely not tested.
>
> More importantly, you sent all this work without properly organizing
> relevant patches into patchsets. This makes reviewing difficult
> and might cause multiple reviewers to address the same issue.
> Replying to the entire set is impossible and requires handling each
> patch independently, instead of applying or discarding the set.
> Maintainers also won't see the bigger picture of your work. Quite
> worrying.
>
> This is on the verge of hostile patch: bomb us with so many
> contributions, we won't be able to handle them in efficient manner,
> like responding ONCE to ask you to slow down.  Considering all this
> is untested and LLM generated, I have even more doubts whether this
> should be considered for review.
>
> Please read kernel documentation BEFORE posting more work. It will
> explain you how to identify subsystems, how to organize your work per
> subsystem, how to document usage of LLM and how what you should not
> do if this was posted in a good faith.
>
> Best regards,
> Krzysztof
>
>
>

I would like to clarify that these patches were manually reviewed and
audited by us; they were not simply generated and submitted by an LLM.
However, I understand why the recent submission pattern may have given
that impression. We sent too many patches in a short period of time,
and we also failed to respond to some discussions in a timely manner,
which made the situation look worse.

Many of the recent patches, especially the v2 revisions, are
corrections and improvements based on previous review feedback rather
than completely new untested changes. That said, we recognize that the
way we submitted them increased the burden on maintainers and
reviewers.

We apologize for the pressure this caused to the community. We will be
more careful about organizing patches by subsystem, preparing proper
patchsets, and following the kernel contribution guidelines before
sending future work.

Thank you again for pointing this out.

Best regards,
Guangshuo
