Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793616160;
	b=yeGQME8rFSznNGjGHbgiMoYbWuEvuaJi6znBs3GtCkRtENbWnAG42fY3XPKUxa4kGs1J
	 fpPK06OUSpMRQ356Gpes89WEzJLS6ElaBBtYPzTo97l4hk3ibzGOc6+8o+vTVkN/Ehlw1
	 X3PnrNMVFUNajR5UwO76JwLYGqoA5lJ+ns8l6NFRqWxyy1bcgp199nIrVK7cRV3eIPx8H
	 Dd1Nk8mjgBdPy629jHqGcWregHdFKNfBWBSFMu2kMx8CVAA2zKJiBLcwaQDG4zSZrAfk6
	 DNGFPZq8Ffqov0rv4pAAP3b186hA8EEj3FgSKRrh4duKGLTFzGzogwmmN5DKBl505Ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793616160;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=kaChl1N+iCvgmPzHkGFWk1b6Hw6K8fInINc94iGF4BU=;
	b=3I73ftFZlhykVsib+rFEMDpnuKdwiPx+Wij3KoAQsSR8yyIzszKCuy8w7GvISGBKposW
	 Pm/3hAos4fq1KYWV2dT3+rr3VH5LFBzjxLH2QjEXToGBYDJwZAdMydakYJmCFxE25hmlI
	 s3mpXPaPmzpmUHPVNwOTyOpApIS6uBRwuKYpZC3SfmbY9b6bw1xaScD36Mqy3q+M/EZd+
	 38X5H48sI9wUIkY5xFGKBLXq6Vt4IiFnWkjVlte6o/9L6uxere6Ehf+tTPjzU618LDmQw
	 vI6tjTMZ6XNfzh2u8DMfDcdJaHEcm0b0B5eQMgRg3f7zodHUBZAqe+woEfo3sBA0Emg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="E+QysNm/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iffuzz+q;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CEBC60A6F45
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 10:42:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CEBC60A6F45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E+QysNm/;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iffuzz+q
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29A4hV260600
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 10:42:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kaChl1N+iCvgmPzHkGFWk1b6Hw6K8fInINc94iGF4BU=; b=E+QysNm/Qyt7uaHH
	EhBmFhYev/i6tr1AFSIF+c07VXDkYZZPeOY4XQf95VmfRnV7Xa5pUwFuEwCFe0ml
	fryMKyuHMliHXzKu7s/E8ibZ9eiWwCmJvDY64fy5tBqFzoqK4UL1LBHjcU6zl0nf
	d9nlGfmrVWtmrYQQuSbm9ziLKf+P6wS0rcZsEg4eZUZ2xFq1iz47Gc/O16leCeEx
	EwYjMUii3pg5Zgf9uSdOB1Y+QUJETc/TP+EIssk5R1kVuG1gMW/on5KS9PQzRz3a
	9yJG2QFFIdIgSBfHu54dPXMhN6Xjx3ONGR0Q0TaijU98M3ZLuivitiguPBjRBkgz
	JeCYAg==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpqmvrc80-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 10:42:38 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4f4612a1a5cso4700342b6e.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 02:42:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793616158; x=1794220958; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kaChl1N+iCvgmPzHkGFWk1b6Hw6K8fInINc94iGF4BU=;
        b=iffuzz+qKvNwLnJHX/rtR3mxejZi3zp/LoYbR0QjddKfxdIPeb8TTLEPcfb0tbfT1+
         kUVh7lpKBR2mGQHelGQXajv4QGHYC2natV3+sIj3aS2+0IYMR9X7zl/R/vLf3DU6dqsX
         Kcor7ppBWBY7xvodBHG8RPIjyJfgUsV8ldzmd/RajmleVjMVZFY+Cl2njUzDEveYNyaR
         FKOIyJFhAOKr8iAGI7PpNl20e81U6VYGk+iL7AMwN+lzdxh6c6goEPx9o9ZSsClT2N4S
         YwpiWQr+OoOw4Hf8xEEAyPLYNozRodLW49RVuj90sJia4molGmJjD3PJWVTDgsNenilR
         vyHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793616158; x=1794220958;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kaChl1N+iCvgmPzHkGFWk1b6Hw6K8fInINc94iGF4BU=;
        b=0ptkGJOh6ui2cMwFnJQwb153x8SDjcnnIlnAay56hyHrgBMfT78GzDJ+cBbZiI5dgT
         eubIGhC9NaNtd0EWJq75KryLT3QCLsk735iQjxn9gs4WTYPwrcCxEQOMhIGwqyjJXhsr
         va2TX1oeooh/PvgnLy3+pQJI56f729eX9KfCsfCiGHdJ5gRQ3WvBwh0RjyJA/9egTI65
         5Wfyc4Uai23s/aEVJOWWex5mbBNV0Op3Gc69BuEfd2htqAvIHWn/ljj5/0gJux2nmSmO
         2JgskAOhDjofoH95/ObGOPBVH/szZ5W2bAl7EuMiCiiqvsxMRyB/mggq5rAhD1daGQfq
         q6lw==
X-Forwarded-Encrypted: i=1; AKwUvByeurr0ZyxlmIQG0JJts/DJVf+baXxP4QBXFdW+kMYQ+6G4tyJF01roUu2dCAVVLZcN8eAuSVkuYlBUr7s=@vger.kernel.org
X-Gm-Message-State: AFq9FYIzXMqCvGd6ho61gunRuDTIcSS8HBVDIIsFM27em9viUY63ZdSd
	Aaj+hW1Ke+k12Npas7EZjEbwwTHmz/HjGBJu2213ypa7MdePW1MnRdDVAEDAWFgel0JE6ULMUxp
	j1QUZOJvyGg4R6P+zuTWYUduQd4F4CFqG59m9k5XITsZAzpJHmvDQY8+Vevf9UGyGRkA=
