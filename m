Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AA244CA29B
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 15:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790349676; cv=pass; b=Xzqyj4ODu8ch/TnKxMYGGY4AJ5LAAeRiz2+ssi39OjDCCYQIbWnyS0kQ+NnApD/Pblar0/z9d/+m2A6GQQlzNrXfVh04DpWP+PpktCjjGkdooJNhdkkIz/HyuZ0wqOjbBKU18OA79iQmMNNtD5I4e55cFh5+lUPt127hkO2vZbU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790349676; c=relaxed/simple;
	bh=BhdfBEozeGSRDvYgw6he9SoGVdQ8qrm+juGnR4QiXlY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=axD9IOV8jlCtTNbU95ltNaO6jBMG3IWlXIHbQFqte2ormRf2qPnY4+ei1rb530ls7ihLHTI4NnAROSkjfD3tJVFtbPHp8csW409ZKwhgKKw0wxDf4e5518zQ06P6O0Fc3Ubphi7w9WZ1a92F0GqD27SonkMfUlE/e2T2vPheIzw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Z32yI5W8; arc=pass smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Z32yI5W8"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-530e8c6fb80so258031cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 08:21:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790349673; cv=none;
        d=google.com; s=arc-20260327;
        b=I61IE7XGBvj5yMtVU2IQ2cPWrj85oAMiXyOG2dnbRrgOcGPYzvzVsTcV917ZanMLgA
         IadfV75ho/ZZtpLLfyh92ubbb7BaaKXut//EeDMg9Rk8GaexO4uh7M/Kh5mTRYOE9p/1
         eN7NHMzCDNBHSH2L5pNB8Qjr5EtpVpoJCDRGnz+Etn5/FJJLaKczWGWyQnQIeWvZpkmT
         A/2wU84DTIfSsjP123C5nKByEoJA8DtlxVRr2tLLX6WD7NNP/kgFbFBjkFvrOySM8+WA
         2xVRoKFgLh30K5xQ9g4ZflZ4fQw6s1j1WgwB3h6291IjVrbMCIN8/D+byYCM59qQFSff
         Cyfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4AQvNYQWEmUAL1IVpAcXwqEvB4Tc2M/RExqLeJl04xg=;
        fh=PQ/kbZ8Y+Dq+jTRk5pA141XJ5FDWc0QlSoqg/IjZAVM=;
        b=iyFd0LdMtqGRV7Xzn6YCe6D91nLg4BP3fInfmatBd4TndnOdKHpjwWFq5Ef8zZ6la1
         AkRuohXSCpPiFLOA00SBubKy/BQ+3tJul/GaZXChPqOQLMoKh0NWi1olIPAK092dugew
         YD7N4iuuRijrySMSKcPkwd1E4am/Uqacm5vsIZO+zmjK09ZE6jwI+81XnDQhh4lIkNcS
         gnUmgJONnTKnZiqDaIiSlBg7/IFVLecuIEcT0jbzdfWI9Z1ILGEVldAUZ86G79iemFAc
         RscvCXE9y7bmeqEpYmuuWsQEFLxloGh5woM7iAFw7/F0H8bJFw9IBSWXMVl+eL8EfTx3
         9Mdg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790349673; x=1790954473; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4AQvNYQWEmUAL1IVpAcXwqEvB4Tc2M/RExqLeJl04xg=;
        b=Z32yI5W8fOKgE+FTr6Sv/N8y/ncMFKzwI/G0LPR+EZOuucib6gp45Q+WIB2akwiYPL
         2bf4n2RBmXvI7R4Y9I+CVKl6UpHyvCob9451qWj2oxx7+Vj/BHIEcGz7nKsTJUCXb1ux
         HXQV7nk7zaHC2XoHKtPKvTxYCLI3Wxi24YVcv5j50LpIh2KDWaxJSQx/PmwqRnExx/Wi
         iO1yiOB7LX1b0pC38QKbJuPLpWixfsYxfx/foy3LTvh53i5zsImmKqzSitGSdIly6Npp
         LvGYB5c/aIEYwO1P/E5q9T13AnoHMVYrZFoUYUDjO24iwHsIN2LOuhalyLyiW2PSb6mn
         TwKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790349673; x=1790954473;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4AQvNYQWEmUAL1IVpAcXwqEvB4Tc2M/RExqLeJl04xg=;
        b=LJxkPMUTXRmkcNEBFiExd8LQEQhdfudaK3j3ej6tmZL52lF33zENHRTQVdBQXEbCZL
         8u1ev0cUtie/6xDoaAS8IsCO5/1NC7ietE81pboT+co2Ah1e3jKGdV5IAn1c2ot30kHO
         l/4TXRxamb8k4h176O3WMk7Rh/z03UZlRX4GimWovQHT7ij7t2NITkGO1gRXdiXzRFjW
         IzKZRXl5d8sS9LbYpvGHMFm8nkvWuYXmGmJmFrTw5s8vNAUY7guGFGOpcLAwtpRSrnUp
         +hww1pK97CyNuNkwkZZnH1CTQZrDpevuBSkBgiQBL/iq4m25jHiW+WUKbfsd/Bw/MMgq
         83Uw==
