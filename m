Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16554563296
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 19:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789155870; cv=pass; b=RgdbHN7wsfQpO4KT6PZWDa62zmuWtv8dnRFUJ+On5cpkoNaAm8wzZ4S/86ktgjZb68hnbJWSrPZiyMQzu6biWG73QQxH8C5pFhENB8aeIkfPTrUjBNS8XpKW7e1Xij2RFUCXAX2Oph2JszLH6mkSTrvRteQYZR2w+dB7MTrU8Q0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789155870; c=relaxed/simple;
	bh=yL8N+Dja9aiOO1BJi3EdMBCJn64BdAU1/IDpItLrdro=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b8rANpabHT7sPRciUqr0yE2B3F51XXO96PWVcKG5G6S5/FWnQFx0jO5Uk4DbPHBAXbBuKbwhmuSoaH0FoQqC+fixavmAFZK8eoxfFzxe/uhzZM5LKnUBIsQNGFqTntNf3RnNsaYxkpkgg8Z+cSJ4j68obvBApW/hkTa7EwXaMTQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YwNPWbBl; arc=pass smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YwNPWbBl"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-5306706e89dso111441cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 12:44:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789155861; cv=none;
        d=google.com; s=arc-20260327;
        b=QIhbeE3Qn+soLREqzftgtE172rSFSwadL1BizuyNy9m6aDzMTsIdYt1hUj+pxaArL9
         7TRR4NGg0WVu1vIQRvlhEeMd6FpJMcngByE41SyaIM59ojVfjEbR8IKUvmJR+90RRRW7
         ZxUAyhw+2BjLaDp0oBsbpcuW1ZLsBRC0X/qkGtKvyuu7j2ADViYb8Ri3pY1rUFxGah/i
         1bwjmwHidKj0MNzJOaKA55KcN98A03JnjLF5BdKHagFpUuK/eItVtb/4D/mC49WfHO1B
         AADdxTGt/LY3MHBeuQo2DnqeFIAu/xeVwmmyFeudUbWSSp8yUJsNTU9EzY2Skdeh6j1P
         rqDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kN0XHRUDweJ1/OhG2mXDTF4VMn4i+usHL3piKE2cuME=;
        fh=oETQjkuj9hSdstJ+TDmOPT+1Xj7G1N2612rXb+E/Cw0=;
        b=PvWFEGJsA/7vdVd2MlgJP7BFDQS4859yxniTPRX/J9KjKtZUXVA2miIqJlGjV8QVPr
         LCf85DL4gSfbLsDV07MjAP5SgqH8iuOUtkTO2k9lLSdZvochg4zH4PW8B7juuQQEEa7O
         Y3JYoMxcU+vEmebxSgwDvBhY0zd1t7s7myrZgHOIjofhypoxdUq8MzJhmxQ+iqLtVJka
         YOxmcYAUP4pfWfEPtP6NzwIMFfskm6crc7Y89zgY3mh9RatyUZ9yA7mpeeTdKwEUTHBH
         wLWkco7uqhG7u5h4udl1ofzNipEPcJumfy5rb2Mu522+WXaLP+wYeg+o23UPLLN2DkR7
         FJ3g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789155861; x=1789760661; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kN0XHRUDweJ1/OhG2mXDTF4VMn4i+usHL3piKE2cuME=;
        b=YwNPWbBlo3WbsYRiQALbzI9V3PVWpG13Qxh2dKHp8WVmZJxq27E0Tx3eydNaA/tLsv
         65lHBmIkUPSNH3DLNLj98MuzX9AvXyhHG+h+t2ZEeHGQRjWUCS8HUKXps2yDlQupmBYd
         EFhQyhciHp85t2B3Iag7TnrLViHY+5/sIGs1jwXmt/ocR1LYa41G5LzhLslC6gO0W8T9
         pz0yiARgI02KHwABnQ9iQTzqeNE8O/OEHu7z+slAJy6zqBPa/P3VHIvGC9Gfn0Jz/buk
         qsK6UA5C/SShk8r60DPTryeF7HMKxgeOBbnZcWstPA0H6TpNzivS3cA2gkEmppvWtpS+
         I+tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789155861; x=1789760661;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kN0XHRUDweJ1/OhG2mXDTF4VMn4i+usHL3piKE2cuME=;
        b=EYmykwoEseswkLwaIXYcc4R8Ib9ra+WSIbof7Wmd2D9f1mchmS3dfxXmYaCUAg++0V
         Vpt2qsQ1wwAsXEi3/pTnodfdHNv+qF9TQDu1pgWNj4y7D8O1WZu66YX0ZC/UCXmLVSdg
         0YkmQrqQLOGd7f9RKDwFxOQnZVT6xcIzdDqZciBtAq0mREPQKD3qkRB0vg4UO2Z1b66W
         nEuAh/k/3qYwNzHPIDs8WYARmBN5ro5uUbh+bnss2bX1BGSW9Jn6T6ky7N5ry1ML8iPm
         DVhecHNQrGbu8l6F3wXly9VrpBGY3jL9aJ1tkO2ZfYboVo+JrpXegnBTYTjJFFbzIlvE
         BjYw==
