Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16C86395AFB
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 18:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790447511; cv=none; b=Ivg3z3ETNx7oTqFgesbJhsjMRelDYMCtofGTJcWsxgNugFZjCCe0/1z0mesDPF00HEo0pJjqvOb6KBzrvzFmLdpWrqtHjGr7ODjECToMBlK/0CMwH5lGwJTNO5WlmcUjiWP/nDSnOvYDMJiGfWmhDTkBGGap1T88/BPIjtjOpeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790447511; c=relaxed/simple;
	bh=e+b32niFby/LIQoT6ak9oCbCp1udcfR8ES+knEQXeGU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p2aDZTaCNHW3SjKM/ntlQWlbNUhxOK9NOQVQjhRcKk91SDO9xMqNRnTjNPpFlODKBDfqrQdJfRLBn8pTJQvVWt7ck1uH9Wqd6/1EFhV8JzN6PixdP7OtFCAT6pKCys+a98THhkC0F1yGn2+Fc1V2uQHQJXuMEYtttfOEh3vnCYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iMdEq/vQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i9Gmf0Tr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iMdEq/vQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i9Gmf0Tr"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68QGxRI33167966
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 18:31:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=rCiTSj82OYF
	5QfTUX7zKg4lPx2ctvHCuTZqaZWcoJjM=; b=iMdEq/vQPLGIJbtI7qPFC3/JCWk
	TSXuGyqyy1w7U9dpCannDKH+E2ubk6j7kNSG+Q/ZmH74qqvs4dAKUWj/ueoSD0rh
	JtrhihfrG+Zmifc+IZ8jfe+Z509ovN4eQ+Gg6CpI8shXR6eHDV30uUzgWx0zJ62W
	1HhniEf4FWeY5VUeE3GafFuqNugbra3gzZ3aUp057feU2zPWyZWncDs2SUBeCkIN
	/ExsZPzFfW9dQvriG/dRpBgY19VuoZjuvZaJ4CO+VC7TFJg2YARfmP4qRe+5H0fy
	lBy4YHhF2KLJvHHFeFy7xs5ZUtewnkwfm4GD1HJikeLWqf2ick3o/pMogBQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gx77jscrr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 18:31:49 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc1a439db36so1110254a12.2
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 11:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790447509; x=1791052309; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rCiTSj82OYF5QfTUX7zKg4lPx2ctvHCuTZqaZWcoJjM=;
        b=i9Gmf0TrEYzNHcBIWUEWGDpENdWN0EHgaYVG2wUnqaA2qWqLT63sRxJXnr6zbdqEfP
         qTawtcWBN0shErcABpBzfhYgI7fNkv8XyJlbsjlgBKg1zRXtb8/Q5HzzuBldRmyNxzTl
         VkSEYoFX9ANwYEnF+UNG3zKwbGyKsGVEqfdVv2Mq1fcdaL0GTJ3ASX3NjvawRX7Xntbq
         GSvHVzAW7IIcvRvLUrJbuqZ8bCZV3u8U9xBe6TsLqvVSRyUVo+uP9HJqWBK7tvIt81aj
         TjxDOU9kex53iuCUKP4Ox1qEfTmhHrgVMv6J72Y6DDU+as7NCkueCm0axxiieZ08ZmSU
         DztQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790447509; x=1791052309;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rCiTSj82OYF5QfTUX7zKg4lPx2ctvHCuTZqaZWcoJjM=;
        b=Yp1ZmGVQF4n3F7KRH2/PFEGm7RIcMcN0kt1QhTdi6CW+A5Lk6EmQHPZ0IlEGDzfY8L
         clUw/z/1egZtK24rUiETs3WMhEpSehaw/elMAOfWvbhT55uCUKG3KPPNgn0hiCnX4lvK
         80YRsC+B0Oq+/bN/68ESSwVD2UVuKZw7cTbAhadxRtRHKx+bc5j4I41Fh/3aTvygt+0f
         ahl0hvE/v/la3tIsv30R8Qe8JkxVm0yWcUKgauSGIN3F1b6IVxvJH1C78H6LWxUHxkbj
         Wei2L05H/CR3dimD5PmhxBMUaIWxt7zJpIbidfWQaZAKuNSt+QdJybcrfi2VGhI0VrEX
         OoVQ==
