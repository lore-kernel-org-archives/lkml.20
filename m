Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23C3F488234
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 09:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790327416; cv=none; b=XUjvwi8MS9qkk+HQkFC4U2epuna7vXTkXf25qUxEtIKZQyxivttisBYjEeBb2bJkHqT9FQXSY4UhQSLR+pyEKIXu4sTRLN/66A29fBSip5PJkoHxXaH5dLzkavmo7pTi2xySuvSTINRiL+zLstNGPRDYLZxLloroRzvujw+KXv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790327416; c=relaxed/simple;
	bh=Dzpg26Vur2DCvULsTE9E1JAC2Y7NSf6GVeoLlup85aI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lgL+dxbT+R47/SZh8EPEkQo8ECKBH77Wcmg0/Aw+8ErkcWa1Jjhj/TDBXWtswUZrXJ/2O1yuQEieVYjG+ybPN810vGEwcnNgwXROrQK6FXnG98+NpW2GjBLt0JHaIZhwvVp8cOe4rnuOP+bGwUSh/KTCWYKnRjVKB6muHrJunvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VCXfdnzs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JFXYL+eo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VCXfdnzs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JFXYL+eo"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4YpIk208828
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 09:10:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ooijHQlhry9x8ePNW1MEInw6PQc9F5ZMCpXfK0l0qXU=; b=VCXfdnzsBuAxysu4
	O6uJHtTkow49ha/+RPdqHJab41tX5nEczGltusQP0GLq5MsO4Nt1yHTL09vacODl
	OVmcsrgON/EaByj2NDK0DIcw7vhOe4+wHKJWp0aAUKkn8zgXLrlasPU0eNPVvRgs
	rQTntLrm4AmkJTowsjg1cJ14Add6dE6IHzwhlginxV2GxGzY4wo7mXoKyuRz964h
	A46AOhScf3JcRZmV76f+3mlqnJOQKUBxEJ9hgYDuD+mmb13ou8TwgDj/yN96MeDN
	oaDgBBcaP7GAtNIchR19Ypx0UNMVLWTU4+R7ZZ+bKT0pCrcftaEkBJjhPJeCYqKC
	udwEiQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw898tugb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 09:10:10 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-939c30aa9a0so70256585a.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 02:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790327409; x=1790932209; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ooijHQlhry9x8ePNW1MEInw6PQc9F5ZMCpXfK0l0qXU=;
        b=JFXYL+eonL3NXP0P2pMWehXGcBhZT4a/3iDTpPm9fAHUzn2kvxbI7TPWNteVhQzOs/
         dab7ULbyvb9JiHtvb08qc/QUEoQefJsNQc7SXIrHArR1jSE80J9sJCR8ABDmkxPcKkHM
         4GDjmoVYXALxWkSc+cdsWmvxPDCqnT67Odx2Jcgo5xnRU662pVxQDRya2+Yo4ZW7C7Ml
         yefvJURjCJDoF0vo1QsPzro2u3v+zcLxkbNdvKht9BgOwl8ugusla4mZv/OjLNwdraQN
         rjUofeg+x3KD5LCVprFWYSz8FCC40TV5sL8tQ+ZYHS6cjuzoKNF7u17nYUxB8MpZ1zzD
         nxVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790327409; x=1790932209;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ooijHQlhry9x8ePNW1MEInw6PQc9F5ZMCpXfK0l0qXU=;
        b=FSGsDLo1azbUqRC2Q+/BBzx3li8R5aQRrC30NxS6yFpyr67Meq1q3sOtwfvyx2jvqR
         FxrdR84kfA6sQGBXmZYHItOkGXvvukkZVG3vOfIUw/ErBv+NO5D5zvEZ+l4lMo+bEePA
         T570CkKcKcDGrFOw6Lt1YA6m0GVvZiSnpaJGnF4HKgv4CdDzIjQ6DGI3UxuIyg8y6t3Q
         H6CT+q95Bg2N0VszdrrzO4yBYKfBUK4K/JYK5l6pz+JCrY8inXeVbnGedjTvKVZbbKjM
         ts+mYGnheBfXbyGnEbAcv+uTbywhee1Tl82ryn72X4DvNvBKPr39vyovXADHuxlilobH
         Ah8A==
X-Forwarded-Encrypted: i=1; AKwUvBw6t4oWUoSlOAnW1yZaLgVZEUmCO024El0X+DAAf7eL4HX8njl54m5hRrzCqQlumHVJmLPWTkuEikUQrVE=@vger.kernel.org
X-Gm-Message-State: AFuF++nWenXuCDKuQ6L7VV4rXSMzBR1PtCwxKCLCRSyb/nnnQedPlG7N
	M+l9bZlHBXpEGm25s0LIPZki6oTBQcJ+a0a2DB82cq7P4Rq6DFxmX0iIHxfzJWtFfhIO7ZYrgje
	Voz3tYmcDH/m4BW+30FkLrMin5glW8obGTKjM/Mh5uKNy8o3TnsSK8CqLDbSS0w8dJDI=
