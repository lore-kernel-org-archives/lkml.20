Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794234090;
	b=Vv/2qnYUXAP+7fdug6UnBGq0uykLTplvyReoP+OXGXu94picsM2kSeJIs+FozGlMrTQg
	 aZkkohzwAxTkrizuiMMsFvOwfz/bUPf5SpzgbQVG1uZOplkBCih3sdNC/wpVJH/UjjltP
	 yGm1W6aE6cazNwqaXvKbn5DsqYUoCEZDCpgGkLoMbLFIJKmV8GhasQOfsEkJ1qYEyENOn
	 M/oB4H5uyACvscWJgid5uFSVX6IUHlvpZWQXv5gAMAQ1Ipq63ZiC2BVDzsGjV5hfua6sa
	 ATuYqgRPskKA4eWwF5QAiegsUiSpRb3hg+TJKEnvGoGV2yJ+fZrl7h34NZDwP3yadJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794234090;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=srWWDrFCDRPROXZSUPlVHkW6pI+FqTKkKRI9cL3NTrI=;
	b=AcIfyOEuXbPA/KdZ58VxDTw86HWzakkZjkbp78AQz5K4YzFWS8evb/LuC/XWUQlRBzt1
	 dAW54GMmLyb6ZMMcvMwV/Cew6Zwo9Ki85BaHUegKYoBpqtKifc3f8992Cvsurnim8dASI
	 X77pLOqcEluB0IaEkbbODJ4/dU33rQ0jU3Vt4im8JUyNZBsl13z0MoF6zwLABnQcv22mW
	 OPJFHAnsRrGt5tLXpoJrp9h+1egl+rghRih8h8MqHSCgrrmexItDicjkNkZv4xrtNSuZB
	 yfTH9/W6ed9Gxp2r0dEcePSDp9iBCvOyAge1ivNx50tcLBMEZ3gzMWRcB+oSu234XPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="EW0B4fC/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TO8ncNhq;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61931606EE92
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 14:21:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61931606EE92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EW0B4fC/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TO8ncNhq
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DFTNf023155
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 14:21:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=srWWDrFCDRP
	ROXZSUPlVHkW6pI+FqTKkKRI9cL3NTrI=; b=EW0B4fC/QDZC1aagVKgphxXkVXD
	sZvuRSbIb2abWe+ZD0XMtxLZ2lu5jt3fO85vMF5gYfLR1C02URSB0qI/fkEyS7ur
	nfxcLhppzXKh5lReIhNuS93O7xCg5yyyGK9Sw/NCfTmhVZoKmJem3RvNA54f9bWi
	zAIBeKBfR0pPopwX3KbYrU+9/4Ndc3ZR+IyJoItE+U7tn9KtYFKdyPn9jcakDNfo
	RvIgLmI3rSRRAFWxX7JJcd54QYRiAqFbs0S+geXpmRI7udYtt2q/cdYuXTYL6toB
	6xHn46xtFshVu8bcCInqLFslgcEDkNh6JGHjUUlACz2jhHKRbHW5+hzIyBw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hucydgprx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 14:21:29 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8b97460a133so524546b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 06:21:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794234088; x=1794838888; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=srWWDrFCDRPROXZSUPlVHkW6pI+FqTKkKRI9cL3NTrI=;
        b=TO8ncNhq30LaTQezUhEks0gro4i1GvrFnCWCdzlKyG8tPTFWahEmEWVBq4KXl+DZMQ
         rpJTab499itzGSt9i0QpeTz8il39QiBhmo0J/9fm9/LH1V0Pt0ZGWfJ0jCqbE65tbl/z
         cuoF3NyUWEgAmfhTQN3EqBXtn6FzfJ5Q2yuvp9fnMzpN1yfCovtIkZSnRhJzDwmW2dzn
         JmoW8eAjZex9YGCg5nUEwUl8I97mwE4ppapM0koi1YppY+he4Ef2U648FnGen+k16VsX
         cNCPCae4Li8IJvGUwLTAx33mTD2sxHgtZVuv+4VIcdkeQ36SUdbsD39JEihAgABOZQR5
         /2bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794234088; x=1794838888;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=srWWDrFCDRPROXZSUPlVHkW6pI+FqTKkKRI9cL3NTrI=;
        b=JkLzUw96hKnfFc0jWszKVTBfTY0ldU3CD4Rb0DxFROUVEvyqosXY/yL1lT2sdvVtdf
         83YEecuKg/GbASkvJdfGmeAIVtfI87ATmkqLR61S+K8CjAk5U2vzqXg7rkPE4QcX2aVi
         WxbXcAt5dFtjm1hrKlqGhXC7luxiVZLhly5zvmRFdh86vif+m32lBXqgreOrc1DdeCyH
         wkBRDpgfHS1/sXrh9qMi8Qqr/rvBn+7ymc9Giwo2NJJMT/wJ0uHZjmHgi0o8XhZ1a3Io
         3BDQ5LVNgroATHn1cck832quQGXE4L01rFFBvoEC6dG5MD7VKC+hzBOYLfsIJZnuGKKG
         klmw==
