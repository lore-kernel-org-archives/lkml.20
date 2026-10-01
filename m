Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B0224F3EDB
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 11:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790852612; cv=none; b=kDp1KO+2LFc6J04/KJWtB0Lf6kwkBInKIPvW+xwsBAGJ43zEuMJ88Qi49CxFHCJuJVACysEsI+SlS6amOmSqt3L3j0Y4y9tEAIFEqD0q6v54Ne498A354yymle0YRNVpHGtehHfDWxvuy8CRwvYmWk4f4+lMK+13qcV5xL/IXOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790852612; c=relaxed/simple;
	bh=M2C1CF0+disfT8oQMkP7WKHBlsGzbjF2RKL9u49pDr0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TwKNyGNpg9q8Q6R2HUfAX7NrLd9Tpgmi4G1o7HsMz3fEdVIZbS2poS5v+UN7iICIqDCwjM9VcE+MdXz6KX3rbgG1iGBUO78xHs8lRjxuxtKu2qLBQCOn4o1xZEB1Lx61129qCMMEVSfrEOhz8NEPqbMeIKUqCpgSIcUAPENYjCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O6lp05z5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d4WYYBLt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O6lp05z5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d4WYYBLt"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6916xLGv1932301
	for <linux-kernel@vger.kernel.org>; Thu, 1 Oct 2026 11:03:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eGc+1XZasCjJJ34Ux+DA3you0KI4TDtPXI3qursqlJQ=; b=O6lp05z5w8IcUKkz
	LsXpM80vH4UKYt3XRX+EQsJF0sGYUyGRXK/aZ1hAxqGdN35fmAI5ZquL3bz+m7AO
	K5JUQef4ywYjYbA8Og/3h+MbE3hIqh+3Nx8PFaYukJ0RonJCrRXtceClFgxFaaAU
	BlukKCvmlpD/uJb95gOrfqEp448AVYUCd7yDgyiOaWBH+ec23OFmTwAJBc+fglFD
	2+xkStPltPLGsbHyXTCenpdlskMlkfW2js0qvx8iTsbs8Au6jidbgarBpQ1EPuow
	Gi3vXSHQ5OnUaKb5IPSTSLRgxWKjUstHsDcbg9YM3SQaNpEDrP0ilathehEUVanG
	Fb/AEA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1bh5akyg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 11:03:24 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39512608fb1so10175904a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 04:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790852596; x=1791457396; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eGc+1XZasCjJJ34Ux+DA3you0KI4TDtPXI3qursqlJQ=;
        b=d4WYYBLtp517FOO7VzeYTPAu83yzXe50jyex7fIgnIDeiex/Nhkuvzj1K1/GqF1vkB
         O9UiCtfLxRNqpR7YzIvZwMCiSvCx9VIz/sySLfd0lZ82MBT19D8K2aaDOIyZ9+2sLipw
         n+1uQzAZRZz/3rxfl4NhLyZrGc9kEgufv8tXdKYuV57+b6ZG/XnRiaXI2bCKnglpV3te
         fRSnbCMjkEoXdj/2fP1jDjv22F5/v/XTf7FEIhQTwz3YjhMbyjSGO4hmdk3wYu9WZQEV
         UXcCeFdmCN2qd+9WQh81+4/JD9oNnPZsWaBMcbp2MlPPW6abmZ6qeLQfYhggwRT7b8Zg
         Ip/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790852596; x=1791457396;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eGc+1XZasCjJJ34Ux+DA3you0KI4TDtPXI3qursqlJQ=;
        b=VWkVOA3ARmQvzN6BoeHGLeqELL57J0FYYwV/c3UcG5vCXNSncQfiyUC7hmwtlWm7UN
         i9phxzaU7eXDgYLKOImG+f79QSiR5dgTw9BVY7eROafju59nX1b6TUp5VaUJJRG6Ri0t
         +X00vW33QbbWru7p4DVU0/Qwtj6+HrjyhDt0uXbrQTRbfRqzc5EtAlOh/RW36MeLsKlb
         1AmUu1W2BNgQQFFQsg63G5J+W52Ud1iWbWw+Ewq8+qBSegfYy7v2NvZMZ/KxMCHjWLXP
         VOHUml6oDGd4VmOZPG1oSE2abp5YSy7Vu7gbDOM7Gomt5C4mEkxWccawe0frNR8HIrRl
         FttQ==
