Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5AB940EBB6
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 08:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789375414; cv=none; b=HU1VatSgh5CTvX4KkJp/jokexTQYjqqVDC8wJQNEeHGdzN+SE6nnCanwo+D39lbnbuajCx2WVyzdQl6dX2wNBWoiaf9y8/S66Q8KFLgrPJmmv9NnMFneMCx9Tmk7Mdo4hGvYPTUBCYMXFfLL0Oimn686sP755YlblOUo00P/6dI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789375414; c=relaxed/simple;
	bh=nr+Ex8WrN5Wz7qxFW5WrMSh2JP60oS1cFwUmSfg+KVQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DOVIB4yoKP82LaUR0r/BHmHhrge9HW7ze3EaFdevwz84U4mHcmSuCf7bMnWe/D2ytXdzUXy9VkjvWmV3jRnQuOxOUSueAjXC7bx6QCC+G7FC47U2ZD18ZeZ+rKOQPDs5V9W053KXuLxEQdnKDkdaTM+5Imv1KxW2KZexCcIXxaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FuwUcd7B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NIBGekcu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FuwUcd7B";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NIBGekcu"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E8SdC7594678
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 08:43:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=OwxBcHpn3cvKvhr1gRO42X2uan+SBqo736M
	PnhZ2lSQ=; b=FuwUcd7Bm7ncNaKvvBUxpXOUtTbRGeim2+yATkF93Ngn/NA1Q9I
	R9W7CZbui9nzybwiRomKdi0fX3wm3B2bYWR+QCsu5r83raydU0rD0/V7qG1vNt/o
	g5xG6oMCi9CbvzPdZhH8zsFCp2C9aMDBdTSsJNae7sQH/uaYkwd+1seGbfUjzB73
	67FKjmDvITQtM27tJCQkFGQtJdP9trEh71WLGg/HhC1fBvEuAji8W7qIXkZahWq8
	VpDZBs6cs+MKjbqu3iCCrIMyLBAE5DN0VEkEVglYFFySg7fGB0PwSTqevTEs5JUB
	wAm47JU5YZ6bdTgaL3r8+KTC2MvfS2UamcA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpdevr1s1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 08:43:23 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc1b80835d5so3890127a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 01:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789375403; x=1789980203; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OwxBcHpn3cvKvhr1gRO42X2uan+SBqo736MPnhZ2lSQ=;
        b=NIBGekcuxwrvUcbGI3+5KtCOC2J8udkVi5B+lop3a9v6gGWGUGriK8rMkJqvLDRFcW
         GQ7uXVBfjwl6JoU3lMadkAVJ95NLd/6DxAP75jlxBCRv39YHShS8DvXcro6UQhH5p7pB
         NBRe3ISjeXev6lAjjlz7XGiMX7BIqGEDO6iYe8jvZXyUo/+a2kKC/wf640rtwZDni28V
         4d45KHwZ0PPD4lbmIQqcways7jate1VngntKYLV1PimiWxsHOoUk8yyv2fQl+wrBTvbc
         F3wO4rl/fmmPAlugDrEuOMMi/lH95PH0NjxP0Q4RY9G3PN2C5Wg4cz2/tNuT5lOhmNot
         HDCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789375403; x=1789980203;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OwxBcHpn3cvKvhr1gRO42X2uan+SBqo736MPnhZ2lSQ=;
        b=fehSiVzNb1Vn6GnxIp9duyN3CL5TAb6tBk19OkG3tIlgk4yf641xllmpFnw1VlVOuT
         CimteBcDVzCrY18T3ACJl9MxG69kl+VGlKh+6+dPOyzYgY7GFdsSRa0Va6O74qYuNV8N
         yfOYfTcA45dRsJSE4kILxAzjlmkNiyVTaP2PIomxQDkXzWPFOElFyJ7lH0exW5iG/ZyP
         xzT72NM0GRtaTPoitIM/SNNolom6wu3ltwRBD2wHZs7mlsGqmzloJ09/LOgWLmVwwBB4
         w9c9JsUSkCA1eeaP6jw194AUDGcw9TlhINkjkmWoP3Mk/y1zPzp/sTD6nBbZBdn0PDzJ
         JoXg==
