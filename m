Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 926EC3D75DE
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 11:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791286460; cv=none; b=kIfoQV9SOG/Te+UwEqjnXTNJbik7jwrLL+Qbjga/5LO1mFPsMAtP6+Pm3W2zG9N5hjmU97+bU8D+WYNbx2aO1XlwRUIn4ci/oaiuWmvCmvV5gt0RbkvdnOlLiFvzzhI14TvGw9zr52vngyzOh7lwz2ZNhD1MY+Ez2sUl/WtbG4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791286460; c=relaxed/simple;
	bh=hNGGqQh+aPxHTzj243SkQWaoT7cgLm/6qurhSVBQksY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c+ncgKTQWuVY1NjlyxjLduJ9VQi5mYJP+BPbY4hEspX81aZzyXVBvs7j+jVfJeGzQh0XLduhQAXN+yIvmkikDf49EtpuRP+JNz/DLCc98kZ2FKA+noEk4mthwH1uA4+cI0HLn5FjuYSyUFbXcxmjJ/+O75ia1wGFuAoC9BJb7YQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=noJnROO1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UOQroiBe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="noJnROO1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UOQroiBe"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 696BPS3D1046166
	for <linux-kernel@vger.kernel.org>; Tue, 6 Oct 2026 11:34:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TcPMFsWnCyAxICZPAGzWsR/xQ/fNZZK95P/3UHPpiUg=; b=noJnROO1a/5pJdtg
	SEpNNNVrLXdJrD+zEPh4tX4ED/CPeDMW/g195h7JLngzviIN9JvdspSHh8hiSxMS
	K8gBLIYQHWAnIGQ+kzT0ggUgIBwKk8/xzD928H2qHbE87+X5YaUNb83tpciIUnh/
	K/rX+lVioZ54i9WWXNhqgzzIvq6tAc72cLMlCrnt3UGYB/czJKZ0koa2to4Ms9t8
	FyWZjujfSw8WwUXHcCSCPzTOgW5hERI1q0nLUUK5WKnntaAfce0gP2tU8QvJaJQ/
	2kwNxBeKBQby4f+g1yM550DPNXDlSioeUFTqQ0STPQCYNpuWRS7MuJkvQmX3x0UG
	MfomiA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4xfbgcf7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 11:34:16 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39de4e72b33so3924584a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 04:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791286456; x=1791891256; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TcPMFsWnCyAxICZPAGzWsR/xQ/fNZZK95P/3UHPpiUg=;
        b=UOQroiBeSW1A0tTbC3aHpsx3vzCf/azGtwDuBSe23Uh70hbjYUrVyaAIwX9zZJTCF5
         kHKpEWdSPw9YA7TEwoiWDaVzEEJEuMn8iUiYr9/NBDN3crnO3r7lL8l76OPZyfOqkc6w
         DVHfSu9eHuykE9Op6oq5ZhoQAeV3bPvL97Wll/CtBv8VNYdePfr/b7IzazfhCm2rMa5w
         Df7f3vuHldva1/HQSdNrO2+00U7EsT+uS1Y992ZY7arxifjIQsUmZ+KV3OYOF96CZVcW
         IKEJL4T+wZxj+0i6JoyUKMFwO4Z5bqkf94J0nLw40ToUugIViQeND57KEcDfnYAgM2ZY
         hc6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791286456; x=1791891256;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TcPMFsWnCyAxICZPAGzWsR/xQ/fNZZK95P/3UHPpiUg=;
        b=oO5iD8ti/+If1bQCpQRfJS/1Js8GjGNe5spOE6fq7KBdEKOA7xkMuYcYL5hy2f/40v
         Xln98q3JwEnhNU3QPxYJxQRWVEubSLgzo6qGxk9XKWLouRXstBGZ+vl7xLGuYGxiLC/F
         naX8SFwXDRiN8EZCnKpche3JDfT3XWnyJkF6Z+a1+xWowkXrv3NXVFAONRUpJV9H7o+Q
         /ZnCIpH2D+vrKtzh7WsWAdqfqTvoK16hW2MuyLlQUNxZfCVfWxOZx4bdluzsrD2W+m5h
         PnPNh1qKJLTwMBSlHwgtcfT4oeJn5gzxUsf1KpPFG8v/66U4jKAS77yLrNdvzp8UDYoi
         rwXw==
