Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794505212;
	b=OUjDD8bjPcDfzTBeywzgqGgkI/m/K1ziOETQycoeYkXOIACwhJmUp4ZjIDj/2OwSghdh
	 QVaDoOKvO7hmxAYqgh5O6m0Wuts1Qa5ac15mbVNbH7KotEXl6cpcDGcyY/r9FfwqhObkf
	 8EVMEsrascb6vU1OvZXx2jQ6GEZDzUZEdJp0DC8oQSqhf1jMI/jvHJtU3lBZlyZbkFIHe
	 sSLJ5aQ7P2hDIGpvMX9pi3DnBz5EbWBjLxD0SArJhY4mzobX2fNq1AOiA7wjVG6vrix0E
	 1CJO4YaLDaUGoA1lodZeu494g5sTM4UY+usSO0Aj3D5Nr8wsXdIwStVS6v5zcxnypNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794505212;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=GMK7MSqRNNJITd9VKn9EN01v+V/w/ND04vZqm17dQrA=;
	b=5bF9YURdFNFf+NISNo7OF1M3VfricnpX9UbY81fBx7rWq44Tmh+LcwtY/e3vUW5MfwHp
	 Ns3KH6zDtvVL1nKUO4x+9KY8kEnzXAESHWvw+Pr6aqJeZXJYs4XraUsq9WCTrQ2NjVKr8
	 M402ds9Y0jQGqtZWJkHiXZxEitGfPT+1bSqwjrdRcQeFyrBnXLjO9BE+JPwVS1FmgLoT5
	 BTYXYUAMwTm8SfF+rZkY9XZxXynFfU1kdYWNa7kXkTKEFfSQMVAs5tWuHdOyLvNvnEhw+
	 QDt13ZFYY3b4kUwr9CfmPyy6hGA4KHIhWQwd32tp4RsZerZVgWxd6YhiHdrdSEKP0HQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=E7m+7oWT;
	arc=none smtp.remote-ip=209.85.160.172
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2E0E606C349
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 17:40:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2E0E606C349
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=E7m+7oWT
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-53664b4860bso44162701cf.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 09:40:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1794505211; x=1795110011; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GMK7MSqRNNJITd9VKn9EN01v+V/w/ND04vZqm17dQrA=;
        b=E7m+7oWT5vnwPeCygHD6YEjh7jOWPEC+ZDjeuPdczK1vYBKrloATpEDBVihXvtG9m1
         oi1WkqSgA2COI/tL0rIYwv4W397NzbGvplbxnoPs3COp53kkX/jdv8cbobRJAd8QOxjw
         SNF4IJ69TrBKYjc7paHmPNKvqMzmje7Wlk5KplK3lm03LceoOPQMDRpFo1Z/+zVyEiZe
         cqGu0Or2btrBpahALI8LEKNKbF+yWWsBWtj2Wo3iwDjvCiVEfw0hGu0rLNrZiM3ldNX3
         3TsHxI16od7ea4V61ESiHMCGExqr3qn22Hh6C2DtYSQdOCTdsfdQZMKCCJswEIr5YG7/
         5Vog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794505211; x=1795110011;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GMK7MSqRNNJITd9VKn9EN01v+V/w/ND04vZqm17dQrA=;
        b=1kw99495TKzRedVL+z8EL9uYn3MGBPvooxQ+R100cEgpdGcc0jaDKFBBh616/1pi0F
         8NUh1thyQ4HZCkl0sQZfzlOdQ6S+b02Bjqs4KYs/hdqd4UMq7fKeO93OJ8tsbK/hV/Jq
         kx+Rr9iezmV7VnWQZlhfkGO5+Au7FLWy19UqeKIVuB3++4z3Tve7SttZECP5SrxCKEfS
         H0b3IbLIxLyrEOcnu3dVbZitCmWmFsGkPh3f1stU5eM//Xb9M7Nhmnf4EgDboS1UF8zj
         Xjot298+YjyUn4iTufvicgeaVDiGaG8Bli7rmyNr2Y6cuhxdkxkFsePSDXEEAn/JmfW2
         Rr+A==
X-Forwarded-Encrypted: i=1; AL+hErHIycz6n8H32Ml1wV7LvgL2FLR8pV5XVOxe1Iy3SuKHhzzvkzN9MJOHi8NdSP45w7B/mf2zymSaQIWQ+XI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ODJesN5TLNDf/fmBmpbmhVWEzUjiqs6bSzfNJSD9SDE4W1pWf
	rS2ZkyYO38MKMvT3khMtSr+pqj9Ou6tOKK0rxcxzvaQI3bq2B2QgecC2H5hf2tCjTbE=
