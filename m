Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792769522;
	b=jeQL0VE3Uj4ULxx7K1hwuOmm0U/Q/Fu3+6vMRYg4nOI7E/H43hLASs46Rba6F9/jixOT
	 ZSAaeIkffNWezWrttgy0CL9uocK3H5vQRn43ql5imESHC0koM0WScvR0HYaQl+Q85ugYm
	 kno4yQkusWxjwfTpamqAn3AwcwZ7/JjEW8yt2RoWaHxmdY4tpfam1AwlW9GYUQhg+0izs
	 wJEVWakNTbu05lMCl8cI1o+AnM8dxs02/ZqfE79FXC1Gt/DSSCuPkQVE9pVXFplatYMUl
	 ARW5iOh9KB6CLh53vA4ae3uoOYcME3U1qjS25WmCucCp7wX1ygBPc76B5LcRGIWIgIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792769522;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=qZunG5yy6pTO2DbkEtv1VKnSC8oT+62cq2lapmplUqo=;
	b=ErfFfHcg+LD9SLolfG780OGwzkXZgwcJG16vn2mw4LR6yEFkcdGcfV6Ns4LIYp2Wk1hk
	 2w833cliZ8w0VRVPbGkSqHDkZlSkSaYiB8bPK9Jz5C1VBXmMmocCg3Gs/2kHcafhwfNL6
	 Noj73i5UHxHNjp1q0z4KnOEZya3bCQyFoJZczbmPbOKZljPDN+stK4FIl6AXwLmoOh70G
	 0LRV18N2sOE8sOpo1x/c+WE/oaNHYd3NAyRo8jtypEG6bRy/midYz6kGBhKZEsaAlAmKo
	 Z7H9ejK3M3Y009qyKDVFVJReEzBnwQiR4/sj88qvAgzaECSdkIGGjAz7MYKC+sJOWWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Vi7sK0WN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FeR6mWaU;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AC1160A2618
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 15:32:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4AC1160A2618
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Vi7sK0WN;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FeR6mWaU
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NE65UC1954963
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 15:32:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qZunG5yy6pTO2DbkEtv1VKnSC8oT+62cq2lapmplUqo=; b=Vi7sK0WNtWQdHzsy
	Gets4YpsMR84/FWJuUEyRU/MYOZJxghldPvauQ+WmZIWC5q85FlIJSD3a3iPewcV
	qVY1gahd0vS4HkQXPXyOYLyT+kanyWz4AU5nyfzlKD49HwPaMH8WTSreHBxes85v
	bvMRMv/4k1rwvdsZViZcIDOHq5QJnfiNJltnbMPtkMPQEYwVLdjAIuZWTomcGSJV
	5luLdqVUsQHoYb/zpC7yz6cJ+5i1+C5Jxe33SGvdpeckf+hiJ4/nusDx2fUBWQby
	QH9YcpWagByyQkeViOvvliOoC75ehXZtbju/KfvS4FwZvcUXsa9SSjgy/pfINOPu
	U8d03g==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmbmbvs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 15:32:00 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-99064f8c7efso768631241.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 08:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792769519; x=1793374319; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qZunG5yy6pTO2DbkEtv1VKnSC8oT+62cq2lapmplUqo=;
        b=FeR6mWaUj0c7ACbBvUUbbpmoLqkdn349vBIOHYGyqsZh/xUamr7BVJEsGuQ2YxRGI4
         qp0/0SoBn9kjyKK0InYxWc6qePG58t4BYjo20omp6KSbGeP4N3FoJTulgMMT8hCvM0Ff
         nofqtFi3DvjAjUS+9DPM6e0svjbqHCCGo9pSUi5QakgrMKTT+UZdREpFkEDbmgzhAeHD
         3u3uaVe4jUC3LSr1V5YNl2trGWWf1hWcuedJ8Ta42tqX92+FDu5TGkiMc3N/i+xV8MJu
         vjB2VQSXM9KaEdhmsb5EaXNW4brYGmuArgfBfx0jjfJEmaL8QoYcGQKhgF3a6yAPYldd
         3uSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792769519; x=1793374319;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qZunG5yy6pTO2DbkEtv1VKnSC8oT+62cq2lapmplUqo=;
        b=gDMqBNesSuB8PL/9j0LoNI6SHmvgW7rNC713W0BIAZdp86H8W0Kj7cZQJO0C2YsVeF
         nCGh7nq/WwbpbAb/HUH7ZHEfbrV2fXLfCwaey4eLtLGhgx3FC7ihNZNDqB06tBDgmnSP
         nlBS4ssVrmbkJXRgrEb/h6Hqfq2W5xiL9XOKkJD6LEHF26VT1niexYgNSVs5lSUa0SEG
         X3c3yWiNKouUvykOR2TuQW5yyaiaA8VrjxIvKmcKLktcLOj7cQeyemxYZjI9d4IXGirB
         F2TGpbX8P9b4h6GroD5NOSEGDzZ8pg81kZwdm+sqTuMUQ/CWZ0cdQkwAP/BBULw/DFdt
         0DbQ==
