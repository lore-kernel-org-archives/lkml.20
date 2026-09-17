Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E65A14B826E
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 11:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789646103; cv=none; b=ZzqSP2JaeSQBViIDg+MbrAaM7f9aG2Kae/ojS/QJGsjfq2/rdAhqJRi26WWWHjX/bA5F4QGtduMUN7lw5TfWscUrH1BQFd46EnhKlWWIZ514uKAOHbO8e1uwEHrNToWYd9IiU4wBZEd45XNtxh0o3MposcfwwKFng2yJcTy9Zrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789646103; c=relaxed/simple;
	bh=rCRWGJ5b4fhSvg3pyL2eurfsniGd0t3Eomr4jK0pDO4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KLExCOUQGac3FE7iw+im+jyBN2830T36akac0JALGFIb552QuEJlCahFISGqqeaU1AytwlNSV9C7wgBDmm6/BdRb0mLvJzlMcEKGXImrqmGg7iHeVcjVF0nThkWbrxn6CEa9YNGAmHwDdwv3HqUNduMYDgeFR+/sKbJdYA+aQW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o5e/S9p+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OBQiweQV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o5e/S9p+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OBQiweQV"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9ZkCB746693
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 11:54:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NIQ8Leinje6c2P47/uVr0dwDyOFYKUIkUtuMDx3JiHM=; b=o5e/S9p+Ql9mHY1d
	+Hq/W5uaMCZh6srksuDd6JtbWZ3lkBMSH2jH/3k7TzuSRrQzjI5EVgwxsWq0PoWo
	6i6AypqeptXJfYWLbSO+m/Jf0o9+GZMKfDCbXcJK8x7yuhE8GrB9xPy+3PnxPkzt
	d0K8/fPE0n7LmiPffdzM/2U+135gzyGz5LntTm0lACt3CvBuVgv+nNjL15auVqAw
	qQPi6h6bDPLxI1qCsCrtFrV2PYo4Fc8YR1dr4zhY83FzK4W2mQ8hUAJz7gJ+JmsV
	mp71iQsIgYszvZIo96I1zt2jA70lHEBCL/RSXNNRrr3g7o5FT/CrhhEHMCjDPr5I
	+RiEfg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grcra8t1s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 11:54:45 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2db8e9fe9c7so11122195ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 04:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789646085; x=1790250885; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NIQ8Leinje6c2P47/uVr0dwDyOFYKUIkUtuMDx3JiHM=;
        b=OBQiweQVv8z8t/N2S8URS5FWzkmbfszFkT1NMCVKSVrGlNbFtceWI8bx6jbduGa1lc
         rJLrlp6ReBBDuUWad9xFTDAZ2klox++6em+Atg3Vjm4XUZFuLCvUlxy5K4MyDm53ub7t
         Mdi/ByWpQbSMKdFWD38AJvG/4au3q+SsZfrOPF0xosa0ZAFa6OHxTKg4I/RifvRe2F8P
         sJ96L9712Fv3asyaURtAJJVxTjXcql8cn0JWKaESa+XAHd5/tiFnPMK7fjwztUQwRz+G
         OUk6dwn89Sy18jtRHqL8TpdHYpgBjpwsuLHSpKlzuesSEcozJkB1FokOCiDt9ya8FkBE
         tjsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789646085; x=1790250885;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NIQ8Leinje6c2P47/uVr0dwDyOFYKUIkUtuMDx3JiHM=;
        b=WfFFnU1yovD2fM2K2EEhfO+gW4d6bqU4xgwhctKo1iGzV35a204zP7rVKgqOoUqAK1
         1gpWrhTYSAiYAJMSfg0+dT35MiaS356TpbHDcJyRoUE6nqR26OusgYy9XjD10e0PVU1u
         UU0M/QC+vLXPlnpv3aI3uc+GX4jMlrVcbvg6RTCSu8OLNN0wuC1vcORsPiuq2fFEV+oT
         5zXEKTy5Vjx1spA9uGT2Bj4h4t1udCXzyYxo6wWsh3LIi9Y4WAX3M9zSWJxjUv6ykW5c
         YXU+YxxpVIwZbyyeohKhUKAI7gLnPX11xrBfzfeQb8VWD79lNEO3LhBR/vRGsQ3d6Rgq
         pmPg==
X-Forwarded-Encrypted: i=1; AKwUvBytpffwpZxTVABMsQOrgU1PC0ugnyA3exwFqvnQkTkJiiXaopTwu08XYuXB4e+KCSubpislyj4E383JCyQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mqwJ4PhfpHj7FeFly/dluFWdUqaWD8mUxbz2cvEW95UgYKHKl/
	ZgdKsJQCKKouQ2XA7Zop96hVfncHPjpZHpOp3VgIrVdHqFB+baVPZAau12WfPmh2nDkkQmhf9GZ
	BW2hu0VgW8Zws7DylS0/bkNdPwOxArQJIFGvXRrB/PN+UxDt4ujdov+OFw0N+DCQctY/K8GZxsG
	A=
