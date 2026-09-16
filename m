Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 612904AB3CA
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 15:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789574172; cv=none; b=SwzP7TcvefJvLVrRWergXB5Ku5UYXLOt6Rf2oe9M4FWQq00y8BZVoyilzoDCQFomURCkoi8hJPtKix/gGG6MvZ4/A1LqF9U8/yHFsuBAJHtMthcYluegBi2Wiw55/TEXgXMzGTXOIqPVGRQgL/KTJF6R/JoQ0u4YRzcC+aY0oOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789574172; c=relaxed/simple;
	bh=W8fHuem8Iy3HcW5TJb0ZXHZYpXfavb3T9aGOgbXvJBw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gFauvWgaHdI9FAPtMVH7gSqbCwS77Nv5zvVCoIhjLYZhv4jqafdCXvjD49Pk+msvZuXtW5oJGWpHN9FWufR2scM7Ag5DcxcfqZ9wVJfr48pomE/duF+JPYk9I4c0Txj+ZxLZoae98A2a6u4HY7S9so1xkKIlfQtvrAgMuRP69RE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C08/uHI2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hsm7H2xP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C08/uHI2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hsm7H2xP"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68GFeEm33365372
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 15:55:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ICgEDzrD46Ja+3PW/FDLNJJ2/E27z7u8pFuU0OSbMOk=; b=C08/uHI2KjrwcOHi
	nb00GZVlO522IJC5TmKGWvDtGhfNm/LkZLvsAr4sUFCcbw2eC58pIqCtCV0DIuUZ
	FkatLBV6ut1zU/CGOp5PthjCgeBKR647CQz5Kr2noHd2K++/+NmVGiIvlNkDb+EX
	Hup7ro6xEwBwvztuM2gzS4Ynv3Rnwcc+VjX4bXC7Esxf0jTuslGW89v7Ij/qiu31
	nYTWk0Onj5oSJzVm/AvUrUu+q4RQrRoMvnlc3ow+Zar8HY/FeDwqoHSNj8A7GUS5
	TeFqbOw+Knndyvl33tt39wq5HrGrcwz7wMTomaHRwLadVxTpUwmeGtzDLBzrRoP3
	u8Dz5w==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqjcku87y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 15:55:56 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-97e8be2221eso992884241.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 08:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789574156; x=1790178956; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ICgEDzrD46Ja+3PW/FDLNJJ2/E27z7u8pFuU0OSbMOk=;
        b=Hsm7H2xPn3XY8ZpHotSeQuKadKsKKjxbOh8Xve0Vm5QcmBvmjYw3KJJ6q0Zjs/ukAO
         QkDDHm/pYf/X64tJ/qtOmxJ9Q1Son7F/RGtXuQegP61v4xmwKQJ2hBC4bQtmUnlEUAxs
         +G2l4oa1LNA8aFZ0DrVqQeAkf1cD4z3hSESM4FB0l1+46KikpsfqbQf484J3N56O/zr7
         mrxljv85roOI9VRVrkL8os/JpgO+tef+2aisI317pYG18Kl80BkfBVGo5d1Td0lSTo/0
         NJOSWyDWzd3Hce4O5ucgAcuNc5pXoG9z6tsEFNYMjf+ZzTvAw9W/Mr8loAeiwuUTiSOS
         9vuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789574156; x=1790178956;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ICgEDzrD46Ja+3PW/FDLNJJ2/E27z7u8pFuU0OSbMOk=;
        b=DgyGe+HqyZ7xs9jXrwqSxZWvO/cwaZt/tThACDziWJs08bbbaDz3tG077Z/8hs79zq
         1Aq8tyTXntz99LzcPX33bAQDcD9TKhdlPqJS8xnOSJET+HkPkiQ9tddBbh39qKll/S+f
         KK1Kca2Gc0veuSTi4dSx49me5bmlu28aiwG/NM9Ls7sGAXrbSNh+rbZyM0X66fGljU8j
         s4XvN999puNgxdx6afRMD2QIRqaIpeOOaOIE5T1V37nZbICYvmhCJWbtA9ydqwUmvDXP
         2A0h3vfMGQ00lUJMzO1q5TkCIP5JGCfcyz9k1mq/TYqqP6FArrCtZuFt6YsOGDx8K+bk
         T62A==