X-Forwarded-Encrypted: i=1; AKwUvBwLbz+AuIxBySaHeWd0igro9O2PGdeDsmioeCkxOcp9vZj3Cf8LJxMrTL5KwZkUodKi0f6eioAYBbHCCZA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLNwSF6J8Db6UmUedWJjxwm1UKtQ0tYFD8HRXgoVZz2iBcyYIoq
	YRLzLLR3Mmlc7kTahOpuqg9KW6JsgVACKKkIgZKyyQ1qKN/yKr5fiNmFqbXA7i86XVYuASSfm6K
	mHNPNOdImx/3dI+bWPCyjKDoNTlPaeLV88rIzWimkowtlP4IK/TBfsAPyslT3/uQdALo=
X-Gm-Gg: AYBFou0bOUlmdp3ZxHa061TAAFVLj34Ncvaz0uI1SLJnStw/9iRwelaklHcJO25ftiZ
	J4/9y28rHQnDt/c7F05FtqaruY6LNOeYlnYQcNvtCEUTO8LA2wAxJ81FPgGZfcCXXuEWkLo5X3x
	yS3doqSjAv4ok3Jg1QR/wPvNzTyjRwqOaHlWvw1rv4OaKKzpifU09s1J2jN7ghvJYmca/j9KdRY
	ZxMkWYTzM2Nj7FoIWrdX9AyLMiTh10L3lhWZIIkvdfQPMfLmVYdI/LgKIfdwwHtJDyLIaOyTHde
	MGx9T2l21oLtf0Y6RrFDuDYsS9hm6Meun9RfpZ0IRbEfpsjmyK9k34DpLYhFYE1yqP1rTSVrqpw
	dDhfcU3GO2o9C0Vifgug1knziHaittkZw3Ur7rIEAWh+k8zCFe59fI7T3ruNW+D9B8LFLjYFW7L
	RYqDZfAoFndT9A
X-Received: by 2002:a05:6102:570d:b0:7cc:3eb0:6ef5 with SMTP id ada2fe7eead31-7ccc31aac14mr1052327137.11.1792769519434;
        Fri, 23 Oct 2026 08:31:59 -0700 (PDT)
X-Received: by 2002:a05:6102:570d:b0:7cc:3eb0:6ef5 with SMTP id ada2fe7eead31-7ccc31aac14mr1052302137.11.1792769518924;
        Fri, 23 Oct 2026 08:31:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb0288806sm478062e87.55.2026.10.23.08.31.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 08:31:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 18:31:23 +0300
