Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 816D7470EA8
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 10:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789984922; cv=pass; b=LSMEd1XQAMyBMMadfsCd+zDZOp5jhPE5EtvSO1Sn/LVsKWn0t5b9EbjWf1eP7yIhL4gKCh+SW1eZH12pKJb/WaM5b1eFlBpcvd5ZjIYRBL6iPz2fIAUgSxl5CXs5/6OEfBv9O0HCibF0yI2CIGFOV4MaBH/L6faseMaX4taC6VA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789984922; c=relaxed/simple;
	bh=C0u7dFIOwFw7/Fou9k8GunftPf/Pv/MvXmJEJ9Wf4iw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g4QWVY/c9mt67XKJ73es9S2oyvsPkDhs6TzsAjxXZk6dV3TzmkOjxdDArKtpSSYAHpfmBH//BicwtoUrWk9ElGbO2pcf7/QJh89FsJ1w4pqg5HyhPvE8Q+9W4STQZNseKER+cee8kG/7MpHeEQBFNCQRhaeuXXHDeWJK9KINYFM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZzlxFC1R; arc=pass smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZzlxFC1R"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-86ec25cf7ecso3430474b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 03:01:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789984919; cv=none;
        d=google.com; s=arc-20260327;
        b=RYWERMsNDezXvyBnTjw6Bwg4+hvg/bbX//5xzh9B/twaDXdoRK8gOB5SI11EnQjiML
         0TeoTfOY61CFwgiwQx4MGU57MjMdogoB6mtDRVFtARmbid9ZJTJEa/9HpRSeTgcVxiCz
         Dndtwazefye/972wxHsca8zc8hy9wU/4xnc3e6z8h/4xFHGka1MICYkRXS9QVH1coo/H
         eD8WyP72nycKeSj1imM/EVHawKcp4H9YnGb8TxfCsJ6K7i1kMkxPX2WrhQ9ots06Y8sn
         45plkPPsTBQWxc9vJhdUdq6f2ffVc5rI1sTAh07VM8mBAgHj8hppJBUNKxqKVuDcIW9I
         oemQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rtgPtMT7frKhH4WMKdwbGRv258dVgwZlagcB0deq+D8=;
        fh=K/7vO3Nt02C/b8C7H7zpEt+I8m40OIE4HRLEFQ8txBA=;
        b=blxy5lkMnx5W0mS3otMtl/1Gv3bjGYoYm6c82rH6hy5La2/sH4K/goO+H8Ipb3zbbW
         TI31Eq0fB/v2/3OvC11JmDkSR9qwMkfjZd6fBvVIeXJ5Lxs7ZmaYEmpviGqLffcTeixI
         Ecolfpf2AhpJsZAOxd/A/VIbGiUppx3SoJFgXmZAM1s364SKD3AR+0Ebb9lRtz1IsXHK
         JClDjzzwibhJDcKy45iCRJs5MGMKy1jQsNtgNhVf7T2Z9Pv0F1/UeOttwxDQ5wtwIV4w
         smm+voO9SYQZgsmI5u9qr7vOYngsaVeNceGNl05J3excuJzeoeRmMchEZ/IDWe1qdRNr
         WmNw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789984919; x=1790589719; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rtgPtMT7frKhH4WMKdwbGRv258dVgwZlagcB0deq+D8=;
        b=ZzlxFC1R189DrN3TSnXfYhpWLK28QabWnQcJ4+wU5jN31B7nigwVthzzf4P+0COfY0
         dNEgN7ioxlGortpcWozAnFnb5zQZS8JCwof/IoT8RCNcXUraPQu0pT5/H4zM1CEtoK9n
         KzuXBAXw+l7MzSuUOIN1NMjLsKcCHTMoW8YFj0PkG/9LnvEvmsy/7rUh1rHfOoHU4y4D
         pPlO3BHVPOMcSLTicIZdiceAmKVXviv1209VCuC1KelByIo86HHO/udjGtDtEqfTmScZ
         VjX0d24IGt0LJ8DAtNt+PMW5BYO5oti1bveV9E4zlrYTTkDWG6rPfiCwsmbXToQJ2Akc
         NNFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789984919; x=1790589719;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rtgPtMT7frKhH4WMKdwbGRv258dVgwZlagcB0deq+D8=;
        b=KYUplPmlT1xoi67UTvVDFm/+ZUOc6UeKVm3Au7AcK0sj/3Bla6txbamRv9i6X6ZpxJ
         F8oUg9iXKO6MVwOFihbCHJUxdi/Tf4PY0X33g6LEm69UmJEcBz6k9OfneEDMzmyqRCmy
         JZSnu2uBjO+N0tp/p2g9ViFoEIsAZwAw7FQaTgPRj/G9mTdrpqdA7faESoezDmDY5+dM
         78/nDdJXNBnJmGCXmXBi3MkCPMyPHwrTJznRbzcN7FL7nuAiDK72oL891L7uOfIOB4cb
         pHidLDmP+CxOFYadzWU92JK7bmRrdtgB8ycUUXc8gmh7BNVmJMT390ZHRaFsnzJ9fkjz
         3QKw==
