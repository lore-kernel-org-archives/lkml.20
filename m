Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.132.180.163
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794256586;
	b=CAaSgpALDwaG8RW+ZCn2bmza/ly54fwgLhzTtLrYPoLUzrMJsRPe53ArghI1HJx/yaxE
	 ZcsJwaCdxCpx66dk62e7wymXOvx42tvLrjTKPaZ2xVv4ThJgafiNLoPcVWlbnsy/8Ogn3
	 IwIInq/nQqNYBWLWkpJgPwZdjHHa10ZhkGAtVwbswwMs3TTaegEZoTjoljc8N9Vb/QRIM
	 RIv8lJi/FkIb2Js4Eht/6h/vK0xczIufs2oBQkkfaEfIaUMP4aoZsJxGTqq0KFLAyBRnN
	 ntMi3Rd/7UIfWfa8wOuv25sui7BglzMbtkIYl7XAhwWE+SLlVneLktl3tdeFL1KAV8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794256586;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-ID:References:In-Reply-To:To:CC:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Originating-IP:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID;
	bh=3em69XCIPb+H+EJhS2TKBVreoizkbCywAkNWCOMD3Ws=;
	b=OhcarvCDADAar3xfIHp5utn3Bl9xOdJmM0Ld8xGq1EdJgVYreaULCyx8cXkjQHlgYcT0
	 QZ4ACbQ54+/pHha2z4QqQ9xGkpHc/Jyf23oxCiU2WjJ84sLsLjNdnueiCjO2CF28BurRL
	 LWaoRo5RimDAPsZmcGNWJy6LeIslFFwalkH33UO+dQvoiyxfKwumjS7V5WtboSjZ1hZMC
	 Xk0/nSUStL3WjEi66A231oYXki70Uur+G7pg+lNGVQbw7z0sSdUy9f+s46pOGMrELa3Cc
	 GNnxRHgBsRIMQNMG5t0z2YihCTLp10jfFZc/EfA24lABgBZFBoKZp1TLUUpzeDmUzFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=imgtec.com;
	spf=pass smtp.mailfrom=imgtec.com;
	dkim=pass header.d=imgtec.com header.i=@imgtec.com header.a=rsa-sha256 header.s=dk201812 header.b=KT1fe+vS;
	arc=none smtp.remote-ip=185.132.180.163
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com [185.132.180.163])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF69D606A325
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 20:36:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF69D606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imgtec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imgtec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=imgtec.com header.i=@imgtec.com header.a=rsa-sha256 header.s=dk201812 header.b=KT1fe+vS
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
	by mx07-00376f01.pphosted.com (8.18.1.12/8.18.1.12) with ESMTP id 6A9Jxrvo3422877;
	Mon, 9 Nov 2026 20:36:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=dk201812; bh=3
	em69XCIPb+H+EJhS2TKBVreoizkbCywAkNWCOMD3Ws=; b=KT1fe+vSiY+AJqP4B
	U+TmnbWekeDmkUsIsoxIHHlvEX+1jBQ+BSeLrt1K3yClUeNAGv1vmFN9Zvj/Qojd
	vPubskB+5ZlyMgHqw/w4EKeQufZFe1HoHoi1yek8+4KByV5CmucZqiq8Y5+kEonW
	99mR5FZZ9OFlW5ZvoABR58ib7ZwMC5+qWU96PgaI6iHvb6LdS3FOg4pungrnV7qV
	OYTgJZRV9TW38BCx2Mp9oD4bfB7wyx5j6Faf7C4hO3362YIPv0yRBfqbNeh3ghw7
	VU5SAjPUoHV7b/E6w4MpvgGFolPl7JBnj/ECPQtqRXYFlfg04oMwYfJA70W1VhrZ
	SB7Rw==
Received: from hhmail01.hh.imgtec.org (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
	by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 4hsvxx1tk3-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT key_exchange=secp384r1);
	Mon, 09 Nov 2026 20:36:06 +0000 (GMT)
