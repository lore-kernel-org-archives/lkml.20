Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E16C950B434
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 19:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790017714; cv=none; b=FQ9i5zHFjU5Tg2J1CUIlPm/bckI4Yk6bppgEcrcEgiHsEcZeGhqGysYwBwOZSg2IdaY7d1VWofAJYln/ARV0g+qPgmAlZhOeYiiN2ThWpNJUPcqJaJVOeAY9CDYuaYP5QYzdgGyNjrkXMUr7JJbBDIaE3PO7FV6JDvFdXR3PwhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790017714; c=relaxed/simple;
	bh=XyMBhO5GykpGS6YpSmVQotMSMGAfF7KY2nrIjsS3qsE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FiIfeRfXV5UoUT0PgbjiDpx+VuXU7bw0pD+xqxNugHUGxQ0JXHNbzxvCFWwweTO6EdvxS/4+MOccXErR31ORsePfEEBLIGSHh/7oLTyNDN1fbgUHN6NRIejdl7/3fngk26UkCcWeZdUEiK+btew5P5NhWJ6hn0FXQbSbohHu38Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HygOgbNt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kSFbIqdG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HygOgbNt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kSFbIqdG"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LHNWiW1314911
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 19:08:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ZSh9QBgbAwhCJwVhUoY0R4
	kQ19zhYK7eOx+CnTj5onU=; b=HygOgbNtmThwXTLSupN5RY1nN4ij1VJZPect4a
	cOONVf13jOvn/IP/F4g/AJEcIUSnEuZiRgK1HOoQNnQtzf78egTOt6GwvfDFzBl4
	ftlcWhZBzrPSEpn0HjG2/RvDDvMgGHss0QM+2D8BgxZe6dT5EETH6k9nrloZMAKY
	tSLJ0/zEw+OYzfktAm5Y3k9hypZZmyGwVh6y53Kk/MoK83benht/iCwO4PIZ+G/c
	5U0tQ2Na/UtkEfLPmrVQ3crjU+akGC13fteJxyS0UOOMdyWQnRl5hvNRok/BPZIK
	13yNT9m3MmRfzYELGkGGVRr3eq5rfyIo2F8Qc21p810ePB2g==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu8xerdhp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 19:08:31 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39e3f521346so3858961a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 12:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790017711; x=1790622511; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZSh9QBgbAwhCJwVhUoY0R4kQ19zhYK7eOx+CnTj5onU=;
        b=kSFbIqdGITeHnQJroC9Dax+MwO432az21vbBlcPjVQpU82mxSwIJApMserbJ3BXcuT
         iEBCUaLXiK3BOlKiHrXFzivyMTKOLsVPmFI+9VPtgeK8zCZaDqaZbgaJxF7gK3OHy9ET
         9tXC1S/KIa4u2nyspaKRE6zfV5iRLpzTNmP7AHFxNnAarUdBbJD2IZ0exGEVwHJV1I9O
         jNWWJiG2zMdFK0j/rbyG858qERyjBr2L8VjS2Ndx72aoJd5JpCOSdkKNoJxKc/U/07hd
         zK0sPb0CWTpABayzUoV0AQ3vQDEXywHgLz9amZ8esIVUJ0d6NTi/Nzxpf6wq8CK9CwUm
         Bn6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790017711; x=1790622511;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZSh9QBgbAwhCJwVhUoY0R4kQ19zhYK7eOx+CnTj5onU=;
        b=jrdp7aB2uMD+AhAg2Flybax5euISGWUzzFwl0dYIq7I7zFjRzagapRrzQAm4RTJMEG
         dkjS+zCA+L0OzGgPs8sWougKj6BZyGH2UGRzbTYW3nixD+w7lA4gLkFVxzCE691tNUib
         oiBQmhc6WXQOSYmOIHWhc/lOpQ7uyUV5YCSLMn1rzUMVg2W8W9gAVk/+0oMqJ6iZ0Bbg
         s4vDQMBQN++stymYaEDe14mX7u1J7YB1HNvqsbHKgcy2ROggdvPtVCKem7CM5iUA8aoZ
         uXdpoRR/o86/kPVxR+IYJESU5I2XM0kz/1utIEh45OZxE/q3RE+3BwUWmriNEi7UfvrY
         JzWw==
X-Forwarded-Encrypted: i=1; AKwUvBzxg96gXti6EjtOpDTZqk/RIkqUE03t2lJdqig/rizExJyiVak2Rj9Gl4YebNvAM7DQUlPVy6ykOw4bEu4=@vger.kernel.org
X-Gm-Message-State: AFuF++mv83dYqSYxtnOR3sYL0uNGUOmoRKePjS0fvqamhhBzI3HS+ztP
	G7C/nRhvjrB6QibG2dsyQfSXfkcC3oE+b3ng1uFWBEcVUUXEVyf8ANt+bq1YNj+0KjV1CBB7ki3
	j3UD3ZY6I5hmAzFGzoKLNVwXIDGSf8j0eQTuhxmAbDJbMgWQ9K+3OlQD9VQwjQSlKMuc=
