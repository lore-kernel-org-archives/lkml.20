Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EB7A414401
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 11:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790161494; cv=none; b=uUGB1hsxX+LMIwKfUdjuvHqbJ3BQppOaPeGnPDofanARtotigr8+cu5QwSftoBV0poVzES6C4SPX7OjdQ3c/N9BzQd6+zjK+MMgxKcHJwdLYnzbRtER4/66cKSgjYgnUxZI7Qe+uYv/o7IxFy5yKK4ejS/LUS7Z5c3JoJocwHsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790161494; c=relaxed/simple;
	bh=4ydu2ccoL7r4dmhIwMdua1R5h3XcqKfINUhETugo8AY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kFbCsFVt+yZiVitMDzFUPEkmk4poBoK8Yhm7+ldr7NvCE6bFWqDXKmDro6kOqV2mCB2oC1Is0Q/lY8gfqbpl8pzBwtKAYINeSiNULVOc7Yfx9fCePMMfcaJygmFByt7nQehIiGofUVQ92/nmg1g37OJiZK+0qsIwgUOzWXAhbWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iC+hjRuc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MXJFs+8S; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iC+hjRuc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MXJFs+8S"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NA2xWg3409987
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 11:04:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C3HtBGWpPVuucMugGw82PT4fND5zK19Dku+NV3m9Xik=; b=iC+hjRucKRqaHWoX
	cvJTMHAEiu4LoU5IGldYmRXjTt9wEoL1CjXPk0r9ziRLbHhmWiPKBk8WEFZmaRQ+
	0isthONNDsOLbriT5sfBp8614zDVsdUFSIjlJQfatr6ZQQwwkq3o+1gW2aC1I0ge
	lSoUrcD0OC9RL0VJF6Jbfk+WxZhwziIaaDOxgIvVjya41n4L7BJQGjf3crP422uA
	2lWgwA2CI2s19UJSpac50MNR+oulI8UQCGIhIxE0+9mDR5DwOIwGVaB3kAsNPDMW
	4VFXlU9tDsfkSsvagMiTHyzUmStR/JyeLknurP26GoNNDjI2Ei1j5tTbHM/CWb7I
	e2rxlQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gux86416r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 11:04:46 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-32850005b6bso948319eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 04:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790161485; x=1790766285; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C3HtBGWpPVuucMugGw82PT4fND5zK19Dku+NV3m9Xik=;
        b=MXJFs+8StZdwYdoKZhvZeniHf5mdt4XQO7hva1g9cvRAepXIrwCgeVPWSJF1WSF5J5
         UVve1cv5se9CciPxGt069sKFaEdWobTm+EvOiI+nt8ObhpiF6jszJD+C8/CSreShnEZa
         fVCBgtFSEZjOyPDqITfQsjbcsg+jQOtza5wCOhzqtfLSgWA7imEmW1mipcuPJYt5A+Bb
         LH8gfpUznZqi9XqiY8X6zvqT6sdnrGpkg83gUkdeJSZKDkRF3brcWMGNAf+BNFtPUQ6H
         D2A2zrE8dxrGHxK5jUmbR1Uf2Pbiniig3lSl3ZSs0caWuvbG2isdlcRrsB0SLoq2iNp8
         g/vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790161485; x=1790766285;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C3HtBGWpPVuucMugGw82PT4fND5zK19Dku+NV3m9Xik=;
        b=d3pcAU/G6L/WNZO7CZu6IP+tLOtmquqpmJyEt/Js5Y241gCpi0RuXirrjSLeyFqp09
         N3CK/bZKhA466wm0himxCKCYHOjhycol0iD374EEaw0VpCk2jlmi/XUnYCpZwfeGXCVN
         ulK0fdLZ0fmrDxbiAZGI3pyq1gvuhJZu7G3TDZ9z3/Sy2uzyMSadZtq6j37gVZ8vJ2Tb
         S0XtKTgGb4rqhTJbMQ7fbZBWXirC6sJRQ72kYiAd2ICM8PttB+UTPQBIscfrybIGOAdY
         PBeyl2jvneFjoUyNrkLXi133UFstfKEEpc69WmTRY8taOwdWuvLEec6L6zG3eal1krkO
         MGOQ==
