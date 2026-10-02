Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 082D54BD0FD
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 15:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790955004; cv=none; b=DlHEQlJEolLzmlRaC7quOstpZhzbElpcDsT39BUzp8xTk00GH8UiQLvC0/NOYHQs3yaiSfej9vyBlJHiEmyC7kFNrZ/YhowlbSIgrz2Tj3VPkJPIh1VlMFJ5PD9HGedFgzrmjdtewZTrSZ7VFMce12R4/OS9vxWdDZvMi/N1lfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790955004; c=relaxed/simple;
	bh=Ne/oH4viOImWVtT82Pw0n8SI1E/7ica0ue/WZsT0THM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jGFoTXjRLKMC/r/jgmZwQotvVU+Hj5smmSmqNo7nBZvbzihYT9syIJ79SLUqsJp7c/P69Igd2dkUrl0B9H4LLhgVXhkGJi7KX/0xpXiaxMDlHvu1VyJjdA9AjtM3zQKMJOST5gq4J8mahyTyq8zXYaX5ape0g1bwzAzHwJFn6b0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PfHYpj5x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HX4i7jDA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PfHYpj5x";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HX4i7jDA"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692FGmGu2120448
	for <linux-kernel@vger.kernel.org>; Fri, 2 Oct 2026 15:30:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sxS6ymcMwZy2UdPPmtMKkF3MthxRKVgfdvqIkGpimqc=; b=PfHYpj5xtGXQeRNg
	GvBf0nFZD3cbJySKkPmMctNw2PXXMBNyZDKxuvzxxWM2ruzgidSsMd7Vn6PcFzIs
	GU2OU1s6D/a0YV809fUkQpGCUULf4K7+gmIj0Jz1/UHyg0+eJyLacMQYgtcxAcAg
	TNsvh5sELPcq8uk9ayYCHG06B3YcVjGRM0q3qnvHniqzdezgkkhiMXZoewFhiKeW
	TojB3jgTfmIOh9Ihj3A7OYnck3AvXclkWhd7mYU1k7jilLKQ7HIqXY3V+O4ZhOIo
	Kn4v0S7F9r+EBKcBm3Cic7QceiPLm0da0hDEbHcrjoZbZkxi1MhvwfNWrY9kfWfV
	Q1oaBg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h20sh2w5h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 15:30:00 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc1cade6b71so1621222a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 08:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790954999; x=1791559799; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sxS6ymcMwZy2UdPPmtMKkF3MthxRKVgfdvqIkGpimqc=;
        b=HX4i7jDACSaSEFaTAPecPY5zIHR6Brb1kOCpWR1B2HcAa4ezRXsVBdUm2gRdqfe+Gj
         tsvR1H8XMg3aGY8CKgrNl1nOQsyt2iMgN9YnsaymKUDVkS0RwqDzoBIl802OqFjaa5mU
         87ZTSwBYnCSKpRmbMuK7ReHc2hzwbKah00eiPek+nnuAnnTi525bfLp6Dm9zOBBA1b64
         5Qabp1c+zZMJgnzWYEWNM+akW0YYdJtzytKcRDybcz4zLKpvJehAadQhu5GA6pnKjrMF
         j1CNTkKRd0BDOuJ1UbavYM+WZXk3I+HlGyKScTW3kXz/KVt+8wMxpG7nyxcHtiKwsLpr
         SzAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790954999; x=1791559799;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sxS6ymcMwZy2UdPPmtMKkF3MthxRKVgfdvqIkGpimqc=;
        b=JXnWjSFg6Ce2HJPxYrTa7IIkruPo6qtAQS5REPov3Nz5C72ofTgbD0o4/QRYwNa2XI
         WYCu516u7D3W1zj3AsTzRnWU5/cY/yhjNTbN9mcP5h9nMifOEVZYLod1KaL/0Xy0+XEY
         pSqCfHtXii1xEjLno5Xolui/7Bpq4C0q1qFwJdP0H9Uy45dXF/v/PWhFvUi9PCo6k92T
         s/+jFw3G7MtRKpIbzuiZ90tJ2PTNbjJQ/+7MmJKj5h5Wnq8FOrdMwVJlcDZzfxlCBPu6
         wf0SAI6LrWTdrK2H56QZvwufk7Eu6Ei7EFEnUCGsxmjXVoqaJFAaG5gjOVyX1YHCxTHF
         YSjA==
X-Forwarded-Encrypted: i=1; AKwUvBzSh7cIXzrh2vRrcLtj1IclWWuCs1CwEtoxJW9XxJx87Mg7ABym/aAdc1ZRjExablReHd5y7t/oGCmp/Yc=@vger.kernel.org
X-Gm-Message-State: AFuF++kcpkpFaWFcp7gz227ry/vVY2Ox4Z0KlOMAXTf+16nRhes7Klgb
	T9w67WkTWrNj7EX9dfyfMi8UyJJWjUtSjuGso5fOz8LNupAbklUXsh6AUC6F7W+gprgZumVZGen
	m/IRHZ0UVV4FvsmtW2lOOS3zcDAVW+jfSCEjHA5x/4bQVAlD0c152K50c3kJut0m3CJo=
