Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA4449DBA6
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 12:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790165009; cv=none; b=Ua9PZWkxIL7mbj0oSCDR3G4NvPnbYtfTa6Mpu2c+Znn3fF+BmuqQ9ql3BAQpOXroRDCmxSFOCZQX5Wq2wxfRdISxW4h1f4P0ha/6Nne8dA1kQy1/Zvao1LejBjBkxHDfFojwrbLK25W6ga6FiJTm9ECAPykHfgaCjeeuAk5nP0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790165009; c=relaxed/simple;
	bh=H2NPzrrws0FqCnXLTgS7FTxVhyxjuGqZv7SYvPCD6qc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dXBDAxKIKmgW58+tou0w5zifU8GWwGXpQj06oSJuuyQQmC0sTJEUtiaSlNP1ZrALYnkHpH4C0YK+4nJ7BLl90rizsaTPuIgrFiz0NCQNrl7OlGWNbcZnEmYzZlcmunHzJFisx9/2X80BasOj1oXOcOVwa6yYOR6K3w3JY7jAio8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aE3WH9xN; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aE3WH9xN"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49e6425f96eso40685e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 05:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790165000; x=1790769800; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Jivi9KM6L+A+vDAYK+1HL6GBVOU14mX2y+wEPboH2kM=;
        b=aE3WH9xNX0xAe20OjXRhbnwAeKQ0yn4vla6q2YTv6HBlgkVXLCoGA7qwTUDovKNa9W
         jvskgx1LvDmEayBgkkMjFDTcGq/Sfp58VjcuzAt0zQEa7QlwQUvhYkhEiMwSitOc3n5S
         nJRBKJfUrM97VQ3Xcijoz1/jbyw2hFcTumXc2v1Gci0VewkxMDkUyKRLPJEDhvjx0/Ve
         /rcXJ0f804BTDC8DnKAO+zEcPu7BttWGPRqTCRfK33CUVSLuNQztiAP0lmEI1aAQ3Qhp
         VZS4Kxw8tiPafZw6OtGv6RogKqxUkpgenS30VxOMEo1mixNFvex+1k+DBD6wsC44LviH
         iA2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790165000; x=1790769800;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jivi9KM6L+A+vDAYK+1HL6GBVOU14mX2y+wEPboH2kM=;
        b=FuplTNAuLjmWuTeGzPuVzzWgSrvXAaeutIbun7WO9d/U53sb/lcCbu2C5rBqozfeDe
         WKB7Ah08LxsU2qJqNM0COYpi2o/B18KXHpYRKutQyp5F/BBU49IyvTEasvRQhS0G8CHh
         xY/G0cFCM1oC3yRZTiviQbcs3fMK8rOfWEMM0QT0a1ms3CJwQ5g0Zlwa2D12fiztixlb
         Dq/CxWfu43n8hodec7uuHkCXSXKkCBUUVXHAa3FTmR/iUHOdhrT2zKtUjen67LEeHTV+
         9wlQ7x4j7cP6CfVuHaqFNDoQsyUxEgVC6imIao0E973ctYU5JD6+6rQyFmdt2h5dEJQw
         SjSA==
X-Forwarded-Encrypted: i=1; AKwUvBzKFxX8AQ5+jdmwsEHJuQ1N5fsFdy2Z0MrNCjgc1c4tR9HwAclmvYIXYJxiCjXgNrcj/qa4AuU2gJYFk2U=@vger.kernel.org
X-Gm-Message-State: AFuF++k38tdUt1niBvRe913vEkkIqmaAE5cs/WxxytNIVHs1YmXE467E
	G35eTyWDa0H+TrDKNrV+DRYDgS6QCvWj9V8V/slNIxmvVP8EteIHAhwcLAcGlRiU1yaJOa3O3m5
	UQv/3dQ==
X-Gm-Gg: AYBFou2iZGjHbmV6XNoK6K8RUZoIDOKurgIyI5TXUGTHWpk9gsF/J/COLRc7LbNlS1i
	7T/LvWyCDaoI/ZIlXwM7OYKJ3JMvrtGCZqLeI6eINCERAfVa7eqJFI88WElsJS/YkzqzR9My/Br
	Z74bKlL7QGNS1eQsyiPAfex5acuHHPwRlO4Rt2dS+CVQrzlwhCfq2JB1otuM0F0cK4IjN/uGVGO
	5c1AsT9PfODPZ9c4NK8FiEslp3CkLE8i7B8rUsRCSzDoDTTFpGK5Zrz5A/t5Ibu/ajChC1HPWpW
	qvvtYcowLPiKcmp7opweoDuofu8a1YDU+yxQ1PjO1KumkHF2vBCzsRW19VEuIYmzqv0aVBAvggn
	16U4GruC41GE145pCllrqoi3DCNnY7+UZU5fWSnFq815oCCJAuwHax2iEk3awaOL0ptXXzc+vs2
	ooy7PmY0UyOfSbJCDdokp6zc76GUHs4WzzMr07zaJz+8byqJzXbNtLENHsDdusOvZHAlmYhFYMX
	qwpxgIq5l19C9XjH3ixu0h2jRq00tgFurh5vOy+4bA/Rro+6c8=
