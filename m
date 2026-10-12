Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81C20442388
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 07:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791789808; cv=none; b=F5Pq/f22g2D4Rww+XSVImeCqR/4oYS7SOW3eF4geqvQTaiz3EW/G1UmM/Zdz9XQro7A9QWTYXVcieobX/2u+fsj98yfGxSJh99XFYYvtFor8UwV1xHDSd4RNY1dH9/QLNTXGxS6OR9y2DMUZL47hsFLVAuNZyVrUHDxIUAUOsLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791789808; c=relaxed/simple;
	bh=89XqZmmeHIBQ6O48rlUdLOKDfG0n8CNGRqUs41V+46g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k+65l7xkGmiruqxeVAdvJkzJokPf5sXy6Ze/t2DfFdrutmf6hN7D1EmPq7X6MItaVLwVC3XWYB/IErJC/spUkZ+gZgJh0Cvev7mjXP4rj/abnn+/e9u2JrnoJOA7jMHMwowH2yPoSaYWRhyoLQzR5/PDRvY7mj5LwIxBvUsdeiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kd4kK3SO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UrENKXko; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kd4kK3SO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UrENKXko"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C55iLE1856946
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 07:23:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P4swQe+P3A3RtUSpStZKB+dYDI4Dcc8inETweH2GV0A=; b=kd4kK3SOMLygiOGw
	cLG51Ovg93NsHHb0i1bAyOTcwvv/hBfMKc0Y+UKi1OtQKZxO7+DEV+AGMMR9zOXu
	7mDwo4hsZoiHETPoZPgF/DLBsk5CNNw2GOr/9tBgMaA+jEI6Q32+qDtHHLdwvmxq
	DSrhcMDhAKTh14MC5rKZ1afitjR3sUNn67chltbiFw7gRVtClSX6FEzw1qoZ8YBr
	qs6QZDr7+2fkMnyqf3HkHLae8QYy7RRaD6Qxl77VXAZ8rVjyI+PnF1kIFkosonSx
	DNmC0eyO7+Mp1uPZfLQFn51AU+7De45z29t3tIMRzPpswLBQ4ipKdvpS3Naqyu80
	tGOS8w==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7cxxnf8c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 07:23:26 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-359b81ad4e8so1551529eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 00:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791789805; x=1792394605; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P4swQe+P3A3RtUSpStZKB+dYDI4Dcc8inETweH2GV0A=;
        b=UrENKXko8OYBqQ80xdsfkLZw7vefQJ5ewAN5CHWgg61Px9eElY6zmU/fOT8Vc2zLMS
         fp9untovb46zgVStPhI8wZ5eFuEB3rq36gxpO88jhgW3JKuGaDwqjTp5mAO6UxfN+/Zy
         5bjIaBJcqeF8GIQ6T3Y4QxqNSC9rG3fOoEEDy4MRiUI8AP3goeRyL6pAJjowttBZ8f2D
         IOJ4Nqbc/CWbxKWzHcZ5PMMSAqg3tmn+nOzktvchdwBoYYlW0TWlEEqIoF18VRqZ8Gv1
         z+QMpgWA2EoQVDZWzgcfzWfaW6sJqA1ypJ8dVLaWHUA6wR/VpOMBEzrC5lOMcRk6ddUN
         KNPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791789805; x=1792394605;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P4swQe+P3A3RtUSpStZKB+dYDI4Dcc8inETweH2GV0A=;
        b=J+7+Xc3oRw2Yx12dbyxVbA2naLIMy/7p4Q7LnEMWGrzgHm6dFaCdGaSmjTq0BIzySq
         yfrQ9A9mgKFH2SK/hfVEkZHAXQGCeJIjOEHnt7YYDUoxa11O7dIeNgIvhR+cssrdbyhR
         g3lU5CAKff4e4TSwNs3d8Fwj/VfmQyz3gZprdEt77/uJm3pBl1529SztgGatSkT/S3yz
         z7uBgE/G14GyruBi6lNLzPnxOSzAuOrQNfq+BvMl1erwr7oUMIx96IBGGFA5pKIiwCzL
         B6vxX6k0DijJomWDZVCcCB6WhM4vg5kXCBVNOMBHOpaj/QLg4sCzpQDT9A9MshRolBtZ
         uD5A==
X-Forwarded-Encrypted: i=1; AKwUvByZIp/BDFcgTRk/1gbE3K/sJ7xtublBxp31d9dc/+H3SoCCyuc8IDj1VOcS2azIbPJy0iXAPQ4nSIF2Ek8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIIgk7lkYZDWQ8E/bxIMxZZ1LHME+aWBTqoX68HlKtFYfVlKVNA
	MDbyRjNnNyoxVV7CJi2/M6xn7EXetscEfz9Bn8K3MFz3/fJvDYscvjSYsCMgb/Y3Zg70D+mk2a+
	YUHW+/sd4cxoYsdhfIfAnmqTPB13wGB+dm97deHnLxxCNDPMGhHj16DwuMS2LRzekMaJmUwTASt
	w=
