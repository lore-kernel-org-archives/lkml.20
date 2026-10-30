Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793397922;
	b=ICLTTAArSdCERpe0sFRvxziKnyOVr71j0rWAggECOLg/1CmfUPvZbuKSYmCI9E/a27ml
	 uuce+8z6a9errRTZm8a59YXz9/gjqjmbr4u+S2kukifvh/rFNr1rEOh6h7kfL4JnGi+h6
	 Y4rmkEhYA6G5Ftx+Lxzgtcwc/vJ55C8ySDNIyCcdJhzRn6firboRzBI8oObLhYBJ8ktlz
	 +HDTMY3O7mI56TDosXUsulg2xoHon/8bngaaJUC2+fumjm99zcnZlrA03pEXlYTVB/tht
	 RCKEfx/4Rw48Isdon8m5Cib0k8DLMcWJDz3tmi5+9hN4Q6mAxZBbvfrolIWkdFGbCzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793397922;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ldJHLqNPYA21kCRrsUkyNCbzh8KMiC3m/wDt/0CLW4U=;
	b=4d7GpHB+nMRbFfiaLaPjMbwjQsNYHGVdsARBSE3S/Vzi77/MNIU0QOuRBbVLw5YQBbK6
	 2qhucC3I/YkE5hd7FNgHoTvk4B1j56CYtDGF6jWjrjgZREw2eg3ie27UhkCprsf4J/Dqb
	 RY++sUtiH7Xnax4SnUkdqeNgzcC5z2c8Wt4MD+LKRY13J+oaYdFydXca70INZmiexQ/M5
	 uahsGkXWb5LUKmTqlLycDGSAdtbZ68xBG2VPf0YFMTbprihPzBZ5e8IYd3bxeTQrmnhMM
	 qV1/VTaMMXMzT0Y5003/4p0/EIF9CuxAxMGCx9QMIeOq3hSkT8WD/Q8c3/EXLBiNwhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BxWAEqB6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eS0TF2IC;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EED1606A325
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 22:05:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6EED1606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BxWAEqB6;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eS0TF2IC
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69ULtGVE3463055
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 22:05:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ldJHLqNPYA21kCRrsUkyNCbzh8KMiC3m/wDt/0CLW4U=; b=BxWAEqB6WtHoP7jf
	2dDMxfDD61mBAnDl2X9HO8BQDcjwwbqYm2ImVArwCd+yQQMel+luu6COS87efL/l
	oZPWKgiMorDUdGPDxFPD4YwvfacTEWleJTz7zl6iD6kJvH2jQtXsCNPqyZu60sWT
	ox0C4nNPLlxLe73MdDNQwYi6jLTqm0Y/omxqp9rz5/vL1gF46A3pnXshKmomkvwD
	xekR2kkG83T3nx31G16mPrWH+WOr3fhvjOtK1ppJnQfxzPr4t9ZxFWRHusowgH2V
	3RdE7K2VEQQBmiZj8AGt2wzJlIEKcWDUhBc/iOS20ygg5mWAklgPxlb5KrYNGIdT
	rdJx6g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn2x0852j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 22:05:21 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-53664911d46so33743331cf.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 15:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793397921; x=1794002721; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ldJHLqNPYA21kCRrsUkyNCbzh8KMiC3m/wDt/0CLW4U=;
        b=eS0TF2IC9TAbyUppVd3m/2VSXed4ywapcKpv3EMk5tXZBR8w8bW6Q7C5eMbkIqPie6
         brrl4cTKFNcse023bBPTGijj43P1K5q6RJO5lG/w5T6HPmpFNng82tnaLlqjdcspRk8T
         /FWdUuj/TbnyjuclCf0djWRmrOelXJedbClhOt1VdK7c6ZAgaGn7brGW3Dh8z/ffu2DA
         Edk7IAOUNHn3VRLW2CjDW0EhOBPuJGbXgCrcjWWXkHFtQIlBveT5cpndZanbZmc7TVRZ
         keXwIgSQnIwo3QZ1U/xS6ufIVH8mYGB3GAVu+6mVCGgrEtP4tab9wdkRc/LZVCoM+EgH
         pEMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793397921; x=1794002721;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ldJHLqNPYA21kCRrsUkyNCbzh8KMiC3m/wDt/0CLW4U=;
        b=O/FCT8pP0+UivX7KS+C178C7tYht5uJPnmgIi6LpinYMulCdmY15wQZaJQOZLDBDM6
         Q6cjKDO4ZYABOW0h2ME7OFa/HEv+TIGCJg4VKmHt2stHoj5hC72hCaxxT+ixycLU5GoG
         xr0rqdYYdjpl3Hcu3Teu05flq6CU5LeAASlGZGlrqjOyhTyG1ycqgC1VMXhO1m/CsgzR
         IrfYLr8u+sIeJJlherkyZ8pzS+7BH1x1I1opxyj/ZcjGap+iC5qjpEzVODySnfAELT+A
         RqY1NG8SV8aqwUxKXZ92Jq5x+rzSDKuMq39lvKLZaH2sIW55iOskjY+/iNSgStUT2DUe
         wlnQ==
