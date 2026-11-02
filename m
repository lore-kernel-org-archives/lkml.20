Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793635810;
	b=w1/hscp9lVXuWjA5O01GLiCjFiE8ik0E9RCVbUdW6vWb4+10RxIGbMRO7kJ+8EKvYHkA
	 GJfLtnopC5xwTtFFIvr7cCMI/DSPq328mqgulKFAug8meirnZTzhHsk7RL1U4mQoTyBGf
	 i4sboBsba8pWfk/e7A9Nzwminn1uZ9/hVzW4FkYbyph19eiqrDr8astHhUc56+4n2J5iM
	 V7QMS4UqnGalG1PBritVyCn9H/IQpcGffWP4bgMCn/WnOtX8XgEdGhhHZhJSuBiM76QoG
	 0WPmW5Rn9uLP+GzcHkfvvEDJKv8B4Zr8C6ozdcmxFkkwJjktzU8/5ZBCpdq3svdIKIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793635810;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=sAmuNonNdGJ9VJvNEnnfZOa2K2a3VEiqk//+WGZEfFM=;
	b=dhnNgir06Y9jV6OA+GxfDQTMBxvILvqHWUXcxnZItXO2IHEMFa9d5enwGeifyLk5qKQx
	 quu1v4QLsklRhGWwsGC2tG+0gQza+r6cF+qR0Mv1vlkvNz4foeVW3xumcQvBdSssMWp5Q
	 ZRgkj/qE3e3eZVdl7J/+PfqhgaRyOTERNVxk1EAWXMIsnYK31aYrY4yufTtzdYmr7WzZr
	 kc/VYg706JT7UHfFa2tppxl9k8vhS083eElU2kZ1szoVEPESKxFaig6/fmciHFp8jovHc
	 d0yzfnprLNjjxRN60xzVsBYI7ecXPwydVN9uQINIqQX8CMszzQTFzvEEQzkB/u+kqrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pI5uQ4ai;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NWholbAr;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42A6A6080582
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 16:10:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42A6A6080582
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pI5uQ4ai;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NWholbAr
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DpJ9f4070437
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 16:10:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=sAmuNonNdGJ
	9VJvNEnnfZOa2K2a3VEiqk//+WGZEfFM=; b=pI5uQ4aidauBV1Z5mj4D6J0tDJe
	ECsUWDqSY7Wgr4bvScLMnib4icwyWQfQXnpfpF5KaJoU9tIYP0OfUeKGuaztqCXE
	4/85Kl6vxCXhQGaTJku8DIwCKLOLiIsLK3bFfpQHSTfeHd3NqRfzuwme9GjUHJ6b
	+SxB+l0US6tdi6jGSgu6zwevolxiJcPqkeEgLUtCjWYL+qtsiVgG1ootUFkBjNGE
	GOwbTkQojoj3BxTXOLMiZgem32gn7QcMsTiB/jlDizjZ0g9fyzuZJ23QPq5s5Dy2
	xDZsR80TaSOCx5hh+aXH8u2404KQi4w/XkwyISdLRuEzd7jNktNXuRfWuVQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpss5h7dm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 16:10:08 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e9995cea88so32778465ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 08:10:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793635808; x=1794240608; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sAmuNonNdGJ9VJvNEnnfZOa2K2a3VEiqk//+WGZEfFM=;
        b=NWholbAr/we4My/D1fCGMrI4HlWg6Vfoff/+OWStrgOn7/9/0BQGoq7dJTnjocjRhv
         X3tP712I6MU7ArekPg/AwMWZCEINHDeTB1DGfEMLda0fPacdkPfm/NM6w0uxDo2B0N7/
         MRw7hzLLonz4jrZTazPkx8alIFtsGAPh33eJ4EZ2P2nufWO/EHHfaAzzBcVE4tWjYOmJ
         VVApYWL0iAZavD19AcDyeEv6RbixMD83sdgpWjLOZQy8i9Qwd05y+BneaPqbqjvoTsro
         mAWwJd53xgy2CTlk5lD8dSJKyeIGc2JlWDPTB2j+NKuuWey+U6ezZHvu0T6kPOx15/Cy
         SWgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793635808; x=1794240608;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sAmuNonNdGJ9VJvNEnnfZOa2K2a3VEiqk//+WGZEfFM=;
        b=JSXxpeFjsaGSJV9WRCpTm2FdsFwZpvj6SDM36RQsqCcR4G10ZVeTjnYS0g0iVjsvlq
         SapNE9p9F9tJexwDrdNmksR3hctdCXfMkQg2IaLkvbsu8nBLW1iervHx7/puR6IB3LdF
         k0yoGy3NwbGY4Be2M9latkL17vmc64QLRWcDqhRSLGG/JOrLY+ospFQKasPATUiFE3/8
         cKpGGdmhaQ+GTTuLSFyy5PoYwLMd/BgH1MvroLxFWSMlv7CJOfFYZYpkH368l19TWUf4
         DPEV6dpp+jB3ymUOSd7CIdrTP/fGN92nlBEw3S5ynpIiZ7G0/gQpRDnDWBsFsHM/Rtu4
         IgKg==
X-Forwarded-Encrypted: i=1; AKwUvBw6v1R7hYtb9upnwUlBySLkk+7Zi5xiuox8aKPDORBczHiClow7NFXUzn2FpToLA0WE+8yjWOJlO6J54xU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLYtT+SqM47uqtOuC42AUd984UHGGK7r4UFw0iW+y5fLlgOHQ6P
	fOjHpnaui8z9Kv2J9vsDc5n9/xWddHr1xPisa9qkeTH15Cevhu7EVFbD8L7B8L/XDUgQ9W1GKH+
	HWdpnFIIZ5bAJ0DNkYoC6oP2/sow/i5IcOTVAWqoVe7aI0WPTFLlx0fZtmlGMasrylu97m59RP7
	aRyg==
