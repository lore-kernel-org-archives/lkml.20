Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3178F459AE9
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 13:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791292225; cv=none; b=iR09+PxOHzHJNuFH69ZAxlwY6eH0CNTKaTTSibNXMue1mDGMj1eh6B0M5tHgTBBpVO6bz207BB1M2DW/XFDEN7+6c7wzAaIXFxLmEYXbWXleg7GffyeFsc1utusU2W81c/VysWJiGO1wf1V5TVOu7/Dntf5SJLGVZTMhAecjfy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791292225; c=relaxed/simple;
	bh=33yR49Uwuia0NOFflR+wH/VHfCzWTOQsiA+VkComNMU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i2zxbeqOuS2y/azwlT5y4jV0cxdZr0P7H1JMmicj6WdTMplOUEMlwEFLQd16G8WaOYf+RSDe9pPLzC6oGDwo8DNPcvmCGd7i5yPmWCW0xADJ876pHVw/Bay+1B28RAzC3bGYHWStc1Vp7r0qEb+he5+uijyI8+EPmMcijHWhEV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fvd4TQyI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Rx0FgV+s; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fvd4TQyI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Rx0FgV+s"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 696BPdGu3890766
	for <linux-kernel@vger.kernel.org>; Tue, 6 Oct 2026 13:10:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=J3ubeOOHnY3
	FSH96zXZQAtmRz0b+NtvvnMh1Zyox5v0=; b=Fvd4TQyIOALjD/cxQI8hsCgbAd0
	n97DE+5MN+e36WfXVL9nnExmFyDuvhW8D7rg6EpbEwUHBHfPX1ZwHLLtn5iv3EYx
	xbsnSDaLGGUR5W0EV9C8DRb7ZN5mTW5i3fnC6NtYMudmJ2WyHqY60/zqql3muKDj
	K3NU5Kt9n7h2wTb5Pe2UHtus1zkhXQwJv0wzarQzsNe536BZ+GhzFlJh72FjNI8F
	0A/Hq8wSZn4133IIsRG8QAkcNFGVhTnchTCXPcOfsUjUTd8EFPw1rcvQExtVwtQR
	7lPjEGlo55aTGGyCr6/2ueSAMXCkfRPxl5V6U6OFYBJXBrpnydkJmPJz1Ug==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4fkum0h2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 13:10:18 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e2e064b7a6so26300635ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 06:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791292217; x=1791897017; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J3ubeOOHnY3FSH96zXZQAtmRz0b+NtvvnMh1Zyox5v0=;
        b=Rx0FgV+sdgIozn5QvHUguDX34s1uOdTRba8dk7+A44GWSwgeZlFbBMDrxW171GWA94
         3vQHHVBP4QpYjeu+BpTnzFqqbgI9WYPJFO1hgbK06PwZEygCY140JjGAPCYvMUZUV3Dv
         cKddL0xp1+ZQINXiF99gqrV2OAMiFbnxW9Y5O17tjbWCq3iK0Ucc0J087oitjH6jvO2c
         UixTqxMzoqp6wFsPN9crdn/cMn+e/WUuBuDTfITki3Gj+xvAHMaZILvC8ZyCFJxqWbF/
         /Rq5cx0DdSiyA+JuSC/614pm8fiok+cBdsOnK/Q06AbMHEvkKq3k3ppeFxCmAUlDdKUO
         5OQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791292217; x=1791897017;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=J3ubeOOHnY3FSH96zXZQAtmRz0b+NtvvnMh1Zyox5v0=;
        b=hY0AskbrxhGoKrqXqkPGC3KYMeM163NAaCukWMKQrmWUwfLN1PQ9wC2p7UY33nSXrT
         nS35tw8V8OoIcAgv76SqunspaQ4koKo6D2HBC2zrt++JXdUUEzpRvS7ok+xENouIRCmx
         VZIad0jgXXKce/invJb43BTKuTfQd9WRoONN5n3fkd3O+B9n/OIIeJU2pJT03SO1Y6ro
         rx1t/r/oO8X4+uktt++EnNU+QzwoVMfgYv+CDIjXAgxATNAZxIrJvJus2SQdHDPiKSlW
         0JPiBYhmWm4CH9A922H6d+h1PvvJveKxeC6tD2GRJNyW570WWP8EBVCWyvZb/sRJLXcF
         DF1A==
X-Forwarded-Encrypted: i=1; AKwUvByMET9PgZT5QsDdWX8YFm1NrCfCH+Q6g5NpvJ8unhktZy9/UiTJDnaXnUPKkeoiuc1PgFrEEx9okDk/a/w=@vger.kernel.org
X-Gm-Message-State: AFuF++meL9aTy+DWEpR5UwNkLQhSm6tMnIOL1XmC6QsBqVkl7y07uFTr
	6k8I9Hd8gBrxmGCfc15dDEUV0k0nqtzZ68c3SOFB3kBSVBzZtjeeyE4WqlxnkF4vUdMzf7X2WzM
	BfMtNmKhu9fv/4cvwNu7yjqWlss9N1Ugy7uRxqiHEVXcOZHoLyNtcCkYeE7bwBOJiNts=
