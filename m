Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5C9A549FC4
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792419202; cv=none; b=sjnIFXMmLzpksfgGs4w+wTOehjdf3OC6EWF8WaBJT2opFgvQTtQu+gkCqkGFixDruGp5TBFF1keOs59J7OWtT5v/iXMCrQEA1SzMS8L0eVOjbYRxB/aN3ZbLAKf+d6aH5FPb5ncjDBby2/HnK/vQG4uyCA9CmW9pED7bmZrozBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792419202; c=relaxed/simple;
	bh=fKKIHMpqzukpYfMoD8mRdlEoShKR7c97bpoK5XTksHs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KcScCmARnfeQ+gwe0/JMNg6YffylWuaQj6Q3lbaIFsKK57wMdh4hCGEkjSZRSL7LQ/pOJFVyVKEEf/pdvL6nga1FIeOjfAEoOQnZAwBei3+DMV1NJlRHsw1bBWWOXwcV4yuLwB5ZnfDWbxWbMm9mFLuhOfO8Ix/8oDmMwDXHH6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I4KYBYhC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hvBiSeDd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I4KYBYhC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hvBiSeDd"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JE0a5A2401906
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:13:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	83JWv/6l+GaV+TkYZfyPt+tvWgeDwYmvon/0weay7xA=; b=I4KYBYhCL0j+Q7k9
	JUU/Rhu53LPAaWaNIDrxGfyh4cCaADsKmFRNobggtLakoQ4XyeH988Ic/t75cor8
	gJ9wKQLr2jC4IXz49BnTClLQkPDZJhsTmupklcMACeCqfaHH7bfkWhPHvw3aC4IP
	k46mnoySfLkYuJcQSwnv45DjWmvMADwYk4mpQIzZ6LmFueqdnmGFJ9Bxfx6IeyNR
	oPuQ3QE9ytt9SPy9Dzb6lTtWHvUembNJ8tm5zR+xl/ZDPNic0PK6FM2Vdh6hysDT
	3rVZep5u6GCIzxZYuhdT8hyBom7FekCsR+s2/duYsDGJvZBIeMc2FxamZ5QFtfWp
	xtd1hg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf3n1jgy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:13:20 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93ca9b53afaso754836985a.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 07:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792419199; x=1793023999; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=83JWv/6l+GaV+TkYZfyPt+tvWgeDwYmvon/0weay7xA=;
        b=hvBiSeDd9URF5GxC1lNY5CSScacsSXG0I3ztc74qsqaMWxp9qIR0xN2uVYxe1pD3ZN
         Bd2cV6FKA+p34QEHM+SnrTm8zr3alJ2AOZtutHM1y8Nq1ToOOcWwHQu8NdOUytGhE/z5
         UgKb7ThX9dYCuylTETQr5xmKcprWmQh4BSzdLVWKwIFjqBbG+yiAdW7Ien9QC59c8B4/
         moSPonI0jdTiclpgfsKRvqalLizflJPmtWkloO8AkjZBkN+L5IOIyeNN14kUKK1qkRJM
         mtt1zGXyLgkgq0zTrKIuxxZxETVFrd/KEEiGTirh4q3H9c4jpsr0CQaAwGNcC5PpR6o3
         pfuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792419199; x=1793023999;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=83JWv/6l+GaV+TkYZfyPt+tvWgeDwYmvon/0weay7xA=;
        b=yDUZvUhPmWd2tSg8yyBV7q1mmMHy1kDUavqGR2ciUbXY1JF0rrNUuACyhaLIGV48U+
         DgNfi+ku8qKiVW96DZpVXQwNwjCNOBW6d6ZSvGo+VH8lCwUAPe+FD9Qp09/Flk3b4ksy
         4v+QjThtM9XMtFEL9oy7xJE/3PX8FjoMSZhB+OvbmfUMpzHXn5wtlZexcI5ObTJXoBXV
         HC0Ugssn7jHfsm8bcnNN+alrbEhV7uiyWzbEQ4OC09PELmok5KuoA1AoNo9KYT8d20v5
         OGSD7rLDOKTG8hhYpptsJR83BPZ7UYQ9VZWoZYFz7vLRQEimGl+67UVGb8NNsk51+p9P
         WwKQ==
