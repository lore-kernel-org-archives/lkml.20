Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BBB6517BDA
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 12:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790165928; cv=none; b=lb1WtDYPdQ0yTW8dOQXaXbK4plILAlLonmNrAoJX3uG1vzyKgMFzVxj5WsTbcx++eIk/iv/bKkhn2uthPOrqFlgFmtbfcqQ4AFQs0MklSp+XdVRywf1T3/PbTfIQeYSjJx8/D4XkUmZ0ObPeuDL/jcao9wytTDLQF8k6ntWiPwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790165928; c=relaxed/simple;
	bh=6uyCzTA89gitKOhgv2KiUrKJJ9yVEy5QdsBqN5+DQCQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s2f0Vkoc2GQM932FTiHrs+iHNIfsE6jBzeivmsDuvnh9w4rQf93pIDxpOuGnmsO+ABtioDcn097K2kzYWFZ3lp6mlP5Pq1UtzkUKjCtP+6N72Vbyh9nmCnHfIPVjNwPhrnH6aCitermfgAYptQflxPuIdtrwxcW8BhQ/j2aDISM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZDU77mHW; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZDU77mHW"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-498012a61f6so33925e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 05:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790165924; x=1790770724; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yKoljqZU8Nwxrz36bE/WLCNEgSRa/n5CLFAsiZ8BcVQ=;
        b=ZDU77mHWB8aLfwyIjkq6gjOOQs7DJEep5x1an63SQvhVN/bGxVgHpdHn7Lb58vbK/h
         imvQxshPKWioI5rjj11KiBZUzCNrBQPCBk2FRAr+VybyNdrrgfpazOrEqRDtsWHDFB+1
         +VKYR9BpIc10HHFxu7piFn2I4y7vdY8rPiFAGlEKoxRlgYMS9e6eKdirTLy/+360SRil
         zvALB49ii5dZbNNTDLHY4Yqt2qX+CyMB53swG41+91taxDYuOYL348Hc/yhm0EYaYzAE
         yJuZ/gzMGkmYphEUx9gnohxVngQGyCYTGemkojOe8fNJIZrplcdmmn3PKeiM5CmcN/wh
         BiDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790165924; x=1790770724;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yKoljqZU8Nwxrz36bE/WLCNEgSRa/n5CLFAsiZ8BcVQ=;
        b=dYZgk6OlBBqJj+qAm9m2pMBnkojs681KLNEojMdtnFQsx34v7t+Pi9MSRbOC9XtAJb
         2bulyz0P6M/vXsZXJg1lTmgrdVMO6EUxjNRllCBpG7xshiJz4+A9U4v5pV5tXpFVA9D4
         3g6RTxHwSmvWLeBFXWkKxOKQFihibZavvvPAf7ktaIDpTznDtXDGGjH9M/bD9H7sJ2+f
         cohV6pOUqbaZ2k0TdKPoBpsTbxviESrzsLKvZMGZy74t5VIsgZW5mKTFJaSIIcf3uf7b
         d4xKeY5N3zSsrsAHXM7b8QaIeCMEdT0J6VxMgbNcgl60RzbpA48fdZltaBrZ657n5s7v
         8wrw==
X-Forwarded-Encrypted: i=1; AKwUvBy0Qwv4/ezLflo9vdgTr33xlluSV6X5D3dAK4Ln9vf8t1dYwvoJeuqt7VND5YiiVhgajV1C1/kGbDsD1oE=@vger.kernel.org
X-Gm-Message-State: AFuF++maWEyFu3sVJZHAVskIKymBDeCQdauC5899zcRsLH+5hNl1Z72V
	jQl+O0vnsja/KGqp5MFvL2tQTsNkKUxBUVkTDu8NhpP3YqLpnD/ptpX1v3dTrEb/9w==
X-Gm-Gg: AYBFou2rvZCk7vWVqlDVxtJf6S5WKImu0L7hpvauBP69tucT1PDTj8fPuaYgTz0neJ6
	tdWkvAK9+oL1zK6oqwkuovMlODgcikVB9IUtdaiNpeG1STg7CY66Tr7qFj21IoK+wW6YQ/Sq5ad
	vFUNTxNYNoVygvJqxf3Q6+UT80N9IcQCX9WT553O0HV9wta/f5Z/3E3b4wp18o7jYQakEztNIIH
	Yw9vGhm0dYJtDAJ9leNSlYDuH+UOtVs2Ns+6ELjnpnjDHmFUrqZ6vKNLt6Xt3azD0ndHmvVhEqG
	tH3JEoiSRAPQL18iNSHYjQHW0w9OcjrIEwTBCtA2+hwj8/uS4WMKLF2jvaS61fpm5xSM/1lnCdL
	k0AmdGAmYd7N8iVy8EvDYGWKt96R1pYVJqZq1Jgte90oKQmmcY96hoP9/yT4QR5dgSAGtZy6CoQ
	AqcapfeArwMHXWdqDHI2sMN7C0Z6Swrld1Zti960RMsXGd6VMOaSZG7g7Gqc2u+nJ1on50Rtfmq
	CZTlA/rlqRnJqFbeqrZ3juWKeTURD5pyaYpEw3p
