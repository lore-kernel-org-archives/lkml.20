Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793646034;
	b=aaYeNT3X6MojusV7jsVl29Y96KMaTr+MMX5ARSUNyEcObQ6k84CSN7IS96lqx7nFEXu2
	 Ti90uBc+VSOTT13J1IetwvFZOwfjiQkGKOhD/dPwR9lwv8+O7Cqx1INvjuuRgmYR1Ia5a
	 G1AucI2HuerFxHdza4D10yvf3+Loj82du3fbeppvttHLApCvMFwxknz8+5tBvQqY3Ce+g
	 QEFIdhj6vqct5ZFpAqMnm//7sXKnsS38PNqhQka9h64tVohKK5/HvQc1S5l78ZNJyDXp+
	 oRkvydhF5TZY6A5p0PW6R+XBtXFlh24kklBHtp+3VkzEut4qrQaIQvRtGmxjmRbZT5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793646034;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=rxoPTuCm5jnMt/VDeTNC1QYpW68FPUdXFuvA3Ncyf5g=;
	b=1hyhPyJ9E7Tx55WAEq9XdIeEbcQghGMnqfLjz2qe7G036yWm1E3XmJFvuVDZaFD2V/u6
	 QeNZ0i9g9/NtKgOkm68eQsd0QZ3PSOS43y5olvOVFAKhIFcQl2jWOHmvx1olpZbbwGley
	 PL402t4W3zzZEVtpuQEsSqeorKW2KpVNa4QxivQagqK+eYvqXjREJYV43I0JkVrgwTV4S
	 ZeOuiDQa1Twuk/NxB34TzX6mXXxoXwAtOeK6NDAv64edoL3Tmlvfi5o5V6JlMmxZoOOJh
	 VvDdjpMUOwtnbuX90lMIdE7pUl8pr42ryh4oPQnup/nt9ImkR8oPQzOe7NfUNmn0WSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GgBr25bF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KYmZHe4e;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34107606A32C
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 19:00:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34107606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GgBr25bF;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KYmZHe4e
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2HP2LP4000172
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 19:00:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=rxoPTuCm5jn
	Mt/VDeTNC1QYpW68FPUdXFuvA3Ncyf5g=; b=GgBr25bFRLP0IAUuXFu0m92G9xJ
	WkAbzzxapuqVVpxp6QTZ7Atl/tpBJfdDX4ym+ZolImpVlp9TwWYpMx/KlyjczB1u
	plqk7jaUhArgUjotWs2rekgEeHpUEY6bgZcKltIzGP86I6qjZn1dg/z504jN6l0u
	Br3Xx65Pc6pPQYtGCSESXv6SyCsLS9cpzsTdOK7k9kYw8WIHu82yBf2MD6/6yECk
	vV2pdKrTQZ+I54O7uZWW3wnK4uvhkg85Oac9AxjYRYyPr9W2qvsf3O2avJzMZNZ/
	BzALXtkxM3+RrGeyxhwipo9UvjzUWAG5QmKfJ/uoI01SrshNSxgUbzx37EQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpqfrjg2j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 19:00:19 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e8ba4757baso30996485ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 11:00:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793646019; x=1794250819; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rxoPTuCm5jnMt/VDeTNC1QYpW68FPUdXFuvA3Ncyf5g=;
        b=KYmZHe4eAgfaitiVpx6RfcUqt6QXR/1mKzk9/xCV8MlqvCILqdB5w2L4APcWki49a6
         7tZrsrKRA8uuXjL3DfkZ3dP9HtQ0gMgzmxR5mgcRwNMqGZoM3my+xvqd81mUqDvXaUp+
         bCLmcw984iX8zYRJW2GhqukFRtAkQMiJxoFr5gMthkJZvH2WJPY9AeOWi5a9qBYei+vw
         Tt3ET16/wOl/xV4uN0jIG3aDAXuGWb1KMG2K2zX6x/YbIjEBfHGP36cQcAqNpaB7yUzs
         H+IsDA6sJj1qjMy5EKjmf27JSKyWBZ32CCEK7Xg4ed5mQ3LkhrogXLkFlUAfJxcRXd73
         O67A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793646019; x=1794250819;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rxoPTuCm5jnMt/VDeTNC1QYpW68FPUdXFuvA3Ncyf5g=;
        b=QR45xUH5+uo40AGywgiRYyQAz8bd22u7ROCM9dR63f3HnZBT0Fm3xiA4HZ7scW0BG0
         6K6RK6Qj2YAdNOiFxDLy5ToFJeAQOvRBIA/ubbmjdBR5u2U40i2gFM5zPpoPyvrAppAV
         WYv6tHXxGCTABv3ztS0BztvA40l+6rFMbyVDmqejkz9tmh7jaFr3YVxwxtqmYzFmlvQM
         ujOOCcVW8U+HYa7gnIUhE22nnZ0yEMP23qLxQJ+5RtnBQly13qeMOgJCjrFwZVgMezyk
         nRW4TWvOuIqtJWr9J4s84UYF3/vj7FMnf8Es/cGBmDKob4WFBCPUsht/16q0eWjeYJLi
         D8cQ==
