Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792797632;
	b=oaxLHa9dXMYDL8znooqDvAB7yRv8hKZMZR4szssUPqttezAGUDKwmtvLpGCuFoomqhYx
	 tTkndidu/jl3Fb03aXMBvasWXBNiOEziLvWTH+tFqPR6q6rCbUJ2qZ3wZOQHgHOMx6MGd
	 jN9Lr8U7aSYm4WC+WPdUBEQZAousrJK/dw9wMDF1r4wTm/ehY4vNgOgQHvzKs6WXK8g7z
	 IZdP58gdpoBxgdd4M07sp9dTPU1QNcjzXtSNIjFBJc5wYlC3vAiJv4JV5T6uwXy65krCS
	 vJJl4JI5LaLY3sPMnGU7SPHB0v7d+bzVoY2SiyZtUixXSCQ9PMqa7ypWlashYA6Ajrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792797632;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=88pPbfRA5zc4GwTj062kzD+FGSbESoy/XcuBiUAQT94=;
	b=da7qO2QibccIGhlqAk4XYlQEqGq+RJ8cMN4TBABcI/8Cj+wMPJaOKlQzdEwHNyAGVeHg
	 8/wWliuri2WWo7NJAmgFTY9u6vvB6zQfv51IVRpsmIG9ilNgaYNHBARe54+7v0M31SdwJ
	 wrswfDj1jUU53+GhJYFXmCJzc1VEf36IKIfGLLf+hNzBw3FqZLWaqTpZ9ghZ4TIlR28ut
	 h2l64QeVQpS42QmwW12EbvLngFhmd3avrYf1rvDGNBHNNwrrSrAnwQyn6iN1y7it9OtpD
	 e/hfKsrEbezqFnbwXWXusETzvX/ftdLcpvSSnTbho9t4Vj03wlS3dXa+R5mK3qDkuFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fy7A2sLn;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="K02s/3Gw";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BACC606A320
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 23:20:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BACC606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fy7A2sLn;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=K02s/3Gw
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NLv8YQ3683574
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 23:20:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	88pPbfRA5zc4GwTj062kzD+FGSbESoy/XcuBiUAQT94=; b=fy7A2sLn6QPuMTdz
	SzaZV3WUx6BB9wF3Rlh//zJqXm48EHdbcAYTc6l9Kh8FLB/iLm8fVex5RObWgpFP
	s5OuS4jpEV+hC/vNbRXzBKGesRreX+X+DTC8x9mhhZoA5wWcTB+H1spEcJ4tD2ng
	/pHsF1v0OEBi1lTBX939YGAh8Jd8OlKJTpk8R26d8abot4vTC+ZRHPN5kdgCYrdK
	yvebG2CDtKCF91qNt0BveJceR8wYFZeGCVee1CAGQFvrQLwtHvXWjS9pC0w5AZ3u
	TnQcyFZ0wPYlJ5mq45NYn3qSN5sHQ+zhcBD6shjaLnvCchukGy2vSpaJId7UGvao
	nVbQMQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgas6sb6x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 23:20:30 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93ce7a85f04so280052585a.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 16:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792797630; x=1793402430; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=88pPbfRA5zc4GwTj062kzD+FGSbESoy/XcuBiUAQT94=;
        b=K02s/3Gw4QsncMdfca2ei3+VWdIC8p8jVC9EPZUiRmiRUQaLLqAPX2aguw0bVSWVf/
         cVJJQcYv6EkIuN0vB+l7BNDljjQIGNttIddcH6DddsviigQsFE7Clc212G7xue352ep1
         gW7H0TDzd+K0o9CyZ/3U1Nt4QTQHde9pCST9WVAV0mXjRY9MBM4Xjq9HpNuEtSIfVYlg
         gV+ARlaZ30rZO65ndH9cicfqh2FXtNljk19CbLbCjw2yr3EpK3bViupVm/v60mGw5dC2
         N0x5/9UTxOqHvPSD33N5fCHoSN3A1U/MZXhDSwXgDMkbVQ9Znyp/8rFsqsMjT3Gm/jQj
         +zWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792797630; x=1793402430;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=88pPbfRA5zc4GwTj062kzD+FGSbESoy/XcuBiUAQT94=;
        b=jeDrtQU/ymBsce9kwDSii4895UYeFtVmu9BTMSx7ZQKpCHovN+c9EHBjLMFBuzarc8
         cn9maYrPL//jJMQvK7HoYAyOnbePSz0TAMatQ2XsuE/GOc/gSYXx0uIHFp0WyC7dx8D0
         MhAtAw9X50ESlOzMOkIEpLJ3N29JcKEwibcu/Br1v4uVXddMJFbbQ7YfKpIPDNDAFHdu
         OC9MosFm/bEFYQsPNTvbL/Ga/Aq9MYu2lL+PveKm5qVEn24sD3Z+oW7o4oFW27YetcY/
         BH5bmQ4lH4CB0u/BOLn1lwun60lGwCw5pEb1w3wu2EHT+/sWFCgtWhEmjHNSxwoBId1+
         oa8w==
