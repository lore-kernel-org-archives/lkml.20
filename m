Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88C6738C2A5
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 15:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790955007; cv=none; b=ABTHqLpc9kas2vieARg3KKiADAsEEBIT/TPT1uDvosZhoXuuqPA65jLVxSKAHbENj+wWXip95CAwEE9IsgGvmRiaaDx9ibu83rlRk3koXExl9KNgIv6fypfl+yB+x87bsMLadN77/A/Cx3rLUaqOOWrlu679RAmbkkIVN91pbA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790955007; c=relaxed/simple;
	bh=75J3IxWBaqAwNpY6Ogx2T5TgqNX3H8lEPjfQcxkP+DY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rTAZnGY6RBLtnSK8rhXHEzylOxEjPI9UzjuuhgJGTeZ39NU04kGRc+yBYRxKXAxlSbN3iPc56ae1hidk92O9rCE8rBsym95NFktcFQZ46M51c2iwgZs6xb0AQVqab3BSZFrvH+Xuy4r+A5aOIUxZxp32F5Ns/y8hAon0ZsDsGqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FBRn86lT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LV0EgMJ0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FBRn86lT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LV0EgMJ0"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692FGikD2822856
	for <linux-kernel@vger.kernel.org>; Fri, 2 Oct 2026 15:30:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cs03Scv6zTSJTVwM3WZ7/EMRFDk8Su3MnHfipZGK3Xk=; b=FBRn86lTpDP5qHgJ
	rx70xJg4VvlLM29NonePiD8WPPrxk+CJaXn46IjJxtEapla/a/IbTVwsfFBzxf1v
	OXU21U6oujn2Ut96ljr9kPiIftNyRH68ixkXYVhlBQWfd43ceVERoFlt+zmwY97e
	eXKLo7nFk20GUOIVNwKQprVLOGClqHOm3xZ7BJWK9d0X8U7D86eqLk4vW3UC+jEL
	eXE4IaAUUgABWrbc51jWXCCtzPzXTxuMm5+iCJHD70fqZ5dG19eemlBmPCIiKnV3
	I41ZUAlF8lIEDq0EJQQDF6OXulLG0moLd0drGNKFn6MMRykDxV306mt9dbF9D7SD
	yaVy8g==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h26bp2054-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 15:30:04 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc4fc935a11so5498867a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 08:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790955004; x=1791559804; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cs03Scv6zTSJTVwM3WZ7/EMRFDk8Su3MnHfipZGK3Xk=;
        b=LV0EgMJ01o319dlWo1loTaGzs6FWr+0FJUWdTFNI/oLjwir2phxKB22Xp0C0ooXYPf
         tt2+X6W/b28EE2e0J/M161WC+kJEYSfsZIuJ+k8E405lrjjKbDYS7G4VGQMejLFGhzPs
         unlr5Y1uzy5xR1sLmtnYWwvo/abfbDJ2KMbtLylEY0NDjybR/+CRIBYfx6hBUweG2NaS
         u3HKL1IE2LoCCOnqXH5okPQUJ5phQ19jmmReU1bp5FfpCxRflmmOWHSuGEcvsK1amFCH
         euxIhOVcxewCanYCqm3eDAdRfItAs8I8mBQECZZyG0Ox+dVJMyyiBVOJi+Zq1hr8PctQ
         7BUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790955004; x=1791559804;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cs03Scv6zTSJTVwM3WZ7/EMRFDk8Su3MnHfipZGK3Xk=;
        b=vP9c/elrW9tIbUYFSYZtngafsflS3FDkIkgpdWydNOzQyA/LlzG3SGI7Nb0/W9wHrB
         3PQvgA9R2uq809GVv27BOriecorYOBk+Ogzo20tq6uNIOOxNGZ/OXZ0loSsfUjGByOu9
         vEQXU/lbuaduXUL+Va4Lr68rcqBzedMZw/E9z7jCyyLN0rA39dN1pZCKygjj0UwRqebv
         y+Dnbg/DtnHgw0wSLFaNvN5RKRZk/Ww/GJGf4NWGBsgq9186p43mKYXmBgVA1VW8UrH1
         jeCAteaP/PjYkkl8v9vcaYjsURfODmcAYxZ/Jb2UmEg+3qj3TgE5Ml7+24sti30/d3yd
         Tmmw==
