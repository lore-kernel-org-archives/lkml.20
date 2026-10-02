Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12E99456297
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 21:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790975514; cv=none; b=QYXcYcyuTRLc9INHpDWSilZGF7ckt9hUX7gyaF4Jy2eDDQYuZjFI2aJLUjsXNQypdyrDFyhvMlTVlxsdYWrEekWh+mYZ+IvrovketId5v042qGpslW3CmZsgpuv3uvLzQxDhtF1HJC46oQ756GptBjDWoyzS82T8pkgnkhW0hm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790975514; c=relaxed/simple;
	bh=iOrHGz64z0wKTg4YNpqTI/tUIfNY75DEXU5oPmbSSps=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=en34zs2cbJh0hmiaYllubiQ+mOAjfxfy9pEFNhi7YQbypH8sFbpdT2jv8KR5EzKybcIoFE7zcrErRW+hEuVRZUEJ44X0jCizLvmDK8lZX7Jx3RBwN9GcMhmloHuQ2KDfwyOZHlfh5mZwd+zE1IgMBcQcC9FzNJPoMk3qyfaVILM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=q6G0Hr+g; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="q6G0Hr+g"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2db33db4de9so4745ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 14:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790975507; x=1791580307; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aTAI7MYZpbnU/agtQxfkMDXpGe2YnzBKn6e+VLjrcQs=;
        b=q6G0Hr+gsATNOiGjgjZRfqLksZ4xHC5t2jrdNJJO6ojpxul1Ku5ET1K5Kn5JUoCowC
         m1GCDYXHnEwwrBUNTvJFbKdq5IoFBzxfizrRHTS88ajTMR9IAoOvzJphsZJwRMMHdKcT
         9aMTlSHBWP4xP9IH4jXf/xrJcFsy5UjmNZ4m+mIIsv2ZbAfEUbQ8nRzFQlyY5pxzU27V
         jygdSNGVj9cXX6qSXOtsmcFfIwLq/TiM+JppfYy/7VOQZLsiW5WvbleJVRqpMXHGER+n
         ZRTJFkbqgzb75Cw3yRfRLpdaKRa8UkJ3UprjlMBoIqxo/QslMF4PI5cz/EQwAU4s1pBw
         +8kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790975507; x=1791580307;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aTAI7MYZpbnU/agtQxfkMDXpGe2YnzBKn6e+VLjrcQs=;
        b=D9uDBaQyDZgEuPm+82vtm0VV92RHPd3qi+13CeKlxXU72+XerRIU9Fpz1/wJidMZif
         hP5FAGasDHAIjuryRyTpOvigb/nEY6RKIdQWQPmMGZf1vcTuCHHbiAJBcaMDn2eveL1j
         SeQt3DrgCce4fK9Nzv1vYjUACv5c1mxTVI6VtahHYuCtleBzNogtOkCV45hcYRHFkbXh
         PEu4HyYtwOnStZQd90saLwWxlAAE/EmEKrYVS7OwbVUaf4vdUzysiVfcSn16+AheBa/R
         1FIf+h0rpkXqAbX5RAduCCN9lsPJaEGVuBk/KI2ivgDJDOUyW25yyLTp7lM/WUWmm6WE
         UElg==
X-Forwarded-Encrypted: i=1; AKwUvByk6DdgyBS2tF4cxqFUZq/n3/Xbw8wPVMFbF41A3BPAhyoPVgn6ymRsxz6W+L66WMKenxbcLcEV68yWYtY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLGG/rtp8L/VL+hHclsAkNGFj1O6ZgOteh0bUjXnfJDofPwhKSP
	jkS+nbrpiD13iNn4/7TFXyaTmzZ8zogDdDj99VxUrtMaYGiVDuinJzERW2idvqNjOw==
X-Gm-Gg: AYBFou3JuJF+w+fiy62DMqZstWhJAFKqCLMZfTXnXwgOuosY+cm2t3PKh4C+XgPR2cT
	5TuT+dm2pDEki3l4v47r305QcX6yqZ/O0+1KvBscK0LbkbRJt5yh4FBXNRYZkvHOrkYBVTa9Jml
	e8eEE4bkOZkAh0zPNUF+0tw0lNl+2d/JVucsEya8TsqrbHZAF3PZs0JJh/qPN8HxCg/vLpERKp+
	zUnM0a8BzNJkYlNlxeBRliY3EwVSuF6udMuE2fdYBagJlLEv3axuTwNQZY9cRbV9r795cZZkfqt
	u7y9t8rdC8/5nDkNEAXmdATm359HV3CmpeU7yORioRyT9i5PI1aFkIb4Th5rqrXs59Oe7z6P708
	iBCKwunEGdsYBt75NSXCFKIpuyXqd0SODTgvNYO6wOcs5eyaOHyse2jKCdsoUXLkbi8YyC+6gD7
	0TZtNNIsZlDdmCjnkgjpudtvpg0T1LGXeZstPtFEa5HuQfQcNcuvvCMf4g3NsDocojZqZ/wMFG2
	+w3DaC5m6RzMG1D8LdcaL+z06gMTcd7EXwe
