Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C23353A9623
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 01:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789695517; cv=none; b=OGZ9SVU2EUgNDr+FVxAhGVX0xtTRl6dHfILdJ8Rpq0ea3EfomyE/aXrILpzvKY6c2k1ha/P3Yd6EA+sjlNXwEPDQ2fxx/uoAnsnvCK4TT1jvpNKy2kEiNZXNOaNHiMGoqMJ/VWg6UJzAT/gR4qS3rPDagjSyo3ggsqaqZe8ye9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789695517; c=relaxed/simple;
	bh=I6HvCF3WTYJWcHqX3lAFcpsoSXIqQo1U4Jx/VXr/QWw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n7mbmc9DgSKAvHpOPy/bPxvEhS9LLGuRav4FS9tet23LTmnFNkDMx4W5r8ie/Z2Cxk6fvbQnJuzwiONIXqrLtKIwSRedMzmeafQid/gPXEcUzdCVIvY8SpMxFJhB//V6PNRvUsbtO9U6qYT7k0Vj6mGL4z6YEPB7noCROjCriM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NLkdHpne; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XqfEs3Wh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NLkdHpne";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XqfEs3Wh"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HLFdXB2136993
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 01:38:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=XpBYScMFukX
	OqBLbka4EhzpRXyG392JegIU0l2YrNjU=; b=NLkdHpneVkacD1+1a3nvwMCiS5V
	uZwBD2HGytDoarzQat5C44v+eNaCO9JtdbNjjtJYjaKWcxpbacWVD9n9X2F0fBxe
	eeOyPFBcPLNYoOGhMlssDDsrPrOE6GLTwJUzIg1IVV784FX2mXTqoadLT0FCMgng
	yJtixPx5o+kd/wiOhQvHMh7ZvnH50WJjKiEgTQrqDBGvLUeD4gvfFT5odZa08bVm
	4NfBPPNoBpGr5bGXjOsxzWmzOqXhRE0YmmrSgVmXtu9HFSG+2oWmYIAJDTvpJybv
	Ij00R2BqQ5n+/+uSuY4pVIYTM66CScQOl4GtRT7cdvWaDocRKCd+ElqS+IA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grmv5ht7m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 01:38:32 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-385d2703b64so1512510a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 18:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789695511; x=1790300311; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XpBYScMFukXOqBLbka4EhzpRXyG392JegIU0l2YrNjU=;
        b=XqfEs3Wh33+KmQlGICxl4IXbHRHRGN7tNfjFSZc4aQ2zwBSQzTvSenLeiZi9N2j6kg
         IkZ2tHbNmcIgSwLalpWUUmpCDPf3H1w44FduxWkXPqN7cPST/Z8XIPGEEgjrAGM5WFDM
         PPlXQ8IS0jE+b0TAdLt9ljk3/nZSrkrdk87wFWOGYmTNmps8jkmQR0XiXYghM2PPSrGz
         Yi4GwD93vt6k8n/2LKEoAOjo+M+ntHroy11znkiMHbm3qMyS2gdYwviMEM3vXZqrlMaS
         W4jsv0RYRll2IbpSpOb/DtaloIXabKCrECcznPzG95LQwpQQkUgo+UcIKSh0Kh0wAzkq
         ig3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789695511; x=1790300311;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XpBYScMFukXOqBLbka4EhzpRXyG392JegIU0l2YrNjU=;
        b=0T79iXdgbMBDzM6ZG+94fS28+10UIv10IqutYymUSpyYH+1P498yk5LJsQ92cwqhXt
         1i5kNpsBjWJNCcABxsGOftfcPAOSSa05afxJs8VIzwAbdRWZsPX3+oWA0QMMywTZ6XxG
         qnavuzW58iInzjFRz+NjIUfWSKQPzUgAHC5TydgCZMQ9HZSLcVeTm/+jRqoWHwpXFufQ
         81uOyN032MNdcFwbyoKBboaX6vdQgY9WepTszebg8VTlybg8P469zfutC1dJZTBYtHwM
         qBJye9+E+Ub4xGjAe2jXGP2MfjBeSvhm0FyDYELJLFphys55GSeh9LiOi/DNfkFlKr3d
         Derg==
X-Forwarded-Encrypted: i=1; AKwUvBxXiPchAJ1S7ioQOERg5/eLOx5qyosNL3zT4oCuvNARzeBzaYFm9Xg1MTbferkkIM308OWHKjrvqrUqfEs=@vger.kernel.org
X-Gm-Message-State: AFuF++k4J2vsaYhDSGCQ9TwPbfx4HOBG4vPdUMpnbiQx0VJmlBlMgOek
	/ZjxEGRHg7Z5OVP/ysXQd7SMvPYlAkGd8mujuaHJ5o1C+CXRFnrAl1OtL6/TuOdIVp8mNm7uoGa
	p7CM0O/DUJCqizT6bp0Tk2J3OriT1jyQB1zE6pR0bRjoM/oo4l5Qvmpz9pIoB4OVzDv8=
