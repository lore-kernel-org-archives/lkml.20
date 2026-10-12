Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD1FB329E6C
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 06:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791785905; cv=none; b=Respzf54BE+bsFndYzylio9akZeK2WTT5s39f3vXF4IphVRfwOHvaicJE6KynuJT1pa6/qmtFjO4/ahNXGaWff/AEtxwsyDPJH9BOdz3Eikane7Y6L8sjgfEX1ifqRda9geFUahPnwzwHvWJL9hCHriZaVUMdp/g29vWBOhuEII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791785905; c=relaxed/simple;
	bh=P5bKGgr66c2nj+TMeUqv+QCxD+y2ch9e/x2bFae53cU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Axy+msQM89v3PZFBEu5DhHjZi/fqy8dER2Lcmw5ucRwDe0bfxkhh7IplgePh107VsCuW5T14pe8LHGTZHWIHat++VXz0RS5eunA/5yWk38D80dlm6NkBaez11Gt1PzxIo1BQEh8DljP5KEIWMcoUoc1Epp/iEFN2HwQV8fLyCfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nEZjLwpp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dNqCRWni; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nEZjLwpp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dNqCRWni"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C55qg71339465
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 06:18:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=BkPjgx4DX4xwpBvdmy0MXr
	dQFriGtoWZz1uvdjQRcCQ=; b=nEZjLwppzryQWHkqmvuaAaKfjjMGCqhglMx//E
	bzUoOud3S55T1wmtaZZfGaaibI087hLoksOvVAljZs2lrfN9Di/+0rG+ZwZeIHk8
	5jw+2fmlVxUCoq57vx3m4CpymiQ6qVW63Dj8boVewUg7tXhlSZrwcFXuccUARLDj
	Er3ImjHq0+Eaox5K8Dx/Gk1C8StFIXW/gpzneYq/mLUUBtPbaUaf4jBg+b20fNEo
	9ZJEqlI8wzsyd1d9zaaLLuwNp6D5lN031BxjreKmaNCd008ABR/5Sd1p7zinfczy
	m4WCfewczY13DtrPhnPsdZTuaBWUx9e5q2TD7pY5IjXaHFlQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7dk2511r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 06:18:23 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e605efae40so20159975ad.1
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 23:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791785903; x=1792390703; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BkPjgx4DX4xwpBvdmy0MXrdQFriGtoWZz1uvdjQRcCQ=;
        b=dNqCRWniiL0S1L8gtO5EPNidSmS6XIOGvX9BES4lqeRdi3027BoQSxbd6urm7DFzWX
         SxYKUXDa/xlCOqtS+COIyJiNfX2f32xc7VTyJblL32f4SGr09nuk2UUtru6mejnGpL5e
         TjkPKlEvG/jwfFaoy5sBrK7wF/LE8W7+cGGguc/9znCdXrkBw/S8bl2KS4EYMVZgcIMw
         VF19l7f+RHg3Rtc2MWKSpgtkJ6m1+JnftL7cysG9XgqqgtQvLE7MFb9tJnJ6BZsueyME
         ZpTUnOF92rLeEp+hqayw96V1Czni9pMU2cccgoRSzHd4tl1eG1ZHKnMgByO3qdoi7mS1
         kNMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791785903; x=1792390703;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BkPjgx4DX4xwpBvdmy0MXrdQFriGtoWZz1uvdjQRcCQ=;
        b=VShYkBCSRINKusV4+6io0nzCeot66kr/qglF0UVe7gMoU3TLfGyobTMpq6jqQEIVZb
         A2t8UH2pwZsD6qKE1h2TdACCroNyrs9dMSe5MHyDIfDuVIdt7UpuGNdLOzT3DAZq+it8
         q6N1KCMJaDVm3oohAGSJNNnIHMjZxBeYOz6cweZImerzlXHB4fkTjzZSrJ+9d4R15LYU
         Pj3jEI9yK+Rj5ywjcoeXssUMyW+hvFc7ieLgZhnSvG426jwTd7ZuPEIcpZpUozZ8PHm7
         x2XqwGfx12GpSkXhHRzpEPVIBHn3vJsip18CABRy6X9aiFSd7U4vcz3EJBHiMMqwAt/b
         0Jfg==
