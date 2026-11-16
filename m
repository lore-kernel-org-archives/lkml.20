Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794846217;
	b=SwArozSnCfjV5Tp/xXeJ3xxrGCdp1m2ZavKftVZJ23AfPuBGsWLzxK34ekEMYhzveA7m
	 37xm/pNW7Qf33z4niGpv1BC4xc0Sw4CqyeGqZcpgn6kzmENBHOQxQ6/mpFPIGbkt5vZ5N
	 LaOQufMEGtRBixxwByLhQwKEW/P+Q/BFwmPNtm/0AhLphYvAOgjQ3vkgJ07fEVHCEu64C
	 8C+YKTAzmVXNSdMjcQ2JGvxUdAxMV9lwJHUWeKvccms6hVSYA7gaJaQyAhIcDAsrdk0m9
	 mT/C2LgqpMO38zVVoopqZ1+N55w9MO6SdEPRRSY9Bc1XVr0ryOfFmScF/9PA/RhIu+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794846217;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=sFBq9fRHwG6vJeIthGk0I4jMp83as5rl6WW7bRc8g/s=;
	b=Jrg/d9pMhdJWeai4T3Dh0pEdw0O6w23sObb4tzxl+jzEEJxDtbErcyIK3hbvkP7REr6g
	 l7FMxhOZY3E/jIjnX0JWi0sogAC3PWsM7yRv4xPGiWUWmtFcGbFByLE1mM1CsKzKdAxDv
	 LMrBiNucvUpNhNDCR962KIJ6xBzALjM2SGxGKTr0Vun4nE59iHID5SyBiA9gY9/9lOc8d
	 KYD/IQp4LBoBQBqhTcVlFoPIoa3tMdqfNmB2QuE8zVX3eskUS6EB7Yk+9DR+QiUZFQkNi
	 sM3RI8myvc6hfl+4SGMdBT2fUpkS/Av3CZl/lQ2SDdLRkjr1RE9Px45DTmvI3iKOL6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ocs0oWpJ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hF5Xun4r;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C5A1606A888
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 16:23:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C5A1606A888
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ocs0oWpJ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hF5Xun4r
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGGK64E3692958
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 16:23:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=sFBq9fRHwG6
	vJeIthGk0I4jMp83as5rl6WW7bRc8g/s=; b=ocs0oWpJUltcBLfrPCQK8/iel1Z
	hOfj8zFNYEYgxIiVj7PJAF9gv0NO8IleMWhFrQDCZFPVxXrXxAfgWfxVH8/aNE0S
	h9//dADdIwFcXWZAtZkbIX1GPFNwmBIBvlu1T9h3+4/x+ZIr6MkFyiID0Io/ASsG
	hnc2bnMp/pBQJKAl/NbbEFKgXWJh2xptcgYqrWh+lfPbg71OYI+jHeoXHTY5EmaB
	slPM5ZhM/p+gyxRHxn5rzaj2yk8tGU3EERnLNX6QMMt0PvygOSAZrLYHhd1DtsHs
	KPiMNP0BcPZlbD1ODJrOg1niU4pAZXv/dWyAw96pUMUNmJcBZvRJ2Ec/o7Q==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j01f810fm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 16:23:35 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1af203073e0so3226741c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 08:23:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794846215; x=1795451015; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sFBq9fRHwG6vJeIthGk0I4jMp83as5rl6WW7bRc8g/s=;
        b=hF5Xun4roGT32JNeDjvG8uT1xx/v5T+TKrD/bfjHKF8uULwWWjeXtZOtZKs4Xl/NH0
         0bXeSbe+M4WbQv8LQCSWKrZiOTzP0RqMbXMC3CS7hjn86/vFLEPKs5kHHdkW/nV2llxh
         jAasu9P14vxIASCIQiJ98CrrbH94RMeSCt/ePHSeVGmzQkpIgZaJWsl+0u2xwO/i/bqR
         KMaFRzMvFGpLtol0domelt0BputIax6VFGpXaWsGh1J1n7vTUUL4RcarSPfoqDFE4zp/
         sVyCE1Uqa/JuWSnpyW7IwrzOLvydRpeABB9pFQIi6AviCHjqmC3Jyml11yzhvSMAp9MT
         2MYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794846215; x=1795451015;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sFBq9fRHwG6vJeIthGk0I4jMp83as5rl6WW7bRc8g/s=;
        b=2vLzCT5O6EGJO0c+iUhvei3YSauUEbvvyPD/Q4HgrDXlUzhft+yoxMkg5Y44Z4L1t0
         SB5jqC4NMPCLQWNBP/FW3z1SQHA8w+NwsF8KeThbcSGMk9IrVk0Po8tbwFo3IQNO2RW0
         UUDjC0wJ+27YaKaL44LkXvJmFIL8DPZll7KVdnVfilPcuMKWSVNiYYbjLiivW92+Vu/5
         rIUw0E33OZKHNWpzNNuTNaFGES9l3tD7eDcxeymeqPPZ+0G0plshKJmkruHMwoglT1GH
         CgqjPRAHwNEaAHBPa6cGbIHu16Qoq3O5KUNIIaAi+KCq0VOo3mPboSZ9jg9u5ZvwnbQs
         AJ5w==
