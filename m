Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793015092;
	b=aFrqhGE0a170ldtbPbazJIMo6/a9pvCSAiFrTQasfleVSWdPEHsAoOKIkIDJ3zhxOUXb
	 VnFWr6vRR7OlsfkJWatZs3vAgPDnyqociSwMU4ELXj4TnrcRgq9cKLTMBBd/fq1RIR6Cw
	 AyrfW5b6lRvD4B7kS78QD7vDOP2KB5extJm2AL2nLJv4imjBtKPqlBiUW1G5uZ290cecN
	 +4SmmVjNnUKOuTs8dwJ7DqaGanh+8aIu6Gra3w8t5yGSRLTHhHl21MJ0j/8lNNdQOa7Jt
	 6IeLLDwNw58voHmn9vDgXPKiKakpolWDWhB9cC7ixJgpUUL0L5tX9xGFMyhN9Mn8DyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793015092;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=9Kl1Kh8oli+G5hmcoDyt7e8HmNj391eaqiDZNoQBiUU=;
	b=h+qc0J8zEwOQAIi8q/47/uOQgG2Y9InLcHsS0edBh4lbS0WQ291Nla0pXaWlqwoUKHeg
	 aRlgQgL0ezKhleZ+09ddtCl6pv5CooZ3AwFtsLobKiiwLXN2zkU6p8WNnjzAIFtuQZKPZ
	 IVsK7p/2Yy60fujkWKZWxv3LHTxUKQmhnqmMYNQ0Xl6sM1giHKkcWXWRZ3TaSJOXOxljU
	 AvtcQrd5Gw/+TdDFPu0pa5gTPFIOmtJRhmPriL53U04XEIvhQWg9frN+rbCJHDh6149Lr
	 yMba1M/AgPhzXMn2l9Z/w1VAwPi20CNTDWBkwMBrJLscJ9a4+50ILmf8RjvdmBx0r7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eTm0dwzk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hccjjQKK;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36925606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:44:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36925606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eTm0dwzk;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hccjjQKK
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAtIvq3563651
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:44:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=9Kl1Kh8oli+G5hmcoDyt7e
	8HmNj391eaqiDZNoQBiUU=; b=eTm0dwzk6LSf0JPp9x4b0hcZHfccTU/jPfqzZD
	NtVBKgzM7+Q5xtJP54dKDfitMDbeEtsELcgx4XUQphVZwReweRB8wc3G3fuNbuxB
	/MhuiO4/eMqQyAMek5j4dWp1vMicmsKzUEsB7LWtRxyoPLQJw1o4MgtwdIUfPKJa
	37r6Y0qv+LtveOv/zYU3LBUtjHYmiwYtAkhmLNacJBOlIEp8MxWKo35Fb5vHRDQO
	h48pz+8hhaCPrKSAXBWnm6y2VC0zge79ZuqMcKK3lYp7ehaQmjhbC84sodGZsiMM
	K/QNOv8i6w1BuiqZWYdSXJjpd3g3b+H8GH5odNzqHSQHcscw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj4s90cq8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:44:50 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cd67466211bso1808221a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 04:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793015090; x=1793619890; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9Kl1Kh8oli+G5hmcoDyt7e8HmNj391eaqiDZNoQBiUU=;
        b=hccjjQKKL1rZDZ/otGJSKBh/pG8tqj9MuIsqy4IrLto5QBEIyQd4dmKnrknZd4t9fq
         mV2GAgzxti7znqmTRs3HgY1R+peUMneIppByIFSW1/Dk5Cwv4OI1IKF3XZ/lw2dm0k1B
         +0lm0V7DdSN9oStm+rH5wziBmI/gIW6GQ/c/+btbjEo4XPGpb1EZB5vrXeJ3THxGchrj
         k5WVJzXuhIpqfyVC3rva3FwyuOzRJZHDVCM/z3qTXHyJrcZ4CclUnOYLUmCZ6feZDcar
         gIYqmcA4C0ilrHMBCKWoh7/dXDE26vmWOv2X/JUmv8V/u85vQR1LQjD6wqZZQvV78in5
         NSOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793015090; x=1793619890;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9Kl1Kh8oli+G5hmcoDyt7e8HmNj391eaqiDZNoQBiUU=;
        b=UZFZEq1Ipvzz4QHH1BWM44rdOwxZ4LAHib22GT4rgF3/MayD6p0tGZpDcf1KacZlPG
         zhiM+t3KtUe+KV2eddxB6frjNygxZKhyCXifXT4P4vKNDfYkU2H9u5jhvbYCJxrHf350
         4x/+zyQZREBvwJAiSjUP85QnkABoJ8aOne8l4TxX71CtGOznfpuM/97XAEMY8d69oRh9
         Bc2BSGFzmbUpIbWcaL/eVsRSxlrT6ydAxmqKWF22plYjkj5Oz8bqMITdZPoJDt7OlSSQ
         BAipL4xMI39iQo6D2eRBmUbXYSBewsIOKLidxYyzZ7DoMGv3rl8Rwu4X3wrelGNnYsXA
         LSWw==
