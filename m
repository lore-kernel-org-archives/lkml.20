Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794383547;
	b=cj488uhBgNwLUcdV0CtM/AvE181T8tiAlJOZH1Mb68aHyQwnhn2Bi6ZeeZMxfucKYh/Y
	 Zf0Il+8uhV+xZiXa8WuqPUJK013v6vlcpZJje5+pYIvbiGYQcWtxZ6fpogqI1xIOxm34n
	 XwoClwIPI0B6U8gC109QnLNzEzYNpM8UnCAIZWTCsRoHvJ01Rfb+ON1DIhP9ZhPDF4bBG
	 xMvchVaaE2XN5eSg0WS8xq7XJjsd2ixxCdKzXdYxGa+tuWMZJvZlAjtnyvs/PnFt4o0PV
	 aHZhe6yQtuSH+Gf0VvcbxBGB3Fh7nL3RksPGUvh3PE6RNIdBi/gZ1N5qiEmYW2Tay8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794383547;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=NiUenwkxDfPWvzPSwUjlH4d+jmHPRNZ+aPFjbhKqadQ=;
	b=yGL40HvFQpZwoPT/52LUpSZghgJPnVOI1HbQFGF6mzDkZvKeCqvCtHYyno0RnGsmPgQ3
	 QdvMXjo80zIqLf31RqCnooSf8kKp878XVDBqkNzd5Gb8UsZGqjnCSMT7W+qsLbkeGxoA+
	 NHnRL85EqOgT23I3RxYiTohpYYS/If5Pgz9hMUm4cd/G9EhzyA0vpZP2DMVeDgp3b5ipY
	 Lfyfl042/eNAZYWDZjI7dbrvfipWGtxUmTbYNLa6TVTmYHe8Yd001X5ahi0kVehDGJE9C
	 Nae+PeszYGBE5iBiR7yiZCA61s7ClXAR5nLgU1o94ANOTkn9+Lkav34IJotb2E3QnZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O0lOIfoB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="A6go7/dj";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F4B660A2600
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 07:52:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F4B660A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O0lOIfoB;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A6go7/dj
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB5KgoC300698
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 07:52:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=NiUenwkxDfP
	WvzPSwUjlH4d+jmHPRNZ+aPFjbhKqadQ=; b=O0lOIfoBMLVHN11pfZZlIUhedkF
	y3F8rS0txSdOodupl77BBUsJSDPfcm+ZiT+kwTFn6Xk0SzV/9g9ZF/s21IpEw8Ud
	B5jMuvJbRiDva1jD9xOpK6cJTNqxBERxIWiWjGuV98W3w2QR8K8SXJDaVNflaEU+
	YZU8ih+eUkNQHSPQ25bbLAL4Z4QDN3WDd4grGe0P8H0zipaoYPOugXpgcZP/jmwB
	L4scgibmyFetg1WUs3q3UQnZF7Q41AphInwM5QTLtoGHaXxDw7IXD5i0yPeFfnTi
	x9eAKjjODMz5XFcuCJ2W+ZVFe4twlqjOjqHsv6c6R20G9l89WxvV8iZYArQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv7c5k5cb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 07:52:25 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-375f0fd31f4so1714436eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 23:52:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794383545; x=1794988345; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NiUenwkxDfPWvzPSwUjlH4d+jmHPRNZ+aPFjbhKqadQ=;
        b=A6go7/dj8VTd3c6YY+RxF7DM+PjShjloyMIyrAv63LgeI6Ut3i4sQm+n2fe5od+gsF
         lKWHajl9yuLUBlRzqFWlkzDlEiSdSsIyWo9I8pgLWSv8e3csiLcSZtEB6Xg2usW3yTpm
         msjQZo3/MR7skNPb45mOd4ly9SibAYYwfnqkMthEenGevpHmYhC23Q+NdfM+rYK3E/lc
         wrl+aynC2S3dCZ47XradP+Lwvq1ZDKLdVztlgERhA0PNSnvPnI3/iZbNDEWEUPPTsxoD
         l6o93b7lkxUzLNX/LZSQgrubeKu61MSAzVvjcLM/13kXiRsNAzBR00mcVbdMZ5+2UH+I
         eSgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794383545; x=1794988345;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NiUenwkxDfPWvzPSwUjlH4d+jmHPRNZ+aPFjbhKqadQ=;
        b=EG/q5w+cou8ECpLX7Rmpmw38+uP7/ki2IAyb5qH0vLfLQbeQJbXgS5Eb2jG6g71bDJ
         ia5UPf6y5f6NiYxnmxYmqB7xKMjI/IXdAC54NLy+tyWU+I6Rw6kXrHOB6msOJZbiGwU7
         YE7rKvAINcCbz2LwMGp9LYUlhJAH44ki1hoksgvk31VCXBm+gv92DyV0SR1Cb9ajQj7b
         UcgXMWV14KChgXLwikaOZbr+S26O7xSH5fp+om4gew9CA9wp7k1sC0hVN4wdEX/gLXgE
         7iA6bhz9qdPayqTpjc6YaV6G87b1OZqimR0QTWdcoqwOKAUE410YhVj8TLrVlmkLPHxs
         5g7Q==
