Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE4E1379C5A
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 23:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789860142; cv=pass; b=aihF+1Ex+IlcqGJ1V0b/d7It6GTG5PPQywNSm5//j+NeyX3nf/6TiI4KTnv26okC40oDre+MouPneUBUDQ1+177xi5Qf3y0Sg5aAl2bBdBOEAzMkRPBIdCOJkLT2v2aECWVFeYzT4Jpw1MJktFSIS2uzBU9BgqTFpr90XFF6JCc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789860142; c=relaxed/simple;
	bh=ZbfRrCsHGOMHU1C3c/VfEoUjlwG/5DvrvQk/2XrT2Gs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZJOhnzOZsbpUJjutq5c88XVtCfjWS2rwLe7GnzOli2/T4FipWH2IXp2be8eQ6ZnsZeGQp1Gw1BqScYojIfXrYBSlWKz76XLmS58hJuNNKbUPU8NtMuPu8LNA71JfLxTjLnmiVSSgGVF8KvVI/I76fKxkpHc+vPdFuWoZPKz374g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=uber.com; spf=fail smtp.mailfrom=uber.com; dkim=pass (1024-bit key) header.d=uber.com header.i=@uber.com header.b=51uyvjG+; arc=pass smtp.client-ip=74.125.224.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=uber.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=uber.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uber.com header.i=@uber.com header.b="51uyvjG+"
Received: by mail-yx2-f13.google.com with SMTP id 956f58d0204a3-66e4ab22370so1419123d50.3
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 16:22:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789860140; cv=none;
        d=google.com; s=arc-20260327;
        b=ho3ROqbltl1rw3IIT1zian7xv47+eVOjQBkrN5ntr95HcX+PCcniarJHNVHDKx6/qA
         Bb/fSpJs4cb2TUy0YMgDM5vFr5zOg4LnBxaS8sxTI/jU7QYNsqXWWeTcH+C4EvGzXQit
         Kr4IgGbLLcNGS4b7PbgrZuhapMkXI1Yh/ljIf/g+teMz4PDda6g6TSUd0VK4SH8MJtdW
         AooTMQQ3k9Jf5ZEzNqnfkfsAziN0D+OtcJ9qAapYFTWHhHTIIjY4zeYdi7JrHwg7HLzA
         CwMD8Jp4qupKWl+hBsJv37tx8YwHfPnWOtDm5zS77c0XFk5vyANcqqVmkWzpZPPMVJwT
         eI2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=U2yPeC8EwDJA7EfjJHpQpcfUJ0XSVbb7bMZgykMbs/Y=;
        fh=Z4YK8irqZokmPEMFXu2FzfvE8uu/24Kj67Mk+dho4Rk=;
        b=oneDdcVxqzdQW0vT/UKbVztT2EuvrNCBDEOA+wMzuDOc/oXuhJoDc32jl9OM1DlZBM
         ANoGpSYrQR2WP4Vo3XBvO6K2Jkb6RRoi0s0U9Z8DILA0a8nDIR2SeTNoV9Y5KpalIfyB
         EUVJTPALdFIw5tck49cYn4OWRgmmmpix9vAex7waiPB6hQLr3gb5tH5XTJzGtEUOE+10
         HwjZ6PfNXPNb82VL6/S4D+yaTjjddk/kR+POtuNtw8mzrNSF+huHykLzf/Aq/Yzygv7B
         U8E4YutYbOWhRpfukIricj5xDXCa9SsejLpzRO9KZ9mTITXPWnGqwGFOAFxK3bCknE2P
         HtYA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=uber.com; s=google; t=1789860140; x=1790464940; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U2yPeC8EwDJA7EfjJHpQpcfUJ0XSVbb7bMZgykMbs/Y=;
        b=51uyvjG+/BPU5LtN8mLPwiLHR13TGkpDR6pKryy2yN2O0LPZsuJCtYafpoAaJe88ic
         7ampGuzn+OrLacxVFKbklWzdNZxAkBSwciGGip7+s8qMWmPkKPgdqcrIyhilRoDwt17P
         DRWgMNSxoddEKcnL8VV941TrFd0IJchu3gTp8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789860140; x=1790464940;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=U2yPeC8EwDJA7EfjJHpQpcfUJ0XSVbb7bMZgykMbs/Y=;
        b=XZSLMFyufkih5gKSO9Ewcfzwz0IXcLRuWGVk9n/yvKFKxTHQKFNiyfz3FEqM+BB4Od
         lk8xhnNlLiv3TgKO6a0lJQgsrcasQHHQaoB8CJ8X+jELEvMscZqCmYRnex/xA7ufJJj3
         J5VBhhJsbjVNFfzcsv5dOTc1q64YcLRFEqqqNgdwGEKWjcDgBG+gVp1ABpgmruKkRjKX
         plkBwOio01crJNDITSc+rrcWB5cimkPpULXMPtRRoC55hLYOh5ywnF+gsUvjIj8ipaZt
         N0llcZ+00+uNzSI6FlrxZS4HF9ns4Uo+AIl5ezW4elEUJd0NknZgrjBJYSJjv/nND7Ec
         EZWA==
