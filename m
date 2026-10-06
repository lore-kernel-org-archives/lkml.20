Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E1083D891F
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 11:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791286448; cv=none; b=Y2Msoc/HORFSwZz5/MD8khW3CKnY60bw5Bij6Er8hZAaTE8p2qq6J8OMCuwjbFGjlFpb+9/zbOUeWvsfjnm/sL1mqhFcOhrXVF+3QLgFVk6w26gdzV3VLN11wdIjmWfZbGcxBHIrcyKP8A9sUHjDbTA6jXfYxDHKtakhQGa0HY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791286448; c=relaxed/simple;
	bh=ND+1mAauHCpeEOGzRE+jBlJjOIKD3T7c7XKJWlJyL/A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nFvEgQiF/Cflb5FfhZbtwEnajZYRFwdUSpY/G1c42FePgEC5+tnmYJJ0PHWJV5dJOhnlybQBi4wqy6m0Ts49IquN/87f0NdgecY1838BkvMvA0WaqHQj8pYIlfwq99rRxP11Epwb124oszczej84vnMZ3t9XPSClSWuKcebIqGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JjnOcmMs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P3z38Y0D; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JjnOcmMs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P3z38Y0D"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 696BPQO01172370
	for <linux-kernel@vger.kernel.org>; Tue, 6 Oct 2026 11:34:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jqjozfXj9kneHvAFPbQFagxM9e/DSE3jCUTbtNQnrlw=; b=JjnOcmMshwO1jJ0E
	2ZX3faNtoxsg5+FbGJoK6OEoLySklBvYjmiDZeWm7/fzaXLmRewdjMls+bMF4EQL
	eEZ/X92qKRJr+UQJqrVadijcoOEvIkFMPELxls6Zf/5NyEeP2ADNhlRyAh+NTdaI
	qnNWWRziy3TKrp+t8duFbyyTJi6zXbHtQeehHYtNI/Ck4/4Dj54M/Ovy+cFD9mJb
	eqHgT9win1ge+5pkk68pFsSVN81j/fXgjWqNo4ye0pSrO1Xw3rBsmEnLgliXdgPq
	aFQtavEyEAFurKr+vb0gzU8P5AQK6gWCWIDfRe/WuDLFH6r04+0n/2P6cKAB5Zdf
	oa+cIg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4xwwr8e8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 11:34:04 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3823dcc1647so2209309a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 04:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791286444; x=1791891244; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jqjozfXj9kneHvAFPbQFagxM9e/DSE3jCUTbtNQnrlw=;
        b=P3z38Y0D0LmDe4XJyKUcYwfbZ7NNmNdx58c6H3D8rOUTyP/WUxXN+YU54zkO5o1Jda
         cJqTgrPmnky6LZd7dD7fVotZsgnzl/kzCTzfDAg2SfjA/SgI2JJt9ODFs+xNxDDbgUNk
         lBEUaqFF2487zZIIE+7fhcuk8+yGz7Aje1tM11IyrmNXZFl/p7mNkmC7osNkkuP4YSe5
         HJDn3poDJl4g4TJGqiGFEkLikLmdCx/wONlPW6yLGfdc2Te0EWdXeK886jwySXQlSDYR
         Ca3ypnQYA8uMhLMibaDK8Zkk2aTuUU0ncZHBuhims6Y+S/8A4Ug05H57zjExQOpfxwIk
         OiGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791286444; x=1791891244;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jqjozfXj9kneHvAFPbQFagxM9e/DSE3jCUTbtNQnrlw=;
        b=ZgzEOB45PJI1fbilJ4Us05LF5j/860PO2ulX6gHGd9Ey8CkfXXy4zMjXto+mzFx8p2
         NFna802TBPVyMkFPZNeTZTXgUpmYy74NBqh3f/7t6GP2ZxzpoxouH6w9wZBwTwCMN2f1
         9H9UxW7Nxw34Xkuap4MGBkmO+VgDoFnhQo4a9k7HJHkfOJlIv8eCdeuTpHLjC4mwV7fX
         PQR+E4gsSJdCKUrmSevimQRCvLtXPahQSd1+iy1bIYnsVX342g9ZQdLqjZ6RmbJjb2N/
         rjXonLacURXhX6AqjqetfNA6kqdo3miz3Sox9CjOo6TJI8UzwRUKhOMZEFawsqrMPBZI
         U31A==
