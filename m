Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793731664;
	b=g/vHCQvGPikdO3x9D3BmxRjZfteSdn/SqM6TPRH9deN5g6SDQrPfyLFEBPNKsVK/232w
	 wXMKdjLN8NKR6YB5869M9yF2sb4EU/rwg387vGNqrtX3670wrw+/Wf++sfbhhgx3XIJeD
	 lHczCrCZiein72Hq49N5gaK7cFuhmEkTXZonkLCmGNUSOcBWFSMhP9pRifhmZwUa9uhU0
	 UT/1Vi8y9aV66AYxeZ0DttZV3R5ykiQZnd+i/yNxUSFrHyxLhs/EnUba4ZnHCFh7oQCwk
	 daOqxvWuvmY3kJ80dM8mKmII+nb4Cet1Q2y57T3W9fP9zYe1G+qRsCtJW6/uAPZ2dsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793731664;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=yKmSGK1vSwOyKiBV/4vQNcT9fTTMd69aRbOdB8aI+io=;
	b=JcpttlmVrpKDX16ozeeHw9d61DschJa1hjy+EAWF0QlmawHSeKvyUsyStRUzuNmkMMk+
	 CddZM8HEuSiHUQqCRG+gSDuQFHV076BKx4BhkU1TEY2Dondt5OL9Z/34lN6DptcIPXTE9
	 pp8P8ee353Z9QxGLMlP5ndzsZd7lRhj4WLOkT/CDhww29h4/wI4MsgEYTupdeMF06MOLG
	 AtS4jcZw79UXIMvnzhPDrYr7uabom4AZSacgSVLIeu8AOiXd2DYdKPr2KHkadV3FbHPlx
	 IDB3Xj+270rpQow39oAhF/p10cDNf0Ch3xUGW9ZlAcUjU4TckcDcFxqXQ3S3WJ9zwGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cz+enp+8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CafXZnDr;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7983606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 18:47:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7983606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cz+enp+8;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CafXZnDr
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3IZ9SO3666384
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 18:47:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=yKmSGK1vSwO
	yKiBV/4vQNcT9fTTMd69aRbOdB8aI+io=; b=cz+enp+8NeRPsyQqCo+pZ2rWniP
	Hj6irvUsKPfl2Hxi+Vz5RjIMKmT1zRtWOQQ5PjYlmPy59Ok4QXw4w3NSkeuam0VZ
	cbgNScVhkjb4TAlA56zbdeN5eYhTxeTQmiA6gIAtqGF4HowtyvtBPfY9tgd1AyTU
	XKV/7kUIcrUoOiOr0rKMUW/NULIBchuAbDLJDUq9mP5R6QmxTq3lpmBSXtR4l2g7
	EVBUXNceI1/qjSq0ST05zoFXJ4iUjG1UU7xWucVWwbS5GErewOPTZ1sjdIr2hMnS
	ijfE+zVdzCHtiJyJDBggUbgEHFD42aOF+utv0vCK1/eHe3MsBiNLsmwrsbw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqjubgrr6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 18:47:42 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc7e0321ec1so5056320a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 10:47:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793731662; x=1794336462; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yKmSGK1vSwOyKiBV/4vQNcT9fTTMd69aRbOdB8aI+io=;
        b=CafXZnDrWvbaGfXBRJKSkJGbQr3UGx88b5Wz1rGo5WKRcuvs0/BLyC7LwFbi29df9D
         N9VnF2yORvMDp4yfNhKj5lmaJTO8tmA/LVVopVenPuATHuqxIeEKTnPcisi7GRKPUnKt
         64PWRlpE4Ri+J5gY6tIydENdben7LH98CEeG4LoR+Bh2LuSvu1holhjTyjZdd6QlWCb9
         3mkHroJ+yd2vQY4EHDgf6zF8UnQR93zd8+fzS2rjygq+s+uC8Z/XiABSntm5wjZ/qvxU
         pVOGH6aKPz85C8R8k37IZyj8B4suOaHJ0q3pviHDhSq/uCJozDGfI9oSgJFQeOvUojYt
         /kkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793731662; x=1794336462;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yKmSGK1vSwOyKiBV/4vQNcT9fTTMd69aRbOdB8aI+io=;
        b=AlHFvNZflZqqVy1EkVZv6rdSa5L6ra3S1ONlFxRPMvXG2ItPoZbOlqIgKCw44lUwsy
         IUpO/Esnp6gOtPPmue3z+iSD+nA4ZyMoJUpTYOne+eB3xoNIGLb2j7T/Z+xlBJBoKfun
         rY44mgwVCOs8nx93PafXRfWXQKe0CrOslstzR+vfoh80C3P5mcr9/bh7rUpXJFp/PtFu
         x28mSjJZMkQxtov/zKbbIm6NI1eng217u2PD2BzAazYQZ62fZyBGT/1M4FoVOlTDXSVH
         ts1AJGuUEtv2cjVEtZ3jcHqsd6K+LRjwzGK/O4zTU2jJuNEZxpktpQsCYjWNSkGKSx1J
         LV1g==
