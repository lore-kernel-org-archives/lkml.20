Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF3533375C3
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 01:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790298799; cv=none; b=hCLn01kLY6oJQ2353ZGFQ1GbVmCz+Zpxfebg4frYRXBYCQxsYLsNTaVjZcqdh0yO9ELcdL6KxpYwBwtKKp6oQjx4KNdYfjTVQOFzNnfPvnVOMYpxXxjvBqqDxNmUeWRzJ8t8H7704jPHT6D5+HGFsHYvgEWfLMBu4hOUTRvUtZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790298799; c=relaxed/simple;
	bh=bmgdSm8YNHW5kPtfT3/SqPZq1EkFkf4vUCBmOXLEWxA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=OJqBccQvuV09Q2rd5dsHDWENFfAyJkFsatMF9/p5E95wclI8G6+Ulcbcs3FzPvJnS8aHszItNvWTqQKR1BqP3TBECEr70Z6Me308b+Gj1bt3naPXKjdBE4C3Dlza2dbWheTvUtRKOF1mSs7/gDsFnL732VBhWXIe0cDRdIt85S8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--skhawaja.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ofcEtKz6; arc=none smtp.client-ip=209.85.210.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--skhawaja.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ofcEtKz6"
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-86fa6b15ed3so547446b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 18:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790298793; x=1790903593; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lelMh14JrGavtZ6asWUfZuJNFtBWesyUfwFCF+GGQWw=;
        b=ofcEtKz6qlw1dduMrnUG8Y6KPRSF47Nx/Hrdk2pcdehERF2XIYfHNSRMFHhBGj0MNj
         ws+hSG1IgJp+vjIGT46q0A2mMO3TLC8LdXoyzL9w2tx7XMDBs97+FOU0z4nSV1+hboW/
         ndlBVTQVAgRfqFw9XmPgu9gDnfXsoB/T7ALyUAI4SCEC3rWeQemwD0SLq4ia1DSk9uNF
         uIXod/ms4K72NSs9J8fE8nLNRQJZdPPwKiitl9/+jQ1wO729QgB/G2uMVjMbLH+LCNcD
         PhheFI3h+WBV69lg0E+H+eQsGl2daNVimcuvJLmlBU7pyG1ciNR+0k+AJcXlOiM7V3QS
         Y/ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790298793; x=1790903593;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lelMh14JrGavtZ6asWUfZuJNFtBWesyUfwFCF+GGQWw=;
        b=bCX977ufVBjRcovp8yjvua4v9Bc+r/y/52GSsts3twxNGyA7fHUZcNWThCbWkSlel5
         8UnulRy7N/1AHNViIUPu0LbZfPWh+8w5TG8fSeqctOUvgyTaPevg1qrKIFXSlzsteZmW
         xXeHxE1mrX63Wl99FrFZ9F3w/gzk0/pdkGgs+rzmJ12yP+a57dnYTnbk/3VMMZajVidO
         opkq8Pjtx8ndyKINDkOUiJKwdMz+LPk+eqkhByR25dyGRbohTXsLY/0zZw1LDh++kezo
         U+0d+kN1dBBvNDZcAH2oksBICvX7nJa2C/UwKgNDgBrirYw2oU4AFWax6gq0LAyEsw1y
         YBng==
X-Forwarded-Encrypted: i=1; AKwUvBwkSVC4rsEIpWjyvKsWzXD7JA5f0Q6kmdPCvJ8qfeK0ibtlKi6Q0vOVtCSBWb40oEO9U6aWfM65hZuyFro=@vger.kernel.org
X-Gm-Message-State: AFuF++lE1/gsZIrFYZQpXbzJKjDUX/dh/Yz4CsiTHTYUDL52UPX0BF2o
	Hhoxou0JSn3U6LMOIHQJjxo4RHbcNRluklj3psNy63o+fiIiRhoT5CE6oHykP+FZUHAq7Z3CMN7
	Yjd4PavaDhs6COg==
