Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8C5F4A3D30
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 15:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789054561; cv=pass; b=rnPEJfrQmHU/AxFvDgyQOQCBqRs4OWdJLUn14hJFIX7gQS0qNLNiCISeBHL3lfGcd3zeeraApXZ/MNQuZlVLdSn+1PZNI3q4Bdba4hbazmaP6+KTyuNznlr6iDahKRmnUoVJxxxUjhhrw5k0NjqP04Q2blcugxxusmzOTWq+IbE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789054561; c=relaxed/simple;
	bh=DiitSGlyTtlYadnGv7GCYtAsiedBXeB9GoL/mUjtrTA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hwRCx4OHUPqXg2FNqgScooMgFBAEk7QdQYenwalwNOPCnlI9rxxLpTUa6rdLAhic8vg66idOGkt/brM56oUM/KCtgRxF+p7+rYUq0wF3RtkptM9xhcMJocixZ7BgWm5TNIDb5nOlwSC4ly6DrOPaICwkX2V15LthJcJRaCaEBH8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nlG7f3e/; arc=pass smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nlG7f3e/"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-5306706e89dso320371cf.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 08:35:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789054558; cv=none;
        d=google.com; s=arc-20260327;
        b=PFTr8x5Y71++KAp4xTVyflWBJM/iTbUNkxkfgwTyly9t0pFJ9TdYfQoN9caPvEkhfb
         pTwc2ETyma9cTNuKUJK9yo8guZq+wFOg1Lwm0AodUs3jJgUK7nnSZQG592NP0zg0xdGu
         Z76auovXFqeDWJZJV6+cdHCHa/bZtyS5I527aZxkaiOUPn0GnZkQIfYhLOe3ou1qv2xU
         AUgIw2OzwwDCP8DhETMlURKxwhAoIoiOOXMzyWLjamvz5qyvli83vkGCTPd4fSZuhrKf
         nRTjl94ylQf5QLgXxOjq2kv3smOpQalwc46cNCS+W2+YYffIMFrrM02UFUhte8wmq8eG
         hQBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ou5xudsvhJbATEEDYQzliV91yFmtfTC9oO8glygvNSs=;
        fh=XPtNSxZSPZMJfJW0SBZeHAyvz8ZmzmRZ6dvMdOqJp0s=;
        b=jMn7UqXV/3U3bt0l2l21tuWkG03hVXXjF4QCo/9Nv4wmCefHcyRh26Wm28XU3OHnHy
         BwWmFVi+mDfWWQkVT8K8isnnFlihWc/+bD7EhpuANYm2fk3Z6K/+N/5WFcff1AZlR29T
         W3xQRU+hsDq2lI5rfaIkCAXjVu0AzXRy4i6WXRR077ePxG8HkqzbdIFXk7fQtlcxp9Cd
         9KJ87gyndV9v+w56kMSL4cU4FVB93TVbaL/QVm5ARLKpWeTiJcssXFZkF0sdLnu8LGI8
         JsMbmYuzwvqOlw3QwMqYq5HgxFJpu3v33zV0tfqJr4UuH5B7jxQ4qgislgl4+nWs2jad
         8c7g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789054558; x=1789659358; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ou5xudsvhJbATEEDYQzliV91yFmtfTC9oO8glygvNSs=;
        b=nlG7f3e/AtMLNiz0BQcWV9M5Pafq9atyP26Z7Uy5HppoUhKrkY/YKyZJVyv6h4LNFl
         epBtXHaef1iAgEBwe8uVfooIMhLCG2ZMKhVAPLcNU89qO5ssulzUQKK4FNsmLDtqPC0b
         k3UClLAfSDaYGcgjciXf8FjsSxN6G8C1SpaIAT7JPmb68/OiPEH9MMGNfTisQd6w0GRQ
         HmKD3hXu14hOTk8hUwFIqG2aVSjb7Dr4epSDlAW9iEDNybqGgghpWEEvxuHfXi+wRhxP
         OtESdfHwLb6S0Bz6zhQgy7Ww2VCYEgHOz9ibKtiycbZdR7KtmZouX7JjU3gIdDKxnsV2
         6UGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789054558; x=1789659358;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ou5xudsvhJbATEEDYQzliV91yFmtfTC9oO8glygvNSs=;
        b=M+uZQLvWqhqeFfItPkAiJ8ExAqjJ/QnwuKJTDtuwHLBPnDmRxS4yGnyA61vUvX2uZw
         NdAyM7yIFPok11G3o8hg162CrInDeuuMmMro9pLEL10uxsyefl1ZaPP+/eP2b2V8sqVo
         /hu7AIzN3yR4oL3/96h1IDzFsFaLZHUKc1KWGlpXPiyIlFfPwNk+zte2CiLYYIRNCEAy
         Y6H3x25naWvj0ZopT6Z+XcCo0BF3q8QPoppBHBw72kR7xjFrcR0ZgV73seXuUFfv2ciY
         HnRTGXSUnYuwBbBAY/Ij1Hu+ESpP5SpfeuBzbQQ6rdO/g2HPVaSugWTEY46SuoHp+b0b
         VeOw==
