Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792549879;
	b=bEaNIPlGN/7V6sYFVtjqeE2aZQ2MmOIcT4YkK1O8Q8/VjBzJPFzwqovUe+By1AFXGQEC
	 ktYNrNzHCDTiy6Db5cq9MJTq7ymyIdcwXvptUPL+MU0/nb5YS1axiJVx8h11XaqmErExg
	 6bAX0QND4gG4ujcQN5S7BZka3PZzCPi0IochidX3cLi0jWK1+6rl7iKeOWNK7ry6DdEKF
	 Sa/W9VnNMYidUPT6c31ALFT+4UNqJHoFEtmQpNqSfy9YnkaRHO4MtxzJHCINYZzlFzscV
	 I9USYy2C9xaPfO+58CmMrz2G0/phjcDU9wimXR7WH4Rgjmtsb0QHhnQHWS3NzxkJ/aA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792549879;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=qPMpnxZn0+jgK6SSEccTYvaBjlcy+/GPU8I4DCZHIF8=;
	b=KXWm4WOa0o2OpxQm0lPmvMC1pWrQombtV5uIaNjfzYrBVcp9OM6L5+9am7ZiDj1PbbBQ
	 ce6floF16lGuUk7MOQmwyOpNDaN+PT1ihcCNoGXgoJNLmOTRlqB/TmnoGLTr/UQpI5tON
	 X8mH1iOQnNgSYYeBrNywDyM3lKHHUZqw8RBkV2bKNTr4xKVxZBgzlWRqi0iV6atabjXd2
	 mTSkjL9gkW5Inippc7Fp1eUcBZ8pdoP+yf8/EG7XbmunxpA9coTAWJP0aehprmCushr+k
	 kY8wPrIunN9VmKaHXg8GMoEHQr6x0M1BQUjjsJj4ah0i7nn8hDTchWzg0qy4WNBzaMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=m3wwcKlv;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VHwZXyW3;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BB2A606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 02:31:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BB2A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=m3wwcKlv;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VHwZXyW3
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L2J0oQ3996354
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 02:31:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=qPMpnxZn0+j
	gK6SSEccTYvaBjlcy+/GPU8I4DCZHIF8=; b=m3wwcKlvP9E6ulWosOR5GrUQrwD
	s9SsFp29R/kvCNULDnc9co8PE6EKUsYMOG6ExagLO0+b9B5HYTphQqfFFNVrDcH2
	cxO9XPZN5oP48aVgc3XfeDzVksuaZCnuuNTpukYwlVFxIBPy2b6DwMeFAb85sKo8
	OTXGwnOh+RfIkebEh6+iVf4+9EHf6U2ZE3P36SA2O/4gOx7wjfpATnwT8rdGJGm+
	oBjGvo22m8YLz6qR0Kdfe3ny720+vRju00+dEbGwoG37bPZtoZ7jwBPTxcE1DrzD
	/gkYJxYR9HKrwUzXqzX/Nt9pOTboKBRI39iMtTAHv9e/XUQk0iaMbl5tsuw==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hedajhk0u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 02:31:16 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-189d17eca17so40711c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 19:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792549876; x=1793154676; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qPMpnxZn0+jgK6SSEccTYvaBjlcy+/GPU8I4DCZHIF8=;
        b=VHwZXyW3lGpUd31l7lK+s20vIEYsd2kghFKhd2c6KHF0xI7MAhacD4AlHgjNpFc2SM
         UNorcueg55E0jIfa3aUAQUabAWFqJXJeg7hWUfojagMUsFO3o6CLxPlMU7CDBglS+KFC
         UztdgvHDVIgwGTqqYxOZBXpA5YtWBEB2hQQOoRcVA3kGdXR4zzZwznyKlpi5Cs3ZNdXv
         54ifBnw3OGuDYJInQb6LMvkuj4KzoFPFOV1ktco2YUpaWAIGYfIRMYtZZUPKXb1Nq8ZN
         09oXwewjbKEguoy364LB+XCSKWJ9IYiIZN46k+v57qouNthBWWGdTAg/uPDU08Smzgdp
         o7QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792549876; x=1793154676;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qPMpnxZn0+jgK6SSEccTYvaBjlcy+/GPU8I4DCZHIF8=;
        b=ZCXfwyWuX6R6A0mKu85qVe0/wuCBzvAOmmr0VGTzkIl3SMGiYOW5NM0ImGsK1IROdh
         XXFpCPXLSCP++n46egH0b6nfnIH0c6QFHkJcdlzRJpBVYIahhjmN9q5AEJZTv8ZFSa3M
         j2xQmA9nSDwqwC6zKtzC5C5dHXWeMQoNaP3trNveFeN5XuQ42YSPE+3sUE6YaFTzYm0H
         te1hRO5UEWXWBtlfVDWZ1Jx+laDdwRzlbmrvoJh5tgCsTnLUxnjYmi9QbQO0qbafpTs2
         20Xpjq/YeCt59WZ1BiQJbiYfi5Q1uFMD5Gd/b9Jh8B5wdc3HBaHyBOzO35D8Bak3TeCX
         B5rg==
X-Forwarded-Encrypted: i=1; AKwUvBwYt5/6HRlYSdNFDoLrWCizSsHLEs2x/VBxLdpPi7GE4WkgPbL10Nj+V1LpI6QNVs5wsJ3p3K5vHAINMN8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJVkD9dYAtjKTMu2kZ2/nZ96q8Hz4iC0JdX0tTY5O0/pb5jdq/V
	NWPWzcwWWafSoZgV7rj8tILnow2mHeyWZ56qev2z2qdRS9xcz7BwHvAUdqcc1pgyMHAOGPYRbZQ
	F5Y6L3zDophzrMOazoPZFoDf5VRaO/D0RAoO4va71DYRfVUNMc/fUP5zs3zgkndaRFX4=
X-Gm-Gg: AYBFou2WabHBzb/5b4R+XhUZfuf0K8awo3uZIZSl3ypXZgrE9T65MkPKfUxGUCGavNa
	ITSJBAzRRK9lsa2ORgyWT2/JnkO/JxZxUoVHOHowKThchowaQBimXJCHkb8xQmmaTfoStioUGY/
	sqjv3IEgjHaRTAF9OyF8iRdQRn87sdQ/1dE8tHb4S34JNqszchcTxvejHD5ySaXy+fM6jBGw4Nl
	hCcwOm27SbXggI+sOr3Uvsqz3fHsH6IdIozDHWatpvJWxcLkOg0eqmwAeGroAF7G6nhnPvG1QOD
	Esa7Hz+hEZauKuWVubaUDxTODdxkyeDW5Y2Yjvvb5vaFO/QCDeQuR85VdDHJxDvgN/OMJbCy66q
	RycskH4bwsdKR267+H+TL2Kt0r+PeArDf/E6nbCdvx1MnZdac8SUwXdy5kjo=
