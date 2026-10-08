Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12CCA3AEB39
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 03:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791430136; cv=none; b=LTYRq+vcwzqtBa64AlC8mN7eVg8BdjEWN837E+F8RcFjoQbef10+qxeCiabpV4ZDvcYmc18XnlZ65famxcYBMsun+r2nxhV0bQErqYJq3cpdLN0/8U8w2/pL2oF5F52rNSIeeI155x9aPbAgT6o5bl69f1rPJKB99mgMGqP1aW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791430136; c=relaxed/simple;
	bh=Td+UxKacrFC0CZmTXeZ4XbWj5/Incz7fIlROqT0fVhU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sJbVUjNZVLp1v0c6DxyVnDrvUO0NBd60vIlmcbJ7pdoi2qeBNaYU0enj7al33KZwxcuE3Ls1AaMBxfi2BmaNswq4MN5Zl1dVz39QLpk23TMsvTNg7jd/volsD3nvtRB++70VnCww7ZjZKOidYZKuYJGdJM3wfUwe1JGNXPMzjH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dlpvT/FP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JeUKeXF4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dlpvT/FP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JeUKeXF4"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6981hPqa607525
	for <linux-kernel@vger.kernel.org>; Thu, 8 Oct 2026 03:28:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xq/6RviwiI4D0pjh/SnP69MfRLFyAZXinygQJ5DPCiM=; b=dlpvT/FPhwBMYClT
	me9U1IesnRgGVsIhg5RFrAO8VKHUqcWYCiiTNS4Upu1GAV0fRaVgNOQ7mfLNU4pB
	DByNovRMDawf7NMBCfimvAtUQQ2wi9CRMbynGpmVkBLKcZnF7yH+9rO7p5gpsDBR
	sll1nK9IXarW2kqwN7vpWxnnrT1dQ13xpij/YVHmSSeqKgD/MGYSHFK/EPQZ82rf
	3AVfQd4R6xV3NqnAvbzz58TQkE3rZIPMZUEHz7gsWvo09wZ1dkAJrmHwvEHYKdyh
	BCkI4peFPd1xsR2uTU3H4AYpYXmGHKkpQ/JRgX+FfGxsrVUPekDRBxIaNxUR9w5B
	twasSw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe2rwq8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 03:28:53 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-341eff9e381so7853757eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 20:28:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791430133; x=1792034933; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xq/6RviwiI4D0pjh/SnP69MfRLFyAZXinygQJ5DPCiM=;
        b=JeUKeXF4zsb8SIsbSTVGLMJSrIkfLm3XEiAOItVT5gN6fYoPuxgqZzYBfHFlkCTKHK
         0hrQ+S8CCAulb9+O+8bWHrHctDHu3u5Ux1jSc/JBXNusLZe8gNwwp2Frn2f4W5ghDweu
         AGc3BNx08L5jXsT1896E6TJVOUeY8W9GHWJcYUdjuYzlhUIr7istCBGN3em4MCyR41lZ
         dQ9fqzwEKfpJU1MapLbaK98rJrJHpeKBogYHmDsolfbpQzHyaumw8+6qAE+89bx7Vwya
         FQeKoLO1yg2L1IiAhRDWyea4YY/yqwM35OE8kwzmPVroaYythkFOIdqKxqQiLu4ijiH7
         h5UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791430133; x=1792034933;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xq/6RviwiI4D0pjh/SnP69MfRLFyAZXinygQJ5DPCiM=;
        b=2Pa9izg25bQOCepqkCRL/AxxR7aGsKCRV+oMC3JiJhCsaQPpKb18xID0prY5/NZYIX
         MNZtS8lDXM7peRxs375+jdRgag9zYPJHmjRswjAKGFt0f+PNNnx2PdpuzHlP1dkgQUPQ
         +DT5T9N/rhR8uycQbMIqoicIA/OBoDqghtD5JiEA5dpIySxSkwO57FojtOCLCjC+w5kU
         McuAU4ATZk4DpUVCEeGTa6PZfdcYS2JDqmNRfSHtEe4yIakiAHVENJkEJpLt3WzFZzIE
         Ce7d8zAqy9U1XjvwNpJgbKrIrCtcIJ8nHCtfkirvTUVMpjhoYqjKgJZOEmUh6mF2uMqe
         CxAQ==
