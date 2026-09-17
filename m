Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C36D4DA9A0
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 19:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789672199; cv=none; b=B1PiBZnhkploSsc3FIa+RWpIdpdZbG3VzVAQN6Okdcg3G9jbQ9Igd+dbvgRVVNZoM2lL4KimsTNFvmPbBhnjzbKlpmPT/4KV2KMixizAVcSNji+xpTT437jTk7VxWyG7NOWzSE4hH8mGZN7Mu9Bj1607nKAvFfqzgcofIUXNFiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789672199; c=relaxed/simple;
	bh=UHwBIlgGdXn7fbe3PU+LcElWhuv2EUNW+E4BuXEHjI4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CjbBwhpuml+82t2VetKgkfzdSBmX4NWYII3FImaSLd1P6hlV3avHVRk8/3BPj60lhIilnY16hqzarPmT+tGhoeyApliQYVs0IT3Te0+DHEePA4q+kogd5fr64v/GfUdd5DGbkaglhhmsjebIam1b3qM8AIHoCXvXKovx7wYm8wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cbrJaHpF; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cbrJaHpF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789672195;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RHd/Dk5Z3xxUsB7VKRWoo8mcH7HGTcC9gaNXWpM+1jM=;
	b=cbrJaHpF/uSRsRncZmytH2GqC8XSTBIoidwzeKBASRG6XT3awvl66lCFrjYJmEaoaHR6la
	ZfBl9jOjsZf8AhBuNAxcNwnRLnckFzhSzRvpOtV23F7PIZDzFqVxIyZ1X55DDg8/q+Y1TH
	cnat5kj6U6hwM6gw/6SK4DtUj8icTuk=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-460-jXrflQxCNBGwIkgJlFvpow-1; Thu,
 17 Sep 2026 15:09:51 -0400
X-MC-Unique: jXrflQxCNBGwIkgJlFvpow-1
X-Mimecast-MFC-AGG-ID: jXrflQxCNBGwIkgJlFvpow_1789672189
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 12F64183019B;
	Thu, 17 Sep 2026 19:09:49 +0000 (UTC)
Received: from GoldenWind.lan (unknown [10.22.64.177])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 85A2519AC047;
	Thu, 17 Sep 2026 19:09:46 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: Dave Airlie <airlied@redhat.com>,
	"Timur Tabi" <ttabi@nvidia.com>,
	"Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
	"Mohamed Ahmed" <mohamedahmedegypt2001@gmail.com>,
	"Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
	"Kees Cook" <kees@kernel.org>,
	"Simona Vetter" <simona@ffwll.ch>,
	"David Airlie" <airlied@gmail.com>,
	"Thomas Zimmermann" <tzimmermann@suse.de>,
	"Maxime Ripard" <mripard@kernel.org>,
	"Mel Henning" <mhenning@darkrefraction.com>,
	"Hongling Zeng" <zenghongling@kylinos.cn>,
	"Danilo Krummrich" <dakr@kernel.org>,
	"Lyude Paul" <lyude@redhat.com>
Subject: [PATCH v6 4/5] drm/nouveau/gsp/r570: Start saving comptag backing stores
Date: Thu, 17 Sep 2026 14:54:28 -0400
Message-ID: <20260917185916.1089621-5-lyude@redhat.com>
In-Reply-To: <20260917185916.1089621-1-lyude@redhat.com>
References: <20260917185916.1089621-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

One of the portions of OpenRM's fbsr process that we never implemented is
the saving and restoring of comptag backing stores. This isn't strictly
necessary for fbsr to work (as long as we don't specify bEnteringGcOff =
1), but implementing it brings us much closer to matching OpenRM's fbsr
process - which means we can rely on things being well tested on Nvidia's
side.

Now that we have the required driver workarounds in place and fetch the
required information from GSP's memsys on driver load, let's implement
support for this by fetching the required space for the compbit backing
stores and adding it to the amount of memory that we allocate for fbsr.

With this, we should be able to safely enable bEnteringGcOff in fbsr.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Reviewed-by: Dave Airlie <airlied@redhat.com>

---
V2:
* Fix object mismatch in r570_fb_get_compbit_store_size() (rm_ctrl_done
  and rm_ctrl_rd() were using different objects by mistake)
* Fix GSP object mismatchs
* Don't return the size of the compbit store directly from
  r570_fb_get_compbit_store_size(), this makes it impossible for us to
  return errors since it's a u64.

 .../nouveau/nvkm/subdev/gsp/rm/r570/fbsr.c    | 27 ++++++++++++++++++-
 .../nvkm/subdev/gsp/rm/r570/nvrm/fbsr.h       | 23 ++++++++++++++++
 2 files changed, 49 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/fbsr.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/fbsr.c
index f73d9b29e891d..a93a39ef7c690 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/fbsr.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/fbsr.c
@@ -26,6 +26,23 @@ r570_fbsr_suspend_channels(struct nvkm_gsp *gsp, bool suspend)
 	return nvkm_gsp_rm_ctrl_wr(&gsp->internal.device.subdevice, ctrl);
 }
 
