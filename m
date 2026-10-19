Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DA30549FEE
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792419194; cv=none; b=m5GX+BEj0SjAtyXUCysPdWDMKeJ0P86eyb45zKW1Fd/pxNCNYen0kHnzXWC/L01nU3PD2Xc8IzmcFBPK7LJ8OKQdnrGR7M+6Epc0w7Hgw5G3tRVbgvqiNTDkw1HPd3cHG516LCjWYHmm2f9ts2C5lps5n+XZYArSz8vCpWddWKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792419194; c=relaxed/simple;
	bh=vbsFOJlBgnVJrx1Qgl2c5KGFQ2u9CRre2ocXmC7+LlY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mhdDLDtGIu/f0zlWRr/JyM2YWLycHrZNCc1+JHfOINKNG9qmEljg9U54Sy0XMeo/dREaLJTTkCpKGWxNXIcXnwv/mXmRv8Jv6w8eF9NdbyOvP7Me96jfMLRkDDFF7NOuGVq9gL3cZRaKOHUiRIewPeGIvdFlJ+9Fe7vkQZYLEOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Io++Jhua; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fOAE83zI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Io++Jhua";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fOAE83zI"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JE09H64041269
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:13:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8tjHbAjdItoV6hifQWidsHiD/eNMVC9DOqU9rX5AknQ=; b=Io++JhuaANBxWkXL
	kwxS8/kYCgKJxO5Z9eB/XFe7uj+dJZbTA+egEDT0j6H4Ebk2Hs/Et3ZF3DnsvJRd
	Ie6hGv5ZJq4iqqPL6DpcAyUzGQ5StK1YVXVI1iL3Bi6FM/vznKE/mAYcZ4GjrO/A
	9EloulXCVTZA7iPp5O5JdcyoDre8+hd13PngriZecpEbEp5wxB5zEOhMiJb7uSN/
	izp6w0OGFYITjfYp2aXoJ521laRPUy2GRPDR8+++2UDhmPmee67KrsuWO5fTZZ7E
	oeWtMLvyLrC2UvJkTcWW5QK9wtmUBmVRSJcImrgECmc5TvAWvfoD9tTet3C4NLa1
	nQfzYg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf47hkdd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:13:11 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93a1de6d5c3so525589685a.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 07:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792419191; x=1793023991; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8tjHbAjdItoV6hifQWidsHiD/eNMVC9DOqU9rX5AknQ=;
        b=fOAE83zIHdqw8VFVbcaqA1ztxa3XF3laQJQlDjjSXom6tlkNH1T+EVXOT5boB3xZD8
         z69x8zi31DDhgE87IOX8f31JP7oZT4EHqxWzn8xSvmTX66R7MKVp3lQOp1nsAB2dqWzQ
         l4jF7Y/9gIVViqB5ZIgRFeZKgRnHkm3CKuaFobviyDWgVhHw5xKuvXwx0YZZLRmrWnUP
         M6dHEUZsKcB043T6GFmUtuh4vp/BRl2XkJd2eTaiOm/cBSa50LY3OnuKzsShDfojt326
         4/i/cJ9iKrlse1tkbWk7N2c7fIWXbHvq3ErKGJQRCtfOZ91SEA12VTgJEkF92nhu6onb
         vipg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792419191; x=1793023991;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8tjHbAjdItoV6hifQWidsHiD/eNMVC9DOqU9rX5AknQ=;
        b=l3MtMfN0Qia2gFBsk7zpLoie3ojz2bhhrwbNiYAZzcY34rDnTB63IHu3Nl90kWHBKV
         pWx7wfbet7RTJe+nAFH+nnPnqJYk39RVLV2+J1vWKCHMaMwJcpwAJN7jpgPwbdBIo1DH
         MatIb3K+xFYBTPOerT6duS7mBmaFJqHRw4qsghIcBaj//EDccsUFLJIThkNfIM4P2+nk
         pqrIEH3j0+ge6Nu6EC7dQz+JyCZGa1x/UDFElJ519alaWlQLG92HJ2Qict8XCZGDxNMG
         Q/QrOlnWhw6DWxvPMTW4+0d5rTXnXrWEU8vExLm1Kqt9NgHOxg1N/HREwQHd6dp0q4X4
         Ssrg==
