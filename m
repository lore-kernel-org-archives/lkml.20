Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEAB345D91B
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 17:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791566937; cv=none; b=NYQ89gFdu2c70fV7/pqxJgrvU/lTufEZBgkixS5xpX6f3TB3ftH2PcatB+/OKUmXcgAe/zWbkc/8pFxL3QYA7oGRpkxYI4slj0hTdoiWYr5JLrksIZDucV4a147N7RyYQpOih2tpGPbkBqxltNCeJIgLp+qBgPmbB5jo+dhU+N0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791566937; c=relaxed/simple;
	bh=gBE+Icsm3cGqgB+wEyQbROvwFO0BkfmNybQXS+Fyi74=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fhYBaJ+Fyg/i5mRNd7ftaYur/fqTpXeZGY7FkPc68Rfwhn74UXAeWxDzhxVskDDWqacJ5uOI7S5g9bcY5Em4xkWDCN6Myi28xv5RkV/QzV2b+4SCfiHF/0tTdj+yrLf+Ql+KLnSPoCvWCa73OzwRo0Eo4hBLR2LkM0K+PCUromE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AjGzRXCB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AjGzRXCB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F3361F008A1
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 17:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791566934;
	bh=GQ1+vi+vdsZ99qDKhf+JpCWijkqBaMTbgUW8v/FAGik=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=AjGzRXCBiIJZ0fhtb2/1CNulUjXjnTDvnthvDq1VL2KZuRdN/DX9OG9YewnGQk5po
	 ByCxdZBfRjeBhg32rFTHM5KRuPhLz66f9FbKfEJ1CiBM/1Aj5jBnsYQ8Au+cJjq0kU
	 tri1wFANAAV0t72+edO9jthntXUxHT+eyDCsk7eizqRsTf4uoNB8LGpfNOv4syIRbR
	 OpBfjHLBZwPWS30HMGFH+X8myvR90MyW3aIqboeNgVwC1G23JMPeDaYs4q5h5JAoN6
	 4VbXUZZWbyCRT+MGL1vfTtdwQ1sGTgAO+PJcP7jFwDTe535vZfLYUvt4C6voLFAHem
	 /jx7sYVjroO9g==
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-53506b44151so64718661cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 10:28:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBztEmc+NtJOhdkY7bD+HB1vHDHh44kqLaqwNr3nzHQ/rSjL4F1bxmqQwMD8V0c12teSgltWXvRscZAZ9aw=@vger.kernel.org
X-Gm-Message-State: AFuF++lvFjHlv4Cy0NnKHxR+w4LfLti8h8BH15sAXSAfxfa+KiuiOq2/
	kvxyCIh8K1y9Tynem/opO01S+do5NwJg5UtNb1ZJGt4MnK9JpDBQFWlmC1TYHCilxp62h7U7ZOr
	0sIFG4FT4R1tZMeSnuGMCzi03yXY7iI8=
X-Received: by 2002:a05:620a:a2cf:10b0:93e:c12c:f142 with SMTP id
 af79cd13be357-93ec12d0865mr231402285a.76.1791566933524; Fri, 09 Oct 2026
 10:28:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261006002307.2669023-1-usama.arif@linux.dev>
 <20261006002307.2669023-3-usama.arif@linux.dev> <CAO9r8zMFm+JsboodgkG-jdQ9eTk+JHo=d-3Dw8PUcEqjr3+xVg@mail.gmail.com>
 <b887f721-124c-49ce-8b5b-c1edf0c24e40@linux.dev>
In-Reply-To: <b887f721-124c-49ce-8b5b-c1edf0c24e40@linux.dev>
From: Yosry Ahmed <yosry@kernel.org>
Date: Fri, 9 Oct 2026 10:28:40 -0700
X-Gmail-Original-Message-ID: <CAO9r8zOukk0p1BS=1qSvmi+Sxp+1zLUAxGMEHoyHepEb+tyd4A@mail.gmail.com>
X-Gm-Features: AclHuK86qX40IDYr0hsGsWtxtfNvpNDkIvmBi0TCgMzngiR8Ajf-TDMhH84pAzE
Message-ID: <CAO9r8zOukk0p1BS=1qSvmi+Sxp+1zLUAxGMEHoyHepEb+tyd4A@mail.gmail.com>
Subject: Re: [PATCH 2/2] mm: zswap: use stack requests for synchronous decompression
To: Usama Arif <usama.arif@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>, chengming.zhou@linux.dev, dsterba@suse.com, 
	hannes@cmpxchg.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	nphamcs@gmail.com, terrelln@fb.com, riel@surriel.com, shakeel.butt@linux.dev, 
	alex@ghiti.fr, senozhatsky@chromium.org, kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 9, 2026 at 8:27=E2=80=AFAM Usama Arif <usama.arif@linux.dev> wr=
