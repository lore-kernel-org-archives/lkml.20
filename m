Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20FBC450402
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 12:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788523251; cv=none; b=cesuSfzY5a54Z5WXVNgkWNpyaqbMgf2Xow4djqIK+3QrWlUhaOOrH3H45LdPHdAodzXwCeqd2Co7SUiTOZqyw8b4cqhbQUPCOU2vu3Vm9GXY5xM0e3Hn8ekxPZ2jNeV14zjvW2EVwRiDQJvlO0ApMsrqNWlLSe90k1wq3J+Vizk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788523251; c=relaxed/simple;
	bh=tgzbIPgObNfzTqdWukG3gJH+qDh8mkR4mmdrDFn52SE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dtO0cGUdEKm0NZkf7T/3L0gNvSSQWIqEgCUrIpFFpTuivc38fHpMW2gyIN0/h+vhW0uHgc63I8ZBxT4NqtAX7FIsYclBVteZq1dYioBom2BAuZdoDLEppHxEOS6krBOrFsvye0MVKdv3BWsL3hAcTZ2/KJuoM5RDE44IESuIKUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hAMHBPxm; arc=none smtp.client-ip=209.85.161.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hAMHBPxm"
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-6aa9606ddadso654345eaf.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 05:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788523249; x=1789128049; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Cdwh6y3M+pLav29KCQa8Qo6nyd9KjrKDGE7FGjYXep8=;
        b=hAMHBPxm75d3BcXYKxis74S7KGOihMxhRYCH91T4mkyxwsEzDzYkP/9CY1w1mD/2ZP
         mF1sorwoudWxnvfAylsb0gJMqt17pMmhOmw0xQZtQd1Za4qoOSOYzHFOgnleUoppdF3b
         omazehEKgWLZRiZLpdrDoj2XruRoBBESCNpgzdH3TIVoXMPfHMa61i+S2tQGViJ8iQDD
         zF1VkzDAs6hiReUBiMr3ciJCk8sOGU4q1eb9cwU7DrjwHtCBhpQVhl0CY66kPIuDv2aY
         WR+n7UKJqlU54xtSAmAeZ27wZZTCcYSVxr9Vcs8qIrVoaygvweFyLAilA/HusRixzG5q
         Eajw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788523249; x=1789128049;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Cdwh6y3M+pLav29KCQa8Qo6nyd9KjrKDGE7FGjYXep8=;
        b=pGnW/tmnIaCYYyv6pR7DcBpxB6jmCAUoJwrPnzyM6gwORsmzbKzSH1y/pZHttqJEvp
         lk5k7sMkHL41sA8W7BNNS86X5I0Xhuf7dKIiaEa2jorMoxpTctPTai/q+zbiFBNxnreZ
         8a7oMd+P+6kyvTta/NxH5tmpk01BIywTiFnx4jrE20KSIpRvoy9k+aAJUoTgu2kS5XCS
         QYMSpeRpTv3bpqzuzjxB1DkhgJkipq/yRdMTRCnSGfVLKWkdXU8vwb46hWyzC3vQNEt0
         IannQwNd1yT//wOQ3c2JKbe3IivUx2y2fTvZmfWPEOkE4z5PzCS1wQNxvTjanQW3rOVD
         AaMw==
X-Gm-Message-State: AFuF++mKyXtYsekcnM1tSZ8B5Y5bwUHks0yh69XaCmXMR1yDCQR8EkkD
	A90KlCfMa71LuD9dFFT3ZAD+6phC67hSioEkUTWAnvOQZ5vHCQ4+k/wQDVcOnKXapmA=
X-Gm-Gg: AYBFou1MX1oJAWphUv24bZ7QNygngcEO/h0GpET6pVwvxhnGzj/3YwufA652zSiJMw2
	waqBCOVv8FMGDjgWb1Bpvb/PcJuTPY9QV+oIpVm4hdPmMuQt1feGqJRjRLkN6n9zoTynXMm//Na
	aPNtzxYArXEtxEH5KZ+d30c+nFITYixYuUKrn/Hi0r7zMTfOR3pwg0EwtvT2Z5V+D/sGIBCx7fz
	gCfmFZ7pST6GjXZ25Rgulk28oN+SFndHHufWNAu28nKOV6nPOrmoRQKbVAaaTYad7DQG/WcwmCi
	ClcH2idlmZ4A20aT4pV6Tm1fMdF3scP50p4Mf4gkKT2z+zAEFpROdEV/smNWZp+4nCq9a56mV8M
	BXPYv519NmdIwJeJzkwq93V8UBzPHXCnJkV2FZWGjzZWBt8iCEnHnHytNEln8ge6or3ofV+Iwr1
	flwqHHY2kZWy5gHhse9aaMGmt6dY389kF9J3flaZZWQQ0+dv4IIjlMbIWGw+SU6h1TOLam2aKkA
	j13yI5DkekoArQx57Lgx1k3RQ==
