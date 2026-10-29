Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793246169;
	b=5IX41fVBMkMmfUCd4dWqnVppWqBiks08PCJvfA02N7L9UC811PG/SlZYtCa1aDe/8bMN
	 5J3qIs78zndQr6b5+yq4FmQjdGwaZg2Kbe4RHBms8RbS8+DUfN5GxitcPRYUkG0qhQgzP
	 0Cge5OjR45agg0VT0MvdBZkxROhF/Lsgpr/WG6CNiDEiT1SXNisZS+EIu5LRQpGeG3sVK
	 JqmXx6vXdLWoho5O8Bdfz5ePmLlvf6JMNaYLMpzpz/pg0scH7l2Nx1kO+/WRg7hQUecVZ
	 VIIAC2i8vz9ejPbix5qkTxgnE8Nx+SWlwsuDwq1P/lalosO5hqmckF587SXJMV+nhWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793246169;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=oV+YYQgmYqH5rHweZ98iHnQy4E8Zo46BbQyX59hM0ac=;
	b=pycJ2Acmn7NQwCV41alyTL8i+3Kcw45S1O77iisPq/OcwYw1A6l4UA2gV7bS6ykuCCBT
	 n8oNwDhg6cWRrBdl2tCpq3wMpMNSLrmMmYO7fUCCEHu7gApBBeMLCf36J1gqmdt4maiiH
	 +ObeYIZMEyfgqg6LMc0O7roagyBgbHU144+CvzRIvxEWj3sZiIi/qjp2hL+P9veMC18jS
	 iIyLLPvh6xBgnu4zQde3M7SeJ1qs3trFM0i0vnkwSEwCdudoZlnsBptwxQMoW7FukqEPa
	 ATtACPWQSp+knW/dEN6h1L5o+RXxeoWkQAu95qbaIvjtRhu7KkjRPjcJN+vaHOVkD3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aaSnLk+9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TEG7uABa;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9C4B606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 03:56:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9C4B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aaSnLk+9;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TEG7uABa
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T1jlFC3920610
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 03:56:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=oV+YYQgmYqH
	5rHweZ98iHnQy4E8Zo46BbQyX59hM0ac=; b=aaSnLk+9O3ug1uq5y+ZtHUCq7o+
	zLBPTTuMBFyswCLw2Nxk9IeEGuvoCo91SdmvXKUaJ3B6p9xiXQd7icQFcpT6P/vw
	rT/PIuea7/7jsPuGXD3OMqDPU7R8BJm3nFECOgyKv/O0nS7pkEfbG/kR+2JNG7oF
	O6dVPDsNVl4Vu2vvrGgXtySOkvWJ9GFbLhMTmf5pB1Y3dHmAn9gkG1DE7LKC6DVW
	wTzhi2RPmJCO9uy345FC+Cf8CBFKNriFoes9KHBsGH9i/Y4Iz23PUpOXagfWkq1/
	0xcVJI42tWwhjQe0imCU/6Jymm9jK/Uq34hgTKzg5sqUlPLhrp2psXmhfWA==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkkehts05-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 03:56:07 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-6dd94f8fa25so2103072eaf.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 20:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793246167; x=1793850967; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oV+YYQgmYqH5rHweZ98iHnQy4E8Zo46BbQyX59hM0ac=;
        b=TEG7uABaGRMUWA91mIMbjdaS30aT17YvysKaaAkNxWrCqI+wpHdk5bZ+RjJ9lEfPvT
         vwARBhOu5kJmtftXN5o2ZAN1t8Cd9U5x+rZa2Uq2cA9dbAKTF4GnMpQ/uVHyLoERmUdk
         yP9fP1rM3tnVNU2gDgwYaiyAzbpvOM+3n6LD4YyZTaSG4WKFVINE5rTMBDgPOjlE+rB+
         sx+licM0KWlfCzSM2P4qhczCu9JyN8njYTNYdXnL/J468T26W2QAmtgEKKCD2+iCRUBj
         2oZ87T6JqjgnN7QQgWf0QzX943cbE402JeK1chZOxhT2PQrVI8chNnl/C5ThRFDxIaQA
         AjcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793246167; x=1793850967;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oV+YYQgmYqH5rHweZ98iHnQy4E8Zo46BbQyX59hM0ac=;
        b=1lQUplZfdOeE8slDY8b+YK7NOc0Z8nWuD2WdGT54Amz1wbf3FRiEVyOQcQaYN2Q+o7
         ah9jbPbG8dcYoge0YlhC8HT3q5OLuGUjvtjQgqNdmBksyx5Ce3h2vR1UlX8xceJdO9Uq
         bfJqfc4WtkV57rnSlwZ6ROAlTW8nRjM2FltfgHiYfxDtumVmejUWri1VwaMRKF8CwoYL
         8ilk26mQ4Zxm7wLn4AfwB+bnRHYUNj8v6JZ9v2A7G7MGP41dpKBbrGMcZkQS/ALaQivg
         LTKhcHdJ0cBLwEfKEmYw8kPUeUtCe/g0Ma/CKTnyQ/jR+kzcRgfKbySushXNzh0JMrtY
         Rifw==