X-Forwarded-Encrypted: i=1; AKwUvBzmg056b3WdM1foRG6tR1o0/eT9alKm5XxXfeY2RX6Cvo7hdAl0KqhgMFXZnk0pqjb4qDCdrN55PYY9c5o=@vger.kernel.org
X-Gm-Message-State: AFq9FYIG/AvMiUPqkaTCKU4p0p14KvUxtWeaqJeXp0svcJrSaHxoOylB
	38o/Ow8QzcXgz/53GIAUCbNyW7+hi5ZFuo2mnLYDDHBQWHVa5YClhnJFd9+HM9q3jzgNQCoRUa0
	pW4qarFhNcfT7M5iwflqyFj1fTI5Fn6iGcGfncOq2tSk9k6MZdjKLCyMejbMOE3bSbX8r+h53KM
	o=
X-Gm-Gg: AYBFou3SKvgimH2hAOKZG7Ct9snjCf6rmA6SIhRVR58jZ71PdgOeheJ22zoqOk5bWRv
	6/JW8jWs8zienNMmHMRgssOlu2UykaTjjeWq1anzURck1NFDS6VIqC4EtI81FR+DTkjbrh7XmdN
	4GzWUHkMKCj+hVNz9M62F5iMhlElR+7eFlsVSOg23NIjD6+bhQ+Q0VJeBNE1ihtj/6PcoSF29Mc
	j7Y0ahJiufcdUzzy0xD+3i7rVxfNbigdkmM/jcRiRZsAA9/r3tbYTT7yHYFYvrRdO6323sSh2ic
	Ph1Nxz/0uFrU50R7F9flknUi88YaUU3zh+HashvPoIr7jHIxXHpZcqqNi97QjLd3E2mfOLh9PwQ
	glZVNY222bafVZVte9a9w7vyRdFRGMHB5Avg=
X-Received: by 2002:a17:90b:4a84:b0:3ac:ad90:7090 with SMTP id 98e67ed59e1d1-3adeb15557amr5597886a91.67.1793015089941;
        Mon, 26 Oct 2026 04:44:49 -0700 (PDT)
X-Received: by 2002:a17:90b:4a84:b0:3ac:ad90:7090 with SMTP id 98e67ed59e1d1-3adeb15557amr5597868a91.67.1793015089435;
        Mon, 26 Oct 2026 04:44:49 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebbb1a13sm7909588a91.2.2026.10.26.04.44.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:44:49 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Subject: [PATCH v4 0/7] arm64: dts: qcom: shikra: Enable audio on EVK
 boards
