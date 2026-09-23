Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D4953815D9
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 02:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790131302; cv=none; b=G3MoPbrZBwTtsPN94vZnoq5duSTp2xbh/6dVGXa02b1HCl1XXwAotaJypxnbMXE86y77R0qlnDIi7vjNBnht08qN/tRFldHixWinzvp231xNdmWWpo826oQDBVA4jLiTPj1h7C5iScHCrwb1qQQKu2aP2IDUTRs5LunRXMM8MC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790131302; c=relaxed/simple;
	bh=6W4dsjkfRl/Sj1RIgToenplnggLPBgCwwrA3fqw+8cA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ViumLTEoRr5uvo2swr8UZzmZ3cmXG488HOd4CT+yx1KlNjPzV518lHfumoCcq+1ZfniBqX4uuusek14jEyYvPZ4A+NtuH3GGS1OR/rGn1RaCptCPYN0umIB5KDlA0+EgB6CNiGCa3iIUcvkbVFOxjgay9RkvsVPRYDAq+8XRVhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dQmKZIHc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i+YkpaDt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dQmKZIHc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i+YkpaDt"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MI74gl1509179
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 02:41:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=XzsBCUfr/tvP+BXMa4Jwya
	UlDKrUH5xwKDULaBLIe/k=; b=dQmKZIHc5khs+E5xsgTmhKgxPdQlNehNhmk45l
	dDGEFfeDWINstl4jgG/OarozDSsv0u8K+zntmfDXdKt2Z0FT61LRvq8B7MDgTLe4
	jPC3r2HbmLsVxB93VOhVEXuNfa6r1XGN00DC6tBdmkdDmuPX9Pa3ZOUT2yaSfDal
	RaZsx/v3YgF9NrGKn6umQ+/vKN0j96dNXWtbkFp5fdU4N+h5qpwVDnFl/cf+qNSO
	jUrVYt1bdNEBg0I14QrK+zRcDCqhoS0PhdjAI0VnNvhyGf050vD69IXT47Ru+D4/
	/ZCS3cmhXD3Ygn3rtFImR9TaZRD9Pat0UDCtJ8Z/ZiKhqr5w==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gux7xt4ey-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 02:41:39 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39de4e72b33so750113a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 19:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790131298; x=1790736098; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XzsBCUfr/tvP+BXMa4JwyaUlDKrUH5xwKDULaBLIe/k=;
        b=i+YkpaDtyyZNHhBnj0CdFhQ5joIpU8GLt9yEjxjDv/K/AwjGPH3kU45v/NZaMF3IaD
         nBjothiOEyNtoduipXhkByhgyrztUJftiGa8kZknz2R/M7GYBisGHfHsegUhQcAtSPCg
         ZF4UBQpY04U7wErZ0B9AFXCYuoXVylgY9cLoB4sHjOMHvlg5lm3ED+AzOmkdhUDGp+AA
         pPJt2rwvXlMBq0WSy86MoAus1X33nnYDEM37Mpq/ahDgvBE2+k6iWATOIlisQZ3Oxned
         vFaeWt5HGcorTLtUWMJ/clLnHRjoNqRaSznKr5bL6C/ehUpfIGOJaU6R3pB5sw4cqPM9
         Ps4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790131298; x=1790736098;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XzsBCUfr/tvP+BXMa4JwyaUlDKrUH5xwKDULaBLIe/k=;
        b=K9ClpZyHYuYWS/HlTqHK8V59X9uZ6VuglX8HFLQWlz0eULSnkzzBRInb4/fe9EY63k
         ZndbImQDhTy434QqmwSsWJFvFLmr3OKPOHvfa3DSoAWlYzE7IbBC06hD5E7iPYB4Ntmo
         nFDsfNVsCYnEy2wUSzfSKD7hVy7lt5UBBDXDdcF7mTXnUXSxfZo7FSM4HAnIDaBWBx1O
         vGdHO4KF/ajiQo3GWXRaz+2mnqyfImVYqb0VcnteAmWqQR4LBy+deidtepq2HkyMFxxl
         n1FNLYgGzYHeTPkuTbWohdluT9Cl4l7DpnEZCsZxCFzOY++loNcePnWq99TcAhVRPlnD
         JskA==
X-Forwarded-Encrypted: i=1; AKwUvBza6lDsBoMo8WD58TDLu5ROXJA41rxAQnMdh/yaPNOWDTnh3LWwqbAQtWxccCuKesMANbE4rDa8RM9wUCU=@vger.kernel.org
X-Gm-Message-State: AFuF++n0C17MvyhpRHlbtqtlrD+TEFRE+QTke8bzVUqODQySb0MSySIL
	2GB4kvI7a6esWAz0MRxM8dkBwTUIyVMajftsEXrfCwpx3lyD853Q0j0HuPXWWCz7MicvdKR0nP5
	WFxoHg/gWnUoIqL9Sr+hURwJPr9d+Ks6Kw7dsZllEQ+FjJ9UniR3uVPGtsaT273YuB1k=
