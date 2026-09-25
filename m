Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2218D4DA9B8
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 16:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790352645; cv=none; b=NG01O8ShX7tvjjQtljD33v12RvrMMwTIXYQaXHnW+nnEdZOh/Pp2tsRtzpgJSLzCkKlAgq6wq3dD6SY9KDkxMzM4xIL7+n/swrL/tP1VpTpGR3h2fKTVR9CWwnnhhSaIKiIIm3VCgTzen+Opx30O66zwV0iPX04bAsKNQPXlXTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790352645; c=relaxed/simple;
	bh=7VEA427ZI5xoviEL+ab5QjV9AmDy8LeRj5+8UZplDTc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=U0vUj2rV7dRr1sqPglD1xAhnCors6tj+xVVE8cMYtKemApzI/EVemLdJRt6zpX+QXJZJMAcyAp0wBhcYjKhg8eVAb0q1f1xrXLJKUQObbHMjtN+MWiQgjD+WpLxebv9qNisJA9yF60aXuH1lWEGxIoSyLUDFrqA1TGlU7ucxtwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YeW5FInb; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YeW5FInb"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4980fe6b3beso12282565e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 09:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790352636; x=1790957436; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aH6diTs8gNRzCNhYXYtlFdmXwTeE1+K2YSTWsii/I0U=;
        b=YeW5FInbK2E3AeoHM3rgIC35a2IXQ+Xj874MtsxXexgn42V141RGfvvj935ze5FT26
         l+ylWXmjkbVAMXgXib85MENj8W6GNTyotlKC3nqvFSt54ha6tDQM1cIbs93VCRMbf5WS
         Eci8XARZvnwTTkS3u9fkNPECDDO6EdhFplQRBQhhdn47nDg+kr00UF0bnq4qCDnwADxy
         gnmaGNUBYoz9tStbl7LUjITmTcfRAn7HrfxD3Wz6HIlUBTrYIgqPdMoLEkaMFXxOkHOR
         ICOh8CpDzaTmgtaRoDMSHx9VD8kNeGAmH6W9ws4K00CsQF/EOAahR3quGaOSI8WJnT3Y
         PRCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790352636; x=1790957436;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aH6diTs8gNRzCNhYXYtlFdmXwTeE1+K2YSTWsii/I0U=;
        b=kHmQvIBMbsDVHXkrfseTEEK1l69WpCu8zfLkh7J8WHIwg308AuJJpNoAgtetn+ekU9
         BmwiC5c+AHWUiaf6PmP7X18g47JMqPajdiuZNSv1dYHP4q0uG+5DnHzhOsREmDw/RpkV
         ZGn6DBN5m/WhwSOUmQMPIqRLdn55qX77tG5j90pKE10CJ5uZrLEn40n+DKLnL7VQE1Bh
         iW3Ax4ZTACjO5x1/y2eVx2N/lq8WpLB8qFwUm5DHYc9yRv9kdh+lq+KKEKTr+wjlN4gq
         VfjKZ1h3poy7nr2xVoNqpNzwJBZ52Flhw7GAk5gbqWzGa5M3puq0U2fp7jKzkM+GL3Ig
         EgZg==
X-Forwarded-Encrypted: i=1; AKwUvByO+1AckjLkdoohhf/sIF7ZFyrQmTnmbUbos8k2JpYZxoksrasQPA8+FkCiMJRrXUzJTGT267SVOFKNYvk=@vger.kernel.org
X-Gm-Message-State: AFuF++k4b01kFBbfVGJeQinSB+EWJqnXPjJ+a++AQA5ajCz+fS9NmB5O
	yAZvtCCmBoN6diOB8E6TKE8+3rIbEj0rBNopHDL4mSRdlDQkbtAOPTY6
X-Gm-Gg: AYBFou1yd0Mq9nXi+wp1eaFJbnb/sj2w153J2bvlz2Xiv8ajhqEjImvjY2NpAeU3m3S
	hr/whG6yGgvAZD17Zb9uiOq1cTitT9ZVyTXJvc9cPM+VpJCW/r7tHtp06g2QrBT6auqKJ86WsIU
	6kqyB4lcvYHV0xMTLLxYp4phx7warlD6qz7c/8Kjx7WGXlz5pCJblCixb1gpaPHSPfGGK6PrsXg
	706G5wIkXCFRQpAVSf/bRkYADKVbdVQfCOp9mnO2HADB28/vZkpLkHwBHKPgrFlcrHTzX3zI+pz
	U96NRcoMD+7jMoh2UVRaA6W6ZtdKlz9NXwMuYct/zZopO6cy+eudMfHFY+/Lx9UmO+/Oz938KZK
	HDVFxGWCHJYkREXnTG0Ho10AdkT8CCBE/6tZ+ZiJtwxbPnpKKj0DNgeq2O8/prbISfwJDPhSG/z
	0ptaLgpZ+wVYvBZ7TEADAhr9Ik41lT1HLbfXInnE1rkUqor4ih8RHKZLXa1Csul3mprJrCQ/mgD
	UPAZeXc8JAq9N2ibRgTl2hK0funoIQL19KoXCCD3f9HrLuIOKPW0/E=
