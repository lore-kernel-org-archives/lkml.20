Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793200889;
	b=DC4t5/RrlCY0dDP/UxYUeYe9WEmcKY27Oc3h0mlXnt1y9PrH/USsukyBTBNgp52V0Cq5
	 pZIEVd3jyzu5VjCbErDGgCzqf6x7tacovcGVOCKKCospFaw6p+cemnJkR+m3QIFYRcovq
	 T6OBl0zZ9iLKk84oUBFd62sTKSre8gq88jwKLae7pBL+AeMqUlWr7FdYGpad744gJWfpS
	 4MWtUfIuqjn54giWg1YbbqBkovdO/4GAEBTWQaO81NYopxum92J1WN0qsQf+Kxx1ndAFe
	 P5Berk8OHP2FrLqyJ86F9FFydOoP998C1Qjyio95a1fni9fzhCaxlYTHt8dm7Xz+RKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793200889;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=xDQYtF8k8ZaWbb7+5j3FW9elWsMzSAcqwviqB4BRnpg=;
	b=OwCnQ3063zSJ/cZdD6rpEEPuY4lEwnGFQRrjDyEbh+9bvJjtnai9DQ7kXDX1SCgunXOQ
	 i7kkcDyBUDjkY8GTq1eO/8/luMwMnhvGw8RNs0QQ9T+6zvw0oaWN940Ie/jP8cqekHcCg
	 TA0Y6Uy+U9xp/53rUKPtJ5uZMIY2f0H+aupZKpi+8NRgAR45JpR1rXmQnsMgQoPXF95ra
	 jFFXVY9qNdK+93GwyZ2DUuQMsNdWB8cdATJT8zRVU6hwsDhY3bw8cvg1USYcUsRnSKyB7
	 HjjIplc8kf3QgdCVtiTbNUYXYyoQYRc13/guB08M4axEfnA+/2NOd1gpwX6262mSMLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="HuE/je94";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hFHBlnJx;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59B3960A6F51
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:21:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59B3960A6F51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HuE/je94;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hFHBlnJx
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SFAaMQ1458921
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:21:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xDQYtF8k8ZaWbb7+5j3FW9elWsMzSAcqwviqB4BRnpg=; b=HuE/je94ZcOYhWRc
	ghkn/2Qmm/8QFtNHdl770cBwJlasdQH27/aw919vM/IrfvXWHt7bbiMi2Cr3l+5F
	nqOgms7g1wpfHGJJpNNehwH+csbph54uH8aEO4nG4Ej1t/lS/Dq3UTfKa7hSl10z
	dfiGUSHwtnfLw+yEC2QvGOnUTpbZjQVLO9dWD5gSSSvkRkCjabxm6E4lYSIHXpXL
	14O3ZcYxOhwPZjVXualqXskPA2FfcfY3EiDrQrpFaWWAu8+Sm2y8bqAr0oIvVdZV
	RnIpqY3U2lZv5EfW/caRhgX5l/Tflc+IfkdFhOpQ2dzD2c8X7U7FouPUMn9iqjUg
	wWtGbg==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk82ttrqd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:21:28 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-8b0e4c2f052so494517b3.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 08:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793200888; x=1793805688; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xDQYtF8k8ZaWbb7+5j3FW9elWsMzSAcqwviqB4BRnpg=;
        b=hFHBlnJxLJuofQKH7JwhJyBJS2gbVj9sZ1PfWKb3brbJGdXSRopYMr/oPXpl1WeCNK
         XUYFMWaFwJH48dwzFV1CGxHKnIMJU9sy4bpmE4JZ45LQ7zNz0QEGBN/5QWAnTTBuwtxC
         VWkZ2BDPO8lYSm3MZCpaiWBQgxUvfJm4iuYqexpjH9Day7neqLCfj3VuP5EQ8XeuwTsP
         sBDIv6rRGpleWd122AB4DI5VC+FIrhYRV2LoebyAj9S/IUgG926pNipjD7ibHE40LGDy
         ctde3VHh0xEUFK/g6wYRq/NZW2nxVl4/5SQrsZxI4oaazZj/8miO1BLd9G0HUqWMta+f
         GUug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793200888; x=1793805688;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xDQYtF8k8ZaWbb7+5j3FW9elWsMzSAcqwviqB4BRnpg=;
        b=qVouu7VjylfaY4uB+qrUDfS2J+hwT+LiiMfBPp9qF2ZXLO1AcekabNRtnUpMK49M+i
         HLVTAob3T78WNGZ/FJCE8DiC5vB6vhsHTjOZMc6CaimZC2P2mM3b9zE1bhy0i3LVwN3D
         HHc6Da9KUPZjUHYDNWqf1uAofubCnuTz/6GMQbFWYF+dDfOCJBsc6Vm1nqWSRQtqVn8R
         ucqS4JhEQ8cThECNkRXnN5dqQUf0vBAx2ffdLAP70XeDI49M4mvsQbD1Q7DaMDTV7Dbt
         eHqML1CUp9nRfFQd8xsH/3aNIEhhm+twKKXRtMicn/lobb7G7/0FF7G6Qjr4GGi0oLjB
         S03w==
