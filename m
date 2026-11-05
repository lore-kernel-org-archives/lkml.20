Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.207.212.86
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793881520;
	b=ugTj/x4Yo363vh4TvxsgljSQklhnkNfijR1FKJibwkpzJwyxv+2LVDDxeD0YAmQ5u+kc
	 slBcz9LHqSuPskibnOBchHhZ4LRefGn+Q3Hmm3tWW70TGWgU5VSXmDPiFrlXdXjCZi05s
	 XuinfcEhbTIJ2VdHR4kYm81t1eshXeXqw5jUeXkl9yqUxO5mm46J5pF9t8+JMRDV3Vbgo
	 /uSNDB0gHh4lWGtL2K2rhKp9Qj5w64y7l7nkQfU6da9mBkOIVVG+KbB8o6NLuxp8y+gHD
	 cRom05pUu0z+Pjv1OmOmd/5MFY0Wrppu1hLJLXxe7iGDTNNzx5ttGBUx+d886T98O5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793881520;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-ID:X-B4-Tracking:X-Change-ID:To:CC:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Originating-IP:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc;
	bh=Tv+AHQghVp6WS0kGDJXAni7BQSviv9lss6FaWUn8x9M=;
	b=EyEHbRBPlc1/La49BYZpQnbwif3SqyQQTY2/0Cn5L00qv/rjra1Dt4SXBvnqJ9wh8VEY
	 kxrElvbSvM8SjqcaSQMNKKrYIAUA3aZE3zkXXnAX9tsOScYZz0CCU9a14H5c5xAYYsusF
	 DlybWjfuXd594hzOYjQQGSCszXUOkpMpM9YeoN+6eLknMNO+sX0zP4N8dehCXyWTYtSVc
	 xlX8EJxr7aJC7VElvb7ZNwJ/6xb6kXcPfgQO4ktP/b6cZKSZz90kYK+n/cgXrOX/LzTpj
	 DHGtTPxLZqgCL0ZyhFEI0GN071lOoyQidMI02wma5CcsVDmIZBofRCHSIl02Lp6/8Hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=imgtec.com;
	spf=pass smtp.mailfrom=imgtec.com;
	dkim=pass header.d=imgtec.com header.i=@imgtec.com header.a=rsa-sha256 header.s=dk201812 header.b=r87VV7ye;
	arc=none smtp.remote-ip=91.207.212.86
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com [91.207.212.86])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E931606A329
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 12:25:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E931606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imgtec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imgtec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=imgtec.com header.i=@imgtec.com header.a=rsa-sha256 header.s=dk201812 header.b=r87VV7ye
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
	by mx08-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A59ucxq522533;
	Thu, 5 Nov 2026 12:24:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=dk201812; bh=Tv+AHQghVp6WS0kGDJXAni7
	BQSviv9lss6FaWUn8x9M=; b=r87VV7yeav7OzgfUP6zyDouNfP+JpnbLLm0wQgq
	KqEwe/QfkJccDdOB7I22oTc1Sx51dCN58GyGJlS2OhMfHtqqFsius0u+5y0nwYcV
	GzHXdgzaeuh2o4soObEgPDsR8a3BhWDNVHSM+M0ExyUtn4JIB2WGsmVK0FG/fmk6
	45Bh9saQMANK3j5lKzt2i+sfJzEy6+dkg5TbOZuk1ljPDG0r9IsaCICmQ46NZvum
	E09jjVD7MvwSeZHidqz5lnuCp7gq517iYwlYJEhGfs3pB3CEyZ0CE5TcbYUdcQFI
	ZNyeWQes1IeUD5+K8HmP+ZJ3U9lcU52Bc+T8NPn1JLzEd+A==
