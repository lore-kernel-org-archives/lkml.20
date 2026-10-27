Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793110477;
	b=eP+8nPwa1rIai7tp8MosFdxjDNs5/sMEHkNKSgQ9GhDDl5FkwxTuRT8kbwUig9fVJFHZ
	 I+L/GOkGkE3yL9L/AIgBM1njW+VX8GwWEY0nqAixiNEZDrKkH9OMm/u5fGvgqrDtWP0nK
	 xQg9FjKd6MiqGfIVL+4A+non7k3mV+OjaSotGluN590QYutmqb76J13aoAndQoVSiFlDT
	 TuCuKwnxCJep42ZbFNZ10BBs70Qpz7pKmSyZW7ijYxt7uROSJ58A/TphFF5gKxch2A9be
	 l81rYlvbMqEWNtLWIndNf8YPccRWclFDYFkJ+o4q5aRFHAWbQtc4Ut97rPUkN86EfXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793110477;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=tqkXPKxnOpu4GJB1w2Qf2g/GEkrQ0JawCqjyURpRlxs=;
	b=S1RXsaEmhrBbnUkNIta8/r9YWciSt+6OLXcq4y2NhW3SyBCt9gWrojCsfuhqTJ2HVRsU
	 JziriawpJ+XxiaE1jHYepPYJl6C5+UJazmoUP/DV1/iKe0aAmNrv6cY5wEaRn/7FLMwQZ
	 Sxsm5dbQJG/wb1CFjkiEw2iqYJy/JhXbIDUZKjOA//+z8U9WPCDjxjNdV5IV/sSvbU1KC
	 lIKbMVqnTfoF5Me1K0avjP6zKWFoBzC+zBWi5oNtkhwsR6Uby9nPaL/4oTLoOzDPJr0wH
	 0V+wiVyILViT+iEJRyY494wQZf5VwEzzCbhmzohXqry2SgbF1aOBnfA5bJjpAWuN4GA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PFjSssoQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Fey9dxf1;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 590D8606A321
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 14:14:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 590D8606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PFjSssoQ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Fey9dxf1
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RDoPMu2397365
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 14:14:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=tqkXPKxnOpu4GJB1w2Qf2g/GEkrQ0JawCqj
	yURpRlxs=; b=PFjSssoQqD0UryMhOWF+iBsdbEBHGwBEkX3x1QO4xf8QI8OACVl
	xx55BLIdOn8kbjILzl1IEnMiGqFHsJI4xQl2E9vlW/4BRxPYK6Ab1Y/Ff/fLinna
	wpX3GyaUnCnBnngHJSAcVgqRmO0IIjcfKTZc/Ed9hmcCmz7CTedie6bkM/znNT2A
	vlRK6KUJKnqlOsvJL0J1ln45OC+zcwn4YqjZYkTiYnBl/GEnWscJKfW1+r9p1sb6
	sYawKN0livILIR/0EhunFozcKibHeU4QzamTZ2RtmYY8GwJbFABLzofYiIPXqQFP
	ng+3YQZcvZRMcnO3HCmXNGUee+6uQI4ss0w==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjst1gysp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 14:14:35 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cd633da24f8so5109483a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 07:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793110475; x=1793715275; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tqkXPKxnOpu4GJB1w2Qf2g/GEkrQ0JawCqjyURpRlxs=;
        b=Fey9dxf18SCpnwPKvHH43AgDAaEMa51v8lD3B7L+04IUUfQ+EDEVPrsENXefl6/RRl
         hkx/o7sdbYgwJh+Ctek0UDKmHTHtVSYgSadLYwq+pHplKBcqkj5i0mJ86YQY7M5i+YdA
         1tLbWs+lHYM/JU5Oli+QL2eCBtMDuXXZa2k/P9zk9WaM+bwLX32LmwNZOx1DMynFvERr
         K5ngr1G1eqb++37pEoKyoTR1ItMaeXLF0X2pqRYvAqkMD+xjVevBXsjTrfQ3QfLPDqEB
         pakINprUwOK+OgIWDdcWASkLDoOLksYnIvW/kSoQJ6LWn4Y6lzUj3zLoeyJ7B8I1VC4z
         P4xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793110475; x=1793715275;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tqkXPKxnOpu4GJB1w2Qf2g/GEkrQ0JawCqjyURpRlxs=;
        b=h4h8kdCU9TGssCRKpI2pT1QODJoIaaSkbfyaMcdxLkJfmLaxtt79Tno6XagnbZNsIj
         Lsk0l5cAHCP0osjJmRi4p9nF4+r41U4K1rDkFTCcF7XIQGVgJOcfcAuzCrssfNZOBJxw
         7J2aC8C6OsY/wx1mBTA8/j14bsw+E7Q551RBUe/w49IzajeItRcTORT34d8IzyQWv3k5
         bBQhy0p1g8qUDIqSD2RVELM94HvraYUJNok3EvmAE/x75B4G6v4+kIk4qr8GPNPZ1AGT
         qPhPhsf6gq79HIUroHQ4tn4NjP3yuWGkoIjhSQY9pXFEBLYLLxIyK5SaT6H0OCTduI8z
         OSMA==
