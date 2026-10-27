Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793142313;
	b=tRKon2NqsKqxL3wuLelgvPBRp2JacIgjvhc5ES28V7pKctz7XAE4wIOuIWnbhxOtrECE
	 BfGy27/ZzPYpgnjsAdQGDUNtZ4Xqj6R1S5ibdCtjwJSY3+g7cPsEd8h2KyQl4qCZ/k+Gp
	 Q4tdVqn82itaLtYfgJS4EqKWyHACYUy4Wk9E79z7Bw+dPOdC1bd8EjnGlWwjdqZO8cFet
	 U63kmtUel4etL+iCew/OPAZDTbPB5qYmJePgzZLAZZE7K2Ysjh7BTH1MI2WfZ8Ot4Qk5t
	 vnlcyGkt3i+mOSt70wZvwUGl9mXcL3gbVnrjRvPr8ge6yOZIVyfNTepNuTPE/B2HwSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793142313;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=IQvi+0f2Rse41JO3L7I3q1SbrfSk2n59JOoQHfBvPYY=;
	b=3Zj5GSEqaEKjzNnOdGkTfuyYvB39Q43q/cut8PQ3LTWDDlXh4sWNaZUd54fV0+G4aFmQ
	 1mzRL/XGVh27svc+xGjYJISffpeAwYk2Oysj7Lur+GRJkAvrdz9LabOJ+Tv8e0EiANy1S
	 NAPGeagX/IuoYP3ZNykK8vzvYPx7nGN6jnz6fbAHoeiUPy7kAvred+fjXcLSLzrLy3Ry4
	 ZWx1/aEkeNVGMqir23qhoylQyxHJ8iKq3bZ7SSt0V1toRHmidCqXzrPIPuW7FRMKjI199
	 1fHaE7NZuTmaWzg2XM1kFyoLeA8YV+pntdaEgyHVIuJadvcgwWzARh5XzGOLIRpUMvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g84j1q7U;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KgQ8txDr;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 321B6606A322
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 23:05:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 321B6606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g84j1q7U;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KgQ8txDr
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RKsvJc194121
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 23:05:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=IQvi+0f2Rse
	41JO3L7I3q1SbrfSk2n59JOoQHfBvPYY=; b=g84j1q7UbFXHHUG11BRHlyQpkns
	7og453rDFUjZdav6DgbeW6bCmx35YK424PKxMKoYGuPWWr/YdG7UixYLG7rKCybU
	TdxqzkEYPi0t8ypbtQ2pHocr0wrmuW6HNjLUtZTKWbGA9xi1OJTOzdK1YlZTLP5w
	brJLuKlyVO9MJcNN3IFWfPp9bOfuC6sEbUKdXYjLIz1kIVjGfNYncSWNrU8jYTJe
	PibJA4iFu7xaCkJk7zaz0D4AAo3DA6cJ+INAufqM2YzwSpZvcxrklVp71dVYUm2Z
	eADnFNFWUFt+g4S6ZDaVXGbiwPCM6qsYxHK8qilArhuqQj1i5EqjwwBt3mw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk12prwpw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 23:05:12 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8a08e315b5cso150956b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 16:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793142312; x=1793747112; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IQvi+0f2Rse41JO3L7I3q1SbrfSk2n59JOoQHfBvPYY=;
        b=KgQ8txDrS/E6dMn58ouaFRjHFLwNgVdXuAOy5O5bbJ6EgweE60WndRNQPRvoPO5dB3
         RHvn6BpJJFGREq8iLRpOauQkm2TyBnJA9c3SFnljvklz/lwZqGc84DlN0nKnwQ6blYFK
         RiORpMwsfAN0mAxpEIxI7zPJD1RN11o/LQbuUevOJNB6BpKe0jeAKwDt5SSXhYsZrkiJ
         n9VtuJE/tUDteQ6BdgazOciuxvLkIlE6xPhE5Ui7JeekoT6mm6YDI1pQCFsTIOKzvS1o
         5/nLDMlnP1+klDyHPZ2eYJYGGcobImt8r64oTZTQ28VLD4aidEqH3/qAhUWv3XJ92dKw
         MS5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793142312; x=1793747112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IQvi+0f2Rse41JO3L7I3q1SbrfSk2n59JOoQHfBvPYY=;
        b=UXED6g/STgVS0osVlbJ0GGuaFxy9StMTmV0M7nIldkiIwdqHsaefvVrx3H+ZjBSUxs
         aLIpfGhAsSrT9cw3Ep4aTfDWLMKOI3Dsdq0T2zkU1qAeM6tDslbGmSoOVpczg75P8CCy
         L958IVEGBpsZWXS+6s1+awBzN5yrRqdLgr7XWzMUYCTkhVTiUr1N5iXcXJJO+ABteMyz
         i+k3s3bOT00DUfLWR9NynNjczg/b2ah5Mh7CzGrTiIAoF2REVFR7U85vogUUOtLcJzuP
         E7AXKP4qr3/u0CSjPtVZPLlxcoIJg/49TlwQclDz1FEqDRFtKO5pu9fUSfslSq+jcWsI
         55ug==