X-Gm-Gg: AYBFou0omRIFVYyCBZwJpAnQiCI1Oq8gidX4CBpW2vaK2vQRmr/HN71D/gDFtUc4Ke7
	0HtEvODjC66zGC2gEeHFzTAigksR4ZR3h8PEjFzUpXvu3GRsa9NUjJE7Ch5bI6sf7uIrYbA5zqz
	9DjXtj0+b4kUcVQwQJVnw6WMaz74bYFsr2oq1WatT2BPmiAX9+Z5gd+UCrvFuxaty2dDHgjG7Eh
	pydDTkJ9+zpR6e/qtgLNsWpU2y5D5Wm7AteCuHPRKGqMCHgI1hqwto3tHWw+u4Q1vSsv+lJuiKc
	6kHhH8jIl/s2ZzZiPuqM5yQAtqglan4IQT0qKj0s7n3TFmfi2egFHH+DHbOD68FBuNt7vGfo765
	s6FQVGEI3y91JMIlxcaFOAQj/W5f4Z0JM2ptBoZPFYhncKss4c31mva0pPvz2rnpCDDZMuy5Jhn
	uLN08087/A5rVMKPmz+SPSpcl46yuqn6r+gCYAfmRy+nxv0jP9mZzJ1MTzuSk=
X-Received: by 2002:a05:6808:1798:b0:4d6:9133:cfea with SMTP id 5614622812f47-563efc537e0mr6202226b6e.47.1793616157734;
        Mon, 02 Nov 2026 02:42:37 -0800 (PST)
X-Received: by 2002:a05:6808:1798:b0:4d6:9133:cfea with SMTP id 5614622812f47-563efc537e0mr6202217b6e.47.1793616157279;
        Mon, 02 Nov 2026 02:42:37 -0800 (PST)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5640fe0fc77sm7447171b6e.12.2026.11.02.02.42.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 02:42:36 -0800 (PST)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 02:42:19 -0800
Subject: [PATCH v24 11/15] media: qcom: camss: tpg: Add support for v2.4.0
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
Message-Id: <20261102-kaanapali-camss-v24-11-d6b8f3f6f66f@oss.qualcomm.com>
References: <20261102-kaanapali-camss-v24-0-d6b8f3f6f66f@oss.qualcomm.com>
In-Reply-To: <20261102-kaanapali-camss-v24-0-d6b8f3f6f66f@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=TMDQ2Fla c=1 sm=1 tr=0 ts=6ae8691e cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=WuBB3ILsY1tR9b9Bs04A:9 a=QEXdDO2ut3YA:10
 a=_Y9Zt4tPzoBS9L09Snn2:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: FIPAYsBEejmANW_VlqQljsCT2Cv2lkx0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0MiBTYWx0ZWRfX890hL5WqpnEY
 9wXcXyZL8rh11ZPm0wzIXL/Y509g9SVPVIoNHsmLD3Jda5eoKXly1ed4gLGzPDaUqmspm0aZKNE
 iLbgzAdMPYkdG3am/xcgQtPuq0vtb10=
X-Proofpoint-ORIG-GUID: FIPAYsBEejmANW_VlqQljsCT2Cv2lkx0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0MiBTYWx0ZWRfX0C8IyQfk5jko
 cNRvDp0j2Ku8eOHVUB/VV7x6J8mPEujl1lbRxwxbRrRR5jMCwvdbIbS6AZxb1JJrT9aJ3RFY7BS
 u3TnL2tt1ZQ0I5a5o//Ul5tAtqlr0I2iUCWrsYnhQ2dZLGKeSs9raYUtIecZ/ITvTQL/qj9JbZr
 jtsJuSz1VsLBwctWhE5ch+mGVVx72CuFhnTjoKhxFsuuUIuWFI+C0aca0kWL6u/RbkrwE/77+8o
 xEDTjCxet9cN6yV1Gqs2Nr0oGvM8yiRpnmP45y+X5YgkHSRuRGRYRTvalePYTgUMBkj+0ZZoRgB
 grZ/iTH//rRWCVxAohNeAB0o3BzX4HFZNnZh1oaoQuSy2Zf5tZaRVbuWFnkgTxqiNHXsJsxeO/3
 XBEG9vRmcM8heliXW8XsxaYpP30OLxfEMtDNMqF2rxae3OGjLKCTvPaDXGcdHZ5v8rVUKJDsC0q
 MeyD4YkPKxXKtbaRNhA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 phishscore=0 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020042

Add support for the TPG found on Kaanapali. This TPG uses hardware
version 2.4.0, which drives test-enable and reset through the
TPG_CTRL_CMD register at offset 0x1f4 instead of the TEST_EN bit in
TPG_CTRL and the TPG_CLEAR register. Its output is routed into the
CSID 1080 RX through the CSI2 TPG mux, so the CSID selects the TPG as
the data source when a test pattern is selected.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 .../media/platform/qcom/camss/camss-csid-1080.c    | 15 ++++++++++++--
 drivers/media/platform/qcom/camss/camss-tpg-gen1.c | 23 ++++++++++++++++------
 2 files changed, 30 insertions(+), 8 deletions(-)

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

-- 
2.34.1

