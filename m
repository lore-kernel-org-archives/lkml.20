Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 963F7356767
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 00:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787964383; cv=none; b=EKYuHD9/X8iCUJ3oYxhYxcahoA9lXeXBOieEvx1FBzNhiIYMYsr7778CQyx8xcwBAPyApr/6IhNvJ4qD9fOlc9vLuitV45mX0Vj4j3GZJ/sH7XRxPDx5LZ802yyywdq6isTs5pgA2spQNI5wCWYOth59PalpOrCtQblQuISjot4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787964383; c=relaxed/simple;
	bh=kXYtZBBC1GPdm7z1AYO/8rMtwiGaLv/qcIzwVA2KxMg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=X9+hZq1p23y4h0rmRHnJPt2cV8arHDX3Xp3ceaAlqApC4h49O44lyiQAf+0rb53rXJvcMopjQfEfz7M7V+tvQbmVmErAwhQL05WC5kDNzhOtl9bmEapwrhz7PSV3I8MHIrQk0V39r5rLWYP+Rq+qhHXgAoTGML0XesQ8FoWCaNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iF0MzHpW; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iF0MzHpW"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c247f6687dcso270270766b.2
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 17:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787964378; x=1788569178; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LNgBCT7AcYnH8EZ4h37NHCshagsts35rqplG0HejEE4=;
        b=iF0MzHpWM4IzyLQxY/i7QljQFATCa+/Qx6i3/456X0badcSqvKERO/ok2Y/5jW20Wp
         HVgssIfjy0aG23otrAEY5s2SXmWLfVN6tf9WNzYfxxkqI1wQYL+phXhRezCU1M3bcNfs
         sEe7q+3MI2QQb42wa9TMDCV15zmpUPGVEJpIeqloitK8nlf6E8vQoEogzdmGGFu1PwVL
         zO6O6XgXLchLMSJKtxxXo77owjIgeehDsbSMpLoOjSI33VNkQyYqChpwL0Mul+P8OMAd
         JhgICSxq0talEcZT6DMqDSKXrTsmxX4cTvpsXk3EpByBHI11UOUAuD0v9utdSaN67uQC
         OdEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787964378; x=1788569178;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LNgBCT7AcYnH8EZ4h37NHCshagsts35rqplG0HejEE4=;
        b=h/A+5Gn+hRpEGJ6q93SUEGsLfL+5vmYimvo+oOqwGv0oGouW7cBWUym7oZwYFg1KIS
         QeXfkoz86MGGPCbQTnDBrpveweFMUNZTDKQOdRWyL7HBEIGJjly1t/eaTkq+L0LuZhqM
         Q9r1xxc7B1zwhKXt00StHUUIxC+yZY3UeNKs0ggvEeS3ZT4fJZ2CaJrnhtaAFoyk4Ahs
         b7HSVcVBIhG3zy8/KP+/ciHN2jYE2Pz5cX/V6rNluNYlWDY1vLExAil0yI7w+bpY3YSA
         lL6/mD6vTEn5tzXoI9/TTzVf8YZRVlWXvfbVCEJWNXt4BwkDbgdWMyrmomyB4Kq2TKR/
         Pmxw==
X-Forwarded-Encrypted: i=1; AHgh+Rri92pocZO8N2L1FIWJAhITJ7O390sref/qLqOoq2yU4jbvf9LbSqvVBpento+qvtS93ujZkdw0nWifqIc=@vger.kernel.org
X-Gm-Message-State: AFuF++n85x6ITRmRmPxU7zM9lr3qzNorOvul4fi7Hh6N8kQiW1uu5/E8
	7T90ne7/5blNFn9EssIhPccE2GaZU3vf4py5kp+utCh3iCo853ajFc6F
X-Gm-Gg: AR+sD128XnVZcYjNjW4lBzRRc/NmxFUwJtxoRRIyPIa4TQMZhiEn7rRFYVaWbN+55y9
	D2hr6/JM0gBbVw9xjpRsmnfHQ39cYCj6vA2N4NxnGzKVtaMhtrZr8bg1bY9nPgdmB8JQorBavMu
	qHGvrv4GqRy4MqofFT8l4Rdbuq0mL5DgH+rudteStST73tfifqeFJCaaye/ltLKLIbZ7Ilf+BpE
	4IoOcDpRHQck0hJAtcKa3KykSc9gEQocnxR5ZRNGrAhwDJMxlN0/7tKqwiUIr985AVmRNpVFbFG
	knzKkC+RYDJ+AVp6ehwAXky6ZnELGg/Y4NCpp37+fzjdbM5kpzs99T8VPGRA1+kJVj4FbzcqEIA
	lRjUYEzg1y8NHCwGHKTP5RlO+YBodl/mmuZU3f6ENmpm5pJtf++okUQqXRi6lDX+7BWAH0d7bt0
	vU3qFqh5kJywYrgEtQwlH2PQe8H41GTHFQXCqy0O8Qu190i0nCkmzRxev7yPrPI6eR0iPbCgxTd
	SzKBnDlX8qis3sakB3C/vB6jgpa/rAnW+POUYLOrxSQGcLcOmnSaljAWhmc
