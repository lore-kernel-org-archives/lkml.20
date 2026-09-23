Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13588442FB6
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 15:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790177585; cv=pass; b=NF9p43VrKqXd1ffocAevoUmLugE8ARoV7QokFd/HQ6DjZQuj9mW9HJ9kEUqjYrgEmUw7niL7CbTWLOuhL0sGmxKJq4kAtXIOKzWNJTesF3TdfWMRkJrQ2JqfpEbcbkfolvv5RA2eBJdhSe1BcxdWGjVrgNBLOzI6YalXgX0NOMA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790177585; c=relaxed/simple;
	bh=jxwZm7xClD+2zV/lVJfi9AIfVTBsL5zv+L1dfqymGXs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PlMPN8M/2IZieQucye66SM8/ceVATt3ot3SJfu7xmCTCkZqPhwwF3NciwaAzzbpdhu2bTUCasVu8wxTEsv323t+Dcz6RKEQTxWg8+Irhb44ClBlLQUtF+P9bsZ3Y/pOllyYQTUroHkCeg8ZLqRAL2789lMtgOHzrGJeWEdCn0R8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=If7GKOde; arc=pass smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="If7GKOde"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-530e8c6fb80so258781cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 08:32:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790177577; cv=none;
        d=google.com; s=arc-20260327;
        b=Gz8W8tS2Yik32XvnZ3+8JiAAcRc1IiQE4JfRrqOshwjv+4QnKyCi4P4FZKx+VYmvUi
         aJYzFvX+aFeHBX74EmB0VATZnFlx841tZlHDEbnaI/IvC3bcaML1/05rQOW2v+oJTGIb
         M22qJvi2jyx/V5UzOzBgUsNwhnu1h1t79MrKejqEYyUczvbdGnUYHNxPuczHCrkWZpTM
         z22bro9XEuJMNOhU3pYPthfOnJadlRViHrLWRmvGMI1+6MWlBtXAB+p/jsV9hVjETEOD
         9XdCeWVV6Rvvxwkp4xFLuCL+hmTzELCy06WC7fTOEZxE2y80De65DZrj7K6f4eeDsCil
         IJdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hKtcWNVFda3wl86zaKIN0hpMLzWuZcmeXVfEC0xSzRI=;
        fh=VecB35M3avbnzl1JpNmi9UFJanPDJjGMgCdNv8r44YU=;
        b=SfJYU5ng4hPN6PU4Fym1lSNwlxq22Yf8b8WaQN9AWMdrRxjGR7SdruIEMW8SG1uSjI
         JMH7sr5MGA/OXj4wPpKiwgrETXGMKVuqfleWpYfu3Zngukjkf6kmnHNN4kALDErWajrx
         DMHmxgU5BlGKId7uIzUbgdD3INe2+60lCimRlPaKSAcGLa5hjzTqdGZDqitK8WCSRlBi
         5VeBsztP0fOiIDLSnUXZIKUXEv/YboU0aueOKBYExD1CcHbE68YUCpj786YHs/awVLnd
         prV0Jmda3NqAMYiSneGaSp7bHB6CRo9fIYI4XgY3x9LasGpJKitc3rzKNaaEEJi2FjiH
         y9Vg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790177577; x=1790782377; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hKtcWNVFda3wl86zaKIN0hpMLzWuZcmeXVfEC0xSzRI=;
        b=If7GKOdeFjgbaFflKhblIUZoChQbysqD5rBOphZCmXNrLHvvhrbH3TLjaU7GenAzVu
         DDuuhmIVaetQpjlLSEsw9ZhLEmdSnOwMAfSVXeH2BZs68Ho09gUFpzmbn8SColrH1Nre
         xlUvYHIxvoy9vcZPCBRP0ARWo6kQiXg1wTVOGTwLp7tdzIP9zH7QD56whDNMzMzkBh47
         z84OI7qhC5N4k0um2NgPR1dfwCxFeAd8ZxGN7jysYtuaUl4CoVvMP32eljzbRGy17tvL
         QQkGR4GLcRdIQcjJ+Z1Dqsch2dFY3EmpM3EqW2FAnRwA0seOJB6ACVVMknCGgpDbmuPn
         ty2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790177577; x=1790782377;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hKtcWNVFda3wl86zaKIN0hpMLzWuZcmeXVfEC0xSzRI=;
        b=2vwzEz7ml1ZUcrvtGEImXWFnCsFoiYXYej6Smhkoi032+6eJwp+gzi50URtecW6g/n
         TcCcpyQP7l0ScF4mTuwDxJJLrKhYdECg4tY9y1XMMBuW9bN0k7h1ftz7BjdHjqoc7Pj4
         Ts1v2L9NeUBfvmcYAB8PHxA8AZmKcSR5qcBocCd/UtsnZ+YFmTd5MzpBxxBRJKYXxSRc
         A1WAd9DqERpwriVrBCllWGIdc2Yv/qdrw+ARhn6O50FCeLJvHsu1PWFV0POnzqmplGGc
         VKYZNttZ8MBPP6fcGw5HcOihuhQe4rCeOFm1p6LETICQBUNGuMtfm3MtdtuLp2SJcyN2
         Hfug==
