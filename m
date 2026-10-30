Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793383062;
	b=ow3h4RxKICiZNITH9d8kIQ3gd1l7HBy83v6rPzrWibsnYCzKNRHxw1lO57XeG9fqH2KJ
	 oo9kV9FBDCmo3nOBIAb3EdzTI7N9ruFp4U+r5bcbCuiQFiyg6y/v5q13bEHLFWWBYpoW5
	 StRZF+KWp6wZO1cNIBbq/Rom3gHIACSDwv3yqAyFNQhL397dTFXzxL+Tm0cUp6vTq91vf
	 EJy8H44oCXSEeeQdNvURkRZh6VR56qaMZKFHsrl1CmM+6UDpHk4VKtGiN3Y4JAA2VZzdr
	 ipOuMHE4NsgrAgNZS8o8bjI7iHVKwqBei05U68HxY9Sp3Xa6PJJrUlmcMEJZ4ti5qog==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793383062;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=fNRaBfzqRvvt6e8Vo9AaSkqBuyDmthUruiTO+cQHOf4=;
	b=PFnDCxAGoc+H5nK9ql/dXPyBksUowypxtfou65unXGrepB5spDTNIZX0y7aymXva3e7o
	 Uin6y8iSHd/IlHTeBMsOFfC2wgkEmvWz/L64dsEkgPzbr+OwLIZoZ9Jo2RIoe5mhE8nup
	 P+7IK6HMyUbkHyO0X1WIt6H3UT+sVPabgCPzuM1NmsbeU+fNVe/0y4jFoYrXN202k3mEL
	 rMr57PKcBJ1VmAlmj9NDz829MV3KST+HjCbwv3dWCuapSOShovommB6jFmOj51JOgMOJ6
	 BvmgbLPEyosbc13VI6WTuKXdWeVMfxvNcIq2Opljc4qppTQh9oELHYsyoTiBxWcUPLQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=cOTVCyhO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.174
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5128B606A337
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 17:57:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5128B606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=cOTVCyhO
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-5383c97c8cfso17741cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 10:57:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793383060; cv=none;
        d=google.com; s=arc-20260327;
        b=FIWDgultJeZm47PjSVED2mZ7Fu2jIA/OY3iilz8PLgqVfiGuWAm4XybWVDzUBz4mmj
         c9uUoY9n/vEMlsWQtld/jMkzuFlcv4dcWdBiWR57qrQqRlmXPDORl9fgNBRhlC0w6jX/
         W+pEKSEwiphu49yBrMdhXSnSUe2ZomXHVbUC1sFVMlYXt13FWSf+K24iMsarCX9uq9Tn
         C3v4RYPoD3e3GcBQowoKflLxOMvoorMjPKAGH1rS6W1obW6NDRyvl7tYVCiOAqKxUmM9
         mhCkGrD1c2rg6E6ARIRBIh5tmRZvIXybYFvy41pSjNiN91F42U5QAkohq9BZxBjv6/fq
         B6NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fNRaBfzqRvvt6e8Vo9AaSkqBuyDmthUruiTO+cQHOf4=;
        fh=uv77UvVkshFDNqP5We2ANEu+XAdXHuJqcTANwYuALbw=;
        b=J09yk1IOjXyE2ZRfgUOT2LgKwyh0lK3F5du1rX4k/yjINrlFzt3DJsLbLZTMRJC1/b
         ePp9JjL3Um5h4Rky8Fouz/qiyVlalMI7li+8Z38UgKeYuDZFaZsndH1dDWpw5sEW+ebh
         wPSxL2Pwhc2uO/C9KjrAdSMtAVsltSU4Ejnc1qdPvYEGH4HFMrjVUZbUCX2M03zIHneT
         ZIUuZ7JzK9FIR84btQKhvCA9+WUwLzzSkw87zmvwtA9J5iCvspAip0tzyjm1nSTUt4rP
         9WRgGDKb3dOKzr0Qdfsk0L/VPvEZfiGUYdbxATJAAX19XUJDbSAQH5iYNQ1hCYnb8yKZ
         Cscw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793383060; x=1793987860; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fNRaBfzqRvvt6e8Vo9AaSkqBuyDmthUruiTO+cQHOf4=;
        b=cOTVCyhONfGDWOHC1fpCeHdYPsCmY2FDjGDjnbGtxZtRNmr5SNm8Qxi3mr6idMHZZ9
         sQQyU9F4WJTCO4haP5ZQ05oE17cH3m5zgGIcCO3gIO/1cN9jv77c9bkfGqE0la8wQx/l
         Cm/Y4YgBS3yTsl6/zWcpDJPtT+HdqxJgFMM/x28DTg/M5FkKMkhCbTjzxbfqov7nNLBi
         zltRCuozPZw2GVz6WllSuwIu5VyQY8BJbYixhvXqieXdQe3OjK+yxTwRjci8ruYEnFrr
         GQ6Xl8dPWG3DNmTqzniTbmpbsF2rmfWilOhEh4MIQsdqOhaLjHLfGioPaXv69OFuyOm5
         oRXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793383060; x=1793987860;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fNRaBfzqRvvt6e8Vo9AaSkqBuyDmthUruiTO+cQHOf4=;
        b=Mu8rY+9zdgu36rMXaKy+vqt/RVTyJwtrI+JFtHDN32q+h3HBukLHQU1aZpQTGQ78AE
         509zTQpWK+ET7VgSSm4SHFOdJdbdZ82Dt775JZ9ZTkRuSrEXxr3mgUHmbmIfSnLPL+Xe
         Xufu/5tNw53jlU/CSNU5EIg6an1cZsom31rBxk+PolkhB/j5qempkKunksW5FS+IVPq/
         DI99wEc54oS4LBUiYeKTm0GWqM3VVfFzu0fLbzhYEfY6rljy8gVGvS4f+cYZW6XptKMr
         HmPHOdQ13hwlITo6I3C6PfjB7RZmmFbCGBDwOG3/HX30kw97yQ5TIK46e23apzYtzFh1
         WOjg==
