Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0FFF4854E9
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 17:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788284707; cv=none; b=CZZ3rcv0aE6gpO7xF3cIoikQ+6v5NX7K7AVOkqFsXFNZAKY0FWxMMm0VwwyRRHjpZc/4Kt0xxwDcWBPggFuDoyBwyE8H1eBDbvq63RT+N3Yz6LYzrN7PpKvZGFChgq6Ohz9gewKMLp4m9zhr1t+r8T/U1vzPuLfee3uNor+oK9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788284707; c=relaxed/simple;
	bh=6L/MBIpCfqnotMOzUP5gbdtoK12piFj3oych96kwEq4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bx+UeKoqfJSziwZ3gV+MHihg6PCcrR/TpSwbf8puhGntwnpkQX9jF4bJgk5hTKik2ZySbzmIrWEFPJjqmN12CsXYFrJKVGN4OPjoFlnaZ6L2ThOIl5Md+uYO4dU2X8Z13VCjsbNjKJZlRo1y+z8SeOJJrt153m5sh+GLowWRly0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=iWEHvlJ/; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="iWEHvlJ/"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-93900ed2925so18892585a.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 10:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1788284705; x=1788889505; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Dz5fCb8eEO+u0xeHbat1iXwZqnQiKYPkVzTkS17OKDs=;
        b=iWEHvlJ/jKALCzgHxt1O12w5eLdwpOHDaIYkRAaOQeDsZjeyjaiXGTdxN8QIF0nQO6
         KE8D/S9QByEZFhw3IPMqlOLyTg28gSvyQb8YL1IxUKMFuEAfJbQqqKrBaBnE6QLVVxk+
         ai/yifJHW6s9zwqAv3Lb2pXTtCl95wX9nqp3j619NqxW05VlFBy0Ogsa3dT3RYwfLkgY
         LZG0Mo3OlEzsHKV0wsF2eun6v1FanU6dHDFdGABpcTqCc3s2PM0ogq6qP9l23HegdJM2
         sMthXbNdSFlkJiJ++eRzzO0XsTYRB5WUV9a8nfY/IKUfhjHcroa6+R3yLz275WKP2GjX
         WT8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788284705; x=1788889505;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dz5fCb8eEO+u0xeHbat1iXwZqnQiKYPkVzTkS17OKDs=;
        b=raED782YxId31JrnnMFaj8+JHymizaHENKsZ2c8Wp9ErDUrE0JDPbttK1+r7G2+TE4
         1sdjd5efZYnUm6Wfiorvo42mVX7UMF3hxvPDYcy4YPFszc0A6N0tL5NOr8hFOHB/d180
         FRq9MmIJeMZXx6Y9MGNvUSYK7OoK49Iku2vtQI9VZdtRjBKVmAEXchOFa18lkekydVHj
         Bqzq7S/dELo24utSL7KmzwhyySs9VQujnYq68De4i7ZDDUfZf679zBaMPZMkd8wqgU9o
         /5e+nq1E1NIgecKGBFPXCJfhniB3xMCXQbYI+eltuVNJRCWO482whcIkLe9DAvRSMkK4
         xqGg==
X-Forwarded-Encrypted: i=1; AHgh+Rq4QkYrovjmdT4t90Naoi3l67bpeYu4Pu9Y58cg4zbNEhOGu1cBIU0XshjoBIRG3U7EdMMQzbXXyFwjwAE=@vger.kernel.org
X-Gm-Message-State: AFuF++k1OKXYlSn+oXd4XygE8rNSdnNx9M7P0bXhBg37KdPrvakEjMV+
	BT6m5ljs1Sp5erVWArQXBONeA5unn25mukcngqOTJwAya0tsPf8fx1jB5ioNsHPYvMQ=
