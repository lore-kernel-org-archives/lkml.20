Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792797645;
	b=wTKZdQXMFp6s6hdwEUhpciz0yJjR38C46K1JoHsg/1TUENG3+M60QW1sujmKC6DbVlsP
	 6GavBqZ/2zPMrkuDZpLf4IWlIN5oL6efh8qzAFIVYFvQfu8WF4P7WDGx4lvEjgfpyNlAl
	 gtCHr6s3t7am7JpG7YidTMIjtUY6zj1+p8NrR00BkYVwh12HsYsRiLk3/J6UE7V5ENg1l
	 LU8X/5oHSS4Ga9d6gILcLRXk2J2AUMzfRquAdbzZLLR2pPACyz2yrZ7KL6lPuVAsPNNSl
	 WzHPKjYfMGpZKKC5ePVTPALTyWXur6/BT9HwVjjLpewExZPOIs5VEiGeKxuK/aGAx9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792797645;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Sx0rmsBgZt30dKcVPh3q3dkCSTQ2aAKHx6qQ0xn5dLI=;
	b=IwZyuXPkhOQAd1rsjbEJ6796v58HEbq9r4jnL1qWVnZfeRKZsAMLoMiu3x2RbLN968XQ
	 HPQVvkTpdFgJ8M5lnJVgphxglbJcrLckDD/M9Vqw+orqLq6HLtYdWEXHTsTbMFRClxD+j
	 rd9G2spwFdn+3lkpAaEgxtnBpusqqkTcbxn6k1gjCjpiYpxCrSsrszChTxFcMMWQctCNu
	 1+0K/G5YHoriHVwr6oYUTelElQzyLK8M/5/hQwytZ2d+uylvBR4U/qoISLcfRorxGFIRG
	 6pmp3dLN+nmN0QQohWjqYqgP+F2QzWBde60rI9XEW/WCSKdl8KFVovxiigDQ8wM1msA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ccYxxnd+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ICpItF8k;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FA0660A2603
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 23:20:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6FA0660A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ccYxxnd+;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ICpItF8k
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NLvIHt297468
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 23:20:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Sx0rmsBgZt30dKcVPh3q3dkCSTQ2aAKHx6qQ0xn5dLI=; b=ccYxxnd+R/pFHP7/
	g51SyrzgCLl4oLK5b6v2MdW0lFb1RLBV2TXI/bTbn5mSunKZi1MjWDw6EnNBN6eO
	IKu8/IJ0xQlOpr+a0vbv9MdgnVxFVbAI9WRuOAOhefV3Vt0qrzg3Q7yulllhw0ew
	wzG4z+ZvU7hak2aNa6gdUHpZopbiZm+/UcqbMTmGeBSkQI09JeWFB/qu6YjzFAmO
	I9JXYyC8nu3sJJovW/JZmhr9NiF8+/SfSs+GpmMkfkJ97NBb/j7Qfrnoyh9M24Ey
	q61CBMEfapK9hqXzUCIag5KhPrpM4ucLc+4lO05z7e0b5QlJoerERP4XNIb8A66l
	MoT9Tw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgaruhc41-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 23:20:44 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93e92aad34aso281036585a.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 16:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792797644; x=1793402444; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sx0rmsBgZt30dKcVPh3q3dkCSTQ2aAKHx6qQ0xn5dLI=;
        b=ICpItF8kPLqlLUwZ0ovmiBnj56tga+FVfdxGQOvR35mUqGicF/dejr4pZ8XuZKgdjD
         oKsqUTdvU8H/iLHszKEBytYsQfY64D4jMYwWPObxwRPwPIKgV7l2lnT9fq9moyrTt2wM
         9EN9lo4AyLbhe7TE6EcrCEGVmJesrdw1hQOOTrtal72jKnaobYHLLotBbs0scC8ob5VX
         g+SrlQG5M32MtgvJXPEC2HpIcYqrB3lQFSGiDSDtU1rBVAFZaibn9ReO3VEWGYK2sfp1
         AucmLhAgEclGwYhnDKpv5nciCQwzfBxtGXJQEWVhEj/KEujBZrEeXdQ+0nblk+545ViI
         cgiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792797644; x=1793402444;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Sx0rmsBgZt30dKcVPh3q3dkCSTQ2aAKHx6qQ0xn5dLI=;
        b=iA4SYWRguf8ypE4jGYdkU3ngonh+oMOiKvr5lwVBW71k5zTJYawosS7EmsxGSvtqzT
         HDg0v7IfMrRUBJkgzF/mEAS8ZoEWnOkYjNGDSM94/UbFFPXnsczsODAPObG96LH5+w9j
         aGZfHlN6EGKz8TxyQzZb3krimZYgJFLC0h7QnoyIt84JCivGKK53Qqy92akJ5xYFU1nN
         Fw7kiINmUfHKPFhd9uqP3HV2g/FEUdAa8ZgSnA6kR9JeXeM6yFjret/QHYcxT5JcCy/h
         d3Du2h5I6uSQEuYQ0YjxhD6rBp4CVLB8VUV70k14/+usWn9pTiQuQzukz5kFij2lr4PT
         lKBg==
