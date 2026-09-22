Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4794A5505D0
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 15:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790089294; cv=none; b=ZYQIgJHLyYLcFj0gQh3xS/I11CT8HwF9lks80vnNHP1LEN/zg5iwtWS+eJ15ZdnIARIeC5uac/rXPKKDFvohyYNG325S+iy7WTfQZJF8Tb858MtV5EGo1hEA9pUtrxtVowaTytMNz6hqVYV1ar1o8kJVus83ky8RI2BcZ+ByPy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790089294; c=relaxed/simple;
	bh=/g92+mFYnO+YPa5p9KHtV5grO9TXBTzmegVOly0cRNI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kacs7dAd4yhl678IYf4aJYiFFVC5w5891muFnshzqthrou7CZsleRrhklEXPo9HMO4N2vqHoGa2PaJHN8SC2QFY2DB7YQpJJN2XV9XKdW8zxQb3C1vlE1sclQyZ77N+Kg3YjeQJPMZip53Xy+0mx1UFMZKFNUO2ptV0jruEotcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a7xr8OJk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T7VVyxQ3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a7xr8OJk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T7VVyxQ3"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MEjdYj898342
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 15:01:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LjPaDZwT2uvy0mTTIjDzFd6v4BDGkXxsUBcSFWcCloE=; b=a7xr8OJkJvpOQC5y
	FI38WQJvUgpInX1dOWUe/TkCsVfKiDSwSErfgLy9As60QgYZNDY/TrWyud8qUcuo
	zakywkPW1gHOzCZWFV1wa+wSZ1Fk7l1H/ywL/mvvkCVQEbsepzivRYT2VmRJvQ0h
	/K85mHVZo43gUWC6P+CeyZJpZBttERr65SuCJT/TD9BG10PURrcet4klEtUPjb/z
	BtlWL2a8fg+2ZfCUwO22GoaucaPToIfuSvZWTvmbxp1IpCTBeoNh5wnUc3uoT0ga
	I17Zn78zYR2TDkhm8XRiw50O6tM2L3dEM5Nr06Pll36ZRUNIEGvWmZbJTMTaJFWj
	aHoavQ==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gueybkbtn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 15:01:30 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5c847f0fe78so1652242e0c.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 08:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790089289; x=1790694089; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LjPaDZwT2uvy0mTTIjDzFd6v4BDGkXxsUBcSFWcCloE=;
        b=T7VVyxQ32ODeKvSqHh8v7b34GcvWrOzCXjyXf+sYbJMQu1l7rcxNj6yiuKtSn/lqCa
         YjLTZEIWXTNgoRHON9Nbyd1ArKrweOZ2S9exhVTNGUat7U2TbfOvcOaj7nQZEEqLRFgL
         mV2p7D1B+gUy5ClEoE7UOdX8qKsmscN8KFYh+EAgMNMa3A4QPJGnFu3xQOWP4nRVvNqE
         SWeQbki5Avqdysp/MbUpDJsPxnqTUxRCSKc6So6zVG40Nh8vo22+Lk9K3O01EG/48m8Y
         kBFMxM3nvD0pOgBTXUn1W7E5hheo6cbLLz5cKoOWofnrY0+sPm9otPVcPHY7p1ULeJB5
         y8mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790089289; x=1790694089;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LjPaDZwT2uvy0mTTIjDzFd6v4BDGkXxsUBcSFWcCloE=;
        b=wR1d6cteQBEnrdT9o44i/gX8XFhmHf3BzFzgTVRWBnSQa6VflJHRWjIeaYNouYgyyg
         /greJ3K6YuFYnIt/50Al3S/cIHUxemEycntxq7Cwj3ZeEIAq566UU4jgg2Yq3tJcWdat
         wNhp4hvSpN8Klq8teUdn9K0TpmXl0FWPYWTx6DsVjpPPMlr19l2j/QAIED57L3rZwSWn
         9j+pMsKpCIBEYgwwStRIEYZMc1X9X6tKihShBfgzC8i2I6NEF+lN/D4DkREcj26zqyT2
         2ftgwus4zh0Vf6b8DhTCCO1SgCLIFRaJ4ZWcX0Cvkj6MR+SaiPt7r/KqAhky7y2fLmqi
         oUmg==
X-Forwarded-Encrypted: i=1; AKwUvBz+S9KNIztFhgATIBhssY/If/SGcNnr1Z1F3uQvHdKTs7zHR14evDgqlEd6+YLOE0klcVddPNSAWZY4b0k=@vger.kernel.org
X-Gm-Message-State: AFuF++lwMVSjYddcbjU0PBNLBBaMgVKVUmcvqiH35kNnG/Wyu//QdsAi
	BPo8QUgdFXVB4E0ILBCHHQcWlkmn1F31h29zjNWJ3wBun9y3TW4ATQzFt0mBG8MPNo2YdrdMg4O
	jRX5+ts+LgWd9xFH3NLypzDAX5rPlleEGDW3ZchwKN7PGQtPO0Iu/mUXk06M100zrUvw=
