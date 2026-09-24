Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 090353E558C
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 22:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790290424; cv=none; b=lZuo8OJ6RXuucl9GcZ7fSK7QfX5h+cvtnVnGyi+LPM0XkbEekokTTUsSBFSjiCkjGcy6MAvkV9YVaH4dKLaAUuUhmkOPyyxy/QrRDiQkq9BeoX1YxZhP6ctq0xGLqmUaVer4fBszh3B+Edk+x8zh0wdVUjth+IofZPipZqXbBUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790290424; c=relaxed/simple;
	bh=iZ+xWnTaiwYqY244ouiVEpHW7Wth/ThJfp2DnzItInI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VwNd4vDy4HTmFkPi+j9Ogxz3p2uTbXI3Nh2oCWcAA6Uoz0O1Cz/JZQZ4gXa1qFUDGI4Lt0va7Eb98/veVISTMMRsN0rLhaNb7KushNqsIZdHzFdZwQpiooNvPH/s7ZjvWNlgtrsBIrPdECMvcc3dLZ46L4fb4RPWaUdXt/Bug6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=jdSaFljT; arc=none smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="jdSaFljT"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-33e6b4e33e4so279764eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 15:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1790290422; x=1790895222; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HkHFg2PAsl7Q9sZ/6W2u68QBDReBA8b5w0p9gEJFVho=;
        b=jdSaFljTli1plzX/hr/fLlSUKOf0gQVV4iDlrLVhr+fznUA1rH6AeMNPoT/KvwIUvh
         kt2nd6sJoI4onq3Q0ozuZT70qy7PfwUGhdAOnhU0RGSrpskMhS02mF/0pYlTJWR0M9sz
         L+76mrK7EFxqN8ORwd9aKLXxDxkG+BiPsO6xntKrcRhufxs7JSGnMjBYfErqOqk9KsiD
         vPoUxSoY+zFAYZg0hyowmfSyFLr6jEr3iSEJVFroh8+msaYppDTa1Ut8dGDRz5pbnYfA
         P5viOz8cjIxxKCLuAIP6+xU7kGrxx6dc9mr9UWVScqjrLLZNrcfuSZkkTF210Bs3ph+z
         4OYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790290422; x=1790895222;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HkHFg2PAsl7Q9sZ/6W2u68QBDReBA8b5w0p9gEJFVho=;
        b=ZVpBfZZWkOSi5aEQYFQWSSgCHQO6mDnZHkv0EMWgUl6qpgHqTvyh/iZnK3AS9UVVrd
         5Uj+wMZBQPqG5JlC5i2rqmLVYktK2gXu/sO2FpTad1DePO4S56D5LzZ7SHXudI7velsJ
         7Wip8E4bhDZDDsN79OfwcYVsEonabC5IVPKTfAMqVtI2gf2zPxX9IeYkaF3JWP53MTHW
         8h4gzRncyQjeUNocFEJyreNMVeEyDUwS8vjBxBs/AUQlsKi7hwBrUjF7xifKjKGf8alz
         FOCO5Sm9GTxeroW5Y/T07vp5m11WoniVpJzhG7UzZrHlCZPno1lkEGHfU1jSM6FWMHFs
         pudQ==
X-Forwarded-Encrypted: i=1; AKwUvByDByHbgVediE8o8cUbuuZVsmJzWvkHorunxniVbpfQ9NPMvl8/os2UF5x6BUozyktFGsfaIVV9UnSRy48=@vger.kernel.org
X-Gm-Message-State: AFuF++kbuOJYaRtGw7tdxJHixd5iQpqIPTbkWoig7Px5M40KSCd3Vzom
	IeMYSv2s4yJd6G9VaTDiBX7e532kgoCLi7l8AwzTyrd+qlT/m+Vqs2TN4pGecagrP2Y=
