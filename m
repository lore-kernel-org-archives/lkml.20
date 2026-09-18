Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3380D358368
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 22:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789769820; cv=pass; b=DyqTISmPCGNADqDQGDPHQRUYsVtSFCl+w3aORCWYsjPjHik2LoafYhXw6LdOD01o+tuJPCBbEa8UyNRXHkQCkCnIjOwYujHTx5eMWo5N31Hs9Z0rGU6TphjzhapAeDORP14ITkRaRhTwlf/6Vp2ddlcq5+Cqh++Q9/gX/7HMqFE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789769820; c=relaxed/simple;
	bh=5+p58jA5MUmxxzxr5muR+9QypLZLJyxkNZvFzvTiyfA=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=CE6s3AcqZ1I5OAyZOii3bdxIrYIw9ZIDU9H7bScu02asl8S6GYlRuiLmOmlgLU1LkLnL2t4lwUG1d9EXMuYt+tGAmQFb1Q4g9JfZJ4TTikHR/Cf/zSZ73UXCldyaefDuewb76h7rjslvGK9NAhO/5yaun0ERgIRwrrVONLwQE5g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GCic9+wi; arc=pass smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GCic9+wi"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-90cdfc6db0aso11272836d6.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 15:16:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789769817; cv=none;
        d=google.com; s=arc-20260327;
        b=GvKlRbBWrROor9gPi4r99u1acbE7r7L6t7gkDF35QOHAnywlUYmZ5EBp3cLiyG2AKD
         1REPYEVs6XYPwpxJJsn4xc9yRfDPuWNkKUV4Vf2cDtn67cW8IXeLcdAuJ1dDzqDZo57C
         Hvp6ucp5icvwtutmzF4gV0tKPOuF0rAfuMpPZ/rUmiiZyrGrl2nVK205CY7DJU/mqtR9
         Ii47zm/NJ2llAMGYyUbqxiW36I68Hg2Kwl5qUHXTpzL91WgkOZcCkRg/CQQ/8vii7mky
         d+Es/hVolenYtURNSfeiq19muScx3Xf6zsPpftouVv7hkUILOdCU+30zd3IgdmqYfnBq
         TWaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=sWCosvsfQVPpNuncKfHYQ+E+ccnFp32L3Fcq+t9mQJQ=;
        fh=qzGDgkLZTrhciSheYHXOOt/DTtukvqE2PH2KwGHJu+c=;
        b=rvQ9phIkBKyW3peI40VjWatOZ8sUDA3QkXoEzdMA/EGk1RmY0BHPV9LJ/hiIPMTpVF
         aumtobVFFVJgYKVpkVEtRa3BuNay0W87fWqspYAwKFLffieZZ9uT9VRL8HyBiVnciqxZ
         2JMW2H22xRb5eIcyMQE/mv4tc/zC5ICQvq2gqSeHV4LCQF6ASYNAkCrvHlzqV5N+IrC3
         kN+Gv1tnEpsNvFfVPkZe14TmjpuWG6J8mPVKuRke6uUgszbGlAdm+cm9GiJbmKkj0bSY
         xmK4Y6ZnPgnTWr05x83LAyxvPoFeIN9UwbTYVxKSssTYMS2fkJoXGhT2pmT39ZozlS5c
         tMsw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789769817; x=1790374617; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sWCosvsfQVPpNuncKfHYQ+E+ccnFp32L3Fcq+t9mQJQ=;
        b=GCic9+wil6rvhhonxJRZUG/r/iZA34Pyzn2xKHt+qFReDWltMZGr78FMvAV8QrrS3k
         HEEyONzUDCO0UqhrxCXRW+a7eu6dE61ypebm6MgDIteNLrOV2LYKkQslOmtshO8Ndzci
         6QRsaSziExIC6aUzqvciBzFAglqNwvI7cZVkweCmONNbBcZ6E0wWinE3f04jkP103bOn
         Vf1BgceDI15uDLnHJP6dj5oJ18FtYf9/guEFM39HpR4hhsxHju6RA4S787912rkwGsc7
         xbKbmgMfU0wMp+qAu2BWoArEKFVesge6G1LHduDJ0qEgDwkFHrFOojU7zlW/PWxFW7z9
         hIOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789769817; x=1790374617;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sWCosvsfQVPpNuncKfHYQ+E+ccnFp32L3Fcq+t9mQJQ=;
        b=mrDyUM+gsGY1c1banOJUtK9xTO5+7mwkJBu7XDLpcSNrHfm/8dFp6KXFpGiypHqY2b
         iOBoVqrMqq4JfsVzFL1jYsbckd9TZh+5D89lLY3xMlx2Ao0gIGAquKgqsFWCJSDS3Kqa
         gHrkK6FbOp90vxyuEyb5cITdt5MLmY07hJ+/Imdv813/iJM/K4xdffP/UQ9TB+IVQr8U
         GnSc2P+H0EFJxS3rMQXymDaTvXzCCpnToxJjtxwfOeGncEkLN8m6gkwD2tfirF8NVqFa
         tcf+x+ql1uvapgC1TzukqHTCwjpDTPELT/6gK8dcpJY3oHIA7JB/AkohzjHpmocRyrfr
         gTdA==
