Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793114914;
	b=yWIw7IXQrxF6/J9Hdjq2uFpxuoiOMn0jNzEzd8TYXhaQXGUYnw12p+E1Hv7Ze30mlWJo
	 nI2m05SAe3dWQ7ZaHMyOCDrBbp8KsChqfl8776koHJQDYubeLBW2M4tZUTwsnFxFx0J5p
	 bw6ryLXlqe+aWpkaCnZ8QKHiQYiMIGpPD45Xb/bN+09i6XwtZnN1ac67W2NGPQozPLyYI
	 TkI8aN7rjqDC6Oy6iwXLLpcx20sEpl5F0RMK5WOG7Zj7Ui9ex4sXa2Xz6g+eDx+UIlKbl
	 wa4qUqe+35tEjbqIE7IqRJ+kkaA/0AlPxkO/CyKPc821Q/6zmDDJsZM9gb2ClMOnTgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793114914;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=F8E1dlDc2+yoHmfS+23ajE4p5M5n5nd5e4IqvEnIe4M=;
	b=g8hYWgEe0ZW3qLbC2RAM/ehbEHjPgPfmT7ZjGbN6I1PMmG+7UGDkHoeD11CjIRMwhhbH
	 95qoAFuwFmAuWepB0ySq+IZ3vY9HDuDNU9RrxCL4Ov43rnHCwfI6f4HWTC8FnuwXh4Od1
	 od9papc3NqjW94IHeh5uLeSonJ0J6mZIbfwUNPlkfCiYAo26DMJcgrM/9pFtHXkRo26nJ
	 eBzQVdpw3E54ipotIN5ZqGC+76CH67i8rD/ah3Y2CP68MUCNgVkcEdJEb+TjHGYnCBs9T
	 RTYeCPOq9aJMpT5JtJaHz1Gm4CmT8BD1fmv8QgD0TW6uJZ/6W86Q6wTm8fN4dOaMGyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HK5iSCnj;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="MK+Zx/5X";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E43F606A332
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:28:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E43F606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HK5iSCnj;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MK+Zx/5X
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RFL0d03153182
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:28:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=F8E1dlDc2+y
	oHmfS+23ajE4p5M5n5nd5e4IqvEnIe4M=; b=HK5iSCnjYs/osJBiit3eLBgQGCb
	bSYgEbMdb1ZcDoT7bMe3liYkksC/4MHRM9vuu0I4GizBulrQP1mb+MZeDz41AUPp
	1K2czSIHmcMf1slA5EHwZoywDBZI0QorMWH+QRy9/JIUrKXYvPyxSSlCuG4C+/s7
	l9YJ2Qx0AO0c4B1bKWdkbnozBofe6SNH1QdkCMscyUDumv8oRxQsH4V8zKzeNDxQ
	k9vF6cYeAb22u/KIOUhRTSE6K+d04qeO34OuR/C8Ot41acwEuzXyY4iPqlgIJDpw
	9UNsHsmlOCOe7YfzGoolIE8wwWqb8VKlaVbkoMx0WRsNn0nD+la2VRrrtbg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjqw21ue6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:28:32 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3acc98e3b3cso6376a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 08:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793114912; x=1793719712; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F8E1dlDc2+yoHmfS+23ajE4p5M5n5nd5e4IqvEnIe4M=;
        b=MK+Zx/5XKjFZGp9O3PhYXhg9pjHDxO7N/wSAZ4QzOZSTptfr8NiUXMDNqLgDsqPWhj
         87aHvCGQ1qrG7x7cs1CX3u6DXF3GCCNtvdun3cpCvdWB4J/10n6CNPNRA9avKGVFy6mQ
         UBC0f2KaH3vOzI1lXOwNbcoec3J+5dAosTMxJPO+pXKyXG049grEm9Xb/Tep06C3DMIQ
         gYmfmJ5rD82ZOqeiFzNoRLnOBhpRXHW3Zwp8HikZxDHlH1ngKBxWC6rXi6TV2A5dx4/K
         jkID1Hm1BzfNHrGET8YRrLyuUCSSI0Qg6OYhQNR21pLLVlm59QoyZJ7OvBlScYbOl3Qz
         /hfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793114912; x=1793719712;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=F8E1dlDc2+yoHmfS+23ajE4p5M5n5nd5e4IqvEnIe4M=;
        b=oSA0uVld/pa4/COmdv7tBR4CA/sPx6BSIIeexcMON2t+0BXBUx0PeSTeVTaoOGgURs
         VopUhPVES71oaN21cDXZnc9zDYSzIPPi/1ryCc6+jI67G9rHmpdvD35bwI64BrJUo74W
         Lo96yF6kWq82UQ8LxP9GtpRZPdjIKd4uoqKfF0IJthor68cjvrtGTK/BmbeHG82DLsKX
         norXdr27aF2+9ayYnPQUq3xDt2hQUVXZXbPiF4jaoRBiV+aJr0j+oQzlx+DNjAnIaX53
         QAWZYdJoEV5F/dTcmEw/OMzcKtc3GxsiB+s8trMxTICcBID+zvpgX9f2mNYhgyqMzWFm
         rgfg==
