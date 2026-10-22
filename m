Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.89
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792680059;
	b=HiLN8ceWYURmp0RAYBGbTKSWPUwtMr8U6nqSmZCvjv/IoSV3639aUqUYQ3xq1ctsbogP
	 ESxHpsWg9PcoEPagK+6HMfz6XfKQKLNIxIO0xBusFYUqQS0H7ry0WVzZqypKfGEoOcifn
	 T/3rY+PM3Z2CB0YQbfzst0g1PZCOqUssWYRHRUlHx0ne0ODfV/Sbw6nYE7xr5OVnTwr+F
	 BzmmX8BasfHw02FVenwkLE5D+AW0fXaHxs31ilNhAFODLj/TKESonyQ6KtIl3N2KOF5WS
	 ri4n5i5ewe7WQ4jKoJEYUTMqVGiPMG5krPyf82WvGjKT1FatcmzkbOcAzbrOTsnkvXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792680059;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=f3brnrr9GTVM/u1/q9tBPE+4oO6hwpwhbCfP57HoEM4=;
	b=HpR7A7yVs76hFXIpaHnYh0El1BlAK9DDyBAA7Ud//PvFlcLRIyh3dX/J/AnvIIR1VVf4
	 nJA+kzLUG7SN4qPi388VIQtPDnzIHpc/IQU/ORqnSuumC/PR7C/z0poBnH4c/o+Yv4jV6
	 A3++nz9kJFmNaOAeoYqln0MBY5v9AhKEqtLQsDlSLtS5Sbczr6rN/KPxW7oToJnEcA2xc
	 BpeJ70R9Qfyi2i8hGIrwmVVOVyeHBsiQWu4jre1isw7Dc1WB2a0dWLqzXYSDJ7XXOXmMe
	 7G3dhjSgzCEFzmXsR06kcn98XFnnwyHw4C02bry1UpfnoDg8cmggUL+W4+ucAfEQhxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=RSQJfjke;
	arc=none smtp.remote-ip=95.215.58.89
Received: from mta1.migadu.com (out-89.mta1.migadu.com [95.215.58.89])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28D70606A31B
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 14:40:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28D70606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=RSQJfjke
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Q8GxvwGChN6/R7iREbia4Y5Fe+czvz/W6UuO4Z5BeAg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792680051; v=1; x=1793284851;
 b=RSQJfjkeTeMv7d3HI9fYpewS/LEJnmAp+2VJu8Z/R+YVjzDjK3Rdiunj6L57DokGUwa26lhm
 z88Elv9JuEMAnpnsatW6mJNBmQ+/ElBOllDLlVh41xTV0Wk0mqDf4bRJo601405k2RRBLrGrM7w
 iItyavz0u0AnoTJFw1T6eZNg=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id eec811b34d849da2;
	Thu, 22 Oct 2026 14:40:51 +0000
X-Mizu-Trace-ID: eec811b34d849da2
X-Migadu-Flow: FLOW_OUT
Date: Thu, 22 Oct 2026 16:40:41 +0200
From: Andrew Jones <andrew.jones@linux.dev>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>, 
	Andrew Jones <andrew.jones@oss.qualcomm.com>, linux-riscv@lists.infradead.org, iommu@lists.linux.dev, 
	linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev, tjeznach@rivosinc.com, jgg@ziepe.ca, 
	joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, pjw@kernel.org, 
	palmer@dabbelt.com, anup@brainfault.org, tglx@kernel.org, kevin.tian@intel.com, 
	fangyu.yu@linux.alibaba.com
Subject: Re: [PATCH v6 09/16] iommu/riscv: Reserve an MSI IOVA window for
 iommufd
Message-ID: <atoeGhJkcgy2G1tO@orel>
References: <20260925151659.419512-1-andrew.jones@oss.qualcomm.com>
 <20260925151659.419512-10-andrew.jones@oss.qualcomm.com>
 <179209292716.4133959.2758345963634439485.b4-review@b4>
 <atEuxafCLCdZrdR7@nvidia.com>
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
In-Reply-To: <atEuxafCLCdZrdR7@nvidia.com>

On Thu, Oct 15, 2026 at 12:51:33PM -0700, Nicolin Chen wrote:
> On Thu, Oct 15, 2026 at 04:35:27PM -0300, Jason Gunthorpe wrote:
> > > Reserve one page per possible CPU, sufficient for each supervisor IMSIC
> > > page. Use a 16 MiB base instead of the 128 MiB convention used by ARM
> > > SMMU. kvmtool places its guest IMSIC at 128 MiB, so with IRQ bypass the
> > > domain-wide guest MSI address match can also capture host-delivered
> > > MSI writes to the SW MSI window and misdeliver them to the guest.
> > > 
> > > 16 MiB falls in a hole in the current kvmtool and QEMU virt memory maps,
> > > away from their guest IMSIC windows and RAM. Keep the window below
> > > 4 GiB so devices with 32-bit MSI address registers can use it.
> > 
> > And this is a good reason you should not follow ARM down this mad
> > road. Nicolin had some patches to allow userspace to select the SW_MSI
> > range instead of using a kernel hard coded value, which becomes a
> > sneaky ABI. It would be much better if riscv starts off on the right
> > foot instead of continuing this mistake.
> 
> It was paused due to lack of an immediate interest:
> https://lore.kernel.org/linux-iommu/cover.1760487869.git.nicolinc@nvidia.com/
> 
> If riscv wants it, maybe we can give a push.
>

I'll look into Nicolin's patches in a follow-on series and defer enabling
VFIO_IOMMU_TYPE1 for now. I'll see if I can avoid introducing
IOMMU_RESV_SW_MSI at all, which would rule out using the legacy Type1
backend as it stands. Instead, I'll try to support existing Type1
userspace through iommufd's compatibility interface, which will need to
manage MSI IOVA allocation without SW_MSI, since existing Type1 userspace
won't issue Nicolin's ioctls.

I'm posting a much simplified DMA-IOMMU-only v7 now.

Thanks,
drew
