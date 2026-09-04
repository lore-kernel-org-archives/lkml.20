Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 184A23B27DC
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 19:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788551542; cv=pass; b=ugAUNCDhzAZFXIypH2d12u7vZvl9nEthi6VmXbHnlxRjKVAQ2bXvYg8nlGs7tFkdqoVvKZ+D8tQ8T76CzDNpDWq2+R5dHqX1v19XAZTcZoJHxdMfj9qAWfGnbXXwLqPO+Gnxw4ItTDtKrCsBa8HLRLRKdr+RekArt8h8VlRK32o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788551542; c=relaxed/simple;
	bh=fKyQ+O6sxz9kPFYjjsHT5WNK61/3qixbSdI9/bCkunQ=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=JttTyHPRc4tPFu4xM9g0C2c3tF0/oBcrXFlKvRdwn/uirJweGjLV9kqIlR4mLD0JGl3hIZXEJeI4ftPJJ98HXAtdv3IjDAVwdDvQy4G73mW2CphyYgP3QRI5ztUEQd9SS2gC/aTXrk+81wXF05fFQmYAFeQAFwrgNf+20A0fFHQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HPqW5umb; arc=pass smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HPqW5umb"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-90cc0ebbf4bso12946466d6.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 12:52:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788551537; cv=none;
        d=google.com; s=arc-20260327;
        b=jpR5KyLd5bhSZ0dZap8jnlcm3wqbdGdXPmQBGkLnDE4550nwVicRqhvfyxeQrcrocZ
         0DF4Qh00+cmXX5+2u3PR7MLluUyNuhy+OZMvtr3jJsDN4UZ+SSBNahDT3KYkgm9FqtNG
         nJvRL33qa2lTxZmLfAAAayYFfzDPLY/xMis5UmFZpp4R0tGP39/RHLq2t1vxrrLjb8hy
         eIE2R8QYDxkZ+fBDYsJqtshpWwoE+YyjcWdNhjY8auSdFBIIVlH6u6+PYOR0Q10Y1dtm
         gC1rKRKtYR2kTGqnMEupKDgtuwrb+aJGtOSxT9XmNcKdMe7R8N6sUWSql/jGxQdfB96x
         GS2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=jdWQBZvyMb2uQlE3ydl7TN/rIT+rHJdW5m5Ggb+HgaQ=;
        fh=oHgZcjpzl25bGPRFp8+hIKoKMB5j7pekWTF5oBnLoGU=;
        b=ctCkxCJvV15SdegT81IAPx4dxrKk3hQ+XmC2YJYI395VUtay2L1cLWN5CaAkCZAi7G
         CtT4CaQipIksx3Cx9EmaNbbtlykgJSYha2H1+jNSgFqHqkVG32D1GcVSr+ryMKxzBHh+
         zddmzaQHwtNon6FXbzfwtwXYbDthMh+B1fua3rgs+rRdu3vMeqzqfnGgg7g853g+5BKs
         D2Oh5GfvducEkMFLNctn7cLBtWJ+zQDIak7q7viRmWMQLwENSJMjYjlTcACYvkE2F2rT
         /7in47rJvYrAAih2ieaz5cdpKn5y4n9gW76yaieMECUCP5JuGKhL3CE0+MqfduPlOlu6
         t8tQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788551537; x=1789156337; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jdWQBZvyMb2uQlE3ydl7TN/rIT+rHJdW5m5Ggb+HgaQ=;
        b=HPqW5umbTSqdV7eCwtj4jh/lSGVVYCFNm9jP9KORPfB3eQdrHpm7kPKQ+4U8rtGqxK
         Aob3g+V9passwxwWIwO0dqSYTRItr0yv6cGmT04SLbHTxihCDUkeNysYiTqZ6dQbvWZC
         2BSXV0t6s5o+hS3wZKSbIbpA3WFyjKvplHFJ/c1+kxQXljUPq/OygRD4tqkBZiTvuCg3
         XxIixi/VHW1ajZ0e3JmiPnXjwwwOA/xjBQDm/5XgUhL+akTRaGzTJKdPO5l/xlRC22Ma
         OzVJsSr963xHE8orzRdbuBE1zgITYscWPKfhkebZXzgs60DzXXHji0POakprnz+CaTxU
         2gkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788551537; x=1789156337;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jdWQBZvyMb2uQlE3ydl7TN/rIT+rHJdW5m5Ggb+HgaQ=;
        b=CD0eovni1T9JAqPW7z5VYI6Roqa8OOV2uhB8ZjMGkYlghF7Ik2nZYjg1XUUjDHFgx4
         3F55VqiIgGhX0kJn6EGZ8793f3d7Z+7jMs0bVzQvzcOrOzv5y7twYEHqhQysC6JnV3XV
         roaH5mpltedxGwvDI1VOIBjvmnzK1yceWWZ+Nod7e6MSLhiKSFWN4ZVUJ+/F03EfdHQj
         7KNtMCejKV7e/bc1CWXn9RXMuITpBA+SiwFFPM8sVi1msGPj/B3dIaj5rKytKmQ8CS1p
         Nq0e8knnFXh8gievpJjWfmPe/+UQK+aNb5qtAZN18mEHyhfj9coaP6NT+51YGYwPzJqm
         xk/g==
