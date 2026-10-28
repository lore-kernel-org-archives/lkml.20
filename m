Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793219376;
	b=K3x2EZGA+nDoodQbCWGAZhBROHUkOP28q0Dlh1j6WANhGpjLqBcTD6jG6jYlXKCE7Hyw
	 o3ceQCYoq76tMnxfy5xL1qChXm9yUvy0J+rIWkUwrB41DdlrGmCLyZ/3ZG3ZaXhPZdbRN
	 EetaJZIo4H/zPgnHQvUiafAVOoOsccXC0ZJQLJcn2N9Erg4C2Q2KT7ubVPNk2WAiZzuua
	 N4j6Yz6GrvcRMG4oL/qC76pu9m7QivBVsrU9tBwb6wRY2lm1vzQfzmxq0mazOOg+mzsmo
	 ewLemVHUUj8pWpUY75pBk4MK+EcsfKVSkjZAbrD1ixpME4C0Yg2jUu2bYhcbCLCVbbw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793219376;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=MuqIFBBTpVVmusNyw/zMag+M014ehcxQ0ik6vqonuvc=;
	b=OTUpMMwX6viK+pUUPWBUwtdD7Vjg/KFuFB6WxRJIYbdL6hTKtAXtPC8Ffn3AfUjH6AXN
	 KENEH+62CerRKhEkmCYINf4e0auOQCqOe+xAN+5dmTtuKEO2yHNNK+OYGGit34Q5x3qCK
	 HlDgRprl9VswSYlpNW17aKl+ZeoRsSemh8ivSWlgXh1cOK4jC2Jh+gtuXC+lxP8qHh+qS
	 q0YX9751ArYEg5Mhlf/9gDf22r5LcsFNsFyfy7Km6UmtC+Sb07ga6apnRqCWBBPlDV+Mh
	 gkQ1YoVSkmB/2Oq4+1gihN8MKbFKqg+lnZAnE/i3KSufPzwo8feiX7mT1p5wcRH4VPw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=DWAt2nv2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.181
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3B8D606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 20:29:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3B8D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=DWAt2nv2
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-533202fe429so87571cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 13:29:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793219375; cv=none;
        d=google.com; s=arc-20260327;
        b=hQ1jEQddRuveIbZb20Z8F4KRLLnxgKhpIeR8M/5FPIYZUPG5I9FsGmxvE0HTbImtCy
         2YZbE+8zvgfXnTb8xzWpq0gj2/yaafHai6cD0a+9Z5MWvfVgY6y4UVQLHYHIdHyBmrVE
         B52VIisJJr6ZaEiZril4eTlD52YPydZfpcbfOEnXkY09M6KyzdmzxhGp37QVGLfQZz8O
         0TuUTELylsUwoSm6TeYHdvu7LhoFiYzXNNXhslmv1yL7rL7Krk5JNJ+7uTryLBz1umR+
         AnMjU7jBu7WZGb7BWn9pqh7L4pA5Qx0c8ZHWNIrB2PepeBd0iQBcmaUTBFTSLCUE9nXa
         My3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MuqIFBBTpVVmusNyw/zMag+M014ehcxQ0ik6vqonuvc=;
        fh=yu7Tyqzhp6z4sECFpJa9Ax8eYg5F3EhHNU/sE5wkBCc=;
        b=imKeWYNSCLeFq3fWhbZNlP7vnOjkFpslBpf80yGZF4xY/IDBWhaRBlwUGKOhaDpydU
         H2EiFNnJo1nhDCZQz3g0Uoa4x0urnOxrwqZ4VBWfEt7vzH58UjDHWBj3DvdUlDsAcMs3
         N3AQVgBXtW/XvB32x4yXjDGaZBv1u0l9j2AamUcIYHZeMbICzMmvuBwlQuKAb7xFeDjC
         l0KLhzV0NiRKh6KhBjsmhJv7TdKZdjXb1o6uiL4e4tuZKUnyqGUE/IduNRPP+aEjxuZk
         QgdpicmdD/Hp+QFXOHpLnuZWb05sLZxF83wWNF2/OxJHgehiChWvMehYXaQWA4Y5H5IM
         3PZA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793219375; x=1793824175; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MuqIFBBTpVVmusNyw/zMag+M014ehcxQ0ik6vqonuvc=;
        b=DWAt2nv2dtw4fORq0a0I9HJEV/lZ+t8r+SD/lHZgcSB+Vm9iHle9dmB0yHBfYr0Ked
         m8KbrCUJGWCz1Oa/MMRZ6Qr6Fcjsni/i2FzdSEX+vSt275qquBXZY7M3Fl9f4r9wsrK7
         DeEiy2zvZTbizKm4oCYa6xNhwH7vI1Xf/lSRQiKhnB2dnpLs3V706O7IjBvlaMSjPrur
         6ONCBu+ln+ct+jmr1WbxD8DfdDj7J1yqzS0VOKeuNdIsXGVDjjVRD0FMsXX9yngp/jAi
         Uf7GdXbksdRo1LBfjuykFSGGSt9FM+cCbP/Bst8x4mWsmqyIVm0gUXEmvPnE+fLrR2q+
         M7Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793219375; x=1793824175;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MuqIFBBTpVVmusNyw/zMag+M014ehcxQ0ik6vqonuvc=;
        b=V7QjRI3bPcp5lhplUL07r8jkCJwMFYNHpPFiv6iTVFyrlRdJ4Q9O78CkcfsTq/H9/0
         BbR///dmVBGrg660CZjHLpAmEycX3koJUFKw1O6u8MF08n0wzhPRIjyYHyIYe0x+nfCO
         S9DRCC6aNzxvpPDUkcfyn8xewite/Wa1zXTvuPFZeQTIoW7FYdADfUFB0YyjrGAjT7f7
         65UVI1AXuvy/g0WkvugbZ1MBO5x2XOcrHrA91uspDJex1mzgof/Oc3HTGQNLxGY+20UJ
         nrct9PD2IRJCc1IfFy6zj3+CBSzsKgYbBQwdV/sxyrTkS/unS13yIUXVp//jeFJX8aLU
         QpEg==
