Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E40EB4AD4CB
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 19:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789155939; cv=pass; b=gzPb7T9sdBYXc845nnchAYN6N1tdvlQQzmOUXLs+HkD5dOYo6705LRIpb17XBRuCeLsbb6b5iXE+0nIOYmub2ZtCdaCavvRs3jZjO3gK+kZQNTqSCMWARWDHjgMo9uS0hFVQIyMIhQrPkGtdhhsPH1VzVf24Y3PJ9k2hmFewxl4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789155939; c=relaxed/simple;
	bh=t6bnlkEkq0x3EDRE+pMdPsgc03pbQO6nQ+JtRlR0Jq4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lU6fSCi3mkNaAmQlWYJ3nxwAuJFK0DBHPNw8nx19i6dbP6+WeckSZfJBBxJ8tMeZydsCs53fhhbj4c/Wb+fmBbkvNg0QcDUBsD9CeUruCJNrW5Ewy7QL40z7pCJKH+7+iE5OlBcwokoBdTFX/E1AN3GCoHKheH3ooJk9SmH9dzM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LBrIgs0L; arc=pass smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LBrIgs0L"
Received: by mail-qk2-f13.google.com with SMTP id d75a77b69052e-530d5fc2cd8so102061cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 12:45:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789155922; cv=none;
        d=google.com; s=arc-20260327;
        b=WF+E6kXl478ugMfgZSlw1aoQ+C8o266+T8OUs07PHVqA9z9RVbU+wJuhwucUxanLD+
         ypDicv3pibuckIzqxo1PTEyb0j6Wa4/eotu4fcItV/knFFO9DHzHq3YZJ37pcaWXZbWE
         mNglzEL20xFvUWdJYJWwTCS5dC69XI8hRzTJWyEoYV64zpApTeJLS/Jd0mECDuuiXnxZ
         kYHtxLglDfCH3LKvUtUEoHlNU3WQT2mdAlj3TUwjgU4jd68mu48l8ngEzFyIiM4gq1in
         ARCk8Chgt6QziNcWI71aJ01Qjp94knY2IXlBn3ivn9Uceo39GF7jaNr12SVEnT7RwHia
         HOAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pGrPjSb9GRO+ZgaFFa5EElvDumbPFInkcUYffxOe9sg=;
        fh=vjYsFS1eVHxmU9NH6u85BfCwSM/jaYO4yHz4cF5FShU=;
        b=k1kLwwgHSaDoK/beoR9B6SRjXzksPrVYm3X+2gK4h2yiI/nhCFE6skbQL4k75OrfL1
         zL92OXvG7biAfWtPx8nFsyEpkTAfVVhkuJM3cInqVPfPRtPyz+dhsy9eOBetYj/lYD2r
         CVh/tQbhSQSbekNy5BrMZsWmLLe7lJWUhWOMeasREC6amrvXhiSfuMotQeVkSPTKngMF
         6PTtgNDKMmAxFeRs/5uNbOyNCpcZncXkonH6S0M/VTzwyZYuriq1SPvidMWRuITik4jK
         lVUlLXrqRYVqFnO3SxBOgK5/6mXhDPu04dbMWaYkkZsXRdXwP8AeKj/jXrW2dcyA6D/W
         es9w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789155922; x=1789760722; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pGrPjSb9GRO+ZgaFFa5EElvDumbPFInkcUYffxOe9sg=;
        b=LBrIgs0LL8ICAjkVaniVpck/N5z3j3+UqHkW/P/cyWoFTRt6NA48NhIyHCF2D6lJVD
         ubmT+9lcpfqUYQNwj91TVi8EEGVYM8JgH+osk19Ds2UJf/iKBUndm15gLbC+ZCMbDHK4
         La3y0rwiQSBImNJdUhJYcwiIvXRaMDksQwhIRkwQ+d42KtsOI0BiUzY3Z/BLi6QC1pwO
         eru01IC/N6D1NMHBqemVSLkGHviea7TRYhMudPLBljjPgrmv7H7HA6w2t/xd7m8yi2K9
         oBOvwXJgyY1bCNA2zTgzJ2MAibJxgAYSFcNs0dIMMIV+lMWbHM48qFmFsFgh06r7p15e
         A6Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789155922; x=1789760722;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pGrPjSb9GRO+ZgaFFa5EElvDumbPFInkcUYffxOe9sg=;
        b=q6ORbythK+Okh4m76k1bi8iuBEAZaKzaAI0tzuB1fz28Xaozzx8lJ2kQSRTFRl+lZW
         46nFEcs9nldzUnlMlVfAHK8ir+93V7ofRu6RipRMICPwvKXQD2AJCOxi1uPu38BGnUkp
         qTuf+Y7w+0bOuVOd68hcXfUmTJk3vu3r7BrHPTWwWCJXbv5AnfltXJ2VruaxuW4uazwJ
         zjheEsiISkttxlR3MgH2e9YuAWSIII03vDzGDJWiEs3Mlbbg0dpQvi+8jXjUELb3IKYN
         0p4lsS/kGKSGfbjj08PFu/yxB6RQBKrU1ybbFxwAYNftUrMyzc5TBoFlJBwQT0Sgp25n
         NArA==
