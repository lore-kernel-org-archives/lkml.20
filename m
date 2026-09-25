Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DCEF4D09FA
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 15:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790350533; cv=pass; b=u2E0gnGK9s6k5VgnG7ue9DRq6WsCw6ErMCVHNExMY2sfNvWzexsORqQAk/eZyG1aQBVczwfouqjthO6e/PdagKlIKllRrwKPSqNw5+Y6yqVp5uAW3BXsyT7y5RuizYfMQdFgUXnRAcWuS25X2pGQg8N4wWyArgUREiMeRTNL3uk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790350533; c=relaxed/simple;
	bh=RAoOMJMUrGIpi9eEAqhAD+QmAkUJY6O+uOU1JTBkWRA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=As5eS/ZjEHlJ0mkfiKuO3GAVyFwz5jrD+vRgs4p8h/vDX9aNURN5+YuIVT7hFBqTPQg4sqbJJkWF80wjo4edbp2NzzEcNYJH1/IzXc0ffBdvukbHWO3UxlNV0xM9PpPh5NWviVQj46hd6HnD4hAD7hJSOhi4uWXXH5xMDV2afcw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ey6zJfUY; arc=pass smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ey6zJfUY"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-532e9ad9a1eso343031cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 08:35:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790350525; cv=none;
        d=google.com; s=arc-20260327;
        b=Di8r3cfsev4qY0wry2eS/+wfajCUrF+LEZb3IDWSxtv8q6CMmNCysNGDsp06HHc1rI
         AeDUBKaMCfpAn4YLhv4C9no+R78SX2zixZ7EKq4ANH2zb7m2N0chzdrwtOKL0YdJ7wXx
         8FXK88PyYfmsJgJPzd9q0HBBWnE+mdCCJ8xwQOiML9fPX9fwY4E7looBfIlBe48ofDKT
         8uBprgIHNDLib/WsgB2hRXWeCAKgEOPVt7IKU05ABxqaXOOeAE+wkoYebG8rSw/xe4mC
         YwpBA+/m57L/GGc5ZyWursnbLS/DcYr0u5X8eDIoRtQqIOiBWKw7H5ofvWhAQOJVSi7N
         cUgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1AUFR0bcaYiiInCheMd1ljiLonx4ECB6w1hYaXq4GC8=;
        fh=3B5/bweDgb/BmCs303hy9gpIUCXxUf6ENBPgbIN0K4Q=;
        b=l0H/1HhW3dgDIzpk7me6gCwy5/dTh+rGxvbe5lMtCNcL2I1vEuowQtE55d8wB7d+TU
         x6x3u0DRMgIcmUtEGZf4XJRa0uZmdjksf6QKBD++QlrqpNRKTZvgG3U5QztuCmnWLzzW
         DKQviFDBnKf7GwsRGwdwrM69iqPT/W5IBQ1POCCTfTfPho9o13UfEkAicevZonbr/oOX
         gxWB/wxsWWeNZJ5PXf5d1x2nQyBiFBQYxNBhn3Jhw3x/1ZoDyBDnWb1M0cW9DoKWbgA0
         GN2NIqqCMUaxgE4uP2bk0sB81Wt+7A8iBLsprGYflPjutaWszJxcDOic0c5oeGxbQdBH
         vcgw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790350525; x=1790955325; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1AUFR0bcaYiiInCheMd1ljiLonx4ECB6w1hYaXq4GC8=;
        b=ey6zJfUYLyCIoz1mrxEO59dQhDnwDB7w1bSoQqlWkv3cA68mqFoX0AYXfVEXA/DKR+
         F6XRtQiR8J6V/S7hsg3g29U/Hg50VAQ629/j0DrO5PAAzUb787g3Xhv8vSrZb+e08dhA
         hnS7KtTC3BCM1Su4q7mxTnmh22E0ZYSo35LHZXeA2tlOai3z/0/ONP3feCJrYwPnVsM5
         k03M3cs270sJ6Bf2p0NV8qgLqAX+4doE0MftntUZp3W5ZMjIpnycqoSSvVSE6aGr3jyX
         lMz0uHO0RSdhQJ3IHTzmbdF5/RGjVdMKdTBry/C9oto5c5cbAdPmYVJHNupZmGzGVczf
         Rqfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790350525; x=1790955325;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1AUFR0bcaYiiInCheMd1ljiLonx4ECB6w1hYaXq4GC8=;
        b=Ha26sZuxCVlTIqFCU5gesPTT/N5Sn9yafnSzu+ZCNwCgqDk155lgpelg38Qva1DnH5
         S7mGwB6Fa2G70LPvFfOGyNTBKG9pqNLIFk5CQp9UYAkLUgi4J/v5WH4aDh3zY8naPvhL
         V21Hy5BhVIrBlmZvBJY9WztBHp7Txaj7RkF1+oNZJalVCtA5iyMMDTkAHbyTn7zM5Etg
         d9eZ0U6st6TgmwoLG5MghVWkiwwjF8Yi0b73CCk3WIm2CbsjiCHMmq3ye3oco5yr+3A9
         FRRdf5PdeH4g7eIaas375VCe7MQKVHbnJhfTSZpmjCuPvIvrNy72oZlhAo4CP57DjDq0
         iJtA==
