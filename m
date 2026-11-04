Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793812104;
	b=AFWybBOVCbIFHGFTO9yX16msq7/YVQe4I7egcVlUenFJuGY643VGZm3yeyQKwUmzsLoR
	 Du3so27Kjc5xRXNZqHpiryRF3xyyzGWQbT8Z2Cupbe9xn+H9nl92PBRIAqtdgiSOUTMN/
	 +LFAQEuNNBB5sDiaMO6tkrFd6ajx+R3o9d1S+ZDd1GJHxWkPGnZZfX5qlj3UYrunwOHr+
	 iC/QmpPuqHPD8uISrQvKpkHj0rgP3DUIgtzQWID6u1RngQqMlVdRn3at9G2lotxTBpt08
	 SdlctDowiSODkObt4yJ951tBWlDBvFw8thrGTP3l5DXry/Ei8oOZ0MDBFmfsEzzt3OQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793812104;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Cd/4uVL9g1Nhrnk0AsW+3azM4Op/nEC3bPpOibZ+Gdk=;
	b=cjRBE+cIcdzVyfLj0uMghAZvUpm9eHqd+Xtog6LojUElKO1a9+KfPqzx3rmkWQo0WFn7
	 m0ez/P+53IiZNumzlOMgCU3Kr/p7Q3W7PqIkJb7VRbWWyMjSmpWSR1I0+4Ei6JGRAaWBj
	 Z007JEKcdCTfL2BiZsTiWDXz1sfN3vZYKiDAp5NDChtMzURtuVzs8w2tbjyNy4YArR5/Y
	 CSfx3LK2yFwNvyFtofWn5kZG6VEPOeE9Pw6eJ4cZfL6Fq5dma/i8ldWVe5+R+MWe34//C
	 /5gaRX8cl1sNTd9n91JnbQLpfiJbrFLu+dVpzTsb7oXmyvvlJc2YRY+TgV7LDoSUsmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=eGRuSzim;
	arc=none smtp.remote-ip=209.85.222.170
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0991606A329
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 17:08:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0991606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=eGRuSzim
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-93cc1ab5f6cso107202285a.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 09:08:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1793812097; x=1794416897; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Cd/4uVL9g1Nhrnk0AsW+3azM4Op/nEC3bPpOibZ+Gdk=;
        b=eGRuSzimVkRdthVIwZ8j4V5/X1jU2H86/SOE6oD6/Q7NP4cLiSqGfJgp7mTdA8poXQ
         Ts8BLSn06r486J2kiI3LSH2Su7b7ls9A7Xd9I4I/5dgh7f99Vftn1ES0gg+KDm5HAu3m
         8qhGzCV9GbR6gt+jqkZJdyvBGGVnepD7TLWBpWnWovNEPiKSh9jtwTPXzFEUmU2s5ynn
         bgHm8kXq77T/HGgjG6aK4vEYlDsp29ORryNE8bv5wmogxGrWwLnqHfJKYZ61HgXLfO+U
         bsKNswZ80FHq12CBn1lO1iQEpBkx8eF0adXetWs1C2BDIRRqw4Rb/pLyja83jYGYb5wc
         117Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793812097; x=1794416897;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Cd/4uVL9g1Nhrnk0AsW+3azM4Op/nEC3bPpOibZ+Gdk=;
        b=XOPdBrO0Uf0XrAeOG0dsVRgxg6h84s5qDACEE6DzN5G/OHmT5C3ri6wd+RVbnRkb1e
         dgsm4wFKSGVi+KluHdwLxKR+cn1X3dgog1PIsxhoQ6dCXqvFglJ48SoaNpGNYljXPW8k
         7CGHzcu4VdD9WxZbde9JqnoWMaTToDmLNshntzvjCGh/8OowSfAiaffg4Sw9Yk4TrWgz
         EPLVh9d21GsK0Q6LVP2osW3UhzTemjs+Eu8xZG+XebjJBuP1sucma3S+hOWAzmUX8ock
         3wa877gWWhwhRn2Kd14tRrQ9gAOC+2gbnWlN8BIzl6GnpMCbNzybi43gTWyEpdR19J5A
         8kaQ==
X-Forwarded-Encrypted: i=1; AKwUvBxqtLSQunooq82Kvs1eJaaksm65dqYTf3U91zsOJ2i4ICs4fV9YUpnSV0pkoBYKGLdouuaDijiA9O7Pj6U=@vger.kernel.org
X-Gm-Message-State: APuU4Z99IQd7PENqz7n5TvigmlpZP4wPspFBFHTHYX73+hsND51MMcmB
	IBcvmSYci9QDtgR4+fNXQTGKnymBsxpP0KY+I0rcHd0IxmOVf/DWDcLq2HIZeCBdrN0=