X-Forwarded-Encrypted: i=1; AKwUvBygWB6DpMiEBjYlamUCKTsIbGketM9qt49zOHOibHV0vHD9wT4BihnqxdjG5kF5gx79n4mMT3ZehVG32V4=@vger.kernel.org
X-Gm-Message-State: AFuF++mmeem+2kauPlee7J0AFTNrwoa5jc/b3fv31FAske2w4VFZN1Tq
	kZMN+9qLx92AtoHpW3l+QBmdM9aeF1fTB/x2256Qi5HqMfg2JWcXfIC5GHa94HQMz71Pb3WlSr8
	gME2fHaVdKiWwdkUrBYV+SUORTLtff4OOI8hbo2I=
X-Gm-Gg: AYBFou0eH6Bz8xqBcnVNNxHpclr3yG7sQoB38e3+hrVJQS9IW2ed2gP57a9UUHsK7uq
	knTGUThtQnRJ+77K3yIud8SoAHMWGSodAuhmDosZdUpfV+vWRadSqPRocGVVpxqMOVcC8fUc9zc
	fbzSRCyKAqCfdXpTQCvPA2HrgyrkYoLMvWzOhlWL4Mfbgrzd0W0Q3s6DrqfcVf2G1fz581qRMgu
	iS7/+6UlYWkmaK9I3lZDmZbLrQ9x63y9bY3E0wFO6s4dUFnJuAKBwZmmHmIyXb4zFbnm/oKAjia
	AnkGtKVjhms+/XpDPGYA7mzfq2aT64Lzige3+h+gferYy9FDpd9e1SvqkG5p5eGwy7cSQnRGsZ3
	csLN2htBv5A/KoXbPqP0aS+H8qhA88g==
X-Received: by 2002:a05:620a:290a:b0:939:ca4:4d5f with SMTP id
 af79cd13be357-939803240c2mr812456685a.5.1788551537379; Fri, 04 Sep 2026
 12:52:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Sat, 5 Sep 2026 05:52:03 +1000
X-Gm-Features: AcwNN1Vy_iLaXIvN-zpA8T4MIVD4U-f4tbmog_PqRdMSHLfJlBMv8hizRNLYdSk
Message-ID: <CAPM=9ty9kjb1bKFgjgBS1tgM3zP2tK+5qTFzT9-0t+1jykBDxw@mail.gmail.com>
Subject: [git pull] drm fixes for 7.3-rc2
To: Linus Torvalds <torvalds@linux-foundation.org>, Sima Vetter <sima@ffwll.ch>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Linus,

