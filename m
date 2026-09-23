Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7700537F301
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 02:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790131314; cv=pass; b=QaiuiSy1EsP8tBTKafmXybDVzB5w5J95CZmGn7e0qFtWHPwV77tP73q+F8+ctJH0/YrIeJf6sQ4wi8baBbKluhLRF11dw8mdFiqjRzBjMwxzBgnqtjM+8+XX05c+pD0ug9t7G5f6UFbYaUncramsV1FHtIsNz4TbY+YgLUOplW8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790131314; c=relaxed/simple;
	bh=NIu+NeDM/UfBH3wljgY3yC8VLjhCj1QmSfsdQ3mVeIg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=elCkXu1K67vrR0HFSRwriYGDTZZwLzZtPtCjPzLBT9BZuA6LD+1ote0S8IrBcN2T9pYOMIVzgf4Z7Nfgkp2cZVek9F+V5qO2b08euXSMiCj2Z/ATCTP4XCYcl6rEuiqofj9R+tUElm1jVM2Q+wW4q/inxdpaqb0MQNDXV2vY/EU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DT1W02ra; arc=pass smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DT1W02ra"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-530e8c6fb80so72941cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 19:41:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790131311; cv=none;
        d=google.com; s=arc-20260327;
        b=WtUX4xrc2NNw0Md8z2lwJqQXRQZfzvVVBB/I7T/6ciwN4t65wdQGWQxC0Hh8vWY2zD
         bYmvYtD+q6yvTm281rDbcksqNILCdxWlrsuLJpzrLyLx4E3ou1QlCNVTFgJvjLK7Dhxz
         hlzUzFQnUUY8pqvXVo67cRLUUTK6lkGeWtxvMGYpJyK7llRzEFdSeqKj4o9YGpLfi4QN
         D8T+Vy3aF87AWACCKKMq8JSPaRKGvIUSo+mV3JatR0BnuojiauUFeAbAAY7OSCQNY5ow
         oA0QpdgUTd9gGSda7x6A7mFO7BZLQDH5/MLjL1bbE1uNiiLW//+WMIOVDUGsmA+yA6uM
         l9WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aMdgikVEgbwQAqoDuHQqMGEpgmnZ1PYCVyMsDBPWuTQ=;
        fh=e0wRUotPWZvQkSgOip3Gd3t6V6dOoL4l+uOld6+kOro=;
        b=oFnv0Y5wf8vk1/Fw7Y2Kc/lHt0sNdV1p6OohvIyZlDQ1IDodM0Ho18/jR2TRk8T3ou
         FH8T/VUeRr97W6j3zPvm1z6Q2VtoqK0Hlz+hGWciX6uyGUZJeDvBMrMX0GwiSt8Z4DEU
         g+50Dj4NCq+N0ljPnQnMNQ5jX7eCgmg5knlL+rIh+64HcizV4JaUHUC69WuBZlczPfcJ
         BIYkOolCRaKY/NTam6goJIXBGF117syb+VRVr6EXPwh327l+EMan8uJS7YUTgAJqsbPK
         bK0qbL94TJrN/zuyRxF2/7nc9RHwtLTk0jAuhslc8cZlMcMUTiolCWveo2wCC8p1bssu
         aW8g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790131311; x=1790736111; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aMdgikVEgbwQAqoDuHQqMGEpgmnZ1PYCVyMsDBPWuTQ=;
        b=DT1W02raeS+hW3/C1qSNjqMVjIf3NWcnvGst835THgTfuVngPpweTSbAKXN+8hSfTQ
         bmaB+dHOo6kYGpw1iWMu2jFHoadhOGxgrUlmuGoHMBz1mLRndAZYWhcazqXWq81PpYH0
         7sxOQUwCya+l0hbC6pxo9YNHrwZnLwelw0hQ5Rysz0N/OwAFCyWAy3MiqNjG7gLcBi+U
         djHrcKyK7OykriXa8hK0rRVP66po9CfZlInugkTtaCV3JFcra3chljhd7TND9z6GpNkT
         sYlgwBxWw+hLXk20W4mxpkz2WyMw5CinpNof+pkd/g5nNugowpwNzfpSuwE0PWdnWUY5
         kF6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790131311; x=1790736111;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aMdgikVEgbwQAqoDuHQqMGEpgmnZ1PYCVyMsDBPWuTQ=;
        b=r9aeFvd66J/SDTFDkvM0ACEeFn/ki2EGMGHYfFIrCQvnx5pJguJKDjHaXxfSCOCop9
         hia90chxBGeaCt5H/BM/nHIfQUtV71vrcJmbO7vR+KehLqP2FL4TfOhZs4NDz8r3pp6U
         Oo8L+BjGrphRnCkmVnuvWKhwmNyXeIwiqaqmhkAUl0TyN/MmnBmEOQflF1u4DkNs3Yki
         5hH8RGIsZi6AFQL/eDMmpxcAVwyS0PlOs2hnQqH+iu1gm6UAb/27Jbv3jn4oK4ErTbse
         2gTMimciqfmWs412rdkkcb3Niq9FDqlqzpqAdK2GCiPygcuBzx9Ii3NJCbhc41NEomrw
         dmvQ==