X-Gm-Gg: AYBFou1BX24+jbgSVUtlE75OHRNdUvqsEjTnAx6d/xcv/FB3vu0hunA9JMTeV72ex3d
	oCB6u75TX9NZYzzbhgOVeg5zuUExVxzE1ev7pAVY1W87QS4avNBasSBBPrbMFUaJBzK9FhOj5X8
	UOLYaCcAGoFx1IJSmjimPGB3r/B6eAVlBVDHeevx6t6gYf0wFKpHS7WlwCCy51MS0D1PYSbkvHG
	eNivW6EUEZ0MaZZUv4ldPZEIob/plJh3BITH0/6ilYT32JewpRtqdRg5SYyCkvL7fHN6Cq85wb3
	xmrTubdxfk/xtMJwgXEUPJoOQL1RgImva13s+I+0YkMw1pzpkQT66ow/XmjkbFTv1zG3fM1KRnM
	5BdobGGPi5h13h7dtBx4iIJceaez3bstEEtRgEReQJ0q0X13xFK9llAoVuVmnhjMeBEuX94KFzg
	==
X-Received: by 2002:a17:90a:e710:b0:3a0:345a:3646 with SMTP id 98e67ed59e1d1-3a07e6304ebmr1407970a91.45.1790131297981;
        Tue, 22 Sep 2026 19:41:37 -0700 (PDT)
X-Received: by 2002:a17:90a:e710:b0:3a0:345a:3646 with SMTP id 98e67ed59e1d1-3a07e6304ebmr1407936a91.45.1790131297491;
        Tue, 22 Sep 2026 19:41:37 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a07ddaf4f5sm2102026a91.4.2026.09.22.19.41.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 19:41:36 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Subject: [PATCH v2 0/6] media: iris: add support for maili platform
Date: Wed, 23 Sep 2026 10:41:10 +0800
Message-Id: <20260923-add_iris_for_maili-v2-0-7223738e330d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAEY8s2oC/32QzWrDMBCEX8XoXAX92Ypy6nuUYlaWlCz4J5Fs0
 RL87pVtemroZWEW9tuZeZLkI/pELtWTRJ8x4TQWId4q0t1gvHqKrmgimGiY4YqCcy1GTG2YYjs
 A9khD47XQMljLJCmH9+gDfu3Qj89DR/9YCns+lsRC8rSbhgHnSwXnrjbcu8Y2Whhee2Z9rc9KB
 qMkCNBCQgiKbejBpwS7qeLx11K+Ly0W2DYztMW263G80qwoo8YaphVo2Sn+PqV0eizQb69PZbx
 GCkGPYG5ONPMCgU5YbnVjgzN/IVvGG6Z5it97j5nvIf+rbKcy44Kwteok1y+o67r+AOgmroefA
 QAA
X-Change-ID: 20260914-add_iris_for_maili-f6e7273fbb03
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790131292; l=3684;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=6W4dsjkfRl/Sj1RIgToenplnggLPBgCwwrA3fqw+8cA=;
 b=jenRSgjQ7H3h13ccmFbYqs3SMxP3DOee75otnsRoDVCvGL8ItA+81GL9lGlla4JOgpJxr9di/
 5qLkmhPbigCBmFMerfG3w2V0iReI9qciF+F+wv+t6WWhyIQzjyBndh5
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-GUID: QMMEs6c9zcbP3fw-BMZ2KwtO-FRgA59G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAxMCBTYWx0ZWRfX7QEBCvlleJVx
 C709kMlQyV5/ZY1rZWVJm2Oyqub0OZ7i9Y2a0TxyVmRewAZF9KKKmVRFuiGKN9Kttyi3wgJ1ydt
 DDk96hddZMSVF4R4faSEXJfGYXpDspbmfmaHxRX+IfUqgQ509lg9YUgAOkM1B+QAfCEPD4FsJIN
 G3/U52LGePvtLx4j6Z7qNTJiweKjYRlJV8OrvT4161BHt5K69iSwioOlTzvPnoQi/e8SZYrwdAt
 BWcgFtqwlWgDlAUDr2XliNHGmXABgHyqXsNm2ROVxdML38iXxxtTlwhRcHy6e7iXVXysSRD/QNL
 XUf/POsxO5kuXve+TKuWV3Ad2zTvPXdBS0PxQr6JfmU3l3pxwywYB/YWEs7qfUjwsr7QS4Z02FS
 ian3Z69ZOGl+rrjP2PMr1bIuRNrMy46WUIJS87zaMxSnkZm3Zgtp0kDTvx55XHrwRkCBTDQQ4YL
 zfmEWPXnF2Oj7RNsvjw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAxMCBTYWx0ZWRfX2hC984EWQKpm
 AEsYZoCvTUvBaR4460AmNPLBb4SaZHIs/fDIYCwJrF8oo23j5+RX1VWgo8jsNEBgKitpWbR/ocm
 7AWbWchX6UIcurRNdeh5H4m3yPzN08M=