X-Forwarded-Encrypted: i=1; AKwUvBzg/T5DorAJBlv7BJX7jJ1bf1SAFR7TBSMIYEft4GZ3nmm/rU0oW2m72SAONpmcwETjcl7AgVFFg+aNgho=@vger.kernel.org
X-Gm-Message-State: AFq9FYIkWnY6uL4qvU53WPe/j411u433QCGHkgBRLGVPivL3hI7jU7Sx
	bZJ+zg5ElCgdO/knUYW5LDS+JppZwnQbadRiMa8eCs82NmDYZyNx+BKiGybv+EbV6mh1K8q5df1
	IYjGYQUWSAvarPfChGsuk5jg4VjcIRDOWgEDQCYFnyxEWdLusEBvvuA5922nEzGtMJbY=
X-Gm-Gg: AYBFou38jXjlaUXIMpv+seOzJymi6bQOzFv7UMibSN12GWg8e6Z0yf3pa6uMt5s2j+Q
	tV5O3EjTzxqCUwy98MUrCyoAXxBU5VhKkjLl3fiAapK64DBxed+wcWUOtYdjjTR9jheWoE5dMHv
	hjB9hCVUsA92rpPF/HkVsOx806kKM34UC0TgTfBswsXuYiTZMt24LhScdeThhT9p73GkmUxFpZ2
	7rlH4LecWdqG+H3IB0eC38SHAq+jA5ekE7uRrAM9K/2+SgVsDaBYjk/q3FvrQLyuLcS7/476aFO
	5BGNUQAZHtqFB/OOfYhrB7t0vOvCQFDPSbiLf8CHv7olGVGTTJKATrHJ2yLQ0O/ceHSEWdkRlYL
	UGkckaFl07CDBlzJGCVrB3P+3qocsBUaJWtLxRDi8MonfUSJO6jnAx7gp2VRGYqgR1pssftBTrR
	abTwZAs/HXxlBFs7I2MqRxBHugNMoJBThbh35mwW0M5IlUlHCKn3NhjAeYW1lKeA==
X-Received: by 2002:a05:620a:1793:b0:93c:c96c:a592 with SMTP id af79cd13be357-944216964edmr668716485a.36.1793397920623;
        Fri, 30 Oct 2026 15:05:20 -0700 (PDT)
X-Received: by 2002:a05:620a:1793:b0:93c:c96c:a592 with SMTP id af79cd13be357-944216964edmr668711285a.36.1793397920090;
        Fri, 30 Oct 2026 15:05:20 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe04edd7dsm243930e87.6.2026.10.30.15.05.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 15:05:19 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 31 Oct 2026 00:04:57 +0200
Subject: [PATCH 1/3] iommu/qcom: Invalidate the TLB in flush_iotlb_all
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261031-msm-smmu-identity-v1-1-a2a70580eebd@oss.qualcomm.com>
References: <20261031-msm-smmu-identity-v1-0-a2a70580eebd@oss.qualcomm.com>
In-Reply-To: <20261031-msm-smmu-identity-v1-0-a2a70580eebd@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1766;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=LQSeEnZeJwLPjMHD6yS/rY03vuD1dC+sPugd4ceeFj4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq5RSWvF4Ibiecr2lXXJ61ZULZ+El0+25rk6uqh
 DEvzO0k4f6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCauUUlgAKCRCLPIo+Aiko
 1XnrCACbcBLnbtrnjqWfI3ofMBee5ZVbwNaEdA00rUry7tWHK7wx7qu8a8mLT5cWfbQrJxqwxOQ
 7i6yVmfkJQFaySlcalzPLtlP88jf8A3hnAzX5ZHysbCk2TCX6SiYhUP2QjUhz1k2KWx/nxbbMi6
 25OyO0MwxZYyeQeirCNqIJw+jd4GjIYU0hqp6VwJWmcCaPmzN11UUMPgvyabVhFkG41BtDkyM/G
 uuvyvE6Cvdj37X6ugVN5dYce8dVlhPI9KU1ZMqrYhYqX91HVRfXj8APEAEwrV5+hVmwoE5jZpq5
 H6UgKNAeREwuWzcCbth9Y/W+HmkWYCOZt1tBvBNoGF5BHCzK
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: GLSvy9n481QuXs1AIE_jhPDq5aqZPCq9
X-Proofpoint-GUID: GLSvy9n481QuXs1AIE_jhPDq5aqZPCq9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA4OCBTYWx0ZWRfXw4kmEnuUYul0
 4BaslxG4DF64DKSdAXhTifJ9BykKhVvyIHXfmLCzcuYEebxUPXPc6Upe4Lk+2zjGRCKtxhXBdwR
 VP5h5GTd9UNTnNsEvDhZMLLgYT4lNAA=