X-Forwarded-Encrypted: i=1; AKwUvBynhso6R5ICe0p/0iAmKPsGSOMDNGy3sZ7N0FaO7oC11mGCodfiJ2olB34jV6SO3FjlU7CYHMyX5lNM/t4=@vger.kernel.org
X-Gm-Message-State: AFuF++k+HsLElRiYaEJVWF2yhqNIE44UY88woO0asNd1Gsfhl0crv0/A
	n5pMkJLaXjd/WL7eEa8Ai5ANrKf+0B6Pl/+VEJiDn7bCaoB/y9PymnP/Q79X4AxetiZXSn2r0DB
	p7sabB7PG+SBy64/BZHPl7Tp+ARPjbcb2BBmUlHAp8aAICRvWjZH4Z2pOb6BJAaTh1uU=
X-Gm-Gg: AYBFou2XkskBFx9vK/iwcFLZ6SvjTHA+rermMMR0Hg5tBnQR6sx59NpSTPVDHYPGff3
	uxxFiP7cFDk7JO6gs0UuxpB0Q2GNQ2I+Q3IloiE5Yi8J0SH/wO/plnmn/h8HFG8PC1lVti952T0
	dv8V52K+ZR1ehU6DhnDPjfCWC2eGkcClq48vdTReNQs8GTHWtM0qwlaZJCqIpM/jYm3qtvIkwhn
	/zdkOEqpCaD4MdYqOZbrLvLYP0GFX3g4P1UhGZfUEItdEsAzLDcj9GBJ1yYmxoN7CbTIVb/CIhv
	Q/vJSxp1Hm0A/+TBSZrP4i8vAotzn2xscfwH07CPHj6qT/bXdkHmEHRREvOKbw/hyHu4gi/v2Y+
	oeXWopHEe4b+8lqn6V0wNWLWfCWs=
X-Received: by 2002:a05:6102:f8f:b0:79a:7895:c36a with SMTP id ada2fe7eead31-7a029f1425amr4417350137.13.1789574154819;
        Wed, 16 Sep 2026 08:55:54 -0700 (PDT)
X-Received: by 2002:a05:6102:f8f:b0:79a:7895:c36a with SMTP id ada2fe7eead31-7a029f1425amr4417221137.13.1789574154175;
        Wed, 16 Sep 2026 08:55:54 -0700 (PDT)
Received: from brgl-qcom.local ([90.161.207.100])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd2160c2sm765525e9.6.2026.09.16.08.55.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 08:55:53 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 17:55:39 +0200
Subject: [PATCH 2/2] arm64: dts: qcom: nord: wire up GPI DMA for QUP
 I2C/SPI engines
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-nord-gpi-dts-v1-2-073e3f9c19d0@oss.qualcomm.com>
References: <20260916-nord-gpi-dts-v1-0-073e3f9c19d0@oss.qualcomm.com>
In-Reply-To: <20260916-nord-gpi-dts-v1-0-073e3f9c19d0@oss.qualcomm.com>
To: Shawn Guo <shawnguo@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, brgl@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=12192;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=W8fHuem8Iy3HcW5TJb0ZXHZYpXfavb3T9aGOgbXvJBw=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqqrwCO1EPtdy5gFRMHVh237ntfMNZd9KtpPH41
 31f+EvAsmaJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaqq8AgAKCRAFnS7L/zaE
 wwkUEACQ5bbmxHgfRKIq8JpGGkwokfS75Uh4lgI9gNfFE98DZcVPeY1GIb6X9L8zcWtuuT/MMmP
 McjRn6awMVzqtVfncBfiCKU6Dtkrv5NpW9cxPYRQ5N27JFxxAzs9d0ImNnnVdpC5DDr6YaPOocC
 pEdhnQKaKX4GUa40zGsgz+dwBstRsqy/M6uYlGb0tSMu0gGIsX8131FjJr73GrwT6EBW6Je+M2G
 1YolU/4UYfVFYMixkykST6mVRuu+7BkT7N3dhzQY+vqcAf80mvVJAWu+vTa3MOw+FXClat8TOPn
 0+SBsbsQNo8/4Jme6pP8TOc3YmMeBIRAQQesb5fEtH5AYHoGxZZryDkqG5sEIaYUXwJwx3wfDMA
 BzfXdtkGWe2Y1OMqSfRtrON/38IHfEZgRpNnV5W7B31OkRAEJ/wJHOkIT3R4PumkOppShqsG+3Q
 Z1U3iHwG7AnKKP6nLmBQF8zWAyNexcgiVO6VO2Z7NCP/4RLLLYimabvIxfLHX320+LB9Yfy15tW
 ZQHooNwasVJ/HbzvM/xlocEaiZI9XIBh9vyMVRSWfi8ugIq6mAGGSE9Zcv0mWCZe8z/juFHviJI
 W9deYUtV/n2ZIKlYQZTwhZ8CSHT9FVH2jcaBqqP/uGr5FLkyVF24er0dRG58YsxfNoxUwEqd4vl
 IlQrJRA/WRLixvA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDIxNyBTYWx0ZWRfX15nhsvbG5odB
 RKve3Bk7y6FzSZHpgfhi9e6hKSh3RAr/0qo9uzWGItNWVdIHrqjnMgY98A0r9Kx/OZ+DToyTBYD
 UtRUckJH7nIMzQVxbRq4jX16ptxW7a4=