X-Forwarded-Encrypted: i=1; AKwUvBy69W7z1/bvGD5HO0rTFNi6JlcHyzIG19WmibOnxnWk8oWYolCKWM529qqDZd+PeCfqIK69nbqrdYS1NPQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLH2mymA6Wog1baAx9OnrbNPPwdOo6c5CzvH9OtriODaiOlzFPz
	nwKlzJXR/fZ/dtPVuq5VDeRhZsXTSzJCj/xmvk5QfJ5Ceq77m9uByiWIz2gHWsZeDhdL/A6WLqz
	HCZ8xdJ55tsQ0eTviM5+8GxHiZElKIqLxY1vSCRO9UvJc67IIHeP7wEHntewH7g1Tf4o=
X-Gm-Gg: AYBFou0A6E93mDuPn3Z4byH4CDTGAvYOTi0hEllOTYcDVjxnUaam9zNYqZUzPIjv4as
	xaJnDPjpZzZCzKwk/pYICHNjxB4FK97N6bS8CXS/fhmUOsRfhjKJ4IAiHfQsERzAq9AfmpQ5w4V
	8RT0NwxNCcjujZMrWsPjtIL7Jx0wIPVMu22TcFrsLsPUrDQlJx09sEZNoMlurhaGxawG85mmoUK
	5WshY2E/ya95rrOoeKxdsigJMjG70QTp7of4d/3+pHn6aSQCY6AApH8tLQpyCvjEE3OQh8vb+yW
	Nx9c7K4sZzDQlnhsu+HTWhHkEdMW2xwyJ45n7Nk+orplPMkuqMF8YiSKxY38/Wrlt/+TU6F5Yb0
	ipT8cRwAJo/YqDxWfZehhkFLEVDbr7GHNKmk9UYjk7zl2SHg4seMCDAx4VH4Ibu9N5r97luvEZf
	41OXq4OKPuY1lb
X-Received: by 2002:a05:620a:6cc9:b0:93e:dcb4:c73e with SMTP id af79cd13be357-93f29b72b48mr1370546085a.5.1792419199051;
        Mon, 19 Oct 2026 07:13:19 -0700 (PDT)
X-Received: by 2002:a05:620a:6cc9:b0:93e:dcb4:c73e with SMTP id af79cd13be357-93f29b72b48mr1370495285a.5.1792419193803;
        Mon, 19 Oct 2026 07:13:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be4a42ade9sm2015922e87.14.2026.10.19.07.13.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 07:13:10 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 17:12:46 +0300
Subject: [PATCH 8/8] arm64: dts: qcom: msm8998: wire up interconnect paths
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-msm8998-icc-v1-8-c2da3934b6c8@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4215;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=fKKIHMpqzukpYfMoD8mRdlEoShKR7c97bpoK5XTksHs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq1iVi1aObHRGGskMuLhYLiQocLWtjOCMy5Ub8d
 HVBLjd1AHGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatYlYgAKCRCLPIo+Aiko
 1ZwCB/40bhQUswVL1Lr1Z9ktxBfZ1VciZyzXkWm3Ek7Ls/QmuP+n4TQx5gEEkR9KB/r+thRBcJK
 x9A2HkccFAUkTm75HylV9ycVtGIkeSTeQ4nKlJ9Rd07EdX+W4+KqNxIt6vfOKwtbOqB6v4BlsM+
 xHY7wOpA6WeN4cg9QOHtFbVnjocw6EPiIknmZWBxOEtSMxjM+9Ukg7o0vILR+qJHVZlMzWVl7LJ
 HGckNoFwMDOBLceEg3QmY/PKZnfp1qyw/S7CIfGd0L9gWXUaBUZNoXAXDCkNwILQ9X13GC3zISd
 DNTkQImzfS89WAPerM2lfq196Db7jRMmk8GPnMUWe/cCC3uD
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA1NiBTYWx0ZWRfX4vHyUghAx8zX
 uSGwtsIIa4gk/OvNNEtJBcqXxQKjV3L1+ZVQ/SD9aFk4Wrby1PtfhHUS+xjfbtv5vXxrM4BeeXT
 SF1Jj4LntOyszIKx5SXqMlUJKmjdZLE=
