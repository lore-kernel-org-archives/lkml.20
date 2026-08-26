Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89F0841D22E
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 12:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787747451; cv=none; b=FjtFiZEn9kQ5dpHVeenF+eQT5FP37SgC6yuXljSTsJNImwwb0gVk+B0w2hHx8qmYnQiS/EagQ1uzfdTXy+p7d9Esizwt0qr995DXx2t0y8VZJSjFfTduuCJf8fyTQFLHpp9o+6jgezT+lMlfQ0T3La4heAi29DMYYw+72J4OWa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787747451; c=relaxed/simple;
	bh=8dVVSO4XdHCx4KOZSduD/f39KYIfwpqzYrSSt2RuZ4c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=myTI17oBvh0fZxbxBnrb4aokF4nDV8NLkF1pv9oIZxVHVSnFHOETGUpP0akFizeLvZWD4JSZa5/CqnCeqa4lj4+jeQZu0GoRCJRmMFoEk0w7WwWzaqpuzwiJhITEjlo3dupNlMErwcm5qPLTGBZpPasoaQLMhdF5FDiFBkGVY4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=P5zl/SXc; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="P5zl/SXc"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2d3b445a84fso88505ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 05:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787747449; x=1788352249; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OtDyfAId4c9pmXSo6AkYFWKqGY/dpqg4gomEyUaZ1rc=;
        b=P5zl/SXcD8sz+TC4+hyuwZkqaZPHNXvywNGiQevr461CMvJNkvqiM7hrcaqs2G3gve
         XAHjRZiNo9XhOiIbDbhtU0OcSHa2HAOIC4Vsmpa5Vy0dxB2C1LrK96yLPgwHzIb2id/5
         W+3d2EzQ6cIhg/I9ZLzxXb+jutIfQbHBUNAZwboqtgNxkE4s6qEQWz98RkdFhormfg9z
         QIHP/+0Sjhk6iJKJXOrSEk0XCfu7C2yw/jL3L8uZHWR0MVJozxfj8gJLSHV7HtV3eT/t
         E15xeyzDIHD41GALpjxUOY3BHkBslYo5TLgZO0RanQEKYe47kjNwW8pElk05X5e1YgOr
         dqsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787747449; x=1788352249;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OtDyfAId4c9pmXSo6AkYFWKqGY/dpqg4gomEyUaZ1rc=;
        b=Renftq4BzZHGVNKfYgoUKJh+AdCqsDrcFMKSpNDmN4GHlAY3F139sv+CXl9HZ/BQln
         x+dsTVobxlOhRShYOVrhZmdUfkNkTPZ5jrcfyz9aWZWpziuTA7QcGh99AIowoolsX9gg
         0TApJzyqK9R5dWLDHopP2EkvA+sWoxIJcOwjHz+3WyCaMpGbbuF0M/hAL+p5h9IM3Emj
         XkBwJA1XYx6QXKCdeW7BDJ4SVb2ws0n1qjzDvKd0ic46MEN15BUb8YOeSnIN9zxL7gN7
         KtqnLyiXEh9if9kP5JZ3pPYIwv0Aw2jkPu1vyeRqEDkastt4mRYYsHFTa8s77vAQTuKX
         Bk0g==
X-Forwarded-Encrypted: i=1; AHgh+RptO+dxBP4KJB/+n55/7EyMANkLiLVwNHbbskb6trik/6aaQgaA/5pLzOQuaX3GQC5b6bueN7dcrgFwfO0=@vger.kernel.org
X-Gm-Message-State: AFuF++nXt7Ub+7kI92Q8pgk9qJ9fOqaJg7FT5oMXySdbdur2T7L76RDK
	Cwkh9s2loh/I2nQVpShQ5gFSNPlNxXJDinUp/4F0avVX2mvNi73qUFzQtLN8jwvcISJ0+M2TFmn
	Rz5/kgw==