X-Forwarded-Encrypted: i=1; AKwUvBwXBd+y/D/s0+uEf5kSjKjYtYTT8N7v83BQ40/xcmOsU5rTbOYlCfs2VLBNTw4UJ7nzGZ5igffm27VxVgI=@vger.kernel.org
X-Gm-Message-State: AFuF++mUPPYLWjJHJM+wB4oSrTQm6zfJjuGZavTQpt/KuIWlFKVGtUOG
	lJTU3S50hMAbj6V3hczHukbIlKWdFQlY6gTtu4860dpSljtet7SGZIfT/CVji+CXGmtOV8ic56m
	5UWA8G552kuNB3A144wnFOUlcd2llQWLdIp46RTMXOqj0Ip/gZ71WEwtcFugfOPtR8Q==
X-Gm-Gg: AYBFou00HpXnJnaWAsH1yZ7oMnrwicKHLG6GXLNmNtqt8/Pmc38eSAIg4utC7/KnJoj
	evTIPB8Yt528giczrBANBBOwQRnSt1Ji9ZL7FnO0rXYPE4B0dg5Pn5k2rbLFVUNt8YGmAXTBrHR
	eBLITPkVwxINMY0m2mbcEUGLcpGF8bdYTXbJ2leokII3nbU+7jpwUANmvYTv5q0NHjLpZAmg8tr
	XzTP4EewhxFWaD/k2yidrGEUwBrEC7fsdTEZx32KZQ/1SRmZYmrLFG0zTbVhOyOfiZp+1kfZIKp
	647kM0Y4KejjNIorweJDfuAI7EVbolqnF4VjHG0XAnAufdNmlJ0mOAgLGV+HrZqXEKfoXdp+x9G
	92K3dAd9dSg3J/mxXiG4ZS+r4AUHaF4Fs40K8f7FsOcAZFQrYOtXRukPnKw==
X-Received: by 2002:a05:7300:7314:b0:34d:96cb:d75e with SMTP id 5a478bee46e88-3515de9ff53mr7510593eec.27.1791430132477;
        Wed, 07 Oct 2026 20:28:52 -0700 (PDT)
X-Received: by 2002:a05:7300:7314:b0:34d:96cb:d75e with SMTP id 5a478bee46e88-3515de9ff53mr7510526eec.27.1791430131842;
        Wed, 07 Oct 2026 20:28:51 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35179d07566sm2168349eec.30.2026.10.07.20.28.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 20:28:51 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Wed, 07 Oct 2026 20:27:14 -0700
Subject: [PATCH RFC v2 08/10] firmware: riscv: rpmi-tee: cache TEE
 capabilities
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261007-riscv-rpmi-tee-abi-v2-8-45939a13d223@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAxMyBTYWx0ZWRfX4jn4yDzOlVY/
 9TajeQj82JdMY6CVmAcXS8lVzx1YS4tn77OFyVQyEwDw+ejD8me4fmwImVABnAGmbuPOTTxFVEF
 WETHDAlpIrZkKtjop1hapcB7zwVOu84=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAxMyBTYWx0ZWRfXy1zq9zglqRd0
 iu+oe/UjI6+OuBVV+WSJCCtwfygkHpdnXfi7xhc6uUj5raw+IzLcdG6lJYX4yPVkC8zP+fqyBCi
 I2gQk2rZAouCR3MkCLxCuytVLOYzZgQL+tFi1VqAKv6UgmK1/sJ09zS5PJp5x5YR1mDzTItckYI
 BszI6JdUeExWag90dTYqOBpiHIHjKuY9NuaQK7bWf1aCZrtRiBVS/fa/qh6mPfyELM9KYodht/z
 jPqup894r2Ps1qBUzbBb6uTNOLFJMQ/3TMfxoeQRG/e9XCCmHSODFSBolw8kAm3HP03szk1p88F
 IRZaoffrShMi7uSQZYWjizunBPhFoQOGGjGSayyrnOuL7RZiy5L5S4NOSAxJYhwwX3XxI9ds5lP
 xj7pcVJ2QKFLzupLCwdj/nwsHHp6i9AjEBgWZZqDCdus7e52lA2XeGSo0fNtJ+lAN8pc3wfQV0a
 dvVxwMI/rlcRXnJs/SA==
