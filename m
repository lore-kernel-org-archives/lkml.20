Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794469250;
	b=21CVPFvEhsaRrGwYcjoi+bHTTlEJXMCnahFslorjHVZbTRnSvJ0MdXSyUYTCGa1TWHOO
	 tDVIZrpzEWkQ45ZAW3VkBWuPzzwvOyiU9i7BL6WGyWSKROuFzq3bymsNU5tYeOjn0Wh6+
	 iLWEnjkYAG/UT5ia0TAWamLW3MF48INXQLlkKvzgn9KoEzkF1CysPv12hu+wC5r59r5pU
	 XJ9WooisRPdrnifPe9Am252aZkJUj+mWG5mZjzvb7jeAJ45j1jfd3oaT+XP1aYp1cGzpo
	 kPahxqZzENrzUEM/IIUrnc6ZcmvkOBs/vNQnDlZfd6YGIDBXUXts9OQdKkwUpyt197A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794469250;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=R1n5zSDWOw48FitIOcKvZt+VZRB4EBJp/2COvX/Ix5c=;
	b=CFxyDB5TWR7eVsHLHlz5D8THxL2tImVIkTAZLNtnRLGdnbaOeZN279C+xWE5gcvi7B5E
	 byOb8mo+l5wBvKPSIoMNp9DyAQWmiKFB4WIx0P9t/9osKNYO36AJvofrV7Qh4rWJ4AyFj
	 nq4CDGiKDhjk43GpLnb51LLFVi0ehrE6nziUCMTZAwmPMypgJbLdF+BHeJRlYSbxETo03
	 wC3CyK4EZN6cfPNYykD/QSoyS3t+bxSazspInmpFuNfwKM8cb0zu/r+xKOs2f9qkrc6oh
	 aEVnU+EPARUDjRNiWt6/TpKlDXEQuU/4W4y+tJeLDLP656TQVWiBjmUTmHn65ONadAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=H7a2oA2L;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A3zjw2wM;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B3BC606A327
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 07:40:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B3BC606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=H7a2oA2L;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A3zjw2wM
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC2ZOiF4092370
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 07:40:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=R1n5zSDWOw48FitIOcKvZt
	+VZRB4EBJp/2COvX/Ix5c=; b=H7a2oA2Lu1HJsu0WffvUOPm/Rrqq2GDYE8cK+y
	WWUiOSuWVCRHH6vez2yllWLqmIQ9bNmQmCVNgjbsMIQwVq5qfFml+RiK1h2C+kjd
	eQ5OdB7F0pCDsW6FGXI4p5ugu7eogieLtfhs54d9sDAf58zXcZyaUedzfmpo9M02
	2VU3VsQ1KeEgdCZSbrbltX8UFru4+ciIAJCE3LaSEM3zwfRQ/kNEFMGMbOjG1YjX
	z9TdCN5q4K/+Emazew4AlL/Zx8xQFB1T3NpdSqjPFdTLlltkOdqN/G4t4lRNJtqx
	e61U+nbIsGoys6q1HKN0Dglj4AY2ZttocmN8Hpp9Enwog9BQ==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw0m8hrv0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 07:40:48 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-154e9d2d94fso2809323c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 23:40:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794469248; x=1795074048; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=R1n5zSDWOw48FitIOcKvZt+VZRB4EBJp/2COvX/Ix5c=;
        b=A3zjw2wMAMp/SHQIWomVFnVkasLn6pvpWsVt7UZ8EEIx4vWs0QyP6xbN6Jc6T9MHal
         mgw2kTbpk88D452qK/XFAcLNo7mbgtbUkYWzTIcrGgvsbwu5jLuL9kYlmpqt4f9L+KPK
         Ur/0rRKcTTeJ0A3MqGZ12lOqRAcDidsKkfBfQcbJ8DdXxVEjQVLRa1C/Dw5hY5FpQu21
         JLmJe2AO8qjdJ4tHb0RWbs5LrLODloI8AxUd5vSw6KaTEQ8SSzQ2q6lSs866HVihTP/y
         YCrmDoYn40YnafbwZRF73HhvNyQ5J8Icz2sfKIdVrgpBOGb/3EMxFeJpJ+RzxnVDEZ8o
         boxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794469248; x=1795074048;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=R1n5zSDWOw48FitIOcKvZt+VZRB4EBJp/2COvX/Ix5c=;
        b=zlmVaD2OPZPuTiY0x10cc02B1KghGn5AzruHIbMdKpP23OVtjmDscob+Ga6Q8nSQ1b
         a1LlRcZ4oBr2TW/rS7gX7Zh+aosaMf9UekDyPAfpwavUBAFuDOTpkPsa2/vZDnB0aXRW
         OUrQVvWdhf/SAVyPo7fOCwpTA+GggAgm+gRUyzI//po1bxdzy5MNEjZIVKiyNEfN0WzU
         9KelB2g6dzZhLJKCZ54T9yFbRJfgQAn7iVwTsw89T7sg9Kj3BqvDRTc0wJ4W+bUWGJ+G
         DcTyi086TY5oH6xfrT26hRsp/9vE76tVwScDAwdmyB27aU7iLGBqEd9KGF9VbKcxOIQ/
         /yKQ==
