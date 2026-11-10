Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794336339;
	b=zBCx7O/UGccIBC2TfnncHjFVhlk4KEnYn+P6DqUzNwSOr0GTQ/2vw8sxD9Y/c2LppBwS
	 NAesB6HABAhd/ypqmipvJaqrE4wqZUVKGMfDIizPTsQLB+AHeLUcyV/Zn5p/ENiAVXpeD
	 CEA4hnHF3eNUsBFJv1koFEB/4qASnfcdJ34KKOnyk6hPzQzGd/iwxI//6AjX+qL2o5qbb
	 NZ87caRAp3aWFhbdcclWouXOib+NElSY+j/2v0eY0BkRou9+L+0pJrgIndGUBTk/fHL0G
	 ViFBPFRuEmIuV+uh6Sq28ne1baIr+hNnFB1mT3lIZPXLXK9iMsfjaEHFyqVA//wiNbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794336339;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=j6HenvetdiqKK5Mv1KKa157Ln9/E8xXqIQ72cYSu+2Y=;
	b=dhMSBGshT36ttBulpyhS/pmBkLFxOMutHQzZrKXGMPuJTMHMLlXowZrCWrigQH5dGRhX
	 hTRSFCPqoBVBR6jUO+kBZMSj8pvx8o4ViwZNtyGwC73uFL2JZiPDWzPi0RH4d+jeBi1n+
	 YrrxTV2+qjScxejiNZY2EgQA6g7jv6NGGVkaM0H8i9jIBZsNrbXaoWYXAvbCn96dHij8T
	 T0wROm8obOAn+ygBEugRV3rg+9T10rInAL4jVsk1Qdu5337Dh8l+rzItfzXWVnBD1LeXI
	 rmN/7ZlYRn2JOJQXH8FIYZp/XTnUNqZiIBakan466eFizdoG2eIueybdp3X0ivGUIbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=fqYza+qT;
	arc=none smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 933ED606A334
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 18:45:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 933ED606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=fqYza+qT
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2eb0a52d605so6475ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 10:45:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794336338; x=1794941138; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=j6HenvetdiqKK5Mv1KKa157Ln9/E8xXqIQ72cYSu+2Y=;
        b=fqYza+qTmu263ZJR6IQbgcfkkw9jmBae56WVI+o3f6yE+Kb1eAns8SLyCefyix05sI
         yNFEQKraXZrzlgeP0EDS4+8DlSYhhDPuNHBvo9HtQkvkE80biYpP/AWmMZMb4N/avCqc
         tiBIiao8l8HKCuoG0Mts/I6lvZxkuP9qJfXB7Cyhx7J46AAPju6wNkwpIXeVimtsE/cG
         GqmB+KwHAwkczSt+6neTbRmWUTaNZHyZbOq/lWaPoci+yXV25lxstqc4zN1oce/Vkxwn
         mLCQsVZ9HPbXapT6AxcKUs02u2n1Y2y/FccJnECWdMdOU1ViJg38CiOwYx0X1JHRx/0Z
         HWgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794336338; x=1794941138;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j6HenvetdiqKK5Mv1KKa157Ln9/E8xXqIQ72cYSu+2Y=;
        b=Ru9vRPf8ZqqiMpMBJApdYcrXM2cicDVZ0A5Xb6BIUfct6pFGq+ZKKFf9Vdwao3hjcK
         if/qEcbV3N/jyoPIs+aRFaeL7BMX7zODi49oLQe8RrQU1lbAkSDIbt4dv/yLtN1P5lO5
         WUJnEUA/a8/OGZAV6F2VKGWBGFPwvs5kJsBcJkgP97ceX3zkOratGQXCxkx8yPyMBsyO
         pJY0C9OKmPCoHy1QOcaszauLE32WpzbZcS3wDfuZzW9K8a7G9uZpN0MCBfo8eO69/HL6
         ij9N6eLOCts9dAS/tg9lA5j/G7wSFMef2GZUsAbpjdNgmMvmsluLTx8k2+m/6USzdPiG
         GoMA==
X-Forwarded-Encrypted: i=1; AL+hErGCw1nF616lVoemHfhYN0JBBGYD2yrpdum8aigpdWq5E4VHheG1YBOdeVaLarK7i7A+a2dbJfUJZxOMvAg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8xh7UjU2peftr+Z0bbknCP870Rl0M3x8BvvYGnWP86WlTQgAl9
	ISpSGYaOjxZlnQ8LXjtwqvpTjdivs16IvH34YRdz3ZaDUl9WLmljjpCEaUPsaX4mYA==
X-Gm-Gg: AYBFou0icVzmRakvB6QWAYVHM0Ug/3GiuKMB3HCr0gxcdleBxLL+CSaGYbRiZOYV987
	EBz7zTBZCb3iCNC5nPH8rvijRyhIO/1BWWyKzD3slosOFcz6nymNiNDQguoQ8jmXtphxpX37ZsP
	oHxp9N9UyIzVtSiGthegfatK5G9d5GN93uUGQUBeSRIA/wgN8+Jy6kItoX+xHgs0gJNVbFPMqA2
	fKj3UIniYiKvL7gEn48Vry7Flu+NtjNTqkzRWDCZxeTrgzm77619jzfqfd+z1hbp/xtWGDHz9rW
	PEw+c9VkbvjS/f2iwLZyQGm8E1FPG9IxW4OCispvQCTPWgjokRC3xHrXuk2K9KzK9jOVIlH79Lj
	H/0TBRdtTMeingLzrYaL4erYTYp/skv40M/7srRa+FEjPZOUfQl22+hokWK6PicigwoP3Y2U56p
	lZ8ymQe//7TyPx6jxWD87n1VGwg4vauKbDzprGX6MBMmHt8HLNl3p6t+zHdevfFB/nVVnfNrUTM
	hQL4g9ITr0z7/h3KlCxm7t8SvSfmcNwd9zWZ4xSutDwQ6g6/4awkliZyFAlri5q5cI9BxLYIYwg
	hRANcmP3gQL42yVOsKWNFdJDuxFgE+XZU0WrVI4f2m7UMh/jOg2UWdgFBVRbLmnz