X-Forwarded-Encrypted: i=1; AKwUvByMhXUlcO5LM8BB3GfupAM5dUDI7n/Z3+u63OpnwWprNgR0yTS2Y3vpB1u57gg8koRVe0C297srYRl+lqg=@vger.kernel.org
X-Gm-Message-State: AFuF++n+cOIkTGL/5Qco5y0xuv89MMm5SjQJRNozGmURbrwXQt9BeDQ/
	RbsKUjUh8+CApGAPAWcNPzSXl2rKDfeZov1sPCg+CvPGJO8DJeRns0QcJfpAEkPvdnB/kXdcmff
	w6u4fv+EKdt/L/Gng+mcU6fmscIuWryMBsRWG1gxm
X-Gm-Gg: AYBFou2QPuKb9HzyLZmmTZ3Bl9sj82+vmftdCLJ7q6hI/MhzbTH1hQo5Q3/8ZUdAHSw
	K9Oc+q1PB+AaEcsl91w1nguOFI1dB6oy98/uLItsuFszJtaX+AAi4V7HWxhWLHwxXf+voh4bAN/
	Sl3enHbifJUs9iLFeL8DlppKRihzfGEUNbKQyM80eiOwE9yr/emvY3nq3aUllJKvshOiX3l5F2H
	k/2KLtNwlitV/K6MZCXGLl+aY5X36wEf4bpXu5jnvHpH+D2B/RVa25BsP4KV4AngFJzjSPdn2/M
	n8ZksI9Ylpc755FHcF9QeVZrgIfydfiU6ddWXEXm6zjDCEwGtqhprxBLwZIIzaGpwssZrmS1Vje
	Ohe8Y9YDlFRg=
X-Received: by 2002:a05:622a:cc:b0:52f:9ed4:8d74 with SMTP id
 d75a77b69052e-530e475171amr2444781cf.14.1789155855913; Fri, 11 Sep 2026
 12:44:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260910234737.1340642-1-surenb@google.com> <20260910234737.1340642-6-surenb@google.com>
 <aqRF4YB7Ijk9PmRM@gremlin> <aqRPeZH4yeYXfWgS@gremlin> <CAJuCfpG-8sQjg2ECiRQpjn9tBj3AfEXnmgmomdfFGS7JoDhZ4w@mail.gmail.com>
 <aqRSvISJtYrt5Gvp@gremlin> <CAJuCfpGvB4o1HrKsi4zbzKNmdxppW_76xJUbaYeE+sN6w-u6UA@mail.gmail.com>
 <aqRVzecC23YpZeh0@gremlin>
In-Reply-To: <aqRVzecC23YpZeh0@gremlin>
From: Suren Baghdasaryan <surenb@google.com>
Date: Fri, 11 Sep 2026 12:44:04 -0700
X-Gm-Features: AcwNN1WZAK4AhrgJSaOV-mvzjDcNBoqfmvSShEkPZAg297uHKBFoNS2-TUHAzeE
Message-ID: <CAJuCfpGOR5X6R2NwASMFwp=UtWCCDn64OJNEmzbMh9DDmn2d4Q@mail.gmail.com>
Subject: Re: [PATCH v3 5/7] proc/task_mmu: change proc_get_vma() to stop
 returning gate VMA at the end
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: akpm@linux-foundation.org, liam@infradead.org, vbabka@kernel.org, 
	david@redhat.com, willy@infradead.org, jannh@google.com, paulmck@kernel.org, 
	pfalcato@suse.de, xueyuan.chen21@gmail.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 11, 2026 at 12:26=E2=80=AFPM Lorenzo Stoakes (ARM) <ljs@kernel.=
