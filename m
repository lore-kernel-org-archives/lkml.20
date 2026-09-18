Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA645349CD8
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 00:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789692833; cv=pass; b=g96JMidNXkXGhR08Dsygy8fDYjIB3Oz55OV/suu9dOfkYTgA7b/OD+b6dSaYaYG4yIF5B5lqjQA2tOkoP+7f+KYnemBP4xZoEXGrFiVsd3SEGD4tXwU4/z1Z/EBVA2aP4XUY6TLdQdu5W63SFFXbbZWcifV1QG8agaii4et/iu4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789692833; c=relaxed/simple;
	bh=+0FEERhuCrNALhxt5BYqoKVl7HbeqQe4QtB0NTjTiQ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BmMBsyQi4tyWpdSlZ6V7Jrcjp1voqIJtfucgQAGBdWrF703nSESVnzA42hVb3nuMwXd6swZGgnPx/NwMwv5pDsTsxbhOh6EacfPmoFpeMu22OyWjhu9fQUisMsUtL8YTdxXMm+7M6LtEFm6AOKvK4eKE/VpjrP3iC7GiIXinQ0M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=r3i0Z6xw; arc=pass smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="r3i0Z6xw"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-53113d72966so101681cf.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 17:53:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789692831; cv=none;
        d=google.com; s=arc-20260327;
        b=CGX9rt/LIwBcQzBCuH+EZtrgfU0BSNF6jZZf1eQoD6lSSTD+2nwYn3l2d+7jTuGOVH
         OOqeTefMuVjNq44mBdw3UUzcjROeW28NjjZwLkP9T20xV+4VBBxoFKPZpUMET7ayfjyy
         ZKR7ovcMgEhUBwQna4SU/fQmBdEzKeQ2+cPbHHKQkcJRXFOzySWFgAPIL+DaCIL3sOdY
         P4/pAu4A1nFTLcziwfy7vN/1o8bBn2+p3xbwLpI36Zzhd8/qCb7m3e0ji4HSnbdHSVrC
         g/5Qry79XlDXD5QqMuTMpWejl/wpZJvxElZICKDyeap89ULHFOVOs7OfWV0SM9662CDw
         K56A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pChmIbk5dvBz2x+ATGHEFGjZSAwLQf4D4OxFleYq/PI=;
        fh=hupCNOUCGmhRrUb7iuxmFx6+Q9h4+Grtrm7HFeOj9ic=;
        b=LlEGFkwUYLLTmHzBIx/Z5jDYXuXjdogMTHxUJ9UQQG91kWBW9DPTAVkjlNSkD+7UuR
         1ywlCjAEl571oZI6gyoywImg5358Fp9MRHOUiXjStE6dNeIBivbIwslG7Eo9Q43Hg26v
         9kHINlhP/Qug9JXHvde/oEsN5a2YU51ilSH0sid/XIIOw2n/Jg8FwPkJGWBETztkAMlO
         rGcEJ6ja2YwNzSjY4LoKlFcTDb4DhfYeRRkzk8BMa1bJwdbcIOkPKAnos4vaKv25r/6n
         ElDkgbG+ZmNDVN+rcEwip9RnXze5Bhk6l/8PHcVvXfyN3aj5cnPvW7VBwgyvdiu7TBqj
         qggA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789692831; x=1790297631; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pChmIbk5dvBz2x+ATGHEFGjZSAwLQf4D4OxFleYq/PI=;
        b=r3i0Z6xwdGZnSt9mDh2RVZCRb25qtWmuHncKV3cCVzvoZ28oqbQ6Dcndu1gVfBd44j
         otvXSfSaOTwIgK+o29nOvfkBGYCytVxFZrcFqIMCt7MYDXzkc3a4LvKQoiB3WAW/mEsg
         DuWkPt8ERVcQIawIJXVDSqrmlhj1LT3Rgia0plnemp4ngRXYpyolkuVakeGrpuITkSlZ
         F8q0UFlcPJU54oKSuJXDmdkKjukHLyk/3/iPc9urCEHu5NQNewcGuI1jDutf4zFFED9x
         3i11Kx/xTVzsxUyfOH44DZ/Caa1CTzm4OV6i0a+4Xnx9CRJ9eMpBa9zYbZumpKfCBgiv
         bgeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789692831; x=1790297631;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pChmIbk5dvBz2x+ATGHEFGjZSAwLQf4D4OxFleYq/PI=;
        b=RMST5UQmM1v1h3W2w50y3L1ke51pJsT9DotUr74rOFGyMrNSnZPdYFFq1euXdzJkJ9
         P5Lkj/Qo4Sk3y7OC6BP3NjBaNXIIh5ECX0ILLjCCxJeq0QD+dX0c/jHtHeggznzADels
         6gXx+6M6KA00HnO6E8ns6WH+YiuzUkqigSfbnncU/JXwJFjtjdVNEfCNS3e+OJxBfz2O
         DicieELPXEL2MzWvdMa0f+k+LBzS5Ft6JOARr4sCvkaF50xdv6WRI9xYpgF4Ua5OjW/q
         89otMWkxXFqAGmnve+GlbgXuY6OBByCna2YAbuwwDNHmSzH+CS9FI2BHx/PnjYuPFJP2
         nLOQ==
