Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794215208;
	b=A8sktvNZCtGU2xXGL0Sn+5QjaTAXr70aQJuLVfKVuhwLZEdjHr0tzIJwQvQMXRSX3qKE
	 7ZifvlhdPIj9/rNt55o3OyInbbYN5gEr3vn9/cEIcciKhpvfRq1+4xIFapB4JowCA59T7
	 FI+beKL/9LbhFVKRvSDhrM2FkVibr+7jz9oAUxL0yGAPk1jPTcXJ7QEoyeDmWBuvKNTVB
	 qSY6RZJbSTtmTaAly2PVbCEPJvYuKtcEgIbM5dvecPzM93jmsF4eb0SrHpElrP7lCIBRV
	 j4mTaN/VPeArY246WBM+SP9VrJz/s6c/oZDMNBr/3MYRhOrBaxynG0i4NRy6ZEEPaNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794215208;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=dqiVtPs0Q2ghJGFEHuydmBelmea99GR2RR7CgW2HfWI=;
	b=3shK0l3LvlktSidB/3OPyA7rfQ+MBltRUEA+v+sJGoYapb4Cfo8BtKQIAT4aAm9eEBv9
	 bY+VxWaC1g/0lpR1LWxbiivaAwzNBbbWWpxpBqQSNTlJjq7m4h98v67tsAbF+tud8tUiy
	 Brx7DFZSJ14gW4eg/6ume2ymBtBc1aLAZdPJos0XsMuODVuBJQjYYvK0IEqddKE2ftPQY
	 4ItrfhWhD2vHF3jZg4i8kp/A+pRnaK8oKL5SByApXB63D8SLk7Nd9CDrmEMidmDMXo0wN
	 cp3V3W8PkcxTJ3UWMjqRmOgzsgDQiUD6QTrSoE+kOAQQlr4Cx0vsvhhnwTlec6iNn1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bXP4S+z6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="eaG/LPy1";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A75606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 09:06:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1A75606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bXP4S+z6;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eaG/LPy1
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A96AXhL2007966
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 09:06:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=dqiVtPs0Q2ghJGFEHuydmB
	elmea99GR2RR7CgW2HfWI=; b=bXP4S+z6ftSH0JGGUOX/+zT0Lu0H6DfvnGbmfl
	wd3Dx6RoPhrjfZdv4ltUsqoWnvUMc4nA4tqUF1w+5wQI17bgneCVM1DT9UgxXrDP
	YyCtfIG98nbFgtNFI5AHgKvyuxhDRGUg8WNkpAU6sx5cm7S9wiUh30LDxhYjpcOz
	WIml6qdaUg+6mfCrIdnXs7N1OucJgDA5InmXelHsEXYfAx+ySbLJucWlIvbirRUd
	eGWnTE/cRrK272440cuSOiVsQb9dGm27Rd+4TSrJzH0quCNjAUw14nqhaAXZtVjv
	FmXqy3mhJoQfpCcdSiv4jSgf/LTqXwlDZvMTdniJIf/oa8cA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsw5k5d4k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 09:06:46 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7cc4149b885so604967137.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 01:06:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794215206; x=1794820006; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dqiVtPs0Q2ghJGFEHuydmBelmea99GR2RR7CgW2HfWI=;
        b=eaG/LPy11sDW1EHzO5ItbIIo0T/G7PK0mGPLR/BV9o3Wii4LdvndpZkVCKOcfoG/Il
         zQZYWz8OeO8jBjGd5xnoJc/wh239qQ6HH6pmARO6IX14LM2ZkeopY6hG7VfDRt8RsHtC
         lOM32jGywUp55r68UOp/K16fSsZXYfibqeCcAl09Rtch20dEXnr6uBCJ4ym06WGlTp9t
         wiBGWJw7hg4QHbP0R4T7BiVnl6dgNqgfT1MbyqmpMoizB9q+SylJNxQcacQiXHHfCgVZ
         D18p8Q+c+LCqe1S8Xjz05HKSWyecExJzILIvoKrmvOya3bBHlz5KstBFl7mTDX6b+r3C
         1mEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794215206; x=1794820006;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=dqiVtPs0Q2ghJGFEHuydmBelmea99GR2RR7CgW2HfWI=;
        b=e0McQEJnFXs4oBiwrQPZkvGyLw+38CHkmXw7o8Ci3j83NgVhmyHbWTJlVhJuOMi5Le
         gXrttNnm57zZvJ/s7Mpr7bRXgW1GnIzIC67WfJZwRM6yJzGb1u7SRnlgckfc67bEu5Yd
         RIH/kf80yrKqcVlRF763lAupAiE0eY0zy1AlD8ZR03Kq2jDCwCdFUm7gAr2rIesErG/M
         x8UNg6LdO4jqh5TLEzDm/Vy/gBMBDV//zOtJSHks7kT4bHg1cYhI4OgOmHRipuCPn/su
         YKnRs3Co+8izEzXBzBhNeIN26uskc2tMhH2wylsdr70uWdI62V9yUjNGu+dnd3s5duwO
         6Kbg==
