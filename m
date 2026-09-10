Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5DB14908C0
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789046961; cv=none; b=qJmrRsZFEivaae/p3z8lrhEVxia3ZsjPbUENlHOmDAnfUb83wEjtAPzvUDRD3eDioZ0lQRab5TtPS0i8eBcmCzyMI9fWYyRUe/dYvmNkjBiP+eoXeogw+eRSG0ZiJP6FX4mgHTkajijg1tNlyjfLSn4BAaMmSCfLvRXIOHOrd2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789046961; c=relaxed/simple;
	bh=rCRWGJ5b4fhSvg3pyL2eurfsniGd0t3Eomr4jK0pDO4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VGZiDJc+4f/6CUSZJ3HnommCdAWjR5AsvuDSzCRR+lKhXBWxjrFrVkhJUvIBOkV+dIkr8y2mi753hFuyoUaeezAZVZZv/EelWNBGuNeYXxv0mlGY+j0lVSSb4727JRaR4kKfSPJbeSLHF3GEuY3SxSdl7UhjTbqHbGUtyfj7nEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D5BEx+WT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C6oUdroD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D5BEx+WT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C6oUdroD"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AC7mNM918819
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:29:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NIQ8Leinje6c2P47/uVr0dwDyOFYKUIkUtuMDx3JiHM=; b=D5BEx+WTJ3sc2rPn
	qXPpH3IKTOhJG9xhBg3T8PIEfrh43jXykQcmvwM6O4aQQmpraiLDRoxdtPU0I4TV
	MTvJNwxOADeEyg6Ruj5kY7iNOxdA/WoWh5KVw/R93Hqv+/wqRD44w8+gkjQZr2cc
	zWkTfJK1wq9HsRsQ8Pe5NKIt+mtJs3/XVHOyRRWtBfq4dyFN1IQlAPpLbaGCzeEm
	72dOQmosovVAfcF224pVQ6FQ5PWTQEBdDqSZRodgeGCjqKPGDo4L6Jntk5SM4zmR
	xvOFPv0315LFRWoq4nuoMInAmIRrZ1ZL4xcfTxh8uyaC//2kXg0llRgGrdAg+73k
	5I7wpw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcygv1jq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:29:18 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc4ac5feaa4so1781017a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 06:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789046958; x=1789651758; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NIQ8Leinje6c2P47/uVr0dwDyOFYKUIkUtuMDx3JiHM=;
        b=C6oUdroDacL4JisiJgPfA7i69eDzgz1Ks96O/xxklAHOIs+Db9y8/0VQ3UAXF7DUPP
         zoyyL4PCtA7UU97FHiNU2Nn/xGTjNqAeVQgQDrxqMjbmBW8pMd5FPi7QAF+8ec5pniQY
         gYxi85PY2lf5P/QZpBApA+Y9/a8WBpz7s19zhqhuPa5MS8WqNj/dy2BDA0R9EfDXRLCO
         XT5bQk/DAvCBn8BsMQVtmWx6AQk8B1YC3kiSrn+utuaEMZd79R2NiTOOprpluOPjf7mb
         poeFgp0W9SPe6HY8chYViJJW2UGTyt1XbN7nE9cSH0igKfLMvUfME5SlaWGzxCjk1aSf
         nwzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789046958; x=1789651758;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NIQ8Leinje6c2P47/uVr0dwDyOFYKUIkUtuMDx3JiHM=;
        b=p+PXH6rRF6P0CHJC+XkuN/y4CxzxZrTNH8xI1mgxtgdvYqG/5y+gLNPVrNcXhuJ7v7
         GtD1sguGUrM9s707W5be01bRCLgxr8rdp9xeum0Otm11g1hO13QCAX493mpajsxardNv
         J6E4+yDGUZlhhGeSKYRgamYOlMjYG/MGSHl2tt7NhYaAzWQJkIE7vsqCMX/5k9BpmjA+
         qUQWQFbPHh6xmrv20VzdBwEabi5cc7vOwuP+OD9LZF/aZIsXSA7N/ijj366YKMUaJj3F
         k5ttX8dcT4/QwdqDQKAeSdXuVcqu7joHug/i3f1QBJmhP1nU/yA5pU2TcSrCv3/W8A2b
         MS9w==
X-Forwarded-Encrypted: i=1; AKwUvBwYuwdrL7xmSMJeVpvKvjDcZMIULBiITThDL1kr9yJN2pxGZzyE8IeeWVygplvN6yfya2Z1VVzhsMPpYDE=@vger.kernel.org
X-Gm-Message-State: AFuF++l+UaJb8YkaSdPly6HqTlTDxFdIlDfgzRvypgiVuS+fLlqshCKN
	o439g+qLe/Z51/VEmAuUQd2/Y4q0rEYL6/C8XpymvzAUio/c3RXuVsAz5ozLMIARxezLJl/QBXr
	92HX0xoPUbGbKeJ/WeN9mp3dIVemajz+RPYT4JVj/GH6BMwC2K3oFToEW5U9Xx/4Lnl4=