X-Forwarded-Encrypted: i=1; AKwUvBzie3OyXTi8yKsr8au1XA4JhonQ+8a2STUdK+Is3mEBApS4E59IS73MP2j7KfpL6oiCnuErkncimy+cVPQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIVD6YnKTnmEKvNdbxQhojbkSDXV1xXWjI13tjpZ+81jLO8B3Ef
	N9QGdvMxZiEg4k7tq30TgU+dNSXouCEYyGKzmq++WS/TsSmhteomjUQNWszSZVNnuNyd3yqx/rQ
	y7pwTEMDvBjk0O5ciNGvf2bwcFluPN2J73TPOET2U8uWdLA6BQR9iNJyM
X-Gm-Gg: AYBFou28VJKb1Nwq8vOx+F8Ggpst3J86yXjiRWp/WMA6KiM7P9OznXNbQz63dl47lG4
	xtjh6s0ocPm7FozgQkucA9vlnEJq9kDv8NxS5oK2wl/qrjOMtmJl3RUgm66iuo3GH4WdxHGbMhd
	pWsCLvJ3Jpy7RJaLOCNwR+5PfLK7ry76BRxe26xj7+1giIPWLXtANr5ywXBUp2/+yzoTELJslI4
	ZaFrS6emaltuiQa91Yvi7SXz+Loijnu6H7KuhbhxCJm4ZJVomjrEuZ4moAxEdgPvF8Gt2VhM3q5
	7kizfGak4wYx/Qq9+726UhpcpJPKg0gTjZWaS21R2GjDiBEnSPPoxUe83CVP8d5wWjb5c2uWSGt
	xa8PoVv3gwM73VFOMd7IOGOlhKQtRx4i1DJWK4mgOERir/mHuzzm30KKg1u52ayDmU0s=
X-Received: by 2002:a05:622a:2505:b0:534:313:9b4e with SMTP id
 d75a77b69052e-5412dc042bcmr48323571cf.5.1793383059092; Fri, 30 Oct 2026
 10:57:39 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260928075237.3055101-1-irogers@google.com> <20261027231513.816148-1-irogers@google.com>
 <CAP-5=fUpji7seZpsxh0BN05oAA6nMUyM-bNdHBg4YfkeNAT00A@mail.gmail.com>
 <CA+w=M=TEYScc9rDyzthN75Ym41ATXoNLNu8_yj0dsjymb+m7jA@mail.gmail.com> <CAP-5=fX211V8=NCWyr9btd7=hbBB=oiMDETxCDdVr49idP13Fw@mail.gmail.com>