X-Forwarded-Encrypted: i=1; AKwUvBxFi8J4JZelQXcPGOodKkd5I2RzaVg2ztwqQFYk82JGMeUpTD2pmit73lVqxblKE5O0AyAw9ys7818w1vI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLYYNb7jckzMBBPqn+w4msxFA1wPuJJD+6JacL+a4S1vcDiXNv9
	AuVpvIZnZHeRGf6+baolZxhXjrJYgflAWKteWiY1up8eMTYua1T8pdl0vrJEHC4XMbzhh83gYZE
	lUFnKqWvQATt1j5M5EK2Lg1uTV2h6zhwQaKu4gKeFDNVVkXWdGjGqRbtEzhTAbHHFO/w=
X-Gm-Gg: AYBFou13jgOjhNwZAYjLtT3vtvTlWqfPCzruWGLhfCCkhkGg8E3mt8WjGJpUce7gr9X
	qpnhk6lbt7OMP1oR6tukRM8ZOMvy+2boLJetO17SABmDBfbIR/JI2U0pt/SX9OKCYQTlsavbwCT
	74cjoZ+epxzdcOfRbvZVJa3FgpkPwlzKUWB3VQLnzDLfcugbTllnLvMj44rJe3qKgrs89vdZtYP
	7l7YfY92gea0prcQJMh2OPNfzCa29d+2GVP5Rrp8bUxvEC4PyO6OCfmtT6I7j4+L2XcVrffj/wC
	/GcQKFbBtPGYxkzm4vFuYtoDj2BZA1klecv5QL7bl40l4ukZmon07nEjWRg6XRQU7UrsCtws2ko
	V579EXIhma5t3+qYVos4psu1BTyDMCN+cBtQpvCiOuxSZeeo1U3Jp1DF1da5CFuh2O1JJZy/qNW
	XJzWfRtmRLzC0C
X-Received: by 2002:a05:620a:4385:b0:93c:70da:e45e with SMTP id af79cd13be357-940ef94005bmr81745685a.36.1792797643828;
        Fri, 23 Oct 2026 16:20:43 -0700 (PDT)
X-Received: by 2002:a05:620a:4385:b0:93c:70da:e45e with SMTP id af79cd13be357-940ef94005bmr81743085a.36.1792797643386;
        Fri, 23 Oct 2026 16:20:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac709f3a58sm863811fa.24.2026.10.23.16.20.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 16:20:41 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 24 Oct 2026 02:19:47 +0300
