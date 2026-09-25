Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C08A3477E53
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 21:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790372658; cv=none; b=j68NRLktNnplGT99Rig9b0ZjmtBjuJyucwelG1k3nB2/urYwo2BkXR+HvdTWiochGsiOeURvlscnMWvJQZ0qrFWlBRcKInQH4JnfJg1cyG88pUK5SBHiOGIoF+YtcK94kVBmYmBdpFXqsDQJx0LxsOKivFyBFKrEe8/F2BXbC5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790372658; c=relaxed/simple;
	bh=6U09m8Yxp85jBdyqUnyYZKTjlYcFpD66EbaC4eXzO9s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lTPZoZWXrLdw6JwP4WZIdUhxbVsjcy1vJ2OOeqQ8wOEnmzBghq+7w1HiEUvCQwHIKigW1D895F+2k/jg9cPDkT/Uvbtn7PFPFX44DIrgpKgGKOub0kvXiHvCZx/V/QzERl4RWOeQIB6tIyGpWqRuK/l1l4slSLozaH+Nt/a3eIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=t6hJX0SF; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="t6hJX0SF"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d8fb334e72so5448075ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 14:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790372656; x=1790977456; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IIMvCRPk4oQabUuNoTzd+hbJerQBs659OSj7AsZRTXU=;
        b=t6hJX0SFKnVDBA5+LchrvSJmUmOoztBhGE6ViR+j5IbktE0fREo/SWZNpAvIQ/gaDi
         PVdiRIDWsamAdJgrJhcpNiMJX9swJPriBvePbnFeLoakmkcgBv5p2EmqjfmkGX7AdfO6
         0ILq6k5i7Giv5/W8RBIt3FXPYVu82xLfyy2Y3NNM2/q90VuCgvbx/PcZe0/L0YD0rDsB
         mLNrk6fWlINqVP3+0dFY3WAxDmHOCcdIaWUzAze6tJ9aCAciv0nvO6K4aMjrU2781xvY
         4D0CSpHTcFrCgJeY6n5UlJnm2x8YSGzac/rr67+PGE6mXKromWlCRZHMIiMhoZAJZRcC
         w7EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790372656; x=1790977456;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IIMvCRPk4oQabUuNoTzd+hbJerQBs659OSj7AsZRTXU=;
        b=k/F9+ZOg9J/csRcXn1DbIfAppi8gZSY3PVjZd4dOghS7L6LdpQZFQ4NrdxxUq782Hv
         QZ+JsA8mazN7dxhesAOGneWBPrGLTdXL5FoOel+Q2pYWXAVBZCloeFvHY/zn7wwD144r
         PETxtMSR1DvCjznO20i+4/hXcZY5R3TzccS2mf92P2YP+Du8PwJSnuTaKJPGTgXKK9DB
         pAqlLIJ4DuJ1mbyrAaIobB+TMsDUAmrktxc5g8OhJW0gLVcRo5WV49xTr2r3ceJDa8hK
         UMVgvuAVOSiKIf2qs1aLDkp/EClQIyj27AcmQcaErDhElFSVsECnnk+n7KBw+snh9Kqg
         1xJA==
X-Forwarded-Encrypted: i=1; AKwUvByDZHjLhmDwDBOgCWQikGLkhZphXzFLMlLkKAFie9sLVipgXrR1XcgPxQQTR+0Cb66pfJ4n9j5azYe4QA8=@vger.kernel.org
X-Gm-Message-State: AFuF++l2Jn8EHDNgBYhnCWOGCp7dG8FM2wmzW3++gPSr7s2KGGC/Ymxi
	M3vtJ1UkwwN4h0M7hCJrEepyOi1Tj8pVg/K7AzqMq0/lzFQXFZD1V70QlSsgAKRzrA==