X-Proofpoint-ORIG-GUID: _ZzpwKmgfXS4zHmRq3yPHgDCdHoVUJRV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA1NiBTYWx0ZWRfX6A7bqgqlFGav
 nsIHqGr4E5e10L+g/0S6kSP+fhWpsrNMOxNHbu0ZvAA+QG7oT2ECMf05MqiJ8b76ja8FOM0uq3I
 lnONMdaNLbYOqiYTVqO5Lfeoyc9rL2IdJe5uD9J1lUiaR137Fy+KMKcPdV2aMFjwGNpGU/TBjQ3
 GmyIds/sYnebce8+YzLaVU1yOOf28MU8a9ttBcHgr/zEA2JDKnAvDHAf1FBXnY5fqT0Qn4a6RA8
 fLUKyDr8+YoDv7H44piNxfcotslmyCJfVEAua4/TZ54b1mVH67n9T2eEiAnanepCPICrl7vseBl
 hzaCWRElogWcldbXGth5QGYjy2yE2NoSiJJk7q5CxWr02gpzOWWxswWNE4U0VPPyk5k9kz7frXM
 R/1pmFYQM1EDq2Nf7oJ48G8/sAnUKb0mQt1DJxfn7CwY+P2k2oWt5lFxEruoCTYs6pDuWApmpnQ
 Mz1jkwuwMpAlX2aZD7Q==
X-Proofpoint-GUID: _ZzpwKmgfXS4zHmRq3yPHgDCdHoVUJRV
X-Authority-Analysis: v=2.4 cv=Zf2IpcVA c=1 sm=1 tr=0 ts=6ad62580 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=X6w4NE1OM-8LWPBiDHAA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_04,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190056

With the NoC providers described but no consumer referencing them, the
NoC bus clocks stay at their boot rates: nothing votes for DDR or
config bandwidth, so masters such as MDSS or UFS run on whatever the
bootloader left behind.

Add the interconnect paths for the GPU, MDSS, Venus, UFS, USB and SDHC2.
PCIe is deliberately left out: MSM8998 has no route from the CPU to the
PCIe config slave, and requesting one only makes the PCIe driver fail
to probe.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/msm8998.dtsi | 38 +++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index bb004e0b74ef..939601322cfb 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -8,6 +8,7 @@
 #include <dt-bindings/clock/qcom,mmcc-msm8998.h>
 #include <dt-bindings/clock/qcom,rpmcc.h>
 #include <dt-bindings/firmware/qcom,scm.h>
+#include <dt-bindings/interconnect/qcom,icc.h>
 #include <dt-bindings/interconnect/qcom,msm8998.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/gpio/gpio.h>
