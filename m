Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792757462;
	b=KMK3qPyU4J5Bj+8kMirdw9n1CGfeTTugyanAT6CTSvRcExZl1cLOYWHuJlfoULIcqLtE
	 Qma6cTU0gRtpGxReQmchKGT/0FhhK6TKQFO3vtkWR/TBi9bOJz7djfpLFbtakLRlQVzcK
	 xXYklBSoyY8KItlw5XGyH1HnUChTfNNvPidUxK/gbMpdvDhuaI0F9weJshjJ5OhPFoNRI
	 W+1a6jVeLqfl/aM+bS/MhEmYxXl4hdQY5vfhhFmdx8M9Q9/HZM8bqY1gHRtUugNRdRaip
	 ZniSBsNuZydE5jV1rt83m7RyeOpPvhcQyvE9raRFcftXutEEsmxsX2OGfVQa/entfLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792757462;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=+9ABaSJ2TNSe2zyjJ/G3TozbAp2nZSVkr4JqPJVrOhM=;
	b=Kf/5s1DSpT8xtbZyBAZvmMNKwpHwtr9q0zIbFTxIqKlX692Pi3A+UeDFLhC8/V3jHg64
	 OQbF7NvO+suMlyetnODRWXFiVOjZj45HLxUAXqGgWJZNfzkA25I8xep0wHVqXE5WlRDch
	 VvpCUgNzLsvwJx3MMbMLXDB2CZpgiIGNePA4tXNelJxEEQSaWHyAWMl5HFtFFut7c9AY7
	 I7oGi5dVcH6JM5Ay86fhxblj3z5rygMVB+R+ITLgqJ/1ARxdN6j60Tz3po6lN4luzs0iX
	 4ZZM9aaGGJ9JvEgsa3qD4q2sEoUJKZxclFekHlTEiIlXED9AdX6Jl3Z2AX29glIhDlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=gkbyTeQN;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04696606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 12:11:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04696606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=gkbyTeQN
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E425B1692;
	Fri, 23 Oct 2026 05:10:56 -0700 (PDT)
