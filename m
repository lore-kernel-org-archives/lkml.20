Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794565884;
	b=iQfFwF/blWuSX77yT2HY8mvLLN2L6crNaloWhmV7I9X0R6ikw1zR9wK2L+5eB3QY9UPx
	 OmdSA7A7T7NWOcNOgZvFaz84580fxJD/AcCVJW1gxHD5t2LKJjYEH7hYhr/2ebA7gAVjm
	 PFY9qFV1Ow1fZQQnTOs8x/pqP3peuS59MrHG3fefutY6s4KRpVMJqHlwvUDi2bH363VTH
	 1tmEKSTRboVrfrKgzorF8to0uKC4XjlRW14kCBXKrZXr/ZGsVyUxCjpEAwR9vlhY4aE5a
	 G9DBMpGj9VviLHCe7mbrWGN2xyd+KdrNoRnBi47F3p5zvjYxmT1va6DzlQkEItqHRvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794565884;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=KpRu8BpOa+mCCXYxNaCrJjVGuENtvlTwOw/KUHxbDY0=;
	b=kLd1YmrJHlMvMHiQ7VmMWQ66mYCBCQ9Ug5Q6FVg2iyl6NxbapZlsV3lCE0gTURgUzfWQ
	 FNFaqdjfjUtejmHr4FCCO7D4p9FYaIxv5Xg6qEdrMJagRo6wuFdbEPaWqOLNdSe4trs8X
	 ZAAkjBphd5KvY88b7cChJkfCudF2ADPal9r0qAfuV2dYcgVdwk1+523/IVAQmameuk6e1
	 /YnOAcSp4XE432JWiCKkOTkfrJRbIV3JWSkooPaoqFOD0H0NqjTIknoiVFy/EaZ7B737q
	 MyGqhz5aC8ClVgSm2rkvEi9SbMC5oJG22DDGE/57cgHLID1X8I8Ra7dLf8OrgHilwAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WnZoMRWJ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L4o3pjgT;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86133606A886
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:31:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86133606A886
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WnZoMRWJ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L4o3pjgT
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD8VAQA074784
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:31:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=KpRu8BpOa+m
	CCXYxNaCrJjVGuENtvlTwOw/KUHxbDY0=; b=WnZoMRWJSgdz38tzuU6WjXsNSWu
	9QCVw8Z5vsMGsFSWaAhSXdtUFAYO7vqDqHiegZk7MEFir2KlCFF+tULr85YhBHp+
	5YsU7z6fd4HccuiXJ7/4bdHC99e7sT+XIxryZqikmDpoaNcVDyBGELl3Yh/acTNf
	V79Zc6goJ5BzUvHJzlMXHPNGZ9uYW4Hv5oCOYkKdPmwhPtgpMT5FWc2xn5poGa0B
	BoDBsQzhbx/n8RbwYLmtcMS/IUU7BSzVlRdXQIDua0yroalHupytoMyjxaG1qVXp
	JKgiky/XI4F9l9S5KA7FeSAikyBwEM2JN9TMPwVruMftUYA/jegYW8l6A+A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwqufhw6n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:31:22 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2eaae8d29e0so10353225ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 02:31:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794565882; x=1795170682; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KpRu8BpOa+mCCXYxNaCrJjVGuENtvlTwOw/KUHxbDY0=;
        b=L4o3pjgTOEWx2w8bs3thwOnjg5DGn4aiGp1wlQPwysQZw7ql+Lzaxlw19LBiQ2mY72
         waEbMZ9fP9fKVPjCaSm07Pu8E6OrCLEjBGYGR5L3jZo15YenorxtkvS5zwhdbtQsIh0/
         HA2ql2TgVh3cNlsvrS5vVt9clS7eAEXesAprgMxiYSS27WNR4Y0pSYucc43XNaYkeZWA
         yi6kl6C1IeRrTy/70GiEXtkekIyJvHiT6dYK8eFXjUOBGxGidlJ7xhTbJxH2vZdkLzOc
         H3Wmgm2QmbhZxNfzG1UcwtWOLCGTgt7xr1MRL+OHE22rWcR4+l31Kw1Bgo1EmO1FOxAK
         xENw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794565882; x=1795170682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KpRu8BpOa+mCCXYxNaCrJjVGuENtvlTwOw/KUHxbDY0=;
        b=0lTQaqTtbsRIr1Ku8gknMU6SvlTxZ25moMB7l1txZhrbMkeUK+fbcQue2oCFCv5DbP
         oY42X0UmjvM0PLP/jv8A5CgaxvpaD0bypim29mJpuqPgUXvdE8fv8sxMPJSe4S8Vm822
         vZcQ+eToAMAo3bSwAmX+p4Y0ZnH0avo7HAeKetew8ocwsW+0vg6nm1CpjHTocqwD/C04
         db21VpmxETzNcjvqsxVj47wWkgz52zrvoyJ9fb10xtlo/D7LElHN5USLghVHhenagdS/
         FshW1SS733gPGMsB2QYKfwrAqwqXpFyjlNE1XrNP2eCykJ0JzFoQq4eC7BkUMTzZTkiw
         xBwg==
X-Forwarded-Encrypted: i=1; AL+hErFPPxeBvmC5R/63yycWM+slU9xz4aY+WJt7CK/xOp7tk20vs6515RwV3VFU7JAOd4OErYkZ6yTsLnFCcKM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+6qhgRz3kcDe5iMW7bhZyKkPdxH1ubGSGiWvlq3XZWHX1CaYXq
	pUu3MFjcQdhU+X6LSbxJzpJNvr6Lv5ZCiZ9I56toxs54HyPqfBy6v4NJFfpNEY2183n3eHch1QD
	7DywLdXIJ/NpHbI9PC/cgLemEImjfGYWo6fl52VhosMsqyEAIv5HyDKs+6pP74R7QBRE=