ote:
>
>
>
> On 07/10/2026 23:28, Yosry Ahmed wrote:
> > On Mon, Oct 5, 2026 at 5:23=E2=80=AFPM Usama Arif <usama.arif@linux.dev=
> wrote:
> >>
> >> With separate requests for compression and decompression, loads still
> >> serialize on the per-CPU decompression mutex. A low-priority load that
> >> is preempted after the codec drops its stream lock keeps holding the m=
utex
> >> and stalls every other load on that CPU, including higher-priority one=
s.
> >>
> >> Synchronous algorithms whose requests need no extra context can use an
> >> on-stack request, so decompress with one and take no zswap lock. All
> >> in-tree software compressors qualify. Asynchronous algorithms, and
> >> synchronous ones with request context, keep the per-CPU request and
> >> mutex, which is still taken before the zsmalloc read lock.
> >>
> >> Reading the per-CPU context without the mutex is safe. Since
> >> commit ef3c0f6cb798e ("mm: zswap: tie per-CPU acomp_ctx lifetime to th=
e
> >> pool"), it is set up before its CPU comes online and is not torn down
> >> until the pool is destroyed. The codecs keep their own stream locks, a=
nd
> >> crypto_acomp_decompress() rejects on-stack requests only for
> >> asynchronous transforms, which never take this path.
> >>
> >> For software compressors this drops the heap request added by the
> >> previous patch. The on-stack request and wait take 216 bytes, which
> >> makes the load path about 270 bytes deeper on x86-64. Asynchronous
> >> algorithms pay this too.
> >>
> >> Signed-off-by: Usama Arif <usama.arif@linux.dev>
> >> ---
> >>  mm/zswap.c | 65 +++++++++++++++++++++++++++++++++++++----------------=
-
> >>  1 file changed, 45 insertions(+), 20 deletions(-)
> >>
> >> diff --git a/mm/zswap.c b/mm/zswap.c
> >> index 54187b1ef751d..7e7fb6e7ec24c 100644
> >> --- a/mm/zswap.c
> >> +++ b/mm/zswap.c
> >> @@ -147,7 +147,7 @@ struct zswap_acomp_req {
> >>  struct crypto_acomp_ctx {
> >>         struct crypto_acomp *acomp;
> >>         struct zswap_acomp_req comp;
> >> -       struct zswap_acomp_req decomp;
> >> +       struct zswap_acomp_req decomp;  /* unused by synchronous algor=
ithms */
> >>         u8 *buffer;
> >>  };
> >>
> >> @@ -851,15 +851,20 @@ static int zswap_cpu_comp_prepare(unsigned int c=
pu, struct hlist_node *node)
> >>                 goto fail;
> >>         }
> >>
> >> -       if (zswap_acomp_req_init(&acomp_ctx->comp, acomp_ctx->acomp) |=
|
> >> -           zswap_acomp_req_init(&acomp_ctx->decomp, acomp_ctx->acomp)=
) {
> >> -               pr_err("could not alloc crypto acomp_request %s\n",
> >> -                      pool->tfm_name);
> >> -               goto fail;
> >> +       if (zswap_acomp_req_init(&acomp_ctx->comp, acomp_ctx->acomp))
> >> +               goto req_fail;
> >> +
> >> +       /* Synchronous algorithms decompress with an on-stack request.=
 */
> >> +       if (acomp_is_async(acomp_ctx->acomp) ||
> >> +           crypto_acomp_reqsize(acomp_ctx->acomp) > MAX_SYNC_COMP_REQ=
SIZE) {
> >
> > Where does the requirement on crypto_acomp_reqsize() come from? I see
> > crypto_acomp_compress() and crypto_acomp_decompress() only checking
> > acomp_is_async().
>
> ACOMP_REQUEST_ON_STACK() reserves sizeof(struct acomp_req) plus
> MAX_SYNC_COMP_REQSIZE, which is currently zero. A synchronous acomp
> algorithm can advertise a larger request context via cra_reqsize. Checkin=
g
> only acomp_is_async() would then leave that context outside the reserved
> stack storage.
>
> The core already applies the same size restriction to synchronous fallbac=
k
> transforms in crypto_acomp_init_tfm(). The operation functions only rejec=
t
> asynchronous stack requests; they do not validate the amount of storage
> provided.
>
> >
> > Regardless, these are crypto-specific details that shouldn't be
> > checked directly by zswap. Ideally we'd have something like
> > acomp_can_use_stack_req() or something.
> >
>
> Done for v2. Added documented acomp_can_use_stack_req() in the public aco=
mp
> header. It checks both synchronous completion and request-context size;
> zswap now uses that helper.

Thanks!

>
>
> > Also, could you please CC Herbert on future iterations? I would like
> > to get his eyes on any crypto-related changes if possible.
>
> Will do! Thanks! get_maintainers.pl didnt add him.

Yeah because it didn't actually change crypto files, but I usually
prefer someone who actually understands crypto (aka not me) to take a
look :P

[..]
>
> >
> >
> >> +               return __zswap_decompress(entry, pool, req, &wait, fol=
io);
> >
> > Hmm would it be more readable if we create a dummy zswap_acomp_req
> > object here and have __zswap_decompress() take in __zswap_decompress
> > instead of taking in the req and wait separately?
>
>
> I would keep req and wait as separate arguments. zswap_acomp_req includes=
 a
> mutex that stack decompression never uses, and taking the address of its
> wait can still reserve the entire wrapper on the stack. Removing the mute=
x
> from that type would add more restructuring. The shared callback helper a=
nd
> path comment make the setup consistent while keeping the existing stack
> footprint.

I am fine with that.
