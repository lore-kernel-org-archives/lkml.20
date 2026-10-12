Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB4D336D9FE
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 07:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791789825; cv=none; b=IDVnzvTlY4JlNJGntoCrIE0L4qoX/7VE+/aNN7efoAXfgTUCtcM9JnDtG4+cSkixR6miNfcw53fneZDvvO9htk3ak5m5OdpLbiNm+LCSmoJe360cZr0bulPzKOzbcPK8JyZYZZkAQ0G0+9Zp15+aGupgP4dNAOueUjZjjEIA+H8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791789825; c=relaxed/simple;
	bh=Fq6zNQXup7fVL9hxWN3AiqpOkiSjGOTDUA8QYPdXEZ0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Vk6/YsjJfhHGlXMxXGgwYolsYfiQ0dS0hi+c2GJYVzUVSIciBxU/Y3AxDfqNed+beK+pS82liUpV38HWGX/99bEYhs8mbUQpKvbiJJs9j5NrhIatepHH/7GNQolchAct75u4D+8o3tZIbfS10JadQZtYLJw621SjMsPYjf7zkx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jvPuFMqM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DUcJSOb+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jvPuFMqM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DUcJSOb+"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C55rPn303044
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 07:23:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QYkllvOl+MxaLFWOW+IjD7cSlpy3IDud66Um038owAk=; b=jvPuFMqMEiSjo4gN
	77u7mxFb0NS3qYdLErE6QSXHtG3WZrl2u4nd/6VaKN2a7BCV1NTwMeuG2uJNpjSY
	0TUhnO1mFtodirtGxpFWEiJ0DizbWcAVIFncvAcEq6Smy8eazxIVI3cH7H2Ej2Zk
	2LGnUj5hw6Njw/87I7j43DXHAUGQFeuVLegzmKwdME3hBxbs/FF27BbNKb01rPU4
	5Jq3qS3Lqn3M4i8Hi1qOT0apQcEaMe1oClRuP1h7P8ESV77XOkv0K0BLlnqouCAW
	tw3jCWQgav4EQaJoDM9NuXc10Z1zDOPv2C87ucw1fA3b3sYKXmCHROzQ3lsQf1Mz
	qGxlRA==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8j6dhhw9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 07:23:42 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1665200f4c2so2264098c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 00:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791789822; x=1792394622; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QYkllvOl+MxaLFWOW+IjD7cSlpy3IDud66Um038owAk=;
        b=DUcJSOb+RrfIW+OiIRqxRUWn7dVdInaJOswovhFDJx2bwf2Lps2JCUg0n9w+aaigEz
         2ZMBsbFcI1QSj1oW9IzKPxDHxpynJ4iwUjhYpSDWfSD2tyeTdQ8X15sfchvKSsIkkzdY
         GWgIwJAlvCo6enjVrhGuBGk5NIm5hci5Er17q2hvZiymLb91d1alThEhjNebd1kPBm2X
         r83x8DVIDXjozVvX7wZju9z3aZU287/vxKyU71yMfGIWro6sOBa4bnShGvxYkoXf6W5m
         aY+OQAqOiz0up/914uyHomxumY/HDKSsHLFnxgnBB55wGS8lbWpfB6ZEfmDoJt+IkGiR
         ixqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791789822; x=1792394622;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QYkllvOl+MxaLFWOW+IjD7cSlpy3IDud66Um038owAk=;
        b=nkTJ2U7dLVjIRjAdcOgHnm+TFNumrhRW23oxMi+5hcxz6tFr/FblwVzS+58LuUWQuZ
         Q7M2qCG8FYlIBFnauAHYhxKEdfRdtyIE36yHBWdj+ScxH4W0R93cO6PVgx7IZZwnBxIx
         esPvafRDgreXtRAzcXq6Fihr2vL9eHeFQlE0VMiFFIitA+dMw7+YYqYTmddJ5byy+3Q+
         CG1EU629bi9ITmuTCbQnM/2tIyScdJMAcHzHQ9CY8nTgsuskVHRB4WfFzQXL0Mh1qYjl
         yI1eQ583RfOPPmy8S8caAgpLWfbYWCPV3UhmFfzzwbsDa2Go6SpjpoRSECyvxIsJBA5J
         qc7Q==
X-Forwarded-Encrypted: i=1; AKwUvBz91cs4ZtTBkQh5vQ6yTXcx+CXHjG6MsORID83Loa8lr4mAVnZkv6/xQl5Y9mIqyk1v1/XWN83+ou2PrZw=@vger.kernel.org
X-Gm-Message-State: AFq9FYL2sWhHaN6sshfqfwhQEAb1I0SNQl706wtQmqm2tC0pB4f/zXeB
	tpMCnMnDEDhX73bKOx3ttkTL9sbNrtohgjkesC/ezSXhLWVdj6niqvlCGQ/cS9SdyBXr8/5V8b6
	xNCVBwqNPgaBa/pcvW8ikhpt5wQEsdnIaJeD2aKGTnCNz0yhVFAKUV+Dkfx5t5b3I3mg=
