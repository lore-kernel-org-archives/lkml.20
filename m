Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE4574FC8CF
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 22:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790375263; cv=none; b=a60lkoxKBcK7oN/aZPuD5+8J056LeqSNyxY7Emo0RHd6EK6wkub7Pn6Ng1DsotPJa0ZbcK0faQC22wIUxg1XgYYOZ1nuZivoQj8QmeNdPZ5scUMqiZrLHnWBqQYimdCnYscjfTf0d0TW0ymylqThZlpc6n8xaLfIhL3exF9s0Qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790375263; c=relaxed/simple;
	bh=eqrGq9U7VRoYaZqERBwu6fkmIt7Dpd2MB+CWCce54G0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Uq3qp1vOBMAtEAma58sgPrFue8ZtRK4Rxj46Emvp4y+yER3Zk8VikRQY9z9SoeR4D0w1fDqXPYQ2pvl9aolEWZMwLasoZWTrJwIpAPlFgAdAnrXG3QOET33oR0m3S+imitefQ4vQm7jQhJPtvPLyxpQZDtq3w1tDLReLin1fP2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IB5Vk0Kw; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IB5Vk0Kw"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2d8fd7a3f38so11745ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 15:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790375261; x=1790980061; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eqrGq9U7VRoYaZqERBwu6fkmIt7Dpd2MB+CWCce54G0=;
        b=IB5Vk0KwbbRHOExzuHjuS6kMNpxRhp4VxQHF7VTzFm0WhxZGWi36nVvFV9fz6Uz9mI
         dHZJx79DEkM0jI8s49fDSS5Kjo1OKIip13b6w4NxvCTAhlmXgh+mBnEi52ZR98yudHi+
         ckS8hwGPwSi3ASbtQZWpYp9Wdau4fBE0Ep31z85hakkejYttaxL+UQElkF5bCZSy4yNK
         x3QdapehFXRf4nx9MC0uba3OqN6DussrnzDhoOWa50jUG0f9dCoyeTRtWkvLQkf+4Z6N
         /maNGWDvMSp+uKYa0DwlqqiIyH+2tme3Qz5v5qb5vAiRVg8Fvog0z4ZHKDWMegju7rRG
         kwFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790375261; x=1790980061;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eqrGq9U7VRoYaZqERBwu6fkmIt7Dpd2MB+CWCce54G0=;
        b=J3DKH8zyoXRFT8OB9+/L11Nir0FIot2GeB3BJIGpWWEPat7DRF+cxhwNROAQ6pwEh5
         qIc5bVZ9JSJ1Zlupa46jMMMf6aqQDVWwywI0NHYGpKV5cMqbecgYBQK63okqH3M/b/em
         6BQcxBDTciIahqVap2D33S8uN2dT0gV5Dz8YBqvwRfws80L4Mh+vCoPZDsPBR6POGzRE
         zlGj/jZCnJA3qUtRE2pC0UwdB+nSyN5dyZjde8L1rO7vUYsQJL6tDnslcQsU9XWi7KlD
         SAndimyW8fV4oJ+jFqBIrWdaMnKFZ7D+Ck2YxIzRf+WGCZJN0tzO8TIsOnKrmu5+T7Tr
         tXHw==
X-Forwarded-Encrypted: i=1; AKwUvBznvgkD3zIUDLXgAKK/CgHILwkt+24cvpgqQt/vw4NmdJmhQmDdevqbDv7sTnFd2XO6ET06cj2xo6kPJ1s=@vger.kernel.org
X-Gm-Message-State: AFuF++nRlHsuJTGGwJLBSdQUrZTToPCfwQIb0+NvB38EuHELQdHuSDfm
	t1M4dfc4F+aA/SUcuWBSs8J1ZIoGLF4oNWyreSVDskf9OC1KH3pqntV43gNjTLqoDA==