X-Received: from pfbg5.prod.google.com ([2002:a05:6a00:ae05:b0:87f:c4bd:8a29])
 (user=skhawaja job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:28c3:b0:87d:3894:198d with SMTP id d2e1a72fcca58-87e9ca1ea12mr4000958b3a.58.1790298792751;
 Thu, 24 Sep 2026 18:13:12 -0700 (PDT)
Date: Fri, 25 Sep 2026 01:13:05 +0000
In-Reply-To: <20260925011308.3381953-1-skhawaja@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260925011308.3381953-1-skhawaja@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260925011308.3381953-2-skhawaja@google.com>
Subject: [RFC PATCH 1/3] vfio: selftests: Add support of creating iommus from iommufd
From: Samiullah Khawaja <skhawaja@google.com>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>
Cc: Samiullah Khawaja <skhawaja@google.com>, Robin Murphy <robin.murphy@arm.com>, 
	Kevin Tian <kevin.tian@intel.com>, Alex Williamson <alex@shazbot.org>, iommu@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, David Matlack <dmatlack@google.com>, 
	Lu Baolu <baolu.lu@linux.intel.com>, Pranjal Shrivastava <praan@google.com>
Content-Type: text/plain; charset="UTF-8"

Add API to init a struct iommu using an already opened iommufd instance
and attach devices to it.

Signed-off-by: Samiullah Khawaja <skhawaja@google.com>
---
 .../vfio/lib/include/libvfio/iommu.h          |  2 +
 .../lib/include/libvfio/vfio_pci_device.h     |  2 +
 tools/testing/selftests/vfio/lib/iommu.c      | 60 +++++++++++++++++--
 .../selftests/vfio/lib/vfio_pci_device.c      | 25 ++++++--
 4 files changed, 80 insertions(+), 9 deletions(-)

diff --git a/tools/testing/selftests/vfio/lib/include/libvfio/iommu.h b/tools/testing/selftests/vfio/lib/include/libvfio/iommu.h
index e9a3386a4719..62f1e8affd2b 100644
--- a/tools/testing/selftests/vfio/lib/include/libvfio/iommu.h
+++ b/tools/testing/selftests/vfio/lib/include/libvfio/iommu.h
@@ -29,10 +29,12 @@ struct iommu {
 	int container_fd;
 	int iommufd;
 	u32 ioas_id;
+	u32 hwpt_id;
 	struct list_head dma_regions;
 };
 
 struct iommu *iommu_init(const char *iommu_mode);
+struct iommu *iommufd_iommu_init(int iommufd, u32 dev_id);
 void iommu_cleanup(struct iommu *iommu);
 
 int __iommu_map(struct iommu *iommu, struct dma_region *region);
diff --git a/tools/testing/selftests/vfio/lib/include/libvfio/vfio_pci_device.h b/tools/testing/selftests/vfio/lib/include/libvfio/vfio_pci_device.h
index e19bd94b8dd2..4dcc23bc9b78 100644
--- a/tools/testing/selftests/vfio/lib/include/libvfio/vfio_pci_device.h
+++ b/tools/testing/selftests/vfio/lib/include/libvfio/vfio_pci_device.h
@@ -19,6 +19,7 @@ struct vfio_pci_device {
 	const char *bdf;
 	int fd;
 	int group_fd;
+	u32 dev_id;
 
 	struct iommu *iommu;
 
@@ -82,6 +83,7 @@ static inline void vfio_pci_cmd_clear(struct vfio_pci_device *device, u16 bits)
 	vfio_pci_config_writew(device, PCI_COMMAND, cmd & ~bits);
 }
 
+void vfio_pci_device_attach_iommu(struct vfio_pci_device *device, struct iommu *iommu);
 void vfio_pci_irq_enable(struct vfio_pci_device *device, u32 index,
 			 u32 vector, int count);
 void vfio_pci_irq_disable(struct vfio_pci_device *device, u32 index);
diff --git a/tools/testing/selftests/vfio/lib/iommu.c b/tools/testing/selftests/vfio/lib/iommu.c
index b6f3c5c84e01..6d2d5c82813c 100644
--- a/tools/testing/selftests/vfio/lib/iommu.c
+++ b/tools/testing/selftests/vfio/lib/iommu.c
@@ -405,6 +405,18 @@ struct iommu_iova_range *iommu_iova_ranges(struct iommu *iommu, u32 *nranges)
 	return ranges;
 }
 