X-Received: by 2002:a05:600c:3b86:b0:49f:e1d3:fe03 with SMTP id 5b1f17b1804b1-49fe1d4031emr732825e9.3.1790165924117;
        Wed, 23 Sep 2026 05:18:44 -0700 (PDT)
Received: from google.com (250.192.189.35.bc.googleusercontent.com. [35.189.192.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fde1c0f6csm90764065e9.3.2026.09.23.05.18.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 05:18:43 -0700 (PDT)
Date: Wed, 23 Sep 2026 12:18:39 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Nicolin Chen <nicolinc@nvidia.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, iommu@lists.linux.dev,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, joro@8bytes.org, mark.rutland@arm.com,
	qperret@google.com, tabba@google.com, vdonnefort@google.com,
	sebastianene@google.com, keirf@google.com
Subject: Re: [PATCH v8 04/25] iommu/arm-smmu-v3: Move IDR parsing to common
 functions
Message-ID: <arPDn5c815X72PSF@google.com>
References: <20260922131259.2975334-1-smostafa@google.com>
 <20260922131259.2975334-5-smostafa@google.com>
 <arLa0E3xq5dGuPpd@nvidia.com>
 <arOlQtPYzF5yT8fP@google.com>
 <20260923115257.GC2545495@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923115257.GC2545495@nvidia.com>

On Wed, Sep 23, 2026 at 08:52:57AM -0300, Jason Gunthorpe wrote:
> On Wed, Sep 23, 2026 at 10:09:06AM +0000, Mostafa Saleh wrote:
> > > > +	if (coherent && !disable_msipolling &&
> > > > +	    smmu->features & ARM_SMMU_FEAT_MSI)
> > > > +		smmu->options |= ARM_SMMU_OPT_MSIPOLL;
> > > 
> > > Will pKVM ever use MSIPOLL?
> > 
> > No, this version does not support MSI and hides it.
> > And this check can not be moved because disable_msipolling is a
> > module_param.
> 
> Could you move the above if into the shared area and have the callers
> mask off options if they don't want it?

Sure, I can move it and pass disable_polling as an arg which the
hypervisor will set to true.

> 
> > > > +	if (smmu->features & ARM_SMMU_FEAT_HYP &&
> > > > +	    cpus_have_cap(ARM64_HAS_VIRT_HOST_EXTN))
> > > > +		smmu->features |= ARM_SMMU_FEAT_E2H;
> > > 
> > > Why is ARM64_HAS_VIRT_HOST_EXTN left behind?
> > > 
> > 
> > cpus_have_cap() can not be used in the hypervisor.
> > Also, ARM_SMMU_FEAT_E2H is not exactly FEAT_HYP. As it defines the
> > world the translation lives in based on the kernel EL.
> 
> But don't you need this FEAT to issue invalidations correctly?
> pkvm never issues a S1 invalidation?

No, STRW is enforced to zero (NS-EL1) with pKVM as the kernel must be
running in EL1.

pKVM will issue S1 CMDQ_OP_TLBI_NH_ALL to invalidate all of S1
after S2 changes and invalidations.

> 
> > With pKVM at EL2 ARM64_HAS_VIRT_HOST_EXTN is always true anyway.
> 
> > And the hypervisor never owns a page table itself, so it never
> > checks this feature.
> 
> ? I thought the whole point of this was for pkvm to own a S2?

By own I mean "it's own translation regime" as if the hypervisor wants
to do DMA itself (synonym to EL2-S1 translation) in that case the
hypervisor will have a different STRW and use the E2H stuff. But that
never happens, the hypervsior populates S2 to enforce isolation of the
host but it never uses it itself.

> 
> Maybe same as I suggested for MSIPOLL, set the FEAT and mask it later
> if it can't be used. If KVM implicitly knows it has
> ARM64_HAS_VIRT_HOST_EXTN then it should operate with ARM_SMMU_FEAT_E2H
> set.
> 

As I replied to Nicolin, the problem here is not the FEAT being used or
not, it is that cpus_have_cap() can not be used in the hypervisor.

I think this can be replaced with cpus_have_final_cap() which should be
the same and then move this code also.

> > Otherwise, I think we can move this check and use cpus_have_final_cap()
> > instead as it can be used in the hypervisor.
> 
> Or that, I don't know the difference

I will try that for the next version.

Thanks,
Mostafa

> 
> Jason
