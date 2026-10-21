Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792622381;
	b=TDJ+ZkGM1GZaq88GZ5zzwr4mAPxiK7syobANldtitOvZXUDxNMvbpDnSG5ITzOVQ1rvF
	 mzG/JInezoO+eS8VnuVdF6OZOPx4TDzy8zwPxYrWa0ve+rTy0Vxd4mvleOw6LN4haCBCk
	 Hj2IErIhLWOd6MBeX4WRYOm9APfcPRrBkNrKXcRoQ0pHOMygtXXEL5YiGYH8svHyfc3Rw
	 eMo2wej7bGrxcGn3Lw4SuTwWVgxvc1JMAXQBGNxNgP+2ow+V/abUmruXqsEOH2m/H3lSH
	 2gP8ejD5mjyvGGnqdK1BRuZoVFecoydBAfgLfdPL5L0x9Z7gitnab9/ls2sESnqhbFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792622381;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=DXLtP8iji/E6g+v1wNlt1USSNo7BmW/WXCZuZX1tS6I=;
	b=SqI5Zh7bjhrx3YEJc4I4+pVVT1MjqZXpgl3WTNEq4dHxqktv6kFBbPAcLhxxdl/kYLNl
	 nwcBXbepJkKX+p2QXT4YSbYhm8gG+H2xfjMtDuNIBYJETZF2YRvIkARSoXHxj8Et7VE86
	 vQGQTsCoRgd8WrB1cOT+O2AS8fxlpBEbdk3eaZPUm0f7aO5Xv2S+KT4LpNnG/eUmnoSC2
	 Kw4cvipOFgXdUuP524vIu5cohLnudR07pNzijI2wBT/w7cLigU3qOle6LWj2NMR6zeMSZ
	 zuQ7qFLcEZlXLuSvN5p0b0rNL23oqF/CZmvfiTgetxuYHNoodMp0wA5WThq2BwXvp+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=RDVn4b0+;
	arc=none smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5607B606A327
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 22:39:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5607B606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=RDVn4b0+
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2e9eb579c0eso7138485ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 15:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792622381; x=1793227181; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DXLtP8iji/E6g+v1wNlt1USSNo7BmW/WXCZuZX1tS6I=;
        b=RDVn4b0+HjqRY2D7Rsd3l6cMNzh/OeaaO8/JGkVJb2U6RchTHlkU1hmsj840qkrFn1
         G0tK5gAHN8vot320vrohjS/OkrnEjmevHQgoIDAGIp0Q99ExD4tDsLOqYu5x3dQNw2Zt
         WdPpu2X/NTSj+A+htmJ8gZr3MCKbhPJ0+Jmx33HYmLfUTqdJJ8yT9DIxBQ6XKYz/EE1j
         4Lej2RAEkqteOj+CaSqxVZ28JtuBw17cfG6/yPZsLG6+wfEwyLAP3QosXBygNcgcKvNw
         esXJAFKTjnwTCRdC/j7GIVVi2S/ujQ9m2p/GXPPRIlx66B800q4z0i9DgLIHi102zZ/R
         V+cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792622381; x=1793227181;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DXLtP8iji/E6g+v1wNlt1USSNo7BmW/WXCZuZX1tS6I=;
        b=z9RYqoh5CqSlYFYwmsXUfjKEx/FdbeaQgdVTxuZG/wQR/7VnRoXFAm2cBnUp7xfuNv
         RbCvCR1ai564Ifa1kLWxtihqx1vSEm5zpg34jmwdyMHGg5Wdp75WPgpKvhMF2CQdbAIk
         ctigh/YbtJeFBlFvHCMks1rCp6V4fI1kEASAgnMlHeqIsXT0YKSS2jzQjC7OUjFh6GGU
         cPAHEh05C/4QJ3Q8THu8afqhWvZLsVcxWGZky/qUG3rTr0qMv0oPyCuVYjAvVRsYTYev
         sdLrnTAusx/tH5tAKWYd3kl08PnTQaFchISWfWa6FfM8n6pi2QQltA9/JRMbAugksMQb
         ILEA==
