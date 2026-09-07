Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB8D441633
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 09:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788773365; cv=none; b=V2ysh3G7F9tmIMvUMzygjJwuF9A5FKM8He39pEhGv0EJLjdcZyx8P8LI9hUw5qDXssPZq2jdUk/mYB1y4TpoU8y+Y8xdlSgyzbdaXW8EnW2bHT2khQFkJqJVDg4ZWpwsRzwJ9dPkFEZDqso38VO5CtIrr70uxsNRByEYXCEQSQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788773365; c=relaxed/simple;
	bh=5OFj38Tcvf+R7MGoIoLxNgPUROPcqDEUp/AQ77EIiMQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QOIX1QUVv+lnch51uEfC5NRk/z5MKYOHabEf9yFywbWTgPRPbmrLU1WKpfD1+EtcG764oBBD6v8yeKT4kfAKJM45S2HbwQp3l3tU3mNYhDD8jIpGggxac5dOWIO/HNNF6kbOkPP18FYJbSB1rJLSpVngpE4ZFgNml1JQrGLQBNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZDE3U/Db; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FQZeVL2U; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZDE3U/Db";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FQZeVL2U"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6878RlvE3872901
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 09:29:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pYYqRV2iBkoiq6DWxY5FhTCZnkp5Uyb9liRGD/HfJWw=; b=ZDE3U/Db6VvkWMCN
	GdsGWehmUMnxYBxw3jSehkpaU4cJfBfn4ACl1Tk9hD+c79V8me7MGCIsIwJrqDcd
	NHgzkP19enQ4VJGPAJ/mipnVGJkUUIXLrp+YneO73YqU/FGdkax0Um8ul1kFqtT8
	cg0P19h+L+Z6J2MU9PXLwXzrxo76J3mHxsgEQJVyLxn64KQ9I1BSTh6aX7zySgRk
	Pf/7Bfa+BHjqC3HhBEjw0cqtAc+ZzrVXTNghB4biy9F06b8jBCsDEHDKuvKr7xe6
	8f53i6IAGv1fXhXPwnmAe0mUqB1nzHy/x48QPPsWD+2SmTNzZRseHK2Lzn8YDIcB
	XYcfiA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghssg09v5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 09:29:18 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc435388657so1341748a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 02:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788773357; x=1789378157; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pYYqRV2iBkoiq6DWxY5FhTCZnkp5Uyb9liRGD/HfJWw=;
        b=FQZeVL2U2m+TDfULQbcljabgjT8EWfFTl6WPyZh4QOrTkZBCLBYd9NtPFEwJKzu/Ay
         dTtDxnRNDzMTQfiYDKykChlYnm/bQI+pmZ74hEdTc1ASJktp7ENqMenRschJZ2rlcJ0i
         iw5dJd1z8JTCAteY+72o5ei7oZN600RLHad3fkI5Wi37nUnpOzX787TlDm7TL559D7HZ
         q2VQnlQLQThsX+HBibmpzKwvYOYv33RoGaIbUAkHz9+lmu+8xKJGMjHfMrINUWohymQy
         ynprWOwIavK6lhuooo1NwU3lNLW/wdzzm/vEg9cwsEcK0ZCpjWdetGBhKcn/6alYi+vh
         gdHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788773357; x=1789378157;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pYYqRV2iBkoiq6DWxY5FhTCZnkp5Uyb9liRGD/HfJWw=;
        b=kabamiMxCcIXrXY1ix/O+ni1snUgco3HLBnINlWqDGLiGYK9o5viMOcAtidzxj2mcy
         PMIz4jmq48uKRNqOyPtPqkRCkCSOOSIIoTD0pdoDVtrZLIpYuRYGmL6yQ1cLBX8zb9GC
         9ocx64KiYj06IlprnGhpBseUA9QQco+xUtwviH+CG01c7aMMy/BvYjqD0jUiQcNz26/z
         YwQE3Tk7EREjuJHHoy+caKHn4WnFTUxzNTYfO0dxFeP8HzL8DDdzxzycM9gUzDuPiOiy
         1K/YHCx6SPLIA+bxLCmSA8LuECG3t2ZrtagQ7MHHCYoG0ZejiuCcvmISN1jIqWvs6zIq
         Q7dQ==
