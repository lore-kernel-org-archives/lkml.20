Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B32D478E3E
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 18:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791139091; cv=pass; b=lf3dUg5VLWQpawjKNHxpbEKO16swEMlsQBhoPxfBob2Q0jn77U+iwPOw4BZ2ZXF5r/eonPm0zhYi5+BwqVQKskATtrmPVRFM/CgoOxblq5d6BxRnlKoAKdH0VMz30nt0FmRxFO5RSsJwpmbEu4cbE5ZmqByTb0y4BRvWGtwltvk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791139091; c=relaxed/simple;
	bh=czHf1y5s0XiTKD3HwlV6gqG6rPLD25IXCbNXKX3jGrg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MbIJzhg6SernBI0bsD0jf7x217PaALTpDvn6AtMrKrBWh3hu8m6lrT90q7pBT130eTSkkfS8EvzosHZSD6Rh6AjAnjTXguSnYEpcAahdvuuO11lIp28neqYOfEpiEdsfPG9u2lhZdhp/JLXyOTLMtVfyHvMNlxySxd4fmF7SNf0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cUgA/H2U; arc=pass smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cUgA/H2U"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-5337c7b9937so265321cf.0
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 11:38:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791139088; cv=none;
        d=google.com; s=arc-20260327;
        b=qEQQB2P94O+Oaw0ThsOw+hAw5piUhfatRUfMb7zT0/qf5a+je/twteJRhaew5FfdNH
         6e2WlVN3T1hvyST4IEiij5MctDrYz1ujXxXlcwq0Y704GXbVCu+F0j6Z+IRP8Gb9WYM6
         bOU37xmMnkRug8w5kZE0mUZbzfSJSDQyMq+50BHopORS0/1qt8Hpx70oMyJkT7TjkEp7
         f0qBZcCPWYr4Q+oDcj8XUF8NRgIXDURSOgEfaD7GhmaLIYqrh46s8KEcjC1qaPV7ES+N
         uDJ6AQxZutf3h2TEOeSCrAMKM/VfSEHmbgP6UUn1h0DoY9Zjt1vuGuN7qK/rCswj9b0X
         YuSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4c7dYjrT6sZNHYJQlTA+JnOu2XHVq9WNP85b0Iivahw=;
        fh=FjiPBGU4M1tOO4UFbiptet80lrMKGpULaXesHWeYiXM=;
        b=KJ/qV8EBXWzjpt+k75b2pVo1qqWGKJcx7HS4nRMivbUs7s7b784L6vpVW2Bndi8S2D
         cbUzCKWYDN3iqPri//8sA08+bMYaFUHcV8PYd7bTzPNDuoKO4zK/Wq2uJaA3wUwvbS/p
         tALqGCwFI+T2pflCOpR4fKE269urdIWMvUAt4EobWcU6kPNfpo8YxOIPt+siDscHmfDH
         gra1c4AtRNX0TtUkfSMtkuk7ZcSm1269da8htvf3bxAgastX62/O/5gwh4Licebk4KoJ
         Q30F3iJGFJDnSn3Co4WEQbQwVZ2r71kRA0A4uR5sMjm1XJA2MVzdhZ6lu6zpb7rszTsV
         IvmQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791139088; x=1791743888; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4c7dYjrT6sZNHYJQlTA+JnOu2XHVq9WNP85b0Iivahw=;
        b=cUgA/H2UGYjty5o+6+XxOm/pWmTA1x+NpJxEjouio3RqmFvE5jBaLDRh8hzE77DDe6
         gIaHAWWp37fgVb9W0DH93Ka/t+R95qpqUehK4s+5PIF0gsC4RlzulW4ijRW9G6HPRAc1
         4u3d6X26e+ZYAzJ23yP14GHWFtQnG59Lk4CQUSgpz9+5UNwDQWlCkrdviru7HB/CpWj+
         vUeZuCO8u4f7BuCfSA533lzfDtFL00p0ISt6uwz0C9TrPRw5NbSsuF8WdY5Yh81Aw7U4
         8IWko+WPfdnWGjVKONtU81hsKnC95i/qLSq4aSd5WQBXI03GZSAwuffUVOuLeTpLdK6m
         5TWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791139088; x=1791743888;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4c7dYjrT6sZNHYJQlTA+JnOu2XHVq9WNP85b0Iivahw=;
        b=CruZGsirTICLCbjTEdBYZCsmycSGaLoqpsY9ioFm5jGBgKRYmMdHxDXXHujUr3JrSP
         sP3Q3CH0ByyDsnOA8neLSArFgcoMCWi+GSGRyqmA1hzhfYOMG9ujwTzdaC8mQXD+z1GP
         2XDlj0x3z1da4NXq5i28jhV68xHg9HIkjtF2gVB5dbsFmepAi9fyiGvVIK/B/rWDEvXG
         jWC1XXHQbHDE7kFRhKx6zC1nMAKrz8lGVvZXN68OgHv1qZbsZrJoKCXdbygiPay+7xTd
         KiBu7LS/kW9izYm/5l2hVI2v0vKkniFin6ZJAcfX6m8ULJ+PYjPi2/Wl+12m4oSf2OJE
         Tihw==
