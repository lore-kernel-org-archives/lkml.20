Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792621180;
	b=MIrtDbhJSlorlp9yISOpPOBtdItLBjgzjQ3N8AarILPJmHH6deqeL0+JKbVwgKR2z60+
	 BSVLAInxkkLGKLHhwdt07Dhbhr0Uvx4RZWvKkQMuZB9b/Ikdl7eiGsVM6NJ4m4L1+jqK8
	 ZKr5ZeW5MOrGDmHe8X08HZm1iXPG2g75wd6AxcGXXTVX6rIzxZXRUvOrDVEanDyUoWekJ
	 7oD9yPORSIzNBIW6sOceVblQYFL1UK5P6xSDfDLA89JYdDoheovW5CQI4G0zx7VqCQwZw
	 5Q8czWtRFEUguy/0uRwluUrcq6iuydZ9pgt0AxG3YAx1lxYAz0xxddD+Rw6//QiZG/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792621180;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=iYS+i0Ds8xFF5qZV2X2fbTLhmpre7IccGcufFJNUJH8=;
	b=XqJOxwP7jlT+sACN5ionir/FmugUuiTcVYYU5wXH66/ktjAcE8Ob9y6ekzzkpu9731R/
	 KpfWtN9rGMX5kR0bMlcOq1W6mzmNyMdLRSjm2lxzfxMaiml6/aGVMLWzp9wlyE9T0xWv2
	 W2I6j7X9mm57hfugC7J02qNe5oqSDCp74dHJMYbhVjh/iN/ssPkiiAULP1x1uH0cnsqRH
	 V/oataLfUVireFaiQ4UNEcx5GlBU//yRp3JsGXm/3bD2LnrWPxLMOWTR7KEReLnP6ov58
	 PNd9TCWN69plRYafDtmJpBeFR/11W1USJKHwcVUETlu/ksE0QDYFQO5k/b3QNkR7XUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=MBLh862c;
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ECDB606A31B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 22:19:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3ECDB606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=MBLh862c
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2dd76b1361dso8461835ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 15:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792621180; x=1793225980; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iYS+i0Ds8xFF5qZV2X2fbTLhmpre7IccGcufFJNUJH8=;
        b=MBLh862cg2erCkMNN0pqkMWKPq+fKE/eLQWejMA7SBQuTnG062O+1/PWRmYRz7YiQx
         YjrC3AabJ1pLj9IV0b3XpT+U0fChrEdE7scWwPngPqh5JL7tUhtA9os8QQ16zHnEYT2F
         4d75JC7zrJyyyS1T+u9gefOwE8HwCF0ub76FpbgA9+mKOS0YmhHdPOuwmRy4Ff+V0f5P
         gcxa59UaJUx5UOPs2x6wKfy0I1Pf1nsnpX5kSQ8eqkukQeYsEMyJ0QfNsGenPGyphqjD
         BLAF/ayqNzWUBvB30lAHfFcklo9pudsR2K6Owm1vMpyqIynTg0SsFQhPy2BPJcyS8szD
         dWNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792621180; x=1793225980;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iYS+i0Ds8xFF5qZV2X2fbTLhmpre7IccGcufFJNUJH8=;
        b=xXYMoSUbzaQ5uVBHyJgZpDZYT5iCcRCr4NeH/QmCJ0QwsUdyk9b9H/OMUXncFmr/4+
         s7X246iqa4bt0MTjA6xifrm1IrNehlS6c6ZZ3YmNujMjHYMkVoByxiz/UNdMZ2od/DcK
         1r7pdYTqB10r62MX1WfylcBmgQtWWADuNRaa2FkgLjrqbgRQthN6lusSMahlGU0z6Xxv
         yAvDndoROyV2E7ij3YIubSgDrBMJtDREN+xvLzspvmENmGSsW7yy0gGns0e+EX03CnDz
         boxgOc+boHMbTbgBNwLUS9KZhmyhYw8QHGulTDYs+t2cKKvRWy2YjUxHhjztw3Wofmm7
         vDAw==
X-Forwarded-Encrypted: i=1; AKwUvBwX/Jb+YgpReptbRHnZ6w3D98j7IQZqC+J7WMQ9BEUCnlp5wi8yHPnQzNLRhh/Lk1NkCb9Jn6LvYm1rJZ0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKjZBCiGf++6UGnVB5sNxJi+u/st8866O/USM5yvUQjSKDCPY2Y
	ZVeMUmxmRv3e3xDzKeUjFLmPkeUSbHUzkkyH8Gw1K26xFAxUFIs6bvpMGIsxi3BdUw==
