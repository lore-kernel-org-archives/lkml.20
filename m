Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D54993E451B
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 02:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789094414; cv=none; b=O/ZCngzNjbr/iUl0reGV7v7KaXTSoWV+1Rx6wKUKWD0lpLbW78nlymyO/l7uZwq7ifDxpeX9acAuCcNQT0arZmLjtbdkoKuMCaws5wId5ozuqQR/Yb29Iygx/EqLXgLhNqNMErqKP8roIqwKLH0i8vxfsD/dSUizJ9fumkqGaWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789094414; c=relaxed/simple;
	bh=uqp6ZtJNtEOACAhMiQpETB3wFwgJx7c5vXDtw6I5O54=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BBsDyCZBaWh/BFDoM9cDIS4RGXJquTjhlRhkN703boxJrn3lKmRVYB2Zdsdou1z4jLKKo3+LTBQTcF9zKG8nek6ttaaaiPxkfZUfdDsRc1FHYTbSdKdO4w8YA9Vevg37+h7JKTrsnIxwtPf39NWpilHTdoT48plu6nU5n8Vyusg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LxRivtnf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d6YvFFa9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LxRivtnf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d6YvFFa9"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B12ZoY1944573
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 02:40:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w0y67KYvhCbzczBgu73AvNRM6XCtxPMllebNVw/tpXM=; b=LxRivtnf8eiul9TF
	Sepx0+l0T7F5jjiGwHhLZck85sSWENorICIa8F17udMjnWRRX5ZT+M5gecZLwNms
	2XK97pwT5xs2U+P3r5GMoRlkfFkomEs3DR/KhCf18VB7J1Ax1CR9k58VBVJZC0mW
	wJWzmn3fdXJMVVy4kRD5rdYBJrARsaLgjGOGPRpyYK8MiWzXbickG/9p7jisdYV0
	4BhQqQjZlzwuRiTHZ2IJOcey2mrjnB9iVNriI/ZvHJqcMVWw8jat/vRTB0iygu5w
	60Xqz7s/eMWgizNtG6bhxmFWm9YgLREzW+BAB5mb1OBRgLsKQiJ0OLs3JMIDu+l0
	1t4ffQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkxv7ajyt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 02:40:11 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d55d8cd938so6723475ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 19:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789094411; x=1789699211; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w0y67KYvhCbzczBgu73AvNRM6XCtxPMllebNVw/tpXM=;
        b=d6YvFFa9lX6DG653ZgU8sOIFIiWO97hQF5GSuCQEGul9xEUQwrTxa+g9REYDciSoDi
         /az68BxD2njVZ20jg/kckayQxJS+VsG/f0zatydDz64kiQxp8DxLtGpMcSUgZNi3UcrK
         5DWdhcn5zfDhPrqjVwZLzJsUrpDVTzl2hx7EZicRPjh6jnLilexVyWlJXpC0+IsTi9LC
         JRpXZgT166c4mR5U7PNEkEujl1XUK6O+VtkQiEkNHTXq9ix9TcAervI2O8/p4wbU9dJL
         zIw5bPAo2qDvrqkUQvbuiamJvhz3cIEUGTHpzQGozYmLoFHAULF1Qg5JWf4PXqEF91f6
         GqDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789094411; x=1789699211;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w0y67KYvhCbzczBgu73AvNRM6XCtxPMllebNVw/tpXM=;
        b=KWA28z/aXEABmKts7jk7VmY9yTqxgLgMgZB96s4vr26TAJ7wj88E2WhhS8oirEvxxd
         iK7pOgFJk6LGHx5XCdYHS6z9XDUPhGIHZO9YI/5Dmscly6UTdqWNgwHLgIrBU+KDlj5L
         2xpRtb85kNK2vOvK1vH1uVS2Mq5h2tiNe4LXXV6tH3fAWF9GD1IsqD06GleW7BEq4Z5k
         syL3m683C4Ujh1iyQfZnbWw6aDlxGJ/d/YNHfwNokhtRExfYJa5fQyN2PeCS8VLz+7nM
         2UL/MxrhU0qY4Jiwawgby7I11ocYoLPS1zqwBkElfeV93tLctsW8ScuB2Lh6WJ3DKh5e
         wMfg==
