Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F8123E51F5
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 17:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790183286; cv=none; b=Udocfap3SNEtXmmm6bVMT3gPVsV9CpJKhxGOUy4rxHjIwlIMCKN+l5Slqx2T9Iacy30rO/Yz6ZVoIBlsPtu3XdDlvjzo6BUsPXugqnvBtYzmZT/J3vWOJg0spwS9Yu0EyAp6hBFhQbSr4vG0m2Ye1n74cTW03H3n/pAqRgbQqL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790183286; c=relaxed/simple;
	bh=cNl6b6j0ZD9iEUUf0B0ghdkeaT66llrYIqOEGQey0qQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ECw38sRIzU5xSV5Di+Mk954EtGNLbYZYnhr4oPYqRv882Me5ZSHg+cy0JNDwjhPmP/QzHD2VBbz5N9wFLPbM0SqzZQgF4e3+mo/GyMUqVRpJ6Ig4EbUkR/FbUrnmNB/UIZfkKaPIGhL7SPTYwHMqwCu/Z4s3mvyXt/hOZ91xkoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=geq3ngvC; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="geq3ngvC"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49e65a8f70eso1265e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 10:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790183282; x=1790788082; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+sWyggwBV1D9IUYjZa6aLkPXJtAz+OTvh2XpzdjOSmY=;
        b=geq3ngvCNmctXagaPr+WUAGljtvF/IOhNe2i1wF5ZeYbaSc26yl2zkMee0ABS0gsdi
         Vxx5nSmiz0FS1WxTYHOeKsjvip79tRWTqwxbpj1itKthNzZSQGD6SwZjYPYFvURhfKXc
         Y1mT6x32ongDGI2uJZ2cO7KQa2J3Hs5UGh/A0OOvLTzdcnMpNU+j0Ghv7dGd8dIsEFcq
         8yJ9G/Fqbh4bJKIjqfTiBNh7sV6pnY/Xdz6yhLcrAw1O8638n+KnqSnoy2sVmQJH5BU6
         NwZA+BrwUSezY14qK1IPrkhgqA+hlw07vJknXAgQNxkgGrG+cAFcSUUugdk1RazKBQPv
         deig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790183282; x=1790788082;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+sWyggwBV1D9IUYjZa6aLkPXJtAz+OTvh2XpzdjOSmY=;
        b=1V0opX3XZLJpwjVK6JrhIH6I7vqnstyLESvayJiZp4EQMyCjqQjyAdsc1CI+Kmi7Az
         6iMqxS7uaaWzPs40EUwA5iiUS6QteIPSQ3aeXAW4PWSBpb2s/C0ZWLMZJOJpP081CN+j
         VdtVQ/f/wy+6J3mYvvissDbd6QJPbjAKqk48iPueEoioPmGu3iF2gfXZLuRwblqe/Fj2
         TW9msJH+XCzzzueD/HCiqZa3JTz447IyiF5ijruioXmAL0kLvt02ggUhusQ5FcRkuFMX
         sWqg3y3MxoVDz8quW/h7LrNcaJjOMJMXYfo/Hm8f7Eqdv0AgPmUQQd3m8EtLRNHM5MIg
         a7AA==
X-Forwarded-Encrypted: i=1; AKwUvBw9z6t+DWTzawwR4dgMicxhbuliY0mR6gYPClg3ATQbL07Txj0YloZrpkSC2BDx7KGwUBYPuxUG4iNQ0/c=@vger.kernel.org
X-Gm-Message-State: AFuF++mVpcCJGrgyXEiDlEALA5StSUBefhBI+qhNf4s7Ewjlia0gfQTx
	yOJCAeXLY9Mq/hPo+SdlkW8PMDU+KApffuLlNda/+0X5NzGO0uIQPM/bXyeaAM/OUQ==
X-Gm-Gg: AYBFou3Pv3HuD9ojzKMY8OhT82XEoRm4QjoNObcG+qvH/CnUZWu+MxybgIBH+3L1vLD
	B+l57ib+llZD8jHzI00ujS+GyeMi1auWyfxufAtxhjfQdJrOv06gagj3C+Bssj0Xm4WLFilUSgK
	NfAX+ZBtmxOt9ZIHSY8IMs39ozDXQ3tHKg11jLuPNT9f0H0sxRC8cEcJggqlx/N3jRut4Fw09nl
	UNYGRuIvfLT3T7HrLxmeTTFUEmQ3ACg0hV0RvcoiBvC2lIhXU7JwAxTpxMwdp3L1IHEPcvG+e9S
	gm9+qrXE/8ikJamAdMZmyBVzLD3CKVvvhWyWE18JzGvDeKUo5WT+C60QfWyyuLtQTIwK4AVtoAt
	26EeWHP8ibmytUrVB4vscpLpah32/pFAe2xJ7A7+L7tgjSJerFbqcYKOQAvTb/FOCV30S6RsmhJ
	shiQ509ke3PNEhCnUUdJUCRKCSFG0b+DHUDCIrB6GMyptAcOR568+rBHW68NShjB/wmG2RGf0eI
	MVih0Ca1Mtt8QhpMgPCxrC5Pvh1sI+m2gJgvmlE
