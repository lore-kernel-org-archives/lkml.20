Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3A4C4B129F
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 17:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788456003; cv=none; b=ddg+ZVF7HFu8xiXqTEx/scnTItSnlzYA0GHm+OUy6+39UKAiR+Rfvz+mjCTLWtYDX9t/TCb1s8OUwIQZ7oe+KDEajYus9yRQ6BKzkGpzMlrdUsVg4y0fdROSlqr9lzJtT2uAuALaWHxbk0PM444q8/VnbMJqjYA6Y49sea0dsnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788456003; c=relaxed/simple;
	bh=TvPo92pdtlY8GQQ43OPNhXsu18ZiYLAliP3gJ6Ty5EI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ta96jcuosW6gN5i3mlKYkbMpM0fnXD8oLG5+LDDdewbG5XtQBBvZtEgnZwWDguXCvYGVqtFwrLqkJwJNxT9z6GQ30Z+FBfsHdst6x5eYS/RoBlOTvO6oyGj37hOKBy60HsflAk2s2D3hzJgD4aRjOqldwL+yBpNL2aMti7z5V+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=C63S+wC2; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="C63S+wC2"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-936e393176fso3671285a.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 10:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1788456000; x=1789060800; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2HzZSHSS3HI/mCzuK+4yTezfsReb9f4u2CLSOp9ExL0=;
        b=C63S+wC2V5XAwIpq0RCK29rusCnDeJklBdyKVpPjTDaJKbGLLRKHO/kmcI9om1ubBo
         DIJbqqpEoU5mMDqfFpM2SucaU4LVLf82Adg88aWW3vqXzKjadY5dbVAJsPlFCvmjbD+x
         NpgUvOgUq7GLYWul2jmsUtSvV3GnYt91m1L0P6ln3WYzLCe+sgAMQ+XQrcHXNUrdABiH
         cKdydE45fRuCOLiJPcbH81UovejPoNsyyhy24On02meSyzmdB1Ga9bzEBzdbGndwVCPr
         1zpnVJfCSk5Hd3lGgWROr8RlMCdEwfCIMGa2M9U/x9XphdkOasZcmpkwQOvclH7AD5Es
         z8/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788456000; x=1789060800;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2HzZSHSS3HI/mCzuK+4yTezfsReb9f4u2CLSOp9ExL0=;
        b=WXdg97091y6lH0vZLoo6owa/fDG+8UwO2XEbrEB+2NJfWNMjv9mnBv5YFONuTdt6qd
         6AJxVgMcuuwpV0rlENobTll0FnUAkYXBnl3OGuEIZuRVbF+WLBXILHXtRYTm42cfjMJ3
         IrPkpLF9+sOqQQvHUi16w5pLO3CYhchtZQif/o91BtT14wK33W0zMnVHDpKiniEUKKOK
         LoLVuCM1Ln3io2kWfumno+0L47wHlC3daPIytLXtTtMRFnt5/JoF31A9Pz0K2Oay/NmR
         HuVHFE02fUALpXNwtUPphi0WzCwrr3GsZG9A+OVo60S1vUht39zCa0iWXTbKoy8gFBGp
         yLHg==
X-Forwarded-Encrypted: i=1; AKwUvBwGU8rk03ZR1JnwjQjrsPbhQY/bo7QmLViYjDSGUHUjfJwYZfYZE9nZS4Nk0aNuyr2bVVQRS1nsYe+B5rE=@vger.kernel.org
X-Gm-Message-State: AFuF++n74xkk6kbzQVT9xgoF8ikmbCTwQyQC15VyJRsSN/TcNMm87Mmp
	sKgVOY62rweqPIhUkC1Si9YedPTdEWrLpZyqFDrf+K5RE9Bgy1dCdg3C0qmdyAOrgng=