Subject: [PATCH v2 08/14] drm/msm/mdp4: unwind a failed mdp4_kms_init()
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
Message-Id: <20261023-msm-kms-destroy-fixes-v2-8-83727c122de7@oss.qualcomm.com>
References: <20261023-msm-kms-destroy-fixes-v2-0-83727c122de7@oss.qualcomm.com>
In-Reply-To: <20261023-msm-kms-destroy-fixes-v2-0-83727c122de7@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5971;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=pQFgWanoVOPU1SD9eoh1kwmHhNTamyaQG3R5/Cs4y3w=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq233WRwV1Nx7UujDseXGQBGM8nNMWB3vz2nTgE
 4ZCtfQXErWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatt91gAKCRCLPIo+Aiko
 1QFAB/9iOnE5dtT4rUrAk5VrFsyu38++IvedCVNLH08Ap8cOOOrtfOaz71QP1J32M6kZa8tBl+m
 2YclTWgKFCVTMP4WfliUamp99N+eSBwqvIucwakg5XS7gitbR5z4ESK6NwYTMafdp57JShh90/J
 42iVIjf12UiKK+m2dz+ivg8qYu9JRcrATXu6adxZSw3p3KWyowJ1eQS1ZY2yyreT+6dL5G0mcFg
 gjirvdVOO1/CrOs3T2F3cPLkK3zz4kyCnjJ3b4FJ8uFWUixDJ9crwcI5ATh7d3O1vVLRqcxflJC
 0Pw+DHa/Hmm9AP48J48TS52+i9oMZkp1y3uOkWmLBTHqT+Y3
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2MCBTYWx0ZWRfXwavz3V/Ow9lT
 njqWj5fh2Bat8U1fJJQwEcjO3beWPn1+Gi6tI+i2GBvLHr7EWw0NZSgDQpqoa7PT9pFne57pPdj
 8XYs3+VK81Zp+4EQ/bCGmGFciVKqyCI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2MCBTYWx0ZWRfX0nft+YHb2dif
 f/YT95xZ3TIiEaEeq+3R9tiTDJw9/nd0kuCYZ8C0nsQb9k1B2NKB6ZUzG2TvvzgGI3BAxd+PODA
 BZXCb6o5I9zwAMW0mqsuJ8tSZRh3aMFYWpotUO0NyfxtJCLhw1tntoBOXGZEagTh5dX6RG3aylW
 yRPPkD7wHtqRaLh/RVNxbJetfklCyD/ohNALHeKXINOvNzb/9gEYkg/DQfRyNTdh7f3oM9pgkd+
 9CTXTx4uJuzQVVZxMeTjuGyUTM5YY5UjqZbW2/H4SOnzbhwVQI3PNchvEP0Pz+ceQCtE9GC+FMJ
 vVcsnNwFfWA7diQc7TA86gBbo7gi/slEXVGymVLIl8E21zvggTlSrT2lHyA+FT7TO7O0Z2AlWsC
 Peb6zgm6mhojWJE+7Ddg6qDy7YJX3cspcDbCXbUC+l5cbaEiolBgZoPvslh4sV5OERWwjZH4hcy
 AE5JHL+eBSf/2EGhxcA==
X-Proofpoint-ORIG-GUID: ma1AFQMfJWO1AaqaZ1lzoD98LjOcnuvE
X-Authority-Analysis: v=2.4 cv=Nt1E4MdJ c=1 sm=1 tr=0 ts=6adb7df0 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=j6QtfvlM2Oj41uVX788A:9 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-GUID: ma1AFQMfJWO1AaqaZ1lzoD98LjOcnuvE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230060

mdp4_kms_init() returns straight away when one of its steps fails and
lets the ->destroy() callback, which the caller runs afterwards, clean
up. mdp4_destroy() however dereferences mdp4_kms->dev, which is only set
after mdp_kms_init() has succeeded, so a failure there turns into a NULL
pointer dereference. It also leaves the vdd regulator enabled.