X-Forwarded-Encrypted: i=1; AKwUvBzgpn5urktojM0r8HqSk00i9HsP7Ft3CUWRCrLhVw4e4gikE1zGE8HYL9bH+BxOS6kMqYKK0qW1SNHD0xs=@vger.kernel.org
X-Gm-Message-State: AFuF++kIrzWR4hctCBRbQKXUoOgKyvlwO8vxPLI61nHPRHjqVkM0St/l
	aJD8OmVFzBk5i6hbsr32AYspzmFzRYQVDmDFtdgK9YsLNVeCQ6t31X+Mx+nBwMdK2IIebCNV95q
	YcOarV0CRxi6iGCZQt5gstqzce0Ft2h0=
X-Gm-Gg: AYBFou1UqRW9I8mYDDb4mFLiVRjrjhXK4A4/JoW6sy36dKTZM+IJix1tZEFPIyr6ItV
	2YaY9CcasTSIe7ItrjCupvIZEOGQWmE5QSLxMUQbCGgDfdzgdXukkYoijdardRXZczimPzMtXf9
	ipk98EyRN5yZcbZSUlsdhtW2bTvUaNNkhqZd0fMZWtNsJeBZSTR/5tuNh1otCLiD7k/3j5yw44v
	sUDO7QNtddx3rz+unbTuEbn5eUcaW0NcsAFUIEdW5sFhBXh1OQSEh40iEx6H21pUxtShqmYEjpC
	6NkVT5QHY6b1mbluSEk67THphuEhqLdO8aJZh7hSfR9ozGr5vPdR0LNRG2Owlugc262xwpMap0H
	Iixgg/eKH5Fo=
X-Received: by 2002:a05:6a00:2d93:b0:857:73c3:4466 with SMTP id
 d2e1a72fcca58-87343ea8041mr17463837b3a.21.1789984919241; Mon, 21 Sep 2026
 03:01:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAKEwX=MP=zuTnLT=coS_EpXe2KwXq=79yBnsEGXwcZZsW3S=Yw@mail.gmail.com>
 <aqJXx2vtbKaRLt3x@fedora> <aqLi6cIjD2wJwk0B@cmpxchg.org> <CACePvbUG1ApMzMdEzf-63rpjgGVNsRk21pT72OQGJpM=OtRUew@mail.gmail.com>
 <aq6cVXPLUUwJA7-2@gourry-fedora-PF4VCD3F> <CACePvbVaPDnva8X-Xmz84r7j5HjTuih-w5phpw7cerK2uPnK6w@mail.gmail.com>