X-Forwarded-Encrypted: i=1; AKwUvBzVYaILYPuUbHmnbpaKLmcDIJxbsxzVpoqPIZt9V5nsamvZ4hzEvlBzUB26vPQbiFLSCS5x7Xz9Q91EqvA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJnM1KP0V/Qm41v9n2i7zV4L7k9g3AG9SzXohT3bx/KvaMKgSp6
	N50fJzntY4nMYINYHaqRpYWHmHRH2x06+PhW7YwGkQHU5DAlbks/5a0FDy8N5bGULVgGRA1h19B
	zVQ+2wLHzG8xfG2WVestAWl3oN3O25t9N3nrGcw1KHyY6MeUkYE8CFFwfcZPJaGnJMRU=
X-Gm-Gg: AYBFou0DLP39yloIJuOl1f3GgZomRCt+w3u7fz+CQb+G4P78ICvwMXzVkT099nwwTNU
	LR1gaK6SRDSGkDKPDrHbUfUitOCmMoG9h+63lunhgPRCr0Ff8qXYnLrfzYkANDg/0K81D/wxLiR
	Kwy02aWHM14mgyOXtFvdTSj5hcV3/QHcVuDZTHdLeid5LHZWmRe5tGp1YonDT2bhbcR6mOl2CLp
	caBBrbbDApmZvTvHPj9iYFyhPK0jw93Pgi545NgRhtdlbFVMm5uFUcui2eeNxD/OhetPcpme1vO
	97k37tthIwT0TZXPo0zM3c69dT4oT7sCD5xvVnloAKsm/hj5Kvx5BVuSOA2hHRgw/EnWspezACo
	viQfmdGtMSHP5t9dt+FF7z3gJeOXlLz0rZOGiaxBIRkfTzN0JtU4njCAMpdJvQUTVWp7I1agTxW
	VbsrBc3eorPa5x
X-Received: by 2002:a05:620a:178d:b0:93e:6b9e:6167 with SMTP id af79cd13be357-940ef8fd205mr91188585a.16.1792797630106;
        Fri, 23 Oct 2026 16:20:30 -0700 (PDT)
X-Received: by 2002:a05:620a:178d:b0:93e:6b9e:6167 with SMTP id af79cd13be357-940ef8fd205mr91183485a.16.1792797629433;
        Fri, 23 Oct 2026 16:20:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac709f3a58sm863811fa.24.2026.10.23.16.20.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 16:20:26 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 24 Oct 2026 02:19:43 +0300
