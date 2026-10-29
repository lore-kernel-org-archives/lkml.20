Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793305070;
	b=f9PQYTClJUGLYM5yrIGvNe3loFpkGPeaCMfgQxOD0Q3vjUlyJWmUrZcz8bW6F4RimPXK
	 RhjJ1WkIQYTiSm51BbhrAF2IrGMWKYkPU32fJE0njKf3q6xPc25PgKi/Em2NG9hhxpBmj
	 khr1i7u3nhm7I1cqzgg2Rvh/xFFDuCFV260oyO2XBghiTrZX7oIYRPSiVn0rW0qfrEC1N
	 2odn4fF1rFh/A6hgBIk3c+I3PU9gOIH6CneWEOmgiYh1Ss4CcQNqLCYviRH2dn+19PXID
	 3Lth4aEHm4ZO4hAslpszJnau+Ld8y5AGZBBQ/DVXvEHfFEcfdwaxhuGh6pXXxyUELrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793305070;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=4/SZ45DNk5ZF2RjfLf1m3kZqYrfwnIVOQiVIA5lFy5A=;
	b=sCZWxMUN86XPdgmSusGgN89qh0PJCp5m/HXzpUDi1VpYjx3kgaVWHHHEfZwA44KFY1SL
	 SiJi/n3asUeqqNuV4RFo7RAqsEElJgxabmoasgQrL9U9mTWgRCLAyuH+nZfeVybscSEEW
	 GdJHkKg4yZO58mX4DXpkSLhdkFN7NkfyRMggXA3xeli/nycvCnK057GRBFTv3IJNa2sXZ
	 92aDxgBpc/lhATF/tooGuDXbq/VesBBrptA3lW80pcyMAZtktZq6s2F2MZOaA5sAICbFZ
	 q+eXLBif6bWzLQYtnTISMVc01Rxu+7ouZa2Dd20WjQz1q+0eDrfpJst3aAsg6skOw9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ChwukNLo;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Erxnkm3V;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3E27606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 20:17:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3E27606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ChwukNLo;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Erxnkm3V
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TJk1O43718147
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 20:17:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=4/SZ45DNk5ZF2RjfLf1m3kZqYrfwnIVOQiV
	IA5lFy5A=; b=ChwukNLoLCTLlXDyzf6shcNKytw98YN8RStYniIAH6u12rAdKpf
	wHigsSlkU1UDCDo3DhHJIp2mDyjC3iNj1i4q+uIKRdUBFNlW/CvbrB1XoU/SNrCL
	Cg/M6Z7doIGklIDowi1Hgl29RkLtg9cNB/aDlZ/PInqJOJS+g8YdS1m//OczWOFW
	sAYzFWfpe7IBl5Z79iPAXmEbYAWKvS/XNP306w2TD8oPepOZZKJe6WJ1nOIeQ+EA
	mVePCdZdxe1bSlImx7ksmgWVzPpiO90MQvIdOIWpieVhHzhNhKgTNB3JOA5TCuRN
	sx8Bunax6bGlnCNQvqZGLnYec+uCy2yHMcg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hm31b2xs0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 20:17:49 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cd8b299b05fso2477843a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793305068; x=1793909868; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4/SZ45DNk5ZF2RjfLf1m3kZqYrfwnIVOQiVIA5lFy5A=;
        b=Erxnkm3VwpQglmVfOQYHDA1oJvzHh2qGHisgcITFQVPpSqeiJ32YLFdH2uligf5jOQ
         xKpGx9rMV+hhc8tGI57WcI/aAgf/kfwopNX/OcHbj2cGKgoYkOUV8BwmgdmZSXV2IPmP
         76Rzhn57GUqn1yk2FCQPXOjzhmm9etNk9+wTBsLOv6gSn8v7oiFtxGCUJYKrV3MIrKzr
         F7vcYut31TEZaWitnCwx45R2JkLdbg/eKOSRhmYoVilYidp77LXNav2zgFh1GyRuDqZB
         jgV5tm6U5mzNSitGb2JpyBPqSZUiFVa48icSSc6ncpToFbkdZmqualAv2rNPpqrbRb+L
         pvyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793305068; x=1793909868;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4/SZ45DNk5ZF2RjfLf1m3kZqYrfwnIVOQiVIA5lFy5A=;
        b=yOfyLKl6skzAly0xixm9pFKVg04Uybyww+rYhcrP5TVNHt/ULuGwKUNh6vnR+Pna6g
         7CQiEO+OBxA4zpIRcWF/9QgspjSMswcJqXCLIvp5eQlx7/CTZ8qOFTFFs1+XHmvRpAIU
         PeZGqJL3kKblUqK8lk8xp7fTOwojCXF8ez8TsVeWCziM1orSCEtuDIBNvL2prTkrEpVg
         SBkrE18cRgIV1Jigp3OdpKLz9lYIHyXX8ZdxtQvVnyeNq7xutaPR1m3s392IFBASn2OB
         23XNuw4Q5ECO/Axy0iOMxsTvHzrrDp5p2f8v/Bz/foOU9cPO2GBrVuGE2qhkV6kFoyYP
         wVSw==
