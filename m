Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794316946;
	b=soJ5iLSDD9Wy87JeEu3+546mhaSYYNIXDzCtsbV+CD/J+AXEI3MwRigsjxNlilYp4isg
	 4ur39H1RwiYiwReDq1azNB2o8lJKHqMWmiyfa+1LVGnUnfztSUrQjET3cmLc2wQX0jN2J
	 XZoyCe/XxMmDP9Tm+3rN51NS7HeDOcjEtVs50DbUFXTj6dv7w6icLPOn9sSwkRtQUHG20
	 U8xuD0ALotSIsekmmQa4+p/QJpYyvBe4b6N2Mav1JEGHSOJpNbZw0PAr9WHFDQBp5d9v4
	 efbHezuuNQrMsRgGXZymILasuFIqNDZO09rbdxINdT4w4GhEeetJd/32JccGfdgrlIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794316946;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=g75W/bT+6sBq3ZuteoFUFS+Co7pEE7nkrsl0KkNU8Gs=;
	b=iRrvq58G5MVwJoyWwCLZ/OgitR8mxWB59f590f506lwy/Z33EgWmTGfDSbr61Jf5/NaB
	 YcaFuylGPdy4q7RdW2PgLcPcb9KEAY/Jj3uEQtaziNAEjJj+LmrU6bU7whgWC+2FTub7Z
	 cSlx2y77mlM5NfVEkn/ABLgnQmlpWkClmkSCaou84GL6gjzekUhGyeNOcG/Chg/0zDtpW
	 3n6Rzyg7a0t2LYfk4FFmqvh81G0pn52ZwnnJUPTn9fobd7uZKbb5i/Qe8QSMSEFl/HFj+
	 cK807SidXJRFJ2Ce4fHF8c14Jpm1aCwbsB9sPXv926ngDTpMqiNU1LS0NndQWIsub2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=FHvsNgog;
	arc=none smtp.remote-ip=209.85.222.169
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B82D6606A768
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:22:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B82D6606A768
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=FHvsNgog
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-930c0f9c1b1so203439585a.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 05:22:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1794316945; x=1794921745; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g75W/bT+6sBq3ZuteoFUFS+Co7pEE7nkrsl0KkNU8Gs=;
        b=FHvsNgogAjEacq7zoQCQutH3H2rY/Mp6nn0PQAx6XhH7dqAsY4gCPt7R9BdbuXPKAi
         wxpxDLfikqVcN5xM1VY/H/v/NFQ6nTNQYbBjTB9Y+X54YQTUKZWiCbPrue0kUPKLvs0B
         SWItP2scQqWO4gEug+/zO85bmIDyfB5gy06RbKUkHIRG6Td26af+dAAfFxPpJhtVkzxI
         RTY8q4wfOVoj8Mo0U14wRoJwsgbjTWIxlmNGak378mVQpNEb8y5wGLQ5tkNTHEct8BTD
         2QLJqKjtduDf7mQ4NLfWes8q0X9CZ1SxAGlG6dddpQmRt2wbHKc2ucYJzj5kuQNmJupi
         3xxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794316945; x=1794921745;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g75W/bT+6sBq3ZuteoFUFS+Co7pEE7nkrsl0KkNU8Gs=;
        b=Qoa14kEAjMhbpq30Ju3tKeE646trTeLOi5jZdhQ6YLpIJTh6r3Rcyb+xFo5hiUZ7BG
         RKEhPJW/HPJTlqmt1mYdvANtbdOzbe95JMicpsIo8Axqvd3I3MP2JOexK6LAA0xvHWM4
         yD/5QPC8850TB4cUSdUTyY8yj//aiFAn7zkzpCzCtRDMVYYYcVodganIjL/0kqdjV3fF
         7sUui534+X7ccZyqm24PIXV6JqvABRHbs8bxdhoXfC8jlPRj/gKrUPV8ukpM72hFrpIy
         pyIEwFlO1a6rBSIgUvhiyR6IiHf0vcAwS2rsHn9n/ByRD7415gZiZ9GPmSvvXwDbVCaC
         H7Ig==
X-Forwarded-Encrypted: i=1; AL+hErHV757ffm5d6mtdeQr/iG3mQm2GXfpAyfFZjluZCi+cZiVrxCHOUHjIuN0X2hCLGcaX/e9OsPRshqMzgJs=@vger.kernel.org
X-Gm-Message-State: APuU4Z87QiyKt09tyz7KZIrrMh1G9X0xwEWsS9cmvLkixnI3oG7Mqi5B
	kpRT1TgAqvyrPG05MgPbPuu/fuJTo/nhJaYMF9/WMWt5YcQCgFLUbjW4d8zmYvjTmiw=
