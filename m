Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793395681;
	b=Muo6yXKoKJRkYlwEnUSui8h3fe8J2y9z59PQAFZondQD/x/+pvygcrGZM2+XLQ1jq/C2
	 m6iYHkafJ9EeGm8INK6IXpjHsZmteCrhhsTQ+/WCk0HFVkWeSW7OumhCnyO1VbZB4hn8Q
	 jtb0IiEAgtEpA1eKOG4UG9YFgPXomfVRO/jycB5wEsGiIT4BopYJKnqfpoIqLl8H5wiYG
	 nmIOnslT3KkSe8epldYgosgW7CSC9K6Bzzf18qHydXQnqIw2EYnnBIwlyyafEV8yTMaAb
	 3s/NHJY9f86ulCN1p5SkFltGCNwNl4yiZ/QOeChH/hEGlejg8y9l5tJ0QpavSnsSd5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793395681;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=NKRuHrdlCG2AC+LOZdX3rskzlgUqfcbnjlFbUOLAYSc=;
	b=DRR/sOVDERFE+Kqzu2YK2/zzzOu3lcvGSnUB7Mb3TlVF0Mc1tiPmS1/usyEFfqQslVFv
	 oLYiBln6CAEQb7eF26i+4TLFEe7fohPapnS2WO2G85dujmrnCLU9/t2CfSGiY5LFRLeTb
	 yvLCmlV02T7F4Y3gR08spER+8f/W5NqrZlqn+UX/fRgm6NQai7m6tNp/I0pJKzQ6WzP8y
	 6NJ6saio50bLPBqZ0qe4ANDB9pRIorGJaGSLnayHzYAOKTDAqELOA0t1RpSXUbZCPGw0j
	 5pqQEKeAZWvHT8rb1uiCMhZIdGGGYwwGR6VwA/fQEV58wlygcrPasvZhIaRliU/ouqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TSSnZqPG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Mwoe7R/i";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42FAC606A322
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:28:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42FAC606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TSSnZqPG;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Mwoe7R/i
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69ULAjbN202220
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:28:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=NKRuHrdlCG2AC+LOZdX3rskzlgUqfcbnjlF
	bUOLAYSc=; b=TSSnZqPGqftosQMLqubn+JIQqcsjt3dhQMRu+zw7fqc8F+WuPox
	y7zZZNmAC7g7RR1ljTFH3ZQzYoROdFi3o90g0zg6v17y/41WVqOFX/8qJPDJMqsk
	bofxpli6mIj+jKNCOzN01ETlvvDu4KUYrpa9eBxNSX//DQ0a+yuzKsuBjucAfOlk
	PwxnYof1FE8JDb+KeIycCJ60I1GDMnZ2IPjQiL3zbrG8HMWRP3uDW/7xRJvAcKCd
	3RZ/SaMkVv1BZlPtQswWu7qfEi1ZT7J4ssxxFHqjHS8A80vvmaHMTLocFll2xqwD
	9nz84r+BrOaJjsqEDM5qJ8q9ZRsaV0m6cug==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn2x0g2u8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:28:00 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ac0ae43900so917090a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793395680; x=1794000480; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NKRuHrdlCG2AC+LOZdX3rskzlgUqfcbnjlFbUOLAYSc=;
        b=Mwoe7R/iPGbELMmRLrY0OW15YzwUuopq2sksnhG0VivJrAq6EsOXvqHZFlZVCDkEZV
         HymZBD8UQ6QNYVJ/O75ikob87jOL9xclcCVLAqt7BirsPJjhA9AxwARBYKM+q3EIPF+r
         tVErdnr0y8P/IjzdF9HfQeg4Hvapkqov+P4fKuqMNJi23jhHCeMIc6RYFQgLFJOyO0Vw
         DfJhGc0itJYkTqlr30pCkcJjqMc3JGeXwDqSgn2TLhjJhoE6T0yJs1MgFJGct229FC9t
         Cf0+1r+sanVdCDfy9/YpQRYOF/uUW+Zsdhy4BMwIkfSvHziREuZw2MMDpCG11TZkshRZ
         0ZeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793395680; x=1794000480;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NKRuHrdlCG2AC+LOZdX3rskzlgUqfcbnjlFbUOLAYSc=;
        b=Dcjr47jq5l6lR9iqbGLe9sNOgX2cOR2q0ga4JAG+IZiru0ZJkzB3o2ligsGOTph09A
         BFomiX9yk+rJdmWOtn3RcFJAd9EDA+hAp05JhRCsmqDKMqUD8QF9gIBJ3Di3WAuTJtMp
         qHML03Q0eUndgiTePWlhBWFvhduQYAV6pBnigKxt1gz0gjWRCbb+qbW4iRtieW2s19qx
         WQ30fgTHK6OAYW0pEPDn9G+YSbNISsx31jk/0sIYmvrUTJPpfH3h38bWQUZWe649uumb
         Ev5K5pK/g4IwbT5cq31uoVpWbQxaPbzeuFFuB1Gys74jwo+PBQ7lTgYqnHWHqsrybRJ1
         6NYw==