X-Forwarded-Encrypted: i=1; AKwUvBy30/dj2SLvEGcOaBAjqNKhH9IaqlebIRh7CciJ5sMYqGYysMa+ybFIoHPznjyRmcojzwI0eQtIPmnY/sU=@vger.kernel.org
X-Gm-Message-State: AFuF++lzsjQ/7I5EtkOVlUQKo5mFG5KMUG0r/OVQuBwVbfD1neVGO3rY
	TdtwyBBGAn4nWRob0a9SoYDQXMnBzJJ8VuB1Xx2R2gStra3rTBiqOtMTgk9MJIkgpyOpOPDwxrj
	f3vn5SurOI0cdBWzvXXGuzeg9B4rVzJbg2BCX+A+iJn6433IhnFzU8U0qlL0=
X-Gm-Gg: AYBFou1oRgSKw8dKSGyUSPxbY59ymmX/lD94k2q44OgKudXC7RxDPDaYyuF+pAIi3M3
	F90F90VCbBuXvBbxYN1psbJyy5O8Sju/1aQj67uZK8Ik7FZ5lC/Q7wCRcaWLsn6HuzPz2eHmreV
	RYsYq8dPIDmcnOJZjeSJyHxqLJQRXrvDO6t/2vKYpceph8ONmw/+wZulm3HWeaGqrHYPzPbzy2t
	XYvxAKy0Tyc5Exu9KfczrNfsM8KUuv6kgczCDh8+EZFexfUBb45OP2A5DtXJWlqzMN2RnGyz0YN
	Hg/NA2AD+u5V8PLcaJtYl6A9t0CNQ6rgq7R6qc5Uy0y8AbP/3QFlnuDPd8vLgpXfk7vCPquwF4I
	3NMFybx0J9Q==
X-Received: by 2002:ac8:5a48:0:b0:52f:4a75:f840 with SMTP id
 d75a77b69052e-530b62a9367mr15603781cf.9.1789054557815; Thu, 10 Sep 2026
 08:35:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907063918.3432401-3-surenb@google.com> <20260907164931.131215-1-usama.arif@linux.dev>
In-Reply-To: <20260907164931.131215-1-usama.arif@linux.dev>
From: Suren Baghdasaryan <surenb@google.com>
Date: Thu, 10 Sep 2026 08:35:45 -0700
X-Gm-Features: AcwNN1X-343PX52UP9R_xuysezFhln2YO94sOY9W4QKq0I6lyVc17ep5qSeO2A0
Message-ID: <CAJuCfpHh1pmbhyJW5E2MZsGyMu7daW8aXvJD4A9_K4TRPt18jA@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] proc/task_mmu: remove unnecessary inlines in
 function definitions
