Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B3F0414A0A
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 20:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790367653; cv=pass; b=P3GNMMz2gamdTerpAUEQLpvLqLv51PeX21dvpFayFeGVd2H763zzHBjH91Jlbezs8mwZAqYAYoXxuiEGceJtp+ruKTOXlRk6y7RanDW3GCtvvKwOxwSpdCV31ZMPMWV4FZBPmYIbCLgHPw1R/9QSS0i7ZnqSGOex3fqKyAlKXEc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790367653; c=relaxed/simple;
	bh=ntdvCfc1Y5/sPC6UOT9tkk623bqjbzk7ppMuSWDFXEw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BHzE1uqKBLkFO9RzxrYsC4DizVa6NyjDDV3rcWlDGtbjRqCpDcY0hIurhUxrfA5Iwxqed9TDJwIQA9rUJjOA6/y1EthBvPTkZ4zQOpsgPKXmT+PhjnnyzjqSgnI6y28Pznr3IM+rpkDh8QWDSBfPyQXuBHmFHCN2VP6MWMlEwds=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=llNN9Wjz; arc=pass smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="llNN9Wjz"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-533202fe429so64681cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 13:20:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790367650; cv=none;
        d=google.com; s=arc-20260327;
        b=NDE5JRGS/11AuCz3WRgkJOB1SQfsjqM7RpGRslH+H2FR5r6BumNWgDVInxn7skKgXg
         Cz/x8FYO+Z0iIYtR1Erhjlg8QcRmG98qw73du/TmTbzI7e1pSgJ+PIftjVr0V2P8o0AD
         UnhnIeoeZsiwYLb1AuV1rQwUpstCMnBn8LtmfbRQXp7+0ksRRtxJ75MNpky0sQMTqvYN
         V6TJqvFIJxkbPGCTjf5n/q89OPGAJvub5q2OfJV6xa8CphIGNMKruLercmAByBowFxT/
         RsAEhIMIu85lspATK2VFGNCdB7k4jckXnY1fA6TJnRBZ3eRVDKlWHjwQY3fBpkRK5330
         c8Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9UAR/4keNWxLSi4t1vjjVFho1evIXjZioXSXvU/VZYg=;
        fh=zIiJBPecAw1/EZvuDt1WfceOJh08rYYVgjEYx8LYfus=;
        b=BorUcNH1J9yG1e0Gz9kSwkAdRPxLzOFJmbpyhIuPcH6qCjDIGDMqH8/xxfyKUtZU0s
         vNgikB4GXsT8EHGIVnkP6fgEl+GUR+iwWXL9l0/oUyQaUKkxAlx3Ft9mIdV7dWUzXqPL
         7F0aL8m5vYd9VggVQU74mcAV7YTL3n6DQcPPJjYa06RgEkfwa5LjLfw2ytVyD19+ZUcK
         /F7i7G8neRKj6Tp8tpy8yIImtt8aHTkqtYFEsXIkalRWADy1P1zf+fLdB+GbM7HRtMQI
         0KyziWUu89Uhi1On91j/zN0hRSCuuwu0mTfssH3ggpOpKfjitEkZBg5prUV9Nz/czoJc
         8ViQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790367650; x=1790972450; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9UAR/4keNWxLSi4t1vjjVFho1evIXjZioXSXvU/VZYg=;
        b=llNN9Wjzyrs21mqOvEQvZw/jXc7UkwFajPloxsArT9Lu6oU9efmtdCEo7vpu9obpld
         y2pBFNyiH2oeUPG39eYYVJ+ep3OMw82qWUabPh6/4y5X+YEGIweVwmwTsue4Rrx37PgK
         AOfP9sFYuVkKaHK3L+LTH5RjnI2Y3CzyMrmjtMvr5yephjrN4dsZboGwny/Qbnm7ahyU
         /QiTRy7Hvx/30mTy+gc3BNGjm5mWfJRqNcwL0O2wRknvek3eRY0fmYZm5Zi6X0cbfyDv
         8TWwb4ykh4euDeXqR5YuTp3Q58BVxdAij8C6/JibYEJwYbSLnJBbMuahGRTqgw34mgd+
         ksSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790367650; x=1790972450;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9UAR/4keNWxLSi4t1vjjVFho1evIXjZioXSXvU/VZYg=;
        b=NvxQokw43hVeCD8oWxj0q1zY9Y+CeoDE6FvtHbW6y3m4E6lJE/+3+jVPibXFkP84i2
         +LBAaK4WJmidu1xavprAcBwHOqWLJwqM2RpKZvFxlPWS9WeJUCSuyjPci/TU+ZWjOe0Z
         /syCwh7K5TdzC7SVbCObWk0nwY9Woahp/Gs706rABzaRzk13m4RHX6I79/5AG/Conp+j
         kw3XZc35Z1bAXtSxbl068DbLouWw34VZjOdvvP43pUC1xwAIVBkR7OQm2O10cBts+LWN
         Hlr5Bu/IhPLW+GslhIZqjQ0IpZpV4VZyjvYMuCm6CDXEzRAvZKZppV84riG7AwsCslj9
         TSsQ==
