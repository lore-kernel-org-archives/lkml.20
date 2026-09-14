Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F45D48C3E5
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390214; cv=none; b=dPQi5DamYYyjjpY3hsfybHvQFZM7QbIeYItMwCMGcvfkolKVlYSSDEuk2KrNpjAQpifBwSVRBhFsm3+kriGR+vhY3rXB2m0zo5EpKsNHFBQo5nZOQdZWwaJbuaOrB4Wp1U/s4m819WQpy7HEWM5cYfWmP4GuenKfdbydsdtYI/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390214; c=relaxed/simple;
	bh=f7zFNC7Ga0KARgEeV11nyncXAlnMUFUz8jSYYAfcsMo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VCE05Q7J+fW0F35pbSoJWIuZo3kUgaoh2RbAQk0rydL4EHRDaSYnGDcjChlXA2YSs8oIH42R+aK4kmrkMGbh72KO4rMuJ1SP6lEnTNDSHRV73XULN1Fnd86HmOG1Y/n1nyFW0cFv/Cuwsn3GrQKAdrHsHA/sk1sU+Bc30fFQLLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M3TQFPz9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iVv51d03; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M3TQFPz9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iVv51d03"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAm8qZ531006
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:50:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Msl+PMWNKMeXVrW2pFB7q+pvHrllvBjiq4Fpzko+780=; b=M3TQFPz94zBYJC9l
	jUIgWFqLM5JiOL1iGRf1x0sf+OJVEwcUHFqBe+Bi2WHbfftySXq1NWGWZGluV6S9
	sbH4/unqGJfJ8kmvoK5AhLZ3iKRlsypIc2obtKPwqCD4uk80s61YWR4Uleh9+CKp
	ou+asqXeknIA+aRze3Y6WDX0Mjv64uzfJB0Qvd7cW4xbqPt/BCsZCbPh97Jhc/wP
	gT2iNqg5KCMWNIKMqdanllnV/G1pCaoS53R5RGDJ9ODHbvMNMRzA+ApKHCXE20a5
	xqqTSxxATy+6R1WJ9N+52XSLvHj29z7gOUnCO9SUq1Q0BQ2GxTe+1r65+go1bo9C
	JskgvQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gp3hstfu0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:50:10 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-939a6937513so504149985a.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 05:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789390210; x=1789995010; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Msl+PMWNKMeXVrW2pFB7q+pvHrllvBjiq4Fpzko+780=;
        b=iVv51d03A4zXpa+QBtVHClrENgWpdy/TtcfNQ6ICXPji0TGnCjSpdlxHXwvShMzSxz
         3yx4ukB4zztdJbKD6kDZQQmAJa84NuyI2thLohJfXOrKZ4yaKx70fft+zfTMvweUl046
         2S/QJxoV7ZmBXwfEbr+qk4DzJX7DkdL468snl/epRV4M9OOCHKgdA+ozepinDS5DAj96
         O8xwGG10CbiMOdLab+LCrIkMlPTofW1KjXFPz2X5EIAgcsbwRRQR5x+Dn3DYx/1Sqf8x
         Ke3m5BmhqHLaI+wVLu68K5AfnV99eLaejRXsUNpuLZ+r5EuPh0r+hrcD9hbodmSAixTG
         ONeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789390210; x=1789995010;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Msl+PMWNKMeXVrW2pFB7q+pvHrllvBjiq4Fpzko+780=;
        b=o8BsXubndY7R3KdEJlwWa52JFDbfOhAq/ivECi0K2YiH5zEkEv8PRylDKmsMiXgxi/
         ozVcO5bMCWfUxtaU/JbDtoTBDvUsjoyJcTnwHiCG670cUVtIDV7KiBSesvpJIVABw5cM
         3141U5aZokakBZ0cU0pjVluM9KEcB+DWP7j0VXv+xf+02jq36NVCKzqcMe4/scS3wRAF
         c+XRfCdPP92/ovkJFN6LmoEUR7PVV6QtxfBZfFoXkWx7Nxe1ej7YLqEAlst95h7RABPm
         Czr9PgfH3ne49ny1bzYiDFkf3TRSQD3zJJs9GUXYSQX8Yr2fUBvaOR6RDEpqywcObT4k
         HMhw==
