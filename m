Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B377A4DD3C0
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 12:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789647963; cv=none; b=nfTFjJFiv1E8m0oo58Y/endX0q9IRq+Raem4zDE29JMM89y8qrafKtVwFyhvy02/KGlxYHvmHvvA2MI1FpnPuK+TDwX2SUAP+3L0f5JBIzbLr28UC9ScWZHWkY3ZNAX2TCcn/GA4Q9ZbQ+OGf7lmSUmW5eGKtuu8cGcNtMsCppE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789647963; c=relaxed/simple;
	bh=YFChqT0446tORb/T6erXbuqGyCEGrzvzDf5PT7XJgFg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I5zsbdhuJb+cV98H6XDJMBr94VJ4tXv6ZQ7PMuwfm92t6RI/EfiJgmhyl11cdO7hxorkKTk9OTVA6Au6Uc+N9YOyH270T4XLhh7YFXmdV5ykRbpihARXaPFkNXN8g4nIvarVh9CBC0Gi109XnQbX5uwjomk0xZCy8WE2hhBr5lE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D8Sfuy5l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kS308RGD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D8Sfuy5l";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kS308RGD"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9ZotX1862999
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 12:25:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UZi9vGdmEO23EVhCMp1C1PN6BGWSn+y+i7SV8wWmXOs=; b=D8Sfuy5lCcg2ICvw
	0PMhnVaxutHfi0TemvXhFjlzKBIRcwGNZ5248xxmQt/+a5VWF7YPxpClGCW2JfOn
	+HCLgFXBmmOxp3XXBhmoxmgeo2WVUEs5DyafmooEqLVgnjSNoFjkecXWl9YkC4cW
	vPlPhHDeep0+bmQoMv8FS7MBFtUEhyKOhzaMlxo3vwLLfsmOoXj6EbYNplPmUFlS
	FBIIoaEJ9HoZLm3/RO+27P/IabwlqXFITv+0WV1n8b4CampciWUHTLZ9TQvD8cxv
	aY02uI2QOHEQ7kK1VXHgcEyt80M/9dpRt/mgcUdcjl0rxnr2Uw0+2jGtLfysrGAX
	QiKe5g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqy6av66b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 12:25:47 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cc73f47bdcso13071485ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 05:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789647946; x=1790252746; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UZi9vGdmEO23EVhCMp1C1PN6BGWSn+y+i7SV8wWmXOs=;
        b=kS308RGDbUiahvgtRetb7QLWPrCEKIlATSk/3qC/1peEvHwIy6WfpVTLUqqc4Sg3Dp
         V3YMKRerNPEqwWeM0bc2wTfj7+yoRjYVSLzbd5SY7iw9sy6tAFR6lAOjz5wcJ9Vkpnfu
         y1bNcRki+cBOX9HIIbKwRRwnL2JzUV1NYknSqvmVhxQoeJ1qxXNOba3oWp1WEQco5r4m
         gnDK39WcDJlwTzvVcebZpQUcgjWmSwCbfrxYcKpB+uzLunX+lvikZaYfvmL0M5UcAwfC
         keNssIibNW8FJljoUtRA1ov0yg8OYXbw2ag4z8TvF9OCXb7qy6kMC3l0XkAkd+a/xhS0
         4gOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789647946; x=1790252746;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UZi9vGdmEO23EVhCMp1C1PN6BGWSn+y+i7SV8wWmXOs=;
        b=Lk34WjocsUI14ETlCp+aKz6/uSohHKqTZ5fhFRDkLkoF+B9gyXk+SgnUouFcP6gAXU
         MICm22fc2gBQbdOH/9prSGUbTlbUUK5nehWKspaDJEliOMzHWt/4c+sYeX9jhC2DP2gg
         2x4nIHPLnqUfT8E6MVMLwCopQwYHwek7t/5tPOMcC8brol8PnjRm9WcxMxgMuFQhEmB/
         rZ+LgMIgYUVgUC0bRDtnZcS+Gwcq17BSHDWwojmkTqCr+AA5p8fBDwdgH2j+cRyQCDAo
         yKScq4nV21WELbu29vSqjVUX+tXeBClF9dTNwK4ZlyGB/KWavMmW9+LftCvEPLWJDTUu
         b2EQ==
X-Forwarded-Encrypted: i=1; AKwUvBz00CG2vlrgQVwaMysWZC+XnNTZWVfm2AfztHBn0y9DviEVVczf7POvUef7WJ0oUoXlF7imE25xfp4qJ3I=@vger.kernel.org
X-Gm-Message-State: AFuF++mZcay6fhLFcfwloEUu/2NGuiPFR4MhVWORqI2Km7425YOGkSGF
	KmHehGAfjz+HE+VAx6aYoDgoCpeiDEvXIRvMPlGs6nu0dG6fK7fwm/0rm6pqdKDyipd4d+c59rO
	3PSRHox04/Ig8zwgCoxB3FlcgMz6Z66BYWT97RsIRTN7fW4rNj/MBij1txmX5Olc/1TM=
X-Gm-Gg: AYBFou0aGbvER8CMSfGPc/a21BWeR8l1xny0wEGQ5OFwBqYc7XYG3vFWYa31TysRc5w
	TeESCjjq2UDcYuKn2Fi2biIauR3HB8FrbHztmRBP5wAXgFiekdpf4dZMmLo+dmwDExfwkVLM9Np
	GGgN0lNJK79M6A6pwX28BOs+EXt0np/nxJ94Z3YiR6k1F1dDdXL1pP0pRLInnlEd1t7qoQWv7G1
	4TfNHjvoChcc49NwS9H8k0LF5r1tjKq2GqpzbLaYrFPVS8zJGN8Wh/LDceLncBd167VPGf/vs1R
	O6qBtBGnAl13q1v2u9zUpr0yUKp769Bj7YK5AKeKNQEdR3yynUYyYDUdYWSPvHjMAL5B0XW2zUz
	8ewQjnY4dEeA/zXJ7YuEIskeIHXX+VpCNTCc=