X-Forwarded-Encrypted: i=1; AKwUvBz46xWbj+cFKHYRlKUDYlv26QkqjIcX5uECJTInUO5xQIbL6mWINCDh0ZKxP2l7bbhuHLIDpk4E2D1HhZY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJFitvc3uIECuP81KmTcKSwPklnXchrj1piCCHGvp7peZQGcHy2
	nkWDNBaVzsZsA/UuEvo72UbKZH29lq9Ho/wT1ckUXuw2jEOtX1BueU8iawcCTqBINvFIOtPi+E1
	xo6T9ewo0jmBsFMREJlHPdc0QJm9g3ObRfA2YjlW8
X-Gm-Gg: AYBFou3NThZYTOwTOBuA6EYiQki4SK0Pionxk09fr9IiPZy+9g2NuAIfKm0lvwoCiwd
	2KrcS+/XoLCN4A4poGUlMUWP9/xEwQoOfiRsHSKH+4AzikTVCLzsE5Lg+bNvh0q7YHSSOWpd8fV
	bsZNMe6h/fH0NJsYosP6JyoOL17SVejEgQQzDw5V88T4sah75w3KL3fCF/HRU7OWQAoNhDq6rOz
	As1dD7aq4EpSrKMbQnqditIek9F1Q1P3FqeV7aKmn2hvKqish6GTnkMMjlse1IiZqdncJBOMSGX
	cTh3c95EwAKBo3Detziitim03d0wqqZe7KF08uWwHAMRtcKRhFPHUxAZ5SDchurC9iBCH6LY4zG
	ZAt9gQMjuv6oz6MqcuO6dsbosjcYFXTweIg0Rf0ZgKWeEM7Z9gHr+9XcWWEhKteqp+g==
