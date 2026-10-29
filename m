Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793243536;
	b=w4dXgMJA+G8PoPAo/p3lywm1pSR1zha9r1uoY7TNK2mg/A01eP+N/Ba6eLk+tY29Gn58
	 mqN5H02uQHrSn6oN62q7L4xYgEhr4Q6JuX18D9L3Vwkt/knWe8Z/xIZhIdrvlQ4gONBtP
	 BInb9hviU6nRPBHEjz5M9Q7j7m7uFJvxEl5AzF2tMEljffVrBzmB4YGdMbMoSMMk+az13
	 lWX8CYLwBGCu7A5LLb395yHPhrfLe5pi+S/cfVThGwtIhSH33TGoOWR3BkIQVnZ4Yx1bD
	 tLBoSEbG4PQ/Bue8LlBsFP8+Xyl3HbJ/fM9lz4o8n7Z2vGnAx5ufuxX+qdYYL6lAd6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793243536;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=sWFtIw7fBe+RZbcQ8738GTs4fQ/rDgZ8HgatAU488Zk=;
	b=EeCvPVa7LCx36QuHKdH1Qb8eY1IffoqZlJHxcRAS7MY7NsV/VzCmAX3AAIjoXJlhXwmX
	 tGZvdn8apH8cmtwMNH6MD9qGRCycvnBCiETsXPdKmkItVQwgQ9KG5xsJ+0goyDu/LD/I1
	 y8YeSoyPYEsI3yJZWF9WeWTMcKdwNMkK1j7uZ691hg815f8OdoL5zOW5gBHE6xWhApo5h
	 6WCJ8zHgkhvFksGbJZF8aEpXA+nmws5N0jrLPFFZUKa+6gxfQUrNTM1sKH/Emyrjl8KnA
	 n0IHZiyzkxIQoj2h1410dnWp+SNsTB70t64iKHULZpXU48qDJ9OdpmTk4oFAAWbZ1Jw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cdGaSOVy;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZD6KLixm;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7048A606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 03:12:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7048A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cdGaSOVy;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZD6KLixm
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T1jdbH3920258
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 03:12:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=sWFtIw7fBe+RZbcQ8738GT
	s4fQ/rDgZ8HgatAU488Zk=; b=cdGaSOVy6dXszkHtSR+9sOCOqFzz5UcJU4jgJq
	rQrs04VP76FahjdJ5r65DHif0IWcU7rcqwcFHZK/4Yvht1INl1/06PPEgKDpXn2R
	fbGh1OjbQEGHcX/jrV7W9Pcl+z39tK4buBKDQHtso85TIMoxBG7wSHdjkNuDwhZZ
	cXPHcWsBttD/MZntdIZ1IhmpKVhNYfThtKtkrM6sPXR/kjcGjwUVILL/j4pTSF/f
	HxOL2CW8Li505LPaNYR6hGd7peNnYdUP9R3pMICw3LeFjCGa6wOYCSaxIbPkrASZ
	ZGOpX8MIENmt8gAseoTg3CPQkDhb5CBsMod6xnJyIYI2iRJg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkkehtn0t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 03:12:15 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36a1e2485fdso3584241eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 20:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793243535; x=1793848335; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sWFtIw7fBe+RZbcQ8738GTs4fQ/rDgZ8HgatAU488Zk=;
        b=ZD6KLixmKrwhjYQ8RcKxoFmhsqMQY7pypv3IpaoKNQ1dY3e9yJTT5xVBLQBRh3GKXZ
         jhLK2uK9skSvma4Aoo7jStsvTGBg/b0kpJLS9w0OTtYhs8YsE4XpEODJI3GmmIfhlrzd
         PnZ6o3YvDj+Oz/LeAswEaYx4cfsvs4GPAVmgX671J9hH1pmEJafZ6QtbsifSZqAWcgvX
         cn83GV7NOryhiovA0GGRYNSBAUGPJvXw7lWOYCiM2KP02SSVw3vCexniUxJ0fP+0IzLR
         /G3yrU2O84MF3QTDnrhOyTxtJsfOyVigAsqGoZNsTtoPV/o/vm/+wavnlsEGAuxBX2X1
         nOTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793243535; x=1793848335;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=sWFtIw7fBe+RZbcQ8738GTs4fQ/rDgZ8HgatAU488Zk=;
        b=BdiBd7XIqPQvGSwEHHOBVAqsz09tzkQRsjvsu8K3VcXSBGPHXYpt0+RfyQBGs65hL2
         8oBWC2nXPPajaH7azSUPgNIZem6p/rxGEKM2IjI9+TpIRAqLT+J0CtUtafgPQMvqyuZo
         AAOLVxMKbgtk/Uyi32aCsFSUxXmqU+10tmroo9SglJuZh6uMY0sjdS1TbtFv7N+snSxp
         +q6xm0SiYWt0Qw+1xIPeSEdwVg9qtdRnya8JAJdswOJbU4i5HEDmvItZSy4umbKeIxSl
         n4xkxy7ax+ZBW4lgcdfLaAsD0/znNS3P1/A38sIF0FzJoPyZXH+1WVwuaJV83Gzx51v4
         5IDw==
