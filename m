Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D8F6438493
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 19:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789153943; cv=pass; b=hZgxNaeQV3xTWlfqfxMDVlLdG03e2Goh0zCNIgl9vj7mwL5meOwlqBBzcTcZ0RXKI+POeQaUDr3Z7gUOgP3NEB5Lo+JkfElAkexk1HeXJ5Y+K6ZxveT6DrSrCDNkJEEs6xGQF2xfPNlVjh428oBgutaW/n/OXnXafT4KDL4McVg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789153943; c=relaxed/simple;
	bh=cc4a1xNspTXolJI0WCSfnRxb8CzbRjDQYh/QAFhczu4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o4mfUBeU5XaWFU2tiu3V5GzePH2iO7qwx0Tm+zBX6doZWOyFcLhlZ5gtO1Z6UG7xOPqQoL1ara5SYYJ/zZRrpIVpxPHN93zibtNujEAEU8QjM8oL2HoR2j7FqYRaFbuwkEFBfftkjA28reva/ulmIEy2YgYKpiy2HPK41o+EAzg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nC3eAX3v; arc=pass smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nC3eAX3v"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-53012819c04so103911cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 12:12:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789153928; cv=none;
        d=google.com; s=arc-20260327;
        b=aZjnZmK7qw80r4+4xIZalFd+FlkmT/8NAKO0FB9ekpEkh5P/sDqsNUj7p4ZmJBszZl
         IUUMpEkqqtVijZXFctkjSy7YVJgyZoxdnKb+mv1tGSBhLVdhVs0hxm3pvcolsPdLF3Ce
         MmRJz879uwOvhtjSnCSNEnEpX+T1Aa5um1AjQFRLmLF2wgItEjekabeYIhm/e58f08AP
         JRaDGzYym+n8Z1DBwI4yQcLhecxzfl9spetHOMcaFttZWUK7xe+G5ZwDzeXMEQAGbGp1
         ugXyoDubqkehJFnFb+Zr5Xcbus8X6kAjL8cNxhHBBNroTJ3lqY8OUxsnHGlDkd5ap7Dr
         j2hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=saJSQNQB4V5HEb80TKj8yYWIyI7Lc38n7nBGhE1SZ5s=;
        fh=ksq37aXlB/rIsJUGqxNFzYqdC1X1cu+0cJ8ByUdDyS0=;
        b=evrWnLWSteTK+IJ6S9cVHplSwkmtAjk8mnif0Eng869p4UhymIn+RygR2a0tWwaa5i
         ykLO9gRT9vD+bU+D9jL3oI5BkBTiD1p1mAoy8s4FHgAJ/EgCU51kOcum1L3ljCE/uKrd
         jukN5jzgbEf7QjAIbGyEyL98UZ20rq4bUWm44P4AM0B8EK2NteFc49Bx4kYS/gjBFGkS
         IWt17U8SV0fF5YHGAmUyo8MRDzwKbiz5GY2txdgm1VyTinSPNDAZDg9QN6Ez3KBDfgdD
         LJtqTFrIvErwfHLHNwSrv5JM8sgpP6A6pX9nofPZxihpKZ/3uq0STApHQV3RdpGlgK/d
         jbbg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789153928; x=1789758728; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=saJSQNQB4V5HEb80TKj8yYWIyI7Lc38n7nBGhE1SZ5s=;
        b=nC3eAX3vi7jYS79Vmf5jwl0NlwRV8sFLiXZr8ZcODSszFi+1QxgD3X+1z/e05ixClZ
         1kl5fMOP/iWUXPR7/EsHp1aSnrDDqK2s2F7Mw7O57mcogkp9wC2idd97V7rweCSZSKDT
         r947gAIw7UscgU/8IVaszrxTMKMAzeFqKKAhHhBm3KZAkHjtfzmBtxLQiN/My0VLg2Pm
         mMEH+vDE1Qzlrc9Ss+dI+ksrpegXnl3YJ2nDTa6y6DHMukiQA4cKWWvEYalXX44iJduV
         hc2HLpvxW/PjTVSOnjDNKydVnwLcpEEZAKEUVSSTDqQqgIONCWaBYoxIpqehIgTxsM5j
         RkTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789153928; x=1789758728;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=saJSQNQB4V5HEb80TKj8yYWIyI7Lc38n7nBGhE1SZ5s=;
        b=R3EO6dmXEBy4MMJW7mg3daWN+Ykxr5ivNUkxGQfybTzrNd/6D3U+7V/YmOaEQG5BOd
         L5ponot2os7e/HwdMxcxi6/pT/5LOdoxZGggpqg1reA0gSPlRJ1GUvc2qL9jziY5bL+G
         EsFd3a2GL124D9Ica3yEOEVLn2gQ8g0JmgPBBuLhr/fNLY//TtH3YNNhiF17Mv0NnsDc
         LBUcHRd+bKJ/RmLVIjhRii9rp47i7M4uAoWo6f9ZcnEl47/qApnxrYsjq0xxzNbZJ4eh
         j0qd3uTD9a8GgYyP8dAeNob0yw9o+irBLlJ1oBFApNYnk8C9BBCR5C1XUdJl7KK2QeaB
         xXuw==