X-Forwarded-Encrypted: i=1; AKwUvBwwKktigZ/i3cJF7R2bMIDgHVk04wzPeRXWlo2GMC+jJjNCui4YTnDPXNt/yRAyAISd7bcyxZLwqoC4wYo=@vger.kernel.org
X-Gm-Message-State: AFq9FYK7WwzF5HmK5XHfytJE2vGitVDwqM1UTS0LYntrMzazMN5nIs6T
	WVdBEtvVRpHcjrWAFL2MOydaWOs4wYhkctb79wXzFhhGzSf6QPdgu/syaEJKPVZl9Z/X/fRxzg+
	uM6f4lvhkMCcTbu3CJOQdL0WmnvfHfTn/YXGQBjc+sli5tzliSbRkwIDBkMpn6K1o0CM=
X-Gm-Gg: AYBFou1EM6VuOeZRs2OmhlJv8oiU+1xQoBlXLb/dKS8ccHpuIe3vXuNWMDUN1kOhgoL
	gHpu0YdGytV++LLtMobcZow0fxncBDAhVjE4mqGH9HiGICLcIi8lwXVUawdEvoylaYspliL4BR1
	baZn+4DipohfYuOtupkInrWSFVixSo5nHm4kjy3Ff+4nUNRIQ+PGeeh1rnBoNFwCgLXZo/n1y5U
	Skk7NXrnWJ7YSxAwYVZkvac1kf5Pi4/n/r9fY8fZii+Llln4GCbbLS3fkDDTYuTFg+Awya4+oeu
	Nmp3/czqXY6JDe/7TPDfq/hYB2k3Xk6hWj9mVQsb7bxOgxbNKEETbCm06bsCA4pENIVKrGYAxqn
	ZiIVRpQXs6tJPo6bfTHouVwR5iBl4WFicVMvVuc8Psua0fBf23A==
X-Received: by 2002:a17:90b:58ef:b0:3ad:93b4:718f with SMTP id 98e67ed59e1d1-3adeafcf07dmr9059549a91.65.1793114911934;
        Tue, 27 Oct 2026 08:28:31 -0700 (PDT)
X-Received: by 2002:a17:90b:58ef:b0:3ad:93b4:718f with SMTP id 98e67ed59e1d1-3adeafcf07dmr9059526a91.65.1793114911429;
        Tue, 27 Oct 2026 08:28:31 -0700 (PDT)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae4061578fsm4263987a91.6.2026.10.27.08.28.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 08:28:30 -0700 (PDT)
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
Subject: [PATCH v2 4/5] drm/msm: Convert iommu map/unmap to helpers
Date: Tue, 27 Oct 2026 08:28:18 -0700
Message-ID: <20261027152821.51144-5-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA2MSBTYWx0ZWRfX+KfP+U74hwta
 ZtOttJ1kaa73nbak2FcbsIKkm8L+ySWEWtQcPfde5yfABC8IDYmeqYabcGNJc+afmPcQWTcNllg
 oSx4rKXen5ufy8qJEnMhd99rFhTQ6lMgs2q/KgHpiC1yP8yF5RfENoG1AP/PMbszt9Hdnmt0Wua
 0SSv9iP19LCqLlz6HNy2Sjl48XaYxd6X/gBJWit4X370RpszRgEQ2S4R7tjesL6IfruRVY3jlYw
 uNeIzjWTJ5H6VWNwl4vOT9DWV/f+T1eLDML1qco3QMpeKiiP1d0Xo3Dcrug13RKvxfMw7CEjQgC
 9NLheruR8NYcuLKWcUN8GA7K19Xcp53sSVAVz0iiCi4aF6KMobE0QOk6TIZhkemaTFp/jBGrfZf
 ZlxV26R9MdzPKHU96Q2kw72nUCYle7oQlPSuBbEkQmaegdETm+0ah+vQIx9juYfbGlowlFbyzUz
 OP5A9DoLW0Z6wecsfJQ==