X-Gm-Gg: AYBFou2Y/fmo3oQlTnkofHCgJb1bs32O4+qJyppAkEk+muTOo+wCLV9EH4vXttkgYxI
	sKnu/EBAyDbv9WSq1cCNq98teuE7oXnvb4CZ5M7gKP2I0Me4q0EmzIYYUAq37grG+jOU33DUEHe
	UkX91vYSyDhQpIBwM1XE/kUyfaWAuaNcTJQBInEEB+TRHZ1eAW1pNb0dUyu+VJ/shYoyRSNOcTp
	kw+qqPRcYYeVR9ht6zdF+G6eMXEUZnpvtW7FeNWyrK9FL1hzQLohxIGbmlOyxc/lM/6dzJCUdwd
	9woH76PJ5QQecOlAyNpoZeC5l/1c3GTpwjKDXBGSZ/wqlcf/hKpt0WVnbE07ckWK1Aw5DHkCh5L
	o3voPaL0zj/NgJyXxRchYuIIGIXtFAcr6kJjYEqfD9THbGcoL+PKfESwMig2+PixvDe8akH/n2T
	eO21jKJstYA1xHXgEpjalWe84rqpTd/aq5FOvzKb44J5qnQg==
X-Received: by 2002:a05:693c:829b:10b0:33b:d89e:9fb2 with SMTP id 5a478bee46e88-34000f36181mr3727679eec.4.1790290422026;
        Thu, 24 Sep 2026 15:53:42 -0700 (PDT)
Received: from ziepe.ca ([130.41.10.202])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34141d2fe4bsm1631877eec.4.2026.09.24.15.53.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 15:53:41 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1x9sJw-00000000efs-2Wk8;
	Thu, 24 Sep 2026 19:53:40 -0300
Date: Thu, 24 Sep 2026 19:53:40 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Daniel Mentz <danielmentz@google.com>
Cc: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	Prakash Gupta <prakash.gupta@oss.qualcomm.com>
Subject: Re: [PATCH v5] iommu/io-pgtable-arm: Add support for contiguous hint
 bit
Message-ID: <20260924225340.GC16465@ziepe.ca>
References: <20260921-iommu_contig_hint-v5-1-e7fbd1c3774d@oss.qualcomm.com>
 <20260924001502.GO1540250@ziepe.ca>
 <CAE2F3rCVh0CmW6+a__PcCrBgsMJVompKJX_qYBdQ=exj3bYtCg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAE2F3rCVh0CmW6+a__PcCrBgsMJVompKJX_qYBdQ=exj3bYtCg@mail.gmail.com>

On Thu, Sep 24, 2026 at 11:49:50AM -0700, Daniel Mentz wrote:
> On Wed, Sep 23, 2026 at 5:15 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> >
> > On Mon, Sep 21, 2026 at 04:44:07PM +0530, Vijayanand Jitta wrote:
> > > From: Prakash Gupta <prakash.gupta@oss.qualcomm.com>
> > >
> > > Add support for the contiguous hint (CONT) bit in ARM LPAE page tables.
> > > When a set of consecutive PTEs map a naturally aligned contiguous block of
> > > memory, set CONT on every descriptor in that group so the hardware can
> > > combine translations and improve TLB reach.
> > >
> > > Advertise the supported CONT group sizes in pgsize_bitmap. Callers select
> > > those sizes through the normal page-size selection path; io-pgtable-arm
> > > then installs the corresponding tagged descriptors directly. A partial
> > > unmap of a tagged CONT group is rejected before modifying any descriptor,
> > > so a rejected request cannot leave the group partly unmapped.
> > >
> > > The IO_PGTABLE_QUIRK_ARM_NO_CONT_HINT quirk allows SMMU drivers to disable
> > > CONT support for hardware with implementation-specific errata.
> >
> > smmuv3 has this errata, it must be disabled there too. I didn't notice
> > it in this patch?
> 
> SMMU is an architecture specification. I am not aware of errors in
> this architecture specification that would preclude the usage of the
> contiguous bit. I understand that Arm MMU-700 has the following
> erratum
> 
> 3777127 Under invalidation in TBU possible when using contiguous page
> table entries

And a neoverse one too.

> The recommended workaround is described as
> 
> "Ensure that contiguous page tables are removed using a single range
> invalidation. Arm recommends using range invalidations to remove
> contiguous entries anyway for performance reasons."
> 
> and I believe we are already doing this.

No we aren't. Go read my fix on this:

https://lore.kernel.org/linux-iommu/1-v7-e84261bbe7cd+2ea80b-smmu_tlbi_jgg@nvidia.com/

I have another patch that fixes it for iommu domain mappings too.

Jason
