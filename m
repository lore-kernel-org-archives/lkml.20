Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792529267;
	b=N5jDW4i5zSEJdkgWX8SiikQr7fqhWOkc7td4xFb+1Qt2jWEkkHMWe3tyRZkQChKo8h2x
	 7cwWQ92YxdeGu133GdDuGYBnTgDyXGMnUVKuQJlGoW9lS87OyXqW0x3ltlvKSirp2GK6L
	 EMkR49rvQVoTo2Sl5T9/pKsNPQWN+JVx5aAtjYtNJcrjYIIaKwrEEa+Dg1pFvkwkfqIsM
	 PZfpuuT1PMuDH1ryNZs+YR0ZgW6bHRlc6QHI4ohchHFFlITIz8MX2nl5/WRLvXN4JzClq
	 xJZhBmhs0xiO+OLfSUyBQWoVGKy69Z2W0vyqcCSkCbebjbHTXMs1uGRm3/zx2qC7Bow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792529267;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=IB/ZjUSIH8oWz+WZKTgO5NAmSxJZU52lsWrTkciQxko=;
	b=CvwK6e563KSBFR+LsFaNIM36g8XNy7nJM52WSpeOWnpq+auYKINu71Tnc5bcAhrrioZj
	 n2LVMpzdtk7OyFtTJER0HFwnk6aLYCua22przcDetmosBJPitqyPDfFGv+MHC7CYYNKgy
	 oiBJx7NzgCdOYZ2TCH2xhl6y5P7PYJJVXaCTb2w+YjObq5MAQojapNPpqvI+g4tMx0130
	 F3ySCxTo5JVC3MbM4sBfg5lpMQkFm/kqORJ+7VL18yvMI7bGcBpsHL7vXQWB7tGyVDyBo
	 gwAEqzuSg018En/sUakICy+pb6C5k2FhDS2IfhqJ5AgxnnIiiseobi36rq6GN4KEErQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GhxpIZ8c;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WE68LauX;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65F47606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 20:47:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65F47606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GhxpIZ8c;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WE68LauX
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KGtb461376255
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 20:47:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=IB/ZjUSIH8oWz+WZKTgO5NAmSxJZU52lsWr
	TkciQxko=; b=GhxpIZ8c+53Da+Ez2FcUSLrvAD6ESxQFYDLUJSZOyhCFczICK5G
	+aemkGIdNTrl65uvbrSLeoWwPky5A6wZzP7HnLx7oC6Leca9I954Oq6m/LyXrNH7
	gV0Wh9iKTCfAVboO3PBEWEdtTUte/20UV+pjXE57+kkk1r0dSokJttyCUGNV4cpJ
	1YZwWi71qtZBkX/VvLSW8QGklUKlGY4VjAf/NrK+hhE4FgrRWvv+hW9gcr6kiXX9
	jBW3ZhgzwpIMKf8xqEGMF/Pz5b97YNsfb8BMYiwZ9otjA9OQp6RajgcvU1zaeSSv
	F5eeZHLwCOILOdxXQgv95eABRfjFXVTapdg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hebyd0wf7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 20:47:46 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3a46f0f158dso79222a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792529266; x=1793134066; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IB/ZjUSIH8oWz+WZKTgO5NAmSxJZU52lsWrTkciQxko=;
        b=WE68LauXviD3BaGCbm9RGc7RgItbH36Fg7Agrx6CArhdokF2Onvg1XWtG4Q0UETt8D
         gxWY1ISoPT7mFsIYpRXg9b9n0l2gc7In7oTA6Cx3T+8YiTFySxk40iOJDfpHQgqWM9rq
         u+S6ogoLWRV4K0ex/w7OMlSiRzc5w0bR62tx5BdCkVOvcHKTdGvYPyknAreUBrZe9IBc
         haywXw2WVyDFdkyBZNbQZ6ceMmAXKMZGrqVglq2sZVyw418av2gzeKUvkfEJjX/XJI9W
         b15vKwpxPgKU9/rgxlfJ6xFjy9a/UF95kJ0m/dCx2CI+V2ir1tiivQZJ9/s4fcDoLwB6
         PTWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792529266; x=1793134066;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IB/ZjUSIH8oWz+WZKTgO5NAmSxJZU52lsWrTkciQxko=;
        b=zarjd2dn/GptbMtNdmMUVjX2XYmo4rpsTvS0Gc4xUHAsR4NRKDQTgj46UgBcONnIa4
         FTrIJD0KoCMuAR7dx4IhhHHjhwj1GUIsnwsI0Pc6uWJTIoo4GK6VGoJIuzGZwWFEdD7Z
         hrA2VAAOgc0GL0nVGalj6U6xvV2E4c9o2rTZJJN5OkuWzD5CKreY0LjSvgM8mPA7xjPD
         Tl1NRS384tcKeYhIwlXBm17DkGZX3cQTyAjUYMPYL91xgsXUBaqNaqwCfQQ54lXJb66f
         LkSCjLeXKVs3j2tNrp7sLkX7peVW6b+VeMzMfah3Sse0+E2nvTbuX1wl6CebZgk0R7Y8
         0VDw==
X-Forwarded-Encrypted: i=1; AKwUvBzQhAx21kf3qXeltWRzwx/DwrUIZNAKJSe/ytDfBC9YqQ8hsETo7BposeQ3wzYx9NlxlAW1ky1KjICiFo8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLQA79kOB/AK4139JCqDNrddTrX1lgOFsY87baT02I4+hLsdlq8
	1TGSK5kV69nKiepwHzLRRPm5lXXfclGgwd2xFgVpNz/gJ/BBxZcBqdYZVRJ3OxsPuyuh3udiNAJ
	aOioGLf5wSaeLHKcrrJikIy57XcXQ0lLa+q98HnOLNXD4LTWnBl1ZohYiuieoydabjmA=
