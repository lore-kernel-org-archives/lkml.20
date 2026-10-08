Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F36F377004
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 03:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791430135; cv=none; b=csLIZkOYfdwCN3KiS+GZ8wzUyuwRsiOaezTUOCWGKALxMj5ccTP23AAYrc5vT8aFRtvPcjeO8Znhj4vHX4kAxYeoCEjt+4OqBGrG9G9Ba1QXbjFDAJauXFkHSOqQDobjuMjeyaRkoUG3vWnrfi91D/amhvwSndD7CKoxhtvyfyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791430135; c=relaxed/simple;
	bh=Nc7c2NB3hGdi48979inrlz8BAJzMB8SiKcycNRYpdSg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZKEK4ze4gircnAZxiYdWJtA5C7Hh91CJ/X3TpCqRfQIMl3J6uB1/Td4wT6cdFcFgzUTjHmU4V3cET9fprB/ZOdLNQ2AkcVtTV/AlTiTc/VdAkzu0R/ay0t8Y/xhRcfap8JEcy6o9J07vWFZDGeWJsmEXm6Fp3uM+gx1am3bVf2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HfkO7VBQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XkXJC0ZZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HfkO7VBQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XkXJC0ZZ"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6981hX7T1824421
	for <linux-kernel@vger.kernel.org>; Thu, 8 Oct 2026 03:28:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h5GNPmOtb6vRXX69AT9xHsFaqITJ4EycmZwhRBnhLEI=; b=HfkO7VBQV/6BY5dX
	DjN/rwEZfsZ2b3qDbe4UlSF4rAmzD1c3FdwzPUXc4izeZ2hz9y36bwQU2XQNd0LJ
	IJhuSKSzKC6lIcPysyQYqd7WRtlEIDbfQM7yBAZ0lkKjS7FqWUcpDGgE5fumO29V
	BjCGl7ScfCNs6aZK+l8jsl8KciYcvJfzkK3Wf6bz6KdIxRpj8lZszh8mxzU9YLID
	lm/6k1K6iZKmKUq4EFte2/AWBqyoqB0LIYDIvTc6PW2CA5AiREMZr6rZzG7+Ef7J
	mQyydswDPpCF5evc+yzzhLjey7ydwPP7KXff//3Eh9UVAebXu+yvlJ8F46jEOQgP
	8JJBbg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe80vdr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 03:28:52 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3515d2fc5ebso5721376eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 20:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791430131; x=1792034931; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h5GNPmOtb6vRXX69AT9xHsFaqITJ4EycmZwhRBnhLEI=;
        b=XkXJC0ZZmI2CPZSgxfKadhQnQ0dhs7jqqd7lC5N1yvfj3i9/qfi8zi9n/pKukgeYfy
         tOd8+neT6++F51JypgO48QszHKVjhODQf3ox5/Nqqsv4TRHu02lrOkreb0oZIaHPj9Th
         8Q9RTx6TyHqLZI9oMxLJCSzNqAIIdcMBCUq4c8ws1+qBoG6uY50yx7JzQNFlzi2y/MqB
         8cztrjZAUZMqszdGI/mpPLSHED/BZeHDl3nsDMP+/02e7OEGvu4jAOpLCOb9Wjbg9wH/
         CmnDKAohcolX9FnwhxmC7TI9ws5r8meg5y9HdBVUcIVy3c2x9aKuPy+9JV6RZ67V8Nee
         kcHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791430131; x=1792034931;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h5GNPmOtb6vRXX69AT9xHsFaqITJ4EycmZwhRBnhLEI=;
        b=ErI6o0xqRkhrcyreDaCM0iyRPIoN5XBFMdUlrGO/K7y/w+7Jtcm0gsk2uu3dAC+VeT
         PUIrDM+AeX2I1wWco/l7GoCBnsziFpUTyUwMHnG57D/pm1yX75VIjD743ylELHLosEXs
         SIJoy2SXHcqEupXNQ7f2yPiEXI1jAVaQhj1epQaelVw6V7St8nJmeydzLc2lYmyf4i6e
         SFeDhEkW/+vS/rzjJsBIQfLtTUegQH17REWRFLNxuWEMBlOdxhykT2b4WafbIaCte+ch
         8F4URNdDcCEa6pB36mPjfIXVT2PVQ/CC5Q1NdbIwcwnD+eJxaWj1F46d4tXAyqz4GkEA
         xhug==