X-Gm-Gg: AYBFou37IWcwcwHu2q8ex31+//exDXEpD2WxEcgx1RqMBZEIXPL/KecG4rYIcBMUlU6
	WNonOMkr7tUMWYwDfXhKFMCpm3JVQzO2vmeEBoA8jpz2H/7+0Xx3Gf30/Jsi9sznACq65PwtMio
	yLVyzFuSH8NNR1MfGez09e00/hNR5GOr1m0HgzJHyfGlljL9eK7MCiUWwHcZIMO/KklTNfVQ/9i
	Hs5cvUALI71RqFTG6Ywl4p0Oj751T79Sg2vOU2uEnIBz+1UtCaak1fokDtjO7N0mmSU22JEVD55
	AGr5mA3nZ1yvHv2CHQ4jPr/P29gJ+6hP+FVLOd4oaW7VewETtKUsxbZ4bsKE5ii39WznR6mfO8v
	OYEJL7AlYf0Qe7o3r867CCsV4ZlJIMX7WfqHSbpn9AeiT2CnBoFLWoyjlNCWayOrUPR4yxm1zds
	+bmg==
X-Received: by 2002:a17:903:30d2:b0:2ed:146c:cbb7 with SMTP id d9443c01a7336-2ee0da7fdb6mr12931045ad.16.1794565882129;
        Fri, 13 Nov 2026 02:31:22 -0800 (PST)
X-Received: by 2002:a17:903:30d2:b0:2ed:146c:cbb7 with SMTP id d9443c01a7336-2ee0da7fdb6mr12930915ad.16.1794565881678;
        Fri, 13 Nov 2026 02:31:21 -0800 (PST)
Received: from hu-prashk-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f8d4612sm8072585ad.57.2026.11.13.02.31.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 02:31:21 -0800 (PST)
From: Prashanth K <prashanth.k@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Prashanth K <prashanth.k@oss.qualcomm.com>
Subject: [PATCH v2 1/2] phy: qcom: qmp-usb: Add PM suspend/resume callbacks
Date: Fri, 13 Nov 2026 16:01:10 +0530
Message-Id: <20261113103111.156476-2-prashanth.k@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261113103111.156476-1-prashanth.k@oss.qualcomm.com>
References: <20261113103111.156476-1-prashanth.k@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 3uk5nI9DCrotGyrILssXuQBawTsvu8EG
X-Proofpoint-ORIG-GUID: 3uk5nI9DCrotGyrILssXuQBawTsvu8EG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA0MSBTYWx0ZWRfX7S2dH6f7U6Kr
 g71ut2kHPuB1blWMI0g6m+O7K5HctYs4kQiFU57FqbdraDYTpmUtaABBVk65XUgrSYE45hvLRlz
 DfALH/btSqpTVVzFUR6Nj44GMZ0fVRqkKlhcgHDJl1+MpKwDF8uSSqpxK/BkBASXx5n8gLbJWCv
 S7xqrpxBhztYWP83njIlLiiVJdzSTLUml1mE/bKcamOZcPDf/vMqeyqpJMQF/yExYOzJWykMHWN
 CxxFLTwm3yKm0k8c4ViNbW9ssHY7/P85FTyKiWQt6B/8cjk1/e8mtNR5fWg1psm+5aBg8WEfj76
 qnKshosR+js2FJxCR92uRiRL8oRMfDsbtHCwAwFZs2Aj+MHWcgiy/VhtZmdtqaII1IBYxEa5rkN
 3GwEpfIrNLnWSPSAig+N8ektfoT59GOnaVtoP8oS5HGVT4O9SIOrPiuaLVdE1JlHxAph7pRhv52
 36lXU7B1sAg/UkmO4dw==
X-Authority-Analysis: v=2.4 cv=XZocX455 c=1 sm=1 tr=0 ts=6af6e6fa cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=tKit87rPrO_SzoOCm70A:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA0MSBTYWx0ZWRfX+u9wDYuFI6WV
 FqRsJAE5f15vQmqTAJsJ85XxP7YO3Aq5Dtapyzw13H28MZylZ/8bZng87hsp7wWUJ7igVeZ8vio
 m0YVqUfN42Sao1xWrckPNat6Aged6aA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130041

Currently when we perform system suspend, the phy clocks aren't
turned off, this leads to power leakage. Prevent this by adding
PM suspend/resume callbacks for the qmp-usb phy which toggles
clocks on/off correspondingly.

Signed-off-by: Prashanth K <prashanth.k@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
index 6a9faa0ce3bb..dc8be977e0a8 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
@@ -2129,6 +2129,7 @@ static int __maybe_unused qmp_usb_runtime_resume(struct device *dev)
 static const struct dev_pm_ops qmp_usb_pm_ops = {
 	SET_RUNTIME_PM_OPS(qmp_usb_runtime_suspend,
 			   qmp_usb_runtime_resume, NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
 };
 
 static int qmp_usb_reset_init(struct qmp_usb *qmp,
@@ -2510,7 +2511,7 @@ static struct platform_driver qmp_usb_driver = {
 	.probe		= qmp_usb_probe,
 	.driver = {
 		.name	= "qcom-qmp-usb-phy",
-		.pm	= &qmp_usb_pm_ops,
+		.pm	= pm_ptr(&qmp_usb_pm_ops),
 		.of_match_table = qmp_usb_of_match_table,
 	},
 };
-- 
2.34.1