X-Gm-Gg: AYBFou1S/ApAC4bZIyB4PXOn82CjnBaIXwopMa9sXSXPTVvYW47wMtWkwQc7OGewUB2
	LAFu0J6DkHYwvDuY0rip0k+Hix2SKmvZTKy6JmPSWlseH0Unkuf8nHfr1RaaroUa1oIrUmzl/Qu
	jUdbfzK2AhGWoTDUwIsPu7jABcnDEHB1bU0Yx9ujj2UIbABFi6IKRyBqo+yrxVt8TfZrbmmYlH5
	wCnqMhSpifQFH62ujzMkXqTgB1yvjpdG2TOYOGfXcg8x6g5becco/l+N/DdLj82TXtmz3TNL5xh
	uZy4b3EjYFdM3/lyexhBOjhRtB2fVFI0Hja/MNnLY6iMtL5ekMJkW8juO2mrd9mWTze6Fy5Atqi
	N8rmA+qQG4/4lQETat40keBXX0XZ/aYWtaVKXR0nDkSxLnto8HLydwC/6I8u860TPt4AidcClcj
	qPv7zSER5h1PVA0x+IUnp/p0kpcmor6FYdMzj6GpIaMBeW0WtReYqCIzu6EXyC/SqzC7lEh6UPa
	mS4EklUpJ/aR1tjCF4xheueeCgGNi24y2n3kMaSqVSt68JX7jmXWPIpDWptYPdePpm6mA==
X-Received: by 2002:a17:903:46c6:b0:2c9:d89f:fd98 with SMTP id d9443c01a7336-2dfa968787fmr828795ad.1.1790375260342;
        Fri, 25 Sep 2026 15:27:40 -0700 (PDT)
Received: from google.com (210.87.127.34.bc.googleusercontent.com. [34.127.87.210])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0bda430b3sm5720254a91.0.2026.09.25.15.27.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 15:27:39 -0700 (PDT)
Date: Fri, 25 Sep 2026 22:27:35 +0000
From: Samiullah Khawaja <skhawaja@google.com>
To: David Matlack <dmatlack@google.com>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Robin Murphy <robin.murphy@arm.com>, 
	Kevin Tian <kevin.tian@intel.com>, Alex Williamson <alex@shazbot.org>, iommu@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Lu Baolu <baolu.lu@linux.intel.com>, 
	Pranjal Shrivastava <praan@google.com>
Subject: Re: [RFC PATCH 0/3] iommu/arm-smmu-v3: Add support for hitless
 replace of CD entries
Message-ID: <arb0EZ7mPWUfhy9K@google.com>
References: <20260925011308.3381953-1-skhawaja@google.com>
 <arbrJYsILS1IPpCK@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <arbrJYsILS1IPpCK@google.com>

On Fri, Sep 25, 2026 at 09:44:05PM +0000, David Matlack wrote:
>On 2026-09-25 01:13 AM, Samiullah Khawaja wrote:
>> This patch series adds support for replacing IOMMU domains with S1 page
>> tables hitlessly, that is without disrupting the ongoing DMAs. This is
>> one of the dependencies of the Liveupdate IOMMU support for Arm SMMUv3.
>>
>> S1 domains are programmed by CD entries in the CD table. During a new
>> domain attach these are updated using arm_smmu_write_cd_entry(). Since
>> ASID and TTB0 are in different 64-bit words, arm_smmu_write_cd_entry()
>> considers it a non-hitless update and sets V=0. This means such an
>> update is disruptive and would generate translation faults if there are
>> ongoing DMAs.
>>
>> Replace the CD entries by using an unused temporary ASID in the
>> following sequence to allow hitless replacement of CD entry,
>>
>> - Update the CD entry with temporary ASID.
>> - Update the CD entry with the target TTB0.
>> - Invalidate the temporary ASID.
>> - Update the CD entry with target ASID.
>> - Invalidate and release the temporary ASID.
>>
>> The series adds a vfio selftest that triggers a continuous DMA and does
>> the hwpt replace while the DMA is ongoing. Since domain replacement is a
>> race with the translation requests, the test does it multiple times to
>> capture the small window where IOMMU faults can occur.
>>
>> Without this change we can observe the SMMU faults in the kernel logs
>> and with it the SMMU faults do not occur.
>>
>> This is only tested on qemu with the emulated SMMUv3 and an out of tree
>> NVMe vfio selftest driver, not on real hardware. Following are not
>> covered and can be done later,
>
>Out of curiousity, does the in-tree VFIO selftests driver for IGB not
>work for this testing scenario?

I tried with the IGB driver first, but I couldn't get the DMAs to work.
Its probably my setup, will recheck.

Sami
