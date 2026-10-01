Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9512C52D2BE
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 15:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790867888; cv=none; b=rEIpDcDlp+Avi/5158E/FWD1R5t88ANDM73sqkcrJUO0DVM9++SCAOqEY9SsdG/5m8oBIyMQYCMuDproN3XbhBCjO39r/tGcxklZ/nITlUDihu0eA6eMmT5lAwIA49VACc5/ZDnlnUtE8HQ8M4CZEdKvyPX5Wkc3v4ScqsxAdmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790867888; c=relaxed/simple;
	bh=p6rhljcnBp+jXz15wzZQhMoSueg/QNRofByiFqfod3k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ivCDginsePbCgP4PgosG9SGB7+NmW3po4qMDzeE9oTig3+TS9Rzxkia5FoGRkzoPh8BI8l/Y5V6QPVr+V9GMBhudxlttxxfj/hP+jMUGWG9kG//8EFYoNMK7D1hcdJ9vkuBUy9Nkyv9ZAxhonGQ3IcmhonqDSRlaHoLWdrNvyBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SbclvA3Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H43UQlFT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SbclvA3Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H43UQlFT"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 691DjJVL2830103
	for <linux-kernel@vger.kernel.org>; Thu, 1 Oct 2026 15:18:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7dHXHAeNe23JwpU0+Wwv+s8PNSaEhZzJ11+JoEi3jlM=; b=SbclvA3Zjjpah1F9
	zioa/ZAk7hQz5nmbb7Rra8eQPBk5eJ+zW77EfhAg0E9rxX+c/7iwktYoPXNAZIYI
	kEhM0UsXN2ZZvG7kidITCHibVDm+YxJi28RdqEUyBNELTlV702tpvYkTvi2yCDTB
	7/6NbjMkVO8yVCvHZaq3QyoO2uwRPql5wHo7lpNJtmJpOWc7BFdakaRPd782jWM8
	uasS9ML7dni6r27N9AQyHIXxF0yOytQ6INaVG3HTTL3X/SelIKifpNvImySSjeP/
	fMASSWYaDPY+MrRrU6WJRkXP619K+G/yudr8z1mvRsG1v9X7V/IwK7/5Tt9Ub2Ej
	jEo6Dw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1bh5bnk8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 15:18:05 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-34bbf2e3c5cso5518029eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 08:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790867885; x=1791472685; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7dHXHAeNe23JwpU0+Wwv+s8PNSaEhZzJ11+JoEi3jlM=;
        b=H43UQlFTXnv3NhgFdqgcjMzl/nVi28rB5DHSXSSXVIK2pCviQthmdI2Tfmfg7a5g5K
         z+9aTWIwraeT4J4kBqYw+NRERqNMUJfS37J1KjfaM5vyY2Wv2xL8giZRlvY//P9QXNww
         K5u+RCAXorbh2ECEOysIOFEV0a6BKpH7XsQEHGaXHGM7dT2EE82ppXsxKdz+VSzGJEKo
         SZ33pA24jat+aML5JQnbTNHUw83QdbodAi7GFpOtCruTMPlTbTAuBMQXYxLK4RSOXNcP
         /4gWO10/WuHQ9HDUPKQMBK4LymWcANUaWzCAWQ18rCXGRvrezR3ksyNmOWsyGB2yYpeC
         wVTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790867885; x=1791472685;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7dHXHAeNe23JwpU0+Wwv+s8PNSaEhZzJ11+JoEi3jlM=;
        b=plbEKd0KcV5uciljS7mwV99texC0rAyvUDAryO/tQg6EZ9dkp7Dbgd4tW3dA940kKb
         ydKorQS7fnFFGURRpKP5pQoXaecA3gEbMy+XWBY4agAQ4B5LJORpAMJ9AeFLdx6L+9Iz
         aeXDD9Cr8UGWzmwphU56KfhF7EyuHWz4omwNGKlTp5SRrXQMumwzQk3riaf0NKfzEjKh
         Pp5AtPYrCKmFEkv612KF0PsDXH2ycPdi6oNo7RvTpifMxcPiAi4aU4ZxHMVV6q8jbsP6
         priC4omYfYDZCP/OlbyBshxfCM0dz8G3Uhf3/IMWiL4n+xLyYxZL4VaDEPfeiyi2B1Ef
         edZA==