X-Proofpoint-GUID: elpHAQHhE4aHw9rMLtZ86jOws6pMtxgV
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA2MSBTYWx0ZWRfXxBVV+qpJAGys
 p+aGONBYMaVAUMVFlo6QTbHreQp8/96IJg/5OO7sn/l7TOlnr2YeQRZSB+K29nPGahGn6IgfIT3
 9MG2w+ktCsEdOpnXJKknSWPM37kq3vM=
X-Authority-Analysis: v=2.4 cv=PsYG/AM3 c=1 sm=1 tr=0 ts=6ae0c320 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=3T_YcleVrN8O_gWOTnoA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: elpHAQHhE4aHw9rMLtZ86jOws6pMtxgV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270061

Re-use the previously introduced map/unmap helpers in the iommu path
(TTBR1 for GPU, ie. kernel managed buffers, and display/etc).

The callbacks work in terms of iommu_domain/ops instead of io_pgtable.
It would be kinda nice to just deal with io_pgtable, but the tlb ops
that arm-smmu uses for it's own io_pgtable require doing runpm, which
we wouldn't otherwise be able to do.

Tested-by: Jianfeng Liu <liujianfeng1994@gmail.com> # x1e78100 (Acer SFA14-11), v7.3-rc5 + this series, CONFIG_DMABUF_DEBUG=y
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_iommu.c | 35 +++++++++++++++++++++++----------
 1 file changed, 25 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
index 78c82f4a01b9..435736c8d715 100644
--- a/drivers/gpu/drm/msm/msm_iommu.c
+++ b/drivers/gpu/drm/msm/msm_iommu.c
@@ -731,12 +731,27 @@ static void msm_iommu_detach(struct msm_mmu *mmu)
 	iommu_detach_device(iommu->domain, mmu->dev);
 }
 
+static size_t
+__unmap_iommu(void *arg, u64 iova, size_t pgsize, size_t pgcount)
+{
+	struct iommu_domain *domain = arg;
+	return domain->ops->unmap_pages(domain, iova, pgsize, pgcount, NULL);
+}
+
+static int
+__map_iommu(void *arg, phys_addr_t paddr, u64 iova, size_t pgsize,
+	    size_t pgcount, int prot, size_t *mapped)
+{
+	struct iommu_domain *domain = arg;
+	return domain->ops->map_pages(domain, iova, paddr, pgsize, pgcount,
+				      prot, GFP_KERNEL, mapped);
+}
+
 static int msm_iommu_map(struct msm_mmu *mmu, uint64_t iova,
 			 struct sg_table *sgt, size_t off, size_t len,
 			 int prot)
 {
-	struct msm_iommu *iommu = to_msm_iommu(mmu);
-	ssize_t ret;
+	struct iommu_domain *domain = to_msm_iommu(mmu)->domain;
 
 	WARN_ON(off != 0);
 
@@ -744,23 +759,23 @@ static int msm_iommu_map(struct msm_mmu *mmu, uint64_t iova,
 	if (iova & BIT_ULL(48))
 		iova |= GENMASK_ULL(63, 49);
 
-	ret = iommu_map_sgtable(iommu->domain, iova, sgt, prot);
-	if (ret < 0)
-		return ret;
-
-	return (ret == len) ? 0 : -EINVAL;
+	return __do_map(domain->pgsize_bitmap, iova, sgt, off, len, prot,
+			domain, __map_iommu, __unmap_iommu);
 }
 
 static int msm_iommu_unmap(struct msm_mmu *mmu, uint64_t iova, size_t len)
 {
-	struct msm_iommu *iommu = to_msm_iommu(mmu);
+	struct iommu_domain *domain = to_msm_iommu(mmu)->domain;
+	int ret;
 
 	if (iova & BIT_ULL(48))
 		iova |= GENMASK_ULL(63, 49);
 
-	iommu_unmap(iommu->domain, iova, len);
+	ret = __do_unmap(domain->pgsize_bitmap, iova, len, domain, __unmap_iommu);
 
-	return 0;
+	iommu_flush_iotlb_all(domain);
+
+	return ret;
 }
 
 static void msm_iommu_destroy(struct msm_mmu *mmu)
-- 
2.56.0