X-Gm-Gg: AR+sD13PBVYDjv04QX6qJzO54UOrzrsWf9/j/AwFK212rvoYVyBXRjrPDR0+bserEKF
	YjmLVE0K0/kdas8yjj5E0+vHJKmT/pFCcJzG8A/s2T0QdxFIZjLhR7wjkRPym4PNLgEhspxpVks
	KLIi8RCtFBBot80lWAJ+HIuTCgAYd6Ja/zvNa9SM4NZ/5wb62r5mT0fzm3py25Twb/9VFkVuY5W
	FXJGozhA9UjGxlYY+Tfco0Ak2WnOo6YtLYgmpHAFZebHiymw+pJbvSb4XWluoF+X3jSNjNwYRez
	S3zmyhc8yD07PVMAI3iTuz8mHDgj5owU8uYqqlWFtrrEq+yZ938jqruOMb8eA+TT470vKlTSc1c
	a3YGK1lW8089ev05Z+RHg2XWJukqDuQpEz/22RWYYwI+EgzolLa0daYvKDKIkzDWhqt1nCvX0sX
	QTAZ1skkRJnC92N75hb6PVz6cmOMH/GvI2OUQFdWAX98zZLpThaWQ2Z8H9+2hquop54SYFY5yYw
	jCTXSYpjslliWiHCUKjZ9JjgA==
X-Received: by 2002:a17:903:22cc:b0:2bd:3bfd:74f1 with SMTP id d9443c01a7336-2d70baa90a8mr5053075ad.2.1787747448020;
        Wed, 26 Aug 2026 05:30:48 -0700 (PDT)
Received: from google.com (164.210.142.34.bc.googleusercontent.com. [34.142.210.164])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39645b07394sm7933816a91.4.2026.08.26.05.30.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 05:30:47 -0700 (PDT)
Date: Wed, 26 Aug 2026 12:30:40 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Baolu Lu <baolu.lu@linux.intel.com>
Cc: Samiullah Khawaja <skhawaja@google.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Jason Gunthorpe <jgg@ziepe.ca>, Robin Murphy <robin.murphy@arm.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Alex Williamson <alex@shazbot.org>, Shuah Khan <shuah@kernel.org>,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org, Pratyush Yadav <pratyush@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	David Matlack <dmatlack@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Vipin Sharma <vipinsh@google.com>
Subject: Re: [PATCH v4 08/18] iommu/vt-d: Clear unpreserved context entries
 during shutdown
Message-ID: <ao7ccBlV9_RXT6Fe@google.com>
References: <20260808022723.3893618-1-skhawaja@google.com>
 <20260808022723.3893618-9-skhawaja@google.com>
 <446684d8-44d0-47c5-9301-172c55efd950@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <446684d8-44d0-47c5-9301-172c55efd950@linux.intel.com>

On Wed, Aug 26, 2026 at 04:05:51PM +0800, Baolu Lu wrote:
> On 8/8/26 10:27, Samiullah Khawaja wrote:
> > During normal shutdown the iommu translation is disabled. Since the root
> > table is preserved during live update, it needs to be cleaned up and the
> > context entries of the unpreserved devices and root entries for the
> > unpreserved context tables need to be cleared.
> 
> The key assumption here seems to be that, during a live-update kexec,
> most devices do not go through the normal iommu release path. Otherwise,
> their context entries should already be torn down in the
> iommu_release_device path.
> 
> Could you please confirm this assumption and add some short note in the
> comments or commit message?
> 

Yes, that's correct

During the normal shutdown paths (i.e power-off, normal reboot, & kexec),
the kernel only calls device_shutdown(). This path bypasses driver 
unbinding, as a result, devres_release_all() and iommu_release_device()
are never called. Those devres teardown paths are only triggered when a
driver is explicitly unloaded / device is unplugged.

Since live-update piggybacks on the kexec/shutdown path the unpreserved
devices never have their context entries naturally torn down by the core
driver's devres model, necessitating this explicit cleanup.

I think we can add a line in the commit msg for this because comments
might create confusion if similar comments don't exist in other drivers
performing Live Update. What do you think, Sami?

Thanks,
Praan
