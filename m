Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794234081;
	b=ZcTnHyMn3tOsSS9+3vVV22KNVZTXELjLYIsi56BbIzXuAOETwT/yJbvd9oqIiTxDY9gR
	 ecFixDSumKoJajMx7Gpg26bsXZq5z+fkUvxm2z6jjcirlGSp+DAWUvVbFbkIyLNUXBrP+
	 KUqWIyHnCyR9KGX5SgSyV3DQP5AGeNgA5oSa5o1onkOJ38lAjoL54V01q6k8e+gYa/zRa
	 YC4Yv+eZnb3VKJsSSViUUxMX4+1daB9SrbAW1tE1ycfzLN/DBdyIpZaE+1TEeX4tHAwQZ
	 Upr7eBE7kBFV4dnm1v4TfNxkUZu9XcDGzrPwl4zFY5IoigY/Kyu0NFvNF1WtXu152wA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794234081;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=GFz+vbFNjp98yDL7aPn7CvXpdfBv6TkNC36/BTBNT/4=;
	b=NuRzTQtIKgK8HuaawFp/RmG/nVjc5lsz9SWz4l2jHHFss9fjmGUqvZKqYSKeEYXF52Kv
	 vHzN8BaWWNLIJly768pA+l4osmzLJCBdveOniO+hxpKurL1IBhk4O+cSA7EHkA5u3J+By
	 n7j/ryjVA1J0fcoa4D3k/yCXFO4Qp9vhvaPfgFVCAGLqYu7tAc4+ID0JnCoYIDwzvk/lJ
	 S6MJOLMl1QGkn49nW4N3oQJyUDE7yv9LGPUH7K9h3O2x0tULxFUQ4/Dm90LiEuImmLlD4
	 ISBU6MIU4jmVjfF/Qz6dEq0neS0PG315rdk1N6PJMnmTsc0gvf2CX+vGJCR5kJ637TA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mJlb9g6l;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PrNuk8CD;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E589606A322
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 14:21:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E589606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mJlb9g6l;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PrNuk8CD
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DFNNc985260
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 14:21:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=GFz+vbFNjp98yDL7aPn7CvXpdfBv6TkNC36
	/BTBNT/4=; b=mJlb9g6l06guGTQ3Yvl/qryLcSUrNANRKHw4Lhngf2KjFbmEzFK
	AgC2dR2yyEMpearddtaMNALGle97Scw1/dyf4AfwFUG53CIKMJUSWZh5gkzvjKDd
	h6UzSvqxtVreCpDhh5o/BSj8nVDlvc9Dg/R9CQtoa/Jbnu5aQzf5gCeHvg+LTdFU
	Id3UZtMIBKUgODjSBlPKkH/nPWcObihmzx0W9H85q/iA98lTMyMV2OhLAuyxmzoa
	r/ZHYXzSAWKEQH2EAkme0EYT4/oekpucJJjnaF+31Wj4Rt09D8TSXGMJ2Ih+YaAP
	bWUf9jVpxgxhYAerhfbx0O/Unn724sRK3WQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsujxerj7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 14:21:19 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ed283cb5b9so5116725ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 06:21:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794234079; x=1794838879; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GFz+vbFNjp98yDL7aPn7CvXpdfBv6TkNC36/BTBNT/4=;
        b=PrNuk8CD/dvhiuLMY4f02Kh3F61AodNPpWDAqdBqGzLgltbHOeT3RZGnT0F1wKZsC4
         I6KxvVxhId97bmxIfNk3vK2GoRx9Pkqc0wkd2I+UIyJ5YCh8KrSNWurccubzOabHnRpd
         +rEF89ICXcvtM/2PF8b+19KWCE7t+TD6ogcnZKDNRwP9zeo4gsc4MKnjjxq/lh73pDKE
         FTKAJi3ZDZUq0iSqfm3gO8aqsnumqL1YjkDvCStoc8oukcSAAm82966qOU+s/ovu4r5H
         WrMBWcOeuFYaPvl856W95vcRRPz5HzDb3d6nIe2PvmF+Oho1MrwUi39MBl7XzmVuxtNo
         8P2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794234079; x=1794838879;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GFz+vbFNjp98yDL7aPn7CvXpdfBv6TkNC36/BTBNT/4=;
        b=p5g5oJvEDxaQpiqRTphYUowbkRqmK0XRJOlciOvQ+96Gox9Ya7bBtaSkfU9HTHzFjj
         zuyKGw3jol2zaaiPDtoDrm/atAbjqpi3Js2IpyP2VspdtNzprJvvJFWySkCQ2F/t5CiK
         gjXk4vGp7WMXcAwGG56CSdAvyWAMX6ZJMEiRMTfArV9EInWvzc2mTB3tygOBqmHELHBG
         BYZqkyFXbs/6RD7J7qrdOvWUhoII+MGmchpa6wBrqdF6FM22GcKHBCWDwfdtChW0U7nr
         wdCM+HcP9NnKq+nIab3o0sl4SWpsI1o2BAsI3wSaMC/bc24ceNZHtHM29zgC2kCpAXha
         d2BQ==
