Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA16C4B1B29
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 13:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788443392; cv=none; b=s0WN6o5mvpfnBfojus04alnYh/Y6KIbNxsL6VdJJHWxKCBaCOcPifHmELBuWq1PFh7E6Jrwd139fvLAC815lIgRhHvgrPUKp0idY7XcVPSxrA6ZvB+s2xJp6YBJzCSXQ7Yc5lTvC7sF+9zKDj2tkXcbC7kk4mgyHflXCjGxBdRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788443392; c=relaxed/simple;
	bh=tSyD1Hrg7szl6jqzgDqZId8g0ww2LMpu6Dfemvgzz8k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CuhsZaQe4t1ebjYbhFiKWPv4aedkhbnt+z7CoPQUsTmYg9jZ454Ku1xIU5ZANVzN8IfS1N0pQbeakqB0sQ07l4TMHttnO0Rw2e8AFDs1YpQPZzSibw7au6IA1vIs8k06WgRb8OyJPLmCZu6i023GwhWQaClmOOqlrxiJTGhO6F8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=MpPJsuDe; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="MpPJsuDe"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-936e393176fso197558185a.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 06:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1788443381; x=1789048181; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=W0FzzBf86DLShcrb30vlY9xIuH5mW18Cg/ZW31lMTS4=;
        b=MpPJsuDexzOd7SuYo7TZrLszXuq+B5jx0n3e880yaVs+/VWFG0FA+XKvNrgPxPQV+3
         iEe092RSaGDKUx33b50nHCBVRyTT/H9HIp2NlCKfeuJBKAnZ3FgCmkSJt0g/7n0HOKLM
         mkugSzMVSZyJ8EvZA94i32GgC0FDe51SSik/DSmNZi/kk2hWxsO3Pf30Y2Sz0fiER3cK
         JFd07dZrt7iVrfPZqW0am5ofXh7LkRiONBBylGiSnj9yl6Plt5y/jcd3EwTor5LPy7GL
         g8nl9Sy1otolDHEXwK9YokB2KHmse4yIKASpWQZBRvYjV4lUDLkcxWdKds6yEgne3Jt4
         yZfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788443381; x=1789048181;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=W0FzzBf86DLShcrb30vlY9xIuH5mW18Cg/ZW31lMTS4=;
        b=NTnrXnFwRHoijG46+a+1hFZ8IcPNbbKgJ0l3jnDKU/1BQ7DkiegCqvGEWTf7ZDpVFK
         bTeMpJm240os70ZLtBIrYY5RwoSRXmrbgV2J/K3B1K5lW+FbD9oC5padSvnYJ3d9YTLH
         PD0EmWuQIyh6jqkVlmRL1zYvCFTlIX2cxMyPLc6bNGKfcRN4C2fGt8oufiATF5aUYD4g
         8mojVfSOantWl47QWF96IKY60nLFIgZIPGweod7pVZYcq4o1Sep4ePtr2wTjCf4HB4Ls
         6ztLkYWcsl2VSe3zGJo6p2cB4/OESJr/FQyrFLoIbELkE5FJPxQM7p2FxFE4qBlu1lLh
         jwrA==
X-Forwarded-Encrypted: i=1; AKwUvBw5VG/2+nEHAvuF/TeVLpvAEw8QLiGzDDZxFREIILgELunfQlPcEEt3h/xb+n10+7VutGh1al2hiESBclw=@vger.kernel.org
X-Gm-Message-State: AFuF++mUjK2tooaSM7naZjNjy0XysevRfG8ib4XockvnfPP0yiYaRJMR
	gn/CX2wplmeJfpMYEdx9S58bP+ud07zEXpyxpqARxjbMx/0aWCx2gTWu/O5+XZYPBdE=
X-Gm-Gg: AYBFou0kXbrj4ujqFOyal7VBgECDYw25J1lVBxUV2e2Yx1Ypfvute4rJQKwXI1C2jcB
	JgNRmAws1ZR2WP8BZWUyYigscterJgGfQ0KFgUywuyxbCI7r4wmrGJvWaw4lrh3GZvyvBrlwxjg
	V7os9B3zxLiLfOF48yWff5o5QHF3Pk7hn/3Ak9I3zhhswsSjWzsex902iELG1z/MzH7t+1Oy6Dt
	jFvjQ5qjShDsMEbR2fmBZQuRevda8y6m6ZY45xmr6hFI4kgDoarSV7c9glN7c+y5oAMp/Jy1iUR
	hnCEGVlzmjl4ALsHkHftSkW6ymw6IZQQyKh934u/E8EfHdf0Rb7eA6vArcNT405LozDfKjGPaFP
	pba6Ym+7GU0E8kVuZZ89mLqWDRCMJn0grCD+G2OLKpNOX0G6ac+jazFdY4lGhHsrDxhMFpDwoCE
	hsn1hDkTs8BNHz2VCMrjbYy8jiIRkLnTRip8m4RRq5M52GCN+t0XJuAw6POuP7z1BSEXwp96afc
	pFpbARV5rul/HMagR9v9bicK+gSXM4/WQAu0j5WoPJIMw==
