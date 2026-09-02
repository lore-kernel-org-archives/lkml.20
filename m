Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7354647F2C8
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 12:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788351426; cv=none; b=Ppir1ZnxXVxTTMp1T2yRUGcGmfzhYZbfySRJwn88XOk7/PTQmu7HgXp/ewHAqIUMsV47WdWcbQJubUzxlRcmT0CaJf8pamHcmF1kxFy0CfjDFhzADM/PSJZLfE0/W+8sZnEIvptOsJCEOXlVOTi5WupEMTPuZ8gl+ZKaMu9XxSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788351426; c=relaxed/simple;
	bh=KiuQi7KyeiZxotF4pe9yz/R7uxutNRVzafURAOqLelg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tXTA98WL/0ijOr8jktUeWdzl0fIvq5722IkbdpNbIuDS7mtVg7p6y5j73nshLWa9As0VrMhE6QCebffLfk+VT8ca1k74T4aAb/1Z1SDJiZi5Dt30FIenfIEaqzoLhYW+SAXioESSrNbl1hH9NXC7NIyD2Tn5QC28f/sIYLuy3KQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=SpmL80vs; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="SpmL80vs"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-517dc520840so10896741cf.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 05:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1788351423; x=1788956223; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WlwW9UoqChuDQG8Ubc8yfsDP24EvYv1xxnKt9rNQ+co=;
        b=SpmL80vsb+J9AHbR5AUFpou/JKMuzavAKxeGa3xXoh9/bQeYRocZtohwpLFIvcjPnq
         R6S+BsEQEaKVVqee1PgowGrsH25+oDOX+jit8bpTRP3tto0zMh67amp7mL+YrMZpC5fI
         FpTpF78vgigFcx4Jg8LqxcrECcXbsqh5AfpMOni4YzCGjU65711jBvRK1F5pHvmn3md4
         Rz8zTLynsiDOfwmFNx6rBwKx5v0a9OWHBDd7CV+XyzRJCF2p+3s2IkLNV8+LuGuFd30H
         PS1Kaf7sEBaA+3CAVxAnoogZNXdHrthjX/G4+6OYQybfO/n4wLIzWXbG3d89h5qJDXwo
         BQRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788351423; x=1788956223;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WlwW9UoqChuDQG8Ubc8yfsDP24EvYv1xxnKt9rNQ+co=;
        b=iAzzvi4+bMYcd4xQku3NmpCcQMJzi9BNbSKyPpRkLpnlirWxEycaw+LfRZTcARc2QX
         mt1wC+a3YRQbFJld9Fw4DiBIg9GEBbLWI/kpdmlHhg69QhOVhVQszTVNtuF08vY0bcDB
         ipNdU3BpD/5uwWmCnHciIiuY4mYBlE/7vZPP38Iygpk2Lemdd81tj4y8sEft1wCjMzsz
         MLY0RCwTa2KNy+NoDNFwnH4S3HgC/XNgpWHPKb6e1+igQqfRpUdvufQKUsUyP0TtaJCy
         2Zed51c0CZvJuKSxbDeuZ5MVHQ+RnuivKHs97SuGsumTV6Rn/sJoT2Cmzisvkvm5Aq13
         /E8A==
X-Forwarded-Encrypted: i=1; AHgh+RobLhH3e3vv1zVohqnhOgF/BzVcFo9NoS/0rz6Ht9sPdEOauG1AS7bKZBa1EIjlDW4JVGiLu3zBcwxo+FQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nS36dD0Cd0u8smDh32YFYFf4BieaatKQWJ5ef9L4sWJT0AkgDC
	dE6B4v4zAakUzevxbxL3TBd+K+V0JH+pKg7PFNp6ERPkWHdwA912woEjkOYkUxOdkKY=
X-Gm-Gg: AR+sD13ctPyOx6nwyhbQMDLQYw0EI9izbUeO37MlDFP2P9CHABQjThYOVphMauLDWhG
	e21UaiizCJCWiAj3P2kDWy2sL+Lz9gxB0mYUOsuWcwrcSqyCflan2KeKcoF/88asZtd6oRx8CLM
	vJVxywiUcjOOfIFoQymPRjJf8ucD5V2D0JVJ4KOGh6KxhCA6bS2lCqqIh9waGp6DdvyFdcHyFw+
	4oCZBhmvB/q+1JFLZOLpdZnWeP7cLOkuUKPp2bi1mKNFHWQI5augvwF7UAgFd7PerQwqnHc7044
	ODwWRlMug7oTm14kWn/mmBl3LnNSzVTpdTNFpxtTt3d87+aDRKh56ra0B1M63477t6A6yzqADPC
	yNOJQGBxC2fyj1r6tms8SEY98j/Fy2DJhGGGabqUQO0EC7qfYLcfu5iN4CUSKBPYJe2motvWXpY
	nf131U7Ybjwhkl0c76tD1YY3f/8vv72x9x9dHrcQiSaUQgpOKBgLTvYn9xGGIXC6Zk8frmC3UU5
	T3JHvE/NVNBlqOxa0Di1MJsDNiiB8x8Mx+bBK3q5rx/YQ==