X-Gm-Gg: AYBFou0gKhOHcyPQpiW2LUBKHaYKqgvATOvqmfrrFE5c3qfiF1R8CWltU13fPFW50cU
	EstNcMsxJ9d9vHwmZd6KiulTC+BzjxatpK5aTDrrviBUjMLzlJ/6f5RM5CdBns+fstlRmCQw8a0
	knO31urcJgjuY4Ti7tM3SSu6OzhEVdpcndrCfduc8HmdynLLTP+FGQthGmcLxEn8SmNtWYzMTHr
	Mr5WhesFVDMjGxh2NUcPOrRKyqdwW6+/mI0A5MCe8Zy6NyN0utqcrDuDwca1b0Qzk/k5VPQyqeF
	Ry5EygJ3IS80fi5xI6T+dDVOPUgg8VsIwP/DvEJ2sKyvjVYP6mwTC/yNIMvljm1lylLjd/XEzpc
	vsq2BmEhGRYSYBHGBDA3gzJNso91y7Q8rVqXRd6ZntXpD6NjAXNQZ8rKezzo1mr3bJkdg2T65BK
	KBazJjVBWBmlw72HxfdLA1z8lgfA2ix3kZdJml+xCJsrHwWu94b63/CzF5z1Kz8XEqFdIKycwYI
	WUyijInXACE9RjAZUpzDor/PyZoMCG40eRV2VaF2wljmnG1xyC0px2P9nYmA0QvnKOUsuW/eZnB
	Qv3wkg==
X-Received: by 2002:ac8:5fcb:0:b0:533:8e6b:260e with SMTP id d75a77b69052e-55ac78597d2mr1668441cf.31.1794505210728;
        Thu, 12 Nov 2026 09:40:10 -0800 (PST)
Received: from ziepe.ca ([142.166.156.71])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d70489sm890336d6.21.2026.11.12.09.40.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 09:40:10 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xRYmP-0000000FjX1-1XQV;
	Thu, 12 Nov 2026 13:40:09 -0400
Date: Thu, 12 Nov 2026 13:40:09 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Alexey Kardashevskiy <aik@amd.com>
Cc: "Tian, Kevin" <kevin.tian@intel.com>,
	"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	"iommu@lists.linux.dev" <iommu@lists.linux.dev>,
	Alex Williamson <alex@shazbot.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jacob Pan <jacob.pan@linux.microsoft.com>,
	Joerg Roedel <joro@8bytes.org>, Jonathan Cameron <jic23@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Krishna Reddy <vdumpa@nvidia.com>, Lukas Wunner <lukas@wunner.de>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Samuel Ortiz <sameo@rivosinc.com>,
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	Steven Price <steven.price@arm.com>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Vasant Hegde <vasant.hegde@amd.com>, Will Deacon <will@kernel.org>,
	Xu Yilun <yilun.xu@linux.intel.com>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH v8 06/15] iommufd/device: Hold a KVM file reference for
 the device lifetime
Message-ID: <20261112174009.GB2532299@ziepe.ca>
References: <20261104161632.3547423-1-aneesh.kumar@kernel.org>
 <20261104161632.3547423-7-aneesh.kumar@kernel.org>
 <CO1PR11MB4835982DE81AFE060EEE01B88C762@CO1PR11MB4835.namprd11.prod.outlook.com>
 <97053bb6-c221-4ae0-972c-603b194ec25a@amd.com>
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
In-Reply-To: <97053bb6-c221-4ae0-972c-603b194ec25a@amd.com>

On Thu, Nov 12, 2026 at 11:25:46PM +1100, Alexey Kardashevskiy wrote:
> > > Once the remaining KVM file references are released, a later ioctl on
> > > the still-open iommufd can access the stale pointer:
> > > 
> > >    iommufd_fops_ioctl()
> > >      iommufd_viommu_alloc_ioctl()
> > >        iommufd_get_device()         /* finds the surviving device ID */
> > >        get_file(idev->kvm_file)     /* accesses the freed KVM file */
> > > 
> > > Take a KVM file reference when binding the device and release it when
> > > the iommufd_device is actually destroyed. Release it before the igroup
> > > check in the destructor so that bind failure cleanup is covered too.
> > > Document the ownership in the bind API and device structure.
> > 
> > I don't think this needs to be fixed. There is already a WARN_ON()
> > in iommufd_object_destroy_user() and many bad things could
> > happen afterwards...

Yeah, it shouldn't be fixed like this.

Either we need to rethink that warn_on path for some way to actually
wait forever or we leave it.

AFAIK nothing here is going to make that warn on trigger.

> > If we really think an ioctl could take more than 60s in sane scenarios,
> 
> It is quite possible when some TSM operation involves (in)validation
> of hundreds GBs of MMIO.

That won't be under these locks though.

Jason
