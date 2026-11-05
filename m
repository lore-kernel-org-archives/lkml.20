Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793877337;
	b=3V0BoDQYxMmOKg6SkPA0GspbciFK8BF7gFL4tgi7qLxwPTRQo25OOE97QMxnFsepnM0D
	 ER7mWQqhxv7t8u7eSpkFJHiG2sJC1Cz/OZzm17YrG0Plx5HVbsb/LyagasNzCxMOFk/Fu
	 EztkIgXERT78Y1tZ7qs4May1GyzW2xF+wrhQzMmVPk3Ps/tmwE8eGGcEpD9r1BLl3SRNa
	 F2IQK3cbsgrrfo1ibKj0qYH1+3OH3I3kRjWe1Bnnik57t4OiSToV70HuX4S0aZCTlfYO2
	 biZuO4Wq4p1qQgjofkTb6qZV3mzmzJmug/JfyvHYmWW8euGaSA7Yk7qAbFD4IOqr3yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793877337;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=h2tJFFrgeLGaQIJ4J2QMFvkkhPDELzSwUHNctB/qs3o=;
	b=j5wTYJPyYj0cDOg7wOsrP6cFujy4fe9OMEZ/RyZcVqzjyss2XZDxvMtMF98mSDMqP3ee
	 qlPwhWNHELjD4uXutJTXpfv8ted509FVEOYDoQ1bU0vejTnXxA2t6n634sr/rVtJWKYBp
	 atg3AcFxjhn6rUkEHWhUJggSFfXpwcAfsPcSM55W92uR+lpY0epUVPnY8ZhnhQlA+ownx
	 9rpYN83WYexG5iEOSQHP3GJoUO82U2QdqhDw1V4lreILIzVCIK3a70NtM5I2sPxV2GPDF
	 JVbEA3D9KRGU0fhJomf+LMOfqJ1pgNC2W2/6m+2nyebpGITarCeL8DhjhLQsLKOVgwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="B3qLMld/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IkzPc16y;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8420606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 11:15:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8420606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=B3qLMld/;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IkzPc16y
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A59tWTU433424
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 11:15:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h2tJFFrgeLGaQIJ4J2QMFvkkhPDELzSwUHNctB/qs3o=; b=B3qLMld/L8EsPs6t
	hHHhNItnnqMUNMdPM7SubfsCc/kTa/mBPI6xJpbhiJ7mlxYPlC+YJ0heHXSxGBmx
	VjLLF735A9Rchyzy4+h0uXs5faeagGvbH1vPPocMkkWV+oYxkhe/z5huqNJaLwby
	iQNzqQYN/GivKgBQxWUQuW99WkkE3X747Av9/ue3jy4IFWe982OqW+A5UqumvqVA
	Ow5IBawrRrBzA4sbPCZBZhwNl6m95I0WtjDtBjK8WPLzdZZoBCx8JSZ9qzfdtW8e
	uR4oKuBhqT7uEO5jK+1GIyy7Y5cWSHaljP13arbKQGzfwrRW115fLdyTuQyxoEIr
	fsi3cw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrmcd95ys-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 11:15:35 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36d1353fdcdso5242754eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 03:15:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793877335; x=1794482135; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h2tJFFrgeLGaQIJ4J2QMFvkkhPDELzSwUHNctB/qs3o=;
        b=IkzPc16ylKhpr8uqgFOaDJBqKCi1Tt+3IIl6eIpvVygRUyckyLx2H90ASJOL1tSUZQ
         jmb2F16rRgs4zoORUmOQx0qB7vvE8K5lLMjloYtKsDMcrzMIdiFVXkP59gqOGpG/UOzi
         vkkI1u+C6KKGTNB8jNaLtPd0Q06JGZ1gqcqHaXYiGIJ6LLOGyFMiY9itXT2eWSX+K0B2
         5mQvmVYnCJSITiiqjgj/zGHsPkuGzjUxXlE4cSsom32UZX2FO4nqLLIWmvSXcN/WYAUC
         QJVdZn1koNHkk4FPXzgJkXPpg/PCHk8MU5lh2go7M9RzS9H1FyF9wm5YWvZgvUj2tRXO
         ECng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793877335; x=1794482135;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h2tJFFrgeLGaQIJ4J2QMFvkkhPDELzSwUHNctB/qs3o=;
        b=iIB1Gph8juP8jARJAlBnOVLi1Xbn1gHe7r/Fqo/ezJrBRnPQCdhoBxOkHVbs8dcgc4
         7GvGR/rT0n2G2S0OJyxuUY5+66P6YfUc6YvIGlvnd3lpRFrD4eXHf2BQdFfS2JM2Cju8
         ChE/L8T0c9ViZmKWrasN3DlBHrbItESQPPnSeD2PTxGLH+OCSHgeNH0MEyOysmynDSKL
         +xJei7ec/rUKwWSn8rykpsbHbvJp62tyjNofLSPVkguDcymZc1IUDGp/APeDjwmWHN7k
         MvqiUtVb0b+mkoaPvTUDKw20WlNSqFK3iQ+4bYR1Ijm93kfL1vL3rvnVOKYn0S8zw5Sn
         rt3A==
X-Forwarded-Encrypted: i=1; AKwUvBxNmHM9fFqcrZneh3W9dBublrQv5PsNijpa5WILn8VZT52q/RzCoAheWKrcaptracExdoUjX20EXHfjX5M=@vger.kernel.org
X-Gm-Message-State: APuU4Z+FvIbfNy92NZMqkbv0nuG4Ffi2TwRSQFmGMtESaGjWX+WtJx9m
	m/YgUelYRr2klWBWtSBULYwQW/vdtlxnCeB+nr8731BHqi0+GkAu7EgTdBHxAejL85bop65vasW
	5vS2EIzUpSL76CKoxRmhGXpkO+fhed3X7Lyg3gVjtX2mt3ITMbYZJegVJ54dEMxovqvw=
