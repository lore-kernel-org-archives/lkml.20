Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5173F48097B
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 10:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790158435; cv=none; b=LhOoBAY8wIpIiBVXB00Kms8YaBeoo+5ExnRhx8M//KJ6/oyyKLgUMfKq3h+EdrLn/n10oE+njFjK3fJg55puX1VJQ8ImpYTXvCEHQICa3t5yL31rxQu5lmfa4q16qZKHFLKGNaXz0m2vtyY+iSlGIBgu08Qa09xCt6bAWvLRQX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790158435; c=relaxed/simple;
	bh=86tGOrPEB/iivl/l0MEf2yHA5M2eh28fX8Zw5dM3jqY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JFIy1pRbKi0Uc6NahuAPBG7O3/WzmUrmbMFPAM5vAhsSs+GS6PTLR/1DHAaHBlqcI41MlBdbRE3KzN+m9ZZJBIWKXaXFrPGVYhhJ0Vdh+FisBV+1nMS8L5C2WlsiXX+9W5s6X9M1hNAtcmlUIlT3m6M9A/PTskdtH/IN3P5bqBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UluvbZAT; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UluvbZAT"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49e6425f96eso35785e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 03:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790158416; x=1790763216; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vdEIBnHA/8T+E7XayOUCjgaZYlTP8ZfuwSF0Dftqz2M=;
        b=UluvbZATTY/rSsKCRw3+gePcgsSmX+XmCzViNo/LaN1ctJdpZpCMUuKS09xwiAhppF
         9RJEH10sscHgi3KdRLxZkH/bgvF6bry/hlpJOOklI3YROmChr20tBIbpH04LSFIuF0bA
         K+8v+MV72DdOrMmWSqirrVci35KW3jPDtJXbOoTM93szCp/Q6aae+so46JI+8K2mQlXa
         Wu/Onn/knXGXVn+8Aaf+OlkuL79abQ+raVX6juoDGeHMoLtsfoUtgmzc5gE9craTTRxb
         1PjRkRaOIsUfKvvhh+s73j9TSZWIlyvkxzGdff8wjjjW/7b1Xzx6LEJ3ZyF6D3H51k7K
         bATA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790158416; x=1790763216;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vdEIBnHA/8T+E7XayOUCjgaZYlTP8ZfuwSF0Dftqz2M=;
        b=eWVSRIdSu5VfFciYU4drr9ZuHsSTJQiLazFhhsILYCFSwI34awHLMmdN6F/W4qLLzC
         OC6mXOnMTI+KIAgy+m9VPNl0gmKlQleTrc5dRtzhRQ9L+qt6m+UVoVTQ+2j1AX/Fh88T
         uufW95HO/xM0oCihbKK46fqhN6AAy3rB1mwjgvvuOKMwiu8Xc8lvn4p50dYqYHq8tTzu
         Rs4YKKk10jSeNcG570Ff1//lUlRfiytQVAmWCrTwQ1o5R+glEhNUjLjbNIv/YPoLd8Ll
         3YpCv4QV9znqoExoQv+A40TCAdDGSCl07vr2X0aOYv/i4DFcf+l8Pc0Ed0ItcetLRV+c
         kJVg==
X-Forwarded-Encrypted: i=1; AKwUvBzVr72FJQW5E633/duRnEKiw/SFIV7K3FIMT+BWo8/G/rIYRGW2DtV6PC5EqBcWArg52yXsz2XgHzjqrtY=@vger.kernel.org
X-Gm-Message-State: AFuF++m9OFCtEkDki5O8nCrtBVzFPtTPkCW9h+l/zv258g7fZo1aGy5s
	DGUWgW8CMiSzACWwTMVK7gtiuBrRRnAVV6aYdSKG0KFb5njZjJcFdmgYf08KmRhaEg==
