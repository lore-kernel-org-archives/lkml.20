Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 859C1395D8B
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 21:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792011837; cv=pass; b=qimkwV/CUdB1LePvbWWiBIb4WAblmCtlPxtg3tvhtfB+iHl90IdW8tQp0Lp7xKyHxD6NaAish8hKgCJrFC6FSi6CXYAMuG8lGc/leeL906R/AeBw+QJE4v4J7/dz7WPu50rOONOc5FrP3WNBtXHRj48FrwU8bgXqLknlcOCwUYw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792011837; c=relaxed/simple;
	bh=+N4TyOpk6OjtO3aVhfd+KaWfqvmnkMh9n+1ySaFToUM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XUHlK5qsC1YqACK6+N4vTk5EQbmqK4CkDZ3WW6ATGyj3vmH/7J6GNdgR63xEHBqOLvM1ACTWK6lhsjaymXTzETFFaMV8pFrozZQyl6Pg8ck1xapwe9ElI/WYBtp+YmlU4YQRz9l6XPG2TVET6e1pUuYHqkO9r/vP/A6yuYIgnBg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nJKTLy/I; arc=pass smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nJKTLy/I"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-535f598d126so691921cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 14:03:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792011835; cv=none;
        d=google.com; s=arc-20260327;
        b=NZhANBeoy2tMqk1Q9rQar3gBeiNkbP+gxZW8d5K/pxUUGrqHhLfuLeUhLHy5dkDpyN
         /abMLS/o8bME3P/IUWM9u9oGBkoXZfppqP1t1wNRJChciWl9+6fD0YAGHIvERf6z8HFE
         FGbXjQMKnB1S9l5dJ0+4fZKixN7Tjse0hFNQEUYFmYP/9DXaLiXXelTljo+tyo1fuddm
         O1BZetN1MFRYyuTYB2CzuEOXZXBePl3xmUNdil4Qt6VpF9VYv/Mb6LlXn2hNBajN0J8b
         CJJecU0Z6ppnFdsIhgdmkadIN16y+5gwOdYRgeQURRwSs3ZtQGIECBIF5YRQX5MgpOAh
         EPfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Mxyz86H6TMMGtX9yyjeKonm2O61SvjPIdjz2IY2AyDw=;
        fh=d1oEhm+DTzYFLLFSzBzXRgqLh0AsTbPsDE51bFEofM4=;
        b=qxOZovu1XzIpjt3l1joNqFKHxc30dedQkzoYJ25UvbvMyCakUc0EaCLMGcXL0456XM
         LulYChgXdpkK5IP636XWHzmrGWsU9Pq0tdVxJ8eBIJnirl6nO60oVRaqcPuXdqS0eASA
         IR+AjepIanu6DBsTF9Ox7w45OJ9j1KZgQi7APo5I6sZp+P0Cg1ntiIvJQEXAurJ6oK3M
         jGnOCIqyfzUIq0fcVwTy75SHsPOWgGNJ1vUFDGhRUNKpqiKfDmnoEAvA2fvGPx4+Mlpo
         N+U+QffebGJRFHIuh8M9JevTE6np8ZeehM5LY1w0W0VXj5TZgo/DTApf+7bmfFdnu31c
         Xg/Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792011835; x=1792616635; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Mxyz86H6TMMGtX9yyjeKonm2O61SvjPIdjz2IY2AyDw=;
        b=nJKTLy/IO1W81vnwPKRcqN01UYHzRS7FdTQ8qs/liOxXaerDOC6V6Je25CH2yZZyju
         ArW4kun0R1C9szZLUGQvV708D6meT+y0DVzNgEnvu4U4Gz+rT4jhqx3fPDz2WkUHqutm
         pDyIPh6+BsekaaCbqgITKTq+Y1ZlWPel6+Wyt6r/WGOLJtg2dQUyvcmySwnKulnhiycE
         u7jbTWYDwqSFLGFpWna/0KH3pnZ2XKtmAPXBX5i9YmB9MDBl03VpabJcwOQMX/MTP3PY
         p84P1TkzdrfbJYldr9TJWCab3HeKjpUyl1C14WddRhEtJscykY0wn2HjKec2F6n/o7F8
         z8Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792011835; x=1792616635;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mxyz86H6TMMGtX9yyjeKonm2O61SvjPIdjz2IY2AyDw=;
        b=2DRdecaxWavl+I4qs0jwICo7MPO3r7ue7oNBBLwZB9OQbiqb7wtZX9AJGGXZ7W799t
         dQDgWTVW0P/ajnkg9X+Sj1MH2s3hpsMwK120Wpyx8TpWolBwPSW4UHtAqADgpO5xGlAm
         kunkFHkpIj5jwkS4+hlv1qX7REZgWT+knqbeH70vVHP/hld7CxIrfwDSNdBYTPTMFW9h
         t5s1uTTJWDT7ubWOUTor/V+EdK+D8R7SbqLSlsBGnuaPGbOM8k9BzCOWx5kTNotShW+y
         qUw52tpLRQ3idg5z0Kig8zA7CqS5leJD74PALRtzale8cZ0pUcDA+Nb4c0gYKtQoaJBa
         xKbg==