X-Forwarded-Encrypted: i=1; AKwUvBy6vsCdVmqd3al/N9BsRq9sx4pl4taQDKcFnydEbWt/GhyuPFQeGue5YKMgjzITaDitvrPM8eWH7bOlp4Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYILAJasWk1jZRg/toWbAbuvmckweUFHOInhuaaVkZU+aRg4uTOe
	w0l6jdlIjgUjfP0HW93Aj4VLq99yTaWtGeTI2uVee/lndBHJNF7BSDqQt/2SSUHTeYbavlMY91t
	GAIj6oQLi2R+oK58yYW6fleuS7D6OEKatSnH9A+2mqb35WWYyEbAEJj95yOAaraevzdo=
X-Gm-Gg: AYBFou275O5eeHLEUy/75AJr7/0xQegS4ce3B1H7oGxaSH0KfwUlAC3mkdIisUs/W8r
	Zz+WA8fXWmuGWGZmBT0KdwqcsExbUAkWv3P1YFhQR6Sbn/u03E4+CtlXd+oQkyIAi45Ms0isuil
	jG+2G6AkcfUkDkxqfeURWszgMcA65TQfqCuCFAPs/DCYOCs+UImsBypwYfzsIBvLWgrLIyaWaM7
	rM7bgIN/5TbbITKabEuirL/b61ukV8uO7uyk+IobJ/6xwEjMMjsQeQo7miF3g3zrSKE7H9TbRgF
	/WHySQ3IcZHqWqKx9WK/NJucGwowqg8FlmqqGflNAh1n6gGpZMMESh+d1w6MdnnfMyWInvwzsFY
	acA6sz5qnVlxiowk3P7lirpiJZDldgXIdiQpt9C5u5m3TSKNezNZrKoT7/Orz5LJMc1fumdFij3
	0KxFi4tUvgs5P9VbDna3zaPqw=
X-Received: by 2002:a17:90a:e70c:b0:3ad:a232:4044 with SMTP id 98e67ed59e1d1-3ae8979969fmr2618556a91.38.1793395679692;
        Fri, 30 Oct 2026 14:27:59 -0700 (PDT)
X-Received: by 2002:a17:90a:e70c:b0:3ad:a232:4044 with SMTP id 98e67ed59e1d1-3ae8979969fmr2618537a91.38.1793395679177;
        Fri, 30 Oct 2026 14:27:59 -0700 (PDT)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae87ee7765sm2711053a91.2.2026.10.30.14.27.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 14:27:58 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3] drm/msm/gem: Add some cleanup.h