X-Received: by 2002:a05:600c:5955:b0:49f:e29f:55ec with SMTP id 5b1f17b1804b1-49fe66f1af5mr85015775e9.9.1790352636084;
        Fri, 25 Sep 2026 09:10:36 -0700 (PDT)
Received: from andreayoga.wind3.hub ([31.189.116.68])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a64f9bcsm8196828f8f.32.2026.09.25.09.10.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 09:10:35 -0700 (PDT)
From: Andrea Parri <parri.andrea@gmail.com>
To: Alex Williamson <alex@shazbot.org>,
	Ankit Agrawal <ankita@nvidia.com>
Cc: Andrea Parri <parri.andrea@gmail.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Yishai Hadas <yishaih@nvidia.com>,
	Shameer Kolothum <skolothumtho@nvidia.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Jiaqi Yan <jiaqiyan@google.com>,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] vfio/nvgrace-gpu: Skip PFN registration for empty memory regions
Date: Fri, 25 Sep 2026 18:10:16 +0200
Message-ID: <20260925161024.189771-1-parri.andrea@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

nvgrace_gpu_open_device() registers nvdev->resmem only when it has a
length, but registers nvdev->usemem unconditionally.  In fallback mode,
where the ACPI memory properties are missing or the C2C link is down,
usemem.memlength is zero, so the empty region is still registered.

register_pfn_address_space() then inserts a node covering
[0, ULONG_MAX].  Nothing removes it, because the fallback device table
closes through vfio_pci_core_close_device() rather than
nvgrace_gpu_close_device().  A second open fails with -EBUSY, and once
the device is unbound the node outlives the nvdev that contains it, so a
later registration or a memory-failure event walks freed memory.

The node also captures every memory-failure report for a PFN with no
struct page.  The callback rejects every VMA of the fallback device, so
no process is killed, but the failure is logged as MF_RECOVERED rather
than MF_IGNORED.

Guard the usemem registration with its length, matching the resmem
handling.  Fallback mode then registers nothing and the existing close
path is correct.  Guard the unregistration the same way.

On the unfixed tree a second open after unbind reports:

  BUG: KASAN: slab-use-after-free in interval_tree_iter_first+0x209/0x310
  ...
   interval_tree_iter_first+0x209/0x310
   register_pfn_address_space+0x97/0x100
   nvgrace_gpu_open_device+0x21c/0x730
   vfio_df_open+0x213/0x520
  ...
  Allocated by task 152:
   _vfio_alloc_device+0x3a/0x500
   nvgrace_gpu_probe+0xcb/0x660

The fix should be safe because memlength already decided whether the
range was meaningful: full mode always has a nonzero usemem.memlength,
and fallback mode never calls nvgrace_gpu_close_device().  The guard
only skips a registration that could never have been unregistered.

Fixes: e5f19b619fa0 ("vfio/nvgrace-gpu: register device memory for poison handling")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Andrea Parri <parri.andrea@gmail.com>
---
Tested on x86-64 under virtme-ng with KASAN, not on Grace hardware. The
driver was bound through driver_override to a QEMU cxl-type3 function,
whose CXL Device DVSEC reports the memory as valid and active, so probe
takes the fallback path; the device was opened through a noiommu VFIO
cdev. Without the patch the second open fails with -EBUSY and, after
unbind and rebind, the next open hits the KASAN report quoted above.
With the patch neither happens.

 drivers/vfio/pci/nvgrace-gpu/main.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/vfio/pci/nvgrace-gpu/main.c b/drivers/vfio/pci/nvgrace-gpu/main.c
index 963fd8ded20d1..326b991732148 100644
--- a/drivers/vfio/pci/nvgrace-gpu/main.c
+++ b/drivers/vfio/pci/nvgrace-gpu/main.c
@@ -207,9 +207,12 @@ static int nvgrace_gpu_open_device(struct vfio_device *core_vdev)
 			goto error_exit;
 	}
 
-	ret = nvgrace_gpu_vfio_pci_register_pfn_range(core_vdev, &nvdev->usemem);
-	if (ret && ret != -EOPNOTSUPP)
-		goto register_mem_failed;
+	if (nvdev->usemem.memlength) {
+		ret = nvgrace_gpu_vfio_pci_register_pfn_range(core_vdev,
+							      &nvdev->usemem);
+		if (ret && ret != -EOPNOTSUPP)
+			goto register_mem_failed;
+	}
 
 	vfio_pci_core_finish_enable(vdev);
 	nvdev->bar0_base = io;
@@ -235,7 +238,8 @@ static void nvgrace_gpu_close_device(struct vfio_device *core_vdev)
 	if (nvdev->resmem.memlength)
 		unregister_pfn_address_space(&nvdev->resmem.pfn_address_space);
 
-	unregister_pfn_address_space(&nvdev->usemem.pfn_address_space);
+	if (nvdev->usemem.memlength)
+		unregister_pfn_address_space(&nvdev->usemem.pfn_address_space);
 
 	/* Unmap the mapping to the device memory cached region */
 	if (nvdev->usemem.memaddr) {

base-commit: f49a343b305c0b6c19a3b50c0bbf10bcd0e2e8fd
-- 
2.53.0