X-Proofpoint-ORIG-GUID: Sh9CJhrvsDJ6iT5Uev-1tW_L2ekj1Wab
X-Proofpoint-GUID: Sh9CJhrvsDJ6iT5Uev-1tW_L2ekj1Wab
X-Authority-Analysis: v=2.4 cv=CIm/zhrD c=1 sm=1 tr=0 ts=6ac70df5 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=0-kq_-QLXk4bkpNlR94A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_01,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 adultscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080013

Query firmware capabilities during transport initialization and cache
support for memory lending, sharing, segmented parcels and signal buses.

Distinguish REE-accessible memory operations from those restricted to
TEE-to-TEE use so Linux only enables operations available to it.

Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 drivers/firmware/riscv_rpmi_tee/driver.c           | 73 ++++++++++++++++++++++
 drivers/firmware/riscv_rpmi_tee/rpmi_tee_private.h | 15 +++++
 2 files changed, 88 insertions(+)

diff --git a/drivers/firmware/riscv_rpmi_tee/driver.c b/drivers/firmware/riscv_rpmi_tee/driver.c
index a683f7d28c25..b43a09f5e853 100644
--- a/drivers/firmware/riscv_rpmi_tee/driver.c
+++ b/drivers/firmware/riscv_rpmi_tee/driver.c
@@ -18,6 +18,33 @@
 
 #include "rpmi_tee_private.h"
 
+#define RPMI_TEE_FEATURE_MEMORY_LEND		1
+#define RPMI_TEE_FEATURE_MEMORY_SHARE		2
+#define RPMI_TEE_FEATURE_SIGNAL_BUS		3
+#define RPMI_TEE_FEATURE_MULTISEGMENT_OPS	4
+
+#define RPMI_TEE_MEMORY_FEATURE_UNSUPPORTED		0
+#define RPMI_TEE_MEMORY_FEATURE_TEE_ONLY		1
+#define RPMI_TEE_MEMORY_FEATURE_FULLY_SUPPORTED	2
+
+/**
+ * struct rpmi_tee_probe_features_req - TEE_PROBE_FEATURES request
+ * @feature_id: TEE feature identifier to query.
+ */
+struct rpmi_tee_probe_features_req {
+	__le32 feature_id;
+} __packed;
+
+/**
+ * struct rpmi_tee_probe_features_resp - TEE_PROBE_FEATURES response
+ * @status: RPMI completion status.
+ * @value: Feature-specific value.
+ */
+struct rpmi_tee_probe_features_resp {
+	__le32 status;
+	__le32 value;
+} __packed;
+
 /**
  * struct rpmi_tee_call_req - TEE_CALL request prefix
  * @sender_id: Calling REE endpoint identifier.
@@ -186,6 +213,29 @@ static int rpmi_tee_check_transport(struct rpmi_tee_transport *priv)
 
 /* RPMI TEE SERVICE GRP API. */
 
+/* TEE_PROBE_FEATURES. */
+static int rpmi_tee_probe_features(struct rpmi_tee_transport *priv,
+				   u32 feature_id, u32 *value)
+{
+	struct rpmi_tee_probe_features_req req = {
+		.feature_id = cpu_to_le32(feature_id),
+	};
+	struct rpmi_tee_probe_features_resp resp;
+	size_t resp_len = sizeof(resp);
+	int ret;
+
+	ret = rpmi_tee_send(priv, RPMI_TEE_SRV_PROBE_FEATURES, &req,
+			    sizeof(req), &resp, &resp_len);
+	if (ret)
+		return ret;
+	if (resp_len != sizeof(resp))
+		return -EPROTO;
+
+	*value = get_unaligned_le32(&resp.value);
+
+	return 0;
+}
+
 /* Return the transport that owns @rdev. */
 static struct rpmi_tee_transport *
 rpmi_tee_device_to_transport(struct rpmi_tee_device *rdev)
