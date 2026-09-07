Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D2364C8FF7
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 12:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788785553; cv=none; b=uN2ssgT0QxBd0/vzZd5KswTeU/IffC+3wEbN2qOXy3nokEMF7o1r2R9wTrTXZsEl2jIhLPm8b1ZI6FOXxLa200fxpZcXZDSoJlKSpiphr8WeNeg+wzsnJPO9A+qIYASHL2rizltPqN2RhBVIjHPtXSyQmiohEvvmUmPY4zMyyNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788785553; c=relaxed/simple;
	bh=CgrQA9S1BOTEaFZVDiNZT9Jb/LSdMZymbY+ZFIFj53A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MmfuZJWC8OF/BE1ibaeHi3KxbVA2OINTxIAtrOevwIf3g6ASe00+s7fBaA6wHAKMbKqmK18XHVe1NzpyyJ0bRghXxPK8KP9McXDCDkXJPgigKkGvFkSnCg6nlWeJ+S/Bohs9s7VjDdAVVmnxXi6Me36lnOrNDUNMJHezcXHcSzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=C7VVw9OR; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="C7VVw9OR"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-90cbff85fa9so43109956d6.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 05:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1788785550; x=1789390350; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iapkYXlIeb7+hecWmdI0rbQoSearWcjPGJwbmVo5xUM=;
        b=C7VVw9OR78xtIgXhtLtczKpW4EF0aA0yXy1WqRIYMC2HWR3G4/dq127NCRw5K8PXOU
         SSuCAN/apAiPzqiC5M+hHJGSnEGcZ9i51wbKlBGOqNHtvOMsFf6dX3h/i/F8kjbVkvEA
         OdiGhsAs6rYsJFuQEPeBlpnKkN0fcqpuXM7F4rAomfhVm+630dZsdC4534MYwgg7pxzA
         SlkzMNPsMjTEz56bbroQMeLOIquf1qxjW2pTKKDj4X2ooMQsY4rGi3rbvbqL8tiQ34kV
         6zzltBjLrysazdo4BwANTCy+YJWCd0F0ziskXbUJaDFKE4mkC3kWDMh3gA6QrdUDw+vU
         zDiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788785550; x=1789390350;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iapkYXlIeb7+hecWmdI0rbQoSearWcjPGJwbmVo5xUM=;
        b=bK60wXy/P31VuiiGfJC8lbe6QC5SUyzI6bQK7mTEETuaOdKoZhFOhzwWLjRkLApXv7
         nFYVyeWBsNa7ARXh5Lj6J6sDZ+FOTXaP1Ovg4GGRlXmv2i87oUaAQVufJZNHi/lre2lW
         hmWKBE/vSC+7sQMA/gyS0rWDXo8BcA8y4LrJkonjQ2FcBDtZbAg3HUHdO67dGaOrpbls
         O1L9cYXoER++RVo54dfULL5+FkKaIY9J6e/W94tYOe4oratkEqhNOJ4nsLYjcKb3Nwye
         1gj5fVZiWLq7pvQaR39y9DE05y9mTAvKfEFB4s5m3b9F7XdEVsozY/DvsnoQ4ECru87v
         74wg==
X-Forwarded-Encrypted: i=1; AKwUvBw0EUVE0icSzZOf70NY3CoZsVLdrGBeM6Gb9Dk0sZEnc02/f/VaEwSHqYf6Ef4IQrMdeBJihP3bc55lg5A=@vger.kernel.org
X-Gm-Message-State: AFuF++koXETgoPeYe1d1FuPcBESp6fHtnDmt+3a+TpVARyXY7aeHDtG2
	IPbpenQEfrzSoguazVRpBcnR2wnm72cWdF6PHPba6Pghvr/il7aBXgacObchP6bvSlw=
