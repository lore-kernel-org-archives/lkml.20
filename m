Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B52BF471404
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 18:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791138257; cv=pass; b=TjABtdfUAbCwCPWk6ThX1poiejCnQjO4i1SrEaGI2CyjkbR3ZfshWsWecms2qehqTFluADLUqEETn0nfe4Uv4FWjwZEZsITcr2SBxCIURQ+9YiUeBc1EcAMlckMcnt3NKJUfLPTz61gXv9QrU+mo2NgO+0jKlNBt2JEzhVq3Jsg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791138257; c=relaxed/simple;
	bh=zLwoLrxRD9bnB1A5PWyAC+jyBSiDyJrolS6BO3uVX+k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gZh5JYSplWv9iwZrlGI4+bBuPGXdA6ITWGyu49b+V3fpCxyjfQ1QBZ7Z8DOcKa1oyE1RG4OLJS3HaY1tPNHMCs7qTt9BF2FlkUyT+MwCrrDgLYBE9wk8Ftm/Cf0aXoW5jbn5Nao1UNuicF8g7DzoWuAtbm7QB+TN0SW3GPwpTRw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=e9NB+9gI; arc=pass smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="e9NB+9gI"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6afac79b3a3so5644a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 11:24:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791138254; cv=none;
        d=google.com; s=arc-20260327;
        b=PP345Xe2remn/rrrfT2tWQlJmM2R6PELPSFwzWlvTu4HWznXZBwix1gXZ4dwlek75W
         wCmvlET8hWkht7ztSdwn1ioQsEbeQpQasvfmc0Tdy+vPwaIC0cPVkhWJBt/yscWe2Zou
         Z0Ug/ZTx1pbivx3rmSQJg7vlUcbxkiU65SYBt5qfRQUObBYqt+KMsELzXNxic4UdQIJH
         iQUfTIMiI+lA4/kewuiubF3U+Fj61zF/COPXYiby1zBiFZ96ZE7f66exe9txOIocEYEd
         gOVBD0Zu3saG+N30tWkRuzuup9CkNjv7tYSxnLQOHJKnLxAf4/vu2NGrxMOQ9wBxYu4S
         ijQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+kvayuBhXRE2GquXHfPa/A7+zWFdbc7YesX/WrD9SmY=;
        fh=FScfq3SHvOu2N6FIGKUn3i9mx6yF+4Bxou6kDBquX2Y=;
        b=QdL2jLaDlOUDXiUHLKSnJVK9KZOJO97Q7XhLyFZ0Sq9MyezzLSliP26d7llNk3lL5+
         5uw1jqY2thrmNPHejjBGYbPARCXWYFjQhzQH6fxl0V3oe9JiABgBYSGOAokAoWmg7s5W
         MAAvQeJt7KR+/L8mB1oiCQhDQeJXFWCFq2HamQ+NokfUd+TFE65r+wyOb1GTcsbTx3fh
         hWDWVPyLF/vzy2u6bnqCMiFtl8Iey4qjttCUlIaIX5Bc4afedArHM8Yea84Rbv746M27
         r4xbKfijQGWg3jJ9UJosUHce+aHn9zGEFRgFETXGsTOraXGWf974IADPTrVCDWfqezmf
         JTxw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791138254; x=1791743054; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+kvayuBhXRE2GquXHfPa/A7+zWFdbc7YesX/WrD9SmY=;
        b=e9NB+9gIoM4uA2CHvRW0/2Nk3hptMSh640cVkBS1gZauPadKna8ayfo4ezmWPpB9bd
         uMT83RMJfX4N9nfG7+USOcHLQ88QoDLPWu/+1/web98ZuNt6x7WuDqJNKHYBO0imTz1n
         7XOyUcWjLg0bwrbQsuxrGO8DY4I3VCqmnqTDXzWNBKi8jAlZm30RByV05iJyzwMxmU8v
         GM8gbvnxcGjvLT1zXjnuQ3TTvXkQMbCcSbl69NmA0fMYlQj+lXuZ/AYirYpBHQp8yWif
         bRp2WcRA5TeRXNanwihcMdm4Hesw2fsEq6/Nd7XHMccKnW1HbN6g+z/A3YkxUPPBuR+Z
         VTSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791138254; x=1791743054;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+kvayuBhXRE2GquXHfPa/A7+zWFdbc7YesX/WrD9SmY=;
        b=QsTVJQGyMpAaeQpjN37dWWT8fCubCLEWCDRpFJCmMqviIh8DZLj7BfI6ftpGAj2YQ2
         NYPUMUHaxSfL9/Omg+/DJA8cdVUIcyyQ1pA0W1oVXN4hGxj/eHFY0CVgUE3hpkm+8qOy
         OiX/8QUdI8f039TXnx0xuux/mXVLttRzUy9+Uta0iRGReH/cbfGUNcgElk2/ZQAIIR7u
         xqryQwjPgFZ+3I1g1NH7wrPjXdkjysyzHl5kxcrHRHdFtFLpdhk/+ZNugkWGobzL4mLD
         NWNQpuLLyDFXszdgKe9p0z8b/g13IvIPeFge7uTMi/PlhDUiFMJMo8ifH3fUYoz2Abvu
         8y3Q==