X-Gm-Message-State: AFuF++mp/yIk7b4b5SIsxL63xgwbU+usRIAheLhGGWRpH+aa+/SYEodD
	7pZTm07bRPz8cqRFijtUOtKE8zrsBvGiMgmX0qy/QX5QXA4Za9zIIjncmtEP32ssXp0OYRFISBI
	afIqCUSCjlxXlHhkz+9HDYtBI1IGnZRKGphkmdvpTYL+XmwG8CfPJBre/5aXLGPP1ThU=
X-Gm-Gg: AYBFou2ZJKP6PRrGEA0wq888gAfDAUzNQLhW716P4xfV/7oCjLFPXfX7fJ27Z1swv05
	KrjzA0GcCAPaeJ8JfC4EzpPvfk2jNtBRdSBms9W9UUFlKzAPdqc+R18gl46T3vXxHIRXhMhJYzE
	CxXne4yNz/WP9dVfm2EYb5hu2Cplhjdjn4jww0VUOuaOTG+pfbSo35TrDa0BcOrs2bhwVB71dpG
	OsTAgUdGkdaHzmk5+SDWdlYxhiokcFbueYUWWTpOdsdYks062ulcB3a80fGATnFTYjAG+t2SJ/M
	Js0lNnTxNEyBd2rpxPRlUPWS+S3tZuN/8AaSq8/FUKtqUAI+fC7n9X2KB+u/lcwrFXGoA62lD4M
	35euWfR2gB5MHg2XRMj9+VkoGaFCoG2Q=
X-Received: by 2002:a17:902:c945:b0:2d9:484:861d with SMTP id d9443c01a7336-2dd2a33fdddmr41167735ad.10.1789094410573;
        Thu, 10 Sep 2026 19:40:10 -0700 (PDT)
X-Received: by 2002:a17:902:c945:b0:2d9:484:861d with SMTP id d9443c01a7336-2dd2a33fdddmr41167285ad.10.1789094410129;
        Thu, 10 Sep 2026 19:40:10 -0700 (PDT)
Received: from hu-renjiang-sha.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4e95075sm2094481eec.11.2026.09.10.19.40.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 19:40:09 -0700 (PDT)
From: Renjiang Han <renjiang.han@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 08:09:50 +0530
Subject: [PATCH v2 2/2] media: qcom: iris: reduce impact of verbose
 firmware logging
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-media-qcom-iris-fw-log-v2-2-6c46288f3ffb@oss.qualcomm.com>
References: <20260911-media-qcom-iris-fw-log-v2-0-6c46288f3ffb@oss.qualcomm.com>
In-Reply-To: <20260911-media-qcom-iris-fw-log-v2-0-6c46288f3ffb@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Renjiang Han <renjiang.han@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789094397; l=10583;
 i=renjiang.han@oss.qualcomm.com; s=20241001; h=from:subject:message-id;
 bh=uqp6ZtJNtEOACAhMiQpETB3wFwgJx7c5vXDtw6I5O54=;
 b=nWXw93A89mYzNPDhr3w2CwxKIudOCKfcdmasVpNbbR96SBMCjIwspk68rNmOerrZ2wuUm2qRy
 DPqcsTAVyP8Ax+Z2nxWtwh+CHZQ/7CydB69FA2r4W/wv1WDZwdY43IR
X-Developer-Key: i=renjiang.han@oss.qualcomm.com; a=ed25519;
 pk=8N59kMJUiVH++5QxJzTyHB/wh/kG5LxQ44j9zhUvZmw=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDAzMyBTYWx0ZWRfXz4sNqyeYlOt8
 s+n9ghBYuUXTMJBOL9J11CvKQrjfgba2IfA1iyxICG2naCqeNHNtRJX0pb4H49/OOipeJqSwlYy
 JPhz12bItVCVf0NMDQjAQUKReM9GtBE=
X-Proofpoint-GUID: DoeQ5PiGzevnf-b9o473gEVnyfojH5rx
X-Authority-Analysis: v=2.4 cv=FPSOVOos c=1 sm=1 tr=0 ts=6aa36a0b cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=PhOa2E4d2e6p5IsZR2MA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDAzMyBTYWx0ZWRfX3U/vDkFfabz5
 qpT1iyvVDFIunR4Op9pWx+XwuQ/9UbUGW7C9UepXL6uwIQVqDpkAic6jN7tuBZ5qZOQ+Se+OdNX
 LKPt2gAeuq2ihvsJ4jKp9+eF80XdOK7j5YhAa/hg4p0JTmmkeXQ768S2NYHOprNKoLImnHIvX45
 o9Lg2QhAVW7GFlLXGdu6eeHnnLeTFZVoM6pN/aQTiTi1Vj643Pb9ByDHOc7VPeM6aoL8+RRhTKB
 H2JJ+tCBivY5/2xwP/9LN0C4WFiMdddOBLgTTWTKKl9r1SNtcgArLNOjVWP78o7Y2SI89/6m6C5
 KIyZyIDcKrMAGrVxeDXRYQxdC2hYBkeBFOo4E0fEUbRS9M56/2jDKSvoEbttkGdcjTsEHGPtwNh
 8tkthgAsYNVwc8/UufvYE6olhsdkYVI3tA+pbJO9sk0TQ2rBV8xatkK0di7+22Zc1fSLCLHEPWs
 3Kn9wKvoMt2RSL4QhZQ==
