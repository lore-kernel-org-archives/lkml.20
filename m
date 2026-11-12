Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794478577;
	b=qWR+R7YsGi/pCrGtHQqAFcrLswMoJtb5Mw8KpoRL6+/YhKjbUquRxgBhx7cm7bm/wofG
	 5lgDDOCFanvygO1Nm8dbf1HA+2MEmUjhWcwkXwEJ8YZmJIs4jKbA8AoaXTHIuvRXjktYr
	 8AX2HP9TOowuBYG2+UpuxXkZnQLq8qLWoP1EUv4zb7ACfC5gjb33nclqlGYTGtJDEetE/
	 Q7nTlNh4ioNeQpS5SNp9KBBPun2P2KziNMtvbmQm5f75j7FsiycignMDD1PJMHWRhBtAf
	 uWSr0Oe65mSo0xPB9EplSt/OpRnLqZsgT1xl+vHPopekLfqFRXNmD72WfFtuSS+aB4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794478577;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=f/vqb8PA2sl+yvwHUhatXU1JfNn9aoq20K9NdlI8gD8=;
	b=P5N3R8tczxPizojeikX4zpSUUkIyI1DE2iHZmSHEtiYay9xcMcmZGStecNYIFstjDNo+
	 MuGSm+F6zq0Emcq66wXfERS2ttzl00erzgSkAwPHEeU+NB+T5QAUhm+oKtKbYCbyzvjW9
	 WeVuKK4ZvCk2UXTYwvEMGxS9iZgvVGaO2JZTKHByH1atckW+5cIuGq4ekeY0n2L5SqNG2
	 W5Wz6ATqbUoyeLqRO3sH3WAUKI/wsNG/iimXGnWMa0tz/1K73j3IR+kZSE6S4e+yQJqT5
	 HT37YKYUK2ml9Q5NtFLAsBYV9WNe5CF3F4LY8bUbp+IUoeh5s+3OBjqrsdiQa9/pkFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="oOemx5/p";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ScYSGYib;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DCFA606A8BB
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 10:16:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6DCFA606A8BB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oOemx5/p;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ScYSGYib
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC96pSw597555
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 10:16:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f/vqb8PA2sl+yvwHUhatXU1JfNn9aoq20K9NdlI8gD8=; b=oOemx5/pJjYUay72
	hfj7X6LkHgDIpnme5CV2dWK5/KtlAV3k1n5LiAt+VRBv66jaCqlEyXxHzAYMFUoM
	a5b7oHzzTZyEwWsubbsrWf/fTSlIT7SdWqC/zi9QLF8d1vV6STFWVcIeAcZdxcSx
	/5ZGTbreUIS24EAtPxJkwjJf2JaQSf03WvR79k6DgN3+VpFPIBhP8WHo5dHcx+hf
	8MoCYl2Wgt+sMVScwiWXwi2w3k7PH4wydI/0Did5L7s0Iz4ZhmCG45N9iUGdTi0c
	i7B02f2Zy9D8nuDJzVSKpgh1G/75+mvBuPt79nxifJ1z9yB9S6/iZYuIlpaLinYC
	8haHQw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvt15480b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 10:16:16 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8b930598cf0so5174010b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 02:16:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794478575; x=1795083375; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f/vqb8PA2sl+yvwHUhatXU1JfNn9aoq20K9NdlI8gD8=;
        b=ScYSGYibeswa36F4FJajGvzmZZixTPC0INQux4zieTdEu4PZHGam3hxsoSjJ9w/ybW
         vR4RzfDk9LiHchBHRXhL90mz8qehmgd1mHT5sxakXcOy8Bg4F3bBQBkpTHUZPxHPgmay
         myNSth14+Fov0C8qNJnL0H+GTbIENAmEocZ+/O8RkZG26spHy8fyx7SLdg2MBKZZLRyx
         g8I7KJCnhCRKBddTmEP1/FP61K7LZwcy4SObPHtKg2B6uq7jIMI5oCsV9XhNp85NLXx6
         ZvPBjietASCcPZhvCrUnkRve/ppjSRr+JSF5Nd7e9pJwG8ZnWVu/VPTzLtrQ4H0mgZ//
         TEpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794478575; x=1795083375;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f/vqb8PA2sl+yvwHUhatXU1JfNn9aoq20K9NdlI8gD8=;
        b=c0j5X0M7HRo7zGlCWVaK5woOS2Hcknw7AxH8DGpnz7MYWqeZRy2tcudwWtutAZn+jR
         Rc0E2tWinJOizw77czPzGv05Fa3uTmgPSh5tBhO0qXuV/tKXEslSsZgmOHWKUbQQkxCh
         XPqTgXFRRAKL/EEGnlRz4fBh0S5+S19jkusuuOyViXuJGtVgQlGFMSNn/iGF8Umhxunz
         ha5Y3DEiQKBEO5vUr0BkI02UR2cDoIzJnovvNFKb7xM1iedtLQtAX+HGdivn7C5lSLjX
         u9jJoI6IzpVodNRdzDB0tceQQIJ9MFAMBM9j6ljZ2Dr+tfy/VJ1S3UOGqZW6xR+JmkyT
         XD/Q==
