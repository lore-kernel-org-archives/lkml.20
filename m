Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D42B055C322
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 12:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788958005; cv=none; b=LLUd06VT5NcVbVd2f5tL4YYavWxwrlOoLmXcyn49K/srB+sT74vogBm0J3+A/pQjN4B6m6diEld1alimuQfX77cuZXzkVQLXHpUP1Y6H8DCpzk1YWmT4DV8d6O+JFq09+T+5gx6ZzX5x4JFAbUbIpcc7eVxg7q6W2iauOV7214g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788958005; c=relaxed/simple;
	bh=QDi/RLEV4NM3t1kYDBD1hT0dRtZz7+g9ZWoQx4FJiek=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i20t4K8dqwUA4YgsPyBNs3F07xqMdAuW4qQgUbmoqTp+vFR2eZpZJfafEFgY6hAhDO3aMkPesCFYGB7CxIhi9WOC09t3hPZQ4En5J5a3dg1mocnBD7QhrgFhuoS/zRGGTpl/Uy0NEUykReJFx6DClPM1UwmQLbaIB6S3jYVW8D0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=k41+Via7; arc=none smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="k41+Via7"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-91058dd77a2so12426676d6.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 05:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1788957997; x=1789562797; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+JBkF2wxS+es6K6okap3riPRAx5NmOpjF4k3ofV33EY=;
        b=k41+Via7NZjuyMGKtPpZsGXTikODNFZnbOpNELj2LfEXSCkdWCV3p0gsihp+kBcHb4
         ItTZj064qMbzSZ9AxU6gdRbC3h3ZYXmn52ZDf3HZix4av5rYUS2TONEJYcZ1STtccdo2
         hYx5LnuQjK3Ed8d1Uh/3cG+5IPrmjBZXneGAW+6Cg19ycKeQ1OqB3AWkt3xLy2xRMrBy
         j1LlH+K3sG2Iq0AMPchHj7GkRo6sffh+Fey/Hz86YCg+9iOYwY2dGk5p8NTc+zSF4ytC
         eP2SJWl5lZPn74FGK4At2T2ez5jPCfo7KF+pO586R0+nPCjIjma90PtI2ZhrJPr6ux2O
         j73Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788957997; x=1789562797;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+JBkF2wxS+es6K6okap3riPRAx5NmOpjF4k3ofV33EY=;
        b=BO07pQ9WF8duLNseQ7yqIOu17mqTIzsKFI90Anc1eqK5nFabjOuIgkzbFN48B4Ukl8
         01aHr6KfJpY9kgJHt8UhQ+S9CQ4KmRvaBasli9UTYWW7CGVga4EycsMGpK9NaE3LlxW4
         aGcLTvPPrdt7CL7HFnPAsmObqCxcDt2XLmzEwTamJ1tF5hv0vFghmzl3YBgiGrDvn0ot
         /wCiP8RqzHhKly1QLDA0UZ9IbfGR08JzQR0EF+912snQBWYfWflVLMwaj1haAoJQkZXR
         Sk+U48q0ttzzjz6MGXhYdsdfQUocYPsnOq1pW/zKXyBFC083q8i+63V7PJibbcrOOwHd
         p0zg==
X-Forwarded-Encrypted: i=1; AKwUvBxCx6NGgNEm4CYGKTOGrxd+AcZkeUMZ/6uN/wDDK1RYl29JxnSm7fTauJQuZ7HBzpMceac6I20XD9ANKqE=@vger.kernel.org
X-Gm-Message-State: AFuF++lW7XUbfXw1Elw5Ks9lWtwbGHiR0ImKmagqroDI7wKxkpBngwP8
	rauuKP9pEPZ5GvBj1VqnaKVQaNP+ttli2A6kYNUcJVKno1cRVGnbDSqXMjpH56xJWiM=
X-Gm-Gg: AYBFou01JjKoobuFMxoRZvbSlYoFfmCm4tA5Zos10kBldVXpGJpMQ4FOFP99un353x5
	ebmXLt713uJOgFZksxzKAYUPZH44HB7lwJXhAa2XLOECuN/gufvAeq/wxAiI6Ug1s5vTuFfLA4M
	NJ1azAaz/KmNP5VNJQTJTstO8J6R8yTtNViL+MlvdrWINYVthjdyIvqDNeDm1xl6T7k4tQEOBwe
	yVhJVmyr2yfxsX5arkBqfZoh/6lcx5hByQTyIu+OAbJq6NBeqnNoWxwIWdngdbgUBtyhtkVMXAc
	Xe84bza/zzwArK9VE0203thZULwASOVdA40wFrGw0+/Avv8OjVhr+heHhdMRVitydqrLo9wUgjN
	pJW/tJaDTs7WKforWZgJolPKlBPG7YL4Vxtt1Jau6S0dmKRlpGk/RciXoxNLcsR38ZvDhSKZ2dJ
	waQJMnjLNa3ElUIUNVKWggxBX42il8GaQGIAviPyoMumgiWlQBjDroC6YDAP+mFdzCu+yx5q9wW
	8KmVBzelk9iWMVUHZl0YPxlMutET2MOjbW+eatLKvJf1Qh/zvVg8XB3
X-Received: by 2002:a05:6214:ccc:b0:910:4080:dc4f with SMTP id 6a1803df08f44-9106b371c17mr87577676d6.4.1788957992321;
        Wed, 09 Sep 2026 05:46:32 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91053b4992csm85467086d6.22.2026.09.09.05.46.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 05:46:30 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1x4Hh6-0000000Ge25-36Uc;
	Wed, 09 Sep 2026 09:46:28 -0300
