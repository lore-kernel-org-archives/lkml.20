Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAD87426D0A
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 10:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789208133; cv=none; b=bdrI0RBwSrqVkuXDl4akLWfLoLWgBnvcOOUVGd+DcM/hN9X37BOI4UUzTYfgSE7rWHXMMxoAV9MFDKlS8or5G2kvppNwrEuHQO/Zpxek2zaKJyQ/3V2hFelxLSdk2zJUsdWXkg8ZmmMlkbA1JwTrIEQZX63hbp8GYtWAKLvjC3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789208133; c=relaxed/simple;
	bh=Qb7t3LD0tQpSkGNku35odIorRGrTh4kf86HfWCxatzs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XsoOonvihGzMmEMpkqf8ckchGdiGa/LeokilaU3lTipVelfbqn75mUdW/eLQtSq90bq7kybEzM00Rgah+k/muGdaut7gdtfIRjL6yUgOwys29oSVH0G+UHpjAcXkOCfXqvDcly7zs36OJqlxrIyAIEUuYV0reN+96g5K94X6BhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WC9Foc0a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U63MrLXG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WC9Foc0a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U63MrLXG"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68C85AHB2342823
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 10:15:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7+Ef6q3Hgytc9hPBKFwx3x7VTNrMji0EsP21MgBetjs=; b=WC9Foc0aCPnEQfZk
	vsXYrgiqZT9V3ANGgqzv4P8VdkGTr/fwAEAqnKAcJ0CXQUroEhN24VZJSX1XqtH2
	duQUSmLUurY+9gCPGkIPcGjti0I8NoXq70V427Qi1MdOASbpQMU15vgki7bd22yO
	Dpkgh1xDMA6et+J7mqcaKPYpAFFGp+8LpAgxiqIlA1P/T1XegTHn3o1/EpMaV3Gy
	MmU9uRh+FfHO0ee7yJTVxYytQwX2Qf7irAT8Ncvo8b0/pAfdRwPgEx3Fy+vkghu2
	o2xOnh+5/GQt/QBPnpUcouU5gnux8mmFyR+iatkQdKm3UUWcLMI32hY/BdJjMm2V
	Ad6dkA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9d8p65-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 10:15:30 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38dbf293831so3644483a91.3
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 03:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789208129; x=1789812929; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7+Ef6q3Hgytc9hPBKFwx3x7VTNrMji0EsP21MgBetjs=;
        b=U63MrLXGQ/CC/Dj9LHIzHXLuUREPMWuBOPqI+3ZhSNjG1npoKkiku2iFHFGvo4wxKg
         PdQ+hZPR2VslSmXe9brkQOr70RhL0cl3ajWDayIgC5Qb/3XMl6DyKPOroSJtaoO5eDbZ
         0ML9gKbsGAMFPaDOGbB/zlCjKSpjLVrqe4uGiGg2MVbnyhbqwyfyw8noxGbLPkiNDkru
         /Q29CwHQdWev0VY53GHfENmpFJb0Eki04twYb6d3CvS+WA+avoz17lJr0C4dtq0jRTMa
         gajxUgoqdj7WuQzhkRH5xM1JvbNTwL6A45I5pE/MSCISphBxDPWh7Lme8rhQ+PwP1JYO
         zf2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789208129; x=1789812929;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7+Ef6q3Hgytc9hPBKFwx3x7VTNrMji0EsP21MgBetjs=;
        b=AeUpwlrDM2YVTfptihI5U1SE8n9DDMuUDLYq15WcqOKA8tyoLjGPGn9mFI/aGW+rA7
         9/5CA26E1UkRJ3oH1OWBsf1e7LjyxIO5wQQGfgS98ntHTWjkm37ALkSsbHkqaFKnzyE4
         jyU/QHMNBLCXt0jwEdl7WpHbTB+7N3zGXpduyQxGqThbx6kCOOlyTMYupk6oBa/LGShD
         JJWjXtxhVphb8An7FAuwmv6Utf6ts0QH6uryPl4oRnRZVnPy0VmW+Qe31AabAcA0SglS
         zmHyXK2Zu78kX8hS9SVhnURo2yyf9AiZ37ehnXYzqKeq3pl0TMxk8yUTASnw3AcoSWcI
         Q3Bw==