X-Forwarded-Encrypted: i=1; AKwUvBxXm2FiKj7gaVRHdLegEYzG9KNj+cmGLPqUM1Qkg5uiPLUFZQvi0ZxrH+mENxDYZr9QsEZXU9PbmndS42I=@vger.kernel.org
X-Gm-Message-State: AFq9FYJRNDvhvvIaLL1NCjTPMSxXbSe3Srz/sxvyRcA8K9UQ6ot4TFDD
	2xBixwVjSfNXKYtDYhPwKPcNiS3NInW7HsTQGtsC6eTm87iRhqofsO4gIlmESa0G12+V41XgqWF
	JmiFt2TqLIcLCa/K1kE01j2hYOvRHhvXLUrsFVLsTa09La0HNGDdWoxXrmAMASWXikgo=
X-Gm-Gg: AYBFou3IRbdXJ69Gv0RbqpIKSSnkhlwMqLlpa1SsXOM/XNW+JAtYmiV+ZP5CliO13Dm
	ma7RMJJXmdM8JwiuezAki4UlUqM2P7r98ajzeQSzWm0wiXFFV+nRXlT42bwHXu0r5WWuqxilIK9
	qyJxxgZPUXdjWC4f4zbuI16q8HrcNhYOu3gN/CHpmwyeoCYo/+rD/TxS+H4yQ3pmOuM7h0mzum8
	FzfG/ybwuKe260kbIGsEYKKGZUtw+pNVBDHkA/bB2v9tjTQEqiNXP8j+bhvPIzp/jS6E+qBj+to
	uZmmYa5taVjaZNamTamSjHogsxKfGIVeM3l+0qIRCNYLGuptM0JkYApJmqtNa1zbkvfH1MAhhdM
	0K9PjQ+ls0FiVVqZG98FItzw1
X-Received: by 2002:a17:90b:4d88:b0:39e:6c6a:657d with SMTP id 98e67ed59e1d1-3a8737609f2mr955190a91.64.1791286455415;
        Tue, 06 Oct 2026 04:34:15 -0700 (PDT)
X-Received: by 2002:a17:90b:4d88:b0:39e:6c6a:657d with SMTP id 98e67ed59e1d1-3a8737609f2mr955145a91.64.1791286454626;
        Tue, 06 Oct 2026 04:34:14 -0700 (PDT)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a709a4e80bsm9330092a91.4.2026.10.06.04.34.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 04:34:14 -0700 (PDT)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Date: Tue, 06 Oct 2026 17:03:24 +0530