Subject: [PATCH v3 10/14] drm/msm: tear down only a successfully
 initialised KMS
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
Message-Id: <20261024-msm-kms-destroy-fixes-v3-10-66a30120a5ea@oss.qualcomm.com>
References: <20261024-msm-kms-destroy-fixes-v3-0-66a30120a5ea@oss.qualcomm.com>
In-Reply-To: <20261024-msm-kms-destroy-fixes-v3-0-66a30120a5ea@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4509;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=ME7+CIOAsEStPCR8dTr5EHiDhPg+iGJaaA80Q9N32Jk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq2+uVDtLmXeAXGWMPg3cih6TFix+O8APD/LUrl
 Hn18697CkSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatvrlQAKCRCLPIo+Aiko
 1T9XCACOITNUrJb54voiy1yXLyomCqoHGHeeGkipObDQXe7iGzRoeCp2+o8KBTkjSaRgMCYTqaN
 yTYorg/8Df6pff6oQtwb5Byc7ayKxt4RTwJVAC6qauAdZFv7mPYbI9wQzq1SJjGrkwHuCt2yanQ
 8HfFkTGmGcN1eguWr3722FVfWjIKfzFLkLy0MuPzKZfNQ3LWXdWFt/GiJBO5Krd82hRs/G1TTy+
 qrQB9C1ofV1Gh8sfsvcNtqh0GMaCFEJmWO5TzRf4bmPgtI0MXr/0oE6yGy4JZbDuNTVhOdR57N4
 UmhSaswDXTGKdLpiZlftjoTOiuzKI4o4AW5DFb3fi5h5tPq5
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA5MiBTYWx0ZWRfX8e7Bm0dIqpV3
 LkGDQZbBWxtYTxm7tKdKQFmC2B95J7OiY0NSBDdr6HuQFW0wVJmhiv03JEzNyzg6b27507p8nwp
 O4utBGkPdds91YSfKoI8zUCY/Bo4Ay5/dRyc1+CKmG3XoMcZ/tUweLqsN4f4yYi/G1Z8Hl2xpwQ
 DbkRgxtoIE7NqenxIJKNw0Lfjyp1ygP3tUpMnE+KidUHGxBoOh5+TuD7XbWICTj/q+ADtVloh7E
 ArSHcdg4ovASaDJLMdpCj9UGImR6Tvy0X9QIa7srFQWZKvNnFeLwjYNG2FI6d05mQQWq1nd1Eo4
 h0y++M4YpoADVim4A4d5WaKxjJn7r4Un4lIdzsUR79IP0fpA7YpiVe5yc1JYEdFCNGt05JZTocQ
 lApmX3wbilpOBtaErgqHjzDQuVK+aCnM2cav0ZBNbt4YQ7BXXe+yTDnssb55yNBLgl04kBzz79j
 d+3kphSOafyHJyYLiHQ==
X-Authority-Analysis: v=2.4 cv=DK0acCNb c=1 sm=1 tr=0 ts=6adbebbe cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=mlEQwpWygrYFFZNu1HYA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: Z6bzxv6Rcy1amhqsaZR8amKbGv4NzpNG
X-Proofpoint-ORIG-GUID: Z6bzxv6Rcy1amhqsaZR8amKbGv4NzpNG
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA5MiBTYWx0ZWRfX4O7DlO2TYb74
 EcWQOLh2oWfEXeVW57gpFfZRNyxwpqYkJx0ALbxFnlZoPKuo+EPdTOxmcEpsYNkhp64e4x3LHpq
 EB0NR49TBzFhZcvePfHK6cAd+sc+MM8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230092

All the kms drivers now undo their own failures in kms_init() and have
folded their hardware setup into it.

Drop ->hw_init(), call ->destroy() only for a KMS which was initialised
successfully, and remove the flag which let the drivers opt in to that
one at a time, as well as the handling of a half torn down KMS in
msm_kms_destroy().

Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  |  2 --
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c |  1 -
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c |  2 --
 drivers/gpu/drm/msm/msm_kms.c            | 16 ++--------------
 drivers/gpu/drm/msm/msm_kms.h            | 10 ++--------
 5 files changed, 4 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 255beb83fc94..65ba8fa697e9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1290,8 +1290,6 @@ static int dpu_kms_init(struct drm_device *ddev)
 	int ret = 0;
 	unsigned long max_freq = ULONG_MAX;
 