X-Gm-Gg: AR+sD1165EGqeoJMrtxYVYpQnM80jy58FOWGPUAu8d7+pDz5lVxlIxza5fkLYcJZA1a
	ReCjdChyG2FQG0Y/oqyaHOPnC2WVahd0Q1dWK0iGmnuyHlL2pNORmLJkDQ1rEARr1CXPTeW/7EY
	YWVjXo6h6CmaS86jmrg5Fk/MuQIR6iSheIoizGyDPze4cG+o1EeQjR9lCfIKkgbkuTKpBpauPZX
	PTT1c/8n37g6vcPeB3SbOl7+p5JnD6lBj3vsPHoqiBLJMt/eSRHQgtnncWOQssKEC/NZdTerxS9
	KWz40fpCWz3tptHL/vzxg1tkm/av+KzNWPXuNE+uC4ja6j/F9UONtiubEG+gs9RZukKWGLBGO7f
	s+2UJZrQinLTX2+VqCxYTPGcRLOyOYYC9HBkqu7n3kvclHrQlu3bacpMCm4mZ78+lqisyOlBcKM
	DRbwSd68FELWdewbEJGZkGMdc3uEL89b9BUTefBaJhrGJBAgmr/0tnPVGs/+DuyroWHUdXEWPsi
	X4eTCK+0IFqRHUKiGlCPa8FAfxNiBxTeZVBDpUfU+Um2g==
X-Received: by 2002:a05:620a:2b90:b0:939:3712:77df with SMTP id af79cd13be357-939480e4a93mr1404504985a.21.1788284704506;
        Tue, 01 Sep 2026 10:45:04 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93917247209sm1093584585a.17.2026.09.01.10.45.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 10:45:03 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1x1SXf-0000000C5Bj-0yOq;
	Tue, 01 Sep 2026 14:45:03 -0300
Date: Tue, 1 Sep 2026 14:45:03 -0300
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
Message-ID: <20260901174503.GB2847102@ziepe.ca>
References: <20260427085344.941627-1-aneesh.kumar@kernel.org>
 <20260427085344.941627-4-aneesh.kumar@kernel.org>
 <apM6dOHcEI2ztWS0@nvidia.com>
 <yq5a8q5lz5yn.fsf@kernel.org>
 <yq5aecfdnv4i.fsf@kernel.org>
 <20260901143445.GC56830@ziepe.ca>
 <apcHoHKGoI7WNFXp@nvidia.com>
 <apcI6dnRaGRNdzN1@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apcI6dnRaGRNdzN1@nvidia.com>

On Tue, Sep 01, 2026 at 10:18:33AM -0700, Nicolin Chen wrote:
> On Tue, Sep 01, 2026 at 10:13:11AM -0700, Nicolin Chen wrote:
> > On Tue, Sep 01, 2026 at 11:34:45AM -0300, Jason Gunthorpe wrote:
> > > On Tue, Sep 01, 2026 at 03:36:37PM +0530, Aneesh Kumar K.V wrote:
> > > 
> > > > @@ -463,14 +460,13 @@
> > > >  	vsmmu->vmid = s2_parent->s2_cfg.vmid;
> > > >  
> > > >  	if (viommu->type == IOMMU_VIOMMU_TYPE_ARM_SMMUV3) {
> > > > +		if (arm_smmu_is_realm_viommu(viommu))
> > > > +			return arm_realm_smmu_v3_init(viommu, user_data);
> > > > +
> > > 
> > > I think the realm vsmmu is going to require a different info struct
> > > than the normal psmmu case, isn't it?
> > > 
> > > If so it needs its own enum value.
> > > 
> > > It would be nice to see a draft patch showing how the real vsmmu works
> > > on top of the RMM spec for it. If we are using a viommu object then
> > > non-vsmmu case should be identical just with an option in the info
> > > struct to not create the vsmmu object.
> > 
> > Actually, the PSMMU-only viommu object in this series only adds a
> > type with no viommu data structure.
> > 
> > I've drafted the vsmmu case on top of the series, so it would add
> > a structure reusing the same IOMMU_VIOMMU_TYPE_ARM_SMMUV3 with a
> > flag:
> 
> Oh. I replied too fast that I didn't notice this is under the
> standard IOMMU_VIOMMU_TYPE_ARM_SMMUV3 used by non-secure vSTE.

The original patches were OK:

@@ -1055,6 +1055,7 @@ enum iommu_viommu_type {
        IOMMU_VIOMMU_TYPE_DEFAULT = 0,
        IOMMU_VIOMMU_TYPE_ARM_SMMUV3 = 1,
        IOMMU_VIOMMU_TYPE_TEGRA241_CMDQV = 2,
+       IOMMU_VIOMMU_TYPE_ARM_REALM_SMMUV3 = 3,

That's where everything should be placed, including your new struct
above.

Jason
