Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EC6547B41C
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 14:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788531815; cv=none; b=dO8lgj0EATh0318557yrT/K8WVKru6B4TWVw+E8926hYfJz+eaMJ5ZTKcusbFmzovOY/61XCFGpJyuIk0gYbQTlO+1EJhJ+nomeQIHnAp3mTXx2KJ2/Fjijxx9p9wdlNhknGYZdMepqiyLYmpKy/vH3nBs5Jdh7BzNOvSO7jrfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788531815; c=relaxed/simple;
	bh=iV4AOOckQrMa+16TI4AAiuMKqvEKPVYiWTmkQUDyLEU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=pYXuFbUrotk6/9Oj2FFGsdJjyLC75UE6hHsl6ELcAfhRjyCR18TLuuqfmnsSo+UY1IwHKSbm3yO0ZCUG8SpTNsuEVoEWhJhXufwbt0b5tPocCgT5Ns9PXraz8mcwGEaB6oozx7So6DkeBiq+EnWjF/do4luKPHgfwHbMFgJW+00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nXjXBa+z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SPIFlxjZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nXjXBa+z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SPIFlxjZ"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 684Dgg6E687415
	for <linux-kernel@vger.kernel.org>; Fri, 4 Sep 2026 14:23:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=yjXrqaQjmS+eh4R1mRT3Kc
	AvoxLvfqvHUHfLmQH7Xf4=; b=nXjXBa+zbBXsXFvI624X5jFhEbAm7PHtN02Vw5
	Ix8k1sYuxIoznR0HeGeaA+3Gml1y77xGJ2YKgIS3Nx8X58PVqsoZBXEsbQpvT39z
	t5pkoVhf2Tx7UldEEdpFeekrZZbQZLgTRPM0x+I0TkazwfGQeoxc6v3WUywGJRBc
	JMnYXOMEMY+HpLmkYfIRLMFUK2JUmrhmBLhnBvTjwOTlX2r6pb+tSf3O1foG4Y0h
	nErxAr3Ro9i0yp6ubO7G3kD20INh+7THkMdUio3LBYMSn6bTwiksVKmeA1kpgXz4
	wnZRgHbwVOjpmwArganWrO5MkrmpcSwN2dH7e3ZeyOw4t2Yg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfusx0y91-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 14:23:32 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-396901263b6so2045800a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 07:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788531812; x=1789136612; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yjXrqaQjmS+eh4R1mRT3KcAvoxLvfqvHUHfLmQH7Xf4=;
        b=SPIFlxjZbU8kI7DI7AGYLP/JBlR1yAE8j1LeAf9CtaGnWG+LNjVEHkzltsSz1ADAds
         3d78LjqJLbzGR0YsQUTrI+aRKcuI2rx2aSSZbBuxa8B1LM52XVPwAcIhmHGQr2gMIbAX
         td+EZrZ4othFxDlFMepmPXNA61cwPRmPcqpvqHXlpgYmqr5D03LkUmw+WYI0TM1BGRid
         KJyT/i54RiybOwPkvtK5O+/gz+aFEho40gUBzd674d4/J6ebi/7TGQd5cBpqNetBd5Ax
         IM/MwFc1RAX0tAYtkDE4ghLemcvalW+eH+GcS0C3CoeD2aohNyBZCd0tvl9l/FBFuYt6
         LqqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788531812; x=1789136612;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=yjXrqaQjmS+eh4R1mRT3KcAvoxLvfqvHUHfLmQH7Xf4=;
        b=fVy2Xo1fAWnkJRNM+eogLPnHo7g0n2uFWYK4XrsYxPkKiZmQBPw08p8psmYZhgVcHT
         iJXfijg5SHnTxDIdymhqYt1u87ceAJP5dEnV93ZnGt8JfM0C0xjxS2zx6cmK39m+rp3o
         zdZOsB6ptZ9//+6qFhYujre4b0nSn2/l1T/i72xtJ4hAJERVa1l3kZyjoDev1C6P9pTM
         aGgPEqEYdt6IQI4p9niBdHxImuvo0c1VvOCm8x214v3q6s76LHjX6OueBfM1Ts5eSL6U
         cBgI6iwe53OzQ/muTsLPRGb97BevsPdc7httlCdEzRYw7gHhu+HYV6lMK8124kkF0kvy
         /cAw==
