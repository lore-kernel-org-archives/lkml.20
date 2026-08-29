Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A03B6331EDD
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 08:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787993990; cv=none; b=rzEByLi0xoJEHnfo0pw30wqoJxPOOpt11VHZU+COHiDTvLyjS6LqMAmfZ+Mve85SLUbe2uUwSoWmuaRhRzxXaFHO/uSFsTRNyKiUgJCXMRfPRygHTgSQq84wL5PcSIvZplIB/8UjhG48C+xTIrkN/EInrT3Wnmnn9se+l9vDvcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787993990; c=relaxed/simple;
	bh=ZRJZ7QzBfGzFI/MDUBxk3TPtqDvXIsJnS36636a2wA0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MRqdKctuiPLED6O2uehP9Qwyhl/ee7Ov9nEl7Y6zqRiY1FLZPn0WlUwmnGUaq3yUMPvRgbqC/LIgDe1eCm2AHXZT9U1TalLxWNPOwwrTO4fD4ti0p9FHg7vs86EeDGI3kCQZG/6if7NCwAQqscc1MHUVjI1tRgWDstCJi+Gv8aM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ukn6aF0j; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ukn6aF0j"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c1600d040e4so288853466b.1
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 01:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787993987; x=1788598787; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ibYckuXaq6TGpx88vTI/hlaavXq79ydxG55neiNaehY=;
        b=Ukn6aF0jMYjydUZ1DFF0ATwy/tNtpd1VDmuMIZKJLVQrczE/EQm5kLRTzp3Y8YM1eB
         7s4QaUZUxErTaQapC03l6aEM+EdscIKJMvkugW54oaScAar7qwwuEajTZCiybjVtDvuW
         fWblzhNtxMcleNHQckk7q1fMOr2URy57jsmGGyzBy0G90xgODo8T1YZc2arz5kgEwxCq
         1P5pm09xyxElVi61YkSy/sNOE3ZFsLbBC4hP+EQihuH9fyDTpLpI3lF0ul2nki/z8y2M
         PX4oRZBL5WPSEV2P1NgU7qp5oe8NUncgH+Iz2cMRJuDKcRlb0o46xNQlSyUhItJktaPL
         6QPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787993987; x=1788598787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ibYckuXaq6TGpx88vTI/hlaavXq79ydxG55neiNaehY=;
        b=Ju45JR4R3Y8G8xLyITCu8Lx6RqFyTLKYQkudVBY+9300ZqU4zg3gYUeDLz+hjmAEp+
         lVKfB3xjt/7n4FyKmo3muIHN3uZst8Pv4L/QyLDfePFuzCeJhbQM4Sh0tJLANMzGelyv
         wk5NS7pN4xGXcJvY05Wn4KoJKN07o6FyBS2Q+55XArI+7MPB0F6VPjPDFURyHov8BURR
         lar7DtHC3gJ5RSWa1E4HYzLbjQZX4nN+QOAvrqUiBflmk+FySGoKxADND2ua+fZoyXgF
         1SMz6ksOapHx08BTRKjzV6uA0boTfH9qkRAkKdINtHPY2niCgpCiM5MNxA03YlpQ1IQW
         6XHA==
X-Forwarded-Encrypted: i=1; AHgh+RqE0Cd2lda+CX7TSSBD5kc6TQvBrwZFgFlqo+TzXygdtdBrgmkAEg7dFkECKbOZ0YMIOmiptYTuy0yI7Kw=@vger.kernel.org
X-Gm-Message-State: AFuF++m4KmC47nvDmXLygzu8HqOiQCKJTBn7Iy4iowRKF8MReqtheyA4
	NMiUEw3aBwImDoWoejqwF6TRgRiiQroU6QQw2yDa7ols2cIxaQcaAq5K
X-Gm-Gg: AYBFou2CcPwsg5GJ+MY1bD0FIMFPq7YJ+t99gxCCTFUrIUegmIgC67wSVuEirTJhJgO
	mHNKLUjxvjjLcFDgXn3+EHulVy5oBssFr8Hnr/m3yJlhk3uUjWwHjinZH3daSCt46qb3TLzICTi
	+UCQCY4+BLE/81K0HB9pwz3K8R0HmfuWSA+3W8o0StKtFR8Ico7/seoLmHJUGD8FATWhQbXLumv
	jHfrPrpWl3f20U8cHtRYVobR4rj8Eyhh5/Hht9C0CSUxXJv7bBDEQDxxtFBNU8rMGGbtog74Tty
	tNhSw3nzicL/uSXcwhe2ZB+49Ojo9AS7GNkLEpBiOCqlsDDBMtsJAUi/c492rLOjZjn0DRLvWO0
	QsrJxF+oDJLl9NJc5rm0/WrcdMpzSYZg2pyGCMS8E533k0cUMV8JUolcv6GPdCMaEE5nJcvHo2V
	+1YOAPdqBIr5GqvYwIWCT/QNHJvGWvjsQywq8OKjIHJY7LgH1M7Dg6vlW/5UkrrlNS3ShKFoM2k
	4mEhg2FppI8Iov92Yva64Aqf7/xZZqbHRDjEuKzMFASj/kskeOnQrqykt3i