X-Forwarded-Encrypted: i=1; AKwUvBxQf2JhOBfnlAk13VVHSbzcM78dmMCnmVPoXhqIy2YEAFUzjlMYgyArfH9rYuHUHU+3Gb2S8wE8IGNqNB4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKtsKrRR96So+5YtyVVa8hXKvexEvR2v1oVTAdBhfNWbyBD8CJb
	YcpFs2RxeJThlHnSLdwEqxTClWSiGvL7/Y7lC9RKfARX9a+YJvrCMe43CQ5gFdafuYd2sEdbqkf
	vBMH9IwmA79ltFDd4w30g4iweftU2/t5tLCwgA22Gt6lZOLnQZK97FKOxMcsXMji5JXk=
X-Gm-Gg: AYBFou0WC8dMb8Vb5s7xsKHJmgPsA8LVYSQzAW3Ei/r8yigjRloqd60iNgC4rEB/1iO
	8avtHNq8xjNxpj0rI3GJ+re/DwejvioEmRB/DQxAO1o57ZQ47J0M329c5bp//Mmhgk5fGE1sBIY
	faCZDkMTfl/7ztPJHOTcNQtxghuG4n6yr6vTrFZK+yVx/P/KgoDg0rbNNMXETup8o9O9wQPZn+m
	C/YAO3rR0G678wzUFeUcrnv9GGEqQzvlrYhwcOkryXJq0t27kzLssVXMiYJyQAzJS3wYebNY5jN
	z6ZgIBVAY5rXZ5N3OIiKW8zvMdo4qT44THbzm4ieq3feEeYR14qJ+FiqCREFhtisGXjKMzZG8ne
	VUrXdhmowzlzCG9A+gkRtCo+MhOnpjG+wTf7pf06xJquLMOH8
X-Received: by 2002:a05:6a00:2302:b0:89c:967a:a74a with SMTP id d2e1a72fcca58-8a6e6ff32admr458748b3a.22.1793142311709;
        Tue, 27 Oct 2026 16:05:11 -0700 (PDT)
X-Received: by 2002:a05:6a00:2302:b0:89c:967a:a74a with SMTP id d2e1a72fcca58-8a6e6ff32admr458726b3a.22.1793142311228;
        Tue, 27 Oct 2026 16:05:11 -0700 (PDT)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a6e634ae83sm187198b3a.20.2026.10.27.16.05.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 16:05:10 -0700 (PDT)
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
Subject: [PATCH v3 1/6] drm/msm: Cleanup if pages_to_sg() fails
Date: Tue, 27 Oct 2026 16:04:44 -0700
Message-ID: <20261027230452.130031-2-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261027230452.130031-1-robin.clark@oss.qualcomm.com>
References: <20261027230452.130031-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: 9Y1clKrqCfkHTyem3jmpZb7fDNhOh7Yg
X-Authority-Analysis: v=2.4 cv=DtDDa2/+ c=1 sm=1 tr=0 ts=6ae12e28 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=aq7xQ8hs3DLR8BDoFBQA:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA5MyBTYWx0ZWRfX0MK4PbQn6vGj
 r8P4+q2LQWuX6sycFOy9dpuiJXlPghg6da5Gs7TSn3iMLrGCP+O7gEUGzQwcQsBXP59bHT0jkfY
 XbYgVrGZYvj/qwVnhmQpsSAzR4sO3QmIK3dEnK0AsHOsI0je4bb/1GxhkaU2WwJHxuMfOlzRPvj
 5GsBneD8bw+wmszv+ulG1NlUFJNajQNbcTOsPmQRYA7LDhFnVFWtKvhxiKNSUwPg2Z92ZPaRfuT
 NW6oEUAmj839/mmFa+4zi+REOrTTI9JGt/IkDfbxf8raaujgKYx127GoBl4yV82cy7fzTq/cbjz
 +TrfYpsUCFWUGkUpLC+IUNgOUp7ZyDmBTpkz8/o6jx9CeRp+WmbxCBRJv5ZZFwGuyh2aX4iYc7Z
 HYJ4JE0aGYBEmXTCFk2TocXMTjk/tzW58Hlnnw/z/Ez8xZS9vu3S0WVRA9qlKNHznZ9W978O6Az
 ECsJ31isWJ0FPJowr9Q==