X-Forwarded-Encrypted: i=1; AKwUvBxmTNUpJGPkkKdwl5gEUgjmmvY/ITRfIGqTVGDOTUVQc8y7Y4px16Vjs6CxFFKZCBKu3uc+YPVH30hE5N8=@vger.kernel.org
X-Gm-Message-State: AFuF++kdQTfoeCmEA5XvoIYOlRyUsD+KqDGjrleSLSyF+i0Xy7VJFDUc
	60ii5OkqzIP2ZiM06tiOzaLBWOinJPyiHKUYKevwlHzow4+acTfsIDCePSo730+qigq2RS4TWxG
	MQb1fSfz7kfwYHQAlA51cSdRg2PjlKwLc3HkpfnyDi5wbOBw/WEwD5aSI9gXUULbfoYE=
X-Gm-Gg: AYBFou0OPjugNs11cM/Qe5lH24t5Sm6GLMb438OiRLxRipNQWzWw8llAyG/9I3MDJ0e
	3qN4rTBQd7aevaNJJd2uNxkLWgfrXk5QcnJGXiQIlVw0zvT7psiOnqhD1thlUjys0/eap1wOTVE
	30r2TL8eaGMhA2KFBIgu9pSPAWJraum8b9dP0TcVCVYiLxHH4s78gJJLEdQ6PTVtFBYr5pwLfcH
	xxf+5PXEnRm9cIseTlpaeq7TLuxAjwkZLOXKJlwTwGc/dyi6/RTXRHp+Ridr0/zK4vgOPO+D0gz
	0kSDumxrCRU4ydFwH0nw3/24D1kLbWnMhwgicrbPo7IwM91XL8W5MvY6+VkXZWon8UE8VlSSr2a
	jmlT5OM/6QBAtb6dcYZCFv/6ch0KCdSrOMv5tQXF8ZX1k1g==
X-Received: by 2002:a05:6a21:4eb1:b0:3dd:85aa:d265 with SMTP id adf61e73a8af0-3e0bcf67ca4mr3131942637.29.1790955003736;
        Fri, 02 Oct 2026 08:30:03 -0700 (PDT)
X-Received: by 2002:a05:6a21:4eb1:b0:3dd:85aa:d265 with SMTP id adf61e73a8af0-3e0bcf67ca4mr3131910637.29.1790955003284;
        Fri, 02 Oct 2026 08:30:03 -0700 (PDT)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc9f736cac8sm1159030a12.15.2026.10.02.08.30.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 08:30:02 -0700 (PDT)
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
Subject: [PATCH v2 6/6] drm/msm/gem: Drop use of drm_prime_sg_to_page_array()
Date: Fri,  2 Oct 2026 08:29:43 -0700
Message-ID: <20261002152948.85308-7-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261002152948.85308-1-robin.clark@oss.qualcomm.com>
References: <20261002152948.85308-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=OMqyTiaB c=1 sm=1 tr=0 ts=6abfcdfc cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=19Wyn7e3V/0aNffMjNCMQw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=zd2uoN0lAAAA:8 a=VGg0XEsK77xSs33O3y8A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: IxFSV4P5O3DGIGv1i4BLBRzCXGVneYB9
X-Proofpoint-ORIG-GUID: IxFSV4P5O3DGIGv1i4BLBRzCXGVneYB9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA2MSBTYWx0ZWRfX8Chtd7NKB3dq
 gZh7ufnbyBwSmDTm/wFEgWJj/ColC3gPZR5gWbCWASE3NHho3AWxf5NURa4k3KysDhoXHiEhfdy
 P55zsVOjZcmwb1ZZEnN7AOjZ/LJbGzg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA2MSBTYWx0ZWRfX3KIzc3Ab2k97
 uJjIO4OhEgrTZPbDGnfetpfYxQQETSKvWPWnqA9fQV1cyRRSSOiWLD1uVL9LuDd7OduOSazFdbx
 BdotOyNCtBnoEwmRGlVZcAQkEbE1Xb1LXyU4UlAD413x0/TKuq0uyy4RQXqEyEYuU9eaeLzSHcY
 yW5rmQN5DEkBtaPcqoWlUNrfkzzm0QHKrVe2QS3Fh2OuJhoee4qSlkbWWkxjDPL/bQf7CraKOzp
 g/uvyX2cT0oSBLF/5cluCsVgHdrtbMjUdmq3nuhcpKxZPw6Ozq1oELrnPPHbjuO09t9Y2YlY3h6
 lrPxEaLKwqcA7GmWJbBDKWGJQ6zx2m5CIho00fz8A+1775mMjHcnZJEf6oSIflBeZXipapxtHz4
 thjbTnqAUDHMhQI0BrFOEMCiuN/LQr+iW/6rp+H4ooy+PSqzQp5rkW3YBEgWdeZ13Z3AWyoM8/y
 jcswPleVzYXJXqm+G8w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_04,2026-10-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 suspectscore=0 impostorscore=0 phishscore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020061