X-Forwarded-Encrypted: i=1; AL+hErHJl670ou8H1TZQE7MnH+lEYnQ0+3Rmej1acNj9lGMwO8vAGrRYxad2py1mwUphVNyrN7+XsSNZB2IUsR8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/0ZlCPWkloBTD7S1Nk/5KoFcNvdmxXqIIRGDL1o/+6heytst2a
	+a+KBBZRX0erfRju+WPHjAvq/62YbaVEkXV97fCGIREuD7g4coqA9hpM7/Dzjowtoboh6g0xyYQ
	U6VvYQ0uLzlkYnxbeZTQ1ZsOMwTZVYfh+W2OtNawfzjuwVV/Rl3zpyKuUP1lmAe6xiWg=
X-Gm-Gg: AYBFou2SNHrqYINLqeSwp5PHBfbxSUZ0bQ8aBbImtPhMfshe+MCzAko+NR8RMgZe/ad
	IeKteYag1xM/IJzbxFUOKgz7/cIyEm8FK8ymPDIjVHPXoIeDI9tmjXzQj74k846lOsbYm836DJM
	DKRg7jJSa3AMbirDHjApGuyT+1HlIurj7vJXANZYCEMB1wQK6V8W4DZApQ2DKJehqtix2BdZTkw
	9Ddj9idabI0aNvRc0zOo1gBKX0rc4/HmQRflGDmqc07Em//LwFdJ00WvtOZu2AFB6UL1Bp8urdL
	r114BqmPa27IoPYNfCkl4/WcYYWDgpMqPRQeq2GfJ1xUWc+pHq2rgZPYbEQJZl/divRgsbssho2
	jFWN73SToZdqNosNMbW4JOPWy/Imo2yk5Ws415+h1VP5WajhW7h+UbD857IFIH7M3Pby4dg5p02
	izjQTGKd/p
X-Received: by 2002:a05:701b:2616:b0:166:862b:9bcc with SMTP id a92af1059eb24-1b3c03117c2mr4210766c88.18.1794469247870;
        Wed, 11 Nov 2026 23:40:47 -0800 (PST)
X-Received: by 2002:a05:701b:2616:b0:166:862b:9bcc with SMTP id a92af1059eb24-1b3c03117c2mr4210741c88.18.1794469247235;
        Wed, 11 Nov 2026 23:40:47 -0800 (PST)
