Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E649F370ACC
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791812023; cv=none; b=b72g1pYzk7aRI69HrKrzkHZAnDOEkp3lDxrenrhnvphExjLSYtBZ5sMOdxWVpMj9mMFlOQzphL/N909HaE/j5OIq/LWelb6QZc/2xJ/41ZS7/SDVujURIZv4/y92fMYtolFtQIvlovMTdUTfqXYb6z6UvVAgwASOM7p6+GUceVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791812023; c=relaxed/simple;
	bh=h3HqO/EQ10TRsKPBF9MHcUSLyx7ODIw0G7joaiG2838=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BtUee3PCdoeXDEEdNzHmy02bVXBwPLKsIkneUEZ4Dl1kVkmYxcLHyTGGM9cvQJ0O5JU/LfLoqpqvNV9d202yfoNzIwH7jslSFFEK+YbFYwJy6h5s3YmQTX86Ipj3DfKcfOl5tOcqdIkG6UWe2UNSPWRRIrGQ3Wz0P3uu3Sp9TFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D+Hr+UQD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ggFqZ2ll; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D+Hr+UQD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ggFqZ2ll"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC0GY73292450
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:33:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nqvWxQWmUv2zJ6ZFnYqwngz9V/6SjlL9w6dmGrY4XIc=; b=D+Hr+UQDCHFw5PZ1
	1P/OZMZOjbJ/smVoPLqbBQVfG/i0BKf6sNe2DuG8tved9s6AS3NmAMTSuwWBEC/4
	4YMglO7zD0KDg1XxrCQc+BVbyDJgRVmOiqiIVxMxllh+Obv0YKaulOGOqlpnS/Qe
	HZBs+5nnGAmr6eHS3+xqQybmSj1NaGvNcuX1Lc58f6hWcWW0BMqlkEZOeS5Cycxe
	/hfuogYGhdqdRRdBoXx9j25IhACdN3HvwSO0IKoauj8LDO9amgWFua4OjYptvSvw
	UjZ4+CmnUOJ/CHm1RK+hTAVKh88rUjvX9DzWwh4/PQbU7nuGc3QCO980bHAkl1ji
	tYQOAA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8uh3hhqk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:33:41 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-341eff9e381so5650017eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 06:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791812020; x=1792416820; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nqvWxQWmUv2zJ6ZFnYqwngz9V/6SjlL9w6dmGrY4XIc=;
        b=ggFqZ2llgQSSgdKpW4adb7rHATDyEXNuarwuh9/daW0g7VKvm7KNLqo54ZTIPFDKbL
         Rg/+GJslRTPdTUGIuJfg4f/+x2jVUjGI0s+sCGVBZrc6HQ0qA//bUwvrXRVC14VQkZwH
         EYYo7an0slAuaEIvNsgscDaOUb0WEMFVM7nhVk+RG0Qa2/CvfFYQ3D3KyHVwJqYzdVLY
         dSvrPSSdNDZ1aP7J0r3Juk5kVY1wcHo32UsjPJQGUBY5Hl2LvHF+vjRN26xAl1Dt0/Fs
         F+v2Wr+0tzyfUit/dg+LRc/eT9rRtRb8CHoM056JR1qUt5CgEWgZLhlRn68wgX5eDYEK
         Uepw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791812020; x=1792416820;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nqvWxQWmUv2zJ6ZFnYqwngz9V/6SjlL9w6dmGrY4XIc=;
        b=N8twamdqZwpmJLmbb/80TqqY74DWB6cm/OWlkdhouypfYfygzWxG+rh0EYJP4B5FRi
         SIo7f02aIFR8Sk4jxjReuxhktrpD7uq//dN3kkG61jrP8JZ3TsM7OabDonVTxttEDuXF
         TNbOesSsynkZCcmeAZsasVnHk8RJ0sV5Hw1UPppCWILA+WKmWQWyDqMVtMM9ESmqkS3W
         /VnvX9hOdRRVjj+eHFmMMPmptANUe9nENngkTZKIwvWRtvvdyCphnk29NHdZylErmN5w
         x3Byjn24b+rHImdCm5JgAWW0Q5TUoZ7K7O8BYcb6QcOYBpsCFtAMEtFfuYWQDYS6ri6P
         yWiA==
