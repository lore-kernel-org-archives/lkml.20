Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A08FF3AFD1E
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 19:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788377434; cv=none; b=qUiRuLRzMnQ1z0xc6DNlJOoUF7Tfu7OUmLAm/j0aYvcc5IkxnvRtHqNnePs272rMOPAw67Th/07MIrBMFUOw1txtOQf+mJobHGwkhyfwur8WonZ2XuRn+TCaWrmTTwEs4MlsqpOBjqGf3qHmK/5Kj8cCdqNNPaNz4PpMavF9bRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788377434; c=relaxed/simple;
	bh=QPIN/gKPbaSLDSkUlr0NinR5rDcxPaXfaMpm7jSHSJk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=smQ8Z5Kvz0v2YoosG5rIUfFpI3/t1d0F3Eu4DaKEZgEaH/37Um7dDxL5Wc0Kk3p/RmK3k9RmQuWwJYGQZBaXJM9SCMxdW29ZqQT0duahhJZfOd/pybCAIElj1UNtrmbm+kz7eS7n9aNJROdYaVBlj65YQiBbJjz49VeFm3coxog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=OETONI60; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="OETONI60"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-5303557a6dbso11379931cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 12:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1788377417; x=1788982217; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sEAeYa5lQ0rcwMSktfey6PB78GVtQgWknQk9cva6fPk=;
        b=OETONI60towuEsrBQJRkmdMAIsGqlQim9TJjlpVxplbURwcqeTYlS+IBgoWJ/F8qsY
         jVtQZEOeBfAaO19QmjOIefkP4kc4MMISWYCs0iRW91rM7LUdpKM6wvBkuPhEnI7FAhBj
         Ib9WPoC6kdwBkE8FtPoRCTE/IpL2uDyTMbdHdUqxTMq5vIlArjmTQxa8U/Xcp72i1vZk
         ciW+UbThsFNMuyfZylODh/TRjLOBCWPv4JhueIXbf7dbavAX+AZOJ8x6FMAY+rNm177l
         DYjan1K9WhSeRVo2pOQ6vWAYddRw6tx7rwxbY5BYfsnlCz7PkvnRZdQbGtv1NHlQU8mk
         UkCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788377417; x=1788982217;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sEAeYa5lQ0rcwMSktfey6PB78GVtQgWknQk9cva6fPk=;
        b=LZjIlmmgQFYeg6L7qzw0vrnaRLg7GAbajqWPFiXE2V6KDAt0ml/F3fFMcZ8VLAJZUi
         LFXQtVM9Y+iCb20P7PWqb/G7Ln3QbHrTV7GGBm+rfXXnIWu2yTqwzLfkz5YPpEB2zxaV
         W4ITUANmW+AMftfBUc3UmmzZg4+PynHPWEecl5J3RmBjwJKFsBCpcNngNKiEdNiaTbtW
         HxWqnGInZgBOeKsBfP3AAq0RdiYFA3Zt9Vl0eBxBIHWNxiVsvh3S9xvZqFQpxk7VP7xv
         HEQjp6gvGN62jDa7DfmejrvflRvPFjVSi+WOQwrxzVq/ZiYy7aBX4N/lIpGFCV/jSiTS
         jiPA==
X-Forwarded-Encrypted: i=1; AKwUvBzpdLWZmWlLcIgdhDFS4goqc7mHMsBljkh0uo5Coyq5abOlfz0VLLd1y0gaAHEN5Gy8mpm907xXB+sA2yw=@vger.kernel.org
X-Gm-Message-State: AFuF++kGLQA4CMsPvD1PZn/tIRdIeM6C1AongXpH6L+ZGAKqNnA3fPeu
	+7OplMtDllW0Zz8t9PZN31f4PKVO5cUHE5HOP9RTNIqDGZLDnYBd2kvYEkznL+PC0B4=
