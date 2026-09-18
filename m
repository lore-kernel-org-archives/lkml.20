Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD923B3C1B
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 01:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789693761; cv=pass; b=FPnZS53BCxkzUj0AK8e4wzip0S64hjvIlyi8x42BDzuA7Z3rb3bpjw+a8Zc8h7qP4WPHAcwW0dwb/R9IKwxTiaRd449mWPfdAw82B5UPIsJYFaq8t09q8axqs1kpUAI5CUHEhpm2tG2sX9y5jo9DBSbC7zpqRx9LOJiv1eQ3TK4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789693761; c=relaxed/simple;
	bh=VQGIa5OfAJMQ4r3GsmpmN36ZDjm6tlTvjyCikjUyEUA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VCZVa8aQju6m2YhunYbxDPxwNDjPeOK00EYFUCheSfjzRsIHSwyovdC/6NO6xfKRY4v7EJtAxcfFDUkt40eeC/yYeL7kmcYjK0fho1SuVuMM0LR2Ib92ARcA8PQaVfT3eIqt5PxKdxbS3gfNZGsZ3c5aR+ophKtuVpZsgSj/bLg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=t6Ow9wej; arc=pass smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="t6Ow9wej"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-530e8c6fb80so89031cf.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 18:09:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789693754; cv=none;
        d=google.com; s=arc-20260327;
        b=S1unWe/I6GaCl1l8K4U4SCU8uybZ68F2n2KsCYP7gPOBsVTWGLLZp9GEH8H967qkAY
         ZUwraJplwGd8Bi6UnlIjKmGs87dN7qi+KpybUDUCSfWs7TvNxi1Ygwz2xVxrgdSPlX42
         Z+h0kUXBIgEoQHbd37BGPavtxtZqbXwdHEu5zH5ij+95QSq2RnsZGQ++fPsBoX8owWSo
         5cfTQAjzh4tYcUKcDF+ZEOXf4wrdNtMaob+2ftr4ChZUSS/uIcfWm1JwXuG0csk82PHJ
         8uaPkZiSXDQJJ1UKo2xQSr2j+Y4CvaeyX6AFDMKzHku7OOwSL9yr+ELTfAlN6A5dsnMQ
         XmnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9OH+vRLumsrAn2s1eXS41G1CuSBMFEgYn9wTdjASFyo=;
        fh=702Kg3HGx27ajpkRZMIpiuNKpFgrJT9kwOSvlpkkOaw=;
        b=S4oimYWjnkafUNk1QhnRJNSzrKK8DfS43zULIzfEm/TSYkjrcrUM8KoAOEpGZ/gB42
         oj8K5Zu8twi2YJp5TLgZ0fmEhC1OTPEpI59jDS1xCQ+6OniPwDtEBhZUdy4kcqkbxiSD
         tGywsVYOFGqiOr8coahCBv9Uu/o4HBg12ON4bL8E0Rzk/qZDNkLrO+GuDkQASAH4jECY
         zkS+Trlh2fDD7jE6Q5GOjizN+nkwXKwIR3FS4NC9755/2ce/v3q9xb0lJq79qP+IFQl2
         a51XQDIRWfofFWAgFq1xD9yer5U3HoWIuw06C/CBJpHsoEH/YXUvD6XDKX1RZLOj4Feg
         ZLDw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789693754; x=1790298554; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9OH+vRLumsrAn2s1eXS41G1CuSBMFEgYn9wTdjASFyo=;
        b=t6Ow9wejpsaNY3SU4XpVe+Zw0+ZiIQ09b6+mUxgxsFQx3nC86ClPH4yLjBFJjB8fhR
         5W7gdoCXu+FHW6Lnx7fV/RIUtxwuOTC41T5A3CDR1vecCUfwiyFs807NLZdOGp8pNawr
         JoGzjyOgp2/8sgXPlX0l6PcdzHNA8nYsJyQWlstqJpoLlXjhzQHhCEWup31W47pzOkQt
         5y044f19rSQyXhl3Jgtprq5I9D5vhqhe831v7pd5d3jq1UwCis8gK7WSWG2iUBJEQInD
         teur1dAy00Mx8L4HVGxWhlaMwhqQg9j+Ye0Ksfz0Qp9hQqOHdS1McpiQBWFIAfKv6dY+
         TRdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789693754; x=1790298554;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9OH+vRLumsrAn2s1eXS41G1CuSBMFEgYn9wTdjASFyo=;
        b=F0uT7U/chd9DwPgZtsB8l0RyTuG2TfzkWr/vKyQq2rw54wMfyH5ixdY5rykLukOqPy
         yL9laQ9JqbzYa554y8PWhufKK7nU/K9QtEhv4lLUl18JHCPhmlI2OKd41KPtCTHQCyK4
         OzKYVoaUBaOzX9RKFn32D6cvdIVJDLPGEkOqjtgJF0Br6xgloQrzfkm1wUBgWEWdRvgS
         XrgzCcrjS8TkD8oD1ycqU1rKfZ/ExHvQR6U/dtoQeh4tkZXnq+JQQBK/RmGQX9pyZ5D7
         lRS358WVxlX0pdfh5G8coLslcA1Ahu3PAMMCmN3fTG48q1Bai9ZRBK1mw3jKEhZfGt5g
         ZyRQ==