X-Forwarded-Encrypted: i=1; AKwUvBy9xGsUwhfDRxivVUztx5nRwolY6IZY61BXFstf9L6S/qFLJQ6h4LbOEO1aNpbUjQ8xHVcdwkCvj0cebYs=@vger.kernel.org
X-Gm-Message-State: AFq9FYK8vQ9PlW/EBs9SdrohxpCKYi2O5vOKmp3XI5cW2beRxgEuu1S4
	IfThIP8RmusZpA9u4X7OY1Fa2JhMK7QNAZZGqUSY5BS6os8aD6qqaCh7nyyApzpXij/1wLuyMte
	bH9T0ieM7Lr8CB4TEuogopZ9W6a5RwFxjQYJDHGrnCMHJfoSwNq2PRSwEQdBE0xyYsIw=
X-Gm-Gg: AYBFou0ysDVqQ539paylyhJBwK2xD69SZGne2dZrGeHiuK0mrxa9sNKGasnFqCzkkiD
	N+KLzd0lkcjH8lGx7ZQqhI39M9eZ7TE8FAMyk62OQ6ftWWTu7B7jDeyICedyqTpv6CB7473+Qsf
	EtXuL5Pr5I8ggnrVVR/xAbDFjqUCMqXOsEpQ37tgfCiot2pRKgeA26/uDrcLsz8/Krf7vd7xrJg
	iGo3MlQ3X2iKh/74XrKTnAfEY6/yDHF0H1mwD9TgrFl8em/S+ot7bv0Y7q66JuI73JunMLRYNh9
	P2DGbLRorR3FNKYkr2E9mbeTntT70Lq0V57MQHlaRtPX7OeWDAwtIBtNHZKOGyxRGD5TFWkvxYw
	HpRsW2z2lVS/QJC2bUPikrARUnRc=
X-Received: by 2002:a05:693c:895b:20b0:35a:7010:e7e with SMTP id 5a478bee46e88-35a7010129bmr4364174eec.10.1791812020185;
        Mon, 12 Oct 2026 06:33:40 -0700 (PDT)
X-Received: by 2002:a05:693c:895b:20b0:35a:7010:e7e with SMTP id 5a478bee46e88-35a7010129bmr4364139eec.10.1791812019593;
        Mon, 12 Oct 2026 06:33:39 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca1b556sm44740397eec.9.2026.10.12.06.33.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 06:33:39 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 19:02:17 +0530