@@ -371,6 +421,7 @@ static int rpmi_tee_setup_endpoints(struct rpmi_tee_transport *priv)
 static int rpmi_tee_transport_probe(struct platform_device *pdev)
 {
 	struct rpmi_tee_transport *priv;
+	u32 value;
 	int ret;
 
 	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
@@ -394,6 +445,28 @@ static int rpmi_tee_transport_probe(struct platform_device *pdev)
 		goto out_failed;
 	}
 
+	ret = rpmi_tee_probe_features(priv, RPMI_TEE_FEATURE_MEMORY_LEND,
+				      &value);
+	if (ret)
+		goto out_failed;
+	priv->mem.lend_ok = value == RPMI_TEE_MEMORY_FEATURE_FULLY_SUPPORTED;
+
+	ret = rpmi_tee_probe_features(priv, RPMI_TEE_FEATURE_MEMORY_SHARE,
+				      &value);
+	if (ret)
+		goto out_failed;
+	priv->mem.share_ok = value == RPMI_TEE_MEMORY_FEATURE_FULLY_SUPPORTED;
+
+	ret = rpmi_tee_probe_features(priv, RPMI_TEE_FEATURE_MULTISEGMENT_OPS,
+				      &priv->mem.multisegment_max);
+	if (ret)
+		goto out_failed;
+
+	ret = rpmi_tee_probe_features(priv, RPMI_TEE_FEATURE_SIGNAL_BUS,
+				      &priv->notif.feature);
+	if (ret)
+		goto out_failed;
+
 	ret = rpmi_tee_setup_endpoints(priv);
 	if (ret) {
 		dev_err_probe(&pdev->dev, ret,
diff --git a/drivers/firmware/riscv_rpmi_tee/rpmi_tee_private.h b/drivers/firmware/riscv_rpmi_tee/rpmi_tee_private.h
index 07e6b9913cb7..0c3cfa0f14ec 100644
--- a/drivers/firmware/riscv_rpmi_tee/rpmi_tee_private.h
+++ b/drivers/firmware/riscv_rpmi_tee/rpmi_tee_private.h
@@ -14,17 +14,28 @@
 /* TEE service group and the services used by this module. */
 #define RPMI_SRVGRP_TEE		0x10
 
+#define RPMI_TEE_SRV_PROBE_FEATURES	0x02
 #define RPMI_TEE_SRV_PROBE_SYSTEM	0x03
 #define RPMI_TEE_SRV_PROBE_DOMAIN	0x04
 #define RPMI_TEE_SRV_PROBE_ENDPOINT	0x05
 #define RPMI_TEE_SRV_CALL		0x18
 
+struct rpmi_tee_notif_state {
+	u32 feature;
+};
+
 struct rpmi_tee_mbox {
 	struct mbox_client client;
 	struct mbox_chan *chan;
 	u32 max_msg_data_size;
 };
 
+struct rpmi_tee_mem_state {
+	u32 multisegment_max;
+	bool lend_ok;
+	bool share_ok;
+};
+
 /**
  * struct rpmi_tee_transport - State for one RPMI TEE transport instance
  * @dev: Parent platform device.
@@ -33,6 +44,8 @@ struct rpmi_tee_mbox {
  * @max_call_resp_size: Maximum TEE_CALL response payload size in bytes.
  * @self_id: Local REE physical endpoint identifier.
  * @devices: List of registered TEE service devices.
+ * @mem: Memory parcel operation state.
+ * @notif: Signal notification state.
  */
 struct rpmi_tee_transport {
 	struct device *dev;
@@ -41,6 +54,8 @@ struct rpmi_tee_transport {
 	size_t max_call_resp_size;
 	u32 self_id;
 	struct list_head devices;
+	struct rpmi_tee_mem_state mem;
+	struct rpmi_tee_notif_state notif;
 };
 
 /* Report local transport errors separately from the returned RPMI status. */

-- 
2.34.1