X-Forwarded-Encrypted: i=1; AKwUvBzackjjcSFytKhtyoQcaolrDcPXxreHmRgldnV6WA47NA8Ji5+QwTf3YPingcxD99DNs1mpJrJBJMs6IRs=@vger.kernel.org
X-Gm-Message-State: AFuF++lidk4h7RaMID8D+cl5zG90UG4VRrFJCE2uG8aPUXBKDHzRY3NA
	RFcwoc01Azhh4Y4y/Hfid7Um7UTGdRPmKWoPpyR6rhoAOw7qJtUR78t+Vs8a9OJV8mOlD8dpSkD
	0Wm6C0BlVldZZlCMzb2S2yUz61x8VjL5AbrN7xVv8ANDgSGxKIG0B5a6FPyj7n21jc1Y=
X-Gm-Gg: AYBFou2Y/w3p/0cX+tkh1u0CAPyIO0UmyAbey8/M88wEGXkUH+G8GCVtk0gmanhL6E3
	heWEXdwfwDnNTTX4QyyftiGF44piNG+LS4nIUZYRcpjlahpmfUYqiuG9k/O2STroZGRwukukH3h
	087aUzY7kuzUA7p1YFiNDsSQHTmf1Tnnqs/wTAPIynEjAO4GUaiAaE3Y4KWwdUqbT1i4hRyKKPG
	LMbguh/rgGP/qI6M+jN5UXViHABtrRz8eMyferMCw/puyduge+Lrj88ErU1gOCNAUR4vkdAOeM1
	4vzuVYf0VhEXVJoDBQUlDoCcLoQAFMUEfmlq7b1PCi7k9cHJxnRecDqugKzEFg4sFbfJUsrnLdB
	r+WCSFOwG8i/D2rA5FvwI336mlO8A0eh+Ww==
X-Received: by 2002:a05:6a20:729d:b0:3d3:ae0f:5268 with SMTP id adf61e73a8af0-3da3a152b4bmr32068146637.20.1788773357343;
        Mon, 07 Sep 2026 02:29:17 -0700 (PDT)
X-Received: by 2002:a05:6a20:729d:b0:3d3:ae0f:5268 with SMTP id adf61e73a8af0-3da3a152b4bmr32068096637.20.1788773356742;
        Mon, 07 Sep 2026 02:29:16 -0700 (PDT)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-338778fb926sm1627830eec.31.2026.09.07.02.29.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 02:29:16 -0700 (PDT)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Date: Mon, 07 Sep 2026 14:58:42 +0530
Subject: [PATCH v2 2/3] tpm: Introduce Qualcomm TPM driver
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-tpm_qcom_driver-v2-2-71a6b1752da8@oss.qualcomm.com>
References: <20260907-tpm_qcom_driver-v2-0-71a6b1752da8@oss.qualcomm.com>
In-Reply-To: <20260907-tpm_qcom_driver-v2-0-71a6b1752da8@oss.qualcomm.com>
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>,
        Peter Huewe <peterhuewe@gmx.de>, Jarkko Sakkinen <jarkko@kernel.org>,
        Jason Gunthorpe <jgg@ziepe.ca>
Cc: linux-arm-msm@vger.kernel.org, op-tee@lists.trustedfirmware.org,
        linux-kernel@vger.kernel.org, linux-integrity@vger.kernel.org,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDEwMyBTYWx0ZWRfX3x+rVKvvs8FU
 eZLyZIpTwAEmQrgkAFuk3cbIlVf9xoaV2AvxyjhFaCTkYCTBMzX4gq1xzMjgecuoIp0VQ0lyGu1
 G7JZmMGlq0+Sw/UdMdKYVyQSNYQCKy0FHNSkLaJOzsDjhkiWlaHvHKq8oo3EvuytJXZZ8cVvNWC
 c2Oyu1hLKCLHuQOHQCJkOlU8qVXxO+m7ieSEW7z29jB9iYcfW0Deix/kgo0YidxgPChtl+QdtzR
 6nWKCq1qxZlPVsqGNXOaDlac/9So+ecU90pBMfXQaP07uRnmpI1/CLbnZhP8ymBU4lTkw/det4a
 Ehb9DWV5eTpakbPGW9+Kd6aLNjk8ERiZ1lGNLHu+ayU1Mksyiuh7OHMckyU83Kk5FGE8ZJPtaaQ
 FFgXq2mIbF4s6IQNSHyTrVUZJC5S8fdMw0opbbLxH1ecb9xHSTjYWbxL1WhSga51WoWAFmvdJAl
 uVROwRO6fG6540xIJDA==