X-Gm-Gg: AYBFou2RbChEr1C2bQgO/9ngWjH5ovR18UlcY6Ty0MwFuiC4LoS5HvD6pWDNp2UiUcg
	Vl3bTg6DUq4EB9uo8mmbqZ6qGJmawaR+3FGl5xthSurVWSay9GhfEXyc3vSJ3wAoA45eZhkOJjg
	rbcdoXnnm7Lt2z3AslJFn73BWpdBbwLBqL8jQ9XxM+GPZZNHK8UlBpp5Im5EhKRt8jJ1QXdKbmR
	GQgkbcIzUnTh7gSNed6DsWJX/0/TR2qlMyBHxGlsS3hYSXzp+hPEiizpv6w4ChGp52GQDFtYPWI
	PHllVCy6BTGcoY19D7WEg971dpakWIdziad/qx9UnqTcfdgAqBG1p7FQiBgyB8ICss/pVzWAwwC
	dX4BS+zvW+IHbRW5HH7/zOvrw/a/W8FCyAA==
X-Received: by 2002:a17:903:1b67:b0:2cc:6018:f030 with SMTP id d9443c01a7336-2dd8e51df8amr141022365ad.14.1789646084768;
        Thu, 17 Sep 2026 04:54:44 -0700 (PDT)
X-Received: by 2002:a17:903:1b67:b0:2cc:6018:f030 with SMTP id d9443c01a7336-2dd8e51df8amr141021835ad.14.1789646084305;
        Thu, 17 Sep 2026 04:54:44 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf596e1f6sm18249500eec.1.2026.09.17.04.54.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 04:54:44 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 17:24:10 +0530
Subject: [PATCH v2 02/18] arm64: dts: qcom: msm8996: Fix PCIe WAKE# GPIO
 polarity
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-root_port-v2-2-0d627d0856d5@oss.qualcomm.com>
References: <20260917-root_port-v2-0-0d627d0856d5@oss.qualcomm.com>
In-Reply-To: <20260917-root_port-v2-0-0d627d0856d5@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, konrad.dybcio@oss.qualcomm.com,
        mani@kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789646072; l=1618;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=rCRWGJ5b4fhSvg3pyL2eurfsniGd0t3Eomr4jK0pDO4=;
 b=yuYVnnpy48NYkM2nnKkvp+/KUlxlfEtskYX8ZWFczZbA66m8P0z+dumdvgOoLmR9V+xpcUqDD
 ONxl/4OpGdaD3JE0odLyerqLaqQ/5UTNKaIyzk5T1fZn3V68dHthx4g
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE2NiBTYWx0ZWRfXwtaoNlSyY/mK
 UYI/uuD1H3bZz1YBlEFOxl+JhQrEC85yTD6iMyRuR/nCAXzEkekYC5zrUQMCwnNnvNcpe3Pet0E
 vxJHVuCWPCi617uLwcd1je4jdfDCuqM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE2NiBTYWx0ZWRfX0WpZwHjkqi+3
 PghbN91hJyD68kn1PyL2b/o2u8dvCKNYuN/i578T4gPE3apBsVY7YsrEfZDOUXep21LnFtqC3HV
 PqN1kJr1Q9xuQErWkzSBk+SIJ42mSeRguBf+EkjUpikjTqU63BTyQoi6PlcEB84SkDy7njhfRi9
 1ezoyES8MXU0WRWgdN5v1QfMxJBKkc79afeC5kre7fZcsqpbBQrQZsM2pDSbBCE33kiKFT11Na+
 rbP16BJ1eF52H4GPaHpp5olThNZwTP2WjPfR3vOJT/QcrFyEV9EDA4CgzjExSHH6cTDxqKwETRb
 IR1k/sQZaSRNOcKyorKSvKz037PUB4CsTvTnPj3ArZoY2R0O7CjmZSGXjTGHqRmVQQBd5fQSM0D
 87TqmMf+NkAaPoYX5d5q+050Vb80fbdXPWl3LspO5PB4ilJm5wjNPqFF6C7KkxDeP/3Zejxbf3f
 broMxyigtRB2GGtKxwQ==
X-Authority-Analysis: v=2.4 cv=WL/qzXsR c=1 sm=1 tr=0 ts=6aabd505 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=_k9ig2nQFDp-gxZIyLcA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: lKA7eq8bT2rDibSHg62pmQMX3AitAT4U
X-Proofpoint-ORIG-GUID: lKA7eq8bT2rDibSHg62pmQMX3AitAT4U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 malwarescore=0 bulkscore=0 phishscore=0 priorityscore=1501 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170166

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

