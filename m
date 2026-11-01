Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793520336;
	b=OO9DZRT5nPg2iE4XOa2WzCMWBqNRCWwRanGGsaLKxOiNOcwwlvduLFG8lWwYLTe+07/E
	 Eutau7jYK/jfioq7ereGk0ZjToUnBgNmFyj+mgUFJC054xg6sWRLTnfkbFwVsbys2hI7J
	 BNGo4lpL7quVDCoRd+EOxpvxd00S/Ae30TLA9G9k1ymbq/aiVyQyk6BYs+Msn22npu5dQ
	 06BHqqpIrI014BoUZCwer6jv3XfvnK3gnL2EnDBm6RbeiJAbA7ajhqsGYrnZ7VZSEsCvx
	 Sxmknd3Kq/mZXpNpB6dea+V4b+Ug5mVWWEfe4ynmQmbg2dKcwjyaD09TaFJ0d3as1UA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793520336;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=XQNFNmZ+Sm0PWBYn/qMA9nqWLoBHyQWZyNaw2eL41Zs=;
	b=UhTKXeYqPKKpdzfEoKgkdwebSH1JRCIjmyASrySx17UoO1R4kEBnoPv78Pwke9LB3pXM
	 oReMF4IvpNctbCz54ycWJyIA5Ehl5UOjFiS1My3E/ZhBggxsApcK1DA0xiwjtSS4A4BcW
	 ILHOhmfv20VdM17B9uTPfD/Y9k9nmrwnn/d88qAubOJBnNzR8/lPre/IB2OEt8O3bJwUj
	 nEcExAKhFrneytf1d4NRtoMRlpKt3mW7tzmcVXx9hlHyNz4mtBTV7MoBGGv2aSnCFnDdZ
	 ECrZk5fHqd0Wex8fPzIVTLPmt+PxX/t64tu2NSwiGT6GLekCYIihFs3g3y6pCj8afEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=biiSaxva;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Nmslwy3Y;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F39CD606A337
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 08:05:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F39CD606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=biiSaxva;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Nmslwy3Y
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A15Lmx6581893
	for <linux-kernel@vger.kernel.org>; Sun, 1 Nov 2026 08:05:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=XQNFNmZ+Sm0
	PWBYn/qMA9nqWLoBHyQWZyNaw2eL41Zs=; b=biiSaxvavAKV1ag4usm5GMUohAY
	orXaHCxF9gRT2SZLYdTv7zqlq17fLMGcBLQc6NtHSr0oSaVRwDKhcalMBwA0jewA
	/FhYIrsynJJBtoMqpBRhtguoIk0cFIoBhz71dbOKfpc9K+uDcDsloaP0biY+rFSI
	LgOeVVK13BerxldNcdTcyg74jMrSx5m7R1CQSXgskyOuSxeyJRSPRJF0CYPD25dE
	Pqs9BX/SpkIUr/Y7jIQlyu6ipSayE1nlCCE/gJMRsWS7fc74stadQtTVzHJwlYo3
	ARY8r+IrREKLWYEPx+qbB9PBWjUmPtzl5iTabF5NONjX27Jp6yo5ZgKOZ+g==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn7wxk02s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 08:05:06 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-341eff9e381so4983563eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 01:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793520305; x=1794125105; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XQNFNmZ+Sm0PWBYn/qMA9nqWLoBHyQWZyNaw2eL41Zs=;
        b=Nmslwy3Y/FGjLN52EjOwZSWjlppXSHgFyZvO/oy3JVkzoELlvToqCiiWfyhGQm0TCA
         BgpTgeNGKN+ypVOs6KGZhPHEoG2DEnqz02LH3qrEcyDMhu0ZuqbrZVlXU9DN6eerhp4/
         Uy/whoolLGR3HS11CJl+BAQQrBZ9/oANFFZqKr4w27Q0qwMolo3FlKRw5gw3T5wPapZw
         PcuRb0RLqNUpQZ7Zy5TPtxKUb94bCzPojPiHWClW3l9/dhP9jgTghqLfHVTXXdzoOte+
         VzYUa8SRNz+FRSZj5iALtap7RZYje0tR4q7rMIs2iJfsMv+co9EuBAdY/VXUOLou+dQg
         Sf2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793520305; x=1794125105;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XQNFNmZ+Sm0PWBYn/qMA9nqWLoBHyQWZyNaw2eL41Zs=;
        b=bIlZJ/FBn94ciXx8GCTFBcjJA+Q7fhLtMTeqSd9ufCD621/h09ST9QMYsJPPbV1s14
         zdZ95IThFddWXtx2UADlxsHgnZf/n6tGJVQD2QUrl9Ne3HcRjPXcaZOMvay74XofmSHV
         Ipjo8vu7g8axZ2YYrC+Z+8FbgiTOYpMs8uKfTrMFTYLZjR23+O8lbyAhWGXVSe+yrPw8
         0OpZMUyqsPMyTe6+o/QKUsJvuNP+iHq1gXljuMRPhWmInMAmfn+6cW8shm3nwGQLtAEv
         xJvPX5ruu5LWWSpFZ7QxCCGgGWZWjmSsAxwPjflzujwWIX6e35D6pSLH6V7Gs2ZRY7pg
         UFJQ==