X-Forwarded-Encrypted: i=1; AKwUvBzAKZV6VLN4v34eEDneDoOAQW+H3gaWS7SUfynFWdPKeLannikyxc+/BGtsi4p0NYSzyWhdTwj1rSfzAng=@vger.kernel.org
X-Gm-Message-State: AFq9FYL95lgZ+EPIk1GpG7X88noxufqNyug4AlFh6GJR0aoN8sxzRV26
	H+oQuL96WzxXk2PFx+rIvzW1JlcCbSuZ3JxuIBjUsDq8qBnPDiXvHIGuL9WRFjh3DX4UJEoQqzx
	LcfI7MypSOHB8RJdzDwKUX3WITBQfEpzOlpqBGDlumS+EzGhj1aOhnO0F6EpPUh0spBE=
X-Gm-Gg: AYBFou0QBNkxQ+dppg3YC339xDyih5sovf2FcVqesFCdnB7nLQoKb0ye2nuH5l4dnfD
	cSpQhVh4vuA8ll0/j4IJMHpQZ1CDdu6HHhm1UhKzu+ErN+Q+hm3Rx6dadT/Rxyz+E1Js+rJ0bzJ
	J/az+yLnJRF1We6eLahRyvfT6/wS6WxVRn/FqE8Jl4g55QI/z6gTCGsxZIre6pGlm4tX0d8WyUG
	5I9rjeq+D6QJBdV9hHGAWk03PnYQsvSbTtu7IEF+J6SlhPSbybigB84+Ke44SbbVq/UKxH8+bSh
	OfXzKg550Q1IcPyTnHcEKcVklkob3arSf7+kJ24EbrCqkhYhhGMKBkbQ9RIDjEKQKoira+W+Cho
	nxC/7z9Hise4os307FvVG27xO2HHF5tZhrVnWIhPIMkMAHG0OJzrqFWABXBXuWzryUEMKqK45fQ
	JCyDWRCPX4g/CTxXyFlQ7MRA==
X-Received: by 2002:a17:90b:1188:b0:3ad:b7d1:8631 with SMTP id 98e67ed59e1d1-3ae897eb75bmr46550a91.17.1793305068363;
        Thu, 29 Oct 2026 13:17:48 -0700 (PDT)
