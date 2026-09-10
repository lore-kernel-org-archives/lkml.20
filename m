Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7D2A48988D
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 12:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789044398; cv=none; b=jOaDq/FQxO/6yQ4G6Im22xaqMdIqFUs3+uHWoBfyqe/vyaRyPUOPKdltAyYEj2nV9yWvqA2pxy8Sj5BJdmBUFRbOfO58nbF8wIs6DozekLvjBe0naozCcbjT3guRGpQ4aGGuES/DyLonAh8qx1oufBq5rxCpXu2RbInO9EMAx8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789044398; c=relaxed/simple;
	bh=BHjSrs+Mxio25cWIAgxeq9qg9MSFeun0di9yy9+Eyro=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WfjLP5bE+7aA5eSDNjPcldhMBKXC5apSR/z9K//tnkcrBS4wfHCjCrnI8ZnmLwU26K7K09zuLlsbWrg2eovfMIpJswXbedeyS7QS6YrICMDHXe1ziV8tk+iClc+n9bOM4QNO+y2GoL/aiot2gEEfsFRdr8KGKT2kRHTEVcgpDB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=ETCqVC2b; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="ETCqVC2b"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-90e95a18c92so98852896d6.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 05:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1789044395; x=1789649195; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Y0IKNLxM5TSX9mM0DsyrNhze53zUnc7LA/ctMt4Lh+M=;
        b=ETCqVC2bQuZy1GAs2zReN4tOlJgBBosczzRWVh7s/KK/k6GejDin2d3keyqzcdx33t
         WdSqoJIiaJ/7oShh2ROr7SZCIOL2yh7RqIcHnrg628g9dORGzzmj1x2q+TOudOPFi4Cp
         N1WeJ5vCfiZM9PUX9GnCNcxMsV1Uf+D+CVEsYpLRLzZvAp65bwIkqYPnA+l0MhjjeinH
         P9EFSSQjLl0tsVm9qIosq1EZoJ52eg7kViZyVYyhGzvHdQU4zRM+K2wdqrMT3eofzUbN
         71NHDujp/Nj9ymJeUhRdu4vM8dCBC/TEAawGZEx54IMWUddB28XQgnDAOiJ5VnWqW2MH
         Fblg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789044395; x=1789649195;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y0IKNLxM5TSX9mM0DsyrNhze53zUnc7LA/ctMt4Lh+M=;
        b=SiCVHAw5Ufep717Dqb14eChFqQO6Qn4ouqqxRbOD9xaKVfImqa96ArN5Y2OigpiTbn
         78lNeXH7hWIXfyFF0G7r+OrPVnC4+5Q2w55jtVmmnhSvXzaCTD4mMG6ewNcEsVbLAp52
         e8NTOqLN3FZFxc8K1/ZW22IG2eoBShRdFp3wUjguEMhSAiuhb3WzIaC03PGKTCI0RjU6
         Yk722j70pKOQmPD+0dgHEgj7uJtVYW2ns5+TkyUDIa8LskB7bKTz/TcNk0sQaG+ulanH
         3SbONoddNnGEr9wAt7IlyKXnizxdL5qRCU44ySKuEITmf0b85cCI02uS+qet4ltnlael
         yH/Q==
X-Forwarded-Encrypted: i=1; AKwUvBwgOST4DpzD1t79kQfldmi6H2eCV8INDyOBUs3qb7t/HSGD/MTFNFinOGPsuPEnZDpK8wTj5eZ/s7dZXzM=@vger.kernel.org
X-Gm-Message-State: AFuF++lt5h/ylkGelXMNRKDcrGpInHKPjxJJbiWnKjH2SzszqkiIZXHx
	SPOUZjeGfqk7mlI5RE+hGiO2AEqtUZcljnLrA8o1sRgk4TH9Hc3ATYMmBZNyOJ8YFYY=
X-Gm-Gg: AYBFou1MNJ8y5zWtmXrUEXTwizKcW2edxYDFlUdWICBnew4yA9WnNUWssL/k6Xt8+xj
	kfxm7SbNgVy/82GF6bAc+y7LakSU8bHsCc4VLVy0CaknxiPt5iPw0xnHH8JM7N/yXc39ugkFTWC
	TPZluu7M/76XOU4wqwB/0eY8GqH4rJdvfS+Fk4BLQXdiZQCjOVCmbkgnm4B9kQwEION4Ulp83aL
	o9lUrtkiP776Lw7paTSLuXRfDJVPLWSaJ8O0eMzpwjwJcEMJRS1l/IYFUFK5+sJgNK5w73jQi6E
	BmZISBJuDIwPk7PzK2w7F0BnrxWw4PKGYcna0YhIfS4OiXa3KsV2Ux2ALrrmXIn2SnE7JO+Is8b
	dNyEOw84gMNkTZagwlk8tdMkjTIbAosrZozZtrFgnden0MGEZPO0A9pZ0fLVVbSzYkRPtzz9lzW
	ab7uvdwdSubZycZD40i+qmWtyTSYvns/+XnjXAA+X7i61keljQkqPMpQSJlYd8HoPEzGaYgBywh
	oPiY9JRNBNjP1KyGwYcHXxUBBUSTQ3B3pFXolDDb96uCWdduSuyLUkcEMPHQbdySaM=
