Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90B6A229B38
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 19:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789154354; cv=pass; b=JU3tW1M0HPGlv2jY3e6+iUCTGkNCqqgythDIHsOA4tQTU6j/z9TLhf9HTI0SrkZjIDrBMdPs2z0le3cNpiIZvab9DOqbGsT04PzA97RlpOCps22z0U87dsKCk/cjFoqWr/lf9c1edZIG7pGUKQbMBuRliPFiYB4IBPVQA+jCnUU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789154354; c=relaxed/simple;
	bh=ovCn0bXnyVc2xzgwQBoKl7i+qzDQJtyekBT95i4IyCo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZZoZuZzb5skDbfFkHxaIzk6R1wEgIN84VkeY93UDD++0EKkAqQcW/XmG2j2gVfZpeLgtK2hGcsdRK/+7iLmid0Z2/vGdRFLnuCutW13ApeENOA3lWerl8mpS+Qc/2CZ9ZCtfqVGUBZXODFXJ85sNG5VmEMx/A5igMCKbGl0OSDA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=h/8pw4HZ; arc=pass smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="h/8pw4HZ"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-530411c7ee1so118361cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 12:19:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789154338; cv=none;
        d=google.com; s=arc-20260327;
        b=UCpGmorsoelpgsaALlt76m8fnKWU1ZW/p8EdWvJsBOQXnCBzG/mTVL3SzSsALQH/JW
         f9ElnoU2oe7vOfpNcL7z9l8DTqXSGzx7cx9RVtpNBbq831ENzQLnBuf5Can37Q6ZIqSP
         r9oVjyTHgZ5dsZvATIIesssZgAR73E7SYEkVreQmd8VqEpyp1atZLehV/lxuhcXAKjs/
         EK1nH/O2D5a4TpQDxCQF5BgmT0xFOr+/opAEXOb/8RNHaFpmx60VpEUqj7j56NdBcYby
         evs+JvK4fJMOGAgnc5Oqbkf4S2ePnROWRGHsIGYVK1jdXCXEVf87QMga03A9v/+h0DHG
         Lt6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vIEx8uU8IqjffSSCDEyJeKQJtwuejUussKszKVj30XA=;
        fh=mLAlcu3hxw2DSzlpKdwngOalo24srW6l+kRpt0WRjXo=;
        b=m7PqG4Z3IAiOPpVJXubyXqDZ+prbA82LziQCYU8fIpCx6DARGoBoxcT7VWuihrNP98
         ZQOgbxLVYhidD0AmzF5wgDPdoBK43jAL6YjK+1kuiTAn4fzTTqZT+tPtrRCA4Isqx94+
         YifJs8GW4bb+DHJouZzyKYGxsiM2HgXGlTLbO3Y9U4fhKuYyNZ6yH6e+4VzNiXir6Sgl
         zCzr4qU8QwKGAm9XAhqVG0GEGhxFkSkJjBSFlpvNfStgm2S2+PklPShh6TxBooy5SPnu
         TdEi8Jjt2bi0Ow8+gFK2rGSS5x6AZWc1thrAr81noiuVDLRQou76+n6le/KfN2DjtD1e
         2Hbw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789154338; x=1789759138; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vIEx8uU8IqjffSSCDEyJeKQJtwuejUussKszKVj30XA=;
        b=h/8pw4HZ4Y3Rbps4Fzcz05zrqpW039+Y53mwNSyBwc9adKXF4/TTmATVE5+6k94K7q
         osOLH6gluLmZXo1XxjYAV1fIB1/CDpTdXYepwuJfuq1nsWsa9mTUZGn3flXImJlsEh7A
         eEqTtrA3AkbOWdybig0U9G7lwOBBPQFmePyOsIVjRomvz82TXNgdJTzc0io8vVRziFJO
         IQlqcvCzEhpRE520PeWI+LuXakBWBaDurEDfc+o+CRBajouQvAwrXrqdZLff+nQ60bko
         wyUjnymRJyB3TmRISj0mnDP1/0DObXP1bxdHbE/ZKQFahYx7GJ2+LTWUwAJJuPuoxDCn
         J5Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789154338; x=1789759138;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vIEx8uU8IqjffSSCDEyJeKQJtwuejUussKszKVj30XA=;
        b=L/GwUeyxQC9yb+EPpyosioRZ9fn3fNJ/Jn2Q+XDqh81daGBvHAQ6T5JFWIiJAHodIf
         PoLGTr8s3Kv+00pLxGGlHxirPBK/9qVgJMPn2Cf/emonCAKaHTfj12pfJEHr/O4nzWd/
         /32IpQTkPTENE2xOz4l2nidEzQPt0KYNEkXbsNyvRFKxaKvWguSK5si25Rj6xgDNInO3
         C0MXCCYq9OB8gDcQmreZh3duq5UQ4fX5yyoKpnGhAc4jFhFj/Kk27sAdBDj5c95zWDRu
         ol/OEZcUd0vFNe5G9dDuBYeOfZEItT2LMQSYi16ydtZUolW1gbXNSzwE2BkRnFjrg72B
         QwcA==
