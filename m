Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793395179;
	b=C+tECls2xbLspk5rxNK9PZaZmgIVdr0mZ+4IEo+tYl+/zdV66zakzgVbleeRpo8WXI32
	 K2nXhbSe/Ph4q6od36TrxtfwieT5ZrHSw/q+wReQdbZiLN2E8h4M+9ijvAmgeGkzRajsN
	 WD7vTp2Mu6ySGdInajyCC8Afwi4OLFZVuSBQjxjLIYV1ZhsSofBzs5HH+mUNzBVlRKX1k
	 sAxeAOgk7OwcsIg2ycqN928hTGC1u1x4HX0G9R/XaSwMNGawNnT/lnRgpMQGkrL1O6PMw
	 3nazjOvbfHtvd/Qoay3Bqj2jtzEW2Aonk3LlzbiutkkaEi4oy/ImoruUdu98/S+n+CA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793395179;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=3P2WBnm8wuFlt2BEKGAThp63jkomyxPqM2PK9B1Nd/Y=;
	b=dWyQtkfnPMZFA/0oWfUAsmd41rHu9r5ftYBdXhu6ETQAm7BWoUahx22ujREXbsjcNPZN
	 M4+08rZaCv226mZXDEJviqQ3OwP1xPhBWllkd0CTrCz/khoM+hD9+CjLxDq638Na2B4lh
	 CtPpIv5msMGlCojA0jHIzqNntrWXjY6hRicjnR3Blfn7NPWz65agVrPgQx6kH+zXgvPwt
	 j64fVNlQ1XRfDUDOx6TGrlq1hv934BjWs0AY/FBvmQ9plEY50PD+tKLlIGT+z93uTj8Of
	 NBqSoOGiTviGX4XEWAliccxfR1Kc8lmY7FyVHuSs3WH4bP65Wej04Ot/W8dVw4DLP+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GjrjMV9q;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GXHxBzKL;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94D27606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:19:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94D27606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GjrjMV9q;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GXHxBzKL
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69ULAcBl799515
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:19:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=3P2WBnm8wuFlt2BEKGAThp63jkomyxPqM2P
	K9B1Nd/Y=; b=GjrjMV9qAaecSsP6giBR0QwdcSIOJLVzkWJshpR2xiEV07pFWX8
	BypflwGjx59R2PqoUDZ0HJkTQD+E8vY9kpANBM4aS50lhllZJbSJcfISPkCh+dqT
	G/0/F7wTK6koHeESNTp3tgiXKgBSAq2kuR3U7szte/WPqYlkcmmGCrjRcwvfzbW8
	ngejtRfwYdiQWNLtqZ8xxJSJ2GJ2IKQAyTzkXPN4b0TWfYUhDpVmgEh/ll8x32+i
	YNiNriMoL3sIzjXgo/RNeK8lEelyyyl/yzv2UpO9yFt4OgVBKZhDlsQFIXDHnAdW
	Pv4bGdSf9btyL64P1eJ7l75xNTzQIRaPe5w==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn2x10172-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:19:37 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ada8bc8575so2548728a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793395177; x=1793999977; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3P2WBnm8wuFlt2BEKGAThp63jkomyxPqM2PK9B1Nd/Y=;
        b=GXHxBzKLMNjVQIPQ55Dq7m56yiZuYoZ2rYjFitkxFsOx0aq5EsmkdsTjd8ZQYGg0OW
         4zkySUSsxuyTZTAU7D4A2BuluUkJkmb8ZQvKXkXbhwpMfWXAY1nJiRu8BwYgHwXNW4B4
         A8TN0FaySPlEZxtSn5+KudibB1PE73OARwqXBhnlEbL35RbQcsj6MiQ0WvnFKmNyo2GT
         HxaDbI3t3AmVSZakWHyZJ7b4QXd67dl4G+eV9lUUjIgdJweGVYpwL77v4gEycr2bhvQx
         aG933pNftA71xA43zDLj51IwUv6qrmK9APRy3grkNJyPn4ZFucVC0+ZAe76UTsiXG/Bs
         VXqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793395177; x=1793999977;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3P2WBnm8wuFlt2BEKGAThp63jkomyxPqM2PK9B1Nd/Y=;
        b=pd6bQoa63rkmDEd4C4p0VvOfbvt2n6OeoRCRMIcPwnYu2l/rCi7dAl7jpn+NZG8l5Q
         cN+TBm0rxe/y/WMsu/QNGaXeKXUrDqKNEoQj59NBOnnZL708CpAwlhMEjktSwR0ZThrF
         /Vl/kkXEy+NY88xzz+B1Aj/1rTjDpwMNWD8enyRXeQBI1Y7gxDHQmZ4v2cbzzKoYXnDW
         P+Oyb5LR33fQ90oSmuMjFHEKhzgWu1t2q3ZyXriaMrvOqdadtykSNSyqsKdFsemRJ+nU
         juANL/krQAbwLEkkpzpQcQBOqRT8PfQUXhyGtuhWDg8AXLs82h194RdOv2zw/zwaWe2E
         17RA==