X-Forwarded-Encrypted: i=1; AKwUvBxJ0jRDl/xHxGbW5HkBP9shu0SAyZdzaAPY97E5gcFMZ1amZ0/YIi+uqG4rblZgnmsArGZNfHWowan1j4c=@vger.kernel.org
X-Gm-Message-State: APuU4Z/LPUcpzQoi2qcjbt2EhJ2JN3YMol+rOk5UKeu4ti4HYon27U4l
	B9KzIWeSIQYpNj66gfJnzMHIZA15cdvxGJCiRv4qGqeMr4iTJXN5WA7YaXizcy4Qcw86PQZeZqA
	mF5wgf/a7VutmhuIY5cIaFizMqxwLtapXfi0nu+nVgilTxg8UWQTGamVe2L4etWS9rleKPPBRIB
	trnw==
X-Gm-Gg: AYBFou08LB7HRMDinjbcr6JRdtP1AMxSNIXa/EYjs1qUF73w9ORzetb22kh3YPMPF4G
	5Vv+BbT47bO5WBufeD1pAwPURrYuAQYghPSaN1jUJImDsl4ne/WYXcCQGvH5N2uNaJId7TK9Pr/
	wYEx9JEUtc72DmmBrzGr1OFjsiQSmjmTT6M9g09WiFtukJY6dSC3s0bbF/AtJ3suxAotcrxFsn5
	2BPpKCcdGRNyBo2CQVIE/53hEf+lKR1fiOn/KH5X80Ee92+FKsLBVrT/PtoxoYgxmHao2MW7M/8
	GdfWLEa3ATIvbYSbmBENIJ4fypCRKfGIH/VbtI668KC1vsscuK0fWMFj4fzNdmF89CS24oDKp1i
	IVofdqm3rw0AhhzYq4WImH2uuhE/XnBy2VO57qpyfXQUDPoA0VV4ZTjCN5b0JrIa74WdURmM+lT
	/RgXrDLFgbbt63P/i9uIrmCCYKnf5koHJQ
X-Received: by 2002:a05:7300:559e:b0:36a:1846:5c77 with SMTP id 5a478bee46e88-36a42204585mr10973106eec.3.1793520305193;
        Sun, 01 Nov 2026 01:05:05 -0700 (PDT)
X-Received: by 2002:a05:7300:559e:b0:36a:1846:5c77 with SMTP id 5a478bee46e88-36a42204585mr10973056eec.3.1793520304288;
        Sun, 01 Nov 2026 01:05:04 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a5fb97sm27341792eec.23.2026.11.01.01.05.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 01:05:04 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH RFC 3/3] arm64: dts: qcom: nord-rrd: Enable Ethernet
Date: Sun,  1 Nov 2026 16:04:13 +0800
Message-ID: <20261101080413.1428016-4-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261101080413.1428016-1-shengchao.guo@oss.qualcomm.com>
References: <20261101080413.1428016-1-shengchao.guo@oss.qualcomm.com>
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
X-Proofpoint-GUID: FswYiBKePo-Js2uKNCXGdQp-ddtz4KyM
X-Proofpoint-ORIG-GUID: FswYiBKePo-Js2uKNCXGdQp-ddtz4KyM
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAxMDAzMiBTYWx0ZWRfXzBur3nJHoQJ0
 LcdfrY7IDAW3O3hR29qQqHMEmjbEGgwrouFzJh1D1B/sbQZUZ66+Jq3kwk/GbD6GJG+/pjRps0w
 pHtVs8sqnfCb1i3V/CEg9OyeBZDle3k=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAxMDAzMiBTYWx0ZWRfX5FjSKUlvVXvf
 HtEh5WX64ZNK064uT7Su39Ia5YH9fuSVhZi2GUI69Ad92lWLZphUJqzBv827B5VlQQPQFjgUXh/
 9lChUEpq4CnucXjYrqqmqm1xeT3448jyfOkZb4gAPtkI4FFFhOfJiSgt9C5Iq7OP0/OyU15m9Xp
 3zSCLr8KrXBBWQ9s1MMzdgUuswAHLEzIhb5KtmjnkMcPVnGFyFWhtOOXUNfuiYDnY+4PQg/jz1U
 W+u7se+lG/UxWzztXZkiuq6RgI69rg9Pbg57JrDs6C32RqyRNSUmeWIxTPkB8yE56Z8iJc49+4d
 fgsqvkqZk2wcKN+ykvw0UTDq81X2+OHRKZWZJuWdpUWDt6WbJlSMFxEzsYkvkJ6AVrb0QP6c6br
 gy20bhSAUpatS9mxZu7EnIObwx17ijsM4xHf2AQD4FWvH//he1DiOg//U5BwFF0ux1ZOCWZPd2n
 p7/obCwopQRIsCbR1NA==
