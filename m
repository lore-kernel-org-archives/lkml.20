Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793657058;
	b=Afgz74dSeYROq/P4JR4pMKKSJsPNJ404k9KWnASdQw4ZG8UvyS+N/zutZ9vFINnBNG0m
	 zTbgqwTRxmzJ76B06+9trybpjPRjPQlkoF5wQ1Y+/CKedDM9WtlvKVSQzcIERHU9CuQCO
	 7qEyfLosbSanlCs3aKsbdSuyjYSF9Qx4iGfNVLIxC3dWCXMM+4Re/i4MnhfnTMm9b6vcW
	 9kMXoS8IEMyWysci6EvzAFkWncX/CC2qzONPeuq9YBTdoEcNOsA3z0RgI6NgvbJGQdKTv
	 7N9uZpqLyJzOl5UOBo1Zzbmu7fN2M6hxcuIhL6jES6mQn7fv0oQD/0N/tRdVk3OFyGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793657058;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=SvXcR8+6AOMRF6azzS7zhFa6baaJR1YMpk1sV0Vz94U=;
	b=oWRQZxhUIsnMCmWhSo6zsgHXC242KkPX+42PqFXnjoKlahqL0r0EH4UJq4Nd8+i8x1i5
	 IAiYgeJtanUEMvktIPCpGedqKW+KWh6uep13hzWReL0Ww1k0/QoBfhiNTW/4EdM3r0pHn
	 OSGB1XHP6ye3TrX32SiReU8RwyFTCJLAcIC17cwT3UjTCmhSVTcp9c7J1EeA4FFjnP2LD
	 GVKXChYSF9ArnxgZ9h3/bra8w6YSICkNjhd4oJEEYNCwmNWT430im5JDhTNn6lqc3Z3Yy
	 f7f1KT5au8M4CXdRT3nS5jQbulH0CgMkigrteXFRaWhnCRmplpxF2wsuo904D7jTNlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nWdki1D+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=c7XwxmF0;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D225D606A334
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 22:04:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D225D606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nWdki1D+;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=c7XwxmF0
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2LHjur878560
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 22:04:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=SvXcR8+6AOMRF6azzS7zhFa6baaJR1YMpk1
	sV0Vz94U=; b=nWdki1D+sgOdlxjmk+wsea4EpAq/Ax1+WrlP/Gf5VcFAo22BeEi
	U7w+VP6Q1qLX4+rKcVUKnW/b5/wpnkCydrr/L7d9seJ+cdVdrxcNZQtDNIssY5J+
	t+UDqbXCaGgihZbwZQcXeuME8/yCrZP/bAXhqEvJLYTq3houNgUzRBtKtlXuXksQ
	CnXXxYjZbpcBRDNoeM8sm8VKBp9Eod9u0Iw9p954NkR3CSVoT75ySEvJtHTaFBrr
	x/lx+5uC7Ugxi4EVbM1VAN5TI9onhfsas4M74IMMOMzucYgJw1FQLOHs18wZjf/z
	r2qU7HKYtgS7bF6ru0pH+Ls915FYPLurKhw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq2acg4e7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 22:04:16 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cd65285537aso1478778a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 14:04:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793657055; x=1794261855; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SvXcR8+6AOMRF6azzS7zhFa6baaJR1YMpk1sV0Vz94U=;
        b=c7XwxmF0oU6am+qgeaiTuAc4kbVqBjxZ8jTmMsaPd3RGKTe+zI5iMIaH/iMYjCUgI2
         xF9EdSy/BZN6swttdog2MjBWUDRhVR6jP70t/mwRBqeWSvbK5XwwZwye0AR5k2rM8MA4
         p2KDZFd2ni3Lgh6gCXwCO900A0SWVBYwR1/5/+AkaAw+lOtBp19z10M7fH3txLxCKIhj
         1NeLbY7W7KGO8Xcn/jmhg4xLMBxOArrPTsdjv1BT1bZnHcPX2NXcvxfJHnKHJ6dc9/Pl
         sveyipLJbj9BPlwZzVJj4P4j00kTNEmmBgY/92M2b6Zu21JMTvzb87Li3dwnY1JcFlJ5
         KG5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793657055; x=1794261855;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SvXcR8+6AOMRF6azzS7zhFa6baaJR1YMpk1sV0Vz94U=;
        b=DfEdzEZRjMSm4saBcM1RJuPRtw4GNPn/SA2dTTom3aBe/5v7WgVsslMYIMyqsxL5Ds
         nytCmlEvBZ64rWTE3xnSvCr2zxF7fo3DxptXtFhb0Sjzh8t+cnKyAmzGXAtm+ZC4X8L8
         jID7lm+yHq2FSpDmHE7q2jnRH/f9oSI8IFw+UqVL8eiqRWbpclNrvFFQjDVXxSvxS55E
         B35Ds0WU6fCn4QsIHfD7BE6OOTYxV9UuGgrJtJr7BDQsGIraaL4KrqTvT3jC5Vz1JqWa
         B73k85XY4jXaFsxtif6dQwWVY55i1xBz0W+KJyruR7JybiaYULEYIpzlTlF7ogoHZKSE
         5Spg==
