Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A53138F93B
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 15:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790954998; cv=none; b=Fa6p+JI0c3XXcSbwoyLRphj6KdFDjLnaYbPWpp0kQ9wHspO7kxlRO4HumzaJAzDIJbBKTmTS+zC4DfhcVdkWmrKSCpNw8hcdQfbZ4To3Bb5t9cIp7bb6c7MgLyPbojbocFJJdGBliNr2IvXSn9V9Mh0NYbN91yqreZFe30WaxVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790954998; c=relaxed/simple;
	bh=T99F34frJ9AfF2lK9ICPo0C6vzBvlMDk7/qsNG0Fhls=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WLEaLF/IKQZiQ9m6WM7XcvxOefb5tIEAvTP6q1s848rWiGW3GZwKivzzEvqoynlMCmJ3liRWZkF76JCoxvgmxJva57Op9BmmyAvV+MLotWEtY1wCKqdxSNmIOYXdFrMEne2CV6IVWypdviXIBRqsyJKvA8oCIUZ/mdZkonMvCgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DOdNgT16; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EI9GZY9C; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DOdNgT16";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EI9GZY9C"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692FGtfQ1878168
	for <linux-kernel@vger.kernel.org>; Fri, 2 Oct 2026 15:29:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FSpAX2ci4IyuylsIuoBJyMoBurc4WTIiQmLhuNQA+dk=; b=DOdNgT16KAspGaPK
	i6EStB1B272SWArCMwjFVYkSnj8Qt8eFpxPtYEDPsCG2oeiDR+8ozC0IL+rRSYL2
	FK2q9KVhK7Vou++t/TTiXeSG4POSX0vwrz3uIdSpseXlZ8HIs3Nm5oyReg3LR0E/
	xOO5XLcs0KVgPsl/7/0As2rFBmssR5P5pcVkyhEOl8DU9chCf6WlDgrwH1qvAC0h
	Wx7eu6m7CvxnAKuZEUq+SZjQpL1Jy62L6MnlMBV5XM0RUT4UObQONkrnIp1Qyojp
	0D+NymiLYK7cAQmxgNMTVECsNZZKzXSU4behxLp7Xs2ClYNiK9IFUf37REzauLah
	iQxqPQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1w8tkqv3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 15:29:56 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3a46f0f158dso44335a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 08:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790954996; x=1791559796; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FSpAX2ci4IyuylsIuoBJyMoBurc4WTIiQmLhuNQA+dk=;
        b=EI9GZY9C2p8dB6m6kKA9iNfHy61HQ6i2esE7j7cV2l5LQdPO6vaJPFXSMnphs0ym8i
         YHybpt+AddBG0FCd4Nznw8J/3Nao0hFly06nQ+pBk+B4ykcifB145MFt0SNeKrxXudas
         8ipoTXHOoCYSO+Jno8v3EH0zKNMw6Uf2mR5yyysBRlX60hesw4eRGyLZtQEz/3COOBZ1
         t+pEVFcBgFbwrJe4MTwhMveOR4WVoeSYPWAwN+7ePvZj823JV/M9Qd6JDG/mNkR1XTRo
         K66EjCXnSIM8SqqAjrAHVXlaPYDciMQwWYRM4Yio8FT6LYuRfE/Ma4OgnxPx1c/TRbaB
         iD7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790954996; x=1791559796;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FSpAX2ci4IyuylsIuoBJyMoBurc4WTIiQmLhuNQA+dk=;
        b=s/191h82ornA/iQZe4bYYXRI4+mHuRXolG5a0s+z47sIwwUNKqgwVj/hd9ZExDD0bo
         EfD7FMfIh9OONpQXZQR7LaaDyoYZHJKgGlxlsTFPF+japLE2fvDdz+H9fMU5y0hGY8Uv
         GCXpiH0MlR/9MvxqyDQH/SbBdayzbjWZ8oV+ESeMU0kiPsQnctU0470phMQYkIZloNCM
         AXYJGXY/6wcu8l1S4DZrzsKN+bZ/As13r53JXg968hcS9z4mgB9KKXFNvENbem/IgnDj
         F/cmDVnwL9RN3EzhNSoK4cv1fnKTlTclP9GcJesYF9FZZ+X5zqSjZxIY9fM2wZ2M1huf
         NK3w==
X-Forwarded-Encrypted: i=1; AKwUvByNblyxdhEC7rWXUfLiHK39hgXsTwbPgMHJicbI0a8LpcK9ATNNOZibLTtoq0R5JkBuyh2rQqkwSevx3jM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJDJA0L8UU5y3pnc/+V2nMCOs18PPIKKRnj4J3N4CbVBWRzKoP+
	q+VRnpPkUO5DaKtY3WSo75tz1GGuUJUv8c+fqcE0gQZ/HZEYOWKrrW+HmxARgcP+vpFDNCogzZD
	scVJW8ZgdjOtnNL5yWJ15zl58YNg3SpQJYbGBpA07MiAzild6P9eY6wMSUjLWB6rR5zw=
X-Gm-Gg: AYBFou3TMGAKpcEV+ledoA4wa1TJ9jqQFp0JfnqFKClOUBwY4JL1Le6kEWVauk9OZYR
	rYuxM5l2o7rrLEZ/HZAU8Cv+8JxJM0BeYNV+ILGYotBoA4Wq4muRFKZAVObPPbaQNPEGUFz8FlT
	OTR/LboPjrAu+wMh7zTMaM1zeu8Y8oTTSgS/5DrHm8YkxeFkpjaS0nJ0WSMZhqcVacRK9xtqZ6Q
	HQ6DZV33HTBvEfSvyyKs4iteW4kh/0nowldX+ZBlgx+kwtUVQWljyXX63vgrvwH0K70Iata75fU
	B/Zo36YzjrL1BzUaDcqeQWZKDPqOzvbaULL5Po8h2SaGe4Ar2/mlhSjy/xCAYgSP1OKzOaET3cq
	GVNmuOZBZmDsIpFMFnJswl6bY3DP7QFaGnGP98cs+dErQC8M=