In-Reply-To: <CAP-5=fX211V8=NCWyr9btd7=hbBB=oiMDETxCDdVr49idP13Fw@mail.gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Fri, 30 Oct 2026 10:57:27 -0700
X-Gm-Features: AclHuK93N5koALpnpWeQQW97Yq3j-yRNZPMGmFrIJp-QcISTfDvQLo2s3xQ9CR8
Message-ID: <CAP-5=fUJy=fZg3t0z7L=uKVVRjg8OQtCL3KxFR8Mrv-yVCtuzA@mail.gmail.com>
Subject: Re: [PATCH v2 00/18] perf symbol: Reference counting, sorted arrays,
 and memory shrinking
To: Alireza Haghdoost <haghdoost@uber.com>
Cc: acme@kernel.org, namhyung@kernel.org, adrian.hunter@intel.com, 
	james.clark@linaro.org, jolsa@kernel.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2026 at 9:10=E2=80=AFAM Ian Rogers <irogers@google.com> wro=
te:
>
> On Fri, Oct 30, 2026 at 7:02=E2=80=AFAM Alireza Haghdoost <haghdoost@uber=
.com> wrote:
> >
> > Hi Ian,
> >
> > I applied v2 on perf-tools-next e74880764bf9 with the ELF_C_READ_MMAP
> > fix and your three fixes, and compared it with the same tree without
> > the 18 patches. I posted comments are on the individual patches; this i=
s the
> > summary.
> >
> > On a profile of a large C++ service, about 1M symbols, perf script and =
perf r
> > eport output is byte-identical and roughly 22-32% faster:
> >
> > Execution time and peak RSS before and after:
> > perf script                                3.3s 334 MiB vs 2.25s 332 Mi=
B
> > perf report --sort dso,sym       3.0s 389 MiB vs 2.25s 386 MiB
> > perf report --children -g caller 4.6s 706 MiB vs 3.60s 703 MiB
> >
> > Peak RSS barely moves. sizeof(struct symbol) goes from 48 to 32 bytes,
> > but the address array adds a pointer per symbol back, so the net is
> > about 8 bytes per symbol before malloc rounding. That is under 1%
> > here.
>
> Thanks for your work and running the numbers! I think we should aim to
> land your lazy loading patches ahead of these patches. The merge
> conflicts don't look like they'll be too terrible, wdyt?
>
> Since the merge window for Linux v7.4 is currently open, I don't see
> anything landing before November 1st. So I can do a v3 incorporating
> your suggestions and rebase it on top of your patches when they land.
> I'll work on pulling out the fixes (you highlighted some you thought
> were particularly worthwhile) to mail for v7.4 for now.

Chatting with Namhyung he mentions having the arrays in the DSOs be a
`struct symbol[]` rather than a `struct symbol *[]`, because the
number of symbols could be known for a DSO when we load the symbols.
Currently this isn't possible because of things like the
annotated_symbol that this series turns into a side table. I'm not
sure it is possible in general to use an array of symbols, as JIT code
may need the symbols array to be realloc-ed and the realloc would
potentially invalidate any `symbol *` that had been given out. Maybe
we can treat that as a special case. In this scenario, the symbol's
lifetime would tie to the DSO's lifetime, allowing us to use the DSO
reference count instead of needing one per symbol. It would still be
nice to add functions like session__malloc so that we can reduce the
memory footprint of a session when memory allocations fail. I still
think this is work to land on top of your series.

Thanks,
Ian

> Thanks,
> Ian
>
> > Thanks
> > Alireza
> >
> > On Wed, Oct 28, 2026 at 1:29=E2=80=AFPM Ian Rogers <irogers@google.com>=
 wrote:
> > >
> > > On Tue, Oct 27, 2026 at 4:15=E2=80=AFPM Ian Rogers <irogers@google.co=
m> wrote:
> > > >
> > > > When profiling large binaries or long-running workloads with many D=
SOs and
> > > > threads, symbol and DSO tables frequently dominate perf's memory fo=
otprint
> > > > and startup latency. Currently `struct symbol` has several structur=
al
> > > > limitations:
> > > >
> > > > 1. Every `struct symbol` embeds a 24-byte `struct rb_node` for the
> > > >    `dso->symbols` address rbtree, plus an optional negative-offset
> > > >    allocation prefix (`symbol_conf.priv_size`) for TUI browser indi=
ces,
> > > >    `db-export` IDs, or `struct annotation` state even when only a t=
iny
> > > >    fraction of symbols are ever annotated or exported.
> > > > 2. Unlike `struct map`, `struct dso`, and `struct thread`, `struct =
symbol`
> > > >    is not reference-counted: once loaded into a `struct dso`, symbo=
ls can
> > > >    never be safely evicted while `hist_entry`, `callchain_cursor_no=
de`, or
> > > >    `map_symbol` references exist, and `dso__symbols()` has no inter=
nal
> > > >    synchronization against concurrent readers/writers.
> > > > 3. ELF symbol table loading (`dso__load_sym_internal()`) repeatedly
> > > >    invokes `libelf` section/program header lookups per symbol, call=
s
> > > >    `elf_sym__name()` before filtering out non-function/non-allocate=
d
> > > >    symbols, runs Rust/Java demanglers on plain C symbols without fa=
st-path
> > > >    prefix checks, and resorts `dso->symbols` with `qsort()` even wh=
en ELF
> > > >    symbol tables are already largely ordered in ascending address r=
uns.
> > > >
> > > > This series modernizes `struct symbol` to match the rest of `tools/=
perf/util`
> > > > (`DECLARE_RC_STRUCT`, `struct rw_semaphore`, sorted pointer arrays)=
 and
> > > > introduces symbol/DSO memory shrinking and faster ELF symbol loadin=
g:
> > > >
> > > > - Patch 1 adds `perf bench internals symbols` and `perf bench inter=
nals maps`
> > > >   to benchmark ELF symbol loading, bulk symbol insertion/sorting/lo=
okup,
> > > >   incremental symbol appends, ascending map insertion, and incremen=
tal map
> > > >   appends.
> > > > - Patch 2 adds fast-path prefix checks in `dso__demangle_sym()` (be=
fore
> > > >   calling `rust_demangle_demangle()`, keeping `demangle-rust-v0.c`
> > > >   unmodified relative to upstream `rustc-demangle`) and in
> > > >   `java_demangle_sym()`.
> > > > - Patches 3-6 encapsulate `struct symbol` field access behind acces=
sor
> > > >   functions (annotated with `__attribute__((nonnull))`) and replace=
 the
> > > >   negative-offset `symbol_conf.priv_size` allocation prefix with on=
-demand
> > > >   browser index calculation and per-DSO/per-exporter hashmaps for
> > > >   `db-export` and `struct annotation`.
> > > > - Patch 7 replaces `dso->symbols` (`rb_root_cached`) and `dso->symb=
ol_names`
> > > >   with a locked `struct symbols` container backed by sorted pointer=
 arrays
> > > >   (`symbols` and `symbols_by_name`) protected by a `struct rw_semap=
hore`,
> > > >   removing `struct rb_node` from `struct symbol`.
> > > > - Patch 8 wraps `struct symbol` in `DECLARE_RC_STRUCT(symbol)` with
> > > >   `refcount_t` (`symbol__get()` / `symbol__put()` / `symbol__zput()=
`) for
> > > >   sanitizer-checked reference counting across `map_symbol`, `addr_l=
ocation`,
> > > >   `hist_entry`, `callchain`, `thread_stack`, and `db-export`.
> > > > - Patch 9 replaces `qsort()` in `struct symbols` with a natural-run=
 merge
> > > >   sort and galloping merge (taking advantage of pre-ordered runs in
> > > >   `.symtab`/`.dynsym` and `kallsyms`) plus an in-place binary inser=
tion
> > > >   fast path for small incremental appends.
> > > > - Patch 10 applies the same incremental binary-insertion sort and a=
n O(1)
> > > >   tail-insertion fast path to `struct maps` for `/proc/<pid>/maps` =
synthesis
> > > >   and runtime `PERF_RECORD_MMAP2` / JIT map insertions.
> > > > - Patch 11 caches ELF program and section headers during
> > > >   `dso__load_sym_internal()`, defers `elf_sym__name()` string table=
 lookups
