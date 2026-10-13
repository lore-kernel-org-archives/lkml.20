Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61564558205
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 20:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791925037; cv=none; b=OLJjS75//02ZEjZtZCGKLoulW/b+LfFitz3Wer1LfhL9gAts9kj6TKGPEYl9mMjHdmkJW5ELt2+Pt1V+chtURQZZjcVHLoupK6akLyvR1LlspuNVkljlvQRlbr2sNKZzcjiY77xugrS9mbIabUOvpI6SpEKDnD4jJJeIVeBI43U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791925037; c=relaxed/simple;
	bh=SkBPgCOEkL2aanWPopCSHyRsbOVQx52jXKNNybsyhLE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SJsM3Wh0UxZ1YpyQQFeYdRRrLq1u9EIKMdynYimaIgcZgGCVVMkDKi6O1QXAfaVSeTKtUoQR0EuE0ei1ivWdphRuKxW0V4GjklZcFE7EwE0AVidQf0QbCaHHRN5V1mr5hWX6ZDzyOsgCnb62M9xiVqS/UE3xlwqXdfVkDk+SUTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=C3CJH6mM; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="C3CJH6mM"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2d8fd7a3f38so180575ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791925033; x=1792529833; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=82ugTuSgSHfkTSTJDZNTDw80Zvb5fgS5piYd+dS2K00=;
        b=C3CJH6mMiYwUO2Pzpryx+UEUep8I9KAmkYNZbgKtOyVAYBAiUjx3ibjdcQM9IAcpBo
         52L325xk7G0L8uEmgUYnknL2rWlKP817E0kGByRi0jGoRx0uWfIUDUFf7GnTI6JMGmmw
         1/hh4vXi2w9AV3D59nKsT5k6IlnskrPo9wz3xU9twlxV1Couju1XLC34HDYeX1MLBa0k
         N1Cw+naNlNIE4VkCmDjGdm2LzY7SS5r6zkK/y7AHCIHRkAIbnpgSF4tR4RRGQh512qJC
         P4z002jGZz//PngXSviAe1tpv3HPYkfG31ibdx0EyA79N21DT3ih9myxIx1VvvCQ5Yww
         3ycg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791925033; x=1792529833;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=82ugTuSgSHfkTSTJDZNTDw80Zvb5fgS5piYd+dS2K00=;
        b=yPwuM2/qhdA+Jd6t9scQ0XGqmoEaDZyhIOqQDGIVlXO2tHBCwJJdPhcbNV/bx1AIKE
         0PTMP8A4CP/3Bwbk6TcHT6c6lTqO6pwCXOQLj2nmmQcH6y3LdrS4tREYBSghNasGXkxg
         RMoPUEGD1+49BqfbWQZiW69eNFgsPkty4VBiDrWIHfxontxjIMDz8xXDMeJuCHG8YuhA
         6lIql60N2kmsfJ/fAlNBkBZht8z0eP4n4dg4IFbvPmq/hOTQZIf8ikymtRFXZjMUGUZV
         KBMHzsFU49HexiXrHMkNSkTjqEcRrCQ72C5fRxh0NujXFh6Y8eSP8UuJNuEdOgj9NASQ
         u86w==
X-Forwarded-Encrypted: i=1; AKwUvBy6fihxoCHLUIlsiGQATJW5BgW3kq4yPoPpKLv6XoF9mQ16DtvoUNge1rHSA1SiI3Hgn5U2ubWDiNxeCR8=@vger.kernel.org
X-Gm-Message-State: AFq9FYINsVm7ygrlnP/w8Jt/WOzQ/1ydOADk5RJfbn0J+t/qkNth9FV4
	P7zr6QWkpLM2IEl/hb9DBv935pV1NRn77S4dgG43j8tMrupXOE+09xFD30yiqrPu/g==
X-Gm-Gg: AYBFou2n1PM7kj/3KkhEb+6JkTPrGtAMfTOdzoKtZbgBkFyXTxNdwIzDU71OAMJESTd
	7P9xe9PRAg5MNlosb/idTw1tO8PMWPwrQXYaaLZnDNK4ElblG1UTBlciuCckL2h3fTC/JGXG2Pb
	6MKRgCVxLxCZ1VfhLhn/EK86O886Z6ILZRH69vJ/ra/w4hryVVkh4qFTCpQn8ZldOiEU5Fjo4a0
	axbaYwTazsLnE5h28uriCfu2+NejE9IDuyGHQxvYkgzjlOqanRVT/p5yjtKhe34OhVEzMBvp98J
	rTRl2PhMSqQ6jKux131wXcdCQnJErnRSwK37DXcDqbRbqLH8jGdU/RioqgD6GYNP7pgcjP+ySAe
	IdGzoZDeP7ifCSeNWeM6u2/Q1769adcf1J78jWWtliNvHcBN/Off2XdOZ67g76/GWXfbSS5uFsm
	m//bPm48hufJHU2wfTpntjLhmi2XgeaIsRvWCLHdrgkbPk+R/DD3RQNHGeUNYSEPUYs0AsX6umF
	EUQINspupj4hzplOgXawa4BtfO/90phahMZcLelnaNw5xl0cr+tfemOumixO3KSdfo=