X-Forwarded-Encrypted: i=1; AKwUvByscIfpNgtMn1VA3IPAW4urJ73Tw3x4jLrT9cDzhyneBQ1mdVugUGOCP9ZtEB5GGqtBaUJEFEGu/nc7tos=@vger.kernel.org
X-Gm-Message-State: AFq9FYJcWWDai5kRNKSA4hEC1GxehdqeIHqgAngGgVMrIpzxPhdtd94P
	eY8o466dr+xC0RHJWj4iB9hAXskfCvFAGkBxSPZVI0k5cnj3xsLR3ikYGwgyefEKADVCLzUhwdc
	EDRT4Su13IFYM4hdzs0a4Hi+nXbE5QW/pkc8yZAGHON4WCfNFWmmRO4PVwODB8Puqtv0=
X-Gm-Gg: AYBFou0bigTDyIshYbeUZHur0FUCfTpA0+qEvtjlxYRbXTMx1Tbq4C/oBA6bmNBvsZc
	415Ssmd74xhGMrdwyAqz5TQPxHf8YiSQvnQpQzEHA35IozuWv1btPG/8tuNJPoF4CWsforaT64Q
	bXsNegEaHLGNmmbopDI5pXz/vPL6BNhwoIr+RnJCUBH3jPlo2RUeVP5VQ1gpXnLhBBPtkSBxoNU
	/iMBKAy0opEVOJCkZIm9iwMHlORBcMSSxhff2mbn+btDj/wfZM4LqwnqFKK3+CuKUOF/AlLuq7b
	5zZ/WKqM7vYAmjG9SqQxDpC6Vkk6cV8f6r58pXTqXRuMc4GT4YD0uS3boSQjtGCeXBgyO8g/1W2
	StFEVpv+y4VRp4uNy8QBLl4zf14gQRaZ4+4Gust1ERm3+J3XBH3G4PRfhVIDBzEE7MS+Dvj0Xnt
	qTTbar1Qk53nOS
X-Received: by 2002:a05:620a:3955:b0:93e:c12c:f13d with SMTP id af79cd13be357-93f29df4e6cmr1330201985a.71.1792419190635;
        Mon, 19 Oct 2026 07:13:10 -0700 (PDT)
X-Received: by 2002:a05:620a:3955:b0:93e:c12c:f13d with SMTP id af79cd13be357-93f29df4e6cmr1330196185a.71.1792419190055;
        Mon, 19 Oct 2026 07:13:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be4a42ade9sm2015922e87.14.2026.10.19.07.13.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 07:13:08 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 17:12:45 +0300
Subject: [PATCH 7/8] arm64: dts: qcom: msm8998: add interconnect provider
 nodes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-msm8998-icc-v1-7-c2da3934b6c8@oss.qualcomm.com>