X-Forwarded-Encrypted: i=1; AKwUvBxHJ5lJb1vzTo4C+wVlkwGIBJw6qOFHFkpBlPBO3fALyUY2ggCg88Mtemmy0BpRBjMn55dSLHBNAsZ84uk=@vger.kernel.org
X-Gm-Message-State: AFuF++mB9OZh/3xmecneIBrCdSt8VDe6Lz17OJLd/Jo5JY8zyZv+Am4t
	mmA2AsHIPYhbBRF9U2ob6KIhlc9lZ8pK2Rs29O/KLHn236EtOqKLxVu2/UlYACcNdsV5qLncIuK
	zKUtfXfeu/vv61P5bscaq33m4rrFIWhropf6fW0E=
X-Gm-Gg: AYBFou2DR0mxVVzewawn9cq/enSHD05YMsBgNrvRT4zTeKS4vTeRMOU+oiyXmTPJsz3
	WsxbUMR1li/Rs0awyVUgZJ+EYKxCzdJKa6C8LrsAfkf+TyEANcYublHql0p6wOM+ddAx1Tqo7jM
	0Bb30WmxeIKTNHZb5D/Ao7Qi2hwoIu6IZzcRDGR8xx5NUgjMxA40dur8ttR5p4baiLh8Fcb1rfz
	PRHynnA7ZDBEuSzCdjxGNVTsVo0YDxBTkIrsm4Lt7tOAmoV+YfuiLCcGB/NndHYxRqRuIcL44+e
	hfZAMg864w4rNInZ9EF7hXUpPxlO5xPUmrwzg/JV2N4a4ku6hVXeDq0MN2FbJglYN3uHmTqLppO
	E3wyUwpVmQ8/LOt7CGE4dEKOZTMDIVhVmggXwyBwU
X-Received: by 2002:a05:620a:4388:b0:923:7821:dc0d with SMTP id
 af79cd13be357-93bdc747a3bmr583683685a.33.1789769816709; Fri, 18 Sep 2026
 15:16:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Sat, 19 Sep 2026 08:16:44 +1000
X-Gm-Features: AcwNN1UVFisS_x0KZXKDT3c7LqfISw1kqPwrM02TnH0wpePoF_XKSKCL6TAX4yQ
Message-ID: <CAPM=9tyHWoVvi75xn2duuoMm=MMux5fmBSx=UjbNkPAvbZZ3Nw@mail.gmail.com>
Subject: [git pull] drm fixes for 7.3-rc4
To: Linus Torvalds <torvalds@linux-foundation.org>, Sima Vetter <sima@ffwll.ch>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Linus,

Things have picked back up a bit this week, mostly amdgpu, xe and msm
this time. There are a bunch of scattered changes across the rest of
drivers and core stuff, nouveau, i915.

In the signed tag I forgot to add the versilicon and longsoon entries,
but they are in the email below.

Regards,
Dave.

drm-fixes-2026-09-19:
drm fixes for 7.3-rc4

core:
- fix vblank pending event leak

ttm:
- swapout fixes

dma-buf:
- scattergather fixes
- enable dma-buf debug on debug kernels

dma-fence:
- fix signaling bit checks

sched:
- fix virtual runtime race

msm:
- DT:
  - Corrected indentation
- Core:
  - Marked fbdev as system memory
- GPU:
  - Fixed autosuspend cleanup on teardown
  - a750: fix timestamps
  - Increase GMU fw init timeout
  - Misc fixes/cleanups
- DPU:
  - Fixed clock rounding, unbreaking newest platforms
  - Cleared pending flush state
- DP:
  - Skip PUSH_IDLE when link was never enabled
  - Fixed bandwidth checks
- HDMI:
  - Fixed runtime PM cleanup on probe failure

xe:
- shrinker related fixes
- xe_mmio_gem fault handler and destroy fixes
- xe disable i2c irq on unbind