X-Forwarded-Encrypted: i=1; AKwUvBwdHKFUeGvVJWUUPNBlCzi2FbiKc+JRw+W77OpWeV6HRfgcwTW+xCHj5EbO6SYPWBxhtqUE3W7TddOWIk4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJYC7seuoraB/RMBeCU1QkYsZ1q7cTfGsk0Cjvh4agSX1a6uIhw
	JfqBwlvTE8qsUi2scD1AWqORUWwYq5I8l2TFScn7Qk96UPTee78txFeP9+Cdz9q91mldNBVZIr2
	cstCrRE4gD+ShFN7WhTZTXbaKyYFqygocX7BRTCyzSjl1bF/Xhh0m0dVy/3+CaWGo9GQCCUzbUK
	Uqvg==
X-Gm-Gg: AYBFou2xeLqC6e/Za2QSLjAQT1OH8Szq/WcAZy5LdzPh6+a4y3rwWGEyytk5r7yiTDZ
	QV11qTSA6hPKPs8VT3FQQ73wh4l098hpbczKIet43BDI/eDkbz1yBiFxq6EMXiOEvlcZZ8X4h/b
	XtZqH/5Il2RiDXSRwHRiwz6H+Y8h1w/PuOm8e2N37CKNlbnRCwRk1Pt34PNZjpmZi50NU3NUqST
	Ko0iDOV2GcBpO8+rgSkJhfSkftLvfQvBagtzlXXK09Uw+P6szkFLWCmC/gp/L4qpfItDcsOdf7z
	8GNAoM8HqBezUYBVfkhSbZzf5TfVvWwacN9QbssuK0UVac6vB1j3YYYZw2hGk/XpKfq+vMgANlB
	zWF1O74fQJDBr8Rb1vm3zAYhOXUFxBI8WH0mTrw+/yOPFq1p/fPfRhmLw/aX2atRE0IpDzYyqs7
	WIMaYLtwFOSFSocjSd/dHB6NHnjM0rEZfs0g9T+MTDqz4t8oiB
X-Received: by 2002:a05:7301:1708:b0:369:987f:d15e with SMTP id 5a478bee46e88-36a202871c0mr5670441eec.2.1793243534885;
        Wed, 28 Oct 2026 20:12:14 -0700 (PDT)
X-Received: by 2002:a05:7301:1708:b0:369:987f:d15e with SMTP id 5a478bee46e88-36a202871c0mr5670395eec.2.1793243534156;
        Wed, 28 Oct 2026 20:12:14 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a237bc445sm11151663eec.1.2026.10.28.20.12.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 20:12:13 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 11:12:00 +0800
Subject: [PATCH] media: iris: fix ltr count rc_type validity check in gen2
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
Message-Id: <20261029-gen2_ltr_fix-v1-1-6d5518d59b9c@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAH+54moC/yWMQQqDMBAAvyJ7biAmYXX9ShHZxK0NVG0TWwri3
 xvqcQZmdsiSomToqh2SfGKO61KgvlQQ7rxMouJYGIw2WGtDapLFDI8tDbf4VZrJ123wQi5ASZ5
 Jiv7vrv3JSV7vct1OCZ6zqLDOc9y6CkdN1rLQ6BAbxyiMlttGSIi9E0SDjQ4E/XH8AG9ruuGqA
 AAA