X-Received: by 2002:a17:906:9f8c:b0:c25:833d:3839 with SMTP id a640c23a62f3a-c25833d3ad7mr25284766b.15.1787993986608;
        Sat, 29 Aug 2026 01:59:46 -0700 (PDT)
Received: from localhost ([188.234.148.119])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255f273e8bsm180812366b.62.2026.08.29.01.59.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 01:59:46 -0700 (PDT)
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
To: Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>
Cc: Wayne Lin <Wayne.Lin@amd.com>,
	ChiaHsuan Chung <chiahsuan.chung@amd.com>,
	Roman Li <roman.li@amd.com>,
	Rodrigo Siqueira <siqueira@igalia.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	sashiko-bot@kernel.org,
	Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Subject: [PATCH v2] drm/amd/display: add missing CRC engine 1 registers and masks for DCN3.2
Date: Sat, 29 Aug 2026 13:59:41 +0500
Message-ID: <20260829085941.106318-1-mikhail.v.gavrilov@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260829004608.25252-1-mikhail.v.gavrilov@gmail.com>
References: <20260829004608.25252-1-mikhail.v.gavrilov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Opening the CRTC CRC debugfs file on a DCN3.2 card triggers a WARN from
dc_helper.c on the first attempt after boot:

  WARNING: drivers/gpu/drm/amd/amdgpu/../display/dc/dc_helper.c:53 at
  set_reg_field_values.isra.0+0x30d/0x730 [amdgpu], CPU#1: cat/58468

Reproducer, on a fresh boot - the ASSERT is WARN_ON_ONCE, so it only fires
once per boot:

  echo crtc > /sys/kernel/debug/dri/<dev>/crtc-0/crc/control
  cat /sys/kernel/debug/dri/<dev>/crtc-0/crc/data > /dev/null

The WARN comes from the open(), not from the write to control:
crtc_crc_open() -> amdgpu_dm_crtc_set_crc_source() ->
amdgpu_dm_crtc_configure_crc_source() -> dc_stream_configure_crc() ->
optc1_configure_crc() -> generic_reg_update_ex() -> ASSERT(mask != 0).

