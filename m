Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793961919;
	b=doN7+SD+ueEpuEESyw8x/qjvVMpp9bMtVzXVgkhS9GkBJUAM/bQ5tiZSi5J+u0SL/aRb
	 eHX0z6YsXoLnt0Q1P07D1Sfrj9oG2UQ1UmGuHuna+SY+oDFOQX4ZnbHTwWRpeA6gNBQBU
	 JOuNj6k9oTgZCbfIdJD6wnfGC8iDKF3WePVhqujANKSoa+WttAuFsYLtd86bpk5pJmMHO
	 MnobVBLmmkZj/3V4dbyCFZkb1nl9AEQ/5caNOIAuKVjoEtuA+3I2w7Br0DLMxMiw+o9Cf
	 NZnGsAlo3F7JdH4NIlZ7e8R+GQAPiI5uEMw50aasA7ka96JdNdlTQUrNTx1eX5/BDlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793961919;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=6ysUKDhkycj13Q2P+bjvds2QR5Xb4PbnZNX+l6BEN+k=;
	b=JBJbysELkz1PpjQ2B9WKWiXSUS/+5LCBrYNVsWqATwzDclh8IcRQq3WWpaAmGcLOgQKQ
	 P7LUsm7KJ37eBlBjaWMflxJlcC2SaAH5zKy71OQJcvAgrt6AHr/OIDUzWQffrpwSLuEUF
	 undacO+B0lpDKL5PkbLfXAuhslOlRhjEkxUrISJjxYdPetQZdM4I13pR/CETFNqwP3seR
	 GUvb7ADi0uEKwNwupBV6QCGjBrBlrXB/05SboWUsRiyg4h9R2E6JaLmLE2/ZeT0eXDVnF
	 Ql6Lm/uaS9E06a+DxYo4+o51Ev0thck8LsjDCjLSHzRVJAkyLUYMEUxCSpLEDZY3+AA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=cxI0McVE;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B3A606A32C
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 10:45:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58B3A606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=cxI0McVE
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so4534615e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 02:45:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793961918; x=1794566718; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6ysUKDhkycj13Q2P+bjvds2QR5Xb4PbnZNX+l6BEN+k=;
        b=cxI0McVEZxvYVPSgVvIQV5DYjt6Ul49jgRYb8ULILj7HzTvDDg6XMCwmvIxksapdoV
         DNwMwogXSW2Ra1Sk4XmyjuYCGrtYj0xUtW0PWlmt1/Immcy8dqz+hHBJlXf6luqHht4e
         a7tALuhWxrmIkYKz7/ovpz2IQGjFNHgQHofjvypTpbX866JoVqhPXsiuVMfUsIW9d3gw
         TzyPSI97WZpDz5zDya5TYPrVp3jgeNZcvTYPjlmJG6EustmHJ4PnPuH/AUwNMGM+i/Og
         FH4GavtEXnIiTRsferH1aH/s1fKo0NEEYtUHCLFVr+d9qw0jnmkK7fUZbRnkpkAMRXbS
         LtZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793961918; x=1794566718;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6ysUKDhkycj13Q2P+bjvds2QR5Xb4PbnZNX+l6BEN+k=;
        b=q0owszx0s4D3B71rngxFWI2dNZw0NFWWS91ip8sQnq1zOW2jpexa8aXZPi1K/MxZ68
         PoA1ELVxoBS19ytYu0iE5TvXw4Jzxuy7IfFgXPm8OWu9FtCc2q6w0N/YSpQuMnGCBspH
         AcR2aSPFKOdjI+FJZlaKbUwmoIFokJXzWvEG8t1H0/ejghTS3Gma4Si24KBLXGfvSNAQ
         YpY1oYqkWgCv5tv0TBw5BHV9LCkFx8TAWhiHO1SvpoizohT2ddE7LozuJA9pNYDmWHkf
         6HGDZ7XnBW+tz59wSuZ13a9meMJiPwoZjtjiFrpkGp3kTK8h9SBASJcKJefjzHEwrC63
         qQOQ==
X-Forwarded-Encrypted: i=1; AKwUvBxguNgjKdc3w7MFL43/63CA41g2A6uw+go2VSBwQcraeDddAnxxBshYekY3uitiqS/BbRFreClXPtLCOvA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8+0FDANpGUK78j0GxDiS8L3ZkHRPn5j6WdYcBoF9YipE8Z1Qc6
	beQmkhoRFBXElEoj+gdI/nULuStWDf7XUNXwxwr8e247aTFetAu8aq5jTteXJ80zrw==