X-Forwarded-Encrypted: i=1; AKwUvBwDYaiFXAwWGZc8CyKxBdLLwOyvcaEB/T8N8gjnkV2qV7NbQoKCQZBKne8/UvU+bRqN2j2xKlZgi0t+HoQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nSN7sAPfueAmZ1a9A7rQo5xZwYSJSDxIPR1o8TaLKm2xrrmGXP
	N9QZmBCjzkGPG+hkH8rTKxi1+DW3hUOxhEhnZmR82KqkOdO9ZIcLNt3DHNbJopP+gR2soXPGUMv
	mpq/6liCIitdXIPri8N4RJm9SeX2YVLOwN+fYl9C/oPb8UStJ7CySLtV4nZ83k6qYsxE=
X-Gm-Gg: AYBFou1bKUIXH4FyvOpBVMckHKNN8Vj4fSXRpq6whmTFcFVkaMWcfD2BshUfdOogWcs
	jWEdaoSGPLb6vDOXBlw2qk5ZyCnRP+PGfe1haB+N74srr8kpM4M3d1RfddKaX8wlK5epQh0E/D3
	gAsk2kMoAPzrqYm5to2Tk2KfOWxxP+9SWzsq5BfDWzXM4IjpSyZun9DzZSJ2OZ5AhHDxUCFGWo5
	0ujFtiJJO6CodwQ9nguriUkFBI2fUDy4CucgEI2ONouo1NcqBM08PN6OqiKST9dqdgUFoAemieF
	shlmVpGSEfZDpk3eq6g0MVRzSOa/QV96CO8WmSHCD1A7zwMARVeJHH0dxsgxoHvdPKuS+eQHy8h
	savS1NiQ/symZqiPqJIfdC0wAFD0yjg==
X-Received: by 2002:a05:701b:2714:b0:144:f44b:fa26 with SMTP id a92af1059eb24-144f91cb68emr2109012c88.30.1790161480448;
        Wed, 23 Sep 2026 04:04:40 -0700 (PDT)
X-Received: by 2002:a05:701b:2714:b0:144:f44b:fa26 with SMTP id a92af1059eb24-144f91cb68emr2108980c88.30.1790161479765;
        Wed, 23 Sep 2026 04:04:39 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e9625825asm5905377eec.13.2026.09.23.04.04.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 04:04:38 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 16:32:41 +0530
Subject: [PATCH RFC 10/15] arm64: dts: qcom: hawi-mtp: Enable camera
 subsystem for Hawi MTP
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-hawi-maili-camss-v1-10-cbbb42e534ef@oss.qualcomm.com>
References: <20260923-hawi-maili-camss-v1-0-cbbb42e534ef@oss.qualcomm.com>
In-Reply-To: <20260923-hawi-maili-camss-v1-0-cbbb42e534ef@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790161355; l=2682;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=V6exmN7k6wtdOoCYYQmAPRf23Vw79t137APmgsQGhOg=;
 b=L94jv+35gQv7GLk5poLrS5WPX8QqX7ygy1v5q0nUlk0ekJaN+3ASE1+kmvFyU3ggoIRuwGlbK
 b0RwcPbBxKCACpGfZWv5tQ+fJ3jmPzpTQ+3DxXHgEPqWG60au7zLOfz
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-GUID: GnmBXFGxWZeBa8puK6x5_okxikpc0xXY
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA0NCBTYWx0ZWRfX1lQAysFxuJOQ
 8jHy3tOAqjsbBmpkqax+c3f63ygKxOREODnyt1m9Rm7LQChohXMj8TKGREuLQWVEfmgwZliz3F9
 RJtTGLduDl9M5ERX2Y5uLVnKd8SCnnY=