X-Forwarded-Encrypted: i=1; AKwUvBz2HDaZImmmxS5rwCEyyghx5lAlFOHnz0XN6IOSC2tZ+kOmCmiDy9i6LAcRfQWR77uLM1jLmnBJ3wl+ncw=@vger.kernel.org
X-Gm-Message-State: AFuF++mQy1SMKh/JM9prgecggoxq4iPln2FLPfLtKxsR2mE6LC3zkoKi
	GVbsIlRKI/zYJIMs5VJnNVuaaWu80TRS1t8gMvWsI7FQkrOATwq0bJUKYZOJeDv3YOwb1zKArM1
	Pq+cKM/bdmuXVLMlFsuCWdprHTtMCYqIqKoRUzS+O
X-Gm-Gg: AYBFou0uD/A8Qh0eKiTv0F5A9XQOg+M/Mpe/zojY7Y/YjPjxFcj2ln5SzNPv14e50lJ
	d8B/8jTWSgMwIS+z98TfaAPXr5DLCFKwjgKcCx7gXDqX28ElmS5JVUwAgH0DPfwlHKyEkIU5dZs
	r2PFWo2p4JmfvEJ5spk2XtmkIrA6PXRQh7vdUCadLTARKV526hXkJw5LlTHN8oGTAvYzTLRcyJL
	touJtBhD105Uzjf8KU199sUmWvgDnbzlkHF4BOePrZSES3l2icOpU0hQy4KnvLjYEaFWr+fphqP
	TSJTbn61s3afRK4htQyhAJvQIDyaUGEkcYxBLarluaniS0ZBawt9ptN6KmRYY1LIZ0m3bxERYdL
	Kp4HtkWNmMA==
X-Received: by 2002:ac8:5c85:0:b0:530:4182:5a68 with SMTP id
 d75a77b69052e-530e498be91mr2143731cf.15.1789154332936; Fri, 11 Sep 2026
 12:18:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260910234737.1340642-1-surenb@google.com> <20260910234737.1340642-6-surenb@google.com>
 <aqRF4YB7Ijk9PmRM@gremlin> <aqRPeZH4yeYXfWgS@gremlin> <CAJuCfpG-8sQjg2ECiRQpjn9tBj3AfEXnmgmomdfFGS7JoDhZ4w@mail.gmail.com>
 <aqRSvISJtYrt5Gvp@gremlin>
In-Reply-To: <aqRSvISJtYrt5Gvp@gremlin>
From: Suren Baghdasaryan <surenb@google.com>
Date: Fri, 11 Sep 2026 12:18:41 -0700
X-Gm-Features: AcwNN1WG2bylStI11oz5hgwXcx_h9MCQ-S7zrTZGjslGEl7r32QMSMJo4pyGgXI
Message-ID: <CAJuCfpGvB4o1HrKsi4zbzKNmdxppW_76xJUbaYeE+sN6w-u6UA@mail.gmail.com>
Subject: Re: [PATCH v3 5/7] proc/task_mmu: change proc_get_vma() to stop
 returning gate VMA at the end
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: akpm@linux-foundation.org, liam@infradead.org, vbabka@kernel.org, 
	david@redhat.com, willy@infradead.org, jannh@google.com, paulmck@kernel.org, 
	pfalcato@suse.de, xueyuan.chen21@gmail.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 11, 2026 at 12:13=E2=80=AFPM Lorenzo Stoakes (ARM) <ljs@kernel.=
org> wrote:
>
> On Fri, Sep 11, 2026 at 12:11:55PM -0700, Suren Baghdasaryan wrote:
> > On Fri, Sep 11, 2026 at 12:03=E2=80=AFPM Lorenzo Stoakes (ARM) <ljs@ker=
nel.org> wrote:
> > >
> > > On Fri, Sep 11, 2026 at 07:26:49PM +0100, Lorenzo Stoakes (ARM) wrote=
:
> > > > On Thu, Sep 10, 2026 at 04:47:35PM -0700, Suren Baghdasaryan wrote:
> > > > > proc_get_vma() returning gate VMA at the end is desirable for the=
 its
> > > > > current m_start/m_next callers, as they need to report a gate VMA=
 at the
> > > > > end of the address space. This behavior is very specific to these=
 callers