X-Gm-Gg: AYBFou3XXa+31Qi4L6LQr+OFYCycblMzAbTTGbZ5HmnnXRmWhHU6KdptCkzzYgVZ1k/
	dnvLQ3GsdCA1BIdPjkFJbextaF1UQ0rubqIgpkwoxo8koJSN7ixCHu3HritCEmbfNLgSrqiiTEZ
	1BT9Q2po0kVIkDX70rzg70KGCGNPgCS2PmvPCBNXQEUYrPi9AW0FzzK9/dgmaF8kJXVVYEn283C
	kiQpAhEDgXRbKUq18Y+6sifaTxshqPMRSmEHndMfvmUauzCrfwF67X2pi1qhqE8LyCHdX5M/QWa
	Q31ZMVBry/fKrwcTVxp+yYabZ6MK/LhHKVVcwQE9LUX96LC4OLPg5i5+nmsOmvOPXjtsns74uYZ
	9EQdjV24k7aJCc/2rC0svfYkVvRc=
X-Received: by 2002:a05:6122:3c4a:b0:5c4:4ec2:971c with SMTP id 71dfb90a1353d-5c9e3615b6dmr3037015e0c.10.1790089287301;
        Tue, 22 Sep 2026 08:01:27 -0700 (PDT)
X-Received: by 2002:a05:6122:3c4a:b0:5c4:4ec2:971c with SMTP id 71dfb90a1353d-5c9e3615b6dmr3036951e0c.10.1790089286765;
        Tue, 22 Sep 2026 08:01:26 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:5105:ff9:e148:c440])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-488627929a4sm4504298f8f.35.2026.09.22.08.01.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 08:01:25 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 17:01:07 +0200
Subject: [PATCH v2 1/4] arm64: dts: qcom: nord: Add the USB controller
 nodes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-nord-usb-dwc-dts-v2-1-ba2b39f1a843@oss.qualcomm.com>
References: <20260922-nord-usb-dwc-dts-v2-0-ba2b39f1a843@oss.qualcomm.com>
In-Reply-To: <20260922-nord-usb-dwc-dts-v2-0-ba2b39f1a843@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>, brgl@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3859;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=/g92+mFYnO+YPa5p9KHtV5grO9TXBTzmegVOly0cRNI=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqspg9XpvDIZIVqeLEMZlLeWzFJGdGXoryQqrzt
 K/H6RUQnvCJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCarKYPQAKCRAFnS7L/zaE
 w5mED/sFZI+Q6HSCmNWWXJrSrLVBHTFKsuRwj8JL7iChb++pm2TcKsBShu6BTcGi4qRvdl2H0Yo
 aRSg5COKKerd4/L32IXfq9TMmD4Qrppbbl8qiksOhzmm8kCAr4NwSr4t07+9dCLqy1WhPqmkA8X
 Thnkz1h9OOvI/F8D0kpMCbGl4YcSUD5aLZUyImTz1Jiq+2a3M7POEGhWNdXB4I8oa9D7jJH9LEv
 zDRGVhUEo79b3n/33poPYGT32zwzW+ZV3tVJ7foONuETFZZnNaySP4I4WQVvSNHtCkl2mr/3y1m
 XhwqGcKSfyxzr5zuhr5rqj8U24pVPeMKAcnnTK94puTpMYj8VHbEBGWsT7a90pMHGXvW6YY6+PF
 DLVgj5MEF/vxIgD6JivodjHIFMs8tT/+xDbUAmAaSHfSqj3wywFtnWymTt5nU8zfmPzvxzybWA6
 VGtDxSh0V5LnIwVasJiVsGjLj87Wec+vJtEaGuucoozhgCxMHPMFZnSSc1KqvRL7t7i3sC3pxYh
 J9NyP3EAhqfpBVZh4PBxztCAcoXKtu73Oc21KI9bYkS5xDZU77EDKNig9pPCaOBZm3tHa3sjQJ1
 CW27TDR07hFSVI2D2mZaO6xW5P6EiDHxFP3uKo1syIyx4KQL68kRb6481/GvwAN8sk6RuucIdVi
 AaO3r3lYb4yrrhg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=bP6Ds/+Z c=1 sm=1 tr=0 ts=6ab2984a cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=P8P6MxEz3gILoQB_aS8A:9 a=QEXdDO2ut3YA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-ORIG-GUID: 6xI994aUsHYB_p4ITbNkXzUqtbmR5WY2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDIxOSBTYWx0ZWRfX20Ug60c2v1FG
 KO5aVwjm1mn1OR/HXgBMs/ad4oJmcgYcTc5HGfvjhxSM++0H7kXmRCraSSHg/Jd3DPL2k3QM63G
 qtU9VqbDkRiU6UL7sQv+40LNLkYQQgjZPxuvZZKB8VsZmlX3tOD6VOXJXeAkgolflOa+rK2L7mP
 F2t6ihR9F/VB5AW3Wr6+ic0p/0T0zlWu//80EudoWKvsA/+SM373YBOwc178aDMh6TK60X4RyOX
 KpnJT1cazBL1h/e/9olJhSVx6GOyXXhI9fDxWSWBxXLEW6g+vV0e6kPrSB2yrs9oDSPaVo70E2U
 n2e0hN6A5UGCMkuLbX758BPxqhCL5m7BElPsxaVTqnpafnPuInz8yEfsnVi8dwbzStwIkt3WmJ8
 bnWIW/k5x9lRjtyLKtw/B06CFZgc6tbrXVkR+3u7yirqHBDcr/gbsaeQVtStMWPFFxLhRwY9kwx
 aEUu2eHH5c8wBmSwNlw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDIxOSBTYWx0ZWRfXxpMEkEbwxJWJ
 7XZU9nFvjICUkgGZxlvhbycnbHU/Gs/bsZQ19YRYUisHMHV96cDMT0aSSsLVigIJnTCErFCvCiC
 RNCLlH7zE5wy1Lq6ddOy2OJz6Z9eDyw=