X-Proofpoint-ORIG-GUID: GnmBXFGxWZeBa8puK6x5_okxikpc0xXY
X-Authority-Analysis: v=2.4 cv=eIOGH3p1 c=1 sm=1 tr=0 ts=6ab3b24e cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=2OLIcDlHICjy9cVqpt0A:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA0NCBTYWx0ZWRfX5y+sUj/ARnnY
 k3VkR7prbkkukN5p1aCTcoCXq+nJefCs9gq60JhiBEsyGoKpMLP7yXLLU+ffCB5GMrzg5RtFkTl
 mBMcMX1YTS/nD/xfHSBzFvfLsEMujYmlqbrPc1yFriBOdD4hTOB2cuoBv4i+4uPhdTb3f+0lCk1
 TbLA0VC2Xwy78u9YoV/WiA4EE+QJaR/ExYb68t0kwhoqnsXedvi6LQ+evM9/6O3nGCAsXvxuVi8
 R434WKPHGwD5NfDLCCea5jwnReW+ZJTYnjc1YBmAo7IwcqBjqmgfIoZkDFGLBKCMmjJPz2/0wJl
 nwXO1aqTbqhDJnx+coKfegnEslfBKc+xnzf6tHWEZRL5P/2AscMvjhURawt8dyAAlN1NuD948D6
 2n6lO3GAMBpcFRODLrQtKTacbBf77u3SdjLzrS8202t1LHUU9O43iA9+Oo3uMy1orKhTl1G1L63
 jbKVrL8ZtBUwSvDNFSA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230044

From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

Enable the camera subsystem on the Hawi MTP along with the S5KJN5 sensor
connected to CSIPHY2 through I2C0 CCI1. Add the camera master clock and
sensor reset pin states on the TLMM GPIOs.

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Co-developed-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hawi-mtp.dts | 62 +++++++++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hawi-mtp.dts b/arch/arm64/boot/dts/qcom/hawi-mtp.dts
index 7709582491f9d426886a6afced6d3706b629e620..183c0c7a7595703113cb709b0e9f39ea5dc339b1 100644
--- a/arch/arm64/boot/dts/qcom/hawi-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/hawi-mtp.dts
@@ -7,6 +7,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/linux-event-codes.h>
 #include <dt-bindings/leds/common.h>
+#include <dt-bindings/media/video-interfaces.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 
@@ -781,6 +782,60 @@ vreg_l7n_3p3: ldo7 {
 	};
 };
 
+&camss {
+	status = "okay";
+};
+
+&camss_csiphy2_inep {
+	data-lanes = <1 2 3 4>;
+};
+
+&cci0 {
+	status = "okay";
+};
+
+&cci0_i2c1 {
+	camera@10 {
+		compatible = "samsung,s5kjn5";
+		reg = <0x10>;
+		reset-gpios = <&tlmm 3 GPIO_ACTIVE_LOW>;
+		pinctrl-0 = <&cam2_default &cam2_reset>;
+		pinctrl-names = "default";
+
+		clocks = <&cambistmclkcc CAM_BIST_MCLK_CC_MCLK2_CLK>;
+		assigned-clocks = <&cambistmclkcc CAM_BIST_MCLK_CC_MCLK2_CLK>;
+		assigned-clock-rates = <19200000>;
+
+		afvdd-supply = <&vreg_l5m_2p8>;
+		vdda-supply = <&vreg_l7m_2p2>;
+		vddd-supply = <&vreg_l1m_1p0>;
+		vddio-supply = <&vreg_l4n_1p8>;
+		vddio1p2-supply = <&vreg_l2n_1p2>;
+
+		port {
+			s5kjn5_ep: endpoint {
+				link-frequencies = /bits/ 64 <1248000000>;
+				data-lanes = <1 2 3 4>;
+				remote-endpoint = <&csiphy2_in_ep>;
+			};
+		};
+	};
+};
+
+&csiphy2 {
+	vdda-0p9-supply = <&vreg_l1i_0p8>;
+	vdda-1p2-supply = <&vreg_l3d_1p2>;
+
+	status = "okay";
+};
+
+&csiphy2_in_ep {
+	bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
+	clock-lanes = <0>;
+	data-lanes = <1 2 3 4>;
+	remote-endpoint = <&s5kjn5_ep>;
+};
+
 &pcie0 {
 	status = "okay";
 };
@@ -937,6 +992,13 @@ &tlmm {
 			       <119 2>, /* SoCCP */
 			       <144 2>; /* CXM UART */
 
+	cam2_reset: cam2-reset-state {
+		pins = "gpio3";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
 	key_vol_up_default: key-vol-up-default-state {
 		pins = "gpio101";
 		function = "gpio";

-- 
2.34.1

