Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E7C62F7F07
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 19:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791660211; cv=pass; b=upTJ6Kd7mZsQ9uzwSHs0ZZefMdXNadl4LGMXEIzuqb2utfqUBKYGcZAk9btJYjWJ5gS0gfeUQeXf2QgDZxjZMhBKkuDO787wfByVmeqRtd7/1ajiR+p7gYCS5Kj/vpix4BlvEEuh1qeXWZyGASyD0UwZiaLrfnvjK4tCXXdpbGk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791660211; c=relaxed/simple;
	bh=ZviefQe8s6xR3jBkPy1j5zj97pTpa2Q/ARC4OAzJ/64=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=WmuYzPK6V9kZFllKu6BtA0xxoG5lVPIIAU1Wj1RfqvUkqfcHIEaHGWhrs4xM6P0Kq8mg/Mj9zU2q8PaOs4Tv0rtgI7BgE3kTOo9zZu1ZTc+u3g6n4JJmXZicDr5ThObEELcc1YwU/ZFyK2Sl7yezfYzs6KBRjZDJMSjHleBir1w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ecalV01X; arc=pass smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ecalV01X"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-53391022dc0so9195471cf.2
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 12:23:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791660209; cv=none;
        d=google.com; s=arc-20260327;
        b=o9XSjOipVT/XTFB+sF3w1FdByqdy5aexot7whyPVddM79FTqw1n97X6blNqPlIJN4p
         e112xD440CeJxLEC/scU4GMS1mK2siIegNXNW8rcO7MNo8oTfaqg7mnWhww9uy8g1low
         ASCJ37l0dvQRABqB79gODkhD3dkDc+Bytg4I1DTyRx/+YiZ5GTgTRoo6qNQf+RMqgaA6
         sf0wW2vzVAkZRkhtVQsoovolPNRhXXLtGG4z03rErM9oUgaNYnFrFTJV3moJcm0jn1/h
         8MchSRiAIfqmMI0/QYj0bOQ0K1My/8EV401GxSpbJcuy/5jahIl5DNxjyM/ritRFbuSS
         OX7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=y9a+TyL1ZUr2gWay3ENBMoj2LAgkfvRENCAy64d5+8I=;
        fh=9QsrtnhL+oz/mlAjnkzPlBC/TNjdabpvhGSfe6PzPNs=;
        b=T8nEKX0Ba8GNv7TYs6LaAXQrGvtQcTEmdhEt9fqgAFLERdMFBFsouWGyZEBPCXELqa
         cXvYWwPL4GhplAqmYZJwjhGLp2/0/ZltgI1xUJiBblwO0smcWfnijtXsIn4W/Jt5JAtV
         ZLrDyGMLvR4usaNXN0xai3x8A2u8OMv1XPudo04mkTBwWHmo8qrD7V8wEg89xstbIQQE
         q4YXl5q0IcX9eFzldYRnYDSDh2jQ22peAt3igpknnqO+YNJTEKcpjhjjQDq10eis8aDq
         3UqES5eC73qSkiVMSRPKE7je475jV9+YsGyUTDxTlq/34QeDGx5rPXT0eNNd2jZzdHbx
         mdCA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791660209; x=1792265009; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y9a+TyL1ZUr2gWay3ENBMoj2LAgkfvRENCAy64d5+8I=;
        b=ecalV01X8g8e6pdwsZ+NsdZ+/z4w3dp8C4aXMKX2TNbm6y33naMr3+X7yFrVue1PKv
         OEzpORI57DdLctgv7RCyn0xMOGMZNpt0luUfwzq+2A3KisFd8dAe3t0L91vaoWVbOOru
         c6WjfZ7xIpR+VwSMfhcAKfVgqCYu6Me3xHRjGVQSS59ojTay+rgm0fzhWDOxcuoLdc2u
         0LzoFP4gkuXcO1Sm1DEc9OqNIjJVRUmSk6Qa31tmXEBN3OVWWG1kKpGC/T01nPCX5ZS7
         8fIiYeW1axfBqfaMgQX/fLgBjvKEJbxG4CmqeRk3+TjE6X9nFVXdeuQUpplUZwSefmy8
         /eWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791660209; x=1792265009;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=y9a+TyL1ZUr2gWay3ENBMoj2LAgkfvRENCAy64d5+8I=;
        b=prBuIeVb9/LL090MSZ0q7LsCI91DlXxJc00B9N4GG8LqUBn3N43sptuNH3hrcQQPDT
         7zKRd7VyOJ9Oe1cdgBRIvW0CRQRPfnRVyA676cr9yuglZd3rLbeTBQEWHihcRB3mRWKr
         mKQmwRJf5/GWS5q0KmEbRZcR1EBQHySXnZHQILF6UnzIepXBEh0cTNxLfBcoyFvwmDA2
         X06mg88tAKge95xbExyDNnx8LRec/32t931zcgygPJaNFBrPV2dpY0R8BnJOHDdlDCum
         FR28BKosgOUz1Emxuer5e+NAv4GUjB7Uny4B5NlmZWeWMy2EQgj8+GXkGRODx9QvhlWk
         8MyQ==
