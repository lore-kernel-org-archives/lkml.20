Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793395981;
	b=HXKq/mnMRIb1EpQbJCJDOeWgd1Vmex43Xpeyt6gIYwAOYjZhkkwxU1R23Fz0rWAcPvcz
	 wkqnVE29vmdoJMf/4Fi5o+UsasFLDQsfxKxtqJOioUZ8YvXGPlrZ8q/mgCs0o5vVC+Xvs
	 p3t01B/84fZA/7/m3wSktqtusygtycV0sdK5ywIZ4AtHq/QucoicPJPu4xkJVyKgRuPZn
	 HUodVAmrzpEo6E0ioOsZ+ssnPPJqZxWkiMufJzX7Z8Sv2RBwkGzP3QRmdSVRqkic9lv1v
	 8I+Gm2083SdFAwJw3LhQlVxXGAVIdYxXHEi6e6j+58kmmy6L7B0ZWOQQPEhxCizj19A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793395981;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=lKfSr9ShDgz6eFnCZ0r6QMxMYlKS96GB2Cpk0qX7FGs=;
	b=jMrB6YbAiTODvgicww9duuSK/+Re79UdY+ozKoBqP3kAh0wQugJZlVXjqeNXJifb3mPs
	 7JoQMPrraKnCSVi47ElAY3oMvnZNwcNwrWfWUzZz9fSyeh03VHTyfZbGuc6T69DboD1Tz
	 euNrCiGlMwW635jM7uEg5OujcRYrpGGor7FhJaum8vjlf6gXhnPXN57Hf1mnrjaAmILZ2
	 v8E8KWbKmoZNQv2QKc9nP9HFSXPe1FEqFJ3iwPtrLPgpsCXNAj0IuV838fiOgprcIxyOf
	 tKlK1GDO5sVxrLyR3w2Ia39ON2fbSpyeNWBBiB+F8DUfMzNbiHfdtyWtLcijz0XRg4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hwPoeJUM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gxxgaaSD;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D280A606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:33:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D280A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hwPoeJUM;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gxxgaaSD
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69ULAVnC1222873
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:33:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=lKfSr9ShDgz
	6eFnCZ0r6QMxMYlKS96GB2Cpk0qX7FGs=; b=hwPoeJUMib669wrGmDMfFDP3il2
	TJNBWSmJoBvUDsSADtQ7IQBCgoP/FrBpWbLgj4cWqNwGRS7yn+H+AGdp28T+2qGb
	ZYFogluIZ0h/bxcbXXj1e+dXSc766HwOncLQVAX2aXi2wrcKJs36VC5A4zrqEzat
	Si+m6Oh+zXg74xb/2rs+sw5Ul0nuvA0dhfhyKpXGmooy6lEi8GNOG14/iAKXLGAE
	rTKmd8Ss6HYx5eKY8ncqtFYNl3yabGhvw2qIN79LgNSxUFZ5oO3BHtaqJeu55MNo
	4AmUVzz1R+vEMl90Fr6oeUINJEnOvp2LWfN9GOrtsuO9zGTwzfRpuZFzdYw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn2x0825n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:33:00 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cd67466211bso610094a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793395979; x=1794000779; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lKfSr9ShDgz6eFnCZ0r6QMxMYlKS96GB2Cpk0qX7FGs=;
        b=gxxgaaSDNi09RmAjBz5wQctKIDuuwBW88E3gBdmgbhSu+EfFbXlnS/Ja+GKlClfqrw
         K7uNM7/XJlW84aNL0t0ndDNiVMbkRFPf6KCVvLfI5EpaqATj7KjkSBMrnNz+76wGrYIQ
         glsGiqZilUlCHaWjSyByudmeVJNq/wuUckVzGROZqG22E9Dti1IQmfSPJ6VhCami67k8
         woVkVxlmEyr6FoboCkU69stTX8a3PjFfM0Xg5mOprGUmE9WcHonHsdZjUq3LdSZPrjJ5
         B44+TC4Xz1lZldj++Ocv5UfqEkjxTF+BWWTcl9sOfjZd6crZxfBZMkzxiOsdVOnGF/kx
         NcJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793395979; x=1794000779;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lKfSr9ShDgz6eFnCZ0r6QMxMYlKS96GB2Cpk0qX7FGs=;
        b=F3FYKNecQFsF/13hBWua2fr/9kmLVXXIQ8+FRc5WAN3N7ZkSW69L3zlOTXYaMQbEGe
         uk4OYBvNAM49XmBBx1MoD40DYVi+AkVw0fbM5zYYac/Y02Y9o9SO58tNNyX6ijnxtOlk
         a2AZa58jwPDMi8wDX+Xl/IQ9161fXatHLmPFVeXz4QGnZ3uRZsmY/LJ+T35x/PchPOGR
         qpmSxKZmKLk7ifyfjUlARPjACaPsYjxep+g9Hvvg9uJzDHLMfq43clTVuZIjRk0+b9TJ
         He5u+vfMior9LZSRJUcTIUuSjG+sAudD4Ld80pnipuJrGOGI0EnhyIHqpplOi8rTdRum
         7k/g==