X-Forwarded-Encrypted: i=1; AKwUvBynUETEQlZxmSm8YMYBZA9J38O+0YqBM8FY2kdho6/gDQW88ukU8yjDRDS8bDEIOaRuNdy5bnpS0c7LT/M=@vger.kernel.org
X-Gm-Message-State: AFq9FYIig5Y7tK3vdyu54oji1AGWU08eDjIShK1k+pShyj2WAoZrScNe
	rXsTXyANHn0zwJS+Dk9/ILflC3Et0WDSBbrDvy7v0v68YPJjGErfMMfgS4/eaUrD8A==
X-Gm-Gg: AYBFou2UvNjD9nEM38t2WJ3C3hoHK4EB+7HiS8v1F09ImzuemUJUtGiKWPbdWk3QJsw
	HXAT7idikEoHsRV9JefynVIluoWiK3HSKCHdrGBWo//VQt91bj2wh0Agh08EY8kvCkA+6dYM5IC
	/97538BdXoPdFPOA/ppe3jFsmli88uS+7Jati6cbr0jXtRa41GA3mYRJXPoKobJuiXagdNIXDpf
	JFcKuOFtu8UvECERlM2WF0PKE8/w6PIJJEciES6ZcAc4AwU1KbEEEIc2nZidWtQwyWysT7rFZWK
	37Iy+bfF31kFkCsZEZXtusPf3hnogRJns/sbFWsdz2Xcr1QFZMdm3M1gI0r96wtHR/KxrQ8l7T3
	sEaDOuGFFTiNCj9/JlFZsguynpCFM7bwTlq4CkMXZR8b0ocASsV4jqWIcTeBOz9PmCKVjfQP5C1
	7pqAWsmx4BugQk32dEDOku8dEVjQqyFo1ET5btUU+mFsBiD7jD/LT0EaM7lkhaP0DXCT1Yh+0kN
	ifDhRObm4xF4RNN7KtvAb2LcbM+Hw+3e1uz60P+8nCGDZ1mAQiklt5ynP7tLg79pETOGHhFEji0
	Oe0FaJ8EvW1cJj09
X-Received: by 2002:a17:903:144e:b0:2dd:c053:82f6 with SMTP id d9443c01a7336-2ea43fe27cemr24610525ad.45.1792622379947;
        Wed, 21 Oct 2026 15:39:39 -0700 (PDT)
Received: from google.com (64.75.127.34.bc.googleusercontent.com. [34.127.75.64])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea3b4ada65sm15769465ad.73.2026.10.21.15.39.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 15:39:38 -0700 (PDT)
Date: Wed, 21 Oct 2026 22:39:34 +0000
From: David Matlack <dmatlack@google.com>
To: Samiullah Khawaja <skhawaja@google.com>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Jason Gunthorpe <jgg@ziepe.ca>, Robin Murphy <robin.murphy@arm.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Alex Williamson <alex@shazbot.org>, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Pranjal Shrivastava <praan@google.com>
Subject: Re: [RFC PATCH 2/3] vfio: selftests: Add iommufd hwpt replace test
Message-ID: <atk_Jq9gEpU5kB8p@google.com>
References: <20260925011308.3381953-1-skhawaja@google.com>
 <20260925011308.3381953-3-skhawaja@google.com>
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
In-Reply-To: <20260925011308.3381953-3-skhawaja@google.com>

On 2026-09-25 01:13 AM, Samiullah Khawaja wrote:
> Add a test that does iommufd hwpt replace while a DMA is ongoing. This
> verifies the hitless replace of IOMMU domain without disrupting the DMA.
> 
> Note that the new domain is attached after mapping the required DMA
> memory at the same IOVA in the new domain.
> 
> Signed-off-by: Samiullah Khawaja <skhawaja@google.com>

Aside from the MODE_IOMMUFD nit,

Reviewed-by: David Matlack <dmatlack@google.com>