X-Forwarded-Encrypted: i=1; AKwUvBzU6cWbKBzmTgYWhZjuE8HCtLuMXzVcfJA8LT1fTpZFyuirUK00dYbfCxvvSAVjxxoy35BMlVovXeXzf0Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYJq1N2H8W+kcu+g+hvgHLSQBE9ja27ifvZz4oPJlCmDwWaPHokf
	Dc2uhYJmSPOzb3t5F3Z4wb6mDlU22Ldh132DpTgCbyO1kH0AXqQ7r75sOHxL4/4zJXht1LSXkw/
	9duuuZZOOwBNHYe0l03SvankyIXMPygxoBid1WQHFz6NR+YCnkmFAqKebwfe5Hrj97A==
X-Gm-Gg: AYBFou2wfuXTIyywGsKIxc/ExNabCD2uvF6084ej2Wg1d/7k3wSxbi6qKL27GlTeC+3
	xnvYr/kQTtFiXZCn9TsK0NWXYRbtUyqi6bcCrD3WBYY0qhPWPYULqy0xUKfGqzyoSys/jur/mIa
	tqHkPGOs3S6aTHnCOBII5fYn+ksKtIGLDW3JsHABK5KGAMfoqyVVnPMe9AGdp0TxzKOc4BLXztj
	PkXXRc8ETfgte5lj0LqIKsiwS1hE2E9T8V49WS5l7d7NuyA204HSKURCT3tEBUVzQjK85ULj8lp
	bHbGRHNmidzx8gBW5k+NbZJKWgL6fgljskrGB5TVFQq3E1FuAvzwfGKKGZRhpZDdJxYihARzg8R
	K/eMLh1wLgAmhHoaLt806dOZyGloN6F+Hca82H47DMCfQAFeVOEv7yiFXFA==
X-Received: by 2002:a05:693c:810b:b0:33b:ea8c:811b with SMTP id 5a478bee46e88-3515dbd55e8mr4963594eec.5.1791430131121;
        Wed, 07 Oct 2026 20:28:51 -0700 (PDT)
X-Received: by 2002:a05:693c:810b:b0:33b:ea8c:811b with SMTP id 5a478bee46e88-3515dbd55e8mr4963556eec.5.1791430130414;
        Wed, 07 Oct 2026 20:28:50 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35179d07566sm2168349eec.30.2026.10.07.20.28.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 20:28:49 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Wed, 07 Oct 2026 20:27:13 -0700
Subject: [PATCH RFC v2 07/10] firmware: riscv: rpmi-tee: register TEE
 services and support calls
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261007-riscv-rpmi-tee-abi-v2-7-45939a13d223@oss.qualcomm.com>
References: <20261007-riscv-rpmi-tee-abi-v2-0-45939a13d223@oss.qualcomm.com>
In-Reply-To: <20261007-riscv-rpmi-tee-abi-v2-0-45939a13d223@oss.qualcomm.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>, Rahul Pathak <rahul@summations.net>,
        Anup Patel <anup@brainfault.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Amirreza Zarrabi <amrzar@gmail.com>,
        Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>,
        Marouene Boubakri <marouene.boubakri@oss.nxp.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org, op-tee@lists.trustedfirmware.org,
        devicetree@vger.kernel.org,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAxMyBTYWx0ZWRfX2GLpVLrhNrNG
 JHMjHwerM0fqivMgOoZ0pB7K1GcYkT2y2EzTZxm73CkglHCLHxHmrcId0T6dzjLDvktYrey2Sjb
 cIgJL7yJInLq1TAuhZGlFpKTUD5jNawmRNINWnGwDiaw3KjeU2E4ncOhiA708vrfXL2zGU7FbhO
 lxWvI6knPemonEjYv2Yh99gRkCTpmHb795yvlTpkTOYdveZGuf3U5nlc0WlW+ebzt3r8Qf1F48j
 sCMfovsarsLDPK/v0mjJQ2Kas5m7bEz1Nk9ph5kFofigBKeerrCmk1AWjoWbAh6YM3FxJQ86leU
 OO6SeDeNJDN3I7IamrpXqToO6kkwteBVwAS3FFMjXWw/EaCxeHI9CY9Cs7ypPkQJ2yCre/5yC0G
 NFjNGqDPO2w/NVuGGVMSCXsEkyVK+nzU8Biz12yXp7ag5KMZLtDQ6YZzRuLc0TK8SqwpHzaFWDR
 zYucimrUF1gALNiMDog==
