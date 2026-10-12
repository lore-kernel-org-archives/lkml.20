Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB9B8442382
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 07:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791789833; cv=none; b=AmDg0ngjHpawUum0w6LgL5IsbsxmVcbqXnrd2sCo0nZQ2GCCZcGqZ2Z/6aHZkUvS+UEToRdi/ubWgyM/0FzvoVIf/QQ+MN6dL7xyW2XyvQ1Prs/qLiI+7cnkbC1/LG/bYK+KBxtlNe4LNnB1qZfSxhVV+YxzOYdbr4dJEogmp38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791789833; c=relaxed/simple;
	bh=OhjmlalEsnMhcYqQuD1F2lk7YTkFcmtIk+fKujO+9I4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MLwFVov4TpvIU11ySBpdLqX172SbUdhNy8mhwZHK4dePYsU2gCUi4EinWXlO87oiceSXm50DyvG6M/nq0Ttr42RBMWPIHNCBNMykzJzmIk7goKx3nUkn4HU50JALVBZHfCNNzyBo8hILaOf5zskAKMsVkTLF5Q1/7mCIXZDLQl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aE63aQpc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IpgE0e8H; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aE63aQpc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IpgE0e8H"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C5PcAi1787075
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 07:23:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5tBJ/Ukh+ElIPjYmJlnxZawvlrcAASOH8murc/CTP4o=; b=aE63aQpcdaitsvT1
	dO127fuIsatnFAReZ2gVxC8BoJzW3mMk7cEfMiKv3Qvz0X6YZt2jeyTlaq0MXVan
	3lds7xeydRUObBAIzULDzf1+YwRIKQKaqT+0qRxp0S3Rf1hqx+Qw4fDbzcJZpr3H
	4hqiGwt19wH/+snwmtUVKihQemji3riZa8ktsedNO4FZiqSk8jx93duG9+F8aM5W
	ysBhIHy8jMXfcV6ffFs0rOh1i1ssUqYH3rxVS81Pi+l+3cYP6oAxrPJVNYn19B0B
	N+oOwQj3Smt9Wqhqnq7MatW6vA4PcY3YvZE75Kiu50CBLOso3SdMvxNAZkpx4U0T
	wpa+xw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8sd1rgk0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 07:23:50 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-341eff9e381so5044383eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 00:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791789830; x=1792394630; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5tBJ/Ukh+ElIPjYmJlnxZawvlrcAASOH8murc/CTP4o=;
        b=IpgE0e8HPqAgLDm8I264+Mwq1xHDnoe2tHzhofSUuL84xessOHwFRckGeuxsc7ETBp
         sjEmHBL45xn6KP5FjWLpktgyQtHe6PfHEBIiMsnX19wEuH7GHjVrBLKMVrvLPu4vJe2+
         GOnEcuqEHhxT4hq4ABb99s2Gs0y7xrgD2vpgzIdabZEMwHBKsjGG/0ZTD87LsDF32mDV
         hVj0jkVc1D14XHFzuHJlE26az2sQeTMo/ocIG0sbGiQ5JLLFd0POI6jKZS2I5StqgcGA
         nd7LYw9PfTkHj2ac14Gdv985b8ofZ1v/58LC+at7PlczAocZZ8ST4jZVWOWBdMhtHwW4
         KaBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791789830; x=1792394630;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5tBJ/Ukh+ElIPjYmJlnxZawvlrcAASOH8murc/CTP4o=;
        b=sURSCIpYedJvjo+CNtfz8AvrqwCsLgWJLGZJgK5KBDgMqMeXdfnVnqesvTaF9XT23N
         /CSahMC6XQuX1Q/MauQPwLh6a42aN7HN77wneTaiS2AHIfC2pPXv0Qz6PaT4tD9UTZ4X
         xjA6SkV2XmHgmlaq0vOMjy9j1pXTcUMr2QSypkS09DBUoIYRLNTtSk95pk0NrralQhCz
         BCdv259W2W7lJkQV1btzcFCablHj895An0VJswe8KLgLIWjTGT5P/t2u3fU6vBcdQYGA
         bIQkTmaYMrTcCgNePFvbsXxOMGDBfQvz7fDscTuoeKvinJcruPeJolIlembSuIVzuoAx
         +paQ==
X-Forwarded-Encrypted: i=1; AKwUvBwISrJsdDJHEHzLmsLFnf+DgRcc1IfTtrFSG9zGoNMJ1OayaVm11jSms1lgE+ciSClK5K6JxK44pLvUKcg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJvsBymJ80cdPgqBii9h0ROGJ2YlDEnz5CIIj9AghWhWeNFZ9+D
	ReW1Pu6kd4DZfYnOBu2az15y87cra1V3az8j+3gS7WOUosDvWliGV5V74itykJMF8xOphGuuILi
	Ci4iFQZPQsINeZ0DvKvYW2DBO2CFt8DF8PqF9cfkh4akIrpBMEVWP6B0+iVmE2BPIpWQ=