org> wrote:
>
> On Fri, Sep 11, 2026 at 12:18:41PM -0700, Suren Baghdasaryan wrote:
> > On Fri, Sep 11, 2026 at 12:13=E2=80=AFPM Lorenzo Stoakes (ARM) <ljs@ker=
nel.org> wrote:
> > >
> > > On Fri, Sep 11, 2026 at 12:11:55PM -0700, Suren Baghdasaryan wrote:
> > > > On Fri, Sep 11, 2026 at 12:03=E2=80=AFPM Lorenzo Stoakes (ARM) <ljs=
@kernel.org> wrote:
> > > > >
> > > > > On Fri, Sep 11, 2026 at 07:26:49PM +0100, Lorenzo Stoakes (ARM) w=
rote:
> > > > > > On Thu, Sep 10, 2026 at 04:47:35PM -0700, Suren Baghdasaryan wr=
ote:
> > > > > > > proc_get_vma() returning gate VMA at the end is desirable for=
 the its
> > > > > > > current m_start/m_next callers, as they need to report a gate=
 VMA at the
> > > > > > > end of the address space. This behavior is very specific to t=
hese callers
> > > > > > > and makes proc_get_vma() hard to use for other purposes.
> > > > > > >
> > > > > > > Move this usage-specific behavior into the callers themselves=
 so that
> > > > > > > proc_get_vma() returns either a valid VMA, an error or a NULL=
 when no
