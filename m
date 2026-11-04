Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793757824;
	b=t9oH56OmMHPWZN+YCqwAmzepj9KrOK5DkmHds7YRSU3ul7zehuqUbt6tZQSREi61WODH
	 1SQ3Y3C4/W/T9SbNuquYimup6fRuNnsEY7Yi7EW4XHXBzxgE98M9016iwFnHYsh05qN5y
	 4Rw9S0GoENYEo28/lzUH8tDl+ey/NKyoVydf+4d6mLm1QAuaXmBgiNvRLJEfTWc7AZcOb
	 y0XVgLaW9NT7E1vR2S8mK4TgBNlNdhQBZ6WIfV0nOJJ5Xe6GJew54pcH6gkj/h6H70UH+
	 e8T6xon3oUhK4FFJX7m51YTo8mn6ZNJhRb+wAw0DN84HlXxupcz3DL9HKKJuxX98rbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793757824;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=xcyAzaTPZiwAw7CWkuV0s8KVDfnYJoff712343ApSNE=;
	b=Ro0R7H2rJQNU3S9YahOuuv93SJh04bbOUFat8Jo3dnFi8z596lkr9sWWL9mlK0P6jJiz
	 ZdlweJOs/t5mKNaWCnc7kxXtqciqWgu3i5ir4hvbcp4mq/dWDRdj2EsTpyJJIRo8fYXV7
	 y7JNmnto/Gg6r5GF1Px/TjlT9hT2ZccOYeRHQ0xPfIV/Meqw1qA2l2kmEfX/toMpnA9FC
	 WyUxmaZvFV8Kg29PY0cxTxovUSfrWUgNokiPN50RopMOcrt+u1mJ7vugDIurNLCAuAaPB
	 36Cz23uvgfvDQEwcbHeyeqOt7JAWqfps4wgRLLoJGHLwT2jdsLp20poiw89+dV9JeBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--sabujp.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=NQBTjbNT;
	arc=none smtp.remote-ip=74.125.82.200
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39245606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 02:03:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39245606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sabujp.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=NQBTjbNT
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-351788121cfso874916eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 18:03:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793757823; x=1794362623; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xcyAzaTPZiwAw7CWkuV0s8KVDfnYJoff712343ApSNE=;
        b=NQBTjbNTqD+OFtY0W2h9SGegYDR5+cuaN9ptVQg5yltyFqvQGus/D4Kz8M8aAmYfX0
         LZ97bSUNUiZdJK0mshOpzH3nsrODBNPAQetVPks3EA6Keh9EQW05r2qImkh0V1WguJ4m
         //8dtzvXlOk0zzwFQdjHbgFeQ51XfkHkvCTOD4v1CRqZ5tZdv0iU11ru7xZwTvaaoLmH
         HHYLNfvJrwZPeoAadsb1cgn5pLe5h9Rz9cQ5IJAV7xUL1syALWdPd3ep+oOzflEeIUP+
         fDo7LnZcPRYpLKEtxuEaVrqsWVi4LCR9THgVA/1I47teSg4RENjBZYhuUEqtuDwlyBIi
         xRFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793757823; x=1794362623;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xcyAzaTPZiwAw7CWkuV0s8KVDfnYJoff712343ApSNE=;
        b=b0V/Wm0IaOFZgac9Smb/U2cFljleKck6FFxTzINlTU3EZ0DnpfXfgfFYGqI/8pzoUh
         5KvxoE+II/ofqiNSx+CpthfgnQXujnQzwLHmGN/XuzbLIYRefjGY3ZK5y646Ncq9AeSh
         XcG6fcZP0P8t3OGEL/izyN+xVTJ6u7ItRoI4T6JbszjS7pz2lyARM1sMwpYPKfi2289k
         VrcHoPwciulViQuSAhfn5e92kgrcZLhkeFb61yVCjbP9nhpAHEl/54Muj4g/+VoBfUKh
         y+VumAGvr/uR50yDw6n2OGwwaY13I56v/sbV8wCZnoCRbJ7AXI4hNG2d0wmt2D0w7yeF
         ZZFA==
X-Forwarded-Encrypted: i=1; AKwUvBwoYCtSpfvnSQ7tXqePCusdhOcrMMlajXrswt2kMLOzURf9ahNvO3cGm4/YnCpGVw0Gme+Ky8w1HeTL1tY=@vger.kernel.org
X-Gm-Message-State: APuU4Z++flzsewY0BmFts0vdXzX6TFb7s3R09fvaHlPrn8X/5lRtLTc5
	UUUxE3Ns64BVVQbzK50s0moKyGUOuEGQdVzPDcTa3xWQpFWab/vSIn4IpIk63h2DemSROnsXwSY
	QUAhO2Q==
