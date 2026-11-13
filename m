Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794548058;
	b=KDDLAdzu6LRMCQeIFVgtGf/38vmhE7qMuhBrLYqM9oh1yLyr+i9lBkUXMrUrr2j7OTOC
	 O6W3/RWiq3Jvjgbll2MUxqbDY69Jb1M0ZQAmU+Pl0dQRIqFEksA6kf+YKVaRPmDX4EK5n
	 WC76boZzo1MYmvGv+KsArs3/g4yJCtayi9RAlH1UwdWyUIuaUDBZijstPRcEdd+ipaAk1
	 zcopksI4rI03xR6YyB6ZPVGRJJkCtkWzez1MD4PKYpiVlxPLPdc8t6zGwQPuRgE9p9YMw
	 gHTPrqoPhKcM8s6UxKIyEh6szQ3q6H9H4Oti6DKWaRa4rYdYr8OxlTLSmneMw3zOquA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794548058;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=UfrUK9hOt/DD1qcO1l/6d1YSHtiPjQ/MWdwV6QWZlzc=;
	b=KCFu3qhCx0F7O+71qFKI8946dcFsw6aanLx+E5Zt8z9dptG+FTofgRx8eLVHJ7x9gfP8
	 uPf/vdb7o+fvIFr7F83eVOq6MQk+TGwtzGkCW/Qfb2fUBR7821IzdYIqWwLAfuOumSU0f
	 8KqkxWXif8Fwqcv/z1rVK0+r7NOKYQx5R+8UfdllxhFl/VdH1grCkdLr1mch4DAvpgMj0
	 803Lk6Lc7PsYjqVkUA+lsA5ily6vX4i15NgnM/XxKdwJy7scs/xb/3Fy2pxfcvKckUSoS
	 egAl58VEz8V1WA94ywewylx1SvTduH6AzyPPIxqenbhPdmeswirGEMDsDNaqL32j2KQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fHIbw81i;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iJ+jc3Tb;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05E91606AD5A
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 05:34:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05E91606AD5A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fHIbw81i;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iJ+jc3Tb
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD57EC73616117
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 05:34:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UfrUK9hOt/DD1qcO1l/6d1YSHtiPjQ/MWdwV6QWZlzc=; b=fHIbw81iwMhQy2it
	bkd/wHAssj89DQsLXxInoFda+J1uKkHWuAQD3YZEMUhMyP6HTdHH6+KRm9mawS1K
	xXU/K3I6wCg5tEv6Wc1EE/HVVxiHttTnaHS0j7nDEUkKsdxjvuen2fnKimPU14Or
	trhwUnsS0G8FQehA+zUA6CifYZATIGYw7UjhSNkbx7WlFScvKc5/7bIPve9gH+DN
	m5D4dP3TYoLB4g8sUiDfL4aT8cEZlK0yAd/Qdr0MvCVn4Xw0453ImJ8gX6Ok75UK
	2NKYlofY02mL7xSbNsuB8viddD45e7GGsoxTcTk/SbPWgGLRYLfTHKh4r9rVxmWI
	PFTYMg==
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwh0aja59-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 05:34:17 +0000 (GMT)
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-4ad9bc6aa91so802633fac.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 21:34:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794548056; x=1795152856; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UfrUK9hOt/DD1qcO1l/6d1YSHtiPjQ/MWdwV6QWZlzc=;
        b=iJ+jc3TbUwID+IqbZx5yMPcSYQC3XHH7UvFN1irgxNrooTaR20sYEpstUI4FTDL5Vb
         p5Acl7t3G0Dt8kAMirtsRw7IHRahtH+/PgDEFehjgnQGiUx+/4PWrKfUBTTtmmm2lijq
         UfGpvhbLM3JQtBSWxeBGAvZporkFU72ZbxPYlEzgl9MBKG0ExasEI82yyG5Y3fJA7K2B
         lBvLYYThornZTmTUT6TLMG3Lg7c6ahR2h8KYJHEN6hs6uFmrJNRoY1LiB7H2y1qtmOV+
         4c4vLMSkAudL1PzAuFqhO0xZCq99cwPWnuvaLSbVNs78BjeiS2I9+Rkvd461P9BanQho
         0eYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794548056; x=1795152856;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UfrUK9hOt/DD1qcO1l/6d1YSHtiPjQ/MWdwV6QWZlzc=;
        b=jtmmUW7bmNJ9o+DWqywXGpnkHRdfyu3KJj/YZYsECfJgf3tAL8NpegNenhXJygGnqg
         UH0fmAs+0Yf5brP/PBLYR5kEIALfSxM2EO33maEo6U5yZVi/TQKljH9B6I/nRwz4zXRy
         U0U1RgZcWaDSOZnhnA6+UaN1HpUTG1T+8BIAutCKJyafYkgLT/1iXic2mtHjDTA7wvtx
         XXAkut+DaEtfo+npYNKhma6MQa4kdBZlo9cjuS/AORhkuwwNGbEYIHLAMbWWpxs0mlXZ
         AdWPi7jU4+SZlycUKq8NCPNmS4RzVOZiDo7hbvinMskeIafnTqq9NgTMourJVdWpIY5i
         4fsQ==