X-Received: by 2002:a17:903:b8c:b0:2bd:3bfd:74f1 with SMTP id d9443c01a7336-2e53091f83bmr1274215ad.2.1790975506423;
        Fri, 02 Oct 2026 14:11:46 -0700 (PDT)
Received: from google.com (105.211.142.34.bc.googleusercontent.com. [34.142.211.105])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78e497230sm39218a91.11.2026.10.02.14.11.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 14:11:45 -0700 (PDT)
Date: Fri, 2 Oct 2026 21:11:39 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Nicolin Chen <nicolinc@nvidia.com>, iommu@lists.linux.dev,
	Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Mostafa Saleh <smostafa@google.com>,
	Daniel Mentz <danielmentz@google.com>,
	Ashish Mhetre <amhetre@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
	Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, rafael@kernel.org,
	Danilo Krummrich <dakr@kernel.org>, driver-core@lists.linux.dev
Subject: Re: [PATCH v11 11/16] iommu/arm-smmu-v3: Add CMDQ_PROD_STOP_FLAG to
 gate CMDQ submissions
Message-ID: <asAeCz_rmpe5hbsh@google.com>
References: <20260929034510.2023173-1-praan@google.com>
 <20260929034510.2023173-12-praan@google.com>
 <ar1yNtr7Kp2OTcDd@nvidia.com>
 <ar3yWUmi8E0k37Ml@google.com>
 <ar6gY9grmdMZcN/M@nvidia.com>
 <20261002164748.GD3481470@ziepe.ca>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261002164748.GD3481470@ziepe.ca>

On Fri, Oct 02, 2026 at 01:47:48PM -0300, Jason Gunthorpe wrote:
> On Thu, Oct 01, 2026 at 11:03:15AM -0700, Nicolin Chen wrote:
> 
> > > So we can't issue ATC_INVs during suspend (the EP is already down), nor
> > > during resume (the SMMU resumes *before* the EP is made active). The EP
> > > can't use its ATC while suspended, and if it loses power/resets on the
> > > way back to D0 (from D3cold, or D3hot with No_Soft_Reset=0), it comes 
> > > back with an empty ATC.. same assumption the PCI reset path makes today
> > > (pci_dev_reset_iommu_prepare()).
> > 
> > In that case, would the STOP flag be too late? It's only set in
> > the middle of the SMMU suspend. So, an ATC command (via doamin
> > invalidation) might be issued prior to the Point of Commitment,
> > which will be timed out due to the unresponding EP?
> 
> How can you ever fix that?

The unfortunate reality is that this gap exists in the kernel even
today.. upstream SMMUv3 has no RPM, so it's always on, while the EPs can
runtime suspend independently. So an ATC_INV can already be issued to
an EP that has suspended. I'd argue RPM improves this slightly, since
once the STOP flag is set everything is elided, so the window closes at
SMMU suspend instead of never.

> 
> How does power management really work, is it expected that the end
> device is already quieted by its driver?
> 

Yes, power management would topo-sort all dependencies and invoke
suspend callbacks accordingly, i.e. in our case the suspend callbacks of
all SMMU clients would be called before the SMMU's suspend callback.

> Could the first step in power management install a blocked STE? Then
> we don't have to worry about ATC desync and that automatically stops
> generating new ATC invalidations if we go and detact the domains too
> 

Partially.. at SMMU suspend we set GBPA to abort and clear SMMUEN, so
nothing gets through while the SMMU is off. But that's global and only
happens after all EPs are down, it doesn't stop ATC_INVs in the window
Nicolin pointed out.

One way to ensure the ATC state is relying on the PCIe spec to lose ATC
content during D0 entry from D3cold, or D3hot with No_Soft_Reset=0). 

Another way to enforce this, is to *somehow* ask the endpoint drivers
disable ATS during *their* suspend, i.e. in the EP's driver's suspend
they could call pci_disable_ats or a better suited helper from pci core
and the in the pm_resume / rpm_resume they could call it's equivalent 
pci_enable_ats, counterpart ensuring a clean ATS state. Or maybe the 
pci_dev_reset_iommu_prepare/done() pair (with slight refactoring) in EP's
suspend/resume?

I could mention this explicitly in some comments or dev_warn if any of
the masters have ATS state as ON during suspend?

LMK what you guys think of that?

> Maybe I'm wondering if power management should involve the core code
> so it detaches all the domains from the device, setups up blocking and
> then the iommu itself could power ofF?

I'm slightly against the blocking domain attach because it's a
reasonable ask for the client drivers to be able to dma_map / unmap when
they're suspended, given that most of the modern IOMMU state is
in-memory and the only HW state is some sort of TLB/ATC maintenance. We
can map/unmap when the IOMMU is off and just ensure a clean cache state.

Drivers often want to pre-map everything, power ON just to run their
workload, power off and then unmap. 

That said, I agree it would be nice to have the core code handle power
management, which can be one of the next steps. (it would be complicated
to see how or what each IOMMU might have to handle for power mangement
in a generic way). 

> Jason

Thanks,
Praan
