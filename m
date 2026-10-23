Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792797958;
	b=LqOwI8leqgDtrQlSiBG+kcJ29YFcpohotvPIBER2ayeP6TfIMXL2VpAAzOmL4ehb8vaW
	 u6m4Y/0kRTo5MBKUvaT4pQu54dHDnrbHOinrIYjpc97hixwsz9XAtJW3ZrSA+M7T40S7B
	 AnwiEg7nuzi7/K8LLyt8pFvxrhzy3TlJK6TP7oQEEl/mezDD0IZPgCCKKRBd3YFpp6C7z
	 SG/CPzoNPRyAMiZ6gCEiIvHGg1LaE1wTTC+BFjS611GisbDeH5NYneSPCYiUax6ckkwSq
	 0aZjHYPr3nynwN4YJYkhMk/BinF7ckGQjJ9ss95TGIXIO4jaiQDIyeWHHS5gWwbObIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792797958;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=yWz46xkNVBGoy4QZA/vjGyipwc++3rwNTm8zVWDVKio=;
	b=fMxo/CgZOXzWjcvm1PLlDifMjb6e/e8Zk27nCFfcw24mCIdJS/Ceou0QB1ThTe27XCG2
	 SB9kCfvbcjzGZA0hzK2PUEFk0lva5HA+BTEDAnxy5rOzqEnhHyLQ0BsIVVap2AAGYzbAV
	 M5BEx0v2r/kiywd3vBXq54oucAYdcgJTiJP8NEKoPquPqFMPqGSjdahjuuzWlukRrVoFc
	 t903mCqyoMfpxl7dESkxhBhv9COhnnYAx7PCcxB66CiuT46OHmePc+VjZoir2W2gfO17a
	 tzXq6YnEkeqCR+LFKOhMX1yL61phX1DpypVr3tvtIbBgdIjJMdMuFbPIwnGqVDyee3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LnS80R2n;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EEkb9jmm;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD6B0606A329
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 23:25:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD6B0606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LnS80R2n;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EEkb9jmm
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NLvEMW3683758
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 23:25:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yWz46xkNVBGoy4QZA/vjGyipwc++3rwNTm8zVWDVKio=; b=LnS80R2nHDWpSUJD
	EEYQn6h//V+BzSs9AmGR7RnIeRomeP0/SND86emVI9y3oXMHIsXsmRYnwFx4bfer
	IZoo13T9fc7y5j/WWZhD4DDfSJhVlPjM4SPaVo8+gTIBFovdqd2iHJ1pFQF7w3e8
	TWwVdNl6w1yoS4/412vZ1HzVZFVONMmJZndDBhg8YBcsaljn8ssZNGPyjt+BkEd1
	rfxB1Ih2qb3ERlQ+q04rXQnQrCwve4T1hpqyp0dL44D1jfPy+7x0OjJ9rCeh9sAg
	asx9tlAWfOp19LV+4+2BwqafQgHsQilPmhWKQZMRyfsqXIuP0i0Fe7MvGgjbrsiv
	GkzzQQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgas6sbmj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 23:25:56 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93ca9b53afaso423789085a.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 16:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792797956; x=1793402756; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yWz46xkNVBGoy4QZA/vjGyipwc++3rwNTm8zVWDVKio=;
        b=EEkb9jmmmIIY9i30w3O+njN0fvdCir8/1QRy7TikZZ94ERMWFwi6n8I7EYAoRpMrm+
         +ucXXmnOR97wbjZBzW+YRqN5yeIP/5RZd40KQExCWflij38SxGxjr/358byGKT8XK3AI
         /qECBKSkwQHBNmbfA8n1xRAHt3AW2XlkGGnxmrz4iKW5KAJZrVkJpYfwdUzExaw6PVDK
         niEcZCLQaLNrfXmQ56WDidWpo5RXcufBciJrNOWAz6884PQvLLhnxbBYweRu7IFpXjur
         Oxzegjfz/d/DfoIRfxMRgq7Ju66TDOS69MWh1QvZ+ulH6iGZPf8nNiYtlwRom4ASFb0j
         KvTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792797956; x=1793402756;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yWz46xkNVBGoy4QZA/vjGyipwc++3rwNTm8zVWDVKio=;
        b=F0nj1lv+1LQdY8YbTHR5JxKRhoQKufXZguwFlDu50c/dWW886nBUqrcFdZdpATgG+5
         uhtwTaJtrIfP//CJZH8vEvtnfm0bxLn7+qbeseP9z5lxbZymEjRHOzPM6VpIEAttbor2
         +cfr9c35noTQe+lzUxc0F8mzdqCheB9mHiMiO3jkRHTi8afK2zKI/Uwo3nuFALy6bTSC
         g9+Kn8wOJhdKKRuAty62wm/JFumdadQeFEjWpc44YFyqWO8oo1VPLFZV982XKs2mK7HT
         +x2PPCgY/0isKC5opmixIbqmeIIoBU+PtaMKROKL0q/HNos4UG4IzGP3cl2+seQ1B1pv
         nZBw==