X-Forwarded-Encrypted: i=1; AKwUvByb2cRASAg+5Y4TYEbz3CEGG/MKBFacLlfCt1bcitH175046NXy5V/mV8lnHH2NX0gGgTmQFwOb0ig2Lqc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLJSOxV1IQoy02SbDmPDAvDHVsAGGKfyFgn+Vb/2nbfokf16zBs
	gNPB5JAk8yBtepH3m/rxZ+EtUqS68Ifj6T0AHJ3tfz3ljTy+rDOeqdpvRR2Smclw9nDAupog29y
	KIh5TMV0xCupB7ATomtcTYIDp6TQzQiSmEaWazEsZUEr5oii5rBiZwAIsYWNP4gBziPI=
X-Gm-Gg: AYBFou3zAkwBixWl3BLSqceSwXfushPFJDQgsHFWHycxlZosA2l8Uzg6wfRaCvcZZgp
	64fUTDc7+u7FftchNJ0ibmNhfZmyRHPOGes4ypjSyZEj8mlCH2ku7sabC/D4t0cIC6hMDBLQuGq
	Omc47yAyILgHgdR+mBUi0uU+4UHwVMjmrJGdlGpDR7Hz+FPpWljIH7kggd8ytGuZyEMVYHj556k
	/23u54M2kVFhPBfCLEA4luiH4ojDHIS8ss3USIey8q+CfPTG8+2Ll9FIDAgEdeR37szRWNd+o4Y
	PqdNCEXBb1FY9G/5YnJhqpvJ/6F4yZE0gmM4BJWVawjQEU1spFVV8654A8C7gX3QgiYLEM4fwMr
	UkbvwA+cRxLqq0kBId1ZbDbavo9liRAoZFjcYRvzDYg0cR5Z2p41wDXw+5bgyAs0DDDc7T/odHf
	Hz3smMOcisiQ33nppj6fik+Q==
X-Received: by 2002:a05:6300:49c:b0:3dd:a197:edf4 with SMTP id adf61e73a8af0-3e7cd669907mr6998666637.67.1793110474805;
        Tue, 27 Oct 2026 07:14:34 -0700 (PDT)
X-Received: by 2002:a05:6300:49c:b0:3dd:a197:edf4 with SMTP id adf61e73a8af0-3e7cd669907mr6998619637.67.1793110474061;
        Tue, 27 Oct 2026 07:14:34 -0700 (PDT)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8cccbaaa9sm2883071a12.23.2026.10.27.07.14.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 07:14:33 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Bart Van Assche <bvanassche@acm.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2] drm/msm/gem: Add some cleanup.h
Date: Tue, 27 Oct 2026 07:14:29 -0700
Message-ID: <20261027141430.20258-1-robin.clark@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=HJ1WhYtv c=1 sm=1 tr=0 ts=6ae0b1cb cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=e5mUnYsNAAAA:8
 a=EUspDBNiAAAA:8 a=R9CL6gCY_nRhBqBy_5QA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: zS7H_XpR1VcgAaNsuxE71AyEO7YNxzU_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA1NiBTYWx0ZWRfXxAej8Hi0B3AX
 i6qa5NH3e18pvm1/pBgdtJTdOzTvQkkVji0yknyunjes/pIUhgXcL0UvsxwOlY3DtOfy2xkRvTZ
 GYb/7MMGYwiYy6RZrub1JT5GRGV115o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA1NiBTYWx0ZWRfX8VF29q9BmQvA
 NJs9Lyg6sh0CEnUuSGXUxgZeiA0qImUYe2ArGZlYjywkN9v2TgNr3PdJ2YpZ1FeoW6e967wLHEF
 soLMWvkbwqGiATvSvxjuQlbnyr04RoD8ibWZp/6FvHbod6/XqvkYOtPbeY0eLIFYmVbs0A/gFRq
 4BJqvyXvaxC+9PW4HItE42fn5SbLkO2GT2iv31/k7PCuPEovC6W1uiDuHzRgHCT9MM1I71ryYgK
 pySsDlD9JSddP4C8WzYc/iZkitfkVfWVfb0uW5iuyovfvJrJK50dBYUVx/Wx5ojd4tDta7Uv4TY
 4aY/mQKXVpcCyoC0m0ty1R/zPhjyHNUM9TmthL6arCfJGH0qEU2NpKfCCfPB5d37G1tl8Jqtog9
 pu1FOrwNxfLTJu9NzkXkxuJRGxItMliAu7vs6xmSQ5OaeAKh8l9QJ2v8sOxrI4MtFb4gDdYun6z
 DUfV+UNeYXNvZhBWXgg==