X-Proofpoint-ORIG-GUID: DoeQ5PiGzevnf-b9o473gEVnyfojH5rx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_01,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110033

Verbose firmware logging can produce a large number of debug queue
packets. The Iris interrupt thread used to drain the message queue once
and then drain the debug queue. With heavy firmware logging, response
packets that arrive while debug packets are being drained can remain
pending until a later interrupt.

Increase the HFI response timeout and runtime PM autosuspend delay when
firmware logging is enabled beyond the default error and fatal levels.
Restore the default values when the firmware log level is reduced again.

Signed-off-by: Renjiang Han <renjiang.han@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_core.c       |  2 +-
 drivers/media/platform/qcom/iris/iris_core.h       |  2 ++
 drivers/media/platform/qcom/iris/iris_debugfs.c    | 16 ++++++++++++++-
 drivers/media/platform/qcom/iris/iris_hfi_common.h |  1 +
 .../platform/qcom/iris/iris_hfi_gen1_response.c    | 24 ++++++++++++++++------
 .../platform/qcom/iris/iris_hfi_gen2_response.c    | 24 ++++++++++++++++------
 drivers/media/platform/qcom/iris/iris_probe.c      |  3 ++-
 drivers/media/platform/qcom/iris/iris_utils.c      |  4 +++-
 8 files changed, 60 insertions(+), 16 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_core.c b/drivers/media/platform/qcom/iris/iris_core.c
