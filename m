Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793395195;
	b=RKA1f1zAQCcx0nYDOE4aQmrK3q0D1+M0sfN2DbI/fGhwIQcauuGIsqA8FMKcDF4lp6p9
	 xceEKQZSKzWN25TSwc2QM6SCCyOLlpCaA307lWG3wwkilp+nl2fb+B/gEP9339IGydbnq
	 ECRmM7RBMB2dAEeehWe8dbtgEJnHcbtCZgfeWjZQ0+S1j0FNbfq1ISGFIl4voqpkQMdBr
	 UM7wHAoJqEWxTj5TKSaLrqSVvYAC2ISwtaW/RsbfJFlv5pDms3QkK7uFA+HeeGwMI3YbL
	 f7plNvzDKrR6iL+zlp117hjPLHRbIzDwROnaTpQojXArYMpJc+btcbGaFRAh2uQeHNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793395195;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=qxjIA7KASQhGhn46iliBMgwf2sYMP5ZuywBwiiD60Wc=;
	b=yXmI1wwQtHT3gnFn3MuUxH8fiDQF+Umkk36A8BgymxyGsu07CvEuOdOtH85q5N6GGFcI
	 85UESt8Mmabt6NduoltdmCzDG6+HymMUCabHvlE7VCMsuRx7EevjmvSOfhsoH18cyVMg1
	 QJZYvJHhvoit2sfKX9Z8pepo47wgVDVXxI7+PkHq8fvrKpVpH9IA+SgqEhkvtDq/pslxt
	 3ovJvKnKQ7e36A6sFce9bI7gVHjHVcGahdekTSOSVgi700fIeu0iLx6fWoHWBgRaJdZeg
	 vxYNgk+Ef07vioZJMhxcwkdjZV4zn9ZYuB7gOlL/6TSf8capoNfJRm6ed4OJPV47aYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GcWSIzdl;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FCmqv5OO;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 307FE60A5BDD
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:19:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 307FE60A5BDD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GcWSIzdl;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FCmqv5OO
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69ULBijX801927
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:19:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=qxjIA7KASQh
	Ghn46iliBMgwf2sYMP5ZuywBwiiD60Wc=; b=GcWSIzdlPZ3On+CQgsWhHT4B8Qp
	RCegYtt7nTlBGo4L2ZgKWuHEwyQ9Ii3VroLy9hOaJFdpUL94slVibfGE2FsEqsL0
	rjC7VIj0y0rHJR3gdhdKzLXyz6/4SD8o+UcERsMLDcOk+SprAnpt3vXzL7il63SD
	ZcJcttP1XNPXWfiDYN1uBdHJTsQsfJFajvoXoNXX9Wvk1gRpIa5PvkE+9u/VLrEm
	FwBzLS9fSlg00wyIfZjSG4Ylovn5haaSx5+QScSYKsogs99DwMcItaviUwckejio
	c67Joyy05q8itkFUBXNGotqDPEbu3NF0C6yunxDu1PhlRlzc+oqWSdPaxNw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn2x1018n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:19:54 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3adad90c894so1230850a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793395193; x=1793999993; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qxjIA7KASQhGhn46iliBMgwf2sYMP5ZuywBwiiD60Wc=;
        b=FCmqv5OOn92YMnKFuWbewj7n4VX4hXTc0bPDfvnhiBcn9Hwn0HtBGFrihmtXuR9cPh
         K6WrAGHgp4HLZc4UZrfRHo+Bo4YFsql/n3FoKEKmm99vzbA6BKvEIUIbY87TGz5Jzp6W
         ODiF6EJjGiEZ1qqE1xMCjPO/fysyNwAJTizeRBvNAFa25wbry4ZMw3rr/qaF5kWKj2bD
         WttTwUOqzH8DAh2PaXYBpuhz/GFj+yJGMX9xjG+ElF+mRgKVGxznZYZHD89/5NxYness
         s3ubtOMZEa86duL8nPeV+I1TnTvqfSXO9eOPNX1LETR1j/UBBJeUqt1kDb0B/cFlGl4w
         tp3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793395193; x=1793999993;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qxjIA7KASQhGhn46iliBMgwf2sYMP5ZuywBwiiD60Wc=;
        b=bx7XaB6dVoxYlssFBimAKqvWrgHga9aoJYLkd0ftvXiv+uuj2X3xMGbr7vJrIo4ymP
         J31NCrg2t6ZG57OuA7BlfTsdRhO9PWpUqvHUT9T/lL5X6DAjLkWPjJ5oNebvvPC2Cprm
         mdpdhpxthHPToHzVd7s+pBROtUtrej1jEkwPkYv5SSbicIrCy6mgEqWvB+0qA3abfkBz
         P2RSjM0+vE7pOL5tSl+wJ7GuP5BV9JIsLBNdMalZ8+FcpAABgkTrpphnzvhBLgs2Cq9O
         lYa5FS8ns+O84C47YycdT6jaQYCd2QoUI7u+HAAlW2mV0kpaLWj0pCNjTG1EdFtrYNmC
         jAXQ==