rc2 fixes, lots of scattered fixes. nouveau has a bunch of display
fixes for blackwell GPUs that should mean we light up monitors
properly and fix some desktop rendering problems, amdgpu and intel
display changes as usual.
There also changes to the core pagemap, then the usual amouny of AI
inspired validation fixes.

Regards,
Dave.

drm-fixes-2026-09-05:
drm fixes for 7.3-rc2

core:
- Fix drm_crtc_commit leak when PAGE_FLIP_EVENT is used,

dma-buf:
- Publish the dma-buf only after copy_to_user succeeds
- fix some kernel-doc warnings

atomic-state-helpers:
- set pixel_blend_mode to prop default on reset

sysfb:
- Fix integer overflow
- fix constant comparison bug

pagemap:
- Prevent double migration of device pages
- Reset migration page count on eviction retry
- dma-unmap pages before handling migration errors
- use after free fixes

prime:
- fix prime exports tracing

amdgpu:
 - Fix for drm_amdgpu_info_device with mixed 64 bit kernel and 32 bit users=
pace
- plane blend mode fixes
- SR-IOV fix
- GFX8 fix
- MES queue reset fix
- GPUVM fixes
- DCN 6 warning fix
- DCN 3.5/3.6 fix
- DML fix
- Backlight fix
- Colorop fix
- DC get_estimated_bw() fix
- devcoredump fix
- Userq fixes
- APU PSP fix
- Cursor fix

amdkfd:
- MES queue eviction fix
- MQD debugfs fix

xe:
- oa uapi error handling fix
- drm info message to report FLAT_CSS base misalignment.

i915:
- Drop an accidentally duplicated panel fitter call in DP MST
- Fix DDI clock programming for Cx0 and LT PHY
- Fix PTL CDCLK handling at probe, causing a glitch
- Fix dg2_power_well_count() return type
- Fix a NULL pointer deref at forced probe
- Fix selective fetch disable

amdxdna:
- out-of-bounds access fix
- reject commands chains with no commands
- handle chained mapping BO failures
- refuse to flush an imported BO

ethosu:
- handle mmio mapping failures
- handle storage modes only on hardware that supports it
- fix job completion fence cleanup

fastrpc:
- Publish the dma-buf only after copy_to_user succeeds

gud:
- Improve TV modes and rotation handling

nouveau:
- use-after-free fixes
- add missing scanline position support
- HDMI and DP fixes
- null pointer dereference fix
- dmem accounting fixes for large folios
- use write-combined maps for coherent

qaic:
- out-of-bounds access fix

tegra:
- Add blend mode properties

virtio:
- exit path and error handling fixes
The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935=
:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2026-09-05

for you to fetch changes up to c96294afbcb5737da18229e788ca45a5d534abc5:

  Merge tag 'drm-xe-fixes-2026-09-03' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes
(2026-09-04 20:36:14 +1000)

----------------------------------------------------------------
drm fixes for 7.3-rc2

core:
- Fix drm_crtc_commit leak when PAGE_FLIP_EVENT is used,

dma-buf:
- Publish the dma-buf only after copy_to_user succeeds
- fix some kernel-doc warnings

atomic-state-helpers:
- set pixel_blend_mode to prop default on reset

sysfb:
- Fix integer overflow
- fix constant comparison bug

pagemap:
- Prevent double migration of device pages
- Reset migration page count on eviction retry
- dma-unmap pages before handling migration errors
- use after free fixes

prime:
- fix prime exports tracing

amdgpu:
 - Fix for drm_amdgpu_info_device with mixed 64 bit kernel and 32 bit users=
pace
- plane blend mode fixes
- SR-IOV fix
- GFX8 fix
- MES queue reset fix
- GPUVM fixes
- DCN 6 warning fix
- DCN 3.5/3.6 fix
- DML fix
- Backlight fix
- Colorop fix
- DC get_estimated_bw() fix
- devcoredump fix
- Userq fixes
- APU PSP fix
- Cursor fix

