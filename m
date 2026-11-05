Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793909259;
	b=39IAE5xMqEjk/HFowd1xvT92U0tMy0irqL/Ti6EobX04lnqIdhtNu75vR0FzL865xUe+
	 YOewSmFV/GhsF5m/N1iuWmxNo+HK5Wa+UfQHK2L6adB8z4HYKdcs1TrZTJLL5jTBhmGBM
	 m9/Yzh+L9kv808uzDO3Rj6JAyN3Bwca2JuzGz3i16fYfHGYGDw6y4CdNt4YpZ9doCtUIb
	 OH9CjfA2lS+s90nbgxTpEqcejo44q+YbdORWALLcVLoOysCjFpujcI9KJWmnB9p4aPItM
	 3zz0cUoyIX/K0b1Y/Muy5hdYQ0IoWjKT9oHa4ZXD9lqChl2LYZV0syFWlGRoTk7ed5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793909259;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=z52AWMMx/NPlxXG7BPdw5LHgxa12llcgL1Kha+Q5UfY=;
	b=oTX8PMcts0kr6myvjBSOKWrbSgQAmXCUI0lEJTSWW/kT8SPuo91IqiGpKxUyITCMYLpC
	 8mNdHOrStrORCwsbHZkOna8LmbTt5x8JxTugTPtPt1fpAitn02Qat25Z1dEDSJ7uO9kHZ
	 fW7kFuoRUV2UyRoEyHBFbUjco35rFx8k69Wzn4wmtkOt108SxGfB0RsDGM1oZtSJ93+sE
	 plDKweyYR317omFcKEs2SHuaFBdTa70o73hSvBU7Gux57W2QRzFUPaQaupqayzoQz3dRL
	 bHnbIIL+lsqMuh+HE100/qNLSA52MroRL91xZze9NXtSynbMmvioGfEaDpcgP61VEZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=pWAcW2zD;
	arc=none smtp.remote-ip=209.85.221.181
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD264606EEA8
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 20:07:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD264606EEA8
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=pWAcW2zD
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5e9528732b4so1906796e0c.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 12:07:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1793909257; x=1794514057; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=z52AWMMx/NPlxXG7BPdw5LHgxa12llcgL1Kha+Q5UfY=;
        b=pWAcW2zD/63HAANui/KgQteFGf23DIFTBPKN5TS2f+lZtRer2UXQWE5nmZ7E6+0NmL
         NOOCXte1XvmkZBJozDZeonddr7WOhKYwoxG0t/prTXufgqXucApuu46Sd4uUJbmVTObR
         7fBoftmI0x8C5OBoveyYTeiR5CzcpDKIDS2NqP2Zi4JYmMvse+F1UJ+tD5iRjIQbUeMi
         N0hs7feA4M3cPYsGIWBxIU+8M+cR5rQpjj7DVMZCRulJVbB4tHdrN+Gqsr/Umk190Esz
         gMQTgholi5MoO2YuumyOWyN+Vz/Zl26KLlq1hDXbDxh17QeLxWCQNp/kJGIw8NnG5ysp
         ISqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793909257; x=1794514057;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z52AWMMx/NPlxXG7BPdw5LHgxa12llcgL1Kha+Q5UfY=;
        b=tN+9pV+ktkjXjHDseCHn6Yp8KB8YroXeDItZbiEDew9Eyb8xkqlOV09OJaCrDPMLKr
         oHXyv8rvFiJPTERjYbTNcrezGn/D9WGGm6Q3Nzkj0bKcQdAGC7UHB9JPyilLKyf4n/cD
         vaorYgEXSXsjiy4TVh1mrpORSoYs6cbS2fxEklK2PVQDKLi13FPg3bfHadx2lsW9DWPM
         2xaT1k73wEBwCQsCxNRxWT4rvlAJYSlQCDjsUF5alWKTPUrGI/iugJVlxDTmfeZiW2DY
         NSFaaOXtt+lv26gzTN5t4ZyNCJPd5nz3YQN4N0A9bdIuPTeH4akDpajGTeD1Dj+zJ7Zd
         drRg==
X-Forwarded-Encrypted: i=1; AKwUvBwOl/JdWE97U2aMhgtH5W27U1Tk5r64H+mjLfMrxHwtFqQwEDuciCCI2/LhFQh28I7qXLfvIFipX4ApKNQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+MQt5VNSd5yvAn1dJplUOOaAw4myec8Z4cXABVKmLL3zqjMl5X
	5pOl+MvvRp+A7nuAA/vmQ7W3f0faj40O9kfKo4vKW5wbpnbqDoCI/424QyF/Ssuw5HM=
