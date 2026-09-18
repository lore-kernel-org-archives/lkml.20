Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC4BF4FB9A6
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 13:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789739407; cv=none; b=XJ9dLGVB/oqXbwpJizG57d6w+9sn5kfXCHwDZou6CNhkwp3lJygPRLWT1w4wilZFh03rqmjfjjH3muJXKGICBe82biSeKKAhJQep28LszrIGI+498l9SCnPOnaVJMxsYzxhHPYA3/+JvQBK02Y0YRCFVShbLCpNJOeG8Tf/Rfak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789739407; c=relaxed/simple;
	bh=o8HVAWxRNlo/fFnBaZq7WHwUd6qM2TGc58TcV28OucA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jEIbxr612ZhmdKqQ3Q4qPNLpjgFPb5WluUO8EqDUjsyMdKOAyYrvno0XLnLjDyw34emL5Zi2b+p+zz52uZK1fbNCBUcQXsqmfLB+VSzULDpRbeNbdgEb5mF/xHV8ZLWdsxfzfu/Pk3bTXfbmBfu62FZllnVWDKUYdWHeu9yr9W4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bv3bjFts; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hqwc4FSs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bv3bjFts";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hqwc4FSs"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68IDOXNC745828
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 13:50:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=bDbvJAgP6Wge8ZgOdhJOYM
	3uUCE+5C75nJIzz9BGTTA=; b=Bv3bjFtsYzgywiPInaAkTCHD3gtjkpyIPYa46B
	lt0ymEl8t3RX7HkyNv5VcSGc48/nQ77vbXX0OJ8WMeJK0fT8DrvCjVIyxmKdhCw4
	1sUvF7ZSsvBlLVfm7b2evrcwTdUD7nGNyy6mcOcG6vpPqxBPEfIeIi3yI1W/P4TT
	oh+4yeLQAjiXXXwTg2UIMzMELCi9AM4786/06G2fS1CBBVrY0o1Lb2aP69kn3BgN
	5HGRP+O43dvnjF9RVHKgDPSHcTFxvbj2nXtVg15DR2sStyhRZtxsZMjmRF/VP8ms
	hGagnuAfPL4SDXwhc54uhCjP1nTehCjEsoyzFsv0n/BWyKDw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gs23915hc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 13:50:03 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc4ac5feaa4so1028101a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 06:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789739402; x=1790344202; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bDbvJAgP6Wge8ZgOdhJOYM3uUCE+5C75nJIzz9BGTTA=;
        b=hqwc4FSszoaLkEBa70Mr56+nzx231MTU6W24DobwBjaE5THK7GnYe6iJr83koPMQt5
         XsqlyI7bySkWxeI8ot+DEue4CxVpHIf1PaCtsPc+vUyyyvIFbD0g6HP7n47JJxW+OMgO
         qMrGGNQjAj8sONE6a9AyDTnqEc/nbrgEVFIBMV6WEpAuIDshjtrXeJ17818YgGPr4NRU
         JEwIuksrRd++lxD1F4YYw2p0jTgdGuJatEu3k7o2yzAEzDnEMqCHBzLqvmtKbML4tsD8
         BIgU6jlWYex8Q2unkvAQstOVkNTOW0Nl520aOp7Gb+cLOCDN4ad9nEG2XlnENT32hTsq
         UPiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789739402; x=1790344202;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bDbvJAgP6Wge8ZgOdhJOYM3uUCE+5C75nJIzz9BGTTA=;
        b=wBfobW3MzJMLX1nL6jsszlCkaJD017ZpK+94ENlf/+7m4zbMtSLxnI6ffBW57IW3hz
         UL7cddJsnkuRZGk1GN8gPeeWmLqrIIzgXNNHymtaL6xQ5G24geOUqK47y1jjUgNRHtfx
         x//UbLrGHBb6CGtq2ZNvsFe9E61zxvpViKWKkl0Lv+r0UOy3CHKsOkJ4vehySF/zlX44
         DDXZU94HH2U6i93Hq/Jvd7Yw7XQClo1cdiLewLVFJ8MB0OKT3TDFyBZvF/r39EpfG+zA
         5QP5kf3Orze7booSBNDpcxnbDKdz59BqjPbTXah0N+Z4y0zi5FSaWs1uiYpLU0gUEknG
         Ub+A==