In-Reply-To: <CACePvbVaPDnva8X-Xmz84r7j5HjTuih-w5phpw7cerK2uPnK6w@mail.gmail.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Mon, 21 Sep 2026 12:01:18 +0200
X-Gm-Features: AcwNN1W4zNuvHUUOGHULyeGe0PhiMgbBymHHBRLY42qLX54efbcuYBMEOcf7diI
Message-ID: <CAMgjq7CJBHkoZmg9oKNgGA8czL0djyBTCAkPz8ETm-tX=Qci4g@mail.gmail.com>
Subject: Re: Path forward for Virtualized Swap?
To: Chris Li <chrisl@kernel.org>
Cc: Gregory Price <gourry@gourry.net>, Johannes Weiner <hannes@cmpxchg.org>, 
	Baoquan He <baoquan.he@linux.dev>, Nhat Pham <nphamcs@gmail.com>, 
	Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Yosry Ahmed <yosry@kernel.org>, 
	David Hildenbrand <david@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Barry Song <baohua@kernel.org>, 
	YoungJun Park <youngjun.park@lge.com>, Chengming Zhou <chengming.zhou@linux.dev>, 
	"Lorenzo Stoakes (Oracle)" <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
	"Vlastimil Babka (SUSE)" <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	=?UTF-8?Q?Suren_Baghdasaryan=EF=BF=BC?= <surenb@google.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, 
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, Rik van Riel <riel@surriel.com>, 
	Wenchao Hao <haowenchao22@gmail.com>, Jonathan Corbet <corbet@lwn.net>, Hugh Dickins <hughd@google.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Tejun Heo <tj@kernel.org>, 
	=?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Kunwu Chan <kunwu.chan@linux.dev>, 
	Meta kernel team <kernel-team@meta.com>, Linux Memory Management List <linux-mm@kvack.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-doc@vger.kernel.org, 
	"open list:CONTROL GROUP - MEMORY RESOURCE CONTROLLER (MEMCG)" <cgroups@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Joshua Hahn <joshua.hahnjy@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 19, 2026 at 9:02=E2=80=AFPM Chris Li <chrisl@kernel.org> wrote:
>
> On Sat, Sep 19, 2026 at 6:08=E2=80=AFAM Gregory Price <gourry@gourry.net>=
 wrote:
> >
> > On Sat, Sep 19, 2026 at 03:45:03AM -0500, Chris Li wrote:
> > >
> > > I found this new concept of "compression space" very confusing to me.
> > > Can you explain the swap behavior and problem using only normal memor=
y
> > > usage reduction and latency without introducing a new term or new
> > > metrics?
> > >
> > > The normal user doesn't even know what compression space is, let alon=
e
> > > what makes it transparent.
> > >
> >
> > Sure they do - it's the amount of memory consumed by compressed data,
> > including the metadata associated with it.
> >
> > converting Johannes statement to diagram:
> >
> > >> Compression space is not a separate resource. It's page tables,
> > >> backing pages, and swap descriptors. It's just MEMORY.
> >
> >                           Page Data (PD)
> >   [page tables][                uncompressed page                  ]
> >
> >
> >                         Compressed Data (CD)
> >   [      recovered space     ][pte][swap meta data][compressed page]
> >                               |                                    |
> >                               |---------compression space----------|
> >
> >
> >                         Memory Pre-Compression
> >  |[  PD  ][  PD  ][  PD  ][  PD  ][  PD  ][  PD  ][  PD  ][  PD  ]|
> >
> >
> >                         Memory Post-Compression
> >  |[CD][CD][CD][CD][CD][CD][CD][CD]-------- free space ------------|
> >    ^----------------------------^
> >          Compression Space
>
> Thanks for the explanation. So the compression space is just the
> actual data store backing the zswap/xswap/zram.
>
> > It's actually really confusing to represent this space as a traditional
> > swap device - built on the assumption of a pre-defined size limit - whe=
n
> > that size limit has already been defined (the memory itself).
>
> First of all, the traditional swap counter has a very well-defined
> meaning. It is the size of the memory that, when accessed, requires a
> page fault. A page fault adds significant latency to memory access

Yeah I agree on this. Swap just about makes resources not directly
accessible by the CPU act as RAM, whether that is storage on disk,
compressed memory, or a network resource, all accessed through a page
fault. I hope we won't make this fuzzy in the future by introducing
too many magics.
