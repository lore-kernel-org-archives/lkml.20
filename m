Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793815184;
	b=snU4lZYWU4M3EUzr/vidvi9bOEjq0nLY3K/lupWXrzviX/C4uqX3SMlM9uUUNNZyUpQg
	 6Nvz/c3J6hnnK9NBQu0KEs5yCVC8ysL7rmTd0axRY1qDsxbdaI8mbx43qRZwKX7BWqExk
	 XiR9bS4fJIaiL42BZoacOpjBc1E1BOb3hB2Gz8t737hW3G92vu/sh54hnAYsN7BYPCtwR
	 9jFH6Mq5j06SarbFP2LFcaMTlYHP3zCp0OQ6O+xf3n8oev/PJS3le+ewshWBntpwbRz+e
	 TJ4gwgByQljRB8qZkkIeU/kDhSiBF3pxymJdSLj5EOmrHDiqm08HCVXOAtymUnFuAFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793815184;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=0kJtna4wcqEgrqLio7JSNBMwkN8kE/YoYszBIkhjqHQ=;
	b=1F/g9h2jfWthLUnzeSPgBqz0ZF5OAR7N+SHiNODsOGRab3hx2jxmzID37sGABLDkns5N
	 HxE4VrdAFp9sGZht5SObR4D2K9pqwAvR12tOhySPLP1Nvv4/9k1Pt/4DcZrYqFP+JV9PD
	 0Xnj634zTobUkiK1+2xUhu+6mNX6EetgDFCPpSSm0N9XmIfYJ4/p09883JRg/jjS77Pjk
	 P8rvrcd1WC7RtSYbw4yP3fxk9nRF7ikY6FrRwolASBc7vTZTZjge82M/E/SDpqn5xpZpG
	 pGf8abZ9eBETFk0gc4trbzpOH4vXewMxRTZSWY97WdBh3VVrp1Ls3SaTq23BdeRpYSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=C77WedBR;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ieJYXeMu;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D062606B0B7
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 17:59:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D062606B0B7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=C77WedBR;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ieJYXeMu
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4Fimis3272795
	for <linux-kernel@vger.kernel.org>; Wed, 4 Nov 2026 17:59:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=0kJtna4wcqE
	grqLio7JSNBMwkN8kE/YoYszBIkhjqHQ=; b=C77WedBR525RLOfK76SBeQoQLYt
	RhDUArQRz36WE7CR6PRA0L5hu++WCgbceSaEA8JQ3Nm+chcxSm6W5o5q02h+msJh
	k976oYHHOYxm5ahJdee2WQyXbj6ln6CLDZK9BMy1wCS6DQ3galw/Q1eSmwOyjJMc
	RpFfo2SVuOYW67qdCS1MQnY6PaybtzxvwKblM7ZoqyzApW/NZ+iMUuDnWpJXgCAT
	eiQeZQwYwwRaqE8GyEqxfG8j8fHUKy3ds3K8j0we7ikmNC61lqvc3hwLMy/2Wfhq
	AHzmTsdX43Sr3l3CfBJCtKVtdeWK1Z5uKcpyZZb7u/apWcbzZwLu6sNdj0w==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr6bngxmx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 17:59:42 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ae19907a31so872836a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 09:59:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793815182; x=1794419982; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0kJtna4wcqEgrqLio7JSNBMwkN8kE/YoYszBIkhjqHQ=;
        b=ieJYXeMu5k5w4i+/+IovJ+RK442QS3ip9LI4BjYRN58u19qjVl4b8X6qKk4JKlw1To
         dBfni/56N+qLArLNV58ffZt0RQXAY1ohtu3XfePC4ePc3vmAaVQ/t+3pIrydZCYShVx/
         5dt4Fo6nkqIkKaiTFUdOewEJaecl6JD1nrSh15fVfmDYqe++hdHHFaXv5kW/3h4PdPmQ
         UUHK/zbJQhZNkTo7C0lCkLMgY0U87MjiQb6+3P+9u48O5lZNp8eQGQgE3L3kpHtzeC1J
         +v29jwBEUjgpaFSxiYz/F76D2uMmrt+M9X8JhAk5sN4Japu50VFQ/09a2HW6WOyVs402
         wghw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793815182; x=1794419982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0kJtna4wcqEgrqLio7JSNBMwkN8kE/YoYszBIkhjqHQ=;
        b=QM+nMNZ8/aoulmh1er8Nm0W8HAuG3ZpMgTTPZuyHzNnON6s5qKWhIL1folQb5XujIN
         OMxLkxMUCKLZuU0IrqjIH4cgvlX6unf153Mi6KVEqY7fvnq8xV7N+4C6EuMqXsDApDua
         jxtv8fKijtxwaZp7AOa2KX/cppEvGqkD48YjNgJxZ5ZU9cbsyBeC5RDu33ABXJwjpenj
         n72bfypxHrRkuOEbLYl62BfXMqdJT+tsm3+C6sJQDCZMxpEFE08hMvCK9bY5ZyXbhSpH
         IZsbCdbHdSObeayCNXdq8TisLxAK1rMw7vR2xsG9ye4eF1aCZjpCLZAFglLH0hOgjTxR
         xEdg==