X-Received: by 2002:a05:6820:3107:b0:6b7:8415:d786 with SMTP id 006d021491bc7-6b78425d662mr1220467eaf.49.1788523248229;
        Fri, 04 Sep 2026 05:00:48 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14324356931sm10164241c88.4.2026.09.04.05.00.46
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 05:00:47 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: 
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] drm: fix typos and repeated words in comments
Date: Fri,  4 Sep 2026 17:30:06 +0530
Message-ID: <20260904120044.14303-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This corrects 3 misspellings and repeated words in comments.  Each is a
separate patch so that any one of them can be dropped without touching
the rest.

Nothing outside comments changes.  Every touched C file was checked by
dropping its comments, replacing each string literal with a placeholder
and collapsing whitespace; what remained was identical before and after,
so the compiled code cannot differ.

The mistakes were found with scripts/checkpatch.pl against the list in
scripts/spelling.txt.  The scanning, the edits and the changelogs were
produced with Cursor running the claude-opus-5 model, from a request to
find and fix spelling mistakes across the tree, and every correction was
then re-checked by the comparison described above.  Words that name an
identifier were left alone deliberately, even when they read as typos,
because correcting the prose would make the comment disagree with the
code it describes.

Tested by building x86_64 defconfig at v7.3-rc1-269-gbc35965f6940, which
is clean.  Nothing else was built, so any patch touching code that
x86_64 defconfig does not compile has been read but not compiled.