amdkfd:
- MES queue eviction fix
- MQD debugfs fix

xe:
- oa uapi error handling fix
- drm info message to report FLAT_CSS base misalignment.

i915:
- Drop an accidentally duplicated panel fitter call in DP MST
- Fix DDI clock programming for Cx0 and LT PHY
- Fix PTL CDCLK handling at probe, causing a glitch
- Fix dg2_power_well_count() return type
- Fix a NULL pointer deref at forced probe
- Fix selective fetch disable

amdxdna:
- out-of-bounds access fix
- reject commands chains with no commands
- handle chained mapping BO failures
- refuse to flush an imported BO

ethosu:
- handle mmio mapping failures
- handle storage modes only on hardware that supports it
- fix job completion fence cleanup

fastrpc:
- Publish the dma-buf only after copy_to_user succeeds

gud:
- Improve TV modes and rotation handling

nouveau:
- use-after-free fixes
- add missing scanline position support
- HDMI and DP fixes
- null pointer dereference fix
- dmem accounting fixes for large folios
- use write-combined maps for coherent

qaic:
- out-of-bounds access fix

tegra:
- Add blend mode properties

virtio:
- exit path and error handling fixes

----------------------------------------------------------------
Aditya Garg (1):
      MAINTAINERS, mailmap: use Aditya Garg's linux.dev account

Alex Deucher (1):
      drm/amdgpu/gfx8: only apply compute quantums to KCQs

Amber Lin (1):
      drm/amdgpu: Update queue reset support version

Anuj Bolewar (1):
      drm/virtio: reclaim pending vbufs before tearing down vqs

Arvind Yadav (2):
      drm/pagemap: Prevent double migration of device pages
      drm/pagemap: Reset migration page count on eviction retry

Austin Zheng (1):
      drm/amd/display: Remove const Qualifier From Non-Pointer Fields

Baineng Shou (4):
      dma-buf: dma-heap: don't publish fd before copy_to_user() succeeds
      misc: fastrpc: don't publish fd before copy_to_user() succeeds
      drm/prime: use dma_buf_fd_install() to preserve export tracing
      selftests: dmabuf-heaps: add fd-leak-on-EFAULT regression test

Benjamin Leggett (1):
      drm/virtio: use the DMA API for resource backing on Xen

Chaitanya Kumar Borah (1):
      drm/i915/dp_mst: Remove duplicate intel_pfit_compute_config() call

Dan Carpenter (1):
      drm/virtio: Fix a NULL vs ERR_PTR() bug in
virtio_gpu_user_framebuffer_create()

Dave Airlie (5):
      nouveau/instmem: handle iomapping already existing
      Merge tag 'drm-misc-fixes-2026-09-03' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes
      Merge tag 'drm-intel-fixes-2026-09-03' of
https://gitlab.freedesktop.org/drm/i915/kernel into drm-fixes
      Merge tag 'amd-drm-fixes-7.3-2026-09-03' of
https://gitlab.freedesktop.org/drm/amdgpu/kernel into drm-fixes
      Merge tag 'drm-xe-fixes-2026-09-03' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes

Deepanshu Kartikey (2):
      drm/gud: NUL-terminate TV mode names read from the device
      drm/i915: Guard against NULL driver_data in i915_pci_probe()

Faith Ekstrand (1):
      drm/nouveau: Use write-combined maps for coherent

GuoHan Zhao (2):
      accel/ethosu: check MMIO mapping errors in probe
      accel/ethosu: fix job completion fence cleanup

Hari Mishal (1):
      drm/amd/display: fix division by zero in get_estimated_bw()

Ivan Lipski (1):
      drm/amd/display: Fix DCN5/6 DML2 compilation warnings

Kanala Ramalingeswara Reddy (1):
      drm/amdgpu: Skip accessing psp rum time db for APUs

