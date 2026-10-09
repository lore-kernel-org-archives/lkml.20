Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BEED440629
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 13:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791553847; cv=none; b=fOfgD9ocxQUrBSO0NWvwR47pkm/QDlaqq+s+y4oS3nS7Y/yyqw429AgWOUduJnmoDbnDk+LhCSchCdKzhj3b+ucVzAk9NG/DeMaRlTI0fv3wZkelPNNdiueXve6cWK7qnVQNGanS0kP7lCnhrZQJ6lHjQcYE0NWk3lwbfiW6k+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791553847; c=relaxed/simple;
	bh=stBxVgdNOgQWunu8kaDx/txPbyMtClwM95nZL+C2jD4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=VbNg89o3AKGiko4ynV2wdZw2MB50V2gyMo43nTUyPP9w3mhSN4HRdSJm+GdVM0fKHdzeMwCvAg8sgkOvCbtxRxR/tB0qXojnpOwW4PLmm1VS+zg3dxv/INhQ8gRcGb+P86CCAzxIDQlvPsOb9zyK+pXru8iO2EH7yAU+NVj1T4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X91fTtJ/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZG0/JRzt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X91fTtJ/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZG0/JRzt"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 699DKc1Q2408316
	for <linux-kernel@vger.kernel.org>; Fri, 9 Oct 2026 13:50:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=7rTJtxguyvS4KOXPA+y+we
	c2wHZ2XQZWGXcO09Ab0HI=; b=X91fTtJ/lv+mBrT4q93YwYkc2D9arYrDW9twvH
	k6LMNgNgSdstvuwgU4/ZoFhTDXXn1shQv/zF4Pjzhr5621M1KHYoDMrMGsV9Zw2m
	HgsjNLyL7LVNeqOvfHngPnl/Hg7OpKWxk5GUdJYTsWNi5+oKkkuqVZdceqR80+DJ
	iDLgU31qxIjEIJPHNmPOdp9dOGrVDyWXUp/00CJ3EbvfvAhoqqCjp6AzRFREEhWt
	Buh+mc94rE/GE0nte+J7BRQoHM08G/tZED+6ykCAa6LRU6kGxAzn9gh/m+N0oNle
	R99kSbDKQCRi1H64q6dyy1GeeDpo5l64ik1HMvOZLhD5bvTA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6ekvc4au-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 13:50:45 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc1eb205d31so7123998a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 06:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791553844; x=1792158644; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7rTJtxguyvS4KOXPA+y+wec2wHZ2XQZWGXcO09Ab0HI=;
        b=ZG0/JRztd0Lokjw71BBiXHRTxIjVbbWPUxpU1OElhJW7O9TCks79ZekmfT13Q/t9q5
         lZGY+7XustKasaPXD1bb4QICHKVoT4OCKivTM/CQFnFXMvXMG71P/xobj0Dv4rsI2RD4
         qqVb2MnYXI0kBJpKX5U14HC9FEdcNRQ2fqSuDaAt+OPxKTT9Bbpc2YZW6hNa/xx8XbG/
         cKOrOXXr2Ymo5JvLyXr4Q9cXC6Qbrg9TM9S3DHMSmGFWaBW4Po/9EHbWcbJIsN6YK4eT
         tANjWjf9O7M/foHJSi81co/g6aUlrDtiE/H1rgWn+PAFaDBvQNbL5YdWjPd4CI9/9y/t
         KebA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791553844; x=1792158644;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7rTJtxguyvS4KOXPA+y+wec2wHZ2XQZWGXcO09Ab0HI=;
        b=SnTmcT7Aqub8wcdOb20/2SZnGMfvqw1bWuKtTfaPAJfTPL9fQuUrGeSNa7gkL1/o+O
         gwisbNJROfq8pvADZ75+KFs2gh5yIFS5VJE8/FRg6xQcNOx1/t9vY48zBGGdXMeJpd4U
         ojaJFd8uxNfTpYClLJQAqFkePdYfvXXJQ7N3L9S4kFWnwHWcoJoBTGKAc47qSGOw7KsT
         0FM1hZat80bFK3XuODWOt6F+VZsfjJsSYrpTVvJUI2GUVq4doghi/oYBdPUOYWIfTuPe
         sgodD1+UUcI0MvbEKYaJVFtVwNxzsuZcpAbSMt+Z3M7NJM8i1baHEETRCm52TpZMPoiy
         Hf5Q==
X-Forwarded-Encrypted: i=1; AKwUvBwRXUJTQxB4/djqXdePVfoxQGljpPHZEQkABCla2nCwtrk3v38BhPhY3dgGf235uB8rIe4r+FsLryT/Qh8=@vger.kernel.org
X-Gm-Message-State: AFq9FYI2lbgxnPbyzLj/E8v6KiUf1LrWdyNg3WwWpIgxKOuDuaK5qOe3
	2MVMNh/YV7nRzgT4DGAHEt27Bnf6sjOcpZAEQGVbVbQG2KaomaAl2nFraumax3CJLmkpTLt1pMi
	T1VUfNwAo0HmMGTFEe+LGuOLv0Ze9Qp1KgeMAwnmgFnXTd3EuwIEHxmtsskv9xjny59c=