Date: Fri, 30 Oct 2026 14:27:51 -0700
Message-ID: <20261030212752.51494-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
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
X-Proofpoint-ORIG-GUID: PkQF3jTIKDTcXTxao7G4JhsF8s7nz-NE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA4NSBTYWx0ZWRfX2eSxXU4FHUCd
 M54xQVNIHB3h476/2orAN2dOkNnNd0vvrh203K7T0xWOQnbwEv5tpQflakNr3Aclf1EjUwlgauz
 NBIWtzJDFzHFJSAYhKky0HIEloPYZ0c=
X-Authority-Analysis: v=2.4 cv=IpyL47/g c=1 sm=1 tr=0 ts=6ae50be0 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=IPQtAqkb2_EUGazGSrUA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: PkQF3jTIKDTcXTxao7G4JhsF8s7nz-NE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA4NSBTYWx0ZWRfX8ERPAiIgR1MH
 acfJYcsN+/Q5+bXgZ8pPINnIIo3hvPJRlCA/5uY4HgOQZDYkufN0hA9LwMUn31QnU81sKDach3S
 fscpUuWNyrC8L3YtHJay6BoH2YrQezpvqbcsVJTKtYmdWUmIoUhvwIMEjFxRdAd2pU5q7/c/3tn
 /lVEOklrCh32Xjfs5v56VRzU1L0LPiUZjilUAH0igSiIoT9YZr5E61M4gqNRX+B02dabrpH/Q2x
 iGeI6TTwDoAlrCGCe1R/RccEtwk12CxmEEw9mfArijMnYu9mw7t3Me+E3+JtS6leNoG6rW5Y1a1
 u+lM2EmQmJzT1SSusvH7Yo9n5BRyzKqO1pRTO06Ire/CkdSOO5cPgP4hr0aWL7slkrO2O0eQviK
 5FuJGDT72K9/SBymrwqaLfzqhy8ROltBXH4zaGpuAFrSRnnoNhc2cfnQ9iYVuUyQDplytI6x6rZ
 2eKRZy0BKvQlK2GoorQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610300085

Convert (most of) the msm_gem_lock() and friends over to scope based
cleanup.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/Makefile         |  2 ++
 drivers/gpu/drm/msm/msm_drv.c        | 40 +++++++++------------------
 drivers/gpu/drm/msm/msm_gem.c        | 41 +++++++---------------------
 drivers/gpu/drm/msm/msm_gem.h        |  3 ++
 drivers/gpu/drm/msm/msm_gem_submit.c |  6 ++--
 drivers/gpu/drm/msm/msm_gpu.c        |  3 +-
 6 files changed, 32 insertions(+), 63 deletions(-)

diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
index 1e246616f83f..6196a325b6f1 100644
--- a/drivers/gpu/drm/msm/Makefile
+++ b/drivers/gpu/drm/msm/Makefile
@@ -252,3 +252,5 @@ $(addprefix $(obj)/,$(msm-y)): $(addprefix $(obj)/,$(ADRENO_HEADERS))
 $(addprefix $(obj)/,$(msm-display-y)): $(addprefix $(obj)/,$(DISPLAY_HEADERS))
 
 targets += $(ADRENO_HEADERS) $(DISPLAY_HEADERS) $(ADRENO_PERFCNTRS)
