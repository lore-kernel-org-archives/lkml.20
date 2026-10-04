Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E027471406
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 17:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791135763; cv=pass; b=W604lCGcHBGsAUcKXO/BjHL2CBT+1v6qjoF6SfHM+lVFB3BadDJtaTpK9JLG//3yDnGr6RYhm8yXA1fB3RKDhtQyL0txwzN2YHU9PkkTXt43x92V0IFwSbuUw/Zjt2jY3PB/+PEZuw2hrkUECYDgrwP3qeqL7eLXTFmGRqbtjow=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791135763; c=relaxed/simple;
	bh=sxMMTuVTEl7CoGLRlL/TJtXt7LLwauyeOGkY4dD4JFo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VcFZWzwkF0Hc1kCp4jyVZnZxOuD4Mp9vEkY7tSE6M+De1h8psiZ4vAaUfsAbNlJxyhjV4UL/H6fNmOK3zBDKJITdtp4ujCxfxdfzRcA0M8i2XfERt3iKnzYLhcv2s4pyUxKgxAkoniFFc2rFkrc1YbA8XW2Di3oyuwKVkQePo2c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VlvcCLf1; arc=pass smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VlvcCLf1"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-5351f9dbfe0so95521cf.1
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 10:42:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791135760; cv=none;
        d=google.com; s=arc-20260327;
        b=d5Ol4OVIKCvjegyfzkOu/PTDQtG21FQee/5WG3ze7qgPxTI+f5gEQAj+7j/Zeah1JA
         yyBLA2egY0bd683/8dBaOQ+fjyJTtRIf9QuAW61ZDiTum1DRurYfQRp5i/wX9W5Wng7O
         MixNs4OXY/3/8MLcBe+hjRc/8f6uMOfx1d9020FYYPlDSSjfvHxiikfcjRpw2j5iq5nU
         3d6opIYxz3fp/CW4L7tP6TsePPMBNGGkf6mT96sUQ3qY1mCQvtI2OcCtjaToraQOr5OH
         VA/cfrJzXVkB9DSyfhUaBh7+1mCSgBxqlNERuh1RQfwMVd6cw63593U3wRQDnp0Xl91I
         n71g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uJD53HUZVgIGH/PLRRSHlx0uaJ8NtAGb26BTpZemPvE=;
        fh=sPVHaCVN8C7sCOJK54yZq+m6RE4w/NycC0qZwDSejX8=;
        b=Ou3HBBkAFPr2kMHXRyeA8zQ2ATZPJ7FdIlwj7xEYeCpfo85+FOaTHd+wtGjDxSeMsH
         DlQtLu+6QfiQyYfKYPo3bysbmnGEA9kfmtndjrJNUrW1D2B6ju8TDeqfUn0rkW3evchE
         1tJBM1PFOT2hZpBlJhk7pwrbfFFCz0E+adTyxZWontK1Z51+a+REqfQP1ywIo7YgmqNs
         iu93ynipCELy5jeOgqmlhM1+jBVgeH0Nd4lQb62hWrJBnKxE5OPINbSe5BFnCWcUL1hM
         Iuw2VvLbmHXVpxKycUK85X+rlqclzkSB1OKhh0K4gAaxMeiUg7kGdpqytvPRTVHcPtQV
         cqDQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791135760; x=1791740560; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uJD53HUZVgIGH/PLRRSHlx0uaJ8NtAGb26BTpZemPvE=;
        b=VlvcCLf1N3dvSSmAgsa6tf5hu5NVdIU0dtTA6YOXVHDrelKfE3jzxbw7d7rolxYEc6
         aRoEAiLBBVHRWWc5T1ijCURIG9FWcWM5bB64EnXXbjsCga/Z+obH+xoVkzgC1w8l+dGn
         q2bkmPpoib0UGUttnwfBkXrzWHAjG5sLaqCIMjU6OXidLurUznOvt7C6TWb101WfvP/P
         l5Yjx7Yq8v8CmB7xD3w7NcMTNN3g44sJ6stLs0FzZDjhr7GlaJ05jTWjbTFTl+KnaRyw
         +H+Jud94TsoM97OESrCDK6rojuzAiWfCsYt1hDfJZYACXQ3npe4tXg1hj8ApXASGf2Mk
         DzNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791135760; x=1791740560;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uJD53HUZVgIGH/PLRRSHlx0uaJ8NtAGb26BTpZemPvE=;
        b=zlLFzi2SlegOS7r6TNSHKUqkWTmKkCUVLTTgvcaOdTFeTLAGf8qadHVf/29uegp6Ps
         qsuyyY3Xycp27WWI3sXpt5D7P0KzE8gkn+/IONI5T/wWKnAVv3443yFxlwzfZEPXQRI+
         qYzAEakTS70aQ1R55Y6ehZzHc6nJUmKqflUdk+6gEED7Y+PY8j34+iIknAc9NHeCneNe
         lcgkMkuwp4B4fnnvDE7hVndSdLu2GBPBPHL8zNBfEs8c/PrA3P8/BaoxMyDQX1x0Kxx4
         noM9D7qal896mnkT1kvG9P6UfgVX1z29U1uJ9XgmV8YkCKSL22qSUz9+VVGUtrXGUaTb
         EpCg==
