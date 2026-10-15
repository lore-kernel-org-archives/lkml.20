Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28FC83EFFA6
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 11:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792064406; cv=none; b=ui0TsgmGUJCT2qM7ZRhJrSJr3vEtW4D22DkETArDNABQ8kyYRluovNGR4eXFrHIGCuZDm9eonByKouo1dvctu0V+EHY0Wqh0/qf7sAYoEocydX+A+ubU1vDfGBqhPMCZj3BsktzmhOYoYto3ZGhESlF1qbLfGjj3eItcBDEDFyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792064406; c=relaxed/simple;
	bh=lPjdyCOkF7hhGTqyY2tvrzWLFaMe+jldrt2xpg8xHg8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tnn1i6wBZuon5dkIgva+QZRzNU326Elo/NXbml6T7shyik7BcnPRAaP3zzh5ldgByuFyAWzipFIfoXwR4WYpOSwWix8/1oQU6ZZWcoJseWabmtR6ryQMCKEntYFgFNCRUES8bg2xz3D2PS2dtJ8NXyEbgKQYaomQq5h/Gd5knVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kh+KNqVs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VMQnXpIx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kh+KNqVs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VMQnXpIx"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jIiw4077486
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 11:40:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tVhYXxbl/sJISLD/HLgal9KIlsatQYaS7bV5YpSMSB0=; b=kh+KNqVsscZxNerH
	pagiHZDVer/gHn5W4A7QNRAot3HfBtJ38a6HPWRgcd//1L2o0u3/AQTBuRPB6Yx+
	zuCVcp2Alu2TUkpW8xfN7qdaqCw24SKsoRz+UGe7Zipmr0mRe39WoXS/GBsv1cgW
	Ng8ozAVG+ZFuVxkpc+2faaRBBs/an0++dVqxiYNCnUm9giKsB3eC4xTlLBe4X/B1
	bB6NPeuN2PSUzk10hRXwpaptSbfyjjWZ91GdbpnGqMcz7UvCyWqmVAw29TgW5IFO
	HPWMLxY2lf8HgzB7rsQLWj21wERz+uAOjE91wLwFMCNutvyeseuX+RCMkj+s+rtw
	L7ax9A==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4havbc0gfv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 11:40:02 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-351788121cfso11078038eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 04:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792064401; x=1792669201; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tVhYXxbl/sJISLD/HLgal9KIlsatQYaS7bV5YpSMSB0=;
        b=VMQnXpIxa64dO1wldrt9qugG/NQLWnGg5XUZSTj5fgvNY0L6FnOnbQDh+6uwe9R4Jo
         QUMEahgAI9s33wKuC2eTVKxenF0mMZ/Mau2TCzbgs6wcigrHI/dQo1iQPQUG/BovWSjJ
         IZLsFzu8XuGRjlFuuTyJsxD0vMD1rq5jYoJ7sCBRFLJOwDp8qwrKPL0wJFc13vKhDDhP
         DrCpC14F5HUh7dwY0/W/8aSD4ODcRPI5Xh0VCX3optt3njyLRz9jdRV9RZC0Y9SkjiDq
         Y2r6ePde6iDhCut72kn+wBdLuLKuEidXPH+g4cS9CXGV06jmjI9M4nnF+nn05pxL7iRc
         1YLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792064401; x=1792669201;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tVhYXxbl/sJISLD/HLgal9KIlsatQYaS7bV5YpSMSB0=;
        b=s8Z726GzaFrx26T9OTQFbLRyFcJjXtTVcdP1YVnjETDVvH0TfOAS85CwNG8TCO5wA0
         rLghQSugifeJ5dA7RQlCAvjJivUhTOovclgRJFJh1aN3QLWq9GEun1KwtG6AVj3rJ2lp
         jnZjBsNbYoKo6Aqd4RLzcNNkHFuXsUMZTHaH//n+wXIfTz+d7PjkCIjP3bbh/6GqEx4b
         aoUMRP/g9lrKYmUNLx7B+O0B1CoR82uRWYJhCjKn8EfnPse2Eb4JiNgakFAh1UYQQ5eA
         WQ0+r5Bt94pdmnQ6vjAdmZcajZO1VWrW48CZvkU5AXsONR72vxKETmAvIiVRjv1b8RLm
         6loA==
X-Forwarded-Encrypted: i=1; AKwUvBypwUkU3i7a+DUnuCHa2InWQQD5sg3owsd3HwhYcVERJK/aSh3+CKLkA7VZ6RumEr6nW7kU1ZAKRoBiFgQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJyy5CIEkfKIr96wQBN55ojowYJkvdv7qIwRX/ZF8nESWV1y64h
	PUSRAQ/RdmKGI35eAnj9VWt1QN36pAl2Yp52/rbHP3YHY2dmXKv4qj4LakyJ4zdJzynGpt5jOX0
	5YstaCow4PdB2P77AKRjUBnevKqNaEBX3Aj3fVkuazFRIl1HIkozQ2RLDkSlXuBMjWSQ=
