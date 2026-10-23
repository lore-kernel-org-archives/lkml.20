Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792738877;
	b=KF7Tj2sSEDTsp5Y6WLgvK7AinzBYhuRKMC39l/1HbWmfkZxOv+nOEWum8cke0YAfWszB
	 LZivApufP1zY9kJgQZlwCGU8ZbJuk38DrZIkaPkXYGSYMNfS+KlpBmY5q5dQbFnfT45LE
	 mgDKDeERvt38uBVct4sn1A7RjPVtGlz4m2OzcDYXwuiZN1JhiK/LkYwgM8SayYqQUyoF2
	 xBPYU9pPBHrNlfrz1qFxzb+sltVccGTNqHIUg6EqXO2LYWNvK40+LOeixaIzESDizBM4q
	 YpwfJgiW4943Yt4PwEp2qbH/zuY+gqhkHH0p7qfiQiISaYX9pZ31tTf4Ch812vNjyjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792738877;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=p8K8L3wm/2TFwy9MEBg0/j022FtSD7ewKzpYCuY3Up4=;
	b=GkiG2RSQyDJJeC3lXd+ZdVN+2tZvRwr+fJz/Dj5Un9yCvPnaMLnQc1CpYIEyZIbMstd1
	 SpXYqheZ6dn8ngcE9Mrn4AZ1whZwpVylpWQ+HZUhA1+cl7ZwQ0dCEjR/sG14otNnXzq1a
	 i95hNFVz1/3HiZPQ3cCToJbemodvGS5R9fgM70TVGTuDN0alIRu4MMV05+0NeXiF773Hj
	 em0mcu+0yWQAH5qF6jhTSn6G1djKu+saa66vkcLizMP/Ug6U7acj1jS15jZ4f/LiDU2HI
	 DKBM8F2vqa1E16mW36Qr9BGXkSZzU7FU8UlPVIzRsEn6eziMwzdRFVrIXhwg2YPKllQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="LqEZs/9C";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TQyFQ0Er;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2639F606A324
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 07:01:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2639F606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LqEZs/9C;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TQyFQ0Er
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N1FjrW4008195
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 07:01:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=p8K8L3wm/2TFwy9MEBg0/j
	022FtSD7ewKzpYCuY3Up4=; b=LqEZs/9CtzveTW1BQmCuKGsRV4Ouli4SjIZIHw
	Kb42DKaWDD3kTRLwXim4TKFL/0VSJ9Cigi2lKKyfGIF9wVVu1JwXsw7DyQENjOJF
	GcBAFyGT/T2QR5Yx9hDIdUpmzaF130CMLw/+Mr5cggLF0Y3k+yLVI4U7hYFEcySU
	fezzCshxBfCfK2+84fgpGxYFwkSMg1z0h81jFjBXm8K3SiFVDt2+jpK+GaSb8oV2
	V2NVi+C0gxdLjyHvTOAGVeFDs4jKzlf/t7N0X1SAVuZCu87rHBSXKUuQQy2jX420
	LiQ1QBFx9Z6lsWRNR+07spaJpZoNDrBIQZU00b87Wgex+wNw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfsmasusx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 07:01:16 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cd6ba724b6fso354082a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 00:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792738875; x=1793343675; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=p8K8L3wm/2TFwy9MEBg0/j022FtSD7ewKzpYCuY3Up4=;
        b=TQyFQ0ErsxKQjebb6LIqAHQh6FWHYCixcj311dvvQ7oOm8AdxAcuqMlvH5eHLO9iV2
         6/+QNcruh304LmTUVxT+DXC47WMNSsnGeFgORZCz5hlsVN1rgOo16Y2eHKnhXqz5+wQr
         eJjF1WfRAHQ8i5Iv2K3mB8j89WkXApkgdc/rN/aTdy2LXi7kOzuW6qi7vUtGLU2TwAmF
         rKCVyRxNRLMx4U9lH0GKlUOgPzK2JpFynyYQEGZbxNw5pvAurGkLMCdd0IJfen7Ipp8j
         m7txvGxdC6Iure8LeUbOIl6hp7N5RdyjGCkZ4+5ZuK5K+DM46spnN5i1ONbE1J9q9aWW
         mXAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792738875; x=1793343675;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=p8K8L3wm/2TFwy9MEBg0/j022FtSD7ewKzpYCuY3Up4=;
        b=uwOxEVsbHwd48bQyC+tIegW9JmPhWL94uZDGqtBSLa2R7SbjnVJlIlVPi8VHtL//2f
         rUxPPgT9lNZWQ1M6EKqlln0G7gw+spN36Lw2IozNfMmC4Fr0bt6rsAj6hTqUQUxzqLLh
         X4GsEPjzyZcGm0ep/0720XE1U27BRHiURd6qI55k3/TO++LaDLZzyL+FDqsvpsa2WtsC
         kbVX7//BDvCn1Ea1qlWgv7QK6EaAVZ5qLjIKyo/QaH+a+rk0Hr57pbpvgpDbVx5VnRk4
         K7eggtnvEbarbrMBV/YDrk4yBc4N4A42GxtFJQ6gDW/xi79LCBZUXqBt5Cth/dcPddG4
         diMw==