X-Forwarded-Encrypted: i=1; AKwUvByJ2dbpM0PkgLwnHWMshWNdk5zzEa4pSI3YdbcWfmctyp/AS+62fn8aL2PXlUTm5tP6vur0qv1P/6tbL4Y=@vger.kernel.org
X-Gm-Message-State: AFuF++lcDgFKqQvEhNwxXI4U0lYzEJwiJas3yeNOOy5WX4RdzvSO4FaH
	A7yZFQCH5YvT2N0VtNMfqZEfTYrNtypQY/vJpseCr/ZaC6Mh2GqEVS8EW16B2X2b9Ws+8g3RwhP
	oeFEspL/Z1W4lt3I8V6UQgoYoVPzAbxFDeOp98A4JhBC935eD0fV8DRGskzeFE1ItbmU=
X-Gm-Gg: AYBFou3kIXIc1FcTWj1+GNbmVTuHUUG1T0h+/2Ert0/JSrH/F6B0NKRk5cYMjX1FscT
	rslMWNezjLf944SvJtCcKVPFye7iF7Xr/ibyNuqsloHina3tbkYO+tb6Axsgx72AaXzt55tyH1k
	iPENmDLxl0CADzIhtp2pBzHz8kfwnP0skX0tEmBlH8g9MFH/zpphzQU8FFyqwI1kGfs9Dcb9GEG
	OnkKxniSNokVTpgsVPf2/wYZcJ4XJU9ZjCjUJBq1UWLKwenknPACKVO0GRMNBNvGBQbv4hGspOM
	MKxCzQepd6UVKrVPoUGQC6pB2kZMkobPhE0aHQVo2peXFa8ZHwO2stfvFBufEX37xXHI2Pta5jT
	m/vPD8IEd76rSP9ZlOGwOfZ7A2NXB5fzmNw==
X-Received: by 2002:a05:7300:2a95:b0:34b:e2cf:43b6 with SMTP id 5a478bee46e88-34cdd0a96f7mr5115532eec.2.1790867884443;
        Thu, 01 Oct 2026 08:18:04 -0700 (PDT)
X-Received: by 2002:a05:7300:2a95:b0:34b:e2cf:43b6 with SMTP id 5a478bee46e88-34cdd0a96f7mr5115489eec.2.1790867883658;
        Thu, 01 Oct 2026 08:18:03 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14f246d32d2sm115700c88.1.2026.10.01.08.17.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 08:18:03 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Thu, 01 Oct 2026 20:47:24 +0530
