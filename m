Received: from mail-oi2-f13.google.com (mail-oi2-f13.google.com [74.125.231.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C2C3E6DFA
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 17:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790184218; cv=none; b=NESRsA6LZRwW4cP7ZrT4imw9yuEljzIFsQDPl9Z3AX9jGOa1a5FL0a44gvK13tHTNKblXjiyreIP1ABLJNAA5Gdq88AEL/oRGOh7cxlEGvDNEI7pcWnLAnYVlfgkdpyYpko4jRhmR1Z+Gapb3e4p5NavZxfvggGz3VFNFDk+GWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790184218; c=relaxed/simple;
	bh=t2TgzO8nwUEwjRZhrCgeKf9S8CRIcvO43oc+9yu4/Wg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tbT8BO0eZbqbr3/TWBEX9aucTLlU3mLcppNCpqVphMD5yWH/PnGRt9PHv8m1sZuFeLtpETIp0qfCkR6alYQdKSqPrjZY4H0IKpQVkWnzw0cRbZELYQcjGEyBesANhvHuxAI9ZhfoVH6+E6xRPdBoAFv1f5DuRhaRaVeCvV4FlMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=gQQYiOFm; arc=none smtp.client-ip=74.125.231.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="gQQYiOFm"
Received: by mail-oi2-f13.google.com with SMTP id 5614622812f47-4c4bf3defecso867297b6e.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 10:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1790184215; x=1790789015; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1FwE1NfmDw+YKo1XdhlQDW5TQG+slKv16o9ht1shLNo=;
        b=gQQYiOFmc7T264uw2eL6O0Ld54Bs4WlWK3nhBNV4ht6i3oNVhRmEbtKPm7uSxIDcpW
         LscrUKn9cn212x5D1YuKkEONgt9ZUD9eYtM6cT/vqlOrs2jwYeA3WRlNOcjyWfSvSdvW
         hmUtzoXFsQG0z+mYfyjcdG4XsrD7hsCTMi+uwKJdLkoPL//Nolt5nv0YZKwWcTtKHa5v
         /8lqfFF/K1UL6nK4FBPU3CxbN80Zx6oVNUAhPq5wMOWaGxB4JhV9B1m/N8A5Q8tO++t2
         uFDV+Ek9+g4V8oCVDkceiLzgjcwsHHna+UHQ2Ee3cfq+nKgtF5sMozOklRmwvzMeMcVT
         jd3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790184215; x=1790789015;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1FwE1NfmDw+YKo1XdhlQDW5TQG+slKv16o9ht1shLNo=;
        b=czcpb2MURu7pH9kUemiSC9emRnSEKg84c3FCRZOkJKO94NAY51PwiMNH1lT3HpWg2G
         AHFUENvf/bhEQT7fmC1jA3UX54mQCu2OP2y7SYcC1IEYCL9Xdeq+fW0PucN0wdZZhMf+
         FlNfmcpl4B35ikdY8bxtba2sA7hSJmyxBu3gqL/wD53knlLHS+Q+3pBB0JtxzqZdA4Ve
         ZZmwQKxIG8roiWWOF/MWDFuYQR/20WWLOsh9vJYbqxVR8QL6ZLJ9GBmUhAdtLM+OMJcX
         ufpE3fspA5XSZaRsxoIVXmVSmLYiUa1cBsn79pxwyTsyKOh+jY/t+Ag7OOGdYDYzaI80
         YUlw==
X-Forwarded-Encrypted: i=1; AKwUvBwp8Rzqm0ZqlJsvGQF0rTD5l0+BiB44uvFe7wvQjZ//1PYKY4OYKVm9obh4x4eJKjQUIA3tAC8YnHQ8G54=@vger.kernel.org
X-Gm-Message-State: AFuF++mkkVERHc/L4Jfkaxxzvfic68xx1AEZ0WVhPENUkpmgFKZRPtsq
	ruGu7VFS3FZMgr6Pd/UsGRsNTIGrru6YmTbpuWVm6ZR//S59l4+MiugUtKPFHTU7elA=
X-Gm-Gg: AYBFou0JUleqx+N9g9WZa+9UDPBBEiDvt3r0JQcm5ZxGHOQUYZGTPl7G4uMaSww2cYM
	zIj+NJiCyhGmDqZN2IRMcpxMVa8YMAOpJu1equYU8lBroZeQYgpw8rj5G3JGmpdOZfUtc1yVDkJ
	KKtzm00SEDjf2X4yyPmpYmLpmRNkxrBS0Vr5RkdivGdaxNGoUMR2lKvTeQJnAYtDE8jnOXfQjD2
	BJ0AImukerDzrtjMO3SXFsd+g3BJ+Hl5xhtVyli+Gky7rrvJfgHlZznZXe7q8tTycxKuK6YhxDR
	RKZCGHOuiPoWnTKyiG25+mwfZmdrfD+dRJTW/YCCwUSggy2YPGayQavOxFIZYEywNNW7SsN0gxe
	VMs0fZ9pRwiWHycyv3mFAqEITPVo2OCkEkOgi6bwBTFMk5yTYmX14tP6kMJs09i6Jx60+1JGDfE
	EojRtRYad/X3yDvuJzz/0GDIbjEg6P3TNKZl2ejuASharE
X-Received: by 2002:a05:6808:1313:b0:4b5:5bfd:518f with SMTP id 5614622812f47-4d5b85af4d4mr3232472b6e.21.1790184214658;
        Wed, 23 Sep 2026 10:23:34 -0700 (PDT)
Received: from ziepe.ca ([130.41.10.202])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4d5c522604asm2686648b6e.15.2026.09.23.10.23.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 10:23:34 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1x9Qgv-0000000E9nH-0xvE;
	Wed, 23 Sep 2026 14:23:33 -0300
Date: Wed, 23 Sep 2026 14:23:33 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Kameron Carr <kameroncarr@linux.microsoft.com>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, mhklinux@outlook.com,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-coco@lists.linux.dev, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev, Andrew Morton <akpm@linux-foundation.org>,
	christian.koenig@amd.com, Joerg Roedel <joro@8bytes.org>,
	Marc Zyngier <maz@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Steven Price <steven.price@arm.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Thomas Gleixner <tglx@kernel.org>, Will Deacon <will@kernel.org>,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	linux-media@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [RFC PATCH v7 02/13] mm: Add an allocator for CoCo shared memory
Message-ID: <20260923172333.GM1540250@ziepe.ca>
References: <20260921144847.501151-3-aneesh.kumar@kernel.org>
 <arKsFofudnTYpXj1@arm.com>
 <yq5aik3w344o.fsf@kernel.org>
 <arOfD6syXOgQhZYA@arm.com>
 <yq5a5wzw2ree.fsf@kernel.org>
 <arOspFxWZ1DjgcAr@arm.com>
 <20260923130611.GF1540250@ziepe.ca>
 <yq5atsng10b2.fsf@kernel.org>
 <20260923152124.GG1540250@ziepe.ca>
 <5cbe0bde-47d8-41ca-b244-bc0329d0d066@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5cbe0bde-47d8-41ca-b244-bc0329d0d066@linux.microsoft.com>

On Wed, Sep 23, 2026 at 09:28:54AM -0700, Kameron Carr wrote:
> On 9/23/2026 8:21 AM, Jason Gunthorpe wrote:
> > On Wed, Sep 23, 2026 at 08:28:57PM +0530, Aneesh Kumar K.V wrote:
> > 
> >> I'm also considering requiring the address passed to cc_make_shared() to
> >> be in the linear map. This is currently required by both TDX and CCA,
> >> while AMD SNP appears to support vmalloc addresses. The only user of
> >> that vmalloc support is Hyper-V VMBus GPADL setup
> >> (vmbus_establish_gpadl()). How should the generic CoCo shared-memory
> >> allocator handle this?
> > 
> > vmbus_establish_gpadl() is the the same wrong abstraction as the arch
> > code. Get rid of it and use vmbus_establish_gpadl_caller_decrypted():
> > 
> > 		pdata->recv_buf = vzalloc(RECV_BUFFER_SIZE);
> > 		if (!pdata->recv_buf) {
> > 			ret = -ENOMEM;
> > 			goto fail_free_ring;
> > 		}
> > 
> > 		ret = vmbus_establish_gpadl(channel, pdata->recv_buf,
> > 					    RECV_BUFFER_SIZE, &pdata->recv_gpadl);
> > 
> > 
> > So you made an allocator that returns folios, now you just need to
> > use that allocator to implement a kvzalloc wrapper. ARM can call vmap
> > on decrypted memory with pgprot_decrypted(), right?
> > 
> > Or maybe this can use vmbus_alloc_buffer(), it already does it.
> 
> Michael Kelley recently proposed [1] moving all ring buffer allocations
> to use vmbus_alloc_buffer(). If we move forward with this, it should
> remove the dependency on vmalloc support.

Even better vmbus_alloc_buffer() can use the new allocator API
directly so it doesn't need to open code the set_memory_decrypted arch
call.

Lets do it!

Jaon
