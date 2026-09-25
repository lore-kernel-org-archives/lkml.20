Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AD9C4C753F
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 15:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790349459; cv=none; b=Gqt76vhPzGn7zPzxN+ejJ7XEkpocGbjxPKiUgGiEY8bn9iroKjYBSI3iwut+i9s6pP5GK6hRX2XLlMawN3HCH4xu9TgtWv3H1tVU4GPANmQOFIu/GhAo/sm9m4eKA+nUMcTNZjpsRx/ehynPVv8atxkz2sWh/uNq87c/CmswiuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790349459; c=relaxed/simple;
	bh=cJcMpcWue0tAmVioc9fHOu5EeC9vix9jxfaM5HnEBOQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZXrOH6R51Tq5Xn0ZrUt2+vYAGjrIgdNvcc7xZfyDps4kKGZepa3Ntj8gAC1GIvvRL95bGrhqAUTEMqIk9dtZxpnSRL6x1ZDuWkJ5Ou0ZljCI6LqP9cE8ux450sLTqqIABys4Nb7cpJA2pPbj06jeSUpsAWtrr0RViikI8V1atNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gzTD1SEY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jE48l7Py; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gzTD1SEY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jE48l7Py"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PD2v2h1056570
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 15:17:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=3xarg699YR5
	/SqvbYoFXYGmxgwGbRGBZnCFwVETijPs=; b=gzTD1SEYiy6iWVfEbP1Ntu8OQkz
	qVfpWPguU7mCPxdC9d5JTSfCd2BU2ro3PJy3kNrCa+J/ZOJ26U2A39pVJ2YduSLo
	2/GtfeGbyKnqpd6jd6zQxbhWLMHxPfL4LIvl1Hj2aYlOhTOwMAsDSGmj7EAgdtnZ
	kbbAjQ1FijfAPLP19KodWXDywETZo6P2hFLQmWLQKC543tNNffNCw7SLLMyziOAu
	jBrtWJZTn/HHan999D3irKgq972v+r3pW1y56t42VtOwi2lkdHmIMIWKPpUlnX3t
	dZU7/JcDHfA5lSvnMP2dEqOEZ5npbGMtAPgqCUb+flMPhEKOh6Sm+tnGV2A==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwce7b0gg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 15:17:26 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-791463ed29dso827813137.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 08:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790349446; x=1790954246; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3xarg699YR5/SqvbYoFXYGmxgwGbRGBZnCFwVETijPs=;
        b=jE48l7PyG9PgPkNrNz3aJVrU1nmhSsVKDqjGykBeAHSqIdUROiXOZ/DsajOl9i4uzE
         lUGRpaLEGwrkq0o2Z94KmSzqIbnb4bXdhs9m24Fgnb023Lgw8IX/2ZafGA40hilaySvY
         r2rxAkMQc1OJWe2Fi1O4hb3eTPwOp/MCzGcotZfa6xYuMXJ46A+TmU3wIQ0rEHBG38RM
         bEPVoUAhPfmUucOaogQdiCdkFEsNsxTY3CFoy19N9ChF5R9TuC2utjox0kfBVkLWae1u
         5K4m+PmfVuhR+BpQ5+QGeSfT45oGp0/J25g93Dvrxq+S3eNW3rdZHd4JTX+ldkcV+bu0
         oWRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790349446; x=1790954246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3xarg699YR5/SqvbYoFXYGmxgwGbRGBZnCFwVETijPs=;
        b=RD5X2fiwte8gn5MnnNj0LP4G2vfc60HlSUxaJSMVHXrPMVtKHCt5I9nf5Q8CHulrvs
         GgNh4VGxrRYoBZONYephKGO8yn0wtCO9cqF8BysK7rLGuOaxerh9Q91MDvlb4FNFryAy
         2AY0xqnpSWzbItCu9DWYwhvR1koUAN9hOLBdyR9If3q/oFEZtgIaogO9HR7BVvY7tOy9
         dnp7JEvkjkwrJOg9Br83PFfgH2LGT96jFRSfDBN6RyO1H2bXuSZuTTGCMNi11xhBkP/Z
         G0H1IpWUTaktbvCe//lOir57O1IhyZTf1s2reCLyjU+akOeoAZKzmOjxvNtfIdIAMW3X
         pQ6A==
X-Gm-Message-State: AFuF++nL/32PvuRMmrlAxHwaLONmEsxadyEkXMmohc1+au9ToJx3Elod
	CGLHQe6ACufUXfEnb/GW/jXR0GWnbs+VjxJg9pcHDMJRipv2wGAGommXZRBSwxx6NqKGhEjIiJx
	6BwTpdvbsNqep/7npJIgFjsOQbHpTLOo8uxxkVMc17scackiTpqT2hrvyi2JTOCdOhZU=