X-Forwarded-Encrypted: i=1; AL+hErGszMqNruqmeEZ2aef+/CirxweaphJbG7CMxi5LXL1gd1z2qDoFy3RQmD8YuJRfru/AT8EtQuk5KAJ8jmA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/3eQONUHOGRKc81dI6j4yNF2DkfLag6xWQJ5bPOS0NsVrdAngX
	7qB75sZgubBnVuUekaQ5/Pw4ptUvV6Y8o70KRdUV5JFYjxwLgkxpW8F0GlwkHrEujGm1zCoDVgY
	DzONwLoQGSa72mdus5ysZopqaYCOUyOPxjOoZCbdPY06C/5xporo6GGdn/ffK5+c+Hqs=
X-Gm-Gg: AYBFou3WZXrXRBjr/KKTu6r5p6sTsad0SCmju7MgDG0yojATQi+vqxFAye8O9UiTx7n
	5jGq8EwLyYgNDYoQH5iN6whx577+uRbwy7TLVHlEQ3KllDsquqmOy/8la8x1cQjaSuWFs0ZfP/+
	XGecZSQvVrAL8eakz1d+3AQK8q/g2cLOdkrB+ac3J9WEYOmT7ct3ztm33gKYPZ2CdJhLo7u3qqU
	HWrfpb5O7gQqon+xdSP2QhtcmBWGEFPyaZSxa98pT9ZoK+kPSayEt6PpaLE7YgOSIInOeu8tnm4
	FYgaF3XK0onCpdKtKixPD/pxeBgYdKPMJ65UjbXST7kkQQM1UnhD1gcm1aIdVjR/lZ2eR9ZCWcw
	u6A/bUM1QcyqSfNxR/y/sEBQno4usFYdWa1yYHB4XhL4q3Ta6AEhgsncfCw==
X-Received: by 2002:a05:6102:54a5:b0:7bc:dd88:add with SMTP id ada2fe7eead31-7d2db0d23f3mr975211137.14.1794215205575;
        Mon, 09 Nov 2026 01:06:45 -0800 (PST)
X-Received: by 2002:a05:6102:54a5:b0:7bc:dd88:add with SMTP id ada2fe7eead31-7d2db0d23f3mr975205137.14.1794215204956;
        Mon, 09 Nov 2026 01:06:44 -0800 (PST)
Received: from [127.0.1.1] ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-495966f36besm8031854f8f.14.2026.11.09.01.06.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 01:06:44 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 09 Nov 2026 11:06:39 +0200
Subject: [PATCH RFC] arm64: dts: qcom: mahua-lenovo-thinkpad-t14s-gen7:
 Describe the HDMI port
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
Message-Id: <20261109-t14s-gen7-hdmi-port-v1-1-1a691e6c180e@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAB6N8WoC/02OwQ6CMBBEf4Xs2SUUrSgnExM/wKvxUNpVa4Bit
 xASw79blIOXTWbydmbewOQtMZTJGzwNlq1roxCrBPRDtXdCa6KGPMu3QmR7DGLDeKe2wIdpLHb
 OB1xLEtrI/VpIDfGz83Sz4zf1AufTEa4/k/vqSTrMeQvm6dXHzrCwlWJC7ZrGhjJpaQy49MqZb
 4hZfReVyeLv/vbUxuHg6hARxkGgQMqUyYzMd8W2ODjm9NWreo5P44HrNH0A5XO3b/8AAAA=
