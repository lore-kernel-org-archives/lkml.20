Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794462362;
	b=kyCWOvX2GaekvdkMY3lvjiQBOKqcK9CJl5WKqxXqnZNXXbbcADdkrLlJm2SR21V++nPg
	 uo12fQLfNE5y40AFVOTQjEVhDDrM/dj5mV6F6X5AN+/QN3XBXLd67VEGjP0U9ekqnjbVd
	 Ylc9ahOylKaUbGdTbkfN8xHAfeLtBmfUIEvCTjxjQsQbOmD66yAJ2WxDg8Rheh88gV24W
	 EgBKmk2pgLWgHy9q8o3qSflL2HhU4gVEbIgnpA12ChLEAUA+1EJCqKbj/c8rf14kJub3j
	 s2fSS1i2CTT50PW7i8V4n5lrLdxte0oL8f7iHzoyhgKTPOVAh/Oged0AmeYuRCGnBbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794462362;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 X-Change-ID:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ES4raCN3aLHhgz4UDLc5j7WzxJZvAOaMMdlxyP97cFM=;
	b=e2HVBRu+Fj8N4UWuRCE38dz1O3yympZoT7pSYUXgIC8EbiChoh/Yli1ReqcaUVhFha19
	 ssNtI9829oRnRHubBRhRDpkmJarxlPwmMLA2ZO+UV2GoDw9hZSrFRpD0k61PX+9KGsDBB
	 tjG5zu5uSkyGT8snow7M0S3+cszGQWIFVrMmHWFKwQ2pboA2sgAj0vtCD4VxngpnEtjoo
	 Ily5NupTMf2Vvqt/2J1l5X8rCgnnuuj11ViZMzbTfdSlkvYRhV2eezEwzA0fOifk8PwSk
	 2C0V/bORMTRHfCm0akdVdjjK4u42GqeU7rYRdjDnnO4cW+sN4Dj3FB3zAuwHRZZ9J8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="XcTKBA/l";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ptgz3xq8;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02DCD606A32E
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 05:46:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02DCD606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XcTKBA/l;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ptgz3xq8
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC2ZfVJ2135834
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 05:46:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ES4raCN3aLHhgz4UDLc5j7
	WzxJZvAOaMMdlxyP97cFM=; b=XcTKBA/l/X5PQWXChbcstZOeCJUc7dkXnpt/Pa
	b8IZWgh1jC6tRllbt7s9y7qz8HqIaCt3VD48x9x6Mh7atzaPSZPsRmLi/OgB/wEW
	/w5DNpTGqnVhw5vY827eHO7VWvsHiw3+TiYHAQY8bC23zUhkbu5csP3NZKzw2Eo1
	3rWUKz+xhRaNu+g1V9q7lZnBWRMHL/Ub8GIfgghU5DHSmHWkw/nTkJ6rAZQGUyvY
	h3n6wvAoFWdHhvQYoTSUxbMrz6u13V/xqs7HJtsavjlsx8DxU7Ppiq7IRSRnnqPN
	mPar68103OybumnYa+RtRX0PzvHBy/xoifn6vuQ1VJF3u7mQ==
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvpjjv6nk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 05:46:00 +0000 (GMT)
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-4adae31e4b1so4795817fac.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 21:46:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794462360; x=1795067160; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ES4raCN3aLHhgz4UDLc5j7WzxJZvAOaMMdlxyP97cFM=;
        b=Ptgz3xq8scrmlOYtYbHRxEAULtvh7vbXwV6rShbbU9Iip0kXwqG73k+80cQPML4v/1
         XlYBz5fKpZdazzUXlLfRXb1Hnc9BOMpGxFaB7dv+4Mrf6LI21DMIrjQEjoqpiovxM5e3
         dn94PtFdN5cLRMiDVBIfFUzv7TSwSLJ3X+jHHzY3HDTFrWjtC3tg03VBNCnzzkcB/0mJ
         yTB7QLnjCc9n1+e6cstpVC8dCoCnopTm/ugWp2qWqH+qNmz27JM7Ckp9usAr7LHPzt8F
         KjR0h6WQ3mV9Et5LSweh1EA7HkyEdhCnBPqThAxdYcD4O8s6kc/owdG4GqzIBM+/am41
         n/kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794462360; x=1795067160;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ES4raCN3aLHhgz4UDLc5j7WzxJZvAOaMMdlxyP97cFM=;
        b=AAX2EF4r9X6j8lMqrmhnjwscuBE4KLuwwcS9/NArkLy6Doua4FnH/y7x0YD2GAu7U0
         KCxMlXtkcXjATn7oDmuu26LRAuGVee9hCORXPqvNvubACS+Yg+Ju7Dm2ThpMBOuLXGgX
         uxT4kYtS1t9YXze7pOP8eD9J98WFOhu2GK9T+5GEcWq4BScjl6it34Tdj+sqn521OVXN
         SWdKsq8H41z3DjZLCJbjmVlJd/HfzR/BUxm3MrHS+hncHi7ZDged9WFZHI6VhjpBOt+0
         xo77Isb/dINkW6Bnul0mRo25ht79GV7vQoOw6f0HVHmztHN1aCKRXV/aD6XnSYfDMdlg
         rsPA==