X-Forwarded-Encrypted: i=1; AKwUvBylTDSw9MWrCPsdmLjceR89bJBMKeNwY3la/dmI/+UBRahPu2c3W8a1GRhuLOo6q6yhvvDbydofe7BEGl8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLQ2iB3iIN5oCTPyLub+jqFjL/oVbgLZXZpxlYJBFOCI7NGzgGm
	7fKxuEJqiRiosVNa5BVbvC6LDt9lQowIlf5NLMaioJi590fSv0dtywBnZgEG9Nro7v5VxmU8IWc
	g62zovG3+DIrmRfPChevWMyhl3DYIgtBo1lskRK8vbMWw8CddVznst5wCZ+BFG5qGcpqRxNlqU0
	o=
X-Gm-Gg: AYBFou1TbsgEkjz7WoYDiRX7N2coBaG687OTcd1yLXKvkh0cj62stCn4ROPqRaNz0RZ
	D6wMMVuQ9v5xLImbpUenlMXbUjkSTLF6pNEgNgtAnsvodxWP+ileX7cCeacB/Btw7GOIAFV2YAB
	NKakmmkbgfutt1bqD0wc+X6lYyf/CrtLtV3cR/AvT9X9/BccHG5CBK0UoKRL6o0A0J57jydCUQg
	ecWGgZ+M6JrprTWBjD+Sn3Hw5pWDPtU5brXfD/iSqh33sZU6GJ5mPjvnWlPLH5lvPVqFhXP5d6N
	IRsl4s2u359qgi2J2bYYSNVeUN1xK9IdQu1789P+uBqQBhvqekx580Of3afQsSzs2hBbOb8Y8Dr
	UavJecWE4uaDc6C0HKtkGt+2OrYUbV4PyGvuvWAq7GdoWz6Koh51AkiUgdGnHh/De/xHZPdDOrL
	NyzauRD3D4DUP2mlgnYITA5lA=
X-Received: by 2002:a17:90b:3807:b0:3a8:6a6b:596d with SMTP id 98e67ed59e1d1-3ae897f3745mr2749766a91.26.1793395176514;
        Fri, 30 Oct 2026 14:19:36 -0700 (PDT)
X-Received: by 2002:a17:90b:3807:b0:3a8:6a6b:596d with SMTP id 98e67ed59e1d1-3ae897f3745mr2749739a91.26.1793395176039;
        Fri, 30 Oct 2026 14:19:36 -0700 (PDT)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae85d24261sm2661296a91.0.2026.10.30.14.19.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 14:19:35 -0700 (PDT)
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
Subject: [PATCH v4 00/19] drm/msm/a8xx: GPU state capture support
Date: Fri, 30 Oct 2026 14:18:02 -0700
Message-ID: <20261030211928.45761-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA4NCBTYWx0ZWRfX6KzXVbmjNYFZ
 m1ezgdGgncUA/I1H423WGjF6uNg8CLCWuQbCx1moAhVYO8Quoymp+DacENVPSu6/1NK6ShMau94
 TqeB8L86JJzEDSO12vkxbMd8hxBEA0x4TSpeZTzb9WFEneT/wt6h86GsRjIqST9ZATWNBToUAXh
 tYcGX3kVfAZNwnlClT5hT02/tw0Refhui/cPEoZzdDKvDoDvzyAolinVFHMwkaNji7PwAxtQfwp
 rWV1yyAVWJXNv3s4wVblXsASPURnRr7YQKkBsteZDno94v8pc4MxgI9hSviK90kjI27IDmhZNp8
 C2AuyTpokRt93pn8JtNTObZOibIYhYVnNcsMSu6f0N6YlRF+ozxl8+wa/LYe7OjNJ4yWCOaVF8f
 MZIbjPIecm7b5RWrMhWdcv0sWomoZg==
X-Authority-Analysis: v=2.4 cv=CLG/zhrD c=1 sm=1 tr=0 ts=6ae509e9 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=e5mUnYsNAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=3qWqBt1DSER8stsMlmIA:9
 a=rl5im9kqc5Lf4LNbBjHf:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA4NCBTYWx0ZWRfXzD6hHHAWnTxK
 7jV29Nmlk+ccfEswzdxUoOaDakQ5JhXx7ap0R1XgrGvb2av85DaVwhQ8LQVO3WX/a0by60vbbyF
 hDoJtg+Py4n76iug5nUc3ChPCCiW/M0=
X-Proofpoint-GUID: x-6528UIKq-0hAqdf_XEMj3gYUAiJcTF
X-Proofpoint-ORIG-GUID: x-6528UIKq-0hAqdf_XEMj3gYUAiJcTF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 suspectscore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 spamscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2610300000 definitions=main-2610300084

This series introduces gen8 devcoredump support.  Compared to previous
gens, it:

1. Switches to generated tables.  Compared to hand modifying headers from
   kgsl (which were originally generated, then adjusted a bit by hand before
   adding to kgsl tree.  And then copied to drm/msm and lightly modified
   some more in the process).

   In the process, we also switch to generated cp_protect tables.

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
don't have these devices at-hand to test myself.  To test devcoredump,
you can use the msm_recovery test in igt.. or just:

  cat /sys/kernel/debug/dri/*/gpu > /dev/null

NOTE: I'm still tracking down some descrepancies compared to kgsl.  I
      think at least we should be matching on the excluded access-
      protected regs, so hopefully collecting a devcoredump doesn't
      make things go boom.  Tested on glymur (windows fw) and on
      kaanapali MTP (android fw).

NOTE: Uses $codename for generated file/table names, rather than continue
      to perpetuate the equally meaningless gen8_x_y naming from kgsl into 
      upstream.  At least the codenames are familiar upstream and this
      removes an extra level of name translation.

v4:
- Drop RB_GC_GMEM_PROTECT from nonctx list, now that we are computing
  the value directly
- Add missing 'break' in switch
- Move RBBM_MISC_STATUS read to after we check GX is on
- Rename sysprof_setup
- Add cleanup.h support for disabling IFPC, and use it in debugfs
  snapshot path
- Collect tags
- Link to v3: https://lore.kernel.org/all/20261029201730.151754-1-robin.clark@oss.qualcomm.com/

v3:
- Drop generated nonctx list for now
- Exclude access protected registers
- Shuffle around some debugbus blocks to match kgsl
- Use CP_PROTECT_PIPE regs to pickup the extra spans if we exceed the
  64 CP_PROTECT_GLOBAL regs
- Inhibit IFPC for gpu debugfs dump
- Fix cx_dbgc capture
- Misc other small fixes
- Link to v2: https://lore.kernel.org/all/20261021204244.67160-1-robin.clark@oss.qualcomm.com/

v2:
- Fix incorrect protect list for Kaanapali
- Use __free() for snapshot_sect finalization
- Fix missing early return error path in gen8_snapshot_mempool()
- Fix aperture setting in gen8_legacy_snapshot_mvc()
- Fix first_slice in gen8_snapshot_mempool()
- Remove GBIF regs in generated nonctx list
- Link to v1: https://lore.kernel.org/all/20261020204728.28844-1-robin.clark@oss.qualcomm.com/

Rob Clark (19):
  drm/msm: Import adreno_snapshot.h
  drm/msm/a8xx: Export aperture helpers
  drm/msm/a8xx: Add a8xx_aperture_acquire_raw()
  drm/msm/a8xx: Export slice helper
  drm/msm/a8xx: Add missing a850 ifpc reglist entries
  drm/msm/a8xx: Allow nonctx reglist to include GMU regs
  drm/msm/a8xx: Stop getting GMEM_PROTECT from nonctx list
  drm/msm/adreno: Fix PROTECT span length
  drm/msm: Rename sysprof_setup()
  drm/msm: Add cleanup help for disabling IFPC
  drm/msm/debugfs: Use cleanup.h for gpu state dump
  drm/msm: Inhibit IFPC for state snapshot
  drm/msm/adreno: add temporary __maybe_unused
  drm/msm/a8xx: Import generated headers
  drm/msm/a8xx: devcoredump state capture support
  drm/msm/a8xx: Add all CP_PROTECT_PIPE to pwrup reglist
  drm/msm/a8xx: Use CP_PROTECT_PIPE regs
  drm/msm/a8xx: Switch to generated protect regs
  drm/msm/adreno: Remove temporary __maybe_unused

 drivers/gpu/drm/msm/Makefile                  |    4 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c         |   17 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c         |   13 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h         |   16 +-
 drivers/gpu/drm/msm/adreno/a8xx_catalog.c     |  404 +--
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c         |   65 +-
 drivers/gpu/drm/msm/adreno/a8xx_gpu_state.c   | 1401 ++++++++++
 .../gpu/drm/msm/adreno/adreno_gen8_snapshot.h |  576 ++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h       |    2 +
 drivers/gpu/drm/msm/adreno/adreno_snapshot.h  |  530 ++++
 .../drm/msm/adreno/catalog/adreno_glymur.h    | 2307 ++++++++++++++++
 .../gpu/drm/msm/adreno/catalog/adreno_hawi.h  | 2387 +++++++++++++++++
 .../drm/msm/adreno/catalog/adreno_kaanapali.h | 2317 ++++++++++++++++
 .../gpu/drm/msm/adreno/catalog/adreno_maili.h | 1882 +++++++++++++
 .../gpu/drm/msm/adreno/catalog/adreno_milos.h | 1977 ++++++++++++++
 .../drm/msm/adreno/catalog/adreno_pakala.h    | 2161 +++++++++++++++
 drivers/gpu/drm/msm/msm_debugfs.c             |   31 +-
 drivers/gpu/drm/msm/msm_gpu.h                 |    6 +-
 drivers/gpu/drm/msm/msm_perfcntr.c            |    7 +-
 drivers/gpu/drm/msm/msm_submitqueue.c         |    4 +-
 drivers/gpu/drm/msm/registers/adreno/a6xx.xml |    4 +
 21 files changed, 15754 insertions(+), 357 deletions(-)
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

