Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794227704;
	b=Otd7H3mESRDBIFJiLFWbQnbJ3GkGPwxudL4gwll0css5nsNosZ37P25TEEWXuaR8fbmX
	 +JVYmFf6LMLVYaLGVbFOZICUgJceELaRl0tYCyqdjWVuQvNWy3v7PH0XapJUEo5Z4IThS
	 xZat46XJGR1tdkV39kc09KkpqWrYxEjeRoxchGMcGgfh68Qa59/BN3YXwRs8ueslI9+M9
	 nxyGwrLGE4wX/4PW7gnGJ/b6ezAYDd4nWjGpG91BBAqDT98cBsTb+Y+7onkLrL2oe+GOW
	 T/B8lSOBH34NAckBHSBJ8zFWwlJlfp0tEMiQXDREP6KyXapZKXFuMQslHNQTTda8uXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794227704;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=WvzMdwDlo09mKx56WkMYCYECEOAz6fHhPR97cKN4r+Y=;
	b=n0aU1hmYFTUJV9maELVTCQ2Br91z2PqlfROm77W1PZsxwdL7KSLq9E4xm5NyUibA+RzP
	 FpU5y1v5RdFobzDEOZh8M5hbY/Wo/cLC5mx5pJ/YNp/AQK5Gkb10pAcpmz/nPH0641i/+
	 v4oT3VFdfe6z5jVm0LVQcSip0fZ81P2lBBz9cnHVjlIuVug6pbsCi7kuyhbhDUTe+Lx4+
	 WX3F5BiMv711BlfmPo43CCoBrpTObpVBwQO2U7mXmnNoK+tDGyPsa0jNMwsP3aGwXQtsl
	 ZaF3gtVsMc8Sp8MO23eAKIT/VCEHNqTC9rx8HerkN5FqfkOJ7ii/OUE2eABRInKo2HQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=SYh9euBB;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4527E6082BFA
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 12:35:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4527E6082BFA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=SYh9euBB
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a018493d57so27245e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 04:35:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794227702; x=1794832502; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WvzMdwDlo09mKx56WkMYCYECEOAz6fHhPR97cKN4r+Y=;
        b=SYh9euBBDH8+az5T1XY1UdO4mtuadNbdZ8MR5AzDOtTAOMkjXcxd05QeiXE9qVsHeS
         FYyB+yFb/ygXX+Zz3DsZ3sXrLMeun/hz/5h859U6LjlDD3RMsi6oF2Z5nvn82WaGJQXo
         cEQgqmFRau2HHqv6Momfh8k3iQck3cTOSTPU/Exj9hmRn5EQTB8RyEPKZfvXg9rmvxfi
         w1k1Gt2ABiQ4t6b5tPXuqobojyVsE4vzuNLdKAJmko1C4nymXhqs70bGqy2VKdWTNBSP
         lszpapS077kiuaC0W5DsSW9oDTLk2Dfd/7LP4hKvjSsI451lUXvWdRWPp3tg1lBtePGw
         GfRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794227702; x=1794832502;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WvzMdwDlo09mKx56WkMYCYECEOAz6fHhPR97cKN4r+Y=;
        b=Ybp7VZgxrc5jopfHLbRWXJTWAB4WnkidHT/A3dRpPWnIQBai9rG+2sXC7BMIkojQOY
         0NqrWdOroNYyYQAvoF609cjpczH1/e6gRFlJXZn+E7L5BHkb+uqO15pPPtub1NCF25cI
         cpmDZHtCroOpCpAy7rwJ04ZkQ862MA5nfDpvBpx4CDjKm0mFCij99XoKWSsJtWxdP4N7
         sxtLLiK50GoxY0aPWiArNgygiDFyadQSM6TQaZsZj2uRrUBVM7le+3zi3FPhariddgkJ
         ihWM6ko2x/0jvnkhKUWmnPQjvYQmLWukTLJmlGGNi/qkcZy1ZH4N4+CyvtUelgV/Pb4K
         u3UQ==
X-Forwarded-Encrypted: i=1; AL+hErHc7RTtCYwxr1HfeMM1AiC9Qnx2VLuO2iWxx1T5i6TiEewkLFa6M0uYW8GduDc3Dq4PVUI0Q721TXN2PQg=@vger.kernel.org
X-Gm-Message-State: APuU4Z855Nyr+eKyA6eXViR9PTuv514WwP/TfInsMvM6nvUGpqylblAc
	tQzese/hl2QUlmivUpQ+KYS+iMJtZPpE+Xp5HByvow1iyfAjjvqCFWPwbBd/5vRShA==
X-Gm-Gg: AYBFou3sxAWgtUN8XpeN44gNpUdDgdBUMDFbPWgQgA3X7F3wxToN+U142kMRdpi7whB
	QxVV3mkZ/iadXRm2nVdXwea+gfOG9Clns71o7xda8tPFtlD0L1w00PegPJBHfbACbHZiInEPKOQ
	ipJhpjYVKtZL2+u6NfImwan+qhxijfS14YL0not8cP0J2MYANsXSdixeklRt6bp4eVig2TFl6iT
	9McByXRpngtp9OOKBMVaRWlN8VX6h/jS8HuIvGDjCAdOvyXiZ1l0h7zdz+tJEeQ+4zsl8+eSZk2
	28SaFMkEbJ0ApHh5PNXaeAR35viTVrkxHpQZFKs35+BwS1Y+ZsEMobG7ulRdbkfUXer6a3ITCf0
	yY9d7smLM25roD5vzp05mNmuRU20kexoUeaPx9FyxSKiDbHqX0G35xWsntq+cGzO78HTxSmYPsN
	MJjDxgPQGSj0Kx45yYpRrkmykh75mG1CQ+Wh8ATuriqQXMbic2UX7AlWaeTO7XTZlusXWifoodx
	kf/oAu5IRWJ9oFdrImirEYucTW9DAZkXKw3GyRer/IlaWmNMI5eDJMS+y0irJ2oUisay+V2tzGo
	ZN0Z+/UeCC307jPu7K0bpd4u8FK2EyMSoQmMfMy29a5gkdmRJOedhPCkW7yeCqIa/hLUmw==
