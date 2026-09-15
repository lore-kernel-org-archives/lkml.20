Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A6FD3D669C
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 13:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789479803; cv=none; b=q1zQ8sOTw2iUSzqtmzobHwhUcUPdWujZyub5fdEBD+ObUQXXzSJsw9F7aOj8CSoHfCNqPQZDuAUt+OHdjc7BE7aFv/IrspXqfL2sYxqaoJDtYnI7Tr/EGWpBWfNwYDxHcULX1st8aDF5fJPvvfk8tPAoQ/f/sMyzmtpSlKx2Exk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789479803; c=relaxed/simple;
	bh=fW074i0HkgvCy5bvA0+X/e729P0Fz+Gm4Rjq7TMc70g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e0rm0UR6DHORBAMSKM+U5QfS9DNfuz1F8Gj1hOtnj8XF62wfq8gyW9pE8Pg1mmDTDCiDH6PnLxNhGrcTJxx3hTYGeqwsoahtggBpbzcfIvfFHQL40ha0jZc2oPrzQR+QFhzFdVCvDxZtimNv8x3llHWC+yshVJ7L9O5yzXjTqhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=Gp+WF7w3; arc=none smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="Gp+WF7w3"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-90cdfe60d5fso44495696d6.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 06:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1789479800; x=1790084600; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bSXuxco/xIMIgeK0msm6noQ0z/sdWL5ZlVJapMHGK5U=;
        b=Gp+WF7w3jpQ7t5DHkdrSOHyYxIyTM1aBT2Y/t1sqP3Wagy4DRSkpj0vYe6NAfHwmRI
         yfM5BeLKo0jHUFadVvbxrR5eYGTs/YGhi9n46c5cug3h00Pnl69KRO08UBq9/eHTjKwC
         EWomZr83RpVGIIyD4IHR4AqXA5NLTjWJGvPM65KhxpUOLgUixarP6T21t/XMYCJMJmtW
         mX0LaKj2NsGePtJrWodeF82iAkdEizGGB74HwNOAtR0D9xBCDytumKkaBga5GwlSXMjv
         rBqrjnBpn6AdloUqyUyaDYJQXmPlkHzFnR8dDlDsn/V1yais8Xhy8qYb42NQ0cAessKI
         IAfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789479800; x=1790084600;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bSXuxco/xIMIgeK0msm6noQ0z/sdWL5ZlVJapMHGK5U=;
        b=0VO2xbftxRmYKrLkBeRCLNOVuMG9lpAg7/lUZabTfgT6e23CM4rNOTR1bsokQaF7+E
         RSHYI5X2r83XYHXEhx+RRQiieag6s/Lh/oc3E7iFmvwez9tw6LxDoEV4qMOhKZuB+Fqz
         khHBtPEed+9x86F6036tnjYz+AjnnZAafqpzUwC0lBZs3GxU/RvhGlgmL+Nn0DB4WkvL
         l/5/CgHWjATqEnavMqECZQHAQHnsQ25QWUuTEBTV8TkDT3qQ1nmOX+Ap3ofShi/ph2PF
         i+ZGaHXWtaoSWCRymB0AackzO3f/pzzO+SyzIv2oRKfVWtlzJbzerBs8rRiVimJlQUKL
         ZZ+g==
X-Forwarded-Encrypted: i=1; AKwUvByYVtMG9GXnwgabbQkuo+eJxLU/hba2+Y2tBxCgx8iPShXe3S2OGaiUhr6UKff+sGlV1SYGR0r82lJUZqo=@vger.kernel.org
X-Gm-Message-State: AFuF++mdjmE+krvp3DbDSGQwR+u9+7NXWp05S30SjkBM8/33fF93m8c4
	1i2eOkki3TWfrUdgsjNgNH/TdUGP+kyz/sfZi+BIVOkKsvbK+gcynLpb5dbE/IYYJ5E=
X-Gm-Gg: AYBFou28GNtUztngb2DyqMbF07dJeIWvDcIQxgriC9a9+2z25W8eBmRMOude1Bq+WA3
	09ZjrbapaWSA/ePnk8RUqEv9fdKpfnuK5UAXtazJhVgWwNWrWjhsNF13JUOTEkMKhX5ump7M0jD
	YBMjVhJCT/GiCC+lby6obb1/u4TRW7+w+q5irKed+H0juN/FGdjo+BuHqRTgC8HWwGD2BXn1GqM
	CJSmKuGyYOLovXfRMFTRq75MF69x4OiR1YdsUoqw6TIrEoWkfaSBfJCuTviVBEJ3u8pdpf4nXJX
	f5r+yxzFLPDO0alPIY/vEpboCojG3uQNN/Z3Fe97GBvZdaZWEm9r8FKl/eHsrbUYWcmS83n6Ctg
	Ju+CV1NNLU3v5rg9piThaRbfO4zhnSbTZ/haRO9n6LazIcROraIFRXBK66sa+6Jku+i+UtiKmt+
	bVin7IwvWYrTPBFyHsumoI2C/+BFdgzKva8d7VKDN4lLpuMBq1DE+V0lTuB5tyFnNmaAHh33of/
	Gb44Az7DEZDDtMwUKEVYOOlLoQ2RdbM8ZyWin8QppXtvw8qsnaOZTbc
