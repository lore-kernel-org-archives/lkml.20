Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A6393C9456
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 17:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788284555; cv=none; b=WdccDMWGNvkM5ytOc1NmM54Sfz6Bgp0GT7cpY8wkOm2dglvH4Ody1xyurVX7OIojFudPRprg4Y+4OWwAB/2qb8x5h40EP+8jSpGcmRR03GLtznghSqGf7+674aLQVMNO6d0S/MZ1ZE9MDC106/82FKN4Pesu66RDyrbLQAspbS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788284555; c=relaxed/simple;
	bh=vw8qH8NH5NGnUxf9s/ujX0clA/aKzxDFmfPs08i5E6U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lx8EOEyI14CFWnnYjJElFWeZ8cEP9gzdoT4VO/Kh145ZGB69g/yRlfOWFCoumwIO27wtNymkBWLEYFUlxpcaJsV+VmGqjGsEKva7rqwlGuYIaWFDwt0vKWOKo7sIyTMWlIexHWIDYS7e+RWCbRbkyi6dT0zNNmhSXy+6Mr7iSnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=F9IwItrG; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="F9IwItrG"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-90ce08834feso1981576d6.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 10:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1788284552; x=1788889352; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wSpPsrjUbmiSavh9ORSXd1N82cCUzjhFeagQI6oMt/A=;
        b=F9IwItrGwn+PiMxPO2rTfjHUEQrVUcHzexJDKoBg4lQKCkqRfYHQp1aA97dq7xney1
         c8OTCbWBcgAf6N8UczZA3glrtRfJJzhhoBdL/hl64+AhjZs+EqnQ/Jn1nVmX3Yo3pEQr
         t/WXn9vPw7M6HsYkzY9gL4xHkxooXsre8F8yhECty56zhjaS/Z6cnvVBX3Au4ccPXlW/
         /60hlYKfsZ3Pueu6vMJko4iDAisEU8jGsBuCRWTkvCgpxMEMBsIKRcJQYNIOIFL3bEyV
         DfvwMZWxyoVNXyY5bMAMWhuLt+2BuQDcu0+ezo0nnUqvf0eXwuhOzQx+VEQ4PNF2B1uW
         X5jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788284552; x=1788889352;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wSpPsrjUbmiSavh9ORSXd1N82cCUzjhFeagQI6oMt/A=;
        b=j8X1sBXPVS+OfqUHXCl8iisUis6tDWdyVpVwomJeEV2aowRwJ2qZrMPUONlHKVICf9
         NHUqMk3OOztHz95GUVTKuhKBFcD7to4ZV/V0xUumZDV1Gzlbt/SE+pvozS84efhLQWNj
         dInKMf/Uoze8jicftT/H7Qb4R2fgGzdeXEuSzM6pdji6UjfNwKKGAWiyjV8gDduy3TAf
         XZgZAGcJeihmIWlr5q9w7yOKsInTYgoB7dmBfE7UxGUmOWTauOs3zIl/hRM/wMtmo+wT
         GA9zjpArL1sw/PSsXUHWBo3ZlSjX7Aph4tQ5FKWgCHEmqtOXwnmyiLZKEm+k4TKe6xxh
         po7w==
X-Forwarded-Encrypted: i=1; AHgh+Rr+1MQjIrCzACGN6p2a6SQ1UHKkD3vdYxv9vQapwBfyMkcNdPdIcxQqluRtMQ1yRQudIDAXGGG002Dqd4g=@vger.kernel.org
X-Gm-Message-State: AFuF++kQjD+OgBILyrjtU+gnsw3n4MZGbi9CfJidWM1YSGrqnsjg5veS
	Vbok2JdPXFqaF8g5FsiLVuSm/NC2Y+ZcYkLVKobUoEjmYgN0q2cHsh8X8Wfg3WITYKo=
X-Gm-Gg: AYBFou1kSByGAY7kIa8ba+kw/VnqKR75ErfUkHZWgMVzw9rEpXHaXRsnDLujX5UYR6C
	46c1bzVSPWybbtgOuxWmQSbDnWOIC0I7qXn5RJtsDUVD0nPRHMigMb/0KgQOjN6YmG6jWO/9iE+
	lGte8OobodoZJEhmCEs+2IFYtQmkw5xvJvm4Iyk0q7lOjpPmn1l3A4f3mIKhFNAEGHjseHVP7C9
	ZqfD0nbywQru06oyXacGiBMjdIGgVFjGyJYXKQDG5z3MOskcKKAHNyVXklx4jTxcDR+HP9TrSrl
	UagjI8LGqfFppLfD3+X6izvMwkxD3wbjCRvTW+CnoTbVhkCN1wEJhKUvA4yOot9KddoXHFOR+5K
	cc/VSHCTI/jHDvLULnx20SHyv3dACdAchgOAtazev+ihVH4dGU6ROWLFcMK7gRHz6IxIvKB+p9T
	nXgLMNmKVpHUR7Yx6tY1jsE67D/QA2WJibrsSmSg4ylqR05s+MKA3+Jfy+VRs4HtsgdMY5ULkXs
	loOi4ULpJN5/2NZNEWq0Lpz5ZOoBFZ282HxfhAbrnae7iXANqByVYCz
