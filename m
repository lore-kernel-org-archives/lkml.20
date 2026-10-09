Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07A383D092F
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 04:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791521432; cv=none; b=XJAmMySsTDQtcrZiLQqv4UOOXzlKulv0wSKwzZVSe9H9xo+ruji8dhNG6vVG6fZue7mQcjpOLuiK/5oiEgj6WY4vkm1YzMW7fMyLNSHVo7oA49EWfsCMbaAMpjc/ZPFMf0cSYVW/3kDZLeqhyjWKQVkckNXFZmvF++qXS7kdfCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791521432; c=relaxed/simple;
	bh=0STYxAxDE1NjmlumOdbThi5YeoSWS5eKyqTdJTbik7I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QlHEx08Vkmo54c4L90aYfhxtyKVTldGyx7IJJfGSfAAyXPPwbTAM/aAm2XQ1XzS9+5PpOYiZCpHMrglZ6QF7uYBqWW/hPxCEEKyCm0scJlzSGvW/V6zRiXXbZJ2a+/AoigF2yodmSHXAHDxpA2Iy7lm9ML62Jo6QD0Ss4pSMeQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n8DflUv2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R1FLQ3ed; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n8DflUv2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R1FLQ3ed"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6993HKNO4178448
	for <linux-kernel@vger.kernel.org>; Fri, 9 Oct 2026 04:50:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y6PDhPtXFIAM/ccyT8/MEF2gGuCNuVMLTbOdYMac8XU=; b=n8DflUv2GGnZ7OHH
	k0mx7cjfzL33RyK+vCD3SeAFnNxUkJK9vFtr+rTQPCV2pZZW0dElM8QB/R6oeUeb
	wWWF9RLUCSFqxaAivxamrp6kZWTleOJICgHKP0/cveiUSk07EzAcFI3bzDMQ5C4a
	WvIG4p7zWx+xbBEcGVpnRu9WTch/Kv6Q9gFXkeZ+oIkRPqL64OYmlKUpGgbbM5jd
	4dGPPJzYWG70p8fSHNmIHfIDXRR2pnzjSMSwkt7w8i5Uf2P6Q4MCVJzlZzbVU5ee
	gFsUFjCLHM/R5s6poIcyTc008GOGPn3hvGlsjIYa4pvMCxpldK1Ru5u2kUpCgixK
	oTRZaw==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fxrsy3x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 04:50:29 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-14373747468so6648508c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 21:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791521429; x=1792126229; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y6PDhPtXFIAM/ccyT8/MEF2gGuCNuVMLTbOdYMac8XU=;
        b=R1FLQ3ed95twNhZCB+x19ix0cynVMxJRCjNOChpLnKQ2RVhrWvEYEnizdsBCO14Omm
         SpDOQpYkARVnddM+TVSx3FAglS2pYjrf5bqDV1069uhuQHOLHNi4kMQrjPGjUUM7JWzn
         qR6i7qLVb5x5qaNOwCFd+26t5Kyk9vT/4DjArdlPcoHC86Ad0XbXVS8mwz6RtpsabJ3s
         JelGT0A7JAPZ1VuaJS4jlKgIHICwBOY9+/k0fWEAJfaSKnVRg04tYfARUnBgYudyTMed
         +lzF3ccg4zlp2DNd0lHtNPPDik9Oq8qc0I+Bk8HLC1XnKwZaPp0cSwwDcihOhe80aaHr
         dwrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791521429; x=1792126229;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y6PDhPtXFIAM/ccyT8/MEF2gGuCNuVMLTbOdYMac8XU=;
        b=2DZL/NvjbSB7X8moZBlzNiDlU0CLUtrMrkwG17Ohvh9h6xNHLJa+Y36+W5z/OEZMMQ
         2Y3Yzi5amAXo5ZnkzgdsA7N3qHnWNZvCHM0WH+YjyK//hU76vVVudZkHQlaXPqz8Lm4e
         ++rrfjXqsP4+hGsALBjXR7fXt2HPYyzz+Hxv0nMKIDvu3d4P3J5Kf5W2VJAWR5evGiuo
         a7rOog78InJjXG5PCVeo4rTDf9ttAAZya2DIkcZvACUz6Vz0sTL3ihXar+JbXM3DAVVY
         NflnTRVUqy9+B8DATgjLGdPUE2P45pL0T5mrJdzYoMXLZKjrb/FwSwuqQt57I+jx6UH1
         aPjw==
X-Forwarded-Encrypted: i=1; AKwUvBzges2LFJ5dQrOgZZ1EiBElSSsUAzHoNHBUZIXzO6jKp5Y2dliYBeAIro/s1HXIBgEy5pbDH5cqX7F/2is=@vger.kernel.org
X-Gm-Message-State: AFuF++lBqC3Zjyeeh00M+kszpycNG1GPXjUazEXSMuJSAwQrer9ufWFJ
	s5pOf+Qhb/CqRe3MrmuC+ltF34F5nuIdoCypcsS6umCegk8kAOSFCFnDWT220162GB+ICrDhIt2
	sLPEaNLEpv6Kv7IfbzF/iVhc6f3co2zH9CJEz/m6ghMUUqJ7xqazrcZim9bk1A1TLyLs=
