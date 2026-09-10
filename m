Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EB544A843F
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789047072; cv=none; b=azc9fxVHvNgWYkv07s4FitRIOn6zGzmSHG8h66AqAAgrxwm6abmKjE4Tna7JcSS6GfmuLZ3IFcdNzH4TxTC21NqGAftAUqWVR0CBD0r1CDl8ZYxn7ib1XyFD9QRP4Nm2Ij8gTkLieI4wo2xfSBmZ6FlKjM5dDcbch+qPVeNeAY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789047072; c=relaxed/simple;
	bh=n1zqcL4a7CLvKC/q10eRx9NGIcZus22gSzDP2LhiFC4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ad9GGKbxtWoMpuXhkDknFiMzALVz9Cq/id4fxCwlh5DYVqdTBkqIYr+RFzmlI7IEGQI3lSxDxv3rPXJ1XbLhx83aCFYy/EJm5I14ZQmnRum2egHSbo4dthUB6TdjqzLnnG58wbX8nl6UcwHnoHLIEgLjB5+qeGxo0cTUXHHNTf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oNTOuTwN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kG6nz9UD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oNTOuTwN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kG6nz9UD"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AC7gCk869037
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:31:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EtQHqxSngblCQYgfGoJXN+dn2DD44jdg6YDh/VZR4oo=; b=oNTOuTwNaK+3+2Cs
	TWB5TVJaNDlF2BDgZ+XuvrMnfuAoU6i6+GU3LVk3kg/uuBV/tkqO5H+uST+uimOL
	l5iM0nmqWMyRdoglZZmJIKpfnlJ+9XLlVVPwvs3EIEyAwkLuj944uWkq20jafgjV
	7M1R5MnGouLgrDdk2OTNtWFZRjXW1bLjfJ4RYyr7lKFJ/fERPo9g8qh+79uuOiZs
	MXu6oWAbZpVR1UIC1Cp+6zVQfNXOE+/hWLE/g3DGM4m5VnTCp0ENr0bJtBERVvLN
	p7DDn3uDQ2zTiuzarD1wcs2xIjSaYm7RNdbrnDbtNUH8RtIIULzhIGp3Yn+7QH5D
	JGgP5g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcyd40m7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:31:09 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2db22383e8fso18183895ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 06:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789047069; x=1789651869; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EtQHqxSngblCQYgfGoJXN+dn2DD44jdg6YDh/VZR4oo=;
        b=kG6nz9UDS6u0X5TJMZBnRkPjFbEkGwiCPiVEJIWGKd+JTUZWpqFTky7mhhdO9ZoJeU
         X03jy2P+y3/mnAoM6KGY5sUgTYK70BYyJe+323qClUBFE4XgV7YNbPUUICly27VGZfvY
         srnkU2y71NczYOpRh+yoBNEtqWlkC1Uvrv4j2WXUA6JNa/Dfjw/VZ/fMxTcbb0liT5k4
         B+9FM+Iag6GETBaEyf6kX1BLY9MJJY+PbMNYh7ZuT7awYGcqFD+zJBYbSmOIQ7TrXKjN
         aAmW7+Wpr2P5mdMSjtxwlNMZZCYIv74OToRfbq4s1c+XpTosd376aGl4bHzJLlMK6Dwu
         gzVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789047069; x=1789651869;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EtQHqxSngblCQYgfGoJXN+dn2DD44jdg6YDh/VZR4oo=;
        b=lxGgtHl429vYAGAb6Tc9z9cj7cBhE5N/oHbTdmAlbk6/kzTT9MfJBo6P52PA1oiSuX
         2rYlQO9Nx+gKit5/pHiqASgar2z38Y3xr+cgynglEA5Co8uaaH/f5k4eo1NLdZTjJ2kq
         a/ideQ9oHJ9Dd824NBTE0dZNYqABjOCuk9wWOhM49429a2ZFsoXhvpupGAN1VSSTqKR9
         5nzf2OWfWulOXH32zwX4aVHSwgJMcOc04RZOOh9DzGHXQo7dKz2lbpJEiooYfFZ9sOff
         CBYs42mflDasfsgd7W+hKdf9kNByKXDeuOxpPvY1hwmIjfBpyRDo6QMCMapAXQE5TgSA
         0tCA==
