Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A6044FE2DC
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 18:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790016853; cv=none; b=u1v+Xvrhd2CY+ttm+lXABn0xK7OL/oYfVxbkQK6HNnWvFwYh1SzEZG9Qg8L3IgGLXhOBnJpe2w6giL4eqOeSZCxupmK4R/f1lw3GAsxJheb/1o4vVc/3W5mY99iQVqLLCXfHAruW+lHlhvzFY0O0909QCGV/F7ugLZAGbZGl2E4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790016853; c=relaxed/simple;
	bh=5o5UNTY7zEzm94QNwEmbqpbAb91KjAVG8SgcTjpHmLM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=deFcAbIIeagGnva0o6wWXN6L6cB0xZLe1BINagN2UPPVZpJxU0IonDlv+8QYB8xjgZGsh6eKU+MmY3vEM7xzxCqxsmiBq5/kGD5Vy5dJn68Uze3AVDcWE9Oj1smWINZHLP7xJnVmWFj0U684V1LSeDtaHkq5DukOlbuNZqEgq0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jxzrul50; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YV4/9cH6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jxzrul50";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YV4/9cH6"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LFAD8N2163204
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 18:54:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Bf9C+WTaUsYDMjXmt+FfJB
	dR5MeyHfcJ5OkpHjPkaa4=; b=Jxzrul50H2IqhwvcDXo0D4rmfCHiYWZD6u+9Dx
	TjvpZZMTNdXI1RX1rjsftAhdL+H731Op3sK2buqGVwFDOODh4vCjtQ3D+/mrTFoA
	zbSX6eik4O7peUC9sz8vwfEuqnLrvHu1FwWegmVDT8dyqbiIyT7GP0L8Zo1JFDi+
	/+xb3qWrNvOACgH53rZbQTnwaF9/T8i6mgDPGoUhk4XresKRGoTYcue0MWjqw+BW
	B/BBbeOIinuOQnNz6u5B6bXAqTs1UGDB5d19BssUXJXwvUkIa6yEq1PsLoIgNrgV
	YQbiS2JHZ0/VCRQQPyHrWBnpEMAMNOU2Ckslvk23WnIZ7K+g==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtysw2vsy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 18:54:10 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc1a439db36so3001968a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 11:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790016849; x=1790621649; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Bf9C+WTaUsYDMjXmt+FfJBdR5MeyHfcJ5OkpHjPkaa4=;
        b=YV4/9cH62a8end8PP+LTo/3hCyZcf2Yga8vPYl3zaH07LKkfZvcxUQ55G5U8UTAzjS
         BUUB3ILC1WneyB2tjBbNQI1EEL4/elgJPLk9Cscb0jUEtnRcbW6/kbasIKWE/Id/s9gP
         qa3k8NEgAwiABx2+7aQ9Qpb1W3dhE2AMKeEB1caaAJbc1uSYZYbkM+lbGb+amAcWxfBJ
         VzSwEz0peXXpU1scyyXt459CUEU6Zxir2/mqRyrgZ0zsM4xQlClVhTIQi9cyP+2yPJVQ
         iBtKvQg3LlTX6uKVG+by89TZd9VdUnC2X1tTK997VOmQAAfi9Cw9I77OtOx8c4qvS2Qj
         zQ+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790016849; x=1790621649;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Bf9C+WTaUsYDMjXmt+FfJBdR5MeyHfcJ5OkpHjPkaa4=;
        b=pUkspA58yGNzcA0Sl5Xy5DWSgI4S2nSTMif6zspWR8B10Kjct/Z4yt6DL/9k7BQ0Mo
         SP9BMkg1BVGb+jFem6LrYnjqyFxlHmtOfKOL0JzbaWPvXnkMXU9bJWPwiFKkr5ZFyXDT
         zAwECk2tEhKV3rE494r/t1tBNwh5OYOmckgARYeMqHyJ3nhER3ClZnp6oRTc1751Q03j
         YQYqyHmFmadg5cJAgaGpTnDGCThr8zwySJkCITLm9j4tQVJP4cbqB+H29oP2WyJbrBhr
         +uML4RULdnnRahQeQ6CKlYaGBlhWeoqh8SSjRmVddVoWGP53qSpn1A61sLjXcnonkovN
         8RHw==
X-Forwarded-Encrypted: i=1; AKwUvBwlbYC8m+sc2a+598ta9ggt2ETxvghZDQc6SVoznGyIXeIe0p1k7LvO41IjInKwUk1XQFp2bDJDJmVOnrI=@vger.kernel.org
X-Gm-Message-State: AFuF++mmT6nA5u6WW7YKLm4+dLcFT5znxAgL7Nr8aN480KVpHIGsoyeo
	30Do9M+fFGIyKOJJlFcBdseMi5oLowD5bGXBBZP+01UFk1U3XkehyUsNtrlI8exdqKFiiVJ5Oro
	g0xF4Em50n3To02+29hZBiI9A6huZJ1RACGNuKlTQyr5GE3pj6eW9flcoxfqAokA3/YQ=
