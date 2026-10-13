Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97FA14EE854
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 11:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791891313; cv=none; b=UM1Js9WP9uNW973nSHeeStt8qZjpE7g4ixd76hBZnQVsAo3l3aN3GV7VBO1AjqCCWDy8dR1TIYPcPiSoNLICAxqqEZ8jjYXkLP6CNklnPtiOCfQtOTg3LH1rlIM3BX/iOKihNsffb1OCCgfRTOsekisNKIS2x+ax1pP4AvJknhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791891313; c=relaxed/simple;
	bh=ylnJrMOLzAanHE6fM1+z+CP/qSpGO18W+z3UXY84J8g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Xy5JPvcrsMmFJCD1vtO9TbWf7edUWicBiWQ+dCmGQMTOlbTyE1tmXMnbKXD9ZjE1I/0qnR2h5blJaQ/S5Z6mHT8fyuz3ytMUqdS/xPx8e2hM6cHcYPBg5drt/k0M3S0C8wvEHIoQ7ao4yFX23AI5lPLWYqT2+amM3z2Qw8gMjkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fIhoovfv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f9sRrpGq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fIhoovfv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f9sRrpGq"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D944hx483077
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 11:35:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UEkHxRK2BHBdRf/MK4mXSXwNwIM79MIn1ayCUJTnktU=; b=fIhoovfvxQbzs9N0
	yhBaw1QsSKxNBzb2G+yv3xUQWOx1rHV2LxwfuIC9GkikZzMSIduibOzB0dppmjso
	ogoSxoYKY+S5si0twQzyumI1MkxOTKk7r9YYBnZrBJACVi5zS7LVoBruoctlmLBf
	sG+akA9M5gskbkxwLEB9ZAoF11IjDvC8P/o7SdpTEEOHSrrE1RYP7SUOXlsigVrq
	XtO09q/AMhtCpGgNszCvdlAMW2v0SAvFtjsL1H4nxn+WRZIk7Wy7wq6/EDMkdPAc
	mBMpNN6hkJm+py+W2prBRBrmqT5DH15Nj4dQQCE0fAlWkdokk/0nGJCAxMQeevBh
	37gzJA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9hpg8mhv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 11:35:08 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-53380b67cfdso74550941cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 04:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791891308; x=1792496108; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UEkHxRK2BHBdRf/MK4mXSXwNwIM79MIn1ayCUJTnktU=;
        b=f9sRrpGqNmHwckzPS194TH+ITruDGd5RlH76/CeDLJlAGIOwdeSjUUIRzqqlKCFjP9
         mYj6MmraiHIfs6nW8gYZUTn6pz2BtMzDDRpIr9Q8lrsxdesD7JbBuoxn6TQLAmmvA21g
         SCgn3hCMHLqsiXUQ7UfexMvjao6baJKnQnJ2gFD65taqV/iSoEWOGTxtNpAXAYH24Usf
         PL362B0jHJycsk2iTN1qJlziY1ENovkLduagcAcNHtX/RRTSLHvRjb9GgIBYKElpgovh
         0ETThQW1Kq8vTmw94kCBJntAlfgquzsFieuPdC2BMuJhLu5P74MOdIBXi2wByqOUrfvn
         e8eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791891308; x=1792496108;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UEkHxRK2BHBdRf/MK4mXSXwNwIM79MIn1ayCUJTnktU=;
        b=wVpTS8dKbhPTxy8nyGVPX4mr25j3529iuUl36QiqMyp+J9jQbc+oJM66zjJb2AvfH9
         yCDPhmYgZYb9tPR4shwZj0PKlOa654j2kqfHdwSM/jmtMGIg5MZqhJeBgAYv+MELruF7
         LV8K4g1argVMLVpTv44U+UpIC0iyXi7R1hlXUN3Kpe3lqXefbiZUc2iqk5LwGeWwXOez
         b1vztLXOALKL1xEDOYtk0/GwNhuFvRUsuKIvBL191fwdGOT9dxJRI7386dW5Y38rsHDl
         kGLeNNH9QWXKrDIEmE95z2UHlLC1G7Q/8qvhAlsL/YEXmEuI8KOEugUIlYpUXsmC4KJ1
         fmTA==