Received: from [10.2.212.23] (e121345-lin.cambridge.arm.com [10.2.212.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0E1713F7B4;
	Fri, 23 Oct 2026 05:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792757460; bh=JWiVKkvqMbPQUX28W4bEe8+RRzv3aXiMK1aPbISQRoo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gkbyTeQN2CCbuK7ji0WSOlNL2NUd3bU79bZU3Du8DyjyL4x3DTnF0oottBvtMuLpS
	 yfp3kipdCxmmP1RXAilIcKX0BcYzkexbMxwckHAwvl9nvh+Jp+G5hXXEs/rGhPedmc
	 vZ1DdIPPqqxCcbiqCL+tLjrfCVGG6boDgtTI/wEA=
Message-ID: <40a2e1a2-138b-42bf-94ea-a42fda128c22@arm.com>
Date: Fri, 23 Oct 2026 13:10:56 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/3] iommu/arm-smmu-v3: Add support for hitless
 replace of CD entries
To: Samiullah Khawaja <skhawaja@google.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>
Cc: Kevin Tian <kevin.tian@intel.com>, Alex Williamson <alex@shazbot.org>,
 iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Pasha Tatashin <pasha.tatashin@soleen.com>,
 David Matlack <dmatlack@google.com>, Lu Baolu <baolu.lu@linux.intel.com>,
 Pranjal Shrivastava <praan@google.com>
References: <20260925011308.3381953-1-skhawaja@google.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20260925011308.3381953-1-skhawaja@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/09/2026 2:13 am, Samiullah Khawaja wrote:
> This patch series adds support for replacing IOMMU domains with S1 page
> tables hitlessly, that is without disrupting the ongoing DMAs. This is
> one of the dependencies of the Liveupdate IOMMU support for Arm SMMUv3.
> 
> S1 domains are programmed by CD entries in the CD table. During a new
> domain attach these are updated using arm_smmu_write_cd_entry(). Since
> ASID and TTB0 are in different 64-bit words, arm_smmu_write_cd_entry()
> considers it a non-hitless update and sets V=0. This means such an
> update is disruptive and would generate translation faults if there are
> ongoing DMAs.
> 
> Replace the CD entries by using an unused temporary ASID in the
> following sequence to allow hitless replacement of CD entry,
> 
> - Update the CD entry with temporary ASID.
> - Update the CD entry with the target TTB0.
> - Invalidate the temporary ASID.
> - Update the CD entry with target ASID.
> - Invalidate and release the temporary ASID.

Why bother transitioning through a 3rd ASID? The old and new pagetables 
must contain the same translations anyway, so why not just: switch ASID, 
switch TTB, invalidate old ASID?

It's perhaps worth noting that for correctness either way this also very 
much depends on no concurrent map/unmap operations being able to happen 
in either hwpt while the switch is ongoing, but then I guess it already 
depends on the caller guaranteeing that the hwpts hold identical 
translations, which we can't realistically verify at the driver level 
either...

Thanks,
Robin.

> The series adds a vfio selftest that triggers a continuous DMA and does
> the hwpt replace while the DMA is ongoing. Since domain replacement is a
> race with the translation requests, the test does it multiple times to
> capture the small window where IOMMU faults can occur.
> 
> Without this change we can observe the SMMU faults in the kernel logs
> and with it the SMMU faults do not occur.
> 
> This is only tested on qemu with the emulated SMMUv3 and an out of tree
> NVMe vfio selftest driver, not on real hardware. Following are not
> covered and can be done later,
> 
> - S2 domains have the same problem, S2VMID is in STE qword 2 and S2TTB is
>    in qword 3. These need the same handling with a temporary VMID.
> - ATS is not tested, the test environment runs with pci=noats.
> 
> Testing:
> 
> Without Fix:
> 
>    TAP version 13
>    1..2
>    # Starting 2 tests from 2 test cases.
>    #  RUN           vfio_iommufd_replace_hwpt_test.domain_replace.memcpy ...
>    [   33.267749] vfio-pci 0000:00:0a.0: enabling device (0000 -> 0002)
>    [   33.270709] vfio-pci 0000:00:0a.0: resetting
>    [   33.385682] vfio-pci 0000:00:0a.0: reset done
>    [   37.128021] arm-smmu-v3 9050000.smmuv3: event 0x0a received:
>    [   37.131885] arm-smmu-v3 9050000.smmuv3:      0x000000500000000a
>    [   37.134585] arm-smmu-v3 9050000.smmuv3:      0x0000000000000000
>    [   37.136961] arm-smmu-v3 9050000.smmuv3:      0x0000000000000000
>    [   37.139631] arm-smmu-v3 9050000.smmuv3:      0x0000000000000000
>    [   37.142188] arm-smmu-v3 9050000.smmuv3: event: C_BAD_CD client: 0000:00:0a.0 sid: 0x50 ssid: 0x0
> 
>    ...
>    ...
> 
> With Fix:
> 
>    TAP version 13
>    1..2
>    # Starting 2 tests from 2 test cases.
>    #  RUN           vfio_iommufd_replace_hwpt_test.domain_replace.memcpy ...
>    [   33.418253] vfio-pci 0000:00:0a.0: enabling device (0000 -> 0002)
>    [   33.421218] vfio-pci 0000:00:0a.0: resetting
>    [   33.539750] vfio-pci 0000:00:0a.0: reset done
>    #            OK  vfio_iommufd_replace_hwpt_test.domain_replace.memcpy
>    ok 1 vfio_iommufd_replace_hwpt_test.domain_replace.memcpy
>    #  RUN           vfio_iommufd_replace_hwpt_test.noreplace.memcpy ...
>    [   88.416453] vfio-pci 0000:00:0a.0: resetting
>    [   88.531989] vfio-pci 0000:00:0a.0: reset done
>    #            OK  vfio_iommufd_replace_hwpt_test.noreplace.memcpy
>    ok 2 vfio_iommufd_replace_hwpt_test.noreplace.memcpy
> 
> Looking forward to your feedback on this.
> 
> Dependencies:
> The patch series includes a patch from the vfio selftest multi iommu
> series as it is required for the hwpt_replace vfio selftest. It is part
> of this series since the original code doesn't apply cleanly on the
> base.
> https://lore.kernel.org/all/20260505221518.619123-1-skhawaja@google.com/
> 
> Related Work:
> Liveupdate IOMMU patch series:
> https://lore.kernel.org/all/20260921004834.2601285-1-skhawaja@google.com/
> Liveupdate IOMMU feature patchset breakdown:
> https://docs.google.com/document/d/1enDn-uPE9U77U-xHEnzn6HHGKiePSAtMIP8EDU3NO0M
> 
> Samiullah Khawaja (3):
>    vfio: selftests: Add support of creating iommus from iommufd
>    vfio: selftests: Add iommufd hwpt replace test
>    iommu/arm-smmu-v3: Add support for hitless replace of S1 domains
> 
>   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   |  66 ++++++-
>   tools/testing/selftests/vfio/Makefile         |   1 +
>   .../vfio/lib/include/libvfio/iommu.h          |   2 +
>   .../lib/include/libvfio/vfio_pci_device.h     |   2 +
>   tools/testing/selftests/vfio/lib/iommu.c      |  60 +++++-
>   .../selftests/vfio/lib/vfio_pci_device.c      |  25 ++-
>   .../vfio/vfio_iommufd_hwpt_replace_test.c     | 171 ++++++++++++++++++
>   7 files changed, 316 insertions(+), 11 deletions(-)
>   create mode 100644 tools/testing/selftests/vfio/vfio_iommufd_hwpt_replace_test.c
> 
> 
> base-commit: 3d7783543c2646af69ad65825e810060494bea21