To: Usama Arif <usama.arif@linux.dev>
Cc: akpm@linux-foundation.org, liam@infradead.org, ljs@kernel.org, 
	vbabka@kernel.org, david@redhat.com, willy@infradead.org, jannh@google.com, 
	paulmck@kernel.org, pfalcato@suse.de, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 7, 2026 at 9:49=E2=80=AFAM Usama Arif <usama.arif@linux.dev> wr=
ote:
>
> On Sun,  6 Sep 2026 23:39:15 -0700 Suren Baghdasaryan <surenb@google.com>=
 wrote:
>
> > It was pointed out in the previous reviews of this code that many
> > functions are specified as inline, which is unnecessary as the compile
> > can make that decision by itself. Cleanup these definitions.
> >
> > No functional change intended.
> >
> > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> > ---
> >  fs/proc/task_mmu.c | 32 ++++++++++++++++----------------
> >  1 file changed, 16 insertions(+), 16 deletions(-)
>
> Most of these functions would be inlined anyways so should be ok.
>
> Curious if there was a change in binary size with this?

No change whatsoever:

W/o this patch:
   text   data    bss    dec    hex filename
31321399 9024030 1127028 41472457 278d1c9 vmlinux

With this patch:
   text   data    bss    dec    hex filename
31321399 9024030 1127028 41472457 278d1c9 vmlinux


