Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5B7C4657E0
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 08:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791448034; cv=none; b=c6aqO1bwxVolt+g0Nuu0z4J+fO1WhZQEoSlUB5iDY1PD9YDiu0vi42G2Bey1iZcGOSMx4cpCuXqPKeyYgM1eTsWwKdeOscUO+Gj2KlIlYlKVyq/r/RRSz80PB0QDsixvR4umKGN32l3cq/ae91fhtzbIKN2KvHAGxGPjLq8gZfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791448034; c=relaxed/simple;
	bh=DvY286Kgs9LpIkD3BgrOsMV5PkiyQTq3FRBZELc+J8E=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=JKP6ttaSOZH3S5rLpxSjmH6Wq5p6GiEPCXEeatfL2kplrURiN7VcaX8mqbZOV4BbnAp6Oz0tN4OW9Jds2a0HyyYK6lsjzNV7h67nPYWPQg5R+cpCRZcXb9WW+iBeH2GVYQlgvZEUjpLjRISbCjiTtMII2kuQPNGTDjW2ZQY278c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U5uBGPQX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iOky1WjZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U5uBGPQX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iOky1WjZ"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6987K9RD2560086
	for <linux-kernel@vger.kernel.org>; Thu, 8 Oct 2026 08:27:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=B37p6ZFYdaHkkMX6RKFojK
	hCiYRU07fS2ZyvpTfamfk=; b=U5uBGPQXb2/ryfUqoopPMymvE9wwESyofzbjqZ
	oSSLcagOnT0N26vDEpFx+Tumv0Y5lGvPwJy5wC3R/CbwKDNuKeYizIT1BAt6rwQK
	yMlqJCPYy1kKZWhHJ70WLXzzy7Tcj7asTmYF9wJecWuvRUtzqqr5utyfTpQXRt5L
	DII/zpSRRvpiLwaOcnagjRYyV0pNec60FCYuP3V9qX8Oga/8DXMDVfgrIp67tmje
	AhNcsKKYnQB7lFJVPUhQcu5zSayenc41ApYqI44sCssA1Ct8mdQ7FeWfVWRK+tKo
	GxSgwEXdvwPK0CNAYwM50zwdwfb7lpgUySIZ6y4hnkbR7/7g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe81vf0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 08:27:10 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5358515b4easo19773971cf.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 01:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791448030; x=1792052830; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=B37p6ZFYdaHkkMX6RKFojKhCiYRU07fS2ZyvpTfamfk=;
        b=iOky1WjZ1mTQvXMp7EQvi7wJVNNRE139ygTcsCualUWq/1k9q6t6JiOL3GrzXkSO0Y
         CGtgrVy9mXkwjVXmN+hQ9lsTsjcaNizvwho5vqsRzdUytjZnhypKivIeZBGKPMkb+EiB
         ENrmWDOUSNvRCp5y5q0g2TPLvKMM0surd2RIW1+U16wijmu+F4DwUmR23IsZetBmg/qC
         Moz7MQaho4VJIXdW4g0Hxj7d4VI3v4z4mY8VGV1q2OWHZkUpE4kYsLm1H4cPwwgWZCwf
         icBj81dP5k2wIfgE+08/7mx3Md0vkOyymt762IBFrD1rdjyKUKYFx7KEFAq3qPRi0Nce
         NjRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791448030; x=1792052830;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=B37p6ZFYdaHkkMX6RKFojKhCiYRU07fS2ZyvpTfamfk=;
        b=XHRPKTD+wRt2hbdlq3MSnSgE8CRD81/tX3HAdSkRUjZUU5n8znad5/LyQhc76nOM2Q
         NZoJkI7CvScUlJ+t1iqy77B9Aars0rZ9aKR7k3SuKmreMWn/adts78wUUR4wQy6Sc25E
         L4+B76E6ZNr+3XBbotyDdAocjp7cco29TIqAtGdIwZiq5lDB3iGcfqg++DjmZ3xrHNdY
         MYT2ZaI2BrTU1+u1/UU+aqTGRjdyfqeeYPdu+8TNgM10XF2sJNadb+MGLkadzjljegSh
         WJwHgAyLs+ZSPkE4z5gxyZNKDlsPh3EP309whM7eaTc/EBbjz1TAugdD/x9FoFLrJVcI
         ZK/Q==