X-Forwarded-Encrypted: i=1; AKwUvBxibeFhfh/fZgsdSfCmeEmZ7UgW+MldgBA6vAnxiPdHx72OjYw4ZhrOHAcqg8BqNv75B7cBw6jRhMGlPak=@vger.kernel.org
X-Gm-Message-State: AFq9FYL57G2atmv0qgwKrQ0ycy9NKXWNN4ldVXeKHkN5nIif+WOr6Hx7
	9EFgpOmDBbXZphkVDGMUGgvDn+EARa3Ff2hchGYWP0OU2bn7KYBX72s54BsMCO+5ttXqi7Lmjb6
	pDlICHdBulyErxeAcZKOrH6pstyG6f4dEUk4u9b9y7NYHVHNz3kChwO6YQkcF3hteyw/EevBwpO
	M=
X-Gm-Gg: AYBFou1fIyBRYLHli064PidaWf9dGzAy9gUR06MUew5W6cwJAEKEm4MgS9pmUpmKHCI
	Ga5oRCRd8pet/A34cjdzREGfRd5WaI+XZ/MzvYNjmwpww0jW13h+GIrsTBEsom/sB6AJ8ghV8H+
	LA8TwRhEc1g1lkeo9/EQhA/r7Ilm/2ig6fgotC3u2d5msq57uXHAbDQwW1G8jK7Uu47gRJonq8l
	pt+XR9eASH4lqN0FgGph6uA3teDhk8t16ycbCfClzAc39BQky31F03GSr0/4mSDYyKs984CJ5ME
	Aw9iPvdHRIUpfyVz9AEdYpSn/GZsBeEXuBwsjwSAU9wIlKVP7C0THaZ6iTW77B+uJqSOAQfen6w
	7edJwwDbzhpbwQlIJWSnw/oBKWwSx
X-Received: by 2002:a05:620a:4395:b0:93c:b3aa:4290 with SMTP id af79cd13be357-93ebd20e63cmr1937371385a.23.1791891307569;
        Tue, 13 Oct 2026 04:35:07 -0700 (PDT)
X-Received: by 2002:a05:620a:4395:b0:93c:b3aa:4290 with SMTP id af79cd13be357-93ebd20e63cmr1937363985a.23.1791891306044;
        Tue, 13 Oct 2026 04:35:06 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf2343asm654407215e9.9.2026.10.13.04.35.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 04:35:04 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 13:34:47 +0200
