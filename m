Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793390462;
	b=J6l7JWMQgTI2ZWUz0j6z4dxLW2/9wTLl7IsKVuZYaaAmIjxiQ3QeQLVZalTtna43AQRT
	 /cer97nV2+tLfSR4xuVSOcYs78obSoH6S+lLtImOlSwvq7lAhP59bVoJaO0BzIex+4Gfq
	 +/HN3/Q7WYvZJPHl0IPPBZCWVZZ6WoaDEysJMsJI4J2U5xmpVKfL0S2ZshfUhimMutdfa
	 vVxXK1Eeh1Q7mz35oMHckCG0Ja9+TKzE5evw1TvS+fEE9lf639IntN+j5LLAjpYuw2J7X
	 D2f6fZ03Tn5HLsZWIUiaNeiDcmqompKrI9Uo1edHXD43KCciTONimZoaCcn+vWwcHUA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793390462;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=HVlJlElGd+QbrdLvZ5B/9aQalJg+BMx232eUurqCSmQ=;
	b=YDw3GfjfX/m6A2ISHZ962gWidMevWAf0oJnT7tKUG9I/zE4HOM2vFCBq7prLf3nR+e+5
	 xL3MbMJt0tvZGrsOROUME4xIynSC8fywnBUAD4N6NHZh/ZgQmv3sok8APqO+dyvFEY1Ic
	 dUOSbXUnjPZiViZ1uVY/atcDVWigS9M6vTmel38Cy2JxBCmS9en5gJjRAR2hRQuALB05J
	 q2QLT0jtChUEF96d9OjYvPmMtb+QC/nCUe5G0CbI0HS8Cp27mpEOjX4TzjM8HfnUBI1aF
	 rV+UdYMNO3O7NVC5bxTPxAOekAf1pCenyJ2w4FBeEsZWMBqZU3Aqrz9JkOgFnznwWwg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="g8mgA/D2";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CCE7606A320
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 20:01:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CCE7606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g8mgA/D2
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6ae305e3bd9so1844392a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 13:01:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793390460; cv=none;
        d=google.com; s=arc-20260327;
        b=W9xggIY5PqThXJfAMoyKKwLfCZDwFF7x96yNP++R34aLGsQ/rSq2YJS3EOKvkchCnx
         CkTnrmFPIneBLm21mnmlj9TmHSTj/smjbghRc9PHC+R7u+aqEdCz9+M2oArGhG8ys7/G
         Sh1JMzICzhbwvI5++ORlC0X4o5Qn3ylKjG8M0DRT82JbPd0wv46LH8xewDNciQrPXQq4
         cGgTmiupD7mVfXM8QhaRT127ST5ESwiVff58s1xs2m/8OAxOV3sUPjsjapj+AjPme++3
         wcObXH7vZBtAIzN/geIGmRMa45VxdhCOXTaDWPWmbedCeJcbKq039x5A2HKtWWJL+4R+
         FyWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HVlJlElGd+QbrdLvZ5B/9aQalJg+BMx232eUurqCSmQ=;
        fh=Uwf3TOOcR5wxWRDEiYZZHY1Diy1wF7viJL7m32BO6N8=;
        b=O70uJQ2yuGZb/FY5EcIlUYncCfJhwjNXhhlbHpwdZVns//KB4idgFgXqjXuNOGe1E7
         A8nXoY7A9nItZBFX+OL9xRZolG5UqCJ3aal2Sbzu7Ox8vw6kWryBdiQJ/tY+jueVEz0C
         dlQFycm3Dl4u+iqIPrZN1z7mdZN9hX26pvfDX74Oit8bGamFwe4b420Q9VMJZmVB8HsR
         GH/vJXFDnuqtSC6MBhl7Wsk2ktD/CdgToCFe3VV1wclXB+UR+0VeuXivz/suzH182UWF
         6ST4YErDYGXAWQBNq3DxSVo3XfOEJTgTxmfJvMQ834m9IT44YNwVGYhdEtSkRABm4+Gw
         7qHg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793390460; x=1793995260; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HVlJlElGd+QbrdLvZ5B/9aQalJg+BMx232eUurqCSmQ=;
        b=g8mgA/D2ubWwFDSCsjm8MooCSmZdYgKHLNehpTH7tNxpKaJWeHMLlqRuVKTkFDuNwc
         3WRaCc5jzUUEQNJ0GhMjQgX3vo/l67Fys/X/yB87I+TKDKEfNqK1Q0ckZOk+BjiK8f6h
         iiu7xOIejDS77WQBNHmgF0l9VdgQPbDQFeZ9FDt5pZiZ0RRegUKgkPXNrCjsFDILBc+e
         blZUMa6PJ2bnp2et+so9By4cAmGh88jvsUNEJE8N453tDHGKX4/YDsOtuCv88oqRrWuD
         OtZeLnlt0fa1mIt0hS+ymu8GCeQUkiSsA2pglcF8hOO/8RuUoy1LvN+S5Jslindnw5GM
         4Oyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793390460; x=1793995260;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HVlJlElGd+QbrdLvZ5B/9aQalJg+BMx232eUurqCSmQ=;
        b=ymcan+JG0Z0WRHDcEsx5UYziwHIwotLqLdFcjL+o1AQaroSeWpTSBTWBOJyUjkPmkK
         GasswmBI8l14LzACzCXVOZb54BlIar0UIlIaisi2b8p5i3MS4tBQMWbgumnrwvkbVxuO
         psFCLnAF/Ovdt/Ykcfe/CVTo4RvqfoECCwYcfFokhSLYWIiYSvldCWFGnobHIunzJ8D9
         Ql3qqE7wL06oGn4gdbOZm7iHPATCJl/JGCv/Us1xQ8oxx+ZZ+kt9WZ+PsOW+UmsR9qf/
         5he9wwVuTmPyOuRPvCwBbfjtNl1R+vyt9OF1kZg9WNd2KftkgoHebopcxYvvwqs6HH8a
         969w==