X-Received: by 2002:a05:7022:6ba1:b0:14a:5284:1bf5 with SMTP id a92af1059eb24-190a4a34c1amr1384415c88.13.1792549875362;
        Tue, 20 Oct 2026 19:31:15 -0700 (PDT)
X-Received: by 2002:a05:7022:6ba1:b0:14a:5284:1bf5 with SMTP id a92af1059eb24-190a4a34c1amr1384356c88.13.1792549874568;
        Tue, 20 Oct 2026 19:31:14 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903e02901fsm2395108c88.22.2026.10.20.19.31.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 19:31:14 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Yu Zhang <yu.zhang@oss.qualcomm.com>,
        Shuai Zhang <shuai.zhang@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH RFC v3 1/5] arm64: dts: qcom: nord: Add PCIe PHY and controller nodes
Date: Wed, 21 Oct 2026 10:29:16 +0800
Message-ID: <20261021022921.2053957-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021022921.2053957-1-shengchao.guo@oss.qualcomm.com>
References: <20261021022921.2053957-1-shengchao.guo@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAwOSBTYWx0ZWRfXwneF/5msQRO+
 LezpQsgDKTiVH+/T6GFi5wWUS+dOpY0LinBb3kByDr2e52cNVI/7lEbrxbqN6wV53pfwHj+CL8A
 zOI4PVWWbCe/3sZaHaLcbA8pezgVPih5Kce3obwgA6XFKNJtRutT0oQleHOtcqC3Om7F2AmhPAp
 RMhqU2DlfCSeL/PqTYqSU8umovbLDHi4KYqjWjwMFPkk6Q3ee/GVcRo7izgEwYJ6fZSzu2pKvoy
 5h0+FfLX1fEgyKt9PiIsRExUdkVQaKs9z5YugbWs7cuCcLKChbbAEzVuQY4yc++sWD4iYhsLSiI
 o10tPSXxMZLz87Ev1XnREtKEsQzkSmX70vovec/qvGt/+O1oIqNUvJtamp4hhaR7tSf96gfxBmI
 uOM5oZE6EJTadcLgaOQZtlut/Nyb/lM1OquOC3zVPi8ImzFd8NOEvvvsywY1tSljRDrqBFiaXaZ
 uQpQ2mZtu2KWB6qkbCQ==
X-Proofpoint-GUID: y0SNVe6cp56H9xAGI3V2u1y_w55yaSrA
X-Proofpoint-ORIG-GUID: y0SNVe6cp56H9xAGI3V2u1y_w55yaSrA
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAwOSBTYWx0ZWRfX0+tXYZd0kj1W
 NmTUHec1OdFfulLBl0cP8GFMn1o4PtQuJjo8zC176buOSn7HcwH8wjj/pUqI11KRKJrCBEh2FpE
 Xi9sc5PqVhSmmqGPHpVEgV+nTvqu1eU=
X-Authority-Analysis: v=2.4 cv=HrTjiETS c=1 sm=1 tr=0 ts=6ad823f4 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=7rqOJILHKxEwWM2FdFwA:9 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210009

From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

Nord has four PCIe controllers backed by a single quadfurcated Gen5
QMP PHY with four ports (A/B/C/D) and a common PCIe SMMU.  The ports
can be ganged into x16, x8+x8, x8+x4+x4 or x8+x4+x2+x2 topologies; the
topology in effect is selected by firmware through the TCSR link-config
mode register, which the PHY driver reads at probe time.  Describe the
x8+x4+x2+x2 topology, i.e. all four controllers usable, as that is the
configuration the boards ship with.

Add the controller and SMMU nodes to nord.dtsi, and the PHY node along
with the per-controller clocks, resets, GDSCs, interconnects, OPP tables
and TLMM pin states to nord-embedded.dtsi.  The four PCIe pipe clocks
also become available now, so hook them up as GCC parents in place of
the <0> placeholders.

The controllers and the PHY are left disabled here and enabled per
board.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-embedded.dtsi | 926 +++++++++++++++++++-
 arch/arm64/boot/dts/qcom/nord.dtsi          | 297 +++++++
 2 files changed, 1219 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
index 6dc4c871f41e..0b52b226d983 100644
--- a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
@@ -346,6 +346,738 @@ &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
 	pinctrl-names = "default";
 };
 