X-Gm-Gg: AYBFou26JTboR/G4+T5MeyER4bnB8p+JRvEpgvbM9eMOi/fhIlqrokw8XxHU3GMSBh9
	2iMdx2RWUMMfSThyOPGdAcngXy9wTAfobi6559FyBbjC7mvRvSrVaskoLP2LpoY1qJUyD5jWllY
	EF0XvOLhcPO1PwW/FwtorLdnKXng+899JAX7cEmjSIvbIPMVSq9ZqeSDeOB+YdAyCWzg07e+8ce
	nMR3v1ITVz6fwLmDdDRMnOkfbEEL3/F4KGmeuDVXpp1dtfyaymNGQJbBc9Y01eQJQK6zOKQ/uMb
	eI2FvLl8vnVNhCHtW/+uo3d0KzU1QfLZCGHN5op02ahKXj5jbs2QRA70/I8SuxGglZxX/QUjYbt
	TTSV9Xt9GiYo4tAm9rU/8cZHjvEL/eRNTVng=
X-Received: by 2002:a05:6a21:339a:b0:3d3:adad:f171 with SMTP id adf61e73a8af0-3dabb2435bbmr22168506637.19.1789046958150;
        Thu, 10 Sep 2026 06:29:18 -0700 (PDT)
X-Received: by 2002:a05:6a21:339a:b0:3d3:adad:f171 with SMTP id adf61e73a8af0-3dabb2435bbmr22168380637.19.1789046957554;
        Thu, 10 Sep 2026 06:29:17 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-338f7bad290sm21568614eec.14.2026.09.10.06.29.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 06:29:17 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 18:58:51 +0530
Subject: [PATCH 02/34] arm64: dts: qcom: msm8996: Fix PCIe wake GPIO
 polarity
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-root_port-v1-2-90a252ddbbfa@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789046944; l=1618;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=rCRWGJ5b4fhSvg3pyL2eurfsniGd0t3Eomr4jK0pDO4=;
 b=QekVz9tVmZRC7RzpzKIRE5AsIZcTyb04IeNC7xA/+m0fE0t/DRSkABdl3mBsNDIgsXQciKvI5
 q0J/krPx6RuA/RGMh25nUduYlsvJoOd4NNfbM22dZyjcHMQfGf301eP
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE2MSBTYWx0ZWRfX0cJfm1kP0aZp
 XJQYNM6tW2gCFhG9NzINv8VaqpllvDxj15lGtBN73k14w9Kp0u27WohbNstYFOEY5+pWvo3U05U
 DYeox04xM/XDnPTEuLJJ3olY3k31TfPeNNa2eWC44h66NKRhlPCyJfUXnH5QK/X0jm9FfpTZ/XO
 +/1D/8m5VwakxJQMVPHxK/QEgvLCPYX1tsaIx9fSCcp4sQObzg5DhOYQkVD0sF5JyoI5idPIUnw
 xV8GZMtzOoZRzBeaLiF4mnwyuNQ0hiHdrua/xw2nIGkC1aJWqdKVXOub6yCowVlE1uelF6jYRYX
 vZWItIEJedMp1WJD+klNuJ7cUg3wZ/MAvuo5hSoJqjCwhODK+1CxXQhjSAn3wOHlaT2LRBd2rZ2
 C6Dy3dYQGnP7/VKkVdf07VLeer1fdsfBH5ZQFZ/fqNST1P6xjRE9BR0Sl+76AGs1hWLgaEMjcR9
 IK/dOPaeaCONkqJ7Ohw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE2MSBTYWx0ZWRfXyKRAd3/Q/+V0
 5hPpfiwvs6ivdE0LHIQ792+4GvMU+jhSduMe8+GPtRJN3U5g9u6GpldBbeM03PmS3kKvmuel0BW
 PLDzqK/ATrHRygGjZFMlzDiK0HJTAxY=
X-Proofpoint-ORIG-GUID: xRgZ-o2hISVfDAWRDyO_xkeC--k7Y0Xa
X-Authority-Analysis: v=2.4 cv=VONIDNPX c=1 sm=1 tr=0 ts=6aa2b0ae cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=_k9ig2nQFDp-gxZIyLcA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: xRgZ-o2hISVfDAWRDyO_xkeC--k7Y0Xa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_04,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100161

The PCIe WAKE# signal is active-low as defined in the PCIe Base
Specification. Fix the wake-gpios polarity by using GPIO_ACTIVE_LOW
instead of GPIO_ACTIVE_HIGH.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone.dtsi | 2 +-
 arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone.dtsi b/arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone.dtsi
index d55e4075040f..5b42c266557a 100644
--- a/arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone.dtsi
@@ -192,7 +192,7 @@ &mmcc {
 
 &pcie0 {
 	perst-gpios = <&tlmm 35 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 37 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 37 GPIO_ACTIVE_LOW>;
 	vddpe-3v3-supply = <&wlan_en>;
 	vdda-supply = <&pm8994_l28>;
 	status = "okay";
diff --git a/arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi b/arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi
index 77ad613590a3..2abcc733dad8 100644
--- a/arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi
@@ -280,7 +280,7 @@ &pcie0 {
 	vdda-supply = <&vreg_l28a_0p925>;
 
 	perst-gpios = <&tlmm 35 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 37 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 37 GPIO_ACTIVE_LOW>;
 };
 
 &pcie_phy {

-- 
2.34.1

