Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6F1F3246ED
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 20:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789159480; cv=pass; b=utjrK+VyXj1gZqx23PzbFTefcbWLlOKTMSCGZQ5dFk1qVE45diVeHoLi7uYGAFIZM/7y0+3lIxoGieO1sQWZsvnwy/OQJvUqJ56Zl/EanuJ8OGMYhQdxh706pq0iEV+cNYr3Ir0+EBysu1m+/WmfV9pUxxpLmut9OLA7pCiRFrY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789159480; c=relaxed/simple;
	bh=eCBugO0xxaDQngtg9TePz2gVt8062bqi3imRZBcMLCg=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=D2wbyxAuPKcw9NVwgjR+/j5gO9idqxFMdes/Cuv1H7yqqKGFobBJqiNopJqeqdR78NeYlZDD/o7kPDgexf3jYZXnd+6Xfb9jJzjt4UCpjcJB+//3+Ih0Xt/yNQAt1NCfGAewVGmNHJL8RV/ripI82N9UwUn7VzDXNqdYTifCi3k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B4pgYSPo; arc=pass smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B4pgYSPo"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-90e8e70fa02so15579746d6.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 13:44:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789159478; cv=none;
        d=google.com; s=arc-20260327;
        b=MKp2VHTFZFbn5CM2w/IElYBtVQNmAmzkn56xPjSUZg9glcYX4OY+ltlHKEMwRQlCf8
         PEgo8Wc/k7lpvl0rseeBZSvWXZHRMCxFVehoRF7RKXTdpeTtSlmNuc3z1BYQGArfPt6L
         AmGaoD9f5EW0/Lx8m1TJIWN1/kGeM7MyxNzlE9h/AEXb2cKX0rU1EsjAhtfo7cdZLQ3p
         lNaad4YAlbIy++v4hXD75vPQ5nM3TWUWXnlLbEKGjwN/4hPCgHiDzABuW6T8eMiJhIWg
         xCu6LGxXAIm6CDcZQwRekDuHsRD48JK6lNPL0abR9o6WQLIvbPPslJ96Q50HNPQyxJmp
         6QtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=SkISSLquT6XeODeqqMzRS36GrWecMNEutYooMtswli4=;
        fh=L7WO808N9wwjqjIJsip0GRdIS1xecV7vO/1JTnVcsMQ=;
        b=jsjxycEckTpiuqYTEJu29RcCZ87+aWcdAa1iOWetOTgfA0Egg7TCjK8dI7mucvFr4c
         D9r4nhV5IB+xmAF6BGR1QnfeBeK2oAufCq+NplzpR/YpP3iWZZhETHEoQ69fJP0OM8f4
         G0TXVnW2S9Nk/khWgPbVVjFpftCMeVdVsMQj0leoO59N+JVUR4uonxLhClMfFgihh//a
         iVdzDz2Ey27QmDmSRAlT3AtAMmF4c19W8fbqP0YdmzL+36KKd/ZOcenqoAZUrV+OgdZ4
         fiO97yqOmVo53l1FQ89pCYb/IG7OBDV9zK5La3TYJqDlH/k3Mmqwln8f+4eoJVLCjTj+
         s0GQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789159478; x=1789764278; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SkISSLquT6XeODeqqMzRS36GrWecMNEutYooMtswli4=;
        b=B4pgYSPoTgXd7hHEuNcqsJB9cgZ5kCvnxBt35nKhNGs+sRaEIUk/jX3vD/frdw4zfO
         WlBNif9oD8JUmhhoQ+U+CuyK5iXC6dHgSMsEKbD5HKb6j3vQGDpUxhx6cIoyleIcmUBF
         DWOZUOIk827HA26aEj3M6vr/jYO3zjjOxMfWPJcQttufZmKCUpx5wIpIZJhwv2TuL6Fv
         96///9aXkVJA+hDcZOf9VHCAx1OBBF0FYdL7ZHN/IYdDKOe9zXax3eAxrtvNsgW/KLhf
         IdmGGVEIF7Xv5nTIlfa6Ux7PqFHKnLRSXnysz7mgTVc4SbdKAI3FHDiwt7cYFggPiK2x
         Q0Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789159478; x=1789764278;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SkISSLquT6XeODeqqMzRS36GrWecMNEutYooMtswli4=;
        b=jnqFVTd9sskEoYwqxTdo239TDNvGqXh5IB0hjo2TKwpjhPwRTm63vhMJF6fg8OPzvf
         RWbkICQwn8Fz4kd5vj4E5jNW8T2lRdMeAPzypj8xfgM2Zw8eLWtL3CMKzANy+ceMqVKI
         YgWTQ0Iav8rapwPFsQsI8rGnJ95iHmRyeLlb+B9mR5L0DTPanicHeN9It12sa4+/IPTY
         WD6wCHbuLth1+lUs2cTucb3+yKwln0DHy719LBaRzVwwLu6Qr9m9xJinO+JWrmrWOvy9
         aUyWAlTHkT+vmH76C7FlDFlvorxKZaM0HxDSJCy9eEkrgyDCArxgvL+iqJkqAedWNb0d
         rmZg==
