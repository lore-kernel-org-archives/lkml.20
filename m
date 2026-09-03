Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B47C0383339
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 18:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788460655; cv=none; b=nfzCVeen/p6tCh2Zf06kQYRwOL+cGC4puQShn5Km1x5GGy8j9BEWrcMcywYkaqGJGEkLlvly6mUYjwxfQIQ4OJQi9L9GcXjm2Ff1OaqYklV/rlH0i6knTvhqJKRDrIqFLU8GaMYyeOeCyLC2LNl3uKKQ8VzWUY9a8nx0aPGb71A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788460655; c=relaxed/simple;
	bh=sRPTkFWhn9MXXlTcuT4Mj+8mqGM3b38g27WcJFRTivM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QmBEx5nJcjSFmoUraJvenOG/QVXx8j1aQtBOAPVjkkcvcf2vw4APJsdbYDcVoJ5EIyXUk7pLQG+UVZkSb5COfVqkDxg43sO+oGiClMCIrkoVfU4ZLiA2eVkrYgGzQ9rXWdhxq2BVzSALA2Y3AEhKViFTjXHVRLjB9nvgmOmSAAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hQVJWhZS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=in0ZbTcm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hQVJWhZS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="in0ZbTcm"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683G2rmv1698730
	for <linux-kernel@vger.kernel.org>; Thu, 3 Sep 2026 18:37:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=t7Ub3ljv+unfOsu5RVQH5xhiC5eIDsoAHAo
	5/jO6LDQ=; b=hQVJWhZSaMMioFE9tU79LGAzhDAgQag8kowwAgcLElWAXE0vI+s
	coirHixObD7rrLlB+VnK6coKaZMj/A1w8prqypCRTVwJC5RXJZjkmcFYlhdKXQ+7
	tEaxXV0oKze9NJBYKGycMeaYVeXMxgoA2FSRpOisSE/7nejxf8M3sQyhEUNjPJE3
	nw02BaUU5XJZDKw325IVZe2UiGpJ0F8BymAU7leSZRzRPakRM2nGnG/Ne2LdmLIB
	ZsitnjudIt+TEO+4gTZtV+YyPlJOsUNbzkvZAaIKJx/lC4UFn3+SHfexlBveTkSd
	V0C8KDck16MXWne8Dbbrgi6FcC2z/VB/CWQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfbyvgvc9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 18:37:32 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc2229450b4so221746a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 11:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788460652; x=1789065452; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=t7Ub3ljv+unfOsu5RVQH5xhiC5eIDsoAHAo5/jO6LDQ=;
        b=in0ZbTcm9nYHKGrbrm+DW6/E8DT8tXnUPZDMtsxbkIh2FmzLaj7IhV7Y20gGMy7Su0
         1HTz4UIMjSj3gsgfFdrh0yJ+jfGc3UUv6f/EDfYAQ14/IE40shKyBd1vll0nIrX5MGUQ
         rcV2/jKhMi4oj6tG5APFBN0sYOWSf1Am+iHNfkN1yrqkmM6hRyR+fQ0kGBcpxn1hbi2M
         tMZUb3T9zDu6FPYx/tjZgwuUxRIeDgzRpVWdK1Qy5XIJKmhcrrCtT4Y8Cll3nanxFi1b
         5WhG5GoOzEDe+zGOhTnIhg1snUbaWcxTVbfZC6yFR6WitrD+Xj+EEsV67JPhJsBGO2pB
         Pkig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788460652; x=1789065452;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t7Ub3ljv+unfOsu5RVQH5xhiC5eIDsoAHAo5/jO6LDQ=;
        b=RA6bRVWw7uiViz+jPpjqjBEP+T3dUTWxDbKkpbwH6cTK8bHrslVJ7HRZBJcGatEBLg
         tqmVIXl7nz5ZPJrIEvfk30X5UaK5GHPldSl6AoWWm9dv7BunBkh8D9Nw8SkgGxCT9qfN
         U/ZufGSNaCc7Pio34Ozkt6c/tk2gZecwJhDe+s4aqd2RhNPT+vKhpue0I1SBoBRvlvoN
         Tc4afij5FGEbaKOIBt6+Im9LRs33i7kfBxSZ6fr2CY9Y0jiG8axndYRWbMPL8L5ecnzt
         HGmrXxSGsrYv6TV/NWK8ILzYQGv2qJi4E+ZGTWyvU5bXqnTaxuMN+Msx4JDPnhgOgBDH
         otQw==
X-Forwarded-Encrypted: i=1; AKwUvBwOgM8Nhp8WcEt4RozV2H3KqSnXOC4UxenJ/yuFXH7an4ZSgc2oj2DbwZJDPOQwZmIWCDuauCBm+VhhQGE=@vger.kernel.org
X-Gm-Message-State: AFuF++mws2PnhHEbvQIeESyiI+MhH81vDnOpJ7lTUKrI4b3V8uPLktr6
	mO2zwuZSjoTkB7l3IXL0y7bC6ISh3/F4KDA8Uf9eitZcPfVpneZ6iRdCF3bRNIXFEUrUc1NFf9m
	uJglmBLkhUNUD6DP7RuejQl+8457UcY9wzr843ryNkA02GpraD06eOjcBZwDs+/1/Irs=