X-Forwarded-Encrypted: i=1; AKwUvBwKmAa07yyTrpJu+3H+fQ0VglpScYfpYfmCCjryGx8AOGQMXRiJNVnu7EGD2ld2mYcatgHXaGE7t78Ygxk=@vger.kernel.org
X-Gm-Message-State: AFuF++kt4dWziDF1VFvABJaMDf9odjEMu7guM8ZpOoKzvfCEiOISB6+f
	9hKaiJxGJ3i93RZMpYj3d0sf+PJ8SDBv/9shncHhS9Fir5dyhg8GLhX6JdlrKwMOh9tuyI8QMNi
	UOzMQZXH4D+7Liix2P6LW9noQRQWBrHtBJ1DigY9AF/ueyM5h4VcYfVeTtoKdywh+Cx4=
X-Gm-Gg: AYBFou3p8cy/VXrbdigcgQS1I19GqWAszqiYTOxMZFmWTSRwlrJac3hEQ4xRXpgkCqr
	eZKSGtDjP3X9HIzuZxy7utR7hGGOYUY+8dc+3tGV+Ug1QhV+uv/XThk967+n9/4uVhHtSwcO+Yx
	aUJb7bIxsomr7W6bG2RXa0i1+UbjY6Csuc/wg++7RRgnks8rcB5/eg3JOw8CVNHJL8EGzEvK1aJ
	qf5aRJUb65jcsrYOwIebV4c7vfd5nJNWc/5/VB+VTBhBiarqEdUb9fvmWTxQZC8ewlH5/L2v8iT
	Lny3B4pF7izTDWowZGxha8M222TgYBcBDf7AoHs2a3ixbnVz32w3pRwKtd999Q/v50s2Zebe9pz
	xioWwbLgTmEeLMIrgwZmBzM9J2g3DsjcNEa7jJY9QkGHq3fs=
X-Received: by 2002:a05:6a00:138d:b0:881:7ff5:605c with SMTP id d2e1a72fcca58-8817ff562d9mr1878439b3a.55.1790447508827;
        Sat, 26 Sep 2026 11:31:48 -0700 (PDT)
X-Received: by 2002:a05:6a00:138d:b0:881:7ff5:605c with SMTP id d2e1a72fcca58-8817ff562d9mr1878419b3a.55.1790447508323;
        Sat, 26 Sep 2026 11:31:48 -0700 (PDT)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87fea88dc7esm2332614b3a.30.2026.09.26.11.31.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 11:31:46 -0700 (PDT)
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
Subject: [PATCH 1/6] drm/msm/gem: Add helper to check if resident
Date: Sat, 26 Sep 2026 11:30:41 -0700
Message-ID: <20260926183051.25754-2-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260926183051.25754-1-robin.clark@oss.qualcomm.com>
References: <20260926183051.25754-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI2MDA3MyBTYWx0ZWRfXzfMikB1zkzUr
 vnrYNzeHMARdFJiWd9EXH2s/symLtD7BgwuDSdixEUgDKEE7FHtkOtX5p8wxntcp1dkD6lo+o66
 13EGmA659yqrX7R9whIk+f+9BNYJGwo=