X-Forwarded-Encrypted: i=1; AKwUvBwLDnMwBmdDb3a4t83IqVYTtLs3sf231dtn94Tqn3Ur1K1NdQI+6AezQzmM+wA81Sigc4pwhjCVkBnIcEA=@vger.kernel.org
X-Gm-Message-State: AFq9FYK9/9oAqGtsH5JpsLcUscRyGwqu1sxUwCSXSnjvgyTF0+hI2R8U
	7vMPBE7M+7JaegDDPEA71WrWTaXlj0hn4iCmwtJi96ugLuWXykprE0aJ3JZWxO79ruxXDkbMmOn
	455XaDiMXp4aB9A4k6h88ztFzjRtk+7h5q6DFnpR6PA==
X-Gm-Gg: AYBFou23GjMzozgAsG7V0CbRfBILBEMd4MS5/pGZcr1b1usuig693+O1SbYPO0mnM+6
	IowKBZJ3dZN8jg775mopnTAL5TUDO2mYRQFmbflaBL1QR0PAkFdrXen1qnddbgjJOPRcN3kpVnx
	O5uCNV9b5knGTI1tl5q4/RH0PIjuqJH/P20B9Lpp0NpbZhDwZrHbvdPfPLYZCHQ+3Wcz7M8a8Sx
	7yWpXchO60lQW5xVlpVjznKX6KnhsDvX/id/kk4PxXTNOS0cBKtlHRYUE0d/KX0PIfTNuAFqBQx
	tB+OoF/BUIv0+I7fCT1O/L0bSW3Za2t9oYfDrezQiJA5iGo+wKrdLU8Qll7sbQdn19qF0mdKQ8j
	o6g5BwX0X5fiuOZpO7yY1TVoIVwzt9qdxf4b71Nkp//I=
X-Received: by 2002:a05:622a:447:b0:535:8559:f0f5 with SMTP id
 d75a77b69052e-5359facb683mr91855031cf.12.1791660208737; Sat, 10 Oct 2026
 12:23:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Sat, 10 Oct 2026 21:23:16 +0200
X-Gm-Features: AclHuK8j-BoreS8uhuzdDAlfJEdFk7nCvMvRxLKTOgifniCXrJep_EfcUlgLcyc
Message-ID: <CAPM=9ty-Gh9_5sqdFzz6gVvvVjQ4erOSEg_bm8S9a5O4Seu7Nw@mail.gmail.com>
Subject: [git pull] drm fixes for 7.3-rc7
To: Linus Torvalds <torvalds@linux-foundation.org>, Sima Vetter <sima@ffwll.ch>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Linus,

Live from Dublin Airport, it's Saturday Night drm fixes. This week has
the missing misc fixes from last week which I tracked down and seemed
to be a race/bug in my lei setup somehow, once I asked lei to ignore
it's cache I got the missing email. But there are more misc fixes this
week and amd and intel ones.

The main ones in this are amdgpu and xe, with vc4, vmwgfx, nouveau and
imagination in the middle, with a bunch of small single fixes.

Bit busier than I'd like, but the missing misc might explain it,
anyways time for me to fly home.

Dave.

drm-fixes-2026-10-11:
drm fixes for 7.3-rc7

fb:
- defer setup when fbdev_probe() fails, not just on -EAGAIN

bridge:
- Fix unlocked list_del in drm_bridge_add()
- Fix unlocked list access in drm_bridge_attach()
- th1520-dw-hdmi: Fix error check on dw_hdmi_probe() return value
- th1520-dw-hdmi: Fix remove() callback

aspeed:
- Balance the display clock enable on teardown

i915:
- Fix a GT park race that could trigger spurious RPM wakelock warnings
- Fix execbuffer relocation cleanup to avoid out-of-bounds free

xe:
- i2c removal
- system Controller Maibox header handling
- two bo pin/unpin accounting bugs
- not emitting a w/a twice
- xe_mmio_wait32() to honor delay/sleep maximums

amdgpu:
- Fix direct scanout alpha on some DRM_FORMATs
- UserQ fixes
- Fix tearing flips with PSR
- GPU reset vblank fix
- Debugfs register interface fix
- Fix display mode patching
- Expand Mac reserved memory workaround

amdkfd:
- SDMA doorbell fix
- Fix dma-buf reference leak in error path

imagination:
- fix reference and vm_bo handling in remap()
- size page table preallocation by device address