X-Received: by 2002:a17:903:2a86:b0:2bd:3bfd:74f1 with SMTP id d9443c01a7336-2edd7110fa8mr255665ad.2.1794336337416;
        Tue, 10 Nov 2026 10:45:37 -0800 (PST)
Received: from google.com (60.89.247.35.bc.googleusercontent.com. [35.247.89.60])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baaa86ce5fsm1317128b3a.21.2026.11.10.10.45.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 10:45:36 -0800 (PST)
Date: Tue, 10 Nov 2026 10:45:32 -0800
From: Vipin Sharma <vipinsh@google.com>
To: David Matlack <dmatlack@google.com>
Cc: kexec@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, kvm@vger.kernel.org, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, linux-pci@vger.kernel.org, ajayachandra@nvidia.com, 
	alex@shazbot.org, amastro@fb.com, ankita@nvidia.com, apopple@nvidia.com, 
	bhelgaas@google.com, chrisl@kernel.org, christian.koenig@amd.com, corbet@lwn.net, 
	graf@amazon.com, jacob.pan@linux.microsoft.com, jgg@nvidia.com, jgg@ziepe.ca, 
	jrhilke@google.com, julianr@linux.ibm.com, kees@kernel.org, kevin.tian@intel.com, 
	leon@kernel.org, leonro@nvidia.com, lukas@wunner.de, mattev@meta.com, 
	michal.winiarski@intel.com, parav@nvidia.com, pasha.tatashin@soleen.com, praan@google.com, 
	pratyush@kernel.org, rananta@google.com, rdunlap@infradead.org, rientjes@google.com, 
	rodrigo.vivi@intel.com, rppt@kernel.org, saeedm@nvidia.com, schnelle@linux.ibm.com, 
	skhan@linuxfoundation.org, skhawaja@google.com, vivek.kasireddy@intel.com, witu@nvidia.com, 
	yanjun.zhu@linux.dev, yi.l.liu@intel.com
Subject: Re: [PATCH v6 00/27] VFIO PCI Live Update (noiommu mode)
Message-ID: <20261110184339.GB519525.vipinsh@google.com>
References: <20261102153656.1431701-1-vipinsh@google.com>
 <DMOH7D1PZUM4.1X82LVQK7E54Q@google.com>
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
In-Reply-To: <DMOH7D1PZUM4.1X82LVQK7E54Q@google.com>

On Fri, Nov 06, 2026 at 10:20:10PM +0000, David Matlack wrote:
> On Mon Nov 2, 2026 at 3:36 PM UTC, Vipin Sharma wrote:
> 
> > David Matlack (4):
> >   vfio: Enforce preserved devices are retrieved via
> >     LIVEUPDATE_SESSION_RETRIEVE_FD
> >   docs: liveupdate: Add documentation for VFIO PCI
> >   vfio: selftests: Add vfio_pci_liveupdate_uapi_test
> >   vfio: selftests: Add Makefile support for TEST_GEN_PROGS_EXTENDED
> >
> > Vipin Sharma (23):
> >   vfio/pci: Factor out the reset logic in VFIO PCI device close path
> >   vfio: Export various helpers from VFIO
> >   liveupdate: Export symbols needed by modules
> >   vfio/pci: Register a file handler with Live Update Orchestrator
> >   PCI: liveupdate: Add helpers to preserve struct pci_saved_state
> >   vfio: Add helpers to identify device files that can be preserved
> >   vfio/pci: Preserve vfio-pci device files across Live Update
> >   vfio: Introduce vfio_find_device() helper
> >   vfio: Refactor vfio_device_fops_cdev_open()
> >   vfio: Add API to open cdev device for Live Update restore
> >   vfio/pci: Retrieve preserved device files after Live Update
> >   vfio/pci: Protect incoming preserved devices until they finish Live
> >     Update
> >   vfio/pci: Take over preserved devices without resetting them
> >   vfio: selftests: Build liveupdate library in VFIO selftests
> >   vfio: selftests: Initialize vfio_pci_device using a VFIO cdev FD
> >   vfio: selftests: Add iommufd noiommu mode
> >   vfio: selftests: Add helpers to map DMA memory at IOVA == PA in
> >     noiommu mode
> >   vfio: selftests: Add helpers for Live Update DMA memory and sysfs
> >     state
> >   vfio: selftests: Add an attach() driver op
> >   vfio: selftests: Test preserving noiommu devices in
> >     vfio_pci_liveupdate_uapi_test
> >   vfio: selftests: Add vfio_pci_liveupdate_kexec_test
> >   vfio: selftests: Verify that opening VFIO device fails during Live
> >     Update
> >   vfio: selftests: Add continuous DMA to vfio_pci_liveupdate_kexec_test
> 
> This series is getting quite long. I would consider splitting out the
> selftests into its own series and we can iterate on each separately.

I think it is a good idea. In next version, v7,  I will send two series,
kernel and selftests patches.