X-Gm-Gg: AYBFou0CipvzYb58qFqZ7fFqAeWQmfGSAYbmx1DDxp8icwqOa9EVODbSPXUXmtgJ1aV
	fvi+h10OdkN0OubpyJCPH8kIxt0h/nAhtr9bieabw+AdAvKSLEUhwtBKj8P7u9abR2lKLzj8YDC
	6iHIWchha7k+CZHuGLKCbfbrXa+b/yO1Nl8rXSVuMG1+z0i3vqIUuSGjqQXMSaCp7NavtObLztN
	yYCp9h6RTgbBAd1IjiSfhgK0Bbu9ONiYbKz91Q/gzcCQ2i/V5FlyqsCxWatYBLglpI5IC3uYl+J
	kb571DLqwBvIQ7OLa9daV9yNgVZOpH10n9LyUi51nMuH1IWBUT/nFxbGT6/Fb/RhFLpb41GdHEE
	uLJrwnd0wlDYKl0HNmNjTh5fLefTaeoFo8G8AhV8ak+2jVU4=
X-Received: by 2002:a05:6a20:2583:b0:3bf:7bf7:7913 with SMTP id adf61e73a8af0-3da39ff4716mr523039637.14.1788460651587;
        Thu, 03 Sep 2026 11:37:31 -0700 (PDT)
X-Received: by 2002:a05:6a20:2583:b0:3bf:7bf7:7913 with SMTP id adf61e73a8af0-3da39ff4716mr522983637.14.1788460651127;
        Thu, 03 Sep 2026 11:37:31 -0700 (PDT)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc45515436asm10903a12.3.2026.09.03.11.37.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 11:37:30 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/2] drm/msm: Enable THP for GEM buffers
Date: Thu,  3 Sep 2026 11:37:24 -0700
Message-ID: <20260903183725.15835-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: toLJWVzwK5OEBH8ozlqXsNthzB8Fy4U2
X-Proofpoint-GUID: toLJWVzwK5OEBH8ozlqXsNthzB8Fy4U2
X-Authority-Analysis: v=2.4 cv=C8vZDwP+ c=1 sm=1 tr=0 ts=6a99be6c cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=19Wyn7e3V/0aNffMjNCMQw==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=bo7bELecpVJEBXAwH0gA:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDE2MyBTYWx0ZWRfX1m9UCSzeiUji
 04uJ9SUa2FTjdAE4uvMloVtoO1nLG3+f1tl85BwsvRrkQWn4zgFF4G1TdAw5Jn8tSA6RGzmoJKN
 MbMEE2/prfcseZkCQFQME3xq//oNt83wpV1J3O3ttrTo0rpMMESYDH317IipQFj2kQZ4KSkS1jj
 lAWu+eTnghL4k/QjptMAwp30ip9lYUOhEStkAHGzWPSH8P5gswLnsOGQZHnXJdHyGjodIYNbKPn
 je6JsgEZbqX+NrDGoOHg4iSNbVZ1r7+6V60F/Nq8spCYVjqSPjx7CQ7RjWjDBVO9uULJoMvjxju
 O127W07Idf+aizspGbyEd6+5wMaMdok0p2qs6EKkCmYqRPAxPVrkcHCP+RFF4RFuaaRw4XkYRUb
 NIh5jMhwnYg9S1pUaZuihgOQgWyEq4zbzfDrkYDr/U1TIOHD7de3O0CC9vXq1LPb54UeyWQBUe1
 N0foPTuHG6DHNzBaPIA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDE2MyBTYWx0ZWRfX9q27c5Eq3QAB
 +JG0Tf4fY9gijAOd1NX49PDYLE8vdEXwtSWONfTmYCYtu43zcixQeIw0tD9JN3X4xKIUUb/liSB
 Gbi+ZUSHLCXNzFEoeeygHxFY63hl9B4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_05,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030163

More than 2x speedup on darktable benchmark which was bottlenecked on
page allocation/pinning.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_drv.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 73d99bde26f1..8129e7d229d9 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -58,9 +58,29 @@ static bool separate_gpu_kms;
 MODULE_PARM_DESC(separate_gpu_drm, "Use separate DRM device for the GPU (0=single DRM device for both GPU and display (default), 1=two DRM devices)");
 module_param(separate_gpu_kms, bool, 0400);
 
+#ifdef CONFIG_TRANSPARENT_HUGEPAGE
+static bool transparent_hugepage = true;
+module_param(transparent_hugepage, bool, 0400);
+MODULE_PARM_DESC(transparent_hugepage, "Use a dedicated tmpfs mount point with Transparent Hugepage enabled (true = default)");
+#endif
+
 DECLARE_FAULT_ATTR(fail_gem_alloc);
 DECLARE_FAULT_ATTR(fail_gem_iova);
 
+static void msm_gem_thp_init(struct drm_device *dev)
+{
+	int err;
+
+	if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE) && !transparent_hugepage)
+		return;
+
+	err = drm_gem_huge_mnt_create(dev, "within_size");
+	if (drm_gem_get_huge_mnt(dev))
+		drm_info(dev, "Using Transparent Hugepage\n");
+	else if (err)
+		drm_warn(dev, "Can't use Transparent Hugepage (%d)\n", err);
+}
+
 bool msm_gpu_no_components(void)
 {
 	return separate_gpu_kms;
@@ -178,6 +198,8 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv,
 	if (priv->kms_init)
 		msm_drm_kms_post_init(dev);
 
+	msm_gem_thp_init(ddev);
+
 	return 0;
 
 err_msm_uninit:
-- 
2.55.0