X-Authority-Analysis: v=2.4 cv=PsIG/AM3 c=1 sm=1 tr=0 ts=6aaabc0c cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=BQ2oiuy6hHN+kKmom1QVvA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=_aD-_fD5Ripri5gDGEoA:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-ORIG-GUID: Vj8yR8SiA5H3AOXPJkHe4MH5dKf6uiGY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDIxNyBTYWx0ZWRfXxiqS2AFYIInw
 PAJw2UycQIcOoS2iUXLX1Qt0jPzwkcON+I0l8r91arXrTjm7hobBV36WwAVZfsoGjDiEzH1PtDM
 YiejPAX+VNKSSKtOigPMMkZXeYVglUOgWnpSVpPFAfmhFk1rRf0xem8Hf4R5fQdNvpeKhb5qoxm
 g/c4EpoQDr9M4vT0X3+UG03wT2gzh+rSiW267uArdsPNDc4AwJ9uvWf/AA30GiMJ8kxfor05Efl
 hxkInwev60mBH/BWphN224Tk1i+OZEb099p9Yedqc+a35Hhbby5CcnsbIQRPo99cX30vEV2RjUj
 PWiogDqrsS4Y1RsnbEAhJnEo2uTsHHTE+cQdvTHZaiWdmpZ3r7mpOFK6esVmh+ItbAfUTzqbMA+
 KjQfpQrRlTKdZBw+F5Fd5UfEMUMF+CEK88b1gfblkuiyns9xXZSswBjuRf1A4zGfcsRRaiNzUQ0
 uKEebl1gO2v91JbN++w==
X-Proofpoint-GUID: Vj8yR8SiA5H3AOXPJkHe4MH5dKf6uiGY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 phishscore=0 spamscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609160217

Add DMA phandles to I2C and SPI QUPv3 serial engine nodes.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord.dtsi | 152 +++++++++++++++++++++++++++++++++++++
 1 file changed, 152 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qcom/nord.dtsi
