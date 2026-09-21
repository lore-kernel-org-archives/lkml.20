Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B2D94C9E12
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 15:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790005020; cv=none; b=IKpj5FoMR+GC66izwuFYN7vc2CppwsvzI7jkKKrSDSDoQKQNFiOnW09/26lwellRrKChx545K+VoApZLepdM0mM5NYNaZUf4H/G8CLI+Ro5GzMzt3VjnlnMB0kpDXL99Drqy7mqCzjGLIO7Lf/UmGWTifemy9ekya5aMpH84qNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790005020; c=relaxed/simple;
	bh=Dzpg26Vur2DCvULsTE9E1JAC2Y7NSf6GVeoLlup85aI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ElNFh5GHaJtum7oCJiXb0ceiJUfGHRI5440GrD6wt/yaCIUdSgA6QSaIDmtXkQvBjJ0ym0kJQqwbQ9fy6QEz8VCf28beSkVqt6jFbkDcnj+izwu+M1RgN2NYLXZq51GdnhBsTpgA78nIRdsO3tCMebv9CPvw2tjzLTCz/SKtcF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mDrsthxl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G5aONnaR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mDrsthxl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G5aONnaR"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LFA6rF2690764
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 15:36:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ooijHQlhry9x8ePNW1MEInw6PQc9F5ZMCpXfK0l0qXU=; b=mDrsthxlvOiXcuZ0
	5dg3OoiMNx/BPRHwYpIBlUcJeEjqq9W5Jo7G8IIrnO9xEzpF5Aqs3p1b7+gSSzzJ
	mo7zBZfEic7jM10NNihAaWhGzgcR/exiCRV+P/TG94STN9XkOJVysr2sIbXbznHA
	QL755wSV1Bx493o2iwRCF/hOjPd/EN3JncH0FYXAcsQXPOFhQYvo7eJ0VX4H+Kxp
	pLUPIFkRXuTX05yF+BVKCHs2YVTvQH2BvafyF3TrHMgolJGyEBjvKceKQDfzoxmt
	rkShrZYqBI1gd6bYUJCcHlHQEPs/AI952GAkBwCwLJLdX3lY1I0nIlesCH6Xwp2H
	6jG47A==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtt3wu5ck-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 15:36:57 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-97cc46a7765so347477241.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 08:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790005016; x=1790609816; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ooijHQlhry9x8ePNW1MEInw6PQc9F5ZMCpXfK0l0qXU=;
        b=G5aONnaRPaQ0YBZ5zBm8L7Uk9SgemRCmr1fn8d3YiOEJM8moEFN7u0U4PNrfKkGEMC
         2FjyTk5WsYsu57Ii5TY7uFLbkbpIwKG/MXmrQANrfTNf7Epv/u8iA5kH8LGHvkWOmvSU
         ZtPvAQ8UdrcX/9OJTJl2e2X5Lct9/KcXD1O6aSN0NpTQSyIiMBCfyHOggV5vSkWIZr09
         U37V35RqOwpF4lEKcKW0XdfCJDg93ISr1vuq2/2Aus6zHGwfIkUqS4HtVyytq1X8cmg+
         c8F1pOSBsBC4FntRU1MONTWRFb6b/8vj6yFdGzjyTFJEhwJLkdBlTkbEGPajNDt5hBQo
         tEyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790005016; x=1790609816;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ooijHQlhry9x8ePNW1MEInw6PQc9F5ZMCpXfK0l0qXU=;
        b=wkb7dnCKGqD0LYBNWDFG3FcQpproa2ozfsO6WmLNuAelvz3znjokmvsqV3v9ueCZDO
         Bd2K5wzvfxPxsfJW1svi/izWtBBch9ARSLIa9Ci5INXd+txXbPTYVKQlRxfMddwVgwhY
         4uyxomW/d+37hQhjcODk+DYmV0x2yBkUxJ1qGOj6tf18lRaxUc59J38gYjEk23u+RZZJ
         Y8WRpQDCxIvol1SBXP8hD1UoKEDxF9WAPlbvPmuz+Iw1/bM0rot5VAmymUVkPsvs5QF3
         uJx3BEvBbxw8i4J8xla3tv04lwHBes8NDnAaucrM1PNmrmhekZBgBqkJlGK+lIowDicF
         aCaA==
X-Forwarded-Encrypted: i=1; AKwUvBzdbgkDFkXY/AXHoIyYUozkHRMFkrZvW9gu1dH9bpCeKipkRlUpbRjG70GB61ngtqs95hRhbusV7zwT+vU=@vger.kernel.org
X-Gm-Message-State: AFuF++nz88GBFp4yL/Xev1E2zfSXeNja0y5NVimSBB/WSd2oZZozrden
	GEHquP41F3UUqHdbGL12lefw37vmNgWn/hY5GjFNy9oWwq3Kqlicvh8vHY49yWY4xdJYD+W4wN1
	ebPBJCFXLANxSRg5PPaFt3KsJczjjUCgDuaa/630TNPZseNFzm8gFolt3EJYAdGGkomhv22+jqh
	M=