X-Forwarded-Encrypted: i=1; AKwUvBy4UJe6O6v5r+eQPyK1rO8l/WrXwtMBDNmMA2E3mEjUXY7dFXbCTvxE0h4xfpt17ycDQah0OSXd3gAr/zY=@vger.kernel.org
X-Gm-Message-State: AFuF++kAOlY+MQbTo/xhUweQmBjD0UqBnoGGNPNpgfPbDP4YZl1FLgi3
	Br5bUocX5YXD4VmPEvpLw8OV2tKsN9eLoieDJW3nfoh9PoqERN+tnlMM/jmyXNg79YJQDvuglxn
	FD0QtXzg5Cd45+c6CzXFm8aIEXY3Db4ItDNW8ZqOZEbuPszDigu1Emt3v2K1mdU+7QZU=
X-Gm-Gg: AYBFou3PwLSU4oUj3LRsAOXvBz+tMSowCkEkXviH2ABvnxIJ9W2kzsH2ArhWyfN/MZ0
	4QOZ5n0cry6jOPMh6nDXlXPUqQwARvDOvO+JuhFDNQ8m07uJ2OdS+W3p7mt8oVCXv80l/0y6Pb1
	tbegGeJsDrI8r3+VTHo3b9Qd0+tsgeVqJjaYQ8f/TNkIiEWmdC5yajYDAmTvE34dOte17jebItQ
	9a2w3MsZG01wQCKZ2w7ldvBCkpbm9bNY4/ZqhfJxQ/dowA75/Thw1Rdbdq4rsP4AWpz9DiGdek4
	GixZ8dZ2aDCXI/zKnOg0MdxKpE+OePtpuSyMuO2ExX47VXPw2un7eMnNi/hBK6vCfnLKsGfGeVT
	rF27TPxgF
X-Received: by 2002:a05:620a:1a06:b0:939:c0b3:6d8e with SMTP id af79cd13be357-93a299fbed8mr323601485a.30.1789390210090;
        Mon, 14 Sep 2026 05:50:10 -0700 (PDT)
X-Received: by 2002:a05:620a:1a06:b0:939:c0b3:6d8e with SMTP id af79cd13be357-93a299fbed8mr323591885a.30.1789390209513;
        Mon, 14 Sep 2026 05:50:09 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6c566bdbsm242387555e9.11.2026.09.14.05.50.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 05:50:08 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 15:47:47 +0300
