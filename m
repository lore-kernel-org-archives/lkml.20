Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792797959;
	b=McM1T3kUoxuEIIwM0HpKGUEcAsXqRRmzzibyi5oi/JGQ41thCkGrp880qVMQqz70HcA4
	 V9qRhYhg9XT3egF1POKhoVT1sH62BiYK4S7fdf2Y1+uMTsf5AHk/yRgIT1ERJUqIUsbEf
	 ZnAA8/WPewEdApH9zZHyqQVg6NVhtZu3DY4DFBT2xrm60YXFfHfUVgKUvHKSkTiadDaCR
	 zT/CFJEM6eax8W4q08lve/juYg7ZLCE5j7ipn9UeM7LvHrkWD6PhF6JNmrP7XTrH5+0JL
	 4YmfqZhrnhR6G69ZeO6FVVzLo3sGgOqmePx/I0WhGY2T5ZjxqGuw6iNzrKSjKIN8Ryg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792797959;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Rez6lWrCXKWNd1C4fPh4T1jC+3Mob3goTs0GLfBz0nM=;
	b=vqXrsftUXVGfhqVUDyjWDpu9gAvMU1+d1/o3m8Xfy70ipmHxtzu+C/NO+zdvL4Mkazkz
	 AjyxBNp7FXYZr4EnBA5zY5ehpoO13CVRwfy1XsS3Ski28mLpBpgXoAWfk6bqtODGW+QKw
	 MxYi9ArHtGfZ2ajesKS2YSaUxNU4NRrUqjymFK8hHAvDR5rlcC2tK4V2DpnubGu3KBQTE
	 17SESyDP2fWmAM/wYwjYE47kxg0Dnbd/JXPTO9pLnIg7Yq6sJWtAKR6v16T7Mza33rxlu
	 XEACtYmzMhIqUihKTXb/9lvPW8u8qyDwR96NKn3p7iOqfE/i7tJSQXjlroX8m5c7/Kg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bAk2+frR;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=h9+m5JoC;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51B9B606A323
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 23:25:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51B9B606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bAk2+frR;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=h9+m5JoC
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NLvEMY3683758
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 23:25:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Rez6lWrCXKWNd1C4fPh4T1jC+3Mob3goTs0GLfBz0nM=; b=bAk2+frRzCzBfsE1
	hMaJ+IpdT/5f5XliI6eVQhn6SG+FLituzh8uC/JD918Xw3is+TAf0Sw5qt2/b2Ge
	n8KdB3IUFusV7yqQhKUGHFmTzUMHCZfwezoTV7OF2JvGi1IpXLBE36PFsWLZqgOj
	uX6IYhe2KkgJ2A1WEUoUI2vxpX0g9T3BoxsukB0YeU1OC8DQAoou3LXy9dHLp2Xn
	RNPCo/tNp0J2Ts+kybtAUFcOv+qjty5GOA2LnnlHrioQbF9d7eF48kUlYVxWPOl/
	QhjxkmkP42SYcYMN69kvw3dhLc4fr1w4rG9cRgool0Fc6mJvz+FpFU9UFewuCSfF
	Kmw/zA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgas6sbmq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 23:25:58 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9308eafb465so87644985a.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 16:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792797958; x=1793402758; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rez6lWrCXKWNd1C4fPh4T1jC+3Mob3goTs0GLfBz0nM=;
        b=h9+m5JoC6U6C4o5lc9a0Dk56S0fBTurzmBu3qURUGQdl6AHxsLZUx/VUbRvv8cJkDe
         H93b0dyuPiklbpNEmX5C6NNNz8JPnSH/WzOFjyvqB2nWKixDEYczP0/McAg7Yo712tEx
         sdwBwtGq7ds9PmzhaW+BPSL4P9/KB3Wnyp8DjtnIzfkN2NVYEJLsGsTFOYDDKFxc128i
         Xy8H+7+IPnKD4KAp+BO+tmhQ75lP5vaZ2eIR979gQvckLweouIX/SVxS271cO/ppbLSq
         FX78iFLviYNR1fhkG7h+QUhAv4atam2gmKMS45DCOQEcTeO2shiPTcY214u3lyObc4hj
         IqMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792797958; x=1793402758;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rez6lWrCXKWNd1C4fPh4T1jC+3Mob3goTs0GLfBz0nM=;
        b=kFPvPAh8Tg9lC6PkBlQudAUT6ehR+00wA01LOM7XCRk6kLBYHV20c+JhKrwgTD2jAL
         XBzEOWFWJFwyKCjMLN7dZMBFaL1srD2LGdnK6f+B4lxMOV78xvSRU1e9sf0VkRgcnPJ0
         v5Xs2AQjbbmH1qGWRBSHLsEwIoXcs7/+xe1wrZOovA0K2bhHKrsvur3QW+ofT5VxCu5c
         KnDmw6UjYuFM8iVS/9LB293AY0YjylptHmuSBu+RZJQhsLCkqR2HHFVlkpVak+n7RXYL
         oQZ8GQZ0FsJnPjPKX7/AQTpmdIlPYaRIIRt0OIj7Jlvg5h4dsrONT9rGS7rvbB9pyTMr
         HEFg==