References: <20261019-msm8998-icc-v1-0-c2da3934b6c8@oss.qualcomm.com>
In-Reply-To: <20261019-msm8998-icc-v1-0-c2da3934b6c8@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Del Regno <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Andy Gross <agross@codeaurora.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Shawn Guo <shawn.guo@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4328;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=vbsFOJlBgnVJrx1Qgl2c5KGFQ2u9CRre2ocXmC7+LlY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq1iVisGrWcsgnKh2bm1sU619I4/eVg1XW44ACB
 F3n3fVhYVqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatYlYgAKCRCLPIo+Aiko
 1edBCACAQ8qqPT2J+pm56WlgOB5Y42uO1E8x0Y2HzxoA9og9AJOSM0dBUxmm3bI5xp+gI4W3wRz
 25scqEqgnCsM2D5u4kc+GLLNFRydALo294JCq9gVyxQPKgZgTA6sQgmx/dHWgrzSDyJDlLM0E94
 g+e2pR/ymdXbTtSWN0/0s38ZvoVKrc2ycDlxvg0WFJhZHdJQ/HqKpVd7kxl0mbciFM5pomxWKAp
 ivf/xrhWStxM/EdftLQE2gjkRhqR7/3VSQZTJJDM22kTykUD3nzwuwjqOmGwUDQEI4Ruyjtp+T7
 91JNT4koqRnLke5T8QWMyuIa97vp4sBQHuXl3UT2sSNjWWY3
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: rjBvUKUx-gfOoU2kGKWoU0LFMShoW8g7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA1NiBTYWx0ZWRfX/xZWDSDETOnj
 YB1z6tDESkCLV0CnGHjxmbpbbT49fuvxwpaQ4Y+oN1e7TAeSOHZTIKUhnC5myMntaHr1WMfrzCG
 ZgrooZJfUmEECJkoFdktWfA/CLo+rM58ADp7gWQwbWU9ow4O19GOpeqXKI/9d7xWMpzuAaGYedw
 lIBupEcmqFD0L4+TcB1UR75jAtaFlKTvtm5hfQjsPEL80BddUo4/+DjLEiKoMqqFkZj7xKO0tFm
 7hFj6dMrixTva+0AH3pAl9vF3pgQRo3M3toJg5RKc+5W7I7/LiqYxs8ENdSH67cvblwQg5wrnDi
 maZrBD8+4ZTSdwmTnGUe+YCLuaXK0MLjn4P66yK3wPtyB9P4PpEXmD/Bloj5sMOdffSlM47JR5Y
 wG6dl9dr3iXzJ8q+RqvdEnG1rvZyx8LF2wj6M7J+QEcwmHnHRdjYwUaTtEgflpTDm+14d/wF92N
 2nkJokNpB91EuslvFQw==
X-Proofpoint-GUID: rjBvUKUx-gfOoU2kGKWoU0LFMShoW8g7
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA1NiBTYWx0ZWRfXwFzVC4TivCs9
 LxzYFBJeE6zXZZ+xcxvmjTiHBJdikCH0K7MIvS21DeyPUKLUp0aF8IJiE26J/n7r16dxN4lDYE0
 GywnjdRaXfPvdL5xdXT0Ce9ZwIHck+k=
X-Authority-Analysis: v=2.4 cv=cLt1IVeN c=1 sm=1 tr=0 ts=6ad62577 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=RD5ud31fRjQD-vIedKwA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_04,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 phishscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190056

MSM8998 has an interconnect provider driver, but the SoC device tree
describes none of the NoC devices it binds to, so no bus bandwidth or
NoC clock scaling is possible and every consumer that wants to vote is
left without a provider.

Add the eight NoC nodes.  The AHB MMSS NoC shares its register space
with the MMSS NoC and is described as its child.  The A1NoC and A2NoC
register ranges are shrunk compared to the downstream ones, which
overlap the SMMU and the MMSS NoC respectively.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/msm8998.dtsi | 89 +++++++++++++++++++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index bd8b69e323e1..bb004e0b74ef 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -8,6 +8,7 @@
 #include <dt-bindings/clock/qcom,mmcc-msm8998.h>
 #include <dt-bindings/clock/qcom,rpmcc.h>
 #include <dt-bindings/firmware/qcom,scm.h>
+#include <dt-bindings/interconnect/qcom,msm8998.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/gpio/gpio.h>
 
@@ -859,6 +860,13 @@ qusb2_hstx_trim: hstx-trim@23a {
 			};
 		};
 
