Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793114910;
	b=xiZQQD7/oUjStSyDbSP0FS/ALM3sQw2e+rKpqXBoZRlkygvBZkGH71QINI6LTuKE/Qbk
	 ACgFhAPNWNIn9wBumaHydPqHpl4vEshhMH2h+6okAewgLlZ5+UgBWyosEibSJjV+qTv3e
	 kefOxp8op+jtljQSzRcvixjI2wZSIsZ3HPMTVciyfnWm5DmjK6FQc+LJhQrUDA5mvYsM0
	 28MKNTp28jgC2m6x6rHEU6EipXh8mJwUpIyYhC+3a1q6UP2Z8S6CJERP4joeDqpXgVPd1
	 hHb4gi/SM/B2Tdw1t1WECgFHvTH+7/kkInLTHo3CVWm1EDt+qjD3aIdkaQx8k1hvONA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793114910;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=IQvi+0f2Rse41JO3L7I3q1SbrfSk2n59JOoQHfBvPYY=;
	b=3DouSFlf2dnbEV/SE78dLSQWah/y6o+jv8UxvMUzORnZEFY8sIK/xWET8WK8y1Yrn5bH
	 tVmpLKwrnJ4DMAewY9qysTumTvw7HpQfjG890+qmsX/W72GvRQ2A2Ge4Z47Z0IB7sQJM3
	 A2hMzV/YaVduGMBswElOFyaCjDBT6YvTDMSoCaconLEMVbwfT2tlYxqn4J8sMDRf34/Jo
	 luQZhw9jzvE4YkRx0x90N2YgoQ8KpkhgRRZ88VmLH10p8GYEp9fJEBczIjczivlv//TIY
	 1nUF9tkJ0fXwOIRnH9WjOV9R+XKzeTXmqfZ8LfSVY3IerPIqpDcRprSjjYO6wbetpNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LfiPJpxg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OQkefLSZ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A924606A31F
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:28:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A924606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LfiPJpxg;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OQkefLSZ
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RFKx6d3639540
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:28:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=IQvi+0f2Rse
	41JO3L7I3q1SbrfSk2n59JOoQHfBvPYY=; b=LfiPJpxgxqDN1jOOc2kc09Dt+ic
	PI4CGH3S/uz3OVQaYks7W8g7UAlAJlqVAJRaDCe5h5lOqv0WIETC+z9W7zpLDgZX
	2KPG8xkoj32Ao6qWJmP9hInwa9YNhq4J2JPXWABumBRStAfjkKJV1n43tJCMrf7H
	0o3DyAHEn/W4VKOB8qdTS2dgbXEx/gHpZKfLbrGjYtwoXIM1zVPbPWc1/jeau5pZ
	C7WRsTJhtKzDjqbZahmE4nDINrpeEfY+BEuZXjoGyM4bULN1aTeUqxjr5klgPA0a
	JGJDfmzbI/PWHZ3OXVG3w/QaqbfzX+lCAbh3Mol1xhllWIrNPEnSabLeCDQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hje3dbt1e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:28:28 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cd67466211bso32231a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 08:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793114908; x=1793719708; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IQvi+0f2Rse41JO3L7I3q1SbrfSk2n59JOoQHfBvPYY=;
        b=OQkefLSZ0eovSnq2MhzBqRssVlgDRBLSlGl8dXyusSNMp6GXBiE7AqRVoBz+l64LpZ
         ZFTK7yCImP4tTDLWmhhYL7sURQcbKrCoC2xSQqlcYBNFEsDStv/8yBdW/SVR1o6NtvGY
         oIbJ0ISgm72NGDJyvE3sEim4LM7Kk0+K2IXke5LF09GKPj2amVHbxsT9lC9b8KCPqdWA
         nONV0ULYBmQJoHRZZwdqYC56tlthqGj2H73x4FWtStKzhGhVkyhU4mtzYWVCqGGqy7oK
         +yKUb4cof7i2HKs5fNRnmXcV1XUhBkE+zCMBBGc5Tm3drYicg9Ebbu4ooS06ryxsAz1n
         kb8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793114908; x=1793719708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IQvi+0f2Rse41JO3L7I3q1SbrfSk2n59JOoQHfBvPYY=;
        b=erP+W8qN20969JrxEJR1twDmtm0SfL1wgrTI/sNfCzdUNnsZE/Ijbd+wBPMAbf6JY7
         un3bf+YqaMoBC7AI73yHnWsU0a1dBjbNWQtryEm4R089JOC6C3M5qvUp7YXjRY+1nDrs
         FiJNCa2oPnA+bf/4VrhvW1BAfYNauyxnZ4PGWoXbx65X/nDhHHkA0UnEpLrPXoKat5wG
         aAk1rJxNaRhzuiAa7nUFE1WnuQJGmjVhKoPFVy7aKJ5puSJ63usnVS1Yai2SaLH3CB7f
         w2ts8YkQdpX8YeHwB9umcwUt6lnadyRhsGXhO7wQfchtadX4Gr3nMEX81s5mE9YXIsem
         Mr5Q==
