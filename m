Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FE094A689C
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 18:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789151978; cv=pass; b=odseAN6vdjBSJG19zU04xNXUjfVfRthkxb4F7ypAvDonmsKX4a/VdtWn6xcMxa1tro9CDnvLejlWrE60LntovuafINSbsO8zu4t/zYTCyYAcl86VeKiFhR8qkMQzrFk9UaKQ+P4ZB+rNvqfU8IIvHAbJPWke2O8TLon/3x08kpU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789151978; c=relaxed/simple;
	bh=Cgpj1qWJ1RnZOPKgwwJvVKoF5HHhj0MpXS92ObJQAuM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ooDzoRfOvc5chUCxnViy1b8NtzGx+R0o1uCc3Tb6/DEcj3uoNt82fJu/Io+DfF6obDSk/lUxLFSD4p6jJRUtJPLUYmRvK3tcesMTEcqCjhyjmGLNRzSXfpRq+F6yGYJxvCgj08TAw+4rGzn+LkNwOrnM6UjykNbHg2qkt1Ytgfw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RH9f90Fe; arc=pass smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RH9f90Fe"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-53012819c04so94531cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 11:39:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789151976; cv=none;
        d=google.com; s=arc-20260327;
        b=LyCQ0zzzax4Fywo/4FcvktnOo/YWdryTAfl1G30weZhHK+dEop9qEKfe1XqiYl0FKc
         RupI5t9/nQLyM74dHA2U/59qTH2ex4kGyCNqrwPEUPG+gemAlr8yypYE0gP/lgvfS7Vr
         zzfS13YO/gcu3khFdqNQCecGckhCkjKIGpk3LUJHeNA/8kseJvxzLU1lblwUEtpxbGQF
         MD5iLKrUXHDcu/9E2djeqRaZDF5JQK2azwdaJok0odddnjq7a68w9xzeGQVod8cMRY9i
         H005lTqVgQOeWInbi7sOyGhN71Q/qEWipRRnyJ7nQQcrC6/UjEAxNAS10bQnNHNgb2s/
         nvMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+QDkAqDNHYHbzMD4UzAszEsitYxSsOiRVLmvmyXUE/I=;
        fh=ANGj+LpR0lMy398ZvvaDlFz2cs5ahqbWVZKkHxDqhXU=;
        b=Wpm6vD6qvN8r2KDXpq2MQLOSqgnC62l8BCL5YHDEb8Y4c3312VcJvRQ6JmbTzAhX3p
         5GaCfL1M+8xaI3HDOSEJzvrVRfXOQQLRXHposiTGmpH0lNCIMs/TxKVQuDbMw6zmmbtS
         WmPnJFBtPZjBKLmrNTAwpoXhhOS3u9b3Oy6wZqNSubiPl9RbP4eIwOYiQiCsZL5ARUvj
         SSbWeshvNBxQN/wWRxluZB6Y2YlB0kUobUS6MCPdgLWC7nRRooP2r6GXTiBMYZJuJ6xG
         YSo9a+elBN75+ymp6+MG8CKiZ7hB/ks+hMu5nnn/8DYdZMctoxJNhBjcCSMzS9yVKm06
         E5sQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789151976; x=1789756776; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+QDkAqDNHYHbzMD4UzAszEsitYxSsOiRVLmvmyXUE/I=;
        b=RH9f90Fef3CONyBuvWikZHY+uezsYtiDKZKiI7vf1JpM+qIDnrifCrn18OWrgWx4BS
         sOBmMyvwchLpF9M/2+SyBNA/wCj3wbCiF2im7I8320iDgZlYPdLDjAgmMF4e2/19J6vY
         AVW0OVdAt5FDKL7LwRbR4hIlx6qRe7jRfIY/NUMs5CpC9tbr2yFoyFxcqpr+SXctiTkI
         Nom1yvlauWTfD3m9wq+VnLEhbTTJS+uH4SxfnIPeTbeDcYnUxe5el9afXUKnIq1uGsNa
         AmUeoNvBFt0yVvls1SerW4YVuIF4PWjZgM2I3jfb/0qO/08oPw+Le+MorCyS21v/bAeN
         ENkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789151976; x=1789756776;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+QDkAqDNHYHbzMD4UzAszEsitYxSsOiRVLmvmyXUE/I=;
        b=jGlgaiRyUVFdKKay7ThT1gjgOdy0sycEYFK0G0Q/ahS6NqqawjNnrwx2+vb0ezSdpp
         PC48nQ9xQi878Zj1cggSs0DtdaFpYfce6zRiSKH2E+lv2qzVBJ3tkqKQSyFPW9eEL1kK
         dufv1e8c62ZwL6Dxxqncgr2fNeTfX+UAD61PNnrUh2B3eTqUdp+UY+J7qlqoacANFQwI
         IjniudGpXdrKTXBz4Bg9XToC/1RTWQ0Z3h82pHyEcmox2sVGx3CtEjjQZ3Qv6AZhr3zP
         RUDV8JQFnKqn1k9Dfx10jwr1aCzxfJJ+mdF1y9KKhFfeCO0xgAwDF5N4e1a/BohGfNIr
         yYig==
