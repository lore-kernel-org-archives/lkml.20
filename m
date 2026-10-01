Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B8BF3DAAC2
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 11:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790852600; cv=none; b=VsXtyIwCheBMZUU6i9q1YMkjs9TA3Pqkcz4C5TD3j1WOvm9rzjSzgJtn4XJyjekbS+ZiYaAmC2ahrOuCZ7RY82DyouaEl2zs449PpilNb6kbhxg7eJSfAmMZWxtA+fD01RC3yLBeHmDc+crFcDKqJo90fZ5yfBxtkLORu7vfdQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790852600; c=relaxed/simple;
	bh=Irbg1KRJzwIAxvvjR3DfaB2BoPb6tvFu8FKM+ikBDGk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eqp7nat7//nQD4TqsM9t6R1fUVgS7r1K50U0ZC+tM3LHK1CP4KgKhk8f11LVCnXdNqFpnMLbayWE7amFq5K7DaZh38Wg2Q3xVkFtg2d+9DprmexMZfcMsiM+mSokOvYClA72FxuctQ6gpFlvCxvcOzlxOuWSzwpDMjAWQsczBrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jVFTJAne; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GzicWhAm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jVFTJAne";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GzicWhAm"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6916xR2O1289079
	for <linux-kernel@vger.kernel.org>; Thu, 1 Oct 2026 11:03:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GzMk85iZS5UHtjkiHXM8suSiraGPQ7MkLyLrHn8dGbY=; b=jVFTJAneaKXLp3gN
	JOTFWBpjlHOvnu6zdtWKEC6sI5re/Nj+fYmoC99Lo4xvRH6Hk/7SPc1rYo+iexkv
	dlGq9UKn2E0rwAWNs/k+5e+qSczDqtqo0R4EjunPrueIR45PUV90n6LXV/5tZYY0
	eoWPie4uIHD7Yhcn734HNVeTgK5v1KEBTXVzn+e6zXBCSEHRCoiw+xnOdFJQKBp6
	I8cK+RLiIcebqQZRvuz/CuCsEgcuLBCz0t2mHv+/Zw267TW4seL0JmtvJOIHDWVY
	rHCBIRhKD5KkaF0qyPcq8N0neyPpa/WkeHWASNP3L7i4AFwXdokmTKCvq1jKzNjU
	dI7aOA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h17pjbme9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 11:03:08 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3a47617a0b3so4505824a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 04:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790852585; x=1791457385; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GzMk85iZS5UHtjkiHXM8suSiraGPQ7MkLyLrHn8dGbY=;
        b=GzicWhAmAgk6XeorAh4yEqi6GYiFVVTcLQkqqI/yZeSG9b6s18r6AKH/T7BU1ObnIf
         d0JXX8ymEWbZaEdge2nTdgsAO5ux//AvScmR//0Q3v26GG+/GkmkscJ5H/g8/TjUgrGx
         SfBuS+RKLg8ahi8fHNvftdmiSeUhChYsrrMqStL1OW5T/gjSn2azPemcT58Hhq4r5BAQ
         ZGVzjLmX6PHJhrfx7XtLBiYo6mkIhO0kVC5gkRc9CTCmhteDcdzWfrXOYuaz4kPL/SqN
         PzI4FEcUvUsMRXmfY1igR0r3MOlclmiMu0EIR7PJ00u+4TINWb3s0WXAqURD9L5fudJf
         WdJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790852585; x=1791457385;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GzMk85iZS5UHtjkiHXM8suSiraGPQ7MkLyLrHn8dGbY=;
        b=vW2BMjN/BrSBSnadXFRnWZAFYx6ipd6ztQ1ErRsT/xab81ZYPQDiHLcJoqeV2HQADS
         xvZnBpEkC3FxdDJOQ/j1jzX0u5qM7AkfSRmfoeLW6utqZZTq4yppislTB/O6i9+5hLEi
         4c2ubIS3wrvm3dqxgz2aFhTiu95nBKtSjohyt9aGpRpkSCGM+SjtTAhSJiFYFmcCmocH
         GXhR5oQzNn32tNqlrAczWXwlWlsK1O6GWXEKuiFgLUKu4spJFFwKjO7QIebKrnn89p8P
         LUM1GVf0ti2JrFhIwu9/deTKJAJHXa2V3NHQSZgFPSHFs5tgq7I4Dxs9U+gblCGbO+iq
         ndTA==
X-Forwarded-Encrypted: i=1; AKwUvBxgZaZTHJiB+LRnLlef6XVKYp/khp8o8bm90vYoXHtDyqk/8qdDjnexmuUWGkbBhfsIve1fAckFpHy4rQM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLwmCb9lltB5h5QxJry3uoJuOjMV8NEFO6OtPLyOLsrFMY+9qIF
	RwC5s6XcHiKmeW3UrtMlRPYMq6XIubL/Qt5fpom28CEH6vUez5EDw2wwQN7P84dQWOy+DX1KU3t
	nY4rrEJp0CoUwL+M5Vsho0sek7TXF3Shvnv+mL9Ebm5GTYKBdsqH7ehnhLPyALxxna6s=
