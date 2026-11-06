Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794007356;
	b=YN/9kLYdTAOb8rz7JVVqRYGQqHUjPvRbyiBJYs1ESAxn6hXR4F3L2XRP7h2J4pHjnMxc
	 EM6SGIVFldBK0k+FT/0GsytQ+gIwge4HUqh5zppoD0ClOU4k19QSOH1YKKK++P49bVUfS
	 5hhdP8aV69eDRjoTepcBimohzOY13fmNLi3L69icwHLImYGghlDVV7u2R/R9ZKf2HGM38
	 ad2cJK/6AfnS2Cpi/taRnZk2xI2lstlTrcX8kCLYxwDX/fDCfDbdCVwldYCkcAFX26Ox/
	 E6czO6BvQN+kJyA+VyoKiAxKwUg0n5+DDpJEkKZZG2MPl/p6TJhPY1NA8fshfqSAytA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794007356;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=S055k6TyhPCYhS1fDxaEVyy6bLh6abktDuUjiQGLWqM=;
	b=lxfzV4n+VmME0ReSVxpPKhvM27wSeCMGiyYZgX/2Zw2BwR2NAgd11cPcgTnqJ7pbpqa0
	 zEnu9p7wtRCovIIVm9NE756gzKYT5IzEx27kP0NK/rcpYvWln7tmlb7fheI1ds8i9jUcT
	 ypCKBlqskke8W42o83bjIrt91ipXskwRI3YgNt1dlsJvEbLvbU5k54d5il5NWaOiIFLtN
	 G5tvuwng57Bckc4UoRCklUoXn2B0vzP/yf2KjKqOBYxdmlf87aKMsAWFrwutVo9bVUHYD
	 y/sRfiW5PFc9iNzQvjmEAQqYNlLUGv7I5bXWda2zZdpdIQGrPRwCm6xiNyvUHABZAvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kmqbxN2P;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EmUZ1pqX;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB9F6606A32C
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 23:22:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB9F6606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kmqbxN2P;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EmUZ1pqX
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6MnnmF1063669
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 23:22:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=S055k6TyhPCYhS1fDxaEVyy6bLh6abktDuU
	jiQGLWqM=; b=kmqbxN2PDDtM9OnkPRNx2xaaUbxZAjNlVuJHuWWygwKyHJVx+CI
	poFHbBx89HZ2TPEcDfcry+4SncHRqIiUi0t3zIJll3rCb4Pdz6HPQMxOKAa5oFBZ
	JQRWe1PY/GVALfFwVC0STKdF2w0l3E5qx8WJWAPYs6L+4hMOdn/UjbcWdEmzPmjs
	JVie1mgZkfjiah2Y43DMW8JVJcnKBf6eddlM731SYC5b9X0xUZexFt4GXwv9Vpg7
	l+bJKFITzFYdpcHNKuVU2q661V6Bq+XAN28SZDQhGKxBKRQq7nJFif0Q+JeT0oEZ
	X1JBPyV2Ay+SWzRkLNfdFzu+oQw9Jdx5ROw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsmyv0r9k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 23:22:35 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cdaf2073b0cso658908a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 15:22:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794007354; x=1794612154; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=S055k6TyhPCYhS1fDxaEVyy6bLh6abktDuUjiQGLWqM=;
        b=EmUZ1pqX0mClcEkYEhHw+mfCn5vTg5dNH/mRkHFL9TDDOnGwjMdGTA9pMjMJvnaKxh
         UaZ5+Xa7CVRBHktgewdw9ftqK9zuSUFltn+/rQi0SejhuP0t8XCMQu6zMkgkshyGPra7
         cro1aN7309og0w8YKaHKkxE5oZwKGt17f9LynXEpqVJsLeTv1dQvQSro9rerJWv/bOm4
         nGGUSTYKWXVeQWlkYKELYKeSRdxztaRt6uXrK7FoCxIluTLjTFiI4XENLblmOGF3T9Yl
         8ERSBosNObWiuYYloN5kGKX37dHLkGlMXrNG/5A2TlOu3IOB8LsFw1B04TmzEKfN3dYE
         XPzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794007354; x=1794612154;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S055k6TyhPCYhS1fDxaEVyy6bLh6abktDuUjiQGLWqM=;
        b=wzDN+PntGCwBFmDkb4QVh7D8jxR7ctI06FuWzYC2/lMJA7CRHItPRZb2/SryBInv6q
         3hXwmmxEli4m18BFhu/vF6CNIkeOHnwZ/bUHP6mP7Q5Jl0mBjyHtbOqPbHeVj6QaN/W1
         t8ruyPbyr1guQ5DaanZOb2Y51C+g6Hbp7HkFOsvbdjzABot5jLNksxE5zbveQxCsVrX6
         vIuiVSDAlr438Ppc6yVbYOLr1mFSQFEhXVxuGb8xqtSpqeKP53HXC6ZRpd2/Gq+nYe8M
         QGoLBPOu7GIQDJgV/iEzWu6KFywLFOOL6tOUiRkoVjntlIYfj+pYXk9X7+U9SNEmsrhD
         GO6A==