X-Forwarded-Encrypted: i=1; AKwUvByWdEv5Usv6IDFSHq7fhS0h6b4mVPuq81BhOHObvEYwJ3qgu4PWpHOPogew3CeEV4wm02akjtGaA9zK1rI=@vger.kernel.org
X-Gm-Message-State: AFuF++nc2jPw+c6GVosO5zbnsYSmgx5xv59ExB6bm/eI+zcvCCwlP3rl
	lPBKRS7pb8sTSuLmP8NpPQF3VffuCjC9hQxotvzoyz8MJ7wPAj7eZj3GYAvv37hYOZCUUlinGMW
	ZbLeO8D2XZ8eDtzXF4Yj0wep1LCyAH3MkTehKOBi4
X-Gm-Gg: AYBFou1I7Cbn1GWmdZ8VesOLtqQpwINDDcX04i2kUh1sThVxpNIBPmaR8p0pjkVgoEI
	HoHjTm6Gijm+vyR0QMgXwfQ9q+5HbL/s97RXltlsuWefMl63V4Vg8nLxzOxxoTFkivtwH7m/5sQ
	te6uxH5yp9KN6QqI/cTfQBXjMzG3wICG9i0Mj9tkN+ztEBk8kPDJZbeyjoKvJWpmYrgm6K+rWr3
	Ft9oVV44g39IOqgAPBHPq+Zz2jF9i76YiofwAljZXp3E/jBmkJa1jV0gfFtciCPPwFo17nWEycB
	dDGecH24NThM1HJYFuGdgNiup5E8wha4CJJxnZJqoYbqVfHwlzx8LVAR9XxlEy8z2j1wivF7S/s
	RsO6VbgXeGy0=
X-Received: by 2002:a05:622a:11c4:b0:532:9003:35b1 with SMTP id
 d75a77b69052e-5331a787127mr4687681cf.2.1790350524211; Fri, 25 Sep 2026
 08:35:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260925150657.1826942-1-acme@kernel.org> <20260925150657.1826942-4-acme@kernel.org>
In-Reply-To: <20260925150657.1826942-4-acme@kernel.org>
From: Ian Rogers <irogers@google.com>
Date: Fri, 25 Sep 2026 08:35:11 -0700
X-Gm-Features: AclHuK-fU_qeSERmmmdA31MBwT80wErUCN7Csl_mpnfIUlMovHvI8q0yBKAe7og
Message-ID: <CAP-5=fVM6qFD0QZfD6HeYoxoyYP355gtDYN7+-Q0vAV3NioKcw@mail.gmail.com>
Subject: Re: [PATCH 3/6] perf annotate-data: Resolve type DIEs in the debug
 file they came from
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Namhyung Kim <namhyung@kernel.org>, Ingo Molnar <mingo@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, James Clark <james.clark@linaro.org>, 
	Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
	Clark Williams <williams@redhat.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, Arnaldo Carvalho de Melo <acme@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2026 at 8:07=E2=80=AFAM Arnaldo Carvalho de Melo
