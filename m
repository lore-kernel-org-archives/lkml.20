Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 880403E4C88
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 09:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789896017; cv=none; b=dt2Mcmfi7y1N4a0Oe3Sevp+UWASW9WgJSXpw9J0ZoRdVSfSvOvvcAxhhn4dJ/iAGYDE+j2UqS/JlEhvBvnAvabnx/Xtz32DBQV7p3f+jE2YD89byOxl6mOV0tQM9MNVN4hlfYO+pHmORrhkD+cdVuMm5z1GApiBCh4JISJBW7Ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789896017; c=relaxed/simple;
	bh=BySI5VmNu0XMsBrJdklikPENZUstY6BjektoLcaVQcs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NgQ01xLRUgJ6ph/7UG8QVQeCI/u0btDeS39hbwdrIPHFuSfBQJrRlhPsIT8XWrakPjK6qzvqgqgASCU7vZfUO7KhfvwghPg7MnBydpr5hXaL57pL22GicKrFKRivY+ZGjGMYVRnitwbxKhuyxofwtgwr5A6gLxEISRklUk779EY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iwLTz2OH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Edlw6GO5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iwLTz2OH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Edlw6GO5"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68K8Vp3t579019
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 09:20:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=7lobyN1OUJy
	jnVa2esTQNCM5aKbLBwwEc/VQBoz4IIY=; b=iwLTz2OHElynWyqQ1hrI2NV35UR
	Qy89V72Quc0DEG6bOzybea8kMSmPDVnlMWtG71sVGiREGsLVJpRetfe9s261Stsg
	CFcoOBcRt95JubJLuyYu4ypKJIUG4w2Fi68KJ8ykQtOF6CUJ3s368gN5id2SetUX
	JSAmK4qC9aPJSCP4MKD05clJhbtgNTPUeea5XBtOG1O5Ch9QyD4q19eFv9bkRIyd
	3trzf/nzsQ93/0gZ3xY5HtCXGd6S690dkWXQHZLwSx7UxCDiDVrJmX7VI6nAPNh+
	m4x5hZs1z8HpJTikvsh/XVEazOBZH0ckIpX36zXzfLvL08xAM6PHUFYeBKQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gskjk2jkm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 09:20:13 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc4e496e5c3so1694023a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 02:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789896013; x=1790500813; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7lobyN1OUJyjnVa2esTQNCM5aKbLBwwEc/VQBoz4IIY=;
        b=Edlw6GO54X3GnhhW9W8ivqbiczmmcxyWbEI4/lQNzHw2sn881ctEariETv2qhBnvDT
         3mnOCCxoGV17Oi2q5H9BvpNeXUxWquz0JZ3Xed4c8Cnx8ROgQSBo13EeMrFYOD+DE4nn
         pOP+w1ZSgLnplfxNoggR0h2273iIgTNgBPr9OxtgxSJSlgfpL6JCk6hIgSpnccQeQlJh
         cXyzyDhSq0H4NOPetlyxXHKGl6UR96293JqUMJfpid1pPiQskEE4Dw5SuP5yLjsxvf/c
         /RLDkPXcuN0WU1fPJ3lA0fyirYn8iu9LtSm/tkC2Wu3+xo45d454mlpkrr3FKMDD+zyA
         WTlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789896013; x=1790500813;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7lobyN1OUJyjnVa2esTQNCM5aKbLBwwEc/VQBoz4IIY=;
        b=GfabG5rimmyvpcM43Ihs6Z81f2rzxfPPInXtFKq1mJJAsrRsSzv1q36Q0KtnhOcv6z
         40M3izFB2IiWFsNIKH4JgjC6In/x085HawyF7pxzg5f9j7mdDDQ6CQV0KacUE2/A1OBF
         NIp3BAeYexV3Gzw1DLWegDWRa3BIFrK+VKoOk9MXCrRyqE2ixxjzDibMo5k6COpDsMEL
         vI6S/X78bJRwmRTpiv933sAjJCxTRQCrsEXjhFV/YV1hGNVq5hbY1bteREaO0r4HCV4L
         o2VpMjifMaa9jEj1uS02lEh7KhB/+QvkARzAqlMcnMR6clgc1Jmt728DEuGC84qZ4eBz
         fW4w==
X-Forwarded-Encrypted: i=1; AKwUvBwGhhxN6j2yNuCvDtwCjwomzBRNB9yjYdh5zt6NZ9vRO9C3WceAGQeOqKg5BMJ0OioBBoAp1GECZy/H2gI=@vger.kernel.org
X-Gm-Message-State: AFuF++mGKZ+JQm9DOn5URFTciOAoG99QDwaYSvq3Hqs5zPhSLDGU0bqu
	tlCOX5awsfL18jw8jO7lkN8tJcfnU7up/Jg/HxujjFA8P1uq/orx7CixGZZDdWvEXAaSLdsTU62
	GOL89R/ajcpEhjvYZzq7Cu07UOqPE0WarSzMxUEKe3iwjKmueLeUWO3h1NywLibED6pY=