X-Gm-Gg: AYBFou3hocZLUwjdlYUQPdLxaL7zUSweCovtoOa5eFh8jYzIV///4uv6PifwprIQKns
	f/ImNXmu2y1py1INmjtJX5urmex3mIq9xLHDNipuNtrFltdkABKDWEyHqpKtCkrFHGjf9z3RcmC
	ZYhP/f3qcWa0s2pdzCUqCdo1ak+YWWkam2HRIs1C85NKLYR8xSVx36I7PAIg0r0d00sZk6fZnz+
	tAEpym+7EjiqDOc+dYXTmVvgeNWV3Kbq6hc/IJzgVq5tPtoqcEVYm2JwgxLJ4s/BOinFqO7KNat
	Lr6xE2HuOrFx7poFTJM0LsfvI3Tu1H0EOHQ2NMOGvNDIh3bk3EnzhEzD4BIpzcLyabvb+El/K9c
	sW1nmoa+ZuXGX80OzfAoIo4DC+NZ1Jm+46bw2abkKc+7plYI3XMbLHTBMceMgdlaKkUxZqLlImq
	310GbLQ+/igj3elaGaaX4XjaEH4tBbPZHZX7LyAaBOnVoDRXNqrf+MblJ+PLuVaR2WIFaSgefSJ
	OvRm4/G2fb3tiiYtk1AE5WQ/qGR2TOGVdjcskoI
X-Received: by 2002:a17:903:184c:b0:2df:3b0c:a6a5 with SMTP id d9443c01a7336-2df7da5d1bemr63157015ad.9.1790372655435;
        Fri, 25 Sep 2026 14:44:15 -0700 (PDT)
Received: from google.com (192.150.203.35.bc.googleusercontent.com. [35.203.150.192])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df91476bb4sm16242765ad.83.2026.09.25.14.44.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 14:44:14 -0700 (PDT)
Date: Fri, 25 Sep 2026 21:44:05 +0000
From: David Matlack <dmatlack@google.com>
To: Samiullah Khawaja <skhawaja@google.com>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Jason Gunthorpe <jgg@ziepe.ca>, Robin Murphy <robin.murphy@arm.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Alex Williamson <alex@shazbot.org>, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Pranjal Shrivastava <praan@google.com>
Subject: Re: [RFC PATCH 0/3] iommu/arm-smmu-v3: Add support for hitless
 replace of CD entries
Message-ID: <arbrJYsILS1IPpCK@google.com>
References: <20260925011308.3381953-1-skhawaja@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260925011308.3381953-1-skhawaja@google.com>

On 2026-09-25 01:13 AM, Samiullah Khawaja wrote:
> This patch series adds support for replacing IOMMU domains with S1 page
> tables hitlessly, that is without disrupting the ongoing DMAs. This is
> one of the dependencies of the Liveupdate IOMMU support for Arm SMMUv3.
> 
> S1 domains are programmed by CD entries in the CD table. During a new
> domain attach these are updated using arm_smmu_write_cd_entry(). Since
> ASID and TTB0 are in different 64-bit words, arm_smmu_write_cd_entry()
> considers it a non-hitless update and sets V=0. This means such an
> update is disruptive and would generate translation faults if there are
> ongoing DMAs.
> 
> Replace the CD entries by using an unused temporary ASID in the
> following sequence to allow hitless replacement of CD entry,
> 
> - Update the CD entry with temporary ASID.
> - Update the CD entry with the target TTB0.
> - Invalidate the temporary ASID.
> - Update the CD entry with target ASID.
> - Invalidate and release the temporary ASID.
> 
> The series adds a vfio selftest that triggers a continuous DMA and does
> the hwpt replace while the DMA is ongoing. Since domain replacement is a
> race with the translation requests, the test does it multiple times to
> capture the small window where IOMMU faults can occur.
> 
> Without this change we can observe the SMMU faults in the kernel logs
> and with it the SMMU faults do not occur.
> 
> This is only tested on qemu with the emulated SMMUv3 and an out of tree
> NVMe vfio selftest driver, not on real hardware. Following are not
> covered and can be done later,

Out of curiousity, does the in-tree VFIO selftests driver for IGB not
work for this testing scenario?
