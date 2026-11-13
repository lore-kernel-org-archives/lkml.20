Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794596017;
	b=M7GzB0wcuTWvP6J19ZNp3UksAPKpMFuRTjh1RHGxMajbUmOgjvto7afLeK3O3A984B9b
	 QsjLegmgMb3G7lowoaPE+j/iu4EE4prrv6ZDKyBxzTnX8E8Td4DQvOCTWDnFbjurExqcB
	 QZfa/o9WeCDL6z1WUzC34sxXJgb9k0AA7HL+xNAbD17pekhOY9si6KiOZT4rchOfL0kPV
	 oMqUO+mOyOeTZ7Lg4Dh0Ho3J7TNIu5S1m5RDcaIkno0Yz0usLWO2gMr3rJMRo9tqvxJtz
	 GHt/665yf1Cq9DyaOPapeGH3Z/SvFCZ5FsNworc7p2zJWPbgi91GpyLGPHN+8dhUwrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794596017;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=l2PvIst1nSNtsSgCfOGUiLnxVZGWtnnZ0YcAmiGkyHs=;
	b=MLKVdPs77YaWaHxsSPOFsGDAmElIdYnYIkkcX51eTJr4doYHrZT7lywjfluKZnnjrMog
	 k/ut6+jXiqT406FSKj7SiOLMxeUitIWAZut/EaexdHoPmw5PH3mhRsNOQiAdKwAFzMmV3
	 xoBtD61ormQCDOqMnM8Sg8Q/0mkyAI57HrTPg9F4Imc2xfARqWW6/x4RzXrPBRudPri2+
	 l4nI/kLpOT6dpPpBcEsKhJRmgkWeGzRwJS45W+xW2U6WB+a9uQb6bhuC4HYZFjKsaI+Qd
	 PLy1UFdGNeS4v4+DvpkXgDC39cOK/B9YdAC0oBzw1aCjgGU/yLmqy3/vWFQ/OCjK/wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KX3Su90H;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="eGOJF/KC";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1FC4606A89E
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:53:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1FC4606A89E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KX3Su90H;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eGOJF/KC
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADFR6XP1011666
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:53:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=l2PvIst1nSNtsSgCfOGUiLnxVZGWtnnZ0Yc
	AmiGkyHs=; b=KX3Su90H6zNk/whbgSOKrnl9q9niXstvLfV+dkJIx2xWM+EnwAx
	G1fTGg+o+T+jz7kUWrtAvMX6Z/kd1Oon5TbYSlQnjQgbkB+huAQjiTZLV0smTTEs
	m3K5v2PX0Llu0qRr/DkLPWWff2H3FBHAcHgm4U1AeiTRQ1971M76ZAa5y6GTrP+w
	k6cnFcJaZoqmC8iERmkz8xvA/UzC15aN80Y0D7X4oaksuAzf2edKgONva5tBqlv3
	iPGlYfzPp1u6z+YYkxFUUC2E1z7TQ5hFCEjsF1AkGNXu9tzjr00G0lzGnmlukpx/
	S9auHcz7LkkVgxUVCLfr7Lowcl/AdJBbMuQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwkfdmhhk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:53:35 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7d2c7a903a1so1018421137.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:53:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794596014; x=1795200814; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=l2PvIst1nSNtsSgCfOGUiLnxVZGWtnnZ0YcAmiGkyHs=;
        b=eGOJF/KCacnuYbEXUrwJFnBjeWb0INh3a3BGPSo9r3DUT8B55HMI+ZgAFYKMppyRhw
         pyIhYrZ/qLM6klKqerGvgf8vLy3Qco3fo6A2gP29F+IKVQMZAvTZw3CmAPI0R6B9yd6k
         e8mvIG41XidiF0nuo1he/2G+H51Yu81DygvDarwXe7Rz8it9pv79FPliya/e8FnI7oRH
         ydJ4oqzjRNsDv6nm0QpHlSgmdkmhwahiIXf6b+Dh9Q30nclxInysxe/tFQ/PmuLk7bYO
         zIteEeSVUavGayT5KK3RMNIOOKzpaQwzpxSLu7zilE5P9kYJkWjm1lvXDW01joCjJlz2
         zCeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794596014; x=1795200814;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l2PvIst1nSNtsSgCfOGUiLnxVZGWtnnZ0YcAmiGkyHs=;
        b=RmgN7sJZt4nG8dRMUMi+javdCoLLPakeMWVgAFAZqJn+uTjhDwrPe7K5+imo1aIMMb
         CNBERC4smJf78N7qAqfLFe+FLMvO0dfriverWiHh5NgU33rKOeqQIN4n2jsTogVAbTvE
         /qOTYG/jXOP3ttkzbwxF7UikaZ7fuVa0XA0hhjimOPalvqud92nFpbxX3hFOtpuWZQtC
         1y4FdZxvg/dFF9IlWCXpALfxkK0HOgJBndLkWVnVYHUW3Yue8qJQZ+88CMPyrksv1aIF
         fiozdu+x3GxhqrsCV1zNsttlqXTSDDwqIxkyq/OrYPI2qEu6PVo5zDKOgPcWqypp/4rg
         Nyuw==