X-Forwarded-Encrypted: i=1; AKwUvBww//y8aQQfQAaUpyN95qerjS/BSOWVLRfY+cXh4UI9bF92njZH42v/IR/YOvkUI4juGXUmF9Md4UJMg/Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYL3ghbpY/PuMv+zQ6Vp36ouYeMvp2rGxVdp7VZlooN/tDthrqbG
	Qek1xDzV926G1JxED970sm2zfoAZgKxpbxtmCfqQ6vZGFaXcR9G7Zzv8lnDoG8wu0bgUP6FOsP3
	RMJqOPWwTTfULWnhftino4DyDF9qrW0VPmfUnIhDeCHLeChIMKvGpDvzRgsBsIFLHsog=
X-Gm-Gg: AYBFou20X1hNjXJjF0TAesfsRIw/wnsty/MoTJwIcYcjzlNRmGZJPygQVVp/JUnFASL
	YHx8x2e6w9VxsvcK5g54JsHoNTsCHLOmKQWOSPYjljj04NmpGTO8LvTN89fAUPJ3tuuGFC1+KH9
	kE9bT17PDHiV0J+AhvQ6rIOHa6gLSQDmC5CvywO/VrgnKasI3M4G0LQwmuZeNLJXW5zYDUIOoFz
	Lp/MDWaKUKT8GcJHqqiZhJjbAGWHpuXZMCh4owthafc5XvSxrP9lNQdLQUBSQvcE0SKpa3L0OKt
	einRZPwqimJ9d2O6twixR1ZZSYx7zE94YXOcxfdxDfY2xNunHU7PSTNN/ZXmK2w2LB8Yz+1oNKA
	cNFffQXXtV4Mh1YLYDTTEMNobZw3iDQbrDp3ED5MiyGzwtfDo556sRovhEKGp7KxkDIiaAXZEpE
	GG80oaIotFnJGzeK1bACvJe3E=
X-Received: by 2002:a17:90b:17cd:b0:3ac:b7b9:6471 with SMTP id 98e67ed59e1d1-3ae8987a7bfmr2897299a91.65.1793395193364;
        Fri, 30 Oct 2026 14:19:53 -0700 (PDT)
X-Received: by 2002:a17:90b:17cd:b0:3ac:b7b9:6471 with SMTP id 98e67ed59e1d1-3ae8987a7bfmr2897278a91.65.1793395192916;
        Fri, 30 Oct 2026 14:19:52 -0700 (PDT)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae845429e6sm5310288a91.6.2026.10.30.14.19.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 14:19:52 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Alexander Koskovich <akoskovich@pm.me>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 10/19] drm/msm: Add cleanup help for disabling IFPC