X-Gm-Gg: AYBFou1dojuT1mDtPzUj157fIv+taNvi/W129olZMuKgWCfcqKEVpCVw6ebqEpqVMZ3
	IQj3lapC/2mvxpS+yQ9LRaTcbjIq+juepLngz/reIXUkk6TuBJMevCSTexb5EMaOS22K0oKJQdM
	xX3tuPjhzxw1oibKsk8vBxYtGJd012/pvRfcAHoc6+IIp5ZGfDMLWlvuJvUyrMZpt+5bMIL3O++
	HcIl0XfGjimTAeAx3BoX+pXj/UnfpQ4+LMy3Ye4jir3C0/FF49zB+A0CSurfLWmqBkJY+iQUao0
	lPJ3IfGg0ERh738gxbw9AzeCbf5cquXmElRRNf92KYHD397Ic7hrzDKdkfIayPucZtZi1dEWiKV
	+yt1PT1UL1HeczIIm6KpHljyW29vP
X-Received: by 2002:a17:90a:d88b:b0:39e:6c6a:2091 with SMTP id 98e67ed59e1d1-39e6c6a22d6mr11030888a91.50.1790017711229;
        Mon, 21 Sep 2026 12:08:31 -0700 (PDT)
X-Received: by 2002:a17:90a:d88b:b0:39e:6c6a:2091 with SMTP id 98e67ed59e1d1-39e6c6a22d6mr11030848a91.50.1790017710723;
        Mon, 21 Sep 2026 12:08:30 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e5ec6ea45sm25855eec.30.2026.09.21.12.08.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 12:08:30 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Subject: [PATCH v5 0/4] ASoC: qcom: enable audio on stage-2 protected DSPs
 (mDSP)
Date: Tue, 22 Sep 2026 00:38:08 +0530
Message-Id: <20260922-vmid-v4-v5-0-e79cfd7af5b3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAJiAsWoC/z2NQQ6CMBBFr0JmbQktFIMr72FYFBhkjFDtQKMh3
 N0Wo5tJXvL+mxUYHSHDKVnBoScmOwXQhwTawUxXFNQFBpWpMquUFH6kTvhCZFKW2KOu8mMDwX4
 47Om1ly71l3lpbtjOcR6NgXi27r2/8kX0flX1r8aw0D0q2ci81EaeLXP6XMy9teOYhgP1tm0f9
 eKr1LcAAAA=
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
X-Proofpoint-ORIG-GUID: Hcl1JjMJ7Jyy_cwTezCpO1kxpQtqQKS0
X-Authority-Analysis: v=2.4 cv=PZhqFShd c=1 sm=1 tr=0 ts=6ab180b0 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=UQ-8Zwp8MLxl06SJKC8A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: Hcl1JjMJ7Jyy_cwTezCpO1kxpQtqQKS0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDI3OSBTYWx0ZWRfX7nycnPXd1hF7
 N62MldPvz26qtWDN6BKhLqb7/F4h4NmhVcIPuz6rcD4Rdb2ZAVfWpslZRkIGVEj1bOuiysxuO4h
 PLULlY7ZDsCGTcRmh8B32FEpcsgD9MkPDNzAgT2cmstkYxPnCWCXhU9EnoNW/+WaZ9KRNc9STHi
 g6Xm6ZNQYL2Fap4k98ml+9H5TTk9Af6vGfc9+0P/hItqoqKCjgs05nwEJ+hyDALgLvU2QjHBeL2
 ZBBNOqpo2IWR0dBi9cdYd279M/4Z117b/02QtkFPf6IdAzNwEtyrJ2LVztTxME235gKpSsVW6Ap
 Idu+s4Gm6ez563RflVxDBpXkYraHvdH8yFwEcF8S2wwszqHebhYHTtG6C+FmAeBiF540iMj3ebL
 EPgj7wJIiNRtMRcb/Kvupm7aiVex2CVckfDjNGclV+NL7kKM6anxZ8NZBipcarV9Q7NhqzlP4qy
 8vZP2hT/V9XHd6h5ObA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDI3OSBTYWx0ZWRfX51lXBVBcsDKr
 /Vw1QMHMfjZ2SAiaJPLyMYImHNx9/65DtR+9rH6r/SbJGkn0WsddtRS6pzfl1U8ltyKhhMuh7Kj
 GM3DD+kHhDQPYedMmPIy2U77YebEFMg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 bulkscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210279

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

