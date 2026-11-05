Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793902869;
	b=OaZRS8Xh3LZQZVNZrq3zMqQ0UYRT/47h6y82ICygFBKnkNcpmzaRQ0j/Wflv55jNZ9DL
	 eXRkVoT7tfvI7fVZuR/IxNHn1m/BZpDaKCUcTtjFFqxELqhgxFFpWyyqZz3teHj2kOZGB
	 lF7w1VkG/rPit5gCxUjmXChc3hTDCdmllLa9Z4RrXV4iEMGYNxAQDzurSagiO8QVmiB2s
	 /uB8TaczUbUatApggpx88T4dDA/7xE7SERMnTdOM1Q0Ymln07vRJfJ0lOjQKIBXFDjkRP
	 dnkrfopSzx5AxS1VkKOyq9L5bP1O1pPRiXsel601ZgJZdOAyQiNTmyWyjUwP5Q35n4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793902869;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=jskhMrN6L8/ity8GI6Per+nZ8wI0zDQt0quVEnFZ+Iw=;
	b=OSafXxVVCVASC/dySRYhqxZ3OsU8kmB4uJsejycpAvY5BaACpijM6eeQ+OSdlsur0bSg
	 gOtELOxfUkgSnHFrnBGcbQeqt5tO2XuAtzoWhO767bV9rTsk/+n0GMYW7XCQaPbnZIqSI
	 5v5uHJogr7pJ3q8AAYJmSLvn2BpmA9DR0lh1ONaP5Md/lHjGKzelHsZbBsExsbb4XRSxM
	 HeP2CI9VEebSmNZBHv5bC/BI3kNuw8sVfwh4wGrCNaAWni+omfmL1CEOe5EJt07gg/ubL
	 YMY7SzZhtCwgrHoA09l2QdpCye/fCk0QoPYqFrS1vXEtkstwH3RFNUDB1S/Z78UlpFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=ire535yI;
	arc=none smtp.remote-ip=209.85.217.54
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9247606A32C
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 18:21:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9247606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=ire535yI
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-7c322cbc998so587230137.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 10:21:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1793902867; x=1794507667; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jskhMrN6L8/ity8GI6Per+nZ8wI0zDQt0quVEnFZ+Iw=;
        b=ire535yI4zQnLBCiIAurI9xJYsUwvc7Sip6NA8XOlKY8BmMk6D3rtdebYXDlLnb+ZP
         aEGddu2E8npnG7M4/+0EgOwpXWB5SDN4kgpIxamJ2Uy2NDnYvTWgObc3vELT08wtz/xF
         3xeWBALg5snzMuspxTmvkiNsDCe5u5k7BqFrm+FvEdrW+9g4YmpiWSs7IIKmBLSXprfT
         B76tw8MYCHnKMka4LW2C5MZT3rGdLaEtriq6m+jRXouhgJYmsUSLWxCwDQA/9gbJdM1n
         NRjQE5XtPnpZDvStPl0FX//pa+XdJ0rYFA3eynPysioKRTlm1rN1Vx2zxk6ZZNMhX2vJ
         yV9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793902867; x=1794507667;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jskhMrN6L8/ity8GI6Per+nZ8wI0zDQt0quVEnFZ+Iw=;
        b=c/Nm0/vWmQ7jhEpavMYF3nxdEOWEVbyjidWUBTrU6QTKStTI+dvU8zxiyuln3rGmfz
         sYGfjCwlPv9PD+9HIi3Fw/zRWw+co6Z4VlvFBF+b1hDrjaxrL8shaqqqZ+20Lx1s1l6A
         jVPfcGNcRfc9CSleIGN8L3Lzov/JbwGDtgCxIviPqbhZPhG2W0ecfFuITJJrciDDcci5
         y+eHXuqQU4rpcDvG/s+1daR8XqH4tqDkv44GTXZA5UGvCGotCVsuCPZZTugZFP5UmkPq
         Pb/LTb8uFZMy7qXK9vmZ/Dvelo668zbxFFMGXlSmumKJ6/O3rchVrOimXhDiDREnaVeq
         bGRw==
