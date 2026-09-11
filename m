Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70B4D38A714
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 18:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789150129; cv=pass; b=IcirF2qg7T07sW5P2wsPewmmVhFoY9aVeETc7WPeD4SaUP4muoWw03zxcKThQ9zRMqjCL+vAsKX9MyMfHG02dGHm/midx7woVkJApvdps6Oqe8e+kPwzFhMX2WzqmXZspDbumeUyCpqlqOMZbeg05MFJzQrwhFtuV2DO+gVniEM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789150129; c=relaxed/simple;
	bh=esaZDH15yD25FQT2YqEEZjt4AYj47K/MD2LJEILFV5U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VbrUFLgKW3ljJ158cBEdujP1+Q6pqOZ13IT/kGDK0LsbMU93j7yjUyPqifKbIol/+qku2z5huXt3uoFSPdZomUAVl47GO8hSZLu5PV90WIsrLY1iwVTCFLWzzxeqvK0SP+tY6hu3RVt2IqkwSWXPIneIXFLrflUnUG6I+9mzqIY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LWO3o4yU; arc=pass smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LWO3o4yU"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-53012819c04so84481cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 11:08:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789150126; cv=none;
        d=google.com; s=arc-20260327;
        b=SFD+NCjiSza9Ojrvnj5+iKDp9DbD82NOljfjYH4JXWq7f6i+3Z5Zm1f6kcGQWCipBT
         Az6oEJk4AonbxLqsIVkAo64gsIEUN8EeMaZBAICelZ8BulQdzrZxSZIiOOnYmiR0huIA
         +0oIipeaUjJn0RLtpEghHNv5EviXbVPEq+Bh4/P25QY2KuAzBzvI3My21qboWDFg3lh7
         15kWMQHJULUKSg2NDD8JfidLXb5pw/YoOX3+82sZAV5jIK3CUzPURAOFwKLavEcDEcFs
         A4+7Wk4OS9NsxWJrPblfesIr5shtkNeUGzhRoUHlTWkDSk6ThNJL6x1EbpMnHXXBPWde
         rcHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=G3lYyGqHKOjMfd0nQzQBuRt7mmmFYg8CXav6CCXPIUY=;
        fh=qdRIvywwsWOhAOk0pMTYw6ORZEo3pGOgLMpK8Kk1nmQ=;
        b=IQ/nnZqHQo25maWHlC8z0O9WCkGGdY/lvVzbDhKG3ux1suyTr+Aqdbf3AO/p8zWtKQ
         lFEckygT+3ISMyJfUxIu8Ok+iOQWSSQmJNuwvydkNCTS9TA4WLEMeKTkI35T0VKSOBqu
         oOX/DG4ynpN0OBXJ3AIAXpBXDVG3h8cMfImNxKKj/VG+yA3i9hAj0Z85Ptjiyz2dud6V
         omYVo0SN8LFPCYrfs6AUiw0UpwfRgN97Hys4zC3r0qCfYbtEvTdAKkQQgiNpF1p2BaIw
         ++cZtlh+bxG4xu8Q1t/jMZ7sg8xMO/dh2RzlcEm2tU+K8ONxNLIzcRRpp2HoY48gwRnI
         INJA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789150126; x=1789754926; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=G3lYyGqHKOjMfd0nQzQBuRt7mmmFYg8CXav6CCXPIUY=;
        b=LWO3o4yUdTz0R6XtpekpqCjYqL7zStLOO4BCRfTdPAwxp09RFNPpz74afScjyMFyJH
         Jvo+DM2SulIBCBnfewwsXIMHMEMZw5+fvUfUGYbEjOsti6IsEndtPlBziLZ+seFBN2Yk
         CgFM71iTQJuUzETl6eptIIs8AZIgIRbk4f40g2BYClwvG0mbcz2ogUSNXDJQBCoTfPVJ
         zb8FOSq0ZwEz9uwATSuCGRyFKztbGe/2WOsZ0VAZHkIdUb4HxdiUT7+AxXbF05kMmIe8
         NeYnvlMJyJNvyVX/d9Zo8msMNWTGL7593so+CL3ci2/XZAy32kJsG3Dm8Pi4hoCExt7K
         nDAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789150126; x=1789754926;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G3lYyGqHKOjMfd0nQzQBuRt7mmmFYg8CXav6CCXPIUY=;
        b=TWw2pTLk/DBJMY45UyZVB0nycxWU9g0BHt9w6LuPzhUv2DWHCCEslXY7e/cO7AC9UO
         JprLLsJ7wqYn9nqeUzR4oKQ7Ock/1uPuBnDQwSjr4jqjmO1Gp7Dn7hDzscFJZ2T6HM/+
         QKop2MaqtZZZ3V/eUASRua9PfddlxcVDConlmUOe0t5GxX7BOzNgj3g9Yqqe+QZ4bliw
         PguW8axdCUe380rWTn336BdYZeiHnKFE6hOoFKhJ7caBt8bjD0MhtKBt+QWg0g4mPTC2
         gflOfsoh4/NxyL3Pa2Et44dHSujyIBO5r9MNVdG5CNiCyJJkWXIjtlGDR8AzD8GI9xsj
         Bs4Q==
