Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F7A748D860
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 18:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788286121; cv=pass; b=LtmwaPd5IFm51JUGpTNIp2HdGeTnIHEjW7TnjlnzPKFItth1xF6ePSMbUniBQZV3mZVQ8sZcJDFY59bSm8InHuB7aJ8QbwRMGt1pxVRO80zIUhBRTQoJ7aZf/iiymBX8MaL3lzjpZpyEJUTNkvxJMK2ydYws5Z8FE2z0ka9OaIY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788286121; c=relaxed/simple;
	bh=X8FXyGo/raPRkoKPVRflMF35yNw57qYqgXG+3mdOgbE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LtdU6D2U+OX1TN7TCUcKhuJ59jCwXGwxcr5xyRH21RsIoOn/lCVl2l+p+sJSWd8jTZXGcgqNKRfKdRG/UUv1O7ZTWCIprKf3OBJN46ZgC8orGFZSMrbU3uzrmnpiMeDWbrBnQWZ/PribZeEKOF9CorC5+HRNg9o7bGpbL0tVQHs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=r3Y+jpYF; arc=pass smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="r3Y+jpYF"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-498012a61f6so5585e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 11:08:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788286118; cv=none;
        d=google.com; s=arc-20260327;
        b=SHk7BvPR1aOSfc1kpIckRPR2YtCzyQ3UyaqV/DVuyYFJUfqwi2HW6x4lOHGamxvoDO
         TnTSPu9A6Q/aVC4BQ+XRg3vxXG/+J9K66q4LrOuCKntO7Rcpzya70SGFyOvdS2bZ0CGr
         e35GCT4Fl5NP0yMdr4/1/68jPdEr/auW0a+DfwScJtC+p6m3MQuZuiWfztcn1kKpPWPa
         ZCdGQAJCq3CpAxRv00rhsMl357QjmP9PMQkhkPAqFSqWwiBkxQKEHCFfx7GiINlyFwVG
         9NVZ7W0lAFx6//8Zt+7X6J+z1+rB0jpNfoe1zx6oKX8xxEhxstWEpWfK328ZZnyZawL4
         NSEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=X8FXyGo/raPRkoKPVRflMF35yNw57qYqgXG+3mdOgbE=;
        fh=TmKkENyP0u0bFGUH5jP2baBn7YTHIDYooK0OoOiRRGM=;
        b=SfaUbNDrPo+4NslpNdD3M/iloxZ1Z/+7YRpERHmSOXegCvxOfZhyadzQj+mM7RVImr
         qOGHMJRR+qyXLvlaHDeHt/hwul/Aen3YMFxuRZt6pFMKDknYwWYvI+HG0FynSM/Sa5lo
         nMCFkONt6wq2lEq5Gr0wTpPTWEarD+MJkkGhJAJ7rwrEJfJ4/KPt4W09no6oGB/zbuWj
         atyABZbn8oGqigukAehHRVWn+cCWN1K7bzTLp0oRQqIQcUblciFmDtpW1VN8670Vhy5u
         1/DAFJGh534U/VNlcGoiic4R2yy+kyFxKNSA3zSInyz6WLRAE4AclUeLGRY4b8sW8cf2
         gopw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788286118; x=1788890918; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=X8FXyGo/raPRkoKPVRflMF35yNw57qYqgXG+3mdOgbE=;
        b=r3Y+jpYFBP9QgP3o8VlGeqoGnuVeIsV5aqh3U8uAcTvLNx3+PWGAoN36b6IiAuo/Za
         yXOs843Mt7n4vwklcQy3LfM/ZZnsva1J9KksYHOtoTg6GXuhQ1BmTGrIzfpvU+GP00mn
         WeJa0Nm7C8g8eotHjMpSrOzIbjQaAb8pRJzYGZCJBQcIHG/UPX6gLMkJlXBYgpMAHo8e
         YlR1SdsR/f5V+iCIFL706u0LPTpK+I7FbP1k3daKrm/3WMmAGStwPg+xBwvbx5cykX/F
         ekxPqXl7ng8467YwDpfWUd6+8hx7dUtkI7DNyzRFkkqm70CfaUsCsD+VYBeomSG2rrmR
         /Kuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788286118; x=1788890918;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X8FXyGo/raPRkoKPVRflMF35yNw57qYqgXG+3mdOgbE=;
        b=V9EL0Y3nhaaERxSo2iI3nW3OemzFCVUKkQpreIT9Shfm6U2Rsk7b7louhOVw3MZELy
         m/U2/fjGFTvtYbc5C7YsCdy2a1mFmLsbl+0L6qksXCR6pRa8iuluYC303aidOsbbkkpY
         yRlNSK/ivUgKnAVqqIuqDYk+lVVJHuIkYmWBX82YbycWi/zv9tWx8uCSI67rfV2JST3p
         /UHdX2ncM4WSbZagGaA+BxPL3hV5Mzp4h8uQUZ2h6FJ0e+y63mRsS5bjvC5f8RNIIvKl
         AOJ3tM5d4Ou30x3TmLuFEhS6VPa+ngKcecd03Tx/dNuzII8kUl0SRSJnABnGxnCq9qaK
         MKHA==
