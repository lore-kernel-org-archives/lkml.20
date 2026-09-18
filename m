Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA73A15E5BB
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 00:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789689965; cv=pass; b=oIwJrou0V8CJYZpCQzWucWi/o7Lzk8JKAYPuTNZMkXU10V1N5S9J3BqmCmxQ2SOlICf3ubYP5AF/azaIiKm8Ke+F2vaZ/ufKcLITGXymx1FXbbZ4xtfzF/wehSxN8UjdI3ONczF6BkagBar7XKecoVScP0AGVFyj38OZa7DsCUs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789689965; c=relaxed/simple;
	bh=SoYH9DkYZM7XMSVqIEHkYuCCPKo/3Z5FIbckZ97FnH0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uAMuERnZmTaaTtlyINpq78TnpQ2j0OGfzdFhl2qPfqp1NtMDR0yzzFWdea8E6D02JY+HdOnrZe/MJdSidqM4n1Xr+39gQ+uQ2iqxNnWSHPLbgh6f3EYqkCTlge/HdRCXmdLN0Y8gmd/tDN7OtffjZ+zBdekM+q0C+LyToIX2xVQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Rxo6D1DG; arc=pass smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Rxo6D1DG"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-53113d72966so93221cf.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 17:06:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789689962; cv=none;
        d=google.com; s=arc-20260327;
        b=JYH7x7EIsjT+SV39HbF7rqGrZdlCj/HIv0k8STsQfwJ0Ihtpw5l9SbjYfaqHIJQQ9o
         PhnVZs/We9IE9+UVO86G2jYmxWJAInyNzRo0Z7n7p4RwbMT2VWWNLaPbGp82wva1mZHo
         ZzG5Hus4lW1skQMgtkfn24lQyd9tufs5OjQ9py4Jkpnzz5Aae+/QWeuapAGqBRRyJZB4
         EmMww9msEz7KHRwFkd+gg87RWyqwm6pjxgBv+o8dSF0awnfpbZER2U0v7fgguyF+2YkJ
         nS829mME0nqblnnZlUEifIZyE+EM7cQVQ2bv8nMJynswyHzsbM145MKGbCmZjAi2sYpW
         r8fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nKIZfh7L/9iy7pYAqHEsnUPc7J9L27b73sdn5xk9SqU=;
        fh=qEC3KpLjCIS2c9/N0OywagKfIki7EZrJeINeteVIwPs=;
        b=Ybc6KyGWIRfRaij1BCG7WqrACI2tOZpWt8nBJ2cfmVqWxCYGLWfRPvBdffevxmAGDO
         dWfMe3Qixg1hbPC9C5TuKBLPhpKgYCEYgdnbKWhbz0X9HUwtRt8HlCq8Y6ok1w2r60O8
         6eAHJAb1gVEceWKvctg+P/Fw2wPaQG7Uxneemh0ql8zM+4vppWhBlnwqA9A8zLdYDewX
         ccK1DOdqTjUdOQDsKaEIJCrE5WjB+B/kwhWAxT9FtqL3atRXheOeWAVQuLtDWXv7BZVK
         zzbiYDs9mcISMdE84DB7LLsWE8NRyOV7d4LXjStDoxS6Mp5KZer95r72UCt10KuySMMU
         YS6g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789689962; x=1790294762; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nKIZfh7L/9iy7pYAqHEsnUPc7J9L27b73sdn5xk9SqU=;
        b=Rxo6D1DGSe4rtun8R/CYSKni4Ezku62CHIHRD7MzkrDYMGeQBvhZAikySck1oYyYTi
         UxU1CHSeHAUfGKjsOTUudcGbq0VNq2j6G9Nfz2f7DZXIlpjD3S3ubjE+zXGAyG7jwiLu
         kMNToftD6IvxrnE/0yStf4kNN3bRF1V5KgJ1DqsxugUcyaQAs+xFPjIQ/5v7ROlBDy2a
         jtonSjIeEPwxWhac0sVuZbBQHbJ71N7/IMFEsJn3kYhP6J2dZovkzI1lpimFHCp6o7/g
         MUdAvT1lMuj26umL7wtAZEMsKUf8hN3XEwwZgjNRQmoSNxstUMJhDQPOVn2dR/y5utKK
         T3Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789689962; x=1790294762;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nKIZfh7L/9iy7pYAqHEsnUPc7J9L27b73sdn5xk9SqU=;
        b=V5FOIIDxtvEVtDQx+zuc1VlKGB3d+bjskVVCoWKAb8Up8MsEDCuht8AvWN5sAG/dRj
         tjumGbKa7+PXZDaKckgZ0MlL0iYmYqJqFLjOfoGf+7FR7PRpHt+W0wZDsldXnfXKUwVw
         ErAvoWO3KNuNtgo6BAECkUSkQddzeXUDEXWlRvN0poJI5/aeRAGeOnVnn2QSowxpG6yo
         LDjmoiCyWywH1VntYTUONqmhv51vSnoFvtG2XKPGbSITkDoCqf6V6xYtAugTiBSaW0/Y
         jqC5cMn5/hbaip89t0ilK8uaaXbyv5C0BITZXFlsMw9jWuBe4OZguux7aH4xenWrU/f2
         nKDA==
