Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792615955;
	b=IzyXvl4VixX+ngdVCsntlDFmcWLrSlHjjGlYtGvo7E3Yur6k73jyJIek1Vdt1Eh03s5g
	 ebyWeEDj5jg5cAf5aaW8wj/cLvMZJpNnTj0miyB1nxgtT+56mZ3RmlgimAqKjUl7xX9RT
	 Gqee99qqEjKSR80g+srYfl2DVZqBmCA2Ql1ahgGOvIjw22RZN/MBfJLo2bDwKM2QsXG0n
	 yKxoR8IDUa20/kVcMdFw09sNRYqqKpG3oT9gp5g4Nz1yT0nxF4pi1CQ7us/PItD6fIu+T
	 /EPCxfIcFgMLkRjl1d0ZYHcuar4ZWrT+083bVyDHO0/4VJXZoGlc05wLkFE3aqXSMWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792615955;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=DvWm9Nv7PxkmSAxRTYuuUpcfA5dz0Ks8L+zcIVXOSyI=;
	b=ANwH4JYgQVDUNzFWvcO9YukIdfrpwDuQnXxqsGXKCMdc0qfVDCP4I1sV7I/E+EwSarPS
	 AtFyt1cKqgna1UwSVfN0NvO3asxFM2p7vhGaWiE8mCvgY6N4nSLdS8JNo4TuwTGezJV0d
	 Zp63LPyLzEkDldTk2OFA1A6fvZaiy0iTPNNofZUcll5uZ/3zqGWTKqdvI/ZEX5kYD5jqa
	 FYiRB2RGxis7NYUTSJ+FTrIiqKk661kmRdhJg+CbP+Pk1d1PeWLmb8vNKCjWASpSX8r/n
	 NltNSWoYcSAp5jTbFNfN2SQLBTK9j04D3TQ4EZcSlLplB1P75pVW9KRHvrOr4TFOyww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VeCPMOgh;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="aj/qXn4/";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43D62606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 20:52:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43D62606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VeCPMOgh;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aj/qXn4/
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LKejlk1155329
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 20:52:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=DvWm9Nv7PxkmSAxRTYuuUpcfA5dz0Ks8L+z
	cIVXOSyI=; b=VeCPMOghPhJQ8i4U7k+LoChfc40+Ghio5YzQUJ6oDUSZBFdrgp3
	hREUOvLZeYTVzniOYEUqCvzros6bPxrv3Ixca8umIEtEAC56AKDBhSJHMYtr756G
	BGw6+19rjIl4srj8Oj9pvBcah3nCuJCdxgF6X1MVewqCG8pQ0+Fx+5kIEN6wx2wt
	kg5me+iKPAi5Wmh7mkctQej8vw4/dN0+lADwaRvvsW9uVKGrRQG6xSRsSZBqQdz7
	WzHFCiBEJafa+Tm/HxLQyR+tHih2hog0kcTNAoIgNfEswRxSRW7lQt6KQcrXl/Qt
	k+cCOymJCo27Nf+BoB1jOx+T46IyLaTT0vA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf0cv15t9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 20:52:34 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ad840053c7so1094194a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 13:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792615953; x=1793220753; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DvWm9Nv7PxkmSAxRTYuuUpcfA5dz0Ks8L+zcIVXOSyI=;
        b=aj/qXn4/P+mMu8bE0jtw65MnT3T0XLwQ+6ipCJ7g32xZdN6DrrlBRVAisOPWhaJ+Er
         C2IE1L/G0kMJqolcxiBzGPpk8qlEoU4Ndo6BDtpf8XtdodShTcrojv8zaySfj3J9WirJ
         Qw8D+P9tsuAUGIf0nft76kSrAWsAnNyRY0yGxx7LmFA71dy8aZ6ezk/5GFtwjEB2Elig
         o30p5d0bG6f10RsrKoEuCzqd5w1alv3ID/PeVVmpIkjHSB5H1Zzi1s1Ibyov3cW3KCtk
         wSGBwwmfE4yuxAA8eiLt/YEU8YIpauwlZGH0RwsZtP/H8CHIFaEBtluhYIxYNOnENlTy
         FevA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792615953; x=1793220753;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DvWm9Nv7PxkmSAxRTYuuUpcfA5dz0Ks8L+zcIVXOSyI=;
        b=kbR5ohHLn5QMva7qA/ZkId/HUTG0rwoXf4sOhHdlQsd4LXEmXNHTDS6g0aBPhVfag9
         5xlZGyyQL9AOaPrh2B0vECNdXV3XO/7Eg4ug/PDcBZ76KhC1pm970DSdG6UC1rbOWV1b
         amY6zJO6PdKRKaqkpckCtdSz8kIpGOM3sU9sUGrMaK5mIbT2hmbjwuhKBHi1GnQW3dYz
         +vop7mV9rSxb//t/2CWgUS59km9OADSx3165kY1FCZTKpnSZ5P+xZvULBDNFYHNmKqSz
         LoW8qOL/zSkZqOzBCNsG5EhpaqXFhWv1keBGxtz3cKX6ObASiO+TnAiesGLf2YUIPgg+
         XQYQ==