X-Forwarded-Encrypted: i=1; AHgh+RpfaGIvPp4qqt/rqqCIWvk8eJTzu8Qtvxc5ATrKQPTvcsCfDwKasKlgjkNgsj3wYPjv11jGFyDwc0KMn88=@vger.kernel.org
X-Gm-Message-State: AFuF++mlP6ycTotdoMCJThCA7RkpuB9LdrFAJA98ESjaPSg/pP/Hf2AO
	0Jd07jgyaJeKAnXMGL3DiBhti0tpHnnhDvWkhY9bINTazQdNgUWvmnNTKg94brIIlAe947UIgS9
	o4dqbM2k2CMEzDinXNnNwQv9Wl28OKo9jR5dOf3ce
X-Gm-Gg: AR+sD13CuN7/mlxGvGA0dkGNJVNQ2R9GoHa7P4Kprgo82ieJ+RVesJHF/9PVOwXmOp8
	TM+8kvgFUNYPL/MN7vBX1J+HAPBmx/YAUbVrOtkgARUIj/AYwyC4Kv97kZ8M81ZbkSD5ysLQff1
	jnNPfK8KpNCrJagqS7EavGNKoGQ8X8FmgZNJzKbhIkOQGGNZc8ZOPEupLXQn9ZmALMU+Ok3JHyc
	uVJoOJoZVWmYblOOUp2XAMZYWZOWphdGgoFY2WgzmUuRKYSa7vt+JAWvKR8a2x3kiGo+hh6du/q
	Wb53VukkibCFZ/7odRNkwvMtQVdvXevh3QYd1b39kiawV3+jxb3iapyGpD2wdIAP0WkpuGPny99
	8Pecg3MUUu7e/qt2fSytOwUGofIxhQ7k5pjsTsuUUbvY=
X-Received: by 2002:a05:600c:c8:b0:49c:e41a:4c70 with SMTP id
 5b1f17b1804b1-49ce47aad23mr50035e9.6.1788286117650; Tue, 01 Sep 2026 11:08:37
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260831234339.280376-1-stevensd@google.com> <apYXCL_GJs9Ovu0v@linux.dev>
 <CAOiLmNEV8b3TW_Q7+h5mYrZ1Nw73XcPFPUsapeYObLYajq_PJw@mail.gmail.com> <apaKRS7TYhlGRRW3@tiehlicka>
In-Reply-To: <apaKRS7TYhlGRRW3@tiehlicka>
From: David Stevens <stevensd@google.com>
Date: Tue, 1 Sep 2026 11:08:25 -0700
X-Gm-Features: AcwNN1UXbwoF_SLVJgTUIv4PDetr6v3cnkw3nV8p3K9PhP-UrCNprRfCd1ZzSOk
Message-ID: <CAOiLmNF6Qfc1M83fYFH030J7UKR=t8zKoW2pGbzeFakBnH9Ycg@mail.gmail.com>
Subject: Re: [PATCH] memcg: Don't call schedule_work when no spinning is allowed
To: Michal Hocko <mhocko@suse.com>
Cc: Shakeel Butt <shakeel.butt@linux.dev>, Johannes Weiner <hannes@cmpxchg.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Muchun Song <muchun.song@linux.dev>, 
	Andrew Morton <akpm@linux-foundation.org>, cgroups@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 1, 2026 at 1:18=E2=80=AFAM Michal Hocko <mhocko@suse.com> wrote=
:
>
> On Mon 31-08-26 18:04:57, David Stevens wrote:
> > On Mon, Aug 31, 2026 at 5:10=E2=80=AFPM Shakeel Butt <shakeel.butt@linu=
x.dev> wrote:
> > >
> > > On Mon, Aug 31, 2026 at 04:43:39PM -0700, David Stevens wrote:
> > > > Memcg charging can be done from any context, but calling schedule_w=
ork()
> > > > isn't safe from an NMI. If memory.high is breached from a context w=
here
> > > > spinning isn't allowed, use irq_work to schedule the reclaim work.
> > > >
> > > > Fixes: 3ac4638a734a ("memcg: make memcg_rstat_updated nmi safe")
> > > > Signed-off-by: David Stevens <stevensd@google.com>
> > >
> > > Did you hit this issue or just code inspection? I assume this is the
> > > done_restock code path.
> >
> > I just found this via code inspection. I spent a little bit trying to
> > trigger it for real, but the only way I managed was by writing a hacky
> > driver absuing alloc_pages_nolock().
>
> Then this is not really a fix but rather a new feature.

I spent a bit longer looking, and this can be hit via bpf_arena_alloc_pages=
().

-David