X-Gm-Gg: AYBFou17BoTu+1YYEH9YBnja1B8968Bd9JhDWnN1DKgY2b+eXIOfFKS0c50felGvYyz
	mT91k9/QUJIJ1TiGpBuaK6f4F+izrOrVG3YMUxlgZAx1oHQFwTVRZhTRJlYhFVuWpXDnditiwR6
	+J4D3YiT0TqL02TzL/AxZBCPQ8f2Zo4XcLy/G/Uatbg3NL7j8xCaxoG0Rbru1pSbkOLLtWnhTYs
	Urm7kEFD0o+RK/vz/xXpfdbihWNwdUYy8finzhCIhWyAJR85hBqkntbhtw4r2CiTO0/9Pi4xt/d
	IAb2cqpcAEvaV1wR4j28cqBaDNyrBn1qW4969gw5m4NQN2nwXoyCpctEddB/voAhGTIv+VSdIdy
	L0UopsQ1QBTRlhjslWYU6SkAjTSFrS5UnPOL523j6lb1qp+acYJ2PbNlYbTiUYXvRsWs8oPjfsN
	3id8Jxzgfd6FHrC38zkN4QvndiWLfzFS911fIpOd2Wt9b/nZn5OQzAk2MY6NueH3TupC3Ao+7Gv
	YzrWivO/B3kB8lt/eSit4RtTvtwbZsU1aTLw8pKClhXIcX+iQ4epXb8
X-Received: by 2002:a05:622a:4113:b0:51c:2135:b00a with SMTP id d75a77b69052e-53036d7218fmr97850401cf.40.1788377416278;
        Wed, 02 Sep 2026 12:30:16 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90e9eec8099sm25200306d6.30.2026.09.02.12.30.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 12:30:15 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1x1qf0-0000000Ez4Y-3Ck6;
	Wed, 02 Sep 2026 16:30:14 -0300
Date: Wed, 2 Sep 2026 16:30:14 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: Nicolin Chen <nicolinc@nvidia.com>, linux-coco@lists.linux.dev,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Alexey Kardashevskiy <aik@amd.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Joerg Roedel <joro@8bytes.org>, Jonathan Cameron <jic23@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Pranjal Shrivastava <praan@google.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Samuel Ortiz <sameo@rivosinc.com>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Will Deacon <will@kernel.org>, Xu Yilun <yilun.xu@linux.intel.com>
Subject: Re: [RFC PATCH v4 03/16] iommu/arm-smmu-v3: Add initial pSMMU realm
 viommu plumbing
Message-ID: <20260902193014.GF2890729@ziepe.ca>
References: <20260427085344.941627-1-aneesh.kumar@kernel.org>
 <20260427085344.941627-4-aneesh.kumar@kernel.org>
 <apM6dOHcEI2ztWS0@nvidia.com>
 <yq5a8q5lz5yn.fsf@kernel.org>
 <yq5aecfdnv4i.fsf@kernel.org>
 <20260901143445.GC56830@ziepe.ca>
 <yq5a8q5kkoz3.fsf@kernel.org>
 <20260902121700.GC2890729@ziepe.ca>
 <yq5aik4nztdt.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq5aik4nztdt.fsf@kernel.org>

On Wed, Sep 02, 2026 at 06:45:42PM +0530, Aneesh Kumar K.V wrote:

> To reiterate, for this configuration:
> 
> - The viommu will use a stage-1 bypass configuration.
> - A new IOMMU_VIOMMU_TYPE_ARM_REALM_SMMUV3 type will create the viommu.
>   The psmmu will be activated at this point to avoid creating psmmu
>   objects early. We will reference-count it to ensure that the same
>   psmmu is shared across realm guests.
> - Creating a vdevice will invoke SMC_RMI_PSMMU_ST_L2_CREATE.
> 
> I am unclear about the vdev_create suggestion. Creating a vdevice
> requires an RD, which is created later in the flow above. How do you
> suggest linking vdevice_alloc to vdev_create?

I was thinking we'd make sure the KVM is associated with the viommu
and/or possibly the S2 domain. That was always sort of broadly the
idea in this space. There are several topics unrelated to CC that
needed this.
In any case, when you create the iommufd viommu you should also do
VSMMU_CREATE which needs the RD. It seems reasonable to assume the RD
is available during vdevice create.

