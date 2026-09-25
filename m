Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C7DD485508
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 10:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790331207; cv=none; b=CEgl5LAMda+svfMCAAPw7PcoHccUuF9C0uCmCQ1gHeI2w9tdoJp3yL2Od8fo0THfPlMx78SYsUmeN4MmrJ9LKJlivF2n0gffqk7UdO1u7LbvkxoUHLpuoXM4HMLMMvkzXBvT3ZJ36UKvIjM8ta6ZTqOLK6+BX3hktRQ4orX08GA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790331207; c=relaxed/simple;
	bh=LRFKkO1seXh0WFGcqXLLFLq4Fhx0lzjzwc7PamPgNvo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y/F8Jo4SB8UcAXHdQxtosuErdt5rWduy+WP76TMzATE65GoVLQAtoB92RpolwTJRoRuA95FFRvSCdXuTOG8u2aTD9fp2r9132JWXHkoUfGt0910HdUYgkHCYcbVIxuuErDudHwgD4HVOu/zrSAE1eRxgJR2Ftv05dd921pGHHP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aZHLJXnF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RE5GcMJE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aZHLJXnF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RE5GcMJE"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P5JLow3628196
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 10:13:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=dYPoHI0AAzT
	qoxz4LyK6sk+OaPF3QC2+Sv89PHOEyG8=; b=aZHLJXnF8H33rNli34TUvrjWO4y
	XKgQ9AEgQn/hVooBk/Eu+pzGhBM1liEY6UNGt0zx3VF6bNU3M+IX6ZShrsto7cwd
	teiJhUjsor5pzE9tZz0zKuVGpK/3u5XG1GmXOEUKeP9eo++DklFDV28NE0wsTLbV
	4JoYyVP9COjhwm/CQm3JYi+Io1Qhvi7luVxtt5oE2bGRJlzqfF+FcGKb2y7hnlCl
	5QDuSqn4f2gBerElOLzjbEHW/vXP/LudQaBrV3Xd0mwt9V+yRSiJLLRRqk40pFSZ
	v0TV3VLQKyE8g2Zy4NeGM1oX6NdIaIpO6QFBn/EBnqMX5MQO21U0zQ1TLtw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwjq38w1m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 10:13:25 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-342138eeff2so746677eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 03:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790331204; x=1790936004; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dYPoHI0AAzTqoxz4LyK6sk+OaPF3QC2+Sv89PHOEyG8=;
        b=RE5GcMJEEqvNPtTfF1hTwBx5Y9YKI+MSNqbbH3Z0uf1Lzf0NkX1IstPEjq5OIDr2vX
         hlawkIKnF+U9OXapagsye/CdIsj01lfAE+XWXT6Fsi+xwBN6TkU4fiVvO06f5BiU9GtV
         2Gs22M+8zPYscAYcuIiCsta4s/E2BaK3Ry0kLefKmFbYZUtmlJbe/KHNE8BSwm4H597o
         xM2rUwJ6LjWQ+AkQP9+3050e4kmWJTOPwM3XciuDIq1iXhfBoNtdMSNEGchwEDY4uvuh
         FxmRy/+OC1dFIqq7SonCDLlsr4elCBkJt47M3b1/H0LuzbezXpeGkfAbUxt9FJjfkjxz
         gbKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790331204; x=1790936004;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dYPoHI0AAzTqoxz4LyK6sk+OaPF3QC2+Sv89PHOEyG8=;
        b=sQmYzpwhaYGbT20QqWjInzmeJ0ofeCdXZ78URPdP2Xdj9fuq64SteHgRRQvsTZJ5K4
         Ciz4uq2ih9N8WrYrZ/A6DexUWDr0nC9H1FYIG6/58eAG5WkeILu4XJRdIaa6uha0pACR
         5HKaaJjepdiOE3sxclkR4g/ToBnITrQhLZxRetiChT4L5kijIc7S24m3yTqTqkbcLMG5
         tqHFW35Ps5ASJFDs5calUb8rTOwCxhm3+z1UKdxWLvICKM3fO0jV8qv9CebUyczykPEs
         BuxTuTiNGqRtb3JKNZcd9u/l/NAW/Nj9IOmWo3MwQ2ZAWwD/yegseC+ZjQxZ+HnK/sHm
         rzXA==
X-Forwarded-Encrypted: i=1; AKwUvBzdibOXSSqBHfxKlLd8kL8bplogHfuBHHzEyf8PGrHRL+c835cXJ7irqVkptXiRSmyxEC5sZs209OC8FUs=@vger.kernel.org
X-Gm-Message-State: AFuF++nXsZBoaGDcijsrGs2FlanTWdybSUdqs7PB5SUpBja4xYGzui9H
	a/2S25S6ywtOeaYZ3sHgLpcfx75GOwKaOMqhhkRXGAsi6g5zP8/FS/Ki+i5uxthmoMHPHq+T2P4
	F+LxldhPvTmVg7SLLGd76Wq2o3yPF76l1sPEodaGKzcSD1KqWWAXxOQOJqH0cArCRnz2Fc4niJ7
	w=