X-Authority-Analysis: v=2.4 cv=JLquIMKb c=1 sm=1 tr=0 ts=6ae6f2b2 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=gIG512RHl6OACX9OBTEA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-01_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611010032

From: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>

Enable both Ethernet ports on the Nord RRD board, each connected over
USXGMII to an Aquantia AQR113C PHY managed through the controller's MDIO
bus.

Co-developed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-rrd.dts | 88 +++++++++++++++++++++++++++
 1 file changed, 88 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-rrd.dts b/arch/arm64/boot/dts/qcom/nord-rrd.dts
index 47978df0af92..0f6259d91c42 100644
--- a/arch/arm64/boot/dts/qcom/nord-rrd.dts
+++ b/arch/arm64/boot/dts/qcom/nord-rrd.dts
@@ -366,6 +366,56 @@ vreg_l3l_1p8: ldo3 {
 	};
 };
 
+&ethernet0 {
+	pinctrl-0 = <&ethernet0_default>, <&ethernet0_phy_int>;
+	pinctrl-names = "default";
+
+	phy-mode = "usxgmii";
+	phy-handle = <&sgmii_phy0>;
+
+	status = "okay";
+
+	mdio {
+		compatible = "snps,dwmac-mdio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		sgmii_phy0: ethernet-phy@0 {
+			compatible = "ethernet-phy-id31c3.1c12";
+			reg = <0x0>;
+			interrupts-extended = <&tlmm 141 IRQ_TYPE_EDGE_FALLING>;
+			reset-gpios = <&pmau0102_e_gpios 5 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <11000>;
+			reset-deassert-us = <70000>;
+		};
+	};
+};
+
+&ethernet1 {
+	pinctrl-0 = <&ethernet1_default>, <&ethernet1_phy_int>;
+	pinctrl-names = "default";
+
+	phy-mode = "usxgmii";
+	phy-handle = <&sgmii_phy1>;
+
+	status = "okay";
+
+	mdio {
+		compatible = "snps,dwmac-mdio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		sgmii_phy1: ethernet-phy@8 {
+			compatible = "ethernet-phy-id31c3.1c12";
+			reg = <0x8>;
+			interrupts-extended = <&tlmm 55 IRQ_TYPE_EDGE_FALLING>;
+			reset-gpios = <&pmau0102_f_gpios 7 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <11000>;
+			reset-deassert-us = <70000>;
+		};
+	};
+};
+
 &i2c7 {
 	clock-frequency = <400000>;
 
@@ -430,10 +480,40 @@ &remoteproc_cdsp3 {
 	status = "okay";
 };
 
+&serdes0 {
+	vdda-0p9-supply = <&vreg_l1h_0p9>;
+	vdda-1p2-supply = <&vreg_l2h_1p2>;
+
+	status = "okay";
+};
+
+&serdes1 {
+	vdda-0p9-supply = <&vreg_l1h_0p9>;
+	vdda-1p2-supply = <&vreg_l2h_1p2>;
+
+	status = "okay";
+};
+
 &spi16 {
 	status = "okay";
 };
 
+&tlmm {
+	ethernet0_phy_int: ethernet0-phy-int-state {
+		pins = "gpio141";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	ethernet1_phy_int: ethernet1-phy-int-state {
+		pins = "gpio55";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+};
+
 &uart4 {
 	status = "okay";
 };
@@ -459,3 +539,11 @@ &ufs_mem_phy {
 
 	status = "okay";
 };
+
+&xpcs0 {
+	status = "okay";
+};
+
+&xpcs1 {
+	status = "okay";
+};
-- 
2.43.0