X-Forwarded-Encrypted: i=1; AKwUvBxwXfjs/ICqiVl60Oeu3Jt1nvm60y1sSIeWO5hlH+AeYHhDwAwFtvbOsjo2IfcEnxAUY3qU3PbKY3UG+W8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKkQMrqKb8h5N3Hq0BTGfPiSKG6tLmy0MjKp5OQtP6Z/cVftW03
	wnPSck1YS6NoyS6KdGCUz4OEZI9mqK2w9m/2JZWHU5cM57iRZ6e0oJH3doSjxhLXJGhqVXDp05+
	9JFCIaVBDzym95Sm3BdhpDbRFRgzj6swIHfoQb5ZLTtXv1e6kzfI7IR8ovcLJZvepXXU=
X-Gm-Gg: AYBFou1A9cvVzLYXZ85ocPqH0FCLt6XO+bof0bCnBrV9EubuGE/OwJ5Y5h4bSNAdObZ
	TcDokI8w4DDFqYighVrRX9kaciNLQYAQGFn4So67DKnSr6ZNOJD3fawXjmH3aj0ZrIblpqpMFLS
	jN6FyPmM/AnJ1xUPD4X7l0amSZegPoQMcWGbpBmmB6t4UhnlXwLxYdrtHVgzv6Ok/Q89RIrDXB+
	JDRAkPYQ7/rViH5IgWwrzdwapPcV/qg1EptPz3rquPTOYfBNAT8tbMZFmqMjEGjJU4HyZbwwq7j
	j1ffCvEPZkg9dLEQaf/c2mWWc2JtaH4NLH+CEfDG3Yp+IowgC2tx7RmJMO0zYTK3pYKweDRsaT6
	b3I33dKWIYmM7lskl7c0KM0z3Dw==
X-Received: by 2002:a17:90b:3ec2:b0:39e:6a82:afda with SMTP id 98e67ed59e1d1-3a4d18c4d6cmr3773171a91.44.1790852595810;
        Thu, 01 Oct 2026 04:03:15 -0700 (PDT)
X-Received: by 2002:a17:90b:3ec2:b0:39e:6a82:afda with SMTP id 98e67ed59e1d1-3a4d18c4d6cmr3773132a91.44.1790852595245;
        Thu, 01 Oct 2026 04:03:15 -0700 (PDT)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4f4371383sm4076810a91.2.2026.10.01.04.03.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 04:03:14 -0700 (PDT)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Date: Thu, 01 Oct 2026 16:32:35 +0530
Subject: [PATCH v3 3/6] tee: qcomtee: Allow object invokes from kernel
 clients
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-qcom_uefisecapp_migrate_qcomtee-v3-3-13df5c20c2e3@oss.qualcomm.com>
References: <20261001-qcom_uefisecapp_migrate_qcomtee-v3-0-13df5c20c2e3@oss.qualcomm.com>
In-Reply-To: <20261001-qcom_uefisecapp_migrate_qcomtee-v3-0-13df5c20c2e3@oss.qualcomm.com>
To: Jens Wiklander <jens.wiklander@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@kernel.org>,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Basant Kumar <basantk@qti.qualcomm.com>,
        Apurupa Pattapu <apurupa@qti.qualcomm.com>,
        Arun Kumar Neelakantam <aneelaka@qti.qualcomm.com>,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Harshal Dev <harshal.dev@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790852574; l=6515;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=w6GlevsecVkTd9o5VILCSzOwYDJJ6mD69ARARU8J8LY=;
 b=5Q6KzNKCEBMgcaTCdI1uKIZlLpsNN4r9ptX5GcrbC7riQ7bC5CkPnDy2YJMtBURZhvKIKxZcf
 Z5r7FY4GX4ICDYzMPX+ZmGIKt4k5ulkAaoWTGZ/oY8XOYWtlKHFbn3G
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Proofpoint-GUID: nIdus5_cGnZhfCOtpgoZ8NjXg9gkFBTk
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA0MyBTYWx0ZWRfX7fF9ZmGTsyFT
 TYSVdT6A6lTC06wsvGvmM7I9VOuhRRgS1qq2svxHJpSMEBYAClDlFVM2CqldRTGV0LCAQHkJNXG
 WZAZauM/rcDOUiP6rS+PfAvEmA4yilg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA0MyBTYWx0ZWRfX5W5PTRTeCxdi
 SPNYQs07AtzzxjavXuUKJzV2clG7L2VvUohxdNHT0a8uHk7fZoVVm9SxitpuX+2NAqV1O7J/9SS
 3FPAaPnZ5RUe4FbSMvLXux6duG5hApxFe67kfqWjbb32jz8lP21BXFWBC5Y9E1Ns5CmsUD4qicm
 M95kI1H2RlcqQFoF02d1hsolYweZWKIoWImFThz0Ht7i1XPIXQJXxZ4GA7h0gYo9j0KBoAMRnAg
 UocV5bJFtFxdXfo29XdxDaYkuwtFK4SSxR2kSlX/mz4MAnK3tdL/w876Y7AmUMhKzqimyHbz4Am
 7GslnMNs6M4xAb9gmqnkc08/NZNeFYRgJvRHEjn7wGbzXCYlFjKnstYRq1gxXLK82y0xgjqmR+I
 2e77SqxOoLKmI4/mXQvwzA1EB3dtbrNe2sneoX2cFHgl9FoPN2xoEXf3EP/aHzgrkGKA3ZBSsIb
 0ENfycGOuta+aWvyesw==