X-Forwarded-Encrypted: i=1; AKwUvBzLQ+n35JDcdNxpFvbQJCrvhxxgznmCgkOEo30c4KLlRDFGa6NU5mp429CtYoZjd6G7RdivGOtU1c0jV4o=@vger.kernel.org
X-Gm-Message-State: AFq9FYL9Kq+EYZ4NZXGvjmouDkAuumoTCchlTzVpwb9Cb9u7mZO+R0CD
	cI9/HOPOw/vKuQhxwqde4bKrfszysO2c9TMwVw9YTpT9B7PvIJDOtXUpGLZPhmvPcDyvOblAtx2
	oElDFDGpq7soZ6k7db9R4imlVFIPR2AMR07F4/df52HI8f3EkJYhfbDek3/3YOqhng0k=
X-Gm-Gg: AYBFou2mTlce346zrnRedd1Vbgr0VJj9nZXFtFeTwF0M7kqb9K5EQLdqFoX+7jI5sS9
	JcKHV4X43u/B25RoCoF43nzmVPKPsDNpERJ7F4bmFW6CcJ8aS5rz0jWRq47faKsQzTQ+MXwQ6ae
	vhrpCkFqbi2NnDxcranG0gAtptClyuoS7PWuqY3uOB7/Mzm3L9iTvrTHl6BH58KDxtlbtyzjFiU
	ug9IHJKqT2l7naFoTyufxR6Z5WEgNQC8RwuRAw5dmQvX1BDXHJC9QzK073uYW1zuoWFgHESnQkN
	9gwr9Mh7z4i6210yqESFsRh8J7WTTYXgkSBW/B15FFDsKPHKDol43i5mkGaR2YwabSihNchzEad
	oh6bRASZGP2zOny1O7+ydfn5QSDMh+L/+p5T8PA3OVtXObTwDLEmrJ6sXn9EM3X5Wp/cRIIjIwU
	v2AzJiSuaN6qH1xCFRkbcbhw==
X-Received: by 2002:a05:6a20:4306:b0:3e1:c04b:59cc with SMTP id adf61e73a8af0-3e3767aa572mr966014637.70.1792738875409;
        Fri, 23 Oct 2026 00:01:15 -0700 (PDT)
X-Received: by 2002:a05:6a20:4306:b0:3e1:c04b:59cc with SMTP id adf61e73a8af0-3e3767aa572mr965967637.70.1792738874414;
        Fri, 23 Oct 2026 00:01:14 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ba8a6dcdsm399751a12.18.2026.10.23.00.01.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 00:01:13 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Subject: [PATCH ath-next v3 00/17] wifi: ath12k: Add support for QCN6432