X-Gm-Gg: AYBFou1caRTAdHaGSSRYczAucEgA9DWhqSP3qt+r72MNuTWGoRJ9j10sPKLeVZuzix3
	kIorZ0DapNBwi4HP3neFa/f5L0jviBLMt+RIiGDx/TZnNwvR+KLHmdbFVOewQXAoz1i9pIW6mXH
	X/fFbMkW9soEdmrTgRod7sicFnNA0q78JKywqjCxvZkuQoEpYSI05g//kDWLUyZfPOZzCCN2hwA
	mAILyvWIxIcCBUkuPN/OeMU3FkJp1C7SzQ1QJg9TBROsL9SeeBqVU40iChMiCNc0TfwCaUp/k72
	vrpth78IrZD7JuTAdNLRZJiU8WHLKIpUTr4jrR/TgHK1RZ/gevNMJ7dA2g8zD4rixVyfnLCu7PM
	x5qO4oAihEq0Zjxvb36Y7a4jkKtaJX3P3GkG18PKOXNfWaxhUZAkMvsWBe1+B6CQnojzNEnswo4
	qL0Aat+p4Mgo2SoGRqSNSyOYI=
X-Received: by 2002:a05:6a21:3b46:b0:3e0:d5c0:74b3 with SMTP id adf61e73a8af0-3e928e3722fmr7511699637.65.1793635807965;
        Mon, 02 Nov 2026 08:10:07 -0800 (PST)
X-Received: by 2002:a05:6a21:3b46:b0:3e0:d5c0:74b3 with SMTP id adf61e73a8af0-3e928e3722fmr7511686637.65.1793635807545;
        Mon, 02 Nov 2026 08:10:07 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8aada9aa605sm2219688b3a.47.2026.11.02.08.10.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 08:10:07 -0800 (PST)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 1/3] drm/msm/gem: Fix VM_BIND range check
Date: Mon,  2 Nov 2026 08:09:59 -0800
Message-ID: <20261102161002.497152-2-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261102161002.497152-1-robin.clark@oss.qualcomm.com>
References: <20261102161002.497152-1-robin.clark@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=VORIDNPX c=1 sm=1 tr=0 ts=6ae8b5e0 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=BFYDg4fWK-pXFiMG0zkA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: gvSlvNCWRuEEFdSiRumm6d9sDWcNGRV2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA2NCBTYWx0ZWRfXxTUF+8IIzoaW
 J7kOCGBuI7lDLdLte04PKSASZilKcr6OxjrtQHV4UgrSTnpT5lgdKm9SRRacotsgO76Wlka5u8E
 y/Ipa6oHrrOgYEbzZYqGUKt46sVBU/JEWAws0iqtX43KtLsSkT7fh0ajcqZKZwR0Zn79avCVAvO
 jOURKDdIassdyupO0h4Mi7ha5KX0XjpiFOuXpHid1pfvRYQunQCYe6JHw1OMVzTwJ+2oWnwYbAL
 lafgzlwplFzWkfs2k+9F7eNVcHMGIWl3O3JsgApzji3uJLb3Z3c7/Zvz9xuZ+mwbxTFDVcVvnGN
 P+8DY1ZJ5klK8rHoQBotgBKBc9OLpLaBSiD5A7ur0fA5IYA1dc/SOaM05LXrZ+x4bsTs2S20F4k
 V847IZmQCplR26Fngs1UQVO4M+0+lvbWPE9tc8VfEVJdQajFFnKdoN731zqGt5yr8chuQzWxlRF
 HFA/UOuWbyYZrU4icDA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA2NCBTYWx0ZWRfX3OmLINU5p5Pp
 q+mRNi8JPnAa+L9V2is8IQ5fe3nyb65hPfcuJoC1zkp3WQWuKJ79FL8b3S7jH5zEM6oJpLD+1/L
 59YSUJlWyElyUut1a+4woP5xC0N/vu0=
X-Proofpoint-GUID: gvSlvNCWRuEEFdSiRumm6d9sDWcNGRV2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020064

Use size_add() to guard against overflow.

Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Fixes: 3a3bef68a6c1 ("drm/msm: Fix missing VM_BIND offset/range validation")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem_vma.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index f687a629629d..922285537dee 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -1012,10 +1012,10 @@ lookup_op(struct msm_vm_bind_job *job, const struct drm_msm_vm_bind_op *op)
 	if (invalid_alignment(op->iova))
 		ret = UERR(EINVAL, dev, "invalid address: %016llx\n", op->iova);
 
-	if (invalid_alignment(op->obj_offset))
+	if (invalid_alignment(op->obj_offset) || (op->obj_offset > SIZE_MAX))
 		ret = UERR(EINVAL, dev, "invalid bo_offset: %016llx\n", op->obj_offset);
 
-	if (invalid_alignment(op->range))
+	if (invalid_alignment(op->range) || (op->range > SIZE_MAX))
 		ret = UERR(EINVAL, dev, "invalid range: %016llx\n", op->range);
 
 	if (!drm_gpuvm_range_valid(job->vm, op->iova, op->range))
@@ -1118,7 +1118,7 @@ vm_bind_job_lookup_ops(struct msm_vm_bind_job *job, struct drm_msm_vm_bind *args
 		op->obj = obj;
 		cnt++;
 
-		if ((op->range + op->obj_offset) > obj->size) {
+		if (size_add(op->range, op->obj_offset) > obj->size) {
 			ret = UERR(EINVAL, dev, "invalid range: %016llx + %016llx > %016zx\n",
 				   op->range, op->obj_offset, obj->size);
 			goto out_unlock;
-- 
2.56.0

