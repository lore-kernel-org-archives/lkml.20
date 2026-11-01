Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793555217;
	b=D8PyDeg6BldVnRihoccTaSbsmf3lyLWp651UYG7GFJFFcUkqN4Hj9lXPWOXCK+KS8xvp
	 92bEWWAfX1u30lBa5qipwiIp1cCCXwPi15HWeeoqjiAoIz41tbrurfgVzRj6YwGjp3qNw
	 sWcb5iPU07W+mZ6avfLAglNk5buQ3AUmzcVS/a51rzbTwQhRTaxfor0MAVI7XZj7dU0n0
	 NScDOk7lo0FS1X6lpkPUMHVvDyFcXKtGqjmb+xgIHrNdQbyHd+Hr06XxxnJdMkmHE/95S
	 YXwmdA7909ilKN13uo3rpJGSVdOxPI/uT/Z+7bVmNBhyHJ2qPWDnU1PXv6MpttXH+8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793555217;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=rxoPTuCm5jnMt/VDeTNC1QYpW68FPUdXFuvA3Ncyf5g=;
	b=SuqPLG2BPv45m85rCkmRgfwmhr+7aBfdWTKbg5uXHcgmsC9vwJpIzvF7puM1vmMrHc+A
	 vBRha6ykpVuAEDSjytK6GQ6Opop3avSgCIjt2ZRjFVlP8Zh+/OI6fQr9RAyjTGaqgLD5d
	 b+R5TpouZ0c92MKUZO/iJraUQM4qwVLFQRZhKg+PFk+UUrqDhFo+a+FcWJSjYoIH4qZLU
	 vasfNVbfHE148Yr7x6oThb8XplmVgDVhwCme5pD1Jn0I7CYefg0gyan5a7PYJIK0nBhQO
	 mxwIm8nvQTqkBSTb0l5MwRfaA5rga5k8sBuC3QPi+bPqIDF7R1lKuAiKeLJF2tPE5+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="TvnYnr/j";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R7CMFDaH;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 095A7606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 17:46:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 095A7606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TvnYnr/j;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R7CMFDaH
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A1HQP2N1413775
	for <linux-kernel@vger.kernel.org>; Sun, 1 Nov 2026 17:46:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=rxoPTuCm5jn
	Mt/VDeTNC1QYpW68FPUdXFuvA3Ncyf5g=; b=TvnYnr/jScdaUcXnfFxUXJQZc+v
	Uarw1ebjlVOFEmTIn/HVkonGPRcHPLZv4m3fFrFDyHF58yHuzK96URKITSeOU6wE
	V0BWUp0sKxVocg/iu6EVGdVkPDwhuRpjFAigAouruPpvZv6KK9iBVactzumgKG3p
	y4GDeak6+QoOEH9dMV+N9S9tKmpmzQE6nvjBYoHtuqmM0J1EEDptfOAee3PywLBH
	y8sC2OAo3Yeg11Kz1iJqAnXv0f58A5WLZhtG+Hp8mZHCNdYTd3QbdNOrHtzaSxsu
	WEQbGBpWjgHthv4/1kqI07oMheIOnXlO4BOlNxFatVmhjcC9L0/qi2oK0+Q==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn8j2uvnh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 17:46:56 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2eb00825063so22382905ad.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 09:46:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793555216; x=1794160016; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rxoPTuCm5jnMt/VDeTNC1QYpW68FPUdXFuvA3Ncyf5g=;
        b=R7CMFDaHMdNW54lqa8A0XZwThCwKzs02omhbKBn4wkRwPCAuzO+DTuBdGaU5cduEez
         +Ur7fKb/rrWpCrXHI4VxGFqsHg/Lrk46XJuzn8Cpuu4VL+3l7J5ypiRZtkilwpCxTGIC
         1/n22wOxevB/wPUzq/hbIfHiSlx6w/1c75ni1RXgL+BVSX/LEHyROfiB5+1GsfRS8f56
         THd+J7/ZKudLR2tcD7+wNWGSlZpx9SUW2AMx9x4J5gIhxYIHVxfaBXVM6rCd9SEZzAHS
         hf5fec85Ai2nK7NukTT3P4vv55VF6A+EMZbNvRJ/icQp3qjbFV796m4S7mGQ5/kgdtAD
         LyBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793555216; x=1794160016;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rxoPTuCm5jnMt/VDeTNC1QYpW68FPUdXFuvA3Ncyf5g=;
        b=mnesDfF07T2NPMoPv6GgDsR6GlWkQOpDULDyTSUAimuMiQa8swTgcKpBo9AE1A5I5V
         EvaJdgiIMMkattW7Et7z9G0TRlCQ6K2zaB4LQx5jbf2dhJMhOTAUK0pb7tQYGo7ZRurx
         MQ0lBF5PsoqM8j6AhRFWmXk2RH8v+2X+uZg1grF+jM/jdb/xynBZJ9VuyWhKHJnZi02T
         nRveujnrH45fM+QLbDeb52y1B64RCdfIVNuQtJshzoqYw4QjONtmROlw/yDKQ1WUMcjY
         0xog4pKfcjeSsKCjCQMCMaiLFAnQiCW+w/5Sp2SsLB7K+MZze7Z6tsNmc7bo/KtFFlE/
         eCCA==
