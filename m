Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51AE7497394
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 10:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791455062; cv=none; b=ixXH41/nJQQB2E9U+MDIlecwmFe2NRJi5GxcaeHkPvAuHwzXcZhH4Z1Vh15JBwRzS8T7t4lHq4ts6C51NYswCNo/tW8sa2DfuYKtEoA7KGsfK+4oyFOukOFw6Qwo3xo5rbVBPdTcHdHaHzRTgneZDnrv+CJztZLpwbsEHKjE1S4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791455062; c=relaxed/simple;
	bh=IHi3DNRggKYZINRtas480wVu3afmj1uTHe6Tzv2bAwc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KFgevExtO9xJST9GuEwvuvb/tEg8iCmukEOAxwM5olT0TzInhvAyRYp3hOtAS0YT3ppgT0MLmysoMIzPqYc6Luzj9L9H9VTMKWq0tHijUoQicZe/5BvielgYeUlGH9Lq3PGlG9xvFvWL+7nEBpykIbt0PKlfXdh2w7C2ZJOcyQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sn9ZY9b3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EURyj0mq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Sn9ZY9b3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EURyj0mq"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6987KAQI3191018
	for <linux-kernel@vger.kernel.org>; Thu, 8 Oct 2026 10:24:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uXbyyBJKwfKPnc2n7er0WoScXoDlsbg4SPEopQ3vcic=; b=Sn9ZY9b3k2ceh61u
	EmAQKOFZqGQicSglgmBeDcciRR6avPTgLIZ0HX7i37ch95viDdPbXGUzFESiaYwc
	/RyjTlTGFGFEx/KC49WAEEhNbuIp5Z2sr798zmlrdCRSesxd0Ac8JWDEiTY9xWOm
	k2f/8v+BsS7OFxnHcgJMUElvdu5bVJnYV94FO/kS3CFBW/3cIv3XnhZVP+8PzR2o
	oxj1+mYSTfntRi0QDzP5tviJ1n7UIzwAgqdwRFO2TbCvEFQ43xBECy2veGMlYgIc
	EfPRwtL9OZWWhhBTrQFEI6Ed+zCD9VSXOFNMqDsVnPq5I6BCOEmT6wWDLYxxu00M
	yYI5lQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe6afjf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 10:24:20 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e60bb65626so6969445ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 03:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791455060; x=1792059860; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uXbyyBJKwfKPnc2n7er0WoScXoDlsbg4SPEopQ3vcic=;
        b=EURyj0mq9r+j4lmr/ctJnKfw6tkBQJaVvh0p6WGiWbe4S6mrdLp8g8InyS0O6D/Z9x
         f/y/xtUKSIpCF9Sl436KBpdev18yt2luYgPCkyI4Vs0VZ/gq5HMScTZ5sQThN1Xdnoyq
         /A0yMzIyvFHzCFTbCFwgpViEP2TV8GqWZ7cjcJvnKc6UnR8SqwkvW8LvNtTWMfDyacF4
         jTYOswDMJP76FTN6eIMf8ykCIWM78iS5bWA1H1pBQc5IG10qbcM6ll6rN89NAh9c44pG
         3/qlwyLSSEJ2dV7GkD4J5lMZqZscxb08e2iE/1t/278A9WXFYpzbSkWbXvKcxaOCUsMZ
         LHsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791455060; x=1792059860;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uXbyyBJKwfKPnc2n7er0WoScXoDlsbg4SPEopQ3vcic=;
        b=XDbR8L9Tte42YTUOX9svxXRa56121g86GSL8fcrB/qnxr7qpB8eJq66xXtNU+xDEtI
         Zw34byJFVt8hy3u6F96w7YEesUqSqD1/DPtbYH8i5Ub6elhZFfjhdQdDSo5qK4RSapEe
         Qk6bLsTORQDgABwAdvvXEXmB0/RUHJaB5PgvOgeoqUJRqbdVlPKMfXIG2klVBfmSpAI/
         8tYlmcWKIreIZ2QMgCv8MoNHEhNI8CHuH1ZLUPlMnKre38/IHApRoQIOy9weoNR71wNj
         9d7QsvCU9b3om7dTqItrXjnGXPT9orwJlPsLLzA1wp8mEpYQClte07nLtCV9MC9FGasC
         rGuA==
X-Forwarded-Encrypted: i=1; AKwUvBygEQrmD6BBnGxH8hfJWT6ML40YLC+LWyU4wIEleZO3QfCDs58cWYH4TJMe6fs14rmj98uJn/xefy9YQ3U=@vger.kernel.org
X-Gm-Message-State: AFq9FYJMOfk2qnZE3mkTKm+WH8EX9Q2H8fKOGPCfJj1HQEWf8VYweOnv
	rWKS1jTswLNLnlXlG07fhsNXwQd4rP96YSoPem86sNu6vaj2SaeriFhk2A4UpWS4TPB5yNyNzRS
	7POcG+k4jra/xOWI+uVeLnGWEY2B5+5x3iDcaYqhhVrrr2+x/j1lChOXPYbThYy87HnE=
