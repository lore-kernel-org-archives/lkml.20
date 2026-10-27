Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793122720;
	b=txOuyTgabM+M6BuRNZhijxiEQErPzvKuQm3UyyKlXANG8fD7mMu32eBf+18xGN2KE0Hw
	 ulSzixkzVa6g6kxk5/7iIc8Nw1S4VzY2QzmoVEjlt0Jerv0kpFvnxlHzPBFVIx2jlY1zq
	 8PlS9YLfTCqsyXKP0MvsW/onklNt9z0/u1AMtbFSiX/1OtRNp9bpI95818KtXnJKDHSKM
	 R1LgR5s/U4oCSsRVYVvpcuh77PryLDhj//IAVoayKtlayJKe7UiSoJN3MvYoIwRo18j0X
	 F7j+kX1ClM6Lc5PLwim2qzQH1b+xh+VZxUme0LgRCz+itIWufFLW9rdLeXX6YwDhzZQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793122720;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=AYi2YiR3kh+gzZk6CrM84tIidytqPHRNR76c45jsmXI=;
	b=bz2sT2+tHm+5i4+ecY1/P8iQ8xDrPjT7JqrqK8o2KNRTXdRermVO6pq3pS4cipDctv4t
	 3e76WaQ7aPIRsSNjzWAVCNH/r/3//xBq7+/WCR9I0Y56nFvHHcXEyYV6IZkqEFOuGvZFk
	 VvN6BUvu9mJuvVg5e+srzGoNCSJ8JE3+fAmoXoOD5h5tIidC0Qioe1vfBij+cd5VOz4hh
	 k74daHqqwM/z+A0uqByC5RcPbVm8Ay4WrvDOpc/qrNLaj9HmT/uvvnh/ducFtB8beU+KE
	 mxn0NUOmmCVXpgBdvlGmxXL9we4p4iSowoJ4KtinRBIhur5qZPSTycxQaew4T07kZ/w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=TMbu8PxL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71C02606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 17:38:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71C02606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=TMbu8PxL
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b1aa36fc0eso1006a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 10:38:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793122719; cv=none;
        d=google.com; s=arc-20260327;
        b=sNcejGbip6NUgT6MBGdy5e5D17ht8dct5ALRp65MANqj/w+1W02G2aBvke3gcy9Uss
         /XVeg3DWbseaSSc8jI2SyU5BaT4RXXC/jUAlu3DU5KxhEeFrdRcQRZ7lURI++lvz4umH
         m3A7wwGVqfYegc4gdeG8y9kvpLIR9EKSEoLEhFy5I8gxxui8r2wXvRl9WpISLGXCk/kM
         RBE6fqHK8+WufA7O4rl0H2McTrp19ykrUGJ1SjuD9ZkrK3qwenV8adqsoH2EtB673NDs
         9l4gPUHenz4+epU0xcT1UGDU8BoV+sdPwEC65nSvoHC3ShRgrnvBQSzbIFxlovtC88v8
         ysSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AYi2YiR3kh+gzZk6CrM84tIidytqPHRNR76c45jsmXI=;
        fh=t5hTSbBIoI42BFGZ4l5YBerqJGyNceMx0DkbndKtGik=;
        b=kTOh4FRFo1qj6v+UAx07pnsVLE1SIDoW45R4tRHzlF4Vml76/lIDjZ/q3fxRQVTcHg
         Pexn/ZG2BI0+NoF/Wqx21WNCtd3x32cx9PHVJ8RcTIFGMAG/l99FiKd+p2OmPoGJFo5j
         JltnUi5CdHPxqKYEZvGRy2AsEuC89wTP0VGz8rbOiYlJXG4m67Vv6SY0AihbGPDBsF2J
         Gxke7WBPcrYHPGZ5kVqP+fsHLQOFaE/2n100bDNJOQmZb1EAmV9SbdKcF7OjlQdt+txG
         DY4dK8x1JkRRbryeTtJ/FnmUb02f+Kj4lBguFK+4Bfj+zlQRZ1mZPca+ygKZFZ/bsv9m
         9hMQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793122719; x=1793727519; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AYi2YiR3kh+gzZk6CrM84tIidytqPHRNR76c45jsmXI=;
        b=TMbu8PxLhpBm5Jxc+UmD3OrKaB4W+TrO+HcdLK/qemtnz4THsUOJblzPEUuFNQdsAX
         xVppISd9HZVk1k52dXnBDZH5JY2olDDSO95++GZTKXt09LrvWQXh0bdmoGTLejAK1OLt
         bxZAkxblGRQiGMML4G9URFa8xQWaDlL49VzCVKznumP2+MyKHmYFopFrp7Vomsp36yZT
         yCc03PZELOyQAfukDHyz3vOgAGIADyvURsSBd2Fsfa6RJBwz/JWJp+HSEvxtvlpPmo9U
         hDMP72JYBeOYHs8QzW38V9/J7Ub9YckAD4l0ZmHIvx0H8IlISifANZcUpwjvV3oxhTkL
         uyiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793122719; x=1793727519;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AYi2YiR3kh+gzZk6CrM84tIidytqPHRNR76c45jsmXI=;
        b=FOCfyKLxX5zWKKXCK+GhYHMQeiYSvnrpf5FoxEfb68RKkbpC9WfPTP0Zz805mEDXYP
         HgovaYTiQbENO8FlewMFmjmQC4xP3evWwW7vTMKPbJ2/lhk/vxY5dUSQpYzx9fs9Uhc6
         gjMsj+gWB+BHlolat0SzU/YlvAbmdmcyjSmL58YKwse7OKnwUXf2M38Azp+iXOcvme2Q
         t9U5x9hgV3YHNxsh1s9E4CGSaQaid6+JlRfEQ3EdK29PpMLz3xzrSDUuxBMdxm354sRY
         jzTfwN1K9hS6dMOx8+jmdeMOddGmhT72qgXig8gLa7g7NMdV7YxkS4fobpvHHC9auKLF
         PYIQ==