> > > > > and makes proc_get_vma() hard to use for other purposes.
> > > > >
> > > > > Move this usage-specific behavior into the callers themselves so =
that
> > > > > proc_get_vma() returns either a valid VMA, an error or a NULL whe=
n no
> > > > > more VMAs are available. This makes it more generic, simpler and =
usable
> > > > > in the later patches.
> > > > >
> > > > > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> > > >
> > > > Yes, very good change, thanks!
> > > >
> > > > Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> > > >
> > > > > ---
> > > > >  fs/proc/task_mmu.c | 23 ++++++++++++++++++-----
> > > > >  1 file changed, 18 insertions(+), 5 deletions(-)
> > > > >
> > > > > diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
> > > > > index ecce7ce116cb..9a3c996c1d61 100644
> > > > > --- a/fs/proc/task_mmu.c
> > > > > +++ b/fs/proc/task_mmu.c
> > > > > @@ -236,9 +236,6 @@ static struct vm_area_struct *proc_get_vma(st=
ruct seq_file *m, loff_t *ppos)
> > > > >              * found the extended vma with the same vm_start.
> > > > >              */
> > > > >             *ppos =3D vma->vm_end;
> > > > > -   } else {
> > > > > -           *ppos =3D SENTINEL_VMA_GATE;
> > > > > -           vma =3D get_gate_vma(priv->lock_ctx.mm);
> > > >
> > > > Yeah this is just so confusing as-was.
> > > >
> > > > >     }
> > > > >
> > > > >     return vma;
> > > > > @@ -248,6 +245,7 @@ static void *m_start(struct seq_file *m, loff=
_t *ppos)
> > > > >  {
> > > > >     struct proc_maps_private *priv =3D m->private;
> > > > >     struct proc_maps_locking_ctx *lock_ctx;
> > > > > +   struct vm_area_struct *vma;
> > > > >     loff_t last_addr =3D *ppos;
> > > > >     struct mm_struct *mm;
> > > > >
> > > > > @@ -280,16 +278,31 @@ static void *m_start(struct seq_file *m, lo=
ff_t *ppos)
> > > > >     if (last_addr =3D=3D SENTINEL_VMA_GATE)
> > > > >             return get_gate_vma(mm);
> > > > >
> > > > > -   return proc_get_vma(m, ppos);
> > > > > +   vma =3D proc_get_vma(m, ppos);
> > > > > +   if (vma)
> > > > > +           return vma;
> > > > > +
> > > > > +   /* Return gate VMA at the end */
> > > > > +   *ppos =3D SENTINEL_VMA_GATE;
> > > > > +   return get_gate_vma(mm);
> > > > >  }
> > > > >
> > > > >  static void *m_next(struct seq_file *m, void *v, loff_t *ppos)
> > > > >  {
> > > > > +   struct proc_maps_private *priv =3D m->private;
> > > > > +   struct vm_area_struct *vma;
> > > > > +
> > > > >     if (*ppos =3D=3D SENTINEL_VMA_GATE) {
> > > > >             *ppos =3D SENTINEL_VMA_END;
> > > > >             return NULL;
> > > > >     }
> > > > > -   return proc_get_vma(m, ppos);
> > > > > +   vma =3D proc_get_vma(m, ppos);
> > > > > +   if (vma)
> > > > > +           return vma;
> > > >
> > > > OK so I guess the logic is, iterate through every VMA, then once yo=
u run out,
> > > > report the gate VMA. Makes sense.
> > >
> > > Hmm one thing on this though - m_start() still has:
> > >
> > >         if (last_addr =3D=3D SENTINEL_VMA_GATE)
> > >                 return get_gate_vma(mm);
> > >
> > > As well as:
> > >
> > >         vma =3D proc_get_vma(m, ppos);
> > >         if (vma)
> > >                 return vma;
> > >
> > >         /* Return gate VMA at the end */
> > >         *ppos =3D SENTINEL_VMA_GATE;
> > >         return get_gate_vma(mm);
> > >
> > > Now at the end.
> > >
> > > Is this correct? Is it maybe duplicated now?
> >
> > Yeah, I noticed that too but I it's not duplication. The first check
> > handles the case when right after m_next() hit the end of the address
> > space and set *ppos =3D SENTINEL_VMA_GATE, we ran out of page space and
> > had to flush its content. Once that's done, m_start will be called and
> > last_addr will be set to SENTINEL_VMA_GATE. In that case we should
> > return get_gate_vma() and avoid calling proc_get_vma(). That's what
> > the first check for sentinel is doing. The second one handles the case
> > when m_start() itself readches the end of the address space and has to
> > return SENTINEL_VMA_GATE.
> >
> > It's possible this can be refactored a bit and made cleaner but I
> > would keep that as a separate change.
>
> Maybe just add a comment to the first one to explain when it'll trigger? =
That
> should suffice, cleanups can be separate yes.

Will do. Appreciate the reviews!

I'll post the update today because there is some urgency to backport
these patches and I want to have a public link when backporting but I
don't expect anyone to burn the midnight oil to review the final
version. Have a nice weekend!

>
> >
> > >
> > > >
> > > > > +
> > > > > +   /* Return gate VMA at the end */
> > > > > +   *ppos =3D SENTINEL_VMA_GATE;
> > > > > +   return get_gate_vma(priv->lock_ctx.mm);
> > > > >  }
> > > > >
> > > > >  static void m_stop(struct seq_file *m, void *v)
> > > > > --
> > > > > 2.55.0.1007.g17ff1f9808-goog
> > > > >
> > > >
> > > > --
> > > > Cheers, Lorenzo
> > >
> > > --
> > > Cheers, Lorenzo
>
> --
> Cheers, Lorenzo
