Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F46B30594E
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 21:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787952140; cv=pass; b=fInFZBoHhLP5tvMjGDwkdZZyueAnZhKUWaoy7JcrtvVJX8TsU2hqLgV2g+4KRN0PfIkmrYg5Xrz5MHyBAXB8Fmo6UwXeW2XSrFJHvyZG3pvoZetnaBRlZSNiqGJ/HmEmNaaadb3A4MbaUQv+Sox/6zX/hLFSZh4OFArOzv4XF2Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787952140; c=relaxed/simple;
	bh=gDmjHIdX2lfuAcC0wfm+D5aL/S8lRLME+w08nSUwRws=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=OwwE4hl4h+egV5m+pMb9o5Cpmv27xCcbmycZYl+Cxb70UpeleFApfZOEyI13hg2mfZ249TKmc1LB+o1gH22VVVjnIVnfvOGVFOqb+6aqVfwbDGF08SGtmhegoVWPdaSQ1s5/nK2jJRV4e7AZRVUuSU/ahyNpFOI6psjfQVPJL7c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hyKbqAny; arc=pass smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hyKbqAny"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-81f3b227a4aso26071507b3.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 14:22:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787952137; cv=none;
        d=google.com; s=arc-20260327;
        b=iHz8S5NVgAmtFjMvsmfPPSZ5lAvt6ktufU0r0vunUdpwq8saCm6NJA+l6npL5NkD9T
         iz+lG36zaDrgyNwIVptb8OBUGAl1xjJEQyqUFozcpyv2Bbnq3VVcGBmOwr18iYWMhRZ1
         Cf5XL6kdx0lyME1cSvP+c9GzbHpnI5e9ZDhOKURawMlHYqHKcsIUGOMM/bEMxj4HMZr2
         j17I1b3Yopz6M3MDGBOrpqdm0C52MjhmPu9IZ68fa2M4H5udjfAw0ZoUJfvpuEC0xAbS
         uny4Dya1v8UUjKDrf/qkA4jD7ghXqVdb5zgZKlp9XRKvGQ1A5XCmzzfpkmCTObSVTMFF
         uyZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=IXO/C5b1kCXKVcILMirRzS2H3/uoBwdknKJoLUq7lIM=;
        fh=cRyv5rW+1YAJFIAPyrKpambcMjON1JYct/MMZv78hSY=;
        b=Ee3MpD8PlKWhLXB1OFW92EC/F2o6nJV0AVrlxT2d4CMmwn7PWNtuwdiF4tYO8mahrZ
         hTImorEC0h5PW9ywZW13/pXXZp2thXpRTMUvwFQeVsxj1cUKJGwkboJomLjmZyxGIjDP
         8/k9X7hlc3SiqiWTzyso7U9+YdV9A6PY70/2WWmY061wVb2p+AJFCATrNFDAb89U53Pi
         qSrxc0sIb8XCVkH8GxvsGdyEdz9fqsMR7OGN/71AfH3jiWzY8IZbKWKZzbFDtYM8EdNz
         2qwiJ8L//IBRci8LR75BejMaHUmBmowJkp9EibwxNDoImuU0PXKnzSYlGCaBack0ufBF
         tIoA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787952137; x=1788556937; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IXO/C5b1kCXKVcILMirRzS2H3/uoBwdknKJoLUq7lIM=;
        b=hyKbqAnyupoFS5IKage9yOUPnibza/r8reR33/bKwI6ru3+dR0ikNEUeMFXQ5wEewR
         W9BcQ+lN4oCpyUnlTY0kq8+DpfyeK2mzblGWkiQGf1p+YSM9ojAyANjfQ+6uRcvloy1z
         b9Rex3Rc8ih5fyy1h+nzYkgmdbopd3aA3gIeS+ss9ibZnHaLw9ALxgvj2+npAAm3+Jib
         vnmPjHzNbhPHzmKHmaE/thV6CH0jjbSZwx0c5fa9p9LPNkdA2pLQnB+zGT4LmtbR4WZB
         IUeNuWUO4StXtwlJKFZToGxUs10WYXVYyk6Ed0VoDDIigQSyqDIsTIcEIApAxocokWJi
         dF1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787952137; x=1788556937;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IXO/C5b1kCXKVcILMirRzS2H3/uoBwdknKJoLUq7lIM=;
        b=R0UwoxgnSn3GLffFfd23d0vZufbY6mbpWndKDGbA95v1/XrrpIMM3hP21LTTq/K1LA
         y0qEf7dgJkHcZpOz3pbk0RzqBO20jtEXssZ5pOxywFMMybQ9TsBwDMyfPNWy3iXDPZwi
         k7gCM8NRfgggoELLxhw+OGzp8tCGJmvfrwcjfXNS3VBAWZyTUV4+v8qzn9v3NdwCEbEC
         YlVFFNYK2dDdyvbaJQqHVabJaa3LOaY7TymkWioRXlBIm5StHfc+Oe2cXMIp6fNFhKdE
         4744P3UFO9ql4erSjYvpPGD1cohQg9UvvcNYevISnwK/wcMElxcwU+y1koCsW+JlF/5u
         IgSA==
