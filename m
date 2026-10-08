Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAE5B48F825
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 09:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791450928; cv=none; b=oc7TREB3SjfJVcC9aKn1UHaeRT0kDsJ64PyZZWuMp7oqDzG/d2vfls32zISWfXuuk1495vJbno+77tIdSJdg7tZ88zjIG+xOj8qI8fESpQW6nlTBNGbNwPq+L4pe6m0DvW+GZbEiLHoBjAVpnl2W+jtYgZKara7wDhlz+cFST20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791450928; c=relaxed/simple;
	bh=3d9/a9jjN7GAxpxkt4zvvXZScodzf1IsGMV7uENdLz4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tlNicooThaa63/jsLG7pJZWHOJlT6JGWJ6rfYFp1S9rNVwWPILNtkwkNCxc75C1Lo/hJjwSnkZ1Ln7o/MGJRohCEgyyNmVRaj5uee91LBWV23jlq7xmJI9tqsD2/ZaaLxO1UKF9eo2TTDVw6C/7PnyuX1H5wZiWuvtRMhhB/Lf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cKaV+0Es; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MO7o0bjU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cKaV+0Es";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MO7o0bjU"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6987K3LI2189789
	for <linux-kernel@vger.kernel.org>; Thu, 8 Oct 2026 09:15:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Jif7VDWkcxpHWo5f464ZlO5jXohlLqKyfu0q1fOYDqI=; b=cKaV+0Es539E1VlW
	rWa79AnDt5ZucKUMuOdR8l7/V4gu6Pf3XoBgUoU5nSvFbfgTUHRTyCn05kgVPX4o
	sg2Kg4gbsM+skULywNPPR90bzmsDMkrkO368or9EIE+6T7/tWGm5VTKyYOL7Dh3I
	M+zmO+yMIEZTdMMBLz0J376RDpjhTfDX2lS04tZBhdbHXv6LTMHL6Ykmk+ovGRrD
	DlVmuGeH7Qu6Huj/U9K7lvOmMzcnlHER1a0URStPZnMkPQh4RVYlcvh61V61RnkD
	3BHzEL1P7CV4JPkzUuVyZVEB9txLahwoJan+TIZH/Hwh6aBn53C5SBBrT5GLXjhV
	NTGmeQ==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe3a2y5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 09:15:17 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-154e9d2d94fso10409041c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 02:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791450917; x=1792055717; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jif7VDWkcxpHWo5f464ZlO5jXohlLqKyfu0q1fOYDqI=;
        b=MO7o0bjUJocWZLUz8eWv358WBVVktQlxS2+O4Qp903p/VEzj7ttHNULJ4RCdT4QazE
         ZxTed/UNzLChv8ZG+GnfFvtneSV7dqhXCWva+uaQwSAgnSzooV4hp+eOWBC5p/D2mkxO
         eveufqFBCqnfPnaTejnSQdv6Cfon895xdNa2lLLo1+qWc6B0rh7cBWGh7EpZGK7kpvFH
         izzruJ309l50htD9WseqiIUuYwYCvBYoHixLs8v5c5KtB49pvnWNQGMxV9FpP3YoXu3a
         NZgzqGYa31K1GAr0aytgfwcs2EN9bR99sjGccmzWLztPWvYZQLbDUP/j1eazyNF293LC
         BpxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791450917; x=1792055717;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jif7VDWkcxpHWo5f464ZlO5jXohlLqKyfu0q1fOYDqI=;
        b=cRCuJqBsg/WvkZrIFFU5VuYfcpdLe6FZC2jINIU71y53WrLh+fgRtfVMfEzrvCXnkP
         bkzi4gvoSgFzAKArevejKc9cCxaSr/k6nBi6YPYVLPpYvcHYGa8V51Fzpg6zQLu5dyWz
         e94l2W5NWuORbXvZKQs+SkkT9GBcBVJ+yndXe815yhYQ6QBiRLoYbhx6czgG2jyG6HHU
         rFmAyi5kl4V8bGaXbg7/F6GkI/3VJAQzgrjhhZn4z/Hx3VL7st3HLCS6AUoVt1U+Y7on
         kfWYKDbISLcVmEUD//mU+HlT1doA1hN4HrZVHY7XgUnEhG1+gjq96RcbSC/GUbhN3Y6h
         QQLw==
X-Forwarded-Encrypted: i=1; AKwUvBzfOvaaalr0dkm1zZPzRkcRW/Sa5Y7XMOQReu2fWIC8ATEe2daHe/RxUg474+bpnx0fOCMhjzNY3ouTGLw=@vger.kernel.org
X-Gm-Message-State: AFuF++miZgUbg1AV+3mwia/Dj2fCUTkYEWiGGKAnsg0zfuig4d5gUwFs
	KdX/n1yQ8/bX53oZC00qtFiwpTc8CL74QcdLE3ro4pc5k7W0bSOnQLTtfp7gN+2L5TR4LBwQyBR
	O5yPeC1i58QltdN3XN5seCb9cNbMCDQTyQFzOKEXAe/4F3A58q44WFEgFJQhf0JkmfUM=
