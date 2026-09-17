Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A639B4E2365
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 12:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789647957; cv=none; b=ssc2ldxgY5lVrZAX6foPhSEzqzmCliA2tDvOTuDO2zliqfPQGp1Bz/+CrLyl6eM8R/YGEJDBWfDB4tZdBjoMWfJ9zQgyYmr+PXLUCi0EQPGnGWyAK/dLYYwox1wMYIYpjJfPtQse7i08kgepCs6mJUogpCPS1WEr48AfCUnW6dQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789647957; c=relaxed/simple;
	bh=wsoL4nEIAJ6nsrtXPaie/LR99cvgCumfdGmB+Anekls=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ouf/OeWcQBzeeHJJOrPpmSeBeeECXBh0xCkRy7ti/53lyS/u0WSew7wgxfAbhI6XZ6jkRggBH9aeHR0yrQba+zIihgqZduIGoGm5lBP9f05A6hiOKUrNkjUsq/7mEcpA8Hpr0ZILlXzpPFTQrq2Vi+bOCDphCMHraK7xNi6JPFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=paBXPwL9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TpsBgMGW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="paBXPwL9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TpsBgMGW"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9ZbwE612951
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 12:25:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3sBpENGMFchxTspN96ZFY9T8fU/WviG4LWoRDeRi1lY=; b=paBXPwL9/a0RPdKj
	lW1jgzSkPzaI6TFud3AgM57NbU1BIZgpXCBkMBgKJ/Mq+TJKY83XZ4fVzifNKE47
	pNSj4WtQI5f+1zHyxAm5vWYT5xfoVOjGTFnWt+0f7/8mdW7cOVOfe67eTmmS0QlB
	cu0chgfnT6u71l9keMKJ/2aDyrwar0ehivbEeWMujDgW6/QFC8jhtA31q6I48hyq
	lGzwMWdz/UpYLFyCvigAMxEZYBsO7rc/tS2bdTkb4ENjg56g2avnVHa+UDhoKPrU
	D3MB9/hx1iLFVlHzzuG4dOM1TWb6lZuXFZMVgswugK6NH6VAgfsdFxh2i4pvq1Pr
	6o6m4w==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grca0s26a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 12:25:43 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39d865b11b4so1102210a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 05:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789647942; x=1790252742; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3sBpENGMFchxTspN96ZFY9T8fU/WviG4LWoRDeRi1lY=;
        b=TpsBgMGWfyLbeF4+w764XZjEnxwYPPJfLAYXCLZsdPi5GbDA+c1i1+S2xkckIzyp/1
         65YavDJjC7a6s8lMNhGwUzqKHk2w+K05YaUjSRGQ2Fd0zy8wYsDr1NJn7lCf/CxV1mdD
         9D93m4GT7hQrZhJHRrqMDQRLs3U0dHnJBccJE5FvjKlPd5Mk23GpZSZf3KgWHDPNm1CV
         dlRdVwNb2Rm8L+T0wdUDA+jmiP1F2khfCdbUHTRqe94xrAO5XebeR8cMd7KI+zOjIr6w
         YoP7HXRUeha1UA1D6Xr+Au2KZ6MuwKxuRuO4hVsp2x/ZM9X6DBSVeHkfC3It2eci7OUH
         y46g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789647942; x=1790252742;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3sBpENGMFchxTspN96ZFY9T8fU/WviG4LWoRDeRi1lY=;
        b=IC7wIwj/Md4/au+YxgsQoj0xIqOC17yYwCFsEPWDBy1S8d3+/JrS58CIU7/Z/zwX4q
         lESKWwlQK3Ptvl7HLnnMFfEmekygubS3Ou84ACPBJV9SUA3u6NxaSGTZrHDJ27KQWMLL
         nomM0hqBhKwdmJMCOOtPAoOlmxnXk8KKlXCgP4tmW7BXeRMntws1ZT36EQxFJf7d+etz
         XPh40Y7XbMebXipFoXCTJiiX62aO+7CjjUmocwnI1NXNDNosx4oP+g6BENMHPUdGYhJy
         0NZy7+Vcj+OrwaUGaGNPD5K+/lgSpK6XpPzQ78NboWJ8MdFOxieIPbFl3NSmdNY3eait
         DEnA==
X-Forwarded-Encrypted: i=1; AKwUvBwpZCLMr5knDuLdJjNHkHpjwqRJ7c6cgOjuAH8oJJQI6w0+O0N1m/MpBPcfBgXtmjWdPS+mVv00vAlUUA8=@vger.kernel.org
X-Gm-Message-State: AFuF++kgeVLuEnW7Nk7/lCQrSudkWBE2zOgGNFqPycWTbu3y1+rfkpob
	JCTZvlt59WJut9Ec6eNIs90iK3xzNVe3K8X1jBFOMzddiGJ+sn9r0veND/KG6Ll30XPqWcW1m8j
	i6wKp0wJHm561c2+IrfJ1wBdQ+K099PgsUSSbsYGjHH7DZu3oG3KqrR+k/NTvUeTVLPg=