X-Forwarded-Encrypted: i=1; AL+hErFJhhTUP8qOJd70zHQW1KnXfVTSz0ZmxSypcY3rEgjgxBfOjr32VBFfNcX/IHEXj/EqtKCfEnbga7/RrDk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8SHFJTXvSwJjMAGHhpI2kKPlOdXzf6EGQlbWXvMnRkrPv07UB5
	WMlcCgMGEQf0I1tmwhY+q1KG2cyvcTBQ2cNQC0dAeBf1dPofQDrV6AHxeLlLlco4gK1/HuuYRSE
	+b8A5SHdwyO0OrNAmAjRIU28ugX6zu50Jm4WbOJ2uXfIjJ1bbw9LzEpkmFnfSz6zAUKA=
X-Gm-Gg: AYBFou3U9+75Rm/hX7GRQHYCX0V/+/q19W4LPUHx1gyd5LX9hX/nKBxR6QGEWKiJo7l
	DjgGUM/Sux4nTPka7h1caoYVROoTO/4ueGP95aEOXrRxYWuwhrxkKsK6qHM/vezvGu3Y3Seyi3H
	Imbp6RFSh5kx2EqbMtaY4qZfeCENMjq7lmksvhmMa4oQ/kTTOyqc0ybbEUhIG8XihYpOx+RY5xJ
	kPq7bYqxrL+D0pMpfdLjkqAYA51s0e3V9J3oqx6qPCOWw5RZ22oh6wvK9Cz4dPQFN9hU49DyLM9
	v01d0j0HeYi43sRrlEmr7ZSmLGrH1uIkUC5JQUTrMwk7K115qPxN6+w1VNat8Zj2d0jpB3X9YM/
	Ldi86YZWOYUrmn92mLc9qImgDYGDnFLwAndBi4xA5YLAU23q6Rioe+DQOkYCDkv3Hvw+PPcb+e2
	R1cPc0x7guFnKW3mzKt9n0ImHH
X-Received: by 2002:a05:6870:bacd:b0:4a7:4324:1814 with SMTP id 586e51a60fabf-4ae46c24e4cmr3934200fac.59.1794462360078;
        Wed, 11 Nov 2026 21:46:00 -0800 (PST)
X-Received: by 2002:a05:6870:bacd:b0:4a7:4324:1814 with SMTP id 586e51a60fabf-4ae46c24e4cmr3934185fac.59.1794462359570;
        Wed, 11 Nov 2026 21:45:59 -0800 (PST)
Received: from YUANJIEY2.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ae22f6a1c7sm4563844fac.6.2026.11.11.21.45.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 21:45:58 -0800 (PST)
From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, yuanjie.yang@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com
Subject: [PATCH] arm64: dts: qcom: hamoa-advantech-som-db5830: Enable DisplayPort
Date: Thu, 12 Nov 2026 13:44:18 +0800
Message-ID: <20261112-hamoa_come_dp-v1-1-a77597e29e04@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
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
X-Change-ID: 20261112-hamoa_come_dp-40a7a09236fa
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAyMiBTYWx0ZWRfX/vEVYXEyBes+
 RJbeZER3pHwtkQtFT0f2h8naUECtefMSap6Ehwrm11xsxu8TVyq62rHg0ThI8bQMMqUDK0uC+Qo
 MUsBWnmzCnDV11mOU0GPp+0D8pbRhzh1cG7OmrJRT3lYA6kd4PJUeOR+LwzsKRdsfw44M2mnxDL
 fAKKbgivL3JVr+kjXZKlmveCd93+xB6JwFf/veu1FfIBHFYplFW4CYk7dA/BYs4M8mvOWnyR32/
 JBU7WZhk09DqBOYUGZjroqUaiqU9XgFzcpRaZnx83yK5dXpI6jXSzM4rJLoksZc0eUZUzFXmWx5
 4olj/qu8UnHSzgzGikZOTvTbZZzfMyYFrpW/aefLquwlQGz6XiYmDLHNajH2GZ0n0j+Ht6E+0Vr
 56YMNidJ58D57G8unCcrezGMD3XWN3UlgEdQIEGs0eCoHRajNWVmGHxIs3c+tmYtosUWI1tOm7q
 EYVQJ+irNCy4R9MsCAA==
X-Proofpoint-ORIG-GUID: OWkRPc_FKFUSzHpst-nxX70i51rY7c8-
X-Authority-Analysis: v=2.4 cv=FeuiV5+6 c=1 sm=1 tr=0 ts=6af55298 cx=c_pps
 a=Z3eh007fzM5o9awBa1HkYQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=VT6PoHGwS4LR_UsKkTUA:9 a=QEXdDO2ut3YA:10
 a=eBU8X_Hb5SQ8N-bgNfv4:22