X-Forwarded-Encrypted: i=1; AKwUvBzR5A7Mp82OXdnFmJcFlXQoNXZKvTyx2wGAfer0uVk4lxOG9Z5nQwREmj8avit6sxzvn7hZ9CIZyD8tttk=@vger.kernel.org
X-Gm-Message-State: AFuF++nE4nzCljPTn/Vw1D4X8whP9zCx/Uv5Jhe3Y88M6R/Juf+Hie77
	Oty+4vQI/D3HK7cH70H+0VdVqwskPFdDaVLEbvRW39/6vYlT1UfpQFCAca0uTVzaKW14603TeZn
	p45JjEOHZiwRUlepIEOiLtVk8KXX8ND7KjNTziTOE
X-Gm-Gg: AYBFou3BG0iyFm2oNFcBlnxplGFiTH3LVoYHgFj71JXSzHuTSlS/kxKYuuSUkRmmfDV
	4dNcYSmOSqSDAhBxLKzr0NJhZ//pQqvS/CB4ozlMpu1g6ethTRgxQkSTnNcHlrDQl0Pl2Fdg8Fn
	K25c/ko4056iwp9RcjN8r6TSS8BhZE/qqd7lZS//om1J1CjAvMlCPls+t19/rl3sZA92OO4KNX3
	G/kkkBpFJlbPDqVTnCih5T4tQwAn8xKNUZlVGCqtB/zG8BsSp3hGLEpl41SyXslcfcXI0mhi1r/
	4616me6UpL7egPJpDL09B0LPfuuvpHIQR+mBhpf7LDvj9K2UN4AUy+Y16qg/qwo7xKLsng2x74P
	ENerFrVKj5A==
X-Received: by 2002:a05:622a:87:b0:530:d9fc:253d with SMTP id
 d75a77b69052e-530e46521edmr2823151cf.6.1789155920731; Fri, 11 Sep 2026
 12:45:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260910234737.1340642-1-surenb@google.com> <20260910234737.1340642-6-surenb@google.com>
 <aqRF4YB7Ijk9PmRM@gremlin> <aqRPeZH4yeYXfWgS@gremlin> <CAJuCfpG-8sQjg2ECiRQpjn9tBj3AfEXnmgmomdfFGS7JoDhZ4w@mail.gmail.com>
 <aqRSvISJtYrt5Gvp@gremlin> <CAJuCfpGvB4o1HrKsi4zbzKNmdxppW_76xJUbaYeE+sN6w-u6UA@mail.gmail.com>
 <aqRVzecC23YpZeh0@gremlin> <CAJuCfpGOR5X6R2NwASMFwp=UtWCCDn64OJNEmzbMh9DDmn2d4Q@mail.gmail.com>
In-Reply-To: <CAJuCfpGOR5X6R2NwASMFwp=UtWCCDn64OJNEmzbMh9DDmn2d4Q@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Fri, 11 Sep 2026 12:45:09 -0700
X-Gm-Features: AcwNN1V3wd_DRFhQoDAVPV55rR1lWbHmfqoCJKHGvI1cpuMNSdgNmX8FA14BwPI
Message-ID: <CAJuCfpH0bDKabXqPRTQ0vHVeVwNZ9K2qgtwaJcCJD7v0ua-ZaQ@mail.gmail.com>
Subject: Re: [PATCH v3 5/7] proc/task_mmu: change proc_get_vma() to stop
 returning gate VMA at the end
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: akpm@linux-foundation.org, liam@infradead.org, vbabka@kernel.org, 
	david@redhat.com, willy@infradead.org, jannh@google.com, paulmck@kernel.org, 
	pfalcato@suse.de, xueyuan.chen21@gmail.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 11, 2026 at 12:44=E2=80=AFPM Suren Baghdasaryan <surenb@google.=
