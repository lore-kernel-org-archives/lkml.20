Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1895A4F93CE
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 13:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789738308; cv=none; b=BLb4vlcitkveAdCqon/+AQxqeEeGL9QbOBYFiLDooyWnMEAcCG8DwXbxqFuL+z1KdKtR16/cMqi4Qg+iQZKwo4GgnPcBmuPcA4YfRefhhtGdr6CiSQmEVfMHIFlSfOT/xRA3WYiWsT9ubCs+0N9K4c0FGqtzfJg3jD3rg3ieVyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789738308; c=relaxed/simple;
	bh=EcScv/7GHH+PudgDUjdWtnbAFUCvWvP6zT1tLcuF5Jc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mSYqUZtXfsP61+TBl//iij5AZ/vRrkHWhvMuM0yoqM9/jxIcEpbbz6NSKOGjoZru1A+TUVwzV3bopPQDbRLV81hRjwCJsDk1+u2BMmNt9JGMmSQFoQCBgUuWesgNPJB5W0Y3jHvYOsctfD+I3FENLjGdGEaJ0uU+Zj2P8nZ//vU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BGf1n3f5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RMlf2lql; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BGf1n3f5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RMlf2lql"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68IDOVlP3645860
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 13:31:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=cxnrXJweREiUJN2MSzvDzr
	+es212bwopL66r97AycvE=; b=BGf1n3f5pZrKcCM3Mv5PlBs/OBmUAun0M9zlzm
	FRAjjo/KQi2wGXZ0CIN1k5ZVH2LldE/EBD0HRY7K/vHDBivPXA0Rv0az/apmIgkN
	jsRV8YS/jamDgXsqWCl9CTJW5NUJjc+V6RoZVhAy6wBYKR3fwUxvh5LNqI8cCeLN
	NwWm+yLJ+TRXY+Uvd1D58PdPd/iZCbyudpShBxjNHjs5yd0YoGOCMNMTlpLPDrTo
	WrSPJJZdtDBBtJItGCJprXXNtVeF2FcLvy2Dpigp2rgEwCagLFWgHnzn/uNruI3y
	8soZFym53vL3xarwTKudb8+ZzAYU0zzj8x4lZ4S/WnLMfXOw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gs37dgr6k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 13:31:43 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8716b158692so504395b3a.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 06:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789738302; x=1790343102; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=cxnrXJweREiUJN2MSzvDzr+es212bwopL66r97AycvE=;
        b=RMlf2lqlGhu8MPIm9i+7eK4emhh32JmtIRmOaWn8787GVB9Eb0JVZ5A53d/vlHlZz7
         rm9ZMb1bni85aJVPQgik9QaNdcY1AFjohprwKDmtrTq+y0jY1R5WXV8oKLgk5PHyPe6B
         VuRdpbKbJMehx8PfwkezCCNEkPbsPchM+9mldM/LO8lF3puMwckzPRKPPRsfyUeT60oF
         wsoaRyADFZvgzMBHPk1iQMTwtJnzNyofZJcjv/F3874e8OmIPywuXWKtczrmvqKCq/LR
         EdmBe+Dow2+JVmNaJl3uzCBd8FhBB8aaqY26QXWQjDhLN4vfj2RA9RGHjY5xT15dc2JO
         XQng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789738302; x=1790343102;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cxnrXJweREiUJN2MSzvDzr+es212bwopL66r97AycvE=;
        b=mzEw9iDYplMUuSd9zyfGIB4YYx3nAnZIdJjN7/ePgSDgVyGcV4ygBxvsTLVb09p6Ku
         DdG0F4/PUiC6nLJC8VONdD3DKFdps32/iYR63ClXgD3SIvzy5P/xNC6xeULyrGKywdqw
         lxbURx2m1GOFrQtTLsPkPSc2BwHJ8aaaJN/M+vq3t1LT/zavlfFYMdrDPClHE1uUdOKy
         FiRjjrO1S57Y6UqoLAyUTaA5zyWOa8kyOzzxqskCsGDV4MpRdhyF8hjHJOb6QPg5tITx
         E/5Q//Gk3VbBwRtHDD4hiHV1SAb8rxKNGQbGAem4E24gp6yzE32N5+QYmuwttvtgOiDp
         XjZw==
X-Forwarded-Encrypted: i=1; AKwUvBxSl/44rXS+DNUQJJAd0r1sQXjtWqszd4BwAT8I+NQ319goWbC/p1nhXeDc1O9AVpfgjEkcIQtVP5yWGAE=@vger.kernel.org
X-Gm-Message-State: AFuF++kw1G8Y3j3Gd+yc/vUdFQNbK73jUzASjkN5R7yNT9hD0ujfO7OY
	nGb5FSfip5+VhBpw6ArJXi/ZtG2Go4cOvoFNjJQBmC5mpRgr9iLqA7eNCkuddVYA0nO5uZwPBhv
	uaoo7rrMFOipudR4FvBzKVO7NJOR+/so8VieXLj6NRAAogbZw5MKB5eALawl1wyPY1/k=
X-Gm-Gg: AYBFou0DNud6gpy1N/pxQ2VvVAxIZY1aUYqRrIgv14TyZBhzBBSinloztgte6gXjfUA
	O689o9gqPG9w2h1mxw3a5i4ataR1G4TPLGyxWB/iSzu0CE+hdlAvcnnoxorQgenwp6zZVenz4Tg
	9iBRckY3xM7+Mx1MdJCAckHIBVTChLWG5i21OxmQ1tlTUgWdPWzBR6kbMaEQ0dIuOpSbLLS9Yp2
	pVbbgVq08imFXKROTzcEOBGHIluM3uOnkRjg6sIJPQ2fbr25Zz+ZZex7JvOu8s7zG+E5ZzcZL7S
	1ebz5TmDVEPd65e4BVHsnqGd8EkxFH2aVTMyz7wWfkwmEUJWwl5viW67e27YJsF0dkd5QW18640
	W6lxqmTuposm6zkHrTtuDZoDoG6rUeoSlWPc=
