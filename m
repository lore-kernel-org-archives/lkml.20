Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09E97443AAF
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 07:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790321753; cv=pass; b=nCA6OVQWFBWYLsW0Iul0E7q0yCEtaUQ38jSOfOaEcCQKJMGYIOPx3EzTsV6cBbw21ajSwqJ4Vwj4FqhTfc5W6ZuloqiMezlFLMwNvhuEDqq9Hwrlm5iph32FBTReY/mKbj9pOwrKF04hnFwdvYsrH+gKyOs2+7g1M5yxnh7ZFjM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790321753; c=relaxed/simple;
	bh=QleRDPze6Fay9Y/d+9oXHJ/g/hcfyRz6rdp7ap/qQ+Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iOrFhfLKK8x406YoPQmPKjbuU2AdoyjrIiMtwqgFm2/lweadAKYxEzxBClUCdxactywo4Sq526y1f/AWlGjwb9a3T5h5YNWNB6ooR7z7zjt0Fpl1XLPl+2+fmBYJg8y7OZUEhynXC3+IuWGS4i7s2E/z2aKQzxQGhPMYCDkilzo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GBGvWS35; arc=pass smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GBGvWS35"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6a5f9b036f9so5454a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 00:35:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790321747; cv=none;
        d=google.com; s=arc-20260327;
        b=OEblAiJVVBT9wxD8uZDncC9bCvn9/B4tPsbhqVylW0CPrFo/i5x+0lV2z0KowE0esq
         ai4EUo4+XjGEywtuQpKvmGQHGIKerl/mB02GkSxxAQ2Z9RrJwr6B9i+nxwOdT7GYm5lg
         Lb8UaAqX47ZFkhWKDjoRAA/YWHmLSMVDsoTmlBNdbuB7FMvEDBRVxoiQgDmTLBPOFd19
         DIM34OP2aEDkOItQAa1jePSdEBfhH+hS1wDiFxZjacYtckDvjogHmeH7gRysOvKYTzZ+
         anR1HhPuW90KqH99guw5AJmMyaCYq5arqrXZoKFkOF5/MmlIvohXcs+XjuUSPSOIDaiC
         5M2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TiarA2FI5/GYv9nr9lV3Ck7oSnVRWS2NuO02/gM+R5Q=;
        fh=vG+Wz/c6MxD/uU6BaruRz9GOv07tMOl0nLFfzLx7R0s=;
        b=Ofm/rLon1rhfprqxfdlwDaoDILXa9tQYAdT0xVi3H7qI8C7n5FPadcAq3na9GDdoWS
         l/t1OBioNajIhO11kdj/iOjx5GUfS06TF1WwpuXYbUG+nQ2cAskqcEnl9EOl4cOk8Bbh
         eDw9wqbVyz/okFVwUicSujrASjQ1+rOAn+dkRLRG6M40yyDp0N/is2DLuagL2ZqshV0Y
         1sS02Q2soOpSJC1i+iqARUcXQJOinFFQZq6YvE6VFiOhaZFHFvahsSsDKm5Hu8Iv7AjD
         IKfyDkQZalmzrCKdRy7lf1pq6YgE1Skis0LUzg+wh0RKI15XdlwoCmyokCgOb3Yiip/N
         tuuw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790321747; x=1790926547; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TiarA2FI5/GYv9nr9lV3Ck7oSnVRWS2NuO02/gM+R5Q=;
        b=GBGvWS35CRs52H+n0HibcXUxhDsFXef4XaGWh2jw679xAwuCg1uimStbUKyOmHzo62
         aSMchmwbdzg7paOFIuf/8kQtxcF/LgrwJ4PWnwSTcUhTacl4XbbHR9zZfdic0iMf+lpj
         xanAi9EmnoAPJUYHYLgxzOZH9198NTbtD+rg556M+8CT6VKcwMlDw2jxIv5UX9YzP9WH
         OJARG7aOAYL2SLSrUoundJe8jBeryf8iNeYj6/bFKGTzhaYARaL24JE2HpwdUQCtcaMS
         Afp21cIeWui2Su01twICQfXS+YmDFvrnzmWqxdXqsREfAh07Rj07E3xCH3No5p6o7nNy
         +gfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790321747; x=1790926547;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TiarA2FI5/GYv9nr9lV3Ck7oSnVRWS2NuO02/gM+R5Q=;
        b=vnSZNS282KVRbIzmbk4el2mXOB9/WEq7OmxWCJaDuHzc8VFex5O/jjPeg4pTr6kVwo
         swQIWNKR/C1V2PRn2I2UaM7Wnt0YgvQzbSdto0PoS1MXkvXtBzz4qqhr7n9Y35GV2uyr
         84emQxOW8wAqm0jQiiozv06gzNo05OVC9Um3QWQTkRmhc8CNe9O/NXKbqAR/HS0TCrRS
         I7zkB8wp3dmvj5zsGWYSFXfvHAKKApdF7YUe3kDRUmsoCb4QY+w3h3AE4XFIE9D3rCiK
         os6Io1AWNBwzmXfuo9uzruVt0yKzB0KSr++OVwAy69un9fgYrPz+KO+IQKctFyRRUqFE
         d9YA==