X-Forwarded-Encrypted: i=1; AKwUvBzAsZd5orCHrtbWpXDodb50HkKbyPbLixee7nZbJj6D1NLCVx273pKDZWtiObjex0xXmWZhcuzclMfYElw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLWh2OUGpVjSTnqEul7sxlTBTDdb2A/1M0tesyHT2sRmi5bArvB
	iAOHbZpFOdXhY0H7AjcUIf5sRwlYvVEXegBDIv0eQCcK0NlZheF/Ns4C/z8Vttk83lsXz0NxvfP
	YMPv5EJwhAxW2lkLWOvvhFMrr06s0nck=
X-Gm-Gg: AYBFou3WQAkFp635v37eBmbCNeVfRNGqBqDeGHgqQBltkCDYtc1o7Ug/Urac83VjM+x
	RfUubAP3r6kR++/NVmwuOsN1wtBRSjPw5JE7HXHsG2dxCr7ySLMBaFhmqbwjzjKIUj/0vF5RFaY
	vYZKTzf/MZjgh3oJUKhjmG7e942EVb65H9czTUC9bJWHlY7VL/G6uEBgdA/2QNQKUKHmvCO680H
	4ns/r+NX2aIxI6fycscRkuSTPy8rYXIYQorVz5vL2GWe4XwJmiwVQSsF5lKqat0FZfREgJSTV12
	uL2+sGCYPAEdWGjRkTjOPa/m0wErdcV5y0sZt3XKVRueuEkNYk643bP+eVQv6/fvrGZDE903xUL
	QZBZD/y3WfGJeP9A7FQXP6xK5LPi9p+Jy9lQaEC4PLOpZ2rz/TbuC0ad6WJgRRiwojbYdgw==
X-Received: by 2002:a17:907:1b29:b0:c41:26b8:c49d with SMTP id
 a640c23a62f3a-c4ca7ab18d6mr304192666b.38.1793390460290; Fri, 30 Oct 2026
 13:01:00 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030-swap-fixes-v1-0-73f73a59f2fc@tencent.com>
 <20261030-swap-fixes-v1-2-73f73a59f2fc@tencent.com> <auOz00OGB_8dgniC@cmpxchg.org>
 <CAMgjq7BYgXLheXDyc=p2mNgxdP3+92v2WHGiXiweDrsiYQ0u2g@mail.gmail.com> <auSWtJzFQ7KdElKL@cmpxchg.org>
In-Reply-To: <auSWtJzFQ7KdElKL@cmpxchg.org>
From: Kairui Song <ryncsn@gmail.com>
Date: Sat, 31 Oct 2026 04:00:22 +0800
X-Gm-Features: AclHuK8q5xaCpZfiOdmN3WawlaMgw0pNWtgjLHNKgZXSWivCrJGS89rQKrGnLYw
Message-ID: <CAMgjq7AJ0uajpVM+Kva5=_EXtmaawYR8TJQ6RdhrP7+NUZDx=w@mail.gmail.com>
Subject: Re: [PATCH 2/3] mm/swap: account synchronous swap reads as memory stall
To: Johannes Weiner <hannes@cmpxchg.org>
Cc: Christoph Hellwig <hch@lst.de>, 
	Kairui Song via B4 Relay <devnull+kasong.tencent.com@kernel.org>, linux-mm@kvack.org, 
	Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, 
	Baoquan He <baoquan.he@linux.dev>, Barry Song <baohua@kernel.org>, 
	Youngjun Park <youngjun.park@lge.com>, Yosry Ahmed <yosry@kernel.org>, 
	Chengming Zhou <chengming.zhou@linux.dev>, Usama Arif <usamaarif642@gmail.com>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Chuanhua Han <hanchuanhua@oppo.com>, 
	Mani Tofigh <mt4022@columbia.edu>, linux-kernel@vger.kernel.org, 
	Josef Bacik <josef@toxicpanda.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2026 at 9:08=E2=80=AFPM Johannes Weiner <hannes@cmpxchg.org=