X-Forwarded-Encrypted: i=1; AKwUvBzIwq8wFPkQBPQlW+o7iSh6DBdtDh7i0vi7QMAbIlS8bDLHRCM3+sSD2kH5rAAVtUM97itDCdnDlyJ6C9g=@vger.kernel.org
X-Gm-Message-State: AFuF++lu4J+tx05H1rnK577vx72c1Xsi0nQ1UImzokwZBs4FAAlorP6H
	0E54bQMuJKEsh/+FxChJuR58/gwJ4C/9msg3Atwsqd1XqHsrG5OowjHe0HJNGalOnq8q+DBHJjA
	64PjNNqCEwDaSFGfFAOzWoGRSlZw+6mfCeJd7MNJU
X-Gm-Gg: AYBFou0WVdYZRhtaGnerv7eWdMcIrhzISIywcDnO2pzp9UbDKjTuebLeYRQ9izJBXxq
	JpySpA9ffj3H4qgeFVRC87xP7FYLG4+BfbA3gjBRu1KOM7+oX9331QE0e42xTGr63gy7lSpss8A
	zPhUHML8P/u0AyS4eOodUY4E3Th9Pk9iyadzRdZDSALokM8sRIum+xgyuArLADglCY69ZbOUkNH
	3MMqm20fZUXHomfxR9QOZElPpjKz08ymTMDsNNu4nvMzJn+I80uLHFusM9xRIZ3PZc2wHw2gl6O
	k2yz4G5XuYX13D3fcPqz3WWVdH4DOPJqusp2LjzlMrKvJ5H+/a8SVDx3CeyhpSwete116Znwxl+
	4gxGQAL5bMQ==
X-Received: by 2002:a05:622a:4d94:b0:51b:ff0a:2048 with SMTP id
 d75a77b69052e-530e492ef32mr2365241cf.3.1789153927778; Fri, 11 Sep 2026
 12:12:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260910234737.1340642-1-surenb@google.com> <20260910234737.1340642-6-surenb@google.com>
 <aqRF4YB7Ijk9PmRM@gremlin> <aqRPeZH4yeYXfWgS@gremlin>
In-Reply-To: <aqRPeZH4yeYXfWgS@gremlin>
From: Suren Baghdasaryan <surenb@google.com>
Date: Fri, 11 Sep 2026 12:11:55 -0700
X-Gm-Features: AcwNN1Wy-CE4ovXulpkIU8FXd9kbfWYedpTSzKiPANojbqSxgWkXPeoHYX3MZto
Message-ID: <CAJuCfpG-8sQjg2ECiRQpjn9tBj3AfEXnmgmomdfFGS7JoDhZ4w@mail.gmail.com>
Subject: Re: [PATCH v3 5/7] proc/task_mmu: change proc_get_vma() to stop
 returning gate VMA at the end
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: akpm@linux-foundation.org, liam@infradead.org, vbabka@kernel.org, 
	david@redhat.com, willy@infradead.org, jannh@google.com, paulmck@kernel.org, 
	pfalcato@suse.de, xueyuan.chen21@gmail.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 11, 2026 at 12:03=E2=80=AFPM Lorenzo Stoakes (ARM) <ljs@kernel.=
