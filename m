Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793911221;
	b=DcUHVyrMnCJj6ZudlYP+XSYqJez9bSuCiCiNkm5eVoP3P6eyTXtVVH3x5tH0lNkpWTOu
	 2UTVmX3QIjclD0Ml6H1Klhc3dIc8oYFZPoR1hkZZXoOr6VqK/j+KZ0swgwpHPVwAsNBu2
	 55xGZals+VMWYdzk4QhoWb1F0+0IbILrDm8c8gNcLl61WHyGo04khxE/J8OJZm++XgALl
	 /n98P+LAc9frQa/QvSl0rwjReZaX9SpQ8A83xXkWKIK7PIhYSE+TpQplgxgTyKg2xZlBa
	 JQNFVuHYA/21GH2tpdCfZ565Lephvj+Zm2aJDXD0hNw+3c7Zw20jpu91ivHa4giPC0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793911221;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ejJX0zIY3UTvwm+Dr1cQT9BYGv3Db+um3b5u1jzCIvQ=;
	b=OCR9pLaFxpi9kJ570UMMWwyo1/OK5TzqsQO6N0O6A1rFE447OJlzg5vi0wpsagXFCPpU
	 C1J0IlnCqT9tCCDB2Ez5LMMVg1ObqpzH0/e61Sr4rcf9C9uS9FevTNhI7gViI/4raqqlE
	 OI15fypdWIBT4CKnmGCSMNVJZmZxbClmtTvDuAtYLXAQvndhlLxr08i/q21Me3+/8Rby0
	 MG6TZyGWRUiyXBqqXaq3p6wnUx36DUpbb0vqePfzkmz/mr8ZAToVZfjQu+TKNrkzvlln1
	 Mzr/o+MNnjQ+xwGMAkjT4iq5zAaB6PVKpCiv3OPE4hdlFdE0DzGMuEfMW2s/+WN0Dag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BXosqJ35;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WyeexI5o;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44636606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 20:40:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44636606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BXosqJ35;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WyeexI5o
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5KVCKq1505332
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 20:40:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=ejJX0zIY3UTvwm+Dr1cQT9BYGv3Db+um3b5
	u1jzCIvQ=; b=BXosqJ35GFC3hAFSGBBAdFfrLr3DMAfTWfcGKOwgu8igZlAYn24
	1zFHy53sTDUoShIqYFEzCa8GGZQlo7lNDXA+eDDCUhquiBlaEUjFK8eqV+jpZkEp
	4G9nLxANAbMHduvgIsdfr2CRlk6fkDGgChA8AHVf/oZR4fkD8qXxHeeblChKjJHq
	hIET/694Y1YuqM9HdUNv0oDNEDUS07DF8qNtwzKehKTkoLtkRUWuTsJw6e3edqVh
	8w9Dm08a9HdXgZE/yJseGUpUA7kLtMA09FmYxj9XX0yymI8RfHafiAP+XYpJU4i8
	Jaazqps2rpzPaMeF9dSxnY0y+17HPbYtSrg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs0wg814c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 20:40:19 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ed1fbae872so23527285ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 12:40:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793911218; x=1794516018; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ejJX0zIY3UTvwm+Dr1cQT9BYGv3Db+um3b5u1jzCIvQ=;
        b=WyeexI5oNj6WLgWICmKm9lMsREhi5YupTHnMCGXQ7wdTSdZCFc+AaMGXfNS6rbYx2f
         aH5DTqGzrllsY/wkkfbCQ5CWlS33zUXCCoXmVJFFcxBIVTtYz3DZ78IUO/BawWXBOIek
         5rxt6stAxWg+whKOpbLxe/IRoGRV/ype4oJ+tIQs3U2QC4gkY2OhlFxoVutuIosJrtuR
         8+7RmacpVW3xmqc4AT33ttU/xYGJnb4B1HmiKmfJscXgAvgNgY25FvUchkIgTOVBBJg/
         Qj7T3rzvqbzzYPNjglbxl7InB6K5a7oJ6Z53Me3x0WooCeY9WhEWlixKqAAs8eV4Nd5K
         S/fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793911218; x=1794516018;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ejJX0zIY3UTvwm+Dr1cQT9BYGv3Db+um3b5u1jzCIvQ=;
        b=dC/VhK7UyWvEQGNK6yjYV6obI2aBwaDTotxvYaIm5XtoOV423Dn+qfHd/XE9h04TB+
         eH47b3WkCDcFMrMj9gGCK0hy6ma/vozYH1aUFIEeFFC1md89aor/9zRpndyAE3LqXpVY
         vEdEen4jbsNJqo0P07AUmLS7HQJRYBb2FksprO3RQcmqvmvhrJou6XqKNsxfZq3MKI2+
         R0tIlFwxpPD7HLGu4PpxTDeoNQXcSBApXYFu6L2+hRqF2jJz7oq8QS4m0ddSq4pR2m7B
         iD/fxCm6C1Fw/jCzj3Vk4v1w85iqCD66x7D+WNqBl1PwSPDMXrNHN7MAfZLT1vWLzp1R
         4rhQ==