X-Gm-Gg: AYBFou0oN4COA20XdctKz3v/czD7DoIjthYpkuvUSLTpiqEgHGSFdPWAkZowRmwLpxz
	lcYJjqi4dzfYGevOaWBtJ49NVscY+u4ntjBoDlhTMcf4O90ItP4cZwDTSSMKww8Ymbzyt6/hbmD
	cA824/dAcXVPomafi2YK4Z915zGPJh6EsK7f1gWVfmRWW643rWly5RazxTzSH+HLCBXo64pbaIe
	4zeRXF+DRQ23lnc0buZR6xAdjP3aZK1AITTh9ysPnkBHJvRjxclQc4a2ctWZxkI06n+XQmwO+ME
	/5/g0nxVmuGJysUlbO8d4OHUADz4NbtnUEvfnkMuDttz7FwQK2Fx+2jBu7c2I8fvs/ff5hJDMD9
	/KW1LA2RcXqBJvupZNHbf8bQuf6qAedgkYf1eku+AbhQse+whHhrlOacIi6GMLB5q9LocA3gD+F
	TiSJQ8PzMEqBVavcFT+csCdewrmMJq
X-Received: by 2002:a05:7022:1588:b0:14d:ef19:246f with SMTP id a92af1059eb24-16e9ed23af9mr7690134c88.45.1791789805344;
        Mon, 12 Oct 2026 00:23:25 -0700 (PDT)
X-Received: by 2002:a05:7022:1588:b0:14d:ef19:246f with SMTP id a92af1059eb24-16e9ed23af9mr7690103c88.45.1791789804761;
        Mon, 12 Oct 2026 00:23:24 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a1becf08sm29748733c88.5.2026.10.12.00.23.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 00:23:24 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 12:53:04 +0530
Subject: [PATCH v7 04/11] arm64: dts: qcom: ipq5210: Add support for WPS
 button
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-08-dts-v7-4-77bd3d68d850@oss.qualcomm.com>
References: <20261012-08-dts-v7-0-77bd3d68d850@oss.qualcomm.com>
In-Reply-To: <20261012-08-dts-v7-0-77bd3d68d850@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: bsL0aTZUHhADqJDyXwGkO4RuvuCpKyOp
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAyOSBTYWx0ZWRfX3dzblD5zlp+7
 6D9IpVAh6kkFovRyel59Nc+p4wDPlX8Hsa64juAmKtoNcdAFpdBnMKxen+D5GlgR4Gm+0OGxJrH
 SsIYQx3Yvj2J8a7VuXw3cg+zlTg3gYI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAyOSBTYWx0ZWRfX+5+REq/nSQeD
 xKIP/b8VaEGKvotWBoMgv4z65s6ANle3L3m+Rk7gx91H0AkeGvchdbog8wsn8jV5ijWt+8CFoSZ
 3s/she94fB0YCQuN8WAwJoY9Z8qXQGWl4pWUZ0JtSGcduDF6VS+TcqrKi0+gEJ8PFIiCSdoa11w
 0o05p2I7Nbe5YE56Pk2j01RqDEjof+XW+iTjFava0ie1Dm0gIHWemYsj8GNHMg0D4WI0tJqi55p
 n+SpaBU8xKyIAWyKNC6/9ekPfSOzS7hPB/fcTa+lI9QNojOfa/E2fndFjmxmkBYBVh08DKT0gCU
 35QWeZmv+vzqGG8af20plk1ai0GtlWGESJuM/cy1X1N6DvpUWfaQAvpUn3rP45VAqWBMB3GIr0t
 /E8DPdP0Hl9TFejgKStI1C95KpcjMGeFHDtmO8s77TO00iBZFgwMWYIk/wJnlJXz6kIuqQOABVc
 DgLjAExOmVmi0rl9gdQ==
X-Authority-Analysis: v=2.4 cv=AsJ7T+9P c=1 sm=1 tr=0 ts=6acc8aee cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=nVy4eOtUigsjo0hPaBgA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: bsL0aTZUHhADqJDyXwGkO4RuvuCpKyOp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_02,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120029

Add GPIO related nodes to enable WPS (Wi-Fi Protected Setup) in IPQ5210
based RDPs.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi b/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
index 67f62c1acddb..7f90a2632b07 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
@@ -6,6 +6,7 @@
 /dts-v1/;
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
 #include "ipq5210.dtsi"
 
 / {
@@ -17,6 +18,19 @@ chosen {
 		stdout-path = "serial0";
 	};
 
+	gpio-keys {
+		compatible = "gpio-keys";
+		pinctrl-0 = <&gpio_keys_default>;
+		pinctrl-names = "default";
+
+		button-wps {
+			label = "wps";
+			linux,code = <KEY_WPS_BUTTON>;
+			gpios = <&tlmm 25 GPIO_ACTIVE_LOW>;
+			debounce-interval = <60>;
+		};
+	};
+
 	vreg_misc_3p3: regulator-usb-3p3 {
 		compatible = "regulator-fixed";
 		regulator-min-microvolt = <3300000>;
@@ -125,6 +139,13 @@ &ssphy_0 {
 };
 
 &tlmm {
+	gpio_keys_default: gpio-keys-default-state {
+		pins = "gpio25";
+		function = "gpio";
+		drive-strength = <6>;
+		bias-pull-up;
+	};
+
 	pcie1_default_state: pcie1-default-state {
 		pins = "gpio29";
 		function = "gpio";

-- 
2.34.1