X-Proofpoint-GUID: G5S3vq6QH-jCbOz_SBsPtRxuhFwbrsac
X-Proofpoint-ORIG-GUID: G5S3vq6QH-jCbOz_SBsPtRxuhFwbrsac
X-Authority-Analysis: v=2.4 cv=J8U/fwnS c=1 sm=1 tr=0 ts=6ab80f95 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=19Wyn7e3V/0aNffMjNCMQw==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=Ql1oLI5ppxrsW8Emd60A:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI2MDA3MyBTYWx0ZWRfXw6S4CBzKUjhT
 2Q7Lsz9XStjzanthRhXWp7pWbTDSB3541l3+eiCG19Wvo4rcGQOppB0/8OxuoHho1Hc7Oym+kMz
 Lo3wBEib38OtY3P33jy8deYKKtwEd5sRrYCNom9Dig6fIsGvrjqCzKsOJ4+4kZMz+KrRPiIX7ZC
 ZjAXfzTFEQ32Tf1m+TR8NO0oyDksnt3t0DVrJ3byh1IgzQs9oqn/GapdTuD//Hw9xWHk8Q5JA0E
 jhua0JjBJIhNoT8YErj4/yXqHxP0ml+kQitSJ0ksShvYakO9SX+uYqZOwTKNDfo+s5MpbcGnb5n
 /PIwTgaFPhL0ncsEsfGLR4I3mwEgIYhTRRwTgiBhv0uLPiAV+EvpORhXw9DAJTNUrL+F1mQzLOc
 G3YHvi0l7Z+y3gUNOjunc8iaOHrsuEVD931TxyXD7HnDRsTl4jEcSiaFxQCQDMxqlTnvG4Hh6qE
 Y8OPYlDinDHOLiYtaSQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609260073

Mostly we don't care about the page array, mapping/etc works in terms of
the sgt.  Add a helper to prepare for allowing the page array to be NULL
for imported dma-bufs.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem.c | 8 ++++----
 drivers/gpu/drm/msm/msm_gem.h | 6 ++++++
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index c4cff3d53d81..e8390ebd5dd5 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -147,7 +147,7 @@ static void update_lru_active(struct drm_gem_object *obj)
 	struct msm_drm_private *priv = obj->dev->dev_private;
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 
-	GEM_WARN_ON(!msm_obj->pages);
+	GEM_WARN_ON(!is_resident(msm_obj));
 
 	if (msm_obj->pin_count) {
 		drm_gem_lru_move_tail_locked(&priv->lru.pinned, obj);
@@ -167,7 +167,7 @@ static void update_lru_locked(struct drm_gem_object *obj)
 
 	msm_gem_assert_locked(&msm_obj->base);
 
-	if (!msm_obj->pages) {
+	if (!is_resident(msm_obj)) {
 		GEM_WARN_ON(msm_obj->pin_count);
 
 		drm_gem_lru_move_tail_locked(&priv->lru.unbacked, obj);
@@ -949,7 +949,7 @@ void msm_gem_describe(struct drm_gem_object *obj, struct seq_file *m,
 		stats->active.size += obj->size;
 	}
 
-	if (msm_obj->pages) {
+	if (is_resident(msm_obj)) {
 		stats->resident.count++;
 		stats->resident.size += obj->size;
 	}
@@ -1172,7 +1172,7 @@ static enum drm_gem_object_status msm_gem_status(struct drm_gem_object *obj)
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 	enum drm_gem_object_status status = 0;
 
-	if (msm_obj->pages)
+	if (is_resident(msm_obj))
 		status |= DRM_GEM_OBJECT_RESIDENT;
 
 	if (msm_obj->madv == MSM_MADV_DONTNEED)
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index dff60cbc9d95..73dafe080bfd 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -419,6 +419,12 @@ static inline bool is_unevictable(struct msm_gem_object *msm_obj)
 	return is_unpurgeable(msm_obj) || msm_obj->vaddr;
 }
 
+/* Are backing pages/sgt allocated? */
+static inline bool is_resident(struct msm_gem_object *msm_obj)
+{
+	return !!msm_obj->pages;
+}
+
 void msm_gem_purge(struct drm_gem_object *obj);
 void msm_gem_evict(struct drm_gem_object *obj);
 void msm_gem_vunmap(struct drm_gem_object *obj);
-- 
2.55.0