Now that we've removed any use of the page array outside of paths that
are restricted to native (non-imported) objs, we can remove use of the
deprecated function and allow msm_obj->pages to be NULL for imported
dma-bufs.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Acked-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/msm/msm_gem.c | 27 ++-------------------------
 1 file changed, 2 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 3111d7389572..130ae27ee00b 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -1116,11 +1116,6 @@ static void msm_gem_free_object(struct drm_gem_object *obj)
 	if (drm_gem_is_imported(obj)) {
 		GEM_WARN_ON(msm_obj->vaddr);
 
-		/* Don't drop the pages for imported dmabuf, as they are not
-		 * ours, just free the array we allocated:
-		 */
-		kvfree(msm_obj->pages);
-
 		/* In msm_gem_import() error path, sgt won't be set yet: */
 		if (msm_obj->sgt)
 			drm_prime_gem_destroy(obj, msm_obj->sgt);
@@ -1350,14 +1345,10 @@ struct drm_gem_object *msm_gem_import(struct drm_device *dev,
 				      struct dma_buf_attachment *attach,
 				      struct sg_table *sgt)
 {
-	struct msm_gem_object *msm_obj;
 	struct drm_gem_object *obj;
 	struct dma_buf *dmabuf = attach->dmabuf;
-	size_t size, npages;
 	int ret;
 
-	size = PAGE_ALIGN(dmabuf->size);
-
 	ret = msm_gem_new_impl(dev, MSM_BO_WC, &obj);
 	if (ret)
 		return ERR_PTR(ret);
@@ -1368,28 +1359,14 @@ struct drm_gem_object *msm_gem_import(struct drm_device *dev,
 	 */
 	obj->import_attach = attach;
 	obj->resv = dmabuf->resv;
-	drm_gem_private_object_init(dev, obj, size);
-
-	npages = size / PAGE_SIZE;
-
-	msm_obj = to_msm_bo(obj);
-	msm_obj->pages = kvmalloc_objs(struct page *, npages);
-	if (!msm_obj->pages) {
-		ret = -ENOMEM;
-		goto fail;
-	}
-
-	ret = drm_prime_sg_to_page_array(sgt, msm_obj->pages, npages);
-	if (ret) {
-		goto fail;
-	}
+	drm_gem_private_object_init(dev, obj, PAGE_ALIGN(dmabuf->size));
 
 	ret = msm_gem_init_bookkeeping(obj);
 	if (ret)
 		goto fail;
 
 	/* Now that we are past potential failure points, set sgt: */
-	msm_obj->sgt = sgt;
+	to_msm_bo(obj)->sgt = sgt;
 
 	return obj;
 
-- 
2.55.0