X-Gm-Gg: AYBFou11jZL0qQCH0dpiYI3B6fkztL+B8pIlIdLePdY2imxlVgr/iG6BYbu1qBstBu2
	vWXJ7wxqUmqBXvoK8ZJFDQ47oh8QTaKi3RR0UOs5fb4U3YBsdvuomv5J1y450pWjKAyhwDGhsY9
	klbXlZUVSKMGwKFDUz6vWBxWgLydmisuKz3KO4XftDtCvfm6/fv7/cXtO98Bd2r2RIW1Abh0XZs
	ZkAWpZN/g4p78JdcdkLQ7gVDKeuyUQzAbfulNuJ6N/7GNW4nfQcOFOZ0zdPREbJpYSHWXNulib4
	BuF32eIGXCWHz8U7+SfctV8hqlVH/PgOFVbWiUjDy5QKjY2QnS5wmMOBK6BvOsyk4TN4WChK0RY
	k92ulqSpfYgIdFnRad5uE9TZ7CA==
X-Received: by 2002:a05:693c:87d5:20b0:33b:c758:74e9 with SMTP id 5a478bee46e88-3400449d090mr4722314eec.4.1790331203968;
        Fri, 25 Sep 2026 03:13:23 -0700 (PDT)
X-Received: by 2002:a05:693c:87d5:20b0:33b:c758:74e9 with SMTP id 5a478bee46e88-3400449d090mr4722280eec.4.1790331203165;
        Fri, 25 Sep 2026 03:13:23 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3413fc2413dsm5397961eec.0.2026.09.25.03.13.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 03:13:22 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 2/4] arm64: dts: qcom: hawi: Fix PCIe IOMMU maps
Date: Fri, 25 Sep 2026 15:43:06 +0530
Message-ID: <20260925101309.3826038-2-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260925101309.3826038-1-mukesh.ojha@oss.qualcomm.com>
References: <20260925101309.3826038-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA0MCBTYWx0ZWRfX4RdnPzsmHlD6
 kqhUXAzgGsNwPXTIbWA1gRN6AaouSjnz9V974VBvdWgNnHHystKZXwJt8peYTJWu12ZwZ5R7TgR
 JpkjuMFSto9rc2E0HR6sCY7rm7fvb8g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA0MCBTYWx0ZWRfX+xxBGrzbE4HF
 yD7zcunYoorTFaCCfv1EiesVgw6Gwnipxi4MIcKjbPMo3JfNo/bDK0cD7N5mdggkqCKSdcvT98O
 w7uVeI+1nIKrTZM1TCRVDWZn+OTtEuZCiroTMtb9wHwoJXktdyxKRBq4cVlhqlE2u+1U6p5ImBh
 fsjkQxUO+eJhjUhbmu04MGvc/jK+qxx/ofqUqdH7qDKgb4/jgTQQ+9AFmHOd3iO8iRQRbd/xETL
 fXDf2MCrB5AyrGqNL1kQb34BPjMxweBeR/emSctxiuvL2gvw+D+RM8eWwuSJfTPym3fFUvoFMgU
 ke38z7k+9r9G/XGPT/AQLMOnT3jB5JFTbZ2KuPctAWw7D0s3/3o1tHdqMNp+KnW8bN1k5w+so1X
 FodMIQGRVOyqbcttn8Oiw+Tjcu2d/D+fCrWpnRuvamoOtqJws01SNUIDzTlzc4o+v7beT+kRRw5
 Bb6L/w+LYsOhhQ506RQ==
X-Authority-Analysis: v=2.4 cv=VuO2kO2n c=1 sm=1 tr=0 ts=6ab64945 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=yNTuY5RphX6TMQbXDycA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: B5f1XEwGPwfXSP3gHAo35-TfGXC2wPS7
X-Proofpoint-ORIG-GUID: B5f1XEwGPwfXSP3gHAo35-TfGXC2wPS7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609250040

apps_smmu defines #iommu-cells = <2>, requiring five cells per
iommu-map tuple: rid-base, phandle, sid-base, sid-mask, and length.
The pcie0 and pcie1 nodes specify only four cells and were omitting
the mask field.

Add the missing 0x0 mask cell to both tuples in each PCIe node.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hawi.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/hawi.dtsi b/arch/arm64/boot/dts/qcom/hawi.dtsi
index c7ae8133b9cd..89bf0f59304d 100644
--- a/arch/arm64/boot/dts/qcom/hawi.dtsi
+++ b/arch/arm64/boot/dts/qcom/hawi.dtsi
@@ -2958,8 +2958,8 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 
 			operating-points-v2 = <&pcie0_opp_table>;
 
-			iommu-map = <0 &apps_smmu 0x1000 0x1>,
-				    <0x100 &apps_smmu 0x1001 0x1>;
+			iommu-map = <0 &apps_smmu 0x1000 0x0 0x1>,
+				    <0x100 &apps_smmu 0x1001 0x0 0x1>;
 
 			interrupt-map = <0 0 0 1 &intc 0 0 GIC_ESPI 213 IRQ_TYPE_LEVEL_HIGH>,
 					<0 0 0 2 &intc 0 0 GIC_ESPI 214 IRQ_TYPE_LEVEL_HIGH>,
@@ -3140,8 +3140,8 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 
 			operating-points-v2 = <&pcie1_opp_table>;
 
-			iommu-map = <0 &apps_smmu 0x1080 0x1>,
-				    <0x100 &apps_smmu 0x1081 0x1>;
+			iommu-map = <0 &apps_smmu 0x1080 0x0 0x1>,
+				    <0x100 &apps_smmu 0x1081 0x0 0x1>;
 
 			interrupt-map = <0 0 0 1 &intc 0 0 GIC_ESPI 106 IRQ_TYPE_LEVEL_HIGH>,
 					<0 0 0 2 &intc 0 0 GIC_ESPI 107 IRQ_TYPE_LEVEL_HIGH>,
-- 
2.55.0

