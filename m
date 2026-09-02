Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E90E46C84B
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 23:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788393376; cv=none; b=sVEOS/pL6JyKiXQy5Wi4FSXSw3iA3vkDCaQjGjH71iKIf2vZZP4mpPIVDS3XZoMzEg4bjgrrRW+/DaFEoGKzsayE3+B1yZ33K1mbHYRl+rhN2ZVbL3H4R117WHDpugIUNshpLhBR2fQITSAbkcss9WXr3pqjYd+IBf9v25EGkIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788393376; c=relaxed/simple;
	bh=oGFB4tUe4uIiJbL6QZtviPmqaClzJ2Rpq67zK1xKdQU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rZwdY/Qbzq5SuEH5OUPyE18lmBLVCiQZ34nj4nke6Pl/VbCTpNKKXWqYrzKlQbWKt+f2sWSxKL1YPB0bkuy29pckKXzeUfYbS/SSMezAl6tglqw0mWcteLcea7ENxU8PLySBeZ+kAgmJEFZEmqNS+WDtdWinNCvu67F78b5REpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=fgE6u5Fw; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="fgE6u5Fw"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-92e99ef0902so159220385a.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 16:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1788393371; x=1788998171; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JHkE0KygFhIS9HXgLrJJS0y5ES5oOeyv4LpvZ/FUmdg=;
        b=fgE6u5FwOySNUkvzGaJlawEus//LkhpelNifjkRYqnxI9FnFbXac0KoAumdj1GMHG1
         tB3Xuljnw1xEaEvEVs1NHtAgb1rdCGUafKVuyCikYd8QQtvvP8ksogJijOwtG4tgsvZM
         9CmfSXoaHYhyWBvdfTK4SvYtajqjeOyClHHBNYCTJHwU/E9nDTC++KWZBfISaJTQsqln
         MDBqla5fpv2N06vKOU3eMC4qxiujW7H/Ra6WdEdznMhUTJMvBNOO7WeMikr3dxLmzjyt
         s1XO6O+lZx0ahZ7AgsBDUYWMWKGBMGmCeq8VMwwnAgWNuikt5mYmCkHXbfqPrijHkBqf
         k15A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788393371; x=1788998171;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JHkE0KygFhIS9HXgLrJJS0y5ES5oOeyv4LpvZ/FUmdg=;
        b=gqhwnqxVgq0hAvPmMiHgx+wu2igS+1ufL2H+hHVCfxatR4ZOa9i/wF4ScD3kasp0mP
         asHCEhWHpK+HKCeFacnGP3DVZfFcQIxQ+qe8CH8JshFO0ddqPHdxE29bgVFb4om9WiTb
         d22K+U6k1Ipm4xv2A704fsv9rHPwpVrnEcDT9YujDbXB8XnQDb06aBnlgYEIF9sldmWE
         13uTrO0semUPHvdlQKMgnHvwED2LGg0+uC9SKwRtlkboQA72sgMKWlzeqN3Ofh9TSagH
         RHLtKs7U1dULeiCbrUQ1vzlwY71rd9HoixhE46BIhBw7LiVgKxHB4jfLEl+sOmtoQivC
         hT/w==
X-Forwarded-Encrypted: i=1; AKwUvByxGrkWqsUZAodYSi60jLvg2vFlQn+tLindo8/FtF6nI0a7UCzTI5YrBPsbut9+wjVdvz8o9sNSMBzAK+0=@vger.kernel.org
X-Gm-Message-State: AFuF++lqYrGldlGWhw50BNGMWcBYIKkZTHayNQZ7aMNiO9gZOtKlligc
	ksf6zRD8ceyC07MZEPkts8IDfXNI5fvwJ3rEooJECprSax3UiXzgIPQf9zjkaGRGmP8=
X-Gm-Gg: AYBFou0cHbr+YucZ+HrgFgBBTHmZjgXTfBA9XSONVIxtSmynn4DgUewaVCkuVnHd92z
	UZ22Tx8vs+myImLbNSWGI+cYRjDTQSJ9ryiDaXv27iwoMvIN2GNmBcPNPsrf6jiCa+/rFZi/Rlu
	BSG411YDsUP4HRlcUooqtyNVbDRw/6/+9FzN6MCV0S8139aiLgR1f+EonXoivUF/OgrOedUWcwl
	Ssen4CBt+7L96P9Uc+s5DNYGGPY7OUFovrk5TnOIcBpA/9mIc1MxhFMURIA1UxONcWhK4giNrbP
	tiqhsinNYT7OtfxZO422NmgfRuyR8TWc5Dec4BFFX3GX14c7ZkD41lcjd/zuhcZRsncq2JVLcCs
	UT1wKyNg+Z3uwQJBHkiMYUY486T5LL05uARXbigHCX8tsUlsZhf9QNS0mXYgSeYJISnkylFSgZr
	WqXTS5f7/3tGtdUA9KQGgEnZl5QalTyTBZG+o/pX+PGP3lXZA2pG6wxz56wPTrmBvGVNQ6d03qO
	9T4u9iST6qrUu8QyoRkrOH9Pqaf2efMHcZ47x63PlRNsg==
X-Received: by 2002:a05:620a:8c98:b0:92e:7ba3:73e5 with SMTP id af79cd13be357-939610139b3mr758596785a.42.1788393370920;
        Wed, 02 Sep 2026 16:56:10 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9395f3dd7easm362448885a.45.2026.09.02.16.56.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 16:56:10 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1x1uoL-0000000FTW5-1KK8;
	Wed, 02 Sep 2026 20:56:09 -0300