X-Proofpoint-GUID: OWkRPc_FKFUSzHpst-nxX70i51rY7c8-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAyMiBTYWx0ZWRfX87YOgdiJ0yS4
 06lXrf+C7eAEdf3MVlmoa+Qy+KqunOc6+6QqiZzJC2InOn8Mx8lvYd5+dVn9t5srcXUWCYD8dwr
 bHJUgfgvxgocrJ9enmVBdXViHEi+yx4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120022

The Advantech SOM-DB5830 exposes two full-size DisplayPort connectors.
Both of them are driven by the DP0 and DP1 controllers, with all four
lanes of the USB_1_SS0 and USB_1_SS1 QMP combo PHYs routed to the DP
connectors, so these ports are limited to USB 2.0.

Describe the DP connectors and connect them to the QMP PHY DP output
endpoints, enable the MDSS, DP0 and DP1 controllers, and configure the
DP hot plug detect pins. Drop the mode-switch and orientation-switch
properties from the QMP PHYs since there is no Type-C connector, and
switch the corresponding DWC3 controllers to USB 2.0 only.

Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
 .../boot/dts/qcom/hamoa-advantech-som-db5830.dts   | 121 +++++++++++++++++++++
 1 file changed, 121 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa-advantech-som-db5830.dts b/arch/arm64/boot/dts/qcom/hamoa-advantech-som-db5830.dts
index 9d87c98befc6..e2c2a162c999 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-advantech-som-db5830.dts
+++ b/arch/arm64/boot/dts/qcom/hamoa-advantech-som-db5830.dts
@@ -24,6 +24,55 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	dp-connector-0 {
+		compatible = "dp-connector";
+		label = "DP0";
+		type = "full-size";
+
+		pinctrl-0 = <&usb0_dp_hpd_default>;
+		pinctrl-names = "default";
+
+		port {
+			dp0_connector_in: endpoint {
+				remote-endpoint = <&usb_1_ss0_qmpphy_out_dp>;
+			};
+		};
+	};
+
+	dp-connector-1 {
+		compatible = "dp-connector";
+		label = "DP1";
+		type = "full-size";
+
+		pinctrl-0 = <&usb1_dp_hpd_default>;
+		pinctrl-names = "default";
+
+		port {
+			dp1_connector_in: endpoint {
+				remote-endpoint = <&usb_1_ss1_qmpphy_out_dp>;
+			};
+		};
+	};
+};
+
+&mdss {
+	status = "okay";
+};
+
+&mdss_dp0 {
+	status = "okay";
+};
+
+&mdss_dp0_out {
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+};
+
+&mdss_dp1 {
+	status = "okay";
+};
+
+&mdss_dp1_out {
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
 };
 
 &pcie3_port0 {
@@ -112,8 +161,80 @@ trip-point0 {
 	};
 };
 
+&tlmm {
+	usb0_dp_hpd_default: usb0-dp-hpd-default-state {
+		pins = "gpio122";
+		function = "usb0_dp";
+		bias-disable;
+	};
+
+	usb1_dp_hpd_default: usb1-dp-hpd-default-state {
+		pins = "gpio124";
+		function = "usb1_dp";
+		bias-disable;
+	};
+};
+
 &uart21 {
 	compatible = "qcom,geni-debug-uart";
 
 	status = "okay";
 };
+
+&usb_1_ss0 {
+	phys = <&usb_1_ss0_hsphy>;
+	phy-names = "usb2-phy";
+	maximum-speed = "high-speed";
+
+	qcom,select-utmi-as-pipe-clk;
+};
+
+&usb_1_ss0_qmpphy {
+	/delete-property/ mode-switch;
+	/delete-property/ orientation-switch;
+
+	ports {
+		port@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			/delete-node/ endpoint;
+
+			usb_1_ss0_qmpphy_out_dp: endpoint@0 {
+				reg = <0>;
+
+				data-lanes = <3 2 1 0>;
+				remote-endpoint = <&dp0_connector_in>;
+			};
+		};
+	};
+};
+
+&usb_1_ss1 {
+	phys = <&usb_1_ss1_hsphy>;
+	phy-names = "usb2-phy";
+	maximum-speed = "high-speed";
+
+	qcom,select-utmi-as-pipe-clk;
+};
+
+&usb_1_ss1_qmpphy {
+	/delete-property/ mode-switch;
+	/delete-property/ orientation-switch;
+
+	ports {
+		port@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			/delete-node/ endpoint;
+
+			usb_1_ss1_qmpphy_out_dp: endpoint@0 {
+				reg = <0>;
+
+				data-lanes = <3 2 1 0>;
+				remote-endpoint = <&dp1_connector_in>;
+			};
+		};
+	};
+};

---
base-commit: aaa2f954c21b205a0bcd0961e5b2be4e82e58455
change-id: 20261112-hamoa_come_dp-40a7a09236fa

Best regards,
--  
Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
