Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794848760;
	b=cREs6UNNkqOu24YibST+97u1B7NO0aZ6FQIZShKpcScxRxjyMzggogEeRGvldk8Xu0lz
	 RS9oUCt3P6TpR27xWHqrWg5MYVTfD6B1F08ZVHkdcocsPHQ3Wwxqnq+zWTOpkcwsU03Di
	 sb0WvHj416tZkUOxKxSLm8UKva40l0GYUFPpoTt3llJ6lzFvOSR5lzOGIAuM3kYdOEnVJ
	 VsJ0osKYjh4e1SwYhaqbAE5fDC3Rf0G5978eA8MRqz2UDJRzEjUdMxUV1iN7L6sLQB8e1
	 An3KOZIGQD8/Py0XHhKhXMNS47EoxsLz22Igj5Y99ie7t/5vR5sz6WIH8OpR3kBOF5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794848760;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=l2u37bdBOIMSumc6z0AyNMM8YbxXxPAGRGo7HKUvAh8=;
	b=vJSOooHNQ13790DdYJj02RInu9REnjfG78PI/i35D5vmsvAHh0oZJmVsxlpiM6ttnNFu
	 CC4TBRET+mY7rZi1Qot2T3TCvVw84OKvtdxJpESomy56YqPuurauYDJ40bKg0HXEi3jCN
	 R3I0oc+NsYCJz32b8RCieceKY0lYXOFw5qNYoANkRg3XJEvkmrKT7qqybMd2QOAVr1+0N
	 Agxl3H1KyPXqmijR5uTGei2j8d++RKWbleR/ZWFw7yjdVNmKawUuYnDooSUe7NHERt/by
	 7hXOPdexRomSFobRyDyxbUTQOVMdUHFKaAoZIaQ3jG1DZzRcdAkh6mP78Rnq5/FNG5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AUI6iQxo;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=e1nMPmQO;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F49606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 17:05:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91F49606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AUI6iQxo;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=e1nMPmQO
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGGIeOM2055786
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 17:05:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=l2u37bdBOIMSumc6z0AyNM
	M8YbxXxPAGRGo7HKUvAh8=; b=AUI6iQxohVwkic0DVI6EyvNoE9bsG6285AHq++
	TNGV9oTmfejgf2czQsrFcKdscjcooedkaLXwQA1S99lyB6EL3ILJSJ77qPOCDqWN
	ViMYJpAnGIJtBj9HJikw7MWIrxvbudz4YEI1Xl0k1r+1NIBHIodsivKEqIfD+U8X
	RmImLoGE7+3CC5vDv5j4wmhwfpUAwNiXf0zmWTXpyCRFd5+a425Z4UO1FoYpx3s7
	TwOInDynATp2Zt+qL4CWzkjq0ROvp3c6t+xSxADSZ60QjsofsbwR8Q5qaWQXnx4F
	pqOdy1Zo6nmRMua5VucQAqBFKf9TDHRALIIV7u/qopoKGDig==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hyyrqhkdx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 17:05:58 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ed05900df7so13652555ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 09:05:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794848758; x=1795453558; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=l2u37bdBOIMSumc6z0AyNMM8YbxXxPAGRGo7HKUvAh8=;
        b=e1nMPmQOg9qVc7XbxrAFvyJx8bC+6feB99BuoW1qizX4hLRgbPlZE4z1U9tCjLDVBk
         lFrkJVvF2uE1yzEMHIw+HyhjB1UMLv4jDUJjuQn4DjDtqUWtyzkUXBjazpX2B/dQHklk
         pnoNo05gQs15qTTqpJtsaaQqmGKgOcbgSWCmj4tef8R4cZ9x3AeHBQFTl1EipTjdSLvM
         Bbll1wcOCxxwiIY5vqyvTLlIv1wGAzxKeIW82Uywg3OxU0AEI47EhyLBOnicB1ed1zEb
         WB9UuZ0EwiZrfnYPsAhZU8ViMymtATUF51WVCt6lUE0Xuo0oJ8w54fwgZneTbLCn9PvC
         itkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794848758; x=1795453558;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=l2u37bdBOIMSumc6z0AyNMM8YbxXxPAGRGo7HKUvAh8=;
        b=VqfHep2jziayjHPPIHQUB+zKMZrhQwQkuoHsq+TN9t62+nz1/BFRzMPNPVC/KjoDT8
         f+UjNFkgAjlIMmRMq1PhEtX1/BjkmdToW0e8p9gC6M3bYsE6lVyARJF/DDY9PTYkVB0p
         5DG6gw3ATJrryd9iN3jgSKuxnOs52Bjkkvc7E8zQZ8d/onOpI4TtiLjlo18YXIUVyKz/
         8HMohcjm9xnmcYzo4a4FkKHEv+u7F/ZYCwm48a9h5MVV8pyJkU2zeR6BWGjmHk5GavO2
         uvREb4rGHJG1eWJ++URqvlhKY5ptEArKw9hdbBTLNeXfu9GxLPF+GM9JnKgDpwJwmror
         +pSA==