Set mdp4_kms->dev before anything can fail, undo the steps which have
completed, in the reverse order, and tell the caller not to run
->destroy() after a failed init. Fold the hardware setup, which can't
fail, into mdp4_kms_init().

Fixes: 93c125e4ea98 ("drm/msm: don't tear down KMS twice when KMS init fails")
Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 61 ++++++++++++++++++++------------
 1 file changed, 38 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
index 9b1d1982e683..cc6f202aa011 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
@@ -15,9 +15,8 @@
 #include "msm_mmu.h"
 #include "mdp4_kms.h"
 
-static int mdp4_hw_init(struct msm_kms *kms)
+static void mdp4_hw_init(struct mdp4_kms *mdp4_kms)
 {
-	struct mdp4_kms *mdp4_kms = to_mdp4_kms(to_mdp_kms(kms));
 	struct drm_device *dev = mdp4_kms->dev;
 	u32 dmap_cfg, vg_cfg;
 	unsigned long clk;
@@ -70,8 +69,6 @@ static int mdp4_hw_init(struct msm_kms *kms)
 		mdp4_write(mdp4_kms, REG_MDP4_RESET_STATUS, 1);
 
 	pm_runtime_put_sync(dev->dev);
-
-	return 0;
 }
 
 static void mdp4_enable_commit(struct msm_kms *kms)
@@ -118,6 +115,15 @@ static long mdp4_round_pixclk(struct msm_kms *kms, unsigned long rate,
 	}
 }
 