X-Forwarded-Encrypted: i=1; AKwUvByPrMdps22b8WSjllg6ywodzMyWrFLv6noslja7HAx/jhmq1hYI20Vb6Rg1A+A5AzrHpp3+tHqC5AWHMjE=@vger.kernel.org
X-Gm-Message-State: AFuF++k7HC7qU/Vi6dSEHBigrLoGmG3CN0bw30foS0BCAbG4dM8FGnaF
	C0/yMRS8FoodypHFC6Q3nyC32P/FRWj10IIICeRVjrUmRVnaFzc3fbGli7cOQ7Lmj0xTkzXdr5T
	/tAO3s0r0f5uTGKiu1zk3bihRbib5/3UEBFffIogjB2JeNoXobsngYIlFuvsPc1Rt2uE=
X-Gm-Gg: AYBFou2CNCPav9aUndeNexQf/8hAsn8rjgOtroUIcgzpL9I3W6Io13RlKSLSjoc0vUZ
	HTjg4+LKaviyjybCWhayYE2FAElkuilZELoyP0XhgCGEZfS5F6Xnzb65f1EtoSz0WNawcAs01Mo
	/NfUEBoaHR87OpOE+ZDeqPpG+axbmLcWBbS17ejci+Ym/Um9OuugfMfbPs8GY6j6Nw7hqHvmARd
	jA5dR6FhrbroUwwiROZUOyl7clWJy91EbrHS+nKlZ0Cmcu/uFOuPMk4uEdt7ppvsI8clXe9Pz/J
	fRxQ4XogvzMbdKfVmPN5Fyj0fVer1z/jLUkkgNz+KFPXYKCVS3ZkGo9FrtwQ1kEQAhnTgGYQHpL
	FTbkruHwpKz5M0+eYWx4PUSm1zs8=
X-Received: by 2002:a05:6a20:a126:b0:3d8:f78a:9349 with SMTP id adf61e73a8af0-3dd8c424ea6mr5054004637.13.1789739402231;
        Fri, 18 Sep 2026 06:50:02 -0700 (PDT)
X-Received: by 2002:a05:6a20:a126:b0:3d8:f78a:9349 with SMTP id adf61e73a8af0-3dd8c424ea6mr5053952637.13.1789739401648;
        Fri, 18 Sep 2026 06:50:01 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc5c50e9fbesm1013934a12.32.2026.09.18.06.49.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 06:50:01 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Subject: [PATCH v3 0/3] ASoC: qcom: enable audio on stage-2 protected DSPs
 (mDSP)
Date: Fri, 18 Sep 2026 19:19:34 +0530
Message-Id: <20260918-vmid-v3-v3-0-f1cbf47bf173@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAG9BrWoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHUUlJIzE
 vPSU3UzU4B8JSMDIzMDS0ML3bLczBTdMmPd5MQUS/NUg9Qk86QkJaDqgqLUtMwKsEnRsRB+cWl
 SVmpyCUi7Um0tALemtdxrAAAA
X-Change-ID: 20260918-vmid-v3-cad97e0eb7bb
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Mohit Sharma <mohit.sharma@oss.qualcomm.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Pratyush Meduri <mpratyus@qti.qualcomm.com>
X-Mailer: b4 0.15.0
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDE5NiBTYWx0ZWRfX6HK6Pv1cjRJf
 VixdmIvdhx7FnEzl3LOSWJhM4QtUsbSmd0c4OA+HuNukv+hgL92Nw/AR4wWWKG9nA9WumpkiM/z
 r+I5g0W7Pv5zq2sNZmad/t3AnU0pLaA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDE5NiBTYWx0ZWRfX7odnV6wtnpdU
 3eaqqVbaLwzCnIoveFI4nbG6xWXj+CYAQ4N1WLbR+rErZSkyEy+VwNOlJJlW1ae55JFPK3pUUKz
 GXNqhCWEsArJ4C5zHYuc6jdjmR/L5H8Nun7r5JFsVeEkQ1pBG8/im+SzH09NXSwMYYTOzoGFiZZ
 2vBA9HbZxrQia8dBpe8Er9V2nQPIIkFvzoMYrZQX70zz6jkcwTzhYZK5oQOLzzYwFvOfvSfAHKz
 ukf6iuy25x0Be5bfC+7gQKIVTWnKb/3rxT2q2vpzex3DiTXBdINnGCfbuKsrAzRvpgE3CYWDndn
 H63CzZQR5pd9QlITvSRMhGZ5Bxteg6ZudKxy4WBnCKvjxa5EcaNObPaV7d4BCbQA5B1h2BAQUJu
 wAlC0+6wfQv4wz6XRGu8bFBc2wD/o4vpgiV4FVwiz1V1etlUyTG6oSytSy4Ytphuhn97bib657Z
 0n6gcMsGyKv8ro2p1DA==
