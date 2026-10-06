Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83CC63E5594
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 13:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791292213; cv=none; b=RYmQqPGOUjNB+o1fiRBsb6mEiEPqiYlMpx0v1els8SMBKe89vjWHBd3tof/8+09DsR6ToxF+tpS0O6614wyB9F5Ev2QISHAQf8nhF5em3FP3a/D0nFLUItEw3bO+5DOgSGOldqcvJCgFw2e6R94NW5mEaiQBSF5MrGrLn7SsxZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791292213; c=relaxed/simple;
	bh=E4IQJ8ElIGDhRKgbQ0gyKV2IsPxfzamJjIvCSsR6buw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sV2NZBnxolG6UoZCHVkGa179wKMBziSLmVaMFUhZJH2yQ1usRoPFOjBD20m+AqgPEAVEOUG2AVyvNWfzNMUHCBDOgqyCiTSWadtR1cnMa49okY50st5qRyzJVdCSqm1jiO4HDS4NkJ11QY1j7l6/fYB34Pqsoe4bKRdJQlUHc2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p1/5W5uy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fWlfKWTD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p1/5W5uy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fWlfKWTD"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 696BPHLs717731
	for <linux-kernel@vger.kernel.org>; Tue, 6 Oct 2026 13:10:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=XHpXieFsXX6
	qHFJWj6txetKx05HnT6IpWTUeLEfybns=; b=p1/5W5uyBDgI05jG1sFDsqFBTr9
	5iA6VJffEobuUpQ70jKlpKhYend3vN2yG0EQxoR7k4ZsEaJ4YBat6bNOrG98q6n+
	j9pzmgg1nPv8L1XjQRVDyEV/y522cqIJS5SxRMVAXnX9++uou0uIgxNDl9L5teXB
	9pWlhxnuUwoLgOaNfG4tHShmjVXZjddXQV5HCU2eOo2XUEfTfP8t3YWRerrG3GSd
	zqNkFyrghPtjjw4fwmTk7zeQSlFXYPQJO/zm6rlDSdD/ed2F5D2nb/uM4jJpdSzN
	R12BgKTLzF7yxlyvL5c6GGJQvyasDolVR76yOVjvbI5wCiBLd9y5cX1a2yQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4gr3knun-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 13:10:10 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-88b45cc20ebso1695208b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 06:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791292210; x=1791897010; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XHpXieFsXX6qHFJWj6txetKx05HnT6IpWTUeLEfybns=;
        b=fWlfKWTDTjBnRLQ/+GCe2wx+fZrcZn4r61gLWKsZjFZi+hjl8ESwuCPaLJYBz9jioX
         IfQW1AXb5HFflXxsa44hiM5YGQZwntqk1k4B7MVxPTALlF8YDYUqnB+KODy+k1/sG9t2
         jKnDI+yL0cEWn1c4maFDN0ysBkmfdrTFfEbsfuigD5Vj/BEZVNCSL9R2LT8Uqt/HJZT9
         UaZ6SgtXC/n5cif4Wo185//MR7931ceW7cHSrf+sV0EqZUjgnuhYAfCkgBNFJioW4Gmj
         wBI5ovw/joCUdW2SAbV7lxQhW7YoEaz9yzl6ZTokfpHg9+HtoJWUmF0OG89abhLpAL+e
         2v1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791292210; x=1791897010;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XHpXieFsXX6qHFJWj6txetKx05HnT6IpWTUeLEfybns=;
        b=zcceBmK+ms2pPgVxNZbgaForD/QZgnJYUuje2lxGuZtW85VJZxtejledIaAv7C/9j0
         0aSgTFWN9f6o7pqaLPBdBm4SUO+ASid8s+Ri17bk1H6vlYuMmZfylZHvcUwy/FWNDoYQ
         ewNmdZ+aqsFiwh5noHJrJmUdQ3JG/ui+dwGpnnP0I0wlP863mTipELVwVK9RarnX21Ix
         35hYuSlIRTDX+XxuHiaw+L2Ma2qFvmb+nJ9BY8Ix53s5dyKWcWR0ZcJl3X3th31uhjsM
         bKLAgo4+iYTLq8y2fhveU6DQCvfxhb7Mt+04armjzfABjMkyMqkOv1RYudCLSKd3Ox6m
         hk9A==