X-Forwarded-Encrypted: i=1; AKwUvBzmqJAOOnO8itDoQHXkNZVpSjlJAKGo56F1x1TZLaC7FBUGrIRpQS1BaDdgBYa06gmOygcpkmV8666Cwdo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+NCCulM98OrfKxnVmcAO1gAIfpiM9IC7YkdFxMDyAc3mKOLgX1
	cfpHqoFBOQwkE+Uf7NG7/eOpWEhAvOcHPP63tD36VxH40Isb+orB5bEbFYw5gDjSkha1qVd194T
	UXwM2UpbCwI57Y2DMM2VtOE9/l0EXvltl4frgfjXfsZ+lP3dTXT7CSZjl/jn7zYGg6X8=
X-Gm-Gg: AYBFou0Ry/vy0AXKA/CY782ti9pcVua12RGGuX+Ctqg4biGNqOJofMaze3MzouWk44X
	oTIMQ4g6qICporM5J3tIn1Flp4IHMx9vYSJq52XZXFIZy6cr569C3Lt3aUKknBL7vI7g2hSOggx
	BCFHM5mUVLbxs3n7vrm7JlHk1SRGQ+Jfj7pBlIcDIikaZtgY36EyoFMZN6hrwetwgSslnt3aktq
	t+g+CFvtmcLrT+qGeGCmsUrU3QIQXSsvn5rOrIXmknvsaV4oxbqdKytR9cVAUmPJw5lpwkl5eKs
	iR2ISK5UPHeyze9TcJ2VtdCoPO4spZjUvHCYogQj/Nne+37fKlDIcN80lzuaU1MLR0sXnl6xL2R
	HqOsS9zUs+X4qpmr0vGcuzCqE2pwqbjfOibBQimZ2jacWAwg4nik4AROJTaZcRkr49E05I/Uf3P
	I0KIvMBGmpnEpckr/wn64T6w==
X-Received: by 2002:a17:90b:1a85:b0:39e:6a80:dd9d with SMTP id 98e67ed59e1d1-3ae898194acmr9615676a91.36.1793657055358;
        Mon, 02 Nov 2026 14:04:15 -0800 (PST)
X-Received: by 2002:a17:90b:1a85:b0:39e:6a80:dd9d with SMTP id 98e67ed59e1d1-3ae898194acmr9615648a91.36.1793657054882;
        Mon, 02 Nov 2026 14:04:14 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c9928c4sm974146a91.15.2026.11.02.14.04.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 14:04:13 -0800 (PST)
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
Subject: [PATCH v5 00/15] drm/msm/a8xx: GPU state capture support
Date: Mon,  2 Nov 2026 14:02:44 -0800
Message-ID: <20261102220405.30730-1-robin.clark@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=T4gZ3PKQ c=1 sm=1 tr=0 ts=6ae908e0 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=e5mUnYsNAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ATBJMNQxfpEraPvdLzsA:9
 a=3WC7DwWrALyhR5TkjVHa:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA4NyBTYWx0ZWRfX2ovxxML9zjCU
 KYZqJd/EkIVRBYpAaE8SMHMZ37Ba2jPURzQqG6dUATvjsGllBNgn3OQu9VPKpDrDRogIMR/0lN5
 btqHXNXDF70Wn+EaPhGWlcvX3ImzLW+PLjVXeILmcr4AOjFLf19l/vP8DaZ2bRmHShtoEtj97jr
 1usQrihLQkmDzlAggnJlQqhHj49lMUDsR32PZzNteExtNKt95yJj3wHVVqNwYFmqJJSs1mNHprw
 8vxYdHQ3dA0dPgWyFDXGop3mEDCArDaqKr38Biww0tdfgDNlodWXC/RW3uDJy6KbNbxcwf0+OBs
 ly9jmuacukhs2PdMgioSM+7IxnVo/4lZEt8hTctCNSgch/cEfn7QhQXk6Ficw6lFJHrSDP/ko1P
 U3BU1wJ8mcvvnm6QfyGQXBvOXFmvkODSHVQABvd7rDvatqK47CnR445mPyn4ioQvWc2inNtgVW8
 bUknqHdIcgvvKhgpSzg==
X-Proofpoint-GUID: 8ekeENq1aIRp-VDOTMSwgGv8KRKP1G1V
X-Proofpoint-ORIG-GUID: 8ekeENq1aIRp-VDOTMSwgGv8KRKP1G1V
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA4NyBTYWx0ZWRfXxkvAa5pkdIlb
 dcG2GfM82H1aOVXk0ZZNsuCmkAGjvQa/ZskVXwDXWuOwxoM5UlTyJ1ZEaMDGYGFiY1lnPOcCjpu
 exzKJeY5nUG233v+6rV1+Ph/UhzQW4c=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_06,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 spamscore=0 adultscore=0 malwarescore=0
 clxscore=1015 phishscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020087

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
 drivers/gpu/drm/msm/registers/adreno/a6xx.xml |    4 +
 16 files changed, 15716 insertions(+), 322 deletions(-)
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