X-Forwarded-Encrypted: i=1; AKwUvBwpk06SfYVgdAVOaPcncKxeiVazYwDGViJUejVhhiZjhjghqJ6jORVHTz2DggqA6Xss+9yHnoLChauIzh0=@vger.kernel.org
X-Gm-Message-State: AFuF++npPciB/8PY4M2LzUDJaRDxlLJLBlKGAAggiZNcS8uuBVg4rxpW
	aLgOGI5c63nbtCl68tUX2RTixO6qJIhmiVQWe9zaL+tv3v3ul8ETarMNBfKlVic4vf/Ly63q2Go
	gHbPhkLWDRnqR5atAILwO+SYR42JnVJNEwgudunVP
X-Gm-Gg: AYBFou13UYbGlDXOVnXEzmllVioi8jgqbqZg51NNN9N9Lz+gyr9z2fBdAyB1xFQpuoS
	8HQLY72YS9BTvSTZXWYNqC6rnX63LWVRYGlGj9pCz6hE/wHkWDn7eSL0CzonQF47mq/102pC9im
	J+ROS8mFVrghA+KG2L2J4wDwtIH7hidKlepeRdliXFeTH0qv1cnSA5leWzbKE1ez5io4Cfyyd45
	cNnJsOwoo2y8nwSBrcmDCi+46st1s+lRPYFf5Tlc00RpXg682JMBmn+BIcnd9PTw/C7XBtXSEl4
	W/y8WKQ5JDcbqFvf6oVjKIY/C2MrjU/Zok4V5yk9pDp0crXBW7eFXDF8
X-Received: by 2002:a05:622a:5984:b0:532:858d:e791 with SMTP id
 d75a77b69052e-535131b5a91mr17889301cf.8.1791139087466; Sun, 04 Oct 2026
 11:38:07 -0700 (PDT)
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
Date: Sun, 4 Oct 2026 20:37:54 +0200
X-Gm-Features: AclHuK-tgnRy3c8tRpdQgoIviLT7ezLMAJcWRyqSp8rv6XK6Qm-JduLkT1yGnnc
Message-ID: <CAJuCfpGAZUcQnursYh=rvp+EzckvDmXX_KveJvEuyjzzG=9mww@mail.gmail.com>
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

I disagree with this approach. That means we are introducing an extra
code inside vm_module_tags_populate() only to clean it up later.
Instead please post Patch #2 separately. That posting should have your
current patch that changes vmap_pages_xxx() to clean up on failure,
followed by patch(es) which remove unnecessary cleanup that some
functions currently perform by themselves. This patchset should
definitely be tagged for stable.
Once that patchset is accepted, the rest of your current patchset
fixing alloc_tags can be posted with correct assumption that
vmap_pages_range() cleans up its partial mapping when it fails.

I know this sequence will take longer to upstream but I think it's the
right way to go.

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