gud:
- don't keep a connector without a CRTC as connector_state

panthor:
- validate userspace queue count against initialized firmware slot count

nouveau:
- fix null ptr regression
- skip turing CE workaround for non-GR

vmwgfx:
- validate pitch value
- add blend mode property

vc4:
- drain hangcheck timer on unbind
- free BO cache on teardown
- use kvmalloc_objs for bo cache size list
- disable V3D interrupt across runtime suspend
- fix binner slot allocation
- fix fw refcount leak
The following changes since commit a90ee4305c4a5df72c11b31dacfdc76e00fcf78a=
:

  Linux 7.3-rc6 (2026-10-04 13:45:25 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2026-10-11

for you to fetch changes up to c61e23ed14359e6289c08e55940dd3401fe27db0:

  Merge tag 'drm-misc-fixes-2026-10-09' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes
(2026-10-11 04:58:03 +1000)

----------------------------------------------------------------
drm fixes for 7.3-rc7

fb:
- defer setup when fbdev_probe() fails, not just on -EAGAIN

bridge:
- Fix unlocked list_del in drm_bridge_add()
- Fix unlocked list access in drm_bridge_attach()
- th1520-dw-hdmi: Fix error check on dw_hdmi_probe() return value
- th1520-dw-hdmi: Fix remove() callback

aspeed:
- Balance the display clock enable on teardown

i915:
- Fix a GT park race that could trigger spurious RPM wakelock warnings
- Fix execbuffer relocation cleanup to avoid out-of-bounds free

xe:
- i2c removal
- system Controller Maibox header handling
- two bo pin/unpin accounting bugs
- not emitting a w/a twice
- xe_mmio_wait32() to honor delay/sleep maximums

amdgpu:
- Fix direct scanout alpha on some DRM_FORMATs
- UserQ fixes
- Fix tearing flips with PSR
- GPU reset vblank fix
- Debugfs register interface fix
- Fix display mode patching
- Expand Mac reserved memory workaround

amdkfd:
- SDMA doorbell fix
- Fix dma-buf reference leak in error path

imagination:
- fix reference and vm_bo handling in remap()
- size page table preallocation by device address

gud:
- don't keep a connector without a CRTC as connector_state

panthor:
- validate userspace queue count against initialized firmware slot count

nouveau:
- fix null ptr regression
- skip turing CE workaround for non-GR

vmwgfx:
- validate pitch value
- add blend mode property

vc4:
- drain hangcheck timer on unbind
- free BO cache on teardown
- use kvmalloc_objs for bo cache size list
- disable V3D interrupt across runtime suspend
- fix binner slot allocation
- fix fw refcount leak

----------------------------------------------------------------
Adrian Betschart (1):
      drm/amd/display: Don't replace a sink mode that shares the native tot=
als

Alan Previn (1):
      drm/xe/mmio: Fix xe_mmio_wait32() to honor delay/sleep maximums

Alex Deucher (1):
      drm/amdgpu: make Mac FB workaround generic

Cristian Ciocaltea (2):
      drm/bridge: Fix unlocked list_del in drm_bridge_add()
      drm/bridge: Fix unlocked list access in drm_bridge_attach()

Dave Airlie (6):
      nouveau: check gsp->rm as well as gsp pointer before gcx ready
      Merge tag 'drm-misc-fixes-2026-10-01' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes
      Merge tag 'drm-intel-fixes-2026-10-08' of
https://gitlab.freedesktop.org/drm/i915/kernel into drm-fixes
      Merge tag 'drm-xe-fixes-2026-10-08' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes
      Merge tag 'amd-drm-fixes-7.3-2026-10-08' of
https://gitlab.freedesktop.org/drm/amdgpu/kernel into drm-fixes
      Merge tag 'drm-misc-fixes-2026-10-09' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes

Fan Wu (2):
      drm/vc4: drain the hangcheck timer and works on V3D unbind
      drm/xe/i2c: cancel the client work on remove

Felix Gu (2):
      drm/bridge: th1520-dw-hdmi: Fix error check on dw_hdmi_probe()
return value
      drm/bridge: th1520-dw-hdmi: Fix remove() callback

Gyeyoung Baek (2):
      drm/imagination: Fix reference and vm_bo handling in remap()
      drm/imagination: Size page table preallocation by device address

Haojie Li (1):
      drm/amdkfd: fix dma_buf reference leak in get_dmabuf_info

Ian Forbes (1):
      drm/vmwgfx: Add blend mode property

Jesse Zhang (2):
      drm/amdgpu/userq: only accept doorbell BOs as queue doorbell
      drm/amdgpu/userq: return the memdup_user() error for the user MQD

Krzysztof Karas (2):
      drm/i915/gem: Prevent overstepping exec array boundary
      drm/i915/gt: Unmask interrupts only when ACTIVE is true

Leo Li (2):
      drm/amd/display: Fix direct scanout alpha on some DRM_FORMATs
      drm/amd/display: disable self-refresh on tearing flips

Mallesh Koujalagi (1):
      drm/xe/sysctrl: Fix mailbox header handling

Mary Guillemard (1):
      drm/nouveau: Skip the Turing CE workaround object for non-GR channels

Ma=C3=ADra Canal (4):
      drm/vc4: Free the BO cache size list on teardown
      drm/vc4: Use kvmalloc_objs() for the BO cache size list
      drm/vc4: Disable the V3D interrupt across runtime suspend
      drm/vc4: Fix binner slot allocation failing on an idle GPU

Mikhail Gavrilov (1):
      drm/amdgpu: copy debugfs register data outside the GRBM/SRBM locks

Myeonghun Pak (1):
      drm/aspeed: Balance the display clock enable on teardown

Nguyen Ngoc Thang (1):
      drm/fb-helper: defer setup when fbdev_probe() fails, not just on -EAG=
AIN

Oleg Keri (1):
      drm/dp: don't mark the AUX backlight enabled when enabling failed

Osama Abdelkader (1):
      drm/panthor: validate userspace queue count against initialized
firmware slot count

Sajal Gupta (1):
      drm/gud: don't keep a connector without a CRTC as connector_state

Saleel Kudchadker (1):
      drm/amdkfd: align SDMA doorbell base for shader doorbell writes

Thomas Hellstr=C3=B6m (2):
      drm/xe: Fix shrinker accounting double-subtraction on nested external=
 pins
      drm/xe: Fix stale pinned_link entry when fb-pin performs the final un=
pin

Tvrtko Ursulin (1):
      drm/xe: Do not emit Wa_16010904313 twice

Vitaly Prosyak (1):
      drm/amdgpu: serialize vblank counter reads against GPU reset

Wentao Liang (1):
      drm/vc4: Fix firmware reference leak in vc4_drm_bind()

Zack Rusin (1):
      drm/vmwgfx: validate pitch coming from userspace

 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c         |   8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c        |  77 +++++++-----
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c            |  17 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c            |   5 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c          |  13 +-
 drivers/gpu/drm/amd/amdgpu/mes_userqueue.c         |   9 +-
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.c  |  32 ++++-
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h              |   7 ++
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  19 +++
 .../amd/display/amdgpu_dm/amdgpu_dm_connector.c    |   7 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c    |  20 +--
 .../amdgpu_dm/tests/amdgpu_dm_connector_test.c     |  42 +++++++
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c            |   5 +-
 drivers/gpu/drm/bridge/th1520-dw-hdmi.c            |   8 +-
 drivers/gpu/drm/display/drm_dp_helper.c            |   4 +-
 drivers/gpu/drm/drm_bridge.c                       |   8 +-
 drivers/gpu/drm/drm_fb_helper.c                    |   6 +-
 drivers/gpu/drm/gud/gud_pipe.c                     |   1 +
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c     |   2 +-
 drivers/gpu/drm/i915/gt/intel_rps.c                |   3 +-
 drivers/gpu/drm/imagination/pvr_mmu.c              |  25 ++--
 drivers/gpu/drm/imagination/pvr_vm.c               |   8 +-
 drivers/gpu/drm/nouveau/nouveau_abi16.c            |   2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/device/user.c  |   2 +-
 drivers/gpu/drm/panthor/panthor_sched.c            |   3 +
 drivers/gpu/drm/vc4/vc4_bo.c                       |   5 +-
 drivers/gpu/drm/vc4/vc4_drv.c                      |   5 +-
 drivers/gpu/drm/vc4/vc4_drv.h                      |   2 +-
 drivers/gpu/drm/vc4/vc4_gem.c                      |   8 +-
 drivers/gpu/drm/vc4/vc4_irq.c                      |  24 ++--
 drivers/gpu/drm/vc4/vc4_v3d.c                      |  65 +++++-----
 drivers/gpu/drm/vc4/vc4_validate.c                 |   2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_cursor_plane.c       |  26 +++-
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c                |   8 ++
 drivers/gpu/drm/xe/display/xe_fb_pin.c             |   6 +-
 drivers/gpu/drm/xe/xe_bo.c                         | 139 ++++++++++++++++-=
----
 drivers/gpu/drm/xe/xe_bo.h                         |   2 +
 drivers/gpu/drm/xe/xe_i2c.c                        |   5 +-
 drivers/gpu/drm/xe/xe_lrc.c                        |  38 ++++--
 drivers/gpu/drm/xe/xe_mmio.c                       |   5 +-
 drivers/gpu/drm/xe/xe_sysctrl_mailbox.c            |  16 +--
 41 files changed, 461 insertions(+), 228 deletions(-)