X-Proofpoint-GUID: iwl9m7wfcbXx82Tt0V42GwQ7_3qDPQfa
X-Proofpoint-ORIG-GUID: iwl9m7wfcbXx82Tt0V42GwQ7_3qDPQfa
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAxMyBTYWx0ZWRfXyJ66zoEy8Oc6
 YAbpmwrnSBp8Ei5x2JINPq9KiG6srkymc+NF8rzUHjKtch7khRmdnpvKRwGt5lQ7ri2PiHZjoGk
 en2cUTVgIQxyFo9hezjAdBYqzd6Jfz8=
X-Authority-Analysis: v=2.4 cv=MPT1C8Zl c=1 sm=1 tr=0 ts=6ac70df4 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=y-vMUYROV6c7iJA4GfAA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_01,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080013

Register discovered TEE services as RPMI TEE bus devices so service
drivers can bind to them.

Provide TEE_CALL operations for exchanging service-defined requests
and responses, and expose the transport's payload limits to clients.

Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 drivers/firmware/riscv_rpmi_tee/driver.c           | 278 ++++++++++++++++++++-
 drivers/firmware/riscv_rpmi_tee/rpmi_tee_private.h |  13 +
 include/linux/rpmi_tee.h                           |  35 +++
 3 files changed, 325 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/riscv_rpmi_tee/driver.c b/drivers/firmware/riscv_rpmi_tee/driver.c
index a70b8be41bed..a683f7d28c25 100644
--- a/drivers/firmware/riscv_rpmi_tee/driver.c
+++ b/drivers/firmware/riscv_rpmi_tee/driver.c
@@ -5,16 +5,52 @@
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
-#include <linux/unaligned.h>
 #include <linux/mailbox_client.h>
 #include <linux/mailbox/riscv-rpmi-message.h>
+#include <linux/cleanup.h>
+#include <linux/list.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/rpmi_tee.h>
+#include <linux/slab.h>
+#include <linux/unaligned.h>
 
 #include "rpmi_tee_private.h"
 