X-Received: by 2002:a05:600c:528f:b0:4b6:5035:d54a with SMTP id 5b1f17b1804b1-4b8aec15d44mr2319705e9.1.1794227701554;
        Mon, 09 Nov 2026 04:35:01 -0800 (PST)
Received: from google.com (160.193.189.35.bc.googleusercontent.com. [35.189.193.160])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49597186ec5sm10010991f8f.33.2026.11.09.04.34.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 04:34:59 -0800 (PST)
Date: Mon, 9 Nov 2026 12:34:54 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Pranjal Shrivastava <praan@google.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Daniel Mentz <danielmentz@google.com>,
	Samiullah Khawaja <skhawaja@google.com>,
	Logan Odell <loganodell@google.com>, iommu@lists.linux.dev,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 0/5] iommupt: Introduce IO page table shrinker
Message-ID: <avG97sxE2NFZFtvE@google.com>
References: <20261001230219.818128-1-praan@google.com>
 <20261002150844.GC3481470@ziepe.ca>
 <asMuigioXmHZmjO2@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <asMuigioXmHZmjO2@google.com>

On Mon, Oct 05, 2026 at 04:58:50AM +0000, Pranjal Shrivastava wrote:
> On Fri, Oct 02, 2026 at 12:08:44PM -0300, Jason Gunthorpe wrote:
> > On Thu, Oct 01, 2026 at 11:02:14PM +0000, Pranjal Shrivastava wrote:
> > > Introduce a lockless, deferred reclamation framework for IOMMU page tables
> > > built on the generic_pt library. As VMMs and userspace drivers map and
> > > unmap large, sparse IOVA regions through VFIO and iommufd, page table
> > > directories are often left allocated but completely empty. generic_pt
> > > frees a table when a single unmap covers it entirely, but tables that
> > > empty through a series of partial unmaps stay allocated until the domain
> > > is destroyed. Under memory pressure, this *stranded* memory cannot be
> > > reclaimed and has resulted in OOMs.
> > > 
> > > This series refcounts leaf directories natively in struct ioptdesc and
> > > registers a domain-aware MM shrinker that prunes empty directories under
> > > system memory pressure.
> > 
> > We had talked about doing it this way
> > 
> > But I had proposed a different, and possibly simpler, solution that
> > addresses *just* the iommufd use case.
> > 
> > After unmapping something have iommufd compute the gap in IOVA that
> > contains what was unmapped and then issue a 'clean(gap)' operation to
> > generic_pt.
> > 
> > This is the same operation as unmap, except we know now that the gap
> > has no PTEs so all it does is clean up the table pointers.
> > 
> > This requires no special refcounting or anything difficult beyond
> > some locking in iommufd to hold the gap stable while we clean it.
> > 
> > Would it work for you? It seems substantially simpler, but I never
> > tried to implement it.
> > 
> 
> I was tempted to use the interval trees too, but I started thinking
> about:
> 
> a) Locking: For the gap to stay stable while we clean it, we'd need to
> add some kind of serialization either through iova_rwsem or a dedicated
> gap_lock to prevent a concurrent map to allocate IOVA from that gap. 
> Thus, every unmap pays for clean under the lock. I haven't perf-ed it 
> yet, but I'm not sure whether users/Guests using virtio-iommu, where any 
> guest DMA unmap becomes an unmap on the host, would regress.
> 
> b) Other users of IOMMU API (unmanaged domain) like the type 1 (which
> was the one hurting our systems) and other in-tree drivers that use an
> unmanaged domain and call iommu_map()/iommu_unmap() with their own IOVA
> allocator. One of the goals was to avoid enabling the user-space or
> in-kernel IOVA allocation (ab)users to cause OOMs via IOPT allocation.
> 
> > An alternative version is closer to what you have here, somehow
> > connect iommufd to the shrinker and have it lock and walk the gaps
> > cleaning them on shrink requests?
> > 
> 
> I like this one better than cleaning on every unmap, since it keeps
> the cost off the map/unmap path and only does work under memory
> pressure. Although, it doesn't help type1 or the in-tree iommu_map()
> users.
> 
> Would you consider those users worth covering, or would you rather
> they track their own holes and call clean() themselves? Happy to dig
> into this at the LPC session too.

I believe there is a value in supporting other users beyond IOMMUFD/VFIO
(eg. DMA domains) or even outside of iommupt, I haven't investigated this,
but it's worth looking into either integrating the "iommupt clean(gap)"
idea in the IOVA allocator or more generally rely on refcounting +
shrinker (or other method).
That’s probably a lot of investigation, so I am happy to help if needed in
looking into any approach.

Thanks,
Mostafa

> 
> Thanks,
> Praan
