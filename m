Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794834334;
	b=2O69P32L+GNgIrT5jhN0NEtWGYCV57/qkcu1p6QMlowLGMarrsrUIS6DRA+q0GO3B9JI
	 maSNi2MI4r4BLb+h7agQ2Fjbo+YQlA+4m88j/E5F5/RlCArZmCgmXgU3GVacxjR5fZwm/
	 X0q1AugRpRg1Z6AR307mbGrCRXiQypUiIeUW28+ldGO1jUYdilwPBCPmwcf5B8sTEHUQ9
	 0fynQynPEMVf1tmuhmT8gTKn0aJI/vLa28TTppesoKUQJ7qRUxnvrf3jPHeKWiCqUChzj
	 n5WKtV9VyhByErSvORk9Er1xZdFFkK3KIvpxpCdwcAAjK+JJuxbElbu4xRKXbik8dWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794834334;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=zW2/gkGq4nmG+GVOGBUwZNxbaEMh5XvK4WG9k00wmcc=;
	b=eU+3OYctkimZqWYkq9Tbx88r5m2tJqENyMUlfrtXX2ma8ZUmJxDj/HKGp1u2exKJEzGJ
	 SKCp212SnI81QzFQ87q0BQk1yIAa/k3NrM+V+g9EGD9Dv6nNmPoeEavKzfLt2kDl6PbU0
	 B0Pq4OXc0jlTeazp0LWG2gqI63PxGeP0b+zQ/V4cv0RZUe9/VStIFMmD8HIdWCt9xq5gx
	 MmfE509e6JJn9duBK/QV4dsL9oB6tkZD89OSqIUpRh0j0i1cMdgpicH0S02jRMqyXJ7d4
	 WCXkuB4kKZFSGv76RQsiuFPJYWV1HXQGW+nOxHlaafNJ7e9bHnbNBXah+g6fphB6zyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=L3GmjFWl;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Lfii+hLx;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40EB4606A329
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:05:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40EB4606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=L3GmjFWl;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Lfii+hLx
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGC15Bm1483045
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:05:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=zW2/gkGq4nm
	G+GVOGBUwZNxbaEMh5XvK4WG9k00wmcc=; b=L3GmjFWlrlFor7knkaJSvSL1Mgz
	wy9KTmcLH8qeGIj5pxlYkA7dhjUUOtg9XV5eohN858ApqQ/Dn8CFpCt45XBthQzO
	BuppHD0aBQHcn4Y0hs15MLcjq6B2EwqLS7G/Dm4vpCuH5Ce2DgNeOw6QA+205zZ6
	oxPWxjv7+8bGgpXfwW6c+LL0/GmLNxZQ3iu9U/ts5rKlI0XPF6Wi2bcGvgWWfvhT
	eMAkoVtMV7HSU08onQJ4F3utwbS6hgS3aIqjZajo3rIJzPUqdEVTlJn5wPYMu5AA
	oUKoVR5cTyIe/GoUk3Ml9CVjRbELPxNGggTzD0f8z7s0XVXILKZSxMLvJ5g==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hyyrqgm3m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:05:33 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4c55ba309c2so4090120b6e.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 05:05:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794834332; x=1795439132; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zW2/gkGq4nmG+GVOGBUwZNxbaEMh5XvK4WG9k00wmcc=;
        b=Lfii+hLx4Bmh79R1Gg2XUa2V+4en0kB0kW2Rn6lQe2HM0KFjizKAhaPz/fbfprkimL
         RTNBaqeKnJIQQmTJHKm85ORkJKx30VYtIASAR9ryUQVELMWRMNON1ZpSlK/uzVU8rtC0
         8Dh27eqchMBURzeqQxksgkUYQcP7DAMTOXYBvA5ybh4B///B04u49z7iRasxa+ZMMNRM
         ub9iCx5ostIYFkGGNlojYCWA/oDhq4K20NVeYZ5LcjPL/KxoMJaPg1kmctKY38mkcpRC
         1B1XoDq7mXLoBWeKCbAqSM7Ey41U4Jq2dMmI0gtHc7Ut/9mrXdzSEP/8uOqPcR/63UE+
         jjFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794834332; x=1795439132;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zW2/gkGq4nmG+GVOGBUwZNxbaEMh5XvK4WG9k00wmcc=;
        b=uzuZFJcu2RxZUa8Nlf85fL97K1Qrdqbsm4/s0cuCARHPdA5ewTpOVl0gSIH9kgP7wZ
         ONuqTLnbtBRMJutF3pl7NflcwHsK+IijU5PtKRdVK8BE1taTc6mPL5Kq+qUN//0qLWtH
         uytNDRSXpGEJIBii9mL0jlrDIYmspa84JwfgyYMGr9VEcgcflYI93xb+5aaoiU+7Evkg
         JSNR48fQXzCC37SPGDnSNBrCJxaJOaTmVMm4oeJ42bXBrmlIcoYhNXGWVz38Gq23yxiv
         rIvXdYSIyYITg8hbURkgPoFNfgouv6mw63Xtu1Pa9omQYmypRBbLqqHTyfN6PMiAdfGK
         w9+A==