X-Gm-Gg: AYBFou33JuscrKqB0c53V8pxMXKfuh4EX5plgHkrZqQn6byicwgBQ7pNjp6jEF+FYQy
	KuHryI8MCknoQwBpZNBrsVmleYZj/6FCeKCdZOrLVIdN9kT/i7RMGnnn44aPSNF2a9lDzMqx52O
	z7BKo6cYqUPmxI5qux/YBu2uc1EO7WiC8bfIXmjSn2+ReZ+VuBx7sYHNcUkz3IRT9WnJOPjvHx5
	Ub6USzGZM6lBVNcRCRNNKQyYb72QfPdplzJJt+IUO2+Bd8b2CZf8BLavA0bVsbp0IS6a/yI9Fs8
	ERxgmSVDMCYIiBuehTH2/BbLzrONFPRhi0tvxRfQ0r2FsdwmilidSa9UT5p8wQsWUCm3goPoTPn
	KYREyNM1OuiZgJ4fbr2TDVQIDz+jZipDbipTV4DHZcEkLF4DQD0zY6zfwpd1Ar6ii08zrXlNG3u
	ssae1enw7Nq47Askik0sV36ut99bfU
X-Received: by 2002:a05:7022:e884:b0:14f:b80a:33a5 with SMTP id a92af1059eb24-16a5d35f1cdmr18939889c88.28.1791789820851;
        Mon, 12 Oct 2026 00:23:40 -0700 (PDT)
X-Received: by 2002:a05:7022:e884:b0:14f:b80a:33a5 with SMTP id a92af1059eb24-16a5d35f1cdmr18939867c88.28.1791789820348;
        Mon, 12 Oct 2026 00:23:40 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a1becf08sm29748733c88.5.2026.10.12.00.23.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 00:23:40 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 12:53:08 +0530
Subject: [PATCH v7 08/11] arm64: dts: qcom: ipq5210: Enable the PWM block
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-08-dts-v7-8-77bd3d68d850@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAyOSBTYWx0ZWRfX5HJxodLzM2gE
 zjlzAK1WyNMnJ+R4tC4uK7pfefrdun22i0Es9Wr50MWx5Cc4o7O3XnQqdPINMw6t9sEDwZaAvQN
 WKrsJpw2TNyzkMhVDPBOScSMXZHFqOcEZL4l1RZrpGxfg/aTZgVb2xJ5kuxzKsTvDMtVZg8JeTr
 dVuECOVNYxhfOFQ3m/vc5ei37CK9QxpPTOQOFAM0fwDnORbfbN+Gnd+bdH8Db/kxLZGzMVWDTbm
 6ERmQq2Fgonw0H8gWSJlbLjYVc24IV+cOGBbl1FEC8jGDbUzoXOgR8M8B6XONKiW0Pmv+rnkeLQ
 uy2vFzNMYWI76L3LCCl/TaHd+DnFYxrG7iAQUdMRKbR0USWeJoH0E+p6kyUgOZcskXtP5t+lkWb
 dYYFsE2P9ycFGmp2WH2Mlb4UIWz6rMI9/BwJGgcuV7bEqwk4fznPVMYzMmC6fIPxrSob0UnEXEX
 AMGnTJj9hHcb/ojCV+g==
X-Authority-Analysis: v=2.4 cv=aK5lOr9m c=1 sm=1 tr=0 ts=6acc8afe cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=Z1SsOzVGKYioKmY9djYA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-GUID: iCqYwyx-etqf9xKVGf5NH8qr2azVxwEC
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAyOSBTYWx0ZWRfX4hLyu+0yYu2Z
 Rwa4izC0we309BNQzqzS9F798v2/TD9cywlt+skTxrWbQlHT6v0/D0RhrtPnxqoyahZhuZHn2R9
 83A3R/pXNmQ5zONikD1vE3UuR3rBWgI=
X-Proofpoint-ORIG-GUID: iCqYwyx-etqf9xKVGf5NH8qr2azVxwEC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_02,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 impostorscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120029

Describe and enable the PWM block on IPQ5210.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi | 14 ++++++++++++++
 arch/arm64/boot/dts/qcom/ipq5210.dtsi               | 10 ++++++++++
 2 files changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi b/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
index 7f90a2632b07..0f7a8f2d886b 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
@@ -89,6 +89,13 @@ &pcie1_port0 {
 	reset-gpios = <&tlmm 29 GPIO_ACTIVE_LOW>;
 };
 
+&pwm {
+	pinctrl-0 = <&pwm_default_state>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
 &qpic_bam {
 	status = "okay";
 };
@@ -160,6 +167,13 @@ pcie0_default_state: pcie0-default-state {
 		bias-pull-down;
 	};
 
+	pwm_default_state: pwm-default-state {
+		pins = "gpio11";
+		function = "pwm0";
+		drive-strength = <6>;
+		bias-pull-down;
+	};
+
 	qpic_snand_default_state: qpic-snand-default-state {
 		data-pins {
 			pins = "gpio0", "gpio1", "gpio2", "gpio3";
diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
index 910196a23ca7..22ab99ca0903 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
@@ -398,6 +398,16 @@ tcsr: syscon@1937000 {
 			reg = <0x0 0x01937000 0x0 0x2b000>;
 		};
 
+		pwm: pwm@1941010 {
+			compatible = "qcom,ipq5210-pwm", "qcom,ipq6018-pwm";
+			reg = <0x0 0x01941010 0x0 0x20>;
+			clocks = <&gcc GCC_ADSS_PWM_CLK>;
+			assigned-clocks = <&gcc GCC_ADSS_PWM_CLK>;
+			assigned-clock-rates = <100000000>;
+			#pwm-cells = <3>;
+			status = "disabled";
+		};
+
 		qupv3: geniqup@1ac0000 {
 			compatible = "qcom,geni-se-qup";
 			reg = <0x0 0x01ac0000 0x0 0x2000>;

-- 
2.34.1