X-Gm-Gg: AYBFou2sGpDjfsfYwL0BAcD9ODsblnI/utPvanIS9S+d8HNy2ME+595DfBX9une59Lt
	qyykEk7eoZxMCPJA6GC/fPXjRxYoOlNr2Ib8l3eDkPi6faEEK5a8+MQ0Qi7iCB8B+GZt+S91yla
	LBU5qIgWmW9zTPpvyqViVi8XbwwPmPouUa89MqTM5yDp8TYTi8StmzQ2vFQF7A33GOGJHoCh6kG
	AgVL5SBo8brEk7jFLxYoP7TA1MMi3TYcThuu3D6OdXPsy3eqAZA+6Zk9MlXanejLEyY3uSowIyF
	/bSOIlK/a4KNXOesJAN/ZRqaZPfnmUttC1Y2izwG31zqQa/ifFAp+9KkBU1lgL68y98Ne9s73n7
	J4bxoJG6taWIOozOiLEKEo5bMP9nm4v2HzuPhT0jOW9J7SQ==
X-Received: by 2002:a17:903:17cb:b0:2df:5836:d1d0 with SMTP id d9443c01a7336-2e5dcda09dbmr11501095ad.30.1791292217459;
        Tue, 06 Oct 2026 06:10:17 -0700 (PDT)
X-Received: by 2002:a17:903:17cb:b0:2df:5836:d1d0 with SMTP id d9443c01a7336-2e5dcda09dbmr11500705ad.30.1791292216891;
        Tue, 06 Oct 2026 06:10:16 -0700 (PDT)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e5a5edee06sm22115255ad.59.2026.10.06.06.10.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 06:10:16 -0700 (PDT)
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
Subject: [RFT 5/5] drm/msm: Convert map helper to use dma-address
Date: Tue,  6 Oct 2026 06:09:56 -0700
Message-ID: <20261006131000.81501-6-robin.clark@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=HtPjiETS c=1 sm=1 tr=0 ts=6ac4f33a cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=19Wyn7e3V/0aNffMjNCMQw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=B-XXGUA0wr0Z4rGOYBEA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: GCLAPYtgNm4vdZ8mQ7kezf-oYxkVePKr
X-Proofpoint-ORIG-GUID: GCLAPYtgNm4vdZ8mQ7kezf-oYxkVePKr
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDA1MiBTYWx0ZWRfXyW2Im0Pc74d5
 6cxtrL/28TaITTzxWo7/mzRHKThwu8ypTVeEWQBIGhKW3Zfa1ufTJWmAW9jRGeSj/rEw/MUNlEu
 +8fSx7fGtkivyY2T0gIRBUnAYXnQqeA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDA1MiBTYWx0ZWRfX/2Cq6NI/HqHf
 4C+LU8vOBuOLhF7TUjKiikDBRn2GrukE2l1t1eQOufd3MHnsL1cbVIjpYoBX2obGmF5zhrm3JED
 h6FtKCfAEjORR58uFBvX/iyhW8MtAUDtYQMGSohcm7fMK01xseDhz5STXLm1hJ92Vb7vhDJ8neO
 FdElvvVMpSxyQGFVC5/u15YK6faVMg/BEEPOb4B156RfJzGd1U8+OGWhUHzD2wTnt/zVOiUuS3W
 0PrG+5NcN1OKUMAdB+ZJOtpOruMeYtlKGQZYi4YsyFjJJS51MvXUhc/1mFJSo72jzNzXXiG0S0A
 2Byw8Tn2mD2Vg6pmFLYBTStNi3uMi65uUdfaO3c9zNCvaO+Gbkrj4vvDkKkHjtGWI+PlsEJoh7Y
 wWKt33opbsHcgg1r1hVIJqy8Zb5Y8xve/LqpvAx+kSepVDLWXpsMZAum9DWMSGD0evKCQcR7sWu
 +YMfF3cunQAt65fBb+w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_03,2026-10-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0
 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060052

Now that we have everything unified in one path, switch over to using
dma addresses for setting up the mapping.  This avoids issues with
CONFIG_DMABUF_DEBUG stripping the pages from the sgt.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_iommu.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
index 50038d00c3a8..27a74514e942 100644
--- a/drivers/gpu/drm/msm/msm_iommu.c
+++ b/drivers/gpu/drm/msm/msm_iommu.c
@@ -148,9 +148,9 @@ __do_map(unsigned long pgsize_bitmap, u64 iova, struct sg_table *sgt, size_t off
 	u64 addr = iova;
 	unsigned int i;
 
-	for_each_sgtable_sg (sgt, sg, i) {
-		size_t size = sg->length;
-		phys_addr_t phys = sg_phys(sg);
+	for_each_sgtable_dma_sg (sgt, sg, i) {
+		size_t size = sg_dma_len(sg);
+		phys_addr_t phys = sg_dma_address(sg);
 
 		if (!len)
 			break;
-- 
2.55.0