X-Forwarded-Encrypted: i=1; AKwUvBzz0iZaf57+twGXyAdq4PBKAXBUyoeM+WqpLFz3e5MVgPOBHKc9lfP+zFFUst+o4jDhfBStbyGWpilN57c=@vger.kernel.org
X-Gm-Message-State: AFuF++kilhVRdkhsVrnyRts4T4fF0NY5TWIupCYSeUTYcsqhK3cP1SyZ
	2LM5EGcxVRYBhdCZKpkZxt6HFGa8hX907y3M/Am2wp+zEBzvXkYx1zECInt1EkyOcqdAVBuUEI9
	he6GSx4BQDoyGm1TTXTHrWkZgopQk1IPjMsWglU7BIoarKbInoJr96D1JYGticFX59JY=
X-Gm-Gg: AYBFou0oviHUHJeW5KaGNtp++qUS/LUSn9nPRP4gbA3drXfAuwGGkKnzcsxAxRzD/7T
	rpO5qbvQck8wmDktrNqlrlNRTICXqeZgKd3uHkwVyWwaOloWKD60ty20kWs+sJp13+hRUYtL0dq
	aIXXCpR9BydNiCOg6i1QFQHnUbDN4FrpnlPOkPgdCTuliwHCHk4XFu3QYrXfPEo2w6VqULw1h2C
	TXNQH5hqMj2hNIlOMoq9rlQg1gd8eoovlklOwSwaCM7yeA7jIEj5H9xF0bQaLurDBEuVCkMmfU9
	uOb1oD1yNYcj0NixpTPKW8h5rv0RVxme8KS1igQIWl9RsRQkBomB15hi9hS8jTDuZuKkM3LTm6+
	VgwVJ0csj0Iar++L7UehqcB9czrk=
X-Received: by 2002:a17:90b:3e4f:b0:398:9be8:ea64 with SMTP id 98e67ed59e1d1-39dec0bf7a4mr4171806a91.17.1789375402747;
        Mon, 14 Sep 2026 01:43:22 -0700 (PDT)
X-Received: by 2002:a17:90b:3e4f:b0:398:9be8:ea64 with SMTP id 98e67ed59e1d1-39dec0bf7a4mr4171730a91.17.1789375402241;
        Mon, 14 Sep 2026 01:43:22 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365b97994sm44692673c88.12.2026.09.14.01.43.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 01:43:21 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v5 0/2] remoteproc: Hawi CDSP support with per-PD proxy performance states
Date: Mon, 14 Sep 2026 14:13:10 +0530
Message-ID: <20260914084312.3812408-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: mRja8bTxuJm88G-Zpx9OLLQzTIiOUkRV
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEyMSBTYWx0ZWRfX0lbFL61H56ro
 8rSEaGV1LMIh/JFPq2BFvZsEeR8TnDbL0n6T8xDeq8B7mj+U/j0p8HpIV3F1Ap7suxnsolC4Tw2
 6DZLZDqZ0KWbIwfs4RGpsMIvd1d4IuI=