X-Gm-Gg: AYBFou1GYmHLCaBxH4NfM6gRe9XdzpT5J0ZYOXNqzwWK+ZJbCAiNrVOS25Rf8KcnTN6
	x16R2+uUy9Tc12t5nB5ili09qQDv/WzEVWZpYxYfR/8LVW39sXnnj3GqCDpEhAulH2nsvw0HpSF
	NBwgYxARO08XvQxpC3+LWLBnyjPpFDtLDauHtIWTsiz+ACF5FFH7tYuS8UcnDYyEJX4D4G9tbiN
	MypG0GJ7fNvbpMEyRyuyxQa0v4h4Gt2+3/RiObb4CqqWfisPjN0PBWXj8CQImykoIRt499v3Gl4
	TvIOY/eF4Q3ItKm9pWfLflmDxkvipuyBYOf01X1BFQE0qmIDAVakWX4s4HtiyY7u6LMc1dqThl5
	LKqj6M4rwf3JhfPxMUIZZIuYI8oPS5DDgyV0KA+x+RBitPMGhp5Nxyd0/jI8yFjpQnSXBfshbKd
	KHTvy83sEdVGfWMgaOwUyKuWgkpmd7EHiC43sDhOjDrdAM3B4aZt40R03DaideJhVxc5dt2aYWn
	/TAcrmyzjXnDLeyHA5m5EgGvHhF+g32ZdxoXwsrWzyKxmqxsNY2dGYV5I/avrGOMy6SQ82DR2JV
	3PDyVfv39c8ddo/NE05/R+TDeh4iUV5ObhiMoM+ycI8YlJktyX21YyG1YCjCPJjP
X-Received: by 2002:a05:600c:3b02:b0:4a1:fe55:88ef with SMTP id 5b1f17b1804b1-4b6df5eab2emr32006075e9.20.1793961917300;
        Fri, 06 Nov 2026 02:45:17 -0800 (PST)
Received: from google.com (0.182.34.34.bc.googleusercontent.com. [34.34.182.0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b73d28cb10sm16111895e9.0.2026.11.06.02.45.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 02:45:14 -0800 (PST)
Date: Fri, 6 Nov 2026 10:45:09 +0000
From: Vincent Donnefort <vdonnefort@google.com>
To: Sumit Garg <sumit.garg@kernel.org>
Cc: Will Deacon <will@kernel.org>, brendan.jackman@linux.dev,
	catalin.marinas@arm.com, rppt@kernel.org, akpm@linux-foundation.org,
	sudeep.holla@kernel.org, jenswi@kernel.org, robh@kernel.org,
	mark.rutland@arm.com, ardb@kernel.org, thierry.reding@kernel.org,
	david@kernel.org, danielmentz@google.com,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
	op-tee@lists.trustedfirmware.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/8] arm64: Unmap FF-A lent memory from direct map
Message-ID: <au2vtZFyfUVWeils@google.com>
References: <are21BjeS1O3RYE3@sumit-xelite>
 <aruh86rd5FMv2i9G@willie-the-truck>
 <ar5TPvANFUoosxGW@sumit-xelite>
 <asOAYODGZa-7EIV1@google.com>
 <asOD31rTX6dNfD1o@google.com>
 <aszdnInyJxLhSQRp@sumit-xelite>
 <as3798SFCfKFirag@google.com>
 <as4ATqhp0bPI03PA@sumit-xelite>
 <auILvMVSXk9pZh6M@google.com>
 <auQ5hCdPFz0BmvDG@sumit-xelite>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <auQ5hCdPFz0BmvDG@sumit-xelite>

[...]

> > > Yeah I saw that constraint too, let's leave it for future extension
> > > then although having this reordering dependency fixed will be ideal.
> > > 
> > > >
> > > > So the only case it would work would be when a reserved memory has set
> > > > "linux,cma-default".
> > > >
> > > 
> > > Let's rather just turn DT based default CMA pool to support PTE-level
> > > mapping and keep it configurable via Kconfig or cmdline or DT.
> > 
> > If we need a DT declaration anyway, a Kconfig and a cmdline option aren't really
> > necessary.
> 
> Agree, it rather makes sense for DT independent generic CMA pool.
> 
> > 
> > Also, Rob wasn't very keen on having a DT option for the reserved memory and
> > suggested to have a compatible string instead [1]. So perhaps we could have a
> > a separate driver that handles the unmapping.
> > 
> > 	linux,cma {
> > 		compatible = "shared-dma-pool", "unmap-on-alloc";
> > 		reusable;
> > 		linux,cma-default;
> > 		...
> > 	}
> > 
> > That "unmap-on-alloc" driver sets the memblock flags and register some cma hooks
> > (to be defined) for cma_alloc/cma_free where it unmaps/re-maps into the linear
> > map.
> > 
> > The nice property is optee won't need to be modified anymore. The downside is
> > the entire pool is now mapped at PTE-level.
> 
> Sounds reasonable to me. If folks are really worried about performance
> with generic CMA PTE-level map then OP-TEE already supports no-map based
> reserved carveouts for protected DMABufs too.
> 
> -Sumit
> 
> > 
> > [1] http://lore.kernel.org/all/20260902172436.GB1440252-robh@kernel.org/
> > 
> > -- 
> > Vincent

I have just looked deeper into and cma_alloc can't unmap automatically the
default pool. Callers expect a valid linear mapping right after the alocation.
dma_direct_alloc() and dma_direct_alloc_pages() zero the allocated page,
dma_direct_alloc_no_mapping() runs cache maintenance on it, and the userspace
available heap /dev/dma_heap/linux,cma zeroes it.

Also, it isn't possible to use two compatible strings for the reserved memory.
The registration stops at the first matching compatible string. Layering drivers
won't work either.

So while the pool can still be generic and serve as linux,cma-default:

  linux,cma {
      compatible = "unmappable-dma-pool";
      reusable;
      linux,cma-default;
  }

We can't escape providing an additional API to unmap/remap in the linear map. 

-- 
Vincent

