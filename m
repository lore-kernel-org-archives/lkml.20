Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793747944;
	b=1RhvxO/77o/q3Qnx50SEIxXST0SFmX3eCvH2XUSYfoAyXsRurrZg1FrAOUQW/rIUcQxS
	 MlzTUjGl7ts0UsgTJasgOqIR4GvCN5zweSGd30JHFPCDlLsE+NwMe4+E05feWmk88Ai58
	 Fem4+fS0S8BylsmLAqm3+ucH79gJIuQ1MQ00NiGNnp1XUXrZnkoczl/3/gP7iUeftJx1Q
	 O730NXffWVxBuGXWamQ9FkMUleBMMjF2SFFmwm34KXytgF29QFQPlhGhzjZSEotSLA320
	 c1wkgQcIdoAf9yZiBQ3UsYgqmLeed8fSbfELizGPev1nGSSjtflQvou5GoHPlacJIEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793747944;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=yKmSGK1vSwOyKiBV/4vQNcT9fTTMd69aRbOdB8aI+io=;
	b=QFge13MjLFVQLHYp2Ewg+eXOeW9RPRmM+2GPaCvsEvEzZVhKqaGvVxxGADEx2VtBMWK+
	 2crvDhpw99jajZsQClHioUSS0QmrgEk2hHm/clFgLAo90RnJvhErHlK3P3AmbPulTR5PQ
	 k/tgiLLG7R3AaF01Op/Buhf1xgT3RWUInKgeCfKUTJsW2BZI8ueszr2BAKgVlM0LsR/jL
	 A0UrU7ts3t3ZQLg8vvfLIui/hBvmDn4ZlzFZAe8rs+z8rvp5Gams2JzKX7VidTO0wuMlE
	 ll3GoaClOv/rQ0+9J32fRNHZGGLti/W46a/aVf+1DZgHLlWNP0i7LTydGRSopblyLCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DCItncuV;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Tu3zccI4;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C233606A326
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 23:19:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C233606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DCItncuV;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Tu3zccI4
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3LKnZl2395522
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 23:19:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=yKmSGK1vSwO
	yKiBV/4vQNcT9fTTMd69aRbOdB8aI+io=; b=DCItncuV69iznZs6alW4tmTSTXu
	jeKuFkKmhupsaH8qeC5j0stNhCC+tQIHiSGClsutOuOdfdrtz67gDZpoY98MhHaG
	Q0K5+lPR75o5+6u+3fzgq2+Q7T/7Rz4g7y4vFs6WiKbDpvaHRVIfeH9KXhXBDH0n
	51oT8RQX1eX9uGNRAJ0WgndjcLjB97LIWzAzKDauXUPLbY0DR+gfGMbN0I8TGasC
	9NR3033q3wFQm0PeH9t25mj/fHrN3xdiKsBET6bEV1hQ6pDO+CZ+D7NHn0x6JQZQ
	k5LSX3ROjngUls+XmZerBTVbDU8eVoEVUJHuKHzNgIY8z4jaSLmfxf69aew==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqhyd1vn4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 23:19:03 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc4216aee8fso157702a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 15:19:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793747943; x=1794352743; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yKmSGK1vSwOyKiBV/4vQNcT9fTTMd69aRbOdB8aI+io=;
        b=Tu3zccI4EOe0T6z7Ar0FjmNFPPRcyf2gwKn7D4kmlNZEoTkOEtrhODGFZeg9kCtiBQ
         f7dI1K24uxezkzlRt76eYkDXFLpQmUIKKlkeHSr8tbnobwUumz4uMLb0Aj8c/79pMZpd
         y3kNZeItx0yKaDTg1hxIYL1W+12x4OZCfb1O08lh9pb1RoMfzR0HRtiiT6kQVtxZ5ecu
         8DlaWxV0Zk0tpd0Txl1SR7dqlIVp3u7kJ+q5LNSUr+Hbi8XzbtLKPV8BXn01eBSTxk0k
         MzC0DdYGKNcjuyl2xl8y5NfKt2B+s7VybxTq+lRJBIKCychQnMUWnT+YQkNYtmtGr0xT
         wKMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793747943; x=1794352743;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yKmSGK1vSwOyKiBV/4vQNcT9fTTMd69aRbOdB8aI+io=;
        b=hEUZpADGkAS+m5YvluNEX9cgoeMj8MXLMzNbs91U3Yl0XJ+9hfXKP7ov0JD8SPfH+B
         2SiriVMmdvWL2/yTgB/bo/C+tL08RPZi4L2nzul2viqB6ff+2+RXkN6v8dsSwH1Ad3EO
         flZa/pIH5rOY0y3o9SCYiSVmcoqKf0dBE2c5LJw+uTppX8bkFxEo9b1YYgYx77S0xhmH
         KcBQoLgUeCg+QeUlSI5BnbmV+ogf7mMHqbmJ5SbCJUj527R8OEUMe6pYw+ZsC7H1FfXT
         OopZD06M3gJASCxgxgTlEwSaHbJldO8b3hdaHSwxqE7h8ME2hBPGHi0jKAXI7CVhqW6D
         F88w==
