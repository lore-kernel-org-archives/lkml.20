Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AB994F054C
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 12:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789646774; cv=none; b=Nd2SL4dVMP5JJG9hd5BKuXdix2+wMC5HZHCzuuxbcgATpCUt3QGpIcbgn/OA+Ew4dCtsErvOIZq6pRqwPUaEZEz/vzrt8DDfg+bqhrkCR9dKFwLytiaue/3OJ5vWTAB+tSkGficWznxZA5ZEAQLj0dTKHGTVMQTmSweA8udtzZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789646774; c=relaxed/simple;
	bh=bicoCk8fBJXyVQOPXIB8KDJTBtOMQ5lAhdZI61Ev1rg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MWtE+pE3TrsRm1bfQIPBy3c+tH4xkKCiCt7i2vIctPcpFznZP82QF/gFuIy8D4R/3gKxu2jDHjCLUCIN3tIgGeEoCjUyhH6cIp4clwDrVjPAQhyPRc0wpnqZ7hNbRLlbUg8VxaGDzASwCLetpUorm8aqxGLy/C8YkuKnKFauytA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H6BB9sbn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iEwIeu2A; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H6BB9sbn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iEwIeu2A"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HBop4e2013121
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 12:06:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QcN9cxBCESt1J3bXNleQd1twegh5vS95kmmxkUSr+u4=; b=H6BB9sbnO7VOarVM
	JyvJu9HR4dFUelkONDeSyz2/0SuVydHLIcQVsBw+w+sLzN6FIXG3VyKisjbic1Iu
	0iWBFTmGzzV8SjLlNpx9++uEh+ghnTsHUCgMQVnluz1Sut3W/AWcc/ktTTRIFhc3
	PtP2H0XAzwkYk2j0FNjERAZERTa05BXTKgOycQLaAxOGsnrEUBGTImAXT297PbsR
	v1Niona2413WsyelIiMeKMDo1tKU74uikSsLqiACGKT3QeVmfL3BJ/EIHdbGZJSK
	Z6Guyf+tokmxrIHQozZVk9EvPp/r6E6JEQtE9ifd+F1uiigZ21HcDuchH3m3KqHH
	E/AJXw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grfppg1r5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 12:06:03 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc4e496e5c3so648909a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 05:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789646763; x=1790251563; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QcN9cxBCESt1J3bXNleQd1twegh5vS95kmmxkUSr+u4=;
        b=iEwIeu2AzW5MZKbCsEmKtHkwm7Vszvx1+9la95zDFCZrUhbnW2fZ6MIZxWDdm6g8WV
         /y1pvSyPdeF31DfTzNkKXTmgw5qZSWuv9l2VlEtsEs1+ou4q2tkeVaKVAL4arKANewSG
         XL2iwg3DmcmDkMRVqlfnW8+D1gnsB2axFB1Y4fX0BGBDisA7aMFISmGoOUq5yHsjxmZp
         7h0Svq84ft3HX05LZrfuYKp1b+tf0pu8cvqhSsKknZxaXdP/j83i9/vantKa5+w85BIi
         vyqSHqegVSnzKK66hbelkfyT7+QfgFXZ/GFfaLqLVVV2wKOqLpBNTN1XKi4AB4LXjC7x
         XasQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789646763; x=1790251563;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QcN9cxBCESt1J3bXNleQd1twegh5vS95kmmxkUSr+u4=;
        b=e4H+ZHdWkDq+Eq0pUFmQEvPYoLA265jUJmvCbHrvtp7NAe99xFfDeVKz3ieRsRccEP
         FHNeKQYFjjRDeTTcExIw0q31P3QW/uQ4/oclUZDqcoDWNovEJKClM4Vo7DFJQPFSf1js
         dmRYSGoW1XBicMuLOlczNlHWOBJoe/0JTlw2zhPX8oSmxYLvY9axqRW96cNSsazcGjEc
         AkeKEp4+27wzmWSpXzZwoFHZQxAEpxlHiyMJbgoC0ZXL7UbniUP2xhPD1tNfAZz9qrNH
         x2qcbljfADv7SidN5qbLS4LnSOSKM+29j5GbBUDg9/MR552TmEhkJoWJGO/HZfcK/M/x
         8OyQ==
X-Forwarded-Encrypted: i=1; AKwUvBxEF5yyu0RIe37WEDTsycqfv2oJx2pJb9eCuDQAZTNtjObfKQTlIq0dh0hjMjTvFyJcbQG+N2+/f6cF5bo=@vger.kernel.org
X-Gm-Message-State: AFuF++lNSBJPB24H1DvAHvfLSzps0raU2KGiao+m/nU0Mdr9o7zm6i38
	AdSP2wUOtQYImUDk7R1EEEPDSR51oM4iXd4QezXjF0l8TMIsITNkZfvIn4abbYwqErTBJn73Sug
	b1NsFQwjX3bH+ClOi2rT5KksLxWfNMFGOu032ssjeXgUZay3wQuxFp6FeFUz2kNnHjEQ=