Received: from [127.0.1.1] (172.25.6.177) by HHMAIL01.hh.imgtec.org
 (10.100.10.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Mon, 9 Nov
 2026 20:36:05 +0000
From: Luigi Santivetti <luigi.santivetti@imgtec.com>
Date: Mon, 9 Nov 2026 20:35:22 +0000
Subject: [PATCH v2 2/2] drm/imagination: clamp count of heaps and static
 areas for legacy UM
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261109-ioctl-query-count-stride-fixes-v2-2-228ea0e28dc3@imgtec.com>
References: <20261109-ioctl-query-count-stride-fixes-v2-0-228ea0e28dc3@imgtec.com>
In-Reply-To: <20261109-ioctl-query-count-stride-fixes-v2-0-228ea0e28dc3@imgtec.com>
To: Alessio Belle <alessio.belle@imgtec.com>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: <imagination@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
        <linux-kernel@vger.kernel.org>, <frank.binns@imgtec.com>,
        <brajesh.gupta@imgtec.com>,
        Luigi Santivetti <luigi.santivetti@imgtec.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794256564; l=7582;
 i=luigi.santivetti@imgtec.com; s=20260707; h=from:subject:message-id;
 bh=6iBK6/O7fBcDgOfvs84MkoPo956p4bwVDyK7QfZd7PQ=;
 b=9xS2F3T/uo39afViGQ638Cy97Sc3AOH2DFqoCIRJbsOsYbM8hAUekeKoZCpI9nHhwImYQtnTp
 gfCmlXWVemBBHj5251kH+NAHLUUy2TkfYI/txsluOSmZxX6eprx1Wny
X-Developer-Key: i=luigi.santivetti@imgtec.com; a=ed25519;
 pk=jS7sCDyWFMopn8iAXVN+AdJi+Z3fZPQKsS5NdQtI+sc=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA4MiBTYWx0ZWRfX/VA5FTEUPQYe
 2rC7dc35MHb7MEEpNiAEfgtM1gPRoz8H9sIZaqY8C32p27M2MIHjtdxamnB8nqXhH+y99YgVLEv
 UEB3oDyKBfJF8M5v0i/Qo+ZnuNmkO9M=
X-Proofpoint-ORIG-GUID: D_9hJcviRXYYh19t3A3_ltFtvX3chJTQ
X-Authority-Analysis: v=2.4 cv=H+JOUOYi c=1 sm=1 tr=0 ts=6af22eb6 cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=2JH569OHYJkA:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=kQ-hrUj2-E3RCbRHssb7:22 a=7RYWX5rxfSByPNLylY2M:22
 a=e5mUnYsNAAAA:8 a=r_1tXGB3AAAA:8 a=NjuOHxGiqyyvwl9FGpwA:9 a=QEXdDO2ut3YA:10
 a=Vxmtnl_E_bksehYqCbjh:22 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA4MiBTYWx0ZWRfXxY3+tGwXd74d
 I9/2I/mR5dTn4P/k8osoNaQXKTCVAugdC7Hz6N6lzbLj0XYFo/TrbiOXU+SZ0+Kvv95CDY1eys2
 REiradnzOwjoNdyYyrnllW6oqviKwnFdCBLRpR5Dpm5em1JZLUnju8zladN3fFDC9/6nvUaG49O
 FtE15Y+V7kuVD0cawqzeb+4schmLpKYq91O6gAYryAMWgd9BhTL98rzIidDQ15XsXCQHPys40ZV
 y0ZpearO8QjPUjRErW9rqTmDFpMLMsZlLBTlQUzT6wUv6195SCTncL0hnHJDFyhcno6rIqO9IH/
 zSyFLDo1/AgJn7JSRnaSmTIp4r9X/kpWzLAiPI8QIZrq3/eKiDYer+ogQEJxjyDivczZlZJh8Io
 NJZYV+BjiDj2IUvfJu3L5akvUNX2Tbu4HjGznnUqnKyqE2EzsT+MGgzeKgUFg/RmCGoMk/dN4qF
 4X9yUuiKkqxKq9Akkwg==
X-Proofpoint-GUID: D_9hJcviRXYYh19t3A3_ltFtvX3chJTQ

Userspace mishandled the count of DRM PVR heaps returned by the kernel in
the DRM_PVR_DEV_QUERY_HEAP_INFO_GET ioctl call. In particular not taking
into account that the value of count returned by the kernel can be larger
than the count defined in userspace. This issue hasn't manifested itself
so far because no new DRM PVR heap has ever been introduced, however new
heaps are expected to be added in the future.

Userspace fixed this problem with 2a983a3a in [1]. For the kernel, it is
possible to be safe with respect to those versions of userspace predating
the fix and at the same time to preserve backwards compatibility.

After this change, future versions of userspace can keep using the ioctl in
the exact same way they do now and, in addition, they _can_ use the newly
introduced pattern for querying the minimum and the maximum value of
supported heaps by following the documentation that is available in the
UAPI header.

DRM_PVR_STATIC_DATA_AREA_COUNT_MIN_SUPPORTED was added in order to keep the
DRM_PVR_DEV_QUERY_HEAP_INFO_GET and DRM_PVR_DEV_QUERY_STATIC_DATA_AREAS_GET
ioctls consistent with each other, but there is no known mishandling in the
latter from userspace.

[1] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/44456

Signed-off-by: Luigi Santivetti <luigi.santivetti@imgtec.com>
---
 drivers/gpu/drm/imagination/pvr_drv.h | 12 ++++++++++++
 drivers/gpu/drm/imagination/pvr_vm.c  | 18 ++++++++++++++++--
 include/uapi/drm/pvr_drm.h            | 28 ++++++++++++++++++++++++----
 3 files changed, 52 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/imagination/pvr_drv.h b/drivers/gpu/drm/imagination/pvr_drv.h
index db3ffe55af29..31b86286d348 100644
--- a/drivers/gpu/drm/imagination/pvr_drv.h
+++ b/drivers/gpu/drm/imagination/pvr_drv.h
@@ -93,6 +93,18 @@ int pvr_set_uobj_array(const struct drm_pvr_obj_array *out, u32 min_stride, u32
 #define DRM_PVR_STATIC_DATA_AREA_STRIDE_MIN_SUPPORTED \
 	PVR_UOBJ_MIN_SIZE_INTERNAL(struct drm_pvr_static_data_area, offset)
 
+/*
+ * Value of DRM_PVR_HEAP_COUNT in the first released version of enum
+ * drm_pvr_heap_id for Rogue cores.
+ */
+#define DRM_PVR_HEAP_COUNT_MIN_SUPPORTED (DRM_PVR_HEAP_TRANSFER_FRAG + 1)
+
+/*
+ * Count of static areas in the first released version of struct
+ * drm_pvr_static_data_area static_data_areas[] for Rogue cores.
+ */
+#define DRM_PVR_STATIC_DATA_AREA_COUNT_MIN_SUPPORTED 5U
+
 /**
  * PVR_UOBJ_GET() - Copies from _src_usr_ptr to &_dest_obj.
  * @_dest_obj: The destination container object in kernel space.
diff --git a/drivers/gpu/drm/imagination/pvr_vm.c b/drivers/gpu/drm/imagination/pvr_vm.c
index 6d11b85e5ec5..e47ee50906da 100644
--- a/drivers/gpu/drm/imagination/pvr_vm.c
+++ b/drivers/gpu/drm/imagination/pvr_vm.c
@@ -927,6 +927,9 @@ static const struct drm_pvr_static_data_area static_data_areas[] = {
 /*
  * The values given to GET_RESERVED_SIZE() are taken from the last entry in the corresponding
  * static data area for each heap.
+ *
+ * The pvr_heaps array **must** initialize **all** heaps that are enumerated in the UAPI with
+ * enum drm_pvr_heap_id.
  */
 static const struct drm_pvr_heap pvr_heaps[] = {
 	[DRM_PVR_HEAP_GENERAL] = {
@@ -967,6 +970,8 @@ static const struct drm_pvr_heap pvr_heaps[] = {
 	},
 };
 
+static_assert(ARRAY_SIZE(pvr_heaps) == DRM_PVR_HEAP_COUNT, "Invalid number of PVR heaps");
+
 int
 pvr_static_data_areas_get(const struct pvr_device *pvr_dev,
 			  struct drm_pvr_ioctl_dev_query_args *args)
@@ -985,13 +990,18 @@ pvr_static_data_areas_get(const struct pvr_device *pvr_dev,
 
 	if (!query.static_data_areas.array) {
 		u32 *stride = &query.static_data_areas.stride;
+		u32 *count = &query.static_data_areas.count;
 
 		if (!query.static_data_areas.stride)
 			*stride = DRM_PVR_STATIC_DATA_AREA_STRIDE_MIN_SUPPORTED;
 		else
 			*stride = sizeof(struct drm_pvr_static_data_area);
 
-		query.static_data_areas.count = ARRAY_SIZE(static_data_areas);
+		if (!query.static_data_areas.count)
+			*count = DRM_PVR_STATIC_DATA_AREA_COUNT_MIN_SUPPORTED;
+		else
+			*count = ARRAY_SIZE(static_data_areas);
+
 		goto copy_out;
 	}
 
@@ -1035,7 +1045,11 @@ pvr_heap_info_get(const struct pvr_device *pvr_dev,
 		else
 			query.heaps.stride = sizeof(struct drm_pvr_heap);
 
-		query.heaps.count = ARRAY_SIZE(pvr_heaps);
+		if (!query.heaps.count)
+			query.heaps.count = DRM_PVR_HEAP_COUNT_MIN_SUPPORTED;
+		else
+			query.heaps.count = ARRAY_SIZE(pvr_heaps);
+
 		goto copy_out;
 	}
 
diff --git a/include/uapi/drm/pvr_drm.h b/include/uapi/drm/pvr_drm.h
index 9e432f3ad7b4..4ff50dc56c8d 100644
--- a/include/uapi/drm/pvr_drm.h
+++ b/include/uapi/drm/pvr_drm.h
@@ -322,8 +322,13 @@ struct drm_pvr_dev_query_heap_info {
 	 * @heaps: Array of &struct drm_pvr_heap. To facilitate allocation by
 	 * the caller:
 	 *
-	 * - if &heaps.array is NULL, the count will be updated with the count
-	 *   of heaps known to the kernel driver.
+	 * - if &heaps.array is NULL and &heaps.count is set by the caller, the
+	 *   count will be updated with the value of @DRM_PVR_HEAP_COUNT that
+	 *   is known to the kernel driver.
+	 *
+	 * - if &heaps.array is NULL and &heaps.count is zero, the count will
+	 *   be updated with a value that is the minimum supported by the kernel
+	 *   and this may differ based on the GPU ID.
 	 *
 	 * - If &heaps.array is NULL and &heaps.stride is set by the caller, the
 	 *   stride will be updated to the size of &struct drm_pvr_heap known to
@@ -332,6 +337,11 @@ struct drm_pvr_dev_query_heap_info {
 	 * - If &heaps.array is NULL and &heaps.stride is zero, the stride will
 	 *   be updated with a value that is the minimum supported by the kernel
 	 *   and this may differ based on the GPU ID.
+	 *
+	 * - If &heaps.array, &heaps.stride and &heaps.count are set by the
+	 *   caller, then the kernel will try to honor the value of count and
+	 *   this may be clamped to the value of @DRM_PVR_HEAP_COUNT known by
+	 *   the kernel.
 	 */
 	struct drm_pvr_obj_array heaps;
 };
@@ -440,8 +450,13 @@ struct drm_pvr_dev_query_static_data_areas {
 	 * @static_data_areas: Array of &struct drm_pvr_static_data_area. To
 	 * facilitate allocation by the caller:
 	 *
-	 * - if &static_data_areas.array is NULL, the count will be updated with
-	 *   the count of static areas known to the kernel driver.
+	 * - if &static_data_areas.array is NULL and &static_data_areas.count is
+	 *   set by the caller, the count will be updated with the maximum count
+	 *   that is known to the kernel driver.
+	 *
+	 * - If &static_data_areas.array is NULL and &static_data_areas.count is
+	 *   zero, the count will be updated with a value that is the minimum
+	 *   supported by the kernel and this may differ based on the GPU ID.
 	 *
 	 * - If &static_data_areas.array is NULL and &static_data_areas.stride
 	 *   is set by the caller, the stride will be updated to the size of
@@ -451,6 +466,11 @@ struct drm_pvr_dev_query_static_data_areas {
 	 *   is zero, the stride will be updated with a value that is the
 	 *   minimum supported by the kernel and this may differ based on the
 	 *   GPU ID.
+	 *
+	 * - If &static_data_areas.array, &static_data_areas.stride and
+	 *   &static_data_areas.count are set by the caller, then the kernel
+	 *   will try to honor the value of count and this may be clamped to the
+	 *   maximum supported by the kernel.
 	 */
 	struct drm_pvr_obj_array static_data_areas;
 };

-- 
2.43.0