+static void mdp4_destroy_vm(struct msm_kms *kms)
+{
+	struct msm_mmu *mmu = to_msm_vm(kms->vm)->mmu;
+
+	mmu->funcs->detach(mmu);
+	drm_gpuvm_put(kms->vm);
+	kms->vm = NULL;
+}
+
 static void mdp4_destroy(struct msm_kms *kms)
 {
 	struct mdp4_kms *mdp4_kms = to_mdp4_kms(to_mdp_kms(kms));
@@ -127,12 +133,7 @@ static void mdp4_destroy(struct msm_kms *kms)
 		msm_gem_unpin_iova(mdp4_kms->blank_cursor_bo, kms->vm);
 	drm_gem_object_put(mdp4_kms->blank_cursor_bo);
 
-	if (kms->vm) {
-		struct msm_mmu *mmu = to_msm_vm(kms->vm)->mmu;
-
-		mmu->funcs->detach(mmu);
-		drm_gpuvm_put(kms->vm);
-	}
+	mdp4_destroy_vm(kms);
 
 	if (mdp4_kms->rpm_enabled)
 		pm_runtime_disable(dev);
@@ -142,7 +143,6 @@ static void mdp4_destroy(struct msm_kms *kms)
 
 static const struct mdp_kms_funcs kms_funcs = {
 	.base = {
-		.hw_init         = mdp4_hw_init,
 		.irq_preinstall  = mdp4_irq_preinstall,
 		.irq_postinstall = mdp4_irq_postinstall,
 		.irq_uninstall   = mdp4_irq_uninstall,
@@ -386,7 +386,7 @@ static int mdp4_kms_init(struct drm_device *dev)
 {
 	struct msm_drm_private *priv = dev->dev_private;
 	struct mdp4_kms *mdp4_kms = to_mdp4_kms(to_mdp_kms(priv->kms));
-	struct msm_kms *kms = NULL;
+	struct msm_kms *kms = priv->kms;
 	struct drm_gpuvm *vm;
 	int ret;
 	u32 major, minor;
@@ -395,21 +395,20 @@ static int mdp4_kms_init(struct drm_device *dev)
 	/* TODO: Chips that aren't apq8064 have a 200 Mhz max_clk */
 	max_clk = 266667000;
 
+	kms->init_unwinds = true;
+	mdp4_kms->dev = dev;
+
 	ret = mdp_kms_init(&mdp4_kms->base, &kms_funcs);
 	if (ret) {
 		DRM_DEV_ERROR(dev->dev, "failed to init kms\n");
 		return ret;
 	}
 
-	kms = priv->kms;
-
-	mdp4_kms->dev = dev;
-
 	if (mdp4_kms->vdd) {
 		ret = regulator_enable(mdp4_kms->vdd);
 		if (ret) {
 			DRM_DEV_ERROR(dev->dev, "failed to enable regulator vdd: %d\n", ret);
-			return ret;
+			goto err_kms_destroy;
 		}
 	}
 
@@ -421,7 +420,7 @@ static int mdp4_kms_init(struct drm_device *dev)
 		DRM_DEV_ERROR(dev->dev, "unexpected MDP version: v%d.%d\n",
 			      major, minor);
 		ret = -ENXIO;
-		return ret;
+		goto err_disable_vdd;
 	}
 
 	mdp4_kms->rev = minor;
@@ -430,7 +429,7 @@ static int mdp4_kms_init(struct drm_device *dev)
 		if (!mdp4_kms->lut_clk) {
 			DRM_DEV_ERROR(dev->dev, "failed to get lut_clk\n");
 			ret = -ENODEV;
-			return ret;
+			goto err_disable_vdd;
 		}
 		clk_set_rate(mdp4_kms->lut_clk, max_clk);
 	}
@@ -452,7 +451,7 @@ static int mdp4_kms_init(struct drm_device *dev)
 	vm = msm_kms_init_vm(mdp4_kms->dev, NULL);
 	if (IS_ERR(vm)) {
 		ret = PTR_ERR(vm);
-		return ret;
+		goto err_disable_rpm;
 	}
 
 	kms->vm = vm;
@@ -460,7 +459,7 @@ static int mdp4_kms_init(struct drm_device *dev)
 	ret = modeset_init(mdp4_kms);
 	if (ret) {
 		DRM_DEV_ERROR(dev->dev, "modeset_init failed: %d\n", ret);
-		return ret;
+		goto err_destroy_vm;
 	}
 
 	mdp4_kms->blank_cursor_bo = msm_gem_new(dev, SZ_16K, MSM_BO_WC | MSM_BO_SCANOUT, NULL);
@@ -468,14 +467,14 @@ static int mdp4_kms_init(struct drm_device *dev)
 		ret = PTR_ERR(mdp4_kms->blank_cursor_bo);
 		DRM_DEV_ERROR(dev->dev, "could not allocate blank-cursor bo: %d\n", ret);
 		mdp4_kms->blank_cursor_bo = NULL;
-		return ret;
+		goto err_destroy_vm;
 	}
 
 	ret = msm_gem_get_and_pin_iova(mdp4_kms->blank_cursor_bo, kms->vm,
 			&mdp4_kms->blank_cursor_iova);
 	if (ret) {
 		DRM_DEV_ERROR(dev->dev, "could not pin blank-cursor bo: %d\n", ret);
-		return ret;
+		goto err_put_cursor;
 	}
 
 	dev->mode_config.min_width = 0;
@@ -483,7 +482,23 @@ static int mdp4_kms_init(struct drm_device *dev)
 	dev->mode_config.max_width = 2048;
 	dev->mode_config.max_height = 2048;
 
+	mdp4_hw_init(mdp4_kms);
+
 	return 0;
+
+err_put_cursor:
+	drm_gem_object_put(mdp4_kms->blank_cursor_bo);
+err_destroy_vm:
+	mdp4_destroy_vm(kms);
+err_disable_rpm:
+	pm_runtime_disable(dev->dev);
+err_disable_vdd:
+	if (mdp4_kms->vdd)
+		regulator_disable(mdp4_kms->vdd);
+err_kms_destroy:
+	mdp_kms_destroy(&mdp4_kms->base);
+
+	return ret;
 }
 
 static const struct dev_pm_ops mdp4_pm_ops = {

-- 
2.47.3

