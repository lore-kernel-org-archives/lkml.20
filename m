Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794925195;
	b=LdEigOrR3tD9J0/cXnJZSdtmECtg/2RlZ2TxHsgf9nW6zl40GGJlijVSdN/AtX4GMejq
	 mU+hiLIX5v9q0vNV13Q5GBhyMRuGUApIc7RVqxtVswINDXXUwYzQv6Ta93JMu48fTGfCY
	 gsRwFJHfq38jeB0rrBtY0EJNm+kKgAPN6Oofi/dh13ycFfMfWdGXXc3DL0s2iIvSJ6Ma0
	 bKmgAiKCj90Gu7ZcIUeivIwFTURVkBZYAaVrkxMbEAZqFbE+qo4K+AbEsHt8wn1/UwenZ
	 p5oNZSLCb5Hu9/tB7i8HHbN1Ga8M+VvFVJfirb0ozYcftoesgTumRzuC6i9062OOUzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794925195;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=4FXZ9QjPMWSPXHYn/FS5PKL+JaPOXiDC39K9maTGAmk=;
	b=jamBmg/vap8Is9shbbXqNteRNqK+In3+daKeQlD+Fnj7vPyzqKUiIYpQqNUUgHeCs2nZ
	 Nqqfm4vp8nUjmxo4rCADIv91guF20hmz9nLOFW1CIi2/NM5wysEbQYvOWWVgRAP3FNrn4
	 4MmGX9oyEzwIPOOwFAnHoM3SEeV5DqRowx6Zp+hOKK30zIzZXOWMm25yymIsVx/EHtBLi
	 Hc55PmP7j8mWVo/Twlqo6eeg1GbMF2S5z66L/rXLMvQNE394OITAC3eA3YBwvISoPbMcH
	 95/ZrvA8m3TH75u8dkKZGMm+gg5eintJCjh6//NY8DP0L8gVki7R1jC1qSZFeAucQxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=n4iwIaR7;
	arc=none smtp.remote-ip=209.85.167.44
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE7B1606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:19:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE7B1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=n4iwIaR7
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5bccecba199so5064439e87.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:19:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794925193; x=1795529993; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4FXZ9QjPMWSPXHYn/FS5PKL+JaPOXiDC39K9maTGAmk=;
        b=n4iwIaR7IlCcOvjYzSom7sSgquDGNqh0cPFWXBZps0G2Te2wzNq6AwL+rEcY/Ag961
         BOqy2SH4/okXMTdMNY3CYA2B5FgAtgUsIlkpcr3AKTXg2rTqEs5Fu8hD4UKw8vatute/
         WWsJEK04w27L6TMEQcCcD9JtaotYG3ikXrziU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794925193; x=1795529993;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4FXZ9QjPMWSPXHYn/FS5PKL+JaPOXiDC39K9maTGAmk=;
        b=yHkdPlHiHnGlhf7y2p0kw3PpBx+WRvhEjTTxm56GBvbp4vRTOUq8ztE55f1UT4W97y
         xaBoVquEf7/0yMI59RERb3qE56ujsC1NkQCQX+EhZk/iKjjSlQSWCzYRDOqnESg/G+U8
         x2nSCbvlqPpLU8FVClJDmePn06QCbrJTQSXSVxtWiXbRY3Nrf1t/WyC2OjD4XHhHhygu
         hcy8gyLj42n/5s+g7cecvx5YtiWL4Kl4v52yCh6ETwzjhK+iVjiXIJdZYzdMtIb+ZKUL
         rPxjAXj2CQNdEBH2i96YpXip3qtz60ZawMzeKB2XlumkhHpX6GnjKLpZkVmQJsAAbrs1
         zpKQ==
X-Forwarded-Encrypted: i=1; AL+hErEbOWIh4Ib1vNfdELqgFT8R3n1srZQa7Zy03ZwwhbYbrQaktW65ojtGNMetnngfqAqmrbAlLAjcr0tXsls=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ZDsyXqvNPqKWRx9yD1EjOPkYOQYvakaQkntp9oHu2BFz9H0UD
	Rotan405AYvV3G2XaGZFvbqgPmOB+HjdF9ugl31ksp3+Yg55sT3N2X02tWoe0cBvE+CfRUiF9Yk
	RjtsFCUOZ9rBuDg==
