Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FA8A471246
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 11:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790768958; cv=none; b=hkK4OVAlURlP/hbTpNh95UUOQPZngoaNOl4bpJMQZTIkBQuHUzHRR1nykEu3GUJf9+in2GLR4Dxdq/mNXDpwQPXwwvVyvq0EKfdFugb4wGCWgFPFjqs3qO9PGiyurHm6eGc37ZcOaATMnqRJS58WixjlYvev9ycjWDk2OhusASM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790768958; c=relaxed/simple;
	bh=6Hf8A/ibvYwSw2K6acFMvDfVvlwnZ2P8a7yJ3TSb5dg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=uibxxB1VU375RqnPlMGP/flecboHL+2eITMQV3R/MQ/MBud5PKW7FtfkCCQs4VsTdPLuoPqoNiWxVIi+F7f/WOFxArmzT2XER43GBhjAfUCPItTuQ98xn7/q9orOzOUQ4T+YszgLFU16yZqXo2oy9afRrX/sW5D7w3EI2Y3G8iQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DhDUGPbo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CH3DLrPp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DhDUGPbo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CH3DLrPp"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UB7JMp3554805
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 11:49:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=5Zu+NIHhBBeQIzNpCB+KAo
	MZrGj5Ijoy9JyI8PUji8o=; b=DhDUGPboDAaFomNYC3akX7UGb0BaIytWe21LXC
	HlDrCmBBIW+/Awz+dkbho7xmHAoJve8F9fiG/T5UiwsIF3mgYUvC9Jj19iWUh09g
	2Gr3Qm5yKqnlNRLWqAHTrZEWhjp6p8rsAFSg8NylQX53xu+PkAf+Z/zI9Tv5uq0f
	Y9+f1H6gs/w3uwm2nsEpc3nnFFzzvWa/b1/O6XJ8rwgm35eUQoYioF2VH0jExtaf
	+jLSiJ5i9uyOsmjZD6VZw1vEkRuU/jW/AuEg7qb51eOODpsRclQVWkhXVWkNL0QM
	7oKYmKx//FZHWstiJeMJpQ17n2bDOHtqYDDpgQBqi9RMT3eg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h10bk8dmt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 11:49:16 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc1ca15334cso5900850a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 04:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790768955; x=1791373755; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5Zu+NIHhBBeQIzNpCB+KAoMZrGj5Ijoy9JyI8PUji8o=;
        b=CH3DLrPpz2J3NevAuXV0AmOh/8xxe+ZB8G27jU1Kn09MPOQm7MUGj89FOL/vjNc/ku
         loRtuoH9Tyw2oPPqNOM6spVB1DbxHWI4tiT0/uFC1f+aI+UG+hhAju59pXnxqRFZi1qf
         AWuQJKqm2gaW2SQvVDKGzoGfAMuoRwbsU9k2zKzv4p8aM7UGTDzSm1199LIPHDRvQW6X
         bmt3Xl523aaRTp6Bi3kuMReHmM5vC2rNyiUjnSkyYWRmhTf3IHSHYSCnAGCxexyKd4IH
         BP4ZOTc9rEilJMCp6ebfaN+9e4KxPDy2i2HS6twDnbs1sqNJhkkVnmA3P1Wn3Yl1zP4H
         d6Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790768955; x=1791373755;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5Zu+NIHhBBeQIzNpCB+KAoMZrGj5Ijoy9JyI8PUji8o=;
        b=UP3aT6dWgDO04gHpmryQNeFGEpzo1KYKEQBILKkXGNQdyer66Rl6ehJTE12Zmn02Sy
         7ySTE1Qxo1Unm+QqeamrXrL66Y1XbEVCkzjazI/RK9wrEmP//VklKvReHhJh7ujLHCV6
         W/YqAE5eec8nNwPNTt3kkybzJV/fucjHrlwsXxLWanWV5RdtJNOOp92iRVk5p/SElhB+
         E6HPcLBF5HOK05CcCr3BXSikj3C70MiF0BMDQeknhuTBGoSV01ODdd+fzq6TLs8HX/ch
         K+rTimhbOke5wUIaBuBwauIVgXCdk8RNZQhxMzlqTIyT+vP9qEf7zGkUzdKNb+tgVwR0
         6YRg==