X-Received: by 2002:a17:907:805:b0:c25:61f4:b478 with SMTP id a640c23a62f3a-c2561f4e7f3mr480340066b.15.1787964378057;
        Fri, 28 Aug 2026 17:46:18 -0700 (PDT)
Received: from localhost ([188.234.148.119])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25613f8bc0sm128171966b.31.2026.08.28.17.46.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 17:46:16 -0700 (PDT)
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
	Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Subject: [PATCH] drm/amd/display: add missing CRC1 window registers and masks for DCN3.2
Date: Sat, 29 Aug 2026 05:46:08 +0500
Message-ID: <20260829004608.25252-1-mikhail.v.gavrilov@gmail.com>
X-Mailer: git-send-email 2.55.0
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

Commit c79354d12cb2 ("drm/amd/display: Fix CRC engine 1 enable/disable on
DCN3.1.2+") added the OTG_CRC1_EN mask for DCN3.2 and guarded the enable
write, but not the window writes above it.  As a result engine 1 is now
enabled on DCN3.2 with its windows never programmed.

The registers exist in hardware - regOTG0_OTG_CRC1_WINDOWA_X_CONTROL is at
0x1b6f in dcn_3_2_0_offset.h with its field masks in dcn_3_2_0_sh_mask.h -
so add the missing SRI_ARR and SF entries.

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

The four added SRI_ARR lines follow the space indentation used by every
line of the surrounding macro, hence the four checkpatch "no spaces at the
start of a line" warnings.  Using tabs there would misalign them against
their neighbours.  The added SF lines in dcn32_optc.h are tab indented,
matching that file.

Tested on a Radeon RX 7900 XTX (Navi 31, DCN3.2): after this patch the
reproducer above leaves dmesg clean, and CRC capture on engine 0 still
delivers a full 120 frames per second.

 drivers/gpu/drm/amd/display/dc/optc/dcn32/dcn32_optc.h    | 8 ++++++++
 .../drm/amd/display/dc/resource/dcn32/dcn32_resource.h    | 4 ++++
 2 files changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/optc/dcn32/dcn32_optc.h b/drivers/gpu/drm/amd/display/dc/optc/dcn32/dcn32_optc.h
index 60c01ec28b65..f696e4ee3bc6 100644
--- a/drivers/gpu/drm/amd/display/dc/optc/dcn32/dcn32_optc.h
+++ b/drivers/gpu/drm/amd/display/dc/optc/dcn32/dcn32_optc.h
@@ -146,6 +146,14 @@
 	SF(OTG0_OTG_CRC0_WINDOWB_X_CONTROL, OTG_CRC0_WINDOWB_X_END, mask_sh),\
 	SF(OTG0_OTG_CRC0_WINDOWB_Y_CONTROL, OTG_CRC0_WINDOWB_Y_START, mask_sh),\
 	SF(OTG0_OTG_CRC0_WINDOWB_Y_CONTROL, OTG_CRC0_WINDOWB_Y_END, mask_sh),\
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
index 68e7140f1505..30878aed61e1 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.h
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.h
@@ -1054,6 +1054,10 @@ unsigned int dcn32_get_max_hw_cursor_size(const struct dc *dc,
       SRI_ARR(OTG_CRC0_WINDOWA_Y_CONTROL, OTG, inst),                          \
       SRI_ARR(OTG_CRC0_WINDOWB_X_CONTROL, OTG, inst),                          \
       SRI_ARR(OTG_CRC0_WINDOWB_Y_CONTROL, OTG, inst),                          \
+      SRI_ARR(OTG_CRC1_WINDOWA_X_CONTROL, OTG, inst),                          \
+      SRI_ARR(OTG_CRC1_WINDOWA_Y_CONTROL, OTG, inst),                          \
+      SRI_ARR(OTG_CRC1_WINDOWB_X_CONTROL, OTG, inst),                          \
+      SRI_ARR(OTG_CRC1_WINDOWB_Y_CONTROL, OTG, inst),                          \
       SR_ARR(GSL_SOURCE_SELECT, inst),                                         \
       SRI_ARR(OTG_TRIGA_MANUAL_TRIG, OTG, inst),                               \
       SRI_ARR(OTG_GLOBAL_CONTROL1, OTG, inst),                                 \
-- 
2.55.0