X-Received: by 2002:a17:90a:6d89:b0:39e:231d:1e89 with SMTP id 98e67ed59e1d1-39e231d20d6mr14655371a91.19.1789647945971;
        Thu, 17 Sep 2026 05:25:45 -0700 (PDT)
X-Received: by 2002:a17:90a:6d89:b0:39e:231d:1e89 with SMTP id 98e67ed59e1d1-39e231d20d6mr14655320a91.19.1789647945403;
        Thu, 17 Sep 2026 05:25:45 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5a6a175sm16380968eec.9.2026.09.17.05.25.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 05:25:45 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 17:55:17 +0530
Subject: [PATCH v2 03/15] arm64: dts: qcom: qcs404: Move PCIe phy and GPIOs
 to root port node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-root_port_v2-v2-3-6272b7caae9a@oss.qualcomm.com>
References: <20260917-root_port_v2-v2-0-6272b7caae9a@oss.qualcomm.com>
In-Reply-To: <20260917-root_port_v2-v2-0-6272b7caae9a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789647930; l=2004;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=YFChqT0446tORb/T6erXbuqGyCEGrzvzDf5PT7XJgFg=;
 b=quMBjQKcL+u5qCbbBE7cuiQ2yAYDJgyd5XJ51Ig7TQEsBBx7LmGnGHfxi95c0aJXN6czFX9HM
 nmkCGxN3TY+CjxsnzQcn5/gInD13mjsVbdflDt2zaSNgwhhHndr8h0i
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: QdqpqdS7b1Qus0KJMuJvRQJiYyYtcg2j
X-Proofpoint-ORIG-GUID: QdqpqdS7b1Qus0KJMuJvRQJiYyYtcg2j
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE3NCBTYWx0ZWRfX5FNM43lp7Snt
 yXW6P0td5n9frKkjbM30elY7PTwA4INk0kJpJpo9M+1c5KAQKHl+w31sTQ1C+9+plQTaDnHb/VE
 zYUMrKqBYDQ0lU70ZLLemET1jFqNB5NfLZGip8GnniJfwvmtLFJ0ABAsLAcrPZQ78SfRHc3FFDn
 ahbx15vrsi/eQgisoyy78mQnk79uu6pjLTkz4mn6wQ5F8zFFyN89IoxV4uZAzKuF2np7jd8aoVY
 k/yas5N6n9nnlzw4FFYAVNV0VTBxgpTB1VuPDvrTEmOOUDSH91ufIENJ/H3xxoB7BcOX9drwbEm
 XwdWkncn85z9CZwDTMuZE7tMCKC2TgsQzFHxbFSD71k+MUHU0Lm6Y2/AeiGEMf+vBOqk9HmUZiz
 6nv9Mm3NXCZYf6+0LQQBjoxZG8OzmIKfAqw88Bl3iHxk3Q0/KHx1lL7w9vWSqD8KXTzwTB9Iko7
 /splPfLJPxlLA1WR49w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE3NCBTYWx0ZWRfXyMh0Inm+P8Uf
 8J7PLWN9FM2e8D829V9z8SsLsU53fGlBd3TjDJWQGjkUl7Ei4EnfQa/Qh5u4lxxZ4j11nku0vpl
 12gSYJOGFUWRPKZ1U8HSeuNq3Xy4JrM=
X-Authority-Analysis: v=2.4 cv=VIRIDNPX c=1 sm=1 tr=0 ts=6aabdc4b cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=_k9ig2nQFDp-gxZIyLcA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170174

The PCIe phy reference and the perst GPIO property are per root port
and belong in the root port node (pcie@0), not in the RC controller
node. Move phys and phy-names from the controller to pcie0_port0,
adding a label to this node to allow board-level overrides. Move
perst-gpios from the &pcie controller override to &pcie0_port0 in
the board file, renaming perst-gpios to reset-gpios to match the
binding used in the root port context.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs404-evb.dtsi | 6 ++++--
 arch/arm64/boot/dts/qcom/qcs404.dtsi     | 7 +++----
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
index a22b4501ce1e..55bd53f8c159 100644
--- a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
@@ -101,8 +101,6 @@ pms405_s3: s3 {
 &pcie {
 	status = "okay";
 
-	perst-gpios = <&tlmm 43 GPIO_ACTIVE_LOW>;
-
 	pinctrl-names = "default";
 	pinctrl-0 = <&perst_state>;
 };
@@ -114,6 +112,10 @@ &pcie_phy {
 	vdda-vph-supply = <&vreg_l5_1p8>;
 };
 
+&pcie_port0 {
+	reset-gpios = <&tlmm 43 GPIO_ACTIVE_LOW>;
+};
+
 &remoteproc_adsp {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
index 736accfc34f9..7b622660c327 100644
--- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
@@ -1517,16 +1517,15 @@ pcie: pcie@10000000 {
 				      "pwr",
 				      "ahb";
 
-			phys = <&pcie_phy>;
-			phy-names = "pciephy";
-
 			status = "disabled";
 
-			pcie@0 {
+			pcie_port0: pcie@0 {
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
 
+				phys = <&pcie_phy>;
+
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;

-- 
2.34.1