X-Forwarded-Encrypted: i=1; AKwUvBw1wrzlvLmNSU5H6Z0iiHh+YssHkxndLG7DdFHlhdQSVFHDUvsAlwBd2lt7HsBONg0V895C3xTm9Eof3+o=@vger.kernel.org
X-Gm-Message-State: AFuF++mj9AA9agsmSRfj7qc0DSrjQajF2FO7HH5lpCGxA49MYhZOZNOk
	Zth+Qma4785eC1ppPOY7Us128w5G/Ud+P32u/fg+bwvALlIFlEwd+gBk3VSNxr62K7xnoLPfs0N
	0M7J0z/XT1wewUF3LcikLTdShgwhgIB3Oi3bKwwwNZP/zTvvpKzxqX/xKRrDkeWjhmw==
X-Gm-Gg: AYBFou0644d7INpWDFLUCZ44B9PiswzbwDghMYW8c3DK4zkYBv+w4U1RjPxjGjQVWOY
	zarf1ijBLbpg2WRcKo4/iDDh4XOnMJihbMmEWP2RNkxIAj9ldoP39l6WZvbL8fzZXFiQ/F6uI1p
	u4tf2KEpzaeaz3aax2ZLNfkw3YE5SMMuBU3ExbA3bVp6fmyKqWBsRwkGjqwXHQkfKKEhFm8yfwW
	IWJS+akrTZd+0JXvZllm5HEjWIvCWygyl7Py+iQTDITBJuCcgQiPdVBu7MwycYwYgUenU87LyLa
	MrUuQeLDoSAD+AP3KU93VpS+rAS+oP5n09NPf4E6jPALrUFePzbLKGdvy8CbWiz5ZzGW9he+A9Y
	o3wxYzqxu+m24mDsQNHEW4OMfMVlE+GFqVNcsj3ScHW29MGeK1oZ+/euAOuQ=
X-Received: by 2002:a17:90b:586f:b0:39b:66ee:a14 with SMTP id 98e67ed59e1d1-39d9c374d49mr12976389a91.25.1789208129233;
        Sat, 12 Sep 2026 03:15:29 -0700 (PDT)
X-Received: by 2002:a17:90b:586f:b0:39b:66ee:a14 with SMTP id 98e67ed59e1d1-39d9c374d49mr12976328a91.25.1789208128638;
        Sat, 12 Sep 2026 03:15:28 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33baf0ea9a1sm10340085eec.8.2026.09.12.03.15.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 03:15:28 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Sat, 12 Sep 2026 03:15:12 -0700
Subject: [PATCH RFC 1/5] optee: riscv: add RPMI TEE service group transport
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260912-rpmi-tee-service-grp-dev-v1-1-1d1d35c2a859@oss.qualcomm.com>
References: <20260912-rpmi-tee-service-grp-dev-v1-0-1d1d35c2a859@oss.qualcomm.com>
In-Reply-To: <20260912-rpmi-tee-service-grp-dev-v1-0-1d1d35c2a859@oss.qualcomm.com>
To: Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Rahul Pathak <rahul@summations.net>, Anup Patel <anup@brainfault.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        op-tee@lists.trustedfirmware.org, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEyMDE0NiBTYWx0ZWRfX0oegBLbdpah/
 1P3e25bM+emUgg2Ure6e5zV/B4Cc5MaXmrNSwp878i37vD4k/bTHpIXRcszz1pp2u6onhCxDlQH
 Zqr/WAxTYtHCDBAsSshRNiiepcpDq/tqu0a9VFuamiZl2Eqf3qMak73r+zTyPi18yI89NmkyBHz
 pT3ztHQaUaRTVtPO7GzfabYidCpE61qRHQU5vewYm2BZXR6vcXl9gicAZTqlNOQm07FQMyAZ5cd
 FQiTMRw+NZqitq600DINbdllw4bP+MnIb3EBmWHksf3FIU6hBfhNcq3hZqX2x6N/mvbRTf7m5fP
 iIMvLv9CU9s0EVncFHE21dDXGeeJhSFFpiqBvdZjDutploebLytZSN9JBXWnB71+g9d5lCYL2kP
 71iChveAS3etrPHaRmi+C5ms2amDbg9ujNpwHpkmPVfIZrlkejHzAo5mSkgjIb1dpa9VRn3Bhyv
 RM+oS3zElUDg1KouL7w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEyMDE0NiBTYWx0ZWRfX5hxSkMQsRsz5
 8tOrKlGiF8ynigtUE5Zedg1RsOzsz4/g7UDmgoJgHjmfzunlr07jITJW7HI9qjp9mnYeBDnEyrw
 cUzWh28v9WrPyaju0r3sd4ntFXe4/cs=
