Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793309033;
	b=4c+48/1cyMSXOD97J0vmBrde43zOP6i6OOVAHA279JTuXcMdTsO95JkpFIu0h4CPj1qs
	 dsT8VXSzO9j2p+0lK6OR3teDOOroeqfBzgxBWdVycPgpZGqHNOPW/lwqDh87oaawpMDUV
	 6Bwyzi6dKa5P5KoLoqwtdi2fPj+EHpBt92qO17vPtXnefqo48DB13YFVV228hw93JX+Np
	 G+RGgSmsTJbGaacORsVPyihsVjKfuUphKWtcDbcvIAhsIKxyZLTINozCfN3/BWmtHX8qd
	 MnV3B2LUhZVwGgV17dakKHI727QKhOzqmC0g/dHfp5l0pddxCIONheNTAGmCseEjrDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793309033;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=k99yZnPO//ukQtkYAl64CwdQpomDxI0ACN/FhmeAnkU=;
	b=SaBdpi6tKEGLJ7U4kxIsEkzUJRkbywnIdI3cXsPV8Exo+KbXTcnfB0Tc3QredOCbU5Sr
	 TLC1n6jhq0/CkB9E39bhmA/sxe8c9FGgqFiCfSZJyWaorm8kFAsYcxJtKLWz7vpWTQQwQ
	 TXwWzyMgsztJPtf73mF9EyhnNyK75of5oBSuJrx0rrklZ3pNUbLVvCwjHGsdJUU7LTo3r
	 otJcAoLL8VGHX6Ocj5YHQQkENrwbLNaUZ8tsmdwU6p8JoyS5JbTBMKkLqzzNJl72C5T8m
	 GJ2n+9kvgwxXhhHmkruk4Jbb67MSwuPMT7SF2O+tu1+FRBXUIp8KxIVW5dLtK7RO8tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ph7Tec2U;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HbBEcRTr;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D48A8606A327
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 21:23:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D48A8606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ph7Tec2U;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HbBEcRTr
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TJk1dx2140193
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 21:23:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=k99yZnPO//u
	kQtkYAl64CwdQpomDxI0ACN/FhmeAnkU=; b=Ph7Tec2UImH0TA0hHZJxI9PY+gV
	4RgrfuGlj6cfSV3KRpT3h1tiZIc8syLaeQpZM+h2XLHL66cXuBkY3QO7u643dA0Z
	TGo2gCl4ynKB9v0b2M+uEta1c1qA3g3s3fF5RHYGtxoY4lR+zcLLABWpcVTT9zXt
	mCddJ47Zexo3Lke5hBHl/14zWyAuEvEfsAGBKFcxYNvn2e7XDwc+QHryNq27V0gr
	13AXaRadWKoHjQ/1cE3yMs+hv/Xan8eyHTQKqSVx9pAFstH/nlWyyT0+ZtOlY5fj
	rfqxGd4WzdlYtFw69ak3VCW98XohMaRpPVxQwAzAtWQFAD5Fdw5qwMuv8Bw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hm4a22v4k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 21:23:51 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8a5971cf7ceso3424791b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 14:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793309031; x=1793913831; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k99yZnPO//ukQtkYAl64CwdQpomDxI0ACN/FhmeAnkU=;
        b=HbBEcRTruWlNdQRghcLegMwEvimc/YobMwqZcbsrDo4cWzW9jiNurjKi8cGzsVY2fb
         w3e0/a3WNG/Ra3+Fy7KDmrhUfwMD2qYynRzAliyf5aFm3FhHI1Hylpl9HO1rTNpeCgwz
         alZSxjGc0KxjwDYBB4+JFZk7S0sCKg/rXq0pAB9ZuwW8ltXfgvZJ5sIekr3Y9Ht4Uk9D
         HMkjhzEQMuLHxJNtacnva9kcKzxuv1wCJMh/u8FmNqAS/j9E3v+p0NWGmpBOo/uvy1br
         KWgconmfZcSt7CyxAg6WcFzfE4Ri01mgR3TeM5WeHp3cAtpUhVisBPYjjNqvhzjtyuPs
         roMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793309031; x=1793913831;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=k99yZnPO//ukQtkYAl64CwdQpomDxI0ACN/FhmeAnkU=;
        b=nmKliIru7qlnMluODFkNQbasUL+XsawXX/A8GdlIfck6IjbwQSlMK2szTxz/WkPVuG
         WFLFg+PrYURECUI+ITXyB78upHg6nxqz74YzHLmdqzzUQmFcysG6GMDg9JaOGmk0/YgK
         vafeO2uf7jgtaejxXxJjwuGIn3T30Dm4MtMp8ij3qdK3riEsVV1zCsejHMYPIxszblq9
         aFa/b454JrFwOFh82sR2xxSrXmCf5JSkV+sFUxC3bv41wOr+hPUkzKFc2GqWV4tQbmb0
         vbFo28CXgoIypADqAaaZeykCLHa0nkMBHywY3c881QI0KjldnoH1X72BRpsbCvCHnNhk
         V0UA==