X-Gm-Gg: AYBFou0N4iXKzSGrErLSmf9zySUesYjuEEOybRunrSQW5twhA5pRE+p8G8RQm1gTORN
	5vToWEeIE4i/VeCefNc1jBcMMJ1ZNsoiuToxZyIimBGao6cIMlEYdfOJHRv7bPPPoTRAriPGXRr
	shZ9raC3KBKvOiouNXEg0pspqjXXCgRCReHzDMCA2taPCnE7nhWSB0bndElUZ3i7SdNc9MAnyGo
	ow5C1N7d2Epz0mrLw1FgawJ30wMsUwJ9QAcFuoe5BccE1qPjxLKkAFN1BLbRKhr1YWbztdsrUhT
	JJg/7fvhV5kb7w5Nt2N1fVI6tL4Wxc+QftSbXr5ys6zR1d//Ij/w60LCtW2M2fdazwiXhuFYnAP
	eriAJwhPlJQDFB+VAaMHE1r7wye5/MuKTEa2qOIUeR8EwP7o50eUAOvCnjpeYYCgES+9BV2plZ8
	LoVujb5U0fWdvrWJeHYLVQSHzG5PsZEY6/xOdxQLJOpoTMrC16JXYEtHuOUEmm7Blcj7RLqRmcy
	SaG9yfxmERqzd3EqjIyjF5bvLEGbA9uct43+mVraQ==
X-Received: by 2002:a05:600d:8653:20b0:49f:e0f7:257e with SMTP id 5b1f17b1804b1-49fe0f725e4mr416395e9.6.1790158415606;
        Wed, 23 Sep 2026 03:13:35 -0700 (PDT)
Received: from google.com (250.192.189.35.bc.googleusercontent.com. [35.189.192.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48868486408sm5194076f8f.9.2026.09.23.03.13.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 03:13:34 -0700 (PDT)
Date: Wed, 23 Sep 2026 10:13:31 +0000
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
Message-ID: <arOmSxqRxhd717Xy@google.com>
References: <20260922131259.2975334-1-smostafa@google.com>
 <20260922131259.2975334-5-smostafa@google.com>
 <arLa0E3xq5dGuPpd@nvidia.com>
 <20260922214818.GA2545495@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260922214818.GA2545495@nvidia.com>

On Tue, Sep 22, 2026 at 06:48:18PM -0300, Jason Gunthorpe wrote:
> On Tue, Sep 22, 2026 at 12:45:20PM -0700, Nicolin Chen wrote:
> 
> > Also, Jason's suggestion in v7 was hyp_arm_smmu_v3_device, which
> > looks nicer than ARM_SMMU_OBJ...
> 
> I guess the point is to emphasis the substition technique, I don't
> mind.
> 
> > > +	if (coherent && !disable_msipolling &&
> > > +	    smmu->features & ARM_SMMU_FEAT_MSI)
> > > +		smmu->options |= ARM_SMMU_OPT_MSIPOLL;
> > 
> > Will pKVM ever use MSIPOLL?
> 
> Not sure I understood the approach in this patch, why was anything
> left behind? I imagined everything would be moved?
> 
> Maybe a few more remarks in the commit message?

As replied to Nicolin, because it is a module param, I am ok with
adding this in the commit message, or passing disable_msipolling
as a function arg and moving the logic.

> 
> > > +	if (smmu->features & ARM_SMMU_FEAT_HYP &&
> > > +	    cpus_have_cap(ARM64_HAS_VIRT_HOST_EXTN))
> > > +		smmu->features |= ARM_SMMU_FEAT_E2H;
> > 
> > Why is ARM64_HAS_VIRT_HOST_EXTN left behind?
> 
> +1
> 
> And the TT_LE/BE and S1/S2 checks, and ...
> 
> If kvm doesn't want to dev_err log that's fine, we should able to
> #define that away too shouldn't we? And maybe it does want to log?

The hypervisor can not print to the kernel console, so dev_err()
will not compile, I'd rather keep that outside and let the caller
decide what is a probe failure and print it's own message that keeping
the code and stubbing dev_err().

Thanks,
Mostafa

> 
> This seems pretty close otherwise
> 
> Jason