> > > >   until after symbol filtering, and runs `symbols__fixup_end()` /
> > > >   `symbols__fixup_duplicate()` once per DSO load.
> > > > - Patches 12-17 add `down_read_trylock()` / `down_write_trylock()`,=
 protect
> > > >   `machines->guests` with a `rw_semaphore`, implement `symbols__shr=
ink()`,
> > > >   `dso__shrink()`, `dsos__shrink()`, and `perf_session__shrink()` (=
with
> > > >   transparent on-demand reload in `dso__load()` that preserves poin=
ter
> > > >   identity for retained symbols), and provide `perf_session__malloc=
()` /
> > > >   `zalloc()` / `calloc()` / `realloc()` / `strdup()` wrappers that
> > > >   automatically shrink unreferenced symbols and DSOs on allocation =
failure.
> > > > - Patch 18 adds unit tests in `perf test symbols` covering sorted s=
ymbol
> > > >   insertion, symbol/DSO shrinking, transparent DSO reload after shr=
ink, and
> > > >   session allocation wrappers.
> > > >
> > > > End-to-end benchmark results across the series:
> > > >
> > > >   perf bench internals symbols (perf binary):
> > > >     Average DSO load + sort:      7.348 msec ->   5.324 msec (-27.5=
%)
> > > >     Average DSO memory usage:        1401 KB ->      1308 KB ( -6.6=
%)
> > > >     Average bulk insert + lookup: 1453.95 us -> 1161.00 us   (-20.1=
%)
> > > >     Average append + lookup (200 interior inserts into 10,000 symbo=
ls):
> > > >       rbtree: 42.85 us -> array+qsort: 40429.75 us -> array+binary-=
insert: 152.70 us
> > > >
> > > >   perf bench internals symbols -b libLLVM.so.21.1:
> > > >     Average DSO load + sort:     81.196 msec ->  62.582 msec (-22.9=
%)
> > > >     Average DSO memory usage:        9530 KB ->      9164 KB ( -3.8=
%)
> > > >
> > > >   perf bench internals symbols -b libLLVM.so.21.1 --no-demangle:
> > > >     Average DSO load + sort:     32.675 msec ->  19.122 msec (-41.5=
%)
> > > >     Average DSO memory usage:        7589 KB ->      7229 KB ( -4.7=
%)
> > > >
> > > >   perf bench internals maps:
> > > >     Average ascending insert + lookup:   63.37 us -> 58.97 us ( -6.=
9%)
> > > >     Average append + lookup:           7477.45 us -> 96.67 us (-98.=
7%, 77.3x faster)
> > > >
> > > > Net performance and memory trade-offs:
> > > > - Replacing the per-symbol rbtree (`struct rb_node`) and negative-o=
ffset
> > > >   `symbol_conf.priv_size` allocation prefix with a contiguous sorte=
d pointer
> > > >   array reduces per-symbol heap overhead by 16 to 24+ bytes (saving=
 3.8% to
> > > >   6.6% of total DSO symbol table heap memory unconditionally, and a=
llowing
> > > >   unreferenced symbols and DSOs to be shrunk on demand under memory
> > > >   pressure).
> > > > - For the dominant symbol workloads=E2=80=94loading ELF binaries (`=
-22.9%` to
> > > >   `-41.5%`) and bulk symbol insertion, sorting, and lookup (`-20.1%=
`)=E2=80=94the
> > > >   contiguous array, natural-run merge sort, ELF header caching, and
> > > >   demangler fast paths yield substantial speedups over the rbtree b=
aseline.
> > > > - For synthetic single-symbol interior insertions interleaved with =
immediate
> > > >   lookups into an already-large 10,000-symbol DSO (`dso__insert_sym=
bol()`),
> > > >   an rbtree rotation takes ~0.21 us/op (`42.85 us` for 200 ops) whe=
reas
> > > >   shifting the contiguous pointer array tail with `memmove()` after=
 binary