X-Authority-Analysis: v=2.4 cv=NuxE4MdJ c=1 sm=1 tr=0 ts=6abe3dfe cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=XyePUiwmHbEyLJ1dZiEA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: nIdus5_cGnZhfCOtpgoZ8NjXg9gkFBTk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610010043

From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>

QCOMTEE currently treats UBUF parameters as userspace addresses and
applies userspace restrictions when invoking the root object. This is
not suitable for object invocation requests issued by kernel clients.

Use the kernel_ctx flag to distinguish kernel client requests from
userspace requests. For kernel contexts, do not mark UBUF parameters as
user addresses, and allow permitted root-object operations to proceed
without applying the userspace-only checks.

This allows in-kernel users of tee_client_object_invoke_func() to issue
object invocation requests through the qcomtee backend.

Co-developed-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 drivers/tee/qcomtee/call.c           | 34 +++++++++++++++++++++++-----------
 drivers/tee/qcomtee/qcomtee_object.h |  5 +++--
 include/linux/tee_drv.h              |  5 ++++-
 3 files changed, 30 insertions(+), 14 deletions(-)

diff --git a/drivers/tee/qcomtee/call.c b/drivers/tee/qcomtee/call.c
index a0f2992c0611..b361d9c04de0 100644
--- a/drivers/tee/qcomtee/call.c
+++ b/drivers/tee/qcomtee/call.c
@@ -202,7 +202,7 @@ int qcomtee_objref_from_arg(struct tee_param *param, struct qcomtee_arg *arg,
  */
 static int qcomtee_params_to_args(struct qcomtee_arg *u,
 				  struct tee_param *params, int num_params,
-				  struct tee_context *ctx)
+				  struct qcomtee_object_invoke_ctx *oic)
 {
 	int i;
 
@@ -210,8 +210,14 @@ static int qcomtee_params_to_args(struct qcomtee_arg *u,
 		switch (params[i].attr) {
 		case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INPUT:
 		case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT:
-			u[i].flags = QCOMTEE_ARG_FLAGS_UADDR;
-			u[i].b.uaddr = params[i].u.ubuf.uaddr;
+			if (oic->kernel_ctx) {
+				u[i].flags = 0;
+				u[i].b.addr = params[i].u.ubuf.addr;
+			} else {
+				u[i].flags = QCOMTEE_ARG_FLAGS_UADDR;
+				u[i].b.uaddr = params[i].u.ubuf.uaddr;
+			}
+
 			u[i].b.size = params[i].u.ubuf.size;
 
 			if (params[i].attr ==
@@ -223,7 +229,7 @@ static int qcomtee_params_to_args(struct qcomtee_arg *u,
 			break;
 		case TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_INPUT:
 			u[i].type = QCOMTEE_ARG_TYPE_IO;
-			if (qcomtee_objref_to_arg(&u[i], &params[i], ctx))
+			if (qcomtee_objref_to_arg(&u[i], &params[i], oic->ctx))
 				goto out_failed;
 
 			break;
@@ -270,7 +276,7 @@ static int qcomtee_params_to_args(struct qcomtee_arg *u,
  */
 static int qcomtee_params_from_args(struct tee_param *params,
 				    struct qcomtee_arg *u, int num_params,
-				    struct tee_context *ctx)
+				    struct qcomtee_object_invoke_ctx *oic)
 {
 	int i, np;
 
@@ -288,7 +294,8 @@ static int qcomtee_params_from_args(struct tee_param *params,
 			break;
 		case QCOMTEE_ARG_TYPE_OO:
 			/* TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_OUTPUT */
-			if (qcomtee_objref_from_arg(&params[np], &u[np], ctx))
+			if (qcomtee_objref_from_arg(&params[np], &u[np],
+						    oic->ctx))
 				goto out_failed;
 
 			break;
@@ -304,7 +311,7 @@ static int qcomtee_params_from_args(struct tee_param *params,
 	/* Undo qcomtee_objref_from_arg(). */
 	for (i = 0; i < np; i++) {
 		if (params[i].attr == TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_OUTPUT)
-			qcomtee_context_del_qtee_object(&params[i], ctx);
+			qcomtee_context_del_qtee_object(&params[i], oic->ctx);
 	}
 
 	/* Release any IO and OO objects not processed. */
@@ -357,7 +364,8 @@ static int qcomtee_params_check(struct tee_param *params, int num_params)
 }
 
 /* Check if an operation on ROOT_QCOMTEE_OBJECT from userspace is permitted. */
-static int qcomtee_root_object_check(u32 op, struct tee_param *params,
+static int qcomtee_root_object_check(struct qcomtee_object_invoke_ctx *oic,
+				     u32 op, struct tee_param *params,
 				     int num_params)
 {
 	/* Some privileged operations recognized by QTEE. */
@@ -366,6 +374,9 @@ static int qcomtee_root_object_check(u32 op, struct tee_param *params,
 	    op == QCOMTEE_ROOT_OP_ADCI_SHUTDOWN)
 		return -EINVAL;
 
+	if (oic->kernel_ctx)
+		return 0;
+
 	/*
 	 * QCOMTEE_ROOT_OP_REG_WITH_CREDENTIALS is to register with QTEE
 	 * by passing a credential object as input OBJREF. TEE_OBJREF_NULL as a
@@ -429,7 +440,8 @@ static int qcomtee_object_invoke(struct tee_context *ctx,
 	/* Get an object to invoke. */
 	if (arg->id == TEE_OBJREF_NULL) {
 		/* Use ROOT if TEE_OBJREF_NULL is invoked. */
-		if (qcomtee_root_object_check(arg->op, params, arg->num_params))
+		if (qcomtee_root_object_check(oic, arg->op, params,
+					      arg->num_params))
 			return -EINVAL;
 
 		object = ROOT_QCOMTEE_OBJECT;
@@ -437,7 +449,7 @@ static int qcomtee_object_invoke(struct tee_context *ctx,
 		return -EINVAL;
 	}
 
-	ret = qcomtee_params_to_args(u, params, arg->num_params, ctx);
+	ret = qcomtee_params_to_args(u, params, arg->num_params, oic);
 	if (ret)
 		goto out;
 
@@ -455,7 +467,7 @@ static int qcomtee_object_invoke(struct tee_context *ctx,
 
 	if (!result) {
 		/* Assume service is UNAVAIL if unable to process the result. */
-		if (qcomtee_params_from_args(params, u, arg->num_params, ctx))
+		if (qcomtee_params_from_args(params, u, arg->num_params, oic))
 			result = QCOMTEE_MSG_ERROR_UNAVAIL;
 	} else {
 		/*
diff --git a/drivers/tee/qcomtee/qcomtee_object.h b/drivers/tee/qcomtee/qcomtee_object.h
index 5f40617361fc..d3740099fae0 100644
--- a/drivers/tee/qcomtee/qcomtee_object.h
+++ b/drivers/tee/qcomtee/qcomtee_object.h
@@ -113,8 +113,9 @@ struct qcomtee_buffer {
  * @b: address and size if the type of argument is a buffer.
  * @o: object instance if the type of argument is an object.
  *
- * &qcomtee_arg.flags only accepts %QCOMTEE_ARG_FLAGS_UADDR for now, which
- * states that &qcomtee_arg.b contains a userspace address in uaddr.
++ * If %QCOMTEE_ARG_FLAGS_UADDR is set in &qcomtee_arg.flags then it implies
++ * that &qcomtee_arg.b contains a userspace address in uaddr.
++ * Otherwise, &qcomtee_arg.b contains a kernel address in addr.
  */
 struct qcomtee_arg {
 	enum qcomtee_arg_type type;
diff --git a/include/linux/tee_drv.h b/include/linux/tee_drv.h
index 369c87ad0205..367208210a32 100644
--- a/include/linux/tee_drv.h
+++ b/include/linux/tee_drv.h
@@ -83,7 +83,10 @@ struct tee_param_memref {
 };
 
 struct tee_param_ubuf {
-	void __user *uaddr;
+	union {
+		void *addr;
+		void __user *uaddr;
+	};
 	size_t size;
 };
 

-- 
2.34.1