Subject: [PATCH v4 4/6] media: iris: add platform data for kaanapali
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-kaanapali-iris-v4-4-642f9ac5e699@oss.qualcomm.com>
References: <20261001-kaanapali-iris-v4-0-642f9ac5e699@oss.qualcomm.com>
In-Reply-To: <20261001-kaanapali-iris-v4-0-642f9ac5e699@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree@vger.kernel.org,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790867851; l=8545;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=p6rhljcnBp+jXz15wzZQhMoSueg/QNRofByiFqfod3k=;
 b=4SC5f6P+PvP4irga9iViCW4zDmymJD+FnIBCMAPf2g5xMOmoUMbJJOAW8S1YYQcBOZW1lc3jP
 uy58z2N5/sVB1HUAyLA+R1hjcPwldPoXLx2rMsRtCX5RUSPha8xEdce
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-GUID: 9FgRL2E7_kTjmkiGNBYS5Pawc_eiONem
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA2MCBTYWx0ZWRfX8SrGIgl6tTBh
 Sek+PXO+AwMdTnZ5bTsdRoJjDguqIE15ll3cUbDL2cidnTIruRTCJwdvwBbwh5BaTTYq/S/hb+A
 L+2+/SVQ7j7mBXFyaiyVfd32P11feew=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA2MCBTYWx0ZWRfX512uPzXAtWyv
 rZ1ue65XGjNus41ooSm21gx8BpOA5AjJZa6Q2vZ0gdyEoY2XuMfNckWRVE4OBz/984imtCA8Vap
 hGGlQ5+Ja6GndLSMRdHxcAJNrP+MbGVFefuauVm7t5g4gOmX7FkQXdroVy8P19sxrMRVSvAeZis
 ihgYUZn4cMHTK+1J+2w9RcDnEmSmi4pmXfwedcVCAkdPbl2cyZuxAiP0i723NXG3QN1esl8amCE
 IepRQoQqjbrpOD+I+0//dGY7/9MQLqfP/yKbvai6upAUdrmpFneW9ndUOEJQYJ91PcqsCW1/sMX
 jvKgt9Szhk3jGd6hTSleARVoGzcSL3U2Tc5wthaGHSmrBU9z/+k4DBpjqgeUMLNrZYJYpx2NSDW
 ZRIsaD0vozRGcT8w1Y23bHfAiX4M9Pu80eMJMlSOvdk6Aem5Y1FLXdwBg/RZwJeyaoe10KzknhO
 cFx0plEiRESsy/bwCoA==
X-Authority-Analysis: v=2.4 cv=NuxE4MdJ c=1 sm=1 tr=0 ts=6abe79ad cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=Jh6IeAywF76aN7zT5WMA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: 9FgRL2E7_kTjmkiGNBYS5Pawc_eiONem
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610010060

Add support for the kaanapali platform in the iris driver to support
video functionality on kaanapali platform.

Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/Makefile          |  2 +
 .../platform/qcom/iris/iris_platform_common.h      |  4 ++
 .../platform/qcom/iris/iris_platform_kaanapali.c   | 58 +++++++++++++++++++
 .../platform/qcom/iris/iris_platform_kaanapali.h   | 15 +++++
 .../media/platform/qcom/iris/iris_platform_vpu4x.c | 66 ++++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_probe.c      |  4 ++
 6 files changed, 149 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
index 48e415cbc4390bc596f6239fefa2a2ad2cd3a2bb..65ad965515a3a368c0f4c9115263e101252b7c0a 100644
--- a/drivers/media/platform/qcom/iris/Makefile
+++ b/drivers/media/platform/qcom/iris/Makefile
@@ -12,8 +12,10 @@ qcom-iris-objs += iris_buffer.o \
              iris_hfi_gen2_packet.o \
              iris_hfi_gen2_response.o \
              iris_hfi_queue.o \
+             iris_platform_kaanapali.o \
              iris_platform_vpu2.o \
              iris_platform_vpu3x.o \
+             iris_platform_vpu4x.o \
              iris_power.o \
              iris_probe.o \
              iris_resources.o \
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 9748095091461ba13443c63955a42906fa4f050c..e8ed0e7c769f37443148cb9418d4efafdc21485b 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -39,6 +39,9 @@ struct iris_inst;
 #define MAX_HEVC_VBR_LAYER_HP_SLIDING_WINDOW	5
 #define MAX_HIER_CODING_LAYER_GEN1		6
 