X-Forwarded-Encrypted: i=1; AL+hErFUxcnUjHTp6SltZtZTPEPPEUx4Wf2qvc2ZdVVYThdqhcyd1sogr/ZS0p9YSrASNfkpGMhFuiZJpoVDbSU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+vZUnHeCxpUVs4OG9kjIRjz/rMf02QkC95SHAG4DX3Vot2ufv4
	4GFB1P57rmXYOB3ShSIxnEnsXjrQHxgd1/W6L6wMgfnV/n1cDyzNJ3vIcAsdAoHlOOu+FkIqjEg
	97p7q+jU6iRkCgpYvGYEQIbLujuPUi0k1n+c5BlSxOl3fAqp4QdZuoUfg3yS4Yta2Nr9LYSv3bm
	g=
X-Gm-Gg: AYBFou1GsvcXGGaGaQhE3leAaZvDnXrilvuTqLDtLCIUxDEON1syslu6RTg1ggMj8SW
	aHX48fHjlefqbY+oBOQVV3y+mUYaweDHdfNuICeoMV1fto3d3sbbV1uvy6rinwdNMB1ypb04DOt
	SL2njbSIFO0isA9BbzMEVWC05YYkjmXj6ZObFvSXAwl80yZa9vKIuOr+B8fvjei5U7DX3aePLSh
	ytqdjdNC3Zj+Y5e9ukWScgOFfTR/C4KYpwFQT94hjhqa9QbXO6qZMW+lwQgHkswEmS9RFs/eNiv
	RSTw+tGqskwUIhdttu8hl054ndLAZoOL9MrAj3Ju/TBIt13+Hjr2EhojqWmau8kWrWHLqL8rhdg
	IPa01yO1krWvTIxDDT9kvPixpW8XYKaYo6zoH8/hyD2k3UR84aaoM7jP/Xg3+OSwfltH6chbcYR
	EpehTOfnJ8gA7DEdvDZVwZ5XOUq+fKyA4I
X-Received: by 2002:a05:693c:2291:b0:36c:9af3:22eb with SMTP id 5a478bee46e88-37686e2ef3cmr2164430eec.34.1794383544379;
        Tue, 10 Nov 2026 23:52:24 -0800 (PST)
X-Received: by 2002:a05:693c:2291:b0:36c:9af3:22eb with SMTP id 5a478bee46e88-37686e2ef3cmr2164398eec.34.1794383543873;
        Tue, 10 Nov 2026 23:52:23 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-377531d3287sm187032eec.0.2026.11.10.23.52.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 23:52:23 -0800 (PST)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Yu Zhang <yu.zhang@oss.qualcomm.com>,
        Shuai Zhang <shuai.zhang@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v5 6/7] arm64: dts: qcom: nord-rrd: Add WCN7850 WLAN support