X-Forwarded-Encrypted: i=1; AKwUvBw9TQS1pptQKgxg6fTZq5DipfA5VToi5HNyYjDnfkf5NTZiBrC9lS90OuI7vJB9KduyM24Uxzsh1ypL2CM=@vger.kernel.org
X-Gm-Message-State: AFuF++kdukXCeQQm2o+JZ7u7bUl7pOlF+20fc9p/EhDmMCabDJhKUESi
	WAPX+sEK1ANh2QjtzPZv3Oyjuohk68mFva+wk4DBwqA2e1WRAe17IlTSy294rBdz3eKGnjJM11m
	BlhVGfXCzLUR1e0COP9jcfKQcCCkCapoGBQYWL487
X-Gm-Gg: AYBFou2jFFvZs8JMXvi1g8H7iAQVrOtEiPZKRzhQGnYtlEJZ4QGUumbfUr5msXQ4++8
	/KZHFqnV80SfHVbyieg18dkdR2GKx6FTxFyywNdTiLW87ImxZxq92wRIq+5ixXhsQSFffMq5OYx
	bncopDJjgER5XOPXBJP4OJZKxxJEHCjD/szIwe+zfNg44RaGCDwH7hL+U8GQUci/wTzlRRwfxEz
	oGINspLilf7DXTm4ZbKd9XGvgVjBwl3zelmdckwVmL3GNqbx72JLx3Ri8aEHJ6vhvgqiSwoX6yL
	lF9rxkmjspL/qd1/eEkePzwB+x0qAKMMr+6rk55TCDxlHg6kN4d4/g==
X-Received: by 2002:a05:622a:2d0:b0:51c:ca9:3d17 with SMTP id
 d75a77b69052e-5329d7a87a3mr7686831cf.12.1789693753565; Thu, 17 Sep 2026
 18:09:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915070001.113559-1-hao.ge@linux.dev> <20260915070001.113559-7-hao.ge@linux.dev>
In-Reply-To: <20260915070001.113559-7-hao.ge@linux.dev>
From: Suren Baghdasaryan <surenb@google.com>
Date: Thu, 17 Sep 2026 18:09:02 -0700
X-Gm-Features: AcwNN1WpdwzfsuEi7atSbmPcBeuY9CTLz0TyEvuZKGkV5swWnf0AU7r2YB5LThc
Message-ID: <CAJuCfpGMQqjHsAvW=XUA1Q3AyaVJKM2bKYVja_fgn0wa1tk7DA@mail.gmail.com>
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

On Mon, Sep 14, 2026 at 11:59=E2=80=AFPM Hao Ge <hao.ge@linux.dev> wrote:
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
> The file creation is moved to the end of alloc_tag_init() as well.
> If alloc_tag_init() fails with alloc_tag_cttype still NULL or an
> error pointer, a concurrent reader of the leftover file would
> dereference it in allocinfo_start() and panic.
>
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Fixes: 4835f747d3ed ("alloc_tag: support for page allocation tag compress=
ion")
> Cc: stable@vger.kernel.org
> Signed-off-by: Hao Ge <hao.ge@linux.dev>
> ---
>  mm/alloc_tag.c | 26 +++++++++++++++++---------
>  1 file changed, 17 insertions(+), 9 deletions(-)
>
> diff --git a/mm/alloc_tag.c b/mm/alloc_tag.c
> index 1ca0409b492b..cfa0fc84b68f 100644
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
> @@ -591,6 +592,13 @@ void pgalloc_tag_swap(struct folio *new, struct foli=
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
> @@ -600,7 +608,7 @@ static void shutdown_mem_profiling(bool remove_file)
>                 return;
>
>         if (remove_file)
> -               remove_proc_entry(ALLOCINFO_FILE_NAME, NULL);
> +               schedule_work(&remove_allocinfo_work);
>         mem_profiling_support =3D false;
>  }
>
> @@ -1358,16 +1366,10 @@ static int __init alloc_tag_init(void)
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
> @@ -1375,10 +1377,16 @@ static int __init alloc_tag_init(void)
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
> +               pr_err("Failed to create %s file\n", ALLOCINFO_FILE_NAME)=
;
> +               shutdown_mem_profiling(false);

You need free_mod_tags_mem() here.

> +               return -ENOMEM;
> +       }
> +
>         return 0;
>  }
>  module_init(alloc_tag_init);
> --
> 2.25.1
>
