Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19D1236C0C8
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 03:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792120935; cv=none; b=ZwYgI8yiv1buQbktxJGFYLqo12YOdVNRt4R3Sk4iDwtPYqL5/DFhbg+bYVVpbvAMX+magEUSqJQPLuolHsNcBIbpRFXZ9IiXBpDCi/CZtSotUV5ldvKTj07NULoy9fpIqSfJtejw52um/hlHIYp6ReoZgVdJh0oWb3LPkDMau4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792120935; c=relaxed/simple;
	bh=JOFX2Z8zRPVe/Qn1jsMwiuZo9ZCIJeIaopeipkRwKSw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Go7d7ebVGzT9hBEMkiker8hpsegyo0pvlI49vyHVNUwkkzu6Db4TXqXad57vte1+InB8G6bt+4qZnlR7pOd4/M4Pc/tZgiPJNvAZiXijabsb5v3Z6Bs96WmibE80q860pF70ESRrGTDq4W9jc1D5UoGGHWK8MGnLyUa7CxU3jm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QlWPOELU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PIh8TuhJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QlWPOELU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PIh8TuhJ"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G1kT8B3202390
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 03:22:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Yb6jb8LtpaG9aoBoetLFIOgA/OlOCRhdtmyPDaQ8Ovs=; b=QlWPOELU34KqE/h4
	P8WYzgtlApk3V49VeVe/Ri+7OqNmG92EyV0+9McsJVhZB7SlDzemu9iaLMpj5anT
	9NNA6PNn3QSiFlEdqqL7fg7+ZaVO36gmm0QsM+dvJOqgJNwjF4L+AB/XxmW5TEjB
	BJmFtuGhVstuaTkm4vgEMYQZdRl+DwOFhCNOGcwLzZ9rmuROriGoSw5CjRhk+GYz
	NVqSu+O2dwVqzDXLvrkfc5nIA9SAQSdQqADC4QSNklionLjntOD8Zv4c5wx0/7vq
	9Y0K2nwcEpFOCF+E0CRqgqQVL8FQ3mEboMivwu9JAeTrvhPmfzU21Cmh40qkFf6D
	IHzFkg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb3r39tyc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 03:22:13 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-35a04491c56so572268eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 20:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792120932; x=1792725732; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yb6jb8LtpaG9aoBoetLFIOgA/OlOCRhdtmyPDaQ8Ovs=;
        b=PIh8TuhJYT2gwfpECJ6WVBuUtzWZExeJyqVSbEDniDstbVdmuO77azPfZhzlas9NNJ
         0JR+sNQhdaoboeuVpaZz9IOX3eSzhvu0vkqYF6vOyiTf7YldhjB7KOJX3xh+LuyWRM67
         bMWs3uiNqQUGRCs44isZUpCFtjzjNFMbkPqP/BNBF6c4164DpXQbEVs/NhQvmbx63e0u
         mWkkHuz9WADAFgBQjIIeBBT4sR/4xGehaqott22sEw/Ky/TICPqMh1Yjdd2iFZPAuLuh
         AQvC6C/yuI9taZjiAb47aLa+3gwu5wiTxPl9vhw9DmXFdpSwZWI4Xz3RakR/b2z7aLmI
         vJ0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792120932; x=1792725732;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yb6jb8LtpaG9aoBoetLFIOgA/OlOCRhdtmyPDaQ8Ovs=;
        b=EA9EE0kohDPKHLTjAV4eXAVkU/XMxJBZoVh/jrmCvkhsXceu0mtoUsGn2HFqEvbaUG
         JJs65PgubmJLC7XzXVLFPuaIhxCT/ctjBzA4cuDdzjo4Yk7wbQJCDME/OdGdgXEN1plz
         Di8c/Rea9o22P6kLXomXOuTafVK9/lDwRRIM68wXPiPKsQsyM8xFFcDzplECp7fMzi4f
         2Cfn1ccvz0iYF1EpZJGNt9KsQSfZ8wKQ2tEgqEPONrlQwSeEGYAnaZ3CDEEAFQ+dHDg5
         3hYBLqImGoDjsRBeEhH9isPCMCPBH3HNm6hJaRe8lgi2ubeCQD82VWN18qXI461rP9Tk
         la5w==
