Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAFDC10F0
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 09:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789896014; cv=none; b=CPgl1LkMaYkrioss8esK6Ip0eVKmqrzdeIRjE6ZD3upz6RtbKxlDLYKvFSK53zUoZdKsdMy8+4bGh3grQuDbQsfydlcQ5CdbBlSdR9kRazE2M5wTbSO1BPfa/ZS9n9wtCpEgP0Tb/pmLuP3YuuZxORFouhDTmI8M+KaXb2k5R0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789896014; c=relaxed/simple;
	bh=uPpsiPfsZW7SffwB8R+c+qZFY1UdqaJ5YycZmxJ54hw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aeZEnsf0RpTXll0HMKZqtEIoqeejeZAHhGdbn4m3sQYuVWDpR6ZRSNBwuDc1l9ANAPLSkME7DKn61klOpi+gnCoe/71xaUF24u2j5Cm4NypvO0MkZRGQbOYegv+HHW4ZJei3X3+KDC1lEBV2EYZlsDrjb3xjiFDRmJu48IrcnqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cIS7V/iP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hDQCzaUN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cIS7V/iP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hDQCzaUN"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68K8VaRw1891310
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 09:20:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=LD8HUyazyLi
	CHKBH7P6g09BRaF2l+Aj0hkNJ/CZjDVo=; b=cIS7V/iPf0iXEmdZEGk1wXdWPds
	M5QmF16M+iZpdxYDfjtmjPqQ2fVJPw78060wY69SMxZhKind2Yn2jpgM2Qxd+w6j
	sfd/pndSqVHr5IGFRZ2PBC1TudEWIGgIOTthOcr6opdubmwCLyviU/l2VGSL56EL
	HEzbP+fVDI7k9dSlxeVun5QiFJc+TJlIcns8SGpquNZaTVtU7ckY6K5mXtduh03C
	y+NZilNCnXxKLReWUqFscZs9SJlVChI9TfQlLlGljh9GaS8DjJ+gLcSFwN/4+Gj4
	NT4kSSj/FkYOAW0FQUXQuzpD55gtIZHdzi27jnnalE6nnQsLOsw75qDNX0A==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gsfrnu1gg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 09:20:10 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc7361c62b9so812170a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 02:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789896009; x=1790500809; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LD8HUyazyLiCHKBH7P6g09BRaF2l+Aj0hkNJ/CZjDVo=;
        b=hDQCzaUNLJz7u83BmOXYSSChvCh549n3uo7adq+mBbkaci1+JFKwYlNr2JkC5vwN34
         6wLZNnK+z5XMPxgHsrPBVwoKOtlhsIZF+NXvmJMRKiatUM+4bcCeel9vGpvpfYoL4dG6
         VImqaVSc1FnQSM33KtVMnnvXInQtCGGYxdZqgDRnaIfEBOhd6/JE1r+MC8gMD2zmJnQN
         I7KC2ickA6cPSW/CxJrPvN1sI994p9jmJ5F4UKc72cau6EjYuxjyUW4zWGteXeq9xLLr
         GztTl1CKQwGoKCuonKkG/ExcESnoq7QiD4+F106X7dpJ1sBASDqP+mjCGBFFRUdJ5KJJ
         yrWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789896009; x=1790500809;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LD8HUyazyLiCHKBH7P6g09BRaF2l+Aj0hkNJ/CZjDVo=;
        b=ght005Dy1ozxZaswEbfUmqoFPeAVFNGJxAVzgMuyXFh3+21hC3wuevPUQMg3WXst+n
         z1kYYC3wlFCgk6ZHFX2JLKHlNfuFba0ZluJ8QhY/XCsUqhK/VXvypk7AgIrfyE3BFqM9
         dkb4xyUqDKxmHy6G7FOIzsUK927LBcsEpfWppW3bBCxeBuTrDBbfjU4wsLhafPzXc3BG
         3TpMX+fwAQObfF1davsLilnzxgmwNk6NNU4n7hpAQzr6AuQO3ZSSBXu0BtjTHYOcMmdW
         /jVpHy2dIAAPBqDkQwZxYaOOl8FBLS2AyWbSq0LVZJ+m4irhZlgDaRjD8LnPua2d44/q
         3wog==
X-Forwarded-Encrypted: i=1; AKwUvBx2HhshJvEt0/6qOfGz7lH8X47fwEOqaY07GESBuqnb4bnp/93WuIO29WHYBWYZ5grUXsycZsa61ueY0Vc=@vger.kernel.org
X-Gm-Message-State: AFuF++kmZILhD4mQHK5w5AQ1vmN0Kev4jBynwMLbKzK3Zb1BPSJfVr31
	ugLXKY/GjROSYamGBvBeEbdlQOCO09FImS6uvsxoQy/RzRY10Icxkhkn/+NGaK1vlmyVrwl8O23
	gmgYFXzOv5WEnQBgpbZIjkJLbmms1LVx3p99OAlxZR0PWDIGdKzd7I5IZpTecj4ouzgs=
X-Gm-Gg: AYBFou2RyMI4KKc962ur6qfbT4iZ6ziVzqyJMTFhbNTYX92Hk+eOVu9sxxTS/atFdiW
	fR8FQ8031avzFtyJOl90GUa4qzt/Sibhh8BvF70Un2LK9Cyj0+OLPh4kiyOvx5qbiLZRZ/C5CuO
	SXnN2IrPKlpRi7KM3c8Y9J5xMwugVebhDfs8kn3FYtJOZxEvLnC2ieYkaUMUP15aQ2JTQH+OQma
	0Ukqqw6fabojYkUVsiS6NO2TDeROnPi5aX1OkSqPH54D2+f7LrEnE2hiFHBhdZt7hZn7AqBTQqN
	GQinhzIBtgYQ4zV9hv8WZ/zPV/wUluNIb4aXBOe6JpQebqYmSmdA3GABkT8ymSNaby8tjYLNxWs
	DlWBjrssKyOmBQG6ps9KCbR01FfR3bvESkaJ1a5gH81OOnJgSpXEpR8a2Viy3