X-Change-ID: 20261109-t14s-gen7-hdmi-port-35e1cd59315c
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3584;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=1AwIH7e09zv56K7V5T5MB4lw3ukvd7f4T5KE8CtPpds=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBq8Y0itaRJtEnquliG2OcaSEyGCvmSQsnIDHXLJ
 J6o0HjdcWeJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCavGNIgAKCRAbX0TJAJUV
 Vu6zEADIDDGZlSJrjpCiilllVh2t8k13hyLDLcjGTWvQgCTzlAE18uuDNmiHO2Z1k8JzA7toheb
 dQpdZhotZ2+QaDjYUD0Vjf9Hivb+FxwszKGbOChnZLt9LEQt51IoOYjLWrGnQc1e2ACeRy+dPfC
 qDqTSHiR39UIcxyunHjY1ZtEnyGx03CLBCPl/r01lbBfMMp++YjqXsfT32akXBx6G8N6H8SB+xZ
 QjTA+wPT7/AG2PTPQfcxEt1qTvyrUXCdS/xVVk/S1lotNbEA8IdDuWtUU2seuynLCq7ilIxfbE/
 aygF9njhxfMqzL4aru2bZDa2yIcjbntWee1F1VtXbG/bvfIwwQePG/xumNBGB69neDNF2YmLoVF
 kUF8U9ZU/GamZ/lxZO1lgfjsQlnWuEg2xZYnORK1r6PPTnwhpDrH2KMrzpS3hmvlIEZP2UW+Ycr
 +rIt84seXEgaqOjh0ITmyPXA6i699FshY3v7+MpwgAego/bltrZKYvqyhJ4YV4RDtTp5ps0VOx9
 BX974HK2WLDqzHeIpFdgdwFubtzRPg5QlG/Hj2liK3rXc7tyTXnuoWA+FmLBtFOl9XQo3XOvVQQ
 MLHnRsUhDVVPRj0mENu/rXxRl0yem7VAuCgK2q8IMRYIYNHE/usST9HYYwyZLKi3sm74NTKrse+
 ODdJAwUXuw8EOFQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAzNiBTYWx0ZWRfX/xNiqBLS5DUH
 s9wqH4dprJCNqTpttHnVWq1FQLUtwvJLLXz9SiR1mf5Pev3kUM5oclaKS97ZWg+YdUTwU8A3oc4
 HJM0WfBAp2kgwmpYZOPKp5dkgjL4ADj+ND8nEUH5d8Jbbck2PpPGOvtOxBGT6gaZMx3eNe6M9AF
 ChERhTwZGHUIws+LfKy0WdqBqANEImJ+LCRMyAePl6PycpJ6tNR458PyFxqCavSwlZEQjgyHjy0
 ryDoBR7p5tU6qBlM610XJYWCodG9lpNK9HjdyecEzTIor5dv3yJYOSAsvtVW+us0uMks7BlsFTQ
 u1QeOeGfeJaTtTPnA0Tvr+yhErtJWy9n1ZyH2zbS9npOxV36VV5gNGsmhYCyUYgl0perBQl0TC8
 nU7/ZCWGFoiPmqiPC/4yMcXLTtZ38a/95f1sys40Q5mCcDIgcAYw5870cxEJIfgVFTd/yeBkgIA
 ManjqTGl+KPphrtKbSw==
X-Proofpoint-ORIG-GUID: oRzh0rc0ie2s7MjwkCJ-scr74xeb9po-
X-Proofpoint-GUID: oRzh0rc0ie2s7MjwkCJ-scr74xeb9po-
X-Authority-Analysis: v=2.4 cv=G/aJgNk5 c=1 sm=1 tr=0 ts=6af18d26 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=KnVzsQ4Nl2pkZoQV7Y8A:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAzNiBTYWx0ZWRfX8nFSuqoOPm4c
 TzNwwnkltDcJxvdN3biMSyA8a9vucQWn1wY/ahzWWmznycNMEelDq/8XgghZUjbo7FWI7MZ8hJ2
 PJAMBaXCXeFUfShVQXYfltIb/FR9FTw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 phishscore=0 clxscore=1015
 bulkscore=0 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090036