X-Forwarded-Encrypted: i=1; AKwUvBw8wvfWnB3JBgr94jOqSkM/W7RaKiU4o0fTALva9npk5rTJ5Kk8gPn3RWS2cq7aNvuT59bsXfEZ69zrx9g=@vger.kernel.org
X-Gm-Message-State: AFuF++nkuvHkf5Y1SzTjkCh8wdmg8UpV7X3lQ39gYcSd7ey0d96KpvJz
	cg2bs4wkUT4/fZpMi8EyguaJpZLE9ZwqvJID2bzQ05f+2I6Z+6Kh/Og5TrDZ72d/utnYJLsox3X
	lOTSnjjRVem3TmHHdcH/CH/gbXLpNKjh/O7LiWNML
X-Gm-Gg: AYBFou1UBRrDzt0DvHfgtxBYy3SAscMJ1XRACQ+0Pf5Z4Xp7fOWVpKZphCdGz1Wrngz
	OO4PVKR4uGgyNsGCXplw8HWwSoJ/P4NzRnEiF2k5Nd2dYw0Pz7+REs70SdQJ6m94oqN3S6ZkR9t
	aeYs9nhBm6pPfcxQJQWpZRTG6iGUXV9pUcl1y3LeWXkepqMOOna1cwZu1wz4RvZnCFFssto6qgK
	KSW2isA7GXeB5dk+8rzsS/eUkcCF4ekM0tTbD+7dXLLBEM0FfTCKXFUoybi2bHLWAmfekA4AH8N
	SKw9D6gBOg8iTYYUQhNjvq4K09Y+gLOA+5eFl4sbR9ghfShi9W2CHg==
X-Received: by 2002:a05:622a:355:b0:532:9d15:2e5a with SMTP id
 d75a77b69052e-5329f156af3mr3916691cf.1.1789689960917; Thu, 17 Sep 2026
 17:06:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915070001.113559-1-hao.ge@linux.dev> <20260915070001.113559-5-hao.ge@linux.dev>
