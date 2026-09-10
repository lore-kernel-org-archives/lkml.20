Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C278C4A4855
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789047061; cv=none; b=d+X6w8y2LwXvAFM22bCJntG6xG2IrW+b5X9mIN/5Yfs/e4IX7Nxw0YpMoo+Z7+ZZ6b4cwIUd1zHTV2kKq40tSeCHgfPLBVcO9tm9T1xLuoIfyMC3gTmRXCN3bI0UkQYjkRKrFdTfn6Iz31sYbk36T53LC4Y3/s9m5+EB4RI5Tq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789047061; c=relaxed/simple;
	bh=XqISqFfLEc1XPNkt+ZZkl93gzud5eHypdyciEc4v9mw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gs+8eGM5+/6GTxD5zPz1ac2KUld2kS4bEvBNmos4QCxIGRJDPXE6oJoU2EmWGT9UwhnucRf7yTQYKmOLTVff/fKEHgr5fp6l5Bp6xyJtlA8683UN+c54V3ZoWLjwnYDMabbIrQnt7CvlSBGBAs9+F1zCVPc1UU74SrA2VOINRes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T/6Ss/Hb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OlYsa4BO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T/6Ss/Hb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OlYsa4BO"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AC7erw2029394
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:30:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wO1J7J+9A7mDzAYE6uHLc+XSY3GlhO5Wh40S82NkGtw=; b=T/6Ss/HbYECNWo7Z
	StqgYvdfqkeT9Hf8nfZNVA7I7TMYMCzl4fTIx4Zwk8lRpe/R8Ld+6Vkb+hs+3udD
	OMDlAhBZOz5glqut5DIsd/ouP7eTj1rl6fC8SG6BUkjCiDuMBFMf870mjiCcobYb
	OtNiDgJIjvW3goowo/5hBblLHYzLrCLWZPKEuS4BmcCyn/A6an1kehhMpUWP4GKZ
	66U0fcaMgrGTGqCfcXi3r/y7NODzLYzmJ50ajA+0RwruoRpNcfUyhhDyoCnlUw78
	KxyNgwXAVPyr6gKb/qcQ/8idMmRhJwqAWMeEY6L/HkpUs/r9NwAFL+DXHkp1bl/d
	Od5gIA==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcyhc09w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:30:56 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-6bf68c1c11fso941880eaf.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 06:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789047056; x=1789651856; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wO1J7J+9A7mDzAYE6uHLc+XSY3GlhO5Wh40S82NkGtw=;
        b=OlYsa4BOdYY9lve68hPSgxy0vsc7NttGjqNGaTV9dcJFG4q9/JB7KH7QvyE29gpdCy
         s8m9FaGRrLojNwbEG2QqsgIVozdVp8YdSFvJ11AEW70Apm1W/TT2AmHoxY/o7zak9sx5
         PdobQWjpPfIUfJBjno29EtYuAzEWywvH2m0pAMepqAEm6j72RWKYfYBQ1qeTNOjEqBn2
         6OB7RiMWKK5an0iA6PA2TgyYCKtAiNnI7DNKokuptD7bUcQuWR8F1AV8wtRDjEs7pJ/W
         PxCan81ktjD0KU5ikw0ati6ccKYr5gS9m4wEQImPrD2IMhis+CHTVMkKTWHhvrFvOvff
         SY/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789047056; x=1789651856;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wO1J7J+9A7mDzAYE6uHLc+XSY3GlhO5Wh40S82NkGtw=;
        b=VFwqkfbzeIKrDmBImV5znXVH71JFP+xCOt//qTuHv/xkxoUBT4Z/w4f7Z+rmsn8Al0
         ++XiEL4qe5BvEGqAIh/JL4oHbDSwBknx98jvE7KpgXGFsBExUb3ZyDFjvlhYu1l3ltPv
         cM+Uof7EHaWR+JAXyoKNVi6x3eekwL/7fmH9/OWRrZ0HjabNMirMSwdgtGBqBmhxAyGk
         EK6Mt1kzFQmKAENVuVvbByC1vk4Qm79eiQfW9ZAMNq6WdQ0VXL4wj/Y5AmWJXR6ApQQX
         RZdQXiulXt1eyX9q4HkY/KUr4twZtkl0dm+qqZvCDT3Nq33UvI/1DXuFORqDUaZkTO+7
         dELg==
