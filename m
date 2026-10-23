Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792796658;
	b=YOQG+vlqe8DumdwV5a+IoScKxO0RgNSLb64qnWf1ISndvB7M68vVRNas1TbTq74/aEtp
	 AHNf6Rphf0xAe0RII2u+dwy4wcndHtnAY361B6VXPQ4hjxCm7laZnkgYjb44lcBpKz3j5
	 y20R/ghaZyTMSYmD1pV1l0SxUMiZAhaX/JaXkhOPQjnXxtmMzAWRM7iBgDzFWXP7TamDV
	 qFtmPy6jg7rpCh3Xzq7xdoc9wYzgT0IEhcy+BvX4fMFHmfhgqTXUYHbbDzX6zrZmQx/x+
	 /CpwdA1j/3aglxTBWICWLLzRQVM1VWHxc+Lyf3wUOwQuhSEdZBF5R+FuaTU5roJxlNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792796658;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=3xbNbatCe41SldMriSPTRQF+PIc5nLUyNrQZ+W+A7/U=;
	b=jmNFyG8FacXG4eCgEwHIyaiJzAOET/qMc92GJV0q9u5zNLz1NZhUF46osZCGDfYRcQmJ
	 JO6wxAUSqj6zl075cdWXWLVE6YrphreNLMJj9u5a7nHCpGYor5mXwC4xbRHNinCoAeka2
	 FJAuUqlE7KROde7owOiUDWY2tc9dwTm67CTwwiEE6XWoRa/gOCLzCjP+XwRlssMrIYfSE
	 G0pFwC0TrVL1B9+yPeCOqsxKbb1h6QwPNwTYrKQiI9wiM7NILbL/v0PnFSDZckf+mRsTu
	 6B90Mtzoy/el2X/cwfBgVAbrFMIZV+otSok4OPZYqh9QYZrGrkHluTjOc1wilBDFpWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=fMQRZxV5;
	arc=none smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03331606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 23:04:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03331606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=fMQRZxV5
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2ea7f9c11e6so23775ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 16:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792796657; x=1793401457; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3xbNbatCe41SldMriSPTRQF+PIc5nLUyNrQZ+W+A7/U=;
        b=fMQRZxV5WGG87fTZSRRVbXiRNScuhy+dz7oVpfDiBhEbziySmyK36jCsUhbxZmX4Oo
         92udpC1ITklsMF1PQU9pkT98pdnRG8klE2Prmdit/WHsZCiMU6I5zSm1FVCa2fx4rnuV
         eWk6ZJQxzlLDO/2qilKnmwJU6O4DSJ8Yo4WovwXQW2/15xH4CATkVzc4Xf6U0b2yIX9P
         gfhOtFP8XhZmjGiyt1XrRcXk0GRQ1uxVgkc0RcKKI3FfOIT3hr5eDtBY4eAjSKGK4msi
         bqLCH58GylPAULbwwDa+o4HcmPLk/J37BgSNR8+fjL5guKlWotwScR1jAX9Golniwjkh
         6r+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792796657; x=1793401457;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3xbNbatCe41SldMriSPTRQF+PIc5nLUyNrQZ+W+A7/U=;
        b=k+UOn4WuL0LksKEq7JzaK3wWMQ/FCXEfG9nJJi8JU2Mb1WMzGPQ4v2ecvAyGQQPlMe
         BNh0TXPKM/kqnkzKcCeJK87mLBPeSj929XJ192gG/A1WD+jRflkq7Xc9Nq9dKMpT6390
         AypimFtPO/4l0rKdl/mzzsMjTfe6I7U1IUsidNXhlEis8xioVtWLwY13ZHO6uCHAVPbn
         OePjEAvrlbfLtrPiiq3wWgvgXtCaU8rq9Frni53qwJZF0mGITAYKPLdUL6lida2Vqbny
         3HXEmneE4YuFHgHn0+5vQCOtCml8wmYzbKtNKxR3zInzoRTW+piSicCWqlSaCsFBWZXD
         9Ufg==
