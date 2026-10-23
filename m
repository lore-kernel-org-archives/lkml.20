Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792797042;
	b=Jv75KZvV9N4a6wr5DlQYgcEryPFPZm6e6id5AiGtKxqdtAu6fJ1X5hQezYhgGeSP4R5x
	 YQgxgNQdSbNLILyToivBbUV9FASOcfFvnr50cGSfiKmvCGSJIZlfDrvS2zrTrOtEtkP1L
	 C//QQOeNnR4SO9NHZdOHX9iDS+j1WTxY1MquB2S1wRtM3gMckIlnIezEag8YZmoQI0gOK
	 8bMjOr18Ucupx18LN5qbgLZQV1OuXCt9bgOjiBhRZpU8pxdpnZLPpHygzq5svmFE7M+Sq
	 U/gujjlIpr7WkA1s/hZ+e36nB0nRZlsRL32tLzcRvtfYUIdj2liMeqFT50nYgjwUJkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792797042;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Y/7UYsTuFvcPMA42JSSO+NZ9EnoRizOOg7pUXOjzzPY=;
	b=RP8BRRXsMS0FRg1EvkD7JbdNX0FjCVVzKOufefV2DQIFfwq/MrGdikTefhQ7MukvfjsR
	 Hz5vyMRhq5fhgtq5prEvIYF40dBxY5mn/jHGLTbI86HHtLbqVuAUWGGhRCdjH7sv6r6Fv
	 MzLgOksmkY+OF/u/6DPr5fwk4mDEEeuna1I68eX/lxN/cp3S2rCGxdgBqUV+maM6+iO7+
	 rttw6WqAu7Xiqx3axtVgrLchgLlGkTLYWe4cci5cAOC9bpiRQfI6wcdUcU9tkMkJOKZJL
	 896VOqX6wJZwpxaKwyFpwK7qg7LmMe1k7RIJtwg8QvsXaqXksAjbuM8m70rVjiYeJxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=mX0anVXx;
	arc=none smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F17D606A31B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 23:10:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F17D606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=mX0anVXx
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2db33db4de9so21135ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 16:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792797041; x=1793401841; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Y/7UYsTuFvcPMA42JSSO+NZ9EnoRizOOg7pUXOjzzPY=;
        b=mX0anVXxJQMybNXmxHitqQFmDy25ACgSuFrFaI6Rqi2Y/EUBilPQTJrkm03CVonWKX
         sJUzBTJ3KJDQJfiILnKZ4V65MqIgPLAO9OYYtVwh8vFAK/TS4gFAllqFMwGZZOil/wk8
         +yRZ5J7ws9oYtKuZWgYqSP/fxSmcDJYi+VNqo3tdIyu0OqcZIKdKuldVXmG7Lb6yqjxr
         H8txkZ8JwSOD6sPEdeeQfgqNDLkjY22TmfgMk97iT9sa6/bR+RStB/ioHn5L9O08yTIc
         UxyhE7n2bL6paQ/LzuO1IWoJNjVLMKUzRmZxCKoGRRJALGVeYSp4X9mpt+svrgSUGsUZ
         eGPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792797041; x=1793401841;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y/7UYsTuFvcPMA42JSSO+NZ9EnoRizOOg7pUXOjzzPY=;
        b=hspPNRq4S3g+dhNwSTtcHkWaup3tDANJDNo32Awlx57oWqcrLN6VVy6itcVHHE7gzJ
         VzYy6cPimnvIdN2ioL5W++DA56J2N1vFEAOw/V/dyDtBygoldhyxkDpXJXY4DsJpRrTV
         q4zOrWw2i3Hkxs/GBzV2GGjbd6t60TPtZyYw8oYK2eVwjnVOWfT438MN5MFmTaS2yG08
         qRBSLYVagZDFh96yRZmeZ64WGI73VD7jegGje8iTqYeN5UG3HXunZ2sZHayBYRvlekh1
         8jpKXinh8IVptO0HBXirvXTbVa4uGbQtAVAALWB5Pl6AmQjSfdCbgAlTTP6s6LHPfpvu
         4WtA==
X-Forwarded-Encrypted: i=1; AKwUvBxQ7+ndje1zppxfUU7e5Ieejn9cm0FYkYscN/BJy7gfUNq1yMCO9hj6uJd8m8fX4wGGCWcuXdqWvcNwPRA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIxjhScpp4JQWd09T6mv63+F51zuIcxkK3enCGAmVYYuOlPoRh5
	OmlldzIeKzH76jSninu2AkYTVpmQwLh6F2PW60VT/sH5MnnzZoLn/p0abQH0EKQf4w==
