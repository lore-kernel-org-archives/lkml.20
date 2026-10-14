Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDC1C55D871
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 16:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791994791; cv=none; b=YsjZ3ZxFRZp7FgmhaluAKyV3dpJlLwuw4TKbmb8IqCRUwxklTO/lPDCKZRznADwQo+f9KeLyh9AyLfH0YftHTx7BQcfuQvwmetmMuiaLqioUIHkimE9hBsUwb8j5eM1zb/xs50m/K+fD9vcEs8I9aOREKPSHzqlGpf5ZtwKAv3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791994791; c=relaxed/simple;
	bh=BF6415btVpAVudmuKDsPZH7SQiNfH+6JB5g0CaPUoN0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OJKs8I5eIxlCqpaX/2kr8I23JlRSc2gisBZhlC6okHdm6o07dWEiKtz8Anl6TjOCZ8PxouPrSrvJwA6lg6HzM8oqfJ0JZU2do29Pjnmqdl7XblywgDPIAe8sFriyR88EbARDUgoiqAYscNBlmNkzpQQw5L7wSUDs6PdjliwToCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZZyOJRqI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=grK5mhDs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZZyOJRqI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="grK5mhDs"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EEbI78152354
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 16:19:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cK9XIjoJkCr9hVq/5NleYDwc98kzEkgjzgNbxN/oBho=; b=ZZyOJRqIYjFAd7S9
	dr/0WglLBWaRAH8j+8R5jKtyzsdd0bstAetyP4LOuG/xgaQ9mbi1VhfZdf2+tYET
	HUjHSOFOkMD+09dIX2ftCeM3clRebEU5t0FB81gFpOk9XnaFIy7T9tMobUT4aXqO
	1lvHtuix28sn6JEUKinpqGdjr3vjQZxHJsQXG4XrEgv0YvJG9m57BpmpgIDIPn/5
	PW6TtUdR7Jlewbdy21yz7Y7R4jz7n3esc2iLQEJsh5o4maLwrwHrA36GMNVhNzi6
	1jrK1bZOYyk54T05VpIv1C1wxUKOLn8EnmetzChmL6VZX5rRSFyFzhWsHseBFdXy
	UmOnjQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha7aehk89-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 16:19:45 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93a082c014aso277574685a.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 09:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791994785; x=1792599585; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cK9XIjoJkCr9hVq/5NleYDwc98kzEkgjzgNbxN/oBho=;
        b=grK5mhDslRh8w+R8Mwp4NvPrcmUdc7BUxJeD1lv4SxhUUmB8V8QLiBvsRbEO+GkoD0
         tGDilTNcuMp7laiN7CsSEu/SwluI3NjjSXq/7qg0Xn6FY1zivMQDyJmnenMUVXspIE1s
         6cS+JwGYHT0GYfRhNNLcz9iCdRcl14DW356X1XGBFFXk+CaeD5aONmIx2ulBOEG+DfxR
         25TeM+WgbsVe+NrVhbluqEZahbyrDs50ciWGZqZiRPBLaPDkPTHandKwOLR+QanqqQda
         HoqRLp2WKUCkE7+t+MMPMxzBrlxhcsKozDrg6qEel7bz83+zFy1EqC7s6mrG0/zRhhLI
         0v5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791994785; x=1792599585;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cK9XIjoJkCr9hVq/5NleYDwc98kzEkgjzgNbxN/oBho=;
        b=MGRx7TncFjV/312kDSJS+u8CRhGIUX291fUg7NhlIE+2z31EQCbh2/w2hp8Yo0EwQ6
         cAX4P9o5di5zR5fiY3qvfiEbcm8fLM2h0Kfwsip0rmDdLd8A36+UzF2jZRI9Z5Sm+gY/
         AZFl8zCd4DarGjZKM4Ol2RZt7cghXnF22vUjl36Q/rAzdq7CZBeHrED65tbYT+RoM3pg
         P5SbUs43G2+fLksYaRGevAWr7BSqcnFpfiq/v6xWDT/j/Xo9T2kgw+PTiS7rqmhDSmlP
         mqgpy3/yhAGyMygOhY2TNi5gXL1yFhpz/Fvwss12gWSDOmuYazxGMDX5VKXYvZoIs2St
         kcOA==
X-Forwarded-Encrypted: i=1; AKwUvBy1YttjD5DAnhMUaXK7dY1M08VSkgDcKcartHvTJavymNeb3IshyLXtXn09pc93hu9164cb6GelskX/VXg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIObi2tb0LZJ4lwjyGTD7Fk7SePSEPo6UXgIAWAD0wC7+dWdTIh
	CsOWsR7L+iiQtN8BbByDfhS7dsQtmAf9o13KEU349ELGlN2FuDjJrjKmlKQRS1wtrSernZ2qizP
	kDZtP33DRfrCVHD5ZTdTnDsfjBRzm6OImqo4Dx2qzg5CeTWGsBw4bREg9cubUBgdKByocHRAVKr
	M=
