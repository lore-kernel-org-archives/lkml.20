Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792765752;
	b=wminp0FuYuVBexzNoz9DihSwV9OaExF3wHqtBzqBt042g+H/WKsX/dy0KBxxT6DfuAPb
	 VMtftgBKnDErfH55kP7uV5CJYVHBEAoDJ5wXv4Gyz5ANya5evX2KN601xE7IM3t6c5fUn
	 sa13hwU62JB4eqda7x8UG4Jko5dL3cTwE4GYKYZ/XRakX8g2fkIoh6JdroFmgvv9+eyWC
	 2CVaepmnGuNLmz2UGamktF4zatk1x/bqmaZZeAMfWCn0bwJgKkdcUSZ3UVi8eju4lyiFY
	 S77lDMeubiyBU/f2mpLpcrvgyQYUm4XyC463EUkD2C8kNfTeQGGPs1viFWpBnPmD/IQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792765752;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=MtqXElKTNCKa651mdJkZvNuV+haZHv7iacPGuZotGd8=;
	b=nQjI/hLzQmUHBAuQ2HNgACAa4ZgJ4qveToMmw2YMD7Vsru4iXW1+A8qLiuCTIcgFCxJB
	 dn0/Zd0Vw+ZfnCfDcaAVVNq0fkkUVcPHB8VwSkAJUJQfFnxnNEO868Bd0BAozW3Idz/t7
	 DdittqZGLW+2SiZUbzTy3kxbjEk5V5jcobfWON3fIhqaK8hZPKED3Pe9mmvFEUvWTkHOm
	 X66Ik2ukc1SQ98EyHQZroKDtAPm4wku+YiE2JqxohLvtT4QAjl/GJwNrLAhGuxbwfomB1
	 C/B0OSbqerz61FGDnYhmX/cX2kFd0llfLG1jENcFTTfExjz9iz2SN1kaBLmvEnuLw3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=avkkPC8a;
	arc=none smtp.remote-ip=209.85.222.170
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 076D2606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 14:29:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 076D2606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=avkkPC8a
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-93ece7a73b9so114619685a.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 07:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1792765751; x=1793370551; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MtqXElKTNCKa651mdJkZvNuV+haZHv7iacPGuZotGd8=;
        b=avkkPC8aLDvmBjyLbrHsvwr5XPY6dGmArduPsLd1M4wYsLvWT24m/ZjAjQVFszmkDb
         WZM2RveY2SHN0MCMrQCw60ORyFVxl32BUY1bf5k+lQCx13wDJjJHO/skPlWhD7yj18oW
         ZCIeIeYBu2i/nJ9KkQFW3VsEGHnkxN78zSSIn2tw7EGpl/3J4pWsA5pOgcmt0WLAwRz9
         IM3OdeFf+LLunuNL9YCRC81HuLdRbkT5oKCSFk3ChdQRA+Etsu+pp4GP+reBDzuXTDse
         JGXT2YTmSK6Z9DBc3rV5A3fReLdeq1XjZ31xQeKlTzO3iY4JKD6T5kMm9NMb78/6YZ7J
         X7xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792765751; x=1793370551;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MtqXElKTNCKa651mdJkZvNuV+haZHv7iacPGuZotGd8=;
        b=T5JUktwItkoVcoKd6eeuzSGBSB66r5Yr+AEqr2bwWenKgHbtGsBINJTsC1atYzZSUJ
         vdNtyNWNS9zqpjFtRscJTIJkYel7NvedLDu1Gr0/91IifeCNzyJlQNfh7Bx8Ny1B2e9K
         oBRdGa7F3k+Itz+X4rdStgB30cJRplhfbAh/6YeBkgVkVtgslE8r5K55B+HLJv8zmKUq
         RkMbCcLp5VlKpJMOLxKL0tpPX/RWyAR3WEFY1UbSn/bYLMILYgUxb+t0YFqw8Kjy2an7
         Ag8IqRo69XOmA6fc6TCyoVcTaezS7H5yiaCblLXbPBZPIxD5sbu2K0J7SR9HgSDwQu2o
         PUAQ==
X-Forwarded-Encrypted: i=1; AKwUvBzvPBwwhXdSPZAZCMishazOF2kRXb1z+bJ3Iuhi0xDEpDvKBaBDYZXs5F/8fM2tjzTJys8HaU17mQ/2OsM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLQgjdzilZYA2IyRNWSYhnbxNER1pEPQvgRHZ4cLDh7ef+hOJxm
	v326sRvrYwtlWkRByTrfPLXCXC66NyDJK6XvIFsQApKvIn7CqDOA72MvTAwB+lRah+U=