X-Gm-Gg: AYBFou1z7Y27hF3j36dKpxSbFBITd0nZxSaS32gb8HzEVmhROcTGsV+aslJKiEbh6Ru
	vaNSYr/LQsn+lnw+nSRR/ay9kj17kNHG5KQKagvBbbwbiLzlV+o94HnmSFcmw/DsgOCqOelykDK
	MhTyOSkEz6YfV1U9fhptnSk3o+nlI4wxaZfT8UDF8aexj2tn5UR1NNdHrJhj6/pLw0QbodR7ShK
	R/AhFgXvR9y/415hudktQSqrwzIlRIkIDtjzH6a7mukJCDOUxGDzGTr4HO9eyn+KwQyx4Tvwr0h
	sT810LOd5RfuKgo5BhldSbp/aAlY1u86scqdOJGnspjvey6mHOTu7cRhQTSQ6BEgCsNsSUgV6rV
	uctgJrt/eprATDf5oaF3praHJ00aw7pkRkZ3SzGHg+5Y9y2tciHZ7je6oEtRCKrDQ6bZ1phSyGa
	3geskbX+Hak9u3LdpIgJkkAg==
X-Received: by 2002:a17:902:ffcb:b0:2e2:defb:ea63 with SMTP id d9443c01a7336-2e7ffe05757mr11589765ad.23.1791455059856;
        Thu, 08 Oct 2026 03:24:19 -0700 (PDT)
X-Received: by 2002:a17:902:ffcb:b0:2e2:defb:ea63 with SMTP id d9443c01a7336-2e7ffe05757mr11589595ad.23.1791455059188;
        Thu, 08 Oct 2026 03:24:19 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e6046fe39csm22081655ad.16.2026.10.08.03.24.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 03:24:18 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 15:53:59 +0530
Subject: [PATCH ath-next 03/17] wifi: ath12k: Add hardware parameter for
 QCN6432
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-mpp_bringup-v1-3-2c5797b5e4ac@oss.qualcomm.com>
References: <20261008-mpp_bringup-v1-0-2c5797b5e4ac@oss.qualcomm.com>
In-Reply-To: <20261008-mpp_bringup-v1-0-2c5797b5e4ac@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>,
        Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: 9EITCJXR018tXndyrEhnh2QqzeIII62I
X-Authority-Analysis: v=2.4 cv=HcWB3SE8 c=1 sm=1 tr=0 ts=6ac76f54 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=IkfkkYc7qEKKYK4gSbYA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 9EITCJXR018tXndyrEhnh2QqzeIII62I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA0MSBTYWx0ZWRfX0J6tSfxvMM2J
 I8GlrhfD0MI4WxmLbD8HuCmZHNNUi8Ma9sq+FBEXw8vmy+goMCv109vo+sxDd08B2m2tR1UwJY3
 fmFjgaoYH7twmUqNfogc0BXcdruGzTcZOnWKF7IQx6JEqA6kUe2QB7pMJUT6paMqoa308RWXku1
 0Yt27q5OZdZnUW8RfwUeT2aIfsj6HPZrmAhSxvuzn7gatql7ky5IW1T3AZbm4lGkF8FxvqmNaRv
 W8b4l0tr5AHJZvY9Fg720uGF9iTa5NvDdcJyA6GDyysPxh195+fTcQtKixCDG8iwUl6WwX7MtUU
 IpLNZz+K7Xqw6r8QZehPnD5kDJU8ZCpD6jT4uqNZbzSyWBLslN3wCwBTB9b2PCHMYOaZ/WxFupG
 YvWjsuKBHrNC6WdB87s9eGOQqJ+1q7UVnq+vnfZFxvXetpGo7/lsR2bMjB5g+inYblPgHHEyYTC
 VJFOrU0SUmr2L1WxZEQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA0MSBTYWx0ZWRfX2CeMucyw2qyv
 itXu5mIhp8GMflV5NRBnCinieVpz6uyDAtGmngO/EA9jiNzGHOw8uxQNdoOPQfQIE0DwKoQftdk
 XvFxv2FNgV+qx4Ir9g0/7PR1Su5syOM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610080041

From: Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>

Add hardware parameter (ath12k_hw_params) for WiFi device QCN6432.

Some hardware parameters, such as host_ce_config, target_ce_config,
and svc_to_ce_map, are identical between the QCN6432 and IPQ5332
devices. Therefore, use the same parameters for the QCN6432.

Additionally, certain hardware parameters like wmi_init and hw_ops
are the same between the QCN6432 and QCN9274 devices. So, use the
same parameters for the QCN6432.

Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01275-QCAHKSWPL_SILICONZ-1