X-Gm-Gg: AYBFou2V2D7TK0sEyAKV8ecTM5guGUmE2YaKfwB5qOjzrt1mTDfOmitUlB3v1y8esVt
	T0oVZvrJgGH3HLJEMOKKA2JkiAfT91USZbBU8fXONVsICbcpPrPJ/dSGzbBybiAscTqzOWYiocK
	odfqni60tdwZxBkR0U2H/b8O2ge9J2N92VKYI7mMDoM7F54JqoMUYMvk2WsAQ+DhpnYsKIqdbDI
	4bGsPY5iTU7ezxHNMSRPoulakMNVQ6XPvtP46pLQl7H3EIHcOITrvmeXzVWH1ewehumQxZc72dC
	/TDtmkZXBzFk2Gq5omYNzavDkWHkEI+7OalnayzYZO2hB4WaqfeuWDOGXobODz7/vYKESE8Vo2U
	RsTjI+ETapT7R1C62XrHIx57wwQFdOiZBgGrgQSt4HyNt0wnn8ZH2uvaA7vgN3Uj5myNtoWoksV
	y/2j0hPnmP5oYYRRy0K2jlLmO2xzu85/ay3tDh08we7GvB5BeajNP1LIE+X7z+LqeptW612/yeL
	zNHPCuNDrBBJ0iGHIGFN359F9X9sPd4B9+CxUNqp9bXaqRkAts5PciRSlQ1nITUfFZ1+/jO6GDg
	IIll9skAQMNbf3fG
X-Received: by 2002:a17:903:1a44:b0:2e9:3f26:5d83 with SMTP id d9443c01a7336-2ea43dbc13fmr25913965ad.12.1792621178933;
        Wed, 21 Oct 2026 15:19:38 -0700 (PDT)
Received: from google.com (64.75.127.34.bc.googleusercontent.com. [34.127.75.64])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea3b453a4dsm16082615ad.42.2026.10.21.15.19.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 15:19:38 -0700 (PDT)
Date: Wed, 21 Oct 2026 22:19:34 +0000
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
Subject: Re: [RFC PATCH 1/3] vfio: selftests: Add support of creating iommus
 from iommufd
Message-ID: <atk6drL0jn8A9Ocm@google.com>
References: <20260925011308.3381953-1-skhawaja@google.com>
 <20260925011308.3381953-2-skhawaja@google.com>
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
In-Reply-To: <20260925011308.3381953-2-skhawaja@google.com>

