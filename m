Received: from mail-yx2-f43.google.com (mail-yx2-f43.google.com [74.125.224.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8886D449ED7
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 21:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790371700; cv=pass; b=dowClFjuEYQGIhCDs9gf9ALQ+PS6JGEkZduKqlJm1Q09EjqflcscW8gUkMga2v99JLy10gnVyegQrG//m0mdEYC27IX/bOrtVPXaRt0RPXeorjkx2zfq3531TTLuq8D4iHvP/u4QonsXfsbHd7mB2wB1nH+XaaAR9QIbqteRvlM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790371700; c=relaxed/simple;
	bh=q/kC3y8E1zYwJ50finFJIRT21d9Qmu6GMfu3QpGeEkM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jZaWoVpTq2BqlV+QiEYBYWpKwIcSgaNRRAj1Tw6xNjAuZNwe9yWi3mQI3aI2qr6XxwFOmTSvDrY6QsfR+IZu5etynzkI4hi9slOK48EBDFmFMwWeAuZodSb/ncpULJDUxiDqxFEeazDlHezDHrtPAgtykDLqT13gGZ3yhOnMl3E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=uber.com; spf=fail smtp.mailfrom=uber.com; dkim=pass (1024-bit key) header.d=uber.com header.i=@uber.com header.b=BWDpsJA1; arc=pass smtp.client-ip=74.125.224.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=uber.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=uber.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uber.com header.i=@uber.com header.b="BWDpsJA1"
Received: by mail-yx2-f43.google.com with SMTP id 00721157ae682-85d43ac6090so13687717b3.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 14:28:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790371697; cv=none;
        d=google.com; s=arc-20260327;
        b=DpR0SJhbPbb/n+rbQRvsTdZt8wpr3VOA467hWtn9L/7g6i8rSjA/rwvgKQNnnulKRQ
         CjmR+GPexHIWGdsfCU9O/dtFLDNJA6eIMgLR55raOvag1TiC3uIzar1J7EwibceZ7wuN
         e637fldfCBdoEEYpk9kZEgx+A7kMXwoZCtctS+ieKEwkB0BIMuC1XEk3Uvs8E60M3Pln
         /hyy1NA5LxjWHhHy6FEqZzLvzbnXKSEQY8L0VEPzVg/98+A6mDaFlgKLacVDucqLeOLy
         ILONaFatKzcqxzXijOQEakjNFhFkX5D+euVg7r/6eLxV0dejO2A9QT90gWcl4w0xgZKV
         Evbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=oj3r8DH2eKkyi1knjVplt4A0mO965qEUvYlauOebMtw=;
        fh=xlkHYydHg8W4SVmm3rD14c8DQmBntwUgFcu+o1DNxGY=;
        b=hQwX7cstqk9Io+EFeplB8s2IBXr7BlxyfBnuOIHfBDZoXjhC/I7xQMvqQHuAkccSHg
         ZAoPW99/VGpeohCMyn+YD9KOEdlp8xn+5PQ8sN5J6SBUSWThJ8QCqhE9r+HAK7gizAu4
         wp6wRvgOvcKZRK/v03TnAZzvU30AJbveeplhMLXeAMwr0ZdF0/1vtuaziChVHC3+6WE3
         JdQhR8ZhWNa9wXZLGJNYy49rPJXRm+aQguXl16ouFM97acDvwQvyCaI7VN7gO5D5ZGT7
         8iyfuWdX5e18ZVLz+0V7dpE/v0Jkb4ynmAvl2CvGVri8raFuchwdwghHF6MRWMxXwYcq
         AxLQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=uber.com; s=google; t=1790371697; x=1790976497; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oj3r8DH2eKkyi1knjVplt4A0mO965qEUvYlauOebMtw=;
        b=BWDpsJA1yegJMX0aeJhfH7ki8oyha8g/89cq7ob/SM/5UWPqUqHnAJkCUBYk6HVNWG
         Y/ZWWZnhTAfL8TAmOHt+vdS66H6H7rRuXgWn1PPog0GmYjlf8Wp4OAhNjTQ8p58tIB20
         8uRM9Y7sCIGAn2ij34Yxef0u7zt4O6lp/8T4g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790371697; x=1790976497;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=oj3r8DH2eKkyi1knjVplt4A0mO965qEUvYlauOebMtw=;
        b=aWm4xiMg+wj0VetZnLBYOWKapoP08BxSqfTUxLO1AVOYfaEXV5V8sCXqM5I0nq7gQS
         neyuWSdXwbbBskBFBxu3vYbqjfihPWRFihS6AgytLFF7T+qh1FjSABLQ4T3URDsfxga/
         waK0z3txaFScFzSLSPzp7u46iCszL1sCpMec+P4VaAABVhgavAriW/V2PROo6t/THJKE
         DSpglI1HestHITgIKA0EO3t6Q68YbNQa3vVuVN9Yd/ds4QNF0SaPkVHlqKG6x62e1k9z
         +U9QU6vn4QNBC9GulI8YYCzIMgt1mXIkD7kDC0SZRwlopII4Nr2NgD+4Yhd2XBE1JsNJ
         iDPQ==
X-Forwarded-Encrypted: i=1; AKwUvBy7YTfwXeUTGAlcJrJoT1+N4pYaaIrmbWVrvXDBR8HPPg6XtVSUF16BK2n+oHt/xTZs2AN4Jac6r4ph3I8=@vger.kernel.org
X-Gm-Message-State: AFuF++mXJVnruJePA4x1MtzXamMa4mYQMW07tiRrVYqPAQDJb7ctI+Ie
	oPC2pbBXyTjvAPS5wwdajiA1JGlUdPO8YrP+K2I+oPqOW1zhMbI3/vF9iz96E26YweZ9WGnFt5T
	mS06FLp/gP1nQ6P8hBaj5HlxKiulsGKpvbCJgr/L0JQ==
X-Gm-Gg: AYBFou1m9qn4h4jgZq8IONMn71xieRGvAXgvnF8KtlOrmHn23ZjFET7Y/qqJLvmXKtW
	rTdKJTWqUnWzLW2jpSZ42OdUzdGvmg+5YaGyf/GO7TcoAfzpVfoL77WSiX4lFpUq5EvNDgVG72M
	2fs+tQEchgHAUKz7oCIg8muGFlzLfkPcHLy8bM4xiFzn2VzlyksDSnO/7bN6v8I1fTOb1NDnsQM
	gaiu0CDcpbPKOzDcW1yR5f8t/zkRvdczag77I8gV1waRpZ4q9m1rGI/CGx0RwSXCxoGQEonU4Mp
	Jh8bWxPqbL24WDUcbkowNJOHxCAAGower9/+1K5Vjt/bqV2toU4XhrRa8qLqCFkSvEDeXjXRdX8
	3woI7YyI+wQ0=
X-Received: by 2002:a05:690c:6607:b0:80c:8d09:3880 with SMTP id
 00721157ae682-8a648ec365fmr39922527b3.15.1790371696911; Fri, 25 Sep 2026
 14:28:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260925-perf-symbol-memory-send-v3-0-3e4e234c363b@uber.com> <CAP-5=fWLp5c9HYZ6oTsfPhWprz3uMTT=mt3M-OVu8GEjzSpEww@mail.gmail.com>
In-Reply-To: <CAP-5=fWLp5c9HYZ6oTsfPhWprz3uMTT=mt3M-OVu8GEjzSpEww@mail.gmail.com>
From: Alireza Haghdoost <haghdoost@uber.com>
Date: Fri, 25 Sep 2026 14:28:00 -0700
X-Gm-Features: AclHuK9QQSqxXxMT6Ew2X1pK7ZOp1V4KrRXvz_ZPn5vMbxzFhEjJdLYW8P0I6Ec
Message-ID: <CA+w=M=Tdyt=s9FTvDH_4ozk_1MM09J6xTdLrsq-WNhQ1S+ACXQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] perf script: Bounded and lazy symbol loading
To: Ian Rogers <irogers@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andriin@fb.com>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> So currently we have a symbol as:
> ```
> /**
>  * A symtab entry. When allocated this may be preceded by an annotation (see
>  * symbol__annotation) and/or a browser_index (see symbol__browser_index).
>  */
> struct symbol {
>         struct rb_node  rb_node;
>         /** Range of symbol [start, end). */
>         u64             start;
>         u64             end;
>         /** Length of the string name. */
>         u16             namelen;
>         _Atomic uint16_t flags;
>         /** Architecture specific. Unused except on PPC where it holds
> st_other. */
>         u8              arch_sym;
>         /** The name of length namelen associated with the symbol. */
>         char            name[];
> };
> ```
> and the struct rb_node is a significant size cost:
> ```
> struct rb_node {
>         unsigned long  __rb_parent_color;
>         struct rb_node *rb_right;
>         struct rb_node *rb_left;
> } __attribute__((aligned(sizeof(long))));
> ```
>
> A sorted array of symbols would only require 1 pointer per entry,
> saving 2 words. The array could reside in the "symbols" variable
> passed around something like this:
> ```
> struct symbols {
>         struct rw_semaphore lock;
>         struct symbol **symbols;
>         unsigned int cnt;
>         unsigned int allocated;
>         bool sorted;
> };
> ```
> This is basically what we do with struct dso and dsos. With a struct
> symbols we can add a lock and ensure operations are appropriately
> synchronized. On top of this we can build lazy symbol resolution.
>

I agree that a sorted struct symbols array with its own lock would be
a cleaner container than the rb-tree. However, it would not save much
memory on its own. On a sample fixture, perf script materializes about
765k symbols and peaks at 265 MiB RssAnon. Replacing the rb_node with
one pointer per symbol saves 16 bytes each, about 12 MiB in total.
Most of the memory goes to materializing symbols that are never
sampled. Lazy loading avoids that work and brings the peak down to
39 MiB. Lazily materialized symbols are inserted one at a time between
lookups, which suits a tree better than a sorted array.

If the maintainers prefer the sorted array, I'm open to it, but I'd
like to be clear about the cost. The symbol rb-tree is used at around
100 call sites in 18 files under tools/perf, so the conversion would
be a separate series that has to land first. It should also cover both
eager and lazy loading, so there is one container for materialized
symbols rather than a tree in one mode and an array in the other.

> ...For
> the bounded memory size, I'd prefer something like a reference count
> in every symbol (which uses one word we previously saved). We can
> periodically scan the symbols array for symbols with a reference count
> of 1 and then lower that count, knowing it is safe to release the
> symbol's memory because no other thread is referencing it. This would
> avoid having symbols appear as "[unknown]". We should really have a
> similar scan of the dsos to free up their memory.
>

Eviction would bound the steady state, but it doesn't bound the peak
on its own. Eager loading materializes the whole symtab when the DSO
is loaded, before anything can be evicted, and this series does not
add lazy loading for every loader (PPC64 .opd, .gnu_debugdata, the
kernel and modules still load eagerly). --max-symbol-bytes covers
those paths too. It is opt-in and off by default, and is meant for
hosts where perf shares memory with latency-sensitive services and the
operator needs a guaranteed upper bound. Like perf record --max-size,
what happens past the cap is deterministic: perf warns and reports
[unknown].

>
> I think the patches 4 and 5 do the core work, but they introduce some
> warts that I wish didn't have to exist. How do you feel about
> reference counting? To avoid reference count leaks we adding a
> checking framework that is documented here:
> https://perfwiki.github.io/main/reference-count-checking/

Reference counting would be useful for symbol lifetime and for the
annotation and browser_index cleanup, and freeing unreferenced symbols
would reduce steady-state memory. As above, I see it as a complement
to the cap rather than a replacement, since it can't guarantee an
upper bound.

Refcounting struct symbol touches every holder of a symbol pointer,
so I'd suggest doing it as a separate series using the refcount
checking framework rather than in this series.

If there are specific parts of patches 4 and 5 you see as warts,
please point me at them and I'll address them in v4.

For v4 I currently plan to bound the second pass of
dso__build_ondemand_index() by the allocated count, as reported by
Sashiko.

Thanks,
Alireza
