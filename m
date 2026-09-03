Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DCE74BB806
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 14:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788446854; cv=none; b=jlQXX2jJFjTTS4Mksxp4USrsKAcEQCldVu+sSi3nX2SA6f1sUQcWyq69oeuvrmCKk33PF/CGCG10eRrd+faYu9hCqXp6OQ1aI5h5ujNh2Tuqk3FHRGhcTyAui8X/lxOz13MgljxGUjDHsX+s8EwAZPHSOQed26obHeP+vpqy5cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788446854; c=relaxed/simple;
	bh=s35i71g40sE6NNYFzd2cEk81BylAH6qoa2XMtwsVrmA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=trM2sjN6lDS9C9jdqZHw9RttAwVBUnrcnuPKmXTP2qe9XA163Y6E2NjDYr80hseTs6j8xpjo5Bl4zvVb7WBltdWpks4VzkgDkBpeVgR4O426qnUpBDANBoE4dvm824XXE15a+4mOUqsd6cpWT+1iFryCqIpVbEtbc6QxVrGgsS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=bmbJs+Gn; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="bmbJs+Gn"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-52fa6005224so21833921cf.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 07:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1788446851; x=1789051651; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4QmS2bFUIAw9Owot8+v10VgE/MAeq6BqPd7i1PWMP/Q=;
        b=bmbJs+GnbPhE6y7jamBGLOjpL8315/OkI5BENf4MVlmhXS9fC5o7aYV9Nm3OZcHirC
         w2cM/pJrjt8E9FpqSPJU+9KPOZqW+cx7Is6/vhPv9Wfo1fFJkXNhOwtl5p3tsErEgE0s
         Mc0Bw6YAZA50o7uQj3btovFnd9dvcg8lUTLdSv++Hr9W/JfKvdT1Lfnt7bHGJJ8HenLN
         7fkbGr0yRWEJW7jREVJ50HmKq0Dtl9FWJinaE4FXH5eyzvWpke780GrA6KcSYxv1Rmda
         LO76ZdiCP5XqrZChAB2v6FuhqXRRaJQzyYmAEereiSSFhBW5lDkGsqbDUlTagAOh3QAU
         VTFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788446851; x=1789051651;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4QmS2bFUIAw9Owot8+v10VgE/MAeq6BqPd7i1PWMP/Q=;
        b=ELugwV2diGy93dd6jN8m0E4ojq4T9HZ17xl5HIwuHEL1IJHUrfdXqTTesTNrbgsi7x
         smZlhVpSp86b2KfEasB29cmiWwDZ0oJlKFO/JI/55GJZKv7L48S9ssFMqsf7VM7K5kwH
         soBySupOUUh+sWG09DaQD0mgDIPvHFEg9NahlKBqhZGUgiF7BqBdBqkArIABwdgOPoii
         iXS9QiEdrODzlz8uIzK/bDQi2CZJL4EPjqfc/Yl8ooJXyTaiBN1oQq/5P7KlWABamnPr
         Nio80qxQmRHgY13ocZQmbBvB4wsPxIMKw8B3xVDOU6usSRLDphiuKjcFT4UsF2x+xB2X
         Q20g==
X-Forwarded-Encrypted: i=1; AKwUvBzJGHA7A7ERZPYGRwvWe62pxczz/88khRoBbo25/u4Y+3M7y/nQNm5l4fLt7i7qEBaHfrkzi4M0JCXSJwM=@vger.kernel.org
X-Gm-Message-State: AFuF++lGlXn465sfEOW7Y1TJeK2WwwxXm0QQuYn1jN8dgIIwhieEdXkp
	AIwfJq1MRr5yXvHawnmBK6riX9c4wtwMJ9IVJAXfKtwyOidCfyakEDHF3UM7/fH68uo=
X-Gm-Gg: AYBFou214VLAXiw0bhrx9ZOZVYGp/qBf6gZHITQ9otSZ3VUQv5yzplRaWMKGQQobfar
	rng4hMhzzEohAhmHXm9kkT4mhqKVNbCk4QXwRgYL3lQRw8TMB6EXvIMasxj0s3cPGe4AsqQfoPN
	okw2L48HFcFbIaXG6pi2YqTawgrX77Rnq66Ga2rgyNfCXgo9Kh0FSwwbyxRux1Sj8wCGThtG4IL
	oGyHTV/RA3/d2g+FLx7FKhxajzbavzXYF9ADrHs571iCyJv1a+CZDVa65weOvr8IoOKJO2UD/4M
	C9RMCqsQIMJDKZM2tdhdR2m9mCDXrNne4nZNzqunT8zouV2Yban0OOoaQ3Q2MBKpsgO6eIHB5Ex
	A5zHr2IxDGJba1bbMLMTAZzdnpYUKYr+yRaaLsbK/L/VA+tVyr2wcN68RJXWJ6A/H2E3AC2FePP
	0GJeglndsFEZQ2u4UptqyyXL8fwXD7ORibJL6zext+NmCCNWIY/YDOdubpI2yRgfHzMQaVnd0h4
	2TBjrr1RYM5fS0wpdEszGHY/inzTAmKR5m9BXhWiLlxxfro99D58ctR
X-Received: by 2002:a05:622a:1455:b0:51b:f40b:2fb3 with SMTP id d75a77b69052e-53036be6a5cmr143516721cf.9.1788446850990;
        Thu, 03 Sep 2026 07:47:30 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5303301ddcdsm44166831cf.9.2026.09.03.07.47.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 07:47:30 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1x28iv-0000000HFle-2ikl;
	Thu, 03 Sep 2026 11:47:29 -0300
Date: Thu, 3 Sep 2026 11:47:29 -0300
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
Message-ID: <20260903144729.GJ2890729@ziepe.ca>
References: <20260427085344.941627-4-aneesh.kumar@kernel.org>
 <apM6dOHcEI2ztWS0@nvidia.com>
 <yq5a8q5lz5yn.fsf@kernel.org>
 <yq5aecfdnv4i.fsf@kernel.org>
 <20260901143445.GC56830@ziepe.ca>
 <yq5a8q5kkoz3.fsf@kernel.org>
 <20260902121700.GC2890729@ziepe.ca>
 <yq5aik4nztdt.fsf@kernel.org>
 <20260902193014.GF2890729@ziepe.ca>
 <yq5abjaezyxl.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq5abjaezyxl.fsf@kernel.org>

On Thu, Sep 03, 2026 at 10:58:06AM +0530, Aneesh Kumar K.V wrote:
> > Do you mean the SMMUv3 driver triggers RD creation? That feels
> > wrong. Did you mean the VMM just does it earlier?
> 
> Currently, CCA creates the realm lazily as part of another operation.
> Realm creation is triggered by kvm_arm_rmi_populate() or
> kvm_arch_vcpu_run_pid_change()

Okay, that's not what I would have guessed. But critically is there
some way for userspace to specify any realm creation parameters (like
rpv, ats_plane and so one) prior to the lazy creation?

Why lazy? Why not just have userspace provide the creation parameters
and create the RD right then?

Jason