+static u32 iommufd_hwpt_alloc(struct iommu *iommu, u32 dev_id)
+{
+	struct iommu_hwpt_alloc args = {
+		.size = sizeof(args),
+		.pt_id = iommu->ioas_id,
+		.dev_id = dev_id,
+	};
+
+	ioctl_assert(iommu->iommufd, IOMMU_HWPT_ALLOC, &args);
+	return args.out_hwpt_id;
+}
+
 static u32 iommufd_ioas_alloc(int iommufd)
 {
 	struct iommu_ioas_alloc args = {
@@ -415,17 +427,25 @@ static u32 iommufd_ioas_alloc(int iommufd)
 	return args.out_ioas_id;
 }
 
-struct iommu *iommu_init(const char *iommu_mode)
+static struct iommu *iommu_alloc(const char *iommu_mode)
 {
-	const char *container_path;
 	struct iommu *iommu;
-	int version;
 
 	iommu = calloc_assert(1, sizeof(*iommu));
 
 	INIT_LIST_HEAD(&iommu->dma_regions);
 
 	iommu->mode = lookup_iommu_mode(iommu_mode);
+	return iommu;
+}
+
+struct iommu *iommu_init(const char *iommu_mode)
+{
+	const char *container_path;
+	struct iommu *iommu;
+	int version;
+
+	iommu = iommu_alloc(iommu_mode);
 
 	container_path = iommu->mode->container_path;
 	if (container_path) {
@@ -449,10 +469,42 @@ struct iommu *iommu_init(const char *iommu_mode)
 	return iommu;
 }
 
+struct iommu *iommufd_iommu_init(int iommufd, u32 dev_id)
+{
+	struct iommu *iommu;
+
+	iommu = iommu_alloc("iommufd");
+
+	iommu->iommufd = dup(iommufd);
+	VFIO_ASSERT_GT(iommu->iommufd, 0);
+
+	iommu->ioas_id = iommufd_ioas_alloc(iommu->iommufd);
+	iommu->hwpt_id = iommufd_hwpt_alloc(iommu, dev_id);
+
+	return iommu;
+}
+
+static void iommufd_cleanup(struct iommu *iommu)
+{
+	struct iommu_destroy args = {
+		.size = sizeof(args),
+	};
+
+	if (iommu->hwpt_id) {
+		args.id = iommu->hwpt_id;
+		ioctl_assert(iommu->iommufd, IOMMU_DESTROY, &args);
+	}
+
+	args.id = iommu->ioas_id;
+	ioctl_assert(iommu->iommufd, IOMMU_DESTROY, &args);
+
+	VFIO_ASSERT_EQ(close(iommu->iommufd), 0);
+}
+
 void iommu_cleanup(struct iommu *iommu)
 {
 	if (iommu->iommufd)
-		VFIO_ASSERT_EQ(close(iommu->iommufd), 0);
+		iommufd_cleanup(iommu);
 	else
 		VFIO_ASSERT_EQ(close(iommu->container_fd), 0);
 
diff --git a/tools/testing/selftests/vfio/lib/vfio_pci_device.c b/tools/testing/selftests/vfio/lib/vfio_pci_device.c
index 774d1e90ec0e..81d3879d064f 100644
--- a/tools/testing/selftests/vfio/lib/vfio_pci_device.c
+++ b/tools/testing/selftests/vfio/lib/vfio_pci_device.c
@@ -469,15 +469,15 @@ int __vfio_device_bind_iommufd(int device_fd, int iommufd, const char *vf_token)
 	if (ioctl(device_fd, VFIO_DEVICE_BIND_IOMMUFD, &args))
 		return -errno;
 
-	return 0;
+	return args.out_devid;
 }
 
-static void vfio_device_bind_iommufd(int device_fd, int iommufd,
-				     const char *vf_token)
+int vfio_device_bind_iommufd(int device_fd, int iommufd, const char *vf_token)
 {
 	int ret = __vfio_device_bind_iommufd(device_fd, iommufd, vf_token);
 
-	VFIO_ASSERT_EQ(ret, 0, "Failed VFIO_DEVICE_BIND_IOMMUFD ioctl\n");
+	VFIO_ASSERT_GE(ret, 0, "Failed VFIO_DEVICE_BIND_IOMMUFD ioctl\n");
+	return ret;
 }
 
 static void vfio_device_attach_iommufd_pt(int device_fd, u32 pt_id)
@@ -503,10 +503,25 @@ static void vfio_pci_iommufd_setup(struct vfio_pci_device *device,
 				   const char *bdf, const char *vf_token)
 {
 	vfio_pci_cdev_open(device, bdf);
-	vfio_device_bind_iommufd(device->fd, device->iommu->iommufd, vf_token);
+	device->dev_id = vfio_device_bind_iommufd(device->fd, device->iommu->iommufd, vf_token);
 	vfio_device_attach_iommufd_pt(device->fd, device->iommu->ioas_id);
 }
 
+void vfio_pci_device_attach_iommu(struct vfio_pci_device *device, struct iommu *iommu)
+{
+	u32 pt_id = iommu->ioas_id;
+
+	/* Only iommufd supports changing struct iommu attachments */
+	VFIO_ASSERT_TRUE(iommu->iommufd);
+
+	if (iommu->hwpt_id)
+		pt_id = iommu->hwpt_id;
+
+	VFIO_ASSERT_NE(pt_id, 0);
+	vfio_device_attach_iommufd_pt(device->fd, pt_id);
+	device->iommu = iommu;
+}
+
 struct vfio_pci_device *vfio_pci_device_alloc(const char *bdf, struct iommu *iommu)
 {
 	struct vfio_pci_device *device;
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

