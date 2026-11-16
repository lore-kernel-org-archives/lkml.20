Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794829761;
	b=y5c/RKo/rV1r1KkVPAgWAov6T7fbwwFA8U50sRLENoXOjjcuZppAcYqUkPZdGIbjZkm6
	 MpRvobHfF8s0GXedUX1fXwZGKxY+aK1uqZa8lVOdY2QzxUqCVXR25Cfv8yN/Z6uzAyX7B
	 yLQOAQozsBADks0ztahQtQNZpBP0HyT319VDahS2nwJiRsATRK3rhoKmXUX5vS9GEvwil
	 ivkoSfqHU66V+OBLoc/nfSI4q2YjsdIwVmPixrks/d80x43kFUeVokaWrlaSgoJHGcu4L
	 iCq0eEJ8gmaznQec6bTlq8wECHHelaUJ1P5WWrqV5XHldWU/2XxchC+u3ioTH1+iqkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794829761;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=zW2/gkGq4nmG+GVOGBUwZNxbaEMh5XvK4WG9k00wmcc=;
	b=ia4/A3IZr599HvwIcCKNqU61HpFbAG12ugZs3iopi0M15U1KwYTXXRv0SE3Mk9wZLuCK
	 08zHcSjMUQEHW/eBokuERuUGFglJy/aNk+3Ho9kw0rKT/YFMKvgRVp+ooyKOkLwDbwotg
	 8p//q16zQ66OCu3Q7HBj2loKHpit3SqvS+K6sQzFFKNncxN/uV1h2JKqVm1kjQZNKHNQ6
	 B5rWaeTh/JKKJwzHGJzAfr49nEKog7ufLOpk3D6wORAhGlezmbHe7VMHB9qqekTFNscmd
	 0Tn0sNb5KUiU1sD/q9HnOKvwiqujNAyhS5nnoIy7oDPDezDt2TkiWDypM0qssOUjKSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N1QV2qTI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VJENTJoh;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B09606A337
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 11:49:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38B09606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N1QV2qTI;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VJENTJoh
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGBLZ1b1465805
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 11:49:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=zW2/gkGq4nm
	G+GVOGBUwZNxbaEMh5XvK4WG9k00wmcc=; b=N1QV2qTIqyQv+2dSNgrsMQLmKNK
	86aBYtCM9XdS30mrFsdRKbSM+xG0j8XPaDl3sdbp7TBVp7whM/TCNDoSAkkp7Rou
	GfJMLCzdc9Q+2YRzqE35ssgdrjXWS6cyF2BERGxcy962WBssyw4AAUPUMrfWlZMH
	XFflyx2z7ULg2EraSS+H7FBmaVh+Yts2wrdF5yXDYQqSczFAwRjZcJnB2CYnT6Wp
	NdIY9MjWJHYqOS6BX3u0THOFEydkj8R7A5sPMDgyQ09iOQemfdTOxIR0Skjfju/E
	GgEIENYbMlzDKqGGnxp1TdgEWe4jp/yTFtyMN3insFN5cIScOUJ16oNwiMw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hyxx2gk7q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 11:49:20 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36d1353fdcdso2398994eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 03:49:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794829759; x=1795434559; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zW2/gkGq4nmG+GVOGBUwZNxbaEMh5XvK4WG9k00wmcc=;
        b=VJENTJohLhf0Xp8n5t8Fk0cXqMqk8FPxsdtgNVyqMwieY3/6QwI1uL7QZWHU6GLl1f
         CIe1gHZqulNAXkwd51TR7M9pdELb3yTEVvsaaX1ZWwFBIddB6z2pfy/8QbGfhlhqaQEA
         7CY27j/SAMXrYCON4jBdNt6aUfjmw6OMoh86g6bOMhQl7M3R5sVLHs06RBoscR5jnwfQ
         tPqpzI41NK2nZ5LsxWm52UIDszX31dLQgKsOVXkA+Azzl+NX3tpxTXi9KQAT39ZD1wd6
         ZWF/5su9QQAEipOhV7yJqnkLebtoIMpPdemUmR1bIJHRNGEhaUc6vqZYAjjWg68j12Io
         1IBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794829759; x=1795434559;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zW2/gkGq4nmG+GVOGBUwZNxbaEMh5XvK4WG9k00wmcc=;
        b=VamytCW727f7t4K6laWgRw2wl4ehnEN8RJAeZhSP8XUmDl9Nbt5KBogzaEk0uv++1n
         ShExCMeEhWrxCjaDt42JizwE6r5bHa+03cS4L4gMbKgEQWUiNW959MBgxpvPY9iUTmWq
         K7dOfhDC9D1c6ftdPszPtt6OfJKXA2KiWNjn7xhuHPJK1BJqaIJlCo7biRrsQRysWmAm
         tF5KQ86i8+2mO6SmhzZ3sA/5N3O6EWSHTyHEi0mIaH/SIJiVQu/CrOQW2i4xcLoafJUD
         8MX6QPUgn1pce8VohNNwUfw98L2e/13ICnHJfbR27hl2zmK+7tiXoJW2lsBq1E/V7+IR
         CZrQ==
X-Gm-Message-State: APuU4Z9KWjKIdaZjBu6RV2J/UvdDrE/DO95RJXxuctMqZpPWThpONW//
	Gxj6ny7b2tZrqKisdMzF7mtdyA1TfXp9Pf9YV6w3yVFatV1kDmhdcjq6dwjxOLU1zOPgOiVnEvx
	CAz1vFo1X3aNhRDtBlv+/h9qSPqcM/I0GU42VW/84AvQIHZvwhl9tlHoJS8MMw0pZTG0=