X-Forwarded-Encrypted: i=1; AL+hErHMoAEN9wYRnCReljufoXb+mdHlGi6GWUzAvwqKJdR0TU9AB5t1D/WitO9wanEl7Ebw9mlJynGDVQ7OVq0=@vger.kernel.org
X-Gm-Message-State: APuU4Z87Ivna+uBbHIA94MrAiux1q5qjdOTjG5eep7PbL4lO7kEm+dda
	fp6OmsYAH8/xKgeqwRzBlNEe1apBQkjnkeA9HyriOpr4Yxbizw5GoAtxxaE2ukh33tZfoiIhezx
	yj2b05QRtbZh0vJUuOEn56GhDsUo/XHIp4UqgAHh5UumTO3lyEtP95mqCJEuv8a5IVd7zOIaYYO
	ew2w==
X-Gm-Gg: AYBFou17CmLsk4wvVdTBLQ3eo8wK7h3+hcdpCiSh+SBNq9aoIBsX0CF+J0ra4p6n8oC
	RlXPrsvlJcii6ylnnOKs4TLEqRAqDuWJP+VFjjopjSdYf6uwBIIrMfbnJv8hK0nzY66GYp++GVJ
	F5YhDyrSh5SCuxBqfOh9sI7mlx27xx4M1I8jEDixkCMrLtM5OC47vHLdFpxzscJICYYgzKn7ed+
	+YOyox0KpRIhMBH6PncC+JS+YhvFJsn3cD/h4HLaR/QkPTqT3UAGXspvpin3FzVj3MI7+b+wTU2
	Qc+/yvSixdR0lm5KmbozqgZXTQDO/OaDSfam8ugp/1BNZlnIARiyOEcqPyjwP4QGXksqiCsNby1
	ckqZ/CkO3OO2mI8QOMd5OsYpiaAUcm17SyKdre7fLRJEXlp3ZqenNMiDdceXuhddb3fLK8WQIJV
	KqGfD+M2OiF8AtSCWJKJFrX6GVhXsBVnZpvgYbNo4yGSOpJ/7QvOdzPW5+DBSSow==
X-Received: by 2002:a17:90b:4acf:b0:3ac:b3c7:de04 with SMTP id 98e67ed59e1d1-3b12d590f5bmr3148873a91.34.1794234078868;
        Mon, 09 Nov 2026 06:21:18 -0800 (PST)
X-Received: by 2002:a17:90b:4acf:b0:3ac:b3c7:de04 with SMTP id 98e67ed59e1d1-3b12d590f5bmr3148830a91.34.1794234078169;
        Mon, 09 Nov 2026 06:21:18 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b127891fa4sm7142836a91.4.2026.11.09.06.21.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 06:21:17 -0800 (PST)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Alexander Koskovich <akoskovich@pm.me>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>,
        Nico Angelo Dela Cruz <nicoangelodelacruz@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        David Airlie <airlied@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        linux-kernel@vger.kernel.org (open list),
        Marijn Suijten <marijn.suijten@somainline.org>,
        Sean Paul <sean@poorly.run>, Simona Vetter <simona@ffwll.ch>