Date: Mon, 26 Oct 2026 17:14:28 +0530
Message-Id: <20261026-shikra_audio_dts-v4-v4-0-cfebe0809467@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAB0932oC/22O3W7DIAxGX6XielQQCCG52ntMVWTAWdian+Ikm
 lT13UfaXE2TjKXPss/hzghTRGLN6c4SbpHiNOag307M9zB+Io8hZ1aIwsj8OPXxO0ELa4hTGxb
 im+bQKSyUQ2UdsHw5J+ziz5P6wTbNLq8Zre4L/bLjjq2EtzUrl2N1QCJ4KpuXT2Z2CO3hpHWep
 7S0W8lzCd65uhPGVGikep+IzrcVrn4ahnNuu+EPT9RSHP/nA/g+jsi3Yi/Ba9cZB6G0dbD/shw
 Q8n0Ql+ZUCFDKG2e8wwq1FWXocgjGWmlqVWmtAKS27PJ4/AIUUMKWYwEAAA==
X-Change-ID: 20261026-shikra_audio_dts-v4-af3e23be38ba
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Harendra Gautam <harendra.gautam@oss.qualcomm.com>,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793015085; l=4406;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=9dLtF56DiaHESPL1fAcaRBjVHsRuP7SV2uePpc6xZFU=;
 b=JtwT2LJ4fAj3kTaKA+Hifzmm/T3V4bHE6Mh60lkByu2TcyfYNjlbs8jk0lR8uPd1GVDcuuefw
 +WcCahKU6YhAh29PRv+IiV+kKn1P5ayBj16mDTVKPzXXEW/TjUqaaKH
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0NiBTYWx0ZWRfX/6OG8Xc48xmE
 c0/TI9hZ9SYySUpFVYbXUu1Rk5dwBih09RwssKMG0MCUGg4yRbHtka91zGICMsXl0HUJ+aGgzVj
 JaiIuWCvveKZoa1xqjoT7CObHk4RLfyJR+PLjDcLOW+xphKu9ZW1JB0susma9HTUVfnffHV5dv9
 QW6LNhfToj0zQjAAgWjNwIVCz9+bNnR7xAheIhswUxd2KJ+C6oOl9C1pCpDtM5Rluplb/lVTj/W
 eAgxq83Pz4NSOp6v27DaTkwTiOxWGK/pse+avFIFG3zeBNJFVVjpjWiMqrBHt7dZrh+B6TMV9c5
 W59YPSjzSx9FDwEpIk3V9KdrRymAkVFoEzZYZF9x8nVw6Y0BN01RAi8tRHAk8XiqOyxOzZ0Zo2n
 YQ7BbjBq9fFBITStzkt+DuF88juB/Bj6eCZhcdYqihBfS7W/cRC5AFjmYLS+CQa1iyB7sPa9VXX
 ShARQ8/lOeJCSulwZyg==
X-Proofpoint-ORIG-GUID: ypmhXSG3T4Uw5aSKtjePp2TpnpXNk-X4
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0NiBTYWx0ZWRfX8EocDZ1pEB5n
 kqnIf34lxc1sDiYz1RdY27XspiJAUCW+N8bSCv9nix4vG6QQxvfUs7cx9YFDQZAICKdmwCrfwML
 VJ/qFSInAHWVp1DwGcXjwaLp83k5H+M=
X-Proofpoint-GUID: ypmhXSG3T4Uw5aSKtjePp2TpnpXNk-X4
X-Authority-Analysis: v=2.4 cv=HKhWhYtv c=1 sm=1 tr=0 ts=6adf3d32 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=ovq2u_4NKDcFgHnQCeAA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260046

This series enables the Shikra audio path on EVK targets by adding the QAIF
CPU endpoint, GPR/APM/PRM services, SoundWire and LPASS macro nodes, and
board-level sound card wiring for CQM, CQS and IQS variants.

Shikra EVK variants use different audio components and processing
architectures:
- CQM/CQS use an I2S-based path with WSA885x amplifiers and
  PM4125 + Rouleur codec components.
- CQS uses modem-DSP based audio processing.
- IQS uses a third-party MAX98091 codec with modem-DSP support.

The series depends on the following upstream patch sets:
- Machine driver compatible support for Shikra (v2) [binding patch got reviewed-by]
  https://lore.kernel.org/all/20260910-shikra-machine-v2-v2-0-9bf6bad589d8@oss.qualcomm.com/