Lizhi Hou (1):
      accel/amdxdna: Remove __counted_by from struct amdxdna_cmd_chain

Lu Yao (1):
      drm/xe/oa: Remove sysfs entry on idr_alloc failure in
xe_oa_add_config_ioctl()

Lyude Paul (1):
      drm/nouveau/disp/r535: Add scanline position support + head state sup=
port

Marek Czernohous (1):
      drm/nouveau: unsubscribe the channel-kill event before the fence cont=
ext

Mario Limonciello (2):
      drm/amdgpu: restrict BAR0 fallback read to SR-IOV VFs only
      drm/amdkfd: fix scope of mqd_mgr dereference in pqm_debugfs_mqds

Matthew Auld (1):
      drm/xe/vram: report FLAT_CCS base misalignment

Matthew Brost (2):
      drm/pagemap: dma-unmap pages before handling migration errors
      drm/pagemap: Fix folio allocation fallback and use-after-put

Maxime Ripard (1):
      Merge drm/drm-fixes into drm-misc-fixes

Melissa Wen (5):
      drm/atomic-state-helper: set pixel_blend_mode to prop default on rese=
t
      drm/amd/display: fix missing blend-mode-prop warning for DCN
      drm/amd/display: advertise PIXEL_NONE and PREMULTI blend mode for DCE
      drm/amd/display: use halving distribution for all encode-to-linear cu=
rves
      drm/amd/display: use plane color_mgmt_changed to track colorop change=
s

Mohamed Ahmed (8):
      drm/nouveau/disp: move GSP head-timing ISR and vblank helpers to tu10=
2.c
      drm/nouveau/disp: move the GSP HDMI GCP AVMute write to engine/disp
      drm/nouveau/disp: route GSP-RM display MMIO through nvkm_disp_func ho=
oks
      drm/nouveau/disp: fix HDMI vendor infoframes on GB20x
      drm/nouveau/disp: fix HDMI GCP AVMute register offsets on GB20x
      drm/nouveau/gsp: use per-version DP_CONFIG_STREAM params on r570 firm=
ware
      drm/nouveau/disp: fix head state readback on GB20x
      drm/nouveau/gsp: fix vblank interrupts on GB20x

Nemesa Garg (1):
      drm/i915/display: Clear SEL_FETCH_PLANE_CTL on plane disable

Priya Hosur (1):
      drm/amdkfd: Add TLB flush after MES queue eviction/suspension

Randy Dunlap (1):
      dma-buf: fix some kernel-doc warnings

Roman Li (2):
      drm/amd/display: Set gpuvm min page size to 4K on dcn35/36
      drm/amd/display: Fix backlight control for luminance-capable OLED

Sajal Gupta (1):
      drm/gud: validate GUD_ROTATION_0 is present in supported rotations

Shixiong Ou (2):
      drm/sysfb: ofdrm: Fix integer overflow in fb_size calculation
      drm/sysfb: ofdrm: Fix is_avivo() constant comparison bug

Slawomir Stepien (1):
      drm/cirrus-qemu: Validate BAR0 size during probe

Sunil Khatri (6):
      drm/amdgpu: use AMDGPU_GPU_PAGE_SHIFT instead of PAGE_SHIFT
      drm/amdgpu: fix Idle BOs list in VM debugfs status info
      drm/amdgpu: fix byte/dword unit mismatch in coredump IB dump
      drm/amdgpu: update the fw version for gfx11 userqueues
      drm/amdgpu: update the fw version for gfx12 userqueues
      drm/amdgpu/userq: dont overwrite the error of subsequent map call

Suraj Kandpal (3):
      drm/i915/ddi: add helper to compute DDI clock frequency
      drm/i915/cx0: program DDI_CLK_VALFREQ with DDI clock frequency
      drm/i915/lt_phy: program DDI_CLK_VALFREQ with DDI clock frequency