+#define VIDEO_REGION_VM0_SECURE_NP_ID		1
+#define VIDEO_REGION_VM0_NONSECURE_NP_ID	5
+
 enum stage_type {
 	STAGE_1 = 1,
 	STAGE_2 = 2,
@@ -54,6 +57,7 @@ extern const struct iris_firmware_data iris_hfi_gen1_data;
 extern const struct iris_firmware_data iris_hfi_gen2_data;
 extern const struct iris_firmware_data iris_hfi_milos_data;
 
+extern const struct iris_platform_data kaanapali_data;
 extern const struct iris_platform_data milos_data;
 extern const struct iris_platform_data qcs8300_data;
 extern const struct iris_platform_data sc7280_data;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_kaanapali.c b/drivers/media/platform/qcom/iris/iris_platform_kaanapali.c
new file mode 100644
index 0000000000000000000000000000000000000000..cc7529e22d84a0a9bc55ff528686166b2f3c6a87
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_platform_kaanapali.c
@@ -0,0 +1,58 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include "iris_core.h"
+#include "iris_platform_common.h"
+
+const char *const iris_kaanapali_clk_reset_table[] = {
+	"bus0",
+	"bus1",
+	"core",
+	"vcodec0_core",
+};
+
+const char *const iris_kaanapali_pmdomain_table[] = {
+	"venus",
+	"vcodec0",
+	"vpp0",
+	"vpp1",
+	"apv",
+};
+
+const struct platform_clk_data iris_kaanapali_clk_table[] = {
+	{IRIS_AXI_CLK,		"iface"			},
+	{IRIS_CTRL_CLK,		"core"			},
+	{IRIS_HW_CLK,		"vcodec0_core"		},
+	{IRIS_AXI1_CLK,		"iface1"		},
+	{IRIS_CTRL_FREERUN_CLK,	"core_freerun"		},
+	{IRIS_HW_FREERUN_CLK,	"vcodec0_core_freerun"	},
+	{IRIS_BSE_HW_CLK,	"vcodec_bse"		},
+	{IRIS_VPP0_HW_CLK,	"vcodec_vpp0"		},
+	{IRIS_VPP1_HW_CLK,	"vcodec_vpp1"		},
+	{IRIS_APV_HW_CLK,	"vcodec_apv"		},
+};
+
+const char *const iris_kaanapali_opp_clk_table[] = {
+	"vcodec0_core",
+	"vcodec_apv",
+	"vcodec_bse",
+	"core",
+	NULL,
+};
+
+struct tz_cp_config iris_kaanapali_tz_cp_config[] = {
+	{
+		.cp_start = VIDEO_REGION_VM0_SECURE_NP_ID,
+		.cp_size = 0,
+		.cp_nonpixel_start = 0x01000000,
+		.cp_nonpixel_size = 0x24800000,
+	},
+	{
+		.cp_start = VIDEO_REGION_VM0_NONSECURE_NP_ID,
+		.cp_size = 0,
+		.cp_nonpixel_start = 0x25800000,
+		.cp_nonpixel_size = 0xda400000,
+	},
+};
diff --git a/drivers/media/platform/qcom/iris/iris_platform_kaanapali.h b/drivers/media/platform/qcom/iris/iris_platform_kaanapali.h
new file mode 100644
index 0000000000000000000000000000000000000000..33ac3f5aad9149d78d8f4b83a0d6305b7fa09b2d
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_platform_kaanapali.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef __IRIS_PLATFORM_KAANAPALI_H__
+#define __IRIS_PLATFORM_KAANAPALI_H__
+
+extern const char *const iris_kaanapali_clk_reset_table[4];
+extern const char *const iris_kaanapali_pmdomain_table[5];
+extern const struct platform_clk_data iris_kaanapali_clk_table[10];
+extern const char *const iris_kaanapali_opp_clk_table[5];
+extern struct tz_cp_config iris_kaanapali_tz_cp_config[2];
+
+#endif /* __IRIS_PLATFORM_KAANAPALI_H__ */
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu4x.c b/drivers/media/platform/qcom/iris/iris_platform_vpu4x.c
new file mode 100644
index 0000000000000000000000000000000000000000..0d515adf331d7f451408826136539e6b6fd4a1af
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu4x.c
@@ -0,0 +1,66 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include "iris_hfi_gen2.h"
+#include "iris_vpu_buffer.h"
+#include "iris_vpu_common.h"
+
+#include "iris_platform_sm8550.h"
+#include "iris_platform_kaanapali.h"
+
+static const struct iris_firmware_desc iris_vpu40_p2_s7_gen2_desc = {
+	.firmware_data = &iris_hfi_gen2_data,
+	.get_vpu_buffer_size = iris_vpu4x_buf_size,
+	.fwname = "qcom/vpu/vpu40_p2_s7.mbn",
+};
+
+static const u32 iris_fmts_vpu4x_dec[] = {
+	[IRIS_FMT_H264] = V4L2_PIX_FMT_H264,
+	[IRIS_FMT_HEVC] = V4L2_PIX_FMT_HEVC,
+	[IRIS_FMT_VP9] = V4L2_PIX_FMT_VP9,
+};
+
+static const struct icc_info iris_icc_info_vpu4x[] = {
+	{ "cpu-cfg",    1000, 1000     },
+	{ "video-mem",  1000, 15000000 },
+};
+
+static const struct bw_info iris_bw_table_dec_vpu4x[] = {
+	{ ((4096 * 2160) / 256) * 60, 1608000 },
+	{ ((4096 * 2160) / 256) * 30,  826000 },
+	{ ((1920 * 1080) / 256) * 60,  567000 },
+	{ ((1920 * 1080) / 256) * 30,  294000 },
+};
+
+static const char * const iris_opp_pd_table_vpu4x[] = { "mxc", "mmcx" };
+
+const struct iris_platform_data kaanapali_data = {
+	.firmware_desc_gen2 = &iris_vpu40_p2_s7_gen2_desc,
+	.vpu_ops = &iris_vpu4x_ops,
+	.icc_tbl = iris_icc_info_vpu4x,
+	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu4x),
+	.clk_rst_tbl = iris_kaanapali_clk_reset_table,
+	.clk_rst_tbl_size = ARRAY_SIZE(iris_kaanapali_clk_reset_table),
+	.bw_tbl_dec = iris_bw_table_dec_vpu4x,
+	.bw_tbl_dec_size = ARRAY_SIZE(iris_bw_table_dec_vpu4x),
+	.pmdomain_tbl = iris_kaanapali_pmdomain_table,
+	.pmdomain_tbl_size = ARRAY_SIZE(iris_kaanapali_pmdomain_table),
+	.opp_pd_tbl = iris_opp_pd_table_vpu4x,
+	.opp_pd_tbl_size = ARRAY_SIZE(iris_opp_pd_table_vpu4x),
+	.clk_tbl = iris_kaanapali_clk_table,
+	.clk_tbl_size = ARRAY_SIZE(iris_kaanapali_clk_table),
+	.opp_clk_tbl = iris_kaanapali_opp_clk_table,
+	/* Upper bound of DMA address range */
+	.dma_mask = 0xffc00000 - 1,
+	.inst_iris_fmts = iris_fmts_vpu4x_dec,
+	.inst_iris_fmts_size = ARRAY_SIZE(iris_fmts_vpu4x_dec),
+	.inst_caps = &platform_inst_cap_sm8550,
+	.tz_cp_config_data = iris_kaanapali_tz_cp_config,
+	.tz_cp_config_data_size = ARRAY_SIZE(iris_kaanapali_tz_cp_config),
+	.num_vpp_pipe = 2,
+	.max_session_count = 16,
+	.max_core_mbpf = NUM_MBS_8K * 2,
+	.max_core_mbps = ((8192 * 4320) / 256) * 60,
+};
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index 4bdb078d83b5c331869dab2409bc4d10ab302737..be3e799edfbe4e13321ef1ecfe6e558eb7a69e01 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -427,6 +427,10 @@ static const struct dev_pm_ops iris_pm_ops = {
 };
 
 static const struct of_device_id iris_dt_match[] = {
+	{
+		.compatible = "qcom,kaanapali-iris",
+		.data = &kaanapali_data,
+	},
 	{
 		.compatible = "qcom,milos-iris",
 		.data = &milos_data,

-- 
2.34.1