X-Forwarded-Encrypted: i=1; AKwUvBwtRpRujVWz6EBaECfMgoW+nMOdBQgwyHJtTUKUaOrHOA9mhwPbdyQxVRdIBbeRjCn0f+27ERpVyPtRiDE=@vger.kernel.org
X-Gm-Message-State: AFuF++nuzcuzGKjSrXSxmM8Q97BVYnYTCXgNTFWMT+6SzOAUbXFJUg6/
	bds6YOWAXC8+Urc+80QFx0n0VCNKQtIDvXkZ3yHMfwuGgs7r6cSMUmd3zvNwEESWA2gvGvR6Mov
	msvNipwCXkS/Qzjo91FqCSnG7f4ATew8PfllK
X-Gm-Gg: AYBFou1OdNbnptcOm+b8A2qHBuwXXWJ1DhhVsikEjM62LqtsaN5xWmleMPlvTgSHflw
	uiGFEcsV1fzW6UFTXWvuwWY5H+JWmSSEdoBP9L6IA0SAqoZUXQaG2DvDnFyOdCoJLLfIFwQEtU5
	N1e8+XqZHwyTShrttYaXmSF0baF0oGIfVVYXt02ONEm8oiX9jsJDgAGTxD7EFWGlNq5lCPeHmen
	WFOTwnqXblfMkF7p2gUW9b1mbfLukjxg1UtjxaGut8qPnt16IZBgV9mk9ichlkNUS+cXVs9Wemj
	vzH1l01GhN1eS/QJbXh09OOdHNldgYJKgAzm9NWpab/r1wNYOyh2QExaEXl/6uNyW40Z/4mkNi/
	DtHl57apeMYAUOAd8dOlV1TCt3IZYkA==
X-Received: by 2002:a05:690c:ed2:b0:81c:b834:47de with SMTP id
 00721157ae682-85d6cdc685dmr48769807b3.18.1787952137253; Fri, 28 Aug 2026
 14:22:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Sat, 29 Aug 2026 07:22:05 +1000
X-Gm-Features: AcwNN1XzuNTM0TnOrEtxd-vdXEmXi530HkvVODNUyc6FGFYkMXrFWZSlhaADmpc
Message-ID: <CAPM=9tz+KjNRJzYWKA-snStcyh8HpXEbCfWw_zwqEUQ+hANcdg@mail.gmail.com>
Subject: [git pull] drm next / fixes for 7.3-rc1
To: Linus Torvalds <torvalds@linux-foundation.org>, Sima Vetter <sima@ffwll.ch>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Linus,

As mentioned last week, an msm pull request fell down the side of the
couch or whatever the email equivalent of that is. This has the msm
next stuff + the usual fixes for amd/intel.

Regards,
Dave.

drm-next-2026-08-29:
drm next/fixes for 7.3-rc1

core:
- use drm_warn instead of warn

msm:
- Bindings:
  - Added Shikra support
  - Document a840, a704, a722
- Core:
  - Use drm_client buffers for fbdev emulation
  - teardown fixes
  - ARM32 DMA fixup
  - Remove objects from evict list when re-validated
  - Bunch of corner case and error path fixes
- DPU:
  - Dropped dev_pm_opp_set_rate(0) preventing burnout
  - Fixed SSPP offsets of Kaanapali