X-Forwarded-Encrypted: i=1; AKwUvBzkDpg/VlX013q5m8IJOrzDqxmxC+j1Hk3GylBGME/I1dc24dl9Gtj+eH4+p2cWxC8p9jy2Zq8CmsfTJ38=@vger.kernel.org
X-Gm-Message-State: APuU4Z9x8zM+wmPocdgL6WkZIibDC9dNX23fzBh/1PIGcwX4Wd+IgIT6
	2PWe8tebpU1Or+hZdiNlGTNtlr3J3rI3mbc4KuXDimwNMrstSD2Kzs3ZOeleWeoIO07HjCYZhri
	FqFVkbGU50/3K3MjkI5mTV3/DEZWW7O5fDa/8PYgzhbMd8XAvi4mTsDUeEUPuQfG4XaA=
X-Gm-Gg: AYBFou0RNLqJnariVlvIHpvhtNQbtSJSBWa2ZTRIkIvFsgn4MZILOp8VvS8mlIu4OZd
	xd6j5dFGADbm8mpYSYl5aQwQhbOqPtEKzRqc9pV6nLSmQwKV4R6TsoWIss1bTqCE9EZh+TjYaG5
	SSQjnQYbkP2hRPfuJ0JTnihOR3ByORqY6+FIcXIOfIC2jIaAdMUg67d8XNmzhFKlbMZtUpvJQyf
	vOyZztRLXUj/RAEA+K5N36B5vB6FA3UuHD9MGWNPg7CPNa/ob/eRbL8PRD/aTN1gwTdYDI41bGS
	JaXZNXgbfV5BjO9eGA1RReF+2DkMc7Ftk0+2ILDcx2oX4egshraEDepueYUYKVl/Jjwrxa33Q51
	mLfPP4pzJOSbs1Tla1sqgjQq9eidL7NPCoMrNnG5UPpsbKzoyu0IRBQlDwxR1yW/ji2Cauh7ggu
	FIsNKo/mVXBNW439WWkA4pAe3QeBPlJz2rkOpO72mQXNSw02V1jR7kHCCdbu+bHg==
X-Received: by 2002:a17:90b:1e48:b0:3b0:97b8:d6b7 with SMTP id 98e67ed59e1d1-3b0db6f8c29mr187964a91.42.1793911218450;
        Thu, 05 Nov 2026 12:40:18 -0800 (PST)
X-Received: by 2002:a17:90b:1e48:b0:3b0:97b8:d6b7 with SMTP id 98e67ed59e1d1-3b0db6f8c29mr187931a91.42.1793911217867;
        Thu, 05 Nov 2026 12:40:17 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b323a1fdsm5075510a91.5.2026.11.05.12.40.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 12:40:12 -0800 (PST)
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
Subject: [PATCH v6 00/15] drm/msm/a8xx: GPU state capture support
Date: Thu,  5 Nov 2026 12:29:26 -0800
Message-ID: <20261105203057.66520-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: U-RV-jxarPLpCbRwV7qlmliu7uj7X15j
X-Authority-Analysis: v=2.4 cv=Ka9HIgYD c=1 sm=1 tr=0 ts=6aece9b3 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=e5mUnYsNAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=K31SCvzAQ5oPMqjnjVEA:9
 a=324X-CrmTo6CU4MGRt3R:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA4MiBTYWx0ZWRfXzOHiGEIKfHl2
 DnikTlQD5e52bYWf9zhbcQxio8PZMln3Tca1+wrC6Z+gpXLYLMhb3w+qZc+p9SWTGY+IOf/L8Kz
 B8LayFcfsAAOH5I0n7rkM7FYSV6ZcXrw+Jam2jVdsjoQZrcHLQyzOqD21vOJqJEF49pS9vtDQlS
 C1ZIiniBixmTP56oK8sbizTbpiXT4W4JNXwl7n7fFZv/BsB0SuANycO+Fj61x3+rgtXRrEeyMbO
 DcTa1Tg2JRkzJSy2TluLW3hIVggFOWnAZs8Ie+pO5iOr/N0wEI8VQDk1QgtHL4NMtzyymV+ovVJ
 s7wRpnM5AYh/ENlMSiW/SjDJU5SS9tHF+S49PYn1sgaHopcatTtyE9Zsb2UD/xre2IuF21qogBO
 x5lrqHAoiwe1MKSjmM4m5YElc1ddrShC2lp7vUJfKSwZ65ig4HReAB7pTlsEaG7+ybQDc4G/1b3
 EyBEzwY9bnZfTyrG+6w==
X-Proofpoint-GUID: U-RV-jxarPLpCbRwV7qlmliu7uj7X15j
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA4MiBTYWx0ZWRfXzcPA0UdgBF4Q
 WDFXJRg1wgQzA2kCDEumj8FV2tn/3KSYII+WKt/9tbLc6OD232B0yYx15WSB9+6p9XQj4K/U0Bl
 ZrwIt2Iu2Of9zNEC/9NLTyWvDEzrPDY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 clxscore=1015 lowpriorityscore=0
 suspectscore=0 phishscore=0 malwarescore=0 impostorscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050082

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
 drivers/gpu/drm/msm/adreno/a8xx_gpu_state.c   | 1403 ++++++++++
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
 16 files changed, 15718 insertions(+), 322 deletions(-)
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