X-Forwarded-Encrypted: i=1; AKwUvByw8HE0XdHX0xBDM2FQHyv/0W0JL+gfZBvvFsV2vFPfPQpNfAvqGM1EAOBtBLIZzR2CNZG2S6VIl74Zlbs=@vger.kernel.org
X-Gm-Message-State: AFq9FYLyWD97rw+/jYfVXsnC2Rw9aytdDTEAyGj7G5H6OBO/Z0JBHvD2
	/LcSoB9Do5RrmqIzWSs1bHUsu34VdPCkppm6vKm8pRIF0G+3N3LjMspIiRrfYF9ZEhMRZhLCAFf
	z+YT/RIVoUUrxUZZqDun4aSR8lYra1etXleLbeaxzyz0dV4veIsb3L42aJwJ3FR8mG6o=
X-Gm-Gg: AYBFou06hqYvLGmYuUZ0kt9AFrh1oPjvWEQM+7nNMEjwhKcvE2oIXbu9kwfohF2ACHf
	IWNVzsNGN0WGeCfn3u3w2JdYCl3rN5ACKY0GptTPFcIbvhLpPQB/P2/kkhHwyFFqL7q35g6DaMA
	VnSoVO6FoSNB2+ibjL9ONBmj1mDjmxTKTuHpJRloqeY7Sg6BpHU5ms36jZ8DYk9NpxgVsrjzRR6
	TjdoWVMCzPXNCYlDOHdGe3wMY8O6tTtovor/t87gl22DHNiNIlshaphBBs7yhc0E/83xL6RNg9i
	kmWsd6UkGVeDssPvnbfO+WzX6BwmridWm8Wk+hAFGP8omCNj5v6cEy0u2ZRyggXAIf4rdC8hdxt
	gHJtxxQvxe57v88IYgiZmz2sGQ9Ah/sqlP7juGKEemciC2cCu
X-Received: by 2002:a17:90a:e7c8:b0:3a4:b0a1:c7ed with SMTP id 98e67ed59e1d1-3ad86e97f59mr2458352a91.13.1792615953333;
        Wed, 21 Oct 2026 13:52:33 -0700 (PDT)
X-Received: by 2002:a17:90a:e7c8:b0:3a4:b0a1:c7ed with SMTP id 98e67ed59e1d1-3ad86e97f59mr2458334a91.13.1792615952851;
        Wed, 21 Oct 2026 13:52:32 -0700 (PDT)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada48a55d5sm981845a91.9.2026.10.21.13.52.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 13:52:32 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Alexander Koskovich <akoskovich@pm.me>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        David Airlie <airlied@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        linux-kernel@vger.kernel.org (open list),
        Marijn Suijten <marijn.suijten@somainline.org>,
        Sean Paul <sean@poorly.run>, Simona Vetter <simona@ffwll.ch>
Subject: [PATCH v2 00/14] drm/msm/a8xx: GPU state capture support
Date: Wed, 21 Oct 2026 13:41:25 -0700
Message-ID: <20261021204244.67160-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=NrRE4MdJ c=1 sm=1 tr=0 ts=6ad92612 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=e5mUnYsNAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=5uKouOo8jYOmxnCoqBwA:9
 a=rl5im9kqc5Lf4LNbBjHf:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: mmc1DHWIBJ8f8ysVGDUymptLpqN0Dlm0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA4MyBTYWx0ZWRfX+N7fTGGEtlUq
 d4FdX4qY1y8KSA51bXiQwL9WA6Q5IuBqGB+yoxYhW7cZ9wy6GVE9bkdvP03+yTkPUbJPeQaaxof
 q1rJGX8ubR6D5B9NrOd+S+fUcAvYiNI=
X-Proofpoint-GUID: mmc1DHWIBJ8f8ysVGDUymptLpqN0Dlm0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA4MyBTYWx0ZWRfXyi/Cn4WoOxS3
 7mbi7/k9DriCGxNk46tjnZHydTnjvxxcAacLHz5C/H9GSLJmluA7+IPy1EDA/BM6NroIsv0vsdp
 4gZHDhRYF0p/lVbuhJa7tjwuDkFvBYx34ihZGyxRLpu3N+EzXNihKNpNk0tDp99bKpZAvE7outp
 ImqAXXinHinm/Hmm5wQxt1pI8VdW+ULKJomIPFdzmYLluYi27+CLLeE/W0lA+cYtWMEkFdnjWlu
 KB091xsqCZCbJxBhm4iQGScQzsn+zd3e5ojzrGw4brR+491xsB/BZxQcIVYdllyO/CuZhuIcsi/
 BsnE3iD9W1rSppJphoyW3X0+Gty1x80QnoviAxQAuT7bgN0nrc1ybiJBEDFviUfqU+qNrDg76gO
 uxqaCSA6VQu9xceWwqS5q7RIjuT6CP5ac6oKU3Gi4YLE+53wG0HuQqZii3Wl8HHh8F1TFps+5bA
 dVbrXk6j9BeFysi3Raw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210083

This series introduces gen8 devcoredump support.  Compared to previous
gens, it:

1. Switches to generated tables.  Compared to hand modifying headers from
   kgsl (which were originally generated, then adjusted a bit by hand before
   adding to kgsl tree.  And then copied to drm/msm and lightly modified
   some more in the process).

   In the process, we also switch to generated nonctx reg tables and
   cp_protect tables.

2. Aligns to the "snapshot" format that kgsl/etc use for hw state capture.
   The non-generation specific bits (SMMU fault info, capturing relevant
   BOs, etc) still works as before.  Everything gen8 specific gets encoded
   as "snapshot" sections, ascii85 encoded in the resulting devcoredump
   file (similar to captured BOs).

3. Try to make it easier to at least compare kgsl snapshot code with
   upstream, for porting fixes/etc.  State capture is tedious and mind-
   numbing, and the last thing you want to do when debugging a GPU hang
   is going down the rabbit hole of having to first debug gpu state
   capture.

   However, I don't love kgsl_snapshot_add_section().  It does avoid
   duplicating snapshot header stuff everywhere.  But the ergonomics
   are not great.  So instead I went with "align with what I wish kgsl
   looked like..

The mesa/crashdec side of this is at:

   https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/45304

I'd appreciate tested-by's on Hawi, Maili, Milos, and Pakala, since I
don't have these devices at-hand to test myself.  In particular, do
things look fine after the switch to generated nonctx regs.  To test
devcoredump, you can use the msm_recovery test in igt.. or just:

  cat /sys/kernel/debug/dri/*/gpu > /dev/null


NOTE: Uses $codename for generated file/table names, rather than continue
      to perpetuate the equally meaningless gen8_x_y naming from kgsl into 
      upstream.  At least the codenames are familiar upstream and this
      removes an extra level of name translation.

v2:
- Fix incorrect protect list for Kaanapali
- Use __free() for snapshot_sect finalization
- Fix missing early return error path in gen8_snapshot_mempool()
- Fix aperture setting in gen8_legacy_snapshot_mvc()
- Fix first_slice in gen8_snapshot_mempool()
- Remove GBIF regs in generated nonctx list
- Link to v1: https://lore.kernel.org/all/20261020204728.28844-1-robin.clark@oss.qualcomm.com/

Rob Clark (14):
  drm/msm: Import adreno_snapshot.h
  drm/msm/a8xx: Export aperture helpers
  drm/msm/a8xx: Add a8xx_aperture_acquire_raw()
  drm/msm/a8xx: Export slice helper
  drm/msm/a8xx: Add missing a850 ifpc reglist entries
  drm/msm/a8xx: Allow nonctx reglist to include GMU regs
  drm/msm/a8xx: Stop getting GMEM_PROTECT from nonctx list
  drm/msm/adreno: Fix PROTECT span length
  drm/msm/adreno: add temporary __maybe_unused
  drm/msm/a8xx: Import generated headers
  drm/msm/a8xx: devcoredump state capture support
  drm/msm/a8xx: Switch to generated nonctx regs
  drm/msm/a8xx: Switch to generated protect regs
  drm/msm/adreno: Remove temporary __maybe_unused

 drivers/gpu/drm/msm/Makefile                  |    4 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c         |    7 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h         |   14 +-
 drivers/gpu/drm/msm/adreno/a8xx_catalog.c     |  675 +----
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c         |   46 +-
 drivers/gpu/drm/msm/adreno/a8xx_gpu_state.c   | 1278 +++++++++
 .../gpu/drm/msm/adreno/adreno_gen8_snapshot.h |  582 ++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h       |    2 +
 drivers/gpu/drm/msm/adreno/adreno_snapshot.h  |  527 ++++
 .../drm/msm/adreno/catalog/adreno_glymur.h    | 2308 ++++++++++++++++
 .../gpu/drm/msm/adreno/catalog/adreno_hawi.h  | 2403 +++++++++++++++++
 .../drm/msm/adreno/catalog/adreno_kaanapali.h | 2332 ++++++++++++++++
 .../gpu/drm/msm/adreno/catalog/adreno_maili.h | 1893 +++++++++++++
 .../gpu/drm/msm/adreno/catalog/adreno_milos.h | 1987 ++++++++++++++
 .../drm/msm/adreno/catalog/adreno_pakala.h    | 2171 +++++++++++++++
 15 files changed, 15572 insertions(+), 657 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/adreno/a8xx_gpu_state.c
 create mode 100644 drivers/gpu/drm/msm/adreno/adreno_gen8_snapshot.h
 create mode 100644 drivers/gpu/drm/msm/adreno/adreno_snapshot.h
 create mode 100644 drivers/gpu/drm/msm/adreno/catalog/adreno_glymur.h
 create mode 100644 drivers/gpu/drm/msm/adreno/catalog/adreno_hawi.h
 create mode 100644 drivers/gpu/drm/msm/adreno/catalog/adreno_kaanapali.h
 create mode 100644 drivers/gpu/drm/msm/adreno/catalog/adreno_maili.h
 create mode 100644 drivers/gpu/drm/msm/adreno/catalog/adreno_milos.h
 create mode 100644 drivers/gpu/drm/msm/adreno/catalog/adreno_pakala.h

-- 
2.56.0