X-Forwarded-Encrypted: i=1; AL+hErGX/goOTzIpnGqlCPHHcavmaJ0VKYGzSjzRtjLlBO3wk/ttC3aNIo0PIlRMSEl6z1B5ooJS9JKt0hSmluo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8jW/eCm6FvHJz6Q7R9njieEuImOIhhfQr4KeB/4BHA06kcX1Az
	+eeCuEX1umSdBfXaMiv5PHNDUpZ2VPz5o2DfuAEejzhxJJ32y+YiMastW16EC7GPassIoldVvtl
	jmRCGnuzfPESOeRehDN5HZWLu5sxRkiAIFEV67LcMvRWHuvx/iDGeNO3poygNQFdqxKE=
X-Gm-Gg: AYBFou3tEaWibg1RlT7+70rSNY/zch22q0bOyDjBDmyM1F2ISs7Brax+H0PCZlU3o9P
	C8+07bPxNV+x2npJhdr3TdLOUDNZ1sxDQMdu7Msbo1clR/+OfP2YWSyWXJOpieP79awGVVk+aOl
	mBp5WnkcHX1P8Mme9A2k5kzEGgi+XtA+P/hOkaLHk2LEgOZ/ModX3DA6G31MiI48ShSNdoQR6KX
	72W8O6DOrX6XapT8MQ9Rtr6HRDmkb8IAQraHRw9CL9eJGTt36dnM+zvoQEBwISUC54Ay+P7AGBy
	cyqOVEj8fYEWI058l8euywAQ7cLWIRm2NGhrdaubNZf8zXBUs9Hme18IdxgNxhjTbOuEEEJBgR6
	REYjPFw2+ywg3BTf3iUwTL3ijRWE7tohLn55Wqh1IxY1+z0i+zflBnS5vfXywITVX/GuJAA4Gtq
	uFwG1Z7KEIdWBx2srbVo+TsDdJEa7DWMHYbdbymHELPSiKiau8PCMRpxRX5mJ3GA==
X-Received: by 2002:a05:6a00:1597:b0:886:cae0:fb6f with SMTP id d2e1a72fcca58-8ba54af5ffcmr253698b3a.14.1794234088056;
        Mon, 09 Nov 2026 06:21:28 -0800 (PST)
X-Received: by 2002:a05:6a00:1597:b0:886:cae0:fb6f with SMTP id d2e1a72fcca58-8ba54af5ffcmr253683b3a.14.1794234087610;
        Mon, 09 Nov 2026 06:21:27 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b64a1e6232sm1454677b3a.52.2026.11.09.06.21.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 06:21:27 -0800 (PST)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Alexander Koskovich <akoskovich@pm.me>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>,
        Nico Angelo Dela Cruz <nicoangelodelacruz@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v8 06/15] drm/msm/a8xx: Allow nonctx reglist to include GMU regs
