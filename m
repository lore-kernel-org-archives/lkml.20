Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 066302D77F7
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 21:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790373371; cv=pass; b=Syl6/8+nBnUlbzXF8AVP3J7l5cJMG1wsb3nS1NrOqHaGeiGsXlAikQq1NRy2/3rdWK2eI078FouJB6HLo2xqim+K/qJoicJjGOnG/IOX4OaonOYU/IIwW/o846DL6rwbV9+LnBTv/pdmLSsHMhL9K/z2e4tIXgKv+d2EGXHs2kM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790373371; c=relaxed/simple;
	bh=hhEeJxyDgf0Rdb58JP/S95nGFRDpgKlKMtH/KKZod7k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CIZKOLP6uxy/b2uvtrLykzZJt3jKp/plN0r0O63cYmxBzeLnDMBU3GvmpXITnVa2j/R330ir5PgsO9zPKO46anbwpjfuR75/bUKFXh5vILLjBJ/+B5Ww5A+MDC0wq5AzQK8g6xzBB/haDLmaYQtXxcIR6JBSnOx8sE+KFGM8OeE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RENZC0rB; arc=pass smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RENZC0rB"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-52faa58bff5so94041cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 14:56:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790373369; cv=none;
        d=google.com; s=arc-20260327;
        b=Xh3zmrRcxhOG2nZ/RSesa74gJkO28F+M+COtLM7ARHgnMugIqwc0XhJsqCzFSnBiX6
         /bYnqkmoTIDBQ6yocTj671UcRBKbi5MyAeLtv4eVHVIC/MDpwlMjXgPKnvzpc/4wdmOU
         CdnLSJVVv54kvX7t8LQ3fOwj32u3ZxBdQi1qpFhNugsNfuum/7b8z4776s6mcTVgK5nS
         UpNu5UQainL2TVPLVBYg5Uh7vqEuv64P1Wk7cT+s0zT38JfZyzCONf3aFs9QjFBDgNwD
         Z+xpv5Z5GxqBCKqqDLSfQ+SWKDuNLbjVUMa05MYBn1rKNwdUsw3CqN4erUhM4F7QLK0G
         IMYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=x17uoEv0pLsC+kg6NWB1ARGQDfu151lBiwdeVrtyu5g=;
        fh=iz0UqGkPEqEnnioaJcaT7idFS2REpSnUNyXGbmKGEyQ=;
        b=QePDr1lVJTXFxZb3S10mNk3TPVk7lQ24SpNyJ7E2ccC2yopqz+WIJ2PgXDu5HGy4jn
         vkpwZ9a6THbI0IrPbk0sZPNvDDw4bCtgoud64EI/CNiHEG4cwG9fkGJQY0tIaXWR79RM
         VUcYNQEzKu4+291hLs5djqMoN3+l91g65o4L23dcI/23SC/d8XKhMSjR8Ov8S7N83mUd
         pLiiBezMj6+6LuUMvhi6cxQHzT7KJjNwA9Fkq36Cwd2qFx+m5aRHakKFXoezSwAf2/8N
         3IFZIOHeV2sDwo2ZRLaU3yPyAaacKznFefjJml6pgcpWP9soO/+axx7a54U0WrnANp6J
         0cAg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790373369; x=1790978169; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=x17uoEv0pLsC+kg6NWB1ARGQDfu151lBiwdeVrtyu5g=;
        b=RENZC0rB9HxtwaHXeS40Z4LGm+QaAqftxQz8pqyFHTIGKFWGfz8cAQGLknxJuqFYtx
         FWxy8xC7H1+01hfpPZ0wNHgIhhVlB5hhqrjxzAkl5SXqvHPnMW2OWLBcymNZw+oH6938
         8ZCCvU6SvpzjwR3HnycxqaoYKbQtAYTz/kS+FANf66D7Tib/9uP77MG8JrdrIhWs+zox
         NpWAdU2OcWo6hDB1Gx23sQ1vjK7c6w4wTcVxJxEW4vQXdkEni6f9mwh1OJTgRzCNMcQ8
         q56UdXKX0RhTMnm547g/Byv/AyRVCuVKmKjnEoD08khwZFe6D0Er9JwO3Np5nRD3LrEG
         /8vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790373369; x=1790978169;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x17uoEv0pLsC+kg6NWB1ARGQDfu151lBiwdeVrtyu5g=;
        b=lSFJznUA5HGa8JXnfXWly6j60m/VFK3s5B6pjzywq2Sliv7wzJtucXKCbjZ25gIBMb
         j4Bh5APyli0FQzHdXey/4qEwfWVZaGqjjz2iZ79i0zCDdQIebGN5am9PXVddfQsYU5jJ
         wyNFAW057diTLdmj606CgEQO+J2qUthfETpSB1oa/Vy9+2A/VjKXWJynRwDeVjxxlA13
         RsaTdobdDBF9a1Br1voFRCH5eK3FSz1qho65WRbSkDqNbN+Nu6569op22fFR/AqoMw8B
         ztHJvLWWdcLMnHYF7gNKe0+rM8ckm7QR4RuScpTzyKb6IKaxbuBOFocmB4IEivYmA8Gf
         7m2g==