index 870033a106db..6152f92ecf38 100644
--- a/arch/arm64/boot/dts/qcom/nord.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord.dtsi
@@ -1098,6 +1098,10 @@ i2c14: i2c@880000 {
 				reg = <0x0 0x00880000 0x0 0x4000>;
 				interrupts = <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma2 0 0 QCOM_GPI_I2C>,
+				       <&gpi_dma2 1 0 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
+
 				#address-cells = <1>;
 				#size-cells = <0>;
 
@@ -1109,6 +1113,10 @@ spi14: spi@880000 {
 				reg = <0x0 0x00880000 0x0 0x4000>;
 				interrupts = <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma2 0 0 QCOM_GPI_SPI>,
+				       <&gpi_dma2 1 0 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
+
 				status = "disabled";
 			};
 
@@ -1125,6 +1133,10 @@ i2c15: i2c@884000 {
 				reg = <0x0 0x00884000 0x0 0x4000>;
 				interrupts = <GIC_SPI 583 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma2 0 1 QCOM_GPI_I2C>,
+				       <&gpi_dma2 1 1 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
+
 				#address-cells = <1>;
 				#size-cells = <0>;
 
@@ -1136,6 +1148,10 @@ spi15: spi@884000 {
 				reg = <0x0 0x00884000 0x0 0x4000>;
 				interrupts = <GIC_SPI 583 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma2 0 1 QCOM_GPI_SPI>,
+				       <&gpi_dma2 1 1 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
+
 				status = "disabled";
 			};
 
@@ -1152,6 +1168,10 @@ i2c16: i2c@888000 {
 				reg = <0x0 0x00888000 0x0 0x4000>;
 				interrupts = <GIC_SPI 584 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma2 0 2 QCOM_GPI_I2C>,
+				       <&gpi_dma2 1 2 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
+
 				#address-cells = <1>;
 				#size-cells = <0>;
 
@@ -1163,6 +1183,10 @@ spi16: spi@888000 {
 				reg = <0x0 0x00888000 0x0 0x4000>;
 				interrupts = <GIC_SPI 584 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma2 0 2 QCOM_GPI_SPI>,
+				       <&gpi_dma2 1 2 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
+
 				status = "disabled";
 			};
 
@@ -1179,6 +1203,10 @@ i2c17: i2c@88c000 {
 				reg = <0x0 0x0088c000 0x0 0x4000>;
 				interrupts = <GIC_SPI 585 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma2 0 3 QCOM_GPI_I2C>,
+				       <&gpi_dma2 1 3 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
+
 				#address-cells = <1>;
 				#size-cells = <0>;
 
@@ -1190,6 +1218,10 @@ spi17: spi@88c000 {
 				reg = <0x0 0x0088c000 0x0 0x4000>;
 				interrupts = <GIC_SPI 585 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma2 0 3 QCOM_GPI_SPI>,
+				       <&gpi_dma2 1 3 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
+
 				status = "disabled";
 			};
 
@@ -1206,6 +1238,10 @@ i2c18: i2c@890000 {
 				reg = <0x0 0x00890000 0x0 0x4000>;
 				interrupts = <GIC_SPI 586 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma2 0 4 QCOM_GPI_I2C>,
+				       <&gpi_dma2 1 4 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
+
 				#address-cells = <1>;
 				#size-cells = <0>;
 
@@ -1217,6 +1253,10 @@ spi18: spi@890000 {
 				reg = <0x0 0x00890000 0x0 0x4000>;
 				interrupts = <GIC_SPI 586 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma2 0 4 QCOM_GPI_SPI>,
+				       <&gpi_dma2 1 4 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
+
 				status = "disabled";
 			};
 
@@ -1233,6 +1273,10 @@ i2c19: i2c@894000 {
 				reg = <0x0 0x00894000 0x0 0x4000>;
 				interrupts = <GIC_SPI 587 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma2 0 5 QCOM_GPI_I2C>,
+				       <&gpi_dma2 1 5 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
+
 				#address-cells = <1>;
 				#size-cells = <0>;
 
@@ -1244,6 +1288,10 @@ spi19: spi@894000 {
 				reg = <0x0 0x00894000 0x0 0x4000>;
 				interrupts = <GIC_SPI 587 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma2 0 5 QCOM_GPI_SPI>,
+				       <&gpi_dma2 1 5 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
+
 				status = "disabled";
 			};
 
@@ -1260,6 +1308,10 @@ i2c20: i2c@898000 {
 				reg = <0x0 0x00898000 0x0 0x4000>;
 				interrupts = <GIC_SPI 461 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma2 0 6 QCOM_GPI_I2C>,
+				       <&gpi_dma2 1 6 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
+
 				#address-cells = <1>;
 				#size-cells = <0>;
 
@@ -1271,6 +1323,10 @@ spi20: spi@898000 {
 				reg = <0x0 0x00898000 0x0 0x4000>;
 				interrupts = <GIC_SPI 461 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma2 0 6 QCOM_GPI_SPI>,
+				       <&gpi_dma2 1 6 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
+
 				status = "disabled";
 			};
 
@@ -1318,6 +1374,10 @@ i2c0: i2c@980000 {
 				reg = <0x0 0x00980000 0x0 0x4000>;
 				interrupts = <GIC_SPI 314 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma0 0 0 QCOM_GPI_I2C>,
+				       <&gpi_dma0 1 0 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
+
 				#address-cells = <1>;
 				#size-cells = <0>;
 
@@ -1329,6 +1389,10 @@ spi0: spi@980000 {
 				reg = <0x0 0x00980000 0x0 0x4000>;
 				interrupts = <GIC_SPI 314 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma0 0 0 QCOM_GPI_SPI>,
+				       <&gpi_dma0 1 0 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
+
 				status = "disabled";
 			};
 
@@ -1345,6 +1409,10 @@ i2c1: i2c@984000 {
 				reg = <0x0 0x00984000 0x0 0x4000>;
 				interrupts = <GIC_SPI 513 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma0 0 1 QCOM_GPI_I2C>,
+				       <&gpi_dma0 1 1 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
+
 				#address-cells = <1>;
 				#size-cells = <0>;
 
@@ -1356,6 +1424,10 @@ spi1: spi@984000 {
 				reg = <0x0 0x00984000 0x0 0x4000>;
 				interrupts = <GIC_SPI 513 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma0 0 1 QCOM_GPI_SPI>,
+				       <&gpi_dma0 1 1 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
+
 				status = "disabled";
 			};
 
@@ -1372,6 +1444,10 @@ i2c2: i2c@988000 {
 				reg = <0x0 0x00988000 0x0 0x4000>;
 				interrupts = <GIC_SPI 514 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma0 0 2 QCOM_GPI_I2C>,
+				       <&gpi_dma0 1 2 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
+
 				#address-cells = <1>;
 				#size-cells = <0>;
 
@@ -1383,6 +1459,10 @@ spi2: spi@988000 {
 				reg = <0x0 0x00988000 0x0 0x4000>;
 				interrupts = <GIC_SPI 514 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma0 0 2 QCOM_GPI_SPI>,
+				       <&gpi_dma0 1 2 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
+
 				status = "disabled";
 			};
 
@@ -1399,6 +1479,10 @@ i2c3: i2c@98c000 {
 				reg = <0x0 0x0098c000 0x0 0x4000>;
 				interrupts = <GIC_SPI 515 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma0 0 3 QCOM_GPI_I2C>,
+				       <&gpi_dma0 1 3 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
+
 				#address-cells = <1>;
 				#size-cells = <0>;
 
@@ -1410,6 +1494,10 @@ spi3: spi@98c000 {
 				reg = <0x0 0x0098c000 0x0 0x4000>;
 				interrupts = <GIC_SPI 515 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma0 0 3 QCOM_GPI_SPI>,
+				       <&gpi_dma0 1 3 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
+
 				status = "disabled";
 			};
 
@@ -1426,6 +1514,10 @@ i2c4: i2c@990000 {
 				reg = <0x0 0x00990000 0x0 0x4000>;
 				interrupts = <GIC_SPI 516 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma0 0 4 QCOM_GPI_I2C>,
+				       <&gpi_dma0 1 4 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
+
 				#address-cells = <1>;
 				#size-cells = <0>;
 
@@ -1437,6 +1529,10 @@ spi4: spi@990000 {
 				reg = <0x0 0x00990000 0x0 0x4000>;
 				interrupts = <GIC_SPI 516 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma0 0 4 QCOM_GPI_SPI>,
+				       <&gpi_dma0 1 4 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
+
 				status = "disabled";
 			};
 
@@ -1453,6 +1549,10 @@ i2c5: i2c@994000 {
 				reg = <0x0 0x00994000 0x0 0x4000>;
 				interrupts = <GIC_SPI 517 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma0 0 5 QCOM_GPI_I2C>,
+				       <&gpi_dma0 1 5 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
+
 				#address-cells = <1>;
 				#size-cells = <0>;
 
@@ -1464,6 +1564,10 @@ spi5: spi@994000 {
 				reg = <0x0 0x00994000 0x0 0x4000>;
 				interrupts = <GIC_SPI 517 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma0 0 5 QCOM_GPI_SPI>,
+				       <&gpi_dma0 1 5 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
+
 				status = "disabled";
 			};
 
@@ -1511,6 +1615,10 @@ i2c7: i2c@a80000 {
 				reg = <0x0 0x00a80000 0x0 0x4000>;
 				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma1 0 0 QCOM_GPI_I2C>,
+				       <&gpi_dma1 1 0 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
+
 				#address-cells = <1>;
 				#size-cells = <0>;
 
@@ -1522,6 +1630,10 @@ spi7: spi@a80000 {
 				reg = <0x0 0x00a80000 0x0 0x4000>;
 				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma1 0 0 QCOM_GPI_SPI>,
+				       <&gpi_dma1 1 0 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
+
 				status = "disabled";
 			};
 
@@ -1538,6 +1650,10 @@ i2c8: i2c@a84000 {
 				reg = <0x0 0x00a84000 0x0 0x4000>;
 				interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma1 0 1 QCOM_GPI_I2C>,
+				       <&gpi_dma1 1 1 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
+
 				#address-cells = <1>;
 				#size-cells = <0>;
 
@@ -1549,6 +1665,10 @@ spi8: spi@a84000 {
 				reg = <0x0 0x00a84000 0x0 0x4000>;
 				interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma1 0 1 QCOM_GPI_SPI>,
+				       <&gpi_dma1 1 1 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
+
 				status = "disabled";
 			};
 
@@ -1565,6 +1685,10 @@ i2c9: i2c@a88000 {
 				reg = <0x0 0x00a88000 0x0 0x4000>;
 				interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma1 0 2 QCOM_GPI_I2C>,
+				       <&gpi_dma1 1 2 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
+
 				#address-cells = <1>;
 				#size-cells = <0>;
 
@@ -1584,6 +1708,10 @@ i2c10: i2c@a8c000 {
 				reg = <0x0 0x00a8c000 0x0 0x4000>;
 				interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma1 0 3 QCOM_GPI_I2C>,
+				       <&gpi_dma1 1 3 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
+
 				#address-cells = <1>;
 				#size-cells = <0>;
 
@@ -1603,6 +1731,10 @@ i2c11: i2c@a90000 {
 				reg = <0x0 0x00a90000 0x0 0x4000>;
 				interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma1 0 4 QCOM_GPI_I2C>,
+				       <&gpi_dma1 1 4 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
+
 				#address-cells = <1>;
 				#size-cells = <0>;
 
@@ -1614,6 +1746,10 @@ spi11: spi@a90000 {
 				reg = <0x0 0x00a90000 0x0 0x4000>;
 				interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma1 0 4 QCOM_GPI_SPI>,
+				       <&gpi_dma1 1 4 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
+
 				status = "disabled";
 			};
 
@@ -1630,6 +1766,10 @@ i2c12: i2c@a94000 {
 				reg = <0x0 0x00a94000 0x0 0x4000>;
 				interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma1 0 5 QCOM_GPI_I2C>,
+				       <&gpi_dma1 1 5 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
+
 				#address-cells = <1>;
 				#size-cells = <0>;
 
@@ -1641,6 +1781,10 @@ spi12: spi@a94000 {
 				reg = <0x0 0x00a94000 0x0 0x4000>;
 				interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma1 0 5 QCOM_GPI_SPI>,
+				       <&gpi_dma1 1 5 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
+
 				status = "disabled";
 			};
 
@@ -1657,6 +1801,10 @@ i2c13: i2c@a98000 {
 				reg = <0x0 0x00a98000 0x0 0x4000>;
 				interrupts = <GIC_SPI 363 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma1 0 6 QCOM_GPI_I2C>,
+				       <&gpi_dma1 1 6 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
+
 				#address-cells = <1>;
 				#size-cells = <0>;
 
@@ -1668,6 +1816,10 @@ spi13: spi@a98000 {
 				reg = <0x0 0x00a98000 0x0 0x4000>;
 				interrupts = <GIC_SPI 363 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma1 0 6 QCOM_GPI_SPI>,
+				       <&gpi_dma1 1 6 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
+
 				status = "disabled";
 			};
 

-- 
2.47.3