X-Proofpoint-GUID: 6xI994aUsHYB_p4ITbNkXzUqtbmR5WY2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 spamscore=0 bulkscore=0
 suspectscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220219

Add the base nodes for the three DWC3 USB controllers. These carry only
the SoC-invariant properties and are disabled by default. The extension
for the embedded Nord variant and relevant board files will add the
platform resources and enable them.

USB_2 has no SuperSpeed PHY and no 'ss_phy_irq' on this SoC, so it is
capped to high-speed and told to use UTMI as its pipe clock.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord.dtsi | 100 +++++++++++++++++++++++++++++++++++++
 1 file changed, 100 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qcom/nord.dtsi
index 926ccf3bbe4e4d27ac37873245c3871e4a290d65..4375284c59e649312a5e814239e5f91d49f9ec45 100644
--- a/arch/arm64/boot/dts/qcom/nord.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord.dtsi
@@ -1737,6 +1737,106 @@ ipcc0: mailbox@9007000 {
 			#mbox-cells = <2>;
 		};
 
+		usb_2: usb@a200000 {
+			compatible = "qcom,nord-dwc3",
+				     "qcom,snps-dwc3";
+			reg = <0x0 0x0a200000 0x0 0xfc100>;
+
+			interrupts-extended = <&intc GIC_SPI 910 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 907 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 908 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 8 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 7 IRQ_TYPE_EDGE_BOTH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "hs_phy_irq",
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq";
+
+			iommus = <&apps_smmu_0 0x14e0 0x0>;
+
+			dma-coherent;
+			wakeup-source;
+			usb-role-switch;
+
+			snps,dis-u1-entry-quirk;
+			snps,dis-u2-entry-quirk;
+			snps,dis_u2_susphy_quirk;
+			snps,dis_u3_susphy_quirk;
+			snps,dis_enblslpm_quirk;
+			qcom,select-utmi-as-pipe-clk;
+
+			maximum-speed = "high-speed";
+
+			status = "disabled";
+		};
+
+		usb_1: usb@a400000 {
+			compatible = "qcom,nord-dwc3",
+				     "qcom,snps-dwc3";
+			reg = <0x0 0x0a400000 0x0 0xfc100>;
+
+			interrupts-extended = <&intc GIC_SPI 917 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 918 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 919 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 13 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 12 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 41 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "hs_phy_irq",
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq",
+					  "ss_phy_irq";
+
+			iommus = <&apps_smmu_0 0x15c0 0x0>;
+
+			dma-coherent;
+			wakeup-source;
+			usb-role-switch;
+
+			snps,dis-u1-entry-quirk;
+			snps,dis-u2-entry-quirk;
+			snps,dis_u2_susphy_quirk;
+			snps,dis_u3_susphy_quirk;
+			snps,dis_enblslpm_quirk;
+
+			status = "disabled";
+		};
+
+		usb_0: usb@a600000 {
+			compatible = "qcom,nord-dwc3",
+				     "qcom,snps-dwc3";
+			reg = <0x0 0x0a600000 0x0 0xfc100>;
+
+			interrupts-extended = <&intc GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 14 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 15 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 17 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "hs_phy_irq",
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq",
+					  "ss_phy_irq";
+
+			iommus = <&apps_smmu_0 0x1500 0x0>;
+
+			dma-coherent;
+			wakeup-source;
+			usb-role-switch;
+
+			snps,dis-u1-entry-quirk;
+			snps,dis-u2-entry-quirk;
+			snps,dis_u2_susphy_quirk;
+			snps,dis_u3_susphy_quirk;
+			snps,dis_enblslpm_quirk;
+
+			status = "disabled";
+		};
+
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,nord-pdc",
 				     "qcom,pdc";

-- 
2.47.3

