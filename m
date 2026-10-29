Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793245676;
	b=OE40WBeWwhFhGeuovctC8sz7ciJf6zUvFlPTLDI6EnwJwUf8ciPeuhg/MpYkLtQrme4s
	 ndFne8jWxW04Ml73LMgW462WHMd6I/waMYN2QaKAVo3zLLKXZox5CD783vptI9jm+ghHd
	 3U0EkbcAgzI85/0RDTcGbAWVR+reIfeTEEL53MJRH/cpSUchEUYg8QDPdmfarw1yPz97m
	 GX6EVTq7QAXyDlIyxjTDjFr/a+TYEw+PCyrKpLmvbqUAuw+DdpadCyt4N2I5JWqS/QT3T
	 gK1oTPZipapfCVmZ3osEjmR5wzTvPx5TmccMgg01Y9v35bkMIfpDUTeam6+fH1D8jhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793245676;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=6hP61S7FMd5GBi62j70cBoRA5yujIbmQxVw7ipJnZtI=;
	b=3yUJkteTNCgZNd7ZMV7uSQUztd+ZfqiOgtHM7jZbYBWhTVJVIKK0TPQjZhhT2lo5Cxcd
	 l2nqPvweLJwbp1sD0ZmI4nZQicXfJcOj4y2+xea44+o2bvY/0P3sFAgv6m31Gtu2ESwFx
	 kfrf2zjEQiJ8DorMzaGV8oOL1QPOEX4rnxUgXrut/OCaL9BEElFcSSpoEnbZf+nzmbOCW
	 TCT9r2COOgIQvZ5Cgk0JFTsIZKIsrg/o91ZGH4QxgFKZhxLqZSbbA+28suRm+HeGJvCzH
	 IbgeTHTGEbnpVieZY0bYTrzJC6ILw3ab6Bh9VDI9HdbossGIi/KGY+yS28KvU4GtB8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=J0tPRhy8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="JusMrOf/";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E468606A321
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 03:47:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E468606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=J0tPRhy8;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JusMrOf/
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T1jfJw3948015
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 03:47:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=6hP61S7FMd5
	GBi62j70cBoRA5yujIbmQxVw7ipJnZtI=; b=J0tPRhy8CaAl8ooOBFWVnzurNGt
	BKfn2yiERnUIorCj97MDw4tmgyU8ziX4DajoQeyqkx4q6Ttr8FiNG+xRawF/p0ua
	CTWuYrSd7u79ta9kZM7DG+Of+kHLJaWxvzNIGuotqmVHubzt/6beU3HF2d0Xif0P
	Um5kllTU3rWO67nuTEAKMC4f74Xjpp5MS8DtX9tcy11EhQMbYijuM122805mahom
	mE6ZTBdM2qxICC3q4Iw5rDlaSCWrL4luy85Ci0RUyMnE4it+1c6L5VdDjJiLTAPz
	oksDLopluV73z/ZN4tfkXxsgYQ2llMNcIgCt03ODxc3HeVJD9LF2uXZm/0A==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkneut2jd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 03:47:55 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3698bd5392cso340187eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 20:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793245672; x=1793850472; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6hP61S7FMd5GBi62j70cBoRA5yujIbmQxVw7ipJnZtI=;
        b=JusMrOf/svvFirohhFoIGRAUa7rBR4qeX+p7uE2YQP80EcC01mtneGdSK5ORbY98VA
         yJ5w3IulqMxotnoHb4uW1uyEBCBb3/Du2roZfFVK8+9mD3IEwgwR7CSjyzyWuriNLrTj
         IYhoLEOp33COk4ExHIpjY4Y7bQ87WkUXWdSzeIrA95wcff468ZeLIFd4Rg9YYTScGIU6
         FT79eTtw2SHjTuMeZQOnG9o6t9AcneIQEG+O3dOimbTjp3YtP2GaWxYpz8u/7/zdlu7J
         zPD7cW8ZlUidxR7yUxcD6do4rgbkN4m8ZhxVNqw6uHRbl24YSH0ijSkDlf/rdMx+8j7I
         wYDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793245672; x=1793850472;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6hP61S7FMd5GBi62j70cBoRA5yujIbmQxVw7ipJnZtI=;
        b=NRL2p9asnNtk/Il6Ksn1Gv9r6YHqLob4GDPbv4pHudvT/s9MY3D7yEyTuHiRl+Ep7C
         MPMOk9g2YEVTh33LhxBnerz++qJ/NxXFf60YXwiEVYR7lqALRbNUpFc5ntXAqU7DTSGM
         GCPoYBPpggDYUNTx25dmND8z6+Fmec9NOiGbG7EhF1nlAqpJfDaFSWGv/hsGjz6asUlF
         O+HdVFSBcF0kfo4jf00QcxJS7eval9pNfxx0UP9tjMKaUHc0zyFU8oN7UEKRSM+gDuVl
         2Ah9kMz02ik4TETY4SAkZnGeagzcrGVjlsXpAtJ/FHyggpjfT0RJlWpNIgH7wFhFDXJR
         Z5eA==