X-Forwarded-Encrypted: i=1; AL+hErEhmYjd5z79KM9O4G9ONeGFBqFF10N+JAY3/Cf9jN3A1K2k+PDLk7y4GtmCZ9ItR6QoXB0iupnX3t/q8gc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9plFDOND/Pq3qp7npl8N3xxtchfZ9dZZ123LK9YBSBtpUfOxLk
	gVFZve4O90vTp4ibOOTFEIXkOCzSdeMevoALTnQ9nqs/uY2Ms+9FUtj8acbqVe861JQXuQdkQVK
	MoEE9QQFY092uTauPhZE05h2jYDHzQCmb0vw1T5XxIcUaXVX+R3JxZc57XZdj4B+53hk=
X-Gm-Gg: AYBFou2FfauSbhF/eQNyc1mYL39ScNTfejn1M+BWM4KM3+wEQ7XMdCcCPYY0o6IHfM/
	MxHNovYh37xZoWeNy8P/V3fl74eYEYuhWBAzj24MQuUdAmetkYcUHTf9b7DX4402Lt3fk/1DYfy
	Irm/KWmEAR2se7tHlvd+YizGw5vRclqv06Q2hQFz1H7h9lcCz/ukyJPCggNM8DPCCoOQ7ynjTvN
	rjcFoN/phVU0Qi+BGOXnHnxcaR2eumd/0VlqRXeyEKXBDQHTr9DADSfzjvK0prKTWqzDzA0G8nP
	mwuwXMEJy9vkJrHIi0bemDgTSHOo5A3PyIwCSO90idsYERETu4/30BbuzsmB/0nV0XpheQZDmnI
	AjUud2uGQZlSHwvE6hSi+c5iuF3U4oH3e8vp0eqiVSbXCwlwtLc+T/Z8WyrFFCg==
X-Received: by 2002:a05:6102:2ac4:b0:7d0:5688:f4fd with SMTP id ada2fe7eead31-7d64d739f03mr1455760137.17.1794596014363;
        Fri, 13 Nov 2026 10:53:34 -0800 (PST)
X-Received: by 2002:a05:6102:2ac4:b0:7d0:5688:f4fd with SMTP id ada2fe7eead31-7d64d739f03mr1455751137.17.1794596013869;
        Fri, 13 Nov 2026 10:53:33 -0800 (PST)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2adf53sm172988585e9.15.2026.11.13.10.53.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:53:33 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Francesco Dolcini <francesco.dolcini@toradex.com>,
        devicetree@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-bsp@toradex.com
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: freescale: Correct white-space style
Date: Fri, 13 Nov 2026 19:53:30 +0100
Message-ID: <20261113185329.183113-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4167; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=Akuw++ZUVXXh5XdKDs7G2azKQzusj232NcYmjWrfWVQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq91ypbZ7kYSkueWNwNYWavUzn8QEvcbWxnBjIM
 PjQ4q2VSx6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCavdcqQAKCRDBN2bmhouD
 1+YaD/wNQzJZ+dGmeqnE4K90ELgmA3GZPhP/jaw9F7jiIWd6nQucoDoP5I/P/OspFqkS3CG5tGf
 Fc3ZKVGzeTkZTdPNLFWldGWHCQJ8Jf5Spvg8YDirEXxdBWtlppBvvzW8242+mWoMzngjDb+9qhs
 LyWAKYjCs9IJINN49eICXgO7GAVu2s3lEYayCD/V+WZZsugZbnrT7pxlyR83LMGnnE0f5B4meKe
 Q+8bpJ1KuMq8r5Az9FasyFKHkNcbdc4znilhNKZuGFEtFeQLK/NZDXZ7vZS4RY2mWSrxkVtaF2Y
 ds05QNLoZikZSqrmbyTOtwxYhF6Blyw1b/TIHeI+HzIpYvafaUc6QqJ9uyENv+nzCze2j8Qz3sl
 e3LLxJPnNh7lLhoeLo7YRFDCMdyc2JkDZtDV4/wmaKX3UJXcUmMloroC9k/vMjeRFpu3iCOkfVJ
 PH46vtrfajc+05XBxxpOGFcsge3r6qDNnQ6KmIVCafrnWLX2jvQCvShNWVAzfwXOUa+SIb9dRcg
 JptOyT/LJ4cWrtbFKso1oQNzcqNE3BUaFhpFWTS/FoT3hOARCil+GJ6WnykjmH491T2GpYTT+sO
 +V/N6ZRmroFt5+Ex7hMXwyAefBi4L8+ouY4M43+Kh4HcNHHXKlESrGjZbDYFGY2bDC65Q8E7sm1 rRwIdMJTfbNaCSg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA3NSBTYWx0ZWRfXwg3u49UbBdgO
 LeB92YTp1rCqcoVyvUCTpRGVVlhkM5CtsBSqTzoNlL79rP8n6KbaOwr5KNtJKkpnVsdLWJeeU2i
 v3X1KHJw+2WQAUFU4Mp9k/gOx342ai8=