X-Received: by 2002:a05:622a:2b45:b0:532:eff8:3491 with SMTP id
 d75a77b69052e-5414ebdf590mr1311751cf.14.1793219374139; Wed, 28 Oct 2026
 13:29:34 -0700 (PDT)
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
In-Reply-To: <20261027231513.816148-1-irogers@google.com>
From: Ian Rogers <irogers@google.com>
Date: Wed, 28 Oct 2026 13:29:22 -0700
X-Gm-Features: AclHuK9LsRq3AFOuUtMhVJJByAsQtySoABYKQMke3WBI3nQ2dmNsf6TsoJhTJUg
Message-ID: <CAP-5=fUpji7seZpsxh0BN05oAA6nMUyM-bNdHBg4YfkeNAT00A@mail.gmail.com>
Subject: Re: [PATCH v2 00/18] perf symbol: Reference counting, sorted arrays,
 and memory shrinking
To: irogers@google.com, acme@kernel.org, namhyung@kernel.org
Cc: adrian.hunter@intel.com, haghdoost@uber.com, james.clark@linaro.org, 
	jolsa@kernel.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 4:15=E2=80=AFPM Ian Rogers <irogers@google.com> wro=
te:
>
> When profiling large binaries or long-running workloads with many DSOs an=
d
> threads, symbol and DSO tables frequently dominate perf's memory footprin=
t
> and startup latency. Currently `struct symbol` has several structural
> limitations:
>
> 1. Every `struct symbol` embeds a 24-byte `struct rb_node` for the
>    `dso->symbols` address rbtree, plus an optional negative-offset
>    allocation prefix (`symbol_conf.priv_size`) for TUI browser indices,
>    `db-export` IDs, or `struct annotation` state even when only a tiny
>    fraction of symbols are ever annotated or exported.
> 2. Unlike `struct map`, `struct dso`, and `struct thread`, `struct symbol=
`
>    is not reference-counted: once loaded into a `struct dso`, symbols can
>    never be safely evicted while `hist_entry`, `callchain_cursor_node`, o=
r
>    `map_symbol` references exist, and `dso__symbols()` has no internal
>    synchronization against concurrent readers/writers.
> 3. ELF symbol table loading (`dso__load_sym_internal()`) repeatedly
>    invokes `libelf` section/program header lookups per symbol, calls
>    `elf_sym__name()` before filtering out non-function/non-allocated
>    symbols, runs Rust/Java demanglers on plain C symbols without fast-pat=
h
>    prefix checks, and resorts `dso->symbols` with `qsort()` even when ELF
>    symbol tables are already largely ordered in ascending address runs.
>
> This series modernizes `struct symbol` to match the rest of `tools/perf/u=
til`
> (`DECLARE_RC_STRUCT`, `struct rw_semaphore`, sorted pointer arrays) and
> introduces symbol/DSO memory shrinking and faster ELF symbol loading:
>
> - Patch 1 adds `perf bench internals symbols` and `perf bench internals m=
aps`
>   to benchmark ELF symbol loading, bulk symbol insertion/sorting/lookup,
>   incremental symbol appends, ascending map insertion, and incremental ma=
p
>   appends.
> - Patch 2 adds fast-path prefix checks in `dso__demangle_sym()` (before
>   calling `rust_demangle_demangle()`, keeping `demangle-rust-v0.c`
>   unmodified relative to upstream `rustc-demangle`) and in
>   `java_demangle_sym()`.
> - Patches 3-6 encapsulate `struct symbol` field access behind accessor
>   functions (annotated with `__attribute__((nonnull))`) and replace the
>   negative-offset `symbol_conf.priv_size` allocation prefix with on-deman=
d
>   browser index calculation and per-DSO/per-exporter hashmaps for
>   `db-export` and `struct annotation`.
> - Patch 7 replaces `dso->symbols` (`rb_root_cached`) and `dso->symbol_nam=
es`
>   with a locked `struct symbols` container backed by sorted pointer array=
s
>   (`symbols` and `symbols_by_name`) protected by a `struct rw_semaphore`,
>   removing `struct rb_node` from `struct symbol`.
> - Patch 8 wraps `struct symbol` in `DECLARE_RC_STRUCT(symbol)` with
>   `refcount_t` (`symbol__get()` / `symbol__put()` / `symbol__zput()`) for
>   sanitizer-checked reference counting across `map_symbol`, `addr_locatio=
n`,
>   `hist_entry`, `callchain`, `thread_stack`, and `db-export`.
> - Patch 9 replaces `qsort()` in `struct symbols` with a natural-run merge
>   sort and galloping merge (taking advantage of pre-ordered runs in
>   `.symtab`/`.dynsym` and `kallsyms`) plus an in-place binary insertion
>   fast path for small incremental appends.
> - Patch 10 applies the same incremental binary-insertion sort and an O(1)
>   tail-insertion fast path to `struct maps` for `/proc/<pid>/maps` synthe=
sis
>   and runtime `PERF_RECORD_MMAP2` / JIT map insertions.
> - Patch 11 caches ELF program and section headers during
>   `dso__load_sym_internal()`, defers `elf_sym__name()` string table looku=
ps
>   until after symbol filtering, and runs `symbols__fixup_end()` /
>   `symbols__fixup_duplicate()` once per DSO load.
> - Patches 12-17 add `down_read_trylock()` / `down_write_trylock()`, prote=
ct
>   `machines->guests` with a `rw_semaphore`, implement `symbols__shrink()`=
,
>   `dso__shrink()`, `dsos__shrink()`, and `perf_session__shrink()` (with
>   transparent on-demand reload in `dso__load()` that preserves pointer
>   identity for retained symbols), and provide `perf_session__malloc()` /
>   `zalloc()` / `calloc()` / `realloc()` / `strdup()` wrappers that
>   automatically shrink unreferenced symbols and DSOs on allocation failur=
e.
> - Patch 18 adds unit tests in `perf test symbols` covering sorted symbol
>   insertion, symbol/DSO shrinking, transparent DSO reload after shrink, a=
nd
>   session allocation wrappers.
>
> End-to-end benchmark results across the series:
>
>   perf bench internals symbols (perf binary):
>     Average DSO load + sort:      7.348 msec ->   5.324 msec (-27.5%)
>     Average DSO memory usage:        1401 KB ->      1308 KB ( -6.6%)
>     Average bulk insert + lookup: 1453.95 us -> 1161.00 us   (-20.1%)
>     Average append + lookup (200 interior inserts into 10,000 symbols):
>       rbtree: 42.85 us -> array+qsort: 40429.75 us -> array+binary-insert=
: 152.70 us
>
>   perf bench internals symbols -b libLLVM.so.21.1:
>     Average DSO load + sort:     81.196 msec ->  62.582 msec (-22.9%)
>     Average DSO memory usage:        9530 KB ->      9164 KB ( -3.8%)
>
>   perf bench internals symbols -b libLLVM.so.21.1 --no-demangle:
>     Average DSO load + sort:     32.675 msec ->  19.122 msec (-41.5%)
>     Average DSO memory usage:        7589 KB ->      7229 KB ( -4.7%)
>
>   perf bench internals maps:
>     Average ascending insert + lookup:   63.37 us -> 58.97 us ( -6.9%)
>     Average append + lookup:           7477.45 us -> 96.67 us (-98.7%, 77=
.3x faster)
>
> Net performance and memory trade-offs:
> - Replacing the per-symbol rbtree (`struct rb_node`) and negative-offset
>   `symbol_conf.priv_size` allocation prefix with a contiguous sorted poin=
ter
>   array reduces per-symbol heap overhead by 16 to 24+ bytes (saving 3.8% =
to
>   6.6% of total DSO symbol table heap memory unconditionally, and allowin=
g
>   unreferenced symbols and DSOs to be shrunk on demand under memory
>   pressure).
> - For the dominant symbol workloads=E2=80=94loading ELF binaries (`-22.9%=
` to
>   `-41.5%`) and bulk symbol insertion, sorting, and lookup (`-20.1%`)=E2=
=80=94the
>   contiguous array, natural-run merge sort, ELF header caching, and
>   demangler fast paths yield substantial speedups over the rbtree baselin=
e.
> - For synthetic single-symbol interior insertions interleaved with immedi=
ate
>   lookups into an already-large 10,000-symbol DSO (`dso__insert_symbol()`=
),
>   an rbtree rotation takes ~0.21 us/op (`42.85 us` for 200 ops) whereas
>   shifting the contiguous pointer array tail with `memmove()` after binar=
y
>   search takes ~0.76 us/op (`152.70 us` for 200 ops, down from `40429.75 =
us`
>   with naive `qsort()`). In real workloads, symbols are either loaded in
>   bulk (`dso__load()`) or inserted into small per-prog BPF/JIT DSOs where
>   the array fits in a few cache lines, making this sub-microsecond
>   difference negligible in practice.
> - Overall, the series reduces memory consumption across all workloads whi=
le
>   significantly improving=E2=80=94or remaining neutral on=E2=80=94runtime=
 performance.
