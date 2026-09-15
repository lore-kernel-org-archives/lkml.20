Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61FB7492E41
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 10:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789467033; cv=none; b=daQ7TMXG/3pCnhI3IKOy16f09dAjOE2DLqLZa5plRTn/SzhTI2zpGEwWwE97yU5+69TtlxWsSgcYKQZILewxpFwpEUyIwzEt1gJ0p4qVynybfxrmXNElGByOsUftkHkhU2rjLpKdkQfpDjbigjOwr7WmGHThBZY++y8whfEAcSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789467033; c=relaxed/simple;
	bh=XUfmOD+Gje0qaTrzZVMw4eiPWNkc1pz35kmtULSrFBg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ac0KU0KGJ3z/064YnUJWy1pzTZ7HkoDlxcWSliPmm6E7UDS94MMyoJCtgKaJ1CIO59eVPhocmPe/ddIfgBqJhMR0gIVi9YTwZDKkNkJYyNn0xXvFBcSvXnLYBy5h4SwmtWhoSWsNUkCum+8Cw7HKW4snOmqeb58NFpsdT1aOioE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PfRySXgb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cEUjWT5u; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PfRySXgb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cEUjWT5u"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FA4oIa3611558
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 10:10:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lL+IPpMF/cAhqiywdVXZtEtyZh34av5qZ7auNw2GWoA=; b=PfRySXgb+gc6xnxE
	xZkc++sv56rSPH6cpNlFI6ic3JYUsOTVCq3Gh7BSoNIJ+Z+celivk7DA7Jcfttcs
	FsFthTc4IpoMApbQ9NyPl5wpWsN5TpmfEzNN7OxuZJEdvIlKfn9/pyeFKh1eQ/Zy
	dYfq44hnnZMQwMX1rVkjr2evOt+MdZCzxl8LgIBJTmBgxsQMaMYS5tVW6sloxzCn
	vQ4EPU2C4sap+3ihzRmTgtilPt0zR3MomJ608D+0vrMaEMMoWBhHt70UPegAxA30
	+SkChd80YTmtq6N4lzukYeoY9AQPc9OX/Owu6DDTbDOXRUmJlJNjqk9Rk1HVnv4u
	IibLjg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq3xtr0v9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 10:10:27 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-398dc3d8f0fso888189a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 03:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789467027; x=1790071827; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lL+IPpMF/cAhqiywdVXZtEtyZh34av5qZ7auNw2GWoA=;
        b=cEUjWT5uE4mKhxRMQUpSp8qrjhiShgrG5ttWwYPiqOlZIufiBCWjs59TW8/qfVDWHx
         xvDd9eqj6BQtUSDDtEv3tkNw5WlpLWa4jCQw9BJ0IqQEcXiuOG9OAXlOOXztl6S4Etun
         UfqVGo9crVSYsPvk1fsMfw3GEiTxz0G0tKaRjJV7FNhm0R88YrDyvcI9bmHz6luirSRw
         KkLBtMIL0KyzXx3gSFk4hUUbxsN9wKIEiP2NZHH33QPsEONvWc8L9lot/nI6O8+HiRkv
         qietNhtvlOuUtEuvFCBSAIvxiUl4ThxkcIpgr/K87z3U0TKA0ZQtYvgUdsd7ZpinSu24
         qCZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789467027; x=1790071827;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lL+IPpMF/cAhqiywdVXZtEtyZh34av5qZ7auNw2GWoA=;
        b=x0flNScz7qzSDn3vj2GzZAXU/8V/Z0u9dHwyrpRRbakqepSwcwL6zQhv7fMRRMDWP5
         NGQ7sWMhhw1zIOSc8HqhRKhC6924jDv8gRdn+Wh5gRPx2Cc0DAo2Q3wlvTZAIEmrIgdC
         XeRsZg03kXr45lYQA9+shqFyOjmo2RxIiaG/CUBvSdVlYsdSJ6ByfhB7HYV3hk8Zf2sY
         d6wbbfWSrqlfBQNZxWCAiaFo4yaB1mT31+q9sqJemAgbuK0GOEjPeytHVLp5qRCIrh3r
         WoL0UcaK36Fp4tkSs3u2o45cgtj9na4T7H6OnzWcztybNQ2ShInPjgMFFPqXo/N1rDnZ
         Orgw==
X-Forwarded-Encrypted: i=1; AKwUvBz1ppmiwymImmQfx8reubGNutagRH0mN7ge5Ppg/NZHz0wtHanJ8VCarKHBZMaULBNMui89rBGtBJYrf0M=@vger.kernel.org
X-Gm-Message-State: AFuF++lnhvA7DLOtYqcYEy8/eMQGFJwaO8rpYM3tdgQeiPQvDMt/3bTA
	VoX5U+9l9tXQggMPir5PetE19UBHlbClNawrakPe6e9hJj4uWoaxNK9/GPP+FUFbdDq3aHwBeuc
	cZF/Tqrp9HhvCEgPeDfEbKU8KgHd9kIluLVDNk9DC4UrpEFsfVACGD3pXrjHivwbS6hY=