X-Forwarded-Encrypted: i=1; AKwUvBz2hHrUgPkve6syWDs+5UjpZdEMLzKh501rJ/LlCw4FdJ5oPqCqmClen3LYDQ3e7qNDo3lqWzcxNM3AD1U=@vger.kernel.org
X-Gm-Message-State: AFq9FYLKZ/PurPLHEPnb1Abj5ALpxoPNeaOfQnCWJvvwl03ZMCFF/fi3
	5XZuF9w6XYZ4LCbwgIJBA0cl56Cjz+Wi1BQqNzL69+9+QSFwL8GKAIyj4JZljJIHLMR03H61cyG
	K3ed/PDLQSh2ttmcgAp41Edu9X9hBgTmQohelcKAYmWmWsPomvZTfWVN0REZ+1lZKO+0=
X-Gm-Gg: AYBFou3wk9JSgYJ2pveFIxUGq+V+nEReR2V+ycLwprsIYUkTUR1ftoW2bWfsm2pzP8j
	jCq2/jzGTYp3129KQ1TWX4U+YkrsVk0PBIhbAfvQHGdslUHN35+e5zjmsUglFysMmFZdysKdM0t
	lfgcFBboVi+B45Ve5Ghyw2PWa3+T3uw7blke+sjnAle867UeRWW61boO7zx/3BgPpZO9S+Apbpb
	91yEIpv0oN9Tr3xa5xCnIKJbb4Iz8LKT/athYKwmme/j7lE2PrOj7ih3nfiqW16cIFnjpIbOOzQ
	9cAySIRGpzW13FpSEZT8EdMLBfwzU6A/n6gNxnaAp8z/0TgH/Ze2tDaU3GVpUCfHedG4VABu9Es
	6h9rWsIx4aVvLiHUTpDMBSKlDO3auJs5mlHwjSRArHAlQX22eHp+qIfrfJfC7g9jp7w5kKdvAfE
	w8cn0WbJkHDHYOJjyxsiucJA==
X-Received: by 2002:a05:7301:6198:b0:35a:e354:643f with SMTP id 5a478bee46e88-3602a780f07mr2413098eec.4.1792120932425;
        Thu, 15 Oct 2026 20:22:12 -0700 (PDT)
X-Received: by 2002:a05:7301:6198:b0:35a:e354:643f with SMTP id 5a478bee46e88-3602a780f07mr2413070eec.4.1792120931904;
        Thu, 15 Oct 2026 20:22:11 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360819be413sm2256698eec.13.2026.10.15.20.22.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 20:22:11 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 08:51:42 +0530
Subject: [PATCH ath-next v2 05/17] wifi: ath12k: add hardware registers for
 QCN6432
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-mpp-bringup-v2-5-f510c33bfcf5@oss.qualcomm.com>
References: <20261016-mpp-bringup-v2-0-f510c33bfcf5@oss.qualcomm.com>
In-Reply-To: <20261016-mpp-bringup-v2-0-f510c33bfcf5@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAxMiBTYWx0ZWRfXxWH7axRgMd97
 NUFgNaygG9q8XUYfqPHt/xdbQdjRFCDh2mv7z15m/vuT4uPf2G7NlMrK+Mf3aLWmD+ZCEoIpXJL
 WsI7OZUEZLpowlTPKAd1zUHnyJqzYM0OVWRG4F4TlBWJxb7tJMDiltiKAeBgTIb5+OURMI+tkxA
 dK0Q4CbAgLV3w1UQfUiHyGzjSyZDDYn4evwJD9FE0U95gPi+koZcPAyocs3+BED2yQwbjJkvxkR
 Icc1P5o0VOws6PKouQYjGDWduEPJZbi5Mt/nKxZjXZeVqvmGZNRa7kA6Aokv/yhyZYzmCDM6Dwe
 CGJ9QVf/4dyrmfHFMbJqbq+doFBbB6tLjDHkU0yJ2UNqrA7livCcxUfapJmTGV6ipA8J3vdTmbQ
 ZPL7wwDfHSxkq7kVxHieYlQspjspA0u5gCYUTRP74JU//6IQVg+q6jwO6+enwB08jBDBxhIDMr/
 97rceAj41U7NERgXqJQ==