Received: from hhmail01.hh.imgtec.org (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
	by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 4hr3j6rw22-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Nov 2026 12:24:44 +0000 (GMT)
Received: from [127.0.1.1] (172.25.6.177) by HHMAIL01.hh.imgtec.org
 (10.100.10.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Thu, 5 Nov
 2026 12:24:43 +0000
From: Luigi Santivetti <luigi.santivetti@imgtec.com>
Date: Thu, 5 Nov 2026 12:24:23 +0000
Subject: [PATCH] drm/imagination: improve DRM_PVR_DEV_QUERY_HEAP_INFO_GET
 documentation
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
Message-ID: <20261105-document-drm_pvr_dev_query_heap_info_get-v1-1-b899401606e4@imgtec.com>
X-B4-Tracking: v=1; b=H4sIAHZ17GoC/yXNTQ6CMBBA4auQWdukBazBqxjTYDvAmNCW/kVDu
 LtVl9/mvR0iBsII12aHgIUiOVshTg3oZbQzMjLV0PJWCsHPzDidV7SJmbAqX4IyWNSWMbzVgqN
 XZCenZkxMStnjcBm6rudQcz7gRK/f6nb/O+bHE3X69uE4Plw991qMAAAA
X-Change-ID: 20261105-document-drm_pvr_dev_query_heap_info_get-6664e9793340
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793881483; l=3455;
 i=luigi.santivetti@imgtec.com; s=20260707; h=from:subject:message-id;
 bh=C8+K3L2nsKBAFra+GN8oUHH2+EsKQUpWlDsEcy5mfkk=;
 b=J/Skituf9q4/DLGJTN7g7QhW5+2o0Yg4XeeXphSsUZdej9sb1Njs/gFI7XKkwj0ddP0ssUgpY
 2gx6AosmGLwDEnrhak8vLMMxCysPNJIykdCjsl/m9atDwFajroQ4AS2
X-Developer-Key: i=luigi.santivetti@imgtec.com; a=ed25519;
 pk=jS7sCDyWFMopn8iAXVN+AdJi+Z3fZPQKsS5NdQtI+sc=
X-Proofpoint-GUID: v1ikj_VOCsMDsN3UF060SiHFjh5JlRzB
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA0OSBTYWx0ZWRfX64Tlp+ZqmmBO
 Yz5lf3/cB5ExheoSAGyD6P+qdfmt+a5+oTUelsg0bsirfEqV21CQOERAJYUA6CCHNDgnyqPryJl
 LRgIAuv1m4WazPnucf8/3bdiiZqUiUo=
X-Proofpoint-ORIG-GUID: v1ikj_VOCsMDsN3UF060SiHFjh5JlRzB
X-Authority-Analysis: v=2.4 cv=DtnDa2/+ c=1 sm=1 tr=0 ts=6aec758c cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=2JH569OHYJkA:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=kQ-hrUj2-E3RCbRHssb7:22 a=qZQ2PDNLMSdLoqI-hfl9:22
 a=r_1tXGB3AAAA:8 a=v4fapmwnaPr8F7IbrnYA:9 a=QEXdDO2ut3YA:10
 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA0OSBTYWx0ZWRfX+aZYqYmxpFXh
 KwsH+Kmpj81tYA0EZTp4cFxlTfBMaTlrh/lu3CnE2fQYglu9Q11V/2j4vxfJECgTHiemDxEPr78
 gaJugtN5BMsV+5iR8pbUlPm78FwF/q0dcjCMjR54E3minRQtEdfxkdVMDgvm3JWzoCjaSS4vbmn
 XfMYqwMCjcXTX67Psb2yv2Q1ekJJ1QRqy1y9Tjo+UBWQoMYcH7DT1FWCTIQf/iZxLUMlAdoxTMC
 kFMwT/iwGxwLhu6u5/VRCBoF0W1xXt6sN9Jln+WPVdRyt2tjUiQ5R/9HwkfbNYKhM+1A+12C6hq
 CWhS8AdjdhwPhOlqbWQYFhGjzlAMal8NexrcrsVI0LC7Ls/isU6CWAF2kvijf7iNmMn2Cyl7vZL
 foTAbNjBK0JV5Hq8zdq/+1z2jopJu5Tnwa3HQRR3b0yo0eaSOnp+acNTKqVK/UrqdK1OpM+mlX1
 SQ6oqv/u18hSoTcJi1A==

Add more information about how the array of drm_pvr_heap is filled in and
set expectations for when userspace and kernel run with a mismatched UAPI
header.

Signed-off-by: Luigi Santivetti <luigi.santivetti@imgtec.com>
---
 include/uapi/drm/pvr_drm.h | 31 ++++++++++++++++++++++++-------
 1 file changed, 24 insertions(+), 7 deletions(-)

diff --git a/include/uapi/drm/pvr_drm.h b/include/uapi/drm/pvr_drm.h
index ccf6c2112468..cd85ac257cdb 100644
--- a/include/uapi/drm/pvr_drm.h
+++ b/include/uapi/drm/pvr_drm.h
@@ -258,9 +258,22 @@ struct drm_pvr_dev_query_enhancements {
  * enum drm_pvr_heap_id - Array index for heap info data returned by
  * %DRM_PVR_DEV_QUERY_HEAP_INFO_GET.
  *
- * For compatibility reasons all indices will be present in the returned array,
- * however some heaps may not be present. These are indicated where
- * &struct drm_pvr_heap.size is set to zero.
+ * Userspace and the kernel may have different values for @DRM_PVR_HEAP_COUNT.
+ * In this case:
+ *
+ *  - If KMD(@DRM_PVR_HEAP_COUNT) > UMD(@DRM_PVR_HEAP_COUNT), then userspace
+ *    should either:
+ *
+ *    a. explicitly request a number of heaps by specifying a value less than
+ *       or equal to UMD(@DRM_PVR_HEAP_COUNT) heaps, and the kernel must
+ *       ignore heaps whose ID is greater than or equal to this value, or
+ *    b. ignore heap IDs greater than or equal to UMD(@DRM_PVR_HEAP_COUNT) by,
+ *       e.g. capping the value returned by the kernel.
+ *
+ *  - If KMD(@DRM_PVR_HEAP_COUNT) < UMD(@DRM_PVR_HEAP_COUNT), then the maximum
+ *    number of heaps is capped by the kernel at KMD(@DRM_PVR_HEAP_COUNT) and
+ *    userspace must ignore heaps whose ID is greater than or equal to
+ *    KMD(@DRM_PVR_HEAP_COUNT).
  */
 enum drm_pvr_heap_id {
 	/** @DRM_PVR_HEAP_GENERAL: General purpose heap. */
@@ -269,7 +282,7 @@ enum drm_pvr_heap_id {
 	DRM_PVR_HEAP_PDS_CODE_DATA,
 	/** @DRM_PVR_HEAP_USC_CODE: USC code heap. */
 	DRM_PVR_HEAP_USC_CODE,
-	/** @DRM_PVR_HEAP_RGNHDR: Region header heap. Only used if GPU has BRN63142. */
+	/** @DRM_PVR_HEAP_RGNHDR: Region header heap (optional). Only used if GPU has BRN63142. */
 	DRM_PVR_HEAP_RGNHDR,
 	/** @DRM_PVR_HEAP_VIS_TEST: Visibility test heap. */
 	DRM_PVR_HEAP_VIS_TEST,
@@ -310,9 +323,13 @@ struct drm_pvr_heap {
  * struct drm_pvr_dev_query_heap_info - Container used to fetch information
  * about heaps supported by the device driver.
  *
- * Please note all driver-supported heaps will be returned up to &heaps.count.
- * Some heaps will not be present in all devices, which will be indicated by
- * &struct drm_pvr_heap.size being set to zero.
+ * Please note that drivers may not need all the heaps that are returned up to
+ * &heaps.count in &heaps.array. Unlike for required heaps, optional heaps are
+ * used on some GPU cores only. The kernel indicates when optional heaps are not
+ * needed by setting &struct drm_pvr_heap.size to zero.
+ *
+ * The kernel copies all requested heaps into &heaps.array matching the order
+ * of heap indices as they are listed in &enum drm_pvr_heap_id.
  *
  * When fetching this type &struct drm_pvr_ioctl_dev_query_args.type must be set
  * to %DRM_PVR_DEV_QUERY_HEAP_INFO_GET.

---
base-commit: 33ed26235db93162935d1719bc6f538c384a2fd8
change-id: 20261105-document-drm_pvr_dev_query_heap_info_get-6664e9793340

Best regards,
--  
Luigi Santivetti <luigi.santivetti@imgtec.com>