X-Forwarded-Encrypted: i=1; AKwUvBxriHNranfjne5PHB4UAironbALkPaiW7hQ4z5feeJUifD75+ncBX9QGRK+qc4Pz+VQ1e6/5iWlw+I4Um0=@vger.kernel.org
X-Gm-Message-State: AFuF++mQ5UiVisyoFFfiLAKAfocgmLyZ4WV0pHhSMEASWtc+sBIyjWz6
	ziaShnmiVtkayDWqnTdlFIzwZQJBnwSYRwMGPpShW2H/AcFpbHZTumH2YQd7o5e0UDwA6ZkUjuN
	tMX9i4gIcZg68/rvb0p+Up7lE84YmpfotIi2IOFhR
X-Gm-Gg: AYBFou0O9O/oR9mAeMMANYqKNpFxZoHSLD1vFXsxJTVCmEPYjtPPKPNaMPnnlxU3v5b
	dym1F8K9/+RKfkjSDtekNvlUQH9V9JS7SARkskBdHGfb8JLXyBttSHAYmoZzhrTgT2nhAlFVf3r
	gHjYE5CxEcuX5QkIzb4+gjPKHsiHEhPgzPg/alN3ed1CNHxI/TXPP/VgyHjSaSsQW3Q5XIbvN01
	9Ack9jMCLo9q9SU3HjHkstkktxJa0Pq++xxPD7HqLASsvblJS7maVU2D4eotfeHkxTBHAfFIVFV
	5Rt/SwFICRXy9jvp0HLcrz7cBIBSt4RB0lRaeF38NCU8vON8pkJEn5sARAIL5ag9
X-Received: by 2002:aa7:c64c:0:b0:6aa:e332:b762 with SMTP id
 4fb4d7f45d1cf-6aae49c58f0mr23500a12.8.1790321746110; Fri, 25 Sep 2026
 00:35:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917-b4-mmap-prepare-vma-flag-sanify-v3-0-4583d8a23bca@kernel.org>
 <20260917-b4-mmap-prepare-vma-flag-sanify-v3-6-4583d8a23bca@kernel.org> <DLNSNQP7L4FM.1JZQ0GS9300H9@nvidia.com>
In-Reply-To: <DLNSNQP7L4FM.1JZQ0GS9300H9@nvidia.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Fri, 25 Sep 2026 00:35:33 -0700
X-Gm-Features: AclHuK_NuiQlFRW78Nf23QbG4E3oej6nx-ZjiAb0IRRSHloLT2xGmv-6NXWsN8E
Message-ID: <CAJuCfpHpo58c6eOPY_CvP+ts2zwXQEDNX2bohXd0CBANYWrBWQ@mail.gmail.com>
Subject: Re: [PATCH v3 06/40] mm: make map_kernel_pages_[prepare,complete]
 internal and unexported
To: Zi Yan <ziy@nvidia.com>
Cc: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>, 
	Pedro Falcato <pfalcato@suse.de>, David Hildenbrand <david@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Leon Romanovsky <leon@kernel.org>, Paul Moore <paul@paul-moore.com>, 
	Stephen Smalley <stephen.smalley.work@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
	Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, 
	Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>, 
	Doug Gilbert <dgilbert@interlog.com>, 
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

On Thu, Sep 24, 2026 at 12:30=E2=80=AFPM Zi Yan <ziy@nvidia.com> wrote:
>
> On Thu Sep 17, 2026 at 12:22 PM EDT, Lorenzo Stoakes (ARM) wrote:
> > There's no reason to export the symbols for these functions which are o=
nly
> > called from internal mm logic, additionally there's no reason for them =
to
> > be declared in mm.h.
> >
> > This patch therefore removes the exports and moves the declarations to
> > mm/internal.h.
> >
> > No functional change intended.
> >
> > Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> > ---
> >  include/linux/mm.h | 3 ---
> >  mm/internal.h      | 3 +++
> >  mm/memory.c        | 2 --
> >  3 files changed, 3 insertions(+), 5 deletions(-)
> >
>
> Makse sense.
>
> Reviewed-by: Zi Yan <ziy@nvidia.com>

Reviewed-by: Suren Baghdasaryan <surenb@google.com>

>
> --
> Best Regards,
> Yan, Zi
>