> ---
>  tools/testing/selftests/vfio/Makefile         |   1 +
>  .../vfio/vfio_iommufd_hwpt_replace_test.c     | 171 ++++++++++++++++++
>  2 files changed, 172 insertions(+)
>  create mode 100644 tools/testing/selftests/vfio/vfio_iommufd_hwpt_replace_test.c
> 
> diff --git a/tools/testing/selftests/vfio/Makefile b/tools/testing/selftests/vfio/Makefile
> index 2c32c48db509..01d0e808871b 100644
> --- a/tools/testing/selftests/vfio/Makefile
> +++ b/tools/testing/selftests/vfio/Makefile
> @@ -8,6 +8,7 @@ else
>  CFLAGS = $(KHDR_INCLUDES)
>  TEST_GEN_PROGS += vfio_dma_mapping_test
>  TEST_GEN_PROGS += vfio_dma_mapping_mmio_test
> +TEST_GEN_PROGS += vfio_iommufd_hwpt_replace_test
>  TEST_GEN_PROGS += vfio_iommufd_setup_test
>  TEST_GEN_PROGS += vfio_pci_device_test
>  TEST_GEN_PROGS += vfio_pci_device_init_perf_test
> diff --git a/tools/testing/selftests/vfio/vfio_iommufd_hwpt_replace_test.c b/tools/testing/selftests/vfio/vfio_iommufd_hwpt_replace_test.c
> new file mode 100644
> index 000000000000..3ec243aae626
> --- /dev/null
> +++ b/tools/testing/selftests/vfio/vfio_iommufd_hwpt_replace_test.c
> @@ -0,0 +1,171 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +#include <string.h>
> +#include <sys/ioctl.h>
> +#include <sys/mman.h>
> +
> +#include <linux/sizes.h>
> +#include <linux/vfio.h>
> +
> +#include <libvfio.h>
> +
> +#include "kselftest_harness.h"
> +
> +static const char *device_bdf;
> +
> +static void region_setup(struct iommu *iommu,
> +			 struct iova_allocator *iova_allocator,
> +			 struct dma_region *region, u64 size)
> +{
> +	const int flags = MAP_SHARED | MAP_ANONYMOUS;
> +	const int prot = PROT_READ | PROT_WRITE;
> +	void *vaddr;
> +
> +	vaddr = mmap(NULL, size, prot, flags, -1, 0);
> +	VFIO_ASSERT_NE(vaddr, MAP_FAILED);
> +
> +	region->vaddr = vaddr;
> +	region->iova = iova_allocator_alloc(iova_allocator, size);
> +	region->size = size;
> +
> +	iommu_map(iommu, region);
> +}
> +
> +static void region_teardown(struct iommu *iommu, struct dma_region *region)
> +{
> +	iommu_unmap(iommu, region);
> +	VFIO_ASSERT_EQ(munmap(region->vaddr, region->size), 0);
> +}
> +
> +FIXTURE(vfio_iommufd_replace_hwpt_test) {
> +	struct iommu *iommu;
> +	struct vfio_pci_device *device;
> +	struct iova_allocator *iova_allocator;
> +	struct dma_region memcpy_region;
> +
> +	u64 size;
> +	void *src;
> +	void *dst;
> +	iova_t src_iova;
> +	iova_t dst_iova;
> +};
> +
> +FIXTURE_SETUP(vfio_iommufd_replace_hwpt_test)
> +{
> +	struct vfio_pci_driver *driver;
> +
> +	self->iommu = iommu_init("iommufd");

nit: iommu_init(MODE_IOMMUFD)

This needs to be fixed in iommufd_iommu_init() in the previous patch as
well.

> +	self->device = vfio_pci_device_init(device_bdf, self->iommu);
> +	self->iova_allocator = iova_allocator_init(self->iommu);
> +
> +	driver = &self->device->driver;
> +
> +	region_setup(self->iommu, self->iova_allocator, &self->memcpy_region, SZ_2M);
> +	region_setup(self->iommu, self->iova_allocator, &driver->region, SZ_2M);

The driver->region.size is now populated automatically based on what the
driver needs. So you can just pass in driver->region.size here instead
of hard-coding SZ_2M.

> +
> +	if (driver->ops)
> +		vfio_pci_driver_init(self->device);
> +
> +	self->size = self->memcpy_region.size / 2;
> +	self->src = self->memcpy_region.vaddr;
> +	self->dst = self->src + self->size;
> +
> +	self->src_iova = to_iova(self->device, self->src);
> +	self->dst_iova = to_iova(self->device, self->dst);
> +}
> +
> +FIXTURE_TEARDOWN(vfio_iommufd_replace_hwpt_test)
> +{
> +	struct vfio_pci_driver *driver = &self->device->driver;
> +
> +	if (driver->ops)
> +		vfio_pci_driver_remove(self->device);
> +
> +	region_teardown(self->iommu, &self->memcpy_region);
> +	region_teardown(self->iommu, &driver->region);
> +
> +	iova_allocator_cleanup(self->iova_allocator);
> +	vfio_pci_device_cleanup(self->device);
> +	iommu_cleanup(self->iommu);
> +}
> +
> +FIXTURE_VARIANT(vfio_iommufd_replace_hwpt_test) {
> +	u32 attaches;
> +};
> +
> +FIXTURE_VARIANT_ADD(vfio_iommufd_replace_hwpt_test, domain_replace) {
> +	.attaches = 1000,

Maybe we should replace memcpy_wait() with memcpy_poll() and move the
wait loop out into the generic driver layer (vfio_pci_driver.c)
repeatedly calling memcpy_poll(). The would let you do replaces until
the memcpy is done instead of hard-coding a random number, and also lift
more code out of the the drivers and into the generic core.

It should be easy enough to swap the drivers from wait() to poll() model
if you are feeling up for it. Not a blocker for this series though.

> +};
> +
> +FIXTURE_VARIANT_ADD(vfio_iommufd_replace_hwpt_test, noreplace) {
> +	.attaches = 0,
> +};
> +
> +TEST_F_TIMEOUT(vfio_iommufd_replace_hwpt_test, memcpy, 120)
> +{
> +	struct dma_region memcpy_region = {}, driver_region = {};
> +	struct vfio_pci_driver *driver = &self->device->driver;
> +	struct iommu *iommu2 = NULL;
> +	u64 size = 0;
> +	int ret;
> +	u32 i;
> +
> +	if (variant->attaches) {
> +		iommu2 = iommufd_iommu_init(self->iommu->iommufd,
> +					    self->device->dev_id);
> +
> +		memcpy_region = self->memcpy_region;
> +		driver_region = self->device->driver.region;
> +
> +		iommu_map(iommu2, &memcpy_region);
> +		iommu_map(iommu2, &driver_region);
> +	}
> +
> +	if (driver->ops) {
> +		memset(self->src, 'x', self->size);
> +		memset(self->dst, 'y', self->size);
> +
> +		size = min_t(u64, driver->max_memcpy_size, self->size);
> +
> +		/*
> +		 * Fill the device's queue. memcpy_start() returns with
> +		 * max_memcpy_count transfers still outstanding.
> +		 */
> +		vfio_pci_driver_memcpy_start(self->device,
> +					     self->src_iova,
> +					     self->dst_iova,
> +					     size, driver->max_memcpy_count);
> +	}
> +
> +	/*
> +	 * Replace the domain repeatedly while that transfer is in flight. Since
> +	 * domain replacement is a race with the translation requests, it needs
> +	 * to be done multiple times to capture the small window where iommu
> +	 * faults can occur.
> +	 *
> +	 * The loop ends on the original domain, so the teardown below is safe.
> +	 */
> +	for (i = 0; i < variant->attaches; i++) {
> +		vfio_pci_device_attach_iommu(self->device, iommu2);
> +		vfio_pci_device_attach_iommu(self->device, self->iommu);
> +	}
> +
> +	if (driver->ops) {
> +		ret = vfio_pci_driver_memcpy_wait(self->device);
> +
> +		ASSERT_EQ(0, ret);
> +		ASSERT_EQ(0, memcmp(self->src, self->dst, size));
> +	}
> +
> +	if (iommu2) {
> +		iommu_unmap(iommu2, &memcpy_region);
> +		iommu_unmap(iommu2, &driver_region);
> +		iommu_cleanup(iommu2);
> +	}
> +}
> +
> +int main(int argc, char *argv[])
> +{
> +	device_bdf = vfio_selftests_get_bdf(&argc, argv);
> +
> +	return test_harness_run(argc, argv);
> +}
> -- 
> 2.56.0.rc1.315.gc6ed9934b7-goog
> 