X-Forwarded-Encrypted: i=1; AKwUvBwRezRdn+pXgenkBd1guOSag2SV8Wm0HgPwvdTWkO8WUduO4G9Zu5K8anWR31DRXAPPn/X6HRNrR/oqpjs=@vger.kernel.org
X-Gm-Message-State: AFq9FYK9bVr3DN+qPS8TIgqemNujVPZf+hcIw+0l+O56mIaUDz9Y2voe
	ZvJHC2sEzwz2ZUxPTphUh3kYObVrTWlLLrzrv4gzgN2EdteEUd4cvCJFLXTozbTkSxfVjjOO1XV
	cixBH26gT9pNtk63pwP7FkD9t722NfWOqckaYJY1BBxxENxoDIVEm81XgSCPjC1UJflY=
X-Gm-Gg: AYBFou3Is3eqBDooxzcpsfMvB1JrqzK89JtuhJu3PE6fPH2RBM5zKaC7A9OuE1EMT8R
	70QSsxFLF2xqhesv0lljpR2n0tN820pHs6vnjW2pFwtdRKIKFpoGUAzQFq1Cq7TJlcc21pq1kpS
	Tb0f3usi7L3ZVoSAmyVIxaL883BfF2Nw9RefQYQSCDR4M++m4He26HMhN580sr8wRkueWhvWrq2
	eWA/QcpmCnJow65j31YaVnBZ8RwcrLuxUWJm2ssUxim3vnCDSgjdRuAeKFEv4pmdi0/0swrcMUu
	dJMaOvzq3uElqz1cla100OzU13I6RmteM0an4sWyAOsAWU59sG63E5UZ+99Mh/JwI9fJ38Tcdv8
	FT9nrBO147NNME2kMnLw1mYkqM3FiyKB18JsHQ5FP6U5WUv6426kpw1g+M7wMWY6Nzw5ceOnqWF
	uw7LvntR/svgiU
X-Received: by 2002:a05:620a:4398:b0:93e:5e2c:8bf2 with SMTP id af79cd13be357-940ef8be9aemr96328185a.21.1792797957611;
        Fri, 23 Oct 2026 16:25:57 -0700 (PDT)
X-Received: by 2002:a05:620a:4398:b0:93e:5e2c:8bf2 with SMTP id af79cd13be357-940ef8be9aemr96324985a.21.1792797957119;
        Fri, 23 Oct 2026 16:25:57 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7a9ea71sm60217e87.81.2026.10.23.16.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 16:25:56 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 24 Oct 2026 02:25:29 +0300