X-Forwarded-Encrypted: i=1; AKwUvBwnRvM+Cu1exFD61pmpJSM38JPBej+4kLIh81miNxYak2wzOg92E+Ktk12dihDd+i6ZQHjiv6BnGuxZijE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIIsVGMDk+T6sPK1St+KFiyOQEFbCk4ZYHYJaPY3IWwQWcctuCl
	iYOLjPm8Zjk6oz9jTP53/6R6Rm7t/mlHE32ZKtVh0ZXJByO10LeY2U4+WojVFoflCavSHdxgMu2
	Gcs6sXawB79T4zhSZHBNr3cmSgOFiEx/vFy6euQdSu7peSYgQg6d8TssI/2YYJMo1ekmmOa9mQp
	g=
X-Gm-Gg: AYBFou1XIOHqppC1Kx4H9RhQuLjc5++i8XtjsEuJgkrKU4R9ikUuocWTn4EHuX7qInT
	vwCgC6VBDwOVmE63jLgCTkZx54wUw7K657PuFOojAxoURi772ZsCcNrMM7dMldFcSXUtAY7+Zfp
	h7Pg2LbzfmwMuY+74Uf6Fpf9Fx6oaYmgqX1LTxsXYdDULBJ3PmydDpXSl2CY0tzxRwzgnUbMPfV
	J+oN9F7iKFSqGlw80nV6vTkzqc/pPMjkYKHUdLl3T1gh3THNM9qjgLunoMlKGTMDjF7t2/XWyct
	p8OrHpTexNrYuIpsB7E/SuOObHIAE3kAFdh0ksjKByscf0ACagaC4kytVu6lr32tFM5PYnsWPNK
	Pii5wnh5U0ttDGufkZs2O
X-Received: by 2002:a05:6a20:6a0e:b0:3e0:c2fd:511b with SMTP id adf61e73a8af0-3e16be0d320mr6975526637.32.1791785903022;
        Sun, 11 Oct 2026 23:18:23 -0700 (PDT)
X-Received: by 2002:a05:6a20:6a0e:b0:3e0:c2fd:511b with SMTP id adf61e73a8af0-3e16be0d320mr6975516637.32.1791785902540;
        Sun, 11 Oct 2026 23:18:22 -0700 (PDT)
Received: from [10.213.104.249] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3d9e07329sm3770481a12.5.2026.10.11.23.18.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 23:18:22 -0700 (PDT)
From: Ruchira Revdekar <ruchira.revdekar@oss.qualcomm.com>
Subject: [PATCH v2 0/4] Add support for Talos Lyra EVK board
Date: Mon, 12 Oct 2026 11:46:25 +0530
Message-Id: <20261012-talos-lyra-evk-v2-v2-0-dcc9316ebb59@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADl7zGoC/y2NwQ6CMBBEf4Xs2U1qVUR/xXjYlkWqpJhuaSCEf
 7dVj28y82YF4eBY4FqtEDg5caPPoHcV2J78g9G1mUErXe+VOmOkYRQclkDI6YVJI2s+NQ0djl3
 dQt69A3du/jpv9x/LZJ5sYxGVhiFhNIG87UvkeY74P7jAtn0APwDR9JUAAAA=
X-Change-ID: 20261007-talos-lyra-evk-v2-e2e588a34f6d
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ruchira Revdekar <ruchira.revdekar@oss.qualcomm.com>,
        Avaneesh Kumar Dwivedi <avaneesh.dwivedi@oss.qualcomm.com>,
        Nirmesh Kumar Singh <nirmesh.singh@oss.qualcomm.com>,
        Monish Chunara <quic_mchunara@quicinc.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Sayali Lokhande <sayalil@qti.qualcomm.com>,
        Akash Kumar <akakum@qti.qualcomm.com>,
        Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>,
        Vishnu Saini <vishsain@qti.qualcomm.com>