Subject: [PATCH v3 14/14] drm/msm: drop the runtime PM flags from the KMS
 teardown
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
Message-Id: <20261024-msm-kms-destroy-fixes-v3-14-66a30120a5ea@oss.qualcomm.com>
References: <20261024-msm-kms-destroy-fixes-v3-0-66a30120a5ea@oss.qualcomm.com>
In-Reply-To: <20261024-msm-kms-destroy-fixes-v3-0-66a30120a5ea@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4747;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=j1URGN0eQiJYgrQP9gUgcFK+tRqsBG/bZhmilF0Ffy0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq2+uZ6IYe4lXDGxIc3dTkjP1KBXZ7PEqcwnluM
 tizt7Pj6TmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatvrmQAKCRCLPIo+Aiko
 1X/kB/0e3R/JH2VlWRkymZJSn/JsK11fHILuNXsOmkqwBC0TAsU5ccYcD5HM+0f9E5v/DprbgMA
 MiiK8meTNpPD/pZh5bJbcmG+rF2fpnA/fqCNvDRD8LYzFcaSnym0XgSAQVqLGI6gaCCPRVPEQBl
 gC7FZQEDDNg2S11lOkvTnYIBjqZlfi1hpj7MGO08uz2RX3zCcS16mrMCdmsu568pVDm9Xye58Dz
 Fhx3V0AHza/rTNFQVKk1RB/c38ZF8T4ZeCJ9Xik559abOWtQLYITs+1iDxLedPylliZz3kdTpQJ
 wGCg75ZlvzqrSUjkX/09V375EdjUBhFdefIFLR8KaNqIQSEY
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA5MiBTYWx0ZWRfX6RfYxIpOlgET
 U25mDZbq59y5u+gy1XaizHBjcCOriJw03ff9bIRk2UpSKjSCU6CutUxl2mUnzLWCAsBJY1IBT/c
 8WvuKRJCpYAYBQStzOH7tzwOi0jym2k=
X-Proofpoint-GUID: 4m7tPtCNr25CeWNveZ5Bu3NIF8_6LZol
X-Authority-Analysis: v=2.4 cv=SK7Xx+vH c=1 sm=1 tr=0 ts=6adbebcc cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=Yohvr2p7PhcuVfY586MA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 4m7tPtCNr25CeWNveZ5Bu3NIF8_6LZol
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA5MiBTYWx0ZWRfX8FEGJ2vuKGuc
 Qz6K3zaELak9LrS+H3eGWJclC35PbXoWDwpvhQ0ON9Cc+qdEjV5kW3SjKeVRHZ7k7FWdh2MK+hL
 n3ilwrJ+eUL7WNiv3Sg1vKL9t6uHEBS3JreRyefmZkp09B/nyLlUp21V/x1T1+sbQk77QLY7VZt
 ++eQpf8cugRy2LwrcpahQq1ZMPvA8r+Br+qDVQSMY18HVwVj2F9oDe7gZ7GK1Z5C2O7KHYFMsOY
 OJjUEWq5+nDrbBCe9uifx9c8hsfBWC8NFCVrMqKQ4732SeVrJr+dm1h0vmqSG1CLgRTk2Bm4u1D
 ++tDVSnKyjkpZvHcNmJHJmCFjrgY+dvim3NSBCqnSDJjl7jhq6oBy30E2wZZKs69bGbaqfN6Wik
 EOiib8T6TSLayRa2ZL1iMGDPswYCr9h341r0ryIqoZoaQhDJF+YvdVBtiAOIrVd2UZeQfgNT6tZ
 PF9y0sF6vX7ZVCFg3+w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230092

The DPU, MDP4 and MDP5 drivers track whether they have enabled runtime PM,
and MDP4 whether it has pinned its blank cursor, so that ->destroy() can
tear down a KMS whose init failed half way. ->destroy() now only runs for
a KMS which was initialised successfully, where both are always true.

Drop the flags and the checks.

Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  | 4 +---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h  | 1 -
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 7 ++-----
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h | 2 --
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 5 +----
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h | 2 --
 6 files changed, 4 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 3546efacba3c..e994fd267c5b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -927,8 +927,7 @@ static void dpu_kms_destroy(struct msm_kms *kms)
 
 	msm_kms_destroy(&dpu_kms->base);
 