X-Gm-Gg: AYBFou36KHezaW/zjsYXhlDIa1QF181kNVmtCWlsWUCI1llna7A8aBe5n51GJlC20Wm
	PTb80j3/Qf+OY/WIJTntQeno8g3bRboJEkOf6KauXg/vNcp21wIpQum7+lptBtEICxl/gdxvtRG
	suVSXO2XWoh4TRX4AJnV9gZ41gFxzPXmUzG+RAJIsQDetUepwO9euTgZkjNIgWl3HZs/NkH5V1r
	ZY69DkAUZR48XEjH7V01YKnOI+WOn1xtQZ5ddjRruB61nq3inby+q4oXRSW/BPYqolYDOOA8onf
	ULUvODf++Pu8540leGepu9C8FwcgMLnqYjxxjPIvZrRNQYLyAV0rV6XcRcQt4JuqeLP8gpfqe2S
	p65sZIyUAoBh+3RVN1BEYVwBFqqQ+1USRPjQMyp8Z5dTH2H4Vb3PP1bdc95OqGZm6BWUJCKF/rq
	v0sAHu40kl3al83GFm0X7I3qbXJJ4dfUrxnq8HnHQByKWgX8a1jN0NTFNGHlP91yCD5HRWjbAhz
	rTB3U8PcZ5TMwzER4L/O+t9keV2c58YMr3YEzlLtsLCgg==
X-Received: by 2002:a05:620a:8010:b0:936:576e:227b with SMTP id af79cd13be357-9397ecc749emr148166785a.24.1788456000170;
        Thu, 03 Sep 2026 10:20:00 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9397f9f4b3csm14121485a.5.2026.09.03.10.19.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 10:19:59 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1x2B6U-0000000HYPU-3heJ;
	Thu, 03 Sep 2026 14:19:58 -0300
Date: Thu, 3 Sep 2026 14:19:58 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	Nicolin Chen <nicolinc@nvidia.com>, linux-coco@lists.linux.dev,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Alexey Kardashevskiy <aik@amd.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Joerg Roedel <joro@8bytes.org>, Jonathan Cameron <jic23@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Pranjal Shrivastava <praan@google.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Samuel Ortiz <sameo@rivosinc.com>,
	Steven Price <steven.price@arm.com>, Will Deacon <will@kernel.org>,
	Xu Yilun <yilun.xu@linux.intel.com>
Subject: Re: [RFC PATCH v4 03/16] iommu/arm-smmu-v3: Add initial pSMMU realm
 viommu plumbing
Message-ID: <20260903171958.GL2890729@ziepe.ca>
References: <yq5a8q5lz5yn.fsf@kernel.org>
 <yq5aecfdnv4i.fsf@kernel.org>
 <20260901143445.GC56830@ziepe.ca>
 <yq5a8q5kkoz3.fsf@kernel.org>
 <20260902121700.GC2890729@ziepe.ca>
 <yq5aik4nztdt.fsf@kernel.org>
 <20260902193014.GF2890729@ziepe.ca>
 <yq5abjaezyxl.fsf@kernel.org>
 <20260903144729.GJ2890729@ziepe.ca>
 <39c8cec6-002f-456e-9e5e-7af2158047fa@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <39c8cec6-002f-456e-9e5e-7af2158047fa@arm.com>

On Thu, Sep 03, 2026 at 04:13:20PM +0100, Suzuki K Poulose wrote:
> On 03/09/2026 15:47, Jason Gunthorpe wrote:
> > On Thu, Sep 03, 2026 at 10:58:06AM +0530, Aneesh Kumar K.V wrote:
> > > > Do you mean the SMMUv3 driver triggers RD creation? That feels
> > > > wrong. Did you mean the VMM just does it earlier?
> > > 
> > > Currently, CCA creates the realm lazily as part of another operation.
> > > Realm creation is triggered by kvm_arm_rmi_populate() or
> > > kvm_arch_vcpu_run_pid_change()
> > 
> > Okay, that's not what I would have guessed. But critically is there
> > some way for userspace to specify any realm creation parameters (like
> > rpv, ats_plane and so one) prior to the lazy creation?
> 
> There would be, eventually. Based on the feedback from KVM arm64
> maintainers, we are trying to keep the ABI as generic as possible as the
> normal VMs. Thus, for now we have not included the Realm specific
> parameter configuration (which was present in the earlier versions)
> in the latest version of the KVM support.
> 
> We have some ideas on how to do the configuration step. e.g. for MEC,
> see the following thread :
> 
> https://lore.kernel.org/all/46d78aa2-cacb-4efd-ae62-3026f5fe9b3f@arm.com/

I see, well please convay to the KVM folks that the iommu side needs
the RD to be setup prior to creating viommu objects and needs to be able
to supply realm parameters like ats_plane to work..

Don't see a reason to twist the API to accomodate KVM being out of
order for now. It is up to you if you want to try to do the lazy
create or try to get a defined creation momement with parameters (I
prefer this from an aesthetic perspective at least)

Jason