Taimuraz Kaitmazov (4):
      accel/amdxdna: return early from a zero-length flush
      accel/amdxdna: reject a command chain that carries no commands
      accel/amdxdna: put the chained BO when its mapping fails
      accel/amdxdna: refuse to flush an imported BO

Tao Yu (1):
      drm/gud: validate TV mode names before creating enum property

Thadeu Lima de Souza Cascardo (2):
      drm/atomic: remove bogus check for file_priv
      drm: Fix drm_crtc_commit leak if signaled when PAGE_FLIP_EVENT is use=
d

Thierry Reding (1):
      drm/tegra: Add blend mode properties

Thomas Zimmermann (1):
      Merge drm/drm-fixes into drm-misc-fixes

Tomeu Vizoso (1):
      accel: ethosu: Don't read the U65 rounding mode as a storage mode

Ville Syrj=C3=A4l=C3=A4 (2):
      drm/i915/cdclk: Avoid spurious cdclk sanitization on PTL+
      drm/i915/cdclk: Fix dg2_power_well_count() return type

Yogesh Mohan Marimuthu (1):
      drm/amdgpu/userq: fix struct drm_amdgpu_info_device padding for
32bit compile

Youssef Samir (1):
      accel/qaic: Address potential out-of-bounds read in resp_worker()

Yuling Li (1):
      drm/amd/display: Fix cursor disable with horizontally split planes

Zhenhao Wan (5):
      drm/nouveau/uvmm: fix NULL deref unwinding an OP_MAP_SPARSE op
      drm/nouveau/uvmm: fix premature region free on failed OP_UNMAP_SPARSE
      drm/nouveau/uvmm: clear the dirty flag when unwinding an OP_UNMAP_SPA=
RSE
      drm/nouveau/dmem: fix mismatched DMA unmap size for large folios
      drm/nouveau/dmem: fix callocated underflow on large folio split

shechenglong (1):
      drm/virtio: check return value of vgdev_output_init()

 .mailmap                                           |   3 +-
 MAINTAINERS                                        |   2 +-
 drivers/accel/amdxdna/aie2_message.c               |   2 +-
 drivers/accel/amdxdna/amdxdna_ctx.c                |   4 +-
 drivers/accel/amdxdna/amdxdna_ctx.h                |   2 +-
 drivers/accel/amdxdna/amdxdna_gem.c                |  10 +-
 drivers/accel/ethosu/ethosu_drv.c                  |   2 +
 drivers/accel/ethosu/ethosu_gem.c                  |   2 +-
 drivers/accel/ethosu/ethosu_job.c                  |  10 +-
 drivers/accel/qaic/qaic_control.c                  |  46 ++--
 drivers/dma-buf/dma-buf.c                          |  20 ++
 drivers/dma-buf/dma-heap.c                         |  80 +++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c   |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |   3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c            |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |   6 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c          |   5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |   4 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             |   8 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c             |   8 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c              |   8 +-
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.c  |  13 +-
 .../gpu/drm/amd/amdkfd/kfd_process_queue_manager.c |  12 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |   6 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_backlight.c    |   8 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c    |  31 ++-
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |   7 +-
 .../gpu/drm/amd/display/dc/dcn30/dcn30_cm_common.c |  34 +--
 .../dml2_core_dcn5_funcs_mode_programming.c        |   4 +-
 .../dml21/src/dml2_core/dml2_core_shared_types.h   |   4 +-
 .../src/dml2_pmo/dml2_pmo_dcn6_stage_optimizers.c  |   2 +-
 .../display/dc/dml2_0/dml2_translation_helper.c    |   1 +
 .../display/dc/link/protocols/link_dp_dpia_bw.c    |   5 +
 drivers/gpu/drm/drm_atomic_state_helper.c          |   7 +
 drivers/gpu/drm/drm_atomic_uapi.c                  |   5 +-
 drivers/gpu/drm/drm_pagemap.c                      | 270 +++++++++++++++++=