X-Forwarded-Encrypted: i=1; AKwUvBxkg3OpqaGPEskXTTiUENE0Hj2W3EDUEbv6N1b0+oZLaHPikdiGhckNBAdkV+0eNnzjM4tSnyuDq7IM4Rw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLJOExevB/KYOMWjwWMED3rJ8vO32vv3amZm7WD6Yd8/zBDpKE/
	HkclMZveheF/U3uKQxEUQ77RBOrol86aa2L/JDKpfyXEDXdrvEL8sdv1yT13lA4irhzF8zSffo/
	H6qFUyhgqzIx2eYP0rHWun2Q5tqc0t/PrZGV1GSek
X-Gm-Gg: AYBFou1jp5k4iNpVserS2x3lXtyKc+E3a3wqJx4J/SEahoHXGYYVDXtZ2PIq7JB/f2V
	xN6dveB6VbkxY8eIask4T+dndYnxH1+W+c1DuOs5dCNaerdDEwAkYbINiSwxVOcSwLsSN6v5ghE
	kUS5eyUW+p2iuCdSMKUqQC6IINTKVK2vID6yKkdINy3P5QY0L7dQIP7m5nBmQR981rwnSV4Jf0i
	Uh66ZV8ymwiliq4sd8plYUQQCa2MKPC8OicbEfQ5T19eKP0YzHqGss2SrOLxrPkn0ysvhFy84Wq
	J5vFZO4QBU+dTOoplQTucz2zEKiUJ+zUzcAbwCSxaMtrzGMQm8+N3LIl
X-Received: by 2002:a05:6402:22d0:b0:6ae:1866:cdfe with SMTP id
 4fb4d7f45d1cf-6afaf69c8dfmr26911a12.11.1791138252600; Sun, 04 Oct 2026
 11:24:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929082014.160587-1-hao.ge@linux.dev> <20260929082014.160587-8-hao.ge@linux.dev>