Date: Wed, 2 Sep 2026 20:56:09 -0300
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
Message-ID: <20260902235609.GG2890729@ziepe.ca>
References: <20260427085344.941627-1-aneesh.kumar@kernel.org>
 <20260427085344.941627-4-aneesh.kumar@kernel.org>
 <apM6dOHcEI2ztWS0@nvidia.com>
 <yq5a8q5lz5yn.fsf@kernel.org>
 <yq5aecfdnv4i.fsf@kernel.org>
 <20260901143445.GC56830@ziepe.ca>
 <yq5a8q5kkoz3.fsf@kernel.org>
 <20260902121700.GC2890729@ziepe.ca>
 <yq5aik4nztdt.fsf@kernel.org>
 <yq5aecfbzjyk.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq5aecfbzjyk.fsf@kernel.org>

On Wed, Sep 02, 2026 at 10:09:15PM +0530, Aneesh Kumar K.V wrote:
> static int arm_realm_smmu_v3_vdevice_init(struct iommufd_vdevice *vdev)
> {
> 	struct device *dev = iommufd_vdevice_to_device(vdev);
> 	struct kvm *kvm = vdev->viommu->kvm_file->private_data;
> 	struct arm_smmu_device *smmu;
> 	struct arm_smmu_stream *stream;
> 	struct arm_smmu_master *master;
> 	unsigned long rmi_ret = 0;
> 	unsigned long l2_sid;
> 	int ret;
> 
> 	if (!tsm_is_configured(dev))
> 		return 0;
> 
> 	master = dev_iommu_priv_get(dev);
> 	/* FIXME which stream to pick */
> 	/* At this moment, iommufd only supports PCI device that has one SID */
> 	stream = &master->streams[0];
> 	smmu = master->smmu;
> 
> 	l2_sid = ALIGN_DOWN(stream->id, STRTAB_NUM_L2_STES);
> 
> 	{
> 		guard(mutex)(&smmu->realm.mutex);
> 
> 		if (!arm_realm_smmu_active(smmu))
> 			return -EINVAL;
> 
> 		ret = rmi_psmmu_st_l2_create(smmu->base_phys, l2_sid,
> 					     &rmi_ret);
> 		if (ret || rmi_ret) {
> 			if (!ret)
> 				return -EIO;
> 			if (RMI_RETURN_STATUS(rmi_ret) != RMI_ERROR_PSMMU_ST ||
> 			    RMI_RETURN_INDEX(rmi_ret) != 2) {
> 				dev_warn(dev, "failed to create realm stream mapping\n");
> 				return -EIO;
> 			}
> 			/* The L2 stream table already exists. */
> 		}
> 	}
> 
> 	vdev->destroy = arm_realm_smmu_v3_vdevice_destroy;
> 	return tsm_bind(dev, kvm, vdev->virt_id);

I think we should drop tsm_bind() as an abstraction. It doesn't make
sense to take that round about path when we are calling RMIs directly
above. It was intended to be an abstraction, but it isn't working out
with this viommu based abstraction.

> @@ -513,10 +514,16 @@ static ssize_t cca_tsm_guest_req(struct pci_tdi *tdi,
>  		if (copy_from_user((void *)&req_obj, req.user, req_len))
>  			return -EFAULT;
>  
> -		if (req_obj.tdi_state != RHI_DA_TDI_CONFIG_RUN)
> +		switch (req_obj.tdi_state) {
> +		case RHI_DA_TDI_CONFIG_UNLOCKED:
> +			return cca_vdev_device_unlock(pdev);
> +		case RHI_DA_TDI_CONFIG_LOCKED:
> +			return cca_vdev_device_lock(pdev);
> +		case RHI_DA_TDI_CONFIG_RUN:
> +			return cca_vdev_device_start(pdev);
> +		default:
>  			return -EINVAL;
> -
> -		return cca_vdev_device_start(pdev);
> +		}
>  	}

This stuff cannot flow through sysfs. The VMM must support running in
a sandbox so it cannot easially call out to sysfs while the VM is
running. That makes the sandboxing more complex and ugly. The flow we
have now relies on fd passing from the launcher into the sandbox to
get things like vfio and iommufd into the VMM.

So these actions really should work the same way unless there is a
strong reason to do otherwise.

Given these are all acting on bound devices, and those can only be
created by iommufd, it makes more sense to feed the operations through
iommufd into the viommu and vdevice ops. AMD wanted to create such
general command ops anyhow for their viommu emulation (non cc).

And.. then you don't need struct pci_tdi. The vdevice is effectively
the tdi and the existing locking scheme in iommufd for vdevice takes
care of everything the tsm code was trying to do, except in a way that
applies to every viommu out there.. This actually makes a lot of sense
because the tdi is not really separable from vfio. You cannot have a
tdi without a kvm and you cannot link a pci dev to a kvm without vfio.

Finally, there is really nothing about the viommu_ops that has much to
do with smmuv3. It would be fairly straightforward for the tsm_ops to
be able to create the viommu and provide the viommu_ops. We can get
there based on the IOMMU_VIOMMU_TYPE_ARM_REALM_SMMUV3.

This then would open up a much nicer split where arm-cca-guest.ko can
provide a realm smmuv3, and inside those viommu_ops are all the realm
& tdi related ops, psmmu, vsmmu, vdevice, "guest req".

The arm-cca-guest can just make a simple function call to SMMUv3 to
get the phys and interrupts. Somehow I think Will would like this
better than adding to SMMUv3.

Now that the viommu stuff is more developed on the iommufd end, and
the RMM spec is more complete with vsmmu, I think this arrangement
becomes visible.

What do you think?

Jason
