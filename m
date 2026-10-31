Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793456715;
	b=H/klQL4e65bQABC2ibArTiehDKxblHdq7xHJULePcMaTI9xzPSlIBBFiGl/d3ciTKWVW
	 S2ggdJKqd5j1L/mt4vJUqMTeXFJp4HTzxTqeEP5hPgykHAjZh1JboCnx+a3rMptrP0pk2
	 ehKqdth+MXgUIr2HqDp1B3xpTQD3QGe9KTtCCl5NszzkI64orT/PSTSWsm9ELLXb0iZkC
	 sKi+dCvK0MS36tDP5bpEU4K+BZ9oV2S43VanHoDlziKbGY2LNPnw/tN2whv2nNADAwX3g
	 AE6TVXB0ofS9VIfiyNpTCIkfe99RPToI5cU5ya0rTsAIELmEvCTMhLDdPPuHSd0ocTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793456715;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=QzPcCIEIvOS8LjNhd6RsAaUljwaKhmmfkIvxR6vsypY=;
	b=EbH8Gx/M8kRsFEQg93aPvscrKkd3BZ64YWpMWd5iUQftqznHDnhkyByg1B98WpAVjViA
	 /QSkJek9ca6DY3DIJlnLCxCVIObKANqm+jNk6trl6Swz47mXOA08adeIWk9dpYnnQ/Zbp
	 fSe9UArtrCjggiakdlXzRoONMK4kC6sMVfTEEqOSdPGc+VJXYjowZZnY+hiYGXyukQF6Y
	 4oZnFAA9IEHrHgSaQxDn/cz6Q6GxrvVXPgFz72AHaJzxEr/Va1eyyrAw15JElZwcS1z9f
	 LvaJ0utENXSBekcqs8B6HZZKgXhckgps2N4WH0rRIzmSqqW4iwzloA+MI+AvqAauxqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TCLV1uHS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="RDDABjc/";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80ADC606A320
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 14:25:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80ADC606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TCLV1uHS;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RDDABjc/
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VD0V5q1233833
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 14:25:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=QzPcCIEIvOS
	8LjNhd6RsAaUljwaKhmmfkIvxR6vsypY=; b=TCLV1uHSy/imd+1/C16vSNMpJfk
	LzFfE1WaE4+WucBhcEftNkkb+zgRv4B2zg40DB3HGvbZtM9ZLvGWV/rRdIvj7/x6
	G+GqreQIuX45rqD1iLvNr2A4dsBxx2ZLINY8V0HhN6FqsYf+nbCUPjxzv4GvRuu4
	w/7wwZ3BozekitBOB5rwViCl4zETMYqI9/X3VVZDrxYmT6/zoxCJ4ghhkw/QEdCG
	9Wn0A7sqTL/p2pWJzaQDwOp0E7n5+RxQCulzDkU3sdYC5upVkhk/OWnjJnK7zCln
	iwk7C08AQ+vt+VGw69mAbI3tRF62PmEKFTCE+7mvFPoGG0iNID2HbxdVtZQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn9m99386-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 14:25:14 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3692c5b061bso4575155eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 07:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793456714; x=1794061514; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QzPcCIEIvOS8LjNhd6RsAaUljwaKhmmfkIvxR6vsypY=;
        b=RDDABjc/1D+2GzwIu18xvQharvUFfBA3nFcSIVS74ZmQ7PJab1Zwe8hkl7sVZtDETX
         7b2ksqIVG49teeeWwuZUR4A+u+DuuxVPdiUTferf5jYLnVSe69nJ0rMG9V92oLa7FTDr
         6uZwysBJkUu5odwmEN4pUcoX7kMg5FsSp5tCqcMlIGNHK0rD0EkYBcF5slzTZk36r7O2
         qQEoTsYku9Qr/UPGnaxe3twpohEYB6Hk4G2P5A7EBY6tk2lklgeEVqkhgI8dAraiCLoA
         RxdnZJ9X06/SuJ93XC/XtvafBYZLZwpx0s5bMDw6UbIEQ+1+1vq0I4y2KoIHvPHg4eaw
         8SEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793456714; x=1794061514;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QzPcCIEIvOS8LjNhd6RsAaUljwaKhmmfkIvxR6vsypY=;
        b=ptG3/iz4xXkIwN7oxJIdpfAlC8GbN1oK5rDq9OISDAnr14plc/e3twFQ7c+QOo+hom
         zT3WIFKF6m+zR6DfbaBHuXxXL2UIumCgYo7g61hO76D2SFjNPtr1P48PboqLBZNi05sN
         R7DZaYI949QtzDglVYh1St/iLwRICD7TKNRcUvVkVDI+OO42jPfM2dHQwRv51UmvQI2i
         YBCKAwE3hHEYTPIskVW/wclCWzhZNMBnuJ6nugon3wUiyoUrvbuQNqvYyd+6g433CjcS
         SEfC4wdATBTJ68FNpbUVW3zrQRSdv4B78JAV1So9kDoKuq0NkrNJfTB50iOO5Ew2ynGf
         zLhA==