X-Proofpoint-ORIG-GUID: 7MM4DOxOhIAAxsiprYl-GeLjuTWf1iMl
X-Authority-Analysis: v=2.4 cv=DoTDa2/+ c=1 sm=1 tr=0 ts=6af75cb0 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=cbNUTa_LnN-H9OvA4PwA:9 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA3NSBTYWx0ZWRfX7yYVySRoBO+s
 1cGmhZ1F7eUKfJY4J1/8slRlqNeJA5jVrGGcyIqZtUnbf/vNVChQJlHsuVNND9qie+btXHdayeT
 4UAS6uaUYo3xvEXK5U/kUzc1IDlqvB2taVe9hsnt7KfL3mpkiOeD9nH42MuyxM4TZ5Yk3sY+li6
 wyPV+x61jWYCuawOAwUFT9yQZen/Dg3wTEb4Bwm9xJv12wTIHx8KLN+rANtC/eEPSp05/5sd50A
 o7IlRFxLQkJMirPZ9M6XVQy1NL+ZZWuLdQuXmbjBrqwLidyRK6sc8IfJO6bXubCk6vrTg1rvryK
 JxJzbuAmyUbu1zxMvu7Cuasmy9wLt6WCg7OsSBkKwayQmCCQZl/Y0cqssPSVaq2gUY2Os9c84d8
 dejd4x+HJxjCT5vjGcz9yeKowQ631mGtywxMqwB/dyskGYKJ4ZHKRQbBnGOdam3Z9LRN5y3Q7FU
 +WU2z9xfBLOJkgdRbKA==
X-Proofpoint-GUID: 7MM4DOxOhIAAxsiprYl-GeLjuTWf1iMl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130075

Correct minor style issues around white-spaces (e.g. double space before
'=', missing space before bracket or colon) to fix dt-style-check
warnings like:

  imx91-toradex-osm.dtsi:75: [redundant-whitespace] extra whitespace after :

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/freescale/imx8qm-var-som.dtsi    | 2 +-
 arch/arm64/boot/dts/freescale/imx91-toradex-osm.dtsi | 4 ++--
 arch/arm64/boot/dts/freescale/imx93-toradex-osm.dtsi | 4 ++--
 arch/arm64/boot/dts/freescale/imx952-evk.dts         | 4 ++--
 arch/arm64/boot/dts/freescale/imx952.dtsi            | 4 ++--
 5 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8qm-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8qm-var-som.dtsi