i915:
- Revert a commit touching registers that don't necessarily exist
- Check for negative numbers before passing to BIT()

amdgpu:
- SMU 14.x fix
- DC IRQ fix
- Runtime PM fix for P2P
- RAS fix
- PCIe reporting fix
- DCN 6 fix
- Device removal fix
- DC MALL fix

amdkfd:
- GC 12.x fixes
- Boundary checks
- Mapping clear fix

nouveau:
- suspend/resume fixes

gud:
- out of bounds access fix
- ignore damage clips in full update

vc4:
- use-after-free fix

versilicon:
- plane format fix

longsoon:
- blend mode property fix
The following changes since commit fd73f4a6659897191fa0d40695fe370925dd3780=
:

  Linux 7.3-rc3 (2026-09-13 14:38:02 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2026-09-19

for you to fetch changes up to 71f370e9ee1bdfe1f916547089d93b5265a918e7:

  Merge tag 'drm-misc-fixes-2026-09-17' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes
(2026-09-19 06:49:36 +1000)

----------------------------------------------------------------
drm fixes for 7.3-rc4

core:
- fix vblank pending event leak

ttm:
- swapout fixes

dma-buf:
- scattergather fixes
- enable dma-buf debug on debug kernels

dma-fence:
- fix signaling bit checks

sched:
- fix virtual runtime race

msm:
- DT:
  - Corrected indentation
- Core:
  - Marked fbdev as system memory
- GPU:
  - Fixed autosuspend cleanup on teardown
  - a750: fix timestamps
  - Increase GMU fw init timeout
  - Misc fixes/cleanups
- DPU:
  - Fixed clock rounding, unbreaking newest platforms
  - Cleared pending flush state
- DP:
  - Skip PUSH_IDLE when link was never enabled
  - Fixed bandwidth checks
- HDMI:
  - Fixed runtime PM cleanup on probe failure

xe:
- shrinker related fixes
- xe_mmio_gem fault handler and destroy fixes
- xe disable i2c irq on unbind

i915:
- Revert a commit touching registers that don't necessarily exist
- Check for negative numbers before passing to BIT()

amdgpu:
- SMU 14.x fix
- DC IRQ fix
- Runtime PM fix for P2P
- RAS fix
- PCIe reporting fix
- DCN 6 fix
- Device removal fix
- DC MALL fix

amdkfd:
- GC 12.x fixes
- Boundary checks
- Mapping clear fix

nouveau:
- suspend/resume fixes

gud:
- out of bounds access fix
- ignore damage clips in full update

vc4:
- use-after-free fix

----------------------------------------------------------------
Chengjun Yao (1):
      drm/amdgpu: fix rmmio iounmap skipped on device removal

Christian K=C3=B6nig (1):
      dma-buf/dma-fence: fix checking signaling bit for timeline and
driver name v3

Dave Airlie (5):
      Merge tag 'drm-msm-fixes-2026-09-16' of
https://gitlab.freedesktop.org/drm/msm into drm-fixes
      Merge tag 'drm-xe-fixes-2026-09-17' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes
      Merge tag 'drm-intel-fixes-2026-09-17' of
https://gitlab.freedesktop.org/drm/i915/kernel into drm-fixes
      Merge tag 'amd-drm-fixes-7.3-2026-09-17' of
https://gitlab.freedesktop.org/drm/amdgpu/kernel into drm-fixes
      Merge tag 'drm-misc-fixes-2026-09-17' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes

David Francis (2):
      drm/amdkfd: Avoid integer underflow with ffs in EOP ring size calc
      drm/amdkfd: Avoid integer underflow in EOP ring size calculation.

David Hu (2):
      dma-buf: Fix silent overflow for phys vec to sgt
      dma-buf: Split sgl by largest page-aligned chunk

Dmitriy Chumachenko (1):
      drm/amdgpu: check ras and obj before dereference

Dmitry Baryshkov (2):
      drm/msm: mark the fbdev framebuffer as system memory
      drm/msm/dsi: round the byte clock rate after reparenting to the PHY P=
LL

Francis Marlou Pacaro (1):
      drm/amd/display: fix MALL hysteresis timer underflow at high refresh =
rates

George Emmanuel Thomas (1):
      drm/msm: remove stale perf counter XML TODO

Guangshuo Li (2):
      drm/msm/adreno: fix autosuspend cleanup during teardown
      drm/msm/hdmi_phy: fix runtime PM cleanup on probe failure

Huacai Chen (1):
      drm/loongson: Create blend mode property for cursor plane

Icenowy Zheng (3):
      drm/verisilicon: set blend mode for the cursor plane
      drm/verisilicon: add primary modifier for format tables
      drm/verisilicon: remove ARGB formats from primary plane

Ilia Levi (5):
      drm/xe/mmio_gem: forbid VMA split
      drm/xe/mmio_gem: use write-back mapping for dummy page
      drm/xe/mmio_gem: simplify fault handler loop
      drm/xe/mmio_gem: cache the dummy page per object
      drm/xe/mmio_gem: fix destroy flow

Jesse Casco (1):
      drm/msm/dp: skip PUSH_IDLE when the link was never enabled

Jonghyuk Kim(MalHyuk) (1):
      drm/msm: RCU-free the scheduler-containing ring and VM objects

Karl Mehltretter (4):
      drm/msm: Fix the separate_gpu_kms parameter description
      drm/msm/adreno: Fix the skip_gpu parameter description
      dma-buf: Make DMABUF_DEBUG default to y on DEBUG_KERNEL kernels
      drm/vc4: Use managed KMS polling to fix UAF on unbind

Kevin Wang (1):
      drm/amd/pm: report energy accumulator for smu 14.0.3

Krzysztof Kozlowski (1):
      dt-bindings: display/msm: Use consistent indentation in the example

Leo Li (1):
      drm/amd/display: Atomize IRQ register read/modify/write ops

Luca Coelho (1):
      drm/i915/display: check configuration index before shifting

Lyude Paul (4):
      Revert "nouveau/gsp: fix suspend/resume regression on r570 firmware"
      drm/nouveau/gsp/r570: Set GcOff =3D 0 in fbsr
      drm/nouveau/gsp/r570: Enable S/R Display workaround in GSP
      drm/nouveau/gsp: Increase delay for magic sleep in r535_gsp_fini()

Mario Limonciello (2):
      drm/amdgpu: Fix GPU PCIe link capability reporting
      drm/amdgpu: Skip KFD mapping clear before initialization

Maxime Ripard (1):
      Merge fdo/drm/drm-fixes into drm-misc-fixes

Mike Lothian (1):
      drm/amdgpu: hold a runtime PM reference for P2P dma-buf attachments

Neil Armstrong (2):
      drm/msm/a6xx: Add CX AO Counter registers used for a750 GPUs
      drm/msm/a6xx: Use CX AO Counter register for timestamp on a750 GPUs

Nemesa Garg (1):
      Revert "drm/i915/display: Clear SEL_FETCH_PLANE_CTL on plane disable"

Paul Hollinsky (1):
      drm/msm/adreno: Only check for PAS when a zap shader is present

Raag Jadav (1):
      drm/xe/i2c: Disable IRQ on unbind

Rob Clark (2):
      drm/ci: Update xfails for kms_cursor_legacy regression
      drm/msm/a6xx+: Increase GMU FW init timeout

Saim Shujah (1):
      drm/msm/dpu: clear pending peripheral flush state

Sajal Gupta (1):
      drm/gud: fix out-of-bounds write in gud_plane_atomic_check()

Shuicheng Lin (3):
      drm/xe/mmio_gem: Revoke drm_vma_node on xe_mmio_gem destroy
      drm/xe/shrinker: Return the freed page count through a parameter
      drm/xe/shrinker: Take a runtime PM ref before shrinking non-system me=
mory

Sophie D (1):
      drm/gud: Ignore damage clips in full update mode

Srinivasan Shanmugam (1):
      drm/amd/display: Fix NULL dereference in dcn50/dcn60 init_hw

Thadeu Lima de Souza Cascardo (1):
      drm: Fix drm_pending_vblank_event leak in error path for out_fence_pt=
r

Tvrtko Ursulin (1):
      drm/sched: Fix virtual runtime race

Vadim Nikitushkin (2):
      drm/ttm: fix swapped-out resources never leaving their bulk_move rang=
e
      drm/ttm: apply the swapout bulk_move fix to the intended condition

Vladimir Marioukhine (1):
      drm/amdkfd: implement restore_mqd callbacks for GFX12/12.1

William Bright (1):
      drm/msm/dp: fix link bandwidth check when wide bus is enabled

 .../bindings/display/msm/qcom,qcs8300-mdss.yaml    |   6 +-
 .../bindings/display/msm/qcom,sar2130p-mdss.yaml   |   4 +-
 .../bindings/display/msm/qcom,sm6150-dpu.yaml      |  14 +--
 .../bindings/display/msm/qcom,sm8350-mdss.yaml     |   2 +-
 .../bindings/display/msm/qcom,x1e80100-mdss.yaml   |  60 +++++-----
 drivers/dma-buf/Kconfig                            |   2 +-
 drivers/dma-buf/dma-buf-mapping.c                  |  31 ++++--
 drivers/dma-buf/dma-fence.c                        |  14 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |   3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c         |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  54 ++++-----
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c        |  43 ++++++-
 drivers/gpu/drm/amd/amdgpu/nbio_v7_9.c             |   2 +-
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.c  |   7 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c   |   2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v11.c   |   2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v12.c   |  61 +++++++++-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v12_1.c |  70 +++++++++++-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c    |   6 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_vi.c    |   5 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |   4 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |  12 ++
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c |   3 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  |   3 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c  |  64 ++++++-----
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.h  |  28 +++++
 .../display/amdgpu_dm/tests/amdgpu_dm_crtc_test.c  |  16 ++-
 .../amdgpu_dm/tests/amdgpu_dm_helpers_test.c       |   8 +-
 .../display/amdgpu_dm/tests/amdgpu_dm_irq_test.c   |  34 +++---
 .../drm/amd/display/dc/hwss/dcn30/dcn30_hwseq.c    |  13 ++-
 .../drm/amd/display/dc/hwss/dcn50/dcn50_hwseq.c    |   6 +-
 .../drm/amd/display/dc/hwss/dcn60/dcn60_hwseq.c    |   5 +-
 .../gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.c   |   3 +
 drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt    |   7 ++
 drivers/gpu/drm/drm_atomic_uapi.c                  |  13 ++-
 drivers/gpu/drm/gud/gud_pipe.c                     |   7 +-
 drivers/gpu/drm/i915/display/intel_cursor.c        |  15 +--
 drivers/gpu/drm/i915/display/intel_dp_link_caps.c  |   9 +-
 drivers/gpu/drm/i915/display/skl_universal_plane.c |  15 +--
 drivers/gpu/drm/loongson/lsdc_plane.c              |   5 +-
 drivers/gpu/drm/msm/Makefile                       |   1 -
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c              |   2 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              |  12 +-
 drivers/gpu/drm/msm/adreno/adreno_device.c         |   2 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c            |  15 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c         |   1 +
 drivers/gpu/drm/msm/dp/dp_display.c                |  21 +++-
 drivers/gpu/drm/msm/dsi/dsi_host.c                 |  36 +++---
 drivers/gpu/drm/msm/hdmi/hdmi_phy.c                |   8 +-
 drivers/gpu/drm/msm/msm_drv.c                      |   2 +-
 drivers/gpu/drm/msm/msm_fbdev.c                    |   1 +
 drivers/gpu/drm/msm/msm_gem.h                      |   3 +
 drivers/gpu/drm/msm/msm_gem_vma.c                  |   2 +-
 drivers/gpu/drm/msm/msm_ringbuffer.c               |   2 +-
 drivers/gpu/drm/msm/msm_ringbuffer.h               |   1 +
 drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml  |   2 +
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fbsr.c |   2 +-
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c  |   8 +-
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/fbsr.c |   8 +-
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gsp.c  |   3 +-
 .../drm/nouveau/nvkm/subdev/gsp/rm/r570/nvrm/gsp.h |   8 ++
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h    |   2 +-
 drivers/gpu/drm/scheduler/sched_entity.c           |   8 +-
 drivers/gpu/drm/scheduler/sched_rq.c               |  20 ++--
 drivers/gpu/drm/ttm/ttm_bo.c                       |   2 +-
 drivers/gpu/drm/vc4/vc4_kms.c                      |   2 +-
 drivers/gpu/drm/verisilicon/vs_cursor_plane.c      |   2 +
 drivers/gpu/drm/verisilicon/vs_hwdb.c              |  44 +-------
 drivers/gpu/drm/verisilicon/vs_hwdb.h              |   4 +-
 drivers/gpu/drm/verisilicon/vs_primary_plane.c     |   4 +-
 drivers/gpu/drm/xe/xe_i2c.c                        |   3 +
 drivers/gpu/drm/xe/xe_mmio_gem.c                   | 108 ++++++++++++-----=
-
 drivers/gpu/drm/xe/xe_mmio_gem.h                   |   2 +-
 drivers/gpu/drm/xe/xe_shrinker.c                   | 124 ++++++++++++-----=
----
 include/linux/dma-fence.h                          |   6 +
 75 files changed, 743 insertions(+), 388 deletions(-)