X-Forwarded-Encrypted: i=1; AKwUvBwTqefuFArUpQo87MNm3frC7wAIgzTegs6q9lrzsSz6rNAkzBeqQIvDvp8vl3yt2uRNGMdRJ21MvKTtJoU=@vger.kernel.org
X-Gm-Message-State: AFuF++nscbWeCWikThssHVWhFcydrgETryjfN/oTVie4L7WO5DZa+K/y
	agnYTKqklJ4yEh3/l/aMmfOMvdH1zOk2hZYd1ZUZ0KzNYDen45HW58MFSKxiANe6MPZsmLbmVp8
	SFCS9LlHfoW9IVOLbYXwpwjFl1V4GjfowdzCGWFyB
X-Gm-Gg: AYBFou3hlZlw9bBwbsqwCOUWcxwvMD0vCf3BiZQX0j/poCXBcJVK7YC+/U6ScEjJ7Oc
	F9zBSBq9xXGVxjHGRk3FPlAu0mhBSTqr/q9j++e1gyc6y6FpGZMoyMpkdtLGzigdey0b2KvGIdH
	8POiBOIyWUwrhCx7bxuO/k4hoBb9kujzjRcFov9MHWPCUQOucMPaKRYWpVZA0WuJzEQuDVgW3Rt
	ez5pxQ/ywonkvskjwy0vFyF/vo4zphrIkWVvU0YFRY4V2U/qxKh02smX/7ZZ62qVkIMaew1YWFv
	/+QDun1bbvhD6wC55lQ/7rUWwyybsRjHLF0elYqU4ZhTmkMR80CJc5VWEhQ7Fs95It/yFRu8UMu
	b2rnqQXOW1w==
X-Received: by 2002:a05:622a:124e:b0:530:d8ce:c26f with SMTP id
 d75a77b69052e-530e46f45camr1234961cf.6.1789150125329; Fri, 11 Sep 2026
 11:08:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260910234737.1340642-1-surenb@google.com> <20260910234737.1340642-4-surenb@google.com>
 <aqQoPTTUC9M5HkYb@gremlin> <CAJuCfpEHeFSMamNhf=FLvFjh9D8DBwZtbKwL0zi=x-2g8B+ENw@mail.gmail.com>
 <aqQzk2AT05r6rOyT@gremlin> <CAJuCfpEMd=hVtwe_9Rp1kqigYJwqEUGCD+ViQmoacAZONCR6DA@mail.gmail.com>
 <aqQ_cPerswqY9ZPL@gremlin>
In-Reply-To: <aqQ_cPerswqY9ZPL@gremlin>
From: Suren Baghdasaryan <surenb@google.com>
Date: Fri, 11 Sep 2026 11:08:33 -0700
X-Gm-Features: AcwNN1XgFF_qGTm7m9tvRDVhYFWJVU8m1f8OKlmITfXyXo13YNbSPwvOnx3S2VE
Message-ID: <CAJuCfpHzjvd6wKT9XN5BUSWnrGHhcaPVOyr1rb0bJ-fetkKhvw@mail.gmail.com>
Subject: Re: [PATCH v3 3/7] proc/task_mmu: clarify shmem mapping walk
 conditions in smap_gather_stats()
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: akpm@linux-foundation.org, liam@infradead.org, vbabka@kernel.org, 
	david@redhat.com, willy@infradead.org, jannh@google.com, paulmck@kernel.org, 
	pfalcato@suse.de, xueyuan.chen21@gmail.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 11, 2026 at 10:56=E2=80=AFAM Lorenzo Stoakes (ARM) <ljs@kernel.=