> > > >   search takes ~0.76 us/op (`152.70 us` for 200 ops, down from `404=
29.75 us`
> > > >   with naive `qsort()`). In real workloads, symbols are either load=
ed in
> > > >   bulk (`dso__load()`) or inserted into small per-prog BPF/JIT DSOs=
 where
> > > >   the array fits in a few cache lines, making this sub-microsecond
> > > >   difference negligible in practice.
> > > > - Overall, the series reduces memory consumption across all workloa=
ds while
> > > >   significantly improving=E2=80=94or remaining neutral on=E2=80=94r=
untime performance.
> > > >
> > > > v2:
> > > > - Rebased onto perf-tools-next (dropping "perf symbols: Fix broken
> > > >   ELF_C_READ_MMAP fallback guard", which was merged upstream, and s=
plitting
> > > >   "perf libdw: Optimize fallback logic for missing DWARF" into a se=
parate
> > > >   fixes series).
> > > > - Added 'perf bench internals symbols' and 'perf bench internals ma=
ps'
> > > >   benchmarks (Patch 1) and included before/after numbers in the opt=
imization
> > > >   patches.
> > > > - Added __attribute__((nonnull)) annotations to struct symbol acces=
sor
> > > >   functions (Patch 3).
> > > > - Split the symbol_conf.priv_size removal patch into three separate=
 patches
> > > >   for map_browser (Patch 4), db-export (Patch 5), and annotate (Pat=
ch 6).
> > > > - Added dedicated optimization patches for Rust/Java demangler pref=
ix checks
> > > >   (Patch 2), natural-run merge sort and binary insertion in struct =
symbols
> > > >   (Patch 9), tail-insertion and incremental binary-insertion sort i=
n struct
> > > >   maps (Patch 10), and ELF program/section header caching and defer=
red
> > > >   symbol name lookup (Patch 11).
> > > > - Replaced periodic heuristic LRU shrinking and windowed ELF symbol=
 loading