Received: from hu-sushruts-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b56c4e88sm21348423c88.0.2026.11.11.23.40.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 23:40:46 -0800 (PST)
From: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 13:10:35 +0530
Subject: [PATCH] arm64: dts: qcom: qcs6490-rb3gen2-industrial-mezzanine:
 Disable ASPM for TC9563 switch
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
Content-Transfer-Encoding: 8bit
Message-Id: <20261112-ik_disable_aspm-v1-1-f43d8ca7703b@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAHJt9WoC/x3MSwqAMAwA0atI1hZMKl14FRFpNWrwSwMiSO9uc
 fkWMy8oR2GFpngh8i0q55GBZQHD4o+ZjYzZQBU5RCQjaz+K+rBx7/XaTU0u1GiRLFnI1RV5kuc
 /tl1KH9hAwithAAAA
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794469243; l=3999;
 i=sushrut.trivedi@oss.qualcomm.com; s=20251127; h=from:subject:message-id;
 bh=06awwlxiuQnDNoVlL7hQsLwDPAW7+UoPVXyUUVQRm80=;
 b=5ovEwLPEy43B6vv4/++G8pTp2yeTrcsfS7Lj9wdqOFOqgCNWJeHFRplfEaTEjH9ow3XRuZivr
 qtMET11ExXtCgcVJqi+GBoc5elw1LzeH6gvqjCTW8UoXokxv0lmszVe
X-Developer-Key: i=sushrut.trivedi@oss.qualcomm.com; a=ed25519;
 pk=OrUHTxBaSg1oY3CtCictJ5A4bDMNLRZS1S+QfD9pdjw=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAzMCBTYWx0ZWRfX6voop4d1qeYf
 G/aml0PprBXrNr5T++RIYDqzZrxMnC2oRk7WRnXehSfPwYzIDlZGjRd2C9UAFGDdYH7kKZVZmEM
 bek62Ggwgnfi12kIDrAwy068sxKY23E=
X-Proofpoint-GUID: JC5mcGtH-u0uTPCvi3ZqxeXC76JotD10
X-Proofpoint-ORIG-GUID: JC5mcGtH-u0uTPCvi3ZqxeXC76JotD10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAzMCBTYWx0ZWRfX0YV+Gz3mFbHw
 8CdPzYK9QdwloBh+1+fyvbCfq9gzBbkuQ7YctLf6QoRyRRrgyTO8b9wR7VlBEqGANxeusQ7ywS7
 MoNA76P+yfaRrDwb/hoHt89pBu1ZwvP0SSOSSEUOuujC67nDiGzimlnBiiIoVa8Q6hXsmHBwn93
 cur+Tg/lUKrL73R17KtOCTBbt6d6Yl9RhtFvjp0fUMbbZpYTQ/Zf0NMGYMwfcvxfoGD4kLtl/EY
 eqBfC5zV7nT9vsVLk0AFc14UW8wJmH+c1dJn/bTtpco2Ec9xddEheDXBwbQOPU2hW6/huWaaUJB
 io4ueZjPZtQGCtJt2jLyIakPR8LhcPqHdyTAgmtQ4/Sbk5ZEtkBJTPI8upaeNO5nptJzq0llWTn
 MHQBMR0+/yP0f6HU5E/+pkSe/QuJpzo53siT18ZK8bmSzS0Pio33SHXvoFZPuKLWH3qeWD8jFlo
 Qd7aH37gx+jQIcL4vYg==
X-Authority-Analysis: v=2.4 cv=Q9dHcI2a c=1 sm=1 tr=0 ts=6af56d80 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=CzsnHOTDfeirxBP3itQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 adultscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 clxscore=1011
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120030

In QCS6490 RB3gen2 Industrial Mezzanine platform, we have single TC9563
switch on PCIe0 and two TC9563 switches connected in cascade on PCIe1.
When ASPM L0s and L1 (excluding L1 sub-states) are enabled on this PCIe
hierarchy, data traffic may require coordinated recovery across more
than one link and switch. A failure or delay in one link’s transition
could therefore make the end-to-end path temporarily unavailable
resulting in software reporting a link-down or failed return to L0.

To avoid the same, disable ASPM L0s and L1 for this platform via DT for
every individual PCIe link.

Signed-off-by: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
---
 .../qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso | 39 ++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts       |  4 +--
 2 files changed, 41 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