Date: Fri, 30 Oct 2026 14:18:12 -0700
Message-ID: <20261030211928.45761-11-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261030211928.45761-1-robin.clark@oss.qualcomm.com>
References: <20261030211928.45761-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA4NSBTYWx0ZWRfXwM1BspyGUPsh
 /+fe3SiY3f3Cs6ycA+O3iCT+ZiRMmZ3JuioeLxLl2noUXMC8V3yF+MKta1DId6VISWM1Wi4Zmvm
 4ZSsupe29icj9ZPJo4ktTyRdUKk+C3W2gEXzjqnz8rI5CDXFzvJtncnduL3IXln5gjsb3oI0tAB
 TICi/NGwb0xumKy8zyOY9GHT1GE5vggLqmG9/TdtpZ+Wm0J/lTiyYKNsFG0TzR+RE/nIXX1WJJm
 myVdirZB/+ByLEjHURAv6bv+DxPxVuS5qcDarD3zKTAl2g2HWODfEjW/kM+sAhweeWePZlwI5He
 a1cjPJqZeEpo2cAyCiTOhgAv9hzm8mCmfz+Yho3E+OO9isFT80ayo4uwflGj6gkMQ4stFDmP9uj
 uXLWw5P2KpiC7JkkUn619k7aKMHBiw==
X-Authority-Analysis: v=2.4 cv=CLG/zhrD c=1 sm=1 tr=0 ts=6ae509fa cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=vTD2gfctXtM-Q-VHBdUA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA4NSBTYWx0ZWRfX/jaS9X7IHfAp
 9qYd2LHPpzfpde+dFsi2GD8HryEp6uYe32AQOUbBGursLdmAiCOqGumlCk0eQRC+ZGA3zkXOORU
 +40K9X07YHpVPakZJ+4WZ4jUUAGQRcs=
X-Proofpoint-GUID: ZxL8evBDtdK_C3Xrdri7vyfQVQbUUy2R
X-Proofpoint-ORIG-GUID: ZxL8evBDtdK_C3Xrdri7vyfQVQbUUy2R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 suspectscore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 spamscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2610300000 definitions=main-2610300085

Simplify error path cleanup for IFPC-disable critical sections.

Note that this moves where we re-enable IFPC until after the
wake_up_all(), but that is harmless.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gpu.h      | 4 ++++
 drivers/gpu/drm/msm/msm_perfcntr.c | 7 +------
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 2e1b1bea37ce..4e18c2427c69 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -381,6 +381,10 @@ msm_gpu_sysprof_no_ifpc(struct msm_gpu *gpu)
 	return refcount_read(&gpu->sysprof_active) > 1;
 }
 
+DEFINE_GUARD(ifpc_disable, struct msm_gpu *,
+	     if (_T->funcs->ifpc_update) _T->funcs->ifpc_update(_T, true),
+	     if (_T->funcs->ifpc_update) _T->funcs->ifpc_update(_T, false));
+
 /*
  * The number of priority levels provided by drm gpu scheduler.  The
  * DRM_SCHED_PRIORITY_KERNEL priority level is treated specially in some
diff --git a/drivers/gpu/drm/msm/msm_perfcntr.c b/drivers/gpu/drm/msm/msm_perfcntr.c
index 7b4a6e49d3a7..995857273aca 100644
--- a/drivers/gpu/drm/msm/msm_perfcntr.c
+++ b/drivers/gpu/drm/msm/msm_perfcntr.c
@@ -259,8 +259,7 @@ sample_worker(struct kthread_work *work)
 	}
 
 	/* Inhibit IFPC while accessing registers: */
-	if (gpu->funcs->ifpc_update)
-		gpu->funcs->ifpc_update(gpu, true);
+	guard(ifpc_disable)(gpu);
 
 	if (gpu->funcs->perfcntr_flush)
 		gpu->funcs->perfcntr_flush(gpu);
@@ -296,10 +295,6 @@ sample_worker(struct kthread_work *work)
 		}
 	}
 
-	/* Re-enable IFPC: */
-	if (gpu->funcs->ifpc_update)
-		gpu->funcs->ifpc_update(gpu, false);
-
 	smp_store_release(&stream->fifo.head, head);
 	wake_up_all(&stream->poll_wq);
 }
-- 
2.56.0