X-Gm-Gg: AYBFou2XH9J5mOcWq1/KAb99DYjQgFx6V0Fs7wz2m9tzJ4KDcXr5gW+/R1RUNjesLoR
	EnBCxj/Lr8kY7wQOUCwENNZNNqiHQjgvo496EpbdMAGKu8jJuHXjL9e4LpxMbwo5rNRQVMV5AYk
	p+R0kUNYYSo5/63PoTseXScuaj/KyuN5qkOimsyqCa3WsN6n4JuByV3sL00RGxv/FsY+cpBVnVp
	cCTuevWqlAEdhGveOabBZhGqGhXX5o0cgcy6xPVeHjAeyy9ZkneggsgYhtfs/w0oievc6BT9B0B
	wZ8n0unHXjk1kNOXzRZOoYRhe0jJLfYbeJa0oXRUK9EnZMpXGuwFqP1hiRZEtypPcofxqWXBU1l
	cGVNWl5+Ec3OvnsglSlK9+pqGGfvAnAVzVgcJPGF+rZ1Stw==
X-Received: by 2002:a05:6a21:e10a:b0:3d3:ad6e:9ce1 with SMTP id adf61e73a8af0-3e0bcfe91camr2445766637.15.1790954999448;
        Fri, 02 Oct 2026 08:29:59 -0700 (PDT)
X-Received: by 2002:a05:6a21:e10a:b0:3d3:ad6e:9ce1 with SMTP id adf61e73a8af0-3e0bcfe91camr2445744637.15.1790954999001;
        Fri, 02 Oct 2026 08:29:59 -0700 (PDT)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc9f737a231sm1186860a12.18.2026.10.02.08.29.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 08:29:58 -0700 (PDT)
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
Subject: [PATCH v2 4/6] drm/msm/gem: Stop exposing a page array
Date: Fri,  2 Oct 2026 08:29:41 -0700
Message-ID: <20261002152948.85308-5-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA2MSBTYWx0ZWRfXxvMCBYUCKtV3
 xXRvQy9PDG3fic/OdfuTZe/mKPINmS26tl1PIYPX517X4swK42SEv9M28HH3QI28pnl9EsWLWY2
 xutPq4/OCb+hrlR6LVS7k+HdISKVYSA=
X-Authority-Analysis: v=2.4 cv=IpmL47/g c=1 sm=1 tr=0 ts=6abfcdf8 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=19Wyn7e3V/0aNffMjNCMQw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=zd2uoN0lAAAA:8 a=qy49VNyTqSxgYBYDrycA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA2MSBTYWx0ZWRfXwv8C3uHMnO6o
 fbr2BbZAlvrf3AIKS+VeLLwrwCUrU2AMS25EH9f3lx4ybj3ZWFVfsUnaiAFCc+HZVctwksR5Pld
 XMxJp6ho3fV2TXx8ST47Orem/bga2QAHwXTMpVOnrCmTOjBskcFe8L6Is/LlPa0XQc44TRYNPmK
 9luTcrOE9/+/hHTr4f/cPQNeQY61VzLmHGAjshfALOUaO9Ta/BZ6Md7YzeiQcK/dTKJYCYybLqU
 TrD23EbdPGt3ekJBVsX64Q1dZZblnuhfPlUWEaOAOo3v8ibWP8YlpXKthsfTocmOlKLgwIobTNL
 bWCtY943B7oduEzmeVv1ah4vK+JoyS6bYWjNtX4IA4IhITjpbGsQZsiM2jHsQLuCMQE0CKC5c+m
 baLUXa1UIAUZ0XrH/S9UlchaO8QDuWxrIpWUFIbJrittz9YeIija//WOXScUM1ug6v4CUxXJoVw
 fTyz5yw4+0EZCShGcnA==
X-Proofpoint-GUID: H7bYQqsXBkYz7yIcYXoQ7CON5WfglzrY
X-Proofpoint-ORIG-GUID: H7bYQqsXBkYz7yIcYXoQ7CON5WfglzrY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_04,2026-10-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0 spamscore=0
 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020061

The remaining callers of msm_gem_pin_pages_locked() and
msm_gem_get_pages_locked() don't actually care about pages, other
than as a conduit for returning an error.  So convert them to
just directly return an int instead.

And rename _get_pages_locked() to _make_resident_locked() to
better reflect it's purpose.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Acked-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/msm/msm_gem.c       | 28 ++++++++++++++++------------
 drivers/gpu/drm/msm/msm_gem.h       |  4 ++--
 drivers/gpu/drm/msm/msm_gem_prime.c |  9 +--------
 drivers/gpu/drm/msm/msm_gem_vma.c   |  8 ++++----
 4 files changed, 23 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index bf6a8939af7c..2341f209adf5 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -280,12 +280,16 @@ static int check_madv_locked(struct drm_gem_object *obj, unsigned madv)
 	return 0;
 }
 