The HDMI port is driven by the third DisplayPort controller through the
DP lanes of the third USB/DP combo PHY and a Realtek RTD2171A DP to HDMI
bridge, with the HPD signal on GPIO 126. The USB3 lanes of this PHY are
not connected, the third USB controller only serves the eUSB2 port of
the fingerprint reader.

Describe all of this so the HDMI port works.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
This depends on the LDO voltage fix sent separately, as the combo PHY is
powered from one of the rails it fixes:

https://patch.msgid.link/20261108-t14s-gen7-ldo-voltages-v1-1-e0ad0d528767@oss.qualcomm.com

Tested on a ThinkPad T14s Gen 7 (LCD) with a 1920x1080 monitor: the DP
link to the bridge trains at HBR2 x4 and the monitor shows the desktop.
---
 .../qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts   | 82 ++++++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts b/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
index a9204e99b0fb..da5f603bb4e3 100644
--- a/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
+++ b/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
@@ -73,6 +73,45 @@ switch-lid {
 		};
 	};
 
+	hdmi-bridge {
+		compatible = "realtek,rtd2171";
+
+		pinctrl-0 = <&hdmi_hpd_default>;
+		pinctrl-names = "default";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				hdmi_bridge_dp_in: endpoint {
+					remote-endpoint = <&usb_2_qmpphy_out_dp>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				hdmi_bridge_tmds_out: endpoint {
+					remote-endpoint = <&hdmi_con>;
+				};
+			};
+		};
+	};
+
+	hdmi-connector {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_con: endpoint {
+				remote-endpoint = <&hdmi_bridge_tmds_out>;
+			};
+		};
+	};
+
 	pmic-glink {
 		compatible = "qcom,glymur-pmic-glink",
 			     "qcom,pmic-glink";
@@ -762,6 +801,14 @@ &mdss_dp1_out {
 	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
 };
 
+&mdss_dp2 {
+	status = "okay";
+};
+
+&mdss_dp2_out {
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+};
+
 &mdss_dp3 {
 	/delete-property/ #sound-dai-cells;
 
@@ -1020,6 +1067,12 @@ hall_int_n_default: hall-int-n-state {
 		bias-disable;
 	};
 
+	hdmi_hpd_default: hdmi-hpd-default-state {
+		pins = "gpio126";
+		function = "usb2_dp";
+		bias-disable;
+	};
+
 	kybd_default: kybd-default-state {
 		pins = "gpio67";
 		function = "gpio";
@@ -1270,3 +1323,32 @@ &usb_2_hsphy {
 
 	status = "okay";
 };
+
+&usb_2_qmpphy {
+	vdda-phy-supply = <&vreg_l4c_e1_0p91>;
+	vdda-pll-supply = <&vreg_l4f_e1_1p2>;
+	refgen-supply = <&vreg_l1c_e1_0p91>;
+
+	/delete-property/ mode-switch;
+	/delete-property/ orientation-switch;
+
+	status = "okay";
+
+	ports {
+		port@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			/delete-node/ endpoint;
+
+			usb_2_qmpphy_out_dp: endpoint@0 {
+				reg = <0>;
+
+				data-lanes = <3 2 1 0>;
+				remote-endpoint = <&hdmi_bridge_dp_in>;
+			};
+
+			/* No USB3 lanes connected */
+		};
+	};
+};

---
base-commit: cae1456a7b596c7d21d86fc17216e6996f26da3d
change-id: 20261109-t14s-gen7-hdmi-port-35e1cd59315c
prerequisite-message-id: 20261108-t14s-gen7-ldo-voltages-v1-1-e0ad0d528767@oss.qualcomm.com
prerequisite-patch-id: 15e089c6ecf7cd782ff552a16cab0913dbb6197d

Best regards,
--  

Abel