X-Forwarded-Encrypted: i=1; AL+hErGRki3+3+upwHyIXvtQagWjhr7Hf1uxQysPwi2VjB3Sk7OMXW3J83VOBWMXSWPZIozun09wePyQBiuDRbE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8tgPJyGVMClkwRXjYb6idO9KbOaNdAmfGiKR2fSBrp3WKgMKVG
	PvfkIoH+VYHSv/ERVI0EzqAKaP7ny7syd5fCYOMx7WsIYjIwdq6TVt8abps/tGsd6ZfhCrXgjey
	aKG387XMw//HZQ+5aNtFp36+W4X9ievUKiWmsBSZyNzXd0rvWdUvrDOcqU82gd/Rnmuo=
X-Gm-Gg: AYBFou2GOpHlH10OvX9fgU3wJYxfG5Ee30ZA8uS8YbN5Lqe+iaawShhquBfEcDKErB1
	0su6x82b7wH7Zn1yVWaxlEOlAqt29lSVz8wG/a42vTcAPP1lit6/0BJXvRFSsO0fPKgsStwjwQn
	Z1Z2BHx6FyR1Q/aNLQAx2aifhg34rI/R1IyqwG423CT7y5NDboHGGyCj5yCH/GTSlB2pzeYdNc0
	WReVlaxtrsX4bBbPXfMmePFH37XOTmOHH33OxUZ1I1R3WXuUNelE5eSdLUtWUVAijYgUWk3pB2Q
	3/KuRa3AkDEz04Wy3SVM3rs7vNre/hpm+iJODa9pTJUdouQ09/vyeW3jHCiFiKIkic4x/feVc3Q
	53yuNxgC0MjwQTYFWZSsm1S7ItagQ5W5khrin41PCmGYnQDIfkjKwUmguXpB1XNnxZuTKndQkdL
	Ox
X-Received: by 2002:a05:701b:4354:b0:1b2:40be:a929 with SMTP id a92af1059eb24-1b5030eb071mr10929076c88.14.1794846214646;
        Mon, 16 Nov 2026 08:23:34 -0800 (PST)
X-Received: by 2002:a05:701b:4354:b0:1b2:40be:a929 with SMTP id a92af1059eb24-1b5030eb071mr10929018c88.14.1794846213999;
        Mon, 16 Nov 2026 08:23:33 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031468b7sm38623826c88.5.2026.11.16.08.23.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 08:23:33 -0800 (PST)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>, David Airlie <airlied@gmail.com>,
        Simona Vetter <simona@ffwll.ch>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        "Bryan O'Donoghue" <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Alex Elder <elder@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Sean Paul <sean@poorly.run>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v3 9/9] firmware: qcom: pas: remove qcom_pas_auth_and_reset()
Date: Mon, 16 Nov 2026 21:51:48 +0530
Message-ID: <20261116162148.2864501-10-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261116162148.2864501-1-mukesh.ojha@oss.qualcomm.com>
References: <20261116162148.2864501-1-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA2NCBTYWx0ZWRfXxPS9gsTw2Ydu
 WmEhKTxb4oVhZ2iXNbuHa2MKfwxtrpeeHscwS4ARMm2JvvfPDIOKz+Kj44cJOyn1wvTe8qU2bs0
 zQmGdkTMGntlyFISpFTCQdyNG4hGC7Fzd/RRgDO03u0m2O/YTUAoBvAIFngLy1b+8KPdx2jAlKk
 FHCw3yqaL4SxDhYghNNK39ctJFkLj/XJF/LeVmThGWcpNi7uJIJKMYwSvStOO3+eCyT1f9Dd+vF
 9k3AdO6nJ/wTfXRqhbzlDpnEfZ+trDsOcoWJk2PtW3hS+byvIkH7VWhYjSY8jW81P0qaJ3elOcB
 IRIZW6ZEKwxTghYmtkGh9W5qkzIoHr96Dl45jj4MUT5MfmtL5+f4Dy3emIkDBtCC/DYxMRWAWGT
 IDqTHYBugJAJgHEd1y2x+j4qmclM2HCXVzkD9h8/fK3Sh5MZfxynmqbp+JG+dkI4zLayw/NaAwD
 Fypa0ehBR4dGUEQrdJA==