-	if (dpu_kms->rpm_enabled)
-		pm_runtime_disable(&dpu_kms->pdev->dev);
+	pm_runtime_disable(&dpu_kms->pdev->dev);
 }
 
 static int dpu_irq_postinstall(struct msm_kms *kms)
@@ -1320,7 +1319,6 @@ static int dpu_kms_init(struct drm_device *ddev)
 	dpu_kms->dev = ddev;
 
 	pm_runtime_enable(&pdev->dev);
-	dpu_kms->rpm_enabled = true;
 
 	ret = dpu_kms_hw_init(dpu_kms);
 	if (ret)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
index e39831a397b1..769b8ce6332f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
@@ -87,7 +87,6 @@ struct dpu_kms {
 	bool has_danger_ctrl;
 
 	struct platform_device *pdev;
-	bool rpm_enabled;
 
 	struct clk_bulk_data *clocks;
 	size_t num_clocks;
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
index cb95a492e070..8b07881c3f8d 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
@@ -143,14 +143,12 @@ static void mdp4_destroy(struct msm_kms *kms)
 	struct mdp4_kms *mdp4_kms = to_mdp4_kms(to_mdp_kms(kms));
 	struct device *dev = mdp4_kms->dev->dev;
 
-	if (mdp4_kms->blank_cursor_iova)
-		msm_gem_unpin_iova(mdp4_kms->blank_cursor_bo, kms->vm);
+	msm_gem_unpin_iova(mdp4_kms->blank_cursor_bo, kms->vm);
 	drm_gem_object_put(mdp4_kms->blank_cursor_bo);
 
 	mdp4_destroy_vm(kms);
 
-	if (mdp4_kms->rpm_enabled)
-		pm_runtime_disable(dev);
+	pm_runtime_disable(dev);
 
 	if (mdp4_kms->vdd)
 		regulator_disable(mdp4_kms->vdd);
@@ -451,7 +449,6 @@ static int mdp4_kms_init(struct drm_device *dev)
 	}
 
 	pm_runtime_enable(dev->dev);
-	mdp4_kms->rpm_enabled = true;
 
 	/* make sure things are off before attaching iommu (bootloader could
 	 * have left things on, in which case we'll start getting faults if
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
index 06458d4ee48c..9dd829ec9401 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
@@ -34,8 +34,6 @@ struct mdp4_kms {
 
 	struct mdp_irq error_handler;
 
-	bool rpm_enabled;
-
 	/* empty/blank cursor bo to use when cursor is "disabled" */
 	struct drm_gem_object *blank_cursor_bo;
 	uint64_t blank_cursor_iova;
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index c349eedd55a6..bbf459bff35d 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -575,9 +575,7 @@ static int mdp5_kms_init(struct drm_device *dev)
 
 static void mdp5_destroy(struct mdp5_kms *mdp5_kms)
 {
-	if (mdp5_kms->rpm_enabled)
-		pm_runtime_disable(&mdp5_kms->pdev->dev);
-
+	pm_runtime_disable(&mdp5_kms->pdev->dev);
 	drm_atomic_private_obj_fini(&mdp5_kms->glob_state);
 
 	mdp5_kms->num_hwpipes = 0;
@@ -734,7 +732,6 @@ static int mdp5_init(struct platform_device *pdev, struct drm_device *dev)
 	clk_set_rate(mdp5_kms->core_clk, 200000000);
 
 	pm_runtime_enable(&pdev->dev);
-	mdp5_kms->rpm_enabled = true;
 
 	read_mdp_hw_revision(mdp5_kms, &major, &minor);
 
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h
index 7bf2172fce0b..c0b163c4baa3 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h
@@ -62,8 +62,6 @@ struct mdp5_kms {
 	 */
 	spinlock_t resource_lock;
 
-	bool rpm_enabled;
-
 	struct mdp_irq error_handler;
 
 	int enable_count;

-- 
2.47.3