X-Forwarded-Encrypted: i=1; AKwUvBwqvMsfu9g2mWG5URt4rXL6QVQAymI68wMMHewnjmNlJoHlL3/bzh4XJv1qGyKyGWVaSIsoR/cJpmQ5mnE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJEEOk2n38qSDGl7kiJLFv/HdWQPeJzQ7Qaw50CMnugRO+xFrYt
	Cf5y1P8MhZXF1BSWNj6xKulbksFoBxAlhOYerh9jwexC6Qwd9ph8e1nUNlNErbADvA==
X-Gm-Gg: AYBFou1ASBhX3WLHK1SDIit07Zm/juoNEMHHA1kPalFsa318jH0OB4xbHDPS0VB1zYg
	vHKHBmId3tk369eaKdldZAXYxju0shzVwo5tblFHA7lSwQ2oWZXmdeQx9EVcXzQs8V1hpYH/Q3i
	qJcqoVYBTJRDzcafc3lwaaggoOcAzMNhvrTvhhpCiH0v4bke38W7dIx5taNXdGtD++cAfV/2pZo
	TPbDswdytNvuINigbpuzyyXa8J+pXLBC0Omf124HpaFkmcMnh8pNXlAUnme8Sc9fCY0V3ZweMvA
	BcCP7C/c9kAOWldVji/zMH3C3f8FijOcSl9JiXD9mtlDvgV7sroCvEUg/vrEUwnMIa8GQ2v3iNo
	w1hUmZ8udrCbvWC+edyNPvZXiyIQow0TGB04gG5POnOmy3KMEebo8njUugWB/z/tApmZCZBRFVF
	FH9BGMzwlv90xfufWet1z2IjlL0KS3LVPP+MpmMu/pOenNQXrSGQCeAfphu6WMAMGr8pRw9QWil
	8fLql7vmfXnqymM1LniiT6YwvxeCIu9AmrX4Ky2QmgVwffxNr+KnwywrxA3Oz8CSy4kIb7xUVMK
	55sihCADre0flOkWigZBASScIheTdB1FsDpxOKdIdsZV3/PPUkd1qqgMIdYZtXvpK7oPWg==
X-Received: by 2002:a17:903:37c6:b0:2e3:981:4cc4 with SMTP id d9443c01a7336-2ea9d142431mr730895ad.9.1792796656506;
        Fri, 23 Oct 2026 16:04:16 -0700 (PDT)
Received: from google.com (163.1.145.34.bc.googleusercontent.com. [34.145.1.163])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebb0dda7sm385580a91.4.2026.10.23.16.04.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 16:04:14 -0700 (PDT)
Date: Fri, 23 Oct 2026 23:04:10 +0000
From: Samiullah Khawaja <skhawaja@google.com>
To: David Matlack <dmatlack@google.com>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Robin Murphy <robin.murphy@arm.com>, 
	Kevin Tian <kevin.tian@intel.com>, Alex Williamson <alex@shazbot.org>, iommu@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Lu Baolu <baolu.lu@linux.intel.com>, 
	Pranjal Shrivastava <praan@google.com>
Subject: Re: [RFC PATCH 1/3] vfio: selftests: Add support of creating iommus
 from iommufd
Message-ID: <atvm5B7zhe5n1A_-@google.com>
References: <20260925011308.3381953-1-skhawaja@google.com>
 <20260925011308.3381953-2-skhawaja@google.com>
 <atk6drL0jn8A9Ocm@google.com>
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
In-Reply-To: <atk6drL0jn8A9Ocm@google.com>