X-Forwarded-Encrypted: i=1; AL+hErEaKU9xwmrXPN9xdSrIY7m4Cu7myPQ6VHCerrAZ7e0/lqsO0wleKfgeyiw7R34eTvOIn1Q+S5V2i0e+QDc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8nN+imkOu88GREfAr5tSbqEnY6g3RySE8JeBMKGREZ0n/lRpUB
	XVjmv4T2SxB0CvPMwTXJDN9tvrPsx48K/jESxUrmxKKnuem2rnuFSovilpMGC7cZwsCPsSm30Ll
	OhK8bjEa4hNqc/TBzSgidKuWY0g2fyv9RdoT6t9HXOrU1dfZ9YTL5rQd2CWIfZm8VLg4=
X-Gm-Gg: AYBFou2zxcboNb9q4jApVVaOwyPden7hU5CbdcpnakeJnribrlDYKjFM1Zk2T69FXs6
	XqZJ4gsojrwCqzvm3w3bVCrK+qvO0DMs/06LucbAPh0uDaGC1haonvh+8sIlBZzdJrDgBMxhIV6
	odt+HcbfRBJZMAUjL25Y8Th1Ix9uu1pxlOoSHExAEnxhmD/1cV40Hl//VLNWstvN8SV2XmtjCLG
	clIxu0ZfM7QK+Z9i2ql/sGIELte7YwNVfQeSQxLZ4QM+Vti0l14Yoz/XWf+3HBXOrnRh4DUCG+K
	gxnTHX1pRQX+Almuu1PBTl6sn0dNHv7FZ06aQWT49w7CDN1yIlnvKEdvF0WJ5p5BEgjy2BtXUF2
	qJi1xTrfmoHh2K6JBioU25JBpGj9xtkuLOkh/KP4JtFJVqlQWueMLM3V8GN1VDNWMLa+RoQ00+L
	jJNrCYwV5WI2SAabhKJQqiza+0UXcSiQE9g0RZXUqKkv/LIpAfu0og1SItRkAv
X-Received: by 2002:a05:6870:21cc:b0:4a8:b12:79f9 with SMTP id 586e51a60fabf-4afdf480625mr1611286fac.46.1794548056313;
        Thu, 12 Nov 2026 21:34:16 -0800 (PST)
X-Received: by 2002:a05:6870:21cc:b0:4a8:b12:79f9 with SMTP id 586e51a60fabf-4afdf480625mr1611273fac.46.1794548055893;
        Thu, 12 Nov 2026 21:34:15 -0800 (PST)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4afe22576bfsm803252fac.7.2026.11.12.21.34.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 21:34:15 -0800 (PST)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 21:33:43 -0800
Subject: [PATCH v25 11/15] media: qcom: camss: tpg: Add support for v2.4.0
 TPG
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261112-kaanapali-camss-v25-11-1d709f57f370@oss.qualcomm.com>
References: <20261112-kaanapali-camss-v25-0-1d709f57f370@oss.qualcomm.com>
In-Reply-To: <20261112-kaanapali-camss-v25-0-1d709f57f370@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.16.1-dev-17221
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAyMSBTYWx0ZWRfXylefnnomnMX/
 pPNORitr7N8coHdzsp9WcjbD9dws4O6YmbA0hjJ6TWvRQUMn+bYPYuSQQ6wf4P7EV7SHrR+oCKZ
 VhE2MdAtHzrZdRMA/2hF61awnL2jIpc=