X-Forwarded-Encrypted: i=1; AKwUvBzZasVaZxQ1Q2F5tCpJI5GQ7tU2KjUQsH/8YfMqdAJaq0ZyHGKDYgjPuh1GkxoA3Y43jOt/utLbWAeQZlE=@vger.kernel.org
X-Gm-Message-State: AFuF++kijbP0kn7GDm2edHtbMpiJjpNMy7xo959eF75kkkoEjBJl0/+S
	hr7QQxoy5xsCjvQMeX+V9W+qywwIpebIVOmqunuscasPVIxG/Pg+r4OvOTheeix5i06NoRgltQc
	Qbd0H9yQkpv4ZOGgSxau2pG0NjPRHMxB3eQuX31bC
X-Gm-Gg: AYBFou2PqnORUZlk7oAwBXL62JJ9KMaxjgo4Ikg7JjAEhIxWepIZ1454EeAZ+CEjLZg
	tmZqvQ9Ow+OtHSNQ1MWAKuTDVXKtSekuJf/E+cUbXYt44FGJQv1c0Is2xcLFr2T4bWFPVj0EAD+
	VYoe7ZgR0uewqjniVYRZL7knhmyasQgLkCjTmdXTci+6OnidGAbuvmkdNHFSzC2Xa05fenyQpSt
	G14wZODJohrnnqnh0/QLFOIGuTbHuONbpoSxP8eamK8AHwZpToXWvrzY+sCE9swl+T3n6buaN9T
	zUIad+9smQxRqep2YKZWTb+8ow6KwC0T9DlBP/IYir8irOOXahLkSVi2kKtFnH5JVtC4JwFohH4
	WXlHKNrJCgQ==
X-Received: by 2002:a05:622a:304:b0:532:eff8:3491 with SMTP id
 d75a77b69052e-5332017dac0mr3342871cf.14.1790367649498; Fri, 25 Sep 2026
 13:20:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260925-perf-symbol-memory-send-v3-0-3e4e234c363b@uber.com>