X-Forwarded-Encrypted: i=1; AKwUvBzUxK+VMhm4HkTIVQfXuvzwg5OpjIFaVTCQDe07PgAkSFstRshyuzuMXioSq5WdnpQY54JVgEXDbF/buCM=@vger.kernel.org
X-Gm-Message-State: AFuF++ljr0PR6R9MvrFbzH8bqoOtOfUG0Q8SY7yuis4ZbVjsy0MrgItf
	oM0Uaw58YGVVdyLWhhdFv7D19ycuFxo4WwmoGIQ6RbGEx7UWhKKBg3bXajrB3i7pe5TFmDTJ8sW
	CAsbw2D+qIl80OTsom9fU38gX5KRkREr0+7XnPGrx
X-Gm-Gg: AYBFou0HcKTSGfo0G85i4VrY/VEuxPTVWbcfQr6aIjGB1xnWqnxEyN1r4YSl8adaXQa
	unaB2J4oA1m+FicMwBP4TezeNNBW1kxLjVr+r0IP/mHnQ3Le2Kd/yanC52hv2vkGSjZGXFTZ171
	krs5uvwSQwra7q9cniycX4VDI1gQCD7slSS0dxmWQt5UnZlg7PHCFE8f2hLACuJAaiOUXiyyGQG
	cdgEy+OA6IQwmEiRiN4QXfJMoAOFOvfqoS1GZZsWi3Bua9WZqG7ZFpbzsiyNv1jO+pUJgH7zPpY
	WdHsNbYK7uYfchj7IieRZVTNvlXJqokC+9y+RQjycOk+TV0wBse5/MmoR1bxhsQlq3dW19YIIXu
	DtyMKrzxitg==
X-Received: by 2002:a05:622a:5218:b0:530:ac23:ff40 with SMTP id
 d75a77b69052e-530e493076bmr1282331cf.5.1789151974931; Fri, 11 Sep 2026
 11:39:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260910234737.1340642-1-surenb@google.com> <20260910234737.1340642-6-surenb@google.com>
 <aqRF4YB7Ijk9PmRM@gremlin>
In-Reply-To: <aqRF4YB7Ijk9PmRM@gremlin>
From: Suren Baghdasaryan <surenb@google.com>
Date: Fri, 11 Sep 2026 11:39:23 -0700
X-Gm-Features: AcwNN1W4dOfkLKGREm-MUH-pM0CR6V-0wgsS0pYyFtiALBPWuaW4-GsVKkWozvE
Message-ID: <CAJuCfpEScgOTK7ymtDrqa52GY-ooeP2boowF=CLpin7hR11iRA@mail.gmail.com>
Subject: Re: [PATCH v3 5/7] proc/task_mmu: change proc_get_vma() to stop
 returning gate VMA at the end
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: akpm@linux-foundation.org, liam@infradead.org, vbabka@kernel.org, 
	david@redhat.com, willy@infradead.org, jannh@google.com, paulmck@kernel.org, 
	pfalcato@suse.de, xueyuan.chen21@gmail.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 11, 2026 at 11:26=E2=80=AFAM Lorenzo Stoakes (ARM) <ljs@kernel.=