index e8780646ab19..b8d56a216e40 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
@@ -104,6 +104,9 @@ pcie@0,0 {
 		pinctrl-0 = <&pcie0_tc9563_resx_n>;
 		pinctrl-names = "default";
 
+		aspm-no-l0s;
+		aspm-no-l1;
+
 		pcie@1,0 {
 			reg = <0x20800 0x0 0x0 0x0 0x0>;
 			#address-cells = <3>;
@@ -112,6 +115,9 @@ pcie@1,0 {
 			device_type = "pci";
 			ranges;
 			bus-range = <0x3 0xff>;
+
+			aspm-no-l0s;
+			aspm-no-l1;
 		};
 
 		pcie@2,0 {
@@ -122,6 +128,9 @@ pcie@2,0 {
 			device_type = "pci";
 			ranges;
 			bus-range = <0x4 0xff>;
+
+			aspm-no-l0s;
+			aspm-no-l1;
 		};
 
 		pcie@3,0 {
@@ -132,6 +141,9 @@ pcie@3,0 {
 			ranges;
 			bus-range = <0x5 0xff>;
 
+			aspm-no-l0s;
+			aspm-no-l1;
+
 			dev@0,0 {
 				reg = <0x50000 0x0 0x0 0x0 0x0>;
 			};
@@ -163,6 +175,11 @@ &pcie1 {
 		    <0x901 &apps_smmu 0x1c99 0x0 0x1>;
 };
 
+&pcie1_port0 {
+	aspm-no-l0s;
+	aspm-no-l1;
+};
+
 &pcie1_switch0_dsp1 {
 	#address-cells = <3>;
 	#size-cells = <2>;
@@ -191,6 +208,9 @@ pcie@0,0 {
 		pinctrl-0 = <&pcie1_tc9563_resx_n>;
 		pinctrl-names = "default";
 
+		aspm-no-l0s;
+		aspm-no-l1;
+
 		pcie@1,0 {
 			reg = <0x40800 0x0 0x0 0x0 0x0>;
 			#address-cells = <3>;
@@ -199,6 +219,9 @@ pcie@1,0 {
 			device_type = "pci";
 			ranges;
 			bus-range = <0x3 0xff>;
+
+			aspm-no-l0s;
+			aspm-no-l1;
 		};
 
 		pcie@2,0 {
@@ -209,6 +232,9 @@ pcie@2,0 {
 			device_type = "pci";
 			ranges;
 			bus-range = <0x4 0xff>;
+
+			aspm-no-l0s;
+			aspm-no-l1;
 		};
 
 		pcie@3,0 {
@@ -219,6 +245,9 @@ pcie@3,0 {
 			ranges;
 			bus-range = <0x5 0xff>;
 
+			aspm-no-l0s;
+			aspm-no-l1;
+
 			dev@0,0 {
 				reg = <0x50000 0x0 0x0 0x0 0x0>;
 			};
@@ -230,6 +259,16 @@ dev@0,1 {
 	};
 };
 
+&pcie1_switch0_dsp2 {
+	aspm-no-l0s;
+	aspm-no-l1;
+};
+
+&pcie1_switch0_dsp3 {
+	aspm-no-l0s;
+	aspm-no-l1;
+};
+
 &tlmm {
 	pcie0_tc9563_resx_n: pcie0-tc9563-resx-state {
 		pins = "gpio78";
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index 909039816a21..afdcb03b070f 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -901,7 +901,7 @@ pcie1_switch0_dsp1: pcie@1,0 {
 			bus-range = <0x3 0xff>;
 		};
 
-		pcie@2,0 {
+		pcie1_switch0_dsp2: pcie@2,0 {
 			reg = <0x21000 0x0 0x0 0x0 0x0>;
 			#address-cells = <3>;
 			#size-cells = <2>;
@@ -946,7 +946,7 @@ gl3590_3_0: hub@2 {
 			};
 		};
 
-		pcie@3,0 {
+		pcie1_switch0_dsp3: pcie@3,0 {
 			reg = <0x21800 0x0 0x0 0x0 0x0>;
 			#address-cells = <3>;
 			#size-cells = <2>;

---
base-commit: 630059a5a632377b9b7b487baccde92b7ae1dd47
change-id: 20261112-ik_disable_aspm-426b41312323

Best regards,
-- 
Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>