X-Forwarded-Encrypted: i=1; AKwUvBwtBq4otRP08Wf0N/TAsZChdoijc32kDP7o8NrdINBsvYCml9Lz2VE7CouExpvW0fZ1n9n8JWwgh1tR1o8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ+jqzHT6ABIIannXnOACJPqTZ+U6YvLu3Lb2bRBSwroxFGjThm
	kGSn5nEsCBeK3L5t0VHR4wTij9DhrL6Sk5Z4OCiXXMRqkAgWTXP/WDrIUwXhUSA+dAQw5Nd8LzL
	0r0bfv9P5N6J6qMfMyLX1kDOw3pv6assOw4mDZ3wrR/N66AEQeCSYCJlZT/Kjj5UOQ5U=
X-Gm-Gg: AYBFou1tWNGe7JqG743GSEmJ6hQe0tL07gPVesOMMG4CFGm8UKeZ8RWUHzQ7tIZCMTS
	PLxaFXlRNOOk0uC6tHpmL3ZCcXojaZBOzpfDwZHIZAdl6JDOH2Myl2GVKVNXBVvtn1pS/hC6rTG
	pihcGF19YYYwLvb+qbuE1ZBLeyP47m2mvjSaNtgIpx1YX/O3FOV24tyxHQnlm7HZuC/9bkHa1Qt
	b3yMEmit9MSCOEeTOcpD23debnAwGppGVkm/XWSBWJpByyYQYZd1+V7i8ZNMG9ZKk7nVtY8AhKY
	f3LPIv9xPz2W2XWvotQbqBpFD223ZAG6wjNkg+T9U5aiubH1X+fWbZSnGa5foBiZ2HybLOc8rB2
	yviadMlfkYx58LDT92fBU6wJVFX0JjvPcfow00rgfIvm3rSIZfWfSvUlokgvKfagA7H74Rr/EFf
	p4P5eqZH0f6uBbQdohtL53tJCH0+weZqMKag0Tt8W3WNCn3D+m6N3qKWnHhqMj
X-Received: by 2002:a53:d54b:0:b0:67a:551f:920c with SMTP id 956f58d0204a3-67a7bce22d5mr1623157d50.86.1793200887716;
        Wed, 28 Oct 2026 08:21:27 -0700 (PDT)
X-Received: by 2002:a53:d54b:0:b0:67a:551f:920c with SMTP id 956f58d0204a3-67a7bce22d5mr1623121d50.86.1793200887107;
        Wed, 28 Oct 2026 08:21:27 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67a803cdd1asm1107541d50.4.2026.10.28.08.21.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:21:26 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 08:20:45 -0700