X-Forwarded-Encrypted: i=1; AKwUvBxtvyQtUbhnE3TyKXCCdvcOsMxAfTTr+FpfNS2AfC89zOyRxEp9tyY7bxjMClitCzqY53MgprAm9VVGKik=@vger.kernel.org
X-Gm-Message-State: AFq9FYK+YXIQB+dxFO4D1D92XPHn61WM7qgvnEpLnR972TEMkWOyiIdE
	SMUYBLIvXmcOaV5vC+4ef9NmXLUmP68K+7PhaM10uwSC6YYjcLDlFbzuHrtcENKBEI96TMEd1Dv
	sTRv+SpIj39bMyjhkMoVMWv6GaXhMeowaLWrZWmihkgmTIMHDM4vdA5msiv/hpnCzMvg=
X-Gm-Gg: AYBFou3uKVRGlvB8Les6P250luNpBuQXK8sKdU4EkQG5y2cRbr9ogUOw7J+k182efEq
	8a8TdQimoPBsHaTnlhb2T66MhZDzpMDL2sn4KbEFCUJu8u71FyUekIbDb7ua6eyYnZk33SbcqvF
	23ty2LzcxrcWVcjvCN18g5vtTNryU18PKbC4qBiJKW3Ltv7uX4V/1xVHZefjNm+xzoRAEAOjmNf
	7KdPaFFCwP0Hw1opqyCU3HDbOzHfpnN0CoVR0YjxwAOp7wRwhYWvlSuvc7mga7W5jSKUWWRqEPt
	YHU0aQt+4FCJ1K1Q9VvMOf+ch3nn0WddstAxMKoB+YMeDOPZUQ0X+FuoZell3AbrgZLqM45Kmg3
	SXU6K+fybZMc2hOX/unqMdCbVEybbw15xFqzgVMH1iXKd+jDnArCpFTi4gi5EYOvovCHxVYZf46
	Hg1SO1tpPMqh8rm/8HwxkQuw==
X-Received: by 2002:a17:90b:3c08:b0:3ab:17b6:9a93 with SMTP id 98e67ed59e1d1-3ae897a64b7mr3002398a91.52.1793395979328;
        Fri, 30 Oct 2026 14:32:59 -0700 (PDT)
X-Received: by 2002:a17:90b:3c08:b0:3ab:17b6:9a93 with SMTP id 98e67ed59e1d1-3ae897a64b7mr3002384a91.52.1793395978870;
        Fri, 30 Oct 2026 14:32:58 -0700 (PDT)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae8454327esm5313204a91.4.2026.10.30.14.32.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 14:32:58 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Jianfeng Liu <liujianfeng1994@gmail.com>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 2/6] drm/msm/gem: dma_map/unmap_sgtable()
Date: Fri, 30 Oct 2026 14:32:44 -0700
Message-ID: <20261030213251.55365-3-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261030213251.55365-1-robin.clark@oss.qualcomm.com>
References: <20261030213251.55365-1-robin.clark@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA4NSBTYWx0ZWRfX2U3M5R2Jocoe
 kXELTBI9wvTSPV/zqG3yrlMQ+nGN2wTcVpROa36bcTTLhxhGdJc5vfGdm4gxyOBwThBTIq1p9yB
 w20H+IicteKnDMm/UwbLP77yP0I1/6A=
X-Authority-Analysis: v=2.4 cv=d4xgWhjE c=1 sm=1 tr=0 ts=6ae50d0c cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=urFl2zf4nAXEHr-h338A:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA4NSBTYWx0ZWRfX8dasJGmjxGq6
 mN4tukmdnWxIRgaEAXmLfYsrlXY/ZfT+iLjt1qq1mqHhz8qHnWA+Ep9vnMJ/jB66aYONNBcgnY7
 mQfCuRqq9C5FcxTlB3ZhOm7/yKEysxd8++JG/BQThrXSTKcNlN9SdlZAlJeG5Imq7uGxyTQDLWD
 7GCLAa69l3tjd1LNCMvkrfPulHrozTDMvqYXYWGFUmDakOkZ4WAvLjF8SKFIBlABdfWOoS8uT6Y
 1GeQGUQ6bfqBhckKLGiSPpwrEEfenBK/7ucqfIQb9HWdUZ59+EK+DDgSg2o6rlEseuaR7VCac8o
 I1WEOhQqGS1dugA9bnhVbz2RY5yza+vZUZnLm67ehefS/m7eJ4OMy1wDMbqwPbQuNAph+8OOfON
 Jj8XTeY7Vy3jIy8KuCX2pajEZdWZ2ujpflPljX1D8emnv5+iG8JIGv9xkXy90IYXxb0YofRNo4M
 JQeleSs3ioPwpYLnE/Q==