X-Proofpoint-GUID: R6OtG5pR6fHVfWFUx_-Ya7Y9zaXLlIP8
X-Authority-Analysis: v=2.4 cv=N+e8hG9B c=1 sm=1 tr=0 ts=6af6a159 cx=c_pps
 a=zPxD6eHSjdtQ/OcAcrOFGw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=E31TOhX9jficEpHhqf0A:9 a=QEXdDO2ut3YA:10
 a=y8BKWJGFn5sdPF1Y92-H:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAyMSBTYWx0ZWRfXzflCTH+Bh95a
 pNgtXNTcnPmTdaZYJIECGwXNG7QF4IEjH3eFhpYw/GqyxVRcLhsOuIcFdYYNBd/nhIXcuDEfQVy
 yHh3snnA2zJAIbqX2XjbNql3gXRJHkdNzZ40Aslfa65mwvfz2Pp8sg38T/jKHkdqNGk+c0e8uuv
 Bt7ISdtwAlO0bGVrcGjeHjmEw98Hw8w/AVxQIj08M00ruUydQvrmCcbMdZE1nHcxXkuIxxgNorQ
 HpqFXDndpT7iU/VZ7jDS/2Z8iX2/J5dXj/+DAMqFpdeTMzX/8l03M8b8C0TM9zvk4szRSzmUv/O
 YblqRwPOeU68AzSwYYQ5TLdBswuiX+L6AFrqBXyxvcg/yME4pg0euln8mEcaApfJAQ0bC9SLqST
 4VQMB2vPLZbu+f3sOBVIC3Pz8xCSkDYl1axvh3/KJMAL1pzEUvR44+/RWcD7D74VISVjbhik3OO
 jyTMSko77ae/Tw1ou1w==
X-Proofpoint-ORIG-GUID: R6OtG5pR6fHVfWFUx_-Ya7Y9zaXLlIP8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 bulkscore=0 priorityscore=1501
 phishscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130021

Add support for the TPG found on Kaanapali. This TPG uses hardware
version 2.4.0, which drives test-enable and reset through the
TPG_CTRL_CMD register at offset 0x1f4 instead of the TEST_EN bit in
TPG_CTRL and the TPG_CLEAR register. Its output is routed into the
CSID 1080 RX through the CSI2 TPG mux, so the CSID selects the TPG as
the data source when a test pattern is selected. Read the hardware
version before resetting, because the reset sequence depends on it.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 .../media/platform/qcom/camss/camss-csid-1080.c    | 15 ++++++++++++--
 drivers/media/platform/qcom/camss/camss-tpg-gen1.c | 23 ++++++++++++++++------
 drivers/media/platform/qcom/camss/camss-tpg.c      |  4 ++--
 3 files changed, 32 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-1080.c b/drivers/media/platform/qcom/camss/camss-csid-1080.c
index 3d90d31201fa..ec56ba85a0fa 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-1080.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-1080.c
@@ -64,6 +64,8 @@
 #define		CSI2_RX_CFG0_NUM_ACTIVE_LANES		0
 #define		CSI2_RX_CFG0_DL0_INPUT_SEL		4
 #define		CSI2_RX_CFG0_PHY_NUM_SEL		20
+#define		CSI2_RX_CFG0_TPG_MUX_EN			BIT(27)
+#define		CSI2_RX_CFG0_TPG_MUX_SEL		GENMASK(29, 28)
 #define		CSI2_RX_CFG0_PHY_SEL_BASE_IDX		1
 #define CSID_CSI2_RX_CFG1			0x884
 #define		CSI2_RX_CFG1_ECC_CORRECTION_EN		BIT(0)