X-Proofpoint-GUID: bAKPYypcjxBSp8qftSuiciOdyGAhWDBs
X-Proofpoint-ORIG-GUID: bAKPYypcjxBSp8qftSuiciOdyGAhWDBs
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAxMiBTYWx0ZWRfX1oX6tP2RGbwQ
 mDYjbawtvXkQLhowYCIXXuo5wfi8TXaoHHsbobWb+wCwkCFl6co7PYxLWo6CwKP2J9UJRArYq+w
 Y5sMn1Am2l5aBqD01/Udrve9jw/m4Tw=
X-Authority-Analysis: v=2.4 cv=INGXmQvG c=1 sm=1 tr=0 ts=6ad19865 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=4ETC605TzGOYwJmJ72kA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160012

From: Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>

Add hardware registers and populate the hw_regs field in
ath12k_wifi7_hw_ver_map for QCN6432.

Also populate the HAL operations, HAL descriptor size, and HAL parameters
using the same values as QCN9274.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01322-QCAHKSWPL_SILICONZ-1
Tested-on: QCN6432 hw1.0 AHB WLAN.WBE.1.6-01322-QCAHKSWPL_SILICONZ-1

Signed-off-by: Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>
Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/wifi7/hal.c        |  7 ++
 .../net/wireless/ath/ath12k/wifi7/hal_qcn9274.c    | 85 ++++++++++++++++++++++
 .../net/wireless/ath/ath12k/wifi7/hal_qcn9274.h    |  1 +
 3 files changed, 93 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hal.c b/drivers/net/wireless/ath/ath12k/wifi7/hal.c
index a0a1902fb491..7c468159085f 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hal.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hal.c
@@ -57,6 +57,13 @@ static const struct ath12k_hw_version_map ath12k_wifi7_hw_ver_map[] = {
 		.hal_params = &ath12k_hw_hal_params_ipq5332,
 		.hw_regs = &ipq5424_regs,
 	},
+	[ATH12K_HW_QCN6432_HW10] = {
+		.hal_ops = &hal_qcn9274_ops,
+		.hal_desc_sz = sizeof(struct hal_rx_desc_qcn9274_compact),
+		.tcl_to_wbm_rbm_map = ath12k_hal_tcl_to_wbm_rbm_map_qcn9274,
+		.hal_params = &ath12k_hw_hal_params_ipq5332,
+		.hw_regs = &qcn6432_regs,
+	},
 };
 
 int ath12k_wifi7_hal_init(struct ath12k_base *ab)
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.c b/drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.c
index 052b59265af8..34f6be922479 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.c
@@ -572,6 +572,91 @@ const struct ath12k_hw_regs ipq5424_regs = {
 		HAL_IPQ5424_CE_WFSS_REG_BASE,
 };
 