X-Gm-Gg: AYBFou0XABbyoTz4iBJo9c7bQs/MHtdWqwEn6k6z4NdwzK/3XGUaXE+TKBpIRzB8TLN
	3Wd+RgaAmc7o5nA0cPq9F9wxbLKGcynBVo3X1QMJe4yBiwWwtcy31cgKvT6O5TSsyVvzn/a3mO6
	2n1F05d83XNiPgQk7JQlYNJdfFjJMC0gV1s91kfRWCqP9l4nCUO3+FNxeH058VNBOlFq7nO4JO8
	zqWCFF0KVHvGnRE1uXOY9UNwtSG0b+PJGlnry2NSRs3yePErDo+FlWOzgpe3ChB3HXhAVhk9jnO
	9BPJaI5eZzTqpRGMEstW2kZy9u9SUY1PD4aounFEsbiLJtiZuJWfhwDa1fwkVYyAxTwmbO52TdC
	tsxkDKWNf3UdkLZXBe1OA9ODuZZoiTpbUugt92HyCPmduXbt3OpexNB48S3ZJdDJ4asRcRG4HrD
	uo
X-Received: by 2002:a05:7301:11b:b0:36d:2b50:4eb9 with SMTP id 5a478bee46e88-37967316395mr11944921eec.25.1794829759180;
        Mon, 16 Nov 2026 03:49:19 -0800 (PST)
X-Received: by 2002:a05:7301:11b:b0:36d:2b50:4eb9 with SMTP id 5a478bee46e88-37967316395mr11944896eec.25.1794829758554;
        Mon, 16 Nov 2026 03:49:18 -0800 (PST)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955822d58sm33802844eec.10.2026.11.16.03.49.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 03:49:18 -0800 (PST)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 1/2] arm64: dts: qcom: talos: Add graph port placeholders for USB Type-C muxing
Date: Mon, 16 Nov 2026 17:16:40 +0530
Message-ID: <20261116114908.1701258-2-akash.kumar@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116114908.1701258-1-akash.kumar@oss.qualcomm.com>
References: <20261116114908.1701258-1-akash.kumar@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=R7WWitRX c=1 sm=1 tr=0 ts=6afaedc0 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=OnC3CdEk30aKpSFVcR8A:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA0NiBTYWx0ZWRfX9qP5GQqd3e6g
 d7MW8V37UWuYA7mqdoZMH+omSUCU8lRx0Eh659mQw3knna096TKBC0wSOtjGSzDTXD7NKhPmaNt
 w4srYsw7PHmD/cSYdFk7B/w7zsW2hgw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA0NiBTYWx0ZWRfX5yXEzvDX0r5L
 MQqknN7M8pz7BPhdNMxvz9pdI/MbbKXvvC0M9BQg8w9mYHdSlynUidWT2+4bUuAMijfgGNcfH64
 g2aKzkbxOrcexE+Rio51xn8yhjwAvWrt1AfzBIymQBIwey166o16loPbElxnGY3CWzZkDShVVGv
 gCSwCKvABjjaYzoaxoFzS1NkAtnHqYLuqI/c6X66aygcED2pnwMHJO8cm7Yrw8WTGdq/qbtWStb
 yGYcM874nnK3cfgV1c/Lj1igBojxA/hwvzCeut709j0bd8yODCBtbQLXDHSh8Lwsq/K2H7uDENU
 AtQax7yxByqymmWYMBxVlzbiKso+wlgc5xddPPM5KaYy9PvwKvEdGVjO4ii5ylB7EdIn45p30SB
 A9ZgB8pfT/lC2kx4M7MJyigucMuruel6zTig5DkRgRH/IxZIPvnq6jJ1y+D+wsJL2eNAgxkGg5H
 FZEOANLNzdFgIm00pcg==
X-Proofpoint-GUID: DyTC2sSobOAYbXvOtjp81HQHFcoc_Ww5
X-Proofpoint-ORIG-GUID: DyTC2sSobOAYbXvOtjp81HQHFcoc_Ww5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 phishscore=0 adultscore=0
 bulkscore=0 malwarescore=0 suspectscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160046

From: Akash Kumar <akakum@qti.qualcomm.com>

Add empty port/endpoint nodes on the primary USB QMP PHY (usb_qmpphy)
and the usb_1/usb_2 dwc3 controllers, along with orientation-switch on
the PHY. These placeholders let board files wire up a USB-C PD
controller's HS/SS endpoints directly via
&label { remote-endpoint = <...>; }; instead of redeclaring the
port/ports structure on the shared nodes.

Signed-off-by: Akash Kumar <akakum@qti.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 35 +++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index 1d74e459f892..04636fd88807 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -5078,7 +5078,21 @@ usb_qmpphy: phy@88e6000 {
 
 			#phy-cells = <0>;
 
+			orientation-switch;
+
 			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					usb_qmpphy_out: endpoint {
+					};
+				};
+			};
 		};
 
 		usb_qmpphy_2: phy@88e8000 {
@@ -5163,7 +5177,21 @@ usb_1: usb@a600000 {
 			wakeup-source;
 			dma-coherent;
 
+			usb-role-switch;
+
 			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					usb_1_dwc3_hs: endpoint {
+					};
+				};
+			};
 		};
 
 		usb_2: usb@a800000 {
@@ -5220,7 +5248,14 @@ usb_2: usb@a800000 {
 			wakeup-source;
 			dma-coherent;
 
+			usb-role-switch;
+
 			status = "disabled";
+
+			port {
+				usb_2_dwc3_hs: endpoint {
+				};
+			};
 		};
 
 		tsens0: thermal-sensor@c263000 {
-- 
2.43.0