X-Forwarded-Encrypted: i=1; AKwUvByCAe9+s2oFEXIecfUjvw5qxh3qRz37QYaCTYDtuTOOk7yKayxZEHbMZ6FTOl4O/FPzjd5twuWUcQC36/g=@vger.kernel.org
X-Gm-Message-State: AFuF++kzVUGalHg30ycqNWlaK/LyC+iTvE4lLWDkt5xOaiUhJruP9IOX
	UAm7abn3DZ6ayj6adDjMY77+3AP7K0qBrVNX3UCsHBInI/37xzawO9DRs0avqUdPdhhp7egskqt
	HrEzrT1/yw3H2BDjPagpl2dCse3nP/LcxbiO7Qt6yQ5JxM2KpAD4YAHpOR3k=
X-Gm-Gg: AYBFou2PCBJynZIwMDoK8LlyRroSugXFiC2yAaL6o9SsWuhVigQmZ1X19h/Qtb/W0E0
	Lt6d2h/sr/VKBDWdQNYsSSyOohdkCqu2HGmjrUs6atRrxj6HKpPue0wDE3Wu96jwaTzIdsOJgPc
	cy4dmMW+NUvn9alD17uLMzvcZflx6+13fqtK5zSN5fjTpNu2tjtfy/ujSL9H2cgw45c9dHLPn/L
	qvqPqPuxSD/xALOT+K1TFbLO0jgCkFIzKuv+vxX2ckFjqGN14yVbN8CrI1mZyKjb0VYeZAe88m2
	XkOu5kxhfRKyEV0QyedZM53WDqp2pCWxdmOIJDyqGajqvhj/N1Lmt7OQPvz1sVBT
X-Received: by 2002:a05:622a:649:b0:52f:9ed4:8d74 with SMTP id
 d75a77b69052e-5329d7ebce3mr7543761cf.14.1789692830152; Thu, 17 Sep 2026
 17:53:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915070001.113559-1-hao.ge@linux.dev> <20260915070001.113559-6-hao.ge@linux.dev>
In-Reply-To: <20260915070001.113559-6-hao.ge@linux.dev>
From: Suren Baghdasaryan <surenb@google.com>
Date: Thu, 17 Sep 2026 17:53:39 -0700
X-Gm-Features: AcwNN1VY0P1eKa2RzQfSlte4wi4uAKsbNqye2Ulhzad_L0NMHnJfbc2fVWd5zEE
Message-ID: <CAJuCfpFKGxOy9W+ZY9KasU5YaDVG4kbGsV6AYb2NNRyW4gT0mw@mail.gmail.com>
Subject: Re: [PATCH v10 5/6] alloc_tag: skip percpu counter allocation when
 profiling is disabled