X-Forwarded-Encrypted: i=1; AKwUvBzLyyhhNWSS3B8IyLh8tD2ruzsOp4MS2CN1TZy+FYceb+9Xgyvrd9LPVvqN9DWIJP+uj4e/dcG2+FNcurg=@vger.kernel.org
X-Gm-Message-State: AFuF++ldnOF95fzu6FSG7qi7D91PQZPY/gl1eovriK0v0nLIiarsxyTC
	tH7FPor//WdA2z6NfcPk5K2alwM5xf8TvT2gX/fYXHbV1+b0xEEaeVJDsw+ms0Wv0xC6Nr4Vmfs
	0mjvnJzzAU/7KZxNx6tCn6cVyDbgn48QY+DkGvfSJ
X-Gm-Gg: AYBFou2ARMxsLgi+dTRNfatoYJcRXEB4iSdweMHN5nRwYaA88BESP5ITKROX9qcY6UJ
	9+R35FQoXWtaVCfI7rIUNA7kxMGxds8yFD39gYbwj/5iaAd+kWPvY6cAAD4VnDuai3GSSVx1nXx
	BIDlPlZMwwJ6BhGxqftHIUOknrGqR4fBiIWOM+EUevysNqPHGUA3t5W8NVwNZt67VSrsqLMz7QM
	tH1tQdPtCVwtENre3qjdbA2gyPJKp2erM5VJzWP5rEekoDLLp1ztdtkVWR2sUysARnV3osvPxTU
	bJkNaBnwOZR+56pRnXRiZSIAMdiO4+qQF/R+q9D04etdqinU3RcFG1uxvpAhQu6gpNKaEGTdfi1
	Iv0ues8/8wg==
X-Received: by 2002:ac8:5f13:0:b0:532:8423:1e78 with SMTP id
 d75a77b69052e-532f8eef5afmr573491cf.10.1790177574693; Wed, 23 Sep 2026
 08:32:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917-b4-mmap-prepare-vma-flag-sanify-v3-0-4583d8a23bca@kernel.org>
 <20260917-b4-mmap-prepare-vma-flag-sanify-v3-2-4583d8a23bca@kernel.org>