X-Gm-Gg: AYBFou3iFZIg/mTLNJ6CrUlNfNDA9FoYZQoD5YxHfdA4qcD24QOCmRIqu7VfJIoqw9p
	NZvZVkOsW82tTbobBpW7073dfD/kjvPZUqw9UqwIQoM19lchdu482tmJiJGTEphdyT8uO5jjcs2
	JlTctRvMXputUi/8B1bDrzG5SghWz3c0vOBxhR2J1cJQYduxM2VZ52n0kIlWhl6OmPNI5D6J9my
	HVnSPkhiPIFGLzjCL18BWmt5pHtz4sQyre6K9HVWOMFQnwB3h4Ms2E2YFqxpvnq238ydwHzUWSs
	JZIlJ3xHvLT7XFLtIcAD/M9TU4e4FRueEAxoX2B/WxB5SGhu2YI0PFMH3xXxtl18ERlH89S8FU3
	JEi1WwCeRtmMUpWl7eXKeYwPWUQpbaC6yVLOdWNvJe4zEDCq2sIgga6E29IsQDi55dYPXZyGu44
	LQAxOdW5FhY2oaWcjMrTtKIXuPVoSbr0gsSy4uc6fuqngN8xonm2NVf4UK6pkVXAd5lbHn7i1Lx
	wbXjoxM2rM13LZ8M+/qkFnui+brg+/YGikaYd451I3rVfzTK4u23AFUs5nQ4AyTDSsKbYN72koR
	t5jzHJCYRG1Vmy/7DzbzYbZxwtYFmGQ8yuVpOxydN3mkJK9bALhod+wrl5sWlbBAbdfUMauAoIN
	PiQr5GX4z2w==
X-Received: by 2002:a05:6102:390f:b0:7c3:99a3:314a with SMTP id ada2fe7eead31-7d2a1509e88mr658597137.9.1793909257584;
        Thu, 05 Nov 2026 12:07:37 -0800 (PST)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ecb6d79d9fsm2610604e0c.7.2026.11.05.12.07.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 12:07:36 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xP3kF-00000003dYX-3Q5c;
	Thu, 05 Nov 2026 16:07:35 -0400
Date: Thu, 5 Nov 2026 16:07:35 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, iommu@lists.linux.dev,
	Alex Williamson <alex@shazbot.org>,
	Alexey Kardashevskiy <aik@amd.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jacob Pan <jacob.pan@linux.microsoft.com>,
	Joerg Roedel <joro@8bytes.org>, Jonathan Cameron <jic23@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Krishna Reddy <vdumpa@nvidia.com>, Lukas Wunner <lukas@wunner.de>,
	Robin Murphy <robin.murphy@arm.com>,
	Samuel Ortiz <sameo@rivosinc.com>,
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	Steven Price <steven.price@arm.com>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Vasant Hegde <vasant.hegde@amd.com>, Will Deacon <will@kernel.org>,
	Xu Yilun <yilun.xu@linux.intel.com>, kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-tegra@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v8 13/15] iommufd/viommu: Allow vIOMMUs without a parent
 HWPT
Message-ID: <20261105200735.GF663069@ziepe.ca>
References: <20261104161632.3547423-1-aneesh.kumar@kernel.org>
 <20261104161632.3547423-14-aneesh.kumar@kernel.org>
 <auuBjRjQwXl7UvvO@nvidia.com>
 <20261104193139.GB3889730@ziepe.ca>
 <yq5afqxf97a1.fsf@kernel.org>
 <auzAivzpzSUHjEQj@nvidia.com>
 <20261105182106.GD663069@ziepe.ca>
 <auzNkAGFLH6da8fq@nvidia.com>
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
In-Reply-To: <auzNkAGFLH6da8fq@nvidia.com>

On Thu, Nov 05, 2026 at 10:40:16AM -0800, Nicolin Chen wrote:
> On Thu, Nov 05, 2026 at 02:21:06PM -0400, Jason Gunthorpe wrote:
> > On Thu, Nov 05, 2026 at 09:44:42AM -0800, Nicolin Chen wrote:
> > > On Thu, Nov 05, 2026 at 10:58:06AM +0530, Aneesh Kumar K.V wrote:
> > > > Jason Gunthorpe <jgg@ziepe.ca> writes:
> > > > > On Wed, Nov 04, 2026 at 11:03:41AM -0800, Nicolin Chen wrote:
> > > > >> By dropping the nesting parent from VIOMMU, it just simplifies the
> > > > >> attachment to an S1 paging hwpt, right?
> > > > >
> > > > > Yes.
> > > > >
> > > > > The VMM must always maintain a S1 paging attachment that is the
> > > > > identity map of the VM on all devices, same action as when there is no
> > > > > viommu.
> > > > >
> > > > 
> > > > I am currently creating an S2 paging attachment. This results in a
> > > > configuration with S1 disabled and S2 enabled, which is used by all
> > > > untrusted devices.
> > > 
> > > For validation, that would work. Yet "no viommu" should would be S1
> > > paging, i.e. hwpt allocated without IOMMU_HWPT_ALLOC_NEST_PARENT.
> > 
> > It doesn't matter, consistently using a single S2 for everything is
> > probably better..
> 
> Hmm, I am confused: if we use a nesting parent, why do we need to
> allow a viommu without a parent HWPT here?

It is because it doesn't *use* it. It is a confusing to pass in a hwpt
that is never used for anything.

Jason