Subject: [PATCH v4 48/52] arm64: dts: qcom: sm8450: Add GCC CX power domain
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-qcom-tie-cx-to-gcc-v4-48-9d5a606ada33@oss.qualcomm.com>
References: <20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com>
In-Reply-To: <20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1038;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=f7zFNC7Ga0KARgEeV11nyncXAlnMUFUz8jSYYAfcsMo=;
 b=kA0DAAoBG19EyQCVFVYByyZiAGqn7Pqh4WKwQTP9o8/PuBM67dH/tK+AcJjQ6MVQaEnHhDZeH
 4kCMwQAAQoAHRYhBE7z7hFOeo8qyqfRuBtfRMkAlRVWBQJqp+z6AAoJEBtfRMkAlRVWtqcP+gKv
 /Vy/OQbFtgf4SYt1/KOxi4Qzp/OtP0DL5lKwqmrKwemvnZOYhBrM9e0x0Zf5M92wtlqwXUvjyjk
 qfJC7a9eceioomofVaEbNPbyxclkKQd8HIphOsHh6QKcHCDG4ys/rxY03M+WTnjq2+r+NOAN9c1
 tnt8B2yyrXxdY34Xu7E7hJMP4vtHIxXPA9kvNJFiWYRAwfVA6glX32dkhNnxXhSltH/CVQRv4M7
 VZ9EnuiPByw8sDzQHSwM9OguaWF/dhAyvxYwR3ckp4vcqE1ilHs6ddmnC2HdLhmwIG3lZ2keHZx
 eIrSsZQKDsGvQr+5wn3Xf18wYvvEgOy0R+kvGPEcPLMGo+gHBCbofxgZyxBxHt7S4UlY29P8ECy
 U0vapVl0OVvew9RvF0aWd7yXiG/WAPlA6HhhiRiGXW4GBbrjzMbycEWefJeB/jD0Qzuxi8/ncTw
 se2c/A8k1jjn0+aZWriBGDZt22o+stz46v/Rh7OMbLwL9YN2sQK4+q7K+1Dn9bYiN+m7moxzHb3
 i8ozphccH50bFHmXxgASFKfWDGSkI+tALj1XbsQ3maZYk0HizlUkCFEHROjZxCNPFTZTezFOrZE
 /nmm0g7EPlfMN4IP/clM1wvLTNHid+CWoot+Bn30PF5ipt+he8yoYWBLFHga4py+MMpvgr3Hq0g
 TzE9K
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE4MyBTYWx0ZWRfXzpYUVrmUO8Y6
 +ojtsMp2wgLJ2Mssu5Ao35aGo0uRpKo27wOkGvwV7H985BiyBO+3n4rQdlC2x+I1b4LZrsPxjO2
 Iq6HBjwaU9ZmM84KHomF3sFUXCzQaWsOdv6wdrM0ZRLnAFR5GcQwODtYfDkuisWz89hRrP3NxEK
 7XJYWf2wk1Rya4YRPvO22o+YSU1HBOZDVX3hBEaCaGpzJJSXAumiskJRZO2NTHHJthUrHzLcb5T
 sdM00KKAYbNAiy5HA/UBJTANbIp4DvHdiPUxZXHkFEdE3kAj+BneqU7OJQX2ZFgyQ/DWBJuGEN/
 FHooANakXMHeczXW6+f80wViRlmqadXTHUM0qpGyQw0LjKdEaT8T0wV80fFHLLtFksLdySRTIGG
 wso34/b/EIjhRXiTgkzf67hXZR4y5Yb0PU0G7UQ6r9L13T8G5VNzDdMMIkd9UU45GJ1VuBvHihz
 O1htr5utWIMY8VtsHjg==
X-Authority-Analysis: v=2.4 cv=IZwSymqa c=1 sm=1 tr=0 ts=6aa7ed82 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=cMt5CT0DYXTQOAQHtqMA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: OBxXdrQ1eZRZXRSkSlnCdjfoK9-Huj5b
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE4MyBTYWx0ZWRfX7cdCir58eJjp
 aCXlt4tcg68WTVDRLIKDBN4zXG8TsYCtz/3jw62zGaA4B6jsbrHnI/dzbaA709Vcrwd/WTag5ux
 KPIqRl90VpoPGCHx0b/QSILEWm8plTM=
X-Proofpoint-ORIG-GUID: OBxXdrQ1eZRZXRSkSlnCdjfoK9-Huj5b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 phishscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140183

The GCC GDSCs on SM8450 are backed by the RPMh CX power domain. Without
describing that parent domain, consumers of GCC-provided GDSCs can enable
their local domain without causing the required CX vote to be held.

Add the CX power-domain reference to the GCC node so votes from GCC GDSC
consumers can propagate to RPMh CX.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 484ec8ec8c10..1af29c5476e3 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -941,6 +941,7 @@ gcc: clock-controller@100000 {
 				      "ufs_phy_rx_symbol_1_clk",
 				      "ufs_phy_tx_symbol_0_clk",
 				      "usb3_phy_wrapper_gcc_usb30_pipe_clk";
+			power-domains = <&rpmhpd RPMHPD_CX>;
 		};
 
 		gpi_dma2: dma-controller@800000 {

-- 
2.54.0