X-Forwarded-Encrypted: i=1; AKwUvBwhmAzfFgXaIrs94Hn8W1f3r3+Q8WinACuFs0r++RgoTJ4R42CgruIBiJPkETQYErcCtgtFa93YnA/Ymh8=@vger.kernel.org
X-Gm-Message-State: AFuF++nl2OpM8dn2hdOmsEcXJoUW2Kzt9DDX/qrgJ8EDbsNn3dhkww9N
	ls7h4cOCoeSg6MFVHj3BxVo2sqDOt4WW3hII7XQ/WO5f0/MedzBZsGsZzbarS3w86NMPF1vgQ11
	dM1hlB7pqROmXMhZo3Nc7zxR6OYEoGcOtWv/a8c4+LQiopHV8Hh9CiZUo4QTAm4sSsOI=
X-Gm-Gg: AYBFou3kFVMT+pcUWRACRdBkkJO5v8k7esTtMgpj2cR96nwszKJt+Z7vyyiyroP5pcW
	28XULhgAJDz+i2agiGICYcal84VgxuPh+X1/ylI53lCcpL++UCUB8Br8Z5gjvWhFzl5kxuI3v/q
	v2D9ZKJmDOA9dIr7oDfw30+kcpUj7kg7DkK4qnSnITpSyOpkBZ/ALs3dllM78WAYMLiInxx9/+0
	kvoLU4nevIDA7riTe47yh0/antxdAqT2lvW8gCpcrnH0K7JeQ4kxoNtamGfdDz/OyYxUJf/aYTB
	VA57XLfWqb69O4CNmVyHviYHIfvywBHph05Bv4ktM+VJ96ohBkmjJ8SqBtL0/U1V253PfYn5VQY
	fNaXvGTKXiXJWehTlaaS1vinrqLCyPowduhML7YXcRGXR1A==
X-Received: by 2002:a05:6a00:4b52:b0:874:706d:856f with SMTP id d2e1a72fcca58-890debc9693mr1171597b3a.32.1791292209908;
        Tue, 06 Oct 2026 06:10:09 -0700 (PDT)
X-Received: by 2002:a05:6a00:4b52:b0:874:706d:856f with SMTP id d2e1a72fcca58-890debc9693mr1171559b3a.32.1791292209441;
        Tue, 06 Oct 2026 06:10:09 -0700 (PDT)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88b0c3a4498sm4744401b3a.31.2026.10.06.06.10.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 06:10:09 -0700 (PDT)
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
Subject: [RFT 1/5] drm/msm: Cleanup if pages_to_sg() fails
Date: Tue,  6 Oct 2026 06:09:52 -0700
Message-ID: <20261006131000.81501-2-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: jB9lUb8ZGLvwvmE_bxZ4KoldTgWGVKmt
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDA1MiBTYWx0ZWRfX03qmsbRsF4dP
 gZ49v4g0SKMRHnlIsavjtm7sKTOlThYKjdvW4aR4gDCNdPALmaXU/aRmnKKbWvkgKVf4fBMBOHO
 i1Zo86iT/NNhzoaq7JBCmBnXz0ksWdg=
X-Authority-Analysis: v=2.4 cv=PNWaavqC c=1 sm=1 tr=0 ts=6ac4f332 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=19Wyn7e3V/0aNffMjNCMQw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=aq7xQ8hs3DLR8BDoFBQA:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDA1MiBTYWx0ZWRfX1+t5P8q/MBQt
 /ecPadbVTtAqhAEPIVjJWI5UeoP2Y424BfdTA+QFWLii//vuo/PSj2kNqNTrel9g1W6yk7yJm2j
 Ojb2LQkvPyX+QFQJx6KYAY4oJwMv1etyQvLWOJhPSowK/SPrA9oXiBcEaz3bgWTs6S2yllFl/xl
 4wZQbtII+Wu6x0Ukt9GSnsfpCM5L/suW43C3UNJDxPvtNGF76a8/1CMVN8w5IwECqSGKKqjkcco
 l/gc7s18cQblnK6cbcTlf45iPpCTXzCBN8dqM+y32SiS2NrPzXr98zvB7pNMylCzi+V7w5clf87
 JcgFVeeC3Sp2dOqIS9Ngjkq47S6yJYoCdTd2yvdcRdZ9fOSNnR3vu32i88fQvJxFy13OFomiOy2
 iW3zNKBvk6eOQLtaLU3mqI5qEo+Zy1uiCGeXHcudG0O3kOHALNgwMQzTQoVI1MDdZ/ceI7hPFkd
 xUoWdi8Wl1R3HomYIug==
X-Proofpoint-GUID: jB9lUb8ZGLvwvmE_bxZ4KoldTgWGVKmt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_03,2026-10-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 clxscore=1015 adultscore=0
 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060052

We never really handled this.  But in practice mapping to smmu would
have failed without an sgt, which would have been pretty obvious.

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
2.55.0