index 8c335dbfce166848892c2b323cdcafe43af4a2d9..bbbb7191c4778d842d4fef32fa95a0a9aeeecf7a 100644
--- a/drivers/media/platform/qcom/iris/iris_core.c
+++ b/drivers/media/platform/qcom/iris/iris_core.c
@@ -40,7 +40,7 @@ static int iris_wait_for_system_response(struct iris_core *core)
 		return -EIO;
 
 	ret = wait_for_completion_timeout(&core->core_init_done,
-					  msecs_to_jiffies(HW_RESPONSE_TIMEOUT_VALUE));
+					  msecs_to_jiffies(READ_ONCE(core->hw_response_timeout)));
 	if (!ret) {
 		core->state = IRIS_CORE_ERROR;
 		return -ETIMEDOUT;
diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
index a8e34c456ce3f3f178ca66a278d06d1ab50dafc4..5449e6b0e11c3122d1f57aedb6dd374ffa816497 100644
--- a/drivers/media/platform/qcom/iris/iris_core.h
+++ b/drivers/media/platform/qcom/iris/iris_core.h
@@ -68,6 +68,7 @@ struct dentry;
  * @debug_queue: shared interface queue to receive debug info from firmware
  * @root: debugfs root directory
  * @fw_debug: firmware debug log mask
+ * @hw_response_timeout: hardware response timeout
  * @lock: a lock for this structure
  * @response_packet: a pointer to response packet from fw to driver
  * @header_id: id of packet header
@@ -115,6 +116,7 @@ struct iris_core {
 	struct iris_iface_q_info		debug_queue;
 	struct dentry				*root;
 	u32					fw_debug;
+	u32					hw_response_timeout;
 	struct mutex				lock; /* lock for core related operations */
 	u8					*response_packet;
 	u32					header_id;
diff --git a/drivers/media/platform/qcom/iris/iris_debugfs.c b/drivers/media/platform/qcom/iris/iris_debugfs.c
index 6122b994ad0aa70c0c4f26ea4ce076f1b025f810..77726270b11777acb5ea85203223c6943365a5ce 100644
--- a/drivers/media/platform/qcom/iris/iris_debugfs.c
+++ b/drivers/media/platform/qcom/iris/iris_debugfs.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/debugfs.h>
+#include <linux/pm_runtime.h>
 
 #include "iris_core.h"
 #include "iris_debugfs.h"
@@ -20,8 +21,21 @@ static int iris_fw_level_get(void *data, u64 *val)
 static int iris_fw_level_set(void *data, u64 val)
 {
 	struct iris_core *core = data;
+	bool debug_enabled;
+	u32 fw_debug;
 
-	WRITE_ONCE(core->fw_debug, (u32)val & IRIS_FW_DEBUG_LOGMASK);
+	fw_debug = (u32)val & IRIS_FW_DEBUG_LOGMASK;
+	debug_enabled = fw_debug & ~IRIS_FW_DEBUG_DEFAULT;
+
+	WRITE_ONCE(core->fw_debug, fw_debug);
+
+	if (debug_enabled) {
+		WRITE_ONCE(core->hw_response_timeout, 4 * HW_RESPONSE_TIMEOUT_VALUE);
+		pm_runtime_set_autosuspend_delay(core->dev, 4 * AUTOSUSPEND_DELAY_VALUE);
+	} else {
+		WRITE_ONCE(core->hw_response_timeout, HW_RESPONSE_TIMEOUT_VALUE);
+		pm_runtime_set_autosuspend_delay(core->dev, AUTOSUSPEND_DELAY_VALUE);
+	}
 
 	return 0;
 }
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_common.h b/drivers/media/platform/qcom/iris/iris_hfi_common.h
index d8bc0862c54bd229d575113752526d51e863e303..18c852d8b818f41bf5e1b0afd35082eeaf5240b4 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_common.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_common.h
@@ -112,6 +112,7 @@ struct iris_hfi_prop_type_handle {
 #define IRIS_FW_DEBUG_FATAL	0x00000010
 #define IRIS_FW_DEBUG_PERF	0x00000020
 #define IRIS_FW_DEBUG_LOGMASK	0x0fffffff
+#define IRIS_FW_DEBUG_DEFAULT	(IRIS_FW_DEBUG_ERROR | IRIS_FW_DEBUG_FATAL)
 
 struct iris_hfi_sys_ops {
 	int (*sys_init)(struct iris_core *core);
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
index 903b60a7380559f4711b0907fb1de405fe1707f3..6b8f952d0d4b54f37596728f1823c9265c637bbe 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
@@ -672,15 +672,17 @@ static void iris_hfi_gen1_handle_response(struct iris_core *core, void *response
 	}
 }
 
-static void iris_hfi_gen1_flush_debug_queue(struct iris_core *core, u8 *packet)
+static int iris_hfi_gen1_flush_debug_queue(struct iris_core *core, u8 *packet)
 {
 	struct hfi_msg_sys_debug_pkt *pkt;
 	struct hfi_pkt_hdr *hdr;
+	int num_pkts = 0;
 	u32 log_size;
 	u8 *log;
 
 	while (!iris_hfi_queue_dbg_read(core, packet)) {
 		hdr = (struct hfi_pkt_hdr *)packet;
+		num_pkts++;
 
 		if (hdr->size <= sizeof(*hdr))
 			continue;
@@ -705,15 +707,25 @@ static void iris_hfi_gen1_flush_debug_queue(struct iris_core *core, u8 *packet)
 				dev_dbg(core->dev, "%.*s", (int)log_size, log);
 		}
 	}
+
+	return num_pkts;
 }
 
 void iris_hfi_gen1_response_handler(struct iris_core *core)
 {
-	memset(core->response_packet, 0, sizeof(struct hfi_pkt_hdr));
-	while (!iris_hfi_queue_msg_read(core, core->response_packet)) {
-		iris_hfi_gen1_handle_response(core, core->response_packet);
+	int num_debug_pkts;
+	int num_msg_pkts;
+
+	do {
+		num_msg_pkts = 0;
 		memset(core->response_packet, 0, sizeof(struct hfi_pkt_hdr));
-	}
+		while (!iris_hfi_queue_msg_read(core, core->response_packet)) {
+			iris_hfi_gen1_handle_response(core, core->response_packet);
+			num_msg_pkts++;
+			memset(core->response_packet, 0, sizeof(struct hfi_pkt_hdr));
+		}
 
-	iris_hfi_gen1_flush_debug_queue(core, core->response_packet);
+		num_debug_pkts =
+			iris_hfi_gen1_flush_debug_queue(core, core->response_packet);
+	} while (num_msg_pkts || num_debug_pkts);
 }
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
index e8dc8751ea939bd544699f464a831736fcc10b7f..1bd4ec0c5ada1ef17de4f07fe19d1fac611db04f 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
@@ -988,14 +988,16 @@ static int iris_hfi_gen2_handle_response(struct iris_core *core, void *response)
 		return iris_hfi_gen2_handle_session_response(core, hdr);
 }
 
-static void iris_hfi_gen2_flush_debug_queue(struct iris_core *core, u8 *packet)
+static int iris_hfi_gen2_flush_debug_queue(struct iris_core *core, u8 *packet)
 {
 	struct hfi_debug_header *pkt;
+	int num_pkts = 0;
 	u32 log_size;
 	u8 *log;
 
 	while (!iris_hfi_queue_dbg_read(core, packet)) {
 		pkt = (struct hfi_debug_header *)packet;
+		num_pkts++;
 
 		if (pkt->size <= sizeof(*pkt) + 1)
 			continue;
@@ -1010,10 +1012,15 @@ static void iris_hfi_gen2_flush_debug_queue(struct iris_core *core, u8 *packet)
 		else
 			dev_dbg(core->dev, "%.*s", (int)log_size, log);
 	}
+
+	return num_pkts;
 }
 
 void iris_hfi_gen2_response_handler(struct iris_core *core)
 {
+	int num_debug_pkts;
+	int num_msg_pkts;
+
 	if (iris_vpu_watchdog(core, core->intr_status)) {
 		struct iris_hfi_packet pkt = {.type = HFI_SYS_ERROR_WD_TIMEOUT};
 
@@ -1024,11 +1031,16 @@ void iris_hfi_gen2_response_handler(struct iris_core *core)
 		return;
 	}
 
-	memset(core->response_packet, 0, sizeof(struct iris_hfi_header));
-	while (!iris_hfi_queue_msg_read(core, core->response_packet)) {
-		iris_hfi_gen2_handle_response(core, core->response_packet);
+	do {
+		num_msg_pkts = 0;
 		memset(core->response_packet, 0, sizeof(struct iris_hfi_header));
-	}
+		while (!iris_hfi_queue_msg_read(core, core->response_packet)) {
+			iris_hfi_gen2_handle_response(core, core->response_packet);
+			num_msg_pkts++;
+			memset(core->response_packet, 0, sizeof(struct iris_hfi_header));
+		}
 
-	iris_hfi_gen2_flush_debug_queue(core, core->response_packet);
+		num_debug_pkts =
+			iris_hfi_gen2_flush_debug_queue(core, core->response_packet);
+	} while (num_msg_pkts || num_debug_pkts);
 }
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index 8bc94acc4f58ce7792ddaeaad036475c476d5c36..318a548a7ac606594a41d9dae25e73205de1fd0d 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -233,7 +233,8 @@ static int iris_probe(struct platform_device *pdev)
 	if (!core)
 		return -ENOMEM;
 	core->dev = dev;
-	core->fw_debug = IRIS_FW_DEBUG_ERROR | IRIS_FW_DEBUG_FATAL;
+	core->fw_debug = IRIS_FW_DEBUG_DEFAULT;
+	core->hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE;
 
 	core->state = IRIS_CORE_DEINIT;
 	mutex_init(&core->lock);
diff --git a/drivers/media/platform/qcom/iris/iris_utils.c b/drivers/media/platform/qcom/iris/iris_utils.c
index ba5c8dc1280c2e147cd33498b69a815cf7c75683..dbddfd770edce22fba58eff15cb6d45eae5ed638 100644
--- a/drivers/media/platform/qcom/iris/iris_utils.c
+++ b/drivers/media/platform/qcom/iris/iris_utils.c
@@ -70,12 +70,14 @@ void iris_helper_buffers_done(struct iris_inst *inst, unsigned int type,
 int iris_wait_for_session_response(struct iris_inst *inst, bool is_flush)
 {
 	struct completion *done;
+	unsigned int timeout;
 	int ret;
 
 	done = is_flush ? &inst->flush_completion : &inst->completion;
+	timeout = READ_ONCE(inst->core->hw_response_timeout);
 
 	mutex_unlock(&inst->lock);
-	ret = wait_for_completion_timeout(done, msecs_to_jiffies(HW_RESPONSE_TIMEOUT_VALUE));
+	ret = wait_for_completion_timeout(done, msecs_to_jiffies(timeout));
 	mutex_lock(&inst->lock);
 	if (!ret) {
 		iris_inst_change_state(inst, IRIS_INST_ERROR);

-- 
2.34.1