X-Received: from dynv12.prod.google.com ([2002:a05:7300:5a0c:b0:36c:9b55:8436])
 (user=sabujp job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:895c:10b0:369:f05d:6c5c
 with SMTP id 5a478bee46e88-36a4240f66emr23559790eec.28.1793757822858; Tue, 03
 Nov 2026 18:03:42 -0800 (PST)
Date: Tue,  3 Nov 2026 18:03:21 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
Message-ID: <20261104020321.77378-1-sabujp@google.com>
Subject: [PATCH] drm/amdgpu: check importer DMA addressing for P2P DMA-buf attachments
From: Sabuj Pattanayek <sabujp@google.com>
To: Alex Deucher <alexander.deucher@amd.com>, 
	"=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, stable@vger.kernel.org, 
	Sabuj Pattanayek <sabujp@google.com>
Content-Type: text/plain; charset="UTF-8"

amdgpu_dma_buf_attach() currently keeps attach->peer2peer enabled for
non-XGMI attachments whenever pci_p2pdma_distance() returns >= 0.
However, pci_p2pdma_distance() only verifies PCIe bridge topology and
does not check whether the importing device can DMA-address the
exporter's VRAM BAR physical address range.

When amdgpu_dma_buf_map() maps a VRAM BO for P2P via
amdgpu_vram_mgr_alloc_sgt() -> dma_map_resource(), if the importing
device is not behind a translating IOMMU DMA domain (IOMMU_DOMAIN_DMA or
IOMMU_DOMAIN_DMA_FQ) -- for example, when booted with iommu=pt or when
quirks_force_identity_mapping() places a GPU connected directly to an
AMD root port into IOMMU_DOMAIN_IDENTITY -- dma_direct_map_phys() checks
dma_capable() against the importer's DMA mask.

On systems where the exporter's 64-bit VRAM BAR is mapped above the
importer's DMA mask (such as a Radeon PRO W6400 with BAR 0 at
0x48030000000 paired with a 40-bit DMA mask Radeon PRO WX 3200 / Polaris
12 importer), dma_direct_map_phys() fails with DMA_MAPPING_ERROR and
warns:

[   18.421053] amdgpu 0000:c1:00.0: DMA addr 0x0000048038000000+8388608 overflow (mask ffffffffff, bus limit 0)

Because attach->peer2peer remained true, amdgpu_dma_buf_map() attempts
VRAM P2P mapping and fails with -EBUSY instead of falling back to GTT.
In multi-GPU desktop setups driving displays across both GPUs, this
breaks cross-GPU PRIME buffer sharing and causes compositors such as
gnome-shell and Xorg to fail command submission or crash on startup,
leaving the desktop unusable without manual IOMMU or sysfs workarounds.

Mirror the IOMMU remapping and BAR DMA mask check from
amdgpu_device_is_peer_accessible() (commit 75f0efbc4b3b ("drm/amdgpu:
Take IOMMU remapping into account for p2p checks")) in
amdgpu_dma_buf_attach() via a new amdgpu_dma_buf_is_p2p_addressable()
helper. Disabling attach->peer2peer when the importer cannot address the
exporter's VRAM aperture allows amdgpu_dma_buf_pin() and
amdgpu_dma_buf_map() to transparently fall back to GTT (system memory),
eliminating the DMA mapping overflow and restoring working multi-GPU
PRIME buffer sharing out of the box.

Fixes: 48262cd9499c ("drm/amdgpu: add checks if DMA-buf P2P is supported")
Cc: stable@vger.kernel.org
Signed-off-by: Sabuj Pattanayek <sabujp@google.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c | 31 ++++++++++++++++++++-
 1 file changed, 30 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
index bbe518757907..837330831eb2 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
@@ -42,6 +42,7 @@
 #include <drm/ttm/ttm_tt.h>
 #include <linux/dma-buf.h>
 #include <linux/dma-fence-array.h>
+#include <linux/iommu.h>
 #include <linux/pci-p2pdma.h>
 #include <linux/pm_runtime.h>
 
@@ -68,6 +69,33 @@ static struct amdgpu_device *dma_buf_attach_adev(struct dma_buf_attachment *atta
 	return NULL;
 }
 
+/**
+ * amdgpu_dma_buf_is_p2p_addressable - Check if importer can DMA-map exporter BAR
+ *
+ * @adev: exporter amdgpu_device
+ * @attach: DMA-buf attachment
+ *
+ * Returns:
+ * True if the importing device can address the exporter's CPU-visible VRAM
+ * aperture either via IOMMU DMA remapping or directly within its DMA mask.
+ */
+static bool amdgpu_dma_buf_is_p2p_addressable(struct amdgpu_device *adev,
+					      struct dma_buf_attachment *attach)
+{
+	struct iommu_domain *domain = iommu_get_domain_for_dev(attach->dev);
+	resource_size_t aper_limit;
+
+	if (domain && (domain->type == IOMMU_DOMAIN_DMA ||
+		       domain->type == IOMMU_DOMAIN_DMA_FQ))
+		return true;
+
+	if (!adev->gmc.aper_size)
+		return false;
+
+	aper_limit = adev->gmc.aper_base + adev->gmc.aper_size - 1;
+	return aper_limit <= dma_get_mask(attach->dev);
+}
+
 /**
  * amdgpu_dma_buf_attach - &dma_buf_ops.attach implementation
  *
@@ -98,7 +126,8 @@ static int amdgpu_dma_buf_attach(struct dma_buf *dmabuf,
 		attach->peer2peer = false;
 
 	if (!amdgpu_dmabuf_is_xgmi_accessible(attach_adev, bo) &&
-	    pci_p2pdma_distance(adev->pdev, attach->dev, false) < 0)
+	    (pci_p2pdma_distance(adev->pdev, attach->dev, false) < 0 ||
+	     !amdgpu_dma_buf_is_p2p_addressable(adev, attach)))
 		attach->peer2peer = false;
 
 	/*
-- 
2.56.0.385.gac671c819a-goog

