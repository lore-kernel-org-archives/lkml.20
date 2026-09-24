Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABB1041CB31
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 19:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790277663; cv=none; b=igov9S1G+8VFQnQ5AmxSaBkwsrZys+ZIzhbMMuMnzdeYU9r1s4OBKh1bh8fGDhnSLjqbgDKOLppKG9ikJiZOhzOnYr3L2hcnDIFatN1Oz6Y0JXbaStHr9Lamg3Fy/RxOn8wPMPAIlBt1Vd7GrzVw9FVN/YNw2qy5wzYKoiEKxv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790277663; c=relaxed/simple;
	bh=Rj3lvDiN2NQIPY8+Fcb1qFFhsTlk6MawBPpka9LgHOw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uqm6MmDcGqymLsumr3IXlfIo1f4Bik9uQBwr9ryUQ+HqLZas/9FQ/LUdLW1v/xRs9wjxvDTDVtvsYXGC3LrWb8mqdk2m3tgOUuXk0B2MCdK0cky9NhA5xX/Wos6e9akVSQxMZFZZPhWqW1ujEBpgP03tva56OztPZX6er+8+V94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=kxGdh5Dh; arc=none smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="kxGdh5Dh"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-33e46a15703so77969eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1790277658; x=1790882458; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wndndcOgS9UQetfbY1PV7Ii3PybmfQMjB1dSgomByBI=;
        b=kxGdh5Dh3xpWmyrrint4b6fn3ol1Job9IB/YcGYPgHcBOcWkMqpd+0txld/GPxEZWm
         yxlyAe5YdGWOD0v9U0JbQOR6SyUay4K5qsDKcuJDK8X7YOYpOhDzd69U6itnNOdPcTlA
         j2VTWktT0rry6EvJ90lSlcMPhdJbHKCpPm+166oXeH9UJ3p5rEDafomTiu6HI2HTW9uh
         5QPcMCW8BwMYWSw6rgmPC+fcBiRpcmU/y82JrqsEz9B1LbNoCt5H2DTcx9xgoCQeUAQ7
         Vo7O+plw+k0imyya5zGtkm1hjcat4MgWivWrRBBWFrG1PXHQ4K5W75f+LkBZ7OaM/K9d
         koWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790277658; x=1790882458;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wndndcOgS9UQetfbY1PV7Ii3PybmfQMjB1dSgomByBI=;
        b=Ti2Oi5v2dSpWKql4k/Go9iZ7vL1lJVRGrabVeoUG23r8kk9/kWImvdzqGo3sMWukVY
         9tnRSCCD8RBz07PuN8wLinEN8jN+npHo1V8iGGtusabiNJ6yXU4Ek6MXYHIFhSpkaQ1b
         aSdZ3cRS11qNyKS6erIUc6u4O3cb7amDBOWEevo0MbHnCEpZIPYpXbRho8uS8pL7e3ih
         fxM7IM4Sl/EqacDeKIYyB/nlvF9MG/kOvJI3ZnZRlPA9Ke21Wz+xcWePR/d0zSNcxhn/
         rzeIQR505Dv+xppOW/pzwGhNHK+ETQqnHDin8QF8R53uDMi7vj5yMVa6HrmcfJhyAfJ/
         cR3A==
X-Forwarded-Encrypted: i=1; AKwUvBztwLcBfjdr7l4JZd8S74DMhUveTEEGg4pXGA6srG5PXLidAd3pgNAnxR+9FCU4ceMBRFW3zRm93NfFI+A=@vger.kernel.org
X-Gm-Message-State: AFuF++mpMcfRGy8OWQXg8LrjfiMHqCJLBbZk4xDm8lN6t/vIck5XOMtO
	lLwtaHo2QIslXuQt5FVy7AZdWhb8ECFyjArBi15hnghHeXMG+XtUn/WdBqI1ykTJqLWTAezAT1P
	PABRa