X-Forwarded-Encrypted: i=1; AL+hErFF6SQtuUDZOQJePdxUVoHrLjoNkWJGPGYgjdXvPK+FE0lEO6xpGSYVlbRpCeN2VuzARzAVw/5Xl5IVD+0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Z30/9LbBLYu7ddJ9jLJPchQLnDzRrsaYgusfOdldYRajJs/w+
	mm7xY00UhG53m+hxJau2ClXp+AVk0sZVGiq2/9g0euSjBtWGndZvkX2XeSFSmiYaPhcn9GNVMRJ
	7QtSrYYzPkWdXLDBJLa0IFPxpUvjphYiSzWjg9rPJ8Yi2Ir6USTy0u9bhMd2/55xn1Qk=
X-Gm-Gg: AYBFou2nnWR8X+pbuCli3CeQQYa2xDwnkhiLxfUSRHiMmt1XBlOSPmGfMfKwYTDRE3K
	Bi6+HBpCsFvSdDaslbdUjMOYHomxvdRz6qrna6g0gns/V7T17ihP2Hb0jyaPAY9IFHtPela8mtX
	FPAN8uuHLKITswDzSm9cShAw7m2AMQ2I2v3xMNoLQFPxbUNtl6a7nnpy55DnAAc929m0WeIV2KD
	j/hpLl29NPyCZjCLA0mGDGodEya19ZCms/6n08qQ7r07c86ZToIS/6Iaybsx1vlvLXReU3CZJsf
	oyRo6KcmFp+5fh+QRdBSe2/GNq6cM6rBpi77FKPEsGvWJJ8Zp6w9tlYey6VG16cWfa5RPWtv3bk
	QdaxdwxMFVDhfrRk0MjBirogxt02tUzzzm7WpXjdsPLLAa1HOqmOd9ib4q+0DIv5QmHPemtaqjg
	HR
X-Received: by 2002:a05:6a00:1817:b0:899:74d0:8a58 with SMTP id d2e1a72fcca58-8bc1d81d5e4mr5126518b3a.55.1794478575367;
        Thu, 12 Nov 2026 02:16:15 -0800 (PST)
X-Received: by 2002:a05:6a00:1817:b0:899:74d0:8a58 with SMTP id d2e1a72fcca58-8bc1d81d5e4mr5126492b3a.55.1794478574878;
        Thu, 12 Nov 2026 02:16:14 -0800 (PST)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baaae3e110sm3185872b3a.36.2026.11.12.02.16.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 02:16:14 -0800 (PST)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 15:45:37 +0530
Subject: [PATCH 4/4] arm64: dts: qcom: glymur-crd: Enable HDMI output via
 PS195
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
Message-Id: <20261112-mahua-hdmi-v1-4-b463d7b1dd7e@oss.qualcomm.com>
References: <20261112-mahua-hdmi-v1-0-b463d7b1dd7e@oss.qualcomm.com>
In-Reply-To: <20261112-mahua-hdmi-v1-0-b463d7b1dd7e@oss.qualcomm.com>
To: Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Nabige Aala <nabige.aala@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794478537; l=5057;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=9Z++agaaiuF5ovhrauBFDrmdWH3F4YobMbzvMcWaug8=;
 b=of6Rs2zo5YZBrdpywh4p1Gqo5OfdMOsX1fpxY3NSkVR+MhVD9+c6ZT4F9UV/Ct7SxJ3m2crTl
 MbptMIaVM+qAAvUmJv4CSsd5v9Udqrmi8U+h2JFq/HU645MVqicBy0C
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA0MCBTYWx0ZWRfX4E8XImnisMa8
 QGfMZXyrdD6UxIrofeqwnX0jumP/gtpFOB87IC40AIE7+Z+pXaJGskfDJVvm7+t9ee4oqMzadd9
 o/wJGMYanqHoPPRisO+ZxWMAirnfhpo=
X-Authority-Analysis: v=2.4 cv=Yrya1IYX c=1 sm=1 tr=0 ts=6af591f0 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=hoTDXIFaVgMer3lSMjIA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: ibgfQc9iFXy7Brxc4dtOk8CxPFFd-wvz
X-Proofpoint-ORIG-GUID: ibgfQc9iFXy7Brxc4dtOk8CxPFFd-wvz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA0MCBTYWx0ZWRfX+/2cJFGGmWnM
 f4dnD3VCtFCMK44wahZ/uCYFR9IpS/qOqeNGIuv7xFMsb9YNw3XhLc9Y3Kr86Eh3Q9hG8qz2jLz
 0PF3s4I2jp5LSamCH01442MpYhmUNcQkaDhrpgh3EtiLETo971ilBoviGZNmLOwyzYGMEAliDAs
 YlBL+m1+hcKBNh97RCZpvQhhrkTK5z4ooJiuvfW6dsTLspp+ksjBWBNv3dXN8n+h568UcKAyE4H
 AiHpthMkaXvJHdjZ3hRfySClh9gmK7Vyc4saM06EEWpHJpjtouhP4XJlc0h6xsin3di2aFDeg22
 R2baow0dGPswebt9ax6qHDuchK8HtOcwCkZTN5Ec4bySRMetlhX7BrP1lcm5M0hHbadiQMLIvDM
 zO9LtB580thqLe8+T5XOm/1l9cxhrw19/X9BphL5ozUeSlk6sPGFmElLjoFv5jY+rsWo/8iXcDW
 Go1ygM+dCkSsnT5WX0g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120040