X-Gm-Gg: AYBFou1Jp0qpIpGC8nRhtRK6wxfd4AoqulaOmzYfFoPMl2rY1QaxTbFORtQyIVFvyT7
	f7/ZUbgcsXQMciFgun6TxNnmB0uDDuSJAw/Ww177/8p7xhJkbwq0HX83UinP7m4b/mrJcMIzbLp
	sebjgcZHr8395O2reR5N7A6/T8ecJAKu3OtzCT/y3e36V5wsy+nE2AFdrTHTEUlS4kxFSOqJW0a
	Fa/X84U5YTh+4fPrVGnq6u+TC6lxeyDsEkcE1X0Mllh3OExLdLAexC+XmCrmSoipqwKrfInVv6o
	nZRLmgTih1S/XxUYBrdMd7JIxWAHmCTczpawX41jZjGfELO28uJtkxXxUbBbwEaHmM7CnWbc13/
	+pxbJeTyhxd3t3GUd7UeySlA4ntzXqg==
X-Received: by 2002:a17:90b:1648:b0:39d:e43c:5a0d with SMTP id 98e67ed59e1d1-39e1e2f9e12mr14454823a91.8.1789646762726;
        Thu, 17 Sep 2026 05:06:02 -0700 (PDT)
X-Received: by 2002:a17:90b:1648:b0:39d:e43c:5a0d with SMTP id 98e67ed59e1d1-39e1e2f9e12mr14454734a91.8.1789646762209;
        Thu, 17 Sep 2026 05:06:02 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e35d9869csm5007612a91.4.2026.09.17.05.05.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 05:06:01 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 17:35:41 +0530
Subject: [PATCH v3 1/3] dt-bindings: phy: qcom,x1e80100-csi2-phy: Add
 Glymur compatible
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-glymur_camss-v3-1-1d0e2d47ad2e@oss.qualcomm.com>
References: <20260917-glymur_camss-v3-0-1d0e2d47ad2e@oss.qualcomm.com>
In-Reply-To: <20260917-glymur_camss-v3-0-1d0e2d47ad2e@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789646750; l=1015;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=bicoCk8fBJXyVQOPXIB8KDJTBtOMQ5lAhdZI61Ev1rg=;
 b=Vp6CS+/Epro3msMsrHzNjpbJRpl0Dzqcy3rIa8rXwAaoIaTSovFc022WtbnFpqPXNDumH/kpK
 xVrA6iJTmv0DOaolFx4T1drOvYXTwLp4Ztaa5UbPhdFP+CvTy96jJTV
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-GUID: HoCm_1mFu1WjOcOBpImVSWIpffQ0FRBh
X-Authority-Analysis: v=2.4 cv=YcYodARf c=1 sm=1 tr=0 ts=6aabd7ab cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=TrU-ok46ffbKF8Cuv98A:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: HoCm_1mFu1WjOcOBpImVSWIpffQ0FRBh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE2OSBTYWx0ZWRfX0cPBEfjZd8V6
 pm16Aiao44tYIILViiEFjZXp651RJ3Rj7wTHi4z95Gb9NYlyMP1VCDRG0iFSEn0sb7gxF0E+ctv
 NnClHlv1Lf6DnPUUO+xQJDAE55GiD9rSNL6hI4JLqWxQmdXnLFCjekUTvOm+xxX5l3/P7uvPSlK
 A9W5OiQsgHeGtgNo7niIHwy0sYqwgqe96JDtv9+8KBEz4FF7hVNEH5/vOUmzukJFW3Rj7tt2J1G
 +CCddoZ/VQuqDXIPihjLxaCNvP10GRPPjS0xa/o0znfFPaledyOS50bOim1DRJ0Xwu6oGxYOEjD
 0orv/f0ecfEtMfKFU2yg8+47a4/Ma99+ed9gbuXd1NoRZSN0+LlKAqOdyFWe8+AH6gyGuUAzzWg
 2K6mc1jG2YzqAdv+CXPAyQvftAHTpaG/d1FtqP+GlS4dauQOSYCPb+mNO6ukcf14zBXDdpz/d78
 qLMCj61FKdHGkb1GeuA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE2OSBTYWx0ZWRfX8touGgP1niSm
 5TyLwB7/yeM2V2ddCk2JEkmdPP3McQB8/nepitJYOMm9PG23oFQ5a3Ng60KtKpHEZd2uVR8AZV1
 lWhrqUX0IhZas5ExqXkWAFohiUAkspo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 suspectscore=0 phishscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170169

Glymur integrates the same CSI2 PHY IP as X1E80100. Add
qcom,glymur-csi2-phy falling back to qcom,x1e80100-csi2-phy.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
index dc64af97da6c659628729a758316353798aa98db..1f1e2a4993b2aff9a1519640bc4e04ca98fa4baa 100644
--- a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
@@ -16,7 +16,11 @@ description:
 
 properties:
   compatible:
-    const: qcom,x1e80100-csi2-phy
+    oneOf:
+      - const: qcom,x1e80100-csi2-phy
+      - items:
+          - const: qcom,glymur-csi2-phy
+          - const: qcom,x1e80100-csi2-phy
 
   reg:
     maxItems: 1

-- 
2.34.1

