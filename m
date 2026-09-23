Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD7E538C415
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 16:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790181247; cv=none; b=Cpj76YPNBvOZ/L37JO+bvo6/oXk5PBulMX6pKl60nhbSBMbuxV1WXyvsHwee9OteaCXiCuS0dvGqa6C060oBTUSsF2l3ObMQOlTZELV7sF6ZXKZIKOpqAWANcoYmHFbZhQtlz+M6i1HXJrCmBKXzLbS29D82bRuM3OkGclkvf9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790181247; c=relaxed/simple;
	bh=8NXFg4lhLc9MqUFD43/mm4w5EJ5ZgT1arvtN8w6lbHM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=LC8XbzdSo4zoSyqYoTHxNfKm1E3/hDOaYdyxLFrpAUfd91KrVlFg8z2BNV0Ns25Qn4iwRrQzOR7t+PMFU01gb4sjw3jqlw69EEa2HJyvq6BW+cnajGn7BlYTX1uneeaCbftpS+h58z+CEvstsIUbnZaFhs/cWQxN4wqPNy/73qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VISPA5fg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aNwse2ji; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VISPA5fg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aNwse2ji"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NGU2v9064335
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 16:33:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=7dEO+IYZX11dChXpeR1+hW
	b76TfvRYFBhRd4Xf3bVpc=; b=VISPA5fgEQ7BcTPnwlQ9RtKlPewDtBM4xSTPpL
	j+WmNn5OP0655qTo8iarcikSEBZ5+1dHgrVRrVHYYbD9/bXaq5FCkDdXX1q7fGia
	d178U2uymvLqz2SFFi4LYJPh4WJqC+vbKAmAKCXhgWQjQ9M9DBwzy2iaQccUbD+o
	hrlL9dMvpCt6iXuehhigbmPFNa8TTyGYxiG/ZthDdovjpMC3bbVz1ialUf5LHZ1+
	iwxwdCZyyiauYB9kTORRgVGwUbmpWMWxG2ADNZq/OpK8EkoKlBGIE/XQQqETHwpW
	gKzeOpWWxaofr7wwDCiLhItF95ta1lPXNmAaH4uvrQSCtCRw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvfkbguxt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 16:33:58 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2dd667770efso269495ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 09:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790181237; x=1790786037; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7dEO+IYZX11dChXpeR1+hWb76TfvRYFBhRd4Xf3bVpc=;
        b=aNwse2jiv0S7oQb2E+mBnCegdZWFfeZYiDJQAAxWSzSdF7AQqUfhXLqKmvxJ3Z13Kz
         2YGDr/89ZvCmZyxextGXUi3jpKFGYMLRq/6UkcfUEHRjrzUcQ9Y1I2iEuSq2UvGjkaNG
         71WEGJOLGcuj2PfZbCFseIJc2bkvpDKBX4jB9ElE/xEpC6N+JRBK/RhJhCLHsw3z1bUw
         KtySc3s82Oi8Wrgp6XbsCkDyaJeIxfII6BxikGUm5iqMu9j+4Q9wt3azK23j4Iog/+vW
         vSaZYR50/5toE3tis7bMA1yardIiVMEkhiua/TKq0sOH0E5RGnEvHvGryrR5syMnJ6Jk
         xtjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790181237; x=1790786037;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7dEO+IYZX11dChXpeR1+hWb76TfvRYFBhRd4Xf3bVpc=;
        b=0fvqp39uYqr5iZ14Na/HAr63sm8XAfvSQoGPTp/TvBjfrzaluQAvZRvEmjxfyBQNoR
         1qIn/1cdDyzmb6lSB+oID5yXVm/LuYjobVyQdPGYU/jWufyJC74utlJdi2H5iWxfpWT/
         8kF1htwXRj4MEW3jAGqI+Ib21hqfiuVxfyTkal3PMoqJ45eoWQFmzjc37ls1CzHOW41B
         LvXhdYNnlaQPspQ70C0jztgE0LlHvZIdPk8btpzB58LuQd/0OCY5Na1VweMm+T3yTwCu
         yCqFM/cBlzeJsea1u6GM8+nCtTgXjoPMx+SIanIIiHzeEN0Ny4h42ikotf6yWqGe36Ux
         hW4A==