+&pcie0 {
+	clocks = <&gcc GCC_PCIE_A_AUX_CLK>,
+		 <&gcc GCC_PCIE_A_CFG_AHB_CLK>,
+		 <&gcc GCC_PCIE_A_MSTR_AXI_CLK>,
+		 <&gcc GCC_PCIE_A_SLV_AXI_CLK>,
+		 <&gcc GCC_PCIE_A_SLV_Q2A_AXI_CLK>;
+	clock-names = "aux",
+		      "cfg",
+		      "bus_master",
+		      "bus_slave",
+		      "slave_q2a";
+
+	assigned-clocks = <&gcc GCC_PCIE_A_AUX_CLK>;
+	assigned-clock-rates = <19200000>;
+
+	interconnects = <&pcie_data_inbound MASTER_PCIE_0 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_PCIE_0 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "pcie-mem",
+			     "cpu-pcie";
+
+	power-domains = <&gcc GCC_PCIE_A_GDSC>;
+
+	resets = <&gcc GCC_PCIE_A_BCR>,
+		 <&gcc GCC_PCIE_A_LINK_DOWN_BCR>;
+	reset-names = "pci",
+		      "link_down";
+
+	pinctrl-0 = <&pcie0_default>;
+	pinctrl-names = "default";
+
+	operating-points-v2 = <&pcie0_opp_table>;
+
+	pcie0_opp_table: opp-table {
+		compatible = "operating-points-v2";
+
+		/* GEN 1 x1 */
+		opp-2500000-1 {
+			opp-hz = /bits/ 64 <2500000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			opp-peak-kBps = <250000 1>;
+			opp-level = <1>;
+		};
+
+		/* GEN 1 x2 */
+		opp-5000000-1 {
+			opp-hz = /bits/ 64 <5000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			opp-peak-kBps = <500000 1>;
+			opp-level = <1>;
+		};
+
+		/* GEN 1 x4 */
+		opp-10000000-1 {
+			opp-hz = /bits/ 64 <10000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			opp-peak-kBps = <1000000 1>;
+			opp-level = <1>;
+		};
+
+		/* GEN 1 x8 */
+		opp-20000000-1 {
+			opp-hz = /bits/ 64 <20000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			opp-peak-kBps = <2000000 1>;
+			opp-level = <1>;
+		};
+
+		/* GEN 1 x16 */
+		opp-40000000-1 {
+			opp-hz = /bits/ 64 <40000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			opp-peak-kBps = <4000000 1>;
+			opp-level = <1>;
+		};
+
+		/* GEN 2 x1 */
+		opp-5000000-2 {
+			opp-hz = /bits/ 64 <5000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			opp-peak-kBps = <500000 1>;
+			opp-level = <2>;
+		};
+
+		/* GEN 2 x2 */
+		opp-10000000-2 {
+			opp-hz = /bits/ 64 <10000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			opp-peak-kBps = <1000000 1>;
+			opp-level = <2>;
+		};
+
+		/* GEN 2 x4 */
+		opp-20000000-2 {
+			opp-hz = /bits/ 64 <20000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			opp-peak-kBps = <2000000 1>;
+			opp-level = <2>;
+		};
+
+		/* GEN 2 x8 */
+		opp-40000000-2 {
+			opp-hz = /bits/ 64 <40000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			opp-peak-kBps = <4000000 1>;
+			opp-level = <2>;
+		};
+
+		/* GEN 2 x16 */
+		opp-80000000-2 {
+			opp-hz = /bits/ 64 <80000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			opp-peak-kBps = <8000000 1>;
+			opp-level = <2>;
+		};
+
+		/* GEN 3 x1 */
+		opp-8000000-3 {
+			opp-hz = /bits/ 64 <8000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			opp-peak-kBps = <984500 1>;
+			opp-level = <3>;
+		};
+
+		/* GEN 3 x2 */
+		opp-16000000-3 {
+			opp-hz = /bits/ 64 <16000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			opp-peak-kBps = <1969000 1>;
+			opp-level = <3>;
+		};
+
+		/* GEN 3 x4 */
+		opp-32000000-3 {
+			opp-hz = /bits/ 64 <32000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			opp-peak-kBps = <3938000 1>;
+			opp-level = <3>;
+		};
+
+		/* GEN 3 x8 */
+		opp-64000000-3 {
+			opp-hz = /bits/ 64 <64000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			opp-peak-kBps = <7876000 1>;
+			opp-level = <3>;
+		};
+
+		/* GEN 3 x16 */
+		opp-128000000-3 {
+			opp-hz = /bits/ 64 <128000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			opp-peak-kBps = <15753000 1>;
+			opp-level = <3>;
+		};
+
+		/* GEN 4 x1 */
+		opp-16000000-4 {
+			opp-hz = /bits/ 64 <16000000>;
+			required-opps = <&rpmhpd_opp_svs>;
+			opp-peak-kBps = <1969000 1>;
+			opp-level = <4>;
+		};
+
+		/* GEN 4 x2 */
+		opp-32000000-4 {
+			opp-hz = /bits/ 64 <32000000>;
+			required-opps = <&rpmhpd_opp_svs>;
+			opp-peak-kBps = <3938000 1>;
+			opp-level = <4>;
+		};
+
+		/* GEN 4 x4 */
+		opp-64000000-4 {
+			opp-hz = /bits/ 64 <64000000>;
+			required-opps = <&rpmhpd_opp_svs>;
+			opp-peak-kBps = <7876000 1>;
+			opp-level = <4>;
+		};
+
+		/* GEN 4 x8 */
+		opp-128000000-4 {
+			opp-hz = /bits/ 64 <128000000>;
+			required-opps = <&rpmhpd_opp_svs>;
+			opp-peak-kBps = <15753000 1>;
+			opp-level = <4>;
+		};
+
+		/* GEN 4 x16 */
+		opp-256000000-4 {
+			opp-hz = /bits/ 64 <256000000>;
+			required-opps = <&rpmhpd_opp_svs>;
+			opp-peak-kBps = <31506000 1>;
+			opp-level = <4>;
+		};
+
+		/* GEN 5 x1 */
+		opp-32000000-5 {
+			opp-hz = /bits/ 64 <32000000>;
+			required-opps = <&rpmhpd_opp_nom>;
+			opp-peak-kBps = <3938000 1>;
+			opp-level = <5>;
+		};
+
+		/* GEN 5 x2 */
+		opp-64000000-5 {
+			opp-hz = /bits/ 64 <64000000>;
+			required-opps = <&rpmhpd_opp_nom>;
+			opp-peak-kBps = <7876000 1>;
+			opp-level = <5>;
+		};
+
+		/* GEN 5 x4 */
+		opp-128000000-5 {
+			opp-hz = /bits/ 64 <128000000>;
+			required-opps = <&rpmhpd_opp_nom>;
+			opp-peak-kBps = <15753000 1>;
+			opp-level = <5>;
+		};
+
+		/* GEN 5 x8 */
+		opp-256000000-5 {
+			opp-hz = /bits/ 64 <256000000>;
+			required-opps = <&rpmhpd_opp_nom>;
+			opp-peak-kBps = <31506000 1>;
+			opp-level = <5>;
+		};
+
+		/* GEN 5 x16 */
+		opp-512000000-5 {
+			opp-hz = /bits/ 64 <512000000>;
+			required-opps = <&rpmhpd_opp_nom>;
+			opp-peak-kBps = <63012000 1>;
+			opp-level = <5>;
+		};
+	};
+};
+
+&pcie0_port0 {
+	phys = <&pcie_phy 0>;
+};
+
+&pcie1 {
+	clocks = <&gcc GCC_PCIE_B_AUX_CLK>,
+		 <&gcc GCC_PCIE_B_CFG_AHB_CLK>,
+		 <&gcc GCC_PCIE_B_MSTR_AXI_CLK>,
+		 <&gcc GCC_PCIE_B_SLV_AXI_CLK>,
+		 <&gcc GCC_PCIE_B_SLV_Q2A_AXI_CLK>;
+	clock-names = "aux",
+		      "cfg",
+		      "bus_master",
+		      "bus_slave",
+		      "slave_q2a";
+
+	assigned-clocks = <&gcc GCC_PCIE_B_AUX_CLK>;
+	assigned-clock-rates = <19200000>;
+
+	interconnects = <&pcie_data_inbound MASTER_PCIE_1 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_PCIE_1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "pcie-mem",
+			     "cpu-pcie";
+
+	power-domains = <&gcc GCC_PCIE_B_GDSC>;
+
+	resets = <&gcc GCC_PCIE_B_BCR>,
+		 <&gcc GCC_PCIE_B_LINK_DOWN_BCR>;
+	reset-names = "pci",
+		      "link_down";
+
+	pinctrl-0 = <&pcie1_default>;
+	pinctrl-names = "default";
+
+	operating-points-v2 = <&pcie1_opp_table>;
+
+	pcie1_opp_table: opp-table {
+		compatible = "operating-points-v2";
+
+		/* GEN 1 x1 */
+		opp-2500000-1 {
+			opp-hz = /bits/ 64 <2500000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			opp-peak-kBps = <250000 1>;
+			opp-level = <1>;
+		};
+
+		/* GEN 1 x2 */
+		opp-5000000-1 {
+			opp-hz = /bits/ 64 <5000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			opp-peak-kBps = <500000 1>;
+			opp-level = <1>;
+		};
+
+		/* GEN 1 x4 */
+		opp-10000000-1 {
+			opp-hz = /bits/ 64 <10000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			opp-peak-kBps = <1000000 1>;
+			opp-level = <1>;
+		};
+
+		/* GEN 1 x8 */
+		opp-20000000-1 {
+			opp-hz = /bits/ 64 <20000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			opp-peak-kBps = <2000000 1>;
+			opp-level = <1>;
+		};
+
+		/* GEN 2 x1 */
+		opp-5000000-2 {
+			opp-hz = /bits/ 64 <5000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			opp-peak-kBps = <500000 1>;
+			opp-level = <2>;
+		};
+
+		/* GEN 2 x2 */
+		opp-10000000-2 {
+			opp-hz = /bits/ 64 <10000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			opp-peak-kBps = <1000000 1>;
+			opp-level = <2>;
+		};
+
+		/* GEN 2 x4 */
+		opp-20000000-2 {
+			opp-hz = /bits/ 64 <20000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			opp-peak-kBps = <2000000 1>;
+			opp-level = <2>;
+		};
+
+		/* GEN 2 x8 */
+		opp-40000000-2 {
+			opp-hz = /bits/ 64 <40000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			opp-peak-kBps = <4000000 1>;
+			opp-level = <2>;
+		};
+
+		/* GEN 3 x1 */
+		opp-8000000-3 {
+			opp-hz = /bits/ 64 <8000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			opp-peak-kBps = <984500 1>;
+			opp-level = <3>;
+		};
+
+		/* GEN 3 x2 */
+		opp-16000000-3 {
+			opp-hz = /bits/ 64 <16000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			opp-peak-kBps = <1969000 1>;
+			opp-level = <3>;
+		};
+
+		/* GEN 3 x4 */
+		opp-32000000-3 {
+			opp-hz = /bits/ 64 <32000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			opp-peak-kBps = <3938000 1>;
+			opp-level = <3>;
+		};
+
+		/* GEN 3 x8 */
+		opp-64000000-3 {
+			opp-hz = /bits/ 64 <64000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			opp-peak-kBps = <7876000 1>;
+			opp-level = <3>;
+		};
+
+		/* GEN 4 x1 */
+		opp-16000000-4 {
+			opp-hz = /bits/ 64 <16000000>;
+			required-opps = <&rpmhpd_opp_svs>;
+			opp-peak-kBps = <1969000 1>;
+			opp-level = <4>;
+		};
+
+		/* GEN 4 x2 */
+		opp-32000000-4 {
+			opp-hz = /bits/ 64 <32000000>;
+			required-opps = <&rpmhpd_opp_svs>;
+			opp-peak-kBps = <3938000 1>;
+			opp-level = <4>;
+		};
+
+		/* GEN 4 x4 */
+		opp-64000000-4 {
+			opp-hz = /bits/ 64 <64000000>;
+			required-opps = <&rpmhpd_opp_svs>;
+			opp-peak-kBps = <7876000 1>;
+			opp-level = <4>;
+		};
+
+		/* GEN 4 x8 */
+		opp-128000000-4 {
+			opp-hz = /bits/ 64 <128000000>;
+			required-opps = <&rpmhpd_opp_svs>;
+			opp-peak-kBps = <15753000 1>;
+			opp-level = <4>;
+		};
+
+		/* GEN 5 x1 */
+		opp-32000000-5 {
+			opp-hz = /bits/ 64 <32000000>;
+			required-opps = <&rpmhpd_opp_nom>;
+			opp-peak-kBps = <3938000 1>;
+			opp-level = <5>;
+		};
+
+		/* GEN 5 x2 */
+		opp-64000000-5 {
+			opp-hz = /bits/ 64 <64000000>;
+			required-opps = <&rpmhpd_opp_nom>;
+			opp-peak-kBps = <7876000 1>;
+			opp-level = <5>;
+		};
+
+		/* GEN 5 x4 */
+		opp-128000000-5 {
+			opp-hz = /bits/ 64 <128000000>;
+			required-opps = <&rpmhpd_opp_nom>;
+			opp-peak-kBps = <15753000 1>;
+			opp-level = <5>;
+		};
+
+		/* GEN 5 x8 */
+		opp-256000000-5 {
+			opp-hz = /bits/ 64 <256000000>;
+			required-opps = <&rpmhpd_opp_nom>;
+			opp-peak-kBps = <31506000 1>;
+			opp-level = <5>;
+		};
+	};
+};
+
+&pcie1_port0 {
+	phys = <&pcie_phy 1>;
+};
+
+&pcie2 {
+	clocks = <&gcc GCC_PCIE_C_AUX_CLK>,
+		 <&gcc GCC_PCIE_C_CFG_AHB_CLK>,
+		 <&gcc GCC_PCIE_C_MSTR_AXI_CLK>,
+		 <&gcc GCC_PCIE_C_SLV_AXI_CLK>,
+		 <&gcc GCC_PCIE_C_SLV_Q2A_AXI_CLK>;
+	clock-names = "aux",
+		      "cfg",
+		      "bus_master",
+		      "bus_slave",
+		      "slave_q2a";
+
+	assigned-clocks = <&gcc GCC_PCIE_C_AUX_CLK>;
+	assigned-clock-rates = <19200000>;
+
+	interconnects = <&pcie_data_inbound MASTER_PCIE_2 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_PCIE_2 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "pcie-mem",
+			     "cpu-pcie";
+
+	power-domains = <&gcc GCC_PCIE_C_GDSC>;
+
+	resets = <&gcc GCC_PCIE_C_BCR>,
+		 <&gcc GCC_PCIE_C_LINK_DOWN_BCR>;
+	reset-names = "pci",
+		      "link_down";
+
+	pinctrl-0 = <&pcie2_default>;
+	pinctrl-names = "default";
+
+	operating-points-v2 = <&pcie2_opp_table>;
+
+	pcie2_opp_table: opp-table {
+		compatible = "operating-points-v2";
+
+		/* GEN 1 x1 */
+		opp-2500000-1 {
+			opp-hz = /bits/ 64 <2500000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			opp-peak-kBps = <250000 1>;
+			opp-level = <1>;
+		};
+
+		/* GEN 1 x2 */
+		opp-5000000-1 {
+			opp-hz = /bits/ 64 <5000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			opp-peak-kBps = <500000 1>;
+			opp-level = <1>;
+		};
+
+		/* GEN 1 x4 */
+		opp-10000000-1 {
+			opp-hz = /bits/ 64 <10000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			opp-peak-kBps = <1000000 1>;
+			opp-level = <1>;
+		};
+
+		/* GEN 2 x1 */
+		opp-5000000-2 {
+			opp-hz = /bits/ 64 <5000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			opp-peak-kBps = <500000 1>;
+			opp-level = <2>;
+		};
+
+		/* GEN 2 x2 */
+		opp-10000000-2 {
+			opp-hz = /bits/ 64 <10000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			opp-peak-kBps = <1000000 1>;
+			opp-level = <2>;
+		};
+
+		/* GEN 2 x4 */
+		opp-20000000-2 {
+			opp-hz = /bits/ 64 <20000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			opp-peak-kBps = <2000000 1>;
+			opp-level = <2>;
+		};
+
+		/* GEN 3 x1 */
+		opp-8000000-3 {
+			opp-hz = /bits/ 64 <8000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			opp-peak-kBps = <984500 1>;
+			opp-level = <3>;
+		};
+
+		/* GEN 3 x2 */
+		opp-16000000-3 {
+			opp-hz = /bits/ 64 <16000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			opp-peak-kBps = <1969000 1>;
+			opp-level = <3>;
+		};
+
+		/* GEN 3 x4 */
+		opp-32000000-3 {
+			opp-hz = /bits/ 64 <32000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			opp-peak-kBps = <3938000 1>;
+			opp-level = <3>;
+		};
+
+		/* GEN 4 x1 */
+		opp-16000000-4 {
+			opp-hz = /bits/ 64 <16000000>;
+			required-opps = <&rpmhpd_opp_svs>;
+			opp-peak-kBps = <1969000 1>;
+			opp-level = <4>;
+		};
+
+		/* GEN 4 x2 */
+		opp-32000000-4 {
+			opp-hz = /bits/ 64 <32000000>;
+			required-opps = <&rpmhpd_opp_svs>;
+			opp-peak-kBps = <3938000 1>;
+			opp-level = <4>;
+		};
+
+		/* GEN 4 x4 */
+		opp-64000000-4 {
+			opp-hz = /bits/ 64 <64000000>;
+			required-opps = <&rpmhpd_opp_svs>;
+			opp-peak-kBps = <7876000 1>;
+			opp-level = <4>;
+		};
+
+		/* GEN 5 x1 */
+		opp-32000000-5 {
+			opp-hz = /bits/ 64 <32000000>;
+			required-opps = <&rpmhpd_opp_nom>;
+			opp-peak-kBps = <3938000 1>;
+			opp-level = <5>;
+		};
+
+		/* GEN 5 x2 */
+		opp-64000000-5 {
+			opp-hz = /bits/ 64 <64000000>;
+			required-opps = <&rpmhpd_opp_nom>;
+			opp-peak-kBps = <7876000 1>;
+			opp-level = <5>;
+		};
+
+		/* GEN 5 x4 */
+		opp-128000000-5 {
+			opp-hz = /bits/ 64 <128000000>;
+			required-opps = <&rpmhpd_opp_nom>;
+			opp-peak-kBps = <15753000 1>;
+			opp-level = <5>;
+		};
+	};
+};
+
+&pcie2_port0 {
+	phys = <&pcie_phy 2>;
+};
+
+&pcie3 {
+	clocks = <&gcc GCC_PCIE_D_AUX_CLK>,
+		 <&gcc GCC_PCIE_D_CFG_AHB_CLK>,
+		 <&gcc GCC_PCIE_D_MSTR_AXI_CLK>,
+		 <&gcc GCC_PCIE_D_SLV_AXI_CLK>,
+		 <&gcc GCC_PCIE_D_SLV_Q2A_AXI_CLK>;
+	clock-names = "aux",
+		      "cfg",
+		      "bus_master",
+		      "bus_slave",
+		      "slave_q2a";
+
+	assigned-clocks = <&gcc GCC_PCIE_D_AUX_CLK>;
+	assigned-clock-rates = <19200000>;
+
+	interconnects = <&pcie_data_inbound MASTER_PCIE_3 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_PCIE_3 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "pcie-mem",
+			     "cpu-pcie";
+
+	power-domains = <&gcc GCC_PCIE_D_GDSC>;
+
+	resets = <&gcc GCC_PCIE_D_BCR>,
+		 <&gcc GCC_PCIE_D_LINK_DOWN_BCR>;
+	reset-names = "pci",
+		      "link_down";
+
+	pinctrl-0 = <&pcie3_default>;
+	pinctrl-names = "default";
+
+	operating-points-v2 = <&pcie3_opp_table>;
+
+	pcie3_opp_table: opp-table {
+		compatible = "operating-points-v2";
+
+		/* GEN 1 x1 */
+		opp-2500000-1 {
+			opp-hz = /bits/ 64 <2500000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			opp-peak-kBps = <250000 1>;
+			opp-level = <1>;
+		};
+
+		/* GEN 1 x2 */
+		opp-5000000-1 {
+			opp-hz = /bits/ 64 <5000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			opp-peak-kBps = <500000 1>;
+			opp-level = <1>;
+		};
+
+		/* GEN 2 x1 */
+		opp-5000000-2 {
+			opp-hz = /bits/ 64 <5000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			opp-peak-kBps = <500000 1>;
+			opp-level = <2>;
+		};
+
+		/* GEN 2 x2 */
+		opp-10000000-2 {
+			opp-hz = /bits/ 64 <10000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			opp-peak-kBps = <1000000 1>;
+			opp-level = <2>;
+		};
+
+		/* GEN 3 x1 */
+		opp-8000000-3 {
+			opp-hz = /bits/ 64 <8000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			opp-peak-kBps = <984500 1>;
+			opp-level = <3>;
+		};
+
+		/* GEN 3 x2 */
+		opp-16000000-3 {
+			opp-hz = /bits/ 64 <16000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			opp-peak-kBps = <1969000 1>;
+			opp-level = <3>;
+		};
+
+		/* GEN 4 x1 */
+		opp-16000000-4 {
+			opp-hz = /bits/ 64 <16000000>;
+			required-opps = <&rpmhpd_opp_svs>;
+			opp-peak-kBps = <1969000 1>;
+			opp-level = <4>;
+		};
+
+		/* GEN 4 x2 */
+		opp-32000000-4 {
+			opp-hz = /bits/ 64 <32000000>;
+			required-opps = <&rpmhpd_opp_svs>;
+			opp-peak-kBps = <3938000 1>;
+			opp-level = <4>;
+		};
+
+		/* GEN 5 x1 */
+		opp-32000000-5 {
+			opp-hz = /bits/ 64 <32000000>;
+			required-opps = <&rpmhpd_opp_nom>;
+			opp-peak-kBps = <3938000 1>;
+			opp-level = <5>;
+		};
+
+		/* GEN 5 x2 */
+		opp-64000000-5 {
+			opp-hz = /bits/ 64 <64000000>;
+			required-opps = <&rpmhpd_opp_nom>;
+			opp-peak-kBps = <7876000 1>;
+			opp-level = <5>;
+		};
+	};
+};
+
+&pcie3_port0 {
+	phys = <&pcie_phy 3>;
+};
+
 &qupv3_0 {
 	clocks = <&segcc SE_GCC_QUPV3_WRAP0_M_AHB_CLK>,
 		 <&segcc SE_GCC_QUPV3_WRAP0_S_AHB_CLK>;
@@ -708,10 +1440,10 @@ gcc: clock-controller@100000 {
 		reg = <0x0 0x00100000 0x0 0x1f4200>;
 		clocks = <&bi_tcxo_div2>,
 			 <&sleep_clk>,
-			 <0>,
-			 <0>,
-			 <0>,
-			 <0>;
+			 <&pcie_phy 0>,
+			 <&pcie_phy 1>,
+			 <&pcie_phy 2>,
+			 <&pcie_phy 3>;
 		#clock-cells = <1>;
 		#reset-cells = <1>;
 		#power-domain-cells = <1>;
@@ -778,6 +1510,100 @@ mmss_noc: interconnect@1780000 {
 		qcom,bcm-voters = <&apps_bcm_voter>;
 	};
 
+	pcie_phy: phy@1b00000 {
+		compatible = "qcom,nord-qmp-gen5x16-pcie-phy";
+
+		reg = <0x0 0x01b00000 0x0 0x10000>,
+		      <0x0 0x01b10000 0x0 0x10000>,
+		      <0x0 0x01b20000 0x0 0x10000>,
+		      <0x0 0x01b30000 0x0 0x10000>;
+		reg-names = "port_a",
+			    "port_b",
+			    "port_c",
+			    "port_d";
+
+		clocks = <&gcc GCC_PCIE_A_PHY_AUX_CLK>,
+			 <&gcc GCC_PCIE_A_CFG_AHB_CLK>,
+			 <&tcsrcc TCSR_PCIE_CLKREF_EN>,
+			 <&gcc GCC_PCIE_A_PHY_RCHNG_CLK>,
+			 <&gcc GCC_PCIE_A_PIPE_CLK>,
+			 <&gcc GCC_PCIE_B_PHY_AUX_CLK>,
+			 <&gcc GCC_PCIE_B_CFG_AHB_CLK>,
+			 <&gcc GCC_PCIE_B_PHY_RCHNG_CLK>,
+			 <&gcc GCC_PCIE_B_PIPE_CLK>,
+			 <&gcc GCC_PCIE_C_PHY_AUX_CLK>,
+			 <&gcc GCC_PCIE_C_CFG_AHB_CLK>,
+			 <&gcc GCC_PCIE_C_PHY_RCHNG_CLK>,
+			 <&gcc GCC_PCIE_C_PIPE_CLK>,
+			 <&gcc GCC_PCIE_D_PHY_AUX_CLK>,
+			 <&gcc GCC_PCIE_D_CFG_AHB_CLK>,
+			 <&gcc GCC_PCIE_D_PHY_RCHNG_CLK>,
+			 <&gcc GCC_PCIE_D_PIPE_CLK>;
+		clock-names = "aux_a",
+			      "cfg_ahb_a",
+			      "ref",
+			      "rchng_a",
+			      "pipe_a",
+			      "aux_b",
+			      "cfg_ahb_b",
+			      "rchng_b",
+			      "pipe_b",
+			      "aux_c",
+			      "cfg_ahb_c",
+			      "rchng_c",
+			      "pipe_c",
+			      "aux_d",
+			      "cfg_ahb_d",
+			      "rchng_d",
+			      "pipe_d";
+
+		assigned-clocks = <&gcc GCC_PCIE_A_PHY_RCHNG_CLK>,
+				  <&gcc GCC_PCIE_B_PHY_RCHNG_CLK>,
+				  <&gcc GCC_PCIE_C_PHY_RCHNG_CLK>,
+				  <&gcc GCC_PCIE_D_PHY_RCHNG_CLK>;
+		assigned-clock-rates = <100000000>,
+				       <100000000>,
+				       <100000000>,
+				       <100000000>;
+
+		power-domains = <&gcc GCC_PCIE_A_PHY_GDSC>,
+				<&gcc GCC_PCIE_B_PHY_GDSC>,
+				<&gcc GCC_PCIE_C_PHY_GDSC>,
+				<&gcc GCC_PCIE_D_PHY_GDSC>;
+		power-domain-names = "port_a",
+				     "port_b",
+				     "port_c",
+				     "port_d";
+
+		resets = <&gcc GCC_PCIE_A_PHY_COM_BCR>,
+			 <&gcc GCC_PCIE_A_NOCSR_COM_PHY_BCR>,
+			 <&gcc GCC_PCIE_B_PHY_COM_BCR>,
+			 <&gcc GCC_PCIE_B_NOCSR_COM_PHY_BCR>,
+			 <&gcc GCC_PCIE_C_PHY_COM_BCR>,
+			 <&gcc GCC_PCIE_C_NOCSR_COM_PHY_BCR>,
+			 <&gcc GCC_PCIE_D_PHY_COM_BCR>,
+			 <&gcc GCC_PCIE_D_NOCSR_COM_PHY_BCR>;
+		reset-names = "port_a",
+			      "port_a_nocsr",
+			      "port_b",
+			      "port_b_nocsr",
+			      "port_c",
+			      "port_c_nocsr",
+			      "port_d",
+			      "port_d_nocsr";
+
+		qcom,link-mode = <&tcsr 0x71050>;
+
+		#clock-cells = <1>;
+		clock-output-names = "pcie_a_pipe_clk",
+				     "pcie_b_pipe_clk",
+				     "pcie_c_pipe_clk",
+				     "pcie_d_pipe_clk";
+		#phy-cells = <1>;
+
+		status = "disabled";
+	};
+
 	pcie_cfg: interconnect@1ba0000 {
 		compatible = "qcom,nord-pcie-cfg";
 		reg = <0x0 0x01ba0000 0x0 0x7200>;
@@ -1106,6 +1932,98 @@ nsp_data_noc_3: interconnect@1fe00000 {
 };
 
 &tlmm {
+	pcie0_default: pcie0-default-state {
+		wake-pins {
+			pins = "gpio0";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		clkreq-pins {
+			pins = "gpio1";
+			function = "pcie0_clk_req_n";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		perst-pins {
+			pins = "gpio2";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
+	pcie1_default: pcie1-default-state {
+		wake-pins {
+			pins = "gpio3";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		clkreq-pins {
+			pins = "gpio4";
+			function = "pcie1_clk_req_n";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		perst-pins {
+			pins = "gpio5";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
+	pcie2_default: pcie2-default-state {
+		wake-pins {
+			pins = "gpio6";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		clkreq-pins {
+			pins = "gpio7";
+			function = "pcie2_clk_req_n";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		perst-pins {
+			pins = "gpio8";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
+	pcie3_default: pcie3-default-state {
+		wake-pins {
+			pins = "gpio9";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		clkreq-pins {
+			pins = "gpio10";
+			function = "pcie3_clk_req_n";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		perst-pins {
+			pins = "gpio11";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
 	qup_i2c0_default: qup-i2c0-default-state {
 		pins = "gpio111", "gpio112";
 		function = "qup0_se0";
diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qcom/nord.dtsi
index dfbbaf94a7ae..aa22f18d8a75 100644
--- a/arch/arm64/boot/dts/qcom/nord.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord.dtsi
@@ -1593,6 +1593,290 @@ rng: rng@10c3000 {
 			reg = <0x0 0x010c3000 0x0 0x1000>;
 		};
 
+		pcie0: pci@1b80000 {
+			compatible = "qcom,nord-pcie", "qcom,pcie-sa8775p";
+
+			reg = <0x00 0x01b80000 0x00 0x00004000>,
+			      <0x00 0x40000000 0x00 0x00000f20>,
+			      <0x00 0x40000f20 0x00 0x000000a8>,
+			      <0x00 0x40010000 0x00 0x00020000>,
+			      <0x00 0x40100000 0x00 0x00100000>,
+			      <0x00 0x01b84000 0x00 0x00001000>;
+			reg-names = "parf",
+				    "dbi",
+				    "elbi",
+				    "atu",
+				    "config",
+				    "mhi";
+
+			ranges = <0x01000000 0x0 0x00000000 0x0 0x40200000 0x0 0x100000>,
+				 <0x02000000 0x0 0x40300000 0x0 0x40300000 0x0 0xfd00000>;
+
+			bus-range = <0x00 0xff>;
+			device_type = "pci";
+			linux,pci-domain = <0>;
+			num-lanes = <8>;
+
+			#address-cells = <3>;
+			#size-cells = <2>;
+
+			dma-coherent;
+
+			interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "msi0",
+					  "msi1",
+					  "msi2",
+					  "msi3",
+					  "msi4",
+					  "msi5",
+					  "msi6",
+					  "msi7",
+					  "global";
+			#interrupt-cells = <1>;
+			interrupt-map-mask = <0 0 0 0x7>;
+			interrupt-map = <0 0 0 1 &intc 0 0 0 149 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 2 &intc 0 0 0 150 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 3 &intc 0 0 0 151 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 4 &intc 0 0 0 152 IRQ_TYPE_LEVEL_HIGH>;
+
+			iommu-map = <0x0 &pcie_smmu 0x0000 0x10000>;
+
+			msi-map = <0x0 &gic_its 0x80000 0x10000>;
+
+			status = "disabled";
+
+			pcie0_port0: pcie@0 {
+				compatible = "pciclass,0604";
+				reg = <0 0 0 0 0>;
+				bus-range = <0x01 0xff>;
+				device_type = "pci";
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges;
+			};
+		};
+
+		pcie1: pci@1b88000 {
+			compatible = "qcom,nord-pcie", "qcom,pcie-sa8775p";
+
+			reg = <0x00 0x01b88000 0x00 0x00004000>,
+			      <0x00 0x50000000 0x00 0x00000f20>,
+			      <0x00 0x50000f20 0x00 0x000000a8>,
+			      <0x00 0x50010000 0x00 0x00010000>,
+			      <0x00 0x50100000 0x00 0x00100000>,
+			      <0x00 0x01b8c000 0x00 0x00001000>;
+			reg-names = "parf",
+				    "dbi",
+				    "elbi",
+				    "atu",
+				    "config",
+				    "mhi";
+
+			ranges = <0x01000000 0x0 0x00000000 0x0 0x50200000 0x0 0x100000>,
+				 <0x02000000 0x0 0x50300000 0x0 0x50300000 0x0 0xfd00000>;
+
+			bus-range = <0x00 0xff>;
+			device_type = "pci";
+			linux,pci-domain = <1>;
+			num-lanes = <4>;
+
+			#address-cells = <3>;
+			#size-cells = <2>;
+
+			dma-coherent;
+
+			interrupts = <GIC_SPI 834 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 833 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 845 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 842 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 824 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 349 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 949 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "msi0",
+					  "msi1",
+					  "msi2",
+					  "msi3",
+					  "msi4",
+					  "msi5",
+					  "msi6",
+					  "msi7",
+					  "global";
+			#interrupt-cells = <1>;
+			interrupt-map-mask = <0 0 0 0x7>;
+			interrupt-map = <0 0 0 1 &intc 0 0 0 835 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 2 &intc 0 0 0 351 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 3 &intc 0 0 0 830 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 4 &intc 0 0 0 348 IRQ_TYPE_LEVEL_HIGH>;
+
+			msi-map = <0x0 &gic_its 0x90000 0x10000>;
+
+			iommu-map = <0x0 &pcie_smmu 0x10000 0x10000>;
+
+			status = "disabled";
+
+			pcie1_port0: pcie@0 {
+				device_type = "pci";
+				compatible = "pciclass,0604";
+				reg = <0 0 0 0 0>;
+				bus-range = <0x01 0xff>;
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges;
+			};
+		};
+
+		pcie2: pci@1b90000 {
+			compatible = "qcom,nord-pcie", "qcom,pcie-sa8775p";
+
+			reg = <0x00 0x01b90000 0x00 0x00004000>,
+			      <0x00 0x60000000 0x00 0x00000f20>,
+			      <0x00 0x60000f20 0x00 0x000000a8>,
+			      <0x00 0x60010000 0x00 0x00010000>,
+			      <0x00 0x60100000 0x00 0x00100000>,
+			      <0x00 0x01b94000 0x00 0x00001000>;
+			reg-names = "parf",
+				    "dbi",
+				    "elbi",
+				    "atu",
+				    "config",
+				    "mhi";
+
+			ranges = <0x01000000 0x0 0x00000000 0x0 0x60200000 0x0 0x100000>,
+				 <0x02000000 0x0 0x60300000 0x0 0x60300000 0x0 0xfd00000>;
+
+			bus-range = <0x00 0xff>;
+			device_type = "pci";
+			linux,pci-domain = <2>;
+			num-lanes = <2>;
+
+			#address-cells = <3>;
+			#size-cells = <2>;
+
+			dma-coherent;
+
+			interrupts = <GIC_SPI 844 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 838 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 825 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 846 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 350 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 837 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "msi0",
+					  "msi1",
+					  "msi2",
+					  "msi3",
+					  "msi4",
+					  "msi5",
+					  "msi6",
+					  "msi7",
+					  "global";
+			#interrupt-cells = <1>;
+			interrupt-map-mask = <0 0 0 0x7>;
+			interrupt-map = <0 0 0 1 &intc 0 0 0 263 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 2 &intc 0 0 0 154 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 3 &intc 0 0 0 110 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 4 &intc 0 0 0 258 IRQ_TYPE_LEVEL_HIGH>;
+
+			iommu-map = <0x0 &pcie_smmu 0x20000 0x10000>;
+
+			msi-map = <0x0 &gic_its 0xa0000 0x10000>;
+
+			status = "disabled";
+
+			pcie2_port0: pcie@0 {
+				device_type = "pci";
+				compatible = "pciclass,0604";
+				reg = <0 0 0 0 0>;
+				bus-range = <0x01 0xff>;
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges;
+			};
+		};
+
+		pcie3: pci@1b98000 {
+			compatible = "qcom,nord-pcie", "qcom,pcie-sa8775p";
+
+			reg = <0x00 0x01b98000 0x00 0x00004000>,
+			      <0x00 0x70000000 0x00 0x00000f20>,
+			      <0x00 0x70000f20 0x00 0x000000a8>,
+			      <0x00 0x70010000 0x00 0x00010000>,
+			      <0x00 0x70100000 0x00 0x00100000>,
+			      <0x00 0x01b9c000 0x00 0x00001000>;
+			reg-names = "parf",
+				    "dbi",
+				    "elbi",
+				    "atu",
+				    "config",
+				    "mhi";
+
+			ranges = <0x01000000 0x0 0x00000000 0x0 0x70200000 0x0 0x100000>,
+				 <0x02000000 0x0 0x70300000 0x0 0x70300000 0x0 0xfd00000>;
+
+			bus-range = <0x00 0xff>;
+			device_type = "pci";
+			linux,pci-domain = <3>;
+			num-lanes = <2>;
+
+			#address-cells = <3>;
+			#size-cells = <2>;
+
+			dma-coherent;
+
+			interrupts = <GIC_SPI 364 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 287 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 831 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 659 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 840 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 823 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 241 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "msi0",
+					  "msi1",
+					  "msi2",
+					  "msi3",
+					  "msi4",
+					  "msi5",
+					  "msi6",
+					  "msi7",
+					  "global";
+			#interrupt-cells = <1>;
+			interrupt-map-mask = <0 0 0 0x7>;
+			interrupt-map = <0 0 0 1 &intc 0 0 0 111 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 2 &intc 0 0 0 246 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 3 &intc 0 0 0 239 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 4 &intc 0 0 0 234 IRQ_TYPE_LEVEL_HIGH>;
+
+			msi-map = <0x0 &gic_its 0xb0000 0x10000>;
+
+			iommu-map = <0x0 &pcie_smmu 0x30000 0x10000>;
+
+			status = "disabled";
+
+			pcie3_port0: pcie@0 {
+				device_type = "pci";
+				compatible = "pciclass,0604";
+				reg = <0 0 0 0 0>;
+				bus-range = <0x01 0xff>;
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges;
+			};
+		};
+
 		ufs_mem_hc: ufshc@1d44000 {
 			compatible = "qcom,nord-ufshc",
 				     "qcom,ufshc",
@@ -1745,6 +2029,19 @@ ipcc0: mailbox@9007000 {
 			#mbox-cells = <2>;
 		};
 
+		pcie_smmu: iommu@9980000 {
+			compatible = "arm,smmu-v3";
+			reg = <0x0 0x09980000 0x0 0x20000>;
+			interrupts = <GIC_SPI 898 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 900 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 902 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "eventq",
+					  "cmdq-sync",
+					  "gerror";
+			dma-coherent;
+			#iommu-cells = <1>;
+		};
+
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,nord-pdc",
 				     "qcom,pdc";
-- 
2.43.0