X-Proofpoint-GUID: Mhi2IyyAFUoiL1fyIf2Nc9B9daVpEVTW
X-Authority-Analysis: v=2.4 cv=OeUNnRTY c=1 sm=1 tr=0 ts=6aa52642 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=CzNDq5WWsTbfHUazBTgA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: Mhi2IyyAFUoiL1fyIf2Nc9B9daVpEVTW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-12_03,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 adultscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609120146

Add an OP-TEE transport for RISC-V using the RPMI TEE service group over
the SBI MPXY mailbox framework.

Request one mailbox channel per hart and use the channel corresponding to
the current CPU when issuing a TEE request. Probe the RPMI TEE service
group and required memory-sharing capabilities before registering the
transport.

This provides the basic transport and discovery support needed by the
following patches.

Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 drivers/tee/optee/Makefile                 |   1 +
 drivers/tee/optee/core.c                   |   8 +-
 drivers/tee/optee/optee_private.h          |  34 ++++
 drivers/tee/optee/optee_riscv.c            | 312 +++++++++++++++++++++++++++++
 drivers/tee/optee/optee_riscv.h            | 141 +++++++++++++
 include/linux/mailbox/riscv-rpmi-message.h |   1 +
 6 files changed, 495 insertions(+), 2 deletions(-)

diff --git a/drivers/tee/optee/Makefile b/drivers/tee/optee/Makefile
index ad7049c1c107..925b8ec7ef68 100644
--- a/drivers/tee/optee/Makefile
+++ b/drivers/tee/optee/Makefile
@@ -9,6 +9,7 @@ optee-objs += supp.o
 optee-objs += device.o
 optee-objs += smc_abi.o
 optee-objs += ffa_abi.o
+optee-$(CONFIG_RISCV_SBI_MPXY_MBOX) += optee_riscv.o
 
 # for tracing framework to find optee_trace.h
 CFLAGS_smc_abi.o := -I$(src)
diff --git a/drivers/tee/optee/core.c b/drivers/tee/optee/core.c
index a52c1f498b99..63f1725e646e 100644
--- a/drivers/tee/optee/core.c
+++ b/drivers/tee/optee/core.c
@@ -220,6 +220,7 @@ void optee_remove_common(struct optee *optee)
 
 static int smc_abi_rc;
 static int ffa_abi_rc;
+static int riscv_abi_rc;
 static bool intf_is_regged;
 
 static int __init optee_core_init(void)
@@ -245,9 +246,10 @@ static int __init optee_core_init(void)
 
 	smc_abi_rc = optee_smc_abi_register();
 	ffa_abi_rc = optee_ffa_abi_register();
+	riscv_abi_rc = optee_riscv_abi_register();
 