Subject: [PATCH v2 07/13] phy: qcom: edp: Add Nord-specific register
 offsets
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-nord-drv-dt-v2-7-a2ab9af954d2@oss.qualcomm.com>
References: <20261012-nord-drv-dt-v2-0-a2ab9af954d2@oss.qualcomm.com>
In-Reply-To: <20261012-nord-drv-dt-v2-0-a2ab9af954d2@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791811948; l=2115;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=c/c4UrdKyLlxloOv0LlIJQUlth4rww+DxB4ild3JaGI=;
 b=kc3eX6lPE6whC9wQAkDtJNxIJhgIawVZOCerNkpQNd6HZGm4loYUzs011lrQvvzYbEgHT6xlF
 0zE9L0dbJi3CQQpCyAgx+ISicnD06hEAF2qQQosv/ETD2q1KD2Xfbir
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA1MyBTYWx0ZWRfX4XlAhNFF6XIu
 1RIUpxluEHZ8UgfWWnmzEGctl6un3PC1fd0fvsHj4JJABEEBRVCxEvdI4yDjylEBuDJANnMeJBr
 EgY1rK6289vIz/1JbV/Vs3Qhc0tvKH1C5cM5XvKeri2uFChTU5rta69VaawV+lLF+sc14FCMGTm
 GnS1HlqTch7+jZAq3vqvCRjF9x8xySmcCeqPiBaPc1pg5G4gB/wKMtq0PNR/BKwFiG4jSLnhTgi
 +qHCBWE4M8NWfOERlKPs3FoT2hLGE+uTGE/dMdfnjl2emlfWLtrYy19kPyvvJhFdj36lVjsHXWr
 cJmhJxGosOn/jjc89xjiZx7Y3Xd+5SSYEyz6IJvFJFsQVXlQmBsBM/jV9WGJaU5cavXIyzDchs7
 W6FYmTkOhpEFk0lJe/pqbbTsfefbR4gxpFbVXrDjDHneJyfdHNc5dDUWOyFjATjjk4Z0dRKzFZg
 wqb3tB0WV9y5t2n9C9Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA1MyBTYWx0ZWRfX8UKS+7MXmad3
 LZMEhA4uekFR735stp772/ouVownPKuCXP/lb8TL//AKL680wjJoAA6kRJDXBk2jmDF3zh2El8L
 d2w4JrPRmMFu/IqeC3iY15Mg6/CaoMs=
X-Authority-Analysis: v=2.4 cv=QO391QLL c=1 sm=1 tr=0 ts=6acce1b5 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=wv6mueO1Yvltf2_opTEA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: xAP372VdUm-s-lzCXwC1JgySom-QSgV7
X-Proofpoint-GUID: xAP372VdUm-s-lzCXwC1JgySom-QSgV7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120053

From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>

Nord relocates several DP PHY and QSERDES v8 COM registers relative
to existing SoCs.  Add Nord-specific defines for the relocated and
new-only registers in phy-qcom-qmp-qserdes-dp-com-v8.h and
phy-qcom-edp.c so Nord sequences can reference them by name.

Assisted-by: LLM
Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-edp.c                   | 7 +++++++
 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-dp-com-v8.h | 3 +++
 2 files changed, 10 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
index a3c893f72908..d5c6835b6c70 100644
--- a/drivers/phy/qualcomm/phy-qcom-edp.c
+++ b/drivers/phy/qualcomm/phy-qcom-edp.c
@@ -42,8 +42,15 @@
 #define DP_PHY_VCO_DIV                          0x0074
 #define DP_PHY_TX0_TX1_LANE_CTL                 0x007c
 #define DP_PHY_TX2_TX3_LANE_CTL                 0x00a0
+#define DP_PHY_TX2_TX3_LANE_CTL_NORD            0x00c0
 
 #define DP_PHY_STATUS                           0x00e0
+#define DP_PHY_STATUS_NORD                      0x0110
+#define DP_PHY_LDO_CFG_NORD                     0x00f0
+
+#define DP_PHY_TX_LN0_DRV_LVL_NORD             0x00e4
+#define DP_PHY_TX_LN1_DRV_LVL_NORD             0x00e8
+#define TXn_TX_BAND_NORD                        0x0024
 
 /* LANE_TXn registers */
 #define TXn_CLKBUF_ENABLE                       0x0000
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-dp-com-v8.h b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-dp-com-v8.h
index 93edabb830af..008b17222a8d 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-dp-com-v8.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-dp-com-v8.h
@@ -48,5 +48,8 @@
 #define DP_QSERDES_V8_COM_CLK_FWD_CONFIG_1		0x2f4
 #define DP_QSERDES_V8_COM_CMN_STATUS			0x314
 #define DP_QSERDES_V8_COM_C_READY_STATUS		0x33c
+#define DP_QSERDES_V8_COM_SVS_MODE_CLK_SEL_NORD		0x17c
+#define DP_QSERDES_V8_COM_CMN_STATUS_NORD		0x1d0
+#define DP_QSERDES_V8_COM_C_READY_STATUS_NORD		0x1f8
 
 #endif

-- 
2.34.1