X-Forwarded-Encrypted: i=1; AKwUvBwDN98qKCfrH2v5vjbVnLnqXphCyIhTgy8HEArgI+XJrwrkRRXfbp0QxjyEuPk/UOY6xynTuTGs+cEreLw=@vger.kernel.org
X-Gm-Message-State: AFuF++n/nr9zH0vWNn08BdsxrozmJuEWaYqGOwg8cRBZUppbcusFUnlc
	xvqLRmCClqgjAKxLuTA0pGP4ERZh3Of/5Cn1XV1bmDh949BG7bcA5Aq5i6xkC58l6EoCL1unT9Y
	uvd1LIghp2SCG1xwGSce2aRkZBKypEInslJZ39UAG
X-Gm-Gg: AYBFou18OIKaAFiuWXpqUKMFgcMd+ZxSASLbLrtBz+4JTJt5guQgF0Ij4piKxQP70PI
	5+E5M/NHJFS7VurT8z7XBKWKRtzBvTOWCuGE7NVNJDTh8vmtJSWmJ6KkW8RpDKBvpR9bOoGPkpz
	nQBXXCGPTEyQ+PDq8PxKk0QnPZ7AE924Mc38YgRm+EyoYeA0oGrI8TxD5dd3a6sJW9WvY8nRzWQ
	j6wTqBrvzEEdS65MKywA1uoGcQSt17brJFzVbjNdX0fzld519l/uyg7hLXwo7n3DMPIJxLnVzxC
	+ahG1BHPBhIvl5nDHtXk+yjKogyD5VWeuNZBp0MhXfnQ8E7jMNjSsef9fDS67TWgEvxwMNP4XyU
	as4qugjUEUU0+zljTxrjp
X-Received: by 2002:a05:622a:260a:b0:532:d36c:7094 with SMTP id
 d75a77b69052e-5331a7a38e0mr3882811cf.4.1790349669311; Fri, 25 Sep 2026
 08:21:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260925150657.1826942-1-acme@kernel.org> <20260925150657.1826942-3-acme@kernel.org>
In-Reply-To: <20260925150657.1826942-3-acme@kernel.org>
From: Ian Rogers <irogers@google.com>
Date: Fri, 25 Sep 2026 08:20:58 -0700
X-Gm-Features: AclHuK9iV1la3sMHmQ0H9rX55LlJK38t52cDodEsYfAtl_J8x0nPn4SCUw_CZJE
Message-ID: <CAP-5=fU=Bp9x32W5Xo+Qa6vvC0OR0u9FAc0A4Y=rKV=kytcjsA@mail.gmail.com>
Subject: Re: [PATCH 2/6] perf dwarf-aux: Add die_same_file() and die_get_type_die()
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Namhyung Kim <namhyung@kernel.org>, Ingo Molnar <mingo@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, James Clark <james.clark@linaro.org>, 
	Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
	Clark Williams <williams@redhat.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, Arnaldo Carvalho de Melo <acme@redhat.com>, 
	Masami Hiramatsu <mhiramat@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2026 at 8:07=E2=80=AFAM Arnaldo Carvalho de Melo
<acme@kernel.org> wrote:
>
> From: Arnaldo Carvalho de Melo <acme@redhat.com>
>
> dwarf_dieoffset() is relative to the file the DIE is in, so an offset
> saved by die_collect_vars()/die_collect_global_vars() is only
> meaningful in that file: add die_same_file(), comparing the Dwarf each
> DIE's CU belongs to, and die_get_type_die(), resolving the offset in it
> with the saved tag as a sanity check.  Resolving the offset in the main
> file instead parses whatever is at it when it came from the dwz common
> file.
>
> dwarf_cu_getdwarf() is new in elfutils 0.160, so the libdw feature test
> probes for it and Makefile.config says 0.160.
>
> Cc: Masami Hiramatsu <mhiramat@kernel.org>
> Assisted-by: LLM
> Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>

Reviewed-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