X-Forwarded-Encrypted: i=1; AKwUvBzxgE1sV/jhf7xlTOpyoTewO7SBImTIu+pyTCR+IIBXUXarUM10KuxRWNzwVDuoQriuVnn/AUc3pHGF1A8=@vger.kernel.org
X-Gm-Message-State: AFuF++lufi/Km1zR29op+ku+N2j+E3shy5phwSGaPccmlq3AB4APXf/J
	yGbTVRofavznIx07eGqoX16GZTFcd46h/X+cF9hQmCqcIvwyMfDNvj3K2tW6g2Agecdt3uEV/ln
	FkxNH/8LdXklk+GmXg7Y1RyxzxNZVn6DOXT8U1YSi03u4tj9IYyYAykdVvgLRDUj/zfs=
X-Gm-Gg: AYBFou27vTI32R3ifL/UmwFSMgZSmh/ljYEhjKyPn6LpxWbcSIA8W4cOYDGbpAZSvV6
	Y5cvVppPzSbFDG9J9dpuxcuzr74lmgoGpDxx3H+2hIa1WBFKB3BWd7oM/9X/J61Bs2uyjdysOQY
	4gf15czPZhEV3/fHgEyJ4FY9W6f7MusooFrJtyRqsfyP73vLkUWecVy1SBbvbAx0gqUBckGZkLS
	aIJ2ZKcpMe6FIPbDFT8Y+DK2xgo748ChXovcpOzj3qYIvylN404ifYpWg+xC+EYBKQ11XSjwajP
	g+X/txTXNSTxPhtVyEXZ3ZzB2OGxILaHsE+c/DET3OGR5jOE+eTjdEStLHQaAHLd4xc7hz22be/
	Bpr/Ih/x+OP1i+z8JhN9pWQvyq/g=
X-Received: by 2002:a17:903:3c45:b0:2dd:c100:251b with SMTP id d9443c01a7336-2df69a020fdmr20611805ad.36.1790181237143;
        Wed, 23 Sep 2026 09:33:57 -0700 (PDT)
X-Received: by 2002:a17:903:3c45:b0:2dd:c100:251b with SMTP id d9443c01a7336-2df69a020fdmr20611565ad.36.1790181236618;
        Wed, 23 Sep 2026 09:33:56 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a5a6d35sm13994895ad.19.2026.09.23.09.33.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 09:33:56 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Subject: [PATCH v6 0/4] ASoC: qcom: enable audio on stage-2 protected DSPs
 (mDSP)
Date: Wed, 23 Sep 2026 22:03:37 +0530
Message-Id: <20260923-vmid-v4-v6-0-3d61a0319b1c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAGH/s2oC/3WNwQ7CIBAFf6XhLE2BQlNP/ofxAHSxGFsUWqJp+
 u9CjZ70sskkb2YXFMBbCGhfLMhDtMG6MYHYFUj3cjwDtl1iRCsqqpYSHAfb4VjjihABBnjLGoX
 S+ubB2MdWOp7eHGZ1AT1lPS96Gybnn9urWOfdp0q/1RzG3AAlijDBJTm4EMr7LK/aDUOZDsrxy
 P/oPOnQtNp0jTRcsR/6uq4vdLdyrfYAAAA=
X-Change-ID: 20260921-vmid-v4-0116efe5937b
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: ajay.nandam@oss.qualcomm.com, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Pratyush Meduri <mpratyus@qti.qualcomm.com>,
        Mohit Sharma <mohit.sharma@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA2NSBTYWx0ZWRfX3MlG62bvf0ZS
 YHX/1K8C/uq1Io7Uvzd2KBqM7CjJDvzJwDSDWeCP9QuZQy32UrjsxpxJdd3NDK5nXBMYILzE3y4
 +rY4KhixbnXQGQItpxeozvFVC5FZBj8=