-	/* If both failed there's no point with this module */
-	if (smc_abi_rc && ffa_abi_rc) {
+	/* If all failed there's no point with this module */
+	if (smc_abi_rc && ffa_abi_rc && riscv_abi_rc) {
 		if (IS_REACHABLE(CONFIG_RPMB)) {
 			rpmb_interface_unregister(&rpmb_class_intf);
 			intf_is_regged = false;
@@ -270,6 +272,8 @@ static void __exit optee_core_exit(void)
 		optee_smc_abi_unregister();
 	if (!ffa_abi_rc)
 		optee_ffa_abi_unregister();
+	if (!riscv_abi_rc)
+		optee_riscv_abi_unregister();
 }
 module_exit(optee_core_exit);
 
diff --git a/drivers/tee/optee/optee_private.h b/drivers/tee/optee/optee_private.h
index aefe1e6f5689..8d22d65e087b 100644
--- a/drivers/tee/optee/optee_private.h
+++ b/drivers/tee/optee/optee_private.h
@@ -171,6 +171,31 @@ struct optee_ffa {
 	struct work_struct notif_work;
 };
 
+/**
+ * struct optee_riscv - RPMI TEE communication struct
+ * @chan:		per-hart RPMI TEE service group mailbox channels
+ * @client:		RPMI mailbox client used to request @chan
+ * @dev:		device backing the RPMI TEE mailbox client
+ * @nr_chan:		number of entries in @chan
+ * @max_msg_data_size:	maximum RPMI message data size of the TEE channel
+ * @mutex:		serializes access to @global_ids
+ * @global_ids:		memory parcel id to tee_shm translation table
+ *
+ * This is the RISC-V analog of struct optee_ffa: communication with secure
+ * world OP-TEE OS rides the RPMI TEE service group (RPMI spec section 4.16)
+ * over the SBI MPXY mailbox instead of Arm FF-A.
+ */
+struct optee_riscv {
+	struct mbox_chan **chan;
+	struct mbox_client *client;
+	struct device *dev;
+	unsigned int nr_chan;
+	u32 max_msg_data_size;
+	/* Serializes access to @global_ids */
+	struct mutex mutex;
+	struct rhashtable global_ids;
+};
+
 struct optee;
 
 /**
@@ -231,6 +256,7 @@ struct optee_ops {
  * @ctx:			driver internal TEE context
  * @smc:			specific to SMC ABI
  * @ffa:			specific to FF-A ABI
+ * @riscv:			specific to RPMI TEE ABI
  * @shm_arg_cache:		shared memory cache argument
  * @call_queue:			queue of threads waiting to call @invoke_fn
  * @notif:			notification synchronization struct
@@ -259,6 +285,7 @@ struct optee {
 	union {
 		struct optee_smc smc;
 		struct optee_ffa ffa;
+		struct optee_riscv riscv;
 	};
 	struct optee_shm_arg_cache shm_arg_cache;
 	struct optee_call_queue call_queue;
@@ -426,5 +453,12 @@ int optee_smc_abi_register(void);
 void optee_smc_abi_unregister(void);
 int optee_ffa_abi_register(void);
 void optee_ffa_abi_unregister(void);
+#ifdef CONFIG_RISCV_SBI_MPXY_MBOX
+int optee_riscv_abi_register(void);
+void optee_riscv_abi_unregister(void);
+#else
+static inline int optee_riscv_abi_register(void) { return -EOPNOTSUPP; }
+static inline void optee_riscv_abi_unregister(void) { }
+#endif
 
 #endif /*OPTEE_PRIVATE_H*/
diff --git a/drivers/tee/optee/optee_riscv.c b/drivers/tee/optee/optee_riscv.c
new file mode 100644
index 000000000000..0fe4edf92fc9
--- /dev/null
+++ b/drivers/tee/optee/optee_riscv.c
@@ -0,0 +1,312 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ *
+ * This file implements the ABI used when communicating with secure world
+ * OP-TEE OS over the RPMI TEE service group (RPMI spec section 4.16). It is
+ * the RISC-V analog of ffa_abi.c: OP-TEE and Linux are peer endpoints of the
+ * RPMI framework (OpenSBI), and shared memory follows the FF-A memory-donation
+ * model through the RPMI memory parcel services.
+ *
+ * This file is divided into the following sections:
+ * 1. Low level RPMI TEE service group transport over the SBI MPXY mailbox
+ * 2. Feature discovery and notification handshake
+ * 3. Driver initialization
+ *
+ * The remaining FF-A-equivalent sections (parcel id hash table, tee_param
+ * marshalling, dynamic shared memory pool and the scheduled call into secure
+ * world) are added on top of this transport layer.
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/errno.h>
+#include <linux/mailbox_client.h>
+#include <linux/mailbox/riscv-rpmi-message.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+#include <linux/smp.h>
+#include <linux/tee_core.h>
+#include <linux/types.h>
+
+#include "optee_private.h"
+#include "optee_riscv.h"
+
+/*
+ * 1. Low level RPMI TEE service group transport over the SBI MPXY mailbox
+ *
+ * The RPMI TEE service group is reached through the SBI MPXY mailbox. Each
+ * hart owns a dedicated MPXY channel so that a call issued on a given hart is
+ * serviced by the OP-TEE context bound to it; optee_riscv_send() therefore
+ * selects the channel of the running hart. All RPMI messages are exchanged
+ * synchronously with rpmi_mbox_send_message().
+ */
+
+static int optee_riscv_send(struct optee *optee, struct rpmi_mbox_message *msg)
+{
+	int cpu, ret;
+
+	cpu = get_cpu();
+	if (cpu >= optee->riscv.nr_chan || !optee->riscv.chan[cpu]) {
+		put_cpu();
+		return -ENODEV;
+	}
+	ret = rpmi_mbox_send_message(optee->riscv.chan[cpu], msg);
+	put_cpu();
+
+	return ret;
+}
+
+/*
+ * 2. Feature discovery and notification handshake
+ *
+ * TEE_PROBE_FEATURES (0x02) reports which framework features are available;
+ * TEE_ENABLE_NOTIFICATION (0x01) subscribes to TEE service group events. Both
+ * are mandatory services (RPMI spec section 4.16), so probing them also
+ * confirms that the framework speaks the TEE service group on this channel.
+ */
+
+static int optee_riscv_probe_feature(struct optee *optee, u32 feature_id,
+				     u32 *value)
+{
+	struct rpmi_tee_probe_features_req tx = {
+		.feature_id = cpu_to_le32(feature_id),
+	};
+	struct rpmi_tee_probe_features_resp rx = { };
+	struct rpmi_mbox_message msg;
+	int ret;
+
+	rpmi_mbox_init_send_with_response(&msg, RPMI_TEE_SRV_PROBE_FEATURES,
+					  &tx, sizeof(tx), &rx, sizeof(rx));
+	ret = optee_riscv_send(optee, &msg);
+	if (ret)
+		return ret;
+	if (rx.status)
+		return rpmi_to_linux_error(le32_to_cpu(rx.status));
+
+	if (value)
+		*value = le32_to_cpu(rx.value);
+
+	return 0;
+}
+
+static int optee_riscv_features(struct optee *optee)
+{
+	u32 share = RPMI_TEE_MEMORY_SHARE_NONE;
+	int ret;
+
+	/*
+	 * Memory parcels carry normal-world shared memory to OP-TEE, so the
+	 * framework must support sharing memory between the REE and a TEE.
+	 */
+	ret = optee_riscv_probe_feature(optee, RPMI_TEE_FEAT_MEMORY_SHARE,
+					&share);
+	if (ret) {
+		pr_err("Failed to probe MEMORY_SHARE feature: %d\n", ret);
+		return ret;
+	}
+	if (share != RPMI_TEE_MEMORY_SHARE_FULL) {
+		pr_err("Framework cannot share memory between REE and TEE (%u)\n",
+		       share);
+		return -EOPNOTSUPP;
+	}
+
+	return 0;
+}
+
+static int optee_riscv_enable_notif(struct optee *optee)
+{
+	struct rpmi_tee_probe_features_resp rx = { };
+	struct rpmi_mbox_message msg;
+	int ret;
+
+	rpmi_mbox_init_send_with_response(&msg, RPMI_TEE_SRV_ENABLE_NOTIFICATION,
+					  NULL, 0, &rx, sizeof(rx));
+	ret = optee_riscv_send(optee, &msg);
+	if (ret)
+		return ret;
+
+	/*
+	 * The TEE service group defines no notification events on this
+	 * platform, so RPMI_ERR_NOTSUPP is expected and not fatal.
+	 */
+	if (rx.status && le32_to_cpu(rx.status) != (u32)RPMI_ERR_NOTSUPP)
+		return rpmi_to_linux_error(le32_to_cpu(rx.status));
+
+	return 0;
+}
+
+/*
+ * 3. Driver initialization
+ *
+ * The RPMI TEE service group is described in the device tree by a single
+ * node whose "mboxes" property lists one SBI MPXY channel per hart, in hart
+ * order. The driver requests each list entry by index and validates the
+ * transport before building the OP-TEE device.
+ */
+
+static int optee_riscv_request_channels(struct optee *optee)
+{
+	struct device *dev = optee->riscv.dev;
+	int nr_mboxes;
+	unsigned int cpuid;
+
+	nr_mboxes = of_count_phandle_with_args(dev->of_node, "mboxes",
+					       "#mbox-cells");
+	if (nr_mboxes != optee->riscv.nr_chan)
+		return dev_err_probe(dev, -EINVAL,
+				     "Expected %u mailbox channels, got %d\n",
+				     optee->riscv.nr_chan, nr_mboxes);
+
+	for (cpuid = 0; cpuid < optee->riscv.nr_chan; cpuid++) {
+		optee->riscv.chan[cpuid] =
+			mbox_request_channel(optee->riscv.client, cpuid);
+		if (IS_ERR(optee->riscv.chan[cpuid])) {
+			int ret = PTR_ERR(optee->riscv.chan[cpuid]);
+
+			optee->riscv.chan[cpuid] = NULL;
+			return dev_err_probe(dev, ret,
+					     "Failed to request channel %u\n",
+					     cpuid);
+		}
+	}
+
+	return 0;
+}
+
+static void optee_riscv_free_channels(struct optee *optee)
+{
+	unsigned int i;
+
+	for (i = 0; i < optee->riscv.nr_chan; i++) {
+		if (optee->riscv.chan[i])
+			mbox_free_channel(optee->riscv.chan[i]);
+	}
+}
+
+static int optee_riscv_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct rpmi_mbox_message msg;
+	struct mbox_client *client;
+	struct optee *optee;
+	u32 servicegroup_id;
+	unsigned int nr_cpus;
+	int ret;
+
+	nr_cpus = num_possible_cpus();
+	if (!nr_cpus)
+		return dev_err_probe(dev, -ENODEV, "No harts found\n");
+
+	optee = kzalloc_obj(*optee);
+	if (!optee)
+		return -ENOMEM;
+
+	client = devm_kzalloc(dev, sizeof(*client), GFP_KERNEL);
+	if (!client) {
+		ret = -ENOMEM;
+		goto err_free_optee;
+	}
+	client->dev		= dev;
+	client->rx_callback	= NULL;
+	client->tx_block	= false;
+	client->knows_txdone	= true;
+	client->tx_tout		= 0;
+
+	optee->riscv.dev = dev;
+	optee->riscv.client = client;
+	optee->riscv.nr_chan = nr_cpus;
+	optee->riscv.chan = kcalloc(nr_cpus, sizeof(*optee->riscv.chan),
+				    GFP_KERNEL);
+	if (!optee->riscv.chan) {
+		ret = -ENOMEM;
+		goto err_free_optee;
+	}
+
+	ret = optee_riscv_request_channels(optee);
+	if (ret)
+		goto err_free_channels;
+
+	/* Confirm the channel really speaks the TEE service group. */
+	rpmi_mbox_init_get_attribute(&msg, RPMI_MBOX_ATTR_SERVICEGROUP_ID);
+	ret = optee_riscv_send(optee, &msg);
+	if (ret) {
+		dev_err_probe(dev, ret, "Failed to get service group id\n");
+		goto err_free_channels;
+	}
+	servicegroup_id = msg.attr.value;
+	if (servicegroup_id != RPMI_SRVGRP_TEE) {
+		ret = -ENODEV;
+		dev_err_probe(dev, ret, "Not a TEE service group channel (0x%x)\n",
+			      servicegroup_id);
+		goto err_free_channels;
+	}
+
+	rpmi_mbox_init_get_attribute(&msg, RPMI_MBOX_ATTR_MAX_MSG_DATA_SIZE);
+	ret = optee_riscv_send(optee, &msg);
+	if (ret) {
+		dev_err_probe(dev, ret, "Failed to get max msg data size\n");
+		goto err_free_channels;
+	}
+	optee->riscv.max_msg_data_size = msg.attr.value;
+
+	ret = optee_riscv_features(optee);
+	if (ret) {
+		dev_err_probe(dev, ret, "Missing required TEE features\n");
+		goto err_free_channels;
+	}
+
+	ret = optee_riscv_enable_notif(optee);
+	if (ret) {
+		dev_err_probe(dev, ret, "Failed to enable notifications\n");
+		goto err_free_channels;
+	}
+
+	platform_set_drvdata(pdev, optee);
+	dev_info(dev, "initialized driver\n");
+
+	return 0;
+
+err_free_channels:
+	optee_riscv_free_channels(optee);
+	kfree(optee->riscv.chan);
+err_free_optee:
+	kfree(optee);
+	return ret;
+}
+
+static void optee_riscv_remove(struct platform_device *pdev)
+{
+	struct optee *optee = platform_get_drvdata(pdev);
+
+	optee_riscv_free_channels(optee);
+	kfree(optee->riscv.chan);
+	kfree(optee);
+}
+
+static const struct of_device_id optee_riscv_match[] = {
+	{ .compatible = "riscv,rpmi-mpxy-tee" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, optee_riscv_match);
+
+static struct platform_driver optee_riscv_driver = {
+	.driver = {
+		.name = DRIVER_NAME "-riscv",
+		.of_match_table = optee_riscv_match,
+	},
+	.probe = optee_riscv_probe,
+	.remove = optee_riscv_remove,
+};
+
+int optee_riscv_abi_register(void)
+{
+	return platform_driver_register(&optee_riscv_driver);
+}
+
+void optee_riscv_abi_unregister(void)
+{
+	platform_driver_unregister(&optee_riscv_driver);
+}
diff --git a/drivers/tee/optee/optee_riscv.h b/drivers/tee/optee/optee_riscv.h
new file mode 100644
index 000000000000..d87298faa6a2
--- /dev/null
+++ b/drivers/tee/optee/optee_riscv.h
@@ -0,0 +1,141 @@
+/* SPDX-License-Identifier: BSD-2-Clause */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/*
+ * This file is exported by OP-TEE and is kept in sync between secure world
+ * and normal world drivers. It describes the wire contract used when
+ * communicating with secure world OP-TEE OS over the RPMI TEE service group
+ * (RPMI specification section 4.16, SERVICEGROUP_ID 0x0010).
+ *
+ * The RPMI TEE service group is the RISC-V analog of Arm FF-A: OP-TEE and the
+ * rich execution environment (REE, i.e. Linux) are peer endpoints, and the
+ * RPMI framework (OpenSBI in M-mode) mediates every message. Memory sharing
+ * follows the FF-A memory-donation model through the memory parcel services:
+ * the REE creates a parcel describing its pages, OP-TEE accepts it lazily by
+ * parcel id, and teardown is two phased (OP-TEE releases, the REE reclaims).
+ *
+ * All request and response payloads are little-endian uint32 words as defined
+ * by the RPMI specification. These definitions MUST byte-match the OpenSBI
+ * framework definitions in <sbi_utils/mailbox/rpmi_msgprot.h>.
+ */
+
+#ifndef __OPTEE_RISCV_H
+#define __OPTEE_RISCV_H
+
+#include <linux/mailbox/riscv-rpmi-message.h>
+#include <linux/types.h>
+
+/*
+ * RPMI TEE service ids (RPMI spec section 4.16, Table 181).
+ *
+ * Only TEE_ENABLE_NOTIFICATION, TEE_PROBE_FEATURES and TEE_CALL are mandated;
+ * the remaining services are optional and may return RPMI_ERR_NOTSUPP.
+ */
+enum rpmi_tee_service_id {
+	RPMI_TEE_SRV_ENABLE_NOTIFICATION	= 0x01,
+	RPMI_TEE_SRV_PROBE_FEATURES		= 0x02,
+	RPMI_TEE_SRV_PROBE_SYSTEM		= 0x03,
+	RPMI_TEE_SRV_EXIT			= 0x04,
+	RPMI_TEE_SRV_SIGNAL_BUS_SETUP		= 0x05,
+	RPMI_TEE_SRV_SIGNAL_BUS_TEARDOWN	= 0x06,
+	RPMI_TEE_SRV_SIGNAL_RAISE		= 0x07,
+	RPMI_TEE_SRV_SIGNAL_RETRIEVE		= 0x08,
+	RPMI_TEE_SRV_MEM_PARCEL_CREATE		= 0x09,
+	RPMI_TEE_SRV_MEM_PARCEL_ACCEPT		= 0x0a,
+	RPMI_TEE_SRV_MEM_PARCEL_RELEASE		= 0x0b,
+	RPMI_TEE_SRV_MEM_PARCEL_RECLAIM		= 0x0c,
+	RPMI_TEE_SRV_MEM_PARCEL_SEGMENT_SEND	= 0x0d,
+	RPMI_TEE_SRV_MEM_PARCEL_SEGMENT_RECEIVE	= 0x0e,
+	RPMI_TEE_SRV_CALL			= 0x13,
+	RPMI_TEE_SRV_MAX_COUNT,
+};
+
+/*
+ * RPMI TEE endpoint identities.
+ *
+ * The RPMI specification does not fix numeric endpoint ids; they are assigned
+ * by the framework at runtime. These values match the OpenSBI framework
+ * assignment used on this platform: the REE is endpoint 0 and OP-TEE is
+ * endpoint 1.
+ */
+#define RPMI_TEE_ENDPOINT_REE		0
+#define RPMI_TEE_ENDPOINT_OPTEE		1
+
+/*
+ * RPMI TEE feature ids for TEE_PROBE_FEATURES (RPMI spec section 4.16.4,
+ * Table 182).
+ */
+enum rpmi_tee_feature_id {
+	RPMI_TEE_FEAT_MEMORY_DONATE	= 1,
+	RPMI_TEE_FEAT_MEMORY_LEND	= 2,
+	RPMI_TEE_FEAT_MEMORY_SHARE	= 3,
+	RPMI_TEE_FEAT_SIGNAL_BUS	= 4,
+	RPMI_TEE_FEAT_MULTISEGMENT_OPS	= 5,
+	RPMI_TEE_FEAT_SYSINFO_FORMAT	= 6,
+};
+
+/* MEMORY_SHARE feature values (RPMI spec Table 182). */
+#define RPMI_TEE_MEMORY_SHARE_NONE		0
+#define RPMI_TEE_MEMORY_SHARE_TEE_ONLY		1
+#define RPMI_TEE_MEMORY_SHARE_FULL		2
+
+/* TEE_PROBE_FEATURES request (Table 183) / response (Table 184). */
+struct rpmi_tee_probe_features_req {
+	__le32 feature_id;
+};
+
+struct rpmi_tee_probe_features_resp {
+	__le32 status;
+	__le32 value;
+};
+
+/*
+ * TEE_CALL wire encoding (RPMI spec section 4.16.21, Tables 218 and 219).
+ *
+ * TEE_CALL is the mandatory doorbell service used to enter OP-TEE. The
+ * request carries a fixed REE->OP-TEE identity, the well-known OP-TEE service
+ * UUID and a SERVICE_DATA payload; the response carries a STATUS word, a
+ * SERVICE_RSP_LEN word and the SERVICE_RSP payload.
+ *
+ * The SERVICE_DATA/SERVICE_RSP registers are XLEN-sized little-endian values.
+ * The structures are __packed so the 16-byte UUID does not force padding
+ * before the length word.
+ */
+#define RPMI_TEE_UUID_LEN		16
+
+/* OP-TEE communicate service UUID: 5be1b1a0-7e11-4e7a-9b10-0010c0ffee00 */
+#define RPMI_TEE_OPTEE_UUID						\
+	{ 0x5b, 0xe1, 0xb1, 0xa0, 0x7e, 0x11, 0x4e, 0x7a,		\
+	  0x9b, 0x10, 0x00, 0x10, 0xc0, 0xff, 0xee, 0x00 }
+
+/* OP-TEE SMC-style call convention carried inside SERVICE_DATA. */
+#define RPMI_TEE_OPTEE_CALL_REGS	8	/* a0-a7 */
+#define RPMI_TEE_OPTEE_RESP_REGS	4	/* a0-a3 */
+
+#if __riscv_xlen == 64
+typedef __le64 rpmi_xlen_t;
+#define cpu_to_rpmi_xlen(x)	cpu_to_le64(x)
+#define rpmi_xlen_to_cpu(x)	le64_to_cpu(x)
+#else
+typedef __le32 rpmi_xlen_t;
+#define cpu_to_rpmi_xlen(x)	cpu_to_le32(x)
+#define rpmi_xlen_to_cpu(x)	le32_to_cpu(x)
+#endif
+
+struct rpmi_tee_call_req {
+	__le32 sender_id;
+	__le32 target_id;
+	u8 service[RPMI_TEE_UUID_LEN];
+	__le32 service_data_len;
+	rpmi_xlen_t reg[RPMI_TEE_OPTEE_CALL_REGS];
+} __packed;
+
+struct rpmi_tee_call_resp {
+	__le32 status;
+	__le32 service_rsp_len;
+	rpmi_xlen_t reg[RPMI_TEE_OPTEE_RESP_REGS];
+} __packed;
+
+#endif /* __OPTEE_RISCV_H */
diff --git a/include/linux/mailbox/riscv-rpmi-message.h b/include/linux/mailbox/riscv-rpmi-message.h
index e135c6564d0c..47a540bd81c9 100644
--- a/include/linux/mailbox/riscv-rpmi-message.h
+++ b/include/linux/mailbox/riscv-rpmi-message.h
@@ -93,6 +93,7 @@ static inline int rpmi_to_linux_error(int rpmi_error)
 /* RPMI service group IDs */
 #define RPMI_SRVGRP_SYSTEM_MSI		0x00002
 #define RPMI_SRVGRP_CLOCK		0x00008
+#define RPMI_SRVGRP_TEE			0x00010
 
 /* RPMI clock service IDs */
 enum rpmi_clock_service_id {

-- 
2.34.1