X-Proofpoint-GUID: zS7H_XpR1VcgAaNsuxE71AyEO7YNxzU_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 spamscore=0 phishscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270056

Convert (most of) the msm_gem_lock() and friends over to scope based
cleanup.

Other than fixing a lock leak in msm_ioctl_gem_info_set_metadata() there
should be no functional change.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
Rebased onto: https://patchwork.freedesktop.org/series/176884/

 drivers/gpu/drm/msm/Makefile         |  2 ++
 drivers/gpu/drm/msm/msm_drv.c        | 40 +++++++++------------------
 drivers/gpu/drm/msm/msm_gem.c        | 41 +++++++---------------------
 drivers/gpu/drm/msm/msm_gem.h        |  3 ++
 drivers/gpu/drm/msm/msm_gem_submit.c |  6 ++--
 drivers/gpu/drm/msm/msm_gpu.c        |  3 +-
 6 files changed, 32 insertions(+), 63 deletions(-)

diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
index b5d64ee7eb74..042fd8fd3f57 100644
--- a/drivers/gpu/drm/msm/Makefile
+++ b/drivers/gpu/drm/msm/Makefile
@@ -254,3 +254,5 @@ $(addprefix $(obj)/,$(msm-y)): $(addprefix $(obj)/,$(ADRENO_HEADERS))
 $(addprefix $(obj)/,$(msm-display-y)): $(addprefix $(obj)/,$(DISPLAY_HEADERS))
 
 targets += $(ADRENO_HEADERS) $(DISPLAY_HEADERS) $(ADRENO_PERFCNTRS)
+
+CONTEXT_ANALYSIS_msm.o := y
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 7ab808322be6..4b2798efd9da 100644
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
+	scoped_cond_guard (gem_lock_intr, return -EINTR, obj) {
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
index 72e3cd8bb1e7..9abcc7beb268 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -376,8 +376,6 @@ static vm_fault_t msm_gem_fault(struct vm_fault *vmf)
 	struct page **pages;
 	unsigned long pfn;
 	pgoff_t pgoff;
-	int err;
-	vm_fault_t ret;
 
 	if (drm_WARN_ON_ONCE(obj->dev, drm_gem_is_imported(obj)))
 		return VM_FAULT_SIGBUS;
@@ -386,22 +384,19 @@ static vm_fault_t msm_gem_fault(struct vm_fault *vmf)
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
@@ -412,12 +407,7 @@ static vm_fault_t msm_gem_fault(struct vm_fault *vmf)
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
 
 
@@ -803,13 +793,8 @@ void *msm_gem_get_vaddr_locked(struct drm_gem_object *obj)
 
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
@@ -836,9 +821,8 @@ void msm_gem_put_vaddr_locked(struct drm_gem_object *obj)
 
 void msm_gem_put_vaddr(struct drm_gem_object *obj)
 {
-	msm_gem_lock(obj);
+	guard(gem_lock)(obj);
 	msm_gem_put_vaddr_locked(obj);
-	msm_gem_unlock(obj);
 }
 
 /* Update madvise status, returns true if not purged, else
@@ -849,9 +833,8 @@ int msm_gem_madvise(struct drm_gem_object *obj, unsigned madv)
 	struct drm_device *dev = obj->dev;
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 
-	msm_gem_lock(obj);
-
-	mutex_lock(&dev->gem_lru_mutex);
+	guard(gem_lock)(obj);
+	guard(mutex)(&dev->gem_lru_mutex);
 
 	if (msm_obj->madv != __MSM_MADV_PURGED)
 		msm_obj->madv = madv;
@@ -863,10 +846,6 @@ int msm_gem_madvise(struct drm_gem_object *obj, unsigned madv)
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