X-Gm-Gg: AYBFou35+xLD+k1xPMnGIIq9ilJRBuvndc/elfQhBNdraZNvDd5Xzy5i86Q6X8ZkE9K
	vPV3K35jP0zQZqptbGgkR2Xf+PBguUh7pZjDCnQuw/fvFou/hSmPN5UyE+vIy3w1xIS5L682Itv
	iapqvuFgPS2HNS1ARj5OIt54lqLzWGjpxvmtgOc6Kmh5ERJ6AV/st7tnFLa1ctgwffAhyWnXeZw
	ZuI1OCOmG/EL8ieAfAv6h8Abv9y2i8Buoii2HrPD6Baphl+YFqk/IB9Yizjc+jGPMJ1Y/PpPw0n
	hhrU0O5W9VO611AYqxuU8ey+L9GErx3LWkaFEwWaeqrsoJ/UzVYpiy2/WdXsebP9kQc7Cpcv68R
	LIXwn3Ak3mwHix958lO2SVBK+SRY=
X-Received: by 2002:a05:6a20:c885:b0:3dd:a197:735c with SMTP id adf61e73a8af0-3dda197756amr15206660637.53.1790016849230;
        Mon, 21 Sep 2026 11:54:09 -0700 (PDT)
X-Received: by 2002:a05:6a20:c885:b0:3dd:a197:735c with SMTP id adf61e73a8af0-3dda197756amr15206618637.53.1790016848689;
        Mon, 21 Sep 2026 11:54:08 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c331433besm33696755eec.16.2026.09.21.11.54.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 11:54:08 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Subject: [PATCH v4 0/4] ASoC: qcom: enable audio on stage-2 protected DSPs
 (mDSP)
Date: Tue, 22 Sep 2026 00:23:44 +0530
Message-Id: <20260922-vmid-v4-v4-0-5fe21b1365a1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIADh9sWoC/yXM0QpAMBTG8VfRubbahmleRS6wg6OMNpaSdzdc/
 ur/fRd4dIQequQCh4E8rTYiTxPop9aOyMhEg+RScS0FCwsZFnLGhVA4YKGzsoNYbw4HOr+nuvn
 tj27Gfn/ncN8P1AlQbWsAAAA=
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDI3NiBTYWx0ZWRfXxL1XkztAArB3
 WIkTlYdQmaFC9HwCRl1N9ngz9OmQm6cmKRsjngURI3VK3wBhNOxGMEv5aybCG9Qyg9waQzd4TKd
 HUZcLwrq+yXKJZIJdQpQ43VP/34LIa5kIsKv/soH6kqkmcU2ZZRERlsTX89Aqi8FVMzQvqP2C5/
 G5aJV2bH9K3LiiJ9t86bJUthuyDt2YEIdgrjho/00tpnhBBhWZy+XDdPm1+eUiQhkf7pXCMmG5C
 19Z2Uza3P8LUup/I7CChr1V8fi0H/KF+v2cju7cR7pHu5AmYF2AW/wrz3DEIyNnF0ZK0Arzk+vx
 H9fxT+Q/2Nnmum/cTnwR92OjIcmjmFLmc6QDObXSbQIYactUlO0NFnPTW+zh3y/XMWQfBrnoXH6
 Tw5RRcvSkyH2CeVXuQCXO7uDd0N3Q7hiI9adFSnJGFJ6dwxI/RmJH2gj60NHINjpxaQWeBBHUtF
 /y9Hy7Sfb2wQvaQ/DvQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDI3NiBTYWx0ZWRfX/dl9xVfbJTjd
 RjqFoLAVJ3SAEW6uaRPqOZoCV8JpQOT+Wmk2eUTbBMpzHGmwjWOjyPhHcEndrbZtO7/r1HNdJsv
 hli++yDptGiIhrNKDNk28c5HWY37Qgc=
X-Proofpoint-ORIG-GUID: W3Qb_ZQ-43nLQIDbT65zrVDcD_eXlRgf
X-Proofpoint-GUID: W3Qb_ZQ-43nLQIDbT65zrVDcD_eXlRgf
X-Authority-Analysis: v=2.4 cv=W7etxhWk c=1 sm=1 tr=0 ts=6ab17d52 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=6btbCJ6Vd1rm9VOZOAMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210276

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
- Reorder series: g_apm fix (1/4), GPR domain (2/4), DT binding
  (3/4), SCM assign (4/4) for cleaner bisection.

Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
Ajay Kumar Nandam (4):
      ASoC: qcom: q6apm: clear g_apm on driver removal
      ASoC: qcom: qdsp6: generalize GPR service domain
      dt-bindings: sound: qcom,q6apm-dai: add memory-region and relax iommus
      ASoC: qcom: q6apm-dai: add SCM buffer assignment for mDSP platforms

 .../devicetree/bindings/sound/qcom,q6apm-dai.yaml  |  12 +-
 sound/soc/qcom/Kconfig                             |   1 +
 sound/soc/qcom/qdsp6/audioreach.c                  |  12 +-
 sound/soc/qcom/qdsp6/audioreach.h                  |  22 +-
 sound/soc/qcom/qdsp6/q6apm-dai.c                   | 300 +++++++++++++++++++--
 sound/soc/qcom/qdsp6/q6apm.c                       |   9 +-
 sound/soc/qcom/qdsp6/q6apm.h                       |   2 +-
 sound/soc/qcom/qdsp6/q6prm.c                       |   2 +
 8 files changed, 326 insertions(+), 34 deletions(-)
---
base-commit: 3d5670d672ae08b8c534b7beed6f57c8b44e7b43
change-id: 20260921-vmid-v4-0116efe5937b

Best regards,
--  
Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>