X-Forwarded-Encrypted: i=1; AL+hErFCTgLWoxzFCbUSI32qzY/4vYw5lWf7qIgRfs9UnklK8DthT6KptL1kd4Vlts+nb83IPrweY4E2GmnOs54=@vger.kernel.org
X-Gm-Message-State: APuU4Z/FXa2vjReKEAPxgiFiEWFejHlABjmozaB3wdlaJdnD+UfPGzaP
	ofX4YXaJUCF9WV127PdvoZ1a8T235F8uGGP8UvvvkUtiwWsNKPyACLsL71kJwkFPXfpIJYbJcmz
	yJoWytlRV09poOheyUs4kCfWiIkgcwd77sYGMeRZmhDe2vNHV3WkjwCZOh4k2Y/e51r8=
X-Gm-Gg: AYBFou3svXWOmm3Khcdgv9B3a6hD6y8klcZGCjjbB4rhTCx14Bmtk31eypioHFJodh5
	xNmRcO6McxKqqZE9vNpR4f3cD0IKwa2FgCLE5LVwSojJ7PhwMY9svNdZueJ/ydJ9QKSU5QSUbbU
	CzNgvvTVvY/LxpyIlG0vuOQpWgkguJdYQ1XiAiyj0a4Y9FzbNaqsFSY/sVow8JIwdMrAeCCTZLQ
	Sy94hbmHci54hOd9VjTf8FlnuRz8zgUfqtkZsom+bwDoXHkkp0pKmmBSA1MO10BLpTeYuLQnBYQ
	JG+0mybQKgpbm+dK7E35QSrWFLPLle4YkaN2JNOQGKgGy69OnvBz0yExcEXx94jMvVcfNhZy74S
	dP/YNb2jHrf6DuXWSXdk4IT9CXRSs0h+95OI6Y6Rrnq5vDIhP6wecC+h7LonMygoXOFla1lthe2
	zm
X-Received: by 2002:a05:6808:3c48:b0:4fc:3dc7:66af with SMTP id 5614622812f47-56e63794f3bmr8293794b6e.10.1794834332518;
        Mon, 16 Nov 2026 05:05:32 -0800 (PST)
X-Received: by 2002:a05:6808:3c48:b0:4fc:3dc7:66af with SMTP id 5614622812f47-56e63794f3bmr8293762b6e.10.1794834332061;
        Mon, 16 Nov 2026 05:05:32 -0800 (PST)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56e6fc3eaf6sm9895641b6e.5.2026.11.16.05.05.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 05:05:31 -0800 (PST)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Dmitry Baryshkov <lumag@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/2] arm64: dts: qcom: talos: Add graph port placeholders for USB Type-C muxing
Date: Mon, 16 Nov 2026 18:35:19 +0530
Message-ID: <20261116130520.1763088-2-akash.kumar@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116130520.1763088-1-akash.kumar@oss.qualcomm.com>
References: <20261116130520.1763088-1-akash.kumar@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=VcJir1p9 c=1 sm=1 tr=0 ts=6afaff9d cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=OnC3CdEk30aKpSFVcR8A:9 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-ORIG-GUID: U17-46F9K4YBLVI88ees1HrEd04VNoce
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA1MSBTYWx0ZWRfX8z51D2EAlAQA
 zhEpdF47pqgavVgI2jah+r1rWK1xvbmzqNCfxFIKW1YvTaU7tcfp3H71H2/OWGIEmt7ZpwEYz8M
 iq4KNfM/5+pen+nHEavfn/q7tg9X6JLNpVkJMkC90UEH/04Qxd/43kLc8Jz5RtTH+rA+4YLkRb3
 UbN2VZcEqfnLvV7F4PEhsseH5cxfaDTtphVdoffgAPzdL8m8UwvC5lxh9JOgceMKIlY1v579fX6
 qnJHSo8LIZYK0gZk+dmyu6jZkcdDk0nKNrRptAeOIQYsHoSfASbWWyYKfijmTmY//z+QOFOwqEk
 M8Gvbxpomm7CW4dqOr9Y0Rpd2e3Bv55ZIz1m5QvqmHrykm31/4+LM8d85AMoDXLTYHWZ8timwAZ
 PGzJqT3wooqdqKZGhbsL4t39MxbA1BcaJgxMi6YhFzIHLlWkY6xJ3+0BNJW3vuE7E6szpUjj8Jw
 jb/YWdJQIE9yeu6w5vw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA1MSBTYWx0ZWRfX6xIXlS++HPoh
 4yPCH31aHXEsDk10gw+4Dgw0T2dJRVKzc5Ssi4bI8te49bYlobym6sqFHa8iqZIB26zw0ImjiNO
 KwaHNxLoERHGBlJh6F7sxNOXfYenLLI=
X-Proofpoint-GUID: U17-46F9K4YBLVI88ees1HrEd04VNoce
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160051

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