X-Gm-Gg: AYBFou19atI/eJRATLA+PuoeAsaTlK/4k7V3qtRCnUVtfkXvhQOOolv1gidVLofOQzI
	nJj8/jsOzRycNFhbTuHtyGViw8LDYVTbOB1ubo4Fj/hhc9Gek4IVkZ9aaG/3++JSIaEmlZc0iPD
	uzb9RrAFqei5+mSzC5w851KdmDp6VX7q20PPyEL9vOwxHvgl+SVOL36CIsbCPnmlZ1C/Mq7Z9d0
	K6lmQTlSo2b4xpzwZQLbTnQEA2f3JlSOj+P76Sk5qMQmM8bcAH+4RAdzGGr3K79ipsziYVKuisV
	zmOekETzdIArNftfera9iV82vn1yzN8/bvAumC6JK/rrnOhSgJe+h7BWE0A8VvNXGlDFSWjdYIi
	gJw0s4PKt+DGcTh74ElpIoPcwEw==
X-Received: by 2002:a05:7301:305:b0:35c:4800:4da with SMTP id 5a478bee46e88-35c48000c80mr12251154eec.41.1792064401058;
        Thu, 15 Oct 2026 04:40:01 -0700 (PDT)
X-Received: by 2002:a05:7301:305:b0:35c:4800:4da with SMTP id 5a478bee46e88-35c48000c80mr12251112eec.41.1792064400386;
        Thu, 15 Oct 2026 04:40:00 -0700 (PDT)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35b29c2f861sm48144891eec.11.2026.10.15.04.39.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 04:40:00 -0700 (PDT)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 17:09:37 +0530
Subject: [PATCH v5 3/7] tee: qcomtee: Allow object invokes from kernel
 clients
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-qcom_uefisecapp_migrate_qcomtee-v5-3-1460691b35d3@oss.qualcomm.com>
References: <20261015-qcom_uefisecapp_migrate_qcomtee-v5-0-1460691b35d3@oss.qualcomm.com>
In-Reply-To: <20261015-qcom_uefisecapp_migrate_qcomtee-v5-0-1460691b35d3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792064379; l=7565;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=29af5q9fQmVOjaxOvDgc+bJw1fOgZLvO5f4FLcvore0=;
 b=il0JYQstaGf8x0tJ2BtrCgUT2IgG4+AE+2L4jT4Bci7G/TVoSzB7boTd7j/KwA+jESTcoajt/
 R0HXHW7+Ae3D7uojwKc8OFqDBqECIb/PUaMPROIDh5E3C+r6YdRJEI1
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Authority-Analysis: v=2.4 cv=QbvzLcbv c=1 sm=1 tr=0 ts=6ad0bb92 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=2fm1Try5a8I-Yd-RT8kA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA0NiBTYWx0ZWRfXwkBZhaXnmRB2
 8hS/Yzt9fVFbEXsQyjBPgpGJ8Kb074kzm1Jr7fyuVMIRyJbQuoqZ2KA28hsEU6vhbe7D+uirUw8
 wITw1S5wb9mfC/QixmrcicRd69uq050=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA0NiBTYWx0ZWRfX7HfTR6FUFWC/
 8xZVE+nRZzKQtjAjtMpV2WWB6DgMn/xFSBNddz1GxeaR3IbltoHzVDrSL0qdAmpx2NRenrKN5Hg
 5gU/gpS3eoF55l3mPgiVoGgfIY/3iq3YDwVGxX/3bee/Ro/xHKH2DSq9Yh6XBqGP5pHbPBEPrB3
 iZyI2V5kIP0arED9GTNNTNxrZ+l8tRM1zq6cJtjMHC/c9qSXWJcOkE0n9tFkS/fRv+4rhlwE532
 EmnqCpTmr1T3jRUBRYqzHb08nFzm9FUxW8e96tpkmAxLUTxhW4P3KqNDlmt+gl46HoLUPA+2Sdg
 5zk1GPWauFJg+k+dLhTbi4PjJnGEygd/utuYAfS2I+owkg5ZMnFgznK7Duu/WoGU8gmlFR7m2oQ
 mK2030Aqvm8rLXPvlOkHWp2FAjyleDIhaDGkIfnOk3Akt7axjU32BkK73KkCRO2WUZArHTgCjZ7
 2XncYNZEK9Zw5eHjYmg==
X-Proofpoint-ORIG-GUID: JviDZo9EmIhZLRKjk_zrKJcCULba7xQ0
X-Proofpoint-GUID: JviDZo9EmIhZLRKjk_zrKJcCULba7xQ0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 phishscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150046

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
Reviewed-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
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
index 5f40617361fc..a241ab657318 100644
--- a/drivers/tee/qcomtee/qcomtee_object.h
+++ b/drivers/tee/qcomtee/qcomtee_object.h
@@ -113,8 +113,9 @@ struct qcomtee_buffer {
  * @b: address and size if the type of argument is a buffer.
  * @o: object instance if the type of argument is an object.
  *
- * &qcomtee_arg.flags only accepts %QCOMTEE_ARG_FLAGS_UADDR for now, which
- * states that &qcomtee_arg.b contains a userspace address in uaddr.
+ * If %QCOMTEE_ARG_FLAGS_UADDR is set in &qcomtee_arg.flags then it implies
+ * that &qcomtee_arg.b contains a userspace address in uaddr.
+ * Otherwise, &qcomtee_arg.b contains a kernel address in addr.
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