X-Gm-Gg: AYBFou0w6q8Vw1qs6Wmc4H9wCHZud9MbC2Q01uagWscWcNY10B1JOe1eSVTUHSGQd4U
	T3U3Qv7IU9NxaiQWVOSEIaBs9PBgEHyFjNQ2j1D5qu75Y/++KFARohNlSYzjQODYhcSV8Jp7AbD
	TbEF+/XIsC+7epe7TQCKKV4HkMLjQ7nhcO2DT/xnhFf2odMPlfeXGuTBKetQMI6+gVtyc4vDw0o
	3+cDoQIni4PJfBRIzCV2O9ZG9ZZ9iGMetauPJXG0nXHjbLLsSisyUN8ONjuGHyKiBCeiD2O9m/0
	3xv93NtbbZ9vW7+xAsTdDZ6Kbd6+LEORzUgmbeWsK727XIBN7rtKuWB8EFRD4xG1Xxb1Yu1f7Bd
	FWHbIyKcZLx4m/pOQg5FejZSfwIdzifCPmWPQGNJU+w78TY5THx7E+o2048Nqs1YLnYeDJ/tzmS
	+tuPxJkq0U9c2FJAP7nyCP854B50iDgA2bQXOs4rlycxxbLVGS+6k=
X-Received: by 2002:a05:6102:a47:b0:7a6:e302:e24f with SMTP id ada2fe7eead31-7a6e31243femr2983744137.24.1790005016140;
        Mon, 21 Sep 2026 08:36:56 -0700 (PDT)
X-Received: by 2002:a05:6102:a47:b0:7a6:e302:e24f with SMTP id ada2fe7eead31-7a6e31243femr2983645137.24.1790005015014;
        Mon, 21 Sep 2026 08:36:55 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:d5b5:76d2:82e3:e5fb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd07bba7sm231054065e9.9.2026.09.21.08.36.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 08:36:53 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 17:36:29 +0200
Subject: [PATCH v8 9/9] arm64: defconfig: Enable Qualcomm CAMSS OPE driver
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-camss-isp-ope-v8-9-dd1c86a3c8a0@oss.qualcomm.com>
References: <20260921-camss-isp-ope-v8-0-dd1c86a3c8a0@oss.qualcomm.com>
In-Reply-To: <20260921-camss-isp-ope-v8-0-dd1c86a3c8a0@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDIyNyBTYWx0ZWRfX0eL3mPJ5Ourl
 G587+zLWlpaEtHBIZAc27qE8GEvAM3G72M8bIfnhI2MHNlgVmSvH4QUecb8HkG1dBTPnJcBOpcv
 dFdhKOLzRkylfc3+pIJYGOzG76TTK4WckayOAq7qFqq8hcauoN4vgezUgAm+8MV1Yc28OGUyZd9
 +s4aczS5jG7O8fufBOYSAKN7iLkQN2GLL7Cy6um1AXdFV85rw/Q2kN6c5OZSc43RJ83/6OxJlhY
 ICwpv2/lGcGFdYoC+XDDBQoilFd+XmUZbYvheoT6w9SRdFwKlcMbEzTZkf4ENRWkWrNVj+6vi6s
 sNx1bve1L5r0IQzBPjbC/HdJUR8GdP9TgOk6/RaUba4VC0eC7K6TKjBnu8G6KtQSIT+u31OgCtO
 gNJUiNIhFXHSIHYH+D/KupMJg2kmgaLz+kbStdx018MbPVSRR/dEsxJqroox6HINJFlTC//Fhl3
 wsmQFM8CFKrGgsvhH/Q==
X-Proofpoint-ORIG-GUID: gbXFpflm_r5Bw5h58ifCQjnOs0JlVzWC
X-Proofpoint-GUID: gbXFpflm_r5Bw5h58ifCQjnOs0JlVzWC
X-Authority-Analysis: v=2.4 cv=dakVTnXe c=1 sm=1 tr=0 ts=6ab14f19 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=BUwzsxYIp--Ly0ysDZIA:9 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDIyNyBTYWx0ZWRfXztq+YUhfoyrH
 iR6W5wyqXWioo+CBDmGiajIf+jL/d/Rv8sxJDJr9XBto5AjsQhy5Kq5YrL4PW94IdwLY7idnKDJ
 0hYsGOLNoc5ESTBUI5SM4EZuhoZMNO8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210227

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