X-Forwarded-Encrypted: i=1; AKwUvBxtUVfNZNrH0DEmmW1ZuJMX4bfMmEmQDtgaf/Rsp8w3wKrCuwZ9sQXjl3u4YTOJNpChD6ff2yhHW5JQE8s=@vger.kernel.org
X-Gm-Message-State: APuU4Z+IK/DHPewyv4UBNaVW0bESYZTH5FoNDRNSty2M+M/+wwR7yoOE
	4ERtKgpvElb4YuKZlp26pLnYPxbob1j/r2WFjBGkf7fcD9nAVJSIA8XJY96evEvjPT7P7ZlzCR7
	c4iXPhJ3F0fmFCWB41LlnpgSpKU58qYQXQuQzf4Hfn1WWi0KQpPb5+1vkzPfhVIGH8jY=
X-Gm-Gg: AYBFou38NeCXAKMgShGBIk4sCTckW1wxV5Jlcwztt1feCiN/PWcej56h9uh9dU6fENl
	nDPeAsjHE6cydtdsSPyNR8Pe6PYVG//T0PIiA/rh9ZKwVRdHk/QAHfbLbao0/2HPeyqMd5zGN/l
	0kEl2iN0+0Xzn7e1r/3ZXQ8VyrvMhn7fmTVd1Lf5AFpOxwjav3ECHCsPRkL+bsdj7avnbH389fl
	Bo0+i+BKnJbzkCBCF2Q02Pz9QlievOKeEtuj0DRP9KF3ClyYRrACE3DOi1bhvxEa36akLqOmHrt
	NZUTHxPTQvzmD9aDX06ce8P7Cwc0bomxbJ1okuh/kNHve/ETOcd8jnihTjCr9mvWFwnfZV2hglc
	Nr01CulOGglVdCMYAqhHU/KT54wZKCd5/XH969GWrQDB1YaBRpHNw0gkvi0ZvUSvPwzE/RDeVN6
	vGtDpD5OTSWfkg7COGBqey7w==
X-Received: by 2002:a17:90b:4ad0:b0:3ae:3e9b:5265 with SMTP id 98e67ed59e1d1-3ae897585bamr4535976a91.26.1793555215657;
        Sun, 01 Nov 2026 09:46:55 -0800 (PST)
X-Received: by 2002:a17:90b:4ad0:b0:3ae:3e9b:5265 with SMTP id 98e67ed59e1d1-3ae897585bamr4535959a91.26.1793555215136;
        Sun, 01 Nov 2026 09:46:55 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae85cb91e5sm6133348a91.0.2026.11.01.09.46.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 09:46:54 -0800 (PST)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Anna Maniscalco <anna.maniscalco2000@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 2/4] drm/msm: Add cleanup help for disabling IFPC
Date: Sun,  1 Nov 2026 09:46:26 -0800
Message-ID: <20261101174631.23637-3-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261101174631.23637-1-robin.clark@oss.qualcomm.com>
References: <20261101174631.23637-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-GUID: plGEn25Vicc7KLAYnC6wCBFwHEd_TtRL
X-Proofpoint-ORIG-GUID: plGEn25Vicc7KLAYnC6wCBFwHEd_TtRL
X-Authority-Analysis: v=2.4 cv=S5RMU4sP c=1 sm=1 tr=0 ts=6ae77b10 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=vTD2gfctXtM-Q-VHBdUA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAxMDA3MCBTYWx0ZWRfXyJsZryJWcTUw
 YTRmNiAyMaPBPIJoC8liLb5u7V+4pwmArEDGP5WCUHILlInIVjwB+X8LeXmOBMHd8n8j4HBRb8D
 RY0nW2qM8uj5em3q2Fjj9yPPdXn51h0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAxMDA3MCBTYWx0ZWRfX45W9gdJMKGv4
 +zQNe16asTpP6ev7v2TeLEB2G/5zeDZsJgnNrKniVyTvoLkqNuPYc+oNznRk9smBeDBOJucqGwn
 AT+/GN9/DEEQWovii7qtOHFYJ6Nx+/hmz9poWu1G9LAqU8YE+8xKsMTwYIqk8ga6UYX8CkaZgWQ
 MpM4IJwPCL7jKRQM7dHGkQLsL78lJwr0s+2Me2ENgD9EVjEuoVkVf9P3LpDSvIkhGQGJR+Hbbmk
 9mJATGeCLJ3aJMSc8rVs3soWhi8mzaYPPeCbTYhyGXyTlaB1R8gHUxeM4BXAAS0WZ+bOnCdXnPF
 zOs8dkrUVtyUNLlKtLXcpfrGtoELw2bFTgcTY4/BWg2yRodXTpCuzNQc7YLNtkkqdnqb3htlOfh
 qnyFK9VAOJXUDSxnYEn4XNjKCNQHs5IQGZ8YzZV8F1/e00qBLt5Ukof/KQj13yA+sKtlXT6BZpY
 VJBD08AeeA9i/rlg1Fg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-01_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 malwarescore=0 phishscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611010070

Simplify error path cleanup for IFPC-disable critical sections.

Note that this moves where we re-enable IFPC until after the
wake_up_all(), but that is harmless.

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