X-Gm-Gg: AYBFou0QTs7DD7R1/DhWIxEA480iaWY8/XtpVrNWPC1IGZypVTAwfXWASJ+8pFuZwe1
	HYHq3NYwChwT+/dvBSjINYcBTOyGKmrwrxm3yQTNaapS73UywZzQSEqOWIUQvuCxe/2ZhTDmojD
	II501Xpk8PCunosYIWnBrzDMewVAnKlJpUImc5gtNn80I/4LPa9tmWwQcVHUOZPM7oB7CRfNiZA
	vfMmlqy0byyFk40m3FuX9leCseYC+jL1OuJww9oarAv/I1wyCYuJYrQSn2egsd7eHC3PBb8lILo
	4FHjp7pW0tbjSM4Y6C01FYDwTARkBia9xVvEEjso6CGjLLSGxskuf5xqQFI5v7UkMu8vk1Cm9MW
	Mn6u7r4aDNov2y006tReJMyKbAiKgISxaBRNaIonKddTGg/RlgWdZl5tH+0nvF9uwRueGDHqgrU
	KYYBQ39SPrxb4=
X-Received: by 2002:a17:90b:2d8e:b0:398:cb8f:c308 with SMTP id 98e67ed59e1d1-39dfdce1f86mr4786870a91.0.1789467026573;
        Tue, 15 Sep 2026 03:10:26 -0700 (PDT)
X-Received: by 2002:a17:90b:2d8e:b0:398:cb8f:c308 with SMTP id 98e67ed59e1d1-39dfdce1f86mr4786809a91.0.1789467026070;
        Tue, 15 Sep 2026 03:10:26 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14382741839sm14244091c88.6.2026.09.15.03.10.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 03:10:25 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 03:10:05 -0700
Subject: [PATCH v16 10/11] arm64: dts: qcom: kaanapali: Add CCI controller
 nodes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-kaanapali-camss-v16-10-c9f3f6f4180c@oss.qualcomm.com>
References: <20260915-kaanapali-camss-v16-0-c9f3f6f4180c@oss.qualcomm.com>
In-Reply-To: <20260915-kaanapali-camss-v16-0-c9f3f6f4180c@oss.qualcomm.com>
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
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: O7J0H1TQC7WEuyFpCmT_SP9SGuHMf4ZR
X-Proofpoint-GUID: O7J0H1TQC7WEuyFpCmT_SP9SGuHMf4ZR
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDE0NiBTYWx0ZWRfXzYc03BubOJJn
 P0LorLV58ZrKOXMmGU6cy+aYnMlf2H5oJf4gW/YUBOUCfO2OsqABQrMRmSw4ppBqaig8ibZE3op
 qWEUP4WlmEC/vWUXBv+qswS5ESB5uEM=
X-Authority-Analysis: v=2.4 cv=As97T+9P c=1 sm=1 tr=0 ts=6aa91993 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=6uyy3mKblwRlHw_pSasA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDE0NiBTYWx0ZWRfX6zp5ZYtr7AUE
 6ccGxp7eC6ZmQO0f+eLsKxgsjkrkdRyf54rtYvCgJKe0zF6q0yFrdLPgL36zwAehEKQUACESigZ
 P0VJ1vZpMrfxQoHag2HtRUumC4Df/5fth/sYohiTBpDKnBWqhFNFKricJ4zcGAvwG2+/LblUw7l
 SqlF6hsnkLsXtRB2K++ZFMYe3Wf2iDr18Rxhne0fol76fBSkZFSvH26sD9i+N/IA6YhoLaAaxel
 eLC5ukcVZR89PZ6rwVecwp/sPtehOek8Di21KhepqZRKxpoYTf3fhnysBlpdYF/v1H5E2aDaEWn
 sj7dPCTSEl3YGJA/dwHW///OD5eBNLhfwjdVXfPu8OZg4fZW0eSznghmy/r5O5aozkFbFn+T+24
 1urZU/wTaQjAaYSxSH6lOKZFNQ8FPasLM58K+mHME8nfPgAoZxtowUidXuQC6AYJjR0MreuroS4
 wO3kYXZBljUjmmDVS3w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_03,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 bulkscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150146

Add the three Camera Control Interface (CCI) controllers present on the
Kaanapali SoC. Each controller provides two I2C hosts used for camera
sensor control, so define the controller nodes and their pinctrl states.

The first bus has two CCI bus master pinouts:
cci_i2c_sda0 = gpio109
cci_i2c_scl0 = gpio110

cci_i2c_sda1 = gpio111
cci_i2c_scl1 = gpio112

The second bus has two CCI bus master pinouts:
cci_i2c_sda3 = gpio113
cci_i2c_scl3 = gpio114

cci_i2c_sda4 = gpio107
cci_i2c_scl4 = gpio160

The third bus has two CCI bus master pinouts:
cci_i2c_sda5 = gpio108
cci_i2c_scl5 = gpio149