X-Forwarded-Encrypted: i=1; AKwUvBw8qjihY6/neabSnPA2yzm2Tps87oOdJPhHrpOigKndR9zh5FLwULOlKBBD5noVu+BKhhPqP6Fo7qGj3uA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Pa5dEsQuvQ5ld32aTeNF4VHusxvm7t017m2HxdYevKVMpL9Hs
	9x5JywGVb6jOocPOgffb9c3PGueBJNV8I7BzHYKEvMWJR0KA78AaRX4F6DUkAxFs/igyp7xZMHE
	4LetGYX+a0bims49SWS/6/it6Iw27UqiV/5nWDc3tRfP74frPPIcO+PHywK2Lfk1FoXo=
X-Gm-Gg: AYBFou0/jMQ/Dn9UBpiG+a3gd026NNv08MYlNXVCAECAaqhglG2wrKdfU//TzlxMvxX
	U8TW/ZUVqrIzyCUzlVs1Q+Gc54aOtpwuEAzIFZQNgp4jyN/bpFqDPGrAsncHH/d6DJ2duqixZ2y
	APJtENlrE1ZeENwRxTWjxZTEmVl1ibmcwe6ebnETrOKKqIgGLA+nMXY+lWrF/aZegjzHRUSdHhj
	P+Ufpo1QbLeeuumYKl9Nk2iTdTrXXiLmZ4B7AFcT586OAhQZmyVl1mSPDcIV+W78NFtpGzcAq86
	+7pGd0ZSSV4PsqfdC5rKrwhMKkcYhe37Y83ZhgQLMyNL34fUN48+1d3R5avHe56c4XSTtDtKkTe
	mAonbzFsJ1Vy7IekWPhp1w1TnKLd0gLN4jyI9QaCaE1cWEPXkX1lGDlLpl7D+qSTj5Ayw9zLjRM
	JmrIZ5A9TIdIxReibSpmdHOx69PyoFTHV+pbTwFTDBKmHDqaJUEm63oMP3gg==
X-Received: by 2002:a17:90b:4f87:b0:3ae:5572:c4e2 with SMTP id 98e67ed59e1d1-3ae897e5685mr11081771a91.57.1793731661801;
        Tue, 03 Nov 2026 10:47:41 -0800 (PST)
X-Received: by 2002:a17:90b:4f87:b0:3ae:5572:c4e2 with SMTP id 98e67ed59e1d1-3ae897e5685mr11081752a91.57.1793731661350;
        Tue, 03 Nov 2026 10:47:41 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c7e087csm5545438a91.4.2026.11.03.10.47.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 10:47:40 -0800 (PST)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Anna Maniscalco <anna.maniscalco2000@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 2/4] drm/msm: Add cleanup help for disabling IFPC