Subject: [PATCH v3 2/4] arm64: dts: qcom: nord-embedded: Add USB resources
 and PHYs
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-nord-usb-dwc-dts-v3-2-bcaaf3faae24@oss.qualcomm.com>
References: <20261013-nord-usb-dwc-dts-v3-0-bcaaf3faae24@oss.qualcomm.com>
In-Reply-To: <20261013-nord-usb-dwc-dts-v3-0-bcaaf3faae24@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>, brgl@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=9514;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=ylnJrMOLzAanHE6fM1+z+CP/qSpGO18W+z3UXY84J8g=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqzhdf6Ti9QtWK24oaKQVeGRKaGftV93e1/2PvG
 fVQ4QmRBSSJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCas4XXwAKCRAFnS7L/zaE
 w3naEACy8eAu/e4OHTYH7FeIogEVNUBiAFGap8S6A4JcJnlCTyAahrf+FHZlU5PcpDTLuDcLzlw
 4FroV8YhHsZc+G34aU9r2ctb7G1oq8sOPC2WVROw/U0/0a+mbdkoasne8SSbGYKUe3FUHnDO4AH
 5lmzr8UpT8KkvrQcHnMOM3Nzs/PcWz+P0psdLY+G1DOHrrZKC6+XF2UGvVcxeE1S9Ym+BOfl9ok
 f+9uUtiJggChvv4pqePrhqwJpqrbVewM1Kth/wvM7+/Vkrnorm1Xx4NVUWDNz2nFapeIBCRNjEt
 UDKWLmi+j2iydtzqsSD0KAQ5QfKfqZHcOqQHbigOFJBY6a0RZrWh+XEBlKXRTwklnsRBX72YDYW
 msZqkhT8hbo7zTg83XZVI7FVCQV345LFWlpf4fAtbIECTo9RsorxErL5z6OifrChIlXI11UwXEj
 XVzzod6xdS4W0ReJhLEvvuI3YOGUKAhScTv9/tWAqn5FMdr98p6b0LR9J9au6awRjzbNwMdDCec
 0uCq5Cchy3z1+/G0ZGNxDqPzl9ZLdI8lJWJAASHE7rfQHM3/97QV0QpTiVELY+ZQ545MB9YoCs5
 8ITpDsQxQ6NZk2m/52KmmKsC/9PkhEHtxJJ6W6MSCBp4z7/f5cHPw7Zaz3HwstwqGlZqxWA1j8M
 Skvz+o3m7IhTKCw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: O8Cvql7x8eiR9mVT5p5DIujQ0rZB8hhz
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA0NiBTYWx0ZWRfXy8wfI1oag6ig
 8Z1mTVfL9mObyaaT+pXKj7whREbO+CWyo4KlXrtf3/3LI3vg95CKjELk/TdtmpqmMDdV2kFHrp9
 xmaOeP9Zqy2RwNYPS9RIiqQNrOrezkY=
X-Proofpoint-ORIG-GUID: O8Cvql7x8eiR9mVT5p5DIujQ0rZB8hhz
X-Authority-Analysis: v=2.4 cv=Z4Z5j3RA c=1 sm=1 tr=0 ts=6ace176c cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=NOSK86ayaCRT3GQFxdkA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA0NiBTYWx0ZWRfX8M9knV3XaUWG
 IsTSm+uOYumHbdq+R4Hv2Zt3dM0l/rzc8PuJGFxf3v7stNBIKbiPNv3sx4jeR6tzvJEhsXUGkqx
 4SqfsMasU8/+zqX4kZ5voB+qxYdQ2LN4xFqGLVq/mHCk2cYF1jJ8LkEcZBDuU7VbBS9GY+D7mLk
 e9vEJGH96lRNf1yJTg3hJPT47txRIhKthwO52KlqP9qQwqODngdoVHWS9REFlFakVlFYk8r4vHB
 PMAF8KodPq1hLd9z+ZYSEk0cBg9kH5cK27IJoEQVgDjrpUV7JwHjtRTGrbuEA3pYZkUlgO7d5/N
 3k6kXo/uNn0ucQuzzs8hHWk7ApRyvtNrjhwGIXmR23sW2vLubpWLuddZZwEDK0tTngd5e65x06Y
 ex1UQuXUh87JqSRrG0q9pxhYYlnokv5Q96xkHv1qy9jPBUuEsbvkS37YSFsojCYg6R5EpnZE3Ff
 n64CaV9nKi/WzW99VCg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 phishscore=0 bulkscore=0 adultscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610130046

Add the platform resources for the three USB controllers on the embedded
Nord variant: clocks, resets, power domains and interconnect paths.

Add the eUSB2 PHY for each of the three controllers, plus the QMP combo
PHYs for USB_0 and USB_1, and feed the two QMP USB3 pipe clocks back
into negcc, which so far carried placeholder zeros in their place.

The eUSB2 PHY of instance 2 gets no 'resets': the SoC provides only two
QUSB2PHY block resets, belonging to instances 0 and 1. Instance 2 comes
out of reset with the rest of the USB20 tile, driven by the controller.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Co-developed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-embedded.dtsi | 311 +++++++++++++++++++++++++++-
 1 file changed, 309 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