X-Forwarded-Encrypted: i=1; AKwUvBxMk52dZGOueD19AxewQPnjLlP2gS/rwGk37CBhOuOLesw7NnvenRH+aq6LWy92Xd9q9J+9NRBJepZ9ESQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLXLhlauNp7PdPa/vDOnkVdy9kQ50Ri9WvJ3CwtDEYZy+FcV1e6
	sXvSi4eYJ4WtHA+keFsaC15tVl8Bh+xOfDicQnwfXhQZVxeTfgh3zj/OT39BJx1UD27D1O9UgLC
	zy69BJfUuFqOULkO+8cep+I9UzPJVhIcfZepZdah/
X-Gm-Gg: AYBFou2fr6C80Q+sfdB2sGTbY2LswatjHufAkHaKRB2lfjcSNnY2dM+oLSaYN9XNkVn
	EsgeArsfQx7hAZgqmTl9MFjnZ228o8R+AVDUKmEh5HqJpRlOvURsuFVUHbIHrlz4Y9UySAWCwD8
	X6tF8ze1lonXLLy7n5J4DskgYnw+ryBrFAwJWjIShBvXmnWas59VATt9TmxJSL85cpOHuacu+1A
	0ih9Ec1M3rBJMM9e3rvdyWQCY6qZ9pRkaLaGcHPXz3OPRlkpPELGtku6PXjdEb8/6oboJwtA5nD
	W99L2tICzHBGhX1autTY6H2PU3DWYgSgZFRFMLodNYDv0e/q4Ttk4cCopwehrWYTqd57WwG12We
	BxmIj0CfUFw==
X-Received: by 2002:a05:622a:4019:b0:530:e00f:7768 with SMTP id
 d75a77b69052e-536161386camr525391cf.0.1792011833044; Wed, 14 Oct 2026
 14:03:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261014151326.4142140-1-thepacketgeek@gmail.com>
In-Reply-To: <20261014151326.4142140-1-thepacketgeek@gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Wed, 14 Oct 2026 14:03:40 -0700
X-Gm-Features: AclHuK9gTJfGJVM2K8qZN8FxeTus_TXC4iuYsvQ-4FcRysqXiGbnxGrJtCFgToY
Message-ID: <CAP-5=fXtuEX9zJ0U-a62REgfAXG2z05XCi1f6HB4hhUEfT969w@mail.gmail.com>
Subject: Re: [PATCH v1] perf machine: Don't unwind the arm64 leaf frame caller
 without symbols
To: Matthew Wood <thepacketgeek@gmail.com>, James Clark <james.clark@linaro.org>, 
	Leo Yan <leo.yan@arm.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Puranjay Mohan <puranjay@kernel.org>, 
	Breno Leitao <leitao@debian.org>, Arnaldo Carvalho de Melo <acme@redhat.com>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2026 at 8:13=E2=80=AFAM Matthew Wood <thepacketgeek@gmail.c=