Date: Fri, 23 Oct 2026 12:31:03 +0530
Message-Id: <20261023-mpp-bringup-v3-0-19f3fcbf7b5f@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAC8G22oC/1WNTQ6DIBSEr2LeuhjEok1X3qNxIfShNBUooLEx3
 r1ou+lmksn8fCsE9BoDXLMVPM46aGuSKU8ZyKEzPRJ9Tx4YZVVBC05G54jw2vSTIzVXZ14LVBd
 ESAvnUenleLtBFwdicInQfpMwiQfKuJ/t3UGHaP37AM/sWPwY1R9jZoQSxQsqy1IoqXhjQ8hfU
 /eUdhzzJNBu2/YB6TORMMkAAAA=
X-Change-ID: 20261015-mpp-bringup-75f457bef8ee
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>,
        Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=V7LoQuni c=1 sm=1 tr=0 ts=6adb063c cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=j9mdO8TpxRXb4I9anNkA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAyNyBTYWx0ZWRfX3p4H58jtTaBf
 S6R5nTpQbawRfheBE5NQk7nlWHMI7ZZXdLm5OBmhol2TKnoskC9AGULqB9G8ZkjMlhk19xlUEMp
 1W+b7L8KlaSXy4rqwrWa4K1s6MIeoWw=
X-Proofpoint-GUID: N_XqsdyUTl-FgTvE2nn40U2sP2_akhdM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAyNyBTYWx0ZWRfX7qBIRwiva6UY
 Se650RXGgs1bRz9tW3GzT44oee1zP0tcUs2D+SoNyyoUG/xd1jKfIZ0ykx42vEOlU2qNrZYTWd+
 yrAf+AQziMgvr59oZvkc3FLhrbHNYWVDhoRGYkvDjw15JDao7+4QSdv3P/Dp0fzN5Y1Su5j0tkY
 7sSRw7yaxst+Jxi+y9dTxJ10k5jp3KW5oi+WNG3fP8WryBDI68nsUv/pJ5m1GYGIyiqjotYOEK7
 uC/VBNJiZl6MbOVKJx/ApX6Wd9/CLlFPfBvfyCPsl2eShXDYWsMIKsjVjIYPd2X3/gOukdZELbS
 tzY7gNu1X78RwzLnh3P+KEeyKUVeY1nP21+nS/LIj/rRnQlpKJgdt8hlDA8Io/hmLgMBfHjH6ot
 KvjGVt517exyRdA1XStORuIc6rYrRNI8He8e2ovXqohh3Jr1tHFLvpsTrVKNffPGuGPpDOdt8So
 lRs2XxVcUmBEoJXdVjA==
X-Proofpoint-ORIG-GUID: N_XqsdyUTl-FgTvE2nn40U2sP2_akhdM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230027

QCN6432 is a PCIe-based device attached to the WCSS Q6 processor. It is
registered as a platform device (AHB), and remoteproc APIs are used to
boot and shut down the device, similar to other AHB-based devices such
as IPQ5332.

However, PCI APIs are used for device setup and register access. Since
QCN6432 requires both AHB and PCI APIs for its operation, a hybrid
AHB/PCI approach is implemented.

Overview:
  - Patch [1/17] adds DT binding documentation for QCN6432.
  - Patch [2/17] refactors PCI operations and MSI config structure to
    support different MSI configurations.
  - Patches [3,4,5/17] add hardware parameters, ring mask, and registers
    for QCN6432.
  - Patch [6/17] moves multi MSI vector flag to ath12k_dev_flags.
  - Patches [7,8/17] add hybrid_bus_type and HIF operations support for
    QCN6432.
  - Patch [9/17] adds support for unified data-region memory allocation.
  - Patch [10/17] moves MSI config to pcic for better abstraction.
  - Patches [11,12/17] enable MSI interrupt support for CE and DP rings
    specific to QCN6432.
  - Patch [13/17] uses CMEM write for PPT on hybrid bus devices.
  - Patch [14/17] stores and uses per CE DP MSI data for QCN6432.
  - Patch [15/17] derives QMI service instance ID per protection domain.
  - Patch [16/17] add userpd ID mapping per device.
  - Patch [17/17] adds support for QCN6432 in the driver.