On 2026-09-25 01:13 AM, Samiullah Khawaja wrote:
> Add API to init a struct iommu using an already opened iommufd instance
> and attach devices to it.
> 
> Signed-off-by: Samiullah Khawaja <skhawaja@google.com>
> ---
>  .../vfio/lib/include/libvfio/iommu.h          |  2 +
>  .../lib/include/libvfio/vfio_pci_device.h     |  2 +
>  tools/testing/selftests/vfio/lib/iommu.c      | 60 +++++++++++++++++--
>  .../selftests/vfio/lib/vfio_pci_device.c      | 25 ++++++--
>  4 files changed, 80 insertions(+), 9 deletions(-)
> 
> diff --git a/tools/testing/selftests/vfio/lib/include/libvfio/iommu.h b/tools/testing/selftests/vfio/lib/include/libvfio/iommu.h
> index e9a3386a4719..62f1e8affd2b 100644
> --- a/tools/testing/selftests/vfio/lib/include/libvfio/iommu.h
> +++ b/tools/testing/selftests/vfio/lib/include/libvfio/iommu.h
> @@ -29,10 +29,12 @@ struct iommu {
>  	int container_fd;
>  	int iommufd;
>  	u32 ioas_id;
> +	u32 hwpt_id;
>  	struct list_head dma_regions;
>  };
>  
>  struct iommu *iommu_init(const char *iommu_mode);
> +struct iommu *iommufd_iommu_init(int iommufd, u32 dev_id);
>  void iommu_cleanup(struct iommu *iommu);
>  
>  int __iommu_map(struct iommu *iommu, struct dma_region *region);
> diff --git a/tools/testing/selftests/vfio/lib/include/libvfio/vfio_pci_device.h b/tools/testing/selftests/vfio/lib/include/libvfio/vfio_pci_device.h
> index e19bd94b8dd2..4dcc23bc9b78 100644
> --- a/tools/testing/selftests/vfio/lib/include/libvfio/vfio_pci_device.h
> +++ b/tools/testing/selftests/vfio/lib/include/libvfio/vfio_pci_device.h
> @@ -19,6 +19,7 @@ struct vfio_pci_device {
>  	const char *bdf;
>  	int fd;
>  	int group_fd;
> +	u32 dev_id;
>  
>  	struct iommu *iommu;
>  
> @@ -82,6 +83,7 @@ static inline void vfio_pci_cmd_clear(struct vfio_pci_device *device, u16 bits)
>  	vfio_pci_config_writew(device, PCI_COMMAND, cmd & ~bits);
>  }
>  
> +void vfio_pci_device_attach_iommu(struct vfio_pci_device *device, struct iommu *iommu);
>  void vfio_pci_irq_enable(struct vfio_pci_device *device, u32 index,
>  			 u32 vector, int count);
>  void vfio_pci_irq_disable(struct vfio_pci_device *device, u32 index);
> diff --git a/tools/testing/selftests/vfio/lib/iommu.c b/tools/testing/selftests/vfio/lib/iommu.c
> index b6f3c5c84e01..6d2d5c82813c 100644
> --- a/tools/testing/selftests/vfio/lib/iommu.c
> +++ b/tools/testing/selftests/vfio/lib/iommu.c
> @@ -405,6 +405,18 @@ struct iommu_iova_range *iommu_iova_ranges(struct iommu *iommu, u32 *nranges)
>  	return ranges;
>  }
>  
> +static u32 iommufd_hwpt_alloc(struct iommu *iommu, u32 dev_id)
> +{
> +	struct iommu_hwpt_alloc args = {
> +		.size = sizeof(args),
> +		.pt_id = iommu->ioas_id,
> +		.dev_id = dev_id,
> +	};
> +
> +	ioctl_assert(iommu->iommufd, IOMMU_HWPT_ALLOC, &args);
> +	return args.out_hwpt_id;
> +}
> +
>  static u32 iommufd_ioas_alloc(int iommufd)
>  {
>  	struct iommu_ioas_alloc args = {
> @@ -415,17 +427,25 @@ static u32 iommufd_ioas_alloc(int iommufd)
>  	return args.out_ioas_id;
>  }
>  
> -struct iommu *iommu_init(const char *iommu_mode)
> +static struct iommu *iommu_alloc(const char *iommu_mode)
>  {
> -	const char *container_path;
>  	struct iommu *iommu;
> -	int version;
>  
>  	iommu = calloc_assert(1, sizeof(*iommu));
>  
>  	INIT_LIST_HEAD(&iommu->dma_regions);
>  
>  	iommu->mode = lookup_iommu_mode(iommu_mode);
> +	return iommu;
> +}
> +
> +struct iommu *iommu_init(const char *iommu_mode)
> +{
> +	const char *container_path;
> +	struct iommu *iommu;
> +	int version;
> +
> +	iommu = iommu_alloc(iommu_mode);
>  
>  	container_path = iommu->mode->container_path;
>  	if (container_path) {
> @@ -449,10 +469,42 @@ struct iommu *iommu_init(const char *iommu_mode)
>  	return iommu;
>  }
>  
> +struct iommu *iommufd_iommu_init(int iommufd, u32 dev_id)

I think this is a good opportunity to start adding kernel-doc comments.
It's not very obvious how and when to use both iommufd_iommu_init() and
vfio_pci_device_attach_iommu(). A kernel-doc comment would help clarify
that.

> +{
> +	struct iommu *iommu;
> +
> +	iommu = iommu_alloc("iommufd");
> +
> +	iommu->iommufd = dup(iommufd);
> +	VFIO_ASSERT_GT(iommu->iommufd, 0);
> +
> +	iommu->ioas_id = iommufd_ioas_alloc(iommu->iommufd);
> +	iommu->hwpt_id = iommufd_hwpt_alloc(iommu, dev_id);
> +
> +	return iommu;
> +}
> +
> +static void iommufd_cleanup(struct iommu *iommu)
> +{
> +	struct iommu_destroy args = {
> +		.size = sizeof(args),
> +	};
> +
> +	if (iommu->hwpt_id) {
> +		args.id = iommu->hwpt_id;
> +		ioctl_assert(iommu->iommufd, IOMMU_DESTROY, &args);
> +	}
> +
> +	args.id = iommu->ioas_id;
> +	ioctl_assert(iommu->iommufd, IOMMU_DESTROY, &args);

Please put IOMMU_DESTROY into its own helper so this can be:

if (iommu->hwpt_id)
        iommufd_iommu_destroy(iommu, iommu->hwpt_id);

iommufd_iommu_destroy(iommu, iommu->ioas_id);

> +
> +	VFIO_ASSERT_EQ(close(iommu->iommufd), 0);
> +}
> +
>  void iommu_cleanup(struct iommu *iommu)
>  {
>  	if (iommu->iommufd)
> -		VFIO_ASSERT_EQ(close(iommu->iommufd), 0);
> +		iommufd_cleanup(iommu);
>  	else
>  		VFIO_ASSERT_EQ(close(iommu->container_fd), 0);
>  
> diff --git a/tools/testing/selftests/vfio/lib/vfio_pci_device.c b/tools/testing/selftests/vfio/lib/vfio_pci_device.c
> index 774d1e90ec0e..81d3879d064f 100644
> --- a/tools/testing/selftests/vfio/lib/vfio_pci_device.c
> +++ b/tools/testing/selftests/vfio/lib/vfio_pci_device.c
> @@ -469,15 +469,15 @@ int __vfio_device_bind_iommufd(int device_fd, int iommufd, const char *vf_token)
>  	if (ioctl(device_fd, VFIO_DEVICE_BIND_IOMMUFD, &args))
>  		return -errno;
>  
> -	return 0;
> +	return args.out_devid;

This breaks vfio_pci_sriov_uapi_test for all iommufd variants (9/45
fail). iommufd_setup() in that test returns the result of
__vfio_device_bind_iommufd() directly, and the
fixture/ASSERT_COND_VF_CREATION() treat any non-zero value as failure.

Something like the following is needed to fix it:

diff --git a/tools/testing/selftests/vfio/vfio_pci_sriov_uapi_test.c b/tools/testing/selftests/vfio/vfio_pci_sriov_uapi_test.c
--- a/tools/testing/selftests/vfio/vfio_pci_sriov_uapi_test.c
+++ b/tools/testing/selftests/vfio/vfio_pci_sriov_uapi_test.c
@@ -32,9 +32,14 @@ static int container_setup(struct vfio_pci_device *device, const char *bdf,
 static int iommufd_setup(struct vfio_pci_device *device, const char *bdf,
		  const char *vf_token)
 {
+    int ret;
+
     vfio_pci_cdev_open(device, bdf);
-    return __vfio_device_bind_iommufd(device->fd,
-                      device->iommu->iommufd, vf_token);
+    ret = __vfio_device_bind_iommufd(device->fd,
+                     device->iommu->iommufd, vf_token);
+
+    /* On success, __vfio_device_bind_iommufd() returns the device ID. */
+    return ret < 0 ? ret : 0;
 }

 static int device_init(const char *bdf, struct iommu *iommu,

>  }
>  
> -static void vfio_device_bind_iommufd(int device_fd, int iommufd,
> -				     const char *vf_token)
> +int vfio_device_bind_iommufd(int device_fd, int iommufd, const char *vf_token)
>  {
>  	int ret = __vfio_device_bind_iommufd(device_fd, iommufd, vf_token);
>  
> -	VFIO_ASSERT_EQ(ret, 0, "Failed VFIO_DEVICE_BIND_IOMMUFD ioctl\n");
> +	VFIO_ASSERT_GE(ret, 0, "Failed VFIO_DEVICE_BIND_IOMMUFD ioctl\n");
> +	return ret;
>  }
>  
>  static void vfio_device_attach_iommufd_pt(int device_fd, u32 pt_id)
> @@ -503,10 +503,25 @@ static void vfio_pci_iommufd_setup(struct vfio_pci_device *device,
>  				   const char *bdf, const char *vf_token)
>  {
>  	vfio_pci_cdev_open(device, bdf);
> -	vfio_device_bind_iommufd(device->fd, device->iommu->iommufd, vf_token);
> +	device->dev_id = vfio_device_bind_iommufd(device->fd, device->iommu->iommufd, vf_token);
>  	vfio_device_attach_iommufd_pt(device->fd, device->iommu->ioas_id);
>  }
>  
> +void vfio_pci_device_attach_iommu(struct vfio_pci_device *device, struct iommu *iommu)
> +{
> +	u32 pt_id = iommu->ioas_id;
> +
> +	/* Only iommufd supports changing struct iommu attachments */
> +	VFIO_ASSERT_TRUE(iommu->iommufd);
> +
> +	if (iommu->hwpt_id)
> +		pt_id = iommu->hwpt_id;
> +
> +	VFIO_ASSERT_NE(pt_id, 0);

Is this assert needed? (Will vfio_device_attach_iommufd_pt() not handle
this appropriately?)

> +	vfio_device_attach_iommufd_pt(device->fd, pt_id);
> +	device->iommu = iommu;
> +}
> +
>  struct vfio_pci_device *vfio_pci_device_alloc(const char *bdf, struct iommu *iommu)
>  {
>  	struct vfio_pci_device *device;
> -- 
> 2.56.0.rc1.315.gc6ed9934b7-goog
> 