X-Forwarded-Encrypted: i=1; AKwUvBxzbyQX3Da3NQ8Dib+HXwJwfIQdjlNcgZzpej/F4aXHj/cZ8lQR3V5XHntE2KqMDir46iINfjsUPVr/ds4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+MUNdE8uG652Q8WI3ek46PK7U2ULMMeVQPRU3xMNO3+4mWUcU/
	LhVs8Oyb9HNDO8kdCUNWfC/BmDXsT+DQvLXNC7BI4qy+pv30I/oPDUX55Rds66SNlzxF6a2fVJb
	03TRrPR5m2MytQCDscx6ofdaB49cFIGjwxOBgA1/hQq/s/baMCMC8aXLQp8smUlHEaHw=
X-Gm-Gg: AYBFou38bdcBgDvcqnuGZxAzzhzfSzCydngK7mlkHY0s7nRlcwndeWJMGoKZ6i18864
	KQMUzaw/oBSJ6lIjNfrp7VZiamEXlvo3Nx85sQ16BmoFf2gUAxyoE+lKPHAO5eZ3FAVo5s1AzL2
	QZ2plGe0BORgKDiHFBtD4fQ0tjfdX/51U3yhcwOWFBLQRZxq+i8hnjH1ZwvkfReQGfPon2ojCaf
	5gQTFzMYbq7BO6+QDvxLS7IP8TRgcB0WUfkvs+9X4sfCrqN0JoAxgAD9t6gr2Vt7wY4VuNZi48W
	EppGAlqytQAq1GkRxwZ04uNJVCXbnHv+P2t0T6KZwQW1ZXQZF+uY00vu+wP37px8Ab5iqsHVULS
	FP4DKpwKL1AD/jFy+U6XFV1LBkvWMH4f1TlPiv/WXXsFGbnQSBZiLX+r+HDWEDGEfPUrRiUEgUb
	fD7S9/LSwpCrLFEdnpncGgVA==
X-Received: by 2002:a17:903:b8f:b0:2e9:5ed2:c3a3 with SMTP id d9443c01a7336-2eb364bfe04mr105228885ad.37.1793646018384;
        Mon, 02 Nov 2026 11:00:18 -0800 (PST)
X-Received: by 2002:a17:903:b8f:b0:2e9:5ed2:c3a3 with SMTP id d9443c01a7336-2eb364bfe04mr105228505ad.37.1793646017926;
        Mon, 02 Nov 2026 11:00:17 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb39230bbfsm31091015ad.19.2026.11.02.11.00.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:00:16 -0800 (PST)
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
Subject: [PATCH v2 2/4] drm/msm: Add cleanup help for disabling IFPC
Date: Mon,  2 Nov 2026 11:00:05 -0800
Message-ID: <20261102190010.720443-3-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261102190010.720443-1-robin.clark@oss.qualcomm.com>
References: <20261102190010.720443-1-robin.clark@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=HMJWhYtv c=1 sm=1 tr=0 ts=6ae8ddc3 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=vTD2gfctXtM-Q-VHBdUA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: 8aj08d0mF2cZ4djH3JdFjXysV3Oy3Y2T
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA3NSBTYWx0ZWRfX/Kun9fyNVO9A
 D/v6aP8jPMh5EW7BxBUrDXoaVwwj2tmRwuHavdioFxy833Yd3mjgiov0MqAinr/LK6fH+He2s/R
 B1aMBUxkEHzxjpeqiu/v42ux3h4UDaA=
X-Proofpoint-ORIG-GUID: 8aj08d0mF2cZ4djH3JdFjXysV3Oy3Y2T
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA3NSBTYWx0ZWRfX75NRPdtM5QSn
 tpG+Gos7sty5rHHhF4UROnLTWmFrjK9+w57KJ7z2Bv/2qcZLTbO4noJZK+Q4mE8LhuC3bzUP838
 g5lN8qDDecyesVU5xUTO8yCt2LmUcZ1nS00IC8QOibcOeGiC36MBxKASESXgKE6NpJ4/K1wJCqh
 zQSpNCsYdvyRKPWopFxnMqcMSelSVx5UxrIwlshmk6waRV0PIbqDyijgvyFMQqCcKEKQmXNlAjx
 1g/2o5B9v1Zv2gqxCFM4peGXY+YhWmr5s8OANpMkgRR7lF2VzhAAaXgq5jHYLXbIKTBmKXxhtqM
 +5pzhDbS+t7JwO97dfLhpDn827JzvqhCxvT6lUHornoNjp8tngRYj6NhZtzTmz+7rqlovvNPz4d
 XQhw9DdZyJMsoRdnLnDr/t8+acRoOQlxJ7P0uduEZd3CuqrZOwPCMiO/R2T+4qrAegOVD0rphxx
 4elD+OZcrBPNySV7fgA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_05,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 malwarescore=0
 phishscore=0 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020075

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

