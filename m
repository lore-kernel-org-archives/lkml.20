Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D9E93655FD
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 17:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788974139; cv=pass; b=siQ5nr8eKMfv+bkwiEX6TpJZsnKUchZcfiL9v21GGet9/9aSLjPAEbVBz2p35a8/1lGLb6nbBRlyrXuIFtsA3UsdSoEsj2GMhPnwz2hg1/uFgBywg9UyEBRC+ru6hbC1Y9U4Zwlmps4GL08E4HV1fu1wmLRdx4rfrEoFjVwEa9M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788974139; c=relaxed/simple;
	bh=1YAIaeDyLVpEvvzFwuUJMbazAMt3NzSDWCDFujkL5lc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t/OPT+AeeSKcIqmNhVfhCbP48nWO0jiq1MzoUhgAXEU6l95Y4p23JrRPVppwQsiqFwI13bmosTXJ9+k3D9pnFRpGUjHKio7f6zsChgh22ITLe2NtJ8PQHlmCSDRWL+mLlrmhPPNj2dzuqBgJC2Uzo91gKnl1hPmbmgOvn+GHlXU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HbY3TdbX; arc=pass smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HbY3TdbX"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-5306706e89dso329891cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 10:15:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788974137; cv=none;
        d=google.com; s=arc-20260327;
        b=P/3/hW7t0LTXGieiGB2BulzV4Z54dlW9oauWu5raCobuYUswS29Ts2RK2Bzk9Rj4H3
         pqZXnUhKmzSf1d+oiti/WLJ3E9SHFKHlRvKNRYVyzaC9+hGAPEcq9w9l7QpYvLN03rlR
         rLzB1iXgO8jygKjUDBfB1t3mpSvENLyGhHA2/PN2w9uXOVbgXZYf2ymOVa4yq2hvZNOC
         7ZlFavpfb2m61/a8L4d+uEAoDqiH0BpS3p848Oc6YjXaiUeRlKOyNARByln2vHlueeAO
         NV9vIwmKQQDDQ9x7100F8ED391bUms537L4N51UcSW12mxmth+zPZ/Yc7f0/msw0hq0S
         SPhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mKUmBDe2b4FLQdJcR20tHldduUrJACzKAwyQg26uG2s=;
        fh=Dj2Zdysf5evjSjZejltw3JejLm358iwOaQ2dR8sUaZM=;
        b=mEveNEk0O7ARXhM9NXtso5p9r6kLvGverSzZIg278sx5Kb6gMsb299rMoHhlHijA63
         WDXS/OavyqNcaMgeYYHusLXZMojGxzITie6ap8W7XfA9ZlQItQrSCluR+Mueoxbt89aM
         SPvHbJR8JXHXh0E0h/6aGpXeTXmwUndv/SogZxPOjTABrfhao8DvLMswlW9HiPjEBRWd
         0vtmqAtFB/J6WlyAr5ZSe0KQ0f8KUP8puLcQOrh9gWP7kVftDG4mL5IBoOjFL47Hw9L+
         j5nie4OaKjyVW26KJJz2TwhFrsR27Vvk3OWIiyOnKD6QWXpgIIsPDcNve3ik4Rpk7Uud
         DmhQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788974137; x=1789578937; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mKUmBDe2b4FLQdJcR20tHldduUrJACzKAwyQg26uG2s=;
        b=HbY3TdbXh1HeDA1CISRM4vFgBbshMEJ3Y41MetmpizeACtcBFvrnZ42fCa9kRsD4Yy
         1nq49pEpk9a9R7roEUh04FoZyRnL2UY9tUOCtzRkPFxxq5DC/yj5VHvuqWDZ6ylzKTov
         st8IaztaYCk8hGWmc/IC6wda/nUzsp1Zr2lBekrthUV/mj6pbio6ylScmUI/qyDDWp2r
         H6O5BcgnCS3YHlvVCrS/+Q8b0yMKZR74q5FO/aNdBR0HoD1zepE8Lar1oheT9iawpvM9
         01x2ghk4163U0s/6GRxybf4YAdDJHeE/d4foFb61WDP4WST7Epq38O0FNKjpspvhdP27
         cKBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788974137; x=1789578937;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mKUmBDe2b4FLQdJcR20tHldduUrJACzKAwyQg26uG2s=;
        b=cBB2CxD6wO4XVgC0Hy/6wfFkfEXJatXjUVclB5cfqsVzjYxFLk6s9zz7rM6/NiWx7Y
         a+ARAVVV7cf0QtIzwIslr2uQWG0m0qVBM4yJrGmOR8VNE2x5NTcWsVSVn+O/m7aO6sy9
         5Cy6H2f/rOsQvKgZt+j2U0rND0bo0ixobrK+RnZHOYax5yCy1YEFL2Vt076XX0IXHjQh
         xuxzEIibwF0NJvLx3Lv8AWASqON/D6FDuul7n91ilPTq6s3iQYj8eE0dMjXINa+r6YA3
         jdZeISPjMlUhZq7grwbueP3XPkcOghdPf0j0S1wGD2qOng2Uz9n/U4vPDhVYHyQcWpPB
         c/fQ==
