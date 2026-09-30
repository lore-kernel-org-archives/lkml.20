Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C01CC448CE6
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 06:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790751462; cv=none; b=lFjtXU7NM0erEvT9AwjwFI4atWLxtb77GJi5hrBA6b/GgBzQNBcv9eulN9e2cn5D/5cE7YmNvi8fqOce4PyJ0wcWIOYAqbFoIlMrP6E/EcjEOirG8qy+/qatPAaZr2UeObr5/kbYu8qTIEHU5HIge3E8VPsIzIqj6sFUjlgrt8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790751462; c=relaxed/simple;
	bh=nUqbpyIAaXi6hS+BGNp2z1fpzLABA/dfQqUEyCPgVkY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=g+ZlQqyRstL1WvAUaDaSGDdpXzNJCS7Lr6i/qIiEmfJ8eNVkCswMNN0gJoeKKzHf9jbNGTOxOOaa//wG7QwYS2teBOgwbRsyn5pVjHnaYKDxquUi76PldzFdcL4E/y2qvX7DXs6qbNnqy1Huzm2Nd2liWAXKMVoO2+qPSAa2SgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n/Rel+4B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YWvhEh2G; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n/Rel+4B";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YWvhEh2G"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68U6ovnn3220534
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 06:57:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=bCq9VU953h/VksJhmq54HO
	kDRYMxMdtMzLKUAskfJsI=; b=n/Rel+4BmxgVSxuZBpsc9TepxZhntZGaSTaZLh
	qOcpr7nCRYuAzXu+gZ3/xVTebL+zSRK3/p8eXRWHZttH3PDgLjpbLD6n3z0f6EFs
	h8kf1Sx7jG7U202tjyHW2uhXi6tQeVjaKKZ9CO4wdpSQy+Fx/Xw6NsKiRA0X4tCE
	KL+28JgyGMCJepZ8a6O/6saKfXQ+UOsG7RNl971jyAgqmVye+5xU+4I9X7w0SHK5
	cOaSD88huCyxK8gCkTRHvuJeb7GaMezIYiszEuvPdlq6/xxmLOgbMDHVX5hZvUwr
	2qQOQ4q+MT6w+nkuug7jyxN6hcVGcKZ/kDucy34G9fmwtPZA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0nm3hxm6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 06:57:29 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93caa0ce0cdso13859285a.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 23:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790751449; x=1791356249; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bCq9VU953h/VksJhmq54HOkDRYMxMdtMzLKUAskfJsI=;
        b=YWvhEh2GhbTUKmUH17o1JQFdvT4COtIsEIAjCsqZum1UUmd2ybIXcaMU4D7bgiFJzA
         e/g50bPBl9/2nmlSWzrUAxK0Q00o2+OD9cW3lnzPsr6Dxg+6X7jQSLHfo6HDQntbkMQM
         eElFxMwi6RyAhu2pqn+bNjztuQVynXmN8Yf+ZpHWCvaOF/JriM6YF2VFiSS6LqLHEHWy
         BtBolKVlxwvZMx1kA5jhxX18Xmyb7+/vYTDz3g169uUoK/h0sKdr121o5dWIY39cyQnn
         pn5ParVOg6cmrw7myASLimvVTX7JYmOu9Qk7dBmSbSdnoLcwkL+/EZ2TTKbTcoILvlwU
         0imQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790751449; x=1791356249;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bCq9VU953h/VksJhmq54HOkDRYMxMdtMzLKUAskfJsI=;
        b=2J3XCxyTUyU7ObI22C9IMKRIaoTd6WFtZXbvni+EG+2epgdDD1hOIXm/Camu+nGlMO
         ii8EexKUsImbvkpW8YaOprbrZoR/VFPMxIMRTV+fAyMx4oN5cFJGtLxIj5kDXQ5NT8HI
         RjKIXFXJHh5d8HpA8pq2v4NDSvD5Ap+KjCZw4o+d8E4GbqA2oSNOUIzNEGe774ZdNDrH
         PIWQ5h2Aqw1FcvI76Y5+gmSgw7v+96bxClywUJ3a5ZZ7K6AyYkuw2y/Z69L6ZMrntRbK
         PlL97L+gpnidk02YvyDGHzE8ewJGOBD0sb5LUk4pBvvSDQoO1tUEpUwupRF7GkQcG4Us
         BAGw==
