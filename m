Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A77B7356748
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 08:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789894191; cv=none; b=thq9j1TEFWHwwFrQRtJSKBpgJyLPZqNsroLSltxVGEl3XC+bF1hQB07oLfbQjUeLfMtYT6/ApgbTnrfHhv9qEUaXbbJsdqleJKLcyArigTk+QI4tMN0RElnGjib57R9nXltjl49HPGZVWzHXb+lflOitpgX3NAC5I1Br3rXYG/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789894191; c=relaxed/simple;
	bh=K0mrV3SZdbvnKcSQAKh6cACwu2vBqTk7IkteI4rnFIA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Nc7VclQSGOOSiOk/mjLeTi790xHsTHK65n+XG/8cVmRzSQ1EHDbASInxaTxJoDrnCXaHC2l/OP1wpVr3wHrdiR31cRtxmXXyz6bDhuf1VlMxE21nFpK0hjY/zHbdxNKRtcDVqTWzp90dfo5jkiKaqwVkCngKwMfB0NQK0ELfMcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fXTsNg0f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eORNnNbu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fXTsNg0f";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eORNnNbu"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68K8Vpk91242736
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 08:49:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=xe6HhPLEn0w
	3R1ECXKMEXuVbXcw/o/+tTan1PrIOEhs=; b=fXTsNg0fEf0UGZ1Ku134oUxxsNG
	5l9UJpCHTBEfpgFi6u/ASmCg20uiQH3UG+mwQsU/C0NpGSyrwQDMl0ZVSLkg5NFV
	POJgwe2D01ztZ/7qe4Z5I+9C+ONXW8AkakbINJxRyc6vNJ1PFu0G+64eI7tZSLd+
	AimEk5uXykq0pJiZfw1yT7mkZCkCEajbIzibTihjZAqNqfuzu8Ozz/SOYquGLlNs
	uKBKY6DwVr3hDB3dHyGDQT2JJPnuBu/uNh2Y2tlJFeXD+aGuFRuwhs4/gxOWe1qO
	jYyzruQNkcHUXewU4LoQRBFaasBSySStXwMlFvJ8SjrNl1DAplJePSHC8uA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gsjs82j8x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 08:49:48 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39de1f85cb2so2746989a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 01:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789894188; x=1790498988; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xe6HhPLEn0w3R1ECXKMEXuVbXcw/o/+tTan1PrIOEhs=;
        b=eORNnNbuRTffWtLD9QOY8muw8SPIQS3YX2+XXARbr807eZeXyUUGcxW3V8Mb3wUrW0
         pW5OzWx180cVrE4xzJiwVlilelsZqn+exA3u3hviTm6pRx40hZfyIFjeQP/LcbR0p0FM
         aNhZBjaMCp+G7NJSCT0qgRb4qn2V5IS9M4BTJcdr4x2MlGJuFxvLr+ilR45QpdwkGZ03
         gmvfFcQA3dBZ5mNrg9B+DdwLEHaOrYbH9xkVrHJrAVRn1EyBnXcZBnhIjfxQvADp8Qtp
         0Qh99j/JHNY+8O4OCAPdVWN31hRiKnrP5c9ZJRZk3+n50KsNTc1MDOS4H5pLxHCpw1Iw
         WNCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789894188; x=1790498988;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xe6HhPLEn0w3R1ECXKMEXuVbXcw/o/+tTan1PrIOEhs=;
        b=kcRAMT5aVuWCOPK3c6DWq44fju83T42agI2ppU/mChNH7V/Y17WR2D1hefT/QldsWh
         0mMypBRPkGmN6wCD7j4NNgu8j+JxGPIuLbUJp/LiiwRbZNUG1PXMmo5Tsauv3jzzvvRu
         I8VhMCz3yJDBBGEDxlcdmbrZfjNUar+0eraHHdjJirmj1eWe6FDPsp4IMPNwmDboFt6q
         X1++WvNTDB7dNLAHil4ZB6upHAImWX9VScpdRGsbttKiSEOaocxjEbMWVyHUPlDrco0q
         UV4x7w9EMvNU5ytAM34aWcdPAR5jj6stflePDSCfrg3IZ9YK2D32VEFEG/xSmXL8zvFs
         H9HQ==
X-Forwarded-Encrypted: i=1; AKwUvByjLG0BNRDuo0GA/UW0lEZtug1XulDonu6cbxtf6T2AushKXc6qOlGRI09sEIiYPCIpAsp/QXrLYMneSq8=@vger.kernel.org
X-Gm-Message-State: AFuF++lWgvoV0uDMDoCQFHv/ERc9OUMdWsSyYcgykJ8ZoJq0Mp4B11MZ
	BkOKRjx3DM1eaZxFVkk+3Ji7Ng6laybG335hQ+ZgZqQdWAy28TRYzxAqI7tMJj8jooeC20fqnLT
	x4z/lU+4vbsvAdxjgFAZSZNXuhTC+d+GQundS5ICtt8NP4iuGv3XPvRcOXe8YR4ll/64=