X-Forwarded-Encrypted: i=1; AKwUvBxLIcTfzz2KRMNVuFgTWu1Ar6PVsIxovCWCCO6KxXrT2Mx3etxyGvCf65zBkpv/Vd11eJXBOlRpUzGMIWc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+O+86XaK9mJm6EMn/P0W2/cKjd1JimFJcZqzY/24JRPjMXcyZD
	P7CXT+r4MyysW9hIGqGtb1wvtNQq+/mhDmlHJjIXv4O+jZCQYtS6WkrVAakNECgbvro=
X-Gm-Gg: AYBFou2//PtQfChGgMAWipEBHU5x7c27QggKmXOWAqWsi6QXEX+QOVHfwegVNZ4B9aj
	g3XyFtYIUxM8K6GL4/jKCCfItSdVK0qO12WMxIUaz2Ka5x0tmLJauf8ZpdJZEbfBS1KSGx3w66R
	WnfeFcyPqb/Rzm8pKl1LKG5ZRIsKPMdO+IOpaJuoxT5U4xkcxHYq3+tw2uqm6ypveetk6H4Vkjj
	MAk1dmN2Ba6Fd03QoZvlC6M1VrACYID5jJYOcgxdA+xdMoh61JODJvV8A2T+LS6vqX2gazpJjkO
	m0aCquqT6TsZkIU7fwQCPvUlBKKYR25WiWxn55gum4x7MHcywul5qVx0Ynb4rrOe5YfL+FUHCTk
	dfqljIjHXy6lr0JuW310hVGaGJjeD+bdM0g3aydNktJrtJSIiUiAipatdppcZ9SYtUAY1o3ycRQ
	oN+TOgVpcRxtEV4rnf8Sy0Y5nGnpzK6h2R9XDZfdrWB+mn60DiljEU3AQJCNBjK6cz4uqaKjsuT
	ZIrfjoOIj+OBKWdtSPnipYn7uw8szb5NiH5pWs3OAgXhvAfGurOS1DnBNLwwMNK0O25yu5738PD
	g2PkQ6til/jvqYLS4ZtmEnJpIiOREPglqniWn33sPgbpRTUwkvUKx4rN6Fe10GvMqEje1YXAzuZ
	H7uNOLtSJGg==
X-Received: by 2002:a05:6102:5706:b0:7cc:2712:caf2 with SMTP id ada2fe7eead31-7d2a1628b19mr348440137.23.1793902867469;
        Thu, 05 Nov 2026 10:21:07 -0800 (PST)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-998da178b59sm5242293241.12.2026.11.05.10.21.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 10:21:06 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xP25C-00000003LsF-0vAz;
	Thu, 05 Nov 2026 14:21:06 -0400
Date: Thu, 5 Nov 2026 14:21:06 -0400
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
Message-ID: <20261105182106.GD663069@ziepe.ca>
References: <20261104161632.3547423-1-aneesh.kumar@kernel.org>
 <20261104161632.3547423-14-aneesh.kumar@kernel.org>
 <auuBjRjQwXl7UvvO@nvidia.com>
 <20261104193139.GB3889730@ziepe.ca>
 <yq5afqxf97a1.fsf@kernel.org>
 <auzAivzpzSUHjEQj@nvidia.com>
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
In-Reply-To: <auzAivzpzSUHjEQj@nvidia.com>

On Thu, Nov 05, 2026 at 09:44:42AM -0800, Nicolin Chen wrote:
> On Thu, Nov 05, 2026 at 10:58:06AM +0530, Aneesh Kumar K.V wrote:
> > Jason Gunthorpe <jgg@ziepe.ca> writes:
> > > On Wed, Nov 04, 2026 at 11:03:41AM -0800, Nicolin Chen wrote:
> > >> By dropping the nesting parent from VIOMMU, it just simplifies the
> > >> attachment to an S1 paging hwpt, right?
> > >
> > > Yes.
> > >
> > > The VMM must always maintain a S1 paging attachment that is the
> > > identity map of the VM on all devices, same action as when there is no
> > > viommu.
> > >
> > 
> > I am currently creating an S2 paging attachment. This results in a
> > configuration with S1 disabled and S2 enabled, which is used by all
> > untrusted devices.
> 
> For validation, that would work. Yet "no viommu" should would be S1
> paging, i.e. hwpt allocated without IOMMU_HWPT_ALLOC_NEST_PARENT.

It doesn't matter, consistently using a single S2 for everything is
probably better..

The VMM should try to minimize the number of hwpts involved, ideally
just one per NUMA

Jason