X-Mailer: b4 0.16.0
X-Proofpoint-ORIG-GUID: K80X3KgfSVcvuOpIicr-cVaFMsMeASFq
X-Proofpoint-GUID: K80X3KgfSVcvuOpIicr-cVaFMsMeASFq
X-Authority-Analysis: v=2.4 cv=E6hYNqdl c=1 sm=1 tr=0 ts=6acc7baf cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Akds4Oeo5k9by0OAE5IA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAyNCBTYWx0ZWRfXyrnZhfndM2NI
 xQVWdkZfuu0WsqOegwPR449kPSuSLvZIZWkSmfNKK31PPps3S3PebPdIxHp3zGul/Gpj5H2QrQZ
 fCosPuU2NqF3IC130XdoCPFEZt8L2bPQBIxF7SxxaULvyG29e0gtYALPDBz9H8S/KgUg+zFwszk
 4+qHdbCVDo3UBsLTcejAN2d3nnmYHk8Hn+KsaZsK17AIuiar2yw4wgTxVsWyke7j6h7wKhQNERE
 sUXyjv92H+U4JDEcTCvi6nH80hB/aPEsFYHW6ak594LYCbOd1QguMPfGIS6/U4jN080rRSI1omz
 4kFGco5ZmzFnbFOVEuM+6wwMNSFcVm0Cl0JKOuW/1lPiyDcJGYM79ivC2+BBODsXjZvrmKDZTtr
 kt+umSBnF2c1dxNzGKX5BuzomEtXJ4Y36Dx1c7CJ5E1eJFU21UW9+x38Op38djUPPS8VLNsXUNo
 3pdwGH8bAvqy8pY7H5A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAyNCBTYWx0ZWRfX4SBq0k6T1HpW
 uU26ODRvVY3xRrpLNfqYxL1s475RUpWTL0V7WULeqU4qUOJtoNzVFqj3jcEuLeNOx2gbzZl4qRc
 ftXNXFqJIKHYnKH0fSCqIy8Jl7zXTRM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_02,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 impostorscore=0 phishscore=0
 bulkscore=0 spamscore=0 adultscore=0 priorityscore=1501 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120024

This series continues work originally posted by Avaneesh Kumar Dwivedi [1].
V2 incorporates review feedback, validation results, and subsequent
updates.

This series adds initial device tree support for the Talos Lyra EVK,
a QCS615-based System on Module (SoM) paired with a common carrier board.

The Talos Lyra SoM is a compact compute module integrating the QCS615 SoC,
PMICs, memory, and essential connectivity. It is designed to be paired with
multiple carrier boards to support different use cases.

Talos Lyra is a distinct SoM revision of the existing Talos EVK SoM. The
key differences are:
  - Adds Apache (Lite-on-Module) WLAN on SoC Card.
  - Removes SPI-attached CAN transceiver module.
  - SDC2 on the existing Talos SoM supported SDIO-based WLAN; it is now
    used for the SD card connector only.

Changes in v1:
  - dt-bindings for the Talos Lyra EVK board.
  - Talos Lyra SoM DTSI with PMIC, regulators, storage (UFS/SD),
    QUPv3 instances, ADSP/CDSP remoteprocs, and GPU definitions.
  - Talos Lyra EVK board DTS enabling DisplayPort, GPIO expanders,
    SPI-attached TPM (ST33), and USB on the carrier board.

Changes in v2:
  - Drop qcom,talos-lyra-evk-som compatible from the binding; group
    qcom,talos-lyra-evk under the existing talos-evk block instead
  - Remove unused regulators vreg_s3a (smps3), vreg_s5a (smps5) and
    vreg_s6a (smps6) from the SoM device tree
  - Update board compatible string to remove qcom,talos-lyra-evk-som
  - Add "talos:" subsystem prefix to patches 2 and 3 subjects
  - Set initial-mode to HPM for all LDOs (ldo3, ldo11, ldo13, ldo15, ldo16)
  - Add EL2 overlay for talos-lyra-evk as a separate patch (patch 4)

Note: The WLAN node is not included in this series and will be posted
as a follow-up.

[1] Link: https://lore.kernel.org/r/20260901-lyra_upstreaming-v1-0-e3a76dc9e21c@oss.qualcomm.com

Signed-off-by: Ruchira Revdekar <ruchira.revdekar@oss.qualcomm.com>
---
Avaneesh Kumar Dwivedi (3):
      dt-bindings: arm: qcom: Add Talos Lyra EVK board
      arm64: dts: qcom: talos: Add Talos Lyra EVK SoM platform
      arm64: dts: qcom: talos: Add Talos Lyra EVK board

Ruchira Revdekar (1):
      arm64: dts: qcom: talos: Add EL2 overlay for talos-lyra-evk

 Documentation/devicetree/bindings/arm/qcom.yaml  |   1 +
 arch/arm64/boot/dts/qcom/Makefile                |   5 +
 arch/arm64/boot/dts/qcom/talos-lyra-evk-som.dtsi | 251 +++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/talos-lyra-evk.dts      | 137 +++++++++++++
 4 files changed, 394 insertions(+)
---
base-commit: becb95e45ef0dda9ffb35156d909d3da7a2789c3
change-id: 20261007-talos-lyra-evk-v2-e2e588a34f6d

Best regards,
--  
Ruchira Revdekar <ruchira.revdekar@oss.qualcomm.com>

