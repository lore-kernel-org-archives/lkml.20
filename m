Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67516369D6A
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 02:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790735985; cv=pass; b=MZzN5JjTyN4nTzV4xFARLDZV+o3wT66HVTeVnFdzmJ8w0g+UAwocHuM7xnnb3oL3HwmcRCSfXJgt4szTFJcMKdJrXhbGBIW2cqmoKwgaqCyJ4tQdUUB+CDhKOkSXQcedAEu2fiiwexHGEPHbvPyKHhWgM8MGV1xV5Pgk0znobpQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790735985; c=relaxed/simple;
	bh=xljuBUmPGxvGdH8UYvqPrM9rVQr+Ag7pK3OC7bFa6Rs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jJhxNJ127uvN593zq23oA8l43ARsni7Q9oOWC2h/LvpeAFkaoURU/pkGnU5lrNBWYiOGpUV3kmq18yhTnv141gsWU6HtBeT+0IhgN+t+9qXVaL3Egc67AdAh5Fw6nOz0SXIRbdTJXQe1QRU2G/HXpZ04YNwQVWCkrydqq1rhTb8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mJAZFTre; arc=pass smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mJAZFTre"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-533202fe429so139691cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 19:39:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790735982; cv=none;
        d=google.com; s=arc-20260327;
        b=QfqkGeIwS57S2PGyRvcsWv5k2GK21htwF7C39NQBqXguc+Snzf9XDW42SXgAEHdr9d
         7cjcDP0n50O+cb0VL7S0wE2YpZGOCGF1y/onA/bTMOGUjgwzEkHtvk/Os2U51UolbntB
         3EHlvkZ5iM/1gjYHr96o5iBzdjWiv3bmlp1CiezBCJgRKrIjvoyuxQMan3ROYR00tDxN
         Zl0ekKzA2NaD/VP0ShBfNwwQyxZ6IrZJkCVLk2yH8Uc03w8qUyhFusTrL9ziMI6aLrnZ
         yYfh3VUJORpvEKFnkQjswen0KtGvLUHZ0kJv6eslwNfMlKlarXCkr4i8/GBkiBEeIo5k
         CZrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yZcAtDmdj1TXf2oHPw6z6v/buKgWsDNfkRToankrygM=;
        fh=QhTBnhe9w0qvu2AUfq4ygl3CfFhGGM9g14SVSW2HpEo=;
        b=XO42K23yrwsxPATBd/z6F+PvFiWSRmar8Mdnw6F3GwNTV+eQxbzfctCrqf7lT1Orz0
         r+1u4UWWKekVnw4/AR0YLwilqiRbUn8se7eql2ijJRLEyLMjJ0kfxW6KAS3zkWInGhrK
         h+mTHDvCVmJ6uapexhO6lrZm+YgSGAyuSjGC1EgS5uEriUcxpkTiIy3bsyI5kd76UyJu
         8RslMYeHk2hl9AUXY8Hexo2QN4882cnBtd/bEY9FI2pZfNANkfe9ip2qBzHfFATFfPep
         Sqrk3BYF3/yJxFGHc49DJUhO878ICSF9WtsMcIVV9wMngix2fEUE0BqtV2u91w0X9ClK
         rySA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790735982; x=1791340782; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yZcAtDmdj1TXf2oHPw6z6v/buKgWsDNfkRToankrygM=;
        b=mJAZFTreNpa0TkvBrpvBwRMqo0KAv414WfoayD4Gti0syrMenkIq36dPBmV0tCsPE6
         igsKFVkB8ypjyXrrjbzHIGhdkAgWyOqO4nONyQs0Qy6NRXmmDXsQIMrGUDsSV3yyF3fj
         OT9pmRAZGOkRHa4dhCCdpPoxX1ih0qg2/PsaGLBssHn1Hhk/+jUvMokBvAQlw0+HVFlo
         Aa6TGOBpdlMkRunTgePJor35/Gsy39D0udNcHnb5l+CL19Wc8aj9/IIZ698dzmFZ55o4
         bS6C06lHVWheZaiMFzUezGkWlEHFAyXqX5nBGccCxVbycXGF7W43Z5V9ehYv5RROK4jZ
         EfJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790735982; x=1791340782;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yZcAtDmdj1TXf2oHPw6z6v/buKgWsDNfkRToankrygM=;
        b=a0rTkVQcVGKjYcDIZ0BNLd05xQ0X+RWWYSZNetoBuxv5DOx2eWiscfUsGSqttNuwsw
         jO6Xy6RbyjQerIylODoT7sRjX3VGkblSdCB70zXSdReFZG1ERjg1CJsEBdwdFl6jtCEH
         ALa7E6YqrglirEQDu9eVOjTqwPZZtbZs0JdZehsYUdiwhxdcPQH80R/pdAjHwwXZLHBg
         ru7Bj989TjmahWrK1IxBduQVcI4152bnTtESZJxrQSIMYFpK6ALeWYQVyAZcHK+q5VmD
         qHOghdCbwq61w7vCHZwDU5FQjtjxY9/D3bi2KgNag1xkpJMzwRqQid3A+urqiVBU9AGz
         yCTw==