X-Gm-Gg: AYBFou3oi/OJBWLlKt9DhPHOUc++FjP/OFM5kwZGviGBTGeit7VAb20c0tnPfPfvZoK
	wDmPJHUWWLtFwkDUBK6PlusG4R484cxeO3EE8iWO90/RUd9i0eRoPxIZGr3TsEIKIeqHqa91B2Q
	Ae2lgpBqO9z1J2DE6MmkKXiGZb+Mg3Kns+oU3Xjw7YA14BSzAMzgbqkeg4PLO2YK0jjykKWVO7V
	ggIZrC5lqsjBlWZSyowhTWgAN6ENCsqqMtW4lf6j/JyUaVHnL6QHhY5+Y+gzxyZSscmOaLVdEw4
	xS9Ll/pcXZvjzOp6K07qJ+9o9VDD9v91TmCtwBMp46oVByTgYqdl4wmwGUE8rn1Agu77Pgd4Dkg
	0DMnBV5oFki61GCn79py1WaVfjq1fPy1KszkUS9lLsJq2Yv+TYqn7nDo/vdIJakpn0U6kSORsJr
	TQVf/mTrePHe/Izc2QBE5RagNtlDoXRuIWVIGUuDUoXLBtDp6SzRfu+ev6+RqU9mOgU1+7Qtycr
	3knUjVkIdqzI0IZYJWheJIzx955hC1AJ8XFm+mva+OAYZZWX5l/9YW6pTLMwH9drcWHeOFyjw5d
	vjTAosbyAWQ6J8KKlNHsUVJY0U/5u54pc8as+CYVegtbbXW/ZcBKGDPXT1D8PR8nq0OAyoJ7Dz4
	YtMYGAzL1mV0=
X-Received: by 2002:a05:620a:1a21:b0:93e:c12c:43fd with SMTP id af79cd13be357-9479f373debmr404603885a.74.1794316944696;
        Tue, 10 Nov 2026 05:22:24 -0800 (PST)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e7915e2sm220546385a.23.2026.11.10.05.22.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:22:24 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xQlnr-00000005hfb-1yLA;
	Tue, 10 Nov 2026 09:22:23 -0400
Date: Tue, 10 Nov 2026 09:22:23 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jacob Pan <jacob.pan@linux.microsoft.com>
Cc: Mostafa Saleh <smostafa@google.com>, iommu@lists.linux.dev,
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
Message-ID: <20261110132223.GX663069@ziepe.ca>
References: <20260925190742.1575380-1-jacob.pan@linux.microsoft.com>
 <20260925190742.1575380-2-jacob.pan@linux.microsoft.com>
 <atiakDqtuED2cTM5@google.com>
 <20261026161003.00003b71@linux.microsoft.com>
 <ausIn5Txiy1uRjkY@google.com>
 <20261104170816.GS3889730@ziepe.ca>
 <20261106130352.0000638d@linux.microsoft.com>
 <20261110005259.GU663069@ziepe.ca>
 <20261109224200.000033c6@linux.microsoft.com>
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
In-Reply-To: <20261109224200.000033c6@linux.microsoft.com>

On Mon, Nov 09, 2026 at 10:42:00PM -0800, Jacob Pan wrote:
> Hi Jason,
> 
> On Mon, 9 Nov 2026 20:52:59 -0400
> Jason Gunthorpe <jgg@ziepe.ca> wrote:
> 
> > On Fri, Nov 06, 2026 at 01:03:52PM -0800, Jacob Pan wrote:
> > > I am not stating that it will break UAPI because of blocking domain
> > > is used. What I am trying to say is that with the blocking domain ->
> > > external transition, we do not need a new UAPI for external attach
> > > for non-CC. It will just reuse the existing UAPI.
> > > VMM:
> > > 	do_ioctl(vfio_cdev_fd, VFIO_DEVICE_ATTACH_IOMMUFD_PT,
> > > &attach, "VFIO_DEVICE_ATTACH_IOMMUFD_PT");
> > > hv-iommu-root: external_domain.attach_dev() will do the hypercall.  
> > 
> > You've basically described a wonky NESTING domain.
> > 
> > I think you should just use nested domains for this. Even though there
> > is no S2 make it possible to create a nested domain through the
> > viommu..
> I didn't use nested domain since the current parent hwpt is a paging
> domain which cannot be used to express the external attach semantics.
> 
> Are you saying that we create a parent-less VIOMMU (in Aneesh's patchset
> and my RFC), and modify the iommufd core code to allow nested domains
> to be formed with an externally managed parent? or we expose a
> opague parent S2 that is not paging domain?

Just use a null S2 for this. If the viommu was created without a S2
then the nesting domains should be created that way too.

Once you do that you have a normal HWPT representing the S1
translation in the guest (identity to start) and everything works the
normal way.

The only wrinkle in your setup is you don't have a S2 at all. Not even
a placeholder.

> But if we go with the nested domain route and let hyperv iommu driver
> handle the nested domain attach, it still would not work for pKVM.
> pKVM's root SMMU is emulated, so it cannot do the external attach
> hypercall in the unmodified SMMU driver.

Yeah, I think it is fine that the hypercall is not part of the smmu
driver..

> So I am willing to entertain Mostafa's approach to park the device in
> blocking domain, then use hypervisor provided viommu/vdevice ops to
> invoke device external attach hypercall. Basically, move the
> attach_device to external S2 operation out of iommu driver to the
> hypervisor code. It does not need domain ID or anything IOMMU specific.

Right, though in your case some co-ordination is probably helpful
since things might go strange if the hypervisor side and iommu driver
side disagree on what the translation is

Jason
