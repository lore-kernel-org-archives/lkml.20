Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7898F4F4CFD
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 13:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790775433; cv=none; b=GJkm52/EgzN4UpUTYWpcu8nI7yMtJATicXNnmaJP2+uJOTa7El3bfbE8H73VfRZtADnD6Tn6X4Qc+wmX14B1I7Runxi5ZQ10kjVuOOj/W5oHdo/iZ2EwhkmgUGUR1ccs9bWg7zkev22YBm+GQAr+RP82l2hga/ZsNCpBTL2gZJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790775433; c=relaxed/simple;
	bh=3dR/KfgUpEPFYcvKE82HaOvSnzW5RQTXUlnPfU4rkJI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=VqKcQ8Vpd/22Zl1YCh5wSM1VicWRxzgGWLG908XQVc+1QWMR3jdRo+zbja/tsKApTVjMx9H0nDGKoowjE9I0SVfabPm0LkkSch0dz5tirO+sftVCtJMENe6I6qczKMpqXMklmVItaRB/PELEOlRAfvIIAJjE2HE9FJt6eKyPaHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gRaBZb7c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bu+xZkdg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gRaBZb7c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bu+xZkdg"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UB7c2i3135760
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 13:36:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=jCcy0+dmxhjISV1WNXx+vo
	E3LvhshC75PT+Ka3ytGgQ=; b=gRaBZb7cNO2Q8yMKeQOfdaLS2+UVK1A/5KLuyo
	uoN4mGRQoDo+3UhHjvdZmNHnkRzQGylX5Sf7eH5ktzxXXTRhJzznUf3pPjqOu1ZQ
	nlFf7MZIRR6gvyHKqCFUWuqXAHbOonJlX4qTvwDTHhVSsNR/hFJbyOsNsFpqxcnM
	M2w4hFwY4LFPjuV1vSm4210q93Ti1GPFOQjhIY32XfC///iY698eQTa7KeYDOGJG
	y7YQgonSqof4p+W25U0goJIzvnWUaKZBVn5wnWaTCxJXE13Q4sUv84VEV6RrnDUn
	x7jv+Ev9iqzzoZ1cpZIm+6QLl2wLBXV2yTYkS3LyCH5SSr5Q==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0x27hn1t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 13:36:50 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5d342208700so1587141e0c.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 06:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790775410; x=1791380210; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jCcy0+dmxhjISV1WNXx+voE3LvhshC75PT+Ka3ytGgQ=;
        b=Bu+xZkdgt52MpEzaGPz9c6gAuJ48Uh22+A/d+cbf64l7MhVcHAa88u6JCBhIja4qfG
         x0DTbUytvKdnKNESpM25A8ubDsClQhnfIxoVOe7Hda/rFemyiGn1x72Tj8lalHyko0sW
         3CL2Ktss9OZ+gv7DNbOLd6IbrY0LBDlq5S+kNykM3hB25t6T4+kdv1vlciXDUPhljULF
         yJybzKoR9vNySD3/qq9j1ECI4Fpq4bWeM0u56ZShyC+opQg039glZYIAViI64L1M5ttA
         bku7UPqh3WKiVHD8lpWCObMzK2lCFI/7fpAX7jCMTWYzb5Ac3NthLkF7jOxPhplvRxUm
         6Wkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790775410; x=1791380210;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jCcy0+dmxhjISV1WNXx+voE3LvhshC75PT+Ka3ytGgQ=;
        b=c8D0/I8UZPCBRjENHNA+ggDQXML3SV6vT49OYpvsQ6ivGJablei8d0XGUDjxexUDjJ
         cCLjMEUB8g3+58uOIoCxBYKDxRFQT9Wt5LX2+yW1hJp7HAGVSZxYiY0Yjv25t5XdPdbf
         N5Ize0+AyIafB9jmg05c7sJjFv4ifd43JGg9rzyq/SRyUJI0qQjiPlI/rZ4PYZULaOK2
         q3GVWNMqBYa1ajgHVNrSLemwpZny4grTWLo4fAeCfBiay/1fLNHxLhDwRXE3GVIcH5j0
         m+UleUCeik3GpOOjkHFvKTKPv4TTVXlF0LyTUQi5+DBMEhOqkooT6JlTmWEgP8mY5OyH
         8oKQ==