X-Authority-Analysis: v=2.4 cv=MrJiLWae c=1 sm=1 tr=0 ts=6a9e83ee cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=SznZWX1XjBYefnwkKxkA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: xARj7UeuWUrdo4086yrfeKbT_nwH_yM8
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDEwMyBTYWx0ZWRfX+uKi2r052+Qg
 nrzeWVC/7BV3n9uA8XUMbC8YWtRcwx4Caf5sewMLvSSzAERuqmTOKo+kb0n7VFSaw/YVZL4Zofo
 itST2FkuEWvSR24zvmzaiuVz3hOtlzM=
X-Proofpoint-GUID: xARj7UeuWUrdo4086yrfeKbT_nwH_yM8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070103

Add a TPM chip driver for platforms where a TPM 2.0 instance is
implemented by a Trusted Application (TA) running in Qualcomm's Trusted
Execution Environment (QTEE), reachable over the QCOMTEE object-IPC
transport.

The driver discovers the qcom.tz.tpm TEE-bus device, opens a session
with the TPM TA, and register with tpm interface. This exposes the TA
through the standard /dev/tpm interface and the existing tpm2 command
layer. OS need not be aware underlying TPM instance is dTPM or fTPM.

Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
 drivers/char/tpm/Kconfig    |   9 ++
 drivers/char/tpm/Makefile   |   1 +
 drivers/char/tpm/tpm_qcom.c | 354 ++++++++++++++++++++++++++++++++++++++++++++
 drivers/char/tpm/tpm_qcom.h |  83 +++++++++++
 4 files changed, 447 insertions(+)

diff --git a/drivers/char/tpm/Kconfig b/drivers/char/tpm/Kconfig
index 5f672f2c01b0..05d704ed3632 100644
--- a/drivers/char/tpm/Kconfig
+++ b/drivers/char/tpm/Kconfig
@@ -243,6 +243,15 @@ config TCG_FTPM_TEE
 	help
 	  This driver proxies for firmware TPM running in TEE.
 
+config TCG_QCOM
+	tristate "Qualcomm TEE based TPM Interface"
+	depends on QCOMTEE
+	help
+	  This driver provides interface to run TPM instances with Trustzone
+	  having Qualcomm TPM TA running in Qualcomm TEE.
+	  The mechanism uses the object-IPC based transport provided by
+	  QCOMTEE.
+
 config TCG_SVSM
 	tristate "SNP SVSM vTPM interface"
 	depends on AMD_MEM_ENCRYPT
diff --git a/drivers/char/tpm/Makefile b/drivers/char/tpm/Makefile
index 5b5cdc0d32e4..471cbf49afd2 100644
--- a/drivers/char/tpm/Makefile
+++ b/drivers/char/tpm/Makefile
@@ -45,5 +45,6 @@ obj-$(CONFIG_TCG_CRB) += tpm_crb.o
 obj-$(CONFIG_TCG_ARM_CRB_FFA) += tpm_crb_ffa.o
 obj-$(CONFIG_TCG_VTPM_PROXY) += tpm_vtpm_proxy.o
 obj-$(CONFIG_TCG_FTPM_TEE) += tpm_ftpm_tee.o
+obj-$(CONFIG_TCG_QCOM) += tpm_qcom.o
 obj-$(CONFIG_TCG_SVSM) += tpm_svsm.o
 obj-$(CONFIG_TCG_LOONGSON) += tpm_loongson.o