X-Gm-Gg: AYBFou1A6N6wSIErXjEHJHvpzwVdWSQMIsnwVIHb4o5Qy2NpWwfaEDAD7Y8EBo6LEyd
	AKwYgjf3YfNMoMrlnHK1gdHsfz4jlA5vYIJKO3B034WaM8DKLkNQ+XjTQ0X8j7wcQdnJhU0isRz
	ENopQmP7Iocjprdss/+EDM0OfBVGQwr+vmkn6t945mjWYinC1GPvQT9CxOSGuC/UpZ5XC2iVc0o
	NvssJYtlQqO8DBRXRGXbXMqwTHN1A5v68mVaGlfJ5sujJ2xZbGV9Khk5dU8PMP5eFE356v5wnpI
	sDA1nwJ26eP+fRsI3uR9lWfDs1HkYl7vMHh9dKY78G1gKR1BPWq/ftgMDQLW7hcj9kcfoXCD2HM
	rzCd1HAOnmuK7iCYj7zDHbbhzY6ZEJceCES33RTrOOjQXnGf8rWqVrGl/WN1Yi5ckCdbAVpI3zY
	E1GVSSehJ1XfN3b7eoniWBCRZRDU2t5MyP9sbFCB+jER22Vwd90iXwxQ8VHeJi4xtJdF1aLWuWU
	HqfxmYLoOlWX2fOQEnAXLb1Wwss8G4hHu/FaqLK+1Zc+uAzfsbJ0DKb49b8YQTZWpHOpJ+boFKV
	sUfXSQloxt2IGEM0hWSnhp9o4AWldVYKhpnXlETAwrytACJic2Nnfa7vIHrzzn2N
X-Received: by 2002:ac2:4bd6:0:b0:5c1:4bd4:9913 with SMTP id 2adb3069b0e04-5c1705d7ffemr7046060e87.5.1794925192772;
        Tue, 17 Nov 2026 06:19:52 -0800 (PST)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com. [209.85.167.47])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c171333630sm4037411e87.19.2026.11.17.06.19.52
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 06:19:52 -0800 (PST)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5c14bc5a743so9568e87.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:19:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErH+S1nO70z1kQOBA2B5+2CwIU6HnXOEIwfx4hqlN1aAPymVNr1d7/IKcSe4v/cSOPCj3hzwIz9i2p65x4c=@vger.kernel.org
X-Received: by 2002:a05:6402:a511:10b0:6b5:5d24:5d90 with SMTP id
 4fb4d7f45d1cf-6b85b4c22d8mr72630a12.3.1794924698252; Tue, 17 Nov 2026
 06:11:38 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116230627.3537051-1-jeffxu@chromium.org> <2066d131-f999-4747-beb8-520d5e0ce1db@kernel.org>
In-Reply-To: <2066d131-f999-4747-beb8-520d5e0ce1db@kernel.org>
From: Tomasz Figa <tfiga@chromium.org>
Date: Tue, 17 Nov 2026 23:11:19 +0900
X-Gmail-Original-Message-ID: <CAAFQd5DzTmyeVQxNdhdy8pPi+ts1cCgbztVJiMoNBeJWBzjdQQ@mail.gmail.com>
X-Gm-Features: AclHuK8ZMC6yRFY7VxkKfsQMYV8BNfasB49bEPdk_bBjeXaAi9-9aO4mXcafXvg
Message-ID: <CAAFQd5DzTmyeVQxNdhdy8pPi+ts1cCgbztVJiMoNBeJWBzjdQQ@mail.gmail.com>
Subject: Re: [PATCH v1 0/7] mm: kasan: skip KASAN for GFP_HIGHUSER
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Jeff Xu <jeffxu@chromium.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R . Howlett" <liam@infradead.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Brendan Jackman <brendan.jackman@linux.dev>, Zi Yan <ziy@nvidia.com>, 
	Alexander Potapenko <glider@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Marco Elver <elver@google.com>, Boris Brezillon <boris.brezillon@collabora.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Chia-I Wu <olvaffe@gmail.com>, Dev Jain <dev.jain@arm.com>, 
	Evgenii Stepanov <eugenis@google.com>, Ian Rickards <ian.rickards@arm.com>, Jann Horn <jannh@google.com>, 
	Jeff Vander Stoep <jeffv@google.com>, Jeff Xu <jeffxu@google.com>, Kees Cook <kees@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Peter Collingbourne <peter@pcc.me.uk>, 
	=?UTF-8?Q?Pierre=2DCl=C3=A9ment_Tosi?= <ptosi@google.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, Will Deacon <will@kernel.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Miklos Szeredi <miklos@szeredi.hu>, Baoquan He <baoquan.he@linux.dev>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Pratyush Yadav <pratyush@kernel.org>, 
	Allison Henderson <achender@kernel.org>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, linux-mm@kvack.org, kasan-dev@googlegroups.com, 
	linux-arm-kernel@lists.infradead.org, linux-fsdevel@vger.kernel.org, 
	fuse-devel@lists.linux.dev, kexec@lists.infradead.org, netdev@vger.kernel.org, 
	linux-rdma@vger.kernel.org, rds-devel@oss.oracle.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 7:10=E2=80=AFPM David Hildenbrand (Arm)