com> wrote:
>
> On Fri, Sep 11, 2026 at 12:26=E2=80=AFPM Lorenzo Stoakes (ARM) <ljs@kerne=
l.org> wrote:
> >
> > On Fri, Sep 11, 2026 at 12:18:41PM -0700, Suren Baghdasaryan wrote:
> > > On Fri, Sep 11, 2026 at 12:13=E2=80=AFPM Lorenzo Stoakes (ARM) <ljs@k=
ernel.org> wrote:
> > > >
> > > > On Fri, Sep 11, 2026 at 12:11:55PM -0700, Suren Baghdasaryan wrote:
> > > > > On Fri, Sep 11, 2026 at 12:03=E2=80=AFPM Lorenzo Stoakes (ARM) <l=
js@kernel.org> wrote:
> > > > > >
> > > > > > On Fri, Sep 11, 2026 at 07:26:49PM +0100, Lorenzo Stoakes (ARM)=
 wrote:
> > > > > > > On Thu, Sep 10, 2026 at 04:47:35PM -0700, Suren Baghdasaryan =
wrote:
> > > > > > > > proc_get_vma() returning gate VMA at the end is desirable f=
or the its
> > > > > > > > current m_start/m_next callers, as they need to report a ga=
te VMA at the
> > > > > > > > end of the address space. This behavior is very specific to=
 these callers