X-Forwarded-Encrypted: i=1; AKwUvBwpX56wKrP4dyUo0EwuZPcJ83t/BNQ/b5ardu0U7oNksIuLI8SP8UouyhDw75zFqPkElYCQ8r7FqcqLUtM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJPO1BbiBIUVvjo/Cu2nCJsla2hPkApwVUnCY2jaCHMyri/6yyT
	W6peyZgO/RKMtwVVp6q2mJzFE2KJsBDM8PiVh+uvgImJ0CO04IHiKMmtjE2XwIiFOZxK2hc65Rh
	Gof8lCZsCRQYC+t1mdXjgxVqupqIU7Ba8dtRmrKJbmLwljQAx4hygu/t786JN1rEYtdE=
X-Gm-Gg: AYBFou2VO8Vh65lyyz0rJC7kiWFrhwQ/W13MSASJqr6s2jr+GA90fpTzN+RXK1cUMzK
	naZzD+c2emuUprb5EFqZT5emoAEM4WnJ1QeG+Ne7YyThDeUC6lcbdqNXSQCqV+ZbTN3TMyLkk7v
	qLGFWma7LzLFMT8dZX5hk6YhLIwNdF9OQBjcd1mvNzmgO6r6cVEl/pZR3c5xP06MGvqHpGUEchV
	5ytqZ6vTsYn9wOWE0DaAf/km4TPDLWRHSrYoWDI8Q15tVqYdCGV3mqImVZBzj+Dxmxlme/aPjiT
	W3TTV0Yqcjq4z/54M9aKZ+YIQWTFB0RRrAgPPlK0Nr8Dfjf+/GEBkucIJ7Ocx4WLxAcxM6DiqeU
	tBCGoZnEVv/hnEnj2zv8PseZk6d+H/JP8c3N+qQV7+TBRsgmeF8ViAU8RYjicXjtTYfBTUW/oiX
	WiYSEIFQow313j
X-Received: by 2002:a05:620a:4002:b0:93e:66e6:fa4 with SMTP id af79cd13be357-940ef8ad076mr91125285a.16.1792797956238;
        Fri, 23 Oct 2026 16:25:56 -0700 (PDT)
X-Received: by 2002:a05:620a:4002:b0:93e:66e6:fa4 with SMTP id af79cd13be357-940ef8ad076mr91120785a.16.1792797955717;
        Fri, 23 Oct 2026 16:25:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7a9ea71sm60217e87.81.2026.10.23.16.25.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 16:25:51 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 24 Oct 2026 02:25:28 +0300