X-Gm-Gg: AYBFou2uNrhc68dyn7wFaNJzpbLxelZfa4IcpPwxj0vCD9jDgXr2RRWYgtvoyiF5T+p
	aijg4X55LnjwAGUKy2bC17dxVyp+Ivf/K0E7kKaCwN8N0gRzJOa1PhDN6q4MSfLWN5Hi23I1YMi
	K+AvpgSPogSufRdNZk+lA5hWgL4d4f5oOuI751tcSS7wmFYpEZfPi/OOI2fWVsYhz+OJtV7U9MD
	fn5dNyrY+LN2M5wL9ApYT8hg0aZPROqnV858wIPhuZaeixfcSMfevf2HkjPIAZk5nPpfPduYLpI
	Hj2ElCxKCcaw+8hi9u5EfGfWXeRt8Xkk/BvbD4LovHaOQXuk8a+MLbUmTBxHfbmAa217XKCiAXi
	3uVTAUTcfJ+qxkguKM32c9mPCOZyVzGbXbnThV32nDPjlrw6LSOqGw8PH/xEy2N0SwGTLyOeXi9
	EDANJKUj7NZs7om/I/5JzW4B0Vpygc
X-Received: by 2002:a05:7022:ed0a:b0:150:1cea:31b0 with SMTP id a92af1059eb24-16205cc1e56mr6233889c88.13.1791450917082;
        Thu, 08 Oct 2026 02:15:17 -0700 (PDT)
X-Received: by 2002:a05:7022:ed0a:b0:150:1cea:31b0 with SMTP id a92af1059eb24-16205cc1e56mr6233825c88.13.1791450916215;
        Thu, 08 Oct 2026 02:15:16 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1615f1ac8c5sm24456045c88.2.2026.10.08.02.15.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 02:15:15 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 14:44:31 +0530
Subject: [PATCH v6 11/11] arm64: dts: qcom: ipq5210: Add random number
 generator node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-08-dts-v6-11-f9c4ec8664d8@oss.qualcomm.com>
References: <20261008-08-dts-v6-0-f9c4ec8664d8@oss.qualcomm.com>
In-Reply-To: <20261008-08-dts-v6-0-f9c4ec8664d8@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=J4s/fwnS c=1 sm=1 tr=0 ts=6ac75f25 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=bztaWnFoPO8Rjwv9oDEA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAzNiBTYWx0ZWRfX1s4IXy/FqMvJ
 5k82zn5SEaooEEQs9UjU+uhW597qYjsB3VKmEiW/otEaDgGMUp+tMqUUFslZt5SZNhQgILAS6yI
 X1QyX0R57sNgLv9wj9ny9loK4nYTs2Y=
X-Proofpoint-GUID: 6tWbW0XGcU42tiMEiq_EQdDYzWPc0g85
X-Proofpoint-ORIG-GUID: 6tWbW0XGcU42tiMEiq_EQdDYzWPc0g85
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAzNiBTYWx0ZWRfX3yRnfqQ45MXt
 X7hXP/0p5TKDevvaiG6sW9Q2mgf0pKq7al1nmncodmhI+gD+LdVnoqdQZubRtjQvMgh92sJdTOu
 33d8jLa2d+msJF5JCTLqotXSQzI+YnGo1vqrZD/RkFgq6DSZZddOX18SDMXO8k2KA7DsQpe2xc7
 yWuJe89H83i3Xi3QqN2DDIZo4oGF3LnMRrD6caQ2fPwFLmx7zLWLNwUw1OuegyAxasjwKLIxBcZ
 Kl9POATtIpzftIj3a4PYKqBO02cOFlrK7HeiSLAxqpbMfD0SpPb1na79rvvGE8AJ54IEaudgxAf
 45H9diIysFIWn3i5hBqczqGP0oJujkQc6VpOpJogRZ1pIFtawq5zDQrrRi8/r7M/2XolB/ruwvJ
 aRuH+yTNc03vdgDPcmRRjq018u790xZC4gF9nI8cIFcSvX9NraDKP1/Bi/oKlA/YEo4DSsrsJ6Z
 xqW0xGJfDmyNKWG7ETA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080036

Add random generator node for the RNG block present in IPQ5210.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5210.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
index 23a2e27b70fa..4795de0c8baa 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
@@ -198,6 +198,13 @@ soc@0 {
 		dma-ranges = <0 0 0 0 0x10 0>;
 		ranges = <0 0 0 0 0x10 0>;
 
+		rng: rng@4c3000 {
+			compatible = "qcom,ipq5210-trng", "qcom,trng";
+			reg = <0x0 0x004c3000 0x0 0x1000>;
+			clocks = <&gcc GCC_QRNG_AHB_CLK>;
+			clock-names = "core";
+		};
+
 		qusb_phy_0: phy@7b000 {
 			compatible = "qcom,ipq5210-qusb2-phy", "qcom,ipq6018-qusb2-phy";
 			reg = <0x0 0x0007b000 0x0 0x180>;

-- 
2.34.1