X-Gm-Gg: AYBFou1TDopRfV319+vmXIAHwUSQ0+3AwBlZOfse6t4AC4LRJyeOsVppNgEj28IFyf0
	75/Vyar6bfH7K0rDZWGEPwnCGOhCsdsLoWraqYpuSk37Rg2Mp5MCNqQnwpwqdYpZwB/bV5xwpU8
	uBcyWjjlF7xhrTrgI9Fm0bt3j87sTpshVc+foac6cfeEKFGAcFsfNGSKp37pQOQqshQFCkwq9Gx
	DoxDWGE0nR/WnP0TXiqFNnTp+RXnHuNIia340aDbB3MHUklD6Z3P3r19zcHfd7NDzBwlhAsla8w
	gneBGC6dBIJI/DQ+egEjTt30KAfq/qQT+S+wpOKQeTQ6cOU9Ria0mQ1xjAc6xTaiZdJI5LywaN4
	mhOaLiAxzmbUSrk2j6epklv55AXbXxi+V/z5CDY0c4L9Z1fdQOeX/tZoBVLzvC+ouOpbnchS+9+
	iqbkLtEACUmzslhF2sdnkTgAmlQXnslyD4b0/t0YAeJ1Sks/hgz0I=
X-Received: by 2002:a05:620a:199b:b0:93b:e917:6888 with SMTP id af79cd13be357-93c43cb6c72mr320195985a.33.1790327409485;
        Fri, 25 Sep 2026 02:10:09 -0700 (PDT)
X-Received: by 2002:a05:620a:199b:b0:93b:e917:6888 with SMTP id af79cd13be357-93c43cb6c72mr320192385a.33.1790327408916;
        Fri, 25 Sep 2026 02:10:08 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:5c1f:3897:a4a1:99e1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a34a638sm5269890f8f.9.2026.09.25.02.10.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 02:10:06 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 11:09:56 +0200
Subject: [PATCH v10 9/9] arm64: defconfig: Enable Qualcomm CAMSS OPE driver
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260925-camss-isp-ope-v10-9-2622411034cb@oss.qualcomm.com>
References: <20260925-camss-isp-ope-v10-0-2622411034cb@oss.qualcomm.com>
In-Reply-To: <20260925-camss-isp-ope-v10-0-2622411034cb@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAzNiBTYWx0ZWRfX+CPvNGZ171ri
 YwontOfh5seTLA7hdwQSNkPlizvyINte6AxjQe7ZlPtbnj1BxH9/NXH6wZuXcIIRPvP0mJOEW42
 Vdoj/gbUU2Gue6XAxj+agWtegn0hA6L4z3eEuIKub6m0DT9d+0jjCGYrSbHnqfPvqOeM4o9arCs
 1zKBxheJR1yTcj7pK8Rb5PWJgC/ZymirGAk9VP+vn+HUubFY4ZsGnnwk4PabMtbu5rUsHvJyZB3
 zrpKz4WiMv2HddlnO5asX10VWPajo3SSlCo7T2cH8VmZibDjndIormP2HRLvbC7bHe9GolX9fAz
 u4nwQxFXD6e73wio+HeDQnAOOMK9XcY7AzMjUVzzk4eAR6jsZ64XQOwV+8gQFsj/uVKlOkb/02x
 OAhovYc/77MZ5P0XtTOK6wQEcyeMP1N/y6+ujGV65WO/Q4dxh6vQy+vKg5fdevlK/aF1gtRKvnW
 gSMB0f7IVSdhfe81FOw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAzNiBTYWx0ZWRfX6v/+rxKbGHDO
 aVXSmjBbPhrKShGFap10RefY2suW+8fk98nk0jxcRBFqp7EPlAU11Ow+3Jg9ac4WtKz5lrrC0B4
 2DjJMmySpVEl108cwb0zbnZQvyXpHZ8=
X-Proofpoint-GUID: vk2PhhX-6aMZD3F-GuFdjo4-w0co9oS_
X-Proofpoint-ORIG-GUID: vk2PhhX-6aMZD3F-GuFdjo4-w0co9oS_
X-Authority-Analysis: v=2.4 cv=EJWTQFZC c=1 sm=1 tr=0 ts=6ab63a72 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=BUwzsxYIp--Ly0ysDZIA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 suspectscore=0 impostorscore=0 bulkscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609250036

From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

Add CONFIG_VIDEO_QCOM_CAMSS_OPE=m to enable the Qualcomm Offline Processing
Engine (OPE) driver, an image processing block available on Qualcomm Agatti
and Shikra based platforms such as the Arduino UNO Q.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 6ec8d3a69c98e0da38465010d11166bb0e058f4a..604a0d58521dd6a1df8718ea3fce28cc727a08a0 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -931,6 +931,7 @@ CONFIG_VIDEO_IMX8_ISI=m
 CONFIG_VIDEO_IMX8_ISI_M2M=y
 CONFIG_VIDEO_IMX8_JPEG=m
 CONFIG_VIDEO_QCOM_CAMSS=m
+CONFIG_VIDEO_QCOM_CAMSS_OPE=m
 CONFIG_VIDEO_QCOM_IRIS=m
 CONFIG_VIDEO_QCOM_VENUS=m
 CONFIG_VIDEO_RCAR_CSI2=m

-- 
2.34.1

