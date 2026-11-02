Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793633845;
	b=Y6XO+NAacPV0Wc1kR37MT3/zNwHsS3bLmnrvk67zxJ6q6xdqReHD/xh3FtDfUHawVTrE
	 lO9kcjTWActsB8Ac60ZgYfjDXEJJrEivBgXVU+5QtKO4YiwwZhZoRY0SHviEkjo+jqZOX
	 uU5lD17WsU/nO07pkhEQTqBdPSFwOjoqaCaS3kX1aO9ID9sB3R81PmutJRZ/Ytyy9AEQV
	 FZNJWftL8ZefhgtGlm7Lg2kSQB9VsSsG6D5W4VvCxkaygCK6znt6xY14C6y6e+f4WWgtc
	 dKv7wCt/x3/W1qsSgwOWkTydxqKpb3rRDhDtDt4kX5ysVX2GZ5QjU3+dDXjJiUzd32A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793633845;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=HVnfWSj8ZzZvrderQaZLMWS7UwjUc+ra7btm+XE8Eyg=;
	b=Bkid8yr96Dum59ezXZoGNJZ7L8kHfQST6AK+8einuhlLxTPfn2uw8qUslKPuNzEypQOD
	 bxybCr26v2PqrUiMZZv/OeKQ5qpJf9uszD/RZa9Gtau8wOSvPyNgsPIlmiK/Foihh1DYZ
	 aUYf5dS9klXDy1RvvruS5/lXCojGGk8swz1fAC8UEn7EuZiCaZiSoR+VgjxokzyxGzPgG
	 KnqEWPNE32HO3/JLDdqrbsNwDE7Kmw5fzuMltKcitlZAIa26LH8kfwfkPyQIc2VPqjEEh
	 B2MFYiHj8/5yGf4EkH8l2ab8KsvhM8+UJDwWqyx002PNk+lMb/YNasU8IeupWDmH5FQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--vipinsh.bounces.google.com;
	arc=none smtp.remote-ip=209.85.216.72
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 189C860EA5DC
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 15:37:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 189C860EA5DC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vipinsh.bounces.google.com
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ae73921fd1so2664688a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 07:37:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793633839; x=1794238639; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HVnfWSj8ZzZvrderQaZLMWS7UwjUc+ra7btm+XE8Eyg=;
        b=YuNUml4zH5ZHRF+F04Y7wZI2Du7rDKxyBW+kJiSWbxaOMaxfx2YJgwtnteKndFaeMU
         98s6w51k5AYecfjYWhc3MYYHhUtImK75pts8pb+0GFwvFi7w0vtp9tj1PZmkGZsV84gJ
         xPCJPb4d3wfZIT4to5hUUq9Ao2dMaNm77qyY/QVJWg7pFYQ7A/yDVdNKewYByOOnTmhL
         t6zR/lVN3HCZ8Incyv+jQRM9rZdS/VIMvk8nWsYXE51hvqRk+W0ZvCwFPcmUuoMMAiNd
         0YrrXkQ+z9u3VqHi+8vh4p49Wncxt6fL/niRcmmRcPZMou2OxoCHoSmc018ApFcTj0RM
         vI2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793633839; x=1794238639;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HVnfWSj8ZzZvrderQaZLMWS7UwjUc+ra7btm+XE8Eyg=;
        b=qnfGtrSxI6lnhBxhmdGPMxpMa9rZd9LALWIen2UttH/ya/V4LECvRhGrVcemgvrfqp
         fnpXQizbfndx90/yOnQ8b7Q/7N60AwvzUKZET7tabBQHvy3jkzX3WAnxRU1C58ffeeF+
         WFmn113FXHmNIsRXUK51fJsDgbO369E3ejR17gFRKho6NO2uS+lR5jBf7TqRyCkbIiTQ
         1hs+5dzZsjt0NkOo7yuA8Pi0XsEZ3TDrK1fFvrAeZyt8W+GKE9o3t05HQirWrC9MdMRx
         MqlNE05Tk8ng68CxUe2Y0g/KLc6kuLofmrdadeh7WsPujTz1tQuUedtwsfz2o8S1u6T0
         qcBw==
X-Forwarded-Encrypted: i=1; AKwUvBzRcK+SKB1q1dsAgZoZRH2rtqzcWFa3pf4H3WWCLxd2+7jIUjV5RtQTtbWXzNoKPs4rcMUhYvLhuTW6LhY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/poW7G6Xym6mn05ExfQAJ5yjWRaqdIvHB2md1LtJCYJiOIkhWM
	3BZFMcuka6FTrQXobDWmrDMN6muu94sf+zr4mZXQ2QI39fmumQfIBXbMfDVnNh8/+eve0icFYUw
	TofO/k3dNig==
