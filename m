Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C9072BEC2B
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 14:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788273589; cv=none; b=L7/cMJJ3ZC2xvH7XzRhMShVOkaY2gdWvZfa+ZrjR/2SL4Hj2orfAT86qllyBd7UDZzSWxtPalF0E6s0fP+mkcC8m9nPetyGVIVA176dUcD2h2uvaQARU1E0RuWBQ+n4HhZOs7abE6rJWTr6B72aTbfhHEfxIk1leMd0N8q5byaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788273589; c=relaxed/simple;
	bh=Epea1SJtx0b5eyI7MQ/aNcrxf6TZYklQq7AcTHGfVa4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZgSBqNkjqpMA8mchNsrobkN3hK7/yIbjb6bi1jOy2C7xlkP+8YPQgc5N46cVfVMgaRIr6GQUgg2WpRDZcdCwdHeHh0W05qq1EyH08anl0oHg5zi7bXspB4nfH/jC+Kg9ajm00s+/9Mcvi/A670DlEVsyAAZCI+Xp5SqV7gS38ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=ja8vuv01; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="ja8vuv01"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-7f4e6b5bd30so844033a34.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 07:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1788273584; x=1788878384; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BSVwyibyFfIHGL0TlXMcUmW3kV25Hg4l49RcXdnb+4E=;
        b=ja8vuv01IQ+/x+orlfCtYWpQNrxDs2gwKzCzXrpJQQIPEB51h/fT8Szz0OlbXgngdY
         Q1caaktVQQUJy1sURBGAUACQoXeVgczTkL/wRIbqY3z8LlC9MVrlAlyfahnWDB7iq/EZ
         5j3WRTlwwO8axo4gQKLf3H7MHMR3J5CsNkv0zBjKjhgoG8wuD8VW0oq8SqViDMkxvyji
         oAU6AfxCZ6yqq1+3pJ1+DMZm+XVNHMSBvlwiQwRGxuJSKQ6wOvL//xCNqH79uNGZMQ/e
         5Q/XDJYJWBJTEMUvz3CTyGzzzjUnUd9Undo6isS0CDQAb1WC5trvKw84P2zeLRQCBOO8
         Hlrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788273584; x=1788878384;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BSVwyibyFfIHGL0TlXMcUmW3kV25Hg4l49RcXdnb+4E=;
        b=T2lWPjOWDKi11EyKGUPElRYy4aYgbKWY1e9m4MAe66kTjGmkxZDSmoyxKfeteIRa7o
         h/0yMt6ybFgmQQ7vrWj+BTVvkDvFPiVhoT6Qdv/eOhau9NibYNI/dsBC9zjKKiTsJHkD
         /LDJAPgRqEizTYWcxZSQYFfZszA0LNno60r51Y73UThtGC2zHPk6kNNAz0UMiLE2X1MF
         DJKyiBpj1ej7DED+Uh5B3Q7s+I1w+x0EqhO3CO2pfgcMd9rLUOmfGhNn+xf9KCGfAj7r
         dKmFZALdnkTiG1E2OVh+LapH/kmZBhZGn76Ug506wOt+wT5yTmyuCU3cbPNW+aQEFue5
         BJcg==
X-Forwarded-Encrypted: i=1; AHgh+RpkXrPQFtFBPGBb3Own1JP96Y2eNjeYqufq5C0rCbyRxn5v/f0Gj0aXOtOXxCXUIykAW4+oX93E5/JaZtM=@vger.kernel.org
X-Gm-Message-State: AFuF++mMHKQ4ImoUCYj6XLsWZYye89DGeQuWexrRCO6bwApMWqAkNxCv
	ljyWrAxWbStu9uEjZKXHAOjHk1cvPvWNCshOGiSA0Pwft5ILBtZl8X4sThd+ZNp2CFKTXT4V6Wj
	XEuO1
