Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 254053033E1
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 21:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788123746; cv=none; b=WsvGbURn4Mk8LNfD9mC7CcztpBDrP1l9RhyrHygNYY/xxcn4pTAc+P09Ex0xszhF75Hca4me2W5UxQHdKcxcpEKyUPr1n/TlnLQFTGxQSmvaNBd4Wp+f/fI63cqD6U1W643pEGiFyR15u/p9qWHOVsC6E8hSx7u5Ma2p0tf7P4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788123746; c=relaxed/simple;
	bh=w4b9VTbExigoHXMmj2K30BvMI7E42FRXJyk9Y5xpS+g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pR6vfjTXfVl1Xa8ueG7tiDg1TTYBE9fF3xQw/jdUlj2h58hNOdq5cJ4eB4lfB6BciGD2m+kOmUS2/VxyGVjJVC+AVSHKgFsTpsUcKjiuyZFdi/S+/EelBUDJo7GXY31eWk8WYxwEVjIfvYD19ESZYlwPNnLoYsvFmu4lD+LIzPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lFRPWNTO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PyCmRoPe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lFRPWNTO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PyCmRoPe"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67UJK2n4248530
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 21:02:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EOvaUMLz9RHl7aozW2gM4qTmltGDzdtpuO7IlxZpKiI=; b=lFRPWNTOk7mlv8cD
	PQgTImSUiIUUrZLwyei6nTy2dEmO7QD/X5yKfZmXx+N5gVfVAbQwxYkZ3VZ6/luO
	DqKX7e4vEh41E76CdYiHB5NeDOhR/f6fC/n5pEnThZImBLI5tA9eHTVNUbGrhuct
	3N3GYpE7ceMVmMPQw47QOnrPVIuewbnfIqP7tUQG29EUuwNXwEFsCQYiQMHtx0i9
	qQ5B90PU9Aw9WIpJ0bD4KMgUGCvvEDItsNi/Ecknqqlq6dxHizPBJmGENX6j22Ip
	tUvLNURUmJG5/nJrLJn4ntMvmV3ytT9fH4zqBkX+Yd6uEOA3YVHSeqNxOiFD3eUh
	tqQrDw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbrkguh59-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 21:02:24 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d6fed0652bso37526605ad.2
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 14:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788123744; x=1788728544; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EOvaUMLz9RHl7aozW2gM4qTmltGDzdtpuO7IlxZpKiI=;
        b=PyCmRoPeJsvLhxz00GQeIAn+3tM5DNq0qBTCfI2JnVOHbwWPVdS4gS7wuL5Y1T5edJ
         1+FXflaQaAZJQ8IVCvQitlBWmyHmSodQIhdS+RwO4fALjbZLwwPiaINUx67DP11Qz679
         zo1IIT9CvoBzMhrUTe6cIE7KsQEnYBkjd4PclV4ysRkKFBU0XnTMUMx4S1DPjyHOtywK
         oEKofpIhSiuL8x2UzqruOZeKjEBXnJrQCrY1usTVuzv2tWHKavTupm/xAwMwpG8t35Zh
         brcVepnewoGZsHpQppE57rLimiiJDBm8+IsWahISpIr769/RC+/B0td/nQT17h1pbEd/
         MNfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788123744; x=1788728544;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EOvaUMLz9RHl7aozW2gM4qTmltGDzdtpuO7IlxZpKiI=;
        b=T6z/QIuuyCWFL1sjl5YrFp2UAz1RN5Ism1SWdeXoSnv2eXEhWzoFReVfKgTbxdWSvu
         dIp30wBWAYZOHszv0Bctt+rgiDhlwncmb0fJkoTYfykLc32WPzg32BcnStRdQZeXJ7sr
         Zk4wvj9r+Ae1JvMZpw4gZcLc2WguFfDG0pzmqvdsyIsKFSWu74WghhbqKWoUSQzNU+9K
         QUSUQmiW+XPEIXuMigbjysNKXkHtZZ7DVrHQqJ1JuRrQqGU6wIJlIu952aJ1WB1ihfgf
         X9BqtT+g95mAyjyUR2hyecFj2uUbO6fkYRUO26hI3NemcUpKSdstL7wAtQNyutB/lVel
         Q5Iw==
X-Forwarded-Encrypted: i=1; AKwUvBwj2nUt8CNCX8GKUt4MhwYJ28K84smIfNIp9cGYXfHjxX7nmPxwCMB8fGmpnPaUjupeQF9If61t0rvigVA=@vger.kernel.org
X-Gm-Message-State: AFuF++nGQDeYEv+PiXUn1BAFUoLJURigOTiHfxDCJaui1BJLqDtKHKb5
	Ojx9InQ0frbUprSbY0yjejQqL7yuhqez+B+vHxAjGWRMk07ASPJJOoDK686+UCSlXNbjAmWS7D+
	7fNHl/8+ZPEH8LhgFODks/bgfQIfi3PVkFtnFA4IhuUxZTtNHNnvIi+nyvJiKSXXpLDk=
X-Gm-Gg: AYBFou0woau17MimcRSP85txwC+VXhMKflqpb6Is77BqDAJxdjswTU1QX7Jm/2XYWXk
	Ly5ZBSpt0yiFnBIeTarS0aSVrBvv+SKoQpxs0YlUXvFPZju4UF+fBXl7ydi9j3q1XgbJgUi0KIv
	dF96/Xi7iSCiJbl7658MpLCdwQ8Cd97wHFoOtQBh2GtV9iYRa7cLPAeuEXropDLPh+qWYDwTZxW
	nMbub2fOnxQwxnu0hsHlRVh8RFm6LT/LvtHWjE+gzrEDB8CosRkUY8g7CnO2c21p82FLMAj/MyR
	nmb/GGTmFN9aUcLtRNcwCWahu0e2hrV7Cf4uic32Kxp5cpzZCbLvDPBlZX54PgvqU9AFKVf4GeP
	D9c9tBsmsqiG/DJpPN9SHl4IyJ5ybc/aZQh8Zh5+nLQ==