X-Gm-Gg: AYBFou0Y9nOqTX5ZhHW4CmKXSS+5fl3m06aOMg/F5FMJnnXVox7/uq2Rqx+Zoy6KvxQ
	DxSDtocz5H+6G5n/LG32HeJL6P837Peb7IKOeDhnNE7MRSrHsRrunQF7yZDoxnd5u7f/U6EwQn+
	5xZH7zXpfYLFAO5lyeXXxXbvxlyj9UqPxYCqLdFp8Mt+QKcCd6Rho2XByjz7JHKZsX6mLCaVXAb
	VA8tXLmD9SX7ZXB2DWOXH316gyqkCOwciO8ekapTO1xz5ZwkU6DG5F7EGs4Fmf43KyRzlkN41R5
	dFoqMewblp4xhQA3q2EJCwPxhhC02ntbOICyXUcb0/6CxpZ2XpnxG/7LMR/L+HA+jYY0JJCOaIf
	tAmLZiPJERRR01OD+QY5XuCAksA==
X-Received: by 2002:a17:90b:1cc6:b0:3a2:b04e:8086 with SMTP id 98e67ed59e1d1-3a4d193052fmr2530126a91.44.1790852585278;
        Thu, 01 Oct 2026 04:03:05 -0700 (PDT)
X-Received: by 2002:a17:90b:1cc6:b0:3a2:b04e:8086 with SMTP id 98e67ed59e1d1-3a4d193052fmr2530072a91.44.1790852584461;
        Thu, 01 Oct 2026 04:03:04 -0700 (PDT)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4f4371383sm4076810a91.2.2026.10.01.04.02.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 04:03:04 -0700 (PDT)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Date: Thu, 01 Oct 2026 16:32:33 +0530
Subject: [PATCH v3 1/6] tee: qcomtee: Track the object invocation context
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-qcom_uefisecapp_migrate_qcomtee-v3-1-13df5c20c2e3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790852574; l=5105;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=Irbg1KRJzwIAxvvjR3DfaB2BoPb6tvFu8FKM+ikBDGk=;
 b=39ny8Acn97VfoCc1oMYUGQxcyeUoP5ox7fMARAoQ4xQp8o4kXl9/TLfVA1ikwoIlaasgvufsj
 pI1M3P7V487BN615CT9z4QFt2W0uFLNamL9E5bXLXqyez5HA8sufSlo
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Authority-Analysis: v=2.4 cv=eqpKXYpX c=1 sm=1 tr=0 ts=6abe3dec cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=bFqmgcYAq-yHHMqQ97oA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: RRGeZYsgBtTDhK3XjNVwWfv09fkSVIim
X-Proofpoint-ORIG-GUID: RRGeZYsgBtTDhK3XjNVwWfv09fkSVIim
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA0MyBTYWx0ZWRfX/j+GiNA7u4Ve
 f7naE844KtrB+sH52T9ALEZ4x0slgaMrrU2/0KvTF/959pOhSrZqdEZ1tFf+6lLjOzUanY1yEin
 0Z6ieIJGI+tlDIlldHlat5RVIzAg75I=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA0MyBTYWx0ZWRfX/s+JiLaQY4iO
 DevlaycpvM6l3A1h2S2ceZSqGJleFQ3vhMVWr+w5oIKRgYJFHaYdholHYlfGpi6BKL9kiJiSz/c
 fD/f0p7BTOltwFeM+h3Jcjf+6etlgtdAE/jDAxzldtCEzS3c7zFU0VpsFBGI24iKNbywfixzyqV
 tZEXX2zPaKYjbWAqc4YtAcWmEYFh3EFVRP22HFI8y70EiP00d40RipRwK+NYLfEBE/Ct7yWi6EU
 RHevT3HKmTpRSQHXni6e5AL8UrpBXE5I79SZyKNdfou/LqNMvRXvnvrlVsHI2nS+oe/E/OU8FbT
 JOZdjVfEHoxcLt/4dgUoatCXDWGVQa8yZxi+lz3KndCkkZyP36BWqMhdGi7xOOlDYy0usGKpapS
 lqQlxv5op43gfdT0yVsbWpuF2PJI0ecClQi7T2BMRcGf3nfCdfQX3XPya1CV9j2IC52cA3BHfEn
 7c/3RhyWiJvCUzbP9EQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 malwarescore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010043

QCOMTEE needs to distinguish between object invocations arriving from
kernel clients and user-space clients in order to correctly marshal
UBUF parameters and decide whether certain operations should be permitted.

Introduce an enum tee_object_invoke_origin to allow clients to indicate
the context of the TEE object invocation, and add a kernel_ctx flag to the
QCOMTEE context so the TEE back-end can track it.

Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
---
 drivers/tee/qcomtee/call.c           | 11 ++++++++---
 drivers/tee/qcomtee/qcomtee_object.h |  8 ++++++--
 drivers/tee/tee_core.c               |  3 ++-
 include/linux/tee_core.h             |  8 +++++++-
 4 files changed, 23 insertions(+), 7 deletions(-)

diff --git a/drivers/tee/qcomtee/call.c b/drivers/tee/qcomtee/call.c
index 4a597eeaf174..a0f2992c0611 100644
--- a/drivers/tee/qcomtee/call.c
+++ b/drivers/tee/qcomtee/call.c
@@ -393,15 +393,20 @@ static int qcomtee_root_object_check(u32 op, struct tee_param *params,
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
@@ -411,7 +416,7 @@ static int qcomtee_object_invoke(struct tee_context *ctx,
 
 	/* Otherwise, invoke a QTEE object: */
 	struct qcomtee_object_invoke_ctx *oic __free(kfree) =
-		qcomtee_object_invoke_ctx_alloc(ctx);
+		qcomtee_object_invoke_ctx_alloc(ctx, kernel_ctx);
 	if (!oic)
 		return -ENOMEM;
 
@@ -648,7 +653,7 @@ static void qcomtee_get_qtee_feature_list(struct tee_context *ctx, u32 id,
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