X-Forwarded-Encrypted: i=1; AKwUvBxoN3It6a3FwGvy+3um4NwrmwCT+OSO9XHEtLtXlsNMlbEfvt7YPQgblGgD6TYPSyZCfTgAe6XGzPDP7Hs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8liC2jjrtxOFS+maqQs2lLj0EY1XzDGwLwEVkfi18Z1pbz4ZUA
	2ODVDrTOoFNuuB1zlbNa02c/7vKS6lk/Er2JZeATY2p9nxZ6O01SxKbRuinkuczLEuIbbQsaPTO
	ZZklxIYVqt7+SKbYa0mKlKYEtR5NPNmVUkYrLOcZbBtlbINCx0EcWhXBX6WdtGiTwgRk=
X-Gm-Gg: AYBFou1z7iq7UbgBaTnNJ+jCLAvrOF1A91ljIpkirp/4qDYfKdcJSocoUCFHRHkOHuD
	zX7cWyoHThXoIY7Ws7X0hHkqnk2zbhgGnjnwM8DFG+fxJ55aRni4nm15heJnAecGMudnEUPt1iO
	XHR8ohFAK/LcgXQpNX14MgJhtLjzYRT0VnCaZ1AdvrA8aEf+M6qIngbo5rWhGMMUv/8Uxke95id
	pQgrS9OEPYvzJCyEiOmqX8ypdGoSRg7Nr7UGLrU4ia3djpSJ2YN/xr9NDe65YDD225OScOPXeNN
	9uqI+2zOjPfdt7XK5dknbY8iNnGLF127Dx1WbfUHFfrqXsHCbrsStJ/3sDYKo/m7/3xSvo5KeTK
	ypYXJaJa2MX2Ql6p819xHp2wRy2bZU1tNaTruubNz31qh733Cg8d/wKWPCd1aa7n9h5Isnm6CQj
	Cn2to80KKclbC/EjWzZPF9Qg3NNhv8uiDqwiarC+XhpPYp4v3J3aItygVaew==
X-Received: by 2002:a17:90a:d884:b0:3a7:96d:feaf with SMTP id 98e67ed59e1d1-3b0afc2932cmr100934a91.16.1793815181995;
        Wed, 04 Nov 2026 09:59:41 -0800 (PST)
X-Received: by 2002:a17:90a:d884:b0:3a7:96d:feaf with SMTP id 98e67ed59e1d1-3b0afc2932cmr100917a91.16.1793815181490;
        Wed, 04 Nov 2026 09:59:41 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b31638fdsm46607a91.8.2026.11.04.09.59.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 09:59:40 -0800 (PST)
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
Subject: [PATCH v5 4/6] drm/msm: Add cleanup help for disabling IFPC
Date: Wed,  4 Nov 2026 09:59:24 -0800
Message-ID: <20261104175931.28475-5-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261104175931.28475-1-robin.clark@oss.qualcomm.com>
References: <20261104175931.28475-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA3MSBTYWx0ZWRfX0kSRDr+wGyWt
 +Zt6lLzNZZ9sSWrEZWOr3MqJZJmhtvbcZRh2k83dbisguTHwNRE2TK8rO3Bs4q947pT124xZg04
 lfPF+QQxzgCHWNsU00jp0mKxzZkG77V8AR0kqKcbYPbAfXMgpcZ5AOHfA22KcxVu05w2R4z5Qn1
 d4Yz1Ta1r+q+7FKb0jh6Ax5yLQd2K3UqP3h6FpPzN20sSVc18Mh7KjEqEh2w4O6/Gy1sRWpLEXg
 qgONIpCBciT0zw+AhjjxM/AnDcmqsrwsRNbz5nl0EuimHbaYBXwb+cMSPqGTD70rBhlJU5vWupm
 ECQumLhMMx9cJo2qKp6xVGEPFJN6hE+ATlQ4uxDM8JwQeSeGzrgryBcrJMI15HDI2HZJjXrHO8s
 yeqIpQUTJYdMeML0sSopYSA66ncKA5gpAvwHfK7A0ttE46CsDGUf5aH2F+is69vpv/TQIWj1l6D
 FYflqXmI8S2dZmKB/KQ==
X-Authority-Analysis: v=2.4 cv=KLLPn1Fo c=1 sm=1 tr=0 ts=6aeb728e cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=pGLkceISAAAA:8 a=6dFaWfunYbwioYd2EdAA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: z-zabDeT6CVo2_WTnGabN4XDxJ7ioHNo
X-Proofpoint-GUID: z-zabDeT6CVo2_WTnGabN4XDxJ7ioHNo
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA3MSBTYWx0ZWRfXzvB/eE6vGmJN
 u5x51qN38zA+hre4UVEsldMtrACxw1/IdN2p88gJAc5wyZZExRcPDsAH+NHIR4zOMXHhmksgg5a
 3Xq5O51XviWXQgkoYNIZDM6zBEvAHX8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 phishscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040071

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
index 8c2454627a8d..65d202e12bf3 100644
--- a/drivers/gpu/drm/msm/msm_perfcntr.c
+++ b/drivers/gpu/drm/msm/msm_perfcntr.c
@@ -266,7 +266,7 @@ sample_worker(struct kthread_work *work)
 	}
 
 	/* Inhibit IFPC while accessing registers: */
-	msm_gpu_disable_ifpc_get(gpu);
+	guard(ifpc_disable)(gpu);
 
 	if (gpu->funcs->perfcntr_flush)
 		gpu->funcs->perfcntr_flush(gpu);
@@ -302,9 +302,6 @@ sample_worker(struct kthread_work *work)
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