In-Reply-To: <20260929082014.160587-8-hao.ge@linux.dev>
From: Suren Baghdasaryan <surenb@google.com>
Date: Sun, 4 Oct 2026 20:23:57 +0200
X-Gm-Features: AclHuK86etgyIPJ222To041zNkSoFNgDLomueBKSopElcapCeLMOxFHBtlsBju0
Message-ID: <CAJuCfpEwrdOKQmt9_=J4Qawtg48AUuwwbc2Lp-1oWiNbKO_UVw@mail.gmail.com>
Subject: Re: [PATCH v11 7/7] alloc_tag: fix the /proc/allocinfo lifecycle
To: Hao Ge <hao.ge@linux.dev>
Cc: "=Kent Overstreet" <kent.overstreet@linux.dev>, Luis Chamberlain <mcgrof@kernel.org>, 
	Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Alexander Potapenko <glider@google.com>, 
	Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Vlastimil Babka <vbabka@kernel.org>, Michal Hocko <mhocko@suse.com>, 
	Brendan Jackman <brendan.jackman@linux.dev>, Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>, 
	Uladzislau Rezki <urezki@gmail.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-modules@vger.kernel.org, kasan-dev@googlegroups.com, 
	Sashiko <sashiko-bot@kernel.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 29, 2026 at 10:20=E2=80=AFAM Hao Ge <hao.ge@linux.dev> wrote:
>
> shutdown_mem_profiling() calls remove_proc_entry() from
> reserve_module_tags(), which runs under mod_lock held for write.
> remove_proc_entry() waits for readers, and a reader takes mod_lock for
> read in allocinfo_start():
>
>   CPU0 (insmod)                      CPU1 (read /proc/allocinfo)
>   ----------------                   ----------------------------
>   reserve_module_tags()
>     down_write(&mod_lock)  [held]
>                                      use_pde()            [in_use++]
>                                      allocinfo_start()
>                                        down_read(&mod_lock)  <- blocks
>     shutdown_mem_profiling()
>       remove_proc_entry()
>         wait for in_use =3D=3D 0         <- blocks
>
> Move remove_proc_entry() to a workqueue.
>
> The deferred removal also affects alloc_tag_init(). The file is
> created before the type, so on a failure it is still there with
> alloc_tag_cttype NULL or an error pointer, and a reader panics in
> allocinfo_start(). Create the file at the end of alloc_tag_init()
> instead, a failed init leaves nothing behind.
>
> If proc_create() fails, the codetag type and the module tags memory
> leak. Call codetag_unregister_type() and free the memory.
>
> alloc_tag_cttype can now be freed at runtime. alloc_tag_top_users()
> reads it from __show_mem() without locks, read the pointer under
> rcu_read_lock() and take mod_lock before dropping the RCU lock, the
> type stays alive until then. The only caller never sleeps, drop the
> can_sleep argument.
>
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Fixes: 4835f747d3ed ("alloc_tag: support for page allocation tag compress=
ion")
> Cc: stable@vger.kernel.org
> Signed-off-by: Hao Ge <hao.ge@linux.dev>
> ---
>  include/linux/alloc_tag.h |  2 +-
>  include/linux/codetag.h   |  2 ++
>  lib/codetag.c             | 26 ++++++++++++++++++++
>  mm/alloc_tag.c            | 52 +++++++++++++++++++++++++++------------
>  mm/show_mem.c             |  2 +-
>  5 files changed, 66 insertions(+), 18 deletions(-)
>
> diff --git a/include/linux/alloc_tag.h b/include/linux/alloc_tag.h
> index 7f2d80a59792..852dc10c00ee 100644
> --- a/include/linux/alloc_tag.h
> +++ b/include/linux/alloc_tag.h
> @@ -81,7 +81,7 @@ struct codetag_bytes {
>         s64 bytes;
>  };
>
> -size_t alloc_tag_top_users(struct codetag_bytes *tags, size_t count, boo=
l can_sleep);
> +size_t alloc_tag_top_users(struct codetag_bytes *tags, size_t count);
>
>  static inline struct alloc_tag *ct_to_alloc_tag(struct codetag *ct)
>  {
> diff --git a/include/linux/codetag.h b/include/linux/codetag.h
> index a25a085c2df1..0c4e0337b474 100644
> --- a/include/linux/codetag.h
> +++ b/include/linux/codetag.h
> @@ -87,6 +87,8 @@ void codetag_to_text(struct seq_buf *out, struct codeta=
g *ct);
>  struct codetag_type *
>  codetag_register_type(const struct codetag_type_desc *desc);
>
> +void codetag_unregister_type(struct codetag_type *cttype);
> +
>  #if defined(CONFIG_CODE_TAGGING) && defined(CONFIG_MODULES)
>
>  bool codetag_needs_module_section(struct module *mod, const char *name,
> diff --git a/lib/codetag.c b/lib/codetag.c
> index a0b600720afc..46d0904b08b3 100644
> --- a/lib/codetag.c
> +++ b/lib/codetag.c
> @@ -429,3 +429,29 @@ codetag_register_type(const struct codetag_type_desc=
 *desc)
>
>         return cttype;
>  }
> +
> +/**
> + * codetag_unregister_type - unregister a codetag type
> + * @cttype: the codetag type to unregister
> + *
> + * Undo codetag_register_type() and free @cttype. The caller must make
> + * sure no lockless reader still uses @cttype, e.g. clear the pointer
> + * to it and wait for an RCU grace period first.
> + */
> +void __init codetag_unregister_type(struct codetag_type *cttype)
> +{
> +       struct codetag_module *cmod;
> +       unsigned long id, tmp;
> +
> +       mutex_lock(&codetag_lock);
> +       list_del(&cttype->link);
> +       mutex_unlock(&codetag_lock);
> +
> +       down_write(&cttype->mod_lock);
> +       idr_for_each_entry_ul(&cttype->mod_idr, cmod, tmp, id)
> +               kfree(cmod);
> +       idr_destroy(&cttype->mod_idr);
> +       up_write(&cttype->mod_lock);
> +
> +       kfree(cttype);
> +}
> diff --git a/mm/alloc_tag.c b/mm/alloc_tag.c
> index ba8a651769e3..b9af5fe5bba2 100644
> --- a/mm/alloc_tag.c
> +++ b/mm/alloc_tag.c
> @@ -15,6 +15,7 @@
>  #include <linux/seq_file.h>
>  #include <linux/string_choices.h>
>  #include <linux/vmalloc.h>
> +#include <linux/workqueue.h>
>  #include <linux/kmemleak.h>
>  #include <uapi/linux/alloc_tag.h>
>
> @@ -484,22 +485,28 @@ static const struct proc_ops allocinfo_proc_ops =3D=
 {
>  #endif
>  };
>
> -size_t alloc_tag_top_users(struct codetag_bytes *tags, size_t count, boo=
l can_sleep)
> +size_t alloc_tag_top_users(struct codetag_bytes *tags, size_t count)
>  {
>         struct codetag_iterator iter;
> +       struct codetag_type *cttype;
>         struct codetag *ct;
>         struct codetag_bytes n;
>         unsigned int i, nr =3D 0;
> +       bool locked;
>
> -       if (IS_ERR_OR_NULL(alloc_tag_cttype))
> +       rcu_read_lock();
> +       cttype =3D READ_ONCE(alloc_tag_cttype);

Code looks correct to me but if you are changing alloc_tag_cttype to
be accessed under RCU, then you should declare it as __rcu and use
rcu_assign_pointer()/rcu_access_pointer()/rcu_dereference()/rcu_dereference=
_protected().

> +       if (IS_ERR_OR_NULL(cttype)) {
> +               rcu_read_unlock();
>                 return 0;
> +       }
>
> -       if (can_sleep)
> -               codetag_lock_module_list(alloc_tag_cttype);
> -       else if (!codetag_trylock_module_list(alloc_tag_cttype))
> +       locked =3D codetag_trylock_module_list(cttype);
> +       rcu_read_unlock();
> +       if (!locked)
>                 return 0;
>
> -       iter =3D codetag_get_ct_iter(alloc_tag_cttype);
> +       iter =3D codetag_get_ct_iter(cttype);
>         while ((ct =3D codetag_next_ct(&iter))) {
>                 struct alloc_tag_counters counter =3D alloc_tag_read(ct_t=
o_alloc_tag(ct));
>
> @@ -520,7 +527,7 @@ size_t alloc_tag_top_users(struct codetag_bytes *tags=
, size_t count, bool can_sl
>                 }
>         }
>
> -       codetag_unlock_module_list(alloc_tag_cttype);
> +       codetag_unlock_module_list(cttype);
>
>         return nr;
>  }
> @@ -591,6 +598,13 @@ void pgalloc_tag_swap(struct folio *new, struct foli=
o *old)
>         put_page_tag_ref(handle_new);
>  }
>
> +static void remove_allocinfo_file(struct work_struct *work)
> +{
> +       remove_proc_entry(ALLOCINFO_FILE_NAME, NULL);
> +}
> +
> +static DECLARE_WORK(remove_allocinfo_work, remove_allocinfo_file);
> +
>  static void shutdown_mem_profiling(bool remove_file)
>  {
>         if (mem_alloc_profiling_enabled())
> @@ -600,7 +614,7 @@ static void shutdown_mem_profiling(bool remove_file)
>                 return;
>
>         if (remove_file)
> -               remove_proc_entry(ALLOCINFO_FILE_NAME, NULL);
> +               schedule_work(&remove_allocinfo_work);
>         mem_profiling_support =3D false;
>  }
>
> @@ -1351,16 +1365,10 @@ static int __init alloc_tag_init(void)
>                 return 0;
>         }
>
> -       if (!proc_create(ALLOCINFO_FILE_NAME, 0400, NULL, &allocinfo_proc=
_ops)) {
> -               pr_err("Failed to create %s file\n", ALLOCINFO_FILE_NAME)=
;
> -               shutdown_mem_profiling(false);
> -               return -ENOMEM;
> -       }
> -
>         res =3D alloc_mod_tags_mem();
>         if (res) {
>                 pr_err("Failed to reserve address space for module tags, =
errno =3D %d\n", res);
> -               shutdown_mem_profiling(true);
> +               shutdown_mem_profiling(false);
>                 return res;
>         }
>
> @@ -1368,10 +1376,22 @@ static int __init alloc_tag_init(void)
>         if (IS_ERR(alloc_tag_cttype)) {
>                 pr_err("Allocation tags registration failed, errno =3D %p=
e\n", alloc_tag_cttype);
>                 free_mod_tags_mem();
> -               shutdown_mem_profiling(true);
> +               shutdown_mem_profiling(false);
>                 return PTR_ERR(alloc_tag_cttype);
>         }
>
> +       if (!proc_create(ALLOCINFO_FILE_NAME, 0400, NULL, &allocinfo_proc=
_ops)) {
> +               struct codetag_type *cttype =3D alloc_tag_cttype;
> +
> +               pr_err("Failed to create %s file\n", ALLOCINFO_FILE_NAME)=
;
> +               shutdown_mem_profiling(false);
> +               WRITE_ONCE(alloc_tag_cttype, NULL);
> +               synchronize_rcu();
> +               codetag_unregister_type(cttype);
> +               free_mod_tags_mem();
> +               return -ENOMEM;
> +       }
> +
>         return 0;
>  }
>  module_init(alloc_tag_init);
> diff --git a/mm/show_mem.c b/mm/show_mem.c
> index b938cbcd774a..a2e710404a48 100644
> --- a/mm/show_mem.c
> +++ b/mm/show_mem.c
> @@ -439,7 +439,7 @@ void __show_mem(unsigned int filter, const nodemask_t=
 *nodemask,
>                 struct codetag_bytes tags[10];
>                 size_t i, nr;
>
> -               nr =3D alloc_tag_top_users(tags, ARRAY_SIZE(tags), false)=
;
> +               nr =3D alloc_tag_top_users(tags, ARRAY_SIZE(tags));
>                 if (nr) {
>                         pr_notice("Memory allocations (profiling is curre=
ntly turned %s):\n",
>                                 mem_alloc_profiling_enabled() ? "on" : "o=
ff");
> --
> 2.25.1
>