X-Forwarded-Encrypted: i=1; AKwUvBw1BMdiblAZYC5WiC+I9f4KkDrgWZ9c0eIwXzHuNEd020IT5srD39nzwYfPxcF5qreM5Ge6TJ3oDI2Numg=@vger.kernel.org
X-Gm-Message-State: AFuF++ksj4nz2OJHfxmCyKLVsv6sXh2wMWFRoLSspKt9y6ZGepUGrgQE
	GiibClMvDAekbOxmbXfMEYXD5b1Vz1HA4umceCSU0kXmTvbzrjYNTQ9iQI8UTZcgJWboyl+COyt
	g7DOKRAgyVBFwSeJ7v4mfYhC0VvCG96cTlfdgaLkV
X-Gm-Gg: AYBFou0327SEAmnJAMWiowBCMKna/XcvI5OpyiHcLMt8ccotMBGdfNWQ7PmADei8Y1J
	U3mO/juk8VM0aHZE4iZEUVwx3Ons6fRnbe4zmmIu2E15VkF2lj8CrWu09BowmW6mjSrL8171gXI
	SittAz/+uYAJ9/ZQSGJ2uIo+1lR3p4oTYKQOPF59xbEGiDPaWzWr/1DfwGPEF59qwt7vBxz7pCn
	KZsIUHtDrRruLAc0o1fDBNSpx/zanzQuruasqShqcUdfsJOvTL2uT3O1uunPtePBEprYiNS1oiV
	aswxuRaGtym/bnDTYK0yZsRSS96sh1NGhDlCpLNDH/w17xi0dwoCDQ==
X-Received: by 2002:a05:622a:8307:b0:532:c8ca:5ae9 with SMTP id
 d75a77b69052e-532ef021d41mr3289381cf.11.1790131310427; Tue, 22 Sep 2026
 19:41:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915070001.113559-1-hao.ge@linux.dev> <20260915070001.113559-7-hao.ge@linux.dev>
 <CAJuCfpGMQqjHsAvW=XUA1Q3AyaVJKM2bKYVja_fgn0wa1tk7DA@mail.gmail.com> <d7327cdd-43df-46f8-92d4-c25dda7ae684@linux.dev>