X-Forwarded-Encrypted: i=1; AKwUvBxFQqoMZNFltuGAttpSrbEqq2sctauZm/ztW+LI3KdbH8KY6+DTcc4eE870GRXNxU739EKjr4RXnlrdc2M=@vger.kernel.org
X-Gm-Message-State: AFuF++kgtE/1zGfRbvKhrHZupzLkJGxXJUwxI8ouzPavBTCgmbIn4uDV
	wEArCJn/ArAhbWTeLPegvh5RHbeZ5eSnqncLmLy2/D2tUQ8thSG+A7irRtmpidMzNemgZmO+Vdq
	50/g4aglwnR5gTbzKxvPGTxp1g4epMjcsXXTU2ukU
X-Gm-Gg: AYBFou310Lx3fhp9OOZ36lOTTrm8TEAVC4iuOPojSufPYNtagDQMmvYuc1cv6QQ7LJw
	ltLAFQQuBQyP1xkM4tUHc3BE6XSzBKEPKhsZcOG6ptrmHLGxgadOl1Xpd5VXJqnbFQHsY0/rqrN
	1dp0wvPW3redny3fuCJ2LHs7SDtYiFJAU/XclJJzvwSXkZxhHx61fm2x4ohYEYXACwoC8o0vjfj
	3TkAZufk5e4NDAWPn277CncQ40nf9Y/tSwpKU9WKdRiY+fLpOIsnLrUfHsetHjzSW0x1xMMEVo/
	DDWMEtNcNDu5fBcqh777CT5qcpIc4W+jwXB0822LQoF77J2PavaJDAtT
X-Received: by 2002:a05:622a:488d:b0:533:9746:9a86 with SMTP id
 d75a77b69052e-5351470cf22mr4172291cf.5.1791135759241; Sun, 04 Oct 2026
 10:42:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929082014.160587-1-hao.ge@linux.dev> <20260929134401.a1a385ff4369661f879b5d2f@linux-foundation.org>
 <CAJuCfpFRW3uNUW_VrjpOfLwS1LBHqGEpqK3yBTPSpGOORY5jiQ@mail.gmail.com> <fc4f3d08-393f-43ed-934b-e7e1ba6d0137@linux.dev>
In-Reply-To: <fc4f3d08-393f-43ed-934b-e7e1ba6d0137@linux.dev>
From: Suren Baghdasaryan <surenb@google.com>
Date: Sun, 4 Oct 2026 19:42:27 +0200
X-Gm-Features: AclHuK9bfK0yNJ_n96E9Lm8SQgMCYBLT6Ag9IyToQHJQ0m4bj2apFc6i6aDVObo
Message-ID: <CAJuCfpHXxDXs9w_FkfN0Z98qrtDQXb-=-AhcJMQ66m2W71UqEQ@mail.gmail.com>
Subject: Re: [PATCH v11 0/7] alloc_tag and module codetag section fixes
To: Hao Ge <hao.ge@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>, Kent Overstreet <kent.overstreet@linux.dev>, 
	Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Aaron Tomlin <atomlin@atomlin.com>, Alexander Potapenko <glider@google.com>, Marco Elver <elver@google.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Vlastimil Babka <vbabka@kernel.org>, Michal Hocko <mhocko@suse.com>, 
	Brendan Jackman <brendan.jackman@linux.dev>, Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>, 
	Uladzislau Rezki <urezki@gmail.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-modules@vger.kernel.org, kasan-dev@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 5:25=E2=80=AFAM Hao Ge <hao.ge@linux.dev> wrote:
>
> Hi Suren and Andrew
>
>
> On 2026/9/30 10:39, Suren Baghdasaryan wrote:
> > On Tue, Sep 29, 2026 at 8:44=E2=80=AFPM Andrew Morton <akpm@linux-found=
ation.org> wrote:
> >>
> >> On Tue, 29 Sep 2026 16:20:07 +0800 Hao Ge <hao.ge@linux.dev> wrote:
> >>
> >>> With profiling toggled off, the overflow check in
> >>> reserve_module_tags() did not run, a module could load with more
> >>> tags than the page flags can address, and re-enabling profiling
> >>> then silently corrupted /proc/allocinfo. On overflow the fix shuts
> >>> profiling down, releases the reservation and returns -EAGAIN, and
> >>> the codetag section lands as regular module data in the same load,
> >>> so the module loads without profiling.
> >>>
> >>> Review of the earlier series by Sashiko turned up more problems.
> >>>
> >>> One is a race. layout_sections() and move_module() both asked
> >>> codetag_needs_module_section() where a codetag section goes, and
> >>> mem_profiling_support can change between the two calls, for instance
> >>> when another module load overflows the tag index and shuts profiling
> >>> down. move_module() then copied the codetag section to offset 0 of
> >>> its regular destination and clobbered the first section placed in
> >>> that region.
> >>>
> >>> v7 reworks where codetag sections are allocated, on a prototype by
> >>> Petr Pavlu [1]. The allocation runs before layout_sections() and the
> >>> placement is decided in one step, so nothing re-asks the question
> >>> and the race is gone. The retry is gone too, on -EAGAIN the section
> >>> is laid out as regular module data right in the same load.
> >>
> >> Thanks.
> >>
> >> Seven patches, all cc:stable.  Why is a backport proposed?
> >> Documentation/process/stable-kernel-rules.rst gives guidelines - does
> >> this series meet them?  Does Suren have thoughts?
>
> Thanks, I've just gone through this carefully.
>
> >
> > I think vmalloc fix in patch#2 should be posted separately and clearly
> > quialifies for backporting as if fixes issues Hao found at [1].
>
> Agreed. Patch #2 was added to this patch series because vm_module_tags_po=
pulate
> suffers from the same issue. If we want to be more conservative, I'd pref=
er to keep
> vm_module_tags_populate as it was in V10:
> https://lore.kernel.org/all/20260915070001.113559-3-hao.ge@linux.dev/
>
> Then we can submit a fix for __GFP_NOFAIL retry loop in __vmalloc_area_no=
de() as a hotfix together
> with our new patch #2. While at it, we can also check if there are any un=
necessary calls to
> vunmap_range family functions that can be cleaned up now that patch #2 is=
 applied.
>
>
> >
> > The rest are also bug fixes but their size is concerning. I'll review
> > them first before advising on which ones should be backported. Some
> > fixes address issues that happen very rarely and if a fix is too
> > complex it might make sense to leave it be or fix it some other way
> > with less churn. Please give me a couple of days to review them. With
> > the upcoming LPC I'm trying to multiplex between several projects.
>
> Thanks, sorry for all the hassle on you folks.

You have no reasons to be sorry. It's me who is delaying the reviews.


>
> Thanks
> Best Regards
> Hao
>
> >
> > [1] https://lore.kernel.org/all/b8005c24-ecac-45c4-840a-fd282f9693b5@li=
nux.dev/
> >
> >>
> >> Also, Sashiko has been busy again:
> >>         https://sashiko.dev/#/patchset/20260929082014.160587-1-hao.ge@=
linux.dev