> wrote:
>
> On Fri, Oct 30, 2026 at 07:16:51PM +0800, Kairui Song wrote:
> > On Fri, Oct 30, 2026 at 5:00=E2=80=AFAM Johannes Weiner <hannes@cmpxchg=
.org> wrote:
> > >
> > > On Fri, Oct 30, 2026 at 02:31:42AM +0800, Kairui Song via B4 Relay wr=
ote:
> > > > From: Josef Bacik <josef@toxicpanda.com>
> > > >
> > > > Swap-ins from SWP_SYNCHRONOUS_IO devices such as zram are no longer
> > > > counted in PSI memory pressure or in the swapin and thrashing delay=
s of
> > > > delay accounting.  Refaults of the workingset from zram, the main i=
nput
> > > > to userspace OOM handlers like lmkd and systemd-oomd on zram system=
s,
> > > > become invisible in /proc/pressure/memory.
> > > >
> > > > swap_read_folio() opens the accounting window with
> > > > psi_memstall_enter() and delayacct_swapin_start() and, per its comm=
ent,
> > > > means to count the submission time.  For synchronous devices the
> > > > submission is the entire read: swap_bdev_submit_read() does
> > > > submit_bio_wait() and completes the folio.  Since reads are batched=
 in
> > > > a swap_iocb, swap_read_folio() only queues the folio with
> > > > swap_add_folio(), and the bio is submitted later by swap_read_submi=
t()
> > > > in the caller, e.g. swapin_sync(), after the window has been closed=
.
> > > > By then the folio is uptodate and unlocked, so the fault does not w=
ait
> > > > on the folio lock either and the read time is not counted anywhere.
> > > >
> > > > Found by code inspection; not reproduced.
> > > >
> > > > Fix by submitting synchronous reads from within swap_read_folio(), =
as
> > > > was done before the batching, rather than from the caller.  This gi=
ves
> > > > up batching of readahead for synchronous devices, which do their I/=
O
> > > > inline anyway, in exchange for keeping the accounting simple and in=
 one
> > > > place.
> > > >
> > > > Fixes: dda8fb68b590 ("mm/swap: also use struct swap_iocb for block =
I/O")
> > > > Assisted-by: LLM
> > > > Signed-off-by: Josef Bacik <josef@toxicpanda.com>
> > > > Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
> > > > Signed-off-by: Kairui Song <kasong@tencent.com>
> > >
> > > Hm, this isn't a complete fix to the problem described. IO throttling
> > > happens at submission time, so there can be significant delays on
> > > async devices too that are no longer tracked since the culprit change=
.
> >
> > Yeah you are right! Thanks for the heads up, not only a sync isssue
> > indeed, async devices are affected too :(, throttled swap fault also
> > went unaccounted.
> >
> > > How about keeping the accounting window open across the batch? Opens
> > > on first read, closes on submission. A batch with at least one
> > > workingset folio is "contaminated" and the whole sequence and
> > > submission becomes a stall. Would need to pull the !can_merge flush
> > > out of the batch-add function to get the accounting window right but
> > > that seems reasonable.
> >
> > Won't this cause an amplified PSI reading if only one folio in a batch
> > is workingset? Maybe not a big issue though.
>
> Hm, I think the only option to avoid this would be to split the batch
> and flush more frequently, which I'm not sure is worth it. The batch
> size is only 32 folios...
>
> diff --git a/mm/page_io.c b/mm/page_io.c
> index 22e5ac1d298f..806cfe633a95 100644
> --- a/mm/page_io.c
> +++ b/mm/page_io.c
> @@ -207,6 +207,8 @@ static bool swap_can_merge(struct swap_io_ctx *ctx, s=
truct folio *folio,
>
>         if (ctx->sis !=3D sis)
>                 return false;
> +       if (rw =3D=3D READ && ctx->workingset !=3D folio_test_workingset(=
folio))
> +               return false;
>         return sis->ops->can_merge(folio, prev_folio, prev_folio_size, rw=
);
>  }

We are in a dilemma with this change: if it fires frequently it breaks
batching but improves PSI accuracy.  If it doesn't fire frequently, it
has no negative effect on batching and performance, and it isn't helping
with PSI accuracy either :/

But after a second thought, maybe we can live with it by having both this
posted patch merged as it is and appending your suggested fix: the two
kinds of devices end up differently.

For sync devices the batch is now always one folio, so there is nothing
fancy, everything is accurate.  Readahead batching for them only happens
on the MADV and swapoff walks, so the cost is limited.

For async, the window covers submission.  That cost grows only mildly
with the folios in the bio, block layer and dispatch work, unlike a
synchronous read.  And the previous per folio accounting was not
exact either: in a single threaded task, the throttle or cost of
a non-workingset readahead folio pays is also holding up the workingset
folio's refault, since the task cannot start the next submission until
that one returns.  Same story for delayacct.

And we are missing the completion wait either way: if a fault finds the
folio in the swap cache with its read still in flight, it blocks in
folio_lock_or_retry() in do_swap_page(), which no window covers.

So perhaps we can live with it for now by having your suggested fix
on top of this posted patch? Some comments could be helpful here and
maybe some further improvement is needed.