In-Reply-To: <d7327cdd-43df-46f8-92d4-c25dda7ae684@linux.dev>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 22 Sep 2026 19:41:38 -0700
X-Gm-Features: AclHuK8G_VNDItmD1FBLXjWgMC7CO-sPt9k4BV7Zop_hKhE8VPUN1FVpIu4Rkf8
Message-ID: <CAJuCfpHMdZzJNSRgysbS7vOBmTwEPSYfPYUvt_5+uZ-Ydvw+hw@mail.gmail.com>
Subject: Re: [PATCH v10 6/6] alloc_tag: Defer /proc/allocinfo removal to a workqueue
To: Hao Ge <hao.ge@linux.dev>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Aaron Tomlin <atomlin@atomlin.com>, Kent Overstreet <kent.overstreet@linux.dev>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-modules@vger.kernel.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Sashiko <sashiko-bot@kernel.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2026 at 6:38=E2=80=AFPM Hao Ge <hao.ge@linux.dev> wrote:
>
> Hi Suren
>
>
> On 2026/9/18 09:09, Suren Baghdasaryan wrote:
> > On Mon, Sep 14, 2026 at 11:59=E2=80=AFPM Hao Ge <hao.ge@linux.dev> wrot=
e:
> >>
> >> shutdown_mem_profiling() calls remove_proc_entry() from
> >> reserve_module_tags(), which runs under mod_lock held for write.
> >> remove_proc_entry() waits for readers, and a reader takes mod_lock for
> >> read in allocinfo_start():
> >>
> >>   CPU0 (insmod)                      CPU1 (read /proc/allocinfo)
> >>   ----------------                   ----------------------------
> >>   reserve_module_tags()
> >>     down_write(&mod_lock)  [held]
> >>                                      use_pde()            [in_use++]
> >>                                      allocinfo_start()
> >>                                        down_read(&mod_lock)  <- blocks
> >>     shutdown_mem_profiling()
> >>       remove_proc_entry()
> >>         wait for in_use =3D=3D 0         <- blocks
> >>
> >> Move remove_proc_entry() to a workqueue.
> >>
> >> The file creation is moved to the end of alloc_tag_init() as well.
> >> If alloc_tag_init() fails with alloc_tag_cttype still NULL or an
> >> error pointer, a concurrent reader of the leftover file would
> >> dereference it in allocinfo_start() and panic.
> >>
> >> Reported-by: Sashiko <sashiko-bot@kernel.org>
> >> Fixes: 4835f747d3ed ("alloc_tag: support for page allocation tag compr=
ession")
> >> Cc: stable@vger.kernel.org
> >> Signed-off-by: Hao Ge <hao.ge@linux.dev>
> >> ---
> >>  mm/alloc_tag.c | 26 +++++++++++++++++---------
> >>  1 file changed, 17 insertions(+), 9 deletions(-)
> >>
> >> diff --git a/mm/alloc_tag.c b/mm/alloc_tag.c
> >> index 1ca0409b492b..cfa0fc84b68f 100644
> >> --- a/mm/alloc_tag.c
> >> +++ b/mm/alloc_tag.c
> >> @@ -15,6 +15,7 @@
> >>  #include <linux/seq_file.h>
> >>  #include <linux/string_choices.h>
> >>  #include <linux/vmalloc.h>
> >> +#include <linux/workqueue.h>
> >>  #include <linux/kmemleak.h>
> >>  #include <uapi/linux/alloc_tag.h>
> >>
> >> @@ -591,6 +592,13 @@ void pgalloc_tag_swap(struct folio *new, struct f=
olio *old)
> >>         put_page_tag_ref(handle_new);
> >>  }
> >>
> >> +static void remove_allocinfo_file(struct work_struct *work)
> >> +{
> >> +       remove_proc_entry(ALLOCINFO_FILE_NAME, NULL);
> >> +}
> >> +
> >> +static DECLARE_WORK(remove_allocinfo_work, remove_allocinfo_file);
> >> +
> >>  static void shutdown_mem_profiling(bool remove_file)
> >>  {
> >>         if (mem_alloc_profiling_enabled())
> >> @@ -600,7 +608,7 @@ static void shutdown_mem_profiling(bool remove_fil=
e)
> >>                 return;
> >>
> >>         if (remove_file)
> >> -               remove_proc_entry(ALLOCINFO_FILE_NAME, NULL);
> >> +               schedule_work(&remove_allocinfo_work);
> >>         mem_profiling_support =3D false;
> >>  }
> >>
> >> @@ -1358,16 +1366,10 @@ static int __init alloc_tag_init(void)
> >>                 return 0;
> >>         }
> >>
> >> -       if (!proc_create(ALLOCINFO_FILE_NAME, 0400, NULL, &allocinfo_p=
roc_ops)) {
> >> -               pr_err("Failed to create %s file\n", ALLOCINFO_FILE_NA=
ME);
> >> -               shutdown_mem_profiling(false);
> >> -               return -ENOMEM;
> >> -       }
> >> -
> >>         res =3D alloc_mod_tags_mem();
> >>         if (res) {
> >>                 pr_err("Failed to reserve address space for module tag=
s, errno =3D %d\n", res);
> >> -               shutdown_mem_profiling(true);
> >> +               shutdown_mem_profiling(false);
> >>                 return res;
> >>         }
> >>
> >> @@ -1375,10 +1377,16 @@ static int __init alloc_tag_init(void)
> >>         if (IS_ERR(alloc_tag_cttype)) {
> >>                 pr_err("Allocation tags registration failed, errno =3D=
 %pe\n", alloc_tag_cttype);
> >>                 free_mod_tags_mem();
> >> -               shutdown_mem_profiling(true);
> >> +               shutdown_mem_profiling(false);
> >>                 return PTR_ERR(alloc_tag_cttype);
> >>         }
> >>
> >> +       if (!proc_create(ALLOCINFO_FILE_NAME, 0400, NULL, &allocinfo_p=
roc_ops)) {
> >> +               pr_err("Failed to create %s file\n", ALLOCINFO_FILE_NA=
ME);
> >> +               shutdown_mem_profiling(false);
> >
> > You need free_mod_tags_mem() here.
> >
>
> Right. Another problem is exposed here: moving proc_create() to the end
> implies successful return from codetag_register_type(),
> so alloc_tag is already added into codetag_types.
> That looks a bit odd to me. Because all places inside codetag that access=
 this
> linked list will access this incompletely=E2=80=91initialized codetag_typ=
e.
> There is currently no matching unregister interface to tear it down.
> So I drafted one previously:
> void codetag_unregister_type(struct codetag_type *cttype)
> {
>         struct codetag_module *cmod;
>         unsigned long id, tmp;
>
>         mutex_lock(&codetag_lock);
>         list_del(&cttype->link);
>         mutex_unlock(&codetag_lock);
>
>         codetag_lock_module_list(cttype);
>         idr_for_each_entry_ul(&cttype->mod_idr, cmod, tmp, id)
>                 kfree(cmod);
>         idr_destroy(&cttype->mod_idr);
>         codetag_unlock_module_list(cttype);
>
>         kfree(cttype);
> }
>
> But looking back, do we really need to do this? I'm not so sure.

I think having codetag_unregister_type() would be a good idea. For now
it's used only in this failure case, so we can make it an __init
function and not waste any memory at all.

> I previously thought the issue reported by Sashiko was a false positive,
> and I laid out my thoughts back then:
> https://lore.kernel.org/all/afa606df-3d5b-47c2-9972-f3e0c2e13c12@linux.de=
v/
> and I thought the change would be straightforward, and defensive programm=
ing
> felt acceptable to me, but it turns out to be a little more complex than =
I expected.
>
> Suren, could you help me analyze this? Thank you very much for your valua=
ble feedback
>
> Thanks
> Best Regards
> Hao
>
> >> +               return -ENOMEM;
> >> +       }
> >> +
> >>         return 0;
> >>  }
> >>  module_init(alloc_tag_init);
> >> --
> >> 2.25.1
> >>