X-Received: by 2002:a05:6214:4986:b0:90c:d6fc:e284 with SMTP id 6a1803df08f44-9122e54a861mr120216456d6.17.1789479799946;
        Tue, 15 Sep 2026 06:43:19 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f4d51ffsm124036106d6.45.2026.09.15.06.43.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 06:43:19 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1x6TRO-00000004bnd-23bE;
	Tue, 15 Sep 2026 10:43:18 -0300
Date: Tue, 15 Sep 2026 10:43:18 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Tian, Kevin" <kevin.tian@intel.com>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	Nicolin Chen <nicolinc@nvidia.com>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
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
	Will Deacon <will@kernel.org>, Xu Yilun <yilun.xu@linux.intel.com>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Subject: Re: [RFC PATCH v4 03/16] iommu/arm-smmu-v3: Add initial pSMMU realm
 viommu plumbing
Message-ID: <20260915134318.GB3196566@ziepe.ca>
References: <20260902235609.GG2890729@ziepe.ca>
 <yq5a8q5izxz4.fsf@kernel.org>
 <20260903171704.GK2890729@ziepe.ca>
 <yq5acxupjsy2.fsf@kernel.org>
 <20260907125228.GB667892@ziepe.ca>
 <yq5atsnyag84.fsf@kernel.org>
 <20260909124628.GH2543240@ziepe.ca>
 <CO1PR11MB4835512E374074A5F4AD0A6C8CBF2@CO1PR11MB4835.namprd11.prod.outlook.com>
 <20260910124632.GB4083318@ziepe.ca>
 <CO1PR11MB4835FF972283C09D7D683DAE8CBA2@CO1PR11MB4835.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CO1PR11MB4835FF972283C09D7D683DAE8CBA2@CO1PR11MB4835.namprd11.prod.outlook.com>

On Tue, Sep 15, 2026 at 07:13:48AM +0000, Tian, Kevin wrote:
> > Yes, this already has to be true or our lifecylce model is
> > nonsense. Once the iommufd creates the vdevice the guest is running
> > and we cannot disconnect it without unplugging it from the guest. Thus
> > the locking can rely on that. Within an iommufd ioctl context the vdev
> > and underlying connection must be stable.
> 
> btw looks a related suggestion is having the tsm driver (arm-cca-host
> here) implement the viommu ops while leaving the original smmu driver
> largely intact, and "obtain the viommu through tsm_ops not through
> iommu_ops".
> 
> It's not super clear to me about the implication behind after reading
> related discussions and what the "obtain" part means. 
> 
> Could you help elaborate this part?
> 
> The old way is kind of:
> 
> vdevice_tsm_ops -> tsm_ops -> tsm driver -> iommu driver
> 
> then it will become:
> 
> viommu_ops (tsm related) -> tsm_driver
> 
> where tsm driver will fully handle tsm related viommu_ops?

At least for ARM there is effectively no entanglement with the actual
host iommu driver. The viommu is entirely provided by software in the
RMM world, so it can have its own dedicated driver. In ARM T=1
transactions are alwayus routed to the RMM's iommu and there is no
relation to the host.

I am interested how Intel works here, but I thought it was similar.

AMD is different and I suspect AMD will have to continue to use the
viommu from the AMD iommu driver, but I am not sure.

> btw I held the impression of blocked operations from past discussion [1].
> Initial attempt tried to proactively unbind the TDI upon any operations 
> which may transit the TDI to the ERROR state. Then the suggestion at
> the moment was:

With this construction the iommufd vdev is created and permanently
exist as long as the VM and viommu exist.

How/when the tsm driver links this to a arch specific "bind/unbind"
operation is more up to that driver, but I would expect what is
thought of as "bind" should be the affiliation of the device's T=1
stream with the viommu and the target VM. It should not be sensitive
to the TDISP state.

That is not prohibited, the TSM driver could do some auto
"bind/unbind" whatever that means triggered by ops or tdisp state
changing under the covers. But this cannot leak out as some kind of
asynchronous vdev destruction.

> " But now the suggestion is never let VFIO do unbind, instead VFIO
> should block these operations when device is bound. "
> 
> [1] https://lore.kernel.org/all/aEFmPaYorqaYCKBY@yilunxu-OptiPlex-7050/

IDK, if the host wants to put a device into error I don't see why the
kernel should block it? There are many reasons a device can reach
error, that needs to be handled.

Jason