Subject: [PATCH v4 3/7] tee: qcomtee: Allow object invokes from kernel
 clients
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-qcom_uefisecapp_migrate_qcomtee-v4-3-bf1c8e2a64ab@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791286430; l=7501;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=vQ0glXVb8lZsQ77j/u+AmXWm85SK5TcXpfy8/NkGwe8=;
 b=EYQiTaOQBIuphTPGVwO9IYuX4aPBBKq8uWiW/+flR4UO/Vkzwz+aAaaC/bOEYb8WkVnKuF+iF
 F/N+RDTyyoZB++ly0XVB/CzVRvfRq+R3urKOTekQB/VPSVCGpeaAuIN
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Authority-Analysis: v=2.4 cv=D8TSufRj c=1 sm=1 tr=0 ts=6ac4dcb8 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=2fm1Try5a8I-Yd-RT8kA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: -Cx8-jcbP5RnAfzB-s2nDQcHryUE8TfO
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDA0NSBTYWx0ZWRfX5wd26lMVmS50
 rvdWwOvzDrB/AW5AQG3gX22bjNa0gwiHQfBDgob2OuUPH+jUIyt4q3KTXT4zR03yc4OvESFUM2n
 kSc1w1l01jFPgWdfgs369uhPn+25jEk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDA0NSBTYWx0ZWRfXxuyWRN/H8/hP
 u2NAKnfNISCgsghehyM7OM7KTY/EKBWsI9M+nBnbHbTnmxoS3F/+NeVFzO/L8DYRqeUfPr/UllQ
 ftTV1+uha5s9BwuisVCpzlOHqdHuCzaov+6S3+ljcfw5Mm3PZwaLvure6PxQOnxs5T9D6VKt6KU
 PbIb8dbVKccJgGQj5mPkKhfNpiTzQ9WGXNYhc4O6Uw0aLZbLDOx2SfDbGHz58HEgPv1EBT9sP6c
 2Bp3JKns6TV4aS/ewBGPFlINl+K1+jBLF+F4PIi0M8vxpmySU8YG/YA9YWXTz82t9Orjsdu9MKP
 sNuJ6O+ozTYBT+S/Y5tXgLYfXYq73yHhP3mWw7TyP8B+UYBcISSzSeE82Yw43OOMojWCHLv+eFx
 v29S6axFQtAM6Wu5poFi/A9FtJb7hAnaesJaHhNBcWps0OelLlM0j27IufBzpx/8p/Hmdisrjxi
 og2th6pZVKXdg+AmYdA==
X-Proofpoint-ORIG-GUID: -Cx8-jcbP5RnAfzB-s2nDQcHryUE8TfO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_03,2026-10-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 adultscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060045

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
Acked-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 drivers/tee/qcomtee/call.c           | 38 ++++++++++++++++++++++++------------
 drivers/tee/qcomtee/qcomtee_object.h |  5 +++--
 include/linux/tee_drv.h              |  5 ++++-
 3 files changed, 32 insertions(+), 16 deletions(-)

diff --git a/drivers/tee/qcomtee/call.c b/drivers/tee/qcomtee/call.c
index 3de54af45719..c97afaa1b4aa 100644
--- a/drivers/tee/qcomtee/call.c
+++ b/drivers/tee/qcomtee/call.c
@@ -193,7 +193,7 @@ int qcomtee_objref_from_arg(struct tee_param *param, struct qcomtee_arg *arg,
  * @u: QTEE arguments.
  * @params: TEE parameters.
  * @num_params: number of elements in the parameter array.
- * @ctx: context in which the conversion should happen.
+ * @oic: context to use for the current invocation.
  *
  * It assumes @u has at least @num_params + 1 entries and has been initialized
  * with %QCOMTEE_ARG_TYPE_INV as &struct qcomtee_arg.type.
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
@@ -260,7 +266,7 @@ static int qcomtee_params_to_args(struct qcomtee_arg *u,
  * @params: TEE parameters.
  * @u: QTEE arguments.
  * @num_params: number of elements in the parameter array.
- * @ctx: context in which the conversion should happen.
+ * @oic: context to use for the current invocation.
  *
  * @u should have already been initialized by qcomtee_params_to_args().
  * This also represents the end of a QTEE invocation that started with
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
@@ -430,7 +441,8 @@ static int qcomtee_object_invoke(struct tee_context *ctx,
 	/* Get an object to invoke. */
 	if (arg->id == TEE_OBJREF_NULL) {
 		/* Use ROOT if TEE_OBJREF_NULL is invoked. */
-		if (qcomtee_root_object_check(arg->op, params, arg->num_params))
+		if (qcomtee_root_object_check(oic, arg->op, params,
+					      arg->num_params))
 			return -EINVAL;
 
 		object = ROOT_QCOMTEE_OBJECT;
@@ -438,7 +450,7 @@ static int qcomtee_object_invoke(struct tee_context *ctx,
 		return -EINVAL;
 	}
 
-	ret = qcomtee_params_to_args(u, params, arg->num_params, ctx);
+	ret = qcomtee_params_to_args(u, params, arg->num_params, oic);
 	if (ret)
 		goto out;
 
@@ -456,7 +468,7 @@ static int qcomtee_object_invoke(struct tee_context *ctx,
 
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