X-Forwarded-Encrypted: i=1; AL+hErFgBq0H3rYetNpIWZ67ushktz4isjrCRXxQh2sthtwB5dBETVZ2pVb4/C82vMZG3/xvsLD1QHa31GGfx2Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z8oAIdC9NeSFkJejR4LGLXZaP95v1VgoWpesc8iZnF+gBkVB4Tv
	OIoV5CGItbvZg+lk+XNiaH2CKRQDblFf6arX6Gn/JWrg7TWPPpAsSc9v6xZW90dCSuBATyk4Uyv
	fsykbRhwje7rsD6PZwqN9hIHawM/mJ0vyj+myMe6fcF/E/oraSIwNWADp3WmARgFm+aw=
X-Gm-Gg: AYBFou1Y9QJNaZk4cWTNo7d9BBqCD3dA0vsTlMvBtmHr6ep7rFWJLG4L4YMDded81xO
	+CWpNvqVEa7Z0CPEO5WQ4MBuPhmxNVKuyBx2X4igGP9yAz74Zc67EhYjc9aIWaUunKpq03DkFCT
	F7FP4lDtyG3rIjjgiBJAU3NfCMo11Oe8F7PFs6IJ/ZRzBtrwVomP0xz/t4J2u4hDLil5dUkTk4O
	f08BVbs4yIkF/aTRDMIGwjNSaf11SqAAkqsgLXk30uVcnpR1I71W/wOAqwimNljMIKSZN4KeQYf
	CrJW1j5Ld0abxBDZ7OJalPa2A5pJO5jX1UXO3NXnHfXTs/XAJTeo0F7Qz8xWO3ddSZgloAWeQJu
	5bC4oIrSA9w6SGG8fV0mIlk6edZ5eCENOyauy3uI5HpeiKw5XTR5/9owviXNJb2hM1tX7lAMQgX
	scyMWnXLCnOEKbnrgorGg+7vA3JcP9wyh3bxkWOeHKLOtHy5hSSQo9i65pMkx1
X-Received: by 2002:a17:90b:2748:b0:39e:6a80:dd9d with SMTP id 98e67ed59e1d1-3b0db6f507amr4043234a91.36.1794007354349;
        Fri, 06 Nov 2026 15:22:34 -0800 (PST)
X-Received: by 2002:a17:90b:2748:b0:39e:6a80:dd9d with SMTP id 98e67ed59e1d1-3b0db6f507amr4043193a91.36.1794007353794;
        Fri, 06 Nov 2026 15:22:33 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b105831cf6sm653732a91.11.2026.11.06.15.22.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 15:22:33 -0800 (PST)
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
Subject: [PATCH v7 00/15] drm/msm/a8xx: GPU state capture support
Date: Fri,  6 Nov 2026 15:20:52 -0800
Message-ID: <20261106232220.47602-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: Nr7Yf54Oip_Ysmd4XQZ4pjgHEDl6fEl5
X-Authority-Analysis: v=2.4 cv=IdYSymqa c=1 sm=1 tr=0 ts=6aee613b cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=e5mUnYsNAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=JpdGgOSwG_CvbEWjDSIA:9
 a=x9snwWr2DeNwDh03kgHS:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA5MyBTYWx0ZWRfXz+4bs7/JS9Rm
 e20w2RIP5hUn+ODWf7sYDEjmLJzexm1Q2aplt/flMzl2+GD8327U0ePvh0opyFhlG5df1JI8f1d
 9213jkrkAZ7yj4aEEdenFm2WZhCZn9g=
X-Proofpoint-GUID: Nr7Yf54Oip_Ysmd4XQZ4pjgHEDl6fEl5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA5MyBTYWx0ZWRfXxxn8ymcTmg1b
 lt+tR/r+jg+DVQaS3UvAGhgXKVbr073tRBQ3fQQQRrBNL+d3PoaagZ7zrbq1XYBBCX+bqJVIkTg
 uN4TBecMK418QbcBqI3STcWAf+civacq80kSv8XofXDDGjlF0Zo9kAdHC9huWp3SuiFqvTzrC+B
 m1UKuV1/mo0vbboZb210P0NW77kiQJPN6W1NjqNdJUjolmHoObT3TuUsuPsmIVI+as3s1D3gZbW
 pTmz+30YwDY1WspXB5w3Xh8/2jn1sydfmSalvXVNG0OF0zCVBtDAHkKlNmt5lS+yhD+Wlo5wOZu
 JxHaVDlBuqfHDP3p1JKVJ3XZslORFCQOFqrFoPEj3UjS2ZYUcAcL0OrU/AMK8UyRxQBZlEqJjCI
 YyHkrPKIPg9VxU9N8h6IV/TT3tBIZrKiGXJ94yLp8+wX9TVGATm50SzJ8Wh5yk5lEA9qPeZl0dV
 q9/svbsTZZ552MdkjFw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 phishscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611060093

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
 drivers/gpu/drm/msm/adreno/a8xx_gpu_state.c   | 1407 ++++++++++
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
 16 files changed, 15737 insertions(+), 324 deletions(-)
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