> ---
>  tools/build/feature/test-libdw.c | 10 +++++-
>  tools/perf/Makefile.config       |  2 +-
>  tools/perf/util/dwarf-aux.c      | 56 ++++++++++++++++++++++++++++++--
>  tools/perf/util/dwarf-aux.h      | 13 ++++++++
>  4 files changed, 77 insertions(+), 4 deletions(-)
>
> diff --git a/tools/build/feature/test-libdw.c b/tools/build/feature/test-=
libdw.c
> index aabd63ca76b4d7e6..46f75cde59471079 100644
> --- a/tools/build/feature/test-libdw.c
> +++ b/tools/build/feature/test-libdw.c
> @@ -49,8 +49,16 @@ int test_elfutils(void)
>         return 0;
>  }
>
> +/* Needs elfutils 0.160: taking its address fails the probe, not the lin=
k. */
> +int test_libdw_cu_getdwarf(void)
> +{
> +       void *sym =3D (void *)dwarf_cu_getdwarf;
> +
> +       return sym =3D=3D NULL;
> +}
> +
>  int main(void)
>  {
>         return test_libdw() + test_libdw_unwind() + test_libdw_getlocatio=
ns() +
> -              test_libdw_getcfi() + test_elfutils();
> +              test_libdw_getcfi() + test_libdw_cu_getdwarf() + test_elfu=
tils();
>  }
> diff --git a/tools/perf/Makefile.config b/tools/perf/Makefile.config
> index dca62e155fb5570a..b288ae0191acf7ef 100644
> --- a/tools/perf/Makefile.config
> +++ b/tools/perf/Makefile.config
> @@ -477,7 +477,7 @@ else
>    else
>      ifneq ($(feature-libdw), 1)
>        ifndef NO_LIBDW
> -        $(warning No libdw.h found or old libdw.h found or elfutils is o=
lder than 0.157, disables dwarf support. Please install new elfutils-devel/=
libdw-dev)
> +        $(warning No libdw.h found or old libdw.h found or elfutils is o=
lder than 0.160, disables dwarf support. Please install new elfutils-devel/=
libdw-dev)
>          NO_LIBDW :=3D 1
>        endif
>      endif # Dwarf support
> diff --git a/tools/perf/util/dwarf-aux.c b/tools/perf/util/dwarf-aux.c
> index 2c135ebb1551fca4..54f8b5ec74a2fe70 100644
> --- a/tools/perf/util/dwarf-aux.c
> +++ b/tools/perf/util/dwarf-aux.c
> @@ -1677,6 +1677,15 @@ Dwarf_Die *die_find_variable_by_addr(Dwarf_Die *sc=
_die, Dwarf_Addr addr,
>         return result;
>  }
>
> +/*
> + * Whether two DIEs live in the same debug file: dwarf_dieoffset() is
> + * relative to the file the DIE is in.
> + */
> +bool die_same_file(Dwarf_Die *die_a, Dwarf_Die *die_b)
> +{
> +       return dwarf_cu_getdwarf(die_a->cu) =3D=3D dwarf_cu_getdwarf(die_=
b->cu);
> +}
> +
>  static int __die_collect_vars_cb(Dwarf_Die *die_mem, void *arg)
>  {
>         struct die_var_type **var_types =3D arg;
> @@ -1721,6 +1730,8 @@ static int __die_collect_vars_cb(Dwarf_Die *die_mem=
, void *arg)
>                         vt->is_reg_var_addr =3D true;
>
>                 vt->die_off =3D dwarf_dieoffset(&type_die);
> +               vt->die_tag =3D dwarf_tag(&type_die);
> +               vt->from_alt =3D !die_same_file(die_mem, &type_die);
>                 vt->addr =3D start;
>                 vt->end =3D end;
>                 vt->has_range =3D (end !=3D 0 || start !=3D 0);
> @@ -1740,7 +1751,8 @@ static int __die_collect_vars_cb(Dwarf_Die *die_mem=
, void *arg)
>   *
>   * Save all variables and parameters in the @sc_die and save them to @va=
r_types.
>   * The @var_types is a singly-linked list containing type and location i=
nfo.
> - * Actual type can be retrieved using dwarf_offdie() with 'die_off' late=
r.
> + * Actual type can be retrieved using die_get_type_die() with 'die_off',
> + * 'die_tag' and 'from_alt' later.
>   *
>   * Callers should free @var_types.
>   */
> @@ -1786,6 +1798,8 @@ static int __die_collect_global_vars_cb(Dwarf_Die *=
die_mem, void *arg)
>                 return DIE_FIND_CB_END;
>
>         vt->die_off =3D dwarf_dieoffset(&type_die);
> +       vt->die_tag =3D dwarf_tag(&type_die);
> +       vt->from_alt =3D !die_same_file(die_mem, &type_die);
>         vt->addr =3D ops->number;
>         vt->end =3D 0;
>         vt->has_range =3D false;
> @@ -1797,6 +1811,43 @@ static int __die_collect_global_vars_cb(Dwarf_Die =
*die_mem, void *arg)
>         return DIE_FIND_CB_SIBLING;
>  }
>
> +/**
> + * die_get_type_die - Get a type DIE saved by die_collect_vars()
> + * @dbg: the main debug info
> + * @die_off: offset of the type DIE, from dwarf_dieoffset()
> + * @die_tag: tag that DIE had when the offset was saved
> + * @from_alt: whether the type DIE is in the dwz alt file
> + * @die_mem: where to store the resulting DIE
> + *
> + * Resolve @die_off in the file it was recorded as belonging to, with no
> + * fallback; @die_tag is a sanity check.
> + */
> +Dwarf_Die *die_get_type_die(Dwarf *dbg, u64 die_off, int die_tag, bool f=
rom_alt,
> +                           Dwarf_Die *die_mem)
> +{
> +       Dwarf *target =3D dbg;
> +       Dwarf_Die die;
> +
> +       if (from_alt) {
> +               /* No fallback: an alt offset here parses whatever is at =
it. */
> +               target =3D dwarf_getalt(dbg);
> +               if (target =3D=3D NULL) {
> +                       pr_debug("DWARF: no alt (dwz) debug file to resol=
ve the type DIE at offset 0x%lx in\n",
> +                                (unsigned long)die_off);
> +                       return NULL;
> +               }
> +       }
> +
> +       if (dwarf_offdie(target, die_off, &die) && dwarf_tag(&die) =3D=3D=
 die_tag) {
> +               *die_mem =3D die;
> +               return die_mem;
> +       }
> +
> +       pr_debug("DWARF: no DIE with tag %d at offset 0x%lx in the %s deb=
ug file\n",
> +                die_tag, (unsigned long)die_off, from_alt ? "alt" : "mai=
n");
> +       return NULL;
> +}
> +
>  /**
>   * die_collect_global_vars - Save all global variables
>   * @cu_die: a CU DIE
> @@ -1804,7 +1855,8 @@ static int __die_collect_global_vars_cb(Dwarf_Die *=
die_mem, void *arg)
>   *
>   * Save all global variables in the @cu_die and save them to @var_types.
>   * The @var_types is a singly-linked list containing type and location i=
nfo.
> - * Actual type can be retrieved using dwarf_offdie() with 'die_off' late=
r.
> + * Actual type can be retrieved using die_get_type_die() with 'die_off',
> + * 'die_tag' and 'from_alt' later.
>   *
>   * Callers should free @var_types.
>   */
> diff --git a/tools/perf/util/dwarf-aux.h b/tools/perf/util/dwarf-aux.h
> index 9b662db710220522..6f9145510adcb841 100644
> --- a/tools/perf/util/dwarf-aux.h
> +++ b/tools/perf/util/dwarf-aux.h
> @@ -152,6 +152,8 @@ int die_get_scopes(Dwarf_Die *cu_die, Dwarf_Addr pc, =
Dwarf_Die **scopes);
>  struct die_var_type {
>         struct die_var_type *next;
>         u64 die_off;
> +       int die_tag;
> +       bool from_alt;  /* die_off is relative to the alt (dwz) file */
>         u64 addr;
>         u64 end;        /* end address of location range */
>         int reg;
> @@ -183,6 +185,17 @@ Dwarf_Die *die_find_variable_by_addr(Dwarf_Die *sc_d=
ie, Dwarf_Addr addr,
>  /* Save all variables and parameters in this scope */
>  void die_collect_vars(Dwarf_Die *sc_die, struct die_var_type **var_types=
);
>
> +/*
> + * Get the type DIE saved by die_collect_vars()/die_collect_global_vars(=
):
> + * @from_alt says which file the offset must be resolved in, @die_tag is
> + * a sanity check.
> + */
> +Dwarf_Die *die_get_type_die(Dwarf *dbg, u64 die_off, int die_tag, bool f=
rom_alt,
> +                           Dwarf_Die *die_mem);
> +
> +/* Whether two DIEs live in the same debug file */
> +bool die_same_file(Dwarf_Die *die_a, Dwarf_Die *die_b);
> +
>  /* Save all global variables in this CU */
>  void die_collect_global_vars(Dwarf_Die *cu_die, struct die_var_type **va=
r_types);
>
> --
> 2.53.0
>