X-Received: from pjat8.prod.google.com ([2002:a17:90a:d08:b0:3ac:3195:12b4])
 (user=vipinsh job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5870:b0:3ad:6090:a189
 with SMTP id 98e67ed59e1d1-3ae8983e2f3mr7697277a91.45.1793633839167; Mon, 02
 Nov 2026 07:37:19 -0800 (PST)
Date: Mon,  2 Nov 2026 07:36:47 -0800
In-Reply-To: <20261102153656.1431701-1-vipinsh@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261102153656.1431701-1-vipinsh@google.com>
X-Mailer: git-send-email 2.56.0.317.g454f8302e1-goog
Message-ID: <20261102153656.1431701-19-vipinsh@google.com>
Subject: [PATCH v6 18/27] vfio: selftests: Initialize vfio_pci_device using a
 VFIO cdev FD
From: Vipin Sharma <vipinsh@google.com>
To: kexec@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, kvm@vger.kernel.org, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, linux-pci@vger.kernel.org
Cc: ajayachandra@nvidia.com, alex@shazbot.org, amastro@fb.com, 
	ankita@nvidia.com, apopple@nvidia.com, bhelgaas@google.com, chrisl@kernel.org, 
	christian.koenig@amd.com, corbet@lwn.net, dmatlack@google.com, 
	graf@amazon.com, jacob.pan@linux.microsoft.com, jgg@nvidia.com, jgg@ziepe.ca, 
	jrhilke@google.com, julianr@linux.ibm.com, kees@kernel.org, 
	kevin.tian@intel.com, leon@kernel.org, leonro@nvidia.com, lukas@wunner.de, 
	mattev@meta.com, michal.winiarski@intel.com, parav@nvidia.com, 
	pasha.tatashin@soleen.com, praan@google.com, pratyush@kernel.org, 
	rananta@google.com, rdunlap@infradead.org, rientjes@google.com, 
	rodrigo.vivi@intel.com, rppt@kernel.org, saeedm@nvidia.com, 
	schnelle@linux.ibm.com, skhan@linuxfoundation.org, skhawaja@google.com, 
	vipinsh@google.com, vivek.kasireddy@intel.com, witu@nvidia.com, 
	yanjun.zhu@linux.dev, yi.l.liu@intel.com
Content-Type: text/plain; charset="UTF-8"

Use the given VFIO cdev FD to initialize vfio_pci_device in VFIO
selftests. Add the assertion to make sure that passed cdev FD is not
used with legacy VFIO APIs. If VFIO cdev FD is provided then do not open
the device instead use the FD for any interaction with the device.

This API will allow writing selftests where VFIO device FD is preserved
using liveupdate and retrieved later using liveupdate ioctl after kexec.

Co-developed-by: David Matlack <dmatlack@google.com>
Signed-off-by: David Matlack <dmatlack@google.com>
Signed-off-by: Vipin Sharma <vipinsh@google.com>
---
 .../lib/include/libvfio/vfio_pci_device.h     |  3 +++
 .../selftests/vfio/lib/vfio_pci_device.c      | 25 ++++++++++++++-----
 2 files changed, 22 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/vfio/lib/include/libvfio/vfio_pci_device.h b/tools/testing/selftests/vfio/lib/include/libvfio/vfio_pci_device.h
index e19bd94b8dd2..9a62bfb6b440 100644
--- a/tools/testing/selftests/vfio/lib/include/libvfio/vfio_pci_device.h
+++ b/tools/testing/selftests/vfio/lib/include/libvfio/vfio_pci_device.h
@@ -40,6 +40,9 @@ struct vfio_pci_device {
 
 struct vfio_pci_device *vfio_pci_device_alloc(const char *bdf, struct iommu *iommu);
 void vfio_pci_device_free(struct vfio_pci_device *device);
+struct vfio_pci_device *__vfio_pci_device_init(const char *bdf,
+					       struct iommu *iommu,
+					       int device_fd);
 struct vfio_pci_device *vfio_pci_device_init(const char *bdf, struct iommu *iommu);
 void vfio_pci_device_cleanup(struct vfio_pci_device *device);
 
diff --git a/tools/testing/selftests/vfio/lib/vfio_pci_device.c b/tools/testing/selftests/vfio/lib/vfio_pci_device.c
index 4063a0e2b3df..af789c859586 100644
--- a/tools/testing/selftests/vfio/lib/vfio_pci_device.c
+++ b/tools/testing/selftests/vfio/lib/vfio_pci_device.c
@@ -457,9 +457,13 @@ void vfio_pci_cdev_open(struct vfio_pci_device *device, const char *bdf)
 }
 
 static void vfio_pci_iommufd_setup(struct vfio_pci_device *device,
-				   const char *bdf, const char *vf_token)
+				   const char *bdf, int device_fd,
+				   const char *vf_token)
 {
-	vfio_pci_cdev_open(device, bdf);
+	if (device_fd >= 0)
+		device->fd = device_fd;
+	else
+		vfio_pci_cdev_open(device, bdf);
 	vfio_device_bind_iommufd(device->fd, device->iommu->iommufd, vf_token);
 	vfio_device_attach_iommufd_pt(device->fd, device->iommu->ioas_id);
 }
@@ -482,16 +486,20 @@ void vfio_pci_device_free(struct vfio_pci_device *device)
 	free(device);
 }
 
-struct vfio_pci_device *vfio_pci_device_init(const char *bdf, struct iommu *iommu)
+struct vfio_pci_device *__vfio_pci_device_init(const char *bdf,
+					       struct iommu *iommu,
+					       int device_fd)
 {
 	struct vfio_pci_device *device;
 
 	device = vfio_pci_device_alloc(bdf, iommu);
 
-	if (iommu->mode->container_path)
+	if (iommu->mode->container_path) {
+		VFIO_ASSERT_EQ(device_fd, -1);
 		vfio_pci_container_setup(device, bdf, NULL);
-	else
-		vfio_pci_iommufd_setup(device, bdf, NULL);
+	} else {
+		vfio_pci_iommufd_setup(device, bdf, device_fd, NULL);
+	}
 
 	vfio_pci_device_setup(device);
 	vfio_pci_driver_probe(device);
@@ -499,6 +507,11 @@ struct vfio_pci_device *vfio_pci_device_init(const char *bdf, struct iommu *iomm
 	return device;
 }
 
+struct vfio_pci_device *vfio_pci_device_init(const char *bdf, struct iommu *iommu)
+{
+	return __vfio_pci_device_init(bdf, iommu, /*device_fd=*/-1);
+}
+
 void vfio_pci_device_cleanup(struct vfio_pci_device *device)
 {
 	int i;
-- 
2.56.0.317.g454f8302e1-goog