X-Forwarded-Encrypted: i=1; AKwUvBxGWg2fsQWeKrigYaUFUv7Pyxh14HLbvvaoxQ8542LkasSL1EZEtOwhWqQ7kylweoADaNS5twPBI9j66BM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJUTgaPx0SdSfi1JXs3lHXEjxUJlVm4qsvnCoUU3KOC4ZojeSLr
	+L44FFkLE6cA0lbt14iMqWMDeYgJCu0wvyMbeDhWCbjuOBIEhvo1XWnrBaaLDwZ28ShiagaQvrP
	9tZxQZiV253Anvzm+oYcwUOsfvnxJI5oIiiAsxkxpUc0KWs3+p0QJCm1OdUXox+yo59I=
X-Gm-Gg: AYBFou1rc+q7QJ7SsXj5iqCUMuaNVHlMX5YGiqFJ4Ueuun+vBK9bq5vAYzAq7VRCDSA
	UQ5x2LBIKbEH8T35Ha7LWFTPphcTpigWLUd3FknR1BaDijq+CHh1LKlB+7zKGPDUpNXCqdJLG1h
	QB9IrSUaiPc+8CVlk+ZLbqsj9zZe1PQGVUi72kotZZ7B/ccED9xSizaNZ+n8PC5hAPNNXLLK+Wb
	v7PLxTd5jpo3TmPFFUIUJAK1i6ip890/5QLWCPAkIgevBGlwPFezYKQUMPhPXa06PLmd0s8FBf1
	FD2ZZ8/efPSC2QgHQIDSrcpviCa8gq14mPmeKIwi/1z7KLwQyZTKyRzPpvKjT4Z7CQSmSSsPpw6
	gmu+CF7slGucgM8HpuFDAL2xq
X-Received: by 2002:a17:90b:2646:b0:39e:6c69:34d3 with SMTP id 98e67ed59e1d1-3a873729dbamr765305a91.55.1791286443900;
        Tue, 06 Oct 2026 04:34:03 -0700 (PDT)
X-Received: by 2002:a17:90b:2646:b0:39e:6c69:34d3 with SMTP id 98e67ed59e1d1-3a873729dbamr765291a91.55.1791286443347;
        Tue, 06 Oct 2026 04:34:03 -0700 (PDT)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a709a4e80bsm9330092a91.4.2026.10.06.04.33.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 04:34:02 -0700 (PDT)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Date: Tue, 06 Oct 2026 17:03:22 +0530
Subject: [PATCH v4 1/7] tee: qcomtee: Track the object invocation context
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-qcom_uefisecapp_migrate_qcomtee-v4-1-bf1c8e2a64ab@oss.qualcomm.com>
References: <20261006-qcom_uefisecapp_migrate_qcomtee-v4-0-bf1c8e2a64ab@oss.qualcomm.com>
In-Reply-To: <20261006-qcom_uefisecapp_migrate_qcomtee-v4-0-bf1c8e2a64ab@oss.qualcomm.com>
To: Jens Wiklander <jens.wiklander@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@kernel.org>,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Basant Kumar <basantk@qti.qualcomm.com>,
        Apurupa Pattapu <apurupa@qti.qualcomm.com>,
        Arun Kumar Neelakantam <aneelaka@qti.qualcomm.com>,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791286430; l=5390;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=ND+1mAauHCpeEOGzRE+jBlJjOIKD3T7c7XKJWlJyL/A=;
 b=VpLPxcggntRVRhGxfNCK4iy4d3cjKYNFiq4NsSWhq2M6iqAEHPkAkDrOZLV8f0A1E6/j7UR5W
 dbODxrebKMtC6XwlhW2efpAsvQABkfMmT1laM3KuyrijWdszmb6j0r3
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDA0NSBTYWx0ZWRfXwKPrxrPhrbO7
 wFmH+agJmgxI3I5aoTw+gEeWPgYu0Qca5bqL5Z/l4zFMBDbCW2vdkND9kcEZj6EN9QDtrWSiur3
 /muDSuhO5PYRvZwUb0z6GWrvGxNq6yIUAJUlwHbsLsc9sSDxwO7vTvLY4NzFRTlzF1GvxVSDwsM
 7pw55Rib413ac6bjNGQCAXVR/zEIxf4aBl83YWGHkqth+IHgQ423osEC+stBPDR/ptHDIb+LawD
 M+kgPwNex76ZoGKv0L59xPqA3UJUJcX+lwREGwY0r4mlJ/8rOrue3irATC5Aqs7FmBIGu+fkXpD
 ed9OO1UTlL9+So/a2vQYn6Uf1hHVJY/e7nGjWtoxns+B7pjHIHO9B6w/yeGuSIqP97crFYkrBPp
 LgO7F0bNyJMw2TpxweRXZNUgr7FJr9CF4z0I35Q2JG2h7NF5kgFXRDKagDscbqoKpcfLi4pnhq9
 sMMpWc5bPdtEXp8g9Xw==