X-Proofpoint-GUID: mRja8bTxuJm88G-Zpx9OLLQzTIiOUkRV
X-Authority-Analysis: v=2.4 cv=ftpJ914f c=1 sm=1 tr=0 ts=6aa7b3ab cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=rQWQmZZn-rtmdnU4JWkA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEyMSBTYWx0ZWRfX18p+ZQxvLAKH
 f/SZd/tHlaDb9f5L1cDxtIUOgA1zk0p4yjb770E2IHdWtJdCOajQCoIsz68a2G5fLe+WAO7gzDK
 OhzY2ArwnvALwlJ6lG5DZ9YmT4wgdxvM1Swc8+tsOuV02S3smaMPJWFHW/cOoCL8e9FiQ354uDL
 ttxbnRnWegMzrufo0ZOkDDIojn1qVNmwl+54uwkHxeLI15OUzNJsFVFdiMY6lptJN4sJw1pteLz
 e3IRcLbNOKYpI9WwRtNZhBeEoG5a5FtmahseqU/vz8H7ipbiM5Elwer37X8HYo98p+L+J6SskMs
 TAdA304hZ9dPxs/k6UdmuJlcVTjDAebfiZubnZ7QtNVyZhVsEY7Xdl/jGOaSVUwzaL9ZszUWROj
 Nt1Bwv2ETdvjNpqb2wlfcm8z7dVpKN0luwVbbxdgmMFejrkQseJBlPMZ8UVmTc8eMCvY3lDjcki
 qSezsX4hqzr7IHWXv2A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140121

qcom,hawi-cdsp-pas was initially grouped as a fallback to
qcom,sm8550-cdsp-pas on the assumption of hardware-level compatibility.
Bringup revealed that the NSP proxy power domain on Hawi requires a
specific RPMH performance level that the sm8550 driver data does not
provide, breaking the compatibility contract the fallback string implies.
Maili CDSP shares the same NSP power domain topology as Hawi and must
fall back to qcom,hawi-cdsp-pas rather than qcom,sm8550-cdsp-pas to
inherit the correct cx/mxc/nsp power-domain constraint.

Remove qcom,hawi-cdsp-pas from the sm8550-cdsp-pas fallback items block,
add it to the standalone compatible enum, and extend the existing
cx/mxc/nsp power-domain constraint to cover it explicitly. Move
qcom,maili-cdsp-pas from the sm8550-cdsp-pas fallback to a new
hawi-cdsp-pas fallback items block; it is covered by the hawi
cx/mxc/nsp constraint implicitly via the contains check.

This series should be applied on top of 
https://lore.kernel.org/lkml/20260805132129.2713174-1-mukesh.ojha@oss.qualcomm.com/
to avoid merge conflict.

---
Changes in v5:
 - Replaced WARN with dev_err as per review comment.
 - Link to v4: https://lore.kernel.org/lkml/20260910150638.3270162-1-mukesh.ojha@oss.qualcomm.com/

Changes in v4:
 - Dropped 1/3 patches from the series as that seems unnecessary.
 - Added maili cdsp pas as fallback to hawi cdsp pas.
 - Added Tested-by tag.
 - Link to v3: https://lore.kernel.org/lkml/20260909105049.1317985-1-mukesh.ojha@oss.qualcomm.com/

Changes in v3:
 - Converted warn into failure in 1/3 as per review.
 - Added R-b tag.
 - Link to v2:
   https://lore.kernel.org/lkml/20260902204334.2061226-1-mukesh.ojha@oss.qualcomm.com/

Changes in v2:
  - Propagating the err dev_pm_genpd_set_performance_state() as a
    separate commit.
  - Added a binding correction for hawi as it  should be
    standalone one instead of falling back to sm8550.
  - Add num_proxy_pd_performance_states count field with a
    WARN_ON in
    probe to catch mismatch between the array size and the actual
proxy
    PD count at boot time, returning -EINVAL if they diverge.
  - [v1]
    https://lore.kernel.org/lkml/20260828181311.4038346-3-mukesh.ojha@oss.qualcomm.com/

Mukesh Ojha (2):
  dt-bindings: remoteproc: qcom,sm8550-pas: make qcom,hawi-cdsp-pas
    standalone
  remoteproc: qcom_q6v5_pas: add per-PD proxy performance states for
    Hawi CDSP

 .../bindings/remoteproc/qcom,sm8550-pas.yaml  |  8 ++-
 drivers/remoteproc/qcom_q6v5_pas.c            | 49 ++++++++++++++++++-
 2 files changed, 54 insertions(+), 3 deletions(-)

-- 
2.55.0