X-Gm-Gg: AYBFou2Jc1FHH3Z98NQHySdS8viFf1M5DRckyueIasVd65TdIXTM7oRuTAydmqwzhZj
	Jic3YXfokcuOTNvBJueuJ1j9CWkZnzRfRuf7tjNCQo/8Ka2qeFTkuZ0oWzL7yIVE6GLfsgwA/wZ
	tVFBIyl+OQ/9Ui9T0hZh9vTGDfO2mxgSpT4QI33omktf/vS1JnDnDI4002thyZ7EkFureFF0mgk
	2/bAOXMAydWmGXC3VT6Uu+4EewO+yrql5YURpievQ1H/wOUXrcmOtijkFkHNwyDtiYPWVZU348I
	pgolZc2KjMDjNyo/Kb/rajqFGb1Vct6e2Q4M620P5F75IAYBR7+T+AJPFLDq6k56RA3FWjwEdwy
	DzNtPKxHBZ6nhT80P7naCTQUY1iL+GptPXsfTHgQg5dxni0f06srguV9T7L6V
X-Received: by 2002:a05:6300:279a:10b0:3dd:a195:fa25 with SMTP id adf61e73a8af0-3dda195fd8amr3737675637.74.1789896013410;
        Sun, 20 Sep 2026 02:20:13 -0700 (PDT)
X-Received: by 2002:a05:6300:279a:10b0:3dd:a195:fa25 with SMTP id adf61e73a8af0-3dda195fd8amr3737669637.74.1789896013020;
        Sun, 20 Sep 2026 02:20:13 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c331d3f2csm9353630eec.28.2026.09.20.02.20.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 02:20:12 -0700 (PDT)
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
Subject: [PATCH v2 3/3] arm64: dts: qcom: nord-rrd: Enable eDP0/1 display output
Date: Sun, 20 Sep 2026 17:19:30 +0800
Message-ID: <20260920091930.2215803-4-shengchao.guo@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=H6JOUOYi c=1 sm=1 tr=0 ts=6aafa54e cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=wlBrTx1nK-2z6_sN8T0A:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDEzNCBTYWx0ZWRfX5TDvOYNDDIdg
 EWOgGOfmlnCk0Jo5G6mtFxKzb5wllwfy4WjSM6WlT4R947XQ0y47vudj2vTVXECGxy9KYp8hZGM
 qiZrGMj3JEyOLK7Ac/8BUh/2hkYuoqPLe9mKHiAA0FIC4VwSMwJyOZUOV8UZCoPOKPiY4a8BMNc
 JH86Va4pxVFuPwpMWwVWzVHxrcl8OfiGU0Feb+9jbtKOe4svLbYKeI7kHyCGfpWQb9+yv/DpMk+
 dd0tHSCV4uws9oe9626/uBYu6WETA2jPsiJ8xvUO04ND3pNRtG7iEhBW3AofFx3mS4GAVVbLHBb
 E/oMiypRdf5HMyiRrQB0znVpJKamOrH5Vrs8jRa6i8WvOARi5MDBfAe8NTKo5s/NrePmcPYkIJ9
 kUqnIr1poOlDB/uygKLdjzktB0oSaZnFNuVyxac9N1/Abx/xibYqOetvSpO9nRrVTdLvPtBQq+2
 GjcgEpmyd0hG7Zp8qJg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDEzNCBTYWx0ZWRfXzHB2m+MBIFc9
 nFyLPxqiJCROGw81FKkQgqeEDW1J3bT5nWfVxKvweSku9tHLfQ2jQ7NvQUObXArIwl/awP+Ffl6
 Oillyl4kSeSBQc6GXX3Th6L50YsiF9k=
X-Proofpoint-ORIG-GUID: fxs4UY2GKzRNdiTK_AX_IsaPmUq3KeNq
X-Proofpoint-GUID: fxs4UY2GKzRNdiTK_AX_IsaPmUq3KeNq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-20_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609200134

From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>

Enable the MDSS, DP0/1 controllers and eDP0/1 PHYs on the Nord RRD
board and describe the eDP0/1 connector, its 4 data lanes and supported
link frequencies.

Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-rrd.dts | 62 +++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-rrd.dts b/arch/arm64/boot/dts/qcom/nord-rrd.dts
index c547963371b4..3b0fbd3b6e7a 100644
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
@@ -366,6 +390,20 @@ vreg_l3l_1p8: ldo3 {
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
 &i2c7 {
 	clock-frequency = <400000>;
 
@@ -377,6 +415,30 @@ rtc@32 {
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
 &qupv3_0 {
 	firmware-name = "qcom/nord/qupv3fw.elf";
 
-- 
2.43.0

