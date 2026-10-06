Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3817345C6E1
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 13:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791292222; cv=none; b=TBz1QoF0fxo0wdc56yXy3w9iEPFoevbcBNKLxcx6B751dR6Vf5Du2/sQxXExG5vYHAyIS5Bi6iJ3xHyHBWpD8UvWdyi24590pw+RMTOxloxMBRqlctKffgsw4hcwJRoi3O4iUt/rXBHzfdSRdSLqbbbFobgxFnwK6TrFPVNp+Hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791292222; c=relaxed/simple;
	bh=qzOit12t7ik3I+pxoDOiNDA9kDl/tdt9184MoE6d/4Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eybl9ZMoBrILAB+evD/UrxHlTbVOSjUngXhAeDYdgGAWd4sWxXaaTZmcWORH/rcBuBKUhzlDZp3bSzqQRVbqJtcusg0WD9b/o7a5O7/0Ua3QuFj8xzl8Jgwp0dRgRCKmIqbysYrdPJSUXJUMO3ioO95M6yLUD29Qqfvqsy4g9UI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RJ6a455X; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TnLA9+5f; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RJ6a455X";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TnLA9+5f"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 696BPOWx1172361
	for <linux-kernel@vger.kernel.org>; Tue, 6 Oct 2026 13:10:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=NAuRL1B4w1q
	m6KEmQegsBYRQT9k+E9aeDav0hS/9suQ=; b=RJ6a455XcELItSvCqerXR1ehVHQ
	Ne52IfkwYPnPQAj6tn/MA9pDWxEbGcvYgjDnXhBTcj3x8A7MkMjnsEx9N9moqDsr
	J0y1axYkQyUQPYDvjdqg/QK4b/X2boIMGXeLgNPRYf+xqDwmjGxOotl3is+HR0vO
	YtrwSSEtGgryOmNHUGBokaGwscM5WfcbAE9ngbm7WwW562c3pmqACpYn9jW9gwr4
	E8aD4bXbV7oGqEA9aD3/BWMhcVhZxaE1YNrghVOcDIs7D+pZkCGTPkyhfATYB7u2
	XOWU3ShLkvB6g/ZfQdpiDtKYnACuKRzB7ihgsG/fzD+wLY7HD2qQ4YQbyhg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4xwwrjbc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 13:10:16 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc73895c7d5so3522336a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 06:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791292216; x=1791897016; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NAuRL1B4w1qm6KEmQegsBYRQT9k+E9aeDav0hS/9suQ=;
        b=TnLA9+5fd4JrP/nleFQDlIwYg9NL5ENYdH5PMCl3XGrH3oro5vQ4LIEahjIfg9ezeH
         pbWK7D/ya0iiNUzxYAIvymvTTmLflfoCbSsR9R7vsYPdV3OdT+6J25gmKr55cex5DqF/
         6CpIGPwNs1YAC5D4BPBk1DixN0U0A4xO+CfatzsokdnErnhyoKjuQF4aFY2TfSokTSvC
         qYK9bWKM1yUUlFr9raKydPzS9M6V7okFzUxDz41MoPeiklWRDB66Hgj52zlBnXuFCGNQ
         D7FUjO+W3HHADblcIbQPrBsnsx11MVTCVD5rKlE+QYvkQlAvMy/1k+RhRJFCcVuh1zDY
         adTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791292216; x=1791897016;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NAuRL1B4w1qm6KEmQegsBYRQT9k+E9aeDav0hS/9suQ=;
        b=z3QyVevDt4NgRZmTVSx83vwx7gexnVZi4FpJXU/boquxwNYoGDRfYfCU0WC/+GYUd0
         eQbSj1RGs3kYWI0ZAP0T+XObfncKCZmPQB94vsxZzJ5Ok9aBsDpt/mlov4Tsp1miq9bq
         VitU8F+yYWxVyzBCiYsZ3zj8ZHT8HiO/vPxtsgW2BSTBLaiFM3IQMLDMr4TatwrH6ZcB
         3e2loInZGjdhv62CTbjiyABb2o6Wtz5CzyZaBzKoa3/AsSgpBCERvJFhMDI36LbldkMB
         GEIVE7jT/PiSjB47ek+h57WPqqppt8QrWPj1JJWAG8eKP1JVOCDvOEV7DGbuBOAUEfFj
         FZbg==