X-Gm-Gg: AYBFou11MFQOuWJwKVWLbWYHxrYGH5pL2C+tMJJ4AO2TRZtDfqRc/IVLrDKmE+P0h/F
	7p65d1WUiVnbSrqUo6P1k0zOuQfADW335zYlGkKqf7Wy439frYEoG4YiY4ZrWw5HLnCNC1do3KU
	FNLbHFR8hMc39anh8tVSLOr3PXqy5nTo+ciz6NxTXhViTbaOsARvdmMhojgxhc83UE70dRbv8Lv
	I1mDVV7uFCD0qYM4E+kTvgE8M0Ocba2755Zlvs3xivS9MOYYr36XKxqKBA4RLA6TM4srAUXnAAV
	4Ljp44PQuHWs5UUAxARQlmqYLZjM3nPrDZK27TS1pfWs4Do3MKa/YSX6X2Haz3QNB/DP/hcrL73
	/smZseskLmmFLVP2GW2p6KS+xfXOL3NuLN8eYXOEtdiWKRv74
X-Received: by 2002:a17:90b:5546:b0:3a6:f6b0:30ce with SMTP id 98e67ed59e1d1-3ad86f5951amr34848a91.36.1792529265648;
        Tue, 20 Oct 2026 13:47:45 -0700 (PDT)
X-Received: by 2002:a17:90b:5546:b0:3a6:f6b0:30ce with SMTP id 98e67ed59e1d1-3ad86f5951amr34840a91.36.1792529265169;
        Tue, 20 Oct 2026 13:47:45 -0700 (PDT)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad83607790sm326982a91.1.2026.10.20.13.47.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 13:47:44 -0700 (PDT)
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
Subject: [PATCH 00/12] drm/msm/a8xx: GPU state capture support
Date: Tue, 20 Oct 2026 13:46:14 -0700
Message-ID: <20261020204728.28844-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA4MiBTYWx0ZWRfX/fiQG1HEaggi
 mW+gjaXvRpRl1PUiupY8p4vFYvRXX2RMPX9zRCD50ptrMC9R23rBpS8GTxNx8rrs8tQErJFpNAF
 qr3vFECo7V1Ui+uiAoCU/ppu96G1FyhCzcI20SoTGJVjwuqqAfrzle+/3eMDUYmfCu54ln5FRgo
 poWdpSBx6/3jwDFgZ8ODkdA7aFx6Jxb38FzNdXGXbeJh+i21L6te9T/L7JlGQzYGVQtLaGT8UzW
 o5mbwaCwEqjxp+4oyREKfs4Vd7hLGwGgAmz99GqzA8GrkB5axt1Il1zNVN+Lo6XGC443QuXtNvD
 bIFhVVTzFqGdx4iMx7lSbMXnwmsA1oq7i2azn2Qm11hZl0mgxQLr0xW+vIFQYyBwWlYjHsNJdRH
 s000ByCWogQ5sy+eodZ0Kw687A+XNgFLIo8FxcR9cf5JimIEgIGDjFfBPbL4EQA+tcgppoQ8R58
 U0pe6L5MjKX0mi9nLnA==
X-Authority-Analysis: v=2.4 cv=TdsDJhQh c=1 sm=1 tr=0 ts=6ad7d372 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=e5mUnYsNAAAA:8
 a=aXZFJKk2W_MRhlCQtksA:9 a=uKXjsCUrEbL0IQVhDsJ9:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: nmZsbk0VsiIUi319PFwqiVwtaWJvPXZv
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA4MiBTYWx0ZWRfX7fE4lN3IZ2kX
 6Jddg+Nh1Xz/TYwvbn1KzNyRhtOFW+PWPwYQvXZfJYA+kvRmoGnOkCv+p7M0enuZu+XQZTLYqxv
 QxGHlQ3ZuXcBcHQwuEjb+s8gjqKUzDQ=
X-Proofpoint-GUID: nmZsbk0VsiIUi319PFwqiVwtaWJvPXZv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_03,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 phishscore=0 impostorscore=0 spamscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200082

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

Rob Clark (12):
  drm/msm: Import adreno_snapshot.h
  drm/msm/a8xx: Export aperture helpers
  drm/msm/a8xx: Add a8xx_aperture_acquire_slice()
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
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h         |   15 +-
 drivers/gpu/drm/msm/adreno/a8xx_catalog.c     |  668 +----
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c         |   42 +-
 drivers/gpu/drm/msm/adreno/a8xx_gpu_state.c   | 1253 +++++++++
 .../gpu/drm/msm/adreno/adreno_gen8_snapshot.h |  582 ++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h       |    2 +
 drivers/gpu/drm/msm/adreno/adreno_snapshot.h  |  526 ++++
 .../drm/msm/adreno/catalog/adreno_glymur.h    | 2315 ++++++++++++++++
 .../gpu/drm/msm/adreno/catalog/adreno_hawi.h  | 2410 +++++++++++++++++
 .../drm/msm/adreno/catalog/adreno_kaanapali.h | 2339 ++++++++++++++++
 .../gpu/drm/msm/adreno/catalog/adreno_maili.h | 1900 +++++++++++++
 .../gpu/drm/msm/adreno/catalog/adreno_milos.h | 1994 ++++++++++++++
 .../drm/msm/adreno/catalog/adreno_pakala.h    | 2178 +++++++++++++++
 15 files changed, 15583 insertions(+), 652 deletions(-)
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