X-Forwarded-Encrypted: i=1; AKwUvByH/NrOXRKPkq+Sdcez/1NoJccsw8oSIpTDPhzCEMSfXwThoi7tNpMjVhfpZGzrufZw0dQWMT5sw71L8f4=@vger.kernel.org
X-Gm-Message-State: AFuF++lDDR3XtDFdh4bwPgnpztLuTI/e/GbFhICpYdiIc1+8qOYzEKz6
	do82TueFCBf/EG5dYxZVx/GjwEAHYZrDigtS6/rkKvtoKbVzPtBpaNPwbtX4VJEHZNR5KZT9Us8
	DPtLJpR4/cZ0g9FWddgNTGuCnVmlBh3fh4VZ6pyyP
X-Gm-Gg: AYBFou3BuIZ6ZHD0xX0Q+kjOTeKPu/PH98wPg7rUPLpuzl2v5Ez7yKrm+/Ltrc+yVpu
	6OiSUGTUvr9av0qZdq1mzqgKOSuL0Pi+kT0OyopAHVBcVHs9jEV6/VM21ehuOkdFpb6lrWY5GE/
	nSAjulR3hFFoNX7nkqWJnJClDNxO54VIUar7i+g01pPVdkpwSh1eezd33vKXuWko8UUf890xGXv
	t6wvIdy7e4d5QOCrBQ3Yw2XalB0bYRJkzlQokpkkL7S0CQMq0Z0I84cLoVMzQqjkGSZsQ7iorFu
	Rt2xG8NEafKOoa2PSoZ7vM5EwIFYMVoRRR4dX9q9N996QKj1HQ4w4K22P1+Czu4sQEpQpymA9Zo
	DxntwzMHbdA==
X-Received: by 2002:a05:622a:8c4:b0:532:9220:a9ae with SMTP id
 d75a77b69052e-53320155dc1mr4752091cf.6.1790373368032; Fri, 25 Sep 2026
 14:56:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260925-perf-symbol-memory-send-v3-0-3e4e234c363b@uber.com>
 <CAP-5=fWLp5c9HYZ6oTsfPhWprz3uMTT=mt3M-OVu8GEjzSpEww@mail.gmail.com> <CA+w=M=Tdyt=s9FTvDH_4ozk_1MM09J6xTdLrsq-WNhQ1S+ACXQ@mail.gmail.com>