X-Forwarded-Encrypted: i=1; AKwUvBz/N+TjocP+TMhUkMMkb3mkVhg9xziYUvus0kmAgLDiVYV2tEWawPDHWPPntd1X+jt6SZUVu5ljhe/j4Ok=@vger.kernel.org
X-Gm-Message-State: AFuF++nVjQWem9xU+AhLe7E6/Kh2ABoMM3piDYu3IYne1fXwSsfpvLr2
	1/OcyWBcL2smYc62hC+1s1Ui9n2eFpLeBK4mPGz6eedBm+HWMz4L/m6JejmS23pkNOEFuvgFwG0
	8LZSbuYAZf7ebo+fLHw9SX9ER6Wa9AvOTYqj8iAd2eNgRdb30RDrrrCKQk1HN5869Uj0=
X-Gm-Gg: AYBFou0f6N/i/GVgXSLdkMfIECbqH/rn0cBqTJXFLpQTGrYZiPhUDyrkWgGrhiqi3ic
	k3kFoNNIhaF9iCD2i2yBvMH4GTUEelGavmUMX/8GqchYay9lBLQADfiX6hy49NG+nH7CuZSPGrA
	0ACc0AuVxWQ6Bt/tfWHLmvWlPE9p/DgUXLTbelVri1869uohIe0e+zZ7FAIT/wDwVFs0Dm6Df3i
	GOh/bxtwRLA/skSADBaCLsIPZjRFLLWTZcv0mTLOhWTw5IDej5FEoQNucBPWr/zB5IdjVqmJDXC
	zYfs04A5+bvTDFIzH+ebIq0RBONDGZ5mj7w8hBQmjtcCqrBb8dZtMR9AZKc64uYDxWlHZ56tbzu
	bX9eNC02cXGxW1T5z1DjYhKNCxfuMTSmm1TE=
X-Received: by 2002:a17:902:fdac:b0:2d6:ee34:c043 with SMTP id d9443c01a7336-2dd0ec757f4mr52122095ad.11.1789047068625;
        Thu, 10 Sep 2026 06:31:08 -0700 (PDT)
X-Received: by 2002:a17:902:fdac:b0:2d6:ee34:c043 with SMTP id d9443c01a7336-2dd0ec757f4mr52121425ad.11.1789047068034;
        Thu, 10 Sep 2026 06:31:08 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-338f7bad290sm21568614eec.14.2026.09.10.06.31.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 06:31:07 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 18:59:17 +0530
Subject: [PATCH 28/34] arm64: dts: qcom: sm8350: Move PCIe phy and GPIOs to
 root port node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-root_port-v1-28-90a252ddbbfa@oss.qualcomm.com>