X-Forwarded-Encrypted: i=1; AKwUvBxUdq5O8uSDJ8g2Lrej1ISnbMFi6Jr3QA8zTAraH7R+ahtVylDcb5k87XRwUA7rr+/0kmJ+TOOtb0uUAV4=@vger.kernel.org
X-Gm-Message-State: AFuF++kfQpOjz8TRm2C4U/0tVdNYe4Yhe/ODGmzaKBquFBuxssHy+bmT
	aik7JVk9B9jOoB4s3uexDHxAPYU3RRiP+eQnt1PrI9uGDguuXkznm8L/EA59lyx8bBFcilcsGO4
	mSw0phQcZbVKiKGJkmIWfWr5b74S39lxNASBJ4hAeA/TxIkhhxZed3FKcon86rspXmbo=
X-Gm-Gg: AYBFou1OsgvQ/QKvUJjMeUH/VrwM33lRsOWd1FCC2Gb/i+C/9BV30HkwEwruz3M2ex4
	0VF4ETJkvnh5zF+FJ7NfQg5tuvKQwxRKOxpNO4/R06xKG96uHDdF5WnJngSrJOBVRaK77Xt6zhJ
	6kGbBne6pYZdmW90nk1fRMaUofs+rxGrBpd2xIuPBBoOwFtNx+tDMQKqSIYMQfgiGTJYaIP54it
	iqicNUDT9QtNqgfgZwy5XRw2ttf3qdQYC8xJs005Fkm64Jdz6JFMaXD3bMY3y7QwLRArTe4XIW5
	G/ziaYUNC+s1vtytT832kkrl97x1nIdtGnIWDaB5TGP8+0xyaTtnVeYgctksUVPEJTbePRiIs0j
	sg+2Z0yMKcGyjyaggPNQntOmMIvuv/CPqQas=
X-Received: by 2002:a05:6820:211:b0:6b7:83d6:2926 with SMTP id 006d021491bc7-6b783d62ecamr20460906eaf.41.1789047055640;
        Thu, 10 Sep 2026 06:30:55 -0700 (PDT)
X-Received: by 2002:a05:6820:211:b0:6b7:83d6:2926 with SMTP id 006d021491bc7-6b783d62ecamr20460880eaf.41.1789047055187;
        Thu, 10 Sep 2026 06:30:55 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-338f7bad290sm21568614eec.14.2026.09.10.06.30.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 06:30:54 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 18:59:14 +0530
Subject: [PATCH 25/34] arm64: dts: qcom: sdm845: Move PCIe phy and GPIOs to
 root port node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-root_port-v1-25-90a252ddbbfa@oss.qualcomm.com>
References: <20260910-root_port-v1-0-90a252ddbbfa@oss.qualcomm.com>
In-Reply-To: <20260910-root_port-v1-0-90a252ddbbfa@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, konrad.dybcio@oss.qualcomm.com,
        mani@kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789046944; l=3776;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=XqISqFfLEc1XPNkt+ZZkl93gzud5eHypdyciEc4v9mw=;
 b=FQfFgZNU6HPEO//qk2F1KQYb+FNX2WZ02MsC9oIFwanstgnRhY7nTmOQc1p4Ka/gADMkliht9
 hRSfRAerlOlByxBl6AfGKaZpJq/MNbOhA8VTZhHbGIT5RQbOoRvLULi
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE2MSBTYWx0ZWRfX9FD5AsTOhdp8
 9R2NP09PHTBXFobQpsytqVGkptbCiP0mmk67sD/lr+Hzj50cIWle0xksJ6C+V5q3o09GSrJfUHU
 PAzlCwtnLgTK7DMjtvTniFqjbC6vp5mg+419ZibErahB3QwxclEDKHbWH4kI9IXOmgVHL8sYcog
 M3VEQGYllGSXvi5OpP+iQQXEG6epi+ECkVhL1/zemOjQt0cfLcS++7NEhMjHeE4GRU829lNosjH
 TiIicj67itHZO427LMuhiICvIGptmVCQB/W2p06faV8UtPYWm76LWD7BivibrccyKpDcF6mu/Um
 kbG9huGj/uehBFNsOZ/Kt8k+KFNcFe2X4a2UTyc8TDIgbolJ6LkkcgsmzBKeOaOsr370U2xWV8N
 H5vzF6QFiKg9LWxTMbxnTPhTEQ+iCaWLct6KAvEFztsGJG24napuYatJw4igUdLesefy3u0WC1K
 E9eTUINMoYIiJ9xukvA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE2MSBTYWx0ZWRfX0UZ34rqGMoV1
 1mjpoafcWaGOP3XWHD8QYgsxTc6QhCuFPtFfH8Mz0E337CO7OsmIMEFVa/SOABULQb3y4BlbanF
 721Swlc/5ON8pz0MqQtsNZIh/rN2ARc=