X-Gm-Gg: AYBFou30U+PxDxsJU+zUwq88GNM7P1nZnuBK3maVNiVU96cjg6Z3w6wCyEkQv9tl9Ja
	SjYHrrg9X/9MMzpcsXxGMd9N7+a4NiAQKWjLpaZOqKLCtwK4FM/MDi6dwrY/kXi1mZCavcAcp4Y
	YmnmpGEhdPwox7/OKz4gv/q1OpSxFkhH065OENMOSsiRzWJjUhlZO+Lqz09fCaLsSH9b9oXHtGI
	hHn5wJ59Ke4A8k9QRV8pKrjqh4j0CdUsXH4GxyNgcw+eRKEy4c14OBzWNFqGnpvuolervxvPUDr
	fBqoIkXGTwC+FnZ0lE2jLJ49HxFGE/OtHIWm6q1pZp+p/U+0bXM6cg+6pwgw5rJGWV6uOvXni0b
	LEmYi8z5Mc+f0+D0uldI8I8iTgiyKf7dFutzmmAZ8nKt1FWKavy1pt3i020CjPWkSwdzMdBwZhQ
	==
X-Received: by 2002:a05:7300:b2a5:b0:36e:9773:84b9 with SMTP id 5a478bee46e88-36e977399d6mr1173725eec.23.1793877334529;
        Thu, 05 Nov 2026 03:15:34 -0800 (PST)
X-Received: by 2002:a05:7300:b2a5:b0:36e:9773:84b9 with SMTP id 5a478bee46e88-36e977399d6mr1173681eec.23.1793877333729;
        Thu, 05 Nov 2026 03:15:33 -0800 (PST)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36dd7ec8881sm14002125eec.18.2026.11.05.03.15.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 03:15:33 -0800 (PST)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Date: Thu, 05 Nov 2026 16:44:49 +0530
Subject: [PATCH v6 1/7] tee: qcomtee: Track the object invocation context
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
Message-Id: <20261105-qcom_uefisecapp_migrate_qcomtee-v6-1-c7d68ce05c51@oss.qualcomm.com>
References: <20261105-qcom_uefisecapp_migrate_qcomtee-v6-0-c7d68ce05c51@oss.qualcomm.com>
In-Reply-To: <20261105-qcom_uefisecapp_migrate_qcomtee-v6-0-c7d68ce05c51@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793877323; l=5531;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=x7TtrfjnVWlKZm3ThwgTIYoCmpFRPegZkJ+Pn2cNpoE=;
 b=/W5EXhOkgybs65hMsyArOx8DjwZlEfSaltIoB4TFknLU6N+SmxIprIYW+XRS0vvDgkwE45JaM
 58zGPy1JF7ZDvq8OFQ+ZIueoSNODSOtdkkkrAM+BzC+Lo2/r1hhjXPA
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Authority-Analysis: v=2.4 cv=EOGTQFZC c=1 sm=1 tr=0 ts=6aec6557 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=Tj57qVV8HpgCqk1lqJgA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: joa9_88mWa8cTFF-lVyTLTa7Gc_L0RVW
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA0NCBTYWx0ZWRfX60X++KkO5Gf/
 kOjnsFn7AcFSQZ+LZs8iOfObMBtXMMCNoPxNXg+KXczHURQfBRvYfClm1ZT9116wnrK7H6/hXxU
 npjS3KpzUNzH6O5ZdOIkcSCVIngWe6Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA0NCBTYWx0ZWRfX3eFSSb+bRQ0g
 DovkAsuBJC4KMrvS10+YMbHph1BPgXeFbsjYEZ91SzDkEozu+Et+UVzOznACVLmY1UBp6x3Wbz5
 RPGR/aWLs/wkYDjzzDLRYP8OjtmwI7gzXTyut5ci6BTpsvOUrVgsBCghT1mTAIs9lBcv+CKEli1
 orAwNSSMVTe/InSpupN6PtG2gqeJvR3emFsbtzLWY7C97/Nq2gCWapLzTP4hCd71afSL/ZodN9m
 jH3C46pPj8Subcl6yVtcH4ow7aPDGodJ2dhDby3csg3Jnoq1HBLDCwjF+LE9XvKEiT+8uLvxXh+
 nCF/0UU/f8xpJuZkzsuTk23Ep4uyx2mZ230/Z78FpRMNfZbjfY6i9m3jwSWJWD0bhjYsC13Zypn
 0+TIiquN9Pi/kLI4nSsmyiowb9+CtER+RNESVk56geP5j4LjSIMtNITruPv6hoLzXn17iMAVh7p
 C/rJb66NH+jGYFCHO8w==
X-Proofpoint-ORIG-GUID: joa9_88mWa8cTFF-lVyTLTa7Gc_L0RVW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 suspectscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050044

QCOMTEE needs to distinguish between object invocations arriving from
kernel clients and user-space clients in order to correctly marshal
UBUF parameters and decide whether certain operations should be permitted.

Introduce an enum tee_object_invoke_origin to allow clients to indicate
the context of the TEE object invocation, and add a kernel_ctx flag to the
QCOMTEE context so the TEE back-end can track it.

Tested-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com> #on Glymur-crd
Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
Reviewed-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
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