X-Forwarded-Encrypted: i=1; AL+hErEWdJJJphYZZmBJJ2lUXil8rI//YGYumTx2Cq5Sh3dWE4p6fOMjsimO86QIlL4fJHv2z9rN7oNkUjANSUo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/QXX2tYnnS51Lh2o94eLCBPkxILfa2z9o3VUhsonP/Bi+iOZr0
	dedF31XKpft+2vXQRa26I+rwDVgl9Fl2qb6ygguQcjv7Bao8xnxsclvOTBnq5Y1ALU+tXDxvqyL
	oN0YfyAm0Vm0lU+TnWoeIlDXgWo7z004dzmxDcxlQmbUVJFiEfn+1qXrVLJgRXNQ2zxn0uhttpP
	o=
X-Gm-Gg: AZFdTZffUSjIE1XevtcQh5OlOYba9n/3FGvGB4OZiKcXIFM+hZruU9enLAtKkmrqxUO
	7J+bvRGar5WTppV8v0mSxifllNNcxXNqVX8LKZzqW9jN2THmbvH5zZ2Xix7d5k52SVriFMEKPFr
	Kp/wG9j4Yzw8h/7rhnbnk4ifaoChUqxH9ZVGDmjYycRRLSygYMok0HJyjPlxyWE79HWUFKtTgyQ
	GMhKwJGsWaDcOW/uZ/ZqSUz4edV8bU/FnXN8CMMZlEZypD4F4YmLfXQ8IvPENET2R1vvY9H8F7t
	rK2l02+n7DvL1nVABD5s2KcngNEwZnAPntSuIT+HOZUTk8K2rhr48bVdEyAxSc8t59NoHZJhbxw
	wer9IfeQj5WBuEZn84g4/7ATP1t5nweCzXZEssMT7XvzPmkwiyOYT7ueKJ2CmpTsT9iM5qPVbRE
	XNxSuP
X-Received: by 2002:a17:903:26cf:b0:2ef:d087:8251 with SMTP id d9443c01a7336-2efd08784a6mr10824525ad.45.1794848757857;
        Mon, 16 Nov 2026 09:05:57 -0800 (PST)
X-Received: by 2002:a17:903:26cf:b0:2ef:d087:8251 with SMTP id d9443c01a7336-2efd08784a6mr10824195ad.45.1794848757358;
        Mon, 16 Nov 2026 09:05:57 -0800 (PST)
Received: from hu-sachinku-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2efd7abfdc4sm2174605ad.75.2026.11.16.09.05.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:05:57 -0800 (PST)
From: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
Subject: [PATCH v4 0/3] add MBR type rate control for encoder
Date: Mon, 16 Nov 2026 22:35:50 +0530
Message-Id: <20261116-b4-add_sc7280_mbr-v4-0-636fb6bc8772@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAO43+2oC/23N3QqCMBTA8VeRXTfZzpybXfUeETL3kYPU2moU4
 rs3Dbry5sD/wPmdGUUbvI3oWMwo2OSjn8Yc1aFAulfj1WJvciMgUBOggLsKK2PaqAVI0g5dwLw
 RSteUdw2jKN/dg3X+vZnnS+7ex+cUPtuLBOv2pwkgO1oCTLECJWtXM+K4OE0xlo+XuulpGMo80
 Iom9ocoYbsQwwRLp4zWUrCGsx1oWZYvVmhrIAIBAAA=
X-Change-ID: 20260212-b4-add_sc7280_mbr-597ac615b931
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794848753; l=3191;
 i=sachin.garg@oss.qualcomm.com; s=20260211; h=from:subject:message-id;
 bh=Zshta7LH1VkHwO4akPrN2bcY3bKQ/gUTFR3uTB+MhkA=;
 b=IHX2knwrWnP/VA0x9geISH7mkjO9MR/GHCTOlxkUKVlhV+qWPr2BDnC2DCnD/sK9dczd6f59k
 aYuo7bNSrSdBMpC5y4VsMOxVyfv+SsHlLTBXcaNPFaKsEIMI3dYq2GW
X-Developer-Key: i=sachin.garg@oss.qualcomm.com; a=ed25519;
 pk=KcRhp4CP9cR1V2tg6xSNRnB2STYaU0vVigdUF4Actu0=