X-Proofpoint-GUID: _FgJWvrkPjk0wvYTLx71fFgpyl6-ybWp
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA2NCBTYWx0ZWRfX0DG/rsIWVaPI
 Ey7wIwjpoI9vJJdy4AtWxzxvUmVKgWDD4/sBbTFJpT0GGJvZfPKNjwMqhoGfBp14tJd4iljMbZs
 Yc0CDdgipAIwcMb0oKRKd+5BTd/ao4g=
X-Proofpoint-ORIG-GUID: _FgJWvrkPjk0wvYTLx71fFgpyl6-ybWp
X-Authority-Analysis: v=2.4 cv=VMpIDNPX c=1 sm=1 tr=0 ts=6afb2e08 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=sV0Ut8U-cAKt8JUqj3YA:9 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_05,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0
 spamscore=0 adultscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160064

All callers have been migrated to qcom_pas_prepare_and_auth_reset(),
which additionally sets up a shmbridge over firmware memory before
TrustZone authentication.  Remove the bare pas_id-only wrapper, its
EXPORT_SYMBOL_GPL, the header declaration, the auth_and_reset ops slot
from struct qcom_pas_ops and both backend implementations.

The internal helper functions (__qcom_scm_pas_auth_and_reset,
__qcom_pas_tee_auth_and_reset) remain as they are called directly by
their respective prepare_and_auth_reset implementations.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_pas.c       | 16 ----------------
 drivers/firmware/qcom/qcom_pas.h       |  3 ---
 drivers/firmware/qcom/qcom_pas_tee.c   |  6 ------
 drivers/firmware/qcom/qcom_scm.c       |  7 +++----
 include/linux/firmware/qcom/qcom_pas.h |  1 -
 5 files changed, 3 insertions(+), 30 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_pas.c b/drivers/firmware/qcom/qcom_pas.c
index fdf62003fbf1..08bf3a8d3bf6 100644
--- a/drivers/firmware/qcom/qcom_pas.c
+++ b/drivers/firmware/qcom/qcom_pas.c
@@ -184,22 +184,6 @@ struct resource_table *qcom_pas_get_rsc_table(struct qcom_pas_context *ctx,
 }
 EXPORT_SYMBOL_GPL(qcom_pas_get_rsc_table);
 