-struct page **msm_gem_get_pages_locked(struct drm_gem_object *obj, unsigned madv)
+int msm_gem_make_resident_locked(struct drm_gem_object *obj, unsigned madv)
 {
 	int err = check_madv_locked(obj, madv);
 	if (err)
-		return ERR_PTR(err);
-	return get_pages(obj);
+		return err;
+
+	struct page **pages = get_pages(obj);
+	if (IS_ERR(pages))
+		return PTR_ERR(pages);
+	return 0;
 }
 
 /*
@@ -310,17 +314,17 @@ static void pin_obj_locked(struct drm_gem_object *obj)
 	mutex_unlock(&dev->gem_lru_mutex);
 }
 
-struct page **msm_gem_pin_pages_locked(struct drm_gem_object *obj)
+int msm_gem_pin_pages_locked(struct drm_gem_object *obj)
 {
-	struct page **p;
+	int ret;
 
 	msm_gem_assert_locked(obj);
 
-	p = msm_gem_get_pages_locked(obj, MSM_MADV_WILLNEED);
-	if (!IS_ERR(p))
+	ret = msm_gem_make_resident_locked(obj, MSM_MADV_WILLNEED);
+	if (!ret)
 		pin_obj_locked(obj);
 
-	return p;
+	return ret;
 }
 
 void msm_gem_unpin_pages_locked(struct drm_gem_object *obj)
@@ -487,14 +491,14 @@ int msm_gem_prot(struct drm_gem_object *obj)
 int msm_gem_pin_vma_locked(struct drm_gem_object *obj, struct drm_gpuva *vma)
 {
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
-	struct page **pages;
 	int prot = msm_gem_prot(obj);
+	int ret;
 
 	msm_gem_assert_locked(obj);
 
-	pages = msm_gem_get_pages_locked(obj, MSM_MADV_WILLNEED);
-	if (IS_ERR(pages))
-		return PTR_ERR(pages);
+	ret = msm_gem_make_resident_locked(obj, MSM_MADV_WILLNEED);
+	if (ret)
+		return ret;
 
 	return msm_gem_vma_map(vma, prot, msm_obj->sgt);
 }
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 73dafe080bfd..4f681100ecb0 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -279,8 +279,8 @@ int msm_gem_get_and_pin_iova(struct drm_gem_object *obj, struct drm_gpuvm *vm,
 			     uint64_t *iova);
 void msm_gem_unpin_iova(struct drm_gem_object *obj, struct drm_gpuvm *vm);
 void msm_gem_pin_obj_locked(struct drm_gem_object *obj);
-struct page **msm_gem_get_pages_locked(struct drm_gem_object *obj, unsigned madv);
-struct page **msm_gem_pin_pages_locked(struct drm_gem_object *obj);
+int msm_gem_make_resident_locked(struct drm_gem_object *obj, unsigned madv);
+int msm_gem_pin_pages_locked(struct drm_gem_object *obj);
 void msm_gem_unpin_pages_locked(struct drm_gem_object *obj);
 int msm_gem_dumb_create(struct drm_file *file, struct drm_device *dev,
 		struct drm_mode_create_dumb *args);
diff --git a/drivers/gpu/drm/msm/msm_gem_prime.c b/drivers/gpu/drm/msm/msm_gem_prime.c
index beb7f22fd694..e1e74e9b7e6a 100644
--- a/drivers/gpu/drm/msm/msm_gem_prime.c
+++ b/drivers/gpu/drm/msm/msm_gem_prime.c
@@ -109,20 +109,13 @@ struct dma_buf *msm_gem_prime_export(struct drm_gem_object *obj, int flags)
 
 int msm_gem_prime_pin(struct drm_gem_object *obj)
 {
-	struct page **pages;
-	int ret = 0;
-
 	if (drm_gem_is_imported(obj))
 		return 0;
 
 	if (to_msm_bo(obj)->flags & MSM_BO_NO_SHARE)
 		return -EINVAL;
 
-	pages = msm_gem_pin_pages_locked(obj);
-	if (IS_ERR(pages))
-		ret = PTR_ERR(pages);
-
-	return ret;
+	return msm_gem_pin_pages_locked(obj);
 }
 
 void msm_gem_prime_unpin(struct drm_gem_object *obj)
diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index c11d021581e0..311205c7f1ba 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -1300,11 +1300,11 @@ vm_bind_job_pin_objects(struct msm_vm_bind_job *job)
 	 * trigger get_pages())
 	 */
 	job_foreach_bo (obj, job) {
-		struct page **pages;
+		int ret;
 
-		pages = msm_gem_get_pages_locked(obj, MSM_MADV_WILLNEED);
-		if (IS_ERR(pages))
-			return PTR_ERR(pages);
+		ret = msm_gem_make_resident_locked(obj, MSM_MADV_WILLNEED);
+		if (ret)
+			return ret;
 	}
 
 	struct drm_device *dev = job->vm->drm;
-- 
2.55.0