X-Gm-Gg: AYBFou018z1iHPNcz3bKcIA5bob4oI22SidegoXYJnGbbBA3U9gsUmwFDaJnVU/xqH9
	u1AdEq3WokfvtI9oGKo5oD8rj2HOjZdTXLDOYoMnas1HNeyvRTyo7eeIKk3dpFSbrFyhzyyUN7O
	Vc7wltwhJuRsMZb2Z4NJsDx3b0eu0EmkbUxusxFrDjsAzORQHRRJBW5zocGi+wIoEHOLJW+QKpj
	B0rZhP+3/QtJl5O441saWhqrQwDMP+n8Wkfscyyegazz1fiROctjsJXW59X6Ce9M1XFjLBQhyPs
	yGVIdAYmPKor5B2yOHG/wxJCj6PoKINL0hvvrztqodzBig06V7g7Bq5px8nXvUDy6En0e62rxiS
	QXHpk41CycOBp+BdAKBIZrKXIiyTOo01ve/MITAFxf0kuWrWcKO6W1ZldZa3onqPbWXt+BtCFcu
	eZTBMMSdS2GV1SIynpFei6KaVd7cU7S7eLBAkHalOPPh/x
X-Received: by 2002:a05:693c:8201:b0:339:7572:7b2b with SMTP id 5a478bee46e88-34000737ac9mr2950958eec.24.1790277658136;
        Thu, 24 Sep 2026 12:20:58 -0700 (PDT)
Received: from ziepe.ca ([130.41.10.202])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34145632298sm611644eec.22.2026.09.24.12.20.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 12:20:57 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1x9p02-00000000UV0-1Zib;
	Thu, 24 Sep 2026 16:20:54 -0300
Date: Thu, 24 Sep 2026 16:20:54 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Tian, Kevin" <kevin.tian@intel.com>
Cc: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
	"iommu@lists.linux.dev" <iommu@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	Alexey Kardashevskiy <aik@amd.com>,
	Bjorn Helgaas <helgaas@kernel.org>, Joerg Roedel <joro@8bytes.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Samuel Ortiz <sameo@rivosinc.com>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Will Deacon <will@kernel.org>, Xu Yilun <yilun.xu@linux.intel.com>,
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [RFC PATCH v6 00/11] iommufd: Infrastructure for vIOMMU creation
 for confidential guests and guest TSM requests
Message-ID: <20260924192054.GA16465@ziepe.ca>
References: <20260917140159.1163281-1-aneesh.kumar@kernel.org>
 <CO1PR11MB48358E3116CC6CF34E6437658C812@CO1PR11MB4835.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CO1PR11MB48358E3116CC6CF34E6437658C812@CO1PR11MB4835.namprd11.prod.outlook.com>

On Thu, Sep 24, 2026 at 07:48:08AM +0000, Tian, Kevin wrote:
> > From: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
> > Sent: Thursday, September 17, 2026 10:02 PM
> > 
> > This series adds the IOMMUFD and PCI/TSM infrastructure required for device
> > assignment. It introduces an IOMMUFD-owned vIOMMU provider registry and
> > the
> > IOMMU_VDEVICE_TSM_REQ ioctl.
> > 
> > The series adds a vIOMMU provider abstraction that allows a subsystem
> > other than the physical IOMMU driver to implement a vIOMMU type. It groups
> > the vIOMMU operations with their module owner and private data, and makes
> > that implementation discoverable during vIOMMU allocation.
> > 
> > External providers are selected by exact vIOMMU type. When no provider
> > matches, vIOMMU creation falls back to the physical IOMMU driver. Once a
> > provider matches, its result is authoritative and failures do not trigger
> > fallback.
> > 
> 
> I wonder whether this abstraction is necessary.

The main purpose and point would be to keep the TSM code in TSM and
out of iommu drivers.

And we don't want a module dependency from iommu -> tsm either..

> The underlying IOMMU driver still needs to understand this vIOMMU type
> to check vendor-specific compatibility and provide the relevant hardware
> parameters.

It shouldn't, if the user requestes a TSM iommu type that should go
directly to the TSM driver, and the TSM driver should involve its
physical iommu as necessary.

> There may also be further vendor-specific interactions between
> the IOMMU and TSM drivers.

This is the big question - how big is the entanglement. ARM's is
small. What is Intel like?

If Intel and ARM are small, and they should be because the T=1 VIOMMU
is entirely handled by TDX/RMM for security, then I feel this is the
right way for them. It keeps the code nicely isolated with only a tiny
bridge.

AMD is probably not like that.

> In that case, the abstraction risks becoming little more than a
> connection between two vendor-specific drivers, while making it
> harder to maintain a clear scope for its operations.

Glancing through these patches I think the abstraction may be too big,
really the point is to allow TSM to create a viommu, I'm a little
confused why there is so much stuff here.

> Would it be simpler to provide helper APIs and let the IOMMU driver use
> its own interface to delegate vIOMMU operations to the TSM driver? 

Now iommu driver module depends on TSM, do not want.

Jason