Subject: [PATCH v8 00/15] drm/msm/a8xx: GPU state capture support
Date: Mon,  9 Nov 2026 06:19:46 -0800
Message-ID: <20261109142111.256630-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-GUID: xSJtvUZEGimlV8oZvbXxIAs79aGcOHxi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA1NyBTYWx0ZWRfX605mM6wO4Yng
 PvykAj6iMIyrOf3KvY8gITKtsWAaE7PkcWmI6CCESAWDVxMPRoRTaIYx2kAB2y04R82F47jpfUK
 ajTmf8rMTHNqn+IB51il+bDPBDANlR4a17H8nji2dTPH2L9HKKyeBh1JgWChFi2gYD1GS1rTA5m
 B+YUdpGRUz7voTj+TFjHTmK0SCdXSw3vMjMP9Xb9y/nateFB0VWTqsZnLPIa+rYrOexb1xtyrfK
 qTJHrFgsYNSE72mKLKfoc1izS9ZatWSly+25aIKMKztBUb17pSHOvQRF8+Q7o1giYc1utsY9BCK
 w50hlwh/RU3lrwQY794USDICQVxnlJXKUliiHas5GLlDfk6guuRp7Nl0F8/3whPqnD9ck39C36m
 XASTDPwwKlfFeDHqZ+5c4bmus/M3hPk/fMo/uPsyX1DIoE7NmKdS1Kb8RrzdcnLw2mVvzErtjlA
 yzHx+nraqyBAYwDd0Bg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA1NyBTYWx0ZWRfXxxZiadQCzWHj
 hqnGXozorGVIaEGU8T/sKFFSC4B8oLsJvdGCazcbcTqJ9CfuZB1qye6ZnGx+gdVbN1ni/a40nKl
 5ucLqVce5flmSinY/rC6UsCoIU09szc=
X-Authority-Analysis: v=2.4 cv=TeIDJhQh c=1 sm=1 tr=0 ts=6af1d6e0 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=e5mUnYsNAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=CMqLmQoervsXYc5HfjoA:9
 a=324X-CrmTo6CU4MGRt3R:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: xSJtvUZEGimlV8oZvbXxIAs79aGcOHxi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 bulkscore=0 adultscore=0
 spamscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090057

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

v8:
- Also fix PING_BLK_SEL size in cx_dbgc path
- Also make cx_dbgc capture conditional on modparam
- Link to v7: https://lore.kernel.org/all/20261106232220.47602-1-robin.clark@oss.qualcomm.com/

v7:
- Fix PING_BLK_SEL size.. this bitfield got larger on gen8 to accommodate
  a larger # of debugbus blocks
- Make debugbus snapshot conditional on modparam, as with earlier gens
- Clear aperture at end of state snapshot, for good measure
- Add missing bitfield.h #include
- Link to v6: https://lore.kernel.org/all/20261105203057.66520-1-robin.clark@oss.qualcomm.com/

v6:
- Fix gx_is_on() check
- Only capture preemption records if preemption is enabled
- Link to v5: https://lore.kernel.org/all/20261102220405.30730-1-robin.clark@oss.qualcomm.com/

v5:
- Fix inverted IS_ERR_OR_NULL() check
- Drop IFPC fixes (moved to their own series)
- Link to v4: https://lore.kernel.org/all/20261030211928.45761-1-robin.clark@oss.qualcomm.com/

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

Rob Clark (15):
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
  drm/msm/a8xx: Add all CP_PROTECT_PIPE to pwrup reglist
  drm/msm/a8xx: Use CP_PROTECT_PIPE regs
  drm/msm/a8xx: Switch to generated protect regs
  drm/msm/adreno: Remove temporary __maybe_unused

 drivers/gpu/drm/msm/Makefile                  |    4 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c         |    7 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h         |   14 +-
 drivers/gpu/drm/msm/adreno/a8xx_catalog.c     |  404 +--
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c         |   65 +-
 drivers/gpu/drm/msm/adreno/a8xx_gpu_state.c   | 1409 ++++++++++
 .../gpu/drm/msm/adreno/adreno_gen8_snapshot.h |  576 ++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h       |    2 +
 drivers/gpu/drm/msm/adreno/adreno_snapshot.h  |  531 ++++
 .../drm/msm/adreno/catalog/adreno_glymur.h    | 2307 ++++++++++++++++
 .../gpu/drm/msm/adreno/catalog/adreno_hawi.h  | 2387 +++++++++++++++++
 .../drm/msm/adreno/catalog/adreno_kaanapali.h | 2317 ++++++++++++++++
 .../gpu/drm/msm/adreno/catalog/adreno_maili.h | 1882 +++++++++++++
 .../gpu/drm/msm/adreno/catalog/adreno_milos.h | 1977 ++++++++++++++
 .../drm/msm/adreno/catalog/adreno_pakala.h    | 2161 +++++++++++++++
 drivers/gpu/drm/msm/registers/adreno/a6xx.xml |   20 +-
 16 files changed, 15739 insertions(+), 324 deletions(-)
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