X-Forwarded-Encrypted: i=1; AKwUvBy+4bbRZTZ4+EqebuUQpyuZCVr/olJuvFhkvqTXdvbzk1Vnu+6aJPHSq0EH+HtWOn3v0rvOJ7YTKBE3MRE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKydsqucRBBV64hhfahNze2QROPKau+rjG9f3nI0Jnm2WQQ/3Hz
	pY8hD8LyHt9425OkQiTH/ceZdSr89R+7dxM9QjDJg21UeHzsBKs5kHpoG/fJ0iXdiq1qPtgG2Bg
	78tg4ibqQI8DWaW7VjOckS8xJrydzh0FyfwZBH/YzQPbyBhactDz2VZ0y3Jr91z1OuEc=
X-Gm-Gg: AYBFou3v27owoh3IFVlFbS85olDlO2OWa8bbSiSknw+aB30THckWE7d/2MSSIOY50Dt
	nWn0+u9z0sA60s+i7LXcJXeuiZvDDGET+UIo9g26QD2+OHHc6ne/EjVNTyRyeUY7ETkCbMxZES5
	pAgjq0BAIwBS0muxQjDGzauTnoOIUVNP/zwJEXowC/W8lCAcZb+G5PunbR1v9IZvS8vASuqcNX3
	apRwRhC8FIhIUHxq95Fc2HeC2ZKrbrVb2yvqy5Gq8UqreFtVSmTEhEu8P/OLGVeUYggtM9qdzU4
	XEtski5bHlqNYVKcJN2ErEvJqJ/iywBJfYLD9F1cuObts1/x/2pq42SDgISQKeKyql3/+tu01lO
	U1xPxwbMOF6kXyJgRZepEeF/faT8jSrH1klGgzkAo5zInoQ==
X-Received: by 2002:a17:903:40cf:b0:2e1:35f0:6822 with SMTP id d9443c01a7336-2e4ea0e96f0mr97170745ad.2.1791292215923;
        Tue, 06 Oct 2026 06:10:15 -0700 (PDT)
X-Received: by 2002:a17:903:40cf:b0:2e1:35f0:6822 with SMTP id d9443c01a7336-2e4ea0e96f0mr97170455ad.2.1791292215429;
        Tue, 06 Oct 2026 06:10:15 -0700 (PDT)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e5a5ed0223sm22035515ad.54.2026.10.06.06.10.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 06:10:15 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Jianfeng Liu <liujianfeng1994@gmail.com>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [RFT 4/5] drm/msm: Convert iommu map/unmap to helpers
Date: Tue,  6 Oct 2026 06:09:55 -0700
Message-ID: <20261006131000.81501-5-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261006131000.81501-1-robin.clark@oss.qualcomm.com>
References: <20261006131000.81501-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDA1MiBTYWx0ZWRfXyq8XcKHAwue/
 3c91Jw8Gi1LA25YsZrEjU+tUdkLs+WEu1xtNC5a8FVeOanUIPwImEg96VH65UQNgVI2+2x8QR7Q
 Jrf5saniu+2wRgRdxXQoE0WgMu5sm45MLJw3nbzUlYsjghzZ2Z88Ahrz3Hi40y4u40+kq+VPv68
 OoId62Ng6XF7ieg6EKb/P3qyHR8PJxsBOXIzKU8VDGgRniL9OF8cDbjHi8qzGQwrQg2yzA+gj1a
 mAA/vH6UczZr0H2+L3qMzIHrtC/D9M/VLpOfZUvwRZ4YBIp+TaH+wwYS1KZpXrDdHRyswkdb9sJ
 HdHlh53kRfU6HXpxpqgjekD5+4JRN8//LwwHsRgTv2tCIXh7SCBa3lNvQUaaVxD5n7e/nBm0IA0
 akl6lZl1NSL0Fq7rCmrKQ3atSRc7alg1r5hwIgPBFYBp9JwMUTH3QCbA2I6/CyFcAolAuXdPQfx
 ufafm2ZQ9aXxjIAFN8g==