X-Received: by 2002:a05:6214:20a6:b0:908:951f:415 with SMTP id 6a1803df08f44-90ce0c5a74dmr432795226d6.13.1788284551550;
        Tue, 01 Sep 2026 10:42:31 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90ce4515130sm113625086d6.39.2026.09.01.10.42.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 10:42:30 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1x1SVC-0000000C4up-15C8;
	Tue, 01 Sep 2026 14:42:30 -0300
Date: Tue, 1 Sep 2026 14:42:30 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	linux-coco@lists.linux.dev, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Alexey Kardashevskiy <aik@amd.com>,
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
Message-ID: <20260901174230.GA2847102@ziepe.ca>
References: <20260427085344.941627-1-aneesh.kumar@kernel.org>
 <20260427085344.941627-4-aneesh.kumar@kernel.org>
 <apM6dOHcEI2ztWS0@nvidia.com>
 <yq5a8q5lz5yn.fsf@kernel.org>
 <yq5aecfdnv4i.fsf@kernel.org>
 <20260901143445.GC56830@ziepe.ca>
 <apcHoHKGoI7WNFXp@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apcHoHKGoI7WNFXp@nvidia.com>

On Tue, Sep 01, 2026 at 10:13:04AM -0700, Nicolin Chen wrote:

> +/**
> + * enum iommu_viommu_arm_realm_vsmmuv3_flags - Flags for ARM SMMUv3 Realm
> + * @IOMMU_VIOMMU_ARM_REALM_SMMUV3_FLAGS_VSMMU: Indicates whether the Realm has
> + *                                             a guest-visible VSMMU instance
> + */
> +enum iommu_viommu_arm_realm_vsmmuv3_flags {
> +	IOMMU_VIOMMU_ARM_REALM_SMMUV3_FLAGS_VSMMU = 1 << 0,
> +};
> +
> +/**
> + * struct iommu_viommu_arm_realm_vsmmuv3 - ARM Realm VSMMUv3 parameters
> + *                                         (IOMMU_VIOMMU_TYPE_ARM_REALM_SMMUV3)
> + * @flags: Combination of enum iommu_viommu_arm_realm_vsmmuv3_flags
> + * @reg_base: MMIO base address of the VSMMU in the guest VM
> + * @reg_top: MMIO top address of the VSMMU in the guest VM
> + * @aidr: AIDR register value of the VSMMU in the guest VM
> + * @idr: IDR register values of the VSMMU in the guest VM
> + */
> +struct iommu_viommu_arm_realm_vsmmuv3 {
> +	__aligned_u64 flags;
> +	__aligned_le64 reg_base;
> +	__aligned_le64 reg_top;
> +	__aligned_le64 aidr;
> +	__aligned_le64 idr[7];
> +};

Yeah, broadly what I would expect. Pass everything needed to execute
RMI_VSMMU_CREATE through this struct.

Is there anything more than RMI_VSMMU_CREATE needed from a RMM
perspective? What about that dpt/ats stuff?

> I think this should work. But I still feel awkward that a non-vsmmu
> case has to allocate a viommu object for a set of RMI commands that
> don't need an Realm Descriptor.

It is for the RMI_VDEV_CREATE which needs the RD:

	case IOMMU_VDEVICE_TSM_BIND:
		rc = tsm_bind(vdev->idev->dev, kvm, vdev->virt_id);
		break;

It has to be tied to a vdevice on a viommu to pick up the kvm and
vSID.

If we don't do that we need a new way to get the virt_id and kvm into
the flow, which doesn't really seem worthwhile to me.

> Things could be cleaner if we allow RMI_PSMMU_ACTIVATE and
> RMI_PSMMU_ST_L2_CREATE to be independent on a viommu; then leave
> IOMMU_VIOMMU_TYPE_ARM_SMMUV3 to vsmmu-visiable case.

This is why I asked in the other message if RMM spec is clear that
PSMMU and STE are not required for anything but VDEV_CREATE. If so,
the PDEV create and SPDM stuff is fuly independent.

Which is why I'm saying the split doesn't make sense. PSMMU,
interrupts, STE, VDEV are all related objects that should be managed
together by the SMMUv3 driver. You need a PDEV to create a STE, and
you need a STE to create a VDEV.

PDEV is the SPDM channel and should be managed by the TSM driver.

So, I think the IOMMU_VDEVICE_TSM_BIND is not justified. "BIND" should
happen when the SMMUv3 realm viommu ops create the vdevice. The same
way the vcmdq sets up the VSID tables when the vdevice is created. Is
there a reason to have it in its own command?

Further the implementation of IOMMU_VDEVICE_TSM_BIND in this series
*requires* a viommu to work. So OK, let's lean into that. (to be clear
I am saying delete tsm_bind)

It means the other arches will have to implement viommu APIs in their
iommu drivers before they have really defined their actual secure
vIOMMU definitions. That seems manageable.

Jason