om> wrote:
>
> On arm64, 'perf record --call-graph fp' also samples LR so that
> thread__resolve_callchain_sample() can recover the leaf function's
> caller, which is missing from the frame pointer chain. It does so via
> get_leaf_frame_caller_aarch64(), which runs a DWARF unwind. The
> unwinder looks up the symbol of every frame it visits, so the first
> lookup in a DSO loads its full symbol table and demangles every symbol
> in it.
>
> Commit 02b2705017d2 ("perf callchain: Allow symbols to be optional when
> resolving a callchain") added the symbols argument so that callers which
> only need maps can avoid loading symbols, and passed it down to every
> add_callchain_ip() call. The leaf frame unwind was missed and still runs
> for symbols=3Dfalse, so 'perf inject' on arm64 has been loading symbols i=
t
> doesn't need ever since.
>
> Commit 29be60c93d2d ("perf build-id: Mark DSO in sample callchains")
> compounded the issue: process_buildids() now walks the callchain of
> every sample at the end of 'perf record' to mark DSOs hit. With -a, that
> loads and demangles the symbol tables of every user binary sampled on
> the system. This can send things into exponential time and memory
> (over 1GB of heap growth in 5 seconds), so
>
>   perf record -a -e cycles:u --call-graph fp -- sleep 2
>
> never finishes writing perf.data after the workload exits.
>
> Callers that pass symbols=3Dfalse only want the maps that callchain IPs
> fall in, and add_callchain_ip() already honours that by using
> thread__find_map() instead of thread__find_symbol(). Skip the leaf
> frame unwind for them as well. The leaf frame caller is almost always
> in the same DSO as the sampled IP or the next frame in the chain, so
> build-id marking loses nothing in practice.
>
> Fixes: 02b2705017d2 ("perf callchain: Allow symbols to be optional when r=
esolving a callchain")
> Signed-off-by: Matthew Wood <thepacketgeek@gmail.com>
> ---
>  tools/perf/util/machine.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/tools/perf/util/machine.c b/tools/perf/util/machine.c
> index f86b3b7df742..51597cddd239 100644
> --- a/tools/perf/util/machine.c
> +++ b/tools/perf/util/machine.c
> @@ -2989,7 +2989,13 @@ static int thread__resolve_callchain_sample(struct=
 thread *thread,
>
>                 usr_idx =3D callchain_param.order =3D=3D ORDER_CALLEE ? j=
-2 : j-1;
>
> -               if (usr_idx >=3D 0 && chain->ips[usr_idx] =3D=3D PERF_CON=
TEXT_USER) {
> +               /*
> +                * Finding the leaf frame caller needs a DWARF unwind, an=
d the
> +                * unwinder looks up the symbol of every frame it visits.=
 Skip
> +                * it when the caller asked for maps only, as for build-i=
d
> +                * marking, so that no symbol tables are loaded.
> +                */
> +               if (symbols && usr_idx >=3D 0 && chain->ips[usr_idx] =3D=
=3D PERF_CONTEXT_USER) {

Hi Matthew, I'm not sure if this is a serious patch or a bug report
about the slowness of DSO marking. Broadly DSO marking is known to be
slow and many perf tests run with -B and -N for this reason. I believe
the intent behind DSO marking as a default is to ensure that perf
provides the best profiling experience. This comes at a cost, but this
fix looks like it will break things because IPs will be lost.

Trying to look a little more at the ARM64 performance problem, I see
that we're trying to unwind 2 frames:
https://web.git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.gi=
t/tree/tools/perf/util/arm64-frame-pointer-unwind-support.c?h=3Dperf-tools-=
next#n70
but often just 1 is read. For libunwind the 1 frame case has a special case=
:
https://web.git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.gi=
t/tree/tools/perf/util/unwind-libunwind.c?h=3Dperf-tools-next#n671
I wonder if we could replicate the 1 frame case with libdw to avoid
processing the DSO, and update the caller to be:
```
ret =3D unwind__get_entries(add_entry, &entries, thread, sample,
callchain_param.order =3D=3D ORDER_CALLER ? 1 : 2, true);
```

Thanks,
Ian

>
>                         leaf_frame_caller =3D get_leaf_frame_caller(sampl=
e, thread, usr_idx);
>
> --
> 2.53.0-Meta