X-Gm-Gg: AYBFou0KHztIkxg3CQNUIuZ6q/4Pl5OwlDY4pdbi8m8IlQByRd9JZnxBHPiN4NdNPvw
	u+BvUa2hPT+Z94KXZDp5N3GeDW5efwcrIwpDhBc2m9UtVi74EJV2Ueo5PLvuRaoCRlizERwYEVD
	GGO3aadLTfH4DPAFFtDJwzUQQWu/cmxxr0bO7k5OJbuyr+eMy975k+KQmQWH98/gp0IguJJ/HNs
	DpsmWb0p1ZcKzCFqFeE0ZezZVIp2452cSy461n/M9ilzSnQmWYSHGbBY5oKlJxM/+38wSPk0eTU
	mDASKHWftLMPYofhsarwOfd3vlzE6Kgz2bEfa+r54BbHSrV4MpNKwICnm89Li3bNk4buHnYPfrR
	FCsGF8XXrrj2+3ShnhfwI4t6LaY1L/X1G1IhqfLOWoteG839+bivKsrAniMul5r6iH/HmSpUJ+L
	iROSyA7gxscWKpTloGIFmuB1fAVRbGV4UjUiw=
X-Received: by 2002:a17:903:2305:b0:2e4:949b:1ea1 with SMTP id d9443c01a7336-2e842cd4a63mr16545265ad.55.1791553844464;
        Fri, 09 Oct 2026 06:50:44 -0700 (PDT)
X-Received: by 2002:a17:903:2305:b0:2e4:949b:1ea1 with SMTP id d9443c01a7336-2e842cd4a63mr16544985ad.55.1791553843829;
        Fri, 09 Oct 2026 06:50:43 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422c9944sm9574135ad.64.2026.10.09.06.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 06:50:42 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Subject: [PATCH 0/2] Add LLCC configuration for Qualcomm's IPQ9650
Date: Fri, 09 Oct 2026 19:20:30 +0530
Message-Id: <20261009-ipq9650_llcc-v1-0-572e40b18522@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACbxyGoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDAwNL3cyCQkszU4P4nJzkZF1LA+MUc1NzMyMLiyQloJaCotS0zAqwcdG
 xEH5xaVJWanIJyAyl2loAK1M5dnAAAAA=
X-Change-ID: 20261009-ipq9650_llcc-903d7576288b
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Conor Dooley <conor@kernel.org>,
        Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: Jr0C46gZ7H4XEmaPjnvUnLH9QdvFksn4
X-Authority-Analysis: v=2.4 cv=csYOAF4i c=1 sm=1 tr=0 ts=6ac8f135 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=rfC8kGU1DnSi0xxC8ZoA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA1NSBTYWx0ZWRfXxOU0HxgH9ajK
 mZn52ReZ+6lcwdHFBtr0tJmdRHjDZoQL1FcZjorg3tpWfGWNM0hEeThmCIvGDC2BRqJ0Lay/GAS
 VLaZixyDFnWRPS3Nn3LSF2htOys+oqG+0tqE6hbZwvSmDK52GU96NcgUglzISfjazh1435rMEWA
 jT7Jn/HzYVfhUWJywV16/6j5/kjCu9QdY/n5NlQgRG7XRZL0xjSROcdCC+SmM2EVWsTGjLaWjNn
 CdfUXZzSpI1aCHEa++p6r8lWRwcj8MeZH+sYyHxlotFFZTyuo3OdRqqmHUlZTGKNbDyNq6ysSL9
 TJGOzotTne4hfVkHK0IKh4toxduzzjhyJo+Ytvu9Ume/EbsZJ3QMLDeDyYWYa7hOpjVBjLELzKd
 VcB3XZOqFzYfiCa+EryHGRsVkzZOhbC8ygQNvpSY61MlIlzJdG+L7/jwcEJOmIFjM/MjGbfZSLC
 Ta4aufzZKDrLUOJ/yRw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA1NSBTYWx0ZWRfXwIwiveFRRWK4
 sFsdXMc5dC9YnipW1y2b3pGa3YoJbPIAcMu5/exOHwiSZwPOysaHCwWsM9IURYKQWGMMEVATYv9
 qqSLEmJggbjh7mmEzCV5ywQOrwMpQBI=
X-Proofpoint-GUID: Jr0C46gZ7H4XEmaPjnvUnLH9QdvFksn4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_04,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090055

Add the system cache table for IPQ9650 and the IP version is v7.1 but
similar to IPQ5424, there is no broadcast region.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Kathiravan Thirumoorthy (2):
      dt-bindings: cache: qcom,llcc: Add IPQ9650 compatible
      soc: qcom: llcc: Add LLCC configuration for IPQ9650

 .../devicetree/bindings/cache/qcom,llcc.yaml       |  2 +
 drivers/soc/qcom/llcc-qcom.c                       | 76 ++++++++++++++++++++++
 include/linux/soc/qcom/llcc-qcom.h                 |  1 +
 3 files changed, 79 insertions(+)
---
base-commit: aac26bee2287c88af5be5a5ff96d783b19a28790
change-id: 20261009-ipq9650_llcc-903d7576288b

Best regards,
--  
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

