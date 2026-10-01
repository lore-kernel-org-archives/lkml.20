Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24A3929BD8C
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 01:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790817401; cv=none; b=GsiiV00V95BwoAsuiR8mUvF4cPlobVH/7zKbcj1Nj1qpPK7ZsqtfxWSDFUoyOxsnzsgiBexJlyv6PtJdkx9ZSa9MWr4Ww+4O1z3ZxMxZNxNFU95/jYLb8Z5O1V1yxEqic3DOFS/c45E98X/akoResbjHLKQA6TZbAgTj04vsd/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790817401; c=relaxed/simple;
	bh=tjcWt2seiedt957fPkP3qjPCH/MwWJfOxFdhOfaqiNM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=NwF30TITYs9HWjASGXGPDUm0SfwB3eHZX6hh9YEwXEoQOYnyNjG11tNQMYwSUpyoRHgptJxvuaI+n9/hWRE4OQgAfi+z/WI/DhZMV8qYYgBcsVfxEhJABVhPvgorzcqJR3OwXJ10JFKxiYowKKhOyj1cEuGbOKnDrhG7riU3ZS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c9G1vDL0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gmRZHJOx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c9G1vDL0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gmRZHJOx"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6910jo4F1140892
	for <linux-kernel@vger.kernel.org>; Thu, 1 Oct 2026 01:16:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=8LTwY7IbNj9bE+34TwGiIF
	xUUUMboXxjX5o58rh98Fg=; b=c9G1vDL003HrgYM8gEmL6SUiRKFm2A714lEBNV
	OJEDmdFIlPkZL2Zv0JJDX7imO17aDtQexMn2dCSsC8OFpDZ5BRM4tkD0XpGBSReN
	s/Ba5fu3GV2JQeOazEZUvRvO+nivSgvsbu/Scn478LwbN9q+2ZKzI73JQpgO9GqE
	NqW5hsyJxKNkbPbBIsK17yBO0yjhWnLoYYKynfe25drtd0oVP1qLhMFg+3l3iGrH
	zI5mmOKGBt4EYa1ZjsMjIg+OYncJW3Hcr8iWPfUuINlJssA0MFJCEtdqJeZv6Gtg
	RKJwCefomM2J6CiYq+uA9vKgST+YMkXayORlc5D5BtzVfmjQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h10bkbkjb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 01:16:36 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30c0d568830so11813116eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 18:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790817396; x=1791422196; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8LTwY7IbNj9bE+34TwGiIFxUUUMboXxjX5o58rh98Fg=;
        b=gmRZHJOxDG3/iPYaddzeyzSpDhYT0RPvsb99Ov507i9xD66YBqRmEC5wOQCxRAiBS2
         fccLLGP5Y0vFiiqDmMJUJn+vNwyyW1wBGMNfDxkwa7T8BQgaMqi1WHyaksE/W6cmBADM
         J90Zw8N2SOBhmrFH0mtkcyMYBap2p+ULTZC0zQEv7RR9hnrKixbgkMZLgKpEgqjfKc6x
         +N9ctJPuIEevarUF125PClJRvzjbHqa16y7g4va767xxFtUZhxfNFiTBnOJb8m0Uc5tx
         iKgXPMfkPZvTldnXfMY77ADe2dNE85noxs58X9w3oohrCwicrka8A0I9ctQGorXS2ldO
         WDXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790817396; x=1791422196;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=8LTwY7IbNj9bE+34TwGiIFxUUUMboXxjX5o58rh98Fg=;
        b=PWuSs4m4AdhNKoIbWatIV/RaOdKyx+IOpZn8tZ2Ha+y3VlfpJd32guafISfb82gsAE
         K+osajWEl3K+PEKU8/+F1kqdgzFG1tIsC0nl6UPRNYjoyVxbYKqusrlcvqUxYAkBlF7r
         wQA5PV+S4T1M8OPING7/rai1258OG0bxDxzulPrk/vuJVQ30AwAVvbuLgLWOsxEdItBz
         sNAH7qIw/W9ReTF6TfhXAisnHudLETuVwWsfiNqNo0f29Q9jopqh4XPzzcRW7mN8FItL
         s/+bgPEGelrHP9/pNzsIuFC91pyK/4c9gb7jAqGFVYgWA08yOsMs0LIdRXC6e1Sw9FoH
         Mzow==
X-Forwarded-Encrypted: i=1; AKwUvBz6mSYTeR+vpwiUfb3FWyMjqPwUXo4WF28hZ+7XqyjFf2y0mCFbXISYrHpkq8OyiPSuOugAnUBwdTwIWpA=@vger.kernel.org
X-Gm-Message-State: AFuF++mcj0+reBZrCOnT7RmVDCrpyS1SmEx3oUdXrP4DKsuyF7iIWE+2
	wEOCHkYJ31LtAm/YuoV2rlUp7x5qx+ITUQkeuOde538HEKOsgkzGQ/PwLgl0KMasrvf4bWpxyXY
	jKED+yKfoboHlMkrW8DGqIlzF10fSJAETB9Jy5loyNf6/EEXZiV40ILFiCGddAoPt+Vo=
