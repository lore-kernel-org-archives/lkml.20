Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 808AD353A72
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 01:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788313907; cv=none; b=KWsTFqeG9G57NfKu0HA/yTipmKbkSS1EJfqPQVfr07ehFsvnvdCYBv1Ahvz6S6Eo6V78878ECWxChql6ca14BxEL+NFJzE1nfEPsrl0tXWZcV7uS5pUIJOYoKtvaQtFwb5krx9Bc+6cvUbj8ffMOk0NkR98RKcnb8csTuQagukI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788313907; c=relaxed/simple;
	bh=E+oXMdrF2sleLVDXDyRpoFuZgDFkHIlL9VN1wy6t690=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PknIR0tO3CWOW+gDO2+aNyl5OnLlwHGBRljoD2iTnYf3n5LpcY4XTnLshF3AxEF+/UpV7ZompSvZPOW1ha/RFvf9nYOpsnfqOqbmJQKfPnG3lVCQZBMuELU/jZsYKpXWfQoB8BFGZa6OHG5V0IQq/rZuw9gd+3pXJCmRCpNWUdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=hvlfVuKu; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="hvlfVuKu"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-90d7fa95a58so4976186d6.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 18:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1788313900; x=1788918700; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=E+oXMdrF2sleLVDXDyRpoFuZgDFkHIlL9VN1wy6t690=;
        b=hvlfVuKuS/3SUNA2STUFkwYNLjCZG5M2MR7Z+xmVW86CIOofYG+IFbIFlJsre/gd74
         wI7xxS7UgdscNUKTiNEad2leaDvPvXUmRnrWhc/HD/ETj6/meKdSJo1+L3hoHf8LuGpb
         yOZ720+XtA76793gqn5Rzg+egonKNNFIrZOsDQlBfxsAn00Q03kpLt55VHT19NSo0osd
         hgyfXhN3U6Owq9E405y5pvkBi8igEKwlMwMwjAZuQtiep1D5x9IHyKajgFqciwSuTfO0
         RBofUbcBrJrJhygJmeIXfddKcIfYJMi5TVNfqzRG4xkmbLFyK5YeLw1Ganu9bu8sBI/f
         ciYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788313900; x=1788918700;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E+oXMdrF2sleLVDXDyRpoFuZgDFkHIlL9VN1wy6t690=;
        b=Q+Uv9cVnVNaee0j6CqIhDySQYQXF+JFBe5s6RiaUOQ3QbC8fXyDv9QnncXD6o9wQlY
         EsXDoNN6rOYXV5X0P6odXUXWClZC8/VT0Q5H1+rmva5Ud/RcXlgcJAuNG6DpF2zxTkcm
         pgE0sqZIYdtZ0W7KaFulyZgoF1B0oWXaAlJCpvyHQzHgC3fOjgxkIwyb98fBDSHvRaOJ
         O7G6vWbQ7HrqpDcK3ipZ+vxaib0BoNG3khAlbmRWBcv+6qYXytWGjIzSY62Cz2bauAek
         iY1M4CEmhIpbhXL+IdGUsRc7lB6HC0NrbY6L7JKBU+4g8BgkF9AvZMTqL8ikE3Fykntx
         iIAQ==
X-Forwarded-Encrypted: i=1; AKwUvBytGDaskzuTR/Ud5eC+2Vce1NG/5ggffC2w5XdTmLxfoA/hPDiz6B5PYHlhYOPtEMZTv2BYrU/zOC19qAM=@vger.kernel.org
X-Gm-Message-State: AFuF++lHAjGO7r/xzfUZQo0hdeqOB+2kXC5fnK25mzZ63iC8kOTp0ood
	rleGvQBdId/XG618BfOxXh+6APm0DUBrwq+5oKqCIldlYqDxsLeLn78GHuo8m6mPM9s=
X-Gm-Gg: AR+sD12orI8D6ZVICQT3ETf0YyxTJfVYPpIRfJSpyhG8ytaFd+DCktjAhZOV1VsflSn
	z2EHMCnGHJz0Q5cWuchzb0lvOtN/hgqZA6pMakQv/Cm9M8eJIkC5NlFGa76fPIRIN21SfJP+tDN
	dOz1WUQSgiPzQjHIcwv5ZscEhQ9DiIKjdVI6uxJbYMAt8R3TeJrMx2ULinxIxNbIVyeGB5I0cKY
	jOT4rVFQ5lfY/x6bwS7carozYs7nlmrBz1OsUGN1QK5tcL5ewm9yrLFV+HWjTwaeljdZAgIHxP2
	kJcGkmfTnlV3XocdDM7ktIwFvzSCb4l55NVgfJwscz1pGHkEmPpEGU28qARDMkj4SILiQNjcfCL
	I5wAtAzGX+AbMVj8DGRk8U9e4ePTrZBhlze0FZBpKTz7iyDz1sVlxUz+A2MdOg8cc2wBB/2JOi3
	QilQBQPmDwkBTPMXOVjUpLp7yoUUvWuBtIohpmZeFZIyBTVV2gwqq9X+CK/ZRBoOg7lxUptT8AD
	53or3CEJNdMljPqWcXLLHzqTMGXLqXrkqyKBvmrvQqRkw==
X-Received: by 2002:a05:6214:2584:b0:90c:c53c:a032 with SMTP id 6a1803df08f44-90ebabce888mr24156306d6.25.1788313899587;
        Tue, 01 Sep 2026 18:51:39 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90e9eef4f20sm7284946d6.41.2026.09.01.18.51.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 18:51:38 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1x1a8X-0000000Czw5-2tb4;
	Tue, 01 Sep 2026 22:51:37 -0300
Date: Tue, 1 Sep 2026 22:51:37 -0300
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
Message-ID: <20260902015137.GA2890729@ziepe.ca>
References: <20260427085344.941627-1-aneesh.kumar@kernel.org>
 <20260427085344.941627-4-aneesh.kumar@kernel.org>
 <apM6dOHcEI2ztWS0@nvidia.com>
 <yq5a8q5lz5yn.fsf@kernel.org>
 <yq5aecfdnv4i.fsf@kernel.org>
 <20260901143445.GC56830@ziepe.ca>
 <apcHoHKGoI7WNFXp@nvidia.com>
 <20260901174230.GA2847102@ziepe.ca>
 <apcitkpASOREamQs@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apcitkpASOREamQs@nvidia.com>

On Tue, Sep 01, 2026 at 12:08:38PM -0700, Nicolin Chen wrote:

> The viommu object here is an empty vehicle that almost has no use
> but to allow another vehicle (vdevice) on top to forward vBDF. It
> makes VMM code a bit awkward: there is no iommu instance, so VMM
> doesn't enable iommu driver, then there is no good place to alloc
> the viomu object for VIOMMU_TYPE_ARM_REALM_SMMUV3.

It would have to allocate singletons viommu for each psmmu as part of
setting up the vdevices.

Somehow I'd rather the vmm deal with that then invent a whole new set
of uapis and flows..

At best maybe we can invent a kernel side helper to create the
singletons like the auto domains, but IDK if it is really so hard for
the VMM (especially compared with how hard everything else is in CC)

Jason