X-Forwarded-Encrypted: i=1; AKwUvBxgqSSCWcSPK4gYb7yjRc8iiFelN+FCEDtJn+ei3sfdEoXTN5fZaSrBjOJjlVmOkg+C1yKg+KLVU3noUpQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mSJfUKfltOr/4BYsCb+z+P7nKbsozDhhiHZoBBs0AQyxjwoxn5
	m96ZXuCVqwWaTj3SZnnIvXr5xMOS9cpZTDkcY8xG48KvsICf6TzOBh2vWmI8wK7BQI5j/zJw0du
	ErkwY+u7a8FJdxgO0eOLmy/s6rri1ZClTARIwEC5CGidcd0SxrY5QoLSOdjKCcWjDZqg=
X-Gm-Gg: AYBFou0WaZ8QOIRfq/KMPJJZ/rO4VeJwtX0LxXYocb4sg8u2fK8kEprOOD2rsz+6cNr
	3tL3VNNJ83irItEJl7rW9ct8MUR4OjFNbv+SBaTfUJ+TSySKoujkrzqRlS81elAQXeq+IyPt5ds
	vyFO0IIsTW/yxMtlxW58ZN7Y7HbYKG+F6PZZyoln9nO5UprAusHKDjb/qFRKPspEHqhDmgmjMAH
	4+GzoxgDMN03/Eb3eMwQyBBuX/hugkXmeisQjyjbFF2rdxjiwNTJRfNJ6Bp0x88bh6I4ATB/oqJ
	dYdTuXIJrb6yQhDQpJXBtcYo2mQYXvkemVde+5y33Xx2gkDTd8XQkuYzxG/t5AadrxMrOERcXKO
	qZ3NF2mUfvFXR7w==
X-Received: by 2002:a05:6a20:9c86:b0:3de:137c:2bdb with SMTP id adf61e73a8af0-3de9ebc5c44mr1058467637.69.1790768955132;
        Wed, 30 Sep 2026 04:49:15 -0700 (PDT)
X-Received: by 2002:a05:6a20:9c86:b0:3de:137c:2bdb with SMTP id adf61e73a8af0-3de9ebc5c44mr1058443637.69.1790768954685;
        Wed, 30 Sep 2026 04:49:14 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-887bc2bd404sm53163b3a.46.2026.09.30.04.49.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 04:49:14 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Subject: [PATCH v2 0/2] arm64: dts: qcom: shikra: Add EL2 overlay for EVK
 variants
Date: Wed, 30 Sep 2026 17:19:02 +0530
Message-Id: <20260930-shikra-el2-v2-0-f0822be5aaee@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAC73vGoC/22Myw6CMBBFf4XM2iF9RB6u/A/Doq2jTASqHSUaw
 r9bWbu5ybnJOQsIJSaBQ7FAopmF45TB7AoIvZuuhHzODEaZSrW6Qen5lhzSYJBc01atbfbBBsj
 CPdGF31vs1GXuWZ4xfbb2rH/v38ysUaOqvVe18c5ZfYwi5ePlhhDHscwD3bquX+XN6airAAAA