X-Proofpoint-ORIG-GUID: QXi06jeGmsmp4icGMjDgMkscce3TBPa9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDA1MiBTYWx0ZWRfX8y3x/QxX4Wtd
 3usDV74/v+1VpTM+d5zU6qgyfYvqdZ4xvdMNumfqNhraMdp1gFedLmwQ5lHTlVbVrmIMDoIe/NY
 /PrJE9uarR6UQe6RZ0NbJGAMFg05GCw=
X-Proofpoint-GUID: QXi06jeGmsmp4icGMjDgMkscce3TBPa9
X-Authority-Analysis: v=2.4 cv=SJXXx+vH c=1 sm=1 tr=0 ts=6ac4f338 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=19Wyn7e3V/0aNffMjNCMQw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=3T_YcleVrN8O_gWOTnoA:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_03,2026-10-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 malwarescore=0 spamscore=0 phishscore=0 adultscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610060052

Re-use the previously introduced map/unmap helpers in the iommu path
(TTBR1 for GPU, ie. kernel managed buffers, and display/etc).

The callbacks work in terms of iommu_domain/ops instead of io_pgtable.
It would be kinda nice to just deal with io_pgtable, but the tlb ops
that arm-smmu uses for it's own io_pgtable require doing runpm, which
we wouldn't otherwise be able to do.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_iommu.c | 32 +++++++++++++++++++++-----------
 1 file changed, 21 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
index a658493f8007..50038d00c3a8 100644
--- a/drivers/gpu/drm/msm/msm_iommu.c
+++ b/drivers/gpu/drm/msm/msm_iommu.c
@@ -720,12 +720,27 @@ static void msm_iommu_detach(struct msm_mmu *mmu)
 	iommu_detach_device(iommu->domain, mmu->dev);
 }
 
+static size_t
+__unmap_iommu(void *arg, u64 iova, size_t pgsize, size_t pgcount)
+{
+	struct iommu_domain *domain = arg;
+	return domain->ops->unmap_pages(domain, iova, pgsize, pgcount, NULL);
+}
+
+static int
+__map_iommu(void *arg, phys_addr_t paddr, u64 iova, size_t pgsize,
+	    size_t pgcount, int prot, size_t *mapped)
+{
+	struct iommu_domain *domain = arg;
+	return domain->ops->map_pages(domain, iova, paddr, pgsize, pgcount,
+				      prot, GFP_KERNEL, mapped);
+}
+
 static int msm_iommu_map(struct msm_mmu *mmu, uint64_t iova,
 			 struct sg_table *sgt, size_t off, size_t len,
 			 int prot)
 {
-	struct msm_iommu *iommu = to_msm_iommu(mmu);
-	ssize_t ret;
+	struct iommu_domain *domain = to_msm_iommu(mmu)->domain;
 
 	WARN_ON(off != 0);
 
@@ -733,23 +748,18 @@ static int msm_iommu_map(struct msm_mmu *mmu, uint64_t iova,
 	if (iova & BIT_ULL(48))
 		iova |= GENMASK_ULL(63, 49);
 
-	ret = iommu_map_sgtable(iommu->domain, iova, sgt, prot);
-	if (ret < 0)
-		return ret;
-
-	return (ret == len) ? 0 : -EINVAL;
+	return __do_map(domain->pgsize_bitmap, iova, sgt, off, len, prot,
+			domain, __map_iommu, __unmap_iommu);
 }
 
 static int msm_iommu_unmap(struct msm_mmu *mmu, uint64_t iova, size_t len)
 {
-	struct msm_iommu *iommu = to_msm_iommu(mmu);
+	struct iommu_domain *domain = to_msm_iommu(mmu)->domain;
 
 	if (iova & BIT_ULL(48))
 		iova |= GENMASK_ULL(63, 49);
 
-	iommu_unmap(iommu->domain, iova, len);
-
-	return 0;
+	return __do_unmap(domain->pgsize_bitmap, iova, len, domain, __unmap_iommu);
 }
 
 static void msm_iommu_destroy(struct msm_mmu *mmu)
-- 
2.55.0