@@ -1093,6 +1094,12 @@ ufshc: ufshc@1da4000 {
 			compatible = "qcom,msm8998-ufshc", "qcom,ufshc", "jedec,ufs-2.0";
 			reg = <0x01da4000 0x2500>;
 			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
+			interconnects = <&a1noc MASTER_UFS QCOM_ICC_TAG_ALWAYS
+					 &bimc SLAVE_EBI QCOM_ICC_TAG_ALWAYS>,
+					<&gnoc MASTER_APSS_PROC QCOM_ICC_TAG_ALWAYS
+					 &cnoc SLAVE_UFS_CFG QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "ufs-ddr", "cpu-ufs";
+
 			phys = <&ufsphy>;
 			phy-names = "ufsphy";
 			lanes-per-direction = <2>;
@@ -1622,6 +1629,10 @@ adreno_gpu: gpu@5000000 {
 				"rbcpr",
 				"core";
 
+			interconnects = <&bimc MASTER_OXILI QCOM_ICC_TAG_ALWAYS
+					 &bimc SLAVE_EBI QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "gfx-mem";
+
 			interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
 			iommus = <&adreno_smmu 0>;
 			operating-points-v2 = <&gpu_opp_table>;
@@ -2276,6 +2287,12 @@ usb3: usb@a8f8800 {
 				      "sleep",
 				      "mock_utmi";
 
+			interconnects = <&a1noc MASTER_USB3 QCOM_ICC_TAG_ALWAYS
+					 &bimc SLAVE_EBI QCOM_ICC_TAG_ALWAYS>,
+					<&gnoc MASTER_APSS_PROC QCOM_ICC_TAG_ALWAYS
+					 &cnoc SLAVE_USB3_0 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "usb-ddr", "apps-usb";
+
 			assigned-clocks = <&gcc GCC_USB30_MOCK_UTMI_CLK>,
 					  <&gcc GCC_USB30_MASTER_CLK>;
 			assigned-clock-rates = <19200000>, <120000000>;
@@ -2355,6 +2372,12 @@ sdhc2: mmc@c0a4900 {
 				     <GIC_SPI 221 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "hc_irq", "pwr_irq";
 
+			interconnects = <&a2noc MASTER_SDCC_2 QCOM_ICC_TAG_ALWAYS
+					 &bimc SLAVE_EBI QCOM_ICC_TAG_ALWAYS>,
+					<&gnoc MASTER_APSS_PROC QCOM_ICC_TAG_ALWAYS
+					 &cnoc SLAVE_SDCC_2 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "sdhc-ddr", "cpu-sdhc";
+
 			clock-names = "iface", "core", "xo";
 			clocks = <&gcc GCC_SDCC2_AHB_CLK>,
 				 <&gcc GCC_SDCC2_APPS_CLK>,
@@ -2914,6 +2937,16 @@ mdss: display-subsystem@c900000 {
 				      "bus",
 				      "core";
 
+			interconnects = <&mnoc MASTER_MDP_P0 QCOM_ICC_TAG_ALWAYS
+					 &bimc SLAVE_EBI QCOM_ICC_TAG_ALWAYS>,
+					<&mnoc MASTER_MDP_P1 QCOM_ICC_TAG_ALWAYS
+					 &bimc SLAVE_EBI QCOM_ICC_TAG_ALWAYS>,
+					<&gnoc MASTER_APSS_PROC QCOM_ICC_TAG_ALWAYS
+					 &mnoc_ahb SLAVE_DISPLAY_CFG QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "mdp0-mem",
+					     "mdp1-mem",
+					     "cpu-cfg";
+
 			power-domains = <&mmcc MDSS_GDSC>;
 			iommus = <&mmss_smmu 0>;
 
@@ -3263,6 +3296,11 @@ venus: video-codec@cc00000 {
 				 <&mmcc VIDEO_MAXI_CLK>;
 			clock-names = "core", "iface", "bus", "mbus";
 
+			interconnects = <&mnoc MASTER_VENUS QCOM_ICC_TAG_ALWAYS
+					 &bimc SLAVE_EBI QCOM_ICC_TAG_ALWAYS>,
+					<&gnoc MASTER_APSS_PROC QCOM_ICC_TAG_ALWAYS
+					 &mnoc_ahb SLAVE_VENUS_CFG QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "video-mem", "cpu-cfg";
 			iommus = <&mmss_smmu 0x400>,
 				 <&mmss_smmu 0x401>,
 				 <&mmss_smmu 0x40a>,

-- 
2.47.3