X-Forwarded-Encrypted: i=1; AKwUvBwSK/SC/njfkAg42/VUOSlCQnWD04h2pIxiwFXweXNALPlz44jYp85/wzEYc8Z/JIibXYlnry4HnLHQN9c=@vger.kernel.org
X-Gm-Message-State: AFq9FYL11RCXhwPVeP06BxVqL+WjFlOcG1hHeUe/Naxd3YaeS+/lVYnb
	vcTepoDy5yKBMZIUIsJZk5OgweSyls9cBu2e/x9fXgTupjWTg0ewseH3wfD9379QODislNKRcOB
	lXOjPtFEenFvRCamNkFvMSqe08MxVbOFOcTdb4lT/jjpIwWIGmyMDFMs+QkvPDIoGWPQ=
X-Gm-Gg: AYBFou25azbAyZ9uERjH3vpYf0dnDJCQbVufKG/Qu5CNviIXDu0zvSxtPNnmzh9UHP6
	PLApv+VvGjEvKafsgNhCrDCB7YLDC+lXRwbny5XHOFqLA1sYDjYSTbrjauCOF5W+UEB07geofDd
	wzt1WgPVezHHFh57OG4vmmhYHqQ2TrGHy5E0dHhSDfuotsN7YMLp/6Ku7Q/sk3OLixwLsDFgOPu
	Yx2S+juSO0k/LQDl/V+K13LX5PHR/WCqtijNlOq5mNCGXTkZyHWWfZQ5jqPJ5NWkGjnrkYaxFXN
	77UOSjb3w2kyZGuPAXClkrdjOyTCnBTFQR9lNAo08nyXSwBbT+vkSgtOCbuj3nmdxvAIX753ujf
	PILYPxj3M1sTSZICUrpnVwA7Mb98BZkuwwM2n8ITx1BMnlGfHR9UupbLMIWArk9IoOcaCZAnw+0
	jWFOQX/t3EDUUaiFFTzuuCNw==
X-Received: by 2002:a05:6a00:3a1c:b0:8a0:3ed7:93a3 with SMTP id d2e1a72fcca58-8a9be7790c6mr302321b3a.29.1793309031377;
        Thu, 29 Oct 2026 14:23:51 -0700 (PDT)
X-Received: by 2002:a05:6a00:3a1c:b0:8a0:3ed7:93a3 with SMTP id d2e1a72fcca58-8a9be7790c6mr302306b3a.29.1793309030908;
        Thu, 29 Oct 2026 14:23:50 -0700 (PDT)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a98893d1f4sm294090b3a.12.2026.10.29.14.23.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 14:23:50 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: iommu@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 2/2] iommu/msm: Use identity domain for GPU and display