X-Gm-Message-State: AFuF++lz4Cx11znilufw2jRNMuVIW9vbyaNRdrwxV4KOAVVNVQdvtIs4
	F4ZlTIaI2UhGdM/a7nSO385rL/pFMWo6MqFfqbBpT/RGU4NMF8jd7DdaxlkPTn6p5ua44BFdLD0
	S/w94lWUdfW+Y/uPrCAUbCd8a/t8Wn7vUzlIXusNfIiL2n/u6+Gp519ZaXLpL2egwGIQ=
X-Gm-Gg: AYBFou1yOyTBVyamyX9AQHps/8SoWPgVWSlDk0odejoMZj6wUCKHLj7SSpZmRVfI2ZS
	EDWjAEIUjGhDFmboyZXyuAauxKLOYl68C0NUnAlPVh+7oXmdnEJNK9hm6gb5rhzsfM9C0TCIwBI
	lHuCUWS6p2t8h3U/ug4Vwi5IPtOM8AUBXRiuRDv3OLY1VdVJrHyKAtZVh/H3uF49nBpS9SnBezN
	kRBZY9KYsR2f3QTQhYo/FnS3xuLJgW3cSPPmM14JOPqhERnFhfh1ofr6jR7OwrBoGp6kK1BoylC
	KX45YZDtrGj2ilGhGGt70q3Wqf7clgaKeqtK2Z+HQUQLt4E7V40jNrEYiWYvNYLAUl4g4HGwrmO
	/cmO9YiwWpV+Lft3xYFx/uCZ1umrJ
X-Received: by 2002:a17:90b:3b88:b0:398:dcfe:968e with SMTP id 98e67ed59e1d1-39b261da746mr8847307a91.20.1788531811355;
        Fri, 04 Sep 2026 07:23:31 -0700 (PDT)
X-Received: by 2002:a17:90b:3b88:b0:398:dcfe:968e with SMTP id 98e67ed59e1d1-39b261da746mr8847137a91.20.1788531810538;
        Fri, 04 Sep 2026 07:23:30 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b8f44d7sm7122450eec.22.2026.09.04.07.23.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 07:23:29 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Fri, 04 Sep 2026 19:53:10 +0530
Subject: [PATCH] soc: qcom: smd-rpm: Add trace events for SMD-RPM messages
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-smd-rpm-trace-v1-1-8c1cbdfea82e@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAE3UmmoC/yXMTQqDQAxA4atI1g1MBhH1KtLFdCatEfwhUSmId
 3dsl9/ivQOMVdigLQ5Q3sVknjLoUUDsw/RhlJQN3vnKNY7QxoS6jLhqiIx1IvIxENWlg9wsym/
 5/n7d82/bXgPH9Z7AeV4K8yg6cQAAAA==
X-Change-ID: 20260901-smd-rpm-trace-8d112ca11840
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788531807; l=5798;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=iV4AOOckQrMa+16TI4AAiuMKqvEKPVYiWTmkQUDyLEU=;
 b=Wsm4hTGTyu7OUh4uy2ZtcIQjvYzsqK6ToEUFBZ55ThesUx/aiiB9lZsbj35ClSgBy8Y77zxBC
 P0Lmf12kvqJBFIjPQMDoNl1Lq+RxUQyWvsoJEecTxAyZl6NReqtTPwy
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDEzMSBTYWx0ZWRfX7WOg09UmxsoO
 eUxmFp2F8ujGGusC63bb7TP6eJhbb4dijlSdRQeXU/lOg3lZxmafxUmwZ0YbXJuuNjxWxslis7J
 BLVEdcObefVQlAn6Qsw5UiLIwQXxPUc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDEzMSBTYWx0ZWRfX4PdZv33UNm9x
 go/o/iqZg4Ht6v8uI7ce+kvYORh+haufyihhbcGtfUgglMlU3kZ1/+8EtuSwztHfMwZG+vOSj/m
 F8onYJiuxtDaVbF+IxOAxfLOmU8uUvyyMPOBqQ4xhwgv4ycC3oK6xBWg8Uv34/Y7jnc+eFFD+h0
 rRDeWdyfEaDpzHd4jtBRGoweUDGwXlwuGEN/gVabf8QkTtnksCeLsqMK12rCQMgOb0TafhCG97G
 uMcKhcJlDKVKlkSc4rZOVJl9J0NbKhcUCf9NY4BPbAw9zAIzIBPLMOcmzAYNpKXtitxnJYK7nMZ
 8wSWLBzl2LUCXnDxUwjeOPdxvPFCxLDv0Cnn8FjhvrFgSYsdJfPwoklB1ZMzx3xt3JXGCKi7Ms7
 xTGZmnuVtJDHXsIrihpxn+WYfGvDU1FBBvqfQirnmEm9Yr3L//NA8pvaBgxpMToh24Y8bB6rCu6
 5z2o3cZwk24p7NN1Rkw==