X-Proofpoint-GUID: nK1CUE5srEv3ouSL98eU_bVK09iSAIEP
X-Authority-Analysis: v=2.4 cv=RYMFmFtv c=1 sm=1 tr=0 ts=6ab3ff76 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=4htxZGP5hJsAbUMztmwA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA2NSBTYWx0ZWRfX7XXkqatWFhQK
 lyCqfvznl9QxxHwbb2UhyJgWwqTvWKe5PtQzT/6a53ACqnRXG4EfzoCRVQLawXWLn/90RCltaE6
 cz/Vjr+iYMryNHPpEX4r9cJYruHxmSj8D4S+yfeBVKOUG0iW3DEorTYRb/+lVvKi7db7l3dytV0
 hnzeWUXlyCt2A4Ow+sTxKZSqFkB17nvX/t6/LF2GmqfVk035Z5Z57y2Srh0NBNn3kKGVrVDiKq1
 e1EgO2DYB2miUH6qzcsJ7287lQhyyed6dWcPJ1eruv3D3/bF165i8HeytXA+v2VChdafhkhyk5R
 E7ZA4qq7yvrb8sf1BJOXIX2TcHAiaHkRclXg4LwYByPh+t23wehr/+DNKdIIf1K53E+jduxKxmB
 +YvcSZjMyfqAr/2+nnqGkL1hF1WKxcW/FU4db5BPf60cYl6ZUoKgmZvNWZZaLHux1ODlHtMeg75
 WjhuJmsVv2ls0489gbg==
X-Proofpoint-ORIG-GUID: nK1CUE5srEv3ouSL98eU_bVK09iSAIEP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_06,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230065

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
v3:
  https://lore.kernel.org/all/20260918-vmid-v3-v3-0-f1cbf47bf173@oss.qualcomm.com/
v4:
  https://lore.kernel.org/all/20260922-vmid-v4-v4-0-5fe21b1365a1@oss.qualcomm.com/

Changes since v4:
- Resend — v4 was partially delivered due to SMTP failure, no code
  changes.

Changes since v3:
- Split DT binding changes into a separate patch (3/4) from the driver
  implementation (4/4). (Rob Herring)
- SCM-assign the data-path pool (memory-region[1]) as a single whole-pool
  operation at probe instead of per-stream in pcm_new()/compr_open().
- SCM-assign compressed audio stream buffers in compr_open() and
  unassign in compr_free() when no data-path pool is present. v3 only
  covered PCM streams.
- Fix error path in pcm_new: unassign SCM region if memory_map fails
  after a successful SCM assign, preventing a resource leak.
- Account for PAGE_SIZE padding in reserved-memory pool budget
  calculation. v3 under-reserved by PAGE_SIZE per stream, which could
  overflow the pool at maximum concurrent stream count.

Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
Changes in v6:
- Drop redundant maxItems from the qcom,q6apm-dai memory-region schema. (Rob Herring)
- Require q6apm-dai nodes to provide either iommus or memory-region. (Krzysztof Kozlowski)
- Serialize SCM region tracking with a mutex. (Mark Brown)
- Use %pa for the reserved-memory pool size diagnostic. (Mark Brown)
- Use the ASoC dt-bindings subject prefix for patch 3. (Mark Brown)
- Rebase onto v7.3-rc1.
- Validate v6 on Qualcomm Shikra with mDSP audio playback and capture.
- Link to v5: https://patch.msgid.link/20260922-vmid-v4-v5-0-e79cfd7af5b3@oss.qualcomm.com

---
Ajay Kumar Nandam (4):
      ASoC: qcom: q6apm: clear g_apm on driver removal
      ASoC: qcom: qdsp6: generalize GPR service domain
      ASoC: dt-bindings: qcom,q6apm-dai: add memory-region and relax iommus
      ASoC: qcom: q6apm-dai: add SCM buffer assignment for mDSP platforms

 .../devicetree/bindings/sound/qcom,q6apm-dai.yaml  |  17 +-
 sound/soc/qcom/Kconfig                             |   1 +
 sound/soc/qcom/qdsp6/audioreach.c                  |  12 +-
 sound/soc/qcom/qdsp6/audioreach.h                  |  22 +-
 sound/soc/qcom/qdsp6/q6apm-dai.c                   | 317 +++++++++++++++++++--
 sound/soc/qcom/qdsp6/q6apm.c                       |   9 +-
 sound/soc/qcom/qdsp6/q6apm.h                       |   2 +-
 sound/soc/qcom/qdsp6/q6prm.c                       |   2 +
 8 files changed, 348 insertions(+), 34 deletions(-)
---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260921-vmid-v4-0116efe5937b

Best regards,
--  
Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>