X-Received: by 2002:a17:902:ce81:b0:2d8:d4ce:9f33 with SMTP id d9443c01a7336-2d8d4cea3bdmr177903305ad.17.1788123743756;
        Sun, 30 Aug 2026 14:02:23 -0700 (PDT)
X-Received: by 2002:a17:902:ce81:b0:2d8:d4ce:9f33 with SMTP id d9443c01a7336-2d8d4cea3bdmr177902925ad.17.1788123743285;
        Sun, 30 Aug 2026 14:02:23 -0700 (PDT)
Received: from [169.254.0.13] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32b49c867f5sm10980013eec.2.2026.08.30.14.02.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 14:02:22 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Sun, 30 Aug 2026 21:02:04 +0000
Subject: [PATCH 3/3] arm64: defconfig: Enable PMIC5 Gen3 ADC thermal
 monitor
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260830-hamoa-sys-therm-v1-3-27108c40fba5@oss.qualcomm.com>
References: <20260830-hamoa-sys-therm-v1-0-27108c40fba5@oss.qualcomm.com>
In-Reply-To: <20260830-hamoa-sys-therm-v1-0-27108c40fba5@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788123739; l=1050;
 i=bjorn.andersson@oss.qualcomm.com; s=20230915; h=from:subject:message-id;
 bh=w4b9VTbExigoHXMmj2K30BvMI7E42FRXJyk9Y5xpS+g=;
 b=OUgfAQE0wG1HTw6RQKQLfu8Q4bTK9xua0eGtRhleYT4wvh9dup99rfGgQClqji4DTBfLB1BS0
 Vxjow8QnltPBdPUsmj1hUbibTuqpo8TS0w7upPjZUlgoNC4ZdGNWev8
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=ed25519;
 pk=VkhObtljigy9k0ZUIE1Mvr0Y+E1dgBEH9WoLQnUtbIM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMwMDE4NCBTYWx0ZWRfX9W2ikEr6otZe
 WKraJCTG1JZVk9AfseO5OIvNVygHdMMKIYkiuJK0AsHjOz7K9VZgRlzj0qHO9uqKRDS+HPbosz+
 DPV+1oWQYtJDcliGOZV+6IFl5oZBp/VyRx8SOWtZei/cG3FdFT2dVh+cQ4OJ8+1YLGA+5+5OTQ3
 UOKlDsM4qvUBqFeXqk5q9Mm23vFSH765gKqENOBZHQFtsVd2czHeyvhJzVbREDlyra9sbhgBSQZ
 /tKbIpX1J84KyrbJOCoNME3lW5K4NmOz+TuOUrOr2f1TnVzs4hWnINrqWgBjicgO/7+jHisJMjt
 FcyM6lj7+LvD1j+G2gKr9IaXHubS9RcTGul/XFMFO1pT/+HVMcrX74P1BgzSe+xQHwtO+VDK6ZL
 D/dmZkpmEAlA/Qia9jVIorM4ybJ4iRKQB8V39KQHOsryMsMUIfWFGY9FdxmAo7cwV2wy8sB3fAE
 /xkatRwxLc29HDT6Kiw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMwMDE4NCBTYWx0ZWRfX0mYU1HITChsA
 l9hjXYjPNvTIOGdQp2sGV41GxinsgBTh2qNOv3s12Lmo3XAbuO8v6+qeNqpoxuOz9n+cvU0yGu7
 dsyJ3tebD4ulI427ZVEgnlUzyHI2j4k=
X-Proofpoint-ORIG-GUID: ToyQix4fxmeBaw5V5TUcOUGfLT9NsY8x
X-Authority-Analysis: v=2.4 cv=Cr6PtH4D c=1 sm=1 tr=0 ts=6a949a60 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=dOedmflVD102KoYFdoYA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: ToyQix4fxmeBaw5V5TUcOUGfLT9NsY8x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-30_06,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 adultscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608300184

All Hamoa-based devices uses PMIC5 Gen3 ADC connected to thermistors for
measuring temperature across the system.

Enable the Gen3 ADC, and it's associated ADC_TM auxiliary, drivers to
enable these use cases.

Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 6ec8d3a69c98..08ff68643e21 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -800,6 +800,7 @@ CONFIG_TEGRA_BPMP_THERMAL=m
 CONFIG_GENERIC_ADC_THERMAL=m
 CONFIG_QCOM_TSENS=y
 CONFIG_QCOM_SPMI_ADC_TM5=m
+CONFIG_QCOM_SPMI_ADC_TM5_GEN3=m
 CONFIG_QCOM_SPMI_TEMP_ALARM=m
 CONFIG_QCOM_LMH=m
 CONFIG_UNIPHIER_THERMAL=y
@@ -1699,6 +1700,7 @@ CONFIG_MEDIATEK_MT6359_AUXADC=m
 CONFIG_MEDIATEK_MT6577_AUXADC=m
 CONFIG_QCOM_SPMI_VADC=m
 CONFIG_QCOM_SPMI_ADC5=m
+CONFIG_QCOM_SPMI_ADC5_GEN3=m
 CONFIG_ROCKCHIP_SARADC=m
 CONFIG_RZG2L_ADC=m
 CONFIG_RZT2H_ADC=m

-- 
2.55.0