X-Received: by 2002:a05:6a20:b78a:b0:3d3:ae40:51e8 with SMTP id adf61e73a8af0-3dd8c575882mr13402032637.28.1789896009424;
        Sun, 20 Sep 2026 02:20:09 -0700 (PDT)
X-Received: by 2002:a05:6a20:b78a:b0:3d3:ae40:51e8 with SMTP id adf61e73a8af0-3dd8c575882mr13402004637.28.1789896009039;
        Sun, 20 Sep 2026 02:20:09 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c331d3f2csm9353630eec.28.2026.09.20.02.20.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 02:20:08 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2 2/3] arm64: dts: qcom: nord-ride-embedded: Enable eDP0-3 display output
Date: Sun, 20 Sep 2026 17:19:29 +0800
Message-ID: <20260920091930.2215803-3-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260920091930.2215803-1-shengchao.guo@oss.qualcomm.com>
References: <20260920091930.2215803-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=W9mtxhWk c=1 sm=1 tr=0 ts=6aafa54a cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=F3f4s1Zse-zWnPoJeOMA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDEzNCBTYWx0ZWRfX+E4+aHS7aC1c
 S5nli9C/FI8iuYkcI8jQtVH5EnAMwqJrN9frlT9iPfa68iZvp4TkFcd8Qe/YCcr7hVWmvq3npF+
 CLbBO07TuUVODwVWet94O/dHzFZ8RYI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDEzNCBTYWx0ZWRfXwAo9+8AEJ/G5
 2iLLed+T/n7jQb94bOLxylYNYX9XytVBpoaGk8deVhXjfP7M2nM/brFPJwgewlcBv+qxlbpeEEh
 QYxIhxeFQJZiOPza3JPzdXrvwJc5UK7jeSOO0mp2jB7R6+gKLCHQsJbokXOl/qHfFqnKVpp5EqY
 LoDG8mSNXcuAyrUAVQluiI+asi+KoZe8wSEl0BQ7l6njgBA+Q0hhnG1JdMLKjQGlv5svwoqptqe
 gxkD53FXMYj5BBI7tZm1GUKx+qBUUFacaOFVQRyzZg+S2ooFnXEM0CAAmfF2JYEDupT16uwp1uY
 EfWbK+izwpRbbjo7WNFsYOZX7AJQS7rKgJjVTsZRROZc/qwZtXyZu4FHecxZE4s0zZ/vCrL3613
 c/WOrmEXlkI8WjhCCPOAc+Bv18u3st5k6VtHd8TGFF72BdNyN6LRY+vxaRXfkQvfDE2b35ek3a/
 eGLstNJAxz2ORXTl7yQ==
X-Proofpoint-ORIG-GUID: 1ikGSfcQaivcPMtCco6nZeYUo2f_DrgU
X-Proofpoint-GUID: 1ikGSfcQaivcPMtCco6nZeYUo2f_DrgU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-20_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609200134

From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>

Enable both MDSS instances, the four DP controllers and the eDP0-3 PHYs
on the Nord Ride Embedded board and describe the eDP0-3 connectors,
their 4 data lanes and supported link frequencies.

Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 .../boot/dts/qcom/nord-ride-embedded.dts      | 128 ++++++++++++++++++
 1 file changed, 128 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
index 09ee525764ef..1bb47b12e6ed 100644
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
@@ -366,6 +414,86 @@ vreg_l3l_1p8: ldo3 {
 	};
 };
 
+&dp0_phy {
+	vdda-phy-supply = <&vreg_l2h_1p2>;
+	vdda-pll-supply = <&vreg_l1h_0p9>;
+
+	status = "okay";
+};
+
+&dp1_phy {
+	vdda-phy-supply = <&vreg_l2h_1p2>;
+	vdda-pll-supply = <&vreg_l1h_0p9>;
+
+	status = "okay";
+};
+
+&dp2_phy {
+	vdda-phy-supply = <&vreg_l2h_1p2>;
+	vdda-pll-supply = <&vreg_l1h_0p9>;
+
+	status = "okay";
+};
+
+&dp3_phy {
+	vdda-phy-supply = <&vreg_l2h_1p2>;
+	vdda-pll-supply = <&vreg_l1h_0p9>;
+
+	status = "okay";
+};
+
+&mdss0 {
+	status = "okay";
+};
+
+&mdss0_dp0 {
+	status = "okay";
+};
+
+/* eDP0 */
+&mdss0_dp0_out {
+	data-lanes = <0 1 2 3>;
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+	remote-endpoint = <&dp0_connector_in>;
+};
+
+&mdss0_dp1 {
+	status = "okay";
+};
+
+/* eDP1 */
+&mdss0_dp1_out {
+	data-lanes = <0 1 2 3>;
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+	remote-endpoint = <&dp1_connector_in>;
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
+/* eDP2 */
+&mdss1_dp0_out {
+	data-lanes = <0 1 2 3>;
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+	remote-endpoint = <&dp2_connector_in>;
+};
+
+&mdss1_dp1 {
+	status = "okay";
+};
+
+/* eDP3 */
+&mdss1_dp1_out {
+	data-lanes = <0 1 2 3>;
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+	remote-endpoint = <&dp3_connector_in>;
+};
+
 &qupv3_0 {
 	firmware-name = "qcom/nord/qupv3fw.elf";
 
-- 
2.43.0