<david@kernel.org> wrote:
>
> On 11/17/26 00:06, Jeff Xu wrote:
> > Hi all,
> >
> > Currently, GFP_HIGHUSER_MOVABLE includes __GFP_SKIP_KASAN (commits
> > c275c5c6d50a, 70c248aca9e7, and 0a54864f8dfb), allowing movable
> > userspace page allocations to skip KASAN page unpoisoning on allocation
> > and poisoning on free under CONFIG_KASAN_HW_TAGS (ARM64 MTE). However,
> > GFP_HIGHUSER does not include __GFP_SKIP_KASAN, even though it shares
> > the same kernel-accessibility contract in include/linux/gfp_types.h
> > ("for userspace allocations that may be mapped to userspace, do not nee=
d
> > to be directly accessible by the kernel but that cannot move once in
> > use") and differs only by !__GFP_MOVABLE.
> >
> > Moving __GFP_SKIP_KASAN to GFP_HIGHUSER addresses the performance issue
> > below (following up on the earlier drm/panthor discussion [1, 2]). The
> > swap issue from that discussion is not addressed by this series:
> >
> > 1. Performance: For every 4 KB page without __GFP_SKIP_KASAN,
> >    mte_set_mem_tag_range() tags all 256 16-byte MTE granules (via
> >    STG/STZG and DC GVA/GZVA) on allocation and again on free. In
> >    graphics and UI workloads, DMA-BUF (system_heap) and DRM/GPU
> >    (shmem/TTM) buffers use GFP_HIGHUSER; while steady-state rendering
> >    reuses buffers, window resizes, surface transitions, and app launche=
s
> >    synchronously allocate and free tens to hundreds of megabytes (~32 M=
B
> >    per 4K RGBA frame) on UI/compositor/render threads. That takes a
> >    significant share of the 8.3 ms (120 Hz) / 16.7 ms (60 Hz) frame
> >    budget and thrashes CPU data/MTE tag caches (especially on
> >    cold-cache free). On Armv9.2-A, skipping KASAN cuts ~32 MB DMA-BUF
> >    alloc+free latency by ~80% (~98% faster close()) and improves the
> >    OpenGL score of an app-loading benchmark by 15-23%.
> >
> > 2. False-positive KASAN report after shmem swap-in readahead [1] (not
> >    addressed here): when a shmem page is swapped in,
> >    swap_cluster_readahead() also reads the neighboring swap slots and
> >    allocates their swap-cache folios with the gfp mask of that shmem
> >    mapping. A neighboring slot can hold an unrelated page that
> >    userspace maps with PROT_MTE. If the mask lacks __GFP_SKIP_KASAN,
> >    that page's folio gets a KASAN tag in page->flags. When its owner
> >    faults it in, arch_swap_restore() writes the saved userspace tags to
> >    the memory, but page->flags keeps the KASAN tag. Later kernel
> >    accesses through page_address() then use a tag that does not match
> >    the memory and are reported by KASAN.
> >
> >    This series does not fix the readahead path. It only removes one
> >    way to hit it: shmem mappings that use GFP_HIGHUSER (e.g.
> >    drm_gem_shmem_helper / panthor) now pass __GFP_SKIP_KASAN to
> >    readahead, so the neighboring folios no longer get a KASAN tag.
> >    Shmem mappings with other gfp masks that lack __GFP_SKIP_KASAN
> >    (e.g. GFP_KERNEL) can still trigger the report. That issue should
> >    be followed up separately, for example in [1].
> >
> > What changes for users of GFP_HIGHUSER pages under CONFIG_KASAN_HW_TAGS
> > (other KASAN modes are not affected):
> >
> > - Access through vmap(): nothing changes. Those pointers already carry
> >   the match-all tag and are not checked today.
> > - Access through kmap_local_page() or page_address() (for example
> >   ramfs): accesses are no longer checked by KASAN, as is already the
> >   case for GFP_HIGHUSER_MOVABLE pages.
> > - Buffers that the kernel itself fills (pipe, FUSE, kexec, RDS) keep
> >   KASAN checking by using the new GFP_HIGHUSER_KASAN (patches 1-4).
> >
> > GFP_KERNEL, GFP_USER, slab and vmalloc() allocations are not affected.
> >
> > Patch 1 adds GFP_HIGHUSER_KASAN
>
> I really don't want us to spread KASAN-related GFP flags in the kernel.
>
> There must be a proper way to abstract this.
>
> Why is GFP_HIGHUSER not sufficient? We were already told that this is mem=
ory to
> be mapped into user space. Placing data structure on it and handing out p=
ointers
> to that would already be a bit questionable.
>
> So what are the ways to avoid GFP_HIGHUSER_KASAN?

I think the idea behind GFP_HIGHUSER_KASAN is to make it possible to
skip KASAN for GFP_HIGHUSER by default (for most of its users), but
keep it for some of the users which today use GFP_HIGHUSER for their
memory allocations, but could benefit from the added security. As per
the other patches in the series:

  pipe, fuse: use GFP_HIGHUSER_KASAN for pipe buffer pages
  kexec: use GFP_HIGHUSER_KASAN for segment pages
  net/rds: use GFP_HIGHUSER_KASAN for message pages

That said, I'm not familiar with any of the code mentioned by those
patches, so I can't really tell how much they would benefit from KASAN
or if their choice of GFP_HIGHUSER to begin with is correct.

Best,
Tomasz