- DP:
  - Dropped dev_pm_opp_set_rate(0) preventing burnout
  - Cleaned up core code in preparation for MST support
  - Fixed prepare() to let Pipewire continue in case of the unplugged cable
- GPU:
  - Add support for a704
  - Add support for a722
- HDMI:
  - Simplifed register access

amdgpu:
- eGPU fixes
- Runtime PM fix
- UserQ fixes
- Backlight fix
- Discovery sysfs fix
- Reset handling fixes
- Buffer func handling fix for xgmi
- VCN boundary check fix
- DC lut handling fixes
- MES fixes
- UVD fix
- VCE 3 fix
- Enforce isolation fix
- HPD fix for VGA/LVDS
- DML fix
- DCN 6 fixes
- DC gpu reset fix

amdkfd:
- Fix return value
- CU occupancy for GFX 11
- CU occupancy for GFX 12/12.1
- Queue bounds checking fix
- SVM fixes
- CRIU bounds checking fix

radeon:
- iMac display fix

xe:
- error message cleanups
- i2c global register definitions as dependency for xe/i2c fixes
- Media workardound
- Add CCS to gt_idle debugfs print
- Page fault related fix
- i2c related fixes
- System Controller mailbox bit fix
The following changes since commit c44e278ce02efd0c4be79a8eda1ea6885c1ce5ec=
:

  BackMerge tag 'v7.2' into drm-next (2026-08-20 10:58:44 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/kernel.git tags/drm-next-2026-08-29

for you to fetch changes up to a8b02aa825803e6c5b6b27340f583900afa0861d:

  Merge tag 'amd-drm-next-7.3-2026-08-27' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next (2026-08-28
13:31:33 +1000)

----------------------------------------------------------------
drm next/fixes for 7.3-rc1

core:
- use drm_warn instead of warn

msm:
- Bindings:
  - Added Shikra support
  - Document a840, a704, a722
- Core:
  - Use drm_client buffers for fbdev emulation
  - teardown fixes
  - ARM32 DMA fixup
  - Remove objects from evict list when re-validated
  - Bunch of corner case and error path fixes
- DPU:
  - Dropped dev_pm_opp_set_rate(0) preventing burnout
  - Fixed SSPP offsets of Kaanapali
- DP:
  - Dropped dev_pm_opp_set_rate(0) preventing burnout
  - Cleaned up core code in preparation for MST support
  - Fixed prepare() to let Pipewire continue in case of the unplugged cable
- GPU:
  - Add support for a704
  - Add support for a722
- HDMI:
  - Simplifed register access

amdgpu:
- eGPU fixes
- Runtime PM fix
- UserQ fixes
- Backlight fix
- Discovery sysfs fix
- Reset handling fixes
- Buffer func handling fix for xgmi
- VCN boundary check fix
- DC lut handling fixes
- MES fixes
- UVD fix
- VCE 3 fix
- Enforce isolation fix
- HPD fix for VGA/LVDS
- DML fix
- DCN 6 fixes
- DC gpu reset fix

amdkfd:
- Fix return value
- CU occupancy for GFX 11
- CU occupancy for GFX 12/12.1
- Queue bounds checking fix
- SVM fixes
- CRIU bounds checking fix

radeon:
- iMac display fix

xe:
- error message cleanups
- i2c global register definitions as dependency for xe/i2c fixes
- Media workardound
- Add CCS to gt_idle debugfs print
- Page fault related fix
- i2c related fixes
- System Controller mailbox bit fix

----------------------------------------------------------------
Abhinav Kumar (5):
      drm/msm/dp: break up dp_display_enable into two parts
      drm/msm/dp: re-arrange dp_display_disable() into functional parts
      drm/msm/dp: allow dp_ctrl stream APIs to use any panel passed to it
      drm/msm/dp: split dp_ctrl_off() into stream and link parts
      drm/msm/dp: make bridge helpers use dp_display to allow re-use

Aditya Sherawat (2):
      drm/msm/adreno: Add support for A704 GPU
      dt-bindings: display/msm/gpu: Add support for A704 GPU

Akhil P Oommen (3):
      dt-bindings: display/msm: gpu: Document Adreno 840
      drm/msm/a6xx: Rename GBIF_CX_CONFIG to a A6XX- variant register
      dt-bindings: arm-smmu: Document GPU SMMU for Eliza SoC

Akhmed Zhitaev (1):
      drm/amd/display: Scale custom brightness curve from full range

Alex Deucher (1):
      drm/amdgpu: handle pipeline sync without a VM fence

Alexandre MINETTE (1):
      drm/msm/a3xx: Drain VBIF before GPU suspend

Anna Maniscalco (1):
      drm/msm: remove objects from evit list after pinning them

Anoop Vijay (1):
      drm/xe/sysctrl: Read mailbox phase bit from hardware

Arvind Yadav (1):
      drm/xe: Reject page faults from non-fault-mode scratch VMs

Balasubramani Vivekanandan (1):
      drm/xe/xe_gt_idle: Add CCS to the powergating info print

Bibek Kumar Patro (1):
      dt-bindings: arm-smmu: Document GPU SMMU for Shikra SoC

Bob Zhou (1):
      drm/amdgpu: avoid force-completing uninitialized UVD rings

Dan Carpenter (2):
      drm/msm/adreno: fix use after free on error path in a6xx_gpu_init()
      drm/xe: tests: fix error message in xe_migrate_sanity_test()

Daniele Ceraolo Spurio (1):
      drm/xe: Do not apply WA 14025883347 to media 3503

Dave Airlie (6):
      Merge tag 'amd-drm-next-7.3-2026-08-19' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next
      Merge tag 'drm-misc-next-fixes-2026-08-20' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-next
      Merge tag 'drm-msm-next-2026-08-01' of
https://gitlab.freedesktop.org/drm/msm into drm-next
      Merge tag 'drm-xe-next-fixes-2026-08-20' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-next
      Merge tag 'drm-xe-next-fixes-2026-08-27' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-next
      Merge tag 'amd-drm-next-7.3-2026-08-27' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next

David (Ming Qiang) Wu (1):
      drm/amdgpu/vcn: fix integer overflow in dec_msg buffer count check

David Belanger (3):
      drm/kfd: Add CU occupancy support to GFX11
      drm/kfd: Add CU occupancy support to GFX12
      drm/kfd: Add CU occupancy support to GFX12.1

David Rosca (1):
      drm/amdgpu: Fix VCE 3 ring align_mask

Dmitry Baryshkov (5):
      Revert "drm/msm: dsi: fix PLL init in bonded mode"
      drm/msm: don't tear down KMS twice when KMS init fails
      drm/msm/dp: reject YUV420-only modes without VSC SDP support
      drm/msm/dp: do not reject wide-bus modes while a YUV420 mode is activ=
e
      drm/msm: detach the ARM DMA mapping before attaching our own domain

Gilles Risch (1):
      drm/radeon: fix internal display on iMac11, 1 (RV770/DCE3.1)

Guangshuo Li (1):
      drm/amdgpu: fix autosuspend cleanup during removal

Hans de Goede (1):
      drm/msm: Fix stale comments in uapi/drm/msm_drm.h

Harry Wentland (2):
      drm/amd/display: avoid divide-by-zero in __is_lut_linear()
      drm/amd/display: validate plane degamma LUT size for private color pr=
op

Heikki Krogerus (3):
      i2c: designware: Global register definitions
      drm/xe/i2c: Fix the interrupt handling
      drm/xe/i2c: Keep the i2c controller always enabled

Jens Glathe (1):
      drm/msm/dp: add missing drm_edid_connector_update() before
add_modes on cached EDID

Jesse Zhang (3):
      drm/amdgpu: force complete the MES ring fences on reset
      drm/amdgpu: force complete the KIQ ring fences on reset
      drm/amdgpu/userq: lock and validate wptr BOs before reading
their GPU offset on restore

Jie Zhang (5):
      drm/msm: Recover HW before retire hung submit
      drm/msm/a6xx: Fix A663 GPUCC register list for state capture
      drm/msm/a6xx: Fix A621 GPUCC register list for state capture
      drm/msm/a6xx: Fix IRQ storm during msm_recovery test
      drm/msm: Fix task_struct reference leak in recover_worker

Kavan Smith (1):
      drm/msm/dsi: round 6G byte clock rate to the PLL-achievable value

Konrad Dybcio (3):
      drm/msm/dpu: Drop sneaky dev_pm_opp_set_rate(0)
      drm/msm/dp: Drop dev_pm_opp_set_rate(0)
      drm/msm/dsi: Drop dev_pm_opp_set_rate(0)

Krzysztof Kozlowski (2):
      drm/msm/hdmi_bridge: Simplify register bit updates
      drm/msm/hdmi_hdcp: Simplify register bit updates

Kumar Anurag (1):
      drm/msm/dp: return 0 from audio_prepare when cable is disconnected

Leandro Ribeiro (1):
      drm: use drm_warn() in validate_blend_mode_for_alpha_formats()

Linkai Gong (1):
      drm/amd/display: fix dc_lock leak on GPU reset error paths

Mukul Joshi (1):
      drm/amdgpu: fix sysfs ip base addr for 64bit in standalone mode

Nabige Aala (1):
      dt-bindings: display: msm: qcm2290: Add Shikra MDSS

Nitin Gote (1):
      drm/xe: don't WARN on kernel job timeout when device already wedged

Pierre-Eric Pelloux-Prayer (1):
      drm/amdgpu: delay ttm buffer func enablement on xgmi

Prike Liang (2):
      drm/amdgpu/mes: fix the inconsistent indenting for mes_userq_map()
      drm/amdgpu/userq: fix lock missing for userq fence error set

Puranam V G Tejaswi (3):
      drm/msm/a6xx: Fix RBBM_CLOCK_CNTL3_TP0 value in a730_hwcg
      drm/msm/a6xx: Add Adreno 722 support
      dt-bindings: display/msm: Document Adreno 722 GPU and GMU

Rob Clark (18):
      Merge remote-tracking branch 'drm/drm-next' into msm-next-backmerge
      drm/msm: Fix barriers accessing ctx vm
      drm/msm: Rework queuelock
      drm/msm: Synchronize VM creation on ctxlock
      drm/msm: Synchronize set_sysprof on ctxlock
      drm/msm: Move nr_cmds initialization
      drm/msm: Remove redundant SIZE_MAX check
      drm/msm/a6xx: Access VM directly in submit path
      drm/msm: Add helper to check for per-process pgtables VM
      drm/msm/gem: Fix dma_buf import error paths
      drm/msm/gem: Remove useless locking in GEM import
      drm/msm/gem: Extract bookkeeping init helper
      drm/msm/gem: Set resv before exposing obj
      drm/msm/gem: Validate lazy VM in GEM_NEW
      drm/msm: Allow lazy VM creation to fail
      drm/msm: Don't fallback to shared VM for VM_BIND
      drm/msm: Fix per-process-pgtables check
      drm/msm: Fixup invalid overflow check

Rosen Penev (1):
      drm/msm/dpu: fix parameter name in
dpu_core_perf_adjusted_mode_clk kernel-doc

Ruoyu Wang (1):
      drm/msm: Only fini scheduler after successful init

Shivam Rawat (1):
      drm/msm/a6xx: Fix stale rpmh votes after suspend

Srinivasan Shanmugam (2):
      drm/amd/display: Fix wrong bytes-per-pixel value for dml2_422_packed_=
10
      drm/amd/display: Fix redundant GPUVMEnable checks in dcn6 flip schedu=
le

Sunday Clement (1):
      drm/amdkfd: Reject zero-sized AQL queue allocations after size halvin=
g

Sunil Khatri (3):
      drm/amdgpu/userq: ignore duplicate BO locks in userq signal ioctl
      drm/amdgpu/userq: ignore duplicate BO locks when counting wait fences
      drm/amdgpu/userq: ignore duplicate BO locks when returning wait fence=
 info

Thomas Zimmermann (6):
      drm/msm: Do not declare msm_framebuffer_init() as static
      drm/msm: fbdev: Inline msm_alloc_stolen_fb()
      drm/msm: fbdev: Fix error reporting
      drm/msm: fbdev: Calculate buffer geometry with format helpers
      drm/msm: fbdev: Use a DRM client buffer
      drm/msm: Make msm_framebuffer_init() an internal interface again

Timur Krist=C3=B3f (2):
      drm/amd/display: Fix HPD consideration for VGA/LVDS connectors on DCE
      drm/amd/display: Log details when failing to register HPD IRQ

Vladimir Marioukhine (1):
      drm/amdkfd: guard against NULL restore_mqd in CRIU queue restore

Xiang Liu (1):
      drm/amdgpu: clamp the isolation index for rings outside a partition

Xiaogang Chen (2):
      drm/amdkfd: Fix error path at svm_migrate_copy_to_ram
      drm/amdkfd: Fix the case that vm range is hole at svm_migrate_copy_to=
_vram

Yang Wang (2):
      drm/amdgpu: Disable runtime PM for externally attached dGPUs
      drm/amdgpu: check thunderbolt before switcheroo registration

Yongxing Mou (10):
      drm/msm/dpu: Fix DMA SSPP REC block offsets on DPU v13
      drm/msm/dp: remove cached drm_edid from panel
      drm/msm/dp: drop deprecated .mode_set() and use .atomic_pre_enable
      drm/msm/dp: move mode setup into msm_dp_panel_init_panel_info()
      drm/msm/dp: split msm_dp_ctrl_config_ctrl() into link parts and
stream parts
      drm/msm/dp: extract MISC1_MISC0 configuration into a separate functio=
n
      drm/msm/dp: split link setup from source params
      drm/msm/dp: move the pixel clock control to its own API
      drm/msm/dp: simplify link and clock disable sequence
      drm/msm/dp: pass panel to display enable/disable helpers

Zhu Lingshan (4):
      drm/amdgpu: ensure all userq VAs mapped before restore
      drm/amdgpu: validate rptr and wptr of a userq
      amdkfd: let profile_lock_device return an int other than uint32
      drm/amdgpu: fix hang and race in userq destroy

 .../bindings/display/msm/dsi-controller-main.yaml  |   4 +
 .../devicetree/bindings/display/msm/gmu.yaml       |   1 +
 .../devicetree/bindings/display/msm/gpu.yaml       |   4 +
 .../bindings/display/msm/qcom,qcm2290-dpu.yaml     |   6 +-
 .../bindings/display/msm/qcom,qcm2290-mdss.yaml    |  19 +-
 .../devicetree/bindings/iommu/arm,smmu.yaml        |   4 +
 MAINTAINERS                                        |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c | 148 +++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v12.c | 150 +++++++-
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v12_1.c   | 150 +++++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |   7 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  59 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |  15 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c             |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c          |  73 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c    |  26 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c            |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |  31 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h             |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c           |   3 +
 drivers/gpu/drm/amd/amdgpu/mes_userqueue.c         |   2 +-
 drivers/gpu/drm/amd/amdgpu/vce_v3_0.c              |   2 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c              |  10 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c              |  10 +-
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c           |   5 +-
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.c  |  10 +
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c           |  56 ++-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |   6 +
 .../amd/display/amdgpu_dm/amdgpu_dm_backlight.c    |   8 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_color.c    |  13 +
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c  |   8 +-
 .../src/dml2_core/dml2_core_dcn5_calcs_dchub.c     |   4 +-
 .../src/dml2_core/dml2_core_dcn6_calcs_dchub.c     |  15 +-
 drivers/gpu/drm/amd/display/dc/link/link_factory.c |   2 +-
 drivers/gpu/drm/drm_mode_config.c                  |   5 +-
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c              |  36 +-
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c              |   5 +
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c          |  40 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c              |  24 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              |  14 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c        |  86 ++++-
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h        |  17 +
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c              |   7 +-
 .../gpu/drm/msm/adreno/adreno_gen7_17_0_snapshot.h | 428 +++++++++++++++++=
++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.c            |  17 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h            |   5 +
 .../drm/msm/disp/dpu1/catalog/dpu_13_0_kaanapali.h |  12 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c      |   6 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |   3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |  12 +
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c           |  24 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c           |  11 +-
 drivers/gpu/drm/msm/dp/dp_audio.c                  |   4 +-
 drivers/gpu/drm/msm/dp/dp_ctrl.c                   | 409 +++++++++++------=
---
 drivers/gpu/drm/msm/dp/dp_ctrl.h                   |  30 +-
 drivers/gpu/drm/msm/dp/dp_display.c                | 341 ++++++++--------
 drivers/gpu/drm/msm/dp/dp_display.h                |   9 +
 drivers/gpu/drm/msm/dp/dp_drm.c                    |  52 ++-
 drivers/gpu/drm/msm/dp/dp_drm.h                    |  12 -
 drivers/gpu/drm/msm/dp/dp_panel.c                  |  75 +---
 drivers/gpu/drm/msm/dp/dp_panel.h                  |  17 +-
 drivers/gpu/drm/msm/dp/dp_reg.h                    |   2 +
 drivers/gpu/drm/msm/dsi/dsi_host.c                 |  14 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h              |   1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c          |  18 +-
 drivers/gpu/drm/msm/hdmi/hdmi.h                    |  19 +
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c             |  98 ++---
 drivers/gpu/drm/msm/hdmi/hdmi_hdcp.c               |  85 ++--
 drivers/gpu/drm/msm/msm_drv.c                      |  26 +-
 drivers/gpu/drm/msm/msm_drv.h                      |  17 -
 drivers/gpu/drm/msm/msm_fb.c                       |  96 ++---
 drivers/gpu/drm/msm/msm_fbdev.c                    |  84 ++--
 drivers/gpu/drm/msm/msm_gem.c                      |  94 +++--
 drivers/gpu/drm/msm/msm_gem.h                      |   5 +-
 drivers/gpu/drm/msm/msm_gem_prime.c                |   2 +-
 drivers/gpu/drm/msm/msm_gem_submit.c               |  31 +-
 drivers/gpu/drm/msm/msm_gem_vma.c                  |  14 +-
 drivers/gpu/drm/msm/msm_gpu.c                      |  10 +-
 drivers/gpu/drm/msm/msm_gpu.h                      |   4 +-
 drivers/gpu/drm/msm/msm_iommu.c                    |  22 ++
 drivers/gpu/drm/msm/msm_ringbuffer.c               |   7 +-
 drivers/gpu/drm/msm/msm_ringbuffer.h               |   1 +
 drivers/gpu/drm/msm/msm_submitqueue.c              |  24 +-
 drivers/gpu/drm/msm/registers/adreno/a3xx.xml      |   2 +
 drivers/gpu/drm/msm/registers/adreno/a6xx.xml      |   2 +-
 drivers/gpu/drm/radeon/atombios_crtc.c             |   5 +-
 drivers/gpu/drm/radeon/atombios_encoders.c         |  23 +-
 drivers/gpu/drm/xe/Makefile                        |   4 +-
 drivers/gpu/drm/xe/regs/xe_i2c_regs.h              |   2 +
 drivers/gpu/drm/xe/tests/xe_migrate.c              |   3 +-
 drivers/gpu/drm/xe/xe_amc.c                        | 197 ++++++++++
 drivers/gpu/drm/xe/xe_amc.h                        |  25 ++
 drivers/gpu/drm/xe/xe_gt_idle.c                    |   3 +-
 drivers/gpu/drm/xe/xe_guc_submit.c                 |   6 +
 drivers/gpu/drm/xe/xe_i2c.c                        | 165 ++++----
 drivers/gpu/drm/xe/xe_i2c.h                        |  14 +-
 drivers/gpu/drm/xe/xe_pagefault.c                  |   2 +-
 drivers/gpu/drm/xe/xe_sysctrl.c                    |   7 +-
 drivers/gpu/drm/xe/xe_sysctrl_mailbox.c            |  22 +-
 drivers/gpu/drm/xe/xe_sysctrl_mailbox.h            |   1 -
 drivers/gpu/drm/xe/xe_sysctrl_types.h              |   3 -
 drivers/gpu/drm/xe/xe_wa_oob.rules                 |   2 +-
 drivers/i2c/busses/i2c-designware-common.c         |   2 +
 drivers/i2c/busses/i2c-designware-core.h           |  85 +---
 drivers/i2c/busses/i2c-designware-master.c         |   2 +
 drivers/i2c/busses/i2c-designware-slave.c          |   2 +
 include/linux/designware_i2c.h                     | 107 ++++++
 include/uapi/drm/msm_drm.h                         |   6 +-
 109 files changed, 2762 insertions(+), 1169 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/adreno/adreno_gen7_17_0_snapshot.h
 create mode 100644 drivers/gpu/drm/xe/xe_amc.c
 create mode 100644 drivers/gpu/drm/xe/xe_amc.h
 create mode 100644 include/linux/designware_i2c.h