Changes in v3:
- patch 1/17: Update the commit subject and change the file name.
- patch 3/17: Initialize qmi_max_chunk_size for QCN6432.
- Link to v2: https://patch.msgid.link/20261016-mpp-bringup-v2-0-f510c33bfcf5@oss.qualcomm.com

Changes in v2:
- patch 1/17: Update the compatible string from qcom,qcn6432-wifi to qcom,qcn6432 and remove the | character.
- patch 11/17 and patch 12/17: Fix resource leaks on probe error paths.
- patch 16/17: Move the NULL check before the loop.
- Link to v1: https://lore.kernel.org/linux-wireless/20261008-mpp_bringup-v1-0-2c5797b5e4ac@oss.qualcomm.com/

---
Aaradhana Sahu (10):
      dt-bindings: net: wireless: Add QCN6432
      wifi: ath12k: Refactor PCI operations and MSI config structure
      wifi: ath12k: move multi MSI vector flag to ath12k_dev_flags
      wifi: ath12k: Add hybrid_bus_type in ath12k_hw_params
      wifi: ath12k: add support for unified data-region memory allocation
      wifi: ath12k: move MSI config to pci.c
      wifi: ath12k: Add platform MSI support for CE
      wifi: ath12k: use CMEM write for PPT on hybrid bus devices
      wifi: ath12k: Resolve userPD ID per device
      wifi: ath12k: Add QCN6432 AHB support

Sowmiya Sree Elavalagan (7):
      wifi: ath12k: Add hardware parameter for QCN6432
      wifi: ath12k: Add hardware ring mask for QCN6432
      wifi: ath12k: add hardware registers for QCN6432
      wifi: ath12k: Add hif operation support for QCN6432
      wifi: ath12k: Enable MSI interrupt support for DP interrupt
      wifi: ath12k: store and use MSI data per CE and DP interrupt group for QCN6432
      wifi: ath12k: Derive QMI service instance ID per protection domain
 
 .../bindings/net/wireless/qcom,qcn6432.yaml        | 149 +++++++
 drivers/net/wireless/ath/ath12k/Makefile           |   2 +-
 drivers/net/wireless/ath/ath12k/ahb.c              |  54 ++-
 drivers/net/wireless/ath/ath12k/ahb.h              |  10 +-
 drivers/net/wireless/ath/ath12k/ce.c               |   7 +-
 drivers/net/wireless/ath/ath12k/ce.h               |   6 +
 drivers/net/wireless/ath/ath12k/core.c             |  10 +-
 drivers/net/wireless/ath/ath12k/core.h             |  24 ++
 drivers/net/wireless/ath/ath12k/dp.c               |  39 +-
 drivers/net/wireless/ath/ath12k/dp.h               |   2 +-
 drivers/net/wireless/ath/ath12k/hif.h              |  30 ++
 drivers/net/wireless/ath/ath12k/hw.h               |   8 +-
 drivers/net/wireless/ath/ath12k/mhi.c              |   4 +-
 drivers/net/wireless/ath/ath12k/pci.c              | 111 +++---
 drivers/net/wireless/ath/ath12k/pci.h              |  21 +-
 drivers/net/wireless/ath/ath12k/pcic.c             | 435 +++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/pcic.h             |  24 ++
 drivers/net/wireless/ath/ath12k/qmi.c              |  83 +++-
 drivers/net/wireless/ath/ath12k/qmi.h              |   1 +
 drivers/net/wireless/ath/ath12k/wifi7/ahb.c        |  45 ++-
 drivers/net/wireless/ath/ath12k/wifi7/hal.c        |   7 +
 .../net/wireless/ath/ath12k/wifi7/hal_qcn9274.c    |  85 ++++
 .../net/wireless/ath/ath12k/wifi7/hal_qcn9274.h    |   1 +
 drivers/net/wireless/ath/ath12k/wifi7/hw.c         | 143 +++++++
 drivers/net/wireless/ath/ath12k/wifi7/pci.c        |  22 +-
 25 files changed, 1214 insertions(+), 109 deletions(-)
---
base-commit: 2d57db8fbf72b1872e7411e917166bd12ed5bc98
change-id: 20261015-mpp-bringup-75f457bef8ee