X-Gm-Gg: AYBFou01NDK9NhkV2L5ed00M/P6gOfc1SFL6owqdfNQGbD67g/cxEn+x6PJTUgoeaKf
	kbHanyq/1yoGY2K1IXTQR4bIjTCB1lkBP4GxkugcSlOX8eLJ6mjnt4lOLFJVKjbjL/dFspgi9OX
	rH+qZjWDrkFnIHmeSOWZYXZtCgIEs+yex6R2aww0fvSz1lEkIStfsist5p+H4p6CoMTVTUoTHL8
	sZlqiOetq8dFNb1Zw7Cy1h1JK948bBXFtx5Ul6xwrTimBvAgEYLvJpYFq3ZHmD5IjjGZrYEH12T
	yCyRK3SX8DNNcI+kSVgz1MH2wXF1GQrpGhWAfA4edWhYWKpvgYQXyFeMZgQNEv39pyG8/FzKkAn
	pTG1OUtwebcigKcteInn4xPb636UHjVcIqiM7IZwQkgmdZbKWesJDSdekc70XJSlEhpLAuTOcZp
	tFOiVQtJXB/oylP0+cegnCsq0+CdvnQg==
X-Received: by 2002:a05:7022:f503:b0:143:54c6:6a5 with SMTP id a92af1059eb24-16a6169583dmr868435c88.37.1791521428422;
        Thu, 08 Oct 2026 21:50:28 -0700 (PDT)
X-Received: by 2002:a05:7022:f503:b0:143:54c6:6a5 with SMTP id a92af1059eb24-16a6169583dmr868404c88.37.1791521427901;
        Thu, 08 Oct 2026 21:50:27 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a442956asm4151609c88.16.2026.10.08.21.50.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 21:50:27 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Fri, 09 Oct 2026 10:19:58 +0530
Subject: [PATCH v6 4/6] phy: qcom: snps-femto-v2: Fix order of arguments to
 qcom_snps_hsphy_write_mask
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-phy-v6-4-50408e45bcc1@oss.qualcomm.com>
References: <20261009-phy-v6-0-50408e45bcc1@oss.qualcomm.com>
In-Reply-To: <20261009-phy-v6-0-50408e45bcc1@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Manu Gautam <mgautam@codeaurora.org>, Stephen Boyd <sboyd@kernel.org>,
        Philipp Zabel <pza@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=E+1YNqdl c=1 sm=1 tr=0 ts=6ac87295 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=GpOyvZhAS4UUCrMfQdkA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-GUID: mBUXLZct_FNp-85oejphbWbEsI7CYEmj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAxOSBTYWx0ZWRfX1HdVJyJ9ZWFz
 2TAG4cKhdsJSuDXbq3nhUO8IUDxpb44uaS3EQfkXgqlPLnoCVYFfaT1PIkoyh0Rw9yVZZIWTAES
 QUb+sw0bRbpMzF6HluvI3qH46kdyy4yXZxZCDDdbi3wcDacWlhQcXNS3ZiZ0/mcYHh8+Q0Yu+Rq
 4m7tlXhJz3vFY62TNpvtNybVrs6q6SbdK6HHpyN3ngDPhSI3HvCA+CnXno5ikvZd5gn6jOXDsVd
 pPG8whDf29OYXW8mkGBVd8H4mzncEnxlSX1cWqRPewAho5JpxYDrOBSwV2YUeAwiRpLBlOmWg96
 GyMK4Jhrr4aqIsvY7mbU465lI9xiWxKvfO61+uOJENnWGcNggCF5mTXwnr6Lg1nFvHmZd9xb4vM
 f1pcdBmpiCbfQNFECM/klM6deBWqxK/IpL3ueeXg1XDenu/JWv5cfGahivyVyIQ8w6vlwGtGIlD
 uA36AHMYJ1yB7S0GKlw==
X-Proofpoint-ORIG-GUID: mBUXLZct_FNp-85oejphbWbEsI7CYEmj
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAxOSBTYWx0ZWRfXyrbR/1sMZJUo
 rUCKmnFDoKkFVKeCvRypSSo3Bzcd5dULwyU71cin9qDTZYu+QlO5/mz3VFjlycJUDIGEHLJwIDL
 UMAUo3BuqzTWHKLC0B01WwHtpIrRU7U=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_02,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090019

Fix the register bit field mask & value argument order while programming
USB2_PHY_USB_PHY_REFCLK_CTRL in qcom_snps_hsphy_init() and USB2_AUTO_RESUME
in qcom_snps_hsphy_suspend().

Fixes: 51e8114f80d07 ("phy: qcom-snps: Add SNPS USB PHY driver for QCOM based SOCs")
Fixes: 0d75f508a9d56 ("phy: qcom-snps: Add runtime suspend and resume handlers")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
index 980ad1fb1e2e..0ead37c0dcfd 100644
--- a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
+++ b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
@@ -193,7 +193,7 @@ static int qcom_snps_hsphy_suspend(struct qcom_snps_hsphy *hsphy)
 		usleep_range(500, 1000);
 		qcom_snps_hsphy_write_mask(hsphy->base,
 					   USB2_PHY_USB_PHY_HS_PHY_CTRL2,
-					   0, USB2_AUTO_RESUME);
+					   USB2_AUTO_RESUME, 0);
 	}
 
 	return 0;
@@ -426,7 +426,7 @@ static int qcom_snps_hsphy_init(struct phy *phy)
 					USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON1,
 					PLLBTUNE, PLLBTUNE);
 	qcom_snps_hsphy_write_mask(hsphy->base, USB2_PHY_USB_PHY_REFCLK_CTRL,
-					REFCLK_SEL_DEFAULT, REFCLK_SEL_MASK);
+					REFCLK_SEL_MASK, REFCLK_SEL_DEFAULT);
 	qcom_snps_hsphy_write_mask(hsphy->base,
 					USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON1,
 					VBUSVLDEXTSEL0, VBUSVLDEXTSEL0);

-- 
2.34.1