X-Received: by 2002:a05:6214:d89:b0:910:4b85:a298 with SMTP id 6a1803df08f44-9104b85a587mr381394946d6.26.1789044394511;
        Thu, 10 Sep 2026 05:46:34 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9104059615dsm168922596d6.3.2026.09.10.05.46.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 05:46:33 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1x4eAi-00000002O5s-42fb;
	Thu, 10 Sep 2026 09:46:32 -0300
Date: Thu, 10 Sep 2026 09:46:32 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Tian, Kevin" <kevin.tian@intel.com>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	Nicolin Chen <nicolinc@nvidia.com>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
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
	Will Deacon <will@kernel.org>, Xu Yilun <yilun.xu@linux.intel.com>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Subject: Re: [RFC PATCH v4 03/16] iommu/arm-smmu-v3: Add initial pSMMU realm
 viommu plumbing
Message-ID: <20260910124632.GB4083318@ziepe.ca>
References: <yq5aik4nztdt.fsf@kernel.org>
 <yq5aecfbzjyk.fsf@kernel.org>
 <20260902235609.GG2890729@ziepe.ca>
 <yq5a8q5izxz4.fsf@kernel.org>
 <20260903171704.GK2890729@ziepe.ca>
 <yq5acxupjsy2.fsf@kernel.org>
 <20260907125228.GB667892@ziepe.ca>
 <yq5atsnyag84.fsf@kernel.org>
 <20260909124628.GH2543240@ziepe.ca>
 <CO1PR11MB4835512E374074A5F4AD0A6C8CBF2@CO1PR11MB4835.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CO1PR11MB4835512E374074A5F4AD0A6C8CBF2@CO1PR11MB4835.namprd11.prod.outlook.com>

On Thu, Sep 10, 2026 at 09:52:12AM +0000, Tian, Kevin wrote:
> > The mmio is owned by vfio, there should be a handshake in VFIO to
> > remove mmio when it becomes private, otherwise I don't think we need
> > to do anything more?
> 
> for TDX a callback in VFIO is invoked to revoke the dmabuf.
> 
> btw I didn't see any dmabuf related in this series (even in a hackish
> way as Yilun sent out last year). Is it not required by CCA or just
> skipped now waiting for the framework to be settled?

I think just one step at a time :\ I think CCA needs it as well, you
also cannot safely leave private MMIO floating around the host
userspace on CCA.

> So viommu will become the abstraction point for tsm operations and
> directly talks to the tsm driver instead of going through the merged 
> tsm_ops (bind/unbind/guest_req).

More precisely for what was being called the TDI - ie it is the
abstraction point for the host side of a guest virtual PCI device.

iommufd vdevice already represents this, so we use it again.
 
> currently what tsm_ops provides additionally is more about synchronization
> with connect/disconnect, otherwise just calls into underlying tsm driver. As
> long as viommu creation holds a reference to tsm then disconnection is
> blocked then it's safe.

Yes, this already has to be true or our lifecylce model is
nonsense. Once the iommufd creates the vdevice the guest is running
and we cannot disconnect it without unplugging it from the guest. Thus
the locking can rely on that. Within an iommufd ioctl context the vdev
and underlying connection must be stable.

> and IOMMU_VDEVICE_TSM_BIND will be removed. 

Replaced, the same logical operations should flow through the viommu
command ioctl

> Seems originally this series
> does SMC_RMI_VDEV_CREATE and SMC_RMI_VDEV_LOCK both in tsm
> bind op. Then the proposal is moving them all to vdevice creation time so
> no separate bind step is required.

Hmm, lock still should be guest visible on CCA, and the device has to
start up in the guest as TDISP unlocked. I'm not 100% on the RMI side
of the flow, but this does not look right.

VDEV create should be done before the realm is started. We need this
setup right because Linux VM is going to validate the vdev during boot
if it is affiliated to a vSMMU. lock should be done only when
requested by the guest. The guest must start with a normal unlocked
T=0 PCI device.

> Does it mean that ARM CCA is essentially an early-bind model i.e. the TDI
> starts in locked state from guest p.o.v.?

No

> but https://lore.kernel.org/all/yq5aecfbzjyk.fsf@kernel.org/ seems to indicate
> that guest_req() still handles the bind request from the guest:
> 
> "
> - cca_tsm_guest_req() now handles TSM_REQ_SET_TDI_STATE requests for
>    the unlocked, locked, and running states.
> "

Right the guest side request to lock should come that way.

> 
> a bit confusing, but maybe due to stale info cited from different timing...
> 
> for TDX we're currently pursuing a late-bind model (i.e. TDI starts in shared
> state in guest), so a separate bind interface is still necessary. We could look
> at whether it should be an explicit @bind viommu op or carried by 
> @guest_req (say, if most preparation works can be moved to vdevice creation).

It should go over the viommu command ioctl. It looked like there was
alway some iommu specific format to the command in the tsm version of
this, so that is the appropriate way.

> btw per past discussions VFIO should block some operations (reset, etc.)
> while a TDI is locked. Do we expect a callback into VFIO to notify the locked
> state, or require VFIO's own interface to place a cdev into a special state
> which prevents sensitive operations even before binding it to iommufd
> (and allow creating TDI vdevice only on such idevice)?

At a minimum I think we have to synchronize with vfio, somehow, that
when the device enforces its private MMIO so it can unmap it. Thay may
be an argument we need a few standard viommu ops so the core code can
capture lock/unlocks and do this prep work. Or maybe a special cdev
state is simpler.

This should be figured out before any uapi is settled.

I don't know about reset, that sounds like something the pci core
should deal with?

Jason