X-Received: by 2002:a17:90b:1188:b0:3ad:b7d1:8631 with SMTP id 98e67ed59e1d1-3ae897eb75bmr46536a91.17.1793305067875;
        Thu, 29 Oct 2026 13:17:47 -0700 (PDT)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae8803a80asm96244a91.3.2026.10.29.13.17.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 13:17:47 -0700 (PDT)
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
Subject: [PATCH v3 00/16] drm/msm/a8xx: GPU state capture support
Date: Thu, 29 Oct 2026 13:16:10 -0700
Message-ID: <20261029201730.151754-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA3OSBTYWx0ZWRfX38afOq+ZwUvD
 0DaOHi35OGURFkt2uogKJSx7BhEB39vcg+TYM9n0GR2p71qgWF3JHBJx/D7PiJbznCsWSCt7eTF
 I3jPytg4QGP5DnXLporV1VB/cyV8bDs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA3OSBTYWx0ZWRfX2+VRX61SMehH
 oPEDb5t85wkjFyaFmEGOKX0Jr5fFcRYMQ6YcTX2h4N5QKVbxwOI1gPIYs1pLqf6mV2+2/ahrqWL
 9LdlDwyA84JYYxx755RZsFjHtAPzAUxO9sm36F/GTVAkNMnEka9QslyBqDt+3atoYS8V639uPVK
 oAze9AZmdjcOoOFRcmqfHzG5lFrQKiURyLZOhebBddOuBtefedRUTW3k1ZReYKuamM/l3hPbaQp
 HpF7ULJyemz2knB1jGBRxt+6LsuJWTV6etsVMcl7mB1zo+oTFLa3c1ZKUvFrFr23mMI7I3HsoGJ
 85bCeTsRJuFGw7zcRvvg5WEUrsXM+6yTOgUSUnepi+Bt8dmRFFB5wz+FOLhugdSih2p8F3LM7SS
 5Tkw9HajuI0tggzhgfVLIHkc7xTzYIAsIdAILDfxJ6fqDbyViW4cgrJFSL1IiTdQSsKkJz2BCGN
 M24soZDZ4bWlhkHFCBA==
X-Authority-Analysis: v=2.4 cv=A8T5rKWG c=1 sm=1 tr=0 ts=6ae3a9ed cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=e5mUnYsNAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Xe6-QGUCc6mO8dw4QqkA:9
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: QVpUEVuMRfmwbVJSMddz0CHJyG_sSrhw
X-Proofpoint-ORIG-GUID: QVpUEVuMRfmwbVJSMddz0CHJyG_sSrhw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290079

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

Rob Clark (16):
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
  drm/msm: Inhibit IFPC for state snapshot
  drm/msm/a8xx: devcoredump state capture support
  drm/msm/a8xx: Add all CP_PROTECT_PIPE to pwrup reglist
  drm/msm/a8xx: Use CP_PROTECT_PIPE regs
  drm/msm/a8xx: Switch to generated protect regs
  drm/msm/adreno: Remove temporary __maybe_unused

 drivers/gpu/drm/msm/Makefile                  |    4 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c         |    7 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h         |   14 +-
 drivers/gpu/drm/msm/adreno/a8xx_catalog.c     |  398 +--
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c         |   65 +-
 drivers/gpu/drm/msm/adreno/a8xx_gpu_state.c   | 1402 ++++++++++
 .../gpu/drm/msm/adreno/adreno_gen8_snapshot.h |  576 ++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h       |    2 +
 drivers/gpu/drm/msm/adreno/adreno_snapshot.h  |  529 ++++
 .../drm/msm/adreno/catalog/adreno_glymur.h    | 2307 ++++++++++++++++
 .../gpu/drm/msm/adreno/catalog/adreno_hawi.h  | 2387 +++++++++++++++++
 .../drm/msm/adreno/catalog/adreno_kaanapali.h | 2317 ++++++++++++++++
 .../gpu/drm/msm/adreno/catalog/adreno_maili.h | 1882 +++++++++++++
 .../gpu/drm/msm/adreno/catalog/adreno_milos.h | 1977 ++++++++++++++
 .../drm/msm/adreno/catalog/adreno_pakala.h    | 2161 +++++++++++++++
 drivers/gpu/drm/msm/msm_debugfs.c             |   10 +
 drivers/gpu/drm/msm/registers/adreno/a6xx.xml |    4 +
 17 files changed, 15726 insertions(+), 316 deletions(-)
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