X-Forwarded-Encrypted: i=1; AKwUvBzADvduXIgJR2XGZ04LqOBy4OnwVlusIANYBmjvewYxwwJaO2TQhq7iHkrHgTG9tCNlZSKjPByAyG4iFUs=@vger.kernel.org
X-Gm-Message-State: AFuF++kQxO+7NI3bqs3DzWd9bhLeFJZjy4I6TVq1Ts7vNkdqDTYo7EuC
	TukzLto02gZIH3zvGxiDh9e+lBBw9A4jpT7dD8BBRH5EjchhfTfHNku9IOWU12zglFAcrnUJ1rg
	xfoI11Opg+6DGt65HLc32yIszYLbr/xZ+q7rmLNnT6ZM1VdDkDCY98SgTDZDlnJm/vdY=
X-Gm-Gg: AYBFou1Wyd4XxAsS71bjiUiaKSxEyo5wL+OG9kx+eSgnlJIvgXEe1I8H4nbJXT/35/8
	GNqF9naIIyS0Tcodbh+onhexHrnFJr+rcklrC+BWhev56lw4XvdvmSPPXPOmRWRmjUbDu1mD8XX
	RrOL0aXRZCRXTFFh33bb8ulQo0cgIYNhe+/aFB+GIagIESQYcu/9N+5oGCcymigOX0DUtndX850
	CJdwciUSxNXpFcNdZKqw9yCUKozJXqy/WnUuScXiIPD2/NlmPnQm48VIan1izvGn2TUuc8T4i1+
	DoCQUKWVukyIRrGUuB9bnwMkX5FOzEDWecHlLKWvPGuLhqG71edjmf6tXh5i2ooVON+H6EUa3Qp
	uK8Mt7eRJ+QjgTchMdi5ppngID2rnGS1SJNObFS1lzgsMlp9aBzXapMCQXntFb4LhI+HJ
X-Received: by 2002:a05:620a:178e:b0:93b:d7a2:dd25 with SMTP id af79cd13be357-93ca979a11fmr60702385a.53.1790751449030;
        Tue, 29 Sep 2026 23:57:29 -0700 (PDT)
X-Received: by 2002:a05:620a:178e:b0:93b:d7a2:dd25 with SMTP id af79cd13be357-93ca979a11fmr60699685a.53.1790751448522;
        Tue, 29 Sep 2026 23:57:28 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93ca82cabcesm51534785a.27.2026.09.29.23.57.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 23:57:27 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Subject: [PATCH v3 0/2] media: qcom: camss: add support for purwa platform
Date: Wed, 30 Sep 2026 14:57:15 +0800
Message-Id: <20260930-purwa_camss-v3-0-0fe2a5b11208@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMuyvGoC/23N0QqCMBQG4FeRXTfZlrrZVe8REXMec5BON12F+
 O5NC0To5sD/H853JuTAanDoFE3IgtdOmzaE4yFCqpbtHbAuQ0aMsIwkJMfdaJ/ypmTjHE54ygU
 vBAeaoHDRWaj0a9Uu12+20I8BHbay1m4w9r1+9HRpfzglO9xTTDBAqaqszEsBcDbOxf0oH8o0T
 RwGWjjPNiKldE+wQLCwELLIKcvUH2Ke5w98adouBQEAAA==