+
+CONTEXT_ANALYSIS_msm.o := y
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 7ab808322be6..3e921d24d22c 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -550,7 +550,6 @@ static int msm_ioctl_gem_info_set_metadata(struct drm_gem_object *obj,
 {
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 	void *new_metadata;
-	void *buf;
 	int ret;
 
 	/* Impose a moderate upper bound on metadata size: */
@@ -559,32 +558,25 @@ static int msm_ioctl_gem_info_set_metadata(struct drm_gem_object *obj,
 	}
 
 	/* Use a temporary buf to keep copy_from_user() outside of gem obj lock: */
-	buf = memdup_user(metadata, metadata_size);
+	void *buf __free(kfree) = memdup_user(metadata, metadata_size);
 	if (IS_ERR(buf))
 		return PTR_ERR(buf);
 
-	ret = msm_gem_lock_interruptible(obj);
-	if (ret)
-		goto out;
+	ACQUIRE(gem_lock_intr, lock)(obj);
+	if ((ret = ACQUIRE_ERR(gem_lock_intr, &lock)))
+		return ret;
 
 	new_metadata =
 		krealloc(msm_obj->metadata, metadata_size, GFP_KERNEL);
 	if (!new_metadata) {
-		ret = -ENOMEM;
-		goto unlock;
+		return -ENOMEM;
 	}
 
 	msm_obj->metadata = new_metadata;
 	msm_obj->metadata_size = metadata_size;
 	memcpy(msm_obj->metadata, buf, metadata_size);
 
-unlock:
-	msm_gem_unlock(obj);
-
-out:
-	kfree(buf);
-
-	return ret;
+	return 0;
 }
 
 static int msm_ioctl_gem_info_get_metadata(struct drm_gem_object *obj,
@@ -608,26 +600,20 @@ static int msm_ioctl_gem_info_get_metadata(struct drm_gem_object *obj,
 		return 0;
 	}
 
-	ret = msm_gem_lock_interruptible(obj);
-	if (ret)
-		return ret;
-
-	/* Avoid copy_to_user() under gem obj lock: */
-	len = msm_obj->metadata_size;
-	buf = kmemdup(msm_obj->metadata, len, GFP_KERNEL);
-
-	if (!buf) {
-		msm_gem_unlock(obj);
-		return -ENOMEM;
+	scoped_cond_guard (gem_lock_intr, return PTR_ERR(scope.lock), obj) {
+		/* Avoid copy_to_user() under gem obj lock by making a copy: */
+		len = msm_obj->metadata_size;
+		buf = kmemdup(msm_obj->metadata, len, GFP_KERNEL);
+		if (!buf)
+			return -ENOMEM;
 	}
 
-	msm_gem_unlock(obj);
-
 	if (*metadata_size < len) {
 		ret = -ETOOSMALL;
 	} else if (copy_to_user(metadata, buf, len)) {
 		ret = -EFAULT;
 	} else {
+		ret = 0;
 		*metadata_size = len;
 	}
 
diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index bcdb57866cf6..000dfcec7809 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -351,8 +351,6 @@ static vm_fault_t msm_gem_fault(struct vm_fault *vmf)
 	struct page **pages;
 	unsigned long pfn;
 	pgoff_t pgoff;
-	int err;
-	vm_fault_t ret;
 
 	if (drm_WARN_ON_ONCE(obj->dev, drm_gem_is_imported(obj)))
 		return VM_FAULT_SIGBUS;
@@ -361,22 +359,19 @@ static vm_fault_t msm_gem_fault(struct vm_fault *vmf)
 	 * vm_ops.open/drm_gem_mmap_obj and close get and put
 	 * a reference on obj. So, we dont need to hold one here.
 	 */
-	err = msm_gem_lock_interruptible(obj);
-	if (err) {
-		ret = VM_FAULT_NOPAGE;
-		goto out;
+	ACQUIRE(gem_lock_intr, lock)(obj);
+	if (ACQUIRE_ERR(gem_lock_intr, &lock)) {
+		return VM_FAULT_NOPAGE;
 	}
 
 	if (GEM_WARN_ON(msm_obj->madv != MSM_MADV_WILLNEED)) {
-		msm_gem_unlock(obj);
 		return VM_FAULT_SIGBUS;
 	}
 
 	/* make sure we have pages attached now */
 	pages = get_pages(obj);
 	if (IS_ERR(pages)) {
-		ret = vmf_error(PTR_ERR(pages));
-		goto out_unlock;
+		return vmf_error(PTR_ERR(pages));
 	}
 
 	/* We don't use vmf->pgoff since that has the fake offset: */
@@ -387,12 +382,7 @@ static vm_fault_t msm_gem_fault(struct vm_fault *vmf)
 	VERB("Inserting %p pfn %lx, pa %lx", (void *)vmf->address,
 			pfn, pfn << PAGE_SHIFT);
 
-	ret = vmf_insert_pfn(vma, vmf->address, pfn);
-
-out_unlock:
-	msm_gem_unlock(obj);
-out:
-	return ret;
+	return vmf_insert_pfn(vma, vmf->address, pfn);
 }
 
 
@@ -778,13 +768,8 @@ void *msm_gem_get_vaddr_locked(struct drm_gem_object *obj)
 
 void *msm_gem_get_vaddr(struct drm_gem_object *obj)
 {
-	void *ret;
-
-	msm_gem_lock(obj);
-	ret = msm_gem_get_vaddr_locked(obj);
-	msm_gem_unlock(obj);
-
-	return ret;
+	guard(gem_lock)(obj);
+	return msm_gem_get_vaddr_locked(obj);
 }
 
 /*
@@ -811,9 +796,8 @@ void msm_gem_put_vaddr_locked(struct drm_gem_object *obj)
 
 void msm_gem_put_vaddr(struct drm_gem_object *obj)
 {
-	msm_gem_lock(obj);
+	guard(gem_lock)(obj);
 	msm_gem_put_vaddr_locked(obj);
-	msm_gem_unlock(obj);
 }
 
 /* Update madvise status, returns true if not purged, else
@@ -824,9 +808,8 @@ int msm_gem_madvise(struct drm_gem_object *obj, unsigned madv)
 	struct drm_device *dev = obj->dev;
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 
-	msm_gem_lock(obj);
-
-	mutex_lock(&dev->gem_lru_mutex);
+	guard(gem_lock)(obj);
+	guard(mutex)(&dev->gem_lru_mutex);
 
 	if (msm_obj->madv != __MSM_MADV_PURGED)
 		msm_obj->madv = madv;
@@ -838,10 +821,6 @@ int msm_gem_madvise(struct drm_gem_object *obj, unsigned madv)
 	 */
 	update_lru_locked(obj);
 
-	mutex_unlock(&dev->gem_lru_mutex);
-
-	msm_gem_unlock(obj);
-
 	return (madv != __MSM_MADV_PURGED);
 }
 
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index d8ec696d89d7..bd7968232d73 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -347,6 +347,9 @@ msm_gem_unlock(struct drm_gem_object *obj)
 	dma_resv_unlock(obj->resv);
 }
 
+DEFINE_LOCK_GUARD_1(gem_lock, struct drm_gem_object, msm_gem_lock(_T->lock), msm_gem_unlock(_T->lock));
+DEFINE_LOCK_GUARD_1_COND(gem_lock, _intr, msm_gem_lock_interruptible(_T->lock), _RET == 0);
+
 /**
  * msm_gem_lock_vm_and_obj() - Helper to lock an obj + VM
  * @exec: the exec context helper which will be initalized
diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 5862db05297a..ff6cf39587c9 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -536,9 +536,9 @@ void msm_submit_retire(struct msm_gem_submit *submit)
 		struct drm_gem_object *obj = submit->bos[i].obj;
 		struct drm_gpuvm_bo *vm_bo = submit->bos[i].vm_bo;
 
-		msm_gem_lock(obj);
-		drm_gpuvm_bo_put(vm_bo);
-		msm_gem_unlock(obj);
+		scoped_guard (gem_lock, obj)
+			drm_gpuvm_bo_put(vm_bo);
+
 		drm_gem_object_put(obj);
 	}
 }
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 0c2c35636251..fb07803f5aba 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -308,10 +308,9 @@ static void crashstate_get_bos(struct msm_gpu_state *state, struct msm_gem_submi
 			struct drm_gem_object *obj = submit->bos[i].obj;
 			bool dump = rd_full || (submit->bos[i].flags & MSM_SUBMIT_BO_DUMP);
 
-			msm_gem_lock(obj);
+			guard(gem_lock)(obj);
 			msm_gpu_crashstate_get_bo(state, obj, submit->bos[i].iova,
 						  dump, 0, obj->size);
-			msm_gem_unlock(obj);
 		}
 	}
 }
-- 
2.56.0