- RX/VA Macro codec compatible support (v5) [binding patch got reviewed-by]
  https://lore.kernel.org/all/20261014-add_shikra_support_v5-v5-0-fb9f0667e613@oss.qualcomm.com/

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
Changes in v4:
- Rebased onto the latest tip, as the SoundWire changes and new QAIF DAI IDs have been merged.
- Added Reviewed-by tags from v2.
- Fixed need-pick issues reported by Konrad.
- Updated the commit description as suggested by Abel.
- Link to v3: https://lore.kernel.org/all/20260917-shikra_audio_dts-v3-0-9a49e1ca6370@oss.qualcomm.com/

Changes in v3:
- Rebased on top of AudioCoreCC/CSR dependency series (v5)
- Dropped v2 patch 2 and moved it to the driver series.
- Updated the defconfig patch description for better clarity.
- Link to v2: https://patch.msgid.link/20260910231642.1794948-1-mohammad.rafi.shaik@oss.qualcomm.com

Changes in v2:
- Added GPR node for audio IPC
- Added QAIF CPU node
- Link to v1: https://patch.msgid.link/20260910231642.1794948-1-mohammad.rafi.shaik@oss.qualcomm.com

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Abel Vesa <abelvesa@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Mohammad Rafi Shaik (7):
      arm64: dts: qcom: shikra: Add QAIF CPU node for audio
      arm64: dts: qcom: shikra: Add gpr node
      arm64: dts: qcom: shikra: Add soundwire and macro nodes
      arm64: dts: qcom: shikra-cqm-evk: Enable sound card support
      arm64: dts: qcom: shikra-cqs-evk: Enable sound card support
      arm64: dts: qcom: shikra-iqs-evk: Enable sound card support
      arm64: defconfig: Enable Qualcomm PM4125 and WSA885X drivers

 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts  | 196 ++++++++++++++++++++
 arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi |   5 +
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts  | 224 +++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts  | 159 +++++++++++++++++
 arch/arm64/boot/dts/qcom/shikra.dtsi         | 256 ++++++++++++++++++++++++++-
 arch/arm64/configs/defconfig                 |   2 +
 6 files changed, 841 insertions(+), 1 deletion(-)
---
base-commit: 20a33c6b6cbe7e4805dfb6cd68816937443aa148
change-id: 20261026-shikra_audio_dts-v4-af3e23be38ba
prerequisite-message-id:20261014-add_shikra_support_v5-v5-0-fb9f0667e613@oss.qualcomm.com
prerequisite-patch-id: 69a6b9ed1cce6ce328f833eba9c5f8b4fe6f66a1
prerequisite-patch-id: ac7bc5ad958bb392a57871dde1f79c2fc520d482
prerequisite-patch-id: 332b888996b9d6c58e8c90eada37dc14137755ea
prerequisite-patch-id: a2a20bdd51ea3f44449b116d7c9408e0cd90a7fd
prerequisite-patch-id: 47582404c535e0239542882bf07d6c8161cdd50f
prerequisite-patch-id: 2d76098fec23a279054b2f580e42cb90f82dc4d1
prerequisite-patch-id: 48c82d6e40f27205cd1f36b38bde19ba3186f6b4
prerequisite-patch-id: ef06195615929d1e6cd58cf84aeac18968d3f872
prerequisite-patch-id: 83ef9658644923ad9f4e6a095f8b262c6ebfe295
prerequisite-message-id:20260910-shikra-machine-v2-v2-0-9bf6bad589d8@oss.qualcomm.com
prerequisite-patch-id: 99245529321cadedd30d9e38845b53dba3725de8
prerequisite-patch-id: ec6621f8f392aa46f365eae91a3a0f66b1628d0b
prerequisite-patch-id: 3da6653022d716bb81b440cd472bd464082eae24
prerequisite-patch-id: eb9cd5e7ba7fc4ea86f758e127775c70dfda59c0
prerequisite-patch-id: 648c31f694cc711154d2cf2137259f39a398be74

Best regards,
--  
Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