org> wrote:
>
> On Thu, Sep 10, 2026 at 04:47:35PM -0700, Suren Baghdasaryan wrote:
> > proc_get_vma() returning gate VMA at the end is desirable for the its
> > current m_start/m_next callers, as they need to report a gate VMA at th=
e
> > end of the address space. This behavior is very specific to these calle=
rs
> > and makes proc_get_vma() hard to use for other purposes.
> >
> > Move this usage-specific behavior into the callers themselves so that
> > proc_get_vma() returns either a valid VMA, an error or a NULL when no
> > more VMAs are available. This makes it more generic, simpler and usable
> > in the later patches.
> >
> > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
>
> Yes, very good change, thanks!
>
> Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

Thanks!

>
> > ---
> >  fs/proc/task_mmu.c | 23 ++++++++++++++++++-----
> >  1 file changed, 18 insertions(+), 5 deletions(-)
> >
> > diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
> > index ecce7ce116cb..9a3c996c1d61 100644
> > --- a/fs/proc/task_mmu.c
> > +++ b/fs/proc/task_mmu.c
> > @@ -236,9 +236,6 @@ static struct vm_area_struct *proc_get_vma(struct s=
eq_file *m, loff_t *ppos)
> >                * found the extended vma with the same vm_start.
> >                */
> >               *ppos =3D vma->vm_end;
> > -     } else {
> > -             *ppos =3D SENTINEL_VMA_GATE;
> > -             vma =3D get_gate_vma(priv->lock_ctx.mm);
>
> Yeah this is just so confusing as-was.
>
> >       }
> >
> >       return vma;
> > @@ -248,6 +245,7 @@ static void *m_start(struct seq_file *m, loff_t *pp=
os)
> >  {
> >       struct proc_maps_private *priv =3D m->private;
> >       struct proc_maps_locking_ctx *lock_ctx;
> > +     struct vm_area_struct *vma;
> >       loff_t last_addr =3D *ppos;
> >       struct mm_struct *mm;
> >
> > @@ -280,16 +278,31 @@ static void *m_start(struct seq_file *m, loff_t *=
ppos)
> >       if (last_addr =3D=3D SENTINEL_VMA_GATE)
> >               return get_gate_vma(mm);
> >
> > -     return proc_get_vma(m, ppos);
> > +     vma =3D proc_get_vma(m, ppos);
> > +     if (vma)
> > +             return vma;
> > +
> > +     /* Return gate VMA at the end */
> > +     *ppos =3D SENTINEL_VMA_GATE;
> > +     return get_gate_vma(mm);
> >  }
> >
> >  static void *m_next(struct seq_file *m, void *v, loff_t *ppos)
> >  {
> > +     struct proc_maps_private *priv =3D m->private;
> > +     struct vm_area_struct *vma;
> > +
> >       if (*ppos =3D=3D SENTINEL_VMA_GATE) {
> >               *ppos =3D SENTINEL_VMA_END;
> >               return NULL;
> >       }
> > -     return proc_get_vma(m, ppos);
> > +     vma =3D proc_get_vma(m, ppos);
> > +     if (vma)
> > +             return vma;
>
> OK so I guess the logic is, iterate through every VMA, then once you run =
out,
> report the gate VMA. Makes sense.

Yes, correct.

>
> > +
> > +     /* Return gate VMA at the end */
> > +     *ppos =3D SENTINEL_VMA_GATE;
> > +     return get_gate_vma(priv->lock_ctx.mm);
> >  }
> >
> >  static void m_stop(struct seq_file *m, void *v)
> > --
> > 2.55.0.1007.g17ff1f9808-goog
> >
>
> --
> Cheers, Lorenzo