org> wrote:
>
> On Fri, Sep 11, 2026 at 07:26:49PM +0100, Lorenzo Stoakes (ARM) wrote:
> > On Thu, Sep 10, 2026 at 04:47:35PM -0700, Suren Baghdasaryan wrote:
> > > proc_get_vma() returning gate VMA at the end is desirable for the its
> > > current m_start/m_next callers, as they need to report a gate VMA at =
the
> > > end of the address space. This behavior is very specific to these cal=
lers
> > > and makes proc_get_vma() hard to use for other purposes.
> > >
> > > Move this usage-specific behavior into the callers themselves so that
> > > proc_get_vma() returns either a valid VMA, an error or a NULL when no
> > > more VMAs are available. This makes it more generic, simpler and usab=
le
> > > in the later patches.
> > >
> > > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> >
> > Yes, very good change, thanks!
> >
> > Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> >
> > > ---
> > >  fs/proc/task_mmu.c | 23 ++++++++++++++++++-----
> > >  1 file changed, 18 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
> > > index ecce7ce116cb..9a3c996c1d61 100644
> > > --- a/fs/proc/task_mmu.c
> > > +++ b/fs/proc/task_mmu.c
> > > @@ -236,9 +236,6 @@ static struct vm_area_struct *proc_get_vma(struct=
 seq_file *m, loff_t *ppos)
> > >              * found the extended vma with the same vm_start.
> > >              */
> > >             *ppos =3D vma->vm_end;
> > > -   } else {
> > > -           *ppos =3D SENTINEL_VMA_GATE;
> > > -           vma =3D get_gate_vma(priv->lock_ctx.mm);
> >
> > Yeah this is just so confusing as-was.
> >
> > >     }
> > >
> > >     return vma;
> > > @@ -248,6 +245,7 @@ static void *m_start(struct seq_file *m, loff_t *=
ppos)
> > >  {
> > >     struct proc_maps_private *priv =3D m->private;
> > >     struct proc_maps_locking_ctx *lock_ctx;
> > > +   struct vm_area_struct *vma;
> > >     loff_t last_addr =3D *ppos;
> > >     struct mm_struct *mm;
> > >
> > > @@ -280,16 +278,31 @@ static void *m_start(struct seq_file *m, loff_t=
 *ppos)
> > >     if (last_addr =3D=3D SENTINEL_VMA_GATE)
> > >             return get_gate_vma(mm);
> > >
> > > -   return proc_get_vma(m, ppos);
> > > +   vma =3D proc_get_vma(m, ppos);
> > > +   if (vma)
> > > +           return vma;
> > > +
> > > +   /* Return gate VMA at the end */
> > > +   *ppos =3D SENTINEL_VMA_GATE;
> > > +   return get_gate_vma(mm);
> > >  }
> > >
> > >  static void *m_next(struct seq_file *m, void *v, loff_t *ppos)
> > >  {
> > > +   struct proc_maps_private *priv =3D m->private;
> > > +   struct vm_area_struct *vma;
> > > +
> > >     if (*ppos =3D=3D SENTINEL_VMA_GATE) {
> > >             *ppos =3D SENTINEL_VMA_END;
> > >             return NULL;
> > >     }
> > > -   return proc_get_vma(m, ppos);
> > > +   vma =3D proc_get_vma(m, ppos);
> > > +   if (vma)
> > > +           return vma;
> >
> > OK so I guess the logic is, iterate through every VMA, then once you ru=
n out,
> > report the gate VMA. Makes sense.
>
> Hmm one thing on this though - m_start() still has:
>
>         if (last_addr =3D=3D SENTINEL_VMA_GATE)
>                 return get_gate_vma(mm);
>
> As well as:
>
>         vma =3D proc_get_vma(m, ppos);
>         if (vma)
>                 return vma;
>
>         /* Return gate VMA at the end */
>         *ppos =3D SENTINEL_VMA_GATE;
>         return get_gate_vma(mm);
>
> Now at the end.
>
> Is this correct? Is it maybe duplicated now?

Yeah, I noticed that too but I it's not duplication. The first check
handles the case when right after m_next() hit the end of the address
space and set *ppos =3D SENTINEL_VMA_GATE, we ran out of page space and
had to flush its content. Once that's done, m_start will be called and
last_addr will be set to SENTINEL_VMA_GATE. In that case we should
return get_gate_vma() and avoid calling proc_get_vma(). That's what
the first check for sentinel is doing. The second one handles the case
when m_start() itself readches the end of the address space and has to
return SENTINEL_VMA_GATE.

It's possible this can be refactored a bit and made cleaner but I
would keep that as a separate change.

>
> >
> > > +
> > > +   /* Return gate VMA at the end */
> > > +   *ppos =3D SENTINEL_VMA_GATE;
> > > +   return get_gate_vma(priv->lock_ctx.mm);
> > >  }
> > >
> > >  static void m_stop(struct seq_file *m, void *v)
> > > --
> > > 2.55.0.1007.g17ff1f9808-goog
> > >
> >
> > --
> > Cheers, Lorenzo
>
> --
> Cheers, Lorenzo