+/**
+ * struct rpmi_tee_call_req - TEE_CALL request prefix
+ * @sender_id: Calling REE endpoint identifier.
+ * @target_id: Destination TEE endpoint identifier.
+ * @service: UUID of the target service.
+ * @service_data_len: Length of @service_data in bytes.
+ * @service_data: Service-defined request data.
+ */
+struct rpmi_tee_call_req {
+	__le32 sender_id;
+	__le32 target_id;
+	u8 service[UUID_SIZE];
+	__le32 service_data_len;
+	u8 service_data[];
+} __packed;
+
+/**
+ * struct rpmi_tee_call_resp - TEE_CALL response prefix
+ * @status: RPMI completion status.
+ * @service_data_len: Length of @service_data in bytes.
+ * @service_data: Service-defined response data.
+ */
+struct rpmi_tee_call_resp {
+	__le32 status;
+	__le32 service_data_len;
+	u8 service_data[];
+} __packed;
+
+struct rpmi_tee_child {
+	struct list_head node;
+	struct rpmi_tee_device *rdev;
+};
+
 /* rpmi_tee_send_with_status() - Send an RPMI TEE service request. */
 int rpmi_tee_send_with_status(struct rpmi_tee_transport *priv, u32 service_id,
 			      const void *req, size_t req_len, void *resp,
@@ -43,6 +79,47 @@ int rpmi_tee_send_with_status(struct rpmi_tee_transport *priv, u32 service_id,
 	return 0;
 }
 
+/**
+ * rpmi_tee_send() - Send an RPMI TEE service request
+ * @priv: RPMI TEE transport
+ * @service_id: RPMI TEE service identifier
+ * @req: Request data
+ * @req_len: Request data length
+ * @resp: Response data buffer, or %NULL for a status-only response
+ * @resp_len: On entry, response buffer capacity; on success, response length
+ *
+ * Pass both @resp and @resp_len as %NULL when the service has no response
+ * payload beyond the mandatory RPMI status word.
+ *
+ * Return: 0 on success, or a negative error code.
+ */
+static int rpmi_tee_send(struct rpmi_tee_transport *priv, u32 service_id,
+			 const void *req, size_t req_len, void *resp,
+			 size_t *resp_len)
+{
+	__le32 status_resp;
+	size_t status_resp_len = sizeof(status_resp);
+	s32 status;
+	int ret;
+
+	if (!resp && !resp_len) {
+		resp = &status_resp;
+		resp_len = &status_resp_len;
+	} else if (!resp || !resp_len) {
+		return -EINVAL;
+	}
+
+	ret = rpmi_tee_send_with_status(priv, service_id, req, req_len, resp,
+					resp_len, &status);
+	if (ret)
+		return ret;
+
+	if (status == RPMI_ERR_NO_DATA)
+		return -ENODATA;
+
+	return rpmi_to_linux_error(status);
+}
+
 /**
  * rpmi_tee_get_attr() - Get an RPMI mailbox attribute
  * @priv: RPMI TEE transport
@@ -95,12 +172,202 @@ static int rpmi_tee_check_transport(struct rpmi_tee_transport *priv)
 	ret = rpmi_tee_get_attr(priv, RPMI_MBOX_ATTR_MAX_MSG_DATA_SIZE, &value);
 	if (ret)
 		return ret;
+	/* The mandatory TEE_CALL request and response must fit the mailbox. */
+	if (value < sizeof(struct rpmi_tee_call_req) ||
+	    value < sizeof(struct rpmi_tee_call_resp))
+		return -EMSGSIZE;
 
 	priv->mbox.max_msg_data_size = value;
+	priv->max_call_req_size = value - sizeof(struct rpmi_tee_call_req);
+	priv->max_call_resp_size = value - sizeof(struct rpmi_tee_call_resp);
+
+	return 0;
+}
+
+/* RPMI TEE SERVICE GRP API. */
+
+/* Return the transport that owns @rdev. */
+static struct rpmi_tee_transport *
+rpmi_tee_device_to_transport(struct rpmi_tee_device *rdev)
+{
+	return dev_get_drvdata(rdev->dev.parent);
+}
+
+static int rpmi_tee_op_msg_limits_get(struct rpmi_tee_device *rdev,
+				      struct rpmi_tee_msg_limits *limits)
+{
+	struct rpmi_tee_transport *priv = rpmi_tee_device_to_transport(rdev);
+
+	if (!limits)
+		return -EINVAL;
+
+	limits->max_req_size = priv->max_call_req_size;
+	limits->max_resp_size = priv->max_call_resp_size;
+
+	return 0;
+}
+
+/**
+ * rpmi_tee_op_call - Invoke a service offered by a TEE endpoint
+ * @rdev: TEE service device.
+ * @req: Service-defined request data.
+ * @req_len: Length of @req in bytes.
+ * @resp: Buffer for service-defined response data.
+ * @resp_len: On entry, capacity of @resp; on success, response length.
+ *
+ * MPXY can return -ENOSPC after the TEE has processed the request when the
+ * response exceeds the supplied buffer. Callers must not blindly retry a
+ * non-idempotent request in that case.
+ *
+ * Return: 0 on success, or a negative error code.
+ */
+static int rpmi_tee_op_call(struct rpmi_tee_device *rdev, const void *req,
+			    size_t req_len, void *resp, size_t *resp_len)
+{
+	struct rpmi_tee_transport *priv = rpmi_tee_device_to_transport(rdev);
+	size_t call_req_len, call_resp_len;
+	u32 service_data_len;
+	int ret;
+
+	if (!resp_len || (!req && req_len) || (!resp && *resp_len))
+		return -EINVAL;
+
+	/* TEE_CALL payload must fit the mailbox. */
+	if (req_len > priv->max_call_req_size ||
+	    *resp_len > priv->max_call_resp_size)
+		return -EMSGSIZE;
+
+	call_req_len = sizeof(struct rpmi_tee_call_req) + req_len;
+	call_resp_len = sizeof(struct rpmi_tee_call_resp) + *resp_len;
+
+	struct rpmi_tee_call_req *call_req __free(kfree) =
+		kzalloc(call_req_len, GFP_KERNEL);
+	if (!call_req)
+		return -ENOMEM;
+
+	struct rpmi_tee_call_resp *call_resp __free(kfree) =
+		kzalloc(call_resp_len, GFP_KERNEL);
+	if (!call_resp)
+		return -ENOMEM;
+
+	call_req->sender_id = cpu_to_le32(priv->self_id);
+	call_req->target_id = cpu_to_le32(rdev->endpoint_id);
+	export_uuid(call_req->service, &rdev->uuid);
+	call_req->service_data_len = cpu_to_le32(req_len);
+	if (req_len)
+		memcpy(call_req->service_data, req, req_len);
+	/* Make TEE CALL. */
+	ret = rpmi_tee_send(priv, RPMI_TEE_SRV_CALL, call_req, call_req_len,
+			    call_resp, &call_resp_len);
+	if (ret)
+		return ret;
+
+	if (call_resp_len < sizeof(*call_resp))
+		return -EPROTO;
+	service_data_len = get_unaligned_le32(&call_resp->service_data_len);
+	/* Verify the firmware-reported length fits the actual response. */
+	if (service_data_len != call_resp_len - sizeof(*call_resp))
+		return -EPROTO;
+
+	if (service_data_len)
+		memcpy(resp, call_resp->service_data, service_data_len);
+	*resp_len = service_data_len;
+
+	return 0;
+}
+
+static const struct rpmi_tee_info_ops rpmi_tee_info_ops = {
+	.msg_limits_get = rpmi_tee_op_msg_limits_get,
+};
+
+static const struct rpmi_tee_msg_ops rpmi_tee_msg_ops = {
+	.call = rpmi_tee_op_call,
+};
+
+static const struct rpmi_tee_ops rpmi_tee_ops = {
+	.info_ops = &rpmi_tee_info_ops,
+	.msg_ops = &rpmi_tee_msg_ops,
+};
+
+static void rpmi_tee_unregister_devices(struct rpmi_tee_transport *priv)
+{
+	struct rpmi_tee_child *child, *tmp;
+
+	list_for_each_entry_safe(child, tmp, &priv->devices, node) {
+		list_del(&child->node);
+		rpmi_tee_device_unregister(child->rdev);
+		kfree(child);
+	}
+}
+
+static struct rpmi_tee_device *
+rpmi_tee_find_device(struct rpmi_tee_transport *priv, const uuid_t *uuid,
+		     u32 endpoint_id)
+{
+	struct rpmi_tee_child *child;
+
+	list_for_each_entry(child, &priv->devices, node) {
+		if (child->rdev->endpoint_id == endpoint_id &&
+		    uuid_equal(&child->rdev->uuid, uuid))
+			return child->rdev;
+	}
+
+	return NULL;
+}
+
+static int
+rpmi_tee_register_devices(struct rpmi_tee_transport *priv,
+			  const struct rpmi_tee_discovered_endpoint *ep)
+{
+	u32 i;
+
+	for (i = 0; i < ep->service_count; i++) {
+		const uuid_t *uuid = &ep->services[i];
+
+		/* Discard duplicate devices in the same endpoint. */
+		if (rpmi_tee_find_device(priv, uuid, ep->ep_id))
+			continue;
+
+		struct rpmi_tee_child *child __free(kfree) =
+			kzalloc_obj(*child, GFP_KERNEL);
+		if (!child)
+			return -ENOMEM;
+
+		child->rdev =
+			rpmi_tee_device_register(uuid, ep->ep_id,
+						 &rpmi_tee_ops, priv->dev);
+		if (IS_ERR(child->rdev))
+			return PTR_ERR(child->rdev);
+
+		list_add_tail(&no_free_ptr(child)->node, &priv->devices);
+	}
 
 	return 0;
 }
 