X-Forwarded-Encrypted: i=1; AKwUvBzkTB/musx3wB9vE+EBqm0vCmoxSzxiQdGGU4MmFYGLXt7deadB826uCPhMmn7vGEVDoMJz/LZl+Uwfsg8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLp/cJGs0n5Sz+YborqL9EtQOyO+yY4H935Bt40f09GANCAYbF3
	gyhgNDF3xan1TfgwyrJ9M0DrxKbpQvuIqfgnVSnF+rowX3gQ95oHX9oMC3gG4/OgXyMl40RTPft
	5jil/p6MneqZRvrWt1KVP5e58Oe5mMmd2nQ9aHZZ9N1Lml1yEgP4Jm9fBUCTDZGzIkwU=
X-Gm-Gg: AYBFou0ubDPXObwKQG8jtKe4w00mSa+VMc1LZUG/72adgFExlFJWpQWQAgVxYN50swE
	4blKe1bhPy5p+3+ovEiM3GLNubIr2we/WXKXZLYHdRcVgdS+D9/EJyFHH5IB8SSooT+eHZD+55t
	sJ4o1FuYTMfU1oEvQIUKZ/zkJu4QH5cAgNKChfp78I+exd5Td30OmgtaXz//k1dYBz/sQrGs/nO
	IjgIqYAJ1bzq8c8VODRVwvwFjyfhvVWvS0+Fa+ZopsNLPegYbgfM6q7bN61u8NOuhhU/409mh5b
	PbbMBNz62D7lVlRDlFi8R+iC7SO1AVltgao/dPvdtqna3f+QWK/N1G/kfIc0BiLvsyTSe8DWKIt
	aLFrTHSdvRZkzMZTkQnUFyqh2JiFkFimGzvOyTX62JdWrxZu/x03emmh2qhHlhEk9I/vR29zguX
	7dGldxsdgreQH4cAhDLV88orsFFB+3Uy70
X-Received: by 2002:a05:7300:6a9d:b0:369:f644:fac0 with SMTP id 5a478bee46e88-36a2fd70ff6mr1788191eec.8.1793245672386;
        Wed, 28 Oct 2026 20:47:52 -0700 (PDT)
