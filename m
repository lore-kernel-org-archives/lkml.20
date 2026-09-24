Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C138047A87A
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 13:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790255225; cv=none; b=c6fVh7p6pFH1DyKRx2wX6+CBPchHWL8OrWY4iPBRmwBnrNbd6EBRNijd/X40DkYK3SxQcREXTMgg0cqnha9IMfb1iCax/GwkqC9uemxOa6bZBBN458k3BwLI16g4cjFQf56m/fNF1c44+Q1mRup3N2dy++iqoMv7B6mTRi9MAJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790255225; c=relaxed/simple;
	bh=OtGLY2tYgsurW/oEJaL4CmfsoEtpjy2+b4rFpkbEHFM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CKkIidg36cZCTVhpkFzqzznvcDzo7YRbZqUu7KL5rhD7uRq/pML0/aknCrHO2niLN/m89phW6EAVxhHKk97McobZNRp3aOZusj1cR6P0WgyvPhVtSYq7IbMrLKYt6N/8/vyVraq936oBrwA4S8WTXRcaS2snJuT9ju3kUJ1bGIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xnr7yV6A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AMjAVL5L; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xnr7yV6A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AMjAVL5L"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OC4XXb3134066
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 13:07:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=hfStSerMXzGJ/RtDmKQbNO/HgEnZMcbi6PY
	ROxvB9FE=; b=Xnr7yV6AD1phOC0SnsxCeiGxyz0unlkMvwxG4RiRbpoJI3Srphj
	JFH4eWURz/rok6f00Ds97FW07vDZ0yW8NaAfEllk6un0KXc5iaec+wiRFuk4gGTr
	nh+1GPb5/D7+wcLHUnCuh/kLgxU3RoKOykYC2AcNeBFgQEDUIqIb7VfKPRrSr6wg
	ybYGezoKTxjWSw+f0w7OjF88NLa/h8OVv7v0My3BqunoCCDGdLI5Vl3oaK6UVqQc
	WNoLQ8f8NyiaaKGutuxaoeuFpOXn0xgn8PDitlWy7iP4NxGnJevk19SRFrTQxbHj
	+Jp6nDXrqVmQYCo7mq+mURvqZmgtsL0aKEw==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1ragr8q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 13:07:02 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-79cdabf7d89so1875360137.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 06:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790255222; x=1790860022; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hfStSerMXzGJ/RtDmKQbNO/HgEnZMcbi6PYROxvB9FE=;
        b=AMjAVL5LKCyLaG2zBJWe67htBggNZJlNFY8oSeuRQlChHDTssIDb+bXrWM3MpsOUfn
         AbPuHdz1QJTwO13yQq7ouWTHf2u0s/WLg/wOIlV8iKN1xI8ER8JQidIjyk5kwgeHISDW
         5xGsMD2akiwHY22f+H5O4TlsjrWe8VOms0EhV48jtO/H3LqEQ2VF2Yg/szkt1+xo01IT
         969TUXVT9qTgmJCMZcX3SpfYOlqp9oQ4qn8ZpYZWG3athpUAo/MMFL7ZSBf+6BexRE3b
         16Jldcl1hqy0ofgNBjOJ2AObF8QnBgT/Oxovonwyld+ea7u9Wzbl344HXAIRzJWm+Pbr
         TIJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790255222; x=1790860022;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hfStSerMXzGJ/RtDmKQbNO/HgEnZMcbi6PYROxvB9FE=;
        b=wVMmkwmd/fZBnNUlTmIU/MFxyEWzPo2GfCrMJTVylMAI8G13ubKVVIAByHk1wtrsy1
         W9VdEAMLdp0wqa00ADYHcGQPgZ/BzaOceT1LK4dEYFq67rkeU2ImOgk+x/8HOO/8S/dA
         I4ibyX6BFEsuh629j9VLNBhhviOHCwYLBxe8AZvgtHqswwxiPnDVUMHrnq3wW1N0hGys
         w+bjAvutJYIjj2vtDhYUVu3mpS3WWjPIaUQJRSaXmYvSb0iKHS1k/wJ9GcUbLShOiQUL
         BnXzN72GtxvB1BVqQO3GKIsmZbwFEDpEDQX+Tt8QzhtzWYbpkOYGcXKY+0CWB/2DPGZd
         AKug==
X-Forwarded-Encrypted: i=1; AKwUvBxW0s25l3CtGavkCaVvoj59xdauLokfXLtsGiQ5AFi2j8r1ZU7mM6Ip/tZnLzBRY7zCtJYSRUCM40khRjM=@vger.kernel.org
X-Gm-Message-State: AFuF++kjZB4uGWFlvJSU8wMTp0Bzjj/7hLEMyoQ1M6LA2xsuqJWvHHpq
	LQJIxxSgiH5iiPjrBht37NMLmbxgIYvHKAoVuenko0/VvGI+sTe4Gq4V/4QpfwXOZveDVEk0+NV
	JlWYYjadQohGaGsG/ArXt7T6xvoYbTGwYUJrFLKJPQZL0l6DWlQ5aIMcrz/0NOaM3zvJyuju6Sy
	c=