cci_i2c_sda6 = gpio115
cci_i2c_scl6 = gpio116

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 303 ++++++++++++++++++++++++++++++++
 1 file changed, 303 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 84b93914ad53..02f8dab30b91 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -3514,6 +3514,117 @@ port@5 {
 			};
 		};
 
+		cci0: cci@941b000 {
+			compatible = "qcom,kaanapali-cci", "qcom,msm8996-cci";
+			reg = <0x0 0x0941b000 0x0 0x1000>;
+
+			interrupts = <GIC_SPI 426 IRQ_TYPE_EDGE_RISING>;
+
+			clocks = <&camcc CAM_CC_CAM_TOP_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_0_CLK>;
+			clock-names = "ahb",
+				      "cci";
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+
+			pinctrl-0 = <&cci0_i2c0_default &cci0_i2c1_default>;
+			pinctrl-1 = <&cci0_i2c0_sleep &cci0_i2c1_sleep>;
+			pinctrl-names = "default", "sleep";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+
+			cci0_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci0_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
+		cci1: cci@941c000 {
+			compatible = "qcom,kaanapali-cci", "qcom,msm8996-cci";
+			reg = <0x0 0x0941c000 0x0 0x1000>;
+
+			interrupts = <GIC_SPI 427 IRQ_TYPE_EDGE_RISING>;
+
+			clocks = <&camcc CAM_CC_CAM_TOP_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_1_CLK>;
+			clock-names = "ahb",
+				      "cci";
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+
+			pinctrl-0 = <&cci1_i2c0_default &cci1_i2c1_default>;
+			pinctrl-1 = <&cci1_i2c0_sleep &cci1_i2c1_sleep>;
+			pinctrl-names = "default", "sleep";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+
+			cci1_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci1_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
+		cci2: cci@941d000 {
+			compatible = "qcom,kaanapali-cci", "qcom,msm8996-cci";
+			reg = <0x0 0x0941d000 0x0 0x1000>;
+
+			interrupts = <GIC_SPI 428 IRQ_TYPE_EDGE_RISING>;
+
+			clocks = <&camcc CAM_CC_CAM_TOP_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_2_CLK>;
+			clock-names = "ahb",
+				      "cci";
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+
+			pinctrl-0 = <&cci2_i2c0_default &cci2_i2c1_default>;
+			pinctrl-1 = <&cci2_i2c0_sleep &cci2_i2c1_sleep>;
+			pinctrl-names = "default", "sleep";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+
+			cci2_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci2_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
 		csiphy0: phy@9523000 {
 			compatible = "qcom,kaanapali-csi2-phy";
 			reg = <0x0 0x09523000 0x0 0x2000>;
@@ -4224,6 +4335,198 @@ tlmm: pinctrl@f100000 {
 			#interrupt-cells = <2>;
 			wakeup-parent = <&pdc>;
 
+			cci0_i2c0_default: cci0-i2c0-default-state {
+				scl-pins {
+					pins = "gpio110";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				sda-pins {
+					pins = "gpio109";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
+
+			cci0_i2c0_sleep: cci0-i2c0-sleep-state {
+				scl-pins {
+					pins = "gpio110";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				sda-pins {
+					pins = "gpio109";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
+			cci0_i2c1_default: cci0-i2c1-default-state {
+				scl-pins {
+					pins = "gpio112";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				sda-pins {
+					pins = "gpio111";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
+
+			cci0_i2c1_sleep: cci0-i2c1-sleep-state {
+				scl-pins {
+					pins = "gpio112";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				sda-pins {
+					pins = "gpio111";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
+			cci1_i2c0_default: cci1-i2c0-default-state {
+				scl-pins {
+					pins = "gpio114";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				sda-pins {
+					pins = "gpio113";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
+
+			cci1_i2c0_sleep: cci1-i2c0-sleep-state {
+				scl-pins {
+					pins = "gpio114";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				sda-pins {
+					pins = "gpio113";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
+			cci1_i2c1_default: cci1-i2c1-default-state {
+				scl-pins {
+					pins = "gpio160";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				sda-pins {
+					pins = "gpio107";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
+
+			cci1_i2c1_sleep: cci1-i2c1-sleep-state {
+				scl-pins {
+					pins = "gpio160";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				sda-pins {
+					pins = "gpio107";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
+			cci2_i2c0_default: cci2-i2c0-default-state {
+				scl-pins {
+					pins = "gpio149";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				sda-pins {
+					pins = "gpio108";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
+
+			cci2_i2c0_sleep: cci2-i2c0-sleep-state {
+				scl-pins {
+					pins = "gpio149";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				sda-pins {
+					pins = "gpio108";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
+			cci2_i2c1_default: cci2-i2c1-default-state {
+				scl-pins {
+					pins = "gpio116";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				sda-pins {
+					pins = "gpio115";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
+
+			cci2_i2c1_sleep: cci2-i2c1-sleep-state {
+				scl-pins {
+					pins = "gpio116";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				sda-pins {
+					pins = "gpio115";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
 			hub_i2c0_data_clk: hub-i2c0-data-clk-state {
 				/* SDA, SCL */
 				pins = "gpio66", "gpio67";

-- 
2.34.1