Since commit ef45aaf73717 ("drm/amd/display: Configure all CRC engines in
pipe CRC source path") the pipe CRC source path iterates every CRC engine,
so crc_eng_inst = 1 now reaches optc1_configure_crc().  Its case 1 programs
OTG_CRC1_WINDOWA/WINDOWB_X/Y_CONTROL before enabling the engine, but DCN3.2
has neither the register entries nor the field masks for those four
registers, so the masks are zero and the ASSERT fires.

Engine 1 needs three sets of definitions to be usable: the enable bit,
the window registers that optc1_configure_crc() programs, and the data
registers that optc1_get_crc() reads back.  DCN3.2 has only the first,
added by commit c79354d12cb2 ("drm/amd/display: Fix CRC engine 1
enable/disable on DCN3.1.2+").  As a result engine 1 is enabled with its
windows never programmed, and a read through optc1_get_crc() case 1 would
address OTG_CRC1_DATA_RG and OTG_CRC1_DATA_B at MMIO offset 0.

Add the remaining two sets.  All six registers exist in hardware -
regOTG0_OTG_CRC1_WINDOWA_X_CONTROL is at 0x1b6f and
regOTG0_OTG_CRC1_DATA_RG at 0x1b73 in dcn_3_2_0_offset.h, with their
field masks in dcn_3_2_0_sh_mask.h.

Note that making case 1 return false instead would break CRC capture on
DCN3.2 entirely: the caller in amdgpu_dm_crtc_configure_crc_source() does
"ret = -EINVAL; goto unlock" on failure, so a card that warns but works
today would stop working.

The same entries are missing for DCN2.0, DCN3.0 and DCN3.1.  I have no such
hardware and have not touched them.

Fixes: ef45aaf73717 ("drm/amd/display: Configure all CRC engines in pipe CRC source path")
Signed-off-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Tested-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
---

v2: also add the CRC1 data registers and masks (OTG_CRC1_DATA_RG,
    OTG_CRC1_DATA_B), spotted by Sashiko AI review.  Engine 1 needs all
    three sets to be usable, and v1 supplied only the windows.
    Note that ordinary CRC capture through crtc-N/crc/data reads engine 0
    only (hardcoded in amdgpu_dm_crc.c); the engine 1 readout path is
    reached from the secure display code, which I am not able to exercise.

The six added SRI_ARR lines follow the space indentation used by every
line of the surrounding macro, hence the six checkpatch "no spaces at the
start of a line" warnings.  Using tabs there would misalign them against
their neighbours.  The added SF lines in dcn32_optc.h are tab indented,
matching that file.

 .../gpu/drm/amd/display/dc/optc/dcn32/dcn32_optc.h    | 11 +++++++++++
 .../amd/display/dc/resource/dcn32/dcn32_resource.h    |  6 ++++++
 2 files changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/optc/dcn32/dcn32_optc.h b/drivers/gpu/drm/amd/display/dc/optc/dcn32/dcn32_optc.h
index 60c01ec28b65..492760779226 100644
--- a/drivers/gpu/drm/amd/display/dc/optc/dcn32/dcn32_optc.h
+++ b/drivers/gpu/drm/amd/display/dc/optc/dcn32/dcn32_optc.h
@@ -146,6 +146,17 @@
 	SF(OTG0_OTG_CRC0_WINDOWB_X_CONTROL, OTG_CRC0_WINDOWB_X_END, mask_sh),\
 	SF(OTG0_OTG_CRC0_WINDOWB_Y_CONTROL, OTG_CRC0_WINDOWB_Y_START, mask_sh),\
 	SF(OTG0_OTG_CRC0_WINDOWB_Y_CONTROL, OTG_CRC0_WINDOWB_Y_END, mask_sh),\
+	SF(OTG0_OTG_CRC1_DATA_RG, CRC1_R_CR, mask_sh),\
+	SF(OTG0_OTG_CRC1_DATA_RG, CRC1_G_Y, mask_sh),\
+	SF(OTG0_OTG_CRC1_DATA_B, CRC1_B_CB, mask_sh),\
+	SF(OTG0_OTG_CRC1_WINDOWA_X_CONTROL, OTG_CRC1_WINDOWA_X_START, mask_sh),\
+	SF(OTG0_OTG_CRC1_WINDOWA_X_CONTROL, OTG_CRC1_WINDOWA_X_END, mask_sh),\
+	SF(OTG0_OTG_CRC1_WINDOWA_Y_CONTROL, OTG_CRC1_WINDOWA_Y_START, mask_sh),\
+	SF(OTG0_OTG_CRC1_WINDOWA_Y_CONTROL, OTG_CRC1_WINDOWA_Y_END, mask_sh),\
+	SF(OTG0_OTG_CRC1_WINDOWB_X_CONTROL, OTG_CRC1_WINDOWB_X_START, mask_sh),\
+	SF(OTG0_OTG_CRC1_WINDOWB_X_CONTROL, OTG_CRC1_WINDOWB_X_END, mask_sh),\
+	SF(OTG0_OTG_CRC1_WINDOWB_Y_CONTROL, OTG_CRC1_WINDOWB_Y_START, mask_sh),\
+	SF(OTG0_OTG_CRC1_WINDOWB_Y_CONTROL, OTG_CRC1_WINDOWB_Y_END, mask_sh),\
 	SF(OTG0_OTG_TRIGA_MANUAL_TRIG, OTG_TRIGA_MANUAL_TRIG, mask_sh),\
 	SF(GSL_SOURCE_SELECT, GSL0_READY_SOURCE_SEL, mask_sh),\
 	SF(GSL_SOURCE_SELECT, GSL1_READY_SOURCE_SEL, mask_sh),\
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.h b/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.h
index 68e7140f1505..fa8cc89cb3f7 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.h
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.h
@@ -1054,6 +1054,12 @@ unsigned int dcn32_get_max_hw_cursor_size(const struct dc *dc,
       SRI_ARR(OTG_CRC0_WINDOWA_Y_CONTROL, OTG, inst),                          \
       SRI_ARR(OTG_CRC0_WINDOWB_X_CONTROL, OTG, inst),                          \
       SRI_ARR(OTG_CRC0_WINDOWB_Y_CONTROL, OTG, inst),                          \
+      SRI_ARR(OTG_CRC1_DATA_RG, OTG, inst),                                    \
+      SRI_ARR(OTG_CRC1_DATA_B, OTG, inst),                                     \
+      SRI_ARR(OTG_CRC1_WINDOWA_X_CONTROL, OTG, inst),                          \
+      SRI_ARR(OTG_CRC1_WINDOWA_Y_CONTROL, OTG, inst),                          \
+      SRI_ARR(OTG_CRC1_WINDOWB_X_CONTROL, OTG, inst),                          \
+      SRI_ARR(OTG_CRC1_WINDOWB_Y_CONTROL, OTG, inst),                          \
       SR_ARR(GSL_SOURCE_SELECT, inst),                                         \
       SRI_ARR(OTG_TRIGA_MANUAL_TRIG, OTG, inst),                               \
       SRI_ARR(OTG_GLOBAL_CONTROL1, OTG, inst),                                 \
-- 
2.55.0