X-Forwarded-Encrypted: i=1; AKwUvBzzian0nsjiS7L4diwO0YB8iMEzppqCUpFRr5iOoyGfUQzFXXb+89nBw1GRNun3yVGLow/Ji+FF1kompyo=@vger.kernel.org
X-Gm-Message-State: AFuF++mX/tVu7u/zlV/Zsq4qfuBowtaGfVSrTaFXDN5xVgBNvHOd/k3+
	Fn3O23ec0YAukhzeUuW6E8alQ6iAJupfcGO6rSCwtSp09kn+w2+VD2Vh7Cesqdbk17pi0bBcKPJ
	EMkO578K0ddIAgvSpzZHgoZVhrp/Ka2ibh5hh
X-Gm-Gg: AYBFou18jdzfNdjOc6SPU4UJ00UdSspmNfLDx5WUdZeidJHaBsXceLd/d4WgXkXO9sk
	c+Uly4uoMCA4L/COTaAw1lwMJvqOXJ++APpy6IETXHcmYUmPvFKXS25VOXWb5AFZAUbIdufNFPS
	4IC94VQB5v0l5Gvz4Vr4oQBazXNCX9iUT/jROqnzrpfTe755UvCGucRvLo9b7BLgVIzYf9me6uC
	GzkY3GSVSTcE8691JiS7wrHe9aLkqJ+LK798BOGrFMOkWL3f9b5fJrjv2l9jlQXYzV8aidGI1C+
	Tnbyah1Tj8aj2HZTTI7CzrTKbMZHI3raF2HZksTdiMY+AI3Qv7F7VjuvixrxhBNs/PrYjnzTfut
	BhPEjS3FFcsitv6Kqv1js0c/NnenYj6P6OOC7LbYmuZQkvX39+Ac=
X-Received: by 2002:a05:620a:4686:b0:939:922b:3de1 with SMTP id
 af79cd13be357-939ea2a3baemr846826085a.44.1789159477578; Fri, 11 Sep 2026
 13:44:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Sat, 12 Sep 2026 06:44:25 +1000
X-Gm-Features: AcwNN1XjHdzvwzLxGSBI74aDBaOJ28PfdU-i2VQPskwjh6gRDQm8IPruONYay-U
Message-ID: <CAPM=9ty1x=g_7+obhbefCdWXQoEoW7-WdVuoN+P4+sfYJ34=_A@mail.gmail.com>
Subject: [git pull] drm fixes for 7.3-rc3
To: Linus Torvalds <torvalds@linux-foundation.org>, Sima Vetter <sima@ffwll.ch>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Linus,

Weekly fixes pull, this seems relatively quiet for the new world,
scattered fixes, mostly amdgpu leading the way, but lots of minor
fixes in other drivers.

Regards,
Dave.

drm-fixes-2026-09-12:
drm fixes for 7.3-rc3

drm_exec:
- fix 0 object handling

sched:
- null ptr deref fix in kunit tests

amdgpu:
- Freesync fix
- GPUVM fix
- Debugfs fixes
- HDMI fixes
- IPS fix
- GPU reset fix
- RGB quantization fixes
- SMU 13.0.x fixes

xe:
- runtime PM guard fix
- cache flushing fix

i915:
- Fix a memleak on perf config query error path
- Fix UHBR SST SDP splitting when sink doesn't support it

bridge:
- fix ti-sn65dsi83 error handling
- tc358768: Enforce input bus flags via atomic_check

ast:
- fix blend mode property on cursor plane

qxl:
- fix blend mode property on primary/cursor planes

virtio:
- fix blend mode property on cursor plane

vboxvideo:
- fix blend mode property on planes

rockchip:
- fix endpoint name length
- fix Kconfig issues

ivpu:
- limit firmware log prints to field size
- validate buffer range in ivpu address translation
- validate fw log buffers

