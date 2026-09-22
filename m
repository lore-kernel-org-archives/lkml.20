Received: from mail-oi2-f13.google.com (mail-oi2-f13.google.com [74.125.231.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F24D579804
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 17:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790098008; cv=none; b=BSzo3WICnaLOxMR1EB6s/n8fpG93+/jun/LNhvwiLr1g6i4JGMZJ2gCN/C6onHRy9oIYdTZmurwuh03uKsawzxwFdcr3rEx66MP3CWGl04eEH0JtEwDmUZnwvmD/ykVXi14Z2GKZ4Nj3guPOKjqGIpD2TfYWlmmOaM50qZjp630=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790098008; c=relaxed/simple;
	bh=ZsMda0uwAQyf/r755/L9LfI3ibTlAaDp5ifNzI89+Ro=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RZYYI27691CP4Z8jvW3jHlWoDbX85QObxH7m1s7ZtFc1EKs45TCphNSUkj5j9UalY1gXIjQe0EdwK2xdpVyxVy+hOy75RCDJYiOiY3e6LUOxaUDx3cTiA2oLz8sBoH6n/SPBSNAZRuRrueUZ4WyUsR88StCAf9KLcJf+RCbKL2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=nO0jjZKj; arc=none smtp.client-ip=74.125.231.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="nO0jjZKj"
Received: by mail-oi2-f13.google.com with SMTP id 46e09a7af769-80a71781323so141795a34.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 10:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1790098005; x=1790702805; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZsMda0uwAQyf/r755/L9LfI3ibTlAaDp5ifNzI89+Ro=;
        b=nO0jjZKjDmw1JP0Rn0SyIsCUKuK6bDVhqqm4Sn0eYFvuk6Ys5Qt/qKNDAwAvDISuQo
         Hrbs9OfKzh5IltehgwisuXsHOWcGLyKaCelru1MTjWlLcJWHIQdbEox4JR2wxZyixupB
         Ri7MtsbsueygkLdPC1igR1kX5IJdYSe3xwjT+25snNyYCQH3rLrJCboIbXa7EV/19tEg
         WDrqCrX3esVBcmAQ7Y4Bbm6XHaMOmTNj4Ze6JoNeR+Gh71nsloqvETqewCHRbD5nO6gZ
         GXOMFiXKaUFao4rp862MDO4hVl/SWcV0B/dnz60lI5J0/+GyPFQSdokK0BEBCp9Y1all
         +0Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790098005; x=1790702805;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZsMda0uwAQyf/r755/L9LfI3ibTlAaDp5ifNzI89+Ro=;
        b=w/8qY+XsPkCXVP5u1u5UpdOA5zD/nFFau4WkntvNKKnjI9327qQmKu+sbRn7iLjgew
         kPnHZN8TfAnvwwb+JX8KHrn0kWrMF98jrWx7+ffmestRuF3RIJnlf7ZVJvSvArABH+TH
         CrsM70XQh1i2zIyUFPisIaGuDWXli/6HTGRBOkyI5/tkbkew0YyylSwEywNdIfrfS0UM
         gNYER0yNYLPqufhQRpyBLvQatHgfmcefieOgglC3G/PHNYfwLKhUK2DhGNUz1avnYa7H
         jJbem/BcW1HMVatTHIQSqlUlV4RF6Gd6Tg4pUKSlMHEpu7yGYQCpNuu/WZzzhw7Z9LDq
         kRSA==
X-Forwarded-Encrypted: i=1; AKwUvByTB22ABRDPJ0thtB8xNbDFttzDRjQQXxerHCqw+DXexBHtWJEkZ7lEiaFl8Ff5bASbLrIfHniJFT835Ds=@vger.kernel.org
X-Gm-Message-State: AFuF++nfnFLWXHa0zWQ/+gO56nSO2fUNHVpo5gmqNVBbVnk+GFJgmZoZ
	8z8awHxhZbauTz4bl8/qK86HPPuUBidzSPc8RuOuXZAh1xTz1AT94z8iQl2MbO2tfsM=
X-Gm-Gg: AYBFou0VBP4PGY6g1HocedG04VsaiiZmgO5GJKZFoeTjmmyZdO9VySfnBLveBaB5FuI
	ite+Ic/JAFtADVbaL9+BrVN3dOgQRAOQs5CnVacY341+XDaF+qf+2KW3lDVcSVU8Bk0XqUPP2yj
	aWfWix6K9J0t5J4/2bStiSPnmfUg9N024VmHSO1MN6LbF0YxxNAh9kukwXGk4zgJokyatVyKFdP
	lNx85z4g7ZYSDLzBL4s6CvFcjS5Q4kjqXqbgr2kaWjfhiqQG3QQpHhd0vZa2L8Bw/xImNG6FA9C
	hbsQQn1aYoH2cTkeloMiQ8mR3nfGK/IUNW+dtIvS3lbT99RiklZk5v8NHkj+7gRBMoY2WBBNtQ4
	yljGvf7jUdK9FdOlKgrhAVk3txvzpxzXXXQXCD2YXGI1cYzVbYYO7CnkST+hpeatjvGEksNVQxV
	lgtgm4zaaWizEBaNU3X6nsvYS6zdE8/v2BpB3cpdk2t6Fc
X-Received: by 2002:a05:6830:82ee:b0:7e9:e488:3bce with SMTP id 46e09a7af769-815f0071c0bmr324985a34.6.1790098005310;
        Tue, 22 Sep 2026 10:26:45 -0700 (PDT)
Received: from ziepe.ca ([130.41.10.202])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-81603fc79dcsm103564a34.14.2026.09.22.10.26.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 10:26:44 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1x93id-0000000AWlt-1Oeu;
	Tue, 22 Sep 2026 13:51:47 -0300
Date: Tue, 22 Sep 2026 13:51:47 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	linux-coco@lists.linux.dev, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev, Andrew Morton <akpm@linux-foundation.org>,
	christian.koenig@amd.com, Joerg Roedel <joro@8bytes.org>,
	Marc Zyngier <maz@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Steven Price <steven.price@arm.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Thomas Gleixner <tglx@kernel.org>, Will Deacon <will@kernel.org>,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	linux-media@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [RFC PATCH v7 02/13] mm: Add an allocator for CoCo shared memory
Message-ID: <20260922165147.GD1540250@ziepe.ca>
References: <20260921144847.501151-1-aneesh.kumar@kernel.org>
 <20260921144847.501151-3-aneesh.kumar@kernel.org>
 <arKsFofudnTYpXj1@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arKsFofudnTYpXj1@arm.com>

On Tue, Sep 22, 2026 at 05:25:58PM +0100, Catalin Marinas wrote:
> Does the memset() post sharing logic work for pKVM as well? If nothing
> clears it, we have a small window where guest data is leaked to the
> host.

Same question for RMM? Or did they define that the RMM zeros on these
transitions?

Jason