+static int rpmi_tee_setup_endpoints(struct rpmi_tee_transport *priv)
+{
+	struct rpmi_tee_discovered_endpoint *ep;
+	struct rpmi_tee_discovery system;
+	int ret;
+
+	ret = rpmi_tee_discover_endpoints(priv, &system);
+	if (ret)
+		return ret;
+
+	list_for_each_entry(ep, &system.eps, node) {
+		ret = rpmi_tee_register_devices(priv, ep);
+		if (ret) {
+			rpmi_tee_unregister_devices(priv);
+			break;
+		}
+	}
+
+	rpmi_tee_free_discovery(&system);
+
+	return ret;
+}
+
 static int rpmi_tee_transport_probe(struct platform_device *pdev)
 {
 	struct rpmi_tee_transport *priv;
@@ -112,6 +379,7 @@ static int rpmi_tee_transport_probe(struct platform_device *pdev)
 
 	priv->dev = &pdev->dev;
 	platform_set_drvdata(pdev, priv);
+	INIT_LIST_HEAD(&priv->devices);
 	priv->mbox.client.dev = &pdev->dev;
 	priv->mbox.client.tx_sync = true;
 	priv->mbox.chan = mbox_request_channel(&priv->mbox.client, 0);
@@ -126,6 +394,13 @@ static int rpmi_tee_transport_probe(struct platform_device *pdev)
 		goto out_failed;
 	}
 