X-Gm-Gg: AYBFou03KagUNd7b2ACxXcjTgSx1bbkr4i3y7cSmy1WdZdU9GEINqNZjXJzHRqgVM6N
	2tQTmNxT8W1bgGkZopW0xbq1wgVrXlXBlkZ0l7ht+faHUfXPWVogCxvkG4cAUYu9lPF3Q9aTcZb
	JpGVKcBIzwX1t31UT3NJzxuQuuxWSds+oHTa8exveabulUQtIVuY2U2sajsMdDFmSlsXy5xnh9l
	T4s54eMOxPYo/876NenKB7fLOSReVfzgn+OJg+p3bt+rG5BxqytGkUYAn6o8h9sA3jjFynyD7yF
	3tw9x6cTEn/WlPb/qTeGoy/yhk1eL9KtH7pCE5brAXoCSfPu08rdPwUHpyzrLPO1Q2RrMZTNlOf
	RDwvJygq0dUBGyo6JpibFKYasONuTO+7kML03pQAfPRTFPp1SanKw
X-Received: by 2002:a05:7022:3a89:b0:14d:b813:852d with SMTP id a92af1059eb24-14db822c86emr1313984c88.6.1790817395632;
        Wed, 30 Sep 2026 18:16:35 -0700 (PDT)
X-Received: by 2002:a05:7022:3a89:b0:14d:b813:852d with SMTP id a92af1059eb24-14db822c86emr1313954c88.6.1790817394799;
        Wed, 30 Sep 2026 18:16:34 -0700 (PDT)
Received: from hu-wcheng-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34db3750765sm2190286eec.12.2026.09.30.18.16.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 18:16:34 -0700 (PDT)
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 18:16:31 -0700
Subject: [PATCH] phy: qualcomm: qmp-combo: Differentiate clocks related to
 the USB block
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-qmp_phy_usb_clks_v1-v1-1-d4dccc9eb263@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAG60vWoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDS2MD3cLcgviCjMr40uKk+OSc7OL4MkNdI9MkS2NzEwMLsyQjJaDOgqL
 UtMwKsKnRsRB+cWlSVmpyCcgopdpaADC08D53AAAA
X-Change-ID: 20260930-qmp_phy_usb_clks_v1-25b9374086b2
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, jason.pettit@oss.qualcomm.com,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: GWhn-1vQrUUmRHwEvN9aoOm9oEyc163O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAwNCBTYWx0ZWRfX8jdXJ2CA4Rh5
 01+PsEYyU1yCbv3kx+Aa4YfCIuojSd3QswCOhDBdv9M4xFAIhvj8fjTirauJMEV1C8KkNFNlouO
 9xX013cEzAMiEytCSAAkz4OFoZBflhDi19Vv20qjdmod/Rvovt3SAupOgiTXOX7xi8jP1Gbn7X0
 FV9jzgQWHbvL5csyjT0+toRPeQj4E95itSUz1gKRsnlCNGQ5kCG6w6l/EOmpjeEHMmKSiO6o4Ll
 ngNFe3V0ijIolKRNzzsd3MWbEBUFy8NOUDwKyS+W1XygCbToHiHwWrcWdrQAvTwp3CoxtSW89g8
 HvlFKu0EodIFXzx4eyLGD9sQxmeuUzbG1PLn1hy7gQbBNbgDS3KrW78Zp9x8oU6LCQ4eW6Du3VM
 jpptBQ1d08mFTAvLEM7DutLrIUdQCmSllRX18MEcWtgxS8Y21CQxteayu3O/VqrhhPgjYaTHM+A
 2Pn0VgEwH0FhSTj7MZw==
X-Authority-Analysis: v=2.4 cv=MZn5KJ/f c=1 sm=1 tr=0 ts=6abdb474 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=KCRQXf5DRPPkNQcuQH4A:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAwNCBTYWx0ZWRfX2lIMnATjPL9Z
 FaMc0/ctWv9F7Lmo77UTbgouZ39lxt18ESkzUiqEVVoEYYmC6AYf8kj0Ol2vKCz9odEhfEEgo7a
 uACdKynCpAlPcD6Id35syztBsC+khp4=
X-Proofpoint-ORIG-GUID: GWhn-1vQrUUmRHwEvN9aoOm9oEyc163O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610010004

The Qualcomm QMP combo PHY has a USB and Displayport block that is
sourced with different clocks.  In situations where the USB path is not
utilized, and only Displayport is active, unnecessary clocks are enabled
and not used.  Split the current clock list into USB specific clocks,
which will be enabled whenever the USB initialization routine is
executed.