From: Mahadevan P <mahadevan.p@oss.qualcomm.com>

Enable the PS195 HDMI path on Glymur CoB/SiP, Mahua and Kalambo CRDs
through their shared glymur-crd.dtsi.

Describe the bridge, connector, supplies and four-lane DP2 connection
through the USB2 QMP combo PHY. Add the GPIO126 HPD state to glymur.dtsi.

Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 142 +++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/glymur.dtsi     |   6 ++
 2 files changed, 148 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index 2ec62423ad79..87adeccaffc6 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
@@ -20,6 +20,35 @@ aliases {
 		spi0 = &spi18;
 	};
 
+	hdmi-bridge {
+		compatible = "parade,ps195";
+
+		vdd09-supply = <&vreg_hdmi_0p95>;
+		vdd12-supply = <&vreg_hdmi_1p2>;
+		vdd33-supply = <&vreg_hdmi_3p3>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				hdmi_bridge_in: endpoint {
+					remote-endpoint = <&usb_2_qmpphy_out_dp>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				hdmi_bridge_out: endpoint {
+					remote-endpoint = <&hdmi_con>;
+				};
+			};
+		};
+	};
+
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
@@ -63,6 +92,17 @@ switch-lid {
 		};
 	};
 
+	hdmi-connector {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_con: endpoint {
+				remote-endpoint = <&hdmi_bridge_out>;
+			};
+		};
+	};
+
 	pmic-glink {
 		compatible = "qcom,glymur-pmic-glink",
 			     "qcom,pmic-glink";
@@ -142,6 +182,53 @@ vreg_edp_3p3: regulator-edp-3p3 {
 		regulator-boot-on;
 	};
 
+	vreg_hdmi_0p95: regulator-hdmi-0p95 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_HDMI_0P95";
+		regulator-min-microvolt = <950000>;
+		regulator-max-microvolt = <950000>;
+
+		gpio = <&tlmm 55 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		startup-delay-us = <1000>;
+
+		pinctrl-0 = <&hdmi_0p95_reg_en>;
+		pinctrl-names = "default";
+	};
+
+	vreg_hdmi_1p2: regulator-hdmi-1p2 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_HDMI_1P2";
+		regulator-min-microvolt = <1200000>;
+		regulator-max-microvolt = <1200000>;
+
+		vin-supply = <&vreg_l18b0>;
+
+		gpio = <&tlmm 54 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		startup-delay-us = <2000>;
+
+		pinctrl-0 = <&hdmi_1p2_reg_en>;
+		pinctrl-names = "default";
+	};
+
+	vreg_hdmi_3p3: regulator-hdmi-3p3 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_HDMI_3P3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&tlmm 170 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		startup-delay-us = <2000>;
+
+		pinctrl-0 = <&hdmi_3p3_reg_en>;
+		pinctrl-names = "default";
+	};
+
 	vreg_misc_3p3: regulator-misc-3p3 {
 		compatible = "regulator-fixed";
 
@@ -545,6 +632,17 @@ &mdss_dp1_out {
 	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
 };
 
+&mdss_dp2 {
+	pinctrl-0 = <&usb2_dp_hot_plug_detect>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&mdss_dp2_out {
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+};
+
 &mdss_dp3 {
 	/delete-property/ #sound-dai-cells;
 
@@ -826,6 +924,27 @@ ec_int_n_default: ec-int-n-state {
 		bias-disable;
 	};
 
+	hdmi_0p95_reg_en: hdmi-0p95-reg-en-state {
+		pins = "gpio55";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	hdmi_1p2_reg_en: hdmi-1p2-reg-en-state {
+		pins = "gpio54";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	hdmi_3p3_reg_en: hdmi-3p3-reg-en-state {
+		pins = "gpio170";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
 	kybd_default: kybd-default-state {
 		pins = "gpio67";
 		function = "gpio";
@@ -1035,6 +1154,29 @@ &usb_1_qmpphy_out {
 	remote-endpoint = <&pmic_glink_ss_in1>;
 };
 
+&usb_2_qmpphy {
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
+				remote-endpoint = <&hdmi_bridge_in>;
+			};
+		};
+	};
+};
+
 &usb_hs {
 	dr_mode = "host";
 
diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 65a398c0a992..2d3f8fe2cf5d 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -6793,6 +6793,12 @@ data-pins {
 					bias-pull-up;
 				};
 			};
+
+			usb2_dp_hot_plug_detect: usb2-dp-hot-plug-detect-state {
+				pins = "gpio126";
+				function = "usb2_dp";
+				bias-disable;
+			};
 		};
 
 		ctcu@10001000 {

-- 
2.34.1