-	dpu_kms->base.init_unwinds = true;
-
 	opp = dev_pm_opp_find_freq_floor(dev, &max_freq);
 	if (!IS_ERR(opp))
 		dev_pm_opp_put(opp);
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
index c2172e5f9e85..c1f61ecf800f 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
@@ -409,7 +409,6 @@ static int mdp4_kms_init(struct drm_device *dev)
 	/* TODO: Chips that aren't apq8064 have a 200 Mhz max_clk */
 	max_clk = 266667000;
 
-	kms->init_unwinds = true;
 	mdp4_kms->dev = dev;
 
 	ret = mdp_kms_init(&mdp4_kms->base, &kms_funcs);
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index 30af8ef51e4c..c349eedd55a6 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -505,8 +505,6 @@ static int mdp5_kms_init(struct drm_device *dev)
 	struct drm_gpuvm *vm;
 	int i, ret;
 
-	kms->init_unwinds = true;
-
 	ret = mdp5_init(to_platform_device(dev->dev), dev);
 	if (ret)
 		return ret;
diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.c
index e4d61935a6df..9a207c1e8583 100644
--- a/drivers/gpu/drm/msm/msm_kms.c
+++ b/drivers/gpu/drm/msm/msm_kms.c
@@ -293,17 +293,7 @@ int msm_drm_kms_init(struct device *dev, const struct drm_driver *drv)
 	ret = priv->kms_init(ddev);
 	if (ret) {
 		DRM_DEV_ERROR(dev, "failed to load kms\n");
-		if (kms->init_unwinds)
-			goto err_destroy_snapshot;
-		goto err_destroy_kms;
-	}
-
-	if (kms->funcs->hw_init) {
-		ret = kms->funcs->hw_init(kms);
-		if (ret) {
-			DRM_DEV_ERROR(dev, "kms hw init failed: %d\n", ret);
-			goto err_destroy_kms;
-		}
+		goto err_destroy_snapshot;
 	}
 
 	drm_helper_move_panel_connectors_to_head(ddev);
@@ -347,9 +337,7 @@ int msm_drm_kms_init(struct device *dev, const struct drm_driver *drv)
 
 err_destroy_event_threads:
 	msm_drm_kms_destroy_event_threads(kms);
-err_destroy_kms:
-	if (kms->funcs)
-		kms->funcs->destroy(kms);
+	kms->funcs->destroy(kms);
 err_destroy_snapshot:
 	msm_disp_snapshot_destroy(ddev);
 
diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
index 2f097e23e2e9..b5e1cd38cd8a 100644
--- a/drivers/gpu/drm/msm/msm_kms.h
+++ b/drivers/gpu/drm/msm/msm_kms.h
@@ -23,8 +23,6 @@
  * for constructing the appropriate planes/crtcs/encoders/connectors.
  */
 struct msm_kms_funcs {
-	/* hw initialization: */
-	int (*hw_init)(struct msm_kms *kms);
 	/* irq handling: */
 	void (*irq_preinstall)(struct msm_kms *kms);
 	int (*irq_postinstall)(struct msm_kms *kms);
@@ -149,9 +147,6 @@ struct msm_kms {
 	int irq;
 	bool irq_requested;
 
-	/* set by the kms drivers whose kms_init() undoes its own failures */
-	bool init_unwinds;
-
 	/* rate limit the snapshot capture to once per attach */
 	atomic_t fault_snapshot_capture;
 
@@ -214,9 +209,8 @@ static inline void msm_kms_destroy(struct msm_kms *kms)
 	for (i = 0; i < ARRAY_SIZE(kms->pending_timers); i++)
 		msm_atomic_destroy_pending_timer(&kms->pending_timers[i]);
 
-	/* the kms drivers' ->destroy() also runs after a failed init */
-	if (kms->wq)
-		destroy_workqueue(kms->wq);
+	destroy_workqueue(kms->wq);
+	kms->wq = NULL;
 }
 
 #define for_each_crtc_mask(dev, crtc, crtc_mask) \

-- 
2.47.3

