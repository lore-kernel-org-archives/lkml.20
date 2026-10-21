Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792579639;
	b=38b9R+kc7Kq63Z9jnJFSe7RqxRqW7GmFd6rL40BLdji90rldxbwe5FGUDk2/wuILtbrl
	 3VHGkhsXngsxpman7RGtGQ6PSvFwayGshpVAWqEgGB4BE28+cOnmTMUdQ6J07mW+Wef++
	 S8jnKOTNzLZxT2IG33oDdMkAfXHpOFxR5u7RWk7kiA47gLKe0Y0QE3JWd7yAAB94aYweP
	 +uh3+5f1GRrrA2JGZHrL2wXPwsBkEsTsc/dO8GjOhq5nuC0M2wpewoP85ZAYnEdK/2WWR
	 UUmqeYyMImUdwyCAia1lu+dfc835U7rgTdQ/vj8p/jalYUy/xPFfGcYuA/HFjU8h3Yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792579639;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=gWvlJD9jqoJDzMW6TsnVK/PUEbWsSXVaCGhDNvYutCY=;
	b=ntJEGeinf/MGU+r23GEQDpG7CVOIs3sbI/0owoGShn+8m1xOY1UK4xy+9hoqAq0gZsT8
	 iIEXfsxJ5T+yho6TX8nfOStw1/d1e6nJzS0CZbeEJFnP//pHxFNjFqeYMRPfbkykWllKz
	 YN3EJ2Mfes/nvunNIcf+oOTNNZr5XsJdpmelQ43HVOzOYqYEJFt6CRf8Pl1XgSnsINAkQ
	 RlIOYKKBBBpBAZnOb0uKyCeadeCVyc/OS8GWOYKvB1yQurbFGFpNBelhrd5TujEJe09/4
	 EFEfmZX0WAqfhlHS3raqcsleeiPh5e3td+sgiQhc4Xvmkhk6V44+klkjEsyqxWPFQKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g1WfvW0A;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KfaoW3bu;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 387A0606A31F
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:47:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 387A0606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g1WfvW0A;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KfaoW3bu
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LA65iX768752
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:47:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=gWvlJD9jqoJDzMW6TsnVK/PUEbWsSXVaCGh
	DNvYutCY=; b=g1WfvW0AaESZyUeMTMvdTSfTxSVfmFRWxZ3a25yZ0QSUwGVtnm/
	o08gqqEqM0GBDrBBESbaQ1iewaOTTvC+1lxcBB3NZvFyZ57QVJxSMUO/UMgvIs/U
	lNrzVpTH0JhF7EEgs44kIiDDT2KDhPg1n1fALdFOTwiR6YjPiPBwj3oe3VRoA/sk
	Imw+QyV3kNEO+8X3Zcmdsf90VcQQLfugnhXSGpwKDgoYeRA4ba0sb15GIaGlPAMg
	/2LLvhocCaVoBxoUQx1ew/vD/NvCpeKBOn8sGJumejPeX9nOj2jhNao71obc4OIY
	lVoZ/AISLtFYyVbi1e1O2dXSIHzUEwEmocg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hegs02rk1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:47:16 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3abdbb640b2so166988a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 03:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792579636; x=1793184436; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gWvlJD9jqoJDzMW6TsnVK/PUEbWsSXVaCGhDNvYutCY=;
        b=KfaoW3buMWcx/84GRsAvQrQGtmNyIyxJgzU8o4RDO/B8oNYft9tchHiv16M05ZslU4
         WJ0wvC62ev0dcaPHFcI+xEEGanwJYkgVKhrE0d4XmHcufOBqHJ1kyo+vwmduiU4x8fqr
         DyQ+hK3bK+K/pI9J39IHOpBItru/dQJgiVTDjWNVRDGno5tYy/79nbk5w59qpjufBAO/
         3cNTDqcscdlnv7YE8Nl0+sKA2vBgZy0iwudmC9ZvAKdrUrTjOBbdlOwBmJLEXcbdQRxC
         rddbXXbwLz5slZfh85Ye25NjFEJf3upoZOMRVzPEA3oFdtE7tk/IjQgUJ4J/aeaMvGS6
         scgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792579636; x=1793184436;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gWvlJD9jqoJDzMW6TsnVK/PUEbWsSXVaCGhDNvYutCY=;
        b=QW3rn+VMBETMVaTrXXSgvYYAgynunVyrVmSDxkH1O8Cp+EP9g2d9RsPwYYyyxJYj8t
         jSjxgW0h/umv0fH9rtAEu6VrWwTwA4S7qwHyF7Dv3NRoE7RCvCdAb3qsttSOjcub8EP4
         4DEtC3qnqDbkGCqf2IqkdDtOmVEyiJIWaoX51vMlWCCZVetVyz4Ytg6l7dLvIDVOTf7e
         kelATXZwJ7ag3ivy+sdOU0aQ4GYH8xixW0BSYKkugqeuioeRGlirusBv5H4O20WF3mmi
         IGKRuDHtksJsAnJ5G2MLWxFWl/l+m9GA6x8v2yiwTaZOEJVsUmL3zkgkYslAFyDhA8px
         XDrw==