X-Authority-Analysis: v=2.4 cv=QsDLTlyd c=1 sm=1 tr=0 ts=6ab33c63 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=RPeHkEnTs8eby-NZ5DgA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: QMMEs6c9zcbP3fw-BMZ2KwtO-FRgA59G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 phishscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 adultscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230010

This series enables the Iris video codec on Maili, allowing Maili to
use hardware‑accelerated video encoding and decoding.

Compared to the Iris3 generation, this block has
- separate power domains for stream and pixel processing hardware blocks
  (bse and vpp).
- different clocks and reset lines.

fluster result:
H.264:
Ran 76/135 tests successfully

H.265:
Ran 138/147 tests successfully

VP9:
Ran 235/305 tests successfully

Dependency:
https://lore.kernel.org/linux-media/20260914-vpu_iommu_iova_handling-v4-0-9b9074a73c41@oss.qualcomm.com/
https://lore.kernel.org/linux-arm-msm/20260922-maili-dts-v1-0-ac2b1b76bfd9@oss.qualcomm.com/

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
Changes in v2:
- Correct the dt-binding's commit msg.(Krzysztof)
- Remove fix patches.(bod)
- Improve the readability of the buffer calculation function.(bod)
- Link to v1: https://lore.kernel.org/r/20260914-add_iris_for_maili-v1-0-09df2b54c317@oss.qualcomm.com

---
Wangao Wang (6):
      dt-bindings: media: venus,common: relax clock/power-domain/iommu limits
      dt-bindings: media: qcom,maili-iris: Add Maili video codec
      media: iris: add AV1 decode buffer size support for vpu4x
      media: iris: add maili platform data
      arm64: dts: qcom: maili: add iris video codec node
      arm64: dts: qcom: maili: enable iris on mtp board

 .../devicetree/bindings/media/qcom,maili-iris.yaml | 229 +++++++++++++++++++++
 .../bindings/media/qcom,venus-common.yaml          |  13 +-
 arch/arm64/boot/dts/qcom/maili-mtp.dts             |   4 +
 arch/arm64/boot/dts/qcom/maili.dtsi                | 126 ++++++++++++
 drivers/media/platform/qcom/iris/Makefile          |   1 +
 .../platform/qcom/iris/iris_platform_common.h      |   4 +
 .../media/platform/qcom/iris/iris_platform_maili.h |  40 ++++
 .../media/platform/qcom/iris/iris_platform_vpu4x.c |  86 ++++++++
 drivers/media/platform/qcom/iris/iris_probe.c      |   4 +
 drivers/media/platform/qcom/iris/iris_vpu_buffer.c |  34 ++-
 drivers/media/platform/qcom/iris/iris_vpu_buffer.h |   1 +
 11 files changed, 533 insertions(+), 9 deletions(-)
---
base-commit: a8c591ed6b672915e0be57843f943a2a723aff40
change-id: 20260914-add_iris_for_maili-f6e7273fbb03
prerequisite-message-id: 20260914-vpu_iommu_iova_handling-v4-0-9b9074a73c41@oss.qualcomm.com
prerequisite-patch-id: e1330b5a848460d14cd6574877fcf607d269d9a1
prerequisite-patch-id: 20d099e89443a097b9ec5b297f0129d9874ca54b
prerequisite-patch-id: 2a36ab03d78d8e9c19c900e203b05739a9fd1123
prerequisite-patch-id: 9e326a273e052af2b63300dd20f2fd6cc78dd5ac
prerequisite-patch-id: bb9ca73889bfca249029efb854fb1634a4360b5c
prerequisite-patch-id: 9e71460e2d5f1e4e2993819f4d9fa27c076946f1
prerequisite-patch-id: a2b127d41c7133ea30721a72eca01333334844f7
prerequisite-patch-id: e34741f76b6919db19236ead27c966b789736e66
prerequisite-patch-id: 359d24229ad496633892e70b1cf88c2d88dfad24
prerequisite-patch-id: 6e2e9069cb620143aa305b7b29b8b1982dd0648b
prerequisite-patch-id: 3e5fe6ef2271be5263a4bf7ffbd77b0996037b27
prerequisite-patch-id: e051524017c9f39f8593fb9d2e982e6a4c39fb35
prerequisite-patch-id: 1b4863f7a7f3a8390c825d76805e8e99de97a2a7
prerequisite-message-id: 20260922-maili-dts-v1-0-ac2b1b76bfd9@oss.qualcomm.com
prerequisite-patch-id: 36f12c16bf9cb0411d8be2f396407c724162189d
prerequisite-patch-id: 28ede1ab83d4b5b56423ebb09bae74b6599b3bac
prerequisite-patch-id: 6b3e28c55c07bfcdca8bfa9219fa0c6c763c6f6e
prerequisite-patch-id: a2007fdaaeaf2981860c54ae5514f5a6f06c6bb3
prerequisite-patch-id: af8aa3c630647336bdaeffa9c88de3650f1e49e4

Best regards,
-- 
Wangao Wang <wangao.wang@oss.qualcomm.com>

