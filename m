Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3481B3B4EB3;
	Tue,  6 Oct 2026 07:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791272847; cv=none; b=GMnCbLkihiw7oqy8d+oyeUe8HG8eB06PculUBVc9BBgeTEJ4NcBtoMMnXPUENh1G8CP7VBVNWeJgMkE5UEnU58O7bgetjMg9U3aWP8Pub+aPzwP3EPSuP9XkQDKLvFno0usgkwl/0mr7qtBLOb5gAB2LmpeLjfL0WWc0YgjsESk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791272847; c=relaxed/simple;
	bh=5n41UlX0Hwu0YCMniEcrQzbJmyM2TKLytzh4M+r0z6c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AFDawejxpW+eTy1YiaXBZcx5qaSKtBA+/LyBVk1dsU5zwHHCRKqqeBRfc0nfv7/XhIKEC4x018ukPFRsDwnnuNjL9lJeLdJL0UYoz58sYBOvW/WnGYhgUbqmD7wOEcH08Tb4TnmyBtCf/jU2HJ+H14RAKfJSxHM3Nzp60Pulu3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gpPGiNlg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gpPGiNlg"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6966gkNM1045705;
	Tue, 6 Oct 2026 07:47:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=4xQ0kBTVgjh
	pG9vmW8LrVju4C1Fkdysls0HaGWoKaLY=; b=gpPGiNlgnv0YLW5DAE1LbKqXR60
	sJaOTimpudU7mBshSgLa/C3730WCYkZ55HnU2Ux30/nwC+Aefv/8tGujGyvLaZeu
	3DQVeGd/2MDTg4tDEX7AZTfih6jKbgThNMr2g4ewW3mqRcrH/f7NKE7XMxvKzomJ
	FhSsi73H/zYuaAbEtQ8f8GPX8vLO0wbQleXnXQ7TCzMc/WHe6TVKnHL/k7EzpDCu
	o1j4OTKxQvHbeyBKnAmDQVJqFZLpB0fkqiuqYYqLJoP/rPLUzuUXQrPg/nvzalSd
	7YSRlfH3ZDmImIHu1Femp9wiSb7dymFEsyLA3Y7QR73OkFU5t1LMmgxgedg==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4uy4g7gf-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 06 Oct 2026 07:47:16 +0000 (GMT)
Received: from pps.filterd (apblrppmta02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 6965bLeF411419;
	Tue, 6 Oct 2026 05:37:21 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 6965bLrS411391
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 06 Oct 2026 05:37:21 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id 30E02643; Tue,  6 Oct 2026 11:07:20 +0530 (+0530)
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Subject: [PATCH v1 3/3] arm64: defconfig: Enable Hawi LPASS LPI pinctrl driver
Date: Tue,  6 Oct 2026 11:07:17 +0530
Message-Id: <20261006053717.3455143-4-prasad.kumpatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261006053717.3455143-1-prasad.kumpatla@oss.qualcomm.com>
References: <20261006053717.3455143-1-prasad.kumpatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDAzMCBTYWx0ZWRfX/WgGDmoD7UuY
 thNdaE0UNIPuht+HBSMbFjD0dyiNGaj8j0eW3XOIQQ1P9QVLJN45CFqmA8nBJGzCwP3rwQZIU2R
 NJoXHfSR0AaAut7t8UVxA7DEw4pEuQyaG9+eby6FWzt/h9B/NBnlZwuRzYnZL7SC0PcNTA7Ujh2
 IH7pd7WE1ZWUSdrVeC7cLZ7TvMa1qsjGj76Cqc6aANnANsjDn1Z9+RG07EtkQvPKMV7mnOnDXbI
 WG65nk8GgAKJDb5dLPHuh5AaAN/8wB9AZFckLzdPAIX2cohhoh2vF1E9V3gcYv2pGBt2h2yRz2+
 ZIwUYu+6cT/tGvg9Abf6mH+W9BNGuZDJRrzIk3Xr+Sa+alCWdEWAFrxRp8dtbm8dqfiMFk7VDVW
 8SdPy6P33qrnc9+14kV1fBcKw7q09AJ0na4yoW4bAkK+bIHRnoVldoi/6chjyJT8CQ4ZPyY1E20
 yrJozlviUf+uznmp53Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDAzMCBTYWx0ZWRfX6D7z1Tc5DpkK
 Udcv2Rwe/FZaMkpcsa09j589POmwbdbEe07F3/DpnxVZNQjd4M2v+xk37TABnygRXhOAjoQgBcL
 T+xdZ0RuBj14sfKRQnQuCTqBR0jeYyQ=
X-Authority-Analysis: v=2.4 cv=F97C5ahN c=1 sm=1 tr=0 ts=6ac4a784 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8 a=6dl9xK7RzcSlF3uxdvAA:9
X-Proofpoint-ORIG-GUID: k4e_NSgo7FX4agtGAUkpuqtnToXPeK3-
X-Proofpoint-GUID: k4e_NSgo7FX4agtGAUkpuqtnToXPeK3-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_02,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060030

Build the LPASS LPI pinctrl driver as module, as required by the Hawi
and Maili platforms to control all the LPI GPIOs.

Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index fce418fe6ff6..2a8e94b4d09a 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -704,6 +704,7 @@ CONFIG_PINCTRL_IMX_SCMI=y
 CONFIG_PINCTRL_IMX91=y
 CONFIG_PINCTRL_QCOM_SPMI_PMIC=y
 CONFIG_PINCTRL_LPASS_LPI=m
+CONFIG_PINCTRL_HAWI_LPASS_LPI=m
 CONFIG_PINCTRL_MILOS_LPASS_LPI=m
 CONFIG_PINCTRL_SC7280_LPASS_LPI=m
 CONFIG_PINCTRL_SM6115_LPASS_LPI=m
-- 
2.34.1