Date: Mon,  9 Nov 2026 06:19:52 -0800
Message-ID: <20261109142111.256630-7-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109142111.256630-1-robin.clark@oss.qualcomm.com>
References: <20261109142111.256630-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA1NyBTYWx0ZWRfX4u1FcfvBoTcZ
 VYtqz9o7hq1bEsX+3WobG85ZnCkMHcEhNpsjcXpQtOBspb3m7Fs0ffz3oemBXbwTBYHKIh24hGg
 omAUfqqquL9MdASg5eYrWfh+VwcYS/s=
X-Proofpoint-GUID: oqgutMzhi6X8e5bnahp7jefYQCga7xAb
X-Proofpoint-ORIG-GUID: oqgutMzhi6X8e5bnahp7jefYQCga7xAb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA1NyBTYWx0ZWRfX8y/CrbMvJSSi
 MrPC022SEaPOJne5+NaQIvoM6HXFqt7rS4xMZwd89MXYGsxJLNN+zrJBKPsLbCELWaNTzRNOCOF
 YXeax3Rozv2K3INWcGlVxnR9BZZeQ+GQYJCGKT4RGx9o9yEgEXEAwcvlRAtiaRrcezuLanriHnC
 +QeJWC9fym8vw2nBVB8YrlY7aX1SGZSp3lOUdWkEN1pO5rino8Iwy5XKUFPvfIUAno77YSM6kbe
 hPEon7U7068ISR2NvqVkONmouoLD1MCBezb8snVjQv0FStUV93gM8l3TCxly02J6HVwd29I/beO
 ZPrNbwX8rCG4xSzQj0gfeZgExyGP9jOsC5X1ZA6GFGC0KxlyGyQxTmrKJQuxEDTuwy9t2DLLErQ
 U0ogyYP35TD9KXkQs/78vMJ5Qp/HSMDDhGMbXxA8XHj2md626vHzEY4Yxol5RmUF4qYWvsSnmss
 3TU7DpSBvbahxfnIQ1g==
X-Authority-Analysis: v=2.4 cv=XuRvqlF9 c=1 sm=1 tr=0 ts=6af1d6e9 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=cg0wMmP-TNBUvudz7-YA:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611090057

From hw PoV, it's all part of the GPU.  But from dt perspective it is
it's own device with a separate io space.  So we need to detect this and
direct writes to the correct place.

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Tested-by: Alexander Koskovich <akoskovich@pm.me> # Milos (Nothing Phone 3a)
Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index a29f8149493c..59898b49a201 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -373,6 +373,7 @@ static void a8xx_set_ubwc_config(struct msm_gpu *gpu)
 static void a8xx_nonctxt_config(struct msm_gpu *gpu, u32 *gmem_protect)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	struct a6xx_gmu *gmu = &to_a6xx_gpu(adreno_gpu)->gmu;
 	const struct a6xx_info *info = adreno_gpu->info->a6xx;
 	const struct adreno_reglist_pipe *regs = info->nonctxt_reglist;
 	unsigned int pipe_id, i;
@@ -392,7 +393,11 @@ static void a8xx_nonctxt_config(struct msm_gpu *gpu, u32 *gmem_protect)
 			if (regs[i].offset == REG_A8XX_RB_GC_GMEM_PROTECT)
 				*gmem_protect = regs[i].value;
 
-			gpu_write(gpu, regs[i].offset, regs[i].value);
+			if ((regs[i].offset << 2) >= gmu->mmio_offset) {
+				gmu_write(gmu, regs[i].offset, regs[i].value);
+			} else {
+				gpu_write(gpu, regs[i].offset, regs[i].value);
+			}
 		}
 
 		a8xx_aperture_release(gpu, flags);
-- 
2.56.0