-/**
- * qcom_pas_auth_and_reset() - Authenticate the given peripheral firmware
- *			       and reset the remote processor
- * @pas_id:	peripheral authentication service id
- *
- * Return: 0 on success.
- */
-int qcom_pas_auth_and_reset(u32 pas_id)
-{
-	if (!ops_ptr)
-		return -ENODEV;
-
-	return ops_ptr->auth_and_reset(ops_ptr->dev, pas_id);
-}
-EXPORT_SYMBOL_GPL(qcom_pas_auth_and_reset);
-
 /**
  * qcom_pas_prepare_and_auth_reset() - Prepare, authenticate, and reset the
  *				       remote processor
diff --git a/drivers/firmware/qcom/qcom_pas.h b/drivers/firmware/qcom/qcom_pas.h
index 8643e2760602..a296be2be8c0 100644
--- a/drivers/firmware/qcom/qcom_pas.h
+++ b/drivers/firmware/qcom/qcom_pas.h
@@ -18,8 +18,6 @@ struct device;
  * @get_rsc_table:		Peripheral get resource table callback.
  * @prepare_and_auth_reset:	Peripheral prepare firmware authentication and
  *				reset callback.
- * @auth_and_reset:		Peripheral firmware authentication and reset
- *				callback.
  * @set_remote_state:		Peripheral set remote state callback.
  * @shutdown:			Peripheral shutdown callback.
  * @metadata_release:		Image metadata release callback.
@@ -37,7 +35,6 @@ struct qcom_pas_ops {
 			       size_t *output_rt_size);
 	int (*prepare_and_auth_reset)(struct device *dev,
 				      struct qcom_pas_context *ctx);
-	int (*auth_and_reset)(struct device *dev, u32 pas_id);
 	int (*set_remote_state)(struct device *dev, u32 state, u32 pas_id);
 	int (*shutdown)(struct device *dev, u32 pas_id);
 	void (*metadata_release)(struct device *dev,
diff --git a/drivers/firmware/qcom/qcom_pas_tee.c b/drivers/firmware/qcom/qcom_pas_tee.c
index 1fca2712d791..525b8a02ae82 100644
--- a/drivers/firmware/qcom/qcom_pas_tee.c
+++ b/drivers/firmware/qcom/qcom_pas_tee.c
@@ -331,11 +331,6 @@ static int __qcom_pas_tee_auth_and_reset(struct device *dev, u32 pas_id,
 	return ret;
 }
 
-static int qcom_pas_tee_auth_and_reset(struct device *dev, u32 pas_id)
-{
-	return __qcom_pas_tee_auth_and_reset(dev, pas_id, 0, 0);
-}
-
 static int qcom_pas_tee_prepare_and_auth_reset(struct device *dev,
 					       struct qcom_pas_context *ctx)
 {
@@ -412,7 +407,6 @@ static struct qcom_pas_ops qcom_pas_ops_tee = {
 	.init_image		= qcom_pas_tee_init_image,
 	.mem_setup		= qcom_pas_tee_mem_setup,
 	.get_rsc_table		= qcom_pas_tee_get_rsc_table,
-	.auth_and_reset		= qcom_pas_tee_auth_and_reset,
 	.prepare_and_auth_reset	= qcom_pas_tee_prepare_and_auth_reset,
 	.set_remote_state	= qcom_pas_tee_set_remote_state,
 	.shutdown		= qcom_pas_tee_shutdown,
diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 030e4ba90812..b0f96e751167 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -855,7 +855,7 @@ static void *qcom_scm_pas_get_rsc_table(struct device *dev,
 	return ret ? ERR_PTR(ret) : tbl_ptr;
 }
 
-static int qcom_scm_pas_auth_and_reset(struct device *dev, u32 pas_id)
+static int __qcom_scm_pas_auth_and_reset(struct device *dev, u32 pas_id)
 {
 	int ret;
 	struct qcom_scm_desc desc = {
@@ -896,7 +896,7 @@ static int qcom_scm_pas_prepare_and_auth_reset(struct device *dev,
 	 * memory region and then invokes a call to TrustZone to authenticate.
 	 */
 	if (!ctx->use_tzmem)
-		return qcom_scm_pas_auth_and_reset(dev, ctx->pas_id);
+		return __qcom_scm_pas_auth_and_reset(dev, ctx->pas_id);
 
 	/*
 	 * When Linux runs @ EL2 Linux must create the shmbridge itself and then
@@ -906,7 +906,7 @@ static int qcom_scm_pas_prepare_and_auth_reset(struct device *dev,
 	if (ret)
 		return ret;
 
-	ret = qcom_scm_pas_auth_and_reset(dev, ctx->pas_id);
+	ret = __qcom_scm_pas_auth_and_reset(dev, ctx->pas_id);
 	qcom_tzmem_shm_bridge_delete(handle);
 
 	return ret;
@@ -987,7 +987,6 @@ static struct qcom_pas_ops qcom_pas_ops_scm = {
 	.init_image		= qcom_scm_pas_init_image,
 	.mem_setup		= qcom_scm_pas_mem_setup,
 	.get_rsc_table		= qcom_scm_pas_get_rsc_table,
-	.auth_and_reset		= qcom_scm_pas_auth_and_reset,
 	.prepare_and_auth_reset	= qcom_scm_pas_prepare_and_auth_reset,
 	.set_remote_state	= qcom_scm_pas_set_remote_state,
 	.shutdown		= qcom_scm_pas_shutdown,
diff --git a/include/linux/firmware/qcom/qcom_pas.h b/include/linux/firmware/qcom/qcom_pas.h
index 458075868bf5..53b8d9631f22 100644
--- a/include/linux/firmware/qcom/qcom_pas.h
+++ b/include/linux/firmware/qcom/qcom_pas.h
@@ -48,7 +48,6 @@ struct resource_table *qcom_pas_get_rsc_table(struct qcom_pas_context *ctx,
 					      void *input_rt, size_t input_rt_size,
 					      size_t *output_rt_size);
 int qcom_pas_mem_setup(u32 pas_id, phys_addr_t addr, phys_addr_t size);
-int qcom_pas_auth_and_reset(u32 pas_id);
 int qcom_pas_prepare_and_auth_reset(struct qcom_pas_context *ctx);
 int qcom_pas_set_remote_state(u32 state, u32 pas_id);
 int qcom_pas_shutdown(u32 pas_id);
-- 
2.55.0