Date: Thu, 29 Oct 2026 14:23:43 -0700
Message-ID: <20261029212344.346069-3-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261029212344.346069-1-robin.clark@oss.qualcomm.com>
References: <20261029212344.346069-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA4NCBTYWx0ZWRfX8S1fVtCl517g
 iFh0fxUjDuv4ltCoZIYREof6hjPbLByk7fmBGtL+ei7Q+mY6t6+Bf4l872Py1DiUt+6YFnuHnaF
 uhsW8TkMEuZW3w+JUCOVIqIJlLj7wqnzEefgFJWPiT3SfQyIf2/dw1ZAhZseSKRP5NnQHtmTwe7
 G5Ej9BQ4sv9mddiA2R11e3dnIgwJZ6eOqXEwto5nJIstZId/jVnb0dWhg5KqnGOTpgT9oxSvVzb
 8VZMPR5T7TNZD/DDRCgVPMLHS8zBdHSBxcrglKvgoAgD6lLAmfkgXdFoNLoFGanCVDaz3V7L9pC
 cd+OnOKNPtLYbjJtxl98qOxPcIS5jt/3s4OOScEZFhBHjTxH9plP9kQZRxgl2x+V6VlW5O4fgFt
 Z8bC11bpNdJ/jCxj12+pSWdiJoWQ9KfUNT4CsXmcDSIsCY04HzG7xDNUE4LRjRMoThXQQPxZNKo
 BmvHYBhiy4TkMOCqw7g==
X-Authority-Analysis: v=2.4 cv=E8tYNqdl c=1 sm=1 tr=0 ts=6ae3b967 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=554yuftmPdPD4gaTNL8A:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA4NCBTYWx0ZWRfX2AS5qqatcUzX
 v/koPuyrYBS5N//sxoEZ1k9KUdcB9k81L0r4uMN1glhgksATV8QWCjnZoZx7zKHlorZN4n9VNhO
 2ol4WLwEOJExr+k32DiyDetq4RAPJDM=
X-Proofpoint-ORIG-GUID: 5Q5YPakhDHKWbPFCy7-8a6YfQpJ85c60
X-Proofpoint-GUID: 5Q5YPakhDHKWbPFCy7-8a6YfQpJ85c60
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610290084

Similar to commit 0e764a01015d ("iommu/arm-smmu: Allow client devices to
select direct mapping") for arm-smmu-qcom, match GPU and display compat
strings to pick identity domain time.

The drm/msm driver attaches it's own domain, which it manages directly,
so we don't want an iommu managed domain interfering.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/iommu/msm_iommu.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/iommu/msm_iommu.c b/drivers/iommu/msm_iommu.c
index 4ef1e8c8244b..1c5011432628 100644
--- a/drivers/iommu/msm_iommu.c
+++ b/drivers/iommu/msm_iommu.c
@@ -12,6 +12,7 @@
 #include <linux/io.h>
 #include <linux/io-pgtable.h>
 #include <linux/interrupt.h>
+#include <linux/of_device.h>
 #include <linux/list.h>
 #include <linux/spinlock.h>
 #include <linux/slab.h>
@@ -691,12 +692,27 @@ irqreturn_t msm_iommu_fault_handler(int irq, void *dev_id)
 	return 0;
 }
 
+static const struct of_device_id msm_iommu_client_of_match[] = {
+	{ .compatible = "qcom,adreno" },
+	{ .compatible = "qcom,mdp4" },
+	{ }
+};
+
+static int msm_iommu_def_domain_type(struct device *dev)
+{
+	const struct of_device_id *match =
+		of_match_device(msm_iommu_client_of_match, dev);
+
+	return match ? IOMMU_DOMAIN_IDENTITY : 0;
+}
+
 static struct iommu_ops msm_iommu_ops = {
 	.identity_domain = &msm_iommu_identity_domain,
 	.domain_alloc_paging = msm_iommu_domain_alloc_paging,
 	.probe_device = msm_iommu_probe_device,
 	.device_group = generic_device_group,
 	.of_xlate = qcom_iommu_of_xlate,
+	.def_domain_type = msm_iommu_def_domain_type,
 	.default_domain_ops = &(const struct iommu_domain_ops) {
 		.attach_dev	= msm_iommu_attach_dev,
 		.map_pages	= msm_iommu_map,
-- 
2.56.0