X-Forwarded-Encrypted: i=1; AKwUvBzXPVfsr49LOZgF6gtsgTG4dVdYX3bn3rR0gCN5iqCt9b96zkbcq3kcahaH2h+M+6XIaQMt5mCkEObCSP4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8KTFK5DgOVT3PDkRib9mXqAispDVcSiGxxe5hq/75bG0G65Yy5
	FArUirlBHG+1aoYC5MwoDGZfeH6H+QXChrUkbkQT14fgALLBJx2HVB5nR6jz/BMa2k404EWLE+j
	zl2Ss2Qmsz0s6L7GFcGh0eJzRnR/53v0r3fonTPzFd9l2wr8Yq9k2OL00gpJbSG3dLlc=
X-Gm-Gg: AYBFou2XQBZP/+pc028e1RPHN5SOtsgXKEkMVByx7A1UplbhYHlnROX7U5a1tq9hQBN
	yB+plI0ntsyhiBnnZCkxJ3Pl4o4XAzdGM5aQ/s8q9snRcUOZqAKRpXShnV6Zt0ap6GjrMCFgmbG
	Jk55yOGRzMWnw5QZx6bg3LtKhKRZOJbveer3abHbxMHJqvX15q6orfcND+f2mRCTRP2soVt1Ggp
	s2tQrd5mSr2r7bOa129bL3+R4ZtO/k7qM1xYhP/Z+YbvFbaEWMofKR3YJEuyq1V3CaAAbUZozgh
	DGCNmk89CBXLbMOwrLILgiDx1eqXbWKIdTPS2nxGLVUTfB1K9N/DlJ1EXJpxSMMR4CgoDV3ypPu
	5GnDWL259KThtkv2QHQ9uZfQ0yTwOXkvU58Jp+YHuwzhuOa3nWii8VYqW0hzo8bcINGPVrAkNGm
	BQUQWxuHRMkH033DlOlRxnWMTT81EzNMckkw1UtrPMwvySR1W+uX75yrx0Tw==
X-Received: by 2002:a17:90b:5286:b0:3ad:a8bc:20cb with SMTP id 98e67ed59e1d1-3ae8987d2d2mr12910039a91.66.1793747942836;
        Tue, 03 Nov 2026 15:19:02 -0800 (PST)
X-Received: by 2002:a17:90b:5286:b0:3ad:a8bc:20cb with SMTP id 98e67ed59e1d1-3ae8987d2d2mr12910024a91.66.1793747942398;
        Tue, 03 Nov 2026 15:19:02 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b09452d89bsm501759a91.0.2026.11.03.15.19.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 15:19:01 -0800 (PST)
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
Subject: [PATCH v4 4/6] drm/msm: Add cleanup help for disabling IFPC
Date: Tue,  3 Nov 2026 15:18:43 -0800
Message-ID: <20261103231850.17493-5-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261103231850.17493-1-robin.clark@oss.qualcomm.com>
References: <20261103231850.17493-1-robin.clark@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=bp/Zl0ai c=1 sm=1 tr=0 ts=6aea6be7 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=pGLkceISAAAA:8 a=vTD2gfctXtM-Q-VHBdUA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: Rl7g6mtzFGbb1BXYq2N7bqJrwPcLIJNl
X-Proofpoint-ORIG-GUID: Rl7g6mtzFGbb1BXYq2N7bqJrwPcLIJNl
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA5MiBTYWx0ZWRfX7jNONTsCfU8h
 FaJCnnsupMGoWh92Roz22DtNBq7dtiepga9BowLvzP5V4mk0l66XLDnJun9teXWqba3gO/O4UAR
 g90D5NuAg4deluh9iIfD6GFiks1nLec=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA5MiBTYWx0ZWRfX4EqubmTMiKhC
 GqBVgda7+Ng/tifQy/flbz/c3cmuyQ+yH/RnfSgCtU3jWEwcsj4imUo6QXVQgglferIlTalkOou
 ehh1vBhuclIlNxDrwfjEt4FuwAS15q1k/hubN3K+cBKysr9M5EBCd1auS9UDJJSsCnIT2v7vCne
 61gzOIKP+25vHZWWD/KAk/9bfef02ug5t+0EQuRyG4Wm9HuUM12+cJAmOO3gkqMhSBqm4mmuB6P
 vhxHk2KbJokn/TWgKtjmLgMBC++pt1nt+btTb370Kg4jM2A/hK2mttnsMXauZ68RqxZ1fsjpbjc
 VYJPbx9yRPNqzhqwsoWGdaJ1VP64RqdZ/t/d7dkm9lTgg/a9ogu2aZQikm6xNhFKfc9MpzfnOe5
 GcuX+iSQImA0ynI5EnOHS/2qyD4s1VXFHBwXvph6In/DSSrN4fLipoLVLPvJI7WQsgqnOEL9YUC
 NktitkiKa6zAC6/tvqA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_05,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 malwarescore=0
 adultscore=0 spamscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030092

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