In-Reply-To: <20260915070001.113559-5-hao.ge@linux.dev>
From: Suren Baghdasaryan <surenb@google.com>
Date: Thu, 17 Sep 2026 17:05:49 -0700
X-Gm-Features: AcwNN1XAOT_17fQE5yjXnFf9eEwp8M54bYI5rVj3bt4gohWMRB35SlFkGCcgPLA
Message-ID: <CAJuCfpFQ8v8poeYNcuLd6azkR4O6wyHOv7+C=RfQGVWx4o935w@mail.gmail.com>
Subject: Re: [PATCH v10 4/6] module: allocate codetag sections before the
 regular module layout
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
> Whether a codetag section goes to the codetag region is decided by
> layout_sections() and asked again in move_module(). A concurrent
> load can shut profiling down in between, and move_module() then
> copies the section to offset 0 of its regular destination,
> overwriting whatever is there.
>
> Decide and allocate in one pass, before the layout. Allocation
> errors fail the load. On a tag area overflow profiling is already
> disabled, so -EAGAIN makes the section fall back to regular module
> data and the module still loads. The reservation is released and
> module_tags.size rolled back, so a concurrent load which already
> passed needs_section_mem() does not skip vm_module_tags_populate().
>
> An SHT_NOBITS codetag section is zeroed explicitly, the tag area
> pages are not zeroed on allocation.
>
> When profiling was toggled off the overflow check did not run, a
> module could load with more tags than the page flags can address,
> and re-enabling profiling then silently corrupted /proc/allocinfo.
> The check no longer depends on mem_alloc_profiling_enabled().
>
> Based on a patch by Petr Pavlu [1].
>
> Fixes: 4835f747d3ed ("alloc_tag: support for page allocation tag compress=
ion")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Link: https://lore.kernel.org/all/499bb60c-c6e3-43a3-bd92-95a0567ece5e@su=
se.com/ [1]
> Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>
> Cc: stable@vger.kernel.org
> Signed-off-by: Hao Ge <hao.ge@linux.dev>

Makes the logic much simpler. Thanks!

Reviewed-by: Suren Baghdasaryan <surenb@google.com>

> ---
>  kernel/module/main.c | 101 +++++++++++++++++++++++--------------------
>  mm/alloc_tag.c       |   9 ++--
>  2 files changed, 60 insertions(+), 50 deletions(-)
>
> diff --git a/kernel/module/main.c b/kernel/module/main.c
> index ae2678ac7840..b7ebcc40bdda 100644
> --- a/kernel/module/main.c
> +++ b/kernel/module/main.c
> @@ -1723,20 +1723,6 @@ static void __layout_sections(struct module *mod, =
struct load_info *info, bool i
>                         if (WARN_ON_ONCE(type =3D=3D MOD_INVALID))
>                                 continue;
>
> -                       /*
> -                        * Do not allocate codetag memory as we load it i=
nto
> -                        * preallocated contiguous memory.
> -                        */
> -                       if (codetag_needs_module_section(mod, sname, s->s=
h_size)) {
> -                               /*
> -                                * s->sh_entsize won't be used but popula=
te the
> -                                * type field to avoid confusion.
> -                                */
> -                               s->sh_entsize =3D ((unsigned long)(type) =
& SH_ENTSIZE_TYPE_MASK)
> -                                               << SH_ENTSIZE_TYPE_SHIFT;
> -                               continue;
> -                       }
> -
>                         s->sh_entsize =3D module_get_offset_and_type(mod,=
 type, s, i);
>                         pr_debug("\t%s\n", sname);
>                 }
> @@ -2795,7 +2781,6 @@ static int move_module(struct module *mod, struct l=
oad_info *info)
>  {
>         int i, ret;
>         enum mod_mem_type t =3D MOD_MEM_NUM_TYPES;
> -       bool codetag_section_found =3D false;
>
>         for_each_mod_mem_type(type) {
>                 if (!mod->mem[type].size) {
> @@ -2815,35 +2800,13 @@ static int move_module(struct module *mod, struct=
 load_info *info)
>         for (i =3D 0; i < info->hdr->e_shnum; i++) {
>                 void *dest;
>                 Elf_Shdr *shdr =3D &info->sechdrs[i];
> -               const char *sname;
>
>                 if (!(shdr->sh_flags & SHF_ALLOC)
>                     || shdr->sh_entsize =3D=3D SH_ENTSIZE_STANDALONE)
>                         continue;
>
> -               sname =3D info->secstrings + shdr->sh_name;
> -               /*
> -                * Load codetag sections separately as they might still b=
e used
> -                * after module unload.
> -                */
> -               if (codetag_needs_module_section(mod, sname, shdr->sh_siz=
e)) {
> -                       dest =3D codetag_alloc_module_section(mod, sname,=
 shdr->sh_size,
> -                                       arch_mod_section_prepend(mod, i),=
 shdr->sh_addralign);
> -                       if (WARN_ON(!dest)) {
> -                               ret =3D -EINVAL;
> -                               goto out_err;
> -                       }
> -                       if (IS_ERR(dest)) {
> -                               ret =3D PTR_ERR(dest);
> -                               goto out_err;
> -                       }
> -                       codetag_section_found =3D true;
> -               } else {
> -                       enum mod_mem_type type =3D shdr->sh_entsize >> SH=
_ENTSIZE_TYPE_SHIFT;
> -                       unsigned long offset =3D shdr->sh_entsize & SH_EN=
TSIZE_OFFSET_MASK;
> -
> -                       dest =3D mod->mem[type].base + offset;
> -               }
> +               dest =3D mod->mem[shdr->sh_entsize >> SH_ENTSIZE_TYPE_SHI=
FT].base +
> +                      (shdr->sh_entsize & SH_ENTSIZE_OFFSET_MASK);
>
>                 if (shdr->sh_type !=3D SHT_NOBITS) {
>                         /*
> @@ -2875,8 +2838,6 @@ static int move_module(struct module *mod, struct l=
oad_info *info)
>         module_memory_restore_rox(mod);
>         while (t--)
>                 module_memory_free(mod, t);
> -       if (codetag_section_found)
> -               codetag_free_module_sections(mod);
>
>         return ret;
>  }
> @@ -2947,6 +2908,49 @@ static bool blacklisted(const char *module_name)
>  }
>  core_param(module_blacklist, module_blacklist, charp, 0400);
>
> +/*
> + * Allocate codetag sections separately. They are loaded into preallocat=
ed
> + * contiguous memory because they may still be used after the module is
> + * unloaded.
> + *
> + * If the separate allocation overflows, allocate the section normally
> + * so that the module can still be loaded.
> + */
> +static int allocate_codetag_sections(struct load_info *info)
> +{
> +       for (unsigned int i =3D 1; i < info->hdr->e_shnum; i++) {
> +               Elf_Shdr *shdr =3D &info->sechdrs[i];
> +               const char *sname =3D info->secstrings + shdr->sh_name;
> +               void *dest;
> +
> +               if (!codetag_needs_module_section(info->mod, sname, shdr-=
>sh_size))
> +                       continue;
> +
> +               dest =3D codetag_alloc_module_section(info->mod, sname, s=
hdr->sh_size,
> +                               arch_mod_section_prepend(info->mod, i), s=
hdr->sh_addralign);
> +               if (WARN_ON(!dest)) {
> +                       codetag_free_module_sections(info->mod);
> +                       return -EINVAL;
> +               }
> +               if (dest =3D=3D ERR_PTR(-EAGAIN))
> +                       /* Allocate the section as a regular section. */
> +                       continue;
> +               if (IS_ERR(dest)) {
> +                       codetag_free_module_sections(info->mod);
> +                       return PTR_ERR(dest);
> +               }
> +
> +               if (shdr->sh_type !=3D SHT_NOBITS)
> +                       memcpy(dest, (void *)shdr->sh_addr, shdr->sh_size=
);
> +               else
> +                       memset(dest, 0, shdr->sh_size);
> +               shdr->sh_addr =3D (unsigned long)dest;
> +               shdr->sh_entsize =3D SH_ENTSIZE_STANDALONE;
> +       }
> +
> +       return 0;
> +}
> +
>  static struct module *layout_and_allocate(struct load_info *info, int fl=
ags)
>  {
>         struct module *mod;
> @@ -2979,18 +2983,21 @@ static struct module *layout_and_allocate(struct =
load_info *info, int flags)
>          */
>         module_mark_ro_after_init(info->hdr, info->sechdrs, info->secstri=
ngs);
>
> -       /*
> -        * Determine total sizes, and put offsets in sh_entsize.  For now
> -        * this is done generically; there doesn't appear to be any
> -        * special cases for the architectures.
> -        */
> +       /* Allow codetag sections to be allocated separately first. */
> +       err =3D allocate_codetag_sections(info);
> +       if (err)
> +               return ERR_PTR(err);
> +
> +       /* Determine total sizes and put offsets in sh_entsize. */
>         layout_sections(info->mod, info);
>         layout_symtab(info->mod, info);
>
>         /* Allocate and move to the final place */
>         err =3D move_module(info->mod, info);
> -       if (err)
> +       if (err) {
> +               codetag_free_module_sections(info->mod);
>                 return ERR_PTR(err);
> +       }
>
>         /* Module has been copied to its final place now: return it. */
>         mod =3D (void *)info->sechdrs[info->index.mod].sh_addr;
> diff --git a/mm/alloc_tag.c b/mm/alloc_tag.c
> index 95ddf5b743d0..5836803898ad 100644
> --- a/mm/alloc_tag.c
> +++ b/mm/alloc_tag.c
> @@ -958,10 +958,13 @@ static void *reserve_module_tags(struct module *mod=
, unsigned long size,
>                 int grow_res;
>
>                 module_tags.size =3D offset + size;
> -               if (mem_alloc_profiling_enabled() && !tags_addressable())=
 {
> +               if (!tags_addressable()) {
>                         shutdown_mem_profiling(true);
> -                       pr_warn("With module %s there are too many tags t=
o fit in %d page flag bits. Memory allocation profiling is disabled!\n",
> -                               mod->name, NR_UNUSED_PAGEFLAG_BITS);
> +                       pr_warn_once("With module %s there are too many t=
ags to fit in %d page flag bits. Memory allocation profiling is disabled!\n=
",
> +                                    mod->name, NR_UNUSED_PAGEFLAG_BITS);
> +                       release_module_tags(mod, false);
> +                       module_tags.size =3D prev_size;
> +                       return ERR_PTR(-EAGAIN);
>                 }
>
>                 grow_res =3D vm_module_tags_populate();
> --
> 2.25.1
>