+		bimc: interconnect@1008300 {
+			compatible = "qcom,msm8998-bimc";
+			reg = <0x01008300 0x77d00>;
+
+			#interconnect-cells = <2>;
+		};
+
 		tsens0: thermal@10ab000 {
 			compatible = "qcom,msm8998-tsens", "qcom,tsens-v2";
 			reg = <0x010ab000 0x1000>, /* TM */
@@ -881,6 +889,42 @@ tsens1: thermal@10ae000 {
 			#thermal-sensor-cells = <1>;
 		};
 
+		cnoc: interconnect@1500000 {
+			compatible = "qcom,msm8998-cnoc";
+			reg = <0x01500000 0x10000>;
+
+			clocks = <&gcc GCC_CFG_NOC_USB3_AXI_CLK>;
+			clock-names = "iface";
+
+			#interconnect-cells = <2>;
+		};
+
+		snoc: interconnect@1620000 {
+			compatible = "qcom,msm8998-snoc";
+			reg = <0x01620000 0x40000>;
+
+			clocks = <&gcc GCC_MMSS_SYS_NOC_AXI_CLK>;
+			clock-names = "iface";
+
+			#interconnect-cells = <2>;
+		};
+
+		a1noc: interconnect@1660000 {
+			compatible = "qcom,msm8998-a1noc";
+			reg = <0x01660000 0x20000>;
+
+			clocks = <&gcc GCC_AGGRE1_UFS_AXI_CLK>,
+				 <&gcc GCC_UFS_AXI_CLK>,
+				 <&gcc GCC_AGGRE1_USB3_AXI_CLK>,
+				 <&gcc GCC_BLSP2_AHB_CLK>;
+			clock-names = "aggre1_ufs_axi",
+				      "ufs_axi",
+				      "usb_axi",
+				      "blsp2_ahb";
+
+			#interconnect-cells = <2>;
+		};
+
 		anoc1_smmu: iommu@1680000 {
 			compatible = "qcom,msm8998-smmu-v2", "qcom,smmu-v2";
 			reg = <0x01680000 0x10000>;
@@ -915,6 +959,43 @@ anoc2_smmu: iommu@16c0000 {
 				<GIC_SPI 465 IRQ_TYPE_EDGE_RISING>;
 		};
 
+		a2noc: interconnect@1700000 {
+			compatible = "qcom,msm8998-a2noc";
+			reg = <0x01700000 0x40000>;
+
+			clocks = <&gcc GCC_SDCC2_AHB_CLK>,
+				 <&gcc GCC_SDCC4_AHB_CLK>,
+				 <&gcc GCC_BLSP1_AHB_CLK>,
+				 <&rpmcc RPM_SMD_IPA_CLK>;
+			clock-names = "sdcc2_ahb",
+				      "sdcc4_ahb",
+				      "blsp1_ahb",
+				      "ipa";
+
+			#interconnect-cells = <2>;
+		};
+
+		mnoc: interconnect@1740000 {
+			compatible = "qcom,msm8998-mnoc";
+			reg = <0x01740000 0x10000>;
+
+			clocks = <&mmcc MNOC_AHB_CLK>,
+				 <&mmcc MNOC_MAXI_CLK>;
+			clock-names = "iface",
+				      "mnoc_bus";
+
+			#interconnect-cells = <2>;
+
+			mnoc_ahb: interconnect-mnoc-ahb {
+				compatible = "qcom,msm8998-mnoc-ahb";
+
+				clocks = <&mmcc AHB_CLK_SRC>;
+				clock-names = "bus";
+
+				#interconnect-cells = <2>;
+			};
+		};
+
 		pcie0: pcie@1c00000 {
 			compatible = "qcom,pcie-msm8998", "qcom,pcie-msm8996";
 			reg = <0x01c00000 0x2000>,
@@ -3181,6 +3262,7 @@ venus: video-codec@cc00000 {
 				 <&mmcc VIDEO_AXI_CLK>,
 				 <&mmcc VIDEO_MAXI_CLK>;
 			clock-names = "core", "iface", "bus", "mbus";
+
 			iommus = <&mmss_smmu 0x400>,
 				 <&mmss_smmu 0x401>,
 				 <&mmss_smmu 0x40a>,
@@ -3290,6 +3372,13 @@ glink-edge {
 			};
 		};
 
+		gnoc: interconnect@17900000 {
+			compatible = "qcom,msm8998-gnoc";
+			reg = <0x17900000 0x10000>;
+
+			#interconnect-cells = <2>;
+		};
+
 		apcs_glb: mailbox@17911000 {
 			compatible = "qcom,msm8998-apcs-hmss-global",
 				     "qcom,msm8994-apcs-kpss-global";

-- 
2.47.3