Subject: [PATCH v5 07/10] drm/msm/dpu: clear the DSPP pointer when no DSPP
 is assigned
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
Message-Id: <20261024-fd-kms-fix-smmu-v5-7-a5b0b284aead@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1311;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=T4qe/ky6P713qCmilfQ+5NwYZw9WXGDP/jjKvtHyyOo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq2+zqQkfwczTu9DR5C8IzZO7jqCBsr7m+Zvz5f
 nie5Z4ZopyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatvs6gAKCRCLPIo+Aiko
 1TvHCACz57GHDO9exaxWFrq3FpilvizySn9GffjbNQwdodh0uir/gw4cy7Mhj+wWzLUMfkOxw4L
 mXRQqzoHYfWjboiEotZo+L+ER1pfvA+9oaXAmnqIEvbpbn24e7qCPp/wbeSuYPRfYtD+yylCxAH
 Fgi90OnK3QPOWJg2UwQP+k3L8YsMvmWosOMfQ96HD4et5X+uSKuVQIVnT0gKF9+8pb7Zr7nlOmH
 Ihj5ZmirSmVhfdK7n3tVaevyrukZ12kYAXCtVMPHSmGJ0we50TljrNsCR0JwjaEvb5RTkb/gpL/
 dHM7+kbpZqwYHnbW4m8TYJ73FTXkJSdDp0GETCE3RdVNGugg
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA5MiBTYWx0ZWRfX1Z9g2dtO6p1g
 BCwxtNBIUym+Vgag19/GchcyEbof19mbtl2q5ziCtgkvteIQ+6rF3D94qF0b1Nfk7p4cmtF1yha
 hQQM0AUguS0/SjPfo4LFy9EZEfrr5xYy1mEkSAAygCqAfGOmoWImwB3QXm9pC8MlE7gdvNLTnlZ
 W/r4vGVhIoRUNiR+m8OUXMqlQ/FFXVWGOdPD7qeW/ICUP38IPNnO63dEGJhsFDN+qFJqMRhN5mq
 PuVbbrjM6yB/zM9iDoGGCIzVRieusp8ahXNgJXgY6BtInZ4NaAOCIQGNilhbbsLTEZzY4rSedt6
 HbQnK/7HvnRqg3X94zrCh/ld5ZjRKMSL/vuJPRfXx6CcvlTnhoStdlMGpuSPlWpg/aava6tRVDk
 HistBsEcOEJzgvBCrPkCJKRZ36H/9iCZg0NH3oXORwea3E0QqXnnwdok23Q6YJvxXH1ksI+/2sN
 d7jWEX8jJVUI/hkILVA==
X-Authority-Analysis: v=2.4 cv=DK0acCNb c=1 sm=1 tr=0 ts=6adbed04 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=jpbDcG_WXHA3xrgMYRUA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: fqlht8p_lUC4ZRXXUYmr-TR9m-uwRuD3
X-Proofpoint-ORIG-GUID: fqlht8p_lUC4ZRXXUYmr-TR9m-uwRuD3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA5MiBTYWx0ZWRfXwNMv5wQAE3+t
 Q2vNVympzV3V0shqcVKmuwf/ogYxSUQ7eo35qCj/I6Ccc0SRxb6KQyl7Scqm009jhEwGmCHP56x
 qytJUbiWiezOQVHC9Rck8ALX9zTC9aU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230092

dpu_crtc_assign_resources() only stores mixers[i].hw_dspp when the new
topology has a DSPP for that mixer, and dpu_crtc_duplicate_state() copies
the state with kmemdup(), so a crtc which once used a DSPP keeps a pointer
to it for the rest of its life -- across reservations which no longer own
that block.

Assign NULL when there is no DSPP for the mixer.

Fixes: 4259ff7ae509 ("drm/msm/dpu: add support for pcc color block in dpu driver")
Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 1f8fce366a1d..2ff0dab33710 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1480,8 +1480,8 @@ static int dpu_crtc_assign_resources(struct drm_crtc *crtc,
 
 		cstate->mixers[i].hw_lm = to_dpu_hw_mixer(hw_lm[i]);
 		cstate->mixers[i].lm_ctl = to_dpu_hw_ctl(hw_ctl[ctl_idx]);
-		if (i < num_dspp)
-			cstate->mixers[i].hw_dspp = to_dpu_hw_dspp(hw_dspp[i]);
+		cstate->mixers[i].hw_dspp = i < num_dspp ?
+			to_dpu_hw_dspp(hw_dspp[i]) : NULL;
 	}
 
 	cstate->num_mixers = num_lm;

-- 
2.47.3