In addition, move autonomous mode control specifically when USB is
active, as its primary purpose is to detect RX detection and LFPS
signals, which occurs only when USB is active.

Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 56 ++++++++++++++++++++++++++-----
 1 file changed, 47 insertions(+), 9 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index a4f130fc33e3..f14fb8ef9028 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -2607,6 +2607,8 @@ struct qmp_combo {
 	struct clk_bulk_data *clks;
 	struct clk *p2rr2p_pipe_clk;
 	int num_clks;
+	struct clk_bulk_data *usb_clks;
+	int num_usb_clks;
 	struct reset_control_bulk_data *resets;
 	struct regulator_bulk_data *vregs;
 
@@ -2678,7 +2680,11 @@ static inline void qphy_clrbits(void __iomem *base, u32 offset, u32 val)
 
 /* list of clocks required by phy */
 static const char * const qmp_combo_phy_clk_l[] = {
-	"aux", "cfg_ahb", "ref", "com_aux",
+	"cfg_ahb", "ref",
+};
+
+static const char * const qmp_combo_usb_phy_clk_l[] = {
+	"aux", "com_aux",
 };
 
 /* list of resets */
@@ -4403,13 +4409,20 @@ static int qmp_combo_usb_init(struct phy *phy)
 		return 0;
 	}
 
-	ret = qmp_combo_com_init(qmp, false);
+	ret = clk_bulk_prepare_enable(qmp->num_usb_clks, qmp->usb_clks);
 	if (ret)
 		return ret;
 
+	ret = qmp_combo_com_init(qmp, false);
+	if (ret) {
+		clk_bulk_disable_unprepare(qmp->num_usb_clks, qmp->usb_clks);
+		return ret;
+	}
+
 	ret = qmp_combo_usb_power_on(phy);
 	if (ret) {
 		qmp_combo_com_exit(qmp, false);
+		clk_bulk_disable_unprepare(qmp->num_usb_clks, qmp->usb_clks);
 		return ret;
 	}
 
@@ -4440,6 +4453,8 @@ static int qmp_combo_usb_exit(struct phy *phy)
 	if (ret)
 		return ret;
 
+	clk_bulk_disable_unprepare(qmp->num_usb_clks, qmp->usb_clks);
+
 	qmp->usb_init_count--;
 
 	return 0;
@@ -4670,7 +4685,10 @@ static int __maybe_unused qmp_combo_runtime_suspend(struct device *dev)
 		return 0;
 	}
 
-	qmp_combo_enable_autonomous_mode(qmp);
+	if (qmp->usb_init_count) {
+		qmp_combo_enable_autonomous_mode(qmp);
+		clk_bulk_disable_unprepare(qmp->num_usb_clks, qmp->usb_clks);
+	}
 
 	clk_disable_unprepare(qmp->pipe_clk);
 	clk_bulk_disable_unprepare(qmp->num_clks, qmp->clks);
@@ -4701,7 +4719,12 @@ static int __maybe_unused qmp_combo_runtime_resume(struct device *dev)
 		return ret;
 	}
 
-	qmp_combo_disable_autonomous_mode(qmp);
+	if (qmp->usb_init_count) {
+		ret = clk_bulk_prepare_enable(qmp->num_usb_clks, qmp->usb_clks);
+		if (ret)
+			return ret;
+		qmp_combo_disable_autonomous_mode(qmp);
+	}
 
 	return 0;
 }
@@ -4736,19 +4759,34 @@ static int qmp_combo_reset_init(struct qmp_combo *qmp)
 static int qmp_combo_clk_init(struct qmp_combo *qmp)
 {
 	struct device *dev = qmp->dev;
-	int num = ARRAY_SIZE(qmp_combo_phy_clk_l);
+	int num_clks = ARRAY_SIZE(qmp_combo_phy_clk_l);
+	int num_usb_clks = ARRAY_SIZE(qmp_combo_usb_phy_clk_l);
 	int i;
+	int ret;
 
-	qmp->clks = devm_kcalloc(dev, num, sizeof(*qmp->clks), GFP_KERNEL);
+	qmp->clks = devm_kcalloc(dev, num_clks, sizeof(*qmp->clks), GFP_KERNEL);
 	if (!qmp->clks)
 		return -ENOMEM;
 
-	for (i = 0; i < num; i++)
+	for (i = 0; i < num_clks; i++)
 		qmp->clks[i].id = qmp_combo_phy_clk_l[i];
 
-	qmp->num_clks = num;
+	qmp->num_clks = num_clks;
+
+	qmp->usb_clks = devm_kcalloc(dev, num_usb_clks, sizeof(*qmp->usb_clks), GFP_KERNEL);
+	if (!qmp->usb_clks)
+		return -ENOMEM;
+
+	for (i = 0; i < num_usb_clks; i++)
+		qmp->usb_clks[i].id = qmp_combo_usb_phy_clk_l[i];
+
+	qmp->num_usb_clks = num_usb_clks;
+
+	ret = devm_clk_bulk_get_optional(dev, num_clks, qmp->clks);
+	if (ret)
+		return ret;
 
-	return devm_clk_bulk_get_optional(dev, num, qmp->clks);
+	return devm_clk_bulk_get_optional(dev, num_usb_clks, qmp->usb_clks);
 }
 
 static void phy_clk_release_provider(void *res)

---
base-commit: c7f2322431cb6d108b18fb4154606b49e2bc50f7
change-id: 20260930-qmp_phy_usb_clks_v1-25b9374086b2

Best regards,
--  
Wesley Cheng <wesley.cheng@oss.qualcomm.com>