In-Reply-To: <20260925-perf-symbol-memory-send-v3-0-3e4e234c363b@uber.com>
From: Ian Rogers <irogers@google.com>
Date: Fri, 25 Sep 2026 13:20:38 -0700
X-Gm-Features: AclHuK__5EL3z5lGL9iU2gLgFQUrPkWD2Krp0skWq8IhbjJj5TJ3lxNdTCO7P3U
Message-ID: <CAP-5=fWLp5c9HYZ6oTsfPhWprz3uMTT=mt3M-OVu8GEjzSpEww@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] perf script: Bounded and lazy symbol loading
To: haghdoost@uber.com
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andriin@fb.com>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2026 at 12:15=E2=80=AFPM Alireza Haghdoost via B4 Relay
<devnull+haghdoost.uber.com@kernel.org> wrote:
>
> perf script loads the entire ELF symbol table of every DSO that appears
> in a sample, allocating each symbol into an rb-tree held until process
> exit. Therefore, a large enough profile turns symbol loading into an
> OOM kill. This does not scale to profiling a large cgroup with many large
> binaries on a production system with limited free memory.
>
> This series adds two independent, opt-in mechanisms, a leading
> regression fix, and two preparatory patches:
>
>   [1/6] Fix a broken "#ifdef ELF_C_READ_MMAP" guard so perf actually
>         mmaps ELF files instead of malloc'ing section data. This is a
>         standalone regression fix for 22dd1ac91a77.
>
>   [2/6] Let a DSO read its data from one explicit file through the DSO
>         data cache. This fixes the split-debuginfo case where offsets fro=
m
>         the debuginfo file would be applied to the runtime image.
>
>   [3/6] Factor duplicate-symbol selection so it works on symbol
>         attributes rather than struct symbol. No functional change.
>
>   [4/6] --max-symbol-bytes <size>: a byte budget on struct symbol
>         allocations (and the lazy index) enforced at the ELF symbol
>         loader, degrading to [unknown] with a warning past the cap.
>         An unbounded profile doesn't just risk OOM-killing itself. It
>         also forces memory pressure on the whole host, pushing the kernel
>         to reclaim from co-located latency-sensitive processes. Capping
>         it lets the user bound that footprint up front and choose the
>         trade-off explicitly.
>
>   [5/6] --lazy-load-symbols: build a compact per-DSO sorted index and
>         resolve only the sampled addresses, reading names through the DSO
>         data cache at lookup time. On the production fixture, peak RssAno=
n
>         drops from 265 MiB to 39 MiB (6.8x) and wall time from 3.1 s to
>         1.85 s (1.7x). Memory optimizations usually cost time; this one
>         does not because lazy loading skips a lot of calloc and demangle
>         calls.
>
>   [6/6] Shell and unit tests for both options.
>
> Lazy loading handles the common userspace ELF symtab/dynsym path. Eager
> loading remains available for dense coverage and for PPC64 .opd and
> .gnu_debugdata.

So currently we have a symbol as:
```
/**
 * A symtab entry. When allocated this may be preceded by an annotation (se=
e
 * symbol__annotation) and/or a browser_index (see symbol__browser_index).
 */
struct symbol {
        struct rb_node  rb_node;
        /** Range of symbol [start, end). */
        u64             start;
        u64             end;
        /** Length of the string name. */
        u16             namelen;
        _Atomic uint16_t flags;
        /** Architecture specific. Unused except on PPC where it holds
st_other. */
        u8              arch_sym;
        /** The name of length namelen associated with the symbol. */
        char            name[];
};
```
and the struct rb_node is a significant size cost:
```
struct rb_node {
        unsigned long  __rb_parent_color;
        struct rb_node *rb_right;
        struct rb_node *rb_left;
} __attribute__((aligned(sizeof(long))));
```

A sorted array of symbols would only require 1 pointer per entry,
saving 2 words. The array could reside in the "symbols" variable
passed around something like this:
```
struct symbols {
        struct rw_semaphore lock;
        struct symbol **symbols;
        unsigned int cnt;
        unsigned int allocated;
        bool sorted;
};
```
This is basically what we do with struct dso and dsos. With a struct
symbols we can add a lock and ensure operations are appropriately
synchronized. On top of this we can build lazy symbol resolution. For
the bounded memory size, I'd prefer something like a reference count
in every symbol (which uses one word we previously saved). We can
periodically scan the symbols array for symbols with a reference count
of 1 and then lower that count, knowing it is safe to release the
symbol's memory because no other thread is referencing it. This would
avoid having symbols appear as "[unknown]". We should really have a
similar scan of the dsos to free up their memory.

If we have a reference count then symbol__annotation and
symbol__browser_index can reference a symbol rather than using
container_of.

I think the patches 4 and 5 do the core work, but they introduce some
warts that I wish didn't have to exist. How do you feel about
reference counting? To avoid reference count leaks we adding a
checking framework that is documented here:
https://perfwiki.github.io/main/reference-count-checking/

Thanks,
Ian