X-Forwarded-Encrypted: i=1; AKwUvBzJ/3FUIotjoHaGTA67ZM3IZe85i037OlHMXx5QXh2oinWgx/svunpoP224oI0LoXKw2khzsnfSic164ro=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ+JqVMnYOccVSf3vPzgrtFJTUozOfZWuH4z2DR0b/tadPrxdIq
	VnEwlS1gpnuslGQhF3MxefeTfisGIuWuAb6K7eipUSoC57HXYaMXLQG85AxVcmX+TDEH0BmC2S6
	MJsPnBaDVILPRscsGj2WmIuByL6+A2Ff+rKNAVxshaaN7+pO/kJDzeArDDrpyuqPqg0k=
X-Gm-Gg: AYBFou0aBbgkPayx6J8mHC6hkiYT7Ixv/wkH11m6CZqAzLJ123NUZfmtMkFqqer6qYM
	9HAu9vF4H+AidXJDe+vpnt5hkGv0sD8pRhxKUwEJS/U3nMDuBJ678OR7KTd/hM8gsb4U8kRyfZv
	nz41tj3ZbTS1elBAXVVfDI+VAHpIPWgLs+esmBp4Pv8i4RHnfpIE2C7/2zFXiY/sbXIwQAVSEZ1
	F26VtGMMthfY8r041b855wFspbRbbGHidppnIly+qR6etXKwfGSqh05gh0bYqoxeBmjlS6nfuzn
	opiBPL2VARPJbaAuMQlAeT+ekXTMzux6/Y+mS8ozgI1bMM3kqA4VqgkYcdfg9FTiy/le/Iu5Fk2
	H0IrHqWtQgxwyx1TZI2SDnqvjX8G4QNvVzf2J391tbV0JKYPqcGpkBI2245ct4jo16mzW7BpyU2
	WVe5AWN5bldTCkgpedHM0F8UNPK80KCfFF
X-Received: by 2002:a05:6820:f014:b0:6c9:80d8:a201 with SMTP id 006d021491bc7-713eeb53676mr2483150eaf.62.1793246166963;
        Wed, 28 Oct 2026 20:56:06 -0700 (PDT)
X-Received: by 2002:a05:7301:fc01:b0:369:fa8b:d725 with SMTP id 5a478bee46e88-36a204a51c8mr5854369eec.35.1793245676251;
        Wed, 28 Oct 2026 20:47:56 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a2393cc86sm11064286eec.19.2026.10.28.20.47.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 20:47:55 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH RFC v3 3/3] arm64: dts: qcom: nord-rrd: Enable eDP0/1 display output