Hemanth Selam (3):
  drm: fix typos in comments
  drm/amd: fix repeated words in comments
  drm/amdgpu: fix typo in log message

 drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c  |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c       |  4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c      |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c       |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c       |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c       |  4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ih.c        |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.h       |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_pll.c       |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c       |  4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_rap.c       |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c       |  4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c     |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_umc.h       |  2 +-
 drivers/gpu/drm/amd/amdgpu/cik.c              |  2 +-
 drivers/gpu/drm/amd/amdgpu/cik_sdma.c         |  2 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c        |  2 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c         |  2 +-
 drivers/gpu/drm/amd/amdgpu/gfxhub_v11_5_0.c   |  2 +-
 drivers/gpu/drm/amd/amdgpu/gfxhub_v12_0.c     |  2 +-
 drivers/gpu/drm/amd/amdgpu/gfxhub_v2_1.c      |  2 +-
 drivers/gpu/drm/amd/amdgpu/gfxhub_v3_0.c      |  2 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c         |  2 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c         |  2 +-
 drivers/gpu/drm/amd/amdgpu/ih_v6_0.c          |  2 +-
 drivers/gpu/drm/amd/amdgpu/ih_v6_1.c          |  2 +-
 drivers/gpu/drm/amd/amdgpu/ih_v7_0.c          |  2 +-
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c        |  2 +-
 drivers/gpu/drm/amd/amdgpu/mes_v12_0.c        |  4 +-
 drivers/gpu/drm/amd/amdgpu/mes_v12_1.c        |  4 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v1_0.c       |  2 +-
 drivers/gpu/drm/amd/amdgpu/mmhub_v2_3.c       |  2 +-
 drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c         |  4 +-
 drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c         |  4 +-
 drivers/gpu/drm/amd/amdgpu/psp_gfx_if.h       |  4 +-
 drivers/gpu/drm/amd/amdgpu/ta_xgmi_if.h       |  2 +-
 drivers/gpu/drm/amd/amdgpu/umc_v6_1.h         |  2 +-
 drivers/gpu/drm/amd/amdgpu/umc_v6_7.c         |  2 +-
 drivers/gpu/drm/amd/amdgpu/umc_v6_7.h         |  2 +-
 drivers/gpu/drm/amd/amdgpu/umc_v8_10.h        |  2 +-
 drivers/gpu/drm/amd/amdgpu/umc_v8_7.h         |  2 +-
 drivers/gpu/drm/amd/amdgpu/uvd_v4_2.c         |  2 +-
 drivers/gpu/drm/amd/amdgpu/uvd_v5_0.c         |  2 +-
 drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c         |  4 +-
 drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c         |  6 +-
 drivers/gpu/drm/amd/amdgpu/vce_v1_0.c         |  2 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c         |  6 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c         |  4 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c         |  2 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c         |  2 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c         |  2 +-
 drivers/gpu/drm/amd/amdgpu/vi.c               |  2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c      |  2 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  2 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_irq.h |  2 +-
 .../amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c |  2 +-
 .../display/dc/clk_mgr/dcn301/vg_clk_mgr.c    |  2 +-
 .../display/dc/clk_mgr/dcn31/dcn31_clk_mgr.c  |  2 +-
 .../dc/clk_mgr/dcn314/dcn314_clk_mgr.c        |  2 +-
 .../display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c  |  2 +-
 .../gpu/drm/amd/display/dc/core/dc_resource.c |  2 +-
 drivers/gpu/drm/amd/display/dc/dc.h           |  2 +-
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c  |  2 +-
 drivers/gpu/drm/amd/display/dc/dc_types.h     |  2 +-
 .../gpu/drm/amd/display/dc/dce/dce_audio.c    |  8 +--
 drivers/gpu/drm/amd/display/dc/dce/dce_dmcu.c |  2 +-
 .../drm/amd/display/dc/dce/dce_link_encoder.h |  2 +-
 drivers/gpu/drm/amd/display/dc/dce/dce_opp.c  |  4 +-
 .../amd/display/dc/dce/dce_stream_encoder.c   |  4 +-
 .../dc/dce110/dce110_timing_generator.c       |  2 +-
 .../gpu/drm/amd/display/dc/dcn20/dcn20_vmid.c |  2 +-
 .../display/dc/dio/dcn10/dcn10_link_encoder.h |  2 +-
 .../drm/amd/display/dc/dml/calcs/dcn_calcs.c  |  2 +-
 .../dc/dml/dcn30/display_mode_vba_30.c        |  2 +-
 .../dc/dml/dcn31/display_mode_vba_31.c        |  4 +-
 .../drm/amd/display/dc/dml/dcn32/dcn32_fpu.c  |  2 +-
 .../dc/dml2_0/display_mode_core_structs.h     |  2 +-
 .../dml2_0/dml21/dml21_translation_helper.c   |  2 +-
 .../display/dc/dml2_0/dml21/dml21_wrapper.h   |  2 +-
 .../dc/dml2_0/dml21/inc/dml_top_types.h       |  2 +-
 .../src/dml2_core/dml2_core_dcn4_calcs.c      | 12 ++--
 .../dml2_core/dml2_core_dcn5_calcs_dchub.c    |  8 +--
 .../dml2_core_dcn5_calcs_dsc_latency.c        |  8 +--
 .../dml2_0/dml21/src/dml2_mcg/dml2_mcg_dcn4.c |  2 +-
 .../alternate_pstate_shared_lib.c             |  4 +-
 .../dml21/src/dml2_top/dml2_top_soc15.c       |  4 +-
 .../dml2_0/dml21/src/dml2_top/dml2_top_utm.c  |  2 +-
 .../src/inc/dml2_internal_shared_types.h      |  2 +-
 .../amd/display/dc/dml2_0/dml2_mall_phantom.c |  2 +-
 .../dc/gpio/dcn315/hw_factory_dcn315.c        |  2 +-
 .../display/dc/gpio/dcn32/hw_factory_dcn32.c  |  2 +-
 .../amd/display/dc/hubp/dcn401/dcn401_hubp.c  |  2 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h   |  8 +--
 .../dc/link/protocols/link_dp_capability.c    |  4 +-
 .../link/protocols/link_edp_panel_control.c   |  4 +-
 .../drm/amd/display/dc/opp/dcn10/dcn10_opp.c  |  2 +-
 .../amd/display/dc/optc/dcn401/dcn401_optc.c  |  2 +-
 .../dc/resource/dcn20/dcn20_resource.c        |  2 +-
 .../dc/resource/dcn30/dcn30_resource.c        |  2 +-
 .../dc/resource/dcn301/dcn301_resource.c      |  2 +-
 .../dc/resource/dcn302/dcn302_resource.c      |  2 +-
 .../dc/resource/dcn303/dcn303_resource.c      |  2 +-
 .../dc/resource/dcn31/dcn31_resource.c        |  2 +-
 .../dc/resource/dcn314/dcn314_resource.c      |  2 +-
 .../dc/resource/dcn315/dcn315_resource.c      |  4 +-
 .../dc/resource/dcn316/dcn316_resource.c      |  2 +-
 .../dc/resource/dcn32/dcn32_resource.c        |  4 +-
 .../dc/resource/dcn321/dcn321_resource.c      |  2 +-
 .../dc/resource/dcn35/dcn35_resource.c        |  2 +-
 .../dc/resource/dcn351/dcn351_resource.c      |  2 +-
 .../dc/resource/dcn36/dcn36_resource.c        |  2 +-
 .../dc/resource/dcn401/dcn401_resource.c      |  2 +-
 .../dc/resource/dcn60/dcn60_resource.c        |  6 +-
 .../gpu/drm/amd/display/dmub/src/dmub_srv.c   |  4 +-
 .../display/include/grph_object_ctrl_defs.h   |  2 +-
 drivers/gpu/drm/amd/include/atombios.h        | 56 +++++++++----------
 drivers/gpu/drm/amd/include/atomfirmware.h    |  2 +-
 drivers/gpu/drm/amd/include/mes_v11_api_def.h |  2 +-
 drivers/gpu/drm/amd/include/pptable.h         |  2 +-
 drivers/gpu/drm/amd/pm/amdgpu_pm.c            | 16 +++---
 .../gpu/drm/amd/pm/legacy-dpm/legacy_dpm.c    |  2 +-
 .../amd/pm/powerplay/hwmgr/hardwaremanager.c  |  4 +-
 .../drm/amd/pm/powerplay/hwmgr/vega20_hwmgr.c |  2 +-
 .../drm/amd/pm/powerplay/smumgr/ci_smumgr.c   |  2 +-
 .../pm/powerplay/smumgr/polaris10_smumgr.c    |  2 +-
 .../drm/amd/pm/powerplay/smumgr/smu7_smumgr.c |  4 +-
 .../amd/pm/powerplay/smumgr/tonga_smumgr.c    |  4 +-
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c     |  2 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h |  6 +-
 .../inc/pmfw_if/smu11_driver_if_arcturus.h    |  2 +-
 .../inc/pmfw_if/smu11_driver_if_navi10.h      |  2 +-
 .../inc/pmfw_if/smu13_driver_if_v13_0_0.h     |  4 +-
 .../swsmu/inc/pmfw_if/smu14_driver_if_v14_0.h |  4 +-
 .../inc/pmfw_if/smu15_driver_if_v15_0_8.h     |  2 +-
 .../gpu/drm/amd/pm/swsmu/smu12/renoir_ppt.c   |  2 +-
 .../drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c  |  2 +-
 .../drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c  |  2 +-
 .../drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c  |  2 +-
 .../drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.c  |  2 +-
 drivers/gpu/drm/radeon/atombios.h             | 34 +++++------
 drivers/gpu/drm/radeon/cik.c                  | 14 ++---
 drivers/gpu/drm/radeon/evergreen.c            |  4 +-
 drivers/gpu/drm/radeon/pptable.h              |  2 +-
 drivers/gpu/drm/radeon/r600.c                 |  6 +-
 drivers/gpu/drm/radeon/r600_dpm.c             |  2 +-
 drivers/gpu/drm/radeon/radeon.h               |  2 +-
 drivers/gpu/drm/radeon/radeon_cs.c            |  2 +-
 drivers/gpu/drm/radeon/radeon_device.c        | 16 +++---
 drivers/gpu/drm/radeon/radeon_display.c       |  2 +-
 drivers/gpu/drm/radeon/radeon_drv.c           |  2 +-
 drivers/gpu/drm/radeon/radeon_fence.c         |  4 +-
 drivers/gpu/drm/radeon/radeon_gem.c           |  2 +-
 drivers/gpu/drm/radeon/radeon_legacy_crtc.c   |  4 +-
 drivers/gpu/drm/radeon/radeon_uvd.c           |  2 +-
 drivers/gpu/drm/radeon/radeon_vm.c            |  2 +-
 drivers/gpu/drm/radeon/rs690.c                |  4 +-
 drivers/gpu/drm/radeon/rs780_dpm.c            |  2 +-
 drivers/gpu/drm/radeon/rv770.c                |  2 +-
 drivers/gpu/drm/radeon/si.c                   |  2 +-
 drivers/gpu/drm/radeon/uvd_v1_0.c             |  4 +-
 160 files changed, 281 insertions(+), 281 deletions(-)

-- 
2.48.1