X-Forwarded-Encrypted: i=1; AKwUvBy+HVBItZ+s0qlO0Ih2dvsm7S8tAeXi/8slwCeE5DNAEP9xVhcekeQgjCWpmFkXOm5ld1RRDRF4ZhLOLEE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKf3pJtnHGGCFNwPGwVilKdLsI7nvsy1BI88wUlGqXfo0HSpyKF
	mLG259oHoAREqHlApPVuaQQiUTt9vePQeAC99SBay9BP3hvZdE1qvj88pLo/a+TGnWtDnFhKiw8
	AfM4Ieiia3Jqb9SMl1Pm5QRhC/UakwpeHYQrKERrNT+/qwG5GiWDToIEeE2td4HXfdD1ILTPMJI
	M=
X-Gm-Gg: AYBFou0Rqnf3EmNys24GVeg50ALcGXBeN8x19kFUae/KiwfP+ZPFW2QBYyGvl5kaEpe
	EWNe9d35n+wrSGhUKIIAypfJx0dTWZrn6lsrYA/vJsGZDx5v7fBwvggNbLS8QbrpYzJ1zPTk7Eg
	TJyU+wiE1v8sO91Bd/CVvRD1jYSpRvJ5P0u8jLnXETK59ZAe8r0RmUZeS4CQ/xZWg6GCqT9JlE6
	FJT/sktlaN2C46iFOYBdiiXVLM/RV5roLC1YD0+glX4HNdiRepOG7wf7QNnCyOH/kvJdFg6uZut
	0yNLO6jqigQKs96f//0zG7foX+ed10abzHRibFYbJDAwMDrWD5Or+FzDDAEy8QbrDezjWE52MXV
	ChV4dc9IApKWNdz+vrIhIrE4=
X-Received: by 2002:a17:90b:4c0f:b0:3ad:818f:3db4 with SMTP id 98e67ed59e1d1-3ad86dabbcfmr2842878a91.6.1792579635941;
        Wed, 21 Oct 2026 03:47:15 -0700 (PDT)
X-Received: by 2002:a17:90b:4c0f:b0:3ad:818f:3db4 with SMTP id 98e67ed59e1d1-3ad86dabbcfmr2842844a91.6.1792579635532;
        Wed, 21 Oct 2026 03:47:15 -0700 (PDT)
Received: from hu-weiden-sha.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad85f6ff0dsm1619244a91.4.2026.10.21.03.47.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 03:47:15 -0700 (PDT)
From: Wei Deng <wei.deng@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_chezhou@quicinc.com, cheng.jiang@oss.qualcomm.com,
        shuai.zhang@oss.qualcomm.com, jinwang.li@oss.qualcomm.com,
        xiuzhuo.shang@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com
Subject: [PATCH] arm64: dts: qcom: monaco-ac-evk: Describe the PCIe M.2 Key E connector
Date: Wed, 21 Oct 2026 16:17:09 +0530
Message-Id: <20261021104709.1428234-1-wei.deng@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=S/NMU4sP c=1 sm=1 tr=0 ts=6ad89834 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=9xWqd1REYw3mqEFhcE4A:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0MiBTYWx0ZWRfX4dMTKJcB91fE
 5KQd3FIweXkld0ZB+7qs8h8vR5XBS+QmqXHVx+uW42XwVJZNiSQ+xxE/PBupJ/98rGJKsKs9itE
 LNi9+pI3X+UzpntJieyhrRgVWGXTcnLz2i2c6oGAH/43GlvCG9et3RRgmpWaxnV+nWgYH+K0EuJ
 ES9O/9ohecjymxk/GU/IkB3KMjGAnfRSexk1t599MaqZE6W19FV67mi8ye8iYHmvyrMYWQyWleJ
 lmEv8Qy1uwylBtypCSdfyF7VMbZb4nOZM5Ich6b7yvewF2MOKQRB/x4/vwdXfk/CW8zDZ3pmgiF
 KGU4/UJQzdXfAsyQCrUtG5vt/CjT7nvumpoVK4iQgpRzJ0OA3AtUvr6mR0TDfUsKGSQtDM1tOlw
 Bd91og5INJYHbTDgUPD3xBdndpGIN+qVyueqO+aX+Tk13f+2JZjOjdyJBGEnwZwdWBDlwjy8BX7
 TqIYmW8svFVAz7rUCeA==