X-Received: by 2002:a05:7300:6a9d:b0:369:f644:fac0 with SMTP id 5a478bee46e88-36a2fd70ff6mr1788155eec.8.1793245671804;
        Wed, 28 Oct 2026 20:47:51 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a2393cc86sm11064286eec.19.2026.10.28.20.47.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 20:47:51 -0700 (PDT)
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
Subject: [PATCH RFC v3 2/3] arm64: dts: qcom: nord-ride-embedded: Enable eDP0-3 display output
Date: Thu, 29 Oct 2026 11:47:27 +0800
Message-ID: <20261029034728.633495-3-shengchao.guo@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAxMyBTYWx0ZWRfX3cseHqHVAeKg
 Lt93yfD8btex1UINuLMxdF/x6QQtbfKfW0X6Z+13BU0FX6L/uZt1BuuA0Mj8sgnZLEzJgf5QAmo
 Qn3cyUT9WC8XtH8ZUqu1kxi6pOWjwfALqSNO/K0sKGWPKyzKqwwEUDlNz/o52iheIfU1Yx65d8c
 U1fBlNbQ/+E/04gbN8+QOyGev5h1aawiJFYSpz3YCAySIWYOMSehfRIfNq5DedBVKsG+z9LWC9s
 WCY7roUgCLqr/g2elKs7o3chsmoUtLTDOW4jcKd8vRjTLU9sn/WcHvQRZoL+nMaC1jPi0DOBHC/
 ymqfCjxayytjnvyzjc8Yr8fMn1Ome9F2ocs2kjAovsStDH8rV/gLOrElGlM3yECyU8wKxyXcrll
 XTwch5+1d0hg9K35bjp5Fxzeb6vN1XsaQKdTYyP7oCW87J/pZX8xXYnXRd18OuaT89C876+n/vG
 8Uwhb+SvIQUy1Z1ObwA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAxMyBTYWx0ZWRfX1ubJ8bSmw4oO
 k/jpjZhWOdmDmFp0kwH02IZNPMf/nvFtQTcPLkijFdTbGkyTxJIxySIDt5nCQxgoTBGiDpHZIN0
 OL6DEnSK2+OLYwSpjJ9NZI+eR+qtK/k=
X-Authority-Analysis: v=2.4 cv=LoAHWXdc c=1 sm=1 tr=0 ts=6ae2c1eb cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=F3f4s1Zse-zWnPoJeOMA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: rgrrZ_eErU5xJ2KvMFHKYlFcRi77NxMF
X-Proofpoint-ORIG-GUID: rgrrZ_eErU5xJ2KvMFHKYlFcRi77NxMF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290013

From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>

Enable both MDSS instances, the four DP controllers and the eDP0-3 PHYs
on the Nord Ride Embedded board and describe the eDP0-3 connectors,
their 4 data lanes and supported link frequencies.

Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Tested-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 .../boot/dts/qcom/nord-ride-embedded.dts      | 124 ++++++++++++++++++
 1 file changed, 124 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
index 49635695f832..cb1d436644c1 100644
--- a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
+++ b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
@@ -53,6 +53,54 @@ bi_tcxo_ao_div2: bi-tcxo-ao-div2-clk {
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
+
+	dp2_connector: connector-dp2 {
+		compatible = "dp-connector";
+		label = "eDP2";
+		type = "full-size";
+
+		port {
+			dp2_connector_in: endpoint {
+				remote-endpoint = <&mdss1_dp0_out>;
+			};
+		};
+	};
+
+	dp3_connector: connector-dp3 {
+		compatible = "dp-connector";
+		label = "eDP3";
+		type = "full-size";
+
+		port {
+			dp3_connector_in: endpoint {
+				remote-endpoint = <&mdss1_dp1_out>;
+			};
+		};
+	};
 };
 
 &apps_rsc {
@@ -366,6 +414,82 @@ vreg_l3l_1p8: ldo3 {
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
+&mdss1 {
+	status = "okay";
+};
+
+&mdss1_dp0 {
+	status = "okay";
+};
+
+&mdss1_dp0_out {
+	data-lanes = <0 1 2 3>;
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+	remote-endpoint = <&dp2_connector_in>;
+};
+
+&mdss1_dp0_phy {
+	vdda-phy-supply = <&vreg_l2h_1p2>;
+	vdda-pll-supply = <&vreg_l1h_0p9>;
+
+	status = "okay";
+};
+
+&mdss1_dp1 {
+	status = "okay";
+};
+
+&mdss1_dp1_out {
+	data-lanes = <0 1 2 3>;
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+	remote-endpoint = <&dp3_connector_in>;
+};
+
+&mdss1_dp1_phy {
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