X-Gm-Gg: AYBFou1Qy53/S7JSir204xXt6mkEkFeTr8EK3x+M5+sbqXbE8LG/QDKhyCLFYUY+SpM
	X5f6xWd6kfLicChePZqrH+fTy2nSbiN9oJR39jOkhVBC7UJgqU2cxHP0b5GOKoz4QQSXVn58Qcf
	/ln1D7Kxvwa4R2HsHdD2AxaF88KA9tutQSU6GrpSgimveO3N9BQwj1B2o122D0ELPk6exJ1nOJ7
	lGHdD1yhX8IvDtluvN+94oAV2pk0FnhOHu8LLj3zZ4M3N7Ur6zFkmozx8fNotCb48ml+6KZtR17
	d/+kw1UT2bfGMvbv4NndRu8pj996jA4wYkfVde8p7FceWzLKW0Vf/tigmAZo2rQEICfclIgGGh5
	c01zNHXzwPOo4dUK1uqntngVhMfZ+ble0Z96mmQgLYUIsBpCPZbaAEen/3ctF
X-Received: by 2002:a17:90b:4ac7:b0:39e:6c6a:4b6a with SMTP id 98e67ed59e1d1-39e6c6a5812mr5559932a91.52.1789894187611;
        Sun, 20 Sep 2026 01:49:47 -0700 (PDT)
X-Received: by 2002:a17:90b:4ac7:b0:39e:6c6a:4b6a with SMTP id 98e67ed59e1d1-39e6c6a5812mr5559913a91.52.1789894187207;
        Sun, 20 Sep 2026 01:49:47 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c3314313esm11180808eec.14.2026.09.20.01.49.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 01:49:46 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v3 2/6] arm64: dts: qcom: nord-rrd: Enable ADSP and CDSPs
Date: Sun, 20 Sep 2026 16:49:16 +0800
Message-ID: <20260920084920.2201418-3-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260920084920.2201418-1-shengchao.guo@oss.qualcomm.com>
References: <20260920084920.2201418-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: DGZUi0H5d3t5TFiQ2cO3674sFHBrP4yG
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDEyNiBTYWx0ZWRfXxSBktEYm4dEK
 4jdD+hu20E0M3VWq+KYzKva97KZAlGteN8wAlD9nuSGlJGJnoDnwTRjjALKiRhi8xrZJEtKdElA
 bj8aglzzaJa04G/9+NVPLsZqu4YdMjU=
X-Authority-Analysis: v=2.4 cv=YqWa1IYX c=1 sm=1 tr=0 ts=6aaf9e2c cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=UZuJur8GfllDSyYqWHAA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDEyNiBTYWx0ZWRfX2IBC2Q5UDxe/
 ukL+4GIQUjUp53AjfgUnwO+x7NkUF7/o6pu0yg92sQO6V4lXry0fhan5TgoUHoaDL+SyvvpI5Go
 d131bFmSW/EoeiRAkq3+pfM4/1K0mCAG0eKd1A+1bYlgCoPQHe+QEhVYpQ23soVTpk+YlQNwR2v
 o3hSMgql6Rhkp2KDiQh/7Erb76RFKWakSHnnFlGTbXOgGw2LGZ39CbQtjQWtx+QCimJWfuvVXDe
 vcuUC1igtVtCqJVlgoDm3g/4KI+r1Jj8G1cu1ThVchxM+vEFBuMTEFyMjn3ftCD3A3JTjrzqmQC
 Oqu1skluBiIPWR8HGn7psLWci1dMl6AxMA8rBhvcuWOKvlc7+IwLKD4V1Nnl7iGYrJ91weZ66rZ
 dvpbGMEnqXN7fTppTiPJg5bRwjGQ7dH6PVXa/Yopha7kMBGgcOe6gfBYUUWCVmyBrTI5oFuclOx
 mXAaQCi39HCCMNzAt9A==
X-Proofpoint-GUID: DGZUi0H5d3t5TFiQ2cO3674sFHBrP4yG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-20_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 phishscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609200126

Enable ADSP (HPASS DSP) and CDSPs remoteproc on the Nord RRD board.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-rrd.dts | 35 +++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-rrd.dts b/arch/arm64/boot/dts/qcom/nord-rrd.dts
index 3673003c8b21..e4c3aee441c2 100644
--- a/arch/arm64/boot/dts/qcom/nord-rrd.dts
+++ b/arch/arm64/boot/dts/qcom/nord-rrd.dts
@@ -393,6 +393,41 @@ &qupv3_2 {
 	status = "okay";
 };
 
+&remoteproc_adsp {
+	firmware-name = "qcom/nord/adsp.mbn",
+			"qcom/nord/adsp_dtbs.elf";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp0 {
+	firmware-name = "qcom/nord/cdsp.mbn",
+			"qcom/nord/cdsp_dtbs.elf";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp1 {
+	firmware-name = "qcom/nord/cdsp1.mbn",
+			"qcom/nord/cdsp1_dtbs.elf";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp2 {
+	firmware-name = "qcom/nord/cdsp2.mbn",
+			"qcom/nord/cdsp2_dtbs.elf";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp3 {
+	firmware-name = "qcom/nord/cdsp3.mbn",
+			"qcom/nord/cdsp3_dtbs.elf";
+
+	status = "okay";
+};
+
 &spi16 {
 	status = "okay";
 };
-- 
2.43.0