X-Gm-Gg: AR+sD13PwH3iGOX43N23vXUJXnENYH4TxxRxD2dOXs7wKQG88tIluIX0/0n6czSS+Hv
	TqyttMQZo8oubMqnpU+LapHFLq9FnywZroxMnpVglfA/oZxmf77IPk+NFBAaNnXoDrLBzdIMNaX
	ON99fmAsF2uvovL6GcAeVJ0wed/N5NbyaEl1z0VIywEYO1gWzcj25kPYgC21OR3kwu68iufuzSb
	wPsiQ1j37Nl7+80MuBxN2qKx+/2UVLQ42oD/E90rJUq/Ek0AL2uC0pt87IuG0c0/rpte8zIAnkl
	p21U+vBHo9WJFdAXzOy48ECw4lHJfa0PjRVzFvBgh9l/2+7IhbSZ2UhcUikXMpD1JFEcfjsiZrM
	inneFneScVVCztJAvdYEx9GkEEWxgX0V4b/+p5pnrwDbIlhhIKQPLFlFUVK87kCiWFxCaziPgR4
	5MSGDT209KFNfKMLbDVunmgo9wB4xhlW3gBHM9iEV5TI95ufG26xczUZhhZAJ7Bv7hQiviDJdmR
	CpmBsChFMX+4D7Zui4QiVzIl4HDWCYt8kx9EFoXDhIDJg==
X-Received: by 2002:a05:622a:948:20b0:530:2ded:eb32 with SMTP id d75a77b69052e-5302dedececmr22533091cf.2.1788273142344;
        Tue, 01 Sep 2026 07:32:22 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52fbe7fbe06sm96855001cf.17.2026.09.01.07.32.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 07:32:21 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1x1PXA-0000000BhaA-3wav;
	Tue, 01 Sep 2026 11:32:20 -0300
Date: Tue, 1 Sep 2026 11:32:20 -0300
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
Subject: Re: [RFC PATCH v4 01/16] iommu/arm-smmu-v3: Discover RME support and
 realm IRQ topology
Message-ID: <20260901143220.GB56830@ziepe.ca>
References: <20260427085344.941627-1-aneesh.kumar@kernel.org>
 <20260427085344.941627-2-aneesh.kumar@kernel.org>
 <apMjUSbxcnlAKjks@nvidia.com>
 <yq5aik4pnyul.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq5aik4pnyul.fsf@kernel.org>

On Tue, Sep 01, 2026 at 02:16:10PM +0530, Aneesh Kumar K.V wrote:
> +static struct irq_domain *arm_smmu_get_wired_irq_domain(struct arm_smmu_device *smmu)
> +{
> +	int irqs[] = {
> +		smmu->combined_irq,
> +		smmu->evtq.q.irq,
> +		smmu->gerr_irq,
> +		smmu->priq.q.irq,
> +	};
> +	struct irq_domain *domain = NULL;
> +	struct irq_data *irq_data;
> +	unsigned int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(irqs); i++) {
> +		if (irqs[i] <= 0)
> +			continue;
> +
> +		irq_data = irq_get_irq_data(irqs[i]);
> +		if (!irq_data || !irq_data->domain)
> +			return ERR_PTR(-EINVAL);
> +
> +		if (domain && domain != irq_data->domain)
> +			return ERR_PTR(-EINVAL);
> +
> +		domain = irq_data->domain;
> +	}
> +
> +	return domain ?: ERR_PTR(-ENXIO);

I'm not excited to see code like this in a driver. Please put a helper
function someplace else to translate whatever the RMM value is into a
normal linux irq number?

But this feels wrong to me, interrupts need to come through the FW
side, ACPI or DT. Having RMM pass the value outside that
infrastructure is going to be painful. None of this is trusted, why is
it working like this vs just adding more interrupt lines to the FW
description?

A naked integer is not enough to describe an interrupt in the system,
and guessing that it is connected to other interrupts in the psmmu
seems like an uncomfortable leap to me.

Jason