X-Gm-Gg: AYBFou0DmpEc2GULZeC7+WgVGkzO1QP8+EiNfe2uCohAAuPT+kTKsnE8JHFvvH5YBLd
	7cczXb4QTzZuX70eQeiMq3FTDCw+MwlMUo0aLLuV/F71OVY/YIf/MLWyectopATXsp8Fmg1rrNZ
	NlQ5Bs+EzGgJhqwBhAF6VcT2bV11ZH09YJZfnqbB9N8U4J/kKDRS5Z/WTOKCUg5KPh+nSYXfgfS
	lv9olpUJtRcpmVezZYkoeKO1YK6N5pxf7voHG5D/3cGgGyUA0x35ESKGlDj1qbMprUc26Mr0Lrv
	7lXs2HaY+R/vKTGLi4n1sGAnKoMWMygNIIMRP/YGFme4PT9aUZW6LcCvBuA7ZySkYESjCaGPJWR
	IkrhsMxwFXlK9WcSE+wJyKzsP09hbhWbWzxJgopEQKnFYR5b9o89eZr0JOwVIjH1UIHJ2J+JW5t
	OTuNx0TiWhuR8tEIuyczhR+VHlgUEnnwOAFvdCEEt0zRIsPtBmVuh0pAdaOWKv+lVjecQAD/XUX
	W8lQJv6nbnX8zcKv1ABPLKMatqQCvoPIjCQgBp68ffsloRSKCHgHt7geZQM2g4ohqN0o5uiHCMi
	X97hvl1vQttZogoQSrNyrkxLFrmm9yf2aLMhRB9mFkK3D5Al
X-Received: by 2002:a17:903:19ce:b0:2e6:1735:f645 with SMTP id d9443c01a7336-2ea9d1089fdmr862725ad.4.1792797040825;
        Fri, 23 Oct 2026 16:10:40 -0700 (PDT)
Received: from google.com (163.1.145.34.bc.googleusercontent.com. [34.145.1.163])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebe6946dsm622657a91.4.2026.10.23.16.10.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 16:10:39 -0700 (PDT)
Date: Fri, 23 Oct 2026 23:10:36 +0000
From: Samiullah Khawaja <skhawaja@google.com>
To: David Matlack <dmatlack@google.com>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Robin Murphy <robin.murphy@arm.com>, 
	Kevin Tian <kevin.tian@intel.com>, Alex Williamson <alex@shazbot.org>, iommu@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Lu Baolu <baolu.lu@linux.intel.com>, 
	Pranjal Shrivastava <praan@google.com>
Subject: Re: [RFC PATCH 2/3] vfio: selftests: Add iommufd hwpt replace test
Message-ID: <atvop22fFX7tkt9G@google.com>
References: <20260925011308.3381953-1-skhawaja@google.com>
 <20260925011308.3381953-3-skhawaja@google.com>
 <atk_Jq9gEpU5kB8p@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <atk_Jq9gEpU5kB8p@google.com>