X-Received: by 2002:a05:620a:47b6:b0:936:576e:227b with SMTP id af79cd13be357-93960f3c98amr1203618685a.24.1788443380734;
        Thu, 03 Sep 2026 06:49:40 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9395f398a18sm497088985a.37.2026.09.03.06.49.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 06:49:39 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1x27ow-0000000H8XN-3MX1;
	Thu, 03 Sep 2026 10:49:38 -0300
Date: Thu, 3 Sep 2026 10:49:38 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: David Hu <dhu@x6u.co>
Cc: sumit.semwal@linaro.org, christian.koenig@amd.com, alex@shazbot.org,
	ankita@nvidia.com, chriscli@google.com,
	david.laight.linux@gmail.com, dri-devel@lists.freedesktop.org,
	iommu@lists.linux.dev, jmoroni@google.com, kevin.tian@intel.com,
	kpberry@google.com, leon@kernel.org, linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	nicolinc@nvidia.com, praan@google.com, sashiko-bot@kernel.org,
	stable@vger.kernel.org, viursachi@google.com, xuehaohu@google.com,
	Leon Romanovsky <leonro@nvidia.com>
Subject: Re: [PATCH v8 2/2] dma-buf: Split sgl by largest page-aligned chunk
Message-ID: <20260903134938.GI2890729@ziepe.ca>
References: <20260901170849.4052816-1-dhu@x6u.co>
 <20260901170849.4052816-3-dhu@x6u.co>
 <20260902120832.GB2890729@ziepe.ca>
 <CABdL-LTO5OKkDmtXpiLury=2n6q6Rcm42_qqz8U+JkEu=v886Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABdL-LTO5OKkDmtXpiLury=2n6q6Rcm42_qqz8U+JkEu=v886Q@mail.gmail.com>

On Wed, Sep 02, 2026 at 07:07:50PM -0400, David Hu wrote:
> On Wed, Sep 2, 2026 at 8:08 AM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> >
> > On Tue, Sep 01, 2026 at 05:08:49PM +0000, David Hu wrote:
> > > From: David Hu <xuehaohu@google.com>
> > >
> > > Currently, `fill_sg_entry()` splits the scatterlist using `UINT_MAX`.
> > > This creates a non-page-aligned DMA length (`0xFFFFFFFF`) for the
> > > first entry, resulting in non-page-aligned DMA addresses for all
> > > subsequent entries.
> >
> > This patch is fine, but pedenatically a scatterlist's entry limit
> > should be bounded to dma_get_max_seg_size(), though I don't think it
> > helps this. Operating scatterlists at the size limits has proven
> > problematic in a number of places already...
> >
> > > In addition, a non-page-aligned sgl length will trigger an edge case
> > > in `ib_umem_find_best_pgsz()`. In case of a discontinuity in later
> > > buffers, we will have a `va` with lowest bit set to 1. That will lead
> > > to `ib_umem_find_best_pgsz()` always return 0, and break the promise
> > > to find best page size for the mapping on the NIC side.
> >
> > That's an IB side bug, the newer logic that joins adjacent SGLs should
> > have avoided it?
> 
> Hi Jason,
> 
> Thank you for the review. I think you are right on both counts.
> Regarding the IB side, the new SGL joining logic in
> `ib_umem_find_best_pgsz()` indeed avoids the issue. `mask |= va` is
> skipped for artifically split, contiguous SGLs. Since Christian has
> already pulled v8 into drm-misc-next, I won't spin a v9 to avoid
> creating unnecessary noise on the list. If you prefer a followup,
> please let me know.

Nope, I'm fine, it just explains why it wasn't seen in other
tested. You were backporting and mix&matched things. It confirms the
upstream kernel was fine from the start.

There are other importers besides RDMA, so I still think that this is
a good change regardless. Having each segment remain page aligned, and
staying away from ULONG_MAX that might trigger overflows is a friendly
and robust thing to do for less sophisticated importers.

Jason