<acme@kernel.org> wrote:
>
> From: Arnaldo Carvalho de Melo <acme@redhat.com>
>
> 'perf report -s type' hangs burning CPU on the dwz compressed debug
> info of libz.so.1 (zlib-ng): die_collect_vars() saves the
> dwarf_dieoffset() of the type DIE, which is relative to the file it
> lives in - the dwz alt file for the types shared by more than one CU -
> and update_var_state() resolves that offset in the main debug file,
> parsing whatever is at it, here a typedef whose DW_AT_type refers to
> itself.
>
> Record whether the type DIE came from the alt file and resolve the
> offset with die_get_type_die() in that file, with no fallback.
>
> Fixes: 06b2ce75386df04b ("perf annotate-data: Maintain variable type info=
")
> Fixes: 55ee3d005d62279d ("perf annotate-data: Add a cache for global vari=
able types")
> Assisted-by: LLM
> Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>

Reviewed-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

> ---
>  tools/perf/util/annotate-data.c | 21 +++++++++++++++------
>  1 file changed, 15 insertions(+), 6 deletions(-)
>
> diff --git a/tools/perf/util/annotate-data.c b/tools/perf/util/annotate-d=
ata.c
> index e9b58a3d587be45b..bc9698abc6a9e055 100644
> --- a/tools/perf/util/annotate-data.c
> +++ b/tools/perf/util/annotate-data.c
> @@ -739,6 +739,8 @@ struct global_var_entry {
>         u64 start;
>         u64 end;
>         u64 die_offset;
> +       int die_tag;
> +       bool from_alt;  /* die_offset is relative to the alt (dwz) file *=
/
>  };
>
>  static int global_var_cmp(const void *_key, const struct rb_node *node)
> @@ -776,7 +778,7 @@ static struct global_var_entry *global_var__find(stru=
ct data_loc_info *dloc, u64
>  }
>
>  static bool global_var__add(struct data_loc_info *dloc, u64 addr,
> -                           const char *name, Dwarf_Die *type_die)
> +                           const char *name, Dwarf_Die *type_die, bool f=
rom_alt)
>  {
>         struct dso *dso =3D map__dso(dloc->ms->map);
>         struct global_var_entry *gvar;
> @@ -798,6 +800,8 @@ static bool global_var__add(struct data_loc_info *dlo=
c, u64 addr,
>         gvar->start =3D addr;
>         gvar->end =3D addr + size;
>         gvar->die_offset =3D dwarf_dieoffset(type_die);
> +       gvar->die_tag =3D dwarf_tag(type_die);
> +       gvar->from_alt =3D from_alt;
>
>         rb_add(&gvar->node, dso__global_vars(dso), global_var_less);
>         return true;
> @@ -872,12 +876,14 @@ static void global_var__collect(struct data_loc_inf=
o *dloc)
>                         if (pos->reg !=3D -1)
>                                 continue;
>
> -                       if (!dwarf_offdie(dwarf, pos->die_off, &type_die)=
)
> +                       if (!die_get_type_die(dwarf, pos->die_off, pos->d=
ie_tag,
> +                                             pos->from_alt, &type_die))
>                                 continue;
>
>                         get_global_var_info(dloc, pos->addr, &var_name, &=
var_offset);
>
> -                       global_var__add(dloc, pos->addr, var_name, &type_=
die);
> +                       global_var__add(dloc, pos->addr, var_name, &type_=
die,
> +                                       pos->from_alt);
>                 }
>
>                 delete_var_types(var_types);
> @@ -902,7 +908,8 @@ bool get_global_var_type(Dwarf_Die *cu_die, struct da=
ta_loc_info *dloc,
>
>         gvar =3D global_var__find(dloc, var_addr);
>         if (gvar) {
> -               if (!dwarf_offdie(dloc->di->dbg, gvar->die_offset, type_d=
ie))
> +               if (!die_get_type_die(dloc->di->dbg, gvar->die_offset,
> +                                     gvar->die_tag, gvar->from_alt, type=
_die))
>                         return false;
>
>                 *var_offset =3D var_addr - gvar->start;
> @@ -932,7 +939,8 @@ bool get_global_var_type(Dwarf_Die *cu_die, struct da=
ta_loc_info *dloc,
>
>  ok:
>         /* The address should point to the start of the variable */
> -       global_var__add(dloc, var_addr - *var_offset, var_name, type_die)=
;
> +       global_var__add(dloc, var_addr - *var_offset, var_name, type_die,
> +                       !die_same_file(cu_die, type_die));
>         return true;
>  }
>
> @@ -987,7 +995,8 @@ static void update_var_state(struct type_state *state=
, struct data_loc_info *dlo
>                                 continue;
>                 }
>                 /* Get the type DIE using the offset */
> -               if (!dwarf_offdie(dloc->di->dbg, var->die_off, &mem_die))
> +               if (!die_get_type_die(dloc->di->dbg, var->die_off,
> +                                     var->die_tag, var->from_alt, &mem_d=
ie))
>                         continue;
>
>                 if (var->reg =3D=3D DWARF_REG_FB || var->reg =3D=3D fbreg=
 || var->reg =3D=3D state->stack_reg) {
> --
> 2.53.0
>