X-Authority-Analysis: v=2.4 cv=VcJir1p9 c=1 sm=1 tr=0 ts=6afb37f6 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=QU3Qso9P9l-aNNcEKg8A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: frBVYBYoARLuR2vL6oVFi3VnIhee-bXx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA2OCBTYWx0ZWRfXz9rvGHYQlpU2
 vZRZbmpP8HWoR4mXkoNzYjz0gtK5EC/qCBBX0ZzByDcWSAYMB7G6PPCKiczU5Gsd+Cj6Wxt5oFm
 7A+J/iKNFevvYkfHbRasDvnJWJNP0kl11mIihMmHOAVqiO5p+71eGA0YZNCiSckp7A22/1qIo/E
 yKzBNwfNnAJElEhw93mT3WPpR23O3f+vh7xmAKdL+iMfXAdABjmDG5NiGxgltTMLAIaluQWduCu
 isG0qR5TEfAdlb9lCeUevTf6AEx4H9DnufgOEXgBBMSAu2jg1V0Qr7XQ5yLj09ZclUuRa4fOQJX
 6mE742tRahbzknxR0bh8f2RBKo4vRNjyOqx4WK1kyL1PjQi32aVPG4PHvNVqJ/9vyf0MGzoEd/C
 oC0oJcM/LzaEkDCxIyI2K4uBWLuQApCEeMOi81bnsGPrmuGKcCDGyeQF2NjLjXtclYyiRDqiNIt
 hG34jXk8MWdS9oyCBVQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA2OCBTYWx0ZWRfX3HGDDPpmfXIi
 8k3NuvV57Vr9s/ovWTMYhhuQ8nNqdOQTR72IsbFBXYFtWjmgXnNL4I1NjTqXggLNE9PUSBqjktq
 90WqmfrmsTchGrVGYk/5RTXZIl2p+50=
X-Proofpoint-GUID: frBVYBYoARLuR2vL6oVFi3VnIhee-bXx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_05,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160068

This series adds support for the MBR rate-control mode in the Iris driver.

Patch 1 reserves a control range for the iris driver in
v4l2-controls.h.
Patch 2 adds the control to a new uapi header,
include/uapi/linux/media/qcom/iris-config.h, and documents it in
Documentation/userspace-api/media/drivers/qcom-iris.rst.
Patch 3 implements the control in the driver. MBR is currently supported on
sc7280 only.

Changes in v4:
- Move V4L2_CID_QCOM_MBR_RATE_CONTROL from the driver to a new uapi
  header, include/uapi/linux/media/qcom/iris-config.h, so userspace
  can use it.
- Ignore MBR when frame-level rate control is disabled.
- Don't program the peak bitrate when MBR is enabled.
- Link to v3: https://lore.kernel.org/r/20261030-b4-add_sc7280_mbr-v3-0-8fadcc873953@oss.qualcomm.com

Changes in v3:
- Split into two patches: add V4L2_CID_USER_QCOM_IRIS_BASE to
  v4l2-controls.h (patch 1), and base V4L2_CID_QCOM_MBR_RATE_CONTROL
  on it (patch 2).
- Reserve 64 controls for the iris control base instead of 16, to
  leave room for future iris encoder controls.
- Link to v2: https://lore.kernel.org/r/20260720-b4-add_sc7280_mbr-v2-1-a2a86f630f57@oss.qualcomm.com

Changes in v2:
- Per upstream review feedback, convert MBR enablement from the
  generic V4L2_MPEG_VIDEO_BITRATE_MODE_MBR menu value to a new
  Qualcomm IRIS vendor-specific boolean control,
  V4L2_CID_QCOM_MBR_RATE_CONTROL.
- Drop the now-unneeded generic V4L2_MPEG_VIDEO_BITRATE_MODE_MBR
  enum, its "Maximum Bitrate" menu string, and its documentation
  (previously sent as a separate patch 1/2).
- Drop the separate inst_fw_cap_sc7280_enc[] table (a near-complete
  duplicate of inst_fw_cap_sm8250_enc[]); sc7280 now reuses the
  shared encoder cap table and layers in only the MBR-specific cap
  entry via the new mbr_rc_supported flag.
- Link to v1: https://lore.kernel.org/linux-media/20260213-b4-add_sc7280_mbr-v1-0-e8d95b4e4809@oss.qualcomm.com/

Signed-off-by: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
---
Sachin Kumar Garg (3):
      media: uapi: v4l2-controls: Add control base for Qualcomm iris driver
      media: uapi: Add Qualcomm iris MBR rate control
      media: iris: add new rate control type MBR for encoder

 .../userspace-api/media/drivers/index.rst          |   1 +
 .../userspace-api/media/drivers/qcom-iris.rst      |  28 ++++++
 MAINTAINERS                                        |   2 +
 drivers/media/platform/qcom/iris/iris_ctrls.c      | 108 +++++++++++++++++----
 .../platform/qcom/iris/iris_hfi_gen1_command.c     |   1 +
 .../platform/qcom/iris/iris_hfi_gen1_defines.h     |   1 +
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |   1 +
 .../platform/qcom/iris/iris_platform_common.h      |   2 +
 .../media/platform/qcom/iris/iris_platform_vpu2.c  |   1 +
 include/uapi/linux/media/qcom/iris-config.h        |  15 +++
 include/uapi/linux/v4l2-controls.h                 |   6 ++
 11 files changed, 147 insertions(+), 19 deletions(-)
---
base-commit: d7e7bca7169873b46e857c025c10f3336c1258d8
change-id: 20260212-b4-add_sc7280_mbr-597ac615b931

Best regards,
-- 
Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>