X-Change-ID: 20261029-gen2_ltr_fix-0a9b18cbe94c
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793243530; l=1372;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=og9/D7Lg6daQXDnJX52+VnaCLJ7uMVtaNZMFwQjQ3Ms=;
 b=RLUyu67R8d4oSa4LR8iwPBWBXDLdJVhpCfkcnWGCWnAiJcJoXS36bAhBnU3cdM6llZSM67TfO
 VT0FZu0rj30DsTWREGhkXqXihVNaZISOOqoEKgN4o69PqeO6ja8wgKp
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-ORIG-GUID: BcdAfVCw555WqfHd7w5iKSDLi28scXsX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAxMSBTYWx0ZWRfXzbWjmIUxlnam
 ots9+WFTV+8QfWXnjfp3zt+rT1CPJEBRPmUj/yTIC76mohfSh+L9YbEiGfzu5djcuFqGyBIEc3Y
 U2Kp89FmLy/3+r78tvdkeQzq2ODEO9MQ5+/Cg5l3b3aqo5UTG88kHa6xSbTd4GueKPpoIE4NYB4
 ltNUVoziA2iznvRYDJUAFFuK9LB2I105D1GW2E0xDOLMaxdG2a37eUctXD8/j5zD9E8tPXaAVen
 g0nUEopHEOqoBTaA4o0Fb+6rrEgrFqgtUnY8UVPeXxhUhjHepqOtCxRsat/qND8FPlEV7Zu1eWu
 KLh7QzbNL2CNwjA3KP+P/84CaZ0PkyY7O499Iu8+n5svF2vqFB2nomvapR3EAi37eOCWPvhcA7B
 E8YhqliNC74YFsV17u9r1VyPDu3QQ/yW0Y7MEEedUn344KsTMTbQdig6bn/ZIgJ4wtB6+i4RVQj
 tOpnCDMfuMKOxmqDcnQ==
X-Proofpoint-GUID: BcdAfVCw555WqfHd7w5iKSDLi28scXsX
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAxMSBTYWx0ZWRfX8XsJyOVrq7ws
 JMwrLDF4QFWBM6mV1PN0mam2vcVjayfPVwb4fozSKJn1dhG74a648Lpc7Hsm13pPAhHrSM4A12P
 QAyB5pBX/x/aJKQorctq3lPwx1iYn/4=
X-Authority-Analysis: v=2.4 cv=bYv+w+PB c=1 sm=1 tr=0 ts=6ae2b98f cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=ddizOsny5C6_3mqkn2UA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290011

The condition was inverted: CBR_VFR, CBR_CFR and RC_OFF are the valid
rc_types for LTR, so reject anything that does NOT match these types.

Fixes: 6870381285b8 ("media: qcom: iris: Add Long-Term Reference support for encoder")
Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_ctrls.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index 4f2633bbb49f81f080ffbe91569d38e954ad15a1..2fd5cec16faebeabe69b836679db8cdbf89b4fac 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -1279,9 +1279,9 @@ int iris_set_ltr_count_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_ty
 	if (!ltr_count)
 		return -EINVAL;
 
-	if (inst->hfi_rc_type == HFI_RC_CBR_VFR ||
-	    inst->hfi_rc_type == HFI_RC_CBR_CFR ||
-	    inst->hfi_rc_type == HFI_RC_OFF) {
+	if (inst->hfi_rc_type != HFI_RC_CBR_VFR &&
+	    inst->hfi_rc_type != HFI_RC_CBR_CFR &&
+	    inst->hfi_rc_type != HFI_RC_OFF) {
 		inst->fw_caps[LTR_COUNT].value = 0;
 		return -EINVAL;
 	}

---
base-commit: 6d0933ae9d46674a6ea63a87e9e9ab4e662670c9
change-id: 20261029-gen2_ltr_fix-0a9b18cbe94c

Best regards,
-- 
Wangao Wang <wangao.wang@oss.qualcomm.com>