Date: Wed, 11 Nov 2026 15:51:40 +0800
Message-ID: <20261111075141.3710366-7-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111075141.3710366-1-shengchao.guo@oss.qualcomm.com>
References: <20261111075141.3710366-1-shengchao.guo@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAzMSBTYWx0ZWRfX94UkAx8Dmwo4
 8kxThl4/Mm4lV9H40OJtAlrmfd16KyBGjAAQzvmtj4eafguIq6AO91qR6F3J+U8VWFTxxAouwiI
 wwndi2WjPWKSdIaWvKRVjKgjqaBGRzc4psqcDR9d5KI4+jCDNqOVKxbZVRGfooJ5Lzi5oZEBZvI
 KAfaS/XlugEjy47hKaQ2Hq+3T+oatZmQ8uU83Ctp3XdcsCbF01dWUbMNriu96UpeE4cAwBsckQ8
 HUUdEsWcMVeqfUTJ6YSmsGwtyoa8ORbryI0DjcaYLWjUjfGYUPaxI3Qp51kfJrsBtxPO8Dfev9t
 dqf6HqR4fqJNhW9RC39pWd9ABVDPoAJj2hzeo70aHi7oiK+PPY44/PHtQaBgi9Vjsq9U3IuQpZU
 rPvMrhWcOLPmD0hN9tku2+e+MB1xxmRPuRFKDpGNhKGPKzAqM7IbxbnUjaM5bwv/R+sDMs2v9gs
 dxVqK+xYY2VhnlhqGiQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAzMSBTYWx0ZWRfX+ojWdXiSZqDq
 32OkmME/2fVGPlneCO46nGAwB7gd4XYSt6JBh8k8dpISfIVxw1bpcqMosXAl/pg0vh9+FYgNMsA
 6zlDw69aF+/g10AVyVEpBvGJ8qlZVQo=
X-Proofpoint-ORIG-GUID: ZI6-9B4c2foJtabQQDpmx-z_wk7Bt-sV
X-Authority-Analysis: v=2.4 cv=eq9KXYpX c=1 sm=1 tr=0 ts=6af41eb9 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=fkhy3qLzDainn0cAaKQA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: ZI6-9B4c2foJtabQQDpmx-z_wk7Bt-sV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 clxscore=1015
 malwarescore=0 spamscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110031

From: "Yu Zhang(Yuriy)" <yu.zhang@oss.qualcomm.com>

The Nord RRD carries a QCA6797AQ (WCN7850) LGA module on a
connectivity adapter card hanging off PCIe2.  Three PMIC GPIOs gate the
module supplies: PWR_CORE (pmau0102_e GPIO6) enables the DBU_CORE_VL,
DBU_CORE_VM and DBU_CORE_VH regulators feeding VDD_CORE_VL/VM/VH,
PWR_CTRL1 (pmau0102_e GPIO8) enables DBU4, which produces the 3.3 V rail,
and PWR_CTRL2 (pmau0102_e GPIO7) enables the 1.9 V rail.

Describe those rails, the WCN7850 PMU that derives the chip supplies from
them, and the PCIe endpoint node consuming the PMU outputs.

Signed-off-by: Yu Zhang (Yuriy) <yu.zhang@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-rrd.dts | 111 ++++++++++++++++++++++++++
 1 file changed, 111 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-rrd.dts b/arch/arm64/boot/dts/qcom/nord-rrd.dts
index 98dab85de64d..b23c1a81a376 100644
--- a/arch/arm64/boot/dts/qcom/nord-rrd.dts
+++ b/arch/arm64/boot/dts/qcom/nord-rrd.dts
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
@@ -415,6 +511,21 @@ &pcie2 {
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