diff --git a/drivers/char/tpm/tpm_qcom.c b/drivers/char/tpm/tpm_qcom.c
new file mode 100644
index 000000000000..ef29c66f18ae
--- /dev/null
+++ b/drivers/char/tpm/tpm_qcom.c
@@ -0,0 +1,354 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ *
+ */
+
+#include <linux/mm.h>
+#include <linux/slab.h>
+#include <linux/tee.h>
+#include <linux/tee_drv.h>
+#include <linux/tpm.h>
+#include <linux/uuid.h>
+
+#include "tpm.h"
+#include "tpm_qcom.h"
+
+/* UUID of the QTEE-bus device representing the TPM TA. */
+static const uuid_t tpm_qcom_uuid =
+	UUID_INIT(0xaabcb593, 0x7083, 0x5536,
+		  0xac, 0x27, 0x3d, 0x2d, 0x89, 0x41, 0x9d, 0xdb);
+
+static void tpm_qcom_release_object(struct tee_context *ctx,
+				    struct tee_param_objref object)
+{
+	struct tee_ioctl_object_invoke_arg inv_arg = {};
+
+	inv_arg.id = object.id;
+	inv_arg.op = QCOMTEE_MSG_OBJECT_OP_RELEASE;
+	inv_arg.num_params = 0;
+
+	tee_client_object_invoke_func(ctx, &inv_arg, NULL);
+}
+
+static int tpm_qcom_get_client_env_obj(struct tee_context *ctx,
+				       struct tee_param_objref *client_env_obj)
+{
+	struct tee_ioctl_object_invoke_arg inv_arg = {};
+	struct tee_param param[2] = {};
+	int ret;
+
+	inv_arg.id = TEE_OBJREF_NULL;
+	inv_arg.op = QCOMTEE_ROOT_OP_REG_WITH_CREDENTIALS;
+	inv_arg.num_params = 2;
+
+	param[0].attr = TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_INPUT;
+	param[0].u.objref.id = TEE_OBJREF_NULL;
+	param[1].attr = TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_OUTPUT;
+
+	ret = tee_client_object_invoke_func(ctx, &inv_arg, param);
+	if (ret < 0 || inv_arg.ret != 0)
+		return ret ?: inv_arg.ret;
+
+	*client_env_obj = param[1].u.objref;
+	return ret;
+}
+
+static int tpm_qcom_get_svc_obj(struct tee_context *ctx,
+				struct tee_param_objref client_env_obj,
+				struct tee_param_objref *tpm_svc_obj)
+{
+	struct tee_ioctl_object_invoke_arg inv_arg = {};
+	struct tee_param param[2] = {};
+	u32 tpm_uid = QCOMTEE_TPM_UID;
+	int ret;
+
+	inv_arg.id = client_env_obj.id;
+	inv_arg.op = QCOMTEE_OP_CLIENT_ENV_OPEN;
+	inv_arg.num_params = 2;
+
+	param[0].attr = TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INPUT;
+	param[0].u.ubuf = (struct tee_param_ubuf){ .addr = &tpm_uid,
+						    .size = sizeof(tpm_uid) };
+	param[1].attr = TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_OUTPUT;
+
+	ret = tee_client_object_invoke_func(ctx, &inv_arg, param);
+	if (ret < 0 || inv_arg.ret != 0)
+		return ret ?: inv_arg.ret;
+
+	*tpm_svc_obj = param[1].u.objref;
+	return ret;
+}
+
+static int tpm_qcom_send_command(struct tpm_qcom_private *pvt_data,
+				 u32 locality, void *req, size_t req_len,
+				 void *rsp, size_t *rsp_len)
+{
+	struct tee_ioctl_object_invoke_arg inv_arg = {};
+	struct tee_param param[3] = {};
+	u8 locality_arg = locality;
+	int ret;
+
+	inv_arg.id = pvt_data->tpm_svc_obj.id;
+	inv_arg.op = QCOMTEE_TPM_OP_SEND_COMMAND;
+	inv_arg.num_params = 3;
+
+	param[0].attr = TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INPUT;
+	param[0].u.ubuf = (struct tee_param_ubuf){ .addr = &locality_arg,
+						   .size = sizeof(locality_arg) };
+	param[1].attr = TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INPUT;
+	param[1].u.ubuf = (struct tee_param_ubuf){ .addr = req, .size = req_len };
+	param[2].attr = TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT;
+	param[2].u.ubuf = (struct tee_param_ubuf){ .addr = rsp, .size = *rsp_len };
+
+	ret = tee_client_object_invoke_func(pvt_data->ctx, &inv_arg, param);
+	if (ret < 0 || inv_arg.ret != 0) {
+		dev_err(pvt_data->dev,
+			"send_command invoke ret: %d, err: 0x%x\n",
+			ret, inv_arg.ret);
+		return ret ?: inv_arg.ret;
+	}
+
+	*rsp_len = param[2].u.ubuf.size;
+
+	return ret;
+}
+
+static int tpm_qcom_get_ta_details(struct tpm_qcom_private *pvt_data)
+{
+	struct tpm_qcom_ta_version_req ver_req = {
+		.command_id = QCOMTEE_TPM_GET_TA_VERSION_ID,
+	};
+	struct tpm_qcom_ta_version_rsp ver_rsp;
+	size_t ver_rsp_len = sizeof(ver_rsp);
+	struct tpm_qcom_type_req type_req = {
+		.command_id = QCOMTEE_TPM_TYPE_ID,
+	};
+	struct tpm_qcom_type_rsp type_rsp;
+	size_t type_rsp_len = sizeof(type_rsp);
+	int ret;
+
+	ret = tpm_qcom_send_command(pvt_data, 0, &ver_req, sizeof(ver_req),
+				    &ver_rsp, &ver_rsp_len);
+	if (ret || ver_rsp_len < sizeof(ver_rsp) || ver_rsp.status != 0) {
+		dev_err(pvt_data->dev,
+			"failed to query TA version: ret=%d, status=%u\n",
+			ret, ret ? 0 : ver_rsp.status);
+		return ret ?: -EIO;
+	}
+
+	dev_info(pvt_data->dev, "TPM TA version %lu.%lu\n",
+		 FIELD_GET(QCOMTEE_TPM_TA_VERSION_MAJOR, ver_rsp.version_num),
+		 FIELD_GET(QCOMTEE_TPM_TA_VERSION_MINOR, ver_rsp.version_num));
+
+	ret = tpm_qcom_send_command(pvt_data, 0, &type_req, sizeof(type_req),
+				    &type_rsp, &type_rsp_len);
+	if (ret || type_rsp_len < sizeof(type_rsp) || type_rsp.status != 0) {
+		dev_err(pvt_data->dev,
+			"failed to query TPM type: ret=%d, status=%u\n",
+			ret, ret ? 0 : type_rsp.status);
+		return ret ?: -EIO;
+	}
+
+	switch (type_rsp.tpm_type) {
+	case QCOMTEE_TPM_TYPE_FTPM:
+		dev_info(pvt_data->dev, "TPM type: fTPM\n");
+		pvt_data->is_dtpm = false;
+		break;
+	case QCOMTEE_TPM_TYPE_DTPM:
+		dev_info(pvt_data->dev, "TPM type: dTPM\n");
+		pvt_data->is_dtpm = true;
+		break;
+	default:
+		dev_err(pvt_data->dev, "unsupported TPM type: 0x%08x\n",
+			type_rsp.tpm_type);
+		return -EIO;
+	}
+
+	return 0;
+}
+
+/* fTPM does not implement this command and to be invoked via dtpm only. */
+static void tpm_qcom_transfer(struct tpm_qcom_private *pvt_data,
+			      u32 transfer_state)
+{
+	struct tpm_qcom_transfer_req req = {
+		.command_id = QCOMTEE_TPM_TRANSFER_ID,
+		.transfer_state = transfer_state,
+	};
+	struct tpm_qcom_transfer_rsp rsp;
+	size_t rsp_len = sizeof(rsp);
+	int ret;
+
+	ret = tpm_qcom_send_command(pvt_data, 0, &req, sizeof(req), &rsp,
+				    &rsp_len);
+	if (ret || rsp_len < sizeof(rsp) || rsp.status != 0)
+		dev_warn(pvt_data->dev,
+			 "transfer state=%u hint failed: ret=%d, status=%u\n",
+			 transfer_state, ret, ret ? 0 : rsp.status);
+}
+
+static int tpm_qcom_cmd_ready(struct tpm_chip *chip)
+{
+	struct tpm_qcom_private *pvt_data = dev_get_drvdata(chip->dev.parent);
+
+	if (pvt_data->is_dtpm)
+		tpm_qcom_transfer(pvt_data, QCOMTEE_TPM_TRANSFER_START);
+
+	return 0;
+}
+
+static int tpm_qcom_go_idle(struct tpm_chip *chip)
+{
+	struct tpm_qcom_private *pvt_data = dev_get_drvdata(chip->dev.parent);
+
+	if (pvt_data->is_dtpm)
+		tpm_qcom_transfer(pvt_data, QCOMTEE_TPM_TRANSFER_END);
+
+	return 0;
+}
+
+/*
+ * The raw TPM2 command in @buf is sent directly as send_command's UBUF-in
+ * param and the raw TPM2 response is read back from its UBUF-out param.
+ */
+static int tpm_qcom_send(struct tpm_chip *chip, u8 *buf, size_t bufsiz,
+			 size_t cmd_len)
+{
+	struct tpm_qcom_private *pvt_data = dev_get_drvdata(chip->dev.parent);
+	size_t rsp_len = PAGE_ALIGN(MAX_RESPONSE_SIZE);
+	size_t copy_len;
+	int ret;
+
+	if (cmd_len > MAX_COMMAND_SIZE) {
+		dev_err(&chip->dev, "len=%zd exceeds MAX_COMMAND_SIZE\n", cmd_len);
+		return -EIO;
+	}
+
+	u8 *response __free(kfree) = kzalloc(rsp_len, GFP_KERNEL);
+	if (!response)
+		return -ENOMEM;
+
+	ret = tpm_qcom_send_command(pvt_data, 0, buf, cmd_len, response,
+				    &rsp_len);
+	if (ret < 0) {
+		dev_err(&chip->dev, "send_command failed: ret=%d\n", ret);
+		return ret;
+	}
+
+	copy_len = min_t(size_t, bufsiz, rsp_len);
+	memcpy(buf, response, copy_len);
+
+	return copy_len;
+}
+
+static const struct tpm_class_ops tpm_qcom_ops = {
+	.flags = TPM_OPS_AUTO_STARTUP,
+	.send = tpm_qcom_send,
+	.cmd_ready = tpm_qcom_cmd_ready,
+	.go_idle = tpm_qcom_go_idle,
+};
+
+static int tpm_qcom_ctx_match(struct tee_ioctl_version_data *ver,
+			      const void *data)
+{
+	return (ver->impl_id == TEE_IMPL_ID_QTEE);
+}
+
+static int tpm_qcom_probe(struct tee_client_device *tee_dev)
+{
+	struct device *dev = &tee_dev->dev;
+	struct tpm_qcom_private *pvt_data;
+	struct tee_param_objref client_env_obj;
+	struct tee_param_objref tpm_svc_obj;
+	struct tpm_chip *chip;
+	int rc, err;
+
+	pvt_data = devm_kzalloc(dev, sizeof(*pvt_data), GFP_KERNEL);
+	if (!pvt_data)
+		return -ENOMEM;
+
+	dev_set_drvdata(dev, pvt_data);
+
+	pvt_data->ctx = tee_client_open_context(NULL, tpm_qcom_ctx_match, NULL, NULL);
+	if (IS_ERR(pvt_data->ctx))
+		return -ENODEV;
+
+	rc = tpm_qcom_get_client_env_obj(pvt_data->ctx, &client_env_obj);
+	if (rc) {
+		err = -EINVAL;
+		goto out_ctx;
+	}
+
+	rc = tpm_qcom_get_svc_obj(pvt_data->ctx, client_env_obj, &tpm_svc_obj);
+	if (rc) {
+		err = -EINVAL;
+		goto out_client_env;
+	}
+	pvt_data->tpm_svc_obj = tpm_svc_obj;
+	pvt_data->dev = dev;
+
+	err = tpm_qcom_get_ta_details(pvt_data);
+	if (err)
+		goto out_svc_obj;
+
+	chip = tpm_chip_alloc(dev, &tpm_qcom_ops);
+	if (IS_ERR(chip)) {
+		dev_err(dev, "tpm_chip_alloc failed\n");
+		err = PTR_ERR(chip);
+		goto out_svc_obj;
+	}
+
+	pvt_data->chip = chip;
+	pvt_data->chip->flags |= TPM_CHIP_FLAG_TPM2 | TPM_CHIP_FLAG_SYNC;
+
+	err = tpm_chip_register(pvt_data->chip);
+	if (err) {
+		dev_err(dev, "tpm_chip_register failed with rc=%d\n", err);
+		goto out_chip;
+	}
+
+	tpm_qcom_release_object(pvt_data->ctx, client_env_obj);
+	return 0;
+
+out_chip:
+	put_device(&pvt_data->chip->dev);
+out_svc_obj:
+	tpm_qcom_release_object(pvt_data->ctx, tpm_svc_obj);
+out_client_env:
+	tpm_qcom_release_object(pvt_data->ctx, client_env_obj);
+out_ctx:
+	tee_client_close_context(pvt_data->ctx);
+	return err;
+}
+
+static void tpm_qcom_remove(struct tee_client_device *tee_dev)
+{
+	struct tpm_qcom_private *pvt_data = dev_get_drvdata(&tee_dev->dev);
+
+	tpm_chip_unregister(pvt_data->chip);
+	put_device(&pvt_data->chip->dev);
+	tpm_qcom_release_object(pvt_data->ctx, pvt_data->tpm_svc_obj);
+	tee_client_close_context(pvt_data->ctx);
+}
+
+static const struct tee_client_device_id tpm_qcom_id_table[] = {
+	{ tpm_qcom_uuid },
+	{}
+};
+MODULE_DEVICE_TABLE(tee, tpm_qcom_id_table);
+
+static struct tee_client_driver tpm_qcom_driver = {
+	.id_table	= tpm_qcom_id_table,
+	.probe		= tpm_qcom_probe,
+	.remove		= tpm_qcom_remove,
+	.driver		= {
+		.name	= "tpm_qcom",
+	},
+};
+
+module_tee_client_driver(tpm_qcom_driver);
+
+MODULE_DESCRIPTION("TPM driver for Qualcomm TPM TA");
+MODULE_AUTHOR("Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>");
+MODULE_LICENSE("GPL");
diff --git a/drivers/char/tpm/tpm_qcom.h b/drivers/char/tpm/tpm_qcom.h
new file mode 100644
index 000000000000..3945b12643b7
--- /dev/null
+++ b/drivers/char/tpm/tpm_qcom.h
@@ -0,0 +1,83 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef __TPM_QCOM_H__
+#define __TPM_QCOM_H__
+
+#include <linux/bitfield.h>
+#include <linux/tee_drv.h>
+#include <linux/tpm.h>
+#include <linux/uuid.h>
+
+#define QCOMTEE_ROOT_OP_REG_WITH_CREDENTIALS	5
+#define QCOMTEE_OP_CLIENT_ENV_OPEN		0
+#define QCOMTEE_MSG_OBJECT_OP_MASK		GENMASK(15, 0)
+#define QCOMTEE_MSG_OBJECT_OP_RELEASE		(QCOMTEE_MSG_OBJECT_OP_MASK - 0)
+
+#define QCOMTEE_TPM_OP_SEND_COMMAND	0
+
+/* UID of the "qcom.tz.tpm" service */
+#define QCOMTEE_TPM_UID			81
+
+/* Max buffer size supported by TPM TA */
+#define MAX_COMMAND_SIZE		SZ_4K
+#define MAX_RESPONSE_SIZE		SZ_4K
+
+#define QCOMTEE_TPM_GET_TA_VERSION_ID	0x0001000
+#define QCOMTEE_TPM_TA_VERSION_MAJOR	GENMASK(31, 16)
+#define QCOMTEE_TPM_TA_VERSION_MINOR	GENMASK(15, 0)
+
+struct tpm_qcom_ta_version_req {
+	u32 command_id;
+} __packed;
+
+struct tpm_qcom_ta_version_rsp {
+	u32 status;
+	u32 command_id;
+	u32 version_num;
+} __packed;
+
+#define QCOMTEE_TPM_TYPE_ID		0x0080000
+#define QCOMTEE_TPM_TYPE_DTPM		0x6454504dU
+#define QCOMTEE_TPM_TYPE_FTPM		0x6654504dU
+#define QCOMTEE_TPM_TYPE_NONE		0x4e6f6e65U
+
+struct tpm_qcom_type_req {
+	u32 command_id;
+} __packed;
+
+struct tpm_qcom_type_rsp {
+	u32 command_id;
+	u32 status;
+	u32 tpm_type;
+} __packed;
+
+/*
+ * dTPM SPI transfer optimization:
+ * TRANSFER_START before a burst of commands, TRANSFER_END once done.
+ */
+#define QCOMTEE_TPM_TRANSFER_ID		0x0000002
+#define QCOMTEE_TPM_TRANSFER_END	0
+#define QCOMTEE_TPM_TRANSFER_START	1
+
+struct tpm_qcom_transfer_req {
+	u32 command_id;
+	u32 transfer_state;
+} __packed;
+
+struct tpm_qcom_transfer_rsp {
+	u32 command_id;
+	u32 status;
+} __packed;
+
+struct tpm_qcom_private {
+	struct tpm_chip *chip;
+	struct device *dev;
+	struct tee_context *ctx;
+	struct tee_param_objref tpm_svc_obj;
+	bool is_dtpm;
+};
+
+#endif /* __TPM_QCOM_H__ */

-- 
2.34.1