> > > >   with on-demand shrinking (symbols__shrink(), dso__shrink(),
> > > >   dsos__shrink(), perf_session__shrink()) triggered on allocation f=
ailure via
> > > >   session-scoped allocation wrappers, plus transparent DSO reload p=
reserving
> > > >   retained symbol pointers (Patches 12-18).
> > > >
> > > > v1: https://lore.kernel.org/lkml/20260928075237.3055101-1-irogers@g=
oogle.com/
> > > >
> > > > Assisted-by: Antigravity:gemini-3.1-pro
> > > > Signed-off-by: Ian Rogers <irogers@google.com>
> > >
> > > So Sashiko failed to apply the patches (local Sashiko runs were clean=
)
> > > because I had these four patches applied locally:
> > >  - Alireza's "perf symbols: Fix broken ELF_C_READ_MMAP fallback guard=
"
> > >    https://lore.kernel.org/linux-perf-users/20261005-perf-symbol-memo=
ry-send-v5-1-165dceb2b049@uber.com/
> > >  - My fixes in "perf: Fix libdw addr2line fallback, pr_debugN
> > > overhead, and cumulative hist decay"
> > >    https://lore.kernel.org/linux-perf-users/cover.1792995775.git.irog=
ers@google.com/
> > >
> > > Hopefully the patches above won't take too long to land, so I'll hold
> > > off sending v3 until then.
> > >
> > > Thanks,
> > > Ian
> > >
> > > > Ian Rogers (18):
> > > >   perf bench internals: Add symbols and maps benchmarks
> > > >   perf demangle: Add fast-path prefix checks for Rust and Java
> > > >     demanglers
> > > >   perf symbol: Add accessor functions for struct symbol fields
> > > >   perf map_browser: Compute symbol browser index on demand
> > > >   perf db-export: Store symbol database IDs in a hashmap
> > > >   perf annotate: Move struct annotation to a hashmap and remove
> > > >     symbol_conf.priv_size
> > > >   perf symbol: Switch backing storage from rbtree to struct symbols
> > > >     array
> > > >   perf symbol: Add reference counting and DECLARE_RC_STRUCT(symbol)
> > > >   perf symbol: Optimize symbol sorting with natural-run merge sort =
and
> > > >     binary insertion
> > > >   perf maps: Optimize tail insertion and small-append sorting
> > > >   perf symbol-elf: Cache ELF program/section headers and defer symb=
ol
> > > >     name lookup
> > > >   perf rwsem: Add down_read_trylock() and down_write_trylock()
> > > >   perf vdso: Constify dso parameter in dso__is_vdso()
> > > >   perf machine: Protect machines->guests rbtree with a rw_semaphore
> > > >   perf symbol: Add memory shrinking for symbols, DSOs, and machines
> > > >   perf session: Add dso__session() and session-scoped allocation
> > > >     wrappers
> > > >   perf symbol: Use session allocation wrappers in symbol, DSO, thre=
ad,
> > > >     and hist paths
> > > >   perf test symbols: Add tests for symbol shrinking and session all=
oc
> > > >     wrappers
> > > >
> > > >  tools/perf/Documentation/perf-bench.txt       |    6 +
> > > >  .../arch/powerpc/util/skip-callchain-idx.c    |    2 +-
> > > >  tools/perf/arch/powerpc/util/sym-handling.c   |   40 +-
> > > >  tools/perf/bench/Build                        |    2 +
> > > >  tools/perf/bench/bench.h                      |    2 +
> > > >  tools/perf/bench/maps.c                       |  186 +++
> > > >  tools/perf/bench/symbols.c                    |  239 +++
> > > >  tools/perf/builtin-annotate.c                 |   22 +-
> > > >  tools/perf/builtin-bench.c                    |    2 +
> > > >  tools/perf/builtin-c2c.c                      |   14 -
> > > >  tools/perf/builtin-diff.c                     |    4 +-
> > > >  tools/perf/builtin-kallsyms.c                 |    9 +-
> > > >  tools/perf/builtin-kmem.c                     |   82 +-
> > > >  tools/perf/builtin-kwork.c                    |    4 +-
> > > >  tools/perf/builtin-lock.c                     |   25 +-
> > > >  tools/perf/builtin-mem.c                      |    2 +-
> > > >  tools/perf/builtin-report.c                   |   14 -
> > > >  tools/perf/builtin-sched.c                    |    6 +-
> > > >  tools/perf/builtin-script.c                   |   18 +-
> > > >  tools/perf/builtin-timechart.c                |    2 +-
> > > >  tools/perf/builtin-top.c                      |   24 +-
> > > >  tools/perf/builtin-trace.c                    |   23 +-
> > > >  tools/perf/tests/builtin-test.c               |    1 -
> > > >  tools/perf/tests/dlfilter-test.c              |   12 +-
> > > >  tools/perf/tests/dwarf-unwind.c               |    2 +-
> > > >  tools/perf/tests/hists_common.c               |    9 +-
> > > >  tools/perf/tests/hists_cumulate.c             |    8 +-
> > > >  tools/perf/tests/hists_filter.c               |   10 +-
> > > >  tools/perf/tests/hists_link.c                 |   16 +-
> > > >  tools/perf/tests/hists_output.c               |    9 +-
> > > >  tools/perf/tests/kallsyms-split.c             |    5 +-
> > > >  tools/perf/tests/maps.c                       |   58 +
> > > >  tools/perf/tests/pe-file-parsing.c            |    1 +
> > > >  tools/perf/tests/symbols.c                    |  454 +++++-
> > > >  tools/perf/tests/vmlinux-kallsyms.c           |  187 ++-
> > > >  tools/perf/ui/browser.c                       |    3 +
> > > >  tools/perf/ui/browsers/annotate.c             |   10 +-
> > > >  tools/perf/ui/browsers/hists.c                |   35 +-
> > > >  tools/perf/ui/browsers/map.c                  |   88 +-
> > > >  tools/perf/ui/gtk/annotate.c                  |    6 +-
> > > >  tools/perf/ui/stdio/hist.c                    |    6 +-
> > > >  tools/perf/util/addr2line.c                   |    8 +-
> > > >  tools/perf/util/addr_location.c               |    4 +
> > > >  .../perf/util/annotate-arch/annotate-alpha.c  |    5 +-
> > > >  .../perf/util/annotate-arch/annotate-arm64.c  |   12 +-
> > > >  .../util/annotate-arch/annotate-loongarch.c   |   15 +-
> > > >  tools/perf/util/annotate-arch/annotate-s390.c |    6 +-
> > > >  tools/perf/util/annotate-arch/annotate-x86.c  |   14 +-
> > > >  tools/perf/util/annotate-data.c               |   12 +-
> > > >  tools/perf/util/annotate.c                    |  211 ++-
> > > >  tools/perf/util/annotate.h                    |    6 +-
> > > >  tools/perf/util/auxtrace.c                    |  111 +-
> > > >  tools/perf/util/block-info.c                  |   12 +-
> > > >  tools/perf/util/bpf_lock_contention.c         |   35 +-
> > > >  tools/perf/util/c2c-function.c                |   32 +-
> > > >  tools/perf/util/call-path.c                   |   15 +-
> > > >  tools/perf/util/callchain.c                   |   23 +-
> > > >  tools/perf/util/capstone.c                    |   22 +-
> > > >  tools/perf/util/data-convert-json.c           |    4 +-
> > > >  tools/perf/util/db-export.c                   |   99 +-
> > > >  tools/perf/util/db-export.h                   |    8 +
> > > >  tools/perf/util/debug.c                       |    3 +-
> > > >  tools/perf/util/demangle-java.c               |   23 +-
> > > >  tools/perf/util/disasm.c                      |   69 +-
> > > >  tools/perf/util/dlfilter.c                    |   12 +-
> > > >  tools/perf/util/dso.c                         |  257 ++-
> > > >  tools/perf/util/dso.h                         |   94 +-
> > > >  tools/perf/util/dsos.c                        |   76 +
> > > >  tools/perf/util/dsos.h                        |    3 +
> > > >  tools/perf/util/event.c                       |   12 +-
> > > >  tools/perf/util/evsel_fprintf.c               |    2 +-
> > > >  tools/perf/util/hist.c                        |   70 +-
> > > >  tools/perf/util/intel-pt.c                    |   74 +-
> > > >  tools/perf/util/libbfd.c                      |   14 +-
> > > >  tools/perf/util/libdw.c                       |    5 +-
> > > >  tools/perf/util/llvm.c                        |    8 +-
> > > >  tools/perf/util/lock-contention.c             |    8 +-
> > > >  tools/perf/util/machine.c                     |  189 ++-
> > > >  tools/perf/util/machine.h                     |    9 +
> > > >  tools/perf/util/map.c                         |   27 +-
> > > >  tools/perf/util/map.h                         |   18 +-
> > > >  tools/perf/util/map_symbol.c                  |    4 +-
> > > >  tools/perf/util/maps.c                        |  284 +++-
> > > >  tools/perf/util/mutex.h                       |    3 +
> > > >  tools/perf/util/probe-event.c                 |  148 +-
> > > >  tools/perf/util/python.c                      |   36 +-
> > > >  tools/perf/util/rwsem.c                       |   20 +
> > > >  tools/perf/util/rwsem.h                       |    2 +
> > > >  tools/perf/util/session.c                     |   78 +
> > > >  tools/perf/util/session.h                     |    8 +
> > > >  tools/perf/util/sort.c                        |   47 +-
> > > >  tools/perf/util/srcline.c                     |   22 +-
> > > >  tools/perf/util/symbol-elf.c                  |  311 +++-
> > > >  tools/perf/util/symbol.c                      | 1438 +++++++++++++=
----
> > > >  tools/perf/util/symbol.h                      |  187 ++-
> > > >  tools/perf/util/symbol_conf.h                 |    1 -
> > > >  tools/perf/util/symbol_fprintf.c              |   37 +-
> > > >  tools/perf/util/thread-stack.c                |   18 +-
> > > >  tools/perf/util/threads.c                     |   17 +-
> > > >  tools/perf/util/unwind-libdw.c                |    4 +-
> > > >  tools/perf/util/unwind-libunwind.c            |    2 +-
> > > >  tools/perf/util/vdso.c                        |    2 +-
> > > >  tools/perf/util/vdso.h                        |    2 +-
> > > >  103 files changed, 4557 insertions(+), 1389 deletions(-)
> > > >  create mode 100644 tools/perf/bench/maps.c
> > > >  create mode 100644 tools/perf/bench/symbols.c
> > > >
> > > > --
> > > > 2.56.0.313.g2479322e68-goog
> > > >