+---
 drivers/gpu/drm/drm_prime.c                        |   2 +-
 drivers/gpu/drm/gud/gud_connector.c                |  12 +-
 drivers/gpu/drm/gud/gud_drv.c                      |   2 +
 drivers/gpu/drm/i915/display/intel_cdclk.c         |  10 +-
 drivers/gpu/drm/i915/display/intel_cursor.c        |  15 +-
 drivers/gpu/drm/i915/display/intel_cx0_phy.c       |   5 +-
 drivers/gpu/drm/i915/display/intel_ddi.c           |  11 +
 drivers/gpu/drm/i915/display/intel_ddi.h           |   1 +
 drivers/gpu/drm/i915/display/intel_dp_mst.c        |   4 -
 drivers/gpu/drm/i915/display/intel_lt_phy.c        |   6 +-
 drivers/gpu/drm/i915/display/skl_universal_plane.c |  15 +-
 drivers/gpu/drm/i915/i915_pci.c                    |   3 +
 drivers/gpu/drm/nouveau/include/nvkm/engine/disp.h |   1 +
 drivers/gpu/drm/nouveau/nouveau_chan.c             |   9 +-
 drivers/gpu/drm/nouveau/nouveau_dmem.c             |  18 +-
 drivers/gpu/drm/nouveau/nouveau_sgdma.c            |   4 +-
 drivers/gpu/drm/nouveau/nouveau_uvmm.c             |   6 +-
 drivers/gpu/drm/nouveau/nvkm/engine/device/base.c  |  10 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/Kbuild    |   1 +
 drivers/gpu/drm/nouveau/nvkm/engine/disp/ga102.c   |  13 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/gb202.c   | 191 +++++++++++++++
 drivers/gpu/drm/nouveau/nvkm/engine/disp/head.h    |   2 +
 drivers/gpu/drm/nouveau/nvkm/engine/disp/ior.h     |   1 +
 drivers/gpu/drm/nouveau/nvkm/engine/disp/priv.h    |  17 ++
 drivers/gpu/drm/nouveau/nvkm/engine/disp/tu102.c   |  86 ++++++-
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c | 125 ++++------
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/disp.c |  64 +++++
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gsp.c  |   9 +
 .../nouveau/nvkm/subdev/gsp/rm/r570/nvrm/disp.h    |   2 +
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h    |   5 +
 drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c |   3 +
 drivers/gpu/drm/sysfb/ofdrm.c                      |   8 +-
 drivers/gpu/drm/tegra/dc.c                         |   6 +
 drivers/gpu/drm/tegra/hub.c                        |   2 +
 drivers/gpu/drm/tiny/cirrus-qemu.c                 |   3 +
 drivers/gpu/drm/virtio/virtgpu_display.c           |   9 +-
 drivers/gpu/drm/virtio/virtgpu_drv.h               |  21 ++
 drivers/gpu/drm/virtio/virtgpu_kms.c               |   1 +
 drivers/gpu/drm/virtio/virtgpu_object.c            |   2 +-
 drivers/gpu/drm/virtio/virtgpu_vq.c                |  21 +-
 drivers/gpu/drm/xe/xe_oa.c                         |   6 +-
 drivers/gpu/drm/xe/xe_vram.c                       |   3 +
 drivers/misc/fastrpc.c                             |  16 +-
 include/drm/drm_pagemap.h                          |   8 +-
 include/linux/dma-buf.h                            |   1 +
 include/linux/dma-fence-array.h                    |   1 -
 include/linux/dma-fence-chain.h                    |   9 +-
 include/uapi/drm/amdgpu_drm.h                      |   2 +-
 tools/testing/selftests/dmabuf-heaps/dmabuf-heap.c | 113 ++++++++-
 85 files changed, 1210 insertions(+), 317 deletions(-)
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/gb202.c