X-Gm-Gg: AYBFou3iCiANuPpiaUMA8mz5mK56sLd3hFLA3HB+CtU+xp9Ps7ahJWWm1eST1wYwJrH
	xUqTXRVgxsO9jlbyqVF+wChkOYrZmiBnvTE1NccZa6fTfseJK0Rn1WTjnyyVzQeVHJd7xxhTfiF
	onVeI9gQXB7oB0czO9NS0vfIjzoSksymz5KX+DWfauS0QCmT+JtjbFIFd0w6K4kz9gB+mHbPt3D
	3UR7S966Ge3s6SaNpxEBPbHl3YDydJG9/sWM8ZDpksozbmBOVck05dMa+OJWJyo6Hq/OJzef30h
	G4DO5k63m8hdoA1g2wTBbPcgoKVwSD5EhOtplDbzPeEwNf0+7Ht8/cpbSR2otPf0r99yn4EMvHf
	Wes7blaoHICCaDvplrwtCf/O5WSROre3S8lttib7hK4h/V756O1jFdfg1kr8pnPe6Q0O0+sfgG8
	VxAk1yqAvE6jAnLsq34KEo+2IWAsONIcSNIjsZ
X-Received: by 2002:a05:6102:3f87:b0:7a2:6b90:3d7b with SMTP id ada2fe7eead31-7af1c691fddmr1410267137.8.1790255221918;
        Thu, 24 Sep 2026 06:07:01 -0700 (PDT)
X-Received: by 2002:a05:6102:3f87:b0:7a2:6b90:3d7b with SMTP id ada2fe7eead31-7af1c691fddmr1410256137.8.1790255221451;
        Thu, 24 Sep 2026 06:07:01 -0700 (PDT)
Received: from t14s.space.revspace.nl (2001-1c00-2a07-3a01-8e96-3679-0b9c-de47.cable.dynamic.v6.ziggo.nl. [2001:1c00:2a07:3a01:8e96:3679:b9c:de47])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aab38bc04esm3665913a12.29.2026.09.24.06.07.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 06:07:00 -0700 (PDT)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Subject: [PATCH] arm64: defconfig: Enable Qualcomm SPMI PMIC Thermal Monitor ADC5 Gen
Date: Thu, 24 Sep 2026 15:06:59 +0200
Message-ID: <20260924130659.8841-1-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA1NCBTYWx0ZWRfX99bI9XzPIcTB
 Pju/KBNx4h2Gz0TkOzRCnxnEvkqdSjU7n4bjYV4qIHC51xgNa88PUhjnwrtxPKzJF+UzEiONHTX
 VDHM4xde+glVXpYjme8GO6camnaYvffu6aZhqdnO0IsvKuXBWatb1+eRTNxIEf3gqHiQWNdV108
 mLcevXdLasjjo6bRwdolnpytibhkJ/WWYtD5LoWYybRXWDvJ7sjMzsTTwiLT7KuVhya85yfU+zg
 3+IQEmSxkuI3N2sG79O6I8HVk/RfCUif6R5TlzBrFii9WcHC1GVsOoXaxyfIRTqx+hvl5G40XQC
 Nk8vuK+8xTIyrymOiygN2FnlxpDVK1L5o8kvDvB81TdN2uhGeVUrWd75yKsdt2nkZ4qVNKAlAyv
 7vaQVjhQaJRQzPFw0pU8P2JGEgIAwEucZckuci0K4Tk8X3qk/da+eCdp/NPhQyqTE+5krjcmudm
 HgDDd9wiBhzNzyO0t7A==
X-Proofpoint-ORIG-GUID: Ue0dhEeyMTbXxtJjsUORSQcHXdxEFwFw
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA1NCBTYWx0ZWRfXyV7Nlmk2rUYt
 4o/SCK0o+WpJBVaPdPLDMV6BTLklFC3ZAbBOeYWKCsMq9MyROH45Lc0VFvMWZ83woAnSrU3tm+j
 PLdU7XtdYrPY7NsxOfBmvsTkvP8wQyU=
X-Authority-Analysis: v=2.4 cv=fvpJ914f c=1 sm=1 tr=0 ts=6ab52076 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8 a=kHo-VL0827TqqIXx3KMA:9
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: Ue0dhEeyMTbXxtJjsUORSQcHXdxEFwFw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 impostorscore=0
 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240054

Enable Qualcomm SPMI PMIC Thermal Monitor ADC5 Gen driver, this is
necessary for thermal management on Hamoa laptops.

Suggested-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 1c42ac043aee..37a0f4702e71 100644
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
-- 
2.55.0