X-Gm-Gg: AYBFou3zZm+x2qiZtXJdNoJ2PReYo3ocK2Cjmz6C2Rs5z7B5X1CDbzqbJ9X2c4n/2Ep
	/5wpk7N/5RKQE0sbINkUwhs+nbmm4s0RJqqhj4HJOtv0BKiXfOvmO64TpjH3XM0b1URLlZ5GdaV
	0idiVt1kPdpsWc1flzlu9wOsevHfc+vpqepxBYWhqPdPOoLS0XdTDj9r7x57hHVMz7s3eVZmdLt
	gLd2ZsdIez++eBAgfH5PkTtMm+eak7yqz8+2ZBJXtdXX672GvM4yax++GuSvg5XvKfXbR7nr/wd
	XbvI2VcIeC/pbJDNuqjmxnDp0GmrMLGXtezadJwlnRcc8EplPQ5qYmfew8wkrMPUDL8fDZZrGV6
	9mMVkbEoJiU9dv+cXbtHz2Aypf/oULFOBpY39m3WhJx3eUdK6pUY9+IbT2lzO
X-Received: by 2002:a17:90b:3607:b0:39e:370e:2f48 with SMTP id 98e67ed59e1d1-39e370e2fd4mr5315496a91.4.1789695511524;
        Thu, 17 Sep 2026 18:38:31 -0700 (PDT)
X-Received: by 2002:a17:90b:3607:b0:39e:370e:2f48 with SMTP id 98e67ed59e1d1-39e370e2fd4mr5315466a91.4.1789695510978;
        Thu, 17 Sep 2026 18:38:30 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144ce03c682sm821276c88.10.2026.09.17.18.38.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 18:38:30 -0700 (PDT)
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
Subject: [PATCH 4/4] arm64: dts: qcom: nord-rrd: Enable eDP0/1 display output
Date: Fri, 18 Sep 2026 09:37:40 +0800
Message-ID: <20260918013740.1355096-5-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260918013740.1355096-1-shengchao.guo@oss.qualcomm.com>
References: <20260918013740.1355096-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDAxOCBTYWx0ZWRfX1mQnkP3iGdDu
 spoJZlDkEV+A+M3FJ+GSqMaHtiiPsIDD6RewlEa7l/A7bPDwGAlblRn0/wf8RpCA/BhPNpCkHgJ
 IzG1RoEKEV0cfbSG7IkpfSRNuBF7vFH0IKf1tNuuEIujKbZEaVi4LzltxMhgbcIKHQXztrxGUL6
 nS+PqozziZtxa2qQ65cwZajgSVBiqRdvfNdPL6QQ4ZgSKis6SukD/+adDkS7toRr2AlHf6Fg9Wq
 L0kg3NMao8JqFmghG5FuYiUJ3gzwq6qwC3p+YjkcxmyInenAcaK5nRsZGnUPtvK6jbM0FU4Aume
 3ASydOCYadyzQJ2TMevST50mtfP0PLozxYT92T4UJaqrQTPI+5gmexMOxLu8xOtzHoc3g3prQ6H
 QEGqRSHcNsKCEhhL5rNefjVe342lRy/4A7y4q118GdPKYsHG6pWlopiRcmlmmLtMqqPckS1JYkB
 iq5A9x3nVnUMiH3FAMw==
X-Authority-Analysis: v=2.4 cv=E+5YNqdl c=1 sm=1 tr=0 ts=6aac9618 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=wlBrTx1nK-2z6_sN8T0A:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: XfcArK4kQTeDbdzt8EjdGwZni5gppQ1e
X-Proofpoint-GUID: XfcArK4kQTeDbdzt8EjdGwZni5gppQ1e
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDAxOCBTYWx0ZWRfX2VtUmHleF5s4
 /JHCiLrfd/2IOY+hrxppNk8Acte1oOayPxZRn3whwbCTc5DuzbBkqFMhDbN19rIYyfQRodV6OWu
 BZsnQhniuCb1/6RenZxoqlYIjTpqY0A=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_05,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 spamscore=0 phishscore=0 adultscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609180018

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
index c547963371b4..802987da3cfd 100644
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
+				remote-endpoint = <&mdss_dp0_out>;
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
+				remote-endpoint = <&mdss_dp1_out>;
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
 
+&mdss {
+	status = "okay";
+};
+
+&mdss_dp0 {
+	status = "okay";
+};
+
+&mdss_dp0_out {
+	data-lanes = <0 1 2 3>;
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+	remote-endpoint = <&dp0_connector_in>;
+};
+
+&mdss_dp1 {
+	status = "okay";
+};
+
+&mdss_dp1_out {
+	data-lanes = <0 1 2 3>;
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+	remote-endpoint = <&dp1_connector_in>;
+};
+
 &qupv3_0 {
 	firmware-name = "qcom/nord/qupv3fw.elf";
 
-- 
2.43.0