@@ -148,6 +150,7 @@ static void __csid_reg_update_clear(struct csid_device *csid, int port_id)
 static void __csid_configure_rx(struct csid_device *csid,
 				struct csid_phy_config *phy)
 {
+	struct camss *camss = csid->camss;
 	u8 lane_cnt = phy->lane_cnt;
 	int val;
 
@@ -156,8 +159,16 @@ static void __csid_configure_rx(struct csid_device *csid,
 
 	val = (lane_cnt - 1) << CSI2_RX_CFG0_NUM_ACTIVE_LANES;
 	val |= phy->lane_assign << CSI2_RX_CFG0_DL0_INPUT_SEL;
-	val |= (phy->csiphy_id + CSI2_RX_CFG0_PHY_SEL_BASE_IDX)
-	       << CSI2_RX_CFG0_PHY_NUM_SEL;
+
+	if (camss->tpg && csid->tpg_linked &&
+	    camss->tpg[phy->csiphy_id].testgen.mode != TPG_PAYLOAD_MODE_DISABLED) {
+		val |= FIELD_PREP(CSI2_RX_CFG0_TPG_MUX_SEL, phy->csiphy_id + 1);
+		val |= CSI2_RX_CFG0_TPG_MUX_EN;
+	} else {
+		val |= (phy->csiphy_id + CSI2_RX_CFG0_PHY_SEL_BASE_IDX)
+			<< CSI2_RX_CFG0_PHY_NUM_SEL;
+	}
+
 	writel(val, csid->base + CSID_CSI2_RX_CFG0);
 
 	val = CSI2_RX_CFG1_ECC_CORRECTION_EN;
diff --git a/drivers/media/platform/qcom/camss/camss-tpg-gen1.c b/drivers/media/platform/qcom/camss/camss-tpg-gen1.c
index d29de5f93c18..cabbb2638cf3 100644
--- a/drivers/media/platform/qcom/camss/camss-tpg-gen1.c
+++ b/drivers/media/platform/qcom/camss/camss-tpg-gen1.c
@@ -22,6 +22,7 @@
 
 #define TPG_HW_VER_2_0_0                TPG_HW_VER(2, 0, 0)
 #define TPG_HW_VER_2_1_0                TPG_HW_VER(2, 1, 0)
+#define TPG_HW_VER_2_4_0                TPG_HW_VER(2, 4, 0)
 
 #define TPG_HW_STATUS		0x4
 
@@ -33,7 +34,9 @@
 # define TPG_CTRL_OVERLAP_SHDR_EN	BIT(10)
 # define TPG_CTRL_NUM_ACTIVE_VC		GENMASK(31, 30)
 
-#define TPG_CLEAR		0x1F4
+#define TPG_CTRL_CMD		0x1F4
+# define TPG_CTRL_CMD_TEST_EN		BIT(4)
+# define TPG_CTRL_CMD_HW_RESET		BIT(0)
 
 /* TPG VC-based registers */
 #define TPG_VC_n_GAIN_CFG(n)		(0x60 + (n) * 0x60)
@@ -164,18 +167,26 @@ static int tpg_stream_on(struct tpg_device *tpg)
 	}
 
 	/* Global TPG control */
-	val = FIELD_PREP(TPG_CTRL_TEST_EN, 1) |
-	      FIELD_PREP(TPG_CTRL_NUM_ACTIVE_LANES, lane_cnt - 1) |
+	val = FIELD_PREP(TPG_CTRL_NUM_ACTIVE_LANES, lane_cnt - 1) |
 	      FIELD_PREP(TPG_CTRL_NUM_ACTIVE_VC, last_vc);
-	writel(val, tpg->base + TPG_CTRL);
+
+	if (tpg->hw_version < TPG_HW_VER_2_4_0) {
+		val |= FIELD_PREP(TPG_CTRL_TEST_EN, 1);
+		writel(val, tpg->base + TPG_CTRL);
+	} else {
+		writel(val, tpg->base + TPG_CTRL);
+		writel(TPG_CTRL_CMD_TEST_EN, tpg->base + TPG_CTRL_CMD);
+	}
 
 	return 0;
 }
 
 static int tpg_reset(struct tpg_device *tpg)
 {
-	writel(0, tpg->base + TPG_CTRL);
-	writel(1, tpg->base + TPG_CLEAR);
+	if (tpg->hw_version < TPG_HW_VER_2_4_0)
+		writel(0, tpg->base + TPG_CTRL);
+
+	writel(TPG_CTRL_CMD_HW_RESET, tpg->base + TPG_CTRL_CMD);
 
 	return 0;
 }
diff --git a/drivers/media/platform/qcom/camss/camss-tpg.c b/drivers/media/platform/qcom/camss/camss-tpg.c
index 3caa95819b39..e7216f7f9d81 100644
--- a/drivers/media/platform/qcom/camss/camss-tpg.c
+++ b/drivers/media/platform/qcom/camss/camss-tpg.c
@@ -176,9 +176,9 @@ static int tpg_set_power(struct v4l2_subdev *sd, int on)
 			return ret;
 		}
 
-		tpg->res->hw_ops->reset(tpg);
-
 		tpg->res->hw_ops->hw_version(tpg);
+
+		tpg->res->hw_ops->reset(tpg);
 	} else {
 		camss_disable_clocks(tpg->nclocks, tpg->clock);
 

-- 
2.34.1