Signed-off-by: Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>
Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/core.h     |  1 +
 drivers/net/wireless/ath/ath12k/qmi.h      |  1 +
 drivers/net/wireless/ath/ath12k/wifi7/hw.c | 84 ++++++++++++++++++++++++++++++
 3 files changed, 86 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index 993aa3f350aa..d87c59f68c12 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -158,6 +158,7 @@ enum ath12k_hw_rev {
 	ATH12K_HW_IPQ5332_HW10,
 	ATH12K_HW_QCC2072_HW10,
 	ATH12K_HW_IPQ5424_HW10,
+	ATH12K_HW_QCN6432_HW10,
 };
 
 #define ATH12K_IRQ_NUM_MAX 57
diff --git a/drivers/net/wireless/ath/ath12k/qmi.h b/drivers/net/wireless/ath/ath12k/qmi.h
index 1b1c88906f1e..60d5811b1c87 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.h
+++ b/drivers/net/wireless/ath/ath12k/qmi.h
@@ -20,6 +20,7 @@
 
 #define ATH12K_QMI_WLFW_SERVICE_INS_ID_V01_QCN9274	0x07
 #define ATH12K_QMI_WLFW_SERVICE_INS_ID_V01_IPQ5332	0x2
+#define ATH12K_QMI_WLFW_SERVICE_INS_ID_V01_QCN6432	0x60
 #define ATH12K_QMI_WLANFW_MAX_TIMESTAMP_LEN_V01	32
 #define ATH12K_QMI_RESP_LEN_MAX			8192
 #define ATH12K_QMI_WLANFW_MAX_NUM_MEM_SEG_V01	52
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hw.c b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
index aec7c652808c..f57adb2107df 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hw.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
@@ -901,6 +901,90 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 			.max_client_dbs_sbs = 128,
 		},
 
+		.host_alloc_ml_id = true,
+	},
+	{
+		.name = "qcn6432 hw1.0",
+		.hw_rev = ATH12K_HW_QCN6432_HW10,
+		.fw = {
+			.dir = "QCN6432/hw1.0",
+			.board_size = 256 * 1024,
+			.cal_offset = 128 * 1024,
+			.m3_loader = ath12k_m3_fw_loader_remoteproc,
+			.download_aux_ucode = false,
+		},
+		.max_radios = 1,
+		.single_pdev_only = false,
+		.qmi_service_ins_id = ATH12K_QMI_WLFW_SERVICE_INS_ID_V01_QCN6432,
+		.internal_sleep_clock = false,
+
+		.hw_ops = &qcn9274_ops,
+		.ring_mask = &ath12k_wifi7_hw_ring_mask_ipq5332,
+
+		.host_ce_config = ath12k_wifi7_host_ce_config_ipq5332,
+		.ce_count = 12,
+		.target_ce_config = ath12k_wifi7_target_ce_config_wlan_ipq5332,
+		.target_ce_count = 12,
+		.svc_to_ce_map = ath12k_wifi7_target_service_to_ce_map_wlan_ipq5332,
+		.svc_to_ce_map_len = 18,
+
+		.rxdma1_enable = true,
+		.num_rxdma_per_pdev = 1,
+		.num_rxdma_dst_ring = 0,
+		.rx_mac_buf_ring = false,
+		.vdev_start_delay = false,
+
+		.interface_modes = BIT(NL80211_IFTYPE_STATION) |
+				   BIT(NL80211_IFTYPE_AP) |
+				   BIT(NL80211_IFTYPE_MESH_POINT) |
+				   BIT(NL80211_IFTYPE_AP_VLAN),
+		.supports_monitor = true,
+		.supports_cong_ctrl_max_msdus = true,
+
+		.idle_ps = false,
+		.download_calib = true,
+		.supports_suspend = false,
+		.tcl_ring_retry = true,
+		.reoq_lut_support = false,
+		.supports_shadow_regs = false,
+
+		.num_tcl_banks = 48,
+		.max_tx_ring = 4,
+		.mhi_config = NULL,
+		.wmi_init = &ath12k_wifi7_wmi_init_qcn9274,
+
+		.qmi_cnss_feature_bitmap = BIT(CNSS_QDSS_CFG_MISS_V01),
+
+		.rfkill_pin = 0,
+		.rfkill_cfg = 0,
+		.rfkill_on_level = 0,
+
+		.rddm_size = 0,
+
+		.def_num_link = 0,
+		.max_mlo_peer = 256,
+
+		.otp_board_id_register = 0,
+
+		.supports_sta_ps = false,
+
+		.acpi_guid = NULL,
+		.supports_dynamic_smps_6ghz = false,
+		.iova_mask = 0,
+		.supports_aspm = false,
+
+		.ce_ie_addr = NULL,
+		.ce_remap = NULL,
+		.bdf_addr_offset = 0,
+
+		.current_cc_support = false,
+		.dp_primary_link_only = true,
+		.client = {
+			.max_client_single = 256,
+			.max_client_dbs = 128,
+			.max_client_dbs_sbs = 128,
+		},
+
 		.host_alloc_ml_id = true,
 	},
 };

-- 
2.34.1