In-Reply-To: <20260917-b4-mmap-prepare-vma-flag-sanify-v3-2-4583d8a23bca@kernel.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 23 Sep 2026 08:32:43 -0700
X-Gm-Features: AclHuK8Inh8u6lJouEWaJf_8_dOxdEc__Ja8ROlufrRS70N8N3MQ9iMsAEM4G5I
Message-ID: <CAJuCfpEa8tUmYJBjx-cRdAE8y-jcKY0C81kAOa1QZS7F6tKdfQ@mail.gmail.com>
Subject: Re: [PATCH v3 02/40] mm/vma: predicate setting mmap_prepare VMA
 fields on new vma alloc
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, 
	David Hildenbrand <david@kernel.org>, Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>, 
	Jonathan Corbet <corbet@lwn.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Leon Romanovsky <leon@kernel.org>, Paul Moore <paul@paul-moore.com>, 
	Stephen Smalley <stephen.smalley.work@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <nico.pache@linux.dev>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
	Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Doug Gilbert <dgilbert@interlog.com>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K. Petersen" <mkp@kernel.org>, Jaya Kumar <jayalk@intworks.biz>, Simona Vetter <simona@ffwll.ch>, 
	Helge Deller <deller@gmx.de>, Sebastian Reichel <sre@kernel.org>, John Hubbard <jhubbard@nvidia.com>, 
	Peter Xu <peterx@redhat.com>, Masami Hiramatsu <mhiramat@kernel.org>, Oleg Nesterov <oleg@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Rik van Riel <riel@surriel.com>, Harry Yoo <harry@kernel.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Will Deacon <will@kernel.org>, 
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Nick Piggin <npiggin@gmail.com>, 
	Arnd Bergmann <arnd@arndb.de>, Muchun Song <muchun.song@linux.dev>, 
	Oscar Salvador <osalvador@suse.de>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, "David S. Miller" <davem@davemloft.net>, 
	Andreas Larsson <andreas@gaisler.com>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Matthew Brost <matthew.brost@intel.com>, 
	Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>, 
	Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>, 
	Ying Huang <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>, 
	Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, 
	Baoquan He <baoquan.he@linux.dev>, Youngjun Park <youngjun.park@lge.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Qi Zheng <qi.zheng@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, 
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, 
	Chengming Zhou <chengming.zhou@linux.dev>, Michal Hocko <mhocko@kernel.org>, 
	Miklos Szeredi <miklos@szeredi.hu>, Xu Xin <xu.xin@linux.dev>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-rdma@vger.kernel.org, 
	selinux@vger.kernel.org, linux-sound@vger.kernel.org, bpf@vger.kernel.org, 
	linux-scsi@vger.kernel.org, linux-fbdev@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-trace-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, 
	fuse-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2026 at 9:24=E2=80=AFAM Lorenzo Stoakes (ARM) <ljs@kernel.o=
rg> wrote:
>
> It only makes sense to manipulate VMA fields if we allocated a new VMA,
> rather than merged it.
>
> VMA merging does not compare vm_ops or vm_private_data, so a merged VMA
> keeps its own, which is also what the legacy f_op->mmap path does since i=
t
> never touches an existing VMA. Previously set_vma_user_defined_fields()
> overwrote the merged VMA's fields with those set for the new mapping. In
> practice these are the same values, with rare exceptions such as shmem
> selecting vm_ops based on whether the file has been unlinked, so no
> user-visible change is expected.
>
> Make this dependency explicit, and additionally constify have_mmap_prepar=
e
> while we're here.

The fact that we might be overriding attributes of an existing VMA
that we merged with is technically a bug even if we never hit it,
right? If so, should we have:

Fixes: c84bf6dd2b83 ("mm: introduce new .mmap_prepare() file callback")

>
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

Reviewed-by: Suren Baghdasaryan <surenb@google.com>

> ---
>  mm/vma.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/mm/vma.c b/mm/vma.c
> index fa784f069da4..4b74b48c29b7 100644
> --- a/mm/vma.c
> +++ b/mm/vma.c
> @@ -2894,7 +2894,7 @@ static unsigned long __mmap_region(struct file *fil=
e, unsigned long addr,
>  {
>         struct mm_struct *mm =3D current->mm;
>         struct vm_area_struct *vma =3D NULL;
> -       bool have_mmap_prepare =3D file && file->f_op->mmap_prepare;
> +       const bool have_mmap_prepare =3D file && file->f_op->mmap_prepare=
;
>         VMA_ITERATOR(vmi, mm, addr);
>         const pgoff_t anon_pgoff =3D addr >> PAGE_SHIFT;
>         MMAP_STATE(map, mm, &vmi, addr, len, pgoff, anon_pgoff, vma_flags=
, file);
> @@ -2937,7 +2937,7 @@ static unsigned long __mmap_region(struct file *fil=
e, unsigned long addr,
>                 allocated_new =3D true;
>         }
>
> -       if (have_mmap_prepare && !map_is_anon(&map))
> +       if (have_mmap_prepare && allocated_new && !map_is_anon(&map))
>                 set_vma_user_defined_fields(vma, &map);
>
>         __mmap_complete(&map, vma);
>
> --
> 2.55.0
>