Date: Wed, 9 Sep 2026 09:46:28 -0300
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
	Will Deacon <will@kernel.org>, Xu Yilun <yilun.xu@linux.intel.com>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Subject: Re: [RFC PATCH v4 03/16] iommu/arm-smmu-v3: Add initial pSMMU realm
 viommu plumbing
Message-ID: <20260909124628.GH2543240@ziepe.ca>
References: <yq5a8q5kkoz3.fsf@kernel.org>
 <20260902121700.GC2890729@ziepe.ca>
 <yq5aik4nztdt.fsf@kernel.org>
 <yq5aecfbzjyk.fsf@kernel.org>
 <20260902235609.GG2890729@ziepe.ca>
 <yq5a8q5izxz4.fsf@kernel.org>
 <20260903171704.GK2890729@ziepe.ca>
 <yq5acxupjsy2.fsf@kernel.org>
 <20260907125228.GB667892@ziepe.ca>
 <yq5atsnyag84.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq5atsnyag84.fsf@kernel.org>

On Wed, Sep 09, 2026 at 03:39:31PM +0530, Aneesh Kumar K.V wrote:
> Jason Gunthorpe <jgg@ziepe.ca> writes:
> 
> > On Mon, Sep 07, 2026 at 03:15:25PM +0530, Aneesh Kumar K.V wrote:
> >
> >> I looked into this, and it becomes fairly complicated. We can move all
> >> vdev/TDI-related code to arm-smmu-realm-v3.c, but that would result in:
> >
> > I was going for the opposite, you'd move everything out of arm-smmu-v3
> > and into the arm-cca-host and obtain the viommu through tsm_ops not
> > through iommu_ops.
> >
> > I guess I pointed to that in another email.
> >
> > The only thing arm-smmu-v3 should provide is a simple function to give
> > the pdev phys and irq parameters. arm-cca-host calls that when it
> > creates an viommu object.
> >
> 
> 
> So ended up with
> 
> static const struct tsm_viommu_ops cca_tsm_viommu_ops = {
> 	.owner = THIS_MODULE,
> 	.type = IOMMU_VIOMMU_TYPE_ARM_REALM_SMMUV3,
> 	.get_size = cca_viommu_get_size,
> 	.init = cca_viommu_init,
> };

OK, may also be fine in the main tsm ops? 

> struct cca_viommu {
> 	struct cca_psmmu *psmmu;
> 	struct iommu_viommu_provider *iommu_provider;
> 	const struct iommufd_viommu_ops *iommu_ops; // backing SMMU ops

??

The viommu created for a RMM owned vSMMU should have no connection to
the normal SMMU driver? It just needs the psmmu information.

We need to adjust iommufd side to know that this object cannot accept
an iommu_domain, only a kvm fd. I don't want to pass in a fake
iommu_domain that has nothing to do with how RMM will operate things.

> static struct iommu_domain *
> cca_viommu_alloc_domain_nested(struct iommufd_viommu *viommu, u32 flags,
> 			       const struct iommu_user_data *user_data)
> {
> 	struct cca_viommu *cca = viommu->provider_data;
> 
> 	return cca->iommu_ops->alloc_domain_nested(viommu, flags, user_data);
> }
> 
> static int cca_viommu_cache_invalidate(struct iommufd_viommu *viommu,
> 				       struct iommu_user_data_array *array)
> {
> 	struct cca_viommu *cca = viommu->provider_data;
> 
> 	return cca->iommu_ops->cache_invalidate(viommu, array);
> }

These ops should fail (just be NULL) not reflect to a psmmu.
 
> struct cca_vdevice {
> 	struct iommufd_vdevice core;
> 	struct pci_tsm_context *tsm_context;
> 	struct cca_host_tdi host_tdi;

Is the extra tdi struct still needed? Isn't cca_vdevice the tdi struct?

> 	u32 l2_sid;
> };
> 
> static const struct iommufd_viommu_ops cca_viommu_ops = {
> 	.destroy = cca_viommu_destroy,
> 	.alloc_domain_nested = cca_viommu_alloc_domain_nested,
> 	.cache_invalidate = cca_viommu_cache_invalidate,
> 	.vdevice_size = VDEVICE_STRUCT_SIZE(struct cca_vdevice, core),
> 	.vdevice_init = cca_vdevice_init,
> 	.vdevice_tsm_req = cca_vdevice_tsm_req,
> };

> 
> and on iommu side
> 
> struct iommu_viommu_provider {
> 	size_t size;
> 	int (*init)(struct iommufd_viommu *viommu, struct device *dev,
> 		    enum iommu_viommu_type type,
> 		    struct iommu_domain *parent_domain,
> 		    const struct iommu_user_data *user_data);
> 	int (*get_params)(struct iommu_viommu_provider *provider,
> 			  struct device *dev, enum iommu_viommu_type type,
> 			  void *params, size_t params_size);
> 	void (*release)(struct iommu_viommu_provider *provider);
> 	void *data;
> };

Not sure what this is?

> The TSM disconnect path will now fail while any vdevice is alive or
> active. 

Yes, that's makes sense.

> Destroying a vdevice will unlock and destroy the VDEV. 

Yes

> I think we can also unmap its MMIO mappings at that point, provided
> we track the mapping requests in a list alongside the vdevice
> details.

The mmio is owned by vfio, there should be a handshake in VFIO to
remove mmio when it becomes private, otherwise I don't think we need
to do anything more?

> All CCA operations will use pci_tsm_pf0::lock, though I think the
> locking can be made more fine-grained.

Sure
 
> I will send a cleaned-up series so that we can review the code changes.

Does it seems reasonable to you? Was there any oddness with modeling
the vdev/bind through the viommu?

Anyhow I'll look more closely when you are ready. Thanks

Jason
