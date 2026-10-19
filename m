Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E865456C64C
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792420222; cv=none; b=DzBkBqYRUoYtOp1Y7ndbf3C+b/VM65mE+lx/e5f0rIhLQaXirtwuZHYgevohAZIx0D51MtZJ93xItUQRBMmJ2co5zSaxbLTJ79GrpC5bNiykcI0zhqB7UH+ndK7b34V9Bnb9V8xJ3QKHZZ3CeR3VyVwuKEihY1XKbBpviGycBdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792420222; c=relaxed/simple;
	bh=mLKnD6F7P/KVdV48EhUstdthV0Z+5LNyadUX7Ky+DkQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=mTfAp9uq35XJFULAbrjBmdtMmyipAJvG1t28gB6F16JDfkFuXKBpre0befXa5n8uFfM36q7Liv+an8Lc8CseUZCWzpv2EmIBlVfx4lYAuixhnr4bbnvXIGgsNneGtARpWtsJjGcet1HOidHPU6WwMogqjwnNbnE/9HDJ+FfIq+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jN8BjKSj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J660YCC9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jN8BjKSj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J660YCC9"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JE0LH03401421
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:30:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=9hb//hYgrxgYhQ/JjWESlh
	7cLZSKlG04cGHqK3c8yCw=; b=jN8BjKSjmbFtSl58H1sPA3QASOXaYNh9DacLSF
	bl1QHGa0byHIXpyyQe5+1l9cYBUJnsyhI5XV4t22JhNqUKHjsJfRFq+QFDdyw2F/
	T+tDx2li3+Ah2m1uK0Dhb4w+XBaSCiHJRlXWn9dFpxUojktL5MTjftCTz5IR04Jm
	+k38Y5B7+I6BRaAmH1RRHrYKgGDLFF2o7k5rYXvTYP7Qc38AIBOkXE/vVS4W234e
	jW4GcY6kX4wyPNCuLdSm+v6gDi7AMJZf/rOgYCwoxoNZjNJrfvPMjuSOI380ZEsE
	yMEege1yhkBy/3IWUlXyv0ynwM7poHwXE16TObvaUyYbXGqg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdftn1ees-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:30:19 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f13c143c8so413537785a.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 07:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792420219; x=1793025019; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9hb//hYgrxgYhQ/JjWESlh7cLZSKlG04cGHqK3c8yCw=;
        b=J660YCC9fvRA/K+NZKgy0KReTFTZzFUj82M2Z0wCGH2TNQHE9qzT9lD9aYvYd2sbMZ
         iGr0MK8QBR9emQoBJo4TMW+7kNJu1ZuW5+L4C16WbZoq1Gc6IKunpRntbxgVSZ9zleyF
         GYQgRBnA3JWRJZErF2S13XABSugH0IT4U/cNp68jjBtA15cuCLLnuI0yVBp1oHTqgQS/
         p+rXT+xeNSwehxAsnVoDRAjd6+dhEUfwnarXdA1cjFmZ/LkScqpQMmtEZoGV/Ji3syDh
         njuPzpnXCuMgTaK5wMsSxj5ddhpmLpvjW47wj0rpRh1WG5KOsRpzziu8mV5AmF1cDBku
         0YWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792420219; x=1793025019;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=9hb//hYgrxgYhQ/JjWESlh7cLZSKlG04cGHqK3c8yCw=;
        b=ltMySYn0k9+KOGtnvzkoumodCLvHDhMdJXPHkQuu0+eurtQ7U5ZYqRzkfIy4RyP/Hg
         l55k0lSWnllZaETV/doB1f+dWJa/XoK8cPIGTljIS6p352HTgdi5spjylwJSuSdS+zD6
         5njtFi7BDWUOagoab0SiiPpZ5JoN7XzVRCjumw5RZH5cl8o50qnycLUcXDcNJMJIcOMo
         rlOijwLSE7QKLDyDJ3KbPVGDtzKkPlB6vLSiN4YgbrR1O4LTMxIEeOmSDrWUpgkuyYEf
         P9IVNkJsGSH95+WaPDEzwzSdoq806ADwqlszq/WhmRzYkNr5PwyoKKnIzzYqKhiqyvwJ
         V2Hw==