X-Received: by 2002:a17:90b:5706:b0:3a0:f4ee:d2b2 with SMTP id 98e67ed59e1d1-3a6cec2ff75mr2095710a91.32.1790954996071;
        Fri, 02 Oct 2026 08:29:56 -0700 (PDT)
X-Received: by 2002:a17:90b:5706:b0:3a0:f4ee:d2b2 with SMTP id 98e67ed59e1d1-3a6cec2ff75mr2095696a91.32.1790954995609;
        Fri, 02 Oct 2026 08:29:55 -0700 (PDT)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a6cd5ddb51sm4390972a91.14.2026.10.02.08.29.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 08:29:54 -0700 (PDT)
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
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-kernel@vger.kernel.org (open list),
        linux-media@vger.kernel.org (open list:DMA BUFFER SHARING FRAMEWORK:Keyword:\bdma_(?:buf|fence|resv)\b),
        linaro-mm-sig@lists.linaro.org (moderated list:DMA BUFFER SHARING FRAMEWORK:Keyword:\bdma_(?:buf|fence|resv)\b)
Subject: [PATCH v2 2/6] drm/msm/gem: Mmap imported dma-bufs via the exporter
Date: Fri,  2 Oct 2026 08:29:39 -0700
Message-ID: <20261002152948.85308-3-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-GUID: 6ePlRai_D9Tofbnai6BidFv87zrjygws
X-Authority-Analysis: v=2.4 cv=ML/1C8Zl c=1 sm=1 tr=0 ts=6abfcdf4 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=19Wyn7e3V/0aNffMjNCMQw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=zd2uoN0lAAAA:8 a=plbGacqYsnyxf3yiAH4A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA2MSBTYWx0ZWRfX+tdVkM4tZhcN
 a5QJp3BDENoiCJJXtfdYTsuMnrALM0BVU8x3xd02e68EKmz3xZAjkHz078kNOGHKGq9DzhznqkO
 pnffK/HFandYonI+njwznpLJ7snGX4GsKzN+w1omUpdYryLU2sEpAy5SqPhs5jndCyrH5WLiO/1
 XsWPZ+0Ll8D5WI0NBH1GQ6/1WTR1yNLqwI32jOwk62J8mcCWCdOMRsEyS2XFIMCRkK/FG211tx2
 VqiLKhFzYZ6XIf2LrhNDPIEPBGnGVlqGsvzYW9k2BB1Twv572dB8k4YKy4SU9blnSC7bzydEmko
 vot5X/i4qhwPzNcs4WeeNNF25CzHzpv1bipu7VZaHrAtoq22ppOxDYo8kHfaIXr3LrOE2uQPgj5
 fcAp5KMoCFK4OYtGQ75NMza+D/6v3qAdT8YnSOVy8XE+cxEUkE0MTCUVTpIjSAsbH8EhJ5NgL5N
 jEv74ICIVUtUAMRwStQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA2MSBTYWx0ZWRfXzj4xkd3Hjnym
 0Ay6dNDo0Nsy8qbg8DgxL/fVeRJSHffSPTeeb2JYwNvh/FwfJgkfDbJS5VVDsH9/pMw+AMpLpRl
 CVuOxj9cksraXiKyC9PJGIAgJukbd5M=
X-Proofpoint-ORIG-GUID: 6ePlRai_D9Tofbnai6BidFv87zrjygws
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_04,2026-10-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 phishscore=0 spamscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020061

This was always the way it was supposed to work, and when we drop the
page array for imported dma-bufs our fault handling path will no longer
work.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/msm/msm_gem.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index e8390ebd5dd5..c90336b3b231 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -23,6 +23,8 @@
 #include "msm_gpu.h"
 #include "msm_kms.h"
 
+MODULE_IMPORT_NS("DMA_BUF");
+
 static void update_device_mem(struct msm_drm_private *priv, ssize_t size)
 {
 	uint64_t total_mem = atomic64_add_return(size, &priv->total_mem);
@@ -338,6 +340,9 @@ static vm_fault_t msm_gem_fault(struct vm_fault *vmf)
 	int err;
 	vm_fault_t ret;
 
+	if (drm_WARN_ON_ONCE(obj->dev, drm_gem_is_imported(obj)))
+		return VM_FAULT_SIGBUS;
+
 	/*
 	 * vm_ops.open/drm_gem_mmap_obj and close get and put
 	 * a reference on obj. So, we dont need to hold one here.
@@ -1126,6 +1131,25 @@ static int msm_gem_object_mmap(struct drm_gem_object *obj, struct vm_area_struct
 {
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 
+	if (drm_gem_is_imported(obj)) {
+		int ret;
+
+		/* Reset both vm_ops and vm_private_data, so we don't end up with
+		 * vm_ops pointing to our implementation if the dma-buf backend
+		 * doesn't set those fields.
+		 */
+		vma->vm_private_data = NULL;
+		vma->vm_ops = NULL;
+
+		ret = dma_buf_mmap(obj->dma_buf, vma, 0);
+
+		/* Drop the reference drm_gem_mmap_obj() acquired.*/
+		if (!ret)
+			drm_gem_object_put(obj);
+
+		return ret;
+	}
+
 	vm_flags_set(vma, VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP);
 	vma->vm_page_prot = msm_gem_pgprot(msm_obj, vma_get_page_prot(vma));
 
-- 
2.55.0