X-Gm-Gg: AYBFou2Sh8hJtFZLdAUII77JvcNZcxKWzorWlWT7kmmzXUXj3iN4s6UioyfJSlwPIVh
	pH+MjV7r22wPRit8MxmISVlftxXAHydsSdPIT7UGg4DafMZdCc7PQwHWG4n5hqe8tPNsVZOLHU8
	6nSJF/jPDPatc1xQ3UPJnLpcsNNPUCKlAy89gOTHb60Bh/PI5jlyNTZagXfjIc/5UPkJ5g7oof0
	g5gRYorefApfWBOUVDq7tQhu/xkMK/G4tCdhNFoXr+GEqbewDmdo1Bgf/GJd/+A7odMfBXomLrI
	nyJM0JrXFHKJnzCpLoZk/YuCV/qU8UobGuYf9mX7H3MxzpR7p9o+cktnOzfw5wTSyndDPLunhpH
	cCbdg+xDO2TDf3mRmGgo+Mzqk/mrCWFzPRLkSznUDas8AfsYveViSIZyTvkP6Ot6T54QtbORrvu
	8mFyAChsRZEaf8
X-Received: by 2002:a05:620a:4010:b0:93e:e1f9:4c2e with SMTP id af79cd13be357-93ee1f94f88mr1408416285a.5.1791994784839;
        Wed, 14 Oct 2026 09:19:44 -0700 (PDT)
X-Received: by 2002:a05:620a:4010:b0:93e:e1f9:4c2e with SMTP id af79cd13be357-93ee1f94f88mr1408413885a.5.1791994784400;
        Wed, 14 Oct 2026 09:19:44 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be33d7d0f6sm740187e87.38.2026.10.14.09.19.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 09:19:40 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 19:19:18 +0300
Subject: [PATCH v2 3/5] dt-bindings: arm: qcom: add Qualcomm SDM845 HDK
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-sdm845-hdk-v2-3-6d0b4b42f267@oss.qualcomm.com>
References: <20261014-sdm845-hdk-v2-0-6d0b4b42f267@oss.qualcomm.com>
In-Reply-To: <20261014-sdm845-hdk-v2-0-6d0b4b42f267@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Abel Vesa <abelvesa@kernel.org>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=843;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=BF6415btVpAVudmuKDsPZH7SQiNfH+6JB5g0CaPUoN0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqz6uHJJ7m6faoZhSn2B4QgkaU3xA4uixppdDOo
 qz9u9klJLOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCas+rhwAKCRCLPIo+Aiko
 1TX4B/9Zj+v7JOjDrwahfYekeT1LMY5X+HCPT314urp97pY7q1yWMbNC8QLpJv5rirx7PMkd0cw
 w5HlO9Ujt4PvUxWm1x1TpEZuRwsz7s/RfKP7/Ckoi6CrfSgMn12t3o5OmPi2XUhRLHlaDM5p+el
 EBClZ0ZMOIGO/N4aXP/hIJEAX2YXX+pkXWGU9gE5lU0H1oV8QgxWKuBwETEUSRJKubpkQbSst8+
 g+mHxx2pnPgRqVvVCMjqXwwsT5HjM6QNQ8hVpHxdWLV7+QEH8QKU6+Lix8zmBEq6MtmKUrX9Vou
 1Sk7e/bhS+l2qvWOZu1nMEmfUMR0GoUPMtTS98n2LHeY/i8O
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: NH7NNynHNgm3F3P7RsgOyq0rKgfQbUWS
X-Proofpoint-GUID: NH7NNynHNgm3F3P7RsgOyq0rKgfQbUWS
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA2NCBTYWx0ZWRfXylH+g3+14FWm
 LgR0/g8y9skuu1cinG8wmnIW0jkjgwsrM4TXwD/ekqw6XJud+gLsfNu31fWBPGCd7J39yeEPpEc
 zoWVboJ8IjxD1jroJySV+b9uAzcYUh4=
X-Authority-Analysis: v=2.4 cv=NctzRGD4 c=1 sm=1 tr=0 ts=6acfaba1 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=9nMZPvWkDyzw5AdY2PIA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA2NCBTYWx0ZWRfX7xHaICRjPvM+
 4Ew1e3b5D6ljHZN++g9Wu8hyvay5vIcgcaQMYVeKPZJPAPQAZdVrtNciy+WghnHbjOJfmx+hSAm
 RE39U9jSkpGGepLZvzRDoWvSSjuKmO3CVf963rWyBiIt1uccgAPHNJIrH0Jj1RFCoGYRkMXewJc
 bC3TcicXamrn7HGXv0GTRIxiQWutkPDRqc5c+GG4aoFFsEpyeLIVaSDBVo/6GxDWMHGp8xHCJXH
 H/InKX9KGqZsBuQ+U2opBvms/8Opvn1s12M9BPHKFnyglRVsHPvmj5TDLQc3dwh6UCt+GW3KrZb
 aNOkNPCaQa0JxwJCKLWx+51cx1UpBoIfQ7NOxq5xgZIKstuBRR6sqlzdPn6Gf3YOZRFxq8BWUgb
 3PqapcG0L6/vGgd4E/Lb07sBKcaryME/U/tJEToe2LsHxl0NXWLcHQmm+oDncSkRgTASwc4L/OE
 ZRzdaLOibgBA/DT6heQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 lowpriorityscore=0
 spamscore=0 phishscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140064

Document the mobile HDK for the Qualcomm SDM845 platform.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 121ca557ce1e..dec58f8818df 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1003,6 +1003,7 @@ properties:
               - lg,judyp
               - oneplus,enchilada
               - oneplus,fajita
+              - qcom,sdm845-hdk
               - qcom,sdm845-mtp
               - shift,axolotl
               - samsung,starqltechn

-- 
2.47.3