>
> v2:
> - Rebased onto perf-tools-next (dropping "perf symbols: Fix broken
>   ELF_C_READ_MMAP fallback guard", which was merged upstream, and splitti=
ng
>   "perf libdw: Optimize fallback logic for missing DWARF" into a separate
>   fixes series).
> - Added 'perf bench internals symbols' and 'perf bench internals maps'
>   benchmarks (Patch 1) and included before/after numbers in the optimizat=
ion
>   patches.
> - Added __attribute__((nonnull)) annotations to struct symbol accessor
>   functions (Patch 3).
> - Split the symbol_conf.priv_size removal patch into three separate patch=
es
>   for map_browser (Patch 4), db-export (Patch 5), and annotate (Patch 6).
> - Added dedicated optimization patches for Rust/Java demangler prefix che=
cks
>   (Patch 2), natural-run merge sort and binary insertion in struct symbol=
s
>   (Patch 9), tail-insertion and incremental binary-insertion sort in stru=
ct
>   maps (Patch 10), and ELF program/section header caching and deferred
>   symbol name lookup (Patch 11).
> - Replaced periodic heuristic LRU shrinking and windowed ELF symbol loadi=
ng
>   with on-demand shrinking (symbols__shrink(), dso__shrink(),
>   dsos__shrink(), perf_session__shrink()) triggered on allocation failure=
 via
