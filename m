Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793395981;
	b=AKmmQlqcmE1SrAbnc55jxcjzCiVZP/ID2TYe/hmU2Teq0Mwg4u7SEJH4FgUnfd4SOiFQ
	 5bhoZSDEJhuPeDtoBoLSwGB4BqaO4uJBfhrx2mY3rpFv0h/pjVXFx5M5lhwksZlLL8kTQ
	 1X3cXj6r3EhNHirz50i8DZqKoINooz5gAxKB7DWgLIavva6Phpl/F0auhAywrPkMMkvfb
	 lrH1J1pRqylIWDYAAQhvJ1ZyIGiyWV6aNgAEh3Zn7uaYN0UXuYNlB+S9iqO2FonwpiEgz
	 eygwPqxMXgh4vrSSCjy4Cnh+nMxpa9Q4wzZ7pXNZx40tskdbJRqpVMo8+JQOed74mGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793395981;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=IQvi+0f2Rse41JO3L7I3q1SbrfSk2n59JOoQHfBvPYY=;
	b=wq/PFGD11zBPBC4Za4IYWtlXHH2trHc1e4/sLVAJ0/Iu54IQ1q7v79Py892GphY7xIqI
	 3mGcJLafnXuzaOqkVUI7ICrU6undLu3of5/dGlb3VYASCOduIG2mx/B8M4fnF2JVTCGSc
	 EixpXTGOahd+9bF0lHUFwnFknGO9JoKMo3CGotK1CxTFmsGGhOcS9P4SpAiBNZc+8U7k6
	 7rdM2vhb5DHRsCXhodXbhUTdZdyUcGsH4InyXrIzgq7iIj/D8zvFiwUdqB7gV+QVuURxQ
	 SmEcRZ5wonw/bT+VOiiI+gDy/p3zMZB2F4rMwavcViZU7M3wVMTPfUTjOQkOZPbouLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IxC4vahc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TuQ4aVre;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F522606A323
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:32:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F522606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IxC4vahc;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TuQ4aVre
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69ULBL7k800842
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:32:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=IQvi+0f2Rse
	41JO3L7I3q1SbrfSk2n59JOoQHfBvPYY=; b=IxC4vahcMc1L4AZO7S3CcxoXxW6
	w03rEhRkHQDVMCIWd8IjeDnGhXzbKxisVIAYHxt24jJrcKfjIrXcDiIYdopBWaWW
	GEGjEQP2dE2hxmv58aqRtTLvzBeQ/vi5IADI/qlYDiMo4MwEMGXlgamqwplC3NHs
	AsDbsm9E+SOxvoE1mM3z55PPL831DSLxvJHrhhg22Xe63muxVXn7pnwLvJYDs6x/
	oz3fHcNyEoY3dEu203E/J6Bjr4db11DhNB3nEeddTZ2YS8YgHA5I/jRbCYFtmJ32
	2t0+O2uzjUjpBskfJxX4B8+kd/bWOIW4hphcSi9Zfc0DGkgr3Iz0TVL8hRA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn2x10538-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:32:59 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ae19907a31so1180918a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793395978; x=1794000778; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IQvi+0f2Rse41JO3L7I3q1SbrfSk2n59JOoQHfBvPYY=;
        b=TuQ4aVrePKgexyXf6rRKfng8OEXK0TYscIiyx5YMVDnU9Ix1RSB+p94Y003IBgoGSt
         efvxAJgqXvOil/i4DvE7omwvARdJ8DkHcNXeNjsZIdYRpHCi+G/h89ZqSnWJexY4XVi5
         Wk9bxjxv4fMycWbU0ToTXB4FP95wL7vPscc9ikr8SS0CG56JgOiBm34Kc2E9MrFt4TZv
         sL9n/7/2WbU550Yp8m+5OKAWYt5Bok3nmKv9HWYw9dqfSioTDf8X/tEoMJdNyZynyrS9
         ZyYLfjYw0SGkECSf1SD1jbSWzQWtc4GvmFqxh4miU6Q/yPa8XPY4gZnFNUkeZN5WxaT7
         sztw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793395978; x=1794000778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IQvi+0f2Rse41JO3L7I3q1SbrfSk2n59JOoQHfBvPYY=;
        b=FrBEWXFXW3rV1EwLPZcwJAjy7+ibBnsQty62+eTEQx2GC4KyAEEC7ErMvvMIQHqKqI
         1ZRgpuTO0/rApKcu5PQxLlH8EtxhcOadNmA/OVEI0jmlUpSWPFJh0R9253dbeNMO51tj
         9rEG28cD116AQsHkPuv3BAeA8sQqxydstui6JzK9+HngUZzoIVniXC6N57mOVHMU+SWT
         3mdZabjHIm1dKt4XoillUVOogtKLEsIj4h+vw/Lr0LYP6LRf7XykAijMlqbLlbKNsOc/
         OK5fBKe3vSbFgu+MypEhmJMpt3eOo3Jr++LnJaPLvJ9kf37jaZQLgH979SNxTo5m87lE
         5gcQ==