X-Proofpoint-ORIG-GUID: DR155pFg9JLvniX0muyY32d4PIvesHK2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0MiBTYWx0ZWRfX2zk0hTTxrT/G
 /vUq7NOTVYbpQMObJfGsWhXi4r1zdgDihCH5ny+Jd0Z2YuAWYzA6+1558KVVtg1HCvmEouYP/hr
 crP7P0YiyJ16zniDYGcgsynLFhUwwdM=
X-Proofpoint-GUID: DR155pFg9JLvniX0muyY32d4PIvesHK2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210042

The Monaco AC EVK has a PCIe M.2 Mechanical Key E connector to
connect wireless connectivity cards over PCIe and UART interfaces. Hence,
describe the connector node and link it with the PCIe 0 Root Port and
UART2 nodes through graph port/endpoint.

The port/endpoint nodes are defined inline in the board file rather
than as empty anchor nodes in the SoC DTSI, so that
of_graph_is_present() only returns true for boards that have an M.2
Key E connector present, preventing unintended pwrseq probe on boards
with soldered wireless chips (e.g. qcs8300-ride).

The connector's 3.3V supply is described as a fixed always-on regulator
(vreg_wcn_3p3), which is required by the pcie-m2-e-connector binding.

Also add the serial1 = &uart2 alias, which is required for the
Bluetooth serdev device to be enumerated on the UART2 interface.

Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco-ac-evk.dts | 60 ++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco-ac-evk.dts b/arch/arm64/boot/dts/qcom/monaco-ac-evk.dts
index 6f3c3ffefe34..3780642fe483 100644
--- a/arch/arm64/boot/dts/qcom/monaco-ac-evk.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-ac-evk.dts
@@ -21,6 +21,7 @@ aliases {
 		ethernet0 = &ethernet0;
 		i2c1 = &i2c1;
 		serial0 = &uart7;
+		serial1 = &uart2;
 		serial2 = &uart6;
 	};
 
@@ -47,6 +48,38 @@ usb2_con_hs_ep: endpoint {
 		};
 	};
 
+	connector-3 {
+		compatible = "pcie-m2-e-connector";
+		vpcie3v3-supply = <&vreg_wcn_3p3>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				m2_e_pcie_ep: endpoint@0 {
+					reg = <0>;
+					remote-endpoint = <&pcieport0_ep>;
+				};
+			};
+
+			port@3 {
+				reg = <3>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				m2_e_uart_ep: endpoint@0 {
+					reg = <0>;
+					remote-endpoint = <&uart2_ep>;
+				};
+			};
+		};
+	};
+
 	dmic: audio-codec-0 {
 		compatible = "dmic-codec";
 		#sound-dai-cells = <0>;
@@ -91,6 +124,17 @@ usb2_vbus: regulator-usb2-vbus {
 		enable-active-high;
 	};
 
+	vreg_wcn_3p3: regulator-wcn-3p3 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_WCN_3P3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
 	sound {
 		compatible = "qcom,qcs8275-sndcard";
 		model = "MONACO-EVK";
@@ -657,6 +701,12 @@ &pcie1_phy {
 &pcieport0 {
 	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
 	wake-gpios = <&tlmm 0 GPIO_ACTIVE_HIGH>;
+
+	port {
+		pcieport0_ep: endpoint {
+			remote-endpoint = <&m2_e_pcie_ep>;
+		};
+	};
 };
 
 &pcieport1 {
@@ -875,6 +925,16 @@ expander4_int: expander4-int-state {
 	};
 };
 
+&uart2 {
+	status = "okay";
+
+	port {
+		uart2_ep: endpoint {
+			remote-endpoint = <&m2_e_uart_ep>;
+		};
+	};
+};
+
 &uart6 {
 	status = "okay";
 };
-- 
2.34.1