X-Gm-Gg: AYBFou2H8ZxYSFmulxCUGvo8T3jRYvt+r/vn4hU9uOyO8kspLBwtGartaiqAug2Z3ud
	w3pA4gRBXc8faW/XSvPtw+cg5HFLHbLTRsidMHbB+cjNUeJ0nnCHzOUYxphEVs7EFeOviRBNsk0
	a1/GOgrmpkwjyrFx630wfhmlFBrllPJcaggsMAXm8lSV6ohhw3hkQjKmj+m0ji4GydtwPpOdx0U
	f03iNbdy67atUZgklQuSy1G92JKq9DhU9G6FBYqiOGQPoam3aCN7OHx6xbq+1p0sRggG0/BK2kH
	xrUvx0JpvFhpn1Sz6aLwz/9vosMYyHAhDtfrILap35qQR1pbTlRibHSP6NCny5zfnjKC3Ao0GKw
	yW1hDW7AfiJtF2gxql6HQkth+tdrtpRbnFEJ4aQ==
X-Received: by 2002:a05:6102:8092:b0:7a1:3d97:fa91 with SMTP id ada2fe7eead31-7af1b96bb69mr2829765137.4.1790349445695;
        Fri, 25 Sep 2026 08:17:25 -0700 (PDT)
X-Received: by 2002:a05:6102:8092:b0:7a1:3d97:fa91 with SMTP id ada2fe7eead31-7af1b96bb69mr2829749137.4.1790349445137;
        Fri, 25 Sep 2026 08:17:25 -0700 (PDT)
Received: from localhost (ip-86-49-245-11.bb.vodafone.cz. [86.49.245.11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a648895sm7632913f8f.28.2026.09.25.08.17.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 08:17:24 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, anup@brainfault.org, tglx@kernel.org,
        kevin.tian@intel.com, fangyu.yu@linux.alibaba.com
Subject: [PATCH v6 12/16] iommu/dma: Enable IOMMU_DMA for 64-bit RISC-V
Date: Fri, 25 Sep 2026 17:16:55 +0200
Message-ID: <20260925151659.419512-13-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260925151659.419512-1-andrew.jones@oss.qualcomm.com>
References: <20260925151659.419512-1-andrew.jones@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: TXmWbtZLTDUCZYeErpb7-FwvJBJvktJF
X-Proofpoint-ORIG-GUID: TXmWbtZLTDUCZYeErpb7-FwvJBJvktJF
X-Authority-Analysis: v=2.4 cv=NJFAaE6g c=1 sm=1 tr=0 ts=6ab69086 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=4CXLxsOAgPM/krjtHEZQyA==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=h0uksLzaAAAA:8
 a=EUspDBNiAAAA:8 a=SRrdq9N9AAAA:8 a=vvBRGx3AIC5YeKHJuXcA:9
 a=crWF4MFLhNY0qMRaF8an:22 a=MSi_79tMYmZZG2gvAgS0:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA2MCBTYWx0ZWRfXyFVC+VAbIbrm
 3mNh1+lCxEMAJ+3g1qmYwhXAY4GZEDqhXTjqNeEuAwfgvf7VDRT9zBz59tDa6a7Ft5wJcU7TKt5
 UD1Iwg5ThgH7wPv0qnuEmvz/XB/d20E0eZFmMwRjkHiFzEJEAeSxwHXbYMYCQcmp+++U4aXOUIF
 H1kWcyw8CvV2RW/I4XVYXGeijYFkPWcSB8Fdlb+pKHO80c5N5EdLtQ0v4o+OxkB3VksEAtkBZ/B
 UnAVxJs8vWQF+UXzSu+ZcYJ/K2Ma0qURKp8EAbQlJPHdfIMggedsAZqBoNDUB89dV7wQa+ChAZd
 PqVl5lIVkI4Xk2utgRpzYrBBsIlm3bjD+16b1l+ca12V6xC4m2iTsLRwo34UFTLIjEl1rnXrMVM
 Pa11xwBjgxJ6MoUNYtl/EIxjmxX7P1BZadq3m94+wCz2KLm/GJ7nH2UZ61LFzV2oNIW2Uo13THJ
 9UXCvvlJp6uJRgo1FLA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA2MCBTYWx0ZWRfXzdaWxiRkyj6L
 VoUEiFFXW5nxHBzcFIz8Xj0fSQfpAtBuxccUJqIW0KuW6H6+CgzCNi2qsD3CDKFc+wY19F1k8FR
 QgIaWYpnvnUdLq4m8PlTTRNWiSljo88=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 spamscore=0
 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250060

From: Tomasz Jeznach <tomasz.jeznach@linux.dev>

Enable IOMMU_DMA for 64-bit RISC-V now that the RISC-V
IOMMU driver supports MSI remapping.

Signed-off-by: Tomasz Jeznach <tjeznach@rivosinc.com>
Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Tested-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
---
 drivers/iommu/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
index 27954f462582..2d38d5b5accd 100644
--- a/drivers/iommu/Kconfig
+++ b/drivers/iommu/Kconfig
@@ -151,7 +151,7 @@ config OF_IOMMU
 
 # IOMMU-agnostic DMA-mapping layer
 config IOMMU_DMA
-	def_bool ARM64 || X86 || S390
+	def_bool ARM64 || X86 || S390 || (RISCV && 64BIT)
 	select DMA_OPS_HELPERS
 	select IOMMU_API
 	select IOMMU_IOVA
-- 
2.43.0