X-Forwarded-Encrypted: i=1; AKwUvBxXr8g8KeJAdH9gBm97eUTvj7RysWVPSZ+T3VX2pgi5PkpL6n1Ue1TOMdJSVlm8Ji0oZz4/S6KD3sLSkeA=@vger.kernel.org
X-Gm-Message-State: AFq9FYK/pm0HT11XoxyjfQV4xzV6m3Pvoll7tLWNdDLlmq6VWXsK7g3F
	E6c2MOGJuUw6bT4+wbfMfkolYHkiDtQoS8V7bf7tP/aYXFms9mYBi0zxXgPY+UbZElZMw44Cdqj
	9NbymP7dqJycXMlBBXWUCJ5/TXnQJF7T1XwddYjcPAJXZnRf9zkPWhmpQwBJKw3PWHwU=
X-Gm-Gg: AYBFou32u2ArF3FnXBFs7qfvxa93KyunHWYpnrCHFFONBdJf8kLpw6Qz5qdAUWdBvku
	HnCVVc4MEZ50iOW/m+/NavknTV/3uBPKUWAY2E8SWHAqIgDZNn1fyeYZcUJg5GCD0LckmGwqUgn
	e+aLORWBQONO8STA5tHa6g5b+NCv0a4k+yxKJsn37hslarmyxti1/OXmDYoSWRBfV+j/iqKqbn1
	9CZKmvckirnd+dIUukd8+iinTzMzzFtS+Ww8DFifWYeTp1gd0KFf7LktdtjUDRxelCEBFaYvpmC
	x9doOmI17KjfnM4j/MrT5nHB51EVkGvx4aXmNYW792kGFXJJ3qXUkuQCHvAaFAoSq83CZktT6MA
	6fM9zDaq5CAre/v4csMK8q2l4RpEayAk2BztZmFlnkIAPRERyiIf6m9KOggx5KriPystWxo6DTW
	3Qr1fPcqK0ObJY9rqkVCx4eA8=
X-Received: by 2002:a17:90a:ea0c:b0:3ae:8983:4ef8 with SMTP id 98e67ed59e1d1-3ae89834f45mr1556489a91.9.1793395978127;
        Fri, 30 Oct 2026 14:32:58 -0700 (PDT)
X-Received: by 2002:a17:90a:ea0c:b0:3ae:8983:4ef8 with SMTP id 98e67ed59e1d1-3ae89834f45mr1556460a91.9.1793395977628;
        Fri, 30 Oct 2026 14:32:57 -0700 (PDT)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae845df666sm5339033a91.14.2026.10.30.14.32.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 14:32:57 -0700 (PDT)
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
Subject: [PATCH v4 1/6] drm/msm: Cleanup if pages_to_sg() fails
Date: Fri, 30 Oct 2026 14:32:43 -0700
Message-ID: <20261030213251.55365-2-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA4NSBTYWx0ZWRfX6jpxpRKoKXRY
 cv0AtHht0rRH+04BM6x5w4GlBnJoOwzSrf/LKnBmWen1kty+hXv4tXx3pgrwzk4cVbwGWYSJFBM
 k9FOT3WyNPQgGahSJaWs4SpuqLWt8KfAgnIDx3LE1f01xrEuUB1mV7CKVuJcKxSfVoaR0aZJK8b
 ummvAjuEbOqvgpngzBYfusI68ZizicyRMYOH8sQ/02mEnEJQj+O4S9ACRP58gLx8sCBpcaRTDvE
 Gyhe4t3VxoMEUCp6cgOecf9d3lKmpEHqk97xcTkazcBtt6DvMhe7U/nww5OtZhNK8zzXzAssluh
 BVUUi1YyzzX/Jy5NLqjchLX/Cx80O6+XFzm9Rar7qCgC30hjFkVaXD7C8ci7Jek+5IwoO2QSx8j
 PO+a+pUxdVtzJ0KvOuvHrbn6tnQ9Uw==
X-Authority-Analysis: v=2.4 cv=CLG/zhrD c=1 sm=1 tr=0 ts=6ae50d0b cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=aq7xQ8hs3DLR8BDoFBQA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA4NSBTYWx0ZWRfX3KjT51rN3ImS
 WRdW3yHE34R5Y07UweTQ362FftR236mTsG1/G3kfU3ECU8SEesXqxLN9r6gJvIkKgHhGTDm4aTv
 KU7tCi51O0YYnUcPKLotdRo/1FHXo9E=
X-Proofpoint-GUID: 5T51mTKvAxB4cYeITSUQb3ljdFB8ivHi
X-Proofpoint-ORIG-GUID: 5T51mTKvAxB4cYeITSUQb3ljdFB8ivHi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 suspectscore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 spamscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2610300000 definitions=main-2610300085

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