X-Forwarded-Encrypted: i=1; AKwUvByw1XTxYZqAIlg1lhPoGCv/XOvMj4gcLwW4e9i58ZO5Wk7P8mDXqbdncoFYb7G0fnBO1FTGfdAGEA625Bs=@vger.kernel.org
X-Gm-Message-State: AFq9FYJHJbCB5BvuDE1jMB7LVReOiLh0mjpSH84TCnPjedBpVKZhJabR
	tWoKg5R9ZgMSnr797U7peo00mHCKdO89iBf/ZNflWSNEGy2CfS5EmiHikY0Tck3ve/IXp++SqOz
	lrxDJEGBgnJAXlzKg04MA3ayXfwc06fh10SdJrn7KcuRKOopx7r3P/RdtZE3FnoZET3E=
X-Gm-Gg: AYBFou12R8X6yU9GVXL9ZQjZrTz6/vwtaogLhj6fIs/K4b7o+dxXH0ZQxV3xZrhJYXw
	HbfzrilyB4l5QSR4weCNKxHNR3rOP2NL2GLL8SBh0ZfyPtxiyKBBp0idn6+AqYi/YYjbLhDrDuL
	JZRehqfnJ9rhF4tCTeOrr+D5TPbsQ5+h5XeR6BmNOzIQKpT6ukI4ur8WAW3S+BCC/2SAmkKoy+7
	37fahsqnHu3Ycv7Dq68SQkoaGV0El0eHacBDBWgilJNYDT6GzqeSbTnnwuJDm0fyGPK6tMZFx1+
	4W20rbzODnB8SymkkPBuNsdnZP+H3eVrW66rwo6rohihviSvuTGeuOzoPxDa9wTvBwRkr4285M/
	wGE+mBpfYUBwEfOL0fZE5vVlZHIjWsmdUc7S7wIHVX2tzD9RICo4t5gRzSDFDDGUpR5TzQCn6Lg
	==
X-Received: by 2002:a05:6102:3faa:b0:7a1:f7e2:aade with SMTP id ada2fe7eead31-7be7359628amr353692137.16.1790775409819;
        Wed, 30 Sep 2026 06:36:49 -0700 (PDT)
X-Received: by 2002:a05:6102:3faa:b0:7a1:f7e2:aade with SMTP id ada2fe7eead31-7be7359628amr353675137.16.1790775409340;
        Wed, 30 Sep 2026 06:36:49 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ba3fbfb582sm356731e87.57.2026.09.30.06.36.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 06:36:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v2 0/3] drm/msm/adreno: implement progress handlers for
 a2xx, a3xx and a5xx
Date: Wed, 30 Sep 2026 16:36:45 +0300
Message-Id: <20260930-adreno-progress-v2-0-3882f0fcd7b4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG0QvWoC/3WNyw6CMBREf4V0bUmphoIr/8Ow6OMCNULxXmg0h
 H+34NrNJCeZObMyAvRA7JqtDCF68mFMIE8Zs70eO+DeJWZSyFLUUnHtEMbAJwwdAhGvVFtLJ6r
 irEqWVhNC69+H8d78mBbzADvvmr3Re5oDfo7LWOy9//ZYcMFbYYxxpb5oq26BKH8t+mnDMOQpW
 LNt2xfkBoICxwAAAA==