X-Forwarded-Encrypted: i=1; AKwUvBwRAtuLW0CWVmw13xYqMzrGdG0Pb1MviqM5Y6qi3jUKXvU49yyAspD5YVXIHqml7K9KTfsPyNOeFAErg3w=@vger.kernel.org
X-Gm-Message-State: AFq9FYI859L/bggYBvSE+r460G3XKLcQDU/Bcr9RZjJhr/jJe7DmrA9P
	siHBGvf2pAmiRZnkS207OSTZmVHy+j3P5GMqj/PbE/4Bi7ECbWu2/FoVbbLCBSiNcB5PC8UHCaS
	fLUnyPD/8xUlt0w4k33eWtp+fS08zbkMCEKBObIqiNhaIj8He7LOgk5nTSsyRDOGiKZY=
X-Gm-Gg: AYBFou3MgFLngSNr2PPD4FXH98mScAM3xBFb/9eUY1kJC+9oJDuhH3U9UfcXrKPw4vY
	I3GpNQo7Yru8gCIn0LoJKPFiqjpXT6M0CHSjYG2njgg1ZoLc9I/jD5XIcQBdiyLYKNO1cmyRbAP
	XU8FFmAjVhhpbtDoGQoY2PGdtP+fEAyvJivxu9DIUadSPeNzBX7+FSoG1UDh7SCSJ37eM6IF8oa
	TF/7fJ2GPEvudbodJqMtZrwI4L7evbvB34PJWm6bVkKQWxGwAMEMV4IHM31xzmis7lBhPEb1rRH
	y30uh++GpgdmTnZ+LXeCoas3wZ/aVpJSulcNbtCP7BZucMclZzcwlHnxQL+ARtq2f6P2Iag1a53
	TilLMDznczhZ/atTyWcJcjgzThYJJauu7jGfms4PemvfKXUpDeozW/xH+kV+9Krfd3SGpWM9Chf
	2dAhcVAvfC0PoF
X-Received: by 2002:a05:620a:2948:b0:93f:1445:82a5 with SMTP id af79cd13be357-93f29dd2334mr1348142285a.79.1792420219099;
        Mon, 19 Oct 2026 07:30:19 -0700 (PDT)
X-Received: by 2002:a05:620a:2948:b0:93f:1445:82a5 with SMTP id af79cd13be357-93f29dd2334mr1348134785a.79.1792420218519;
        Mon, 19 Oct 2026 07:30:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ab4a0e0ce3sm2853281fa.29.2026.10.19.07.30.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 07:30:17 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 17:30:08 +0300
Subject: [PATCH v2] arm64: dts: qcom: sda660-inforce-ifc6560: fix ADV7535
 interrupt pin
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-ifc6560-adv-v2-1-ade625df3fe3@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAG8p1moC/22NwQ6CMBBEf4X0bMm2AgFP/ofhQNtF1ojVLjQaw
 r9b8OplkpfMvFkEYyBkccoWETASk38k0IdM2KF7XFGSSyw06AoaDZJ6W5UVyM5FaWp0ShcaoDY
 iLZ4Be3rvtkv7Y57NDe20KbbGQDz58Nnvotp6/81RSSXrxqjiWDoAq8+eOX/N3d36ccxTiHZd1
 y8tCPG9vwAAAA==
X-Change-ID: 20260920-ifc6560-adv-b8ed1242008b
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2445;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=mLKnD6F7P/KVdV48EhUstdthV0Z+5LNyadUX7Ky+DkQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq1il2JoQahRfzHUgLgv7KEv3FJrhsijqdsunsm
 pRdFqyVNI2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatYpdgAKCRCLPIo+Aiko
 1fhtB/4uaOqlVFP+zAVuZV8xqtzJ6slk1bWrWeFV2UY3LDJtfQNpV2PYy3VfQWuCYLGfn8azcFq
 jbH52tseycU1pUSslnA5LV6E8AUg4Er3QU3uhS5cVPRl+GJ23h+EnZ045WpmNCR1e4nJ7UiD8ed
 ec/w7/xRbF99b6kO8QhJsl+6nIZQlo2sDGt5FOq026uFACnG8ucEjkFA3fYuN0aJZZtSJ+tBcHo
 JbqndGlTVE/QIEBIbLPkwxFpadAYfKkNVw4aQl192csEV4RkUHye48XZ0rtGjoq8Gd6ucmVxgpK
 EuzAPeQeJErMwSRsBCRKi8HCGETtZdQzcfVH8vwLK+W2dmPI
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA1NyBTYWx0ZWRfXwgpYax2UVEFM
 xKMjxtZ97R3GC9lhskFpQhSU7uMD0+zmI7fK94ZWuMocA1G+aRCXb+MpEIKPMNVO9Q8lFEEdv38
 zT1ySgQILK0LQU/kdl7uw75E1KPiS2A=