X-Forwarded-Encrypted: i=1; AKwUvBxbWr3wx10mVQ8fM/CKRn4JNsE0Zvy088lEqzAEXLGFZyW3+gmI1tntkjpNPcrdRll5+/LISPGjq/SBubo=@vger.kernel.org
X-Gm-Message-State: AFq9FYKqta20+4sKjY7+PxSGYzQ3yUWvvf2uiqDvQCLpVDYm324kkdk6
	rvqbSLDij3gsr3Zbgo/XeP/+yusn+mrdIDHwJ+Vjn+bzXKJC74tXHqeVo8XedvkmntxqSss10X2
	T+t+pS5xJvUxeqfDax5ldWxcJM8ot67FxqD84tkdwjeAVhOFthWvQfXaEDv92vf+4M9Q=
X-Gm-Gg: AYBFou3r+6nDCghbEO/MJw0syPVoIwRDsncvi1KJXmcBfyNEen+5WJs07G0vt+vCbSx
	u/praI99F8G5tZY+Nt9RTawsNKnkVAg8Gq9+02b94Zs+UG8+AVKo77T/PGCTvGhlGB/pNEWuQrX
	71V5EtuhNLzG5i7MWruA3DFcS+pgsJpiEdWt162MfRap168ub3ZW6y0RDZwI0yZ8QsM4l3EYxFi
	gEyIotvKodRuLSh0WoGQgkrOwsWZ9i5nzDSPbtwukybFPCx/f/U2nx5QRPt3wHv2QX+DlLki002
	rT63nGb9FHmyBNFrxOYR/xlTvoFZGG9DjCr24JX70lLK7muk9KJDJqhDv2HdMSD5TBeXpt9mI1g
	9Dzfea7H/Rs+LcdhCumLtkorOpwyAqVwr19BlxYPcjTw2vmr4EtdYzHDQaJWh2h9rExrmgjrPkD
	vGSnFtM7sNH0dwc7FWdLE/qiiQ5VFHHfxP
X-Received: by 2002:a05:7300:cf91:b0:369:fd32:79fe with SMTP id 5a478bee46e88-36a4236f5bemr7527938eec.17.1793456714013;
        Sat, 31 Oct 2026 07:25:14 -0700 (PDT)
X-Received: by 2002:a05:7300:cf91:b0:369:fd32:79fe with SMTP id 5a478bee46e88-36a4236f5bemr7527896eec.17.1793456713253;
        Sat, 31 Oct 2026 07:25:13 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42935b4asm24968586eec.16.2026.10.31.07.25.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 07:25:12 -0700 (PDT)
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH RFC v4 4/7] arm64: dts: qcom: nord-ride-embedded: Add WCN7850 WLAN support
Date: Sat, 31 Oct 2026 22:24:30 +0800
Message-ID: <20261031142433.1212809-5-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261031142433.1212809-1-shengchao.guo@oss.qualcomm.com>
References: <20261031142433.1212809-1-shengchao.guo@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: jiqWzU1zS6y6XfouaNVjSNNdFO8sRJlP
X-Proofpoint-GUID: jiqWzU1zS6y6XfouaNVjSNNdFO8sRJlP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA1NyBTYWx0ZWRfX6oRJYqEZ2M3c
 VaKFiF4KqNwGfpH3H8UkR+2HbC79An19P8T0+BNMRtf9QMHGI2eDNXidicov+mE0YueTDaRpo7q
 vN5s3tpNhinA82wdeP0kJrcxgxVGYqqKqF98CBF5CQNetU5AE3RB/tCbcRhCEBpMp3GD34FwgU3
 amCte5k+zj3GWu/urPgPqvaDSCkMHuBLGAqmBeWK32WXGcJ0LZk8SveN6xs6lTV25Jsklh2ZSvz
 um3m1nXZfGKBnuE2DGS58tEr1JQEb31vrBzo4NN9YMhEyvvDuRKx1URC3sOXAfnD3lSH+rLh4Ef
 JbqMJQ/Pk0NKuD6TkyLyskuV778yrXXml+NdK6SqjbXInRhGBfzQL7TfzxAOYfVpDMi7C8NuCdw
 wP3MWdveANJ+mTI5Sq33l6RodIc03FFsZpGZ8YIqXz/21JhhZnGQHOMc7DBGiGoh2dC88RB9As/
 C5wP6pMRvQO6s76XE9g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA1NyBTYWx0ZWRfX0B77jqfkvyxA
 z9URKnG2jaceYK9ErNclxel9jRTRBe/bazrQllavLDJ5KN7yu/rx98ruLLQzROpGzPhmXnGbYBV
 if4BPLWZ1Gwou1xsiOaYd/TJgEiKl1s=
X-Authority-Analysis: v=2.4 cv=cfVHPXDM c=1 sm=1 tr=0 ts=6ae5fa4a cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=fkhy3qLzDainn0cAaKQA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310057

From: "Yu Zhang(Yuriy)" <yu.zhang@oss.qualcomm.com>