X-Change-ID: 20260927-adreno-progress-87f92d081376
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1187;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=3dR/KfgUpEPFYcvKE82HaOvSnzW5RQTXUlnPfU4rkJI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqvRBvLdp95flAy/wXj980CxWYHYmmHg8wg0DnC
 1qCILkwLlKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCar0QbwAKCRCLPIo+Aiko
 1WjdB/9a9/EIt2tdonXcYgC5QsegQiRulxNTgr6GIb3sA+XqbPGE8Elag50kvkfFaY4y+C62pw0
 9jTOpV/RsnNMQgyW772EoOjsfgH06w3b7JNWNDkqvTqmM89+WaZAnQ+327HT+vZofHCz6WCKTj5
 XiFk5cDdo+oRshKKpOfcfYnb9ClUiQJEjG2PELGmkJ21sk+1ZanHaPK9NAXXlgc8oix7xe8cize
 D2CMK8Q7ISdJQJXojkUEJSnsTa/61WFKD9YA0U7vhhF6UDxqtHpq2OfVzJSoES4mpygsjCFvA3g
 U/9VKw/94Git12w8EQ7zt1lp7ausouZPBkjDgH0IwKz0WWiz
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA1NCBTYWx0ZWRfX+AkvS4EHtj8/
 Z5Hhyi/leqIN63MUiY6FUOXaTq5J4/S25xuBHwsQrlHalU4NgD5BIzkuG/ewntDWhyBbxojZiZa
 fHvSh3PMOU6Ef/7P5ydHNEK24MCW5dQ=
X-Proofpoint-GUID: HcdiMeYA9k8Uu6-NRMnNi77dp26400XB
X-Authority-Analysis: v=2.4 cv=W9GtxhWk c=1 sm=1 tr=0 ts=6abd1072 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=Kk7049moo6jdYbzpDncA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA1NCBTYWx0ZWRfX9tI2QBVLxkpD
 Sq+TaSGNKbyO5sNmsfDJyEoAiaCYHZUGs8NVaqflBDcqSfF5pwFSmR9ERqVb+eIxhdDk4cJCl7x
 /IE4p1U1zoYBpSgvCsSskUTLAzquek4tFc4Ni/U0yaEcErLH4Q/xZRw8TfHTnjr9nMsx3liKEDL
 eqwUhnG99K7NCYWcU0ubWum+3Vy8r85UdAh8XkNdHoLqO//3t8j+cgvPDMDvCt1K1LHcN2QJYK5
 rou1qv27nycwJq48nhNAe3JpAOUi1uPg6Q/6mdQ1199D6QH4b/4IktJw2nRbf1tBzOJsWxEfkY9
 BRz81ew3SUyBFNwT97EffwMgeoq0N/eNu9wyj+ei8PDRzHWx5mUFVjPF2zdGC+/BNIJbfGsMjRB
 C+sDx/rwDUlANhtt8GwH0aM/IZRf+oKbp6M/vmMBdGrIc1G+PKflaF3uSMlNen2cMjL7tJFrb0z
 /Bih6zAxq1e/oJAWkqA==
X-Proofpoint-ORIG-GUID: HcdiMeYA9k8Uu6-NRMnNi77dp26400XB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609300054

Adreno A2xx, A3xx and A5xx don't have progress callbacks, so any submit
still running when the hangcheck timer expires is declared hung, and long
compute or drawing dispatches are reset while still making progress.

Implement a2xx_progress(), a3xx_progress() and a5xx_progress() callbacks.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v2:
- Added a matching progress callback for a2xx (new patch 1).
- Link to v1: https://patch.msgid.link/20260927-adreno-progress-v1-0-f0bbbd6a4ac7@oss.qualcomm.com

---
Dmitry Baryshkov (3):
      drm/msm/a2xx: Add hangcheck progress detection
      drm/msm/a3xx: Add hangcheck progress detection
      drm/msm/a5xx: Add hangcheck progress detection

 drivers/gpu/drm/msm/adreno/a2xx_gpu.c | 18 ++++++++++++++++++
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c | 18 ++++++++++++++++++
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 27 +++++++++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/a5xx_gpu.h |  2 ++
 4 files changed, 65 insertions(+)
---
base-commit: a15fac810c76397ec9f62a6fc26c4d7ab6e238a7
change-id: 20260927-adreno-progress-87f92d081376

Best regards,
--  
With best wishes
Dmitry