X-Gm-Gg: AYBFou1BYacBSQNhbeyvv7btGQJnBC0kZZ3thM+dpGvjkKz3pVsu1uD1pEcp4qs8AKU
	OuWod6g9EA/5zkZ/kLy06By1S81u4zUDYEInAPLS7acovdADp5qdi8BfrNoKCMTrzQ3/ymKv8Om
	k/hITtp3aifyDvcyH67vgQ52YxbF3zltpfqmhpupLtqEOyKgTDOVDvYPbArHW6pV+s3J7DsKQkY
	/C5BMcqjAkiH24G/CJDBpXtrmNYr8GAW3XzdMmByOt8UeSLTzyRfwhNuQXI3muhMTDk6xF7spux
	80thM3wUkN7ZuLR+cdfKBSNDvil3KD/VQHbdP2ndTJswfPHt5jpyMVjCOq37nbsvYnlfupJqUge
	gJdyDyXE/TPTAUG2FOJ8QA9HmqaJRPiCTo26h6JaqKBIfKC1CPnANbmwdGFRXFkDYxeK8Sr2rFe
	GhdkgJgiBrveFknwrdhJ2u/of+jJx2h+yAf15RYRnGuf2c3Ozl5gYwNCCovfRaS7rDhFe23hZU8
	1c96zVTZMQNbNzw5+Z12mH/3PqFBvfPVKovZWGzeu2tqw==
X-Received: by 2002:a05:6214:3d8b:b0:910:479a:f7a7 with SMTP id 6a1803df08f44-910479af8camr173644776d6.30.1788785550029;
        Mon, 07 Sep 2026 05:52:30 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91048476220sm62621416d6.31.2026.09.07.05.52.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 05:52:29 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1x3Ypo-0000000AfMt-2MmF;
	Mon, 07 Sep 2026 09:52:28 -0300
Date: Mon, 7 Sep 2026 09:52:28 -0300
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
Message-ID: <20260907125228.GB667892@ziepe.ca>
References: <yq5aecfdnv4i.fsf@kernel.org>
 <20260901143445.GC56830@ziepe.ca>
 <yq5a8q5kkoz3.fsf@kernel.org>
 <20260902121700.GC2890729@ziepe.ca>
 <yq5aik4nztdt.fsf@kernel.org>
 <yq5aecfbzjyk.fsf@kernel.org>
 <20260902235609.GG2890729@ziepe.ca>
 <yq5a8q5izxz4.fsf@kernel.org>
 <20260903171704.GK2890729@ziepe.ca>
 <yq5acxupjsy2.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq5acxupjsy2.fsf@kernel.org>

On Mon, Sep 07, 2026 at 03:15:25PM +0530, Aneesh Kumar K.V wrote:

> I looked into this, and it becomes fairly complicated. We can move all
> vdev/TDI-related code to arm-smmu-realm-v3.c, but that would result in:

I was going for the opposite, you'd move everything out of arm-smmu-v3
and into the arm-cca-host and obtain the viommu through tsm_ops not
through iommu_ops.

I guess I pointed to that in another email.

The only thing arm-smmu-v3 should provide is a simple function to give
the pdev phys and irq parameters. arm-cca-host calls that when it
creates an viommu object.

> 1. Adding more CCA-specific code to the SMMU driver.
> 2. arm-cca-host continuing to own the TSM link setup (IDE).
> 3. Adding callbacks from the device communication helpers back into
>    arm-cca-host, since device communication still goes through DOE.
> 4. Moving the device communication helpers to firmware/arm-rmm and adding
>    something like:

With the above change you don't need to do any of this.

> The locking also becomes more complex. Unlocking a vdev can trigger a
> stream key refresh, which is owned by arm-cca-host. Currently, the locking
> is simpler, using pci_tsm_rwsem and pci_tsm_pf0::lock. With the SMMU driver
> owning the vdev/TDI, we would have:

You can't really avoid something, the vdev *IS* the TDI and the ops to
effect it come in through the iommufd path. The ideal version is the
tdi is never used outside the iommufd path so you don't need to mesh
the locking quite as carefully.

> - pci_tsm_rwsem protecting the lifetime and registration state of
>   pdev->tsm.
> - pci_tsm::tdi_lock protecting the function's pci_tdi pointer.

Like here, why is there a pci_tdi linked to pci_tsm? Anything coming
in outside the iommufd locking is very suspect.

And the iommufd locking should spill over to the TSM, you should not
be able to remove a tsm while a viommu object exists.

Jason