X-Proofpoint-GUID: QnJxJ0ZV0sXwGvWETXMeEO1po0IJcCs4
X-Proofpoint-ORIG-GUID: QnJxJ0ZV0sXwGvWETXMeEO1po0IJcCs4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA1NyBTYWx0ZWRfX/t49F904zsVb
 CP5bVlydTjLRkK9+U+sWgbg4fMt39JDv/+kC2GuSMW36ZrfFR0EG8Zxq7m18LaXbm3YTcvsbugu
 mhC5OxEpInsBaNxdZyeCOd6pkYu4g1saY4/wCqtfBRdN+mtWhWD3nZXPAw+3+F/MMw+BoQbdNIn
 bCE87+0qT5UhY6XE5Gl/Zyypirl/a4E+MeOxGQffhAJFG1ZPvU4jVcS4s6wiHyrgYAB7xRwc3yf
 wXFVJ3J0iBVDOIUCuZpbPMf7nz9BNZjLnQ9jjMOr7w5LvHLtMktm18bZdbDcIRID86F7RpTwsAO
 UXQGQYhrk2iPpBTXiH7WbZP97NyKV1gCFobpaWl/Au5NCddq5ev2TfZt4CogWjyUpkJXbp1uBwM
 LGI1zyzAcy+wLGjT1oVmC/YTp0Z3OJb/moMB/XF5hXl/QrAe31PTvtzpFFIYgUYTH+e9voWgs52
 3uHbogCSk5TNbDQdBRA==
X-Authority-Analysis: v=2.4 cv=OvTaWC/t c=1 sm=1 tr=0 ts=6ad6297b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=JDyqL9-wDnDoAeLICTYA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_04,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 impostorscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190057

Probing the ADV7535 HDMI bridge fails on the IFC6560:

  gpio gpiochip3: (800f000.spmi:pmic@2:gpio@c000): gpiochip_lock_as_irq: tried to flag a GPIO set as output for IRQ
  gpio gpiochip3: (800f000.spmi:pmic@2:gpio@c000): unable to lock HW IRQ 10 for IRQ

The bridge's interrupt line is PM660L GPIO11, but the board never
configures that pad. pmic_gpio_populate() reads back the state left by
the bootloader, which is PMIC_GPIO_MODE_DIGITAL_OUTPUT, so
pmic_gpio_get_direction() reports GPIO_LINE_DIRECTION_OUT and
gpiochip_lock_as_irq() refuses the line. Requesting the interrupt then
fails and the bridge does not probe.

Add a default pinctrl state switching the pad to digital input, applied
by pinctrl_bind_pins() before the driver requests the interrupt. The
ADV7535 INT pin is open-drain and pulled up on the board, so leave the
internal bias disabled.

Fixes: 34279d6e3f32 ("arm64: dts: qcom: sdm660: Add initial Inforce IFC6560 board support")
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v2:
- Dropped extra empty line (Konrad)
- Added a note about pull-up for the IRQ line present on the PCB.
- Link to v1: https://patch.msgid.link/20260920-ifc6560-adv-v1-1-89b1435d00c2@oss.qualcomm.com
---
 arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts b/arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts
index 9e14f53b552e..10b454cc4218 100644
--- a/arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts
+++ b/arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts
@@ -170,6 +170,9 @@ adv7533: hdmi@39 {
 		interrupt-parent = <&pm660l_gpios>;
 		interrupts = <11 IRQ_TYPE_EDGE_FALLING>;
 
+		pinctrl-0 = <&adv7533_int_default>;
+		pinctrl-names = "default";
+
 		clocks = <&rpmcc RPM_SMD_BB_CLK2>;
 		clock-names = "cec";
 		/*
@@ -285,6 +288,16 @@ sw_ctrl_default: sw-ctrl-default-state {
 	};
 };
 
+&pm660l_gpios {
+	adv7533_int_default: adv7533-int-default-state {
+		pins = "gpio11";
+		function = "normal";
+		input-enable;
+		/* pull-up on board */
+		bias-disable;
+	};
+};
+
 &qusb2phy0 {
 	status = "okay";
 

---
base-commit: 2efb7a11f1aa4d2dc285fe2680cca22cb9f72f64
change-id: 20260920-ifc6560-adv-b8ed1242008b

Best regards,
--  
With best wishes
Dmitry