X-Forwarded-Encrypted: i=1; AKwUvBwECGUeEJcYQQlroLzkH1jGb0yZMr7lrogcXzBnwjT6WjQujbxTl30hgmegGk9xcOdEXv8w6jyuMJl4Azc=@vger.kernel.org
X-Gm-Message-State: AFuF++kHUf2I0hvTbW2Jik/clX25+BotNIdgQ0CwtpvnSvxKn377B3vH
	ucugzoD9xmzV4a+3lXbZX4LqGh39JDn41AL67dwWQRQOnFWPeZeeTYKU0pv1OLODe7WZE9NWH09
	qytrv+TyG/WclhZCC/BELNJSpESQuK2q2dsbSwskw
X-Gm-Gg: AYBFou08/vTP/UkleaYR4wlJ+cidbhKnef69az24OJH4ju8aaK3uaAqUjFDAALD/hiX
	dfRVGJp4yl6wd89CnkpqCg51o3hYrhuNqyfpAG+HxqdSoo5bqo2iG112eQhhpP1j4sWyKlPRmvq
	ZEVthF+y7sgTGWmVJuWfphahGs3D2VQayJJ5sBXtFEHCcAq6SFmqh6fGEwgxX5ktcju7FzM6h7F
	wF68oYxpoDSaRBcKpl4pJqjGpmzf8vBMi5Pqu9wGyPNj1/9S2Py8k6UhIk9d6rxv8JtWrqs1ITe
	1a7NRKg5CxeoFlrlYHv7QumZXNuAxpaDx0Umi0U5Eq49QK9HceqLAXiBTgHvop0ao2YtgI1qPD+
	+p7sNW9E=
X-Received: by 2002:a05:622a:10b:b0:530:ac23:ff40 with SMTP id
 d75a77b69052e-5337423edf5mr1103181cf.5.1790735981251; Tue, 29 Sep 2026
 19:39:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929082014.160587-1-hao.ge@linux.dev> <20260929134401.a1a385ff4369661f879b5d2f@linux-foundation.org>
In-Reply-To: <20260929134401.a1a385ff4369661f879b5d2f@linux-foundation.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 30 Sep 2026 02:39:30 +0000
X-Gm-Features: AclHuK_-aUPMeQc44-V_AL2TS77weF01uJnbgBxF4TBRUk7jsKIWk4H7GFwQgdU
Message-ID: <CAJuCfpFRW3uNUW_VrjpOfLwS1LBHqGEpqK3yBTPSpGOORY5jiQ@mail.gmail.com>
Subject: Re: [PATCH v11 0/7] alloc_tag and module codetag section fixes
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Hao Ge <hao.ge@linux.dev>, "=Kent Overstreet" <kent.overstreet@linux.dev>, 
	Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Aaron Tomlin <atomlin@atomlin.com>, Alexander Potapenko <glider@google.com>, Marco Elver <elver@google.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Vlastimil Babka <vbabka@kernel.org>, Michal Hocko <mhocko@suse.com>, 
	Brendan Jackman <brendan.jackman@linux.dev>, Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>, 
	Uladzislau Rezki <urezki@gmail.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-modules@vger.kernel.org, kasan-dev@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 29, 2026 at 8:44=E2=80=AFPM Andrew Morton <akpm@linux-foundatio=
n.org> wrote:
>
> On Tue, 29 Sep 2026 16:20:07 +0800 Hao Ge <hao.ge@linux.dev> wrote:
>
> > With profiling toggled off, the overflow check in
> > reserve_module_tags() did not run, a module could load with more
> > tags than the page flags can address, and re-enabling profiling
> > then silently corrupted /proc/allocinfo. On overflow the fix shuts
> > profiling down, releases the reservation and returns -EAGAIN, and
> > the codetag section lands as regular module data in the same load,
> > so the module loads without profiling.
> >
> > Review of the earlier series by Sashiko turned up more problems.
> >
> > One is a race. layout_sections() and move_module() both asked
> > codetag_needs_module_section() where a codetag section goes, and
> > mem_profiling_support can change between the two calls, for instance
> > when another module load overflows the tag index and shuts profiling
> > down. move_module() then copied the codetag section to offset 0 of
> > its regular destination and clobbered the first section placed in
> > that region.
> >
> > v7 reworks where codetag sections are allocated, on a prototype by
> > Petr Pavlu [1]. The allocation runs before layout_sections() and the
> > placement is decided in one step, so nothing re-asks the question
> > and the race is gone. The retry is gone too, on -EAGAIN the section
> > is laid out as regular module data right in the same load.
>
> Thanks.
>
> Seven patches, all cc:stable.  Why is a backport proposed?
> Documentation/process/stable-kernel-rules.rst gives guidelines - does
> this series meet them?  Does Suren have thoughts?

I think vmalloc fix in patch#2 should be posted separately and clearly
quialifies for backporting as if fixes issues Hao found at [1].

The rest are also bug fixes but their size is concerning. I'll review
them first before advising on which ones should be backported. Some
fixes address issues that happen very rarely and if a fix is too
complex it might make sense to leave it be or fix it some other way
with less churn. Please give me a couple of days to review them. With
the upcoming LPC I'm trying to multiplex between several projects.

[1] https://lore.kernel.org/all/b8005c24-ecac-45c4-840a-fd282f9693b5@linux.=
dev/

>
> Also, Sashiko has been busy again:
>         https://sashiko.dev/#/patchset/20260929082014.160587-1-hao.ge@lin=
ux.dev