> Changes in v3:
>
> - Rebase onto current perf-tools-next.
> - Pick up Namhyung's Reviewed-by for patch 1.
> - Split the exact-path DSO data support into its own patch (2/6), with a
>   DSO data test for reading and reopening through an explicit path.
> - Move the duplicate-selection refactor into a preparatory patch (3/6)
>   and factor the whole lazy alias-group handling (traversal, demangling,
>   IFUNC propagation, compaction) into one helper.
> - Keep struct symbol::namelen as u16. Charge symbol bytes from the stored
>   namelen on both allocation and free, and drop the 64 KiB-name test.
> - Fix lazy-loading races reported by Sashiko: in lazy mode, address
>   lookups always take the DSO lock, and building the name-sorted array
>   materializes and frees the lazy index even when the budget truncates
>   it, so the name array is never invalidated. dso__reset_symbol_names()
>   is gone. Add a concurrent budget-truncation test.
> - In lazy mode, when no PT_LOAD covers a symbol and its section is NOBITS
>   in the debuginfo file, adjust with the runtime section header as eager
>   loading does. Add a lazy/eager symbol parity test and a split-debuginfo
>   shell test that exercises this path.
> - Keep each unit test with the code it needs (DSO data in 2/6, budget
>   reservation in 4/6); the other tests stay in 6/6.
>
> Link: https://lore.kernel.org/all/20260919-perf-symbol-memory-send-v2-0-4=
95b8f00ad7c@uber.com/
>
> Changes in v2:
>
> - Replace direct pread() name reads with the exact symbol source's DSO da=
ta
>   cache, preserving split-debuginfo offsets and descriptor reopen behavio=
r.
> - Drop the byte-identical-output claim and retain eager loading for PPC64
>   .opd and .gnu_debugdata.
> - Make the symbol budget atomic and strict, account complete name lengths=
,
>   accept a bare 0 as unlimited, and keep partial zero-sized ranges from
>   covering omitted symbols.
> - Align lazy lookup with eager duplicate and IFUNC selection, PLT clippin=
g,
>   and name-sorted materialization.
> - Move option documentation into the feature patches. Add unit and shell
>   coverage for cache reopen, truncated names, budget truncation, and skip
>   handling.
>
> Link: https://lore.kernel.org/all/20260915-perf-symbol-memory-send-v1-0-1=
d3360e21f07@uber.com/
> ---
> Alireza Haghdoost (6):
>       perf symbols: Fix broken ELF_C_READ_MMAP fallback guard
>       perf dso: Allow reading DSO data from an explicit file
>       perf symbols: Factor out duplicate symbol selection
>       perf script: Add --max-symbol-bytes to bound ELF symbol memory
>       perf script: Add --lazy-load-symbols for lazy symbol loading
>       perf test: Test lazy symbol loading and symbol memory limits
>
>  tools/perf/Documentation/perf-script.txt           |  26 +
>  tools/perf/arch/powerpc/util/sym-handling.c        |   6 +-
>  tools/perf/builtin-script.c                        |  44 ++
>  tools/perf/tests/Build                             |   1 +
>  tools/perf/tests/builtin-test.c                    |   1 +
>  tools/perf/tests/dso-data.c                        |  42 ++
>  .../tests/shell/lazy_load_symbols_split_debug.sh   | 113 ++++
>  tools/perf/tests/shell/script_lazy_load_symbols.sh | 278 ++++++++
>  .../tests/shell/script_lazy_load_symbols_skip.sh   |  26 +
>  tools/perf/tests/symbol-bytes.c                    | 599 +++++++++++++++=
++
>  tools/perf/tests/tests.h                           |   1 +
>  tools/perf/util/dso.c                              |  60 +-
>  tools/perf/util/dso.h                              |  47 ++
>  tools/perf/util/map.c                              |  19 +-
>  tools/perf/util/symbol-elf.c                       | 728 +++++++++++++++=
+++++-
>  tools/perf/util/symbol-minimal.c                   |  16 +
>  tools/perf/util/symbol.c                           | 143 +++-
>  tools/perf/util/symbol.h                           |  30 +-
>  tools/perf/util/symbol_conf.h                      |   2 +
>  19 files changed, 2133 insertions(+), 49 deletions(-)
> ---
> base-commit: edd8a9fe2eca009599e013a29c421c7a6b5ad1b9
> change-id: 20260915-perf-symbol-memory-send-e7cfca1ac3d9
>
> Best regards,
> --
> Alireza Haghdoost <haghdoost@uber.com>
>
>