X-Gm-Gg: AYBFou2541p2ubLsv3CiijWBhpkRB7ULaD5evyGBemkF4sFJdeSVDNQh5A61vPxB84d
	rUXvm3Affqhg3Yd/VFIfALI86KJZZjvRYX25gd/kTHcFdrZdxB7nYGZW1CNovNx+1wZlNmbhAS5
	H+3U1hpp8jC6dC9ASyvWeIUET/KHIVSN68dtSxfPAFBMdncAKarxp4dDKQ5kWRxYbF/D245bBZL
	ahogtZoTauNMDkxDDM1So5xHB0uoslpjvewgA0EBV4+HMD7+hYu1GXahqe1UBX5Ub0KJfX73fMy
	jjOJlanUlK1K8mB/t3/6a4CVAE2F72DQ4ePK2oXf9T743I5a4fDhLc53hzdZDUaN4ysWB250dxm
	6gRnH8Lxu7aO3/eTBuXJJSPhq3cAoTkcARjKjWvM6PXVNVP/j199G6UwOMH/++1Dv5YNVOPVOMW
	HqfeKJ5GGoobyWhuXcsb02t5+KsRozQypDS5N7N/61TwsMoYeWsEzF2dbaIzT3/YlmvUI+mGvCD
	m2sO/TkrJGw8vaxrO4/LgwSCVPoY0smDGOZtKBlIdltQRlCPNBn1sEXgkHmJiN+H4KPMc3Mc3C/
	XcqnESdvs8b+2EW46prSI6UNUQzBRtQ9xMeosQ==
X-Received: by 2002:a05:620a:7001:b0:939:b057:daf2 with SMTP id af79cd13be357-93f6f7fef1amr427452285a.45.1792765750875;
        Fri, 23 Oct 2026 07:29:10 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9404722bccbsm30639685a.8.2026.10.23.07.29.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 07:29:10 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xKGGb-0000000GjTu-3HLf;
	Fri, 23 Oct 2026 11:29:09 -0300
Date: Fri, 23 Oct 2026 11:29:09 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Samiullah Khawaja <skhawaja@google.com>, Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Kevin Tian <kevin.tian@intel.com>,
	Alex Williamson <alex@shazbot.org>, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	David Matlack <dmatlack@google.com>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Pranjal Shrivastava <praan@google.com>
Subject: Re: [RFC PATCH 3/3] iommu/arm-smmu-v3: Add support for hitless
 replace of S1 domains
Message-ID: <20261023142909.GG3977851@ziepe.ca>
References: <20260925011308.3381953-1-skhawaja@google.com>
 <20260925011308.3381953-4-skhawaja@google.com>
 <3d1eb92f-3447-49f0-a210-fd4fa015304b@arm.com>
 <20261023134900.GB3977851@ziepe.ca>
 <d4570e2d-5b92-4f05-a8b3-34d5d5b299bd@arm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d4570e2d-5b92-4f05-a8b3-34d5d5b299bd@arm.com>

On Fri, Oct 23, 2026 at 03:04:23PM +0100, Robin Murphy wrote:
> On 23/10/2026 2:49 pm, Jason Gunthorpe wrote:
> > On Fri, Oct 23, 2026 at 02:43:28PM +0100, Robin Murphy wrote:
> > > > @@ -3664,8 +3726,8 @@ static int arm_smmu_attach_dev(struct iommu_domain *domain, struct device *dev,
> > > >    		struct arm_smmu_cd target_cd;
> > > >    		arm_smmu_make_s1_cd(&target_cd, master, smmu_domain);
> > > > -		arm_smmu_write_cd_entry(master, IOMMU_NO_PASID, cdptr,
> > > > -					&target_cd);
> > > > +		arm_smmu_replace_cd_entry(master, IOMMU_NO_PASID, cdptr,
> > > > +					  &target_cd);
> > > 
> > > No, we cannot blindly do this for arbitrary ->attach_dev calls - the
> > > majority of S1->S1 transitions are going to be moving back and forth between
> > > the default domain and user domains, where there is zero expectation, let
> > > alone guarantee, that the translations would be equivalent and thus not
> > > liable to lead to TLB conflict aborts or amalgamation hell.
> > 
> > Heh, yeah this probably only works properly with BBML2 or something so
> > the temporary ASID doesn't explode.
> 
> This is fundamental VMSA behaviour - see R_FVQCK in the Arm ARM. BBML only
> applies to the one specific case of identical VA->PA translations with
> identical attributes _only_ differing in the leaf level at which they are
> described.

Sigh, I thought ARM got past that 'tlb conflicts catch fire'.

So, yeah we need a flag that says "I pinky swear these are identical
translations". And it has to be a kernel only flag since we can't let
userspace trigger this.

Jason