[There is an aside here I will mention: several other use cases need
this idea of an "external" domain where the HWPT would be created but
not controlled by iommufd or the iommu subsystem. Xen and Hyperv for
example. There is probably some merit in thinking more about exactly
what the nested parent domain should be for this viommu, but it isn't
critical.]

> From the RMM's perspective, the sequence is as follows:
>
> viommu alloc
>
> [   rmm ] SMC_RMI_PSMMU_ACTIVATE            2b400000 8819bb000 > RMI_INCOMPLETE 0 10008
> [   rmm ]       SMC_RMI_OP_MEM_DONATE       0 881bac098 1 > RMI_INCOMPLETE 2 10004
> [   rmm ]       SMC_RMI_OP_MEM_DONATE       0 881bac098 1 > RMI_INCOMPLETE 1 10004
> [   rmm ]       SMC_RMI_OP_MEM_DONATE       0 881bac098 1 > RMI_INCOMPLETE 1 0
> [   rmm ] L1 StrTab: PA 0x881baa000 VA 0x80003c0000 size 0x2000
> [   rmm ] CMDQ: PA 0x88066a000 VA 0x80003c2000
> [   rmm ] EVTQ: PA 0x8815c5000 VA 0x80003c3000
> [   rmm ] PSMMU 0x2b400000 activated
> [   rmm ]       SMC_RMI_OP_CONTINUE         0 0 > RMI_SUCCESS 0 0
>
> [   rmm ] SMC_RMI_PSMMU_ST_L2_CREATE        2b400000 300 > RMI_INCOMPLETE 0 10004
> [   rmm ]       SMC_RMI_OP_MEM_DONATE       0 881bac098 1 > RMI_INCOMPLETE 1 0
> [   rmm ] smmu->strtab_base[12] 0x0 @0x80003c0060
> [   rmm ] L1STD[12] 0x8819bb007 for SID 0x300: L2 table VA 0x80003d0000 PA 0x8819bb000
> [   rmm ]       SMC_RMI_OP_CONTINUE         0 0 > RMI_SUCCESS 0 0

What was this one for during viommu alloc?

> vdevice alloc
> 
> [   rmm ] SMC_RMI_PSMMU_ST_L2_CREATE        2b400000 200 > RMI_INCOMPLETE 0 10004
> [   rmm ]       SMC_RMI_OP_MEM_DONATE       0 882648098 1 > RMI_INCOMPLETE 1 0
> [   rmm ] smmu->strtab_base[8] 0x0 @0x80003c0040
> [   rmm ] L1STD[8] 0x882506007 for SID 0x200: L2 table VA 0x80003cc000 PA 0x882506000
> [   rmm ]       SMC_RMI_OP_CONTINUE         0 0 > RMI_SUCCESS 0 0
> 
> RD gets allocated here
> 
> [   rmm ] SMC_RMI_REALM_CREATE              881b03000 8819a1000 > RMI_INCOMPLETE 0 24
> [   rmm ]       SMC_RMI_OP_MEM_DONATE       0 881605098 9 > RMI_INCOMPLETE 9 0
> [   rmm ]       SMC_RMI_OP_CONTINUE         0 0 > RMI_SUCCESS 0 0

Why? The VMM needs to create the kvm before starting the iommu stuff.

I would expect that KVM knows it is going to a realm very early on? I
had assumed the RD would also be created early by KVM?

What triggers RD creation? Why can't the VMM do it earlier?

Your followup said:
  - The realm is created during viommu allocation, ensuring that the
    vSMMU can be created here.

Do you mean the SMMUv3 driver triggers RD creation? That feels
wrong. Did you mean the VMM just does it earlier?

The draft in the next message looks promising, did you discover any
other gotchas when exploring it?

When you repost this can you take some care to explain the general
idea of this modelling in the commit messages so AMD and Intel can
confirm they can use it for both their non-viommu and viommu cases?

Thanks,
Jason