X-Forwarded-Encrypted: i=1; AKwUvByXT/cMeDEK7CdVCHX5ht4OpoTy4sx/0Mkprrqd3tSRGV+aF46sap3SPhmh+BkI60Anm9XRP0TVXmlm2/E=@vger.kernel.org
X-Gm-Message-State: AFuF++mcpiUllB/W8F75+nltmL5vqA0YKGiuh5wF1FvV0lfeU9VAB/aS
	ztabv40paSIrlqacws1DeIcx9y9KfbW/S7MmKocXQNMOksTTw5i68CHotjvOY29LPO1AjVDk1dW
	84VZchbElNJPc6XQi8l649IneIybEoLEFgLvo8vR91DlXdOQ2ZOpRp+p1o/tiWceCSk0=
X-Gm-Gg: AYBFou3uuRsMICNGeLOsH/s2iVojxuc8RA784bKkroxLWKcRZ62MAGUKuvcjyolRqA0
	7f+ESzR6wo4UIAK0U1QDWw4JB86ih8yPgcSbBcbnLzQs3I/t1LOKJafMEmxS3YigwVhUzlCvzOb
	27hZNr8e9/oMo4udaIxdLs8W4tlpeA/nJJa35I0dD/MhvvR5PV7MtsiT9MM8DeMVTnPx1Aq9+RL
	IsCIX/EsFwzxIQQu5cSKNLeZCYRXyT3dVrpZ2acQNdoXW66EwRXxISXpvgfGCIAfAwP0W6o6eWU
	SDmS5EKab7zjQFa62KDOpO9ymWdQjVeuI3uGODp0VbK2VLV33VWUt15iji+zlFP9txYgsVON1mc
	rdi7bB+H7b/y3s6lkTEk8uzqlrKV+xfiZqfhOXfSznTDpmHY6y8AVop0RVFzKyc2kFoVR
X-Received: by 2002:a05:622a:90c:b0:535:16c1:264f with SMTP id d75a77b69052e-535753ed71dmr84042131cf.14.1791448029827;
        Thu, 08 Oct 2026 01:27:09 -0700 (PDT)
X-Received: by 2002:a05:622a:90c:b0:535:16c1:264f with SMTP id d75a77b69052e-535753ed71dmr84041981cf.14.1791448029301;
        Thu, 08 Oct 2026 01:27:09 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5357219c5f5sm38928981cf.25.2026.10.08.01.27.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 01:27:08 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Subject: [PATCH v4 0/3] media: camss: add support for purwa platform
Date: Thu, 08 Oct 2026 16:26:57 +0800
Message-Id: <20261008-purwa_camss-v4-0-bcf11bf2c650@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANFTx2oC/23N0QqDIBQG4FcJr2eoWNau9h5jDNPTEtYsLbcRv
 fusDSLYzYH/P5zvTMiDM+DRMZmQg2C8sY8Y+CFBqpGPG2CjY0aMsJxwUuJudE95VbL1HnORiUJ
 UhQDKUbzoHNTmtWrnyzc76MeIDlvZGD9Y914/Brq0P5ySHR4oJhhAqzrXpS4ATtb7tB/lXdm2T
 eNACxfYRmSU7gkWCRYXhaxKynL1h5jn+QPR+O1qBQEAAA==