X-Gm-Gg: AYBFou2Nr07N05J8cuTfmm2qbalQjMj7gbb3shG9+3AAAQB9DjHyMz3JNRNSdsM+eqT
	gMdcyB+ydgzk2sgdSLT9bvCNWDoDeBtHFMfLHgIPlHuJjJQSyNn1vDYKC8pxwYYwR4voLTdHlXR
	hjWdL9/NnJ6g/Te5KtGYyH3lXv2eHonNlJAhzenAF7goFa1X3s4x+fy4NossSunzI/grYKDJfAg
	Ql8dC5KctZ+9/k3j7ZBnV20d5ubmeyQSSydOQXGB487+pb+86p12S2NM56va7VAs5LatsYgXCoO
	R61vGnuiTC/zK33gg4vBYlB4eySpOW7zCbrsjPA1t1sN5ylGLghbc/DOBKquzyDfrOA9CBS9g/h
	6V7/8PFljoCb30F/Gikn1x7YX2lGp3f6kK4c=
X-Received: by 2002:a17:90b:1d44:b0:39e:1693:c3c1 with SMTP id 98e67ed59e1d1-39e1e4c8bb8mr14729506a91.17.1789647942189;
        Thu, 17 Sep 2026 05:25:42 -0700 (PDT)
X-Received: by 2002:a17:90b:1d44:b0:39e:1693:c3c1 with SMTP id 98e67ed59e1d1-39e1e4c8bb8mr14729442a91.17.1789647941627;
        Thu, 17 Sep 2026 05:25:41 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5a6a175sm16380968eec.9.2026.09.17.05.25.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 05:25:41 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 17:55:16 +0530
Subject: [PATCH v2 02/15] arm64: dts: qcom: msm8998: Move PCIe phy and
 GPIOs to root port node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-root_port_v2-v2-2-6272b7caae9a@oss.qualcomm.com>
References: <20260917-root_port_v2-v2-0-6272b7caae9a@oss.qualcomm.com>
In-Reply-To: <20260917-root_port_v2-v2-0-6272b7caae9a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789647930; l=1566;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=wsoL4nEIAJ6nsrtXPaie/LR99cvgCumfdGmB+Anekls=;
 b=AXq3bfs/uk8yxo7y5nQmGz7DDL9JgJguq2IRhZYy1U6hAAjlJbJ0yniLEOCGJYPGUem5bNJ9j
 OkGSJ39yxWoADMgx361Ma06KZdtuOHQuiBt1+xH39E22bdECDV76Zk4
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: L41zIUdeQ16So5Z_reZLTT2ApNn8MDpv
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE3NCBTYWx0ZWRfX3HLtkTjWdiU1
 4JxvCKw+EoNa/weA5X6pdIOEFR73DwhZqHnlY0tlel7lJ/e5lYCVu/EglA1UWQ7sJQ6sFzoHUiD
 90e1P0P9YWLAoUmUL7qIDvH4xzqAWdI=
X-Proofpoint-GUID: L41zIUdeQ16So5Z_reZLTT2ApNn8MDpv
X-Authority-Analysis: v=2.4 cv=dOQzC+Zb c=1 sm=1 tr=0 ts=6aabdc47 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=_k9ig2nQFDp-gxZIyLcA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE3NCBTYWx0ZWRfXyOFGIgNs7JpM
 jwd7b8BBBKmw9OedJzv99mSsHN36t3DtP+ZNDKx+TjvuKTvWE2g4uFEL6/jEmAXH6hdXg981eqk
 CwvjoS5D7jCVslbedD8krNjYWf/6u3j7M6Y2uhNu5JZVXBBE95Z7sWjYDUwyzQo4LMpa+Y7F0Hb
 O3zr835Cmy6w8LO1GmTgqXAcJLjVDu55wCGqXWw632d13nujPhq2itiZ9cnK3qxdQjk197T9/79
 UAd2onczZbQCDyhAgCJJq8gGhMwSSC2sQ8ieQHip7u4xsezB4qjh7PF42aedZjemE0DcJZxvbXF
 ekcigoNGQbJcARj8dIJBiBKSME11DjNtNzmsPnPXvenf40H8CohSi31AdewpDyDEzSkP6QdZ7BM
 FqJ5GliiGALaV6sl+4OiKUnKCpkm7mJC8s+6bZILY6PyfK7zBJXOIVtcuaOV0jTTzPdnBtRElY5
 Odm8R4DMeAC2wuAaxdQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170174

The PCIe phy reference and the perst GPIO property are per root port
and belong in the root port node (pcie@0), not in the RC controller
node. Move phys, phy-names, and perst-gpios from the controller to
pcie0_port0, adding a label to this node to allow board-level
overrides, and renaming perst-gpios to reset-gpios to match the
binding used in the root port context.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/msm8998.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index 5038d0009c1a..bd8b69e323e1 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -928,8 +928,6 @@ pcie0: pcie@1c00000 {
 			#address-cells = <3>;
 			#size-cells = <2>;
 			num-lanes = <1>;
-			phys = <&pcie_phy>;
-			phy-names = "pciephy";
 			status = "disabled";
 
 			ranges = <0x01000000 0x0 0x00000000 0x1b200000 0x0 0x100000>,
@@ -969,13 +967,15 @@ pcie0: pcie@1c00000 {
 
 			power-domains = <&gcc PCIE_0_GDSC>;
 			iommu-map = <0x100 &anoc1_smmu 0x1480 1>;
-			perst-gpios = <&tlmm 35 GPIO_ACTIVE_LOW>;
 
 			pcie@0 {
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
 
+				phys = <&pcie_phy>;
+				reset-gpios = <&tlmm 35 GPIO_ACTIVE_LOW>;
+
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;

-- 
2.34.1