> > > > > > > > and makes proc_get_vma() hard to use for other purposes.
> > > > > > > >
> > > > > > > > Move this usage-specific behavior into the callers themselv=
es so that
> > > > > > > > proc_get_vma() returns either a valid VMA, an error or a NU=
LL when no
> > > > > > > > more VMAs are available. This makes it more generic, simple=
r and usable
> > > > > > > > in the later patches.
> > > > > > > >
> > > > > > > > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> > > > > > >
> > > > > > > Yes, very good change, thanks!
> > > > > > >
> > > > > > > Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> > > > > > >
> > > > > > > > ---
> > > > > > > >  fs/proc/task_mmu.c | 23 ++++++++++++++++++-----
> > > > > > > >  1 file changed, 18 insertions(+), 5 deletions(-)
> > > > > > > >
> > > > > > > > diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
> > > > > > > > index ecce7ce116cb..9a3c996c1d61 100644
> > > > > > > > --- a/fs/proc/task_mmu.c
> > > > > > > > +++ b/fs/proc/task_mmu.c
> > > > > > > > @@ -236,9 +236,6 @@ static struct vm_area_struct *proc_get_=
vma(struct seq_file *m, loff_t *ppos)
> > > > > > > >              * found the extended vma with the same vm_star=
t.
> > > > > > > >              */
> > > > > > > >             *ppos =3D vma->vm_end;
> > > > > > > > -   } else {
> > > > > > > > -           *ppos =3D SENTINEL_VMA_GATE;
> > > > > > > > -           vma =3D get_gate_vma(priv->lock_ctx.mm);
> > > > > > >
> > > > > > > Yeah this is just so confusing as-was.
> > > > > > >
> > > > > > > >     }
> > > > > > > >
> > > > > > > >     return vma;
> > > > > > > > @@ -248,6 +245,7 @@ static void *m_start(struct seq_file *m=
, loff_t *ppos)
> > > > > > > >  {
> > > > > > > >     struct proc_maps_private *priv =3D m->private;
> > > > > > > >     struct proc_maps_locking_ctx *lock_ctx;
> > > > > > > > +   struct vm_area_struct *vma;
> > > > > > > >     loff_t last_addr =3D *ppos;
> > > > > > > >     struct mm_struct *mm;
> > > > > > > >
> > > > > > > > @@ -280,16 +278,31 @@ static void *m_start(struct seq_file =
*m, loff_t *ppos)
> > > > > > > >     if (last_addr =3D=3D SENTINEL_VMA_GATE)
> > > > > > > >             return get_gate_vma(mm);
> > > > > > > >
> > > > > > > > -   return proc_get_vma(m, ppos);
> > > > > > > > +   vma =3D proc_get_vma(m, ppos);
> > > > > > > > +   if (vma)
> > > > > > > > +           return vma;
> > > > > > > > +
> > > > > > > > +   /* Return gate VMA at the end */
> > > > > > > > +   *ppos =3D SENTINEL_VMA_GATE;
> > > > > > > > +   return get_gate_vma(mm);
> > > > > > > >  }
> > > > > > > >
> > > > > > > >  static void *m_next(struct seq_file *m, void *v, loff_t *p=
pos)
> > > > > > > >  {
> > > > > > > > +   struct proc_maps_private *priv =3D m->private;
> > > > > > > > +   struct vm_area_struct *vma;
> > > > > > > > +
> > > > > > > >     if (*ppos =3D=3D SENTINEL_VMA_GATE) {
> > > > > > > >             *ppos =3D SENTINEL_VMA_END;
> > > > > > > >             return NULL;
> > > > > > > >     }
> > > > > > > > -   return proc_get_vma(m, ppos);
> > > > > > > > +   vma =3D proc_get_vma(m, ppos);
> > > > > > > > +   if (vma)
> > > > > > > > +           return vma;
> > > > > > >
> > > > > > > OK so I guess the logic is, iterate through every VMA, then o=
nce you run out,
> > > > > > > report the gate VMA. Makes sense.
> > > > > >
> > > > > > Hmm one thing on this though - m_start() still has:
> > > > > >
> > > > > >         if (last_addr =3D=3D SENTINEL_VMA_GATE)
> > > > > >                 return get_gate_vma(mm);
> > > > > >
> > > > > > As well as:
> > > > > >
> > > > > >         vma =3D proc_get_vma(m, ppos);
> > > > > >         if (vma)
> > > > > >                 return vma;
> > > > > >
> > > > > >         /* Return gate VMA at the end */
> > > > > >         *ppos =3D SENTINEL_VMA_GATE;
> > > > > >         return get_gate_vma(mm);
> > > > > >
> > > > > > Now at the end.
> > > > > >
> > > > > > Is this correct? Is it maybe duplicated now?
> > > > >
> > > > > Yeah, I noticed that too but I it's not duplication. The first ch=
eck
> > > > > handles the case when right after m_next() hit the end of the add=
ress
> > > > > space and set *ppos =3D SENTINEL_VMA_GATE, we ran out of page spa=
ce and
> > > > > had to flush its content. Once that's done, m_start will be calle=
d and
> > > > > last_addr will be set to SENTINEL_VMA_GATE. In that case we shoul=
d
> > > > > return get_gate_vma() and avoid calling proc_get_vma(). That's wh=
at
> > > > > the first check for sentinel is doing. The second one handles the=
 case
> > > > > when m_start() itself readches the end of the address space and h=
as to
> > > > > return SENTINEL_VMA_GATE.
> > > > >
> > > > > It's possible this can be refactored a bit and made cleaner but I
> > > > > would keep that as a separate change.
> > > >
> > > > Maybe just add a comment to the first one to explain when it'll tri=
gger? That
> > > > should suffice, cleanups can be separate yes.
> > >
> > > Will do. Appreciate the reviews!
> > >
> > > I'll post the update today because there is some urgency to backport
> > > these patches and I want to have a public link when backporting but I
> > > don't expect anyone to burn the midnight oil to review the final
> > > version. Have a nice weekend!
> >
> > Well you have tags on most things from me now so it'll only be one patc=
h I
> > think? That'll be missing mine anyway.
>
> Yep, thanks!
>
> Posted v4 at https://lore.kernel.org/all/20260911194145.1781926-1-surenb@=
google.com/
> and the only patch missing your stamp is
> https://lore.kernel.org/all/20260911194145.1781926-4-surenb@google.com/

Oh, and this one:
https://lore.kernel.org/all/20260911194145.1781926-5-surenb@google.com/

These were kinda related.

>
> >
> > >
> > > >
> > > > >
> > > > > >
> > > > > > >
> > > > > > > > +
> > > > > > > > +   /* Return gate VMA at the end */
> > > > > > > > +   *ppos =3D SENTINEL_VMA_GATE;
> > > > > > > > +   return get_gate_vma(priv->lock_ctx.mm);
> > > > > > > >  }
> > > > > > > >
> > > > > > > >  static void m_stop(struct seq_file *m, void *v)
> > > > > > > > --
> > > > > > > > 2.55.0.1007.g17ff1f9808-goog
> > > > > > > >
> > > > > > >
> > > > > > > --
> > > > > > > Cheers, Lorenzo
> > > > > >
> > > > > > --
> > > > > > Cheers, Lorenzo
> > > >
> > > > --
> > > > Cheers, Lorenzo
> >
> > --
> > Cheers, Lorenzo