X-Authority-Analysis: v=2.4 cv=WfKZ+EhX c=1 sm=1 tr=0 ts=6ae514a1 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=brFVVzKzgM8PounSOcIA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA4OCBTYWx0ZWRfXzy6xqDa6z8lC
 wDxOb8B58x2yj+3/HLg/j+i+yRjSjSpjQZS3D61oKi30H4DLq875r1k46aus9pNW/noDLiv+hUW
 A1qKnS2dg+Z4GvtnsT0gUGhaINmWGE8Oy2/O9bPjfGuZI5amn8eYu88d0wdUYE2K+cEs5+hSa2C
 zpI9GG/g/zGiQJ6n0M4oky5kL1xqSicNY6K6iTnLQrxCcxXEhxbifu4SfnqZUywDvl1L17slAKF
 mdkHqXtJUJmic5+wewcP2VbdfZSJ/4uRBt4rYE4gINh0FsTAE4q0peYt+RV+MKOuomMtPWTL/VI
 SaRXcI/gdtoMV0ExfaFUvqyx46MYyb46cgUl6hu6V5evRVqbuL+pPdRYdgsI3ztFwQuB0UbdWqw
 Ep+7m9q5rdygnr4MmvLcbC1yRt1Nc3ZCRP95gpaiYMV8Tv3SHjC76GymQMP8jRVKLomwfI1FNs0
 Zjv0JovJ61SOcIyuowg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_07,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610300088

qcom_iommu_flush_iotlb_all() only waits for a TLB sync and never
invalidates anything. iommu_unmap() users do not notice, since
io-pgtable invalidates each page through the gather, but drm/msm unmaps
with a NULL gather and relies on flush_iotlb_all. On db410c the GPU then
hangs on stale TLB entries as soon as another process reuses the IOVAs.

Invalidate the whole context, as arm-smmu does, and keep iotlb_sync a
plain sync.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/iommu/arm/arm-smmu/qcom_iommu.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/qcom_iommu.c b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
index 21d18ce67b98..54130c32056a 100644
--- a/drivers/iommu/arm/arm-smmu/qcom_iommu.c
+++ b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
@@ -479,14 +479,22 @@ static void qcom_iommu_flush_iotlb_all(struct iommu_domain *domain)
 		return;
 
 	pm_runtime_get_sync(qcom_domain->iommu->dev);
-	qcom_iommu_tlb_sync(pgtable->cookie);
+	qcom_iommu_tlb_inv_context(pgtable->cookie);
 	pm_runtime_put_sync(qcom_domain->iommu->dev);
 }
 
 static void qcom_iommu_iotlb_sync(struct iommu_domain *domain,
 				  struct iommu_iotlb_gather *gather)
 {
-	qcom_iommu_flush_iotlb_all(domain);
+	struct qcom_iommu_domain *qcom_domain = to_qcom_iommu_domain(domain);
+	struct io_pgtable *pgtable = container_of(qcom_domain->pgtbl_ops,
+						  struct io_pgtable, ops);
+	if (!qcom_domain->pgtbl_ops)
+		return;
+
+	pm_runtime_get_sync(qcom_domain->iommu->dev);
+	qcom_iommu_tlb_sync(pgtable->cookie);
+	pm_runtime_put_sync(qcom_domain->iommu->dev);
 }
 
 static phys_addr_t qcom_iommu_iova_to_phys(struct iommu_domain *domain,

-- 
2.47.3