X-Change-ID: 20260409-purwa_camss-475787b87e14
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791448024; l=1519;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=DvY286Kgs9LpIkD3BgrOsMV5PkiyQTq3FRBZELc+J8E=;
 b=VY96vHEHUrDOot2nltDp9uwKQjd8s/jdJDNM6WIGK5hDt5+b+NGF6616hnCa7QgSJLs1oZQuQ
 7t+V9HKK3I1AGTFrxyFNPlMSNKctKAJE39fDAVQj75WxGV8DMhZZ87q
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAzMyBTYWx0ZWRfX50D5fowIhlfA
 d85XCK9De1VP9rZVfDZZRD3txqRwIMK4Iwt/exyhIDkWTvtQReUHc/0cZRk//7ZSD4MXvPAkLj/
 bYr6LUMgA5qbKrQZTyNKPppsHFReF1VtrjOLpjoa03wXEEnUV6u5p1z0OAvc49DGTnSw4PSJMX1
 VFPzPku6mnJIP6f6HQ3bxtp//kJ+SwCyyzvf4aR1HQzOjz1rFvrkyyQAQjTz9od14SEHHu9wsnt
 xaJUqrlXd3+lqAscQfAJoiI9LKNh9y/i/78byrLr4Hybyv6jPzWUhXqNFUunLKegqAor3xIPi5I
 4zFejpF9U0cjAf8Lwq9t3N9bYLFF3c8Xh3lqiXmmDvUt+AIk/R91o2XYhcb8ShomiN4iuv+wHnJ
 piDJ9oaID/DSmXa6+WxKr0QfWFr643ZzNHTVGQdtQ7VZ4+havFlfVAvlkSb5sqitFBusCDQBbr3
 SCgtiV0QbsYqkHga5fQ==
X-Proofpoint-GUID: j2VnVV7u9wQX_lCE38WxNogEXHbLK6GQ
X-Proofpoint-ORIG-GUID: j2VnVV7u9wQX_lCE38WxNogEXHbLK6GQ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAzMyBTYWx0ZWRfX/GekuDniCa2c
 QYbz8DdDDCbbttCTARNO5JQH8GYonGN5mrdjeHzKymM0jAgjHTvwNK0sI1BE1JmJ3pMoXY5u4Ny
 xfYOg6sP+S40s+K+ExymgsiC+FWiCj8=
X-Authority-Analysis: v=2.4 cv=MPT1C8Zl c=1 sm=1 tr=0 ts=6ac753de cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=U4S9WEnYRaEk29xky1oA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080033

This series adds camss support for purwa platform.

Validated on the Purwa EVK with the OG0VA1B sensor.

---
Changes in v4:
- Collect R-b tags from Bryan and Krzysztof on dt-bindings patch.
- Rebase on linux-next and add Bryan`s vfe patch.
- Link to v3: https://lore.kernel.org/all/20260930-purwa_camss-v3-0-0fe2a5b11208@oss.qualcomm.com

Changes in v3:
- Rebased on the latest CSIPHY code.
- Link to v2: https://lore.kernel.org/r/20260511-purwa_camss-v2-0-22608ab9126c@oss.qualcomm.com

Changes in v2:
- Based on the old version of csiphy.
- Remove Src clk. -- Bryan
- Extend the register block of the VFE. -- Bryan
- Add comments for IOMMU. -- Bryan
- Link to v1: https://lore.kernel.org/r/20260410-purwa_camss-v1-0-eedcf6d9d8ee@oss.qualcomm.com

---
Bryan O'Donoghue (1):
      media: qcom: camss: vfe: Eliminate ever expanding src_pad_code switch logic

Wenmeng Liu (2):
      dt-bindings: media: Add qcom,x1p42100-camss
      media: qcom: camss: Add support for X1P42100 CAMSS

 .../bindings/media/qcom,x1p42100-camss.yaml        | 263 +++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss-vfe.c      |  20 +-
 drivers/media/platform/qcom/camss/camss.c          | 216 +++++++++++++++++
 drivers/media/platform/qcom/camss/camss.h          |   1 +
 4 files changed, 482 insertions(+), 18 deletions(-)
---
base-commit: b018686719706a781c45a874ed51374a2dc4b767
change-id: 20260409-purwa_camss-475787b87e14

Best regards,
-- 
Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>