X-Forwarded-Encrypted: i=1; AKwUvBwtHpLdGC137pirnPK4ipznkinEicMKdWDWAHY7vFamvkJRwLN9GxtyuDl67uIkAYCBgPCQQdWRptWPk60=@vger.kernel.org
X-Gm-Message-State: AFuF++kG2RZiq8/cZ6rOORQKiyq6o9925XB5ZsNswt5uRyPlPeFgE5vq
	fWCMpJs7u7G3NjQ7AsUUzL4X2k7P+UWrr3aaKvsP5pDZOVEPqdLLraPAZEl2rKydsdX9j+ueYPM
	Zr4twpbpJfQ4eRn0rHDIm/6W7M4xoponH5G3iDRzNYw==
X-Gm-Gg: AYBFou3nQiHvHf5ctS3bBW5Phj8U1sdXyhLAhsgBINx/tovFWEocHjpLSaPGEC2TCBt
	bYHHQBlDmvqGcoGuz1eKEMdlwa+GL47ENZEU3VEhw/Q8/0nONA/l9FAcbfpfUWrrm5jHguFvv9I
	R0MlKf2SlzMus/YeqItJsfzutfqx3Zf1jxiC+DwYowPCq/o98yJFENMJcAn5W12BzgbQB05pFwg
	urkmU8T7ezvN08Ggy4xyWDqsCXYW28yYtrJ8vbzvlB7QJ7XqT8ImYyUaYn48NJ3Vjj0cpd93LQH
	ZbMwH/54xhe58E8fuqr4a/ebtYUgzECKFbncXHIXMSqGfTNi97HSxlvUH1mQ//GDWXRf3/BXH3k
	U2nH6nXdfePLKUlX98AUZxF0=
X-Received: by 2002:a05:690c:60c7:b0:873:5ddf:d85e with SMTP id
 00721157ae682-897346e1584mr19909387b3.41.1789860137805; Sat, 19 Sep 2026
 16:22:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915-perf-symbol-memory-send-v1-0-1d3360e21f07@uber.com>
 <20260915-perf-symbol-memory-send-v1-3-1d3360e21f07@uber.com> <aquVqBiZbVYceOJ2@z2>
In-Reply-To: <aquVqBiZbVYceOJ2@z2>
From: Alireza Haghdoost <haghdoost@uber.com>
Date: Sat, 19 Sep 2026 16:22:01 -0700
X-Gm-Features: AcwNN1Ut7SMbdpqTrGq_PmTl19FYlXIq0kQESIIpkQ07ObhSYaW8zxaCDaAbWTg
Message-ID: <CA+w=M=Toyobj0Q9UcWUtvW2cwaNoRFaF5KX0zshc+J2pcpHmpg@mail.gmail.com>
Subject: Re: [PATCH 3/4] perf script: Add --lazy-load-symbols for lazy symbol loading
To: Namhyung Kim <namhyung@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, Andrii Nakryiko <andriin@fb.com>, 
	Alexei Starovoitov <ast@kernel.org>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> > +static void dso__clip_ondemand_symbols_at(struct dso *dso, u64 addr)