index 6dc4c871f41e065fd193fdf552d062c91343da28..7db113e05897db05cafeb509f039eedc19f54444 100644
--- a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
@@ -15,6 +15,7 @@
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/interconnect/qcom,icc.h>
 #include <dt-bindings/interconnect/qcom,nord-rpmh.h>
+#include <dt-bindings/phy/phy-qcom-qmp.h>
 #include <dt-bindings/power/qcom,rpmhpd.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
 
@@ -857,6 +858,161 @@ hpass_ag_noc: interconnect@5fc0000 {
 		qcom,bcm-voters = <&apps_bcm_voter>;
 	};
 
+	usb_2_hsphy: phy@88e0000 {
+		compatible = "qcom,nord-snps-eusb2-phy",
+			     "qcom,sm8550-snps-eusb2-phy";
+		reg = <0x0 0x088e0000 0x0 0x154>;
+
+		clocks = <&tcsrcc TCSR_USB2_2_CLKREF_EN>,
+			 <&negcc NE_GCC_AHB2PHY_CLK>;
+		clock-names = "ref",
+			      "bus";
+
+		resets = <&negcc NE_GCC_QUSB2PHY_PRIM_BCR>;
+
+		#phy-cells = <0>;
+
+		status = "disabled";
+	};
+
+	usb_0_qmpphy: phy@88e1000 {
+		compatible = "qcom,nord-qmp-usb3-dp-phy";
+		reg = <0x0 0x088e1000 0x0 0x3000>;
+
+		clocks = <&negcc NE_GCC_USB3_PRIM_PHY_AUX_CLK>,
+			 <&tcsrcc TCSR_USB3_0_CLKREF_EN>,
+			 <&negcc NE_GCC_USB3_PRIM_PHY_COM_AUX_CLK>,
+			 <&negcc NE_GCC_USB3_PRIM_PHY_PIPE_CLK>,
+			 <&negcc NE_GCC_AHB2PHY_CLK>;
+		clock-names = "aux",
+			      "ref",
+			      "com_aux",
+			      "usb3_pipe",
+			      "cfg_ahb";
+
+		power-domains = <&negcc NE_GCC_USB3_PHY_GDSC>;
+
+		resets = <&negcc NE_GCC_USB3_PHY_PRIM_BCR>,
+			 <&negcc NE_GCC_USB3_DP_PHY_PRIM_BCR>;
+		reset-names = "phy",
+			      "common";
+
+		#clock-cells = <1>;
+		#phy-cells = <1>;
+
+		status = "disabled";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				usb_0_qmpphy_usb_ss_out: endpoint@1 {
+					reg = <1>;
+					data-lanes = <1 0>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				usb_0_qmpphy_usb_ss_in: endpoint {
+					remote-endpoint = <&usb_0_dwc3_ss>;
+				};
+			};
+		};
+	};
+
+	usb_1_qmpphy: phy@88e4000 {
+		compatible = "qcom,nord-qmp-usb3-dp-phy";
+		reg = <0x0 0x088e4000 0x0 0x3000>;
+
+		clocks = <&negcc NE_GCC_USB3_SEC_PHY_AUX_CLK>,
+			 <&tcsrcc TCSR_USB3_1_CLKREF_EN>,
+			 <&negcc NE_GCC_USB3_SEC_PHY_COM_AUX_CLK>,
+			 <&negcc NE_GCC_USB3_SEC_PHY_PIPE_CLK>,
+			 <&negcc NE_GCC_AHB2PHY_CLK>;
+		clock-names = "aux",
+			      "ref",
+			      "com_aux",
+			      "usb3_pipe",
+			      "cfg_ahb";
+
+		power-domains = <&negcc NE_GCC_USB3_SEC_PHY_GDSC>;
+
+		resets = <&negcc NE_GCC_USB3_PHY_SEC_BCR>,
+			 <&negcc NE_GCC_USB3_DP_PHY_SEC_BCR>;
+		reset-names = "phy",
+			      "common";
+
+		#clock-cells = <1>;
+		#phy-cells = <1>;
+
+		status = "disabled";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				usb_1_qmpphy_usb_ss_out: endpoint@1 {
+					reg = <1>;
+					data-lanes = <1 0>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				usb_1_qmpphy_usb_ss_in: endpoint {
+					remote-endpoint = <&usb_1_dwc3_ss>;
+				};
+			};
+		};
+	};
+
+	usb_0_hsphy: phy@88ea000 {
+		compatible = "qcom,nord-snps-eusb2-phy",
+			     "qcom,sm8550-snps-eusb2-phy";
+		reg = <0x0 0x088ea000 0x0 0x154>;
+
+		clocks = <&tcsrcc TCSR_USB2_0_CLKREF_EN>,
+			 <&negcc NE_GCC_AHB2PHY_CLK>;
+		clock-names = "ref",
+			      "bus";
+
+		#phy-cells = <0>;
+
+		status = "disabled";
+	};
+
+	usb_1_hsphy: phy@88eb000 {
+		compatible = "qcom,nord-snps-eusb2-phy",
+			     "qcom,sm8550-snps-eusb2-phy";
+		reg = <0x0 0x088eb000 0x0 0x154>;
+
+		clocks = <&tcsrcc TCSR_USB2_1_CLKREF_EN>,
+			 <&negcc NE_GCC_AHB2PHY_CLK>;
+		clock-names = "ref",
+			      "bus";
+
+		resets = <&negcc NE_GCC_QUSB2PHY_SEC_BCR>;
+
+		#phy-cells = <0>;
+
+		status = "disabled";
+	};
+
 	negcc: clock-controller@8900000 {
 		compatible = "qcom,nord-negcc";
 		reg = <0x0 0x08900000 0x0 0xf4200>;
@@ -865,8 +1021,8 @@ negcc: clock-controller@8900000 {
 			 <0>,
 			 <0>,
 			 <0>,
-			 <0>,
-			 <0>;
+			 <&usb_1_qmpphy QMP_USB43DP_USB3_PIPE_CLK>,
+			 <&usb_0_qmpphy QMP_USB43DP_USB3_PIPE_CLK>;
 		#clock-cells = <1>;
 		#reset-cells = <1>;
 		#power-domain-cells = <1>;
@@ -1989,3 +2145,154 @@ opp-403000000 {
 		};
 	};
 };