X-Forwarded-Encrypted: i=1; AKwUvBzLZa5HALLuqUDMSXuebimt7FJTN23dnMKtn04pWcTSHIqoeAmqEseYqRReJNnYt5zjH/fPlCOgSY+KWE0=@vger.kernel.org
X-Gm-Message-State: AFq9FYI9WksvIJ9smHOKSqtEeVcEFUEb9sC+m6XbQ2X2W1e9xrObBl/a
	fdo40055OjadKeB+52JkuVIHKAWD6JmIdeq7CEa6W8gOqZT+QboH9mO9wdQkgJVIY7pibF17D8r
	cgFUCzQ8G/rMEFnlVGhTjiXCStZzQE5sagqT3YhFp
X-Gm-Gg: AYBFou2fYIDUEKYNWubJdEuLpw2de2Zny99ZW7+FneLGX7udgeGfyCOgd+6l6KwhDck
	4OQJz7huyBXXh0uFIJzCGmfcUuN85dkTxwK5nEjHwsHANyhTqwegRoYuO85wvVQQOQxqyKk4ExH
	Qhyx7ArSDFn0hGG1o7OQQwXAZZwam3tGxSrdBY/X4idRYfytq3B/sbVjWtrMU8E7VlpybuDUdEg
	801bTWwQ07rYSxBHObJoY4Lpiq3iajbcZ14rSwTtfHQJQFe4Cwn2dUoXOn9E/Abr99v4HgsCy8N
	gntmmEzIvWOkhDl8icN/ay6qjur2RyMX5JRktXMN+Sw+c8hij32bJZ5k1DokK0nSQM9oRdqz+sA
	MmPAPnFgpeXcEmevNQY+ZK9cXbaK1wHjehVDSC8sdAoFgOP4KbiGi2Vm+RZ2X+h3eNQ==
X-Received: by 2002:a05:6402:a2cf:10b0:6b4:597f:50ed with SMTP id
 4fb4d7f45d1cf-6b4994c5b30mr2214a12.5.1793122718174; Tue, 27 Oct 2026 10:38:38
 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027-fixes_core-v1-0-6f74bec9a5bb@kernel.org>
 <20261027-fixes_core-v1-23-6f74bec9a5bb@kernel.org> <auBityGTDQjXURWg@gremlin>