Date: Thu, 29 Oct 2026 11:47:28 +0800
Message-ID: <20261029034728.633495-4-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261029034728.633495-1-shengchao.guo@oss.qualcomm.com>
References: <20261029034728.633495-1-shengchao.guo@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: I9HkzHqdhCk_PC6RwOubAScUaoI9i1Gt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAxNCBTYWx0ZWRfX04gYHgcSW4I4
 LqozbmU/ChzlI8Czi49vsPhcZmiaAKngmBlcHh81tvEL6ialFljNQq65eQpaK3uefncMKhDAJww
 xJfBg6INCm3E8R3NDM0CLke9AzFVCXhP6YloVrZ2DK1EQvdbn+Cf5PxYQcnehm3O3C5Re9Nmpsi
 CEf9zM3CO4/yoQaxvomn9ssQ/3imbqNdQf2OpL4QHkCOOgEDa5Wrf0YTS9Fa/Hdmwy7l7cqguAF
 aQlgV17R9RtAXnOlNo1WNwTODBBAkOlFvOFIp90kYLaU/OA9YwqcP/0WvC19QrgN4tuKEhYK2RC
 lGCCu2ga9DgAl/7+NmGKXvyhmUK46NgoR/Ex0RB6WI/gbZ19xIrROJnyU29E29KtzkE+HzU+56b
 f95OIseP7o1J9+U/Wih5VSJCyDrvbG47RUyJYj2r5vCSqBbSefIpn/1GRsalnJF6YR8js6h4lo1
 YfrChZgW1TAk3kNdpTg==
X-Proofpoint-GUID: I9HkzHqdhCk_PC6RwOubAScUaoI9i1Gt
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAxNCBTYWx0ZWRfX/91kFRTAia+X
 uZqGYhborv21LyIV6SbrnzL5R23+qYNc8nx4u9W7c4fKxzSyiCEEiuiYpeAqeKgXu+k/U3wAfhq
 EJ99qgNwepY8f3S2Uc3ykNOzsDntvl8=
X-Authority-Analysis: v=2.4 cv=bYv+w+PB c=1 sm=1 tr=0 ts=6ae2c3d7 cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=wlBrTx1nK-2z6_sN8T0A:9 a=WZGXeFmKUf7gPmL3hEjn:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290014

From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>

Enable the MDSS, DP0/1 controllers and eDP0/1 PHYs on the Nord RRD
board and describe the eDP0/1 connector, its 4 data lanes and supported
link frequencies.

Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Tested-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-rrd.dts | 62 +++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-rrd.dts b/arch/arm64/boot/dts/qcom/nord-rrd.dts
index 47978df0af92..9e3a74f8deaa 100644
--- a/arch/arm64/boot/dts/qcom/nord-rrd.dts
+++ b/arch/arm64/boot/dts/qcom/nord-rrd.dts
@@ -53,6 +53,30 @@ bi_tcxo_ao_div2: bi-tcxo-ao-div2-clk {
 			clock-div = <2>;
 		};
 	};
+
+	dp0_connector: connector-dp0 {
+		compatible = "dp-connector";
+		label = "eDP0";
+		type = "full-size";
+
+		port {
+			dp0_connector_in: endpoint {
+				remote-endpoint = <&mdss0_dp0_out>;
+			};
+		};
+	};
+
+	dp1_connector: connector-dp1 {
+		compatible = "dp-connector";
+		label = "eDP1";
+		type = "full-size";
+
+		port {
+			dp1_connector_in: endpoint {
+				remote-endpoint = <&mdss0_dp1_out>;
+			};
+		};
+	};
 };
 
 &apps_rsc {
@@ -377,6 +401,44 @@ rtc@32 {
 	};
 };
 
+&mdss0 {
+	status = "okay";
+};
+
+&mdss0_dp0 {
+	status = "okay";
+};
+
+&mdss0_dp0_out {
+	data-lanes = <0 1 2 3>;
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+	remote-endpoint = <&dp0_connector_in>;
+};
+
+&mdss0_dp0_phy {
+	vdda-phy-supply = <&vreg_l2h_1p2>;
+	vdda-pll-supply = <&vreg_l1h_0p9>;
+
+	status = "okay";
+};
+
+&mdss0_dp1 {
+	status = "okay";
+};
+
+&mdss0_dp1_out {
+	data-lanes = <0 1 2 3>;
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+	remote-endpoint = <&dp1_connector_in>;
+};
+
+&mdss0_dp1_phy {
+	vdda-phy-supply = <&vreg_l2h_1p2>;
+	vdda-pll-supply = <&vreg_l1h_0p9>;
+
+	status = "okay";
+};
+
 &qupv3_0 {
 	firmware-name = "qcom/nord/qupv3fw.elf";
 
-- 
2.43.0