X-Proofpoint-ORIG-GUID: VQ1H8Ol3F0c1na2i0BiJwClGGt4OwuNb
X-Proofpoint-GUID: VQ1H8Ol3F0c1na2i0BiJwClGGt4OwuNb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 spamscore=0 suspectscore=0
 malwarescore=0 clxscore=1015 phishscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610300085

This should functionally be a no-op for us, since we are managing our
SMMU directly (dma_map_ops is NULL), but it populates the dma_len/
dma_address's so that we can use them for setting up pgtable mappings.

This inlines sync_for_device() and sync_for_cpu() into their only
callers to avoid doubling up on the dma-mapping calls.

Tested-by: Jianfeng Liu <liujianfeng1994@gmail.com> # x1e78100 (Acer SFA14-11), v7.3-rc5 + this series, CONFIG_DMABUF_DEBUG=y
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem.c | 65 +++++++++++++++--------------------
 1 file changed, 28 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 181b9ad32672..bcdb57866cf6 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -116,34 +116,6 @@ void msm_gem_vma_put(struct drm_gem_object *obj)
 #endif
 }
 
-/*
- * Cache sync.. this is a bit over-complicated, to fit dma-mapping
- * API.  Really GPU cache is out of scope here (handled on cmdstream)
- * and all we need to do is invalidate newly allocated pages before
- * mapping to CPU as uncached/writecombine.
- *
- * On top of this, we have the added headache, that depending on
- * display generation, the display's iommu may be wired up to either
- * the toplevel drm device (mdss), or to the mdp sub-node, meaning
- * that here we either have dma-direct or iommu ops.
- *
- * Let this be a cautionary tail of abstraction gone wrong.
- */
-
-static void sync_for_device(struct msm_gem_object *msm_obj)
-{
-	struct device *dev = msm_obj->base.dev->dev;
-
-	dma_map_sgtable(dev, msm_obj->sgt, DMA_BIDIRECTIONAL, 0);
-}
-
-static void sync_for_cpu(struct msm_gem_object *msm_obj)
-{
-	struct device *dev = msm_obj->base.dev->dev;
-
-	dma_unmap_sgtable(dev, msm_obj->sgt, DMA_BIDIRECTIONAL, 0);
-}
-
 static void update_lru_active(struct drm_gem_object *obj)
 {
 	struct msm_drm_private *priv = obj->dev->dev_private;
@@ -201,6 +173,7 @@ static struct page **get_pages(struct drm_gem_object *obj)
 		struct drm_device *dev = obj->dev;
 		struct page **p;
 		size_t npages = obj->size >> PAGE_SHIFT;
+		unsigned map_attrs = DMA_ATTR_SKIP_CPU_SYNC;
 
 		p = drm_gem_get_pages(obj);
 
@@ -219,13 +192,20 @@ static struct page **get_pages(struct drm_gem_object *obj)
 			goto error;
 		}
 
-		update_device_mem(dev->dev_private, obj->size);
-
-		/* For non-cached buffers, ensure the new pages are clean
-		 * because display controller, GPU, etc. are not coherent:
-		 */
+		/* For non-cached buffers, ensure the new pages are clean. */
 		if (msm_obj->flags & MSM_BO_WC)
-			sync_for_device(msm_obj);
+			map_attrs = 0;
+
+		ret = dma_map_sgtable(drm_dev_dma_dev(obj->dev),
+				      msm_obj->sgt,
+				      DMA_BIDIRECTIONAL,
+				      map_attrs);
+		if (ret) {
+			DRM_DEV_ERROR(dev->dev, "could not map sgtable: %d\n", ret);
+			goto error;
+		}
+
+		update_device_mem(dev->dev_private, obj->size);
 
 		update_lru(obj);
 	}
@@ -233,6 +213,11 @@ static struct page **get_pages(struct drm_gem_object *obj)
 	return msm_obj->pages;
 
 error:
+	if (!IS_ERR(msm_obj->sgt)) {
+		sg_free_table(msm_obj->sgt);
+		kfree(msm_obj->sgt);
+		msm_obj->sgt = NULL;
+	}
 	msm_obj->sgt = NULL;
 
 	drm_gem_put_pages(obj, msm_obj->pages, false, false);
@@ -253,12 +238,18 @@ static void put_pages(struct drm_gem_object *obj)
 		drm_gpuvm_bo_gem_evict(obj, true);
 
 	if (msm_obj->pages) {
+		unsigned unmap_attrs = DMA_ATTR_SKIP_CPU_SYNC;
+
 		/* For non-cached buffers, ensure the new
-		 * pages are clean because display controller,
-		 * GPU, etc. are not coherent:
+		 * pages are clean:
 		 */
 		if (msm_obj->flags & MSM_BO_WC)
-			sync_for_cpu(msm_obj);
+			unmap_attrs = 0;
+
+		dma_unmap_sgtable(drm_dev_dma_dev(obj->dev),
+				  msm_obj->sgt,
+				  DMA_BIDIRECTIONAL,
+				  unmap_attrs);
 
 		sg_free_table(msm_obj->sgt);
 		kfree(msm_obj->sgt);
-- 
2.56.0