Subject: [PATCH v23 11/15] media: qcom: camss: tpg: Add support for v2.4.0
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
Message-Id: <20261028-kaanapali-camss-v23-11-95f250b18612@oss.qualcomm.com>
References: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com>
In-Reply-To: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com>
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
X-Proofpoint-GUID: 7d5ziqy67pUURdQKGFmiwQoxqv7dWPBb
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfX+7NKKINWA+7p
 18CKMqQU6lInAK0jbcWJO/Ltw+r21JCCz//IoLw3fjZGEYcvCduNkTNxKi86Iwh3SWVKZ1Eyn/0
 tw4uVLoyS+WDdllANFKChaDC/ZvLlfM=
X-Authority-Analysis: v=2.4 cv=Tr1zFzXh c=1 sm=1 tr=0 ts=6ae212f8 cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=1CCqUJFLb0VynuEnu9gA:9 a=QEXdDO2ut3YA:10
 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-ORIG-GUID: 7d5ziqy67pUURdQKGFmiwQoxqv7dWPBb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfXxbjQGJpWkFBn
 yFLIZVyY4qACaVnjQRcPtqzXxvcFAzPGsfzaguYXwRQjj8EAnSPGx3Ecz6THxmlLrnrdBgcuwiS
 7NEFfQzL1zkIwxDqtmo/rvRFxUwkL54ZFEVJS1RR4ID7dYHR9RuYV1XnQYWLXJLWgSXQzjXLpRb
 YhDpFxBl8ygVgxlLGHmhf9EnkRnqBjQ+Q8jGQCFDPucf+owMvmDMCQOWa8epqcJ8pQE3VsMwJQt
 WeNOPRlFt9j5Gs/iZzjEZT4Yr+o42W+/l3Z2CVOTPha4z9uVI4B1xlrsx23M1c7UAr6YqA3SATP
 UAgZR/sM0KkqUqO2k11eBPQq50VyCvk1LZXJ7qPyFIbBPMxYTUVFe+esY8EfReNI3H+46d18UTt
 GAXHMJ3qZzms1KpfNXRtouaklSwlB9X22DSQK6cwdOq6PjFMHnbkt0jcA3KU/ix98W8+Gz/v02o
 OT6CNQft9U9AHeyiIPQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 clxscore=1015 phishscore=0
 impostorscore=0 malwarescore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280061

Add support for the TPG found on Kaanapali. This TPG uses hardware
version 2.4.0, which drives test-enable and reset through the
TPG_CTRL_CMD register at offset 0x1f4 instead of the TEST_EN bit in
TPG_CTRL and the TPG_CLEAR register. Its output is routed into the
CSID 1080 RX through the CSI2 TPG mux, so the CSID selects the TPG as
the data source when a test pattern is selected.

Add the TPG resources to the Kaanapali camss resources so that the TPG
subdevices are created on this SoC.

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 .../media/platform/qcom/camss/camss-csid-1080.c    | 15 ++++++++++++--
 drivers/media/platform/qcom/camss/camss-tpg-gen1.c | 23 ++++++++++++++++------
 drivers/media/platform/qcom/camss/camss.c          |  2 ++
 3 files changed, 32 insertions(+), 8 deletions(-)

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
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 6ff82dd2aeaf..df4b4cf30711 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -5850,11 +5850,13 @@ static const struct camss_resources kaanapali_resources = {
 	.pd_name = "top",
 	.pm_clks = { "cpas_fast_ahb", "cpas_ahb", "gcc_axi_hf" },
 	.csiphy_res = csiphy_res_kaanapali,
+	.tpg_res = tpg_res_x1e80100,
 	.csid_res = csid_res_kaanapali,
 	.vfe_res = vfe_res_kaanapali,
 	.icc_res = icc_res_kaanapali,
 	.icc_path_num = ARRAY_SIZE(icc_res_kaanapali),
 	.csiphy_num = ARRAY_SIZE(csiphy_res_kaanapali),
+	.tpg_num = ARRAY_SIZE(tpg_res_x1e80100),
 	.csid_num = ARRAY_SIZE(csid_res_kaanapali),
 	.vfe_num = ARRAY_SIZE(vfe_res_kaanapali),
 };

-- 
2.34.1