>
> Acked-by: Usama Arif <usama.arif@linux.dev>
>
> >
> > diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
> > index 2f500d639db5..9908ba32f180 100644
> > --- a/fs/proc/task_mmu.c
> > +++ b/fs/proc/task_mmu.c
> > @@ -130,7 +130,7 @@ static void release_task_mempolicy(struct proc_maps=
_private *priv)
> >  }
> >  #endif
> >
> > -static inline int lock_ctx_mm(struct proc_maps_locking_ctx *lock_ctx)
> > +static int lock_ctx_mm(struct proc_maps_locking_ctx *lock_ctx)
> >  {
> >       int ret =3D mmap_read_lock_killable(lock_ctx->mm);
> >
> > @@ -140,7 +140,7 @@ static inline int lock_ctx_mm(struct proc_maps_lock=
ing_ctx *lock_ctx)
> >       return ret;
> >  }
> >
> > -static inline void unlock_ctx_mm(struct proc_maps_locking_ctx *lock_ct=
x)
> > +static void unlock_ctx_mm(struct proc_maps_locking_ctx *lock_ctx)
> >  {
> >       mmap_read_unlock(lock_ctx->mm);
> >       lock_ctx->mmap_locked =3D false;
> > @@ -177,7 +177,7 @@ static struct vm_area_struct *get_next_vma(struct p=
roc_maps_private *priv,
> >       return vma;
> >  }
> >
> > -static inline bool fallback_to_mmap_lock(struct proc_maps_private *pri=
v,
> > +static bool fallback_to_mmap_lock(struct proc_maps_private *priv,
> >                                        loff_t pos)
> >  {
> >       struct proc_maps_locking_ctx *lock_ctx =3D &priv->lock_ctx;
> > @@ -194,7 +194,7 @@ static inline bool fallback_to_mmap_lock(struct pro=
c_maps_private *priv,
> >       return true;
> >  }
> >
> > -static inline void drop_rcu(struct proc_maps_private *priv)
> > +static void drop_rcu(struct proc_maps_private *priv)
> >  {
> >       if (priv->lock_ctx.mmap_locked)
> >               return;
> > @@ -202,7 +202,7 @@ static inline void drop_rcu(struct proc_maps_privat=
e *priv)
> >       rcu_read_unlock();
> >  }
> >
> > -static inline void reacquire_rcu(struct proc_maps_private *priv)
> > +static void reacquire_rcu(struct proc_maps_private *priv)
> >  {
> >       if (priv->lock_ctx.mmap_locked)
> >               return;
> > @@ -1230,7 +1230,7 @@ static const struct mm_walk_ops smaps_shmem_walk_=
vma_lock_ops =3D {
> >       .walk_lock              =3D PGWALK_VMA_RDLOCK_VERIFY,
> >  };
> >
> > -static inline const struct mm_walk_ops *
> > +static const struct mm_walk_ops *
> >  get_smaps_walk_ops(struct proc_maps_private *priv)
> >  {
> >       if (priv->lock_ctx.mmap_locked)
> > @@ -1238,7 +1238,7 @@ get_smaps_walk_ops(struct proc_maps_private *priv=
)
> >       return &smaps_walk_vma_lock_ops;
> >  }
> >
> > -static inline const struct mm_walk_ops *
> > +static const struct mm_walk_ops *
> >  get_smaps_shmem_walk_ops(struct proc_maps_private *priv)
> >  {
> >       if (priv->lock_ctx.mmap_locked)
> > @@ -1572,7 +1572,7 @@ struct clear_refs_private {
> >       enum clear_refs_types type;
> >  };
> >
> > -static inline bool pte_is_pinned(struct vm_area_struct *vma, unsigned =
long addr, pte_t pte)
> > +static bool pte_is_pinned(struct vm_area_struct *vma, unsigned long ad=
dr, pte_t pte)
> >  {
> >       struct folio *folio;
> >
> > @@ -1588,8 +1588,8 @@ static inline bool pte_is_pinned(struct vm_area_s=
truct *vma, unsigned long addr,
> >       return folio_maybe_dma_pinned(folio);
> >  }
> >
> > -static inline void clear_soft_dirty(struct vm_area_struct *vma,
> > -             unsigned long addr, pte_t *pte)
> > +static void clear_soft_dirty(struct vm_area_struct *vma, unsigned long=
 addr,
> > +                          pte_t *pte)
> >  {
> >       if (!pgtable_supports_soft_dirty())
> >               return;
> > @@ -1620,8 +1620,8 @@ static inline void clear_soft_dirty(struct vm_are=
a_struct *vma,
> >  }
> >
> >  #if defined(CONFIG_TRANSPARENT_HUGEPAGE)
> > -static inline void clear_soft_dirty_pmd(struct vm_area_struct *vma,
> > -             unsigned long addr, pmd_t *pmdp)
> > +static void clear_soft_dirty_pmd(struct vm_area_struct *vma,
> > +                              unsigned long addr, pmd_t *pmdp)
> >  {
> >       pmd_t old, pmd =3D *pmdp;
> >
> > @@ -1646,8 +1646,8 @@ static inline void clear_soft_dirty_pmd(struct vm=
_area_struct *vma,
> >       }
> >  }
> >  #else
> > -static inline void clear_soft_dirty_pmd(struct vm_area_struct *vma,
> > -             unsigned long addr, pmd_t *pmdp)
> > +static void clear_soft_dirty_pmd(struct vm_area_struct *vma,
> > +                              unsigned long addr, pmd_t *pmdp)
> >  {
> >  }
> >  #endif
> > @@ -1846,7 +1846,7 @@ struct pagemapread {
> >
> >  #define PM_END_OF_BUFFER    1
> >
> > -static inline pagemap_entry_t make_pme(u64 frame, u64 flags)
> > +static pagemap_entry_t make_pme(u64 frame, u64 flags)
> >  {
> >       return (pagemap_entry_t) { .pme =3D (frame & PM_PFRAME_MASK) | fl=
ags };
> >  }
> > @@ -3388,7 +3388,7 @@ static const struct mm_walk_ops show_numa_vma_loc=
k_ops =3D {
> >       .walk_lock =3D PGWALK_VMA_RDLOCK_VERIFY,
> >  };
> >
> > -static inline const struct mm_walk_ops *
> > +static const struct mm_walk_ops *
> >  get_show_numa_ops(struct proc_maps_private *priv)
> >  {
> >       if (priv->lock_ctx.mmap_locked)
> > --
> > 2.55.0.979.g7e5102b832-goog
> >
> >