X-Authority-Analysis: v=2.4 cv=YKgKWhGx c=1 sm=1 tr=0 ts=6aa2b110 cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=qQkGquXN9PvF_GGjQ98A:9 a=QEXdDO2ut3YA:10
 a=rBiNkAWo9uy_4UTK5NWh:22
X-Proofpoint-ORIG-GUID: k32NlWEPhJejZxXviMrLHWkQtteiHh6k
X-Proofpoint-GUID: k32NlWEPhJejZxXviMrLHWkQtteiHh6k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_04,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 adultscore=0 malwarescore=0
 phishscore=0 impostorscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100161

The PCIe phy reference and the perst/wake GPIO properties are
per root port and belong in the root port node (pcie@0), not in the
RC controller node. Move phys and phy-names from the controller to
pcie0_port0 and pcie1_port0, adding labels to these nodes to allow
board-level overrides. Move perst-gpios/wake-gpios from the
controller overrides to the respective port nodes in the board files,
renaming perst-gpios to reset-gpios to match the binding used in the
root port context.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 13 +++++++++----
 arch/arm64/boot/dts/qcom/sdm845-mtp.dts    | 12 ++++++++----
 arch/arm64/boot/dts/qcom/sdm845.dtsi       | 14 ++++++--------
 3 files changed, 23 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
index 3e636926231d..27a0b90d2b7a 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
@@ -618,15 +618,17 @@ &mss_pil {
 
 &pcie0 {
 	status = "okay";
-	perst-gpios = <&tlmm 35 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 134 GPIO_ACTIVE_LOW>;
-
 	vddpe-3v3-supply = <&pcie0_3p3v_dual>;
 
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie0_default_state>;
 };
 
+&pcie0_port0 {
+	reset-gpios = <&tlmm 35 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 134 GPIO_ACTIVE_LOW>;
+};
+
 &pcie0_phy {
 	status = "okay";
 
@@ -636,12 +638,15 @@ &pcie0_phy {
 
 &pcie1 {
 	status = "okay";
-	perst-gpios = <&tlmm 102 GPIO_ACTIVE_LOW>;
 
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie1_default_state>;
 };
 
+&pcie1_port0 {
+	reset-gpios = <&tlmm 102 GPIO_ACTIVE_LOW>;
+};
+
 &pcie1_phy {
 	status = "okay";
 
diff --git a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
index c66df45eee64..0080000a1839 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
@@ -508,14 +508,16 @@ &mss_pil {
 };
 
 &pcie0 {
-	perst-gpios = <&tlmm 35 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie0_default_state>;
 	pinctrl-names = "default";
 
 	status = "okay";
 };
 
+&pcie0_port0 {
+	reset-gpios = <&tlmm 35 GPIO_ACTIVE_LOW>;
+};
+
 &pcie0_phy {
 	vdda-phy-supply = <&vreg_l1a_0p875>;
 	vdda-pll-supply = <&vreg_l26a_1p2>;
@@ -524,14 +526,16 @@ &pcie0_phy {
 };
 
 &pcie1 {
-	perst-gpios = <&tlmm 102 GPIO_ACTIVE_LOW>;
-
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie1_default_state>;
 
 	status = "okay";
 };
 
+&pcie1_port0 {
+	reset-gpios = <&tlmm 102 GPIO_ACTIVE_LOW>;
+};
+
 &pcie1_phy {
 	status = "okay";
 
diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index b1f6782a3ad9..cb7f93b02b5a 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -2395,16 +2395,15 @@ pcie0: pcie@1c00000 {
 
 			power-domains = <&gcc PCIE_0_GDSC>;
 
-			phys = <&pcie0_phy>;
-			phy-names = "pciephy";
-
 			status = "disabled";
 
-			pcie@0 {
+			pcie0_port0: pcie@0 {
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
 
+				phys = <&pcie0_phy>;
+
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
@@ -2525,16 +2524,15 @@ pcie1: pcie@1c08000 {
 
 			power-domains = <&gcc PCIE_1_GDSC>;
 
-			phys = <&pcie1_phy>;
-			phy-names = "pciephy";
-
 			status = "disabled";
 
-			pcie@0 {
+			pcie1_port0: pcie@0 {
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
 
+				phys = <&pcie1_phy>;
+
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;

-- 
2.34.1