X-Received: by 2002:a05:600c:35c3:b0:49d:24e2:5454 with SMTP id 5b1f17b1804b1-49fe0c4a230mr920275e9.13.1790164999501;
        Wed, 23 Sep 2026 05:03:19 -0700 (PDT)
Received: from google.com (250.192.189.35.bc.googleusercontent.com. [35.189.192.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fde1ccb90sm73291145e9.6.2026.09.23.05.03.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 05:03:16 -0700 (PDT)
Date: Wed, 23 Sep 2026 12:03:12 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, iommu@lists.linux.dev,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, joro@8bytes.org, jgg@ziepe.ca,
	mark.rutland@arm.com, qperret@google.com, tabba@google.com,
	vdonnefort@google.com, sebastianene@google.com, keirf@google.com
Subject: Re: [PATCH v8 12/25] iommu/arm-smmu-v3-kvm: Probe SMMU HW
Message-ID: <arPAAK_O0d68dorh@google.com>
References: <20260922131259.2975334-1-smostafa@google.com>
 <20260922131259.2975334-13-smostafa@google.com>
 <arMu0An215TY3tM9@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arMu0An215TY3tM9@nvidia.com>

On Tue, Sep 22, 2026 at 06:43:44PM -0700, Nicolin Chen wrote:
> On Tue, Sep 22, 2026 at 01:12:45PM +0000, Mostafa Saleh wrote:
> > +++ b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.h
> > @@ -11,6 +11,9 @@
> >   *
> >   * Other members are filled and used at runtime by the SMMU driver.
> >   * @base		Virtual address of SMMU registers
> > + * @oas			PA size
> > + * @pgsize_bitmap	Supported page sizes
> > + * @sid_bits		Max number of SID bits supported
> >   */
> 
> Some of them belongs to one of the prior patches.
> 
> And, if we are going to list them all, could we do in kdoc style?

I will fix it.

> 
> > +++ b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
> > @@ -29,6 +29,47 @@ static void smmu_deinit_device(struct hyp_arm_smmu_v3_device *smmu)
> >  	smmu->base = NULL;
> >  }
> >  
> > +/*
> > + * Mini-probe and validation for the hypervisor.
> > + */
> > +static int smmu_probe(struct hyp_arm_smmu_v3_device *smmu)
> > +{
> > +	u32 reg;
> > +
> > +	if (!(smmu->features & ARM_SMMU_FEAT_COHERENCY))
> > +		return -EINVAL;
> 
> Does this need to check IDR0.COHACC? If not, an inline note that
> explains why?
> 

This is similar to the kernel driver logic, where FW will override
coherency and in case of mismatch the driver will just WARN and trust
the FW.
pKVM can't print a warning as WARN is fatal in EL2. So it just picks
what the FW says. I am not sure what systems rely on this, but I can
add more strict checks and fail probe in case of mismatch with pKVM.

> > +
> > +	reg = arm_smmu_idr0_probe(smmu);
> > +
> > +	if (!(FIELD_GET(IDR0_TTF, reg) & IDR0_TTF_AARCH64))
> > +		return -ENXIO;
> > +
> > +	if (!(smmu->features & (ARM_SMMU_FEAT_TT_LE | ARM_SMMU_FEAT_TT_BE)))
> > +		return -ENXIO;
> > +
> > +	reg = readl_relaxed(smmu->base + ARM_SMMU_IDR1);
> > +	if (reg & (IDR1_TABLES_PRESET | IDR1_QUEUES_PRESET | IDR1_REL))
> > +		return -EINVAL;
> > +
> > +	smmu->sid_bits = FIELD_GET(IDR1_SIDSIZE, reg);
> > +	/* Follows the kernel logic */
> > +	if (smmu->sid_bits <= STRTAB_SPLIT)
> > +		smmu->features &= ~ARM_SMMU_FEAT_2_LVL_STRTAB;
> 
> The IDR1 reg guard and sid_bits can be shared with the main driver.
> 
> Maybe add an arm_smmu_device_idr1_probe()?
> 

I thought about that, but this will be only used for sid_bits, the
hypervisor struct doesn't have ssid_bits as it doesn't use it, it
only shadows the STE and not the CD as the CD is translated by stage-2.

Other fields also not used by the hypervisor (PRIQS, EVTQS...)

As sashiko pointed, I will need to add ARM_SMMU_FEAT_ATTR_TYPES_OVR
check in the hypervisor, so maybe arm_smmu_device_idr1_probe() can be added
to partially probe the register and return the value so it can be probed the
main driver.

> > +
> > +	arm_smmu_idr3_probe(smmu);
> > +
> > +	arm_smmu_idr5_probe(smmu);
> > +	if (!smmu->oas)
> > +		smmu->oas = 48;
> 
> The truncation can be shared with the main driver too?

The main driver will print an error, if arm_smmu_idr5_probe() fix it
silently we will lose that.

> 
> > @@ -43,8 +84,14 @@ static int smmu_init_device(struct hyp_arm_smmu_v3_device *smmu)
> >  		return ret;
> >  
> >  	smmu->base = (void __iomem *)haddr;
> > +	ret = smmu_probe(smmu);
> > +	if (ret)
> > +		goto out_ret;
> >  
> >  	return 0;
> > +out_ret:
> > +	smmu_deinit_device(smmu);
> 
> Nit: out_deinit

Sure.

Thanks,
Mostafa

> 
> Nicolin