+	ret = rpmi_tee_setup_endpoints(priv);
+	if (ret) {
+		dev_err_probe(&pdev->dev, ret,
+			      "failed to discover RPMI TEE services\n");
+		goto out_failed;
+	}
+
 	return 0;
 
 out_failed:
@@ -138,6 +413,7 @@ static void rpmi_tee_transport_remove(struct platform_device *pdev)
 {
 	struct rpmi_tee_transport *priv = platform_get_drvdata(pdev);
 
+	rpmi_tee_unregister_devices(priv);
 	mbox_free_channel(priv->mbox.chan);
 }
 
diff --git a/drivers/firmware/riscv_rpmi_tee/rpmi_tee_private.h b/drivers/firmware/riscv_rpmi_tee/rpmi_tee_private.h
index ba0e7cb59b6d..07e6b9913cb7 100644
--- a/drivers/firmware/riscv_rpmi_tee/rpmi_tee_private.h
+++ b/drivers/firmware/riscv_rpmi_tee/rpmi_tee_private.h
@@ -17,6 +17,7 @@
 #define RPMI_TEE_SRV_PROBE_SYSTEM	0x03
 #define RPMI_TEE_SRV_PROBE_DOMAIN	0x04
 #define RPMI_TEE_SRV_PROBE_ENDPOINT	0x05
+#define RPMI_TEE_SRV_CALL		0x18
 
 struct rpmi_tee_mbox {
 	struct mbox_client client;
@@ -24,10 +25,22 @@ struct rpmi_tee_mbox {
 	u32 max_msg_data_size;
 };
 
+/**
+ * struct rpmi_tee_transport - State for one RPMI TEE transport instance
+ * @dev: Parent platform device.
+ * @mbox: RPMI mailbox transport state.
+ * @max_call_req_size: Maximum TEE_CALL request payload size in bytes.
+ * @max_call_resp_size: Maximum TEE_CALL response payload size in bytes.
+ * @self_id: Local REE physical endpoint identifier.
+ * @devices: List of registered TEE service devices.
+ */
 struct rpmi_tee_transport {
 	struct device *dev;
 	struct rpmi_tee_mbox mbox;
+	size_t max_call_req_size;
+	size_t max_call_resp_size;
 	u32 self_id;
+	struct list_head devices;
 };
 
 /* Report local transport errors separately from the returned RPMI status. */
diff --git a/include/linux/rpmi_tee.h b/include/linux/rpmi_tee.h
index c499f0427833..a76055149996 100644
--- a/include/linux/rpmi_tee.h
+++ b/include/linux/rpmi_tee.h
@@ -41,6 +41,41 @@ struct rpmi_tee_driver {
 #define to_rpmi_tee_drv(d) \
 	container_of_const(d, struct rpmi_tee_driver, driver)
 
+/**
+ * struct rpmi_tee_msg_limits - TEE_CALL service payload limits
+ * @max_req_size: Maximum request payload size in bytes.
+ * @max_resp_size: Maximum response payload size in bytes.
+ *
+ * Limits exclude the RPMI TEE_CALL request and response prefixes, but include
+ * any service-specific headers supplied by the caller.
+ */
+struct rpmi_tee_msg_limits {
+	size_t max_req_size;
+	size_t max_resp_size;
+};
+
+/**
+ * struct rpmi_tee_info_ops - RPMI TEE transport information operations
+ * @msg_limits_get: Return cached TEE_CALL payload limits for the transport
+ *	serving @rdev in @limits. Limits remain fixed for the transport lifetime.
+ *	Return 0 on success, or a negative error code on failure.
+ */
+struct rpmi_tee_info_ops {
+	int (*msg_limits_get)(struct rpmi_tee_device *rdev,
+			      struct rpmi_tee_msg_limits *limits);
+};
+
+struct rpmi_tee_msg_ops {
+	int (*call)(struct rpmi_tee_device *rdev, const void *req,
+		    size_t req_len, void *resp, size_t *resp_len);
+};
+
+/* RPMI TEE transport operation groups. */
+struct rpmi_tee_ops {
+	const struct rpmi_tee_info_ops *info_ops;
+	const struct rpmi_tee_msg_ops *msg_ops;
+};
+
 extern const struct bus_type rpmi_tee_bus_type;
 
 #if IS_REACHABLE(CONFIG_RISCV_RPMI_TEE_TRANSPORT)

-- 
2.34.1