+static int
+r570_fb_get_compbit_store_size(struct nvkm_gsp *gsp, u64 *size)
+{
+	NV0080_CTRL_FB_GET_COMPBIT_STORE_INFO_PARAMS *ctrl;
+
+	ctrl = nvkm_gsp_rm_ctrl_rd(&gsp->internal.device.object,
+				   NV0080_CTRL_CMD_FB_GET_COMPBIT_STORE_INFO,
+				   sizeof(*ctrl));
+	if (IS_ERR(ctrl))
+		return PTR_ERR(ctrl);
+
+	*size = ctrl->Size;
+
+	nvkm_gsp_rm_ctrl_done(&gsp->internal.device.object, ctrl);
+	return 0;
+}
+
 static int
 r570_memsys_enable_raw_comp_mode(struct nvkm_gsp *gsp, bool enable)
 {
@@ -135,7 +152,7 @@ r570_fbsr_suspend(struct nvkm_gsp *gsp)
 	struct nvkm_device *device = subdev->device;
 	struct nvkm_instmem *imem = device->imem;
 	struct nvkm_instobj *iobj;
-	u64 size;
+	u64 size, compbit_store_size;
 	int ret;
 
 	/* Stop channel scheduling. */
@@ -152,6 +169,12 @@ r570_fbsr_suspend(struct nvkm_gsp *gsp)
 			return ret;
 	}
 
+	ret = r570_fb_get_compbit_store_size(gsp, &compbit_store_size);
+	if (ret < 0)
+		return ret;
+	nvkm_debug(&gsp->subdev, "fbsr: Compbit backing store size: 0x%llx bytes\n",
+		   compbit_store_size);
+
 	/* Save BAR2 allocations to system memory. */
 	list_for_each_entry(iobj, &imem->list, head) {
 		if (iobj->preserve) {
@@ -174,6 +197,8 @@ r570_fbsr_suspend(struct nvkm_gsp *gsp)
 	size  = gsp->fb.heap.size;
 	size += gsp->fb.rsvd_size;
 	size += gsp->fb.bios.vga_workspace.size;
+	size += compbit_store_size;
+
 	nvkm_debug(subdev, "fbsr: size: 0x%llx bytes\n", size);
 
 	ret = nvkm_gsp_sg(device, size, &gsp->sr.fbsr);
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/nvrm/fbsr.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/nvrm/fbsr.h
index 9050a8274b273..cb3e448415b42 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/nvrm/fbsr.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/nvrm/fbsr.h
@@ -16,6 +16,29 @@ typedef struct NV2080_CTRL_INTERNAL_FBSR_INIT_PARAMS {
     NV_DECLARE_ALIGNED(NvU64 sysmemAddrOfSuspendResumeData, 8);
 } NV2080_CTRL_INTERNAL_FBSR_INIT_PARAMS;
 
+#define NV0080_CTRL_CMD_FB_GET_COMPBIT_STORE_INFO (0x801306) /* finn: Evaluated from "(FINN_NV01_DEVICE_0_FB_INTERFACE_ID << 8) | NV0080_CTRL_FB_GET_COMPBIT_STORE_INFO_PARAMS_MESSAGE_ID" */
+
+typedef struct NV0080_CTRL_FB_GET_COMPBIT_STORE_INFO_PARAMS {
+    NV_DECLARE_ALIGNED(NvU64 Size, 8);
+    NV_DECLARE_ALIGNED(NvU64 Address, 8);
+    NvU32 AddressSpace;
+    NvU32 MaxCompbitLine;
+    NvU32 comptagsPerCacheLine;
+    NvU32 cacheLineSize;
+    NvU32 cacheLineSizePerSlice;
+    NvU32 cacheLineFetchAlignment;
+    NV_DECLARE_ALIGNED(NvU64 backingStoreBase, 8);
+    NvU32 gobsPerComptagPerSlice;
+    NvU32 backingStoreCbcBase;
+    NvU32 comptaglineAllocationPolicy;
+    NV_DECLARE_ALIGNED(NvU64 privRegionStartOffset, 8);
+    NvU32 cbcCoveragePerSlice;
+} NV0080_CTRL_FB_GET_COMPBIT_STORE_INFO_PARAMS;
+
+#define NV0080_CTRL_CMD_FB_GET_COMPBIT_STORE_INFO_ADDRESS_SPACE_UNKNOWN 0 // ADDR_UNKNOWN
+#define NV0080_CTRL_CMD_FB_GET_COMPBIT_STORE_INFO_ADDRESS_SPACE_SYSMEM  1 // ADDR_SYSMEM
+#define NV0080_CTRL_CMD_FB_GET_COMPBIT_STORE_INFO_ADDRESS_SPACE_FBMEM   2 // ADDR_FBMEM
+
 #define NV2080_CTRL_CMD_INTERNAL_MEMSYS_PROGRAM_RAW_COMPRESSION_MODE (0x20800a6f) /* finn: Evaluated from "(FINN_NV20_SUBDEVICE_0_INTERNAL_INTERFACE_ID << 8) | NV2080_CTRL_INTERNAL_MEMSYS_PROGRAM_RAW_COMPRESSION_MODE_PARAMS_MESSAGE_ID" */
 
 typedef struct NV2080_CTRL_INTERNAL_MEMSYS_PROGRAM_RAW_COMPRESSION_MODE_PARAMS {
-- 
2.55.0