+const struct ath12k_hw_regs qcn6432_regs = {
+	/* SW2TCL(x) R0 ring configuration address */
+	.tcl1_ring_id = 0x00000918,
+	.tcl1_ring_misc = 0x00000920,
+	.tcl1_ring_tp_addr_lsb = 0x0000092c,
+	.tcl1_ring_tp_addr_msb = 0x00000930,
+	.tcl1_ring_consumer_int_setup_ix0 = 0x00000940,
+	.tcl1_ring_consumer_int_setup_ix1 = 0x00000944,
+	.tcl1_ring_msi1_base_lsb = 0x00000958,
+	.tcl1_ring_msi1_base_msb = 0x0000095c,
+	.tcl1_ring_base_lsb = 0x00000910,
+	.tcl1_ring_base_msb = 0x00000914,
+	.tcl1_ring_msi1_data = 0x00000960,
+	.tcl2_ring_base_lsb = 0x00000988,
+	.tcl_ring_base_lsb = 0x00000b68,
+
+	/* TCL STATUS ring address */
+	.tcl_status_ring_base_lsb = 0x00000d48,
+
+	/* REO DEST ring address */
+	.reo2_ring_base = 0x00000578,
+	.reo1_misc_ctrl_addr = 0x00000b9c,
+	.reo1_sw_cookie_cfg0 = 0x0000006c,
+	.reo1_sw_cookie_cfg1 = 0x00000070,
+	.reo1_qdesc_lut_base0 = 0x00000074,
+	.reo1_qdesc_lut_base1 = 0x00000078,
+	.reo1_ring_base_lsb = 0x00000500,
+	.reo1_ring_base_msb = 0x00000504,
+	.reo1_ring_id = 0x00000508,
+	.reo1_ring_misc = 0x00000510,
+	.reo1_ring_hp_addr_lsb = 0x00000514,
+	.reo1_ring_hp_addr_msb = 0x00000518,
+	.reo1_ring_producer_int_setup = 0x00000524,
+	.reo1_ring_msi1_base_lsb = 0x00000548,
+	.reo1_ring_msi1_base_msb = 0x0000054c,
+	.reo1_ring_msi1_data = 0x00000550,
+	.reo1_aging_thres_ix0 = 0x00000b28,
+	.reo1_aging_thres_ix1 = 0x00000b2c,
+	.reo1_aging_thres_ix2 = 0x00000b30,
+	.reo1_aging_thres_ix3 = 0x00000b34,
+
+	/* REO Exception ring address */
+	.reo2_sw0_ring_base = 0x000008c0,
+
+	/* REO Reinject ring address */
+	.sw2reo_ring_base = 0x00000320,
+	.sw2reo1_ring_base = 0x00000398,
+
+	/* REO cmd ring address */
+	.reo_cmd_ring_base = 0x000002a8,
+
+	/* REO status ring address */
+	.reo_status_ring_base = 0x00000aa0,
+
+	/* WBM idle link ring address */
+	.wbm_idle_ring_base_lsb = 0x00000d3c,
+	.wbm_idle_ring_misc_addr = 0x00000d4c,
+	.wbm_r0_idle_list_cntl_addr = 0x00000240,
+	.wbm_r0_idle_list_size_addr = 0x00000244,
+	.wbm_scattered_ring_base_lsb = 0x00000250,
+	.wbm_scattered_ring_base_msb = 0x00000254,
+	.wbm_scattered_desc_head_info_ix0 = 0x00000260,
+	.wbm_scattered_desc_head_info_ix1 = 0x00000264,
+	.wbm_scattered_desc_tail_info_ix0 = 0x00000270,
+	.wbm_scattered_desc_tail_info_ix1 = 0x00000274,
+	.wbm_scattered_desc_ptr_hp_addr = 0x0000027c,
+
+	/* SW2WBM release ring address */
+	.wbm_sw_release_ring_base_lsb = 0x0000037c,
+
+	/* WBM2SW release ring address */
+	.wbm0_release_ring_base_lsb = 0x00000e08,
+	.wbm1_release_ring_base_lsb = 0x00000e80,
+
+	/* PCIe base address */
+	.pcie_qserdes_sysclk_en_sel = 0x01e0c0a8,
+	.pcie_pcs_osc_dtct_config_base = 0x01e0d45c,
+
+	/* CE base address */
+	.umac_ce0_src_reg_base = 0x01b80000,
+	.umac_ce0_dest_reg_base = 0x01b81000,
+	.umac_ce1_src_reg_base = 0x01b82000,
+	.umac_ce1_dest_reg_base = 0x01b83000,
+};
+
 static inline
 bool ath12k_hal_rx_desc_get_first_msdu_qcn9274(struct hal_rx_desc *desc)
 {
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.h b/drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.h
index 03cf3792d523..5c593773109d 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.h
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.h
@@ -18,6 +18,7 @@ extern const struct ath12k_hw_regs qcn9274_v1_regs;
 extern const struct ath12k_hw_regs qcn9274_v2_regs;
 extern const struct ath12k_hw_regs ipq5332_regs;
 extern const struct ath12k_hw_regs ipq5424_regs;
+extern const struct ath12k_hw_regs qcn6432_regs;
 extern const struct ath12k_hal_tcl_to_wbm_rbm_map
 ath12k_hal_tcl_to_wbm_rbm_map_qcn9274[DP_TCL_NUM_RING_MAX];
 extern const struct ath12k_hw_hal_params ath12k_hw_hal_params_qcn9274;

-- 
2.34.1