X-Proofpoint-ORIG-GUID: wHxzHgknZ0CSPjBmuUVk0LLkUDQuDqQT
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDA0NSBTYWx0ZWRfX0mNcA5MoAoWz
 Br5lfaf72irHIrUycAUuQ99mHLHNsKtlMGnoKjMmHJ5naYZFzrNO6oZ6P6AZ4xM6jathOqGRtml
 DXIrVBnBFXryCvF3uBXOOGeLdMGcBPg=
X-Proofpoint-GUID: wHxzHgknZ0CSPjBmuUVk0LLkUDQuDqQT
X-Authority-Analysis: v=2.4 cv=SJXXx+vH c=1 sm=1 tr=0 ts=6ac4dcad cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=BY-klj7G_IJinew-6MgA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_03,2026-10-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 malwarescore=0 spamscore=0 phishscore=0 adultscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610060045

QCOMTEE needs to distinguish between object invocations arriving from
kernel clients and user-space clients in order to correctly marshal
UBUF parameters and decide whether certain operations should be permitted.

Introduce an enum tee_object_invoke_origin to allow clients to indicate
the context of the TEE object invocation, and add a kernel_ctx flag to the
QCOMTEE context so the TEE back-end can track it.

Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
---
 drivers/tee/qcomtee/call.c           | 12 +++++++++---
 drivers/tee/qcomtee/qcomtee_object.h |  8 ++++++--
 drivers/tee/tee_core.c               |  3 ++-
 include/linux/tee_core.h             |  8 +++++++-
 4 files changed, 24 insertions(+), 7 deletions(-)