In-Reply-To: <CA+w=M=Tdyt=s9FTvDH_4ozk_1MM09J6xTdLrsq-WNhQ1S+ACXQ@mail.gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Fri, 25 Sep 2026 14:55:56 -0700
X-Gm-Features: AclHuK_BkAE6NX7F6Laiq_Pp1lj2vQI6Q3l2GiqPcrS7XwFuVKpt3MsrU6chZfI
Message-ID: <CAP-5=fWMF=HrQwBObz1ryc7e+=0iJAwT=QSa0neYT73xCfqAjg@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] perf script: Bounded and lazy symbol loading
To: Alireza Haghdoost <haghdoost@uber.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andriin@fb.com>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2026 at 2:28=E2=80=AFPM Alireza Haghdoost <haghdoost@uber.c=
om> wrote:
>
> > So currently we have a symbol as:
> > ```
> > /**
> >  * A symtab entry. When allocated this may be preceded by an annotation=
 (see
> >  * symbol__annotation) and/or a browser_index (see symbol__browser_inde=
x).
> >  */
> > struct symbol {
> >         struct rb_node  rb_node;
> >         /** Range of symbol [start, end). */
> >         u64             start;
> >         u64             end;
> >         /** Length of the string name. */
> >         u16             namelen;
> >         _Atomic uint16_t flags;
> >         /** Architecture specific. Unused except on PPC where it holds
> > st_other. */
> >         u8              arch_sym;
> >         /** The name of length namelen associated with the symbol. */
> >         char            name[];
> > };
> > ```
> > and the struct rb_node is a significant size cost:
> > ```
> > struct rb_node {
> >         unsigned long  __rb_parent_color;
> >         struct rb_node *rb_right;
> >         struct rb_node *rb_left;
> > } __attribute__((aligned(sizeof(long))));
> > ```
> >
> > A sorted array of symbols would only require 1 pointer per entry,
> > saving 2 words. The array could reside in the "symbols" variable
> > passed around something like this:
> > ```
> > struct symbols {
> >         struct rw_semaphore lock;
> >         struct symbol **symbols;
> >         unsigned int cnt;
> >         unsigned int allocated;
> >         bool sorted;
> > };
> > ```
> > This is basically what we do with struct dso and dsos. With a struct
> > symbols we can add a lock and ensure operations are appropriately
> > synchronized. On top of this we can build lazy symbol resolution.
> >
>
> I agree that a sorted struct symbols array with its own lock would be
> a cleaner container than the rb-tree. However, it would not save much
> memory on its own. On a sample fixture, perf script materializes about
> 765k symbols and peaks at 265 MiB RssAnon. Replacing the rb_node with
> one pointer per symbol saves 16 bytes each, about 12 MiB in total.
> Most of the memory goes to materializing symbols that are never
> sampled. Lazy loading avoids that work and brings the peak down to
> 39 MiB. Lazily materialized symbols are inserted one at a time between
> lookups, which suits a tree better than a sorted array.
>
> If the maintainers prefer the sorted array, I'm open to it, but I'd
> like to be clear about the cost. The symbol rb-tree is used at around
> 100 call sites in 18 files under tools/perf, so the conversion would
> be a separate series that has to land first. It should also cover both
> eager and lazy loading, so there is one container for materialized
> symbols rather than a tree in one mode and an array in the other.
>
> > ...For
> > the bounded memory size, I'd prefer something like a reference count
> > in every symbol (which uses one word we previously saved). We can
> > periodically scan the symbols array for symbols with a reference count
> > of 1 and then lower that count, knowing it is safe to release the
> > symbol's memory because no other thread is referencing it. This would
> > avoid having symbols appear as "[unknown]". We should really have a
> > similar scan of the dsos to free up their memory.
> >
>
> Eviction would bound the steady state, but it doesn't bound the peak
> on its own. Eager loading materializes the whole symtab when the DSO
> is loaded, before anything can be evicted, and this series does not
> add lazy loading for every loader (PPC64 .opd, .gnu_debugdata, the
> kernel and modules still load eagerly). --max-symbol-bytes covers
> those paths too. It is opt-in and off by default, and is meant for
> hosts where perf shares memory with latency-sensitive services and the
> operator needs a guaranteed upper bound. Like perf record --max-size,
> what happens past the cap is deterministic: perf warns and reports
> [unknown].
>
> >
> > I think the patches 4 and 5 do the core work, but they introduce some
> > warts that I wish didn't have to exist. How do you feel about
> > reference counting? To avoid reference count leaks we adding a
> > checking framework that is documented here:
> > https://perfwiki.github.io/main/reference-count-checking/
>
> Reference counting would be useful for symbol lifetime and for the
> annotation and browser_index cleanup, and freeing unreferenced symbols
> would reduce steady-state memory. As above, I see it as a complement
> to the cap rather than a replacement, since it can't guarantee an
> upper bound.
>
> Refcounting struct symbol touches every holder of a symbol pointer,
> so I'd suggest doing it as a separate series using the refcount
> checking framework rather than in this series.
>
> If there are specific parts of patches 4 and 5 you see as warts,
> please point me at them and I'll address them in v4.
>
> For v4 I currently plan to bound the second pass of
> dso__build_ondemand_index() by the allocated count, as reported by
> Sashiko.

So, I'm pretty against the complexity of dealing with symbols that may
fail due to a memory pressure issue. I'm also against having memory of
symbols bound, while memory for say debuginfo isn't. Ideally we'd have
a language runtime that'd allow us to express some notion of weakly
holding symbols live. I think we can implement a global function to
reduce the memory footprint by iterating through sessions, machines,
dsos, and symbols, squeezing them when possible. The problem with
implementing that on top of patches 4 and 5 is that it's hard to see
what would be kept, so we'd just revert the changes and start
implementing the reference counting solution again.

In the change there seems to be the addition of helper functions and
structs like symbol_candidate. These appear in header files to be
shared across C files. We have multiple notions of symbols, with and
without libelf. I'd rather the change were more minimal given I think
this is the wrong direction.

Thanks,
Ian

> Thanks,
> Alireza