index a44351133428..666c0cbac94e 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qm-var-som.dtsi
@@ -163,7 +163,7 @@ &acm {
 };
 
 &asrc0 {
-	fsl,asrc-rate  = <48000>;
+	fsl,asrc-rate = <48000>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/freescale/imx91-toradex-osm.dtsi b/arch/arm64/boot/dts/freescale/imx91-toradex-osm.dtsi
index 9d990937fd8d..ee89e96ce1ba 100644
--- a/arch/arm64/boot/dts/freescale/imx91-toradex-osm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx91-toradex-osm.dtsi
@@ -72,7 +72,7 @@ pinctrl_spi_b_cs0_gpio: gpio1io11grp {
 	};
 
 	/* OSM GPIO_A_0 */
-	pinctrl_gpio_a0:  gpio2io0grp {
+	pinctrl_gpio_a0: gpio2io0grp {
 		fsl,pins = <MX91_PAD_GPIO_IO00__GPIO2_IO0	0x139e>; /* OSM D17 */
 	};
 
@@ -122,7 +122,7 @@ pinctrl_gpio_a6: gpio4io14grp {
 	};
 
 	/* OSM GPIO_A_7 */
-	pinctrl_gpio_a7:  gpio4io15grp {
+	pinctrl_gpio_a7: gpio4io15grp {
 		fsl,pins = <MX91_PAD_ENET2_MDIO__GPIO4_IO15	0x139e>; /* OSM L17 */
 	};
 
diff --git a/arch/arm64/boot/dts/freescale/imx93-toradex-osm.dtsi b/arch/arm64/boot/dts/freescale/imx93-toradex-osm.dtsi
index ea5e6055e3f5..1fb49e06d2c8 100644
--- a/arch/arm64/boot/dts/freescale/imx93-toradex-osm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-toradex-osm.dtsi
@@ -126,7 +126,7 @@ pinctrl_spi_b_cs0_gpio: gpio1io11grp {
 	};
 
 	/* OSM GPIO_A_0 */
-	pinctrl_gpio_a0:  gpio2io0grp {
+	pinctrl_gpio_a0: gpio2io0grp {
 		fsl,pins = <MX93_PAD_GPIO_IO00__GPIO2_IO00	0x139e>; /* OSM D17 */
 	};
 
@@ -176,7 +176,7 @@ pinctrl_gpio_a6: gpio4io14grp {
 	};
 
 	/* OSM GPIO_A_7 */
-	pinctrl_gpio_a7:  gpio4io15grp {
+	pinctrl_gpio_a7: gpio4io15grp {
 		fsl,pins = <MX93_PAD_ENET2_MDIO__GPIO4_IO15	0x139e>; /* OSM L17 */
 	};
 
diff --git a/arch/arm64/boot/dts/freescale/imx952-evk.dts b/arch/arm64/boot/dts/freescale/imx952-evk.dts
index 047dfde20718..d98dc1358fd3 100644
--- a/arch/arm64/boot/dts/freescale/imx952-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx952-evk.dts
@@ -303,7 +303,7 @@ &asrc1 {
 				 <&scmi_clk IMX952_CLK_AUDIOPLL1>;
 	assigned-clock-rates = <3932160000>, <3612672000>,
 			       <393216000>, <361267200>, <49152000>;
-	fsl,asrc-rate  = <48000>;
+	fsl,asrc-rate = <48000>;
 	status = "okay";
 };
 
@@ -317,7 +317,7 @@ &asrc2 {
 				 <&scmi_clk IMX952_CLK_AUDIOPLL1>;
 	assigned-clock-rates = <3932160000>, <3612672000>,
 			       <393216000>, <361267200>, <49152000>;
-	fsl,asrc-rate  = <48000>;
+	fsl,asrc-rate = <48000>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/freescale/imx952.dtsi b/arch/arm64/boot/dts/freescale/imx952.dtsi
index 4930e09e0206..4a737d2620a2 100644
--- a/arch/arm64/boot/dts/freescale/imx952.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx952.dtsi
@@ -904,7 +904,7 @@ asrc1: asrc@43000000 {
 				dma-names = "rxa", "rxb", "rxc",
 					    "txa", "txb", "txc";
 				#sound-dai-cells = <0>;
-				fsl,asrc-rate  = <8000>;
+				fsl,asrc-rate = <8000>;
 				fsl,asrc-width = <16>;
 				status = "disabled";
 			};
@@ -945,7 +945,7 @@ asrc2: asrc@430f0000 {
 				dma-names = "rxa", "rxb", "rxc",
 					    "txa", "txb", "txc";
 				#sound-dai-cells = <0>;
-				fsl,asrc-rate  = <8000>;
+				fsl,asrc-rate = <8000>;
 				fsl,asrc-width = <16>;
 				status = "disabled";
 			};
-- 
2.53.0