ethosu:
- ensure SRAM sizing
- ensure cmd stream formatting
- drop IRQF_SHARED
- fix open return value

adp:
- fix Kconfig

logicvc:
- fix Kconfig
The following changes since commit df2908090cda368b01ff43709f51890076c56157=
:

  Linux 7.3-rc2 (2026-09-06 15:07:20 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2026-09-12

for you to fetch changes up to b1edd3a3e00369080012b2e4c665fc662b96ecbd:

  Merge tag 'amd-drm-fixes-7.3-2026-09-10' of
https://gitlab.freedesktop.org/drm/amdgpu/kernel into drm-fixes
(2026-09-11 18:42:13 +1000)

----------------------------------------------------------------
drm fixes for 7.3-rc3

drm_exec:
- fix 0 object handling

sched:
- null ptr deref fix in kunit tests

amdgpu:
- Freesync fix
- GPUVM fix
- Debugfs fixes
- HDMI fixes
- IPS fix
- GPU reset fix
- RGB quantization fixes
- SMU 13.0.x fixes

xe:
- runtime PM guard fix
- cache flushing fix

i915:
- Fix a memleak on perf config query error path
- Fix UHBR SST SDP splitting when sink doesn't support it

bridge:
- fix ti-sn65dsi83 error handling
- tc358768: Enforce input bus flags via atomic_check

ast:
- fix blend mode property on cursor plane

qxl:
- fix blend mode property on primary/cursor planes

virtio:
- fix blend mode property on cursor plane

vboxvideo:
- fix blend mode property on planes

rockchip:
- fix endpoint name length
- fix Kconfig issues

ivpu:
- limit firmware log prints to field size
- validate buffer range in ivpu address translation
- validate fw log buffers

ethosu:
- ensure SRAM sizing
- ensure cmd stream formatting
- drop IRQF_SHARED
- fix open return value

adp:
- fix Kconfig

logicvc:
- fix Kconfig

----------------------------------------------------------------
Arunpravin Paneer Selvam (1):
      drm/amdgpu: skip the VMID 0 flush for VRAM

Dave Airlie (4):
      Merge tag 'drm-misc-fixes-2026-09-10' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes
      Merge tag 'drm-xe-fixes-2026-09-10' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes
      Merge tag 'drm-intel-fixes-2026-09-10' of
https://gitlab.freedesktop.org/drm/i915/kernel into drm-fixes
      Merge tag 'amd-drm-fixes-7.3-2026-09-10' of
https://gitlab.freedesktop.org/drm/amdgpu/kernel into drm-fixes

Dawid Osuchowski (1):
      accel/ivpu: Limit firmware log name prints to field size

Esben Haabendal (1):
      drm/bridge: ti-sn65dsi83: Fix error handling in sn65dsi83_reset_work(=
)

Fangzhi Zuo (2):
      drm/amd/display: Exit IPS before connector detection on resume
      drm/amd/display: Fix HF-VSDB DSC bpc detection to be cumulative

Harry Wentland (1):
      dm/amdgpu: fix malformed link_settings debugfs output

Igor Paunovic (2):
      drm/rockchip: dw_dp: Select DRM_BRIDGE_CONNECTOR
      drm/rockchip: rk3066_hdmi: Add missing Kconfig selects

Karl Mehltretter (2):
      drm/adp: Drop the select of the nonexistent CONFIG_DRM_KMS_DMA_HELPER
      drm/logicvc: Drop the select of the nonexistent CONFIG_DRM_KMS_DMA_HE=
LPER

Kevin Wang (2):
      drm/amd/pm: fix gpu metrics energy accumulator for smu 13.0.0/13.0.7
      drm/amd/pm: report energy accumulator for smu 13.0.0

Leonardo Costa (1):
      drm/bridge: tc358768: Enforce input bus flags via atomic_check

Magdalena Schulfer (2):
      accel/ivpu: Validate full buffer range in ivpu_to_cpu_addr
      accel/ivpu: Validate firmware log buffer metadata

Michel D=C3=A4nzer (1):
      drm/amd/display: Consult MCCS FreeSync cap only if requested & suppor=
ted

Mitul Golani (1):
      drm/i915/dp: Gate UHBR SST SDP splitting on sink capability

Nathan Chancellor (1):
      drm/amd/display: Shorten hdmi_frl_status_polling_workqueue

Prike Liang (1):
      drm/amdgpu: skip gfx switch_power_profile during GPU reset

Qinyun Tan (4):
      drm/ast: create blend mode property on cursor plane
      drm/qxl: create blend mode property on primary and cursor planes
      drm/virtio: create blend mode property on cursor plane
      drm/vboxvideo: create blend mode property on planes

Rob Herring (Arm) (5):
      accel: ethosu: Fix ethosu_job_open() return value
      accel: ethosu: Drop IRQF_SHARED flag
      accel: ethosu: Ensure cmd stream ends with a stop op
      accel: ethosu: Ensure SRAM size is 0 on mapping failure
      accel: ethosu: Ensure SRAM region size matches job

Satyajit Roy (3):
      drm/amd/display: Propagate HDMI RGB quantization selectability
      drm/amd/display: Honor Broadcast RGB for BT.2020 RGB output
      drm/amd/display: Rebuild InfoFrames on output color space changes

Shixiong Ou (1):
      drm/sched: Create a fake device for KUnit tests

Sunil Khatri (1):
      drm/drm_exec: fix up contended obj when num_objects is 0

Thadeu Lima de Souza Cascardo (1):
      Revert "drm/amdgpu: debugfs: avoid extra EOLs in amdgpu_gem_info"

Thomas Hellstr=C3=B6m (1):
      drm/xe: Flush LSC untyped L1 dataport cache after rcs/ccs batches

Thomas Zimmermann (1):
      Merge drm/drm-fixes into drm-misc-fixes

Thorsten Blum (1):
      drm/i915: Fix memory leak in query_perf_config_list()

Varun Gupta (1):
      drm/xe: Guard page-fault worker with runtime PM check

Yudi Yang (1):
      drm/rockchip: analogix_dp: fix unchecked bound endpoint name length

 drivers/accel/ethosu/ethosu_device.h               |  1 +
 drivers/accel/ethosu/ethosu_drv.c                  |  3 +-
 drivers/accel/ethosu/ethosu_gem.c                  |  9 +++
 drivers/accel/ethosu/ethosu_job.c                  | 16 ++--
 drivers/accel/ivpu/ivpu_fw_log.c                   | 87 +++++++++++++-----=
----
 drivers/accel/ivpu/ivpu_gem.h                      | 14 +++-
 drivers/accel/ivpu/ivpu_ipc.c                      |  7 +-
 drivers/gpu/drm/adp/Kconfig                        |  1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         |  3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            | 20 +++--
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  8 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_connector.c    | 24 +++---
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c  | 20 ++---
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  |  6 +-
 .../amdgpu_dm/tests/amdgpu_dm_connector_test.c     | 37 +++++++++
 .../amdgpu_dm/tests/amdgpu_dm_helpers_test.c       |  4 +-
 drivers/gpu/drm/amd/display/dc/core/dc.c           |  3 +
 drivers/gpu/drm/amd/pm/amdgpu_dpm.c                |  6 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   |  8 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c   |  4 +-
 drivers/gpu/drm/ast/ast_cursor.c                   |  3 +
 drivers/gpu/drm/bridge/tc358768.c                  | 15 ++--
 drivers/gpu/drm/bridge/ti-sn65dsi83.c              |  6 +-
 drivers/gpu/drm/drm_exec.c                         | 13 ++++
 drivers/gpu/drm/i915/display/intel_display_types.h |  2 +
 drivers/gpu/drm/i915/display/intel_dp.c            | 44 +++++++++--
 drivers/gpu/drm/i915/i915_query.c                  |  4 +-
 drivers/gpu/drm/logicvc/Kconfig                    |  1 -
 drivers/gpu/drm/qxl/qxl_display.c                  |  4 +
 drivers/gpu/drm/rockchip/Kconfig                   |  3 +
 drivers/gpu/drm/rockchip/analogix_dp-rockchip.c    |  7 +-
 drivers/gpu/drm/scheduler/tests/mock_scheduler.c   | 11 +++
 drivers/gpu/drm/vboxvideo/vbox_mode.c              |  4 +
 drivers/gpu/drm/virtio/virtgpu_plane.c             |  4 +
 drivers/gpu/drm/xe/instructions/xe_gpu_commands.h  |  1 +
 drivers/gpu/drm/xe/xe_pagefault.c                  | 10 +++
 drivers/gpu/drm/xe/xe_pagefault_types.h            |  3 +
 drivers/gpu/drm/xe/xe_ring_ops.c                   | 11 +++
 38 files changed, 312 insertions(+), 115 deletions(-)