X-Authority-Analysis: v=2.4 cv=NenWEWD4 c=1 sm=1 tr=0 ts=6a9ad464 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=iiYCWuvKVlUSTFT6mewA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: 3I7cSHr8MhSL5LXDq7zXbLFMvh5kyA7c
X-Proofpoint-ORIG-GUID: 3I7cSHr8MhSL5LXDq7zXbLFMvh5kyA7c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609040131

There is no visibility on what resource votes are placed via SMD RPM making
it difficult to identify clients that do either under voting via active set
impacting the device functions or fail to send sleep set votes and thereby
prevent the SoC from reaching low power modes such as vmin or vlow.

Add trace events for SMD RPM requests and acknowledgment to make RPM votes
for various resources visible through ftrace.

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
Output from newly added ftrace on shikra SoC,
rpm_smd_send_msg: msg_id:807 ctx:active rsc_type:ldoa rsc_id:0xe key:swen nbytes:4 value:1
rpm_smd_ack_recvd: msg_id:807 errno:00000000
..
..
rpm_smd_send_msg: msg_id:1106 ctx:active rsc_type:clk2 rsc_id:0x0 key:KHz nbytes:4 value:19200
rpm_smd_ack_recvd: msg_id:1106 errno:00000000
rpm_smd_send_msg: msg_id:1107 ctx:sleep rsc_type:clk2 rsc_id:0x0 key:KHz nbytes:4 value:0
rpm_smd_ack_recvd: msg_id:1107 errno:00000000
---
 drivers/soc/qcom/Makefile        |  1 +
 drivers/soc/qcom/smd-rpm.c       | 10 +++++
 drivers/soc/qcom/trace-smd-rpm.h | 83 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 94 insertions(+)

diff --git a/drivers/soc/qcom/Makefile b/drivers/soc/qcom/Makefile
index 798643be3590..839e7875ec1b 100644
--- a/drivers/soc/qcom/Makefile
+++ b/drivers/soc/qcom/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 CFLAGS_rpmh-rsc.o := -I$(src)
+CFLAGS_smd-rpm.o := -I$(src)
 CFLAGS_qcom_aoss.o := -I$(src)
 obj-$(CONFIG_QCOM_AOSS_QMP) +=	qcom_aoss.o
 obj-$(CONFIG_QCOM_GENI_SE) +=	qcom-geni-se.o
diff --git a/drivers/soc/qcom/smd-rpm.c b/drivers/soc/qcom/smd-rpm.c
index f2b3e02abdf1..04b3f7789ab7 100644
--- a/drivers/soc/qcom/smd-rpm.c
+++ b/drivers/soc/qcom/smd-rpm.c
@@ -14,6 +14,9 @@
 #include <linux/rpmsg.h>
 #include <linux/soc/qcom/smd-rpm.h>
 
+#define CREATE_TRACE_POINTS
+#include "trace-smd-rpm.h"
+
 #define RPM_REQUEST_TIMEOUT     (5 * HZ)
 
 /**
@@ -106,6 +109,7 @@ int qcom_rpm_smd_write(struct qcom_smd_rpm *rpm,
 		u8 payload[];
 	} *pkt;
 	size_t size = sizeof(*pkt) + count;
+	const struct clk_smd_rpm_req *req = buf;
 
 	/* SMD packets to the RPM may not exceed 256 bytes */
 	if (WARN_ON(size >= 256))