>   session-scoped allocation wrappers, plus transparent DSO reload preserv=
ing
>   retained symbol pointers (Patches 12-18).
>
> v1: https://lore.kernel.org/lkml/20260928075237.3055101-1-irogers@google.=
com/
>
> Assisted-by: Antigravity:gemini-3.1-pro
> Signed-off-by: Ian Rogers <irogers@google.com>

So Sashiko failed to apply the patches (local Sashiko runs were clean)
because I had these four patches applied locally:
 - Alireza's "perf symbols: Fix broken ELF_C_READ_MMAP fallback guard"
   https://lore.kernel.org/linux-perf-users/20261005-perf-symbol-memory-sen=
d-v5-1-165dceb2b049@uber.com/
 - My fixes in "perf: Fix libdw addr2line fallback, pr_debugN
overhead, and cumulative hist decay"
   https://lore.kernel.org/linux-perf-users/cover.1792995775.git.irogers@go=
ogle.com/

Hopefully the patches above won't take too long to land, so I'll hold
off sending v3 until then.

Thanks,
Ian

> Ian Rogers (18):
>   perf bench internals: Add symbols and maps benchmarks
>   perf demangle: Add fast-path prefix checks for Rust and Java
>     demanglers
>   perf symbol: Add accessor functions for struct symbol fields
>   perf map_browser: Compute symbol browser index on demand
>   perf db-export: Store symbol database IDs in a hashmap
>   perf annotate: Move struct annotation to a hashmap and remove
>     symbol_conf.priv_size
>   perf symbol: Switch backing storage from rbtree to struct symbols
>     array
>   perf symbol: Add reference counting and DECLARE_RC_STRUCT(symbol)
>   perf symbol: Optimize symbol sorting with natural-run merge sort and
>     binary insertion
>   perf maps: Optimize tail insertion and small-append sorting
>   perf symbol-elf: Cache ELF program/section headers and defer symbol
>     name lookup
>   perf rwsem: Add down_read_trylock() and down_write_trylock()
>   perf vdso: Constify dso parameter in dso__is_vdso()
>   perf machine: Protect machines->guests rbtree with a rw_semaphore
>   perf symbol: Add memory shrinking for symbols, DSOs, and machines
>   perf session: Add dso__session() and session-scoped allocation
>     wrappers
>   perf symbol: Use session allocation wrappers in symbol, DSO, thread,
>     and hist paths
>   perf test symbols: Add tests for symbol shrinking and session alloc
>     wrappers
>
>  tools/perf/Documentation/perf-bench.txt       |    6 +
>  .../arch/powerpc/util/skip-callchain-idx.c    |    2 +-
>  tools/perf/arch/powerpc/util/sym-handling.c   |   40 +-
>  tools/perf/bench/Build                        |    2 +
>  tools/perf/bench/bench.h                      |    2 +
>  tools/perf/bench/maps.c                       |  186 +++
>  tools/perf/bench/symbols.c                    |  239 +++
>  tools/perf/builtin-annotate.c                 |   22 +-
>  tools/perf/builtin-bench.c                    |    2 +
>  tools/perf/builtin-c2c.c                      |   14 -
>  tools/perf/builtin-diff.c                     |    4 +-
>  tools/perf/builtin-kallsyms.c                 |    9 +-
>  tools/perf/builtin-kmem.c                     |   82 +-
>  tools/perf/builtin-kwork.c                    |    4 +-
>  tools/perf/builtin-lock.c                     |   25 +-
>  tools/perf/builtin-mem.c                      |    2 +-
>  tools/perf/builtin-report.c                   |   14 -
>  tools/perf/builtin-sched.c                    |    6 +-
>  tools/perf/builtin-script.c                   |   18 +-
>  tools/perf/builtin-timechart.c                |    2 +-
>  tools/perf/builtin-top.c                      |   24 +-
>  tools/perf/builtin-trace.c                    |   23 +-
>  tools/perf/tests/builtin-test.c               |    1 -
>  tools/perf/tests/dlfilter-test.c              |   12 +-
>  tools/perf/tests/dwarf-unwind.c               |    2 +-
>  tools/perf/tests/hists_common.c               |    9 +-
>  tools/perf/tests/hists_cumulate.c             |    8 +-
>  tools/perf/tests/hists_filter.c               |   10 +-
>  tools/perf/tests/hists_link.c                 |   16 +-
>  tools/perf/tests/hists_output.c               |    9 +-
>  tools/perf/tests/kallsyms-split.c             |    5 +-
>  tools/perf/tests/maps.c                       |   58 +
>  tools/perf/tests/pe-file-parsing.c            |    1 +
>  tools/perf/tests/symbols.c                    |  454 +++++-
>  tools/perf/tests/vmlinux-kallsyms.c           |  187 ++-
>  tools/perf/ui/browser.c                       |    3 +
>  tools/perf/ui/browsers/annotate.c             |   10 +-
>  tools/perf/ui/browsers/hists.c                |   35 +-
>  tools/perf/ui/browsers/map.c                  |   88 +-
>  tools/perf/ui/gtk/annotate.c                  |    6 +-
>  tools/perf/ui/stdio/hist.c                    |    6 +-
>  tools/perf/util/addr2line.c                   |    8 +-
>  tools/perf/util/addr_location.c               |    4 +
>  .../perf/util/annotate-arch/annotate-alpha.c  |    5 +-
>  .../perf/util/annotate-arch/annotate-arm64.c  |   12 +-
>  .../util/annotate-arch/annotate-loongarch.c   |   15 +-
>  tools/perf/util/annotate-arch/annotate-s390.c |    6 +-
>  tools/perf/util/annotate-arch/annotate-x86.c  |   14 +-
>  tools/perf/util/annotate-data.c               |   12 +-
>  tools/perf/util/annotate.c                    |  211 ++-
>  tools/perf/util/annotate.h                    |    6 +-
>  tools/perf/util/auxtrace.c                    |  111 +-
>  tools/perf/util/block-info.c                  |   12 +-
>  tools/perf/util/bpf_lock_contention.c         |   35 +-
>  tools/perf/util/c2c-function.c                |   32 +-
>  tools/perf/util/call-path.c                   |   15 +-
>  tools/perf/util/callchain.c                   |   23 +-
>  tools/perf/util/capstone.c                    |   22 +-
>  tools/perf/util/data-convert-json.c           |    4 +-
>  tools/perf/util/db-export.c                   |   99 +-
>  tools/perf/util/db-export.h                   |    8 +
>  tools/perf/util/debug.c                       |    3 +-
>  tools/perf/util/demangle-java.c               |   23 +-
>  tools/perf/util/disasm.c                      |   69 +-
>  tools/perf/util/dlfilter.c                    |   12 +-
>  tools/perf/util/dso.c                         |  257 ++-
>  tools/perf/util/dso.h                         |   94 +-
>  tools/perf/util/dsos.c                        |   76 +
>  tools/perf/util/dsos.h                        |    3 +
>  tools/perf/util/event.c                       |   12 +-
>  tools/perf/util/evsel_fprintf.c               |    2 +-
>  tools/perf/util/hist.c                        |   70 +-
>  tools/perf/util/intel-pt.c                    |   74 +-
>  tools/perf/util/libbfd.c                      |   14 +-
>  tools/perf/util/libdw.c                       |    5 +-
>  tools/perf/util/llvm.c                        |    8 +-
>  tools/perf/util/lock-contention.c             |    8 +-
>  tools/perf/util/machine.c                     |  189 ++-
>  tools/perf/util/machine.h                     |    9 +
>  tools/perf/util/map.c                         |   27 +-
>  tools/perf/util/map.h                         |   18 +-
>  tools/perf/util/map_symbol.c                  |    4 +-
>  tools/perf/util/maps.c                        |  284 +++-
>  tools/perf/util/mutex.h                       |    3 +
>  tools/perf/util/probe-event.c                 |  148 +-
>  tools/perf/util/python.c                      |   36 +-
>  tools/perf/util/rwsem.c                       |   20 +
>  tools/perf/util/rwsem.h                       |    2 +
>  tools/perf/util/session.c                     |   78 +
>  tools/perf/util/session.h                     |    8 +
>  tools/perf/util/sort.c                        |   47 +-
>  tools/perf/util/srcline.c                     |   22 +-
>  tools/perf/util/symbol-elf.c                  |  311 +++-
>  tools/perf/util/symbol.c                      | 1438 +++++++++++++----
>  tools/perf/util/symbol.h                      |  187 ++-
>  tools/perf/util/symbol_conf.h                 |    1 -
>  tools/perf/util/symbol_fprintf.c              |   37 +-
>  tools/perf/util/thread-stack.c                |   18 +-
>  tools/perf/util/threads.c                     |   17 +-
>  tools/perf/util/unwind-libdw.c                |    4 +-
>  tools/perf/util/unwind-libunwind.c            |    2 +-
>  tools/perf/util/vdso.c                        |    2 +-
>  tools/perf/util/vdso.h                        |    2 +-
>  103 files changed, 4557 insertions(+), 1389 deletions(-)
>  create mode 100644 tools/perf/bench/maps.c
>  create mode 100644 tools/perf/bench/symbols.c
>
> --
> 2.56.0.313.g2479322e68-goog
>