X-Received: by 2002:ac8:5d49:0:b0:527:7a5b:ca67 with SMTP id d75a77b69052e-53036cc7263mr48464101cf.20.1788351423074;
        Wed, 02 Sep 2026 05:17:03 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53032ff4e90sm17590961cf.2.2026.09.02.05.17.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 05:17:01 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1x1jtk-0000000EB68-1U6I;
	Wed, 02 Sep 2026 09:17:00 -0300
Date: Wed, 2 Sep 2026 09:17:00 -0300
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
Message-ID: <20260902121700.GC2890729@ziepe.ca>
References: <20260427085344.941627-1-aneesh.kumar@kernel.org>
 <20260427085344.941627-4-aneesh.kumar@kernel.org>
 <apM6dOHcEI2ztWS0@nvidia.com>
 <yq5a8q5lz5yn.fsf@kernel.org>
 <yq5aecfdnv4i.fsf@kernel.org>
 <20260901143445.GC56830@ziepe.ca>
 <yq5a8q5kkoz3.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq5a8q5kkoz3.fsf@kernel.org>

On Wed, Sep 02, 2026 at 02:30:00PM +0530, Aneesh Kumar K.V wrote:
> Jason Gunthorpe <jgg@ziepe.ca> writes:
> 
> > On Tue, Sep 01, 2026 at 03:36:37PM +0530, Aneesh Kumar K.V wrote:
> >
> >> @@ -463,14 +460,13 @@
> >>  	vsmmu->vmid = s2_parent->s2_cfg.vmid;
> >>  
> >>  	if (viommu->type == IOMMU_VIOMMU_TYPE_ARM_SMMUV3) {
> >> +		if (arm_smmu_is_realm_viommu(viommu))
> >> +			return arm_realm_smmu_v3_init(viommu, user_data);
> >> +
> >
> > I think the realm vsmmu is going to require a different info struct
> > than the normal psmmu case, isn't it?
> >
> > If so it needs its own enum value.
> >
> > It would be nice to see a draft patch showing how the real vsmmu works
> > on top of the RMM spec for it. If we are using a viommu object then
> > non-vsmmu case should be identical just with an option in the info
> > struct to not create the vsmmu object.
> 
> Based on feedback on other emails in this thread, I have now implemented
> this without using a vdevice or viommu. This should make the CCA and
> non-CCA cases similar.

That wasn't the feedback. The feedback was to use the viommu and not
make a bunch of new stuff..

> +int arm_smmu_realm_tsm_bind(struct device *dev, struct kvm *kvm)
> +{
> +	struct arm_smmu_master *master = dev_iommu_priv_get(dev);
> +	int ret;
> +
> +	if (!kvm_is_realm(kvm))
> +		return 0;
> +
> +	ret = arm_realm_smmu_get(master->smmu);
> +	if (ret)
> +		return ret;
> +
> +	ret = arm_realm_smmu_stream_get(master);
> +	if (ret)
> +		arm_realm_smmu_put(master->smmu);
> +	return ret;

It still makes no sense this doesn't do the VDEV_CREATE too.

> iommufd_device_tsm_op_ioctl()
> 
> 	switch (cmd->type) {
> 	case IOMMU_DEVICE_TSM_BIND:
> 		if (!idev->tsm_iommu_bound && ops->tsm_bind) {
> 			if (WARN_ON_ONCE(!ops->tsm_unbind)) {
> 				ret = -EOPNOTSUPP;
> 				break;
> 			}
> 			ret = ops->tsm_bind(idev->dev, kvm);
> 			if (ret)
> 				break;
> 			idev->tsm_iommu_bound = true;
> 			iommu_bound = true;
> 		}
> 		ret = tsm_bind(idev->dev, kvm, cmd->tdi_id);

Yuk! Now this uAPI doesn't make any sense when you have an actual
viommu involved, we can't take tdi_id from userspace, it must come
from the vdevice.

I don't want two confusingly different flows, this stuff is hard
enough to keep straight.

Your first version was better, we just need to commit to using the
viommu for everyone on every arch and drop the the tsm_bind() API and
IOMMU_DEVICE_TSM_BIND interface.

The only draw back is the VMM has to manage a litte bit more.

Jason