+
+&usb_0 {
+	clocks = <&negcc NE_GCC_CNOC_USB3_PRIM_AXI_CLK>,
+		 <&negcc NE_GCC_USB31_PRIM_MASTER_CLK>,
+		 <&negcc NE_GCC_AGGRE_NOC_USB3_PRIM_AXI_CLK>,
+		 <&negcc NE_GCC_USB31_PRIM_SLEEP_CLK>,
+		 <&negcc NE_GCC_USB31_PRIM_MOCK_UTMI_CLK>,
+		 <&tcsrcc TCSR_USB3_0_CLKREF_EN>;
+	clock-names = "cfg_noc",
+		      "core",
+		      "iface",
+		      "sleep",
+		      "mock_utmi",
+		      "xo";
+
+	assigned-clocks = <&negcc NE_GCC_USB31_PRIM_MOCK_UTMI_CLK>,
+			  <&negcc NE_GCC_USB31_PRIM_MASTER_CLK>;
+	assigned-clock-rates = <19200000>, <200000000>;
+
+	power-domains = <&negcc NE_GCC_USB31_PRIM_GDSC>;
+	required-opps = <&rpmhpd_opp_nom>;
+
+	resets = <&negcc NE_GCC_USB31_PRIM_BCR>;
+
+	interconnects = <&aggre1_noc_tile MASTER_USB3_0 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_USB3_0 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "usb-ddr",
+			     "apps-usb";
+
+	phys = <&usb_0_hsphy>,
+	       <&usb_0_qmpphy QMP_USB43DP_USB3_PHY>;
+	phy-names = "usb2-phy",
+		    "usb3-phy";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+
+			usb_0_dwc3_hs: endpoint {
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+
+			usb_0_dwc3_ss: endpoint {
+				remote-endpoint = <&usb_0_qmpphy_usb_ss_in>;
+			};
+		};
+	};
+};
+
+&usb_1 {
+	clocks = <&negcc NE_GCC_CNOC_USB3_SEC_AXI_CLK>,
+		 <&negcc NE_GCC_USB31_SEC_MASTER_CLK>,
+		 <&negcc NE_GCC_AGGRE_NOC_USB3_SEC_AXI_CLK>,
+		 <&negcc NE_GCC_USB31_SEC_SLEEP_CLK>,
+		 <&negcc NE_GCC_USB31_SEC_MOCK_UTMI_CLK>,
+		 <&tcsrcc TCSR_USB3_1_CLKREF_EN>;
+	clock-names = "cfg_noc",
+		      "core",
+		      "iface",
+		      "sleep",
+		      "mock_utmi",
+		      "xo";
+
+	assigned-clocks = <&negcc NE_GCC_USB31_SEC_MOCK_UTMI_CLK>,
+			  <&negcc NE_GCC_USB31_SEC_MASTER_CLK>;
+	assigned-clock-rates = <19200000>, <200000000>;
+
+	power-domains = <&negcc NE_GCC_USB31_SEC_GDSC>;
+	required-opps = <&rpmhpd_opp_nom>;
+
+	resets = <&negcc NE_GCC_USB31_SEC_BCR>;
+
+	interconnects = <&aggre1_noc_tile MASTER_USB3_1 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_USB3_1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "usb-ddr",
+			     "apps-usb";
+
+	phys = <&usb_1_hsphy>,
+	       <&usb_1_qmpphy QMP_USB43DP_USB3_PHY>;
+	phy-names = "usb2-phy",
+		    "usb3-phy";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+
+			usb_1_dwc3_hs: endpoint {
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+
+			usb_1_dwc3_ss: endpoint {
+				remote-endpoint = <&usb_1_qmpphy_usb_ss_in>;
+			};
+		};
+	};
+};
+
+&usb_2 {
+	clocks = <&negcc NE_GCC_CNOC_USB2_AXI_CLK>,
+		 <&negcc NE_GCC_USB20_MASTER_CLK>,
+		 <&negcc NE_GCC_AGGRE_NOC_USB2_AXI_CLK>,
+		 <&negcc NE_GCC_USB20_SLEEP_CLK>,
+		 <&negcc NE_GCC_USB20_MOCK_UTMI_CLK>,
+		 <&tcsrcc TCSR_USB2_2_CLKREF_EN>;
+	clock-names = "cfg_noc",
+		      "core",
+		      "iface",
+		      "sleep",
+		      "mock_utmi",
+		      "xo";
+
+	assigned-clocks = <&negcc NE_GCC_USB20_MOCK_UTMI_CLK>,
+			  <&negcc NE_GCC_USB20_MASTER_CLK>;
+	assigned-clock-rates = <19200000>, <120000000>;
+
+	power-domains = <&negcc NE_GCC_USB20_PRIM_GDSC>;
+	required-opps = <&rpmhpd_opp_nom>;
+
+	resets = <&negcc NE_GCC_USB20_PRIM_BCR>;
+
+	interconnects = <&aggre1_noc_tile MASTER_USB2 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_USB2 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "usb-ddr",
+			     "apps-usb";
+
+	phys = <&usb_2_hsphy>;
+	phy-names = "usb2-phy";
+
+	port {
+		usb_2_dwc3_hs: endpoint {
+		};
+	};
+};

-- 
2.47.3