X-Proofpoint-ORIG-GUID: 7ghK_oA7HbS_wOsfZnOD_0Z700BNpF2q
X-Authority-Analysis: v=2.4 cv=I7zw19gg c=1 sm=1 tr=0 ts=6aad418b cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=55ZlcImD-GYP5V34_OIA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: 7ghK_oA7HbS_wOsfZnOD_0Z700BNpF2q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180196

On platforms such as Qualcomm Shikra, audio is served by the modem DSP
(mDSP) rather than the ADSP. The mDSP runs in a stage-2 protected context
and cannot use the SMMU, so the PCM buffers it consumes must live in
reserved-memory carveouts that are handed to the consumer VMIDs via a
hypervisor (SCM) memory assignment. This series adds that access model to
the q6apm DAI driver and its binding, alongside the existing stage-1/SMMU
(iommus) path, which is left untouched.

The driver detects the mDSP target at runtime from the GPR domain_id
(GPR_DOMAIN_ID_MODEM) and enables the SCM assignment path automatically.
VMIDs are hardcoded in the driver (HLOS + MSS_MSA + LPASS) rather than
read from DT, following the consensus from v2 review discussion with
Krzysztof Kozlowski and Srinivas Kandagatla.

Tested on Qualcomm Shikra with mDSP audio playback and capture.

Prior versions:
v1 (VMID binding + driver + GPR domain):
  https://lore.kernel.org/all/20260609064038.492641-1-ajay.nandam@oss.qualcomm.com/
v1 (memory-region binding + DTS):
  https://lore.kernel.org/all/20260618113509.2025881-1-ajay.nandam@oss.qualcomm.com/
v2:
  https://lore.kernel.org/all/20260826-a2a-shikra-vmid-v5-v2-0-c3dc62354eee@oss.qualcomm.com/

Changes since v2:
- Drop qcom,vmids DT property entirely; VMIDs are static per SoC and
  hardcoded in the driver (HLOS, MSS_MSA, LPASS). This addresses
  Krzysztof's concern that qcom,vmids is "not a hardware property at
  all" and does not belong in DT. (Krzysztof Kozlowski)
- Drop oneOf / dependentRequired constraints from the binding since
  qcom,vmids no longer exists. memory-region is simply optional.
- Detect mDSP from GPR domain_id (GPR_DOMAIN_ID_MODEM) instead of
  keying off a DT property. No new compatible needed.
- Add QCOM_SCM_VMID_LPASS to the SCM destination list alongside
  HLOS and MSS_MSA — required for the mDSP firmware to access
  buffers.
- Switch reserved-memory path from snd_pcm_set_managed_buffer_all()
  to snd_pcm_set_fixed_buffer_all() so the carveout is not subject
  to the preallocate_dma module param. (Mark Brown)
- Use per-item descriptions for memory-region in the DT binding
  instead of free-form text. (Krzysztof Kozlowski)
- Drop reserved-memory node from the binding example.
  (Krzysztof Kozlowski)
- Register devm cleanup action before SCM assigns so probe-error
  paths do not leak HLOS memory access.
- Reorder series: g_apm fix (1/3), GPR domain (2/3), SCM assign
  (3/3) for cleaner bisection.

Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
Ajay Kumar Nandam (3):
      ASoC: qcom: q6apm: clear g_apm on driver removal
      ASoC: qcom: qdsp6: generalize GPR service domain
      ASoC: qcom: q6apm-dai: add SCM buffer assignment for mDSP platforms

 .../devicetree/bindings/sound/qcom,q6apm-dai.yaml  |  12 +-
 sound/soc/qcom/Kconfig                             |   1 +
 sound/soc/qcom/qdsp6/audioreach.c                  |  12 +-
 sound/soc/qcom/qdsp6/audioreach.h                  |  22 +-
 sound/soc/qcom/qdsp6/q6apm-dai.c                   | 260 +++++++++++++++++++--
 sound/soc/qcom/qdsp6/q6apm.c                       |   9 +-
 sound/soc/qcom/qdsp6/q6apm.h                       |   2 +-
 sound/soc/qcom/qdsp6/q6prm.c                       |   2 +
 8 files changed, 287 insertions(+), 33 deletions(-)
---
base-commit: 3d5670d672ae08b8c534b7beed6f57c8b44e7b43
change-id: 20260918-vmid-v3-cad97e0eb7bb

Best regards,
--  
Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>