@@ -131,6 +135,8 @@ int qcom_rpm_smd_write(struct qcom_smd_rpm *rpm,
 	if (ret)
 		goto out;
 
+	trace_rpm_smd_send_msg(pkt->req.msg_id, state, type, id, req);
+
 	left = wait_for_completion_timeout(&rpm->ack, RPM_REQUEST_TIMEOUT);
 	if (!left)
 		ret = -ETIMEDOUT;
@@ -158,6 +164,7 @@ static int qcom_smd_rpm_callback(struct rpmsg_device *rpdev,
 	const u8 *end = buf + hdr_length;
 	char msgbuf[32];
 	int status = 0;
+	__le32 msg_id = 0;
 	u32 len, msg_length;
 
 	if (le32_to_cpu(hdr->service_type) != RPM_SERVICE_TYPE_REQUEST ||
@@ -171,6 +178,7 @@ static int qcom_smd_rpm_callback(struct rpmsg_device *rpdev,
 		msg_length = le32_to_cpu(msg->length);
 		switch (le32_to_cpu(msg->msg_type)) {
 		case RPM_MSG_TYPE_MSG_ID:
+			msg_id = msg->msg_id;
 			break;
 		case RPM_MSG_TYPE_ERR:
 			len = min_t(u32, ALIGN(msg_length, 4), sizeof(msgbuf));
@@ -187,6 +195,8 @@ static int qcom_smd_rpm_callback(struct rpmsg_device *rpdev,
 		buf = PTR_ALIGN(buf + 2 * sizeof(u32) + msg_length, 4);
 	}
 
+	trace_rpm_smd_ack_recvd(msg_id, status);
+
 	rpm->ack_status = status;
 	complete(&rpm->ack);
 	return 0;
diff --git a/drivers/soc/qcom/trace-smd-rpm.h b/drivers/soc/qcom/trace-smd-rpm.h
new file mode 100644
index 000000000000..b17fe5d5e306
--- /dev/null
+++ b/drivers/soc/qcom/trace-smd-rpm.h
@@ -0,0 +1,83 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#if !defined(_TRACE_SMD_RPM_H) || defined(TRACE_HEADER_MULTI_READ)
+#define _TRACE_SMD_RPM_H
+
+#undef TRACE_SYSTEM
+#define TRACE_SYSTEM rpm_smd
+
+#include <linux/tracepoint.h>
+#include <linux/soc/qcom/smd-rpm.h>
+
+TRACE_EVENT(rpm_smd_ack_recvd,
+
+	TP_PROTO(__le32 msg_id, int errno),
+
+	TP_ARGS(msg_id, errno),
+
+	TP_STRUCT__entry(
+		__field(u32, msg_id)
+		__field(int, errno)
+	),
+
+	TP_fast_assign(
+		__entry->msg_id = le32_to_cpu(msg_id);
+		__entry->errno = errno;
+	),
+
+	TP_printk("msg_id:%u errno:%08x",
+		__entry->msg_id,
+		__entry->errno)
+);
+
+TRACE_EVENT(rpm_smd_send_msg,
+
+	TP_PROTO(__le32 msg_id, u32 state, u32 rsc_type, u32 rsc_id,
+		 const struct clk_smd_rpm_req *req),
+
+	TP_ARGS(msg_id, state, rsc_type, rsc_id, req),
+
+	TP_STRUCT__entry(
+		__field(u32, msg_id)
+		__field(u32, state)
+		__field(u32, rsc_type)
+		__field(u32, rsc_id)
+		__field(u32, key)
+		__field(u32, nbytes)
+		__field(u32, value)
+	),
+
+	TP_fast_assign(
+		__entry->msg_id = le32_to_cpu(msg_id);
+		__entry->state = state;
+		__entry->rsc_type = rsc_type;
+		__entry->rsc_id = rsc_id;
+		__entry->key = le32_to_cpu(req->key);
+		__entry->nbytes = le32_to_cpu(req->nbytes);
+		__entry->value = le32_to_cpu(req->value);
+	),
+
+	TP_printk("msg_id:%u ctx:%s rsc_type:%.4s rsc_id:0x%x key:%.4s nbytes:%u value:%u",
+		  __entry->msg_id,
+		  __print_symbolic(__entry->state,
+				   { QCOM_SMD_RPM_ACTIVE_STATE, "active" },
+				   { QCOM_SMD_RPM_SLEEP_STATE, "sleep" }),
+		  (const char *)&__entry->rsc_type,
+		  __entry->rsc_id,
+		  (const char *)&__entry->key,
+		  __entry->nbytes,
+		  __entry->value)
+);
+
+#endif /* _TRACE_SMD_RPM_H */
+
+#undef TRACE_INCLUDE_PATH
+#define TRACE_INCLUDE_PATH .
+
+#undef TRACE_INCLUDE_FILE
+#define TRACE_INCLUDE_FILE trace-smd-rpm
+
+#include <trace/define_trace.h>

---
base-commit: 89c07d98716a13454ec3fd9f97689e812cc71bd4
change-id: 20260901-smd-rpm-trace-8d112ca11840

Best regards,
--  
Maulik Shah <maulik.shah@oss.qualcomm.com>