In-Reply-To: <auBityGTDQjXURWg@gremlin>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 27 Oct 2026 10:38:22 -0700
X-Gm-Features: AclHuK8I8xcfhrxH9JH4rYz28CrMoohsxda9QortkIHbiI93aH5ozWron9iLPAM
Message-ID: <CAJuCfpHEHPNj9DKOGbVHYCUsmLf==-XkhzBAR94gNt_ErhdnnA@mail.gmail.com>
Subject: Re: [PATCH 23/46] mm/userfaultfd: write-lock the VMA before waking
 waiters when unregistering
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>, Qi Zheng <qi.zheng@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Kairui Song <kasong@tencent.com>, 
	Barry Song <baohua@kernel.org>, Axel Rasmussen <axelrasmussen@google.com>, 
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, 
	Baoquan He <baoquan.he@linux.dev>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Michal Hocko <mhocko@suse.com>, Kees Cook <kees@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, Hugh Dickins <hughd@google.com>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Pratyush Yadav <pratyush@kernel.org>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>, Zi Yan <ziy@nvidia.com>, 
	Lance Yang <lance.yang@linux.dev>, Rik van Riel <riel@surriel.com>, Harry Yoo <harry@kernel.org>, 
	Alistair Popple <apopple@nvidia.com>, Nico Pache <nico.pache@linux.dev>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
	Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>, 
	Matthew Brost <matthew.brost@intel.com>, John Hubbard <jhubbard@nvidia.com>, 
	Peter Xu <peterx@redhat.com>, Will Deacon <will@kernel.org>, 
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Nick Piggin <npiggin@gmail.com>, 
	Oscar Salvador <osalvador@suse.de>, Minchan Kim <minchan@kernel.org>, 
	Muchun Song <muchun.song@linux.dev>, Xu Xin <xu.xin@linux.dev>, 
	Chengming Zhou <chengming.zhou@linux.dev>, Chris Li <chrisl@kernel.org>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, 
	Youngjun Park <youngjun.park@lge.com>, Gregory Price <gourry@gourry.net>, 
	Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>, 
	Ying Huang <ying.huang@linux.alibaba.com>, Jason Gunthorpe <jgg@ziepe.ca>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, kexec@lists.infradead.org, 
	linux-fsdevel@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-cxl@vger.kernel.org, stable@vger.kernel.org, 
	Josef Bacik <josef@toxicpanda.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 1:43=E2=80=AFAM Lorenzo Stoakes (ARM) <ljs@kernel.o=
rg> wrote:
>
> On Tue, Oct 27, 2026 at 12:17:43AM +0100, David Hildenbrand (Arm) wrote:
> > userfaultfd_unregister() wakes pending missing faults before clearing t=
he
> > VMA's userfaultfd registration. With per-VMA fault locking, holding
> > mmap_lock for write does not prevent another fault from queuing after
> > the wakeup but before userfaultfd_clear_vma() write-locks the VMA. That
> > waiter can then remain asleep indefinitely.
>
> Oof.
>
> I guess userfaultfd_clear_vma() only implicitly takes the VMA write lock =
via
> vma_modify_flags_uffd().
>
> >
> > Call vma_start_write() before waking waiters. Existing fault handlers
> > queue themselves before dropping the VMA read lock, and new readers are
> > excluded until mmap_write_unlock().
>
> Clearly an oversight from the VMA locks work. I guess was always a Hercul=
ean
> task to catch every single point at which there is an implicit assumption=
 that
> mmap write lock ~ readers (esp. faults) excluded.
>
> >
> > Fixes: 29a22b9e08d7 ("mm: handle userfaults under VMA lock")
> > Cc: stable@vger.kernel.org
> > Reported-by: Josef Bacik <josef@toxicpanda.com>
> > Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
>
> Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

Reviewed-by: Suren Baghdasaryan <surenb@google.com>

Thanks!

>
> > ---
> >  mm/userfaultfd.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/mm/userfaultfd.c b/mm/userfaultfd.c
> > index 669f71d485d02..7e30b5ff17be1 100644
> > --- a/mm/userfaultfd.c
> > +++ b/mm/userfaultfd.c
> > @@ -3991,6 +3991,9 @@ static int userfaultfd_unregister(struct userfaul=
tfd_ctx *ctx,
> >                       start =3D vma->vm_start;
> >               vma_end =3D min(end, vma->vm_end);
> >
> > +             /* Prevent new userfaults from being queued after the wak=
eup. */
> > +             vma_start_write(vma);
> > +
> >               if (userfaultfd_missing(vma)) {
> >                       /*
> >                        * Wake any concurrent pending userfault while
> >
> > --
> > 2.43.0
> >
>
> --
> Cheers, Lorenzo