X-Gm-Gg: AYBFou3f3miQI7adXQRFIVThVDIfEDp6A12t/eEnirDx7iSTEM6sfqWnMk8i/rIObPO
	DrBP1kf1RtwoopF4h+lkj3Wa9rs9ZIobxhoAS8uTY7E9pGykAyKCUx8lu79tKuqnUB86R+jtEG7
	JfVBT4zZ7WLXGguZqHeRlLEyvT67hIRrFpV0At6AEt0V0e51jc1hCcKKxkcD5e9C30RhUDrO36I
	zX7J8zhO12Ay6HWhNor1uytBcndwx31uaEFZ7RC1aAnk+ql5W0xYaFoA2aT4SZklYNFsJezMhGv
	BexiQQ5wcIZ+/r8g09l8vrX3ZdH9vZcAMrkwAxsLvtyTERsXCg/MX2vrgLiqeGTfLS41pAs4YkN
	8t3lvbPf6z3+cixGxdbI6cPzyxoDyL5ToNa06k5Ar2ta4xDQ/PvPnERx/wNDQEV5e1Q5rY1NMQz
	hL4NaSvjjMZZDn9H2vQNam0dfwxOZM2bTqhRBDHBYgAVh2mlC7CyAL5jxN57b6tYvhWwaVG4CN9
	WquycddbkN21KvDJ5WOHEU6G/1Eh2wKIq9AVBctMcQRHrTCYKFauburO04Aq96RfJSTGOor8Z7f
	n2fmnrC1NJhLTul/V/nipa9vrdah6WDAA1gAd5grcLZxSESK5AJmQWey2OkoOl95GMQepOzMtky
	xRdRFSkjESw==
X-Received: by 2002:a05:620a:4014:b0:944:dbd:831b with SMTP id af79cd13be357-944216dbfc3mr2925762185a.51.1793812097533;
        Wed, 04 Nov 2026 09:08:17 -0800 (PST)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-945d482eb96sm247450485a.23.2026.11.04.09.08.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 09:08:16 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xOeTA-0000000GghE-1hbL;
	Wed, 04 Nov 2026 13:08:16 -0400
Date: Wed, 4 Nov 2026 13:08:16 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Mostafa Saleh <smostafa@google.com>
Cc: Jacob Pan <jacob.pan@linux.microsoft.com>, iommu@lists.linux.dev,
	Nicolin Chen <nicolinc@nvidia.com>,
	Kevin Tian <kevin.tian@intel.com>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, Wei Liu <wei.liu@kernel.org>,
	"K . Y . Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>,
	linux-hyperv@vger.kernel.org, Joerg Roedel <joro@8bytes.org>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	Vasant Hegde <vasant.hegde@amd.com>, Arnd Bergmann <arnd@arndb.de>,
	linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Mukesh Rathor <mukeshrathor@microsoft.com>,
	John Starks <John.Starks@microsoft.com>,
	Souradeep Chakrabarti <schakrabarti@microsoft.com>,
	Yu Zhang <zhangyu1@linux.microsoft.com>,
	Easwar Hariharan <eahariha@linux.microsoft.com>,
	Alex Williamson <alex@shazbot.org>
Subject: Re: [PATCH RFC 1/9] iommu: Introduce external attach domain type
Message-ID: <20261104170816.GS3889730@ziepe.ca>
References: <20260925190742.1575380-1-jacob.pan@linux.microsoft.com>
 <20260925190742.1575380-2-jacob.pan@linux.microsoft.com>
 <atiakDqtuED2cTM5@google.com>
 <20261026161003.00003b71@linux.microsoft.com>
 <ausIn5Txiy1uRjkY@google.com>
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
In-Reply-To: <ausIn5Txiy1uRjkY@google.com>

On Wed, Nov 04, 2026 at 10:27:43AM +0000, Mostafa Saleh wrote:
> On Mon, Oct 26, 2026 at 04:10:03PM -0700, Jacob Pan wrote:
> > Hi Mostafa,
> > 
> > On Wed, 21 Oct 2026 10:57:20 +0000
> > Mostafa Saleh <smostafa@google.com> wrote:
> > 
> > > On Fri, Sep 25, 2026 at 12:07:34PM -0700, Jacob Pan wrote:
> > > > Add IOMMU_DOMAIN_EXTERNAL for externally managed domains that move
> > > > or attach devices to another VM address space provisioned by an
> > > > external owner, such as a type 1 hypervisor.
> > > > 
> > > > This is not a paging domain and is not sysfs-selectable as a default
> > > > domain type. It requires external owner context, such as a vIOMMU.
> > > >   
> > > 
> > > Can't we use a IOMMU_DOMAIN_BLOCKED domain for that, AFAIU, the host
> > > never inserts any mapping?
> > Right, the host does not own or install any mappings.
> > 
> > The external domain type is nevertheless useful for two reasons:
> > 
> > 1. It allows the pvIOMMU driver's domain ops to do the MSHV & Xen attach
> > and detach hypercalls 
> > 2. It allows an externally managed device to leverage the normal IOMMUFD
> > device-to-HWPT attachment interface: VFIO_DEVICE_ATTACH_IOMMUFD_PT
> > No new ioctls.
> > 
> > It also makes the lifetime and ownership clear for IOMMUFD and
> > hypervisor, the device can be returned back to host iommufd owned
> > domains once detached.
> > 
> > In pKVM case, my understanding is that you have a emulated root SMMU
> > which does not do hypercalls obviously. Then the external attach
> > is done via an "out of tree uAPI through KVM/VFIO bridge IOCTLs that
> > proxies those hypercalls."
> > 
> > Therefore, if we were to park the device in blocking domain while doing
> > external attach (as you suggested), this requires a new PV only uAPI
> > that must support pkvm, MSHV, and Xen. So it does not fit in the flow
> > supported by PV IOMMU root driver.
> 
> I am not sure I understand this, how can the domain type change the
> uAPI? can you please point to what breaks in the code if a blocking
> domain was used?

Yeah me too.. The plan for the CC side with TDX/RMM is to not have a
S2 domain in the viommu side at all. It should not be uapi brealing in
the sense that nothing using mshv viommu exists today.

In mshv case the iommu drivers are telling the hypervisor what to do,
so they have to effectively see a change in translation. But maybe
this can be managed internally to the driver by annotating the
blocking domain attachment?

Jason