X-Received: by 2002:a05:6a00:a909:b0:874:705d:f644 with SMTP id d2e1a72fcca58-874de706acfmr4341740b3a.38.1789738302206;
        Fri, 18 Sep 2026 06:31:42 -0700 (PDT)
X-Received: by 2002:a05:6a00:a909:b0:874:705d:f644 with SMTP id d2e1a72fcca58-874de706acfmr4341664b3a.38.1789738301659;
        Fri, 18 Sep 2026 06:31:41 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-875dc8f8b00sm834747b3a.20.2026.09.18.06.31.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 06:31:41 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Subject: [PATCH 0/3] ASoC: qcom: Add QAIF AIF MI2S and TDM DAI support
Date: Fri, 18 Sep 2026 19:01:11 +0530
Message-Id: <20260918-qaif_dai_id_support-v1-0-ed863c0e5e45@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACA9rWoC/yWMQQrCMBQFr1Le2kBSg7ZeRUqIyY9+F23Mb4tQe
 nejLmdgZoNQYRJcmg2FVhaexgrm0CA8/HgnxbEyWt2edG869fKcXPTsODpZcp7KrHTqz8ba0B3
 Jopa5UOL373rFajD8nSy3J4X5u8O+fwDl4zA4ewAAAA==
X-Change-ID: 20260918-qaif_dai_id_support-0f97144c83e4
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Harendra Gautam <harendra.gautam@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789738297; l=1242;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=EcScv/7GHH+PudgDUjdWtnbAFUCvWvP6zT1tLcuF5Jc=;
 b=GeTw2uERLVv9847hn+WQvTCMfaMomffeXpMKpbai+/1YAzAVM2lalTBL907PQRu4Pp1K3GcrD
 wL6c+w0Y2zyDfohlcm1+LMNdCGZybz5qEw1sOTdUGO/T7+dNDAtLaZz
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDE5MSBTYWx0ZWRfXzCwhndu1Y/vv
 qG8qPJcNn0V5P3w15N+i2VYPQr4TcY91K1c8PXx21T05ClpMvd7cj5iVqZ3anagrJ8T00z93P5f
 Du5gET4iAhx0odj73PSaiwy8FJKjgAc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDE5MSBTYWx0ZWRfX6TaPGUSCvSUG
 Xw9MprsgZtjFGIciZsjVRoMiuTnjExZuoXRiFYqDzTxI7BpIoLq/vtCA+6ywmX1Kk4fx33NUlkI
 7jaexgAX9WJJWUYXiDv/XcMKRe2SjWy2x8LrWZA5OHr1PiCdSepFu0mX9mx3txQfEUIydSSKwS+
 T3xcDfDTE9IcdWV0AYMWvPkRwFBuQDm/n/UFnsRfVfFK6DH8SWlkbpt7mFx+uQyMNE9leN3WyzK
 /X09qhfQPf5Qzw1QAHjp31Uiv6E8g+sufqLhSelgVFQ880I0vI/b2qWR+762YZ+6PS6tJ82DfOT
 IBDryuUnqZ2T+js0AeXudY3c22SNdhHqPt0afrO/f5Nb31XsKjd2gGioJ2siTFIrUVEYF191t8n
 Gf2U6fQr3x7X/O0TMkwrYj2awG88BH5N4ekbSJka7IajroL74DKoR2Y/96fYJ1z1Ds+bRKaBTds
 cSkGKqRVlOj8QHbaYUw==
X-Proofpoint-GUID: BFmcPZoWwemASYH6EaOt3ZdpS3Mwy44u
X-Proofpoint-ORIG-GUID: BFmcPZoWwemASYH6EaOt3ZdpS3Mwy44u
X-Authority-Analysis: v=2.4 cv=R+mWitRX c=1 sm=1 tr=0 ts=6aad3d3f cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=lDHNxqq9c2JpMXR4PYYA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 spamscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180191

Add support for Qualcomm Audio Interface (QAIF) AIF MI2S and TDM DAI
id's across the Qualcomm audio stack.

The new DAI IDs are required for platforms such as Shikra, Hawi, and Nord,
where QAIF audio interfaces are used to connect external audio devices.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

---
Mohammad Rafi Shaik (3):
      ASoC: dt-bindings: qcom: add QAIF AIF MI2S and TDM dai ids
      ASoC: qcom: qdsp6: lpass-ports: add support for QAIF AIF MI2S and TDM dais
      ASoC: qcom: sc8280xp: Handle AIF MI2S and TDM interfaces

 .../bindings/sound/qcom,q6dsp-lpass-ports.yaml     | 16 +++++--
 include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h | 52 +++++++++++++++++++++
 sound/soc/qcom/common.h                            |  2 +-
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c            |  2 +
 sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c           | 54 ++++++++++++++++++++++
 sound/soc/qcom/sc8280xp.c                          |  2 +
 6 files changed, 123 insertions(+), 5 deletions(-)
---
base-commit: e657a464aba873f5eaf3ca821b6e4016674492d6
change-id: 20260918-qaif_dai_id_support-0f97144c83e4

Best regards,
--  
Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