Date: Tue,  3 Nov 2026 10:47:08 -0800
Message-ID: <20261103184713.29664-3-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261103184713.29664-1-robin.clark@oss.qualcomm.com>
References: <20261103184713.29664-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA3NCBTYWx0ZWRfX/4dUozPtpSBV
 83oy1wf9fQJnJf+89J+RkrlxPT8697b4TaaSG8DY3UalEcTlYHCuTJCyeSx20Uxc3P7Nc91rySk
 cmb60hfgn5KvDTA3+8fIz98ZyeFHtRg=
X-Authority-Analysis: v=2.4 cv=JeUpPkKV c=1 sm=1 tr=0 ts=6aea2c4e cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=pGLkceISAAAA:8 a=vTD2gfctXtM-Q-VHBdUA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: vTxnqqhmntybWtNkkzTKKTjNCfJVQXqA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA3NCBTYWx0ZWRfX8YDXFNLMO4Vu
 FAYyg8tL2RzSgZLyNlYC6QrODGNODRJtgm17t88Co+eThxZLz6Wwt4ye0itZ5SDihWzUNKdb+iM
 6ane7LvDKs7PcN9ly8OV5BFYuFVgQ4jtXPsAQcpEnAJSzPi7NAAb3xaOUsmRCdvaP3roRXpL8Kn
 +kqttjON6PgcyjMIjHOxw2e4XxZDVmsEHFxTDP+QW1Pl3sFUMaVqrjqb9oXZUYTAwt9MHgEtgyy
 LUQiNB78pctr8wgL7MmaD5hxO7aZqW5WJ20mfusz2buMXprHpBAV/svlLfGNWjEEpuK/tf6duoI
 xSLRdpqRrmJAiELFlvkATF4c6Qtm18kTBjFxwjZQpw5R/FtnOKAz8GfRP31QgTOW8CmVklVddLd
 Ealxpgt+LfBRWLoZhpnXl90v/n1G061LOE82WepzP/TBGdPm28h6Hbhk2YdkViKky2gNc9isETp
 3mE3k/HclJYOFVm+iQw==
X-Proofpoint-ORIG-GUID: vTxnqqhmntybWtNkkzTKKTjNCfJVQXqA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 bulkscore=0
 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030074

Simplify error path cleanup for IFPC-disable critical sections.

Note that this moves where we re-enable IFPC until after the
wake_up_all(), but that is harmless.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gpu.h      | 4 ++++
 drivers/gpu/drm/msm/msm_perfcntr.c | 5 +----
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 0334a0f604ac..e7912d2180a5 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -399,6 +399,10 @@ msm_gpu_disable_ifpc_put(struct msm_gpu *gpu)
 		gpu->funcs->ifpc_update(gpu);
 }
 
+DEFINE_GUARD(ifpc_disable, struct msm_gpu *,
+	     msm_gpu_disable_ifpc_get(_T),
+	     msm_gpu_disable_ifpc_put(_T))
+
 /*
  * The number of priority levels provided by drm gpu scheduler.  The
  * DRM_SCHED_PRIORITY_KERNEL priority level is treated specially in some
diff --git a/drivers/gpu/drm/msm/msm_perfcntr.c b/drivers/gpu/drm/msm/msm_perfcntr.c
index 867dd476ed88..995857273aca 100644
--- a/drivers/gpu/drm/msm/msm_perfcntr.c
+++ b/drivers/gpu/drm/msm/msm_perfcntr.c
@@ -259,7 +259,7 @@ sample_worker(struct kthread_work *work)
 	}
 
 	/* Inhibit IFPC while accessing registers: */
-	msm_gpu_disable_ifpc_get(gpu);
+	guard(ifpc_disable)(gpu);
 
 	if (gpu->funcs->perfcntr_flush)
 		gpu->funcs->perfcntr_flush(gpu);
@@ -295,9 +295,6 @@ sample_worker(struct kthread_work *work)
 		}
 	}
 
-	/* Re-enable IFPC: */
-	msm_gpu_disable_ifpc_put(gpu);
-
 	smp_store_release(&stream->fifo.head, head);
 	wake_up_all(&stream->poll_wq);
 }
-- 
2.56.0