X-Received: by 2002:a17:903:1cc:b0:2e3:981:4cc4 with SMTP id d9443c01a7336-2e87e2f88a3mr13643365ad.9.1791925032914;
        Tue, 13 Oct 2026 13:57:12 -0700 (PDT)
Received: from google.com (163.1.145.34.bc.googleusercontent.com. [34.145.1.163])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac6791eba1sm146719a91.3.2026.10.13.13.57.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 13:57:12 -0700 (PDT)
Date: Tue, 13 Oct 2026 20:57:05 +0000
From: Samiullah Khawaja <skhawaja@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: David Woodhouse <dwmw2@infradead.org>, 
	Lu Baolu <baolu.lu@linux.intel.com>, Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Robin Murphy <robin.murphy@arm.com>, 
	Kevin Tian <kevin.tian@intel.com>, Alex Williamson <alex@shazbot.org>, 
	Shuah Khan <shuah@kernel.org>, iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org, Pratyush Yadav <pratyush@kernel.org>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, David Matlack <dmatlack@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Pranjal Shrivastava <praan@google.com>, 
	Vipin Sharma <vipinsh@google.com>
Subject: Re: [PATCH v5 02/18] iommu: Implement IOMMU Live update FLB callbacks
Message-ID: <as6YpZ7ShALy5dd_@google.com>
References: <20260921004834.2601285-1-skhawaja@google.com>
 <20260921004834.2601285-3-skhawaja@google.com>
 <asWEtTcNJSbrY579@nvidia.com>
 <asmj6ErFqQMJe0_u@google.com>
 <as16hl29Kepg9AcT@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <as16hl29Kepg9AcT@nvidia.com>

On Mon, Oct 12, 2026 at 05:25:42PM -0700, Nicolin Chen wrote:
>On Sat, Oct 10, 2026 at 03:18:11AM +0000, Samiullah Khawaja wrote:
>> On Tue, Oct 06, 2026 at 04:31:01PM -0700, Nicolin Chen wrote:
>> > On Mon, Sep 21, 2026 at 12:48:18AM +0000, Samiullah Khawaja wrote:
>> > > +struct iommu_flb_obj {
>> > > +	struct mutex lock;
>> > > +	struct iommu_flb_ser *ser;
>> > > +
>> > > +	struct iommu_hw_array_ser *curr_iommu_array;
>> > > +	struct iommu_domain_array_ser *curr_domain_array;
>> > > +	struct iommu_device_array_ser *curr_device_array;
>> > > +};
>> >
>> > IIUIC, there should be one pair of obj + ser in the entire system:
>> >  - old kernel has one outgoing obj + ser
>> >  - new kernel has one incoming obj + ser
>> > right?
>> >
>> > If so, things in iommu_flb_obj (except ser) are all transient, and
>> > there is no need to preserve them across the two kernels.
>>
>> The contents of iommu_flb_obj are not preserved. Only the contents of
>> iommu_flb_ser are preserved. Other "curr_" structs in iommu_flb_obj are
>> only there for quick access to add new iommus, domains and devices.
>> >
>> > It also feels redundant to have this iommu_flb_obj structure. Why
>> > not link liveupdate_flb_op_args directly to the ser? Then, things
>> > in iommu_flb_obj could be global?
>>
>> The liveupdate_flb_op_args is linked directly to the ser, but it only
>> contains the physical address for the next kernel. Basically LUO
>> provides following mechanism to handle FLBs:
>>
>> - data: ser structure for the next kernel.
>> - obj: Live object that can be used in the current or next kernel for
>>   easy access or staging.
>>
>> For example here, iommu_flb_obj has pointers to the end of the array
>> linked list of each type.
>>
>> Also note LUO keeps separate incoming and outgoing data and obj for each
>> FLB. In the new kernel both can exist at the same time, as the incoming
>> one stays until finish and preserving for the next live update creates
>> the outgoing one. So keeping these in the obj avoids managing two sets
>> of globals and their lifetime in the iommu code.
>
>Could incoming and outgoing objects exist in the same time?
>
>Correct me if I am wrong: I expect the lifecycle of an incoming
>object will end once liveupdate completes, and the outgoing one
>can only exist after that?

LUO can have incoming and outgoing at the same time. The incoming FLB
stays until all the sessions from the previous kernel that use it are
finished, and the outgoing FLB is created when the first FD that uses it
is preserved in the current kernel. So if a new preservation starts
before all the incoming sessions are finished, both exist.

Generally, it should be rare, as after the live update the userspace
orchestrator (like systemd) would probably finish all the sessions. At
the FD level it is mutually exclusive, but at the FLB level it is
possible.
>
>Nicolin

Sami