X-Gm-Gg: AYBFou3LlLW7LPlT7AuxR2S7XwdD0yH5nHQLrM+CfMC3RQobC22lR7abQhmYSpqIGil
	PxYS7mT6WNYqujK+3ts/5qJPwyi5+vyDbJT/PrAwbR2US93UWROWfqIRLDbiZs0xLXjx8odJuvJ
	46Un2pZGdTi5T4ZlsGkSpxgfC+iY1m9umJcAQIxuw/srBC7l9BdeyMuexpGw4EBkH77Q4LhCRd3
	45JGMF6rgkrOYvsd5YiLIQuWafFHl6y1NiYlGmII08LtLSzVmg/I8DCPBHPpUi3tfqe2sngL92g
	mRbW7JfAkjIOUm4tPAv7eY662iyQ8Iqqzg2opC1Hlj5b/QMG1X1xOeXKLJrWchpqT8IdRcTtlBj
	oJrNwJpD5MjCYq2gi5LiX1GNZjJbx9vPr4O21w1FaeiVLiA0x3QhKw51RY2mWR4rAtwj/b4SBd6
	Nmh1KAv3Qs54Nd9nry1ML0pVLe5UAx
X-Received: by 2002:a05:701b:2803:b0:16a:b995:dc7c with SMTP id a92af1059eb24-16ab995dd20mr12636769c88.21.1791789829577;
        Mon, 12 Oct 2026 00:23:49 -0700 (PDT)
X-Received: by 2002:a05:701b:2803:b0:16a:b995:dc7c with SMTP id a92af1059eb24-16ab995dd20mr12636741c88.21.1791789828935;
        Mon, 12 Oct 2026 00:23:48 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a1becf08sm29748733c88.5.2026.10.12.00.23.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 00:23:48 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 12:53:10 +0530
Subject: [PATCH v7 10/11] arm64: dts: qcom: ipq5210: Add SPI node
 definitions
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-08-dts-v7-10-77bd3d68d850@oss.qualcomm.com>
References: <20261012-08-dts-v7-0-77bd3d68d850@oss.qualcomm.com>
In-Reply-To: <20261012-08-dts-v7-0-77bd3d68d850@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: Jeusx4QR_cCmqoQ9q9mml6zyl6J0x97N
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAyOSBTYWx0ZWRfX0M20h+3etmqT
 IsWI11DB05tw1zIENMuvpB+u8yyaufRT05TyOkXNQHxejzVbzt/uiOD+j1QoMi2rsjrw238kay6
 cc++NRrhaSFQr18hSZo115YFub3WqFI=
X-Authority-Analysis: v=2.4 cv=QtHLTlyd c=1 sm=1 tr=0 ts=6acc8b06 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=ll64UZJxbc1SGzsXvscA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: Jeusx4QR_cCmqoQ9q9mml6zyl6J0x97N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAyOSBTYWx0ZWRfX4+hECum/VdbH
 ihpkH3FWXXzIHe6YuCHFMwPSH815qVl1XXGw6qjbQ13AqBTQ/xlOFjP7KjU9UsAV8EoL0UWC6j0
 FuDhWXAbNoRJ/lJ89Dex0qP6eCNkH08NFJywNSCJ4dCOsChWhhIux6VqBVpF2cvjMtCrasiZ/+K
 9Sww5gZ0UznhxRNEeo4Wvib9dUZwANcapAzK4Heye/suA5z7+kELU7E8ll0oM9mvJX1VDCF/utA
 8DGmwZ0YeUmWhI6l2L9+Rmvm39s7SVeZTNpxyOqemN82shk3mvgiz7vA5Ws8r1/N5JRsjEw1lro
 Wr3la5U/MrjA/B0llW8rdkPzMzKBmGBcqSDA3USu49hKMt91PXOyQCAKVEgM0q4IkYjO+IQBE7i
 23ML2Q+rZoY0w+s8WLBiFiA16uJTV47747lhkmgKaa0iu5EcHAFQD7X6BQ28qX3A57lodd9Xmx6
 np7ETV5eNDKB7hZK/jQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_02,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120029

Add SPI node definition for the QUP SPI blocks present in IPQ5210.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5210.dtsi | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
index fdfeedcf5618..cf1c9898ddb8 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
@@ -418,6 +418,19 @@ qupv3: geniqup@1ac0000 {
 			#address-cells = <2>;
 			#size-cells = <2>;
 
+			spi0: spi@1a80000 {
+				compatible = "qcom,geni-spi";
+				reg = <0x0 0x01a80000 0x0 0x4000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&gcc GCC_QUPV3_WRAP_SE0_CLK>;
+				clock-names = "se";
+				interrupts = <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
+				assigned-clocks = <&gcc GCC_QUPV3_WRAP_SE0_CLK>;
+				assigned-clock-rates = <50000000>;
+				status = "disabled";
+			};
+
 			uart1: serial@1a84000 {
 				compatible = "qcom,geni-debug-uart";
 				reg = <0x0 0x01a84000 0x0 0x4000>;
@@ -456,6 +469,19 @@ i2c1: i2c@1a8c000 {
 				status = "disabled";
 			};
 
+			spi1: spi@1a90000 {
+				compatible = "qcom,geni-spi";
+				reg = <0x0 0x01a90000 0x0 0x4000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&gcc GCC_QUPV3_WRAP_SE4_CLK>;
+				clock-names = "se";
+				interrupts = <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>;
+				assigned-clocks = <&gcc GCC_QUPV3_WRAP_SE4_CLK>;
+				assigned-clock-rates = <50000000>;
+				status = "disabled";
+			};
+
 			i2c2: i2c@1a94000 {
 				compatible = "qcom,geni-i2c";
 				reg = <0x0 0x01a94000 0x0 0x4000>;

-- 
2.34.1