X-Received: by 2002:a05:600c:4e8a:b0:49f:e185:f3ae with SMTP id 5b1f17b1804b1-49fe55e13a1mr140635e9.2.1790183281720;
        Wed, 23 Sep 2026 10:08:01 -0700 (PDT)
Received: from google.com (250.192.189.35.bc.googleusercontent.com. [35.189.192.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5bae53dsm575695e9.4.2026.09.23.10.07.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 10:08:00 -0700 (PDT)
Date: Wed, 23 Sep 2026 17:07:54 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Nicolin Chen <nicolinc@nvidia.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, iommu@lists.linux.dev,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, joro@8bytes.org, mark.rutland@arm.com,
	qperret@google.com, tabba@google.com, vdonnefort@google.com,
	sebastianene@google.com, keirf@google.com
Subject: Re: [PATCH v8 11/25] iommu/arm-smmu-v3-kvm: Add the kernel driver
Message-ID: <arQHamIHuaUqlJyy@google.com>
References: <20260922131259.2975334-1-smostafa@google.com>
 <20260922131259.2975334-12-smostafa@google.com>
 <arMbxX+sqTS3gByB@nvidia.com>
 <arO9hGmEx7c9mZAj@google.com>
 <20260923155507.GJ1540250@ziepe.ca>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923155507.GJ1540250@ziepe.ca>

On Wed, Sep 23, 2026 at 12:55:07PM -0300, Jason Gunthorpe wrote:
> On Wed, Sep 23, 2026 at 11:52:36AM +0000, Mostafa Saleh wrote:
> > I can add more info in the cover letter about the code split. Mainly:
> > - arm-smmu-v3-kvm.c: Is the kernel driver for KVM SMMUv3 (this runs in
> >   EL1 and can use all the kernel functions).
> >   The main job of this driver is for discovery, it doesn't do anything
> >   else in the runtime.
> 
> Maybe call this el1 stub or something like that?
> 
> guest_pkvm_stub.c
> pkvm/hyp.c
> 

It is not really a stub and I was following the convention of
arm-smmu-v3-(iommufd/test/sva) I think for the pkvm/ one it can be:
- pkvm/arm-smmu-v3-pkvm.c
- pkvm/arm-smmu-v3-nested.c
- pkvm/arm-smmu-v3-el2.c
- pkvm/arm-smmu-v3-hyp.c

All of those are fine and for the other one:
- arm-smmu-v3-{pkvm, nested, el2, hyp}-init.c
- arm-smmu-v3-pkvm-el1.c

Anything along this lines, otherwise it's too vague IMHO.

> ?
> 
> > > > +extern struct pkvm_iommu_ops kvm_nvhe_sym(smmu_ops);
> > > > +
> > > > +static size_t				kvm_arm_smmu_count;
> > > > +static struct hyp_arm_smmu_v3_device	*kvm_arm_smmu_array;
> > > > +static size_t				kvm_arm_smmu_cur;
> > > 
> > > That spaces/tabs in those two lines look a bit odd..
> > > 
> > 
> > These are tabs to indent the variables, similar cases exist in the
> > SMMUv3 driver, check arm_smmu_cmdq and friends for example.
> 
> Personally I hate this style, it is a huge PITA for maintenance and
> makes diffs bigger than they need to do. I remove it whenever I have
> the chance :)

No strong opinion I can change it.

> 
> > TBH, this is a bit of a hack. The hypervisor can not allocate memory
> > at the runtime. All of the hypervisor memory comes from a carveout
> > allocated at boot (see kvm_hyp_reserve())
> > 
> > So we allocate the worst case for memory mapping with leaf granule. But
> > the hypervisor also need to allocate L2 pointers and the SID space can
> > be massive making the upper limit for this too large.
> > 
> > However, smmu_hyp_pgt_pages() defines the minimum pages required,
> > actual allocation comes from the command line, so it is possible to
> > tune the system without re-compiling the kernel.
> > 
> > Thinking about it now, we can just drop the 500 as this is the lower
> > bound, earlier versions of this series would allocate the carveout
> > based on this size, but it is not needed anymore.
> 
> I see, and you can't scan the ACPI to figure out all the SIDs used at
> this point to get an exact estimation?

I thought about it, but it is complicated to scan the DT/ACPI/platform
bus and I don't think a driver should be doing that; going through each
device with IOMMUs, duplicating existing logic...

And even with that, things as PCI won't be there as they are dynamic.

I think the best way is to remove the 500 as it is hacky, and rely
on the command line option.

> 
> Not being able to manage memory after boot is rather an extreme
> limitation.. But a huge amount of RMM's API complexity comes from its
> granular memory management so I can't really fault that..
> 

Yes, that was one of the main sources of complexity with the
para-virtual approach also.

Thanks,
Mostafa

> Jason