X-Forwarded-Encrypted: i=1; AKwUvBybu1JwIdIdArI9pWd5Z9KxXp4ZIIfH/PRo65aMLL8yOtpbzz6QE6V3dVFDi55ehBH90JyZGCKbT4Lp3Mo=@vger.kernel.org
X-Gm-Message-State: AFq9FYKFUn+V4mxdqkEXUESm3yJuNRCFzi8PC40+i6vTXnr80r+AWUBn
	WlcMSM9xljTSjDAavIPy5zOUIbF6T+3Uo9oXc9Pbx56N2jQCCZwAIKZdwaKeP47wA65n7uqKMd+
	6HAVn/vAJTHQYzLVwhJSayWk4pUShd23CgsB839AeesHRHmRCa2lO1r+jHqSw7lJZ/IM=
X-Gm-Gg: AYBFou1Foqv6cbU6zGaVZhtIcMOjEc/kElP4BhgWEFzUg0I0SGDBGeKzU8BGQ03qZVi
	JH2PDjGJnj59x6Vd3IHtfCLFT+32qLO9j4CoIxtOagbZok5cKqtvBo5sbBPi6U6n8kyU3pEunEH
	1/aFalJG4tkdWlnIltd15UOWJpTTwGGURo2BCH1QLnw515eUfrjcab/hP5QOu3fI67d4v0a1QKR
	Vphlis0Ni3U2fYWNAAdTu6Z1bOCk1sYtuj5QwV9bMZl4aBzzDCStAZcsqMj5U9xLJDRjfUmbFZC
	Ki50F8OS5+y8cj1jcOeDZ8aJ5ejW1CGy0MVkMxkUp+SAMIlNo8g6ZBxYcThTW4BahICnGAFlf9X
	qpQeac6rOcATFWfSPEv31fI+wGmNcSu7GfVjB0ppHDVTT/xfY6w==
X-Received: by 2002:a05:6a20:3c8d:b0:3e0:ba43:3d3d with SMTP id adf61e73a8af0-3e7af8001f7mr11738557637.9.1793114907778;
        Tue, 27 Oct 2026 08:28:27 -0700 (PDT)
X-Received: by 2002:a05:6a20:3c8d:b0:3e0:ba43:3d3d with SMTP id adf61e73a8af0-3e7af8001f7mr11738530637.9.1793114907312;
        Tue, 27 Oct 2026 08:28:27 -0700 (PDT)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a6a6cf9489sm182649b3a.39.2026.10.27.08.28.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 08:28:26 -0700 (PDT)
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
Subject: [PATCH v2 1/5] drm/msm: Cleanup if pages_to_sg() fails
Date: Tue, 27 Oct 2026 08:28:15 -0700
Message-ID: <20261027152821.51144-2-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261027152821.51144-1-robin.clark@oss.qualcomm.com>
References: <20261027152821.51144-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA2MSBTYWx0ZWRfX2wwL11BtCWf7
 uCpmG6l4z62sEqRatxy36XDPsIPbcg232lyjaOKHx0TKtIIqBv3cEFRmtyqvycO9zdkFrV7J5QJ
 Om9HAxLxgZwaV1GHWKR68GDjWYoOTLw=
X-Proofpoint-GUID: v1HmPHNKTSxRPkhGMLJbYSH3T_uPuEdW
X-Proofpoint-ORIG-GUID: v1HmPHNKTSxRPkhGMLJbYSH3T_uPuEdW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA2MSBTYWx0ZWRfX0UFrUoB9/af1
 PKUoNhF6+jQpJTeldl1ghpkbfx3I+zQuR5MJgG/DpESXRQYWfK91V1pud85s2fcKgU/rDSvkus0
 NtnUVsQlqNh4Q6wMi76gluc/B5a/SMX0ltD1RfAz79b2EN4eP0iWlPOPQCYN/7JyrrZdA4b3AdM
 vAg2rLZsA+u0PKskfrpHYLN3FILy/N3QWK2Ezwx/YDmy5Zfn+mIevhq/6VANnDfHhU4tupfgx47
 J4peM3gMVBt/yChHxstiI63S3aa7csgF3W0fUB5a3tHKM2COpUPP4Qf+v6ppHHZSbqqkdtpR6Cz
 j4DDc80aHVfeJ/KBmfV9lTwiq2I1MviRyObDyd5oC5SEOz4kaHuvh16KkXxfAtpGOTUeE+T1je7
 AIPHop1CURY4Oaw5oCemhe1slTM17RzgnfwCu3nVQGrNr4EOT8DmbMaYO9aZIPXWKbAAbYlDfrW
 cV/Xz7fCY7/9BQ6/XNA==
X-Authority-Analysis: v=2.4 cv=SN/Xx+vH c=1 sm=1 tr=0 ts=6ae0c31c cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=aq7xQ8hs3DLR8BDoFBQA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270061

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