> > > > > > > more VMAs are available. This makes it more generic, simpler =
and usable
> > > > > > > in the later patches.
> > > > > > >
> > > > > > > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> > > > > >
> > > > > > Yes, very good change, thanks!
> > > > > >
> > > > > > Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> > > > > >
> > > > > > > ---
> > > > > > >  fs/proc/task_mmu.c | 23 ++++++++++++++++++-----
> > > > > > >  1 file changed, 18 insertions(+), 5 deletions(-)
> > > > > > >
> > > > > > > diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
> > > > > > > index ecce7ce116cb..9a3c996c1d61 100644
> > > > > > > --- a/fs/proc/task_mmu.c
> > > > > > > +++ b/fs/proc/task_mmu.c
> > > > > > > @@ -236,9 +236,6 @@ static struct vm_area_struct *proc_get_vm=
a(struct seq_file *m, loff_t *ppos)
> > > > > > >              * found the extended vma with the same vm_start.
> > > > > > >              */
> > > > > > >             *ppos =3D vma->vm_end;
> > > > > > > -   } else {
> > > > > > > -           *ppos =3D SENTINEL_VMA_GATE;
> > > > > > > -           vma =3D get_gate_vma(priv->lock_ctx.mm);
> > > > > >
> > > > > > Yeah this is just so confusing as-was.
> > > > > >
> > > > > > >     }
> > > > > > >
> > > > > > >     return vma;
> > > > > > > @@ -248,6 +245,7 @@ static void *m_start(struct seq_file *m, =
loff_t *ppos)
> > > > > > >  {
> > > > > > >     struct proc_maps_private *priv =3D m->private;
> > > > > > >     struct proc_maps_locking_ctx *lock_ctx;
> > > > > > > +   struct vm_area_struct *vma;
> > > > > > >     loff_t last_addr =3D *ppos;
> > > > > > >     struct mm_struct *mm;
> > > > > > >
> > > > > > > @@ -280,16 +278,31 @@ static void *m_start(struct seq_file *m=
, loff_t *ppos)
> > > > > > >     if (last_addr =3D=3D SENTINEL_VMA_GATE)
> > > > > > >             return get_gate_vma(mm);
> > > > > > >
> > > > > > > -   return proc_get_vma(m, ppos);
> > > > > > > +   vma =3D proc_get_vma(m, ppos);
> > > > > > > +   if (vma)
> > > > > > > +           return vma;
> > > > > > > +
> > > > > > > +   /* Return gate VMA at the end */
> > > > > > > +   *ppos =3D SENTINEL_VMA_GATE;
> > > > > > > +   return get_gate_vma(mm);
> > > > > > >  }
> > > > > > >
> > > > > > >  static void *m_next(struct seq_file *m, void *v, loff_t *ppo=
s)
> > > > > > >  {
> > > > > > > +   struct proc_maps_private *priv =3D m->private;
> > > > > > > +   struct vm_area_struct *vma;
> > > > > > > +
> > > > > > >     if (*ppos =3D=3D SENTINEL_VMA_GATE) {
> > > > > > >             *ppos =3D SENTINEL_VMA_END;
> > > > > > >             return NULL;
> > > > > > >     }
> > > > > > > -   return proc_get_vma(m, ppos);
> > > > > > > +   vma =3D proc_get_vma(m, ppos);
> > > > > > > +   if (vma)
> > > > > > > +           return vma;
> > > > > >
> > > > > > OK so I guess the logic is, iterate through every VMA, then onc=
e you run out,
> > > > > > report the gate VMA. Makes sense.
> > > > >
> > > > > Hmm one thing on this though - m_start() still has:
> > > > >
> > > > >         if (last_addr =3D=3D SENTINEL_VMA_GATE)
> > > > >                 return get_gate_vma(mm);
> > > > >
> > > > > As well as:
> > > > >
> > > > >         vma =3D proc_get_vma(m, ppos);
> > > > >         if (vma)
> > > > >                 return vma;
> > > > >
> > > > >         /* Return gate VMA at the end */
> > > > >         *ppos =3D SENTINEL_VMA_GATE;
> > > > >         return get_gate_vma(mm);
> > > > >
> > > > > Now at the end.
> > > > >
> > > > > Is this correct? Is it maybe duplicated now?
> > > >
> > > > Yeah, I noticed that too but I it's not duplication. The first chec=
k
> > > > handles the case when right after m_next() hit the end of the addre=
ss
> > > > space and set *ppos =3D SENTINEL_VMA_GATE, we ran out of page space=
 and
> > > > had to flush its content. Once that's done, m_start will be called =
and
> > > > last_addr will be set to SENTINEL_VMA_GATE. In that case we should
> > > > return get_gate_vma() and avoid calling proc_get_vma(). That's what
> > > > the first check for sentinel is doing. The second one handles the c=
ase
> > > > when m_start() itself readches the end of the address space and has=
 to
> > > > return SENTINEL_VMA_GATE.
> > > >
> > > > It's possible this can be refactored a bit and made cleaner but I
> > > > would keep that as a separate change.
> > >
> > > Maybe just add a comment to the first one to explain when it'll trigg=
er? That
> > > should suffice, cleanups can be separate yes.
> >
> > Will do. Appreciate the reviews!
> >
> > I'll post the update today because there is some urgency to backport
> > these patches and I want to have a public link when backporting but I
> > don't expect anyone to burn the midnight oil to review the final
> > version. Have a nice weekend!
>
> Well you have tags on most things from me now so it'll only be one patch =
I
> think? That'll be missing mine anyway.

Yep, thanks!

Posted v4 at https://lore.kernel.org/all/20260911194145.1781926-1-surenb@go=
ogle.com/
and the only patch missing your stamp is
https://lore.kernel.org/all/20260911194145.1781926-4-surenb@google.com/

>
> >
> > >
> > > >
> > > > >
> > > > > >
> > > > > > > +
> > > > > > > +   /* Return gate VMA at the end */
> > > > > > > +   *ppos =3D SENTINEL_VMA_GATE;
> > > > > > > +   return get_gate_vma(priv->lock_ctx.mm);
> > > > > > >  }
> > > > > > >
> > > > > > >  static void m_stop(struct seq_file *m, void *v)
> > > > > > > --
> > > > > > > 2.55.0.1007.g17ff1f9808-goog
> > > > > > >
> > > > > >
> > > > > > --
> > > > > > Cheers, Lorenzo
> > > > >
> > > > > --
> > > > > Cheers, Lorenzo
> > >
> > > --
> > > Cheers, Lorenzo
>
> --
> Cheers, Lorenzo