diff --git a/drivers/tee/qcomtee/call.c b/drivers/tee/qcomtee/call.c
index 4a597eeaf174..3de54af45719 100644
--- a/drivers/tee/qcomtee/call.c
+++ b/drivers/tee/qcomtee/call.c
@@ -388,20 +388,26 @@ static int qcomtee_root_object_check(u32 op, struct tee_param *params,
  * @ctx: TEE context.
  * @arg: ioctl arguments.
  * @params: parameters for the object.
+ * @origin: origin of the object invocation (kernel or user-space).
  *
  * Return: On success, returns 0; on failure, returns < 0.
  */
 static int qcomtee_object_invoke(struct tee_context *ctx,
 				 struct tee_ioctl_object_invoke_arg *arg,
-				 struct tee_param *params)
+				 struct tee_param *params,
+				 enum tee_object_invoke_origin origin)
 {
 	struct qcomtee_context_data *ctxdata = ctx->data;
 	struct qcomtee_object *object;
+	bool kernel_ctx = false;
 	int i, ret, result;
 
 	if (qcomtee_params_check(params, arg->num_params))
 		return -EINVAL;
 
+	if (origin == TEE_OBJECT_INVOKE_KERNEL)
+		kernel_ctx = true;
+
 	/* First, handle reserved operations: */
 	if (arg->op == QCOMTEE_MSG_OBJECT_OP_RELEASE) {
 		del_qtee_object(arg->id, ctxdata);
@@ -411,7 +417,7 @@ static int qcomtee_object_invoke(struct tee_context *ctx,
 
 	/* Otherwise, invoke a QTEE object: */
 	struct qcomtee_object_invoke_ctx *oic __free(kfree) =
-		qcomtee_object_invoke_ctx_alloc(ctx);
+		qcomtee_object_invoke_ctx_alloc(ctx, kernel_ctx);
 	if (!oic)
 		return -ENOMEM;
 
@@ -648,7 +654,7 @@ static void qcomtee_get_qtee_feature_list(struct tee_context *ctx, u32 id,
 	int result;
 
 	struct qcomtee_object_invoke_ctx *oic __free(kfree) =
-		qcomtee_object_invoke_ctx_alloc(ctx);
+		qcomtee_object_invoke_ctx_alloc(ctx, true);
 	if (!oic)
 		return;
 
diff --git a/drivers/tee/qcomtee/qcomtee_object.h b/drivers/tee/qcomtee/qcomtee_object.h
index d5de02dcef3b..5f40617361fc 100644
--- a/drivers/tee/qcomtee/qcomtee_object.h
+++ b/drivers/tee/qcomtee/qcomtee_object.h
@@ -147,6 +147,7 @@ static inline int qcomtee_args_len(struct qcomtee_arg *args)
  * struct qcomtee_object_invoke_ctx - QTEE context for object invocation.
  * @ctx: TEE context for this invocation.
  * @flags: flags for the invocation context.
+ * @kernel_ctx: flag that indicates this context is owned by a kernel client.
  * @errno: error code for the invocation.
  * @object: current object invoked in this callback context.
  * @u: array of arguments for the current invocation (+1 for ending arg).
@@ -159,6 +160,7 @@ static inline int qcomtee_args_len(struct qcomtee_arg *args)
 struct qcomtee_object_invoke_ctx {
 	struct tee_context *ctx;
 	unsigned long flags;
+	bool kernel_ctx;
 	int errno;
 
 	struct qcomtee_object *object;
@@ -173,13 +175,15 @@ struct qcomtee_object_invoke_ctx {
 };
 
 static inline struct qcomtee_object_invoke_ctx *
-qcomtee_object_invoke_ctx_alloc(struct tee_context *ctx)
+qcomtee_object_invoke_ctx_alloc(struct tee_context *ctx, bool kernel_ctx)
 {
 	struct qcomtee_object_invoke_ctx *oic;
 
 	oic = kzalloc_obj(*oic);
-	if (oic)
+	if (oic) {
 		oic->ctx = ctx;
+		oic->kernel_ctx = kernel_ctx;
+	}
 	return oic;
 }
 
diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
index 1aac50c7c1de..30901390149c 100644
--- a/drivers/tee/tee_core.c
+++ b/drivers/tee/tee_core.c
@@ -701,7 +701,8 @@ static int tee_ioctl_object_invoke(struct tee_context *ctx,
 			goto out;
 	}
 
-	rc = ctx->teedev->desc->ops->object_invoke_func(ctx, &arg, params);
+	rc = ctx->teedev->desc->ops->object_invoke_func(ctx, &arg, params,
+							TEE_OBJECT_INVOKE_USERSPACE);
 	if (rc)
 		goto out;
 
diff --git a/include/linux/tee_core.h b/include/linux/tee_core.h
index f993d5118edd..bcb5418d6fdc 100644
--- a/include/linux/tee_core.h
+++ b/include/linux/tee_core.h
@@ -73,6 +73,11 @@ struct tee_device {
 	struct tee_shm_pool *pool;
 };
 
+enum tee_object_invoke_origin {
+	TEE_OBJECT_INVOKE_USERSPACE,
+	TEE_OBJECT_INVOKE_KERNEL,
+};
+
 /**
  * struct tee_driver_ops - driver operations vtable
  * @get_version:	returns version of driver
@@ -117,7 +122,8 @@ struct tee_driver_ops {
 			   struct tee_param *param);
 	int (*object_invoke_func)(struct tee_context *ctx,
 				  struct tee_ioctl_object_invoke_arg *arg,
-				  struct tee_param *param);
+				  struct tee_param *param,
+				  enum tee_object_invoke_origin origin);
 	int (*cancel_req)(struct tee_context *ctx, u32 cancel_id, u32 session);
 	int (*supp_recv)(struct tee_context *ctx, u32 *func, u32 *num_params,
 			 struct tee_param *param);

-- 
2.34.1