On Wed, Oct 21, 2026 at 10:19:34PM +0000, David Matlack wrote:
>On 2026-09-25 01:13 AM, Samiullah Khawaja wrote:
>> Add API to init a struct iommu using an already opened iommufd instance
>> and attach devices to it.
>>
>> Signed-off-by: Samiullah Khawaja <skhawaja@google.com>
>> ---
>>  .../vfio/lib/include/libvfio/iommu.h          |  2 +
>>  .../lib/include/libvfio/vfio_pci_device.h     |  2 +
>>  tools/testing/selftests/vfio/lib/iommu.c      | 60 +++++++++++++++++--
>>  .../selftests/vfio/lib/vfio_pci_device.c      | 25 ++++++--
>>  4 files changed, 80 insertions(+), 9 deletions(-)
>>
>> diff --git a/tools/testing/selftests/vfio/lib/include/libvfio/iommu.h b/tools/testing/selftests/vfio/lib/include/libvfio/iommu.h
>> index e9a3386a4719..62f1e8affd2b 100644
>> --- a/tools/testing/selftests/vfio/lib/include/libvfio/iommu.h
>> +++ b/tools/testing/selftests/vfio/lib/include/libvfio/iommu.h
>> @@ -29,10 +29,12 @@ struct iommu {
>>  	int container_fd;
>>  	int iommufd;
>>  	u32 ioas_id;
>> +	u32 hwpt_id;
>>  	struct list_head dma_regions;
>>  };
>>
>>  struct iommu *iommu_init(const char *iommu_mode);
>> +struct iommu *iommufd_iommu_init(int iommufd, u32 dev_id);
>>  void iommu_cleanup(struct iommu *iommu);
>>
>>  int __iommu_map(struct iommu *iommu, struct dma_region *region);
>> diff --git a/tools/testing/selftests/vfio/lib/include/libvfio/vfio_pci_device.h b/tools/testing/selftests/vfio/lib/include/libvfio/vfio_pci_device.h
>> index e19bd94b8dd2..4dcc23bc9b78 100644
>> --- a/tools/testing/selftests/vfio/lib/include/libvfio/vfio_pci_device.h
>> +++ b/tools/testing/selftests/vfio/lib/include/libvfio/vfio_pci_device.h
>> @@ -19,6 +19,7 @@ struct vfio_pci_device {
>>  	const char *bdf;
>>  	int fd;
>>  	int group_fd;
>> +	u32 dev_id;
>>
>>  	struct iommu *iommu;
>>
>> @@ -82,6 +83,7 @@ static inline void vfio_pci_cmd_clear(struct vfio_pci_device *device, u16 bits)
>>  	vfio_pci_config_writew(device, PCI_COMMAND, cmd & ~bits);
>>  }
>>
>> +void vfio_pci_device_attach_iommu(struct vfio_pci_device *device, struct iommu *iommu);
>>  void vfio_pci_irq_enable(struct vfio_pci_device *device, u32 index,
>>  			 u32 vector, int count);
>>  void vfio_pci_irq_disable(struct vfio_pci_device *device, u32 index);
>> diff --git a/tools/testing/selftests/vfio/lib/iommu.c b/tools/testing/selftests/vfio/lib/iommu.c
>> index b6f3c5c84e01..6d2d5c82813c 100644
>> --- a/tools/testing/selftests/vfio/lib/iommu.c
>> +++ b/tools/testing/selftests/vfio/lib/iommu.c
>> @@ -405,6 +405,18 @@ struct iommu_iova_range *iommu_iova_ranges(struct iommu *iommu, u32 *nranges)
>>  	return ranges;
>>  }
>>
>> +static u32 iommufd_hwpt_alloc(struct iommu *iommu, u32 dev_id)
>> +{
>> +	struct iommu_hwpt_alloc args = {
>> +		.size = sizeof(args),
>> +		.pt_id = iommu->ioas_id,
>> +		.dev_id = dev_id,
>> +	};
>> +
>> +	ioctl_assert(iommu->iommufd, IOMMU_HWPT_ALLOC, &args);
>> +	return args.out_hwpt_id;
>> +}
>> +
>>  static u32 iommufd_ioas_alloc(int iommufd)
>>  {
>>  	struct iommu_ioas_alloc args = {
>> @@ -415,17 +427,25 @@ static u32 iommufd_ioas_alloc(int iommufd)
>>  	return args.out_ioas_id;
>>  }
>>
>> -struct iommu *iommu_init(const char *iommu_mode)
>> +static struct iommu *iommu_alloc(const char *iommu_mode)
>>  {
>> -	const char *container_path;
>>  	struct iommu *iommu;
>> -	int version;
>>
>>  	iommu = calloc_assert(1, sizeof(*iommu));
>>
>>  	INIT_LIST_HEAD(&iommu->dma_regions);
>>
>>  	iommu->mode = lookup_iommu_mode(iommu_mode);
>> +	return iommu;
>> +}
>> +
>> +struct iommu *iommu_init(const char *iommu_mode)
>> +{
>> +	const char *container_path;
>> +	struct iommu *iommu;
>> +	int version;
>> +
>> +	iommu = iommu_alloc(iommu_mode);
>>
>>  	container_path = iommu->mode->container_path;
>>  	if (container_path) {
>> @@ -449,10 +469,42 @@ struct iommu *iommu_init(const char *iommu_mode)
>>  	return iommu;
>>  }
>>
>> +struct iommu *iommufd_iommu_init(int iommufd, u32 dev_id)
>
>I think this is a good opportunity to start adding kernel-doc comments.
>It's not very obvious how and when to use both iommufd_iommu_init() and
>vfio_pci_device_attach_iommu(). A kernel-doc comment would help clarify
>that.

Agreed. I will add it.
>
>> +{
>> +	struct iommu *iommu;
>> +
>> +	iommu = iommu_alloc("iommufd");
>> +
>> +	iommu->iommufd = dup(iommufd);
>> +	VFIO_ASSERT_GT(iommu->iommufd, 0);
>> +
>> +	iommu->ioas_id = iommufd_ioas_alloc(iommu->iommufd);
>> +	iommu->hwpt_id = iommufd_hwpt_alloc(iommu, dev_id);
>> +
>> +	return iommu;
>> +}
>> +
>> +static void iommufd_cleanup(struct iommu *iommu)
>> +{
>> +	struct iommu_destroy args = {
>> +		.size = sizeof(args),
>> +	};
>> +
>> +	if (iommu->hwpt_id) {
>> +		args.id = iommu->hwpt_id;
>> +		ioctl_assert(iommu->iommufd, IOMMU_DESTROY, &args);
>> +	}
>> +
>> +	args.id = iommu->ioas_id;
>> +	ioctl_assert(iommu->iommufd, IOMMU_DESTROY, &args);
>
>Please put IOMMU_DESTROY into its own helper so this can be:
>
>if (iommu->hwpt_id)
>        iommufd_iommu_destroy(iommu, iommu->hwpt_id);
>
>iommufd_iommu_destroy(iommu, iommu->ioas_id);

Will do
>
>> +
>> +	VFIO_ASSERT_EQ(close(iommu->iommufd), 0);
>> +}
>> +
>>  void iommu_cleanup(struct iommu *iommu)
>>  {
>>  	if (iommu->iommufd)
>> -		VFIO_ASSERT_EQ(close(iommu->iommufd), 0);
>> +		iommufd_cleanup(iommu);
>>  	else
>>  		VFIO_ASSERT_EQ(close(iommu->container_fd), 0);
>>
>> diff --git a/tools/testing/selftests/vfio/lib/vfio_pci_device.c b/tools/testing/selftests/vfio/lib/vfio_pci_device.c
>> index 774d1e90ec0e..81d3879d064f 100644
>> --- a/tools/testing/selftests/vfio/lib/vfio_pci_device.c
>> +++ b/tools/testing/selftests/vfio/lib/vfio_pci_device.c
>> @@ -469,15 +469,15 @@ int __vfio_device_bind_iommufd(int device_fd, int iommufd, const char *vf_token)
>>  	if (ioctl(device_fd, VFIO_DEVICE_BIND_IOMMUFD, &args))
>>  		return -errno;
>>
>> -	return 0;
>> +	return args.out_devid;
>
>This breaks vfio_pci_sriov_uapi_test for all iommufd variants (9/45
>fail). iommufd_setup() in that test returns the result of
>__vfio_device_bind_iommufd() directly, and the
>fixture/ASSERT_COND_VF_CREATION() treat any non-zero value as failure.
>
>Something like the following is needed to fix it:
>
>diff --git a/tools/testing/selftests/vfio/vfio_pci_sriov_uapi_test.c b/tools/testing/selftests/vfio/vfio_pci_sriov_uapi_test.c
>--- a/tools/testing/selftests/vfio/vfio_pci_sriov_uapi_test.c
>+++ b/tools/testing/selftests/vfio/vfio_pci_sriov_uapi_test.c
>@@ -32,9 +32,14 @@ static int container_setup(struct vfio_pci_device *device, const char *bdf,
> static int iommufd_setup(struct vfio_pci_device *device, const char *bdf,
>		  const char *vf_token)
> {
>+    int ret;
>+
>     vfio_pci_cdev_open(device, bdf);
>-    return __vfio_device_bind_iommufd(device->fd,
>-                      device->iommu->iommufd, vf_token);
>+    ret = __vfio_device_bind_iommufd(device->fd,
>+                     device->iommu->iommufd, vf_token);
>+
>+    /* On success, __vfio_device_bind_iommufd() returns the device ID. */
>+    return ret < 0 ? ret : 0;
> }
>
> static int device_init(const char *bdf, struct iommu *iommu,

Will update.
>
>>  }
>>
>> -static void vfio_device_bind_iommufd(int device_fd, int iommufd,
>> -				     const char *vf_token)
>> +int vfio_device_bind_iommufd(int device_fd, int iommufd, const char *vf_token)
>>  {
>>  	int ret = __vfio_device_bind_iommufd(device_fd, iommufd, vf_token);
>>
>> -	VFIO_ASSERT_EQ(ret, 0, "Failed VFIO_DEVICE_BIND_IOMMUFD ioctl\n");
>> +	VFIO_ASSERT_GE(ret, 0, "Failed VFIO_DEVICE_BIND_IOMMUFD ioctl\n");
>> +	return ret;
>>  }
>>
>>  static void vfio_device_attach_iommufd_pt(int device_fd, u32 pt_id)
>> @@ -503,10 +503,25 @@ static void vfio_pci_iommufd_setup(struct vfio_pci_device *device,
>>  				   const char *bdf, const char *vf_token)
>>  {
>>  	vfio_pci_cdev_open(device, bdf);
>> -	vfio_device_bind_iommufd(device->fd, device->iommu->iommufd, vf_token);
>> +	device->dev_id = vfio_device_bind_iommufd(device->fd, device->iommu->iommufd, vf_token);
>>  	vfio_device_attach_iommufd_pt(device->fd, device->iommu->ioas_id);
>>  }
>>
>> +void vfio_pci_device_attach_iommu(struct vfio_pci_device *device, struct iommu *iommu)
>> +{
>> +	u32 pt_id = iommu->ioas_id;
>> +
>> +	/* Only iommufd supports changing struct iommu attachments */
>> +	VFIO_ASSERT_TRUE(iommu->iommufd);
>> +
>> +	if (iommu->hwpt_id)
>> +		pt_id = iommu->hwpt_id;
>> +
>> +	VFIO_ASSERT_NE(pt_id, 0);
>
>Is this assert needed? (Will vfio_device_attach_iommufd_pt() not handle
>this appropriately?)

It should be covered by the assert for the ioctl. I will remove this.
>
>> +	vfio_device_attach_iommufd_pt(device->fd, pt_id);
>> +	device->iommu = iommu;
>> +}
>> +
>>  struct vfio_pci_device *vfio_pci_device_alloc(const char *bdf, struct iommu *iommu)
>>  {
>>  	struct vfio_pci_device *device;
>> --
>> 2.56.0.rc1.315.gc6ed9934b7-goog
>>

Thanks,
Sami