The Nord Ride Embedded board carries a QCA6797AQ (WCN7850) LGA module on
a connectivity adapter card hanging off PCIe2.  Two PMIC GPIOs gate the
module supplies: PWR_CORE (pmau0102_e GPIO6) enables the DBU_CORE_VL,
DBU_CORE_VM and DBU_CORE_VH regulators feeding VDD_CORE_VL/VM/VH, and
PWR_CTRL1 (pmau0102_e GPIO8) enables DBU4, which produces the 3.3 V rail.
PWR_CTRL2 drives DBU3, which is not populated, so it is left alone.

Describe those rails, the WCN7850 PMU that derives the chip supplies from
them, and the PCIe endpoint node consuming the PMU outputs.

Signed-off-by: Yu Zhang (Yuriy) <yu.zhang@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 .../boot/dts/qcom/nord-ride-embedded.dts      | 111 ++++++++++++++++++
 1 file changed, 111 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
index cf760ec41727..a9adbbd75878 100644
--- a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
+++ b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
@@ -53,6 +53,102 @@ bi_tcxo_ao_div2: bi-tcxo-ao-div2-clk {
 			clock-div = <2>;
 		};
 	};
+
+	vreg_wcn_3p3: regulator-wcn-3p3 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_wcn_3p3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&pmau0102_e_gpios 8 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	vreg_wcn_1p9: regulator-wcn-1p9 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_wcn_1p9";
+		regulator-min-microvolt = <1900000>;
+		regulator-max-microvolt = <1900000>;
+		gpio = <&pmau0102_e_gpios 7 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	vreg_wcn_core_vl_0p95: regulator-wcn-core-vl-0p95 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_wcn_core_vl_0p95";
+		regulator-min-microvolt = <950000>;
+		regulator-max-microvolt = <950000>;
+		gpio = <&pmau0102_e_gpios 6 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	vreg_wcn_core_vm_1p35: regulator-wcn-core-vm-1p35 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_wcn_core_vm_1p35";
+		regulator-min-microvolt = <1350000>;
+		regulator-max-microvolt = <1350000>;
+		gpio = <&pmau0102_e_gpios 6 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	vreg_wcn_core_vh_1p95: regulator-wcn-core-vh-1p95 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_wcn_core_vh_1p95";
+		regulator-min-microvolt = <1950000>;
+		regulator-max-microvolt = <1950000>;
+		gpio = <&pmau0102_e_gpios 6 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	wcn7850-pmu {
+		compatible = "qcom,wcn7850-pmu";
+
+		wlan-enable-gpios = <&pmau0102_e_gpios 10 GPIO_ACTIVE_HIGH>;
+
+		vdd-supply = <&vreg_wcn_3p3>;
+		vddio-supply = <&vreg_s3a_1p8>;
+		vddaon-supply = <&vreg_wcn_core_vl_0p95>;
+		vdddig-supply = <&vreg_wcn_1p9>;
+		vddrfa1p2-supply = <&vreg_wcn_core_vm_1p35>;
+		vddrfa1p8-supply = <&vreg_wcn_core_vh_1p95>;
+
+		regulators {
+			vreg_pmu_rfa_cmn: ldo0 {
+				regulator-name = "vreg_pmu_rfa_cmn";
+			};
+
+			vreg_pmu_aon_0p59: ldo1 {
+				regulator-name = "vreg_pmu_aon_0p59";
+			};
+
+			vreg_pmu_wlcx_0p8: ldo2 {
+				regulator-name = "vreg_pmu_wlcx_0p8";
+			};
+
+			vreg_pmu_wlmx_0p85: ldo3 {
+				regulator-name = "vreg_pmu_wlmx_0p85";
+			};
+
+			vreg_pmu_rfa_0p8: ldo5 {
+				regulator-name = "vreg_pmu_rfa_0p8";
+			};
+
+			vreg_pmu_rfa_1p2: ldo6 {
+				regulator-name = "vreg_pmu_rfa_1p2";
+			};
+
+			vreg_pmu_rfa_1p8: ldo7 {
+				regulator-name = "vreg_pmu_rfa_1p8";
+			};
+
+			vreg_pmu_pcie_0p9: ldo8 {
+				regulator-name = "vreg_pmu_pcie_0p9";
+			};
+
+			vreg_pmu_pcie_1p8: ldo9 {
+				regulator-name = "vreg_pmu_pcie_1p8";
+			};
+		};
+	};
 };
 
 &apps_rsc {
@@ -404,6 +500,21 @@ &pcie2 {
 &pcie2_port0 {
 	reset-gpios = <&tlmm 8 GPIO_ACTIVE_LOW>;
 	wake-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
+
+	wifi@0 {
+		compatible = "pci17cb,1107";
+		reg = <0x10000 0x0 0x0 0x0 0x0>;
+
+		vddaon-supply = <&vreg_pmu_aon_0p59>;
+		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
+		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
+		vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
+		vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
+	};
 };
 
 &pcie3 {
-- 
2.43.0