References: <20260910-root_port-v1-0-90a252ddbbfa@oss.qualcomm.com>
In-Reply-To: <20260910-root_port-v1-0-90a252ddbbfa@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, konrad.dybcio@oss.qualcomm.com,
        mani@kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789046944; l=2912;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=n1zqcL4a7CLvKC/q10eRx9NGIcZus22gSzDP2LhiFC4=;
 b=XNi63+4ucY7omC9jl9wRmIdwCpYBzM1s9qRy51hTBlHYFxwxawVbSqn3z1X4qhTzca1Xw/Qt+
 I7lvsAfLU/rCdcgjq06G7v1Iz7MtjbzhI95ZmxZHri7hk+s81Cabb0f
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: 2BY-dLD4wkZdx5oZ-v-d5AsgbaoOSDcm
X-Authority-Analysis: v=2.4 cv=ef+o7LEH c=1 sm=1 tr=0 ts=6aa2b11d cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=bvY3E1ByFFb03tV5gjAA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: 2BY-dLD4wkZdx5oZ-v-d5AsgbaoOSDcm
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE2MSBTYWx0ZWRfX+9HeVevotMhq
 PxtGUmdSSEEOPPYG0NzyIP5wQWszOlqubcJDHwW236mYeLWNLtc4XPA7aYkIi07ezST13at/zrY
 44dm4p3bbbcwJsOfEizW7XN4fH1BmuE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE2MSBTYWx0ZWRfX1Ow1CEyK9BMp
 g81zJllU4oLxRWq9WH+XG/X4IjsIg6HNJLdOeYh+uFRF0KfsNel/k762LNXwwjGPhtXi1a4LGJu
 8mnIFxYw3SoT+ZeAW/orgQRvuIqxUnNdIt42fbuerp4uYmxroTRg8aKFQQhlOZQi+g1qSi97Q3N
 qBlTSys3s74j5rWKdHuwvpK/PK5HqKbE4gSb4nMZ7vfFmSPSl0b3C0D9z4YP1FzFEuAqWvq8DKH
 aHxTpEpkO5rK945/T8OUXjUhZqYp2RmdXSHv9bJA/iYm6Meoy0tlSvMKHODgKWsCxA45doQdajN
 QBKYOWO3CHpUM9XYrL1LWKsRtt4kijRSFxZBW57BuRXSVUNLCWjwpmQJYpNx28BdPboaxxbAl6x
 NhdACxA0KF6+ARiczp/aAcPoXakK09kDgL6WxekuWOylXYqabsiiCy5W5+i0yJwOv5S38dtUdK3
 vhpjwkdlat2dpJqO6hA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_04,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 phishscore=0 impostorscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609100161

The PCIe phy reference and the perst/wake GPIO properties are
per root port and belong in the root port node (pcie@0), not in the
RC controller node. Move phys and phy-names from the controller to
pcie0_port0 and pcie1_port0, adding labels to these nodes to allow
board-level overrides. Move perst-gpios/wake-gpios from the
controller overrides to the respective port nodes in the board file,
renaming perst-gpios to reset-gpios to match the binding used in the
root port context.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8350-hdk.dts | 16 ++++++++++------
 arch/arm64/boot/dts/qcom/sm8350.dtsi    | 14 ++++++--------
 2 files changed, 16 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
index e9b9e03f725e..2e087416a598 100644
--- a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
@@ -499,12 +499,14 @@ &pcie0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie0_default_state>;
 
-	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
-
 	status = "okay";
 };
 
+&pcie0_port0 {
+	reset-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
+};
+
 &pcie0_phy {
 	vdda-phy-supply = <&vreg_l5b_0p88>;
 	vdda-pll-supply = <&vreg_l6b_1p2>;
@@ -513,15 +515,17 @@ &pcie0_phy {
 };
 
 &pcie1 {
-	perst-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
-
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie1_default_state>;
 
 	status = "okay";
 };
 
+&pcie1_port0 {
+	reset-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
+};
+
 &pcie1_phy {
 	status = "okay";
 	vdda-phy-supply = <&vreg_l5b_0p88>;
diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index 32b47f5ec1f6..74cd66d98c54 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -1586,16 +1586,15 @@ pcie0: pcie@1c00000 {
 
 			power-domains = <&gcc PCIE_0_GDSC>;
 
-			phys = <&pcie0_phy>;
-			phy-names = "pciephy";
-
 			status = "disabled";
 
-			pcie@0 {
+			pcie0_port0: pcie@0 {
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
 
+				phys = <&pcie0_phy>;
+
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
@@ -1695,16 +1694,15 @@ pcie1: pcie@1c08000 {
 
 			power-domains = <&gcc PCIE_1_GDSC>;
 
-			phys = <&pcie1_phy>;
-			phy-names = "pciephy";
-
 			status = "disabled";
 
-			pcie@0 {
+			pcie1_port0: pcie@0 {
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
 
+				phys = <&pcie1_phy>;
+
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;

-- 
2.34.1