To: Hao Ge <hao.ge@linux.dev>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Aaron Tomlin <atomlin@atomlin.com>, Kent Overstreet <kent.overstreet@linux.dev>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-modules@vger.kernel.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Sashiko <sashiko-bot@kernel.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2026 at 11:59=E2=80=AFPM Hao Ge <hao.ge@linux.dev> wrote:
>
> After shutdown_mem_profiling() clears mem_profiling_support,
> needs_section_mem() returns false, so later modules have their codetag
> section placed as regular data and never enter the alloc_tag maple tree.
> codetag_load_module() still called load_module(), which allocated a percp=
u
> counter for every tag; release_module_tags() could not find these modules
> on unload, so the counters leaked.
>
> Return -EOPNOTSUPP from load_module() when profiling is off:
> codetag_module_init() drops the module's cmod, no counters are allocated
> and the module loads without its tags. codetag_unload_module() now always
> calls free_section_mem(), since a module whose module_load() returned
> -EOPNOTSUPP is not in the idr but may still hold a reserved section.
>
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Fixes: 4835f747d3ed ("alloc_tag: support for page allocation tag compress=
ion")
> Cc: stable@vger.kernel.org
> Suggested-by: Suren Baghdasaryan <surenb@google.com>
> Acked-by: Suren Baghdasaryan <surenb@google.com>

Yeah, I guess I didn't think about alternatives...

When mem_profiling_support=3Dfalse, why can't load_module() skip
allocating percpu counters, zero out the whole area between start_tag
and stop_tag and return 0 as success (mem_profiling_support is not
enabled, so we acted accordingly)?
Module will be added into maple tree and later codetag_unload_module()
will find the module, call release_module_tags() (which is a NOOP
because tag->counter=3D=3DNULL) and finally call free_section_mem(). This
seems more natural than special-casing with EOPNOTSUPP. WDYT?

> Signed-off-by: Hao Ge <hao.ge@linux.dev>
> ---
>  lib/codetag.c  | 10 ++++++++--
>  mm/alloc_tag.c |  4 ++++
>  2 files changed, 12 insertions(+), 2 deletions(-)
>
> diff --git a/lib/codetag.c b/lib/codetag.c
> index a9cda4c962a3..a0b600720afc 100644
> --- a/lib/codetag.c
> +++ b/lib/codetag.c
> @@ -240,7 +240,9 @@ static int codetag_module_init(struct codetag_type *c=
ttype, struct module *mod)
>
>         if (err < 0) {
>                 kfree(cmod);
> -               return err;
> +               /* -EOPNOTSUPP means we can load the module without its t=
ag. */
> +               if (err !=3D -EOPNOTSUPP)
> +                       return err;
>         }
>
>         return 0;
> @@ -388,7 +390,11 @@ void codetag_unload_module(struct module *mod)
>                         ++cttype->content_id;
>                 }
>                 up_write(&cttype->mod_lock);
> -               if (found && cttype->desc.free_section_mem)
> +               /*
> +                * A module whose module_load() returned -EOPNOTSUPP is n=
ot
> +                * in the idr but may still hold reserved section memory.
> +                */
> +               if (cttype->desc.free_section_mem)
>                         cttype->desc.free_section_mem(mod, true);
>         }
>         mutex_unlock(&codetag_lock);
> diff --git a/mm/alloc_tag.c b/mm/alloc_tag.c
> index 5836803898ad..1ca0409b492b 100644
> --- a/mm/alloc_tag.c
> +++ b/mm/alloc_tag.c
> @@ -988,6 +988,10 @@ static int load_module(struct module *mod, struct co=
detag *start, struct codetag
>         struct alloc_tag *stop_tag;
>         struct alloc_tag *tag;
>
> +       /* Profiling disabled: load the module without its tags. */
> +       if (!mem_profiling_support)
> +               return -EOPNOTSUPP;
> +
>         /* percpu counters for core allocations are already statically al=
located */
>         if (!mod)
>                 return 0;
> --
> 2.25.1
>