X-Proofpoint-GUID: 9Y1clKrqCfkHTyem3jmpZb7fDNhOh7Yg
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA5MyBTYWx0ZWRfX9I+66K7QQpHi
 Z4RLA+lQsPnLKKAdfx4IJDOLJ+78NDf6W0l82gPCKFY3SD8bUSAULSoaUj5kLWL3+8PvVyz7bg8
 +DX+TcbW4Z9n7qnvrc8DRqXhz4huTXU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270093

We never really handled this.  But in practice mapping to smmu would
have failed without an sgt, which would have been pretty obvious.

Tested-by: Jianfeng Liu <liujianfeng1994@gmail.com> # x1e78100 (Acer SFA14-11), v7.3-rc5 + this series, CONFIG_DMABUF_DEBUG=y
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem.c | 41 ++++++++++++++++++++---------------
 1 file changed, 23 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 130ae27ee00b..181b9ad32672 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -190,6 +190,7 @@ static void update_lru(struct drm_gem_object *obj)
 static struct page **get_pages(struct drm_gem_object *obj)
 {
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
+	int ret = 0;
 
 	msm_gem_assert_locked(obj);
 
@@ -209,19 +210,17 @@ static struct page **get_pages(struct drm_gem_object *obj)
 			return p;
 		}
 
-		update_device_mem(dev->dev_private, obj->size);
-
 		msm_obj->pages = p;
 
 		msm_obj->sgt = drm_prime_pages_to_sg(obj->dev, p, npages);
 		if (IS_ERR(msm_obj->sgt)) {
-			void *ptr = ERR_CAST(msm_obj->sgt);
-
 			DRM_DEV_ERROR(dev->dev, "failed to allocate sgt\n");
-			msm_obj->sgt = NULL;
-			return ptr;
+			ret = PTR_ERR(msm_obj->sgt);
+			goto error;
 		}
 
+		update_device_mem(dev->dev_private, obj->size);
+
 		/* For non-cached buffers, ensure the new pages are clean
 		 * because display controller, GPU, etc. are not coherent:
 		 */
@@ -232,6 +231,14 @@ static struct page **get_pages(struct drm_gem_object *obj)
 	}
 
 	return msm_obj->pages;
+
+error:
+	msm_obj->sgt = NULL;
+
+	drm_gem_put_pages(obj, msm_obj->pages, false, false);
+	msm_obj->pages = NULL;
+
+	return ERR_PTR(ret);
 }
 
 static void put_pages(struct drm_gem_object *obj)
@@ -246,18 +253,16 @@ static void put_pages(struct drm_gem_object *obj)
 		drm_gpuvm_bo_gem_evict(obj, true);
 
 	if (msm_obj->pages) {
-		if (msm_obj->sgt) {
-			/* For non-cached buffers, ensure the new
-			 * pages are clean because display controller,
-			 * GPU, etc. are not coherent:
-			 */
-			if (msm_obj->flags & MSM_BO_WC)
-				sync_for_cpu(msm_obj);
-
-			sg_free_table(msm_obj->sgt);
-			kfree(msm_obj->sgt);
-			msm_obj->sgt = NULL;
-		}
+		/* For non-cached buffers, ensure the new
+		 * pages are clean because display controller,
+		 * GPU, etc. are not coherent:
+		 */
+		if (msm_obj->flags & MSM_BO_WC)
+			sync_for_cpu(msm_obj);
+
+		sg_free_table(msm_obj->sgt);
+		kfree(msm_obj->sgt);
+		msm_obj->sgt = NULL;
 
 		update_device_mem(obj->dev->dev_private, -obj->size);
 
-- 
2.56.0