> > +{
> > +     struct dso_ondemand *od = dso__ondemand(dso);
> > +     struct sym_idx *sym;
> > +     u32 lo = 0, hi, mid;
> > +
> > +     if (!od)
> > +             return;
> > +
> > +     hi = od->nr_sorted;
> > +     while (lo < hi) {
> > +             mid = (lo + hi) / 2;
> > +             if (od->sorted[mid].start < addr)
> > +                     lo = mid + 1;
> > +             else
> > +                     hi = mid;
> > +     }
>
> Why not use bsearch()?
>

This search is a lower-bound (bisect_left) operation. I could not find
an ISO C or glibc API that provides that operation.
In patch series v2, I will refactor this search into a small
sym_idx__lower_bound() helper. The clipping helper (symbol-elf.c:626)
and the exact-start IRELATIVE lookup (symbol-elf.c:2176) will use it,
while ordinary non-overlapping interval lookups will use bsearch().


> >  int dso__synthesize_plt_symbols(struct dso *dso, struct symsrc *ss)
> >  {
> >       uint32_t idx;
> > @@ -623,6 +650,8 @@ int dso__synthesize_plt_symbols(struct dso *dso, struct symsrc *ss)
> >       if (!elf_section_by_name(elf, &ehdr, &shdr_plt, ".plt", NULL))
> >               return 0;
> >
> > +     dso__clip_ondemand_symbols_at(dso, shdr_plt.sh_offset);
>
> Why is this needed?
>

Lazy address lookup uses the index, not the rb-tree. Without clipping
the index at .plt, a preceding fill-forward range can claim PLT IPs
before dso__synthesize_plt_symbols() inserts the PLT symbols. This is
the same truncation the eager path already does on the rb-tree
(symbol-elf.c:680). I will add that explanation at the call site in
v2.

> > +
> > +     /* Alias dedup: keep only the best symbol for each start address */
> > +     if (!symbol_conf.allow_aliases) {
>
> Probably better to factor out the dedup logic into a function.
>

I will factor out the duplicate-selection policy into
symbol__choose_best() and use it in both the eager and lazy paths. The
surrounding dedup loops remain separate because the eager path uses
rb-tree struct symbol objects while the lazy path uses compact index
entries before materialization.

> > +             u32 out = 0;
> > +
> > +             for (i = 0; i < count; i++) {
> > +                     u32 best = i;
> > +                     const char *na = NULL, *nb;
> > +                     char *da = NULL, *db;
> > +
> > +                     /* name_off is the strtab index (st_name) */
> > +                     na = elf_strptr(elf, shdr.sh_link,
> > +                                     od->sorted[best].name_off);
> > +                     if (na) {
> > +                             da = dso__demangle_sym(dso, 0, na);
> > +                             if (da)
> > +                                     na = da;
> > +                     }
> > +
> > +                     /* Find the best among all entries with this start */
> > +                     for (j = i + 1; j < count &&
> > +                          od->sorted[j].start == od->sorted[i].start; j++) {
> > +                             nb = elf_strptr(elf, shdr.sh_link,
> > +                                             od->sorted[j].name_off);
> > +                             if (!na || !nb)
> > +                                     continue;
> > +
> > +                             /* Demangle for comparison, matching eager path */
> > +                             db = dso__demangle_sym(dso, 0, nb);
> > +                             if (db)
> > +                                     nb = db;
> > +
> > +                             /* od->sorted[].end holds st_size at this point */
> > +                             if (choose_best_symbol_raw(
> > +                                         od->sorted[best].end,
> > +                                         od->sorted[best].type,
> > +                                         od->sorted[best].binding, na,
> > +                                         od->sorted[j].end,
> > +                                         od->sorted[j].type,
> > +                                         od->sorted[j].binding, nb) == SYMBOL_B) {
> > +                                     best = j;
> > +                                     free(da);
> > +                                     da = db;
> > +                                     na = nb;
> > +                             } else {
> > +                                     free(db);
> > +                             }
> > +                     }
> > +
> > +                     free(da);
> > +                     od->sorted[out++] = od->sorted[best];
> > +                     i = j - 1; /* skip past all aliases of this start */
> > +             }
> > +
> > +             if (out < count) {
> > +                     struct sym_idx *shrunk;
> > +
> > +                     shrunk = realloc(od->sorted, out * sizeof(*od->sorted));
> > +                     if (shrunk) {
> > +                             od->sorted = shrunk;
> > +                             od->nr_alloc = out;
> > +                     }
> > +             }
> > +             count = out;
> > +     }
> > +
> > +     /* Convert st_size to end addresses */
> > +     for (i = 0; i < count; i++) {
> > +             u64 size = od->sorted[i].end; /* was st_size */
> > +
> > +             if (size > 0)
> > +                     od->sorted[i].end = od->sorted[i].start + size;
> > +             else if (i + 1 < count)
> > +                     od->sorted[i].end = od->sorted[i + 1].start;
> > +             else
> > +                     /* Match symbols__fixup_end's last-symbol formula. */
> > +                     od->sorted[i].end = roundup(od->sorted[i].start, 4096) + 4096;
> > +     }
> > +
> > +     /*
> > +      * Keep a private fd open for pread() of symbol names.  Dup with
> > +      * O_CLOEXEC so children don't inherit it, and so that
> > +      * symsrc__destroy() can close the original regardless of whether
> > +      * it is a real file or a temporary debugdata extraction.
> > +      *
> > +      * If the dup fails (e.g. fd exhaustion), decline by returning 0
> > +      * without setting the index: the caller falls back to the eager
> > +      * loader so the DSO still gets symbols rather than going symbol-less.
> > +      */
> > +     od->fd = fcntl(syms_ss->fd, F_DUPFD_CLOEXEC, 0);
> > +     if (od->fd < 0) {
> > +             free(od->sorted);
> > +             free(od);
> > +             return 0;
> > +     }
> > +     od->strtab_offset = strtab_offset;
> > +     od->strtab_size = strshdr.sh_size;
> > +     od->nr_sorted = count;
> > +
> > +     symbol__account_bytes(od->nr_alloc * sizeof(*od->sorted));
> > +
> > +     dso__set_ondemand(dso, od);
> > +
> > +     pr_debug("%s: on-demand index: %u symbols\n",
> > +              dso__long_name(dso), count);
> > +
> > +     return 1;
> > +}
> > +
> > +/*
> > + * Read a NUL-terminated symbol name from the file's string table at
> > + * file offset @off.  The fast path uses a stack buffer; if the NUL is
> > + * not found within it (names can exceed 1 KiB for template-heavy C++
> > + * mangled names), grow a heap buffer geometrically from 4 KiB, doubling
> > + * until the terminator is found or the strtab is exhausted.  This keeps
> > + * a single long name cheap even when it sits near the start of a large
> > + * (tens of MB) strtab, while bounding a corrupt/missing terminator by
> > + * the remaining strtab size.
> > + *
> > + * Returns a pointer to the name (either @buf or a heap allocation) and
> > + * sets *@to_free to the buffer that must be free()d (NULL for @buf).
> > + * Returns NULL on read error or if no NUL terminator exists within the
> > + * strtab bounds.
> > + */
>
> We have dso-cache APIs to read file data (dso__data_read_offset) and it
> manages file descriptors so you don't need to worry about FD exhaustion.
>

Thanks, I will use dso__data_read_offset() in v2 and remove the
per-index retained fd. I will configure the data-cache reads with the
same symbol-file path and namespace used to build the index, so
split-debuginfo string-table offsets are not read from the runtime
image.


> > +struct symbol *dso__find_symbol_ondemand(struct dso *dso, u64 addr)
> > +{
> > +     struct dso_ondemand *od = dso__ondemand(dso);
> > +     u32 lo, hi, mid;
> > +     const char *name;
> > +     char namebuf[1024];
> > +     char *name_heap = NULL;
> > +     char *demangled;
> > +     struct symbol *s = NULL;
> > +
> > +     if (!od || !od->sorted || od->fd < 0)
> > +             return NULL;
> > +
> > +     lo = 0;
> > +     hi = od->nr_sorted;
> > +     while (lo < hi) {
> > +             mid = (lo + hi) / 2;
> > +             if (addr < od->sorted[mid].start)
> > +                     hi = mid;
> > +             else if (addr >= od->sorted[mid].end)
> > +                     lo = mid + 1;
> > +             else
> > +                     goto found;
> > +     }
>
> bsearch()?
>

Yes. In v2, the default deduplicated index has non-overlapping ranges,
so this lookup will use bsearch() with an interval comparator.
With --allow-aliases, two symbols can cover the same address.
bsearch() then cannot reliably choose which alias to return, so that
uncommon case keeps the explicit search.