X-Change-ID: 20260918-shikra-el2-ea8969385c3c
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790768950; l=1846;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=6Hf8A/ibvYwSw2K6acFMvDfVvlwnZ2P8a7yJ3TSb5dg=;
 b=8ey/RxiPhjOBes5cw13ricIfGhRA1qGBjR8Udpb5S5Z9myULY6o+RZ25Hfjk1uakhanS/vaHk
 LnEim1kM+NQCtTA2toGL+2M4i0lyi4QEFEnhHqRs1QzYm2h2tCQqfJK
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-GUID: Puzd-yf6NS9yJSXaGoT9AY00ZZr5kJW0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA0NyBTYWx0ZWRfXwycM0rsBfHUA
 fOO1tWlzNexA7MztAgCVkblkzwW8m+ADMj/zgQmiXOX3qLPoeCZgkYuN8/RRBa8TQKUS1U5YPVD
 KfNBLPl0NP+ODY2Yyu8WRTw9GZBqFlZRL+SmY9bacuDOefbmGIKbkNIEuEckQAJ8m0Xx63wUnPf
 i8N2pyQuy6v5/cY0JdmWckv1+Szr3aAC5i00LMeybbdkiUk0hhLH/ZS0/E8SRQ9VJAQhE1g9vS4
 zeDY/toWOL3aES+IsGfEpehIFcPr7KF0qiCTDXqH69WoVY6ysCkFVYwA6bWULpTXOgXztJbn0aX
 YSWW4WbiOPtPMz9tX1neS7MpLpAAaHc5d7tnyIwirwAQS2XhR6KYCYsC02Qajnn/JEXyIdm4O8F
 51bXxeX15TE48Jn+0pL6WYQAd+RoMPnYTaHEk8w7VpB+VGEfT46UCSnnTd82n1bw2y7NuEqmsHQ
 k6LpTX7HnSHQiimdu9w==
X-Authority-Analysis: v=2.4 cv=MZn5KJ/f c=1 sm=1 tr=0 ts=6abcf73c cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=_5sKuGRrJ7O-zHbQ9ngA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA0NyBTYWx0ZWRfX8VqXm0Pyrpeo
 NaMoqkWp4V6RmoPnC0Ef8ezS31ThtRN/5c4oaXOIxJ4JXNvDsaDDy9fNi+3ftCfvoZEGOuaeOZ+
 2YqnolZhJoNqlGm5nlGX2pxQCMO1Ugg=
X-Proofpoint-ORIG-GUID: Puzd-yf6NS9yJSXaGoT9AY00ZZr5kJW0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609300047

All existing Shikra EVK board variants boot Linux under a hypervisor,
which means Linux typically runs at EL1. For EL2 boot without the
hypervisor, remote processor firmware IOMMU streams must be described in
the DeviceTree consumed by Linux.

Add a Shikra EL2-specific DT overlay and wire it up in the Makefile to
produce -el2.dtb artifacts for the Shikra EVK variants alongside the
regular dtbs.

This series also relaxes the Qualcomm PAS remoteproc `iommus` item limit,
needed for Shikra EL2 remoteproc SMMU mappings.

Komal Bajaj (2):
  dt-bindings: remoteproc: qcom: Relax PAS iommus item limit
  arm64: dts: qcom: shikra: Add EL2 overlay for remoteproc SMMU mappings

 .../bindings/remoteproc/qcom,pas-common.yaml       |  3 ++-
 arch/arm64/boot/dts/qcom/Makefile                  | 12 ++++++++++++
 arch/arm64/boot/dts/qcom/shikra-el2.dtso           | 23 +++++++++++++++++++++++
 3 files changed, 37 insertions(+), 1 deletion(-)

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
Changes in v2:
- Relax the Qualcomm PAS remoteproc `iommus` item limit, needed for Shikra EL2 remoteproc SMMU mappings.
- Link to v1: https://lore.kernel.org/r/20260918-shikra-el2-v1-1-07bb072baa31@oss.qualcomm.com

---
Komal Bajaj (2):
      dt-bindings: remoteproc: qcom: Relax PAS iommus item limit
      arm64: dts: qcom: shikra: Add EL2 overlay for remoteproc SMMU mappings

 .../bindings/remoteproc/qcom,pas-common.yaml       |  3 ++-
 arch/arm64/boot/dts/qcom/Makefile                  | 12 +++++++++++
 arch/arm64/boot/dts/qcom/shikra-el2.dtso           | 23 ++++++++++++++++++++++
 3 files changed, 37 insertions(+), 1 deletion(-)
---
base-commit: 6474fa070f2b8013b4b87350b775b8c3be6e8aac
change-id: 20260918-shikra-el2-ea8969385c3c

Best regards,
-- 
Komal Bajaj <komal.bajaj@oss.qualcomm.com>