org> wrote:
>
> On Fri, Sep 11, 2026 at 10:39:01AM -0700, Suren Baghdasaryan wrote:
> > On Fri, Sep 11, 2026 at 10:10=E2=80=AFAM Lorenzo Stoakes (ARM) <ljs@ker=
nel.org> wrote:
> > >
> > > On Fri, Sep 11, 2026 at 04:58:40PM +0000, Suren Baghdasaryan wrote:
> > > > On Fri, Sep 11, 2026 at 4:28=E2=80=AFPM Lorenzo Stoakes (ARM) <ljs@=
kernel.org> wrote:
> > > > >
> > > > > On Thu, Sep 10, 2026 at 04:47:33PM -0700, Suren Baghdasaryan wrot=
e:
> > > > > > smap_gather_stats() optimizes stats gathering by skipping the w=
alk for
> > > > > > shmem mappings in certain conditions. Update the comment to cla=
rify
> > > > > > these conditions and use vma_is_cow_mapping() for COW identific=
ation
> > > > > > instead of open-coding it.
> > > > > > Instead of using (start !=3D 0) condition to identify partial w=
alks, use
> > > > > > more semantically correct (start > vma->vm_start) check.
> > > > >
> > > > > I don't agree what you're doing is semantically correct, it's a h=
ack really.
> > > > >
> > > > > Callers are passing start=3D0 to indicate that the entire VMA sho=
uld be
> > > > > processed and that happens to fulfil your criteria but in a surpr=
ising way.
> > > > >
> > > > > And the start in these cases is corrupted.
> > > >
> > > > Well, the "other" Lorenzo does not agree with you and suggested thi=
s
> > > > approach in [1]. Specifically, see the comment:
> > > > ```
> > > > I also don't love that 0 is taken to be 'start from vma->vm_start' =
and I
> > > > also don't love that the code in smap_gather_stats() actually speci=
al cases
> > > > this...
> > >
> > > I'm not sure what part of this is disagreement?
> > >
> > > It's saying passing 0 is a hack, which is one that is still in place =
and which
> > > this patch makes worse, because instead of explicitly calling out the=
 invalid
> > > value, you're treating it as if it were valid.
> > >
> > > >
> > > > How about passing last_vma_end and making smap_gather_stats() more =
sane? In
> > > > the other invocation of smap_gather_stats() we could pass vma->vm_s=
tart
> > > > here.
> > >
> > > Yup, well me of 3 months ago should have suggested what I suggested r=
e: wrapper
> > > (I think you cut that suggestion out of my reply).
> > >
> > > > ```
> > > >
> > > > [1] https://lore.kernel.org/all/aifO_rCurVhFRTcl@lucifer/
> > >
> > > >
> > > > >
> > > > > >
> > > > > > No functional change intended.
> > > > > >
> > > > > > Suggested by: David Hildenbrand (Arm) <david@kernel.org>
> > > > > > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> > > > > > ---
> > > > > >  fs/proc/task_mmu.c | 24 ++++++++++--------------
> > > > > >  1 file changed, 10 insertions(+), 14 deletions(-)
> > > > > >
> > > > > > diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
> > > > > > index cfc7af1b551d..3c40c9cbb9c9 100644
> > > > > > --- a/fs/proc/task_mmu.c
> > > > > > +++ b/fs/proc/task_mmu.c
> > > > > > @@ -1257,6 +1257,7 @@ static void smap_gather_stats(struct proc=
_maps_private *priv,
> > > > > >                             struct mem_size_stats *mss, unsigne=
d long start)
> > > > > >  {
> > > > > >       const struct mm_walk_ops *ops =3D get_smaps_walk_ops(priv=
);
> > > > > > +     const bool is_partial =3D start > vma->vm_start;
> > > > >
> > > > > Yeah not in love with this, without changing how it's called.
> > > >
> > > > See [1]. This is exactly how you wrote it at the end of that reply.
> > >
> > > Assuming you passed vma->vm_start, not 0? Passing 0 makes it really s=
trange.
> >
> > Ah! Now I see the problem you are pointing out. Ok, in v2 [2] this was
> > done correctly and that's the way you want it!
> > Okay, I agree this split was incorrect. I think I'll move is_partial
> > conversion completely into the next patch and this one will only
> > update the comment and use vma_is_cow_mapping() instead of open-coding
> > it.
>
> OK, it probably makes sense to have the CoW change separate.
>
> I replied on 4/7 about how I think that should look re: wrapper functions=
.

Yep, refactoring the patchset as we speak. Should be ready shortly. Thanks!

>
> >
> > [2] https://lore.kernel.org/all/20260907063918.3432401-4-surenb@google.=
com/
>
> --
> Cheers, Lorenzo