Subject: [PATCH v5 08/10] drm/msm/dpu: clear the DSC blocks left by a
 previous reservation
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
Message-Id: <20261024-fd-kms-fix-smmu-v5-8-a5b0b284aead@oss.qualcomm.com>
References: <20261024-fd-kms-fix-smmu-v5-0-a5b0b284aead@oss.qualcomm.com>
In-Reply-To: <20261024-fd-kms-fix-smmu-v5-0-a5b0b284aead@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Kalyan Thota <quic_kalyant@quicinc.com>,
        Federico Amedeo Izzo <federico@izzo.pro>,
        Helen Koike <helen.fornazier@gmail.com>,
        Vignesh Raman <vignesh.raman@collabora.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1863;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=udqMWUS3ZNDRZgnWIleo7N3VNOY49EUuFnGmacwENkc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq2+zrqQD/+e3M3SNpy7jUSpforrUk+5ANjdaB4
 Xy/clql5JOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatvs6wAKCRCLPIo+Aiko
 1XpMB/9bNxciSLAV7RUK/wQL/hZFMaf51A3NbiaVgVEajV6jG3zFj1WArwoAqAk4fEpAc59XRcI
 Rl9vXq3y9rjlqxJD9OlRS3DoGFwligsF7bw6IV9gqfblJZSOhKn4otYSab3O3AmSxqMgGtzWB0r
 ikTl3TXPsxa9DErWd4VNAVBjbUiK2XSDN1vmfuI3uURzKa25TStB2hXZJhSk1jy1yHdc5ajyIyf
 4PtrgpJQHCtQuwUpj1yB2vfREWMB24Aihx5D/l9DSb3f6+oyKincx2qdkpbTc4oqqMH/i07Valf
 IXV6pCGUHb8/buTwa1Xy2LD0RoaJTcq74Ds6yc5zBuXwrGYm
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA5MiBTYWx0ZWRfX+AtFBmkr5lxT
 wL0d4HsE1SQL9E6GSP2PFU6mqHpemzD29ajeCoA+09mcoxfwnE83CtiljigDfgScBaotr2MiMMR
 67ycf3vskFTSkiazJsWICfGYCWcdtRIlXNWEOCgLHlvz7F9qc9QJgxFumhskJls41s8ZK3cq5gW
 OLP+8QTzPvkfo9s2BZv4zkqEckWJiCn4yIWoxcMz8U17epOt1Nh8bhajJluhjY6Gy1gq3zOnor6
 GaB9kI6VscOv13U4aVxXtRrW6LtU5LXQis+WgOKaM7v1CJinOSmttfdcxuhjPBhi3TjCUOTZkVR
 4CtuFhMVcSRNsD4xCw23edhRpVnKPG7O+7P42QXgcJWsYuE3ive0F4HDJNeO6N+Y69hjFaM6P1H
 I87DA4aAR1dMUkVahcjiiSKnK5g2ict6gCqNbkqTzbGjBnznWxgqyAxjE9UQKT/B2ajeEprbz+p
 52otmPoeJxMfmrbOlbA==
X-Authority-Analysis: v=2.4 cv=DK0acCNb c=1 sm=1 tr=0 ts=6adbed06 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=mN6KdvlfDCua2x_U6QQA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: _hM2hJvWZjoBY3SK63UYw-mUZyYeQ1it
X-Proofpoint-ORIG-GUID: _hM2hJvWZjoBY3SK63UYw-mUZyYeQ1it
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA5MiBTYWx0ZWRfX3mfyqxq4fbEB
 3373ajDCHk7T0o1tv5yriBGi/zel9miaaq4qMOM805v8+D/Ue8H2iK73BsCyDMG9rJVJEwfCV94
 DEEmcmiICfiGe1ty5YVrjkBFIxOUk+U=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230092

dpu_encoder_virt_atomic_mode_set() fills dpu_enc->hw_dsc[] with the DSC
blocks of the new reservation, but only the first num_dsc entries.  The
array is never cleared, so an encoder which once drove two DSC blocks
keeps pointing at the second one after it has been given a topology with
a single DSC.

dpu_encoder_use_dsc_merge() counts the non-NULL entries of the whole
array and compares them against the number of interfaces, so the leftover
pointer makes it report DSC merge for a topology which has none, and
dpu_encoder_prep_dsc() then programs DSC_MODE_MULTIPLEX into the only DSC
block that is really used.

Assign NULL when the new reservation has no block for the slot.

Fixes: 58dca9810749 ("drm/msm/disp/dpu1: Add support for DSC in encoder")
Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index b337f197d3f5..419e0c6e8ef1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1224,9 +1224,10 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 	num_dsc = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
 						drm_enc->crtc, DPU_HW_BLK_DSC,
 						hw_dsc, ARRAY_SIZE(hw_dsc));
-	for (i = 0; i < num_dsc; i++) {
-		dpu_enc->hw_dsc[i] = to_dpu_hw_dsc(hw_dsc[i]);
-		dsc_mask |= BIT(dpu_enc->hw_dsc[i]->idx - DSC_0);
+	for (i = 0; i < MAX_CHANNELS_PER_ENC; i++) {
+		dpu_enc->hw_dsc[i] = i < num_dsc ? to_dpu_hw_dsc(hw_dsc[i]) : NULL;
+		if (dpu_enc->hw_dsc[i])
+			dsc_mask |= BIT(dpu_enc->hw_dsc[i]->idx - DSC_0);
 	}
 
 	dpu_enc->dsc_mask = dsc_mask;

-- 
2.47.3