On Wed, Oct 21, 2026 at 10:39:34PM +0000, David Matlack wrote:
>On 2026-09-25 01:13 AM, Samiullah Khawaja wrote:
>> Add a test that does iommufd hwpt replace while a DMA is ongoing. This
>> verifies the hitless replace of IOMMU domain without disrupting the DMA.
>>
>> Note that the new domain is attached after mapping the required DMA
>> memory at the same IOVA in the new domain.
>>
>> Signed-off-by: Samiullah Khawaja <skhawaja@google.com>
>
>Aside from the MODE_IOMMUFD nit,
>
>Reviewed-by: David Matlack <dmatlack@google.com>
>
>> ---
>>  tools/testing/selftests/vfio/Makefile         |   1 +
>>  .../vfio/vfio_iommufd_hwpt_replace_test.c     | 171 ++++++++++++++++++
>>  2 files changed, 172 insertions(+)
>>  create mode 100644 tools/testing/selftests/vfio/vfio_iommufd_hwpt_replace_test.c
>>
>> diff --git a/tools/testing/selftests/vfio/Makefile b/tools/testing/selftests/vfio/Makefile
>> index 2c32c48db509..01d0e808871b 100644
>> --- a/tools/testing/selftests/vfio/Makefile
>> +++ b/tools/testing/selftests/vfio/Makefile
>> @@ -8,6 +8,7 @@ else
>>  CFLAGS = $(KHDR_INCLUDES)
>>  TEST_GEN_PROGS += vfio_dma_mapping_test
>>  TEST_GEN_PROGS += vfio_dma_mapping_mmio_test
>> +TEST_GEN_PROGS += vfio_iommufd_hwpt_replace_test
>>  TEST_GEN_PROGS += vfio_iommufd_setup_test
>>  TEST_GEN_PROGS += vfio_pci_device_test
>>  TEST_GEN_PROGS += vfio_pci_device_init_perf_test
>> diff --git a/tools/testing/selftests/vfio/vfio_iommufd_hwpt_replace_test.c b/tools/testing/selftests/vfio/vfio_iommufd_hwpt_replace_test.c
>> new file mode 100644
>> index 000000000000..3ec243aae626
>> --- /dev/null
>> +++ b/tools/testing/selftests/vfio/vfio_iommufd_hwpt_replace_test.c
>> @@ -0,0 +1,171 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +#include <string.h>
>> +#include <sys/ioctl.h>
>> +#include <sys/mman.h>
>> +
>> +#include <linux/sizes.h>
>> +#include <linux/vfio.h>
>> +
>> +#include <libvfio.h>
>> +
>> +#include "kselftest_harness.h"
>> +
>> +static const char *device_bdf;
>> +
>> +static void region_setup(struct iommu *iommu,
>> +			 struct iova_allocator *iova_allocator,
>> +			 struct dma_region *region, u64 size)
>> +{
>> +	const int flags = MAP_SHARED | MAP_ANONYMOUS;
>> +	const int prot = PROT_READ | PROT_WRITE;
>> +	void *vaddr;
>> +
>> +	vaddr = mmap(NULL, size, prot, flags, -1, 0);
>> +	VFIO_ASSERT_NE(vaddr, MAP_FAILED);
>> +
>> +	region->vaddr = vaddr;
>> +	region->iova = iova_allocator_alloc(iova_allocator, size);
>> +	region->size = size;
>> +
>> +	iommu_map(iommu, region);
>> +}
>> +
>> +static void region_teardown(struct iommu *iommu, struct dma_region *region)
>> +{
>> +	iommu_unmap(iommu, region);
>> +	VFIO_ASSERT_EQ(munmap(region->vaddr, region->size), 0);
>> +}
>> +
>> +FIXTURE(vfio_iommufd_replace_hwpt_test) {
>> +	struct iommu *iommu;
>> +	struct vfio_pci_device *device;
>> +	struct iova_allocator *iova_allocator;
>> +	struct dma_region memcpy_region;
>> +
>> +	u64 size;
>> +	void *src;
>> +	void *dst;
>> +	iova_t src_iova;
>> +	iova_t dst_iova;
>> +};
>> +
>> +FIXTURE_SETUP(vfio_iommufd_replace_hwpt_test)
>> +{
>> +	struct vfio_pci_driver *driver;
>> +
>> +	self->iommu = iommu_init("iommufd");
>
>nit: iommu_init(MODE_IOMMUFD)
>
>This needs to be fixed in iommufd_iommu_init() in the previous patch as
>well.
>
>> +	self->device = vfio_pci_device_init(device_bdf, self->iommu);
>> +	self->iova_allocator = iova_allocator_init(self->iommu);
>> +
>> +	driver = &self->device->driver;
>> +
>> +	region_setup(self->iommu, self->iova_allocator, &self->memcpy_region, SZ_2M);
>> +	region_setup(self->iommu, self->iova_allocator, &driver->region, SZ_2M);
>
>The driver->region.size is now populated automatically based on what the
>driver needs. So you can just pass in driver->region.size here instead
>of hard-coding SZ_2M.
>
>> +
>> +	if (driver->ops)
>> +		vfio_pci_driver_init(self->device);
>> +
>> +	self->size = self->memcpy_region.size / 2;
>> +	self->src = self->memcpy_region.vaddr;
>> +	self->dst = self->src + self->size;
>> +
>> +	self->src_iova = to_iova(self->device, self->src);
>> +	self->dst_iova = to_iova(self->device, self->dst);
>> +}
>> +
>> +FIXTURE_TEARDOWN(vfio_iommufd_replace_hwpt_test)
>> +{
>> +	struct vfio_pci_driver *driver = &self->device->driver;
>> +
>> +	if (driver->ops)
>> +		vfio_pci_driver_remove(self->device);
>> +
>> +	region_teardown(self->iommu, &self->memcpy_region);
>> +	region_teardown(self->iommu, &driver->region);
>> +
>> +	iova_allocator_cleanup(self->iova_allocator);
>> +	vfio_pci_device_cleanup(self->device);
>> +	iommu_cleanup(self->iommu);
>> +}
>> +
>> +FIXTURE_VARIANT(vfio_iommufd_replace_hwpt_test) {
>> +	u32 attaches;
>> +};
>> +
>> +FIXTURE_VARIANT_ADD(vfio_iommufd_replace_hwpt_test, domain_replace) {
>> +	.attaches = 1000,
>
>Maybe we should replace memcpy_wait() with memcpy_poll() and move the
>wait loop out into the generic driver layer (vfio_pci_driver.c)
>repeatedly calling memcpy_poll(). The would let you do replaces until
>the memcpy is done instead of hard-coding a random number, and also lift
>more code out of the the drivers and into the generic core.

The purpose of this being here was to a N number of attaches/replaces as
it might have chance to produce faults, as this is basically race. While
I agree poll() is a useful op to have, but in the context of this test
maybe it is an overkill.

Thanks,
Sami
>
>It should be easy enough to swap the drivers from wait() to poll() model
>if you are feeling up for it. Not a blocker for this series though.
>
>> +};
>> +
>> +FIXTURE_VARIANT_ADD(vfio_iommufd_replace_hwpt_test, noreplace) {
>> +	.attaches = 0,
>> +};
>> +
>> +TEST_F_TIMEOUT(vfio_iommufd_replace_hwpt_test, memcpy, 120)
>> +{
>> +	struct dma_region memcpy_region = {}, driver_region = {};
>> +	struct vfio_pci_driver *driver = &self->device->driver;
>> +	struct iommu *iommu2 = NULL;
>> +	u64 size = 0;
>> +	int ret;
>> +	u32 i;
>> +
>> +	if (variant->attaches) {
>> +		iommu2 = iommufd_iommu_init(self->iommu->iommufd,
>> +					    self->device->dev_id);
>> +
>> +		memcpy_region = self->memcpy_region;
>> +		driver_region = self->device->driver.region;
>> +
>> +		iommu_map(iommu2, &memcpy_region);
>> +		iommu_map(iommu2, &driver_region);
>> +	}
>> +
>> +	if (driver->ops) {
>> +		memset(self->src, 'x', self->size);
>> +		memset(self->dst, 'y', self->size);
>> +
>> +		size = min_t(u64, driver->max_memcpy_size, self->size);
>> +
>> +		/*
>> +		 * Fill the device's queue. memcpy_start() returns with
>> +		 * max_memcpy_count transfers still outstanding.
>> +		 */
>> +		vfio_pci_driver_memcpy_start(self->device,
>> +					     self->src_iova,
>> +					     self->dst_iova,
>> +					     size, driver->max_memcpy_count);
>> +	}
>> +
>> +	/*
>> +	 * Replace the domain repeatedly while that transfer is in flight. Since
>> +	 * domain replacement is a race with the translation requests, it needs
>> +	 * to be done multiple times to capture the small window where iommu
>> +	 * faults can occur.
>> +	 *
>> +	 * The loop ends on the original domain, so the teardown below is safe.
>> +	 */
>> +	for (i = 0; i < variant->attaches; i++) {
>> +		vfio_pci_device_attach_iommu(self->device, iommu2);
>> +		vfio_pci_device_attach_iommu(self->device, self->iommu);
>> +	}
>> +
>> +	if (driver->ops) {
>> +		ret = vfio_pci_driver_memcpy_wait(self->device);
>> +
>> +		ASSERT_EQ(0, ret);
>> +		ASSERT_EQ(0, memcmp(self->src, self->dst, size));
>> +	}
>> +
>> +	if (iommu2) {
>> +		iommu_unmap(iommu2, &memcpy_region);
>> +		iommu_unmap(iommu2, &driver_region);
>> +		iommu_cleanup(iommu2);
>> +	}
>> +}
>> +
>> +int main(int argc, char *argv[])
>> +{
>> +	device_bdf = vfio_selftests_get_bdf(&argc, argv);
>> +
>> +	return test_harness_run(argc, argv);
>> +}
>> --
>> 2.56.0.rc1.315.gc6ed9934b7-goog
>>