X-Forwarded-Encrypted: i=1; AKwUvBz0K7vHX74ZxJF4DnyLfxTSrpYQTpOypf0XhuOH/1oGT6H1wsTcscmdvhRFFkQvQSfDq5hUcIdMoHiVyLs=@vger.kernel.org
X-Gm-Message-State: AFuF++niNl079KQGL5N6n4+kk3x2wwxp8hQQS3b4MlRizknLiJcz7S/v
	0gUNRxJwCcmDwa1Vm7lz+oASuOT7awleHsV1pBLiwPCbpiOCduyZeZMQKi591Q2Z8LBPluusHZ5
	005m5S/Vj2Cw0hPAT7AYgmTPNe6dLxteVNywAFedY
X-Gm-Gg: AYBFou0NrgtYLZHlfPWr2XipgHedJ10jaHje6xeDp17I14nbGN0/nWguDDZzKoMVmg/
	IEVng/YWVtJmKjc5d7KC/jS8HyFPRQ/H2rDoYJRAQGyIvj6IY8KT0UdHQNc1weMBu44RjhSKFHr
	QC8OTJPGqwXlVlWaSN1n5xn28DJe/yfdBGintDJl6ztv8NyiSI247PyZtAC9PHBZmV7NnQe3kYq
	fa/IEmXRT8mmxPlFZ+5LCakvixo/hLjWqnmerAzQfVCsUgetaQPSnVLdN3fCE6mA67D0VUMykFu
	QliRh/GwLko4rVcMU8e19uFLxXJY4nLR5YsW011OjTiwJwsYKNL5NnR6K9J/bfQGzDYz
X-Received: by 2002:a05:622a:a1b:b0:530:5ed7:50f0 with SMTP id
 d75a77b69052e-530a5f51176mr89211cf.13.1788974135518; Wed, 09 Sep 2026
 10:15:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907063918.3432401-1-surenb@google.com> <20260907063918.3432401-3-surenb@google.com>
 <4964f874-3f3c-464c-9977-0d004f6ffdbd@kernel.org>
In-Reply-To: <4964f874-3f3c-464c-9977-0d004f6ffdbd@kernel.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 9 Sep 2026 10:15:24 -0700
X-Gm-Features: AcwNN1WWr8U2hfUDprfzdhTtlvlOsxUFMQbj8KtH7xWoq0JQsfsSVRf58XyzXHk
Message-ID: <CAJuCfpFJHNq_iCHuzDC0a8CT-AsPLHgnZ0=hVAvVhax_Q6GjOQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] proc/task_mmu: remove unnecessary inlines in
 function definitions
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: akpm@linux-foundation.org, liam@infradead.org, ljs@kernel.org, 
	vbabka@kernel.org, willy@infradead.org, jannh@google.com, paulmck@kernel.org, 
	pfalcato@suse.de, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 9, 2026 at 10:07=E2=80=AFAM David Hildenbrand (Arm)
<david@kernel.org> wrote:
>
> On 9/7/26 08:39, Suren Baghdasaryan wrote:
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
>
> If you touch these, please convert them to two-tab indent.

Ack. I didn't realize that's the preferred formatting.

>
> --
> Cheers,
>
> David
>