X-Change-ID: 20260409-purwa_camss-475787b87e14
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790751443; l=1651;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=nUqbpyIAaXi6hS+BGNp2z1fpzLABA/dfQqUEyCPgVkY=;
 b=C2t7y2fwylqsKdfwhSRECNpKLzvqY9dRIdrelYmKklwKCPFKyYN+aUNCkcSF9sMEzyiUy0CZj
 YbfNQ1e92BgCJzyomZu2XkxGkrqt24KpQnz/rTdxzhneE+mex6aapEV
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-ORIG-GUID: WTMaFscp6vvWXyn9wZgHAwaHivb1vRG3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDAyNyBTYWx0ZWRfX0G2CmB0lnPpM
 E5ZVYynnmj+JmCYYSUkjVo/ru5IaxD4B8SiXjT2RzSvZ9D14O85jzyhE7Gcjc9op1drVRYp4cU5
 GT99P/OZ87xh4haASrf6PJytDXkPK+H7LnJUL32wRDCkCL9ZkMaQtd1cYAZDS4kTUtoyv7QgtlX
 DOAvGLhsZCqdWMVOd1FVZhjH8vr5MFM2/87YBd26mzkulY/bO8WClt1VCosVIUC8QNxLB98uhRR
 IZ2j0Vpn15PPnaRYRFqWE/ysRsKk4IhKSLwp/Bqur3HE8rS/RTdTWWfVluv4N0B/NZW8uzh20Ny
 b95nyHVFWWSDvPOdxi9ivHWNaVbnOisycYGgCHRgZlqMYz7l43DFe0Vnh7+0nGZNndrEFrMHiey
 tC8t3PFbPJxbXZkSb+e6MWuQy1GiNZFOasHhVHOwjvLuO8JEgSo4YZAxSQdp+BhSW3wwslWpwub
 k2Vit3A6n2xLrBRuSQA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDAyNyBTYWx0ZWRfXwGicPGCCDHm2
 YAqih6gafQ3fC1ZLh6FRA5RxOp3qVq8stxad38wbDvFtj3dGkkNkNJ1nqNoMz9ZWtRI2e4g6JSZ
 PCcZu/QpQo/jEhHV7l9jr1kZdoOxTK8=
X-Proofpoint-GUID: WTMaFscp6vvWXyn9wZgHAwaHivb1vRG3
X-Authority-Analysis: v=2.4 cv=fqxJ914f c=1 sm=1 tr=0 ts=6abcb2d9 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=3JxAi99mYFQkvmeL7t8A:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300027

This series adds camss support for purwa platform.

This series is based on Bryan's camss-next branch, which contains the
CAMSS PHY API support it depends on:
https://gitlab.freedesktop.org/linux-media/users/bodonoghue/-/tree/camss-next

Validated on the Purwa EVK with the OG0VA1B sensor. The DTS and sensor
patches will be sent separately.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
Changes in v3:
- Rebase on camss-next and switch the CSIPHYs to the PHY API.
- Drop the CSIPHY 3ph-1-0 changes, not used in PHY API mode.
- Reduce the vfe_lite0/1 register size to 0x1000 (TOP + BUS_WR).
- Drop the DTS patches from this series, to be sent separately.
- Link to v2: https://lore.kernel.org/r/20260511-purwa_camss-v2-0-22608ab9126c@oss.qualcomm.com

Changes in v2:
- Based on the old version of csiphy.
- Remove Src clk.
- Extend the register block of the VFE.
- Add comments for IOMMU.
- Link to v1: https://lore.kernel.org/r/20260410-purwa_camss-v1-0-eedcf6d9d8ee@oss.qualcomm.com

---
Wenmeng Liu (2):
      dt-bindings: media: Add qcom,x1p42100-camss
      media: qcom: camss: Add support for X1P42100 CAMSS

 .../bindings/media/qcom,x1p42100-camss.yaml        | 263 +++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss-vfe.c      |   2 +
 drivers/media/platform/qcom/camss/camss.c          | 216 +++++++++++++++++
 drivers/media/platform/qcom/camss/camss.h          |   1 +
 4 files changed, 482 insertions(+)
---
base-commit: f511aa489480f1ae40dd336db9fa91d7950ee586
change-id: 20260409-purwa_camss-475787b87e14

Best regards,
-- 
Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>

